import NoThreeLine.IntegerCapacityChecker
import NoThreeLine.FrozenCapacityData

/-! Frozen low-height row 86: direction (6,7), pair (0,2).
Actual integer range scan; not merely a comparison of saved upper values.
Only this literal field/row is certified here; full-prefix binding is separate. -/
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open MeasureTheory
namespace NoThreeLine.CapacityLowRow086
open FrozenCapacity

def terms (p : Fin 256) (k : Fin 4) : IntegerHinge :=
  let x : ℤ := p.val/16
  let y : ℤ := p.val%16
  let cx : ℤ := ![0,1,0,1] k
  let cy : ℤ := ![0,0,1,1] k
  let sign : ℤ := ![-1,1,1,-1] k
  (7*(x+cy)-6*(y+cx),sign*(cellUnits 0 p+cellUnits 2 p))

theorem row_parameters : (lowRows.get 86).dx=6 ∧ (lowRows.get 86).dy=7 ∧
    (lowRows.get 86).rootType=0 ∧ (lowRows.get 86).otherType=2 ∧
    (lowRows.get 86).upper=(40087171837/134400000000:ℚ) := by decide +kernel

theorem checked : integerCapacityCheck (fun p=>(cellRect p).qChart 2) (pairWeight 0 2)
    (6/7) 112 9600000000 (40087171837/9600000000:ℚ) terms (-96) 208 40087171837=true := by
  decide +kernel

theorem actual_chord_bound (x y : ℝ) :
    directionalChord 2 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 0 2 p:ℝ))) x y (6/7) ≤ (40087171837/9600000000:ℝ) := by
  have h := integerCapacityCheck_chart_sound cellRect (pairWeight 0 2) 2
    (6/7) 112 9600000000 (40087171837/9600000000:ℚ) terms (-96) 208 40087171837 checked x y
  norm_num at h ⊢
  exact h

theorem actual_capacity_bound (x y : ℝ) :
    directionalChord 2 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 0 2 p:ℝ))) x y (6/7)/14 ≤ (40087171837/134400000000:ℝ) := by
  have h := actual_chord_bound x y
  linarith

end NoThreeLine.CapacityLowRow086
#print axioms NoThreeLine.CapacityLowRow086.checked
#print axioms NoThreeLine.CapacityLowRow086.actual_capacity_bound
