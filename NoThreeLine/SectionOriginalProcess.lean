import NoThreeLine.ScheduledSectionHeightSmall

/-! Exact original-process interpretation of the line-section maximum.
The observer's physical state, birth records and actual residual board are
all projected, before evaluating the same executed-segment event. -/
set_option autoImplicit false
set_option maxHeartbeats 1800000
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines

def phaseObservedStepPair {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0<n) (s : PhaseObservation n B)
    (N k : ℕ) (ω : BoardClockPath n) : TimedObservation (cs N).config × BoardClockPath n :=
  observedRecycledPair (cs N).config ε M (phaseEndpoint cs start N) hn
    (observedPhaseStart (cs N).config ε M (observedRecycledPhaseState cs ε M deadline start hn s N ω))
    k (observedRecycledPhases cs ε M deadline start hn s N ω).2

theorem phaseSection_step_actual_pair {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (A : ℝ) (hn : 0<n) (s : GoodPhaseLineSection n B p)
    (N k : ℕ) (ω : BoardClockPath n) :
    let v := RecycledBoardProcess.iterate
      (goodMarkedRestart (cs N).config ε M (phaseEndpoint cs start N) L p E A hn)
      (goodPhaseSectionStart (cs N).config ε M p
        (phaseSectionRecycledState cs ε M deadline start L p E A hn s N ω)) k
      (phaseSectionRecycledPair cs ε M deadline start L p E A hn s N ω).2
    (v.1.val.1.1,v.2)=phaseObservedStepPair cs ε M deadline start hn s.val.1 N k ω := by
  dsimp only
  rw [goodMarkedIterate_actual_pair]
  have hs : (goodPhaseSectionStart (cs N).config ε M p
      (phaseSectionRecycledState cs ε M deadline start L p E A hn s N ω)).val.1.1 =
        observedPhaseStart (cs N).config ε M
          (observedRecycledPhaseState cs ε M deadline start hn s.val.1 N ω) := by
    change (phaseLineSectionStart _ _ _ _ _).1.1=_
    rw [phaseLineSectionStart_projection,phaseSectionRecycledState_actual]
  have hr := congrArg Prod.snd (phaseSectionRecycledPair_projection cs ε M deadline start L p E A hn s N ω)
  rw [hs,hr]
  rfl

theorem scheduledSectionAllTimeAt_actual {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (A : ℝ) (hn : 0<n) (s : GoodPhaseLineSection n B p)
    (N k : ℕ) (ω : BoardClockPath n) :
    scheduledSectionAllTimeAt cs ε M deadline start L p E A hn s N k ω ↔
      lineSectionAllTimeExceedance (cs N).config ε M L p E A
        ((phaseObservedStepPair cs ε M deadline start hn s.val.1 N k ω).1,
          WinnerMarkLaw.firstMarkedRace hn (phaseObservedStepPair cs ε M deadline start hn s.val.1 N k ω).2) := by
  have h := congrArg (fun x : TimedObservation (cs N).config × BoardClockPath n =>
    lineSectionAllTimeExceedance (cs N).config ε M L p E A (x.1,WinnerMarkLaw.firstMarkedRace hn x.2))
      (phaseSection_step_actual_pair cs ε M deadline start L p E A hn s N k ω)
  exact iff_of_eq h

theorem scheduledSectionRawAt_actual {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (A : ℝ) (hn : 0<n) (s : GoodPhaseLineSection n B p)
    (N k : ℕ) (ω : BoardClockPath n) :
    scheduledSectionRawAt cs ε M deadline start L p E A hn s N k ω ↔
      lineSectionRawExceedance (cs N).config ε M (phaseEndpoint cs start N) L p E A
        ((phaseObservedStepPair cs ε M deadline start hn s.val.1 N k ω).1,
          WinnerMarkLaw.firstMarkedRace hn (phaseObservedStepPair cs ε M deadline start hn s.val.1 N k ω).2) := by
  have h := congrArg (fun x : TimedObservation (cs N).config × BoardClockPath n =>
    lineSectionRawExceedance (cs N).config ε M (phaseEndpoint cs start N) L p E A (x.1,WinnerMarkLaw.firstMarkedRace hn x.2))
      (phaseSection_step_actual_pair cs ε M deadline start L p E A hn s N k ω)
  exact iff_of_eq h

theorem finiteCellMaximum_complement_actual {n R : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (Γ : Finset ZPoint) (p : Grid n) (cells : Fin R → Finset (Grid n)) (δ : ℝ)
    (hn : 0<n) (hB : 1≤B) (J : ℕ) (ω : BoardClockPath n)
    (hgood : ω∉scheduledFiniteCellMaximumBefore cs ε M deadline start Γ p cells δ hn hB J)
    (i : Fin R) (L : FiniteDirections.RootBoardLineIndex p) (hL : ¬specified Γ L.val)
    (N k : ℕ) (hN : N<J) :
    ¬lineSectionAllTimeExceedance (cs N).config ε M L.val p (cells i)
      ((((L.val.val∩cells i).erase p).card:ℝ)+δ*(n:ℝ))
      ((phaseObservedStepPair cs ε M deadline start hn
          (initialGoodPhaseObservation B hB deadline start).val N k ω).1,
        WinnerMarkLaw.firstMarkedRace hn (phaseObservedStepPair cs ε M deadline start hn
          (initialGoodPhaseObservation B hB deadline start).val N k ω).2) := by
  intro hx
  apply hgood
  apply Set.mem_iUnion.mpr
  refine ⟨i,?_⟩
  apply Set.mem_iUnion.mpr
  refine ⟨L,?_⟩
  simp only [if_neg hL]
  refine ⟨N,hN,k,Or.inl ?_⟩
  exact (scheduledSectionAllTimeAt_actual cs ε M deadline start L.val p (cells i) _ hn
    (initialPhaseSection B hB p deadline start) N k ω).mpr hx

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.phaseSection_step_actual_pair
#print axioms NoThreeLine.BirthWitness.finiteCellMaximum_complement_actual
