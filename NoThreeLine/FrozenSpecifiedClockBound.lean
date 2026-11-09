import NoThreeLine.CapacityAxisShell
import NoThreeLine.SpecifiedNonaxisCapacityCoverage
import NoThreeLine.SpecifiedClockFrozenParameters

/-! Both axis and nonaxis capacity checks cover every specified board line.
The accepted schedule uses the frozen shortening and the original threshold. -/
set_option autoImplicit false
set_option maxHeartbeats 2000000
noncomputable section
open MeasureTheory
open scoped BigOperators
namespace NoThreeLine.FrozenCapacity
open FrozenReference AuxiliaryODE PrimitiveLines FiniteDirections FinitePhase
  GridChord SectionHeight SpecifiedBoardCount

theorem frozen_specified_chord_capacity {n : ℕ} (p : Grid n) (L : RootBoardLineIndex p)
    (hh : rootLineHeight p L<4) :
    shellChord Finset.univ (fun i=>(cellRect i).real) capacityTypedWeight p
      (rootBoardLineDirection p L)/(2*(rootLineHeight p L:ℝ))≤(639781503/320000000:ℝ) := by
  let d := rootBoardLineDirection p L
  have hd : d∈directionIndices n := rootBoardLineDirection_mem p L
  by_cases ha : d.2.1=0 ∨ d.2.2=0
  · exact shell_axis_capacity p d hd ha
  · obtain ⟨hx,hy⟩ := not_or.mp ha
    exact (specifiedNonaxis_shellChord_capacity p d hd hh hx hy).trans (by norm_num)

theorem accepted_frozen_clockCause_point_real_le {J n : ℕ} (sch : Schedule J) (hJ : 0<J)
    (a : Fin J→CheckedAcceptedPhase 32768 8) (index : Fin J→Fin 15348)
    (hm : ∀j,PhaseMatches (a j) (index j)) (hi : StrictMono index)
    (B ρ ε M T lam δ : ℝ)
    (hd : ∀j,sch.duration j≤(249/250)*((phaseUnits (index j):ℝ)/100000000))
    (hn : 0<n) (hB : 1≤B) (hδ : 0≤δ) (hT : sch.total≤T) (hgap : lam+T*δ<255/128)
    (hmargin : (249/250)*(639781503/320000000)+((249/250)*12312)/(n:ℝ)≤lam)
    (p : Grid n) (tail : ℝ) (htail : 0≤tail) :
    let mask := acceptedProcessMasks (fun j=>(a j).phase)
    let cs := scheduleSharedPhases sch mask (acceptedProcessMasks_bounds _) gamma16 B (255/128) ρ
    let d := scheduleProcessDeadline sch mask
    (∀L∈specifiedBoardLines n gamma16,
      scheduledClockCellCrossingBound cs ε M (255/128) d 0 L hn hB δ J≤tail) →
    (phasePointMeasure cs ε M d 0 hn hB p J).real
      (scheduledBoundaryCauseBefore cs ε M d 0 hn (augInitialState B hB d 0) p .clock J)≤
      B*((n:ℝ)*124)*tail := by
  intro mask cs d hline
  have h := accepted_clockCause_point_real_le sch hJ a index hm hi (249/250) (639781503/320000000)
    B (255/128) ρ ε M T lam δ (by norm_num) hd hn hB (by norm_num) hδ hT hgap hmargin
    frozen_specified_chord_capacity p tail htail hline
  simpa only [gamma16_card_and_lineCount.2,Nat.cast_ofNat] using h

end NoThreeLine.FrozenCapacity

#print axioms NoThreeLine.FrozenCapacity.frozen_specified_chord_capacity
#print axioms NoThreeLine.FrozenCapacity.accepted_frozen_clockCause_point_real_le

