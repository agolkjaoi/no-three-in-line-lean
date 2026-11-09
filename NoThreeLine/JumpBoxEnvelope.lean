import NoThreeLine.MatchedJumps
import NoThreeLine.VertexEnvelope

set_option autoImplicit false
open Set MeasureTheory
open scoped BigOperators
noncomputable section

namespace NoThreeLine

def HEdge.boxBand (e : HEdge) (Q : Rect) (u : ℝ) : ℝ :=
  max 0 (min e.right (Q.x1+(e.height-Q.y0)/u) -
    max e.left (Q.x0+(e.height-Q.y1)/u))

theorem HEdge.bandLength_root_eq (e : HEdge) (Q : Rect) (u : ℝ) (hu : 0 < u) :
    e.bandLength (Q.y0-u*Q.x1) (Q.y1-u*Q.x0) u = e.boxBand Q u := by
  have hl : (e.height-(Q.y1-u*Q.x0))/u = Q.x0+(e.height-Q.y1)/u := by
    field_simp
    ring
  have hh : (e.height-(Q.y0-u*Q.x1))/u = Q.x1+(e.height-Q.y0)/u := by
    field_simp
    ring
  simp only [HEdge.bandLength, HEdge.bandLeft, HEdge.bandRight, HEdge.boxBand, hl, hh]

def jumpBoxEnvelope {ι κ : Type*} (S : Finset ι) (R : ι → Rect) (w : ι → ℝ)
    (T : Finset κ) (E : κ → HEdge) (Q : Rect) (u : ℝ) : ℝ :=
  (∫ t : ℝ, rectangleField S R w t (Q.y0-u*Q.x1+u*t)) +
    ∑ j ∈ T, max 0 (E j).jump * (E j).boxBand Q u

theorem rectangleField_chord_le_jumpBoxEnvelope {ι κ : Type*} (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) (T : Finset κ) (E : κ → HEdge)
    (hm : EdgesMatch S R w T E)
    (hR : ∀ i ∈ S, (R i).x0 ≤ (R i).x1 ∧ (R i).y0 ≤ (R i).y1)
    (hE : ∀ j ∈ T, (E j).left ≤ (E j).right)
    (Q : Rect) (x y u : ℝ) (hx : x ∈ Icc Q.x0 Q.x1)
    (hy : y ∈ Icc Q.y0 Q.y1) (hu : 0 < u) :
    (∫ t : ℝ, rectangleField S R w t (y-u*x+u*t)) ≤
      jumpBoxEnvelope S R w T E Q u := by
  have hb := Q.root_intercept_bounds x y u hu hx hy
  have hi := matched_horizontal_band_upper S R w T E hm hR hE
    (Q.y0-u*Q.x1) (Q.y1-u*Q.x0) (y-u*x) u hu hb.1 hb.2
  simpa only [jumpBoxEnvelope, HEdge.bandLength_root_eq _ Q u hu] using hi

theorem jumpBoxEnvelope_nonneg {ι κ : Type*} (S : Finset ι) (R : ι → Rect)
    (w : ι → ℝ) (T : Finset κ) (E : κ → HEdge) (Q : Rect) (u : ℝ)
    (hw : ∀ i ∈ S, 0 ≤ w i) (hu : 0 < u) :
    0 ≤ jumpBoxEnvelope S R w T E Q u := by
  unfold jumpBoxEnvelope
  apply add_nonneg
  · rw [rectangleField_chord S R w _ u hu]
    exact Finset.sum_nonneg fun i hi => mul_nonneg (hw i hi) (le_max_left _ _)
  · exact Finset.sum_nonneg fun j _ => mul_nonneg (le_max_left _ _) (le_max_left _ _)

def algebraicJumpBoxEnvelope {ι κ : Type*} (S : Finset ι) (R : ι → Rect) (w : ι → ℝ)
    (T : Finset κ) (E : κ → HEdge) (Q : Rect) (u : ℝ) : ℝ :=
  vertexEndpointValue S R w Q.x1 Q.y0 u +
    ∑ j ∈ T, max 0 (E j).jump * (E j).boxBand Q u

theorem jumpBoxEnvelope_eq_algebraic {ι κ : Type*} (S : Finset ι) (R : ι → Rect)
    (w : ι → ℝ) (T : Finset κ) (E : κ → HEdge) (Q : Rect) (u : ℝ)
    (hR : ∀ i ∈ S, (R i).x0 ≤ (R i).x1 ∧ (R i).y0 ≤ (R i).y1) (hu : 0 < u) :
    jumpBoxEnvelope S R w T E Q u = algebraicJumpBoxEnvelope S R w T E Q u := by
  unfold jumpBoxEnvelope algebraicJumpBoxEnvelope
  rw [rectangleField_chord_at_root_eq_vertices S R w Q.x1 Q.y0 u hR hu]

end NoThreeLine

#print axioms NoThreeLine.rectangleField_chord_le_jumpBoxEnvelope
