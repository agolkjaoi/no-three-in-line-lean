import NoThreeLine.SieveDomain
import NoThreeLine.ParityRiemann
import NoThreeLine.ParityHarmonic

set_option autoImplicit false
open MeasureTheory Set
open scoped BigOperators Interval

namespace NoThreeLine

theorem bv_unit_integral_bounds (f : ℝ → ℝ) (M : ℝ)
    (hf : BoundedVariationOn f (Icc 0 1))
    (hM : ∀ u ∈ Icc (0 : ℝ) 1, 0 ≤ f u ∧ f u ≤ M) :
    0 ≤ (∫ u in (0 : ℝ)..1, f u) ∧ (∫ u in (0 : ℝ)..1, f u) ≤ M := by
  have hi : IntervalIntegrable f volume 0 1 :=
    bv_intervalIntegrable f 0 1 (by simpa only [uIcc_of_le (by norm_num : (0:ℝ) ≤ 1)] using hf)
  constructor
  · have h := intervalIntegral.integral_mono_on (by norm_num : (0:ℝ) ≤ 1)
      (intervalIntegrable_const (c := (0:ℝ))) hi (fun u hu => (hM u hu).1)
    simpa using h
  · have h := intervalIntegral.integral_mono_on (by norm_num : (0:ℝ) ≤ 1)
      hi (intervalIntegrable_const (c := M)) (fun u hu => (hM u hu).2)
    simpa using h

theorem realParityJ_eq_rows (f : ℝ → ℝ) (x : ℝ) (ε η : ℕ) :
    realParityJ x ε η f =
      ∑ h ∈ (Finset.Icc 1 ⌊x⌋₊).filter (fun h => h % 2 = ε),
        (1 / (h : ℝ)^2) * parityRiemannSum f h η := by
  unfold realParityJ
  rw [parityJ_eq_nested]
  simp only [Finset.sum_filter, parityRiemannSum]

theorem realParityJ_error_identity (f : ℝ → ℝ) (x : ℝ) (ε η : ℕ) :
    realParityJ x ε η f - ((∫ u in (0 : ℝ)..1, f u) / 2) * parityHarmonic x ε =
      ∑ h ∈ (Finset.Icc 1 ⌊x⌋₊).filter (fun h => h % 2 = ε),
        (1 / (h : ℝ)^2) * (parityRiemannSum f h η -
          ((h : ℝ)/2) * ∫ u in (0 : ℝ)..1, f u) := by
  rw [realParityJ_eq_rows]
  unfold parityHarmonic
  rw [Finset.mul_sum, ← Finset.sum_sub_distrib]
  apply Finset.sum_congr rfl
  intro h hh
  have hhpos : 0 < h := (Finset.mem_Icc.mp (Finset.mem_filter.mp hh).1).1
  have hh' : (h : ℝ) ≠ 0 := by exact_mod_cast Nat.ne_of_gt hhpos
  field_simp

/-- Summing S1 with h^-2 costs at most 4M+2V, by the proved finite S3. -/
theorem realParityJ_row_error (f : ℝ → ℝ) (x : ℝ) (ε η : ℕ) (M : ℝ)
    (hη : η ≤ 1) (hf : BoundedVariationOn f (Icc 0 1))
    (hM : ∀ u ∈ Icc (0 : ℝ) 1, 0 ≤ f u ∧ f u ≤ M) :
    |realParityJ x ε η f - ((∫ u in (0 : ℝ)..1, f u) / 2) * parityHarmonic x ε| ≤
      4*M + 2*(eVariationOn f (Icc 0 1)).toReal := by
  let V := (eVariationOn f (Icc 0 1)).toReal
  have hM0 : 0 ≤ M := (hM 0 (by simp)).1.trans (hM 0 (by simp)).2
  have hV0 : 0 ≤ V := ENNReal.toReal_nonneg
  have hC0 : 0 ≤ 2*M+V := by positivity
  rw [realParityJ_error_identity]
  calc
    _ ≤ ∑ h ∈ (Finset.Icc 1 ⌊x⌋₊).filter (fun h => h % 2 = ε),
        |(1/(h:ℝ)^2) * (parityRiemannSum f h η -
          ((h:ℝ)/2) * ∫ u in (0:ℝ)..1, f u)| := Finset.abs_sum_le_sum_abs _ _
    _ ≤ ∑ h ∈ (Finset.Icc 1 ⌊x⌋₊).filter (fun h => h % 2 = ε),
        (1/(h:ℝ)^2) * (2*M+V) := by
      apply Finset.sum_le_sum
      intro h hh
      have hhpos : 0 < h := (Finset.mem_Icc.mp (Finset.mem_filter.mp hh).1).1
      rw [abs_mul, abs_of_nonneg (by positivity : (0:ℝ) ≤ 1/(h:ℝ)^2)]
      exact mul_le_mul_of_nonneg_left
        (nonnegative_parityRiemann_error f h η M hhpos hη hf hM) (by positivity)
    _ = (∑ h ∈ (Finset.Icc 1 ⌊x⌋₊).filter (fun h => h % 2 = ε), 1/(h:ℝ)^2) *
        (2*M+V) := (Finset.sum_mul _ _ _).symm
    _ ≤ 2 * (2*M+V) :=
      mul_le_mul_of_nonneg_right (parity_reciprocal_square_sum_le_two x ε) hC0
    _ = _ := by dsimp [V]; ring

