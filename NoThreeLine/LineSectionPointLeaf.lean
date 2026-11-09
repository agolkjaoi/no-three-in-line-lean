import NoThreeLine.LineSectionPointTower
import NoThreeLine.LineSectionEta
import NoThreeLine.RootLeafCredit
import NoThreeLine.InitialPointWitness

/-! Actual D-empty physical leaf products at the random extra section
contact, under the original terminal point law. The active gates and eta
factor are retained; the source-free theorem supplies the mean bound. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines EtaPairProduct EtaMixedGenerator

def lineSectionCorrectedLeaf {n : ℕ} (Γ : Finset ZPoint) (C labels : Finset (Grid n))
    (p : Grid n) (a : AugmentedState n) : ℝ :=
  etaProduct labels a.eta * rootLeafPhi Γ C p a.physical

theorem lineSectionCorrectedLeaf_measurable {n : ℕ} (Γ : Finset ZPoint) (C labels : Finset (Grid n))
    (p : Grid n) : Measurable (lineSectionCorrectedLeaf Γ C labels p) :=
  ((etaProduct_measurable labels).comp (AugmentedState.measurable_eta n)).mul
    ((rootLeafPhi_measurable Γ C p).comp (AugmentedState.measurable_physical n))

theorem lineSectionCorrectedLeaf_bounds {n : ℕ} (Γ : Finset ZPoint) (C labels : Finset (Grid n))
    (p : Grid n) (a : AugmentedState n) (B : ℝ) (ha : a.Valid B) :
    0 ≤ lineSectionCorrectedLeaf Γ C labels p a ∧
      lineSectionCorrectedLeaf Γ C labels p a ≤ rootLeafCap C p B := by
  have hv : (WitnessState.mk a (fun _ => 0)).Valid B :=
    ⟨ha,fun _ => ⟨le_rfl,zero_le_one⟩,fun _ _ => rfl⟩
  simpa [lineSectionCorrectedLeaf,correctedRootLeafWitness,rootLeafWitness,witnessProduct] using
    correctedRootLeafWitness_bounds Γ C ∅ labels p _ B hv

theorem correctedPhi_lineSection_credit {n : ℕ} (Γ : Finset ZPoint) (C labels : Finset (Grid n))
    (p : Grid n) (hp : p ∈ C) (a : AugmentedState n) :
    correctedPhi Γ C labels a =
      (a.physical.process.accounts p).credit * lineSectionCorrectedLeaf Γ C labels p a := by
  simpa [mixed_empty,lineSectionCorrectedLeaf,correctedRootLeafWitness,rootLeafWitness,witnessProduct] using
    mixed_rootLeaf_credit Γ C ∅ labels p hp (WitnessState.mk a (fun _ => 0))

