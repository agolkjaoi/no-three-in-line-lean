import NoThreeLine481.PhaseDeadline

/-! A rank assigns each point's whole exposure to a single original phase.
A common list of positive weights gives the same number of binary layers
on every board, allowing empty masks without changing the cumulative fields. -/
set_option autoImplicit false
set_option maxHeartbeats 1700000
noncomputable section
open scoped BigOperators

namespace NoThreeLine481
open NoThreeLine FiniteDirections FinitePhase

def rankedExposurePhase {α : Type*} {J : ℕ} (data : ExposurePhase α)
    (rank : α → Fin J) (j : Fin J) : ExposurePhase α where
  weight q := if j = rank q then data.weight q else 0
  levels := data.levels
  ordered := data.ordered
  covers q := by
    by_cases h : j = rank q
    · simpa only [h, if_true] using data.covers q
    · simp [h]

def rankedExposurePhases {α : Type*} {J : ℕ} (data : ExposurePhase α)
    (rank : α → Fin J) : List (ExposurePhase α) :=
  List.ofFn (rankedExposurePhase data rank)

private theorem thresholdLayers_length (base : ℝ) (levels : List ℝ) :
    (thresholdLayers base levels).length = levels.length := by
  induction levels generalizing base with
  | nil => rfl
  | cons w ws ih => simp [thresholdLayers, ih]

theorem rankedExposurePhases_refined_length {α : Type*} {J : ℕ} (data : ExposurePhase α)
    (rank : α → Fin J) :
    (refinePhases (rankedExposurePhases data rank)).length = J*data.levels.length := by
  simp [refinePhases, rankedExposurePhases, ExposurePhase.refine, rankedExposurePhase,
    thresholdLayers_length, List.sum_ofFn, Finset.sum_const]

theorem rankedExposurePhases_total {α : Type*} {J : ℕ} (data : ExposurePhase α)
    (rank : α → Fin J) :
    (refinedSchedule (rankedExposurePhases data rank)).total = J*data.duration := by
  rw [refinedSchedule_total]
  simp [rankedExposurePhases, ExposurePhase.duration, rankedExposurePhase,
    List.sum_ofFn, Finset.sum_const]

theorem rankedExposure_take {α : Type*} {J : ℕ} (data : ExposurePhase α)
    (rank : α → Fin J) (k : ℕ) (q : α) :
    (((rankedExposurePhases data rank).take k).map (fun f => f.weight q)).sum =
      if (rank q).val < k then data.weight q else 0 := by
  rw [rankedExposurePhases, List.map_take, List.map_ofFn, List.sum_take_ofFn]
  by_cases h : (rank q).val < k
  · rw [if_pos h, Finset.sum_eq_single (rank q)]
    · simp [rankedExposurePhase]
    · intro j _ hj
      simp [rankedExposurePhase, hj]
    · simp [h]
  · rw [if_neg h]
    apply Finset.sum_eq_zero
    intro j hj
    have hneq : j ≠ rank q := by
      rintro rfl
      exact h (Finset.mem_filter.mp hj).2
    simp [rankedExposurePhase, hneq]

theorem rankedExposurePhases_terminal {α : Type*} {J : ℕ} (data : ExposurePhase α)
    (rank : α → Fin J) (q : α) :
    let s := refinedSchedule (rankedExposurePhases data rank)
    s.cumulative (fun j => refinedScheduleMask (rankedExposurePhases data rank) j q) s.total =
      data.weight q := by
  dsimp only
  rw [refinedSchedule_cumulative_total]
  have h := rankedExposure_take data rank J q
  have ht : (rankedExposurePhases data rank).take J = rankedExposurePhases data rank :=
    List.take_of_length_le (by simp [rankedExposurePhases])
  rwa [ht, if_pos (rank q).isLt] at h

theorem rankedExposurePhases_deadline_pairSum {n J : ℕ} (data : ExposurePhase (Grid n))
    (rank : Grid n → Fin J) (p : Grid n) :
    let phases := rankedExposurePhases data rank
    let s := refinedSchedule phases
    let mask := refinedScheduleMask phases
    normalizedPairSum p (fun q => s.cumulative (fun j => mask j q)
      (scheduleProcessDeadline s mask p)) ≤
      normalizedPairSum p (fun q => if rank q ≤ rank p then data.weight q else 0) := by
  dsimp only
  let phases := rankedExposurePhases data rank
  let k := (rank p).val + 1
  have hLate : ∀ f ∈ phases.drop k, f.weight p = 0 := by
    intro f hf
    obtain ⟨i, hi, rfl⟩ := List.mem_iff_getElem.mp hf
    rw [List.getElem_drop]
    dsimp only [phases, rankedExposurePhases]
    rw [List.getElem_ofFn]
    change (if (⟨k+i, _⟩:Fin J) = rank p then data.weight p else 0) = 0
    have hneq (hki : k+i < J) : (⟨k+i,hki⟩:Fin J) ≠ rank p := by
      intro he
      have hv := congrArg Fin.val he
      change k+i = (rank p).val at hv
      omega
    rw [if_neg (hneq _)]
  have h := refined_deadline_pairSum_le (phases.take k) (phases.drop k) p hLate
  let pairs (fs : List (ExposurePhase (Grid n))) : ℝ :=
    normalizedPairSum p (fun q => (refinedSchedule fs).cumulative
      (fun j => refinedScheduleMask fs j q)
      (scheduleProcessDeadline (refinedSchedule fs) (refinedScheduleMask fs) p))
  change pairs (phases.take k ++ phases.drop k) ≤ _ at h
  change pairs phases ≤ _
  rw [List.take_append_drop] at h
  simpa only [phases, rankedExposure_take, k, Nat.lt_succ_iff, ← Fin.le_def] using h


theorem rankedExposurePhases_weight_pos_of_deadline {n J : ℕ} (data : ExposurePhase (Grid n))
    (rank : Grid n → Fin J) (p : Grid n) :
    let phases := rankedExposurePhases data rank
    let s := refinedSchedule phases
    let mask := refinedScheduleMask phases
    0 < scheduleProcessDeadline s mask p → 0 < data.weight p := by
  intro phases s mask hdeadline
  rcases s.deadline_eq_zero_or_used_right (fun j => mask j p) with he | ⟨j,hj,_⟩
  · exact False.elim ((ne_of_gt hdeadline) he)
  have hpos : 0 < s.duration j := sub_pos.mpr (s.lo_lt_hi j)
  have hj' : 0 < s.duration j*mask j p := mul_pos hpos hj
  rw [← rankedExposurePhases_terminal data rank p, Schedule.cumulative_total]
  exact hj'.trans_le (Finset.single_le_sum (f := fun k => s.duration k*mask k p) (by
    intro k _
    have hm : 0 ≤ mask k p := by
      rcases refinedScheduleMask_binary phases k p with h | h <;> simp [mask,h]
    exact mul_nonneg (sub_nonneg.mpr (s.lo_lt_hi k).le) hm) (Finset.mem_univ j))

#print axioms rankedExposurePhases_weight_pos_of_deadline
#print axioms rankedExposurePhases_refined_length
#print axioms rankedExposurePhases_terminal
#print axioms rankedExposurePhases_deadline_pairSum

end NoThreeLine481
