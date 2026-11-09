import NoThreeLine.SourceCutMeasurable
import NoThreeLine.EtaPairProduct

/-! The actual original-board iteration, including every same-board cut,
retains the eta floor. This is a pathwise inherited invariant, not a moment
or high-probability assumption. -/
set_option autoImplicit false
noncomputable section
open scoped NNReal

namespace NoThreeLine

theorem augRecycledPair_eta_lower {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0<n)
    (s : AugTimedState cfg) (a b : Grid n) (hab : a≠b) (hinit : 1-ε≤s.val.1.eta a b)
    (k : ℕ) (ω : BoardClockPath n) :
    1-ε≤(augRecycledPair cfg ε M hn s k ω).1.val.1.eta a b := by
  induction k with
  | zero => exact hinit
  | succ k ih =>
    exact augTimedStep_eta_lower cfg ε M (augRecycledPair cfg ε M hn s k ω).1
      (WinnerMarkLaw.firstMarkedRace hn (augRecycledPair cfg ε M hn s k ω).2) a b hab ih

theorem augRecycledTerminal_eta_lower {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0<n)
    (s : AugTimedState cfg) (a b : Grid n) (hab : a≠b) (hinit : 1-ε≤s.val.1.eta a b)
    (ω : BoardClockPath n) : 1-ε≤(augRecycledTerminal cfg ε M hn s ω).val.1.eta a b :=
  augRecycledPair_eta_lower cfg ε M hn s a b hab hinit _ ω

namespace BirthWitness

theorem sourceCutTerminal_eta_lower {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (hn : 0<n) (s : GoodObservation cfg) (δ : ℝ≥0) (a b : Grid n) (hab : a≠b)
    (hinit : 1-ε≤s.val.1.val.1.eta a b) (ω : BoardClockPath n) :
    1-ε≤(sourceCutTerminal cfg ε M start δ δ.coe_nonneg hn s ω).1.val.1.eta a b := by
  rw [sourceCutTerminal_base]
  exact augRecycledTerminal_eta_lower cfg ε M hn (sourceRestrictState cfg δ δ.coe_nonneg s.val.1)
    a b hab hinit ω

theorem sourceCutTerminal_etaProduct_floor {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (hn : 0<n) (s : GoodObservation cfg) (δ : ℝ≥0) (L : Finset (Grid n))
    (hε : ε≤1) (hinit : ∀a∈L,∀b∈L,a≠b→1-ε≤s.val.1.val.1.eta a b) (ω : BoardClockPath n) :
    (1-ε)^L.card.choose 2≤EtaPairProduct.etaProduct L
      (sourceCutTerminal cfg ε M start δ δ.coe_nonneg hn s ω).1.val.1.eta :=
  EtaPairProduct.etaProduct_floor L _ ε hε
    (fun a ha b hb hab=>sourceCutTerminal_eta_lower cfg ε M start hn s δ a b hab (hinit a ha b hb hab) ω)

end BirthWitness
end NoThreeLine

#print axioms NoThreeLine.augRecycledTerminal_eta_lower
#print axioms NoThreeLine.BirthWitness.sourceCutTerminal_etaProduct_floor
