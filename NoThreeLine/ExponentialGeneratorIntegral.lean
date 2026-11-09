import NoThreeLine.ExponentialFirstStep

/-! A generic one-event integrating-factor identity with merely integrable
jump means. It permits measurable time-dependent retention. Application to
the actual mixed observable must supply its derivative and candidate mean. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine

theorem expMeasure_first_step_integral_of_integrable (rate T z : ℝ) (hr : 0<rate) (hT : 0≤T)
    (J : ℝ → ℝ) (hJ : IntegrableOn J (Ioc 0 T) (expMeasure rate)) :
    (∫t,(if t≤T then J t else z) ∂expMeasure rate)=
      (∫t in Ioc 0 T,J t ∂expMeasure rate)+Real.exp (-(rate*T))*z := by
  letI := isProbabilityMeasure_expMeasure hr
  have hsets : Iic T=ᵐ[expMeasure rate] Ioc 0 T := by
    filter_upwards [expMeasure_ae_positive rate hr] with t ht
    exact propext ⟨fun h=>⟨ht,h⟩,fun h=>h.2⟩
  have hJI : IntegrableOn J (Iic T) (expMeasure rate) := by
    rw [integrableOn_congr_set_ae hsets]
    exact hJ
  change (∫t,(Iic T).piecewise J (fun _=>z) t ∂expMeasure rate)=_
  rw [integral_piecewise measurableSet_Iic hJI (integrable_const z).integrableOn,
    Measure.restrict_congr_set hsets,compl_Iic,setIntegral_const,smul_eq_mul,
    expMeasure_real_Ioi rate T hr hT]

theorem exponential_generator_intervalIntegrable (rate T : ℝ) (hT : 0≤T)
    (z v J : ℝ → ℝ) (hz : ContinuousOn z (Icc 0 T)) (hv : ContinuousOn v (Icc 0 T))
    (hJ : IntervalIntegrable (fun t=>rate*Real.exp (-(rate*t))*J t) volume 0 T) :
    IntervalIntegrable (fun t=>Real.exp (-(rate*t))*(v t+rate*(J t-z t))) volume 0 T := by
  have ha : IntervalIntegrable (fun t=>Real.exp (-(rate*t))*(v t-rate*z t)) volume 0 T := by
    apply ContinuousOn.intervalIntegrable
    rw [uIcc_of_le hT]
    exact (by fun_prop : Continuous (fun t : ℝ=>Real.exp (-(rate*t)))).continuousOn.mul
      (hv.sub (hz.const_mul rate))
  convert ha.add hJ using 1
  ext t
  ring

