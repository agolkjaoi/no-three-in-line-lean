import NoThreeLine.WitnessRunningSource

/-! Replace the conditional deterministic source mean by the real running
source increment on the actual recycled board. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine.BirthWitness

def goodRunningSource {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (x : GoodObservation cfg×BoardClockPath n) : ℝ :=
  clockRunningSource cfg ε M start e C D L hn (x.1.val,x.2)

theorem goodRunningSource_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) : Measurable (goodRunningSource cfg ε M start e C D L hn) :=
  (clockRunningSource_measurable cfg ε M start e C D L hn).comp
    ((measurable_subtype_coe.comp measurable_fst).prodMk measurable_snd)

theorem goodRunningSource_bounds {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2)
    (x : GoodObservation cfg×BoardClockPath n) :
    0≤goodRunningSource cfg ε M start e C D L hn x ∧ goodRunningSource cfg ε M start e C D L hn x≤
      (cfg.horizon:ℝ)*sourceCap cfg.directions C D cfg.B cfg.K :=
  runningSource_bounds cfg ε M start e C D L _ x.1.property.1 hm hK

theorem runningSource_history_mean {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2)
    (s : GoodObservation cfg) (k : ℕ) (E : Set (BoardClockPath n))
    (hE : MeasurableSet[StateHistory.filtration
      (RecycledBoardProcess.state (goodObservedRestartStep cfg ε M start hn) s)
      (RecycledBoardProcess.state_measurable _ (goodObservedRestartStep_measurable cfg ε M start hn) s) k] E) :
    (∫ω in E,goodRunningSource cfg ε M start e C D L hn
      (RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M start hn) s k ω)
      ∂boardClockMeasure n (cfg.B/n))=
      ∫ω in E,stepSourceIntegral cfg ε M start e C D L
        (RecycledBoardProcess.state (goodObservedRestartStep cfg ε M start hn) s k ω).val
        ∂boardClockMeasure n (cfg.B/n) := by
  let F := goodObservedRestartStep cfg ε M start hn
  have hF : Measurable F := goodObservedRestartStep_measurable cfg ε M start hn
  let ν := boardClockMeasure n (cfg.B/n)
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  change MeasurableSet[MeasurableSpace.comap (StateHistory.history (RecycledBoardProcess.state F s) k) inferInstance] E at hE
  obtain ⟨A,hA,rfl⟩ := hE
  let H := StateHistory.history (RecycledBoardProcess.state F s) k
  have hH : Measurable H := StateHistory.history_measurable _ (RecycledBoardProcess.state_measurable F hF s) k
  letI : IsProbabilityMeasure (ν.map H) := Measure.isProbabilityMeasure_map hH.aemeasurable
  let f : (Fin (k+1)→GoodObservation cfg)×BoardClockPath n→ℝ := fun a=>
    goodRunningSource cfg ε M start e C D L hn (a.1 (Fin.last k),a.2)
  let g : (Fin (k+1)→GoodObservation cfg)→ℝ := fun a=>
    stepSourceIntegral cfg ε M start e C D L (a (Fin.last k)).val
  have hf : Measurable f := (goodRunningSource_measurable cfg ε M start e C D L hn).comp
    (((measurable_pi_apply (Fin.last k)).comp measurable_fst).prodMk measurable_snd)
  have hg : Measurable g := (stepSourceIntegral_measurable cfg ε M start e C D L).comp
    (measurable_subtype_coe.comp (measurable_pi_apply (Fin.last k)))
  have hfi : Integrable f ((ν.map H).prod ν) := GenericCreditIteration.bounded_nonnegative_integrable _ _ hf
    ((cfg.horizon:ℝ)*sourceCap cfg.directions C D cfg.B cfg.K)
    (fun a=>goodRunningSource_bounds cfg ε M start e C D L hn hm hK _)
  exact independent_history_setIntegral ν ν H (fun ω=>(RecycledBoardProcess.iterate F s k ω).2) hH
    (RecycledBoardProcess.iterate_measurable F hF s k).snd
    (RecycledBoardProcess.history_residual_product F hF ν
      (goodObservedRestartStep_map cfg ε M start hn (cfg.B/n) (div_pos hB (by exact_mod_cast hn))) s k)
    f g hf hg hfi
    (fun a=>clockRunningSource_mean cfg ε M start e C D L hn hB hm hK (a (Fin.last k)).val (a (Fin.last k)).property.1)
    A hA

theorem goodMixed_running_history_estimate {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (hK : cfg.K<2) (hCL : C⊆L) (hCD : Disjoint C D) (s : GoodObservation cfg) (k : ℕ)
    (E : Set (BoardClockPath n))
    (hE : MeasurableSet[StateHistory.filtration
      (RecycledBoardProcess.state (goodObservedRestartStep cfg ε M start hn) s)
      (RecycledBoardProcess.state_measurable _ (goodObservedRestartStep_measurable cfg ε M start hn) s) k] E) :
    (∫ω in E,goodMixed cfg e C D L
      (RecycledBoardProcess.state (goodObservedRestartStep cfg ε M start hn) s (k+1) ω)
      ∂boardClockMeasure n (cfg.B/n))≤
      ∫ω in E,goodMixed cfg e C D L
        (RecycledBoardProcess.state (goodObservedRestartStep cfg ε M start hn) s k ω)+
        goodRunningSource cfg ε M start e C D L hn
          (RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M start hn) s k ω)
        ∂boardClockMeasure n (cfg.B/n) := by
  let F := goodObservedRestartStep cfg ε M start hn
  have hF : Measurable F := goodObservedRestartStep_measurable cfg ε M start hn
  let ν := boardClockMeasure n (cfg.B/n)
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  have hz : Integrable (fun ω=>goodMixed cfg e C D L (RecycledBoardProcess.state F s k ω)) ν :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _
      ((goodMixed_measurable cfg e C D L).comp (RecycledBoardProcess.state_measurable F hF s k))
      (mixedCap C cfg.B) (fun ω=>goodMixed_bounds cfg e C D L _)
  have hq : Integrable (fun ω=>stepSourceIntegral cfg ε M start e C D L (RecycledBoardProcess.state F s k ω).val) ν :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _
      ((stepSourceIntegral_measurable cfg ε M start e C D L).comp
        (measurable_subtype_coe.comp (RecycledBoardProcess.state_measurable F hF s k)))
      ((cfg.horizon:ℝ)*sourceCap cfg.directions C D cfg.B cfg.K)
      (fun ω=>stepSourceIntegral_bounds cfg ε M start e _ C D L (RecycledBoardProcess.state F s k ω).property.1 hB.le hm hK)
  have hi : Integrable (fun ω=>goodRunningSource cfg ε M start e C D L hn (RecycledBoardProcess.iterate F s k ω)) ν :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _
      ((goodRunningSource_measurable cfg ε M start e C D L hn).comp (RecycledBoardProcess.iterate_measurable F hF s k))
      ((cfg.horizon:ℝ)*sourceCap cfg.directions C D cfg.B cfg.K)
      (fun ω=>goodRunningSource_bounds cfg ε M start e C D L hn hm hK _)
  have he := goodMixed_history_estimate cfg ε M start e C D L hn hB hm hK hCL hCD s k E hE
  unfold goodUpperMean at he
  rw [integral_add hz.integrableOn hq.integrableOn] at he
  rw [integral_add hz.integrableOn hi.integrableOn,
    runningSource_history_mean cfg ε M start e C D L hn hB hm hK s k E hE]
  exact he

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.runningSource_history_mean
#print axioms NoThreeLine.BirthWitness.goodMixed_running_history_estimate
