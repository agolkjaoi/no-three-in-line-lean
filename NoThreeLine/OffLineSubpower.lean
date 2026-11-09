import NoThreeLine.OffLineDyadicSum

/-! A root-uniform off-line sum of actual grid line lengths. The divisor
and dyadic-shell exponents are supplied internally, with no geometric
sum bound as a hypothesis. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.OffLineDivisors
open PrimitiveLines GridLines GridLineCard FiniteDirections DyadicSubpower DivisorSubpower

theorem off_line_sum_le_const_rpow (ξ : ℝ) (hξ : 0 < ξ) :
    ∃ C : ℝ, 0 < C ∧ ∀ (n : ℕ), 0 < n → ∀ (a p : Grid n) (v : ZPoint),
      Primitive v → height v ≤ n → det v (gridEmbed p-gridEmbed a) ≠ 0 →
      (∑ q ∈ gridLinePoints n (gridEmbed a) v, ((lineThrough p q).card : ℝ)) ≤
        C*(n : ℝ)^(1+ξ) := by
  let ε : ℝ := ξ/3
  have hε : 0 < ε := by dsimp [ε]; positivity
  obtain ⟨C,hC,hτ⟩ := card_divisors_le_const_rpow ε hε
  have hA : 0 < shellCountCoefficient ε := shellCountCoefficient_pos ε
  refine ⟨12*C*(2 : ℝ)^ε*shellCountCoefficient ε,by positivity,?_⟩
  intro n hn a p v hv hvn hp
  let D : ℕ := (det v (gridEmbed p-gridEmbed a)).natAbs
  have hD : 0 < D := Nat.pos_of_ne_zero (fun h => hp (Int.natAbs_eq_zero.mp h))
  have hDb : D ≤ 2*n^2 := grid_determinant_le a p v hvn
  have hpD : (D : ℝ)^ε ≤ (2 : ℝ)^ε*(n : ℝ)^(2*ε) := by
    calc
      _ ≤ (2*(n : ℝ)^2)^ε := Real.rpow_le_rpow (Nat.cast_nonneg D) (by exact_mod_cast hDb) hε.le
      _ = _ := by
        rw [Real.mul_rpow (by norm_num) (sq_nonneg _),← Real.rpow_natCast_mul (Nat.cast_nonneg n) 2 ε]
        norm_num
  have hτ' : (D.divisors.card : ℝ) ≤ C*((2 : ℝ)^ε*(n : ℝ)^(2*ε)) :=
    (hτ D hD).trans (mul_le_mul_of_nonneg_left hpD hC.le)
  have hk := dyadic_count_le ε hε n hn
  have hs : (∑ q ∈ gridLinePoints n (gridEmbed a) v, ((lineThrough p q).card : ℝ)) ≤
      ((Nat.clog 2 n+1 : ℕ) : ℝ)*(12*(n : ℝ)*(D.divisors.card : ℝ)) := by
    exact_mod_cast sum_lineThrough_card_le_dyadic (gridEmbed a) v p hv hp
  have hnR : (0 : ℝ) < n := by exact_mod_cast hn
  have hex : 1+ξ=ε+1+2*ε := by dsimp [ε]; ring
  have hpow : (n : ℝ)^(1+ξ)=(n : ℝ)^ε*(n : ℝ)*(n : ℝ)^(2*ε) := by
    rw [hex,Real.rpow_add hnR,Real.rpow_add hnR,Real.rpow_one]
  calc
    _ ≤ ((Nat.clog 2 n+1 : ℕ) : ℝ)*(12*(n : ℝ)*(D.divisors.card : ℝ)) := hs
    _ ≤ (shellCountCoefficient ε*(n : ℝ)^ε)*
        (12*(n : ℝ)*(C*((2 : ℝ)^ε*(n : ℝ)^(2*ε)))) :=
      mul_le_mul hk (mul_le_mul_of_nonneg_left hτ' (by positivity))
        (by positivity) (mul_nonneg hA.le (Real.rpow_nonneg (Nat.cast_nonneg n) ε))
    _ = _ := by rw [hpow]; ring

/-- G3 for a genuine baseline through two grid points. Its primitive
direction and height bound are derived from the actual point difference. -/
theorem off_lineThrough_sum_le_const_rpow (ξ : ℝ) (hξ : 0 < ξ) :
    ∃ C : ℝ, 0 < C ∧ ∀ (n : ℕ) (a b p : Grid n), orientedArea a b p ≠ 0 →
      (∑ q ∈ lineThrough a b, ((lineThrough p q).card : ℝ)) ≤ C*(n : ℝ)^(1+ξ) := by
  classical
  obtain ⟨C,hC,hbound⟩ := off_line_sum_le_const_rpow ξ hξ
  refine ⟨C,hC,?_⟩
  intro n a b p hp
  have hba : b ≠ a := by
    intro he
    subst b
    apply hp
    simp [orientedArea]
  obtain ⟨d,hd,hline⟩ := grid_point_direction a b hba
  have hm := Finset.mem_sigma.mp hd
  have hv : Primitive d.2 := (Finset.mem_filter.mp hm.2).2
  have hh : height d.2 ≤ n := by
    rw [height_eq_of_mem_shell d.1 d.2 hm.2]
    exact (Finset.mem_Ico.mp hm.1).2.le
  have hp' : det d.2 (gridEmbed p-gridEmbed a) ≠ 0 := fun h => hp ((hline p).mp h)
  have he : lineThrough a b=gridLinePoints n (gridEmbed a) d.2 := by
    ext q
    rw [mem_lineThrough,mem_gridLinePoints]
    exact (hline q).symm
  rw [he]
  exact hbound n ((Nat.zero_le a.1.val).trans_lt a.1.isLt) a p d.2 hv hh hp'

end NoThreeLine.OffLineDivisors

#print axioms NoThreeLine.OffLineDivisors.off_line_sum_le_const_rpow
#print axioms NoThreeLine.OffLineDivisors.off_lineThrough_sum_le_const_rpow
