import NoThreeLine.RootFreezeCalendar
import NoThreeLine.CalendarIntegralFubini

/-! The frozen terminal S7 source is the integral of actual calendar
expectations. The same original board and absolute birth records are used,
and bounded Fubini is proved applicable rather than assumed. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine.BirthWitness

def rootCalendarMeanSource {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n)
    (s : GoodRootObservation cfg p) (t : ℝ) : ℝ :=
  ∫ω,terminalRootCalendarSource cfg ε M start p e C D L hn s (ω,t) ∂boardClockMeasure n (cfg.B/n)

theorem rootCalendarMeanSource_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n)
    (hB : 0<cfg.B) (s : GoodRootObservation cfg p) :
    Measurable (rootCalendarMeanSource cfg ε M start p e C D L hn s) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  exact ((terminalRootCalendarSource_measurable cfg ε M start p e C D L hn s).comp measurable_swap).stronglyMeasurable.integral_prod_right'.measurable

theorem rootCalendarMeanSource_bounds {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n)
    (hB : 0<cfg.B) (s : GoodRootObservation cfg p) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2) (t : ℝ) :
    0≤rootCalendarMeanSource cfg ε M start p e C D L hn s t ∧
      rootCalendarMeanSource cfg ε M start p e C D L hn s t≤sourceCap cfg.directions C D cfg.B cfg.K := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  have hi : Integrable (fun ω=>terminalRootCalendarSource cfg ε M start p e C D L hn s (ω,t))
      (boardClockMeasure n (cfg.B/n)) :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _
      ((terminalRootCalendarSource_measurable cfg ε M start p e C D L hn s).comp
        (measurable_id.prodMk measurable_const)) _
      (fun ω=>terminalRootCalendarSource_bounds cfg ε M start p e C D L hn s hm hK (ω,t))
  constructor
  · exact integral_nonneg (fun ω=>(terminalRootCalendarSource_bounds cfg ε M start p e C D L hn s hm hK (ω,t)).1)
  · have h := integral_mono hi (integrable_const (sourceCap cfg.directions C D cfg.B cfg.K))
      (fun ω=>(terminalRootCalendarSource_bounds cfg ε M start p e C D L hn s hm hK (ω,t)).2)
    simpa only [rootCalendarMeanSource,integral_const,probReal_univ,one_smul] using h

theorem terminalRootRunningSource_mean_eq_timeIntegral {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n)
    (hB : 0<cfg.B) (s : GoodRootObservation cfg p) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2) :
    (∫ω,terminalRootRunningSource cfg ε M start p e C D L hn s ω ∂boardClockMeasure n (cfg.B/n))=
      ∫t in (0:ℝ)..s.val.1.1.val.2,rootCalendarMeanSource cfg ε M start p e C D L hn s t := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  simp_rw [terminalRootRunningSource_eq_timeIntegral cfg ε M start p e C D L hn s hm hK]
  exact CalendarIntegral.expected_interval_integral_swap _ _ s.val.1.1.property.2.1
    (terminalRootCalendarSource cfg ε M start p e C D L hn s)
    (terminalRootCalendarSource_measurable cfg ε M start p e C D L hn s) _
    (terminalRootCalendarSource_bounds cfg ε M start p e C D L hn s hm hK)

theorem terminal_expected_rootMixed_calendar_bound {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (e : Retention n) (C D L : Finset (Grid n))
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2)
    (hCL : C⊆L) (hCD : Disjoint C D) (s : GoodRootObservation cfg p) :
    (∫ω,mixed cfg.directions C D L (rootBoundaryWitness cfg ε M start e p hn s.val ω)
      ∂boardClockMeasure n (cfg.B/n))≤goodRootMixed cfg p e C D L s+
        ∫t in (0:ℝ)..s.val.1.1.val.2,rootCalendarMeanSource cfg ε M start p e C D L hn s t := by
  rw [←terminalRootRunningSource_mean_eq_timeIntegral cfg ε M start p e C D L hn hB s hm hK]
  exact terminal_expected_rootMixed_running_bound cfg ε M start p e C D L hn hB hm hK hCL hCD s

theorem rootPoint_correctedWitness_calendar_bound {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (e : Retention n) (D L : Finset (Grid n))
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2)
    (hL : p∈L) (hD : p∉D) (s : GoodRootObservation cfg p) :
    (∫ω,correctedActiveWitness D L p (rootBoundaryWitness cfg ε M start e p hn s.val ω)
      ∂withinPhasePointMeasure cfg ε M hn s.val.1.1 p)≤goodRootMixed cfg p e {p} D L s+
        ∫t in (0:ℝ)..s.val.1.1.val.2,rootCalendarMeanSource cfg ε M start p e {p} D L hn s t := by
  rw [←terminalRootRunningSource_mean_eq_timeIntegral cfg ε M start p e {p} D L hn hB s hm hK]
  exact rootPoint_correctedWitness_source_bound cfg ε M start p e D L hn hB hm hK hL hD s

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.terminalRootRunningSource_mean_eq_timeIntegral
#print axioms NoThreeLine.BirthWitness.terminal_expected_rootMixed_calendar_bound
#print axioms NoThreeLine.BirthWitness.rootPoint_correctedWitness_calendar_bound
