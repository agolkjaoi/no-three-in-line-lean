import NoThreeLine.BenchmarkUpperCertificate
import NoThreeLine.BenchmarkUnitNormalize

/-! Directed upper traces also apply to the existing proved unit-normalized
expression and positive-edge witness. No coefficients are imported as analytic
assumptions: normalization equality and the signed witness remain checked. -/
set_option autoImplicit false
open Set MeasureTheory
open scoped Interval
namespace NoThreeLine.OneSided

theorem upper_normalized_positive_certificate_sound {n m k : ℕ} (R : Fin n → QRect)
    (w : Fin n → ℚ) (positive : Fin m → QEdge) (negative : Fin k → QEdge)
    (Q : QRect) (M : ℚ) (S : ℕ) (cuts : List (ℚ × BoundTrace)) (B : ℚ) (e : Expr)
    (hd : fullDataCheck R w (qCompleteEdges positive negative) Q M=true)
    (hn : ∀ j,(negative j).jump≤0)
    (he : (fullExpr R w positive Q M).unitNormalize=e)
    (hc : checkUpperUnitIntegral e S cuts=some B)
    (x y : ℝ) (hx : x∈Icc (Q.x0 : ℝ) Q.x1) (hy : y∈Icc (Q.y0 : ℝ) Q.y1) :
    (∫ u in (0 : ℝ)..1,(actualChord R w x y u)^2)≤(B : ℝ) := by
  apply checkUpperUnitIntegral_sound e S cuts B (actualChord R w x y) hc
  · exact fieldChord_square_intervalIntegrable Finset.univ
      (fun i => (R i).real) (fun i => (w i : ℝ)) x y
  · intro u hu
    have h := fullExpr_chord_bounds R w (qCompleteEdges positive negative) Q M x y u hd hx hy hu.1
    refine ⟨h.1,?_⟩
    have hb := h.2.1
    rw [fullExpr_complete_eval R w positive negative Q M u hn] at hb
    rw [←Expr.unitNormalize_eval (fullExpr R w positive Q M) u hu.1 hu.2.le,he] at hb
    exact hb

end NoThreeLine.OneSided

#print axioms NoThreeLine.OneSided.upper_normalized_positive_certificate_sound
