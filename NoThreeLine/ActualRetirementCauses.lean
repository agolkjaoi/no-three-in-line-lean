import NoThreeLine.ResolveBoundaryCauses
import NoThreeLine.RootFreezeActiveSupport
import NoThreeLine.BirthRunningRate

/-! Actual candidate geometry is processed before boundary retirement.
A positive new loss cannot be attributed to selection or geometric death. -/
set_option autoImplicit false
set_option maxHeartbeats 1000000
noncomputable section

namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem ProcessState.birth_stopped_eq {n : ℕ} (s : ProcessState n)
    (Γ : Finset PrimitiveLines.ZPoint) (q : Grid n) (positive : Grid n → Bool) :
    (s.birth Γ q positive).stopped = s.stopped := by
  unfold birth
  split_ifs with h
  · exact h.1.symm
  · rfl

theorem ExtendedState.candidateUpdate_stopped_eq {n : ℕ} (e : ExtendedState n)
    (Γ : Finset PrimitiveLines.ZPoint) (mask : Grid n → ℝ) (B : ℝ)
    (q : Grid n) (positive : Grid n → Bool) (mark : ℝ) :
    (e.candidateUpdate Γ mask B q positive mark).process.stopped = e.process.stopped := by
  rw [candidateUpdate_eq]
  split_ifs
  · exact e.process.birth_stopped_eq Γ q positive
  · rfl

theorem augRawOutcome_stopped_eq {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg) (z : CandidateData n) :
    (augRawOutcome cfg ε M (x,z)).physical.process.stopped = x.1.1.val.process.stopped := by
  unfold augRawOutcome
  split_ifs
  · exact ExtendedState.candidateUpdate_stopped_eq _ _ _ _ _ _ _
  · rfl

theorem augOutcome_new_stop_iff {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg) (z : CandidateData n)
    (hs : x.1.1.val.process.stopped = false) :
    (augOutcome cfg ε M (x,z)).physical.process.stopped = true ↔
      (augRawOutcome cfg ε M (x,z)).auxBad cfg.directions ε M ∨
      clockTriggered (augRawOutcome cfg ε M (x,z)).physical.process cfg.directions cfg.K
        (augRawOutcome cfg ε M (x,z)).physical.clocks :=
  (augRawOutcome cfg ε M (x,z)).resolve_new_stop_iff cfg.directions cfg.B cfg.K cfg.rho ε M
    ((augRawOutcome_stopped_eq cfg ε M x z).trans hs)

theorem augOutcome_positive_inactive_cause {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg) (z : CandidateData n) (p : Grid n)
    (hp : (x.1.1.val.process.accounts p).status = .active)
    (hi : ((augOutcome cfg ε M (x,z)).physical.process.accounts p).status ≠ .active)
    (hc : 0 < ((augOutcome cfg ε M (x,z)).physical.process.accounts p).credit) :
    ((augRawOutcome cfg ε M (x,z)).physical.process.accounts p).status = .active ∧
      rootResolveCause (augRawOutcome cfg ε M (x,z)) cfg.directions cfg.B cfg.K cfg.rho ε M p := by
  have hcredit := (augRawOutcome cfg ε M (x,z)).resolve_credit cfg.directions cfg.B cfg.K cfg.rho ε M p
  change ((augOutcome cfg ε M (x,z)).physical.process.accounts p).credit = _ at hcredit
  rw [hcredit] at hc
  have hraw : ((augRawOutcome cfg ε M (x,z)).physical.process.accounts p).status = .active := by
    by_contra h
    rw [augRawOutcome_inactive_credit_zero_of_active cfg ε M x p z hp h] at hc
    exact lt_irrefl 0 hc
  exact ⟨hraw,((augRawOutcome cfg ε M (x,z)).resolve_inactive_iff
    cfg.directions cfg.B cfg.K cfg.rho ε M p hraw).mp hi⟩

theorem ProcessState.birthCreditLoss_pos_iff {n : ℕ} (s : ProcessState n) (p : Grid n) :
    0 < s.birthCreditLoss p ↔ s.birthUnavailable p ∧ 0 < (s.accounts p).credit := by
  by_cases h : s.birthUnavailable p <;> simp [birthCreditLoss,h]

