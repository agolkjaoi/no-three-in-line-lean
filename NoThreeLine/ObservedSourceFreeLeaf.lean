import NoThreeLine.CutRootLeafPoint

/-! D-empty leaf observables are bounded on every typed timed observation,
even without assuming consistency of unused birth records. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
open scoped NNReal
namespace NoThreeLine.BirthWitness
open EtaPairProduct

def observedRootLeaf {n : ℕ} (cfg : FlowConfig n) (C : Finset (Grid n)) (p : Grid n)
    (v : TimedObservation cfg) : ℝ := rootLeafPhi cfg.directions C p v.1.val.1.physical

def observedCorrectedRootLeaf {n : ℕ} (cfg : FlowConfig n) (C L : Finset (Grid n)) (p : Grid n)
    (v : TimedObservation cfg) : ℝ := etaProduct L v.1.val.1.eta*observedRootLeaf cfg C p v

theorem observedRootLeaf_measurable {n : ℕ} (cfg : FlowConfig n) (C : Finset (Grid n)) (p : Grid n) :
    Measurable (observedRootLeaf cfg C p) :=
  (rootLeafPhi_measurable cfg.directions C p).comp ((AugmentedState.measurable_physical n).comp
    (measurable_subtype_coe.comp measurable_fst).fst)

theorem observedCorrectedRootLeaf_measurable {n : ℕ} (cfg : FlowConfig n)
    (C L : Finset (Grid n)) (p : Grid n) : Measurable (observedCorrectedRootLeaf cfg C L p) :=
  ((etaProduct_measurable L).comp ((AugmentedState.measurable_eta n).comp
    (measurable_subtype_coe.comp measurable_fst).fst)).mul (observedRootLeaf_measurable cfg C p)

theorem observedRootLeaf_bounds {n : ℕ} (cfg : FlowConfig n) (C : Finset (Grid n)) (p : Grid n)
    (v : TimedObservation cfg) : 0≤observedRootLeaf cfg C p v ∧ observedRootLeaf cfg C p v≤rootLeafCap C p cfg.B :=
  rootLeafPhi_bounds cfg.directions C p _ cfg.B v.1.property.1.1

theorem observedCorrectedRootLeaf_bounds {n : ℕ} (cfg : FlowConfig n) (C L : Finset (Grid n))
    (p : Grid n) (v : TimedObservation cfg) :
    0≤observedCorrectedRootLeaf cfg C L p v ∧ observedCorrectedRootLeaf cfg C L p v≤rootLeafCap C p cfg.B := by
  have hη0 := etaProduct_nonneg L v.1.val.1.eta (fun q r=>(v.1.property.1.2 q r).1)
  have hη1 : etaProduct L v.1.val.1.eta≤1 := Finset.prod_le_one
    (fun q _=>(v.1.property.1.2 q.1 q.2).1) (fun q _=>(v.1.property.1.2 q.1 q.2).2)
  have hh := observedRootLeaf_bounds cfg C p v
  exact ⟨mul_nonneg hη0 hh.1,(mul_le_mul_of_nonneg_right hη1 hh.1).trans (by simpa using hh.2)⟩

theorem cutRootLeaf_empty_eq {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C : Finset (Grid n)) (p : Grid n) (hn : 0<n) (s : GoodObservation cfg)
    (x : ℝ≥0×BoardClockPath n) :
    cutRootLeaf cfg ε M start e C ∅ p hn s x=
      observedRootLeaf cfg C p (sourceCutTerminal cfg ε M start x.1 x.1.coe_nonneg hn s x.2) := by
  simp [cutRootLeaf,rootLeafWitness,witnessProduct,observedWitness,observedRootLeaf]

theorem cutCorrectedRootLeaf_empty_eq {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C L : Finset (Grid n)) (p : Grid n) (hn : 0<n) (s : GoodObservation cfg)
    (x : ℝ≥0×BoardClockPath n) :
    cutCorrectedRootLeaf cfg ε M start e C ∅ L p hn s x=
      observedCorrectedRootLeaf cfg C L p (sourceCutTerminal cfg ε M start x.1 x.1.coe_nonneg hn s x.2) := by
  simp [cutCorrectedRootLeaf,correctedRootLeafWitness,rootLeafWitness,witnessProduct,
    observedWitness,observedRootLeaf,observedCorrectedRootLeaf]

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.observedRootLeaf_bounds
#print axioms NoThreeLine.BirthWitness.cutCorrectedRootLeaf_empty_eq
