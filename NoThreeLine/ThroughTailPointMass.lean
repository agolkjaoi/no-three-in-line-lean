import NoThreeLine.TwoCutFuturePoint

/-! The actual full-future credit density has finite mass, exactly the
initial root credit. It is a probability measure when that credit is one. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.BirthWitness

theorem throughTail_credit_integrable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 0<B) (j k : ℕ)
    (s : TimedObservation (cs j).config) (p : Grid n) :
    Integrable (fun ω=>validAugStateCredit B p (observedThroughPhaseTail cs ε M deadline start hn j k s ω).1.2.1)
      (boardClockMeasure n (B/n)) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  have hZ : Measurable (fun ω=>validAugStateCredit B p
      (observedThroughPhaseTail cs ε M deadline start hn j k s ω).1.2.1) :=
    (validAugStateCredit_measurable B p).comp
      (((observedAfterTerminal_measurable cs ε M deadline start hn j k).comp
        ((observedRecycledTerminalPair_measurable (cs j).config ε M (phaseEndpoint cs start j) hn).comp
          (measurable_const.prodMk measurable_id))).fst.snd.fst)
  exact GenericCreditIteration.bounded_nonnegative_integrable _ _ hZ B
    (fun ω=>validAugStateCredit_bounds B p _)

theorem throughTail_expected_credit {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 0<B) (j k : ℕ)
    (s : TimedObservation (cs j).config) (p : Grid n) :
    (∫ω,validAugStateCredit B p (observedThroughPhaseTail cs ε M deadline start hn j k s ω).1.2.1
      ∂boardClockMeasure n (B/n))=augTimedCredit (cs j).config p s.1 := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  have h := observedThroughPhaseTail_history_integral cs ε M deadline start hn hB j k 0 s p
    (fun _=>1) measurable_const 1 (fun _=>⟨zero_le_one,le_rfl⟩)
  simp only [mul_one] at h
  change (∫ω,validAugStateCredit B p (observedThroughPhaseTail cs ε M deadline start hn j k s ω).1.2.1
      ∂boardClockMeasure n (B/n))=(∫_ω : BoardClockPath n,augTimedCredit (cs j).config p s.1
        ∂boardClockMeasure n (B/n)) at h
  simpa using h

theorem throughTailPointMeasure_finite {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 0<B) (j k : ℕ)
    (s : TimedObservation (cs j).config) (p : Grid n) :
    IsFiniteMeasure (throughTailPointMeasure cs ε M deadline start hn j k s p) := by
  apply isFiniteMeasure_withDensity
  rw [←ofReal_integral_eq_lintegral_ofReal (throughTail_credit_integrable cs ε M deadline start hn hB j k s p)
    (ae_of_all _ (fun ω=>(validAugStateCredit_bounds B p _).1))]
  exact ENNReal.ofReal_ne_top

theorem throughTailPointMeasure_probability {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 0<B) (j k : ℕ)
    (s : TimedObservation (cs j).config) (p : Grid n) (hs : augTimedCredit (cs j).config p s.1=1) :
    IsProbabilityMeasure (throughTailPointMeasure cs ε M deadline start hn j k s p) :=
  savedCreditMeasure_probability _ _ (throughTail_credit_integrable cs ε M deadline start hn hB j k s p)
    (fun ω=>(validAugStateCredit_bounds B p _).1)
    ((throughTail_expected_credit cs ε M deadline start hn hB j k s p).trans hs)

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.throughTail_expected_credit
#print axioms NoThreeLine.BirthWitness.throughTailPointMeasure_probability
