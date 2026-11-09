import NoThreeLine.ActualRetirementCauses
import NoThreeLine.InactiveSavedCredit
import NoThreeLine.RecycledTerminal

/-! Causal origins of positive saved-credit loss along the actual recycled
board path. Selection/geometric death cannot produce positive inactive credit.
The terminal selector is used as a finite index; completion is not assumed. -/
set_option autoImplicit false
set_option maxHeartbeats 1000000
noncomputable section

namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem augTimedStep_inactive_credit {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (s : AugTimedState cfg) (z : CandidateData n) (p : Grid n)
    (hp : (s.val.1.physical.process.accounts p).status ≠ .active) :
    ((augTimedStep cfg ε M (s,z)).val.1.physical.process.accounts p).credit =
      (s.val.1.physical.process.accounts p).credit := by
  change ((augTimedStepPair cfg ε M (s,z)).1.physical.process.accounts p).credit = _
  unfold augTimedStepPair
  split_ifs
  · rfl
  · exact augOutcome_inactive_credit cfg ε M (augTimedInput cfg s) s.property.1.1 p hp z

def rootStepBoundaryCause {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (p : Grid n) (s : AugTimedState cfg) (z : CandidateData n) : Prop :=
  ¬AugTimedDone cfg s ∧
    ((augRawOutcome cfg ε M (augTimedInput cfg s,z)).physical.process.accounts p).status = .active ∧
    rootResolveCause (augRawOutcome cfg ε M (augTimedInput cfg s,z))
      cfg.directions cfg.B cfg.K cfg.rho ε M p

theorem augTimedStep_positive_loss_origin {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (s : AugTimedState cfg) (z : CandidateData n) (p : Grid n)
    (hc : 0 < (augTimedStep cfg ε M (s,z)).val.1.physical.process.birthCreditLoss p) :
    0 < s.val.1.physical.process.birthCreditLoss p ∨ rootStepBoundaryCause cfg ε M p s z := by
  by_cases hs : s.val.1.physical.process.stopped = true
  · left
    simpa only [augTimedStep_stopped cfg ε M s hs z] using hc
  have hsf : s.val.1.physical.process.stopped = false := Bool.eq_false_iff.mpr hs
  by_cases hp : (s.val.1.physical.process.accounts p).status = .active
  · exact Or.inr (augTimedStep_positive_loss_cause cfg ε M s z p hsf hp hc)
  · left
    obtain ⟨_,hcredit⟩ := (ProcessState.birthCreditLoss_pos_iff _ p).mp hc
    rw [augTimedStep_inactive_credit cfg ε M s z p hp] at hcredit
    exact (ProcessState.birthCreditLoss_pos_iff _ p).mpr
      ⟨Or.inr (CreditAccount.positive_inactive_retired _ hp hcredit),hcredit⟩

def recycledRootBoundaryCauseAt {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (p : Grid n) (s : AugTimedState cfg) (j : ℕ) (ω : BoardClockPath n) : Prop :=
  rootStepBoundaryCause cfg ε M p (augRecycledPair cfg ε M hn s j ω).1
    (WinnerMarkLaw.firstMarkedRace hn (augRecycledPair cfg ε M hn s j ω).2)

theorem recycled_positive_loss_origin {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (p : Grid n) (s : AugTimedState cfg) (k : ℕ) (ω : BoardClockPath n)
    (hc : 0 < (augRecycledPair cfg ε M hn s k ω).1.val.1.physical.process.birthCreditLoss p) :
    0 < s.val.1.physical.process.birthCreditLoss p ∨
      ∃ j < k, recycledRootBoundaryCauseAt cfg ε M hn p s j ω := by
  induction k with
  | zero => exact Or.inl hc
  | succ k ih =>
    rcases augTimedStep_positive_loss_origin cfg ε M (augRecycledPair cfg ε M hn s k ω).1
      (WinnerMarkLaw.firstMarkedRace hn (augRecycledPair cfg ε M hn s k ω).2) p hc with hprev | hnew
    · rcases ih hprev with hi | ⟨j,hj,hcause⟩
      · exact Or.inl hi
      · exact Or.inr ⟨j,Nat.lt.step hj,hcause⟩
    · exact Or.inr ⟨k,Nat.lt_succ_self k,hnew⟩

theorem recycled_positive_loss_boundary {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (p : Grid n) (s : AugTimedState cfg) (k : ℕ) (ω : BoardClockPath n)
    (hs : s.val.1.physical.process.stopped = false)
    (hp : (s.val.1.physical.process.accounts p).status = .active)
    (hc : 0 < (augRecycledPair cfg ε M hn s k ω).1.val.1.physical.process.birthCreditLoss p) :
    ∃ j < k, recycledRootBoundaryCauseAt cfg ε M hn p s j ω := by
  rcases recycled_positive_loss_origin cfg ε M hn p s k ω hc with hi | h
  · simp [ProcessState.birthCreditLoss,ProcessState.birthUnavailable,hs,hp] at hi
  · exact h

theorem terminal_positive_loss_boundary {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (p : Grid n) (s : AugTimedState cfg) (ω : BoardClockPath n)
    (hs : s.val.1.physical.process.stopped = false)
    (hp : (s.val.1.physical.process.accounts p).status = .active)
    (hc : 0 < (augRecycledTerminal cfg ε M hn s ω).val.1.physical.process.birthCreditLoss p) :
    ∃ j < augRecycledCompletionIndex cfg ε M hn s ω,
      recycledRootBoundaryCauseAt cfg ε M hn p s j ω :=
  recycled_positive_loss_boundary cfg ε M hn p s _ ω hs hp hc

end NoThreeLine

#print axioms NoThreeLine.augTimedStep_positive_loss_origin
#print axioms NoThreeLine.recycled_positive_loss_boundary
#print axioms NoThreeLine.terminal_positive_loss_boundary
