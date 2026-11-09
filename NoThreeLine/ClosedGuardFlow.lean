import NoThreeLine.BoxStoppedFlow

/-! The actual fixed-mode flow to any closed guard, initially including a
compact clipping boundary. This supports additional manuscript guards. -/
set_option autoImplicit false
noncomputable section
open Set Metric MeasureTheory
open scoped NNReal

namespace NoThreeLine.AuxiliaryODE

theorem exists_closed_guard_box_flow {n : ℕ} (s : ProcessState n)
    (Γ : Finset PrimitiveLines.ZPoint) (mask : Grid n → ℝ)
    (guard : Set (Coordinates n)) (hguard : IsClosed guard) (C T : ℝ≥0) :
    ∃ ψ : InitialBall n C × ℝ → Coordinates n, ∃ τ : InitialBall n C → ℝ,
      Continuous ψ ∧ Measurable τ ∧
      ∀ z : InitialBall n C, ψ (z,0) = z.val ∧ τ z ∈ Icc (0 : ℝ) T ∧
        (∀ t ∈ Icc (0 : ℝ) (τ z), ‖ψ (z,t)‖ ≤ C ∧
          HasDerivWithinAt (fun t => ψ (z,t)) (vectorField s Γ mask (ψ (z,t)))
            (Icc (0 : ℝ) (τ z)) t) ∧
        (∀ t ∈ Ico (0 : ℝ) (τ z), ψ (z,t) ∉ guard) ∧
        (τ z < T → ψ (z,τ z) ∈ guard ∪ {u | (C : ℝ) ≤ ‖u‖}) := by
  obtain ⟨ψ,hcont,hψ⟩ := globalized_clipped_flow s Γ mask C T
  let bad := guard ∪ {u : Coordinates n | (C : ℝ) ≤ ‖u‖}
  have hb : IsClosed bad := hguard.union (isClosed_le continuous_const continuous_norm)
  let τ : InitialBall n C → ℝ := fun z => firstClosedHit T (fun t => ψ (z,t)) bad
  have hτ : Measurable τ := firstClosedHit_measurable T T.coe_nonneg ψ bad hcont hb
  refine ⟨ψ,τ,hcont,hτ,?_⟩
  intro z
  have hcurve : Continuous (fun t : ℝ => ψ (z,t)) :=
    hcont.comp (continuous_const.prodMk continuous_id)
  have hbounds : τ z ∈ Icc (0 : ℝ) T := firstClosedHit_bounds T T.coe_nonneg _ bad hcurve hb
  have h0 : ‖ψ (z,0)‖ ≤ C := by
    rw [(hψ z).1]
    simpa only [mem_closedBall,dist_zero_right] using z.property
  have hbox : {u : Coordinates n | (C : ℝ) ≤ ‖u‖} ⊆ bad := fun _ hu => Or.inr hu
  refine ⟨(hψ z).1,hbounds,?_,?_,?_⟩
  · intro t ht
    have hn : ‖ψ (z,t)‖ ≤ C := firstClosedHit_norm_bound T C T.coe_nonneg
      (fun t => ψ (z,t)) bad hcurve hb h0 hbox t ht
    refine ⟨hn,?_⟩
    have hdt := (hψ z).2 t ⟨ht.1,ht.2.trans hbounds.2⟩
    rw [clippedVectorField_eq s Γ mask C (ψ (z,t)) hn] at hdt
    exact hdt.mono (Icc_subset_Icc le_rfl hbounds.2)
  · intro t ht hp
    exact firstClosedHit_before T T.coe_nonneg (fun t => ψ (z,t)) bad hcurve hb
      t ht.1 ht.2 (Or.inl hp)
  · intro ht
    exact firstClosedHit_contact T T.coe_nonneg (fun t => ψ (z,t)) bad hcurve hb ht

end NoThreeLine.AuxiliaryODE

#print axioms NoThreeLine.AuxiliaryODE.exists_closed_guard_box_flow
