import NoThreeLine.WitnessSourceKernel

/-! A full snapshot independent of the current phase and remaining time.
The live-step snapshot is postgeometry and pre-resolution, and includes
the actual birth timestamp. No root flags or coordinates are replaced. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines MixedConnection EtaMixedGenerator

abbrev SavedObservation (n : ℕ) := AugmentedState n × BirthRecords n

def savedObservation {n : ℕ} (cfg : FlowConfig n) (s : TimedObservation cfg) :
    SavedObservation n := (s.1.val.1,s.2)

def savedWitness {n : ℕ} (e : Retention n) (s : SavedObservation n) : WitnessState n :=
  ⟨s.1,recordedValue e s.2⟩

def SavedConsistent {n : ℕ} (s : SavedObservation n) : Prop :=
  ∀q,(s.2 q).1=true ↔ q∈s.1.physical.process.selected

def SavedValid {n : ℕ} (B : ℝ) (s : SavedObservation n) : Prop :=
  s.1.Valid B ∧ SavedConsistent s

theorem savedObservation_measurable {n : ℕ} (cfg : FlowConfig n) :
    Measurable (savedObservation cfg) :=
  (measurable_subtype_coe.fst.comp measurable_fst).prodMk measurable_snd

theorem savedWitness_measurable {n : ℕ} (e : Retention n) : Measurable (savedWitness e) :=
  WitnessState.measurable_mk _ _ measurable_fst ((recordedValue_measurable e).comp measurable_snd)

theorem savedObservation_valid {n : ℕ} (cfg : FlowConfig n) (s : TimedObservation cfg)
    (hs : RecordsConsistent cfg s) : SavedValid cfg.B (savedObservation cfg s) :=
  ⟨s.1.property.1,hs⟩

theorem savedWitness_valid {n : ℕ} (B : ℝ) (e : Retention n) (s : SavedObservation n)
    (hs : SavedValid B s) : (savedWitness e s).Valid B := by
  refine ⟨hs.1,recordedValue_bounds e s.2,?_⟩
  intro q hq
  exact if_neg (fun h=>hq ((hs.2 q).mp h))

theorem savedWitness_observation {n : ℕ} (cfg : FlowConfig n) (e : Retention n)
    (s : TimedObservation cfg) : savedWitness e (savedObservation cfg s)=observedWitness cfg e s := rfl

def rawStepSaved {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (x : TimedObservation cfg × CandidateData n) : SavedObservation n :=
  if observationDone cfg x.1 then savedObservation cfg x.1 else
    (augRawOutcome cfg ε M (augTimedInput cfg x.1.1,x.2),(observedStep cfg ε M start x).2)

theorem rawStepSaved_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) :
    Measurable (rawStepSaved cfg ε M start) :=
  Measurable.ite ((observationDone_measurable cfg).comp measurable_fst).setOf
    ((savedObservation_measurable cfg).comp measurable_fst)
    (((augRawOutcome_measurable cfg ε M).comp
      (((augTimedInput_measurable cfg).comp measurable_fst.fst).prodMk measurable_snd)).prodMk
      (observedStep_measurable cfg ε M start).snd)

