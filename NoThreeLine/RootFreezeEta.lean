import NoThreeLine.RootFreezePointLaw
import NoThreeLine.CutEtaFloor

/-! The eta floor holds in the whole frozen snapshot, including the
postgeometry/pre-resolution boundary. Resolution does not change eta;
the actual and saved coordinates are propagated together on every path. -/
set_option autoImplicit false
noncomputable section

namespace NoThreeLine.BirthWitness

theorem rawStepSaved_eta {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (x : TimedObservation cfg × CandidateData n) :
    (rawStepSaved cfg ε M start x).1.eta=(observedStep cfg ε M start x).1.val.1.eta := by
  by_cases hx : observationDone cfg x.1
  · rw [rawStepSaved_done cfg ε M start x hx,observedStep_frozen cfg ε M start x hx]
    rfl
  · rw [rawStepSaved_resolved cfg ε M start x hx,AugmentedState.resolve_eta]

theorem rootObserverStep_eta_lower {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (s : RootObservation cfg) (z : CandidateData n)
    (a b : Grid n) (hab : a≠b) (hactual : 1-ε≤s.1.1.val.1.eta a b)
    (hsaved : 1-ε≤s.2.2.1.eta a b) :
    1-ε≤(rootObserverStep cfg ε M start p (s,z)).1.1.val.1.eta a b ∧
      1-ε≤(rootObserverStep cfg ε M start p (s,z)).2.2.1.eta a b := by
  have hn : 1-ε≤(observedStep cfg ε M start (s.1,z)).1.val.1.eta a b :=
    augTimedStep_eta_lower cfg ε M s.1.1 z a b hab hactual
  constructor
  · rw [rootObserverStep_projection]
    exact hn
  · dsimp only [rootObserverStep]
    split_ifs
    · exact hsaved
    · rw [rawStepSaved_eta]
      exact hn
    · exact hn

theorem rootObserverRecycledPair_eta_lower {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (s : RootObservation cfg) (a b : Grid n) (hab : a≠b)
    (hactual : 1-ε≤s.1.1.val.1.eta a b) (hsaved : 1-ε≤s.2.2.1.eta a b)
    (k : ℕ) (ω : BoardClockPath n) :
    1-ε≤(rootObserverRecycledPair cfg ε M start p hn s k ω).1.1.1.val.1.eta a b ∧
      1-ε≤(rootObserverRecycledPair cfg ε M start p hn s k ω).1.2.2.1.eta a b := by
  induction k with
  | zero => exact ⟨hactual,hsaved⟩
  | succ k ih => exact rootObserverStep_eta_lower cfg ε M start p _ _ a b hab ih.1 ih.2

theorem rootBoundaryWitness_eta_lower {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (p : Grid n) (hn : 0<n) (s : RootObservation cfg)
    (a b : Grid n) (hab : a≠b) (hactual : 1-ε≤s.1.1.val.1.eta a b)
    (hsaved : 1-ε≤s.2.2.1.eta a b) (ω : BoardClockPath n) :
    1-ε≤(rootBoundaryWitness cfg ε M start e p hn s ω).augmented.eta a b :=
  (rootObserverRecycledPair_eta_lower cfg ε M start p hn s a b hab hactual hsaved _ ω).2

theorem rootBoundaryWitness_etaProduct_floor {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (p : Grid n) (hn : 0<n) (s : RootObservation cfg) (L : Finset (Grid n))
    (hε : ε≤1) (hactual : ∀a∈L,∀b∈L,a≠b→1-ε≤s.1.1.val.1.eta a b)
    (hsaved : ∀a∈L,∀b∈L,a≠b→1-ε≤s.2.2.1.eta a b) (ω : BoardClockPath n) :
    (1-ε)^L.card.choose 2≤EtaPairProduct.etaProduct L
      (rootBoundaryWitness cfg ε M start e p hn s ω).augmented.eta :=
  EtaPairProduct.etaProduct_floor L _ ε hε
    (fun a ha b hb hab=>rootBoundaryWitness_eta_lower cfg ε M start e p hn s a b hab
      (hactual a ha b hb hab) (hsaved a ha b hb hab) ω)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.rawStepSaved_eta
#print axioms NoThreeLine.BirthWitness.rootBoundaryWitness_eta_lower
#print axioms NoThreeLine.BirthWitness.rootBoundaryWitness_etaProduct_floor
