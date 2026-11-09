import NoThreeLine.IntegerCapacityChecker
import NoThreeLine.FrozenCapacityData

/-! Frozen low-height row 4: direction (1,-5), pair (0,3).
Actual integer range scan; not merely a comparison of saved upper values.
Only this literal field/row is certified here; full-prefix binding is separate. -/
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open MeasureTheory
namespace NoThreeLine.CapacityLowRow004
open FrozenCapacity

def terms (p : Fin 256) (k : Fin 4) : IntegerHinge :=
  let x : ℤ := p.val/16
  let y : ℤ := p.val%16
  let cx : ℤ := ![0,1,0,1] k
  let cy : ℤ := ![0,0,1,1] k
  let sign : ℤ := ![-1,1,1,-1] k
  (5*(x+cy)-1*(16-y-1+cx),sign*(cellUnits 0 p+cellUnits 3 p))

theorem row_parameters : (lowRows.get 4).dx=1 ∧ (lowRows.get 4).dy=-5 ∧
    (lowRows.get 4).rootType=0 ∧ (lowRows.get 4).otherType=3 ∧
    (lowRows.get 4).upper=(4651402061/16000000000:ℚ) := by decide +kernel

theorem checked : integerCapacityCheck (fun p=>(cellRect p).qChart 3) (pairWeight 0 3)
    (1/5) 80 1600000000 (4651402061/1600000000:ℚ) terms (-16) 96 4651402061=true := by
  decide +kernel

theorem actual_chord_bound (x y : ℝ) :
    directionalChord 3 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 0 3 p:ℝ))) x y (1/5) ≤ (4651402061/1600000000:ℝ) := by
  have h := integerCapacityCheck_chart_sound cellRect (pairWeight 0 3) 3
    (1/5) 80 1600000000 (4651402061/1600000000:ℚ) terms (-16) 96 4651402061 checked x y
  norm_num at h ⊢
  exact h

theorem actual_capacity_bound (x y : ℝ) :
    directionalChord 3 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 0 3 p:ℝ))) x y (1/5)/10 ≤ (4651402061/16000000000:ℝ) := by
  have h := actual_chord_bound x y
  linarith

end NoThreeLine.CapacityLowRow004
#print axioms NoThreeLine.CapacityLowRow004.checked
#print axioms NoThreeLine.CapacityLowRow004.actual_capacity_bound
