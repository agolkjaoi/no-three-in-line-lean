import NoThreeLine.BoundedSupermartingaleTerminal
import NoThreeLine.WitnessTerminalHierarchyBase
import NoThreeLine.ObservedTerminalLaw

/-! The D-empty actual mixed process is a bounded supermartingale on its
complete original-board observation history, including birth records.
Active-C is not a premise of this all-state result. -/
set_option autoImplicit false
set_option maxHeartbeats 1200000
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter
namespace NoThreeLine.BirthWitness

theorem goodUpperMean_source_free {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (C L : Finset (Grid n)) (s : GoodObservation cfg) :
    goodUpperMean cfg ε M start e C ∅ L s=goodMixed cfg e C ∅ L s := by
  simp [goodUpperMean,stepSourceIntegral,observedSourceIntegral,selectedSourceSum,sourceSum]

theorem goodMixed_source_free_supermartingale {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (C L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2) (hCL : C⊆L) (s : GoodObservation cfg) :
    Supermartingale (fun k ω=>goodMixed cfg e C ∅ L
      (RecycledBoardProcess.state (goodObservedRestartStep cfg ε M start hn) s k ω))
      (StateHistory.filtration (RecycledBoardProcess.state (goodObservedRestartStep cfg ε M start hn) s)
        (RecycledBoardProcess.state_measurable _ (goodObservedRestartStep_measurable cfg ε M start hn) s))
      (boardClockMeasure n (cfg.B/n)) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  apply RecycledBoardProcess.credit_supermartingale (goodObservedRestartStep cfg ε M start hn)
    (goodObservedRestartStep_measurable cfg ε M start hn) (boardClockMeasure n (cfg.B/n))
    (goodObservedRestartStep_map cfg ε M start hn (cfg.B/n) (div_pos hB (by exact_mod_cast hn)))
    (goodMixed cfg e C ∅ L) (goodMixed_measurable cfg e C ∅ L) (mixedCap C cfg.B)
    (goodMixed_bounds cfg e C ∅ L) _ s
  intro a
  simpa only [goodUpperMean_source_free,goodObservedRestartStep] using
    goodObservedClockStep_mean cfg ε M start e C ∅ L hn hB hm hK hCL (Finset.disjoint_empty_right C) a

theorem source_free_terminal_history_le {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (C L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2) (hCL : C⊆L) (s : GoodObservation cfg)
    (k : ℕ) (A : Set (BoardClockPath n))
    (hA : MeasurableSet[StateHistory.filtration
      (RecycledBoardProcess.state (goodObservedRestartStep cfg ε M start hn) s)
      (RecycledBoardProcess.state_measurable _ (goodObservedRestartStep_measurable cfg ε M start hn) s) k] A) :
    (∫ω in A,mixed cfg.directions C ∅ L (observedWitness cfg e
      (observedRecycledTerminal cfg ε M start hn (s.val,ω))) ∂boardClockMeasure n (cfg.B/n))≤
      ∫ω in A,goodMixed cfg e C ∅ L
        (RecycledBoardProcess.state (goodObservedRestartStep cfg ε M start hn) s k ω)
        ∂boardClockMeasure n (cfg.B/n) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  apply supermartingale_terminal_setIntegral_le _ _ _
    (goodMixed_source_free_supermartingale cfg ε M start e C L hn hB hm hK hCL s) (mixedCap C cfg.B) _ _ _ k A hA
  · intro j ω
    have hb := goodMixed_bounds cfg e C ∅ L
      (RecycledBoardProcess.state (goodObservedRestartStep cfg ε M start hn) s j ω)
    simpa only [Real.norm_eq_abs,abs_of_nonneg hb.1] using hb.2
  · filter_upwards [observedRecycledTerminalPair_stable_ae cfg ε M start hn hB s.val] with ω hω
    refine hω.mono (fun j hj=>?_)
    have hp := congrArg Prod.fst (goodObservedRecycled_projection cfg ε M start hn s j ω)
    have ht := congrArg Prod.fst hj
    simp only [Prod.fst] at hp ht
    change mixed cfg.directions C ∅ L (observedWitness cfg e
      (RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M start hn) s j ω).1.val)=_
    rw [hp,ht]
    rfl

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.goodMixed_source_free_supermartingale
#print axioms NoThreeLine.BirthWitness.source_free_terminal_history_le
