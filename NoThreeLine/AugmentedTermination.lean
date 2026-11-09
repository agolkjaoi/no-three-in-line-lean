import NoThreeLine.AugmentedTerminal
import NoThreeLine.FreshBoardWaits

/-! Actual fixed-phase chronological state recursion terminates almost
surely. Its terminal credit has the initial expectation, with termination
proved from the finite boundary budget and the actual exponential wait law. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter

namespace NoThreeLine

theorem augTimedNoiseState_completes_ae {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (hB : 0 < cfg.B) (s : AugTimedState cfg) :
    ∀ᵐ ω ∂Measure.infinitePi (fun _ : ℕ => boardClockMeasure n (cfg.B/n)),
      ∃ j, AugTimedDone cfg (augTimedNoiseState cfg ε M hn s j ω) := by
  filter_upwards [FreshBoardWaits.fresh_first_waits_positive_divergent hn cfg.B hB] with ω hω
  have hfinish := FiniteBudgetTermination.exists_finished
    (fun k => ¬AugTimedDone cfg (augTimedNoiseState cfg ε M hn s (k+1) ω))
    (fun k => (augTimedNoiseState cfg ε M hn s k ω).val.2)
    (FreshBoardWaits.firstWaitSequence hn ω)
    (fun k => (augTimedNoiseState cfg ε M hn s k ω).val.1.physical.boundaryBudget)
    (fun k => (augTimedNoiseState cfg ε M hn s k ω).property.2.1)
    (fun k => augTimedStep_budget_le cfg ε M _ _) hω.2 (fun k hk => ?_)
  · obtain ⟨k,hk⟩ := hfinish
    exact ⟨k+1,not_not.mp hk⟩
  · exact (augTimedStep_progress cfg ε M (augTimedNoiseState cfg ε M hn s k ω)
      (WinnerMarkLaw.firstMarkedRace hn (ω k)) (hω.1 k)).resolve_left hk

theorem augTimedTerminal_done_ae {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (hB : 0 < cfg.B) (s : AugTimedState cfg) :
    ∀ᵐ ω ∂Measure.infinitePi (fun _ : ℕ => boardClockMeasure n (cfg.B/n)),
      AugTimedDone cfg (augTimedTerminal cfg ε M hn s ω) := by
  filter_upwards [augTimedNoiseState_completes_ae cfg ε M hn hB s] with ω hω
  exact augTimedTerminal_done_of_exists cfg ε M hn s ω hω

theorem augTimedNoiseState_stabilizes_ae {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (hB : 0 < cfg.B) (s : AugTimedState cfg) :
    ∀ᵐ ω ∂Measure.infinitePi (fun _ : ℕ => boardClockMeasure n (cfg.B/n)),
      ∀ᶠ k in atTop, augTimedNoiseState cfg ε M hn s k ω = augTimedTerminal cfg ε M hn s ω := by
  filter_upwards [augTimedNoiseState_completes_ae cfg ε M hn hB s] with ω hω
  exact augTimedTerminal_stable_of_exists cfg ε M hn s ω hω

theorem augTimedTerminal_expected_credit {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (hB : 0 < cfg.B) (hm : ∀ p, cfg.mask p ≤ 1) (s : AugTimedState cfg) (p : Grid n) :
    (∫ ω, augTimedCredit cfg p (augTimedTerminal cfg ε M hn s ω)
      ∂Measure.infinitePi (fun _ : ℕ => boardClockMeasure n (cfg.B/n))) = augTimedCredit cfg p s :=
  augTimedTerminal_expected_credit_of_completion cfg ε M hn hB hm s p
    (augTimedNoiseState_completes_ae cfg ε M hn hB s)

end NoThreeLine

#print axioms NoThreeLine.augTimedNoiseState_completes_ae
#print axioms NoThreeLine.augTimedTerminal_done_ae
#print axioms NoThreeLine.augTimedNoiseState_stabilizes_ae
#print axioms NoThreeLine.augTimedTerminal_expected_credit
