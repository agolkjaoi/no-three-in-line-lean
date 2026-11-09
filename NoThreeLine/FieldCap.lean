import NoThreeLine.Rectangle

/-! A uniform density/chord cap derived from explicit coordinate separation
of open cells. Overlap is not silently treated as a union. -/
set_option autoImplicit false
open Set MeasureTheory
open scoped BigOperators
noncomputable section

namespace NoThreeLine

def Rect.Separated (R Q : Rect) : Prop :=
  R.x1 ≤ Q.x0 ∨ Q.x1 ≤ R.x0 ∨ R.y1 ≤ Q.y0 ∨ Q.y1 ≤ R.y0

def Rect.InUnitSquare (R : Rect) : Prop :=
  0 ≤ R.x0 ∧ R.x0 ≤ R.x1 ∧ R.x1 ≤ 1 ∧
    0 ≤ R.y0 ∧ R.y0 ≤ R.y1 ∧ R.y1 ≤ 1

def RectanglesSeparated {ι : Type*} (S : Finset ι) (R : ι → Rect) : Prop :=
  ∀ i ∈ S, ∀ j ∈ S, i ≠ j → (R i).Separated (R j)

theorem Rect.separated_not_both_contains (R Q : Rect) (x y : ℝ)
    (hsep : R.Separated Q) : ¬ (R.contains x y ∧ Q.contains x y) := by
  rintro ⟨hR,hQ⟩
  rcases hR with ⟨hx0,hx1,hy0,hy1⟩
  rcases hQ with ⟨hx0',hx1',hy0',hy1'⟩
  rcases hsep with h | h | h | h <;> linarith

/-- If one cell contains a point, separation kills every other summand. -/
theorem rectangleField_eq_weight_of_contains {ι : Type*} (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) (x y : ℝ) (hsep : RectanglesSeparated S R)
    (i : ι) (hi : i ∈ S) (hcell : (R i).contains x y) :
    rectangleField S R w x y = w i := by
  classical
  unfold rectangleField
  calc
    (∑ j ∈ S, (R j).field (w j) x y) = (R i).field (w i) x y := by
      apply Finset.sum_eq_single i
      · intro j hj hji
        have hnot : ¬ (R j).contains x y := fun hc =>
          (R j).separated_not_both_contains (R i) x y (hsep j hj i hi hji) ⟨hc,hcell⟩
        simp [Rect.field,hnot]
      · intro hni
        exact (hni hi).elim
    _ = w i := by simp [Rect.field,hcell]

theorem rectangleField_eq_zero_of_no_cell {ι : Type*} (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) (x y : ℝ)
    (hno : ∀ i ∈ S, ¬ (R i).contains x y) : rectangleField S R w x y = 0 := by
  apply Finset.sum_eq_zero
  intro i hi
  simp [Rect.field,hno i hi]

