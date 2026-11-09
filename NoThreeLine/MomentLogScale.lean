import NoThreeLine.MomentEnvelope
import Mathlib.Analysis.SpecialFunctions.Pow.Asymptotics

/-! Concrete logarithmic normalization: fixed weights, affine log mean,
and O(n^(xi-1)*(1+log n)) exceptional pairs lose their normalized error. -/
set_option autoImplicit false
noncomputable section
open Filter
open scoped Topology

namespace NoThreeLine.FiniteWitnessMoments

theorem log_nat_pos {n : ℕ} (hn : 2≤n) : 0<Real.log (n:ℝ) :=
  Real.log_pos (by exact_mod_cast (show 1<n by omega))

theorem tendsto_log_nat_atTop : Tendsto (fun n : ℕ=>Real.log (n:ℝ)) atTop atTop :=
  Real.tendsto_log_atTop.comp tendsto_natCast_atTop_atTop

theorem tendsto_inv_log_nat : Tendsto (fun n : ℕ=>(Real.log (n:ℝ))⁻¹) atTop (𝓝 (0:ℝ)) :=
  tendsto_inv_atTop_zero.comp tendsto_log_nat_atTop

theorem tendsto_const_div_log_nat (c : ℝ) :
    Tendsto (fun n : ℕ=>c/Real.log (n:ℝ)) atTop (𝓝 (0:ℝ)) := by
  simpa only [div_eq_mul_inv,mul_zero] using tendsto_inv_log_nat.const_mul c

theorem tendsto_affine_log_ratio (a b : ℝ) :
    Tendsto (fun n : ℕ=>(a*Real.log (n:ℝ)+b)/Real.log (n:ℝ)) atTop (𝓝 a) := by
  have he : (fun n : ℕ=>(a*Real.log (n:ℝ)+b)/Real.log (n:ℝ))=ᶠ[atTop]
      (fun n : ℕ=>a+b/Real.log (n:ℝ)) := by
    filter_upwards [eventually_ge_atTop (2:ℕ)] with n hn
    have hl := ne_of_gt (log_nat_pos hn)
    field_simp
  apply (tendsto_congr' he).mpr
  simpa only [add_zero] using tendsto_const_nhds.add (tendsto_const_div_log_nat b)

theorem tendsto_nat_rpow_negative (δ : ℝ) (hδ : 0<δ) :
    Tendsto (fun n : ℕ=>(n:ℝ)^(-δ)) atTop (𝓝 (0:ℝ)) :=
  (tendsto_rpow_neg_atTop hδ).comp tendsto_natCast_atTop_atTop

def logPairBudget (Q ξ : ℝ) (n : ℕ) : ℝ := Q*(n:ℝ)^(ξ-1)*(1+Real.log (n:ℝ))

theorem tendsto_logPairBudget_normalized (Q ξ : ℝ) (hξ : ξ<1) :
    Tendsto (fun n : ℕ=>logPairBudget Q ξ n/(Real.log (n:ℝ))^2) atTop (𝓝 (0:ℝ)) := by
  have hp : Tendsto (fun n : ℕ=>(n:ℝ)^(ξ-1)) atTop (𝓝 (0:ℝ)) := by
    simpa only [neg_sub] using tendsto_nat_rpow_negative (1-ξ) (sub_pos.mpr hξ)
  have hh := (hp.const_mul Q).mul ((tendsto_inv_log_nat.pow 2).add tendsto_inv_log_nat)
  have he : (fun n : ℕ=>logPairBudget Q ξ n/(Real.log (n:ℝ))^2)=ᶠ[atTop]
      (fun n : ℕ=>(Q*(n:ℝ)^(ξ-1))*((Real.log (n:ℝ))⁻¹^2+(Real.log (n:ℝ))⁻¹)) := by
    filter_upwards [eventually_ge_atTop (2:ℕ)] with n hn
    have hl := ne_of_gt (log_nat_pos hn)
    unfold logPairBudget
    field_simp
  exact (tendsto_congr' he).mpr (by simpa only [mul_zero,zero_pow (by decide : (2:ℕ)≠0),zero_add] using hh)

def logarithmicMomentEnvelope (m : ℕ) (a b c W Q ξ ζ : ℝ) (n : ℕ) : ℝ :=
  separatedMomentBound m (a*Real.log (n:ℝ)+b) (c*(a*Real.log (n:ℝ)+b)) W
    (logPairBudget Q ξ n) ((n:ℝ)^(-ζ))/(Real.log (n:ℝ))^(m+2)

theorem tendsto_logarithmicMomentEnvelope (m : ℕ) (a b c W Q ξ ζ : ℝ)
    (hξ : ξ<1) (hζ : 0<ζ) :
    Tendsto (logarithmicMomentEnvelope m a b c W Q ξ ζ) atTop (𝓝 (a^(m+2))) := by
  apply tendsto_normalized_separatedMomentBound m
    (fun n : ℕ=>a*Real.log (n:ℝ)+b) (fun n : ℕ=>c*(a*Real.log (n:ℝ)+b))
    (fun _=>W) (logPairBudget Q ξ) (fun n : ℕ=>(n:ℝ)^(-ζ)) (fun n : ℕ=>Real.log (n:ℝ)) a (c*a)
  · exact tendsto_affine_log_ratio a b
  · simpa only [mul_div_assoc] using (tendsto_affine_log_ratio a b).const_mul c
  · exact tendsto_const_div_log_nat W
  · exact tendsto_logPairBudget_normalized Q ξ hξ
  · exact tendsto_nat_rpow_negative ζ hζ

end NoThreeLine.FiniteWitnessMoments

#print axioms NoThreeLine.FiniteWitnessMoments.tendsto_logPairBudget_normalized
#print axioms NoThreeLine.FiniteWitnessMoments.tendsto_logarithmicMomentEnvelope
