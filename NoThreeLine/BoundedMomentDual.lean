import NoThreeLine.CalendarIntegralFubini
import Mathlib.Analysis.SpecialFunctions.Pow.Real

/-! A bounded-function Holder duality lemma for integer moments, used to
integrate the sharp moment envelope without inserting a time-length loss. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory

namespace NoThreeLine.FiniteMomentIntegral

theorem bounded_holder_moment {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsFiniteMeasure μ] (f g : Ω→ℝ) (hf : Measurable f) (hg : Measurable g)
    (F G : ℝ) (hF : ∀ω,0≤f ω ∧ f ω≤F) (hG : ∀ω,0≤g ω ∧ g ω≤G)
    (m : ℕ) (hm : 2≤m) :
    (∫ω,f ω*g ω^(m-1) ∂μ)≤
      (∫ω,f ω^m ∂μ)^((m:ℝ)⁻¹)*(∫ω,g ω^m ∂μ)^(((m:ℝ)-1)/m) := by
  have hm1 : 1<(m:ℝ) := by exact_mod_cast (show 1<m by omega)
  have hm0 : (m:ℝ)≠0 := ne_of_gt (lt_trans zero_lt_one hm1)
  have hms : (m:ℝ)-1≠0 := ne_of_gt (sub_pos.mpr hm1)
  have hfLp : MemLp f (ENNReal.ofReal (m:ℝ)) μ :=
    MemLp.of_bound hf.aestronglyMeasurable F
      (Filter.Eventually.of_forall (fun ω=>by rw [Real.norm_of_nonneg (hF ω).1]; exact (hF ω).2))
  have hgLp : MemLp (fun ω=>g ω^(m-1)) (ENNReal.ofReal ((m:ℝ)/((m:ℝ)-1))) μ :=
    MemLp.of_bound (hg.pow_const (m-1)).aestronglyMeasurable (G^(m-1))
      (Filter.Eventually.of_forall (fun ω=>by
        rw [Real.norm_of_nonneg (pow_nonneg (hG ω).1 _)]
        exact pow_le_pow_left₀ (hG ω).1 (hG ω).2 _))
  have hpow (ω) : (g ω^(m-1))^((m:ℝ)/((m:ℝ)-1))=g ω^m := by
    rw [←Real.rpow_natCast,←Real.rpow_mul (hG ω).1]
    have hc : (((m-1:ℕ):ℝ))*((m:ℝ)/((m:ℝ)-1))=(m:ℝ) := by
      rw [Nat.cast_sub (by omega : 1≤m),Nat.cast_one]
      field_simp
    rw [hc,Real.rpow_natCast]
  have hh := integral_mul_le_Lp_mul_Lq_of_nonneg (Real.HolderConjugate.conjExponent hm1)
    (Filter.Eventually.of_forall (fun ω=>(hF ω).1))
    (Filter.Eventually.of_forall (fun ω=>pow_nonneg (hG ω).1 (m-1))) hfLp hgLp
  simpa only [Real.conjExponent,hpow,Real.rpow_natCast,one_div,inv_div] using hh

theorem moment_self_dual_le {Z A : ℝ} (hZ : 0≤Z) (hA : 0≤A)
    (m : ℕ) (hm : 0<m) (h : Z≤A*Z^(((m:ℝ)-1)/m)) : Z≤A^m := by
  by_cases hz : Z=0
  · exact hz ▸ pow_nonneg hA m
  have hzpos : 0<Z := lt_of_le_of_ne hZ (Ne.symm hz)
  have hm0 : (m:ℝ)≠0 := by exact_mod_cast (Nat.ne_of_gt hm)
  have he : (m:ℝ)⁻¹+((m:ℝ)-1)/m=1 := by field_simp <;> ring
  have hfactor : Z=Z^((m:ℝ)⁻¹)*Z^(((m:ℝ)-1)/m) := by
    rw [←Real.rpow_add hzpos,he,Real.rpow_one]
  have hroot : Z^((m:ℝ)⁻¹)≤A := by
    apply (mul_le_mul_iff_left₀ (Real.rpow_pos_of_pos hzpos (((m:ℝ)-1)/m))).mp
    have hh : Z^((m:ℝ)⁻¹)*Z^(((m:ℝ)-1)/m)≤A*Z^(((m:ℝ)-1)/m) :=
      hfactor.symm.trans_le h
    simpa only [mul_comm] using hh
  have hp := pow_le_pow_left₀ (Real.rpow_nonneg hZ _) hroot m
  simpa only [Real.rpow_inv_natCast_pow hZ (Nat.ne_of_gt hm)] using hp

end NoThreeLine.FiniteMomentIntegral

#print axioms NoThreeLine.FiniteMomentIntegral.bounded_holder_moment
#print axioms NoThreeLine.FiniteMomentIntegral.moment_self_dual_le
