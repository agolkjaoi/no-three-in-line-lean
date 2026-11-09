import NoThreeLine.RectangleCapacityKnots
import NoThreeLine.AngularChartsBV

/-! Finite nonaxis capacity checks cover all four signed/coordinate charts.
The chart reflection preserves the one-dimensional chord measure. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory

namespace NoThreeLine

theorem directionalChord_le_corner_values {ι : Type*} (S : Finset ι)
    (R : ι→Rect) (w : ι→ℝ) (f : Fin 4) (u U : ℝ)
    (hR : ∀i∈S,(R i).InUnitSquare) (hu : 0<u) (hU : 0≤U)
    (hcheck : ∀i∈S,∀k:Fin 4,
      (∫t:ℝ,rectangleField S (fun j=>(R j).chart f) w t
        ((((R i).chart f).vertex k).2-u*(((R i).chart f).vertex k).1+u*t))≤U)
    (x y : ℝ) : directionalChord f (rectangleField S R w) x y u≤U := by
  rw [←rectangleField_chartChord_eq]
  apply rectangleField_chord_le_corner_values S (fun i=>(R i).chart f) w u U
    (fun i hi=>⟨((hR i hi).chart f).2.1,((hR i hi).chart f).2.2.2.2.1⟩) hu hU hcheck

end NoThreeLine
#print axioms NoThreeLine.directionalChord_le_corner_values
