import NoThreeLine.PairEdgeGeometry
import NoThreeLine.PairWitnessExtensions

/-! Fixed finite covers classified by the number of witness labels that
have not yet appeared. They preserve actual root/cause geometry while
allowing upper-bound overlaps. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.PairWitness
open PrimitiveLines GridLines AuxiliaryODE

def oldEdgeCover {n : ℕ} (Γ : Finset ZPoint) (a b : Grid n) (U : Finset (Grid n)) :
    Finset (Edge n) :=
  (hhCauses Γ a b).image Edge.hh ∪
  ((U.biUnion (fun w=>(specifiedKnownCauses Γ a b w).image (fun q=>Edge.hl q w))) ∪
  ((U.biUnion (fun z=>(specifiedKnownCauses Γ b a z).image (fun q=>Edge.lh q z))) ∪
  (U.biUnion (fun z=>U.biUnion (fun w=>(knownWitnessCauses a b z w).image (fun q=>Edge.ll q z w))))))

def oneNewEdgeCover {n : ℕ} (Γ : Finset ZPoint) (a b : Grid n) (U : Finset (Grid n)) :
    Finset (Edge n) :=
  (specifiedWitnessExtensions Γ a b).image (fun x=>Edge.hl x.1 x.2) ∪
  ((specifiedWitnessExtensions Γ b a).image (fun x=>Edge.lh x.1 x.2) ∪
  ((U.biUnion (fun z=>(witnessExtensions a b z).image (fun x=>Edge.ll x.1 z x.2))) ∪
  (U.biUnion (fun w=>(witnessExtensions b a w).image (fun x=>Edge.ll x.1 x.2 w)))))

def twoNewEdgeCover {n : ℕ} (a b : Grid n) : Finset (Edge n) :=
  (initialWitnessCandidates a b).image (fun x=>Edge.ll x.1 x.2.1 x.2.2)

def newEdges {n : ℕ} (Γ : Finset ZPoint) (a b : Grid n) (U : Finset (Grid n)) (j : ℕ) :
    Finset (Edge n) := (edges Γ a b).filter (fun e=>(e.labels\U).card=j)

theorem newEdges_index_le_two {n : ℕ} (Γ : Finset ZPoint) (a b : Grid n)
    (U : Finset (Grid n)) (j : ℕ) (e : Edge n) (he : e∈newEdges Γ a b U j) : j≤2 := by
  rw [←(Finset.mem_filter.mp he).2]
  exact (Finset.card_le_card (Finset.sdiff_subset)).trans (edge_labels_card_le_two e)

theorem newEdges_zero_subset {n : ℕ} (Γ : Finset ZPoint) (a b : Grid n) (U : Finset (Grid n)) :
    newEdges Γ a b U 0⊆oldEdgeCover Γ a b U := by
  intro e he
  have h := (mem_edges Γ a b e).mp (Finset.mem_filter.mp he).1
  have hsub : e.labels⊆U := Finset.sdiff_eq_empty_iff_subset.mp
    (Finset.card_eq_zero.mp (Finset.mem_filter.mp he).2)
  simp only [oldEdgeCover,Finset.mem_union]
  cases e with
  | hh q => exact Or.inl (Finset.mem_image.mpr ⟨q,h,rfl⟩)
  | hl q w =>
      right; left
      have hw : w∈U := hsub (Finset.mem_singleton_self w)
      exact Finset.mem_biUnion.mpr ⟨w,hw,Finset.mem_image.mpr
        ⟨q,Finset.mem_filter.mpr ⟨Finset.mem_univ _,h.1,h.2.1,h.2.2.1⟩,rfl⟩⟩
  | lh q z =>
      right; right; left
      have hz : z∈U := hsub (Finset.mem_singleton_self z)
      have hswap : orientedArea b a q≠0 := by rw [orientedArea_swap_first]; exact neg_ne_zero.mpr h.1
      exact Finset.mem_biUnion.mpr ⟨z,hz,Finset.mem_image.mpr
        ⟨q,Finset.mem_filter.mpr ⟨Finset.mem_univ _,hswap,h.2.1,h.2.2.1⟩,rfl⟩⟩
  | ll q z w =>
      right; right; right
      have hz : z∈U := hsub (Finset.mem_insert_self _ _)
      have hw : w∈U := hsub (Finset.mem_insert_of_mem (Finset.mem_singleton_self w))
      have hm := Finset.mem_sigma.mp h
      have hp := (Finset.mem_product.mp (Finset.mem_filter.mp hm.2).1)
      exact Finset.mem_biUnion.mpr ⟨z,hz,Finset.mem_biUnion.mpr ⟨w,hw,
        Finset.mem_image.mpr ⟨q,Finset.mem_filter.mpr
          ⟨Finset.mem_univ _,(Finset.mem_filter.mp hm.1).2,hp.1,hp.2⟩,rfl⟩⟩⟩

