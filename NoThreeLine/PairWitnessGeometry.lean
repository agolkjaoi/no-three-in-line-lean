import NoThreeLine.VirtualWitnessGeometry
import NoThreeLine.BirthLineGroups

/-! Local C2 geometry for the actual common-change rate. Active causes are
classified by specified lines or old selected witnesses. Off the baseline,
the two selected witnesses differ and two fixed root lines determine at
most one cause. No graph-count or moment estimate is assumed. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.PairWitness
open AuxiliaryODE PrimitiveLines GridLines BirthLineGroups MixedConnection

theorem offBaseline_distinct {n : ℕ} (a b q : Grid n)
    (h : orientedArea a b q ≠ 0) : a≠b ∧ a≠q ∧ b≠q := by
  refine ⟨?_,?_,?_⟩ <;> intro he <;> subst_vars <;> apply h <;> simp [orientedArea] <;> ring

theorem actual_changed_iff {n : ℕ} (s : ProcessState n) (hs : s.Valid)
    (Γ : Finset ZPoint) (p q : Grid n) (hp : (s.accounts p).status=.active)
    (hq : (s.accounts q).status=.active) (hpq : p≠q) :
    birthMultiplier Γ s.selected p q < 1 ↔
      specifiedPair Γ p q ∨ selectedWitness s.selected p q := by
  have hd := geometric_death_after_birth_iff s.selected p q (hs.2.1 p hp) (hs.2.1 q hq).1 hpq
  by_cases hw : selectedWitness s.selected p q <;> by_cases hh : specifiedPair Γ p q <;>
    norm_num [birthMultiplier,hpq,hd,hw,hh]

theorem commonChange_classification {n : ℕ} (s : ProcessState n) (hs : s.Valid)
    (Γ : Finset ZPoint) (a b q : Grid n)
    (ha : (s.accounts a).status=.active) (hb : (s.accounts b).status=.active)
    (hq : (s.accounts q).status=.active) :
    commonChange Γ s.selected a b q ↔ orientedArea a b q≠0 ∧
      (specifiedPair Γ a q ∨ selectedWitness s.selected a q) ∧
      (specifiedPair Γ b q ∨ selectedWitness s.selected b q) := by
  by_cases h : orientedArea a b q=0
  · simp [commonChange,h]
  · have hh := offBaseline_distinct a b q h
    simp only [commonChange,actual_changed_iff s hs Γ a q ha hq hh.2.1,
      actual_changed_iff s hs Γ b q hb hq hh.2.2]

theorem offBaseline_root_lines_ne {n : ℕ} (a b q : Grid n)
    (h : orientedArea a b q≠0) : lineThrough q a≠lineThrough q b := by
  intro he
  have hb : b∈lineThrough q a := he ▸ right_mem_lineThrough q b
  exact h (by simpa only [orientedArea_cycle q a b] using (mem_lineThrough q a b).mp hb)

theorem two_selected_witnesses_ne {n : ℕ} (s : ProcessState n) (hs : s.Valid)
    (a b q z w : Grid n) (hq : (s.accounts q).status=.active)
    (habq : orientedArea a b q≠0) (hz : z∈s.selected) (hw : w∈s.selected)
    (hza : z∈lineThrough a q) (hwb : w∈lineThrough b q) : z≠w := by
  intro he
  have hh := offBaseline_distinct a b q habq
  have hqi := lineThrough_mem_linesThrough q a hh.2.1.symm
  have hqj := lineThrough_mem_linesThrough q b hh.2.2.symm
  have hzi : z∈lineThrough q a := lineThrough_swap a q ▸ hza
  have hzj : z∈lineThrough q b := he.symm ▸ (lineThrough_swap b q ▸ hwb)
  have hzq := distinct_lines_intersect_only_root q _ _ hqi hqj
    (offBaseline_root_lines_ne a b q habq) z hzi hzj
  exact (hs.2.1 q hq).1 (hzq ▸ hz)

theorem selected_ne_active {n : ℕ} (s : ProcessState n) (hs : s.Valid)
    (z p : Grid n) (hz : z∈s.selected) (hp : (s.accounts p).status=.active) : z≠p := by
  intro he
  exact (hs.2.1 p hp).1 (he ▸ hz)

def offBaselineIntersections {n : ℕ} (a b : Grid n) (L K : LineIndex n) : Finset (Grid n) :=
  (L.val∩K.val).filter (fun q => orientedArea a b q≠0)

theorem offBaselineIntersections_subsingleton {n : ℕ} (a b : Grid n)
    (L K : LineIndex n) (ha : a∈L.val) (hb : b∈K.val) :
    (offBaselineIntersections a b L K : Set (Grid n)).Subsingleton := by
  intro q hq r hr
  by_contra hqr
  have hq' := Finset.mem_filter.mp hq
  have hr' := Finset.mem_filter.mp hr
  have hL := boardLine_eq L q r (Finset.mem_inter.mp hq'.1).1 (Finset.mem_inter.mp hr'.1).1 hqr
  have hK := boardLine_eq K q r (Finset.mem_inter.mp hq'.1).2 (Finset.mem_inter.mp hr'.1).2 hqr
  have he : L.val=K.val := hL.trans hK.symm
  have hab := (offBaseline_distinct a b q hq'.2).1
  have hbase := boardLine_eq L a b ha (he ▸ hb) hab
  exact hq'.2 ((mem_lineThrough a b q).mp (hbase ▸ (Finset.mem_inter.mp hq'.1).1))

theorem offBaselineIntersections_card_le_one {n : ℕ} (a b : Grid n)
    (L K : LineIndex n) (ha : a∈L.val) (hb : b∈K.val) :
    (offBaselineIntersections a b L K).card≤1 :=
  Finset.card_le_one.mpr (offBaselineIntersections_subsingleton a b L K ha hb)

theorem commonChange_LL_witnesses {n : ℕ} (s : ProcessState n) (hs : s.Valid)
    (Γ : Finset ZPoint) (a b q : Grid n)
    (ha : (s.accounts a).status=.active) (hb : (s.accounts b).status=.active)
    (hq : (s.accounts q).status=.active) (hc : commonChange Γ s.selected a b q)
    (hA : ¬specifiedPair Γ a q) (hB : ¬specifiedPair Γ b q) :
    ∃ z∈s.selected, ∃ w∈s.selected, z∈lineThrough a q ∧ w∈lineThrough b q ∧ z≠w := by
  have hh := (commonChange_classification s hs Γ a b q ha hb hq).mp hc
  obtain ⟨z,hz,hza⟩ := hh.2.1.resolve_left hA
  obtain ⟨w,hw,hwb⟩ := hh.2.2.resolve_left hB
  have hz' := (mem_lineThrough a q z).mpr hza
  have hw' := (mem_lineThrough b q w).mpr hwb
  exact ⟨z,hz,w,hw,hz',hw',two_selected_witnesses_ne s hs a b q z w hq hh.1 hz hw hz' hw'⟩

end NoThreeLine.PairWitness

#print axioms NoThreeLine.PairWitness.commonChange_classification
#print axioms NoThreeLine.PairWitness.offBaselineIntersections_card_le_one
#print axioms NoThreeLine.PairWitness.commonChange_LL_witnesses
