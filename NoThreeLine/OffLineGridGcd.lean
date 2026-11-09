import NoThreeLine.OffLineGcdSum

/-! Exact reindexing back to the actual finite grid points on the line.
The parameter estimate therefore bounds a genuine board sum. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.OffLineDivisors
open PrimitiveLines

def radiusGridPoints (n : ℕ) (a v p : ZPoint) (R : ℕ) : Finset (Grid n) := by
  classical
  exact (gridLinePoints n a v).filter (fun q => distance p (gridEmbed q) ≤ R)

theorem sum_grid_radius_gcd_eq (n : ℕ) (a v p : ZPoint) (hv : Primitive v) (R : ℕ) :
    (∑ q ∈ radiusGridPoints n a v p R, displacementGcd p (gridEmbed q)) =
      ∑ t ∈ radiusParameters n a v p R, displacementGcd p (linePoint a v t) := by
  classical
  unfold radiusGridPoints radiusParameters
  simp only [Finset.sum_filter]
  rw [gridLineParameters,Finset.sum_image (parameter_injective_on_gridLine n a v hv)]
  apply Finset.sum_congr rfl
  intro q hq
  rw [← linePoint_parameter a v (gridEmbed q) hv ((mem_gridLinePoints a v q).mp hq)]

theorem sum_grid_radius_gcd_le (n : ℕ) (a v p : ZPoint) (hv : Primitive v)
    (hp : det v (p-a) ≠ 0) (R : ℕ) :
    (∑ q ∈ radiusGridPoints n a v p R, displacementGcd p (gridEmbed q)) ≤
      3*R*((det v (p-a)).natAbs.divisors.card) := by
  rw [sum_grid_radius_gcd_eq n a v p hv R]
  exact sum_radius_gcd_le n a v p hv hp R

theorem sum_grid_radius_gcd_le_real (n : ℕ) (a v p : ZPoint) (hv : Primitive v)
    (hp : det v (p-a) ≠ 0) (R : ℕ) :
    (∑ q ∈ radiusGridPoints n a v p R, (displacementGcd p (gridEmbed q) : ℝ)) ≤
      3*(R : ℝ)*((det v (p-a)).natAbs.divisors.card : ℝ) := by
  exact_mod_cast sum_grid_radius_gcd_le n a v p hv hp R

end NoThreeLine.OffLineDivisors

#print axioms NoThreeLine.OffLineDivisors.sum_grid_radius_gcd_le
#print axioms NoThreeLine.OffLineDivisors.sum_grid_radius_gcd_le_real
