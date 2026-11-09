import NoThreeLine.WitnessTerminalSource

/-! The source-free and initially-unborn special cases of the actual terminal
S7 theorem. These are genuine original-board process conclusions. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory

namespace NoThreeLine.BirthWitness

theorem runningSource_empty {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C L : Finset (Grid n)) (x : TimedObservation cfg×CandidateData n) :
    runningSource cfg ε M start e C ∅ L x=0 := by
  simp [runningSource,selectedSourceSum,sourceSum]

theorem cumulativeRunningSource_empty {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C L : Finset (Grid n)) (hn : 0<n) (s : GoodObservation cfg) (k : ℕ) (ω : BoardClockPath n) :
    cumulativeRunningSource cfg ε M start e C ∅ L hn s k ω=0 := by
  simp only [cumulativeRunningSource,goodRunningSource,clockRunningSource,runningSource_empty,Finset.sum_const_zero]

theorem terminalRunningSource_empty {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C L : Finset (Grid n)) (hn : 0<n) (s : GoodObservation cfg) (ω : BoardClockPath n) :
    terminalRunningSource cfg ε M start e C ∅ L hn s ω=0 :=
  cumulativeRunningSource_empty cfg ε M start e C L hn s _ ω

theorem terminal_expected_source_free_mixed_le {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (hK : cfg.K<2) (hCL : C⊆L) (s : GoodObservation cfg) :
    (∫ω,mixed cfg.directions C ∅ L (observedWitness cfg e
      (observedRecycledTerminal cfg ε M start hn (s.val,ω))) ∂boardClockMeasure n (cfg.B/n))≤
      goodMixed cfg e C ∅ L s := by
  simpa only [terminalRunningSource_empty,integral_zero,add_zero] using
    terminal_expected_mixed_running_bound cfg ε M start e C ∅ L hn hB hm hK hCL
      (Finset.disjoint_empty_right C) s

theorem terminal_expected_initially_unborn_bound {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (hK : cfg.K<2) (hCL : C⊆L) (hCD : Disjoint C D) (s : GoodObservation cfg)
    (q : Grid n) (hqD : q∈D) (hq : q∉s.val.1.val.1.physical.process.selected) :
    (∫ω,mixed cfg.directions C D L (observedWitness cfg e
      (observedRecycledTerminal cfg ε M start hn (s.val,ω))) ∂boardClockMeasure n (cfg.B/n))≤
        ∫ω,terminalRunningSource cfg ε M start e C D L hn s ω ∂boardClockMeasure n (cfg.B/n) := by
  have hv := observedWitness_valid cfg e s.val s.property.1
  have hz : goodMixed cfg e C D L s=0 := by
    have hq' : (observedWitness cfg e s.val).retained q=0 := hv.2.2 q hq
    unfold goodMixed mixed witnessProduct
    rw [Finset.prod_eq_zero hqD hq',zero_mul]
  simpa only [hz,zero_add] using
    terminal_expected_mixed_running_bound cfg ε M start e C D L hn hB hm hK hCL hCD s

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.terminal_expected_source_free_mixed_le
#print axioms NoThreeLine.BirthWitness.terminal_expected_initially_unborn_bound
