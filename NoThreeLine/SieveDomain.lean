import NoThreeLine.SieveReindex
import Mathlib.Algebra.Order.Floor.Semifield

set_option autoImplicit false
open scoped BigOperators

namespace NoThreeLine

/-- Coordinates are `(a,h)`. The parity parameters are ordered `(h%2,a%2)`. -/
def sieveDomain (N ε η : ℕ) : Finset (ℕ × ℕ) :=
  ((Finset.Icc 1 N).product (Finset.Icc 1 N)).filter
    (fun z => z.1 ≤ z.2 ∧ z.2 % 2 = ε ∧ z.1 % 2 = η)

theorem mem_sieveDomain (N ε η : ℕ) (z : ℕ × ℕ) :
    z ∈ sieveDomain N ε η ↔
      1 ≤ z.2 ∧ z.2 ≤ N ∧ 1 ≤ z.1 ∧ z.1 ≤ z.2 ∧ z.2 % 2 = ε ∧ z.1 % 2 = η := by
  rcases z with ⟨a, h⟩
  simp only [sieveDomain, Finset.product_eq_sprod, Finset.mem_filter,
    Finset.mem_product, Finset.mem_Icc]
  omega

theorem scalePair_mem_domain_iff (d N ε η : ℕ) (z : ℕ × ℕ)
    (hd : 0 < d) (hodd : Odd d) :
    scalePair d z ∈ sieveDomain N ε η ↔ z ∈ sieveDomain (N / d) ε η := by
  have hpos (b : ℕ) : 1 ≤ d * b ↔ 1 ≤ b := by
    constructor
    · intro h
      by_contra hb
      have hb0 : b = 0 := by omega
      simp [hb0] at h
    · intro h
      have := Nat.mul_le_mul hd h
      simpa using this
  have hupper : d * z.2 ≤ N ↔ z.2 ≤ N / d := by
    simpa only [Nat.mul_comm] using (Nat.le_div_iff_mul_le hd).symm
  simp only [mem_sieveDomain, scalePair, hpos, hupper,
    Nat.mul_le_mul_left_iff hd, odd_mul_mod_two d _ hodd]

theorem quotient_scalePair (d : ℕ) (z : ℕ × ℕ) (hd : 0 < d) :
    quotientPair d (scalePair d z) = z := by
  simp [quotientPair, scalePair, Nat.mul_div_cancel_left _ hd]

/-- Exact triangular range and parity reindexing, including N < d and N = 0. -/
theorem quotient_domain_eq (d N ε η : ℕ) (hd : 0 < d) (hodd : Odd d) :
    (divisiblePairs d (sieveDomain N ε η)).image (quotientPair d) =
      sieveDomain (N / d) ε η := by
  ext q
  constructor
  · intro hq
    obtain ⟨z, hz, rfl⟩ := Finset.mem_image.mp hq
    have hparts := Finset.mem_filter.mp hz
    apply (scalePair_mem_domain_iff d N ε η (quotientPair d z) hd hodd).mp
    rw [scale_quotientPair d z hparts.2]
    exact hparts.1
  · intro hq
    apply Finset.mem_image.mpr
    refine ⟨scalePair d q, ?_, quotient_scalePair d q hd⟩
    apply Finset.mem_filter.mpr
    exact ⟨(scalePair_mem_domain_iff d N ε η q hd hodd).mpr hq,
      dvd_mul_right d q.1, dvd_mul_right d q.2⟩

/-- The weight in both J and the primitive/sieved sums. -/
noncomputable def directionWeight (w : ℝ → ℝ) (z : ℕ × ℕ) : ℝ :=
  (1 / (z.2 : ℝ)^2) * w ((z.1 : ℝ) / (z.2 : ℝ))

