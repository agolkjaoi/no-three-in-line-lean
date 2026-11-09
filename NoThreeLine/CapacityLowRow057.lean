import NoThreeLine.IntegerCapacityChecker
import NoThreeLine.FrozenCapacityData

/-! Frozen low-height row 57: direction (5,-4), pair (2,3).
Actual integer range scan; not merely a comparison of saved upper values.
Only this literal field/row is certified here; full-prefix binding is separate. -/
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open MeasureTheory
namespace NoThreeLine.CapacityLowRow057
open FrozenCapacity

def terms (p : Fin 256) (k : Fin 4) : IntegerHinge :=
  let x : ℤ := p.val/16
  let y : ℤ := p.val%16
  let cx : ℤ := ![0,1,0,1] k
  let cy : ℤ := ![0,0,1,1] k
  let sign : ℤ := ![-1,1,1,-1] k
  (5*(y+cy)-4*(16-x-1+cx),sign*(cellUnits 2 p+cellUnits 3 p))

theorem row_parameters : (lowRows.get 57).dx=5 ∧ (lowRows.get 57).dy=-4 ∧
    (lowRows.get 57).rootType=2 ∧ (lowRows.get 57).otherType=3 ∧
    (lowRows.get 57).upper=(13321201051/64000000000:ℚ) := by decide +kernel

theorem checked : integerCapacityCheck (fun p=>(cellRect p).qChart 1) (pairWeight 2 3)
    (4/5) 80 6400000000 (13321201051/6400000000:ℚ) terms (-64) 144 13321201051=true := by
  decide +kernel

theorem actual_chord_bound (x y : ℝ) :
    directionalChord 1 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 2 3 p:ℝ))) x y (4/5) ≤ (13321201051/6400000000:ℝ) := by
  have h := integerCapacityCheck_chart_sound cellRect (pairWeight 2 3) 1
    (4/5) 80 6400000000 (13321201051/6400000000:ℚ) terms (-64) 144 13321201051 checked x y
  norm_num at h ⊢
  exact h

theorem actual_capacity_bound (x y : ℝ) :
    directionalChord 1 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 2 3 p:ℝ))) x y (4/5)/10 ≤ (13321201051/64000000000:ℝ) := by
  have h := actual_chord_bound x y
  linarith

end NoThreeLine.CapacityLowRow057
#print axioms NoThreeLine.CapacityLowRow057.checked
#print axioms NoThreeLine.CapacityLowRow057.actual_capacity_bound
