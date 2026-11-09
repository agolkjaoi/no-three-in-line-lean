import NoThreeLine.BirthObservation

/-! The timestamp observer agrees with the actual pre-retirement S7 birth
snapshot. Resolution happens afterwards and never erases the birth record. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines MixedConnection EtaMixedGenerator

def rawBirthRecords {n : ℕ} (cfg : FlowConfig n) (ε M t : ℝ)
    (x : AugmentedCappedInput cfg × CandidateData n) (b : BirthRecords n) : BirthRecords n :=
  if segmentBirth cfg ε M x then Function.update b x.2.1.2 (true,t) else b

def rawObservedWitness {n : ℕ} (cfg : FlowConfig n) (ε M t : ℝ) (e : Retention n)
    (x : AugmentedCappedInput cfg × CandidateData n) (b : BirthRecords n) : WitnessState n :=
  ⟨augRawOutcome cfg ε M x,recordedValue e (rawBirthRecords cfg ε M t x b)⟩

theorem recordedValue_update {n : ℕ} (e : Retention n) (b : BirthRecords n) (q : Grid n) (t : ℝ) :
    recordedValue e (Function.update b q (true,t))=Function.update (recordedValue e b) q (e.value q t) := by
  funext p
  by_cases hp : p=q
  · simp [recordedValue,hp]
  · simp [recordedValue,hp]

theorem rawObservedWitness_accepted {n : ℕ} (cfg : FlowConfig n) (ε M t : ℝ) (e : Retention n)
    (x : AugmentedCappedInput cfg × CandidateData n) (b : BirthRecords n)
    (hw : 0<x.2.1.1 ∧ x.2.1.1≤augGuardTime cfg ε M x.1)
    (ha : x.2.2≤(augPreState cfg ε M x).physical.process.acceptance cfg.mask cfg.B x.2.1.2) :
    rawObservedWitness cfg ε M t e x b=
      (WitnessState.mk (augPreState cfg ε M x) (recordedValue e b)).birth cfg.directions x.2.1.2
        (fun q=>e.value q t) := by
  have hp := augRawOutcome_accepted_snapshot cfg ε M x.1 x.2 hw ha
  by_cases he : (augPreState cfg ε M x).physical.process.stopped=false ∧
      ((augPreState cfg ε M x).physical.process.accounts x.2.1.2).status=.active
  · have hb : segmentBirth cfg ε M x := ⟨hw,ha,he⟩
    have he' : (augPreState cfg ε M x).physical.process.stopped=false ∧
        x.2.1.2∈(augPreState cfg ε M x).physical.process.activeEvents :=
      ⟨he.1,(ProcessState.mem_activeEvents _ _).mpr he.2⟩
    simp only [rawObservedWitness,rawBirthRecords,if_pos hb,recordedValue_update,hp,WitnessState.birth,
      if_pos he']
  · have hb : ¬segmentBirth cfg ε M x := fun h=>he h.2.2
    have he' : ¬((augPreState cfg ε M x).physical.process.stopped=false ∧
        x.2.1.2∈(augPreState cfg ε M x).physical.process.activeEvents) := by
      simpa only [ProcessState.mem_activeEvents] using he
    have hproj := WitnessState.birth_augmented
      (WitnessState.mk (augPreState cfg ε M x) (recordedValue e b)) cfg.directions x.2.1.2 (fun q=>e.value q t)
    simp only [WitnessState.birth,if_neg he'] at hproj
    simp only [rawObservedWitness,rawBirthRecords,if_neg hb,hp,←hproj,WitnessState.birth,if_neg he']

theorem rawObservedWitness_no_birth {n : ℕ} (cfg : FlowConfig n) (ε M t : ℝ) (e : Retention n)
    (x : AugmentedCappedInput cfg × CandidateData n) (b : BirthRecords n)
    (hx : ¬segmentBirth cfg ε M x) :
    (rawObservedWitness cfg ε M t e x b).retained=recordedValue e b := by
  simp only [rawObservedWitness,rawBirthRecords,if_neg hx]

theorem observedStep_resolved_snapshot {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (x : TimedObservation cfg × CandidateData n)
    (hx : ¬(x.1.1.val.2≤0 ∨ x.1.1.val.1.physical.process.stopped=true)) :
    observedWitness cfg e (observedStep cfg ε M start x)=
      let raw := rawObservedWitness cfg ε M (birthObservationTime cfg ε M start (x.1.1,x.2)) e
        (augTimedInput cfg x.1.1,x.2) x.1.2
      ⟨raw.augmented.resolve cfg.directions cfg.B cfg.K cfg.rho ε M,raw.retained⟩ := by
  change WitnessState.mk (augTimedStepPair cfg ε M (x.1.1,x.2)).1
    (recordedValue e (if timedBirth cfg ε M (x.1.1,x.2) then
      Function.update x.1.2 x.2.1.2 (true,birthObservationTime cfg ε M start (x.1.1,x.2)) else x.1.2))=_
  simp only [augTimedStepPair,if_neg hx,timedBirth,hx,not_false_eq_true,true_and,
    rawObservedWitness,rawBirthRecords,augOutcome,if_false]

theorem observedStep_rejected_records {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (x : TimedObservation cfg × CandidateData n)
    (hx : ¬x.2.2≤(augPreState cfg ε M (augTimedInput cfg x.1.1,x.2)).physical.process.acceptance
      cfg.mask cfg.B x.2.1.2) : (observedStep cfg ε M start x).2=x.1.2 :=
  observedStep_record_no_birth cfg ε M start x (fun h=>hx h.2.2.1)

theorem observedStep_no_arrival_records {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (x : TimedObservation cfg × CandidateData n)
    (hx : ¬(0<x.2.1.1 ∧ x.2.1.1≤augGuardTime cfg ε M (augTimedInput cfg x.1.1))) :
    (observedStep cfg ε M start x).2=x.1.2 :=
  observedStep_record_no_birth cfg ε M start x (fun h=>hx h.2.1)

theorem observedStep_birth_aux_stop {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (x : TimedObservation cfg × CandidateData n)
    (hb : timedBirth cfg ε M (x.1.1,x.2))
    (haux : (augRawOutcome cfg ε M (augTimedInput cfg x.1.1,x.2)).auxBad cfg.directions ε M) :
    (observedStep cfg ε M start x).1.val.1.physical.process.stopped=true ∧
    (observedWitness cfg e (observedStep cfg ε M start x)).retained x.2.1.2=
      e.value x.2.1.2 (observationTime cfg start (observedStep cfg ε M start x).1) := by
  constructor
  · change (augTimedStepPair cfg ε M (x.1.1,x.2)).1.physical.process.stopped=true
    simp only [augTimedStepPair,if_neg hb.1]
    exact AugmentedState.resolve_stops_aux _ _ _ _ _ _ _ haux
  · exact observedStep_retention_at_birth cfg ε M start e x hb

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.rawObservedWitness_accepted
#print axioms NoThreeLine.BirthWitness.observedStep_resolved_snapshot
#print axioms NoThreeLine.BirthWitness.observedStep_birth_aux_stop
