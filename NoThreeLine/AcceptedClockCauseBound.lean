import NoThreeLine.FiniteScheduleClockCause
import NoThreeLine.FrozenCapacityClockInput
import NoThreeLine.SpecifiedDirectionGamma16

/-! Transfer a fixed frozen chord capacity margin to the actual accepted
schedule, with the endpoint error and the strict binary-cell slack included. -/
set_option autoImplicit false
set_option maxHeartbeats 2000000
noncomputable section
open MeasureTheory
open scoped BigOperators
namespace NoThreeLine.FrozenCapacity
open FrozenReference AuxiliaryODE PrimitiveLines FiniteDirections FinitePhase
  GridChord SectionHeight SpecifiedBoardCount

theorem acceptedClockInput_margin {J n : ℕ} (sch : Schedule J) (hJ : 0<J)
    (a : Fin J→CheckedAcceptedPhase 32768 8) (index : Fin J→Fin 15348)
    (hm : ∀j,PhaseMatches (a j) (index j)) (hi : StrictMono index)
    (scale U lam : ℝ) (hscale : 0≤scale)
    (hd : ∀j,sch.duration j≤scale*((phaseUnits (index j):ℝ)/100000000))
    (hn : 0<n) (hmargin : scale*U+(scale*12312)/(n:ℝ)≤lam)
    (hcap : ∀ (p : Grid n) (L : RootBoardLineIndex p), rootLineHeight p L<4 →
      shellChord Finset.univ (fun i=>(cellRect i).real) capacityTypedWeight p
        (rootBoardLineDirection p L)/(2*(rootLineHeight p L:ℝ))≤U) :
    ∀L∈specifiedBoardLines n gamma16,
      (∑q∈L.val,sch.cumulative (fun j=>acceptedProcessMasks (fun k=>(a k).phase) j q) sch.total)/(n:ℝ)≤lam := by
  intro L hL
  have hsp : specified gamma16 L := (Finset.mem_filter.mp hL).2
  have hroot := hsp
  obtain ⟨p,hp,_⟩ := hroot
  let R : RootBoardLineIndex p := ⟨L,hp⟩
  have hh : rootLineHeight p R<4 := (specified_gamma16_iff_height p R).mp hsp
  have hc := acceptedClockInput_le_frozenChord sch hJ a index hm hi scale hscale hd p R hn
  exact hc.trans ((add_le_add (mul_le_mul_of_nonneg_left (hcap p R hh) hscale) le_rfl).trans hmargin)

theorem exists_uniform_acceptedClockSlack (scale U K T : ℝ)
    (hgap : scale*U<K) (hT : 0≤T) :
    ∃ lam δ : ℝ, 0<δ ∧ lam+T*δ<K ∧
      ∃ N : ℕ, 0<N ∧ ∀n≥N,scale*U+(scale*12312)/(n:ℝ)≤lam := by
  let lam := (scale*U+K)/2
  have hleft : scale*U<lam := by dsimp [lam]; linarith
  have hright : lam<K := by dsimp [lam]; linarith
  obtain ⟨δ,hδ,hδK⟩ := exists_strictClockSlack T lam K hT hright
  let C := scale*12312
  obtain ⟨k,hk⟩ := exists_nat_gt (C/(lam-scale*U))
  refine ⟨lam,δ,hδ,hδK,k+1,Nat.succ_pos _,?_⟩
  intro n hn
  have hnR : (0:ℝ)<n := by exact_mod_cast (Nat.succ_pos k).trans_le hn
  have hkn : (k:ℝ)≤n := by exact_mod_cast (Nat.le_succ k).trans hn
  have hC : C≤(lam-scale*U)*(n:ℝ) := by
    have hprod := (div_le_iff₀ (sub_pos.mpr hleft)).mp (hk.le.trans hkn)
    linarith
  have he : C/(n:ℝ)≤lam-scale*U := (div_le_iff₀ hnR).mpr hC
  change scale*U+C/(n:ℝ)≤lam
  linarith

theorem accepted_clockCause_point_real_le {J n : ℕ} (sch : Schedule J) (hJ : 0<J)
    (a : Fin J→CheckedAcceptedPhase 32768 8) (index : Fin J→Fin 15348)
    (hm : ∀j,PhaseMatches (a j) (index j)) (hi : StrictMono index)
    (scale U B K ρ ε M T lam δ : ℝ) (hscale : 0≤scale)
    (hd : ∀j,sch.duration j≤scale*((phaseUnits (index j):ℝ)/100000000))
    (hn : 0<n) (hB : 1≤B) (hK : K<2) (hδ : 0≤δ) (hT : sch.total≤T)
    (hgap : lam+T*δ<K) (hmargin : scale*U+(scale*12312)/(n:ℝ)≤lam)
    (hcap : ∀ (p : Grid n) (L : RootBoardLineIndex p), rootLineHeight p L<4 →
      shellChord Finset.univ (fun i=>(cellRect i).real) capacityTypedWeight p
        (rootBoardLineDirection p L)/(2*(rootLineHeight p L:ℝ))≤U)
    (p : Grid n) (tail : ℝ) (htail : 0≤tail) :
    let mask := acceptedProcessMasks (fun j=>(a j).phase)
    let cs := scheduleSharedPhases sch mask (acceptedProcessMasks_bounds _) gamma16 B K ρ
    let d := scheduleProcessDeadline sch mask
    (∀L∈specifiedBoardLines n gamma16,
      scheduledClockCellCrossingBound cs ε M K d 0 L hn hB δ J≤tail) →
    (phasePointMeasure cs ε M d 0 hn hB p J).real
      (scheduledBoundaryCauseBefore cs ε M d 0 hn (augInitialState B hB d 0) p .clock J)≤
      B*((n:ℝ)*lineCountConstant gamma16)*tail := by
  intro mask cs d hline
  exact schedule_clockCause_point_real_le sch mask (acceptedProcessMasks_bounds _)
    (fun j q=>(a j).phase.boardInput_binary q) gamma16 B K ρ ε M T lam δ hn hB hK hδ hT hgap
    (acceptedClockInput_margin sch hJ a index hm hi scale U lam hscale hd hn hmargin hcap)
    p tail htail hline

end NoThreeLine.FrozenCapacity

#print axioms NoThreeLine.FrozenCapacity.acceptedClockInput_margin
#print axioms NoThreeLine.FrozenCapacity.exists_uniform_acceptedClockSlack
#print axioms NoThreeLine.FrozenCapacity.accepted_clockCause_point_real_le

