import NoThreeLine.SourceCutMeasurable
import NoThreeLine.SavedCreditMeasure
import NoThreeLine.CreditLossRate

/-! Point-density and credit-loss identities for the constructed same-cfg
cut process. Its final-interval identification with the uncut calendar path
is deliberately not asserted in this module. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped NNReal

namespace NoThreeLine.BirthWitness

def cutProcess {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (s : GoodObservation cfg) (x : ℝ≥0×BoardClockPath n) : ProcessState n :=
  (sourceCutTerminal cfg ε M start x.1 x.1.coe_nonneg hn s x.2).1.val.1.physical.process

theorem cutProcess_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (s : GoodObservation cfg) : Measurable (cutProcess cfg ε M start hn s) :=
  (ExtendedState.measurable_process n).comp ((AugmentedState.measurable_physical n).comp
    (measurable_subtype_coe.comp (sourceCutTerminal_base_joint_measurable cfg ε M start hn s)).fst)

def cutCreditLoss {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (s : GoodObservation cfg) (p : Grid n) (x : ℝ≥0×BoardClockPath n) : ℝ :=
  (cutProcess cfg ε M start hn s x).birthCreditLoss p

theorem cutCreditLoss_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (s : GoodObservation cfg) (p : Grid n) : Measurable (cutCreditLoss cfg ε M start hn s p) :=
  (ProcessState.birthCreditLoss_measurable p).comp (cutProcess_measurable cfg ε M start hn s)

theorem cutCreditLoss_bounds {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (s : GoodObservation cfg) (p : Grid n) (x : ℝ≥0×BoardClockPath n) :
    0≤cutCreditLoss cfg ε M start hn s p x ∧ cutCreditLoss cfg ε M start hn s p x≤cfg.B := by
  have hc := sourceCutCredit_bounds cfg ε M start x.1 x.1.coe_nonneg hn s p x.2
  have hl := (cutProcess cfg ε M start hn s x).birthCreditLoss_bounds p hc.1
  exact ⟨hl.1,hl.2.trans hc.2⟩

theorem cutCreditLoss_integrable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (hB : 0<cfg.B) (s : GoodObservation cfg) (p : Grid n) (δ : ℝ≥0) :
    Integrable (fun ω=>cutCreditLoss cfg ε M start hn s p (δ,ω)) (boardClockMeasure n (cfg.B/n)) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  exact GenericCreditIteration.bounded_nonnegative_integrable _ _
    ((cutCreditLoss_measurable cfg ε M start hn s p).comp (measurable_const.prodMk measurable_id)) cfg.B
    (fun ω=>cutCreditLoss_bounds cfg ε M start hn s p (δ,ω))

def cutPointMeasure {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (s : GoodObservation cfg) (p : Grid n) (δ : ℝ≥0) : Measure (BoardClockPath n) :=
  savedCreditMeasure (boardClockMeasure n (cfg.B/n))
    (fun ω=>((cutProcess cfg ε M start hn s (δ,ω)).accounts p).credit)

theorem cutCredit_integrable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (hB : 0<cfg.B) (s : GoodObservation cfg) (p : Grid n) (δ : ℝ≥0) :
    Integrable (fun ω=>((cutProcess cfg ε M start hn s (δ,ω)).accounts p).credit)
      (boardClockMeasure n (cfg.B/n)) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  exact GenericCreditIteration.bounded_nonnegative_integrable _ _
    ((sourceCutCredit_joint_measurable cfg ε M start hn s p).comp (measurable_const.prodMk measurable_id)) cfg.B
    (sourceCutCredit_bounds cfg ε M start δ δ.coe_nonneg hn s p)

theorem cutPointMeasure_probability {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : GoodObservation cfg) (p : Grid n)
    (hs : augTimedCredit cfg p s.val.1=1) (δ : ℝ≥0) :
    IsProbabilityMeasure (cutPointMeasure cfg ε M start hn s p δ) :=
  savedCreditMeasure_probability _ _ (cutCredit_integrable cfg ε M start hn hB s p δ)
    (fun ω=>(sourceCutCredit_bounds cfg ε M start δ δ.coe_nonneg hn s p ω).1)
    (sourceCutTerminal_expected_credit_one cfg ε M start δ δ.coe_nonneg hn hB hm s p hs)

def cutUnavailableEvent {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (s : GoodObservation cfg) (p : Grid n) (δ : ℝ≥0) : Set (BoardClockPath n) :=
  {ω | (cutProcess cfg ε M start hn s (δ,ω)).birthUnavailable p}

theorem cutUnavailableEvent_measurableSet {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (s : GoodObservation cfg) (p : Grid n) (δ : ℝ≥0) :
    MeasurableSet (cutUnavailableEvent cfg ε M start hn s p δ) :=
  (ProcessState.birthUnavailable_measurableSet p).preimage
    ((cutProcess_measurable cfg ε M start hn s).comp (measurable_const.prodMk measurable_id))

theorem cutCreditLoss_mean_pointLaw {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (hB : 0<cfg.B) (s : GoodObservation cfg) (p : Grid n) (δ : ℝ≥0) :
    (∫ω,cutCreditLoss cfg ε M start hn s p (δ,ω) ∂boardClockMeasure n (cfg.B/n))=
      (cutPointMeasure cfg ε M start hn s p δ).real (cutUnavailableEvent cfg ε M start hn s p δ) := by
  rw [cutPointMeasure,savedCreditMeasure_real_apply _ _ (cutCredit_integrable cfg ε M start hn hB s p δ)
    (fun ω=>(sourceCutCredit_bounds cfg ε M start δ δ.coe_nonneg hn s p ω).1)
    _ (cutUnavailableEvent_measurableSet cfg ε M start hn s p δ)]
  rw [←integral_indicator (cutUnavailableEvent_measurableSet cfg ε M start hn s p δ)]
  apply integral_congr_ae
  exact ae_of_all _ (fun ω=>by
    simp only [cutCreditLoss,ProcessState.birthCreditLoss,cutUnavailableEvent,Set.indicator,Set.mem_setOf_eq])

theorem cut_birthRate_mean_pointLaw {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : GoodObservation cfg) (p : Grid n)
    (hs : augTimedCredit cfg p s.val.1=1) (δ : ℝ≥0) :
    (∫ω,(cutProcess cfg ε M start hn s (δ,ω)).birthRate cfg.mask p ∂boardClockMeasure n (cfg.B/n))=
      (cfg.mask p/n)*(1-(cutPointMeasure cfg ε M start hn s p δ).real
        (cutUnavailableEvent cfg ε M start hn s p δ)) := by
  simp_rw [ProcessState.birthRate_credit_loss]
  change (∫ω,(cfg.mask p/n)*(((cutProcess cfg ε M start hn s (δ,ω)).accounts p).credit-
    cutCreditLoss cfg ε M start hn s p (δ,ω)) ∂boardClockMeasure n (cfg.B/n))=_
  rw [integral_const_mul,integral_sub (cutCredit_integrable cfg ε M start hn hB s p δ)
    (cutCreditLoss_integrable cfg ε M start hn hB s p δ),
    cutCreditLoss_mean_pointLaw cfg ε M start hn hB s p δ]
  congr 2
  exact sourceCutTerminal_expected_credit_one cfg ε M start δ δ.coe_nonneg hn hB hm s p hs

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.cutPointMeasure_probability
#print axioms NoThreeLine.BirthWitness.cutCreditLoss_mean_pointLaw
#print axioms NoThreeLine.BirthWitness.cut_birthRate_mean_pointLaw
