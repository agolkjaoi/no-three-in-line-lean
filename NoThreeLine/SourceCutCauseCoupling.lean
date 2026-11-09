import NoThreeLine.SourceCapBoundary
import NoThreeLine.SourceRestrictedRestart
import NoThreeLine.BirthCalendarTime

/-! The restricted process has the identical original-board prefix whenever
it is still running. Positive cut loss is therefore caused by an actually
executed original raw boundary at or before the cut, including endpoints. -/
set_option autoImplicit false
set_option maxHeartbeats 1000000
noncomputable section

namespace NoThreeLine
open BirthWitness

theorem sourceRestrict_running_after_step {n : ℕ} (cfg : FlowConfig n) (ε M δ : ℝ)
    (hδ : 0 ≤ δ) (s : AugTimedState cfg) (z : CandidateData n)
    (hd : ¬AugTimedDone cfg (augTimedStep cfg ε M (sourceRestrictState cfg δ hδ s,z))) :
    augAdvance cfg ε M (augTimedInput cfg s,z.1.1) < s.val.2-δ := by
  have hbefore : ¬AugTimedDone cfg (sourceRestrictState cfg δ hδ s) := by
    intro h
    exact hd (by simpa only [augTimedStep_done cfg ε M _ h z] using h)
  obtain ⟨hc,hs⟩ := sourceRestrictState_running cfg δ hδ s hbefore
  have hd' : ¬((sourceRestrictState cfg δ hδ s).val.2 ≤ 0 ∨
      (sourceRestrictState cfg δ hδ s).val.1.physical.process.stopped = true) := by
    rw [sourceRestrictState_remaining cfg δ hδ s (sub_nonneg.mp hc.le)]
    refine not_or.mpr ⟨not_le_of_gt hc,?_⟩
    change ¬s.val.1.physical.process.stopped = true
    rw [hs]
    decide
  by_contra ha
  have hzero : (augTimedStep cfg ε M (sourceRestrictState cfg δ hδ s,z)).val.2 = 0 := by
    change (augTimedStepPair cfg ε M (sourceRestrictState cfg δ hδ s,z)).2 = 0
    rw [augTimedStepPair,if_neg hd']
    change (sourceRestrictState cfg δ hδ s).val.2 -
      augAdvance cfg ε M (augTimedInput cfg (sourceRestrictState cfg δ hδ s),z.1.1) = 0
    rw [sourceRestrictState_remaining cfg δ hδ s (sub_nonneg.mp hc.le),
      sourceRestrictState_input_of_le cfg δ hδ s (sub_nonneg.mp hc.le),
      sourceCap_advance cfg ε M (s.val.2-δ) hc.le,min_eq_right (le_of_not_gt ha),sub_self]
  exact hd (Or.inl hzero)

theorem sourceRestrict_recycled_running_eq {n : ℕ} (cfg : FlowConfig n) (ε M δ : ℝ)
    (hδ : 0 ≤ δ) (hn : 0 < n) (s : AugTimedState cfg) (k : ℕ) (ω : BoardClockPath n)
    (hd : ¬AugTimedDone cfg (augRecycledPair cfg ε M hn (sourceRestrictState cfg δ hδ s) k ω).1) :
    augRecycledPair cfg ε M hn (sourceRestrictState cfg δ hδ s) k ω =
      (sourceRestrictState cfg δ hδ (augRecycledPair cfg ε M hn s k ω).1,
        (augRecycledPair cfg ε M hn s k ω).2) := by
  induction k with
  | zero => rfl
  | succ k ih =>
    let old := augRecycledPair cfg ε M hn s k ω
    let cut := augRecycledPair cfg ε M hn (sourceRestrictState cfg δ hδ s) k ω
    have hprev : ¬AugTimedDone cfg cut.1 := by
      intro h
      apply hd
      change AugTimedDone cfg (augTimedStep cfg ε M (cut.1,WinnerMarkLaw.firstMarkedRace hn cut.2))
      rw [augTimedStep_done cfg ε M cut.1 h]
      exact h
    have he := ih hprev
    change cut = (sourceRestrictState cfg δ hδ old.1,old.2) at he
    have hnext : ¬AugTimedDone cfg (augTimedStep cfg ε M
        (sourceRestrictState cfg δ hδ old.1,WinnerMarkLaw.firstMarkedRace hn old.2)) := by
      change ¬AugTimedDone cfg (augTimedStep cfg ε M (cut.1,WinnerMarkLaw.firstMarkedRace hn cut.2)) at hd
      simpa only [he] using hd
    have hstrict := sourceRestrict_running_after_step cfg ε M δ hδ old.1
      (WinnerMarkLaw.firstMarkedRace hn old.2) hnext
    change augRestartStep cfg ε M hn cut =
      (sourceRestrictState cfg δ hδ (augRestartStep cfg ε M hn old).1,
        (augRestartStep cfg ε M hn old).2)
    rw [he]
    apply Prod.ext
    · exact sourceRestrictState_step cfg ε M δ hδ old.1 (WinnerMarkLaw.firstMarkedRace hn old.2) hstrict
    · exact sourceRestrictState_residualBoard cfg ε M δ hδ hn old.1 old.2 hstrict

theorem sourceRestrict_recycled_boundary_origin {n : ℕ} (cfg : FlowConfig n) (ε M δ : ℝ)
    (hδ : 0 ≤ δ) (hn : 0 < n) (s : AugTimedState cfg) (p : Grid n) (k : ℕ) (ω : BoardClockPath n)
    (hb : recycledRootBoundaryCauseAt cfg ε M hn p (sourceRestrictState cfg δ hδ s) k ω) :
    recycledRootBoundaryCauseAt cfg ε M hn p s k ω ∧
      birthCalendarTime cfg ε M hn s (k+1) ω ≤ s.val.2-δ := by
  let old := augRecycledPair cfg ε M hn s k ω
  have he := sourceRestrict_recycled_running_eq cfg ε M δ hδ hn s k ω hb.1
  unfold recycledRootBoundaryCauseAt at hb
  rw [he] at hb
  obtain ⟨hbo,ha⟩ := sourceRestrict_boundary_unrestrict cfg ε M δ hδ old.1
    (WinnerMarkLaw.firstMarkedRace hn old.2) p hb
  refine ⟨hbo,?_⟩
  have hrun : ¬(old.1.val.2 ≤ 0 ∨ old.1.val.1.physical.process.stopped = true) := by
    rintro (hzero | hstop)
    · exact hbo.1 (Or.inl (le_antisymm hzero old.1.property.2.1))
    · exact hbo.1 (Or.inr hstop)
  have hremaining : (augRecycledPair cfg ε M hn s (k+1) ω).1.val.2 =
      old.1.val.2-augAdvance cfg ε M (augTimedInput cfg old.1,(WinnerMarkLaw.firstMarkedRace hn old.2).1.1) := by
    change (augTimedStepPair cfg ε M (old.1,WinnerMarkLaw.firstMarkedRace hn old.2)).2 = _
    rw [augTimedStepPair,if_neg hrun]
  unfold birthCalendarTime
  rw [hremaining]
  linarith

theorem sourceRestrict_terminal_positive_loss_origin {n : ℕ} (cfg : FlowConfig n) (ε M δ : ℝ)
    (hδ : 0 ≤ δ) (hn : 0 < n) (s : AugTimedState cfg) (p : Grid n) (ω : BoardClockPath n)
    (hc : 0 < (augRecycledTerminal cfg ε M hn (sourceRestrictState cfg δ hδ s) ω).val.1.physical.process.birthCreditLoss p) :
    0 < s.val.1.physical.process.birthCreditLoss p ∨
      ∃ k, recycledRootBoundaryCauseAt cfg ε M hn p s k ω ∧
        birthCalendarTime cfg ε M hn s (k+1) ω ≤ s.val.2-δ := by
  rcases recycled_positive_loss_origin cfg ε M hn p (sourceRestrictState cfg δ hδ s) _ ω hc with
    hi | ⟨k,_,hb⟩
  · exact Or.inl hi
  · exact Or.inr ⟨k,sourceRestrict_recycled_boundary_origin cfg ε M δ hδ hn s p k ω hb⟩

namespace BirthWitness

theorem sourceCutTerminal_positive_loss_origin {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ)
    (hδ : 0 ≤ δ) (hn : 0 < n) (s : GoodObservation cfg) (p : Grid n) (ω : BoardClockPath n)
    (hc : 0 < (sourceCutTerminal cfg ε M start δ hδ hn s ω).1.val.1.physical.process.birthCreditLoss p) :
    0 < s.val.1.val.1.physical.process.birthCreditLoss p ∨
      ∃ k, recycledRootBoundaryCauseAt cfg ε M hn p s.val.1 k ω ∧
        birthCalendarTime cfg ε M hn s.val.1 (k+1) ω ≤ s.val.1.val.2-δ := by
  rw [sourceCutTerminal_base] at hc
  exact sourceRestrict_terminal_positive_loss_origin cfg ε M δ hδ hn s.val.1 p ω hc

end BirthWitness
end NoThreeLine

#print axioms NoThreeLine.sourceRestrict_recycled_running_eq
#print axioms NoThreeLine.sourceRestrict_recycled_boundary_origin
#print axioms NoThreeLine.BirthWitness.sourceCutTerminal_positive_loss_origin
