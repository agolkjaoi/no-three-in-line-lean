import NoThreeLine.RecycledLineCreditLoss
import NoThreeLine.CappedLineCreditRate
import NoThreeLine.BirthCalendarTime

/-! The physical line-credit decrement is the integral of the actual
rate glued across all original-board segments. Endpoints have value zero. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine
open AuxiliaryODE BirthWitness

def lineCreditCalendarSegment {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (hn : 0 < n) (s : AugTimedState cfg) (k : ℕ) (x : BoardClockPath n × ℝ) : ℝ :=
  CalendarIntegral.shiftedSegment (birthCalendarTime cfg ε M hn s k x.1)
    (birthCalendarTime cfg ε M hn s (k+1) x.1)
      (fun t => cappedLineCreditRate cfg ε M L ((augRecycledPair cfg ε M hn s k x.1).1,t)) x.2

theorem lineCreditCalendarSegment_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hn : 0 < n) (s : AugTimedState cfg) (k : ℕ) :
    Measurable (lineCreditCalendarSegment cfg ε M L hn s k) := by
  have ha : Measurable (fun x : BoardClockPath n × ℝ => birthCalendarTime cfg ε M hn s k x.1) :=
    (birthCalendarTime_measurable cfg ε M hn s k).comp measurable_fst
  have hb : Measurable (fun x : BoardClockPath n × ℝ => birthCalendarTime cfg ε M hn s (k+1) x.1) :=
    (birthCalendarTime_measurable cfg ε M hn s (k+1)).comp measurable_fst
  have hs : Measurable (fun x : BoardClockPath n × ℝ => (augRecycledPair cfg ε M hn s k x.1).1) :=
    (augRecycledPair_measurable cfg ε M hn s k).fst.comp measurable_fst
  exact Measurable.ite ((ha.lt measurable_snd).and (measurable_snd.lt hb)).setOf
    ((cappedLineCreditRate_measurable cfg ε M L).comp (hs.prodMk (measurable_snd.sub ha))) measurable_const

def finiteLineCreditCalendarRate {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (hn : 0 < n) (s : AugTimedState cfg) (k : ℕ) (x : BoardClockPath n × ℝ) : ℝ :=
  ∑ j ∈ Finset.range k, lineCreditCalendarSegment cfg ε M L hn s j x

theorem finiteLineCreditCalendarRate_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hn : 0 < n) (s : AugTimedState cfg) (k : ℕ) :
    Measurable (finiteLineCreditCalendarRate cfg ε M L hn s k) :=
  Finset.measurable_sum _ (fun j _ => lineCreditCalendarSegment_measurable cfg ε M L hn s j)

theorem finiteLineCreditCalendarRate_bounds {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hn : 0 < n) (hB : 0 < cfg.B) (hm : ∀ q, cfg.mask q ≤ 1)
    (s : AugTimedState cfg) (k : ℕ) (x : BoardClockPath n × ℝ) :
    0 ≤ finiteLineCreditCalendarRate cfg ε M L hn s k x ∧
      finiteLineCreditCalendarRate cfg ε M L hn s k x ≤ (L.val.card : ℝ) * (cfg.B/n) :=
  CalendarIntegral.sum_shiftedSegment_bounds
    (fun j => birthCalendarTime cfg ε M hn s j x.1) (birthCalendarTime_monotone cfg ε M hn s x.1) k
    (fun j t => cappedLineCreditRate cfg ε M L ((augRecycledPair cfg ε M hn s j x.1).1,t))
    ((L.val.card : ℝ) * (cfg.B/n)) (by positivity)
    (fun j _ t _ => cappedLineCreditRate_bounds cfg ε M L hn hB hm _) x.2

