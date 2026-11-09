import NoThreeLine.LineSectionSnapshot

/-! An additional frozen snapshot for C22. The original physical step and
birth records continue unchanged. Unlike root-retirement freezing, early
mass freezing does not assert saved-credit=current-credit. -/
set_option autoImplicit false
set_option maxHeartbeats 1400000
noncomputable section
open MeasureTheory Set ProbabilityTheory

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines MixedConnection EtaMixedGenerator
attribute [local instance] Classical.propDecidable

abbrev LineSectionObservation {n : ℕ} (cfg : FlowConfig n) :=
  TimedObservation cfg × (Bool × AugmentedState n)

def lineSectionInitial {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (s : TimedObservation cfg) : LineSectionObservation cfg :=
  (s,(if rootClosed cfg p s then true else false),s.1.val.1)

def lineSectionStepClose {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (x : TimedObservation cfg × CandidateData n) : Prop :=
  rootClosed cfg p (observedStep cfg ε M start x) ∨
    selectedLineSectionTime cfg L p E A (augTimedInput cfg x.1.1).1.1 ≤
      augAdvance cfg ε M (augTimedInput cfg x.1.1,x.2.1.1)

theorem lineSectionStepClose_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) :
    Measurable (lineSectionStepClose cfg ε M start L p E A) :=
  ((rootClosed_measurable cfg p).comp (observedStep_measurable cfg ε M start)).or
    (((selectedLineSectionTime_measurable cfg L p E A).comp
      ((augTimedInput_measurable cfg).comp measurable_fst.fst).fst.fst).le'
      ((augAdvance_measurable cfg ε M).comp
        (((augTimedInput_measurable cfg).comp measurable_fst.fst).prodMk measurable_snd.fst.fst)))

def lineSectionObserverStep {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (x : LineSectionObservation cfg × CandidateData n) : LineSectionObservation cfg :=
  let next := observedStep cfg ε M start (x.1.1,x.2)
  if x.1.2.1 = true then (next,x.1.2)
  else if lineSectionStepClose cfg ε M start L p E A (x.1.1,x.2) then
    (next,true,lineSectionRawSnapshot cfg ε M L p E A (x.1.1,x.2))
  else (next,false,next.1.val.1)

theorem lineSectionObserverStep_projection {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (x : LineSectionObservation cfg × CandidateData n) :
    (lineSectionObserverStep cfg ε M start L p E A x).1 = observedStep cfg ε M start (x.1.1,x.2) := by
  unfold lineSectionObserverStep
  split_ifs <;> rfl

theorem lineSectionObserverStep_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) :
    Measurable (lineSectionObserverStep cfg ε M start L p E A) := by
  have hi : Measurable (fun x : LineSectionObservation cfg × CandidateData n => (x.1.1,x.2)) :=
    measurable_fst.fst.prodMk measurable_snd
  have hn := (observedStep_measurable cfg ε M start).comp hi
  apply Measurable.ite (measurable_fst.snd.fst.eq measurable_const).setOf
  · exact hn.prodMk measurable_fst.snd
  · apply Measurable.ite ((lineSectionStepClose_measurable cfg ε M start L p E A).comp hi).setOf
    · exact hn.prodMk (measurable_const.prodMk ((lineSectionRawSnapshot_measurable cfg ε M L p E A).comp hi))
    · exact hn.prodMk (measurable_const.prodMk (measurable_subtype_coe.fst.comp hn.fst))

structure LineSectionInvariant {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (s : LineSectionObservation cfg) : Prop where
  records : RecordsConsistent cfg s.1
  saved : s.2.2.Valid cfg.B
  live : s.2.1 = false → s.2.2 = s.1.1.val.1
  open_root : s.2.1 = false → ¬rootClosed cfg p s.1

theorem lineSectionInitial_invariant {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (s : TimedObservation cfg) (hs : RecordsConsistent cfg s) :
    LineSectionInvariant cfg p (lineSectionInitial cfg p s) := by
  refine ⟨hs,s.1.property.1,fun _ => rfl,?_⟩
  by_cases hc : rootClosed cfg p s <;> simp [lineSectionInitial,hc]

theorem lineSectionObserverStep_preserves_frozen {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (x : LineSectionObservation cfg × CandidateData n) (hf : x.1.2.1 = true) :
    (lineSectionObserverStep cfg ε M start L p E A x).2 = x.1.2 := by
  simp only [lineSectionObserverStep,if_pos hf]

theorem lineSectionObserverStep_first_closure {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (x : LineSectionObservation cfg × CandidateData n) (hf : x.1.2.1 = false)
    (hc : lineSectionStepClose cfg ε M start L p E A (x.1.1,x.2)) :
    (lineSectionObserverStep cfg ε M start L p E A x).2 =
      (true,lineSectionRawSnapshot cfg ε M L p E A (x.1.1,x.2)) := by
  simp only [lineSectionObserverStep,hf,Bool.false_eq_true,if_false,if_pos hc]

theorem lineSectionObserverStep_invariant {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (s : LineSectionObservation cfg) (z : CandidateData n) (hs : LineSectionInvariant cfg p s) :
    LineSectionInvariant cfg p (lineSectionObserverStep cfg ε M start L p E A (s,z)) := by
  have hr := observedStep_consistent cfg ε M start (s.1,z) hs.records
  by_cases hf : s.2.1 = true
  · simp only [lineSectionObserverStep,if_pos hf]
    exact ⟨hr,hs.saved,fun h => False.elim (Bool.noConfusion (hf.symm.trans h)),
      fun h => False.elim (Bool.noConfusion (hf.symm.trans h))⟩
  · by_cases hc : lineSectionStepClose cfg ε M start L p E A (s.1,z)
    · simp only [lineSectionObserverStep,if_neg hf,if_pos hc]
      exact ⟨hr,lineSectionRawSnapshot_valid cfg ε M L p E A _,
        fun h => False.elim (Bool.noConfusion h),fun h => False.elim (Bool.noConfusion h)⟩
    · simp only [lineSectionObserverStep,if_neg hf,if_neg hc]
      exact ⟨hr,(observedStep cfg ε M start (s.1,z)).1.property.1,fun _ => rfl,
        fun _ h => hc (Or.inl h)⟩

theorem lineSectionObserverStep_mixed_le_raw {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (s : LineSectionObservation cfg) (z : CandidateData n) (C labels : Finset (Grid n))
    (hs : LineSectionInvariant cfg p s) (hf : s.2.1 = false) :
    correctedPhi cfg.directions C labels (lineSectionObserverStep cfg ε M start L p E A (s,z)).2.2 ≤
      correctedPhi cfg.directions C labels (lineSectionRawSnapshot cfg ε M L p E A (s.1,z)) := by
  by_cases hc : lineSectionStepClose cfg ε M start L p E A (s.1,z)
  · rw [lineSectionObserverStep_first_closure cfg ε M start L p E A (s,z) hf hc]
  · have htime : augAdvance cfg ε M (augTimedInput cfg s.1.1,z.1.1) ≤
        selectedLineSectionTime cfg L p E A (augTimedInput cfg s.1.1).1.1 :=
      (lt_of_not_ge (fun h => hc (Or.inr h))).le
    rw [lineSectionRawSnapshot_eq_raw cfg ε M start L p E A (s.1,z) htime]
    simp only [lineSectionObserverStep,hf,Bool.false_eq_true,if_false,if_neg hc]
    simpa only [mixed_empty,observedWitness,savedWitness] using
      observedStep_mixed_le_rawStepSaved cfg ε M start (unitBirthRetention n) (s.1,z) C ∅ labels hs.records

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.lineSectionObserverStep_projection
#print axioms NoThreeLine.BirthWitness.lineSectionObserverStep_invariant
#print axioms NoThreeLine.BirthWitness.lineSectionObserverStep_mixed_le_raw
