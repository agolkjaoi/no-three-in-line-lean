import NoThreeLine.IntegerCapacityChecker
import NoThreeLine.FrozenCapacityData

/-! Frozen low-height row 53: direction (5,-7), pair (1,2).
Actual integer range scan; not merely a comparison of saved upper values.
Only this literal field/row is certified here; full-prefix binding is separate. -/
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open MeasureTheory
namespace NoThreeLine.CapacityLowRow053
open FrozenCapacity

def terms (p : Fin 256) (k : Fin 4) : IntegerHinge :=
  let x : ℤ := p.val/16
  let y : ℤ := p.val%16
  let cx : ℤ := ![0,1,0,1] k
  let cy : ℤ := ![0,0,1,1] k
  let sign : ℤ := ![-1,1,1,-1] k
  (7*(x+cy)-5*(16-y-1+cx),sign*(cellUnits 1 p+cellUnits 2 p))

theorem row_parameters : (lowRows.get 53).dx=5 ∧ (lowRows.get 53).dy=-7 ∧
    (lowRows.get 53).rootType=1 ∧ (lowRows.get 53).otherType=2 ∧
    (lowRows.get 53).upper=(2898634441/16000000000:ℚ) := by decide +kernel

theorem checked : integerCapacityCheck (fun p=>(cellRect p).qChart 3) (pairWeight 1 2)
    (5/7) 112 8000000000 (20290441087/8000000000:ℚ) terms (-80) 192 20290441087=true := by
  decide +kernel

theorem actual_chord_bound (x y : ℝ) :
    directionalChord 3 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 1 2 p:ℝ))) x y (5/7) ≤ (20290441087/8000000000:ℝ) := by
  have h := integerCapacityCheck_chart_sound cellRect (pairWeight 1 2) 3
    (5/7) 112 8000000000 (20290441087/8000000000:ℚ) terms (-80) 192 20290441087 checked x y
  norm_num at h ⊢
  exact h

theorem actual_capacity_bound (x y : ℝ) :
    directionalChord 3 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 1 2 p:ℝ))) x y (5/7)/14 ≤ (2898634441/16000000000:ℝ) := by
  have h := actual_chord_bound x y
  linarith

end NoThreeLine.CapacityLowRow053
#print axioms NoThreeLine.CapacityLowRow053.checked
#print axioms NoThreeLine.CapacityLowRow053.actual_capacity_bound
