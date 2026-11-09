import NoThreeLine.BirthTerminalCompensation

/-! Sum the proved point compensations to obtain the expected actual
terminal selected cardinality. This is an identity, not the 1.501n bound. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness

theorem selectedIndicator_sum {n : ℕ} (cfg : FlowConfig n) (s : AugTimedState cfg) :
    (∑p : Grid n,selectedIndicator cfg p s)=(s.val.1.physical.process.selected.card:ℝ) := by
  classical
  simp [selectedIndicator]

def terminalTotalBirthRate {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0<n)
    (s : AugTimedState cfg) (ω : BoardClockPath n) : ℝ :=
  ∑p : Grid n,terminalBirthRate cfg ε M p hn s ω

theorem terminalTotalBirthRate_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0<n)
    (s : AugTimedState cfg) : Measurable (terminalTotalBirthRate cfg ε M hn s) :=
  Finset.measurable_sum _ (fun p _=>terminalBirthRate_measurable cfg ε M p hn s)

theorem terminalTotalBirthRate_integrable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : AugTimedState cfg) :
    Integrable (terminalTotalBirthRate cfg ε M hn s) (boardClockMeasure n (cfg.B/n)) :=
  integrable_finset_sum _ (fun p _=>terminalBirthRate_integrable cfg ε M p hn hB hm s)

theorem terminal_card_compensation {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : AugTimedState cfg) :
    (∫ω,((augRecycledTerminal cfg ε M hn s ω).val.1.physical.process.selected.card:ℝ)
      ∂boardClockMeasure n (cfg.B/n))=(s.val.1.physical.process.selected.card:ℝ)+
        ∫ω,terminalTotalBirthRate cfg ε M hn s ω ∂boardClockMeasure n (cfg.B/n) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  have hi (p : Grid n) : Integrable (fun ω=>selectedIndicator cfg p (augRecycledTerminal cfg ε M hn s ω))
      (boardClockMeasure n (cfg.B/n)) :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _
      ((selectedIndicator_measurable cfg p).comp (augRecycledTerminal_measurable cfg ε M hn s))
      1 (fun ω=>selectedIndicator_bounds cfg p _)
  simp_rw [← selectedIndicator_sum]
  rw [integral_finset_sum _ (fun p _=>hi p)]
  simp_rw [terminal_selectedIndicator_compensation cfg ε M _ hn hB hm s]
  rw [Finset.sum_add_distrib]
  congr 1
  exact (integral_finset_sum _ (fun p _=>terminalBirthRate_integrable cfg ε M p hn hB hm s)).symm

theorem terminal_card_compensation_of_empty {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : AugTimedState cfg)
    (hs : s.val.1.physical.process.selected=∅) :
    (∫ω,((augRecycledTerminal cfg ε M hn s ω).val.1.physical.process.selected.card:ℝ)
      ∂boardClockMeasure n (cfg.B/n))=
        ∫ω,terminalTotalBirthRate cfg ε M hn s ω ∂boardClockMeasure n (cfg.B/n) := by
  rw [terminal_card_compensation cfg ε M hn hB hm s,hs]
  simp

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.terminal_card_compensation
#print axioms NoThreeLine.BirthWitness.terminal_card_compensation_of_empty
