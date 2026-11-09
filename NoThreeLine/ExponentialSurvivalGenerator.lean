import NoThreeLine.ExponentialGeneratorIntegral

/-! Survival-restricted generator identity on the actual same curve from
u to T. This is needed for inequalities: subtracting two upper mean bounds
would not establish a conditional survival bound. -/
set_option autoImplicit false
set_option maxHeartbeats 1000000
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped ENNReal
namespace NoThreeLine

theorem exponential_generator_integral_from (rate u T : ℝ) (huT : u≤T)
    (z v J : ℝ→ℝ) (hz : ContinuousOn z (Icc u T)) (hv : ContinuousOn v (Icc u T))
    (hd : ∀t∈Ioo u T,HasDerivAt z (v t) t)
    (hJ : IntervalIntegrable (fun t=>rate*Real.exp (-(rate*t))*J t) volume u T) :
    (∫t in u..T,rate*Real.exp (-(rate*t))*J t)+Real.exp (-(rate*T))*z T=
      Real.exp (-(rate*u))*z u+∫t in u..T,Real.exp (-(rate*t))*(v t+rate*(J t-z t)) := by
  have hexp : Continuous (fun t : ℝ=>Real.exp (-(rate*t))) := by fun_prop
  have ha : IntervalIntegrable (fun t=>Real.exp (-(rate*t))*(v t-rate*z t)) volume u T := by
    apply ContinuousOn.intervalIntegrable
    rw [uIcc_of_le huT]
    exact hexp.continuousOn.mul (hv.sub (hz.const_mul rate))
  have hd' : ∀t∈Ioo u T,HasDerivAt (fun t=>Real.exp (-(rate*t))*z t)
      (Real.exp (-(rate*t))*(v t-rate*z t)) t := by
    intro t ht
    have he : HasDerivAt (fun t : ℝ=>Real.exp (-(rate*t))) (Real.exp (-(rate*t))*(-rate)) t := by
      simpa using (((hasDerivAt_id t).const_mul rate).neg.exp)
    exact (he.mul (hd t ht)).congr_deriv (by ring)
  have hf := intervalIntegral.integral_eq_sub_of_hasDerivAt_of_le huT (hexp.continuousOn.mul hz) hd' ha
  have hi : (∫t in u..T,Real.exp (-(rate*t))*(v t+rate*(J t-z t)))=
      (∫t in u..T,Real.exp (-(rate*t))*(v t-rate*z t))+
        ∫t in u..T,rate*Real.exp (-(rate*t))*J t := by
    rw [←intervalIntegral.integral_add ha hJ]
    apply intervalIntegral.integral_congr
    intro t _
    ring
  rw [hi,hf]
  simp only [Pi.mul_apply]
  ring

theorem expMeasure_integral_Ioc_from (rate u T : ℝ) (hr : 0<rate) (hu : 0≤u) (J : ℝ→ℝ) :
    (∫t in Ioc u T,J t ∂expMeasure rate)=∫t in Ioc u T,rate*Real.exp (-(rate*t))*J t := by
  change (∫t in Ioc u T,J t ∂volume.withDensity (exponentialPDF rate))=_
  have hm : Measurable (exponentialPDF rate) := (measurable_exponentialPDFReal rate).ennreal_ofReal
  have hf : ∀ᵐt ∂volume.restrict (Ioc u T),exponentialPDF rate t<∞ :=
    Filter.Eventually.of_forall (fun _=>ENNReal.ofReal_lt_top)
  rw [setIntegral_withDensity_eq_setIntegral_toReal_smul hm hf J measurableSet_Ioc]
  apply setIntegral_congr_fun measurableSet_Ioc
  intro t ht
  change (exponentialPDF rate t).toReal • J t=rate*Real.exp (-(rate*t))*J t
  rw [exponentialPDF_of_nonneg (hu.trans ht.1.le),ENNReal.toReal_ofReal
    (mul_nonneg hr.le (Real.exp_pos _).le),smul_eq_mul]

