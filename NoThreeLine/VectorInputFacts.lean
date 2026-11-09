import NoThreeLine.UnionScheduleSemantics

/-! Structural facts for literal vectors. They avoid expanding a large
analytic proposition simultaneously in every finite-index case. -/
set_option autoImplicit false
namespace NoThreeLine

theorem vector_forall_cons {α : Type*} {n : ℕ} (P : α → Prop)
    (a : α) (v : Fin n → α) (ha : P a) (hv : ∀ i, P (v i)) :
    ∀ i, P (Matrix.vecCons a v i) := Fin.cases ha hv

theorem vector_relation_cons {α β : Type*} {n : ℕ} (P : α → β → Prop)
    (a : α) (b : β) (v : Fin n → α) (w : Fin n → β)
    (hab : P a b) (hvw : ∀ i, P (v i) (w i)) :
    ∀ i, P (Matrix.vecCons a v i) (Matrix.vecCons b w i) := Fin.cases hab hvw

end NoThreeLine

#print axioms NoThreeLine.vector_forall_cons
