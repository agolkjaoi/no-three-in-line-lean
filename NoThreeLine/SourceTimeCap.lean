import NoThreeLine.WitnessCalendarSource

/-! Cut the remaining-time input without changing the fixed FlowConfig or
the selected physical/eta flow. Strictly before the cut, the real candidate
and boundary update is exactly the original update. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine

def sourceCapInput {n : ℕ} (cfg : FlowConfig n) (c : ℝ)
    (x : AugmentedCappedInput cfg) : AugmentedCappedInput cfg := (x.1,min x.2 c)

theorem sourceCapInput_measurable {n : ℕ} (cfg : FlowConfig n) :
    Measurable (fun z : ℝ×AugmentedCappedInput cfg=>sourceCapInput cfg z.1 z.2) :=
  measurable_snd.fst.prodMk (measurable_snd.snd.min measurable_fst)

theorem sourceCap_guard {n : ℕ} (cfg : FlowConfig n) (ε M c : ℝ) (hc : 0≤c)
    (x : AugmentedCappedInput cfg) :
    augGuardTime cfg ε M (sourceCapInput cfg c x)=min (augGuardTime cfg ε M x) c := by
  change max 0 (min (selectedGuardTime cfg x.1.1) (min (min x.2 c) (selectedAuxTime cfg ε M x.1)))=
    min (max 0 (min (selectedGuardTime cfg x.1.1) (min x.2 (selectedAuxTime cfg ε M x.1)))) c
  rw [show min (selectedGuardTime cfg x.1.1) (min (min x.2 c) (selectedAuxTime cfg ε M x.1))=
    min (min (selectedGuardTime cfg x.1.1) (min x.2 (selectedAuxTime cfg ε M x.1))) c by ac_rfl]
  rw [max_min_distrib_left,max_eq_right hc]

theorem sourceCap_advance {n : ℕ} (cfg : FlowConfig n) (ε M c : ℝ) (hc : 0≤c)
    (x : AugmentedCappedInput cfg) (t : ℝ) :
    augAdvance cfg ε M (sourceCapInput cfg c x,t)=min (augAdvance cfg ε M (x,t)) c := by
  change max 0 (min (augGuardTime cfg ε M (sourceCapInput cfg c x)) t)=
    min (max 0 (min (augGuardTime cfg ε M x) t)) c
  rw [sourceCap_guard cfg ε M c hc x]
  rw [show min (min (augGuardTime cfg ε M x) c) t=min (min (augGuardTime cfg ε M x) t) c by ac_rfl]
  rw [max_min_distrib_left,max_eq_right hc]

theorem sourceCap_pre_eq {n : ℕ} (cfg : FlowConfig n) (ε M c : ℝ) (hc : 0≤c)
    (x : AugmentedCappedInput cfg) (z : BirthWitness.CandidateData n)
    (hcut : augAdvance cfg ε M (x,z.1.1)≤c) :
    augPreState cfg ε M (sourceCapInput cfg c x,z)=augPreState cfg ε M (x,z) := by
  have ha : augAdvance cfg ε M (sourceCapInput cfg c x,z.1.1)=augAdvance cfg ε M (x,z.1.1) := by
    rw [sourceCap_advance cfg ε M c hc x z.1.1,min_eq_left hcut]
  change AugmentedState.mk
    (selectedTrajectory cfg (x.1.1,augAdvance cfg ε M (sourceCapInput cfg c x,z.1.1)))
    (selectedEtaCurve cfg (x.1,augAdvance cfg ε M (sourceCapInput cfg c x,z.1.1)))=_
  rw [ha]
  rfl

theorem sourceCap_candidate_window {n : ℕ} (cfg : FlowConfig n) (ε M c : ℝ) (hc : 0≤c)
    (x : AugmentedCappedInput cfg) (t : ℝ) (hcut : augAdvance cfg ε M (x,t)<c) :
    (0<t ∧ t≤augGuardTime cfg ε M (sourceCapInput cfg c x)) ↔
      (0<t ∧ t≤augGuardTime cfg ε M x) := by
  rw [sourceCap_guard cfg ε M c hc x]
  constructor
  · intro h
    exact ⟨h.1,h.2.trans (min_le_left _ _)⟩
  · intro h
    refine ⟨h.1,le_min h.2 ?_⟩
    change max 0 (min (augGuardTime cfg ε M x) t)<c at hcut
    rw [min_eq_right h.2,max_eq_right h.1.le] at hcut
    exact hcut.le

theorem sourceCap_raw_eq {n : ℕ} (cfg : FlowConfig n) (ε M c : ℝ) (hc : 0≤c)
    (x : AugmentedCappedInput cfg) (z : BirthWitness.CandidateData n)
    (hcut : augAdvance cfg ε M (x,z.1.1)<c) :
    augRawOutcome cfg ε M (sourceCapInput cfg c x,z)=augRawOutcome cfg ε M (x,z) := by
  simp only [augRawOutcome,sourceCap_candidate_window cfg ε M c hc x z.1.1 hcut,
    sourceCap_pre_eq cfg ε M c hc x z hcut.le]

theorem sourceCap_outcome_eq {n : ℕ} (cfg : FlowConfig n) (ε M c : ℝ) (hc : 0≤c)
    (x : AugmentedCappedInput cfg) (z : BirthWitness.CandidateData n)
    (hcut : augAdvance cfg ε M (x,z.1.1)<c) :
    augOutcome cfg ε M (sourceCapInput cfg c x,z)=augOutcome cfg ε M (x,z) := by
  unfold augOutcome
  rw [sourceCap_raw_eq cfg ε M c hc x z hcut]

theorem sourceCap_segmentBirth_iff {n : ℕ} (cfg : FlowConfig n) (ε M c : ℝ) (hc : 0≤c)
    (x : AugmentedCappedInput cfg) (z : BirthWitness.CandidateData n)
    (hcut : augAdvance cfg ε M (x,z.1.1)<c) :
    BirthWitness.segmentBirth cfg ε M (sourceCapInput cfg c x,z) ↔ BirthWitness.segmentBirth cfg ε M (x,z) := by
  unfold BirthWitness.segmentBirth
  rw [sourceCap_candidate_window cfg ε M c hc x z.1.1 hcut,
    sourceCap_pre_eq cfg ε M c hc x z hcut.le]

end NoThreeLine

#print axioms NoThreeLine.sourceCap_guard
#print axioms NoThreeLine.sourceCap_outcome_eq
#print axioms NoThreeLine.sourceCap_segmentBirth_iff
