import NoThreeLine.PhasePointLaw
import NoThreeLine.SavedCreditHistory

/-! Actual phase-history observables under the terminal point measure,
including positivity of the current credit almost surely under that law. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine

theorem phasePointCredit_measurable_history {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B) (p : Grid n) (k : ℕ) :
    @Measurable (BoardClockPath n) ℝ
      (recycledPhasesFiltration cs ε M deadline start hn (augInitialState B hB deadline start) k)
      inferInstance (phasePointCredit cs ε M deadline start hn hB p k) :=
  (validAugStateCredit_measurable B p).comp
    (recycledPhaseState_measurable_history cs ε M deadline start hn _ k)

theorem phasePointMeasure_history_integral {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B) (p : Grid n)
    (k N : ℕ) (hk : k≤N) (f : BoardClockPath n → ℝ)
    (hf : @Measurable (BoardClockPath n) ℝ
      (recycledPhasesFiltration cs ε M deadline start hn (augInitialState B hB deadline start) k) inferInstance f)
    (C : ℝ) (hb : ∀ω,0≤f ω ∧ f ω≤C) :
    (∫ω,f ω ∂phasePointMeasure cs ε M deadline start hn hB p N)=
      ∫ω,phasePointCredit cs ε M deadline start hn hB p k ω*f ω ∂boardClockMeasure n (B/n) := by
  let hB0 := lt_of_lt_of_le zero_lt_one hB
  letI := boardClockMeasure_probability n (B/n) (div_pos hB0 (by exact_mod_cast hn))
  have hfm : Measurable f := hf.mono
    ((recycledPhasesFiltration cs ε M deadline start hn (augInitialState B hB deadline start)).le k) le_rfl
  have hi : Integrable ((phasePointCredit cs ε M deadline start hn hB p N)*f) (boardClockMeasure n (B/n)) := by
    apply GenericCreditIteration.bounded_nonnegative_integrable _ _
      ((phasePointCredit_measurable cs ε M deadline start hn hB p N).mul hfm) (B*C)
    intro ω
    have hz := phasePointCredit_bounds cs ε M deadline start hn hB p N ω
    exact ⟨mul_nonneg hz.1 (hb ω).1,mul_le_mul hz.2 (hb ω).2 (hb ω).1 hB0.le⟩
  exact savedCreditMeasure_history_integral _ (recycledPhasesFiltration cs ε M deadline start hn _)
    _ _ (phasePointCredit_measurable cs ε M deadline start hn hB p N)
    (phasePointCredit_integrable cs ε M deadline start hn hB p N)
    (fun ω=>(phasePointCredit_bounds cs ε M deadline start hn hB p N ω).1) k
    (recycledPhaseState_credit_condExp cs ε M deadline start hn hB0 _ p k N hk) f hf hi

theorem phasePointMeasure_current_credit_pos {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B) (p : Grid n)
    (k N : ℕ) (hk : k≤N) :
    ∀ᵐω ∂phasePointMeasure cs ε M deadline start hn hB p N,
      0<phasePointCredit cs ε M deadline start hn hB p k ω := by
  let ν := phasePointMeasure cs ε M deadline start hn hB p N
  letI : IsProbabilityMeasure ν := phasePointMeasure_probability cs ε M deadline start hn hB p N
  let E := {ω | phasePointCredit cs ε M deadline start hn hB p k ω≤0}
  have hE : MeasurableSet[recycledPhasesFiltration cs ε M deadline start hn
      (augInitialState B hB deadline start) k] E :=
    measurableSet_Iic.preimage (phasePointCredit_measurable_history cs ε M deadline start hn hB p k)
  have hEm := (recycledPhasesFiltration cs ε M deadline start hn (augInitialState B hB deadline start)).le k E hE
  have hz : ν.real E=0 := by
    rw [phasePointMeasure_history_event cs ε M deadline start hn hB p k N hk E hE]
    calc
      _ = ∫ω in E,(0:ℝ) ∂boardClockMeasure n (B/n) :=
        setIntegral_congr_fun hEm (fun ω hω=>le_antisymm hω
          (phasePointCredit_bounds cs ε M deadline start hn hB p k ω).1)
      _ = 0 := by simp
  have hzero : ν E=0 := by
    rw [measureReal_def,ENNReal.toReal_eq_zero_iff] at hz
    exact hz.resolve_right (measure_ne_top ν E)
  rw [ae_iff]
  simpa only [not_lt] using hzero

theorem phasePointMeasure_absolutelyContinuous {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B) (p : Grid n) (N : ℕ) :
    phasePointMeasure cs ε M deadline start hn hB p N ≪ boardClockMeasure n (B/n) :=
  savedCreditMeasure_absolutelyContinuous _ _

end NoThreeLine

#print axioms NoThreeLine.phasePointMeasure_history_integral
#print axioms NoThreeLine.phasePointMeasure_current_credit_pos
