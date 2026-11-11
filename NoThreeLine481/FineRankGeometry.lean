import NoThreeLine481.FineGridGeometry

/-! The ranked continuum prefix and the corresponding discrete field use
the same type convention, coarse parent and fine-cell coordinates. -/
set_option autoImplicit false
set_option maxRecDepth 2000
set_option maxHeartbeats 1600000
noncomputable section
open scoped BigOperators

namespace NoThreeLine481
open NoThreeLine PrimitiveLines GridChord FiniteDirections FrozenCapacity GridArea

def fineWeight (z : ZPoint) (i : Grid 256) : ℝ :=
  (249/250:ℝ)*capacityTypedWeight z (coarseParent i)

def boardRank {n J : ℕ} (rank : Fin 4 → Grid 256 → Fin J) (q : Grid n) : Fin J :=
  rank (codeZ (parity (gridEmbed q))) (fineCell q)

def finePrefixWeights {J : ℕ} (rank : Fin 4 → Grid 256 → Fin J) (k : Fin J)
    (z : ZPoint) (i : Grid 256) : ℝ :=
  if rank (codeZ z) i ≤ k then fineWeight z i else 0

theorem fineWeight_bounds (z : ZPoint) (i : Grid 256) :
    0 ≤ fineWeight z i ∧ fineWeight z i ≤ 12 := by
  have hb := (abs_le.mp (capacityTypedWeight_abs_le z (coarseParent i))).2
  have hnonneg : 0 ≤ capacityTypedWeight z (coarseParent i) := by
    unfold capacityTypedWeight
    exact div_nonneg (by exact_mod_cast cellUnits_nonneg _ _) (by norm_num)
  exact ⟨mul_nonneg (by norm_num) hnonneg,
    (mul_le_mul_of_nonneg_left hb (by norm_num)).trans (by norm_num)⟩

theorem finePrefixWeights_bounds {J : ℕ} (rank : Fin 4 → Grid 256 → Fin J) (k : Fin J)
    (z : ZPoint) (i : Grid 256) : 0 ≤ finePrefixWeights rank k z i ∧ finePrefixWeights rank k z i ≤ 12 := by
  unfold finePrefixWeights
  split_ifs
  · exact fineWeight_bounds z i
  · norm_num

theorem fineGridTerminal_zero_of_onFineGrid {n : ℕ} (q : Grid n) (hq : onFineGrid q) :
    fineGridTerminal q = 0 := by
  unfold fineGridTerminal maskedTypedBoardWeight eraseGrid
  simp [onFineGrid] at hq
  simp [hq]

theorem fineGridTerminal_eq_fineWeight {n : ℕ} (q : Grid n) (hq : ¬onFineGrid q) :
    fineGridTerminal q = fineWeight (parity (gridEmbed q)) (fineCell q) := by
  have hc := coarseParent_contains (fineCell q) _ _ (fineCell_contains q hq)
  unfold fineGridTerminal maskedTypedBoardWeight eraseGrid fineWeight
  simp only [onFineGrid] at hq
  rw [if_neg hq, rectangleField_eq_weight_of_contains _ _ _ _ _ cellRect_separated
    _ (Finset.mem_univ _) hc]

theorem finePrefixWeights_eval {n J : ℕ} (rank : Fin 4 → Grid 256 → Fin J) (k : Fin J)
    (q : Grid n) :
    maskedTypedBoardWeight fineCells fineRect (finePrefixWeights rank k)
      (commonGridLines 256) (commonGridLines 256) q =
      if boardRank rank q ≤ k then fineGridTerminal q else 0 := by
  by_cases hq : onFineGrid q
  · rw [fineGridTerminal_zero_of_onFineGrid q hq]
    simp only [ite_self]
    unfold maskedTypedBoardWeight eraseGrid
    simp only [onFineGrid] at hq
    rw [if_pos hq]
  · rw [fineGridTerminal_eq_fineWeight q hq]
    have hf := fineCell_contains q hq
    have he := rectangleField_eq_weight_of_contains fineCells
      fineRect (finePrefixWeights rank k (parity (gridEmbed q)))
      (normX n (gridEmbed q)) (normY n (gridEmbed q)) fineRect_separated
      (fineCell q) (mem_fineCells _) hf
    unfold maskedTypedBoardWeight eraseGrid
    simp only [onFineGrid] at hq
    rw [if_neg hq, he]
    unfold finePrefixWeights boardRank
    split_ifs <;> rfl

#print axioms fineGridTerminal_eq_fineWeight
#print axioms finePrefixWeights_eval

end NoThreeLine481
