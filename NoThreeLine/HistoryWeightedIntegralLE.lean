import Mathlib.MeasureTheory.Function.ConditionalExpectation.PullOut
import Mathlib.MeasureTheory.Function.AEEqOfIntegral

/-! A nonnegative bounded past-measurable factor preserves conditional
set-integral inequalities. No pointwise inequality of the original observables
or independence after a change of law is required. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set Filter

namespace NoThreeLine

theorem condExp_le_of_history_setIntegral_le {Ω : Type*} [m0 : MeasurableSpace Ω]
    (μ : Measure Ω) [IsFiniteMeasure μ] (m : MeasurableSpace Ω)
    (hm : m≤m0) (f g : Ω→ℝ)
    (hfi : Integrable f μ) (hgi : Integrable g μ)
    (hset : ∀A: Set Ω,MeasurableSet[m] A→(∫ω in A,f ω ∂μ)≤∫ω in A,g ω ∂μ) :
    condExp m μ f ≤ᵐ[μ] condExp m μ g := by
  apply ae_of_ae_trim hm (μ:=μ)
  apply ae_le_of_forall_setIntegral_le
    (integrable_condExp.trim hm stronglyMeasurable_condExp)
    (integrable_condExp.trim hm stronglyMeasurable_condExp)
  intro A hA _
  rw [←setIntegral_trim hm stronglyMeasurable_condExp hA,
    ←setIntegral_trim hm stronglyMeasurable_condExp hA,
    setIntegral_condExp hm hfi hA,setIntegral_condExp hm hgi hA]
  exact hset A hA

theorem history_weighted_setIntegral_le {Ω : Type*} [m0 : MeasurableSpace Ω]
    (μ : Measure Ω) [IsFiniteMeasure μ] (m : MeasurableSpace Ω)
    (hm : m≤m0) (H : Ω→ℝ)
    (hHm : @Measurable Ω ℝ m inferInstance H) (C : ℝ)
    (hHb : ∀ω,‖H ω‖≤C) (hH0 : ∀ω,0≤H ω) (f g : Ω→ℝ)
    (hfi : Integrable f μ) (hgi : Integrable g μ)
    (hset : ∀A: Set Ω,MeasurableSet[m] A→(∫ω in A,f ω ∂μ)≤∫ω in A,g ω ∂μ)
    (A : Set Ω) (hA : MeasurableSet[m] A) :
    (∫ω in A,H ω*f ω ∂μ)≤∫ω in A,H ω*g ω ∂μ := by
  have hHm0 : @Measurable Ω ℝ m0 inferInstance H := hHm.mono hm le_rfl
  have hif : Integrable (H*f) μ := hfi.bdd_mul
    hHm0.aestronglyMeasurable (ae_of_all _ hHb)
  have hig : Integrable (H*g) μ := hgi.bdd_mul
    hHm0.aestronglyMeasurable (ae_of_all _ hHb)
  have hcmp := condExp_le_of_history_setIntegral_le (m0:=m0) μ m hm f g hfi hgi hset
  have hcf := condExp_mul_of_stronglyMeasurable_left hHm.stronglyMeasurable hif hfi
  have hcg := condExp_mul_of_stronglyMeasurable_left hHm.stronglyMeasurable hig hgi
  have hh : condExp m μ (H*f) ≤ᵐ[μ] condExp m μ (H*g) := by
    filter_upwards [hcf,hcg,hcmp] with ω hf hg hc
    rw [hf,hg]
    exact mul_le_mul_of_nonneg_left hc (hH0 ω)
  change (∫ω in A,(H*f) ω ∂μ)≤∫ω in A,(H*g) ω ∂μ
  rw [←setIntegral_condExp hm hif hA,←setIntegral_condExp hm hig hA]
  exact integral_mono_ae integrable_condExp.integrableOn integrable_condExp.integrableOn
    (ae_restrict_of_ae hh)

end NoThreeLine

#print axioms NoThreeLine.condExp_le_of_history_setIntegral_le
#print axioms NoThreeLine.history_weighted_setIntegral_le
