import NoThreeLine.RecycledEtaCost
import NoThreeLine.CappedPairRate
import NoThreeLine.BirthCalendarTime

/-! Glue the actual executed pair-rates on disjoint calendar segments.
The terminal integral is exactly the eta cost, without a segment-count
factor. Endpoint values are zero and do not change the Lebesgue integral. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine
open AuxiliaryODE BirthWitness

def pairRateCalendarSegment {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (a b : Grid n)
    (hn : 0<n) (s : AugTimedState cfg) (k : ℕ) (x : BoardClockPath n×ℝ) : ℝ :=
  CalendarIntegral.shiftedSegment (birthCalendarTime cfg ε M hn s k x.1)
    (birthCalendarTime cfg ε M hn s (k+1) x.1)
    (fun t=>cappedPairRate cfg ε M a b ((augRecycledPair cfg ε M hn s k x.1).1,t)) x.2

theorem pairRateCalendarSegment_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (a b : Grid n) (hn : 0<n) (s : AugTimedState cfg) (k : ℕ) :
    Measurable (pairRateCalendarSegment cfg ε M a b hn s k) := by
  have ha : Measurable (fun x : BoardClockPath n×ℝ=>birthCalendarTime cfg ε M hn s k x.1) :=
    (birthCalendarTime_measurable cfg ε M hn s k).comp measurable_fst
  have hb : Measurable (fun x : BoardClockPath n×ℝ=>birthCalendarTime cfg ε M hn s (k+1) x.1) :=
    (birthCalendarTime_measurable cfg ε M hn s (k+1)).comp measurable_fst
  have hs : Measurable (fun x : BoardClockPath n×ℝ=>(augRecycledPair cfg ε M hn s k x.1).1) :=
    (augRecycledPair_measurable cfg ε M hn s k).fst.comp measurable_fst
  exact Measurable.ite ((ha.lt measurable_snd).and (measurable_snd.lt hb)).setOf
    ((cappedPairRate_measurable cfg ε M a b).comp (hs.prodMk (measurable_snd.sub ha))) measurable_const

def finitePairCalendarRate {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (a b : Grid n)
    (hn : 0<n) (s : AugTimedState cfg) (k : ℕ) (x : BoardClockPath n×ℝ) : ℝ :=
  ∑j∈Finset.range k,pairRateCalendarSegment cfg ε M a b hn s j x

theorem finitePairCalendarRate_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (a b : Grid n) (hn : 0<n) (s : AugTimedState cfg) (k : ℕ) :
    Measurable (finitePairCalendarRate cfg ε M a b hn s k) :=
  Finset.measurable_sum _ (fun j _=>pairRateCalendarSegment_measurable cfg ε M a b hn s j)

theorem finitePairCalendarRate_bounds {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (a b : Grid n) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : AugTimedState cfg) (k : ℕ) (x : BoardClockPath n×ℝ) :
    0≤finitePairCalendarRate cfg ε M a b hn s k x ∧
      finitePairCalendarRate cfg ε M a b hn s k x≤pairRateCap n cfg.B :=
  CalendarIntegral.sum_shiftedSegment_bounds
    (fun j=>birthCalendarTime cfg ε M hn s j x.1) (birthCalendarTime_monotone cfg ε M hn s x.1) k
    (fun j t=>cappedPairRate cfg ε M a b ((augRecycledPair cfg ε M hn s j x.1).1,t))
    (pairRateCap n cfg.B) (pairRateCap_nonneg n cfg.B hB.le)
    (fun j _ t _=>cappedPairRate_bounds cfg ε M a b hB hm _) x.2

theorem finitePairCalendarRate_integral {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (a b : Grid n) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : AugTimedState cfg) (k : ℕ) (ω : BoardClockPath n) :
    (∫t in (0:ℝ)..s.val.2,finitePairCalendarRate cfg ε M a b hn s k (ω,t))=
      recycledPairCost cfg ε M hn a b s k ω := by
  have h := CalendarIntegral.sum_shiftedSegment_integral
    (fun j=>birthCalendarTime cfg ε M hn s j ω) (birthCalendarTime_monotone cfg ε M hn s ω) k
    s.val.2 (by rw [birthCalendarTime_zero])
    (sub_le_self _ (augRecycledPair cfg ε M hn s k ω).1.property.2.1)
    (fun j t=>cappedPairRate cfg ε M a b ((augRecycledPair cfg ε M hn s j ω).1,t))
    (fun j _=>(cappedPairRate_measurable cfg ε M a b).comp (measurable_const.prodMk measurable_id))
    (pairRateCap n cfg.B) (pairRateCap_nonneg n cfg.B hB.le)
    (fun j _ t _=>cappedPairRate_bounds cfg ε M a b hB hm _)
  change (∫t in (0:ℝ)..s.val.2,finitePairCalendarRate cfg ε M a b hn s k (ω,t))=_ at h
  rw [h]
  unfold recycledPairCost
  apply Finset.sum_congr rfl
  intro j _
  rw [birthCalendarTime_succ_sub,augTimedPairCost_capped_integral]

def terminalPairCalendarRate {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (a b : Grid n)
    (hn : 0<n) (s : AugTimedState cfg) (x : BoardClockPath n×ℝ) : ℝ :=
  finitePairCalendarRate cfg ε M a b hn s (augRecycledCompletionIndex cfg ε M hn s x.1) x

theorem terminalPairCalendarRate_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (a b : Grid n) (hn : 0<n) (s : AugTimedState cfg) :
    Measurable (terminalPairCalendarRate cfg ε M a b hn s) := by
  classical
  exact Measurable.find (finitePairCalendarRate_measurable cfg ε M a b hn s)
    (fun k=>((augRecycledCompletionPredicate_measurable cfg ε M hn s k).comp measurable_fst).setOf)
    (fun x : BoardClockPath n×ℝ=>augRecycledCompletionPredicate_exists cfg ε M hn s x.1)

theorem terminalPairCalendarRate_bounds {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (a b : Grid n) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : AugTimedState cfg) (x : BoardClockPath n×ℝ) :
    0≤terminalPairCalendarRate cfg ε M a b hn s x ∧
      terminalPairCalendarRate cfg ε M a b hn s x≤pairRateCap n cfg.B :=
  finitePairCalendarRate_bounds cfg ε M a b hn hB hm s _ x

theorem terminalPairCalendarRate_integral {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (a b : Grid n) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : AugTimedState cfg) (ω : BoardClockPath n) :
    (∫t in (0:ℝ)..s.val.2,terminalPairCalendarRate cfg ε M a b hn s (ω,t))=
      terminalPairCost cfg ε M hn a b s ω :=
  finitePairCalendarRate_integral cfg ε M a b hn hB hm s
    (augRecycledCompletionIndex cfg ε M hn s ω) ω

end NoThreeLine

#print axioms NoThreeLine.finitePairCalendarRate_integral
#print axioms NoThreeLine.terminalPairCalendarRate_measurable
#print axioms NoThreeLine.terminalPairCalendarRate_integral
