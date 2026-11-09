import NoThreeLine.GridLineCard
import NoThreeLine.ParityHarmonic

/-! Logarithmic square-length budget over the actual primitive directions. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.FiniteDirections
open PrimitiveLines

theorem sum_inverse_height_sq_le (n : ℕ) (hn : 0<n) :
    (∑d∈directionIndices n,(1:ℝ)/(d.1:ℝ)^2)≤4*(1+Real.log n) := by
  rw [directionIndices,Finset.sum_sigma]
  have hhar : (harmonic n:ℝ)≤1+Real.log n := by
    simpa only [Nat.floor_natCast] using harmonic_floor_le_one_add_log (n:ℝ) (by exact_mod_cast hn)
  calc
    _ ≤ ∑h∈Finset.Ico 1 n,(4:ℝ)/(h:ℝ) := by
      apply Finset.sum_le_sum
      intro h hh
      have hp : 0<h := (Finset.mem_Ico.mp hh).1
      have hpR : (0:ℝ)<h := by exact_mod_cast hp
      have hc : ((primitiveShell h).card:ℝ)≤4*(h:ℝ) := by exact_mod_cast primitiveShell_card_le h hp
      simp only [Finset.sum_const,nsmul_eq_mul]
      apply (mul_le_mul_of_nonneg_right hc (by positivity : 0≤(1:ℝ)/(h:ℝ)^2)).trans
      exact le_of_eq (by field_simp)
    _ ≤ ∑h∈Finset.Icc 1 n,(4:ℝ)/(h:ℝ) := by
      apply Finset.sum_le_sum_of_subset_of_nonneg
      · intro h hh
        exact Finset.mem_Icc.mpr ⟨(Finset.mem_Ico.mp hh).1,(Finset.mem_Ico.mp hh).2.le⟩
      · intro h _ _
        positivity
    _ = 4*(harmonic n:ℝ) := by
      rw [real_harmonic_eq_sum,Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro h _
      ring
    _ ≤ 4*(1+Real.log n) := mul_le_mul_of_nonneg_left hhar (by norm_num)

theorem sum_gridLine_card_sq_le (n : ℕ) (p : ZPoint) (hn : 0<n) :
    (∑d∈directionIndices n,((gridLinePoints n p d.2).card:ℝ)^2)≤16*(n:ℝ)^2*(1+Real.log n) := by
  have hpoint (d : Σ _h : ℕ,ZPoint) (hd : d∈directionIndices n) :
      ((gridLinePoints n p d.2).card:ℝ)^2≤(2*(n:ℝ)/(d.1:ℝ))^2 :=
    pow_le_pow_left₀ (Nat.cast_nonneg _) (GridLineCard.directionIndex_gridLine_card_le n p d hd) 2
  calc
    _ ≤ ∑d∈directionIndices n,(2*(n:ℝ)/(d.1:ℝ))^2 := Finset.sum_le_sum hpoint
    _ = 4*(n:ℝ)^2*∑d∈directionIndices n,(1:ℝ)/(d.1:ℝ)^2 := by
      rw [Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro d _
      ring
    _ ≤ 4*(n:ℝ)^2*(4*(1+Real.log n)) :=
      mul_le_mul_of_nonneg_left (sum_inverse_height_sq_le n hn) (by positivity)
    _ = _ := by ring

end NoThreeLine.FiniteDirections

#print axioms NoThreeLine.FiniteDirections.sum_inverse_height_sq_le
#print axioms NoThreeLine.FiniteDirections.sum_gridLine_card_sq_le
