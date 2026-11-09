import NoThreeLine.SelectedLineCreditIntegral
import NoThreeLine.AugmentedTimedState

/-! The actual timed step loses line credit by its gated selected-curve
integral; completed and stopped inputs contribute zero. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine
open AuxiliaryODE

theorem selectedLineCreditRate_nonneg {n : ℕ} (cfg : FlowConfig n)
    (e : StateBall n cfg.box) (he : e.val.Valid cfg.B) (L : LineIndex n)
    (t : ℝ) (ht : t ∈ Icc (0 : ℝ) (selectedGuardTime cfg e)) :
    0 ≤ selectedLineCreditRate cfg e L t := by
  have hbounds := ((selectedCurve_spec cfg e he.2.1).2.2.1 t ht).1
  exact mul_nonneg (hbounds.2.2 L).1
    (creditDamping_nonneg e.val.process cfg.directions cfg.mask _ cfg.mask_nonneg
      (fun q => (hbounds.1 q).1) L)

def augTimedLineCredit {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n)
    (s : AugTimedState cfg) : ℝ := s.val.1.physical.lineCredits L

theorem augTimedLineCredit_measurable {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n) :
    Measurable (augTimedLineCredit cfg L) :=
  (measurable_pi_apply L).comp ((ExtendedState.measurable_lineCredits n).comp
    ((AugmentedState.measurable_physical n).comp measurable_subtype_coe.fst))

theorem augTimedLineCredit_bounds {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n)
    (s : AugTimedState cfg) : 0 ≤ augTimedLineCredit cfg L s ∧ augTimedLineCredit cfg L s ≤ 1 :=
  s.property.1.1.2.1.2.2 L

def augTimedLineLoss {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (x : AugTimedState cfg × ((ℝ × Grid n) × ℝ)) : ℝ :=
  if x.1.val.2 ≤ 0 ∨ x.1.val.1.physical.process.stopped = true then 0
  else ∫ u in (0 : ℝ)..augAdvance cfg ε M (augTimedInput cfg x.1,x.2.1.1),
    selectedLineCreditRate cfg (augTimedInput cfg x.1).1.1 L u

theorem augTimedLineLoss_eq {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (s : AugTimedState cfg) (z : (ℝ × Grid n) × ℝ) :
    augTimedLineLoss cfg ε M L (s,z) =
      augTimedLineCredit cfg L s - augTimedLineCredit cfg L (augTimedStep cfg ε M (s,z)) := by
  unfold augTimedLineLoss augTimedLineCredit augTimedStep augTimedStepPair
  split_ifs
  · simp only [sub_self]
  · exact (augOutcome_lineCredit_integral cfg ε M (augTimedInput cfg s) s.property.1.1 z L).symm

theorem augTimedLineLoss_nonneg {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (s : AugTimedState cfg) (z : (ℝ × Grid n) × ℝ) : 0 ≤ augTimedLineLoss cfg ε M L (s,z) := by
  unfold augTimedLineLoss
  split_ifs
  · exact le_rfl
  · have ht := augAdvance_mem cfg ε M (augTimedInput cfg s) s.property.1.1 z.1.1
    apply intervalIntegral.integral_nonneg ht.1
    intro u hu
    exact selectedLineCreditRate_nonneg cfg _ s.property.1.1 L u
      ⟨hu.1,hu.2.trans (ht.2.trans (augGuardTime_mem cfg ε M _ s.property.1.1).2)⟩

theorem augTimedLineLoss_bounds {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (s : AugTimedState cfg) (z : (ℝ × Grid n) × ℝ) :
    0 ≤ augTimedLineLoss cfg ε M L (s,z) ∧ augTimedLineLoss cfg ε M L (s,z) ≤ 1 := by
  refine ⟨augTimedLineLoss_nonneg cfg ε M L s z,?_⟩
  rw [augTimedLineLoss_eq]
  exact (sub_le_self _ (augTimedLineCredit_bounds cfg L _).1).trans
    (augTimedLineCredit_bounds cfg L s).2

theorem augTimedLineLoss_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n) :
    Measurable (augTimedLineLoss cfg ε M L) := by
  have he : augTimedLineLoss cfg ε M L = fun x => augTimedLineCredit cfg L x.1 -
      augTimedLineCredit cfg L (augTimedStep cfg ε M x) := by
    funext x
    exact augTimedLineLoss_eq cfg ε M L x.1 x.2
  rw [he]
  exact ((augTimedLineCredit_measurable cfg L).comp measurable_fst).sub
    ((augTimedLineCredit_measurable cfg L).comp (augTimedStep_measurable cfg ε M))

theorem augTimedStep_lineCredit_le {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (s : AugTimedState cfg) (z : (ℝ × Grid n) × ℝ) :
    augTimedLineCredit cfg L (augTimedStep cfg ε M (s,z)) ≤ augTimedLineCredit cfg L s := by
  exact sub_nonneg.mp ((augTimedLineLoss_eq cfg ε M L s z) ▸ augTimedLineLoss_nonneg cfg ε M L s z)

end NoThreeLine

#print axioms NoThreeLine.augTimedLineLoss_eq
#print axioms NoThreeLine.augTimedLineLoss_bounds
#print axioms NoThreeLine.augTimedLineLoss_measurable
#print axioms NoThreeLine.augTimedStep_lineCredit_le
