import Mathlib.NumberTheory.ArithmeticFunction.Misc
import Mathlib.Analysis.SpecialFunctions.Pow.Asymptotics
import Mathlib.Algebra.Order.Field.Power
import Mathlib.Algebra.Order.BigOperators.GroupWithZero.Finset
import Mathlib.Tactic

/-! A finite, epsilon-dependent constant bounds the actual natural divisor
count by every positive real power. Small-prime factors are paid once, while
large-prime factors are absorbed into the power of the integer itself. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.DivisorSubpower

def primeCoefficient (ε : ℝ) (p : ℕ) : ℝ :=
  max 1 (((p : ℝ)^ε)/((p : ℝ)^ε-1))

def smallPrimeConstant (ε : ℝ) (K : ℕ) : ℝ :=
  ∏ p ∈ (Finset.range K).filter Nat.Prime, primeCoefficient ε p

theorem primeCoefficient_one_le (ε : ℝ) (p : ℕ) : 1 ≤ primeCoefficient ε p :=
  le_max_left _ _

theorem smallPrimeConstant_one_le (ε : ℝ) (K : ℕ) : 1 ≤ smallPrimeConstant ε K :=
  Finset.one_le_prod (fun p _ => primeCoefficient_one_le ε p)

theorem exists_prime_cutoff (ε : ℝ) (hε : 0 < ε) :
    ∃ K : ℕ, ∀ p : ℕ, K ≤ p → 2 ≤ (p : ℝ)^ε := by
  have ht : Filter.Tendsto (fun p : ℕ => (p : ℝ)^ε) Filter.atTop Filter.atTop :=
    (tendsto_rpow_atTop hε).comp tendsto_natCast_atTop_atTop
  exact Filter.eventually_atTop.mp (ht.eventually_ge_atTop 2)

theorem prime_power_factor_le (ε : ℝ) (hε : 0 < ε) (p e : ℕ) (hp : p.Prime) :
    (e : ℝ)+1 ≤ primeCoefficient ε p*((p : ℝ)^ε)^e := by
  let q : ℝ := (p : ℝ)^ε
  have hq : 1 < q := Real.one_lt_rpow (by exact_mod_cast hp.one_lt) hε
  have hb := Nat.cast_le_pow_div_sub hq (e+1)
  change (e : ℝ)+1 ≤ max 1 (q/(q-1))*q^e
  calc
    _ ≤ q^(e+1)/(q-1) := by simpa only [Nat.cast_add,Nat.cast_one] using hb
    _ = (q/(q-1))*q^e := by rw [pow_succ]; ring
    _ ≤ _ := mul_le_mul_of_nonneg_right (le_max_right _ _) (pow_nonneg (le_of_lt (lt_trans zero_lt_one hq)) _)

theorem large_prime_power_factor_le (ε : ℝ) (p e : ℕ) (hp : 2 ≤ (p : ℝ)^ε) :
    (e : ℝ)+1 ≤ ((p : ℝ)^ε)^e := by
  have hb : 1+(e : ℝ) ≤ (2 : ℝ)^e := by
    simpa only [show (2 : ℝ)-1=1 by norm_num,mul_one] using
      one_add_mul_sub_le_pow (show (-1 : ℝ) ≤ 2 by norm_num) e
  have hb' : (e : ℝ)+1 ≤ (2 : ℝ)^e := by simpa only [add_comm] using hb
  exact hb'.trans (pow_le_pow_left₀ (by norm_num) hp _)

theorem factorization_rpow (ε : ℝ) (N : ℕ) (hN : N ≠ 0) :
    (∏ p ∈ N.primeFactors, ((p : ℝ)^ε)^(N.factorization p)) = (N : ℝ)^ε := by
  simp_rw [Real.rpow_pow_comm (Nat.cast_nonneg _) ε]
  rw [Real.finsetProd_rpow _ _ (fun p _ => pow_nonneg (Nat.cast_nonneg p) _) ε]
  congr 1
  exact_mod_cast (Nat.prod_primeFactors_pow_factorization hN).symm

/-- Only the finitely many primes below the cutoff contribute extra factors. -/
theorem coefficient_product_le (ε : ℝ) (K N : ℕ) :
    (∏ p ∈ N.primeFactors, if p < K then primeCoefficient ε p else 1) ≤
      smallPrimeConstant ε K := by
  rw [← Finset.prod_filter]
  apply Finset.prod_le_prod_of_subset_of_one_le
  · intro p hp
    exact Finset.mem_filter.mpr ⟨Finset.mem_range.mpr (Finset.mem_filter.mp hp).2,
      Nat.prime_of_mem_primeFactors (Finset.mem_filter.mp hp).1⟩
  · intro p _
    exact zero_le_one.trans (primeCoefficient_one_le ε p)
  · intro p _ _
    exact primeCoefficient_one_le ε p

theorem card_divisors_le_with_cutoff (ε : ℝ) (hε : 0 < ε) (K : ℕ)
    (hK : ∀ p : ℕ, K ≤ p → 2 ≤ (p : ℝ)^ε) (N : ℕ) (hN : N ≠ 0) :
    (N.divisors.card : ℝ) ≤ smallPrimeConstant ε K*(N : ℝ)^ε := by
  rw [Nat.card_divisors hN]
  push_cast
  calc
    (∏ p ∈ N.primeFactors, ((N.factorization p : ℝ)+1)) ≤
        ∏ p ∈ N.primeFactors,
          (if p < K then primeCoefficient ε p else 1)*((p : ℝ)^ε)^(N.factorization p) := by
      apply Finset.prod_le_prod
      · intro p _; positivity
      · intro p hp
        by_cases hs : p < K
        · rw [if_pos hs]
          exact prime_power_factor_le ε hε p _ (Nat.prime_of_mem_primeFactors hp)
        · rw [if_neg hs,one_mul]
          exact large_prime_power_factor_le ε p _ (hK p (Nat.le_of_not_gt hs))
    _ = (∏ p ∈ N.primeFactors, if p < K then primeCoefficient ε p else 1)*
        (N : ℝ)^ε := by rw [Finset.prod_mul_distrib,factorization_rpow ε N hN]
    _ ≤ _ := mul_le_mul_of_nonneg_right (coefficient_product_le ε K N)
      (Real.rpow_nonneg (Nat.cast_nonneg N) ε)

/-- The subpower divisor bound, with no analytic core estimate as an input. -/
theorem card_divisors_le_const_rpow (ε : ℝ) (hε : 0 < ε) :
    ∃ C : ℝ, 0 < C ∧ ∀ N : ℕ, 0 < N → (N.divisors.card : ℝ) ≤ C*(N : ℝ)^ε := by
  obtain ⟨K,hK⟩ := exists_prime_cutoff ε hε
  refine ⟨smallPrimeConstant ε K,lt_of_lt_of_le zero_lt_one (smallPrimeConstant_one_le ε K),?_⟩
  intro N hN
  exact card_divisors_le_with_cutoff ε hε K hK N (Nat.ne_of_gt hN)

end NoThreeLine.DivisorSubpower

#print axioms NoThreeLine.DivisorSubpower.card_divisors_le_const_rpow
