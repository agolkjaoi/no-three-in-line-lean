import NoThreeLine.ShortStarDistinctClassification

/-! Realized repeated-root-line tuples have actual witness image size j<m.
The complete repeated part is covered by its actual image-card pair (a,j). -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.ShortStars
open PrimitiveLines BirthWitness FiniteTuplePattern

def repeatedTuples {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) (m : ℕ) :
    Finset (Fin m→↥(shortStars Γ p H)) := by
  classical
  exact Finset.univ.filter (fun f=>¬RootLinePairwise f)

def repeatIndices (m : ℕ) : Finset (ℕ×ℕ) :=
  ((Finset.range (m+1)).product (Finset.range m)).filter (fun aj=>aj.2≤aj.1)

theorem realized_repeated_witness_card_lt {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (s : ProcessState n) (hs : TupleRealized f s)
    (hnot : ¬RootLinePairwise f) : (witnessLabels f).card<m := by
  classical
  have hle := (realized_distinct_label_counts f s hs).1.trans (realized_distinct_label_counts f s hs).2
  by_contra hlt
  have he : (witnessLabels f).card=m := Nat.le_antisymm hle (Nat.le_of_not_lt hlt)
  have hcard : (Finset.univ.image (fun i : Fin m=>(f i).val.2)).card=(Finset.univ : Finset (Fin m)).card := by
    simpa only [witnessLabels,Finset.card_univ,Fintype.card_fin] using he
  have hi := Finset.injOn_of_card_image_eq hcard
  apply hnot
  apply (rootLinePairwise_iff_witness_injective f s hs).mpr
  intro i j hij
  exact hi (Finset.mem_univ i) (Finset.mem_univ j) hij

theorem repeated_mem_indices_of_nonzero {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (s : WitnessState n) (hs : s.augmented.physical.process.Valid)
    (hf : f∈repeatedTuples Γ p H m) (hz : tuplePhysicalProduct f s≠0) :
    ((leafLabels f).card,(witnessLabels f).card)∈repeatIndices m := by
  classical
  have hr := tuplePhysicalProduct_ne_zero_realized f s hs hz
  have hc := realized_distinct_label_counts f s.augmented.physical.process hr
  have hlt := realized_repeated_witness_card_lt f s.augmented.physical.process hr (Finset.mem_filter.mp hf).2
  exact Finset.mem_filter.mpr ⟨Finset.mem_product.mpr
    ⟨Finset.mem_range.mpr (Nat.lt_succ_of_le hc.2),Finset.mem_range.mpr hlt⟩,hc.1⟩

theorem repeated_tuple_le_count_cover {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (hf : f∈repeatedTuples Γ p H m)
    (s : WitnessState n) (B : ℝ) (hB : 0≤B) (hs : s.Valid B) :
    tuplePhysicalProduct f s≤∑aj∈repeatIndices m,
      if f∈countTuples Γ p H m aj.1 aj.2 then tuplePhysicalProduct f s else 0 := by
  classical
  have hnon (aj : ℕ×ℕ) : 0≤(if f∈countTuples Γ p H m aj.1 aj.2 then tuplePhysicalProduct f s else 0) := by
    split_ifs
    · exact (tuplePhysicalProduct_bounds f s B hB hs).1
    · exact le_rfl
  by_cases hz : tuplePhysicalProduct f s=0
  · simp only [hz,ite_self,Finset.sum_const_zero,le_refl]
  have hi := repeated_mem_indices_of_nonzero f s hs.1.1.1 hf hz
  have hm : f∈countTuples Γ p H m (leafLabels f).card (witnessLabels f).card :=
    Finset.mem_filter.mpr ⟨Finset.mem_univ _,rfl,rfl⟩
  have hh := Finset.single_le_sum (fun aj _=>hnon aj) hi
  simpa only [if_pos hm] using hh

attribute [local irreducible] tuplePhysicalProduct repeatedTuples countTuples repeatIndices

theorem sum_repeated_le_counts {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) (m : ℕ)
    (s : WitnessState n) (B : ℝ) (hB : 0≤B) (hs : s.Valid B) :
    (∑f∈repeatedTuples Γ p H m,tuplePhysicalProduct f s)≤
      ∑aj∈repeatIndices m,∑f∈countTuples Γ p H m aj.1 aj.2,tuplePhysicalProduct f s := by
  classical
  calc
    _ ≤ ∑f∈repeatedTuples Γ p H m,∑aj∈repeatIndices m,
        if f∈countTuples Γ p H m aj.1 aj.2 then tuplePhysicalProduct f s else 0 :=
      Finset.sum_le_sum (fun f hf=>repeated_tuple_le_count_cover f hf s B hB hs)
    _ = ∑aj∈repeatIndices m,∑f∈repeatedTuples Γ p H m,
        if f∈countTuples Γ p H m aj.1 aj.2 then tuplePhysicalProduct f s else 0 := Finset.sum_comm
    _ ≤ _ := by
      apply Finset.sum_le_sum
      intro aj _
      have he := sum_ite_eq_of_mem_iff (Finset.univ : Finset (Fin m→↥(shortStars Γ p H)))
        (countTuples Γ p H m aj.1 aj.2) (fun f=>f∈countTuples Γ p H m aj.1 aj.2)
        (fun f=>tuplePhysicalProduct f s) (fun f=>by simp only [Finset.mem_univ,true_and])
      rw [←he]
      apply Finset.sum_le_sum_of_subset_of_nonneg (Finset.subset_univ _)
      intro f _ _
      split_ifs
      · exact (tuplePhysicalProduct_bounds f s B hB hs).1
      · exact le_rfl

theorem sum_all_eq_distinct_add_repeated {n : ℕ} (Γ : Finset ZPoint) (p : Grid n)
    (H : ℝ) (m : ℕ) (s : WitnessState n) :
    (∑f : Fin m→↥(shortStars Γ p H),tuplePhysicalProduct f s)=
      (∑f∈rootDistinctTuples Γ p H m,tuplePhysicalProduct f s)+
      (∑f∈repeatedTuples Γ p H m,tuplePhysicalProduct f s) := by
  classical
  unfold rootDistinctTuples repeatedTuples
  exact (Finset.sum_filter_add_sum_filter_not Finset.univ RootLinePairwise
    (fun f=>tuplePhysicalProduct f s)).symm

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.realized_repeated_witness_card_lt
#print axioms NoThreeLine.ShortStars.sum_repeated_le_counts
