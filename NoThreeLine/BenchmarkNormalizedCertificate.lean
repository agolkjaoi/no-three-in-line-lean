import NoThreeLine.BenchmarkNormalizedChunks
import NoThreeLine.BenchmarkAutoCertificate

/-! The full actual rectangle field is bounded by the same normalized
upper blocks. Geometric nonnegativity and square integrability are supplied
internally, before applying the scalar block certificate. -/
set_option autoImplicit false
open Set MeasureTheory
open scoped Interval

namespace NoThreeLine.AutoEnvelope
open OneSided

theorem normalized_positive_certificate_sound {n m k : ℕ} (R : Fin n→QRect)
    (w : Fin n→ℚ) (positive : Fin m→QEdge) (negative : Fin k→QEdge)
    (Q : QRect) (M : ℚ) (S : ℕ) (blocks : List NormalizedBlock) (B : ℚ) (e₀ e : Expr)
    (hd : fullDataCheck R w (qCompleteEdges positive negative) Q M=true)
    (hn : ∀j,(negative j).jump≤0)
    (he₀ : (fullExpr R w positive Q M).unitNormalize=e₀)
    (he : e₀.atomNormalize=e)
    (hc : checkNormalizedUnitIntegral e S blocks=some B)
    (x y : ℝ) (hx : x∈Icc (Q.x0:ℝ) Q.x1) (hy : y∈Icc (Q.y0:ℝ) Q.y1) :
    (∫u in (0:ℝ)..1,(actualChord R w x y u)^2)≤(B:ℝ) := by
  apply checkNormalizedUnitIntegral_sound e S blocks B (actualChord R w x y) hc
  · exact fieldChord_square_intervalIntegrable Finset.univ
      (fun i=>(R i).real) (fun i=>(w i:ℝ)) x y
  · intro u hu
    have h := fullExpr_chord_bounds R w (qCompleteEdges positive negative) Q M x y u hd hx hy hu.1
    refine ⟨h.1,?_⟩
    rw [←he,Expr.atomNormalize_eval,←he₀,Expr.unitNormalize_eval _ u hu.1 hu.2.le]
    rw [←fullExpr_complete_eval R w positive negative Q M u hn]
    exact h.2.1

end NoThreeLine.AutoEnvelope

#print axioms NoThreeLine.AutoEnvelope.normalized_positive_certificate_sound
