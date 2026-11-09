import NoThreeLine.SourceTimedRestriction

/-! Before a fixed calendar cut, accepted births and their actual absolute
timestamps coincide under remaining-time restriction. No birth record is
replaced by a pre-birth weight or by a relative-time placeholder. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness

theorem sourceRestrict_timedBirth_iff {n : ℕ} (cfg : FlowConfig n) (ε M δ : ℝ) (hδ : 0≤δ)
    (s : AugTimedState cfg) (z : CandidateData n)
    (hcut : augAdvance cfg ε M (augTimedInput cfg s,z.1.1)<s.val.2-δ) :
    timedBirth cfg ε M (sourceRestrictState cfg δ hδ s,z) ↔ timedBirth cfg ε M (s,z) := by
  have ha0 := (augAdvance_mem cfg ε M (augTimedInput cfg s) s.property.1.1 z.1.1).1
  have hc : 0<s.val.2-δ := ha0.trans_lt hcut
  have hs : δ≤s.val.2 := sub_nonneg.mp hc.le
  have hR : 0<s.val.2 := lt_of_le_of_lt hδ (sub_pos.mp hc)
  have hd : ((sourceRestrictState cfg δ hδ s).val.2≤0 ∨
      (sourceRestrictState cfg δ hδ s).val.1.physical.process.stopped=true) ↔
      (s.val.2≤0 ∨ s.val.1.physical.process.stopped=true) := by
    rw [sourceRestrictState_remaining cfg δ hδ s hs]
    simp only [not_le_of_gt hc,not_le_of_gt hR,false_or]
    rfl
  unfold timedBirth
  rw [hd,sourceRestrictState_input_of_le cfg δ hδ s hs,
    sourceCap_segmentBirth_iff cfg ε M (s.val.2-δ) hc.le (augTimedInput cfg s) z hcut]

theorem sourceRestrict_birthTime {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ) (hδ : 0≤δ)
    (s : AugTimedState cfg) (z : CandidateData n)
    (hcut : augAdvance cfg ε M (augTimedInput cfg s,z.1.1)<s.val.2-δ) :
    birthObservationTime cfg ε M (start-δ) (sourceRestrictState cfg δ hδ s,z)=
      birthObservationTime cfg ε M start (s,z) := by
  have ha0 := (augAdvance_mem cfg ε M (augTimedInput cfg s) s.property.1.1 z.1.1).1
  have hc : 0<s.val.2-δ := ha0.trans_lt hcut
  have hs : δ≤s.val.2 := sub_nonneg.mp hc.le
  unfold birthObservationTime
  rw [sourceRestrictState_input_of_le cfg δ hδ s hs,
    sourceCap_advance cfg ε M (s.val.2-δ) hc.le,min_eq_left hcut.le]
  unfold observationTime
  rw [sourceRestrictState_remaining cfg δ hδ s hs]
  ring

theorem sourceRestrict_observedStep {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ) (hδ : 0≤δ)
    (s : TimedObservation cfg) (z : CandidateData n)
    (hcut : augAdvance cfg ε M (augTimedInput cfg s.1,z.1.1)<s.1.val.2-δ) :
    observedStep cfg ε M (start-δ) (sourceRestrictObservation cfg δ hδ s,z)=
      sourceRestrictObservation cfg δ hδ (observedStep cfg ε M start (s,z)) := by
  apply Prod.ext
  · exact sourceRestrictState_step cfg ε M δ hδ s.1 z hcut
  · change (if timedBirth cfg ε M (sourceRestrictState cfg δ hδ s.1,z) then
        Function.update s.2 z.1.2 (true,birthObservationTime cfg ε M (start-δ)
          (sourceRestrictState cfg δ hδ s.1,z)) else s.2)=
        (if timedBirth cfg ε M (s.1,z) then
          Function.update s.2 z.1.2 (true,birthObservationTime cfg ε M start (s.1,z)) else s.2)
    simp only [sourceRestrict_timedBirth_iff cfg ε M δ hδ s.1 z hcut,
      sourceRestrict_birthTime cfg ε M start δ hδ s.1 z hcut]

def sourceRestrictGood {n : ℕ} (cfg : FlowConfig n) (δ : ℝ) (hδ : 0≤δ)
    (s : GoodObservation cfg) : GoodObservation cfg :=
  ⟨sourceRestrictObservation cfg δ hδ s.val,
    sourceRestrictObservation_consistent cfg δ hδ s.val s.property.1,s.property.2⟩

theorem sourceRestrictGood_measurable {n : ℕ} (cfg : FlowConfig n) (δ : ℝ) (hδ : 0≤δ) :
    Measurable (sourceRestrictGood cfg δ hδ) :=
  ((sourceRestrictObservation_measurable cfg δ hδ).comp measurable_subtype_coe).subtype_mk

theorem sourceRestrictGood_mixed {n : ℕ} (cfg : FlowConfig n) (δ : ℝ) (hδ : 0≤δ)
    (e : Retention n) (C D L : Finset (Grid n)) (s : GoodObservation cfg) :
    goodMixed cfg e C D L (sourceRestrictGood cfg δ hδ s)=goodMixed cfg e C D L s := rfl

theorem sourceRestrictGood_step {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ) (hδ : 0≤δ)
    (s : GoodObservation cfg) (z : CandidateData n)
    (hcut : augAdvance cfg ε M (augTimedInput cfg s.val.1,z.1.1)<s.val.1.val.2-δ) :
    goodObservedStep cfg ε M (start-δ) (sourceRestrictGood cfg δ hδ s,z)=
      sourceRestrictGood cfg δ hδ (goodObservedStep cfg ε M start (s,z)) := by
  apply Subtype.ext
  exact sourceRestrict_observedStep cfg ε M start δ hδ s.val z hcut

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.sourceRestrict_birthTime
#print axioms NoThreeLine.BirthWitness.sourceRestrict_observedStep
#print axioms NoThreeLine.BirthWitness.sourceRestrictGood_step
