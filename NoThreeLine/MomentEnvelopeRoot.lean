import NoThreeLine.BoundedMomentDual
import Mathlib.Analysis.SpecialFunctions.Pow.Continuity

/-! Nonnegative roots of deterministic moment coefficients. Taking the
positive part allows signed scalar envelopes while preserving limits 1
and 0. The actual stochastic moment remains supplied separately. -/
set_option autoImplicit false
noncomputable section
open Filter
open scoped Topology

namespace NoThreeLine.FiniteMomentIntegral

def positiveMomentRoot (m : ℕ) (x : ℝ) : ℝ := (max 0 x)^((m:ℝ)⁻¹)

theorem positiveMomentRoot_nonneg (m : ℕ) (x : ℝ) : 0≤positiveMomentRoot m x :=
  Real.rpow_nonneg (le_max_left _ _) _

theorem positiveMomentRoot_pow (m : ℕ) (hm : 0<m) (x : ℝ) :
    positiveMomentRoot m x^m=max 0 x :=
  Real.rpow_inv_natCast_pow (le_max_left _ _) (Nat.ne_of_gt hm)

theorem momentEnvelope_le_root_sum (m : ℕ) (hm : 0<m) (A E D Q : ℝ)
    (hD : 0≤D) (hQ : 0≤Q) :
    A*D^m+E*Q^m≤(positiveMomentRoot m A*D+positiveMomentRoot m E*Q)^m := by
  calc
    _ ≤ max 0 A*D^m+max 0 E*Q^m :=
      add_le_add (mul_le_mul_of_nonneg_right (le_max_right _ _) (pow_nonneg hD m))
        (mul_le_mul_of_nonneg_right (le_max_right _ _) (pow_nonneg hQ m))
    _ = (positiveMomentRoot m A*D)^m+(positiveMomentRoot m E*Q)^m := by
      rw [mul_pow,mul_pow,positiveMomentRoot_pow m hm,positiveMomentRoot_pow m hm]
    _ ≤ _ := pow_add_pow_le (mul_nonneg (positiveMomentRoot_nonneg _ _) hD)
      (mul_nonneg (positiveMomentRoot_nonneg _ _) hQ) (Nat.ne_of_gt hm)

theorem positiveMomentRoot_continuous (m : ℕ) : Continuous (positiveMomentRoot m) :=
  (Real.continuous_rpow_const (inv_nonneg.mpr (Nat.cast_nonneg m))).comp
    (continuous_const.max continuous_id)

theorem positiveMomentRoot_one (m : ℕ) : positiveMomentRoot m 1=1 := by
  simp [positiveMomentRoot]

theorem positiveMomentRoot_zero (m : ℕ) (hm : 0<m) : positiveMomentRoot m 0=0 := by
  simp only [positiveMomentRoot,max_self]
  exact Real.zero_rpow (ne_of_gt (inv_pos.mpr (by exact_mod_cast hm)))

end NoThreeLine.FiniteMomentIntegral

#print axioms NoThreeLine.FiniteMomentIntegral.momentEnvelope_le_root_sum
#print axioms NoThreeLine.FiniteMomentIntegral.positiveMomentRoot_continuous
