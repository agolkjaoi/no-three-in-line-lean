import Mathlib.Data.List.OfFn
import Mathlib.Data.Fin.Tuple.Basic

/-! Literal input tables with the number of entries in the type.  A producer
may choose a balanced shape; none of the soundness lemmas requires balance.
Lookup uses the existing finite concatenation eliminator, and the list theorem
preserves every entry and its order.  This is only an input representation. -/
set_option autoImplicit false
namespace NoThreeLine

inductive FiniteInputTree (α : Type*) : ℕ → Type _ where
  | empty : FiniteInputTree α 0
  | single (value : α) : FiniteInputTree α 1
  | node {m n : ℕ} (left : FiniteInputTree α m) (right : FiniteInputTree α n) :
      FiniteInputTree α (m+n)

namespace FiniteInputTree

def get {α : Type*} : {n : ℕ} → FiniteInputTree α n → Fin n → α
  | _, .empty => fun i => Fin.elim0 i
  | _, .single a => fun _ => a
  | _, .node left right => Fin.addCases left.get right.get

def toList {α : Type*} : {n : ℕ} → FiniteInputTree α n → List α
  | _, .empty => []
  | _, .single a => [a]
  | _, .node left right => left.toList ++ right.toList

theorem ofFn_get {α : Type*} {n : ℕ} (t : FiniteInputTree α n) :
    List.ofFn t.get = t.toList := by
  induction t with
  | empty => simp [get, toList]
  | single a => simp [get, toList]
  | node left right ihl ihr =>
      change List.ofFn (Fin.append left.get right.get) = left.toList ++ right.toList
      simp [List.ofFn_add, ihl, ihr]

def All {α : Type*} (P : α → Prop) : {n : ℕ} → FiniteInputTree α n → Prop
  | _, .empty => True
  | _, .single a => P a
  | _, .node left right => left.All P ∧ right.All P

theorem all_iff_forall_get {α : Type*} {n : ℕ} (P : α → Prop)
    (t : FiniteInputTree α n) : t.All P ↔ ∀ i, P (t.get i) := by
  induction t with
  | empty => simp [All, get]
  | single a => simp [All, get]
  | node left right ihl ihr =>
      simp only [All, Fin.forall_fin_add, get, Fin.addCases_left,
        Fin.addCases_right, ← ihl, ← ihr]

theorem length_toList {α : Type*} {n : ℕ} (t : FiniteInputTree α n) :
    t.toList.length = n := by
  rw [← ofFn_get]
  exact List.length_ofFn

end FiniteInputTree
end NoThreeLine

#print axioms NoThreeLine.FiniteInputTree.ofFn_get
#print axioms NoThreeLine.FiniteInputTree.all_iff_forall_get
