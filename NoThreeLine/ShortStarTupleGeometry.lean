import NoThreeLine.ShortStarSpecifiedPairs
import NoThreeLine.RootLineConnection

/-! Actual label sets of a finite short-star tuple with pairwise different
root lines. Both coordinate maps are injective and all 2m labels are distinct. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.ShortStars
open PrimitiveLines GridLines MixedConnection

def labelSet {n : ℕ} (s : Grid n×Grid n) : Finset (Grid n) := {s.1,s.2}

def leafLabels {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) : Finset (Grid n) := Finset.univ.image (fun i => (f i).val.1)

def witnessLabels {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) : Finset (Grid n) := Finset.univ.image (fun i => (f i).val.2)

def RootLinePairwise {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) : Prop :=
  ∀i j : Fin m,i≠j→lineThrough p (f i).val.1≠lineThrough p (f j).val.1

theorem label_ne_root {n : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (s : ↥(shortStars Γ p H)) (x : Grid n) (hx : x∈labelSet s.val) : x≠p := by
  have hs := (mem_shortStars Γ p H s.val.1 s.val.2).mp s.property
  rcases Finset.mem_insert.mp hx with he|he
  · exact he ▸ hs.1
  · exact (Finset.mem_singleton.mp he) ▸ hs.2.1

theorem label_on_root_line {n : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (s : ↥(shortStars Γ p H)) (x : Grid n) (hx : x∈labelSet s.val) : x∈lineThrough p s.val.1 := by
  rcases Finset.mem_insert.mp hx with he|he
  · exact he ▸ right_mem_lineThrough p s.val.1
  · exact (Finset.mem_singleton.mp he) ▸ ((mem_shortStars Γ p H s.val.1 s.val.2).mp s.property).2.2.2.1

theorem labels_disjoint_of_root_lines {n : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (s t : ↥(shortStars Γ p H)) (hline : lineThrough p s.val.1≠lineThrough p t.val.1) :
    Disjoint (labelSet s.val) (labelSet t.val) := by
  apply Finset.disjoint_left.mpr
  intro x hx hy
  have hs := (mem_shortStars Γ p H s.val.1 s.val.2).mp s.property
  have ht := (mem_shortStars Γ p H t.val.1 t.val.2).mp t.property
  exact label_ne_root s x hx (distinct_lines_intersect_only_root p _ _
    (lineThrough_mem_linesThrough p s.val.1 hs.1.symm)
    (lineThrough_mem_linesThrough p t.val.1 ht.1.symm) hline x
    (label_on_root_line s x hx) (label_on_root_line t x hy))

theorem leaf_injective {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (hD : RootLinePairwise f) :
    Function.Injective (fun i => (f i).val.1) := by
  intro i j he
  by_contra hij
  exact hD i j hij (congrArg (lineThrough p) he)

theorem witness_injective {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (hD : RootLinePairwise f) :
    Function.Injective (fun i => (f i).val.2) := by
  intro i j he
  change (f i).val.2=(f j).val.2 at he
  by_contra hij
  apply Finset.disjoint_left.mp (labels_disjoint_of_root_lines (f i) (f j) (hD i j hij))
    (show (f i).val.2∈labelSet (f i).val by simp [labelSet])
  rw [he]
  simp [labelSet]

theorem leaf_witness_disjoint {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (hD : RootLinePairwise f) :
    Disjoint (leafLabels f) (witnessLabels f) := by
  apply Finset.disjoint_left.mpr
  intro x hx hy
  obtain ⟨i,_,hi⟩ := Finset.mem_image.mp hx
  obtain ⟨j,_,hj⟩ := Finset.mem_image.mp hy
  by_cases hij : i=j
  · subst j
    exact ((mem_shortStars Γ p H (f i).val.1 (f i).val.2).mp (f i).property).2.2.1 (hi.trans hj.symm)
  · have hxi : x∈labelSet (f i).val := by rw [←hi]; simp [labelSet]
    have hxj : x∈labelSet (f j).val := by rw [←hj]; simp [labelSet]
    exact Finset.disjoint_left.mp (labels_disjoint_of_root_lines (f i) (f j) (hD i j hij)) hxi hxj

theorem root_not_mem_labels {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) : p∉leafLabels f∪witnessLabels f := by
  intro h
  rcases Finset.mem_union.mp h with h|h
  · obtain ⟨i,_,he⟩ := Finset.mem_image.mp h
    exact ((mem_shortStars Γ p H (f i).val.1 (f i).val.2).mp (f i).property).1 he
  · obtain ⟨i,_,he⟩ := Finset.mem_image.mp h
    exact ((mem_shortStars Γ p H (f i).val.1 (f i).val.2).mp (f i).property).2.1 he

theorem leafLabels_card {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (hD : RootLinePairwise f) : (leafLabels f).card=m := by
  rw [leafLabels,Finset.card_image_of_injective _ (leaf_injective f hD)]
  simp

theorem witnessLabels_card {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (hD : RootLinePairwise f) : (witnessLabels f).card=m := by
  rw [witnessLabels,Finset.card_image_of_injective _ (witness_injective f hD)]
  simp

theorem label_union_card {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (hD : RootLinePairwise f) :
    (leafLabels f∪witnessLabels f).card=2*m := by
  rw [Finset.card_union_of_disjoint (leaf_witness_disjoint f hD),leafLabels_card f hD,witnessLabels_card f hD]
  omega

theorem leafLabels_distinct_root_lines {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (hD : RootLinePairwise f) : DistinctRootLines p (leafLabels f) := by
  intro q hq r hr hqr
  obtain ⟨i,_,rfl⟩ := Finset.mem_image.mp hq
  obtain ⟨j,_,rfl⟩ := Finset.mem_image.mp hr
  exact hD i j (fun he => hqr (congrArg (fun k => (f k).val.1) he))

theorem mem_label_union_iff {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (x : Grid n) :
    x∈leafLabels f∪witnessLabels f ↔ ∃i : Fin m,x∈labelSet (f i).val := by
  simp only [leafLabels,witnessLabels,Finset.mem_union,Finset.mem_image,Finset.mem_univ,true_and,
    labelSet,Finset.mem_insert,Finset.mem_singleton]
  constructor
  · rintro (⟨i,hi⟩|⟨i,hi⟩)
    · exact ⟨i,Or.inl hi.symm⟩
    · exact ⟨i,Or.inr hi.symm⟩
  · rintro ⟨i,hi|hi⟩
    · exact Or.inl ⟨i,hi.symm⟩
    · exact Or.inr ⟨i,hi.symm⟩

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.label_union_card
#print axioms NoThreeLine.ShortStars.leafLabels_distinct_root_lines
