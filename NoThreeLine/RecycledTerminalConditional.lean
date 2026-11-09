import NoThreeLine.AugmentedRecycledMartingale
import NoThreeLine.BoundedMartingaleTerminal

/-! The actual terminal saved credit closes the original-board martingale.
Every finite state history predicts terminal credit by current saved credit. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter

namespace NoThreeLine

theorem augRecycledTerminal_credit_integrable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (hB : 0 < cfg.B) (s : AugTimedState cfg) (p : Grid n) :
    Integrable (fun ω => augTimedCredit cfg p (augRecycledTerminal cfg ε M hn s ω))
      (boardClockMeasure n (cfg.B/n)) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  exact GenericCreditIteration.bounded_nonnegative_integrable _ _
    ((augTimedCredit_measurable cfg p).comp (augRecycledTerminal_measurable cfg ε M hn s)) cfg.B
    (fun ω => augTimedCredit_bounds cfg p _)

theorem augRecycledTerminal_credit_condExp {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (hB : 0 < cfg.B) (hm : ∀ p, cfg.mask p ≤ 1) (s : AugTimedState cfg) (p : Grid n) (k : ℕ) :
    condExp (augRecycledStateFiltration cfg ε M hn s k) (boardClockMeasure n (cfg.B/n))
      (fun ω => augTimedCredit cfg p (augRecycledTerminal cfg ε M hn s ω)) =ᵐ[boardClockMeasure n (cfg.B/n)]
      (fun ω => augTimedCredit cfg p (augRecycledPair cfg ε M hn s k ω).1) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  apply martingale_terminal_condExp _ (augRecycledStateFiltration cfg ε M hn s)
    (fun j ω => augTimedCredit cfg p (augRecycledPair cfg ε M hn s j ω).1)
    (augRecycled_credit_martingale cfg ε M hn hB hm s p) cfg.B
  · intro j ω
    have hb := augTimedCredit_bounds cfg p (augRecycledPair cfg ε M hn s j ω).1
    simpa only [Real.norm_eq_abs,abs_of_nonneg hb.1] using hb.2
  · exact augRecycledTerminal_credit_integrable cfg ε M hn hB s p
  · filter_upwards [augRecycledTerminalPair_stable_ae cfg ε M hn hB s] with ω hω
    exact hω.mono (fun j hj => congrArg (fun r => augTimedCredit cfg p r.1) hj)

theorem recycledPhaseState_credit_condExp {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (hB : 0 < B)
    (e : ValidAugmentedState n B) (p : Grid n) (k N : ℕ) (hk : k ≤ N) :
    condExp (recycledPhasesFiltration cs ε M deadline start hn e k) (boardClockMeasure n (B/n))
      (fun ω => validAugStateCredit B p (recycledPhaseState cs ε M deadline start hn e N ω)) =ᵐ[boardClockMeasure n (B/n)]
      (fun ω => validAugStateCredit B p (recycledPhaseState cs ε M deadline start hn e k ω)) :=
  (recycledPhases_credit_martingale cs ε M deadline start hn hB e p).condExp_ae_eq hk

end NoThreeLine

#print axioms NoThreeLine.augRecycledTerminal_credit_condExp
#print axioms NoThreeLine.recycledPhaseState_credit_condExp
