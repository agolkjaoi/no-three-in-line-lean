import NoThreeLine.LineSectionTerminalResidual
import NoThreeLine.LineSectionPointTower
import NoThreeLine.ObservedHistoryFutureCredit

/-! A contact observed in one actual phase can be tested against credit
after any finite tail of the original schedule. The entire saved payload
is in the proved terminal residual product; deadlines and early stop are
those of the original physical continuation. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

theorem lineSectionFuture_credit_test {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (j k : ℕ) (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (F : AugmentedState n → ℝ) (hF : Measurable F) (D : ℝ)
    (hFD : ∀ a, a.Valid B → |F a| ≤ D)
    (hn : 0 < n) (hB : 0 < B) (s : GoodObservation (cs j).config) :
    (∫ ω, validAugStateCredit B p
      (observedThroughPhaseTail cs ε M deadline start hn j k s.val ω).1.2.1 *
      F (lineSectionTerminal (cs j).config ε M (phaseEndpoint cs start j) L p E A hn
        (goodLineSectionInitial (cs j).config p s) ω).val.2.2 ∂boardClockMeasure n (B/n)) =
    ∫ ω, ((lineSectionTerminal (cs j).config ε M (phaseEndpoint cs start j) L p E A hn
      (goodLineSectionInitial (cs j).config p s) ω).val.2.2.physical.process.accounts p).credit *
      F (lineSectionTerminal (cs j).config ε M (phaseEndpoint cs start j) L p E A hn
        (goodLineSectionInitial (cs j).config p s) ω).val.2.2 ∂boardClockMeasure n (B/n) := by
  let cfg := (cs j).config
  let t₀ := phaseEndpoint cs start j
  let s₀ := goodLineSectionInitial cfg p s
  let μ := boardClockMeasure n (B/n)
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  let H := lineSectionTerminal cfg ε M t₀ L p E A hn s₀
  let R := fun ω => (lineSectionTerminalPair cfg ε M t₀ L p E A hn (s₀,ω)).2
  have hH : Measurable H := lineSectionTerminal_measurable cfg ε M t₀ L p E A hn s₀
  have hpairm : Measurable (fun ω => lineSectionTerminalPair cfg ε M t₀ L p E A hn (s₀,ω)) :=
    (lineSectionTerminalPair_measurable cfg ε M t₀ L p E A hn).comp
    (measurable_const.prodMk measurable_id)
  have hR : Measurable R := hpairm.snd
  letI : IsProbabilityMeasure (μ.map H) := Measure.isProbabilityMeasure_map hH.aemeasurable
  let f := fun x : GoodLineSectionObservation cfg p × BoardClockPath n =>
    validAugStateCredit B p (observedAfterTerminal cs ε M deadline start hn j k (x.1.val.1,x.2)).1.2.1 *
      F x.1.val.2.2
  let g := fun x : GoodLineSectionObservation cfg p => augTimedCredit cfg p x.val.1.1 * F x.val.2.2
  have hf : Measurable f :=
    ((validAugStateCredit_measurable B p).comp
      (((observedAfterTerminal_measurable cs ε M deadline start hn j k).comp
        ((measurable_subtype_coe.comp measurable_fst).fst.prodMk measurable_snd)).fst.snd.fst)).mul
      (hF.comp (measurable_subtype_coe.comp measurable_fst).snd.snd)
  have hg : Measurable g := ((augTimedCredit_measurable cfg p).comp measurable_subtype_coe.fst.fst).mul
    (hF.comp measurable_subtype_coe.snd.snd)
  have hfi : Integrable f ((μ.map H).prod μ) := by
    apply (integrable_const (B*D)).mono' hf.aestronglyMeasurable
    exact ae_of_all _ (fun x => by
      have hz := validAugStateCredit_bounds B p
        (observedAfterTerminal cs ε M deadline start hn j k (x.1.val.1,x.2)).1.2.1
      simpa only [f,Real.norm_eq_abs,abs_mul,abs_of_nonneg hz.1] using
        mul_le_mul hz.2 (hFD x.1.val.2.2 x.1.property.1.saved) (abs_nonneg _) hB.le)
  have hmean (x : GoodLineSectionObservation cfg p) : (∫ ω, f (x,ω) ∂μ) = g x := by
    change (∫ ω, validAugStateCredit B p
      (observedAfterTerminal cs ε M deadline start hn j k (x.val.1,ω)).1.2.1 * F x.val.2.2 ∂μ) = _
    rw [integral_mul_const,observedAfterTerminal_expected_credit cs ε M deadline start hn hB j k x.val.1 p]
  have hh := independent_history_setIntegral μ μ H R hH hR
    (lineSectionTerminal_residual_product cfg ε M t₀ L p E A hn hB s₀)
    f g hf hg hfi hmean Set.univ MeasurableSet.univ
  simp only [Set.preimage_univ,Measure.restrict_univ] at hh
  have hpost := lineSectionTerminal_initial_credit_test cfg ε M t₀ L p E A F hF D hFD hn hB
    (cs j).mask_le_one s
  calc
    _ = ∫ ω, f (H ω,R ω) ∂μ := by
      apply integral_congr_ae
      exact Filter.Eventually.of_forall (fun ω => by
        have hp := lineSectionTerminalPair_projection cfg ε M t₀ L p E A hn (s₀,ω)
        change validAugStateCredit B p (observedThroughPhaseTail cs ε M deadline start hn j k s.val ω).1.2.1 *
          F (H ω).val.2.2 = validAugStateCredit B p
            (observedAfterTerminal cs ε M deadline start hn j k ((H ω).val.1,R ω)).1.2.1 * F (H ω).val.2.2
        have hp' : ((H ω).val.1,R ω) = observedRecycledTerminalPair cfg ε M t₀ hn (s.val,ω) := hp
        rw [hp']
        rfl)
    _ = ∫ ω, g (H ω) ∂μ := hh
    _ = _ := hpost

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.lineSectionFuture_credit_test
