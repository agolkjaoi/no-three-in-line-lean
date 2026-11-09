import NoThreeLine.ScheduleIntegratedCauseLoss

/-! The final extraction needs cause bounds only for roots used by the
actual schedule. Roots with zero exposure contribute exactly zero loss. -/
set_option autoImplicit false
set_option maxHeartbeats 1650000
noncomputable section
open MeasureTheory
open scoped BigOperators
namespace NoThreeLine.BirthWitness
open PrimitiveLines FinitePhase

theorem scheduleCutLoss_le_exposure_mul_of_used {J n : ℕ} (s : Schedule J)
    (mask : Fin J→Grid n→ℝ) (hm : ∀j p,0≤mask j p ∧ mask j p≤1)
    (Γ : Finset ZPoint) (B K ρ ε M : ℝ) (hn : 0<n) (hB : 1≤B) (α : ℝ) :
    let cs := scheduleSharedPhases s mask hm Γ B K ρ
    let d := scheduleProcessDeadline s mask
    (∀p, 0<d p → (phasePointMeasure cs ε M d 0 hn hB p J).real
      (scheduledRetirementCauseEvent cs ε M d 0 hn (augInitialState B hB d 0) p J)≤α) →
    scheduleCutLoss s mask hm Γ B K ρ ε M hn hB≤phaseScheduleExposure cs J*α := by
  intro cs d htail
  unfold scheduleCutLoss totalScheduledCutLoss phaseScheduleExposure
  rw [Finset.sum_mul]
  apply Finset.sum_le_sum
  intro p _
  rw [Finset.sum_mul]
  apply Finset.sum_le_sum
  intro j hj
  let i : Fin J := ⟨j,Finset.mem_range.mp hj⟩
  by_cases hi : 0<mask i p
  · have huse : 0<d p := ((s.lo_nonneg i).trans_lt (s.lo_lt_hi i)).trans_le
      (s.used_phase_le_deadline (fun j=>mask j p) i hi)
    exact (schedule_integratedCutLoss_le_full_point_cause s mask hm Γ B K ρ ε M hn hB p i).trans
      (mul_le_mul_of_nonneg_left (htail p huse) (mul_nonneg (cs j).horizon.coe_nonneg
        (div_nonneg ((cs j).mask_nonneg p) (Nat.cast_nonneg n))))
  · have hz : (cs j).mask p=0 := by
      change (scheduleSharedPhases s mask hm Γ B K ρ i.val).mask p=0
      rw [scheduleSharedPhases_mask]
      exact le_antisymm (le_of_not_gt hi) (hm i p).1
    change integratedScheduledCutLoss cs ε M d 0 hn hB p j≤(cs j).horizon*((cs j).mask p/n)*α
    simp [integratedScheduledCutLoss,hz]

theorem schedule_exists_noThree_from_five_causes {J n : ℕ} (s : Schedule J)
    (mask : Fin J→Grid n→ℝ) (hm : ∀j p,0≤mask j p ∧ mask j p≤1)
    (Γ : Finset ZPoint) (B K ρ ε M : ℝ) (hn : 0<n) (hB : 1≤B) (α : ℝ) :
    let cs := scheduleSharedPhases s mask hm Γ B K ρ
    let d := scheduleProcessDeadline s mask
    let e := augInitialState B hB d 0
    (∀p, 0<d p →
      let μ := phasePointMeasure cs ε M d 0 hn hB p J
      μ.real (scheduledActualWeightCapBefore cs ε M d 0 hn e p J)+
        μ.real (scheduledBoundaryCauseBefore cs ε M d 0 hn e p .eta J)+
        μ.real (scheduledBoundaryCauseBefore cs ε M d 0 hn e p .virtual J)+
        μ.real (scheduledBoundaryCauseBefore cs ε M d 0 hn e p .clock J)+
        μ.real (scheduledBoundaryCauseBefore cs ε M d 0 hn e p .tag J)≤α) →
    ∃S : Finset (Grid n),NoThree S ∧ (1-α)*((n:ℝ)*s.boardInputMass mask)≤(S.card:ℝ) := by
  intro cs d e htail
  have hc (p : Grid n) (hp : 0<d p) : (phasePointMeasure cs ε M d 0 hn hB p J).real
      (scheduledRetirementCauseEvent cs ε M d 0 hn e p J)≤α := by
    let μ := phasePointMeasure cs ε M d 0 hn hB p J
    letI := phasePointMeasure_probability cs ε M d 0 hn hB p J
    have hu := measureReal_union_le (μ:=μ)
      (scheduledActualWeightCapBefore cs ε M d 0 hn e p J)
      (scheduledNonWeightBoundaryBefore cs ε M d 0 hn e p J)
    have hv := scheduledNonWeightBoundary_real_le_four cs ε M d 0 hn e p J μ
    have h := htail p hp
    change μ.real (scheduledRetirementCauseEvent cs ε M d 0 hn e p J)≤α
    unfold scheduledRetirementCauseEvent
    dsimp only at h
    linarith
  have hl := scheduleCutLoss_le_exposure_mul_of_used s mask hm Γ B K ρ ε M hn hB α hc
  have hm' := scheduleExposure_eq_boardInputMass s mask hm Γ B K ρ hn
  obtain ⟨S,hS,hlower⟩ := schedule_exists_noThree_ge_exposure_sub_loss s mask hm Γ B K ρ ε M hn hB
  rw [←scheduleExposure_eq s mask hm Γ B K ρ] at hlower
  refine ⟨S,hS,?_⟩
  rw [←hm']
  linarith

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.scheduleCutLoss_le_exposure_mul_of_used
#print axioms NoThreeLine.BirthWitness.schedule_exists_noThree_from_five_causes

