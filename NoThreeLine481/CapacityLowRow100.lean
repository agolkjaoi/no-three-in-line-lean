import NoThreeLine.IntegerCapacityChecker
import NoThreeLine.FrozenCapacityData

/-! Frozen low-height row 100: direction (7,1), pair (0,3).
Actual integer range scan; not merely a comparison of saved upper values.
Only this literal field/row is certified here; full-prefix binding is separate. -/
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open MeasureTheory
namespace NoThreeLine.CapacityLowRow100
open FrozenCapacity

def terms (p : Fin 256) (k : Fin 4) : IntegerHinge :=
  let x : ℤ := p.val/16
  let y : ℤ := p.val%16
  let cx : ℤ := ![0,1,0,1] k
  let cy : ℤ := ![0,0,1,1] k
  let sign : ℤ := ![-1,1,1,-1] k
  (7*(y+cy)-1*(x+cx),sign*(cellUnits 0 p+cellUnits 3 p))

theorem row_parameters : (lowRows.get 100).dx=7 ∧ (lowRows.get 100).dy=1 ∧
    (lowRows.get 100).rootType=0 ∧ (lowRows.get 100).otherType=3 ∧
    (lowRows.get 100).upper=(5619588413/22400000000:ℚ) := by decide +kernel

theorem checked : integerCapacityCheck (fun p=>(cellRect p).qChart 0) (pairWeight 0 3)
    (1/7) 112 1600000000 (5619588413/1600000000:ℚ) terms (-16) 128 5619588413=true := by
  decide +kernel

theorem actual_chord_bound (x y : ℝ) :
    directionalChord 0 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 0 3 p:ℝ))) x y (1/7) ≤ (5619588413/1600000000:ℝ) := by
  have h := integerCapacityCheck_chart_sound cellRect (pairWeight 0 3) 0
    (1/7) 112 1600000000 (5619588413/1600000000:ℚ) terms (-16) 128 5619588413 checked x y
  norm_num at h ⊢
  exact h

theorem actual_capacity_bound (x y : ℝ) :
    directionalChord 0 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 0 3 p:ℝ))) x y (1/7)/14 ≤ (5619588413/22400000000:ℝ) := by
  have h := actual_chord_bound x y
  linarith

end NoThreeLine.CapacityLowRow100
#print axioms NoThreeLine.CapacityLowRow100.checked
#print axioms NoThreeLine.CapacityLowRow100.actual_capacity_bound
