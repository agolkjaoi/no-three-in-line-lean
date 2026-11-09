import NoThreeLine.LongLineExcessBudget
import NoThreeLine.PhysicalLeafRepetition
import NoThreeLine.LongLineOvershootScalar

/-! The explicit normalized cut-density excess envelope includes both the
eta denominator and (1+log n)/log n. Its free accuracy and degree parameters
are fixed before choosing the board-size threshold. -/
set_option autoImplicit false
noncomputable section
open Filter
open scoped Topology

namespace NoThreeLine.FiniteWitnessMoments
open FiniteDirections

def cutLongExcessEnvelope (T ζ δ : ℝ) (k n : ℕ) : ℝ :=
  (16*T^2/(1-(n:ℝ)^(-ζ))^(k+3).choose 2)*((1+Real.log (n:ℝ))/Real.log (n:ℝ))*
    lineExcessFactor (physicalRepeatErrorConstant (k+1)) δ (Real.log (n:ℝ)) k

theorem tendsto_cutLongExcessEnvelope (T ζ δ : ℝ) (k : ℕ) (hζ : 0<ζ) :
    Tendsto (cutLongExcessEnvelope T ζ δ k) atTop
      (𝓝 (16*T^2*(δ+1/(1+δ)^k))) := by
  have hp := tendsto_nat_rpow_negative ζ hζ
  have hd : Tendsto (fun n : ℕ=>(1-(n:ℝ)^(-ζ))^(k+3).choose 2) atTop (𝓝 (1:ℝ)) := by
    simpa only [sub_zero,one_pow] using
      ((tendsto_const_nhds : Tendsto (fun _ : ℕ=>(1:ℝ)) atTop (𝓝 (1:ℝ))).sub hp).pow ((k+3).choose 2)
  have he : Tendsto (fun n : ℕ=>16*T^2/(1-(n:ℝ)^(-ζ))^(k+3).choose 2) atTop (𝓝 (16*T^2)) := by
    have hh := (tendsto_const_nhds : Tendsto (fun _ : ℕ=>16*T^2) atTop (𝓝 (16*T^2))).div hd
      (by norm_num : (1:ℝ)≠0)
    change Tendsto (fun n : ℕ=>16*T^2/(1-(n:ℝ)^(-ζ))^(k+3).choose 2) atTop (𝓝 (16*T^2/1)) at hh
    simpa only [div_one] using hh
  have hl : Tendsto (fun n : ℕ=>(1+Real.log (n:ℝ))/Real.log (n:ℝ)) atTop (𝓝 (1:ℝ)) := by
    simpa only [one_mul,add_comm] using tendsto_affine_log_ratio 1 1
  have hf : Tendsto (fun n : ℕ=>lineExcessFactor (physicalRepeatErrorConstant (k+1)) δ (Real.log (n:ℝ)) k)
      atTop (𝓝 (δ+1/(1+δ)^k)) := by
    simpa only [lineExcessFactor,div_div,add_zero] using
      (tendsto_const_div_log_nat (physicalRepeatErrorConstant (k+1)/δ^k)).const_add (δ+1/(1+δ)^k)
  change Tendsto (fun n : ℕ=>(16*T^2/(1-(n:ℝ)^(-ζ))^(k+3).choose 2)*
    ((1+Real.log (n:ℝ))/Real.log (n:ℝ))*lineExcessFactor (physicalRepeatErrorConstant (k+1)) δ (Real.log (n:ℝ)) k) _ _
  simpa only [mul_one] using (he.mul hl).mul hf

theorem exists_fixed_cutLongExcess_parameters (T ζ ρ : ℝ) (hζ : 0<ζ) (hρ : 0<ρ) :
    ∃δ : ℝ,0<δ ∧ ∃k : ℕ,∀ᶠ n : ℕ in atTop,cutLongExcessEnvelope T ζ δ k n<ρ := by
  let C := 16*T^2
  obtain ⟨δ,hδ,hCe⟩ := exists_pos_mul_lt (half_pos hρ) C
  have h1 : 0<1+δ := by linarith
  have hp := tendsto_pow_atTop_nhds_zero_of_lt_one
    (div_nonneg (by norm_num : (0:ℝ)≤1) h1.le) ((div_lt_one h1).mpr (by linarith : (1:ℝ)<1+δ))
  have hCp : Tendsto (fun k : ℕ=>C*(1/(1+δ))^k) atTop (𝓝 (0:ℝ)) := by
    simpa only [mul_zero] using hp.const_mul C
  obtain ⟨k,hk⟩ := (hCp.eventually (gt_mem_nhds (half_pos hρ))).exists
  have hlim : 16*T^2*(δ+1/(1+δ)^k)<ρ := by
    have he : 1/(1+δ)^k=(1/(1+δ))^k := by simp only [div_pow,one_pow]
    rw [he]
    change C*(δ+(1/(1+δ))^k)<ρ
    nlinarith
  exact ⟨δ,hδ,k,(tendsto_cutLongExcessEnvelope T ζ δ k hζ).eventually (gt_mem_nhds hlim)⟩

end NoThreeLine.FiniteWitnessMoments

#print axioms NoThreeLine.FiniteWitnessMoments.tendsto_cutLongExcessEnvelope
#print axioms NoThreeLine.FiniteWitnessMoments.exists_fixed_cutLongExcess_parameters
