import NoThreeLine.MomentLogTail

/-! Scalar ingredients for the long-leaf positive excess estimate. No actual
leaf moment or integral estimate is assumed or asserted in this module. -/
set_option autoImplicit false
noncomputable section
open Filter
open scoped Topology

namespace NoThreeLine.FiniteWitnessMoments

theorem positive_excess_le_power (k : ℕ) (H D L ε : ℝ)
    (hH : 0≤H) (hD : 0≤D) (hL : 0<L) (hε : 0<ε) :
    max (H-D) 0≤ε*L+H^(k+1)/(D+ε*L)^k := by
  have hb : 0<D+ε*L := add_pos_of_nonneg_of_pos hD (mul_pos hε hL)
  have hp : 0≤H^(k+1)/(D+ε*L)^k := div_nonneg (pow_nonneg hH _) (pow_pos hb _).le
  by_cases he : H≤D+ε*L
  · have hx : max (H-D) 0≤ε*L := max_le (by linarith) (mul_pos hε hL).le
    exact hx.trans (le_add_of_nonneg_right hp)
  · have he' : D+ε*L≤H := (lt_of_not_ge he).le
    have ht : H≤H^(k+1)/(D+ε*L)^k := by
      apply (le_div_iff₀ (pow_pos hb k)).mpr
      calc H*(D+ε*L)^k≤H*H^k := mul_le_mul_of_nonneg_left (pow_le_pow_left₀ hb.le he' k) hH
           _=H^(k+1) := by ring
    exact (max_le (sub_le_self H hD) hH).trans
      (ht.trans (le_add_of_nonneg_left (mul_pos hε hL).le))

theorem overshoot_main_power_le (k : ℕ) (D L ε : ℝ)
    (hD : 0≤D) (hL : 0<L) (hDL : D≤L) (hε : 0<ε) :
    D^(k+1)/(D+ε*L)^k≤L/(1+ε)^k := by
  have hb : 0<D+ε*L := add_pos_of_nonneg_of_pos hD (mul_pos hε hL)
  have h1 : 0<1+ε := by linarith
  have hratio : D/(D+ε*L)≤1/(1+ε) := by
    apply (div_le_div_iff₀ hb h1).mpr
    nlinarith
  calc D^(k+1)/(D+ε*L)^k = D*(D/(D+ε*L))^k := by rw [div_pow]; ring
       _≤L*(1/(1+ε))^k := mul_le_mul hDL
         (pow_le_pow_left₀ (div_nonneg hD hb.le) hratio k)
         (pow_nonneg (div_nonneg hD hb.le) k) hL.le
       _=L/(1+ε)^k := by rw [div_pow,one_pow,mul_one_div]

theorem overshoot_repetition_power_le (k : ℕ) (D L ε B : ℝ)
    (hD : 0≤D) (hL : 0<L) (hε : 0<ε) (hB : 0≤B) :
    B*L^k/(D+ε*L)^k≤B/ε^k := by
  have hb : 0<D+ε*L := add_pos_of_nonneg_of_pos hD (mul_pos hε hL)
  have hratio : L/(D+ε*L)≤1/ε := by
    apply (div_le_div_iff₀ hb hε).mpr
    nlinarith
  calc B*L^k/(D+ε*L)^k = B*(L/(D+ε*L))^k := by rw [div_pow]; ring
       _≤B*(1/ε)^k := mul_le_mul_of_nonneg_left
         (pow_le_pow_left₀ (div_nonneg hL.le hb.le) hratio k) hB
       _=B/ε^k := by rw [div_pow,one_pow,mul_one_div]

theorem overshoot_moment_numerator_le (k : ℕ) (D L ε B C : ℝ)
    (hD : 0≤D) (hL : 0<L) (hDL : D≤L) (hε : 0<ε) (hB : 0≤B) (hC : 0≤C) :
    (D^(k+1)+C*B*L^k)/(D+ε*L)^k≤L/(1+ε)^k+C*B/ε^k := by
  rw [add_div]
  exact add_le_add (overshoot_main_power_le k D L ε hD hL hDL hε)
    (overshoot_repetition_power_le k D L ε (C*B) hD hL hε (mul_nonneg hC hB))

def longOvershootEnvelope (C : ℝ) (K : ℕ→ℝ) (ε : ℝ) (k n : ℕ) : ℝ :=
  C*(ε+(1/(1+ε))^k+K k/(ε^k*Real.log (n:ℝ)))

theorem tendsto_longOvershootEnvelope (C : ℝ) (K : ℕ→ℝ) (ε : ℝ) (k : ℕ) :
    Tendsto (longOvershootEnvelope C K ε k) atTop (𝓝 (C*(ε+(1/(1+ε))^k))) := by
  have hh := (tendsto_const_div_log_nat (K k/ε^k)).const_add (ε+(1/(1+ε))^k)
  change Tendsto (fun n : ℕ=>C*(ε+(1/(1+ε))^k+K k/(ε^k*Real.log (n:ℝ)))) atTop _
  simpa only [add_zero,div_div] using hh.const_mul C

theorem exists_fixed_parameters_overshoot_lt (C : ℝ) (K : ℕ→ℝ) (ρ : ℝ) (hρ : 0<ρ) :
    ∃ε : ℝ, 0<ε ∧ ∃k : ℕ, ∀ᶠ n : ℕ in atTop, longOvershootEnvelope C K ε k n<ρ := by
  obtain ⟨ε,hε,hCe⟩ := exists_pos_mul_lt (half_pos hρ) C
  have h1 : 0<1+ε := by linarith
  have hp := tendsto_pow_atTop_nhds_zero_of_lt_one
    (div_nonneg (by norm_num : (0:ℝ)≤1) h1.le) ((div_lt_one h1).mpr (by linarith : (1:ℝ)<1+ε))
  have hCp : Tendsto (fun k : ℕ=>C*(1/(1+ε))^k) atTop (𝓝 (0:ℝ)) := by
    simpa only [mul_zero] using hp.const_mul C
  obtain ⟨k,hk⟩ := (hCp.eventually (gt_mem_nhds (half_pos hρ))).exists
  have hlim : C*(ε+(1/(1+ε))^k)<ρ := by nlinarith
  exact ⟨ε,hε,k,(tendsto_longOvershootEnvelope C K ε k).eventually (gt_mem_nhds hlim)⟩

end NoThreeLine.FiniteWitnessMoments

#print axioms NoThreeLine.FiniteWitnessMoments.positive_excess_le_power
#print axioms NoThreeLine.FiniteWitnessMoments.overshoot_moment_numerator_le
#print axioms NoThreeLine.FiniteWitnessMoments.exists_fixed_parameters_overshoot_lt
