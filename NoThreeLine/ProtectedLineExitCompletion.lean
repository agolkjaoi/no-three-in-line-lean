import NoThreeLine.ProtectedLineStageRestart

/-! If a phase exits without a new line birth, its selected pair is
exactly the original physical completion pair with its saved ledger. -/
set_option autoImplicit false
noncomputable section

namespace NoThreeLine
open AuxiliaryODE BirthWitness RecycledBoardProcess

theorem protectedLineExitPair_eq_terminal_of_no_birth {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (N : ℕ) (hn : 0<n) (s : ProtectedTimedState cfg) (ω : BoardClockPath n)
    (hno : ¬N<occupancy (protectedLineExitPair cfg ε M L N hn s ω).1.1.val.1.physical.process L) :
    protectedLineExitPair cfg ε M L N hn s ω=protectedRecycledTerminalPair cfg ε M L hn s ω := by
  classical
  let F := protectedRestartStep cfg ε M L hn
  let H := protectedLineExitTest cfg L N
  let i := firstHitIndex F H s ω
  let j := augRecycledCompletionIndex cfg ε M hn s.1 ω
  have hD (k : ℕ) : AugTimedDone cfg (protectedRecycledPair cfg ε M L hn s k ω).1.1 ↔
      AugTimedDone cfg (augRecycledPair cfg ε M hn s.1 k ω).1 := by
    rw [congrArg Prod.fst (protectedRecycledPair_projection cfg ε M L hn s k ω)]
  change protectedRecycledPair cfg ε M L hn s i ω=protectedRecycledPair cfg ε M L hn s j ω
  suffices h : i=j by rw [h]
  by_cases hd : ∃k,AugTimedDone cfg (augRecycledPair cfg ε M hn s.1 k ω).1
  · have hj : AugTimedDone cfg (augRecycledPair cfg ε M hn s.1 j ω).1 :=
      augRecycledTerminal_done_of_exists cfg ε M hn s.1 ω hd
    have hHj : H (state F s j ω) := Or.inr ((hD j).mpr hj)
    have hHi := firstHitPair_hits F H s ω ⟨j,hHj⟩
    have hi : AugTimedDone cfg (protectedRecycledPair cfg ε M L hn s i ω).1.1 :=
      hHi.resolve_left hno
    exact le_antisymm (firstHitIndex_le F H s ω j hHj)
      (Nat.find_min' (augRecycledCompletionPredicate_exists cfg ε M hn s.1 ω) (Or.inl ((hD i).mp hi)))
  · have hH : ¬∃k,H (state F s k ω) := by
      intro hh
      have hHi := firstHitPair_hits F H s ω hh
      exact hd ⟨i,(hD i).mp (hHi.resolve_left hno)⟩
    have hi : i=0 := Nat.eq_zero_of_le_zero
      (Nat.find_min' (firstHitPredicate_exists F H s ω) (Or.inr hH : firstHitPredicate F H s 0 ω))
    have hj : j=0 := Nat.eq_zero_of_le_zero
      (Nat.find_min' (augRecycledCompletionPredicate_exists cfg ε M hn s.1 ω)
        (Or.inr hd : augRecycledCompletionPredicate cfg ε M hn s.1 0 ω))
    rw [hi,hj]

end NoThreeLine

#print axioms NoThreeLine.protectedLineExitPair_eq_terminal_of_no_birth
