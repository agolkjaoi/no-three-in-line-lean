import NoThreeLine.BenchmarkReferenceBinding
import NoThreeLine.Phase15301Prefix15302
import NoThreeLine.Phase15301Compressed0

/-! Concrete identity with the common frozen-table prefix through phase15301,
inclusive. The explicit rational pair field is the one already certified by
the twelve-family leaf result. Equality is after common32768 grid erasure. -/
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
noncomputable section
namespace NoThreeLine.Phase15301Reference0
open BenchmarkPrefix BenchmarkNatTree FrozenReference

theorem pair_checked : pairTree Phase15301Prefix15302.tree 0=Phase15301Compressed0.cellTree := by
  decide +kernel

theorem original_erased_eq_frozen_prefix :
    eraseGrid (commonGridLines 32768) (commonGridLines 32768) Phase15301Original.field0 =
      (fun x y => fullPhasePrefix 15301 3 x y+fullPhasePrefix 15301 0 x y) := by
  have h := checked_pair_field 15301 Phase15301Prefix15302.tree
    Phase15301Prefix15302.represents 0 Phase15301Compressed0.entries Phase15301Compressed0.cellTree
    Phase15301Compressed0.boxes_valid Phase15301Compressed0.ranges_checked pair_checked
  have hr (i : Fin 262) : ((Phase15301Compressed0.boxes i).qrect 128).real=(Phase15301Original.rectangles0 i).real :=
    congrArg QRect.real (Phase15301Compressed0.original_matching i).1
  have hw (i : Fin 262) : (Phase15301Compressed0.units i : ℝ)/100000000=(Phase15301Original.weights0 i : ℝ) := by
    have he := congrArg (fun q : ℚ => (q : ℝ)) (Phase15301Compressed0.original_matching i).2
    push_cast at he
    exact he
  change eraseGrid _ _ (rectangleField Finset.univ
    (fun i => ((Phase15301Compressed0.boxes i).qrect 128).real) (fun i => (Phase15301Compressed0.units i : ℝ)/100000000)) = _ at h
  simp only [hr,hw] at h
  exact h

end NoThreeLine.Phase15301Reference0

#print axioms NoThreeLine.Phase15301Reference0.pair_checked
#print axioms NoThreeLine.Phase15301Reference0.original_erased_eq_frozen_prefix
