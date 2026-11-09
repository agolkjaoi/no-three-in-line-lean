import NoThreeLine.IntegerCapacityChecker
import NoThreeLine.FrozenCapacityData

/-! Frozen low-height row 54: direction (5,-6), pair (0,1).
Actual integer range scan; not merely a comparison of saved upper values.
Only this literal field/row is certified here; full-prefix binding is separate. -/
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open MeasureTheory
namespace NoThreeLine.CapacityLowRow054
open FrozenCapacity

def terms (p : Fin 256) (k : Fin 4) : IntegerHinge :=
  let x : ℤ := p.val/16
  let y : ℤ := p.val%16
  let cx : ℤ := ![0,1,0,1] k
  let cy : ℤ := ![0,0,1,1] k
  let sign : ℤ := ![-1,1,1,-1] k
  (6*(x+cy)-5*(16-y-1+cx),sign*(cellUnits 0 p+cellUnits 1 p))

theorem row_parameters : (lowRows.get 54).dx=5 ∧ (lowRows.get 54).dy=-6 ∧
    (lowRows.get 54).rootType=0 ∧ (lowRows.get 54).otherType=1 ∧
    (lowRows.get 54).upper=(2984528909/12000000000:ℚ) := by decide +kernel

theorem checked : integerCapacityCheck (fun p=>(cellRect p).qChart 3) (pairWeight 0 1)
    (5/6) 96 8000000000 (2984528909/1000000000:ℚ) terms (-80) 176 23876231272=true := by
  decide +kernel

theorem actual_chord_bound (x y : ℝ) :
    directionalChord 3 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 0 1 p:ℝ))) x y (5/6) ≤ (2984528909/1000000000:ℝ) := by
  have h := integerCapacityCheck_chart_sound cellRect (pairWeight 0 1) 3
    (5/6) 96 8000000000 (2984528909/1000000000:ℚ) terms (-80) 176 23876231272 checked x y
  norm_num at h ⊢
  exact h

theorem actual_capacity_bound (x y : ℝ) :
    directionalChord 3 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 0 1 p:ℝ))) x y (5/6)/12 ≤ (2984528909/12000000000:ℝ) := by
  have h := actual_chord_bound x y
  linarith

end NoThreeLine.CapacityLowRow054
#print axioms NoThreeLine.CapacityLowRow054.checked
#print axioms NoThreeLine.CapacityLowRow054.actual_capacity_bound
