import NoThreeLine.PhaseLineSectionProcess

/-! Permanent contact/root closure retains the same augmented snapshot
through every later original step and phase. Artificial horizons do not
enter this premise. Completion is not needed for an already marked state. -/
set_option autoImplicit false
set_option maxHeartbeats 1400000
noncomputable section

namespace NoThreeLine.BirthWitness
open AuxiliaryODE
attribute [local instance] Classical.propDecidable

theorem goodMarkedStep_permanent {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (s : GoodMarkedLineSection cfg p) (z : CandidateData n) (hm : s.val.2 = true) :
    (goodMarkedStep cfg ε M start L p E A (s,z)).val.2 = true ∧
      (goodMarkedStep cfg ε M start L p E A (s,z)).val.1.2.2 = s.val.1.2.2 := by
  constructor
  · simp only [goodMarkedStep,markedLineSectionStep,hm,true_or,if_true]
  · exact congrArg Prod.snd (lineSectionObserverStep_preserves_frozen cfg ε M start L p E A
      (s.val.1,z) (s.property.1.contact_closed hm))

theorem goodMarkedIterate_permanent {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (s : GoodMarkedLineSection cfg p) (ω : BoardClockPath n) (k : ℕ)
    (hm : (RecycledBoardProcess.iterate (goodMarkedRestart cfg ε M start L p E A hn) s k ω).1.val.2 = true) :
    ∀ j, k ≤ j →
      (RecycledBoardProcess.iterate (goodMarkedRestart cfg ε M start L p E A hn) s j ω).1.val.2 = true ∧
      (RecycledBoardProcess.iterate (goodMarkedRestart cfg ε M start L p E A hn) s j ω).1.val.1.2.2 =
        (RecycledBoardProcess.iterate (goodMarkedRestart cfg ε M start L p E A hn) s k ω).1.val.1.2.2 := by
  intro j hj
  induction j,hj using Nat.le_induction with
  | base => exact ⟨hm,rfl⟩
  | succ j hj ih =>
    have ht := goodMarkedStep_permanent cfg ε M start L p E A
      (RecycledBoardProcess.iterate (goodMarkedRestart cfg ε M start L p E A hn) s j ω).1
      (WinnerMarkLaw.firstMarkedRace hn
        (RecycledBoardProcess.iterate (goodMarkedRestart cfg ε M start L p E A hn) s j ω).2) ih.1
    exact ⟨ht.1,ht.2.trans ih.2⟩

theorem markedSectionTerminal_permanent {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (s : GoodMarkedLineSection cfg p) (ω : BoardClockPath n) (hm : s.val.2 = true) :
    (markedSectionTerminalPair cfg ε M start L p E A hn (s,ω)).1.val.2 = true ∧
      (markedSectionTerminalPair cfg ε M start L p E A hn (s,ω)).1.val.1.2.2 = s.val.1.2.2 :=
  goodMarkedIterate_permanent cfg ε M start L p E A hn s ω 0 hm _ (Nat.zero_le _)

theorem phaseSectionScheduledPair_permanent {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) (j : ℕ)
    (x : GoodPhaseLineSection n B p × BoardClockPath n) (hf : x.1.val.2.1 = true) :
    (phaseSectionScheduledPair cs ε M deadline start L p E A hn j x).1.val.2.1 = true ∧
      (phaseSectionScheduledPair cs ε M deadline start L p E A hn j x).1.val.2.2 = x.1.val.2.2 := by
  let s := goodPhaseSectionStart (cs j).config ε M p x.1
  have hs : s.val.2 = true := by simp only [s,goodPhaseSectionStart,phaseLineSectionStart,if_pos hf]
  have ht := markedSectionTerminal_permanent (cs j).config ε M (phaseEndpoint cs start j)
    L p E A hn s x.2 hs
  let r := markedSectionTerminalPair (cs j).config ε M (phaseEndpoint cs start j) L p E A hn (s,x.2)
  have hr : r.1.val.2 = true := ht.1
  have he : (phaseLineSectionEnd (cs j).config p r.1.val).2 = (true,r.1.val.1.2.2) := by
    simp only [phaseLineSectionEnd,hr,true_or,if_true]
  change (phaseLineSectionBoundary (cs j).config p deadline (phaseEndpoint cs start (j+1)) r.1.val).2.1 = true ∧
    (phaseLineSectionBoundary (cs j).config p deadline (phaseEndpoint cs start (j+1)) r.1.val).2.2 = x.1.val.2.2
  simp only [phaseLineSectionBoundary,phaseLineSectionDeadline,he,if_true]
  constructor
  · trivial
  · exact ht.2.trans (phaseLineSectionStart_saved (cs j).config ε M p x.1.val x.1.property.1)

theorem phaseSectionRecycledState_permanent {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) (s : GoodPhaseLineSection n B p)
    (ω : BoardClockPath n) (k : ℕ)
    (hf : (phaseSectionRecycledState cs ε M deadline start L p E A hn s k ω).val.2.1 = true) :
    ∀ j, k ≤ j →
      (phaseSectionRecycledState cs ε M deadline start L p E A hn s j ω).val.2.1 = true ∧
      (phaseSectionRecycledState cs ε M deadline start L p E A hn s j ω).val.2.2 =
        (phaseSectionRecycledState cs ε M deadline start L p E A hn s k ω).val.2.2 := by
  intro j hj
  induction j,hj using Nat.le_induction with
  | base => exact ⟨hf,rfl⟩
  | succ j hj ih =>
    rw [phaseSectionRecycledState_succ]
    have h := phaseSectionScheduledPair_permanent cs ε M deadline start L p E A hn j
      (phaseSectionRecycledState cs ε M deadline start L p E A hn s j ω,
        (phaseSectionRecycledPair cs ε M deadline start L p E A hn s j ω).2) ih.1
    exact ⟨h.1,h.2.trans ih.2⟩

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.markedSectionTerminal_permanent
#print axioms NoThreeLine.BirthWitness.phaseSectionRecycledState_permanent
