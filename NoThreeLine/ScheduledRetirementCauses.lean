import NoThreeLine.RecycledRetirementCauses
import NoThreeLine.DeadlineRetirementCauses
import NoThreeLine.RecycledPhaseComposition

/-! Positive loss across actual scheduled phases comes from initial loss,
an applied absolute deadline, or a raw boundary cause in an earlier phase.
The augmented phase start preserves the incoming physical state exactly. -/
set_option autoImplicit false
set_option maxHeartbeats 1000000
noncomputable section

namespace NoThreeLine

theorem augValidDeadlineRetirement_positive_loss_origin {n : ℕ} {B : ℝ}
    (deadline : Grid n → ℝ) (t : ℝ) (e : ValidAugmentedState n B) (p : Grid n)
    (hc : 0 < (augValidDeadlineRetirement deadline t e).val.physical.process.birthCreditLoss p) :
    0 < e.val.physical.process.birthCreditLoss p ∨ deadline p ≤ t := by
  rcases augValidDeadlineRetirement_positive_loss_cause deadline t e p hc with hu | hd
  · left
    have hcredit := ((ProcessState.birthCreditLoss_pos_iff _ p).mp hc).2
    have he := augValidDeadlineRetirement_credit deadline t e p
    change ((augValidDeadlineRetirement deadline t e).val.physical.process.accounts p).credit =
      (e.val.physical.process.accounts p).credit at he
    rw [he] at hcredit
    exact (ProcessState.birthCreditLoss_pos_iff _ p).mpr ⟨hu,hcredit⟩
  · exact Or.inr hd

theorem recycledScheduledPair_positive_loss_origin {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (N : ℕ) (e : ValidAugmentedState n B) (ω : BoardClockPath n) (p : Grid n)
    (hc : 0 < (recycledScheduledPair cs ε M deadline start hn N (e,ω)).1.val.physical.process.birthCreditLoss p) :
    0 < e.val.physical.process.birthCreditLoss p ∨
      deadline p ≤ phaseEndpoint cs start (N+1) ∨
      ∃ j < augRecycledCompletionIndex (cs N).config ε M hn (augPhaseStart (cs N).config ε M e) ω,
        recycledRootBoundaryCauseAt (cs N).config ε M hn p (augPhaseStart (cs N).config ε M e) j ω := by
  rcases augValidDeadlineRetirement_positive_loss_origin deadline (phaseEndpoint cs start (N+1))
    (augPhaseRecycledPair (cs N).config ε M hn (e,ω)).1 p hc with ht | hd
  · rcases recycled_positive_loss_origin (cs N).config ε M hn p
      (augPhaseStart (cs N).config ε M e) _ ω ht with hi | he
    · exact Or.inl hi
    · exact Or.inr (Or.inr he)
  · exact Or.inr (Or.inl hd)

def scheduledRootBoundaryCauseAt {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (p : Grid n)
    (e : ValidAugmentedState n B) (N : ℕ) (ω : BoardClockPath n) : Prop :=
  let s := augPhaseStart (cs N).config ε M (recycledPhaseState cs ε M deadline start hn e N ω)
  let v := (recycledPhases cs ε M deadline start hn e N ω).2
  ∃ j < augRecycledCompletionIndex (cs N).config ε M hn s v,
    recycledRootBoundaryCauseAt (cs N).config ε M hn p s j v

theorem recycledPhaseState_positive_loss_origin {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (e : ValidAugmentedState n B) (p : Grid n) (J : ℕ) (ω : BoardClockPath n)
    (hc : 0 < (recycledPhaseState cs ε M deadline start hn e J ω).val.physical.process.birthCreditLoss p) :
    0 < e.val.physical.process.birthCreditLoss p ∨ deadline p ≤ phaseEndpoint cs start J ∨
      ∃ N < J, scheduledRootBoundaryCauseAt cs ε M deadline start hn p e N ω := by
  induction J with
  | zero => exact Or.inl hc
  | succ J ih =>
    have he : recycledPhaseState cs ε M deadline start hn e (J+1) ω =
        (recycledScheduledPair cs ε M deadline start hn J
          (recycledPhaseState cs ε M deadline start hn e J ω,
            (recycledPhases cs ε M deadline start hn e J ω).2)).1 := by
      unfold recycledPhaseState
      rw [recycledPhases_succ]
    rw [he] at hc
    rcases recycledScheduledPair_positive_loss_origin cs ε M deadline start hn J _ _ p hc with
      hprev | hdeadline | hcause
    · rcases ih hprev with hi | hd | ⟨N,hN,hc⟩
      · exact Or.inl hi
      · exact Or.inr (Or.inl (hd.trans (phaseEndpoint_mono cs start (Nat.le_succ J))))
      · exact Or.inr (Or.inr ⟨N,Nat.lt_succ_of_lt hN,hc⟩)
    · exact Or.inr (Or.inl hdeadline)
    · exact Or.inr (Or.inr ⟨J,Nat.lt_succ_self J,hcause⟩)

theorem recycledPhaseState_early_positive_loss_boundary {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (e : ValidAugmentedState n B) (p : Grid n) (J : ℕ) (ω : BoardClockPath n)
    (hs : e.val.physical.process.stopped = false)
    (hp : (e.val.physical.process.accounts p).status = .active)
    (ht : phaseEndpoint cs start J < deadline p)
    (hc : 0 < (recycledPhaseState cs ε M deadline start hn e J ω).val.physical.process.birthCreditLoss p) :
    ∃ N < J, scheduledRootBoundaryCauseAt cs ε M deadline start hn p e N ω := by
  rcases recycledPhaseState_positive_loss_origin cs ε M deadline start hn e p J ω hc with hi | hd | h
  · simp [ProcessState.birthCreditLoss,ProcessState.birthUnavailable,hs,hp] at hi
  · exact False.elim (not_le_of_gt ht hd)
  · exact h

end NoThreeLine

#print axioms NoThreeLine.recycledScheduledPair_positive_loss_origin
#print axioms NoThreeLine.recycledPhaseState_positive_loss_origin
#print axioms NoThreeLine.recycledPhaseState_early_positive_loss_boundary
