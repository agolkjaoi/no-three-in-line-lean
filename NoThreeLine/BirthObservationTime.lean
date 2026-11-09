import NoThreeLine.BirthObservationIteration

/-! The recorded absolute timestamp is the actual old process time plus
the accepted candidate's waiting time, and lies inside the phase horizon. -/
set_option autoImplicit false
noncomputable section
open Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

theorem observationTime_bounds {n : ℕ} (cfg : FlowConfig n) (start : ℝ) (s : AugTimedState cfg) :
    start≤observationTime cfg start s ∧ observationTime cfg start s≤start+cfg.horizon := by
  unfold observationTime
  constructor <;> linarith [s.property.2.1,s.property.2.2]

theorem observationTime_step_mono {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (x : AugTimedState cfg × CandidateData n) :
    observationTime cfg start x.1≤observationTime cfg start (augTimedStep cfg ε M x) :=
  sub_le_sub_left (augTimedStep_remaining_le cfg ε M x.1 x.2) _

theorem birthAdvance_eq_wait {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugTimedState cfg × CandidateData n) (hx : timedBirth cfg ε M x) :
    augAdvance cfg ε M (augTimedInput cfg x.1,x.2.1.1)=x.2.1.1 := by
  change max 0 (min (augGuardTime cfg ε M (augTimedInput cfg x.1)) x.2.1.1)=x.2.1.1
  rw [min_eq_right hx.2.1.2,max_eq_right hx.2.1.1.le]

theorem birthObservationTime_eq_actual_wait {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (x : AugTimedState cfg × CandidateData n) (hx : timedBirth cfg ε M x) :
    birthObservationTime cfg ε M start x=observationTime cfg start x.1+x.2.1.1 := by
  rw [birthObservationTime,birthAdvance_eq_wait cfg ε M x hx]

theorem birthObservationTime_bounds {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (x : AugTimedState cfg × CandidateData n) (hx : timedBirth cfg ε M x) :
    observationTime cfg start x.1<birthObservationTime cfg ε M start x ∧
      birthObservationTime cfg ε M start x≤start+cfg.horizon := by
  constructor
  · rw [birthObservationTime_eq_actual_wait cfg ε M start x hx]
    exact lt_add_of_pos_right _ hx.2.1.1
  · rw [birthObservationTime_eq_after cfg ε M start x hx.1]
    exact (observationTime_bounds cfg start _).2

theorem observed_birth_value_at_actual_wait {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (e : Retention n) (s : TimedObservation cfg) (hs : RecordsConsistent cfg s)
    (ω : ℕ → BoardClockPath n) (j k : ℕ) (hjk : j+1≤k)
    (hb : timedBirth cfg ε M (augTimedNoiseState cfg ε M hn s.1 j ω,WinnerMarkLaw.firstMarkedRace hn (ω j))) :
    (observedWitness cfg e (observedNoiseState cfg ε M start hn s k ω)).retained
        (WinnerMarkLaw.firstMarkedRace hn (ω j)).1.2=
      e.value (WinnerMarkLaw.firstMarkedRace hn (ω j)).1.2
        (observationTime cfg start (augTimedNoiseState cfg ε M hn s.1 j ω)+
          (WinnerMarkLaw.firstMarkedRace hn (ω j)).1.1) := by
  rw [observed_birth_value_stable cfg ε M start hn e s hs ω j k hjk hb]
  have ht := (birthObservationTime_eq_after cfg ε M start _ hb.1).symm.trans
    (birthObservationTime_eq_actual_wait cfg ε M start _ hb)
  simpa only [augTimedNoiseState_succ,augTimedClockStep] using congrArg (e.value _) ht

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.birthObservationTime_bounds
#print axioms NoThreeLine.BirthWitness.observed_birth_value_at_actual_wait
