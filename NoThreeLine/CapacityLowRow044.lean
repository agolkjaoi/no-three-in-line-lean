import NoThreeLine.IntegerCapacityChecker
import NoThreeLine.FrozenCapacityData

/-! Frozen low-height row 44: direction (4,1), pair (0,2).
Actual integer range scan; not merely a comparison of saved upper values.
Only this literal field/row is certified here; full-prefix binding is separate. -/
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open MeasureTheory
namespace NoThreeLine.CapacityLowRow044
open FrozenCapacity

def terms (p : Fin 256) (k : Fin 4) : IntegerHinge :=
  let x : ℤ := p.val/16
  let y : ℤ := p.val%16
  let cx : ℤ := ![0,1,0,1] k
  let cy : ℤ := ![0,0,1,1] k
  let sign : ℤ := ![-1,1,1,-1] k
  (4*(y+cy)-1*(x+cx),sign*(cellUnits 0 p+cellUnits 2 p))

theorem row_parameters : (lowRows.get 44).dx=4 ∧ (lowRows.get 44).dy=1 ∧
    (lowRows.get 44).rootType=0 ∧ (lowRows.get 44).otherType=2 ∧
    (lowRows.get 44).upper=(743286231/1600000000:ℚ) := by decide +kernel

theorem checked : integerCapacityCheck (fun p=>(cellRect p).qChart 0) (pairWeight 0 2)
    (1/4) 64 1600000000 (743286231/200000000:ℚ) terms (-16) 80 5946289848=true := by
  decide +kernel

theorem actual_chord_bound (x y : ℝ) :
    directionalChord 0 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 0 2 p:ℝ))) x y (1/4) ≤ (743286231/200000000:ℝ) := by
  have h := integerCapacityCheck_chart_sound cellRect (pairWeight 0 2) 0
    (1/4) 64 1600000000 (743286231/200000000:ℚ) terms (-16) 80 5946289848 checked x y
  norm_num at h ⊢
  exact h

theorem actual_capacity_bound (x y : ℝ) :
    directionalChord 0 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 0 2 p:ℝ))) x y (1/4)/8 ≤ (743286231/1600000000:ℝ) := by
  have h := actual_chord_bound x y
  linarith

end NoThreeLine.CapacityLowRow044
#print axioms NoThreeLine.CapacityLowRow044.checked
#print axioms NoThreeLine.CapacityLowRow044.actual_capacity_bound
