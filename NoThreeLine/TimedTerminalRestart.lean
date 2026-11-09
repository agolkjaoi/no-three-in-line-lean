import NoThreeLine.ObservedPhaseContinuation
import NoThreeLine.RecycledTerminal

/-! Completing the phase from any realized update uses the same
terminal state and residual board whenever the original phase completes. -/
set_option autoImplicit false
noncomputable section

namespace NoThreeLine
open RecycledBoardProcess

theorem augRecycledTerminalPair_continue {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (hn : 0<n) (s : AugTimedState cfg) (i : ℕ) (ω : BoardClockPath n)
    (hd : AugTimedDone cfg (augRecycledTerminal cfg ε M hn s ω)) :
    let r := augRecycledPair cfg ε M hn s i ω
    augRecycledTerminalPair cfg ε M hn r.1 r.2=augRecycledTerminalPair cfg ε M hn s ω := by
  let r := augRecycledPair cfg ε M hn s i ω
  let j := augRecycledCompletionIndex cfg ε M hn s ω
  let j' := augRecycledCompletionIndex cfg ε M hn r.1 r.2
  have hsuf (k : ℕ) : augRecycledPair cfg ε M hn r.1 k r.2=augRecycledPair cfg ε M hn s (i+k) ω :=
    (iterate_add (augRestartStep cfg ε M hn) s i k ω).symm
  have horig (k : ℕ) (hk : j≤k) :
      augRecycledPair cfg ε M hn s k ω=augRecycledTerminalPair cfg ε M hn s ω :=
    augRecycledPair_absorbing cfg ε M hn s ω j hd k hk
  have hsome : ∃k,AugTimedDone cfg (augRecycledPair cfg ε M hn r.1 k r.2).1 := by
    refine ⟨j,?_⟩
    rw [hsuf,horig _ (by omega)]
    exact hd
  have hdone := augRecycledTerminal_done_of_exists cfg ε M hn r.1 r.2 hsome
  let k := max j j'
  calc
    _ = augRecycledPair cfg ε M hn r.1 k r.2 :=
      (augRecycledPair_absorbing cfg ε M hn r.1 r.2 j' hdone k (le_max_right _ _)).symm
    _ = augRecycledPair cfg ε M hn s (i+k) ω := hsuf k
    _ = _ := horig _ ((le_max_left _ _).trans (Nat.le_add_left k i))

end NoThreeLine

#print axioms NoThreeLine.augRecycledTerminalPair_continue