/-- FS3 with the manuscript's sharper explicit error 4M+2V+I. -/
theorem realParityJ_error_sharp (f : ℝ → ℝ) (x : ℝ) (ε η : ℕ) (M : ℝ)
    (hx : 1 ≤ x) (hε : ε ≤ 1) (hη : η ≤ 1)
    (hf : BoundedVariationOn f (Icc 0 1))
    (hM : ∀ u ∈ Icc (0 : ℝ) 1, 0 ≤ f u ∧ f u ≤ M) :
    |realParityJ x ε η f - ((∫ u in (0 : ℝ)..1, f u) / 4) * Real.log x| ≤
      4*M + 2*(eVariationOn f (Icc 0 1)).toReal + ∫ u in (0 : ℝ)..1, f u := by
  let I := ∫ u in (0 : ℝ)..1, f u
  have hI := bv_unit_integral_bounds f M hf hM
  have hI0 : 0 ≤ I := hI.1
  have hrow := realParityJ_row_error f x ε η M hη hf hM
  have hh := parityHarmonic_error x ε hx (by omega)
  have hmain : |(I/2)*parityHarmonic x ε - (I/4)*Real.log x| ≤ I := by
    have he : (I/2)*parityHarmonic x ε - (I/4)*Real.log x =
        (I/2)*(parityHarmonic x ε - (1/2:ℝ)*Real.log x) := by ring
    rw [he, abs_mul, abs_of_nonneg (by positivity)]
    have hmul := mul_le_mul_of_nonneg_left hh (by positivity : 0 ≤ I/2)
    linarith
  have htri := abs_sub_le (realParityJ x ε η f) ((I/2)*parityHarmonic x ε)
    ((I/4)*Real.log x)
  dsimp [I] at hmain htri
  linarith

/-- FS3 in the convenient homogeneous form used by the finite signed sieve. -/
theorem realParityJ_error (f : ℝ → ℝ) (x : ℝ) (ε η : ℕ) (M : ℝ)
    (hx : 1 ≤ x) (hε : ε ≤ 1) (hη : η ≤ 1)
    (hf : BoundedVariationOn f (Icc 0 1))
    (hM : ∀ u ∈ Icc (0 : ℝ) 1, 0 ≤ f u ∧ f u ≤ M) :
    |realParityJ x ε η f - ((∫ u in (0 : ℝ)..1, f u) / 4) * Real.log x| ≤
      5 * (M + (eVariationOn f (Icc 0 1)).toReal) := by
  have hs := realParityJ_error_sharp f x ε η M hx hε hη hf hM
  have hI := (bv_unit_integral_bounds f M hf hM).2
  have hV : 0 ≤ (eVariationOn f (Icc 0 1)).toReal := ENNReal.toReal_nonneg
  linarith

theorem product_reciprocal_squares (A : Finset ℕ) :
    (∏ p ∈ A, 1 / (p : ℝ)^2) = 1 / (∏ p ∈ A, (p : ℝ))^2 := by
  simp only [one_div, Finset.prod_inv_distrib, Finset.prod_pow]

theorem sum_reciprocal_square_subproducts (P : Finset ℕ) :
    (∑ A ∈ P.powerset, 1 / (∏ p ∈ A, (p : ℝ))^2) =
      ∏ p ∈ P, (1 + 1/(p:ℝ)^2) := by
  rw [Finset.prod_one_add]
  simp_rw [product_reciprocal_squares]

theorem sum_signed_reciprocal_square_subproducts (P : Finset ℕ) :
    (∑ A ∈ P.powerset, (-1:ℝ)^A.card / (∏ p ∈ A, (p : ℝ))^2) =
      ∏ p ∈ P, (1 - 1/(p:ℝ)^2) := by
  rw [Finset.prod_sub]
  simp only [Finset.prod_const_one, mul_one]
  simp_rw [product_reciprocal_squares]
  simp only [div_eq_mul_inv, one_mul]

