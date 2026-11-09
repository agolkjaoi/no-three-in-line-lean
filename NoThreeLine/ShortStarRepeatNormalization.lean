import NoThreeLine.ScheduledCutShortStarMoment

/-! A fixed-degree scalar normalization of the actual repeated-tuple budget.
The finite index set keeps j<m. No asymptotic or geometric input is assumed
proved by this helper. Q denotes the full normalization scale. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.ShortStars

theorem repeat_monomial_le {m a j : ℕ} (hja : j≤a) (ham : a≤m) (hjm : j<m)
    (B H L U A Q : ℝ) (hB : 0≤B) (hH : 0≤H) (hL : 1≤L) (hU : 0≤U)
    (hA : 0≤A) (hQ : 0<Q) (hHL : H≤B*L) (hUQ : U≤A*Q) (hx : B*L/Q≤1) :
    B^(m-a)*H^(a-j)*U^j≤(B*L/Q)*A^j*Q^m := by
  let x := B*L/Q
  have hL0 : 0≤L := zero_le_one.trans hL
  have hx0 : 0≤x := div_nonneg (mul_nonneg hB hL0) hQ.le
  have hx1 : x≤1 := hx
  have hB' : B≤B*L := by nlinarith
  have hs : m-a+(a-j)=m-j := by omega
  have ht : m-j+j=m := Nat.sub_add_cancel (hjm.le)
  have hbl : B*L=x*Q := (div_mul_cancel₀ (B*L) (ne_of_gt hQ)).symm
  have hxp : x^(m-j)≤x := by
    obtain ⟨r,hr⟩ := Nat.exists_eq_succ_of_ne_zero (Nat.ne_of_gt (Nat.sub_pos_of_lt hjm))
    rw [hr,pow_succ]
    exact mul_le_of_le_one_left hx0 (pow_le_one₀ hx0 hx1)
  calc
    _ ≤ (B*L)^(m-a)*(B*L)^(a-j)*(A*Q)^j :=
      mul_le_mul (mul_le_mul (pow_le_pow_left₀ hB hB' _) (pow_le_pow_left₀ hH hHL _)
        (pow_nonneg hH _) (pow_nonneg (mul_nonneg hB hL0) _))
        (pow_le_pow_left₀ hU hUQ _) (pow_nonneg hU _)
        (mul_nonneg (pow_nonneg (mul_nonneg hB hL0) _) (pow_nonneg (mul_nonneg hB hL0) _))
    _ = (B*L)^(m-j)*(A^j*Q^j) := by rw [←pow_add,hs,mul_pow A Q]
    _ = x^(m-j)*A^j*Q^m := by
      have hp : Q^(m-j)*Q^j=Q^m := by rw [←pow_add,ht]
      rw [hbl,mul_pow]
      calc
        _ = x^(m-j)*A^j*(Q^(m-j)*Q^j) := by ring
        _ = _ := by rw [hp]
    _ ≤ x*A^j*Q^m := mul_le_mul_of_nonneg_right
      (mul_le_mul_of_nonneg_right hxp (pow_nonneg hA _)) (pow_nonneg hQ.le _)

def repeatFloorFactor (δ ε : ℝ) (a j : ℕ) : ℝ :=
  (δ^((a+1)^3))⁻¹/(1-ε)^(a+j+1).choose 2

def repeatNormalizationConstant (δ ε A : ℝ) (m : ℕ) : ℝ :=
  ∑aj∈repeatIndices m,repeatFloorFactor δ ε aj.1 aj.2*(repeatPatternCount m aj.1 aj.2 : ℝ)*A^aj.2

theorem repeatMomentBudget_le_normalization (B δ ε H U L A Q : ℝ) (m : ℕ)
    (hB : 0≤B) (hδ : 0≤δ) (hε : ε≤1) (hH : 0≤H) (hL : 1≤L) (hU : 0≤U)
    (hA : 0≤A) (hQ : 0<Q) (hHL : H≤B*L) (hUQ : U≤A*Q) (hx : B*L/Q≤1) :
    repeatMomentBudget B δ ε H U m≤repeatNormalizationConstant δ ε A m*(B*L/Q)*Q^m := by
  classical
  unfold repeatMomentBudget repeatNormalizationConstant
  rw [Finset.sum_mul,Finset.sum_mul]
  apply Finset.sum_le_sum
  intro aj haj
  have hc := Finset.mem_filter.mp haj
  have hm := Finset.mem_product.mp hc.1
  have ha : aj.1≤m := Nat.le_of_lt_succ (Finset.mem_range.mp hm.1)
  have hj : aj.2<m := Finset.mem_range.mp hm.2
  have hf : 0≤repeatFloorFactor δ ε aj.1 aj.2 :=
    div_nonneg (inv_nonneg.mpr (pow_nonneg hδ _)) (pow_nonneg (sub_nonneg.mpr hε) _)
  calc
    _ = (repeatFloorFactor δ ε aj.1 aj.2*(repeatPatternCount m aj.1 aj.2 : ℝ))*
        (B^(m-aj.1)*H^(aj.1-aj.2)*U^aj.2) := by
      unfold repeatCoarseCost repeatFloorFactor
      ring
    _ ≤ (repeatFloorFactor δ ε aj.1 aj.2*(repeatPatternCount m aj.1 aj.2 : ℝ))*
        ((B*L/Q)*A^aj.2*Q^m) := mul_le_mul_of_nonneg_left
      (repeat_monomial_le hc.2 ha hj B H L U A Q hB hH hL hU hA hQ hHL hUQ hx)
      (mul_nonneg hf (Nat.cast_nonneg _))
    _ = _ := by ring

theorem repeatMomentBudget_div_le (B δ ε H U L A Q : ℝ) (m : ℕ)
    (hB : 0≤B) (hδ : 0≤δ) (hε : ε≤1) (hH : 0≤H) (hL : 1≤L) (hU : 0≤U)
    (hA : 0≤A) (hQ : 0<Q) (hHL : H≤B*L) (hUQ : U≤A*Q) (hx : B*L/Q≤1) :
    repeatMomentBudget B δ ε H U m/Q^m≤repeatNormalizationConstant δ ε A m*(B*L/Q) :=
  (div_le_iff₀ (pow_pos hQ m)).mpr
    (repeatMomentBudget_le_normalization B δ ε H U L A Q m hB hδ hε hH hL hU hA hQ hHL hUQ hx)

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.repeatMomentBudget_div_le
