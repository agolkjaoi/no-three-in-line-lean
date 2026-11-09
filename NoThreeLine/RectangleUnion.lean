import NoThreeLine.RectangleArea
import NoThreeLine.FieldCap
import NoThreeLine.RectangleExpr

/-! Finite closed-box unions, their interior masks after common-boundary erasure,
and a finite normalization witness into disjoint open rectangles. -/
set_option autoImplicit false
open Set MeasureTheory
open scoped BigOperators
noncomputable section
namespace NoThreeLine

def Rect.closedSet (R : Rect) : Set (ℝ × ℝ) := Icc R.x0 R.x1 ×ˢ Icc R.y0 R.y1

def closedRectangleUnion {ι : Type*} (S : Finset ι) (R : ι → Rect) : Set (ℝ × ℝ) :=
  {z | ∃ i ∈ S, z ∈ (R i).closedSet}

def rectangleUnionMask {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (V H : Finset ℝ) (x y : ℝ) : ℝ := by
  classical
  exact eraseGrid V H (fun x y => if (x,y) ∈ interior (closedRectangleUnion S R) then 1 else 0) x y

def Rect.EndpointsOn (R : Rect) (V H : Finset ℝ) : Prop :=
  R.x0 ∈ V ∧ R.x1 ∈ V ∧ R.y0 ∈ H ∧ R.y1 ∈ H

theorem Rect.closed_mem_iff_contains_off_boundary (R : Rect) (V H : Finset ℝ)
    (hb : R.EndpointsOn V H) (x y : ℝ) (hx : x ∉ V) (hy : y ∉ H) :
    (x,y) ∈ R.closedSet ↔ R.contains x y := by
  have hx0 : x ≠ R.x0 := fun he => hx (he ▸ hb.1)
  have hx1 : x ≠ R.x1 := fun he => hx (he ▸ hb.2.1)
  have hy0 : y ≠ R.y0 := fun he => hy (he ▸ hb.2.2.1)
  have hy1 : y ≠ R.y1 := fun he => hy (he ▸ hb.2.2.2)
  simp only [Rect.closedSet,mem_prod,mem_Icc,Rect.contains]
  constructor
  · rintro ⟨⟨ha,hb⟩,⟨hc,hd⟩⟩
    exact ⟨lt_of_le_of_ne ha hx0.symm,lt_of_le_of_ne hb hx1,
      lt_of_le_of_ne hc hy0.symm,lt_of_le_of_ne hd hy1⟩
  · rintro ⟨ha,hb,hc,hd⟩
    exact ⟨⟨ha.le,hb.le⟩,⟨hc.le,hd.le⟩⟩

theorem contains_mem_interior_union {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (i : ι) (hi : i ∈ S) (x y : ℝ) (hc : (R i).contains x y) :
    (x,y) ∈ interior (closedRectangleUnion S R) := by
  apply mem_interior.mpr
  refine ⟨Ioo (R i).x0 (R i).x1 ×ˢ Ioo (R i).y0 (R i).y1,?_,
    isOpen_Ioo.prod isOpen_Ioo,? _⟩
  · intro z hz
    exact ⟨i,hi,⟨⟨hz.1.1.le,hz.1.2.le⟩,⟨hz.2.1.le,hz.2.2.le⟩⟩⟩
  · exact ⟨⟨hc.1,hc.2.1⟩,⟨hc.2.2.1,hc.2.2.2⟩⟩

theorem interior_union_iff_contains_off_boundary {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (V H : Finset ℝ) (hb : ∀ i ∈ S, (R i).EndpointsOn V H)
    (x y : ℝ) (hx : x ∉ V) (hy : y ∉ H) :
    (x,y) ∈ interior (closedRectangleUnion S R) ↔ ∃ i ∈ S, (R i).contains x y := by
  constructor
  · intro hz
    obtain ⟨i,hi,hc⟩ := interior_subset hz
    exact ⟨i,hi,((R i).closed_mem_iff_contains_off_boundary V H (hb i hi) x y hx hy).mp hc⟩
  · rintro ⟨i,hi,hc⟩
    exact contains_mem_interior_union S R i hi x y hc

theorem rectangleUnionMask_eq_field {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (V H : Finset ℝ) (hb : ∀ i ∈ S, (R i).EndpointsOn V H)
    (hsep : RectanglesSeparated S R) :
    rectangleUnionMask S R V H = eraseGrid V H (rectangleField S R (fun _ => 1)) := by
  classical
  funext x y
  unfold rectangleUnionMask eraseGrid
  by_cases hbd : x ∈ V ∨ y ∈ H
  · simp [hbd]
  · simp only [hbd,ite_false]
    have hx : x ∉ V := fun h => hbd (Or.inl h)
    have hy : y ∉ H := fun h => hbd (Or.inr h)
    rw [interior_union_iff_contains_off_boundary S R V H hb x y hx hy]
    by_cases hc : ∃ i ∈ S, (R i).contains x y
    · obtain ⟨i,hi,hcell⟩ := hc
      rw [if_pos ⟨i,hi,hcell⟩,rectangleField_eq_weight_of_contains S R _ x y hsep i hi hcell]
    · rw [if_neg hc,rectangleField_eq_zero_of_no_cell S R _ x y (by
        intro i hi hcell; exact hc ⟨i,hi,hcell⟩)]

end NoThreeLine

#print axioms NoThreeLine.rectangleUnionMask_eq_field
