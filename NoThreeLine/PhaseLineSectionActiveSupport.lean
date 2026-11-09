import NoThreeLine.PhaseLineSectionInitial
import NoThreeLine.LineSectionActiveSupport

/-! An initially active root has zero saved credit on inactive additional
snapshots throughout the original finite phases. This uses pre-resolution
raw snapshots and keeps the original deadline retirement. -/
set_option autoImplicit false
set_option maxHeartbeats 1400000
noncomputable section

namespace NoThreeLine.BirthWitness
open AuxiliaryODE
attribute [local instance] Classical.propDecidable

theorem phaseLineSectionBoundary_active_support {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (deadline : Grid n → ℝ) (t : ℝ) (s : GoodMarkedLineSection cfg p)
    (hp : SectionSavedActiveSupport p s.val.1.2.2) :
    SectionSavedActiveSupport p (goodPhaseSectionBoundary cfg p deadline t s).val.2.2 := by
  have he : SectionSavedActiveSupport p (phaseLineSectionEnd cfg p s.val).2.2 := by
    dsimp only [phaseLineSectionEnd]
    split_ifs with hc
    · exact hp
    · intro hi
      exact False.elim (hc (Or.inr (Or.inr hi)))
  let u := phaseLineSectionEnd cfg p s.val
  have hu : PhaseLineSectionInvariant p u := phaseLineSectionEnd_invariant cfg p s.val s.property.1
  change SectionSavedActiveSupport p (phaseLineSectionDeadline p deadline t u).2.2
  dsimp only [phaseLineSectionDeadline]
  split_ifs with hf hc
  · exact he
  · intro hi
    exact False.elim (hu.open_root (Bool.eq_false_iff.mpr hf) (Or.inr hi))
  · intro hi
    exact False.elim (hc (Or.inr hi))

theorem phaseSectionScheduledPair_active_support {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) (j : ℕ)
    (x : GoodPhaseLineSection n B p × BoardClockPath n)
    (hp : SectionSavedActiveSupport p x.1.val.2.2) :
    SectionSavedActiveSupport p (phaseSectionScheduledPair cs ε M deadline start L p E A hn j x).1.val.2.2 := by
  have hs : SectionSavedActiveSupport p (goodPhaseSectionStart (cs j).config ε M p x.1).val.1.2.2 := by
    change SectionSavedActiveSupport p (phaseLineSectionStart (cs j).config ε M p x.1.val).1.2.2
    rw [phaseLineSectionStart_saved _ _ _ _ _ x.1.property.1]
    exact hp
  exact phaseLineSectionBoundary_active_support (cs j).config p deadline (phaseEndpoint cs start (j+1))
    (markedSectionTerminalPair (cs j).config ε M (phaseEndpoint cs start j) L p E A hn
      (goodPhaseSectionStart (cs j).config ε M p x.1,x.2)).1
    (markedSectionTerminal_active_support (cs j).config ε M (phaseEndpoint cs start j) L p E A hn _ hs x.2)

theorem phaseSectionRecycledState_active_support {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) (s : GoodPhaseLineSection n B p)
    (hp : SectionSavedActiveSupport p s.val.2.2) (k : ℕ) (ω : BoardClockPath n) :
    SectionSavedActiveSupport p (phaseSectionRecycledState cs ε M deadline start L p E A hn s k ω).val.2.2 := by
  induction k with
  | zero => exact hp
  | succ k ih =>
    rw [phaseSectionRecycledState_succ]
    exact phaseSectionScheduledPair_active_support cs ε M deadline start L p E A hn k _ ih

theorem initial_phaseSection_inactive_credit_zero {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) (hB : 1 ≤ B)
    (hp : ((augInitialState B hB deadline start).val.physical.process.accounts p).status = .active)
    (k : ℕ) (ω : BoardClockPath n) :
    SectionSavedActiveSupport p (phaseSectionRecycledState cs ε M deadline start L p E A hn
      (initialPhaseSection B hB p deadline start) k ω).val.2.2 :=
  phaseSectionRecycledState_active_support cs ε M deadline start L p E A hn
    (initialPhaseSection B hB p deadline start) (fun hi => False.elim (hi hp)) k ω

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.phaseLineSectionBoundary_active_support
#print axioms NoThreeLine.BirthWitness.initial_phaseSection_inactive_credit_zero
