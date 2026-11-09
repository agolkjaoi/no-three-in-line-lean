import NoThreeLine.BoxStoppedFlow
import NoThreeLine.ClockInvariants

/-! Reachable coordinate bounds exclude the artificial clipping-box boundary.
The resulting measurable stopping time contacts only a true process guard. -/
set_option autoImplicit false
noncomputable section
open Set Metric MeasureTheory
open scoped NNReal

namespace NoThreeLine.AuxiliaryODE

def CoordinateBounds {n : ℕ} (B : ℝ) (z : Coordinates n) : Prop :=
  (∀ p, 0 ≤ z.1 p ∧ z.1 p ≤ B) ∧
  (∀ L, 0 ≤ z.2.1 L ∧ z.2.1 L ≤ 2) ∧
  (∀ L, 0 ≤ z.2.2 L ∧ z.2.2 L ≤ 1)

theorem coordinateBounds_norm_le {n : ℕ} (B : ℝ) (z : Coordinates n)
    (hz : CoordinateBounds B z) : ‖z‖ ≤ max B 2 := by
  have hc : (0 : ℝ) ≤ max B 2 := (by norm_num : (0 : ℝ) ≤ 2).trans (le_max_right B 2)
  apply max_le
  · apply (pi_norm_le_iff_of_nonneg hc).mpr
    intro p
    rw [Real.norm_eq_abs, abs_of_nonneg (hz.1 p).1]
    exact (hz.1 p).2.trans (le_max_left B 2)
  · apply max_le
    · apply (pi_norm_le_iff_of_nonneg hc).mpr
      intro L
      rw [Real.norm_eq_abs, abs_of_nonneg (hz.2.1 L).1]
      exact (hz.2.1 L).2.trans (le_max_right B 2)
    · apply (pi_norm_le_iff_of_nonneg hc).mpr
      intro L
      rw [Real.norm_eq_abs, abs_of_nonneg (hz.2.2 L).1]
      exact (hz.2.2 L).2.trans ((by norm_num : (1 : ℝ) ≤ 2).trans (le_max_right B 2))

theorem flow_coordinateBounds {n : ℕ} (s : ProcessState n)
    (Γ : Finset PrimitiveLines.ZPoint) (mask : Grid n → ℝ) (hm : ∀ p, 0 ≤ mask p)
    (B K ρ T : ℝ) (hT : 0 ≤ T) (z : ℝ → Coordinates n)
    (hz : ContinuousOn z (Icc 0 T))
    (hd : ∀ t ∈ Ioo 0 T, HasDerivAt z (vectorField s Γ mask (z t)) t)
    (h0 : CoordinateBounds B (z 0))
    (hbefore : ∀ t ∈ Ico 0 T, z t ∉ processGuard s Γ B K ρ)
    (t : ℝ) (ht : t ∈ Icc 0 T) : CoordinateBounds B (z t) := by
  have hw0 : ∀ p, 0 ≤ (z 0).1 p := fun p => (h0.1 p).1
  refine ⟨?_, ?_, ?_⟩
  · intro p
    refine ⟨flow_weights_nonneg s Γ mask T hT z hz hd hw0 t ht p, ?_⟩
    by_cases hp : (s.accounts p).status = .active
    · by_cases hT0 : T = 0
      · have ht0 : t = 0 := by rw [hT0] at ht; exact le_antisymm ht.2 ht.1
        simpa only [ht0] using (h0.1 p).2
      · have hcl : closure (Ico (0 : ℝ) T) = Icc 0 T := closure_Ico (Ne.symm hT0)
        apply le_on_closure (s := Ico (0 : ℝ) T)
          (fun u hu => ((outside_processGuard s Γ B K ρ (z u)).mp (hbefore u hu)).1 p hp |>.le)
          (by rw [hcl]; exact (continuous_apply p).comp_continuousOn hz.fst)
          continuous_const.continuousOn
        simpa only [hcl] using ht
    · rw [flow_weight_inactive_constant s Γ mask T hT z hz hd p hp t ht]
      exact (h0.1 p).2
  · intro L
    exact ⟨flow_clock_lower s Γ mask T hT z hz hd hm hw0 L (h0.2.1 L).1 (h0.2.1 L).2 t ht,
      flow_clock_upper s Γ mask T hT z hz hd L (h0.2.1 L).2 t ht⟩
  · intro L
    exact ⟨flow_lineCredit_nonneg s Γ mask T hT z hz hd L (h0.2.2 L).1 t ht,
      flow_lineCredit_upper s Γ mask T hT z hz hd hm hw0 L (h0.2.2 L).1 (h0.2.2 L).2 t ht⟩

