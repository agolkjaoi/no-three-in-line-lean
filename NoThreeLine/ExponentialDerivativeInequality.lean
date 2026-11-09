import NoThreeLine.WeightedExponentialCompensation

/-! A first-event exponential inequality requiring only an interior
derivative inequality, not continuity of the chosen derivative. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine

theorem exponential_first_step_nonpos_of_derivative (rate T : ℝ)
    (hr : 0<rate) (hT : 0≤T) (z J : ℝ→ℝ)
    (hz : ContinuousOn z (Icc 0 T)) (hJ : ContinuousOn J (Icc 0 T))
    (hd : ∀t∈Ioo 0 T,∃v,HasDerivAt z v t ∧ v+rate*(J t-z t)≤0) :
    (∫t,(if t≤T then J t else z T) ∂expMeasure rate)≤z 0 := by
  let clamp : ℝ→ℝ := fun t=>max 0 (min T t)
  have hclamp : Continuous clamp := by unfold clamp; fun_prop
  have hcmem : ∀t,clamp t∈Icc 0 T := by
    intro t
    exact ⟨le_max_left _ _,max_le hT (min_le_left _ _)⟩
  have hcfix : ∀t∈Icc 0 T,clamp t=t := by
    intro t ht
    simp only [clamp,min_eq_right ht.2,max_eq_right ht.1]
  have hJc : Continuous (fun t=>J (clamp t)) := hJ.comp_continuous hclamp hcmem
  let K : ℝ→ℝ := fun t=>rate*Real.exp (-(rate*t))*J (clamp t)
  have hK : Continuous K :=
    (by fun_prop : Continuous (fun t : ℝ=>rate*Real.exp (-(rate*t)))).mul hJc
  let G : ℝ→ℝ := fun t=>Real.exp (-(rate*t))*z t+sourcePrimitive K t
  have hGc : ContinuousOn G (Icc 0 T) :=
    ((by fun_prop : Continuous (fun t : ℝ=>Real.exp (-(rate*t)))).continuousOn.mul hz).add
      (sourcePrimitive_continuous K hK).continuousOn
  have hGd : ∀t∈Ioo 0 T,∃v,HasDerivAt G v t ∧ v≤0 := by
    intro t ht
    obtain ⟨v,hv,hvg⟩ := hd t ht
    have he : HasDerivAt (fun t : ℝ=>Real.exp (-(rate*t)))
        (Real.exp (-(rate*t))*(-rate)) t := by
      simpa using (((hasDerivAt_id t).const_mul rate).neg.exp)
    refine ⟨Real.exp (-(rate*t))*(v+rate*(J t-z t)),?_,
      mul_nonpos_of_nonneg_of_nonpos (Real.exp_pos _).le hvg⟩
    apply ((he.mul hv).add (sourcePrimitive_hasDerivAt K hK t)).congr_deriv
    dsimp [K]
    rw [hcfix t ⟨ht.1.le,ht.2.le⟩]
    ring
  have hGa : AntitoneOn G (Icc 0 T) := by
    apply antitoneOn_of_deriv_nonpos (convex_Icc 0 T) hGc
    · intro t ht
      rw [interior_Icc] at ht
      obtain ⟨v,hv,_⟩ := hGd t ht
      exact hv.differentiableAt.differentiableWithinAt
    · intro t ht
      rw [interior_Icc] at ht
      obtain ⟨v,hv,hv0⟩ := hGd t ht
      simpa only [hv.deriv] using hv0
  have hle := hGa (show (0:ℝ)∈Icc 0 T from ⟨le_rfl,hT⟩)
    (show T∈Icc 0 T from ⟨hT,le_rfl⟩) hT
  have hKi : sourcePrimitive K T=∫t in (0:ℝ)..T,rate*Real.exp (-(rate*t))*J t := by
    apply intervalIntegral.integral_congr
    intro t ht
    rw [uIcc_of_le hT] at ht
    simp only [K,hcfix t ht]
  dsimp [G] at hle
  rw [hKi] at hle
  simp only [mul_zero,neg_zero,Real.exp_zero,one_mul,sourcePrimitive_zero,add_zero] at hle
  letI := isProbabilityMeasure_expMeasure hr
  have hJE : IntegrableOn J (Ioc 0 T) (expMeasure rate) :=
    hJ.integrableOn_Icc.mono_set Ioc_subset_Icc_self
  rw [expMeasure_first_step_integral_of_integrable rate T (z T) hr hT J hJE,
    expMeasure_integral_Ioc rate T hr J,←intervalIntegral.integral_of_le hT]
  linarith only [hle]

end NoThreeLine
#print axioms NoThreeLine.exponential_first_step_nonpos_of_derivative
