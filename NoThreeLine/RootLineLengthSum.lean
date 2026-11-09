import NoThreeLine.ShellLineLengths
import NoThreeLine.GridLines

/-! Sum actual root-to-point line lengths by the primitive direction cover.
The root itself is excluded before using any line estimate. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.FiniteDirections
open PrimitiveLines GridLines

def rootLineLengthSum {n : ℕ} (p : Grid n) : ℝ :=
  ∑q : Grid n,if q≠p then ((lineThrough p q).card:ℝ) else 0

def lineLengthIncidence {n : ℕ} (p : Grid n) (d : ZPoint) (q : Grid n) : ℝ :=
  if q≠p ∧ q∈gridLinePoints n (gridEmbed p) d then ((gridLinePoints n (gridEmbed p) d).card:ℝ) else 0

theorem lineLengthIncidence_nonneg {n : ℕ} (p : Grid n) (d : ZPoint) (q : Grid n) :
    0≤lineLengthIncidence p d q := by
  unfold lineLengthIncidence
  split_ifs <;> positivity

theorem sum_lineLengthIncidence_le {n : ℕ} (p : Grid n) (d : ZPoint) :
    (∑q : Grid n,lineLengthIncidence p d q)≤((gridLinePoints n (gridEmbed p) d).card:ℝ)^2 := by
  classical
  unfold lineLengthIncidence
  rw [←Finset.sum_filter]
  have he : Finset.univ.filter (fun q=>q≠p ∧ q∈gridLinePoints n (gridEmbed p) d)=
      (gridLinePoints n (gridEmbed p) d).erase p := by
    ext q
    simp only [Finset.mem_filter,Finset.mem_univ,true_and,Finset.mem_erase]
  rw [he]
  simp only [Finset.sum_const,nsmul_eq_mul]
  have hc : (((gridLinePoints n (gridEmbed p) d).erase p).card:ℝ)≤
      (gridLinePoints n (gridEmbed p) d).card := by exact_mod_cast Finset.card_erase_le
  simpa only [pow_two] using mul_le_mul_of_nonneg_right hc (Nat.cast_nonneg _)

theorem rootLineLengthSum_le_squares {n : ℕ} (p : Grid n) :
    rootLineLengthSum p≤∑d∈directionIndices n,((gridLinePoints n (gridEmbed p) d.2).card:ℝ)^2 := by
  classical
  have hpoint (q : Grid n) : (if q≠p then ((lineThrough p q).card:ℝ) else 0)≤
      ∑d∈directionIndices n,lineLengthIncidence p d.2 q := by
    by_cases hq : q≠p
    · obtain ⟨d,hd,hline⟩ := grid_point_direction p q hq
      have he : lineThrough p q=gridLinePoints n (gridEmbed p) d.2 := by
        ext r
        rw [mem_lineThrough,mem_gridLinePoints]
        exact (hline r).symm
      have hqd : q∈gridLinePoints n (gridEmbed p) d.2 := he ▸ right_mem_lineThrough p q
      have hh := Finset.single_le_sum (fun v (_ : v∈directionIndices n)=>lineLengthIncidence_nonneg p v.2 q) hd
      rw [if_pos hq,he]
      rw [lineLengthIncidence,if_pos (And.intro hq hqd)] at hh
      exact hh
    · rw [if_neg hq]
      exact Finset.sum_nonneg (fun d _=>lineLengthIncidence_nonneg p d.2 q)
  calc
    _ ≤ ∑q : Grid n,∑d∈directionIndices n,lineLengthIncidence p d.2 q := Finset.sum_le_sum (fun q _=>hpoint q)
    _ = ∑d∈directionIndices n,∑q : Grid n,lineLengthIncidence p d.2 q := Finset.sum_comm
    _ ≤ _ := Finset.sum_le_sum (fun d _=>sum_lineLengthIncidence_le p d.2)

theorem rootLineLengthSum_le_log {n : ℕ} (p : Grid n) :
    rootLineLengthSum p≤16*(n:ℝ)^2*(1+Real.log n) :=
  (rootLineLengthSum_le_squares p).trans
    (sum_gridLine_card_sq_le n (gridEmbed p) ((Nat.zero_le p.1.val).trans_lt p.1.isLt))

end NoThreeLine.FiniteDirections

#print axioms NoThreeLine.FiniteDirections.rootLineLengthSum_le_squares
#print axioms NoThreeLine.FiniteDirections.rootLineLengthSum_le_log
