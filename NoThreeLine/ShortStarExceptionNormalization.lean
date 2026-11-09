import NoThreeLine.ScheduledStarCoarseRow

/-! Scalar row estimates for the four exceptional numerators.
The slot factors remain explicit. No probability independence is used. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.ShortStars

theorem row_power_le (S P A Q : ℝ) (r : ℕ) (hS : 0≤S) (hP : 0≤P)
    (hQ : 0<Q) (hrow : S*P≤A*Q) :
    S^r*P^(r+1)≤A^r*Q^(r+1)*(P/Q) := by
  calc
    _ = (S*P)^r*P := by rw [mul_pow,pow_succ]; ring
    _ ≤ (A*Q)^r*P := mul_le_mul_of_nonneg_right
      (pow_le_pow_left₀ (mul_nonneg hS hP) hrow _) hP
    _ = _ := by rw [mul_pow,pow_succ]; field_simp

theorem pair_numerator_div_le (S P A Q D : ℝ) (m : ℕ) (hm : 2≤m)
    (hS : 0≤S) (hP : 0≤P) (hQ : 0<Q) (hD : 0≤D) (hrow : S*P≤A*Q) :
    (S*D*S^(m-2)*P^m)/Q^m≤A^(m-1)*D*(P/Q) := by
  have he : S*S^(m-2)=S^(m-1) := by
    rw [←pow_succ']; congr 1; omega
  have hp := mul_le_mul_of_nonneg_left (row_power_le S P A Q (m-1) hS hP hQ hrow) hD
  have hj : m-1+1=m := by omega
  rw [hj] at hp
  apply (div_le_iff₀ (pow_pos hQ m)).mpr
  calc
    _ = D*(S^(m-1)*P^m) := by rw [←he]; ring
    _ ≤ _ := hp
    _ = _ := by ring

theorem triple_numerator_div_le (S P A Q D : ℝ) (m : ℕ) (hm : 3≤m)
    (hS : 0≤S) (hP : 0≤P) (hQ : 0<Q) (hD : 0≤D) (hrow : S*P≤A*Q) :
    (S^2*D*S^(m-3)*P^m)/Q^m≤A^(m-1)*D*(P/Q) := by
  have he : S^2*S^(m-3)=S^(m-1) := by
    rw [←pow_add]; congr 1; omega
  have hp := mul_le_mul_of_nonneg_left (row_power_le S P A Q (m-1) hS hP hQ hrow) hD
  have hj : m-1+1=m := by omega
  rw [hj] at hp
  apply (div_le_iff₀ (pow_pos hQ m)).mpr
  calc
    _ = D*(S^(m-1)*P^m) := by rw [←he]; ring
    _ ≤ _ := hp
    _ = _ := by ring

theorem extra_numerator_div_le (S P A Q R : ℝ) (m : ℕ) (hm : 2≤m)
    (hS : 0≤S) (hP : 0≤P) (hQ : 0<Q) (hR : 0≤R) (hrow : S*P≤A*Q) :
    (S^2*R*S^(m-2)*P^(m+1))/Q^m≤A^m*R*P := by
  have he : S^2*S^(m-2)=S^m := by rw [←pow_add]; congr 1; omega
  have hp := mul_le_mul_of_nonneg_right (pow_le_pow_left₀ (mul_nonneg hS hP) hrow m) (mul_nonneg hR hP)
  apply (div_le_iff₀ (pow_pos hQ m)).mpr
  calc
    _ = (S*P)^m*(R*P) := by rw [mul_pow,pow_succ,←he]; ring
    _ ≤ _ := hp
    _ = _ := by rw [mul_pow]; ring

theorem specifiedMomentBudget_div_le (ξ : ℝ) (hξ : 0<ξ) (n g : ℕ)
    (S δ ε P A Q : ℝ) (m : ℕ) (hm : 2≤m)
    (hS : 0≤S) (hP : 0≤P) (hQ : 0<Q) (hδ : 0≤δ) (hε : ε≤1) (hrow : S*P≤A*Q) :
    specifiedMomentBudget ξ hξ n g S δ ε P m/Q^m≤
      distinctCoarseCost δ ε m*((m*(m-1) : ℕ) : ℝ)*
        (A^(m-1)*(specifiedExceptionConstant ξ hξ*(g:ℝ)*(n:ℝ)^(1+ξ))*(P/Q)) := by
  have hd : 0≤specifiedExceptionConstant ξ hξ*(g:ℝ)*(n:ℝ)^(1+ξ) :=
    mul_nonneg (mul_nonneg (specifiedExceptionConstant_pos ξ hξ).le (Nat.cast_nonneg _))
      (Real.rpow_nonneg (Nat.cast_nonneg _) _)
  have h := mul_le_mul_of_nonneg_left (pair_numerator_div_le S P A Q _ m hm hS hP hQ hd hrow)
    (mul_nonneg (distinctCoarseCost_nonneg δ ε hδ hε m) (Nat.cast_nonneg (m*(m-1))))
  simpa only [specifiedMomentBudget,mul_div_assoc,mul_assoc] using h

theorem longMomentBudget_div_le (n : ℕ) (S H R δ ε P A Q : ℝ) (m : ℕ) (hm : 2≤m)
    (hS : 0≤S) (hP : 0≤P) (hQ : 0<Q) (hH : 0≤H) (hR : 0≤R)
    (hδ : 0≤δ) (hε : ε≤1) (hrow : S*P≤A*Q) :
    longMomentBudget n S H R δ ε P m/Q^m≤
      distinctCoarseCost δ ε m*((m*(m-1) : ℕ) : ℝ)*(A^(m-1)*(16*H*(n:ℝ)^2/R)*(P/Q)) := by
  have hd : 0≤16*H*(n:ℝ)^2/R := by positivity
  have h := mul_le_mul_of_nonneg_left (pair_numerator_div_le S P A Q _ m hm hS hP hQ hd hrow)
    (mul_nonneg (distinctCoarseCost_nonneg δ ε hδ hε m) (Nat.cast_nonneg (m*(m-1))))
  simpa only [longMomentBudget,mul_div_assoc,mul_assoc] using h

theorem witnessMomentBudget_div_le (ξ : ℝ) (hξ : 0<ξ) (n : ℕ)
    (S δ ε P A Q : ℝ) (m : ℕ) (hm : 3≤m)
    (hS : 0≤S) (hP : 0≤P) (hQ : 0<Q) (hδ : 0≤δ) (hε : ε≤1) (hrow : S*P≤A*Q) :
    witnessMomentBudget ξ hξ n S δ ε P m/Q^m≤
      distinctCoarseCost δ ε m*((m^3 : ℕ) : ℝ)*
        (A^(m-1)*(witnessExceptionConstant ξ hξ*(n:ℝ)^(1+ξ))*(P/Q)) := by
  have hd : 0≤witnessExceptionConstant ξ hξ*(n:ℝ)^(1+ξ) :=
    mul_nonneg (witnessExceptionConstant_pos ξ hξ).le (Real.rpow_nonneg (Nat.cast_nonneg _) _)
  have h := mul_le_mul_of_nonneg_left (triple_numerator_div_le S P A Q _ m hm hS hP hQ hd hrow)
    (mul_nonneg (distinctCoarseCost_nonneg δ ε hδ hε m) (Nat.cast_nonneg (m^3)))
  simpa only [witnessMomentBudget,mul_div_assoc,mul_assoc] using h

theorem extraMomentBudget_div_le (S R δ ε P A Q : ℝ) (m : ℕ) (hm : 2≤m)
    (hS : 0≤S) (hP : 0≤P) (hQ : 0<Q) (hR : 0≤R)
    (hδ : 0≤δ) (hε : ε≤1) (hrow : S*P≤A*Q) :
    extraMomentBudget S R δ ε P m/Q^m≤
      extraCoarseCost δ ε m*((m*(m-1) : ℕ) : ℝ)*(A^m*R*P) := by
  have hc : 0≤extraCoarseCost δ ε m :=
    div_nonneg (inv_nonneg.mpr (pow_nonneg hδ _)) (pow_nonneg (sub_nonneg.mpr hε) _)
  have h := mul_le_mul_of_nonneg_left (extra_numerator_div_le S P A Q R m hm hS hP hQ hR hrow)
    (mul_nonneg hc (Nat.cast_nonneg (m*(m-1))))
  simpa only [extraMomentBudget,mul_div_assoc,mul_assoc] using h

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.specifiedMomentBudget_div_le
#print axioms NoThreeLine.ShortStars.longMomentBudget_div_le
#print axioms NoThreeLine.ShortStars.witnessMomentBudget_div_le
#print axioms NoThreeLine.ShortStars.extraMomentBudget_div_le
