import NoThreeLine.VirtualDeletionGuard
import NoThreeLine.ShortStarCounts

/-! Static geometry of the actual virtual-deletion leaves.  The external
active root lies outside the designated board line.  Selected witnesses for
distinct leaves are distinct; no stopping-time or probability bound is used. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.VirtualWitness
open AuxiliaryODE GridLines MixedConnection PrimitiveLines

def leaves {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (L : LineIndex n) (q : Grid n) : Finset (Grid n) :=
  L.val.filter (fun y => virtualLeaf s Γ y q)

theorem mem_leaves {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (L : LineIndex n) (q y : Grid n) :
    y ∈ leaves s Γ L q ↔ y ∈ L.val ∧ virtualLeaf s Γ y q := Finset.mem_filter

theorem outside_line_injective {n : ℕ} (L : LineIndex n) (q : Grid n)
    (hq : q ∉ L.val) : Set.InjOn (lineThrough q) (↑L.val : Set (Grid n)) := by
  intro y hy z hz he
  by_contra hyz
  have hz' : z ∈ lineThrough q y := he ▸ right_mem_lineThrough q z
  have harea := (mem_lineThrough q y z).mp hz'
  have hq' : q ∈ lineThrough y z := by
    apply (mem_lineThrough y z q).mpr
    rw [← orientedArea_cycle q y z]
    exact harea
  exact hq ((boardLine_eq L y z hy hz hyz).symm ▸ hq')

theorem selected_witness_injective {n : ℕ} (s : ProcessState n) (hs : s.Valid)
    (L : LineIndex n) (q : Grid n) (hqL : q ∉ L.val)
    (hq : (s.accounts q).status = .active)
    {α : Type*} (y z : α → Grid n) (hy : ∀ i, y i ∈ L.val)
    (hyi : Function.Injective y) (hz : ∀ i, z i ∈ s.selected)
    (hline : ∀ i, z i ∈ lineThrough q (y i)) : Function.Injective z := by
  intro i j hij
  by_contra hne
  have hyij : y i ≠ y j := fun he => hne (hyi he)
  have hlines : lineThrough q (y i) ≠ lineThrough q (y j) :=
    fun he => hyij (outside_line_injective L q hqL (hy i) (hy j) he)
  have hqi : q ≠ y i := fun he => hqL (he ▸ hy i)
  have hqj : q ≠ y j := fun he => hqL (he ▸ hy j)
  have he := distinct_lines_intersect_only_root q _ _
    (lineThrough_mem_linesThrough q (y i) hqi)
    (lineThrough_mem_linesThrough q (y j) hqj) hlines (z i)
    (hline i) (hij ▸ hline j)
  exact (hs.2.1 q hq).1 (he ▸ hz i)

def witness {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (L : LineIndex n) (q : Grid n) (y : leaves s Γ L q) : Grid n :=
  Classical.choose ((mem_leaves s Γ L q y.val).mp y.property).2.2.2

theorem witness_selected {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (L : LineIndex n) (q : Grid n) (y : leaves s Γ L q) :
    witness s Γ L q y ∈ s.selected :=
  (Classical.choose_spec ((mem_leaves s Γ L q y.val).mp y.property).2.2.2).1

theorem witness_on_line {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (L : LineIndex n) (q : Grid n) (y : leaves s Γ L q) :
    witness s Γ L q y ∈ lineThrough q y.val := by
  rw [BirthLineGroups.lineThrough_swap]
  exact (mem_lineThrough _ _ _).mpr
    (Classical.choose_spec ((mem_leaves s Γ L q y.val).mp y.property).2.2.2).2

theorem witness_injective {n : ℕ} (s : ProcessState n) (hs : s.Valid)
    (Γ : Finset ZPoint) (L : LineIndex n) (q : Grid n)
    (hqL : q ∉ L.val) (hq : (s.accounts q).status = .active) :
    Function.Injective (witness s Γ L q) :=
  selected_witness_injective s hs L q hqL hq Subtype.val (witness s Γ L q)
    (fun y => ((mem_leaves s Γ L q y.val).mp y.property).1)
    Subtype.val_injective (witness_selected s Γ L q) (witness_on_line s Γ L q)

theorem witness_ne_active {n : ℕ} (s : ProcessState n) (hs : s.Valid)
    (Γ : Finset ZPoint) (L : LineIndex n) (q : Grid n)
    (y : leaves s Γ L q) (p : Grid n) (hp : (s.accounts p).status = .active) :
    witness s Γ L q y ≠ p := by
  intro he
  exact (hs.2.1 p hp).1 (he ▸ witness_selected s Γ L q y)

theorem witness_ne_leaf {n : ℕ} (s : ProcessState n) (hs : s.Valid)
    (Γ : Finset ZPoint) (L : LineIndex n) (q : Grid n)
    (y z : leaves s Γ L q) : witness s Γ L q y ≠ z.val :=
  witness_ne_active s hs Γ L q y z.val
    ((mem_leaves s Γ L q z.val).mp z.property).2.1

/-- All geometric candidates, enlarged by dropping selection and distinctness. -/
def candidates {n : ℕ} (L : LineIndex n) (q : Grid n) : Finset (Σ _ : Grid n, Grid n) :=
  L.val.sigma (fun y => lineThrough q y)

theorem candidates_card {n : ℕ} (L : LineIndex n) (q : Grid n) :
    ((candidates L q).card : ℝ) = ∑ y ∈ L.val, ((lineThrough q y).card : ℝ) := by
  simp [candidates, Finset.card_sigma]

theorem witness_candidate {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (L : LineIndex n) (q : Grid n) (y : leaves s Γ L q) :
    (⟨y.val, witness s Γ L q y⟩ : Σ _ : Grid n, Grid n) ∈ candidates L q := by
  exact Finset.mem_sigma.mpr ⟨((mem_leaves s Γ L q y.val).mp y.property).1,
    witness_on_line s Γ L q y⟩

theorem candidates_card_le_const_rpow (ξ : ℝ) (hξ : 0 < ξ) :
    ∃ C : ℝ, 0 < C ∧ ∀ (n : ℕ) (L : LineIndex n) (q : Grid n), q ∉ L.val →
      ((candidates L q).card : ℝ) ≤ C * (n : ℝ) ^ (1 + ξ) := by
  obtain ⟨C, hC, h⟩ := OffLineDivisors.off_boardLine_sum_le_const_rpow ξ hξ
  exact ⟨C, hC, fun n L q hq => (candidates_card L q).trans_le (h n q L hq)⟩

theorem candidate_tuples_card_le_const_rpow (ξ : ℝ) (hξ : 0 < ξ) :
    ∃ C : ℝ, 0 < C ∧ ∀ (n a : ℕ) (L : LineIndex n) (q : Grid n), q ∉ L.val →
      (Fintype.card (Fin a → candidates L q) : ℝ) ≤
        (C * (n : ℝ) ^ (1 + ξ)) ^ a := by
  obtain ⟨C, hC, h⟩ := candidates_card_le_const_rpow ξ hξ
  refine ⟨C, hC, ?_⟩
  intro n a L q hq
  simp only [Fintype.card_fun, Fintype.card_coe, Fintype.card_fin, Nat.cast_pow]
  exact pow_le_pow_left₀ (Nat.cast_nonneg _) (h n L q hq) a

end NoThreeLine.VirtualWitness

#print axioms NoThreeLine.VirtualWitness.witness_injective
#print axioms NoThreeLine.VirtualWitness.witness_ne_leaf
#print axioms NoThreeLine.VirtualWitness.candidate_tuples_card_le_const_rpow
