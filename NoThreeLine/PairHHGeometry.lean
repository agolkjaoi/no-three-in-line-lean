import NoThreeLine.PairWitnessGeometry

/-! The HH part of C2 has at most |Gamma|^2 actual off-baseline causes.
Geometrically duplicate directions are allowed and only overcount the cover. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.PairWitness
open AuxiliaryODE PrimitiveLines GridLines LineDrift

def rootSpecifiedLines {n : ℕ} (Γ : Finset ZPoint) (a : Grid n) : Finset (LineIndex n) :=
  Finset.univ.filter (fun L => a∈L.val ∧ specified Γ L)

theorem rootSpecifiedLines_card_le {n : ℕ} (Γ : Finset ZPoint) (a : Grid n) :
    (rootSpecifiedLines Γ a).card≤Γ.card := by
  calc
    _ = ((rootSpecifiedLines Γ a).image Subtype.val).card :=
      (Finset.card_image_of_injective _ Subtype.val_injective).symm
    _ ≤ (designatedLines Γ a).card := Finset.card_le_card (by
      intro L hL
      obtain ⟨L',hL',he⟩ := Finset.mem_image.mp hL
      rw [←he]
      have hh := (Finset.mem_filter.mp hL').2
      exact (specified_iff_designated Γ a L' hh.1).mp hh.2)
    _ ≤ (specifiedLines Γ a).card := Finset.card_le_card Finset.inter_subset_left
    _ ≤ (Γ.filter (fun d => d≠(0,0))).card := Finset.card_image_le
    _ ≤ _ := Finset.card_filter_le _ _

def hhCauses {n : ℕ} (Γ : Finset ZPoint) (a b : Grid n) : Finset (Grid n) :=
  Finset.univ.filter (fun q => orientedArea a b q≠0 ∧ specifiedPair Γ a q ∧ specifiedPair Γ b q)

def hhCover {n : ℕ} (Γ : Finset ZPoint) (a b : Grid n) : Finset (Grid n) :=
  (rootSpecifiedLines Γ a).biUnion (fun L =>
    (rootSpecifiedLines Γ b).biUnion (offBaselineIntersections a b L))

def boardLineThrough {n : ℕ} (a q : Grid n) (haq : a≠q) : LineIndex n :=
  ⟨lineThrough a q,Finset.mem_biUnion.mpr
    ⟨a,Finset.mem_univ _,lineThrough_mem_linesThrough a q haq⟩⟩

theorem hhCauses_subset_cover {n : ℕ} (Γ : Finset ZPoint) (a b : Grid n) :
    hhCauses Γ a b⊆hhCover Γ a b := by
  intro q hq
  have hh := (Finset.mem_filter.mp hq).2
  have hd := offBaseline_distinct a b q hh.1
  let L := boardLineThrough a q hd.2.1
  let K := boardLineThrough b q hd.2.2
  have ha : a∈L.val := left_mem_lineThrough a q
  have hb : b∈K.val := left_mem_lineThrough b q
  have hL : L∈rootSpecifiedLines Γ a := Finset.mem_filter.mpr ⟨Finset.mem_univ _,ha,
    (specified_iff_designated Γ a L ha).mpr ((designated_iff Γ a q hd.2.1).mpr hh.2.1)⟩
  have hK : K∈rootSpecifiedLines Γ b := Finset.mem_filter.mpr ⟨Finset.mem_univ _,hb,
    (specified_iff_designated Γ b K hb).mpr ((designated_iff Γ b q hd.2.2).mpr hh.2.2)⟩
  exact Finset.mem_biUnion.mpr ⟨L,hL,Finset.mem_biUnion.mpr ⟨K,hK,
    Finset.mem_filter.mpr ⟨Finset.mem_inter.mpr
      ⟨right_mem_lineThrough a q,right_mem_lineThrough b q⟩,hh.1⟩⟩⟩

theorem hhCauses_card_le {n : ℕ} (Γ : Finset ZPoint) (a b : Grid n) :
    (hhCauses Γ a b).card≤Γ.card^2 := by
  calc
    _ ≤ (hhCover Γ a b).card := Finset.card_le_card (hhCauses_subset_cover Γ a b)
    _ ≤ ∑ L∈rootSpecifiedLines Γ a,
        ((rootSpecifiedLines Γ b).biUnion (offBaselineIntersections a b L)).card := Finset.card_biUnion_le
    _ ≤ ∑ L∈rootSpecifiedLines Γ a,∑ K∈rootSpecifiedLines Γ b,
        (offBaselineIntersections a b L K).card :=
      Finset.sum_le_sum (fun L _ => Finset.card_biUnion_le)
    _ ≤ ∑ _L∈rootSpecifiedLines Γ a,∑ _K∈rootSpecifiedLines Γ b,1 := by
      apply Finset.sum_le_sum
      intro L hL
      apply Finset.sum_le_sum
      intro K hK
      exact offBaselineIntersections_card_le_one a b L K
        (Finset.mem_filter.mp hL).2.1 (Finset.mem_filter.mp hK).2.1
    _ = (rootSpecifiedLines Γ a).card*(rootSpecifiedLines Γ b).card := by simp
    _ ≤ Γ.card*Γ.card := Nat.mul_le_mul (rootSpecifiedLines_card_le Γ a) (rootSpecifiedLines_card_le Γ b)
    _ = _ := (sq _).symm

end NoThreeLine.PairWitness

#print axioms NoThreeLine.PairWitness.rootSpecifiedLines_card_le
#print axioms NoThreeLine.PairWitness.hhCauses_card_le
