import NoThreeLine.WitnessTerminalSource

/-! Calendar endpoints from the actual original-board remaining times.
They are monotone, and each gap is exactly the actual elapsed segment. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness

def elapsedTime {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (s : GoodObservation cfg) (k : ℕ) (ω : BoardClockPath n) : ℝ :=
  s.val.1.val.2-(RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M start hn) s k ω).1.val.1.val.2

theorem goodState_observation_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (s : GoodObservation cfg) (k : ℕ) :
    Measurable (fun ω=>(RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M start hn) s k ω).1.val) :=
  measurable_subtype_coe.comp (RecycledBoardProcess.iterate_measurable _
    (goodObservedRestartStep_measurable cfg ε M start hn) s k).fst

theorem elapsedTime_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (s : GoodObservation cfg) (k : ℕ) : Measurable (elapsedTime cfg ε M start hn s k) :=
  measurable_const.sub (measurable_subtype_coe.comp
    (goodState_observation_measurable cfg ε M start hn s k).fst).snd

theorem elapsedTime_zero {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (s : GoodObservation cfg) (ω : BoardClockPath n) : elapsedTime cfg ε M start hn s 0 ω=0 := by
  simp [elapsedTime,RecycledBoardProcess.iterate]

theorem elapsedTime_succ_sub {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (s : GoodObservation cfg) (k : ℕ) (ω : BoardClockPath n) :
    elapsedTime cfg ε M start hn s (k+1) ω-elapsedTime cfg ε M start hn s k ω=
      observedAdvance cfg ε M
        ((RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M start hn) s k ω).1.val,
          WinnerMarkLaw.firstMarkedRace hn
            (RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M start hn) s k ω).2) := by
  rw [observedAdvance_eq_remaining_drop cfg ε M start]
  change (s.val.1.val.2-(_ : TimedObservation cfg).1.val.2)-
    (s.val.1.val.2-(_ : GoodObservation cfg).val.1.val.2)=_
  dsimp [elapsedTime,RecycledBoardProcess.iterate,goodObservedRestartStep,goodObservedClockStep,goodObservedStep]
  ring

theorem elapsedTime_monotone {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (s : GoodObservation cfg) (ω : BoardClockPath n) : Monotone (fun k=>elapsedTime cfg ε M start hn s k ω) := by
  apply monotone_nat_of_le_succ
  intro k
  have hgap := elapsedTime_succ_sub cfg ε M start hn s k ω
  have ha := (observedAdvance_mem cfg ε M
    ((RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M start hn) s k ω).1.val,
      WinnerMarkLaw.firstMarkedRace hn
        (RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M start hn) s k ω).2)).1
  linarith

theorem elapsedTime_mem {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (s : GoodObservation cfg) (k : ℕ) (ω : BoardClockPath n) :
    elapsedTime cfg ε M start hn s k ω∈Icc (0:ℝ) s.val.1.val.2 := by
  constructor
  · have h := elapsedTime_monotone cfg ε M start hn s ω (Nat.zero_le k)
    simpa only [elapsedTime_zero] using h
  · exact sub_le_self _
      (RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M start hn) s k ω).1.val.1.property.2.1

theorem elapsed_segments_unique {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (s : GoodObservation cfg) (ω : BoardClockPath n) (i j : ℕ) (t : ℝ)
    (hi : t∈Ioo (elapsedTime cfg ε M start hn s i ω) (elapsedTime cfg ε M start hn s (i+1) ω))
    (hj : t∈Ioo (elapsedTime cfg ε M start hn s j ω) (elapsedTime cfg ε M start hn s (j+1) ω)) : i=j := by
  rcases lt_trichotomy i j with h|h|h
  · have hm := elapsedTime_monotone cfg ε M start hn s ω (Nat.succ_le_of_lt h)
    exact False.elim (not_lt_of_ge hm (hj.1.trans hi.2))
  · exact h
  · have hm := elapsedTime_monotone cfg ε M start hn s ω (Nat.succ_le_of_lt h)
    exact False.elim (not_lt_of_ge hm (hi.1.trans hj.2))

theorem observationTime_local_shift {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (s : GoodObservation cfg) (k : ℕ) (ω : BoardClockPath n) (t : ℝ) :
    observationTime cfg start
        (RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M start hn) s k ω).1.val.1+
      (t-elapsedTime cfg ε M start hn s k ω)=observationTime cfg start s.val.1+t := by
  unfold observationTime elapsedTime
  ring

theorem elapsed_segment_context {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (s : GoodObservation cfg) (k : ℕ) (ω : BoardClockPath n) (t : ℝ)
    (ht : t∈Ioo (elapsedTime cfg ε M start hn s k ω) (elapsedTime cfg ε M start hn s (k+1) ω)) :
    ¬observationDone cfg (RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M start hn) s k ω).1.val ∧
      t-elapsedTime cfg ε M start hn s k ω∈Ioo (0:ℝ)
        (augGuardTime cfg ε M (augTimedInput cfg
          (RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M start hn) s k ω).1.val.1)) := by
  have hgap := elapsedTime_succ_sub cfg ε M start hn s k ω
  have ha := observedAdvance_mem cfg ε M
    ((RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M start hn) s k ω).1.val,
      WinnerMarkLaw.firstMarkedRace hn
        (RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M start hn) s k ω).2)
  constructor
  · intro hd
    simp only [observedAdvance,if_pos hd] at hgap
    linarith [ht.1,ht.2]
  · constructor <;> linarith [ht.1,ht.2,ha.2]

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.elapsedTime_succ_sub
#print axioms NoThreeLine.BirthWitness.elapsed_segments_unique
#print axioms NoThreeLine.BirthWitness.observationTime_local_shift
