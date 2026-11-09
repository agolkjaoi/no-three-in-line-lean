import NoThreeLine.ShellLineLengths
import Mathlib.Analysis.PSeries

/-! The cubic length budget for actual primitive board directions. The
inverse-square tail is bounded uniformly, so no logarithmic factor remains. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.FiniteDirections
open PrimitiveLines

theorem sum_inverse_height_cube_le (n : ℕ) :
    (∑d ∈ directionIndices n, (1 : ℝ)/(d.1 : ℝ)^3) ≤ 8 := by
  rw [directionIndices,Finset.sum_sigma]
  have hsum : (∑h ∈ Finset.Ico 1 n, (1 : ℝ)/(h : ℝ)^2) ≤ 2 := by
    have he : Finset.Ico 1 n=Finset.Ioo 0 n := by
      ext h
      simp only [Finset.mem_Ico,Finset.mem_Ioo]
      omega
    rw [he]
    simpa only [one_div,Nat.cast_zero,zero_add,div_one] using (sum_Ioo_inv_sq_le (α := ℝ) 0 n)
  calc
    _ ≤ ∑h ∈ Finset.Ico 1 n, (4 : ℝ)/(h : ℝ)^2 := by
      apply Finset.sum_le_sum
      intro h hh
      have hp : 0<h := (Finset.mem_Ico.mp hh).1
      have hpR : (0 : ℝ)<h := by exact_mod_cast hp
      have hc : ((primitiveShell h).card : ℝ)≤4*(h : ℝ) := by exact_mod_cast primitiveShell_card_le h hp
      simp only [Finset.sum_const,nsmul_eq_mul]
      apply (mul_le_mul_of_nonneg_right hc (by positivity : 0≤(1 : ℝ)/(h : ℝ)^3)).trans
      exact le_of_eq (by field_simp <;> ring)
    _ = 4*∑h ∈ Finset.Ico 1 n, (1 : ℝ)/(h : ℝ)^2 := by
      rw [Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro h _
      ring
    _ ≤ 4*2 := mul_le_mul_of_nonneg_left hsum (by norm_num)
    _ = _ := by norm_num

theorem sum_gridLine_card_cube_le (n : ℕ) (p : ZPoint) :
    (∑d ∈ directionIndices n, ((gridLinePoints n p d.2).card : ℝ)^3) ≤ 64*(n : ℝ)^3 := by
  have hpoint (d : Σ _h : ℕ,ZPoint) (hd : d∈directionIndices n) :
      ((gridLinePoints n p d.2).card : ℝ)^3 ≤ (2*(n : ℝ)/(d.1 : ℝ))^3 :=
    pow_le_pow_left₀ (Nat.cast_nonneg _) (GridLineCard.directionIndex_gridLine_card_le n p d hd) 3
  calc
    _ ≤ ∑d ∈ directionIndices n,(2*(n : ℝ)/(d.1 : ℝ))^3 := Finset.sum_le_sum hpoint
    _ = 8*(n : ℝ)^3*∑d ∈ directionIndices n,(1 : ℝ)/(d.1 : ℝ)^3 := by
      rw [Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro d _
      ring
    _ ≤ 8*(n : ℝ)^3*8 := mul_le_mul_of_nonneg_left (sum_inverse_height_cube_le n) (by positivity)
    _ = _ := by ring

end NoThreeLine.FiniteDirections

#print axioms NoThreeLine.FiniteDirections.sum_gridLine_card_cube_le
