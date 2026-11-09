import NoThreeLine.PhasePairIntegral
import NoThreeLine.ScheduledEtaCost
import NoThreeLine.ScheduledCutBirthMean
import NoThreeLine.ScheduledPairHistoryMoment

/-! Actual accumulated pair cost and C2's cut rate use the same original
board, phase observations, residuals, masks and absolute deadlines. -/
set_option autoImplicit false
set_option maxHeartbeats 1000000
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PairWitness

theorem scheduledPhasePairCost_eq_integral_ae {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 0 < B) (a b : Grid n) (s : GoodPhaseObservation n B) (N : ℕ) :
    ∀ᵐ ω ∂boardClockMeasure n (B/n),
      terminalPairCost (cs N).config ε M hn a b
        (augPhaseStart (cs N).config ε M (recycledPhaseState cs ε M deadline start hn s.val.1 N ω))
        (recycledPhases cs ε M deadline start hn s.val.1 N ω).2 =
      ∫ t in (0 : ℝ)..(cs N).horizon, physicalPairRate (cs N).directions (cs N).mask a b
        (scheduledCutObservation cs ε M deadline start hn s N (ω,t)).1.val.1.physical := by
  let ν := boardClockMeasure n (B/n)
  let μ := goodPhaseStateLaw cs ε M deadline start hn s N
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  letI : IsProbabilityMeasure μ := goodPhaseStateLaw_probability cs ε M deadline start hn hB s N
  have hh := phasePairCost_eq_integral_prod_ae (cs N).config ε M (phaseEndpoint cs start N)
    a b hn hB (cs N).mask_le_one μ
  have he : ν.map (goodPhases cs ε M deadline start hn s N) = μ.prod ν :=
    goodPhases_residual_product cs ε M deadline start hn hB s N
  rw [←he] at hh
  have hh' := ae_of_ae_map (goodPhases_measurable cs ε M deadline start hn s N).aemeasurable hh
  filter_upwards [hh'] with ω hω
  have hp := goodPhases_birth_projection cs ε M deadline start hn s N ω
  unfold phasePairCost at hω
  rw [congrArg Prod.fst hp,congrArg Prod.snd hp] at hω
  exact hω

def scheduledPairPath {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (a b : Grid n) (J : ℕ) (ω : BoardClockPath n) : ℝ :=
  ∑N∈Finset.range J, ∫t in (0:ℝ)..(cs N).horizon,
    initialCutPairRate cs ε M deadline start hn hB N t a b ω

theorem initial_scheduledPairCost_eq_path_ae {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (a b : Grid n) (J : ℕ) :
    ∀ᵐ ω ∂boardClockMeasure n (B/n),
      scheduledPairCost cs ε M deadline start hn a b (augInitialState B hB deadline start) J ω=
        scheduledPairPath cs ε M deadline start hn hB a b J ω := by
  have ha := ae_all_iff.mpr (fun N=>scheduledPhasePairCost_eq_integral_ae cs ε M deadline start hn
    (zero_lt_one.trans_le hB) a b (initialGoodPhaseObservation B hB deadline start) N)
  filter_upwards [ha] with ω hω
  have heinit : (initialGoodPhaseObservation B hB deadline start).val.1=
      augInitialState B hB deadline start := rfl
  rw [heinit] at hω
  apply Finset.sum_congr rfl
  intro N _
  rw [hω N]
  rfl

theorem initial_eta_cause_path_ae {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (p : Grid n) (J : ℕ) :
    ∀ᵐ ω ∂boardClockMeasure n (B/n),
      ω∈scheduledBoundaryCauseBefore cs ε M deadline start hn
        (augInitialState B hB deadline start) p .eta J →
      ∃a b : Grid n, a≠b ∧ ε≤scheduledPairPath cs ε M deadline start hn hB a b J ω := by
  have he := ae_all_iff.mpr (fun a=>ae_all_iff.mpr (fun b=>
    initial_scheduledPairCost_eq_path_ae cs ε M deadline start hn hB a b J))
  filter_upwards [he] with ω hω hh
  obtain ⟨a,b,hab,hc⟩ := initial_eta_cause_cost cs ε M deadline start hn hB p J ω hh
  exact ⟨a,b,hab,(hω a b) ▸ hc⟩

theorem initialCutPairRate_joint_measurable {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (a b : Grid n) (N : ℕ) :
    Measurable (fun x : BoardClockPath n×ℝ=>initialCutPairRate cs ε M deadline start hn hB N x.2 a b x.1) :=
  (physicalPairRate_measurable (cs N).directions (cs N).mask a b).comp
    ((AugmentedState.measurable_physical n).comp
      (measurable_subtype_coe.comp
        (scheduledCutObservation_measurable cs ε M deadline start hn
          (initialGoodPhaseObservation B hB deadline start) N).fst).fst)

theorem initialCutPairRate_bounds {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (a b : Grid n) (N : ℕ) (t : ℝ) (ω : BoardClockPath n) :
    0 ≤ initialCutPairRate cs ε M deadline start hn hB N t a b ω ∧
      initialCutPairRate cs ε M deadline start hn hB N t a b ω ≤ pairRateCap n B :=
  state_pairRate_bounds (cs N).directions (cs N).mask (fun q=>⟨(cs N).mask_nonneg q,(cs N).mask_le_one q⟩) a b _ B
    (zero_lt_one.trans_le hB)
    (scheduledCutWitness_valid cs ε M deadline start (unitBirthRetention n) hn
      (initialGoodPhaseObservation B hB deadline start) N (ω,t)).1.1

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.initial_scheduledPairCost_eq_path_ae
#print axioms NoThreeLine.BirthWitness.initial_eta_cause_path_ae
#print axioms NoThreeLine.BirthWitness.initialCutPairRate_bounds

