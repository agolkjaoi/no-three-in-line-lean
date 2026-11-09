import NoThreeLine.AugmentedCreditIteration
import NoThreeLine.AugmentedTimedProgress
import NoThreeLine.GenericTerminalCredit

/-! A measurable terminal-state selector. Its expectation theorem explicitly
requires almost-sure completion; a separate termination proof must supply it. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter

namespace NoThreeLine

theorem augTimedNoiseState_absorbing {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (s : AugTimedState cfg) (ω : ℕ → BoardClockPath n) (k : ℕ)
    (hk : AugTimedDone cfg (augTimedNoiseState cfg ε M hn s k ω)) :
    ∀ j, k ≤ j → augTimedNoiseState cfg ε M hn s j ω = augTimedNoiseState cfg ε M hn s k ω := by
  intro j hj
  induction j, hj using Nat.le_induction with
  | base => rfl
  | succ j hj ih =>
    rw [augTimedNoiseState_succ,ih]
    exact augTimedStep_done cfg ε M _ hk _

def augTimedCompletionPredicate {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (s : AugTimedState cfg) (k : ℕ) (ω : ℕ → BoardClockPath n) : Prop :=
  AugTimedDone cfg (augTimedNoiseState cfg ε M hn s k ω) ∨
    ¬∃ j, AugTimedDone cfg (augTimedNoiseState cfg ε M hn s j ω)

theorem augTimedCompletionPredicate_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (s : AugTimedState cfg) (k : ℕ) : Measurable (augTimedCompletionPredicate cfg ε M hn s k) := by
  have hm (j : ℕ) : Measurable (fun ω => AugTimedDone cfg (augTimedNoiseState cfg ε M hn s j ω)) :=
    (augTimedDone_measurable cfg).comp (augTimedNoiseState_measurable cfg ε M hn s j)
  exact (hm k).or (Measurable.exists hm).not

theorem augTimedCompletionPredicate_exists {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (s : AugTimedState cfg) (ω : ℕ → BoardClockPath n) :
    ∃ k, augTimedCompletionPredicate cfg ε M hn s k ω := by
  by_cases h : ∃ j, AugTimedDone cfg (augTimedNoiseState cfg ε M hn s j ω)
  · obtain ⟨k,hk⟩ := h
    exact ⟨k,Or.inl hk⟩
  · exact ⟨0,Or.inr h⟩

def augTimedCompletionIndex {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (s : AugTimedState cfg) (ω : ℕ → BoardClockPath n) : ℕ := by
  classical
  exact Nat.find (augTimedCompletionPredicate_exists cfg ε M hn s ω)

def augTimedTerminal {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (s : AugTimedState cfg) (ω : ℕ → BoardClockPath n) : AugTimedState cfg :=
  augTimedNoiseState cfg ε M hn s (augTimedCompletionIndex cfg ε M hn s ω) ω

theorem augTimedCompletionIndex_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (s : AugTimedState cfg) : Measurable (augTimedCompletionIndex cfg ε M hn s) := by
  classical
  exact measurable_find (augTimedCompletionPredicate_exists cfg ε M hn s)
    (fun k => measurableSet_setOf.mpr (augTimedCompletionPredicate_measurable cfg ε M hn s k))

theorem augTimedTerminal_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (s : AugTimedState cfg) : Measurable (augTimedTerminal cfg ε M hn s) := by
  classical
  exact Measurable.find (augTimedNoiseState_measurable cfg ε M hn s)
    (fun k => measurableSet_setOf.mpr (augTimedCompletionPredicate_measurable cfg ε M hn s k))
    (augTimedCompletionPredicate_exists cfg ε M hn s)

theorem augTimedTerminal_done_of_exists {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (s : AugTimedState cfg) (ω : ℕ → BoardClockPath n)
    (h : ∃ j, AugTimedDone cfg (augTimedNoiseState cfg ε M hn s j ω)) :
    AugTimedDone cfg (augTimedTerminal cfg ε M hn s ω) := by
  classical
  exact (Nat.find_spec (augTimedCompletionPredicate_exists cfg ε M hn s ω)).resolve_right (not_not.mpr h)

theorem augTimedTerminal_stable_of_exists {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (s : AugTimedState cfg) (ω : ℕ → BoardClockPath n)
    (h : ∃ j, AugTimedDone cfg (augTimedNoiseState cfg ε M hn s j ω)) :
    ∀ᶠ k in atTop, augTimedNoiseState cfg ε M hn s k ω = augTimedTerminal cfg ε M hn s ω := by
  filter_upwards [eventually_ge_atTop (augTimedCompletionIndex cfg ε M hn s ω)] with k hk
  exact augTimedNoiseState_absorbing cfg ε M hn s ω _ (augTimedTerminal_done_of_exists cfg ε M hn s ω h) k hk

theorem augTimedTerminal_expected_credit_of_completion {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (hB : 0 < cfg.B) (hm : ∀ p, cfg.mask p ≤ 1) (s : AugTimedState cfg) (p : Grid n)
    (hcomplete : ∀ᵐ ω ∂Measure.infinitePi (fun _ : ℕ => boardClockMeasure n (cfg.B/n)),
      ∃ j, AugTimedDone cfg (augTimedNoiseState cfg ε M hn s j ω)) :
    (∫ ω, augTimedCredit cfg p (augTimedTerminal cfg ε M hn s ω)
      ∂Measure.infinitePi (fun _ : ℕ => boardClockMeasure n (cfg.B/n))) = augTimedCredit cfg p s := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  apply GenericTerminalCredit.expected_credit_of_eventually_stable _ (augTimedClockStep_measurable cfg ε M hn)
    _ _ (augTimedCredit_measurable cfg p) cfg.B (augTimedCredit_bounds cfg p)
    (fun x => augTimedClockStep_credit cfg ε M hn hB hm x p) s (augTimedTerminal cfg ε M hn s)
  filter_upwards [hcomplete] with ω hω
  exact augTimedTerminal_stable_of_exists cfg ε M hn s ω hω

end NoThreeLine

#print axioms NoThreeLine.augTimedCompletionIndex_measurable
#print axioms NoThreeLine.augTimedTerminal_measurable
#print axioms NoThreeLine.augTimedTerminal_expected_credit_of_completion
