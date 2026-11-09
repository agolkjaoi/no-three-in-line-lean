import NoThreeLine.SectionHeightBounds
import NoThreeLine.ParityHarmonic
import Mathlib.Analysis.SpecificLimits.Normed

/-! Uniform smallness of the coefficient-one height main term by choosing
the fixed moment degree first. The bound holds for every finite grid cutoff. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open Filter
open scoped BigOperators Topology

namespace NoThreeLine.SectionHeight

theorem height_main_term_le (δ : ℝ) (hδ : 0 < δ) (m h : ℕ) (hm : 3 ≤ m) (hh : 0 < h) :
    (4*(h:ℝ))*(2/(2+δ*(h:ℝ)))^m ≤
      (32/δ^3)*(1/(h:ℝ)^2)*(2/(2+δ))^(m-3) := by
  have hhR : 0 < (h:ℝ) := by exact_mod_cast hh
  have hh1 : (1:ℝ) ≤ h := by exact_mod_cast hh
  have hb0 : 0 ≤ 2/(2+δ*(h:ℝ)) := by positivity
  have hb : 2/(2+δ*(h:ℝ)) ≤ 2/(δ*(h:ℝ)) :=
    div_le_div_of_nonneg_left (by norm_num) (mul_pos hδ hhR) (by linarith)
  have hc : 2/(2+δ*(h:ℝ)) ≤ 2/(2+δ) :=
    div_le_div_of_nonneg_left (by norm_num) (by positivity) (by nlinarith)
  have he : m = 3+(m-3) := by omega
  calc
    _ = (4*(h:ℝ))*((2/(2+δ*(h:ℝ)))^3*(2/(2+δ*(h:ℝ)))^(m-3)) := by
      rw [←pow_add,←he]
    _ ≤ (4*(h:ℝ))*((2/(δ*(h:ℝ)))^3*(2/(2+δ))^(m-3)) :=
      mul_le_mul_of_nonneg_left (mul_le_mul (pow_le_pow_left₀ hb0 hb 3)
        (pow_le_pow_left₀ hb0 hc (m-3)) (pow_nonneg hb0 _) (by positivity)) (by positivity)
    _ = _ := by field_simp; ring

theorem height_main_sum_le (n : ℕ) (δ : ℝ) (hδ : 0 < δ) (m : ℕ) (hm : 3 ≤ m) :
    (∑ h ∈ Finset.Ico 1 n, (4*(h:ℝ))*(2/(2+δ*(h:ℝ)))^m) ≤
      (64/δ^3)*(2/(2+δ))^(m-3) := by
  have hs : (∑ h ∈ Finset.Ico 1 n, (1:ℝ)/(h:ℝ)^2) ≤ 2 :=
    (Finset.sum_le_sum_of_subset_of_nonneg
      (fun h hh => Finset.mem_Icc.mpr ⟨(Finset.mem_Ico.mp hh).1,(Finset.mem_Ico.mp hh).2.le⟩)
      (fun _ _ _ => by positivity)).trans (reciprocal_square_sum_le_two n)
  calc
    _ ≤ ∑ h ∈ Finset.Ico 1 n, (32/δ^3)*(1/(h:ℝ)^2)*(2/(2+δ))^(m-3) :=
      Finset.sum_le_sum (fun h hh => height_main_term_le δ hδ m h hm (Finset.mem_Ico.mp hh).1)
    _ = (32/δ^3)*(∑ h ∈ Finset.Ico 1 n, 1/(h:ℝ)^2)*(2/(2+δ))^(m-3) := by
      rw [Finset.mul_sum,Finset.sum_mul]
    _ ≤ (32/δ^3)*2*(2/(2+δ))^(m-3) :=
      mul_le_mul_of_nonneg_right (mul_le_mul_of_nonneg_left hs (by positivity)) (by positivity)
    _ = _ := by ring

theorem exists_uniform_height_main_degree (δ κ : ℝ) (hδ : 0 < δ) (hκ : 0 < κ) (m0 : ℕ) :
    ∃ m : ℕ, 3 ≤ m ∧ m0 ≤ m ∧ ∀ n : ℕ,
      (∑ h ∈ Finset.Ico 1 n, (4*(h:ℝ))*(2/(2+δ*(h:ℝ)))^m) < κ := by
  have hp := tendsto_pow_atTop_nhds_zero_of_lt_one
    (show (0:ℝ) ≤ 2/(2+δ) by positivity)
    ((div_lt_one (by positivity : (0:ℝ) < 2+δ)).mpr (by linarith))
  have ht : Tendsto (fun k : ℕ => (64/δ^3)*(2/(2+δ))^k) atTop (𝓝 (0:ℝ)) := by
    simpa only [mul_zero] using hp.const_mul (64/δ^3)
  obtain ⟨k,hk,hk0⟩ := ((ht.eventually (gt_mem_nhds hκ)).and (eventually_ge_atTop m0)).exists
  refine ⟨k+3,by omega,by omega,?_⟩
  intro n
  exact (height_main_sum_le n δ hδ (k+3) (by omega)).trans_lt (by simpa only [Nat.add_sub_cancel] using hk)

end NoThreeLine.SectionHeight
#print axioms NoThreeLine.SectionHeight.height_main_sum_le
#print axioms NoThreeLine.SectionHeight.exists_uniform_height_main_degree
