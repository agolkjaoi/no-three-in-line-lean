import NoThreeLine.CanonicalClockFinitePhaseCause
import NoThreeLine.FrozenSpecifiedClockBound

/-! Insert the frozen specified-line capacity and exact direction count
in the finite-phase reduction of the actual point clock cause. -/
set_option autoImplicit false
set_option maxHeartbeats 2200000
noncomputable section
open MeasureTheory
open scoped BigOperators
namespace NoThreeLine.FrozenCapacity
open FrozenReference AuxiliaryODE PrimitiveLines FiniteDirections FinitePhase
  GridChord SectionHeight SpecifiedBoardCount

theorem accepted_frozen_clockCause_point_real_le_of_phase {J n : ℕ} (sch : Schedule J) (hJ : 0<J)
    (a : Fin J→CheckedAcceptedPhase 32768 8) (index : Fin J→Fin 15348)
    (hm : ∀j,PhaseMatches (a j) (index j)) (hi : StrictMono index)
    (B ρ ε M T lam δ : ℝ) (hε : 0<ε) (hM : 0<M)
    (hd : ∀j,sch.duration j≤(249/250)*((phaseUnits (index j):ℝ)/100000000))
    (hn : 0<n) (hB : 1≤B) (hδ : 0≤δ) (hT : sch.total≤T) (hgap : lam+T*δ<255/128)
    (hmargin : (249/250)*(639781503/320000000)+((249/250)*12312)/(n:ℝ)≤lam)
    (p : Grid n) (tail : ℝ) (htail : 0≤tail) :
    let mask := acceptedProcessMasks (fun j=>(a j).phase)
    let cs := scheduleSharedPhases sch mask (acceptedProcessMasks_bounds _) gamma16 B (255/128) ρ
    let d := scheduleProcessDeadline sch mask
    (∀L∈specifiedBoardLines n gamma16,∀i,
      canonicalClockCellPhaseTails cs ε M (255/128) L hn δ J i tail) →
    (phasePointMeasure cs ε M d 0 hn hB p J).real
      (scheduledBoundaryCauseBefore cs ε M d 0 hn (augInitialState B hB d 0) p .clock J)≤
    B*((n:ℝ)*124)*((J:ℝ)*
      ((2/(2-255/128))^2*(J:ℝ)*tail+(tail+(2/(2-255/128))^2*((J-1:ℕ):ℝ)*tail))) := by
  intro mask cs d hphase
  have hKcfg (j : ℕ) : (cs j).K=255/128 := by
    dsimp only [cs,scheduleSharedPhases]
    split <;> rfl
  have hbinary (j : ℕ) (hj : j<J) (q : Grid n) :
      (cs j).mask q=0 ∨ (cs j).mask q=1 := by
    change (scheduleSharedPhases sch mask (acceptedProcessMasks_bounds _) gamma16 B (255/128) ρ
      (⟨j,hj⟩:Fin J).val).mask q=0 ∨ _
    rw [scheduleSharedPhases_mask]
    exact (a ⟨j,hj⟩).phase.boardInput_binary q
  have hinput := acceptedClockInput_margin sch hJ a index hm hi (249/250) (639781503/320000000)
    lam (by norm_num) hd hn hmargin frozen_specified_chord_capacity
  have hbudget (L : LineIndex n) (hL : L∈specifiedBoardLines n gamma16) :
      specifiedClockScheduleInput cs L J+(phaseEndpoint cs 0 J-0)*δ<255/128 := by
    change specifiedClockScheduleInput (scheduleSharedPhases sch mask (acceptedProcessMasks_bounds _) gamma16 B
      (255/128) ρ) L J+(phaseEndpoint (scheduleSharedPhases sch mask (acceptedProcessMasks_bounds _) gamma16 B
      (255/128) ρ) 0 J-0)*δ<255/128
    rw [schedule_specifiedClockInput,scheduleSharedPhases_total,sub_zero]
    exact (add_le_add (hinput L hL) (mul_le_mul_of_nonneg_right hT hδ)).trans_lt hgap
  have hΓ (j : ℕ) : (cs j).directions=gamma16 :=
    scheduleSharedPhases_directions sch mask (acceptedProcessMasks_bounds _) gamma16 B (255/128) ρ j
  have h := canonicalScheduledClockCause_point_real_le_of_phase cs ε M (255/128) hε hM d 0 p hn hB
    gamma16 δ J hJ hΓ hKcfg (by norm_num) (by norm_num) hδ hbinary hbudget tail htail hphase
  simpa only [gamma16_card_and_lineCount.2,Nat.cast_ofNat] using h

end NoThreeLine.FrozenCapacity

#print axioms NoThreeLine.FrozenCapacity.accepted_frozen_clockCause_point_real_le_of_phase