theorem sieve_subproduct_bounds (P A : Finset ℕ) (hA : A ⊆ P)
    (hP : ∀ p ∈ P, 1 < p) :
    1 ≤ (∏ p ∈ A, p) ∧ (∏ p ∈ A, p) ≤ (∏ p ∈ P, p) := by
  constructor
  · exact Finset.one_le_prod' (fun p hp => (hP p (hA hp)).le)
  · exact Finset.prod_le_prod_of_subset_of_one_le' hA (fun p hp _ => (hP p hp).le)

/-- Move the logarithm from N/d to N with a uniform, genuine BV error.
The log(d) correction is paid in absolute value before signed summation. -/
theorem realParityJ_quotient_error (f : ℝ → ℝ) (N d Q ε η : ℕ) (M : ℝ)
    (hd : 1 ≤ d) (hdQ : d ≤ Q) (hQN : Q ≤ N) (hε : ε ≤ 1) (hη : η ≤ 1)
    (hf : BoundedVariationOn f (Icc 0 1))
    (hM : ∀ u ∈ Icc (0 : ℝ) 1, 0 ≤ f u ∧ f u ≤ M) :
    |realParityJ ((N:ℝ)/d) ε η f - ((∫ u in (0:ℝ)..1, f u)/4) * Real.log N| ≤
      (5 + Real.log Q / 4) * (M + (eVariationOn f (Icc 0 1)).toReal) := by
  let I := ∫ u in (0:ℝ)..1, f u
  let V := (eVariationOn f (Icc 0 1)).toReal
  have hI := bv_unit_integral_bounds f M hf hM
  have hI0 : 0 ≤ I := hI.1
  have hIle : I ≤ M := hI.2
  have hV0 : 0 ≤ V := ENNReal.toReal_nonneg
  have hM0 : 0 ≤ M := hI0.trans hIle
  have hW0 : 0 ≤ M+V := by positivity
  have hd1 : (1:ℝ) ≤ d := by exact_mod_cast hd
  have hdpos : (0:ℝ) < d := by linarith
  have hdQ' : (d:ℝ) ≤ Q := by exact_mod_cast hdQ
  have hQN' : (Q:ℝ) ≤ N := by exact_mod_cast hQN
  have hNpos : (0:ℝ) < N := hdpos.trans_le (hdQ'.trans hQN')
  have hratio : (1:ℝ) ≤ (N:ℝ)/d :=
    (le_div_iff₀ hdpos).mpr (by simpa using hdQ'.trans hQN')
  have he := realParityJ_error f ((N:ℝ)/d) ε η M hratio hε hη hf hM
  rw [Real.log_div (ne_of_gt hNpos) (ne_of_gt hdpos)] at he
  have hlogd0 : 0 ≤ Real.log d := Real.log_nonneg hd1
  have hlogdQ : Real.log d ≤ Real.log Q := Real.log_le_log hdpos hdQ'
  have hlogQ0 : 0 ≤ Real.log Q := hlogd0.trans hlogdQ
  have hproduct : I * Real.log d ≤ (M+V) * Real.log Q :=
    mul_le_mul (by linarith) hlogdQ hlogd0 hW0
  have hbounds := abs_le.mp he
  change |realParityJ ((N:ℝ)/d) ε η f - (I/4)*Real.log N| ≤
    (5+Real.log Q/4)*(M+V)
  apply abs_le.mpr
  constructor <;> dsimp [I, V] at * <;> nlinarith [mul_nonneg hI0 hlogd0]

noncomputable def finiteSieveDensity (P : Finset ℕ) : ℝ :=
  (3/4:ℝ) * ∏ p ∈ P, (1 - 1/(p:ℝ)^2)

noncomputable def finiteSieveAbsoluteFactor (P : Finset ℕ) : ℝ :=
  ∏ p ∈ P, (1 + 1/(p:ℝ)^2)

noncomputable def finiteSieveErrorConstant (P : Finset ℕ) : ℝ :=
  (5 + Real.log (∏ p ∈ P, p : ℕ) / 4) * finiteSieveAbsoluteFactor P

