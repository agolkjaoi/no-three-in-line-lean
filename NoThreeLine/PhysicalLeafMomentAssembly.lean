import NoThreeLine.PhysicalLeafRegularity
import NoThreeLine.PhysicalRepeatLowDegree

/-! Keep the exact finite repetition sum when assembling actual physical
leaf moments. Low-degree applications need no lower bound on line length. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open FiniteWitnessMoments AuxiliaryODE PrimitiveLines

theorem lineLeafPower_integral_le_repeatSum {n : ℕ} {α Ω : Type*}
    [Fintype α] [DecidableEq α] [MeasurableSpace Ω]
    (μ : Measure Ω) [IsFiniteMeasure μ] (Z : Ω → WitnessState n)
    (hZ : Measurable Z) (B : ℝ) (hB : 0 < B) (hv : ∀ ω, (Z ω).Valid B)
    (leaf : α → Grid n) (hinj : Function.Injective leaf)
    (mask : α → ℝ) (hm : ∀ q, 0 ≤ mask q ∧ mask q ≤ 1)
    (L : LineIndex n) (p z : Grid n) (Γ : Finset ZPoint) (hL : ¬specified Γ L)
    (hpL : p ∈ L.val) (hleaf : ∀ q, leaf q ∈ L.val) (hnep : ∀ q, leaf q ≠ p)
    (k : ℕ) (P : ℝ)
    (hprod : ∀ f : Fin k → α,
      (∫ ω, rootLeafWitness Γ (physicalRootLabels leaf p f) {z} p (Z ω) ∂μ) ≤ P) :
    (∫ ω, lineLeafPower leaf mask L p z k (Z ω) ∂μ) ≤ P * physicalRepeatSum mask B k := by
  let coef (f : Fin k → α) := (∏ i : Fin k, mask (f i)) * B^(k-(tupleLabels f).card)
  have hc0 (f : Fin k → α) : 0 ≤ coef f :=
    mul_nonneg (Finset.prod_nonneg (fun i _ => (hm (f i)).1)) (pow_nonneg hB.le _)
  have hi : Integrable (fun ω => lineLeafPower leaf mask L p z k (Z ω)) μ :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _
      ((lineLeafPower_measurable leaf mask L p z k).comp hZ) ((B*Fintype.card α)^k)
      (fun ω => lineLeafPower_bounds leaf mask hm L p z k _ B hB.le (hv ω))
  have hj (f : Fin k → α) : Integrable
      (fun ω => rootLeafWitness Γ (physicalRootLabels leaf p f) {z} p (Z ω)) μ :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _
      ((rootLeafWitness_measurable Γ (physicalRootLabels leaf p f) {z} p).comp hZ)
      (rootLeafCap (physicalRootLabels leaf p f) p B)
      (fun ω => rootLeafWitness_bounds Γ (physicalRootLabels leaf p f) {z} p _ B (hv ω))
  calc
    _ ≤ ∫ ω, ∑ f : Fin k → α, coef f * rootLeafWitness Γ (physicalRootLabels leaf p f) {z} p (Z ω) ∂μ :=
      integral_mono hi (integrable_finsetSum _ (fun f _ => (hj f).const_mul (coef f))) (fun ω => by
        rw [lineLeafPower_eq_sum]
        exact Finset.sum_le_sum (fun f _ => lineLeafTuple_le_rootLeaf leaf hinj mask (fun q => (hm q).1)
          L p z Γ hL hpL hleaf hnep f _ B hB (hv ω)))
    _ = ∑ f : Fin k → α, coef f * (∫ ω, rootLeafWitness Γ (physicalRootLabels leaf p f) {z} p (Z ω) ∂μ) := by
      rw [integral_finsetSum _ (fun f _ => (hj f).const_mul (coef f))]
      simp_rw [integral_const_mul]
    _ ≤ ∑ f : Fin k → α, coef f * P :=
      Finset.sum_le_sum (fun f _ => mul_le_mul_of_nonneg_left (hprod f) (hc0 f))
    _ = _ := by
      unfold physicalRepeatSum
      rw [Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro f _
      dsimp only [coef]
      ring

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.lineLeafPower_integral_le_repeatSum
