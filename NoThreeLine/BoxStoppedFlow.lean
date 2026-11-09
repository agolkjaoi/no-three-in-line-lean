import NoThreeLine.ProcessGuards

/-! Construct an actual weight/k/r flow up to its first closed guard or box
boundary, with measurable hitting time. Excluding an artificial box exit
for reachable initial states is a separate, explicitly remaining step. -/
set_option autoImplicit false
noncomputable section
open Set Metric MeasureTheory
open scoped NNReal

namespace NoThreeLine.AuxiliaryODE

abbrev InitialBall (n : ℕ) (C : ℝ≥0) := ↥(closedBall (0 : Coordinates n) C)

def timeClip (T : ℝ≥0) (t : ℝ) : ℝ := max 0 (min T t)

theorem timeClip_mem (T : ℝ≥0) (t : ℝ) : timeClip T t ∈ Icc (0 : ℝ) T :=
  ⟨le_max_left _ _,max_le T.coe_nonneg (min_le_left _ _)⟩

theorem timeClip_eq (T : ℝ≥0) (t : ℝ) (ht : t ∈ Icc (0 : ℝ) T) : timeClip T t = t := by
  simp [timeClip,min_eq_right ht.2,max_eq_right ht.1]

theorem timeClip_continuous (T : ℝ≥0) : Continuous (timeClip T) := by
  unfold timeClip
  fun_prop

theorem globalized_clipped_flow {n : ℕ} (s : ProcessState n)
    (Γ : Finset PrimitiveLines.ZPoint) (mask : Grid n → ℝ) (C T : ℝ≥0) :
    ∃ ψ : InitialBall n C × ℝ → Coordinates n, Continuous ψ ∧
      ∀ z : InitialBall n C, ψ (z,0) = z.val ∧
        ∀ t ∈ Icc (0 : ℝ) T, HasDerivWithinAt (fun t => ψ (z,t))
          (clippedVectorField s Γ mask C (ψ (z,t))) (Icc (0 : ℝ) T) t := by
  obtain ⟨φ,hφ,hcont⟩ := finite_horizon_clipped_flow s Γ mask C C.coe_nonneg C T
  let ψ : InitialBall n C × ℝ → Coordinates n := fun zt => φ (zt.1.val,timeClip T zt.2)
  have hψcont : Continuous ψ := by
    exact hcont.comp_continuous
      ((continuous_subtype_val.comp continuous_fst).prodMk ((timeClip_continuous T).comp continuous_snd))
      (fun zt => ⟨zt.1.property,timeClip_mem T zt.2⟩)
  refine ⟨ψ,hψcont,?_⟩
  intro z
  have he (t : ℝ) (ht : t ∈ Icc (0 : ℝ) T) : ψ (z,t) = φ (z.val,t) := by
    simp only [ψ,timeClip_eq T t ht]
  refine ⟨?_,?_⟩
  · rw [he 0 ⟨le_rfl,T.coe_nonneg⟩]
    exact (hφ z.val z.property).1
  · intro t ht
    rw [he t ht]
    exact ((hφ z.val z.property).2 t ht).congr_of_mem he ht

theorem exists_box_stopped_flow {n : ℕ} (s : ProcessState n)
    (Γ : Finset PrimitiveLines.ZPoint) (mask : Grid n → ℝ) (B K ρ : ℝ) (C T : ℝ≥0) :
    ∃ ψ : InitialBall n C × ℝ → Coordinates n, ∃ τ : InitialBall n C → ℝ,
      Continuous ψ ∧ Measurable τ ∧
      ∀ z : InitialBall n C, ψ (z,0) = z.val ∧ τ z ∈ Icc (0 : ℝ) T ∧
        (∀ t ∈ Icc (0 : ℝ) (τ z), ‖ψ (z,t)‖ ≤ C ∧
          HasDerivWithinAt (fun t => ψ (z,t)) (vectorField s Γ mask (ψ (z,t)))
            (Icc (0 : ℝ) (τ z)) t) ∧
        (∀ t ∈ Ico (0 : ℝ) (τ z), ψ (z,t) ∉ processGuard s Γ B K ρ) ∧
        (τ z < T → ψ (z,τ z) ∈ boxedProcessGuard s Γ B K ρ C) := by
  obtain ⟨ψ,hcont,hψ⟩ := globalized_clipped_flow s Γ mask C T
  let bad := boxedProcessGuard s Γ B K ρ C
  have hb : IsClosed bad := boxedProcessGuard_closed s Γ B K ρ C
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

#print axioms NoThreeLine.AuxiliaryODE.globalized_clipped_flow
#print axioms NoThreeLine.AuxiliaryODE.exists_box_stopped_flow
