import NoThreeLine.BirthHistoryCompensation

/-! Actual running birth rates accumulate with a bound independent of the
number of updates, because their elapsed times telescope exactly. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness

def cumulativeBirthRate {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (hn : 0<n) (s : AugTimedState cfg) (k : ℕ) (ω : BoardClockPath n) : ℝ :=
  ∑j∈Finset.range k,clockBirthRunningRate cfg ε M p hn (augRecycledPair cfg ε M hn s j ω)

theorem cumulativeBirthRate_succ {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (hn : 0<n) (s : AugTimedState cfg) (k : ℕ) (ω : BoardClockPath n) :
    cumulativeBirthRate cfg ε M p hn s (k+1) ω=cumulativeBirthRate cfg ε M p hn s k ω+
      clockBirthRunningRate cfg ε M p hn (augRecycledPair cfg ε M hn s k ω) := Finset.sum_range_succ _ _

theorem cumulativeBirthRate_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (hn : 0<n) (s : AugTimedState cfg) (k : ℕ) : Measurable (cumulativeBirthRate cfg ε M p hn s k) :=
  Finset.measurable_sum _ (fun j _=>(clockBirthRunningRate_measurable cfg ε M p hn).comp
    (augRecycledPair_measurable cfg ε M hn s j))

theorem cumulativeBirthRate_elapsed_bound {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : AugTimedState cfg)
    (k : ℕ) (ω : BoardClockPath n) :
    cumulativeBirthRate cfg ε M p hn s k ω≤
      (s.val.2-(augRecycledPair cfg ε M hn s k ω).1.val.2)*(cfg.B/n) := by
  induction k with
  | zero => simp [cumulativeBirthRate,augRecycledPair,RecycledBoardProcess.iterate]
  | succ k ih =>
    let x := augRecycledPair cfg ε M hn s k ω
    have hb := (birthRunningRate_elapsed_bound cfg ε M p hn hB hm
      (x.1,WinnerMarkLaw.firstMarkedRace hn x.2)).2
    rw [birthElapsed_eq_remaining_drop] at hb
    rw [cumulativeBirthRate_succ]
    calc
      _ ≤ (s.val.2-x.1.val.2)*(cfg.B/n)+
          (x.1.val.2-(augTimedClockStep cfg ε M hn x).val.2)*(cfg.B/n) := add_le_add ih hb
      _ = _ := by
        change _=(s.val.2-(augTimedClockStep cfg ε M hn x).val.2)*(cfg.B/n)
        ring

theorem cumulativeBirthRate_bounds {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : AugTimedState cfg)
    (k : ℕ) (ω : BoardClockPath n) :
    0≤cumulativeBirthRate cfg ε M p hn s k ω ∧
      cumulativeBirthRate cfg ε M p hn s k ω≤(cfg.horizon:ℝ)*(cfg.B/n) := by
  constructor
  · exact Finset.sum_nonneg (fun j _=>(birthRunningRate_bounds cfg ε M p hn hB hm _).1)
  · exact (cumulativeBirthRate_elapsed_bound cfg ε M p hn hB hm s k ω).trans
      (mul_le_mul_of_nonneg_right
        ((sub_le_self _ (augRecycledPair cfg ε M hn s k ω).1.property.2.1).trans s.property.2.2)
        (div_nonneg hB.le (by positivity)))

theorem cumulativeBirthRate_integrable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : AugTimedState cfg) (k : ℕ) :
    Integrable (cumulativeBirthRate cfg ε M p hn s k) (boardClockMeasure n (cfg.B/n)) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  exact GenericCreditIteration.bounded_nonnegative_integrable _ _
    (cumulativeBirthRate_measurable cfg ε M p hn s k) ((cfg.horizon:ℝ)*(cfg.B/n))
    (cumulativeBirthRate_bounds cfg ε M p hn hB hm s k)

theorem finite_selectedIndicator_compensation {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : AugTimedState cfg) (k : ℕ) :
    (∫ω,selectedIndicator cfg p (augRecycledPair cfg ε M hn s k ω).1 ∂boardClockMeasure n (cfg.B/n))=
      selectedIndicator cfg p s+∫ω,cumulativeBirthRate cfg ε M p hn s k ω ∂boardClockMeasure n (cfg.B/n) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  induction k with
  | zero => simp [cumulativeBirthRate,augRecycledPair,RecycledBoardProcess.iterate]
  | succ k ih =>
    have h := selectedIndicator_history_compensation cfg ε M p hn hB hm s k Set.univ MeasurableSet.univ
    simp only [Measure.restrict_univ] at h
    rw [integral_add (recycled_selectedIndicator_integrable cfg ε M p hn hB s k)
      (recycled_birthRunningRate_integrable cfg ε M p hn hB hm s k),ih] at h
    rw [h]
    simp_rw [cumulativeBirthRate_succ]
    rw [integral_add (cumulativeBirthRate_integrable cfg ε M p hn hB hm s k)
      (recycled_birthRunningRate_integrable cfg ε M p hn hB hm s k)]
    ring

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.cumulativeBirthRate_elapsed_bound
#print axioms NoThreeLine.BirthWitness.finite_selectedIndicator_compensation