/-- Both signs of every inclusion-exclusion error are controlled before the
sum is bounded. This is not a substitution of one-sided bounds into signed terms. -/
theorem sievedParityJ_error (P : Finset ℕ) (N ε η : ℕ) (f : ℝ → ℝ) (M : ℝ)
    (hP : ∀ p ∈ P, 1 < p) (hcop : (P : Set ℕ).Pairwise Nat.Coprime)
    (hodd : ∀ p ∈ P, Odd p) (hN : (∏ p ∈ P, p) ≤ N)
    (hε : ε ≤ 1) (hη : η ≤ 1) (hf : BoundedVariationOn f (Icc 0 1))
    (hM : ∀ u ∈ Icc (0 : ℝ) 1, 0 ≤ f u ∧ f u ≤ M) :
    |sievedParityJ P N ε η f - ((∫ u in (0:ℝ)..1, f u)/4) * Real.log N *
        (∏ p ∈ P, (1-1/(p:ℝ)^2))| ≤
      finiteSieveErrorConstant P * (M + (eVariationOn f (Icc 0 1)).toReal) := by
  let main := ((∫ u in (0:ℝ)..1, f u)/4) * Real.log N
  let B := (5 + Real.log (∏ p ∈ P, p : ℕ)/4) *
    (M + (eVariationOn f (Icc 0 1)).toReal)
  have he : sievedParityJ P N ε η f - main * (∏ p ∈ P, (1-1/(p:ℝ)^2)) =
      ∑ A ∈ P.powerset, ((-1:ℝ)^A.card / (∏ p ∈ A, (p:ℝ))^2) *
        (realParityJ ((N:ℝ)/(∏ p ∈ A, p : ℕ)) ε η f - main) := by
    rw [finite_sieve_realParityJ_identity P N ε η f hcop hodd,
      ← sum_signed_reciprocal_square_subproducts P, Finset.mul_sum,
      ← Finset.sum_sub_distrib]
    apply Finset.sum_congr rfl
    intro A _
    ring
  change |sievedParityJ P N ε η f - main * (∏ p ∈ P, (1-1/(p:ℝ)^2))| ≤ _
  rw [he]
  calc
    _ ≤ ∑ A ∈ P.powerset, |((-1:ℝ)^A.card / (∏ p ∈ A, (p:ℝ))^2) *
        (realParityJ ((N:ℝ)/(∏ p ∈ A, p : ℕ)) ε η f - main)| :=
      Finset.abs_sum_le_sum_abs _ _
    _ ≤ ∑ A ∈ P.powerset, (1/(∏ p ∈ A, (p:ℝ))^2) * B := by
      apply Finset.sum_le_sum
      intro A hA
      have hb := sieve_subproduct_bounds P A (Finset.mem_powerset.mp hA) hP
      have hlocal := realParityJ_quotient_error f N (∏ p ∈ A, p) (∏ p ∈ P, p)
        ε η M hb.1 hb.2 hN hε hη hf hM
      have hc : |(-1:ℝ)^A.card / (∏ p ∈ A, (p:ℝ))^2| =
          1/(∏ p ∈ A, (p:ℝ))^2 := by
        rw [abs_div, abs_pow, abs_neg, abs_one, one_pow,
          abs_of_nonneg (sq_nonneg _)]
      rw [abs_mul, hc]
      exact mul_le_mul_of_nonneg_left hlocal (by positivity)
    _ = _ := by
      rw [← Finset.sum_mul, sum_reciprocal_square_subproducts]
      unfold finiteSieveErrorConstant finiteSieveAbsoluteFactor
      dsimp [B]
      ring

/-- FS1 with exactly D_P=(3/4)product(1-p^-2) and
C_P=[5+log(Q)/4]product(1+p^-2), for all integer N >= Q. -/
theorem finite_sieve_BV_upper_bound (P : Finset ℕ) (N ε η : ℕ) (f : ℝ → ℝ) (M : ℝ)
    (hP : ∀ p ∈ P, 1 < p) (hcop : (P : Set ℕ).Pairwise Nat.Coprime)
    (hodd : ∀ p ∈ P, Odd p) (hN : (∏ p ∈ P, p) ≤ N)
    (hε : ε ≤ 1) (hη : η ≤ 1) (hf : BoundedVariationOn f (Icc 0 1))
    (hM : ∀ u ∈ Icc (0 : ℝ) 1, 0 ≤ f u ∧ f u ≤ M) :
    primitiveParityK N ε η f ≤
      (finiteSieveDensity P / 3) * (∫ u in (0:ℝ)..1, f u) * Real.log N +
        finiteSieveErrorConstant P * (M + (eVariationOn f (Icc 0 1)).toReal) := by
  have hk := primitiveParityK_le_sieved P N ε η f hP (fun u hu => (hM u hu).1)
  have he := (abs_le.mp (sievedParityJ_error P N ε η f M hP hcop hodd hN hε hη hf hM)).2
  unfold finiteSieveDensity
  nlinarith

end NoThreeLine

#print axioms NoThreeLine.realParityJ_error_sharp
#print axioms NoThreeLine.realParityJ_error
#print axioms NoThreeLine.realParityJ_quotient_error
#print axioms NoThreeLine.sievedParityJ_error
#print axioms NoThreeLine.finite_sieve_BV_upper_bound
