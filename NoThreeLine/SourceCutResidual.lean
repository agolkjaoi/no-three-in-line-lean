import NoThreeLine.SourceCutTerminal
import NoThreeLine.ObservedTerminalLaw

/-! The actual cut terminal includes its birth records and an independent
remaining board. This is the restricted-clock terminal law itself; equality
with an uncut future endpoint is not asserted here. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
namespace NoThreeLine.BirthWitness

def sourceCutTerminalPair {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ) (hδ : 0≤δ)
    (hn : 0<n) (s : GoodObservation cfg) (ω : BoardClockPath n) :
    TimedObservation cfg×BoardClockPath n :=
  observedRecycledTerminalPair cfg ε M (start-δ) hn ((sourceRestrictGood cfg δ hδ s).val,ω)

theorem sourceCutTerminalPair_fst {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ) (hδ : 0≤δ)
    (hn : 0<n) (s : GoodObservation cfg) (ω : BoardClockPath n) :
    (sourceCutTerminalPair cfg ε M start δ hδ hn s ω).1=
      sourceCutTerminal cfg ε M start δ hδ hn s ω := rfl

theorem sourceCutTerminalPair_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ) (hδ : 0≤δ)
    (hn : 0<n) (s : GoodObservation cfg) :
    Measurable (sourceCutTerminalPair cfg ε M start δ hδ hn s) :=
  (observedRecycledTerminalPair_measurable cfg ε M (start-δ) hn).comp
    (measurable_const.prodMk measurable_id)

theorem sourceCutTerminalPair_residual_product {n : ℕ} (cfg : FlowConfig n)
    (ε M start δ : ℝ) (hδ : 0≤δ) (hn : 0<n) (hB : 0<cfg.B) (s : GoodObservation cfg) :
    (boardClockMeasure n (cfg.B/n)).map (sourceCutTerminalPair cfg ε M start δ hδ hn s)=
      ((boardClockMeasure n (cfg.B/n)).map (sourceCutTerminal cfg ε M start δ hδ hn s)).prod
        (boardClockMeasure n (cfg.B/n)) :=
  observedRecycledTerminal_residual_product cfg ε M (start-δ) hn hB (sourceRestrictGood cfg δ hδ s).val

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.sourceCutTerminalPair_residual_product
