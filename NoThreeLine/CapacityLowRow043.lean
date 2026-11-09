import NoThreeLine.IntegerCapacityChecker
import NoThreeLine.FrozenCapacityData

/-! Frozen low-height row 43: direction (4,-1), pair (1,3).
Actual integer range scan; not merely a comparison of saved upper values.
Only this literal field/row is certified here; full-prefix binding is separate. -/
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open MeasureTheory
namespace NoThreeLine.CapacityLowRow043
open FrozenCapacity

def terms (p : Fin 256) (k : Fin 4) : IntegerHinge :=
  let x : ℤ := p.val/16
  let y : ℤ := p.val%16
  let cx : ℤ := ![0,1,0,1] k
  let cy : ℤ := ![0,0,1,1] k
  let sign : ℤ := ![-1,1,1,-1] k
  (4*(y+cy)-1*(16-x-1+cx),sign*(cellUnits 1 p+cellUnits 3 p))

theorem row_parameters : (lowRows.get 43).dx=4 ∧ (lowRows.get 43).dy=-1 ∧
    (lowRows.get 43).rootType=1 ∧ (lowRows.get 43).otherType=3 ∧
    (lowRows.get 43).upper=(528216193/1600000000:ℚ) := by decide +kernel

theorem checked : integerCapacityCheck (fun p=>(cellRect p).qChart 1) (pairWeight 1 3)
    (1/4) 64 1600000000 (528216193/200000000:ℚ) terms (-16) 80 4225729544=true := by
  decide +kernel

theorem actual_chord_bound (x y : ℝ) :
    directionalChord 1 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 1 3 p:ℝ))) x y (1/4) ≤ (528216193/200000000:ℝ) := by
  have h := integerCapacityCheck_chart_sound cellRect (pairWeight 1 3) 1
    (1/4) 64 1600000000 (528216193/200000000:ℚ) terms (-16) 80 4225729544 checked x y
  norm_num at h ⊢
  exact h

theorem actual_capacity_bound (x y : ℝ) :
    directionalChord 1 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 1 3 p:ℝ))) x y (1/4)/8 ≤ (528216193/1600000000:ℝ) := by
  have h := actual_chord_bound x y
  linarith

end NoThreeLine.CapacityLowRow043
#print axioms NoThreeLine.CapacityLowRow043.checked
#print axioms NoThreeLine.CapacityLowRow043.actual_capacity_bound
