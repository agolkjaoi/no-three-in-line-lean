import NoThreeLine.SourceRestrictedRestart

/-! Actual finite-prefix coupling on the same original board, strictly
before a fixed elapsed-time cut. It includes early global stopping. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness

theorem sourceRestrict_iterate_before {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ) (hδ : 0≤δ)
    (hn : 0<n) (s : GoodObservation cfg) (k : ℕ) (ω : BoardClockPath n)
    (hk : elapsedTime cfg ε M start hn s k ω<s.val.1.val.2-δ) :
    RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M (start-δ) hn)
      (sourceRestrictGood cfg δ hδ s) k ω=
      (sourceRestrictGood cfg δ hδ (RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M start hn) s k ω).1,
        (RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M start hn) s k ω).2) := by
  induction k with
  | zero => rfl
  | succ k ih =>
    have hk0 : elapsedTime cfg ε M start hn s k ω<s.val.1.val.2-δ :=
      (elapsedTime_monotone cfg ε M start hn s ω (Nat.le_succ k)).trans_lt hk
    change goodObservedRestartStep cfg ε M (start-δ) hn
      (RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M (start-δ) hn)
        (sourceRestrictGood cfg δ hδ s) k ω)=_
    rw [ih hk0]
    let x := RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M start hn) s k ω
    change goodObservedRestartStep cfg ε M (start-δ) hn (sourceRestrictGood cfg δ hδ x.1,x.2)=
      (sourceRestrictGood cfg δ hδ (goodObservedRestartStep cfg ε M start hn x).1,
        (goodObservedRestartStep cfg ε M start hn x).2)
    by_cases hs : x.1.val.1.val.1.physical.process.stopped=true
    · exact sourceRestrictGood_restart_of_stopped cfg ε M start δ hδ hn x.1 x.2 hs
    · have hR : 0<x.1.val.1.val.2 := by
        change s.val.1.val.2-x.1.val.1.val.2<s.val.1.val.2-δ at hk0
        linarith
      have hd : ¬observationDone cfg x.1.val := not_or.mpr ⟨not_le_of_gt hR,hs⟩
      have hgap := elapsedTime_succ_sub cfg ε M start hn s k ω
      change elapsedTime cfg ε M start hn s (k+1) ω-elapsedTime cfg ε M start hn s k ω=
        observedAdvance cfg ε M (x.1.val,WinnerMarkLaw.firstMarkedRace hn x.2) at hgap
      simp only [observedAdvance,if_neg hd] at hgap
      have he : elapsedTime cfg ε M start hn s k ω=s.val.1.val.2-x.1.val.1.val.2 := rfl
      apply sourceRestrictGood_restart cfg ε M start δ hδ hn x.1 x.2
      linarith

theorem sourceRestrict_elapsed_before {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ) (hδ : 0≤δ)
    (hn : 0<n) (s : GoodObservation cfg) (k : ℕ) (ω : BoardClockPath n)
    (hk : elapsedTime cfg ε M start hn s k ω<s.val.1.val.2-δ) :
    elapsedTime cfg ε M (start-δ) hn (sourceRestrictGood cfg δ hδ s) k ω=
      elapsedTime cfg ε M start hn s k ω := by
  have hR : δ≤s.val.1.val.2 := by linarith [(elapsedTime_mem cfg ε M start hn s k ω).1]
  have hRk : δ≤(RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M start hn) s k ω).1.val.1.val.2 := by
    unfold elapsedTime at hk
    linarith
  unfold elapsedTime
  rw [sourceRestrict_iterate_before cfg ε M start δ hδ hn s k ω hk]
  change (sourceRestrictState cfg δ hδ s.val.1).val.2-
    (sourceRestrictState cfg δ hδ
      (RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M start hn) s k ω).1.val.1).val.2=_
  rw [sourceRestrictState_remaining cfg δ hδ s.val.1 hR,sourceRestrictState_remaining cfg δ hδ _ hRk]
  ring

theorem sourceRestrict_localSource_before {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ) (hδ : 0≤δ)
    (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n) (s : GoodObservation cfg)
    (k : ℕ) (ω : BoardClockPath n) (t : ℝ)
    (hk : elapsedTime cfg ε M start hn s k ω<s.val.1.val.2-δ) :
    localSource cfg ε M (start-δ) e C D L hn (sourceRestrictGood cfg δ hδ s) k ω t=
      localSource cfg ε M start e C D L hn s k ω t := by
  have hRk : δ≤(RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M start hn) s k ω).1.val.1.val.2 := by
    unfold elapsedTime at hk
    linarith
  unfold localSource
  rw [sourceRestrict_iterate_before cfg ε M start δ hδ hn s k ω hk]
  dsimp only
  change selectedSourceSum cfg
      (augTimedInput cfg (sourceRestrictState cfg δ hδ
        (RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M start hn) s k ω).1.val.1)).1
      (recordedValue e (RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M start hn) s k ω).1.val.2)
      C D L e
      (observationTime cfg (start-δ) (sourceRestrictObservation cfg δ hδ
        (RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M start hn) s k ω).1.val).1) t=_
  rw [sourceRestrictObservation_time cfg start δ hδ _ hRk]
  rfl

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.sourceRestrict_iterate_before
#print axioms NoThreeLine.BirthWitness.sourceRestrict_localSource_before
