import NoThreeLine.PhaseLineSectionInitial
import NoThreeLine.LineSectionEta

/-! Actual and additionally saved eta floors propagate together through
all original phases, artificial reopenings and original deadline retirements. -/
set_option autoImplicit false
set_option maxHeartbeats 1400000
noncomputable section

namespace NoThreeLine.BirthWitness
open AuxiliaryODE
attribute [local instance] Classical.propDecidable

def PhaseSectionEtaLower {n : ℕ} {B : ℝ} (ε : ℝ) (a b : Grid n)
    (s : PhaseLineSectionObservation n B) : Prop :=
  1-ε ≤ s.1.1.val.eta a b ∧ 1-ε ≤ s.2.2.eta a b

theorem phaseLineSectionBoundary_eta_lower {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (deadline : Grid n → ℝ) (t ε : ℝ) (a b : Grid n) (s : MarkedLineSectionObservation cfg)
    (ha : 1-ε ≤ s.1.1.1.val.1.eta a b) (hs : 1-ε ≤ s.1.2.2.eta a b) :
    PhaseSectionEtaLower ε a b (phaseLineSectionBoundary cfg p deadline t s) := by
  have he : PhaseSectionEtaLower ε a b (phaseLineSectionEnd cfg p s) := by
    dsimp only [phaseLineSectionEnd]
    split_ifs
    · exact ⟨ha,hs⟩
    · exact ⟨ha,ha⟩
  let u := phaseLineSectionEnd cfg p s
  have hd : 1-ε ≤ (observedDeadline deadline t u.1).1.val.eta a b := by
    change 1-ε ≤ (augValidDeadlineRetirement deadline t u.1.1).val.eta a b
    rw [augValidDeadlineRetirement_eta]
    exact he.1
  change PhaseSectionEtaLower ε a b (phaseLineSectionDeadline p deadline t u)
  dsimp only [phaseLineSectionDeadline]
  split_ifs
  · exact ⟨hd,he.2⟩
  · exact ⟨hd,he.1⟩
  · exact ⟨hd,hd⟩

theorem markedSectionTerminal_eta_lower {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (s : GoodMarkedLineSection cfg p) (a b : Grid n) (hab : a ≠ b)
    (ha : 1-ε ≤ s.val.1.1.1.val.1.eta a b) (hs : 1-ε ≤ s.val.1.2.2.eta a b) (ω : BoardClockPath n) :
    1-ε ≤ (markedSectionTerminalPair cfg ε M start L p E A hn (s,ω)).1.val.1.1.1.val.1.eta a b ∧
      1-ε ≤ (markedSectionTerminalPair cfg ε M start L p E A hn (s,ω)).1.val.1.2.2.eta a b := by
  have hp := congrArg (fun r : GoodLineSectionObservation cfg p × BoardClockPath n => r.1.val)
    (markedSectionTerminalPair_core cfg ε M start L p E A hn (s,ω))
  change (markedSectionTerminalPair cfg ε M start L p E A hn (s,ω)).1.val.1 =
    (lineSectionTerminal cfg ε M start L p E A hn (goodMarkedCore cfg p s) ω).val at hp
  rw [hp]
  exact goodLineSectionRecycled_eta_lower cfg ε M start L p E A hn (goodMarkedCore cfg p s)
    a b hab ha hs _ ω

theorem phaseSectionScheduledPair_eta_lower {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) (j : ℕ)
    (x : GoodPhaseLineSection n B p × BoardClockPath n) (a b : Grid n) (hab : a ≠ b)
    (hη : PhaseSectionEtaLower ε a b x.1.val) :
    PhaseSectionEtaLower ε a b (phaseSectionScheduledPair cs ε M deadline start L p E A hn j x).1.val := by
  let s := goodPhaseSectionStart (cs j).config ε M p x.1
  have ha : 1-ε ≤ s.val.1.1.1.val.1.eta a b := by
    change 1-ε ≤ (phaseLineSectionStart (cs j).config ε M p x.1.val).1.1.1.val.1.eta a b
    rw [phaseLineSectionStart_projection]
    exact hη.1
  have hs : 1-ε ≤ s.val.1.2.2.eta a b := by
    change 1-ε ≤ (phaseLineSectionStart (cs j).config ε M p x.1.val).1.2.2.eta a b
    rw [phaseLineSectionStart_saved _ _ _ _ _ x.1.property.1]
    exact hη.2
  have ht := markedSectionTerminal_eta_lower (cs j).config ε M (phaseEndpoint cs start j)
    L p E A hn s a b hab ha hs x.2
  exact phaseLineSectionBoundary_eta_lower (cs j).config p deadline (phaseEndpoint cs start (j+1)) ε a b
    (markedSectionTerminalPair (cs j).config ε M (phaseEndpoint cs start j) L p E A hn (s,x.2)).1.val ht.1 ht.2

theorem phaseSectionRecycledState_eta_lower {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) (s : GoodPhaseLineSection n B p)
    (a b : Grid n) (hab : a ≠ b) (hη : PhaseSectionEtaLower ε a b s.val) (k : ℕ) (ω : BoardClockPath n) :
    PhaseSectionEtaLower ε a b (phaseSectionRecycledState cs ε M deadline start L p E A hn s k ω).val := by
  induction k with
  | zero => exact hη
  | succ k ih =>
    rw [phaseSectionRecycledState_succ]
    exact phaseSectionScheduledPair_eta_lower cs ε M deadline start L p E A hn k _ a b hab ih

theorem initial_phaseSection_etaProduct_floor {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) (hB : 1 ≤ B) (labels : Finset (Grid n))
    (hε0 : 0 ≤ ε) (hε : ε ≤ 1) (k : ℕ) (ω : BoardClockPath n) :
    (1-ε)^labels.card.choose 2 ≤ EtaPairProduct.etaProduct labels
      (phaseSectionRecycledState cs ε M deadline start L p E A hn
        (initialPhaseSection B hB p deadline start) k ω).val.2.2.eta := by
  apply EtaPairProduct.etaProduct_floor labels _ ε hε
  intro a _ b _ hab
  apply (phaseSectionRecycledState_eta_lower cs ε M deadline start L p E A hn
    (initialPhaseSection B hB p deadline start) a b hab _ k ω).2
  have hi : 1-ε ≤ (augInitialState B hB deadline start).val.eta a b := by
    rw [augInitialState_eta]
    linarith
  exact ⟨hi,hi⟩

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.phaseSectionRecycledState_eta_lower
#print axioms NoThreeLine.BirthWitness.initial_phaseSection_etaProduct_floor
