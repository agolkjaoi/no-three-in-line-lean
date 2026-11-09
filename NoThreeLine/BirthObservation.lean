import NoThreeLine.BirthObservationEvent

/-! Deterministic measurable retention and an actual-time birth observer.
The observer records a timestamp once; b_q is evaluated as e_q(timestamp).
Its physical and eta projection is the original augmented timed step. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines MixedConnection EtaMixedGenerator

structure Retention (n : ℕ) where
  value : Grid n → ℝ → ℝ
  measurable_value : ∀q,Measurable (value q)
  bounds : ∀q t,0≤value q t ∧ value q t≤1

abbrev BirthRecords (n : ℕ) := Grid n → Bool × ℝ
abbrev TimedObservation {n : ℕ} (cfg : FlowConfig n) := AugTimedState cfg × BirthRecords n

def recordedValue {n : ℕ} (e : Retention n) (b : BirthRecords n) (q : Grid n) : ℝ :=
  if (b q).1=true then e.value q (b q).2 else 0

def observedWitness {n : ℕ} (cfg : FlowConfig n) (e : Retention n)
    (s : TimedObservation cfg) : WitnessState n := ⟨s.1.val.1,recordedValue e s.2⟩

def RecordsConsistent {n : ℕ} (cfg : FlowConfig n) (s : TimedObservation cfg) : Prop :=
  ∀q,(s.2 q).1=true ↔ q∈s.1.val.1.physical.process.selected

theorem recordedValue_bounds {n : ℕ} (e : Retention n) (b : BirthRecords n) (q : Grid n) :
    0≤recordedValue e b q ∧ recordedValue e b q≤1 := by
  unfold recordedValue
  split_ifs
  · exact e.bounds q _
  · exact ⟨le_rfl,zero_le_one⟩

theorem observedWitness_valid {n : ℕ} (cfg : FlowConfig n) (e : Retention n)
    (s : TimedObservation cfg) (hs : RecordsConsistent cfg s) : (observedWitness cfg e s).Valid cfg.B := by
  refine ⟨s.1.property.1,recordedValue_bounds e s.2,?_⟩
  intro q hq
  exact if_neg (fun h=>hq ((hs q).mp h))

instance (n : ℕ) : MeasurableSpace (WitnessState n) :=
  MeasurableSpace.comap (fun a : WitnessState n=>(a.augmented,a.retained)) inferInstance

theorem WitnessState.measurable_mk {n : ℕ} {X : Type*} [MeasurableSpace X]
    (a : X → AugmentedState n) (b : X → Grid n → ℝ) (ha : Measurable a) (hb : Measurable b) :
    Measurable (fun x=>WitnessState.mk (a x) (b x)) := measurable_comap_iff.mpr (ha.prodMk hb)

theorem recordedValue_measurable {n : ℕ} (e : Retention n) : Measurable (recordedValue e) := by
  apply measurable_pi_lambda
  intro q
  exact Measurable.ite (((measurable_pi_apply q).fst.eq measurable_const).setOf)
    ((e.measurable_value q).comp (measurable_pi_apply q).snd) measurable_const

theorem observedWitness_measurable {n : ℕ} (cfg : FlowConfig n) (e : Retention n) :
    Measurable (observedWitness cfg e) :=
  WitnessState.measurable_mk _ _ (measurable_subtype_coe.fst.comp measurable_fst)
    ((recordedValue_measurable e).comp measurable_snd)

def observationTime {n : ℕ} (cfg : FlowConfig n) (start : ℝ) (s : AugTimedState cfg) : ℝ :=
  start+cfg.horizon-s.val.2

