import NoThreeLine.IntegerCapacityChecker
import NoThreeLine.FrozenCapacityData

/-! Frozen low-height row 102: direction (7,2), pair (0,1).
Actual integer range scan; not merely a comparison of saved upper values.
Only this literal field/row is certified here; full-prefix binding is separate. -/
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open MeasureTheory
namespace NoThreeLine.CapacityLowRow102
open FrozenCapacity

def terms (p : Fin 256) (k : Fin 4) : IntegerHinge :=
  let x : ℤ := p.val/16
  let y : ℤ := p.val%16
  let cx : ℤ := ![0,1,0,1] k
  let cy : ℤ := ![0,0,1,1] k
  let sign : ℤ := ![-1,1,1,-1] k
  (7*(y+cy)-2*(x+cx),sign*(cellUnits 0 p+cellUnits 1 p))

theorem row_parameters : (lowRows.get 102).dx=7 ∧ (lowRows.get 102).dy=2 ∧
    (lowRows.get 102).rootType=0 ∧ (lowRows.get 102).otherType=1 ∧
    (lowRows.get 102).upper=(21478537/64000000:ℚ) := by decide +kernel

theorem checked : integerCapacityCheck (fun p=>(cellRect p).qChart 0) (pairWeight 0 1)
    (2/7) 112 3200000000 (150349759/32000000:ℚ) terms (-32) 144 15034975900=true := by
  decide +kernel

theorem actual_chord_bound (x y : ℝ) :
    directionalChord 0 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 0 1 p:ℝ))) x y (2/7) ≤ (150349759/32000000:ℝ) := by
  have h := integerCapacityCheck_chart_sound cellRect (pairWeight 0 1) 0
    (2/7) 112 3200000000 (150349759/32000000:ℚ) terms (-32) 144 15034975900 checked x y
  norm_num at h ⊢
  exact h

theorem actual_capacity_bound (x y : ℝ) :
    directionalChord 0 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 0 1 p:ℝ))) x y (2/7)/14 ≤ (21478537/64000000:ℝ) := by
  have h := actual_chord_bound x y
  linarith

end NoThreeLine.CapacityLowRow102
#print axioms NoThreeLine.CapacityLowRow102.checked
#print axioms NoThreeLine.CapacityLowRow102.actual_capacity_bound
