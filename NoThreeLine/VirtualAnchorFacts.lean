import NoThreeLine.VirtualFixedObservable

/-! Fixed anchor label counts. The active root is outside the actual board
line. Witness labels are distinct, even when an anchor is not realizable. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.VirtualWitness
open AuxiliaryODE PrimitiveLines

theorem anchorLeaves_card {n a : ℕ} {L : LineIndex n} {q : Grid n}
    (g : Fin a → candidates L q) (hg : g ∈ anchors L q a) :
    (rawLeaves (fun i => (g i).val)).card = a := by
  rw [rawLeaves, Finset.card_image_of_injective _ (Finset.mem_filter.mp hg).2.1]
  simp

theorem anchorWitnesses_card {n a : ℕ} {L : LineIndex n} {q : Grid n}
    (g : Fin a → candidates L q) (hg : g ∈ anchors L q a) :
    (rawWitnesses (fun i => (g i).val)).card = a := by
  rw [rawWitnesses, Finset.card_image_of_injective _ (Finset.mem_filter.mp hg).2.2]
  simp

theorem anchorLeaves_subset_line {n a : ℕ} {L : LineIndex n} {q : Grid n}
    (g : Fin a → candidates L q) : rawLeaves (fun i => (g i).val) ⊆ L.val := by
  intro y hy
  obtain ⟨i, _, rfl⟩ := Finset.mem_image.mp hy
  exact (Finset.mem_sigma.mp (g i).property).1

theorem root_not_mem_anchorLeaves {n a : ℕ} {L : LineIndex n} {q : Grid n}
    (g : Fin a → candidates L q) (hq : q ∉ L.val) :
    q ∉ rawLeaves (fun i => (g i).val) := fun h => hq (anchorLeaves_subset_line g h)

theorem anchorRootLeaves_card {n a : ℕ} {L : LineIndex n} {q : Grid n}
    (g : Fin a → candidates L q) (hg : g ∈ anchors L q a) (hq : q ∉ L.val) :
    (insert q (rawLeaves (fun i => (g i).val))).card = a + 1 := by
  rw [Finset.card_insert_of_notMem (root_not_mem_anchorLeaves g hq), anchorLeaves_card g hg]

theorem anchorLabels_card_le {n a : ℕ} {L : LineIndex n} {q : Grid n}
    (g : Fin a → candidates L q) (hg : g ∈ anchors L q a) (hq : q ∉ L.val) :
    ((insert q (rawLeaves (fun i => (g i).val))) ∪ rawWitnesses (fun i => (g i).val)).card ≤ 2*a+1 := by
  apply (Finset.card_union_le _ _).trans
  rw [anchorRootLeaves_card g hg hq, anchorWitnesses_card g hg]
  omega

theorem anchorWitness_price {n a : ℕ} {L : LineIndex n} {q : Grid n}
    (g : Fin a → candidates L q) (hg : g ∈ anchors L q a) (price : Grid n → ℝ) :
    (∏ z ∈ rawWitnesses (fun i => (g i).val), price z) = ∏ i : Fin a, price (g i).val.2 :=
  Finset.prod_image (fun i _ j _ h => (Finset.mem_filter.mp hg).2.2 h)

end NoThreeLine.VirtualWitness

#print axioms NoThreeLine.VirtualWitness.anchorLabels_card_le
#print axioms NoThreeLine.VirtualWitness.anchorWitness_price