theorem augOutcome_positive_loss_cause {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg) (z : CandidateData n) (p : Grid n)
    (hs : x.1.1.val.process.stopped = false)
    (hp : (x.1.1.val.process.accounts p).status = .active)
    (hc : 0 < (augOutcome cfg ε M (x,z)).physical.process.birthCreditLoss p) :
    ((augRawOutcome cfg ε M (x,z)).physical.process.accounts p).status = .active ∧
      rootResolveCause (augRawOutcome cfg ε M (x,z)) cfg.directions cfg.B cfg.K cfg.rho ε M p := by
  obtain ⟨hu,hpos⟩ := (ProcessState.birthCreditLoss_pos_iff _ p).mp hc
  have hcredit := (augRawOutcome cfg ε M (x,z)).resolve_credit cfg.directions cfg.B cfg.K cfg.rho ε M p
  change ((augOutcome cfg ε M (x,z)).physical.process.accounts p).credit = _ at hcredit
  rw [hcredit] at hpos
  have hraw : ((augRawOutcome cfg ε M (x,z)).physical.process.accounts p).status = .active := by
    by_contra h
    rw [augRawOutcome_inactive_credit_zero_of_active cfg ε M x p z hp h] at hpos
    exact lt_irrefl 0 hpos
  refine ⟨hraw,?_⟩
  rcases hu with hstop | hret
  · rcases (augOutcome_new_stop_iff cfg ε M x z hs).mp hstop with ha | hk
    · exact Or.inl ha
    · exact Or.inr (Or.inl hk)
  · apply ((augRawOutcome cfg ε M (x,z)).resolve_inactive_iff
      cfg.directions cfg.B cfg.K cfg.rho ε M p hraw).mp
    change ((augOutcome cfg ε M (x,z)).physical.process.accounts p).status ≠ .active
    rw [hret]
    decide

theorem augTimedStep_positive_loss_cause {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (s : AugTimedState cfg) (z : CandidateData n) (p : Grid n)
    (hs : s.val.1.physical.process.stopped = false)
    (hp : (s.val.1.physical.process.accounts p).status = .active)
    (hc : 0 < (augTimedStep cfg ε M (s,z)).val.1.physical.process.birthCreditLoss p) :
    ¬AugTimedDone cfg s ∧
      ((augRawOutcome cfg ε M (augTimedInput cfg s,z)).physical.process.accounts p).status = .active ∧
      rootResolveCause (augRawOutcome cfg ε M (augTimedInput cfg s,z))
        cfg.directions cfg.B cfg.K cfg.rho ε M p := by
  have hd : ¬birthDone cfg s := by
    intro hd
    have he : augTimedStep cfg ε M (s,z) = s := by
      apply Subtype.ext
      exact if_pos hd
    rw [he] at hc
    simp [ProcessState.birthCreditLoss,ProcessState.birthUnavailable,hs,hp] at hc
  refine ⟨fun h => hd ((birthDone_iff cfg s).mpr h),?_⟩
  change ¬(s.val.2 ≤ 0 ∨ s.val.1.physical.process.stopped = true) at hd
  change 0 < (augTimedStepPair cfg ε M (s,z)).1.physical.process.birthCreditLoss p at hc
  rw [augTimedStepPair,if_neg hd] at hc
  exact augOutcome_positive_loss_cause cfg ε M (augTimedInput cfg s) z p hs hp hc

theorem augTimedStep_new_stop_cause {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (s : AugTimedState cfg) (z : CandidateData n)
    (hs : s.val.1.physical.process.stopped = false)
    (hc : (augTimedStep cfg ε M (s,z)).val.1.physical.process.stopped = true) :
    ¬AugTimedDone cfg s ∧
      ((augRawOutcome cfg ε M (augTimedInput cfg s,z)).auxBad cfg.directions ε M ∨
        clockTriggered (augRawOutcome cfg ε M (augTimedInput cfg s,z)).physical.process cfg.directions cfg.K
          (augRawOutcome cfg ε M (augTimedInput cfg s,z)).physical.clocks) := by
  have hd : ¬birthDone cfg s := by
    intro hd
    have he : augTimedStep cfg ε M (s,z) = s := by
      apply Subtype.ext
      exact if_pos hd
    rw [he,hs] at hc
    contradiction
  refine ⟨fun h => hd ((birthDone_iff cfg s).mpr h),?_⟩
  change ¬(s.val.2 ≤ 0 ∨ s.val.1.physical.process.stopped = true) at hd
  change (augTimedStepPair cfg ε M (s,z)).1.physical.process.stopped = true at hc
  rw [augTimedStepPair,if_neg hd] at hc
  exact (augOutcome_new_stop_iff cfg ε M (augTimedInput cfg s) z hs).mp hc

end NoThreeLine

#print axioms NoThreeLine.augOutcome_positive_inactive_cause
#print axioms NoThreeLine.augTimedStep_positive_loss_cause
#print axioms NoThreeLine.augTimedStep_new_stop_cause
