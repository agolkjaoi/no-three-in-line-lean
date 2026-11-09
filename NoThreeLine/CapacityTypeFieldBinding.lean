import NoThreeLine.BenchmarkReferenceBinding

/-! Generic one-type version of the checked compressed-field binding.
All frozen phases and all type components are retained. The common fine-grid
erasure is part of the equality, not silently removed at rectangle seams. -/
set_option autoImplicit false
open scoped BigOperators
noncomputable section
namespace NoThreeLine.BenchmarkPrefix
open BenchmarkNatTree FrozenReference

theorem checked_type_field {n : ℕ} (last : Fin 15348) (prefixTree : BenchmarkNatTree)
    (hp : Represents (last.val+1) (by have := last.isLt; omega) prefixTree)
    (r : Fin 4) (data : FiniteInputTree (GridBox × ℕ) n)
    (hv : ∀ i, (data.get i).1.Valid 128)
    (hc : checkRanges 14 (.uniform 0) (boxesRanges data.toList)
      (typeTree prefixTree r)=true) :
    eraseGrid (commonGridLines 32768) (commonGridLines 32768)
      (rectangleField Finset.univ (fun i => ((data.get i).1.qrect 128).real)
        (fun i => ((data.get i).2 : ℝ)/100000000)) =
      fullPhasePrefix last r := by
  have hheight : ∀ x∈data.toList, x.1.y1≤128 := by
    intro x hx
    rw [← FiniteInputTree.ofFn_get] at hx
    obtain ⟨i,rfl⟩ := List.mem_ofFn.mp hx
    exact (hv i).2.2.2
  have hw (p : Grid 128) :
      (∑ i : Fin n, refinedWeight (data.get i).1 (((data.get i).2 : ℝ)/100000000) p) =
        fullTypeWeight last r p := by
    rw [← boxesUnits_tree_cast,← checked_boxes _ _ hheight hc,get_typeTree]
    exact represents_fullTypeWeight last prefixTree hp r p
  rw [coarse_refine_rectangleField _ _ _ (fun i _ => hv i)]
  simp_rw [hw]
  funext x y
  exact (fullPhasePrefix_eq_field last r x y).symm

end NoThreeLine.BenchmarkPrefix
#print axioms NoThreeLine.BenchmarkPrefix.checked_type_field
