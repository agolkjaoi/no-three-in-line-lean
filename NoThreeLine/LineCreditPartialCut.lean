import NoThreeLine.LineCreditCutExpectation
import NoThreeLine.SourceNestedCut

/-! Line-credit loss at an actual interior deterministic cut equals the
original-board rate integral up to that cut. The nested-cut identity keeps
the same state, records, deadlines and board; completion is only asserted a.e. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem cutCalendarLineCreditRate_restrict {n : ℕ} (cfg : FlowConfig n)
    (ε M start : ℝ) (L : LineIndex n) (hn : 0 < n) (s : GoodObservation cfg)
    (δ : ℝ) (hδ : 0 ≤ δ) (hδR : δ ≤ s.val.1.val.2) (ω : BoardClockPath n)
    (u : ℝ) (hu : u ≤ s.val.1.val.2-δ) :
    cutCalendarLineCreditRate cfg ε M (start-δ) L hn (sourceRestrictGood cfg δ hδ s) (ω,u) =
      cutCalendarLineCreditRate cfg ε M start L hn s (ω,u) := by
  let s' := sourceRestrictGood cfg δ hδ s
  have hr : s'.val.1.val.2 = s.val.1.val.2-δ := max_eq_right (sub_nonneg.mpr hδR)
  have hcu : (calendarCut s u : ℝ) = s.val.1.val.2-u := by
    linarith [calendarCut_time s u (by linarith : u ≤ s.val.1.val.2)]
  have hcu' : (calendarCut s' u : ℝ) = s.val.1.val.2-δ-u := by
    have hh := calendarCut_time s' u (by rw [hr]; exact hu)
    rw [hr] at hh
    linarith
  have he := sourceCutTerminal_nested_at cfg ε M start δ u hδ hn s ω hδR hu
  unfold cutCalendarLineCreditRate
  change physicalLineCreditRate cfg.directions cfg.mask L
      (sourceCutTerminal cfg ε M (start-δ) (calendarCut s' u) (calendarCut s' u).coe_nonneg hn s' ω).1.val.1.physical = _
  simp only [hcu',hcu]
  exact congrArg (fun v : TimedObservation cfg =>
    physicalLineCreditRate cfg.directions cfg.mask L v.1.val.1.physical) he

theorem sourceCutLineCredit_decrement_integral {n : ℕ} (cfg : FlowConfig n)
    (ε M start : ℝ) (L : LineIndex n) (hn : 0 < n) (hB : 0 < cfg.B) (hm : ∀ q, cfg.mask q ≤ 1)
    (s : GoodObservation cfg) (δ : ℝ) (hδ : 0 ≤ δ) (hδR : δ ≤ s.val.1.val.2)
    (ω : BoardClockPath n)
    (hd : AugTimedDone cfg (augRecycledTerminal cfg ε M hn (sourceRestrictState cfg δ hδ s.val.1) ω)) :
    augTimedLineCredit cfg L s.val.1 -
      augTimedLineCredit cfg L (sourceCutTerminal cfg ε M start δ hδ hn s ω).1 =
        ∫ u in (0 : ℝ)..(s.val.1.val.2-δ), cutCalendarLineCreditRate cfg ε M start L hn s (ω,u) := by
  let s' := sourceRestrictGood cfg δ hδ s
  have hr : s'.val.1.val.2 = s.val.1.val.2-δ := max_eq_right (sub_nonneg.mpr hδR)
  rw [sourceCutTerminal_base]
  have hh := terminalLineCredit_decrement_cut_integral cfg ε M (start-δ) L hn hB hm s' ω hd
  calc
    _ = ∫ u in (0 : ℝ)..s'.val.1.val.2,
        cutCalendarLineCreditRate cfg ε M (start-δ) L hn s' (ω,u) := hh
    _ = _ := by
      rw [hr]
      apply intervalIntegral.integral_congr
      intro u hu
      rw [uIcc_of_le (sub_nonneg.mpr hδR)] at hu
      exact cutCalendarLineCreditRate_restrict cfg ε M start L hn s δ hδ hδR ω u hu.2

theorem sourceCutLineCredit_decrement_integral_ae {n : ℕ} (cfg : FlowConfig n)
    (ε M start : ℝ) (L : LineIndex n) (hn : 0 < n) (hB : 0 < cfg.B) (hm : ∀ q, cfg.mask q ≤ 1)
    (s : GoodObservation cfg) (δ : ℝ) (hδ : 0 ≤ δ) (hδR : δ ≤ s.val.1.val.2) :
    ∀ᵐ ω ∂boardClockMeasure n (cfg.B/n), augTimedLineCredit cfg L s.val.1 -
      augTimedLineCredit cfg L (sourceCutTerminal cfg ε M start δ hδ hn s ω).1 =
        ∫ u in (0 : ℝ)..(s.val.1.val.2-δ), cutCalendarLineCreditRate cfg ε M start L hn s (ω,u) := by
  filter_upwards [augRecycledTerminal_done_ae cfg ε M hn hB (sourceRestrictState cfg δ hδ s.val.1)] with ω hd
  exact sourceCutLineCredit_decrement_integral cfg ε M start L hn hB hm s δ hδ hδR ω hd

end NoThreeLine

#print axioms NoThreeLine.cutCalendarLineCreditRate_restrict
#print axioms NoThreeLine.sourceCutLineCredit_decrement_integral
#print axioms NoThreeLine.sourceCutLineCredit_decrement_integral_ae
