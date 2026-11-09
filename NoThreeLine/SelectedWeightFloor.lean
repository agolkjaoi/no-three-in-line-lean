import NoThreeLine.SpecifiedWeightFloor
import NoThreeLine.CappedBirthRate

/-! The selected physical ODE has nonnegative weight derivative. Thus the
specified-line floor survives the actual capped flow and birth/guard update. -/
set_option autoImplicit false
noncomputable section
open Set

namespace NoThreeLine
open AuxiliaryODE

theorem selectedCurve_weight_monotone {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (hx : x.val.Valid cfg.B) (p : Grid n) :
    MonotoneOn (fun t : ℝ => (selectedCurve cfg (x,t)).1 p)
      (Icc (0:ℝ) (selectedGuardTime cfg x)) := by
  have hc : Continuous (fun t : ℝ => selectedCurve cfg (x,t)) := by
    change Continuous (fun t : ℝ => (selectedModeFlow cfg x.val.mode).curve (stateInitialBall x,t))
    exact (selectedModeFlow cfg x.val.mode).continuous_curve.comp
      (continuous_const.prodMk continuous_id)
  have hd := (selectedCurve_spec cfg x hx.2.1).2.2.1
  apply monotoneOn_of_hasDerivWithinAt_nonneg (convex_Icc _ _)
    ((continuous_apply p).comp hc.fst).continuousOn
    (f' := fun t => x.val.process.compensatedVectorField cfg.directions cfg.mask
      (selectedCurve cfg (x,t)).1 p)
  · intro t ht
    rw [interior_Icc] at ht
    exact (hasDerivWithinAt_pi.mp (hd t ⟨ht.1.le,ht.2.le⟩).2.2.fst p).mono interior_subset
  · intro t ht
    rw [interior_Icc] at ht
    exact x.val.process.compensatedVectorField_nonneg cfg.directions cfg.mask _
      cfg.mask_nonneg (fun q => ((hd t ⟨ht.1.le,ht.2.le⟩).1.1 q).1) p

theorem selectedCurve_weight_ge_initial {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (hx : x.val.Valid cfg.B) (p : Grid n)
    (t : ℝ) (ht : t ∈ Icc (0:ℝ) (selectedGuardTime cfg x)) :
    (x.val.process.accounts p).weight ≤ (selectedCurve cfg (x,t)).1 p := by
  have hspec := selectedCurve_spec cfg x hx.2.1
  have hh := selectedCurve_weight_monotone cfg x hx p ⟨le_rfl,hspec.2.1.1⟩ ht ht.1
  simpa only [hspec.1, ExtendedState.coordinates] using hh

theorem selectedTrajectory_activeWeightFloor {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (hx : x.val.Valid cfg.B)
    (hf : x.val.process.ActiveWeightFloor cfg.directions)
    (t : ℝ) (ht : t ∈ Icc (0:ℝ) (selectedGuardTime cfg x)) :
    (selectedTrajectory cfg (x,t)).process.ActiveWeightFloor cfg.directions :=
  x.val.process.withWeights_activeWeightFloor cfg.directions hf _
    (fun p => selectedCurve_weight_ge_initial cfg x hx p t ht)

theorem ProcessState.stop_activeWeightFloor {n : ℕ} (s : ProcessState n)
    (Γ : Finset PrimitiveLines.ZPoint) (hf : s.ActiveWeightFloor Γ) :
    s.stop.ActiveWeightFloor Γ :=
  s.retire_activeWeightFloor Γ hf (fun _ => true)

theorem ExtendedState.candidateUpdate_activeWeightFloor {n : ℕ} (e : ExtendedState n)
    (Γ : Finset PrimitiveLines.ZPoint) (mask : Grid n → ℝ) (B : ℝ)
    (q : Grid n) (positive : Grid n → Bool) (mark : ℝ)
    (hf : e.process.ActiveWeightFloor Γ) :
    (e.candidateUpdate Γ mask B q positive mark).process.ActiveWeightFloor Γ := by
  rw [candidateUpdate_eq]
  split_ifs
  · exact e.process.birth_activeWeightFloor Γ hf q positive
  · exact hf

theorem ExtendedState.resolve_activeWeightFloor {n : ℕ} (e : ExtendedState n)
    (Γ : Finset PrimitiveLines.ZPoint) (B K ρ : ℝ)
    (hf : e.process.ActiveWeightFloor Γ) :
    (e.resolve Γ B K ρ).process.ActiveWeightFloor Γ := by
  unfold ExtendedState.resolve resolveBoundary
  split_ifs
  · exact e.process.stop_activeWeightFloor Γ hf
  · exact e.process.retire_activeWeightFloor Γ hf _

theorem AugmentedState.resolve_activeWeightFloor {n : ℕ} (a : AugmentedState n)
    (Γ : Finset PrimitiveLines.ZPoint) (B K ρ ε M : ℝ)
    (hf : a.physical.process.ActiveWeightFloor Γ) :
    (a.resolve Γ B K ρ ε M).physical.process.ActiveWeightFloor Γ := by
  unfold AugmentedState.resolve
  split_ifs
  · exact a.physical.process.stop_activeWeightFloor Γ hf
  · exact a.physical.resolve_activeWeightFloor Γ B K ρ hf

theorem augPreState_activeWeightFloor {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg) (hx : x.1.1.val.Valid cfg.B)
    (hf : x.1.1.val.process.ActiveWeightFloor cfg.directions) (z : (ℝ × Grid n) × ℝ) :
    (augPreState cfg ε M (x,z)).physical.process.ActiveWeightFloor cfg.directions := by
  have ht := augAdvance_mem cfg ε M x hx z.1.1
  exact selectedTrajectory_activeWeightFloor cfg x.1.1 hx hf _
    ⟨ht.1,ht.2.trans (augGuardTime_mem cfg ε M x hx).2⟩

theorem augRawOutcome_activeWeightFloor {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg) (hx : x.1.1.val.Valid cfg.B)
    (hf : x.1.1.val.process.ActiveWeightFloor cfg.directions) (z : (ℝ × Grid n) × ℝ) :
    (augRawOutcome cfg ε M (x,z)).physical.process.ActiveWeightFloor cfg.directions := by
  have hp := augPreState_activeWeightFloor cfg ε M x hx hf z
  unfold augRawOutcome
  split_ifs
  · exact (augPreState cfg ε M (x,z)).physical.candidateUpdate_activeWeightFloor
      cfg.directions cfg.mask cfg.B z.1.2 (fun _ => false) z.2 hp
  · exact hp

theorem augOutcome_activeWeightFloor {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg) (hx : x.1.1.val.Valid cfg.B)
    (hf : x.1.1.val.process.ActiveWeightFloor cfg.directions) (z : (ℝ × Grid n) × ℝ) :
    (augOutcome cfg ε M (x,z)).physical.process.ActiveWeightFloor cfg.directions :=
  (augRawOutcome cfg ε M (x,z)).resolve_activeWeightFloor cfg.directions cfg.B cfg.K
    cfg.rho ε M (augRawOutcome_activeWeightFloor cfg ε M x hx hf z)

end NoThreeLine

#print axioms NoThreeLine.selectedCurve_weight_monotone
#print axioms NoThreeLine.augOutcome_activeWeightFloor
