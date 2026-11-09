import NoThreeLine.ScheduledLineExitPath

/-! The first line-stage exit of a finite schedule keeps the actual
phase, timed saved ledger, and original residual board. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory

namespace NoThreeLine
open AuxiliaryODE BirthWitness RecycledBoardProcess

theorem scheduledLineExitIterate_map {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (hn : 0<n) (hB : 0<B) (J : ℕ) (s : ProtectedPhaseState n B) (k : ℕ) :
    let ν := boardClockMeasure n (B/n)
    let r := scheduledLineExitIterate cs ε M deadline start L N hn J s k
    ν.map r=(ν.map (fun ω=>(r ω).1)).prod ν := by
  let ν := boardClockMeasure n (B/n)
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  let F := scheduledLineExitStep cs ε M deadline start L N hn J
  let a : ℕ × ProtectedPhaseState n B := (0,(s.1,(s.2.1,(cs 0).horizon)))
  have hF := scheduledLineExitStep_measurable cs ε M deadline start L N hn J
  have hm := scheduledLineExitStep_map cs ε M deadline start L N hn hB J
  change ν.map (iterate F a k)=(ν.map (fun ω=>(iterate F a k ω).1)).prod ν
  rw [iterate_map F hF ν hm,iterate_state_map F hF ν hm]

theorem scheduledLineExitIterate_cases {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ) (p : Grid n)
    (hn : 0<n) (J : ℕ) (s : ProtectedPhaseState n B)
    (ho : occupancy s.1.val.physical.process L≤N) (k : ℕ) (hk : k≤J) (ω : BoardClockPath n) :
    let ref := fun j=>protectedScheduledIterate cs ε M deadline start L p hn J s j ω
    let q := scheduledLineExitIterate cs ε M deadline start L N hn J s k ω
    (q=lineExitBoundaryView cs (ref k) ∧ occupancy (ref k).1.2.1.val.physical.process L≤N) ∨
      ∃ j < k,
        let r := protectedLineExitPair (cs j).config ε M L N hn
          (protectedPhaseStart (cs j).config ε M (ref j).1.2) (ref j).2
        occupancy (ref j).1.2.1.val.physical.process L≤N ∧
          N<occupancy r.1.1.val.1.physical.process L ∧
          q=((j,packProtectedTimed (cs j).config r.1),r.2) := by
  let ref := fun j=>protectedScheduledIterate cs ε M deadline start L p hn J s j ω
  let q := fun k=>scheduledLineExitIterate cs ε M deadline start L N hn J s k ω
  let G := scheduledLineExitStep cs ε M deadline start L N hn J
  induction k with
  | zero => exact Or.inl ⟨rfl,ho⟩
  | succ k ih =>
    rcases ih (Nat.le_of_succ_le hk) with ⟨ha,hocc⟩ | ⟨j,hjk,ha,hb,hq⟩
    · let a := ref k
      have hai : a.1.1=k := protectedScheduledIterate_index cs ε M deadline start L p hn J s k
        (Nat.le_of_succ_le hk) ω
      have hlt : a.1.1<J := by rw [hai]; exact hk
      let r := protectedLineExitPair (cs k).config ε M L N hn
        (protectedPhaseStart (cs k).config ε M a.1.2) a.2
      have hstep : q (k+1)=
          if N<occupancy r.1.1.val.1.physical.process L then ((k,packProtectedTimed (cs k).config r.1),r.2)
          else lineExitBoundaryView cs (ref (k+1)) := by
        change G (q k)=_
        change q k=lineExitBoundaryView cs a at ha
        rw [ha]
        have h := lineExitBoundaryView_step cs ε M deadline start L N p hn J a hlt hocc
        dsimp only at h
        rw [hai] at h
        exact h
      by_cases hb : N<occupancy r.1.1.val.1.physical.process L
      · exact Or.inr ⟨k,Nat.lt_succ_self k,hocc,hb,hstep.trans (if_pos hb)⟩
      · have hq := hstep.trans (if_neg hb)
        have ht : r=protectedRecycledTerminalPair (cs k).config ε M L hn
            (protectedPhaseStart (cs k).config ε M a.1.2) a.2 :=
          protectedLineExitPair_eq_terminal_of_no_birth (cs k).config ε M L N hn _ _ hb
        have hret : (ref (k+1)).1.2.1=augValidDeadlineRetirement deadline (phaseEndpoint cs start (k+1))
            (augTimedStateProjection (cs k).config r.1.1) := by
          change (protectedScheduledStep cs ε M deadline start L p hn J a).1.2.1=_
          rw [ht]
          simp only [protectedScheduledStep,hai,if_pos (show k<J from hk)]
          rfl
        exact Or.inl ⟨hq,by
          change occupancy (ref (k+1)).1.2.1.val.physical.process L≤N
          rw [hret,augValidDeadlineRetirement_occupancy]
          exact le_of_not_gt hb⟩
    · let r := protectedLineExitPair (cs j).config ε M L N hn
        (protectedPhaseStart (cs j).config ε M (ref j).1.2) (ref j).2
      have he : q k=((j,packProtectedTimed (cs j).config r.1),r.2) := hq
      have hfreeze : ¬((q k).1.1<J ∧ occupancy (q k).1.2.1.val.physical.process L≤N) := by
        rw [he]
        exact fun h=>not_le_of_gt hb h.2
      have hnext : q (k+1)=q k := if_neg hfreeze
      exact Or.inr ⟨j,hjk.trans (Nat.lt_succ_self k),ha,hb,hnext.trans he⟩

end NoThreeLine

#print axioms NoThreeLine.scheduledLineExitIterate_map
#print axioms NoThreeLine.scheduledLineExitIterate_cases
