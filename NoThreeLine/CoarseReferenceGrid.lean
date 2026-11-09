import NoThreeLine.UnionReindex
import NoThreeLine.DyadicPhaseContainment
import NoThreeLine.PrimitiveLines

/-! The frozen 128 by 128 coarse-source grid, expressed on the common
32768 fine grid.  Symmetry images are deduplicated before assigning a 0/1
cell coefficient, including diagonal source cells. -/
set_option autoImplicit false
noncomputable section
namespace NoThreeLine

def coarseGridBox (p : Grid 128) : GridBox :=
  ⟨p.1.val*256, (p.1.val+1)*256, p.2.val*256, (p.2.val+1)*256⟩

def coarseGridRect (p : Grid 128) : Rect := ((coarseGridBox p).qrect 32768).real

def coarseFlip (i : Fin 128) : Fin 128 := ⟨127-i.val, by have := i.isLt; omega⟩

def coarseSymmetry (p : Grid 128) (f : Fin 4) : Grid 128 :=
  ![p, (p.2,p.1), (coarseFlip p.1,coarseFlip p.2),
    (coarseFlip p.2,coarseFlip p.1)] f

theorem coarseGridBox_valid (p : Grid 128) : (coarseGridBox p).Valid 32768 := by
  have := p.1.isLt
  have := p.2.isLt
  dsimp [coarseGridBox, GridBox.Valid]
  omega

theorem coarseGridBox_separated (p q : Grid 128) (hpq : p ≠ q) :
    (coarseGridBox p).Separated (coarseGridBox q) := by
  have hval : p.1.val ≠ q.1.val ∨ p.2.val ≠ q.2.val := by
    by_contra h
    push_neg at h
    exact hpq (Prod.ext (Fin.ext h.1) (Fin.ext h.2))
  dsimp [coarseGridBox, GridBox.Separated]
  omega

theorem coarseGridRect_separated : RectanglesSeparated Finset.univ coarseGridRect := by
  intro p _ q _ hpq
  exact ((coarseGridBox p).qrect 32768).qSeparated_real _
    ((coarseGridBox p).separated_qrect 32768 (by decide) _ (coarseGridBox_separated p q hpq))

theorem coarseGridRect_endpoints (p : Grid 128) :
    (coarseGridRect p).EndpointsOn (commonGridLines 32768) (commonGridLines 32768) :=
  (coarseGridBox p).endpoints_commonGrid 32768 (coarseGridBox_valid p)

theorem coarseGridRect_inUnit (p : Grid 128) : (coarseGridRect p).InUnitSquare :=
  ((coarseGridBox p).qrect 32768).qUnit_real
    ((coarseGridBox p).valid_qrect 32768 (by decide) (coarseGridBox_valid p))

theorem coarseGridBox_symmetry (p : Grid 128) (f : Fin 4) :
    (coarseGridBox p).symmetry 32768 f = coarseGridBox (coarseSymmetry p f) := by
  have := p.1.isLt
  have := p.2.isLt
  fin_cases f <;>
    simp [coarseGridBox, GridBox.symmetry, coarseSymmetry, coarseFlip]
  all_goals congr 1 <;> omega

theorem phaseCoarseBoxes_eq_grid (p : Grid 128) (f : Fin 4) :
    phaseCoarseBoxes 32768 8 p.1.val p.2.val f = coarseGridBox (coarseSymmetry p f) := by
  unfold phaseCoarseBoxes
  have he : dyadicGridBox 8 p.1.val p.2.val ⟨0,0,0⟩ = coarseGridBox p := by
    simp [dyadicGridBox, coarseGridBox, Nat.add_mul]
  rw [he]
  exact coarseGridBox_symmetry p f

def coarseOrbitWeight (p q : Grid 128) : ℝ :=
  if q ∈ Finset.univ.image (coarseSymmetry p) then 1 else 0

theorem coarseOrbitWeight_bounds (p q : Grid 128) :
    0 ≤ coarseOrbitWeight p q ∧ coarseOrbitWeight p q ≤ 1 := by
  unfold coarseOrbitWeight
  split_ifs <;> norm_num

theorem coarseUnion_eq_commonField (p : Grid 128) :
    rectangleUnionMask Finset.univ
      (fun f => ((phaseCoarseBoxes 32768 8 p.1.val p.2.val f).qrect 32768).real)
      (commonGridLines 32768) (commonGridLines 32768) =
    eraseGrid (commonGridLines 32768) (commonGridLines 32768)
      (rectangleField Finset.univ coarseGridRect (coarseOrbitWeight p)) := by
  have he : (fun f => ((phaseCoarseBoxes 32768 8 p.1.val p.2.val f).qrect 32768).real) =
      (fun f => coarseGridRect (coarseSymmetry p f)) := by
    funext f
    rw [phaseCoarseBoxes_eq_grid]
    rfl
  rw [he]
  exact mappedUnionMask_eq_commonField Finset.univ Finset.univ (coarseSymmetry p)
    coarseGridRect _ _ (Finset.subset_univ _) (fun p _ => coarseGridRect_endpoints p)
    coarseGridRect_separated

end NoThreeLine

#print axioms NoThreeLine.coarseUnion_eq_commonField
