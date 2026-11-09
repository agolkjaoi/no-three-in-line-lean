import NoThreeLine.BirthCalendarRate
import NoThreeLine.BirthTerminalCard
import NoThreeLine.CalendarIntegralFubini

/-! Expected actual birth counts are the time integral of expected actual
calendar rates. The input process and finite completion are constructed. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness

def calendarMeanBirthRate {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n) (hn : 0<n)
    (s : AugTimedState cfg) (t : ℝ) : ℝ :=
  ∫ω,terminalBirthCalendarRate cfg ε M p hn s (ω,t) ∂boardClockMeasure n (cfg.B/n)

theorem calendarMeanBirthRate_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 0<cfg.B) (s : AugTimedState cfg) :
    Measurable (calendarMeanBirthRate cfg ε M p hn s) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  exact ((terminalBirthCalendarRate_measurable cfg ε M p hn s).comp measurable_swap).stronglyMeasurable.integral_prod_right'.measurable

theorem calendarMeanBirthRate_bounds {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : AugTimedState cfg) (t : ℝ) :
    0≤calendarMeanBirthRate cfg ε M p hn s t ∧ calendarMeanBirthRate cfg ε M p hn s t≤cfg.B/n := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  have hi : Integrable (fun ω=>terminalBirthCalendarRate cfg ε M p hn s (ω,t))
      (boardClockMeasure n (cfg.B/n)) :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _
      ((terminalBirthCalendarRate_measurable cfg ε M p hn s).comp (measurable_id.prodMk measurable_const))
      (cfg.B/n) (fun ω=>terminalBirthCalendarRate_bounds cfg ε M p hn hB hm s (ω,t))
  constructor
  · exact integral_nonneg (fun ω=>(terminalBirthCalendarRate_bounds cfg ε M p hn hB hm s (ω,t)).1)
  · have h := integral_mono hi (integrable_const (cfg.B/n))
      (fun ω=>(terminalBirthCalendarRate_bounds cfg ε M p hn hB hm s (ω,t)).2)
    simpa only [calendarMeanBirthRate,integral_const,probReal_univ,one_smul] using h

theorem terminalBirthRate_mean_calendar {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : AugTimedState cfg) :
    (∫ω,terminalBirthRate cfg ε M p hn s ω ∂boardClockMeasure n (cfg.B/n))=
      ∫t in (0:ℝ)..(cfg.horizon:ℝ),calendarMeanBirthRate cfg ε M p hn s t := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  simp_rw [←terminalBirthCalendarRate_integral cfg ε M p hn hB hm s]
  exact CalendarIntegral.expected_interval_integral_swap _ _ cfg.horizon.coe_nonneg
    (terminalBirthCalendarRate cfg ε M p hn s) (terminalBirthCalendarRate_measurable cfg ε M p hn s)
    (cfg.B/n) (terminalBirthCalendarRate_bounds cfg ε M p hn hB hm s)

theorem terminal_selectedIndicator_mean_calendar {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : AugTimedState cfg) :
    (∫ω,selectedIndicator cfg p (augRecycledTerminal cfg ε M hn s ω) ∂boardClockMeasure n (cfg.B/n))=
      selectedIndicator cfg p s+
        ∫t in (0:ℝ)..(cfg.horizon:ℝ),calendarMeanBirthRate cfg ε M p hn s t := by
  rw [terminal_selectedIndicator_compensation cfg ε M p hn hB hm s,
    terminalBirthRate_mean_calendar cfg ε M p hn hB hm s]

theorem terminal_card_mean_calendar {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : AugTimedState cfg) :
    (∫ω,((augRecycledTerminal cfg ε M hn s ω).val.1.physical.process.selected.card:ℝ)
      ∂boardClockMeasure n (cfg.B/n))=(s.val.1.physical.process.selected.card:ℝ)+
        ∫t in (0:ℝ)..(cfg.horizon:ℝ),∑p : Grid n,calendarMeanBirthRate cfg ε M p hn s t := by
  have hi (p : Grid n) : IntervalIntegrable (calendarMeanBirthRate cfg ε M p hn s) volume 0 (cfg.horizon:ℝ) := by
    apply (intervalIntegrable_iff_integrableOn_Ioo_of_le cfg.horizon.coe_nonneg).mpr
    exact integrableOn_of_nonneg_bound volume (Ioo (0:ℝ) (cfg.horizon:ℝ)) measurableSet_Ioo _
      (calendarMeanBirthRate_measurable cfg ε M p hn hB s) (cfg.B/n)
      (fun t _=>calendarMeanBirthRate_bounds cfg ε M p hn hB hm s t)
  rw [terminal_card_compensation cfg ε M hn hB hm s]
  congr 1
  change (∫ω,∑p : Grid n,terminalBirthRate cfg ε M p hn s ω ∂boardClockMeasure n (cfg.B/n))=_
  rw [integral_finsetSum _ (fun p _=>terminalBirthRate_integrable cfg ε M p hn hB hm s)]
  simp_rw [terminalBirthRate_mean_calendar cfg ε M _ hn hB hm s]
  exact (intervalIntegral.integral_finsetSum (fun p _=>hi p)).symm

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.terminal_selectedIndicator_mean_calendar
#print axioms NoThreeLine.BirthWitness.terminal_card_mean_calendar
