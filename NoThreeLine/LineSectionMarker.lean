import NoThreeLine.LineSectionObserver
import NoThreeLine.WitnessRunningSource

/-! Distinguish genuine extra-contact closure from the artificial phase
horizon. The default firstClosedHit value at the horizon is never itself
recorded as a permanent contact. This memory does not alter the existing
line-section observer or its original physical projection. -/
set_option autoImplicit false
set_option maxHeartbeats 1400000
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE
attribute [local instance] Classical.propDecidable

abbrev MarkedLineSectionObservation {n : ℕ} (cfg : FlowConfig n) := LineSectionObservation cfg × Bool

def lineSectionPermanentContact {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (x : TimedObservation cfg × CandidateData n) : Prop :=
  selectedLineSectionTime cfg L p E A (augTimedInput cfg x.1.1).1.1 < cfg.horizon ∧
    selectedLineSectionTime cfg L p E A (augTimedInput cfg x.1.1).1.1 ≤
      augAdvance cfg ε M (augTimedInput cfg x.1.1,x.2.1.1)

theorem lineSectionPermanentContact_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) :
    Measurable (lineSectionPermanentContact cfg ε M L p E A) := by
  have hc : Measurable (fun x : TimedObservation cfg × CandidateData n =>
      selectedLineSectionTime cfg L p E A (augTimedInput cfg x.1.1).1.1) :=
    (selectedLineSectionTime_measurable cfg L p E A).comp
      ((augTimedInput_measurable cfg).comp measurable_fst.fst).fst.fst
  exact (hc.lt measurable_const).and (hc.le' ((augAdvance_measurable cfg ε M).comp
    (((augTimedInput_measurable cfg).comp measurable_fst.fst).prodMk measurable_snd.fst.fst)))

def markedLineSectionStep {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (x : MarkedLineSectionObservation cfg × CandidateData n) : MarkedLineSectionObservation cfg :=
  (lineSectionObserverStep cfg ε M start L p E A (x.1.1,x.2),
    if x.1.2 = true ∨ (x.1.1.2.1 = false ∧ lineSectionPermanentContact cfg ε M L p E A (x.1.1.1,x.2))
      then true else false)

theorem markedLineSectionStep_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) :
    Measurable (markedLineSectionStep cfg ε M start L p E A) :=
  ((lineSectionObserverStep_measurable cfg ε M start L p E A).comp
    (measurable_fst.fst.prodMk measurable_snd)).prodMk
    (Measurable.ite (((measurable_fst.snd.eq_const true).or
      ((measurable_fst.fst.snd.fst.eq_const false).and
        ((lineSectionPermanentContact_measurable cfg ε M L p E A).comp
          (measurable_fst.fst.fst.prodMk measurable_snd)))).setOf) measurable_const measurable_const)

