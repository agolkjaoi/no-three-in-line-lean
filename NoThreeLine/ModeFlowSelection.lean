import NoThreeLine.DiscreteModes
import NoThreeLine.ExtendedTransitions

/-! Select constructed flows across the finite discrete modes. The resulting
curve and first pending-guard time are measurable in the entire initial state. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set Metric
open scoped NNReal

namespace NoThreeLine
open AuxiliaryODE

structure FlowConfig (n : ℕ) where
  directions : Finset PrimitiveLines.ZPoint
  mask : Grid n → ℝ
  B : ℝ
  K : ℝ
  rho : ℝ
  box : ℝ≥0
  horizon : ℝ≥0
  mask_nonneg : ∀ p, 0 ≤ mask p
  box_large : max B 2 < (box : ℝ)

structure ModeFlowData {n : ℕ} (cfg : FlowConfig n) (m : ProcessMode n) where
  curve : InitialBall n cfg.box × ℝ → Coordinates n
  time : InitialBall n cfg.box → ℝ
  continuous_curve : Continuous curve
  measurable_time : Measurable time
  laws : ∀ z : InitialBall n cfg.box, CoordinateBounds cfg.B z.val →
    curve (z,0) = z.val ∧ time z ∈ Icc (0 : ℝ) cfg.horizon ∧
    (∀ t ∈ Icc (0 : ℝ) (time z), CoordinateBounds cfg.B (curve (z,t)) ∧
      ‖curve (z,t)‖ < cfg.box ∧
      HasDerivWithinAt (fun t => curve (z,t))
        (vectorField (modeSkeleton m) cfg.directions cfg.mask (curve (z,t)))
        (Icc (0 : ℝ) (time z)) t) ∧
    (∀ t ∈ Ico (0 : ℝ) (time z), curve (z,t) ∉
      pendingGuardSet (modeSkeleton m) cfg.directions cfg.B cfg.K cfg.rho m.2.2.2) ∧
    (time z < cfg.horizon → curve (z,time z) ∈
      pendingGuardSet (modeSkeleton m) cfg.directions cfg.B cfg.K cfg.rho m.2.2.2)

theorem modeFlowData_nonempty {n : ℕ} (cfg : FlowConfig n) (m : ProcessMode n) :
    Nonempty (ModeFlowData cfg m) := by
  obtain ⟨ψ,τ,hψ,hτ,hf⟩ := exists_pending_guard_flow (modeSkeleton m) cfg.directions
    cfg.mask cfg.mask_nonneg cfg.B cfg.K cfg.rho m.2.2.2 cfg.box cfg.horizon cfg.box_large
  exact ⟨⟨ψ,τ,hψ,hτ,hf⟩⟩

def selectedModeFlow {n : ℕ} (cfg : FlowConfig n) (m : ProcessMode n) : ModeFlowData cfg m :=
  Classical.choice (modeFlowData_nonempty cfg m)

