import NoThreeLine.IntegerCapacityChecker
import NoThreeLine.FrozenCapacityData

/-! Frozen low-height row 104: direction (7,3), pair (0,3).
Actual integer range scan; not merely a comparison of saved upper values.
Only this literal field/row is certified here; full-prefix binding is separate. -/
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open MeasureTheory
namespace NoThreeLine.CapacityLowRow104
open FrozenCapacity

def terms (p : Fin 256) (k : Fin 4) : IntegerHinge :=
  let x : ℤ := p.val/16
  let y : ℤ := p.val%16
  let cx : ℤ := ![0,1,0,1] k
  let cy : ℤ := ![0,0,1,1] k
  let sign : ℤ := ![-1,1,1,-1] k
  (7*(y+cy)-3*(x+cx),sign*(cellUnits 0 p+cellUnits 3 p))

theorem row_parameters : (lowRows.get 104).dx=7 ∧ (lowRows.get 104).dy=3 ∧
    (lowRows.get 104).rootType=0 ∧ (lowRows.get 104).otherType=3 ∧
    (lowRows.get 104).upper=(15689100383/67200000000:ℚ) := by decide +kernel

theorem checked : integerCapacityCheck (fun p=>(cellRect p).qChart 0) (pairWeight 0 3)
    (3/7) 112 4800000000 (15689100383/4800000000:ℚ) terms (-48) 160 15689100383=true := by
  decide +kernel

theorem actual_chord_bound (x y : ℝ) :
    directionalChord 0 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 0 3 p:ℝ))) x y (3/7) ≤ (15689100383/4800000000:ℝ) := by
  have h := integerCapacityCheck_chart_sound cellRect (pairWeight 0 3) 0
    (3/7) 112 4800000000 (15689100383/4800000000:ℚ) terms (-48) 160 15689100383 checked x y
  norm_num at h ⊢
  exact h

theorem actual_capacity_bound (x y : ℝ) :
    directionalChord 0 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 0 3 p:ℝ))) x y (3/7)/14 ≤ (15689100383/67200000000:ℝ) := by
  have h := actual_chord_bound x y
  linarith

end NoThreeLine.CapacityLowRow104
#print axioms NoThreeLine.CapacityLowRow104.checked
#print axioms NoThreeLine.CapacityLowRow104.actual_capacity_bound
