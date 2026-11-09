import NoThreeLine.ShortStarRepeatNormalization
import NoThreeLine.MomentLogScale

/-! Fixed-degree decay for the repeated-tuple scalar envelope. The actual
geometric row bound must still be supplied separately when applying it. -/
set_option autoImplicit false
noncomputable section
open Filter
open scoped BigOperators Topology

namespace NoThreeLine.ShortStars

theorem tendsto_repeatNormalizationConstant {α : Type*} {l : Filter α}
    (δ A : ℝ) (m : ℕ) (ε : α→ℝ) (hε : Tendsto ε l (𝓝 0)) :
    Tendsto (fun x=>repeatNormalizationConstant δ (ε x) A m) l
      (𝓝 (repeatNormalizationConstant δ 0 A m)) := by
  classical
  unfold repeatNormalizationConstant
  apply tendsto_finsetSum
  intro aj _
  have hd := ((tendsto_const_nhds (x:=(1:ℝ))).sub hε).pow ((aj.1+aj.2+1).choose 2)
  have hf := (tendsto_const_nhds (x:=(δ^((aj.1+1)^3))⁻¹)).div hd (by simp)
  simpa only [repeatFloorFactor,Pi.div_apply] using
    (hf.mul_const (repeatPatternCount m aj.1 aj.2 : ℝ)).mul_const (A^aj.2)

def repeatDecayEnvelope (δ A d γ ζ : ℝ) (m n : ℕ) : ℝ :=
  repeatNormalizationConstant δ ((n:ℝ)^(-ζ)) A m*(n:ℝ)^(d-γ)

theorem tendsto_repeatDecayEnvelope (δ A d γ ζ : ℝ) (m : ℕ)
    (hd : d<γ) (hζ : 0<ζ) :
    Tendsto (repeatDecayEnvelope δ A d γ ζ m) atTop (𝓝 0) := by
  unfold repeatDecayEnvelope
  have he := FiniteWitnessMoments.tendsto_nat_rpow_negative ζ hζ
  have hp : Tendsto (fun n : ℕ=>(n:ℝ)^(d-γ)) atTop (𝓝 0) := by
    simpa only [neg_sub] using
      FiniteWitnessMoments.tendsto_nat_rpow_negative (γ-d) (sub_pos.mpr hd)
  simpa only [repeatDecayEnvelope,mul_zero] using
    (tendsto_repeatNormalizationConstant δ A m _ he).mul hp

theorem elapsed_ratio_le_rpow (n : ℕ) (hn : 1≤n) (B τ d γ : ℝ)
    (hB : 0≤B) (hτ : 0<τ) (hBd : B≤(n:ℝ)^d) (hτγ : (n:ℝ)^(γ-1)≤τ) :
    B/(τ*(n:ℝ))≤(n:ℝ)^(d-γ) := by
  have hN : 0<(n:ℝ) := by exact_mod_cast (show 0<n by omega)
  have he : (n:ℝ)^(γ-1)*(n:ℝ)=(n:ℝ)^γ := by
    rw [Real.rpow_sub_one (ne_of_gt hN),div_mul_cancel₀ _ (ne_of_gt hN)]
  have hl : (n:ℝ)^γ≤τ*(n:ℝ) := by
    rw [←he]
    exact mul_le_mul_of_nonneg_right hτγ hN.le
  rw [Real.rpow_sub hN]
  exact div_le_div₀ (Real.rpow_nonneg hN.le d) hBd (Real.rpow_pos_of_pos hN γ) hl

theorem repeatMomentBudget_div_le_decay {n : ℕ} (hn : 1≤n)
    (B δ ε H U L A τ d γ ζ : ℝ) (m : ℕ)
    (hB : 0≤B) (hδ : 0≤δ) (hε : ε≤1) (hH : 0≤H) (hL : 1≤L) (hU : 0≤U)
    (hA : 0≤A) (hτ : 0<τ) (hHL : H≤B*L) (hUQ : U≤A*(τ*(n:ℝ)*L))
    (hBd : B≤(n:ℝ)^d) (hτγ : (n:ℝ)^(γ-1)≤τ) (hd : d<γ)
    (heps : ε=(n:ℝ)^(-ζ)) :
    repeatMomentBudget B δ ε H U m/(τ*(n:ℝ)*L)^m≤repeatDecayEnvelope δ A d γ ζ m n := by
  classical
  have hN : 0<(n:ℝ) := by exact_mod_cast (show 0<n by omega)
  have hL0 : 0<L := lt_of_lt_of_le zero_lt_one hL
  have hQ : 0<τ*(n:ℝ)*L := mul_pos (mul_pos hτ hN) hL0
  have he : B*L/(τ*(n:ℝ)*L)=B/(τ*(n:ℝ)) := by
    rw [mul_div_mul_right B (τ*(n:ℝ)) (ne_of_gt hL0)]
  have hx := elapsed_ratio_le_rpow n hn B τ d γ hB hτ hBd hτγ
  have hx1 : B*L/(τ*(n:ℝ)*L)≤1 := by
    rw [he]
    exact hx.trans (Real.rpow_le_one_of_one_le_of_nonpos (by exact_mod_cast hn) (sub_nonpos.mpr hd.le))
  have hf : 0≤repeatNormalizationConstant δ ε A m := by
    unfold repeatNormalizationConstant repeatFloorFactor
    exact Finset.sum_nonneg (fun aj _=>mul_nonneg
      (mul_nonneg (div_nonneg (inv_nonneg.mpr (pow_nonneg hδ _))
        (pow_nonneg (sub_nonneg.mpr hε) _)) (Nat.cast_nonneg _)) (pow_nonneg hA _))
  apply (repeatMomentBudget_div_le B δ ε H U L A (τ*(n:ℝ)*L) m
    hB hδ hε hH hL hU hA hQ hHL hUQ hx1).trans
  rw [he]
  simpa only [repeatDecayEnvelope,heps] using mul_le_mul_of_nonneg_left hx hf

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.tendsto_repeatDecayEnvelope
#print axioms NoThreeLine.ShortStars.repeatMomentBudget_div_le_decay