theorem exponential_generator_integral (rate T : ℝ) (hT : 0≤T)
    (z v J : ℝ → ℝ) (hz : ContinuousOn z (Icc 0 T)) (hv : ContinuousOn v (Icc 0 T))
    (hd : ∀t∈Ioo 0 T,HasDerivAt z (v t) t)
    (hJ : IntervalIntegrable (fun t=>rate*Real.exp (-(rate*t))*J t) volume 0 T) :
    (∫t in (0:ℝ)..T,rate*Real.exp (-(rate*t))*J t)+Real.exp (-(rate*T))*z T=
      z 0+∫t in (0:ℝ)..T,Real.exp (-(rate*t))*(v t+rate*(J t-z t)) := by
  have hexp : Continuous (fun t : ℝ=>Real.exp (-(rate*t))) := by fun_prop
  have ha : IntervalIntegrable (fun t=>Real.exp (-(rate*t))*(v t-rate*z t)) volume 0 T := by
    apply ContinuousOn.intervalIntegrable
    rw [uIcc_of_le hT]
    exact hexp.continuousOn.mul (hv.sub (hz.const_mul rate))
  have hderiv : ∀t∈Ioo 0 T,HasDerivAt (fun t=>Real.exp (-(rate*t))*z t)
      (Real.exp (-(rate*t))*(v t-rate*z t)) t := by
    intro t ht
    have he : HasDerivAt (fun t : ℝ=>Real.exp (-(rate*t))) (Real.exp (-(rate*t))*(-rate)) t := by
      simpa using (((hasDerivAt_id t).const_mul rate).neg.exp)
    exact (he.mul (hd t ht)).congr_deriv (by ring)
  have hf := intervalIntegral.integral_eq_sub_of_hasDerivAt_of_le hT (hexp.continuousOn.mul hz) hderiv ha
  change (∫t in (0:ℝ)..T,Real.exp (-(rate*t))*(v t-rate*z t))=
    Real.exp (-(rate*T))*z T-Real.exp (-(rate*0))*z 0 at hf
  simp only [mul_zero,neg_zero,Real.exp_zero,one_mul] at hf
  have hi : (∫t in (0:ℝ)..T,Real.exp (-(rate*t))*(v t+rate*(J t-z t)))=
      (∫t in (0:ℝ)..T,Real.exp (-(rate*t))*(v t-rate*z t))+
        ∫t in (0:ℝ)..T,rate*Real.exp (-(rate*t))*J t := by
    rw [←intervalIntegral.integral_add ha hJ]
    apply intervalIntegral.integral_congr
    intro t _
    ring
  rw [hi,hf]
  ring

theorem expMeasure_first_step_generator (rate T : ℝ) (hr : 0<rate) (hT : 0≤T)
    (z v J : ℝ → ℝ) (hz : ContinuousOn z (Icc 0 T)) (hv : ContinuousOn v (Icc 0 T))
    (hd : ∀t∈Ioo 0 T,HasDerivAt z (v t) t)
    (hJ : IntegrableOn J (Ioc 0 T) (expMeasure rate))
    (hJW : IntervalIntegrable (fun t=>rate*Real.exp (-(rate*t))*J t) volume 0 T) :
    (∫t,(if t≤T then J t else z T) ∂expMeasure rate)=
      z 0+∫t in (0:ℝ)..T,Real.exp (-(rate*t))*(v t+rate*(J t-z t)) := by
  rw [expMeasure_first_step_integral_of_integrable rate T (z T) hr hT J hJ,
    expMeasure_integral_Ioc rate T hr J,←intervalIntegral.integral_of_le hT]
  exact exponential_generator_integral rate T hT z v J hz hv hd hJW

theorem expMeasure_first_step_source_bound (rate T : ℝ) (hr : 0<rate) (hT : 0≤T)
    (z v J S : ℝ → ℝ) (hz : ContinuousOn z (Icc 0 T)) (hv : ContinuousOn v (Icc 0 T))
    (hd : ∀t∈Ioo 0 T,HasDerivAt z (v t) t)
    (hJ : IntegrableOn J (Ioc 0 T) (expMeasure rate))
    (hJW : IntervalIntegrable (fun t=>rate*Real.exp (-(rate*t))*J t) volume 0 T)
    (hSW : IntervalIntegrable (fun t=>Real.exp (-(rate*t))*S t) volume 0 T)
    (hsource : ∀t∈Icc 0 T,v t+rate*(J t-z t)≤S t) :
    (∫t,(if t≤T then J t else z T) ∂expMeasure rate)≤
      z 0+∫t in (0:ℝ)..T,Real.exp (-(rate*t))*S t := by
  rw [expMeasure_first_step_generator rate T hr hT z v J hz hv hd hJ hJW]
  apply add_le_add le_rfl
  apply intervalIntegral.integral_mono_on hT (exponential_generator_intervalIntegrable rate T hT z v J hz hv hJW) hSW
  intro t ht
  exact mul_le_mul_of_nonneg_left (hsource t ht) (Real.exp_pos _).le

end NoThreeLine

#print axioms NoThreeLine.expMeasure_first_step_generator
#print axioms NoThreeLine.expMeasure_first_step_source_bound
