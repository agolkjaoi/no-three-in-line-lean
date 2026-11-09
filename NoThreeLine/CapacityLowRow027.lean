import NoThreeLine.IntegerCapacityChecker
import NoThreeLine.FrozenCapacityData

/-! Frozen low-height row 27: direction (3,-5), pair (1,2).
Actual integer range scan; not merely a comparison of saved upper values.
Only this literal field/row is certified here; full-prefix binding is separate. -/
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open MeasureTheory
namespace NoThreeLine.CapacityLowRow027
open FrozenCapacity

def terms (p : Fin 256) (k : Fin 4) : IntegerHinge :=
  let x : ℤ := p.val/16
  let y : ℤ := p.val%16
  let cx : ℤ := ![0,1,0,1] k
  let cy : ℤ := ![0,0,1,1] k
  let sign : ℤ := ![-1,1,1,-1] k
  (5*(x+cy)-3*(16-y-1+cx),sign*(cellUnits 1 p+cellUnits 2 p))

theorem row_parameters : (lowRows.get 27).dx=3 ∧ (lowRows.get 27).dy=-5 ∧
    (lowRows.get 27).rootType=1 ∧ (lowRows.get 27).otherType=2 ∧
    (lowRows.get 27).upper=(4181832847/16000000000:ℚ) := by decide +kernel

theorem checked : integerCapacityCheck (fun p=>(cellRect p).qChart 3) (pairWeight 1 2)
    (3/5) 80 4800000000 (4181832847/1600000000:ℚ) terms (-48) 128 12545498541=true := by
  decide +kernel

theorem actual_chord_bound (x y : ℝ) :
    directionalChord 3 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 1 2 p:ℝ))) x y (3/5) ≤ (4181832847/1600000000:ℝ) := by
  have h := integerCapacityCheck_chart_sound cellRect (pairWeight 1 2) 3
    (3/5) 80 4800000000 (4181832847/1600000000:ℚ) terms (-48) 128 12545498541 checked x y
  norm_num at h ⊢
  exact h

theorem actual_capacity_bound (x y : ℝ) :
    directionalChord 3 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 1 2 p:ℝ))) x y (3/5)/10 ≤ (4181832847/16000000000:ℝ) := by
  have h := actual_chord_bound x y
  linarith

end NoThreeLine.CapacityLowRow027
#print axioms NoThreeLine.CapacityLowRow027.checked
#print axioms NoThreeLine.CapacityLowRow027.actual_capacity_bound
