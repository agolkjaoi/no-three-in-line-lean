import NoThreeLine.WitnessCalendarSource
import NoThreeLine.CalendarIntegralFubini

/-! The terminal S7 source is now the time integral of expectations along
the same actual original-board calendar path, with joint measurability and
a uniform pointwise source bound. This is not yet the solved S8 hierarchy. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine.BirthWitness

def calendarMeanSource {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (s : GoodObservation cfg) (t : ℝ) : ℝ :=
  ∫ω,terminalCalendarSource cfg ε M start e C D L hn s (ω,t) ∂boardClockMeasure n (cfg.B/n)

theorem calendarMeanSource_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B) (s : GoodObservation cfg) :
    Measurable (calendarMeanSource cfg ε M start e C D L hn s) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  exact ((terminalCalendarSource_measurable cfg ε M start e C D L hn s).comp measurable_swap).stronglyMeasurable.integral_prod_right'.measurable

theorem calendarMeanSource_bounds {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B) (s : GoodObservation cfg)
    (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2) (t : ℝ) :
    0≤calendarMeanSource cfg ε M start e C D L hn s t ∧
      calendarMeanSource cfg ε M start e C D L hn s t≤sourceCap cfg.directions C D cfg.B cfg.K := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  have hi : Integrable (fun ω=>terminalCalendarSource cfg ε M start e C D L hn s (ω,t))
      (boardClockMeasure n (cfg.B/n)) :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _
      ((terminalCalendarSource_measurable cfg ε M start e C D L hn s).comp
        (measurable_id.prodMk measurable_const)) _
      (fun ω=>terminalCalendarSource_bounds cfg ε M start e C D L hn s hm hK (ω,t))
  constructor
  · exact integral_nonneg (fun ω=>(terminalCalendarSource_bounds cfg ε M start e C D L hn s hm hK (ω,t)).1)
  · have h := integral_mono hi (integrable_const (sourceCap cfg.directions C D cfg.B cfg.K))
      (fun ω=>(terminalCalendarSource_bounds cfg ε M start e C D L hn s hm hK (ω,t)).2)
    simpa only [calendarMeanSource,integral_const,probReal_univ,one_smul] using h

theorem terminalRunningSource_mean_eq_timeIntegral {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B) (s : GoodObservation cfg)
    (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2) :
    (∫ω,terminalRunningSource cfg ε M start e C D L hn s ω ∂boardClockMeasure n (cfg.B/n))=
      ∫t in (0:ℝ)..s.val.1.val.2,calendarMeanSource cfg ε M start e C D L hn s t := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  simp_rw [terminalRunningSource_eq_timeIntegral cfg ε M start e C D L hn s hm hK]
  exact CalendarIntegral.expected_interval_integral_swap _ _ s.val.1.property.2.1
    (terminalCalendarSource cfg ε M start e C D L hn s)
    (terminalCalendarSource_measurable cfg ε M start e C D L hn s) _
    (terminalCalendarSource_bounds cfg ε M start e C D L hn s hm hK)

theorem terminal_expected_mixed_calendar_bound {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (hK : cfg.K<2) (hCL : C⊆L) (hCD : Disjoint C D) (s : GoodObservation cfg) :
    (∫ω,mixed cfg.directions C D L (observedWitness cfg e
      (observedRecycledTerminal cfg ε M start hn (s.val,ω))) ∂boardClockMeasure n (cfg.B/n))≤
      goodMixed cfg e C D L s+
        ∫t in (0:ℝ)..s.val.1.val.2,calendarMeanSource cfg ε M start e C D L hn s t := by
  rw [←terminalRunningSource_mean_eq_timeIntegral cfg ε M start e C D L hn hB s hm hK]
  exact terminal_expected_mixed_running_bound cfg ε M start e C D L hn hB hm hK hCL hCD s

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.calendarMeanSource_bounds
#print axioms NoThreeLine.BirthWitness.terminalRunningSource_mean_eq_timeIntegral
#print axioms NoThreeLine.BirthWitness.terminal_expected_mixed_calendar_bound
