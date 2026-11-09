import Mathlib.MeasureTheory.Integral.IntervalIntegral.FundThmCalculus
import Mathlib.Analysis.Calculus.Deriv.Pow
import Mathlib.Analysis.Calculus.Deriv.Mul
import Mathlib.Analysis.Calculus.Deriv.Add
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring
import Mathlib.Tactic.FunProp

set_option autoImplicit false
open MeasureTheory Set
open scoped Interval

namespace NoThreeLineSecondFollowup

noncomputable def alpha (a b r s : ℝ) : ℝ :=
  if 0 ≤ b then a + b * (r + s) / (r * s) else a + 2 * b / ((r + s) / 2)

noncomputable def beta (b r s : ℝ) : ℝ :=
  if 0 ≤ b then -b / (r * s) else -b / (((r + s) / 2) ^ 2)

theorem secant_difference (a b r s u : ℝ) (hr : r ≠ 0) (hs : s ≠ 0) (hu : u ≠ 0) :
    (a + b * (r + s) / (r * s) + (-b / (r * s)) * u) - (a + b / u) =
      b * (u - r) * (s - u) / (r * s * u) := by
  field_simp
  ring

theorem tangent_difference (a b c u : ℝ) (hc : c ≠ 0) (hu : u ≠ 0) :
    (a + 2 * b / c + (-b / c ^ 2) * u) - (a + b / u) =
      (-b) * (u - c) ^ 2 / (u * c ^ 2) := by
  field_simp
  ring

theorem concrete_affine_dominates (a b r s u : ℝ)
    (hr : 0 < r) (hrs : r < s) (hu : u ∈ Icc r s) :
    a + b / u ≤ alpha a b r s + beta b r s * u := by
  have hs : 0 < s := lt_trans hr hrs
  have hupos : 0 < u := lt_of_lt_of_le hr hu.1
  unfold alpha beta
  split_ifs with hb
  · have he := secant_difference a b r s u (ne_of_gt hr) (ne_of_gt hs) (ne_of_gt hupos)
    have hn : 0 ≤ b * (u-r) * (s-u) / (r*s*u) := by
      exact div_nonneg (mul_nonneg (mul_nonneg hb (sub_nonneg.mpr hu.1))
        (sub_nonneg.mpr hu.2)) (le_of_lt (mul_pos (mul_pos hr hs) hupos))
    linarith
  · have hc : 0 < (r+s)/2 := by linarith
    have he := tangent_difference a b ((r+s)/2) u (ne_of_gt hc) (ne_of_gt hupos)
    have hn : 0 ≤ (-b) * (u-(r+s)/2)^2 / (u*((r+s)/2)^2) := by
      apply div_nonneg
      · exact mul_nonneg (by linarith) (sq_nonneg _)
      · positivity
    linarith

theorem branch_nonnegative (a b r s u : ℝ)
    (hr : 0 < r) (_hrs : r < s) (hu : u ∈ Icc r s)
    (hvr : 0 ≤ a + b/r) (hvs : 0 ≤ a + b/s) : 0 ≤ a + b/u := by
  have hupos : 0 < u := lt_of_lt_of_le hr hu.1
  by_cases hb : 0 ≤ b
  · have hh := one_div_le_one_div_of_le hupos hu.2
    have hm := mul_le_mul_of_nonneg_left hh hb
    simp only [mul_one_div] at hm
    linarith
  · have hh := one_div_le_one_div_of_le hr hu.1
    have hm := mul_le_mul_of_nonpos_left hh (le_of_not_ge hb)
    simp only [mul_one_div] at hm
    linarith

theorem branch_square_le_endpoints (a b r s u : ℝ)
    (hr : 0 < r) (hrs : r < s) (hu : u ∈ Icc r s)
    (hvr : 0 ≤ a + b/r) (hvs : 0 ≤ a + b/s) :
    (a+b/u)^2 ≤ max ((a+b/r)^2) ((a+b/s)^2) := by
  have hupos : 0 < u := lt_of_lt_of_le hr hu.1
  have h0 := branch_nonnegative a b r s u hr hrs hu hvr hvs
  by_cases hb : 0 ≤ b
  · have hh := one_div_le_one_div_of_le hr hu.1
    have hm := mul_le_mul_of_nonneg_left hh hb
    simp only [mul_one_div] at hm
    have hle : a+b/u ≤ a+b/r := by linarith
    exact (pow_le_pow_left₀ h0 hle 2).trans (le_max_left _ _)
  · have hh := one_div_le_one_div_of_le hupos hu.2
    have hm := mul_le_mul_of_nonpos_left hh (le_of_not_ge hb)
    simp only [mul_one_div] at hm
    have hle : a+b/u ≤ a+b/s := by linarith
    exact (pow_le_pow_left₀ h0 hle 2).trans (le_max_right _ _)

