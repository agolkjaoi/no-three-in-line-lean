import NoThreeLine.PhasePointLaw
import NoThreeLine.CreditLossRate

/-! At every actual phase endpoint, lost birth credit has expectation equal
to its unavailability event under the same terminal point law. This is an
exact identity; small loss probabilities are a separate obligation. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine

theorem validProcess_measurable {n : ℕ} (B : ℝ) :
    Measurable (fun s : ValidAugmentedState n B=>s.val.physical.process) :=
  (ExtendedState.measurable_process n).comp ((AugmentedState.measurable_physical n).comp measurable_subtype_coe)

def phaseUnavailableEvent {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B) (p : Grid n) (k : ℕ) : Set (BoardClockPath n) :=
  {ω | (recycledPhaseState cs ε M deadline start hn (augInitialState B hB deadline start) k ω).val.physical.process.birthUnavailable p}

theorem phaseUnavailableEvent_history {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B) (p : Grid n) (k : ℕ) :
    MeasurableSet[recycledPhasesFiltration cs ε M deadline start hn (augInitialState B hB deadline start) k]
      (phaseUnavailableEvent cs ε M deadline start hn hB p k) :=
  (ProcessState.birthUnavailable_measurableSet p).preimage
    ((validProcess_measurable B).comp (recycledPhaseState_measurable_history cs ε M deadline start hn _ k))

def phaseBirthCreditLoss {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B) (p : Grid n)
    (k : ℕ) (ω : BoardClockPath n) : ℝ :=
  (recycledPhaseState cs ε M deadline start hn (augInitialState B hB deadline start) k ω).val.physical.process.birthCreditLoss p

theorem phaseBirthCreditLoss_measurable {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B) (p : Grid n) (k : ℕ) :
    Measurable (phaseBirthCreditLoss cs ε M deadline start hn hB p k) :=
  (ProcessState.birthCreditLoss_measurable p).comp
    ((validProcess_measurable B).comp (recycledPhaseState_measurable cs ε M deadline start hn _ k))

theorem phaseBirthCreditLoss_bounds {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B) (p : Grid n)
    (k : ℕ) (ω : BoardClockPath n) :
    0≤phaseBirthCreditLoss cs ε M deadline start hn hB p k ω ∧
      phaseBirthCreditLoss cs ε M deadline start hn hB p k ω≤B := by
  have h := phasePointCredit_bounds cs ε M deadline start hn hB p k ω
  have h' := ProcessState.birthCreditLoss_bounds
    (recycledPhaseState cs ε M deadline start hn (augInitialState B hB deadline start) k ω).val.physical.process p h.1
  exact ⟨h'.1,h'.2.trans h.2⟩

theorem phaseBirthCreditLoss_integrable {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B) (p : Grid n) (k : ℕ) :
    Integrable (phaseBirthCreditLoss cs ε M deadline start hn hB p k) (boardClockMeasure n (B/n)) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos (lt_of_lt_of_le zero_lt_one hB) (by exact_mod_cast hn))
  exact GenericCreditIteration.bounded_nonnegative_integrable _ _
    (phaseBirthCreditLoss_measurable cs ε M deadline start hn hB p k) B
    (phaseBirthCreditLoss_bounds cs ε M deadline start hn hB p k)

theorem phaseBirthCreditLoss_mean {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B) (p : Grid n)
    (k N : ℕ) (hk : k≤N) :
    (∫ω,phaseBirthCreditLoss cs ε M deadline start hn hB p k ω ∂boardClockMeasure n (B/n))=
      (phasePointMeasure cs ε M deadline start hn hB p N).real
        (phaseUnavailableEvent cs ε M deadline start hn hB p k) := by
  have hE := phaseUnavailableEvent_history cs ε M deadline start hn hB p k
  have hEm := (recycledPhasesFiltration cs ε M deadline start hn (augInitialState B hB deadline start)).le k _ hE
  have heq : phaseBirthCreditLoss cs ε M deadline start hn hB p k=
      (phaseUnavailableEvent cs ε M deadline start hn hB p k).indicator
        (phasePointCredit cs ε M deadline start hn hB p k) := by
    funext ω
    simp only [phaseBirthCreditLoss,ProcessState.birthCreditLoss,phaseUnavailableEvent,
      Set.indicator,Set.mem_setOf_eq,phasePointCredit,validAugStateCredit]
  rw [heq,integral_indicator hEm]
  exact (phasePointMeasure_history_event cs ε M deadline start hn hB p k N hk _ hE).symm

theorem phase_birthRate_mean_pointLaw {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B) (p : Grid n)
    (k N : ℕ) (hk : k≤N) (mask : Grid n → ℝ) :
    (∫ω,(recycledPhaseState cs ε M deadline start hn (augInitialState B hB deadline start) k ω).val.physical.process.birthRate mask p
      ∂boardClockMeasure n (B/n))=(mask p/n)*
        (1-(phasePointMeasure cs ε M deadline start hn hB p N).real
          (phaseUnavailableEvent cs ε M deadline start hn hB p k)) := by
  simp_rw [ProcessState.birthRate_credit_loss]
  change (∫ω,(mask p/n)*(phasePointCredit cs ε M deadline start hn hB p k ω-
    phaseBirthCreditLoss cs ε M deadline start hn hB p k ω) ∂boardClockMeasure n (B/n))=_
  rw [integral_const_mul,integral_sub
    (phasePointCredit_integrable cs ε M deadline start hn hB p k)
    (phaseBirthCreditLoss_integrable cs ε M deadline start hn hB p k),
    phasePointCredit_mean cs ε M deadline start hn hB p k,
    phaseBirthCreditLoss_mean cs ε M deadline start hn hB p k N hk]

end NoThreeLine

#print axioms NoThreeLine.phaseBirthCreditLoss_mean
#print axioms NoThreeLine.phase_birthRate_mean_pointLaw
