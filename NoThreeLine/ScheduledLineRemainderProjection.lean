import NoThreeLine.ScheduledLineExitLaw
import NoThreeLine.ScheduledLineRemainder
import NoThreeLine.TimedTerminalRestart
import NoThreeLine.ValidScheduledCompletion

/-! The remainder evaluated at the random schedule exit is the original
terminal physical state on the same board. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory

namespace NoThreeLine
open AuxiliaryODE BirthWitness RecycledBoardProcess

theorem scheduledLineRemainder_at_exit_ae {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ) (p : Grid n)
    (hn : 0<n) (hB : 0<B) (J : ℕ) (s : ProtectedPhaseState n B)
    (ho : occupancy s.1.val.physical.process L≤N) :
    ∀ᵐω∂boardClockMeasure n (B/n),
      scheduledLineRemainderState cs ε M deadline start hn J
        (scheduledLineExitIterate cs ε M deadline start L N hn J s J ω)=
      recycledPhaseState cs ε M deadline start hn s.1 J ω := by
  filter_upwards [validScheduledPhasesCompletion_ae cs ε M deadline start hn hB s.1] with ω hd
  let ref := fun j=>protectedScheduledIterate cs ε M deadline start L p hn J s j ω
  let q := scheduledLineExitIterate cs ε M deadline start L N hn J s J ω
  have hp (j : ℕ) (hj : j≤J) :
      (((ref j).1.1,(ref j).1.2.1),(ref j).2)=recycledPhases cs ε M deadline start hn s.1 j ω :=
    protectedScheduledIterate_projection cs ε M deadline start L p hn J s j hj ω
  rcases scheduledLineExitIterate_cases cs ε M deadline start L N p hn J s ho J le_rfl ω with
      ⟨hq,_⟩ | ⟨j,hj,_,_,hq⟩
  · change scheduledLineRemainderState cs ε M deadline start hn J q=_
    change q=lineExitBoundaryView cs (ref J) at hq
    rw [hq]
    have hi : (lineExitBoundaryView cs (ref J)).1.1=J :=
      protectedScheduledIterate_index cs ε M deadline start L p hn J s J le_rfl ω
    have hnlt : ¬(lineExitBoundaryView cs (ref J)).1.1<J := by rw [hi]; exact Nat.lt_irrefl _
    simp only [scheduledLineRemainderState,if_neg hnlt]
    exact congrArg (fun r=>(Prod.fst r).2) (hp J le_rfl)
  · let cfg := (cs j).config
    let a := protectedPhaseStart cfg ε M (ref j).1.2
    let r := protectedLineExitPair cfg ε M L N hn a (ref j).2
    let o := recycledPhases cs ε M deadline start hn s.1 j ω
    let v := augPhaseStart cfg ε M o.1.2
    let i := firstHitIndex (protectedRestartStep cfg ε M L hn) (protectedLineExitTest cfg L N) a (ref j).2
    let t := augRecycledTerminalPair cfg ε M hn v o.2
    have ha : a.1=v := congrArg (augPhaseStart cfg ε M)
      (congrArg (fun z=>(Prod.fst z).2) (hp j hj.le))
    have hw : (ref j).2=o.2 := congrArg Prod.snd (hp j hj.le)
    have hr : (r.1.1,r.2)=augRecycledPair cfg ε M hn v i o.2 := by
      calc
        _ = augRecycledPair cfg ε M hn a.1 i (ref j).2 :=
          protectedRecycledPair_projection cfg ε M L hn a i (ref j).2
        _ = _ := by rw [ha,hw]
    have ht : augRecycledTerminalPair cfg ε M hn r.1.1 r.2=t :=
      (congrArg (fun x : AugTimedState cfg × BoardClockPath n=>
        augRecycledTerminalPair cfg ε M hn x.1 x.2) hr).trans
          (augRecycledTerminalPair_continue cfg ε M hn v i o.2 (hd j))
    change q=((j,packProtectedTimed cfg r.1),r.2) at hq
    change scheduledLineRemainderState cs ε M deadline start hn J q=_
    rw [hq]
    have hlt : (((j,packProtectedTimed cfg r.1),r.2) :
        (ℕ × ProtectedPhaseState n B) × BoardClockPath n).1.1<J := hj
    simp only [scheduledLineRemainderState,if_pos hlt]
    change scheduledAfterRestartedPhase cs ε M deadline start hn j J
      (augRecycledTerminalPair cfg ε M hn (unpackProtectedTimed cfg (packProtectedTimed cfg r.1)).1 r.2)=_
    rw [unpackProtectedTimed_pack cfg r.1,ht]
    have hs : recycledPhases cs ε M deadline start hn s.1 (j+1) ω=
        ((j+1,finishRestartedPhase cs deadline start j t.1),t.2) :=
      recycledPhases_succ cs ε M deadline start hn s.1 j ω
    have hiter := iterate_add (recycledPhaseStep cs ε M deadline start hn) (0,s.1) (j+1) (J-(j+1)) ω
    rw [Nat.add_sub_of_le hj] at hiter
    change recycledPhases cs ε M deadline start hn s.1 J ω=
      iterate (recycledPhaseStep cs ε M deadline start hn)
        (recycledPhases cs ε M deadline start hn s.1 (j+1) ω).1 (J-(j+1))
        (recycledPhases cs ε M deadline start hn s.1 (j+1) ω).2 at hiter
    rw [hs] at hiter
    exact congrArg (fun z=>(Prod.fst z).2) hiter.symm

end NoThreeLine

#print axioms NoThreeLine.scheduledLineRemainder_at_exit_ae
