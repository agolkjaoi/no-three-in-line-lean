import NoThreeLine.SavedCreditMeasure

/-! The point law is an actual probability measure on the same original
board, with density given by terminal saved credit of the canonical process.
Its earlier phase-history density is proved using the actual martingale. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine

theorem StateHistory.state_measurable {S Ω : Type*} [MeasurableSpace S] [MeasurableSpace Ω]
    (X : ℕ → Ω → S) (hX : ∀k,Measurable (X k)) (k : ℕ) :
    @Measurable Ω S (StateHistory.filtration X hX k) inferInstance (X k) :=
  (measurable_pi_apply (Fin.last k)).comp (comap_measurable (StateHistory.history X k))

theorem recycledPhaseState_measurable_history {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0<n) (e : ValidAugmentedState n B) (k : ℕ) :
    @Measurable (BoardClockPath n) (ValidAugmentedState n B)
      (recycledPhasesFiltration cs ε M deadline start hn e k) inferInstance
        (recycledPhaseState cs ε M deadline start hn e k) :=
  measurable_snd.comp (StateHistory.state_measurable
    (fun j ω=>(recycledPhases cs ε M deadline start hn e j ω).1)
    (fun j=>(recycledPhases_measurable cs ε M deadline start hn e j).fst) k)

def phasePointCredit {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B) (p : Grid n)
    (k : ℕ) (ω : BoardClockPath n) : ℝ :=
  validAugStateCredit B p
    (recycledPhaseState cs ε M deadline start hn (augInitialState B hB deadline start) k ω)

theorem phasePointCredit_measurable {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B) (p : Grid n) (k : ℕ) :
    Measurable (phasePointCredit cs ε M deadline start hn hB p k) :=
  (validAugStateCredit_measurable B p).comp
    (recycledPhaseState_measurable cs ε M deadline start hn _ k)

theorem phasePointCredit_bounds {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B) (p : Grid n)
    (k : ℕ) (ω : BoardClockPath n) :
    0≤phasePointCredit cs ε M deadline start hn hB p k ω ∧
      phasePointCredit cs ε M deadline start hn hB p k ω≤B := validAugStateCredit_bounds B p _

theorem phasePointCredit_integrable {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B) (p : Grid n) (k : ℕ) :
    Integrable (phasePointCredit cs ε M deadline start hn hB p k) (boardClockMeasure n (B/n)) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos (lt_of_lt_of_le zero_lt_one hB) (by exact_mod_cast hn))
  exact GenericCreditIteration.bounded_nonnegative_integrable _ _
    (phasePointCredit_measurable cs ε M deadline start hn hB p k) B
    (phasePointCredit_bounds cs ε M deadline start hn hB p k)

theorem phasePointCredit_mean {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B) (p : Grid n) (k : ℕ) :
    (∫ω,phasePointCredit cs ε M deadline start hn hB p k ω ∂boardClockMeasure n (B/n))=1 :=
  recycledPhaseState_initial_expected_credit cs ε M deadline start hn hB k p

def phasePointMeasure {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B) (p : Grid n) (N : ℕ) : Measure (BoardClockPath n) :=
  savedCreditMeasure (boardClockMeasure n (B/n)) (phasePointCredit cs ε M deadline start hn hB p N)

theorem phasePointMeasure_probability {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B) (p : Grid n) (N : ℕ) :
    IsProbabilityMeasure (phasePointMeasure cs ε M deadline start hn hB p N) :=
  savedCreditMeasure_probability _ _ (phasePointCredit_integrable cs ε M deadline start hn hB p N)
    (fun ω=>(phasePointCredit_bounds cs ε M deadline start hn hB p N ω).1)
    (phasePointCredit_mean cs ε M deadline start hn hB p N)

theorem phasePointMeasure_history_event {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B) (p : Grid n)
    (k N : ℕ) (hk : k≤N) (E : Set (BoardClockPath n))
    (hE : MeasurableSet[recycledPhasesFiltration cs ε M deadline start hn
      (augInitialState B hB deadline start) k] E) :
    (phasePointMeasure cs ε M deadline start hn hB p N).real E=
      ∫ω in E,phasePointCredit cs ε M deadline start hn hB p k ω ∂boardClockMeasure n (B/n) := by
  let hB0 := lt_of_lt_of_le zero_lt_one hB
  letI := boardClockMeasure_probability n (B/n) (div_pos hB0 (by exact_mod_cast hn))
  exact savedCreditMeasure_history_event _ (recycledPhasesFiltration cs ε M deadline start hn _)
    _ _ (phasePointCredit_integrable cs ε M deadline start hn hB p N)
    (fun ω=>(phasePointCredit_bounds cs ε M deadline start hn hB p N ω).1) k
    (recycledPhaseState_credit_condExp cs ε M deadline start hn hB0 _ p k N hk) E hE

end NoThreeLine

#print axioms NoThreeLine.phasePointMeasure_probability
#print axioms NoThreeLine.phasePointMeasure_history_event
