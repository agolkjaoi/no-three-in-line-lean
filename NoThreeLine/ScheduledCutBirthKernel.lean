import NoThreeLine.ScheduledCutObservation
import NoThreeLine.BirthCutIntegral
import NoThreeLine.BirthPhaseKernel

/-! An inherited phase's actual integrated birth kernel equals the expected
integral of its deterministic-cut birth rates. This uses the already proved
same-board calendar/cut equality and finite completion, not a stopping-loss
estimate. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness

theorem calendarCut_goodPhaseStart {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (s : GoodPhaseObservation n cfg.B) (t : ℝ) :
    calendarCut (goodPhaseStart cfg ε M s) t=elapsedCutAmount cfg.horizon t := by
  apply Subtype.ext
  change (Real.toNNReal ((cfg.horizon:ℝ)-t):ℝ)=max 0 ((cfg.horizon:ℝ)-t)
  rw [Real.coe_toNNReal',max_comm]

def phaseCutBirthRate {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (p : Grid n) (hn : 0<n)
    (x : (GoodPhaseObservation n cfg.B×BoardClockPath n)×ℝ) : ℝ :=
  (phaseCutObservation cfg ε M start hn ((x.1.1,x.2),x.1.2)).1.val.1.physical.process.birthRate cfg.mask p

theorem phaseCutBirthRate_eq_calendar {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (x : (GoodPhaseObservation n cfg.B×BoardClockPath n)×ℝ) :
    phaseCutBirthRate cfg ε M start p hn x=
      cutCalendarBirthRate cfg ε M start p hn (goodPhaseStart cfg ε M x.1.1) (x.1.2,x.2) := by
  unfold cutCalendarBirthRate
  rw [calendarCut_goodPhaseStart]
  rfl

theorem phaseCutBirthRate_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (p : Grid n) (hn : 0<n) :
    Measurable (phaseCutBirthRate cfg ε M start p hn) := by
  let g : (GoodPhaseObservation n cfg.B×BoardClockPath n)×ℝ→(GoodPhaseObservation n cfg.B×ℝ)×BoardClockPath n :=
    fun x=>((x.1.1,x.2),x.1.2)
  have hg : Measurable g := (measurable_fst.fst.prodMk measurable_snd).prodMk measurable_fst.snd
  have hs := (phaseCutObservation_measurable cfg ε M start hn).comp hg
  exact (process_birthRate_measurable cfg.mask p).comp ((ExtendedState.measurable_process n).comp
    ((AugmentedState.measurable_physical n).comp (measurable_subtype_coe.comp hs.fst).fst))

theorem phaseCutBirthRate_bounds {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (p : Grid n)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (x : (GoodPhaseObservation n cfg.B×BoardClockPath n)×ℝ) :
    0≤phaseCutBirthRate cfg ε M start p hn x ∧ phaseCutBirthRate cfg ε M start p hn x≤cfg.B/n := by
  rw [phaseCutBirthRate_eq_calendar]
  exact cutCalendarBirthRate_bounds cfg ε M start p hn hB hm (goodPhaseStart cfg ε M x.1.1) (x.1.2,x.2)

def phaseCutBirthIntegral {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (p : Grid n) (hn : 0<n)
    (x : GoodPhaseObservation n cfg.B×BoardClockPath n) : ℝ :=
  ∫t in (0:ℝ)..cfg.horizon,phaseCutBirthRate cfg ε M start p hn (x,t)

theorem phaseCutBirthIntegral_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (p : Grid n) (hn : 0<n) :
    Measurable (phaseCutBirthIntegral cfg ε M start p hn) :=
  variable_running_integral_measurable (fun _=>(cfg.horizon:ℝ)) measurable_const (fun _=>cfg.horizon.coe_nonneg)
    (phaseCutBirthRate cfg ε M start p hn) (phaseCutBirthRate_measurable cfg ε M start p hn)

theorem phaseCutBirthIntegral_bounds {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (p : Grid n)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (x : GoodPhaseObservation n cfg.B×BoardClockPath n) :
    0≤phaseCutBirthIntegral cfg ε M start p hn x ∧
      phaseCutBirthIntegral cfg ε M start p hn x≤(cfg.horizon:ℝ)*(cfg.B/n) :=
  integral_initial_segment_bounds cfg.horizon cfg.horizon cfg.horizon.coe_nonneg le_rfl
    (fun t=>phaseCutBirthRate cfg ε M start p hn (x,t))
    ((phaseCutBirthRate_measurable cfg ε M start p hn).comp (measurable_const.prodMk measurable_id))
    (cfg.B/n) (div_nonneg hB.le (Nat.cast_nonneg n))
    (fun t _=>phaseCutBirthRate_bounds cfg ε M start p hn hB hm (x,t))

theorem phaseBirthRate_mean_cutIntegral {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (p : Grid n)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : GoodPhaseObservation n cfg.B) :
    (∫ω,phaseBirthRate cfg ε M p hn (s.val.1,ω) ∂boardClockMeasure n (cfg.B/n))=
      ∫ω,phaseCutBirthIntegral cfg ε M start p hn (s,ω) ∂boardClockMeasure n (cfg.B/n) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  let f : BoardClockPath n×ℝ→ℝ := fun x=>phaseCutBirthRate cfg ε M start p hn ((s,x.1),x.2)
  have hf : Measurable f := (phaseCutBirthRate_measurable cfg ε M start p hn).comp
    ((measurable_const.prodMk measurable_fst).prodMk measurable_snd)
  have hh := CalendarIntegral.expected_interval_integral_swap (boardClockMeasure n (cfg.B/n)) cfg.horizon
    cfg.horizon.coe_nonneg f hf (cfg.B/n) (fun x=>phaseCutBirthRate_bounds cfg ε M start p hn hB hm ((s,x.1),x.2))
  calc
    _=∫t in (0:ℝ)..cfg.horizon,(∫ω,f (ω,t) ∂boardClockMeasure n (cfg.B/n)) := by
      have ht := terminalBirthRate_mean_cut cfg ε M start p hn hB hm (goodPhaseStart cfg ε M s)
      simpa only [f,phaseCutBirthRate_eq_calendar,cutCalendarMeanBirthRate,
        phaseBirthRate,goodPhaseStart,observedPhaseStart,augPhaseStart] using ht
    _=_ := hh.symm

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.phaseCutBirthIntegral_measurable
#print axioms NoThreeLine.BirthWitness.phaseBirthRate_mean_cutIntegral