theorem directionWeight_scale (d : ℕ) (z : ℕ × ℕ) (w : ℝ → ℝ) (hd : 0 < d) :
    directionWeight w (scalePair d z) =
      (1 / (d : ℝ)^2) * directionWeight w z := by
  have hd' : (d : ℝ) ≠ 0 := by exact_mod_cast Nat.ne_of_gt hd
  unfold directionWeight scalePair
  simp only [Nat.cast_mul, mul_pow, mul_div_mul_left _ _ hd', one_div, mul_inv_rev]
  ring

/-- Natural cutoff version of J_e(x;w); x=N/d uses exact natural division. -/
noncomputable def parityJ (N ε η : ℕ) (w : ℝ → ℝ) : ℝ :=
  ∑ z ∈ sieveDomain N ε η, directionWeight w z

/-- This identifies the pair-domain definition with the paper's nested sums. -/
theorem parityJ_eq_nested (N ε η : ℕ) (w : ℝ → ℝ) :
    parityJ N ε η w =
      ∑ h ∈ Finset.Icc 1 N, if h % 2 = ε then
        (1 / (h : ℝ)^2) * ∑ a ∈ Finset.Icc 1 h,
          if a % 2 = η then w ((a : ℝ) / (h : ℝ)) else 0
      else 0 := by
  unfold parityJ sieveDomain
  rw [Finset.product_eq_sprod, Finset.sum_filter, Finset.sum_product, Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro h hh
  by_cases he : h % 2 = ε
  · simp only [he, true_and, if_true]
    have hsub : Finset.Icc 1 h ⊆ Finset.Icc 1 N := by
      intro a ha
      exact Finset.mem_Icc.mpr ⟨(Finset.mem_Icc.mp ha).1,
        (Finset.mem_Icc.mp ha).2.trans (Finset.mem_Icc.mp hh).2⟩
    have hcut : (∑ a ∈ Finset.Icc 1 N,
        if a ≤ h ∧ a % 2 = η then directionWeight w (a,h) else 0) =
        ∑ a ∈ Finset.Icc 1 h,
          if a ≤ h ∧ a % 2 = η then directionWeight w (a,h) else 0 := by
      symm
      apply Finset.sum_subset hsub
      intro a ha hnot
      have hanot : ¬a ≤ h := by
        intro hah
        exact hnot (Finset.mem_Icc.mpr ⟨(Finset.mem_Icc.mp ha).1, hah⟩)
      simp [hanot]
    rw [hcut, Finset.mul_sum]
    apply Finset.sum_congr rfl
    intro a ha
    simp only [(Finset.mem_Icc.mp ha).2, true_and, directionWeight]
    split_ifs <;> simp
  · simp [he]

noncomputable def sievedParityJ (P : Finset ℕ) (N ε η : ℕ) (w : ℝ → ℝ) : ℝ :=
  ∑ z ∈ sieveDomain N ε η, sieveIndicator P z.1 z.2 * directionWeight w z

/-- Real cutoffs have exactly their floor interpretation from the paper. -/
noncomputable def realParityJ (x : ℝ) (ε η : ℕ) (w : ℝ → ℝ) : ℝ :=
  parityJ ⌊x⌋₊ ε η w

theorem realParityJ_natCast (N ε η : ℕ) (w : ℝ → ℝ) :
    realParityJ N ε η w = parityJ N ε η w := by simp [realParityJ]

theorem realParityJ_div_natCast (N d ε η : ℕ) (w : ℝ → ℝ) :
    realParityJ ((N : ℝ) / d) ε η w = parityJ (N / d) ε η w := by
  simp only [realParityJ, Nat.floor_div_eq_div]

theorem divisible_direction_sum (d N ε η : ℕ) (w : ℝ → ℝ)
    (hd : 0 < d) (hodd : Odd d) :
    (∑ z ∈ divisiblePairs d (sieveDomain N ε η), directionWeight w z) =
      (1 / (d : ℝ)^2) * parityJ (N / d) ε η w := by
  rw [sum_divisiblePairs_reindex, quotient_domain_eq d N ε η hd hodd]
  simp_rw [directionWeight_scale d _ w hd]
  rw [← Finset.mul_sum]
  rfl

/-- The exact FS2 identity. The cutoff N/product(A) is natural floor division,
so the theorem also covers N smaller than the product of all factors. -/
theorem finite_sieve_parityJ_identity (P : Finset ℕ) (N ε η : ℕ) (w : ℝ → ℝ)
    (hcop : (P : Set ℕ).Pairwise Nat.Coprime) (hodd : ∀ p ∈ P, Odd p) :
    sievedParityJ P N ε η w =
      ∑ A ∈ P.powerset, ((-1 : ℝ)^A.card / (∏ p ∈ A, (p : ℝ))^2) *
        parityJ (N / (∏ p ∈ A, p)) ε η w := by
  unfold sievedParityJ
  rw [finite_sieve_weighted_reindex P (sieveDomain N ε η) (directionWeight w) hcop]
  apply Finset.sum_congr rfl
  intro A hA
  have ho : Odd (∏ p ∈ A, p) := odd_product A
    (fun p hp => hodd p ((Finset.mem_powerset.mp hA) hp))
  have hd : 0 < ∏ p ∈ A, p := by
    have := Nat.odd_iff.mp ho
    omega
  rw [quotient_domain_eq _ N ε η hd ho]
  simp_rw [directionWeight_scale _ _ w hd]
  rw [← Finset.mul_sum]
  simp only [parityJ, Nat.cast_prod]
  ring

theorem finite_sieve_realParityJ_identity (P : Finset ℕ) (N ε η : ℕ) (w : ℝ → ℝ)
    (hcop : (P : Set ℕ).Pairwise Nat.Coprime) (hodd : ∀ p ∈ P, Odd p) :
    sievedParityJ P N ε η w =
      ∑ A ∈ P.powerset, ((-1 : ℝ)^A.card / (∏ p ∈ A, (p : ℝ))^2) *
        realParityJ ((N : ℝ) / (∏ p ∈ A, p : ℕ)) ε η w := by
  simpa only [realParityJ_div_natCast] using
    finite_sieve_parityJ_identity P N ε η w hcop hodd

noncomputable def primitiveParityK (N ε η : ℕ) (w : ℝ → ℝ) : ℝ :=
  ∑ z ∈ sieveDomain N ε η,
    (if Nat.Coprime z.1 z.2 then 1 else 0) * directionWeight w z

theorem directionWeight_nonnegative_on_domain (N ε η : ℕ) (w : ℝ → ℝ)
    (hw : ∀ u ∈ Set.Icc (0 : ℝ) 1, 0 ≤ w u) (z : ℕ × ℕ)
    (hz : z ∈ sieveDomain N ε η) : 0 ≤ directionWeight w z := by
  have hm := (mem_sieveDomain N ε η z).mp hz
  have hh : (0 : ℝ) < z.2 := by exact_mod_cast hm.1
  have hu : (z.1 : ℝ) / z.2 ∈ Set.Icc (0 : ℝ) 1 := by
    constructor
    · positivity
    · apply (div_le_iff₀ hh).mpr
      simpa using (show (z.1 : ℝ) ≤ z.2 by exact_mod_cast hm.2.2.2.1)
  exact mul_nonneg (by positivity) (hw _ hu)

/-- The genuine nonnegative-weight relaxation on the paper's triangular
parity domain, now using the actual h^-2 w(a/h) weight. -/
theorem primitiveParityK_le_sieved (P : Finset ℕ) (N ε η : ℕ) (w : ℝ → ℝ)
    (hP : ∀ p ∈ P, 1 < p) (hw : ∀ u ∈ Set.Icc (0 : ℝ) 1, 0 ≤ w u) :
    primitiveParityK N ε η w ≤ sievedParityJ P N ε η w := by
  exact nonnegative_weighted_sieve P (sieveDomain N ε η) (directionWeight w) hP
    (fun z hz => directionWeight_nonnegative_on_domain N ε η w hw z hz)

theorem primitiveParityK_le_finite_J_sum (P : Finset ℕ) (N ε η : ℕ) (w : ℝ → ℝ)
    (hP : ∀ p ∈ P, 1 < p) (hcop : (P : Set ℕ).Pairwise Nat.Coprime)
    (hodd : ∀ p ∈ P, Odd p) (hw : ∀ u ∈ Set.Icc (0 : ℝ) 1, 0 ≤ w u) :
    primitiveParityK N ε η w ≤
      ∑ A ∈ P.powerset, ((-1 : ℝ)^A.card / (∏ p ∈ A, (p : ℝ))^2) *
        realParityJ ((N : ℝ) / (∏ p ∈ A, p : ℕ)) ε η w := by
  rw [← finite_sieve_realParityJ_identity P N ε η w hcop hodd]
  exact primitiveParityK_le_sieved P N ε η w hP hw

end NoThreeLine

#print axioms NoThreeLine.quotient_domain_eq
#print axioms NoThreeLine.directionWeight_scale
#print axioms NoThreeLine.finite_sieve_parityJ_identity
#print axioms NoThreeLine.parityJ_eq_nested
#print axioms NoThreeLine.primitiveParityK_le_finite_J_sum