theorem lineSectionPoint_correctedLeaf_mean_le {n : ℕ} (cfg : FlowConfig n)
    (ε M start : ℝ) (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (C labels : Finset (Grid n)) (hp : p ∈ C) (hCL : C ⊆ labels)
    (hn : 0 < n) (hB : 0 < cfg.B) (hm : ∀ q, cfg.mask q ≤ 1) (hK : cfg.K < 2)
    (s : GoodObservation cfg) :
    (∫ ω, lineSectionCorrectedLeaf cfg.directions C labels p
      (lineSectionTerminal cfg ε M start L p E A hn (goodLineSectionInitial cfg p s) ω).val.2.2
      ∂withinPhasePointMeasure cfg ε M hn s.val.1 p) ≤
      correctedPhi cfg.directions C labels s.val.1.val.1 := by
  have hf (a : AugmentedState n) (ha : a.Valid cfg.B) :
      |lineSectionCorrectedLeaf cfg.directions C labels p a| ≤ rootLeafCap C p cfg.B := by
    have hb := lineSectionCorrectedLeaf_bounds cfg.directions C labels p a cfg.B ha
    simpa only [abs_of_nonneg hb.1] using hb.2
  rw [lineSectionTerminal_point_integral cfg ε M start L p E A _
    (lineSectionCorrectedLeaf_measurable cfg.directions C labels p) _ hf hn hB hm s]
  simp_rw [←correctedPhi_lineSection_credit cfg.directions C labels p hp]
  exact lineSectionTerminal_expected_le cfg ε M start L p E A C labels hn hB hm hK hCL
    (goodLineSectionInitial cfg p s)

theorem lineSectionPoint_leaf_mean_le {n : ℕ} (cfg : FlowConfig n)
    (ε M start : ℝ) (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (C labels : Finset (Grid n)) (hp : p ∈ C) (hCL : C ⊆ labels)
    (hn : 0 < n) (hB : 0 < cfg.B) (hm : ∀ q, cfg.mask q ≤ 1) (hK : cfg.K < 2)
    (s : GoodObservation cfg) (hε : ε < 1)
    (hη : ∀ a ∈ labels, ∀ b ∈ labels, a ≠ b → 1-ε ≤ s.val.1.val.1.eta a b) :
    (∫ ω, rootLeafPhi cfg.directions C p
      (lineSectionTerminal cfg ε M start L p E A hn (goodLineSectionInitial cfg p s) ω).val.2.2.physical
      ∂withinPhasePointMeasure cfg ε M hn s.val.1 p) ≤
      correctedPhi cfg.directions C labels s.val.1.val.1 / (1-ε)^labels.card.choose 2 := by
  let ν := withinPhasePointMeasure cfg ε M hn s.val.1 p
  letI : IsFiniteMeasure ν := ⟨by
    rw [withinPhasePointMeasure_mass cfg ε M hn hB hm s.val.1 p]
    exact ENNReal.ofReal_lt_top⟩
  let V := lineSectionTerminal cfg ε M start L p E A hn (goodLineSectionInitial cfg p s)
  have hv := lineSectionTerminal_measurable cfg ε M start L p E A hn (goodLineSectionInitial cfg p s)
  have hi : Integrable (fun ω => rootLeafPhi cfg.directions C p (V ω).val.2.2.physical) ν :=
    GenericCreditIteration.bounded_nonnegative_integrable ν _
      ((rootLeafPhi_measurable cfg.directions C p).comp ((AugmentedState.measurable_physical n).comp
        (measurable_subtype_coe.comp hv).snd.snd)) (rootLeafCap C p cfg.B)
      (fun ω => rootLeafPhi_bounds cfg.directions C p _ cfg.B (V ω).property.1.saved.1)
  have hj : Integrable (fun ω => lineSectionCorrectedLeaf cfg.directions C labels p (V ω).val.2.2) ν :=
    GenericCreditIteration.bounded_nonnegative_integrable ν _
      ((lineSectionCorrectedLeaf_measurable cfg.directions C labels p).comp
        (measurable_subtype_coe.comp hv).snd.snd) (rootLeafCap C p cfg.B)
      (fun ω => lineSectionCorrectedLeaf_bounds cfg.directions C labels p _ cfg.B (V ω).property.1.saved)
  have hh := integral_mono (hi.const_mul ((1-ε)^labels.card.choose 2)) hj (fun ω =>
    mul_le_mul_of_nonneg_right
      (lineSectionTerminal_etaProduct_floor cfg ε M start L p E A hn
        (goodLineSectionInitial cfg p s) labels hε.le hη hη ω)
      (rootLeafPhi_bounds cfg.directions C p _ cfg.B (V ω).property.1.saved.1).1)
  rw [integral_const_mul] at hh
  have hc := lineSectionPoint_correctedLeaf_mean_le cfg ε M start L p E A C labels hp hCL hn hB hm hK s
  apply (le_div_iff₀ (pow_pos (sub_pos.mpr hε) _)).mpr
  simpa only [mul_comm] using hh.trans hc

theorem initial_lineSectionPoint_leaf_mean_le {n : ℕ} (cfg : FlowConfig n)
    (ε M start : ℝ) (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (C labels : Finset (Grid n)) (hp : p ∈ C) (hCL : C ⊆ labels)
    (hn : 0 < n) (hB : 1 ≤ cfg.B) (hm : ∀ q, cfg.mask q ≤ 1) (hK : cfg.K < 2)
    (deadline : Grid n → ℝ) (hε0 : 0 ≤ ε) (hε : ε < 1) :
    let s := initialGoodObservation cfg ε M hB deadline start
    (∫ ω, rootLeafPhi cfg.directions C p
      (lineSectionTerminal cfg ε M start L p E A hn (goodLineSectionInitial cfg p s) ω).val.2.2.physical
      ∂withinPhasePointMeasure cfg ε M hn s.val.1 p) ≤ 1 / (1-ε)^labels.card.choose 2 := by
  let s := initialGoodObservation cfg ε M hB deadline start
  have hh := lineSectionPoint_leaf_mean_le cfg ε M start L p E A C labels hp hCL hn
    (zero_lt_one.trans_le hB) hm hK s hε
    (fun a _ b _ _ => by rw [initialGoodObservation_eta]; linarith)
  have hi := goodMixed_empty_le_one_of_initial cfg (unitBirthRetention n) C labels s
    (initialGoodObservation_selected cfg ε M hB deadline start)
    (fun q => (initialGoodObservation_weight cfg ε M hB deadline start q).le)
    (initialGoodObservation_clock cfg ε M hB deadline start)
  have hphi : correctedPhi cfg.directions C labels s.val.1.val.1 ≤ 1 := by
    simpa only [goodMixed,mixed_empty,observedWitness] using hi
  exact hh.trans (div_le_div_of_nonneg_right hphi (pow_nonneg (sub_nonneg.mpr hε.le) _))

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.lineSectionPoint_correctedLeaf_mean_le
#print axioms NoThreeLine.BirthWitness.initial_lineSectionPoint_leaf_mean_le
