import NoThreeLine.SourceCutInterval
import NoThreeLine.WitnessCalendarSupport

/-! On an original segment interior, the cut terminal witness is exactly
the witness used by the glued running source, at the common absolute time. -/
set_option autoImplicit false
noncomputable section
open Set

namespace NoThreeLine.BirthWitness

theorem sourceCutTerminal_witness_interior {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ)
    (hδ : 0≤δ) (e : Retention n) (hn : 0<n) (s : GoodObservation cfg)
    (k : ℕ) (ω : BoardClockPath n)
    (ht : s.val.1.val.2-δ ∈ Ioo (elapsedTime cfg ε M start hn s k ω)
      (elapsedTime cfg ε M start hn s (k+1) ω)) :
    observedWitness cfg e (sourceCutTerminal cfg ε M start δ hδ hn s ω)=
      selectedWitnessCurve cfg
        (augTimedInput cfg (RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M start hn) s k ω).1.val.1).1
        (recordedValue e (RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M start hn) s k ω).1.val.2)
        ((s.val.1.val.2-δ)-elapsedTime cfg ε M start hn s k ω) := by
  have hh := sourceCutTerminal_interior cfg ε M start δ hδ hn s k ω ht
  have ha := congrArg Prod.fst hh.1
  dsimp only [observedWitness,selectedWitnessCurve]
  rw [ha,hh.2]

theorem localSource_cutTerminal {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ)
    (hδ : 0≤δ) (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n)
    (s : GoodObservation cfg) (k : ℕ) (ω : BoardClockPath n)
    (ht : s.val.1.val.2-δ ∈ Ioo (elapsedTime cfg ε M start hn s k ω)
      (elapsedTime cfg ε M start hn s (k+1) ω)) :
    localSource cfg ε M start e C D L hn s k ω
      ((s.val.1.val.2-δ)-elapsedTime cfg ε M start hn s k ω)=
      sourceSum (observedWitness cfg e (sourceCutTerminal cfg ε M start δ hδ hn s ω))
        cfg.directions C D L cfg.mask (fun q=>e.value q (start+cfg.horizon-δ)) := by
  rw [localSource_common_absolute_time,←sourceCutTerminal_witness_interior cfg ε M start δ hδ e hn s k ω ht]
  have htime : observationTime cfg start s.val.1+(s.val.1.val.2-δ)=start+cfg.horizon-δ := by
    unfold observationTime
    ring
  rw [htime]

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.sourceCutTerminal_witness_interior
#print axioms NoThreeLine.BirthWitness.localSource_cutTerminal
