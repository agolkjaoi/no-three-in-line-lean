import NoThreeLine.SectionHeightBounds
import NoThreeLine.SpecifiedBoardLineCount

/-! The frozen designated family consists exactly of primitive line
directions of height at most three. This is checked on actual board lines. -/
set_option autoImplicit false
set_option maxHeartbeats 1500000
noncomputable section
namespace NoThreeLine
open AuxiliaryODE PrimitiveLines GridLines LineDrift FiniteDirections GridLineCard SectionHeight

def gamma16 : Finset ZPoint := (directionIndices 4).image Sigma.snd

theorem specified_gamma16_iff_height {n : ℕ} (p : Grid n) (L : RootBoardLineIndex p) :
    specified gamma16 L.val ↔ rootLineHeight p L<4 := by
  classical
  let e := rootBoardLineDirection p L
  have he := Finset.mem_sigma.mp (rootBoardLineDirection_mem p L)
  have hpos := (Finset.mem_Ico.mp he.1).1
  have hep : Primitive e.2 := (Finset.mem_filter.mp he.2).2
  have hel : L.val.val=directionLine p e.2 := rootBoardLineDirection_line p L
  obtain ⟨q,hq,hpq⟩ := boardLine_has_other L.val p
  rw [specified_iff_designated gamma16 p L.val L.property]
  constructor
  · intro hspec
    obtain ⟨d,hd,hdl⟩ := Finset.mem_image.mp (Finset.mem_inter.mp hspec).1
    obtain ⟨d',hd',rfl⟩ := Finset.mem_image.mp (Finset.mem_filter.mp hd).1
    have hdm := Finset.mem_sigma.mp hd'
    have hdh : height d'.2=d'.1 := height_eq_of_mem_shell _ _ hdm.2
    have hqD : q∈directionLine p d'.2 := hdl.symm ▸ hq
    have hqE : q∈directionLine p e.2 := hel ▸ hq
    have hq0 := grid_difference_ne_zero p q hpq
    have hd0 : d'.2≠(0,0) := (Finset.mem_filter.mp hd).2
    have hdetD := (mem_gridLinePoints (gridEmbed p) d'.2 q).mp hqD
    have hdetE := (mem_gridLinePoints (gridEmbed p) e.2 q).mp hqE
    have hr := det_parallel_trans (gridEmbed q-gridEmbed p) e.2 d'.2
      hq0 (by rw [det_swap _ e.2,hdetE,neg_zero]) (by rw [det_swap _ d'.2,hdetD,neg_zero])
    have hx := linePoint_parameter (0,0) e.2 d'.2 hep (by
      change det e.2 (d'.2-0)=0
      simpa only [sub_zero] using hr)
    let k := parameter (0,0) e.2 d'.2
    change d'.2=linePoint (0,0) e.2 k at hx
    have hk : k≠0 := fun h=>hd0 (by simpa [h,linePoint] using hx)
    have hk1 : 1≤k.natAbs := Int.natAbs_pos.mpr hk
    have hd₁ : d'.2.1.natAbs=k.natAbs*e.2.1.natAbs := by
      simpa [linePoint,Int.natAbs_mul] using congrArg (fun z : ZPoint=>z.1.natAbs) hx
    have hd₂ : d'.2.2.natAbs=k.natAbs*e.2.2.natAbs := by
      simpa [linePoint,Int.natAbs_mul] using congrArg (fun z : ZPoint=>z.2.natAbs) hx
    have hle : height e.2≤height d'.2 := by
      apply max_le
      · exact (by simpa [hd₁] using Nat.mul_le_mul_right e.2.1.natAbs hk1 :
          e.2.1.natAbs≤d'.2.1.natAbs).trans (le_max_left _ _)
      · exact (by simpa [hd₂] using Nat.mul_le_mul_right e.2.2.natAbs hk1 :
          e.2.2.natAbs≤d'.2.2.natAbs).trans (le_max_right _ _)
    change e.1<4
    rw [height_eq_of_mem_shell _ _ he.2,hdh] at hle
    exact lt_of_le_of_lt hle (Finset.mem_Ico.mp hdm.1).2
  · intro h
    have h4 : e∈directionIndices 4 :=
      Finset.mem_sigma.mpr ⟨Finset.mem_Ico.mpr ⟨hpos,h⟩,he.2⟩
    refine Finset.mem_inter.mpr ⟨?_,?_⟩
    · exact Finset.mem_image.mpr ⟨e.2,
        Finset.mem_filter.mpr ⟨Finset.mem_image.mpr ⟨e,h4,rfl⟩,primitive_ne_zero _ hep⟩,hel.symm⟩
    · rw [MixedConnection.boardLine_eq L.val p q L.property hq hpq]
      exact lineThrough_mem_linesThrough p q hpq

end NoThreeLine

#print axioms NoThreeLine.specified_gamma16_iff_height

