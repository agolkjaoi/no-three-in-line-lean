import NoThreeLine.ScheduledRawWeightHit
import NoThreeLine.OutsideRiskCostTerminal
import NoThreeLine.ScheduledWeightCompletion
import NoThreeLine.ScheduledOutsideRiskIntegral

/-! An actual raw weight-cap event is contained, almost surely on the
same original board and each saved point law, in the actual risk tail. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines

theorem initial_scheduledRawWeightCap_requires_risk_ae {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M K ρ T : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (hΓ : ∀j,(cs j).directions=Γ)
    (hKcfg : ∀j,(cs j).K≤K) (hρcfg : ∀j,ρ≤(cs j).rho) (hK0 : 0≤K) (hK : K<2)
    (p : Grid n) (J : ℕ) (hT : phaseEndpoint cs 0 J≤T) :
    ∀ᵐω∂boardClockMeasure n (B/n),
      ω∈scheduledRawWeightCapBefore cs ε M deadline start hn (augInitialState B hB deadline start) p J →
      Real.log B-(B/n)*T-(Γ.card*K)/(2-K)≤
        scheduledOutsideRiskPath cs ε M deadline start hn hB Γ p J ω := by
  filter_upwards [initial_scheduledUnobservedPhaseCompletion_all_ae cs ε M deadline start hn hB,
    initial_scheduledOutsideRiskCost_eq_path_ae cs ε M deadline start hn hB Γ hΓ p J] with ω hc he
  intro hh
  obtain ⟨j,hj,k,hd,hp,hcap⟩ := hh
  let e := augInitialState B hB deadline start
  let ej := recycledPhaseState cs ε M deadline start hn e j ω
  let ωj := (recycledPhases cs ε M deadline start hn e j ω).2
  let sj := augPhaseStart (cs j).config ε M ej
  have hb : 0<B := zero_lt_one.trans_le hB
  have hraw := initial_scheduled_raw_weight_cap_requires_risk cs ε M K ρ deadline start hn hB
    Γ hΓ hKcfg hρcfg hK0 hK p j k ω (fun h=>hd ((birthDone_iff _ _).mp h)) hp hcap
  have hcost : scheduledOutsideRiskCost cs ε M deadline start hn p e j ω+
      recycledOutsideRiskCost (cs j).config ε M hn p sj (k+1) ωj≤
      scheduledOutsideRiskCost cs ε M deadline start hn p e J ω := by
    calc
      _ ≤ scheduledOutsideRiskCost cs ε M deadline start hn p e j ω+
          terminalOutsideRiskCost (cs j).config ε M hn p sj ωj :=
        add_le_add le_rfl (recycledOutsideRiskCost_le_terminal (cs j).config ε M hn p hb
          (cs j).mask_le_one sj ωj (hc j) (k+1))
      _ = scheduledOutsideRiskCost cs ε M deadline start hn p e (j+1) ω := (Finset.sum_range_succ _ j).symm
      _ ≤ scheduledOutsideRiskCost cs ε M deadline start hn p e J ω :=
        scheduledOutsideRiskCost_monotone cs ε M deadline start hn hb p e ω (Nat.succ_le_of_lt hj)
  have ht := mul_le_mul_of_nonneg_left
    ((phaseEndpoint_mono cs 0 (Nat.succ_le_of_lt hj)).trans hT) (div_nonneg hb.le (Nat.cast_nonneg n))
  rw [←he]
  change Real.log B-(B/n)*phaseEndpoint cs 0 (j+1)-(Γ.card*K)/(2-K)≤
    scheduledOutsideRiskCost cs ε M deadline start hn p e j ω+
      recycledOutsideRiskCost (cs j).config ε M hn p sj (k+1) ωj at hraw
  change Real.log B-(B/n)*T-(Γ.card*K)/(2-K)≤scheduledOutsideRiskCost cs ε M deadline start hn p e J ω
  linarith

theorem initial_scheduledRawWeightCap_point_measure_le {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M K ρ T : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (hΓ : ∀j,(cs j).directions=Γ)
    (hKcfg : ∀j,(cs j).K≤K) (hρcfg : ∀j,ρ≤(cs j).rho) (hK0 : 0≤K) (hK : K<2)
    (p q : Grid n) (J H : ℕ) (hT : phaseEndpoint cs 0 J≤T) (a : ℝ)
    (ha : a≤Real.log B-(B/n)*T-(Γ.card*K)/(2-K)) :
    (phasePointMeasure cs ε M deadline start hn hB q H).real
      (scheduledRawWeightCapBefore cs ε M deadline start hn (augInitialState B hB deadline start) p J)≤
    (phasePointMeasure cs ε M deadline start hn hB q H).real
      {ω | a≤scheduledOutsideRiskPath cs ε M deadline start hn hB Γ p J ω} := by
  letI := phasePointMeasure_probability cs ε M deadline start hn hB q H
  have hac : phasePointMeasure cs ε M deadline start hn hB q H≪boardClockMeasure n (B/n) :=
    phasePointMeasure_absolutelyContinuous cs ε M deadline start hn hB q H
  have hh : ∀ᵐω∂phasePointMeasure cs ε M deadline start hn hB q H,
      ω∈scheduledRawWeightCapBefore cs ε M deadline start hn (augInitialState B hB deadline start) p J →
      Real.log B-(B/n)*T-(Γ.card*K)/(2-K)≤
        scheduledOutsideRiskPath cs ε M deadline start hn hB Γ p J ω := hac.ae_le
    (initial_scheduledRawWeightCap_requires_risk_ae cs ε M K ρ T deadline start hn hB Γ hΓ hKcfg hρcfg hK0 hK p J hT)
  have hsub : ∀ᵐω∂phasePointMeasure cs ε M deadline start hn hB q H,
      ω∈scheduledRawWeightCapBefore cs ε M deadline start hn (augInitialState B hB deadline start) p J →
      ω∈{ω | a≤scheduledOutsideRiskPath cs ε M deadline start hn hB Γ p J ω} :=
    hh.mono (fun _ h hh=>ha.trans (h hh))
  exact ENNReal.toReal_mono (measure_ne_top _ _) (measure_mono_ae hsub)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.initial_scheduledRawWeightCap_requires_risk_ae
#print axioms NoThreeLine.BirthWitness.initial_scheduledRawWeightCap_point_measure_le
