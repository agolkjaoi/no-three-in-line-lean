import NoThreeLine.PhaseSectionMassMoment
import NoThreeLine.PhaseLineSectionCapture
import NoThreeLine.PhasePointHistory

/-! The actual indexed strict-interior section-contact event is bounded under
the original full-J point law by one saved-snapshot moment. No time, step, or
phase union factor is introduced. This is not yet an arbitrary-time maximum
capture theorem. -/
set_option autoImplicit false
set_option maxHeartbeats 1800000
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines

def scheduledSectionContactBefore {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) (s : GoodPhaseLineSection n B p)
    (J : ℕ) : Set (BoardClockPath n) :=
  {ω | ∃ N < J, ∃ k, scheduledSectionContactAt cs ε M deadline start L p E A hn s N k ω}

theorem scheduledSectionContactBefore_measurableSet {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (hn : 0 < n) (s : GoodPhaseLineSection n B p) (J : ℕ) :
    MeasurableSet (scheduledSectionContactBefore cs ε M deadline start L p E A hn s J) := by
  apply Measurable.setOf
  exact Measurable.exists (fun N => measurable_const.and
    (Measurable.exists (fun k => scheduledSectionContactAt_measurable cs ε M deadline start L p E A hn s N k)))

theorem initial_phaseSectionPoint_mass_tail {n : ℕ} {B : ℝ}
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (Γ : Finset ZPoint) (hL : ¬specified Γ L) (hpL : p ∈ L.val)
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B)
    (hp : ((augInitialState B hB deadline start).val.physical.process.accounts p).status = .active)
    (hΓ : ∀ j, (cs j).directions = Γ) (hK : ∀ j, (cs j).K < 2)
    (hε0 : 0 ≤ ε) (hε : ε < 1) (m : ℕ) (hm : 0 < m) (J : ℕ) (a : ℝ) (ha : 0 < a) :
    (phasePointMeasure cs ε M deadline start hn hB p J).real {ω |
      a ≤ actualLineSectionMass L p E
        (phaseSectionRecycledState cs ε M deadline start L p E A hn (initialPhaseSection B hB p deadline start) J ω).val.2.2} ≤
      (((((L.val ∩ E).erase p).card:ℝ)^m +
        ∑ d ∈ Finset.Ico 1 m, B^(m-d)*(d:ℝ)^m*(((L.val ∩ E).erase p).card:ℝ)^d)/(1-ε)^(m+1).choose 2)/a^m := by
  let V := phaseSectionRecycledState cs ε M deadline start L p E A hn
    (initialPhaseSection B hB p deadline start) J
  let ν := phasePointMeasure cs ε M deadline start hn hB p J
  let f := fun ω => actualLineSectionMass L p E (V ω).val.2.2
  letI := phasePointMeasure_probability cs ε M deadline start hn hB p J
  have hv : Measurable V := (phaseSectionRecycledPair_measurable cs ε M deadline start L p E A hn
    (initialPhaseSection B hB p deadline start) J).fst.snd
  have hf : Measurable f := (actualLineSectionMass_measurable L p E).comp hv.subtype_val.snd.snd
  have hb (ω) : 0 ≤ f ω ∧ f ω ≤ B*(((L.val ∩ E).erase p).card:ℝ) :=
    actualLineSectionMass_bounds L p E _ B (zero_le_one.trans hB) (V ω).property.1.saved
  have hi : Integrable (fun ω => f ω ^ m) ν :=
    GenericCreditIteration.bounded_nonnegative_integrable ν _ (hf.pow_const m)
      ((B*(((L.val ∩ E).erase p).card:ℝ))^m)
      (fun ω => ⟨pow_nonneg (hb ω).1 _,pow_le_pow_left₀ (hb ω).1 (hb ω).2 m⟩)
  have hMarkov := mul_meas_ge_le_integral_of_nonneg
    (Filter.Eventually.of_forall (fun ω => pow_nonneg (hb ω).1 m)) hi (a^m)
  have hsub : {ω | a ≤ f ω} ⊆ {ω | a^m ≤ f ω^m} := fun ω hω => pow_le_pow_left₀ ha.le hω m
  have hh := (mul_le_mul_of_nonneg_left (measureReal_mono (μ:=ν) hsub) (pow_nonneg ha.le m)).trans hMarkov
  apply (le_div_iff₀ (pow_pos ha m)).mpr
  simpa only [mul_comm] using hh.trans
    (initial_phaseSectionPoint_mass_moment L p E A Γ hL hpL cs ε M deadline start hn hB hp hΓ hK hε0 hε m hm J)

theorem initial_phaseSectionPoint_contact_tail {n : ℕ} {B : ℝ}
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hA : 0 < A)
    (Γ : Finset ZPoint) (hL : ¬specified Γ L) (hpL : p ∈ L.val)
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B)
    (hp : ((augInitialState B hB deadline start).val.physical.process.accounts p).status = .active)
    (hΓ : ∀ j, (cs j).directions = Γ) (hK : ∀ j, (cs j).K < 2)
    (hε0 : 0 ≤ ε) (hε : ε < 1) (m : ℕ) (hm : 0 < m) (J : ℕ) :
    (phasePointMeasure cs ε M deadline start hn hB p J).real
      (scheduledSectionContactBefore cs ε M deadline start L p E A hn (initialPhaseSection B hB p deadline start) J) ≤
      (((((L.val ∩ E).erase p).card:ℝ)^m +
        ∑ d ∈ Finset.Ico 1 m, B^(m-d)*(d:ℝ)^m*(((L.val ∩ E).erase p).card:ℝ)^d)/(1-ε)^(m+1).choose 2)/A^m := by
  let ν := phasePointMeasure cs ε M deadline start hn hB p J
  letI := phasePointMeasure_probability cs ε M deadline start hn hB p J
  have hh := (phasePointMeasure_absolutelyContinuous cs ε M deadline start hn hB p J).ae_le
    (scheduledSectionContact_full_capture_ae cs ε M deadline start L p E A hn (zero_lt_one.trans_le hB)
      (initialPhaseSection B hB p deadline start) J)
  have hmeasure := measure_mono_ae hh
  have hreal := ENNReal.toReal_mono (measure_ne_top ν _) hmeasure
  exact hreal.trans (initial_phaseSectionPoint_mass_tail L p E A Γ hL hpL cs ε M deadline start hn hB hp
    hΓ hK hε0 hε m hm J A hA)

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.scheduledSectionContactBefore_measurableSet
#print axioms NoThreeLine.BirthWitness.initial_phaseSectionPoint_mass_tail
#print axioms NoThreeLine.BirthWitness.initial_phaseSectionPoint_contact_tail
