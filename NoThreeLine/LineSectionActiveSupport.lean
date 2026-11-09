import NoThreeLine.MarkedLineSectionTerminal
import NoThreeLine.RootFreezeActiveSupport

/-! Inactive roots in additionally frozen snapshots have zero credit if
the initial saved state has that property. Raw snapshots precede positive
resolution; interior contact snapshots keep the actual active status. -/
set_option autoImplicit false
set_option maxHeartbeats 1400000
noncomputable section

namespace NoThreeLine.BirthWitness
open AuxiliaryODE
attribute [local instance] Classical.propDecidable

def SectionSavedActiveSupport {n : ℕ} (p : Grid n) (a : AugmentedState n) : Prop :=
  (a.physical.process.accounts p).status ≠ .active → (a.physical.process.accounts p).credit = 0

theorem lineSectionRawSnapshot_active_support {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (s : TimedObservation cfg) (z : CandidateData n)
    (hp : (s.1.val.1.physical.process.accounts p).status = .active) :
    SectionSavedActiveSupport p (lineSectionRawSnapshot cfg ε M L p E A (s,z)) := by
  intro hi
  by_cases hd : observationDone cfg s
  · simp only [lineSectionRawSnapshot,if_pos hd] at hi
    exact False.elim (hi hp)
  · simp only [lineSectionRawSnapshot,if_neg hd] at hi ⊢
    exact augRawOutcome_inactive_credit_zero_of_active cfg ε M (lineSectionInput cfg L p E A s.1) p z hp hi

theorem lineSectionObserverStep_active_support {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (s : LineSectionObservation cfg) (z : CandidateData n) (hs : LineSectionInvariant cfg p s)
    (hp : SectionSavedActiveSupport p s.2.2) :
    SectionSavedActiveSupport p (lineSectionObserverStep cfg ε M start L p E A (s,z)).2.2 := by
  by_cases hf : s.2.1 = true
  · simpa only [lineSectionObserverStep,if_pos hf] using hp
  · have ha : (s.1.1.val.1.physical.process.accounts p).status = .active := by
      by_contra hi
      exact hs.open_root (Bool.eq_false_iff.mpr hf) (Or.inr hi)
    by_cases hc : lineSectionStepClose cfg ε M start L p E A (s.1,z)
    · simp only [lineSectionObserverStep,if_neg hf,if_pos hc]
      exact lineSectionRawSnapshot_active_support cfg ε M L p E A s.1 z ha
    · simp only [lineSectionObserverStep,if_neg hf,if_neg hc]
      intro hi
      exact False.elim (hc (Or.inl (Or.inr hi)))

theorem goodLineSectionRecycled_active_support {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (s : GoodLineSectionObservation cfg p) (hp : SectionSavedActiveSupport p s.val.2.2)
    (k : ℕ) (ω : BoardClockPath n) :
    SectionSavedActiveSupport p
      (RecycledBoardProcess.state (goodLineSectionRestart cfg ε M start L p E A hn) s k ω).val.2.2 := by
  induction k with
  | zero => exact hp
  | succ k ih =>
    exact lineSectionObserverStep_active_support cfg ε M start L p E A _ _
      (RecycledBoardProcess.state (goodLineSectionRestart cfg ε M start L p E A hn) s k ω).property.1 ih

theorem markedSectionTerminal_active_support {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (s : GoodMarkedLineSection cfg p) (hp : SectionSavedActiveSupport p s.val.1.2.2) (ω : BoardClockPath n) :
    SectionSavedActiveSupport p (markedSectionTerminalPair cfg ε M start L p E A hn (s,ω)).1.val.1.2.2 := by
  have he := congrArg (fun r : GoodLineSectionObservation cfg p × BoardClockPath n => r.1.val.2.2)
    (markedSectionTerminalPair_core cfg ε M start L p E A hn (s,ω))
  change (markedSectionTerminalPair cfg ε M start L p E A hn (s,ω)).1.val.1.2.2 =
    (lineSectionTerminal cfg ε M start L p E A hn (goodMarkedCore cfg p s) ω).val.2.2 at he
  rw [he]
  exact goodLineSectionRecycled_active_support cfg ε M start L p E A hn (goodMarkedCore cfg p s) hp _ ω

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.lineSectionRawSnapshot_active_support
#print axioms NoThreeLine.BirthWitness.markedSectionTerminal_active_support
