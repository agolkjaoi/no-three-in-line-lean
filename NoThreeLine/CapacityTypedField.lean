import NoThreeLine.CapacityParityCode
import NoThreeLine.CapacityFrozenField
import NoThreeLine.FourDirectionFamilies

/-! The actual lattice parity types in the G13 shell chord select precisely
the same two literal capacity weights. No alternative parity convention is
assumed at the grid-to-field boundary. -/
set_option autoImplicit false
noncomputable section
namespace NoThreeLine.FrozenCapacity
open PrimitiveLines GridArea GridChord FiniteDirections

def capacityTypedWeight (z : ZPoint) (i : Fin 256) : ℝ :=
  (cellUnits (codeZ z) i:ℝ)/100000000

theorem directionPairWeight_capacity {n : ℕ} (p : Grid n) (d : ZPoint) (i : Fin 256) :
    directionPairWeight capacityTypedWeight p d i =
      (pairWeight (codeZ (gridEmbed p))
        (stepCode (codeZ (gridEmbed p)) d.1 d.2) i:ℝ) := by
  rw [stepCode_actual]
  unfold directionPairWeight capacityTypedWeight pairWeight
  rw [codeZ_parity,codeZ_parity]
  push_cast
  ring

theorem familyChord_capacity {n : ℕ} (p : Grid n) (f : Fin 4) (a h : ℕ) :
    familyChord Finset.univ (fun i=>(cellRect i).real) capacityTypedWeight p (f,(a,h)) =
      directionalChord f (pairField (codeZ (gridEmbed p))
        (stepCode (codeZ (gridEmbed p)) (familyVector (f,(a,h))).1 (familyVector (f,(a,h))).2))
        (normX n (gridEmbed p)) (normY n (gridEmbed p)) ((a:ℝ)/(h:ℝ)) := by
  have hw : directionPairWeight capacityTypedWeight p (familyVector (f,(a,h))) =
      fun i=>(pairWeight (codeZ (gridEmbed p))
        (stepCode (codeZ (gridEmbed p)) (familyVector (f,(a,h))).1 (familyVector (f,(a,h))).2) i:ℝ) := by
    funext i
    exact directionPairWeight_capacity p _ i
  simp only [familyChord]
  rw [hw]
  rfl

theorem shellChord_family_capacity {n : ℕ} (p : Grid n) (z : FamilyLabel)
    (hz : z∈reducedFamilyLabels n) :
    shellChord Finset.univ (fun i=>(cellRect i).real) capacityTypedWeight p (familyDirection z) =
      directionalChord z.1 (pairField (codeZ (gridEmbed p))
        (stepCode (codeZ (gridEmbed p)) (familyVector z).1 (familyVector z).2))
        (normX n (gridEmbed p)) (normY n (gridEmbed p)) ((z.2.1:ℝ)/(z.2.2:ℝ)) := by
  rw [shellChord_family_eq _ _ _ _ z hz]
  exact familyChord_capacity p z.1 z.2.1 z.2.2

end NoThreeLine.FrozenCapacity
#print axioms NoThreeLine.FrozenCapacity.directionPairWeight_capacity
#print axioms NoThreeLine.FrozenCapacity.shellChord_family_capacity
