import NoThreeLine.CompletionTransfer

/-! The constructed process on one original board has almost-sure finite
completion, transferred from the proved iid process using absorbing Done
events and the exact finite state marginal laws. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter

namespace NoThreeLine

theorem augRestartStep_done {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (s : AugTimedState cfg) (hs : AugTimedDone cfg s) (ω : BoardClockPath n) :
    augRestartStep cfg ε M hn (s,ω) = (s,ω) := by
  have hf : s.val.2 ≤ 0 ∨ s.val.1.physical.process.stopped = true :=
    hs.imp (fun h => h.le) id
  simp only [augRestartStep,augTimedClockStep,augTimedStep_done cfg ε M s hs,
    augResidualBoard,if_pos hf]

theorem augRecycledPair_zero {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (s : AugTimedState cfg) (ω : BoardClockPath n) : augRecycledPair cfg ε M hn s 0 ω = (s,ω) := rfl

theorem augRecycledPair_succ {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (s : AugTimedState cfg) (k : ℕ) (ω : BoardClockPath n) :
    augRecycledPair cfg ε M hn s (k+1) ω = augRestartStep cfg ε M hn (augRecycledPair cfg ε M hn s k ω) := rfl

theorem augRecycledPair_absorbing {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (s : AugTimedState cfg) (ω : BoardClockPath n) (k : ℕ)
    (hk : AugTimedDone cfg (augRecycledPair cfg ε M hn s k ω).1) :
    ∀ j, k ≤ j → augRecycledPair cfg ε M hn s j ω = augRecycledPair cfg ε M hn s k ω := by
  intro j hj
  induction j, hj using Nat.le_induction with
  | base => rfl
  | succ j hj ih =>
    rw [augRecycledPair_succ,ih]
    exact augRestartStep_done cfg ε M hn _ hk _

theorem augRecycledDone_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (s : AugTimedState cfg) (k : ℕ) :
    Measurable (fun ω => AugTimedDone cfg (augRecycledPair cfg ε M hn s k ω).1) :=
  (augTimedDone_measurable cfg).comp (augRecycledPair_measurable cfg ε M hn s k).fst

theorem augRecycledPair_completes_ae {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (hB : 0 < cfg.B) (s : AugTimedState cfg) :
    ∀ᵐ ω ∂boardClockMeasure n (cfg.B/n), ∃ k, AugTimedDone cfg (augRecycledPair cfg ε M hn s k ω).1 := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  apply ae_completion_of_failure_marginals (boardClockMeasure n (cfg.B/n))
    (Measure.infinitePi (fun _ : ℕ => boardClockMeasure n (cfg.B/n)))
    (fun k ω => AugTimedDone cfg (augRecycledPair cfg ε M hn s k ω).1)
    (fun k ω => AugTimedDone cfg (augTimedNoiseState cfg ε M hn s k ω))
    (augRecycledDone_measurable cfg ε M hn s)
    (fun k => (augTimedDone_measurable cfg).comp (augTimedNoiseState_measurable cfg ε M hn s k))
  · intro ω i j hij hi
    simpa only [augRecycledPair_absorbing cfg ε M hn s ω i hi j hij] using hi
  · intro ω i j hij hi
    simpa only [augTimedNoiseState_absorbing cfg ε M hn s ω i hi j hij] using hi
  · intro k
    have hA : MeasurableSet {x : AugTimedState cfg | ¬AugTimedDone cfg x} :=
      (augTimedDone_measurable cfg).not.setOf
    have he := congrArg (fun μ : Measure (AugTimedState cfg) => μ {x | ¬AugTimedDone cfg x})
      (augRecycledState_map_eq_noiseState cfg ε M hn (cfg.B/n)
        (div_pos hB (by exact_mod_cast hn)) s k)
    rw [Measure.map_apply (augRecycledPair_measurable cfg ε M hn s k).fst hA,
      Measure.map_apply (augTimedNoiseState_measurable cfg ε M hn s k) hA] at he
    exact he
  · exact augTimedNoiseState_completes_ae cfg ε M hn hB s

end NoThreeLine

#print axioms NoThreeLine.augRestartStep_done
#print axioms NoThreeLine.augRecycledPair_absorbing
#print axioms NoThreeLine.augRecycledPair_completes_ae
