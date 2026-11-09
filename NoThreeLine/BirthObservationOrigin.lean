import NoThreeLine.BirthObservationIteration

/-! Every newly present timestamp comes from an actual accepted birth in
the original augmented iteration. Starting without selected points gives
b_q=e_q(T_birth), including zero retention values and stopped terminal paths. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

theorem observedNoiseState_record_origin {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (s : TimedObservation cfg) (ω : ℕ → BoardClockPath n) (p : Grid n) (k : ℕ) :
    (observedNoiseState cfg ε M start hn s k ω).2 p=s.2 p ∨
      ∃j<k,timedBirth cfg ε M (augTimedNoiseState cfg ε M hn s.1 j ω,WinnerMarkLaw.firstMarkedRace hn (ω j)) ∧
        (WinnerMarkLaw.firstMarkedRace hn (ω j)).1.2=p ∧
        (observedNoiseState cfg ε M start hn s k ω).2 p=
          (true,observationTime cfg start (augTimedNoiseState cfg ε M hn s.1 (j+1) ω)) := by
  induction k with
  | zero => exact Or.inl rfl
  | succ k ih =>
    by_cases h : timedBirth cfg ε M ((observedNoiseState cfg ε M start hn s k ω).1,
        WinnerMarkLaw.firstMarkedRace hn (ω k)) ∧ p=(WinnerMarkLaw.firstMarkedRace hn (ω k)).1.2
    · right
      refine ⟨k,Nat.lt_succ_self k,?_,h.2.symm,?_⟩
      · simpa only [observedNoiseState_base] using h.1
      · have hr := observedStep_record_of_birth cfg ε M start
          (observedNoiseState cfg ε M start hn s k ω,WinnerMarkLaw.firstMarkedRace hn (ω k)) h.1
        have ht := birthObservationTime_eq_after cfg ε M start
          ((observedNoiseState cfg ε M start hn s k ω).1,WinnerMarkLaw.firstMarkedRace hn (ω k)) h.1.1
        rw [observedNoiseState_base] at ht
        rw [observedNoiseState_succ]
        simpa only [h.2,observedNoiseState_base,ht,augTimedNoiseState_succ,augTimedClockStep] using hr
    · have heq : (observedNoiseState cfg ε M start hn s (k+1) ω).2 p=
          (observedNoiseState cfg ε M start hn s k ω).2 p := by
        rw [observedNoiseState_succ]
        by_cases hb : timedBirth cfg ε M ((observedNoiseState cfg ε M start hn s k ω).1,
            WinnerMarkLaw.firstMarkedRace hn (ω k))
        · have hp : p≠(WinnerMarkLaw.firstMarkedRace hn (ω k)).1.2 := fun hp=>h ⟨hb,hp⟩
          simp only [observedStep,if_pos hb,Function.update_of_ne hp]
        · rw [observedStep_record_no_birth cfg ε M start _ hb]
      rcases ih with hi | ⟨j,hj,hb,hq,hr⟩
      · exact Or.inl (heq.trans hi)
      · exact Or.inr ⟨j,Nat.lt_succ_of_lt hj,hb,hq,heq.trans hr⟩

def emptyObservation {n : ℕ} (cfg : FlowConfig n) (s : AugTimedState cfg) : TimedObservation cfg :=
  (s,fun _=>(false,0))

theorem emptyObservation_consistent {n : ℕ} (cfg : FlowConfig n) (s : AugTimedState cfg)
    (hs : s.val.1.physical.process.selected=∅) : RecordsConsistent cfg (emptyObservation cfg s) := by
  intro q
  simp [emptyObservation,hs]

theorem observed_selected_birth_value {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (e : Retention n) (s : AugTimedState cfg) (hs : s.val.1.physical.process.selected=∅)
    (ω : ℕ → BoardClockPath n) (p : Grid n) (k : ℕ)
    (hp : p∈(augTimedNoiseState cfg ε M hn s k ω).val.1.physical.process.selected) :
    ∃j<k,timedBirth cfg ε M (augTimedNoiseState cfg ε M hn s j ω,WinnerMarkLaw.firstMarkedRace hn (ω j)) ∧
      (WinnerMarkLaw.firstMarkedRace hn (ω j)).1.2=p ∧
      (observedWitness cfg e (observedNoiseState cfg ε M start hn (emptyObservation cfg s) k ω)).retained p=
        e.value p (observationTime cfg start (augTimedNoiseState cfg ε M hn s (j+1) ω)) := by
  have hc := observedNoiseState_consistent cfg ε M start hn (emptyObservation cfg s)
    (emptyObservation_consistent cfg s hs) k ω
  have hborn : ((observedNoiseState cfg ε M start hn (emptyObservation cfg s) k ω).2 p).1=true :=
    (hc p).mpr (by rw [observedNoiseState_base]; exact hp)
  rcases observedNoiseState_record_origin cfg ε M start hn (emptyObservation cfg s) ω p k with h | ⟨j,hj,hb,hq,hr⟩
  · rw [h] at hborn
    contradiction
  · refine ⟨j,hj,hb,hq,?_⟩
    change recordedValue e _ p=_
    unfold recordedValue
    rw [hr]
    rfl

theorem observed_unselected_value_zero {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (e : Retention n) (s : TimedObservation cfg) (hs : RecordsConsistent cfg s)
    (ω : ℕ → BoardClockPath n) (p : Grid n) (k : ℕ)
    (hp : p∉(augTimedNoiseState cfg ε M hn s.1 k ω).val.1.physical.process.selected) :
    (observedWitness cfg e (observedNoiseState cfg ε M start hn s k ω)).retained p=0 := by
  apply (observedWitness_valid cfg e _ (observedNoiseState_consistent cfg ε M start hn s hs k ω)).2.2
  change p∉(observedNoiseState cfg ε M start hn s k ω).1.val.1.physical.process.selected
  rw [observedNoiseState_base]
  exact hp

theorem observedTerminal_selected_birth_value {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (e : Retention n) (s : AugTimedState cfg) (hs : s.val.1.physical.process.selected=∅)
    (ω : ℕ → BoardClockPath n) (p : Grid n)
    (hp : p∈(augTimedTerminal cfg ε M hn s ω).val.1.physical.process.selected) :
    ∃j<augTimedCompletionIndex cfg ε M hn s ω,
      timedBirth cfg ε M (augTimedNoiseState cfg ε M hn s j ω,WinnerMarkLaw.firstMarkedRace hn (ω j)) ∧
      (WinnerMarkLaw.firstMarkedRace hn (ω j)).1.2=p ∧
      (observedWitness cfg e (observedTerminal cfg ε M start hn (emptyObservation cfg s,ω))).retained p=
        e.value p (observationTime cfg start (augTimedNoiseState cfg ε M hn s (j+1) ω)) :=
  observed_selected_birth_value cfg ε M start hn e s hs ω p _ hp

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.observedNoiseState_record_origin
#print axioms NoThreeLine.BirthWitness.observedTerminal_selected_birth_value
