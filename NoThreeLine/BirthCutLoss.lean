import NoThreeLine.BirthCutIntegral
import NoThreeLine.BirthTerminalCard
import NoThreeLine.CutLossProbability

/-! Exact actual point-count and cardinality decompositions into initial
saved-credit exposure minus unavailable-credit loss. The initial credit is
arbitrary; its tilted measure has mass equal to that credit. Only unit
initial credit makes the loss mass a probability. No small-loss bound is used. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped BigOperators NNReal

namespace NoThreeLine.BirthWitness

theorem cutCalendarMeanBirthRate_loss {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : GoodObservation cfg) (t : ℝ) :
    cutCalendarMeanBirthRate cfg ε M start p hn s t=
      (cfg.mask p/n)*augTimedCredit cfg p s.val.1-
        (cfg.mask p/n)*cutLossProbability cfg ε M start hn s p (calendarCut s t) := by
  simp_rw [cutCalendarMeanBirthRate,cutCalendarBirthRate,ProcessState.birthRate_credit_loss]
  change (∫ω,(cfg.mask p/n)*
    (((cutProcess cfg ε M start hn s (calendarCut s t,ω)).accounts p).credit-
      cutCreditLoss cfg ε M start hn s p (calendarCut s t,ω)) ∂boardClockMeasure n (cfg.B/n))=_
  rw [integral_const_mul,integral_sub (cutCredit_integrable cfg ε M start hn hB s p (calendarCut s t))
    (cutCreditLoss_integrable cfg ε M start hn hB s p (calendarCut s t)),
    ←cutLossProbability_eq_mean cfg ε M start hn hB s p (calendarCut s t)]
  have he : (∫ω,((cutProcess cfg ε M start hn s (calendarCut s t,ω)).accounts p).credit
      ∂boardClockMeasure n (cfg.B/n))=augTimedCredit cfg p s.val.1 :=
    sourceCutTerminal_expected_credit cfg ε M start (calendarCut s t)
      (calendarCut s t).coe_nonneg hn hB hm s p
  rw [he]
  ring

theorem cutLossMass_bounds {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 0<cfg.B) (s : GoodObservation cfg) (δ : ℝ≥0) :
    0≤cutLossProbability cfg ε M start hn s p δ ∧
      cutLossProbability cfg ε M start hn s p δ≤cfg.B := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  rw [cutLossProbability_eq_mean cfg ε M start hn hB s p δ]
  constructor
  · exact integral_nonneg (fun ω=>(cutCreditLoss_bounds cfg ε M start hn s p (δ,ω)).1)
  · have h := integral_mono (cutCreditLoss_integrable cfg ε M start hn hB s p δ)
      (integrable_const cfg.B) (fun ω=>(cutCreditLoss_bounds cfg ε M start hn s p (δ,ω)).2)
    simpa only [integral_const,probReal_univ,one_smul] using h

theorem cutCalendarLoss_intervalIntegrable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 0<cfg.B) (s : GoodObservation cfg) :
    IntervalIntegrable (fun t=>(cfg.mask p/n)*cutLossProbability cfg ε M start hn s p (calendarCut s t))
      volume 0 s.val.1.val.2 := by
  have hi : IntervalIntegrable (fun t=>cutLossProbability cfg ε M start hn s p (calendarCut s t))
      volume 0 s.val.1.val.2 := by
    apply (intervalIntegrable_iff_integrableOn_Ioo_of_le s.val.1.property.2.1).mpr
    exact integrableOn_of_nonneg_bound volume (Ioo (0:ℝ) s.val.1.val.2) measurableSet_Ioo _
      ((cutLossProbability_measurable cfg ε M start hn hB s p).comp (calendarCut_measurable s))
      cfg.B (fun t _=>cutLossMass_bounds cfg ε M start p hn hB s (calendarCut s t))
  exact hi.const_mul _

def integratedCutLoss {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (s : GoodObservation cfg) : ℝ :=
  ∫t in (0:ℝ)..s.val.1.val.2,
    (cfg.mask p/n)*cutLossProbability cfg ε M start hn s p (calendarCut s t)

theorem terminalBirthRate_mean_loss {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : GoodObservation cfg) :
    (∫ω,terminalBirthRate cfg ε M p hn s.val.1 ω ∂boardClockMeasure n (cfg.B/n))=
      s.val.1.val.2*((cfg.mask p/n)*augTimedCredit cfg p s.val.1)-
        integratedCutLoss cfg ε M start p hn s := by
  rw [terminalBirthRate_mean_cut cfg ε M start p hn hB hm s]
  simp_rw [cutCalendarMeanBirthRate_loss cfg ε M start p hn hB hm s]
  rw [intervalIntegral.integral_sub intervalIntegrable_const
    (cutCalendarLoss_intervalIntegrable cfg ε M start p hn hB s),intervalIntegral.integral_const]
  simp only [sub_zero,smul_eq_mul,integratedCutLoss]

theorem terminal_selectedIndicator_loss {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : GoodObservation cfg) :
    (∫ω,selectedIndicator cfg p (augRecycledTerminal cfg ε M hn s.val.1 ω)
      ∂boardClockMeasure n (cfg.B/n))=selectedIndicator cfg p s.val.1+
        s.val.1.val.2*((cfg.mask p/n)*augTimedCredit cfg p s.val.1)-
          integratedCutLoss cfg ε M start p hn s := by
  rw [terminal_selectedIndicator_compensation cfg ε M p hn hB hm s.val.1,
    terminalBirthRate_mean_loss cfg ε M start p hn hB hm s]
  ring

theorem terminal_card_loss {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : GoodObservation cfg) :
    (∫ω,((augRecycledTerminal cfg ε M hn s.val.1 ω).val.1.physical.process.selected.card:ℝ)
      ∂boardClockMeasure n (cfg.B/n))=(s.val.1.val.1.physical.process.selected.card:ℝ)+
        s.val.1.val.2*(∑p : Grid n,(cfg.mask p/n)*augTimedCredit cfg p s.val.1)-
          ∑p : Grid n,integratedCutLoss cfg ε M start p hn s := by
  rw [terminal_card_compensation cfg ε M hn hB hm s.val.1]
  change (s.val.1.val.1.physical.process.selected.card:ℝ)+
    (∫ω,∑p : Grid n,terminalBirthRate cfg ε M p hn s.val.1 ω ∂boardClockMeasure n (cfg.B/n))=_
  rw [integral_finsetSum _ (fun p _=>terminalBirthRate_integrable cfg ε M p hn hB hm s.val.1)]
  simp_rw [terminalBirthRate_mean_loss cfg ε M start _ hn hB hm s]
  rw [Finset.sum_sub_distrib,←Finset.mul_sum]
  ring

theorem terminal_card_loss_unit_credit {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : GoodObservation cfg)
    (hs : ∀p,augTimedCredit cfg p s.val.1=1) :
    (∫ω,((augRecycledTerminal cfg ε M hn s.val.1 ω).val.1.physical.process.selected.card:ℝ)
      ∂boardClockMeasure n (cfg.B/n))=(s.val.1.val.1.physical.process.selected.card:ℝ)+
        s.val.1.val.2*(∑p : Grid n,cfg.mask p/n)-
          ∑p : Grid n,integratedCutLoss cfg ε M start p hn s := by
  rw [terminal_card_loss cfg ε M start hn hB hm s]
  simp_rw [hs,mul_one]

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.terminal_selectedIndicator_loss
#print axioms NoThreeLine.BirthWitness.terminal_card_loss
#print axioms NoThreeLine.BirthWitness.terminal_card_loss_unit_credit