theorem markedLineSectionStep_projection {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (x : MarkedLineSectionObservation cfg × CandidateData n) :
    (markedLineSectionStep cfg ε M start L p E A x).1 =
      lineSectionObserverStep cfg ε M start L p E A (x.1.1,x.2) := rfl

structure MarkedLineSectionInvariant {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (s : MarkedLineSectionObservation cfg) : Prop where
  core : LineSectionInvariant cfg p s.1
  contact_closed : s.2 = true → s.1.2.1 = true
  unmarked_closed : s.2 = false → s.1.2.1 = true → rootClosed cfg p s.1.1

theorem lineSectionStepClose_unmarked {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (s : LineSectionObservation cfg) (z : CandidateData n) (hs : LineSectionInvariant cfg p s)
    (hf : s.2.1 = false) (hc : lineSectionStepClose cfg ε M start L p E A (s.1,z))
    (hn : ¬lineSectionPermanentContact cfg ε M L p E A (s.1,z)) :
    rootClosed cfg p (observedStep cfg ε M start (s.1,z)) := by
  rcases hc with hc | hc
  · exact hc
  · have hτ : (cfg.horizon:ℝ) ≤ selectedLineSectionTime cfg L p E A (augTimedInput cfg s.1.1).1.1 :=
      le_of_not_gt (fun h => hn ⟨h,hc⟩)
    have hd : ¬observationDone cfg s.1 := fun h => hs.open_root hf (Or.inl h)
    have ha : s.1.1.val.2 ≤ observedAdvance cfg ε M (s.1,z) := by
      simp only [observedAdvance,if_neg hd]
      exact s.1.1.property.2.2.trans (hτ.trans hc)
    rw [observedAdvance_eq_remaining_drop cfg ε M start] at ha
    exact Or.inl (Or.inl (by linarith))

theorem markedLineSectionStep_invariant {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (s : MarkedLineSectionObservation cfg) (z : CandidateData n)
    (hs : MarkedLineSectionInvariant cfg p s) :
    MarkedLineSectionInvariant cfg p (markedLineSectionStep cfg ε M start L p E A (s,z)) := by
  have hc := lineSectionObserverStep_invariant cfg ε M start L p E A s.1 z hs.core
  refine ⟨hc,?_,?_⟩
  · intro hm
    change (if s.2 = true ∨ (s.1.2.1 = false ∧ lineSectionPermanentContact cfg ε M L p E A (s.1.1,z))
      then true else false) = true at hm
    split_ifs at hm with h
    · rcases h with h | ⟨hf,hc'⟩
      · exact congrArg Prod.fst (lineSectionObserverStep_preserves_frozen cfg ε M start L p E A
          (s.1,z) (hs.contact_closed h)) |>.trans (hs.contact_closed h)
      · exact congrArg Prod.fst (lineSectionObserverStep_first_closure cfg ε M start L p E A
          (s.1,z) hf (Or.inr hc'.2))
  · intro hm hf
    have hn : ¬(s.2 = true ∨ (s.1.2.1 = false ∧ lineSectionPermanentContact cfg ε M L p E A (s.1.1,z))) := by
      intro h
      change (if _ then true else false) = false at hm
      rw [if_pos h] at hm
      exact Bool.noConfusion hm
    have hm0 : s.2 = false := Bool.eq_false_iff.mpr (fun h => hn (Or.inl h))
    rw [markedLineSectionStep_projection,lineSectionObserverStep_projection]
    by_cases hf0 : s.1.2.1 = true
    · exact observedStep_rootClosed cfg ε M start (s.1.1,z) p (hs.unmarked_closed hm0 hf0)
    · have hf' : s.1.2.1 = false := Bool.eq_false_iff.mpr hf0
      have hclose : lineSectionStepClose cfg ε M start L p E A (s.1.1,z) := by
        by_contra h
        change (lineSectionObserverStep cfg ε M start L p E A (s.1,z)).2.1 = true at hf
        simp only [lineSectionObserverStep,if_neg hf0,if_neg h,Bool.false_eq_true] at hf
      exact lineSectionStepClose_unmarked cfg ε M start L p E A s.1 z hs.core hf' hclose
        (fun h => hn (Or.inr ⟨hf',h⟩))

def markedLineSectionInitial {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (s : TimedObservation cfg) : MarkedLineSectionObservation cfg :=
  (lineSectionInitial cfg p s,false)

theorem markedLineSectionInitial_invariant {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (s : TimedObservation cfg) (hs : RecordsConsistent cfg s) :
    MarkedLineSectionInvariant cfg p (markedLineSectionInitial cfg p s) := by
  refine ⟨lineSectionInitial_invariant cfg p s hs,fun h => False.elim (Bool.noConfusion h),?_⟩
  intro _ h
  by_contra hc
  change ¬rootClosed cfg p s at hc
  simp only [markedLineSectionInitial,lineSectionInitial,if_neg hc,Bool.false_eq_true] at h

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.markedLineSectionStep_projection
#print axioms NoThreeLine.BirthWitness.markedLineSectionStep_invariant
