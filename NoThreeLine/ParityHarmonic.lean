import Mathlib.NumberTheory.Harmonic.Bounds
import Mathlib.Algebra.Order.Floor.Semifield
import Mathlib.Tactic

set_option autoImplicit false
open scoped BigOperators

namespace NoThreeLine

/-- The real cutoff means its natural floor, as in the finite-sieve manuscript. -/
noncomputable def parityHarmonic (x : ℝ) (ε : ℕ) : ℝ :=
  ∑ k ∈ (Finset.Icc 1 ⌊x⌋₊).filter (fun k => k % 2 = ε), 1 / (k : ℝ)

theorem real_harmonic_eq_sum (n : ℕ) :
    (harmonic n : ℝ) = ∑ k ∈ Finset.Icc 1 n, 1 / (k : ℝ) := by
  simp only [harmonic_eq_sum_Icc, Rat.cast_sum, Rat.cast_inv, Rat.cast_natCast, one_div]

theorem even_indices_eq_image (n : ℕ) :
    (Finset.Icc 1 n).filter (fun k => k % 2 = 0) =
      (Finset.Icc 1 (n / 2)).image (fun k => 2 * k) := by
  ext k
  simp only [Finset.mem_filter, Finset.mem_Icc, Finset.mem_image]
  constructor
  · rintro ⟨⟨hk1, hkn⟩, hkmod⟩
    refine ⟨k / 2, ?_, ?_⟩ <;> omega
  · rintro ⟨b, ⟨hb1, hbn⟩, rfl⟩
    omega

theorem even_natural_harmonic (n : ℕ) :
    (∑ k ∈ (Finset.Icc 1 n).filter (fun k => k % 2 = 0), 1 / (k : ℝ)) =
      (harmonic (n / 2) : ℝ) / 2 := by
  rw [even_indices_eq_image, Finset.sum_image]
  · rw [real_harmonic_eq_sum, Finset.sum_div]
    apply Finset.sum_congr rfl
    intro k _
    simp only [Nat.cast_mul, Nat.cast_ofNat]
    simp [div_eq_mul_inv, mul_inv_rev, mul_comm]
  · intro a _ b _ heq
    dsimp only at heq
    omega

theorem parityHarmonic_even (x : ℝ) :
    parityHarmonic x 0 = (harmonic ⌊x / 2⌋₊ : ℝ) / 2 := by
  unfold parityHarmonic
  have hf : ⌊x / 2⌋₊ = ⌊x⌋₊ / 2 := by
    simpa only [Nat.cast_ofNat] using Nat.floor_div_natCast x 2
  rw [hf]
  exact even_natural_harmonic ⌊x⌋₊

