import NoThreeLine.IntegerCapacityChecker
import NoThreeLine.FrozenCapacityData

/-! Frozen low-height row 103: direction (7,2), pair (2,3).
Actual integer range scan; not merely a comparison of saved upper values.
Only this literal field/row is certified here; full-prefix binding is separate. -/
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open MeasureTheory
namespace NoThreeLine.CapacityLowRow103
open FrozenCapacity

def terms (p : Fin 256) (k : Fin 4) : IntegerHinge :=
  let x : ℤ := p.val/16
  let y : ℤ := p.val%16
  let cx : ℤ := ![0,1,0,1] k
  let cy : ℤ := ![0,0,1,1] k
  let sign : ℤ := ![-1,1,1,-1] k
  (7*(y+cy)-2*(x+cx),sign*(cellUnits 2 p+cellUnits 3 p))

theorem row_parameters : (lowRows.get 103).dx=7 ∧ (lowRows.get 103).dy=2 ∧
    (lowRows.get 103).rootType=2 ∧ (lowRows.get 103).otherType=3 ∧
    (lowRows.get 103).upper=(176215043/896000000:ℚ) := by decide +kernel

theorem checked : integerCapacityCheck (fun p=>(cellRect p).qChart 0) (pairWeight 2 3)
    (2/7) 112 3200000000 (176215043/64000000:ℚ) terms (-32) 144 8810752150=true := by
  decide +kernel

theorem actual_chord_bound (x y : ℝ) :
    directionalChord 0 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 2 3 p:ℝ))) x y (2/7) ≤ (176215043/64000000:ℝ) := by
  have h := integerCapacityCheck_chart_sound cellRect (pairWeight 2 3) 0
    (2/7) 112 3200000000 (176215043/64000000:ℚ) terms (-32) 144 8810752150 checked x y
  norm_num at h ⊢
  exact h

theorem actual_capacity_bound (x y : ℝ) :
    directionalChord 0 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 2 3 p:ℝ))) x y (2/7)/14 ≤ (176215043/896000000:ℝ) := by
  have h := actual_chord_bound x y
  linarith

end NoThreeLine.CapacityLowRow103
#print axioms NoThreeLine.CapacityLowRow103.checked
#print axioms NoThreeLine.CapacityLowRow103.actual_capacity_bound
