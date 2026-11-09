import NoThreeLine.LongLinePrices
import NoThreeLine.RootLineLengthSum

/-! A crude logarithmic bound on the actual long birth-price mean, used
only for error terms. The sharp common main budget is left unchanged. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open FinitePhase FiniteDirections PrimitiveLines GridLines

theorem longBirthMean_le_coarse_log {J n : ℕ} (s : Schedule J)
    (mask : Fin J→Grid n→ℝ) (hm : ∀j q,0≤mask j q ∧ mask j q≤1)
    (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) :
    (∑z : Grid n,longBirthPrice s mask Γ p H z)≤16*s.total^2*(1+Real.log n) := by
  classical
  have hn : (0:ℝ)<n := by exact_mod_cast (Nat.zero_le p.1.val).trans_lt p.1.isLt
  have hpoint (z : Grid n) : longBirthPrice s mask Γ p H z≤
      (s.total^2/(n:ℝ)^2)*(if z≠p then ((lineThrough p z).card:ℝ) else 0) := by
    by_cases hz : z≠p
    · rw [if_pos hz]
      convert longBirthPrice_le_line_length s mask hm Γ p H z using 1 <;> ring
    · have hz' : z=p := not_ne_iff.mp hz
      rw [if_neg hz,hz',longBirthPrice_zero_of_not_eligible s mask Γ p H p (fun h=>h.1 rfl)]
      simp
  calc
    _ ≤ ∑z : Grid n,(s.total^2/(n:ℝ)^2)*(if z≠p then ((lineThrough p z).card:ℝ) else 0) :=
      Finset.sum_le_sum (fun z _=>hpoint z)
    _ = (s.total^2/(n:ℝ)^2)*rootLineLengthSum p := by rw [←Finset.mul_sum]; rfl
    _ ≤ (s.total^2/(n:ℝ)^2)*(16*(n:ℝ)^2*(1+Real.log n)) :=
      mul_le_mul_of_nonneg_left (rootLineLengthSum_le_log p) (div_nonneg (sq_nonneg _) (sq_nonneg _))
    _ = _ := by field_simp [ne_of_gt hn] <;> ring

theorem longBirthMean_le_coarse_log_of_total_le {J n : ℕ} (s : Schedule J)
    (mask : Fin J→Grid n→ℝ) (hm : ∀j q,0≤mask j q ∧ mask j q≤1)
    (Γ : Finset ZPoint) (p : Grid n) (H T : ℝ) (hT : s.total≤T) :
    (∑z : Grid n,longBirthPrice s mask Γ p H z)≤16*T^2*(1+Real.log n) := by
  have hn : (1:ℝ)≤n := by exact_mod_cast (Nat.zero_le p.1.val).trans_lt p.1.isLt
  have hl : 0≤1+Real.log (n:ℝ) := by linarith [Real.log_nonneg hn]
  exact (longBirthMean_le_coarse_log s mask hm Γ p H).trans
    (mul_le_mul_of_nonneg_right (mul_le_mul_of_nonneg_left (pow_le_pow_left₀ s.total_nonneg hT 2) (by norm_num)) hl)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.longBirthMean_le_coarse_log
#print axioms NoThreeLine.BirthWitness.longBirthMean_le_coarse_log_of_total_le
