import NoThreeLine.ExponentialSurvivalGenerator

/-! Exact survival identities with only closed-interval regularity.
No integrability of the unstopped curve on the infinite half-line is assumed. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine

theorem expMeasure_survival_step_interval (rate u T Z : ℝ) (hr : 0<rate)
    (hu : 0≤u) (huT : u≤T) (J : ℝ→ℝ) (hJ : ContinuousOn J (Icc u T)) :
    (∫t in Ioi u,(if t≤T then J t else Z) ∂expMeasure rate)=
      (∫t in u..T,rate*Real.exp (-(rate*t))*J t)+Real.exp (-(rate*T))*Z := by
  classical
  letI := isProbabilityMeasure_expMeasure hr
  let f := fun t=>if t≤T then J t else Z
  have hleftI : IntegrableOn f (Ioc u T) (expMeasure rate) :=
    (hJ.integrableOn_Icc.mono_set Ioc_subset_Icc_self).congr_fun
      (fun t ht=>(if_pos ht.2).symm) measurableSet_Ioc
  have hrightI : IntegrableOn f (Ioi T) (expMeasure rate) :=
    (integrable_const Z).integrableOn.congr_fun
      (fun t ht=>(if_neg (not_le.mpr ht)).symm) measurableSet_Ioi
  have hset : Ioi u=Ioc u T ∪ Ioi T := by
    ext t
    simp only [mem_Ioi,mem_union,mem_Ioc]
    constructor <;> intro h <;> grind
  have hdisj : Disjoint (Ioc u T) (Ioi T) := by
    apply Set.disjoint_left.mpr
    intro t ht ht'
    exact (not_lt_of_ge ht.2) ht'
  change (∫t in Ioi u,f t ∂expMeasure rate)=_
  rw [hset,setIntegral_union hdisj measurableSet_Ioi hleftI hrightI]
  have hleft : (∫t in Ioc u T,f t ∂expMeasure rate)=∫t in Ioc u T,J t ∂expMeasure rate :=
    setIntegral_congr_fun measurableSet_Ioc (fun t ht=>if_pos ht.2)
  have hright : (∫t in Ioi T,f t ∂expMeasure rate)=∫_t in Ioi T,Z ∂expMeasure rate :=
    setIntegral_congr_fun measurableSet_Ioi (fun t ht=>if_neg (not_le.mpr ht))
  rw [hleft,hright,expMeasure_integral_Ioc_from rate u T hr hu,
    ←intervalIntegral.integral_of_le huT,setIntegral_const,smul_eq_mul,
    expMeasure_real_Ioi rate T hr (hu.trans huT)]

theorem expMeasure_survival_compensation_interval (rate u T : ℝ) (hr : 0<rate)
    (hu : 0≤u) (huT : u≤T) (z J : ℝ→ℝ)
    (hz : ContinuousOn z (Icc u T)) (hJ : ContinuousOn J (Icc u T))
    (hd : ∀t∈Ioo u T,HasDerivAt z (rate*(z t-J t)) t) :
    (∫t in Ioi u,(if t≤T then J t else z T) ∂expMeasure rate)=
      Real.exp (-(rate*u))*z u := by
  have hv : ContinuousOn (fun t=>rate*(z t-J t)) (Icc u T) := (hz.sub hJ).const_mul rate
  have hJW : IntervalIntegrable (fun t=>rate*Real.exp (-(rate*t))*J t) volume u T := by
    apply ContinuousOn.intervalIntegrable
    rw [uIcc_of_le huT]
    exact (by fun_prop : Continuous (fun t : ℝ=>rate*Real.exp (-(rate*t)))).continuousOn.mul hJ
  rw [expMeasure_survival_step_interval rate u T (z T) hr hu huT J hJ,
    exponential_generator_integral_from rate u T huT z (fun t=>rate*(z t-J t)) J hz hv hd hJW]
  have hzero : (fun t=>Real.exp (-(rate*t))*(rate*(z t-J t)+rate*(J t-z t)))=(fun _ : ℝ=>0) := by
    ext t
    ring
  rw [hzero]
  simp

end NoThreeLine
#print axioms NoThreeLine.expMeasure_survival_step_interval
#print axioms NoThreeLine.expMeasure_survival_compensation_interval
