import NoThreeLine.IntegerCapacityChecker
import NoThreeLine.FrozenCapacityData

/-! Frozen low-height row 49: direction (4,5), pair (1,3).
Actual integer range scan; not merely a comparison of saved upper values.
Only this literal field/row is certified here; full-prefix binding is separate. -/
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open MeasureTheory
namespace NoThreeLine.CapacityLowRow049
open FrozenCapacity

def terms (p : Fin 256) (k : Fin 4) : IntegerHinge :=
  let x : ℤ := p.val/16
  let y : ℤ := p.val%16
  let cx : ℤ := ![0,1,0,1] k
  let cy : ℤ := ![0,0,1,1] k
  let sign : ℤ := ![-1,1,1,-1] k
  (5*(x+cy)-4*(y+cx),sign*(cellUnits 1 p+cellUnits 3 p))

theorem row_parameters : (lowRows.get 49).dx=4 ∧ (lowRows.get 49).dy=5 ∧
    (lowRows.get 49).rootType=1 ∧ (lowRows.get 49).otherType=3 ∧
    (lowRows.get 49).upper=(11238516399/32000000000:ℚ) := by decide +kernel

theorem checked : integerCapacityCheck (fun p=>(cellRect p).qChart 2) (pairWeight 1 3)
    (4/5) 80 6400000000 (11238516399/3200000000:ℚ) terms (-64) 144 22477032798=true := by
  decide +kernel

theorem actual_chord_bound (x y : ℝ) :
    directionalChord 2 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 1 3 p:ℝ))) x y (4/5) ≤ (11238516399/3200000000:ℝ) := by
  have h := integerCapacityCheck_chart_sound cellRect (pairWeight 1 3) 2
    (4/5) 80 6400000000 (11238516399/3200000000:ℚ) terms (-64) 144 22477032798 checked x y
  norm_num at h ⊢
  exact h

theorem actual_capacity_bound (x y : ℝ) :
    directionalChord 2 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 1 3 p:ℝ))) x y (4/5)/10 ≤ (11238516399/32000000000:ℝ) := by
  have h := actual_chord_bound x y
  linarith

end NoThreeLine.CapacityLowRow049
#print axioms NoThreeLine.CapacityLowRow049.checked
#print axioms NoThreeLine.CapacityLowRow049.actual_capacity_bound
