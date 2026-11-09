import NoThreeLine.TwoStarDyadicSum

/-! G2: the actual off-baseline sum of products of grid-line lengths is
uniformly subpower above n^2. The divisor and dyadic-count inputs are
proved theorems, not assumptions. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.TwoStar
open PrimitiveLines GridLines DivisorSubpower DyadicSubpower

theorem divisorCap_le_const_rpow (ε : ℝ) (hε : 0<ε) :
    ∃ C : ℝ, 0<C ∧ ∀ n : ℕ, (divisorCap n : ℝ)≤C*(n : ℝ)^(2*ε) := by
  obtain ⟨C,hC,hτ⟩ := card_divisors_le_const_rpow ε hε
  refine ⟨C*(2 : ℝ)^ε,by positivity,?_⟩
  intro n
  obtain ⟨D,hD,hmax⟩ := Finset.exists_mem_eq_sup (Finset.range (2*n^2+1))
    ⟨0,Finset.mem_range.mpr (by omega)⟩ (fun D=>D.divisors.card)
  change (((Finset.range (2*n^2+1)).sup (fun D=>D.divisors.card) : ℕ) : ℝ)≤_
  rw [hmax]
  by_cases h0 : D=0
  · simp only [h0,Nat.divisors_zero,Finset.card_empty,Nat.cast_zero]
    positivity
  have hDb : D≤2*n^2 := by have := Finset.mem_range.mp hD; omega
  have hp : (D : ℝ)^ε≤(2 : ℝ)^ε*(n : ℝ)^(2*ε) := by
    calc
      _ ≤ (2*(n : ℝ)^2)^ε := Real.rpow_le_rpow (Nat.cast_nonneg D)
        (by exact_mod_cast hDb) hε.le
      _ = _ := by
        rw [Real.mul_rpow (by norm_num) (sq_nonneg _),
          ←Real.rpow_natCast_mul (Nat.cast_nonneg n) 2 ε]
        norm_num
  calc
    _ ≤ C*(D : ℝ)^ε := hτ D (Nat.pos_of_ne_zero h0)
    _ ≤ C*((2 : ℝ)^ε*(n : ℝ)^(2*ε)) := mul_le_mul_of_nonneg_left hp hC.le
    _ = _ := by ring

/-- Position-uniform two-star kernel. Coincident roots give an empty
off-baseline sum and are harmless; no distance from the baseline is assumed. -/
theorem twoStarSum_le_const_rpow (ξ : ℝ) (hξ : 0<ξ) :
    ∃ C : ℝ, 0<C ∧ ∀ (n : ℕ) (a b : Grid n),
      (twoStarSum a b : ℝ)≤C*(n : ℝ)^(2+ξ) := by
  let ε : ℝ := ξ/4
  have hε : 0<ε := by dsimp [ε]; positivity
  obtain ⟨C,hC,hcap⟩ := divisorCap_le_const_rpow ε hε
  have hA := shellCountCoefficient_pos ε
  refine ⟨864*(shellCountCoefficient ε)^2*C,by positivity,?_⟩
  intro n a b
  have hn : 0<n := (Nat.zero_le a.1.val).trans_lt a.1.isLt
  have hnR : (0 : ℝ)<n := by exact_mod_cast hn
  have hs : (twoStarSum a b : ℝ)≤
      (((Nat.clog 2 n+1 : ℕ) : ℝ)^2)*(864*(n : ℝ)^2*(divisorCap n : ℝ)) := by
    exact_mod_cast twoStarSum_le_dyadic a b
  have hk := dyadic_count_le ε hε n hn
  have hk2 := pow_le_pow_left₀ (Nat.cast_nonneg (Nat.clog 2 n+1)) hk 2
  have hpow : (n : ℝ)^(2+ξ)=
      (n : ℝ)^ε*(n : ℝ)^ε*(n : ℝ)^2*(n : ℝ)^(2*ε) := by
    have he : 2+ξ=ε+ε+2+2*ε := by dsimp [ε]; ring
    rw [he,Real.rpow_add hnR,Real.rpow_add hnR,Real.rpow_add hnR]
    norm_num
  calc
    _ ≤ (((Nat.clog 2 n+1 : ℕ) : ℝ)^2)*(864*(n : ℝ)^2*(divisorCap n : ℝ)) := hs
    _ ≤ (shellCountCoefficient ε*(n : ℝ)^ε)^2*
        (864*(n : ℝ)^2*(C*(n : ℝ)^(2*ε))) :=
      mul_le_mul hk2 (mul_le_mul_of_nonneg_left (hcap n) (by positivity))
        (by positivity) (sq_nonneg _)
    _ = _ := by rw [hpow]; ring

/-- The same theorem with the actual line sum exposed. -/
theorem off_baseline_line_product_sum_le (ξ : ℝ) (hξ : 0<ξ) :
    ∃ C : ℝ, 0<C ∧ ∀ (n : ℕ) (a b : Grid n),
      (∑ q∈Finset.univ.filter (fun q=>orientedArea a b q≠0),
        ((lineThrough a q).card : ℝ)*((lineThrough b q).card : ℝ))≤C*(n : ℝ)^(2+ξ) := by
  classical
  obtain ⟨C,hC,hbound⟩ := twoStarSum_le_const_rpow ξ hξ
  refine ⟨C,hC,?_⟩
  intro n a b
  simpa only [twoStarSum,offBaselineCauses,Nat.cast_sum,Nat.cast_mul] using hbound n a b

end NoThreeLine.TwoStar

#print axioms NoThreeLine.TwoStar.divisorCap_le_const_rpow
#print axioms NoThreeLine.TwoStar.twoStarSum_le_const_rpow
#print axioms NoThreeLine.TwoStar.off_baseline_line_product_sum_le
