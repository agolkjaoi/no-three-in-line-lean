import NoThreeLine.CanonicalClockFinitePhaseCause
import NoThreeLine.RootBoardLineBudget
import NoThreeLine.GridLineCard
import NoThreeLine.ScheduleProcessBridge

/-! A specified mask cell has a linear cap and each actual phase
horizon is bounded by the finite schedule total. -/
set_option autoImplicit false
set_option maxHeartbeats 2000000
noncomputable section
open scoped BigOperators
namespace NoThreeLine
open AuxiliaryODE BirthWitness PrimitiveLines FiniteDirections GridLineCard

theorem specified_line_card_le_side {n : ℕ} (hn : 0<n)
    (Γ : Finset ZPoint) (L : LineIndex n) (hsp : specified Γ L) :
    L.val.card≤n := by
  classical
  obtain ⟨p,hp,_⟩ := hsp
  let R : RootBoardLineIndex p := ⟨L,hp⟩
  let v := rootBoardLineDirection p R
  have hmem := rootBoardLineDirection_mem p R
  have hs : v.2∈primitiveShell v.1 := (Finset.mem_sigma.mp hmem).2
  have hv : Primitive v.2 := by
    unfold primitiveShell at hs
    exact (Finset.mem_filter.mp hs).2
  change R.val.val.card≤n
  rw [rootBoardLineDirection_line]
  exact (gridLine_card_le n (gridEmbed p) v.2 hv).trans (by
    have h := Nat.div_le_self (n-1) (height v.2)
    omega)

theorem clockMaskCellCap_le_linear {n : ℕ} {B : ℝ} (hn : 0<n)
    (cs : ℕ→SharedPhase n B) (Γ : Finset ZPoint) (L : LineIndex n) (hsp : specified Γ L)
    (δ : ℝ) (J : ℕ) (i : Fin J) :
    clockMaskCellCap cs L δ J i≤(1+δ)*n := by
  have h := (Finset.card_le_card (Finset.inter_subset_left :
    L.val∩clockMaskCells cs J i⊆L.val)).trans (specified_line_card_le_side hn Γ L hsp)
  have hc : ((L.val∩clockMaskCells cs J i).card:ℝ)≤n := by exact_mod_cast h
  unfold clockMaskCellCap
  linarith

theorem scheduleSharedPhases_horizon_le_total {n J : ℕ} (sch : FinitePhase.Schedule J)
    (mask : Fin J→Grid n→ℝ) (hm : ∀j p,0≤mask j p ∧ mask j p≤1)
    (Γ : Finset ZPoint) (B K ρ : ℝ) (j : ℕ) (hj : j<J) :
    ((scheduleSharedPhases sch mask hm Γ B K ρ j).horizon:ℝ)≤sch.total := by
  rw [←scheduleSharedPhases_total sch mask hm Γ B K ρ,phaseEndpoint,zero_add,NNReal.coe_sum]
  exact Finset.single_le_sum (fun i _=>(scheduleSharedPhases sch mask hm Γ B K ρ i).horizon.coe_nonneg)
    (Finset.mem_range.mpr hj)

end NoThreeLine

#print axioms NoThreeLine.clockMaskCellCap_le_linear
#print axioms NoThreeLine.scheduleSharedPhases_horizon_le_total