theorem flow_no_artificial_boundary {n : ℕ} (s : ProcessState n)
    (Γ : Finset PrimitiveLines.ZPoint) (mask : Grid n → ℝ) (hm : ∀ p, 0 ≤ mask p)
    (B K ρ C T : ℝ) (hC : max B 2 < C) (hT : 0 ≤ T) (z : ℝ → Coordinates n)
    (hz : ContinuousOn z (Icc 0 T))
    (hd : ∀ t ∈ Ioo 0 T, HasDerivAt z (vectorField s Γ mask (z t)) t)
    (h0 : CoordinateBounds B (z 0))
    (hbefore : ∀ t ∈ Ico 0 T, z t ∉ processGuard s Γ B K ρ)
    (t : ℝ) (ht : t ∈ Icc 0 T) : ‖z t‖ < C :=
  (coordinateBounds_norm_le B (z t)
    (flow_coordinateBounds s Γ mask hm B K ρ T hT z hz hd h0 hbefore t ht)).trans_lt hC

/-- The actual jointly continuous flow and measurable time supplied by
`exists_box_stopped_flow`, with its artificial boundary eliminated for
every initial state in the physical coordinate ranges. -/
theorem exists_guard_stopped_flow {n : ℕ} (s : ProcessState n)
    (Γ : Finset PrimitiveLines.ZPoint) (mask : Grid n → ℝ) (hm : ∀ p, 0 ≤ mask p)
    (B K ρ : ℝ) (C T : ℝ≥0) (hC : max B 2 < (C : ℝ)) :
    ∃ ψ : InitialBall n C × ℝ → Coordinates n, ∃ τ : InitialBall n C → ℝ,
      Continuous ψ ∧ Measurable τ ∧
      ∀ z : InitialBall n C, CoordinateBounds B z.val →
        ψ (z,0) = z.val ∧ τ z ∈ Icc (0 : ℝ) T ∧
        (∀ t ∈ Icc (0 : ℝ) (τ z), CoordinateBounds B (ψ (z,t)) ∧
          ‖ψ (z,t)‖ < C ∧
          HasDerivWithinAt (fun t => ψ (z,t)) (vectorField s Γ mask (ψ (z,t)))
            (Icc (0 : ℝ) (τ z)) t) ∧
        (∀ t ∈ Ico (0 : ℝ) (τ z), ψ (z,t) ∉ processGuard s Γ B K ρ) ∧
        (τ z < T → ψ (z,τ z) ∈ processGuard s Γ B K ρ) := by
  obtain ⟨ψ, τ, hψ, hτ, hf⟩ := exists_box_stopped_flow s Γ mask B K ρ C T
  refine ⟨ψ, τ, hψ, hτ, ?_⟩
  intro z hz0
  obtain ⟨hinit, htime, hder, hbefore, hcontact⟩ := hf z
  have hcurve : Continuous (fun t : ℝ => ψ (z,t)) :=
    hψ.comp (continuous_const.prodMk continuous_id)
  have hd : ∀ t ∈ Ioo (0 : ℝ) (τ z), HasDerivAt (fun t => ψ (z,t))
      (vectorField s Γ mask (ψ (z,t))) t := by
    intro t ht
    exact (hder t ⟨ht.1.le, ht.2.le⟩).2.hasDerivAt (Icc_mem_nhds ht.1 ht.2)
  have hinitB : CoordinateBounds B (ψ (z,0)) := by simpa only [hinit] using hz0
  have hb (t : ℝ) (ht : t ∈ Icc (0 : ℝ) (τ z)) : CoordinateBounds B (ψ (z,t)) :=
    flow_coordinateBounds s Γ mask hm B K ρ (τ z) htime.1 (fun t => ψ (z,t))
      hcurve.continuousOn hd hinitB hbefore t ht
  have hn (t : ℝ) (ht : t ∈ Icc (0 : ℝ) (τ z)) : ‖ψ (z,t)‖ < C :=
    (coordinateBounds_norm_le B _ (hb t ht)).trans_lt hC
  refine ⟨hinit, htime, (fun t ht => ⟨hb t ht, hn t ht, (hder t ht).2⟩), hbefore, ?_⟩
  intro hlt
  rcases hcontact hlt with htrue | hbox
  · exact htrue
  · exact False.elim ((not_le_of_gt (hn (τ z) ⟨htime.1, le_rfl⟩)) hbox)

end NoThreeLine.AuxiliaryODE

#print axioms NoThreeLine.AuxiliaryODE.flow_coordinateBounds
#print axioms NoThreeLine.AuxiliaryODE.exists_guard_stopped_flow
