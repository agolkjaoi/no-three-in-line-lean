import NoThreeLine.CanonicalScheduledClockBound
import NoThreeLine.ScheduledRestartGoodTail

/-! Use half of the deterministic credit slack before first birth and
the full slack afterward. This leaves a fixed positive restart gap. -/
set_option autoImplicit false
set_option maxHeartbeats 2450000
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped BigOperators
namespace NoThreeLine
open AuxiliaryODE BirthWitness PrimitiveLines SpecifiedBoardCount

theorem scheduledProtectedExceedance_antitone_threshold {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (p : Grid n) (hn : 0<n) (J : ℕ) (s : ProtectedPhaseState n B) :
    Antitone (fun b=>scheduledProtectedExceedance cs ε M deadline start L N E A hn b J s) := by
  intro lo hi hb ω hw
  rw [mem_scheduledProtectedExceedance_iff_original cs ε M deadline start L N E A p hn hi J s ω] at hw
  rw [mem_scheduledProtectedExceedance_iff_original cs ε M deadline start L N E A p hn lo J s ω]
  obtain ⟨j,hj,h⟩ := hw
  refine ⟨j,hj,?_⟩
  let cfg := (cs j).config
  let r := protectedScheduledIterate cs ε M deadline start L p hn J s j ω
  let a := protectedPhaseStart cfg ε M r.1.2
  change r.2∈protectedActualExceedance cfg ε M L N E A hn a hi at h
  change r.2∈protectedActualExceedance cfg ε M L N E A hn a lo
  rw [mem_protectedActualExceedance_iff] at h ⊢
  obtain ⟨k,hN,hk⟩ := h
  refine ⟨k,hN,?_⟩
  rcases hk with h | ⟨hd,t,ht,htd,he⟩
  · exact Or.inl (hb.trans_lt h)
  · exact Or.inr ⟨hd,t,ht,htd,hb.trans_lt he⟩

def scheduledClockShiftedCrossingBound {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n)
    (hn : 0<n) (hB : 1≤B) (δ : ℝ) (J : ℕ) : ℝ :=
  let s := protectedScheduleInitial B hB L deadline start
  ∑ i : Fin J,
    let E := L.val∩clockMaskCells cs J i
    let lo := clockMaskCellCap cs L (δ/2) J i
    let hi := clockMaskCellCap cs L δ J i
    (scheduledLineForbiddenLaw cs ε M K deadline start hn L 0 s.1 J).real
      (scheduledProtectedExceedance cs ε M deadline start L 0 E id hn lo J s)+
    (scheduledLineRestartLaw cs ε M K deadline start L hn J s).real
      (scheduledRestartGoodCrossing cs ε M deadline start L E id hn lo hi J s)

theorem canonicalScheduledClock_threshold_le_shifted {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (hε : 0<ε) (hM : 0<M) (deadline : Grid n→ℝ) (start : ℝ)
    (L : LineIndex n) (hn : 0<n) (hB : 1≤B) (δ : ℝ) (J : ℕ) (Γ : Finset ZPoint)
    (hΓ : ∀j,(cs j).directions=Γ) (hKcfg : ∀j,(cs j).K≤K) (hK : K<2)
    (hsp : ∀j,specified (cs j).directions L) (hδ : 0≤δ)
    (hbin : ∀j<J,∀q,(cs j).mask q=0 ∨ (cs j).mask q=1)
    (hbudget : specifiedClockScheduleInput cs L J+(phaseEndpoint cs start J-start)*δ<K) :
    (boardClockMeasure n (B/n)).real (scheduledSpecifiedClockThreshold cs ε M K deadline start hn
      (augInitialState B hB deadline start) L J)≤
      scheduledClockShiftedCrossingBound cs ε M K deadline start L hn hB δ J := by
  let s := protectedScheduleInitial B hB L deadline start
  let μ := boardClockMeasure n (B/n)
  have hB0 : 0<B := zero_lt_one.trans_le hB
  letI := boardClockMeasure_probability n (B/n) (div_pos hB0 (by exact_mod_cast hn))
  let D := fun i=>L.val∩clockMaskCells cs J i
  let lo := clockMaskCellCap cs L (δ/2) J
  let hi := clockMaskCellCap cs L δ J
  let E₀ := fun i=>scheduledProtectedExceedance cs ε M deadline start L 0 (D i) id hn (lo i) J s
  let E₁ := fun i=>scheduledProtectedExceedance cs ε M deadline start L 1 (D i) id hn (hi i) J s
  have hphys : s.1=augInitialState B hB deadline start := rfl
  have ho : occupancy s.1.val.physical.process L=0 := by
    rw [hphys]
    simp only [occupancy,augInitialState_selected,Finset.empty_inter,Finset.card_empty]
  have hs0 : s.1.val.physical.clocks L=0 := by
    rw [hphys,augInitialState,augValidDeadlineRetirement_clocks]
    rfl
  have hs : s.1.val.AuxReady Γ ε M := augInitialState_auxReady B hB deadline start Γ ε M hε hM
  have hsv (q : Grid n) (hq : q∈L.val) : 0≤s.2.1 q ∧ s.2.1 q≤2*B :=
    protectedDeadlineBook_saved_bounds L (cs 0).directions (hsp 0) q hq deadline start _
      ⟨le_rfl,mul_nonneg (by norm_num) hB0.le⟩
  obtain ⟨p,hpL,_⟩ := hsp 0
  have hcap (i) : 0≤hi i := clockMaskCellCap_nonneg cs L δ hδ J i
  have hlo (i) : lo i≤hi i := by
    unfold lo hi clockMaskCellCap
    exact add_le_add le_rfl (mul_le_mul_of_nonneg_right (by linarith) (Nat.cast_nonneg n))
  have hclock : s.1.val.physical.clocks L≤K := by
    have hi' : 0≤∑j∈Finset.range J,(cs j).horizon*((∑i,clockMaskCellWeight j i*hi i)/n) :=
      Finset.sum_nonneg (fun j _=>mul_nonneg (cs j).horizon.coe_nonneg
        (div_nonneg (Finset.sum_nonneg (fun i _=>mul_nonneg (clockMaskCellWeight_nonneg j i) (hcap i)))
          (Nat.cast_nonneg n)))
    change 0≤∑j∈Finset.range J,(cs j).horizon*((∑i,clockMaskCellWeight j i*clockMaskCellCap cs L δ J i)/n) at hi'
    rw [clockMaskCells_budget_eq cs L hn δ start J hbin] at hi'
    linarith
  have hsubset : scheduledSpecifiedClockThreshold cs ε M K deadline start hn
      (augInitialState B hB deadline start) L J⊆⋃i,E₀ i∪E₁ i := by
    intro ω hω
    by_contra hb
    have he (i : Fin J) : ω∉E₀ i∪E₁ i := fun h=>hb (mem_iUnion.mpr ⟨i,h⟩)
    have hno (i : Fin J) : ω∉scheduledProtectedExceedance cs ε M deadline start L 0 (D i) id hn (hi i) J s∪
        E₁ i := by
      rintro (h | h)
      · exact he i (Or.inl (scheduledProtectedExceedance_antitone_threshold cs ε M deadline start L 0
          (D i) id p hn J s (hlo i) h))
      · exact he i (Or.inr h)
    have hb' := scheduledProtectedClock_budget_le cs ε M deadline start L p hn J s hsp hsv ω
      (clockMaskCells cs J) clockMaskCellWeight hi clockMaskCellWeight_nonneg hcap
      (clockMaskCells_decomposition cs J hbin) hno J le_rfl
    change _≤∑j∈Finset.range J,(cs j).horizon*((∑i,clockMaskCellWeight j i*clockMaskCellCap cs L δ J i)/n) at hb'
    rw [clockMaskCells_budget_eq cs L hn δ start J hbin,hs0,sub_zero] at hb'
    change K≤(recycledPhaseState cs ε M deadline start hn s.1 J ω).val.physical.clocks L at hω
    linarith
  calc
    _ ≤ μ.real (⋃i,E₀ i∪E₁ i) := measureReal_mono hsubset
    _ ≤ ∑i,μ.real (E₀ i∪E₁ i) := measureReal_iUnion_fintype_le _
    _ ≤ _ := Finset.sum_le_sum (fun i _=>
      scheduledProtected_twoStage_shifted_crossing_le cs ε M K deadline start L (D i)
        Finset.inter_subset_left id continuous_id monotone_id p hpL hn hB0 (lo i) (hi i) J Γ hΓ
        hKcfg hK hsp s ho hclock hsv hs)

theorem canonicalScheduledClockCause_point_real_le_shifted {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (hε : 0<ε) (hM : 0<M) (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n)
    (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (δ : ℝ) (J : ℕ)
    (hΓ : ∀j,(cs j).directions=Γ) (hKcfg : ∀j,(cs j).K=K) (hK : K<2) (hδ : 0≤δ)
    (hbin : ∀j<J,∀q,(cs j).mask q=0 ∨ (cs j).mask q=1)
    (hbudget : ∀L∈specifiedBoardLines n Γ,
      specifiedClockScheduleInput cs L J+(phaseEndpoint cs start J-start)*δ<K) :
    (phasePointMeasure cs ε M deadline start hn hB p J).real
      (scheduledBoundaryCauseBefore cs ε M deadline start hn (augInitialState B hB deadline start) p .clock J)≤
      B*(∑ L∈specifiedBoardLines n Γ,scheduledClockShiftedCrossingBound cs ε M K deadline start L hn hB δ J) := by
  let e := augInitialState B hB deadline start
  let E := scheduledBoundaryCauseBefore cs ε M deadline start hn e p .clock J
  let μ := boardClockMeasure n (B/n)
  letI := boardClockMeasure_probability n (B/n)
    (div_pos (zero_lt_one.trans_le hB) (by exact_mod_cast hn))
  have h := scheduledBoundaryCause_clock_real_le_terminal_sum cs ε M K deadline start hn e p Γ J
    (fun j _=>hΓ j) (fun j _=>hKcfg j) μ
  have hline (L : LineIndex n) (hL : L∈specifiedBoardLines n Γ) (j : ℕ) : specified (cs j).directions L := by
    rw [hΓ j]
    exact (Finset.mem_filter.mp hL).2
  refine (phasePointMeasure_real_le_board cs ε M deadline start hn hB p J E
    (scheduledBoundaryCauseBefore_measurableSet cs ε M deadline start hn e p .clock J)).trans
    (mul_le_mul_of_nonneg_left (h.trans (Finset.sum_le_sum (fun L hL=>
      canonicalScheduledClock_threshold_le_shifted cs ε M K hε hM deadline start L hn hB δ J Γ hΓ
        (fun j=>(hKcfg j).le) hK (hline L hL) hδ hbin (hbudget L hL)))) (zero_le_one.trans hB))

end NoThreeLine

#print axioms NoThreeLine.canonicalScheduledClock_threshold_le_shifted
#print axioms NoThreeLine.canonicalScheduledClockCause_point_real_le_shifted

