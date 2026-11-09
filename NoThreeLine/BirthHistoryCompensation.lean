import NoThreeLine.BirthRunningRate
import NoThreeLine.RecycledIncrementIntegral
import NoThreeLine.AugmentedRecycledMartingale

/-! Conditional actual birth compensation on every discrete state-history
event of the original-board process. The running rate uses actual elapsed time. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine.BirthWitness

def clockBirthIndicator {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n) (hn : 0<n)
    (x : AugTimedState cfg × BoardClockPath n) : ℝ :=
  birthIndicator cfg ε M p (x.1,WinnerMarkLaw.firstMarkedRace hn x.2)

theorem clockBirthIndicator_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n) (hn : 0<n) :
    Measurable (clockBirthIndicator cfg ε M p hn) :=
  (birthIndicator_measurable cfg ε M p).comp
    (measurable_fst.prodMk ((WinnerMarkLaw.firstMarkedRace_measurable hn).comp measurable_snd))

theorem birth_history_equal {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : AugTimedState cfg) (k : ℕ)
    (E : Set (BoardClockPath n)) (hE : MeasurableSet[augRecycledStateFiltration cfg ε M hn s k] E) :
    (∫ω in E,clockBirthIndicator cfg ε M p hn (augRecycledPair cfg ε M hn s k ω)
      ∂boardClockMeasure n (cfg.B/n))=
      ∫ω in E,clockBirthRunningRate cfg ε M p hn (augRecycledPair cfg ε M hn s k ω)
        ∂boardClockMeasure n (cfg.B/n) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  exact RecycledBoardProcess.history_equal_integrals (augRestartStep cfg ε M hn)
    (augRestartStep_measurable cfg ε M hn) _
    (augRestartStep_map cfg ε M hn (cfg.B/n) (div_pos hB (by exact_mod_cast hn)))
    (clockBirthIndicator cfg ε M p hn) (clockBirthRunningRate cfg ε M p hn)
    (clockBirthIndicator_measurable cfg ε M p hn) (clockBirthRunningRate_measurable cfg ε M p hn)
    1 ((cfg.horizon:ℝ)*(cfg.B/n))
    (fun x=>birthIndicator_bounds cfg ε M p (x.1,WinnerMarkLaw.firstMarkedRace hn x.2))
    (fun x=>birthRunningRate_bounds cfg ε M p hn hB hm (x.1,WinnerMarkLaw.firstMarkedRace hn x.2))
    (first_birth_running_mean cfg ε M p hn hB hm) s k E hE

theorem recycled_selectedIndicator_step {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (hn : 0<n) (s : AugTimedState cfg) (k : ℕ) (ω : BoardClockPath n) :
    selectedIndicator cfg p (augRecycledPair cfg ε M hn s (k+1) ω).1=
      selectedIndicator cfg p (augRecycledPair cfg ε M hn s k ω).1+
        clockBirthIndicator cfg ε M p hn (augRecycledPair cfg ε M hn s k ω) :=
  selectedIndicator_step cfg ε M p _

theorem recycled_selectedIndicator_integrable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (hn : 0<n) (hB : 0<cfg.B) (s : AugTimedState cfg) (k : ℕ) :
    Integrable (fun ω=>selectedIndicator cfg p (augRecycledPair cfg ε M hn s k ω).1)
      (boardClockMeasure n (cfg.B/n)) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  exact GenericCreditIteration.bounded_nonnegative_integrable _ _
    ((selectedIndicator_measurable cfg p).comp (augRecycledPair_measurable cfg ε M hn s k).fst) 1
    (fun ω=>selectedIndicator_bounds cfg p _)

theorem recycled_birthRunningRate_integrable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : AugTimedState cfg) (k : ℕ) :
    Integrable (fun ω=>clockBirthRunningRate cfg ε M p hn (augRecycledPair cfg ε M hn s k ω))
      (boardClockMeasure n (cfg.B/n)) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  exact GenericCreditIteration.bounded_nonnegative_integrable _ _
    ((clockBirthRunningRate_measurable cfg ε M p hn).comp (augRecycledPair_measurable cfg ε M hn s k))
    ((cfg.horizon:ℝ)*(cfg.B/n))
    (fun ω=>birthRunningRate_bounds cfg ε M p hn hB hm _)

theorem selectedIndicator_history_compensation {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : AugTimedState cfg) (k : ℕ)
    (E : Set (BoardClockPath n)) (hE : MeasurableSet[augRecycledStateFiltration cfg ε M hn s k] E) :
    (∫ω in E,selectedIndicator cfg p (augRecycledPair cfg ε M hn s (k+1) ω).1 ∂boardClockMeasure n (cfg.B/n))=
      ∫ω in E,selectedIndicator cfg p (augRecycledPair cfg ε M hn s k ω).1+
        clockBirthRunningRate cfg ε M p hn (augRecycledPair cfg ε M hn s k ω)
        ∂boardClockMeasure n (cfg.B/n) := by
  let ν := boardClockMeasure n (cfg.B/n)
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  have hi := (recycled_selectedIndicator_integrable cfg ε M p hn hB s k).integrableOn (s := E)
  have hr := (recycled_birthRunningRate_integrable cfg ε M p hn hB hm s k).integrableOn (s := E)
  have hb : IntegrableOn (fun ω=>clockBirthIndicator cfg ε M p hn (augRecycledPair cfg ε M hn s k ω)) E ν :=
    (GenericCreditIteration.bounded_nonnegative_integrable ν _
      ((clockBirthIndicator_measurable cfg ε M p hn).comp (augRecycledPair_measurable cfg ε M hn s k))
      1 (fun ω=>birthIndicator_bounds cfg ε M p _)).integrableOn
  simp_rw [recycled_selectedIndicator_step]
  rw [integral_add hi hb,integral_add hi hr,birth_history_equal cfg ε M p hn hB hm s k E hE]

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.birth_history_equal
#print axioms NoThreeLine.BirthWitness.selectedIndicator_history_compensation
