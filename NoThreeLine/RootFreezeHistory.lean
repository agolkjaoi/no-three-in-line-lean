import NoThreeLine.RootFreezeRunning

/-! The actual frozen-root S7 estimate on every finite observed-history
event. The real elapsed source and its conditional deterministic mean
are identified using the already proved actual residual-board law. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine.BirthWitness

theorem goodRootMixed_history_estimate {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (e : Retention n) (C D L : Finset (Grid n))
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2)
    (hCL : C⊆L) (hCD : Disjoint C D) (s : GoodRootObservation cfg p) (k : ℕ)
    (E : Set (BoardClockPath n))
    (hE : MeasurableSet[StateHistory.filtration
      (RecycledBoardProcess.state (goodRootRestartStep cfg ε M start p hn) s)
      (RecycledBoardProcess.state_measurable _ (goodRootRestartStep_measurable cfg ε M start p hn) s) k] E) :
    (∫ω in E,goodRootMixed cfg p e C D L
      (RecycledBoardProcess.state (goodRootRestartStep cfg ε M start p hn) s (k+1) ω)
      ∂boardClockMeasure n (cfg.B/n))≤
      ∫ω in E,goodRootUpperMean cfg ε M start p e C D L
        (RecycledBoardProcess.state (goodRootRestartStep cfg ε M start p hn) s k ω)
        ∂boardClockMeasure n (cfg.B/n) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  exact RecycledBoardProcess.history_estimate (goodRootRestartStep cfg ε M start p hn)
    (goodRootRestartStep_measurable cfg ε M start p hn) (boardClockMeasure n (cfg.B/n))
    (goodRootRestartStep_map cfg ε M start p hn (cfg.B/n) (div_pos hB (by exact_mod_cast hn)))
    (goodRootMixed cfg p e C D L) (goodRootUpperMean cfg ε M start p e C D L)
    (goodRootMixed_measurable cfg p e C D L) (goodRootUpperMean_measurable cfg ε M start p e C D L)
    (mixedCap C cfg.B) (mixedCap C cfg.B+(cfg.horizon:ℝ)*sourceCap cfg.directions C D cfg.B cfg.K)
    (goodRootMixed_bounds cfg p e C D L) (goodRootUpperMean_bounds cfg ε M start p e C D L hB.le hm hK)
    (goodRootClockStep_mean cfg ε M start p e C D L hn hB hm hK hCL hCD) s k E hE

theorem rootRunningSource_history_mean {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (e : Retention n) (C D L : Finset (Grid n))
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2)
    (s : GoodRootObservation cfg p) (k : ℕ) (E : Set (BoardClockPath n))
    (hE : MeasurableSet[StateHistory.filtration
      (RecycledBoardProcess.state (goodRootRestartStep cfg ε M start p hn) s)
      (RecycledBoardProcess.state_measurable _ (goodRootRestartStep_measurable cfg ε M start p hn) s) k] E) :
    (∫ω in E,goodRootRunningSource cfg ε M start p e C D L hn
      (RecycledBoardProcess.iterate (goodRootRestartStep cfg ε M start p hn) s k ω)
      ∂boardClockMeasure n (cfg.B/n))=
      ∫ω in E,rootStepSource cfg ε M start e C D L
        (RecycledBoardProcess.state (goodRootRestartStep cfg ε M start p hn) s k ω).val
        ∂boardClockMeasure n (cfg.B/n) := by
  let F := goodRootRestartStep cfg ε M start p hn
  have hF : Measurable F := goodRootRestartStep_measurable cfg ε M start p hn
  let ν := boardClockMeasure n (cfg.B/n)
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  change MeasurableSet[MeasurableSpace.comap (StateHistory.history (RecycledBoardProcess.state F s) k) inferInstance] E at hE
  obtain ⟨A,hA,rfl⟩ := hE
  let H := StateHistory.history (RecycledBoardProcess.state F s) k
  have hH : Measurable H := StateHistory.history_measurable _ (RecycledBoardProcess.state_measurable F hF s) k
  letI : IsProbabilityMeasure (ν.map H) := Measure.isProbabilityMeasure_map hH.aemeasurable
  let f : (Fin (k+1)→GoodRootObservation cfg p)×BoardClockPath n→ℝ := fun a=>
    goodRootRunningSource cfg ε M start p e C D L hn (a.1 (Fin.last k),a.2)
  let g : (Fin (k+1)→GoodRootObservation cfg p)→ℝ := fun a=>
    rootStepSource cfg ε M start e C D L (a (Fin.last k)).val
  have hf : Measurable f := (goodRootRunningSource_measurable cfg ε M start p e C D L hn).comp
    (((measurable_pi_apply (Fin.last k)).comp measurable_fst).prodMk measurable_snd)
  have hg : Measurable g := (rootStepSource_measurable cfg ε M start e C D L).comp
    (measurable_subtype_coe.comp (measurable_pi_apply (Fin.last k)))
  have hfi : Integrable f ((ν.map H).prod ν) := GenericCreditIteration.bounded_nonnegative_integrable _ _ hf
    ((cfg.horizon:ℝ)*sourceCap cfg.directions C D cfg.B cfg.K)
    (fun a=>goodRootRunningSource_bounds cfg ε M start p e C D L hn hm hK _)
  exact independent_history_setIntegral ν ν H (fun ω=>(RecycledBoardProcess.iterate F s k ω).2) hH
    (RecycledBoardProcess.iterate_measurable F hF s k).snd
    (RecycledBoardProcess.history_residual_product F hF ν
      (goodRootRestartStep_map cfg ε M start p hn (cfg.B/n) (div_pos hB (by exact_mod_cast hn))) s k)
    f g hf hg hfi
    (fun a=>goodRootRunningSource_mean cfg ε M start p e C D L hn hB hm hK (a (Fin.last k))) A hA

