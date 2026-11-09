import NoThreeLine.ObservedRecycledBirth
import NoThreeLine.ObservedRecycledPhases

/-! Birth records through actual finite phases originate at actual recycled
within-phase candidates, using the absolute left endpoint of that phase. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness

def RecycledPhaseBirthAt {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (s : PhaseObservation n B)
    (ω : BoardClockPath n) (p : Grid n) (t : ℝ) (j : ℕ) : Prop :=
  let x := observedRecycledPhases cs ε M deadline start hn s j ω
  let a := (observedPhaseStart (cs j).config ε M x.1.2).1
  ∃ l < augRecycledCompletionIndex (cs j).config ε M hn a x.2,
    timedBirth (cs j).config ε M ((augRecycledPair (cs j).config ε M hn a l x.2).1,
      WinnerMarkLaw.firstMarkedRace hn (augRecycledPair (cs j).config ε M hn a l x.2).2) ∧
    (WinnerMarkLaw.firstMarkedRace hn (augRecycledPair (cs j).config ε M hn a l x.2).2).1.2=p ∧
    t=observationTime (cs j).config (phaseEndpoint cs start j)
      (augRecycledPair (cs j).config ε M hn a (l+1) x.2).1

theorem observedRecycledPhaseState_record_origin {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (s : PhaseObservation n B)
    (ω : BoardClockPath n) (p : Grid n) (k : ℕ) :
    (observedRecycledPhaseState cs ε M deadline start hn s k ω).2 p=s.2 p ∨
      ∃ j<k, ∃ t, RecycledPhaseBirthAt cs ε M deadline start hn s ω p t j ∧
        (observedRecycledPhaseState cs ε M deadline start hn s k ω).2 p=(true,t) := by
  induction k with
  | zero => exact Or.inl rfl
  | succ k ih =>
    let x := observedRecycledPhases cs ε M deadline start hn s k ω
    have h := observedRecycledTerminal_record_origin (cs k).config ε M (phaseEndpoint cs start k) hn
      (observedPhaseStart (cs k).config ε M x.1.2) x.2 p
    have he : (observedRecycledPhaseState cs ε M deadline start hn s (k+1) ω).2 p =
        (observedRecycledTerminal (cs k).config ε M (phaseEndpoint cs start k) hn
          (observedPhaseStart (cs k).config ε M x.1.2,x.2)).2 p := by
      change (observedRecycledPhases cs ε M deadline start hn s (k+1) ω).1.2.2 p=_
      rw [observedRecycledPhases_succ]
      rfl
    rcases h with h | ⟨l,hl,hb,hq,hr⟩
    · have heq : (observedRecycledPhaseState cs ε M deadline start hn s (k+1) ω).2 p =
          (observedRecycledPhaseState cs ε M deadline start hn s k ω).2 p := he.trans h
      rcases ih with hi | ⟨j,hj,t,ht,hr⟩
      · exact Or.inl (heq.trans hi)
      · exact Or.inr ⟨j,Nat.lt_succ_of_lt hj,t,ht,heq.trans hr⟩
    · exact Or.inr ⟨k,Nat.lt_succ_self k,_,⟨l,hl,hb,hq,rfl⟩,he.trans hr⟩

theorem recycledPhaseBirthAt_time_bounds {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (s : PhaseObservation n B)
    (ω : BoardClockPath n) (p : Grid n) (t : ℝ) (j : ℕ)
    (ht : RecycledPhaseBirthAt cs ε M deadline start hn s ω p t j) :
    phaseEndpoint cs start j≤t ∧ t≤phaseEndpoint cs start (j+1) := by
  rcases ht with ⟨l,hl,hb,hq,rfl⟩
  have h := observationTime_bounds (cs j).config (phaseEndpoint cs start j)
    (augRecycledPair (cs j).config ε M hn
      (observedPhaseStart (cs j).config ε M
        (observedRecycledPhases cs ε M deadline start hn s j ω).1.2).1
      (l+1) (observedRecycledPhases cs ε M deadline start hn s j ω).2).1
  rw [phaseEndpoint_succ]
  exact h

theorem observedRecycledPhaseState_selected_birth_value {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (e : Retention n) (ω : BoardClockPath n) (p : Grid n) (k : ℕ)
    (hp : p ∈ (observedRecycledPhaseState cs ε M deadline start hn
      (observedInitial B hB deadline start) k ω).1.val.physical.process.selected) :
    ∃ j<k, ∃ t, RecycledPhaseBirthAt cs ε M deadline start hn
        (observedInitial B hB deadline start) ω p t j ∧
      (phaseWitness e (observedRecycledPhaseState cs ε M deadline start hn
        (observedInitial B hB deadline start) k ω)).retained p=e.value p t := by
  have hc := observedRecycledPhaseState_consistent cs ε M deadline start hn
    (observedInitial B hB deadline start) (observedInitial_consistent B hB deadline start) k ω
  have hb := (hc p).mpr hp
  rcases observedRecycledPhaseState_record_origin cs ε M deadline start hn
    (observedInitial B hB deadline start) ω p k with h | ⟨j,hj,t,ht,hr⟩
  · rw [h] at hb
    contradiction
  · refine ⟨j,hj,t,ht,?_⟩
    change recordedValue e _ p=_
    unfold recordedValue
    rw [hr]
    rfl

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.observedRecycledPhaseState_record_origin
#print axioms NoThreeLine.BirthWitness.recycledPhaseBirthAt_time_bounds
#print axioms NoThreeLine.BirthWitness.observedRecycledPhaseState_selected_birth_value
