import NoThreeLine.ShortStarTupleEmpty
import NoThreeLine.MixedCauseGeometry

/-! In an actual realized tuple, repeated root lines are exactly repeated
selected witnesses. Active-root safety is essential: an arbitrary geometric
tuple can have more distinct witnesses than distinct leaves. -/
set_option autoImplicit false
noncomputable section

namespace NoThreeLine.ShortStars
open PrimitiveLines GridLines AuxiliaryODE MixedConnection

theorem root_lines_eq_of_witness_eq {n : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (s t : ↥(shortStars Γ p H)) (hz : s.val.2=t.val.2) :
    lineThrough p s.val.1=lineThrough p t.val.1 := by
  have hs := (mem_shortStars Γ p H s.val.1 s.val.2).mp s.property
  have ht := (mem_shortStars Γ p H t.val.1 t.val.2).mp t.property
  rw [lineThrough_eq_of_mem p s.val.1 s.val.2 hs.1.symm hs.2.1.symm hs.2.2.2.1,
    lineThrough_eq_of_mem p t.val.1 t.val.2 ht.1.symm ht.2.1.symm ht.2.2.2.1,hz]

theorem selected_witness_eq_of_root_lines {n : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (s t : ↥(shortStars Γ p H)) (a : ProcessState n) (ha : a.Valid) (hp : p∈a.activeEvents)
    (hs : s.val.2∈a.selected) (ht : t.val.2∈a.selected)
    (hline : lineThrough p s.val.1=lineThrough p t.val.1) : s.val.2=t.val.2 := by
  have hN := active_line_occupancy_le_one a p ha hp (starRootLine s) (left_mem_lineThrough p s.val.1)
  apply Finset.card_le_one.mp hN
  · exact Finset.mem_inter.mpr ⟨hs,label_on_root_line s _ (by simp [labelSet])⟩
  · apply Finset.mem_inter.mpr
    refine ⟨ht,?_⟩
    change t.val.2∈lineThrough p s.val.1
    rw [hline]
    exact label_on_root_line t _ (by simp [labelSet])

theorem tuple_root_line_eq_iff_witness_eq {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (s : ProcessState n) (hs : TupleRealized f s) (i j : Fin m) :
    lineThrough p (f i).val.1=lineThrough p (f j).val.1 ↔ (f i).val.2=(f j).val.2 :=
  ⟨selected_witness_eq_of_root_lines (f i) (f j) s hs.1 hs.2.1 (hs.2.2.2 i) (hs.2.2.2 j),
    root_lines_eq_of_witness_eq (f i) (f j)⟩

theorem rootLinePairwise_iff_witness_injective {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (s : ProcessState n) (hs : TupleRealized f s) :
    RootLinePairwise f ↔ Function.Injective (fun i=>(f i).val.2) := by
  constructor
  · exact witness_injective f
  · intro hi i j hij hline
    exact hij (hi ((tuple_root_line_eq_iff_witness_eq f s hs i j).mp hline))

theorem not_rootLinePairwise_iff_witness_repeat {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (s : ProcessState n) (hs : TupleRealized f s) :
    ¬RootLinePairwise f ↔ ∃i j : Fin m,i≠j ∧ (f i).val.2=(f j).val.2 := by
  classical
  rw [rootLinePairwise_iff_witness_injective f s hs]
  simp only [Function.Injective,not_forall,_root_.not_imp]
  constructor
  · rintro ⟨i,j,he,hne⟩
    exact ⟨i,j,hne,he⟩
  · rintro ⟨i,j,hne,he⟩
    exact ⟨i,j,he,hne⟩

theorem same_root_line_distinct_witness_unrealizable {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (s : ProcessState n) (i j : Fin m)
    (hline : lineThrough p (f i).val.1=lineThrough p (f j).val.1)
    (hz : (f i).val.2≠(f j).val.2) : ¬TupleRealized f s :=
  fun hs=>hz ((tuple_root_line_eq_iff_witness_eq f s hs i j).mp hline)

theorem witness_eq_of_leaf_eq_realized {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (s : ProcessState n) (hs : TupleRealized f s)
    (i j : Fin m) (hq : (f i).val.1=(f j).val.1) : (f i).val.2=(f j).val.2 :=
  (tuple_root_line_eq_iff_witness_eq f s hs i j).mp (congrArg (lineThrough p) hq)

theorem witnessLabels_card_le_leafLabels_realized {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (s : ProcessState n) (hs : TupleRealized f s) :
    (witnessLabels f).card≤(leafLabels f).card := by
  classical
  have hex (z : witnessLabels f) : ∃i : Fin m,(f i).val.2=z.val := by
    obtain ⟨i,_,hi⟩ := Finset.mem_image.mp z.property
    exact ⟨i,hi⟩
  choose pick hpick using hex
  let g : witnessLabels f→leafLabels f := fun z=>
    ⟨(f (pick z)).val.1,Finset.mem_image.mpr ⟨pick z,Finset.mem_univ _,rfl⟩⟩
  have hg : Function.Injective g := by
    intro x y he
    have hq : (f (pick x)).val.1=(f (pick y)).val.1 := congrArg Subtype.val he
    apply Subtype.ext
    exact (hpick x).symm.trans ((witness_eq_of_leaf_eq_realized f s hs (pick x) (pick y) hq).trans (hpick y))
  simpa only [Fintype.card_coe] using Fintype.card_le_of_injective g hg

theorem leafLabels_card_le_tuple_length {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) : (leafLabels f).card≤m := by
  simpa only [leafLabels,Finset.card_univ,Fintype.card_fin] using
    (Finset.card_image_le (s:=Finset.univ) (f:=fun i : Fin m=>(f i).val.1))

theorem realized_distinct_label_counts {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (s : ProcessState n) (hs : TupleRealized f s) :
    (witnessLabels f).card≤(leafLabels f).card ∧ (leafLabels f).card≤m :=
  ⟨witnessLabels_card_le_leafLabels_realized f s hs,leafLabels_card_le_tuple_length f⟩

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.tuple_root_line_eq_iff_witness_eq
#print axioms NoThreeLine.ShortStars.not_rootLinePairwise_iff_witness_repeat
#print axioms NoThreeLine.ShortStars.realized_distinct_label_counts
