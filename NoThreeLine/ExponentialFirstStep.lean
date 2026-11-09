import NoThreeLine.ExponentialClocks
import Mathlib.MeasureTheory.Integral.IntervalIntegral.FundThmCalculus
import Mathlib.MeasureTheory.Integral.Bochner.ContinuousLinearMap

/-! The actual exponential waiting law stopped at one deterministic horizon.
This is a first-step integral identity. A state-dependent trajectory and its
conditional iteration must still be constructed separately. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped ENNReal

namespace NoThreeLine

theorem expMeasure_integral_Ioc (rate T : ℝ) (hr : 0 < rate) (J : ℝ → ℝ) :
    (∫ t in Ioc 0 T, J t ∂expMeasure rate) =
      ∫ t in Ioc 0 T, rate * Real.exp (-(rate*t)) * J t := by
  change (∫ t in Ioc 0 T, J t ∂volume.withDensity (exponentialPDF rate)) = _
  have hm : Measurable (exponentialPDF rate) :=
    (measurable_exponentialPDFReal rate).ennreal_ofReal
  have hfin : ∀ᵐ t ∂volume.restrict (Ioc (0 : ℝ) T), exponentialPDF rate t < ∞ :=
    Filter.Eventually.of_forall (fun _ => ENNReal.ofReal_lt_top)
  rw [setIntegral_withDensity_eq_setIntegral_toReal_smul hm hfin J measurableSet_Ioc]
  apply setIntegral_congr_fun measurableSet_Ioc
  intro t ht
  change (exponentialPDF rate t).toReal • J t = rate * Real.exp (-(rate*t)) * J t
  rw [exponentialPDF_of_nonneg ht.1.le,ENNReal.toReal_ofReal
    (mul_nonneg hr.le (Real.exp_pos _).le),smul_eq_mul]

theorem expMeasure_first_step_integral (rate T z : ℝ) (hr : 0 < rate) (hT : 0 ≤ T)
    (J : ℝ → ℝ) (hJ : ContinuousOn J (Icc 0 T)) :
    (∫ t, (if t ≤ T then J t else z) ∂expMeasure rate) =
      (∫ t in Ioc 0 T, J t ∂expMeasure rate) + Real.exp (-(rate*T)) * z
    := by
  letI := isProbabilityMeasure_expMeasure hr
  have hsets : Iic T =ᵐ[expMeasure rate] Ioc 0 T := by
    filter_upwards [expMeasure_ae_positive rate hr] with t ht
    exact propext ⟨fun h => ⟨ht,h⟩,fun h => h.2⟩
  have hJI : IntegrableOn J (Iic T) (expMeasure rate) := by
    rw [integrableOn_congr_set_ae hsets]
    exact hJ.integrableOn_Icc.mono_set Ioc_subset_Icc_self
  change (∫ t, (Iic T).piecewise J (fun _ => z) t ∂expMeasure rate) = _
  rw [integral_piecewise measurableSet_Iic hJI (integrable_const z).integrableOn,
    Measure.restrict_congr_set hsets,compl_Iic,setIntegral_const,smul_eq_mul]
  rw [expMeasure_real_Ioi rate T hr hT]

/-- Integrating factor identity on one flow segment. The derivative relation
is explicit here; it is not an assumption of a stochastic martingale. -/
theorem exponential_compensation_integral (rate T : ℝ) (hT : 0 ≤ T)
    (z J : ℝ → ℝ) (hz : ContinuousOn z (Icc 0 T))
    (hJ : ContinuousOn J (Icc 0 T))
    (hd : ∀ t ∈ Ioo 0 T, HasDerivAt z (rate * (z t-J t)) t) :
    (∫ t in (0 : ℝ)..T, rate * Real.exp (-(rate*t)) * J t) +
      Real.exp (-(rate*T)) * z T = z 0 := by
  have hexp : Continuous (fun t : ℝ => Real.exp (-(rate*t))) := by fun_prop
  have hcont : ContinuousOn (fun t => Real.exp (-(rate*t))*z t) (Icc 0 T) :=
    hexp.continuousOn.mul hz
  have hderiv : ∀ t ∈ Ioo 0 T, HasDerivAt (fun t => Real.exp (-(rate*t))*z t)
      (-(rate * Real.exp (-(rate*t))*J t)) t := by
    intro t ht
    have he : HasDerivAt (fun t : ℝ => Real.exp (-(rate*t)))
        (Real.exp (-(rate*t)) * (-rate)) t := by
      simpa using (((hasDerivAt_id t).const_mul rate).neg.exp)
    exact (he.mul (hd t ht)).congr_deriv (by ring)
  have hi : IntervalIntegrable (fun t => -(rate * Real.exp (-(rate*t))*J t)) volume 0 T := by
    apply ContinuousOn.intervalIntegrable
    rw [uIcc_of_le hT]
    exact ((continuous_const.mul hexp).continuousOn.mul hJ).neg
  have hf := intervalIntegral.integral_eq_sub_of_hasDerivAt_of_le hT hcont hderiv hi
  rw [intervalIntegral.integral_neg] at hf
  simp only [mul_zero,neg_zero,Real.exp_zero,one_mul] at hf
  linarith

/-- The real exponential waiting measure yields preserved expected credit
at the first candidate or the horizon, given the segment compensation ODE. -/
theorem expMeasure_first_step_compensation (rate T : ℝ) (hr : 0 < rate) (hT : 0 ≤ T)
    (z J : ℝ → ℝ) (hz : ContinuousOn z (Icc 0 T))
    (hJ : ContinuousOn J (Icc 0 T))
    (hd : ∀ t ∈ Ioo 0 T, HasDerivAt z (rate * (z t-J t)) t) :
    (∫ t, (if t ≤ T then J t else z T) ∂expMeasure rate) = z 0 := by
  rw [expMeasure_first_step_integral rate T (z T) hr hT J hJ,
    expMeasure_integral_Ioc rate T hr J,
    ← intervalIntegral.integral_of_le hT]
  exact exponential_compensation_integral rate T hT z J hz hJ hd

end NoThreeLine

#print axioms NoThreeLine.expMeasure_first_step_integral
#print axioms NoThreeLine.expMeasure_first_step_compensation