theorem finiteLineCreditCalendarRate_integral {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hn : 0 < n) (hB : 0 < cfg.B) (hm : ∀ q, cfg.mask q ≤ 1)
    (s : AugTimedState cfg) (k : ℕ) (ω : BoardClockPath n) :
    (∫ t in (0 : ℝ)..s.val.2, finiteLineCreditCalendarRate cfg ε M L hn s k (ω,t)) =
      recycledLineCreditLoss cfg ε M hn L s k ω := by
  have h := CalendarIntegral.sum_shiftedSegment_integral
    (fun j => birthCalendarTime cfg ε M hn s j ω) (birthCalendarTime_monotone cfg ε M hn s ω) k
    s.val.2 (by rw [birthCalendarTime_zero])
    (sub_le_self _ (augRecycledPair cfg ε M hn s k ω).1.property.2.1)
    (fun j t => cappedLineCreditRate cfg ε M L ((augRecycledPair cfg ε M hn s j ω).1,t))
    (fun j _ => (cappedLineCreditRate_measurable cfg ε M L).comp (measurable_const.prodMk measurable_id))
    ((L.val.card : ℝ) * (cfg.B/n)) (by positivity)
    (fun j _ t _ => cappedLineCreditRate_bounds cfg ε M L hn hB hm _)
  change (∫ t in (0 : ℝ)..s.val.2, finiteLineCreditCalendarRate cfg ε M L hn s k (ω,t)) = _ at h
  rw [h]
  unfold recycledLineCreditLoss
  apply Finset.sum_congr rfl
  intro j _
  rw [birthCalendarTime_succ_sub,augTimedLineLoss_capped_integral]

def terminalLineCreditCalendarRate {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (hn : 0 < n) (s : AugTimedState cfg) (x : BoardClockPath n × ℝ) : ℝ :=
  finiteLineCreditCalendarRate cfg ε M L hn s (augRecycledCompletionIndex cfg ε M hn s x.1) x

theorem terminalLineCreditCalendarRate_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hn : 0 < n) (s : AugTimedState cfg) :
    Measurable (terminalLineCreditCalendarRate cfg ε M L hn s) := by
  classical
  exact Measurable.find (finiteLineCreditCalendarRate_measurable cfg ε M L hn s)
    (fun k => ((augRecycledCompletionPredicate_measurable cfg ε M hn s k).comp measurable_fst).setOf)
    (fun x : BoardClockPath n × ℝ => augRecycledCompletionPredicate_exists cfg ε M hn s x.1)

theorem terminalLineCreditCalendarRate_bounds {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hn : 0 < n) (hB : 0 < cfg.B) (hm : ∀ q, cfg.mask q ≤ 1)
    (s : AugTimedState cfg) (x : BoardClockPath n × ℝ) :
    0 ≤ terminalLineCreditCalendarRate cfg ε M L hn s x ∧
      terminalLineCreditCalendarRate cfg ε M L hn s x ≤ (L.val.card : ℝ) * (cfg.B/n) :=
  finiteLineCreditCalendarRate_bounds cfg ε M L hn hB hm s _ x

theorem terminalLineCreditCalendarRate_integral {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hn : 0 < n) (hB : 0 < cfg.B) (hm : ∀ q, cfg.mask q ≤ 1)
    (s : AugTimedState cfg) (ω : BoardClockPath n) :
    (∫ t in (0 : ℝ)..s.val.2, terminalLineCreditCalendarRate cfg ε M L hn s (ω,t)) =
      augTimedLineCredit cfg L s - augTimedLineCredit cfg L (augRecycledTerminal cfg ε M hn s ω) := by
  exact (finiteLineCreditCalendarRate_integral cfg ε M L hn hB hm s _ ω).trans
    (terminalLineCreditLoss_eq cfg ε M hn L s ω)

end NoThreeLine

#print axioms NoThreeLine.finiteLineCreditCalendarRate_integral
#print axioms NoThreeLine.terminalLineCreditCalendarRate_measurable
#print axioms NoThreeLine.terminalLineCreditCalendarRate_bounds
#print axioms NoThreeLine.terminalLineCreditCalendarRate_integral
