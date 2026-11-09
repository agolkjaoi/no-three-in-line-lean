import NoThreeLine.RectangleUnion

/-! A finite union indexed with repetitions can be reindexed into a common
separated cell family.  Taking the finite image removes repetitions, so its
field coefficients are 0 or 1 even on symmetry diagonals. -/
set_option autoImplicit false
noncomputable section
namespace NoThreeLine

theorem rectangleUnionMask_image {ι κ : Type*} [DecidableEq κ]
    (T : Finset ι) (f : ι → κ) (R : κ → Rect) (V H : Finset ℝ) :
    rectangleUnionMask T (fun i => R (f i)) V H =
      rectangleUnionMask (T.image f) R V H := by
  have he : closedRectangleUnion T (fun i => R (f i)) =
      closedRectangleUnion (T.image f) R := by
    ext z
    simp [closedRectangleUnion]
  unfold rectangleUnionMask
  rw [he]

theorem rectangleField_subset_indicator {ι : Type*} [DecidableEq ι]
    (A S : Finset ι) (R : ι → Rect) (hAS : A ⊆ S) :
    rectangleField A R (fun _ => 1) =
      rectangleField S R (fun i => if i ∈ A then 1 else 0) := by
  classical
  funext x y
  calc
    rectangleField A R (fun _ => 1) x y =
        rectangleField A R (fun i => if i ∈ A then 1 else 0) x y := by
      unfold rectangleField
      apply Finset.sum_congr rfl
      intro i hi
      simp only [if_pos hi]
    _ = rectangleField S R (fun i => if i ∈ A then 1 else 0) x y := by
      unfold rectangleField
      apply Finset.sum_subset hAS
      intro i _ hi
      simp [Rect.field, hi]

theorem mappedUnionMask_eq_commonField {ι κ : Type*} [DecidableEq κ]
    (T : Finset ι) (S : Finset κ) (f : ι → κ) (R : κ → Rect)
    (V H : Finset ℝ) (hf : T.image f ⊆ S)
    (hb : ∀ i ∈ S, (R i).EndpointsOn V H) (hsep : RectanglesSeparated S R) :
    rectangleUnionMask T (fun i => R (f i)) V H =
      eraseGrid V H (rectangleField S R (fun i => if i ∈ T.image f then 1 else 0)) := by
  rw [rectangleUnionMask_image]
  have hsep' : RectanglesSeparated (T.image f) R := by
    intro i hi j hj hij
    exact hsep i (hf hi) j (hf hj) hij
  rw [rectangleUnionMask_eq_field (T.image f) R V H (fun i hi => hb i (hf hi)) hsep']
  rw [rectangleField_subset_indicator (T.image f) S R hf]

end NoThreeLine

#print axioms NoThreeLine.mappedUnionMask_eq_commonField
