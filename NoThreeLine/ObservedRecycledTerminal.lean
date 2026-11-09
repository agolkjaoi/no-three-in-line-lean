import NoThreeLine.ObservedRecycledProcess

/-! Measurable actual terminal observer selected at the already constructed
physical completion index, with pathwise projection and eventual stability. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter

namespace NoThreeLine.BirthWitness

def observedRecycledTerminalPair {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0 < n)
    (x : TimedObservation cfg × BoardClockPath n) : TimedObservation cfg × BoardClockPath n :=
  observedRecycledPair cfg ε M start hn x.1 (augRecycledCompletionIndex cfg ε M hn x.1.1 x.2) x.2

def observedRecycledTerminal {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0 < n)
    (x : TimedObservation cfg × BoardClockPath n) : TimedObservation cfg :=
  (observedRecycledTerminalPair cfg ε M start hn x).1

theorem observedRecycledTerminalPair_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0 < n) :
    Measurable (observedRecycledTerminalPair cfg ε M start hn) := by
  classical
  exact Measurable.find (observedRecycledPair_joint_measurable cfg ε M start hn)
    (fun k => measurableSet_setOf.mpr ((augRecycledCompletionPredicate_joint_measurable cfg ε M hn k).comp
      (measurable_fst.fst.prodMk measurable_snd)))
    (fun x : TimedObservation cfg × BoardClockPath n => augRecycledCompletionPredicate_exists cfg ε M hn x.1.1 x.2)

theorem observedRecycledTerminal_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0 < n) :
    Measurable (observedRecycledTerminal cfg ε M start hn) :=
  (observedRecycledTerminalPair_measurable cfg ε M start hn).fst

theorem observedRecycledTerminalPair_base {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0 < n)
    (x : TimedObservation cfg × BoardClockPath n) :
    ((observedRecycledTerminalPair cfg ε M start hn x).1.1,(observedRecycledTerminalPair cfg ε M start hn x).2) =
      augRecycledTerminalPair cfg ε M hn x.1.1 x.2 :=
  observedRecycledPair_base cfg ε M start hn x.1 _ x.2

theorem observedRecycledTerminal_base {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0 < n)
    (x : TimedObservation cfg × BoardClockPath n) :
    (observedRecycledTerminal cfg ε M start hn x).1 = augRecycledTerminal cfg ε M hn x.1.1 x.2 :=
  congrArg Prod.fst (observedRecycledTerminalPair_base cfg ε M start hn x)

theorem observedRecycledTerminal_consistent {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0 < n)
    (x : TimedObservation cfg × BoardClockPath n) (hx : RecordsConsistent cfg x.1) :
    RecordsConsistent cfg (observedRecycledTerminal cfg ε M start hn x) :=
  observedRecycledPair_consistent cfg ε M start hn x.1 hx _ x.2

theorem observedRecycledTerminal_witness_valid {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0 < n)
    (e : Retention n) (x : TimedObservation cfg × BoardClockPath n) (hx : RecordsConsistent cfg x.1) :
    (observedWitness cfg e (observedRecycledTerminal cfg ε M start hn x)).Valid cfg.B :=
  observedWitness_valid cfg e _ (observedRecycledTerminal_consistent cfg ε M start hn x hx)

theorem observedRecycledTerminalPair_stable_ae {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0 < n)
    (hB : 0 < cfg.B) (s : TimedObservation cfg) :
    ∀ᵐ ω ∂boardClockMeasure n (cfg.B/n), ∀ᶠ k in atTop,
      observedRecycledPair cfg ε M start hn s k ω = observedRecycledTerminalPair cfg ε M start hn (s,ω) := by
  filter_upwards [augRecycledTerminal_done_ae cfg ε M hn hB s.1] with ω hω
  have hd : AugTimedDone cfg (observedRecycledTerminal cfg ε M start hn (s,ω)).1 := by
    rw [observedRecycledTerminal_base]
    exact hω
  filter_upwards [eventually_ge_atTop (augRecycledCompletionIndex cfg ε M hn s.1 ω)] with k hk
  exact observedRecycledPair_absorbing cfg ε M start hn s ω _ hd k hk

theorem observedNoiseState_absorbing {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0 < n)
    (s : TimedObservation cfg) (ω : ℕ → BoardClockPath n) (k : ℕ)
    (hk : AugTimedDone cfg (observedNoiseState cfg ε M start hn s k ω).1) :
    ∀ j, k ≤ j → observedNoiseState cfg ε M start hn s j ω = observedNoiseState cfg ε M start hn s k ω := by
  intro j hj
  induction j, hj using Nat.le_induction with
  | base => rfl
  | succ j hj ih =>
    rw [observedNoiseState_succ,ih]
    exact observedStep_frozen cfg ε M start _ (hk.imp (fun h => h.le) id)

theorem observedTerminal_stable_ae {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0 < n)
    (hB : 0 < cfg.B) (s : TimedObservation cfg) :
    ∀ᵐ ω ∂FreshBoardWaits.freshBoardMeasure n (cfg.B/n), ∀ᶠ k in atTop,
      observedNoiseState cfg ε M start hn s k ω = observedTerminal cfg ε M start hn (s,ω) := by
  filter_upwards [augTimedTerminal_done_ae cfg ε M hn hB s.1] with ω hω
  have hd : AugTimedDone cfg (observedTerminal cfg ε M start hn (s,ω)).1 := by
    rw [observedTerminal_base]
    exact hω
  filter_upwards [eventually_ge_atTop (augTimedCompletionIndex cfg ε M hn s.1 ω)] with k hk
  exact observedNoiseState_absorbing cfg ε M start hn s ω _ hd k hk

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.observedRecycledTerminalPair_measurable
#print axioms NoThreeLine.BirthWitness.observedRecycledTerminal_base
#print axioms NoThreeLine.BirthWitness.observedRecycledTerminalPair_stable_ae
#print axioms NoThreeLine.BirthWitness.observedTerminal_stable_ae
