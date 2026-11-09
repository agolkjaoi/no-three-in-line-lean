import NoThreeLine.FiniteSieve
import Mathlib.Data.Nat.GCD.BigOperators
import Mathlib.Algebra.Ring.Parity

set_option autoImplicit false
open scoped BigOperators

namespace NoThreeLine

/-- Pairwise coprimality, without any primality assumption, is sufficient to
combine divisibility by the finitely many selected factors. -/
theorem coprime_product_dvd_iff (A : Finset ℕ) (a : ℕ)
    (hcop : (A : Set ℕ).Pairwise Nat.Coprime) :
    (∏ p ∈ A, p) ∣ a ↔ ∀ p ∈ A, p ∣ a := by
  constructor
  · intro h p hp
    exact (Finset.dvd_prod_of_mem (fun p : ℕ => p) hp).trans h
  · intro h
    induction A using Finset.induction_on with
    | empty => simp
    | @insert p A hp ih =>
        rw [Finset.prod_insert hp]
        have hcp : Nat.Coprime p (∏ q ∈ A, q) := by
          apply Nat.coprime_prod_right_iff.mpr
          intro q hq
          exact hcop (Finset.mem_insert_self _ _) (Finset.mem_insert_of_mem hq)
            (ne_of_mem_of_not_mem hq hp).symm
        have hsub : (A : Set ℕ).Pairwise Nat.Coprime :=
          hcop.mono (by intro q hq; exact Finset.mem_insert_of_mem hq)
        exact hcp.mul_dvd_of_dvd_of_dvd (h p (Finset.mem_insert_self _ _))
          (ih hsub (fun q hq => h q (Finset.mem_insert_of_mem hq)))

theorem odd_product (A : Finset ℕ) (hodd : ∀ p ∈ A, Odd p) :
    Odd (∏ p ∈ A, p) := by
  induction A using Finset.induction_on with
  | empty => simp
  | @insert p A hp ih =>
      rw [Finset.prod_insert hp]
      exact (hodd p (Finset.mem_insert_self _ _)).mul
        (ih (fun q hq => hodd q (Finset.mem_insert_of_mem hq)))

theorem odd_mul_mod_two (d b : ℕ) (hd : Odd d) : (d * b) % 2 = b % 2 := by
  rw [Nat.mul_mod, Nat.odd_iff.mp hd, one_mul, Nat.mod_mod]

theorem odd_mul_parity_iff (d b e : ℕ) (hd : Odd d) :
    (d * b) % 2 = e ↔ b % 2 = e := by rw [odd_mul_mod_two d b hd]

/-- The finite pair domain is arbitrary: later lattice estimates may choose
triangular ranges and parity restrictions before applying this reindexing. -/
def divisiblePairs (d : ℕ) (pairs : Finset (ℕ × ℕ)) : Finset (ℕ × ℕ) :=
  pairs.filter (fun z => d ∣ z.1 ∧ d ∣ z.2)

def quotientPair (d : ℕ) (z : ℕ × ℕ) : ℕ × ℕ := (z.1 / d, z.2 / d)
def scalePair (d : ℕ) (z : ℕ × ℕ) : ℕ × ℕ := (d * z.1, d * z.2)

theorem scale_quotientPair (d : ℕ) (z : ℕ × ℕ)
    (hdiv : d ∣ z.1 ∧ d ∣ z.2) : scalePair d (quotientPair d z) = z := by
  apply Prod.ext
  · exact Nat.mul_div_cancel' hdiv.1
  · exact Nat.mul_div_cancel' hdiv.2

/-- Exact finite substitution (a,h)=(d*b,d*k). The image set records the
quotient domain without presupposing a range or analytic estimate. -/
theorem sum_divisiblePairs_reindex (d : ℕ) (pairs : Finset (ℕ × ℕ))
    (w : ℕ × ℕ → ℝ) :
    (∑ z ∈ divisiblePairs d pairs, w z) =
      ∑ q ∈ (divisiblePairs d pairs).image (quotientPair d), w (scalePair d q) := by
  rw [Finset.sum_image]
  · apply Finset.sum_congr rfl
    intro z hz
    rw [scale_quotientPair d z (Finset.mem_filter.mp hz).2]
  · intro x hx y hy heq
    have hx' := scale_quotientPair d x (Finset.mem_filter.mp hx).2
    have hy' := scale_quotientPair d y (Finset.mem_filter.mp hy).2
    exact hx'.symm.trans ((congrArg (scalePair d) heq).trans hy')

