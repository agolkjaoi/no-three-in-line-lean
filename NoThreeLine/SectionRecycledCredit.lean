import NoThreeLine.SectionCreditIntegral
import NoThreeLine.SectionOriginalProcess

/-! On the original board, section control bounds the actual line-credit
decrement through any finite prefix, including the last raw boundary step.
Future root openness supplies past openness by the actual absorbing rule. -/
set_option autoImplicit false
set_option maxHeartbeats 1800000
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines

theorem observedRecycled_no_section_credit_budget {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (hn : 0<n) (hB : 0≤cfg.B) (hmask : ∀q,cfg.mask q=0 ∨ cfg.mask q=1)
    (L : LineIndex n) (p : Grid n) (hpL : p∈L.val) (δ : ℝ)
    (s : TimedObservation cfg) (ω : BoardClockPath n) (k : ℕ)
    (hopen : ¬phaseRootClosed p (observedTimedProjection cfg (observedRecycledPair cfg ε M start hn s k ω).1))
    (hgood : ∀j<k,¬lineSectionAllTimeExceedance cfg ε M L p (binaryMaskSupport cfg.mask)
      ((((L.val∩binaryMaskSupport cfg.mask).erase p).card:ℝ)+δ*(n:ℝ))
      ((observedRecycledPair cfg ε M start hn s j ω).1,
        WinnerMarkLaw.firstMarkedRace hn (observedRecycledPair cfg ε M start hn s j ω).2)) :
    s.1.val.1.physical.lineCredits L -
        (observedRecycledPair cfg ε M start hn s k ω).1.1.val.1.physical.lineCredits L ≤
      (s.1.val.2-(observedRecycledPair cfg ε M start hn s k ω).1.1.val.2)*
        (binaryLineInputRate cfg.mask L p+δ+cfg.B/n) := by
  induction k with
  | zero => simp [observedRecycledPair,RecycledBoardProcess.iterate]
  | succ k ih =>
    let sk := (observedRecycledPair cfg ε M start hn s k ω).1
    let zk := WinnerMarkLaw.firstMarkedRace hn (observedRecycledPair cfg ε M start hn s k ω).2
    have hpold : ¬phaseRootClosed p (observedTimedProjection cfg sk) := by
      intro hc
      exact hopen (observedStep_permanentRootClosed cfg ε M start p sk zk hc)
    have hi := ih hpold (fun j hj=>hgood j (by omega))
    have hs := observed_step_no_section_exceedance_credit_budget cfg ε M hn hB hmask L p hpL δ
      (sk,zk) hpold (hgood k (by omega))
    rw [augTimedLineLoss_eq,birthElapsed_eq_remaining_drop] at hs
    change s.1.val.1.physical.lineCredits L-sk.1.val.1.physical.lineCredits L ≤
      (s.1.val.2-sk.1.val.2)*(binaryLineInputRate cfg.mask L p+δ+cfg.B/n) at hi
    change sk.1.val.1.physical.lineCredits L-(augTimedStep cfg ε M (sk.1,zk)).val.1.physical.lineCredits L ≤
      (sk.1.val.2-(augTimedStep cfg ε M (sk.1,zk)).val.2)*(binaryLineInputRate cfg.mask L p+δ+cfg.B/n) at hs
    change s.1.val.1.physical.lineCredits L-(augTimedStep cfg ε M (sk.1,zk)).val.1.physical.lineCredits L ≤
      (s.1.val.2-(augTimedStep cfg ε M (sk.1,zk)).val.2)*(binaryLineInputRate cfg.mask L p+δ+cfg.B/n)
    nlinarith

theorem observedRecycled_through_step_credit_budget {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (hn : 0<n) (hB : 0≤cfg.B) (hmask : ∀q,cfg.mask q=0 ∨ cfg.mask q=1)
    (L : LineIndex n) (p : Grid n) (hpL : p∈L.val) (δ : ℝ) (hδ : 0≤δ)
    (s : TimedObservation cfg) (ω : BoardClockPath n) (k : ℕ)
    (hopen : ¬phaseRootClosed p (observedTimedProjection cfg (observedRecycledPair cfg ε M start hn s k ω).1))
    (hgood : ∀j≤k,¬lineSectionAllTimeExceedance cfg ε M L p (binaryMaskSupport cfg.mask)
      ((((L.val∩binaryMaskSupport cfg.mask).erase p).card:ℝ)+δ*(n:ℝ))
      ((observedRecycledPair cfg ε M start hn s j ω).1,
        WinnerMarkLaw.firstMarkedRace hn (observedRecycledPair cfg ε M start hn s j ω).2)) :
    s.1.val.1.physical.lineCredits L -
        (observedRecycledPair cfg ε M start hn s (k+1) ω).1.1.val.1.physical.lineCredits L ≤
      s.1.val.2*(binaryLineInputRate cfg.mask L p+δ+cfg.B/n) := by
  let sk := (observedRecycledPair cfg ε M start hn s k ω).1
  let zk := WinnerMarkLaw.firstMarkedRace hn (observedRecycledPair cfg ε M start hn s k ω).2
  have hi := observedRecycled_no_section_credit_budget cfg ε M start hn hB hmask L p hpL δ s ω k hopen
    (fun j hj=>hgood j hj.le)
  have hs := observed_step_no_section_exceedance_credit_budget cfg ε M hn hB hmask L p hpL δ
    (sk,zk) hopen (hgood k le_rfl)
  rw [augTimedLineLoss_eq,birthElapsed_eq_remaining_drop] at hs
  have hc : 0≤binaryLineInputRate cfg.mask L p+δ+cfg.B/n := add_nonneg
    (add_nonneg (binaryLineInputRate_nonneg cfg.mask cfg.mask_nonneg L p) hδ)
      (div_nonneg hB (Nat.cast_nonneg n))
  have hr := (augTimedStep cfg ε M (sk.1,zk)).property.2.1
  change s.1.val.1.physical.lineCredits L-sk.1.val.1.physical.lineCredits L ≤
    (s.1.val.2-sk.1.val.2)*(binaryLineInputRate cfg.mask L p+δ+cfg.B/n) at hi
  change sk.1.val.1.physical.lineCredits L-(augTimedStep cfg ε M (sk.1,zk)).val.1.physical.lineCredits L ≤
    (sk.1.val.2-(augTimedStep cfg ε M (sk.1,zk)).val.2)*(binaryLineInputRate cfg.mask L p+δ+cfg.B/n) at hs
  change s.1.val.1.physical.lineCredits L-(augTimedStep cfg ε M (sk.1,zk)).val.1.physical.lineCredits L ≤
    s.1.val.2*(binaryLineInputRate cfg.mask L p+δ+cfg.B/n)
  nlinarith [mul_nonneg hr hc]

theorem observedRecycled_raw_credit_budget {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (hn : 0<n) (hB : 0≤cfg.B) (hmask : ∀q,cfg.mask q=0 ∨ cfg.mask q=1)
    (L : LineIndex n) (p : Grid n) (hpL : p∈L.val) (δ : ℝ) (hδ : 0≤δ)
    (s : TimedObservation cfg) (ω : BoardClockPath n) (k : ℕ)
    (hd : ¬observationDone cfg (observedRecycledPair cfg ε M start hn s k ω).1)
    (hopen : ¬phaseRootClosed p (observedTimedProjection cfg (observedRecycledPair cfg ε M start hn s k ω).1))
    (hgood : ∀j≤k,¬lineSectionAllTimeExceedance cfg ε M L p (binaryMaskSupport cfg.mask)
      ((((L.val∩binaryMaskSupport cfg.mask).erase p).card:ℝ)+δ*(n:ℝ))
      ((observedRecycledPair cfg ε M start hn s j ω).1,
        WinnerMarkLaw.firstMarkedRace hn (observedRecycledPair cfg ε M start hn s j ω).2)) :
    let x := observedRecycledPair cfg ε M start hn s k ω
    s.1.val.1.physical.lineCredits L -
      (augRawOutcome cfg ε M (augTimedInput cfg x.1.1,WinnerMarkLaw.firstMarkedRace hn x.2)).physical.lineCredits L ≤
      s.1.val.2*(binaryLineInputRate cfg.mask L p+δ+cfg.B/n) := by
  let x := observedRecycledPair cfg ε M start hn s k ω
  have h := observedRecycled_through_step_credit_budget cfg ε M start hn hB hmask L p hpL δ hδ s ω k hopen hgood
  change ¬(x.1.1.val.2≤0 ∨ x.1.1.val.1.physical.process.stopped=true) at hd
  have hr : (observedRecycledPair cfg ε M start hn s (k+1) ω).1.1.val.1.physical.lineCredits L =
      (augRawOutcome cfg ε M (augTimedInput cfg x.1.1,WinnerMarkLaw.firstMarkedRace hn x.2)).physical.lineCredits L := by
    change (augTimedStepPair cfg ε M (x.1.1,WinnerMarkLaw.firstMarkedRace hn x.2)).1.physical.lineCredits L=_
    rw [augTimedStepPair,if_neg hd]
    exact congrFun (AugmentedState.resolve_lineCredits _ _ _ _ _ _ _) L
  rw [hr] at h
  exact h

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.observedRecycled_no_section_credit_budget
#print axioms NoThreeLine.BirthWitness.observedRecycled_raw_credit_budget
