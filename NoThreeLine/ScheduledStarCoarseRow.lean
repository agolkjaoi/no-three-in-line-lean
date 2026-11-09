import NoThreeLine.ShortStarRepeatDecay

/-! The actual finite phase prices supply the deterministic star row bound.
Elapsed time includes every previous phase, not only the current local t. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open PrimitiveLines AuxiliaryODE

def starPriceMultiplier (Γ : Finset ZPoint) (K : ℝ) : ℝ :=
  max 1 (protection 1 K)^Γ.card

theorem starPriceMultiplier_nonneg (Γ : Finset ZPoint) (K : ℝ) :
    0≤starPriceMultiplier Γ K := pow_nonneg (le_max_of_le_left zero_le_one) _

theorem coarseCutPriceCap_le_common {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (Γ : Finset ZPoint) (K start : ℝ) (k : ℕ) (t : ℝ) (ht : 0≤t)
    (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K≤K) (hK2 : K<2) :
    coarseCutPriceCap cs k t≤(phaseEndpoint cs start k-start+t)/n*starPriceMultiplier Γ K := by
  have hc (j : ℕ) : coarsePhasePriceRate (cs j).config≤(1/n)*starPriceMultiplier Γ K := by
    change (1/n)*max 1 (protection 1 (cs j).K)^(cs j).directions.card≤_
    rw [hΓ j]
    apply mul_le_mul_of_nonneg_left _ (div_nonneg zero_le_one (Nat.cast_nonneg _))
    exact pow_le_pow_left₀ (le_max_of_le_left zero_le_one)
      (max_le_max_left 1 (protection_one_le (hK j) hK2)) _
  calc
    _ ≤ (∑j∈Finset.range k,(cs j).horizon*((1/n)*starPriceMultiplier Γ K))+
        t*((1/n)*starPriceMultiplier Γ K) := add_le_add
      (Finset.sum_le_sum (fun j _=>mul_le_mul_of_nonneg_left (hc j) (cs j).horizon.coe_nonneg))
      (mul_le_mul_of_nonneg_left (hc k) ht)
    _ = _ := by
      rw [←Finset.sum_mul]
      unfold phaseEndpoint
      push_cast
      ring

theorem scheduled_elapsed_nonneg {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (start : ℝ) (k : ℕ) (t : ℝ) (ht : 0≤t) : 0≤phaseEndpoint cs start k-start+t := by
  unfold phaseEndpoint
  have hs : 0≤∑j∈Finset.range k,((cs j).horizon : ℝ) := Finset.sum_nonneg (fun j _=>(cs j).horizon.coe_nonneg)
  linarith

end NoThreeLine.BirthWitness

namespace NoThreeLine.ShortStars
open PrimitiveLines BirthWitness

theorem coarseStarRow_le_log {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (Γ : Finset ZPoint) (p : Grid n) (H K start : ℝ) (k : ℕ) (t : ℝ)
    (hn : 0<n) (ht : 0≤t) (hΓ : ∀j,(cs j).directions=Γ)
    (hK : ∀j,(cs j).K≤K) (hK2 : K<2) :
    (∑s∈shortStars Γ p H,cutSelectedCoarsePrice cs start k t s.2)≤
      (16*starPriceMultiplier Γ K)*((phaseEndpoint cs start k-start+t)*(n:ℝ)*(1+Real.log n)) := by
  have hτ := scheduled_elapsed_nonneg cs start k t ht
  have hC := starPriceMultiplier_nonneg Γ K
  have hN : 0<(n:ℝ) := by exact_mod_cast hn
  calc
    _ ≤ ∑_s∈shortStars Γ p H,coarseCutPriceCap cs k t :=
      Finset.sum_le_sum (fun s _=>cutSelectedCoarsePrice_le_cap cs start k t ht s.2)
    _ = ((shortStars Γ p H).card : ℝ)*coarseCutPriceCap cs k t := by simp
    _ ≤ ((shortStars Γ p H).card : ℝ)*
        ((phaseEndpoint cs start k-start+t)/n*starPriceMultiplier Γ K) :=
      mul_le_mul_of_nonneg_left (coarseCutPriceCap_le_common cs Γ K start k t ht hΓ hK hK2) (Nat.cast_nonneg _)
    _ ≤ (16*(n:ℝ)^2*(1+Real.log n))*
        ((phaseEndpoint cs start k-start+t)/n*starPriceMultiplier Γ K) :=
      mul_le_mul_of_nonneg_right (shortStars_card_le_log Γ p H) (mul_nonneg (div_nonneg hτ hN.le) hC)
    _ = _ := by field_simp

theorem actual_repeatBudget_div_le_decay {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (Γ : Finset ZPoint) (p : Grid n) (H K start δ d γ ζ : ℝ) (k : ℕ) (t : ℝ)
    (hn : 2≤n) (hB : 0≤B) (hH : 0≤H) (hδ : 0≤δ) (ht : 0≤t)
    (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K≤K) (hK2 : K<2)
    (hHlog : H≤B*(1+Real.log n)) (hBd : B≤(n:ℝ)^d)
    (hτγ : (n:ℝ)^(γ-1)≤phaseEndpoint cs start k-start+t)
    (hd : d<γ) (hζ : 0<ζ) (m : ℕ) :
    repeatMomentBudget B δ ((n:ℝ)^(-ζ)) H
      (∑s∈shortStars Γ p H,cutSelectedCoarsePrice cs start k t s.2) m/
        ((phaseEndpoint cs start k-start+t)*(n:ℝ)*(1+Real.log n))^m≤
      repeatDecayEnvelope δ (16*starPriceMultiplier Γ K) d γ ζ m n := by
  classical
  have hN : 0<(n:ℝ) := by exact_mod_cast (show 0<n by omega)
  have hτ : 0<phaseEndpoint cs start k-start+t :=
    lt_of_lt_of_le (Real.rpow_pos_of_pos hN (γ-1)) hτγ
  have hL : 1≤1+Real.log (n:ℝ) := by linarith [FiniteWitnessMoments.log_nat_pos hn]
  exact repeatMomentBudget_div_le_decay (by omega : 1≤n) B δ ((n:ℝ)^(-ζ)) H _ (1+Real.log n)
    (16*starPriceMultiplier Γ K) (phaseEndpoint cs start k-start+t) d γ ζ m hB hδ
    (Real.rpow_le_one_of_one_le_of_nonpos (by exact_mod_cast (show 1≤n by omega)) (neg_nonpos.mpr hζ.le))
    hH hL (Finset.sum_nonneg (fun s _=>cutSelectedCoarsePrice_nonneg cs start k t ht s.2))
    (mul_nonneg (by norm_num) (starPriceMultiplier_nonneg Γ K)) hτ hHlog
    (coarseStarRow_le_log cs Γ p H K start k t (by omega) ht hΓ hK hK2) hBd hτγ hd rfl

end NoThreeLine.ShortStars

#print axioms NoThreeLine.BirthWitness.coarseCutPriceCap_le_common
#print axioms NoThreeLine.ShortStars.coarseStarRow_le_log
#print axioms NoThreeLine.ShortStars.actual_repeatBudget_div_le_decay