theorem scalePair_parity (d : ℕ) (z : ℕ × ℕ) (hd : Odd d) :
    (scalePair d z).1 % 2 = z.1 % 2 ∧ (scalePair d z).2 % 2 = z.2 % 2 := by
  exact ⟨odd_mul_mod_two d z.1 hd, odd_mul_mod_two d z.2 hd⟩

theorem product_divisibility_indicator (A : Finset ℕ) (a h : ℕ)
    (hcop : (A : Set ℕ).Pairwise Nat.Coprime) :
    (∏ p ∈ A, if p ∣ a ∧ p ∣ h then (1 : ℝ) else 0) =
      if (∏ p ∈ A, p) ∣ a ∧ (∏ p ∈ A, p) ∣ h then 1 else 0 := by
  by_cases hall : ∀ p ∈ A, p ∣ a ∧ p ∣ h
  · have hd : (∏ p ∈ A, p) ∣ a ∧ (∏ p ∈ A, p) ∣ h :=
      ⟨(coprime_product_dvd_iff A a hcop).mpr (fun p hp => (hall p hp).1),
        (coprime_product_dvd_iff A h hcop).mpr (fun p hp => (hall p hp).2)⟩
    rw [if_pos hd]
    exact Finset.prod_eq_one (fun p hp => if_pos (hall p hp))
  · have hd : ¬((∏ p ∈ A, p) ∣ a ∧ (∏ p ∈ A, p) ∣ h) := by
      intro hh
      exact hall (fun p hp => ⟨(coprime_product_dvd_iff A a hcop).mp hh.1 p hp,
        (coprime_product_dvd_iff A h hcop).mp hh.2 p hp⟩)
    rw [if_neg hd]
    have hex : ∃ p ∈ A, ¬(p ∣ a ∧ p ∣ h) := by
      simpa only [not_forall, Classical.not_imp, exists_prop] using hall
    obtain ⟨p, hp, hbad⟩ := hex
    exact Finset.prod_eq_zero hp (if_neg hbad)

/-- The inclusion-exclusion term for A is divisibility by d_A=product A. -/
theorem finite_sieve_expansion_by_product (P : Finset ℕ) (a h : ℕ)
    (hcop : (P : Set ℕ).Pairwise Nat.Coprime) :
    sieveIndicator P a h =
      ∑ A ∈ P.powerset, (-1 : ℝ)^A.card *
        (if (∏ p ∈ A, p) ∣ a ∧ (∏ p ∈ A, p) ∣ h then 1 else 0) := by
  rw [finite_sieve_expansion]
  apply Finset.sum_congr rfl
  intro A hA
  rw [product_divisibility_indicator A a h (hcop.mono (Finset.mem_powerset.mp hA))]

theorem weighted_divisibility_reindex (d : ℕ) (pairs : Finset (ℕ × ℕ))
    (w : ℕ × ℕ → ℝ) :
    (∑ z ∈ pairs, (if d ∣ z.1 ∧ d ∣ z.2 then (1 : ℝ) else 0) * w z) =
      ∑ q ∈ (divisiblePairs d pairs).image (quotientPair d), w (scalePair d q) := by
  rw [← sum_divisiblePairs_reindex]
  simp only [divisiblePairs, Finset.sum_filter]
  apply Finset.sum_congr rfl
  intro z _
  split_ifs <;> simp

/-- Exact finite inclusion-exclusion followed by integer reindexing. No
asymptotic error, density identity, or parity harmonic estimate is assumed. -/
theorem finite_sieve_weighted_reindex (P : Finset ℕ) (pairs : Finset (ℕ × ℕ))
    (w : ℕ × ℕ → ℝ) (hcop : (P : Set ℕ).Pairwise Nat.Coprime) :
    (∑ z ∈ pairs, sieveIndicator P z.1 z.2 * w z) =
      ∑ A ∈ P.powerset, (-1 : ℝ)^A.card *
        ∑ q ∈ (divisiblePairs (∏ p ∈ A, p) pairs).image (quotientPair (∏ p ∈ A, p)),
          w (scalePair (∏ p ∈ A, p) q) := by
  simp_rw [finite_sieve_expansion_by_product P _ _ hcop, Finset.sum_mul]
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro A _
  rw [← weighted_divisibility_reindex, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro z _
  ring

end NoThreeLine

#print axioms NoThreeLine.coprime_product_dvd_iff
#print axioms NoThreeLine.odd_product
#print axioms NoThreeLine.odd_mul_mod_two
#print axioms NoThreeLine.sum_divisiblePairs_reindex
#print axioms NoThreeLine.finite_sieve_weighted_reindex