def birthObservationTime {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (x : AugTimedState cfg × CandidateData n) : ℝ :=
  observationTime cfg start x.1+augAdvance cfg ε M (augTimedInput cfg x.1,x.2.1.1)

theorem birthObservationTime_eq_after {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (x : AugTimedState cfg × CandidateData n)
    (hx : ¬(x.1.val.2≤0 ∨ x.1.val.1.physical.process.stopped=true)) :
    birthObservationTime cfg ε M start x=observationTime cfg start (augTimedStep cfg ε M x) := by
  change start+cfg.horizon-x.1.val.2+augAdvance cfg ε M (augTimedInput cfg x.1,x.2.1.1)=
    start+cfg.horizon-(augTimedStepPair cfg ε M x).2
  simp only [augTimedStepPair,if_neg hx]
  ring

theorem birthObservationTime_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) :
    Measurable (birthObservationTime cfg ε M start) :=
  (measurable_const.sub (measurable_subtype_coe.snd.comp measurable_fst)).add
    ((augAdvance_measurable cfg ε M).comp
      (((augTimedInput_measurable cfg).comp measurable_fst).prodMk measurable_snd.fst.fst))

def observedStep {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (x : TimedObservation cfg × CandidateData n) : TimedObservation cfg :=
  (augTimedStep cfg ε M (x.1.1,x.2),
    if timedBirth cfg ε M (x.1.1,x.2) then
      Function.update x.1.2 x.2.1.2 (true,birthObservationTime cfg ε M start (x.1.1,x.2)) else x.1.2)

theorem observedStep_base {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (x : TimedObservation cfg × CandidateData n) :
    (observedStep cfg ε M start x).1=augTimedStep cfg ε M (x.1.1,x.2) := rfl

theorem observedStep_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) :
    Measurable (observedStep cfg ε M start) := by
  have hin : Measurable (fun x : TimedObservation cfg × CandidateData n=>(x.1.1,x.2)) :=
    measurable_fst.fst.prodMk measurable_snd
  have hu : Measurable (fun x : (BirthRecords n × ℝ) × Grid n=>Function.update x.1.1 x.2 (true,x.1.2)) :=
    measurable_from_prod_countable_left (fun q=>measurable_update'.comp
      (measurable_fst.prodMk (measurable_const.prodMk measurable_snd)))
  apply Measurable.prodMk ((augTimedStep_measurable cfg ε M).comp hin)
  exact Measurable.ite (((timedBirth_measurable cfg ε M).comp hin).setOf)
    (hu.comp ((measurable_fst.snd.prodMk ((birthObservationTime_measurable cfg ε M start).comp hin)).prodMk
      measurable_snd.fst.snd)) measurable_fst.snd

theorem observedStep_consistent {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (x : TimedObservation cfg × CandidateData n) (hx : RecordsConsistent cfg x.1) :
    RecordsConsistent cfg (observedStep cfg ε M start x) := by
  intro p
  change ((if timedBirth cfg ε M (x.1.1,x.2) then
      Function.update x.1.2 x.2.1.2 (true,birthObservationTime cfg ε M start (x.1.1,x.2)) else x.1.2) p).1=true ↔ _
  rw [observedStep_base,augTimedStep_selected]
  by_cases hb : timedBirth cfg ε M (x.1.1,x.2)
  · rw [if_pos hb,if_pos hb]
    by_cases hp : p=x.2.1.2
    · simp [hp]
    · simpa only [Function.update_of_ne hp,Finset.mem_insert,hp,false_or] using hx p
  · rw [if_neg hb,if_neg hb]
    exact hx p

theorem observedStep_record_of_birth {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (x : TimedObservation cfg × CandidateData n) (hx : timedBirth cfg ε M (x.1.1,x.2)) :
    (observedStep cfg ε M start x).2 x.2.1.2=
      (true,birthObservationTime cfg ε M start (x.1.1,x.2)) := by simp [observedStep,hx]

theorem observedStep_record_no_birth {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (x : TimedObservation cfg × CandidateData n) (hx : ¬timedBirth cfg ε M (x.1.1,x.2)) :
    (observedStep cfg ε M start x).2=x.1.2 := by simp [observedStep,hx]

theorem observedStep_record_preserved {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (x : TimedObservation cfg × CandidateData n) (hx : RecordsConsistent cfg x.1)
    (p : Grid n) (hp : (x.1.2 p).1=true) : (observedStep cfg ε M start x).2 p=x.1.2 p := by
  by_cases hb : timedBirth cfg ε M (x.1.1,x.2)
  · have hpq : p≠x.2.1.2 := by
      intro he
      exact timedBirth_fresh cfg ε M (x.1.1,x.2) hb (he ▸ (hx p).mp hp)
    simp only [observedStep,if_pos hb,Function.update_of_ne hpq]
  · rw [observedStep_record_no_birth cfg ε M start x hb]

theorem observedStep_retention_at_birth {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (x : TimedObservation cfg × CandidateData n)
    (hx : timedBirth cfg ε M (x.1.1,x.2)) :
    (observedWitness cfg e (observedStep cfg ε M start x)).retained x.2.1.2=
      e.value x.2.1.2 (observationTime cfg start (augTimedStep cfg ε M (x.1.1,x.2))) := by
  change recordedValue e (observedStep cfg ε M start x).2 x.2.1.2=_
  unfold recordedValue
  rw [observedStep_record_of_birth cfg ε M start x hx]
  simp only [ite_true]
  rw [birthObservationTime_eq_after cfg ε M start _ hx.1]

theorem observedStep_frozen {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (x : TimedObservation cfg × CandidateData n)
    (hx : x.1.1.val.2≤0 ∨ x.1.1.val.1.physical.process.stopped=true) :
    observedStep cfg ε M start x=x.1 := by
  apply Prod.ext
  · apply Subtype.ext
    simp [observedStep,augTimedStep,augTimedStepPair,hx]
  · exact observedStep_record_no_birth cfg ε M start x (fun h=>h.1 hx)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.observedStep_measurable
#print axioms NoThreeLine.BirthWitness.observedStep_consistent
#print axioms NoThreeLine.BirthWitness.observedStep_retention_at_birth
