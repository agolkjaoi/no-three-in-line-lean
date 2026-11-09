import NoThreeLine.CanonicalScheduledClockBound
import NoThreeLine.ScheduleSpecifiedClockInput

/-! A fixed cumulative specified-line margin suffices for the actual
finite-schedule point-law reduction, with a linear count of specified lines. -/
set_option autoImplicit false
set_option maxHeartbeats 2100000
noncomputable section
open MeasureTheory
open scoped BigOperators
namespace NoThreeLine
open AuxiliaryODE BirthWitness PrimitiveLines FinitePhase SpecifiedBoardCount

theorem schedule_clockCause_point_real_le {J n : ℕ} (s : Schedule J) (mask : Fin J→Grid n→ℝ)
    (hm : ∀j q,0≤mask j q ∧ mask j q≤1) (hbin : ∀j q,mask j q=0 ∨ mask j q=1)
    (Γ : Finset ZPoint) (B K ρ ε M T lam δ : ℝ)
    (hn : 0<n) (hB : 1≤B) (hK : K<2) (hδ : 0≤δ) (hT : s.total≤T) (hgap : lam+T*δ<K)
    (hinput : ∀L∈specifiedBoardLines n Γ,
      (∑q∈L.val,s.cumulative (fun j=>mask j q) s.total)/(n:ℝ)≤lam)
    (p : Grid n) (a : ℝ) (ha : 0≤a) :
    let cs := scheduleSharedPhases s mask hm Γ B K ρ
    let d := scheduleProcessDeadline s mask
    (∀L∈specifiedBoardLines n Γ,scheduledClockCellCrossingBound cs ε M K d 0 L hn hB δ J≤a) →
    (phasePointMeasure cs ε M d 0 hn hB p J).real
      (scheduledBoundaryCauseBefore cs ε M d 0 hn (augInitialState B hB d 0) p .clock J)≤
      B*((n:ℝ)*lineCountConstant Γ)*a := by
  intro cs d hline
  have hKcfg (j : ℕ) : (cs j).K=K := by
    dsimp only [cs,scheduleSharedPhases]
    split <;> rfl
  have hbinary (j : ℕ) (hj : j<J) (q : Grid n) :
      (cs j).mask q=0 ∨ (cs j).mask q=1 := by
    change (scheduleSharedPhases s mask hm Γ B K ρ (⟨j,hj⟩:Fin J).val).mask q=0 ∨ _
    rw [scheduleSharedPhases_mask]
    exact hbin ⟨j,hj⟩ q
  have hbudget (L : LineIndex n) (hL : L∈specifiedBoardLines n Γ) :
      specifiedClockScheduleInput cs L J+(phaseEndpoint cs 0 J-0)*δ<K := by
    change specifiedClockScheduleInput (scheduleSharedPhases s mask hm Γ B K ρ) L J+
      (phaseEndpoint (scheduleSharedPhases s mask hm Γ B K ρ) 0 J-0)*δ<K
    rw [schedule_specifiedClockInput,scheduleSharedPhases_total,sub_zero]
    exact (add_le_add (hinput L hL) (mul_le_mul_of_nonneg_right hT hδ)).trans_lt hgap
  have hcard : ((specifiedBoardLines n Γ).card:ℝ)≤(n:ℝ)*lineCountConstant Γ := by
    exact_mod_cast specifiedBoardLines_card_le n hn Γ
  have hsum : (∑L∈specifiedBoardLines n Γ,scheduledClockCellCrossingBound cs ε M K d 0 L hn hB δ J)≤
      ((n:ℝ)*lineCountConstant Γ)*a := by
    calc
      _ ≤ ∑ _L∈specifiedBoardLines n Γ,a := Finset.sum_le_sum hline
      _ = ((specifiedBoardLines n Γ).card:ℝ)*a := by simp
      _ ≤ _ := mul_le_mul_of_nonneg_right hcard ha
  calc
    _ ≤ B*(∑L∈specifiedBoardLines n Γ,scheduledClockCellCrossingBound cs ε M K d 0 L hn hB δ J) :=
      canonicalScheduledClockCause_point_real_le cs ε M K d 0 p hn hB Γ δ J
        (scheduleSharedPhases_directions s mask hm Γ B K ρ) hKcfg hK hδ hbinary hbudget
    _ ≤ _ := by
      rw [mul_assoc]
      exact mul_le_mul_of_nonneg_left hsum (zero_le_one.trans hB)

end NoThreeLine

#print axioms NoThreeLine.schedule_clockCause_point_real_le