theorem parityHarmonic_total (x : ℝ) :
    parityHarmonic x 0 + parityHarmonic x 1 = (harmonic ⌊x⌋₊ : ℝ) := by
  simp only [parityHarmonic, Finset.sum_filter, real_harmonic_eq_sum]
  rw [← Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro k _
  have hm : k % 2 = 0 ∨ k % 2 = 1 := by omega
  rcases hm with hm | hm <;> simp [hm]

theorem harmonic_floor_error (x : ℝ) (hx : 1 ≤ x) :
    0 ≤ (harmonic ⌊x⌋₊ : ℝ) - Real.log x ∧
      (harmonic ⌊x⌋₊ : ℝ) - Real.log x ≤ 1 := by
  have hlo := log_le_harmonic_floor x (by linarith)
  have hhi := harmonic_floor_le_one_add_log x hx
  constructor <;> linarith

/-- A sharper estimate for the even part, valid for all real x >= 1. -/
theorem parityHarmonic_even_error (x : ℝ) (hx : 1 ≤ x) :
    |parityHarmonic x 0 - (1 / 2 : ℝ) * Real.log x| ≤ 1 / 2 := by
  rw [parityHarmonic_even]
  have hx0 : 0 < x := by linarith
  have hlog0 : 0 ≤ Real.log x := Real.log_nonneg hx
  by_cases hx2 : 2 ≤ x
  · have hy : 1 ≤ x / 2 := by linarith
    have hlo := log_le_harmonic_floor (x / 2) (by linarith)
    have hhi := harmonic_floor_le_one_add_log (x / 2) hy
    have hdiv : Real.log (x / 2) = Real.log x - Real.log 2 :=
      Real.log_div (ne_of_gt hx0) (by norm_num)
    have hlog2lo : 0 ≤ Real.log 2 := Real.log_nonneg (by norm_num)
    have hlog2hi : Real.log 2 ≤ 1 := by
      have := Real.log_le_sub_one_of_pos (by norm_num : (0 : ℝ) < 2)
      linarith
    rw [hdiv] at hlo hhi
    exact abs_le.mpr ⟨by linarith, by linarith⟩
  · have hfloor : ⌊x / 2⌋₊ = 0 := Nat.floor_eq_zero.mpr (by linarith)
    rw [hfloor]
    simp only [harmonic_zero, Rat.cast_zero, zero_div, zero_sub, abs_neg]
    have hloghi := Real.log_le_sub_one_of_pos hx0
    rw [abs_of_nonneg (mul_nonneg (by norm_num) hlog0)]
    linarith

theorem parityHarmonic_odd_error (x : ℝ) (hx : 1 ≤ x) :
    |parityHarmonic x 1 - (1 / 2 : ℝ) * Real.log x| ≤ 3 / 2 := by
  have he := abs_le.mp (parityHarmonic_even_error x hx)
  have ht := harmonic_floor_error x hx
  have hsum := parityHarmonic_total x
  exact abs_le.mpr ⟨by linarith, by linarith⟩

/-- S2, with the real cutoff and both legal parity values. -/
theorem parityHarmonic_error (x : ℝ) (ε : ℕ) (hx : 1 ≤ x)
    (hε : ε = 0 ∨ ε = 1) :
    |parityHarmonic x ε - (1 / 2 : ℝ) * Real.log x| ≤ 2 := by
  rcases hε with rfl | rfl
  · linarith [parityHarmonic_even_error x hx]
  · linarith [parityHarmonic_odd_error x hx]

theorem reciprocal_square_step (x : ℝ) (hx : 0 < x) :
    1 / (x + 1)^2 ≤ 1 / x - 1 / (x + 1) := by
  have hx1 : 0 < x + 1 := by linarith
  have he : 1 / x - 1 / (x + 1) = 1 / (x * (x + 1)) := by
    field_simp
    ring
  rw [he]
  apply one_div_le_one_div_of_le (mul_pos hx hx1)
  nlinarith

/-- Finite telescoping, without defining an infinite reciprocal-square sum. -/
theorem reciprocal_square_sum_succ (n : ℕ) :
    (∑ i ∈ Finset.range (n + 1), 1 / ((i : ℝ) + 1)^2) ≤
      2 - 1 / ((n : ℝ) + 1) := by
  induction n with
  | zero => norm_num
  | succ n ih =>
      rw [Finset.sum_range_succ]
      have hs := reciprocal_square_step ((n : ℝ) + 1) (by positivity)
      simp only [Nat.cast_add, Nat.cast_one]
      linarith

theorem reciprocal_square_sum_range_le_two (n : ℕ) :
    (∑ i ∈ Finset.range n, 1 / ((i : ℝ) + 1)^2) ≤ 2 := by
  cases n with
  | zero => norm_num
  | succ n =>
      have hs := reciprocal_square_sum_succ n
      have hi : 0 ≤ 1 / ((n : ℝ) + 1) := by positivity
      linarith

/-- S3 in the manuscript's Icc notation, also covering the empty cutoff. -/
theorem reciprocal_square_sum_le_two (n : ℕ) :
    (∑ k ∈ Finset.Icc 1 n, 1 / (k : ℝ)^2) ≤ 2 := by
  have he : (∑ i ∈ Finset.range n, 1 / ((i : ℝ) + 1)^2) =
      ∑ k ∈ Finset.Icc 1 n, 1 / (k : ℝ)^2 := by
    simp_rw [← Nat.cast_add_one]
    rw [Finset.range_eq_Ico, Finset.sum_Ico_add' (fun k : ℕ => 1 / (k : ℝ)^2) 0 n (c := 1)]
    simp only [Finset.Ico_add_one_right_eq_Icc]
  rw [← he]
  exact reciprocal_square_sum_range_le_two n

theorem parity_reciprocal_square_sum_le_two (x : ℝ) (ε : ℕ) :
    (∑ k ∈ (Finset.Icc 1 ⌊x⌋₊).filter (fun k => k % 2 = ε), 1 / (k : ℝ)^2) ≤ 2 := by
  apply le_trans _ (reciprocal_square_sum_le_two ⌊x⌋₊)
  apply Finset.sum_le_sum_of_subset_of_nonneg (Finset.filter_subset _ _)
  intro k _ _
  positivity

end NoThreeLine

#print axioms NoThreeLine.parityHarmonic_even
#print axioms NoThreeLine.parityHarmonic_total
#print axioms NoThreeLine.parityHarmonic_error
#print axioms NoThreeLine.reciprocal_square_sum_le_two
#print axioms NoThreeLine.parity_reciprocal_square_sum_le_two
