import NoThreeLine.SavedCreditMeasure
import Mathlib.MeasureTheory.Function.ConditionalExpectation.PullOut

/-! Earlier-history observables under a terminal-credit density. The
conditional expectation identity is explicit in the general lemma and
will be supplied by the actual process martingale in the application. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine

theorem savedCreditMeasure_history_integral {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsFiniteMeasure μ] (F : Filtration ℕ (inferInstance : MeasurableSpace Ω))
    (Z z : Ω → ℝ) (hZm : Measurable Z) (hZi : Integrable Z μ) (h0 : ∀ω,0≤Z ω) (k : ℕ)
    (hCE : condExp (F k) μ Z =ᵐ[μ] z) (f : Ω → ℝ)
    (hf : @Measurable Ω ℝ (F k) inferInstance f) (hprod : Integrable (Z*f) μ) :
    (∫ω,f ω ∂savedCreditMeasure μ Z)=∫ω,z ω*f ω ∂μ := by
  rw [savedCreditMeasure_integral μ Z hZm h0 f]
  calc
    _ = ∫ω,condExp (F k) μ (Z*f) ω ∂μ := (integral_condExp (F.le k)).symm
    _ = ∫ω,condExp (F k) μ Z ω*f ω ∂μ :=
      integral_congr_ae (condExp_mul_of_stronglyMeasurable_right hf.stronglyMeasurable hprod hZi)
    _ = _ := integral_congr_ae (hCE.mono (fun ω hω=>congrArg (fun v=>v*f ω) hω))

theorem savedCreditMeasure_absolutelyContinuous {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (Z : Ω → ℝ) : savedCreditMeasure μ Z ≪ μ :=
  withDensity_absolutelyContinuous _ _

theorem savedCreditMeasure_positive_ae {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (Z : Ω → ℝ) (hZm : Measurable Z) :
    ∀ᵐω ∂savedCreditMeasure μ Z,0<Z ω := by
  apply (ae_withDensity_iff hZm.ennreal_ofReal).mpr
  exact ae_of_all _ (fun ω hω=>by simpa only [ne_eq,ENNReal.ofReal_eq_zero,not_le] using hω)

end NoThreeLine

#print axioms NoThreeLine.savedCreditMeasure_history_integral
#print axioms NoThreeLine.savedCreditMeasure_positive_ae
