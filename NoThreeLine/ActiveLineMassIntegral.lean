import NoThreeLine.ActiveRootLineMass

/-! Finite integration rules for actual active-root line mass and bounded
nonnegative history tests. Eta correction can only decrease a physical leaf. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines

theorem observedRootLeaf_mul_integrable {n : ℕ} {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsFiniteMeasure μ] (cfg : FlowConfig n) (C : Finset (Grid n)) (p : Grid n)
    (V : Ω → TimedObservation cfg) (hV : Measurable V)
    (F : Ω → ℝ) (hF : Measurable F) (A : ℝ) (hFA : ∀ ω, 0 ≤ F ω ∧ F ω ≤ A) :
    Integrable (fun ω => observedRootLeaf cfg C p (V ω)*F ω) μ :=
  GenericCreditIteration.bounded_nonnegative_integrable μ _
    (((observedRootLeaf_measurable cfg C p).comp hV).mul hF) (rootLeafCap C p cfg.B*A)
    (fun ω => ⟨mul_nonneg (observedRootLeaf_bounds cfg C p (V ω)).1 (hFA ω).1,
      mul_le_mul (observedRootLeaf_bounds cfg C p (V ω)).2 (hFA ω).2 (hFA ω).1
        (rootLeafCap_nonneg C p cfg.B)⟩)

theorem observedActiveLineMass_mul_integral_eq_sum {n : ℕ} {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsFiniteMeasure μ] (cfg : FlowConfig n) (L : LineIndex n)
    (hL : ¬specified cfg.directions L) (p : Grid n) (hpL : p ∈ L.val)
    (V : Ω → TimedObservation cfg) (hV : Measurable V)
    (F : Ω → ℝ) (hF : Measurable F) (A : ℝ) (hFA : ∀ ω, 0 ≤ F ω ∧ F ω ≤ A) :
    (∫ ω, observedActiveLineMass cfg L p (V ω)*F ω ∂μ) =
      ∑ q ∈ L.val.erase p, ∫ ω, observedRootLeaf cfg {p,q} p (V ω)*F ω ∂μ := by
  classical
  calc
    _ = ∫ ω, (∑ q ∈ L.val.erase p, observedRootLeaf cfg {p,q} p (V ω)*F ω) ∂μ := by
      apply integral_congr_ae
      exact Filter.Eventually.of_forall (fun ω => by
        dsimp only
        rw [observedActiveLineMass_eq_sum cfg L hL p hpL,Finset.sum_mul])
    _ = _ := integral_finsetSum _ (fun q _ => observedRootLeaf_mul_integrable μ cfg {p,q} p V hV F hF A hFA)

theorem observedCorrectedRootLeaf_mul_integral_le {n : ℕ} {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsFiniteMeasure μ] (cfg : FlowConfig n) (C labels : Finset (Grid n)) (p : Grid n)
    (V : Ω → TimedObservation cfg) (hV : Measurable V)
    (F : Ω → ℝ) (hF : Measurable F) (A : ℝ) (hFA : ∀ ω, 0 ≤ F ω ∧ F ω ≤ A) :
    (∫ ω, observedCorrectedRootLeaf cfg C labels p (V ω)*F ω ∂μ) ≤
      ∫ ω, observedRootLeaf cfg C p (V ω)*F ω ∂μ := by
  have hi : Integrable (fun ω => observedCorrectedRootLeaf cfg C labels p (V ω)*F ω) μ :=
    GenericCreditIteration.bounded_nonnegative_integrable μ _
      (((observedCorrectedRootLeaf_measurable cfg C labels p).comp hV).mul hF) (rootLeafCap C p cfg.B*A)
      (fun ω => ⟨mul_nonneg (observedCorrectedRootLeaf_bounds cfg C labels p (V ω)).1 (hFA ω).1,
        mul_le_mul (observedCorrectedRootLeaf_bounds cfg C labels p (V ω)).2 (hFA ω).2 (hFA ω).1
          (rootLeafCap_nonneg C p cfg.B)⟩)
  exact integral_mono hi (observedRootLeaf_mul_integrable μ cfg C p V hV F hF A hFA)
    (fun ω => mul_le_mul_of_nonneg_right (observedCorrectedRootLeaf_le cfg C labels p (V ω)) (hFA ω).1)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.observedActiveLineMass_mul_integral_eq_sum
#print axioms NoThreeLine.BirthWitness.observedCorrectedRootLeaf_mul_integral_le
