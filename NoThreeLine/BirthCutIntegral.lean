import NoThreeLine.BirthCalendarCut
import NoThreeLine.CalendarIntegralFubini

/-! The actual terminal point count is compensated by the cut-state rate
on the same original board. The proof uses pathwise endpoint-nullness first,
then the constructed almost-sure completion and bounded Fubini. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped BigOperators NNReal

namespace NoThreeLine.BirthWitness

theorem cutCalendarBirthRate_bounds {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : GoodObservation cfg) (x : BoardClockPath n × ℝ) :
    0≤cutCalendarBirthRate cfg ε M start p hn s x ∧
      cutCalendarBirthRate cfg ε M start p hn s x≤cfg.B/n := by
  let z := cutProcess cfg ε M start hn s (calendarCut s x.2,x.1)
  have hc : 0≤(z.accounts p).credit ∧ (z.accounts p).credit≤cfg.B :=
    sourceCutCredit_bounds cfg ε M start (calendarCut s x.2) (calendarCut s x.2).coe_nonneg hn s p x.1
  have hm0 : 0≤cfg.mask p/n := div_nonneg (cfg.mask_nonneg p) (Nat.cast_nonneg n)
  change 0≤z.birthRate cfg.mask p ∧ z.birthRate cfg.mask p≤cfg.B/n
  constructor
  · rw [ProcessState.birthRate_credit_loss]
    exact mul_nonneg hm0 (sub_nonneg.mpr (z.birthCreditLoss_bounds p hc.1).2)
  · calc
      z.birthRate cfg.mask p≤(cfg.mask p/n)*(z.accounts p).credit :=
        z.birthRate_le_credit cfg.mask p (cfg.mask_nonneg p) hc.1
      _≤(cfg.mask p/n)*cfg.B := mul_le_mul_of_nonneg_left hc.2 hm0
      _≤(1/(n:ℝ))*cfg.B := mul_le_mul_of_nonneg_right
        (div_le_div_of_nonneg_right (hm p) (Nat.cast_nonneg n)) hB.le
      _=cfg.B/n := by ring

theorem terminalBirthCalendarRate_integral_remaining {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : AugTimedState cfg) (ω : BoardClockPath n) :
    (∫t in (0:ℝ)..s.val.2,terminalBirthCalendarRate cfg ε M p hn s (ω,t))=
      terminalBirthRate cfg ε M p hn s ω := by
  let N := augRecycledCompletionIndex cfg ε M hn s ω
  have h := CalendarIntegral.sum_shiftedSegment_integral
    (fun j=>birthCalendarTime cfg ε M hn s j ω) (birthCalendarTime_monotone cfg ε M hn s ω) N
    s.val.2 (by rw [birthCalendarTime_zero]) (birthCalendarTime_le_remaining cfg ε M hn s N ω)
    (fun j t=>cappedBirthRate cfg ε M p ((augRecycledPair cfg ε M hn s j ω).1,t))
    (fun j _=>(cappedBirthRate_measurable cfg ε M p).comp (measurable_const.prodMk measurable_id))
    (cfg.B/n) (div_nonneg hB.le (Nat.cast_nonneg n))
    (fun j _ t _=>cappedBirthRate_bounds cfg ε M p hn hB hm _)
  change (∫t in (0:ℝ)..s.val.2,terminalBirthCalendarRate cfg ε M p hn s (ω,t))=_ at h
  rw [h]
  unfold terminalBirthRate cumulativeBirthRate
  apply Finset.sum_congr rfl
  intro j _
  rw [birthCalendarTime_succ_sub]
  rfl

theorem terminalBirthRate_eq_cut_integral {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : GoodObservation cfg) (ω : BoardClockPath n)
    (hd : AugTimedDone cfg (augRecycledTerminal cfg ε M hn s.val.1 ω)) :
    terminalBirthRate cfg ε M p hn s.val.1 ω=
      ∫t in (0:ℝ)..s.val.1.val.2,cutCalendarBirthRate cfg ε M start p hn s (ω,t) := by
  rw [←terminalBirthCalendarRate_integral_remaining cfg ε M p hn hB hm s.val.1 ω]
  apply intervalIntegral.integral_congr_ae
  simpa only [uIoc_of_le s.val.1.property.2.1] using
    terminalBirthCalendarRate_eq_cut_ae_time cfg ε M start p hn s ω hd

def cutCalendarMeanBirthRate {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (s : GoodObservation cfg) (t : ℝ) : ℝ :=
  ∫ω,cutCalendarBirthRate cfg ε M start p hn s (ω,t) ∂boardClockMeasure n (cfg.B/n)

theorem cutCalendarMeanBirthRate_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 0<cfg.B) (s : GoodObservation cfg) :
    Measurable (cutCalendarMeanBirthRate cfg ε M start p hn s) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  exact ((cutCalendarBirthRate_measurable cfg ε M start p hn s).comp measurable_swap).stronglyMeasurable.integral_prod_right'.measurable

theorem terminalBirthRate_mean_cut {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : GoodObservation cfg) :
    (∫ω,terminalBirthRate cfg ε M p hn s.val.1 ω ∂boardClockMeasure n (cfg.B/n))=
      ∫t in (0:ℝ)..s.val.1.val.2,cutCalendarMeanBirthRate cfg ε M start p hn s t := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  calc
    (∫ω,terminalBirthRate cfg ε M p hn s.val.1 ω ∂boardClockMeasure n (cfg.B/n))=
        ∫ω,(∫t in (0:ℝ)..s.val.1.val.2,cutCalendarBirthRate cfg ε M start p hn s (ω,t))
          ∂boardClockMeasure n (cfg.B/n) := by
      apply integral_congr_ae
      filter_upwards [augRecycledTerminal_done_ae cfg ε M hn hB s.val.1] with ω hd
      exact terminalBirthRate_eq_cut_integral cfg ε M start p hn hB hm s ω hd
    _=_ := CalendarIntegral.expected_interval_integral_swap _ _ s.val.1.property.2.1
      (cutCalendarBirthRate cfg ε M start p hn s) (cutCalendarBirthRate_measurable cfg ε M start p hn s)
      (cfg.B/n) (cutCalendarBirthRate_bounds cfg ε M start p hn hB hm s)

theorem terminal_selectedIndicator_mean_cut {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : GoodObservation cfg) :
    (∫ω,selectedIndicator cfg p (augRecycledTerminal cfg ε M hn s.val.1 ω)
      ∂boardClockMeasure n (cfg.B/n))=selectedIndicator cfg p s.val.1+
        ∫t in (0:ℝ)..s.val.1.val.2,cutCalendarMeanBirthRate cfg ε M start p hn s t := by
  rw [terminal_selectedIndicator_compensation cfg ε M p hn hB hm s.val.1,
    terminalBirthRate_mean_cut cfg ε M start p hn hB hm s]

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.terminalBirthRate_eq_cut_integral
#print axioms NoThreeLine.BirthWitness.terminalBirthRate_mean_cut
#print axioms NoThreeLine.BirthWitness.terminal_selectedIndicator_mean_cut
