import NoThreeLine.ScheduledOutsideRiskPath

/-! The actual S1 outside-hazard path differs from its actual line-credit
weighted proxy by a nonnegative additive error uniformly o(log n).
The original stopped birth rates, active-root and occupancy gates remain. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines FiniteDirections

theorem scheduledOutsideRiskError_terminal_bound {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start ρ : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (hρ : 0 < ρ) (Γ : Finset ZPoint)
    (hΓ : ∀ j, (cs j).directions = Γ) (hK : ∀ j, (cs j).K < 2)
    (hρcfg : ∀ j, ρ ≤ (cs j).rho) (p : Grid n) (J : ℕ) (hε0 : 0 ≤ ε) (hε : ε < 1) :
    0 ≤ (∫ ω, scheduledOutsideRiskPath cs ε M deadline start hn hB Γ p J ω -
      scheduledOutsideProxyPath cs ε M deadline start hn hB Γ p J ω
      ∂phasePointMeasure cs ε M deadline start hn hB p J) ∧
    (∫ ω, scheduledOutsideRiskPath cs ε M deadline start hn hB Γ p J ω -
      scheduledOutsideProxyPath cs ε M deadline start hn hB Γ p J ω
      ∂phasePointMeasure cs ε M deadline start hn hB p J) ≤
      ((2*(phaseEndpoint cs 0 J)^3/(1-ε)^7)*rootBoardLineErrorBudget p B)/ρ := by
  let μ := phasePointMeasure cs ε M deadline start hn hB p J
  letI : IsProbabilityMeasure μ := phasePointMeasure_probability cs ε M deadline start hn hB p J
  have hh := scheduledOutsideRiskPath_proxy_integral_error cs ε M deadline start ρ hn hB hρ Γ hΓ hK hρcfg p J μ
  exact ⟨hh.1,hh.2.trans (div_le_div_of_nonneg_right
    (scheduledRootCreditLossPath_terminal_bound cs ε M deadline start hn hB Γ hΓ hK p J hε0 hε).2 hρ.le)⟩

theorem exists_uniform_outsideRiskError_mean_threshold (T δ ζ ρ κ : ℝ)
    (hδ : δ < 1) (hζ : 0 < ζ) (hρ : 0 < ρ) (hκ : 0 < κ) :
    ∃ N : ℕ, 2 ≤ N ∧ ∀ n : ℕ, N ≤ n →
      ∀ (B : ℝ) (cs : ℕ → SharedPhase n B) (M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
        (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint) (p : Grid n) (J : ℕ),
        (∀ j, (cs j).directions=Γ) → (∀ j, (cs j).K < 2) → (∀ j, ρ ≤ (cs j).rho) →
        phaseEndpoint cs 0 J ≤ T → B ≤ (n : ℝ)^δ →
        (∫ ω, scheduledOutsideRiskPath cs ((n : ℝ)^(-ζ)) M deadline start hn hB Γ p J ω -
          scheduledOutsideProxyPath cs ((n : ℝ)^(-ζ)) M deadline start hn hB Γ p J ω
          ∂phasePointMeasure cs ((n : ℝ)^(-ζ)) M deadline start hn hB p J)/Real.log (n : ℝ) < κ := by
  obtain ⟨N,hN,h⟩ := exists_uniform_rootCreditLoss_threshold T δ ζ (ρ*κ) hδ hζ (mul_pos hρ hκ)
  refine ⟨N,hN,?_⟩
  intro n hNn B cs M deadline start hn hB Γ p J hΓ hK hρcfg hT hBn
  let μ := phasePointMeasure cs ((n : ℝ)^(-ζ)) M deadline start hn hB p J
  letI : IsProbabilityMeasure μ := phasePointMeasure_probability cs _ M deadline start hn hB p J
  have hb := (scheduledOutsideRiskPath_proxy_integral_error cs ((n : ℝ)^(-ζ)) M deadline start ρ hn hB hρ
    Γ hΓ hK hρcfg p J μ).2
  have he := h n hNn B cs M deadline start hn hB Γ p J hΓ hK hT hBn
  have hlog := FiniteWitnessMoments.log_nat_pos (hN.trans hNn)
  calc
    _ ≤ ((∫ ω, scheduledRootCreditLossPath cs ((n : ℝ)^(-ζ)) M deadline start hn hB Γ p J ω ∂μ)/ρ)/Real.log (n : ℝ) :=
      div_le_div_of_nonneg_right hb hlog.le
    _ = ((∫ ω, scheduledRootCreditLossPath cs ((n : ℝ)^(-ζ)) M deadline start hn hB Γ p J ω ∂μ)/Real.log (n : ℝ))/ρ := by ring
    _ < (ρ*κ)/ρ := div_lt_div_of_pos_right he hρ
    _ = κ := by field_simp

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.scheduledOutsideRiskError_terminal_bound
#print axioms NoThreeLine.BirthWitness.exists_uniform_outsideRiskError_mean_threshold
