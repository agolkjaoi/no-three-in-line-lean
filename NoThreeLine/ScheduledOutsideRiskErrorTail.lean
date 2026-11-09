import NoThreeLine.ScheduledOutsideRiskErrorSmall
import NoThreeLine.ScheduledRootCreditLossTail

/-! Measurable actual outside-risk/proxy error events have uniformly
vanishing full-point probabilities at every positive log n threshold.
Only the proved pathwise credit-loss domination is used. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines

theorem scheduledOutsideRiskPath_measurable {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint) (p : Grid n) (J : ℕ) :
    Measurable (scheduledOutsideRiskPath cs ε M deadline start hn hB Γ p J) :=
  Finset.measurable_sum _ (fun L _ => Finset.measurable_sum _ (fun N _ =>
    variable_running_integral_measurable (fun _ => (cs N).horizon) measurable_const
      (fun _ => (cs N).horizon.coe_nonneg) _
      (scheduledOutsideLineRiskRate_measurable cs ε M deadline start hn hB L.val p N)))

theorem scheduledOutsideProxyPath_measurable {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint) (p : Grid n) (J : ℕ) :
    Measurable (scheduledOutsideProxyPath cs ε M deadline start hn hB Γ p J) :=
  Finset.measurable_sum _ (fun L _ => Finset.measurable_sum _ (fun N _ =>
    variable_running_integral_measurable (fun _ => (cs N).horizon) measurable_const
      (fun _ => (cs N).horizon.coe_nonneg) _
      (scheduledOutsideLineProxyRate_measurable cs ε M deadline start hn hB L.val p N)))

theorem scheduledOutsideRiskError_measurableSet {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint) (p : Grid n) (J : ℕ) (a : ℝ) :
    MeasurableSet {ω | a ≤ scheduledOutsideRiskPath cs ε M deadline start hn hB Γ p J ω -
      scheduledOutsideProxyPath cs ε M deadline start hn hB Γ p J ω} :=
  measurableSet_le measurable_const ((scheduledOutsideRiskPath_measurable cs ε M deadline start hn hB Γ p J).sub
    (scheduledOutsideProxyPath_measurable cs ε M deadline start hn hB Γ p J))

theorem scheduledOutsideRiskError_tail_le_creditLoss {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start ρ : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (hρ : 0 < ρ) (Γ : Finset ZPoint)
    (hΓ : ∀ j, (cs j).directions = Γ) (hK : ∀ j, (cs j).K < 2)
    (hρcfg : ∀ j, ρ ≤ (cs j).rho) (p : Grid n) (J : ℕ) (a : ℝ) :
    (phasePointMeasure cs ε M deadline start hn hB p J).real
      {ω | a ≤ scheduledOutsideRiskPath cs ε M deadline start hn hB Γ p J ω -
        scheduledOutsideProxyPath cs ε M deadline start hn hB Γ p J ω} ≤
    (phasePointMeasure cs ε M deadline start hn hB p J).real
      {ω | ρ*a ≤ scheduledRootCreditLossPath cs ε M deadline start hn hB Γ p J ω} := by
  let μ := phasePointMeasure cs ε M deadline start hn hB p J
  letI : IsProbabilityMeasure μ := phasePointMeasure_probability cs ε M deadline start hn hB p J
  apply measureReal_mono (μ := μ)
  intro ω hω
  have h := (le_div_iff₀ hρ).mp (hω.trans
    (scheduledOutsideRiskPath_proxy_error cs ε M deadline start ρ hn hB hρ Γ hΓ hK hρcfg p J ω).2)
  simpa only [Set.mem_setOf_eq,mul_comm] using h

theorem scheduledOutsideRiskError_tail_le_mean {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start ρ : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (hρ : 0 < ρ) (Γ : Finset ZPoint)
    (hΓ : ∀ j, (cs j).directions = Γ) (hK : ∀ j, (cs j).K < 2)
    (hρcfg : ∀ j, ρ ≤ (cs j).rho) (p : Grid n) (J : ℕ) (a : ℝ) (ha : 0 < a) :
    (phasePointMeasure cs ε M deadline start hn hB p J).real
      {ω | a ≤ scheduledOutsideRiskPath cs ε M deadline start hn hB Γ p J ω -
        scheduledOutsideProxyPath cs ε M deadline start hn hB Γ p J ω} ≤
    (∫ ω, scheduledOutsideRiskPath cs ε M deadline start hn hB Γ p J ω -
      scheduledOutsideProxyPath cs ε M deadline start hn hB Γ p J ω
      ∂phasePointMeasure cs ε M deadline start hn hB p J)/a := by
  let μ := phasePointMeasure cs ε M deadline start hn hB p J
  letI : IsProbabilityMeasure μ := phasePointMeasure_probability cs ε M deadline start hn hB p J
  have hi := (scheduledOutsideRiskPath_integrable cs ε M deadline start hn hB Γ p J μ).sub
    (scheduledOutsideProxyPath_integrable cs ε M deadline start hn hB Γ p J μ)
  have hm := mul_meas_ge_le_integral_of_nonneg (Filter.Eventually.of_forall
    (fun ω => (scheduledOutsideRiskPath_proxy_error cs ε M deadline start ρ hn hB hρ Γ hΓ hK hρcfg p J ω).1)) hi a
  apply (le_div_iff₀ ha).mpr
  simpa only [mul_comm] using hm

theorem exists_uniform_outsideRiskError_tail_threshold (T δ ζ ρ a κ : ℝ)
    (hδ : δ < 1) (hζ : 0 < ζ) (hρ : 0 < ρ) (ha : 0 < a) (hκ : 0 < κ) :
    ∃ N : ℕ, 2 ≤ N ∧ ∀ n : ℕ, N ≤ n →
      ∀ (B : ℝ) (cs : ℕ → SharedPhase n B) (M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
        (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint) (p : Grid n) (J : ℕ),
        (∀ j, (cs j).directions=Γ) → (∀ j, (cs j).K < 2) → (∀ j, ρ ≤ (cs j).rho) →
        phaseEndpoint cs 0 J ≤ T → B ≤ (n : ℝ)^δ →
        (phasePointMeasure cs ((n : ℝ)^(-ζ)) M deadline start hn hB p J).real
          {ω | a*Real.log (n : ℝ) ≤ scheduledOutsideRiskPath cs ((n : ℝ)^(-ζ)) M deadline start hn hB Γ p J ω -
            scheduledOutsideProxyPath cs ((n : ℝ)^(-ζ)) M deadline start hn hB Γ p J ω} < κ := by
  obtain ⟨N,hN,h⟩ := exists_uniform_rootCreditLoss_tail_threshold T δ ζ (ρ*a) κ hδ hζ (mul_pos hρ ha) hκ
  refine ⟨N,hN,?_⟩
  intro n hNn B cs M deadline start hn hB Γ p J hΓ hK hρcfg hT hBn
  apply (scheduledOutsideRiskError_tail_le_creditLoss cs ((n : ℝ)^(-ζ)) M deadline start ρ hn hB hρ
    Γ hΓ hK hρcfg p J (a*Real.log (n : ℝ))).trans_lt
  simpa only [mul_assoc] using h n hNn B cs M deadline start hn hB Γ p J hΓ hK hT hBn

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.scheduledOutsideRiskError_measurableSet
#print axioms NoThreeLine.BirthWitness.scheduledOutsideRiskError_tail_le_mean
#print axioms NoThreeLine.BirthWitness.exists_uniform_outsideRiskError_tail_threshold
