import NoThreeLine.OffLineRadius

/-! The radius-restricted gcd sum from the off-line geometric estimate.
The sum is over actual grid-line parameters. Divisor counting and a single
residue class give the position-independent bound `3 R tau(D)`. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.OffLineDivisors
open PrimitiveLines

theorem gcd_le_divisor_indicator_sum (a v p : ZPoint) (R : ℕ)
    (hp : det v (p-a) ≠ 0) (t : ℤ) (ht : distance p (linePoint a v t) ≤ R) :
    displacementGcd p (linePoint a v t) ≤
      ∑ e ∈ (det v (p-a)).natAbs.divisors,
        if e ≤ R ∧ e ∣ displacementGcd p (linePoint a v t) then e else 0 := by
  have hg := linePoint_gcd_mem_divisors a v p hp t
  have hne := on_line_ne_root a v p (linePoint a v t) hp (det_linePoint a v t)
  have hR := (displacementGcd_le_distance p _ hne).trans ht
  have h := Finset.single_le_sum
    (fun e (_ : e ∈ (det v (p-a)).natAbs.divisors) =>
      Nat.zero_le (if e ≤ R ∧ e ∣ displacementGcd p (linePoint a v t) then e else 0)) hg
  have hx : displacementGcd p (linePoint a v t) ≤ R ∧
      displacementGcd p (linePoint a v t) ∣ displacementGcd p (linePoint a v t) :=
    ⟨hR,dvd_refl _⟩
  simpa only [if_pos hx] using h

theorem divisor_indicator_sum_le (n : ℕ) (a v p : ZPoint) (hv : Primitive v)
    (R e : ℕ) (he : 0 < e) :
    (∑ t ∈ radiusParameters n a v p R,
      if e ≤ R ∧ e ∣ displacementGcd p (linePoint a v t) then e else 0) ≤ 3*R := by
  classical
  by_cases hR : e ≤ R
  · simp only [hR,true_and,← parameterCongruence_iff_dvd_gcd]
    rw [← Finset.sum_filter]
    have hc := (divisorParameters_card_mul_le n a v p hv R e he).trans
      (show 2*R+e ≤ 3*R by omega)
    simpa only [divisorParameters,Finset.sum_const,nsmul_eq_mul,Nat.cast_id,mul_comm] using hc
  · simp only [hR,false_and,if_false,Finset.sum_const_zero]
    exact Nat.zero_le _

/-- The exact radius gcd estimate; the root is outside the fixed line. -/
theorem sum_radius_gcd_le (n : ℕ) (a v p : ZPoint) (hv : Primitive v)
    (hp : det v (p-a) ≠ 0) (R : ℕ) :
    (∑ t ∈ radiusParameters n a v p R, displacementGcd p (linePoint a v t)) ≤
      3*R*((det v (p-a)).natAbs.divisors.card) := by
  classical
  calc
    _ ≤ ∑ t ∈ radiusParameters n a v p R,
        ∑ e ∈ (det v (p-a)).natAbs.divisors,
          if e ≤ R ∧ e ∣ displacementGcd p (linePoint a v t) then e else 0 := by
      apply Finset.sum_le_sum
      intro t ht
      exact gcd_le_divisor_indicator_sum a v p R hp t (Finset.mem_filter.mp ht).2
    _ = ∑ e ∈ (det v (p-a)).natAbs.divisors,
        ∑ t ∈ radiusParameters n a v p R,
          if e ≤ R ∧ e ∣ displacementGcd p (linePoint a v t) then e else 0 :=
      Finset.sum_comm
    _ ≤ ∑ _e ∈ (det v (p-a)).natAbs.divisors, 3*R := by
      apply Finset.sum_le_sum
      intro e he
      exact divisor_indicator_sum_le n a v p hv R e (Nat.pos_of_mem_divisors he)
    _ = _ := by simp only [Finset.sum_const,nsmul_eq_mul,Nat.cast_id]; ring

end NoThreeLine.OffLineDivisors

#print axioms NoThreeLine.OffLineDivisors.sum_radius_gcd_le
