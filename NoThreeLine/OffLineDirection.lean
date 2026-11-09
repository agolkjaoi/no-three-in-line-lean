import NoThreeLine.OffLineSubpower

/-! Uniform G3 for any integer direction, including a line whose intersection
with the board is a singleton. No primitive or height assumption remains. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.OffLineDivisors
open PrimitiveLines GridLines GridLineCard

theorem lineThrough_card_le_two_mul {n : ℕ} (p q : Grid n) (hpq : q ≠ p) :
    (lineThrough p q).card ≤ 2*n := by
  have hne : gridEmbed q ≠ gridEmbed p := fun h => hpq (gridEmbed_injective n h)
  have hd : 0 < distance (gridEmbed p) (gridEmbed q) :=
    (displacementGcd_pos _ _ hne).trans_le (displacementGcd_le_distance _ _ hne)
  have hh := (lineThrough_card_mul_distance_le p q hpq).trans
    (Nat.mul_le_mul_left (2*n) (displacementGcd_le_distance _ _ hne))
  apply Nat.le_of_mul_le_mul_left (c := distance (gridEmbed p) (gridEmbed q)) _ hd
  simpa only [mul_comm] using hh

theorem off_directionLine_sum_le_const_rpow (ξ : ℝ) (hξ : 0 < ξ) :
    ∃ C : ℝ, 0 < C ∧ ∀ (n : ℕ) (a p : Grid n) (v : ZPoint),
      det v (gridEmbed p-gridEmbed a) ≠ 0 →
      (∑ q ∈ directionLine a v, ((lineThrough p q).card : ℝ)) ≤ C*(n : ℝ)^(1+ξ) := by
  classical
  obtain ⟨C,hC,hbound⟩ := off_lineThrough_sum_le_const_rpow ξ hξ
  refine ⟨max C 2,lt_of_lt_of_le hC (le_max_left _ _),?_⟩
  intro n a p v hp
  by_cases hb : ∃ b ∈ directionLine a v, b ≠ a
  · obtain ⟨b,hb,hba⟩ := hb
    have hv : v ≠ (0,0) := by intro he; apply hp; simp [he,det]
    have he := directionLine_eq_lineThrough a b v hv (Ne.symm hba) hb
    have hp' : orientedArea a b p ≠ 0 := by
      intro hh
      apply hp
      have hm : p ∈ directionLine a v := by
        rw [he]
        exact (mem_lineThrough _ _ _).mpr hh
      exact (mem_gridLinePoints _ _ _).mp hm
    rw [he]
    exact (hbound n a b p hp').trans
      (mul_le_mul_of_nonneg_right (le_max_left _ _) (Real.rpow_nonneg (Nat.cast_nonneg n) _))
  · have hsub : directionLine a v ⊆ {a} := by
      intro q hq
      exact Finset.mem_singleton.mpr (by by_contra he; exact hb ⟨q,hq,he⟩)
    have hap : a ≠ p := by intro he; apply hp; subst a; simp [det]
    have hn : (1 : ℝ) ≤ n := by exact_mod_cast (Nat.zero_le a.1.val).trans_lt a.1.isLt
    have hn0 : (0 : ℝ) < n := lt_of_lt_of_le zero_lt_one hn
    have hnPow : (n : ℝ) ≤ (n : ℝ)^(1+ξ) := by
      rw [Real.rpow_add hn0,Real.rpow_one]
      simpa only [mul_one] using mul_le_mul_of_nonneg_left (Real.one_le_rpow hn hξ.le) hn0.le
    calc
      _ ≤ ∑ q ∈ ({a} : Finset (Grid n)), ((lineThrough p q).card : ℝ) :=
        Finset.sum_le_sum_of_subset_of_nonneg hsub (fun _ _ _ => Nat.cast_nonneg _)
      _ = ((lineThrough p a).card : ℝ) := by simp
      _ ≤ 2*(n : ℝ) := by exact_mod_cast lineThrough_card_le_two_mul p a hap
      _ ≤ 2*(n : ℝ)^(1+ξ) := mul_le_mul_of_nonneg_left hnPow (by norm_num)
      _ ≤ _ := mul_le_mul_of_nonneg_right (le_max_right _ _) (Real.rpow_nonneg hn0.le _)

end NoThreeLine.OffLineDivisors

#print axioms NoThreeLine.OffLineDivisors.off_directionLine_sum_le_const_rpow
