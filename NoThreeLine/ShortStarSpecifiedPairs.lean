import NoThreeLine.ShortStarCounts
import NoThreeLine.OffLineDirection
import NoThreeLine.WitnessLabelSeparation

/-! C18(i): actual ordered star pairs with any distinct cross-label pair on
a specified direction. Four relations are retained; finite unions overcount
only when estimating their cardinality. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.ShortStars
open PrimitiveLines GridLines BirthWitness OffLineDivisors

def SpecifiedOverlap {n : ℕ} (Γ : Finset ZPoint) (s t : Grid n×Grid n) : Prop :=
  (specifiedDistinctPair Γ s.1 t.1 ∨ specifiedDistinctPair Γ s.1 t.2) ∨
    (specifiedDistinctPair Γ s.2 t.1 ∨ specifiedDistinctPair Γ s.2 t.2)

def specifiedPartners {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) (s : Grid n×Grid n) :
    Finset (Grid n×Grid n) := by
  classical
  exact (shortStars Γ p H).filter (SpecifiedOverlap Γ s)

def specifiedPairs {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) :
    Finset ((Grid n×Grid n)×(Grid n×Grid n)) := by
  classical
  exact ((shortStars Γ p H).product (shortStars Γ p H)).filter (fun st => SpecifiedOverlap Γ st.1 st.2)

def directionTouches {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) (x : Grid n) :
    Finset (Grid n×Grid n) := by
  classical
  exact (Γ.filter (fun d => d≠(0,0))).biUnion (fun d => touching Γ p H (directionLine x d))