theorem goodRootMixed_running_history_estimate {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (e : Retention n) (C D L : Finset (Grid n))
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2)
    (hCL : C⊆L) (hCD : Disjoint C D) (s : GoodRootObservation cfg p) (k : ℕ)
    (E : Set (BoardClockPath n))
    (hE : MeasurableSet[StateHistory.filtration
      (RecycledBoardProcess.state (goodRootRestartStep cfg ε M start p hn) s)
      (RecycledBoardProcess.state_measurable _ (goodRootRestartStep_measurable cfg ε M start p hn) s) k] E) :
    (∫ω in E,goodRootMixed cfg p e C D L
      (RecycledBoardProcess.state (goodRootRestartStep cfg ε M start p hn) s (k+1) ω)
      ∂boardClockMeasure n (cfg.B/n))≤
      ∫ω in E,goodRootMixed cfg p e C D L
        (RecycledBoardProcess.state (goodRootRestartStep cfg ε M start p hn) s k ω)+
        goodRootRunningSource cfg ε M start p e C D L hn
          (RecycledBoardProcess.iterate (goodRootRestartStep cfg ε M start p hn) s k ω)
        ∂boardClockMeasure n (cfg.B/n) := by
  let F := goodRootRestartStep cfg ε M start p hn
  have hF : Measurable F := goodRootRestartStep_measurable cfg ε M start p hn
  let ν := boardClockMeasure n (cfg.B/n)
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  have hz : Integrable (fun ω=>goodRootMixed cfg p e C D L (RecycledBoardProcess.state F s k ω)) ν :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _
      ((goodRootMixed_measurable cfg p e C D L).comp (RecycledBoardProcess.state_measurable F hF s k))
      (mixedCap C cfg.B) (fun ω=>goodRootMixed_bounds cfg p e C D L _)
  have hq : Integrable (fun ω=>rootStepSource cfg ε M start e C D L (RecycledBoardProcess.state F s k ω).val) ν :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _
      ((rootStepSource_measurable cfg ε M start e C D L).comp
        (measurable_subtype_coe.comp (RecycledBoardProcess.state_measurable F hF s k)))
      ((cfg.horizon:ℝ)*sourceCap cfg.directions C D cfg.B cfg.K)
      (fun ω=>rootStepSource_bounds cfg ε M start e p _ C D L
        (RecycledBoardProcess.state F s k ω).property.1 hB.le hm hK)
  have hi : Integrable (fun ω=>goodRootRunningSource cfg ε M start p e C D L hn (RecycledBoardProcess.iterate F s k ω)) ν :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _
      ((goodRootRunningSource_measurable cfg ε M start p e C D L hn).comp (RecycledBoardProcess.iterate_measurable F hF s k))
      ((cfg.horizon:ℝ)*sourceCap cfg.directions C D cfg.B cfg.K)
      (fun ω=>goodRootRunningSource_bounds cfg ε M start p e C D L hn hm hK _)
  have he := goodRootMixed_history_estimate cfg ε M start p e C D L hn hB hm hK hCL hCD s k E hE
  unfold goodRootUpperMean at he
  rw [integral_add hz.integrableOn hq.integrableOn] at he
  rw [integral_add hz.integrableOn hi.integrableOn,
    rootRunningSource_history_mean cfg ε M start p e C D L hn hB hm hK s k E hE]
  exact he

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.goodRootMixed_history_estimate
#print axioms NoThreeLine.BirthWitness.rootRunningSource_history_mean
#print axioms NoThreeLine.BirthWitness.goodRootMixed_running_history_estimate
