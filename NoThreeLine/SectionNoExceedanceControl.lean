import NoThreeLine.LineSectionStepControl

/-! Deterministic no-exceedance induction through all original steps and
phase deadlines. Zero advances cannot manufacture a new upper mass value. -/
set_option autoImplicit false
set_option maxHeartbeats 1900000
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

theorem goodMarkedIterate_massControlled {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (s : GoodMarkedLineSection cfg p) (ω : BoardClockPath n)
    (hs : TimedSectionMassControlled cfg L p E A s.val.1.1)
    (hno : ∀ k, ¬markedSectionContinuousAt cfg ε M start L p E A hn k (s,ω)) :
    ∀ k, TimedSectionMassControlled cfg L p E A
      (RecycledBoardProcess.iterate (goodMarkedRestart cfg ε M start L p E A hn) s k ω).1.val.1.1 := by
  intro k
  induction k with
  | zero => exact hs
  | succ k ih =>
    change TimedSectionMassControlled cfg L p E A (lineSectionObserverStep cfg ε M start L p E A _).1
    rw [lineSectionObserverStep_projection]
    exact observedStep_sectionMassControlled cfg ε M start L p E A _ _ ih (hno k)

theorem markedSectionTerminal_massControlled {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (s : GoodMarkedLineSection cfg p) (ω : BoardClockPath n)
    (hs : TimedSectionMassControlled cfg L p E A s.val.1.1)
    (hno : ∀ k, ¬markedSectionContinuousAt cfg ε M start L p E A hn k (s,ω)) :
    TimedSectionMassControlled cfg L p E A
      (markedSectionTerminalPair cfg ε M start L p E A hn (s,ω)).1.val.1.1 :=
  goodMarkedIterate_massControlled cfg ε M start L p E A hn s ω hs hno _

def PhaseSectionMassControlled {n : ℕ} {B : ℝ} (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (A : ℝ) (s : PhaseObservation n B) : Prop :=
  phaseRootClosed p s ∨ actualLineSectionMass L p E s.1.val ≤ A

theorem observedDeadline_massControlled {n : ℕ} {B : ℝ}
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (deadline : Grid n → ℝ) (t : ℝ) (s : PhaseObservation n B)
    (hs : PhaseSectionMassControlled L p E A s) :
    PhaseSectionMassControlled L p E A (observedDeadline deadline t s) := by
  rcases hs with hc | hb
  · exact Or.inl (observedDeadline_rootClosed deadline t s p hc)
  · exact Or.inr ((observedDeadline_lineSectionMass_le L p E deadline t s).trans hb)

theorem phaseSectionScheduledPair_massControlled {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (N : ℕ) (s : GoodPhaseLineSection n B p) (ω : BoardClockPath n)
    (hs : PhaseSectionMassControlled L p E A s.val.1)
    (hno : ∀ k, ¬markedSectionContinuousAt (cs N).config ε M (phaseEndpoint cs start N) L p E A hn k
      (goodPhaseSectionStart (cs N).config ε M p s,ω)) :
    PhaseSectionMassControlled L p E A (phaseSectionScheduledPair cs ε M deadline start L p E A hn N (s,ω)).1.val.1 := by
  have hstart : TimedSectionMassControlled (cs N).config L p E A
      (goodPhaseSectionStart (cs N).config ε M p s).val.1.1 := by
    change TimedSectionMassControlled (cs N).config L p E A
      (phaseLineSectionStart (cs N).config ε M p s.val).1.1
    rw [phaseLineSectionStart_projection]
    exact hs
  have ht := markedSectionTerminal_massControlled (cs N).config ε M (phaseEndpoint cs start N) L p E A hn
    (goodPhaseSectionStart (cs N).config ε M p s) ω hstart hno
  change PhaseSectionMassControlled L p E A (phaseLineSectionBoundary _ _ _ _ _).1
  rw [phaseLineSectionBoundary_projection]
  exact observedDeadline_massControlled L p E A deadline (phaseEndpoint cs start (N+1)) _ ht

theorem phaseSectionRecycledState_massControlled {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (s : GoodPhaseLineSection n B p) (ω : BoardClockPath n)
    (hs : PhaseSectionMassControlled L p E A s.val.1) (J : ℕ)
    (hno : ω ∉ scheduledSectionContinuousBefore cs ε M deadline start L p E A hn s J) :
    PhaseSectionMassControlled L p E A (phaseSectionRecycledState cs ε M deadline start L p E A hn s J ω).val.1 := by
  induction J with
  | zero => exact hs
  | succ J ih =>
    have hi := ih (fun ⟨N,hN,k,hk⟩ => hno ⟨N,hN.trans (Nat.lt_succ_self J),k,hk⟩)
    rw [phaseSectionRecycledState_succ]
    apply phaseSectionScheduledPair_massControlled cs ε M deadline start L p E A hn J _ _ hi
    intro k hk
    exact hno ⟨J,Nat.lt_succ_self J,k,hk⟩

theorem initialPhaseSection_massControlled {n : ℕ} (B : ℝ) (hB : 1 ≤ B)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hA : (((L.val ∩ E).erase p).card:ℝ) ≤ A) :
    PhaseSectionMassControlled L p E A (initialPhaseSection B hB p deadline start).val.1 := by
  right
  change actualLineSectionMass L p E (augInitialState B hB deadline start).val ≤ A
  have hi : (augInitialState B hB deadline start).val.Valid 1 :=
    (augValidDeadlineRetirement deadline start ⟨AugmentedState.initial n,AugmentedState.initial_valid n 1 le_rfl⟩).property
  have hh := (actualLineSectionMass_bounds L p E (augInitialState B hB deadline start).val 1 zero_le_one hi).2
  rw [one_mul] at hh
  exact hh.trans hA

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.markedSectionTerminal_massControlled
#print axioms NoThreeLine.BirthWitness.phaseSectionRecycledState_massControlled
#print axioms NoThreeLine.BirthWitness.initialPhaseSection_massControlled
