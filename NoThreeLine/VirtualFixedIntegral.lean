import NoThreeLine.VirtualMassFixedCover
import NoThreeLine.AugmentedState

/-! Integrate the fixed finite cover. All integrability is supplied by the
actual finite coordinate bounds, rather than assumed moment hypotheses. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine.VirtualWitness
open AuxiliaryODE PrimitiveLines BirthWitness

theorem fixedMassBound_integrable {Ω : Type*} [MeasurableSpace Ω] {n : ℕ}
    (μ : Measure Ω) [IsFiniteMeasure μ] (W : Ω → ExtendedState n) (hW : Measurable W)
    (L : LineIndex n) (q : Grid n) (m : ℕ) (B : ℝ) (hv : ∀ ω, (W ω).Valid B) :
    Integrable (fun ω => fixedMassBound L q m B (W ω)) μ := by
  apply Integrable.const_mul
  apply integrable_finsetSum
  intro a _
  apply Integrable.const_mul
  exact integrable_finsetSum _ (fun g _ => physicalLeafProduct_integrable μ W hW _ _ q B hv)

theorem virtualMass_pow_integrable {Ω : Type*} [MeasurableSpace Ω] {n m : ℕ}
    (μ : Measure Ω) [IsFiniteMeasure μ] (W : Ω → ExtendedState n) (hW : Measurable W)
    (Γ : Finset ZPoint) (L : LineIndex n) (q : Grid n) (B : ℝ) (hB : 0 < B) (hm : 0 < m)
    (hv : ∀ ω, (W ω).Valid B) :
    Integrable (fun ω => virtualMass (W ω).process Γ (W ω).coordinates L q ^ m) μ := by
  apply (fixedMassBound_integrable μ W hW L q m B hv).mono'
    (((ExtendedState.measurable_virtualMass Γ L q).comp hW).pow_const m).aestronglyMeasurable
  exact Filter.Eventually.of_forall (fun ω => by
    have h0 := virtualMass_nonneg (W ω).process Γ (W ω).coordinates L q
      (fun y => ((hv ω).2.1.1 y).1) ((hv ω).2.1.2.1 L).2
    simpa only [Real.norm_eq_abs, Function.comp_apply, abs_of_nonneg (pow_nonneg h0 m)] using
      virtualMass_pow_le_fixedMassBound (W ω) Γ L q B hB hm (hv ω))

theorem virtualMass_pow_integral_le {Ω : Type*} [MeasurableSpace Ω] {n m : ℕ}
    (μ : Measure Ω) [IsFiniteMeasure μ] (W : Ω → ExtendedState n) (hW : Measurable W)
    (Γ : Finset ZPoint) (L : LineIndex n) (q : Grid n) (B : ℝ) (hB : 0 < B) (hm : 0 < m)
    (hv : ∀ ω, (W ω).Valid B) :
    (∫ ω, virtualMass (W ω).process Γ (W ω).coordinates L q ^ m ∂μ) ≤
      2^m * ∑ a ∈ Finset.Icc 1 m, B^(m-a) * (a : ℝ)^m *
        ∑ g ∈ anchors L q a, ∫ ω, anchorProduct g (W ω) ∂μ := by
  have hi (a : ℕ) (g : Fin a → candidates L q) :
      Integrable (fun ω => anchorProduct g (W ω)) μ := physicalLeafProduct_integrable μ W hW _ _ q B hv
  have hs (a : ℕ) : Integrable (fun ω => ∑ g ∈ anchors L q a, anchorProduct g (W ω)) μ :=
    integrable_finsetSum _ (fun g _ => hi a g)
  apply (integral_mono (virtualMass_pow_integrable μ W hW Γ L q B hB hm hv)
    (fixedMassBound_integrable μ W hW L q m B hv)
    (fun ω => virtualMass_pow_le_fixedMassBound (W ω) Γ L q B hB hm (hv ω))).trans_eq
  unfold fixedMassBound
  rw [integral_const_mul, integral_finsetSum _ (fun a _ => (hs a).const_mul _)]
  congr 1
  apply Finset.sum_congr rfl
  intro a _
  rw [integral_const_mul, integral_finsetSum _ (fun g _ => hi a g)]

end NoThreeLine.VirtualWitness

#print axioms NoThreeLine.VirtualWitness.virtualMass_pow_integrable
#print axioms NoThreeLine.VirtualWitness.virtualMass_pow_integral_le
