import NoThreeLine.JumpBoxEnvelope
import NoThreeLine.FieldCap

/-! C04: the three independently derived upper bounds meet in the original
min(U1,U2,M) envelope. All geometric hypotheses concern explicit finite data. -/
set_option autoImplicit false
open Set MeasureTheory
noncomputable section

namespace NoThreeLine

def fullBoxEnvelope {ι κ : Type*} (S : Finset ι) (R : ι → Rect) (w : ι → ℝ)
    (T : Finset κ) (E : κ → HEdge) (Q : Rect) (M u : ℝ) : ℝ :=
  min (algebraicVertexBoxEnvelope S R w Q u)
    (min (algebraicJumpBoxEnvelope S R w T E Q u) M)

/-- The complete finite geometric upper bound, with no chord or envelope
inequality among its assumptions. -/
theorem fullBoxEnvelope_sound {ι κ : Type*} (S : Finset ι) (R : ι → Rect) (w : ι → ℝ)
    (T : Finset κ) (E : κ → HEdge) (Q : Rect) (M x y u : ℝ)
    (hM : 0 ≤ M) (hsep : RectanglesSeparated S R)
    (hw : ∀ i ∈ S, 0 ≤ w i ∧ w i ≤ M) (hU : ∀ i ∈ S, (R i).InUnitSquare)
    (hm : EdgesMatch S R w T E) (hE : ∀ j ∈ T, (E j).left ≤ (E j).right)
    (hx : x ∈ Icc Q.x0 Q.x1) (hy : y ∈ Icc Q.y0 Q.y1) (hu : 0 < u) :
    0 ≤ (∫ t : ℝ, rectangleField S R w t (y-u*x+u*t)) ∧
      (∫ t : ℝ, rectangleField S R w t (y-u*x+u*t)) ≤ fullBoxEnvelope S R w T E Q M u ∧
      fullBoxEnvelope S R w T E Q M u ≤ M := by
  have hR : ∀ i ∈ S, (R i).x0 ≤ (R i).x1 ∧ (R i).y0 ≤ (R i).y1 := by
    intro i hi
    exact ⟨(hU i hi).2.1, (hU i hi).2.2.2.2.1⟩
  have hc := rectangleField_chord_bounds S R w M (y-u*x) u hM hsep hw hU hu
  have hv := rectangleField_chord_le_algebraicVertexBoxEnvelope S R w Q x y u hR hx hy hu
  have hj := rectangleField_chord_le_jumpBoxEnvelope S R w T E hm hR hE Q x y u hx hy hu
  rw [jumpBoxEnvelope_eq_algebraic S R w T E Q u hR hu] at hj
  exact ⟨hc.1, le_min hv (le_min hj hc.2), (min_le_right _ _).trans (min_le_right _ _)⟩

theorem fullBoxEnvelope_square_sound {ι κ : Type*} (S : Finset ι) (R : ι → Rect)
    (w : ι → ℝ) (T : Finset κ) (E : κ → HEdge) (Q : Rect) (M x y u : ℝ)
    (hM : 0 ≤ M) (hsep : RectanglesSeparated S R)
    (hw : ∀ i ∈ S, 0 ≤ w i ∧ w i ≤ M) (hU : ∀ i ∈ S, (R i).InUnitSquare)
    (hm : EdgesMatch S R w T E) (hE : ∀ j ∈ T, (E j).left ≤ (E j).right)
    (hx : x ∈ Icc Q.x0 Q.x1) (hy : y ∈ Icc Q.y0 Q.y1) (hu : 0 < u) :
    (∫ t : ℝ, rectangleField S R w t (y-u*x+u*t))^2 ≤
      (fullBoxEnvelope S R w T E Q M u)^2 := by
  have hh := fullBoxEnvelope_sound S R w T E Q M x y u hM hsep hw hU hm hE hx hy hu
  exact pow_le_pow_left₀ hh.1 hh.2.1 2

theorem fullBoxEnvelope_continuousOn {ι κ : Type*} (S : Finset ι) (R : ι → Rect)
    (w : ι → ℝ) (T : Finset κ) (E : κ → HEdge) (Q : Rect) (M : ℝ) :
    ContinuousOn (fullBoxEnvelope S R w T E Q M) (Ioi 0) := by
  have hc (a b : ℝ) : ContinuousOn (vertexEndpointValue S R w a b) (Ioi 0) := by
    apply continuousOn_finsetSum
    intro p _ u hu
    have hne : u ≠ 0 := ne_of_gt hu
    fun_prop
  have ht : ContinuousOn (fun u => ∑ p ∈ vertexSet S R,
      max 0 (-vertexCoefficient S R w p) * rootVertexTent Q p u) (Ioi 0) := by
    apply continuousOn_finsetSum
    intro p _ u hu
    have hne : u ≠ 0 := ne_of_gt hu
    unfold rootVertexTent
    have hfour : 4*u ≠ 0 := mul_ne_zero (by norm_num) hne
    fun_prop
  have hb : ContinuousOn (fun u => ∑ j ∈ T, max 0 (E j).jump * (E j).boxBand Q u)
      (Ioi 0) := by
    apply continuousOn_finsetSum
    intro j _ u hu
    have hne : u ≠ 0 := ne_of_gt hu
    unfold HEdge.boxBand
    fun_prop
  exact (((hc Q.x1 Q.y0).sup (hc Q.x0 Q.y1)).add ht).inf
    (((hc Q.x1 Q.y0).add hb).inf continuousOn_const)

end NoThreeLine

#print axioms NoThreeLine.fullBoxEnvelope_sound
#print axioms NoThreeLine.fullBoxEnvelope_square_sound
#print axioms NoThreeLine.fullBoxEnvelope_continuousOn
