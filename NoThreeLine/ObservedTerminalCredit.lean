import NoThreeLine.ObservedTerminalLaw
import NoThreeLine.BoundedMartingaleTerminal
import NoThreeLine.SavedCreditHistory

/-! Terminal saved credit closes the original-board filtration which includes
the actual birth records. This is stronger than projecting to physical state
history, and is the discrete-history part of the future cut-density tower. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter
namespace NoThreeLine.BirthWitness

theorem observedRecycledTerminal_credit_integrable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (hn : 0<n) (hB : 0<cfg.B) (s : TimedObservation cfg) (p : Grid n) :
    Integrable (fun ω=>augTimedCredit cfg p (observedRecycledTerminal cfg ε M start hn (s,ω)).1)
      (boardClockMeasure n (cfg.B/n)) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  exact GenericCreditIteration.bounded_nonnegative_integrable _ _
    ((augTimedCredit_measurable cfg p).comp
      (((observedRecycledTerminal_measurable cfg ε M start hn).comp
        (measurable_const.prodMk measurable_id)).fst)) cfg.B (fun ω=>augTimedCredit_bounds cfg p _)

theorem observedRecycledTerminal_credit_condExp {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : TimedObservation cfg)
    (p : Grid n) (k : ℕ) :
    condExp (observedRecycledFiltration cfg ε M start hn s k) (boardClockMeasure n (cfg.B/n))
      (fun ω=>augTimedCredit cfg p (observedRecycledTerminal cfg ε M start hn (s,ω)).1)
      =ᵐ[boardClockMeasure n (cfg.B/n)]
      (fun ω=>augTimedCredit cfg p (observedRecycledPair cfg ε M start hn s k ω).1.1) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  apply martingale_terminal_condExp _ (observedRecycledFiltration cfg ε M start hn s)
    (fun j ω=>augTimedCredit cfg p (observedRecycledPair cfg ε M start hn s j ω).1.1)
    (observedRecycled_credit_martingale cfg ε M start hn hB hm s p) cfg.B
  · intro j ω
    have hb := augTimedCredit_bounds cfg p (observedRecycledPair cfg ε M start hn s j ω).1.1
    simpa only [Real.norm_eq_abs,abs_of_nonneg hb.1] using hb.2
  · exact observedRecycledTerminal_credit_integrable cfg ε M start hn hB s p
  · filter_upwards [observedRecycledTerminalPair_stable_ae cfg ε M start hn hB s] with ω hω
    exact hω.mono (fun j hj=>congrArg (fun r=>augTimedCredit cfg p r.1.1) hj)

theorem observedTerminal_point_history_integral {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : TimedObservation cfg)
    (p : Grid n) (k : ℕ) (f : BoardClockPath n→ℝ)
    (hf : @Measurable (BoardClockPath n) ℝ
      (observedRecycledFiltration cfg ε M start hn s k) inferInstance f)
    (C : ℝ) (hb : ∀ω,0≤f ω ∧ f ω≤C) :
    (∫ω,f ω ∂savedCreditMeasure (boardClockMeasure n (cfg.B/n))
      (fun ω=>augTimedCredit cfg p (observedRecycledTerminal cfg ε M start hn (s,ω)).1))=
      ∫ω,augTimedCredit cfg p (observedRecycledPair cfg ε M start hn s k ω).1.1*f ω
        ∂boardClockMeasure n (cfg.B/n) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  have hZ : Measurable (fun ω=>augTimedCredit cfg p (observedRecycledTerminal cfg ε M start hn (s,ω)).1) :=
    (augTimedCredit_measurable cfg p).comp (((observedRecycledTerminal_measurable cfg ε M start hn).comp
      (measurable_const.prodMk measurable_id)).fst)
  have hfm : Measurable f := hf.mono ((observedRecycledFiltration cfg ε M start hn s).le k) le_rfl
  apply savedCreditMeasure_history_integral _ (observedRecycledFiltration cfg ε M start hn s)
    _ _ hZ (observedRecycledTerminal_credit_integrable cfg ε M start hn hB s p)
    (fun ω=>(augTimedCredit_bounds cfg p _).1) k
    (observedRecycledTerminal_credit_condExp cfg ε M start hn hB hm s p k) f hf
  exact GenericCreditIteration.bounded_nonnegative_integrable _ _ (hZ.mul hfm) (cfg.B*C)
    (fun ω=>⟨mul_nonneg (augTimedCredit_bounds cfg p _).1 (hb ω).1,
      mul_le_mul (augTimedCredit_bounds cfg p _).2 (hb ω).2 (hb ω).1 hB.le⟩)

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.observedRecycledTerminal_credit_condExp
#print axioms NoThreeLine.BirthWitness.observedTerminal_point_history_integral
