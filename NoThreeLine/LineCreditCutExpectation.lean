import NoThreeLine.LineCreditCut
import NoThreeLine.WithinPhasePointLaw

/-! Expected physical line-credit loss under the actual terminal point
law is the integral of the same law's actual cut-rate expectations. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem terminalLineCredit_decrement_cut_integral_ae {n : ℕ} (cfg : FlowConfig n)
    (ε M start : ℝ) (L : LineIndex n) (hn : 0 < n) (hB : 0 < cfg.B) (hm : ∀ q, cfg.mask q ≤ 1)
    (s : GoodObservation cfg) :
    ∀ᵐ ω ∂boardClockMeasure n (cfg.B/n),
      augTimedLineCredit cfg L s.val.1 - augTimedLineCredit cfg L (augRecycledTerminal cfg ε M hn s.val.1 ω) =
        ∫ t in (0 : ℝ)..s.val.1.val.2, cutCalendarLineCreditRate cfg ε M start L hn s (ω,t) := by
  filter_upwards [augRecycledTerminal_done_ae cfg ε M hn hB s.val.1] with ω hd
  exact terminalLineCredit_decrement_cut_integral cfg ε M start L hn hB hm s ω hd

theorem lineCredit_decrement_mean_cut {n : ℕ} (cfg : FlowConfig n)
    (ε M start : ℝ) (L : LineIndex n) (hn : 0 < n) (hB : 0 < cfg.B) (hm : ∀ q, cfg.mask q ≤ 1)
    (s : GoodObservation cfg) (μ : Measure (BoardClockPath n)) [IsFiniteMeasure μ]
    (hμ : μ ≪ boardClockMeasure n (cfg.B/n)) :
    (∫ ω, augTimedLineCredit cfg L s.val.1 -
      augTimedLineCredit cfg L (augRecycledTerminal cfg ε M hn s.val.1 ω) ∂μ) =
        ∫ t in (0 : ℝ)..s.val.1.val.2, ∫ ω, cutCalendarLineCreditRate cfg ε M start L hn s (ω,t) ∂μ := by
  calc
    _ = ∫ ω, (∫ t in (0 : ℝ)..s.val.1.val.2, cutCalendarLineCreditRate cfg ε M start L hn s (ω,t)) ∂μ :=
      integral_congr_ae (hμ.ae_le (terminalLineCredit_decrement_cut_integral_ae cfg ε M start L hn hB hm s))
    _ = _ := CalendarIntegral.expected_interval_integral_swap μ _ s.val.1.property.2.1
      (cutCalendarLineCreditRate cfg ε M start L hn s)
      (cutCalendarLineCreditRate_measurable cfg ε M start L hn s) ((L.val.card : ℝ) * (cfg.B/n))
      (cutCalendarLineCreditRate_bounds cfg ε M start L hn hB hm s)

theorem withinPhasePoint_lineCredit_decrement_mean_cut {n : ℕ} (cfg : FlowConfig n)
    (ε M start : ℝ) (L : LineIndex n) (hn : 0 < n) (hB : 0 < cfg.B) (hm : ∀ q, cfg.mask q ≤ 1)
    (s : GoodObservation cfg) (p : Grid n) :
    (∫ ω, augTimedLineCredit cfg L s.val.1 -
      augTimedLineCredit cfg L (augRecycledTerminal cfg ε M hn s.val.1 ω)
        ∂withinPhasePointMeasure cfg ε M hn s.val.1 p) =
      ∫ t in (0 : ℝ)..s.val.1.val.2, ∫ ω, cutCalendarLineCreditRate cfg ε M start L hn s (ω,t)
        ∂withinPhasePointMeasure cfg ε M hn s.val.1 p := by
  letI : IsFiniteMeasure (withinPhasePointMeasure cfg ε M hn s.val.1 p) := by
    constructor
    rw [withinPhasePointMeasure_mass cfg ε M hn hB hm s.val.1 p]
    exact ENNReal.ofReal_lt_top
  exact lineCredit_decrement_mean_cut cfg ε M start L hn hB hm s _
    (withinPhasePointMeasure_absolutelyContinuous cfg ε M hn s.val.1 p)

end NoThreeLine

#print axioms NoThreeLine.terminalLineCredit_decrement_cut_integral_ae
#print axioms NoThreeLine.lineCredit_decrement_mean_cut
#print axioms NoThreeLine.withinPhasePoint_lineCredit_decrement_mean_cut
