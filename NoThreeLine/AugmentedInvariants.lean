import NoThreeLine.AugmentedTermination
import NoThreeLine.GenericCreditMartingale

/-! Actual iterated eta retains the floor, including its selected terminal
state. Actual credit is a martingale for the fresh board-noise filtration. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory

namespace NoThreeLine

theorem augTimedNoiseState_eta_lower {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (s : AugTimedState cfg) (a b : Grid n) (hab : a ≠ b) (hinit : 1-ε ≤ s.val.1.eta a b)
    (k : ℕ) (ω : ℕ → BoardClockPath n) :
    1-ε ≤ (augTimedNoiseState cfg ε M hn s k ω).val.1.eta a b := by
  induction k with
  | zero => exact hinit
  | succ k ih => exact augTimedStep_eta_lower cfg ε M _ _ a b hab ih

theorem augTimedTerminal_eta_lower {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (s : AugTimedState cfg) (a b : Grid n) (hab : a ≠ b) (hinit : 1-ε ≤ s.val.1.eta a b)
    (ω : ℕ → BoardClockPath n) : 1-ε ≤ (augTimedTerminal cfg ε M hn s ω).val.1.eta a b :=
  augTimedNoiseState_eta_lower cfg ε M hn s a b hab hinit _ ω

theorem augTimedNoiseState_credit_martingale {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (hB : 0 < cfg.B) (hm : ∀ p, cfg.mask p ≤ 1) (s : AugTimedState cfg) (p : Grid n) :
    Martingale (fun k ω => augTimedCredit cfg p (augTimedNoiseState cfg ε M hn s k ω))
      (GenericCreditMartingale.noiseFiltration (BoardClockPath n))
      (Measure.infinitePi (fun _ : ℕ => boardClockMeasure n (cfg.B/n))) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  exact GenericCreditMartingale.noise_credit_martingale _ (augTimedClockStep_measurable cfg ε M hn)
    _ _ (augTimedCredit_measurable cfg p) cfg.B (augTimedCredit_bounds cfg p)
    (fun x => augTimedClockStep_credit cfg ε M hn hB hm x p) s

end NoThreeLine

#print axioms NoThreeLine.augTimedTerminal_eta_lower
#print axioms NoThreeLine.augTimedNoiseState_credit_martingale
