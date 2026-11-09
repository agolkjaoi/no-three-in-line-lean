import NoThreeLine.PhaseLineSectionInitial
import NoThreeLine.LineSectionPointLeaf

/-! Tests of the actual cross-phase additional snapshot have the original
full-phase point density. The credit-gap mean supplies this equality;
permanently frozen and current root credits are not identified pathwise. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE EtaMixedGenerator PrimitiveLines

theorem phaseSectionInitial_credit_test {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (A : ℝ) (F : AugmentedState n → ℝ) (hF : Measurable F)
    (D : ℝ) (hFD : ∀ a, a.Valid B → |F a| ≤ D) (hn : 0 < n) (hB : 0 < B)
    (s : GoodPhaseObservation n B) (k : ℕ) :
    let V := phaseSectionRecycledState cs ε M deadline start L p E A hn (goodPhaseSectionInitial p s) k
    (∫ ω, ((V ω).val.1.1.val.physical.process.accounts p).credit * F (V ω).val.2.2 ∂boardClockMeasure n (B/n)) =
      ∫ ω, ((V ω).val.2.2.physical.process.accounts p).credit * F (V ω).val.2.2 ∂boardClockMeasure n (B/n) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  let V := phaseSectionRecycledState cs ε M deadline start L p E A hn (goodPhaseSectionInitial p s) k
  have hv : Measurable V := (phaseSectionRecycledPair_measurable cs ε M deadline start L p E A hn
    (goodPhaseSectionInitial p s) k).fst.snd
  have hc0 : Measurable (fun a : AugmentedState n => (a.physical.process.accounts p).credit) :=
    CreditAccount.measurable_credit.comp ((ProcessState.measurable_account n p).comp
      ((ExtendedState.measurable_process n).comp (AugmentedState.measurable_physical n)))
  have hc := hc0.comp hv.subtype_val.fst.fst.subtype_val
  have hs := hc0.comp hv.subtype_val.snd.snd
  have hf := hF.comp hv.subtype_val.snd.snd
  have hi : Integrable (fun ω => ((V ω).val.1.1.val.physical.process.accounts p).credit * F (V ω).val.2.2)
      (boardClockMeasure n (B/n)) := by
    apply (integrable_const (B*D)).mono' (hc.mul hf).aestronglyMeasurable
    exact ae_of_all _ (fun ω => by
      change ‖((V ω).val.1.1.val.physical.process.accounts p).credit * F (V ω).val.2.2‖ ≤ B*D
      have hh := ((V ω).val.1.1.val.physical.process.accounts p).credit_bounds B ((V ω).val.1.1.property.1.2.1.1 p)
      simpa only [Real.norm_eq_abs,abs_mul,abs_of_nonneg hh.1] using
        mul_le_mul hh.2 (hFD _ (V ω).property.1.saved) (abs_nonneg _) hB.le)
  have hj : Integrable (fun ω => ((V ω).val.2.2.physical.process.accounts p).credit * F (V ω).val.2.2)
      (boardClockMeasure n (B/n)) := by
    apply (integrable_const (B*D)).mono' (hs.mul hf).aestronglyMeasurable
    exact ae_of_all _ (fun ω => by
      change ‖((V ω).val.2.2.physical.process.accounts p).credit * F (V ω).val.2.2‖ ≤ B*D
      have hh := ((V ω).val.2.2.physical.process.accounts p).credit_bounds B ((V ω).property.1.saved.1.2.1.1 p)
      simpa only [Real.norm_eq_abs,abs_mul,abs_of_nonneg hh.1] using
        mul_le_mul hh.2 (hFD _ (V ω).property.1.saved) (abs_nonneg _) hB.le)
  have hh := phaseSection_creditGap_expected cs ε M deadline start L p E A F hF D hFD hn hB
    (goodPhaseSectionInitial p s) k
  rw [goodPhaseSectionInitial_creditGap] at hh
  change (∫ ω, (((V ω).val.1.1.val.physical.process.accounts p).credit -
    ((V ω).val.2.2.physical.process.accounts p).credit) * F (V ω).val.2.2 ∂boardClockMeasure n (B/n)) = 0 at hh
  simp_rw [sub_mul] at hh
  rw [integral_sub hi hj] at hh
  exact sub_eq_zero.mp hh

theorem initial_phaseSection_point_integral {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (A : ℝ) (F : AugmentedState n → ℝ) (hF : Measurable F)
    (D : ℝ) (hFD : ∀ a, a.Valid B → |F a| ≤ D) (hn : 0 < n) (hB : 1 ≤ B) (k : ℕ) :
    let V := phaseSectionRecycledState cs ε M deadline start L p E A hn (initialPhaseSection B hB p deadline start) k
    (∫ ω, F (V ω).val.2.2 ∂phasePointMeasure cs ε M deadline start hn hB p k) =
      ∫ ω, ((V ω).val.2.2.physical.process.accounts p).credit * F (V ω).val.2.2 ∂boardClockMeasure n (B/n) := by
  dsimp only
  rw [phasePointMeasure,savedCreditMeasure_integral _ _ (phasePointCredit_measurable cs ε M deadline start hn hB p k)
    (fun ω => (phasePointCredit_bounds cs ε M deadline start hn hB p k ω).1)]
  have h := phaseSectionInitial_credit_test cs ε M deadline start L p E A F hF D hFD hn
    (zero_lt_one.trans_le hB) (initialGoodPhaseObservation B hB deadline start) k
  have hc (ω : BoardClockPath n) :
      ((phaseSectionRecycledState cs ε M deadline start L p E A hn
        (goodPhaseSectionInitial p (initialGoodPhaseObservation B hB deadline start)) k ω).val.1.1.val.physical.process.accounts p).credit =
        phasePointCredit cs ε M deadline start hn hB p k ω := by
    simpa only [initialPhaseSection] using
      initial_phaseSection_current_credit cs ε M deadline start L p E A hn hB k ω
  dsimp only at h
  simp_rw [hc] at h
  simpa only [initialPhaseSection] using h

theorem initial_phaseSectionPoint_correctedLeaf_mean_le {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) (hB : 1 ≤ B)
    (Γ : Finset ZPoint) (hΓ : ∀ j, (cs j).directions = Γ) (hK : ∀ j, (cs j).K < 2)
    (C labels : Finset (Grid n)) (hp : p ∈ C) (hCL : C ⊆ labels) (k : ℕ) :
    (∫ ω, lineSectionCorrectedLeaf Γ C labels p
      (phaseSectionRecycledState cs ε M deadline start L p E A hn
        (initialPhaseSection B hB p deadline start) k ω).val.2.2
      ∂phasePointMeasure cs ε M deadline start hn hB p k) ≤ 1 := by
  have hF (a : AugmentedState n) (ha : a.Valid B) : |lineSectionCorrectedLeaf Γ C labels p a| ≤ rootLeafCap C p B := by
    have hh := lineSectionCorrectedLeaf_bounds Γ C labels p a B ha
    simpa only [abs_of_nonneg hh.1] using hh.2
  rw [initial_phaseSection_point_integral cs ε M deadline start L p E A _
    (lineSectionCorrectedLeaf_measurable Γ C labels p) _ hF hn hB k]
  simp_rw [←correctedPhi_lineSection_credit Γ C labels p hp]
  exact initial_phaseSection_mixed_le_one cs ε M deadline start L p E A hn hB Γ hΓ hK C labels hCL k

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.initial_phaseSection_point_integral
#print axioms NoThreeLine.BirthWitness.initial_phaseSectionPoint_correctedLeaf_mean_le
