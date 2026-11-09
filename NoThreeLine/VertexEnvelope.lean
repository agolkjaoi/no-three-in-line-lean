import NoThreeLine.VertexChord
import NoThreeLine.HingeEnvelope

/-! C02: the negative-vertex correction bounds actual rectangular-field
chords uniformly over a closed root rectangle. -/
set_option autoImplicit false
open Set MeasureTheory
open scoped BigOperators
noncomputable section

namespace NoThreeLine

theorem rectangleField_chord_eq_hingeSum {ι : Type*} (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) (v u : ℝ)
    (hR : ∀ i ∈ S, (R i).x0 ≤ (R i).x1 ∧ (R i).y0 ≤ (R i).y1)
    (hu : 0 < u) :
    (∫ t : ℝ, rectangleField S R w t (v+u*t)) =
      hingeSum (vertexSet S R) (vertexCoefficient S R w) (fun p => p.2-u*p.1) u v := by
  rw [rectangleField_chord_eq_groupedVertices S R w v u hR hu]
  unfold hingeSum
  rw [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro p _
  unfold hinge
  rw [show v-(p.2-u*p.1) = v-p.2+u*p.1 by ring]
  ring

def vertexEnvelope {ι : Type*} (S : Finset ι) (R : ι → Rect) (w : ι → ℝ)
    (l h u : ℝ) : ℝ :=
  max (∫ t : ℝ, rectangleField S R w t (l+u*t))
      (∫ t : ℝ, rectangleField S R w t (h+u*t)) +
    ∑ p ∈ vertexSet S R, max 0 (-vertexCoefficient S R w p) *
      hingeTent l h (p.2-u*p.1) u

theorem vertexEnvelope_eq_hingeFormula {ι : Type*} (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) (l h u : ℝ)
    (hR : ∀ i ∈ S, (R i).x0 ≤ (R i).x1 ∧ (R i).y0 ≤ (R i).y1)
    (hu : 0 < u) :
    vertexEnvelope S R w l h u =
      max (hingeSum (vertexSet S R) (vertexCoefficient S R w) (fun p => p.2-u*p.1) u l)
          (hingeSum (vertexSet S R) (vertexCoefficient S R w) (fun p => p.2-u*p.1) u h) +
      ∑ p ∈ vertexSet S R, max 0 (-vertexCoefficient S R w p) *
        hingeTent l h (p.2-u*p.1) u := by
  unfold vertexEnvelope
  rw [rectangleField_chord_eq_hingeSum S R w l u hR hu,
    rectangleField_chord_eq_hingeSum S R w h u hR hu]

theorem rectangleField_chord_le_vertexEnvelope {ι : Type*} (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) (l h v u : ℝ)
    (hR : ∀ i ∈ S, (R i).x0 ≤ (R i).x1 ∧ (R i).y0 ≤ (R i).y1)
    (hlh : l ≤ h) (hv : v ∈ Icc l h) (hu : 0 < u) :
    (∫ t : ℝ, rectangleField S R w t (v+u*t)) ≤ vertexEnvelope S R w l h u := by
  rw [rectangleField_chord_eq_hingeSum S R w v u hR hu,
    vertexEnvelope_eq_hingeFormula S R w l h u hR hu]
  exact hinge_sum_upper_closed (vertexSet S R) (vertexCoefficient S R w)
    (fun p => p.2-u*p.1) l h u v hlh hv hu

theorem vertexEnvelope_eq_negative {ι : Type*} (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) (l h u : ℝ) :
    vertexEnvelope S R w l h u =
      max (∫ t : ℝ, rectangleField S R w t (l+u*t))
          (∫ t : ℝ, rectangleField S R w t (h+u*t)) +
      ∑ p ∈ (vertexSet S R).filter (fun p => vertexCoefficient S R w p < 0),
        (-vertexCoefficient S R w p) * hingeTent l h (p.2-u*p.1) u := by
  unfold vertexEnvelope
  rw [negative_hinge_correction_eq]

theorem vertexEnvelope_nonneg {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (w : ι → ℝ) (l h u : ℝ) (hw : ∀ i ∈ S, 0 ≤ w i) (hu : 0 < u) :
    0 ≤ vertexEnvelope S R w l h u := by
  have hl : 0 ≤ ∫ t : ℝ, rectangleField S R w t (l+u*t) := by
    rw [rectangleField_chord S R w l u hu]
    exact Finset.sum_nonneg (fun i hi => mul_nonneg (hw i hi) (le_max_left _ _))
  apply add_nonneg (hl.trans (le_max_left _ _))
  exact Finset.sum_nonneg (fun p _ => mul_nonneg (le_max_left _ _) (le_max_left _ _))

def vertexBoxEnvelope {ι : Type*} (S : Finset ι) (R : ι → Rect) (w : ι → ℝ)
    (Q : Rect) (u : ℝ) : ℝ :=
  vertexEnvelope S R w (Q.y0-u*Q.x1) (Q.y1-u*Q.x0) u

/-- Includes point and edge root boxes: no positive root-box area is assumed. -/
theorem rectangleField_chord_le_vertexBoxEnvelope {ι : Type*} (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) (Q : Rect) (x y u : ℝ)
    (hR : ∀ i ∈ S, (R i).x0 ≤ (R i).x1 ∧ (R i).y0 ≤ (R i).y1)
    (hx : x ∈ Icc Q.x0 Q.x1) (hy : y ∈ Icc Q.y0 Q.y1) (hu : 0 < u) :
    (∫ t : ℝ, rectangleField S R w t (y-u*x+u*t)) ≤ vertexBoxEnvelope S R w Q u := by
  have hv := Q.root_intercept_bounds x y u hu hx hy
  exact rectangleField_chord_le_vertexEnvelope S R w (Q.y0-u*Q.x1) (Q.y1-u*Q.x0)
    (y-u*x) u hR (hv.1.trans hv.2) hv hu

/-- The correction is an explicit max/min tree of a+b/u branches. -/
def rootVertexTent (Q : Rect) (p : ℝ × ℝ) (u : ℝ) : ℝ :=
  max 0 (min (Q.x1-p.1+(p.2-Q.y0)/u)
    (min (p.1-Q.x0+(Q.y1-p.2)/u)
      ((Q.x1-Q.x0)/4+(Q.y1-Q.y0)/(4*u))))

theorem hingeTent_root_eq (Q : Rect) (p : ℝ × ℝ) (u : ℝ) (hu : 0 < u) :
    hingeTent (Q.y0-u*Q.x1) (Q.y1-u*Q.x0) (p.2-u*p.1) u = rootVertexTent Q p u := by
  have hP : ((p.2-u*p.1)-(Q.y0-u*Q.x1))/u = Q.x1-p.1+(p.2-Q.y0)/u := by
    field_simp
    ring
  have hQ : ((Q.y1-u*Q.x0)-(p.2-u*p.1))/u = p.1-Q.x0+(Q.y1-p.2)/u := by
    field_simp
    ring
  have hC : ((Q.y1-u*Q.x0)-(Q.y0-u*Q.x1))/(4*u) =
      (Q.x1-Q.x0)/4+(Q.y1-Q.y0)/(4*u) := by
    field_simp
    ring
  simp only [hingeTent,rootVertexTent,hP,hQ,hC]

theorem vertexBoxEnvelope_eq_rootFormula {ι : Type*} (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) (Q : Rect) (u : ℝ) (hu : 0 < u) :
    vertexBoxEnvelope S R w Q u =
      max (∫ t : ℝ, rectangleField S R w t (Q.y0-u*Q.x1+u*t))
          (∫ t : ℝ, rectangleField S R w t (Q.y1-u*Q.x0+u*t)) +
      ∑ p ∈ vertexSet S R, max 0 (-vertexCoefficient S R w p) * rootVertexTent Q p u := by
  unfold vertexBoxEnvelope vertexEnvelope
  simp_rw [hingeTent_root_eq Q _ u hu]

/-- At a fixed root corner, every hinge is a positive part of a+b/u. -/
theorem rootCorner_hinge_eq (κ a b u : ℝ) (p : ℝ × ℝ) (hu : 0 < u) :
    hinge κ (p.2-u*p.1) u (b-u*a) = κ * max 0 (p.1-a+(b-p.2)/u) := by
  have he : (b-u*a)-(p.2-u*p.1) = u*(p.1-a+(b-p.2)/u) := by
    field_simp
    ring
  have hm : u * max 0 (p.1-a+(b-p.2)/u) = max 0 (u*(p.1-a+(b-p.2)/u)) := by
    simpa only [mul_zero] using mul_max_of_nonneg (0:ℝ) (p.1-a+(b-p.2)/u) hu.le
  unfold hinge
  rw [he,← hm]
  field_simp

def vertexEndpointValue {ι : Type*} (S : Finset ι) (R : ι → Rect) (w : ι → ℝ)
    (a b u : ℝ) : ℝ :=
  ∑ p ∈ vertexSet S R, vertexCoefficient S R w p * max 0 (p.1-a+(b-p.2)/u)

theorem rectangleField_chord_at_root_eq_vertices {ι : Type*} (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) (a b u : ℝ)
    (hR : ∀ i ∈ S, (R i).x0 ≤ (R i).x1 ∧ (R i).y0 ≤ (R i).y1)
    (hu : 0 < u) :
    (∫ t : ℝ, rectangleField S R w t (b-u*a+u*t)) = vertexEndpointValue S R w a b u := by
  rw [rectangleField_chord_eq_hingeSum S R w (b-u*a) u hR hu]
  unfold hingeSum vertexEndpointValue
  apply Finset.sum_congr rfl
  intro p _
  exact rootCorner_hinge_eq (vertexCoefficient S R w p) a b u p hu

/-- U1 contains only finite sums, scalar coefficients, max/min, and a+b/u
atoms. Its two endpoint values are derived from actual rectangle chords. -/
def algebraicVertexBoxEnvelope {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (w : ι → ℝ) (Q : Rect) (u : ℝ) : ℝ :=
  max (vertexEndpointValue S R w Q.x1 Q.y0 u) (vertexEndpointValue S R w Q.x0 Q.y1 u) +
    ∑ p ∈ vertexSet S R, max 0 (-vertexCoefficient S R w p) * rootVertexTent Q p u

theorem vertexBoxEnvelope_eq_algebraic {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (w : ι → ℝ) (Q : Rect) (u : ℝ)
    (hR : ∀ i ∈ S, (R i).x0 ≤ (R i).x1 ∧ (R i).y0 ≤ (R i).y1)
    (hu : 0 < u) :
    vertexBoxEnvelope S R w Q u = algebraicVertexBoxEnvelope S R w Q u := by
  rw [vertexBoxEnvelope_eq_rootFormula S R w Q u hu,
    rectangleField_chord_at_root_eq_vertices S R w Q.x1 Q.y0 u hR hu,
    rectangleField_chord_at_root_eq_vertices S R w Q.x0 Q.y1 u hR hu]
  rfl

theorem rectangleField_chord_le_algebraicVertexBoxEnvelope {ι : Type*}
    (S : Finset ι) (R : ι → Rect) (w : ι → ℝ) (Q : Rect) (x y u : ℝ)
    (hR : ∀ i ∈ S, (R i).x0 ≤ (R i).x1 ∧ (R i).y0 ≤ (R i).y1)
    (hx : x ∈ Icc Q.x0 Q.x1) (hy : y ∈ Icc Q.y0 Q.y1) (hu : 0 < u) :
    (∫ t : ℝ, rectangleField S R w t (y-u*x+u*t)) ≤
      algebraicVertexBoxEnvelope S R w Q u := by
  rw [← vertexBoxEnvelope_eq_algebraic S R w Q u hR hu]
  exact rectangleField_chord_le_vertexBoxEnvelope S R w Q x y u hR hx hy hu

end NoThreeLine

#print axioms NoThreeLine.rectangleField_chord_eq_hingeSum
#print axioms NoThreeLine.rectangleField_chord_le_vertexEnvelope
#print axioms NoThreeLine.rectangleField_chord_le_vertexBoxEnvelope
#print axioms NoThreeLine.hingeTent_root_eq
#print axioms NoThreeLine.vertexBoxEnvelope_eq_algebraic
#print axioms NoThreeLine.rectangleField_chord_le_algebraicVertexBoxEnvelope
