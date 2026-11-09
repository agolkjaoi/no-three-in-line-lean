import NoThreeLine.RectangleExpr
import NoThreeLine.Partition
import NoThreeLine.ChordIntegral

set_option autoImplicit false
open MeasureTheory Set
open scoped Interval

namespace NoThreeLine

/-- End-to-end contract: actual rational rectangles, a closed root box, a
computed branch partition, and upward-rounded arithmetic give a uniform
upper bound on the actual chord-square integral. No chord domination,
branch provenance, integrability, or integral bound is assumed. -/
theorem rectangle_certificate_sound {n : ℕ} (R : Fin n → QRect)
    (w : Fin n → ℚ) (Q : QRect) (S : ℕ) (cuts : List ℚ) (B : ℚ)
    (hw : ∀ i, 0 ≤ w i)
    (hc : checkUnitIntegral (fieldExpr R w Q) S cuts = some B)
    (x y : ℝ) (hx : x ∈ Icc (Q.x0 : ℝ) Q.x1) (hy : y ∈ Icc (Q.y0 : ℝ) Q.y1) :
    (∫ u in (0 : ℝ)..1, (actualChord R w x y u)^2) ≤ (B : ℝ) := by
  have hc' := checkUnitIntegral_sound (fieldExpr R w Q) S cuts B hc
  have hi := fieldChord_square_integral_le_box Finset.univ
    (fun i => (R i).real) (fun i => (w i : ℝ)) Q.real x y
    (fieldExpr R w Q).eval (fun i _ => by exact_mod_cast hw i)
    hx hy hc'.1 (fun u _ => by simp [fieldExpr_eval])
  exact hi.trans hc'.2

/-- The same certificate applies when finitely many common grid lines are zeroed. -/
theorem erased_rectangle_certificate_sound {n : ℕ} (R : Fin n → QRect)
    (w : Fin n → ℚ) (Q : QRect) (S : ℕ) (cuts : List ℚ) (B : ℚ)
    (hw : ∀ i, 0 ≤ w i)
    (hc : checkUnitIntegral (fieldExpr R w Q) S cuts = some B)
    (x y : ℝ) (hx : x ∈ Icc (Q.x0 : ℝ) Q.x1) (hy : y ∈ Icc (Q.y0 : ℝ) Q.y1)
    (vertical horizontal : Finset ℝ) :
    (∫ u in (0 : ℝ)..1, (∫ t : ℝ,
      eraseGrid vertical horizontal
        (rectangleField Finset.univ (fun i => (R i).real) (fun i => (w i : ℝ)))
        t (y-u*x+u*t))^2) ≤ (B : ℝ) := by
  rw [erased_fieldChord_square_integral_eq]
  exact rectangle_certificate_sound R w Q S cuts B hw hc x y hx hy

end NoThreeLine

#print axioms NoThreeLine.rectangle_certificate_sound
#print axioms NoThreeLine.erased_rectangle_certificate_sound
