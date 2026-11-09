import NoThreeLine.ScheduledRiskDeadlineMain
import NoThreeLine.ScheduledLongMainSaved

/-! Actual risk through the full physical schedule is bounded by saved
long witnesses, the deadline-prefix late star, and the explicit small
error, under that same full point law. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory

namespace NoThreeLine.BirthWitness
open PrimitiveLines FinitePhase ShortStars

theorem scheduledOutsideRiskPath_le_saved_main_error_ae {J n : ℕ}
    (s : Schedule J) (mask : Fin J→Grid n→ℝ)
    (hm : ∀j q,0≤mask j q ∧ mask j q≤1) (Γ : Finset ZPoint)
    (B K ρ ε M : ℝ) (deadline : Grid n→ℝ) (p : Grid n)
    (hn : 0<n) (hB : 1≤B) (hρ : 0<ρ) (hK : K<2)
    (k : ℕ) (hk : k≤J)
    (hp : deadline p≤(s.prefix k hk).total) (ℓ τ : ℝ) :
    let cs := scheduleSharedPhases s mask hm Γ B K ρ
    let e := longWitnessRetention (s.prefix k hk) (prefixMask hk mask)
      (prefixMask_bounds hk mask hm) Γ p (B*ℓ)
    let w := longWitnessWeight (s.prefix k hk) Γ p (B*ℓ)
    ∀ᵐω∂phasePointMeasure cs ε M deadline 0 hn hB p J,
      scheduledOutsideRiskPath cs ε M deadline 0 hn hB Γ p J ω≤
        witnessSum w (initialRootPhaseWitness cs ε M deadline 0 p hn hB e J ω)+
        scheduledStarCanonicalLatePath cs ε M deadline 0 hn hB Γ p (B*ℓ) τ k ω+
        scheduledRiskErrorPath cs ε M deadline 0 ρ hn hB Γ p k ℓ τ ω := by
  dsimp only
  let cs := scheduleSharedPhases s mask hm Γ B K ρ
  have hΓ : ∀j,(cs j).directions=Γ := scheduleSharedPhases_directions s mask hm Γ B K ρ
  have hKcs : ∀j,(cs j).K<2 := by
    intro j
    dsimp [cs,scheduleSharedPhases]
    split <;> exact hK
  have hρcs : ∀j,ρ≤(cs j).rho := by
    intro j
    dsimp [cs,scheduleSharedPhases]
    split <;> exact le_rfl
  have hp' : deadline p≤phaseEndpoint cs 0 k := by
    rw [scheduleSharedPhases_endpoint s mask hm Γ B K ρ k hk]
    exact hp
  filter_upwards [scheduledLongMain_prefix_le_saved_witness_point_ae s mask hm Γ B K ρ ε M
    deadline p hn hB k J hk hk (B*ℓ)] with ω hω
  exact (scheduledOutsideRiskPath_le_deadline_main_error cs ε M deadline 0 ρ hn hB hρ Γ hΓ
    hKcs hρcs p k J hk hp' ℓ τ ω).trans (add_le_add (add_le_add hω le_rfl) le_rfl)

theorem scheduledOutsideRiskPath_tail_le_saved_main_error {J n : ℕ}
    (s : Schedule J) (mask : Fin J→Grid n→ℝ)
    (hm : ∀j q,0≤mask j q ∧ mask j q≤1) (Γ : Finset ZPoint)
    (B K ρ ε M : ℝ) (deadline : Grid n→ℝ) (p : Grid n)
    (hn : 0<n) (hB : 1≤B) (hρ : 0<ρ) (hK : K<2)
    (k : ℕ) (hk : k≤J)
    (hp : deadline p≤(s.prefix k hk).total) (ℓ τ r a : ℝ) :
    let cs := scheduleSharedPhases s mask hm Γ B K ρ
    let e := longWitnessRetention (s.prefix k hk) (prefixMask hk mask)
      (prefixMask_bounds hk mask hm) Γ p (B*ℓ)
    let w := longWitnessWeight (s.prefix k hk) Γ p (B*ℓ)
    let μ := phasePointMeasure cs ε M deadline 0 hn hB p J
    μ.real {ω | r+a≤scheduledOutsideRiskPath cs ε M deadline 0 hn hB Γ p J ω}≤
      μ.real {ω | r≤witnessSum w (initialRootPhaseWitness cs ε M deadline 0 p hn hB e J ω)+
        scheduledStarCanonicalLatePath cs ε M deadline 0 hn hB Γ p (B*ℓ) τ k ω}+
      μ.real {ω | a≤scheduledRiskErrorPath cs ε M deadline 0 ρ hn hB Γ p k ℓ τ ω} := by
  dsimp only
  let cs := scheduleSharedPhases s mask hm Γ B K ρ
  let μ := phasePointMeasure cs ε M deadline 0 hn hB p J
  letI : IsProbabilityMeasure μ := phasePointMeasure_probability cs ε M deadline 0 hn hB p J
  let f := fun ω=>witnessSum (longWitnessWeight (s.prefix k hk) Γ p (B*ℓ))
    (initialRootPhaseWitness cs ε M deadline 0 p hn hB
      (longWitnessRetention (s.prefix k hk) (prefixMask hk mask)
        (prefixMask_bounds hk mask hm) Γ p (B*ℓ)) J ω)+
    scheduledStarCanonicalLatePath cs ε M deadline 0 hn hB Γ p (B*ℓ) τ k ω
  let g := scheduledRiskErrorPath cs ε M deadline 0 ρ hn hB Γ p k ℓ τ
  have hsub : ∀ᵐω∂μ, ω∈{ω | r+a≤scheduledOutsideRiskPath cs ε M deadline 0 hn hB Γ p J ω}→
      ω∈({ω | r≤f ω}∪{ω | a≤g ω}) := by
    filter_upwards [scheduledOutsideRiskPath_le_saved_main_error_ae s mask hm Γ B K ρ ε M
      deadline p hn hB hρ hK k hk hp ℓ τ] with ω hω
    change scheduledOutsideRiskPath cs ε M deadline 0 hn hB Γ p J ω≤f ω+g ω at hω
    change (r+a≤scheduledOutsideRiskPath cs ε M deadline 0 hn hB Γ p J ω) → (r≤f ω ∨ a≤g ω)
    intro he
    by_contra hh
    push_neg at hh
    linarith
  exact (ENNReal.toReal_mono (by finiteness) (measure_mono_ae hsub)).trans
    (measureReal_union_le {ω | r≤f ω} {ω | a≤g ω})

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.scheduledOutsideRiskPath_le_saved_main_error_ae
#print axioms NoThreeLine.BirthWitness.scheduledOutsideRiskPath_tail_le_saved_main_error
