import NoThreeLine.PairHHGeometry

/-! Edges whose selected witness labels have already appeared. Two fixed
root-to-witness lines admit at most one off-baseline cause. One specified
side admits at most |Gamma| causes. No state-dependent counting premise. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.PairWitness
open PrimitiveLines GridLines AuxiliaryODE LineDrift MixedConnection

def knownWitnessCauses {n : ℕ} (a b z w : Grid n) : Finset (Grid n) :=
  Finset.univ.filter (fun q=>orientedArea a b q≠0 ∧
    z∈lineThrough a q ∧ w∈lineThrough b q)

theorem knownWitnessCauses_card_le_one {n : ℕ} (a b z w : Grid n)
    (haz : a≠z) (hbw : b≠w) : (knownWitnessCauses a b z w).card≤1 := by
  let L := boardLineThrough a z haz
  let K := boardLineThrough b w hbw
  have hsub : knownWitnessCauses a b z w⊆offBaselineIntersections a b L K := by
    intro q hq
    have hm := (Finset.mem_filter.mp hq).2
    have hd := offBaseline_distinct a b q hm.1
    have hL := lineThrough_eq_of_mem a q z hd.2.1 haz hm.2.1
    have hK := lineThrough_eq_of_mem b q w hd.2.2 hbw hm.2.2
    have hqL : q∈L.val := by change q∈lineThrough a z; rw [←hL]; exact right_mem_lineThrough a q
    have hqK : q∈K.val := by change q∈lineThrough b w; rw [←hK]; exact right_mem_lineThrough b q
    exact Finset.mem_filter.mpr ⟨Finset.mem_inter.mpr
      ⟨hqL,hqK⟩,hm.1⟩
  exact (Finset.card_le_card hsub).trans (offBaselineIntersections_card_le_one a b L K
    (left_mem_lineThrough a z) (left_mem_lineThrough b w))

def specifiedKnownCauses {n : ℕ} (Γ : Finset ZPoint) (a b w : Grid n) : Finset (Grid n) :=
  Finset.univ.filter (fun q=>orientedArea a b q≠0 ∧
    specifiedPair Γ a q ∧ w∈lineThrough b q)

theorem specifiedKnownCauses_card_le {n : ℕ} (Γ : Finset ZPoint) (a b w : Grid n)
    (hbw : b≠w) : (specifiedKnownCauses Γ a b w).card≤Γ.card := by
  let K := boardLineThrough b w hbw
  have hsub : specifiedKnownCauses Γ a b w⊆
      (rootSpecifiedLines Γ a).biUnion (fun L=>offBaselineIntersections a b L K) := by
    intro q hq
    have hm := (Finset.mem_filter.mp hq).2
    have hd := offBaseline_distinct a b q hm.1
    let L := boardLineThrough a q hd.2.1
    have ha : a∈L.val := left_mem_lineThrough a q
    have hL : L∈rootSpecifiedLines Γ a := Finset.mem_filter.mpr ⟨Finset.mem_univ _,ha,
      (specified_iff_designated Γ a L ha).mpr ((designated_iff Γ a q hd.2.1).mpr hm.2.1)⟩
    have hK := lineThrough_eq_of_mem b q w hd.2.2 hbw hm.2.2
    have hqK : q∈K.val := by change q∈lineThrough b w; rw [←hK]; exact right_mem_lineThrough b q
    exact Finset.mem_biUnion.mpr ⟨L,hL,Finset.mem_filter.mpr ⟨Finset.mem_inter.mpr
      ⟨right_mem_lineThrough a q,hqK⟩,hm.1⟩⟩
  calc
    _ ≤ ((rootSpecifiedLines Γ a).biUnion (fun L=>offBaselineIntersections a b L K)).card :=
      Finset.card_le_card hsub
    _ ≤ ∑ L∈rootSpecifiedLines Γ a, (offBaselineIntersections a b L K).card := Finset.card_biUnion_le
    _ ≤ ∑ _L∈rootSpecifiedLines Γ a, 1 := Finset.sum_le_sum (fun L hL=>
      offBaselineIntersections_card_le_one a b L K (Finset.mem_filter.mp hL).2.1
        (left_mem_lineThrough b w))
    _ = (rootSpecifiedLines Γ a).card := by simp
    _ ≤ Γ.card := rootSpecifiedLines_card_le Γ a

theorem actual_knownWitnessCauses_card_le {n : ℕ} (s : ProcessState n) (hs : s.Valid)
    (a b z w : Grid n) (ha : (s.accounts a).status=.active)
    (hb : (s.accounts b).status=.active) (hz : z∈s.selected) (hw : w∈s.selected) :
    (knownWitnessCauses a b z w).card≤1 :=
  knownWitnessCauses_card_le_one a b z w (selected_ne_active s hs z a hz ha).symm
    (selected_ne_active s hs w b hw hb).symm

theorem actual_specifiedKnownCauses_card_le {n : ℕ} (s : ProcessState n) (hs : s.Valid)
    (Γ : Finset ZPoint) (a b w : Grid n) (hb : (s.accounts b).status=.active)
    (hw : w∈s.selected) : (specifiedKnownCauses Γ a b w).card≤Γ.card :=
  specifiedKnownCauses_card_le Γ a b w (selected_ne_active s hs w b hw hb).symm

end NoThreeLine.PairWitness

#print axioms NoThreeLine.PairWitness.knownWitnessCauses_card_le_one
#print axioms NoThreeLine.PairWitness.specifiedKnownCauses_card_le
#print axioms NoThreeLine.PairWitness.actual_knownWitnessCauses_card_le
