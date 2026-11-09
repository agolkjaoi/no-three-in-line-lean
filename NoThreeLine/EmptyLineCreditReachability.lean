import NoThreeLine.EmptyLineCreditInvariant
import NoThreeLine.AugmentedInitialization

/-! Empty physical lines have r=1 along all actual finite augmented
iterations, terminal selection and scheduled deadline-retired phases. -/
set_option autoImplicit false
noncomputable section

namespace NoThreeLine
open AuxiliaryODE

theorem emptyLineCredit_augTimedStep {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (s : AugTimedState cfg) (z : (ℝ × Grid n) × ℝ) (he : EmptyLineCredit s.val.1.physical) :
    EmptyLineCredit (augTimedStep cfg ε M (s,z)).val.1.physical := by
  change EmptyLineCredit (augTimedStepPair cfg ε M (s,z)).1.physical
  unfold augTimedStepPair
  split_ifs
  · exact he
  · exact emptyLineCredit_augOutcome cfg ε M _ s.property.1.1 he z

theorem emptyLineCredit_augTimedNoiseState {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0<n)
    (s : AugTimedState cfg) (he : EmptyLineCredit s.val.1.physical)
    (k : ℕ) (ω : ℕ → BoardClockPath n) :
    EmptyLineCredit (augTimedNoiseState cfg ε M hn s k ω).val.1.physical := by
  induction k with
  | zero => exact he
  | succ k ih => exact emptyLineCredit_augTimedStep cfg ε M _ _ ih

theorem emptyLineCredit_augTimedTerminal {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0<n)
    (s : AugTimedState cfg) (he : EmptyLineCredit s.val.1.physical) (ω : ℕ → BoardClockPath n) :
    EmptyLineCredit (augTimedTerminal cfg ε M hn s ω).val.1.physical :=
  emptyLineCredit_augTimedNoiseState cfg ε M hn s he _ ω

theorem emptyLineCredit_augValidDeadlineRetirement {n : ℕ} {B : ℝ} (deadline : Grid n → ℝ)
    (t : ℝ) (e : ValidAugmentedState n B) (he : EmptyLineCredit e.val.physical) :
    EmptyLineCredit (augValidDeadlineRetirement deadline t e).val.physical := by
  unfold augValidDeadlineRetirement
  split_ifs
  · exact he
  · exact emptyLineCredit_retire e.val.physical he _

theorem emptyLineCredit_augInitialState {n : ℕ} (B : ℝ) (hB : 1≤B) (deadline : Grid n → ℝ)
    (start : ℝ) : EmptyLineCredit (augInitialState B hB deadline start).val.physical :=
  emptyLineCredit_augValidDeadlineRetirement deadline start _ (emptyLineCredit_initial n)

theorem emptyLineCredit_augPhaseTerminal {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0<n)
    (e : ValidAugmentedState n cfg.B) (he : EmptyLineCredit e.val.physical) (ω : PhaseNoise n) :
    EmptyLineCredit (augPhaseTerminal cfg ε M hn (e,ω)).val.physical :=
  emptyLineCredit_augTimedTerminal cfg ε M hn (augPhaseStart cfg ε M e) he ω

theorem emptyLineCredit_augScheduledPhase {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0<n) (j : ℕ)
    (e : ValidAugmentedState n B) (he : EmptyLineCredit e.val.physical) (ω : PhaseNoise n) :
    EmptyLineCredit (augScheduledPhase cs ε M deadline start hn j (e,ω)).val.physical :=
  emptyLineCredit_augValidDeadlineRetirement deadline _ _
    (emptyLineCredit_augPhaseTerminal (cs j).config ε M hn e he ω)

theorem emptyLineCredit_augFinitePhaseState {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0<n) (k : ℕ)
    (e : ValidAugmentedState n B) (he : EmptyLineCredit e.val.physical) (v : Fin k → PhaseNoise n) :
    EmptyLineCredit (augFinitePhaseState cs ε M deadline start hn k e v).val.physical := by
  induction k with
  | zero => exact he
  | succ k ih =>
    rw [augFinitePhaseState_succ]
    exact emptyLineCredit_augScheduledPhase cs ε M deadline start hn k _ (ih _) _

theorem emptyLineCredit_augFinitePhase_initial {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (k : ℕ) (v : Fin k → PhaseNoise n) :
    EmptyLineCredit
      (augFinitePhaseState cs ε M deadline start hn k (augInitialState B hB deadline start) v).val.physical :=
  emptyLineCredit_augFinitePhaseState cs ε M deadline start hn k _
    (emptyLineCredit_augInitialState B hB deadline start) v

end NoThreeLine

#print axioms NoThreeLine.emptyLineCredit_augTimedTerminal
#print axioms NoThreeLine.emptyLineCredit_augFinitePhase_initial
