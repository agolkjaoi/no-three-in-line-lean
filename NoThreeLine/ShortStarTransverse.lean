import NoThreeLine.ShortStarCounts

/-! The connecting line of leaves on different root lines avoids the root
and both original witnesses. Third-witness incidence therefore admits G3. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.ShortStars
open PrimitiveLines GridLines OffLineDivisors

theorem distinct_root_lines_leaves_ne {n : ℕ} (p : Grid n) (s t : Grid n×Grid n)
    (hline : lineThrough p s.1≠lineThrough p t.1) : s.1≠t.1 := by
  intro he
  exact hline (congrArg (lineThrough p) he)

theorem leaf_line_avoids_root {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (s t : Grid n×Grid n) (hs : s∈shortStars Γ p H) (ht : t∈shortStars Γ p H)
    (hline : lineThrough p s.1≠lineThrough p t.1) : p∉lineThrough s.1 t.1 := by
  have hs' := (mem_shortStars Γ p H s.1 s.2).mp hs
  have ht' := (mem_shortStars Γ p H t.1 t.2).mp ht
  intro hp
  have hq : t.1∈lineThrough p s.1 := by
    apply (mem_lineThrough _ _ _).mpr
    rw [orientedArea_cycle p s.1 t.1]
    exact (mem_lineThrough _ _ _).mp hp
  exact hline (lineThrough_eq_of_mem p s.1 t.1 hs'.1.symm ht'.1.symm hq)

theorem first_witness_not_on_leaf_line {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (s t : Grid n×Grid n) (hs : s∈shortStars Γ p H) (ht : t∈shortStars Γ p H)
    (hline : lineThrough p s.1≠lineThrough p t.1) : s.2∉lineThrough s.1 t.1 := by
  have hs' := (mem_shortStars Γ p H s.1 s.2).mp hs
  have hst := distinct_root_lines_leaves_ne p s t hline
  have hout := leaf_line_avoids_root Γ p H s t hs ht hline
  have hdiff : lineThrough s.1 p≠lineThrough s.1 t.1 := by
    intro he
    apply hout
    rw [←he]
    exact right_mem_lineThrough s.1 p
  have hsz : s.2∈lineThrough s.1 p := by
    rw [BirthLineGroups.lineThrough_swap]
    exact hs'.2.2.2.1
  intro hz
  have he := distinct_lines_intersect_only_root s.1 _ _
    (lineThrough_mem_linesThrough s.1 p hs'.1)
    (lineThrough_mem_linesThrough s.1 t.1 hst) hdiff s.2 hsz hz
  exact hs'.2.2.1 he.symm

theorem second_witness_not_on_leaf_line {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (s t : Grid n×Grid n) (hs : s∈shortStars Γ p H) (ht : t∈shortStars Γ p H)
    (hline : lineThrough p s.1≠lineThrough p t.1) : t.2∉lineThrough s.1 t.1 := by
  rw [BirthLineGroups.lineThrough_swap s.1 t.1]
  exact first_witness_not_on_leaf_line Γ p H t s ht hs hline.symm

def thirdWitnessPartners {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (s t : Grid n×Grid n) : Finset (Grid n×Grid n) := witnessOn Γ p H (lineThrough s.1 t.1)

theorem thirdWitnessPartners_fresh {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (s t u : Grid n×Grid n) (hs : s∈shortStars Γ p H) (ht : t∈shortStars Γ p H)
    (hline : lineThrough p s.1≠lineThrough p t.1) (hu : u∈thirdWitnessPartners Γ p H s t) :
    u.2≠s.2 ∧ u.2≠t.2 ∧ u≠s ∧ u≠t := by
  have hz : u.2∈lineThrough s.1 t.1 := (Finset.mem_filter.mp hu).2
  have hsz : u.2≠s.2 := fun he => first_witness_not_on_leaf_line Γ p H s t hs ht hline (he ▸ hz)
  have htz : u.2≠t.2 := fun he => second_witness_not_on_leaf_line Γ p H s t hs ht hline (he ▸ hz)
  exact ⟨hsz,htz,(fun he => hsz (congrArg Prod.snd he)),(fun he => htz (congrArg Prod.snd he))⟩

theorem thirdWitnessPartners_card_le_const_rpow (ξ : ℝ) (hξ : 0<ξ) :
    ∃C : ℝ,0<C ∧ ∀(n : ℕ)(Γ : Finset ZPoint)(p : Grid n)(H : ℝ)(s t : Grid n×Grid n),
      s∈shortStars Γ p H → t∈shortStars Γ p H → lineThrough p s.1≠lineThrough p t.1 →
      ((thirdWitnessPartners Γ p H s t).card : ℝ)≤C*(n : ℝ)^(1+ξ) := by
  obtain ⟨C,hC,hbound⟩ := off_lineThrough_sum_le_const_rpow ξ hξ
  refine ⟨C,hC,?_⟩
  intro n Γ p H s t hs ht hline
  have hout : orientedArea s.1 t.1 p≠0 := by
    intro h
    exact leaf_line_avoids_root Γ p H s t hs ht hline ((mem_lineThrough _ _ _).mpr h)
  change ((witnessOn Γ p H (lineThrough s.1 t.1)).card : ℝ)≤_
  rw [witnessOn_card_eq_leafOn]
  exact (leafOn_card_le_line_sum Γ p H (lineThrough s.1 t.1)).trans (hbound n s.1 t.1 p hout)

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.leaf_line_avoids_root
#print axioms NoThreeLine.ShortStars.thirdWitnessPartners_fresh
#print axioms NoThreeLine.ShortStars.thirdWitnessPartners_card_le_const_rpow
