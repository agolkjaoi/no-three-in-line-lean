import NoThreeLine.PairLineLength

/-! Every radius shell of a fixed off-root primitive line contributes at
most `12 n tau(D)` to the actual sum of root-to-point line lengths. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.OffLineDivisors
open PrimitiveLines GridLines

def shellGridPoints (n : ℕ) (a v p : ZPoint) (R : ℕ) : Finset (Grid n) := by
  classical
  exact (radiusGridPoints n a v p R).filter (fun q => R ≤ 2*distance p (gridEmbed q))

theorem shellGridPoints_subset (n : ℕ) (a v p : ZPoint) (R : ℕ) :
    shellGridPoints n a v p R ⊆ radiusGridPoints n a v p R := Finset.filter_subset _ _

theorem sum_shell_lineThrough_card_le {n : ℕ} (a v : ZPoint) (p : Grid n)
    (hv : Primitive v) (hp : det v (gridEmbed p-a) ≠ 0) (R : ℕ) (hR : 0 < R) :
    (∑ q ∈ shellGridPoints n a v (gridEmbed p) R, (lineThrough p q).card) ≤
      12*n*((det v (gridEmbed p-a)).natAbs.divisors.card) := by
  classical
  have hg : (∑ q ∈ shellGridPoints n a v (gridEmbed p) R,
        displacementGcd (gridEmbed p) (gridEmbed q)) ≤
      ∑ q ∈ radiusGridPoints n a v (gridEmbed p) R,
        displacementGcd (gridEmbed p) (gridEmbed q) :=
    Finset.sum_le_sum_of_subset_of_nonneg (shellGridPoints_subset _ _ _ _ _) (by intros; exact Nat.zero_le _)
  have hh : R*(∑ q ∈ shellGridPoints n a v (gridEmbed p) R, (lineThrough p q).card) ≤
      R*(12*n*((det v (gridEmbed p-a)).natAbs.divisors.card)) := by
    calc
      _ = ∑ q ∈ shellGridPoints n a v (gridEmbed p) R, R*(lineThrough p q).card := Finset.mul_sum _ _ _
      _ ≤ ∑ q ∈ shellGridPoints n a v (gridEmbed p) R,
          4*n*displacementGcd (gridEmbed p) (gridEmbed q) := by
        apply Finset.sum_le_sum
        intro q hq
        have hmem : q ∈ gridLinePoints n a v :=
          (Finset.mem_filter.mp (Finset.mem_filter.mp hq).1).1
        have hne := on_line_ne_root a v (gridEmbed p) (gridEmbed q) hp
          ((mem_gridLinePoints a v q).mp hmem)
        have hqp : q ≠ p := fun h => hne (congrArg gridEmbed h)
        exact shell_lineThrough_card_mul_le p q hqp R (Finset.mem_filter.mp hq).2
      _ = 4*n*(∑ q ∈ shellGridPoints n a v (gridEmbed p) R,
          displacementGcd (gridEmbed p) (gridEmbed q)) := (Finset.mul_sum _ _ _).symm
      _ ≤ 4*n*(∑ q ∈ radiusGridPoints n a v (gridEmbed p) R,
          displacementGcd (gridEmbed p) (gridEmbed q)) := Nat.mul_le_mul_left _ hg
      _ ≤ 4*n*(3*R*((det v (gridEmbed p-a)).natAbs.divisors.card)) :=
        Nat.mul_le_mul_left _ (sum_grid_radius_gcd_le n a v (gridEmbed p) hv hp R)
      _ = _ := by ring
  exact Nat.le_of_mul_le_mul_left hh hR

end NoThreeLine.OffLineDivisors

#print axioms NoThreeLine.OffLineDivisors.sum_shell_lineThrough_card_le
