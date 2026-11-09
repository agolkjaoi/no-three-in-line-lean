import NoThreeLine.PairHHGeometry

/-! One new selected witness attached to a specified root line. The
off-baseline condition supplies the G3 outside-line hypothesis internally.
The candidate set is fixed independently of the stochastic state. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.PairWitness
open PrimitiveLines GridLines AuxiliaryODE OffLineDivisors LineDrift MixedConnection

def lineWitnessExtensions {n : ℕ} (a b : Grid n) (L : LineIndex n) :
    Finset (Σ _q : Grid n, Grid n) :=
  (L.val.filter (fun q=>orientedArea a b q≠0)).sigma (fun q=>lineThrough b q)

theorem extension_other_root_outside {n : ℕ} (a b q : Grid n) (L : LineIndex n)
    (ha : a∈L.val) (hq : q∈L.val) (h : orientedArea a b q≠0) : b∉L.val := by
  intro hb
  have he := boardLine_eq L a b ha hb (offBaseline_distinct a b q h).1
  exact h ((mem_lineThrough a b q).mp (he ▸ hq))

theorem lineWitnessExtensions_card_le_const_rpow (ξ : ℝ) (hξ : 0<ξ) :
    ∃ C : ℝ, 0<C ∧ ∀ (n : ℕ) (a b : Grid n) (L : LineIndex n), a∈L.val →
      ((lineWitnessExtensions a b L).card : ℝ)≤C*(n : ℝ)^(1+ξ) := by
  obtain ⟨C,hC,hbound⟩ := off_boardLine_sum_le_const_rpow ξ hξ
  refine ⟨C,hC,?_⟩
  intro n a b L ha
  by_cases h : (lineWitnessExtensions a b L).Nonempty
  · obtain ⟨⟨q,w⟩,hq⟩ := h
    have hm := Finset.mem_filter.mp (Finset.mem_sigma.mp hq).1
    have hb := extension_other_root_outside a b q L ha hm.1 hm.2
    calc
      _ = ∑ q∈L.val.filter (fun q=>orientedArea a b q≠0), ((lineThrough b q).card : ℝ) := by
        rw [lineWitnessExtensions,Finset.card_sigma,Nat.cast_sum]
      _ ≤ ∑ q∈L.val, ((lineThrough b q).card : ℝ) :=
        Finset.sum_le_sum_of_subset_of_nonneg (Finset.filter_subset _ _) (fun _ _ _=>Nat.cast_nonneg _)
      _ ≤ _ := hbound n b L hb
  · rw [Finset.not_nonempty_iff_eq_empty.mp h]
    simp only [Finset.card_empty,Nat.cast_zero]
    exact mul_nonneg hC.le (Real.rpow_nonneg (Nat.cast_nonneg n) _)

def specifiedWitnessExtensions {n : ℕ} (Γ : Finset ZPoint) (a b : Grid n) :
    Finset (Σ _q : Grid n, Grid n) :=
  (rootSpecifiedLines Γ a).biUnion (lineWitnessExtensions a b)

theorem specifiedWitnessExtensions_card_le_const_rpow (ξ : ℝ) (hξ : 0<ξ) :
    ∃ C : ℝ, 0<C ∧ ∀ (n : ℕ) (Γ : Finset ZPoint) (a b : Grid n),
      ((specifiedWitnessExtensions Γ a b).card : ℝ)≤(Γ.card : ℝ)*C*(n : ℝ)^(1+ξ) := by
  obtain ⟨C,hC,hbound⟩ := lineWitnessExtensions_card_le_const_rpow ξ hξ
  refine ⟨C,hC,?_⟩
  intro n Γ a b
  calc
    _ ≤ ∑ L∈rootSpecifiedLines Γ a, ((lineWitnessExtensions a b L).card : ℝ) := by
      exact_mod_cast (Finset.card_biUnion_le (s:=rootSpecifiedLines Γ a)
        (t:=lineWitnessExtensions a b))
    _ ≤ ∑ _L∈rootSpecifiedLines Γ a, C*(n : ℝ)^(1+ξ) :=
      Finset.sum_le_sum (fun L hL=>hbound n a b L (Finset.mem_filter.mp hL).2.1)
    _ = ((rootSpecifiedLines Γ a).card : ℝ)*(C*(n : ℝ)^(1+ξ)) := by
      simp only [Finset.sum_const,nsmul_eq_mul]
    _ ≤ (Γ.card : ℝ)*(C*(n : ℝ)^(1+ξ)) :=
      mul_le_mul_of_nonneg_right (Nat.cast_le.mpr (rootSpecifiedLines_card_le Γ a)) (by positivity)
    _ = _ := by ring

theorem specified_and_witness_mem_extension {n : ℕ} (Γ : Finset ZPoint)
    (a b q w : Grid n) (h : orientedArea a b q≠0) (hA : specifiedPair Γ a q)
    (hw : w∈lineThrough b q) :
    (⟨q,w⟩ : Σ _q : Grid n, Grid n)∈specifiedWitnessExtensions Γ a b := by
  have hd := offBaseline_distinct a b q h
  let L := boardLineThrough a q hd.2.1
  have ha : a∈L.val := left_mem_lineThrough a q
  have hL : L∈rootSpecifiedLines Γ a := Finset.mem_filter.mpr ⟨Finset.mem_univ _,ha,
    (specified_iff_designated Γ a L ha).mpr ((designated_iff Γ a q hd.2.1).mpr hA)⟩
  exact Finset.mem_biUnion.mpr ⟨L,hL,Finset.mem_sigma.mpr
    ⟨Finset.mem_filter.mpr ⟨right_mem_lineThrough a q,h⟩,hw⟩⟩

theorem commonChange_HL_candidate {n : ℕ} (s : ProcessState n) (hs : s.Valid)
    (Γ : Finset ZPoint) (a b q : Grid n)
    (ha : (s.accounts a).status=.active) (hb : (s.accounts b).status=.active)
    (hq : (s.accounts q).status=.active) (hc : commonChange Γ s.selected a b q)
    (hA : specifiedPair Γ a q) (hB : ¬specifiedPair Γ b q) :
    ∃ w∈s.selected, (⟨q,w⟩ : Σ _q : Grid n, Grid n)∈specifiedWitnessExtensions Γ a b ∧
      w≠a ∧ w≠b ∧ w≠q := by
  have hh := (commonChange_classification s hs Γ a b q ha hb hq).mp hc
  obtain ⟨w,hw,hwb⟩ := hh.2.2.resolve_left hB
  exact ⟨w,hw,specified_and_witness_mem_extension Γ a b q w hh.1 hA
    ((mem_lineThrough b q w).mpr hwb),selected_ne_active s hs w a hw ha,
    selected_ne_active s hs w b hw hb,selected_ne_active s hs w q hw hq⟩

end NoThreeLine.PairWitness

#print axioms NoThreeLine.PairWitness.specifiedWitnessExtensions_card_le_const_rpow
#print axioms NoThreeLine.PairWitness.commonChange_HL_candidate
