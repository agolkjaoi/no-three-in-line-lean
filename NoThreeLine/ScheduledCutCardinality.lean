import NoThreeLine.ScheduledCutBirthLoss
import NoThreeLine.BirthScheduleCard

/-! The actual full finite-schedule output has expected cardinality equal
to its deterministic input exposure minus its integrated, credit-tilted
unavailability probabilities. This is an exact identity, not a small-loss
estimate or a proof of the final density target. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine.BirthWitness

def phaseScheduleExposure {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (N : ℕ) : ℝ :=
  ∑p : Grid n,∑k∈Finset.range N,(cs k).horizon*((cs k).mask p/n)

def totalScheduledCutLoss {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B) (N : ℕ) : ℝ :=
  ∑p : Grid n,∑k∈Finset.range N,integratedScheduledCutLoss cs ε M deadline start hn hB p k

theorem totalScheduledCutLoss_bounds {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B) (N : ℕ) :
    0≤totalScheduledCutLoss cs ε M deadline start hn hB N ∧
      totalScheduledCutLoss cs ε M deadline start hn hB N≤phaseScheduleExposure cs N := by
  constructor
  · exact Finset.sum_nonneg (fun p _=>Finset.sum_nonneg (fun k _=>
      (integratedScheduledCutLoss_bounds cs ε M deadline start hn hB p k).1))
  · exact Finset.sum_le_sum (fun p _=>Finset.sum_le_sum (fun k _=>
      (integratedScheduledCutLoss_bounds cs ε M deadline start hn hB p k).2))

theorem finitePhase_initial_card_loss {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B) (N : ℕ) :
    (∫ω,((recycledPhaseState cs ε M deadline start hn (augInitialState B hB deadline start) N ω).val.physical.process.selected.card:ℝ)
      ∂boardClockMeasure n (B/n))=phaseScheduleExposure cs N-
        totalScheduledCutLoss cs ε M deadline start hn hB N := by
  have hB0 := lt_of_lt_of_le zero_lt_one hB
  rw [finitePhase_initial_card_compensation]
  unfold totalScheduledBirthRate
  rw [integral_finset_sum _ (fun p _=>
    cumulativeScheduledBirthRate_integrable cs ε M deadline start p hn hB0 _ N)]
  unfold cumulativeScheduledBirthRate
  simp_rw [integral_finset_sum _ (fun k _=>
    scheduledBirthIncrement_integrable cs ε M deadline start _ hn hB0 _ k)]
  simp_rw [scheduledBirthIncrement_mean_loss cs ε M deadline start hn hB,
    Finset.sum_sub_distrib]
  rfl

def scheduleCutLoss {J n : ℕ} (s : FinitePhase.Schedule J) (m : Fin J→Grid n→ℝ)
    (hm : ∀j p,0≤m j p ∧ m j p≤1) (Γ : Finset PrimitiveLines.ZPoint)
    (B K ρ ε M : ℝ) (hn : 0<n) (hB : 1≤B) : ℝ :=
  totalScheduledCutLoss (scheduleSharedPhases s m hm Γ B K ρ) ε M (scheduleProcessDeadline s m) 0 hn hB J

theorem scheduleExposure_eq {J n : ℕ} (s : FinitePhase.Schedule J) (m : Fin J→Grid n→ℝ)
    (hm : ∀j p,0≤m j p ∧ m j p≤1) (Γ : Finset PrimitiveLines.ZPoint) (B K ρ : ℝ) :
    phaseScheduleExposure (scheduleSharedPhases s m hm Γ B K ρ) J=
      ∑p : Grid n,∑j : Fin J,s.duration j*(m j p/n) := by
  unfold phaseScheduleExposure
  apply Finset.sum_congr rfl
  intro p _
  rw [←Fin.sum_univ_eq_sum_range]
  apply Finset.sum_congr rfl
  intro j _
  rw [scheduleSharedPhases_horizon,scheduleSharedPhases_mask]

theorem schedule_card_loss {J n : ℕ} (s : FinitePhase.Schedule J) (m : Fin J→Grid n→ℝ)
    (hm : ∀j p,0≤m j p ∧ m j p≤1) (Γ : Finset PrimitiveLines.ZPoint)
    (B K ρ ε M : ℝ) (hn : 0<n) (hB : 1≤B) :
    (∫ω,((scheduleProcessOutput s m hm Γ B K ρ ε M hn hB ω).val.physical.process.selected.card:ℝ)
      ∂boardClockMeasure n (B/n))=
        (∑p : Grid n,∑j : Fin J,s.duration j*(m j p/n))-scheduleCutLoss s m hm Γ B K ρ ε M hn hB := by
  rw [←scheduleExposure_eq s m hm Γ B K ρ]
  exact finitePhase_initial_card_loss _ ε M _ 0 hn hB J

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.finitePhase_initial_card_loss
#print axioms NoThreeLine.BirthWitness.schedule_card_loss
