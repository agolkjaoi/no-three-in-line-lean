import NoThreeLine.TimedCreditIteration
import NoThreeLine.TimedProgress
import NoThreeLine.GenericTerminalCredit

/-! A measurable terminal-state selector. Its expectation theorem explicitly
requires almost-sure completion; a separate termination proof must supply it. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter

namespace NoThreeLine

theorem timedNoiseState_absorbing {n : ℕ} (cfg : FlowConfig n) (hn : 0 < n)
    (s : TimedState cfg) (ω : ℕ → BoardClockPath n) (k : ℕ)
    (hk : TimedDone cfg (timedNoiseState cfg hn s k ω)) :
    ∀ j, k ≤ j → timedNoiseState cfg hn s j ω = timedNoiseState cfg hn s k ω := by
  intro j hj
  induction j, hj using Nat.le_induction with
  | base => rfl
  | succ j hj ih =>
    rw [timedNoiseState_succ,ih]
    exact timedStep_done cfg _ hk _

def timedCompletionPredicate {n : ℕ} (cfg : FlowConfig n) (hn : 0 < n)
    (s : TimedState cfg) (k : ℕ) (ω : ℕ → BoardClockPath n) : Prop :=
  TimedDone cfg (timedNoiseState cfg hn s k ω) ∨
    ¬∃ j, TimedDone cfg (timedNoiseState cfg hn s j ω)

theorem timedCompletionPredicate_measurable {n : ℕ} (cfg : FlowConfig n) (hn : 0 < n)
    (s : TimedState cfg) (k : ℕ) : Measurable (timedCompletionPredicate cfg hn s k) := by
  have hm (j : ℕ) : Measurable (fun ω => TimedDone cfg (timedNoiseState cfg hn s j ω)) :=
    (timedDone_measurable cfg).comp (timedNoiseState_measurable cfg hn s j)
  exact (hm k).or (Measurable.exists hm).not

theorem timedCompletionPredicate_exists {n : ℕ} (cfg : FlowConfig n) (hn : 0 < n)
    (s : TimedState cfg) (ω : ℕ → BoardClockPath n) :
    ∃ k, timedCompletionPredicate cfg hn s k ω := by
  by_cases h : ∃ j, TimedDone cfg (timedNoiseState cfg hn s j ω)
  · obtain ⟨k,hk⟩ := h
    exact ⟨k,Or.inl hk⟩
  · exact ⟨0,Or.inr h⟩

def timedCompletionIndex {n : ℕ} (cfg : FlowConfig n) (hn : 0 < n)
    (s : TimedState cfg) (ω : ℕ → BoardClockPath n) : ℕ := by
  classical
  exact Nat.find (timedCompletionPredicate_exists cfg hn s ω)

def timedTerminal {n : ℕ} (cfg : FlowConfig n) (hn : 0 < n)
    (s : TimedState cfg) (ω : ℕ → BoardClockPath n) : TimedState cfg :=
  timedNoiseState cfg hn s (timedCompletionIndex cfg hn s ω) ω

theorem timedCompletionIndex_measurable {n : ℕ} (cfg : FlowConfig n) (hn : 0 < n)
    (s : TimedState cfg) : Measurable (timedCompletionIndex cfg hn s) := by
  classical
  exact measurable_find (timedCompletionPredicate_exists cfg hn s)
    (fun k => measurableSet_setOf.mpr (timedCompletionPredicate_measurable cfg hn s k))

theorem timedTerminal_measurable {n : ℕ} (cfg : FlowConfig n) (hn : 0 < n)
    (s : TimedState cfg) : Measurable (timedTerminal cfg hn s) := by
  classical
  exact Measurable.find (timedNoiseState_measurable cfg hn s)
    (fun k => measurableSet_setOf.mpr (timedCompletionPredicate_measurable cfg hn s k))
    (timedCompletionPredicate_exists cfg hn s)

theorem timedTerminal_done_of_exists {n : ℕ} (cfg : FlowConfig n) (hn : 0 < n)
    (s : TimedState cfg) (ω : ℕ → BoardClockPath n)
    (h : ∃ j, TimedDone cfg (timedNoiseState cfg hn s j ω)) :
    TimedDone cfg (timedTerminal cfg hn s ω) := by
  classical
  exact (Nat.find_spec (timedCompletionPredicate_exists cfg hn s ω)).resolve_right (not_not.mpr h)

theorem timedTerminal_stable_of_exists {n : ℕ} (cfg : FlowConfig n) (hn : 0 < n)
    (s : TimedState cfg) (ω : ℕ → BoardClockPath n)
    (h : ∃ j, TimedDone cfg (timedNoiseState cfg hn s j ω)) :
    ∀ᶠ k in atTop, timedNoiseState cfg hn s k ω = timedTerminal cfg hn s ω := by
  filter_upwards [eventually_ge_atTop (timedCompletionIndex cfg hn s ω)] with k hk
  exact timedNoiseState_absorbing cfg hn s ω _ (timedTerminal_done_of_exists cfg hn s ω h) k hk

theorem timedTerminal_expected_credit_of_completion {n : ℕ} (cfg : FlowConfig n) (hn : 0 < n)
    (hB : 0 < cfg.B) (hm : ∀ p, cfg.mask p ≤ 1) (s : TimedState cfg) (p : Grid n)
    (hcomplete : ∀ᵐ ω ∂Measure.infinitePi (fun _ : ℕ => boardClockMeasure n (cfg.B/n)),
      ∃ j, TimedDone cfg (timedNoiseState cfg hn s j ω)) :
    (∫ ω, timedCredit cfg p (timedTerminal cfg hn s ω)
      ∂Measure.infinitePi (fun _ : ℕ => boardClockMeasure n (cfg.B/n))) = timedCredit cfg p s := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  apply GenericTerminalCredit.expected_credit_of_eventually_stable _ (timedClockStep_measurable cfg hn)
    _ _ (timedCredit_measurable cfg p) cfg.B (timedCredit_bounds cfg p)
    (fun x => timedClockStep_credit cfg hn hB hm x p) s (timedTerminal cfg hn s)
  filter_upwards [hcomplete] with ω hω
  exact timedTerminal_stable_of_exists cfg hn s ω hω

end NoThreeLine

#print axioms NoThreeLine.timedCompletionIndex_measurable
#print axioms NoThreeLine.timedTerminal_measurable
#print axioms NoThreeLine.timedTerminal_expected_credit_of_completion
