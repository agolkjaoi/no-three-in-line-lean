import NoThreeLine.IntegerCapacityChecker
import NoThreeLine.FrozenCapacityData

/-! Frozen low-height row 109: direction (7,5), pair (1,2).
Actual integer range scan; not merely a comparison of saved upper values.
Only this literal field/row is certified here; full-prefix binding is separate. -/
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open MeasureTheory
namespace NoThreeLine.CapacityLowRow109
open FrozenCapacity

def terms (p : Fin 256) (k : Fin 4) : IntegerHinge :=
  let x : ℤ := p.val/16
  let y : ℤ := p.val%16
  let cx : ℤ := ![0,1,0,1] k
  let cy : ℤ := ![0,0,1,1] k
  let sign : ℤ := ![-1,1,1,-1] k
  (7*(y+cy)-5*(x+cx),sign*(cellUnits 1 p+cellUnits 2 p))

theorem row_parameters : (lowRows.get 109).dx=7 ∧ (lowRows.get 109).dy=5 ∧
    (lowRows.get 109).rootType=1 ∧ (lowRows.get 109).otherType=2 ∧
    (lowRows.get 109).upper=(57356151/218750000:ℚ) := by decide +kernel

theorem checked : integerCapacityCheck (fun p=>(cellRect p).qChart 0) (pairWeight 1 2)
    (5/7) 112 8000000000 (57356151/15625000:ℚ) terms (-80) 192 29366349312=true := by
  decide +kernel

theorem actual_chord_bound (x y : ℝ) :
    directionalChord 0 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 1 2 p:ℝ))) x y (5/7) ≤ (57356151/15625000:ℝ) := by
  have h := integerCapacityCheck_chart_sound cellRect (pairWeight 1 2) 0
    (5/7) 112 8000000000 (57356151/15625000:ℚ) terms (-80) 192 29366349312 checked x y
  norm_num at h ⊢
  exact h

theorem actual_capacity_bound (x y : ℝ) :
    directionalChord 0 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 1 2 p:ℝ))) x y (5/7)/14 ≤ (57356151/218750000:ℝ) := by
  have h := actual_chord_bound x y
  linarith

end NoThreeLine.CapacityLowRow109
#print axioms NoThreeLine.CapacityLowRow109.checked
#print axioms NoThreeLine.CapacityLowRow109.actual_capacity_bound
