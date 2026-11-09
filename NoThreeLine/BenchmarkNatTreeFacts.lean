import NoThreeLine.BenchmarkNatTree

/-! List bookkeeping for the sparse natural-unit accumulator. Repeated phase
indices are permitted; within one orbit the positions must be deduplicated. -/
set_option autoImplicit false
namespace NoThreeLine.BenchmarkNatTree

theorem contribution_append (j : ℕ) (xs ys : List (ℕ × ℕ)) :
    contribution j (xs ++ ys) = contribution j xs + contribution j ys := by
  induction xs with
  | nil => simp [contribution]
  | cons x xs ih => simp [contribution,ih,Nat.add_assoc]

theorem contribution_flatMap {α : Type*} (j : ℕ) (f : α → List (ℕ × ℕ))
    (xs : List α) :
    contribution j (xs.flatMap f) = (xs.map (fun x => contribution j (f x))).sum := by
  induction xs with
  | nil => rfl
  | cons x xs ih => simp [contribution_append,ih]

theorem contribution_map_nodup {α : Type*} [DecidableEq α]
    (key : α → ℕ) (hk : Function.Injective key) (p : α) (w : ℕ)
    (xs : List α) (hx : xs.Nodup) :
    contribution (key p) (xs.map (fun q => (key q,w))) = if p∈xs then w else 0 := by
  induction xs with
  | nil => simp [contribution]
  | cons q xs ih =>
      have hn := List.nodup_cons.mp hx
      by_cases hp : p=q
      · subst p
        simp [contribution,ih hn.2,hn.1]
      · have hkey : key p ≠ key q := fun h => hp (hk h)
        simp [contribution,ih hn.2,hp,hkey]

end NoThreeLine.BenchmarkNatTree

#print axioms NoThreeLine.BenchmarkNatTree.contribution_map_nodup
