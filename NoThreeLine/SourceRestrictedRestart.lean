import NoThreeLine.SourceObservedRestriction

/-! Pathwise residual-board equality under a calendar restriction before
the cut. This is equality of the actual infinite clock arrays, not merely
an equality in distribution or an assumed Markov property. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine

theorem sourceCap_residualBoard {n : ℕ} (hn : 0<n) (T c : ℝ) (hT : 0≤T)
    (ω : BoardClockPath n)
    (hcut : max 0 (min T (BoardFirstCandidate.firstTime hn ω))<c) :
    CappedClockRestart.residualBoard hn (min T c) ω=CappedClockRestart.residualBoard hn T ω := by
  by_cases hw : BoardFirstCandidate.firstTime hn ω≤T
  · have hc : BoardFirstCandidate.firstTime hn ω≤c := by
      rw [min_eq_right hw] at hcut
      exact (le_max_right 0 _).trans hcut.le
    simp only [CappedClockRestart.residualBoard,if_pos hw,if_pos (le_min hw hc)]
  · have hc : T≤c := by
      rw [min_eq_left (le_of_lt (lt_of_not_ge hw)),max_eq_right hT] at hcut
      exact hcut.le
    rw [min_eq_left hc]

theorem sourceRestrictState_residualBoard {n : ℕ} (cfg : FlowConfig n) (ε M δ : ℝ) (hδ : 0≤δ)
    (hn : 0<n) (s : AugTimedState cfg) (ω : BoardClockPath n)
    (hcut : augAdvance cfg ε M (augTimedInput cfg s,(WinnerMarkLaw.firstMarkedRace hn ω).1.1)<s.val.2-δ) :
    augResidualBoard cfg ε M hn (sourceRestrictState cfg δ hδ s,ω)=augResidualBoard cfg ε M hn (s,ω) := by
  have ha0 := (augAdvance_mem cfg ε M (augTimedInput cfg s) s.property.1.1
    (WinnerMarkLaw.firstMarkedRace hn ω).1.1).1
  have hc : 0<s.val.2-δ := ha0.trans_lt hcut
  have hs : δ≤s.val.2 := sub_nonneg.mp hc.le
  have hR : 0<s.val.2 := lt_of_le_of_lt hδ (sub_pos.mp hc)
  by_cases hstop : s.val.1.physical.process.stopped=true
  · have hs' : (sourceRestrictState cfg δ hδ s).val.1.physical.process.stopped=true := hstop
    simp only [augResidualBoard,hstop,hs',or_true,if_true]
  · have hd : ¬(s.val.2≤0 ∨ s.val.1.physical.process.stopped=true) := not_or.mpr ⟨not_le_of_gt hR,hstop⟩
    have hd' : ¬((sourceRestrictState cfg δ hδ s).val.2≤0 ∨
        (sourceRestrictState cfg δ hδ s).val.1.physical.process.stopped=true) := by
      rw [sourceRestrictState_remaining cfg δ hδ s hs]
      exact not_or.mpr ⟨not_le_of_gt hc,hstop⟩
    simp only [augResidualBoard,if_neg hd,if_neg hd']
    rw [sourceRestrictState_input_of_le cfg δ hδ s hs,sourceCap_guard cfg ε M (s.val.2-δ) hc.le]
    exact sourceCap_residualBoard hn _ _ (augGuardTime_mem cfg ε M _ s.property.1.1).1 ω hcut

namespace BirthWitness

theorem goodObservedRestartStep_stopped {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (hn : 0<n) (s : GoodObservation cfg) (ω : BoardClockPath n)
    (hs : s.val.1.val.1.physical.process.stopped=true) :
    goodObservedRestartStep cfg ε M start hn (s,ω)=(s,ω) := by
  apply Prod.ext
  · apply Subtype.ext
    exact observedStep_frozen cfg ε M start (s.val,WinnerMarkLaw.firstMarkedRace hn ω) (Or.inr hs)
  · simp only [goodObservedRestartStep,augResidualBoard,hs,or_true,if_true]

theorem sourceRestrictGood_restart {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ) (hδ : 0≤δ)
    (hn : 0<n) (s : GoodObservation cfg) (ω : BoardClockPath n)
    (hcut : augAdvance cfg ε M (augTimedInput cfg s.val.1,(WinnerMarkLaw.firstMarkedRace hn ω).1.1)<s.val.1.val.2-δ) :
    goodObservedRestartStep cfg ε M (start-δ) hn (sourceRestrictGood cfg δ hδ s,ω)=
      (sourceRestrictGood cfg δ hδ (goodObservedRestartStep cfg ε M start hn (s,ω)).1,
        (goodObservedRestartStep cfg ε M start hn (s,ω)).2) := by
  apply Prod.ext
  · exact sourceRestrictGood_step cfg ε M start δ hδ s (WinnerMarkLaw.firstMarkedRace hn ω) hcut
  · exact sourceRestrictState_residualBoard cfg ε M δ hδ hn s.val.1 ω hcut

theorem sourceRestrictGood_restart_of_stopped {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ) (hδ : 0≤δ)
    (hn : 0<n) (s : GoodObservation cfg) (ω : BoardClockPath n)
    (hs : s.val.1.val.1.physical.process.stopped=true) :
    goodObservedRestartStep cfg ε M (start-δ) hn (sourceRestrictGood cfg δ hδ s,ω)=
      (sourceRestrictGood cfg δ hδ (goodObservedRestartStep cfg ε M start hn (s,ω)).1,
        (goodObservedRestartStep cfg ε M start hn (s,ω)).2) := by
  rw [goodObservedRestartStep_stopped cfg ε M start hn s ω hs,
    goodObservedRestartStep_stopped cfg ε M (start-δ) hn (sourceRestrictGood cfg δ hδ s) ω hs]

end BirthWitness
end NoThreeLine

#print axioms NoThreeLine.sourceCap_residualBoard
#print axioms NoThreeLine.BirthWitness.sourceRestrictGood_restart
