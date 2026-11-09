import NoThreeLine.FiniteInputTree
import Mathlib.Algebra.BigOperators.Fin

/-! A finite sum over the input tree is exactly the sum of its ordered leaves.
The identity avoids reducing every lookup again in concrete analytic sums. -/
set_option autoImplicit false
open scoped BigOperators
namespace NoThreeLine.FiniteInputTree

theorem sum_get {α β : Type*} [AddCommMonoid β] {n : ℕ}
    (t : FiniteInputTree α n) (f : α → β) :
    (∑ i : Fin n, f (t.get i)) = (t.toList.map f).sum := by
  rw [← Fin.sum_ofFn]
  congr 1
  rw [List.ofFn_comp', t.ofFn_get]

end NoThreeLine.FiniteInputTree

#print axioms NoThreeLine.FiniteInputTree.sum_get
