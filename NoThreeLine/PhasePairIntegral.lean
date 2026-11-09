import NoThreeLine.PairRateCut
import NoThreeLine.PairCostRegularity
import NoThreeLine.ScheduledCutBirthKernel

/-! The actual pair-rate cost agrees with the cut-rate integral on the
inherited phase-state and residual-board product space. -/
set_option autoImplicit false
set_option maxHeartbeats 1000000
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

def phaseCutPairRate {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (a b : Grid n) (hn : 0 < n) (x : (GoodPhaseObservation n cfg.B × BoardClockPath n) × ℝ) : ℝ :=
  physicalPairRate cfg.directions cfg.mask a b
    (phaseCutObservation cfg ε M start hn ((x.1.1,x.2),x.1.2)).1.val.1.physical

theorem phaseCutPairRate_eq_calendar {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (a b : Grid n) (hn : 0 < n) (x : (GoodPhaseObservation n cfg.B × BoardClockPath n) × ℝ) :
    phaseCutPairRate cfg ε M start a b hn x =
      cutCalendarPairRate cfg ε M start a b hn (goodPhaseStart cfg ε M x.1.1) (x.1.2,x.2) := by
  unfold cutCalendarPairRate
  simp only [calendarCut_goodPhaseStart]
  rfl

theorem phaseCutPairRate_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (a b : Grid n) (hn : 0 < n) : Measurable (phaseCutPairRate cfg ε M start a b hn) := by
  have hg : Measurable (fun x : (GoodPhaseObservation n cfg.B × BoardClockPath n) × ℝ =>
      ((x.1.1,x.2),x.1.2)) := (measurable_fst.fst.prodMk measurable_snd).prodMk measurable_fst.snd
  have hs := (phaseCutObservation_measurable cfg ε M start hn).comp hg
  exact (physicalPairRate_measurable cfg.directions cfg.mask a b).comp
    ((AugmentedState.measurable_physical n).comp (measurable_subtype_coe.comp hs.fst).fst)

theorem phaseCutPairRate_bounds {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (a b : Grid n) (hn : 0 < n) (hB : 0 < cfg.B) (hm : ∀ q, cfg.mask q ≤ 1)
    (x : (GoodPhaseObservation n cfg.B × BoardClockPath n) × ℝ) :
    0 ≤ phaseCutPairRate cfg ε M start a b hn x ∧
      phaseCutPairRate cfg ε M start a b hn x ≤ pairRateCap n cfg.B := by
  rw [phaseCutPairRate_eq_calendar]
  exact cutCalendarPairRate_bounds cfg ε M start a b hn hB hm (goodPhaseStart cfg ε M x.1.1) (x.1.2,x.2)

def phaseCutPairIntegral {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (a b : Grid n) (hn : 0 < n) (t : ℝ) (x : GoodPhaseObservation n cfg.B × BoardClockPath n) : ℝ :=
  ∫ u in (0 : ℝ)..t, phaseCutPairRate cfg ε M start a b hn (x,u)

theorem phaseCutPairIntegral_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (a b : Grid n) (hn : 0 < n) (t : ℝ) (ht : 0 ≤ t) :
    Measurable (phaseCutPairIntegral cfg ε M start a b hn t) :=
  variable_running_integral_measurable (fun _ => t) measurable_const (fun _ => ht)
    (phaseCutPairRate cfg ε M start a b hn) (phaseCutPairRate_measurable cfg ε M start a b hn)

def phasePairCost {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (a b : Grid n) (hn : 0 < n) (x : GoodPhaseObservation n cfg.B × BoardClockPath n) : ℝ :=
  terminalPairCost cfg ε M hn a b (augPhaseStart cfg ε M x.1.val.1) x.2

theorem phasePairCost_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (a b : Grid n) (hn : 0 < n) : Measurable (phasePairCost cfg ε M a b hn) := by
  have hs : Measurable (fun x : GoodPhaseObservation n cfg.B × BoardClockPath n => x.1.val.1) :=
    (measurable_subtype_coe.comp (measurable_fst : Measurable
      (Prod.fst : GoodPhaseObservation n cfg.B × BoardClockPath n → GoodPhaseObservation n cfg.B))).fst
  have hi : Measurable (fun x : GoodPhaseObservation n cfg.B × BoardClockPath n =>
      (augPhaseStart cfg ε M x.1.val.1,x.2)) :=
    ((augPhaseStart_measurable cfg ε M).comp hs).prodMk measurable_snd
  change Measurable ((fun x : AugTimedState cfg × BoardClockPath n =>
    terminalPairCost cfg ε M hn a b x.1 x.2) ∘
      (fun x : GoodPhaseObservation n cfg.B × BoardClockPath n =>
        (augPhaseStart cfg ε M x.1.val.1,x.2)))
  exact (terminalPairCost_joint_measurable cfg ε M hn a b).comp hi

theorem phasePairCost_eq_integral_ae {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (a b : Grid n) (hn : 0 < n) (hB : 0 < cfg.B) (hm : ∀ q, cfg.mask q ≤ 1)
    (s : GoodPhaseObservation n cfg.B) :
    ∀ᵐ ω ∂boardClockMeasure n (cfg.B/n), phasePairCost cfg ε M a b hn (s,ω) =
      phaseCutPairIntegral cfg ε M start a b hn cfg.horizon (s,ω) := by
  have hh := terminalPairCost_cut_integral_ae cfg ε M start a b hn hB hm (goodPhaseStart cfg ε M s)
  change ∀ᵐ ω ∂boardClockMeasure n (cfg.B/n),
    terminalPairCost cfg ε M hn a b (augPhaseStart cfg ε M s.val.1) ω =
      ∫ t in (0 : ℝ)..cfg.horizon, cutCalendarPairRate cfg ε M start a b hn (goodPhaseStart cfg ε M s) (ω,t) at hh
  simpa only [phasePairCost,phaseCutPairIntegral,phaseCutPairRate_eq_calendar] using hh

theorem phasePairCost_eq_integral_prod_ae {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (a b : Grid n) (hn : 0 < n) (hB : 0 < cfg.B) (hm : ∀ q, cfg.mask q ≤ 1)
    (μ : Measure (GoodPhaseObservation n cfg.B)) [IsProbabilityMeasure μ] :
    ∀ᵐ x ∂μ.prod (boardClockMeasure n (cfg.B/n)), phasePairCost cfg ε M a b hn x =
      phaseCutPairIntegral cfg ε M start a b hn cfg.horizon x := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  apply (Measure.ae_prod_iff_ae_ae (measurableSet_eq_fun
    (phasePairCost_measurable cfg ε M a b hn)
    (phaseCutPairIntegral_measurable cfg ε M start a b hn cfg.horizon cfg.horizon.coe_nonneg))).mpr
  exact Filter.Eventually.of_forall (fun s => phasePairCost_eq_integral_ae cfg ε M start a b hn hB hm s)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.phasePairCost_measurable
#print axioms NoThreeLine.BirthWitness.phasePairCost_eq_integral_ae
#print axioms NoThreeLine.BirthWitness.phasePairCost_eq_integral_prod_ae
