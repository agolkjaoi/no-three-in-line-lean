import NoThreeLine.LineSectionCreditTransport
import NoThreeLine.WithinPhasePointLaw

/-! Tests of the random additional contact snapshot under the original
terminal point density. The equality follows from the actual credit-gap
mean theorem; no equality of saved/current credit is imposed pathwise. -/
set_option autoImplicit false
set_option maxHeartbeats 1400000
noncomputable section
open MeasureTheory Set ProbabilityTheory

namespace NoThreeLine.BirthWitness
open AuxiliaryODE EtaMixedGenerator

theorem lineSectionTerminal_initial_credit_test {n : ℕ} (cfg : FlowConfig n)
    (ε M start : ℝ) (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (F : AugmentedState n → ℝ) (hF : Measurable F) (D : ℝ)
    (hFD : ∀ a, a.Valid cfg.B → |F a| ≤ D)
    (hn : 0 < n) (hB : 0 < cfg.B) (hm : ∀ q, cfg.mask q ≤ 1)
    (s : GoodObservation cfg) :
    (∫ ω, augTimedCredit cfg p
      (lineSectionTerminal cfg ε M start L p E A hn (goodLineSectionInitial cfg p s) ω).val.1.1 *
      F (lineSectionTerminal cfg ε M start L p E A hn (goodLineSectionInitial cfg p s) ω).val.2.2
      ∂boardClockMeasure n (cfg.B/n)) =
    ∫ ω, ((lineSectionTerminal cfg ε M start L p E A hn
      (goodLineSectionInitial cfg p s) ω).val.2.2.physical.process.accounts p).credit *
      F (lineSectionTerminal cfg ε M start L p E A hn (goodLineSectionInitial cfg p s) ω).val.2.2
      ∂boardClockMeasure n (cfg.B/n) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  let V := lineSectionTerminal cfg ε M start L p E A hn (goodLineSectionInitial cfg p s)
  have hv := (lineSectionTerminal_measurable cfg ε M start L p E A hn (goodLineSectionInitial cfg p s))
  have hc : Measurable (fun ω => augTimedCredit cfg p (V ω).val.1.1) :=
    (augTimedCredit_measurable cfg p).comp (measurable_subtype_coe.comp hv).fst.fst
  have hs : Measurable (fun ω => ((V ω).val.2.2.physical.process.accounts p).credit) :=
    CreditAccount.measurable_credit.comp ((ProcessState.measurable_account n p).comp
      ((ExtendedState.measurable_process n).comp ((AugmentedState.measurable_physical n).comp
        (measurable_subtype_coe.comp hv).snd.snd)))
  have hf := hF.comp (measurable_subtype_coe.comp hv).snd.snd
  have hi : Integrable (fun ω => augTimedCredit cfg p (V ω).val.1.1 * F (V ω).val.2.2)
      (boardClockMeasure n (cfg.B/n)) := by
    apply (integrable_const (cfg.B*D)).mono' (hc.mul hf).aestronglyMeasurable
    exact ae_of_all _ (fun ω => by
      change ‖augTimedCredit cfg p (V ω).val.1.1 * F (V ω).val.2.2‖ ≤ cfg.B*D
      have hh := augTimedCredit_bounds cfg p (V ω).val.1.1
      simpa only [Real.norm_eq_abs,abs_mul,abs_of_nonneg hh.1] using
        mul_le_mul hh.2 (hFD _ (V ω).property.1.saved) (abs_nonneg _) hB.le)
  have hj : Integrable (fun ω => ((V ω).val.2.2.physical.process.accounts p).credit * F (V ω).val.2.2)
      (boardClockMeasure n (cfg.B/n)) := by
    apply (integrable_const (cfg.B*D)).mono' (hs.mul hf).aestronglyMeasurable
    exact ae_of_all _ (fun ω => by
      change ‖((V ω).val.2.2.physical.process.accounts p).credit * F (V ω).val.2.2‖ ≤ cfg.B*D
      have hh := ((V ω).val.2.2.physical.process.accounts p).credit_bounds cfg.B
        ((V ω).property.1.saved.1.2.1.1 p)
      simpa only [Real.norm_eq_abs,abs_mul,abs_of_nonneg hh.1] using
        mul_le_mul hh.2 (hFD _ (V ω).property.1.saved) (abs_nonneg _) hB.le)
  have hh := lineSectionTerminal_creditGap_mean cfg ε M start L p E A F hF D hFD hn hB hm
    (goodLineSectionInitial cfg p s)
  have hzero : lineSectionCreditGap cfg p F (goodLineSectionInitial cfg p s).val = 0 := by
    simp [lineSectionCreditGap,goodLineSectionInitial,lineSectionInitial,augTimedCredit]
  rw [hzero] at hh
  change (∫ ω, (augTimedCredit cfg p (V ω).val.1.1 -
    ((V ω).val.2.2.physical.process.accounts p).credit) * F (V ω).val.2.2
    ∂boardClockMeasure n (cfg.B/n)) = 0 at hh
  simp_rw [sub_mul] at hh
  rw [integral_sub hi hj] at hh
  exact sub_eq_zero.mp hh

theorem lineSectionTerminal_point_integral {n : ℕ} (cfg : FlowConfig n)
    (ε M start : ℝ) (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (F : AugmentedState n → ℝ) (hF : Measurable F) (D : ℝ)
    (hFD : ∀ a, a.Valid cfg.B → |F a| ≤ D)
    (hn : 0 < n) (hB : 0 < cfg.B) (hm : ∀ q, cfg.mask q ≤ 1)
    (s : GoodObservation cfg) :
    (∫ ω, F (lineSectionTerminal cfg ε M start L p E A hn (goodLineSectionInitial cfg p s) ω).val.2.2
      ∂withinPhasePointMeasure cfg ε M hn s.val.1 p) =
    ∫ ω, ((lineSectionTerminal cfg ε M start L p E A hn
      (goodLineSectionInitial cfg p s) ω).val.2.2.physical.process.accounts p).credit *
      F (lineSectionTerminal cfg ε M start L p E A hn (goodLineSectionInitial cfg p s) ω).val.2.2
      ∂boardClockMeasure n (cfg.B/n) := by
  have hZ : Measurable (fun ω => augTimedCredit cfg p (augRecycledTerminal cfg ε M hn s.val.1 ω)) :=
    (augTimedCredit_measurable cfg p).comp (augRecycledTerminal_measurable cfg ε M hn s.val.1)
  rw [withinPhasePointMeasure,savedCreditMeasure_integral _ _ hZ
    (fun ω => (augTimedCredit_bounds cfg p _).1)]
  have h := lineSectionTerminal_initial_credit_test cfg ε M start L p E A F hF D hFD hn hB hm s
  convert h using 1
  apply integral_congr_ae
  exact Filter.Eventually.of_forall (fun ω => by
    dsimp only
    rw [lineSectionTerminal_projection,observedRecycledTerminal_base]
    rfl)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.lineSectionTerminal_initial_credit_test
#print axioms NoThreeLine.BirthWitness.lineSectionTerminal_point_integral
