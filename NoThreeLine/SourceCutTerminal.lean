import NoThreeLine.SourcePrefixRestriction
import NoThreeLine.WitnessCalendarExpectation

/-! The actual same-cfg process with a reduced remaining time has the proved
terminal credit and S7 laws. Identification with the uncut path at the final
cut interval is a separate obligation; no such equality is assumed here. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine.BirthWitness

def sourceCutTerminal {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ) (hδ : 0≤δ)
    (hn : 0<n) (s : GoodObservation cfg) (ω : BoardClockPath n) : TimedObservation cfg :=
  observedRecycledTerminal cfg ε M (start-δ) hn ((sourceRestrictGood cfg δ hδ s).val,ω)

theorem sourceCutTerminal_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ) (hδ : 0≤δ)
    (hn : 0<n) (s : GoodObservation cfg) :
    Measurable (sourceCutTerminal cfg ε M start δ hδ hn s) :=
  (observedRecycledTerminal_measurable cfg ε M (start-δ) hn).comp (measurable_const.prodMk measurable_id)

theorem sourceCutTerminal_consistent {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ) (hδ : 0≤δ)
    (hn : 0<n) (s : GoodObservation cfg) (ω : BoardClockPath n) :
    RecordsConsistent cfg (sourceCutTerminal cfg ε M start δ hδ hn s ω) :=
  observedRecycledTerminal_consistent cfg ε M (start-δ) hn _ (sourceRestrictGood cfg δ hδ s).property.1

theorem sourceCutTerminal_expected_credit {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ) (hδ : 0≤δ)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : GoodObservation cfg) (p : Grid n) :
    (∫ω,augTimedCredit cfg p (sourceCutTerminal cfg ε M start δ hδ hn s ω).1
      ∂boardClockMeasure n (cfg.B/n))=augTimedCredit cfg p s.val.1 :=
  observedRecycledTerminal_expected_credit cfg ε M (start-δ) hn hB hm
    (sourceRestrictGood cfg δ hδ s).val p

theorem sourceCutTerminal_expected_credit_one {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ) (hδ : 0≤δ)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : GoodObservation cfg) (p : Grid n)
    (hp : augTimedCredit cfg p s.val.1=1) :
    (∫ω,augTimedCredit cfg p (sourceCutTerminal cfg ε M start δ hδ hn s ω).1
      ∂boardClockMeasure n (cfg.B/n))=1 := by
  rw [sourceCutTerminal_expected_credit cfg ε M start δ hδ hn hB hm s p,hp]

theorem sourceCutTerminal_expected_mixed_bound {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ) (hδ : 0≤δ)
    (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2) (hCL : C⊆L) (hCD : Disjoint C D)
    (s : GoodObservation cfg) :
    (∫ω,mixed cfg.directions C D L (observedWitness cfg e (sourceCutTerminal cfg ε M start δ hδ hn s ω))
      ∂boardClockMeasure n (cfg.B/n))≤goodMixed cfg e C D L s+
      ∫t in (0:ℝ)..max 0 (s.val.1.val.2-δ),
        calendarMeanSource cfg ε M (start-δ) e C D L hn (sourceRestrictGood cfg δ hδ s) t := by
  exact terminal_expected_mixed_calendar_bound cfg ε M (start-δ) e C D L hn hB hm hK hCL hCD
    (sourceRestrictGood cfg δ hδ s)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.sourceCutTerminal_expected_credit
#print axioms NoThreeLine.BirthWitness.sourceCutTerminal_expected_mixed_bound
