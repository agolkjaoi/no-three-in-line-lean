import NoThreeLine.CreditLossRate
import NoThreeLine.ScheduleProcessBridge

/-! Saved credit at or after a point's deterministic last-use deadline is
multiplied by zero in the actual schedule. Only loss strictly before that
deadline contributes to the rate decomposition. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine

def ProcessState.earlyBirthCreditLoss {n : ℕ} (s : ProcessState n) (deadline : Grid n → ℝ)
    (t : ℝ) (p : Grid n) : ℝ := if t<deadline p then s.birthCreditLoss p else 0

theorem ProcessState.earlyBirthCreditLoss_measurable {n : ℕ} (deadline : Grid n → ℝ) (p : Grid n) :
    Measurable (fun x : ProcessState n × ℝ=>x.1.earlyBirthCreditLoss deadline x.2 p) :=
  Measurable.ite (measurable_snd.lt measurable_const).setOf
    ((birthCreditLoss_measurable p).comp measurable_fst) measurable_const

theorem ProcessState.earlyBirthCreditLoss_bounds {n : ℕ} (s : ProcessState n) (deadline : Grid n → ℝ)
    (t : ℝ) (p : Grid n) (hc : 0≤(s.accounts p).credit) :
    0≤s.earlyBirthCreditLoss deadline t p ∧ s.earlyBirthCreditLoss deadline t p≤s.birthCreditLoss p := by
  unfold earlyBirthCreditLoss
  split_ifs
  · exact ⟨(s.birthCreditLoss_bounds p hc).1,le_rfl⟩
  · exact ⟨le_rfl,(s.birthCreditLoss_bounds p hc).1⟩

theorem schedule_masked_credit_loss {J n : ℕ} (schedule : FinitePhase.Schedule J)
    (m : Fin J → Grid n → ℝ) (hm : ∀j p,0≤m j p ∧ m j p≤1)
    (state : ProcessState n) (t : ℝ) (p : Grid n) :
    schedule.rate (fun j=>m j p) t*state.birthCreditLoss p=
      schedule.rate (fun j=>m j p) t*state.earlyBirthCreditLoss (scheduleProcessDeadline schedule m) t p := by
  by_cases ht : t<scheduleProcessDeadline schedule m p
  · simp only [ProcessState.earlyBirthCreditLoss,if_pos ht]
  · rw [scheduleProcess_rate_zero_after_deadline schedule m hm p t (le_of_not_gt ht)]
    simp

theorem schedule_birthRate_credit_earlyLoss {J n : ℕ} (schedule : FinitePhase.Schedule J)
    (m : Fin J → Grid n → ℝ) (hm : ∀j p,0≤m j p ∧ m j p≤1)
    (state : ProcessState n) (t : ℝ) (p : Grid n) :
    state.birthRate (fun q=>schedule.rate (fun j=>m j q) t) p=
      (schedule.rate (fun j=>m j p) t/n)*
        ((state.accounts p).credit-state.earlyBirthCreditLoss (scheduleProcessDeadline schedule m) t p) := by
  rw [ProcessState.birthRate_credit_loss]
  by_cases ht : t<scheduleProcessDeadline schedule m p
  · simp only [ProcessState.earlyBirthCreditLoss,if_pos ht]
  · rw [scheduleProcess_rate_zero_after_deadline schedule m hm p t (le_of_not_gt ht)]
    simp

end NoThreeLine

#print axioms NoThreeLine.schedule_masked_credit_loss
#print axioms NoThreeLine.schedule_birthRate_credit_earlyLoss
