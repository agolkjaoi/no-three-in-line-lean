import NoThreeLine.ShortStarExceptionBudgetDecay

/-! The four budgets of the actual finite schedule are bounded by one
fixed-degree decaying envelope. No price or cardinality bound is assumed. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.ShortStars
open PrimitiveLines BirthWitness

theorem actual_exceptionBudgets_div_le_decay (ξ : ℝ) (hξ : 0<ξ)
    {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (Γ : Finset ZPoint) (p : Grid n)
    (H K start δ d γ ζ T : ℝ) (k : ℕ) (t : ℝ)
    (hn : 2≤n) (hH : 0≤H) (hδ : 0≤δ) (ht : 0≤t)
    (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K≤K) (hK2 : K<2)
    (hHlog : H≤B*(1+Real.log n)) (hBd : B≤(n:ℝ)^d)
    (hτ : 0<phaseEndpoint cs start k-start+t) (hτT : phaseEndpoint cs start k-start+t≤T)
    (hζ : 0<ζ) (m : ℕ) (hm : 3≤m) :
    (specifiedMomentBudget ξ hξ n Γ.card (shortStars Γ p H).card δ ((n:ℝ)^(-ζ)) (coarseCutPriceCap cs k t) m+
      longMomentBudget n (shortStars Γ p H).card H ((n:ℝ)^γ) δ ((n:ℝ)^(-ζ)) (coarseCutPriceCap cs k t) m+
      extraMomentBudget (shortStars Γ p H).card ((n:ℝ)^γ) δ ((n:ℝ)^(-ζ)) (coarseCutPriceCap cs k t) m+
      witnessMomentBudget ξ hξ n (shortStars Γ p H).card δ ((n:ℝ)^(-ζ)) (coarseCutPriceCap cs k t) m)/
        ((phaseEndpoint cs start k-start+t)*(n:ℝ)*(1+Real.log n))^m≤
      exceptionDecayEnvelope ξ hξ Γ.card δ (starPriceMultiplier Γ K) d γ ζ T m n := by
  have hL : 1≤1+Real.log (n:ℝ) := by linarith [FiniteWitnessMoments.log_nat_pos hn]
  exact exceptionBudgets_div_le_decay ξ hξ (by omega : 0<n) Γ.card
    (shortStars Γ p H).card B H δ ((n:ℝ)^(-ζ)) (coarseCutPriceCap cs k t)
    (starPriceMultiplier Γ K) (phaseEndpoint cs start k-start+t) T (1+Real.log n) d γ ζ m hm
    (Nat.cast_nonneg _) hH hδ
    (Real.rpow_le_one_of_one_le_of_nonpos (by exact_mod_cast (show 1≤n by omega)) (neg_nonpos.mpr hζ.le))
    (coarseCutPriceCap_nonneg cs k t ht) (starPriceMultiplier_nonneg Γ K) hτ hτT hL hHlog hBd
    (coarseCutPriceCap_le_common cs Γ K start k t ht hΓ hK hK2)
    (starCard_mul_cap_le_log cs Γ p H K start k t (by omega) ht hΓ hK hK2) rfl

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.actual_exceptionBudgets_div_le_decay
