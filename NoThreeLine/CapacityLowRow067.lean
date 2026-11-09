import NoThreeLine.IntegerCapacityChecker
import NoThreeLine.FrozenCapacityData

/-! Frozen low-height row 67: direction (5,2), pair (2,3).
Actual integer range scan; not merely a comparison of saved upper values.
Only this literal field/row is certified here; full-prefix binding is separate. -/
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open MeasureTheory
namespace NoThreeLine.CapacityLowRow067
open FrozenCapacity

def terms (p : Fin 256) (k : Fin 4) : IntegerHinge :=
  let x : ℤ := p.val/16
  let y : ℤ := p.val%16
  let cx : ℤ := ![0,1,0,1] k
  let cy : ℤ := ![0,0,1,1] k
  let sign : ℤ := ![-1,1,1,-1] k
  (5*(y+cy)-2*(x+cx),sign*(cellUnits 2 p+cellUnits 3 p))

theorem row_parameters : (lowRows.get 67).dx=5 ∧ (lowRows.get 67).dy=2 ∧
    (lowRows.get 67).rootType=2 ∧ (lowRows.get 67).otherType=3 ∧
    (lowRows.get 67).upper=(8067389341/32000000000:ℚ) := by decide +kernel

theorem checked : integerCapacityCheck (fun p=>(cellRect p).qChart 0) (pairWeight 2 3)
    (2/5) 80 3200000000 (8067389341/3200000000:ℚ) terms (-32) 112 8067389341=true := by
  decide +kernel

theorem actual_chord_bound (x y : ℝ) :
    directionalChord 0 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 2 3 p:ℝ))) x y (2/5) ≤ (8067389341/3200000000:ℝ) := by
  have h := integerCapacityCheck_chart_sound cellRect (pairWeight 2 3) 0
    (2/5) 80 3200000000 (8067389341/3200000000:ℚ) terms (-32) 112 8067389341 checked x y
  norm_num at h ⊢
  exact h

theorem actual_capacity_bound (x y : ℝ) :
    directionalChord 0 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 2 3 p:ℝ))) x y (2/5)/10 ≤ (8067389341/32000000000:ℝ) := by
  have h := actual_chord_bound x y
  linarith

end NoThreeLine.CapacityLowRow067
#print axioms NoThreeLine.CapacityLowRow067.checked
#print axioms NoThreeLine.CapacityLowRow067.actual_capacity_bound
