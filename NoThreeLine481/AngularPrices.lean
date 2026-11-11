import NoThreeLine481.Archived481

/-! Each angular bin contributes an integer price in units of 10⁻¹².
These theorems assemble certified bin bounds and the twelve chart/type
prices into the exact acceptance inequality of the 481-phase checker. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine481
open NoThreeLine PrimitiveLines GridArea FiniteDirections

def fineCellPairAngularSquare {J : ℕ} (rank : Fin 4 → Grid 256 → Fin J)
    (t : GridType) (i : Grid 256) (x y : ℝ) (j : Fin 4 × Fin 3) (u : ℝ) : ℝ :=
  let z := gridTypeZ t
  let w := finePrefixWeights rank (rank (typeCode t) i)
  pairAngularSquare fineCells fineRect (w z) (w (parity (z + nonzeroParity j.2))) j.1
    (commonGridLines 256) (commonGridLines 256) x y u

theorem angularIntegral_le_of_integer_bins (f : ℝ → ℝ) (N : ℕ) (cut : ℕ → ℝ)
    (price : ℕ → ℤ) (hzero : cut 0 = 0) (hone : cut N = 1)
    (hint : ∀ j < N, IntervalIntegrable f volume (cut j) (cut (j+1)))
    (hbin : ∀ j < N, (∫ u in cut j..cut (j+1), f u) ≤ (price j:ℝ)/1000000000000) :
    (∫ u in (0:ℝ)..1, f u) ≤ ((∑ j ∈ Finset.range N, price j : ℤ):ℝ)/1000000000000 := by
  rw [← hzero, ← hone, ← intervalIntegral.sum_integral_adjacent_intervals hint]
  push_cast
  rw [Finset.sum_div]
  apply Finset.sum_le_sum
  intro j hj
  exact hbin j (Finset.mem_range.mp hj)

theorem fineCellAngularRisk_le_of_integer_prices {J : ℕ} (rank : Fin 4 → Grid 256 → Fin J)
    (t : GridType) (i : Grid 256) (x y : ℝ) (price : Fin 4 × Fin 3 → ℤ)
    (hpair : ∀ j, (∫ u in (0:ℝ)..1, fineCellPairAngularSquare rank t i x y j u) ≤
      (price j:ℝ)/1000000000000)
    (haccept : ∑ j, price j ≤ 39469736842105) :
    fineCellAngularRisk rank t i x y ≤ (9999/10000:ℝ) := by
  have hsum := Finset.sum_le_sum
    (s := (Finset.univ : Finset (Fin 4 × Fin 3))) (fun j _ => hpair j)
  rw [← Finset.sum_div] at hsum
  have hprice : (∑ j, (price j:ℝ)) ≤ 39469736842105 := by exact_mod_cast haccept
  have hmain := mul_le_mul_of_nonneg_left hsum (by norm_num : 0 ≤ (76/125:ℝ)/24)
  change fineCellAngularRisk rank t i x y ≤
    ((76/125:ℝ)/24)*((∑ j, (price j:ℝ))/1000000000000) at hmain
  exact hmain.trans (by linarith only [hprice])

#print axioms angularIntegral_le_of_integer_bins
#print axioms fineCellAngularRisk_le_of_integer_prices

end NoThreeLine481
