import NoThreeLine.IntegerCapacityChecker
import NoThreeLine.FrozenCapacityData

/-! Frozen low-height row 110: direction (7,6), pair (0,1).
Actual integer range scan; not merely a comparison of saved upper values.
Only this literal field/row is certified here; full-prefix binding is separate. -/
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open MeasureTheory
namespace NoThreeLine.CapacityLowRow110
open FrozenCapacity

def terms (p : Fin 256) (k : Fin 4) : IntegerHinge :=
  let x : ℤ := p.val/16
  let y : ℤ := p.val%16
  let cx : ℤ := ![0,1,0,1] k
  let cy : ℤ := ![0,0,1,1] k
  let sign : ℤ := ![-1,1,1,-1] k
  (7*(y+cy)-6*(x+cx),sign*(cellUnits 0 p+cellUnits 1 p))

theorem row_parameters : (lowRows.get 110).dx=7 ∧ (lowRows.get 110).dy=6 ∧
    (lowRows.get 110).rootType=0 ∧ (lowRows.get 110).otherType=1 ∧
    (lowRows.get 110).upper=(2987221863/6400000000:ℚ) := by decide +kernel

theorem checked : integerCapacityCheck (fun p=>(cellRect p).qChart 0) (pairWeight 0 1)
    (6/7) 112 9600000000 (20910553041/3200000000:ℚ) terms (-96) 208 62731659123=true := by
  decide +kernel

theorem actual_chord_bound (x y : ℝ) :
    directionalChord 0 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 0 1 p:ℝ))) x y (6/7) ≤ (20910553041/3200000000:ℝ) := by
  have h := integerCapacityCheck_chart_sound cellRect (pairWeight 0 1) 0
    (6/7) 112 9600000000 (20910553041/3200000000:ℚ) terms (-96) 208 62731659123 checked x y
  norm_num at h ⊢
  exact h

theorem actual_capacity_bound (x y : ℝ) :
    directionalChord 0 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 0 1 p:ℝ))) x y (6/7)/14 ≤ (2987221863/6400000000:ℝ) := by
  have h := actual_chord_bound x y
  linarith

end NoThreeLine.CapacityLowRow110
#print axioms NoThreeLine.CapacityLowRow110.checked
#print axioms NoThreeLine.CapacityLowRow110.actual_capacity_bound
