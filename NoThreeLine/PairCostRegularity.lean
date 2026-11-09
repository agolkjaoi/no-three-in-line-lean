import NoThreeLine.PairRateCalendar
import NoThreeLine.RecycledPhaseKernel

/-! Joint measurability and a deterministic finite cap for the actual
terminal eta-rate cost. The cap is for regularity only, not the C3 estimate. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem augTimedPairCost_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (a b : Grid n) :
    Measurable (fun x : AugTimedState cfg×CandidateData n=>augTimedPairCost cfg ε M a b x.1 x.2) := by
  have hm := variable_running_integral_measurable _ (birthElapsed_measurable cfg ε M)
    (fun x=>(birthElapsed_mem cfg ε M x).1)
    (fun x : (AugTimedState cfg×CandidateData n)×ℝ=>cappedPairRate cfg ε M a b (x.1.1,x.2))
    ((cappedPairRate_measurable cfg ε M a b).comp (measurable_fst.fst.prodMk measurable_snd))
  simpa only [augTimedPairCost_capped_integral] using hm

theorem recycledPairCost_joint_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (hn : 0<n) (a b : Grid n) (k : ℕ) :
    Measurable (fun x : AugTimedState cfg×BoardClockPath n=>recycledPairCost cfg ε M hn a b x.1 k x.2) := by
  have hm : Measurable (fun x : AugTimedState cfg×BoardClockPath n=>
      augTimedPairCost cfg ε M a b x.1 (WinnerMarkLaw.firstMarkedRace hn x.2)) :=
    (augTimedPairCost_measurable cfg ε M a b).comp
      (measurable_fst.prodMk ((WinnerMarkLaw.firstMarkedRace_measurable hn).comp measurable_snd))
  exact Finset.measurable_sum _ (fun j _=>hm.comp (augRecycledPair_joint_measurable cfg ε M hn j))

theorem terminalPairCost_joint_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (hn : 0<n) (a b : Grid n) :
    Measurable (fun x : AugTimedState cfg×BoardClockPath n=>terminalPairCost cfg ε M hn a b x.1 x.2) := by
  classical
  exact Measurable.find (recycledPairCost_joint_measurable cfg ε M hn a b)
    (fun k=>(augRecycledCompletionPredicate_joint_measurable cfg ε M hn k).setOf)
    (fun x : AugTimedState cfg×BoardClockPath n=>augRecycledCompletionPredicate_exists cfg ε M hn x.1 x.2)

theorem recycledPairCost_monotone {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (hn : 0<n) (a b : Grid n) (s : AugTimedState cfg) (ω : BoardClockPath n) :
    Monotone (fun k=>recycledPairCost cfg ε M hn a b s k ω) := by
  intro j k hjk
  exact Finset.sum_le_sum_of_subset_of_nonneg (Finset.range_mono hjk)
    (fun _ _ _=>augTimedPairCost_nonneg cfg ε M a b _ _)

theorem terminalPairCost_nonneg {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (hn : 0<n) (a b : Grid n) (s : AugTimedState cfg) (ω : BoardClockPath n) :
    0≤terminalPairCost cfg ε M hn a b s ω := recycledPairCost_nonneg cfg ε M hn a b s _ ω

theorem terminalPairCost_bounds {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (hn : 0<n) (a b : Grid n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : AugTimedState cfg) (ω : BoardClockPath n) :
    0≤terminalPairCost cfg ε M hn a b s ω ∧
      terminalPairCost cfg ε M hn a b s ω≤s.val.2*pairRateCap n cfg.B := by
  rw [←terminalPairCalendarRate_integral cfg ε M a b hn hB hm s ω]
  exact integral_initial_segment_bounds s.val.2 s.val.2 s.property.2.1 le_rfl _
    ((terminalPairCalendarRate_measurable cfg ε M a b hn s).comp (measurable_const.prodMk measurable_id))
    _ (pairRateCap_nonneg n cfg.B hB.le)
    (fun t _=>terminalPairCalendarRate_bounds cfg ε M a b hn hB hm s (ω,t))

end NoThreeLine

#print axioms NoThreeLine.terminalPairCost_joint_measurable
#print axioms NoThreeLine.recycledPairCost_monotone
#print axioms NoThreeLine.terminalPairCost_bounds
