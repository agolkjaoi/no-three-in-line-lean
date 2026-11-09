import NoThreeLine.TimedCreditIteration
import NoThreeLine.GenericCreditMartingale

/-! The actual capped-state credit is a martingale for the natural history
of the independent board-clock noises, in mathlib's conditional-expectation sense. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory

namespace NoThreeLine

theorem timedNoiseState_credit_martingale {n : ℕ} (cfg : FlowConfig n) (hn : 0 < n)
    (hB : 0 < cfg.B) (hm : ∀ p, cfg.mask p ≤ 1) (s : TimedState cfg) (p : Grid n) :
    Martingale (fun k ω => timedCredit cfg p (timedNoiseState cfg hn s k ω))
      (GenericCreditMartingale.noiseFiltration (BoardClockPath n))
      (Measure.infinitePi (fun _ : ℕ => boardClockMeasure n (cfg.B/n))) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  exact GenericCreditMartingale.noise_credit_martingale _ (timedClockStep_measurable cfg hn)
    _ _ (timedCredit_measurable cfg p) cfg.B (timedCredit_bounds cfg p)
    (fun x => timedClockStep_credit cfg hn hB hm x p) s

end NoThreeLine

#print axioms NoThreeLine.timedNoiseState_credit_martingale
