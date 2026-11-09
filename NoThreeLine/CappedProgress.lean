import NoThreeLine.CappedSegment

/-! Capping preserves the finite event budget. A boundary-only update that
occurs before the remaining horizon and does not stop strictly decreases it. -/
set_option autoImplicit false
noncomputable section
open Set

namespace NoThreeLine
open AuxiliaryODE

theorem cappedPreState_budget {n : ℕ} (cfg : FlowConfig n) (x : CappedInput cfg)
    (z : (ℝ × Grid n) × ℝ) : (cappedPreState cfg (x,z)).boundaryBudget = x.1.val.boundaryBudget :=
  x.1.val.withCoordinates_budget _

theorem cappedOutcome_budget_le {n : ℕ} (cfg : FlowConfig n) (x : CappedInput cfg)
    (z : (ℝ × Grid n) × ℝ) : (cappedOutcome cfg (x,z)).boundaryBudget ≤ x.1.val.boundaryBudget := by
  rw [← cappedPreState_budget cfg x z]
  unfold cappedOutcome
  split_ifs
  · exact (ExtendedState.resolve_budget_le _ _ _ _ _).trans
      (ExtendedState.candidateUpdate_budget_le _ _ _ _ _ _ _)
  · exact ExtendedState.resolve_budget_le _ _ _ _ _

theorem cappedGuardTime_eq_guard {n : ℕ} (cfg : FlowConfig n) (x : CappedInput cfg)
    (he : x.1.val.Valid cfg.B) (h : selectedGuardTime cfg x.1 ≤ x.2) :
    cappedGuardTime cfg x = selectedGuardTime cfg x.1 := by
  have hτ := (selectedCurve_spec cfg x.1 he.2.1).2.1.1
  simp only [cappedGuardTime,segmentTime,min_eq_left h,max_eq_right hτ]

theorem cappedGuardTime_eq_guard_of_lt {n : ℕ} (cfg : FlowConfig n) (x : CappedInput cfg)
    (he : x.1.val.Valid cfg.B) (h : cappedGuardTime cfg x < x.2) :
    cappedGuardTime cfg x = selectedGuardTime cfg x.1 := by
  apply cappedGuardTime_eq_guard cfg x he
  by_contra hn
  have hle : x.2 ≤ cappedGuardTime cfg x := by
    simp only [cappedGuardTime,segmentTime,min_eq_right (le_of_not_ge hn)]
    exact le_max_right _ _
  exact (not_le_of_gt h) hle

theorem cappedOutcome_eq_segment {n : ℕ} (cfg : FlowConfig n) (x : CappedInput cfg)
    (z : (ℝ × Grid n) × ℝ) (h : cappedGuardTime cfg x = selectedGuardTime cfg x.1) :
    cappedOutcome cfg (x,z) = segmentOutcome cfg (x.1,z) := by
  simp only [cappedOutcome,segmentOutcome,cappedPreState,segmentPreState,cappedAdvance,h,segmentTime]

theorem cappedOutcome_budget_strict {n : ℕ} (cfg : FlowConfig n) (x : CappedInput cfg)
    (he : x.1.val.Valid cfg.B) (z : (ℝ × Grid n) × ℝ)
    (hlate : cappedGuardTime cfg x < z.1.1) (hearly : cappedGuardTime cfg x < x.2)
    (hH : x.2 ≤ cfg.horizon)
    (hnstop : (cappedOutcome cfg (x,z)).process.stopped ≠ true) :
    (cappedOutcome cfg (x,z)).boundaryBudget < x.1.val.boundaryBudget := by
  have hc := cappedGuardTime_eq_guard_of_lt cfg x he hearly
  have ho := cappedOutcome_eq_segment cfg x z hc
  rw [ho]
  apply segmentOutcome_budget_strict cfg x.1 he z
  · simpa only [hc] using hlate
  · exact (hc ▸ hearly).trans_le hH
  · simpa only [ho] using hnstop

end NoThreeLine

#print axioms NoThreeLine.cappedOutcome_budget_le
#print axioms NoThreeLine.cappedOutcome_budget_strict
