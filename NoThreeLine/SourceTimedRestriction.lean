import NoThreeLine.SourceTimeCap

/-! Subtract a fixed nonnegative amount from remaining time, retaining the
same physical and eta state. This keeps the fixed cfg and selected flow.
Before the new endpoint, the actual timed step commutes with restriction. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine

def sourceRestrictState {n : ℕ} (cfg : FlowConfig n) (δ : ℝ) (hδ : 0≤δ)
    (s : AugTimedState cfg) : AugTimedState cfg :=
  ⟨(s.val.1,max 0 (s.val.2-δ)),s.property.1,le_max_left _ _,
    (max_le s.property.2.1 (sub_le_self _ hδ)).trans s.property.2.2⟩

theorem sourceRestrictState_measurable {n : ℕ} (cfg : FlowConfig n) (δ : ℝ) (hδ : 0≤δ) :
    Measurable (sourceRestrictState cfg δ hδ) :=
  (measurable_subtype_coe.fst.prodMk
    (measurable_const.max (measurable_subtype_coe.snd.sub measurable_const))).subtype_mk

theorem sourceRestrictState_remaining {n : ℕ} (cfg : FlowConfig n) (δ : ℝ) (hδ : 0≤δ)
    (s : AugTimedState cfg) (hs : δ≤s.val.2) :
    (sourceRestrictState cfg δ hδ s).val.2=s.val.2-δ := max_eq_right (sub_nonneg.mpr hs)

theorem sourceRestrictState_input {n : ℕ} (cfg : FlowConfig n) (δ : ℝ) (hδ : 0≤δ)
    (s : AugTimedState cfg) :
    augTimedInput cfg (sourceRestrictState cfg δ hδ s)=
      sourceCapInput cfg (max 0 (s.val.2-δ)) (augTimedInput cfg s) := by
  apply Prod.ext
  · rfl
  · change max 0 (s.val.2-δ)=min s.val.2 (max 0 (s.val.2-δ))
    rw [min_eq_right (max_le s.property.2.1 (sub_le_self _ hδ))]

theorem sourceRestrictState_input_of_le {n : ℕ} (cfg : FlowConfig n) (δ : ℝ) (hδ : 0≤δ)
    (s : AugTimedState cfg) (hs : δ≤s.val.2) :
    augTimedInput cfg (sourceRestrictState cfg δ hδ s)=
      sourceCapInput cfg (s.val.2-δ) (augTimedInput cfg s) := by
  rw [sourceRestrictState_input,max_eq_right (sub_nonneg.mpr hs)]

