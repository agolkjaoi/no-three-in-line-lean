import NoThreeLine.LineSectionContact
import NoThreeLine.SourceCapBoundary
import NoThreeLine.RootFreezeMean

/-! A pre-resolution snapshot capped at the constructed line-mass contact.
Only the observation is capped; the original physical step is kept separately.
The source-free mixed estimate is supplied by the actual first-race law. -/
set_option autoImplicit false
set_option maxHeartbeats 1400000
noncomputable section
open MeasureTheory Set ProbabilityTheory

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines MixedConnection EtaMixedGenerator

def lineSectionInput {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (A : ℝ) (s : AugTimedState cfg) : AugmentedCappedInput cfg :=
  sourceCapInput cfg (selectedLineSectionTime cfg L p E A (augTimedInput cfg s).1.1) (augTimedInput cfg s)

theorem lineSectionInput_measurable {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (A : ℝ) : Measurable (lineSectionInput cfg L p E A) :=
  (sourceCapInput_measurable cfg).comp
    (((selectedLineSectionTime_measurable cfg L p E A).comp (augTimedInput_measurable cfg).fst.fst).prodMk
      (augTimedInput_measurable cfg))

def lineSectionRawSnapshot {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (x : TimedObservation cfg × CandidateData n) : AugmentedState n :=
  if observationDone cfg x.1 then x.1.1.val.1 else
    augRawOutcome cfg ε M (lineSectionInput cfg L p E A x.1.1,x.2)

theorem lineSectionRawSnapshot_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) :
    Measurable (lineSectionRawSnapshot cfg ε M L p E A) :=
  Measurable.ite ((observationDone_measurable cfg).comp measurable_fst).setOf
    (measurable_subtype_coe.fst.comp measurable_fst.fst)
    ((augRawOutcome_measurable cfg ε M).comp
      (((lineSectionInput_measurable cfg L p E A).comp measurable_fst.fst).prodMk measurable_snd))

theorem lineSectionRawSnapshot_valid {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (x : TimedObservation cfg × CandidateData n) :
    (lineSectionRawSnapshot cfg ε M L p E A x).Valid cfg.B := by
  unfold lineSectionRawSnapshot
  split_ifs
  · exact x.1.1.property.1
  · exact augRawOutcome_valid cfg ε M _ x.1.1.property.1.1 x.1.1.property.1.2 x.2

theorem lineSectionRawSnapshot_eq_raw {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (x : TimedObservation cfg × CandidateData n)
    (hle : augAdvance cfg ε M (augTimedInput cfg x.1.1,x.2.1.1) ≤
      selectedLineSectionTime cfg L p E A (augTimedInput cfg x.1.1).1.1) :
    lineSectionRawSnapshot cfg ε M L p E A x = (rawStepSaved cfg ε M start x).1 := by
  by_cases hd : observationDone cfg x.1
  · simp only [lineSectionRawSnapshot,rawStepSaved,if_pos hd,savedObservation]
  · simp only [lineSectionRawSnapshot,rawStepSaved,if_neg hd,lineSectionInput]
    exact sourceCap_raw_eq_of_le cfg ε M _ (selectedLineSectionTime_bounds cfg L p E A _).1 _ x.2 hle

theorem lineSectionRawSnapshot_interior {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (x : TimedObservation cfg × CandidateData n) (hd : ¬observationDone cfg x.1)
    (hlt : selectedLineSectionTime cfg L p E A (augTimedInput cfg x.1.1).1.1 <
      augAdvance cfg ε M (augTimedInput cfg x.1.1,x.2.1.1)) :
    lineSectionRawSnapshot cfg ε M L p E A x =
      selectedAugmentedCurve cfg (augTimedInput cfg x.1.1).1
        (selectedLineSectionTime cfg L p E A (augTimedInput cfg x.1.1).1.1) := by
  simp only [lineSectionRawSnapshot,if_neg hd,lineSectionInput]
  exact sourceCap_interior_raw cfg ε M _ (selectedLineSectionTime_bounds cfg L p E A _).1 _
    x.1.1.property.1.1 x.2 hlt

theorem lineSectionRawSnapshot_source_free {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (s : TimedObservation cfg) (C labels : Finset (Grid n))
    (hn : 0 < n) (hB : 0 < cfg.B) (hm : ∀ q, cfg.mask q ≤ 1)
    (hs : RecordsConsistent cfg s) (hCL : C ⊆ labels)
    (hE : EmptyLineCredit s.1.val.1.physical) (hK : cfg.K < 2) :
    (∫ ω, correctedPhi cfg.directions C labels
      (lineSectionRawSnapshot cfg ε M L p E A (s,WinnerMarkLaw.firstMarkedRace hn ω))
      ∂boardClockMeasure n (cfg.B/n)) ≤ correctedPhi cfg.directions C labels s.1.val.1 := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  by_cases hd : observationDone cfg s
  · simp only [lineSectionRawSnapshot,if_pos hd,integral_const,probReal_univ,one_smul,le_refl]
  · by_cases hC : C ⊆ s.1.val.1.physical.process.activeEvents
    · have hstop : s.1.val.1.physical.process.stopped = false :=
        Bool.eq_false_iff.mpr (fun h => hd (Or.inr h))
      let e := unitBirthRetention n
      have ha := observedWitness_valid cfg e s hs
      have hi := actual_raw_guard_source_bound cfg ε M 0 (lineSectionInput cfg L p E A s.1)
        e s.2 C ∅ labels hn hB hm ha hstop hC hCL (Finset.disjoint_empty_right C) hE hK
      rw [selectedWitnessCurve_initial cfg (lineSectionInput cfg L p E A s.1).1 _ ha.1.1] at hi
      simpa only [lineSectionRawSnapshot,if_neg hd,mixed_empty,rawObservedWitness,
        selectedSourceSum,sourceSum,Finset.sum_empty,mul_zero,intervalIntegral.integral_zero,add_zero,
        lineSectionInput,sourceCapInput,augTimedInput] using hi
    · have hz (a : AugmentedState n) (ha : ¬C ⊆ a.physical.process.activeEvents) :
          correctedPhi cfg.directions C labels a = 0 := by
        simp only [correctedPhi,phi,if_neg ha,mul_zero]
      have hzero (ω : BoardClockPath n) : correctedPhi cfg.directions C labels
          (lineSectionRawSnapshot cfg ε M L p E A (s,WinnerMarkLaw.firstMarkedRace hn ω)) = 0 := by
        apply hz
        simp only [lineSectionRawSnapshot,if_neg hd]
        exact fun h => hC (h.trans (augRawOutcome_active_subset cfg ε M _))
      rw [hz _ hC]
      simp only [hzero,integral_zero,le_refl]

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.lineSectionRawSnapshot_measurable
#print axioms NoThreeLine.BirthWitness.lineSectionRawSnapshot_interior
#print axioms NoThreeLine.BirthWitness.lineSectionRawSnapshot_source_free
