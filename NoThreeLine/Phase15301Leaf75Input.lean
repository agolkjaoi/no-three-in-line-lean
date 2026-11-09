import NoThreeLine.Phase15301CheckedLeaf

/-! A fifth actual accepted leaf of phase15301. Numerical bounds are
new checks for this root; previous leaf bounds are not premises. -/
set_option autoImplicit false
namespace NoThreeLine.Phase15301Leaf75

def leaf : DyadicLeaf := ⟨7,127,11⟩
def root : QRect := ⟨127/16384,1/128,14219/16384,3555/4096⟩

theorem actual_leaf_eq : ScheduleUnionBatch15301Accepted.accepted0.phase.leaves (75 : Fin 80)=leaf := by
  decide +kernel

theorem root_eq_leaf : root=dyadicQRect 128 0 111 leaf := by decide +kernel

theorem root_ordered : root.x0≤root.x1 ∧ root.y0≤root.y1 := by decide +kernel

end NoThreeLine.Phase15301Leaf75

#print axioms NoThreeLine.Phase15301Leaf75.actual_leaf_eq
#print axioms NoThreeLine.Phase15301Leaf75.root_eq_leaf
