import NoThreeLine.ShortStarExceptionNormalization

/-! Actual cardinality times the actual price cap supplies the row bound
used for exceptional sums. Scalar factors expose the three small ratios. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.ShortStars
open PrimitiveLines BirthWitness

theorem starCard_mul_cap_le_log {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (Γ : Finset ZPoint) (p : Grid n) (H K start : ℝ) (k : ℕ) (t : ℝ)
    (hn : 0<n) (ht : 0≤t) (hΓ : ∀j,(cs j).directions=Γ)
    (hK : ∀j,(cs j).K≤K) (hK2 : K<2) :
    ((shortStars Γ p H).card : ℝ)*coarseCutPriceCap cs k t≤
      (16*starPriceMultiplier Γ K)*((phaseEndpoint cs start k-start+t)*(n:ℝ)*(1+Real.log n)) := by
  have hτ := scheduled_elapsed_nonneg cs start k t ht
  have hC := starPriceMultiplier_nonneg Γ K
  have hN : 0<(n:ℝ) := by exact_mod_cast hn
  calc
    _ ≤ ((shortStars Γ p H).card : ℝ)*
        ((phaseEndpoint cs start k-start+t)/n*starPriceMultiplier Γ K) :=
      mul_le_mul_of_nonneg_left (coarseCutPriceCap_le_common cs Γ K start k t ht hΓ hK hK2) (Nat.cast_nonneg _)
    _ ≤ (16*(n:ℝ)^2*(1+Real.log n))*
        ((phaseEndpoint cs start k-start+t)/n*starPriceMultiplier Γ K) :=
      mul_le_mul_of_nonneg_right (shortStars_card_le_log Γ p H) (mul_nonneg (div_nonneg hτ hN.le) hC)
    _ = _ := by field_simp

theorem cap_div_scale_le (N τ L P C : ℝ) (hN : 0<N) (hτ : 0<τ) (hL : 0<L)
    (hcap : P≤τ/N*C) : P/(τ*N*L)≤C/(N^2*L) := by
  calc
    _ ≤ (τ/N*C)/(τ*N*L) := div_le_div_of_nonneg_right hcap (mul_pos (mul_pos hτ hN) hL).le
    _ = _ := by field_simp

theorem g3_scale_le (N τ L P C ξ : ℝ) (hN : 0<N) (hτ : 0<τ) (hL : 1≤L)
    (hC : 0≤C) (hcap : P≤τ/N*C) :
    N^(1+ξ)*(P/(τ*N*L))≤C*N^(ξ-1) := by
  have hL0 : 0<L := lt_of_lt_of_le zero_lt_one hL
  have he : N^(1+ξ)/N^2=N^(ξ-1) := by
    rw [show N^(2:ℕ)=N^(2:ℝ) from (Real.rpow_natCast N 2).symm,←Real.rpow_sub hN]
    congr 1
    ring
  calc
    _ ≤ N^(1+ξ)*(C/(N^2*L)) := mul_le_mul_of_nonneg_left
      (cap_div_scale_le N τ L P C hN hτ hL0 hcap) (Real.rpow_nonneg hN.le _)
    _ = C*(N^(ξ-1)/L) := by rw [←he]; field_simp
    _ ≤ C*N^(ξ-1) := mul_le_mul_of_nonneg_left
      (div_le_self (Real.rpow_nonneg hN.le _) hL) hC

theorem long_scale_le (N τ L P C B H R : ℝ) (hN : 0<N) (hτ : 0<τ)
    (hL : 0<L) (hC : 0≤C) (hH : 0≤H) (hR : 0<R)
    (hcap : P≤τ/N*C) (hHL : H≤B*L) :
    (16*H*N^2/R)*(P/(τ*N*L))≤16*C*(B/R) := by
  have hf : 0≤16*H*N^2/R := by positivity
  calc
    _ ≤ (16*H*N^2/R)*(C/(N^2*L)) := mul_le_mul_of_nonneg_left
      (cap_div_scale_le N τ L P C hN hτ hL hcap) hf
    _ = (16*C/R)*(H/L) := by field_simp
    _ ≤ (16*C/R)*B := mul_le_mul_of_nonneg_left ((div_le_iff₀ hL).mpr hHL) (by positivity)
    _ = _ := by ring

theorem extra_scale_le (N τ T P C R : ℝ) (hN : 0<N) (hC : 0≤C) (hR : 0≤R)
    (hcap : P≤τ/N*C) (hτT : τ≤T) : R*P≤C*T*(R/N) := by
  calc
    _ ≤ R*(τ/N*C) := mul_le_mul_of_nonneg_left hcap hR
    _ ≤ R*(T/N*C) := mul_le_mul_of_nonneg_left
      (mul_le_mul_of_nonneg_right (div_le_div_of_nonneg_right hτT hN.le) hC) hR
    _ = _ := by ring

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.starCard_mul_cap_le_log
#print axioms NoThreeLine.ShortStars.g3_scale_le
#print axioms NoThreeLine.ShortStars.long_scale_le
#print axioms NoThreeLine.ShortStars.extra_scale_le
