import NoThreeLine.CutCreditLossMonotone
import NoThreeLine.ScheduledCutRetirementCauses
import NoThreeLine.ScheduledWeightCompletion

/-! All actual inherited cut losses are bounded by the same full-J saved
credit. Actual original-board completion is supplied internally almost
surely, simultaneously for every phase and every real cut parameter. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open MeasureTheory

namespace NoThreeLine.BirthWitness

theorem scheduledCutCreditLoss_le_phase_terminal {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (s : GoodPhaseObservation n B) (p : Grid n) (N : ℕ) (t : ℝ) (ω : BoardClockPath n)
    (hd : AugTimedDone (cs N).config (augRecycledTerminal (cs N).config ε M hn
      (augPhaseStart (cs N).config ε M (recycledPhaseState cs ε M deadline start hn s.val.1 N ω))
      (recycledPhases cs ε M deadline start hn s.val.1 N ω).2)) :
    scheduledCutCreditLoss cs ε M deadline start hn s p N (ω,t) ≤
      (augRecycledTerminal (cs N).config ε M hn
        (augPhaseStart (cs N).config ε M (recycledPhaseState cs ε M deadline start hn s.val.1 N ω))
        (recycledPhases cs ε M deadline start hn s.val.1 N ω).2).val.1.physical.process.birthCreditLoss p := by
  let y := goodPhases cs ε M deadline start hn s N ω
  let δ := elapsedCutAmount (cs N).horizon t
  have hy := goodPhases_birth_projection cs ε M deadline start hn s N ω
  have hs : (goodPhaseStart (cs N).config ε M y.1).val.1 =
      augPhaseStart (cs N).config ε M (recycledPhaseState cs ε M deadline start hn s.val.1 N ω) :=
    congrArg (augPhaseStart (cs N).config ε M) (congrArg Prod.fst hy)
  have hv : y.2 = (recycledPhases cs ε M deadline start hn s.val.1 N ω).2 := congrArg Prod.snd hy
  have hdone : AugTimedDone (cs N).config (augRecycledTerminal (cs N).config ε M hn
      (goodPhaseStart (cs N).config ε M y.1).val.1 y.2) := by
    rw [hs,hv]
    exact hd
  have h := sourceCutTerminal_birthCreditLoss_le (cs N).config ε M (phaseEndpoint cs start N) δ
    δ.coe_nonneg hn (goodPhaseStart (cs N).config ε M y.1) p y.2 hdone
  change scheduledCutCreditLoss cs ε M deadline start hn s p N (ω,t) ≤ _ at h
  rw [hs,hv] at h
  exact h

theorem scheduledCutCreditLoss_le_full_loss {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (s : GoodPhaseObservation n B) (p : Grid n) (N J : ℕ) (hN : N < J)
    (t : ℝ) (ω : BoardClockPath n)
    (hd : AugTimedDone (cs N).config (augRecycledTerminal (cs N).config ε M hn
      (augPhaseStart (cs N).config ε M (recycledPhaseState cs ε M deadline start hn s.val.1 N ω))
      (recycledPhases cs ε M deadline start hn s.val.1 N ω).2)) :
    scheduledCutCreditLoss cs ε M deadline start hn s p N (ω,t) ≤
      (recycledPhaseState cs ε M deadline start hn s.val.1 J ω).val.physical.process.birthCreditLoss p := by
  have hc := scheduledCutCreditLoss_le_phase_terminal cs ε M deadline start hn s p N t ω hd
  have hb := augValidDeadlineRetirement_birthCreditLoss_mono deadline (phaseEndpoint cs start (N+1))
    (augPhaseRecycledPair (cs N).config ε M hn
      (recycledPhaseState cs ε M deadline start hn s.val.1 N ω,
        (recycledPhases cs ε M deadline start hn s.val.1 N ω).2)).1 p
  have he : recycledPhaseState cs ε M deadline start hn s.val.1 (N+1) ω =
      (recycledScheduledPair cs ε M deadline start hn N
        (recycledPhaseState cs ε M deadline start hn s.val.1 N ω,
          (recycledPhases cs ε M deadline start hn s.val.1 N ω).2)).1 := by
    unfold recycledPhaseState
    rw [recycledPhases_succ]
  have hnext : scheduledCutCreditLoss cs ε M deadline start hn s p N (ω,t) ≤
      (recycledPhaseState cs ε M deadline start hn s.val.1 (N+1) ω).val.physical.process.birthCreditLoss p := by
    rw [he]
    exact hc.trans hb
  exact hnext.trans (recycledPhaseState_birthCreditLoss_monotone cs ε M deadline start hn s.val.1 p ω
    (Nat.succ_le_of_lt hN))

theorem initial_scheduledCutCreditLoss_le_full_credit_ae {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (p : Grid n) (J : ℕ) :
    ∀ᵐ ω ∂boardClockMeasure n (B/n), ∀ N < J, ∀ t : ℝ,
      scheduledCutCreditLoss cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) p N (ω,t) ≤
        phasePointCredit cs ε M deadline start hn hB p J ω := by
  filter_upwards [initial_scheduledUnobservedPhaseCompletion_all_ae cs ε M deadline start hn hB] with ω hω
  intro N hN t
  have h := scheduledCutCreditLoss_le_full_loss cs ε M deadline start hn
    (initialGoodPhaseObservation B hB deadline start) p N J hN t ω (hω N)
  exact h.trans ((ProcessState.birthCreditLoss_bounds _ p
    (phasePointCredit_bounds cs ε M deadline start hn hB p J ω).1).2)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.scheduledCutCreditLoss_le_full_loss
#print axioms NoThreeLine.BirthWitness.initial_scheduledCutCreditLoss_le_full_credit_ae
