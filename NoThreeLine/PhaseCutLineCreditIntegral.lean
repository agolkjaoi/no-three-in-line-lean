import NoThreeLine.LineCreditPartialCut
import NoThreeLine.ScheduledCutBirthKernel

/-! A measurable partial line-credit integral on the actual incoming
phase-state and residual-board product space. Each fixed incoming state
has the exact partial-cut identity almost surely. -/
set_option autoImplicit false
set_option maxHeartbeats 1000000
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

def phaseCutLineCreditRate {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (hn : 0 < n) (x : (GoodPhaseObservation n cfg.B × BoardClockPath n) × ℝ) : ℝ :=
  physicalLineCreditRate cfg.directions cfg.mask L
    (phaseCutObservation cfg ε M start hn ((x.1.1,x.2),x.1.2)).1.val.1.physical

theorem phaseCutLineCreditRate_eq_calendar {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (hn : 0 < n) (x : (GoodPhaseObservation n cfg.B × BoardClockPath n) × ℝ) :
    phaseCutLineCreditRate cfg ε M start L hn x =
      cutCalendarLineCreditRate cfg ε M start L hn (goodPhaseStart cfg ε M x.1.1) (x.1.2,x.2) := by
  unfold cutCalendarLineCreditRate
  simp only [calendarCut_goodPhaseStart]
  rfl

theorem phaseCutLineCreditRate_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (hn : 0 < n) : Measurable (phaseCutLineCreditRate cfg ε M start L hn) := by
  have hg : Measurable (fun x : (GoodPhaseObservation n cfg.B × BoardClockPath n) × ℝ =>
      ((x.1.1,x.2),x.1.2)) := (measurable_fst.fst.prodMk measurable_snd).prodMk measurable_fst.snd
  have hs := (phaseCutObservation_measurable cfg ε M start hn).comp hg
  exact (physicalLineCreditRate_measurable cfg.directions cfg.mask L).comp
    ((AugmentedState.measurable_physical n).comp (measurable_subtype_coe.comp hs.fst).fst)

theorem phaseCutLineCreditRate_bounds {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (hn : 0 < n) (hB : 0 < cfg.B) (hm : ∀ q, cfg.mask q ≤ 1)
    (x : (GoodPhaseObservation n cfg.B × BoardClockPath n) × ℝ) :
    0 ≤ phaseCutLineCreditRate cfg ε M start L hn x ∧
      phaseCutLineCreditRate cfg ε M start L hn x ≤ (L.val.card : ℝ)*(cfg.B/n) := by
  rw [phaseCutLineCreditRate_eq_calendar]
  exact cutCalendarLineCreditRate_bounds cfg ε M start L hn hB hm (goodPhaseStart cfg ε M x.1.1) (x.1.2,x.2)

def phaseCutLineCreditIntegral {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (hn : 0 < n) (t : ℝ) (x : GoodPhaseObservation n cfg.B × BoardClockPath n) : ℝ :=
  ∫ u in (0 : ℝ)..t, phaseCutLineCreditRate cfg ε M start L hn (x,u)

theorem phaseCutLineCreditIntegral_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (hn : 0 < n) (t : ℝ) (ht : 0 ≤ t) :
    Measurable (phaseCutLineCreditIntegral cfg ε M start L hn t) :=
  variable_running_integral_measurable (fun _ => t) measurable_const (fun _ => ht)
    (phaseCutLineCreditRate cfg ε M start L hn) (phaseCutLineCreditRate_measurable cfg ε M start L hn)

def phaseCutLineCreditLoss {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (hn : 0 < n) (t : ℝ) (x : GoodPhaseObservation n cfg.B × BoardClockPath n) : ℝ :=
  augTimedLineCredit cfg L (goodPhaseStart cfg ε M x.1).val.1 -
    augTimedLineCredit cfg L (phaseCutObservation cfg ε M start hn ((x.1,t),x.2)).1

theorem phaseCutLineCreditLoss_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (hn : 0 < n) (t : ℝ) :
    Measurable (phaseCutLineCreditLoss cfg ε M start L hn t) := by
  have hs := ((goodPhaseStart_measurable cfg ε M).comp
    (measurable_fst : Measurable (Prod.fst : GoodPhaseObservation n cfg.B × BoardClockPath n → _))).subtype_val.fst
  have hc : Measurable (fun x : GoodPhaseObservation n cfg.B × BoardClockPath n =>
      phaseCutObservation cfg ε M start hn ((x.1,t),x.2)) :=
    (phaseCutObservation_measurable cfg ε M start hn).comp
    ((measurable_fst.prodMk measurable_const).prodMk measurable_snd)
  exact ((augTimedLineCredit_measurable cfg L).comp hs).sub
    ((augTimedLineCredit_measurable cfg L).comp hc.fst)

theorem phaseCutLineCreditLoss_eq_integral_ae {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (hn : 0 < n) (hB : 0 < cfg.B) (hm : ∀ q, cfg.mask q ≤ 1)
    (s : GoodPhaseObservation n cfg.B) (t : ℝ) (ht : t ∈ Icc (0 : ℝ) cfg.horizon) :
    ∀ᵐ ω ∂boardClockMeasure n (cfg.B/n), phaseCutLineCreditLoss cfg ε M start L hn t (s,ω) =
      phaseCutLineCreditIntegral cfg ε M start L hn t (s,ω) := by
  have hh := sourceCutLineCredit_decrement_integral_ae cfg ε M start L hn hB hm
    (goodPhaseStart cfg ε M s) (cfg.horizon-t) (sub_nonneg.mpr ht.2) (by
      change cfg.horizon-t ≤ (cfg.horizon : ℝ)
      exact sub_le_self _ ht.1)
  filter_upwards [hh] with ω hω
  have he : (cfg.horizon : ℝ)-((cfg.horizon : ℝ)-t)=t := by ring
  change augTimedLineCredit cfg L (goodPhaseStart cfg ε M s).val.1 -
    augTimedLineCredit cfg L (sourceCutTerminal cfg ε M start (cfg.horizon-t) _ hn _ ω).1 =
      ∫ u in (0 : ℝ)..((cfg.horizon : ℝ)-((cfg.horizon : ℝ)-t)),
        cutCalendarLineCreditRate cfg ε M start L hn (goodPhaseStart cfg ε M s) (ω,u) at hω
  rw [he] at hω
  unfold phaseCutLineCreditLoss phaseCutLineCreditIntegral phaseCutObservation
  simp only [elapsedCutAmount_coe _ _ ht.2, phaseCutLineCreditRate_eq_calendar]
  exact hω

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.phaseCutLineCreditIntegral_measurable
#print axioms NoThreeLine.BirthWitness.phaseCutLineCreditLoss_eq_integral_ae
