import NoThreeLine.OutsideRiskCalendar
import NoThreeLine.RecycledPhaseKernel

/-! Joint measurability and nonnegative accumulation for the actual
outside-hazard costs used in the weight-growth inequalities. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem augTimedOutsideRiskCost_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n) :
    Measurable (fun x : AugTimedState cfg × CandidateData n => augTimedOutsideRiskCost cfg ε M p x.1 x.2) := by
  have hm := variable_running_integral_measurable _ (birthElapsed_measurable cfg ε M)
    (fun x => (birthElapsed_mem cfg ε M x).1)
    (fun x : (AugTimedState cfg × CandidateData n) × ℝ => cappedOutsideRiskRate cfg ε M p (x.1.1,x.2))
    ((cappedOutsideRiskRate_measurable cfg ε M p).comp (measurable_fst.fst.prodMk measurable_snd))
  simpa only [augTimedOutsideRiskCost_capped_integral] using hm

theorem augTimedOutsideRiskCost_nonneg {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (hB : 0 < cfg.B) (hm : ∀ q, cfg.mask q ≤ 1) (s : AugTimedState cfg) (z : CandidateData n) :
    0 ≤ augTimedOutsideRiskCost cfg ε M p s z := by
  rw [augTimedOutsideRiskCost_capped_integral]
  exact intervalIntegral.integral_nonneg (birthElapsed_mem cfg ε M (s,z)).1
    (fun t _ => (cappedOutsideRiskRate_bounds cfg ε M p hB hm (s,t)).1)

theorem recycledOutsideRiskCost_joint_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (hn : 0 < n) (p : Grid n) (k : ℕ) :
    Measurable (fun x : AugTimedState cfg × BoardClockPath n => recycledOutsideRiskCost cfg ε M hn p x.1 k x.2) := by
  have hm : Measurable (fun x : AugTimedState cfg × BoardClockPath n =>
      augTimedOutsideRiskCost cfg ε M p x.1 (WinnerMarkLaw.firstMarkedRace hn x.2)) :=
    (augTimedOutsideRiskCost_measurable cfg ε M p).comp
      (measurable_fst.prodMk ((WinnerMarkLaw.firstMarkedRace_measurable hn).comp measurable_snd))
  exact Finset.measurable_sum _ (fun j _ => hm.comp (augRecycledPair_joint_measurable cfg ε M hn j))

theorem terminalOutsideRiskCost_joint_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (hn : 0 < n) (p : Grid n) :
    Measurable (fun x : AugTimedState cfg × BoardClockPath n => terminalOutsideRiskCost cfg ε M hn p x.1 x.2) := by
  classical
  exact Measurable.find (recycledOutsideRiskCost_joint_measurable cfg ε M hn p)
    (fun k => (augRecycledCompletionPredicate_joint_measurable cfg ε M hn k).setOf)
    (fun x : AugTimedState cfg × BoardClockPath n => augRecycledCompletionPredicate_exists cfg ε M hn x.1 x.2)

theorem recycledOutsideRiskCost_nonneg {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (hn : 0 < n) (p : Grid n) (hB : 0 < cfg.B) (hm : ∀ q, cfg.mask q ≤ 1)
    (s : AugTimedState cfg) (k : ℕ) (ω : BoardClockPath n) :
    0 ≤ recycledOutsideRiskCost cfg ε M hn p s k ω :=
  Finset.sum_nonneg (fun _ _ => augTimedOutsideRiskCost_nonneg cfg ε M p hB hm _ _)

theorem recycledOutsideRiskCost_monotone {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (hn : 0 < n) (p : Grid n) (hB : 0 < cfg.B) (hm : ∀ q, cfg.mask q ≤ 1)
    (s : AugTimedState cfg) (ω : BoardClockPath n) :
    Monotone (fun k => recycledOutsideRiskCost cfg ε M hn p s k ω) := by
  intro j k hjk
  exact Finset.sum_le_sum_of_subset_of_nonneg (Finset.range_mono hjk)
    (fun _ _ _ => augTimedOutsideRiskCost_nonneg cfg ε M p hB hm _ _)

theorem terminalOutsideRiskCost_nonneg {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (hn : 0 < n) (p : Grid n) (hB : 0 < cfg.B) (hm : ∀ q, cfg.mask q ≤ 1)
    (s : AugTimedState cfg) (ω : BoardClockPath n) :
    0 ≤ terminalOutsideRiskCost cfg ε M hn p s ω :=
  recycledOutsideRiskCost_nonneg cfg ε M hn p hB hm s _ ω

theorem terminalOutsideRiskCost_bounds {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (hn : 0 < n) (p : Grid n) (hB : 0 < cfg.B) (hm : ∀ q, cfg.mask q ≤ 1)
    (s : AugTimedState cfg) (ω : BoardClockPath n) :
    0 ≤ terminalOutsideRiskCost cfg ε M hn p s ω ∧
      terminalOutsideRiskCost cfg ε M hn p s ω ≤ s.val.2 * outsideRiskCap cfg.directions p cfg.B := by
  rw [← terminalOutsideRiskCalendarRate_integral cfg ε M p hn hB hm s ω]
  exact integral_initial_segment_bounds s.val.2 s.val.2 s.property.2.1 le_rfl _
    ((terminalOutsideRiskCalendarRate_measurable cfg ε M p hn s).comp (measurable_const.prodMk measurable_id))
    _ (outsideRiskCap_nonneg cfg.directions p cfg.B hB.le)
    (fun t _ => terminalOutsideRiskCalendarRate_bounds cfg ε M p hn hB hm s (ω,t))

end NoThreeLine

#print axioms NoThreeLine.terminalOutsideRiskCost_joint_measurable
#print axioms NoThreeLine.recycledOutsideRiskCost_monotone
#print axioms NoThreeLine.terminalOutsideRiskCost_bounds
