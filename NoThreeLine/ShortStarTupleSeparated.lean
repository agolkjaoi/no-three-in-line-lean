import NoThreeLine.ShortStarTupleGeometry

/-! The actual four cross-label specified relations are sufficient to
separate the root, leaves, and witnesses of a short-star tuple. This is
static geometry; no selected-point or occupancy implication is asserted. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.ShortStars
open PrimitiveLines GridLines AuxiliaryODE MixedConnection BirthWitness

def starRootLine {n : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (s : ↥(shortStars Γ p H)) : LineIndex n := by
  classical
  refine ⟨lineThrough p s.val.1,Finset.mem_biUnion.mpr ⟨p,Finset.mem_univ _,?_⟩⟩
  exact lineThrough_mem_linesThrough p s.val.1
    ((mem_shortStars Γ p H s.val.1 s.val.2).mp s.property).1.symm

theorem starRootLine_nonspecified {n : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (s : ↥(shortStars Γ p H)) : ¬specified Γ (starRootLine s) :=
  nonspecified_actual_line Γ p H s.val.1 s.val.2
    ((mem_shortStars Γ p H s.val.1 s.val.2).mp s.property) (starRootLine s) rfl

theorem star_labels_separated {n : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (s : ↥(shortStars Γ p H)) : SeparatedLabels Γ (insert p (labelSet s.val)) := by
  apply separatedLabels_of_subset_nonspecified_line Γ _ (starRootLine s) (starRootLine_nonspecified s)
  intro x hx
  rcases Finset.mem_insert.mp hx with he|hx
  · subst x
    exact left_mem_lineThrough p s.val.1
  · exact label_on_root_line s x hx

theorem specifiedOverlap_of_labels {n : ℕ} (Γ : Finset ZPoint)
    (s t : Grid n×Grid n) (x y : Grid n) (hx : x∈labelSet s) (hy : y∈labelSet t)
    (hxy : x≠y) (hpair : specifiedPair Γ x y) : SpecifiedOverlap Γ s t := by
  simp only [labelSet,Finset.mem_insert,Finset.mem_singleton] at hx hy
  rcases hx with rfl|rfl <;> rcases hy with rfl|rfl
  · exact Or.inl (Or.inl ⟨hxy,hpair⟩)
  · exact Or.inl (Or.inr ⟨hxy,hpair⟩)
  · exact Or.inr (Or.inl ⟨hxy,hpair⟩)
  · exact Or.inr (Or.inr ⟨hxy,hpair⟩)

def NoSpecifiedCrossPairs {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) : Prop :=
  ∀i j : Fin m,i≠j → ¬SpecifiedOverlap Γ (f i).val (f j).val

theorem separatedLabels_tuple {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (hN : NoSpecifiedCrossPairs f) :
    SeparatedLabels Γ (insert p (leafLabels f∪witnessLabels f)) := by
  intro x hx y hy hxy hpair
  rcases Finset.mem_insert.mp hx with hxp|hx
  · subst x
    rcases Finset.mem_insert.mp hy with hyp|hy
    · exact hxy hyp.symm
    · obtain ⟨i,hi⟩ := (mem_label_union_iff f y).mp hy
      exact star_labels_separated (f i) p (Finset.mem_insert_self _ _) y
        (Finset.mem_insert_of_mem hi) hxy hpair
  · obtain ⟨i,hi⟩ := (mem_label_union_iff f x).mp hx
    rcases Finset.mem_insert.mp hy with hyp|hy
    · subst y
      exact star_labels_separated (f i) x (Finset.mem_insert_of_mem hi) p
        (Finset.mem_insert_self _ _) hxy hpair
    · obtain ⟨j,hj⟩ := (mem_label_union_iff f y).mp hy
      by_cases hij : i=j
      · subst j
        exact star_labels_separated (f i) x (Finset.mem_insert_of_mem hi) y
          (Finset.mem_insert_of_mem hj) hxy hpair
      · exact hN i j hij (specifiedOverlap_of_labels Γ (f i).val (f j).val x y hi hj hxy hpair)

theorem separatedLabels_leaves {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (hN : NoSpecifiedCrossPairs f) :
    SeparatedLabels Γ (insert p (leafLabels f)) := by
  have hs : insert p (leafLabels f)⊆insert p (leafLabels f∪witnessLabels f) := by
    exact Finset.insert_subset_insert p (Finset.subset_union_left)
  intro x hx y hy hxy
  exact separatedLabels_tuple f hN x (hs hx) y (hs hy) hxy

theorem tuple_connectionProduct {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (hD : RootLinePairwise f) (hN : NoSpecifiedCrossPairs f)
    (e : ExtendedState n) (hE : EmptyLineCredit e) (hEmpty : LeafPairEmpty e (leafLabels f)) :
    connectionProduct Γ (insert p (leafLabels f)) e =
      ∏q : leafLabels f,e.lineCredits (rootLeafLine p (leafLabels f)
        (fun hp => root_not_mem_labels f (Finset.mem_union_left _ hp)) q) :=
  connectionProduct_root_lines Γ p (leafLabels f)
    (fun hp => root_not_mem_labels f (Finset.mem_union_left _ hp))
    (leafLabels_distinct_root_lines f hD) (separatedLabels_leaves f hN) e hE hEmpty

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.separatedLabels_tuple
#print axioms NoThreeLine.ShortStars.tuple_connectionProduct
