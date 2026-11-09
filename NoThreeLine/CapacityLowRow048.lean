import NoThreeLine.IntegerCapacityChecker
import NoThreeLine.FrozenCapacityData

/-! Frozen low-height row 48: direction (4,5), pair (0,2).
Actual integer range scan; not merely a comparison of saved upper values.
Only this literal field/row is certified here; full-prefix binding is separate. -/
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open MeasureTheory
namespace NoThreeLine.CapacityLowRow048
open FrozenCapacity

def terms (p : Fin 256) (k : Fin 4) : IntegerHinge :=
  let x : ℤ := p.val/16
  let y : ℤ := p.val%16
  let cx : ℤ := ![0,1,0,1] k
  let cy : ℤ := ![0,0,1,1] k
  let sign : ℤ := ![-1,1,1,-1] k
  (5*(x+cy)-4*(y+cx),sign*(cellUnits 0 p+cellUnits 2 p))

theorem row_parameters : (lowRows.get 48).dx=4 ∧ (lowRows.get 48).dy=5 ∧
    (lowRows.get 48).rootType=0 ∧ (lowRows.get 48).otherType=2 ∧
    (lowRows.get 48).upper=(3285264541/8000000000:ℚ) := by decide +kernel

theorem checked : integerCapacityCheck (fun p=>(cellRect p).qChart 2) (pairWeight 0 2)
    (4/5) 80 6400000000 (3285264541/800000000:ℚ) terms (-64) 144 26282116328=true := by
  decide +kernel

theorem actual_chord_bound (x y : ℝ) :
    directionalChord 2 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 0 2 p:ℝ))) x y (4/5) ≤ (3285264541/800000000:ℝ) := by
  have h := integerCapacityCheck_chart_sound cellRect (pairWeight 0 2) 2
    (4/5) 80 6400000000 (3285264541/800000000:ℚ) terms (-64) 144 26282116328 checked x y
  norm_num at h ⊢
  exact h

theorem actual_capacity_bound (x y : ℝ) :
    directionalChord 2 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 0 2 p:ℝ))) x y (4/5)/10 ≤ (3285264541/8000000000:ℝ) := by
  have h := actual_chord_bound x y
  linarith

end NoThreeLine.CapacityLowRow048
#print axioms NoThreeLine.CapacityLowRow048.checked
#print axioms NoThreeLine.CapacityLowRow048.actual_capacity_bound
