import Mathlib.Tactic

/-! A kernel-computable sparse array for exact natural-unit prefix sums.
Uniform nodes are compressed; all lookup and update facts are proved for
arbitrary trees, without assuming a producer chose a particular shape. -/
set_option autoImplicit false
namespace NoThreeLine

inductive BenchmarkNatTree where
  | uniform (value : ℕ)
  | branch (left right : BenchmarkNatTree)
  deriving DecidableEq, Repr

namespace BenchmarkNatTree

def left : BenchmarkNatTree → BenchmarkNatTree
  | .uniform a => .uniform a
  | .branch l _ => l

def right : BenchmarkNatTree → BenchmarkNatTree
  | .uniform a => .uniform a
  | .branch _ r => r

def join : BenchmarkNatTree → BenchmarkNatTree → BenchmarkNatTree
  | .uniform a, .uniform b => if a=b then .uniform a else .branch (.uniform a) (.uniform b)
  | l,r => .branch l r

def get : ℕ → BenchmarkNatTree → ℕ → ℕ
  | _, .uniform a, _ => a
  | 0, .branch _ _, _ => 0
  | d+1, .branch l r, i => if i<2^d then get d l i else get d r (i-2^d)

theorem get_succ (d : ℕ) (t : BenchmarkNatTree) (i : ℕ) :
    get (d+1) t i = if i<2^d then get d t.left i else get d t.right (i-2^d) := by
  cases t <;> simp [get,left,right]

theorem get_join (d : ℕ) (l r : BenchmarkNatTree) (i : ℕ) :
    get (d+1) (join l r) i = if i<2^d then get d l i else get d r (i-2^d) := by
  cases l <;> cases r <;> simp [join,get]
  split_ifs <;> simp_all [get]

def addAt : ℕ → BenchmarkNatTree → ℕ → ℕ → BenchmarkNatTree
  | 0,t,i,a => .uniform (get 0 t i+a)
  | d+1,t,i,a => if i<2^d then join (addAt d t.left i a) t.right
      else join t.left (addAt d t.right (i-2^d) a)

theorem get_addAt (d : ℕ) (t : BenchmarkNatTree) (i j a : ℕ)
    (hi : i<2^d) (hj : j<2^d) :
    get d (addAt d t i a) j = get d t j + if j=i then a else 0 := by
  induction d generalizing t i j with
  | zero =>
      have hi0 : i=0 := by simpa using hi
      have hj0 : j=0 := by simpa using hj
      subst i; subst j
      simp [addAt,get]
  | succ d ih =>
      by_cases hi' : i<2^d
      · rw [addAt,if_pos hi',get_join,get_succ]
        by_cases hj' : j<2^d
        · rw [if_pos hj',if_pos hj']
          exact ih _ i j hi' hj'
        · have hne : j≠i := by omega
          simp only [if_neg hj',if_neg hne,Nat.add_zero]
      · rw [addAt,if_neg hi',get_join,get_succ]
        by_cases hj' : j<2^d
        · have hne : j≠i := by omega
          simp only [if_pos hj',if_neg hne,Nat.add_zero]
        · rw [if_neg hj',if_neg hj']
          have hi'' : i-2^d<2^d := by rw [Nat.pow_succ] at hi; omega
          have hj'' : j-2^d<2^d := by rw [Nat.pow_succ] at hj; omega
          have he : j-2^d=i-2^d ↔ j=i := by omega
          simpa only [he] using ih t.right (i-2^d) (j-2^d) hi'' hj''

def addMany (d : ℕ) : BenchmarkNatTree → List (ℕ × ℕ) → BenchmarkNatTree
  | t,[] => t
  | t,x::xs => addMany d (addAt d t x.1 x.2) xs

def contribution (j : ℕ) : List (ℕ × ℕ) → ℕ
  | [] => 0
  | x::xs => (if j=x.1 then x.2 else 0) + contribution j xs

theorem get_addMany (d : ℕ) (t : BenchmarkNatTree) (xs : List (ℕ × ℕ)) (j : ℕ)
    (hx : ∀ x∈xs, x.1<2^d) (hj : j<2^d) :
    get d (addMany d t xs) j = get d t j + contribution j xs := by
  induction xs generalizing t with
  | nil => simp [addMany,contribution]
  | cons x xs ih =>
      rw [addMany,ih _ (fun y hy => hx y (by simp [hy])),get_addAt d t x.1 j x.2 (hx x (by simp)) hj]
      simp only [contribution,Nat.add_assoc]

theorem addMany_append (d : ℕ) (t : BenchmarkNatTree) (xs ys : List (ℕ × ℕ)) :
    addMany d t (xs++ys) = addMany d (addMany d t xs) ys := by
  induction xs generalizing t with
  | nil => rfl
  | cons x xs ih => exact ih _

def checkUpdates (d : ℕ) (t : BenchmarkNatTree) (xs : List (ℕ × ℕ))
    (out : BenchmarkNatTree) : Bool := decide (addMany d t xs=out)

theorem checkUpdates_sound (d : ℕ) (t : BenchmarkNatTree) (xs : List (ℕ × ℕ))
    (out : BenchmarkNatTree) (h : checkUpdates d t xs out=true)
    (hx : ∀ x∈xs, x.1<2^d) (j : ℕ) (hj : j<2^d) :
    get d out j = get d t j + contribution j xs := by
  have he : addMany d t xs=out := of_decide_eq_true h
  rw [← he]
  exact get_addMany d t xs j hx hj

example : checkUpdates 2 (.uniform 0) [(0,3),(1,3)]
    (.branch (.uniform 3) (.uniform 0)) = true := by decide +kernel

end BenchmarkNatTree
end NoThreeLine

#print axioms NoThreeLine.BenchmarkNatTree.get_addAt
#print axioms NoThreeLine.BenchmarkNatTree.get_addMany
#print axioms NoThreeLine.BenchmarkNatTree.checkUpdates_sound
