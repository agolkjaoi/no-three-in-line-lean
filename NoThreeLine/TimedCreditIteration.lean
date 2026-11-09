import NoThreeLine.TimedState
import NoThreeLine.GenericCreditIteration

/-! Iterate the actual capped flow/candidate/boundary update using independent
copies of the original board clock law. Credit is preserved at every finite
iterate. Almost-sure completion and identification with a single global clock
path are separate obligations. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine

def timedNoiseState {n : ℕ} (cfg : FlowConfig n) (hn : 0 < n)
    (s : TimedState cfg) (k : ℕ) (ω : ℕ → BoardClockPath n) : TimedState cfg :=
  GenericCreditIteration.noiseState (timedClockStep cfg hn) s k ω

theorem timedNoiseState_zero {n : ℕ} (cfg : FlowConfig n) (hn : 0 < n)
    (s : TimedState cfg) (ω : ℕ → BoardClockPath n) : timedNoiseState cfg hn s 0 ω = s := rfl

theorem timedNoiseState_succ {n : ℕ} (cfg : FlowConfig n) (hn : 0 < n)
    (s : TimedState cfg) (k : ℕ) (ω : ℕ → BoardClockPath n) :
    timedNoiseState cfg hn s (k+1) ω =
      timedClockStep cfg hn (timedNoiseState cfg hn s k ω,ω k) := rfl

theorem timedNoiseState_measurable {n : ℕ} (cfg : FlowConfig n) (hn : 0 < n)
    (s : TimedState cfg) (k : ℕ) : Measurable (timedNoiseState cfg hn s k) :=
  GenericCreditIteration.noiseState_measurable _ (timedClockStep_measurable cfg hn) s k

theorem timedNoiseState_remaining_antitone {n : ℕ} (cfg : FlowConfig n) (hn : 0 < n)
    (s : TimedState cfg) (ω : ℕ → BoardClockPath n) :
    Antitone (fun k => (timedNoiseState cfg hn s k ω).val.2) := by
  apply antitone_nat_of_succ_le
  intro k
  exact timedStep_remaining_le cfg _ _

theorem timedNoiseState_expected_credit {n : ℕ} (cfg : FlowConfig n) (hn : 0 < n)
    (hB : 0 < cfg.B) (hm : ∀ p, cfg.mask p ≤ 1) (s : TimedState cfg) (p : Grid n) (k : ℕ) :
    (∫ ω, timedCredit cfg p (timedNoiseState cfg hn s k ω)
      ∂Measure.infinitePi (fun _ : ℕ => boardClockMeasure n (cfg.B/n))) = timedCredit cfg p s := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  exact GenericCreditIteration.infinitePi_expected_credit _ (timedClockStep_measurable cfg hn)
    _ _ (timedCredit_measurable cfg p) cfg.B (timedCredit_bounds cfg p)
    (fun x => timedClockStep_credit cfg hn hB hm x p) k s

theorem timedNoiseState_credit_integrable {n : ℕ} (cfg : FlowConfig n) (hn : 0 < n)
    (hB : 0 < cfg.B) (s : TimedState cfg) (p : Grid n) (k : ℕ) :
    Integrable (fun ω => timedCredit cfg p (timedNoiseState cfg hn s k ω))
      (Measure.infinitePi (fun _ : ℕ => boardClockMeasure n (cfg.B/n))) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  exact GenericCreditIteration.bounded_nonnegative_integrable _ _
    ((timedCredit_measurable cfg p).comp (timedNoiseState_measurable cfg hn s k)) cfg.B
    (fun _ => timedCredit_bounds cfg p _)

end NoThreeLine

#print axioms NoThreeLine.timedNoiseState_measurable
#print axioms NoThreeLine.timedNoiseState_remaining_antitone
#print axioms NoThreeLine.timedNoiseState_expected_credit
#print axioms NoThreeLine.timedNoiseState_credit_integrable
