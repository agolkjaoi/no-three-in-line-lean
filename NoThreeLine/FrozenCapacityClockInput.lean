import NoThreeLine.SpecifiedClockChordInput
import NoThreeLine.CapacityTypedField
import NoThreeLine.CapacityHighTail
import NoThreeLine.AcceptedScheduleProcess

/-! The actual accepted schedule is bounded by the complete frozen field
before the full specified-line input is transferred through G13. -/
set_option autoImplicit false
set_option maxHeartbeats 1900000
noncomputable section
open scoped BigOperators
namespace NoThreeLine.FrozenCapacity
open FrozenReference AuxiliaryODE PrimitiveLines FiniteDirections FinitePhase
  GridArea GridChord SectionHeight

theorem fullPrefix_type_le (r : Fin 4) (x y : ℝ) :
    fullPhasePrefix 15347 r x y≤typeField r x y := by
  rw [←erased_typeField_eq]
  classical
  unfold eraseGrid
  split_ifs
  · exact typeField_nonneg r x y
  · exact le_rfl

theorem capacityTypedWeight_abs_le (z : ZPoint) (i : Fin 256) :
    |capacityTypedWeight z i|≤12 := by
  let r := codeZ z
  let s : Fin 4 := if r=0 then 1 else 0
  have hrs : r≠s := by
    by_cases h : r=0 <;> simp [s,h]
  have hr : (0:ℝ)≤cellUnits r i := by exact_mod_cast cellUnits_nonneg r i
  have hs : (0:ℝ)≤cellUnits s i := by exact_mod_cast cellUnits_nonneg s i
  have hb := (pairWeight_bounds r s hrs i).2
  rw [pairWeight] at hb
  push_cast at hb
  change |(cellUnits r i:ℝ)/100000000|≤12
  rw [abs_of_nonneg (div_nonneg hr (by norm_num))]
  linarith

theorem acceptedProcessCumulative_le_typedField {J n : ℕ} (sch : Schedule J) (hJ : 0<J)
    (a : Fin J→CheckedAcceptedPhase 32768 8) (index : Fin J→Fin 15348)
    (hm : ∀j,PhaseMatches (a j) (index j)) (hi : StrictMono index)
    (scale : ℝ) (hscale : 0≤scale)
    (hd : ∀j,sch.duration j≤scale*((phaseUnits (index j):ℝ)/100000000))
    (q : Grid n) :
    sch.cumulative (fun j=>acceptedProcessMasks (fun k=>(a k).phase) j q) sch.total≤
      scale*typedBoardWeight Finset.univ (fun i=>(cellRect i).real) capacityTypedWeight q := by
  let k : Fin J := ⟨J-1,by omega⟩
  have hk : k.succ=Fin.last J := by
    apply Fin.ext
    simp only [Fin.val_succ,Fin.val_last,k]
    omega
  have hlast : index k≤(15347:Fin 15348) := by
    have := (index k).isLt
    change (index k).val≤15347
    omega
  have ht : sch.total≤sch.hi k := by rw [Schedule.total,Schedule.hi,hk]
  let r := typeCode (pointType q)
  let x := normX n (gridEmbed q)
  let y := normY n (gridEmbed q)
  have hb := acceptedPrefix_le_fullPhasePrefix sch a index hm hi scale hscale hd k 15347 hlast
    sch.total sch.total_nonneg ht r x y
  change sch.acceptedPrefix (fun j=>(a j).phase) 32768 (commonGridLines 32768)
    (commonGridLines 32768) sch.total r x y ≤ _
  refine hb.trans ?_
  have hfield : typedBoardWeight Finset.univ (fun i=>(cellRect i).real) capacityTypedWeight q =
      typeField r x y := by
    unfold typedBoardWeight capacityTypedWeight typeField
    rw [codeZ_grid_parity]
  rw [hfield]
  exact mul_le_mul_of_nonneg_left (fullPrefix_type_le r x y) hscale

theorem acceptedClockInput_le_frozenChord {J n : ℕ} (sch : Schedule J) (hJ : 0<J)
    (a : Fin J→CheckedAcceptedPhase 32768 8) (index : Fin J→Fin 15348)
    (hm : ∀j,PhaseMatches (a j) (index j)) (hi : StrictMono index)
    (scale : ℝ) (hscale : 0≤scale)
    (hd : ∀j,sch.duration j≤scale*((phaseUnits (index j):ℝ)/100000000))
    (p : Grid n) (L : RootBoardLineIndex p) (hn : 0<n) :
    (∑q∈L.val.val,sch.cumulative (fun j=>acceptedProcessMasks (fun k=>(a k).phase) j q) sch.total)/(n:ℝ)≤
      scale*(shellChord Finset.univ (fun i=>(cellRect i).real) capacityTypedWeight p
        (rootBoardLineDirection p L)/(2*(rootLineHeight p L:ℝ)))+(scale*12312)/(n:ℝ) := by
  have hb := fullLineInput_le_scaled_chord Finset.univ (fun i=>(cellRect i).real) capacityTypedWeight p L
    (fun q=>sch.cumulative (fun j=>acceptedProcessMasks (fun k=>(a k).phase) j q) sch.total)
    12 scale hn (by norm_num) hscale cellRect_separated (fun z i _=>capacityTypedWeight_abs_le z i)
    (fun i _=>cellRect_inUnit i)
    (fun q _=>acceptedProcessCumulative_le_typedField sch hJ a index hm hi scale hscale hd q)
  norm_num at hb
  exact hb

end NoThreeLine.FrozenCapacity

#print axioms NoThreeLine.FrozenCapacity.acceptedProcessCumulative_le_typedField
#print axioms NoThreeLine.FrozenCapacity.acceptedClockInput_le_frozenChord