private theorem related_mem_directionTouches {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (x : Grid n) (t : Grid n×Grid n) (ht : t∈shortStars Γ p H)
    (hrel : specifiedDistinctPair Γ x t.1 ∨ specifiedDistinctPair Γ x t.2) :
    t∈directionTouches Γ p H x := by
  classical
  rcases hrel with hrel | hrel
  · obtain ⟨d,hd,hd0,hdt⟩ := (specifiedPair_iff_directionLine Γ x t.1).mp hrel.2
    apply Finset.mem_biUnion.mpr
    refine ⟨d,Finset.mem_filter.mpr ⟨hd,hd0⟩,?_⟩
    exact Finset.mem_union_left _ (Finset.mem_filter.mpr ⟨ht,hdt⟩)
  · obtain ⟨d,hd,hd0,hdt⟩ := (specifiedPair_iff_directionLine Γ x t.2).mp hrel.2
    apply Finset.mem_biUnion.mpr
    refine ⟨d,Finset.mem_filter.mpr ⟨hd,hd0⟩,?_⟩
    exact Finset.mem_union_right _ (Finset.mem_filter.mpr ⟨ht,hdt⟩)

theorem specifiedPartners_subset_cover {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (s : Grid n×Grid n) :
    specifiedPartners Γ p H s⊆directionTouches Γ p H s.1∪directionTouches Γ p H s.2 := by
  classical
  intro t ht
  obtain ⟨ht,hrel⟩ := Finset.mem_filter.mp ht
  rcases hrel with hrel | hrel
  · exact Finset.mem_union_left _ (related_mem_directionTouches Γ p H s.1 t ht hrel)
  · exact Finset.mem_union_right _ (related_mem_directionTouches Γ p H s.2 t ht hrel)

private theorem directionTouches_card_le {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (x : Grid n) (hx : ¬specifiedPair Γ p x) (ξ C : ℝ) (hC : 0<C)
    (hbound : ∀(a : Grid n)(v : ZPoint),det v (gridEmbed p-gridEmbed a)≠0 →
      (∑q∈directionLine a v,((lineThrough p q).card : ℝ))≤C*(n : ℝ)^(1+ξ)) :
    ((directionTouches Γ p H x).card : ℝ)≤(Γ.card : ℝ)*(2*C*(n : ℝ)^(1+ξ)) := by
  classical
  have hpoint (d : ZPoint) (hd : d∈Γ.filter (fun d => d≠(0,0))) :
      ((touching Γ p H (directionLine x d)).card : ℝ)≤2*C*(n : ℝ)^(1+ξ) := by
    have hout : det d (gridEmbed p-gridEmbed x)≠0 := by
      intro he
      apply hx
      apply (BirthLineGroups.specifiedPair_swap Γ x p).mp
      exact (specifiedPair_iff_directionLine Γ x p).mpr
        ⟨d,(Finset.mem_filter.mp hd).1,(Finset.mem_filter.mp hd).2,(mem_gridLinePoints _ _ _).mpr he⟩
    exact (touching_card_le_twice_line_sum Γ p H (directionLine x d)).trans
      ((mul_le_mul_of_nonneg_left (hbound x d hout) (by norm_num)).trans_eq (by ring))
  have hc : ((Γ.filter (fun d => d≠(0,0))).card : ℝ)≤Γ.card := by exact_mod_cast Finset.card_filter_le Γ _
  calc
    _ ≤ ∑d∈Γ.filter (fun d => d≠(0,0)),((touching Γ p H (directionLine x d)).card : ℝ) := by
      exact_mod_cast (Finset.card_biUnion_le (s := Γ.filter (fun d => d≠(0,0)))
        (t := fun d => touching Γ p H (directionLine x d)))
    _ ≤ ∑d∈Γ.filter (fun d => d≠(0,0)),2*C*(n : ℝ)^(1+ξ) := Finset.sum_le_sum hpoint
    _ = ((Γ.filter (fun d => d≠(0,0))).card : ℝ)*(2*C*(n : ℝ)^(1+ξ)) := by
      simp only [Finset.sum_const,nsmul_eq_mul]
    _ ≤ _ := mul_le_mul_of_nonneg_right hc (by positivity)

theorem specifiedPartners_card_le_const_rpow (ξ : ℝ) (hξ : 0<ξ) :
    ∃C : ℝ,0<C ∧ ∀(n : ℕ)(Γ : Finset ZPoint)(p : Grid n)(H : ℝ)(s : Grid n×Grid n),
      s∈shortStars Γ p H → ((specifiedPartners Γ p H s).card : ℝ)≤
        C*(Γ.card : ℝ)*(n : ℝ)^(1+ξ) := by
  classical
  obtain ⟨C,hC,hbound⟩ := off_directionLine_sum_le_const_rpow ξ hξ
  refine ⟨4*C,by positivity,?_⟩
  intro n Γ p H s hs
  have hv := (mem_shortStars Γ p H s.1 s.2).mp hs
  have hq := directionTouches_card_le Γ p H s.1 hv.2.2.2.2.1 ξ C hC
    (fun a v h => hbound n a p v h)
  have hz := directionTouches_card_le Γ p H s.2 (Valid.swap Γ p H s.1 s.2 hv).2.2.2.2.1 ξ C hC
    (fun a v h => hbound n a p v h)
  have hc : ((specifiedPartners Γ p H s).card : ℝ)≤
      ((directionTouches Γ p H s.1).card : ℝ)+((directionTouches Γ p H s.2).card : ℝ) := by
    exact_mod_cast (Finset.card_le_card (specifiedPartners_subset_cover Γ p H s)).trans
      (Finset.card_union_le _ _)
  calc
    _ ≤ (Γ.card : ℝ)*(2*C*(n : ℝ)^(1+ξ))+(Γ.card : ℝ)*(2*C*(n : ℝ)^(1+ξ)) := hc.trans (add_le_add hq hz)
    _ = _ := by ring

theorem specifiedPairs_card_eq_sum {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) :
    ((specifiedPairs Γ p H).card : ℝ)=∑s∈shortStars Γ p H,((specifiedPartners Γ p H s).card : ℝ) := by
  classical
  calc
    _ = ∑st∈(shortStars Γ p H).product (shortStars Γ p H),
        if SpecifiedOverlap Γ st.1 st.2 then (1 : ℝ) else 0 := by simp [specifiedPairs]
    _ = ∑s∈shortStars Γ p H,∑t∈shortStars Γ p H,
        if SpecifiedOverlap Γ s t then (1 : ℝ) else 0 := Finset.sum_product _ _ _
    _ = _ := by
      apply Finset.sum_congr rfl
      intro s _
      rw [←Finset.sum_filter]
      simp only [specifiedPartners,Finset.sum_const,nsmul_eq_mul,mul_one]

theorem specifiedPairs_card_le_const_rpow (ξ : ℝ) (hξ : 0<ξ) :
    ∃C : ℝ,0<C ∧ ∀(n : ℕ)(Γ : Finset ZPoint)(p : Grid n)(H : ℝ),
      ((specifiedPairs Γ p H).card : ℝ)≤
        ((shortStars Γ p H).card : ℝ)*(C*(Γ.card : ℝ)*(n : ℝ)^(1+ξ)) := by
  obtain ⟨C,hC,hbound⟩ := specifiedPartners_card_le_const_rpow ξ hξ
  refine ⟨C,hC,?_⟩
  intro n Γ p H
  rw [specifiedPairs_card_eq_sum]
  exact (Finset.sum_le_sum (fun s hs => hbound n Γ p H s hs)).trans_eq
    (by simp only [Finset.sum_const,nsmul_eq_mul])

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.specifiedPartners_card_le_const_rpow
#print axioms NoThreeLine.ShortStars.specifiedPairs_card_le_const_rpow
