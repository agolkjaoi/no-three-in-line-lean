import NoThreeLine.TimedTerminal
import NoThreeLine.FreshBoardWaits

/-! Actual fixed-phase chronological state recursion terminates almost
surely. Its terminal credit has the initial expectation, with termination
proved from the finite boundary budget and the actual exponential wait law. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter

namespace NoThreeLine

theorem timedNoiseState_completes_ae {n : ℕ} (cfg : FlowConfig n) (hn : 0 < n)
    (hB : 0 < cfg.B) (s : TimedState cfg) :
    ∀ᵐ ω ∂Measure.infinitePi (fun _ : ℕ => boardClockMeasure n (cfg.B/n)),
      ∃ j, TimedDone cfg (timedNoiseState cfg hn s j ω) := by
  filter_upwards [FreshBoardWaits.fresh_first_waits_positive_divergent hn cfg.B hB] with ω hω
  have hfinish := FiniteBudgetTermination.exists_finished
    (fun k => ¬TimedDone cfg (timedNoiseState cfg hn s (k+1) ω))
    (fun k => (timedNoiseState cfg hn s k ω).val.2)
    (FreshBoardWaits.firstWaitSequence hn ω)
    (fun k => (timedNoiseState cfg hn s k ω).val.1.boundaryBudget)
    (fun k => (timedNoiseState cfg hn s k ω).property.2.1)
    (fun k => timedStep_budget_le cfg _ _) hω.2 (fun k hk => ?_)
  · obtain ⟨k,hk⟩ := hfinish
    exact ⟨k+1,not_not.mp hk⟩
  · exact (timedStep_progress cfg (timedNoiseState cfg hn s k ω)
      (WinnerMarkLaw.firstMarkedRace hn (ω k)) (hω.1 k)).resolve_left hk

theorem timedTerminal_done_ae {n : ℕ} (cfg : FlowConfig n) (hn : 0 < n)
    (hB : 0 < cfg.B) (s : TimedState cfg) :
    ∀ᵐ ω ∂Measure.infinitePi (fun _ : ℕ => boardClockMeasure n (cfg.B/n)),
      TimedDone cfg (timedTerminal cfg hn s ω) := by
  filter_upwards [timedNoiseState_completes_ae cfg hn hB s] with ω hω
  exact timedTerminal_done_of_exists cfg hn s ω hω

theorem timedNoiseState_stabilizes_ae {n : ℕ} (cfg : FlowConfig n) (hn : 0 < n)
    (hB : 0 < cfg.B) (s : TimedState cfg) :
    ∀ᵐ ω ∂Measure.infinitePi (fun _ : ℕ => boardClockMeasure n (cfg.B/n)),
      ∀ᶠ k in atTop, timedNoiseState cfg hn s k ω = timedTerminal cfg hn s ω := by
  filter_upwards [timedNoiseState_completes_ae cfg hn hB s] with ω hω
  exact timedTerminal_stable_of_exists cfg hn s ω hω

theorem timedTerminal_expected_credit {n : ℕ} (cfg : FlowConfig n) (hn : 0 < n)
    (hB : 0 < cfg.B) (hm : ∀ p, cfg.mask p ≤ 1) (s : TimedState cfg) (p : Grid n) :
    (∫ ω, timedCredit cfg p (timedTerminal cfg hn s ω)
      ∂Measure.infinitePi (fun _ : ℕ => boardClockMeasure n (cfg.B/n))) = timedCredit cfg p s :=
  timedTerminal_expected_credit_of_completion cfg hn hB hm s p
    (timedNoiseState_completes_ae cfg hn hB s)

end NoThreeLine

#print axioms NoThreeLine.timedNoiseState_completes_ae
#print axioms NoThreeLine.timedTerminal_done_ae
#print axioms NoThreeLine.timedNoiseState_stabilizes_ae
#print axioms NoThreeLine.timedTerminal_expected_credit
