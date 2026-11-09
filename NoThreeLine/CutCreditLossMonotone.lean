import NoThreeLine.CreditLossMonotone
import NoThreeLine.SourceCutCauseCoupling

/-! Cutting actual remaining time cannot increase unavailable saved-credit
loss. The same-board running-prefix coupling supplies the comparison;
original completion is required only to dominate arbitrary finite prefixes. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open Set

namespace NoThreeLine
open AuxiliaryODE BirthWitness EtaMixedGenerator

theorem selectedAugmentedCurve_birthCreditLoss_eq {n : ℕ} (cfg : FlowConfig n)
    (x : EtaFlowInput cfg) (he : x.1.val.Valid cfg.B) (p : Grid n) (t : ℝ)
    (hs : x.1.val.process.stopped = false) (ht : t ∈ Icc (0 : ℝ) (selectedGuardTime cfg x.1)) :
    (selectedAugmentedCurve cfg x t).physical.process.birthCreditLoss p = x.1.val.process.birthCreditLoss p := by
  have hstop : (selectedAugmentedCurve cfg x t).physical.process.stopped = false := hs
  have hstatus : ((selectedAugmentedCurve cfg x t).physical.process.accounts p).status =
      (x.1.val.process.accounts p).status := rfl
  by_cases hr : (x.1.val.process.accounts p).status = .retired
  · have hu : x.1.val.process.birthUnavailable p := Or.inr hr
    have hv : (selectedAugmentedCurve cfg x t).physical.process.birthUnavailable p := Or.inr (hstatus.trans hr)
    rw [ProcessState.birthCreditLoss,if_pos hv,ProcessState.birthCreditLoss,if_pos hu]
    exact selectedTrajectory_inactive_credit cfg x.1 he p (by rw [hr]; decide) t ht
  · have hu : ¬x.1.val.process.birthUnavailable p := by
      simp only [ProcessState.birthUnavailable,hs,Bool.false_eq_true,false_or,hr,not_false_eq_true]
    have hv : ¬(selectedAugmentedCurve cfg x t).physical.process.birthUnavailable p := by
      simp only [ProcessState.birthUnavailable,hstop,Bool.false_eq_true,false_or,hstatus,hr,not_false_eq_true]
    rw [ProcessState.birthCreditLoss,if_neg hv,ProcessState.birthCreditLoss,if_neg hu]

theorem sourceRestrict_step_birthCreditLoss_le {n : ℕ} (cfg : FlowConfig n) (ε M δ : ℝ)
    (hδ : 0 ≤ δ) (s : AugTimedState cfg) (z : CandidateData n) (p : Grid n) :
    (augTimedStep cfg ε M (sourceRestrictState cfg δ hδ s,z)).val.1.physical.process.birthCreditLoss p ≤
      (augTimedStep cfg ε M (s,z)).val.1.physical.process.birthCreditLoss p := by
  by_cases hd : AugTimedDone cfg (sourceRestrictState cfg δ hδ s)
  · rw [augTimedStep_done cfg ε M _ hd z]
    exact augTimedStep_birthCreditLoss_mono cfg ε M s z p
  obtain ⟨hc,hs⟩ := sourceRestrictState_running cfg δ hδ s hd
  have hr : 0 < s.val.2 := lt_of_le_of_lt hδ (sub_pos.mp hc)
  have hd0 : ¬(s.val.2 ≤ 0 ∨ s.val.1.physical.process.stopped = true) := by
    simp only [not_le_of_gt hr,hs,Bool.false_eq_true,or_self,not_false_eq_true]
  have hd1 : ¬((sourceRestrictState cfg δ hδ s).val.2 ≤ 0 ∨
      (sourceRestrictState cfg δ hδ s).val.1.physical.process.stopped = true) := by
    rw [sourceRestrictState_remaining cfg δ hδ s (sub_nonneg.mp hc.le)]
    refine not_or.mpr ⟨not_le_of_gt hc,?_⟩
    change ¬s.val.1.physical.process.stopped = true
    rw [hs]
    decide
  by_cases ha : augAdvance cfg ε M (augTimedInput cfg s,z.1.1) ≤ s.val.2-δ
  · have he : (augTimedStep cfg ε M (sourceRestrictState cfg δ hδ s,z)).val.1 =
        (augTimedStep cfg ε M (s,z)).val.1 := by
      change (augTimedStepPair cfg ε M (sourceRestrictState cfg δ hδ s,z)).1 =
        (augTimedStepPair cfg ε M (s,z)).1
      rw [augTimedStepPair,if_neg hd1,augTimedStepPair,if_neg hd0]
      change augOutcome cfg ε M (augTimedInput cfg (sourceRestrictState cfg δ hδ s),z) =
        augOutcome cfg ε M (augTimedInput cfg s,z)
      rw [sourceRestrictState_input_of_le cfg δ hδ s (sub_nonneg.mp hc.le)]
      unfold augOutcome
      rw [sourceCap_raw_eq_of_le cfg ε M (s.val.2-δ) hc.le (augTimedInput cfg s) z ha]
    rw [he]
  · have hi := sourceRestrict_interior_state cfg ε M δ hδ s z hc hs (lt_of_not_ge ha)
    have ht : s.val.2-δ ∈ Icc (0 : ℝ) (selectedGuardTime cfg (augTimedInput cfg s).1.1) :=
      ⟨hc.le,((lt_of_not_ge ha).le.trans (augAdvance_mem cfg ε M _ s.property.1.1 z.1.1).2).trans
        (augGuardTime_mem cfg ε M _ s.property.1.1).2⟩
    have hl : (augTimedStep cfg ε M (sourceRestrictState cfg δ hδ s,z)).val.1.physical.process.birthCreditLoss p =
        s.val.1.physical.process.birthCreditLoss p := by
      rw [congrArg Prod.fst hi]
      exact selectedAugmentedCurve_birthCreditLoss_eq cfg (augTimedInput cfg s).1 s.property.1.1 p _ hs ht
    rw [hl]
    exact augTimedStep_birthCreditLoss_mono cfg ε M s z p

