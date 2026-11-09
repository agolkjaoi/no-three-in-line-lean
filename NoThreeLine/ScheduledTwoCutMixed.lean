import NoThreeLine.ObservedPhaseTwoCutMixed

/-! Source-free two-cut mixed comparison on the actual original schedule,
with its inherited phase state and residual clocks supplied internally. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.BirthWitness

theorem scheduled_two_cut_mixed_le_ae_earlier {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 0<B) (s : GoodPhaseObservation n B) (j : ℕ)
    (v : ℝ) (hv : v∈Icc 0 ((cs j).horizon:ℝ))
    (e : Retention n) (C L : Finset (Grid n)) (hCL : C⊆L) (hK : (cs j).config.K<2)
    (F : ℝ→TimedObservation (cs j).config→ℝ) (hF : ∀u,Measurable (F u))
    (A : ℝ) (hFA : ∀u x,0≤F u x ∧ F u x≤A) :
    ∀ᵐu : ℝ ∂volume,u∈Ioo 0 v →
    (∫ω,mixed (cs j).directions C ∅ L (scheduledCutWitness cs ε M deadline start e hn s j (ω,v))*
      F u (scheduledCutObservation cs ε M deadline start hn s j (ω,u))
      ∂boardClockMeasure n (B/n))≤
    ∫ω,mixed (cs j).directions C ∅ L (scheduledCutWitness cs ε M deadline start e hn s j (ω,u))*
      F u (scheduledCutObservation cs ε M deadline start hn s j (ω,u))
      ∂boardClockMeasure n (B/n) := by
  let cfg := (cs j).config
  let ν := boardClockMeasure n (B/n)
  let μ := goodPhaseStateLaw cs ε M deadline start hn s j
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  letI : IsProbabilityMeasure μ := goodPhaseStateLaw_probability cs ε M deadline start hn hB s j
  have he := phase_two_cut_mixed_le_ae_earlier cfg ε M (phaseEndpoint cs start j) v hv hn hB
    (cs j).mask_le_one e C L hCL hK μ F hF A hFA
  filter_upwards [he] with u hu huI
  let U := fun x : GoodPhaseObservation n B×BoardClockPath n=>
    phaseCutObservation cfg ε M (phaseEndpoint cs start j) hn ((x.1,u),x.2)
  let V := fun x : GoodPhaseObservation n B×BoardClockPath n=>
    phaseCutObservation cfg ε M (phaseEndpoint cs start j) hn ((x.1,v),x.2)
  have hU : Measurable U := (phaseCutObservation_measurable cfg ε M _ hn).comp
    ((measurable_fst.prodMk measurable_const).prodMk measurable_snd)
  have hV : Measurable V := (phaseCutObservation_measurable cfg ε M _ hn).comp
    ((measurable_fst.prodMk measurable_const).prodMk measurable_snd)
  let f := fun x : GoodPhaseObservation n B×BoardClockPath n=>mixed cfg.directions C ∅ L (observedWitness cfg e (V x))*F u (U x)
  let g := fun x : GoodPhaseObservation n B×BoardClockPath n=>mixed cfg.directions C ∅ L (observedWitness cfg e (U x))*F u (U x)
  have hf : Measurable f := ((mixed_measurable cfg.directions C ∅ L).comp
    ((observedWitness_measurable cfg e).comp hV)).mul ((hF u).comp hU)
  have hg : Measurable g := ((mixed_measurable cfg.directions C ∅ L).comp
    ((observedWitness_measurable cfg e).comp hU)).mul ((hF u).comp hU)
  have hy := goodPhases_measurable cs ε M deadline start hn s j
  change (∫ω,f (goodPhases cs ε M deadline start hn s j ω) ∂ν)≤
    ∫ω,g (goodPhases cs ε M deadline start hn s j ω) ∂ν
  rw [←integral_map_of_stronglyMeasurable hy hf.stronglyMeasurable,
    ←integral_map_of_stronglyMeasurable hy hg.stronglyMeasurable,
    goodPhases_residual_product cs ε M deadline start hn hB s j]
  exact hu huI

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.scheduled_two_cut_mixed_le_ae_earlier
