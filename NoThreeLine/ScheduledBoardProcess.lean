import NoThreeLine.ScheduleProcessBridge

/-! The original-board process now takes an actual finite schedule, its
actual masks, and its derived point deadlines. No geometric or cardinality
lower estimate is postulated by this construction. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine

def scheduleProcessState {J n : ℕ} (s : FinitePhase.Schedule J) (m : Fin J → Grid n → ℝ)
    (hm : ∀ j p, 0 ≤ m j p ∧ m j p ≤ 1) (Γ : Finset PrimitiveLines.ZPoint)
    (B K ρ ε M : ℝ) (hn : 0 < n) (hB : 1 ≤ B) (k : ℕ) (ω : BoardClockPath n) : ValidAugmentedState n B :=
  recycledPhaseState (scheduleSharedPhases s m hm Γ B K ρ) ε M (scheduleProcessDeadline s m) 0 hn
    (augInitialState B hB (scheduleProcessDeadline s m) 0) k ω

def scheduleProcessOutput {J n : ℕ} (s : FinitePhase.Schedule J) (m : Fin J → Grid n → ℝ)
    (hm : ∀ j p, 0 ≤ m j p ∧ m j p ≤ 1) (Γ : Finset PrimitiveLines.ZPoint)
    (B K ρ ε M : ℝ) (hn : 0 < n) (hB : 1 ≤ B) (ω : BoardClockPath n) : ValidAugmentedState n B :=
  scheduleProcessState s m hm Γ B K ρ ε M hn hB J ω

theorem scheduleProcessState_measurable {J n : ℕ} (s : FinitePhase.Schedule J) (m : Fin J → Grid n → ℝ)
    (hm : ∀ j p, 0 ≤ m j p ∧ m j p ≤ 1) (Γ : Finset PrimitiveLines.ZPoint)
    (B K ρ ε M : ℝ) (hn : 0 < n) (hB : 1 ≤ B) (k : ℕ) :
    Measurable (scheduleProcessState s m hm Γ B K ρ ε M hn hB k) :=
  recycledPhaseState_measurable _ ε M _ 0 hn _ k

theorem scheduleProcessState_noThree {J n : ℕ} (s : FinitePhase.Schedule J) (m : Fin J → Grid n → ℝ)
    (hm : ∀ j p, 0 ≤ m j p ∧ m j p ≤ 1) (Γ : Finset PrimitiveLines.ZPoint)
    (B K ρ ε M : ℝ) (hn : 0 < n) (hB : 1 ≤ B) (k : ℕ) (ω : BoardClockPath n) :
    NoThree (scheduleProcessState s m hm Γ B K ρ ε M hn hB k ω).val.physical.process.selected :=
  recycledPhaseState_noThree _ ε M _ 0 hn _ k ω

theorem scheduleProcessState_expected_credit {J n : ℕ} (s : FinitePhase.Schedule J) (m : Fin J → Grid n → ℝ)
    (hm : ∀ j p, 0 ≤ m j p ∧ m j p ≤ 1) (Γ : Finset PrimitiveLines.ZPoint)
    (B K ρ ε M : ℝ) (hn : 0 < n) (hB : 1 ≤ B) (k : ℕ) (p : Grid n) :
    (∫ ω, validAugStateCredit B p (scheduleProcessState s m hm Γ B K ρ ε M hn hB k ω)
      ∂boardClockMeasure n (B/n)) = 1 :=
  recycledPhaseState_initial_expected_credit _ ε M _ 0 hn hB k p

theorem recycledScheduledPair_deadline_inactive {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (j : ℕ)
    (e : ValidAugmentedState n B) (ω : BoardClockPath n)
    (he : (recycledScheduledPair cs ε M deadline start hn j (e,ω)).1.val.physical.process.stopped ≠ true)
    (p : Grid n) (hp : deadline p ≤ phaseEndpoint cs start (j+1)) :
    ((recycledScheduledPair cs ε M deadline start hn j (e,ω)).1.val.physical.process.accounts p).status ≠ .active := by
  apply augValidDeadlineRetirement_inactive _ _ _ _ p hp
  simpa only [recycledScheduledPair,augValidDeadlineRetirement_stop_flag] using he

theorem recycledPhaseState_deadline_inactive {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (e : ValidAugmentedState n B)
    (k : ℕ) (ω : BoardClockPath n)
    (he : (recycledPhaseState cs ε M deadline start hn e (k+1) ω).val.physical.process.stopped ≠ true)
    (p : Grid n) (hp : deadline p ≤ phaseEndpoint cs start (k+1)) :
    ((recycledPhaseState cs ε M deadline start hn e (k+1) ω).val.physical.process.accounts p).status ≠ .active := by
  unfold recycledPhaseState at he ⊢
  rw [recycledPhases_succ] at he ⊢
  exact recycledScheduledPair_deadline_inactive cs ε M deadline start hn k _ _ he p hp

theorem scheduleProcessOutput_inactive {J n : ℕ} (s : FinitePhase.Schedule J) (m : Fin J → Grid n → ℝ)
    (hm : ∀ j p, 0 ≤ m j p ∧ m j p ≤ 1) (Γ : Finset PrimitiveLines.ZPoint)
    (B K ρ ε M : ℝ) (hn : 0 < n) (hB : 1 ≤ B) (hJ : 0 < J) (ω : BoardClockPath n)
    (he : (scheduleProcessOutput s m hm Γ B K ρ ε M hn hB ω).val.physical.process.stopped ≠ true)
    (p : Grid n) : ((scheduleProcessOutput s m hm Γ B K ρ ε M hn hB ω).val.physical.process.accounts p).status ≠ .active := by
  have hJ' : J-1+1=J := Nat.sub_add_cancel hJ
  have hp : scheduleProcessDeadline s m p ≤ phaseEndpoint (scheduleSharedPhases s m hm Γ B K ρ) 0 (J-1+1) := by
    rw [hJ',scheduleSharedPhases_total]
    exact s.deadline_le_total _
  have he' : (recycledPhaseState (scheduleSharedPhases s m hm Γ B K ρ) ε M (scheduleProcessDeadline s m) 0 hn
      (augInitialState B hB (scheduleProcessDeadline s m) 0) (J-1+1) ω).val.physical.process.stopped ≠ true := by
    rw [hJ']
    exact he
  have h := recycledPhaseState_deadline_inactive _ ε M _ 0 hn _ (J-1) ω he' p hp
  rw [hJ'] at h
  exact h

end NoThreeLine

#print axioms NoThreeLine.scheduleProcessState_noThree
#print axioms NoThreeLine.scheduleProcessState_expected_credit
#print axioms NoThreeLine.scheduleProcessOutput_inactive
