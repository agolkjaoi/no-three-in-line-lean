import NoThreeLine.WitnessStepKernel
import NoThreeLine.ObservedRecycledProcess
import NoThreeLine.RecycledHistoryInequality

/-! Instantiate the actual original-board restart law and the proved S7
mean bound on the invariant subtype. No restart or mean estimate is added
as a core assumption. Projection is the existing observed recycled path. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine.BirthWitness

def goodObservedRestartStep {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (x : GoodObservation cfg×BoardClockPath n) : GoodObservation cfg×BoardClockPath n :=
  (goodObservedClockStep cfg ε M start hn x,augResidualBoard cfg ε M hn (x.1.val.1,x.2))

theorem goodObservedRestartStep_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n) :
    Measurable (goodObservedRestartStep cfg ε M start hn) :=
  (goodObservedClockStep_measurable cfg ε M start hn).prodMk
    ((augResidualBoard_measurable cfg ε M hn).comp
      ((measurable_subtype_coe.fst.comp measurable_fst).prodMk measurable_snd))

theorem goodObservedRestartStep_map {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (rate : ℝ) (hr : 0<rate) (s : GoodObservation cfg) :
    (boardClockMeasure n rate).map (fun ω=>goodObservedRestartStep cfg ε M start hn (s,ω))=
      ((boardClockMeasure n rate).map (fun ω=>goodObservedClockStep cfg ε M start hn (s,ω))).prod
        (boardClockMeasure n rate) := by
  apply aug_observation_restart_map cfg ε M hn rate hr s.val.1
    (fun z=>goodObservedStep cfg ε M start (s,z))
    ((goodObservedStep_measurable cfg ε M start).comp (measurable_const.prodMk measurable_id))
  · intro hs z z'
    apply Subtype.ext
    exact (observedStep_frozen cfg ε M start (s.val,z) hs).trans
      (observedStep_frozen cfg ε M start (s.val,z') hs).symm
  · intro z z' hz hz'
    apply Subtype.ext
    exact observedStep_late_eq cfg ε M start s.val z z' hz hz'

theorem goodObservedRecycled_projection {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (s : GoodObservation cfg) (k : ℕ) (ω : BoardClockPath n) :
    ((RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M start hn) s k ω).1.val,
      (RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M start hn) s k ω).2)=
        observedRecycledPair cfg ε M start hn s.val k ω := by
  induction k with
  | zero => rfl
  | succ k ih =>
    change observedRestartStep cfg ε M start hn
      ((RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M start hn) s k ω).1.val,
        (RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M start hn) s k ω).2)=_
    rw [ih]
    rfl

theorem goodMixed_history_estimate {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (hK : cfg.K<2) (hCL : C⊆L) (hCD : Disjoint C D) (s : GoodObservation cfg) (k : ℕ)
    (E : Set (BoardClockPath n))
    (hE : MeasurableSet[StateHistory.filtration
      (RecycledBoardProcess.state (goodObservedRestartStep cfg ε M start hn) s)
      (RecycledBoardProcess.state_measurable _ (goodObservedRestartStep_measurable cfg ε M start hn) s) k] E) :
    (∫ω in E,goodMixed cfg e C D L
      (RecycledBoardProcess.state (goodObservedRestartStep cfg ε M start hn) s (k+1) ω)
      ∂boardClockMeasure n (cfg.B/n))≤
      ∫ω in E,goodUpperMean cfg ε M start e C D L
        (RecycledBoardProcess.state (goodObservedRestartStep cfg ε M start hn) s k ω)
        ∂boardClockMeasure n (cfg.B/n) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  exact RecycledBoardProcess.history_estimate (goodObservedRestartStep cfg ε M start hn)
    (goodObservedRestartStep_measurable cfg ε M start hn) (boardClockMeasure n (cfg.B/n))
    (goodObservedRestartStep_map cfg ε M start hn (cfg.B/n) (div_pos hB (by exact_mod_cast hn)))
    (goodMixed cfg e C D L) (goodUpperMean cfg ε M start e C D L)
    (goodMixed_measurable cfg e C D L) (goodUpperMean_measurable cfg ε M start e C D L)
    (mixedCap C cfg.B) (mixedCap C cfg.B+(cfg.horizon:ℝ)*sourceCap cfg.directions C D cfg.B cfg.K)
    (goodMixed_bounds cfg e C D L) (goodUpperMean_bounds cfg ε M start e C D L hB.le hm hK)
    (goodObservedClockStep_mean cfg ε M start e C D L hn hB hm hK hCL hCD) s k E hE

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.goodObservedRestartStep_map
#print axioms NoThreeLine.BirthWitness.goodObservedRecycled_projection
#print axioms NoThreeLine.BirthWitness.goodMixed_history_estimate
