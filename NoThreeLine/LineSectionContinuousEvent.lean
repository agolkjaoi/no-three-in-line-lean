import NoThreeLine.MarkedSectionExceedance
import Mathlib.Topology.Instances.Rat

/-! The actual positive-time strict section exceedance is measurable by a
countable rational description, including exceedance at the executed right
endpoint. No uncountable-intersection measurability premise is used. -/
set_option autoImplicit false
set_option maxHeartbeats 1700000
noncomputable section
open MeasureTheory Set

namespace NoThreeLine
open AuxiliaryODE EtaMixedGenerator

theorem continuous_positive_exceedance_rat {f : ℝ → ℝ} (hf : Continuous f) (A b : ℝ) :
    (∃ t : ℝ, 0 < t ∧ t ≤ b ∧ A < f t) ↔
      ∃ q : ℚ, 0 < (q:ℝ) ∧ (q:ℝ) < b ∧ A < f q := by
  constructor
  · rintro ⟨t,ht,htb,hm⟩
    obtain ⟨δ,hδ,hfδ⟩ := Metric.continuousAt_iff.mp hf.continuousAt (f t-A) (sub_pos.mpr hm)
    obtain ⟨q,hq0,hqt⟩ := exists_rat_btwn (show max 0 (t-δ) < t from max_lt ht (sub_lt_self t hδ))
    have hqpos : 0 < (q:ℝ) := (le_max_left _ _).trans_lt hq0
    have hqδ : t-δ < (q:ℝ) := (le_max_right _ _).trans_lt hq0
    have hd : dist (q:ℝ) t < δ := by
      rw [Real.dist_eq,abs_of_neg (sub_neg.mpr hqt)]
      linarith
    have hh := hfδ hd
    rw [Real.dist_eq,abs_lt] at hh
    exact ⟨q,hqpos,hqt.trans_le htb,by linarith [hh.1]⟩
  · rintro ⟨q,hq,hqb,hf⟩
    exact ⟨q,hq,hqb.le,hf⟩

theorem selectedAugmentedCurve_joint_measurable {n : ℕ} (cfg : FlowConfig n) :
    Measurable (fun x : EtaFlowInput cfg × ℝ => selectedAugmentedCurve cfg x.1 x.2) :=
  AugmentedState.measurable_mk _ _
    ((selectedTrajectory_measurable cfg).comp (measurable_fst.fst.prodMk measurable_snd))
    (selectedEtaCurve_measurable cfg)

namespace BirthWitness

def lineSectionContinuousExceedance {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (x : TimedObservation cfg × CandidateData n) : Prop :=
  ¬phaseRootClosed p (observedTimedProjection cfg x.1) ∧
    ∃ t : ℝ, 0 < t ∧ t ≤ augAdvance cfg ε M (augTimedInput cfg x.1.1,x.2.1.1) ∧
      A < actualLineSectionMass L p E (selectedAugmentedCurve cfg (augTimedInput cfg x.1.1).1 t)

theorem lineSectionContinuousExceedance_rat {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (x : TimedObservation cfg × CandidateData n) :
    lineSectionContinuousExceedance cfg ε M L p E A x ↔
      ¬phaseRootClosed p (observedTimedProjection cfg x.1) ∧
        ∃ q : ℚ, 0 < (q:ℝ) ∧ (q:ℝ) < augAdvance cfg ε M (augTimedInput cfg x.1.1,x.2.1.1) ∧
          A < actualLineSectionMass L p E (selectedAugmentedCurve cfg (augTimedInput cfg x.1.1).1 q) := by
  unfold lineSectionContinuousExceedance
  apply and_congr_right
  intro _
  apply continuous_positive_exceedance_rat
  simp_rw [actualLineSectionMass_selected]
  exact (lineSectionMass_continuous _ L p E).comp (selectedLineSectionCurve_continuous cfg _)

theorem lineSectionContinuousExceedance_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) :
    Measurable (lineSectionContinuousExceedance cfg ε M L p E A) := by
  have hi : Measurable (fun x : TimedObservation cfg × CandidateData n => augTimedInput cfg x.1.1) :=
    (augTimedInput_measurable cfg).comp measurable_fst.fst
  have ha := (augAdvance_measurable cfg ε M).comp (hi.prodMk measurable_snd.fst.fst)
  have hm (q : ℚ) : Measurable (fun x : TimedObservation cfg × CandidateData n =>
      actualLineSectionMass L p E (selectedAugmentedCurve cfg (augTimedInput cfg x.1.1).1 q)) :=
    (actualLineSectionMass_measurable L p E).comp
      ((selectedAugmentedCurve_joint_measurable cfg).comp (hi.fst.prodMk measurable_const))
  have he : lineSectionContinuousExceedance cfg ε M L p E A = fun x : TimedObservation cfg × CandidateData n =>
      ¬phaseRootClosed p (observedTimedProjection cfg x.1) ∧
        ∃ q : ℚ, 0 < (q:ℝ) ∧ (q:ℝ) < augAdvance cfg ε M (augTimedInput cfg x.1.1,x.2.1.1) ∧
          A < actualLineSectionMass L p E (selectedAugmentedCurve cfg (augTimedInput cfg x.1.1).1 q) :=
    funext (fun x => propext (lineSectionContinuousExceedance_rat cfg ε M L p E A x))
  rw [he]
  exact (((phaseRootClosed_measurable p).comp ((observedTimedProjection_measurable cfg).comp measurable_fst)).not).and
    (Measurable.exists (fun q => measurable_const.and ((measurable_const.lt ha).and (measurable_const.lt (hm q)))))

end BirthWitness
end NoThreeLine
#print axioms NoThreeLine.continuous_positive_exceedance_rat
#print axioms NoThreeLine.BirthWitness.lineSectionContinuousExceedance_measurable
