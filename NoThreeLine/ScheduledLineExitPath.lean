import NoThreeLine.ScheduledLineExitKernel
import NoThreeLine.ProtectedScheduledProcess

/-! Identify the finite schedule exit on the same board and ledger
history. Prior phases use their original completion and deadlines. -/
set_option autoImplicit false
noncomputable section

namespace NoThreeLine
open AuxiliaryODE BirthWitness RecycledBoardProcess

def lineExitBoundaryView {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (a : (ℕ × ProtectedPhaseState n B) × BoardClockPath n) :
    (ℕ × ProtectedPhaseState n B) × BoardClockPath n :=
  ((a.1.1,(a.1.2.1,(a.1.2.2.1,(cs a.1.1).horizon))),a.2)

def scheduledLineExitIterate {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (hn : 0<n) (J : ℕ) (s : ProtectedPhaseState n B) (k : ℕ) (ω : BoardClockPath n) :
    (ℕ × ProtectedPhaseState n B) × BoardClockPath n :=
  iterate (scheduledLineExitStep cs ε M deadline start L N hn J)
    (0,(s.1,(s.2.1,(cs 0).horizon))) k ω

theorem lineExitBoundaryView_step {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (p : Grid n) (hn : 0<n) (J : ℕ) (a : (ℕ × ProtectedPhaseState n B) × BoardClockPath n)
    (hj : a.1.1<J) (ho : occupancy a.1.2.1.val.physical.process L≤N) :
    let j := a.1.1
    let r := protectedLineExitPair (cs j).config ε M L N hn
      (protectedPhaseStart (cs j).config ε M a.1.2) a.2
    scheduledLineExitStep cs ε M deadline start L N hn J (lineExitBoundaryView cs a)=
      if N<occupancy r.1.1.val.1.physical.process L then ((j,packProtectedTimed (cs j).config r.1),r.2)
      else lineExitBoundaryView cs (protectedScheduledStep cs ε M deadline start L p hn J a) := by
  let j := a.1.1
  let cfg := (cs j).config
  let s := protectedPhaseStart cfg ε M a.1.2
  let r := protectedLineExitPair cfg ε M L N hn s a.2
  have h : (lineExitBoundaryView cs a).1.1<J ∧
      occupancy (lineExitBoundaryView cs a).1.2.1.val.physical.process L≤N := ⟨hj,ho⟩
  have hs : unpackProtectedTimed cfg (lineExitBoundaryView cs a).1.2=s :=
    unpackProtectedTimed_phaseStart cfg ε M a.1.2.1 a.1.2.2.1
  simp only [scheduledLineExitStep,if_pos h,scheduledLineExitRun]
  change (scheduledLineExitOutput cs deadline start L N j
      (protectedLineExitPair cfg ε M L N hn (unpackProtectedTimed cfg (lineExitBoundaryView cs a).1.2) a.2).1,
      (protectedLineExitPair cfg ε M L N hn (unpackProtectedTimed cfg (lineExitBoundaryView cs a).1.2) a.2).2)=_
  rw [hs]
  by_cases hx : N<occupancy r.1.1.val.1.physical.process L
  · change (scheduledLineExitOutput cs deadline start L N j r.1,r.2)=
      if N<occupancy r.1.1.val.1.physical.process L then ((j,packProtectedTimed cfg r.1),r.2) else _
    have hpack : N<occupancy (packProtectedTimed (cs j).config r.1).1.val.physical.process L := hx
    simp only [scheduledLineExitOutput,if_pos hpack,if_pos hx]
    rfl
  · have ht := protectedLineExitPair_eq_terminal_of_no_birth cfg ε M L N hn s a.2 hx
    change (scheduledLineExitOutput cs deadline start L N j r.1,r.2)=
      if N<occupancy r.1.1.val.1.physical.process L then ((j,packProtectedTimed cfg r.1),r.2) else _
    have hpack : ¬N<occupancy (packProtectedTimed (cs j).config r.1).1.val.physical.process L := hx
    simp only [scheduledLineExitOutput,if_neg hpack,if_neg hx]
    change r=protectedRecycledTerminalPair cfg ε M L hn s a.2 at ht
    rw [ht]
    simp only [protectedScheduledStep,if_pos hj]
    rfl

theorem protectedScheduledIterate_index {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (hn : 0<n) (J : ℕ) (s : ProtectedPhaseState n B) (k : ℕ) (hk : k≤J) (ω : BoardClockPath n) :
    (protectedScheduledIterate cs ε M deadline start L p hn J s k ω).1.1=k :=
  (congrArg (fun r=> (Prod.fst r).1)
    (protectedScheduledIterate_projection cs ε M deadline start L p hn J s k hk ω)).trans
    (recycledPhases_index cs ε M deadline start hn s.1 k ω)

end NoThreeLine

#print axioms NoThreeLine.lineExitBoundaryView_step
