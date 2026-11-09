import NoThreeLine.BoundedSupermartingaleTest
import NoThreeLine.WitnessSourceFreeHistory

/-! Actual source-free terminal mixed bound against a complete old-history
test. The test is not reconstructed from later physical state. -/
set_option autoImplicit false
set_option maxHeartbeats 1000000
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter
namespace NoThreeLine.BirthWitness

theorem source_free_terminal_history_test_le {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (C L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2) (hCL : C⊆L) (s : GoodObservation cfg) (k : ℕ)
    (F : BoardClockPath n→ℝ)
    (hF : @Measurable (BoardClockPath n) ℝ (StateHistory.filtration
      (RecycledBoardProcess.state (goodObservedRestartStep cfg ε M start hn) s)
      (RecycledBoardProcess.state_measurable _ (goodObservedRestartStep_measurable cfg ε M start hn) s) k)
      inferInstance F) (A : ℝ) (hFA : ∀ω,0≤F ω ∧ F ω≤A) :
    (∫ω,mixed cfg.directions C ∅ L (observedWitness cfg e
      (observedRecycledTerminal cfg ε M start hn (s.val,ω)))*F ω ∂boardClockMeasure n (cfg.B/n))≤
      ∫ω,goodMixed cfg e C ∅ L
        (RecycledBoardProcess.state (goodObservedRestartStep cfg ε M start hn) s k ω)*F ω
        ∂boardClockMeasure n (cfg.B/n) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  apply supermartingale_terminal_test_le _ _ _
    (goodMixed_source_free_supermartingale cfg ε M start e C L hn hB hm hK hCL s) (mixedCap C cfg.B)
    (fun j ω=>goodMixed_bounds cfg e C ∅ L _) _ _ k F hF A hFA
  filter_upwards [observedRecycledTerminalPair_stable_ae cfg ε M start hn hB s.val] with ω hω
  refine hω.mono (fun j hj=>?_)
  have hp := congrArg Prod.fst (goodObservedRecycled_projection cfg ε M start hn s j ω)
  have ht := congrArg Prod.fst hj
  simp only [Prod.fst] at hp ht
  change mixed cfg.directions C ∅ L (observedWitness cfg e
    (RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M start hn) s j ω).1.val)=_
  rw [hp,ht]
  rfl

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.source_free_terminal_history_test_le
