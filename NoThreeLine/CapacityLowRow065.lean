import NoThreeLine.IntegerCapacityChecker
import NoThreeLine.FrozenCapacityData

/-! Frozen low-height row 65: direction (5,1), pair (1,2).
Actual integer range scan; not merely a comparison of saved upper values.
Only this literal field/row is certified here; full-prefix binding is separate. -/
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open MeasureTheory
namespace NoThreeLine.CapacityLowRow065
open FrozenCapacity

def terms (p : Fin 256) (k : Fin 4) : IntegerHinge :=
  let x : ℤ := p.val/16
  let y : ℤ := p.val%16
  let cx : ℤ := ![0,1,0,1] k
  let cy : ℤ := ![0,0,1,1] k
  let sign : ℤ := ![-1,1,1,-1] k
  (5*(y+cy)-1*(x+cx),sign*(cellUnits 1 p+cellUnits 2 p))

theorem row_parameters : (lowRows.get 65).dx=5 ∧ (lowRows.get 65).dy=1 ∧
    (lowRows.get 65).rootType=1 ∧ (lowRows.get 65).otherType=2 ∧
    (lowRows.get 65).upper=(618924339/1600000000:ℚ) := by decide +kernel

theorem checked : integerCapacityCheck (fun p=>(cellRect p).qChart 0) (pairWeight 1 2)
    (1/5) 80 1600000000 (618924339/160000000:ℚ) terms (-16) 96 6189243390=true := by
  decide +kernel

theorem actual_chord_bound (x y : ℝ) :
    directionalChord 0 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 1 2 p:ℝ))) x y (1/5) ≤ (618924339/160000000:ℝ) := by
  have h := integerCapacityCheck_chart_sound cellRect (pairWeight 1 2) 0
    (1/5) 80 1600000000 (618924339/160000000:ℚ) terms (-16) 96 6189243390 checked x y
  norm_num at h ⊢
  exact h

theorem actual_capacity_bound (x y : ℝ) :
    directionalChord 0 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 1 2 p:ℝ))) x y (1/5)/10 ≤ (618924339/1600000000:ℝ) := by
  have h := actual_chord_bound x y
  linarith

end NoThreeLine.CapacityLowRow065
#print axioms NoThreeLine.CapacityLowRow065.checked
#print axioms NoThreeLine.CapacityLowRow065.actual_capacity_bound
