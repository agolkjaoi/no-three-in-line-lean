import NoThreeLine.SavedCreditHistory
import NoThreeLine.PhasePointLaw

/-! Saved-credit density for the actual within-phase terminal state.
The initial credit is retained as its total mass; a unit initial credit,
including canonical initialization, makes this a probability measure. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine

def withinPhasePointMeasure {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0<n)
    (s : AugTimedState cfg) (p : Grid n) : Measure (BoardClockPath n) :=
  savedCreditMeasure (boardClockMeasure n (cfg.B/n))
    (fun ω=>augTimedCredit cfg p (augRecycledTerminal cfg ε M hn s ω))

theorem withinPhasePointMeasure_mass {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0<n)
    (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : AugTimedState cfg) (p : Grid n) :
    (withinPhasePointMeasure cfg ε M hn s p) univ=ENNReal.ofReal (augTimedCredit cfg p s) := by
  rw [withinPhasePointMeasure,savedCreditMeasure,withDensity_apply _ MeasurableSet.univ,Measure.restrict_univ,
    ←ofReal_integral_eq_lintegral_ofReal
      (augRecycledTerminal_credit_integrable cfg ε M hn hB s p)
      (ae_of_all _ (fun ω=>(augTimedCredit_bounds cfg p _).1)),
    augRecycledTerminal_expected_credit cfg ε M hn hB hm s p]

theorem withinPhasePointMeasure_probability {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0<n)
    (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : AugTimedState cfg) (p : Grid n)
    (hs : augTimedCredit cfg p s=1) : IsProbabilityMeasure (withinPhasePointMeasure cfg ε M hn s p) := by
  constructor
  rw [withinPhasePointMeasure_mass cfg ε M hn hB hm s p,hs]
  simp

theorem withinPhasePointMeasure_initial_probability {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0<n)
    (hB : 1≤cfg.B) (hm : ∀q,cfg.mask q≤1) (deadline : Grid n → ℝ) (start : ℝ) (p : Grid n) :
    IsProbabilityMeasure (withinPhasePointMeasure cfg ε M hn
      (augPhaseStart cfg ε M (augInitialState cfg.B hB deadline start)) p) :=
  withinPhasePointMeasure_probability cfg ε M hn (lt_of_lt_of_le zero_lt_one hB) hm _ p
    (augInitialState_credit cfg.B hB deadline start p)

theorem withinPhasePointMeasure_history_event {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0<n)
    (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : AugTimedState cfg) (p : Grid n)
    (k : ℕ) (E : Set (BoardClockPath n)) (hE : MeasurableSet[augRecycledStateFiltration cfg ε M hn s k] E) :
    (withinPhasePointMeasure cfg ε M hn s p).real E=
      ∫ω in E,augTimedCredit cfg p (augRecycledPair cfg ε M hn s k ω).1 ∂boardClockMeasure n (cfg.B/n) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  exact savedCreditMeasure_history_event _ (augRecycledStateFiltration cfg ε M hn s)
    _ _ (augRecycledTerminal_credit_integrable cfg ε M hn hB s p)
    (fun ω=>(augTimedCredit_bounds cfg p _).1) k
    (augRecycledTerminal_credit_condExp cfg ε M hn hB hm s p k) E hE

theorem withinPhasePointMeasure_history_integral {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0<n)
    (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : AugTimedState cfg) (p : Grid n) (k : ℕ)
    (f : BoardClockPath n → ℝ)
    (hf : @Measurable (BoardClockPath n) ℝ (augRecycledStateFiltration cfg ε M hn s k) inferInstance f)
    (C : ℝ) (hb : ∀ω,0≤f ω ∧ f ω≤C) :
    (∫ω,f ω ∂withinPhasePointMeasure cfg ε M hn s p)=
      ∫ω,augTimedCredit cfg p (augRecycledPair cfg ε M hn s k ω).1*f ω ∂boardClockMeasure n (cfg.B/n) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  have hZm : Measurable (fun ω=>augTimedCredit cfg p (augRecycledTerminal cfg ε M hn s ω)) :=
    (augTimedCredit_measurable cfg p).comp (augRecycledTerminal_measurable cfg ε M hn s)
  have hfm : Measurable f := hf.mono ((augRecycledStateFiltration cfg ε M hn s).le k) le_rfl
  have hi : Integrable ((fun ω=>augTimedCredit cfg p (augRecycledTerminal cfg ε M hn s ω))*f)
      (boardClockMeasure n (cfg.B/n)) := by
    apply GenericCreditIteration.bounded_nonnegative_integrable _ _ (hZm.mul hfm) (cfg.B*C)
    intro ω
    have hz := augTimedCredit_bounds cfg p (augRecycledTerminal cfg ε M hn s ω)
    exact ⟨mul_nonneg hz.1 (hb ω).1,mul_le_mul hz.2 (hb ω).2 (hb ω).1 hB.le⟩
  exact savedCreditMeasure_history_integral _ (augRecycledStateFiltration cfg ε M hn s)
    _ _ hZm (augRecycledTerminal_credit_integrable cfg ε M hn hB s p)
    (fun ω=>(augTimedCredit_bounds cfg p _).1) k
    (augRecycledTerminal_credit_condExp cfg ε M hn hB hm s p k) f hf hi

theorem withinPhasePointMeasure_absolutelyContinuous {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0<n)
    (s : AugTimedState cfg) (p : Grid n) :
    withinPhasePointMeasure cfg ε M hn s p ≪ boardClockMeasure n (cfg.B/n) :=
  savedCreditMeasure_absolutelyContinuous _ _

end NoThreeLine

#print axioms NoThreeLine.withinPhasePointMeasure_initial_probability
#print axioms NoThreeLine.withinPhasePointMeasure_history_event
#print axioms NoThreeLine.withinPhasePointMeasure_history_integral
