import NoThreeLine.CapacityLowAssembly
import NoThreeLine.FrozenCapacityClockInput
import NoThreeLine.SpecifiedDirectionGamma16

/-! Actual accepted-mask G5 input, conditional only on the explicitly
listed finite row acceptance. Original masks and physical schedule are
retained; the all-height/type/direction transport is internal. -/
set_option autoImplicit false
set_option maxHeartbeats 1900000
noncomputable section
open scoped BigOperators
namespace NoThreeLine.FrozenCapacity
open FrozenReference AuxiliaryODE PrimitiveLines FiniteDirections FinitePhase
  GridChord SectionHeight BirthWitness

theorem outside_rootLine_capacity_of_rows (hrows : ∀ i : Fin 112, RowAccepted i)
    {n : ℕ} (p : Grid n) (L : RootBoardLineIndex p) (hL : ¬specified gamma16 L.val) :
    shellChord Finset.univ (fun i=>(cellRect i).real) capacityTypedWeight p
      (rootBoardLineDirection p L)/(2*(rootLineHeight p L:ℝ))≤
      (30549893891/38400000000:ℝ) := by
  have hh : 4≤rootLineHeight p L := by
    have hn := (specified_gamma16_iff_height p L).not.mp hL
    omega
  exact shell_outside_capacity_of_rows hrows p (rootBoardLineDirection p L)
    (rootBoardLineDirection_mem p L) hh

theorem acceptedOutsideInput_le_frozen_of_rows (hrows : ∀ i : Fin 112, RowAccepted i)
    {J n : ℕ} (sch : Schedule J) (hJ : 0<J)
    (a : Fin J→CheckedAcceptedPhase 32768 8) (index : Fin J→Fin 15348)
    (hm : ∀j,PhaseMatches (a j) (index j)) (hi : StrictMono index)
    (scale : ℝ) (hscale : 0≤scale)
    (hd : ∀j,sch.duration j≤scale*((phaseUnits (index j):ℝ)/100000000))
    (p : Grid n) (L : RootBoardLineIndex p) (hL : ¬specified gamma16 L.val) (hn : 0<n) :
    (∑q∈L.val.val.erase p,sch.cumulative
      (fun j=>acceptedProcessMasks (fun k=>(a k).phase) j q) sch.total)/(n:ℝ)≤
      scale*(30549893891/38400000000)+(scale*12312)/(n:ℝ) := by
  have hs : (∑q∈L.val.val.erase p,sch.cumulative
      (fun j=>acceptedProcessMasks (fun k=>(a k).phase) j q) sch.total)≤
      ∑q∈L.val.val,sch.cumulative
        (fun j=>acceptedProcessMasks (fun k=>(a k).phase) j q) sch.total := by
    apply Finset.sum_le_sum_of_subset_of_nonneg (Finset.erase_subset p L.val.val)
    intro q _ _
    exact (sch.cumulative_bounds _ (fun j=>acceptedProcessMasks_bounds _ j q)
      sch.total sch.total_nonneg).1
  calc
    _ ≤ (∑q∈L.val.val,sch.cumulative
        (fun j=>acceptedProcessMasks (fun k=>(a k).phase) j q) sch.total)/(n:ℝ) :=
      div_le_div_of_nonneg_right hs (by exact_mod_cast hn.le)
    _ ≤ scale*(shellChord Finset.univ (fun i=>(cellRect i).real) capacityTypedWeight p
        (rootBoardLineDirection p L)/(2*(rootLineHeight p L:ℝ)))+(scale*12312)/(n:ℝ) :=
      acceptedClockInput_le_frozenChord sch hJ a index hm hi scale hscale hd p L hn
    _ ≤ _ := add_le_add
      (mul_le_mul_of_nonneg_left (outside_rootLine_capacity_of_rows hrows p L hL) hscale) le_rfl

theorem acceptedOutsideSectionInput_le_frozen_of_rows (hrows : ∀ i : Fin 112, RowAccepted i)
    {J n : ℕ} (sch : Schedule J) (hJ : 0<J)
    (a : Fin J→CheckedAcceptedPhase 32768 8) (index : Fin J→Fin 15348)
    (hm : ∀j,PhaseMatches (a j) (index j)) (hi : StrictMono index)
    (scale : ℝ) (hscale : 0≤scale)
    (hd : ∀j,sch.duration j≤scale*((phaseUnits (index j):ℝ)/100000000))
    (B K rho : ℝ) (p : Grid n) (L : RootBoardLineIndex p)
    (hL : ¬specified gamma16 L.val) (hn : 0<n) :
    sectionScheduleInput (scheduleSharedPhases sch
      (acceptedProcessMasks (fun k=>(a k).phase)) (acceptedProcessMasks_bounds _)
      gamma16 B K rho) L.val p J≤
      scale*(30549893891/38400000000)+(scale*12312)/(n:ℝ) := by
  rw [schedule_section_input]
  exact acceptedOutsideInput_le_frozen_of_rows hrows sch hJ a index hm hi
    scale hscale hd p L hL hn

theorem frozen_outside_discrete_margin {n : ℕ} (hn : 1610950≤n) :
    (249/250:ℝ)*(30549893891/38400000000)+((249/250)*12312)/(n:ℝ)≤4/5 := by
  have hnR : (1610950:ℝ)≤n := by exact_mod_cast hn
  have hp : (0:ℝ)<n := by linarith
  apply (le_sub_iff_add_le').mp
  apply (div_le_iff₀ hp).mpr
  nlinarith

theorem acceptedOutsideSectionInput_le_four_fifths_of_rows
    (hrows : ∀ i : Fin 112, RowAccepted i) {J n : ℕ}
    (sch : Schedule J) (hJ : 0<J)
    (a : Fin J→CheckedAcceptedPhase 32768 8) (index : Fin J→Fin 15348)
    (hm : ∀j,PhaseMatches (a j) (index j)) (hi : StrictMono index)
    (hd : ∀j,sch.duration j≤(249/250)*((phaseUnits (index j):ℝ)/100000000))
    (B K rho : ℝ) (p : Grid n) (L : RootBoardLineIndex p)
    (hL : ¬specified gamma16 L.val) (hn : 1610950≤n) :
    sectionScheduleInput (scheduleSharedPhases sch
      (acceptedProcessMasks (fun k=>(a k).phase)) (acceptedProcessMasks_bounds _)
      gamma16 B K rho) L.val p J≤(4/5:ℝ) := by
  exact (acceptedOutsideSectionInput_le_frozen_of_rows hrows sch hJ a index hm hi
    (249/250) (by norm_num) hd B K rho p L hL (by omega)).trans
      (frozen_outside_discrete_margin hn)

end NoThreeLine.FrozenCapacity
#print axioms NoThreeLine.FrozenCapacity.outside_rootLine_capacity_of_rows
#print axioms NoThreeLine.FrozenCapacity.acceptedOutsideSectionInput_le_four_fifths_of_rows
