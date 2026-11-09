import NoThreeLine.RecycledRetirementCauses
import NoThreeLine.DeadlineRetirementCauses
import NoThreeLine.RecycledPhaseComposition
import NoThreeLine.TimedWeightGrowth

/-! Actual positive-credit loss is nondecreasing through timed updates and
scheduled phases. A retired account keeps its credit; stopped states freeze.
No expectation or loss estimate is assumed. -/
set_option autoImplicit false
set_option maxHeartbeats 1000000
noncomputable section

namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem augTimedStep_birthCreditLoss_mono {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (s : AugTimedState cfg) (z : CandidateData n) (p : Grid n) :
    s.val.1.physical.process.birthCreditLoss p ≤
      (augTimedStep cfg ε M (s,z)).val.1.physical.process.birthCreditLoss p := by
  by_cases hs : s.val.1.physical.process.stopped = true
  · rw [augTimedStep_stopped cfg ε M s hs z]
  by_cases hpos : 0 < s.val.1.physical.process.birthCreditLoss p
  · obtain ⟨hu,hcredit⟩ := (ProcessState.birthCreditLoss_pos_iff _ p).mp hpos
    have hr : (s.val.1.physical.process.accounts p).status = .retired := hu.resolve_left hs
    have hi : (s.val.1.physical.process.accounts p).status ≠ .active := by rw [hr]; decide
    have he := augTimedStep_inactive_credit cfg ε M s z p hi
    have hpostpos : 0 < ((augTimedStep cfg ε M (s,z)).val.1.physical.process.accounts p).credit := by
      rw [he]
      exact hcredit
    have hposti : ((augTimedStep cfg ε M (s,z)).val.1.physical.process.accounts p).status ≠ .active := by
      intro hactive
      exact hi ((ProcessState.mem_activeEvents _ p).mp
        (augTimedStep_active_subset cfg ε M s z ((ProcessState.mem_activeEvents _ p).mpr hactive)))
    have hpostr := CreditAccount.positive_inactive_retired _ hposti hpostpos
    have hpostu : (augTimedStep cfg ε M (s,z)).val.1.physical.process.birthUnavailable p := Or.inr hpostr
    rw [ProcessState.birthCreditLoss,if_pos hu,ProcessState.birthCreditLoss,if_pos hpostu,he]
  · exact (le_of_not_gt hpos).trans ((ProcessState.birthCreditLoss_bounds _ p
      (augTimedCredit_bounds cfg p (augTimedStep cfg ε M (s,z))).1).1)

theorem recycled_birthCreditLoss_monotone {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (s : AugTimedState cfg) (p : Grid n) (ω : BoardClockPath n) :
    Monotone (fun k => (augRecycledPair cfg ε M hn s k ω).1.val.1.physical.process.birthCreditLoss p) := by
  apply monotone_nat_of_le_succ
  intro k
  exact augTimedStep_birthCreditLoss_mono cfg ε M (augRecycledPair cfg ε M hn s k ω).1
    (WinnerMarkLaw.firstMarkedRace hn (augRecycledPair cfg ε M hn s k ω).2) p

theorem recycled_birthCreditLoss_le_terminal {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (s : AugTimedState cfg) (p : Grid n) (ω : BoardClockPath n)
    (hd : AugTimedDone cfg (augRecycledTerminal cfg ε M hn s ω)) (k : ℕ) :
    (augRecycledPair cfg ε M hn s k ω).1.val.1.physical.process.birthCreditLoss p ≤
      (augRecycledTerminal cfg ε M hn s ω).val.1.physical.process.birthCreditLoss p := by
  let I := augRecycledCompletionIndex cfg ε M hn s ω
  change _ ≤ (augRecycledPair cfg ε M hn s I ω).1.val.1.physical.process.birthCreditLoss p
  by_cases hk : k ≤ I
  · exact recycled_birthCreditLoss_monotone cfg ε M hn s p ω hk
  · rw [augRecycledPair_absorbing cfg ε M hn s ω I hd k (le_of_not_ge hk)]

theorem augValidDeadlineRetirement_unavailable {n : ℕ} {B : ℝ}
    (deadline : Grid n → ℝ) (t : ℝ) (e : ValidAugmentedState n B) (p : Grid n)
    (hu : e.val.physical.process.birthUnavailable p) :
    (augValidDeadlineRetirement deadline t e).val.physical.process.birthUnavailable p := by
  rcases hu with hs | hr
  · exact Or.inl ((augValidDeadlineRetirement_stop_flag deadline t e).trans hs)
  · by_cases hs : e.val.physical.process.stopped = true
    · rw [augValidDeadlineRetirement_stopped deadline t e hs]
      exact Or.inr hr
    · right
      simp [augValidDeadlineRetirement,hs,deadlineRetirement,ExtendedState.retire,
        ProcessState.retire,CreditAccount.retire,hr]

theorem augValidDeadlineRetirement_birthCreditLoss_mono {n : ℕ} {B : ℝ}
    (deadline : Grid n → ℝ) (t : ℝ) (e : ValidAugmentedState n B) (p : Grid n) :
    e.val.physical.process.birthCreditLoss p ≤
      (augValidDeadlineRetirement deadline t e).val.physical.process.birthCreditLoss p := by
  by_cases hu : e.val.physical.process.birthUnavailable p
  · have hp := augValidDeadlineRetirement_unavailable deadline t e p hu
    have he := augValidDeadlineRetirement_credit deadline t e p
    change ((augValidDeadlineRetirement deadline t e).val.physical.process.accounts p).credit =
      (e.val.physical.process.accounts p).credit at he
    rw [ProcessState.birthCreditLoss,if_pos hu,ProcessState.birthCreditLoss,if_pos hp,he]
  · rw [ProcessState.birthCreditLoss,if_neg hu]
    exact (ProcessState.birthCreditLoss_bounds _ p
      (validAugStateCredit_bounds B p (augValidDeadlineRetirement deadline t e)).1).1

theorem recycledScheduledPair_birthCreditLoss_mono {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (N : ℕ) (e : ValidAugmentedState n B) (p : Grid n) (ω : BoardClockPath n) :
    e.val.physical.process.birthCreditLoss p ≤
      (recycledScheduledPair cs ε M deadline start hn N (e,ω)).1.val.physical.process.birthCreditLoss p := by
  have hi := recycled_birthCreditLoss_monotone (cs N).config ε M hn
    (augPhaseStart (cs N).config ε M e) p ω
    (Nat.zero_le (augRecycledCompletionIndex (cs N).config ε M hn (augPhaseStart (cs N).config ε M e) ω))
  exact hi.trans (augValidDeadlineRetirement_birthCreditLoss_mono deadline
    (phaseEndpoint cs start (N+1)) (augPhaseRecycledPair (cs N).config ε M hn (e,ω)).1 p)

theorem recycledPhaseState_birthCreditLoss_monotone {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (e : ValidAugmentedState n B) (p : Grid n) (ω : BoardClockPath n) :
    Monotone (fun J => (recycledPhaseState cs ε M deadline start hn e J ω).val.physical.process.birthCreditLoss p) := by
  apply monotone_nat_of_le_succ
  intro N
  change _ ≤ (recycledPhases cs ε M deadline start hn e (N+1) ω).1.2.val.physical.process.birthCreditLoss p
  rw [recycledPhases_succ]
  exact recycledScheduledPair_birthCreditLoss_mono cs ε M deadline start hn N
    (recycledPhaseState cs ε M deadline start hn e N ω) p (recycledPhases cs ε M deadline start hn e N ω).2

end NoThreeLine

#print axioms NoThreeLine.augTimedStep_birthCreditLoss_mono
#print axioms NoThreeLine.recycled_birthCreditLoss_le_terminal
#print axioms NoThreeLine.recycledPhaseState_birthCreditLoss_monotone
