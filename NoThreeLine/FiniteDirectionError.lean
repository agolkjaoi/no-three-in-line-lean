import NoThreeLine.FiniteDirectionSums

/-! Squaring a uniform lattice error and summing over the actual finite
primitive direction set. This algebraic lemma is subsequently instantiated
with the actual grid sum and actual rectangle chord. -/
set_option autoImplicit false
open scoped BigOperators
namespace NoThreeLine.FiniteDirections
open PrimitiveLines

theorem square_lattice_error (W C n h M E : ℝ) (hn : 0 ≤ n) (hh : 0 < h)
    (hM : 0 ≤ M) (hE : 0 ≤ E) (hC : C^2 ≤ 4*M^2)
    (he : |W-n/(2*h)*C| ≤ E) :
    W^2 ≤ (n/(2*h)*C)^2 + 2*n*M*E/h + E^2 := by
  have hCa : |C| ≤ 2*M := by nlinarith [sq_abs C, abs_nonneg C]
  have hB : |n/(2*h)*C| ≤ n*M/h := by
    rw [abs_mul, abs_of_nonneg (by positivity : 0 ≤ n/(2*h))]
    calc
      _ ≤ n/(2*h)*(2*M) := mul_le_mul_of_nonneg_left hCa (by positivity)
      _ = n*M/h := by ring
  have hWa : |W| ≤ |n/(2*h)*C|+E := by
    calc
      _ = |(W-n/(2*h)*C)+n/(2*h)*C| := by congr 1; ring
      _ ≤ |W-n/(2*h)*C|+|n/(2*h)*C| := abs_add_le _ _
      _ ≤ |n/(2*h)*C|+E := by linarith
  have hs : |W|^2 ≤ (|n/(2*h)*C|+E)^2 :=
    (sq_le_sq₀ (abs_nonneg W) (by positivity)).mpr hWa
  have hb := mul_le_mul_of_nonneg_right hB hE
  rw [sq_abs] at hs
  have hab := sq_abs (n/(2*h)*C)
  have hr : 2*(n*M/h)*E = 2*n*M*E/h := by ring
  nlinarith

theorem finite_direction_square_error (n : ℕ)
    (W C : (Σ _h : ℕ, ZPoint) → ℝ) (M E : ℝ) (hn : 0 < n)
    (hM : 0 ≤ M) (hE : 0 ≤ E)
    (hC : ∀ d ∈ directionIndices n, (C d)^2 ≤ 4*M^2)
    (he : ∀ d ∈ directionIndices n,
      |W d-(n : ℝ)/(2*(d.1 : ℝ))*C d| ≤ E) :
    (∑ d ∈ directionIndices n, (W d)^2)/(2*(n : ℝ)^2) ≤
      (1/8 : ℝ)*(∑ d ∈ directionIndices n, (C d)^2/(d.1 : ℝ)^2) + E^2+4*M*E := by
  classical
  have hnR : (0 : ℝ) < n := by exact_mod_cast hn
  have hheight (d) (hd : d ∈ directionIndices n) : (0 : ℝ) < d.1 := by
    have h := (Finset.mem_Ico.mp (Finset.mem_sigma.mp hd).1).1
    exact_mod_cast h
  have hpoint (d) (hd : d ∈ directionIndices n) :=
    square_lattice_error (W d) (C d) n d.1 M E hnR.le (hheight d hd) hM hE (hC d hd) (he d hd)
  have hcount : ((directionIndices n).card : ℝ) ≤ 2*(n : ℝ)^2 := by
    have hc : ((directionIndices n).card : ℝ) ≤ 2*(n : ℝ)*((n-1 : ℕ) : ℝ) := by
      exact_mod_cast directionIndices_card_le n
    have hl : ((n-1 : ℕ) : ℝ) ≤ n := by exact_mod_cast Nat.sub_le n 1
    nlinarith
  have hinv : (∑ d ∈ directionIndices n, (1 : ℝ)/(d.1 : ℝ)) ≤ 4*n := by
    have hi := sum_inverse_height_le n
    have hl : ((n-1 : ℕ) : ℝ) ≤ n := by exact_mod_cast Nat.sub_le n 1
    linarith
  have hsum : (∑ d ∈ directionIndices n, (W d)^2) ≤
      (∑ d ∈ directionIndices n, ((n : ℝ)/(2*(d.1 : ℝ))*C d)^2) +
        8*(n : ℝ)^2*M*E + 2*(n : ℝ)^2*E^2 := by
    calc
      _ ≤ ∑ d ∈ directionIndices n,
          (((n : ℝ)/(2*(d.1 : ℝ))*C d)^2+2*n*M*E/(d.1 : ℝ)+E^2) :=
        Finset.sum_le_sum hpoint
      _ = (∑ d ∈ directionIndices n, ((n : ℝ)/(2*(d.1 : ℝ))*C d)^2) +
          (2*n*M*E)*(∑ d ∈ directionIndices n, (1 : ℝ)/(d.1 : ℝ)) +
          ((directionIndices n).card : ℝ)*E^2 := by
        simp only [Finset.sum_add_distrib, Finset.sum_const, nsmul_eq_mul, Finset.mul_sum]
        congr 2
        apply Finset.sum_congr rfl
        intros
        ring
      _ ≤ _ := by
        have hi := mul_le_mul_of_nonneg_left hinv (by positivity : 0 ≤ 2*(n : ℝ)*M*E)
        have hc := mul_le_mul_of_nonneg_right hcount (sq_nonneg E)
        nlinarith
  apply (div_le_iff₀ (by positivity : 0 < 2*(n : ℝ)^2)).mpr
  calc
    _ ≤ _ := hsum
    _ = _ := by
      have hmain : (∑ d ∈ directionIndices n, ((n : ℝ)/(2*(d.1 : ℝ))*C d)^2) =
          (n : ℝ)^2/4*(∑ d ∈ directionIndices n, (C d)^2/(d.1 : ℝ)^2) := by
        rw [Finset.mul_sum]
        apply Finset.sum_congr rfl
        intro d hd
        field_simp
        <;> ring
      rw [hmain]
      ring

end NoThreeLine.FiniteDirections

#print axioms NoThreeLine.FiniteDirections.finite_direction_square_error
