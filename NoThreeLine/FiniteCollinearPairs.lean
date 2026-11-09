import NoThreeLine.FiniteDirectionSums

/-! The actual ordered, distinct, non-root collinear-pair sum is bounded by
the squares of the actual primitive line sums. All covering witnesses are
constructed from grid differences in `grid_point_direction`. -/
set_option autoImplicit false
open scoped BigOperators
noncomputable section
namespace NoThreeLine.FiniteDirections
open PrimitiveLines

def lineWeight {n : ℕ} (p : Grid n) (d : ZPoint) (a : Grid n → ℝ) : ℝ :=
  ∑ q ∈ (gridLinePoints n (gridEmbed p) d).erase p, a q

def collinearPairSum {n : ℕ} (p : Grid n) (a : Grid n → ℝ) : ℝ :=
  ∑ q : Grid n, ∑ r : Grid n,
    if q ≠ p ∧ r ≠ p ∧ q ≠ r ∧ orientedArea p q r=0 then a q*a r else 0

private def lineIndicator {n : ℕ} (p : Grid n) (d : ZPoint)
    (a : Grid n → ℝ) (q : Grid n) : ℝ :=
  if q ∈ (gridLinePoints n (gridEmbed p) d).erase p then a q else 0

private theorem lineIndicator_nonneg {n : ℕ} (p : Grid n) (d : ZPoint)
    (a : Grid n → ℝ) (ha : ∀ q, 0 ≤ a q) (q : Grid n) :
    0 ≤ lineIndicator p d a q := by
  unfold lineIndicator
  split_ifs
  · exact ha q
  · exact le_refl 0

private theorem sum_lineIndicator {n : ℕ} (p : Grid n) (d : ZPoint)
    (a : Grid n → ℝ) : (∑ q : Grid n, lineIndicator p d a q) = lineWeight p d a := by
  classical
  unfold lineIndicator lineWeight
  rw [← Finset.sum_filter]
  congr 1
  ext q
  simp

theorem collinearPairSum_le_line_squares {n : ℕ} (p : Grid n) (a : Grid n → ℝ)
    (ha : ∀ q, 0 ≤ a q) :
    collinearPairSum p a ≤ ∑ d ∈ directionIndices n, (lineWeight p d.2 a)^2 := by
  classical
  have hpoint (q r : Grid n) :
      (if q ≠ p ∧ r ≠ p ∧ q ≠ r ∧ orientedArea p q r=0 then a q*a r else 0) ≤
      ∑ d ∈ directionIndices n, lineIndicator p d.2 a q * lineIndicator p d.2 a r := by
    split_ifs with h
    · obtain ⟨d,hd,he⟩ := grid_point_direction p q h.1
      have hq : q ∈ (gridLinePoints n (gridEmbed p) d.2).erase p := by
        apply Finset.mem_erase.mpr
        refine ⟨h.1,(mem_gridLinePoints _ _ _).mpr ((he q).mpr ?_)⟩
        dsimp [orientedArea]
        ring
      have hr : r ∈ (gridLinePoints n (gridEmbed p) d.2).erase p :=
        Finset.mem_erase.mpr ⟨h.2.1,(mem_gridLinePoints _ _ _).mpr ((he r).mpr h.2.2.2)⟩
      calc
        a q*a r = lineIndicator p d.2 a q * lineIndicator p d.2 a r := by
          simp [lineIndicator,hq,hr]
        _ ≤ ∑ d ∈ directionIndices n, lineIndicator p d.2 a q * lineIndicator p d.2 a r :=
          Finset.single_le_sum (fun i _ => mul_nonneg (lineIndicator_nonneg p i.2 a ha q)
            (lineIndicator_nonneg p i.2 a ha r)) hd
    · exact Finset.sum_nonneg (fun d _ => mul_nonneg (lineIndicator_nonneg p d.2 a ha q)
        (lineIndicator_nonneg p d.2 a ha r))
  unfold collinearPairSum
  calc
    _ ≤ ∑ q : Grid n, ∑ r : Grid n, ∑ d ∈ directionIndices n,
        lineIndicator p d.2 a q * lineIndicator p d.2 a r :=
      Finset.sum_le_sum (fun q _ => Finset.sum_le_sum (fun r _ => hpoint q r))
    _ = ∑ d ∈ directionIndices n, (lineWeight p d.2 a)^2 := by
      simp_rw [Finset.sum_comm (s := Finset.univ) (t := directionIndices n)]
      apply Finset.sum_congr rfl
      intro d hd
      rw [← Finset.sum_mul_sum, sum_lineIndicator, pow_two]

def normalizedPairSum {n : ℕ} (p : Grid n) (a : Grid n → ℝ) : ℝ :=
  collinearPairSum p a / (2*(n : ℝ)^2)

theorem normalizedPairSum_le {n : ℕ} (p : Grid n) (a : Grid n → ℝ)
    (ha : ∀ q, 0 ≤ a q) :
    normalizedPairSum p a ≤
      (∑ d ∈ directionIndices n, (lineWeight p d.2 a)^2)/(2*(n : ℝ)^2) :=
  div_le_div_of_nonneg_right (collinearPairSum_le_line_squares p a ha) (by positivity)

end NoThreeLine.FiniteDirections

#print axioms NoThreeLine.FiniteDirections.collinearPairSum_le_line_squares
#print axioms NoThreeLine.FiniteDirections.normalizedPairSum_le
