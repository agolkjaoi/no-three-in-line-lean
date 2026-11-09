import NoThreeLine.EtaGuardHit
import NoThreeLine.VirtualDeletionGuard

/-! Actual eta-floor and virtual-deletion guards along the constructed
physical flow. Their first joint contact is measurable in the entire input.
The physical flow must still be capped by its existing weight/k/r guard. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine
open AuxiliaryODE

def auxiliaryGuard {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (ε M : ℝ) : Set (EtaSystemCoordinates n) :=
  Prod.snd ⁻¹' etaGuard n ε ∪ Prod.fst ⁻¹' virtualGuard s Γ M

theorem auxiliaryGuard_closed {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (ε M : ℝ) : IsClosed (auxiliaryGuard s Γ ε M) :=
  ((etaGuard_closed n ε).preimage continuous_snd).union
    ((virtualGuard_closed s Γ M).preimage continuous_fst)

def modeAuxCurve {n : ℕ} (cfg : FlowConfig n) (m : ProcessMode n)
    (x : (InitialBall n cfg.box × EtaCoordinates n) × ℝ) : EtaSystemCoordinates n :=
  ((selectedModeFlow cfg m).curve (x.1.1,x.2),modeEtaCurve cfg m x)

theorem modeAuxCurve_continuous {n : ℕ} (cfg : FlowConfig n) (m : ProcessMode n) :
    Continuous (modeAuxCurve cfg m) :=
  ((selectedModeFlow cfg m).continuous_curve.comp (continuous_fst.fst.prodMk continuous_snd)).prodMk
    (modeEtaCurve_continuous cfg m)

def modeAuxTime {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (m : ProcessMode n)
    (x : InitialBall n cfg.box × EtaCoordinates n) : ℝ :=
  firstClosedHit cfg.horizon (fun t => modeAuxCurve cfg m (x,t))
    (auxiliaryGuard (modeSkeleton m) cfg.directions ε M)

theorem modeAuxTime_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (m : ProcessMode n) :
    Measurable (modeAuxTime cfg ε M m) :=
  firstClosedHit_measurable cfg.horizon cfg.horizon.coe_nonneg (modeAuxCurve cfg m)
    _ (modeAuxCurve_continuous cfg m) (auxiliaryGuard_closed _ _ _ _)

def selectedAuxCurve {n : ℕ} (cfg : FlowConfig n) (x : EtaFlowInput cfg × ℝ) : EtaSystemCoordinates n :=
  (selectedCurve cfg (x.1.1,x.2),selectedEtaCurve cfg x)

def selectedAuxTime {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (x : EtaFlowInput cfg) : ℝ :=
  modeAuxTime cfg ε M x.1.val.mode (stateInitialBall x.1,x.2)

theorem selectedAuxCurve_continuous {n : ℕ} (cfg : FlowConfig n) (x : EtaFlowInput cfg) :
    Continuous (fun t => selectedAuxCurve cfg (x,t)) := by
  change Continuous (fun t => modeAuxCurve cfg x.1.val.mode ((stateInitialBall x.1,x.2),t))
  exact (modeAuxCurve_continuous cfg x.1.val.mode).comp (continuous_const.prodMk continuous_id)

theorem selectedAuxCurve_measurable {n : ℕ} (cfg : FlowConfig n) : Measurable (selectedAuxCurve cfg) :=
  ((selectedCurve_measurable cfg).comp (measurable_fst.fst.prodMk measurable_snd)).prodMk
    (selectedEtaCurve_measurable cfg)

section
attribute [local irreducible] modeAuxTime
theorem selectedAuxTime_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) :
    Measurable (selectedAuxTime cfg ε M) := by
  unfold selectedAuxTime
  have hm : Measurable (fun x : (InitialBall n cfg.box × EtaCoordinates n) × ProcessMode n =>
      modeAuxTime cfg ε M x.2 x.1) :=
    measurable_from_prod_countable_left
      (f := fun x : (InitialBall n cfg.box × EtaCoordinates n) × ProcessMode n => modeAuxTime cfg ε M x.2 x.1)
      (fun m => modeAuxTime_measurable cfg ε M m)
  have hmap : Measurable (fun x : EtaFlowInput cfg => ((stateInitialBall x.1,x.2),x.1.val.mode)) :=
    (((stateInitialBall_measurable n cfg.box).comp measurable_fst).prodMk measurable_snd).prodMk
      ((ExtendedState.measurable_mode n).comp (measurable_subtype_coe.comp measurable_fst))
  exact hm.comp hmap
end

theorem selectedAuxTime_eq {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (x : EtaFlowInput cfg) :
    selectedAuxTime cfg ε M x = firstClosedHit cfg.horizon (fun t => selectedAuxCurve cfg (x,t))
      (auxiliaryGuard x.1.val.process cfg.directions ε M) := rfl

theorem selectedAuxTime_bounds {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (x : EtaFlowInput cfg) :
    selectedAuxTime cfg ε M x ∈ Icc (0 : ℝ) cfg.horizon :=
  firstClosedHit_bounds cfg.horizon cfg.horizon.coe_nonneg _ _
    (selectedAuxCurve_continuous cfg x) (auxiliaryGuard_closed _ _ _ _)

theorem selectedAuxTime_before {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (x : EtaFlowInput cfg)
    (t : ℝ) (ht0 : 0 ≤ t) (ht : t < selectedAuxTime cfg ε M x) :
    (∀ a b : Grid n, a ≠ b → 1-ε < selectedEtaCurve cfg (x,t) a b) ∧
    (∀ L q, virtualMass x.1.val.process cfg.directions (selectedCurve cfg (x.1,t)) L q < M) := by
  have hh := firstClosedHit_before cfg.horizon cfg.horizon.coe_nonneg _ _
    (selectedAuxCurve_continuous cfg x) (auxiliaryGuard_closed x.1.val.process cfg.directions ε M)
    t ht0 ht
  have hparts : selectedEtaCurve cfg (x,t) ∉ etaGuard n ε ∧
      selectedCurve cfg (x.1,t) ∉ virtualGuard x.1.val.process cfg.directions M := not_or.mp hh
  refine ⟨?_,(outside_virtualGuard _ _ _ _).mp hparts.2⟩
  intro a b hab
  exact lt_of_not_ge (fun h => hparts.1 ⟨a,b,hab,h⟩)

theorem selectedAuxTime_contact {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (x : EtaFlowInput cfg)
    (ht : selectedAuxTime cfg ε M x < cfg.horizon) :
    selectedAuxCurve cfg (x,selectedAuxTime cfg ε M x) ∈
      auxiliaryGuard x.1.val.process cfg.directions ε M :=
  firstClosedHit_contact cfg.horizon cfg.horizon.coe_nonneg _ _
    (selectedAuxCurve_continuous cfg x) (auxiliaryGuard_closed _ _ _ _) ht

end NoThreeLine

#print axioms NoThreeLine.auxiliaryGuard_closed
#print axioms NoThreeLine.selectedAuxTime_measurable
#print axioms NoThreeLine.selectedAuxTime_before
#print axioms NoThreeLine.selectedAuxTime_contact
