import NoThreeLine.NegativeJumpExponential
import NoThreeLine.WeightedSquareCentering

/-! Analytic exponential compensation, with the real source primitive
and energy primitive kept as separate differentiable curves. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine
open AuxiliaryODE PrimitiveLines

theorem protectedObservableExternalRate_exp_shift {n : ℕ} (e : ExtendedState n)
    (saved : Grid n→ℝ) (Γ : Finset ZPoint) (mask : Grid n→ℝ)
    (positive : Grid n→Grid n→Bool) (L : LineIndex n)
    (F : ExtendedState n→(Grid n→ℝ)→ℝ) (θ a : ℝ) :
    protectedObservableExternalRate e saved Γ mask positive L (fun v s=>Real.exp (θ*F v s-a))=
      Real.exp (-a)*protectedObservableExternalRate e saved Γ mask positive L (fun v s=>Real.exp (θ*F v s)) := by
  unfold protectedObservableExternalRate
  rw [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro q _
  split_ifs
  · ring
  · simp only [sub_eq_add_neg,Real.exp_add]
    ring

theorem weighted_exponential_hasDerivAt (Z F U W : ℝ→ℝ)
    (t θ intensity drift source energy : ℝ)
    (hZ : HasDerivAt Z (intensity*Z t) t)
    (hF : HasDerivAt F drift t) (hU : HasDerivAt U source t) (hW : HasDerivAt W energy t) :
    HasDerivAt (fun u=>Z u*Real.exp (θ*(F u-U u)-(θ^2/2)*W u))
      (Z t*Real.exp (θ*(F t-U t)-(θ^2/2)*W t)*
        (intensity+θ*(drift-source)-(θ^2/2)*energy)) t := by
  apply (hZ.mul ((((hF.sub hU).const_mul θ).sub (hW.const_mul (θ^2/2))).exp)).congr_deriv
  simp only [Pi.sub_apply]
  ring

theorem weighted_exponential_generator_nonpos
    (Z E intensity drift source energy external candidate rate θ : ℝ) (hZ : 0≤Z)
    (hgen : θ*E*(drift-source)+external≤(θ^2/2)*E*energy)
    (hcan : rate*(candidate-E)=external-intensity*E) :
    Z*E*(intensity+θ*(drift-source)-(θ^2/2)*energy)+rate*(Z*candidate-Z*E)≤0 := by
  have hh := mul_le_mul_of_nonneg_left hgen hZ
  have hh' := congrArg (fun x : ℝ=>Z*x) hcan
  nlinarith only [hh,hh']

theorem exponential_first_step_nonpos (rate T : ℝ) (hr : 0<rate) (hT : 0≤T)
    (z v J : ℝ→ℝ) (hz : ContinuousOn z (Icc 0 T)) (hv : ContinuousOn v (Icc 0 T))
    (hJ : ContinuousOn J (Icc 0 T))
    (hd : ∀t∈Ioo 0 T,HasDerivAt z (v t) t)
    (hgen : ∀t∈Ioo 0 T,v t+rate*(J t-z t)≤0) :
    (∫t,(if t≤T then J t else z T) ∂expMeasure rate)≤z 0 := by
  letI := isProbabilityMeasure_expMeasure hr
  have hJE : IntegrableOn J (Ioc 0 T) (expMeasure rate) := hJ.integrableOn_Icc.mono_set Ioc_subset_Icc_self
  have hJW : IntervalIntegrable (fun t=>rate*Real.exp (-(rate*t))*J t) volume 0 T := by
    apply ContinuousOn.intervalIntegrable
    rw [uIcc_of_le hT]
    exact (by fun_prop : Continuous (fun t : ℝ=>rate*Real.exp (-(rate*t)))).continuousOn.mul hJ
  rw [expMeasure_first_step_generator rate T hr hT z v J hz hv hd hJE hJW]
  have hle := intervalIntegral.integral_mono_on_of_le_Ioo hT
    (exponential_generator_intervalIntegrable rate T hT z v J hz hv hJW)
    (intervalIntegrable_const : IntervalIntegrable (fun _ : ℝ=>(0:ℝ)) volume 0 T)
    (fun t ht=>mul_nonpos_of_nonneg_of_nonpos (Real.exp_pos _).le (hgen t ht))
  simpa only [intervalIntegral.integral_zero,add_zero] using add_le_add le_rfl hle

end NoThreeLine
#print axioms NoThreeLine.weighted_exponential_hasDerivAt
#print axioms NoThreeLine.exponential_first_step_nonpos
