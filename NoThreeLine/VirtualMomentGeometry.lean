import NoThreeLine.ScheduledVirtualMoment

/-! G3 cancels the a distinct-witness factors 1/n. Constants depend on
the fixed degree and guard parameters, not on the board size or line. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.VirtualWitness
open AuxiliaryODE PrimitiveLines BirthWitness

def geometryConstant (ξ : ℝ) (hξ : 0 < ξ) : ℝ :=
  (candidates_card_le_const_rpow ξ hξ).choose

theorem geometryConstant_pos (ξ : ℝ) (hξ : 0 < ξ) : 0 < geometryConstant ξ hξ :=
  (candidates_card_le_const_rpow ξ hξ).choose_spec.1

theorem candidates_le_geometryConstant (ξ : ℝ) (hξ : 0 < ξ) {n : ℕ}
    (L : LineIndex n) (q : Grid n) (hq : q ∉ L.val) :
    ((candidates L q).card : ℝ) ≤ geometryConstant ξ hξ * (n : ℝ)^(1+ξ) :=
  (candidates_card_le_const_rpow ξ hξ).choose_spec.2 n L q hq

def degreeCoefficient (Γ : Finset ZPoint) (K δ C T : ℝ) (m a : ℕ) : ℝ :=
  2^m * (a : ℝ)^m * physicalBoardConstant Γ K δ a * (C*T)^a

def degreeConstant (Γ : Finset ZPoint) (K δ C T : ℝ) (m : ℕ) : ℝ :=
  1 + ∑ a ∈ Finset.Icc 1 m, degreeCoefficient Γ K δ C T m a

theorem degreeCoefficient_nonneg (Γ : Finset ZPoint) (K δ C T : ℝ) (hδ : 0 < δ)
    (hC : 0 ≤ C) (hT : 0 ≤ T) (m a : ℕ) : 0 ≤ degreeCoefficient Γ K δ C T m a := by
  unfold degreeCoefficient
  exact mul_nonneg (mul_nonneg (mul_nonneg (by positivity) (by positivity))
    (physicalBoardConstant_pos Γ K δ hδ a).le) (pow_nonneg (mul_nonneg hC hT) _)

theorem degreeConstant_pos (Γ : Finset ZPoint) (K δ C T : ℝ) (hδ : 0 < δ)
    (hC : 0 ≤ C) (hT : 0 ≤ T) (m : ℕ) : 0 < degreeConstant Γ K δ C T m := by
  have hsum := Finset.sum_nonneg (s := Finset.Icc 1 m)
    (fun a _ => degreeCoefficient_nonneg Γ K δ C T hδ hC hT m a)
  unfold degreeConstant
  linarith

theorem scalar_candidate_moment_le {n m : ℕ} (Γ : Finset ZPoint) (K δ C T B τ x ξ : ℝ)
    (hn : 0 < n) (hδ : 0 < δ) (hC : 0 ≤ C) (hB : 0 ≤ B)
    (hτ : 0 ≤ τ) (hτT : τ ≤ T) (hx : 0 ≤ x) (hxn : x ≤ C * (n : ℝ)^(1+ξ)) :
    (2:ℝ)^m * ∑ a ∈ Finset.Icc 1 m, B^(m-a) * (a : ℝ)^m *
      (x^a * (physicalBoardConstant Γ K δ a * (τ/n)^a)) ≤
      degreeConstant Γ K δ C T m * ∑ a ∈ Finset.Icc 1 m, B^(m-a) * (n : ℝ)^((a : ℝ)*ξ) := by
  have hN : 0 < (n : ℝ) := by exact_mod_cast hn
  have hT : 0 ≤ T := hτ.trans hτT
  have hratio : x * (τ/n) ≤ (C*T) * (n : ℝ)^ξ := by
    calc
      _ ≤ (C * (n : ℝ)^(1+ξ)) * (τ/n) :=
        mul_le_mul_of_nonneg_right hxn (div_nonneg hτ hN.le)
      _ ≤ (C * (n : ℝ)^(1+ξ)) * (T/n) :=
        mul_le_mul_of_nonneg_left (div_le_div_of_nonneg_right hτT hN.le)
          (mul_nonneg hC (Real.rpow_nonneg hN.le _))
      _ = _ := by rw [Real.rpow_add hN, Real.rpow_one]; field_simp
  rw [Finset.mul_sum, Finset.mul_sum]
  apply Finset.sum_le_sum
  intro a ha
  have hp := pow_le_pow_left₀ (mul_nonneg hx (div_nonneg hτ hN.le)) hratio a
  have hr : ((n : ℝ)^ξ)^a = (n : ℝ)^((a : ℝ)*ξ) := by
    rw [← Real.rpow_mul_natCast hN.le, mul_comm ξ]
  have hc : degreeCoefficient Γ K δ C T m a ≤ degreeConstant Γ K δ C T m := by
    have hh := Finset.single_le_sum
      (fun b _ => degreeCoefficient_nonneg Γ K δ C T hδ hC hT m b) ha
    unfold degreeConstant
    linarith
  calc
    _ = (2:ℝ)^m * B^(m-a) * (a:ℝ)^m * physicalBoardConstant Γ K δ a * (x*(τ/n))^a := by
      rw [mul_pow]; ring
    _ ≤ (2:ℝ)^m * B^(m-a) * (a:ℝ)^m * physicalBoardConstant Γ K δ a *
        ((C*T)*(n:ℝ)^ξ)^a := mul_le_mul_of_nonneg_left hp
      (mul_nonneg (mul_nonneg (mul_nonneg (by positivity) (pow_nonneg hB _)) (by positivity))
        (physicalBoardConstant_pos Γ K δ hδ a).le)
    _ = degreeCoefficient Γ K δ C T m a * (B^(m-a)*(n:ℝ)^((a:ℝ)*ξ)) := by
      rw [mul_pow, hr]; unfold degreeCoefficient; ring
    _ ≤ _ := mul_le_mul_of_nonneg_right hc
      (mul_nonneg (pow_nonneg hB _) (Real.rpow_nonneg hN.le _))

end NoThreeLine.VirtualWitness

#print axioms NoThreeLine.VirtualWitness.scalar_candidate_moment_le
