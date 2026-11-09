import NoThreeLine.BenchmarkUpperPartition
import NoThreeLine.FullCertificate

/-! The directed upper partition applies to the actual chord of the unchanged
min(U1,U2,M) envelope. Its nonnegativity and square integrability are derived
from the rectangle input. The generic analytic premises are not left in the
public finite-certificate conclusion. -/
set_option autoImplicit false
open Set MeasureTheory
open scoped Interval
namespace NoThreeLine.OneSided

theorem upper_full_certificate_sound {n m : ℕ} (R : Fin n → QRect) (w : Fin n → ℚ)
    (E : Fin m → QEdge) (Q : QRect) (M : ℚ) (S : ℕ)
    (cuts : List (ℚ × BoundTrace)) (B : ℚ)
    (hd : fullDataCheck R w E Q M=true)
    (hc : checkUpperUnitIntegral (fullExpr R w E Q M) S cuts=some B)
    (x y : ℝ) (hx : x∈Icc (Q.x0 : ℝ) Q.x1) (hy : y∈Icc (Q.y0 : ℝ) Q.y1) :
    (∫ u in (0 : ℝ)..1, (actualChord R w x y u)^2)≤(B : ℝ) := by
  apply checkUpperUnitIntegral_sound (fullExpr R w E Q M) S cuts B
    (actualChord R w x y) hc
  · exact fieldChord_square_intervalIntegrable Finset.univ
      (fun i => (R i).real) (fun i => (w i : ℝ)) x y
  · intro u hu
    have h := fullExpr_chord_bounds R w E Q M x y u hd hx hy hu.1
    exact ⟨h.1,h.2.1⟩

theorem erased_upper_full_certificate_sound {n m : ℕ} (R : Fin n → QRect) (w : Fin n → ℚ)
    (E : Fin m → QEdge) (Q : QRect) (M : ℚ) (S : ℕ)
    (cuts : List (ℚ × BoundTrace)) (B : ℚ)
    (hd : fullDataCheck R w E Q M=true)
    (hc : checkUpperUnitIntegral (fullExpr R w E Q M) S cuts=some B)
    (x y : ℝ) (hx : x∈Icc (Q.x0 : ℝ) Q.x1) (hy : y∈Icc (Q.y0 : ℝ) Q.y1)
    (V H : Finset ℝ) :
    (∫ u in (0 : ℝ)..1, (∫ t : ℝ, eraseGrid V H
      (rectangleField Finset.univ (fun i => (R i).real) (fun i => (w i : ℝ)))
        t (y-u*x+u*t))^2)≤(B : ℝ) := by
  rw [erased_fieldChord_square_integral_eq]
  exact upper_full_certificate_sound R w E Q M S cuts B hd hc x y hx hy

def checkUpperFullCertificate {n m : ℕ} (R : Fin n → QRect) (w : Fin n → ℚ)
    (E : Fin m → QEdge) (Q : QRect) (M : ℚ) (S : ℕ)
    (cuts : List (ℚ × BoundTrace)) : Option ℚ :=
  if fullDataCheck R w E Q M then checkUpperUnitIntegral (fullExpr R w E Q M) S cuts
  else none

theorem checkUpperFullCertificate_sound {n m : ℕ} (R : Fin n → QRect) (w : Fin n → ℚ)
    (E : Fin m → QEdge) (Q : QRect) (M : ℚ) (S : ℕ)
    (cuts : List (ℚ × BoundTrace)) (B : ℚ)
    (hc : checkUpperFullCertificate R w E Q M S cuts=some B)
    (x y : ℝ) (hx : x∈Icc (Q.x0 : ℝ) Q.x1) (hy : y∈Icc (Q.y0 : ℝ) Q.y1) :
    (∫ u in (0 : ℝ)..1, (actualChord R w x y u)^2)≤(B : ℝ) := by
  unfold checkUpperFullCertificate at hc
  split_ifs at hc with hd
  exact upper_full_certificate_sound R w E Q M S cuts B hd hc x y hx hy

theorem upper_unit_partition_checked :
    checkUpperUnitIntegral (fullExpr jumpMatchUnitRect jumpMatchUnitWeight jumpMatchUnitEdges
      fullUnitRoot 1) 1 [(1,.minRight (.minRight .exact))]=some 1 := by
  decide +kernel

theorem upper_unit_actual_integral (x y : ℝ) (hx : x∈Icc (0 : ℝ) 1)
    (hy : y∈Icc (0 : ℝ) 1) :
    (∫ u in (0 : ℝ)..1, (actualChord jumpMatchUnitRect jumpMatchUnitWeight x y u)^2)≤1 := by
  simpa using upper_full_certificate_sound jumpMatchUnitRect jumpMatchUnitWeight
    jumpMatchUnitEdges fullUnitRoot 1 1 [(1,.minRight (.minRight .exact))] 1
    full_unit_data_checked upper_unit_partition_checked x y
    (by simpa [fullUnitRoot] using hx) (by simpa [fullUnitRoot] using hy)

end NoThreeLine.OneSided

#print axioms NoThreeLine.OneSided.checkUpperFullCertificate_sound
#print axioms NoThreeLine.OneSided.erased_upper_full_certificate_sound
#print axioms NoThreeLine.OneSided.upper_unit_actual_integral
