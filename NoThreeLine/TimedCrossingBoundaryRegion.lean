import NoThreeLine.TimedCrossingBoundaryCredit
import NoThreeLine.ProtectedEnergyGuardHistory

/-! The actual unfinished phase preserves guard readiness and the saved
entry bounds through completion and the original deadline retirement. -/
set_option autoImplicit false
set_option maxHeartbeats 1500000
noncomputable section
namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem timedCrossingPhasePair_auxReady_saved {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hn : 0<n) (b : ℝ) (j : ℕ)
    (hsp : specified (cs j).directions L)
    (s : ProtectedTimedState (cs j).config)
    (hs : s.1.val.1.AuxReady (cs j).directions ε M)
    (hsv : ∀q∈L.val,0≤s.2 q ∧ s.2 q≤2*B) (ω : BoardClockPath n) :
    let r := (timedCrossingPhasePair cs ε M deadline start L N E A hn b j (s,ω)).1.1
    r.1.val.AuxReady (cs j).directions ε M ∧ ∀q∈L.val,0≤r.2.1 q ∧ r.2.1 q≤2*B := by
  let cfg := (cs j).config
  let t := phaseEndpoint cs start (j+1)
  let k := augRecycledCompletionIndex cfg ε M hn s.1 ω
  let v := (protectedRecycledPair cfg ε M L hn s k ω).1
  let r : ProtectedPhaseState n B := (augTimedStateProjection cfg v.1,(v.2,0+0))
  change (protectedDeadlineBook L deadline t r).1.val.AuxReady (cs j).directions ε M ∧
    ∀q∈L.val,0≤(protectedDeadlineBook L deadline t r).2.1 q ∧ (protectedDeadlineBook L deadline t r).2.1 q≤2*B
  refine ⟨augValidDeadlineRetirement_auxReady deadline t r.1 (cs j).directions ε M ?_,?_⟩
  · exact protectedRecycledPair_auxReady cfg ε M L hn s hs k ω
  · intro q hq
    exact protectedDeadlineBook_saved_bounds L (cs j).directions hsp q hq deadline t r
      (protectedRecycledPair_saved_bounds_all cfg ε M L hsp q hq hn s (hsv q hq) k ω)

end NoThreeLine

#print axioms NoThreeLine.timedCrossingPhasePair_auxReady_saved

