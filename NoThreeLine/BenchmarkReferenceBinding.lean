import NoThreeLine.BenchmarkPairTree
import NoThreeLine.BenchmarkCoarseRefinement
import NoThreeLine.FiniteInputTree

/-! From two independent kernel computations to the actual geometric field:
the frozen-table prefix accumulator and the explicit rectangle accumulator
must agree. The only geometric identity is after the common grid erasure. -/
set_option autoImplicit false
set_option maxRecDepth 4096
open scoped BigOperators
noncomputable section
namespace NoThreeLine.BenchmarkPrefix
open BenchmarkNatTree FrozenReference

theorem boxUnits_cast (R : GridBox) (w : ℕ) (p : Grid 128) :
    (boxUnits R w p : ℝ)/100000000 = refinedWeight R ((w : ℝ)/100000000) p :=
  refinedWeight_nat_div R w p

theorem boxesUnits_tree_cast {n : ℕ} (data : FiniteInputTree (GridBox × ℕ) n)
    (p : Grid 128) :
    (boxesUnits data.toList p : ℝ)/100000000 =
      ∑ i : Fin n, refinedWeight (data.get i).1 (((data.get i).2 : ℝ)/100000000) p := by
  rw [← FiniteInputTree.ofFn_get]
  simp only [boxesUnits,List.map_ofFn,List.sum_ofFn,Nat.cast_sum,Finset.sum_div]
  apply Finset.sum_congr rfl
  intro i hi
  exact boxUnits_cast _ _ _

theorem checked_pair_field {n : ℕ} (last : Fin 15348) (prefixTree : BenchmarkNatTree)
    (hp : Represents (last.val+1) (by have := last.isLt; omega) prefixTree)
    (other : Fin 4) (data : FiniteInputTree (GridBox × ℕ) n) (cellTree : BenchmarkNatTree)
    (hv : ∀ i, (data.get i).1.Valid 128)
    (hc : checkRanges 14 (.uniform 0) (boxesRanges data.toList) cellTree=true)
    (he : pairTree prefixTree other=cellTree) :
    eraseGrid (commonGridLines 32768) (commonGridLines 32768)
      (rectangleField Finset.univ (fun i => ((data.get i).1.qrect 128).real)
        (fun i => ((data.get i).2 : ℝ)/100000000)) =
      (fun x y => fullPhasePrefix last 3 x y+fullPhasePrefix last other x y) := by
  have hheight : ∀ x∈data.toList, x.1.y1≤128 := by
    intro x hx
    rw [← FiniteInputTree.ofFn_get] at hx
    obtain ⟨i,rfl⟩ := List.mem_ofFn.mp hx
    exact (hv i).2.2.2
  have hw (p : Grid 128) :
      (∑ i : Fin n, refinedWeight (data.get i).1 (((data.get i).2 : ℝ)/100000000) p) =
        fullTypeWeight last 3 p+fullTypeWeight last other p := by
    rw [← boxesUnits_tree_cast,← checked_boxes _ _ hheight hc,← he]
    exact pairTree_fullTypeWeight last prefixTree hp other p
  rw [coarse_refine_rectangleField _ _ _ (fun i _ => hv i)]
  simp_rw [hw]
  funext x y
  rw [fullPhasePrefix_eq_field,fullPhasePrefix_eq_field]
  classical
  by_cases hb : x∈commonGridLines 32768 ∨ y∈commonGridLines 32768
  · simp [eraseGrid,hb]
  · simp only [eraseGrid,if_neg hb]
    unfold rectangleField
    rw [← Finset.sum_add_distrib]
    apply Finset.sum_congr rfl
    intro p hp'
    unfold Rect.field
    split_ifs <;> simp

end NoThreeLine.BenchmarkPrefix

#print axioms NoThreeLine.BenchmarkPrefix.checked_pair_field
