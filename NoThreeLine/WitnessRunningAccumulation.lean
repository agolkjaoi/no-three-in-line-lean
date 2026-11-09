import NoThreeLine.WitnessRunningHistory

/-! Exact remaining-time telescoping controls the real cumulative source,
uniformly in the number of actual recycled updates. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness

theorem runningSource_le_advance {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (x : TimedObservation cfg×CandidateData n)
    (hs : RecordsConsistent cfg x.1) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2) :
    runningSource cfg ε M start e C D L x≤
      observedAdvance cfg ε M x*sourceCap cfg.directions C D cfg.B cfg.K := by
  by_cases hx : observationDone cfg x.1
  · simp only [runningSource,observedAdvance,if_pos hx,intervalIntegral.integral_same,zero_mul,le_refl]
  · have ha := observedAdvance_mem cfg ε M x
    exact (integral_initial_segment_bounds _ _ ha.1 le_rfl _
      (selectedSourceSum_measurable cfg (augTimedInput cfg x.1.1).1 _ C D L e _)
      (sourceCap cfg.directions C D cfg.B cfg.K) (sourceCap_nonneg _ _ _ _ _)
      (fun t ht=>selectedSourceSum_guard_bounds cfg ε M start e x.1 C D L hs hx hm hK t
        ⟨ht.1,ht.2.trans_le ha.2⟩)).2

def cumulativeRunningSource {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (s : GoodObservation cfg) (k : ℕ) (ω : BoardClockPath n) : ℝ :=
  ∑j∈Finset.range k,goodRunningSource cfg ε M start e C D L hn
    (RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M start hn) s j ω)

theorem cumulativeRunningSource_succ {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (s : GoodObservation cfg) (k : ℕ) (ω : BoardClockPath n) :
    cumulativeRunningSource cfg ε M start e C D L hn s (k+1) ω=
      cumulativeRunningSource cfg ε M start e C D L hn s k ω+
        goodRunningSource cfg ε M start e C D L hn
          (RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M start hn) s k ω) := Finset.sum_range_succ _ _

theorem cumulativeRunningSource_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (s : GoodObservation cfg) (k : ℕ) :
    Measurable (cumulativeRunningSource cfg ε M start e C D L hn s k) :=
  Finset.measurable_sum _ (fun j _=>(goodRunningSource_measurable cfg ε M start e C D L hn).comp
    (RecycledBoardProcess.iterate_measurable _ (goodObservedRestartStep_measurable cfg ε M start hn) s j))

theorem cumulativeRunningSource_elapsed_bound {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2)
    (s : GoodObservation cfg) (k : ℕ) (ω : BoardClockPath n) :
    cumulativeRunningSource cfg ε M start e C D L hn s k ω≤
      (s.val.1.val.2-(RecycledBoardProcess.state (goodObservedRestartStep cfg ε M start hn) s k ω).val.1.val.2)*
        sourceCap cfg.directions C D cfg.B cfg.K := by
  induction k with
  | zero => simp [cumulativeRunningSource,RecycledBoardProcess.state,RecycledBoardProcess.iterate]
  | succ k ih =>
    let x := RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M start hn) s k ω
    have hb := runningSource_le_advance cfg ε M start e C D L
      (x.1.val,WinnerMarkLaw.firstMarkedRace hn x.2) x.1.property.1 hm hK
    rw [observedAdvance_eq_remaining_drop cfg ε M start] at hb
    rw [cumulativeRunningSource_succ]
    calc
      _ ≤ (s.val.1.val.2-x.1.val.1.val.2)*sourceCap cfg.directions C D cfg.B cfg.K+
          (x.1.val.1.val.2-(goodObservedClockStep cfg ε M start hn x).val.1.val.2)*
            sourceCap cfg.directions C D cfg.B cfg.K := add_le_add ih hb
      _ = _ := by
        change _=(s.val.1.val.2-(goodObservedClockStep cfg ε M start hn x).val.1.val.2)*_
        ring

