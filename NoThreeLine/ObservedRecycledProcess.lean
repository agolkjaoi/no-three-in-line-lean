import NoThreeLine.BirthObservedRestart
import NoThreeLine.RecycledPhaseKernel
import NoThreeLine.RecycledCreditMartingale

/-! Birth-time records carried by a process on one original clock board.
The physical/eta projection is pathwise the existing recycled process;
the full finite observed histories have the constructed iid-observer law. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine.BirthWitness

def observedRecycledPair {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0 < n)
    (s : TimedObservation cfg) (k : ℕ) (ω : BoardClockPath n) : TimedObservation cfg × BoardClockPath n :=
  RecycledBoardProcess.iterate (observedRestartStep cfg ε M start hn) s k ω

theorem observedRecycledPair_succ {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0 < n)
    (s : TimedObservation cfg) (k : ℕ) (ω : BoardClockPath n) :
    observedRecycledPair cfg ε M start hn s (k+1) ω =
      observedRestartStep cfg ε M start hn (observedRecycledPair cfg ε M start hn s k ω) := rfl

theorem observedRecycledPair_joint_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0 < n)
    (k : ℕ) : Measurable (fun a : TimedObservation cfg × BoardClockPath n =>
      observedRecycledPair cfg ε M start hn a.1 k a.2) :=
  RecycledBoardProcess.iterate_joint_measurable _ (observedRestartStep_measurable cfg ε M start hn) k

theorem observedRecycledPair_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0 < n)
    (s : TimedObservation cfg) (k : ℕ) : Measurable (observedRecycledPair cfg ε M start hn s k) :=
  RecycledBoardProcess.iterate_measurable _ (observedRestartStep_measurable cfg ε M start hn) s k

theorem observedRecycledPair_base {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0 < n)
    (s : TimedObservation cfg) (k : ℕ) (ω : BoardClockPath n) :
    ((observedRecycledPair cfg ε M start hn s k ω).1.1,(observedRecycledPair cfg ε M start hn s k ω).2) =
      augRecycledPair cfg ε M hn s.1 k ω := by
  induction k with
  | zero => rfl
  | succ k ih =>
    change augRestartStep cfg ε M hn
      ((observedRecycledPair cfg ε M start hn s k ω).1.1,(observedRecycledPair cfg ε M start hn s k ω).2) =
        augRestartStep cfg ε M hn (augRecycledPair cfg ε M hn s.1 k ω)
    exact congrArg (augRestartStep cfg ε M hn) ih

theorem observedRecycledPair_consistent {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0 < n)
    (s : TimedObservation cfg) (hs : RecordsConsistent cfg s) (k : ℕ) (ω : BoardClockPath n) :
    RecordsConsistent cfg (observedRecycledPair cfg ε M start hn s k ω).1 := by
  induction k with
  | zero => exact hs
  | succ k ih => exact observedStep_consistent cfg ε M start _ ih

theorem observedRecycledPair_map {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0 < n)
    (rate : ℝ) (hr : 0 < rate) (s : TimedObservation cfg) (k : ℕ) :
    (boardClockMeasure n rate).map (observedRecycledPair cfg ε M start hn s k) =
      (FiniteTransitionLaw.stateLaw (observedClockStep cfg ε M start hn) (boardClockMeasure n rate) s k).prod
        (boardClockMeasure n rate) := by
  letI := boardClockMeasure_probability n rate hr
  exact RecycledBoardProcess.iterate_map _ (observedRestartStep_measurable cfg ε M start hn) _
    (observedRestartStep_map cfg ε M start hn rate hr) s k

theorem observedRecycledHistory_residual_map {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0 < n)
    (rate : ℝ) (hr : 0 < rate) (s : TimedObservation cfg) (k : ℕ) :
    (boardClockMeasure n rate).map (fun ω =>
      ((fun j : Fin (k+1) => (observedRecycledPair cfg ε M start hn s j.val ω).1),
        (observedRecycledPair cfg ε M start hn s k ω).2)) =
      ((FreshBoardWaits.freshBoardMeasure n rate).map
        (fun ω => fun j : Fin (k+1) => observedNoiseState cfg ε M start hn s j.val ω)).prod
          (boardClockMeasure n rate) := by
  letI := boardClockMeasure_probability n rate hr
  exact RememberedRestart.history_residual_map (observedRestartStep cfg ε M start hn)
    (observedRestartStep_measurable cfg ε M start hn) (observedClockStep cfg ε M start hn)
    (observedClockStep_measurable cfg ε M start hn) _ _ (observedRestartStep_map cfg ε M start hn rate hr) s k

