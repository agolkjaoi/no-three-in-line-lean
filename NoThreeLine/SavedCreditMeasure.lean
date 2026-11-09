import NoThreeLine.RecycledTerminalConditional
import Mathlib.MeasureTheory.Integral.Bochner.ContinuousLinearMap

/-! A nonnegative integrable saved credit of mean one defines a probability
measure. Conditional saved credit determines its law on earlier history. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine

def savedCreditMeasure {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω) (Z : Ω → ℝ) : Measure Ω :=
  μ.withDensity (fun ω=>ENNReal.ofReal (Z ω))

theorem savedCreditMeasure_probability {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (Z : Ω → ℝ) (hZ : Integrable Z μ) (h0 : ∀ω,0≤Z ω)
    (hmean : (∫ω,Z ω ∂μ)=1) : IsProbabilityMeasure (savedCreditMeasure μ Z) := by
  constructor
  rw [savedCreditMeasure,withDensity_apply _ MeasurableSet.univ,Measure.restrict_univ,
    ←ofReal_integral_eq_lintegral_ofReal hZ (ae_of_all _ h0),hmean]
  simp

theorem savedCreditMeasure_real_apply {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (Z : Ω → ℝ) (hZ : Integrable Z μ) (h0 : ∀ω,0≤Z ω)
    (E : Set Ω) (hE : MeasurableSet E) :
    (savedCreditMeasure μ Z).real E=∫ω in E,Z ω ∂μ := by
  rw [measureReal_def,savedCreditMeasure,withDensity_apply _ hE,
    ←ofReal_integral_eq_lintegral_ofReal hZ.integrableOn (ae_of_all _ h0),
    ENNReal.toReal_ofReal (integral_nonneg h0)]

theorem savedCreditMeasure_integral {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (Z : Ω → ℝ) (hZ : Measurable Z) (h0 : ∀ω,0≤Z ω) (f : Ω → ℝ) :
    (∫ω,f ω ∂savedCreditMeasure μ Z)=∫ω,Z ω*f ω ∂μ := by
  rw [savedCreditMeasure,integral_withDensity_eq_integral_toReal_smul hZ.ennreal_ofReal
    (ae_of_all _ (fun _=>ENNReal.ofReal_lt_top))]
  simp only [ENNReal.toReal_ofReal (h0 _),smul_eq_mul]

theorem savedCreditMeasure_history_event {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsFiniteMeasure μ] (F : Filtration ℕ (inferInstance : MeasurableSpace Ω))
    (Z z : Ω → ℝ) (hZ : Integrable Z μ) (h0 : ∀ω,0≤Z ω) (k : ℕ)
    (hCE : condExp (F k) μ Z =ᵐ[μ] z) (E : Set Ω) (hE : MeasurableSet[F k] E) :
    (savedCreditMeasure μ Z).real E=∫ω in E,z ω ∂μ := by
  rw [savedCreditMeasure_real_apply μ Z hZ h0 E (F.le k E hE)]
  calc
    _ = ∫ω in E,condExp (F k) μ Z ω ∂μ := (setIntegral_condExp (F.le k) hZ hE).symm
    _ = _ := integral_congr_ae (ae_restrict_of_ae hCE)

end NoThreeLine

#print axioms NoThreeLine.savedCreditMeasure_probability
#print axioms NoThreeLine.savedCreditMeasure_history_event
