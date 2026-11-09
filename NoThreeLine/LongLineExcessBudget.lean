import NoThreeLine.RootBoardLineBudget

/-! The actual root-line long threshold absorbs the repeated-leaf term
into the square-length budget. This is a finite geometric inequality. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.FiniteDirections
open PrimitiveLines AuxiliaryODE

def longRootBoardLines {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) : Finset (RootBoardLineIndex p) := by
  classical
  exact Finset.univ.filter (fun L=>¬specified Γ L.val ∧ H≤(L.val.val.card:ℝ))

theorem mem_longRootBoardLines {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) (L : RootBoardLineIndex p) :
    L∈longRootBoardLines Γ p H ↔ ¬specified Γ L.val ∧ H≤(L.val.val.card:ℝ) := by
  classical
  simp only [longRootBoardLines,Finset.mem_filter,Finset.mem_univ,true_and]

theorem sum_rootBoardLine_squares_le {n : ℕ} (p : Grid n) :
    (∑L : RootBoardLineIndex p,(L.val.val.card:ℝ)^2)≤16*(n:ℝ)^2*(1+Real.log (n:ℝ)) :=
  (sum_rootBoardLine_le_directions p (fun S=>(S.card:ℝ)^2) (fun _ _=>sq_nonneg _)).trans
    (sum_gridLine_card_sq_le n (gridEmbed p) ((Nat.zero_le p.1.val).trans_lt p.1.isLt))

def lineExcessFactor (C δ ℓ : ℝ) (k : ℕ) : ℝ := δ+1/(1+δ)^k+C/(δ^k*ℓ)

theorem lineExcessFactor_nonneg (C δ ℓ : ℝ) (k : ℕ) (hC : 0≤C) (hδ : 0<δ) (hℓ : 0<ℓ) :
    0≤lineExcessFactor C δ ℓ k := by unfold lineExcessFactor; positivity

theorem long_line_excess_le_square (L B C δ ℓ : ℝ) (k : ℕ)
    (hL : 0≤L) (hC : 0≤C) (hδ : 0<δ) (hℓ : 0<ℓ) (hlong : B*ℓ≤L) :
    L*(δ*L+L/(1+δ)^k+C*B/δ^k)≤lineExcessFactor C δ ℓ k*L^2 := by
  have hb : B≤L/ℓ := (le_div_iff₀ hℓ).mpr hlong
  have he : C*B/δ^k≤C/(δ^k*ℓ)*L := by
    calc
      _ ≤ C*(L/ℓ)/δ^k := div_le_div_of_nonneg_right (mul_le_mul_of_nonneg_left hb hC) (pow_nonneg hδ.le k)
      _ = _ := by ring
  calc
    _ ≤ L*(δ*L+L/(1+δ)^k+C/(δ^k*ℓ)*L) :=
      mul_le_mul_of_nonneg_left (add_le_add le_rfl he) hL
    _ = _ := by unfold lineExcessFactor; ring

theorem longRootBoardLine_excess_sum_bound {n : ℕ} (Γ : Finset ZPoint) (p : Grid n)
    (B C δ ℓ : ℝ) (k : ℕ) (hC : 0≤C) (hδ : 0<δ) (hℓ : 0<ℓ) :
    (∑L∈longRootBoardLines Γ p (B*ℓ),(L.val.val.card:ℝ)*
      (δ*(L.val.val.card:ℝ)+(L.val.val.card:ℝ)/(1+δ)^k+C*B/δ^k))≤
        lineExcessFactor C δ ℓ k*(16*(n:ℝ)^2*(1+Real.log (n:ℝ))) := by
  classical
  have hF := lineExcessFactor_nonneg C δ ℓ k hC hδ hℓ
  calc
    _ ≤ ∑L∈longRootBoardLines Γ p (B*ℓ),lineExcessFactor C δ ℓ k*(L.val.val.card:ℝ)^2 := by
      apply Finset.sum_le_sum
      intro L hL
      exact long_line_excess_le_square _ B C δ ℓ k (Nat.cast_nonneg _) hC hδ hℓ
        ((mem_longRootBoardLines Γ p (B*ℓ) L).mp hL).2
    _ = lineExcessFactor C δ ℓ k*∑L∈longRootBoardLines Γ p (B*ℓ),(L.val.val.card:ℝ)^2 :=
      (Finset.mul_sum _ _ _).symm
    _ ≤ lineExcessFactor C δ ℓ k*∑L : RootBoardLineIndex p,(L.val.val.card:ℝ)^2 := by
      apply mul_le_mul_of_nonneg_left _ hF
      exact Finset.sum_le_sum_of_subset_of_nonneg (Finset.subset_univ _) (fun _ _ _=>sq_nonneg _)
    _ ≤ _ := mul_le_mul_of_nonneg_left (sum_rootBoardLine_squares_le p) hF

end NoThreeLine.FiniteDirections

#print axioms NoThreeLine.FiniteDirections.sum_rootBoardLine_squares_le
#print axioms NoThreeLine.FiniteDirections.longRootBoardLine_excess_sum_bound
