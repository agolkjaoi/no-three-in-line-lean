import NoThreeLine.ShortStarGeometry
import NoThreeLine.OffLineSubpower

/-! Short-star incidence on an actual board line avoiding the root.
Either ordered label may meet that line; overlaps only enlarge the bound. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.OffLineDivisors
open PrimitiveLines GridLines AuxiliaryODE MixedConnection

theorem off_boardLine_sum_le_const_rpow (ξ : ℝ) (hξ : 0<ξ) :
    ∃C : ℝ,0<C ∧ ∀(n : ℕ)(p : Grid n)(L : LineIndex n),p∉L.val →
      (∑q∈L.val,((lineThrough p q).card : ℝ))≤C*(n : ℝ)^(1+ξ) := by
  obtain ⟨C,hC,hbound⟩ := off_lineThrough_sum_le_const_rpow ξ hξ
  refine ⟨C,hC,?_⟩
  intro n p L hp
  obtain ⟨a,ha,_⟩ := boardLine_has_other L p
  obtain ⟨b,hb,hab⟩ := boardLine_has_other L a
  have he := boardLine_eq L a b ha hb hab
  have hout : orientedArea a b p≠0 := by
    intro h
    apply hp
    rw [he]
    exact (mem_lineThrough a b p).mpr h
  rw [he]
  exact hbound n a b p hout

end NoThreeLine.OffLineDivisors

namespace NoThreeLine.ShortStars
open PrimitiveLines GridLines AuxiliaryODE OffLineDivisors

def leafOn {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) (A : Finset (Grid n)) :
    Finset (Grid n×Grid n) := by
  classical
  exact (shortStars Γ p H).filter (fun s => s.1∈A)

def witnessOn {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) (A : Finset (Grid n)) :
    Finset (Grid n×Grid n) := by
  classical
  exact (shortStars Γ p H).filter (fun s => s.2∈A)

def touching {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) (A : Finset (Grid n)) :
    Finset (Grid n×Grid n) := leafOn Γ p H A∪witnessOn Γ p H A

theorem leafOn_card_eq_sum {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) (A : Finset (Grid n)) :
    ((leafOn Γ p H A).card : ℝ)=∑q∈A,((witnesses Γ p H q).card : ℝ) := by
  classical
  calc
    _ = ∑s∈shortStars Γ p H,if s.1∈A then (1 : ℝ) else 0 := by
      simp [leafOn]
    _ = ∑q : Grid n,∑z∈witnesses Γ p H q,if q∈A then (1 : ℝ) else 0 :=
      sum_shortStars Γ p H (fun q _ => if q∈A then 1 else 0)
    _ = _ := by
      simp only [Finset.sum_const,nsmul_eq_mul,mul_ite,mul_one,mul_zero]
      rw [←Finset.sum_filter]
      simp

theorem leafOn_card_le_line_sum {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) (A : Finset (Grid n)) :
    ((leafOn Γ p H A).card : ℝ)≤∑q∈A,((lineThrough p q).card : ℝ) := by
  rw [leafOn_card_eq_sum]
  exact Finset.sum_le_sum (fun q _ => by exact_mod_cast witnesses_card_le_line Γ p H q)

theorem witnessOn_card_eq_leafOn {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) (A : Finset (Grid n)) :
    (witnessOn Γ p H A).card=(leafOn Γ p H A).card := by
  classical
  have he : (leafOn Γ p H A).image Prod.swap=witnessOn Γ p H A := by
    ext s
    constructor
    · rintro hs
      obtain ⟨t,ht,rfl⟩ := Finset.mem_image.mp hs
      obtain ⟨ht,hA⟩ := Finset.mem_filter.mp ht
      apply Finset.mem_filter.mpr
      exact ⟨(mem_shortStars Γ p H t.2 t.1).mpr
        (Valid.swap Γ p H t.1 t.2 ((mem_shortStars Γ p H t.1 t.2).mp ht)),hA⟩
    · intro hs
      obtain ⟨hs,hA⟩ := Finset.mem_filter.mp hs
      apply Finset.mem_image.mpr
      refine ⟨s.swap,Finset.mem_filter.mpr ⟨?_,hA⟩,by simp⟩
      exact (mem_shortStars Γ p H s.2 s.1).mpr
        (Valid.swap Γ p H s.1 s.2 ((mem_shortStars Γ p H s.1 s.2).mp hs))
  rw [←he]
  apply Finset.card_image_of_injective
  intro s t h
  exact Prod.swap_injective h

theorem touching_card_le_twice_line_sum {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (A : Finset (Grid n)) :
    ((touching Γ p H A).card : ℝ)≤2*∑q∈A,((lineThrough p q).card : ℝ) := by
  have hc : ((touching Γ p H A).card : ℝ)≤
      ((leafOn Γ p H A).card : ℝ)+((witnessOn Γ p H A).card : ℝ) := by
    exact_mod_cast Finset.card_union_le (leafOn Γ p H A) (witnessOn Γ p H A)
  rw [witnessOn_card_eq_leafOn] at hc
  have hl := leafOn_card_le_line_sum Γ p H A
  linarith

theorem off_line_touching_card_le_const_rpow (ξ : ℝ) (hξ : 0<ξ) :
    ∃C : ℝ,0<C ∧ ∀(n : ℕ)(Γ : Finset ZPoint)(p : Grid n)(H : ℝ)(L : LineIndex n),
      p∉L.val → ((touching Γ p H L.val).card : ℝ)≤C*(n : ℝ)^(1+ξ) := by
  obtain ⟨C,hC,hbound⟩ := off_boardLine_sum_le_const_rpow ξ hξ
  refine ⟨2*C,by positivity,?_⟩
  intro n Γ p H L hp
  calc
    _ ≤ 2*∑q∈L.val,((lineThrough p q).card : ℝ) := touching_card_le_twice_line_sum Γ p H L.val
    _ ≤ 2*(C*(n : ℝ)^(1+ξ)) := mul_le_mul_of_nonneg_left (hbound n p L hp) (by norm_num)
    _ = _ := by ring

end NoThreeLine.ShortStars

#print axioms NoThreeLine.OffLineDivisors.off_boardLine_sum_le_const_rpow
#print axioms NoThreeLine.ShortStars.witnessOn_card_eq_leafOn
#print axioms NoThreeLine.ShortStars.off_line_touching_card_le_const_rpow
