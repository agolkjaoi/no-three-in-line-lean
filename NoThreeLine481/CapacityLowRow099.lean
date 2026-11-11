import NoThreeLine.IntegerCapacityChecker
import NoThreeLine.FrozenCapacityData

/-! Frozen low-height row 99: direction (7,-1), pair (1,2).
Actual integer range scan; not merely a comparison of saved upper values.
Only this literal field/row is certified here; full-prefix binding is separate. -/
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open MeasureTheory
namespace NoThreeLine.CapacityLowRow099
open FrozenCapacity

def terms (p : Fin 256) (k : Fin 4) : IntegerHinge :=
  let x : ℤ := p.val/16
  let y : ℤ := p.val%16
  let cx : ℤ := ![0,1,0,1] k
  let cy : ℤ := ![0,0,1,1] k
  let sign : ℤ := ![-1,1,1,-1] k
  (7*(y+cy)-1*(16-x-1+cx),sign*(cellUnits 1 p+cellUnits 2 p))

theorem row_parameters : (lowRows.get 99).dx=7 ∧ (lowRows.get 99).dy=-1 ∧
    (lowRows.get 99).rootType=1 ∧ (lowRows.get 99).otherType=2 ∧
    (lowRows.get 99).upper=(5857439677/22400000000:ℚ) := by decide +kernel

theorem checked : integerCapacityCheck (fun p=>(cellRect p).qChart 1) (pairWeight 1 2)
    (1/7) 112 1600000000 (5857439677/1600000000:ℚ) terms (-16) 128 5857439677=true := by
  decide +kernel

theorem actual_chord_bound (x y : ℝ) :
    directionalChord 1 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 1 2 p:ℝ))) x y (1/7) ≤ (5857439677/1600000000:ℝ) := by
  have h := integerCapacityCheck_chart_sound cellRect (pairWeight 1 2) 1
    (1/7) 112 1600000000 (5857439677/1600000000:ℚ) terms (-16) 128 5857439677 checked x y
  norm_num at h ⊢
  exact h

theorem actual_capacity_bound (x y : ℝ) :
    directionalChord 1 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 1 2 p:ℝ))) x y (1/7)/14 ≤ (5857439677/22400000000:ℝ) := by
  have h := actual_chord_bound x y
  linarith

end NoThreeLine.CapacityLowRow099
#print axioms NoThreeLine.CapacityLowRow099.checked
#print axioms NoThreeLine.CapacityLowRow099.actual_capacity_bound
