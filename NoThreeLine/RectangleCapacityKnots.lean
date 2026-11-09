import NoThreeLine.FiniteHingeMaximum

/-! The actual non-axis positive-slope rectangle chord is controlled by
the finite corner-intercept values. Zero tails follow from the four-corner
cancellations, even with overlapping rectangles and signed weights. -/
set_option autoImplicit false
set_option maxHeartbeats 1800000
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine

def cornerIntercept {ι : Type*} (R : ι→Rect) (u : ℝ) (z : ι×Fin 4) : ℝ :=
  (cornerLocation R z).2-u*(cornerLocation R z).1

theorem cornerCoefficient_sum_zero {ι : Type*} (S : Finset ι) (w : ι→ℝ) (u : ℝ) :
    (∑z∈cornerIndex S,(1/u)*cornerCoefficient w z)=0 := by
  rw [cornerIndex,Finset.product_eq_sprod,Finset.sum_product]
  apply Finset.sum_eq_zero
  intro i _
  simp [cornerCoefficient,Rect.vertexSign,Fin.sum_univ_succ]
  <;> ring

theorem cornerCoefficient_intercept_sum_zero {ι : Type*} (S : Finset ι)
    (R : ι→Rect) (w : ι→ℝ) (u : ℝ) :
    (∑z∈cornerIndex S,((1/u)*cornerCoefficient w z)*cornerIntercept R u z)=0 := by
  rw [cornerIndex,Finset.product_eq_sprod,Finset.sum_product]
  apply Finset.sum_eq_zero
  intro i _
  simp [cornerCoefficient,cornerIntercept,cornerLocation,Rect.vertexSign,Rect.vertex,Fin.sum_univ_succ]
  <;> ring

theorem rectangleField_chord_eq_hinges {ι : Type*} (S : Finset ι)
    (R : ι→Rect) (w : ι→ℝ) (v u : ℝ)
    (hR : ∀i∈S,(R i).x0≤(R i).x1 ∧ (R i).y0≤(R i).y1) (hu : 0<u) :
    (∫t:ℝ,rectangleField S R w t (v+u*t)) =
      finiteHingeSum (cornerIndex S) (fun z=>(1/u)*cornerCoefficient w z) (cornerIntercept R u) v := by
  rw [rectangleField_chord_eq_vertexSum S R w v u hR hu,weighted_vertexSum_eq_corners]
  unfold finiteHingeSum
  rw [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro z _
  have he : v-(cornerLocation R z).2+u*(cornerLocation R z).1=v-cornerIntercept R u z := by
    unfold cornerIntercept
    ring
  rw [he]
  ring

theorem rectangleField_chord_le_corner_values {ι : Type*} (S : Finset ι)
    (R : ι→Rect) (w : ι→ℝ) (u U : ℝ)
    (hR : ∀i∈S,(R i).x0≤(R i).x1 ∧ (R i).y0≤(R i).y1) (hu : 0<u) (hU : 0≤U)
    (hcheck : ∀i∈S,∀k:Fin 4,
      (∫t:ℝ,rectangleField S R w t (((R i).vertex k).2-u*((R i).vertex k).1+u*t))≤U)
    (v : ℝ) : (∫t:ℝ,rectangleField S R w t (v+u*t))≤U := by
  rw [rectangleField_chord_eq_hinges S R w v u hR hu]
  apply finiteHingeSum_le_knots _ _ _ U hU (cornerCoefficient_sum_zero S w u)
    (cornerCoefficient_intercept_sum_zero S R w u)
  intro z hz
  rw [←rectangleField_chord_eq_hinges S R w (cornerIntercept R u z) u hR hu]
  exact hcheck z.1 (Finset.mem_product.mp hz).1 z.2

end NoThreeLine
#print axioms NoThreeLine.cornerCoefficient_sum_zero
#print axioms NoThreeLine.cornerCoefficient_intercept_sum_zero
#print axioms NoThreeLine.rectangleField_chord_le_corner_values
