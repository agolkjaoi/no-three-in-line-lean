import NoThreeLine.ScheduleSpecifiedClockInput
import NoThreeLine.SectionChordInput

/-! The full line input uses the existing G13 estimate for the erased
root sum, together with a separate bound for the one restored root. -/
set_option autoImplicit false
set_option maxHeartbeats 1750000
noncomputable section
open scoped BigOperators
namespace NoThreeLine
open AuxiliaryODE PrimitiveLines FiniteDirections GridChord FinitePhase SectionHeight

theorem fullLineInput_le_scaled_chord {ι : Type*} {n : ℕ}
    (S : Finset ι) (R : ι→Rect) (w : ZPoint→ι→ℝ)
    (p : Grid n) (L : RootBoardLineIndex p) (u : Grid n→ℝ) (M scale : ℝ)
    (hn : 0<n) (hM : 0≤M) (hscale : 0≤scale)
    (hsep : RectanglesSeparated S R) (hw : ∀r i,i∈S→|w r i|≤M)
    (hR : ∀i∈S,(R i).InUnitSquare)
    (hu : ∀q∈L.val.val,u q≤scale*typedBoardWeight S R w q) :
    (∑q∈L.val.val,u q)/(n:ℝ)≤
      scale*(shellChord S R w p (rootBoardLineDirection p L)/(2*(rootLineHeight p L:ℝ)))+
        (scale*((4*S.card+2)*M))/(n:ℝ) := by
  classical
  let d := rootBoardLineDirection p L
  have hnR : (0:ℝ)<n := by exact_mod_cast hn
  have hp : u p≤scale*M := (hu p L.property).trans (mul_le_mul_of_nonneg_left
    ((abs_le.mp (rectangleField_abs_le S R _ M hM
      (fun i hi j hj hij x y=>(R i).separated_not_both_contains (R j) x y (hsep i hi j hj hij))
      (hw _) _ _)).2) hscale)
  have hsum : (∑q∈L.val.val.erase p,u q)≤scale*typedGridLineSum S R w p d.2 := by
    rw [typedGridLineSum,Finset.mul_sum]
    change (∑q∈L.val.val.erase p,u q)≤
      ∑q∈(gridLinePoints n (gridEmbed p) d.2).erase p,scale*typedBoardWeight S R w q
    rw [←rootBoardLineDirection_line p L]
    exact Finset.sum_le_sum (fun q hq=>hu q (Finset.mem_of_mem_erase hq))
  have hg := (abs_le.mp (shellChord_G13 S R w p d M (rootBoardLineDirection_mem p L) hn
    (fun i hi=>⟨(hR i hi).1,(hR i hi).2.2.1,(hR i hi).2.2.2.1,(hR i hi).2.2.2.2.2⟩)
    (fun i hi j hj hij x y=>(R i).separated_not_both_contains (R j) x y (hsep i hi j hj hij))
    hM hw)).2
  rw [←Finset.sum_erase_add _ u L.property]
  calc
    _ ≤ (scale*typedGridLineSum S R w p d.2+scale*M)/(n:ℝ) :=
      div_le_div_of_nonneg_right (add_le_add hsum hp) hnR.le
    _ ≤ (scale*((n:ℝ)/(2*(d.1:ℝ))*shellChord S R w p d+(4*S.card+1)*M)+scale*M)/(n:ℝ) :=
      div_le_div_of_nonneg_right (add_le_add
        (mul_le_mul_of_nonneg_left (by linarith) hscale) le_rfl) hnR.le
    _ = _ := by
      change _ = scale*(shellChord S R w p d/(2*(d.1:ℝ)))+(scale*((4*S.card+2)*M))/(n:ℝ)
      field_simp [hnR.ne'] <;> ring

end NoThreeLine

#print axioms NoThreeLine.fullLineInput_le_scaled_chord

