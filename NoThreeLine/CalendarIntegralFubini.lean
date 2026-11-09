import NoThreeLine.FiniteCalendarIntegral
import Mathlib.MeasureTheory.Integral.Prod

/-! A bounded measurable calendar function can be integrated in either order.
The measure and path type are arbitrary finite measure spaces. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.CalendarIntegral

theorem expected_interval_integral_swap {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsFiniteMeasure μ] (H : ℝ) (hH : 0≤H)
    (f : Ω×ℝ→ℝ) (hf : Measurable f) (B : ℝ) (hb : ∀x,0≤f x ∧ f x≤B) :
    (∫ω,(∫t in (0:ℝ)..H,f (ω,t)) ∂μ)=∫t in (0:ℝ)..H,(∫ω,f (ω,t) ∂μ) := by
  let ν : Measure ℝ := volume.restrict (Ioo 0 H)
  have hi : Integrable f (μ.prod ν) :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _ hf B hb
  simp_rw [intervalIntegral.integral_of_le hH,integral_Ioc_eq_integral_Ioo]
  exact integral_integral_swap hi

end NoThreeLine.CalendarIntegral

#print axioms NoThreeLine.CalendarIntegral.expected_interval_integral_swap
