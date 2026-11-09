import NoThreeLine.SegmentOutcome
import NoThreeLine.EventBudget

/-! The actual segment outcome clears its boundary and decreases the finite
boundary counter when it hits a nonterminal boundary before its candidate. -/
set_option autoImplicit false
noncomputable section
open Set

namespace NoThreeLine
open AuxiliaryODE

theorem ExtendedState.resolve_clears_pending {n : ℕ} (e : ExtendedState n)
    (Γ : Finset PrimitiveLines.ZPoint) (B K ρ : ℝ) :
    ¬pendingBoundary (e.resolve Γ B K ρ).process Γ B K ρ
      (e.resolve Γ B K ρ).clocks (e.resolve Γ B K ρ).lineCredits (e.resolve Γ B K ρ).handled :=
  resolveBoundary_clears_pending e.process Γ B K ρ e.clocks e.lineCredits e.handled

theorem segmentOutcome_clears_pending {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box × ((ℝ × Grid n) × ℝ)) :
    ¬pendingBoundary (segmentOutcome cfg x).process cfg.directions cfg.B cfg.K cfg.rho
      (segmentOutcome cfg x).clocks (segmentOutcome cfg x).lineCredits (segmentOutcome cfg x).handled := by
  unfold segmentOutcome
  split_ifs <;> exact ExtendedState.resolve_clears_pending _ _ _ _ _

theorem segmentPreState_budget {n : ℕ} (cfg : FlowConfig n) (e : StateBall n cfg.box)
    (x : (ℝ × Grid n) × ℝ) : (segmentPreState cfg (e,x)).boundaryBudget = e.val.boundaryBudget :=
  e.val.withCoordinates_budget _

theorem segmentOutcome_budget_le {n : ℕ} (cfg : FlowConfig n) (e : StateBall n cfg.box)
    (x : (ℝ × Grid n) × ℝ) : (segmentOutcome cfg (e,x)).boundaryBudget ≤ e.val.boundaryBudget := by
  rw [← segmentPreState_budget cfg e x]
  unfold segmentOutcome
  split_ifs
  · exact (ExtendedState.resolve_budget_le _ _ _ _ _).trans
      (ExtendedState.candidateUpdate_budget_le _ _ _ _ _ _ _)
  · exact ExtendedState.resolve_budget_le _ _ _ _ _

theorem segmentOutcome_budget_strict {n : ℕ} (cfg : FlowConfig n) (e : StateBall n cfg.box)
    (he : e.val.Valid cfg.B) (x : (ℝ × Grid n) × ℝ)
    (hlate : selectedGuardTime cfg e < x.1.1)
    (hearly : selectedGuardTime cfg e < cfg.horizon)
    (hnstop : (segmentOutcome cfg (e,x)).process.stopped ≠ true) :
    (segmentOutcome cfg (e,x)).boundaryBudget < e.val.boundaryBudget := by
  have hspec := selectedCurve_spec cfg e he.2.1
  have hτ : 0 ≤ selectedGuardTime cfg e := hspec.2.1.1
  have hhit := hspec.2.2.2.2 hearly
  have hpending : pendingBoundary (segmentPreState cfg (e,x)).process cfg.directions cfg.B cfg.K cfg.rho
      (segmentPreState cfg (e,x)).clocks (segmentPreState cfg (e,x)).lineCredits
      (segmentPreState cfg (e,x)).handled := by
    have hp := (mem_pendingGuardSet_iff e.val.process cfg.directions cfg.B cfg.K cfg.rho e.val.handled
      (selectedCurve cfg (e,selectedGuardTime cfg e))).mp hhit
    simpa only [segmentPreState,segmentTime,min_eq_left hlate.le,max_eq_right hτ,
      selectedTrajectory,ExtendedState.withCoordinates] using hp
  have hout : segmentOutcome cfg (e,x) =
      (segmentPreState cfg (e,x)).resolve cfg.directions cfg.B cfg.K cfg.rho := by
    simp only [segmentOutcome,not_le_of_gt hlate,and_false,if_false]
  rw [hout,← segmentPreState_budget cfg e x]
  apply ExtendedState.resolve_budget_strict _ _ _ _ _ hpending
  simpa only [hout] using hnstop

end NoThreeLine

#print axioms NoThreeLine.segmentOutcome_clears_pending
#print axioms NoThreeLine.segmentOutcome_budget_strict
