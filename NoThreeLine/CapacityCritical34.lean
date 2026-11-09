import NoThreeLine.IntegerCapacityChecker
import NoThreeLine.FrozenCapacityData

/-! Concrete critical low-height row: direction (3,4), parity pair (0,1).
The checker recomputes all integer intercepts of the explicit frozen field.
This certifies this literal field only; full-reference prefix binding remains
separate, and the other 111 direction/pair rows are not asserted here. -/
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open MeasureTheory
namespace NoThreeLine.CapacityCritical34
open FrozenCapacity

def terms (p : Fin 256) (k : Fin 4) : IntegerHinge :=
  let x : ℤ := p.val/16
  let y : ℤ := p.val%16
  let dx : ℤ := ![0,1,0,1] k
  let dy : ℤ := ![0,0,1,1] k
  let sign : ℤ := ![-1,1,1,-1] k
  (4*(x+dy)-3*(y+dx),sign*(cellUnits 0 p+cellUnits 1 p))

theorem checked : integerCapacityCheck (fun p=>(cellRect p).qChart 2) (pairWeight 0 1)
    (3/4) 64 4800000000 (30549893891/4800000000) terms (-48) 112 30549893891=true := by
  decide +kernel

theorem actual_chord_bound (x y : ℝ) :
    directionalChord 2 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 0 1 p:ℝ))) x y (3/4) ≤ (30549893891/4800000000:ℝ) := by
  have h := integerCapacityCheck_chart_sound cellRect (pairWeight 0 1) 2
    (3/4) 64 4800000000 (30549893891/4800000000) terms (-48) 112 30549893891 checked x y
  norm_num at h ⊢
  exact h

theorem actual_capacity_bound (x y : ℝ) :
    directionalChord 2 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 0 1 p:ℝ))) x y (3/4)/8 ≤ (30549893891/38400000000:ℝ) := by
  have h := actual_chord_bound x y
  linarith

end NoThreeLine.CapacityCritical34
#print axioms NoThreeLine.CapacityCritical34.checked
#print axioms NoThreeLine.CapacityCritical34.actual_capacity_bound
