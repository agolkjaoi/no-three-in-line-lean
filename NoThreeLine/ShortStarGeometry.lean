import NoThreeLine.LineLabelConnection
import NoThreeLine.RootLineLengthSum

/-! Actual ordered short stars (leaf q, witness z) on a non-specified root
line. All three points are distinct; the actual whole-line length is < H. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.ShortStars
open PrimitiveLines GridLines AuxiliaryODE MixedConnection

def Valid {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) (q z : Grid n) : Prop :=
  q≠p ∧ z≠p ∧ q≠z ∧ z∈lineThrough p q ∧ ¬specifiedPair Γ p q ∧
    ((lineThrough p q).card : ℝ)<H

def shortStars {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) : Finset (Grid n×Grid n) := by
  classical
  exact Finset.univ.filter (fun s => Valid Γ p H s.1 s.2)

def witnesses {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) (q : Grid n) : Finset (Grid n) := by
  classical
  exact Finset.univ.filter (Valid Γ p H q)

@[simp] theorem mem_shortStars {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) (q z : Grid n) :
    (q,z)∈shortStars Γ p H ↔ Valid Γ p H q z := by simp [shortStars]

@[simp] theorem mem_witnesses {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) (q z : Grid n) :
    z∈witnesses Γ p H q ↔ Valid Γ p H q z := by simp [witnesses]

theorem Valid.swap {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) (q z : Grid n)
    (h : Valid Γ p H q z) : Valid Γ p H z q := by
  have he := lineThrough_eq_of_mem p q z h.1.symm h.2.1.symm h.2.2.2.1
  refine ⟨h.2.1,h.1,h.2.2.1.symm,?_,?_,?_⟩
  · rw [←he]
    exact right_mem_lineThrough p q
  · intro hs
    apply h.2.2.2.2.1
    apply (specifiedPair_iff_line_mem Γ p q h.1.symm).mpr
    rw [he]
    exact (specifiedPair_iff_line_mem Γ p z h.2.1.symm).mp hs
  · rw [←he]
    exact h.2.2.2.2.2

theorem valid_swap_iff {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) (q z : Grid n) :
    Valid Γ p H q z ↔ Valid Γ p H z q :=
  ⟨Valid.swap Γ p H q z,Valid.swap Γ p H z q⟩

theorem nonspecified_actual_line {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (q z : Grid n) (h : Valid Γ p H q z) (L : LineIndex n) (hL : L.val=lineThrough p q) :
    ¬specified Γ L := by
  intro hs
  have hpL : p∈L.val := hL ▸ left_mem_lineThrough p q
  have hd := (specified_iff_designated Γ p L hpL).mp hs
  apply h.2.2.2.2.1
  apply (specifiedPair_iff_line_mem Γ p q h.1.symm).mpr
  rw [←hL]
  exact (Finset.mem_inter.mp hd).1

theorem witnesses_subset_line {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) (q : Grid n) :
    witnesses Γ p H q⊆lineThrough p q := by
  intro z hz
  exact ((mem_witnesses Γ p H q z).mp hz).2.2.2.1

theorem witnesses_card_le_line {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) (q : Grid n) :
    (witnesses Γ p H q).card≤(lineThrough p q).card :=
  Finset.card_le_card (witnesses_subset_line Γ p H q)

@[simp] theorem witnesses_root {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) :
    witnesses Γ p H p=∅ := by
  ext z
  simp [witnesses,Valid]

theorem witnesses_card_le_threshold {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (hH : 0≤H) (q : Grid n) : ((witnesses Γ p H q).card : ℝ)≤H := by
  classical
  by_cases he : (witnesses Γ p H q).Nonempty
  · obtain ⟨z,hz⟩ := he
    exact (show ((witnesses Γ p H q).card : ℝ)≤(lineThrough p q).card by
      exact_mod_cast witnesses_card_le_line Γ p H q).trans
        (((mem_witnesses Γ p H q z).mp hz).2.2.2.2.2.le)
  · rw [Finset.not_nonempty_iff_eq_empty.mp he]
    simpa using hH

theorem sum_shortStars {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (g : Grid n→Grid n→ℝ) :
    (∑s∈shortStars Γ p H,g s.1 s.2)=∑q : Grid n,∑z∈witnesses Γ p H q,g q z := by
  classical
  simp only [shortStars,witnesses,Finset.sum_filter]
  exact Fintype.sum_prod_type _

theorem shortStars_card_eq_sum {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) :
    ((shortStars Γ p H).card : ℝ)=∑q : Grid n,((witnesses Γ p H q).card : ℝ) := by
  simpa using sum_shortStars Γ p H (fun _ _ => 1)

theorem shortStars_card_le_root_sum {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) :
    ((shortStars Γ p H).card : ℝ)≤FiniteDirections.rootLineLengthSum p := by
  classical
  rw [shortStars_card_eq_sum]
  apply Finset.sum_le_sum
  intro q _
  by_cases hq : q=p
  · subst q
    simp
  · rw [if_pos hq]
    exact_mod_cast witnesses_card_le_line Γ p H q

theorem shortStars_card_le_log {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) :
    ((shortStars Γ p H).card : ℝ)≤16*(n : ℝ)^2*(1+Real.log n) :=
  (shortStars_card_le_root_sum Γ p H).trans (FiniteDirections.rootLineLengthSum_le_log p)

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.Valid.swap
#print axioms NoThreeLine.ShortStars.witnesses_card_le_threshold
#print axioms NoThreeLine.ShortStars.shortStars_card_le_log
