import NoThreeLine.SectionPhaseCredit

/-! The original all-phase line-credit decrement through an actual raw
boundary is bounded by the real finite schedule input plus section and
self-rate errors. No completion or newTag rarity is assumed. -/
set_option autoImplicit false
set_option maxHeartbeats 1800000
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines

def sectionScheduleBudget {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (L : LineIndex n) (p : Grid n) (δ : ℝ) (J : ℕ) : ℝ :=
  ∑j∈Finset.range J,(cs j).horizon*(binaryLineInputRate (cs j).mask L p+δ+B/n)

theorem sectionScheduleBudget_mono {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (L : LineIndex n) (p : Grid n) (δ : ℝ) (hδ : 0≤δ) (hB : 0≤B) :
    Monotone (sectionScheduleBudget cs L p δ) := by
  intro i j hij
  apply Finset.sum_le_sum_of_subset_of_nonneg (Finset.range_mono hij)
  intro k _ _
  exact mul_nonneg (cs k).horizon.coe_nonneg (add_nonneg
    (add_nonneg (binaryLineInputRate_nonneg _ (cs k).mask_nonneg L p) hδ)
      (div_nonneg hB (Nat.cast_nonneg n)))

theorem observedRecycledPair_rootClosed_from_initial {n : ℕ} (cfg : FlowConfig n)
    (ε M start : ℝ) (p : Grid n) (hn : 0<n) (s : TimedObservation cfg)
    (hs : phaseRootClosed p (observedTimedProjection cfg s)) (k : ℕ) (ω : BoardClockPath n) :
    phaseRootClosed p (observedTimedProjection cfg (observedRecycledPair cfg ε M start hn s k ω).1) := by
  induction k with
  | zero => exact hs
  | succ k ih => exact observedStep_permanentRootClosed cfg ε M start p _ _ ih

theorem phaseObservedStepPair_open_initial {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (p : Grid n)
    (s : PhaseObservation n B) (N k : ℕ) (ω : BoardClockPath n)
    (hopen : ¬phaseRootClosed p (observedTimedProjection (cs N).config
      (phaseObservedStepPair cs ε M deadline start hn s N k ω).1)) :
    ¬phaseRootClosed p (observedRecycledPhaseState cs ε M deadline start hn s N ω) := by
  intro hs
  exact hopen (observedRecycledPair_rootClosed_from_initial (cs N).config ε M
    (phaseEndpoint cs start N) p hn (observedPhaseStart (cs N).config ε M
      (observedRecycledPhaseState cs ε M deadline start hn s N ω)) hs k _)

theorem observedPhases_raw_section_credit_budget {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 0≤B) (L : LineIndex n) (p : Grid n) (hpL : p∈L.val)
    (δ : ℝ) (hδ : 0≤δ) (s : PhaseObservation n B) (ω : BoardClockPath n) (N k J : ℕ) (hNJ : N<J)
    (hmask : ∀j≤N,∀q,(cs j).mask q=0 ∨ (cs j).mask q=1)
    (hd : ¬observationDone (cs N).config (phaseObservedStepPair cs ε M deadline start hn s N k ω).1)
    (hopen : ¬phaseRootClosed p (observedTimedProjection (cs N).config
      (phaseObservedStepPair cs ε M deadline start hn s N k ω).1))
    (hgood : ∀j≤N,∀l,¬lineSectionAllTimeExceedance (cs j).config ε M L p (binaryMaskSupport (cs j).mask)
      ((((L.val∩binaryMaskSupport (cs j).mask).erase p).card:ℝ)+δ*(n:ℝ))
      ((phaseObservedStepPair cs ε M deadline start hn s j l ω).1,
       WinnerMarkLaw.firstMarkedRace hn (phaseObservedStepPair cs ε M deadline start hn s j l ω).2)) :
    let x := phaseObservedStepPair cs ε M deadline start hn s N k ω
    s.1.val.physical.lineCredits L -
      (augRawOutcome (cs N).config ε M (augTimedInput (cs N).config x.1.1,
        WinnerMarkLaw.firstMarkedRace hn x.2)).physical.lineCredits L ≤ sectionScheduleBudget cs L p δ J := by
  let sj := observedRecycledPhaseState cs ε M deadline start hn s N ω
  let ωj := (observedRecycledPhases cs ε M deadline start hn s N ω).2
  have hi := observedPhases_section_credit_budget cs ε M deadline start hn hB L p hpL δ hδ s ω N
    (fun j hj=>hmask j hj.le) (phaseObservedStepPair_open_initial cs ε M deadline start hn p s N k ω hopen)
    (fun j hj=>hgood j hj.le)
  have hs := observedRecycled_raw_credit_budget (cs N).config ε M (phaseEndpoint cs start N) hn hB
    (hmask N le_rfl) L p hpL δ hδ (observedPhaseStart (cs N).config ε M sj) ωj k hd hopen
      (fun l _=>hgood N le_rfl l)
  have hbound : s.1.val.physical.lineCredits L -
      (augRawOutcome (cs N).config ε M (augTimedInput (cs N).config
        (phaseObservedStepPair cs ε M deadline start hn s N k ω).1.1,
        WinnerMarkLaw.firstMarkedRace hn (phaseObservedStepPair cs ε M deadline start hn s N k ω).2)).physical.lineCredits L ≤
        sectionScheduleBudget cs L p δ (N+1) := by
    rw [sectionScheduleBudget,Finset.sum_range_succ]
    change s.1.val.physical.lineCredits L-sj.1.val.physical.lineCredits L≤_ at hi
    change sj.1.val.physical.lineCredits L-
      (augRawOutcome (cs N).config ε M (augTimedInput (cs N).config
        (phaseObservedStepPair cs ε M deadline start hn s N k ω).1.1,
        WinnerMarkLaw.firstMarkedRace hn (phaseObservedStepPair cs ε M deadline start hn s N k ω).2)).physical.lineCredits L ≤
      (cs N).horizon*(binaryLineInputRate (cs N).mask L p+δ+B/n) at hs
    linarith
  exact hbound.trans (sectionScheduleBudget_mono cs L p δ hδ hB (by omega))

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.phaseObservedStepPair_open_initial
#print axioms NoThreeLine.BirthWitness.observedPhases_raw_section_credit_budget
