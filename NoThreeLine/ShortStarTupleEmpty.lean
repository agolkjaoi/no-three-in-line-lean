import NoThreeLine.ShortStarTupleSeparated
import NoThreeLine.ShortStarAdditionalPoints
import NoThreeLine.ShortStarLongPairs

/-! Actual selected-point emptiness on lines containing two tuple leaves.
The hypotheses are concrete exceptions (ii), (iii), (iv), not a restatement
of LeafPairEmpty. No probability or stopping-time estimate is asserted. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.ShortStars
open PrimitiveLines GridLines AuxiliaryODE MixedConnection

def TupleRealized {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (s : ProcessState n) : Prop :=
  s.Valid ∧ p∈s.activeEvents ∧
    (∀i,(f i).val.1∈s.activeEvents) ∧ (∀i,(f i).val.2∈s.selected)

def NoLongLeafPairException {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (R : ℝ) : Prop :=
  ∀i j : Fin m,i≠j → ((f i).val,(f j).val)∉longLeafPairs Γ p H R

def NoThirdWitnessException {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) : Prop :=
  ∀i j k : Fin m,i≠j → k≠i → k≠j →
    (((f i).val,(f j).val),(f k).val)∉witnessTriples Γ p H

def NoExtraSelectedException {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (s : ProcessState n) (R : ℝ) : Prop :=
  ∀i j : Fin m,i≠j → ∀v∈s.selected,v∉insert p (leafLabels f∪witnessLabels f) →
    (((f i).val,(f j).val),v)∉freshExtraPointTriples Γ p H R

theorem TupleRealized.selected_not_root {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (s : ProcessState n) (h : TupleRealized f s) : p∉s.selected :=
  (h.1.2.1 p ((s.mem_activeEvents p).mp h.2.1)).1

theorem TupleRealized.selected_not_leaf {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (s : ProcessState n) (h : TupleRealized f s)
    (v : Grid n) (hv : v∈s.selected) : v∉leafLabels f := by
  intro hC
  obtain ⟨i,_,hi⟩ := Finset.mem_image.mp hC
  have hn := (h.1.2.1 (f i).val.1 ((s.mem_activeEvents _).mp (h.2.2.1 i))).1
  exact hn (hi ▸ hv)

theorem leaf_pair_length_le_of_no_long {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (hD : RootLinePairwise f) (R : ℝ)
    (hii : NoLongLeafPairException f R) (i j : Fin m) (hij : i≠j) :
    ((lineThrough (f i).val.1 (f j).val.1).card : ℝ)≤R := by
  by_contra h
  apply hii i j hij
  apply (mem_longLeafPairs Γ p H R (f i).val (f j).val).mpr
  exact ⟨(f i).property,(f j).property,
    (distinct_root_lines_leaves_ne p _ _ (hD i j hij)).symm,lt_of_not_ge h⟩

theorem tuple_witness_not_on_leaf_line {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (hD : RootLinePairwise f)
    (hiv : NoThirdWitnessException f) (i j : Fin m) (hij : i≠j) (k : Fin m) :
    (f k).val.2∉lineThrough (f i).val.1 (f j).val.1 := by
  by_cases hki : k=i
  · subst k
    exact first_witness_not_on_leaf_line Γ p H _ _ (f i).property (f j).property (hD i j hij)
  by_cases hkj : k=j
  · subst k
    exact second_witness_not_on_leaf_line Γ p H _ _ (f i).property (f j).property (hD i j hij)
  intro hz
  apply hiv i j k hij hki hkj
  apply (mem_witnessTriples Γ p H (f i).val (f j).val (f k).val).mpr
  refine ⟨(mem_distinctRootPairs Γ p H _ _).mpr ⟨(f i).property,(f j).property,hD i j hij⟩,?_⟩
  exact Finset.mem_filter.mpr ⟨(f k).property,hz⟩

theorem selected_not_on_leaf_line {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (hD : RootLinePairwise f) (s : ProcessState n)
    (hs : TupleRealized f s) (R : ℝ) (hii : NoLongLeafPairException f R)
    (hiii : NoExtraSelectedException f s R) (hiv : NoThirdWitnessException f)
    (i j : Fin m) (hij : i≠j) (v : Grid n) (hv : v∈s.selected) :
    v∉lineThrough (f i).val.1 (f j).val.1 := by
  intro hline
  by_cases hvD : v∈witnessLabels f
  · obtain ⟨k,_,hk⟩ := Finset.mem_image.mp hvD
    exact tuple_witness_not_on_leaf_line f hD hiv i j hij k (hk ▸ hline)
  · have hvp : v≠p := fun he => TupleRealized.selected_not_root f s hs (he ▸ hv)
    have hvC : v∉leafLabels f := TupleRealized.selected_not_leaf f s hs v hv
    have hout : v∉insert p (leafLabels f∪witnessLabels f) := by
      simpa only [Finset.mem_insert,Finset.mem_union,not_or] using ⟨hvp,hvC,hvD⟩
    have hqi : (f i).val.1∈leafLabels f := Finset.mem_image.mpr ⟨i,Finset.mem_univ _,rfl⟩
    have hqj : (f j).val.1∈leafLabels f := Finset.mem_image.mpr ⟨j,Finset.mem_univ _,rfl⟩
    have hzi : (f i).val.2∈witnessLabels f := Finset.mem_image.mpr ⟨i,Finset.mem_univ _,rfl⟩
    have hzj : (f j).val.2∈witnessLabels f := Finset.mem_image.mpr ⟨j,Finset.mem_univ _,rfl⟩
    apply hiii i j hij v hv hout
    apply Finset.mem_filter.mpr
    refine ⟨(mem_extraPointTriples Γ p H R (f i).val (f j).val v).mpr ⟨?_,?_,hline⟩,?_⟩
    · exact (mem_distinctRootPairs Γ p H _ _).mpr ⟨(f i).property,(f j).property,hD i j hij⟩
    · exact leaf_pair_length_le_of_no_long f hD R hii i j hij
    · change v≠p ∧ v≠(f i).val.1 ∧ v≠(f j).val.1 ∧ v≠(f i).val.2 ∧ v≠(f j).val.2
      exact ⟨hvp,(fun he => hvC (he ▸ hqi)),(fun he => hvC (he ▸ hqj)),
        (fun he => hvD (he ▸ hzi)),(fun he => hvD (he ▸ hzj))⟩

theorem occupancy_eq_zero_of_two_leaves {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (hD : RootLinePairwise f) (s : ProcessState n)
    (hs : TupleRealized f s) (R : ℝ) (hii : NoLongLeafPairException f R)
    (hiii : NoExtraSelectedException f s R) (hiv : NoThirdWitnessException f)
    (K : LineIndex n) (hK : 2≤multiplicity (leafLabels f) K) : occupancy s K=0 := by
  classical
  have hcard : 1<(leafLabels f∩K.val).card := by change 2≤(leafLabels f∩K.val).card at hK; omega
  obtain ⟨q,hq,r,hr,hqr⟩ := Finset.one_lt_card.mp hcard
  have hq' := Finset.mem_inter.mp hq
  have hr' := Finset.mem_inter.mp hr
  obtain ⟨i,_,hi⟩ := Finset.mem_image.mp hq'.1
  obtain ⟨j,_,hj⟩ := Finset.mem_image.mp hr'.1
  have hij : i≠j := by intro he; subst j; exact hqr (hi.symm.trans hj)
  have hKi : (f i).val.1∈K.val := hi ▸ hq'.2
  have hKj : (f j).val.1∈K.val := hj ▸ hr'.2
  have he : K.val=lineThrough (f i).val.1 (f j).val.1 :=
    boardLine_eq K _ _ hKi hKj (fun h => hqr (hi.symm.trans (h.trans hj)))
  apply Finset.card_eq_zero.mpr
  apply Finset.eq_empty_iff_forall_notMem.mpr
  intro v hv
  have hv' := Finset.mem_inter.mp hv
  exact selected_not_on_leaf_line f hD s hs R hii hiii hiv i j hij v hv'.1 (he ▸ hv'.2)

theorem leafPairEmpty_of_no_exceptions {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (hD : RootLinePairwise f) (e : ExtendedState n)
    (hs : TupleRealized f e.process) (R : ℝ) (hii : NoLongLeafPairException f R)
    (hiii : NoExtraSelectedException f e.process R) (hiv : NoThirdWitnessException f) :
    LeafPairEmpty e (leafLabels f) :=
  occupancy_eq_zero_of_two_leaves f hD e.process hs R hii hiii hiv

theorem connectionProduct_of_no_exceptions {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (hD : RootLinePairwise f) (hN : NoSpecifiedCrossPairs f)
    (e : ExtendedState n) (hs : TupleRealized f e.process) (hE : EmptyLineCredit e)
    (R : ℝ) (hii : NoLongLeafPairException f R) (hiii : NoExtraSelectedException f e.process R)
    (hiv : NoThirdWitnessException f) :
    connectionProduct Γ (insert p (leafLabels f)) e =
      ∏q : leafLabels f,e.lineCredits (rootLeafLine p (leafLabels f)
        (fun hp => root_not_mem_labels f (Finset.mem_union_left _ hp)) q) :=
  tuple_connectionProduct f hD hN e hE (leafPairEmpty_of_no_exceptions f hD e hs R hii hiii hiv)

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.leafPairEmpty_of_no_exceptions
#print axioms NoThreeLine.ShortStars.connectionProduct_of_no_exceptions
