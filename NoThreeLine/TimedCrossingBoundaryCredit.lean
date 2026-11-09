import NoThreeLine.TimedCrossingStageWeight
import NoThreeLine.ScheduledProtectedPhaseChain

/-! On a surviving unfinished phase with no crossing, its actual
deadline boundary carries at most the same threshold of credit. -/
set_option autoImplicit false
set_option maxHeartbeats 1500000
noncomputable section
namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem timedCrossingPhasePair_boundary_congr {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hn : 0<n) (b c : ℝ) (j : ℕ)
    (x : ProtectedTimedState (cs j).config×BoardClockPath n) :
    let r := timedCrossingPhasePair cs ε M deadline start L N E A hn b j x
    let q := timedCrossingPhasePair cs ε M deadline start L N E A hn c j x
    (r.1.1,r.2)=(q.1.1,q.2) := rfl

theorem timedCrossingPhasePair_flag_antitone {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hn : 0<n) (b c : ℝ) (hbc : b≤c) (j : ℕ)
    (s : ProtectedTimedState (cs j).config) (ω : BoardClockPath n)
    (h : (timedCrossingPhasePair cs ε M deadline start L N E A hn c j (s,ω)).1.2=true) :
    (timedCrossingPhasePair cs ε M deadline start L N E A hn b j (s,ω)).1.2=true := by
  rw [timedCrossingPhasePair_flag,mem_protectedActualExceedance_iff] at h ⊢
  obtain ⟨k,hN,hk⟩ := h
  refine ⟨k,hN,?_⟩
  rcases hk with h | ⟨hd,t,ht,htd,h⟩
  · exact Or.inl (hbc.trans_lt h)
  · exact Or.inr ⟨hd,t,ht,htd,hbc.trans_lt h⟩

theorem timedCrossingPhasePair_total_le_of_no_flag {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hn : 0<n) (b : ℝ) (j : ℕ)
    (s : ProtectedTimedState (cs j).config) (ω : BoardClockPath n)
    (ho : occupancy (timedCrossingPhasePair cs ε M deadline start L N E A hn b j (s,ω)).1.1.1.val.physical.process L=N)
    (hno : (timedCrossingPhasePair cs ε M deadline start L N E A hn b j (s,ω)).1.2=false) :
    protectedPhaseTotal L E A (timedCrossingPhasePair cs ε M deadline start L N E A hn b j (s,ω)).1.1≤b := by
  let cfg := (cs j).config
  let k := augRecycledCompletionIndex cfg ε M hn s.1 ω
  let v := (protectedRecycledPair cfg ε M L hn s k ω).1
  let x := ((v,(0:ℝ)),(0:ℝ))
  have hocc : occupancy v.1.val.1.physical.process L=N := by
    change occupancy (protectedPhaseEnd cfg L deadline (phaseEndpoint cs start (j+1)) x).1.val.physical.process L=N at ho
    unfold protectedPhaseEnd protectedDeadlineBook at ho
    rwa [augValidDeadlineRetirement_occupancy] at ho
  change protectedPhaseTotal L E A (protectedPhaseEnd cfg L deadline (phaseEndpoint cs start (j+1)) x)≤b
  rw [protectedPhaseEnd_total]
  apply le_of_not_gt
  intro h
  have hhit := (timedCrossingPhasePair_flag cs ε M deadline start L N E A hn b j s ω).mpr
    ((mem_protectedActualExceedance_iff cfg ε M L N E A hn s b ω).mpr ⟨k,hocc,Or.inl h⟩)
  rw [hno] at hhit
  cases hhit

end NoThreeLine

#print axioms NoThreeLine.timedCrossingPhasePair_total_le_of_no_flag
#print axioms NoThreeLine.timedCrossingPhasePair_flag_antitone

