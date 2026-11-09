import NoThreeLine.BenchmarkUpperNormalize
import NoThreeLine.BenchmarkAutoPartition
import NoThreeLine.BenchmarkAtomGather

set_option autoImplicit false
open Set MeasureTheory
open scoped Interval
namespace NoThreeLine.AutoEnvelope
open OneSided

theorem upper_gathered_positive_certificate_sound {n m k : ℕ} (R : Fin n → QRect)
    (w : Fin n → ℚ) (positive : Fin m → QEdge) (negative : Fin k → QEdge)
    (Q : QRect) (M : ℚ) (S : ℕ) (cuts : List (ℚ × AutoTrace)) (B : ℚ) (e₀ e : Expr)
    (hd : fullDataCheck R w (qCompleteEdges positive negative) Q M=true)
    (hn : ∀ j,(negative j).jump≤0)
    (he₀ : (fullExpr R w positive Q M).unitNormalize=e₀)
    (he : e₀.atomNormalize=e)
    (hc : checkUpperUnitIntegral e S cuts=some B)
    (x y : ℝ) (hx : x∈Icc (Q.x0 : ℝ) Q.x1) (hy : y∈Icc (Q.y0 : ℝ) Q.y1) :
    (∫ u in (0 : ℝ)..1,(actualChord R w x y u)^2)≤(B : ℝ) := by
  apply checkUpperUnitIntegral_sound e S cuts B (actualChord R w x y) hc
  · exact fieldChord_square_intervalIntegrable Finset.univ
      (fun i => (R i).real) (fun i => (w i : ℝ)) x y
  · intro u hu
    have h := fullExpr_chord_bounds R w (qCompleteEdges positive negative) Q M x y u hd hx hy hu.1
    refine ⟨h.1,?_⟩
    rw [←he,Expr.atomNormalize_eval,←he₀,Expr.unitNormalize_eval _ u hu.1 hu.2.le]
    rw [←fullExpr_complete_eval R w positive negative Q M u hn]
    exact h.2.1

end NoThreeLine.AutoEnvelope

#print axioms NoThreeLine.AutoEnvelope.upper_gathered_positive_certificate_sound