theorem rawStepSaved_done {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (x : TimedObservation cfg × CandidateData n) (hx : observationDone cfg x.1) :
    rawStepSaved cfg ε M start x=savedObservation cfg x.1 := by
  simp only [rawStepSaved,if_pos hx]

theorem rawStepSaved_records {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (x : TimedObservation cfg × CandidateData n) :
    (rawStepSaved cfg ε M start x).2=(observedStep cfg ε M start x).2 := by
  by_cases hx : observationDone cfg x.1
  · rw [rawStepSaved_done cfg ε M start x hx,observedStep_frozen cfg ε M start x hx]
    rfl
  · simp only [rawStepSaved,if_neg hx]

theorem rawStepSaved_resolved {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (x : TimedObservation cfg × CandidateData n) (hx : ¬observationDone cfg x.1) :
    (observedStep cfg ε M start x).1.val.1=
      (rawStepSaved cfg ε M start x).1.resolve cfg.directions cfg.B cfg.K cfg.rho ε M := by
  change (augTimedStepPair cfg ε M (x.1.1,x.2)).1=_
  have hd : ¬(x.1.1.val.2≤0 ∨ x.1.1.val.1.physical.process.stopped=true) := hx
  simp only [rawStepSaved,if_neg hx,augTimedStepPair,if_neg hd,augOutcome]

theorem rawStepSaved_selected {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (x : TimedObservation cfg × CandidateData n) :
    (rawStepSaved cfg ε M start x).1.physical.process.selected=
      (observedStep cfg ε M start x).1.val.1.physical.process.selected := by
  by_cases hx : observationDone cfg x.1
  · rw [rawStepSaved_done cfg ε M start x hx,observedStep_frozen cfg ε M start x hx]
    rfl
  · rw [rawStepSaved_resolved cfg ε M start x hx,augmented_resolve_selected]

theorem rawStepSaved_credit {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (x : TimedObservation cfg × CandidateData n) (p : Grid n) :
    ((rawStepSaved cfg ε M start x).1.physical.process.accounts p).credit=
      ((observedStep cfg ε M start x).1.val.1.physical.process.accounts p).credit := by
  by_cases hx : observationDone cfg x.1
  · rw [rawStepSaved_done cfg ε M start x hx,observedStep_frozen cfg ε M start x hx]
    rfl
  · rw [rawStepSaved_resolved cfg ε M start x hx,AugmentedState.resolve_credit]

theorem rawStepSaved_valid {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (x : TimedObservation cfg × CandidateData n) (hx : RecordsConsistent cfg x.1) :
    SavedValid cfg.B (rawStepSaved cfg ε M start x) := by
  constructor
  · by_cases hd : observationDone cfg x.1
    · rw [rawStepSaved_done cfg ε M start x hd]
      exact x.1.1.property.1
    · simp only [rawStepSaved,if_neg hd]
      exact augRawOutcome_valid cfg ε M (augTimedInput cfg x.1.1)
        x.1.1.property.1.1 x.1.1.property.1.2 x.2
  · intro q
    rw [rawStepSaved_records,rawStepSaved_selected]
    exact observedStep_consistent cfg ε M start x hx q

theorem rawStepSaved_witness {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (x : TimedObservation cfg × CandidateData n)
    (hx : ¬observationDone cfg x.1) :
    savedWitness e (rawStepSaved cfg ε M start x)=
      rawObservedWitness cfg ε M (birthObservationTime cfg ε M start (x.1.1,x.2)) e
        (augTimedInput cfg x.1.1,x.2) x.1.2 := by
  have hd : ¬(x.1.1.val.2≤0 ∨ x.1.1.val.1.physical.process.stopped=true) := hx
  simp only [savedWitness,rawStepSaved,if_neg hx,rawObservedWitness,rawBirthRecords,
    observedStep,timedBirth,hd,not_false_eq_true,true_and]

theorem rawStepSaved_witness_resolved {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (x : TimedObservation cfg × CandidateData n)
    (hx : ¬observationDone cfg x.1) :
    observedWitness cfg e (observedStep cfg ε M start x)=
      (savedWitness e (rawStepSaved cfg ε M start x)).resolve cfg.directions cfg.B cfg.K cfg.rho ε M := by
  change WitnessState.mk (observedStep cfg ε M start x).1.val.1
    (recordedValue e (observedStep cfg ε M start x).2)=
    WitnessState.mk ((rawStepSaved cfg ε M start x).1.resolve cfg.directions cfg.B cfg.K cfg.rho ε M)
      (recordedValue e (rawStepSaved cfg ε M start x).2)
  rw [rawStepSaved_resolved cfg ε M start x hx,rawStepSaved_records]

theorem observedStep_mixed_le_rawStepSaved {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (x : TimedObservation cfg × CandidateData n) (C D L : Finset (Grid n))
    (hx : RecordsConsistent cfg x.1) :
    mixed cfg.directions C D L (observedWitness cfg e (observedStep cfg ε M start x))≤
      mixed cfg.directions C D L (savedWitness e (rawStepSaved cfg ε M start x)) := by
  by_cases hd : observationDone cfg x.1
  · rw [rawStepSaved_done cfg ε M start x hd,observedStep_frozen cfg ε M start x hd,
      savedWitness_observation]
  · rw [rawStepSaved_witness_resolved cfg ε M start e x hd]
    exact mixed_resolve_le _ _ _ _ _ _ _ _ _ _
      (savedWitness_valid cfg.B e _ (rawStepSaved_valid cfg ε M start x hx))

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.rawStepSaved_measurable
#print axioms NoThreeLine.BirthWitness.rawStepSaved_credit
#print axioms NoThreeLine.BirthWitness.rawStepSaved_valid
#print axioms NoThreeLine.BirthWitness.observedStep_mixed_le_rawStepSaved
