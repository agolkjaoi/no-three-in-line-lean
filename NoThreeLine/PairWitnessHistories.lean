import NoThreeLine.PairEdgeGeometry

/-! All finite mixed witness histories, with exact distinct-label unions.
This is a fixed finite set, independent of the stochastic state. Actual
cause tuples lift to it with their cause order and selected labels intact. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.PairWitness
open PrimitiveLines GridLines AuxiliaryODE

def historyLabels {n : ℕ} : List (Edge n) → Finset (Grid n)
  | [] => ∅
  | e::l => e.labels∪historyLabels l

def histories {n : ℕ} (Γ : Finset ZPoint) (a b : Grid n) : ℕ → Finset (List (Edge n))
  | 0 => {[]}
  | m+1 => (edges Γ a b).biUnion (fun e=>(histories Γ a b m).image (List.cons e))

theorem mem_histories {n : ℕ} (Γ : Finset ZPoint) (a b : Grid n) (m : ℕ)
    (l : List (Edge n)) : l∈histories Γ a b m ↔ l.length=m ∧ ∀e∈l,e∈edges Γ a b := by
  induction m generalizing l with
  | zero => cases l <;> simp [histories]
  | succ m ih =>
      cases l with
      | nil => simp [histories]
      | cons e l =>
          simp only [histories,Finset.mem_biUnion,Finset.mem_image,List.cons.injEq,List.length_cons]
          constructor
          · rintro ⟨e',he',l',hl',hee,hll⟩
            subst e'
            subst l'
            have hm := (ih l).mp hl'
            refine ⟨by omega,?_⟩
            intro x hx
            rcases List.mem_cons.mp hx with hxe|hxl
            · simpa only [hxe] using he'
            · exact hm.2 x hxl
          · rintro ⟨hlen,hall⟩
            refine ⟨e,hall e List.mem_cons_self,l,(ih l).mpr ?_,rfl,rfl⟩
            exact ⟨by omega,fun x hx=>hall x (List.mem_cons_of_mem _ hx)⟩

theorem historyLabels_card_le {n : ℕ} (l : List (Edge n)) :
    (historyLabels l).card≤2*l.length := by
  induction l with
  | nil => simp [historyLabels]
  | cons e l ih =>
      have hu := Finset.card_union_le e.labels (historyLabels l)
      have he := edge_labels_card_le_two e
      change (e.labels∪historyLabels l).card≤2*(e::l).length
      simp only [List.length_cons]
      omega

theorem historyLabels_exclude_roots {n : ℕ} (Γ : Finset ZPoint) (a b : Grid n)
    (m : ℕ) (l : List (Edge n)) (hl : l∈histories Γ a b m) :
    a∉historyLabels l ∧ b∉historyLabels l := by
  have hall := (mem_histories Γ a b m l).mp hl |>.2
  clear hl
  induction l with
  | nil => simp [historyLabels]
  | cons e l ih =>
      have he := edge_labels_exclude_roots_cause Γ a b e (hall e List.mem_cons_self)
      have ht := ih (fun x hx=>hall x (List.mem_cons_of_mem _ hx))
      simpa only [historyLabels,Finset.mem_union,not_or] using
        (show (a∉e.labels ∧ a∉historyLabels l) ∧ (b∉e.labels ∧ b∉historyLabels l) from
          ⟨⟨he.1,ht.1⟩,⟨he.2.1,ht.2⟩⟩)

theorem history_sum_succ {n : ℕ} (Γ : Finset ZPoint) (a b : Grid n) (m : ℕ)
    (f : List (Edge n)→ℝ) :
    (∑ l∈histories Γ a b (m+1),f l)=
      ∑ e∈edges Γ a b, ∑ l∈histories Γ a b m,f (e::l) := by
  rw [histories,Finset.sum_biUnion]
  · apply Finset.sum_congr rfl
    intro e he
    exact Finset.sum_image (fun l _ k _ h=>List.cons_injective h)
  · intro e he e' he' hne
    apply Finset.disjoint_left.mpr
    intro l hl hl'
    obtain ⟨s,hs,hes⟩ := Finset.mem_image.mp hl
    obtain ⟨t,ht,het⟩ := Finset.mem_image.mp hl'
    exact hne (List.cons.inj (hes.trans het.symm)).1

theorem history_new_labels_card {n : ℕ} (e : Edge n) (l : List (Edge n))
    (U : Finset (Grid n)) :
    (historyLabels (e::l)\U).card=(e.labels\U).card+
      (historyLabels l\(U∪e.labels)).card := by
  have he : historyLabels (e::l)\U=(e.labels\U)∪(historyLabels l\(U∪e.labels)) := by
    ext x
    simp only [historyLabels,Finset.mem_sdiff,Finset.mem_union]
    tauto
  rw [he,Finset.card_union_of_disjoint]
  apply Finset.disjoint_left.mpr
  intro x hx hy
  exact (Finset.mem_sdiff.mp hy).2 (Finset.mem_union_right _ (Finset.mem_sdiff.mp hx).1)

theorem actual_cause_tuple_history {n m : ℕ} (s : ProcessState n) (hs : s.Valid)
    (Γ : Finset ZPoint) (a b : Grid n) (f : Fin m→Grid n)
    (ha : (s.accounts a).status=.active) (hb : (s.accounts b).status=.active)
    (hf : ∀i,(s.accounts (f i)).status=.active ∧ commonChange Γ s.selected a b (f i)) :
    ∃ l∈histories Γ a b m, l.map Edge.cause=List.ofFn f ∧ historyLabels l⊆s.selected := by
  classical
  have hex (i : Fin m) := actual_commonChange_edge s hs Γ a b (f i) ha hb (hf i).1 (hf i).2
  choose g hg hcause hselected using hex
  refine ⟨List.ofFn g,(mem_histories Γ a b m _).mpr ?_,?_,?_⟩
  · refine ⟨List.length_ofFn,?_⟩
    intro e he
    obtain ⟨i,rfl⟩ := List.mem_ofFn.mp he
    exact hg i
  · rw [List.map_ofFn]
    congr 1
    funext i
    exact hcause i
  · have hlist : ∀e∈List.ofFn g,e.labels⊆s.selected := by
      intro e he
      obtain ⟨i,rfl⟩ := List.mem_ofFn.mp he
      exact hselected i
    generalize List.ofFn g=l at hlist ⊢
    induction l with
    | nil => exact Finset.empty_subset _
    | cons e l ih =>
        exact Finset.union_subset (hlist e List.mem_cons_self)
          (ih (fun x hx=>hlist x (List.mem_cons_of_mem _ hx)))

end NoThreeLine.PairWitness

#print axioms NoThreeLine.PairWitness.history_sum_succ
#print axioms NoThreeLine.PairWitness.history_new_labels_card
#print axioms NoThreeLine.PairWitness.actual_cause_tuple_history
