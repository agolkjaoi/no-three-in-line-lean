import NoThreeLine.VirtualMassExpansion

/-! The a distinct physical leaves in a virtual-mass tuple have exactly a
distinct selected witnesses.  The root, leaves and witnesses are disjoint.
The repeated-slot exponent therefore cannot reduce the witness count. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.VirtualWitness
open AuxiliaryODE PrimitiveLines FiniteWitnessMoments

def leafLabels {n m : ℕ} {s : ProcessState n} {Γ : Finset ZPoint}
    {L : LineIndex n} {q : Grid n} (f : Fin m → leaves s Γ L q) : Finset (Grid n) :=
  (tupleLabels f).image Subtype.val

def witnessLabels {n m : ℕ} {s : ProcessState n} {Γ : Finset ZPoint}
    {L : LineIndex n} {q : Grid n} (f : Fin m → leaves s Γ L q) : Finset (Grid n) :=
  (tupleLabels f).image (witness s Γ L q)

theorem leafLabels_eq_tupleLabels {n m : ℕ} {s : ProcessState n} {Γ : Finset ZPoint}
    {L : LineIndex n} {q : Grid n} (f : Fin m → leaves s Γ L q) :
    leafLabels f = tupleLabels (fun i : Fin m => (f i).val) := by
  simp only [leafLabels, tupleLabels, Finset.image_image, Function.comp_def]

theorem leafLabels_card {n m : ℕ} {s : ProcessState n} {Γ : Finset ZPoint}
    {L : LineIndex n} {q : Grid n} (f : Fin m → leaves s Γ L q) :
    (leafLabels f).card = (tupleLabels f).card :=
  Finset.card_image_of_injective _ Subtype.val_injective

theorem witnessLabels_card {n m : ℕ} {s : ProcessState n} {Γ : Finset ZPoint}
    {L : LineIndex n} {q : Grid n} (f : Fin m → leaves s Γ L q)
    (hs : s.Valid) (hqL : q ∉ L.val) (hq : (s.accounts q).status = .active) :
    (witnessLabels f).card = (leafLabels f).card := by
  rw [leafLabels_card]
  exact Finset.card_image_of_injective _ (witness_injective s hs Γ L q hqL hq)

theorem leafLabels_subset_line {n m : ℕ} {s : ProcessState n} {Γ : Finset ZPoint}
    {L : LineIndex n} {q : Grid n} (f : Fin m → leaves s Γ L q) : leafLabels f ⊆ L.val := by
  intro y hy
  obtain ⟨z, _, rfl⟩ := Finset.mem_image.mp hy
  exact ((mem_leaves s Γ L q z.val).mp z.property).1

theorem leafLabels_active {n m : ℕ} {s : ProcessState n} {Γ : Finset ZPoint}
    {L : LineIndex n} {q : Grid n} (f : Fin m → leaves s Γ L q)
    (y : Grid n) (hy : y ∈ leafLabels f) : (s.accounts y).status = .active := by
  obtain ⟨z, _, rfl⟩ := Finset.mem_image.mp hy
  exact ((mem_leaves s Γ L q z.val).mp z.property).2.1

theorem witnessLabels_subset_selected {n m : ℕ} {s : ProcessState n} {Γ : Finset ZPoint}
    {L : LineIndex n} {q : Grid n} (f : Fin m → leaves s Γ L q) :
    witnessLabels f ⊆ s.selected := by
  intro z hz
  obtain ⟨y, _, rfl⟩ := Finset.mem_image.mp hz
  exact witness_selected s Γ L q y

theorem leaf_witness_disjoint {n m : ℕ} {s : ProcessState n} {Γ : Finset ZPoint}
    {L : LineIndex n} {q : Grid n} (f : Fin m → leaves s Γ L q) (hs : s.Valid) :
    Disjoint (leafLabels f) (witnessLabels f) := by
  apply Finset.disjoint_left.mpr
  intro y hy hz
  exact (hs.2.1 y (leafLabels_active f y hy)).1 (witnessLabels_subset_selected f hz)

theorem root_not_mem_labels {n m : ℕ} {s : ProcessState n} {Γ : Finset ZPoint}
    {L : LineIndex n} {q : Grid n} (f : Fin m → leaves s Γ L q)
    (hs : s.Valid) (hqL : q ∉ L.val) (hq : (s.accounts q).status = .active) :
    q ∉ leafLabels f ∪ witnessLabels f := by
  intro h
  rcases Finset.mem_union.mp h with h | h
  · exact hqL (leafLabels_subset_line f h)
  · exact (hs.2.1 q hq).1 (witnessLabels_subset_selected f h)

theorem all_labels_card {n m : ℕ} {s : ProcessState n} {Γ : Finset ZPoint}
    {L : LineIndex n} {q : Grid n} (f : Fin m → leaves s Γ L q)
    (hs : s.Valid) (hqL : q ∉ L.val) (hq : (s.accounts q).status = .active) :
    (insert q (leafLabels f ∪ witnessLabels f)).card = 2 * (leafLabels f).card + 1 := by
  rw [Finset.card_insert_of_notMem (root_not_mem_labels f hs hqL hq),
    Finset.card_union_of_disjoint (leaf_witness_disjoint f hs), witnessLabels_card f hs hqL hq]
  omega

theorem distinct_leaf_count_bounds {n m : ℕ} {s : ProcessState n} {Γ : Finset ZPoint}
    {L : LineIndex n} {q : Grid n} (f : Fin m → leaves s Γ L q) (hm : 0 < m) :
    1 ≤ (leafLabels f).card ∧ (leafLabels f).card ≤ m := by
  rw [leafLabels_card]
  refine ⟨?_, tupleLabels_card_le f⟩
  apply Finset.card_pos.mpr
  exact ⟨f ⟨0, hm⟩, Finset.mem_image.mpr ⟨⟨0, hm⟩, Finset.mem_univ _, rfl⟩⟩

theorem repeatSum_eq_leafLabels {n m : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (L : LineIndex n) (q : Grid n) (w : Grid n → ℝ) (B : ℝ) :
    repeatSum (m := m) s Γ L q w B =
      ∑ f : Fin m → leaves s Γ L q,
        B ^ (m - (leafLabels f).card) * ∏ y ∈ leafLabels f, w y := by
  simp only [leafLabels_eq_tupleLabels, repeatSum]

end NoThreeLine.VirtualWitness

#print axioms NoThreeLine.VirtualWitness.witnessLabels_card
#print axioms NoThreeLine.VirtualWitness.all_labels_card
#print axioms NoThreeLine.VirtualWitness.distinct_leaf_count_bounds
