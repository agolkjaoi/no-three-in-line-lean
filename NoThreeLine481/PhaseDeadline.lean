import NoThreeLine.SchedulePrefixCumulative
import NoThreeLine.MaskedPairBound
import NoThreeLine481.PhaseRefinement

/-! At the refined deadline of a root that is unused in all later phases,
the cumulative field is bounded by the original early-phase field. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open scoped BigOperators

namespace NoThreeLine481
open NoThreeLine PrimitiveLines FiniteDirections FinitePhase

private theorem layer_threshold_mem (base : ℝ) (levels : List ℝ) (l : ThresholdLayer)
    (hl : l ∈ thresholdLayers base levels) : l.threshold ∈ levels := by
  induction levels generalizing base with
  | nil => simp [thresholdLayers] at hl
  | cons w ws ih =>
    rcases List.mem_cons.mp hl with h | h
    · simp [h]
    · exact List.mem_cons_of_mem w (ih w h)

private theorem unused_refined_mask {α : Type*} (late : List (ExposurePhase α)) (p : α)
    (hlate : ∀ f ∈ late, f.weight p = 0) (g : BinaryPhase α) (hg : g ∈ refinePhases late) :
    g.mask p = 0 := by
  obtain ⟨f, hf, h⟩ := List.mem_flatMap.mp hg
  obtain ⟨l, hl, rfl⟩ := List.mem_map.mp h
  have hpos := (List.pairwise_cons.mp f.ordered).1 l.threshold (layer_threshold_mem _ _ _ hl)
  simp [layerMask, hlate f hf, not_le.mpr hpos]

private theorem refinePhases_append {α : Type*} (early late : List (ExposurePhase α)) :
    refinePhases (early ++ late) = refinePhases early ++ refinePhases late := by
  simp [refinePhases]

private theorem get_of_append_left {α : Type*} {xs ys zs : List α} (h : zs = xs ++ ys)
    (hk : xs.length ≤ zs.length) (j : Fin xs.length) :
    zs.get (j.castLE hk) = xs.get j := by
  subst zs
  simp only [List.get_eq_getElem, Fin.val_castLE, List.getElem_append_left j.isLt]

private theorem get_mem_of_append_right {α : Type*} {xs ys zs : List α}
    (h : zs = xs ++ ys) (j : Fin zs.length) (hj : xs.length ≤ j.val) : zs.get j ∈ ys := by
  subst zs
  rw [List.get_eq_getElem, List.getElem_append_right hj]
  exact List.getElem_mem _

private theorem cumulative_time_mono {J : ℕ} (s : Schedule J) (c : Fin J → ℝ)
    (hc : ∀ j, 0 ≤ c j) {a b : ℝ} (ha : 0 ≤ a) (hab : a ≤ b) :
    s.cumulative c a ≤ s.cumulative c b := by
  unfold Schedule.cumulative
  rw [cumulative_eq_sum _ _ _ _ _ ha, cumulative_eq_sum _ _ _ _ _ (ha.trans hab)]
  apply Finset.sum_le_sum
  intro j _
  apply mul_le_mul_of_nonneg_right _ (hc j)
  unfold elapsed
  exact max_le_max le_rfl (sub_le_sub_right (min_le_min hab le_rfl) _)

theorem refined_deadline_cumulative_le {α : Type*} (early late : List (ExposurePhase α))
    (p q : α) (hlate : ∀ f ∈ late, f.weight p = 0) :
    let s := refinedSchedule (early ++ late)
    let mask := refinedScheduleMask (early ++ late)
    s.cumulative (fun j => mask j q) (s.deadline (fun j => mask j p)) ≤
      (early.map (fun f => f.weight q)).sum := by
  intro s mask
  let k := (refinePhases early).length
  have he := refinePhases_append early late
  have hk : k ≤ (refinePhases (early ++ late)).length := by
    rw [he, List.length_append]
    exact Nat.le_add_right _ _
  let t := (s.prefix k hk).total
  have hdeadline : s.deadline (fun j => mask j p) ≤ t := by
    apply Finset.sup'_le
    intro j _
    cases j with
    | none => exact (s.prefix k hk).total_nonneg
    | some j =>
      by_cases hj : j.val < k
      · change (if 0 < mask j p then s.hi j else 0) ≤ t
        split_ifs
        · exact s.increasing.monotone (by change j.val + 1 ≤ k; omega)
        · exact (s.prefix k hk).total_nonneg
      · have hm : mask j p = 0 := unused_refined_mask late p hlate _
          (get_mem_of_append_right he j (le_of_not_gt hj))
        simpa [Schedule.deadlineValue, hm] using (s.prefix k hk).total_nonneg
  have hc (j : Fin (refinePhases (early ++ late)).length) : 0 ≤ mask j q := by
    rcases refinedScheduleMask_binary (early ++ late) j q with h | h <;>
      simp [mask, h]
  apply (cumulative_time_mono s (fun j => mask j q) hc (s.deadline_nonneg _) hdeadline).trans
  change s.cumulative (fun j => mask j q) (s.prefix k hk).total ≤ _
  rw [← s.prefix_cumulative_total, (s.prefix k hk).cumulative_total,
    ← refinedSchedule_cumulative_total early q, (refinedSchedule early).cumulative_total]
  apply le_of_eq
  apply Finset.sum_congr rfl
  intro j _
  have hg := get_of_append_left he hk j
  rw [s.prefix_duration]
  change (refinedSchedule (early ++ late)).duration (j.castLE hk) *
      refinedScheduleMask (early ++ late) (j.castLE hk) q =
    (refinedSchedule early).duration j * refinedScheduleMask early j q
  simp only [refinedSchedule, scheduleOfDurations_duration, refinedScheduleMask, hg]

theorem refined_deadline_pairSum_le {n : ℕ} (early late : List (ExposurePhase (Grid n)))
    (p : Grid n) (hlate : ∀ f ∈ late, f.weight p = 0) :
    let s := refinedSchedule (early ++ late)
    let mask := refinedScheduleMask (early ++ late)
    normalizedPairSum p (fun q => s.cumulative (fun j => mask j q)
      (scheduleProcessDeadline s mask p)) ≤
      normalizedPairSum p (fun q => (early.map (fun f => f.weight q)).sum) := by
  intro s mask
  apply normalizedPairSum_mono
  · intro q
    apply (s.cumulative_bounds _ _ _ (s.deadline_nonneg _)).1
    intro j
    rcases refinedScheduleMask_binary (early ++ late) j q with h | h <;>
      simp [mask, h]
  · exact fun q => refined_deadline_cumulative_le early late p q hlate

#print axioms refined_deadline_cumulative_le
#print axioms refined_deadline_pairSum_le

end NoThreeLine481
