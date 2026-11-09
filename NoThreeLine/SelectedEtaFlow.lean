import NoThreeLine.EtaPairFlow
import NoThreeLine.ModeFlowSelection

/-! Add the actual eta trajectory to the already constructed measurable
weight/clock/line-credit flow without altering that physical flow. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine
open AuxiliaryODE

def modeEtaCurve {n : ℕ} (cfg : FlowConfig n) (m : ProcessMode n)
    (x : (InitialBall n cfg.box × EtaCoordinates n) × ℝ) : EtaCoordinates n :=
  etaAlong (modeSkeleton m) cfg.directions cfg.mask
    (fun u => (selectedModeFlow cfg m).curve (x.1.1,u)) x.1.2 x.2

theorem modeEtaCurve_continuous {n : ℕ} (cfg : FlowConfig n) (m : ProcessMode n) :
    Continuous (modeEtaCurve cfg m) := by
  exact etaAlong_joint_continuous (modeSkeleton m) cfg.directions cfg.mask
    (fun x : (InitialBall n cfg.box × EtaCoordinates n) × ℝ =>
      (selectedModeFlow cfg m).curve (x.1.1,x.2))
    ((selectedModeFlow cfg m).continuous_curve.comp (continuous_fst.fst.prodMk continuous_snd))
    (fun x : InitialBall n cfg.box × EtaCoordinates n => x.2) continuous_snd

abbrev EtaFlowInput {n : ℕ} (cfg : FlowConfig n) := StateBall n cfg.box × EtaCoordinates n

def selectedEtaCurve {n : ℕ} (cfg : FlowConfig n) (x : EtaFlowInput cfg × ℝ) : EtaCoordinates n :=
  modeEtaCurve cfg x.1.1.val.mode ((stateInitialBall x.1.1,x.1.2),x.2)

theorem selectedEtaCurve_measurable {n : ℕ} (cfg : FlowConfig n) : Measurable (selectedEtaCurve cfg) := by
  have hm : Measurable (fun x : ((InitialBall n cfg.box × EtaCoordinates n) × ℝ) × ProcessMode n =>
      modeEtaCurve cfg x.2 x.1) :=
    measurable_from_prod_countable_left (fun m => (modeEtaCurve_continuous cfg m).measurable)
  exact hm.comp
    (((((stateInitialBall_measurable n cfg.box).comp measurable_fst.fst).prodMk
      measurable_fst.snd).prodMk measurable_snd).prodMk
      ((ExtendedState.measurable_mode n).comp (measurable_subtype_coe.comp measurable_fst.fst)))

theorem selectedEtaCurve_eq {n : ℕ} (cfg : FlowConfig n) (x : EtaFlowInput cfg) (t : ℝ) :
    selectedEtaCurve cfg (x,t) =
      etaAlong x.1.val.process cfg.directions cfg.mask (fun u => selectedCurve cfg (x.1,u)) x.2 t := rfl

theorem selectedEtaCurve_initial {n : ℕ} (cfg : FlowConfig n) (x : EtaFlowInput cfg) :
    selectedEtaCurve cfg (x,0) = x.2 :=
  etaAlong_initial x.1.val.process cfg.directions cfg.mask _ x.2

theorem selectedEtaCurve_continuous {n : ℕ} (cfg : FlowConfig n) (x : EtaFlowInput cfg) :
    Continuous (fun t => selectedEtaCurve cfg (x,t)) := by
  change Continuous (fun t => modeEtaCurve cfg x.1.val.mode ((stateInitialBall x.1,x.2),t))
  exact (modeEtaCurve_continuous cfg x.1.val.mode).comp (continuous_const.prodMk continuous_id)

theorem selectedEtaCurve_hasDerivAt {n : ℕ} (cfg : FlowConfig n) (x : EtaFlowInput cfg) (t : ℝ) :
    HasDerivAt (fun t => selectedEtaCurve cfg (x,t))
      (etaRHS x.1.val.process cfg.directions cfg.mask (selectedCurve cfg (x.1,t))
        (selectedEtaCurve cfg (x,t))) t := by
  have hc : Continuous (fun t => selectedCurve cfg (x.1,t)) := by
    change Continuous (fun t => (selectedModeFlow cfg x.1.val.mode).curve (stateInitialBall x.1,t))
    exact (selectedModeFlow cfg x.1.val.mode).continuous_curve.comp (continuous_const.prodMk continuous_id)
  exact etaAlong_hasDerivAt x.1.val.process cfg.directions cfg.mask _ hc x.2 t

theorem selectedEtaCurve_bounds {n : ℕ} (cfg : FlowConfig n) (x : EtaFlowInput cfg)
    (he : x.1.val.Valid cfg.B) (hη : ∀ a b, 0 ≤ x.2 a b ∧ x.2 a b ≤ 1)
    (t : ℝ) (ht : t ∈ Icc (0 : ℝ) (selectedGuardTime cfg x.1)) (a b : Grid n) :
    0 ≤ selectedEtaCurve cfg (x,t) a b ∧ selectedEtaCurve cfg (x,t) a b ≤ 1 := by
  refine ⟨etaAlong_nonneg _ _ _ _ _ _ _ _ (hη a b).1,?_⟩
  apply (etaAlong_le_initial x.1.val.process cfg.directions cfg.mask _ x.2 t ht.1
    cfg.mask_nonneg _ a b (hη a b).1).trans (hη a b).2
  intro u hu p
  exact ((selectedCurve_spec cfg x.1 he.2.1).2.2.1 u ⟨hu.1,hu.2.trans ht.2⟩).1.1 p |>.1

theorem selectedEtaCurve_floor_cost {n : ℕ} (cfg : FlowConfig n) (x : EtaFlowInput cfg)
    (t ε : ℝ) (a b : Grid n) (hη : x.2 a b = 1)
    (hfloor : selectedEtaCurve cfg (x,t) a b ≤ 1-ε) :
    ε ≤ ∫ u in (0 : ℝ)..t, pairRate x.1.val.process cfg.directions cfg.mask
      (selectedCurve cfg (x.1,u)) a b :=
  etaAlong_floor_cost x.1.val.process cfg.directions cfg.mask _ x.2 t ε a b hη hfloor

end NoThreeLine

#print axioms NoThreeLine.selectedEtaCurve_measurable
#print axioms NoThreeLine.selectedEtaCurve_hasDerivAt
#print axioms NoThreeLine.selectedEtaCurve_bounds
#print axioms NoThreeLine.selectedEtaCurve_floor_cost
