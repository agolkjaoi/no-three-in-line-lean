import NoThreeLine.PositiveEdgeWitness
import NoThreeLine.FullCertificate

/-! End-to-end full min(U1,U2,M) certificates may use the frozen positive-only
cost table. Negative edges occur only in the finite representation witness,
so angular checking does not need to traverse their zero-cost subexpressions. -/
set_option autoImplicit false
open Set MeasureTheory
open scoped Interval

namespace NoThreeLine

theorem fullExpr_complete_eval {n m k : ℕ} (R : Fin n → QRect) (w : Fin n → ℚ)
    (positive : Fin m → QEdge) (negative : Fin k → QEdge) (Q : QRect) (M : ℚ) (u : ℝ)
    (hn : ∀ j, (negative j).jump ≤ 0) :
    (fullExpr R w (qCompleteEdges positive negative) Q M).eval u =
      (fullExpr R w positive Q M).eval u := by
  simp only [fullExpr,Expr.eval,qJumpEnvelopeExpr_complete_eval R w positive negative Q u hn]

theorem positive_full_certificate_sound {n m k : ℕ} (R : Fin n → QRect)
    (w : Fin n → ℚ) (positive : Fin m → QEdge) (negative : Fin k → QEdge)
    (Q : QRect) (M : ℚ) (S : ℕ) (cuts : List ℚ) (B : ℚ)
    (hd : fullDataCheck R w (qCompleteEdges positive negative) Q M = true)
    (hn : ∀ j, (negative j).jump ≤ 0)
    (hc : checkUnitIntegral (fullExpr R w positive Q M) S cuts = some B)
    (x y : ℝ) (hx : x ∈ Icc (Q.x0 : ℝ) Q.x1) (hy : y ∈ Icc (Q.y0 : ℝ) Q.y1) :
    (∫ u in (0 : ℝ)..1, (actualChord R w x y u)^2) ≤ (B : ℝ) := by
  have hf := fullDataCheck_sound R w (qCompleteEdges positive negative) Q M hd
  have hi := checkUnitIntegral_sound (fullExpr R w positive Q M) S cuts B hc
  have hdom := fieldChord_square_integral_le Finset.univ (fun i => (R i).real)
    (fun i => (w i : ℝ)) x y (fullExpr R w positive Q M).eval
    (fun i _ => (hf.weights i (Finset.mem_univ _)).1) hi.1 (by
      intro u hu
      have hb := (fullExpr_chord_bounds R w (qCompleteEdges positive negative)
        Q M x y u hd hx hy hu.1).2.1
      rw [fullExpr_complete_eval R w positive negative Q M u hn] at hb
      exact hb)
  exact hdom.trans hi.2

/-- Signed matching uses both tables, while the expression is exactly the
positive-table min(U1,U2,M). This check contains only finite rational data. -/
def checkPositiveFullCertificate {n m k : ℕ} (R : Fin n → QRect) (w : Fin n → ℚ)
    (positive : Fin m → QEdge) (negative : Fin k → QEdge)
    (Q : QRect) (M : ℚ) (S : ℕ) (cuts : List ℚ) : Option ℚ :=
  if qPositiveEdgeWitnessCheck R w positive negative then
    if fullDataCheck R w (qCompleteEdges positive negative) Q M then
      checkUnitIntegral (fullExpr R w positive Q M) S cuts
    else none
  else none

theorem checkPositiveFullCertificate_sound {n m k : ℕ} (R : Fin n → QRect)
    (w : Fin n → ℚ) (positive : Fin m → QEdge) (negative : Fin k → QEdge)
    (Q : QRect) (M : ℚ) (S : ℕ) (cuts : List ℚ) (B : ℚ)
    (hc : checkPositiveFullCertificate R w positive negative Q M S cuts = some B)
    (x y : ℝ) (hx : x ∈ Icc (Q.x0 : ℝ) Q.x1) (hy : y ∈ Icc (Q.y0 : ℝ) Q.y1) :
    (∫ u in (0 : ℝ)..1, (actualChord R w x y u)^2) ≤ (B : ℝ) := by
  unfold checkPositiveFullCertificate at hc
  split_ifs at hc with hw hd
  have hh : qEdgeDataValid positive = true ∧ qEdgeDataValid negative = true ∧
      (∀ j, 0 ≤ (positive j).jump) ∧ (∀ j, (negative j).jump ≤ 0) ∧
      qEdgesMatchCheck R w (qCompleteEdges positive negative) = true := by
    simpa only [qPositiveEdgeWitnessCheck,decide_eq_true_eq] using hw
  exact positive_full_certificate_sound R w positive negative Q M S cuts B hd
    hh.2.2.2.1 hc x y hx hy

theorem checkPositiveFullCertificate_erased_sound {n m k : ℕ} (R : Fin n → QRect)
    (w : Fin n → ℚ) (positive : Fin m → QEdge) (negative : Fin k → QEdge)
    (Q : QRect) (M : ℚ) (S : ℕ) (cuts : List ℚ) (B : ℚ)
    (hc : checkPositiveFullCertificate R w positive negative Q M S cuts = some B)
    (x y : ℝ) (hx : x ∈ Icc (Q.x0 : ℝ) Q.x1) (hy : y ∈ Icc (Q.y0 : ℝ) Q.y1)
    (vertical horizontal : Finset ℝ) :
    (∫ u in (0 : ℝ)..1, (∫ t : ℝ, eraseGrid vertical horizontal
      (rectangleField Finset.univ (fun i => (R i).real) (fun i => (w i : ℝ)))
      t (y-u*x+u*t))^2) ≤ (B : ℝ) := by
  rw [erased_fieldChord_square_integral_eq]
  exact checkPositiveFullCertificate_sound R w positive negative Q M S cuts B hc x y hx hy

end NoThreeLine

#print axioms NoThreeLine.fullExpr_complete_eval
#print axioms NoThreeLine.checkPositiveFullCertificate_sound
#print axioms NoThreeLine.checkPositiveFullCertificate_erased_sound
