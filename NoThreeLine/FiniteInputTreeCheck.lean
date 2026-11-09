import NoThreeLine.FiniteInputTree

/-! A structural decision procedure for the input-tree predicate.
This uses ordinary Decidable proofs and supports kernel evaluation. -/
set_option autoImplicit false
namespace NoThreeLine.FiniteInputTree

def allDecidable {α : Type*} (P : α → Prop) [DecidablePred P] :
    {n : ℕ} → (t : FiniteInputTree α n) → Decidable (t.All P)
  | _, .empty => isTrue True.intro
  | _, .single a => inferInstanceAs (Decidable (P a))
  | _, .node left right =>
      @instDecidableAnd (left.All P) (right.All P)
        (allDecidable P left) (allDecidable P right)

instance {α : Type*} {n : ℕ} (P : α → Prop) [DecidablePred P]
    (t : FiniteInputTree α n) : Decidable (t.All P) := allDecidable P t

end NoThreeLine.FiniteInputTree
