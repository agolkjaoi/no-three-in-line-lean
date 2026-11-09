import NoThreeLine.BenchmarkNatRange

set_option autoImplicit false
namespace NoThreeLine.BenchmarkNatTree

structure RangeUpdate where
  lo : ℕ
  hi : ℕ
  weight : ℕ
  deriving DecidableEq, Repr

def addRanges (d : ℕ) : BenchmarkNatTree → List RangeUpdate → BenchmarkNatTree
  | t, [] => t
  | t, x::xs => addRanges d (if x.weight=0 then t else addRange d t x.lo x.hi x.weight) xs

def rangeContribution (j : ℕ) : List RangeUpdate → ℕ
  | [] => 0
  | x::xs => (if x.lo≤j ∧ j<x.hi then x.weight else 0) + rangeContribution j xs

theorem get_addRanges (d : ℕ) (t : BenchmarkNatTree) (xs : List RangeUpdate)
    (j : ℕ) (hj : j<2^d) :
    get d (addRanges d t xs) j = get d t j + rangeContribution j xs := by
  induction xs generalizing t with
  | nil => simp [addRanges,rangeContribution]
  | cons x xs ih =>
      rw [addRanges,ih]
      by_cases hw : x.weight=0
      · simp [hw,rangeContribution]
      · rw [if_neg hw,get_addRange _ _ _ _ _ _ hj]
        simp only [rangeContribution,Nat.add_assoc]

theorem rangeContribution_append (j : ℕ) (xs ys : List RangeUpdate) :
    rangeContribution j (xs++ys) = rangeContribution j xs + rangeContribution j ys := by
  induction xs with
  | nil => simp [rangeContribution]
  | cons x xs ih => simp [rangeContribution,ih,Nat.add_assoc]

theorem rangeContribution_flatMap {α : Type*} (j : ℕ) (f : α → List RangeUpdate)
    (xs : List α) :
    rangeContribution j (xs.flatMap f) = (xs.map (fun x => rangeContribution j (f x))).sum := by
  induction xs with
  | nil => rfl
  | cons x xs ih => simp [rangeContribution_append,ih]

def checkRanges (d : ℕ) (t : BenchmarkNatTree) (xs : List RangeUpdate)
    (out : BenchmarkNatTree) : Bool := decide (addRanges d t xs=out)

theorem checkRanges_sound (d : ℕ) (t : BenchmarkNatTree) (xs : List RangeUpdate)
    (out : BenchmarkNatTree) (h : checkRanges d t xs out=true)
    (j : ℕ) (hj : j<2^d) :
    get d out j = get d t j + rangeContribution j xs := by
  have he : addRanges d t xs=out := of_decide_eq_true h
  rw [← he]
  exact get_addRanges d t xs j hj

example : checkRanges 2 (.uniform 0) [⟨1,3,5⟩]
    (.branch (.branch (.uniform 0) (.uniform 5)) (.branch (.uniform 5) (.uniform 0))) = true := by
  decide +kernel

end NoThreeLine.BenchmarkNatTree

#print axioms NoThreeLine.BenchmarkNatTree.checkRanges_sound
