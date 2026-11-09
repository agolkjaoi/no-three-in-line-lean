import NoThreeLine.ScheduledCutLossTerminalBound
import NoThreeLine.CutRetirementWeightCause

/-! Actual early cut-loss probabilities are bounded under the single
full-J saved-credit point law by weight-cap and explicit other causes.
This uses a loss/terminal-credit inequality, not an assumed equality of
cut and future point measures on arbitrary history events. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open MeasureTheory Set

namespace NoThreeLine
open BirthWitness

def scheduledRetirementCauseEvent {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n)
    (e : ValidAugmentedState n B) (p : Grid n) (J : ℕ) : Set (BoardClockPath n) :=
  scheduledActualWeightCapBefore cs ε M deadline start hn e p J ∪
    scheduledNonWeightBoundaryBefore cs ε M deadline start hn e p J

theorem scheduledRetirementCauseEvent_measurableSet {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n)
    (e : ValidAugmentedState n B) (p : Grid n) (J : ℕ) :
    MeasurableSet (scheduledRetirementCauseEvent cs ε M deadline start hn e p J) :=
  (scheduledActualWeightCapBefore_measurableSet cs ε M deadline start hn e p J).union
    (scheduledNonWeightBoundaryBefore_measurableSet cs ε M deadline start hn e p J)

theorem scheduledRetirementCauseEvent_mono {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n)
    (e : ValidAugmentedState n B) (p : Grid n) {I J : ℕ} (hIJ : I ≤ J) :
    scheduledRetirementCauseEvent cs ε M deadline start hn e p I ⊆
      scheduledRetirementCauseEvent cs ε M deadline start hn e p J := by
  intro ω h
  rcases h with (⟨i,hi,k,hk⟩ | ⟨i,hi,k,hk⟩) | ⟨i,hi,k,hk⟩
  · exact Or.inl (Or.inl ⟨i,hi.trans_le hIJ,k,hk⟩)
  · exact Or.inl (Or.inr ⟨i,hi.trans_le hIJ,k,hk⟩)
  · exact Or.inr ⟨i,hi.trans_le hIJ,k,hk⟩

namespace BirthWitness

theorem initial_scheduledCutLoss_mean_le_full_point_cause {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (p : Grid n) (N J : ℕ) (hN : N < J) (t : ℝ)
    (ht : t ∈ Icc (0 : ℝ) (cs N).horizon)
    (hdeadline : phaseEndpoint cs start N+t < deadline p) :
    (∫ ω, scheduledCutCreditLoss cs ε M deadline start hn
      (initialGoodPhaseObservation B hB deadline start) p N (ω,t) ∂boardClockMeasure n (B/n)) ≤
      (phasePointMeasure cs ε M deadline start hn hB p J).real
        (scheduledRetirementCauseEvent cs ε M deadline start hn (augInitialState B hB deadline start) p J) := by
  let E := scheduledRetirementCauseEvent cs ε M deadline start hn (augInitialState B hB deadline start) p J
  let Z := phasePointCredit cs ε M deadline start hn hB p J
  let ν := boardClockMeasure n (B/n)
  have hE : MeasurableSet E := scheduledRetirementCauseEvent_measurableSet cs ε M deadline start hn _ p J
  have hZi : Integrable Z ν := phasePointCredit_integrable cs ε M deadline start hn hB p J
  have hZiE : Integrable (E.indicator Z) ν := hZi.indicator hE
  have hLi : Integrable (fun ω => scheduledCutCreditLoss cs ε M deadline start hn
      (initialGoodPhaseObservation B hB deadline start) p N (ω,t)) ν :=
    scheduledCutCreditLoss_integrable cs ε M deadline start hn (zero_lt_one.trans_le hB) _ p N t
  have hb : ∀ᵐ ω ∂ν, scheduledCutCreditLoss cs ε M deadline start hn
      (initialGoodPhaseObservation B hB deadline start) p N (ω,t) ≤ E.indicator Z ω := by
    filter_upwards [initial_scheduledCutCreditLoss_le_full_credit_ae cs ε M deadline start hn hB p J] with ω hω
    by_cases he : ω ∈ E
    · rw [Set.indicator_of_mem he]
      exact hω N hN t
    · rw [Set.indicator_of_notMem he]
      apply le_of_not_gt
      intro hpos
      have hcause := initial_scheduledCut_early_positive_loss_weight_or_other cs ε M deadline start hn
        hB p N t ω ht hdeadline hpos
      exact he (scheduledRetirementCauseEvent_mono cs ε M deadline start hn _ p
        (Nat.succ_le_of_lt hN) hcause)
  have hbound := integral_mono_ae hLi hZiE hb
  change _ ≤ (savedCreditMeasure ν Z).real E
  rw [savedCreditMeasure_real_apply ν Z hZi (fun ω => (phasePointCredit_bounds cs ε M deadline start hn hB p J ω).1) E hE,
    ← integral_indicator hE]
  exact hbound

theorem scheduledCutLossProbability_le_full_point_causes {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (p : Grid n) (N J : ℕ) (hN : N < J) (t : ℝ)
    (ht : t ∈ Icc (0 : ℝ) (cs N).horizon)
    (hdeadline : phaseEndpoint cs start N+t < deadline p) :
    scheduledCutLossProbability cs ε M deadline start hn hB p N t ≤
      (phasePointMeasure cs ε M deadline start hn hB p J).real
        (scheduledActualWeightCapBefore cs ε M deadline start hn (augInitialState B hB deadline start) p J) +
      (phasePointMeasure cs ε M deadline start hn hB p J).real
        (scheduledNonWeightBoundaryBefore cs ε M deadline start hn (augInitialState B hB deadline start) p J) := by
  letI := phasePointMeasure_probability cs ε M deadline start hn hB p J
  rw [scheduledCutLossProbability_eq_mean]
  exact (initial_scheduledCutLoss_mean_le_full_point_cause cs ε M deadline start hn hB p N J hN t ht hdeadline).trans
    (measureReal_union_le _ _)

end BirthWitness
end NoThreeLine

#print axioms NoThreeLine.scheduledRetirementCauseEvent_measurableSet
#print axioms NoThreeLine.BirthWitness.initial_scheduledCutLoss_mean_le_full_point_cause
#print axioms NoThreeLine.BirthWitness.scheduledCutLossProbability_le_full_point_causes
