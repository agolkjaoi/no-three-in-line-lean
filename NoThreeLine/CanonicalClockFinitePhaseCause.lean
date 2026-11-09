import NoThreeLine.CanonicalClockStageOnePhaseTail
import NoThreeLine.SpecifiedBoardLineCount

/-! Both occupancy stages reduce the actual point clock cause to uniform
one-phase tails for specified lines and the original mask cells. -/
set_option autoImplicit false
set_option maxHeartbeats 2450000
noncomputable section
open MeasureTheory
open scoped BigOperators
namespace NoThreeLine
open AuxiliaryODE BirthWitness PrimitiveLines SpecifiedBoardCount

def canonicalClockCellPhaseTails {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (L : LineIndex n) (hn : 0<n) (δ : ℝ) (J : ℕ) (i : Fin J) (tail : ℝ) : Prop :=
  let E := L.val∩clockMaskCells cs J i
  let lo := clockMaskCellCap cs L (δ/2) J i
  let hi := clockMaskCellCap cs L δ J i
  let step := (δ/2)*n/J
  protectedUniformPhaseGapTail cs ε M K L 0 E id hn J (E.card:ℝ) lo step tail ∧
    protectedUniformPhaseGapTail cs ε M K L 1 E id hn J lo hi step tail

theorem canonicalClockShiftedCrossingBound_le_of_phase {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n)
    (hn : 0<n) (hB : 1≤B) (J : ℕ) (hJ : 0<J)
    (Γ : Finset ZPoint) (hΓ : ∀j,(cs j).directions=Γ)
    (hKcfg : ∀j,(cs j).K≤K) (hK : K<2) (hK0 : 0≤K)
    (hsp : ∀j,specified (cs j).directions L) (hε : 0<ε) (hM : 0<M)
    (δ tail : ℝ) (hδ : 0≤δ) (htail : 0≤tail)
    (hphase : ∀i,canonicalClockCellPhaseTails cs ε M K L hn δ J i tail) :
    scheduledClockShiftedCrossingBound cs ε M K deadline start L hn hB δ J≤
      (J:ℝ)*((2/(2-K))^2*(J:ℝ)*tail+(tail+(2/(2-K))^2*((J-1:ℕ):ℝ)*tail)) := by
  obtain ⟨p,hp,_⟩ := hsp 0
  unfold scheduledClockShiftedCrossingBound
  calc
    _ ≤ ∑ _i : Fin J,((2/(2-K))^2*(J:ℝ)*tail+(tail+(2/(2-K))^2*((J-1:ℕ):ℝ)*tail)) := by
      apply Finset.sum_le_sum
      intro i _
      apply add_le_add
      · apply canonicalClockCell_stageZero_le_of_phase cs ε M K deadline start L p hn hB J hJ i Γ hΓ
          hKcfg hK hK0 hsp hε hM δ tail hδ htail
        intro j hj v ho hk hs hsv hb
        let E := L.val∩clockMaskCells cs J i
        let step := (δ/2)*(n:ℝ)/(J:ℝ)
        have hstep : 0≤step := div_nonneg (mul_nonneg (by linarith) (Nat.cast_nonneg n)) (Nat.cast_nonneg J)
        have hb0 : (E.card:ℝ)≤(E.card:ℝ)+(j:ℝ)*step :=
          le_add_of_nonneg_right (mul_nonneg (Nat.cast_nonneg _) hstep)
        have hJ' : (0:ℝ)<J := by exact_mod_cast hJ
        have hcap : (E.card:ℝ)+(J:ℝ)*step=clockMaskCellCap cs L (δ/2) J i := by
          change (E.card:ℝ)+(J:ℝ)*((δ/2)*(n:ℝ)/(J:ℝ))=(E.card:ℝ)+(δ/2)*(n:ℝ)
          field_simp
        have hle : (E.card:ℝ)+((j+1:ℕ):ℝ)*step≤clockMaskCellCap cs L (δ/2) J i := by
          rw [←hcap]
          exact add_le_add le_rfl (mul_le_mul_of_nonneg_right (by exact_mod_cast Nat.succ_le_of_lt hj) hstep)
        have he : (E.card:ℝ)+(j:ℝ)*step+step=(E.card:ℝ)+((j+1:ℕ):ℝ)*step := by push_cast; ring
        have hbound := (hphase i).1 j hj ((E.card:ℝ)+(j:ℝ)*step) hb0 (he.symm ▸ hle) v ho hk hs hsv hb
        change (phaseLineForbiddenLaw (cs j).config ε M K L 0 hn v.1).real
          (protectedActualExceedance (cs j).config ε M L 0 E id hn v ((E.card:ℝ)+(j:ℝ)*step+step))≤tail at hbound
        simpa only [he] using hbound
      · exact canonicalClockCell_stageOne_le_of_phase cs ε M K deadline start L p hp hn hB J hJ i
          Γ hΓ hKcfg hK hK0 hsp hε hM δ tail hδ htail (hphase i).2
    _ = _ := by simp [nsmul_eq_mul,mul_add]

theorem canonicalScheduledClockCause_point_real_le_of_phase {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (hε : 0<ε) (hM : 0<M) (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n)
    (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (δ : ℝ) (J : ℕ) (hJ : 0<J)
    (hΓ : ∀j,(cs j).directions=Γ) (hKcfg : ∀j,(cs j).K=K) (hK : K<2) (hK0 : 0≤K)
    (hδ : 0≤δ) (hbin : ∀j<J,∀q,(cs j).mask q=0 ∨ (cs j).mask q=1)
    (hbudget : ∀L∈specifiedBoardLines n Γ,
      specifiedClockScheduleInput cs L J+(phaseEndpoint cs start J-start)*δ<K)
    (tail : ℝ) (htail : 0≤tail)
    (hphase : ∀L∈specifiedBoardLines n Γ,∀i,canonicalClockCellPhaseTails cs ε M K L hn δ J i tail) :
    (phasePointMeasure cs ε M deadline start hn hB p J).real
      (scheduledBoundaryCauseBefore cs ε M deadline start hn (augInitialState B hB deadline start) p .clock J)≤
    B*((n:ℝ)*lineCountConstant Γ)*((J:ℝ)*
      ((2/(2-K))^2*(J:ℝ)*tail+(tail+(2/(2-K))^2*((J-1:ℕ):ℝ)*tail))) := by
  let cap := (J:ℝ)*((2/(2-K))^2*(J:ℝ)*tail+(tail+(2/(2-K))^2*((J-1:ℕ):ℝ)*tail))
  have hcap : 0≤cap := by dsimp [cap]; positivity
  have hline (L : LineIndex n) (hL : L∈specifiedBoardLines n Γ) (j : ℕ) :
      specified (cs j).directions L := by
    rw [hΓ j]
    exact (Finset.mem_filter.mp hL).2
  have hcount : ((specifiedBoardLines n Γ).card:ℝ)≤(n:ℝ)*lineCountConstant Γ := by
    exact_mod_cast specifiedBoardLines_card_le n hn Γ
  have h := canonicalScheduledClockCause_point_real_le_shifted cs ε M K hε hM deadline start p
    hn hB Γ δ J hΓ hKcfg hK hδ hbin hbudget
  have hsum : (∑ L∈specifiedBoardLines n Γ,scheduledClockShiftedCrossingBound cs ε M K deadline start L hn hB δ J)≤
      (n:ℝ)*lineCountConstant Γ*cap := by
    calc
      _ ≤ ∑ _L∈specifiedBoardLines n Γ,cap := Finset.sum_le_sum (fun L hL=>
        canonicalClockShiftedCrossingBound_le_of_phase cs ε M K deadline start L hn hB J hJ Γ hΓ
          (fun j=>(hKcfg j).le) hK hK0 (hline L hL) hε hM δ tail hδ htail (hphase L hL))
      _ = ((specifiedBoardLines n Γ).card:ℝ)*cap := by simp [nsmul_eq_mul]
      _ ≤ (n:ℝ)*lineCountConstant Γ*cap := mul_le_mul_of_nonneg_right hcount hcap
  rw [mul_assoc]
  exact h.trans (mul_le_mul_of_nonneg_left hsum (zero_le_one.trans hB))

end NoThreeLine

#print axioms NoThreeLine.canonicalScheduledClockCause_point_real_le_of_phase