/-- C0 at the level of the actual additive field. `M >= 0` also handles an
empty cell set, when the individual weight conditions would be vacuous. -/
theorem rectangleField_point_bounds {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (w : ι → ℝ) (M x y : ℝ) (hM : 0 ≤ M)
    (hsep : RectanglesSeparated S R) (hw : ∀ i ∈ S, 0 ≤ w i ∧ w i ≤ M) :
    0 ≤ rectangleField S R w x y ∧ rectangleField S R w x y ≤ M := by
  classical
  by_cases hex : ∃ i ∈ S, (R i).contains x y
  · obtain ⟨i,hi,hcell⟩ := hex
    rw [rectangleField_eq_weight_of_contains S R w x y hsep i hi hcell]
    exact hw i hi
  · have hno : ∀ i ∈ S, ¬ (R i).contains x y := by
      intro i hi hc
      exact hex ⟨i,hi,hc⟩
    rw [rectangleField_eq_zero_of_no_cell S R w x y hno]
    exact ⟨le_refl 0,hM⟩

theorem Rect.contains_unit_x (R : Rect) (x y : ℝ) (hR : R.InUnitSquare)
    (hc : R.contains x y) : x ∈ Icc (0 : ℝ) 1 :=
  ⟨hR.1.trans hc.1.le, hc.2.1.le.trans hR.2.2.1⟩

theorem rectangleField_eq_zero_outside_unit_x {ι : Type*} (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) (x y : ℝ)
    (hR : ∀ i ∈ S, (R i).InUnitSquare) (hx : x ∉ Icc (0 : ℝ) 1) :
    rectangleField S R w x y = 0 := by
  apply rectangleField_eq_zero_of_no_cell
  intro i hi hc
  exact hx ((R i).contains_unit_x x y (hR i hi) hc)

theorem rectangleField_le_unit_indicator {ι : Type*} (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) (M x y : ℝ) (hM : 0 ≤ M)
    (hsep : RectanglesSeparated S R) (hw : ∀ i ∈ S, 0 ≤ w i ∧ w i ≤ M)
    (hR : ∀ i ∈ S, (R i).InUnitSquare) :
    rectangleField S R w x y ≤ (Icc (0 : ℝ) 1).indicator (fun _ => M) x := by
  classical
  by_cases hx : x ∈ Icc (0 : ℝ) 1
  · simpa only [Set.indicator_of_mem hx] using
      (rectangleField_point_bounds S R w M x y hM hsep hw).2
  · rw [rectangleField_eq_zero_outside_unit_x S R w x y hR hx,
      Set.indicator_of_notMem hx]

theorem rectangleField_line_integrable {ι : Type*} (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) (v u : ℝ) (hu : 0 < u) :
    Integrable (fun t : ℝ => rectangleField S R w t (v+u*t)) := by
  unfold rectangleField
  exact integrable_finsetSum S (fun i _ => (R i).field_on_line_integrable (w i) v u hu)

/-- C0: every nonaxis chord of the explicitly separated unit-square cells
has integral between zero and the maximum cell density. -/
theorem rectangleField_chord_bounds {ι : Type*} (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) (M v u : ℝ) (hM : 0 ≤ M)
    (hsep : RectanglesSeparated S R) (hw : ∀ i ∈ S, 0 ≤ w i ∧ w i ≤ M)
    (hR : ∀ i ∈ S, (R i).InUnitSquare) (hu : 0 < u) :
    0 ≤ (∫ t : ℝ, rectangleField S R w t (v+u*t)) ∧
      (∫ t : ℝ, rectangleField S R w t (v+u*t)) ≤ M := by
  constructor
  · exact integral_nonneg (fun t => (rectangleField_point_bounds S R w M t (v+u*t)
      hM hsep hw).1)
  · have hI : Integrable ((Icc (0 : ℝ) 1).indicator (fun _ : ℝ => M)) := by
      rw [integrable_indicator_iff measurableSet_Icc]
      exact integrableOn_const (by simp [Real.volume_Icc])
    have hi := integral_mono (rectangleField_line_integrable S R w v u hu) hI
      (fun t => rectangleField_le_unit_indicator S R w M t (v+u*t) hM hsep hw hR)
    simpa only [integral_indicator_const M measurableSet_Icc, Real.volume_real_Icc,
      sub_zero, max_eq_left (by norm_num : (0 : ℝ) ≤ 1), smul_eq_mul, one_mul] using hi

theorem erased_rectangleField_point_bounds {ι : Type*} (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) (M x y : ℝ) (hM : 0 ≤ M)
    (hsep : RectanglesSeparated S R) (hw : ∀ i ∈ S, 0 ≤ w i ∧ w i ≤ M)
    (vertical horizontal : Finset ℝ) :
    0 ≤ eraseGrid vertical horizontal (rectangleField S R w) x y ∧
      eraseGrid vertical horizontal (rectangleField S R w) x y ≤ M := by
  classical
  unfold eraseGrid
  split_ifs
  · exact ⟨le_refl 0,hM⟩
  · exact rectangleField_point_bounds S R w M x y hM hsep hw

/-- Additional common grid lines are erased exactly; the geometric chord
bound survives because the nonaxis line meets them at finitely many points. -/
theorem erased_rectangleField_chord_bounds {ι : Type*} (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) (M v u : ℝ) (hM : 0 ≤ M)
    (hsep : RectanglesSeparated S R) (hw : ∀ i ∈ S, 0 ≤ w i ∧ w i ≤ M)
    (hR : ∀ i ∈ S, (R i).InUnitSquare) (hu : 0 < u)
    (vertical horizontal : Finset ℝ) :
    0 ≤ (∫ t : ℝ, eraseGrid vertical horizontal (rectangleField S R w) t (v+u*t)) ∧
      (∫ t : ℝ, eraseGrid vertical horizontal (rectangleField S R w) t (v+u*t)) ≤ M := by
  simpa only [eraseGrid_chord_eq vertical horizontal (rectangleField S R w) v u hu] using
    rectangleField_chord_bounds S R w M v u hM hsep hw hR hu

end NoThreeLine

#print axioms NoThreeLine.rectangleField_point_bounds
#print axioms NoThreeLine.rectangleField_le_unit_indicator
#print axioms NoThreeLine.rectangleField_chord_bounds
#print axioms NoThreeLine.erased_rectangleField_chord_bounds
