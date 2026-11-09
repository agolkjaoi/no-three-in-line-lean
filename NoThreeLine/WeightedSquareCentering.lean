import NoThreeLine.ProtectedWholeSquareExponential

/-! Deterministic centering by the actual source integral.  This analytic
helper cancels the full cross drift before any probabilistic bracket claim. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine

def sourcePrimitive (S : ℝ→ℝ) (t : ℝ) : ℝ := ∫u in (0:ℝ)..t,S u

theorem sourcePrimitive_hasDerivAt (S : ℝ→ℝ) (hS : Continuous S) (t : ℝ) :
    HasDerivAt (sourcePrimitive S) (S t) t :=
  intervalIntegral.integral_hasDerivAt_right (hS.intervalIntegrable 0 t)
    hS.aestronglyMeasurable.stronglyMeasurableAtFilter hS.continuousAt

theorem sourcePrimitive_continuous (S : ℝ→ℝ) (hS : Continuous S) :
    Continuous (sourcePrimitive S) :=
  continuous_iff_continuousAt.mpr (fun t=>(sourcePrimitive_hasDerivAt S hS t).continuousAt)

@[simp] theorem sourcePrimitive_zero (S : ℝ→ℝ) : sourcePrimitive S 0=0 := by
  simp [sourcePrimitive]

theorem weighted_centered_square_hasDerivAt (Z F U : ℝ→ℝ)
    (t rate intensity drift source external energy candidate : ℝ)
    (hZ : HasDerivAt Z (intensity*Z t) t)
    (hF : HasDerivAt F drift t) (hU : HasDerivAt U source t)
    (hsource : drift+external=source)
    (hcandidate : rate*(candidate-(F t-U t)^2)=
      2*(F t-U t)*external+energy-intensity*(F t-U t)^2) :
    HasDerivAt (fun u=>Z u*(F u-U u)^2)
      (Z t*(energy-rate*(candidate-(F t-U t)^2))) t := by
  apply (hZ.mul ((hF.sub hU).pow 2)).congr_deriv
  simp only [Nat.reduceSub,pow_one,Nat.cast_ofNat,Pi.sub_apply,Pi.pow_apply]
  rw [hcandidate,←hsource]
  ring

theorem weighted_centered_square_first_mean (rate T : ℝ) (hr : 0<rate) (hT : 0≤T)
    (Z F U V A : ℝ→ℝ)
    (hZ : ContinuousOn Z (Icc 0 T)) (hF : ContinuousOn F (Icc 0 T))
    (hU : ContinuousOn U (Icc 0 T)) (hV : ContinuousOn V (Icc 0 T))
    (hA : ContinuousOn A (Icc 0 T))
    (hd : ∀t∈Ioo 0 T,HasDerivAt (fun u=>Z u*(F u-U u)^2)
      (Z t*(V t-rate*(A t-(F t-U t)^2))) t) :
    (∫t,(if t≤T then Z t*A t else Z T*(F T-U T)^2) ∂expMeasure rate)=
      Z 0*(F 0-U 0)^2+∫t in (0:ℝ)..T,Real.exp (-(rate*t))*Z t*V t := by
  let z := fun t=>Z t*(F t-U t)^2
  let J := fun t=>Z t*A t
  let v := fun t=>Z t*(V t-rate*(A t-(F t-U t)^2))
  have hz : ContinuousOn z (Icc 0 T) := hZ.mul ((hF.sub hU).pow 2)
  have hJ : ContinuousOn J (Icc 0 T) := hZ.mul hA
  have hv : ContinuousOn v (Icc 0 T) := hZ.mul (hV.sub ((hA.sub ((hF.sub hU).pow 2)).const_mul rate))
  letI := isProbabilityMeasure_expMeasure hr
  have hJE : IntegrableOn J (Ioc 0 T) (expMeasure rate) :=
    hJ.integrableOn_Icc.mono_set Ioc_subset_Icc_self
  have hJW : IntervalIntegrable (fun t=>rate*Real.exp (-(rate*t))*J t) volume 0 T := by
    apply ContinuousOn.intervalIntegrable
    rw [uIcc_of_le hT]
    exact (by fun_prop : Continuous (fun t : ℝ=>rate*Real.exp (-(rate*t)))).continuousOn.mul hJ
  change (∫t,(if t≤T then J t else z T) ∂expMeasure rate)=_
  rw [expMeasure_first_step_generator rate T hr hT z v J hz hv hd hJE hJW]
  congr 1
  apply intervalIntegral.integral_congr
  intro t _
  dsimp only [z,J,v]
  ring

end NoThreeLine
#print axioms NoThreeLine.weighted_centered_square_hasDerivAt
#print axioms NoThreeLine.weighted_centered_square_first_mean
