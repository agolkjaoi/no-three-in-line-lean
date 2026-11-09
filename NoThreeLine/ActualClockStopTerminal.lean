import NoThreeLine.ActualRetirementCauses
import NoThreeLine.BoundaryCauseKinds

/-! An actual raw clock trigger survives resolution in the clock
coordinates and stops the phase. The terminal selector therefore keeps
that raw clock value, on every board with such a trigger. -/
set_option autoImplicit false
set_option maxHeartbeats 1800000
noncomputable section
namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem augRecycledTerminal_eq_done_update {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (hn : 0<n) (s : AugTimedState cfg) (k : ℕ) (ω : BoardClockPath n)
    (hd : AugTimedDone cfg (augRecycledPair cfg ε M hn s k ω).1) :
    augRecycledTerminal cfg ε M hn s ω=(augRecycledPair cfg ε M hn s k ω).1 := by
  classical
  have hi : augRecycledCompletionIndex cfg ε M hn s ω≤k :=
    Nat.find_min' (augRecycledCompletionPredicate_exists cfg ε M hn s ω) (Or.inl hd)
  have hterm := augRecycledTerminal_done_of_exists cfg ε M hn s ω ⟨k,hd⟩
  exact (congrArg Prod.fst (augRecycledPair_absorbing cfg ε M hn s ω
    (augRecycledCompletionIndex cfg ε M hn s ω) hterm k hi)).symm

theorem rawClockHit_step_stopped_clocks {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (p : Grid n) (x : AugTimedState cfg×CandidateData n)
    (h : rawBoundaryCauseHit cfg ε M p .clock x) :
    let a := augRawOutcome cfg ε M (augTimedInput cfg x.1,x.2)
    (augTimedStep cfg ε M x).val.1.physical.process.stopped=true ∧
      (augTimedStep cfg ε M x).val.1.physical.clocks=a.physical.clocks := by
  have hd : ¬(x.1.val.2≤0 ∨ x.1.val.1.physical.process.stopped=true) :=
    fun hh=>h.1 ((birthDone_iff cfg x.1).mp hh)
  have hs : x.1.val.1.physical.process.stopped=false := Bool.eq_false_iff.mpr (not_or.mp hd).2
  change (augTimedStepPair cfg ε M x).1.physical.process.stopped=true ∧
    (augTimedStepPair cfg ε M x).1.physical.clocks=(augRawOutcome cfg ε M (augTimedInput cfg x.1,x.2)).physical.clocks
  simp only [augTimedStepPair,if_neg hd]
  refine ⟨(augOutcome_new_stop_iff cfg ε M (augTimedInput cfg x.1) x.2 hs).mpr (Or.inr h.2.2),?_⟩
  exact congrArg (fun z : Coordinates n=>z.2.1)
    (augmented_resolve_coordinates (augRawOutcome cfg ε M (augTimedInput cfg x.1,x.2))
      cfg.directions cfg.B cfg.K cfg.rho ε M)

theorem rawClockHit_recycled_terminal {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (p : Grid n) (hn : 0<n) (s : AugTimedState cfg) (k : ℕ) (ω : BoardClockPath n)
    (h : let x := augRecycledPair cfg ε M hn s k ω
      rawBoundaryCauseHit cfg ε M p .clock (x.1,WinnerMarkLaw.firstMarkedRace hn x.2)) :
    let x := augRecycledPair cfg ε M hn s k ω
    let a := augRawOutcome cfg ε M (augTimedInput cfg x.1,WinnerMarkLaw.firstMarkedRace hn x.2)
    (augRecycledTerminal cfg ε M hn s ω).val.1.physical.process.stopped=true ∧
      (augRecycledTerminal cfg ε M hn s ω).val.1.physical.clocks=a.physical.clocks := by
  let x := augRecycledPair cfg ε M hn s k ω
  let z := WinnerMarkLaw.firstMarkedRace hn x.2
  have hs := rawClockHit_step_stopped_clocks cfg ε M p (x.1,z) h
  have hd : AugTimedDone cfg (augRecycledPair cfg ε M hn s (k+1) ω).1 := Or.inr hs.1
  rw [augRecycledTerminal_eq_done_update cfg ε M hn s (k+1) ω hd]
  exact hs

end NoThreeLine

#print axioms NoThreeLine.rawClockHit_step_stopped_clocks
#print axioms NoThreeLine.rawClockHit_recycled_terminal

