import NoThreeLine.ScheduledSamePhaseLineMass
import NoThreeLine.ScheduledCutLineCreditRegularity
import NoThreeLine.ScheduledCreditMassPath

/-! Substitute the actual past physical credit-decay rate in the full-point
two-time line-mass comparison. The right side is the previously controlled
same-time active-root decay-times-mass observable, including the self rate. -/
set_option autoImplicit false
set_option maxHeartbeats 1000000
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines

def observedLineCreditRate {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n)
    (v : TimedObservation cfg) : ℝ :=
  physicalLineCreditRate cfg.directions cfg.mask L v.1.val.1.physical

theorem observedLineCreditRate_measurable {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n) :
    Measurable (observedLineCreditRate cfg L) :=
  (physicalLineCreditRate_measurable cfg.directions cfg.mask L).comp
    ((AugmentedState.measurable_physical n).comp (measurable_subtype_coe.comp measurable_fst).fst)

theorem observedLineCreditRate_bounds {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n)
    (hB : 0 < cfg.B) (hm : ∀ q, cfg.mask q ≤ 1) (v : TimedObservation cfg) :
    0 ≤ observedLineCreditRate cfg L v ∧ observedLineCreditRate cfg L v ≤ (L.val.card : ℝ)*(cfg.B/n) :=
  physicalLineCreditRate_bounds cfg.directions cfg.mask L _ cfg.B hB
    (fun q => ⟨cfg.mask_nonneg q,hm q⟩) v.1.property.1.1

theorem activeRootLineMass_mul_rate {n : ℕ} (Γ : Finset ZPoint) (mask : Grid n → ℝ)
    (L : LineIndex n) (p : Grid n) (a : WitnessState n) :
    activeRootLineMass L p a * physicalLineCreditRate Γ mask L a.augmented.physical =
      activeLineCreditMass Γ mask L p a := by
  unfold activeRootLineMass activeLineCreditMass
  split_ifs <;> simp [mul_comm]

theorem observedActiveLineMass_mul_rate {n : ℕ} (cfg : FlowConfig n)
    (L : LineIndex n) (p : Grid n) (v : TimedObservation cfg) :
    observedActiveLineMass cfg L p v * observedLineCreditRate cfg L v =
      activeLineCreditMass cfg.directions cfg.mask L p (observedWitness cfg (unitBirthRetention n) v) :=
  activeRootLineMass_mul_rate cfg.directions cfg.mask L p _

theorem scheduled_same_phase_creditMass_le_ae_times {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (j k : ℕ) (hK : (cs j).config.K < 2)
    (L : LineIndex n) (hL : ¬specified (cs j).directions L) (p : Grid n) (hpL : p ∈ L.val)
    (hε0 : 0 ≤ ε) (hε : ε < 1) :
    ∀ᵐ v : ℝ ∂volume, ∀ᵐ u : ℝ ∂volume, v ∈ Ioo 0 ((cs j).horizon : ℝ) → u ∈ Ioo 0 v →
    (∫ ω, observedActiveLineMass (cs j).config L p
        (scheduledCutObservation cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) j (ω,v))*
      scheduledCutLineCreditRate cs ε M deadline start L hn
        (initialGoodPhaseObservation B hB deadline start) j (ω,u)
      ∂phasePointMeasure cs ε M deadline start hn hB p (j+1+k)) ≤
    (∫ ω, activeLineCreditMass (cs j).directions (cs j).mask L p
        (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
          (initialGoodPhaseObservation B hB deadline start) j (ω,u))
      ∂phasePointMeasure cs ε M deadline start hn hB p (j+1+k))/(1-ε) := by
  have hh := scheduled_same_phase_lineMass_le_ae_times cs ε M deadline start hn hB j k hK L hL p hpL hε0 hε
    (fun _ => observedLineCreditRate (cs j).config L)
    (fun _ => observedLineCreditRate_measurable (cs j).config L) ((L.val.card : ℝ)*(B/n))
    (fun _ => observedLineCreditRate_bounds (cs j).config L (zero_lt_one.trans_le hB) (cs j).mask_le_one)
  filter_upwards [hh] with v hv
  filter_upwards [hv] with u hu hvI huI
  have h := hu hvI huI
  simp_rw [observedActiveLineMass_mul_rate] at h
  exact h

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.observedActiveLineMass_mul_rate
#print axioms NoThreeLine.BirthWitness.scheduled_same_phase_creditMass_le_ae_times
