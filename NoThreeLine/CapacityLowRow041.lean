import NoThreeLine.IntegerCapacityChecker
import NoThreeLine.FrozenCapacityData

/-! Frozen low-height row 41: direction (4,-3), pair (1,3).
Actual integer range scan; not merely a comparison of saved upper values.
Only this literal field/row is certified here; full-prefix binding is separate. -/
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open MeasureTheory
namespace NoThreeLine.CapacityLowRow041
open FrozenCapacity

def terms (p : Fin 256) (k : Fin 4) : IntegerHinge :=
  let x : ℤ := p.val/16
  let y : ℤ := p.val%16
  let cx : ℤ := ![0,1,0,1] k
  let cy : ℤ := ![0,0,1,1] k
  let sign : ℤ := ![-1,1,1,-1] k
  (4*(y+cy)-3*(16-x-1+cx),sign*(cellUnits 1 p+cellUnits 3 p))

theorem row_parameters : (lowRows.get 41).dx=4 ∧ (lowRows.get 41).dy=-3 ∧
    (lowRows.get 41).rootType=1 ∧ (lowRows.get 41).otherType=3 ∧
    (lowRows.get 41).upper=(866217537/3200000000:ℚ) := by decide +kernel

theorem checked : integerCapacityCheck (fun p=>(cellRect p).qChart 1) (pairWeight 1 3)
    (3/4) 64 4800000000 (866217537/400000000:ℚ) terms (-48) 112 10394610444=true := by
  decide +kernel

theorem actual_chord_bound (x y : ℝ) :
    directionalChord 1 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 1 3 p:ℝ))) x y (3/4) ≤ (866217537/400000000:ℝ) := by
  have h := integerCapacityCheck_chart_sound cellRect (pairWeight 1 3) 1
    (3/4) 64 4800000000 (866217537/400000000:ℚ) terms (-48) 112 10394610444 checked x y
  norm_num at h ⊢
  exact h

theorem actual_capacity_bound (x y : ℝ) :
    directionalChord 1 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 1 3 p:ℝ))) x y (3/4)/8 ≤ (866217537/3200000000:ℝ) := by
  have h := actual_chord_bound x y
  linarith

end NoThreeLine.CapacityLowRow041
#print axioms NoThreeLine.CapacityLowRow041.checked
#print axioms NoThreeLine.CapacityLowRow041.actual_capacity_bound
