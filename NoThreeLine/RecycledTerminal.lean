import NoThreeLine.StableTerminalLaw

/-! A measurable terminal selector for the process using one original
board. Its law and credit are identified with the proved iid terminal law. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter

namespace NoThreeLine

def augRecycledCompletionPredicate {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (s : AugTimedState cfg) (k : ℕ) (ω : BoardClockPath n) : Prop :=
  AugTimedDone cfg (augRecycledPair cfg ε M hn s k ω).1 ∨
    ¬∃ j, AugTimedDone cfg (augRecycledPair cfg ε M hn s j ω).1

theorem augRecycledCompletionPredicate_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (s : AugTimedState cfg) (k : ℕ) : Measurable (augRecycledCompletionPredicate cfg ε M hn s k) :=
  (augRecycledDone_measurable cfg ε M hn s k).or
    (Measurable.exists (augRecycledDone_measurable cfg ε M hn s)).not

theorem augRecycledCompletionPredicate_exists {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (s : AugTimedState cfg) (ω : BoardClockPath n) :
    ∃ k, augRecycledCompletionPredicate cfg ε M hn s k ω := by
  by_cases h : ∃ j, AugTimedDone cfg (augRecycledPair cfg ε M hn s j ω).1
  · obtain ⟨k,hk⟩ := h
    exact ⟨k,Or.inl hk⟩
  · exact ⟨0,Or.inr h⟩

def augRecycledCompletionIndex {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (s : AugTimedState cfg) (ω : BoardClockPath n) : ℕ := by
  classical
  exact Nat.find (augRecycledCompletionPredicate_exists cfg ε M hn s ω)

def augRecycledTerminalPair {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (s : AugTimedState cfg) (ω : BoardClockPath n) : AugTimedState cfg × BoardClockPath n :=
  augRecycledPair cfg ε M hn s (augRecycledCompletionIndex cfg ε M hn s ω) ω

def augRecycledTerminal {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (s : AugTimedState cfg) (ω : BoardClockPath n) : AugTimedState cfg :=
  (augRecycledTerminalPair cfg ε M hn s ω).1

theorem augRecycledCompletionIndex_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (s : AugTimedState cfg) : Measurable (augRecycledCompletionIndex cfg ε M hn s) := by
  classical
  exact measurable_find (augRecycledCompletionPredicate_exists cfg ε M hn s)
    (fun k => (augRecycledCompletionPredicate_measurable cfg ε M hn s k).setOf)

theorem augRecycledTerminalPair_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (s : AugTimedState cfg) : Measurable (augRecycledTerminalPair cfg ε M hn s) := by
  classical
  exact Measurable.find (augRecycledPair_measurable cfg ε M hn s)
    (fun k => (augRecycledCompletionPredicate_measurable cfg ε M hn s k).setOf)
    (augRecycledCompletionPredicate_exists cfg ε M hn s)

theorem augRecycledTerminal_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (s : AugTimedState cfg) : Measurable (augRecycledTerminal cfg ε M hn s) :=
  (augRecycledTerminalPair_measurable cfg ε M hn s).fst

theorem augRecycledTerminal_done_of_exists {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (s : AugTimedState cfg) (ω : BoardClockPath n)
    (h : ∃ k, AugTimedDone cfg (augRecycledPair cfg ε M hn s k ω).1) :
    AugTimedDone cfg (augRecycledTerminal cfg ε M hn s ω) := by
  classical
  exact (Nat.find_spec (augRecycledCompletionPredicate_exists cfg ε M hn s ω)).resolve_right (not_not.mpr h)

theorem augRecycledTerminalPair_stable_of_exists {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (s : AugTimedState cfg) (ω : BoardClockPath n)
    (h : ∃ k, AugTimedDone cfg (augRecycledPair cfg ε M hn s k ω).1) :
    ∀ᶠ k in atTop, augRecycledPair cfg ε M hn s k ω = augRecycledTerminalPair cfg ε M hn s ω := by
  filter_upwards [eventually_ge_atTop (augRecycledCompletionIndex cfg ε M hn s ω)] with k hk
  exact augRecycledPair_absorbing cfg ε M hn s ω _
    (augRecycledTerminal_done_of_exists cfg ε M hn s ω h) k hk

theorem augRecycledTerminal_done_ae {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (hB : 0 < cfg.B) (s : AugTimedState cfg) :
    ∀ᵐ ω ∂boardClockMeasure n (cfg.B/n), AugTimedDone cfg (augRecycledTerminal cfg ε M hn s ω) := by
  filter_upwards [augRecycledPair_completes_ae cfg ε M hn hB s] with ω hω
  exact augRecycledTerminal_done_of_exists cfg ε M hn s ω hω

theorem augRecycledTerminalPair_stable_ae {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (hB : 0 < cfg.B) (s : AugTimedState cfg) :
    ∀ᵐ ω ∂boardClockMeasure n (cfg.B/n),
      ∀ᶠ k in atTop, augRecycledPair cfg ε M hn s k ω = augRecycledTerminalPair cfg ε M hn s ω := by
  filter_upwards [augRecycledPair_completes_ae cfg ε M hn hB s] with ω hω
  exact augRecycledTerminalPair_stable_of_exists cfg ε M hn s ω hω

theorem augRecycledTerminal_map {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (hB : 0 < cfg.B) (s : AugTimedState cfg) :
    (boardClockMeasure n (cfg.B/n)).map (augRecycledTerminal cfg ε M hn s) =
      (Measure.infinitePi (fun _ : ℕ => boardClockMeasure n (cfg.B/n))).map
        (augTimedTerminal cfg ε M hn s) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  apply map_eq_of_eventually_stable_marginals _ _
    (fun k ω => (augRecycledPair cfg ε M hn s k ω).1) (augTimedNoiseState cfg ε M hn s)
    _ _ (fun k => (augRecycledPair_measurable cfg ε M hn s k).fst)
    (augTimedNoiseState_measurable cfg ε M hn s) (augRecycledTerminal_measurable cfg ε M hn s)
    (augTimedTerminal_measurable cfg ε M hn s)
    (augRecycledState_map_eq_noiseState cfg ε M hn (cfg.B/n) (div_pos hB (by exact_mod_cast hn)) s)
  · filter_upwards [augRecycledTerminalPair_stable_ae cfg ε M hn hB s] with ω hω
    exact hω.mono (fun k hk => congrArg Prod.fst hk)
  · exact augTimedNoiseState_stabilizes_ae cfg ε M hn hB s

theorem augRecycledTerminal_expected_credit {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (hB : 0 < cfg.B) (hm : ∀ p, cfg.mask p ≤ 1) (s : AugTimedState cfg) (p : Grid n) :
    (∫ ω, augTimedCredit cfg p (augRecycledTerminal cfg ε M hn s ω)
      ∂boardClockMeasure n (cfg.B/n)) = augTimedCredit cfg p s := by
  have h := congrArg (fun μ : Measure (AugTimedState cfg) => ∫ x, augTimedCredit cfg p x ∂μ)
    (augRecycledTerminal_map cfg ε M hn hB s)
  rw [integral_map_of_stronglyMeasurable (augRecycledTerminal_measurable cfg ε M hn s)
      (augTimedCredit_measurable cfg p).stronglyMeasurable,
    integral_map_of_stronglyMeasurable (augTimedTerminal_measurable cfg ε M hn s)
      (augTimedCredit_measurable cfg p).stronglyMeasurable] at h
  exact h.trans (augTimedTerminal_expected_credit cfg ε M hn hB hm s p)

end NoThreeLine

#print axioms NoThreeLine.augRecycledTerminalPair_measurable
#print axioms NoThreeLine.augRecycledTerminal_done_ae
#print axioms NoThreeLine.augRecycledTerminal_map
#print axioms NoThreeLine.augRecycledTerminal_expected_credit