theorem expMeasure_survival_step_integral (rate u T Z : ℝ) (hr : 0<rate) (hu : 0≤u) (huT : u≤T)
    (J : ℝ→ℝ) (hJ : Integrable J (expMeasure rate)) :
    (∫t in Ioi u,(if t≤T then J t else Z) ∂expMeasure rate)=
      (∫t in u..T,rate*Real.exp (-(rate*t))*J t)+Real.exp (-(rate*T))*Z := by
  classical
  letI := isProbabilityMeasure_expMeasure hr
  let f := fun t=>if t≤T then J t else Z
  have hfi : Integrable f (expMeasure rate) :=
    Integrable.piecewise (s:=Iic T) measurableSet_Iic hJ.integrableOn (integrable_const Z).integrableOn
  have hset : Ioi u=Ioc u T ∪ Ioi T := by ext t; simp only [mem_Ioi,mem_union,mem_Ioc]; constructor <;> intro h <;> grind
  have hdisj : Disjoint (Ioc u T) (Ioi T) := by
    apply Set.disjoint_left.mpr
    intro t ht ht'
    exact (not_lt_of_ge ht.2) ht'
  change (∫t in Ioi u,f t ∂expMeasure rate)=_
  rw [hset,setIntegral_union hdisj measurableSet_Ioi hfi.integrableOn hfi.integrableOn]
  have hleft : (∫t in Ioc u T,f t ∂expMeasure rate)=∫t in Ioc u T,J t ∂expMeasure rate :=
    setIntegral_congr_fun measurableSet_Ioc (fun t ht=>if_pos ht.2)
  have hright : (∫t in Ioi T,f t ∂expMeasure rate)=∫_t in Ioi T,Z ∂expMeasure rate :=
    setIntegral_congr_fun measurableSet_Ioi (fun t ht=>if_neg (not_le.mpr ht))
  rw [hleft,hright,expMeasure_integral_Ioc_from rate u T hr hu,
    ←intervalIntegral.integral_of_le huT,setIntegral_const,smul_eq_mul,
    expMeasure_real_Ioi rate T hr (hu.trans huT)]

theorem expMeasure_survival_generator_nonpos (rate u T : ℝ) (hr : 0<rate) (hu : 0≤u) (huT : u≤T)
    (z v J : ℝ→ℝ) (hz : ContinuousOn z (Icc u T)) (hv : ContinuousOn v (Icc u T))
    (hd : ∀t∈Ioo u T,HasDerivAt z (v t) t) (hJ : Integrable J (expMeasure rate))
    (hJW : IntervalIntegrable (fun t=>rate*Real.exp (-(rate*t))*J t) volume u T)
    (hgen : ∀t∈Ioo u T,v t+rate*(J t-z t)≤0) :
    (∫t in Ioi u,(if t≤T then J t else z T) ∂expMeasure rate)≤Real.exp (-(rate*u))*z u := by
  rw [expMeasure_survival_step_integral rate u T (z T) hr hu huT J hJ,
    exponential_generator_integral_from rate u T huT z v J hz hv hd hJW]
  have ha : IntervalIntegrable (fun t=>Real.exp (-(rate*t))*(v t-rate*z t)) volume u T := by
    apply ContinuousOn.intervalIntegrable
    rw [uIcc_of_le huT]
    exact (by fun_prop : Continuous (fun t : ℝ=>Real.exp (-(rate*t)))).continuousOn.mul
      (hv.sub (hz.const_mul rate))
  have hi : IntervalIntegrable (fun t=>Real.exp (-(rate*t))*(v t+rate*(J t-z t))) volume u T := by
    convert ha.add hJW using 1
    ext t
    ring
  have hle := intervalIntegral.integral_mono_on_of_le_Ioo huT hi
    (intervalIntegrable_const : IntervalIntegrable (fun _ : ℝ=>(0:ℝ)) volume u T)
    (fun t ht=>mul_nonpos_of_nonneg_of_nonpos (Real.exp_pos _).le (hgen t ht))
  simpa using add_le_add_left hle (Real.exp (-(rate*u))*z u)

end NoThreeLine
#print axioms NoThreeLine.exponential_generator_integral_from
#print axioms NoThreeLine.expMeasure_survival_generator_nonpos