theorem observedRecycledPair_record_stable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0 < n)
    (s : TimedObservation cfg) (hs : RecordsConsistent cfg s) (ω : BoardClockPath n)
    (p : Grid n) (j : ℕ) (hp : (((observedRecycledPair cfg ε M start hn s j ω).1.2) p).1 = true) :
    ∀ k, j ≤ k → (observedRecycledPair cfg ε M start hn s k ω).1.2 p =
      (observedRecycledPair cfg ε M start hn s j ω).1.2 p := by
  intro k hk
  induction k, hk using Nat.le_induction with
  | base => rfl
  | succ k hk ih =>
    rw [observedRecycledPair_succ]
    exact (observedStep_record_preserved cfg ε M start _
      (observedRecycledPair_consistent cfg ε M start hn s hs k ω) p (by rw [ih]; exact hp)).trans ih

theorem observedRecycledPair_absorbing {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0 < n)
    (s : TimedObservation cfg) (ω : BoardClockPath n) (k : ℕ)
    (hk : AugTimedDone cfg (observedRecycledPair cfg ε M start hn s k ω).1.1) :
    ∀ j, k ≤ j → observedRecycledPair cfg ε M start hn s j ω = observedRecycledPair cfg ε M start hn s k ω := by
  intro j hj
  induction j, hj using Nat.le_induction with
  | base => rfl
  | succ j hj ih =>
    rw [observedRecycledPair_succ,ih]
    exact observedRestartStep_done cfg ε M start hn _ hk _

theorem observedRecycledPair_completes_ae {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0 < n)
    (hB : 0 < cfg.B) (s : TimedObservation cfg) :
    ∀ᵐ ω ∂boardClockMeasure n (cfg.B/n), ∃ k, AugTimedDone cfg (observedRecycledPair cfg ε M start hn s k ω).1.1 := by
  filter_upwards [augRecycledPair_completes_ae cfg ε M hn hB s.1] with ω hω
  obtain ⟨k,hk⟩ := hω
  refine ⟨k,?_⟩
  rw [← congrArg Prod.fst (observedRecycledPair_base cfg ε M start hn s k ω)] at hk
  exact hk

def observedRecycledFiltration {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0 < n) (s : TimedObservation cfg) :
    Filtration ℕ (inferInstance : MeasurableSpace (BoardClockPath n)) :=
  StateHistory.filtration (fun k ω => (observedRecycledPair cfg ε M start hn s k ω).1)
    (fun k => (observedRecycledPair_measurable cfg ε M start hn s k).fst)

theorem observedRecycled_credit_martingale {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0 < n)
    (hB : 0 < cfg.B) (hm : ∀ p, cfg.mask p ≤ 1) (s : TimedObservation cfg) (p : Grid n) :
    Martingale (fun k ω => augTimedCredit cfg p (observedRecycledPair cfg ε M start hn s k ω).1.1)
      (observedRecycledFiltration cfg ε M start hn s) (boardClockMeasure n (cfg.B/n)) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  exact RecycledBoardProcess.credit_martingale (observedRestartStep cfg ε M start hn)
    (observedRestartStep_measurable cfg ε M start hn) _
    (observedRestartStep_map cfg ε M start hn (cfg.B/n) (div_pos hB (by exact_mod_cast hn)))
    (fun s => augTimedCredit cfg p s.1) ((augTimedCredit_measurable cfg p).comp measurable_fst)
    cfg.B (fun s => augTimedCredit_bounds cfg p s.1)
    (fun s => augTimedClockStep_credit cfg ε M hn hB hm s.1 p) s

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.observedRecycledPair_base
#print axioms NoThreeLine.BirthWitness.observedRecycledHistory_residual_map
#print axioms NoThreeLine.BirthWitness.observedRecycledPair_completes_ae
#print axioms NoThreeLine.BirthWitness.observedRecycled_credit_martingale
