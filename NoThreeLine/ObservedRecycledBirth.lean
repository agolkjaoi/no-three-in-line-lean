import NoThreeLine.ObservedRecycledTerminal
import NoThreeLine.BirthObservationOrigin
import NoThreeLine.BirthObservationTime

/-! Pathwise birth origins on one original board. The iid-recursion syntax
is evaluated at the actual residual boards; these inputs are not asserted iid. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness

def observedResidualNoise {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0 < n)
    (s : TimedObservation cfg) (ω : BoardClockPath n) (j : ℕ) : BoardClockPath n :=
  (observedRecycledPair cfg ε M start hn s j ω).2

theorem observedRecycled_state_eq_noise {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0 < n)
    (s : TimedObservation cfg) (ω : BoardClockPath n) (k : ℕ) :
    (observedRecycledPair cfg ε M start hn s k ω).1 =
      observedNoiseState cfg ε M start hn s k (observedResidualNoise cfg ε M start hn s ω) := by
  induction k with
  | zero => rfl
  | succ k ih =>
    rw [observedNoiseState_succ]
    change observedStep cfg ε M start
      ((observedRecycledPair cfg ε M start hn s k ω).1,
        WinnerMarkLaw.firstMarkedRace hn (observedResidualNoise cfg ε M start hn s ω k)) = _
    rw [ih]

theorem observedResidualNoise_base {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0 < n)
    (s : TimedObservation cfg) (ω : BoardClockPath n) (j : ℕ) :
    observedResidualNoise cfg ε M start hn s ω j = (augRecycledPair cfg ε M hn s.1 j ω).2 :=
  congrArg Prod.snd (observedRecycledPair_base cfg ε M start hn s j ω)

theorem augTimedNoiseState_of_observedResidualNoise {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0 < n)
    (s : TimedObservation cfg) (ω : BoardClockPath n) (j : ℕ) :
    augTimedNoiseState cfg ε M hn s.1 j (observedResidualNoise cfg ε M start hn s ω) =
      (augRecycledPair cfg ε M hn s.1 j ω).1 := by
  have h := congrArg Prod.fst (observedRecycled_state_eq_noise cfg ε M start hn s ω j)
  rw [observedNoiseState_base] at h
  exact h.symm.trans (congrArg Prod.fst (observedRecycledPair_base cfg ε M start hn s j ω))

theorem observedRecycled_record_origin {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0 < n)
    (s : TimedObservation cfg) (ω : BoardClockPath n) (p : Grid n) (k : ℕ) :
    (observedRecycledPair cfg ε M start hn s k ω).1.2 p=s.2 p ∨
      ∃ j<k, timedBirth cfg ε M ((augRecycledPair cfg ε M hn s.1 j ω).1,
          WinnerMarkLaw.firstMarkedRace hn (augRecycledPair cfg ε M hn s.1 j ω).2) ∧
        (WinnerMarkLaw.firstMarkedRace hn (augRecycledPair cfg ε M hn s.1 j ω).2).1.2=p ∧
        (observedRecycledPair cfg ε M start hn s k ω).1.2 p=
          (true,observationTime cfg start (augRecycledPair cfg ε M hn s.1 (j+1) ω).1) := by
  have h := observedNoiseState_record_origin cfg ε M start hn s
    (observedResidualNoise cfg ε M start hn s ω) p k
  simp only [augTimedNoiseState_of_observedResidualNoise,observedResidualNoise_base,
    ← observedRecycled_state_eq_noise] at h
  exact h

theorem observedRecycled_birth_value_at_actual_wait {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0 < n)
    (e : Retention n) (s : TimedObservation cfg) (hs : RecordsConsistent cfg s)
    (ω : BoardClockPath n) (j k : ℕ) (hjk : j+1≤k)
    (hb : timedBirth cfg ε M ((augRecycledPair cfg ε M hn s.1 j ω).1,
      WinnerMarkLaw.firstMarkedRace hn (augRecycledPair cfg ε M hn s.1 j ω).2)) :
    (observedWitness cfg e (observedRecycledPair cfg ε M start hn s k ω).1).retained
        (WinnerMarkLaw.firstMarkedRace hn (augRecycledPair cfg ε M hn s.1 j ω).2).1.2 =
      e.value (WinnerMarkLaw.firstMarkedRace hn (augRecycledPair cfg ε M hn s.1 j ω).2).1.2
        (observationTime cfg start (augRecycledPair cfg ε M hn s.1 j ω).1+
          (WinnerMarkLaw.firstMarkedRace hn (augRecycledPair cfg ε M hn s.1 j ω).2).1.1) := by
  have hb' : timedBirth cfg ε M
      (augTimedNoiseState cfg ε M hn s.1 j (observedResidualNoise cfg ε M start hn s ω),
        WinnerMarkLaw.firstMarkedRace hn (observedResidualNoise cfg ε M start hn s ω j)) := by
    simpa only [augTimedNoiseState_of_observedResidualNoise,observedResidualNoise_base] using hb
  have h := observed_birth_value_at_actual_wait cfg ε M start hn e s hs
    (observedResidualNoise cfg ε M start hn s ω) j k hjk hb'
  simpa only [augTimedNoiseState_of_observedResidualNoise,observedResidualNoise_base,
    ← observedRecycled_state_eq_noise] using h

theorem observedRecycledTerminal_record_origin {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0 < n)
    (s : TimedObservation cfg) (ω : BoardClockPath n) (p : Grid n) :
    (observedRecycledTerminal cfg ε M start hn (s,ω)).2 p=s.2 p ∨
      ∃ j<augRecycledCompletionIndex cfg ε M hn s.1 ω,
        timedBirth cfg ε M ((augRecycledPair cfg ε M hn s.1 j ω).1,
          WinnerMarkLaw.firstMarkedRace hn (augRecycledPair cfg ε M hn s.1 j ω).2) ∧
        (WinnerMarkLaw.firstMarkedRace hn (augRecycledPair cfg ε M hn s.1 j ω).2).1.2=p ∧
        (observedRecycledTerminal cfg ε M start hn (s,ω)).2 p=
          (true,observationTime cfg start (augRecycledPair cfg ε M hn s.1 (j+1) ω).1) :=
  observedRecycled_record_origin cfg ε M start hn s ω p _

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.observedRecycled_record_origin
#print axioms NoThreeLine.BirthWitness.observedRecycled_birth_value_at_actual_wait
#print axioms NoThreeLine.BirthWitness.observedRecycledTerminal_record_origin
