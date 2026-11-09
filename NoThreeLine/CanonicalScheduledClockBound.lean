import NoThreeLine.ProtectedScheduledInitial
import NoThreeLine.ScheduledActualClockStop
import NoThreeLine.SpecifiedClockBinaryBudget
import NoThreeLine.PointDensityCap

/-! Canonical original-board and saved point-law bounds for an actual clock stop. -/
set_option autoImplicit false
set_option maxHeartbeats 2200000
noncomputable section
open MeasureTheory ProbabilityTheory
open scoped BigOperators
namespace NoThreeLine
open AuxiliaryODE BirthWitness PrimitiveLines SpecifiedBoardCount

def scheduledClockCellCrossingBound {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n)
    (hn : 0<n) (hB : 1≤B) (δ : ℝ) (J : ℕ) : ℝ :=
  let s := protectedScheduleInitial B hB L deadline start
  ∑ i : Fin J,
    let D := L.val∩clockMaskCells cs J i
    let cap := clockMaskCellCap cs L δ J i
    (scheduledLineForbiddenLaw cs ε M K deadline start hn L 0 s.1 J).real
      (scheduledProtectedExceedance cs ε M deadline start L 0 D id hn cap J s)+
    (scheduledLineRestartLaw cs ε M K deadline start L hn J s).real
      (scheduledProtectedExceedance cs ε M deadline start L 1 D id hn cap J s)

theorem canonicalScheduledClock_threshold_le {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (δ : ℝ) (J : ℕ)
    (hKcfg : ∀j,(cs j).K≤K) (hK : K<2) (hsp : ∀j,specified (cs j).directions L)
    (hδ : 0≤δ) (hbin : ∀j<J,∀q,(cs j).mask q=0 ∨ (cs j).mask q=1)
    (hbudget : specifiedClockScheduleInput cs L J+(phaseEndpoint cs start J-start)*δ<K) :
    (boardClockMeasure n (B/n)).real
      (scheduledSpecifiedClockThreshold cs ε M K deadline start hn
        (augInitialState B hB deadline start) L J)≤
      scheduledClockCellCrossingBound cs ε M K deadline start L hn hB δ J := by
  let s := protectedScheduleInitial B hB L deadline start
  have hpos : 0<B := zero_lt_one.trans_le hB
  have hphys : s.1=augInitialState B hB deadline start := rfl
  have ho : occupancy s.1.val.physical.process L=0 := by
    rw [hphys]
    simp only [occupancy,augInitialState_selected,Finset.empty_inter,Finset.card_empty]
  have hs0 : s.1.val.physical.clocks L=0 := by
    rw [hphys,augInitialState,augValidDeadlineRetirement_clocks]
    rfl
  have hsv (q : Grid n) (hq : q∈L.val) : 0≤s.2.1 q ∧ s.2.1 q≤2*B :=
    protectedDeadlineBook_saved_bounds L (cs 0).directions (hsp 0) q hq deadline start _
      ⟨le_rfl,mul_nonneg (by norm_num) hpos.le⟩
  refine scheduledProtectedClock_threshold_le cs ε M K deadline start L p hn hpos J s
    hKcfg hK hsp ho hsv (clockMaskCells cs J) clockMaskCellWeight (clockMaskCellCap cs L δ J)
    clockMaskCellWeight_nonneg (clockMaskCellCap_nonneg cs L δ hδ J)
    (clockMaskCells_decomposition cs J hbin) ?_
  rw [hs0,zero_add,clockMaskCells_budget_eq cs L hn δ start J hbin]
  exact hbudget

theorem canonicalScheduledActualClockHit_real_le {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n)
    (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (δ : ℝ) (J : ℕ)
    (hΓ : ∀j,(cs j).directions=Γ) (hKcfg : ∀j,(cs j).K=K) (hK : K<2) (hδ : 0≤δ)
    (hbin : ∀j<J,∀q,(cs j).mask q=0 ∨ (cs j).mask q=1)
    (hbudget : ∀L∈specifiedBoardLines n Γ,
      specifiedClockScheduleInput cs L J+(phaseEndpoint cs start J-start)*δ<K) :
    (boardClockMeasure n (B/n)).real
      (scheduledActualClockHit cs ε M deadline start hn (augInitialState B hB deadline start) J)≤
      ∑ L∈specifiedBoardLines n Γ,scheduledClockCellCrossingBound cs ε M K deadline start L hn hB δ J := by
  letI := boardClockMeasure_probability n (B/n)
    (div_pos (zero_lt_one.trans_le hB) (by exact_mod_cast hn))
  refine (scheduledActualClockHit_real_le_terminal_sum cs ε M K deadline start hn
    (augInitialState B hB deadline start) Γ J (fun j _=>hΓ j) (fun j _=>hKcfg j) _).trans ?_
  refine Finset.sum_le_sum (fun L hL=>canonicalScheduledClock_threshold_le cs ε M K deadline
    start L p hn hB δ J (fun j=>(hKcfg j).le) hK (fun j=>?_ ) hδ hbin (hbudget L hL))
  rw [hΓ j]
  exact (Finset.mem_filter.mp hL).2

theorem canonicalScheduledClockCause_point_real_le {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n)
    (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (δ : ℝ) (J : ℕ)
    (hΓ : ∀j,(cs j).directions=Γ) (hKcfg : ∀j,(cs j).K=K) (hK : K<2) (hδ : 0≤δ)
    (hbin : ∀j<J,∀q,(cs j).mask q=0 ∨ (cs j).mask q=1)
    (hbudget : ∀L∈specifiedBoardLines n Γ,
      specifiedClockScheduleInput cs L J+(phaseEndpoint cs start J-start)*δ<K) :
    (phasePointMeasure cs ε M deadline start hn hB p J).real
      (scheduledBoundaryCauseBefore cs ε M deadline start hn
        (augInitialState B hB deadline start) p .clock J)≤
      B*(∑ L∈specifiedBoardLines n Γ,scheduledClockCellCrossingBound cs ε M K deadline start L hn hB δ J) := by
  let e := augInitialState B hB deadline start
  let E := scheduledBoundaryCauseBefore cs ε M deadline start hn e p .clock J
  let μ := boardClockMeasure n (B/n)
  letI := boardClockMeasure_probability n (B/n)
    (div_pos (zero_lt_one.trans_le hB) (by exact_mod_cast hn))
  calc
    _ ≤ B*μ.real E := phasePointMeasure_real_le_board cs ε M deadline start hn hB p J E
      (scheduledBoundaryCauseBefore_measurableSet cs ε M deadline start hn e p .clock J)
    _ ≤ B*μ.real (scheduledActualClockHit cs ε M deadline start hn e J) :=
      mul_le_mul_of_nonneg_left
        (measureReal_mono (μ:=μ) (scheduledBoundaryCause_clock_subset_actual cs ε M deadline start hn e p J))
        (zero_le_one.trans hB)
    _ ≤ _ := mul_le_mul_of_nonneg_left
      (canonicalScheduledActualClockHit_real_le cs ε M K deadline start p hn hB Γ δ J hΓ hKcfg hK hδ hbin hbudget)
      (zero_le_one.trans hB)

end NoThreeLine

#print axioms NoThreeLine.canonicalScheduledClock_threshold_le
#print axioms NoThreeLine.canonicalScheduledActualClockHit_real_le
#print axioms NoThreeLine.canonicalScheduledClockCause_point_real_le

