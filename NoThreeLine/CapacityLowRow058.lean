import NoThreeLine.IntegerCapacityChecker
import NoThreeLine.FrozenCapacityData

/-! Frozen low-height row 58: direction (5,-3), pair (0,3).
Actual integer range scan; not merely a comparison of saved upper values.
Only this literal field/row is certified here; full-prefix binding is separate. -/
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open MeasureTheory
namespace NoThreeLine.CapacityLowRow058
open FrozenCapacity

def terms (p : Fin 256) (k : Fin 4) : IntegerHinge :=
  let x : ℤ := p.val/16
  let y : ℤ := p.val%16
  let cx : ℤ := ![0,1,0,1] k
  let cy : ℤ := ![0,0,1,1] k
  let sign : ℤ := ![-1,1,1,-1] k
  (5*(y+cy)-3*(16-x-1+cx),sign*(cellUnits 0 p+cellUnits 3 p))

theorem row_parameters : (lowRows.get 58).dx=5 ∧ (lowRows.get 58).dy=-3 ∧
    (lowRows.get 58).rootType=0 ∧ (lowRows.get 58).otherType=3 ∧
    (lowRows.get 58).upper=(3555844281/16000000000:ℚ) := by decide +kernel

theorem checked : integerCapacityCheck (fun p=>(cellRect p).qChart 1) (pairWeight 0 3)
    (3/5) 80 4800000000 (3555844281/1600000000:ℚ) terms (-48) 128 10667532843=true := by
  decide +kernel

theorem actual_chord_bound (x y : ℝ) :
    directionalChord 1 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 0 3 p:ℝ))) x y (3/5) ≤ (3555844281/1600000000:ℝ) := by
  have h := integerCapacityCheck_chart_sound cellRect (pairWeight 0 3) 1
    (3/5) 80 4800000000 (3555844281/1600000000:ℚ) terms (-48) 128 10667532843 checked x y
  norm_num at h ⊢
  exact h

theorem actual_capacity_bound (x y : ℝ) :
    directionalChord 1 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 0 3 p:ℝ))) x y (3/5)/10 ≤ (3555844281/16000000000:ℝ) := by
  have h := actual_chord_bound x y
  linarith

end NoThreeLine.CapacityLowRow058
#print axioms NoThreeLine.CapacityLowRow058.checked
#print axioms NoThreeLine.CapacityLowRow058.actual_capacity_bound
