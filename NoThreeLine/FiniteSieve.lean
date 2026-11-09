import Mathlib.Data.Nat.GCD.Basic
import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Tactic

set_option autoImplicit false
open scoped BigOperators

namespace NoThreeLine

/-- The finite relaxation keeps a pair unless one selected factor divides both. -/
def sieveIndicator (P : Finset ℕ) (a h : ℕ) : ℝ :=
  ∏ p ∈ P, if p ∣ a ∧ p ∣ h then 0 else 1

theorem sieveIndicator_nonneg (P : Finset ℕ) (a h : ℕ) :
    0 ≤ sieveIndicator P a h := by
  unfold sieveIndicator
  exact Finset.prod_nonneg fun p _ => by split_ifs <;> norm_num

theorem sieveIndicator_of_coprime (P : Finset ℕ) (a h : ℕ)
    (hP : ∀ p ∈ P, 1 < p) (ha : Nat.Coprime a h) :
    sieveIndicator P a h = 1 := by
  apply Finset.prod_eq_one
  intro p hp
  have hn : ¬ (p ∣ a ∧ p ∣ h) := by
    intro hd
    have hg : p ∣ Nat.gcd a h := Nat.dvd_gcd hd.1 hd.2
    rw [ha.gcd_eq_one] at hg
    have hp1 : p = 1 := Nat.dvd_one.mp hg
    have := hP p hp
    omega
  simp [hn]

theorem primitive_indicator_le_sieve (P : Finset ℕ) (a h : ℕ)
    (hP : ∀ p ∈ P, 1 < p) :
    (if Nat.Coprime a h then (1 : ℝ) else 0) ≤ sieveIndicator P a h := by
  by_cases hc : Nat.Coprime a h
  · rw [if_pos hc, sieveIndicator_of_coprime P a h hP hc]
  · simpa [hc] using sieveIndicator_nonneg P a h

/-- This is the genuine first inequality of the finite sieve, for any finite
pair domain and nonnegative weights. No density/asymptotic estimate is assumed. -/
theorem nonnegative_weighted_sieve (P : Finset ℕ) (pairs : Finset (ℕ × ℕ))
    (w : ℕ × ℕ → ℝ) (hP : ∀ p ∈ P, 1 < p)
    (hw : ∀ z ∈ pairs, 0 ≤ w z) :
    (∑ z ∈ pairs, (if Nat.Coprime z.1 z.2 then 1 else 0) * w z) ≤
      ∑ z ∈ pairs, sieveIndicator P z.1 z.2 * w z := by
  exact Finset.sum_le_sum fun z hz =>
    mul_le_mul_of_nonneg_right (primitive_indicator_le_sieve P z.1 z.2 hP) (hw z hz)

/-- Exact finite inclusion-exclusion, without any infinite sum or zeta value. -/
theorem finite_sieve_expansion (P : Finset ℕ) (a h : ℕ) :
    sieveIndicator P a h =
      ∑ A ∈ P.powerset, (-1 : ℝ)^A.card *
        ∏ p ∈ A, if p ∣ a ∧ p ∣ h then (1 : ℝ) else 0 := by
  have he : sieveIndicator P a h =
      ∏ p ∈ P, ((1 : ℝ) - if p ∣ a ∧ p ∣ h then 1 else 0) := by
    apply Finset.prod_congr rfl
    intro p _
    split_ifs <;> norm_num
  rw [he, Finset.prod_sub]
  simp

end NoThreeLine

#print axioms NoThreeLine.nonnegative_weighted_sieve
#print axioms NoThreeLine.finite_sieve_expansion
