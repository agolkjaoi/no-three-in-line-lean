import NoThreeLine.RootFreezeRestart

/-! Iterate the simultaneously frozen root observer on one original board.
Its physical/records projection is exactly the existing observed process.
The saved root credit equals the current actual credit on every path. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine.BirthWitness

def rootObserverRecycledPair {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (p : Grid n) (hn : 0<n)
    (s : RootObservation cfg) (k : ℕ) (ω : BoardClockPath n) : RootObservation cfg × BoardClockPath n :=
  RecycledBoardProcess.iterate (rootObserverRestartStep cfg ε M start p hn) s k ω

theorem rootObserverRecycledPair_succ {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (s : RootObservation cfg) (k : ℕ) (ω : BoardClockPath n) :
    rootObserverRecycledPair cfg ε M start p hn s (k+1) ω=
      rootObserverRestartStep cfg ε M start p hn (rootObserverRecycledPair cfg ε M start p hn s k ω) := rfl

theorem rootObserverRecycledPair_joint_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (k : ℕ) : Measurable (fun x : RootObservation cfg × BoardClockPath n=>
      rootObserverRecycledPair cfg ε M start p hn x.1 k x.2) :=
  RecycledBoardProcess.iterate_joint_measurable _ (rootObserverRestartStep_measurable cfg ε M start p hn) k

theorem rootObserverRecycledPair_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (s : RootObservation cfg) (k : ℕ) :
    Measurable (rootObserverRecycledPair cfg ε M start p hn s k) :=
  RecycledBoardProcess.iterate_measurable _ (rootObserverRestartStep_measurable cfg ε M start p hn) s k

theorem rootObserverRecycledPair_projection {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (s : RootObservation cfg) (k : ℕ) (ω : BoardClockPath n) :
    ((rootObserverRecycledPair cfg ε M start p hn s k ω).1.1,
      (rootObserverRecycledPair cfg ε M start p hn s k ω).2)=
      observedRecycledPair cfg ε M start hn s.1 k ω := by
  induction k with
  | zero => rfl
  | succ k ih =>
    rw [rootObserverRecycledPair_succ,rootObserverRestartStep_projection,observedRecycledPair_succ,ih]

theorem rootObserverRecycledPair_invariant {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (s : RootObservation cfg) (hs : RootObserverInvariant cfg p s)
    (k : ℕ) (ω : BoardClockPath n) :
    RootObserverInvariant cfg p (rootObserverRecycledPair cfg ε M start p hn s k ω).1 := by
  induction k with
  | zero => exact hs
  | succ k ih => exact rootObserverStep_invariant cfg ε M start p _ _ ih

theorem rootObserverRecycledPair_frozen_stable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (s : RootObservation cfg) (ω : BoardClockPath n) (k : ℕ)
    (hk : (rootObserverRecycledPair cfg ε M start p hn s k ω).1.2.1=true) :
    ∀j,k≤j→(rootObserverRecycledPair cfg ε M start p hn s j ω).1.2=
      (rootObserverRecycledPair cfg ε M start p hn s k ω).1.2 := by
  intro j hj
  induction j, hj using Nat.le_induction with
  | base => rfl
  | succ j hj ih =>
    exact (rootObserverStep_preserves_frozen cfg ε M start p
      ((rootObserverRecycledPair cfg ε M start p hn s j ω).1,
        WinnerMarkLaw.firstMarkedRace hn (rootObserverRecycledPair cfg ε M start p hn s j ω).2)
      (by rw [ih]; exact hk)).trans ih

theorem rootObserverRecycledPair_credit {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (s : RootObservation cfg) (hs : RootObserverInvariant cfg p s)
    (k : ℕ) (ω : BoardClockPath n) :
    ((rootObserverRecycledPair cfg ε M start p hn s k ω).1.2.2.1.physical.process.accounts p).credit=
      augTimedCredit cfg p (observedRecycledPair cfg ε M start hn s.1 k ω).1.1 := by
  have hi := (rootObserverRecycledPair_invariant cfg ε M start p hn s hs k ω).credit
  rw [← congrArg Prod.fst (rootObserverRecycledPair_projection cfg ε M start p hn s k ω)]
  exact hi

theorem rootObserverRecycledPair_map {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (rate : ℝ) (hr : 0<rate) (s : RootObservation cfg) (k : ℕ) :
    (boardClockMeasure n rate).map (rootObserverRecycledPair cfg ε M start p hn s k)=
      (FiniteTransitionLaw.stateLaw (rootObserverClockStep cfg ε M start p hn)
        (boardClockMeasure n rate) s k).prod (boardClockMeasure n rate) := by
  letI := boardClockMeasure_probability n rate hr
  exact RecycledBoardProcess.iterate_map _ (rootObserverRestartStep_measurable cfg ε M start p hn) _
    (rootObserverRestartStep_map cfg ε M start p hn rate hr) s k

theorem rootObserverRecycledPair_frozen_ae {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 0<cfg.B) (s : RootObservation cfg) (hs : RootObserverInvariant cfg p s) :
    ∀ᵐω∂boardClockMeasure n (cfg.B/n),∃k,(rootObserverRecycledPair cfg ε M start p hn s k ω).1.2.1=true := by
  filter_upwards [observedRecycledPair_completes_ae cfg ε M start hn hB s.1] with ω hω
  obtain ⟨k,hk⟩ := hω
  refine ⟨k,(rootObserverRecycledPair_invariant cfg ε M start p hn s hs k ω).closed_iff.mpr ?_⟩
  left
  rw [congrArg Prod.fst (rootObserverRecycledPair_projection cfg ε M start p hn s k ω)]
  exact hk.imp (fun h=>h.le) id

theorem rootObserverRecycledPair_expected_credit {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : RootObservation cfg) (hs : RootObserverInvariant cfg p s) (k : ℕ) :
    (∫ω,((rootObserverRecycledPair cfg ε M start p hn s k ω).1.2.2.1.physical.process.accounts p).credit
      ∂boardClockMeasure n (cfg.B/n))=augTimedCredit cfg p s.1.1 := by
  simp_rw [rootObserverRecycledPair_credit cfg ε M start p hn s hs k]
  have he (ω : BoardClockPath n) : (observedRecycledPair cfg ε M start hn s.1 k ω).1.1=
      (augRecycledPair cfg ε M hn s.1.1 k ω).1 :=
    congrArg Prod.fst (observedRecycledPair_base cfg ε M start hn s.1 k ω)
  simp_rw [he]
  exact augRecycledState_expected_credit cfg ε M hn hB hm s.1.1 p k

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.rootObserverRecycledPair_projection
#print axioms NoThreeLine.BirthWitness.rootObserverRecycledPair_credit
#print axioms NoThreeLine.BirthWitness.rootObserverRecycledPair_map
#print axioms NoThreeLine.BirthWitness.rootObserverRecycledPair_frozen_ae
#print axioms NoThreeLine.BirthWitness.rootObserverRecycledPair_expected_credit
