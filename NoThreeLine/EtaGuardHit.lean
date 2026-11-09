import NoThreeLine.SelectedEtaFlow

/-! The first actual eta-floor contact is measurable in the full physical
initial state and eta coordinates. It is capped by the same fixed horizon;
combining it with the physical guard is a subsequent transition step. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine
open AuxiliaryODE

def etaGuard (n : ℕ) (ε : ℝ) : Set (EtaCoordinates n) :=
  {η | ∃ a b : Grid n, a ≠ b ∧ η a b ≤ 1-ε}

theorem etaGuard_closed (n : ℕ) (ε : ℝ) : IsClosed (etaGuard n ε) := by
  have hc (a b : Grid n) : IsClosed {η : EtaCoordinates n | a ≠ b ∧ η a b ≤ 1-ε} := by
    by_cases h : a ≠ b
    · have he : {η : EtaCoordinates n | a ≠ b ∧ η a b ≤ 1-ε} = {η | η a b ≤ 1-ε} := by
        ext η
        exact ⟨fun hh => hh.2,fun hh => ⟨h,hh⟩⟩
      rw [he]
      exact isClosed_le (by fun_prop : Continuous (fun η : EtaCoordinates n => η a b)) continuous_const
    · simp only [h,false_and,Set.setOf_false]
      exact isClosed_empty
  simpa only [etaGuard,Set.setOf_exists] using
    isClosed_iUnion_of_finite (fun a => isClosed_iUnion_of_finite (hc a))

def modeEtaTime {n : ℕ} (cfg : FlowConfig n) (ε : ℝ) (m : ProcessMode n)
    (x : InitialBall n cfg.box × EtaCoordinates n) : ℝ :=
  firstClosedHit cfg.horizon (fun t => modeEtaCurve cfg m (x,t)) (etaGuard n ε)

theorem modeEtaTime_measurable {n : ℕ} (cfg : FlowConfig n) (ε : ℝ) (m : ProcessMode n) :
    Measurable (modeEtaTime cfg ε m) :=
  firstClosedHit_measurable cfg.horizon cfg.horizon.coe_nonneg (modeEtaCurve cfg m)
    (etaGuard n ε) (modeEtaCurve_continuous cfg m) (etaGuard_closed n ε)

def selectedEtaTime {n : ℕ} (cfg : FlowConfig n) (ε : ℝ) (x : EtaFlowInput cfg) : ℝ :=
  modeEtaTime cfg ε x.1.val.mode (stateInitialBall x.1,x.2)

section
attribute [local irreducible] modeEtaTime
theorem selectedEtaTime_measurable {n : ℕ} (cfg : FlowConfig n) (ε : ℝ) :
    Measurable (selectedEtaTime cfg ε) := by
  unfold selectedEtaTime
  have hm : Measurable (fun x : (InitialBall n cfg.box × EtaCoordinates n) × ProcessMode n =>
      modeEtaTime cfg ε x.2 x.1) :=
    measurable_from_prod_countable_left
      (f := fun x : (InitialBall n cfg.box × EtaCoordinates n) × ProcessMode n => modeEtaTime cfg ε x.2 x.1)
      (fun m => modeEtaTime_measurable cfg ε m)
  have hmap : Measurable (fun x : EtaFlowInput cfg =>
      ((stateInitialBall x.1,x.2),x.1.val.mode)) :=
    (((stateInitialBall_measurable n cfg.box).comp measurable_fst).prodMk measurable_snd).prodMk
      ((ExtendedState.measurable_mode n).comp (measurable_subtype_coe.comp measurable_fst))
  exact hm.comp hmap
end

theorem selectedEtaTime_eq {n : ℕ} (cfg : FlowConfig n) (ε : ℝ) (x : EtaFlowInput cfg) :
    selectedEtaTime cfg ε x = firstClosedHit cfg.horizon
      (fun t => selectedEtaCurve cfg (x,t)) (etaGuard n ε) := rfl

theorem selectedEtaTime_bounds {n : ℕ} (cfg : FlowConfig n) (ε : ℝ) (x : EtaFlowInput cfg) :
    selectedEtaTime cfg ε x ∈ Icc (0 : ℝ) cfg.horizon :=
  firstClosedHit_bounds cfg.horizon cfg.horizon.coe_nonneg _ (etaGuard n ε)
    (selectedEtaCurve_continuous cfg x) (etaGuard_closed n ε)

theorem selectedEtaTime_before {n : ℕ} (cfg : FlowConfig n) (ε : ℝ) (x : EtaFlowInput cfg)
    (t : ℝ) (ht0 : 0 ≤ t) (ht : t < selectedEtaTime cfg ε x) (a b : Grid n) (hab : a ≠ b) :
    1-ε < selectedEtaCurve cfg (x,t) a b := by
  have hh := firstClosedHit_before cfg.horizon cfg.horizon.coe_nonneg _ (etaGuard n ε)
    (selectedEtaCurve_continuous cfg x) (etaGuard_closed n ε) t ht0 ht
  exact lt_of_not_ge (fun h => hh ⟨a,b,hab,h⟩)

theorem selectedEtaTime_contact {n : ℕ} (cfg : FlowConfig n) (ε : ℝ) (x : EtaFlowInput cfg)
    (ht : selectedEtaTime cfg ε x < cfg.horizon) :
    ∃ a b : Grid n, a ≠ b ∧ selectedEtaCurve cfg (x,selectedEtaTime cfg ε x) a b ≤ 1-ε :=
  firstClosedHit_contact cfg.horizon cfg.horizon.coe_nonneg _ (etaGuard n ε)
    (selectedEtaCurve_continuous cfg x) (etaGuard_closed n ε) ht

theorem selectedEtaTime_cost {n : ℕ} (cfg : FlowConfig n) (ε : ℝ) (x : EtaFlowInput cfg)
    (hη : ∀ a b, x.2 a b = 1) (ht : selectedEtaTime cfg ε x < cfg.horizon) :
    ∃ a b : Grid n, a ≠ b ∧
      ε ≤ ∫ u in (0 : ℝ)..selectedEtaTime cfg ε x,
        pairRate x.1.val.process cfg.directions cfg.mask (selectedCurve cfg (x.1,u)) a b := by
  obtain ⟨a,b,hab,hfloor⟩ := selectedEtaTime_contact cfg ε x ht
  exact ⟨a,b,hab,selectedEtaCurve_floor_cost cfg x _ ε a b (hη a b) hfloor⟩

end NoThreeLine

#print axioms NoThreeLine.etaGuard_closed
#print axioms NoThreeLine.selectedEtaTime_measurable
#print axioms NoThreeLine.selectedEtaTime_before
#print axioms NoThreeLine.selectedEtaTime_cost
