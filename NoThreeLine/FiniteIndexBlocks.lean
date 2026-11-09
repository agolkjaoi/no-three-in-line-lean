import NoThreeLine.GridCutTree

/-! Small finite-index proofs concatenate without reducing one large
Decidable forall expression. No arithmetic or geometric premise is dropped. -/
set_option autoImplicit false
namespace NoThreeLine

def finOffset (n lo size : ℕ) (h : lo+size ≤ n) (i : Fin size) : Fin n :=
  ⟨lo+i.val,by have := i.isLt; omega⟩

theorem forallFinOffset_add {n : ℕ} (P : Fin n → Prop) (lo a b : ℕ)
    (h : lo+(a+b) ≤ n)
    (ha : ∀ i : Fin a, P (finOffset n lo a (by omega) i))
    (hb : ∀ i : Fin b, P (finOffset n (lo+a) b (by omega) i)) :
    ∀ i : Fin (a+b), P (finOffset n lo (a+b) h i) := by
  intro i
  by_cases hi : i.val < a
  · exact ha ⟨i.val,hi⟩
  · have hib : i.val-a < b := by have := i.isLt; omega
    have hh := hb ⟨i.val-a,hib⟩
    have he : finOffset n (lo+a) b (by omega) ⟨i.val-a,hib⟩ =
        finOffset n lo (a+b) h i := by
      apply Fin.ext
      simp only [finOffset]
      omega
    exact he ▸ hh

theorem forallFin_of_zero_offset {n : ℕ} (P : Fin n → Prop)
    (h : ∀ i : Fin n, P (finOffset n 0 n (by omega) i)) : ∀ i, P i := by
  intro i
  have he : finOffset n 0 n (by omega) i = i := by apply Fin.ext; simp [finOffset]
  exact he ▸ h i

end NoThreeLine

#print axioms NoThreeLine.forallFinOffset_add
