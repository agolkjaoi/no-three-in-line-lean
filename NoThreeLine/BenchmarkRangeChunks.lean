import NoThreeLine.BenchmarkBoxAccumulator

/-! Separately checked rectangle blocks recover the identical full range
computation. Every block starts at the actual preceding output tree. -/
set_option autoImplicit false
namespace NoThreeLine.BenchmarkNatTree

theorem addRanges_append (d : ℕ) (t : BenchmarkNatTree) (xs ys : List RangeUpdate) :
    addRanges d t (xs++ys)=addRanges d (addRanges d t xs) ys := by
  induction xs generalizing t with
  | nil => rfl
  | cons x xs ih => exact ih _

theorem checkRanges_append (d : ℕ) (t middle out : BenchmarkNatTree)
    (xs ys : List RangeUpdate)
    (hx : checkRanges d t xs middle=true) (hy : checkRanges d middle ys out=true) :
    checkRanges d t (xs++ys) out=true := by
  have hx' : addRanges d t xs=middle := of_decide_eq_true hx
  have hy' : addRanges d middle ys=out := of_decide_eq_true hy
  apply decide_eq_true_eq.mpr
  rw [addRanges_append,hx',hy']

end NoThreeLine.BenchmarkNatTree
namespace NoThreeLine.BenchmarkPrefix
open BenchmarkNatTree

theorem boxesRanges_append (xs ys : List (GridBox × ℕ)) :
    boxesRanges (xs++ys)=boxesRanges xs++boxesRanges ys := by
  simp only [boxesRanges,List.flatMap_append]

theorem checkBoxes_append (d : ℕ) (t middle out : BenchmarkNatTree)
    (xs ys : List (GridBox × ℕ))
    (hx : checkRanges d t (boxesRanges xs) middle=true)
    (hy : checkRanges d middle (boxesRanges ys) out=true) :
    checkRanges d t (boxesRanges (xs++ys)) out=true := by
  rw [boxesRanges_append]
  exact checkRanges_append d t middle out _ _ hx hy

end NoThreeLine.BenchmarkPrefix

#print axioms NoThreeLine.BenchmarkPrefix.checkBoxes_append
