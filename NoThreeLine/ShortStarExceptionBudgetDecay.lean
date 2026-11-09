import NoThreeLine.ShortStarExceptionDecay

/-! Concrete n-dependent cutoffs turn the four normalized scalar budgets
into the fixed-degree decaying envelope. The low-degree padding issue of
the coarse three-slot bound is avoided by the explicit m>=3 hypothesis. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.ShortStars

theorem exceptionBudgets_div_le_decay (ξ : ℝ) (hξ : 0<ξ) {n : ℕ} (hn : 0<n) (g : ℕ)
    (S B H δ ε P C τ T L d γ ζ : ℝ) (m : ℕ) (hm : 3≤m)
    (hS : 0≤S) (hH : 0≤H) (hδ : 0≤δ) (hε : ε≤1) (hP : 0≤P) (hC : 0≤C)
    (hτ : 0<τ) (hτT : τ≤T) (hL : 1≤L) (hHL : H≤B*L) (hBd : B≤(n:ℝ)^d)
    (hcap : P≤τ/n*C) (hrow : S*P≤(16*C)*(τ*(n:ℝ)*L)) (heps : ε=(n:ℝ)^(-ζ)) :
    (specifiedMomentBudget ξ hξ n g S δ ε P m+
      longMomentBudget n S H ((n:ℝ)^γ) δ ε P m+
      extraMomentBudget S ((n:ℝ)^γ) δ ε P m+
      witnessMomentBudget ξ hξ n S δ ε P m)/(τ*(n:ℝ)*L)^m≤
      exceptionDecayEnvelope ξ hξ g δ C d γ ζ T m n := by
  have hN : 0<(n:ℝ) := by exact_mod_cast hn
  have hL0 : 0<L := lt_of_lt_of_le zero_lt_one hL
  have hQ : 0<τ*(n:ℝ)*L := mul_pos (mul_pos hτ hN) hL0
  have hR : 0<(n:ℝ)^γ := Real.rpow_pos_of_pos hN γ
  have hA : 0≤16*C := by positivity
  have hc := distinctCoarseCost_nonneg δ ε hδ hε m
  have hcPair : 0≤distinctCoarseCost δ ε m*((m*(m-1) : ℕ) : ℝ) := mul_nonneg hc (Nat.cast_nonneg _)
  have hcTrip : 0≤distinctCoarseCost δ ε m*((m^3 : ℕ) : ℝ) := mul_nonneg hc (Nat.cast_nonneg _)
  have hcExtra : 0≤extraCoarseCost δ ε m*((m*(m-1) : ℕ) : ℝ) :=
    mul_nonneg (div_nonneg (inv_nonneg.mpr (pow_nonneg hδ _))
      (pow_nonneg (sub_nonneg.mpr hε) _)) (Nat.cast_nonneg _)
  have hg3 := g3_scale_le (n:ℝ) τ L P C ξ hN hτ hL hC hcap
  have hlong := (long_scale_le (n:ℝ) τ L P C B H ((n:ℝ)^γ)
    hN hτ hL0 hC hH hR hcap hHL).trans
    (mul_le_mul_of_nonneg_left (growth_over_cutoff_le hn B d γ hBd) hA)
  have hextra : (n:ℝ)^γ*P≤C*T*(n:ℝ)^(γ-1) := by
    simpa only [cutoff_over_board_eq hn] using
      extra_scale_le (n:ℝ) τ T P C ((n:ℝ)^γ) hN hC hR.le hcap hτT
  have h1 : specifiedMomentBudget ξ hξ n g S δ ε P m/(τ*(n:ℝ)*L)^m≤
      distinctCoarseCost δ ε m*((m*(m-1) : ℕ) : ℝ)*
        ((16*C)^(m-1)*(specifiedExceptionConstant ξ hξ*(g:ℝ)*C)*(n:ℝ)^(ξ-1)) := by
    apply (specifiedMomentBudget_div_le ξ hξ n g S δ ε P (16*C) (τ*(n:ℝ)*L) m
      (by omega) hS hP hQ hδ hε hrow).trans
    apply mul_le_mul_of_nonneg_left _ hcPair
    have hh := mul_le_mul_of_nonneg_left hg3 (show 0≤(16*C)^(m-1)*(specifiedExceptionConstant ξ hξ*(g:ℝ)) from
      mul_nonneg (pow_nonneg hA _) (mul_nonneg (specifiedExceptionConstant_pos ξ hξ).le (Nat.cast_nonneg _)))
    convert hh using 1 <;> ring
  have h2 : longMomentBudget n S H ((n:ℝ)^γ) δ ε P m/(τ*(n:ℝ)*L)^m≤
      distinctCoarseCost δ ε m*((m*(m-1) : ℕ) : ℝ)*
        ((16*C)^(m-1)*(16*C)*(n:ℝ)^(d-γ)) := by
    apply (longMomentBudget_div_le n S H ((n:ℝ)^γ) δ ε P (16*C) (τ*(n:ℝ)*L) m
      (by omega) hS hP hQ hH hR.le hδ hε hrow).trans
    apply mul_le_mul_of_nonneg_left _ hcPair
    have hh := mul_le_mul_of_nonneg_left hlong (pow_nonneg hA (m-1))
    convert hh using 1 <;> ring
  have h3 : extraMomentBudget S ((n:ℝ)^γ) δ ε P m/(τ*(n:ℝ)*L)^m≤
      extraCoarseCost δ ε m*((m*(m-1) : ℕ) : ℝ)*
        ((16*C)^m*(C*T)*(n:ℝ)^(γ-1)) := by
    apply (extraMomentBudget_div_le S ((n:ℝ)^γ) δ ε P (16*C) (τ*(n:ℝ)*L) m
      (by omega) hS hP hQ hR.le hδ hε hrow).trans
    apply mul_le_mul_of_nonneg_left _ hcExtra
    have hh := mul_le_mul_of_nonneg_left hextra (pow_nonneg hA m)
    convert hh using 1 <;> ring
  have h4 : witnessMomentBudget ξ hξ n S δ ε P m/(τ*(n:ℝ)*L)^m≤
      distinctCoarseCost δ ε m*((m^3 : ℕ) : ℝ)*
        ((16*C)^(m-1)*(witnessExceptionConstant ξ hξ*C)*(n:ℝ)^(ξ-1)) := by
    apply (witnessMomentBudget_div_le ξ hξ n S δ ε P (16*C) (τ*(n:ℝ)*L) m
      hm hS hP hQ hδ hε hrow).trans
    apply mul_le_mul_of_nonneg_left _ hcTrip
    have hh := mul_le_mul_of_nonneg_left hg3 (show 0≤(16*C)^(m-1)*witnessExceptionConstant ξ hξ from
      mul_nonneg (pow_nonneg hA _) (witnessExceptionConstant_pos ξ hξ).le)
    convert hh using 1 <;> ring
  rw [add_div,add_div,add_div]
  simpa only [exceptionDecayEnvelope,heps] using add_le_add (add_le_add (add_le_add h1 h2) h3) h4

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.exceptionBudgets_div_le_decay
