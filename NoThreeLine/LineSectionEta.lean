import NoThreeLine.LineSectionTerminal
import NoThreeLine.CutEtaFloor

/-! Actual eta floors survive the additional cap and the stored mass-hit
snapshot. No eta lower bound is assumed on a future snapshot. -/
set_option autoImplicit false
noncomputable section

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

theorem lineSectionRawSnapshot_eta_lower {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (s : TimedObservation cfg) (z : CandidateData n) (a b : Grid n) (hab : a ≠ b)
    (hinit : 1-ε ≤ s.1.val.1.eta a b) :
    1-ε ≤ (lineSectionRawSnapshot cfg ε M L p E A (s,z)).eta a b := by
  by_cases hd : observationDone cfg s
  · simpa only [lineSectionRawSnapshot,if_pos hd] using hinit
  · have h := augOutcome_eta_lower cfg ε M (lineSectionInput cfg L p E A s.1)
      s.1.property.1.1 a b hab hinit z
    simpa only [lineSectionRawSnapshot,if_neg hd,augOutcome,AugmentedState.resolve_eta] using h

theorem lineSectionObserverStep_eta_lower {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (s : LineSectionObservation cfg) (z : CandidateData n) (a b : Grid n) (hab : a ≠ b)
    (hactual : 1-ε ≤ s.1.1.val.1.eta a b) (hsaved : 1-ε ≤ s.2.2.eta a b) :
    1-ε ≤ (lineSectionObserverStep cfg ε M start L p E A (s,z)).1.1.val.1.eta a b ∧
      1-ε ≤ (lineSectionObserverStep cfg ε M start L p E A (s,z)).2.2.eta a b := by
  have hn := augTimedStep_eta_lower cfg ε M s.1.1 z a b hab hactual
  constructor
  · rw [lineSectionObserverStep_projection]
    exact hn
  · unfold lineSectionObserverStep
    split_ifs
    · exact hsaved
    · exact lineSectionRawSnapshot_eta_lower cfg ε M L p E A s.1 z a b hab hactual
    · exact hn

theorem goodLineSectionRecycled_eta_lower {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (s : GoodLineSectionObservation cfg p) (a b : Grid n) (hab : a ≠ b)
    (hactual : 1-ε ≤ s.val.1.1.val.1.eta a b) (hsaved : 1-ε ≤ s.val.2.2.eta a b)
    (k : ℕ) (ω : BoardClockPath n) :
    1-ε ≤ (RecycledBoardProcess.state (goodLineSectionRestart cfg ε M start L p E A hn) s k ω).val.1.1.val.1.eta a b ∧
      1-ε ≤ (RecycledBoardProcess.state (goodLineSectionRestart cfg ε M start L p E A hn) s k ω).val.2.2.eta a b := by
  induction k with
  | zero => exact ⟨hactual,hsaved⟩
  | succ k ih => exact lineSectionObserverStep_eta_lower cfg ε M start L p E A _ _ a b hab ih.1 ih.2

theorem lineSectionTerminal_etaProduct_floor {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (s : GoodLineSectionObservation cfg p) (labels : Finset (Grid n)) (hε : ε ≤ 1)
    (hactual : ∀ a ∈ labels, ∀ b ∈ labels, a ≠ b → 1-ε ≤ s.val.1.1.val.1.eta a b)
    (hsaved : ∀ a ∈ labels, ∀ b ∈ labels, a ≠ b → 1-ε ≤ s.val.2.2.eta a b)
    (ω : BoardClockPath n) :
    (1-ε)^labels.card.choose 2 ≤ EtaPairProduct.etaProduct labels
      (lineSectionTerminal cfg ε M start L p E A hn s ω).val.2.2.eta :=
  EtaPairProduct.etaProduct_floor labels _ ε hε (fun a ha b hb hab =>
    (goodLineSectionRecycled_eta_lower cfg ε M start L p E A hn s a b hab
      (hactual a ha b hb hab) (hsaved a ha b hb hab) _ ω).2)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.lineSectionRawSnapshot_eta_lower
#print axioms NoThreeLine.BirthWitness.lineSectionTerminal_etaProduct_floor
