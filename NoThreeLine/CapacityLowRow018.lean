import NoThreeLine.IntegerCapacityChecker
import NoThreeLine.FrozenCapacityData

/-! Frozen low-height row 18: direction (2,-5), pair (0,2).
Actual integer range scan; not merely a comparison of saved upper values.
Only this literal field/row is certified here; full-prefix binding is separate. -/
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open MeasureTheory
namespace NoThreeLine.CapacityLowRow018
open FrozenCapacity

def terms (p : Fin 256) (k : Fin 4) : IntegerHinge :=
  let x : ℤ := p.val/16
  let y : ℤ := p.val%16
  let cx : ℤ := ![0,1,0,1] k
  let cy : ℤ := ![0,0,1,1] k
  let sign : ℤ := ![-1,1,1,-1] k
  (5*(x+cy)-2*(16-y-1+cx),sign*(cellUnits 0 p+cellUnits 2 p))

theorem row_parameters : (lowRows.get 18).dx=2 ∧ (lowRows.get 18).dy=-5 ∧
    (lowRows.get 18).rootType=0 ∧ (lowRows.get 18).otherType=2 ∧
    (lowRows.get 18).upper=(1855987953/6400000000:ℚ) := by decide +kernel

theorem checked : integerCapacityCheck (fun p=>(cellRect p).qChart 3) (pairWeight 0 2)
    (2/5) 80 3200000000 (1855987953/640000000:ℚ) terms (-32) 112 9279939765=true := by
  decide +kernel

theorem actual_chord_bound (x y : ℝ) :
    directionalChord 3 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 0 2 p:ℝ))) x y (2/5) ≤ (1855987953/640000000:ℝ) := by
  have h := integerCapacityCheck_chart_sound cellRect (pairWeight 0 2) 3
    (2/5) 80 3200000000 (1855987953/640000000:ℚ) terms (-32) 112 9279939765 checked x y
  norm_num at h ⊢
  exact h

theorem actual_capacity_bound (x y : ℝ) :
    directionalChord 3 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 0 2 p:ℝ))) x y (2/5)/10 ≤ (1855987953/6400000000:ℝ) := by
  have h := actual_chord_bound x y
  linarith

end NoThreeLine.CapacityLowRow018
#print axioms NoThreeLine.CapacityLowRow018.checked
#print axioms NoThreeLine.CapacityLowRow018.actual_capacity_bound
