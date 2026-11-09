import NoThreeLine.SpecifiedClockBinaryBudget
import NoThreeLine.ScheduleProcessBridge

/-! Count the full specified line in the same cumulative input used by
the finite schedule, retaining all original last-positive deadlines. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open scoped BigOperators
namespace NoThreeLine
open AuxiliaryODE BirthWitness PrimitiveLines FinitePhase

theorem specifiedClockScheduleInput_eq_cumulative {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (L : LineIndex n) (J : ℕ) :
    specifiedClockScheduleInput cs L J =
      (∑q∈L.val,∑j∈Finset.range J,(cs j).horizon*(cs j).mask q)/(n:ℝ) := by
  simp only [specifiedClockScheduleInput,←mul_div_assoc,←Finset.sum_div,Finset.mul_sum]
  rw [Finset.sum_comm]

theorem schedule_specifiedClockInput {J n : ℕ} (s : Schedule J) (mask : Fin J→Grid n→ℝ)
    (hm : ∀j q,0≤mask j q ∧ mask j q≤1) (Γ : Finset ZPoint) (B K ρ : ℝ)
    (L : LineIndex n) :
    specifiedClockScheduleInput (scheduleSharedPhases s mask hm Γ B K ρ) L J =
      (∑q∈L.val,s.cumulative (fun j=>mask j q) s.total)/(n:ℝ) := by
  rw [specifiedClockScheduleInput_eq_cumulative]
  congr 1
  apply Finset.sum_congr rfl
  intro q _
  rw [s.cumulative_total,←Fin.sum_univ_eq_sum_range]
  apply Finset.sum_congr rfl
  intro j _
  rw [scheduleSharedPhases_horizon,scheduleSharedPhases_mask]

theorem exists_strictClockSlack (T lam K : ℝ) (hT : 0≤T) (hgap : lam<K) :
    ∃δ : ℝ,0<δ ∧ lam+T*δ<K := by
  let δ := (K-lam)/(2*(T+1))
  have hden : 0<2*(T+1) := by linarith
  have hδ : 0<δ := div_pos (sub_pos.mpr hgap) hden
  refine ⟨δ,hδ,?_⟩
  have he : δ*(2*(T+1))=K-lam := div_mul_cancel₀ _ hden.ne'
  nlinarith [mul_nonneg hT hδ.le]

end NoThreeLine

#print axioms NoThreeLine.schedule_specifiedClockInput
#print axioms NoThreeLine.exists_strictClockSlack

