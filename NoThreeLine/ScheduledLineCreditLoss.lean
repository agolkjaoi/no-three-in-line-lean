import NoThreeLine.LineCreditCalendar
import NoThreeLine.RecycledPhaseComposition

/-! Actual line-credit loss across every phase on the same original
board. Absolute deadline retirement preserves the line-credit coordinate. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine
open AuxiliaryODE

theorem augValidDeadlineRetirement_lineCredits {n : ℕ} {B : ℝ} (deadline : Grid n → ℝ)
    (t : ℝ) (e : ValidAugmentedState n B) :
    (augValidDeadlineRetirement deadline t e).val.physical.lineCredits = e.val.physical.lineCredits := by
  unfold augValidDeadlineRetirement
  split <;> rfl

theorem recycledScheduledPair_lineCredit_loss {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (j : ℕ)
    (L : LineIndex n) (e : ValidAugmentedState n B) (ω : BoardClockPath n) :
    terminalLineCreditLoss (cs j).config ε M hn L (augPhaseStart (cs j).config ε M e) ω =
      e.val.physical.lineCredits L -
        (recycledScheduledPair cs ε M deadline start hn j (e,ω)).1.val.physical.lineCredits L := by
  rw [terminalLineCreditLoss_eq]
  unfold recycledScheduledPair
  rw [augValidDeadlineRetirement_lineCredits]
  rfl

def scheduledLineCreditLoss {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n)
    (L : LineIndex n) (e : ValidAugmentedState n B) (J : ℕ) (ω : BoardClockPath n) : ℝ :=
  ∑ j ∈ Finset.range J, terminalLineCreditLoss (cs j).config ε M hn L
    (augPhaseStart (cs j).config ε M (recycledPhaseState cs ε M deadline start hn e j ω))
    (recycledPhases cs ε M deadline start hn e j ω).2

theorem scheduledLineCreditLoss_eq {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n)
    (L : LineIndex n) (e : ValidAugmentedState n B) (J : ℕ) (ω : BoardClockPath n) :
    scheduledLineCreditLoss cs ε M deadline start hn L e J ω =
      e.val.physical.lineCredits L -
        (recycledPhaseState cs ε M deadline start hn e J ω).val.physical.lineCredits L := by
  induction J with
  | zero => simp [scheduledLineCreditLoss,recycledPhaseState,recycledPhases,RecycledBoardProcess.iterate]
  | succ J ih =>
    change (∑ j ∈ Finset.range (J+1), _) = _
    rw [Finset.sum_range_succ]
    change scheduledLineCreditLoss cs ε M deadline start hn L e J ω + _ = _
    rw [ih,recycledScheduledPair_lineCredit_loss]
    have hs : recycledPhaseState cs ε M deadline start hn e (J+1) ω =
        (recycledScheduledPair cs ε M deadline start hn J
          (recycledPhaseState cs ε M deadline start hn e J ω,
            (recycledPhases cs ε M deadline start hn e J ω).2)).1 := by
      unfold recycledPhaseState
      rw [recycledPhases_succ]
    rw [hs]
    ring

theorem scheduledLineCreditLoss_bounds {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n)
    (L : LineIndex n) (e : ValidAugmentedState n B) (J : ℕ) (ω : BoardClockPath n) :
    0 ≤ scheduledLineCreditLoss cs ε M deadline start hn L e J ω ∧
      scheduledLineCreditLoss cs ε M deadline start hn L e J ω ≤ 1 := by
  constructor
  · exact Finset.sum_nonneg (fun j _ => (terminalLineCreditLoss_bounds (cs j).config ε M hn L _ _).1)
  · rw [scheduledLineCreditLoss_eq]
    exact (sub_le_self _ ((recycledPhaseState cs ε M deadline start hn e J ω).property.1.2.1.2.2 L).1).trans
      (e.property.1.2.1.2.2 L).2

theorem scheduledLineCreditLoss_measurable {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n)
    (L : LineIndex n) (e : ValidAugmentedState n B) (J : ℕ) :
    Measurable (scheduledLineCreditLoss cs ε M deadline start hn L e J) := by
  rw [funext (scheduledLineCreditLoss_eq cs ε M deadline start hn L e J)]
  exact measurable_const.sub ((measurable_pi_apply L).comp
    ((ExtendedState.measurable_lineCredits n).comp ((AugmentedState.measurable_physical n).comp
      (measurable_subtype_coe.comp (recycledPhaseState_measurable cs ε M deadline start hn e J)))))

theorem scheduledLineCreditLoss_calendar_sum {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (hB : 0 < B)
    (L : LineIndex n) (e : ValidAugmentedState n B) (J : ℕ) (ω : BoardClockPath n) :
    scheduledLineCreditLoss cs ε M deadline start hn L e J ω =
      ∑ j ∈ Finset.range J, ∫ t in (0 : ℝ)..(cs j).horizon,
        terminalLineCreditCalendarRate (cs j).config ε M L hn
          (augPhaseStart (cs j).config ε M (recycledPhaseState cs ε M deadline start hn e j ω))
          ((recycledPhases cs ε M deadline start hn e j ω).2,t) := by
  apply Finset.sum_congr rfl
  intro j _
  rw [terminalLineCreditLoss_eq]
  exact (terminalLineCreditCalendarRate_integral (cs j).config ε M L hn hB (cs j).mask_le_one
    (augPhaseStart (cs j).config ε M (recycledPhaseState cs ε M deadline start hn e j ω))
    (recycledPhases cs ε M deadline start hn e j ω).2).symm

theorem initial_scheduledLineCreditLoss_eq {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (hB : 1 ≤ B)
    (L : LineIndex n) (J : ℕ) (ω : BoardClockPath n) :
    scheduledLineCreditLoss cs ε M deadline start hn L (augInitialState B hB deadline start) J ω =
      1 - (recycledPhaseState cs ε M deadline start hn (augInitialState B hB deadline start) J ω).val.physical.lineCredits L := by
  rw [scheduledLineCreditLoss_eq]
  unfold augInitialState
  rw [augValidDeadlineRetirement_lineCredits]
  rfl

end NoThreeLine

#print axioms NoThreeLine.scheduledLineCreditLoss_eq
#print axioms NoThreeLine.scheduledLineCreditLoss_bounds
#print axioms NoThreeLine.scheduledLineCreditLoss_calendar_sum
#print axioms NoThreeLine.initial_scheduledLineCreditLoss_eq
