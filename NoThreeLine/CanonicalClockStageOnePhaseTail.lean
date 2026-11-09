import NoThreeLine.RestartedCrossingFinitePhase
import NoThreeLine.CanonicalClockStageZeroPhaseTail

/-! The actual first-birth mixture uses the half gap between the
canonical clock thresholds. The unfinished phase consumes one share. -/
set_option autoImplicit false
set_option maxHeartbeats 2350000
noncomputable section
open MeasureTheory
namespace NoThreeLine
open AuxiliaryODE BirthWitness PrimitiveLines

theorem canonicalClockCell_stageOne_le_of_phase {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n) (hp : p∈L.val)
    (hn : 0<n) (hB : 1≤B) (J : ℕ) (hJ : 0<J) (i : Fin J)
    (Γ : Finset ZPoint) (hΓ : ∀j,(cs j).directions=Γ)
    (hKcfg : ∀j,(cs j).K≤K) (hK : K<2) (hK0 : 0≤K)
    (hsp : ∀j,specified (cs j).directions L) (hε : 0<ε) (hM : 0<M)
    (δ tail : ℝ) (hδ : 0≤δ) (htail : 0≤tail) :
    let E := L.val∩clockMaskCells cs J i
    let lo := clockMaskCellCap cs L (δ/2) J i
    let hi := clockMaskCellCap cs L δ J i
    let step := (δ/2)*n/J
    protectedUniformPhaseGapTail cs ε M K L 1 E id hn J lo hi step tail →
    (scheduledLineRestartLaw cs ε M K deadline start L hn J (protectedScheduleInitial B hB L deadline start)).real
      (scheduledRestartGoodCrossing cs ε M deadline start L E id hn lo hi J
        (protectedScheduleInitial B hB L deadline start))≤
      tail+(2/(2-K))^2*((J-1:ℕ):ℝ)*tail := by
  intro E lo hi step hphase
  let s := protectedScheduleInitial B hB L deadline start
  have hB0 : 0<B := zero_lt_one.trans_le hB
  have ho : occupancy s.1.val.physical.process L=0 := by
    change occupancy (augInitialState B hB deadline start).val.physical.process L=0
    simp only [occupancy,augInitialState_selected,Finset.empty_inter,Finset.card_empty]
  have hk : s.1.val.physical.clocks L≤K := by
    change (augInitialState B hB deadline start).val.physical.clocks L≤K
    rw [augInitialState,augValidDeadlineRetirement_clocks]
    exact hK0
  have hs : s.1.val.AuxReady Γ ε M := augInitialState_auxReady B hB deadline start Γ ε M hε hM
  have hsv (q : Grid n) (hq : q∈L.val) : 0≤s.2.1 q ∧ s.2.1 q≤2*B :=
    protectedDeadlineBook_saved_bounds L (cs 0).directions (hsp 0) q hq deadline start _
      ⟨le_rfl,mul_nonneg (by norm_num) hB0.le⟩
  have hJ' : (0:ℝ)<J := by exact_mod_cast hJ
  have hstep : 0≤step := div_nonneg (mul_nonneg (by linarith) (Nat.cast_nonneg n)) hJ'.le
  have hgap : lo+(J:ℝ)*step≤hi := by
    change (E.card:ℝ)+(δ/2)*n+(J:ℝ)*((δ/2)*n/J)≤(E.card:ℝ)+δ*n
    have he : (J:ℝ)*((δ/2)*n/J)=(δ/2)*n := by field_simp
    rw [he]
    linarith
  refine scheduledRestartGoodCrossing_le_of_sections cs ε M K deadline start L E Finset.inter_subset_left
    id continuous_id monotone_id p hp hn hB0 lo hi J Γ hΓ hKcfg hK hsp s ho hk hsv hs _
    (add_nonneg htail (mul_nonneg (mul_nonneg (sq_nonneg _) (Nat.cast_nonneg _)) htail)) ?_
  rintro ⟨j,a⟩ hj v hv hkv hready hsv' hcredit
  have h := scheduledRemainderSection_crossing_le_finite_phase cs ε M K deadline start L 1 (by omega)
    E id continuous_id p hn hB0 j J hj Γ hΓ hKcfg hK hsp a hv hkv hready hsv'
    lo hi step tail hstep htail hgap hcredit hphase
  have hle : ((J-(j+1):ℕ):ℝ)≤((J-1:ℕ):ℝ) := by exact_mod_cast (show J-(j+1)≤J-1 by omega)
  exact h.trans (add_le_add le_rfl (mul_le_mul_of_nonneg_right
    (mul_le_mul_of_nonneg_left hle (sq_nonneg _)) htail))

end NoThreeLine

#print axioms NoThreeLine.canonicalClockCell_stageOne_le_of_phase

