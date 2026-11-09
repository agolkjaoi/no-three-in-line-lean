import NoThreeLine.Rectangle
import NoThreeLine.BranchChecker

set_option autoImplicit false
open MeasureTheory Set

namespace NoThreeLine

/-- Input coordinates, retained as exact rationals by the executable checker. -/
structure QRect where
  x0 : ℚ
  x1 : ℚ
  y0 : ℚ
  y1 : ℚ
  deriving Repr, DecidableEq

noncomputable def QRect.real (R : QRect) : Rect := ⟨R.x0,R.x1,R.y0,R.y1⟩

def Expr.sum : List Expr → Expr
  | [] => .atom ⟨0,0⟩
  | x :: xs => .add x (Expr.sum xs)

theorem Expr.eval_sum (es : List Expr) (u : ℝ) :
    (Expr.sum es).eval u = (es.map (fun e => e.eval u)).sum := by
  induction es with
  | nil => simp [Expr.sum, Expr.eval, Coeff.eval]
  | cons e es ih => simp [Expr.sum, Expr.eval, ih]

/-- Compile the proven cellwise geometric envelope, not an unverified branch dump. -/
def QRect.envelopeExpr (R Q : QRect) : Expr :=
  .max (.atom ⟨0,0⟩)
    (.add
      (.min (.atom ⟨R.x1,0⟩) (.atom ⟨Q.x1,R.y1-Q.y0⟩))
      (.scale (-1) (.max (.atom ⟨R.x0,0⟩) (.atom ⟨Q.x0,R.y0-Q.y1⟩))))

theorem QRect.envelopeExpr_eval (R Q : QRect) (u : ℝ) :
    (R.envelopeExpr Q).eval u = R.real.boxEnvelope Q.real u := by
  simp [QRect.envelopeExpr, Expr.eval, Coeff.eval, Rect.boxEnvelope,
    QRect.real, sub_eq_add_neg]

def fieldExpr {n : ℕ} (R : Fin n → QRect) (w : Fin n → ℚ) (Q : QRect) : Expr :=
  Expr.sum (List.ofFn fun i => .scale (w i) ((R i).envelopeExpr Q))

theorem fieldExpr_eval {n : ℕ} (R : Fin n → QRect) (w : Fin n → ℚ) (Q : QRect)
    (u : ℝ) :
    (fieldExpr R w Q).eval u =
      ∑ i, (w i : ℝ) * (R i).real.boxEnvelope Q.real u := by
  simp [fieldExpr, Expr.eval_sum, List.map_ofFn, List.sum_ofFn,
    Expr.eval, QRect.envelopeExpr_eval]

noncomputable def actualChord {n : ℕ} (R : Fin n → QRect) (w : Fin n → ℚ)
    (x y u : ℝ) : ℝ :=
  ∫ t : ℝ, rectangleField Finset.univ (fun i => (R i).real)
    (fun i => (w i : ℝ)) t (y-u*x+u*t)

theorem actualChord_bounds {n : ℕ} (R : Fin n → QRect) (w : Fin n → ℚ) (Q : QRect)
    (x y u : ℝ) (hu : 0 < u) (hw : ∀ i, 0 ≤ w i)
    (hx : x ∈ Icc (Q.x0 : ℝ) Q.x1) (hy : y ∈ Icc (Q.y0 : ℝ) Q.y1) :
    0 ≤ actualChord R w x y u ∧ actualChord R w x y u ≤ (fieldExpr R w Q).eval u := by
  constructor
  · unfold actualChord
    rw [rectangleField_chord _ _ _ _ _ hu]
    exact Finset.sum_nonneg fun i _ =>
      mul_nonneg (by exact_mod_cast hw i) (le_max_left _ _)
  · rw [fieldExpr_eval]
    exact rectangleField_chord_le Finset.univ (fun i => (R i).real)
      (fun i => (w i : ℝ)) Q.real x y u hu
      (fun i _ => by exact_mod_cast hw i) hx hy

end NoThreeLine

#print axioms NoThreeLine.QRect.envelopeExpr_eval
#print axioms NoThreeLine.actualChord_bounds