theorem cumulativeRunningSource_bounds {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2)
    (s : GoodObservation cfg) (k : ℕ) (ω : BoardClockPath n) :
    0≤cumulativeRunningSource cfg ε M start e C D L hn s k ω ∧
      cumulativeRunningSource cfg ε M start e C D L hn s k ω≤(cfg.horizon:ℝ)*sourceCap cfg.directions C D cfg.B cfg.K := by
  constructor
  · exact Finset.sum_nonneg (fun j _=>(goodRunningSource_bounds cfg ε M start e C D L hn hm hK _).1)
  · exact (cumulativeRunningSource_elapsed_bound cfg ε M start e C D L hn hm hK s k ω).trans
      (mul_le_mul_of_nonneg_right ((sub_le_self _
        (RecycledBoardProcess.state (goodObservedRestartStep cfg ε M start hn) s k ω).val.1.property.2.1).trans
          s.val.1.property.2.2) (sourceCap_nonneg _ _ _ _ _))

theorem cumulativeRunningSource_integrable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2)
    (s : GoodObservation cfg) (k : ℕ) :
    Integrable (cumulativeRunningSource cfg ε M start e C D L hn s k) (boardClockMeasure n (cfg.B/n)) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  exact GenericCreditIteration.bounded_nonnegative_integrable _ _
    (cumulativeRunningSource_measurable cfg ε M start e C D L hn s k)
    ((cfg.horizon:ℝ)*sourceCap cfg.directions C D cfg.B cfg.K)
    (cumulativeRunningSource_bounds cfg ε M start e C D L hn hm hK s k)

theorem finite_expected_mixed_running_bound {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (hK : cfg.K<2) (hCL : C⊆L) (hCD : Disjoint C D) (s : GoodObservation cfg) (k : ℕ) :
    (∫ω,goodMixed cfg e C D L
      (RecycledBoardProcess.state (goodObservedRestartStep cfg ε M start hn) s k ω)
      ∂boardClockMeasure n (cfg.B/n))≤goodMixed cfg e C D L s+
        ∫ω,cumulativeRunningSource cfg ε M start e C D L hn s k ω ∂boardClockMeasure n (cfg.B/n) := by
  let F := goodObservedRestartStep cfg ε M start hn
  have hF := goodObservedRestartStep_measurable cfg ε M start hn
  let ν := boardClockMeasure n (cfg.B/n)
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  induction k with
  | zero => simp [RecycledBoardProcess.state,RecycledBoardProcess.iterate,cumulativeRunningSource]
  | succ k ih =>
    have hz : Integrable (fun ω=>goodMixed cfg e C D L (RecycledBoardProcess.state F s k ω)) ν :=
      GenericCreditIteration.bounded_nonnegative_integrable _ _
        ((goodMixed_measurable cfg e C D L).comp (RecycledBoardProcess.state_measurable F hF s k))
        (mixedCap C cfg.B) (fun ω=>goodMixed_bounds cfg e C D L _)
    have hr : Integrable (fun ω=>goodRunningSource cfg ε M start e C D L hn (RecycledBoardProcess.iterate F s k ω)) ν :=
      GenericCreditIteration.bounded_nonnegative_integrable _ _
        ((goodRunningSource_measurable cfg ε M start e C D L hn).comp (RecycledBoardProcess.iterate_measurable F hF s k))
        ((cfg.horizon:ℝ)*sourceCap cfg.directions C D cfg.B cfg.K)
        (fun ω=>goodRunningSource_bounds cfg ε M start e C D L hn hm hK _)
    have hc := cumulativeRunningSource_integrable cfg ε M start e C D L hn hB hm hK s k
    have hstep := goodMixed_running_history_estimate cfg ε M start e C D L hn hB hm hK hCL hCD s k
      Set.univ MeasurableSet.univ
    simp only [Measure.restrict_univ] at hstep
    rw [integral_add hz hr] at hstep
    apply hstep.trans
    calc
      _ ≤ (goodMixed cfg e C D L s+∫ω,cumulativeRunningSource cfg ε M start e C D L hn s k ω ∂ν)+
          ∫ω,goodRunningSource cfg ε M start e C D L hn (RecycledBoardProcess.iterate F s k ω) ∂ν := add_le_add ih le_rfl
      _ = _ := by
        simp_rw [cumulativeRunningSource_succ]
        rw [integral_add hc hr]
        ring

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.cumulativeRunningSource_elapsed_bound
#print axioms NoThreeLine.BirthWitness.cumulativeRunningSource_bounds
#print axioms NoThreeLine.BirthWitness.finite_expected_mixed_running_bound
