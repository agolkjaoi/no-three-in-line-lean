import NoThreeLine.SourceInteriorResolution

/-! Cutting strictly inside an actual update interval follows the same
selected physical/eta trajectory and creates no birth observation. -/
set_option autoImplicit false
noncomputable section
open Set

namespace NoThreeLine
open EtaMixedGenerator

theorem sourceCap_interior_time_lt {n : ℕ} (cfg : FlowConfig n) (ε M c : ℝ)
    (hc : 0≤c) (x : AugmentedCappedInput cfg) (t : ℝ)
    (hcut : c<augAdvance cfg ε M (x,t)) : c<t := by
  by_contra h
  have hle : augAdvance cfg ε M (x,t)≤c := by
    change max 0 (min (augGuardTime cfg ε M x) t)≤c
    exact max_le hc ((min_le_right _ _).trans (le_of_not_gt h))
  exact (not_le_of_gt hcut) hle

theorem sourceCap_interior_outcome {n : ℕ} (cfg : FlowConfig n) (ε M c : ℝ)
    (hc : 0≤c) (x : AugmentedCappedInput cfg) (he : x.1.1.val.Valid cfg.B)
    (hs : x.1.1.val.process.stopped=false) (z : BirthWitness.CandidateData n)
    (hcut : c<augAdvance cfg ε M (x,z.1.1)) :
    augOutcome cfg ε M (sourceCapInput cfg c x,z)=selectedAugmentedCurve cfg x.1 c := by
  have hcG := hcut.trans_le (augAdvance_mem cfg ε M x he z.1.1).2
  have hct := sourceCap_interior_time_lt cfg ε M c hc x z.1.1 hcut
  have hg : augGuardTime cfg ε M (sourceCapInput cfg c x)=c := by
    rw [sourceCap_guard cfg ε M c hc x,min_eq_right hcG.le]
  have ha : augAdvance cfg ε M (sourceCapInput cfg c x,z.1.1)=c := by
    rw [sourceCap_advance cfg ε M c hc x z.1.1,min_eq_right hcut.le]
  have hw : ¬(0<z.1.1 ∧ z.1.1≤augGuardTime cfg ε M (sourceCapInput cfg c x)) := by
    rw [hg]
    exact fun h => (not_le_of_gt hct) h.2
  have hp : augPreState cfg ε M (sourceCapInput cfg c x,z)=selectedAugmentedCurve cfg x.1 c := by
    rw [augPreState_selectedAugmentedCurve,ha]
    rfl
  simp only [augOutcome,augRawOutcome,if_neg hw,hp]
  exact selectedAugmentedCurve_resolve_interior cfg ε M x he hs c ⟨hc,hcG⟩

namespace BirthWitness

theorem sourceRestrict_no_interior_birth {n : ℕ} (cfg : FlowConfig n) (ε M δ : ℝ)
    (hδ : 0≤δ) (s : AugTimedState cfg) (z : CandidateData n)
    (hc : 0≤s.val.2-δ) (hcut : s.val.2-δ<augAdvance cfg ε M (augTimedInput cfg s,z.1.1)) :
    ¬timedBirth cfg ε M (sourceRestrictState cfg δ hδ s,z) := by
  have hs := sub_nonneg.mp hc
  have hct := sourceCap_interior_time_lt cfg ε M (s.val.2-δ) hc (augTimedInput cfg s) z.1.1 hcut
  intro hb
  have hw := hb.2.1.2
  rw [sourceRestrictState_input_of_le cfg δ hδ s hs,
    sourceCap_guard cfg ε M (s.val.2-δ) hc] at hw
  exact (not_le_of_gt hct) (hw.trans (min_le_right _ _))

theorem sourceRestrict_interior_state {n : ℕ} (cfg : FlowConfig n) (ε M δ : ℝ)
    (hδ : 0≤δ) (s : AugTimedState cfg) (z : CandidateData n)
    (hc : 0<s.val.2-δ) (hs : s.val.1.physical.process.stopped=false)
    (hcut : s.val.2-δ<augAdvance cfg ε M (augTimedInput cfg s,z.1.1)) :
    (augTimedStep cfg ε M (sourceRestrictState cfg δ hδ s,z)).val=
      (selectedAugmentedCurve cfg (augTimedInput cfg s).1 (s.val.2-δ),0) := by
  have hsr := sub_nonneg.mp hc.le
  have hd : ¬((sourceRestrictState cfg δ hδ s).val.2≤0 ∨
      (sourceRestrictState cfg δ hδ s).val.1.physical.process.stopped=true) := by
    rw [sourceRestrictState_remaining cfg δ hδ s hsr]
    simp only [not_le_of_gt hc,false_or]
    change ¬s.val.1.physical.process.stopped=true
    simp [hs]
  change augTimedStepPair cfg ε M (sourceRestrictState cfg δ hδ s,z)=_
  simp only [augTimedStepPair,if_neg hd]
  rw [sourceRestrictState_input_of_le cfg δ hδ s hsr,
    sourceCap_interior_outcome cfg ε M (s.val.2-δ) hc.le (augTimedInput cfg s) s.property.1.1 hs z hcut,
    sourceCap_advance cfg ε M (s.val.2-δ) hc.le,min_eq_right hcut.le,
    sourceRestrictState_remaining cfg δ hδ s hsr,sub_self]

theorem sourceRestrict_interior_observation {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ)
    (hδ : 0≤δ) (s : TimedObservation cfg) (z : CandidateData n)
    (hc : 0<s.1.val.2-δ) (hs : s.1.val.1.physical.process.stopped=false)
    (hcut : s.1.val.2-δ<augAdvance cfg ε M (augTimedInput cfg s.1,z.1.1)) :
    (observedStep cfg ε M (start-δ) (sourceRestrictObservation cfg δ hδ s,z)).1.val=
      (selectedAugmentedCurve cfg (augTimedInput cfg s.1).1 (s.1.val.2-δ),0) ∧
    (observedStep cfg ε M (start-δ) (sourceRestrictObservation cfg δ hδ s,z)).2=s.2 := by
  refine ⟨sourceRestrict_interior_state cfg ε M δ hδ s.1 z hc hs hcut,?_⟩
  exact observedStep_record_no_birth cfg ε M (start-δ) _
    (sourceRestrict_no_interior_birth cfg ε M δ hδ s.1 z hc.le hcut)

end BirthWitness
end NoThreeLine

#print axioms NoThreeLine.sourceCap_interior_outcome
#print axioms NoThreeLine.BirthWitness.sourceRestrict_interior_observation
