import NoThreeLine.PhaseOutsideRiskIntegral
import NoThreeLine.ScheduledCutBirthMean
import NoThreeLine.ScheduledOutsideRiskPath
import NoThreeLine.ScheduledWeightGrowth
import NoThreeLine.PhasePointHistory

/-! Identify the accumulated selected-flow outside hazard with the existing
actual scheduled cut risk, on the same original board and deadlines. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines

theorem scheduledPhaseOutsideRiskCost_eq_integral_ae {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 0 < B) (p : Grid n) (s : GoodPhaseObservation n B) (N : ℕ) :
    ∀ᵐ ω ∂boardClockMeasure n (B/n),
      terminalOutsideRiskCost (cs N).config ε M hn p
        (augPhaseStart (cs N).config ε M (recycledPhaseState cs ε M deadline start hn s.val.1 N ω))
        (recycledPhases cs ε M deadline start hn s.val.1 N ω).2 =
      ∫ t in (0 : ℝ)..(cs N).horizon, physicalOutsideRisk (cs N).directions (cs N).mask p
        (scheduledCutObservation cs ε M deadline start hn s N (ω,t)).1.val.1.physical := by
  let ν := boardClockMeasure n (B/n)
  let μ := goodPhaseStateLaw cs ε M deadline start hn s N
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  letI : IsProbabilityMeasure μ := goodPhaseStateLaw_probability cs ε M deadline start hn hB s N
  have hh := phaseOutsideRiskCost_eq_integral_prod_ae (cs N).config ε M (phaseEndpoint cs start N)
    p hn hB (cs N).mask_le_one μ
  have he : ν.map (goodPhases cs ε M deadline start hn s N) = μ.prod ν :=
    goodPhases_residual_product cs ε M deadline start hn hB s N
  rw [←he] at hh
  have hh' := ae_of_ae_map (goodPhases_measurable cs ε M deadline start hn s N).aemeasurable hh
  filter_upwards [hh'] with ω hω
  have hp := goodPhases_birth_projection cs ε M deadline start hn s N ω
  unfold phaseOutsideRiskCost at hω
  rw [congrArg Prod.fst hp,congrArg Prod.snd hp] at hω
  exact hω

theorem initial_scheduledOutsideRiskCost_sum_eq_path_ae {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint) (hΓ : ∀ j, (cs j).directions = Γ)
    (p : Grid n) (J : ℕ) :
    ∀ᵐ ω ∂boardClockMeasure n (B/n),
      (∑ N ∈ Finset.range J, terminalOutsideRiskCost (cs N).config ε M hn p
        (augPhaseStart (cs N).config ε M (recycledPhaseState cs ε M deadline start hn
          (augInitialState B hB deadline start) N ω))
        (recycledPhases cs ε M deadline start hn (augInitialState B hB deadline start) N ω).2) =
      scheduledOutsideRiskPath cs ε M deadline start hn hB Γ p J ω := by
  have ha := ae_all_iff.mpr (fun N => scheduledPhaseOutsideRiskCost_eq_integral_ae cs ε M deadline start hn
    (zero_lt_one.trans_le hB) p (initialGoodPhaseObservation B hB deadline start) N)
  filter_upwards [ha] with ω hω
  have heinit : (initialGoodPhaseObservation B hB deadline start).val.1 =
      augInitialState B hB deadline start := rfl
  rw [heinit] at hω
  rw [scheduledOutsideRiskPath_eq_S1]
  apply Finset.sum_congr rfl
  intro N _
  rw [hω N]
  apply intervalIntegral.integral_congr
  intro t _
  rw [hΓ N]
  exact physicalOutsideRisk_eq_S1 Γ (cs N).mask p _
    (scheduledCutObservation cs ε M deadline start hn
      (initialGoodPhaseObservation B hB deadline start) N (ω,t)).1.property.1.1.1

theorem initial_scheduledOutsideRiskCost_eq_path_ae {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint) (hΓ : ∀ j, (cs j).directions = Γ)
    (p : Grid n) (J : ℕ) :
    ∀ᵐ ω ∂boardClockMeasure n (B/n),
      scheduledOutsideRiskCost cs ε M deadline start hn p (augInitialState B hB deadline start) J ω =
        scheduledOutsideRiskPath cs ε M deadline start hn hB Γ p J ω :=
  initial_scheduledOutsideRiskCost_sum_eq_path_ae cs ε M deadline start hn hB Γ hΓ p J

theorem initial_scheduledOutsideRiskCost_eq_path_point_ae {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint) (hΓ : ∀ j, (cs j).directions = Γ)
    (p q : Grid n) (J H : ℕ) :
    ∀ᵐ ω ∂phasePointMeasure cs ε M deadline start hn hB q H,
      scheduledOutsideRiskCost cs ε M deadline start hn p (augInitialState B hB deadline start) J ω =
        scheduledOutsideRiskPath cs ε M deadline start hn hB Γ p J ω :=
  (phasePointMeasure_absolutelyContinuous cs ε M deadline start hn hB q H).ae_le
    (initial_scheduledOutsideRiskCost_eq_path_ae cs ε M deadline start hn hB Γ hΓ p J)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.scheduledPhaseOutsideRiskCost_eq_integral_ae
#print axioms NoThreeLine.BirthWitness.initial_scheduledOutsideRiskCost_sum_eq_path_ae
#print axioms NoThreeLine.BirthWitness.initial_scheduledOutsideRiskCost_eq_path_point_ae
