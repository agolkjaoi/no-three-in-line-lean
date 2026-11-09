import NoThreeLine.ActualOutsideRisk
import NoThreeLine.LongLineExcessBudget

/-! The actual r-weighted proxy is partitioned by the whole board-line
cardinality. Short is strict < H, long is H <= cardinality, exactly as in
shortStars and the existing long retention/excess definitions. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators
namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines FiniteDirections

def shortRootBoardLines {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) :
    Finset (RootBoardLineIndex p) := by
  classical
  exact Finset.univ.filter (fun L => ¬specified Γ L.val ∧ (L.val.val.card : ℝ) < H)

theorem mem_shortRootBoardLines {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (L : RootBoardLineIndex p) : L ∈ shortRootBoardLines Γ p H ↔
      ¬specified Γ L.val ∧ (L.val.val.card : ℝ) < H := by
  classical
  simp only [shortRootBoardLines,Finset.mem_filter,Finset.mem_univ,true_and]

theorem short_long_rootLines_partition {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) :
    Disjoint (shortRootBoardLines Γ p H) (longRootBoardLines Γ p H) ∧
      shortRootBoardLines Γ p H ∪ longRootBoardLines Γ p H = nonSpecifiedRootBoardLines Γ p := by
  classical
  constructor
  · apply Finset.disjoint_left.mpr
    intro L hs hl
    exact (not_lt_of_ge ((mem_longRootBoardLines Γ p H L).mp hl).2)
      ((mem_shortRootBoardLines Γ p H L).mp hs).2
  · ext L
    simp only [Finset.mem_union,mem_shortRootBoardLines,mem_longRootBoardLines,
      nonSpecifiedRootBoardLines,Finset.mem_filter,Finset.mem_univ,true_and]
    constructor
    · rintro (h|h) <;> exact h.1
    · intro h
      rcases lt_or_ge (L.val.val.card : ℝ) H with hs|hl
      · exact Or.inl ⟨h,hs⟩
      · exact Or.inr ⟨h,hl⟩

def physicalOutsideShortProxy {n : ℕ} (Γ : Finset ZPoint) (mask : Grid n → ℝ)
    (p : Grid n) (H : ℝ) (e : ExtendedState n) : ℝ :=
  ∑ L ∈ shortRootBoardLines Γ p H, physicalOutsideLineProxy mask p L.val e

def physicalOutsideLongProxy {n : ℕ} (Γ : Finset ZPoint) (mask : Grid n → ℝ)
    (p : Grid n) (H : ℝ) (e : ExtendedState n) : ℝ :=
  ∑ L ∈ longRootBoardLines Γ p H, physicalOutsideLineProxy mask p L.val e

theorem physicalOutsideProxy_partition {n : ℕ} (Γ : Finset ZPoint) (mask : Grid n → ℝ)
    (p : Grid n) (H : ℝ) (e : ExtendedState n) :
    physicalOutsideProxy Γ mask p e = physicalOutsideShortProxy Γ mask p H e +
      physicalOutsideLongProxy Γ mask p H e := by
  classical
  have h := short_long_rootLines_partition Γ p H
  unfold physicalOutsideProxy physicalOutsideShortProxy physicalOutsideLongProxy
  rw [←h.2,Finset.sum_union h.1]

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.short_long_rootLines_partition
#print axioms NoThreeLine.BirthWitness.physicalOutsideProxy_partition
