import NoThreeLine.AuxiliaryGuardFlow
import NoThreeLine.ClosedGuardInvariant

/-! The auxiliary lower/upper inequalities hold through the contact time,
not only strictly before it, including when contact occurs immediately. -/
set_option autoImplicit false
noncomputable section
open Set

namespace NoThreeLine
open AuxiliaryODE

theorem selectedAuxTime_eta_lower {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (x : EtaFlowInput cfg)
    (a b : Grid n) (hab : a ≠ b) (hinit : 1-ε ≤ x.2 a b)
    (t : ℝ) (ht : t ∈ Icc (0 : ℝ) (selectedAuxTime cfg ε M x)) :
    1-ε ≤ selectedEtaCurve cfg (x,t) a b := by
  apply firstClosedHit_invariant cfg.horizon cfg.horizon.coe_nonneg
    (fun u => selectedAuxCurve cfg (x,u)) (auxiliaryGuard x.1.val.process cfg.directions ε M)
    {z : EtaSystemCoordinates n | 1-ε ≤ z.2 a b}
    (selectedAuxCurve_continuous cfg x) (auxiliaryGuard_closed _ _ _ _)
    (isClosed_le continuous_const (by fun_prop)) _ _ t ht
  · change 1-ε ≤ selectedEtaCurve cfg (x,0) a b
    simpa only [selectedEtaCurve_initial] using hinit
  · intro z hz
    have hn : z.2 ∉ etaGuard n ε := fun h => hz (Or.inl h)
    exact (lt_of_not_ge (fun h => hn ⟨a,b,hab,h⟩)).le

theorem selectedAuxTime_virtual_upper {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (x : EtaFlowInput cfg)
    (he : x.1.val.Valid cfg.B) (L : LineIndex n) (q : Grid n)
    (hinit : virtualMass x.1.val.process cfg.directions x.1.val.coordinates L q ≤ M)
    (t : ℝ) (ht : t ∈ Icc (0 : ℝ) (selectedAuxTime cfg ε M x)) :
    virtualMass x.1.val.process cfg.directions (selectedCurve cfg (x.1,t)) L q ≤ M := by
  apply firstClosedHit_invariant cfg.horizon cfg.horizon.coe_nonneg
    (fun u => selectedAuxCurve cfg (x,u)) (auxiliaryGuard x.1.val.process cfg.directions ε M)
    {z : EtaSystemCoordinates n | virtualMass x.1.val.process cfg.directions z.1 L q ≤ M}
    (selectedAuxCurve_continuous cfg x) (auxiliaryGuard_closed _ _ _ _)
    (isClosed_le ((virtualMass_contDiff _ _ L q).continuous.comp continuous_fst) continuous_const)
    _ _ t ht
  · change virtualMass x.1.val.process cfg.directions (selectedCurve cfg (x.1,0)) L q ≤ M
    simpa only [(selectedCurve_spec cfg x.1 he.2.1).1] using hinit
  · intro z hz
    have hn : z.1 ∉ virtualGuard x.1.val.process cfg.directions M := fun h => hz (Or.inr h)
    exact ((outside_virtualGuard _ _ _ _).mp hn L q).le

end NoThreeLine

#print axioms NoThreeLine.selectedAuxTime_eta_lower
#print axioms NoThreeLine.selectedAuxTime_virtual_upper
