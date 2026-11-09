import NoThreeLine.ProtectedCrossingTerminal
import NoThreeLine.TimedTerminalRestart

/-! Continuing from an actual saved-ledger update keeps every later
boundary and flow observation. A stage absent in the earlier prefix
has exactly the same exceedance event on the restarted segment. -/
set_option autoImplicit false
set_option maxHeartbeats 1300000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness RecycledBoardProcess

theorem protectedRecycledPair_continue {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (hn : 0<n) (s : ProtectedTimedState cfg) (i k : ℕ) (ω : BoardClockPath n) :
    let r := protectedRecycledPair cfg ε M L hn s i ω
    protectedRecycledPair cfg ε M L hn r.1 k r.2=protectedRecycledPair cfg ε M L hn s (i+k) ω :=
  (iterate_add (protectedRestartStep cfg ε M L hn) s i k ω).symm

theorem protectedActualExceedance_continue_iff {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (N : ℕ) (E : Finset (Grid n)) (A : ℝ→ℝ) (hn : 0<n)
    (s : ProtectedTimedState cfg) (b : ℝ) (i : ℕ) (ω : BoardClockPath n)
    (hbefore : ∀k < i,occupancy (protectedRecycledPair cfg ε M L hn s k ω).1.1.val.1.physical.process L≠N) :
    let r := protectedRecycledPair cfg ε M L hn s i ω
    r.2∈protectedActualExceedance cfg ε M L N E A hn r.1 b ↔
      ω∈protectedActualExceedance cfg ε M L N E A hn s b := by
  let r := protectedRecycledPair cfg ε M L hn s i ω
  change r.2∈protectedActualExceedance cfg ε M L N E A hn r.1 b ↔ _
  rw [mem_protectedActualExceedance_iff,mem_protectedActualExceedance_iff]
  have hp (k : ℕ) : protectedRecycledPair cfg ε M L hn r.1 k r.2=
      protectedRecycledPair cfg ε M L hn s (i+k) ω :=
    protectedRecycledPair_continue cfg ε M L hn s i k ω
  constructor
  · rintro ⟨k,h⟩
    refine ⟨i+k,?_⟩
    rw [hp k,hp (k+1),←Nat.add_assoc] at h
    exact h
  · rintro ⟨k,h⟩
    have hki : i≤k := le_of_not_gt (fun hlt=>hbefore k hlt h.1)
    let t := k-i
    have ht : i+t=k := Nat.add_sub_of_le hki
    refine ⟨t,?_⟩
    rw [hp t,hp (t+1),←Nat.add_assoc,ht]
    exact h

theorem protectedRecycledTerminalPair_continue {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hn : 0<n) (s : ProtectedTimedState cfg) (i : ℕ) (ω : BoardClockPath n)
    (hd : AugTimedDone cfg (augRecycledTerminal cfg ε M hn s.1 ω)) :
    let r := protectedRecycledPair cfg ε M L hn s i ω
    protectedRecycledTerminalPair cfg ε M L hn r.1 r.2=protectedRecycledTerminalPair cfg ε M L hn s ω := by
  let r := protectedRecycledPair cfg ε M L hn s i ω
  let j := augRecycledCompletionIndex cfg ε M hn s.1 ω
  let j' := augRecycledCompletionIndex cfg ε M hn r.1.1 r.2
  have hd₀ : AugTimedDone cfg (protectedRecycledPair cfg ε M L hn s j ω).1.1 := by
    rw [congrArg Prod.fst (protectedRecycledPair_projection cfg ε M L hn s j ω)]
    exact hd
  have hsuf (k : ℕ) : protectedRecycledPair cfg ε M L hn r.1 k r.2=protectedRecycledPair cfg ε M L hn s (i+k) ω :=
    protectedRecycledPair_continue cfg ε M L hn s i k ω
  have hsome : ∃k,AugTimedDone cfg (augRecycledPair cfg ε M hn r.1.1 k r.2).1 := by
    refine ⟨j,?_⟩
    rw [←congrArg Prod.fst (protectedRecycledPair_projection cfg ε M L hn r.1 j r.2),hsuf]
    rw [protectedRecycledPair_absorbing cfg ε M L hn s ω j hd₀ (i+j) (Nat.le_add_left _ _)]
    exact hd₀
  have hd₁ : AugTimedDone cfg (protectedRecycledPair cfg ε M L hn r.1 j' r.2).1.1 := by
    rw [congrArg Prod.fst (protectedRecycledPair_projection cfg ε M L hn r.1 j' r.2)]
    exact augRecycledTerminal_done_of_exists cfg ε M hn r.1.1 r.2 hsome
  let k := max j j'
  calc
    _ = protectedRecycledPair cfg ε M L hn r.1 k r.2 :=
      (protectedRecycledPair_absorbing cfg ε M L hn r.1 r.2 j' hd₁ k (le_max_right _ _)).symm
    _ = protectedRecycledPair cfg ε M L hn s (i+k) ω := hsuf k
    _ = _ := protectedRecycledPair_absorbing cfg ε M L hn s ω j hd₀ (i+k)
      ((le_max_left _ _).trans (Nat.le_add_left _ _))

end NoThreeLine

#print axioms NoThreeLine.protectedActualExceedance_continue_iff
#print axioms NoThreeLine.protectedRecycledTerminalPair_continue