theorem newEdges_one_subset {n : ℕ} (Γ : Finset ZPoint) (a b : Grid n) (U : Finset (Grid n)) :
    newEdges Γ a b U 1⊆oneNewEdgeCover Γ a b U := by
  classical
  intro e he
  have h := (mem_edges Γ a b e).mp (Finset.mem_filter.mp he).1
  have hc := (Finset.mem_filter.mp he).2
  simp only [oneNewEdgeCover,Finset.mem_union]
  cases e with
  | hh q => simp [Edge.labels] at hc
  | hl q w =>
      left
      exact Finset.mem_image.mpr ⟨⟨q,w⟩,
        specified_and_witness_mem_extension Γ a b q w h.1 h.2.1 h.2.2.1,rfl⟩
  | lh q z =>
      right; left
      have hswap : orientedArea b a q≠0 := by rw [orientedArea_swap_first]; exact neg_ne_zero.mpr h.1
      exact Finset.mem_image.mpr ⟨⟨q,z⟩,
        specified_and_witness_mem_extension Γ b a q z hswap h.2.1 h.2.2.1,rfl⟩
  | ll q z w =>
      have hm := Finset.mem_sigma.mp h
      have harea := (Finset.mem_filter.mp hm.1).2
      have hlabels := Finset.mem_filter.mp hm.2
      have hp := Finset.mem_product.mp hlabels.1
      by_cases hz : z∈U
      · right; right; left
        exact Finset.mem_biUnion.mpr ⟨z,hz,Finset.mem_image.mpr ⟨⟨q,w⟩,
          actual_two_witness_mem_extension a b q z w hlabels.2.2.1.symm harea hp.1 hp.2,rfl⟩⟩
      · have hw : w∈U := by
          by_contra hw
          have heq : (Edge.ll q z w).labels\U=({z,w} : Finset (Grid n)) := by
            ext x
            simp only [Edge.labels,Finset.mem_sdiff,Finset.mem_insert,Finset.mem_singleton]
            constructor
            · exact fun hx=>hx.1
            · rintro (rfl|rfl) <;> simp [hz,hw]
          rw [heq,Finset.card_pair hlabels.2.1] at hc
          omega
        right; right; right
        have hswap : orientedArea b a q≠0 := by rw [orientedArea_swap_first]; exact neg_ne_zero.mpr harea
        exact Finset.mem_biUnion.mpr ⟨w,hw,Finset.mem_image.mpr ⟨⟨q,z⟩,
          actual_two_witness_mem_extension b a q w z hlabels.2.2.2.2.2.2.1.symm hswap hp.2 hp.1,rfl⟩⟩

theorem newEdges_two_subset {n : ℕ} (Γ : Finset ZPoint) (a b : Grid n) (U : Finset (Grid n)) :
    newEdges Γ a b U 2⊆twoNewEdgeCover a b := by
  intro e he
  have h := (mem_edges Γ a b e).mp (Finset.mem_filter.mp he).1
  have hc := (Finset.mem_filter.mp he).2
  cases e with
  | hh q => simp [Edge.labels] at hc
  | hl q w =>
      have hb : ((Edge.hl q w).labels\U).card≤1 :=
        (Finset.card_le_card Finset.sdiff_subset).trans_eq (Finset.card_singleton w)
      omega
  | lh q z =>
      have hb : ((Edge.lh q z).labels\U).card≤1 :=
        (Finset.card_le_card Finset.sdiff_subset).trans_eq (Finset.card_singleton z)
      omega
  | ll q z w => exact Finset.mem_image.mpr ⟨⟨q,(z,w)⟩,h,rfl⟩

end NoThreeLine.PairWitness

#print axioms NoThreeLine.PairWitness.newEdges_zero_subset
#print axioms NoThreeLine.PairWitness.newEdges_one_subset
#print axioms NoThreeLine.PairWitness.newEdges_two_subset
