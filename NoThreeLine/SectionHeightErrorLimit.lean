import NoThreeLine.SectionHeightError
import NoThreeLine.LineCreditErrorBudget

/-! Fixed-degree lower errors tend to zero. The degree constraint is chosen
before the grid cutoff; it is not an assumed geometric or stochastic bound. -/
set_option autoImplicit false
set_option maxHeartbeats 1800000
noncomputable section
open Filter
open scoped BigOperators Topology

namespace NoThreeLine.SectionHeight
open FiniteWitnessMoments FiniteDirections

theorem tendsto_power_ratio_log (d : ℝ) (hd : d<1) :
    Tendsto (fun n : ℕ => ((n:ℝ)^d/(n:ℝ))*(1+Real.log (n:ℝ))) atTop (𝓝 (0:ℝ)) := by
  have hlog := (isLittleO_log_rpow_atTop (sub_pos.mpr hd)).tendsto_div_nhds_zero
  have hlogn : Tendsto (fun n : ℕ => Real.log (n:ℝ)/(n:ℝ)^(1-d)) atTop (𝓝 (0:ℝ)) :=
    hlog.comp tendsto_natCast_atTop_atTop
  have he : (fun n : ℕ => ((n:ℝ)^d/(n:ℝ))*(1+Real.log (n:ℝ))) =ᶠ[atTop]
      (fun n : ℕ => (n:ℝ)^d/(n:ℝ)+Real.log (n:ℝ)/(n:ℝ)^(1-d)) := by
    filter_upwards [eventually_ge_atTop (1:ℕ)] with n hn
    have hnR : (0:ℝ)<n := by exact_mod_cast (show 0<n by omega)
    have hr : (n:ℝ)^d/(n:ℝ)=((n:ℝ)^(1-d))⁻¹ := by
      rw [←Real.rpow_sub_one hnR.ne',←Real.rpow_neg hnR.le]
      congr 1
      ring
    rw [hr]
    ring
  exact (tendsto_congr' he).mpr (by
    simpa only [zero_add] using (tendsto_nat_rpow_div_nat d hd).add hlogn)

theorem tendsto_degree_one_error (d : ℝ) (m : ℕ)
    (hm : 1+(d-1)*(m-1:ℕ)<0) :
    Tendsto (fun n : ℕ => (n:ℝ)*((n:ℝ)^d/(n:ℝ))^(m-1)) atTop (𝓝 (0:ℝ)) := by
  have ht : Tendsto (fun n : ℕ => (n:ℝ)^(1+(d-1)*(m-1:ℕ))) atTop (𝓝 (0:ℝ)) := by
    simpa only [neg_neg] using tendsto_nat_rpow_negative (-(1+(d-1)*(m-1:ℕ))) (neg_pos.mpr hm)
  apply (tendsto_congr' ?_).mpr ht
  filter_upwards [eventually_ge_atTop (1:ℕ)] with n hn
  have hnR : (0:ℝ)<n := by exact_mod_cast (show 0<n by omega)
  rw [←Real.rpow_sub_one hnR.ne',←Real.rpow_mul_natCast hnR.le,
    Real.rpow_add hnR,Real.rpow_one]

theorem heightErrorEnvelope_tendsto (δ d : ℝ) (m : ℕ) (hd : d<1)
    (hm : 1+(d-1)*(m-1:ℕ)<0) :
    Tendsto (fun n : ℕ => heightErrorEnvelope n ((n:ℝ)^d) δ m) atTop (𝓝 (0:ℝ)) := by
  have h1 := (tendsto_degree_one_error d m hm).const_mul (8/δ^m)
  have h2 := (tendsto_power_ratio_log d hd).const_mul
    (∑a∈Finset.Ico 2 m,4*2^a*(a:ℝ)^m/δ^m)
  simpa only [heightErrorEnvelope,mul_assoc,mul_zero,zero_add] using h1.add h2

theorem exists_height_degree_floor (d : ℝ) (hd : d<1) :
    ∃ m0 : ℕ, 3≤m0 ∧ ∀m≥m0, 1+(d-1)*(m-1:ℕ)<0 := by
  obtain ⟨k,hk⟩ := exists_nat_gt (1/(1-d))
  refine ⟨k+3,by omega,?_⟩
  intro m hm
  have hkm : (k:ℝ)≤(m-1:ℕ) := by exact_mod_cast (show k≤m-1 by omega)
  have hmul : (1:ℝ)<(1-d)*(m-1:ℕ) := by
    have hh := (div_lt_iff₀ (sub_pos.mpr hd)).mp hk
    nlinarith [mul_le_mul_of_nonneg_left hkm (sub_pos.mpr hd).le]
  nlinarith

end NoThreeLine.SectionHeight
#print axioms NoThreeLine.SectionHeight.heightErrorEnvelope_tendsto
#print axioms NoThreeLine.SectionHeight.exists_height_degree_floor
