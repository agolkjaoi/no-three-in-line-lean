import NoThreeLine.ActualRetirementCauses
import NoThreeLine.RecycledScheduledPhase

/-! Absolute deadline retirement is a distinct cause of positive loss.
It cannot create a global stop and does not alter the saved credit. -/
set_option autoImplicit false
noncomputable section

namespace NoThreeLine
open AuxiliaryODE

theorem deadlineRetirement_positive_loss_iff {n : ℕ} (deadline : Grid n → ℝ)
    (e : ExtendedState n) (t : ℝ) (p : Grid n)
    (hs : e.process.stopped = false) (hp : (e.process.accounts p).status = .active) :
    0 < (deadlineRetirement deadline (e,t)).process.birthCreditLoss p ↔
      deadline p ≤ t ∧ 0 < (e.process.accounts p).credit := by
  by_cases hd : deadline p ≤ t <;>
    simp [deadlineRetirement,ExtendedState.retire,ProcessState.retire,CreditAccount.retire,
      ProcessState.birthCreditLoss,ProcessState.birthUnavailable,CreditAccount.credit,hp,hs,hd]

theorem augValidDeadlineRetirement_new_inactive_cause {n : ℕ} {B : ℝ}
    (deadline : Grid n → ℝ) (t : ℝ) (e : ValidAugmentedState n B) (p : Grid n)
    (hp : (e.val.physical.process.accounts p).status = .active)
    (hi : ((augValidDeadlineRetirement deadline t e).val.physical.process.accounts p).status ≠ .active) :
    e.val.physical.process.stopped = false ∧ deadline p ≤ t := by
  by_cases hs : e.val.physical.process.stopped = true
  · rw [augValidDeadlineRetirement_stopped deadline t e hs] at hi
    exact False.elim (hi hp)
  · refine ⟨Bool.eq_false_iff.mpr hs,?_⟩
    simp only [augValidDeadlineRetirement,if_neg hs] at hi
    exact (deadlineRetirement_inactive_iff deadline e.val.physical t p hp).mp hi

theorem augValidDeadlineRetirement_positive_loss_iff {n : ℕ} {B : ℝ}
    (deadline : Grid n → ℝ) (t : ℝ) (e : ValidAugmentedState n B) (p : Grid n)
    (hs : e.val.physical.process.stopped = false)
    (hp : (e.val.physical.process.accounts p).status = .active) :
    0 < (augValidDeadlineRetirement deadline t e).val.physical.process.birthCreditLoss p ↔
      deadline p ≤ t ∧ 0 < (e.val.physical.process.accounts p).credit := by
  simp only [augValidDeadlineRetirement,hs,Bool.false_eq_true,if_false]
  exact deadlineRetirement_positive_loss_iff deadline e.val.physical t p hs hp

theorem augValidDeadlineRetirement_positive_loss_cause {n : ℕ} {B : ℝ}
    (deadline : Grid n → ℝ) (t : ℝ) (e : ValidAugmentedState n B) (p : Grid n)
    (hc : 0 < (augValidDeadlineRetirement deadline t e).val.physical.process.birthCreditLoss p) :
    e.val.physical.process.birthUnavailable p ∨ deadline p ≤ t := by
  by_cases hs : e.val.physical.process.stopped = true
  · exact Or.inl (Or.inl hs)
  · by_cases hp : (e.val.physical.process.accounts p).status = .active
    · exact Or.inr ((augValidDeadlineRetirement_positive_loss_iff deadline t e p
        (Bool.eq_false_iff.mpr hs) hp).mp hc).1
    · have hpost := ((ProcessState.birthCreditLoss_pos_iff _ p).mp hc).2
      have hcredit := augValidDeadlineRetirement_credit deadline t e p
      change ((augValidDeadlineRetirement deadline t e).val.physical.process.accounts p).credit =
        (e.val.physical.process.accounts p).credit at hcredit
      rw [hcredit] at hpost
      exact Or.inl (Or.inr (CreditAccount.positive_inactive_retired _ hp hpost))

theorem recycledScheduledPair_positive_loss_cause {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (j : ℕ) (e : ValidAugmentedState n B) (ω : BoardClockPath n) (p : Grid n)
    (hc : 0 < (recycledScheduledPair cs ε M deadline start hn j (e,ω)).1.val.physical.process.birthCreditLoss p) :
    (augPhaseRecycledPair (cs j).config ε M hn (e,ω)).1.val.physical.process.birthUnavailable p ∨
      deadline p ≤ phaseEndpoint cs start (j+1) :=
  augValidDeadlineRetirement_positive_loss_cause deadline (phaseEndpoint cs start (j+1))
    (augPhaseRecycledPair (cs j).config ε M hn (e,ω)).1 p hc

end NoThreeLine

#print axioms NoThreeLine.deadlineRetirement_positive_loss_iff
#print axioms NoThreeLine.augValidDeadlineRetirement_new_inactive_cause
#print axioms NoThreeLine.recycledScheduledPair_positive_loss_cause
