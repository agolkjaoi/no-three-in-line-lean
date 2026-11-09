import NoThreeLine.CutPointLaw

/-! The actual cut-law loss probability varies measurably with the cut.
It lies in [0,1] for unit initial credit. No decay estimate is assumed. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped NNReal

namespace NoThreeLine.BirthWitness

def cutLossProbability {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (s : GoodObservation cfg) (p : Grid n) (δ : ℝ≥0) : ℝ :=
  (cutPointMeasure cfg ε M start hn s p δ).real (cutUnavailableEvent cfg ε M start hn s p δ)

theorem cutLossProbability_eq_mean {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (hB : 0<cfg.B) (s : GoodObservation cfg) (p : Grid n) (δ : ℝ≥0) :
    cutLossProbability cfg ε M start hn s p δ=
      ∫ω,cutCreditLoss cfg ε M start hn s p (δ,ω) ∂boardClockMeasure n (cfg.B/n) :=
  (cutCreditLoss_mean_pointLaw cfg ε M start hn hB s p δ).symm

theorem cutLossProbability_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (hB : 0<cfg.B) (s : GoodObservation cfg) (p : Grid n) :
    Measurable (cutLossProbability cfg ε M start hn s p) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  have he : cutLossProbability cfg ε M start hn s p=(fun δ=>
      ∫ω,cutCreditLoss cfg ε M start hn s p (δ,ω) ∂boardClockMeasure n (cfg.B/n)) :=
    funext (cutLossProbability_eq_mean cfg ε M start hn hB s p)
  rw [he]
  exact (cutCreditLoss_measurable cfg ε M start hn s p).stronglyMeasurable.integral_prod_right'.measurable

theorem cutLossProbability_bounds {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : GoodObservation cfg) (p : Grid n)
    (hs : augTimedCredit cfg p s.val.1=1) (δ : ℝ≥0) :
    0≤cutLossProbability cfg ε M start hn s p δ ∧ cutLossProbability cfg ε M start hn s p δ≤1 := by
  rw [cutLossProbability_eq_mean cfg ε M start hn hB s p δ]
  constructor
  · exact integral_nonneg (fun ω=>(cutCreditLoss_bounds cfg ε M start hn s p (δ,ω)).1)
  · have h := integral_mono (cutCreditLoss_integrable cfg ε M start hn hB s p δ)
      (cutCredit_integrable cfg ε M start hn hB s p δ)
      (fun ω=>(cutProcess cfg ε M start hn s (δ,ω)).birthCreditLoss_bounds p
        (sourceCutCredit_bounds cfg ε M start δ δ.coe_nonneg hn s p ω).1 |>.2)
    have he : (∫ω,((cutProcess cfg ε M start hn s (δ,ω)).accounts p).credit
        ∂boardClockMeasure n (cfg.B/n))=1 :=
      sourceCutTerminal_expected_credit_one cfg ε M start δ δ.coe_nonneg hn hB hm s p hs
    exact h.trans_eq he

theorem cut_expected_rate_loss_decomposition {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : GoodObservation cfg) (p : Grid n)
    (hs : augTimedCredit cfg p s.val.1=1) (δ : ℝ≥0) :
    (∫ω,(cutProcess cfg ε M start hn s (δ,ω)).birthRate cfg.mask p ∂boardClockMeasure n (cfg.B/n))=
      cfg.mask p/n-(cfg.mask p/n)*cutLossProbability cfg ε M start hn s p δ := by
  rw [cut_birthRate_mean_pointLaw cfg ε M start hn hB hm s p hs δ]
  change (cfg.mask p/n)*(1-cutLossProbability cfg ε M start hn s p δ)=_
  ring

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.cutLossProbability_measurable
#print axioms NoThreeLine.BirthWitness.cutLossProbability_bounds
#print axioms NoThreeLine.BirthWitness.cut_expected_rate_loss_decomposition
