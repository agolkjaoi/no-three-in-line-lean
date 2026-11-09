import NoThreeLine.AuxiliaryGuardFlow
import NoThreeLine.SelectedLineRegularity

/-! Closed contact of the actual credit-weighted active mass on a fixed
cell/type subset of one board line. The selected physical flow is unchanged. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine
open AuxiliaryODE

def lineSectionMass {n : ℕ} (s : ProcessState n) (L : LineIndex n)
    (p : Grid n) (E : Finset (Grid n)) (z : Coordinates n) : ℝ :=
  z.2.2 L * ∑ q ∈ (L.val ∩ E).erase p, if (s.accounts q).status = .active then z.1 q else 0

theorem lineSectionMass_continuous {n : ℕ} (s : ProcessState n) (L : LineIndex n)
    (p : Grid n) (E : Finset (Grid n)) : Continuous (lineSectionMass s L p E) := by
  unfold lineSectionMass
  apply Continuous.mul (by fun_prop)
  apply continuous_finsetSum
  intro q hq
  split_ifs <;> fun_prop

def lineSectionGuard {n : ℕ} (s : ProcessState n) (L : LineIndex n)
    (p : Grid n) (E : Finset (Grid n)) (A : ℝ) : Set (Coordinates n) :=
  {z | A ≤ lineSectionMass s L p E z}

theorem lineSectionGuard_closed {n : ℕ} (s : ProcessState n) (L : LineIndex n)
    (p : Grid n) (E : Finset (Grid n)) (A : ℝ) : IsClosed (lineSectionGuard s L p E A) :=
  isClosed_le continuous_const (lineSectionMass_continuous s L p E)

def modeLineSectionTime {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n)
    (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (m : ProcessMode n)
    (x : InitialBall n cfg.box) : ℝ :=
  firstClosedHit cfg.horizon (fun t => (selectedModeFlow cfg m).curve (x,t))
    (lineSectionGuard (modeSkeleton m) L p E A)

theorem modeLineSectionTime_measurable {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n)
    (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (m : ProcessMode n) :
    Measurable (modeLineSectionTime cfg L p E A m) :=
  firstClosedHit_measurable cfg.horizon cfg.horizon.coe_nonneg (selectedModeFlow cfg m).curve _
    (selectedModeFlow cfg m).continuous_curve (lineSectionGuard_closed _ L p E A)

def selectedLineSectionTime {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n)
    (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (x : StateBall n cfg.box) : ℝ :=
  modeLineSectionTime cfg L p E A x.val.mode (stateInitialBall x)

section
attribute [local irreducible] modeLineSectionTime

theorem selectedLineSectionTime_measurable {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n)
    (p : Grid n) (E : Finset (Grid n)) (A : ℝ) : Measurable (selectedLineSectionTime cfg L p E A) := by
  unfold selectedLineSectionTime
  have hm : Measurable (fun x : InitialBall n cfg.box × ProcessMode n =>
      modeLineSectionTime cfg L p E A x.2 x.1) :=
    measurable_from_prod_countable_left (fun m => modeLineSectionTime_measurable cfg L p E A m)
  exact hm.comp ((stateInitialBall_measurable n cfg.box).prodMk
    ((ExtendedState.measurable_mode n).comp measurable_subtype_coe))
end

theorem selectedLineSectionTime_eq {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n)
    (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (x : StateBall n cfg.box) :
    selectedLineSectionTime cfg L p E A x = firstClosedHit cfg.horizon
      (fun t => selectedCurve cfg (x,t)) (lineSectionGuard x.val.process L p E A) := rfl

theorem selectedLineSectionCurve_continuous {n : ℕ} (cfg : FlowConfig n) (x : StateBall n cfg.box) :
    Continuous (fun t => selectedCurve cfg (x,t)) := by
  change Continuous (fun t : ℝ => (selectedModeFlow cfg x.val.mode).curve (stateInitialBall x,t))
  exact (selectedModeFlow cfg x.val.mode).continuous_curve.comp (continuous_const.prodMk continuous_id)

theorem selectedLineSectionTime_bounds {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n)
    (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (x : StateBall n cfg.box) :
    selectedLineSectionTime cfg L p E A x ∈ Icc (0:ℝ) cfg.horizon :=
  firstClosedHit_bounds cfg.horizon cfg.horizon.coe_nonneg _ _
    (selectedLineSectionCurve_continuous cfg x) (lineSectionGuard_closed _ L p E A)

theorem selectedLineSectionTime_before {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n)
    (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (x : StateBall n cfg.box)
    (t : ℝ) (ht0 : 0 ≤ t) (ht : t < selectedLineSectionTime cfg L p E A x) :
    lineSectionMass x.val.process L p E (selectedCurve cfg (x,t)) < A := by
  exact lt_of_not_ge (firstClosedHit_before cfg.horizon cfg.horizon.coe_nonneg _ _
    (selectedLineSectionCurve_continuous cfg x) (lineSectionGuard_closed _ L p E A) t ht0 ht)

theorem selectedLineSectionTime_contact {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n)
    (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (x : StateBall n cfg.box)
    (ht : selectedLineSectionTime cfg L p E A x < cfg.horizon) :
    A ≤ lineSectionMass x.val.process L p E
      (selectedCurve cfg (x,selectedLineSectionTime cfg L p E A x)) :=
  firstClosedHit_contact cfg.horizon cfg.horizon.coe_nonneg _ _
    (selectedLineSectionCurve_continuous cfg x) (lineSectionGuard_closed _ L p E A) ht

theorem selectedLineSectionTime_le_of_mass {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n)
    (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (x : StateBall n cfg.box)
    (t : ℝ) (ht : t ∈ Icc (0:ℝ) cfg.horizon)
    (hm : A ≤ lineSectionMass x.val.process L p E (selectedCurve cfg (x,t))) :
    selectedLineSectionTime cfg L p E A x ≤ t := by
  apply (firstClosedHit_le_iff cfg.horizon cfg.horizon.coe_nonneg _ _
    (selectedLineSectionCurve_continuous cfg x) (lineSectionGuard_closed _ L p E A) t).mpr
  exact ⟨t,ht,le_rfl,Or.inr hm⟩

end NoThreeLine

#print axioms NoThreeLine.selectedLineSectionTime_measurable
#print axioms NoThreeLine.selectedLineSectionTime_before
#print axioms NoThreeLine.selectedLineSectionTime_contact
#print axioms NoThreeLine.selectedLineSectionTime_le_of_mass
