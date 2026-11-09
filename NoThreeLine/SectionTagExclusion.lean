import NoThreeLine.SectionScheduledRawCredit
import NoThreeLine.BoundaryCauseKinds
import NoThreeLine.ScheduledCutCreditOneSub

/-! An actual newTag cause forces a C22 section exceedance whenever the
real discrete schedule input has the stated strict deterministic margin.
The margin is explicit; no concrete G5 certificate is asserted here. -/
set_option autoImplicit false
set_option maxHeartbeats 2200000
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines FiniteDirections

theorem phaseObservedStepPair_physical {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n)
    (s : PhaseObservation n B) (N k : ℕ) (ω : BoardClockPath n) :
    ((phaseObservedStepPair cs ε M deadline start hn s N k ω).1.1,
      (phaseObservedStepPair cs ε M deadline start hn s N k ω).2) =
      augRecycledPair (cs N).config ε M hn
        (augPhaseStart (cs N).config ε M (recycledPhaseState cs ε M deadline start hn s.1 N ω))
        k (recycledPhases cs ε M deadline start hn s.1 N ω).2 := by
  unfold phaseObservedStepPair
  rw [observedRecycledPair_base]
  change augRecycledPair (cs N).config ε M hn
    (augPhaseStart (cs N).config ε M (observedRecycledPhaseState cs ε M deadline start hn s N ω).1)
    k (observedRecycledPhases cs ε M deadline start hn s N ω).2 = _
  rw [observedRecycledPhaseState_base,congrArg Prod.snd (observedRecycledPhases_base cs ε M deadline start hn s N ω)]

theorem initial_tagCauseBefore_subset_cellMaximum {n J : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (p : Grid n) (δ ρ : ℝ) (hδ : 0≤δ)
    (hΓ : ∀j,(cs j).directions=Γ) (hρ : ∀j<J,(cs j).rho≤ρ)
    (hmask : ∀j<J,∀q,(cs j).mask q=0 ∨ (cs j).mask q=1)
    (hgap : ∀L:RootBoardLineIndex p,¬specified Γ L.val → sectionScheduleBudget cs L.val p δ J<1-ρ) :
    scheduledBoundaryCauseBefore cs ε M deadline start hn (augInitialState B hB deadline start) p .tag J ⊆
      scheduledFiniteCellMaximumBefore cs ε M deadline start Γ p
        (fun j:Fin J=>binaryMaskSupport (cs j.val).mask) δ hn hB J := by
  classical
  rintro ω ⟨N,hN,k,hcause⟩
  by_contra hgood
  let s := (initialGoodPhaseObservation B hB deadline start).val
  let x := phaseObservedStepPair cs ε M deadline start hn s N k ω
  have hbase := phaseObservedStepPair_physical cs ε M deadline start hn s N k ω
  have he := congrArg (fun y : AugTimedState (cs N).config × BoardClockPath n =>
    rawBoundaryCauseHit (cs N).config ε M p .tag (y.1,WinnerMarkLaw.firstMarkedRace hn y.2)) hbase
  have hc : rawBoundaryCauseHit (cs N).config ε M p .tag (x.1.1,WinnerMarkLaw.firstMarkedRace hn x.2) :=
    (iff_of_eq he).mpr hcause
  have hd : ¬observationDone (cs N).config x.1 := by
    intro h
    exact hc.1 ((birthDone_iff (cs N).config x.1.1).mp h)
  have hpold : (x.1.1.val.1.physical.process.accounts p).status=.active :=
    (ProcessState.mem_activeEvents _ p).mp (augRawOutcome_active_subset (cs N).config ε M _
      ((ProcessState.mem_activeEvents _ p).mpr hc.2.1))
  have hopen : ¬phaseRootClosed p (observedTimedProjection (cs N).config x.1) := by
    rintro (hstop | hi)
    · exact hd (Or.inr hstop)
    · exact hi hpold
  obtain ⟨L,hnew,hpL⟩ := hc.2.2
  have hnew' : (¬specified (cs N).directions L ∧
      occupancy (augRawOutcome (cs N).config ε M (augTimedInput (cs N).config x.1.1,
        WinnerMarkLaw.firstMarkedRace hn x.2)).physical.process L=1 ∧
      (augRawOutcome (cs N).config ε M (augTimedInput (cs N).config x.1.1,
        WinnerMarkLaw.firstMarkedRace hn x.2)).physical.lineCredits L≤(cs N).rho) ∧
      L∉(augRawOutcome (cs N).config ε M (augTimedInput (cs N).config x.1.1,
        WinnerMarkLaw.firstMarkedRace hn x.2)).physical.handled := by
    simpa only [newTags,triggeredTags,Finset.mem_sdiff,Finset.mem_filter,Finset.mem_univ,true_and] using hnew
  have hL : ¬specified Γ L := by simpa only [hΓ N] using hnew'.1.1
  have hall (j : ℕ) (hj : j≤N) (l : ℕ) :
      ¬lineSectionAllTimeExceedance (cs j).config ε M L p (binaryMaskSupport (cs j).mask)
        ((((L.val∩binaryMaskSupport (cs j).mask).erase p).card:ℝ)+δ*(n:ℝ))
        ((phaseObservedStepPair cs ε M deadline start hn s j l ω).1,
          WinnerMarkLaw.firstMarkedRace hn (phaseObservedStepPair cs ε M deadline start hn s j l ω).2) := by
    exact finiteCellMaximum_complement_actual cs ε M deadline start Γ p
      (fun j:Fin J=>binaryMaskSupport (cs j.val).mask) δ hn hB J ω hgood
      ⟨j,hj.trans_lt hN⟩ ⟨L,hpL⟩ hL j l (hj.trans_lt hN)
  have hb := observedPhases_raw_section_credit_budget cs ε M deadline start hn (zero_le_one.trans hB)
    L p hpL δ hδ s ω N k J hN (fun j hj=>hmask j (hj.trans_lt hN)) hd hopen hall
  have hi : s.1.val.physical.lineCredits L=1 := initialGoodPhaseObservation_lineCredits B hB deadline start L
  change s.1.val.physical.lineCredits L-
    (augRawOutcome (cs N).config ε M (augTimedInput (cs N).config x.1.1,
      WinnerMarkLaw.firstMarkedRace hn x.2)).physical.lineCredits L ≤ sectionScheduleBudget cs L p δ J at hb
  rw [hi] at hb
  have hg := hgap ⟨L,hpL⟩ hL
  have hr := hnew'.1.2.2.trans (hρ N hN)
  linarith

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.phaseObservedStepPair_physical
#print axioms NoThreeLine.BirthWitness.initial_tagCauseBefore_subset_cellMaximum
