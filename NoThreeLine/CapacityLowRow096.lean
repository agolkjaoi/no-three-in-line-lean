import NoThreeLine.IntegerCapacityChecker
import NoThreeLine.FrozenCapacityData

/-! Frozen low-height row 96: direction (7,-2), pair (0,1).
Actual integer range scan; not merely a comparison of saved upper values.
Only this literal field/row is certified here; full-prefix binding is separate. -/
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open MeasureTheory
namespace NoThreeLine.CapacityLowRow096
open FrozenCapacity

def terms (p : Fin 256) (k : Fin 4) : IntegerHinge :=
  let x : ℤ := p.val/16
  let y : ℤ := p.val%16
  let cx : ℤ := ![0,1,0,1] k
  let cy : ℤ := ![0,0,1,1] k
  let sign : ℤ := ![-1,1,1,-1] k
  (7*(y+cy)-2*(16-x-1+cx),sign*(cellUnits 0 p+cellUnits 1 p))

theorem row_parameters : (lowRows.get 96).dx=7 ∧ (lowRows.get 96).dy=-2 ∧
    (lowRows.get 96).rootType=0 ∧ (lowRows.get 96).otherType=1 ∧
    (lowRows.get 96).upper=(6361477163/22400000000:ℚ) := by decide +kernel

theorem checked : integerCapacityCheck (fun p=>(cellRect p).qChart 1) (pairWeight 0 1)
    (2/7) 112 3200000000 (6361477163/1600000000:ℚ) terms (-32) 144 12722954326=true := by
  decide +kernel

theorem actual_chord_bound (x y : ℝ) :
    directionalChord 1 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 0 1 p:ℝ))) x y (2/7) ≤ (6361477163/1600000000:ℝ) := by
  have h := integerCapacityCheck_chart_sound cellRect (pairWeight 0 1) 1
    (2/7) 112 3200000000 (6361477163/1600000000:ℚ) terms (-32) 144 12722954326 checked x y
  norm_num at h ⊢
  exact h

theorem actual_capacity_bound (x y : ℝ) :
    directionalChord 1 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 0 1 p:ℝ))) x y (2/7)/14 ≤ (6361477163/22400000000:ℝ) := by
  have h := actual_chord_bound x y
  linarith

end NoThreeLine.CapacityLowRow096
#print axioms NoThreeLine.CapacityLowRow096.checked
#print axioms NoThreeLine.CapacityLowRow096.actual_capacity_bound
