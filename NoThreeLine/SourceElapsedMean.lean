import NoThreeLine.SourceCutExpectation

/-! Calendar parametrization and integrability of actual mixed cut means.
The cutoff amount is clamped only outside the intended elapsed interval. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped BigOperators NNReal

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

def elapsedCutAmount (R t : ℝ) : ℝ≥0 := ⟨max 0 (R-t),le_max_left _ _⟩

theorem elapsedCutAmount_measurable (R : ℝ) : Measurable (elapsedCutAmount R) :=
  (measurable_const.max (measurable_const.sub measurable_id)).subtype_mk

theorem elapsedCutAmount_coe (R t : ℝ) (ht : t≤R) : (elapsedCutAmount R t:ℝ)=R-t :=
  max_eq_right (sub_nonneg.mpr ht)

def elapsedMixedMean {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (s : GoodObservation cfg) (t : ℝ) : ℝ :=
  cutMixedMean cfg ε M start e C D L hn s (elapsedCutAmount s.val.1.val.2 t)

theorem elapsedMixedMean_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B) (s : GoodObservation cfg) :
    Measurable (elapsedMixedMean cfg ε M start e C D L hn s) :=
  (cutMixedMean_measurable cfg ε M start e C D L hn hB s).comp (elapsedCutAmount_measurable _)

theorem elapsedMixedMean_bounds {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B) (s : GoodObservation cfg) (t : ℝ) :
    0≤elapsedMixedMean cfg ε M start e C D L hn s t ∧
      elapsedMixedMean cfg ε M start e C D L hn s t≤mixedCap C cfg.B :=
  cutMixedMean_bounds cfg ε M start e C D L hn hB s _

def elapsedSourceCoefficient {n : ℕ} (cfg : FlowConfig n) (start : ℝ) (e : Retention n)
    (s : GoodObservation cfg) (q : Grid n) (t : ℝ) : ℝ :=
  (cfg.mask q*e.value q (observationTime cfg start s.val.1+t)/n)*
    max 1 (protection 1 cfg.K)^cfg.directions.card

theorem elapsedSourceCoefficient_measurable {n : ℕ} (cfg : FlowConfig n) (start : ℝ) (e : Retention n)
    (s : GoodObservation cfg) (q : Grid n) : Measurable (elapsedSourceCoefficient cfg start e s q) :=
  ((((e.measurable_value q).comp (measurable_const.add measurable_id)).const_mul (cfg.mask q)).div_const n).mul_const _

theorem elapsedSourceCoefficient_bounds {n : ℕ} (cfg : FlowConfig n) (start : ℝ) (e : Retention n)
    (s : GoodObservation cfg) (hm : ∀q,cfg.mask q≤1) (q : Grid n) (t : ℝ) :
    0≤elapsedSourceCoefficient cfg start e s q t ∧
      elapsedSourceCoefficient cfg start e s q t≤(1/n)*max 1 (protection 1 cfg.K)^cfg.directions.card := by
  have hA : 0≤max 1 (protection 1 cfg.K)^cfg.directions.card :=
    pow_nonneg (le_trans zero_le_one (le_max_left _ _)) _
  constructor
  · exact mul_nonneg (div_nonneg (mul_nonneg (cfg.mask_nonneg q) (e.bounds q _).1) (Nat.cast_nonneg n)) hA
  · apply mul_le_mul_of_nonneg_right _ hA
    apply div_le_div_of_nonneg_right _ (Nat.cast_nonneg n)
    nlinarith [cfg.mask_nonneg q,hm q,(e.bounds q (observationTime cfg start s.val.1+t)).1,
      (e.bounds q (observationTime cfg start s.val.1+t)).2]

def elapsedHierarchyMean {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (s : GoodObservation cfg) (t : ℝ) : ℝ :=
  ∑q∈D,elapsedSourceCoefficient cfg start e s q t*
    elapsedMixedMean cfg ε M start e (insert q C) (D.erase q) L hn s t

theorem elapsedHierarchyMean_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B) (s : GoodObservation cfg) :
    Measurable (elapsedHierarchyMean cfg ε M start e C D L hn s) :=
  Finset.measurable_sum _ (fun q _=>(elapsedSourceCoefficient_measurable cfg start e s q).mul
    (elapsedMixedMean_measurable cfg ε M start e (insert q C) (D.erase q) L hn hB s))

theorem elapsedHierarchyMean_bounds {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B) (s : GoodObservation cfg)
    (hm : ∀q,cfg.mask q≤1) (t : ℝ) :
    0≤elapsedHierarchyMean cfg ε M start e C D L hn s t ∧
      elapsedHierarchyMean cfg ε M start e C D L hn s t≤sourceCap cfg.directions C D cfg.B cfg.K := by
  have hA : 0≤(1/n)*max 1 (protection 1 cfg.K)^cfg.directions.card :=
    mul_nonneg (div_nonneg zero_le_one (Nat.cast_nonneg n))
      (pow_nonneg (le_trans zero_le_one (le_max_left _ _)) _)
  constructor
  · exact Finset.sum_nonneg (fun q _=>mul_nonneg (elapsedSourceCoefficient_bounds cfg start e s hm q t).1
      (elapsedMixedMean_bounds cfg ε M start e (insert q C) (D.erase q) L hn hB s t).1)
  · exact Finset.sum_le_sum (fun q _=>mul_le_mul (elapsedSourceCoefficient_bounds cfg start e s hm q t).2
      (elapsedMixedMean_bounds cfg ε M start e (insert q C) (D.erase q) L hn hB s t).2
      (elapsedMixedMean_bounds cfg ε M start e (insert q C) (D.erase q) L hn hB s t).1 hA)

theorem elapsedHierarchyMean_intervalIntegrable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B) (s : GoodObservation cfg)
    (hm : ∀q,cfg.mask q≤1) (a b : ℝ) :
    IntervalIntegrable (elapsedHierarchyMean cfg ε M start e C D L hn s) volume a b := by
  rw [intervalIntegrable_iff,uIoc]
  exact integrableOn_of_nonneg_bound volume (Ioc (min a b) (max a b)) measurableSet_Ioc _
    (elapsedHierarchyMean_measurable cfg ε M start e C D L hn hB s) _
    (fun t _=>elapsedHierarchyMean_bounds cfg ε M start e C D L hn hB s hm t)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.elapsedMixedMean_measurable
#print axioms NoThreeLine.BirthWitness.elapsedHierarchyMean_intervalIntegrable
