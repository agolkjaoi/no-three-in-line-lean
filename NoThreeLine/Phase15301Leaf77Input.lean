import NoThreeLine.Phase15301CheckedLeaf

/-! A second actual accepted leaf of the same phase. Numerical risk for this
new leaf is not inherited from its neighbour and must be checked separately. -/
set_option autoImplicit false
namespace NoThreeLine.Phase15301Leaf77

def leaf : DyadicLeaf := ⟨8,254,17⟩
def root : QRect := ⟨127/16384,255/32768,28433/32768,14217/16384⟩

theorem actual_leaf_eq : ScheduleUnionBatch15301Accepted.accepted0.phase.leaves (77 : Fin 80)=leaf := by
  decide +kernel

theorem root_eq_leaf : root=dyadicQRect 128 0 111 leaf := by decide +kernel

theorem root_ordered : root.x0≤root.x1 ∧ root.y0≤root.y1 := by decide +kernel

end NoThreeLine.Phase15301Leaf77

#print axioms NoThreeLine.Phase15301Leaf77.actual_leaf_eq
#print axioms NoThreeLine.Phase15301Leaf77.root_eq_leaf
