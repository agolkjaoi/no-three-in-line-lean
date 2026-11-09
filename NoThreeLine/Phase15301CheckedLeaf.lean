import NoThreeLine.ScheduleUnionBatch15301Reference
import NoThreeLine.Phase15301OrbitLeaf

/-! The already certified leaf is an actual entry in the checked phase 15301
input. Its four closed image boxes inherit the same full-reference risk
bound. This identifies one leaf, not every leaf of this phase or schedule. -/
set_option autoImplicit false
namespace NoThreeLine.Phase15301CheckedLeaf
open ScheduleUnionBatch15301Accepted Phase15301OrbitLeaf

def leafIndex : Fin 80 := 76

theorem actual_leaf_eq : accepted0.phase.leaves leafIndex=certificateLeaf := by
  decide +kernel

theorem actual_metadata : accepted0.phase.rootType=3 ∧ accepted0.phase.sx=0 ∧
    accepted0.phase.sy=111 ∧ accepted0.units=194624179 := by decide +kernel

theorem actual_phase_index : ScheduleUnionBatch15301Reference.phaseIndex 0=15301 := by
  decide +kernel

theorem actual_phase_eq : accepted 0=accepted0 := rfl

def imageIndex (f : Fin 4) : Fin (accepted0.phase.count*4) :=
  ⟨304+f.val,by have := f.isLt; change 304+f.val<80*4; omega⟩

def imageBox (f : Fin 4) : QRect :=
  (phaseImageBoxes 32768 8 accepted0.phase.sx accepted0.phase.sy
    accepted0.phase.leaves (imageIndex f)).qrect 32768

theorem imageBox_eq (f : Fin 4) : imageBox f=Phase15301Original.root.symmetry f := by
  fin_cases f <;> decide +kernel

theorem image_in_actual_closed_union (f : Fin 4) (x y : ℝ)
    (h : (x,y)∈(imageBox f).real.closedSet) :
    (x,y)∈closedRectangleUnion Finset.univ (fun i =>
      ((phaseImageBoxes 32768 8 accepted0.phase.sx accepted0.phase.sy
        accepted0.phase.leaves i).qrect 32768).real) :=
  ⟨imageIndex f,Finset.mem_univ _,h⟩

theorem actual_leaf_frozen_risk (f : Fin 4) (x y : ℝ)
    (h : (x,y)∈(imageBox f).real.closedSet) :
    Phase15301FrozenLeaf.frozenRisk x y<(Phase15301Leaf.threshold : ℝ) := by
  rw [imageBox_eq] at h
  exact uniform_frozen_orbit_risk f x y h.1 h.2

end NoThreeLine.Phase15301CheckedLeaf

#print axioms NoThreeLine.Phase15301CheckedLeaf.actual_leaf_eq
#print axioms NoThreeLine.Phase15301CheckedLeaf.actual_leaf_frozen_risk