theorem sourceRestrict_recycled_birthCreditLoss_le {n : ℕ} (cfg : FlowConfig n) (ε M δ : ℝ)
    (hδ : 0 ≤ δ) (hn : 0 < n) (s : AugTimedState cfg) (p : Grid n) (k : ℕ) (ω : BoardClockPath n) :
    (augRecycledPair cfg ε M hn (sourceRestrictState cfg δ hδ s) k ω).1.val.1.physical.process.birthCreditLoss p ≤
      (augRecycledPair cfg ε M hn s k ω).1.val.1.physical.process.birthCreditLoss p := by
  induction k with
  | zero => exact le_rfl
  | succ k ih =>
    let cut := augRecycledPair cfg ε M hn (sourceRestrictState cfg δ hδ s) k ω
    let old := augRecycledPair cfg ε M hn s k ω
    by_cases hd : AugTimedDone cfg cut.1
    · have he : (augRecycledPair cfg ε M hn (sourceRestrictState cfg δ hδ s) (k+1) ω).1 = cut.1 :=
        augTimedStep_done cfg ε M cut.1 hd (WinnerMarkLaw.firstMarkedRace hn cut.2)
      rw [he]
      exact ih.trans (augTimedStep_birthCreditLoss_mono cfg ε M old.1
        (WinnerMarkLaw.firstMarkedRace hn old.2) p)
    · have he := sourceRestrict_recycled_running_eq cfg ε M δ hδ hn s k ω hd
      change cut = (sourceRestrictState cfg δ hδ old.1,old.2) at he
      change (augTimedStep cfg ε M (cut.1,WinnerMarkLaw.firstMarkedRace hn cut.2)).val.1.physical.process.birthCreditLoss p ≤ _
      rw [he]
      exact sourceRestrict_step_birthCreditLoss_le cfg ε M δ hδ old.1
        (WinnerMarkLaw.firstMarkedRace hn old.2) p

theorem sourceRestrict_terminal_birthCreditLoss_le {n : ℕ} (cfg : FlowConfig n) (ε M δ : ℝ)
    (hδ : 0 ≤ δ) (hn : 0 < n) (s : AugTimedState cfg) (p : Grid n) (ω : BoardClockPath n)
    (hd : AugTimedDone cfg (augRecycledTerminal cfg ε M hn s ω)) :
    (augRecycledTerminal cfg ε M hn (sourceRestrictState cfg δ hδ s) ω).val.1.physical.process.birthCreditLoss p ≤
      (augRecycledTerminal cfg ε M hn s ω).val.1.physical.process.birthCreditLoss p :=
  (sourceRestrict_recycled_birthCreditLoss_le cfg ε M δ hδ hn s p _ ω).trans
    (recycled_birthCreditLoss_le_terminal cfg ε M hn s p ω hd _)

namespace BirthWitness

theorem sourceCutTerminal_birthCreditLoss_le {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ)
    (hδ : 0 ≤ δ) (hn : 0 < n) (s : GoodObservation cfg) (p : Grid n) (ω : BoardClockPath n)
    (hd : AugTimedDone cfg (augRecycledTerminal cfg ε M hn s.val.1 ω)) :
    (sourceCutTerminal cfg ε M start δ hδ hn s ω).1.val.1.physical.process.birthCreditLoss p ≤
      (augRecycledTerminal cfg ε M hn s.val.1 ω).val.1.physical.process.birthCreditLoss p := by
  rw [sourceCutTerminal_base]
  exact sourceRestrict_terminal_birthCreditLoss_le cfg ε M δ hδ hn s.val.1 p ω hd

end BirthWitness
end NoThreeLine

#print axioms NoThreeLine.sourceRestrict_step_birthCreditLoss_le
#print axioms NoThreeLine.sourceRestrict_recycled_birthCreditLoss_le
#print axioms NoThreeLine.BirthWitness.sourceCutTerminal_birthCreditLoss_le
