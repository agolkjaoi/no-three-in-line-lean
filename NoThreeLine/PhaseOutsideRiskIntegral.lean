import NoThreeLine.OutsideRiskCut
import NoThreeLine.OutsideRiskCostRegularity
import NoThreeLine.ScheduledCutBirthKernel

/-! The actual outside-risk cost agrees with the cut-rate integral on the
inherited phase-state and residual-board product space. -/
set_option autoImplicit false
set_option maxHeartbeats 1000000
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

def phaseCutOutsideRiskRate {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0 < n) (x : (GoodPhaseObservation n cfg.B × BoardClockPath n) × ℝ) : ℝ :=
  physicalOutsideRisk cfg.directions cfg.mask p
    (phaseCutObservation cfg ε M start hn ((x.1.1,x.2),x.1.2)).1.val.1.physical

theorem phaseCutOutsideRiskRate_eq_calendar {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0 < n) (x : (GoodPhaseObservation n cfg.B × BoardClockPath n) × ℝ) :
    phaseCutOutsideRiskRate cfg ε M start p hn x =
      cutCalendarOutsideRiskRate cfg ε M start p hn (goodPhaseStart cfg ε M x.1.1) (x.1.2,x.2) := by
  unfold cutCalendarOutsideRiskRate
  simp only [calendarCut_goodPhaseStart]
  rfl

theorem phaseCutOutsideRiskRate_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0 < n) : Measurable (phaseCutOutsideRiskRate cfg ε M start p hn) := by
  have hg : Measurable (fun x : (GoodPhaseObservation n cfg.B × BoardClockPath n) × ℝ =>
      ((x.1.1,x.2),x.1.2)) := (measurable_fst.fst.prodMk measurable_snd).prodMk measurable_fst.snd
  have hs := (phaseCutObservation_measurable cfg ε M start hn).comp hg
  exact (physicalOutsideRisk_measurable cfg.directions cfg.mask p).comp
    ((AugmentedState.measurable_physical n).comp (measurable_subtype_coe.comp hs.fst).fst)

theorem phaseCutOutsideRiskRate_bounds {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0 < n) (hB : 0 < cfg.B) (hm : ∀ q, cfg.mask q ≤ 1)
    (x : (GoodPhaseObservation n cfg.B × BoardClockPath n) × ℝ) :
    0 ≤ phaseCutOutsideRiskRate cfg ε M start p hn x ∧
      phaseCutOutsideRiskRate cfg ε M start p hn x ≤ outsideRiskCap cfg.directions p cfg.B := by
  rw [phaseCutOutsideRiskRate_eq_calendar]
  exact cutCalendarOutsideRiskRate_bounds cfg ε M start p hn hB hm (goodPhaseStart cfg ε M x.1.1) (x.1.2,x.2)

def phaseCutOutsideRiskIntegral {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0 < n) (t : ℝ) (x : GoodPhaseObservation n cfg.B × BoardClockPath n) : ℝ :=
  ∫ u in (0 : ℝ)..t, phaseCutOutsideRiskRate cfg ε M start p hn (x,u)

theorem phaseCutOutsideRiskIntegral_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0 < n) (t : ℝ) (ht : 0 ≤ t) :
    Measurable (phaseCutOutsideRiskIntegral cfg ε M start p hn t) :=
  variable_running_integral_measurable (fun _ => t) measurable_const (fun _ => ht)
    (phaseCutOutsideRiskRate cfg ε M start p hn) (phaseCutOutsideRiskRate_measurable cfg ε M start p hn)

def phaseOutsideRiskCost {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (p : Grid n) (hn : 0 < n) (x : GoodPhaseObservation n cfg.B × BoardClockPath n) : ℝ :=
  terminalOutsideRiskCost cfg ε M hn p (augPhaseStart cfg ε M x.1.val.1) x.2

theorem phaseOutsideRiskCost_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (p : Grid n) (hn : 0 < n) : Measurable (phaseOutsideRiskCost cfg ε M p hn) := by
  have hs : Measurable (fun x : GoodPhaseObservation n cfg.B × BoardClockPath n => x.1.val.1) :=
    (measurable_subtype_coe.comp (measurable_fst : Measurable
      (Prod.fst : GoodPhaseObservation n cfg.B × BoardClockPath n → GoodPhaseObservation n cfg.B))).fst
  have hi : Measurable (fun x : GoodPhaseObservation n cfg.B × BoardClockPath n =>
      (augPhaseStart cfg ε M x.1.val.1,x.2)) :=
    ((augPhaseStart_measurable cfg ε M).comp hs).prodMk measurable_snd
  change Measurable ((fun x : AugTimedState cfg × BoardClockPath n =>
    terminalOutsideRiskCost cfg ε M hn p x.1 x.2) ∘
      (fun x : GoodPhaseObservation n cfg.B × BoardClockPath n =>
        (augPhaseStart cfg ε M x.1.val.1,x.2)))
  exact (terminalOutsideRiskCost_joint_measurable cfg ε M hn p).comp hi

theorem phaseOutsideRiskCost_eq_integral_ae {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0 < n) (hB : 0 < cfg.B) (hm : ∀ q, cfg.mask q ≤ 1)
    (s : GoodPhaseObservation n cfg.B) :
    ∀ᵐ ω ∂boardClockMeasure n (cfg.B/n), phaseOutsideRiskCost cfg ε M p hn (s,ω) =
      phaseCutOutsideRiskIntegral cfg ε M start p hn cfg.horizon (s,ω) := by
  have hh := terminalOutsideRiskCost_cut_integral_ae cfg ε M start p hn hB hm (goodPhaseStart cfg ε M s)
  change ∀ᵐ ω ∂boardClockMeasure n (cfg.B/n),
    terminalOutsideRiskCost cfg ε M hn p (augPhaseStart cfg ε M s.val.1) ω =
      ∫ t in (0 : ℝ)..cfg.horizon, cutCalendarOutsideRiskRate cfg ε M start p hn (goodPhaseStart cfg ε M s) (ω,t) at hh
  simpa only [phaseOutsideRiskCost,phaseCutOutsideRiskIntegral,phaseCutOutsideRiskRate_eq_calendar] using hh

theorem phaseOutsideRiskCost_eq_integral_prod_ae {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0 < n) (hB : 0 < cfg.B) (hm : ∀ q, cfg.mask q ≤ 1)
    (μ : Measure (GoodPhaseObservation n cfg.B)) [IsProbabilityMeasure μ] :
    ∀ᵐ x ∂μ.prod (boardClockMeasure n (cfg.B/n)), phaseOutsideRiskCost cfg ε M p hn x =
      phaseCutOutsideRiskIntegral cfg ε M start p hn cfg.horizon x := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  apply (Measure.ae_prod_iff_ae_ae (measurableSet_eq_fun
    (phaseOutsideRiskCost_measurable cfg ε M p hn)
    (phaseCutOutsideRiskIntegral_measurable cfg ε M start p hn cfg.horizon cfg.horizon.coe_nonneg))).mpr
  exact Filter.Eventually.of_forall (fun s => phaseOutsideRiskCost_eq_integral_ae cfg ε M start p hn hB hm s)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.phaseOutsideRiskCost_measurable
#print axioms NoThreeLine.BirthWitness.phaseOutsideRiskCost_eq_integral_ae
#print axioms NoThreeLine.BirthWitness.phaseOutsideRiskCost_eq_integral_prod_ae
