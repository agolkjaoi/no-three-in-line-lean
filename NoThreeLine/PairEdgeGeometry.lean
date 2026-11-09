import NoThreeLine.PairInitialWitnesses
import NoThreeLine.PairSpecifiedExtensions
import NoThreeLine.PairKnownWitnesses

/-! A fixed finite evidence space for actual common-change causes. An edge
has zero, one or two selected witness labels. The labels may change sides
at later edges; no bipartite restriction or graph-count premise is imposed. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.PairWitness
open PrimitiveLines GridLines AuxiliaryODE

inductive Edge (n : ℕ) where
  | hh : Grid n → Edge n
  | hl : Grid n → Grid n → Edge n
  | lh : Grid n → Grid n → Edge n
  | ll : Grid n → Grid n → Grid n → Edge n
  deriving DecidableEq, Fintype

def Edge.cause {n : ℕ} : Edge n → Grid n
  | .hh q | .hl q _ | .lh q _ | .ll q _ _ => q

def Edge.labels {n : ℕ} : Edge n → Finset (Grid n)
  | .hh _ => ∅
  | .hl _ w => {w}
  | .lh _ z => {z}
  | .ll _ z w => {z,w}

def Edge.Allowed {n : ℕ} (Γ : Finset ZPoint) (a b : Grid n) : Edge n → Prop
  | .hh q => q∈hhCauses Γ a b
  | .hl q w => orientedArea a b q≠0 ∧ specifiedPair Γ a q ∧ w∈lineThrough b q ∧
      w≠a ∧ w≠b ∧ w≠q
  | .lh q z => orientedArea a b q≠0 ∧ specifiedPair Γ b q ∧ z∈lineThrough a q ∧
      z≠a ∧ z≠b ∧ z≠q
  | .ll q z w => (⟨q,(z,w)⟩ : Σ _q : Grid n, Grid n×Grid n)∈initialWitnessCandidates a b

def edges {n : ℕ} (Γ : Finset ZPoint) (a b : Grid n) : Finset (Edge n) := by
  classical
  exact Finset.univ.filter (Edge.Allowed Γ a b)

theorem mem_edges {n : ℕ} (Γ : Finset ZPoint) (a b : Grid n) (e : Edge n) :
    e∈edges Γ a b ↔ e.Allowed Γ a b := by
  classical
  simp [edges]

theorem edge_labels_card_le_two {n : ℕ} (e : Edge n) : e.labels.card≤2 := by
  cases e <;> simp only [Edge.labels,Finset.card_empty,Finset.card_singleton]
  · omega
  · omega
  · omega
  · exact (Finset.card_insert_le _ _).trans (by simp)

theorem edge_cause_off_baseline {n : ℕ} (Γ : Finset ZPoint) (a b : Grid n) (e : Edge n)
    (he : e∈edges Γ a b) : orientedArea a b e.cause≠0 := by
  have h := (mem_edges Γ a b e).mp he
  cases e with
  | hh q => exact (Finset.mem_filter.mp h).2.1
  | hl q w => exact h.1
  | lh q z => exact h.1
  | ll q z w => exact (Finset.mem_filter.mp (Finset.mem_sigma.mp h).1).2

theorem edge_labels_exclude_roots_cause {n : ℕ} (Γ : Finset ZPoint) (a b : Grid n)
    (e : Edge n) (he : e∈edges Γ a b) :
    a∉e.labels ∧ b∉e.labels ∧ e.cause∉e.labels := by
  have h := (mem_edges Γ a b e).mp he
  cases e with
  | hh q => simp [Edge.labels]
  | hl q w =>
      have hn := h.2.2.2
      simp only [Edge.labels,Edge.cause,Finset.mem_singleton]
      exact ⟨hn.1.symm,hn.2.1.symm,hn.2.2.symm⟩
  | lh q z =>
      have hn := h.2.2.2
      simp only [Edge.labels,Edge.cause,Finset.mem_singleton]
      exact ⟨hn.1.symm,hn.2.1.symm,hn.2.2.symm⟩
  | ll q z w =>
      have hn := (Finset.mem_filter.mp (Finset.mem_sigma.mp h).2).2
      simp only [Edge.labels,Edge.cause,Finset.mem_insert,Finset.mem_singleton,not_or]
      exact ⟨⟨hn.2.1.symm,hn.2.2.2.2.1.symm⟩,
        ⟨hn.2.2.1.symm,hn.2.2.2.2.2.1.symm⟩,
        ⟨hn.2.2.2.1.symm,hn.2.2.2.2.2.2.symm⟩⟩

/-- Every actual enabled cause admits finite evidence with only actual
selected witnesses. Specified sides need no selected witness price. -/
theorem actual_commonChange_edge {n : ℕ} (s : ProcessState n) (hs : s.Valid)
    (Γ : Finset ZPoint) (a b q : Grid n)
    (ha : (s.accounts a).status=.active) (hb : (s.accounts b).status=.active)
    (hq : (s.accounts q).status=.active) (hc : commonChange Γ s.selected a b q) :
    ∃ e∈edges Γ a b, e.cause=q ∧ e.labels⊆s.selected := by
  classical
  have hh := (commonChange_classification s hs Γ a b q ha hb hq).mp hc
  by_cases hA : specifiedPair Γ a q
  · by_cases hB : specifiedPair Γ b q
    · refine ⟨.hh q,(mem_edges Γ a b _).mpr ?_,rfl,?_⟩
      · exact Finset.mem_filter.mpr ⟨Finset.mem_univ _,hh.1,hA,hB⟩
      · exact Finset.empty_subset _
    · obtain ⟨w,hw,hwb⟩ := hh.2.2.resolve_left hB
      refine ⟨.hl q w,(mem_edges Γ a b _).mpr ?_,rfl,?_⟩
      · exact ⟨hh.1,hA,(mem_lineThrough b q w).mpr hwb,
          selected_ne_active s hs w a hw ha,selected_ne_active s hs w b hw hb,
          selected_ne_active s hs w q hw hq⟩
      · exact Finset.singleton_subset_iff.mpr hw
  · by_cases hB : specifiedPair Γ b q
    · obtain ⟨z,hz,hza⟩ := hh.2.1.resolve_left hA
      refine ⟨.lh q z,(mem_edges Γ a b _).mpr ?_,rfl,?_⟩
      · exact ⟨hh.1,hB,(mem_lineThrough a q z).mpr hza,
          selected_ne_active s hs z a hz ha,selected_ne_active s hs z b hz hb,
          selected_ne_active s hs z q hz hq⟩
      · exact Finset.singleton_subset_iff.mpr hz
    · obtain ⟨z,hz,w,hw,he⟩ := commonChange_LL_initial_candidate s hs Γ a b q ha hb hq hc hA hB
      refine ⟨.ll q z w,(mem_edges Γ a b _).mpr he,rfl,?_⟩
      exact Finset.insert_subset_iff.mpr ⟨hz,Finset.singleton_subset_iff.mpr hw⟩

end NoThreeLine.PairWitness

#print axioms NoThreeLine.PairWitness.edge_labels_exclude_roots_cause
#print axioms NoThreeLine.PairWitness.actual_commonChange_edge
