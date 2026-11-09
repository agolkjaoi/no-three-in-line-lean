import NoThreeLine.ScheduleTagInput
import NoThreeLine.ScheduleGeometry

/-! The remaining deterministic low-height line input is reduced to the
actual cumulative rectangle chord with the proved G13 endpoint error.
Grid erasure is only used as a one-sided discrete comparison. -/
set_option autoImplicit false
set_option maxHeartbeats 1800000
noncomputable section
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines FiniteDirections GridChord FinitePhase SectionHeight

theorem masked_rootLine_input_le_chord {ι : Type*} {n : ℕ}
    (S : Finset ι) (R : ι→Rect) (w : ZPoint→ι→ℝ) (V H : Finset ℝ)
    (p : Grid n) (L : RootBoardLineIndex p) (M : ℝ) (hn : 0<n) (hM : 0≤M)
    (hsep : RectanglesSeparated S R) (hw : ∀r i,i∈S→0≤w r i ∧ w r i≤M)
    (hR : ∀i∈S,(R i).InUnitSquare) :
    (∑q∈L.val.val.erase p,maskedTypedBoardWeight S R w V H q)/(n:ℝ) ≤
      shellChord S R w p (rootBoardLineDirection p L)/(2*(rootLineHeight p L:ℝ))+
        ((4*S.card+1)*M)/(n:ℝ) := by
  have hnR : (0:ℝ)<n := by exact_mod_cast hn
  have hsum : (∑q∈L.val.val.erase p,maskedTypedBoardWeight S R w V H q) ≤
      typedGridLineSum S R w p (rootBoardLineDirection p L).2 := by
    rw [rootBoardLineDirection_line]
    apply Finset.sum_le_sum
    intro q _
    exact (maskedTypedBoardWeight_bounds S R w V H q
      (rectangleField_point_bounds S R _ M _ _ hM hsep (hw _)).1).2
  have hg := shellChord_G13 S R w p (rootBoardLineDirection p L) M
    (rootBoardLineDirection_mem p L) hn
    (fun i hi=>⟨(hR i hi).1,(hR i hi).2.2.1,(hR i hi).2.2.2.1,(hR i hi).2.2.2.2.2⟩)
    (fun i hi j hj hij x y=>(R i).separated_not_both_contains (R j) x y (hsep i hi j hj hij))
    hM (fun r i hi=>by rw [abs_of_nonneg (hw r i hi).1]; exact (hw r i hi).2)
  have hupper := (abs_le.mp hg).2
  calc
    _ ≤ typedGridLineSum S R w p (rootBoardLineDirection p L).2/(n:ℝ) :=
      div_le_div_of_nonneg_right hsum hnR.le
    _ ≤ ((n:ℝ)/(2*((rootBoardLineDirection p L).1:ℝ))*
        shellChord S R w p (rootBoardLineDirection p L)+(4*S.card+1)*M)/(n:ℝ) :=
      div_le_div_of_nonneg_right (by linarith) hnR.le
    _ = _ := by unfold rootLineHeight; field_simp <;> ring

theorem schedule_section_input_le_chord {ι : Type*} {J n : ℕ}
    (s : Schedule J) (S : Finset ι) (R : ι→Rect) (c : Fin J→ZPoint→ι→ℝ)
    (V H : Finset ℝ) (hm : ∀j q,0≤maskedTypedBoardWeight S R (c j) V H q ∧
      maskedTypedBoardWeight S R (c j) V H q≤1)
    (Γ : Finset ZPoint) (B K ρ : ℝ) (p : Grid n) (L : RootBoardLineIndex p)
    (hn : 0<n) (hsep : RectanglesSeparated S R)
    (hc : ∀j r i,i∈S→0≤c j r i ∧ c j r i≤1) (hR : ∀i∈S,(R i).InUnitSquare) :
    sectionScheduleInput (scheduleSharedPhases s
      (fun j=>maskedTypedBoardWeight S R (c j) V H) hm Γ B K ρ) L.val p J ≤
      shellChord S R (s.prefixWeights c s.total) p (rootBoardLineDirection p L)/
        (2*(rootLineHeight p L:ℝ))+((4*S.card+1)*s.total)/(n:ℝ) := by
  rw [schedule_section_input]
  simp_rw [s.integral_phaseBoard S R c V H _ s.total s.total_nonneg]
  exact masked_rootLine_input_le_chord S R (s.prefixWeights c s.total) V H p L s.total hn
    s.total_nonneg hsep (s.prefixWeights_bounds S c hc s.total s.total_nonneg le_rfl) hR

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.masked_rootLine_input_le_chord
#print axioms NoThreeLine.BirthWitness.schedule_section_input_le_chord