theorem sourceRestrictState_step {n : ℕ} (cfg : FlowConfig n) (ε M δ : ℝ) (hδ : 0≤δ)
    (s : AugTimedState cfg) (z : BirthWitness.CandidateData n)
    (hcut : augAdvance cfg ε M (augTimedInput cfg s,z.1.1)<s.val.2-δ) :
    augTimedStep cfg ε M (sourceRestrictState cfg δ hδ s,z)=
      sourceRestrictState cfg δ hδ (augTimedStep cfg ε M (s,z)) := by
  have ha0 := (augAdvance_mem cfg ε M (augTimedInput cfg s) s.property.1.1 z.1.1).1
  have hc : 0<s.val.2-δ := ha0.trans_lt hcut
  have hs : δ≤s.val.2 := sub_nonneg.mp hc.le
  have hR : 0<s.val.2 := lt_of_le_of_lt hδ (sub_pos.mp hc)
  by_cases hstop : s.val.1.physical.process.stopped=true
  · rw [augTimedStep_stopped cfg ε M s hstop z,
      augTimedStep_stopped cfg ε M (sourceRestrictState cfg δ hδ s) hstop z]
  · have hd : ¬(s.val.2≤0 ∨ s.val.1.physical.process.stopped=true) :=
      not_or.mpr ⟨not_le_of_gt hR,hstop⟩
    have hd' : ¬((sourceRestrictState cfg δ hδ s).val.2≤0 ∨
        (sourceRestrictState cfg δ hδ s).val.1.physical.process.stopped=true) := by
      rw [sourceRestrictState_remaining cfg δ hδ s hs]
      exact not_or.mpr ⟨not_le_of_gt hc,hstop⟩
    have hinput := sourceRestrictState_input_of_le cfg δ hδ s hs
    have hout := sourceCap_outcome_eq cfg ε M (s.val.2-δ) hc.le (augTimedInput cfg s) z hcut
    have hadv : augAdvance cfg ε M (augTimedInput cfg (sourceRestrictState cfg δ hδ s),z.1.1)=
        augAdvance cfg ε M (augTimedInput cfg s,z.1.1) := by
      rw [hinput,sourceCap_advance cfg ε M (s.val.2-δ) hc.le,min_eq_left hcut.le]
    apply Subtype.ext
    change augTimedStepPair cfg ε M (sourceRestrictState cfg δ hδ s,z)=_
    simp only [augTimedStepPair,if_neg hd']
    rw [hadv,sourceRestrictState_remaining cfg δ hδ s hs,hinput,hout]
    change (augOutcome cfg ε M (augTimedInput cfg s,z),
      (s.val.2-δ)-augAdvance cfg ε M (augTimedInput cfg s,z.1.1))=
      ((augTimedStepPair cfg ε M (s,z)).1,max 0 ((augTimedStepPair cfg ε M (s,z)).2-δ))
    rw [show augTimedStepPair cfg ε M (s,z)=
        (augOutcome cfg ε M (augTimedInput cfg s,z),s.val.2-augAdvance cfg ε M (augTimedInput cfg s,z.1.1)) by
      simp only [augTimedStepPair,if_neg hd]]
    dsimp only
    rw [max_eq_right (by linarith : 0≤s.val.2-augAdvance cfg ε M (augTimedInput cfg s,z.1.1)-δ)]
    congr 1
    ring

namespace BirthWitness

def sourceRestrictObservation {n : ℕ} (cfg : FlowConfig n) (δ : ℝ) (hδ : 0≤δ)
    (s : TimedObservation cfg) : TimedObservation cfg := (sourceRestrictState cfg δ hδ s.1,s.2)

theorem sourceRestrictObservation_measurable {n : ℕ} (cfg : FlowConfig n) (δ : ℝ) (hδ : 0≤δ) :
    Measurable (sourceRestrictObservation cfg δ hδ) :=
  ((sourceRestrictState_measurable cfg δ hδ).comp measurable_fst).prodMk measurable_snd

theorem sourceRestrictObservation_time {n : ℕ} (cfg : FlowConfig n) (start δ : ℝ) (hδ : 0≤δ)
    (s : TimedObservation cfg) (hs : δ≤s.1.val.2) :
    observationTime cfg (start-δ) (sourceRestrictObservation cfg δ hδ s).1=
      observationTime cfg start s.1 := by
  change start-δ+cfg.horizon-(sourceRestrictState cfg δ hδ s.1).val.2=_
  rw [sourceRestrictState_remaining cfg δ hδ s.1 hs]
  unfold observationTime
  ring

theorem sourceRestrictObservation_witness {n : ℕ} (cfg : FlowConfig n) (δ : ℝ) (hδ : 0≤δ)
    (e : Retention n) (s : TimedObservation cfg) :
    observedWitness cfg e (sourceRestrictObservation cfg δ hδ s)=observedWitness cfg e s := rfl

theorem sourceRestrictObservation_consistent {n : ℕ} (cfg : FlowConfig n) (δ : ℝ) (hδ : 0≤δ)
    (s : TimedObservation cfg) (hs : RecordsConsistent cfg s) :
    RecordsConsistent cfg (sourceRestrictObservation cfg δ hδ s) := hs

end BirthWitness
end NoThreeLine

#print axioms NoThreeLine.sourceRestrictState_step
#print axioms NoThreeLine.BirthWitness.sourceRestrictObservation_time
