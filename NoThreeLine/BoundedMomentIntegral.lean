import NoThreeLine.BoundedMomentDual

/-! Minkowski's integral bound for a bounded nonnegative function and an
integrable deterministic moment envelope. Holder duality and Fubini give
the exact coefficient one, without a time-length Jensen loss. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory

namespace NoThreeLine.FiniteMomentIntegral

theorem bounded_moment_integral {Ω V : Type*} [MeasurableSpace Ω] [MeasurableSpace V]
    (μ : Measure Ω) (ν : Measure V) [IsFiniteMeasure μ] [IsFiniteMeasure ν]
    (f : Ω×V→ℝ) (hf : Measurable f) (F : ℝ) (hF0 : 0≤F) (hF : ∀x,0≤f x ∧ f x≤F)
    (b : V→ℝ) (hb : ∀t,0≤b t) (hbi : Integrable b ν)
    (m : ℕ) (hm : 2≤m) (hM : ∀ᵐt ∂ν,(∫ω,f (ω,t)^m ∂μ)≤b t^m) :
    (∫ω,(∫t,f (ω,t) ∂ν)^m ∂μ)≤(∫t,b t ∂ν)^m := by
  let Y : Ω→ℝ := fun ω=>∫t,f (ω,t) ∂ν
  let G : ℝ := ν.real Set.univ*F
  have hG0 : 0≤G := mul_nonneg ENNReal.toReal_nonneg hF0
  have hfi (ω) : Integrable (fun t=>f (ω,t)) ν :=
    GenericCreditIteration.bounded_nonnegative_integrable ν _
      (hf.comp (measurable_const.prodMk measurable_id)) F (fun t=>hF (ω,t))
  have hY : Measurable Y := hf.stronglyMeasurable.integral_prod_right'.measurable
  have hGb (ω) : 0≤Y ω ∧ Y ω≤G := by
    refine ⟨integral_nonneg (fun t=>(hF (ω,t)).1),?_⟩
    have he := integral_mono (hfi ω) (integrable_const F) (fun t=>(hF (ω,t)).2)
    simpa only [integral_const,smul_eq_mul] using he
  let Z := ∫ω,Y ω^m ∂μ
  have hZ0 : 0≤Z := integral_nonneg (fun ω=>pow_nonneg (hGb ω).1 m)
  let r : ℝ := ((m:ℝ)-1)/m
  have hprod : Integrable (fun x : Ω×V=>f x*Y x.1^(m-1)) (μ.prod ν) :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _
      (hf.mul ((hY.comp measurable_fst).pow_const (m-1))) (F*G^(m-1))
      (fun x=>⟨mul_nonneg (hF x).1 (pow_nonneg (hGb x.1).1 _),
        mul_le_mul (hF x).2 (pow_le_pow_left₀ (hGb x.1).1 (hGb x.1).2 _)
          (pow_nonneg (hGb x.1).1 _) hF0⟩)
  have hdual : ∀ᵐt ∂ν,(∫ω,f (ω,t)*Y ω^(m-1) ∂μ)≤b t*Z^r := by
    filter_upwards [hM] with t ht
    have hh := bounded_holder_moment μ (fun ω=>f (ω,t)) Y
      (hf.comp (measurable_id.prodMk measurable_const)) hY F G (fun ω=>hF (ω,t)) hGb m hm
    have hroot : (∫ω,f (ω,t)^m ∂μ)^((m:ℝ)⁻¹)≤b t := by
      have he := Real.rpow_le_rpow (integral_nonneg (fun ω=>pow_nonneg (hF (ω,t)).1 m)) ht
        (inv_nonneg.mpr (Nat.cast_nonneg m))
      simpa only [Real.pow_rpow_inv_natCast (hb t) (by omega : m≠0)] using he
    exact hh.trans (mul_le_mul_of_nonneg_right hroot (Real.rpow_nonneg hZ0 r))
  have hself : Z≤(∫t,b t ∂ν)*Z^r := by
    calc
      Z = ∫ω,(∫t,f (ω,t)*Y ω^(m-1) ∂ν) ∂μ := by
        apply integral_congr_ae
        filter_upwards with ω
        rw [integral_mul_const]
        change Y ω^m=Y ω*Y ω^(m-1)
        rw [←pow_succ',Nat.sub_add_cancel (by omega : 1≤m)]
      _ = ∫t,(∫ω,f (ω,t)*Y ω^(m-1) ∂μ) ∂ν := integral_integral_swap hprod
      _ ≤ ∫t,b t*Z^r ∂ν := integral_mono_ae hprod.integral_prod_right (hbi.mul_const _) hdual
      _ = _ := integral_mul_const _ _
  exact moment_self_dual_le hZ0 (integral_nonneg hb) m (by omega) hself

end NoThreeLine.FiniteMomentIntegral

#print axioms NoThreeLine.FiniteMomentIntegral.bounded_moment_integral
