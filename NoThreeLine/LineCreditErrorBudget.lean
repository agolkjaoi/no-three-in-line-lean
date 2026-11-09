import NoThreeLine.ShellLineCubes
import NoThreeLine.MomentLogScale

/-! The actual geometric cubic-plus-square budget, including the B term
from the root self rate, is o(log n) for B=n^delta with delta<1.
This does not yet identify a stochastic credit-removal error with the budget. -/
set_option autoImplicit false
noncomputable section
open Filter
open scoped BigOperators Topology

namespace NoThreeLine.FiniteDirections
open PrimitiveLines FiniteWitnessMoments

def lineCreditErrorBudget (n : ℕ) (p : ZPoint) (B : ℝ) : ℝ :=
  (∑d∈directionIndices n,(((gridLinePoints n p d.2).card:ℝ)^3+
    B*((gridLinePoints n p d.2).card:ℝ)^2))/(n:ℝ)^3

theorem lineCreditErrorBudget_bounds (n : ℕ) (p : ZPoint) (B : ℝ) (hn : 0<n) (hB : 0≤B) :
    0≤lineCreditErrorBudget n p B ∧
      lineCreditErrorBudget n p B≤64+16*(B/n)*(1+Real.log (n:ℝ)) := by
  have hn0 : (n:ℝ)≠0 := ne_of_gt (by exact_mod_cast hn)
  constructor
  · unfold lineCreditErrorBudget
    positivity
  · calc
      _ = ((∑d∈directionIndices n,((gridLinePoints n p d.2).card:ℝ)^3)+
          B*∑d∈directionIndices n,((gridLinePoints n p d.2).card:ℝ)^2)/(n:ℝ)^3 := by
        simp only [lineCreditErrorBudget,Finset.sum_add_distrib,Finset.mul_sum]
      _ ≤ (64*(n:ℝ)^3+B*(16*(n:ℝ)^2*(1+Real.log (n:ℝ))))/(n:ℝ)^3 :=
        div_le_div_of_nonneg_right (add_le_add (sum_gridLine_card_cube_le n p)
          (mul_le_mul_of_nonneg_left (sum_gridLine_card_sq_le n p hn) hB)) (by positivity)
      _ = _ := by field_simp

theorem tendsto_nat_rpow_div_nat (δ : ℝ) (hδ : δ<1) :
    Tendsto (fun n : ℕ=>(n:ℝ)^δ/(n:ℝ)) atTop (𝓝 (0:ℝ)) := by
  have hh : Tendsto (fun n : ℕ=>(n:ℝ)^(δ-1)) atTop (𝓝 (0:ℝ)) := by
    simpa only [neg_sub] using tendsto_nat_rpow_negative (1-δ) (sub_pos.mpr hδ)
  apply (tendsto_congr' ?_).mpr hh
  filter_upwards [eventually_ge_atTop (1:ℕ)] with n hn
  exact (Real.rpow_sub_one (ne_of_gt (by exact_mod_cast (show 0<n by omega))) δ).symm

theorem tendsto_lineCreditErrorEnvelope (δ : ℝ) (hδ : δ<1) :
    Tendsto (fun n : ℕ=>(64+16*((n:ℝ)^δ/(n:ℝ))*(1+Real.log (n:ℝ)))/Real.log (n:ℝ))
      atTop (𝓝 (0:ℝ)) := by
  have hp := tendsto_nat_rpow_div_nat δ hδ
  have hl : Tendsto (fun n : ℕ=>(1+Real.log (n:ℝ))/Real.log (n:ℝ)) atTop (𝓝 (1:ℝ)) := by
    simpa only [one_mul,add_comm] using tendsto_affine_log_ratio 1 1
  have hh := (tendsto_const_div_log_nat 64).add ((hp.const_mul 16).mul hl)
  simpa only [add_div,mul_div_assoc,mul_zero,zero_mul,zero_add] using hh

theorem tendsto_lineCreditErrorBudget_normalized (p : ℕ→ZPoint) (δ : ℝ) (hδ : δ<1) :
    Tendsto (fun n : ℕ=>lineCreditErrorBudget n (p n) ((n:ℝ)^δ)/Real.log (n:ℝ))
      atTop (𝓝 (0:ℝ)) := by
  apply tendsto_of_tendsto_of_tendsto_of_le_of_le' tendsto_const_nhds
    (tendsto_lineCreditErrorEnvelope δ hδ)
  · filter_upwards [eventually_ge_atTop (2:ℕ)] with n hn
    exact div_nonneg (lineCreditErrorBudget_bounds n (p n) ((n:ℝ)^δ) (by omega)
      (Real.rpow_nonneg (Nat.cast_nonneg n) δ)).1 (log_nat_pos hn).le
  · filter_upwards [eventually_ge_atTop (2:ℕ)] with n hn
    exact div_le_div_of_nonneg_right
      (lineCreditErrorBudget_bounds n (p n) ((n:ℝ)^δ) (by omega) (Real.rpow_nonneg (Nat.cast_nonneg n) δ)).2
      (log_nat_pos hn).le

end NoThreeLine.FiniteDirections

#print axioms NoThreeLine.FiniteDirections.lineCreditErrorBudget_bounds
#print axioms NoThreeLine.FiniteDirections.tendsto_lineCreditErrorBudget_normalized
