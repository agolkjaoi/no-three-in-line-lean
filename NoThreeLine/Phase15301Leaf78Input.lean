import NoThreeLine.Phase15301CheckedLeaf

/-! A third actual accepted leaf of phase15301. Numerical bounds are
new checks for this root; previous leaf bounds are not premises. -/
set_option autoImplicit false
namespace NoThreeLine.Phase15301Leaf78

def leaf : DyadicLeaf := ⟨8,255,16⟩
def root : QRect := ⟨255/32768,1/128,1777/2048,28433/32768⟩

theorem actual_leaf_eq : ScheduleUnionBatch15301Accepted.accepted0.phase.leaves (78 : Fin 80)=leaf := by
  decide +kernel

theorem root_eq_leaf : root=dyadicQRect 128 0 111 leaf := by decide +kernel

theorem root_ordered : root.x0≤root.x1 ∧ root.y0≤root.y1 := by decide +kernel

end NoThreeLine.Phase15301Leaf78

#print axioms NoThreeLine.Phase15301Leaf78.actual_leaf_eq
#print axioms NoThreeLine.Phase15301Leaf78.root_eq_leaf
