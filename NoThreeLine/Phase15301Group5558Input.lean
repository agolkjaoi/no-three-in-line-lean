import NoThreeLine.Phase15301CheckedLeaf

/-! An enclosing parent box for actual leaves 55,56,57,58. The parent is
not claimed to be an entry of the frozen accepted-leaf table. New numerical
certificates on this box are required before any risk bound follows. -/
set_option autoImplicit false
namespace NoThreeLine.Phase15301Group5558

def queryLeaf : DyadicLeaf := ⟨5,30,0⟩
def root : QRect := ⟨15/2048,31/4096,111/128,3553/4096⟩

theorem root_eq_parent : root=dyadicQRect 128 0 111 queryLeaf := by decide +kernel

theorem root_ordered : root.x0≤root.x1 ∧ root.y0≤root.y1 := by decide +kernel

def childIndex (i : Fin 4) : Fin 80 := ⟨55+i.val,by have := i.isLt; omega⟩

def childLeaf (i : Fin 4) : DyadicLeaf :=
  ![⟨6,60,0⟩,⟨6,60,1⟩,⟨6,61,0⟩,⟨6,61,1⟩] i

def childRoot (i : Fin 4) : QRect := dyadicQRect 128 0 111 (childLeaf i)

theorem actual_child_eq (i : Fin 4) :
    ScheduleUnionBatch15301Accepted.accepted0.phase.leaves (childIndex i)=childLeaf i := by
  fin_cases i <;> decide +kernel

def imageIndex (i f : Fin 4) : Fin (ScheduleUnionBatch15301Accepted.accepted0.phase.count*4) :=
  ⟨4*(55+i.val)+f.val,by have := i.isLt; have := f.isLt; change 4*(55+i.val)+f.val<80*4; omega⟩

def imageBox (i f : Fin 4) : QRect :=
  (phaseImageBoxes 32768 8 ScheduleUnionBatch15301Accepted.accepted0.phase.sx
    ScheduleUnionBatch15301Accepted.accepted0.phase.sy
    ScheduleUnionBatch15301Accepted.accepted0.phase.leaves (imageIndex i f)).qrect 32768

theorem imageBox_eq_child (i f : Fin 4) : imageBox i f=(childRoot i).symmetry f := by
  fin_cases i <;> fin_cases f <;> decide +kernel

theorem child_bounds (i f : Fin 4) :
    (root.symmetry f).x0≤((childRoot i).symmetry f).x0 ∧
    ((childRoot i).symmetry f).x1≤(root.symmetry f).x1 ∧
    (root.symmetry f).y0≤((childRoot i).symmetry f).y0 ∧
    ((childRoot i).symmetry f).y1≤(root.symmetry f).y1 := by
  fin_cases i <;> fin_cases f <;> decide +kernel

theorem image_subset_root (i f : Fin 4) :
    (imageBox i f).real.closedSet⊆(root.symmetry f).real.closedSet := by
  intro p hp
  rw [imageBox_eq_child] at hp
  have h := child_bounds i f
  have hx : (((childRoot i).symmetry f).x0:ℝ)≤p.1 ∧
    p.1≤(((childRoot i).symmetry f).x1:ℝ) := hp.1
  have hy : (((childRoot i).symmetry f).y0:ℝ)≤p.2 ∧
    p.2≤(((childRoot i).symmetry f).y1:ℝ) := hp.2
  change (((root.symmetry f).x0:ℝ)≤p.1 ∧ p.1≤((root.symmetry f).x1:ℝ)) ∧
    (((root.symmetry f).y0:ℝ)≤p.2 ∧ p.2≤((root.symmetry f).y1:ℝ))
  exact ⟨⟨le_trans (by exact_mod_cast h.1) hx.1,
    le_trans hx.2 (by exact_mod_cast h.2.1)⟩,
    ⟨le_trans (by exact_mod_cast h.2.2.1) hy.1,
    le_trans hy.2 (by exact_mod_cast h.2.2.2)⟩⟩

theorem image_in_actual_closed_union (i f : Fin 4) (x y : ℝ)
    (h : (x,y)∈(imageBox i f).real.closedSet) :
    (x,y)∈closedRectangleUnion Finset.univ (fun j =>
      ((phaseImageBoxes 32768 8 ScheduleUnionBatch15301Accepted.accepted0.phase.sx
        ScheduleUnionBatch15301Accepted.accepted0.phase.sy
        ScheduleUnionBatch15301Accepted.accepted0.phase.leaves j).qrect 32768).real) :=
  ⟨imageIndex i f,Finset.mem_univ _,h⟩

end NoThreeLine.Phase15301Group5558

#print axioms NoThreeLine.Phase15301Group5558.actual_child_eq
#print axioms NoThreeLine.Phase15301Group5558.imageBox_eq_child
#print axioms NoThreeLine.Phase15301Group5558.image_subset_root
