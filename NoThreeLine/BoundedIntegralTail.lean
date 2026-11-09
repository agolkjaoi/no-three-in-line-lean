import NoThreeLine.BoundedMomentIntegral

/-! Integrability and Markov for the time integral of a bounded
nonnegative measurable function on two finite measure spaces. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory

namespace NoThreeLine.FiniteMomentIntegral

theorem bounded_integral_bounds {Ω V : Type*} [MeasurableSpace Ω] [MeasurableSpace V]
    (ν : Measure V) [IsFiniteMeasure ν] (f : Ω×V→ℝ) (hf : Measurable f)
    (F : ℝ) (hF : ∀x,0≤f x ∧ f x≤F) (ω : Ω) :
    0≤(∫t,f (ω,t) ∂ν) ∧ (∫t,f (ω,t) ∂ν)≤ν.real Set.univ*F := by
  have hi : Integrable (fun t=>f (ω,t)) ν :=
    GenericCreditIteration.bounded_nonnegative_integrable ν _
      (hf.comp (measurable_const.prodMk measurable_id)) F (fun t=>hF (ω,t))
  refine ⟨integral_nonneg (fun t=>(hF (ω,t)).1),?_⟩
  simpa only [integral_const,smul_eq_mul] using
    integral_mono hi (integrable_const F) (fun t=>(hF (ω,t)).2)

theorem bounded_integral_power_integrable {Ω V : Type*} [MeasurableSpace Ω] [MeasurableSpace V]
    (μ : Measure Ω) (ν : Measure V) [IsFiniteMeasure μ] [IsFiniteMeasure ν]
    (f : Ω×V→ℝ) (hf : Measurable f) (F : ℝ) (hF : ∀x,0≤f x ∧ f x≤F) (m : ℕ) :
    Integrable (fun ω=>(∫t,f (ω,t) ∂ν)^m) μ := by
  have hb := bounded_integral_bounds ν f hf F hF
  exact GenericCreditIteration.bounded_nonnegative_integrable μ _
    (hf.stronglyMeasurable.integral_prod_right'.measurable.pow_const m) ((ν.real Set.univ*F)^m)
    (fun ω=>⟨pow_nonneg (hb ω).1 m,pow_le_pow_left₀ (hb ω).1 (hb ω).2 m⟩)

theorem bounded_integral_tail_le_moment {Ω V : Type*} [MeasurableSpace Ω] [MeasurableSpace V]
    (μ : Measure Ω) (ν : Measure V) [IsFiniteMeasure μ] [IsFiniteMeasure ν]
    (f : Ω×V→ℝ) (hf : Measurable f) (F : ℝ) (hF : ∀x,0≤f x ∧ f x≤F)
    (m : ℕ) (r : ℝ) (hr : 0<r) :
    μ.real {ω | r≤∫t,f (ω,t) ∂ν}≤(∫ω,(∫t,f (ω,t) ∂ν)^m ∂μ)/r^m := by
  let Y := fun ω=>∫t,f (ω,t) ∂ν
  have hi := bounded_integral_power_integrable μ ν f hf F hF m
  have hM := mul_meas_ge_le_integral_of_nonneg
    (Filter.Eventually.of_forall (fun ω=>pow_nonneg (bounded_integral_bounds ν f hf F hF ω).1 m)) hi (r^m)
  have hset : {ω | r≤Y ω}⊆{ω | r^m≤Y ω^m} := fun _ hω=>pow_le_pow_left₀ hr.le hω m
  have hbound := (mul_le_mul_of_nonneg_left (measureReal_mono (μ:=μ) hset) (pow_nonneg hr.le m)).trans hM
  apply (le_div_iff₀ (pow_pos hr m)).mpr
  simpa only [mul_comm] using hbound

end NoThreeLine.FiniteMomentIntegral

#print axioms NoThreeLine.FiniteMomentIntegral.bounded_integral_power_integrable
#print axioms NoThreeLine.FiniteMomentIntegral.bounded_integral_tail_le_moment
