import NoThreeLine.IntegerCapacityChecker
import NoThreeLine.FrozenCapacityData

/-! Frozen low-height row 105: direction (7,3), pair (1,2).
Actual integer range scan; not merely a comparison of saved upper values.
Only this literal field/row is certified here; full-prefix binding is separate. -/
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open MeasureTheory
namespace NoThreeLine.CapacityLowRow105
open FrozenCapacity

def terms (p : Fin 256) (k : Fin 4) : IntegerHinge :=
  let x : ℤ := p.val/16
  let y : ℤ := p.val%16
  let cx : ℤ := ![0,1,0,1] k
  let cy : ℤ := ![0,0,1,1] k
  let sign : ℤ := ![-1,1,1,-1] k
  (7*(y+cy)-3*(x+cx),sign*(cellUnits 1 p+cellUnits 2 p))

theorem row_parameters : (lowRows.get 105).dx=7 ∧ (lowRows.get 105).dy=3 ∧
    (lowRows.get 105).rootType=1 ∧ (lowRows.get 105).otherType=2 ∧
    (lowRows.get 105).upper=(2067206317/8400000000:ℚ) := by decide +kernel

theorem checked : integerCapacityCheck (fun p=>(cellRect p).qChart 0) (pairWeight 1 2)
    (3/7) 112 4800000000 (2067206317/600000000:ℚ) terms (-48) 160 16537650536=true := by
  decide +kernel

theorem actual_chord_bound (x y : ℝ) :
    directionalChord 0 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 1 2 p:ℝ))) x y (3/7) ≤ (2067206317/600000000:ℝ) := by
  have h := integerCapacityCheck_chart_sound cellRect (pairWeight 1 2) 0
    (3/7) 112 4800000000 (2067206317/600000000:ℚ) terms (-48) 160 16537650536 checked x y
  norm_num at h ⊢
  exact h

theorem actual_capacity_bound (x y : ℝ) :
    directionalChord 0 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 1 2 p:ℝ))) x y (3/7)/14 ≤ (2067206317/8400000000:ℝ) := by
  have h := actual_chord_bound x y
  linarith

end NoThreeLine.CapacityLowRow105
#print axioms NoThreeLine.CapacityLowRow105.checked
#print axioms NoThreeLine.CapacityLowRow105.actual_capacity_bound