abbrev StateBall (n : ℕ) (C : ℝ≥0) := {e : ExtendedState n // ‖e.coordinates‖ ≤ C}

def stateInitialBall {n : ℕ} {C : ℝ≥0} (e : StateBall n C) : InitialBall n C :=
  ⟨e.val.coordinates,by simpa only [mem_closedBall,dist_zero_right] using e.property⟩

theorem stateInitialBall_measurable (n : ℕ) (C : ℝ≥0) : Measurable (@stateInitialBall n C) := by
  exact ((ExtendedState.measurable_coordinates n).comp measurable_subtype_coe).subtype_mk

def selectedCurve {n : ℕ} (cfg : FlowConfig n) (x : StateBall n cfg.box × ℝ) : Coordinates n :=
  (selectedModeFlow cfg x.1.val.mode).curve (stateInitialBall x.1,x.2)

def selectedGuardTime {n : ℕ} (cfg : FlowConfig n) (e : StateBall n cfg.box) : ℝ :=
  (selectedModeFlow cfg e.val.mode).time (stateInitialBall e)

def selectedTrajectory {n : ℕ} (cfg : FlowConfig n) (x : StateBall n cfg.box × ℝ) : ExtendedState n :=
  x.1.val.withCoordinates (selectedCurve cfg x)

theorem selectedCurve_measurable {n : ℕ} (cfg : FlowConfig n) : Measurable (selectedCurve cfg) := by
  have hm : Measurable (fun x : (InitialBall n cfg.box × ℝ) × ProcessMode n =>
      (selectedModeFlow cfg x.2).curve x.1) :=
    measurable_from_prod_countable_left (fun m => (selectedModeFlow cfg m).continuous_curve.measurable)
  exact hm.comp ((((stateInitialBall_measurable n cfg.box).comp measurable_fst).prodMk measurable_snd).prodMk
    ((ExtendedState.measurable_mode n).comp (measurable_subtype_coe.comp measurable_fst)))

theorem selectedGuardTime_measurable {n : ℕ} (cfg : FlowConfig n) :
    Measurable (selectedGuardTime cfg) := by
  have hm : Measurable (fun x : InitialBall n cfg.box × ProcessMode n =>
      (selectedModeFlow cfg x.2).time x.1) :=
    measurable_from_prod_countable_left (fun m => (selectedModeFlow cfg m).measurable_time)
  exact hm.comp ((stateInitialBall_measurable n cfg.box).prodMk
    ((ExtendedState.measurable_mode n).comp measurable_subtype_coe))

theorem selectedTrajectory_measurable {n : ℕ} (cfg : FlowConfig n) :
    Measurable (selectedTrajectory cfg) :=
  (ExtendedState.measurable_withCoordinates n).comp
    ((measurable_subtype_coe.comp measurable_fst).prodMk (selectedCurve_measurable cfg))

theorem selectedCurve_spec {n : ℕ} (cfg : FlowConfig n) (e : StateBall n cfg.box)
    (he : CoordinateBounds cfg.B e.val.coordinates) :
    selectedCurve cfg (e,0) = e.val.coordinates ∧
    selectedGuardTime cfg e ∈ Icc (0 : ℝ) cfg.horizon ∧
    (∀ t ∈ Icc (0 : ℝ) (selectedGuardTime cfg e),
      CoordinateBounds cfg.B (selectedCurve cfg (e,t)) ∧
      ‖selectedCurve cfg (e,t)‖ < cfg.box ∧
      HasDerivWithinAt (fun t => selectedCurve cfg (e,t))
        (vectorField e.val.process cfg.directions cfg.mask (selectedCurve cfg (e,t)))
        (Icc (0 : ℝ) (selectedGuardTime cfg e)) t) ∧
    (∀ t ∈ Ico (0 : ℝ) (selectedGuardTime cfg e), selectedCurve cfg (e,t) ∉
      pendingGuardSet e.val.process cfg.directions cfg.B cfg.K cfg.rho e.val.handled) ∧
    (selectedGuardTime cfg e < cfg.horizon → selectedCurve cfg (e,selectedGuardTime cfg e) ∈
      pendingGuardSet e.val.process cfg.directions cfg.B cfg.K cfg.rho e.val.handled) := by
  have h := (selectedModeFlow cfg e.val.mode).laws (stateInitialBall e) he
  simpa only [selectedCurve,selectedGuardTime,vectorField_mode,pendingGuardSet_mode,stateInitialBall] using h

theorem selectedTrajectory_valid {n : ℕ} (cfg : FlowConfig n) (e : StateBall n cfg.box)
    (he : e.val.Valid cfg.B) (t : ℝ) (ht : t ∈ Icc (0 : ℝ) (selectedGuardTime cfg e)) :
    (selectedTrajectory cfg (e,t)).Valid cfg.B :=
  e.val.withCoordinates_valid cfg.B he _ (((selectedCurve_spec cfg e he.2.1).2.2.1 t ht).1)

end NoThreeLine

#print axioms NoThreeLine.selectedCurve_measurable
#print axioms NoThreeLine.selectedGuardTime_measurable
#print axioms NoThreeLine.selectedCurve_spec
#print axioms NoThreeLine.selectedTrajectory_valid
