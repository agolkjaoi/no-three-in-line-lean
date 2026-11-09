import NoThreeLine.RootFreezeHistory
import NoThreeLine.WitnessRunningAccumulation

/-! The actual frozen-source sum is dominated pathwise by the original
elapsed-time source sum. Thus its bound is uniform in the number of steps,
and the proved history estimate telescopes to every finite iterate. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness

def cumulativeRootRunningSource {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n)
    (s : GoodRootObservation cfg p) (k : ℕ) (ω : BoardClockPath n) : ℝ :=
  ∑j∈Finset.range k,goodRootRunningSource cfg ε M start p e C D L hn
    (RecycledBoardProcess.iterate (goodRootRestartStep cfg ε M start p hn) s j ω)

theorem cumulativeRootRunningSource_succ {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n)
    (s : GoodRootObservation cfg p) (k : ℕ) (ω : BoardClockPath n) :
    cumulativeRootRunningSource cfg ε M start p e C D L hn s (k+1) ω=
      cumulativeRootRunningSource cfg ε M start p e C D L hn s k ω+
        goodRootRunningSource cfg ε M start p e C D L hn
          (RecycledBoardProcess.iterate (goodRootRestartStep cfg ε M start p hn) s k ω) :=
  Finset.sum_range_succ _ _

theorem cumulativeRootRunningSource_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n)
    (s : GoodRootObservation cfg p) (k : ℕ) :
    Measurable (cumulativeRootRunningSource cfg ε M start p e C D L hn s k) :=
  Finset.measurable_sum _ (fun j _=>(goodRootRunningSource_measurable cfg ε M start p e C D L hn).comp
    (RecycledBoardProcess.iterate_measurable _ (goodRootRestartStep_measurable cfg ε M start p hn) s j))

theorem cumulativeRootRunningSource_le_actual {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n)
    (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2) (s : GoodRootObservation cfg p) (k : ℕ) (ω : BoardClockPath n) :
    cumulativeRootRunningSource cfg ε M start p e C D L hn s k ω≤
      cumulativeRunningSource cfg ε M start e C D L hn (goodRootActual cfg p s) k ω := by
  apply Finset.sum_le_sum
  intro j hj
  have hi := goodRootRunningSource_le_actual cfg ε M start p e C D L hn hm hK
    (RecycledBoardProcess.iterate (goodRootRestartStep cfg ε M start p hn) s j ω)
  rw [goodRootRecycled_actual cfg ε M start p hn s j ω] at hi
  exact hi

theorem cumulativeRootRunningSource_bounds {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n)
    (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2) (s : GoodRootObservation cfg p) (k : ℕ) (ω : BoardClockPath n) :
    0≤cumulativeRootRunningSource cfg ε M start p e C D L hn s k ω ∧
      cumulativeRootRunningSource cfg ε M start p e C D L hn s k ω≤
        (cfg.horizon:ℝ)*sourceCap cfg.directions C D cfg.B cfg.K := by
  constructor
  · exact Finset.sum_nonneg (fun j _=>(goodRootRunningSource_bounds cfg ε M start p e C D L hn hm hK _).1)
  · exact (cumulativeRootRunningSource_le_actual cfg ε M start p e C D L hn hm hK s k ω).trans
      (cumulativeRunningSource_bounds cfg ε M start e C D L hn hm hK (goodRootActual cfg p s) k ω).2

theorem cumulativeRootRunningSource_integrable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n)
    (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2) (s : GoodRootObservation cfg p) (k : ℕ) :
    Integrable (cumulativeRootRunningSource cfg ε M start p e C D L hn s k) (boardClockMeasure n (cfg.B/n)) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  exact GenericCreditIteration.bounded_nonnegative_integrable _ _
    (cumulativeRootRunningSource_measurable cfg ε M start p e C D L hn s k)
    ((cfg.horizon:ℝ)*sourceCap cfg.directions C D cfg.B cfg.K)
    (cumulativeRootRunningSource_bounds cfg ε M start p e C D L hn hm hK s k)

theorem finite_expected_rootMixed_running_bound {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (e : Retention n) (C D L : Finset (Grid n))
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2)
    (hCL : C⊆L) (hCD : Disjoint C D) (s : GoodRootObservation cfg p) (k : ℕ) :
    (∫ω,goodRootMixed cfg p e C D L
      (RecycledBoardProcess.state (goodRootRestartStep cfg ε M start p hn) s k ω)
      ∂boardClockMeasure n (cfg.B/n))≤goodRootMixed cfg p e C D L s+
        ∫ω,cumulativeRootRunningSource cfg ε M start p e C D L hn s k ω ∂boardClockMeasure n (cfg.B/n) := by
  let F := goodRootRestartStep cfg ε M start p hn
  have hF := goodRootRestartStep_measurable cfg ε M start p hn
  let ν := boardClockMeasure n (cfg.B/n)
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  induction k with
  | zero => simp [RecycledBoardProcess.state,RecycledBoardProcess.iterate,cumulativeRootRunningSource]
  | succ k ih =>
    have hz : Integrable (fun ω=>goodRootMixed cfg p e C D L (RecycledBoardProcess.state F s k ω)) ν :=
      GenericCreditIteration.bounded_nonnegative_integrable _ _
        ((goodRootMixed_measurable cfg p e C D L).comp (RecycledBoardProcess.state_measurable F hF s k))
        (mixedCap C cfg.B) (fun ω=>goodRootMixed_bounds cfg p e C D L _)
    have hr : Integrable (fun ω=>goodRootRunningSource cfg ε M start p e C D L hn (RecycledBoardProcess.iterate F s k ω)) ν :=
      GenericCreditIteration.bounded_nonnegative_integrable _ _
        ((goodRootRunningSource_measurable cfg ε M start p e C D L hn).comp (RecycledBoardProcess.iterate_measurable F hF s k))
        ((cfg.horizon:ℝ)*sourceCap cfg.directions C D cfg.B cfg.K)
        (fun ω=>goodRootRunningSource_bounds cfg ε M start p e C D L hn hm hK _)
    have hc := cumulativeRootRunningSource_integrable cfg ε M start p e C D L hn hB hm hK s k
    have hstep := goodRootMixed_running_history_estimate cfg ε M start p e C D L hn hB hm hK hCL hCD s k
      Set.univ MeasurableSet.univ
    simp only [Measure.restrict_univ] at hstep
    rw [integral_add hz hr] at hstep
    apply hstep.trans
    calc
      _ ≤ (goodRootMixed cfg p e C D L s+∫ω,cumulativeRootRunningSource cfg ε M start p e C D L hn s k ω ∂ν)+
          ∫ω,goodRootRunningSource cfg ε M start p e C D L hn (RecycledBoardProcess.iterate F s k ω) ∂ν :=
        add_le_add ih le_rfl
      _ = _ := by
        simp_rw [cumulativeRootRunningSource_succ]
        rw [integral_add hc hr]
        ring

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.cumulativeRootRunningSource_le_actual
#print axioms NoThreeLine.BirthWitness.cumulativeRootRunningSource_bounds
#print axioms NoThreeLine.BirthWitness.finite_expected_rootMixed_running_bound