theorem integral_affine_square (A B r s : ℝ) :
    (∫ u in r..s, (A+B*u)^2) =
      (s-r)/3 * ((A+B*r)^2+(A+B*r)*(A+B*s)+(A+B*s)^2) := by
  have hi : IntervalIntegrable (fun u : ℝ => (A+B*u)^2) volume r s :=
    (by fun_prop : Continuous (fun u : ℝ => (A+B*u)^2)).intervalIntegrable r s
  have hd (u : ℝ) : HasDerivAt
      (fun u : ℝ => A^2*u + (A*B)*u^2 + (B^2/3)*u^3) ((A+B*u)^2) u := by
    have hd' : HasDerivAt
        (fun v : ℝ => A^2*v + (A*B)*v^2 + (B^2/3)*v^3)
        (A^2 + (A*B)*(2*u) + (B^2/3)*(3*u^2)) u := by
      simpa only [Pi.add_apply, Pi.pow_apply, id_eq, Nat.cast_ofNat, Nat.reduceSub,
        pow_one, mul_one] using!
        (((hasDerivAt_id u).const_mul (A^2)).add
          (((hasDerivAt_id u).pow 2).const_mul (A*B))).add
          (((hasDerivAt_id u).pow 3).const_mul (B^2/3))
    have hnum : A^2 + (A*B)*(2*u) + (B^2/3)*(3*u^2) = (A+B*u)^2 := by ring
    rw [hnum] at hd'
    exact hd'
  rw [intervalIntegral.integral_eq_sub_of_hasDerivAt (fun u _ => hd u) hi]
  ring

theorem concrete_branch_integral_soundness (a b r s : ℝ)
    (hr : 0 < r) (hrs : r < s) (hvr : 0 ≤ a+b/r) (hvs : 0 ≤ a+b/s) :
    (∫ u in r..s, (a+b/u)^2) ≤
      min ((s-r)*max ((a+b/r)^2) ((a+b/s)^2))
        ((s-r)/3 * ((alpha a b r s + beta b r s*r)^2 +
          (alpha a b r s + beta b r s*r)*(alpha a b r s + beta b r s*s) +
          (alpha a b r s + beta b r s*s)^2)) := by
  have hc : ContinuousOn (fun u : ℝ => a+b/u) (Icc r s) := by
    apply continuousOn_const.add
    apply continuousOn_const.div continuousOn_id
    intro u hu
    exact ne_of_gt (lt_of_lt_of_le hr hu.1)
  have hv : IntervalIntegrable (fun u : ℝ => (a+b/u)^2) volume r s :=
    (hc.pow 2).intervalIntegrable_of_Icc hrs.le
  have hl : IntervalIntegrable (fun u : ℝ => (alpha a b r s + beta b r s*u)^2) volume r s :=
    (by fun_prop : Continuous (fun u : ℝ => (alpha a b r s + beta b r s*u)^2)).intervalIntegrable r s
  apply le_min
  · have hi := intervalIntegral.integral_mono_on hrs.le hv
        (intervalIntegrable_const : IntervalIntegrable
          (fun _ : ℝ => max ((a+b/r)^2) ((a+b/s)^2)) volume r s)
        (fun u hu => branch_square_le_endpoints a b r s u hr hrs hu hvr hvs)
    simpa only [intervalIntegral.integral_const, smul_eq_mul] using hi
  · have hi := intervalIntegral.integral_mono_on hrs.le hv hl (fun u hu =>
      pow_le_pow_left₀ (branch_nonnegative a b r s u hr hrs hu hvr hvs)
        (concrete_affine_dominates a b r s u hr hrs hu) 2)
    rw [integral_affine_square] at hi
    exact hi

theorem zero_first_branch (a s : ℝ) :
    (∫ _u in (0 : ℝ)..s, a^2) = s*a^2 := by simp

end NoThreeLineSecondFollowup

#print axioms NoThreeLineSecondFollowup.concrete_affine_dominates
#print axioms NoThreeLineSecondFollowup.integral_affine_square
#print axioms NoThreeLineSecondFollowup.concrete_branch_integral_soundness
#print axioms NoThreeLineSecondFollowup.zero_first_branch
