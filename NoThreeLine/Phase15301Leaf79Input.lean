import NoThreeLine.Phase15301CheckedLeaf

/-! A fourth actual accepted leaf of phase15301. Numerical bounds are
new checks for this root; previous leaf bounds are not premises. -/
set_option autoImplicit false
namespace NoThreeLine.Phase15301Leaf79

def leaf : DyadicLeaf := ⟨8,255,17⟩
def root : QRect := ⟨255/32768,1/128,28433/32768,14217/16384⟩

theorem actual_leaf_eq : ScheduleUnionBatch15301Accepted.accepted0.phase.leaves (79 : Fin 80)=leaf := by
  decide +kernel

theorem root_eq_leaf : root=dyadicQRect 128 0 111 leaf := by decide +kernel

theorem root_ordered : root.x0≤root.x1 ∧ root.y0≤root.y1 := by decide +kernel

end NoThreeLine.Phase15301Leaf79

#print axioms NoThreeLine.Phase15301Leaf79.actual_leaf_eq
#print axioms NoThreeLine.Phase15301Leaf79.root_eq_leaf
