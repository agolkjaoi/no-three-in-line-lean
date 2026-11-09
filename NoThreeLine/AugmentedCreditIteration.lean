import NoThreeLine.AugmentedTimedState
import NoThreeLine.GenericCreditIteration

/-! Iterate the actual capped flow/candidate/boundary update using independent
copies of the original board clock law. Credit is preserved at every finite
iterate. Almost-sure completion and identification with a single global clock
path are separate obligations. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine

def augTimedNoiseState {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (s : AugTimedState cfg) (k : ℕ) (ω : ℕ → BoardClockPath n) : AugTimedState cfg :=
  GenericCreditIteration.noiseState (augTimedClockStep cfg ε M hn) s k ω

theorem augTimedNoiseState_zero {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (s : AugTimedState cfg) (ω : ℕ → BoardClockPath n) : augTimedNoiseState cfg ε M hn s 0 ω = s := rfl

theorem augTimedNoiseState_succ {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (s : AugTimedState cfg) (k : ℕ) (ω : ℕ → BoardClockPath n) :
    augTimedNoiseState cfg ε M hn s (k+1) ω =
      augTimedClockStep cfg ε M hn (augTimedNoiseState cfg ε M hn s k ω,ω k) := rfl

theorem augTimedNoiseState_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (s : AugTimedState cfg) (k : ℕ) : Measurable (augTimedNoiseState cfg ε M hn s k) :=
  GenericCreditIteration.noiseState_measurable _ (augTimedClockStep_measurable cfg ε M hn) s k

theorem augTimedNoiseState_remaining_antitone {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (s : AugTimedState cfg) (ω : ℕ → BoardClockPath n) :
    Antitone (fun k => (augTimedNoiseState cfg ε M hn s k ω).val.2) := by
  apply antitone_nat_of_succ_le
  intro k
  exact augTimedStep_remaining_le cfg ε M _ _

theorem augTimedNoiseState_expected_credit {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (hB : 0 < cfg.B) (hm : ∀ p, cfg.mask p ≤ 1) (s : AugTimedState cfg) (p : Grid n) (k : ℕ) :
    (∫ ω, augTimedCredit cfg p (augTimedNoiseState cfg ε M hn s k ω)
      ∂Measure.infinitePi (fun _ : ℕ => boardClockMeasure n (cfg.B/n))) = augTimedCredit cfg p s := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  exact GenericCreditIteration.infinitePi_expected_credit _ (augTimedClockStep_measurable cfg ε M hn)
    _ _ (augTimedCredit_measurable cfg p) cfg.B (augTimedCredit_bounds cfg p)
    (fun x => augTimedClockStep_credit cfg ε M hn hB hm x p) k s

theorem augTimedNoiseState_credit_integrable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (hB : 0 < cfg.B) (s : AugTimedState cfg) (p : Grid n) (k : ℕ) :
    Integrable (fun ω => augTimedCredit cfg p (augTimedNoiseState cfg ε M hn s k ω))
      (Measure.infinitePi (fun _ : ℕ => boardClockMeasure n (cfg.B/n))) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  exact GenericCreditIteration.bounded_nonnegative_integrable _ _
    ((augTimedCredit_measurable cfg p).comp (augTimedNoiseState_measurable cfg ε M hn s k)) cfg.B
    (fun _ => augTimedCredit_bounds cfg p _)

end NoThreeLine

#print axioms NoThreeLine.augTimedNoiseState_measurable
#print axioms NoThreeLine.augTimedNoiseState_remaining_antitone
#print axioms NoThreeLine.augTimedNoiseState_expected_credit
#print axioms NoThreeLine.augTimedNoiseState_credit_integrable
