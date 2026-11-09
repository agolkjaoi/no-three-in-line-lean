import NoThreeLine.CutLossCauseSplit
import NoThreeLine.ScheduledCutOutputExistence
import NoThreeLine.ScaledPacketRiemann

/-! Integrate the actual loss on every positive-mask phase up to the root's
own deadline. A common full point-law cause bound is paid once per unit of
deterministic exposure and transfers to an actual legal output. -/
set_option autoImplicit false
set_option maxHeartbeats 2050000
noncomputable section
open MeasureTheory Set
open scoped BigOperators
namespace NoThreeLine.BirthWitness
open PrimitiveLines FinitePhase

theorem schedule_integratedCutLoss_le_full_point_cause {J n : ℕ} (s : Schedule J)
    (mask : Fin J→Grid n→ℝ) (hm : ∀j p,0≤mask j p ∧ mask j p≤1)
    (Γ : Finset ZPoint) (B K ρ ε M : ℝ) (hn : 0<n) (hB : 1≤B) (p : Grid n) (j : Fin J) :
    let cs := scheduleSharedPhases s mask hm Γ B K ρ
    let d := scheduleProcessDeadline s mask
    let μ := phasePointMeasure cs ε M d 0 hn hB p J
    let E := scheduledRetirementCauseEvent cs ε M d 0 hn (augInitialState B hB d 0) p J
    integratedScheduledCutLoss cs ε M d 0 hn hB p j.val≤
      (cs j.val).horizon*((cs j.val).mask p/n)*μ.real E := by
  intro cs d μ E
  by_cases hp : 0<mask j p
  · have hD : s.hi j≤d p := s.used_phase_le_deadline (fun k=>mask k p) j hp
    have hC : 0≤(cs j.val).mask p/n := div_nonneg ((cs j.val).mask_nonneg p) (Nat.cast_nonneg n)
    have ht (t : ℝ) (ht : t∈Ioo (0:ℝ) (cs j.val).horizon) :
        scheduledCutLossProbability cs ε M d 0 hn hB p j.val t≤μ.real E := by
      have hh : phaseEndpoint cs 0 j.val+t<d p := by
        have he := scheduleSharedPhases_lo s mask hm Γ B K ρ j
        have hh' := scheduleSharedPhases_horizon s mask hm Γ B K ρ j
        change phaseEndpoint cs 0 j.val=s.lo j at he
        change ((cs j.val).horizon:ℝ)=s.duration j at hh'
        have ht' := ht.2
        rw [hh'] at ht'
        rw [he]
        unfold Schedule.duration at ht'
        linarith
      rw [scheduledCutLossProbability_eq_mean]
      exact initial_scheduledCutLoss_mean_le_full_point_cause cs ε M d 0 hn hB p j.val J j.isLt t
        ⟨ht.1.le,ht.2.le⟩ hh
    unfold integratedScheduledCutLoss
    calc
      _ ≤ ∫ t in (0:ℝ)..(cs j.val).horizon,((cs j.val).mask p/n)*μ.real E :=
        intervalIntegral.integral_mono_on_of_le_Ioo (cs j.val).horizon.coe_nonneg
          (scheduledCutLoss_intervalIntegrable cs ε M d 0 hn hB p j.val) intervalIntegrable_const
          (fun t ht' => mul_le_mul_of_nonneg_left (ht t ht') hC)
      _ = _ := by rw [intervalIntegral.integral_const]; simp [smul_eq_mul,mul_assoc]
  · have hz : (cs j.val).mask p=0 := by
      change (scheduleSharedPhases s mask hm Γ B K ρ j.val).mask p=0
      rw [scheduleSharedPhases_mask]
      exact le_antisymm (le_of_not_gt hp) (hm j p).1
    simp [integratedScheduledCutLoss,hz]

theorem scheduleCutLoss_le_exposure_mul {J n : ℕ} (s : Schedule J)
    (mask : Fin J→Grid n→ℝ) (hm : ∀j p,0≤mask j p ∧ mask j p≤1)
    (Γ : Finset ZPoint) (B K ρ ε M : ℝ) (hn : 0<n) (hB : 1≤B) (α : ℝ) :
    let cs := scheduleSharedPhases s mask hm Γ B K ρ
    let d := scheduleProcessDeadline s mask
    (∀p, (phasePointMeasure cs ε M d 0 hn hB p J).real
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
  exact (schedule_integratedCutLoss_le_full_point_cause s mask hm Γ B K ρ ε M hn hB p i).trans
    (mul_le_mul_of_nonneg_left (htail p) (mul_nonneg (cs j).horizon.coe_nonneg
      (div_nonneg ((cs j).mask_nonneg p) (Nat.cast_nonneg n))))

theorem scheduleExposure_eq_boardInputMass {J n : ℕ} (s : Schedule J) (mask : Fin J→Grid n→ℝ)
    (hm : ∀j p,0≤mask j p ∧ mask j p≤1) (Γ : Finset ZPoint) (B K ρ : ℝ) (hn : 0<n) :
    phaseScheduleExposure (scheduleSharedPhases s mask hm Γ B K ρ) J=(n:ℝ)*s.boardInputMass mask := by
  have hnR : (n:ℝ)≠0 := ne_of_gt (by exact_mod_cast hn)
  rw [scheduleExposure_eq s mask hm Γ B K ρ]
  unfold Schedule.boardInputMass
  simp only [s.cumulative_total,←mul_div_assoc,←Finset.sum_div]
  field_simp

theorem schedule_exists_noThree_ge_mass_of_cause_bound {J n : ℕ} (s : Schedule J)
    (mask : Fin J→Grid n→ℝ) (hm : ∀j p,0≤mask j p ∧ mask j p≤1)
    (Γ : Finset ZPoint) (B K ρ ε M : ℝ) (hn : 0<n) (hB : 1≤B) (α : ℝ) :
    let cs := scheduleSharedPhases s mask hm Γ B K ρ
    let d := scheduleProcessDeadline s mask
    (∀p, (phasePointMeasure cs ε M d 0 hn hB p J).real
      (scheduledRetirementCauseEvent cs ε M d 0 hn (augInitialState B hB d 0) p J)≤α) →
    ∃S : Finset (Grid n),NoThree S ∧ (1-α)*((n:ℝ)*s.boardInputMass mask)≤(S.card:ℝ) := by
  intro cs d htail
  have hl := scheduleCutLoss_le_exposure_mul s mask hm Γ B K ρ ε M hn hB α htail
  have hm' := scheduleExposure_eq_boardInputMass s mask hm Γ B K ρ hn
  obtain ⟨S,hS,hlower⟩ := schedule_exists_noThree_ge_exposure_sub_loss s mask hm Γ B K ρ ε M hn hB
  rw [←scheduleExposure_eq s mask hm Γ B K ρ] at hlower
  refine ⟨S,hS,?_⟩
  rw [←hm']
  linarith

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.schedule_integratedCutLoss_le_full_point_cause
#print axioms NoThreeLine.BirthWitness.scheduleCutLoss_le_exposure_mul
#print axioms NoThreeLine.BirthWitness.schedule_exists_noThree_ge_mass_of_cause_bound

