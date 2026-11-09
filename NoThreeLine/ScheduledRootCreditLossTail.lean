import NoThreeLine.ScheduledRootCreditLoss

/-! Markov control of the actual all-phase credit-loss path under its
full terminal point probability. The uniform small expectation supplies
uniform vanishing probabilities at every fixed positive log n threshold. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines FiniteDirections FiniteWitnessMoments

theorem scheduledRootCreditLoss_tail_le_mean {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint) (hΓ : ∀ j, (cs j).directions = Γ)
    (p : Grid n) (J : ℕ) (a : ℝ) (ha : 0 < a) :
    (phasePointMeasure cs ε M deadline start hn hB p J).real
      {ω | a ≤ scheduledRootCreditLossPath cs ε M deadline start hn hB Γ p J ω} ≤
    (∫ ω, scheduledRootCreditLossPath cs ε M deadline start hn hB Γ p J ω
      ∂phasePointMeasure cs ε M deadline start hn hB p J)/a := by
  let μ := phasePointMeasure cs ε M deadline start hn hB p J
  letI : IsProbabilityMeasure μ := phasePointMeasure_probability cs ε M deadline start hn hB p J
  have hi := scheduledRootCreditLossPath_integrable cs ε M deadline start hn hB Γ hΓ p J μ
  have hm := mul_meas_ge_le_integral_of_nonneg
    (Filter.Eventually.of_forall (scheduledRootCreditLossPath_nonneg cs ε M deadline start hn hB Γ hΓ p J)) hi a
  apply (le_div_iff₀ ha).mpr
  simpa only [mul_comm] using hm

theorem scheduledRootCreditLoss_tail_bound {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint)
    (hΓ : ∀ j, (cs j).directions = Γ) (hK : ∀ j, (cs j).K < 2)
    (p : Grid n) (J : ℕ) (hε0 : 0 ≤ ε) (hε : ε < 1) (a : ℝ) (ha : 0 < a) :
    (phasePointMeasure cs ε M deadline start hn hB p J).real
      {ω | a ≤ scheduledRootCreditLossPath cs ε M deadline start hn hB Γ p J ω} ≤
      ((2*(phaseEndpoint cs 0 J)^3/(1-ε)^7)*rootBoardLineErrorBudget p B)/a :=
  (scheduledRootCreditLoss_tail_le_mean cs ε M deadline start hn hB Γ hΓ p J a ha).trans
    (div_le_div_of_nonneg_right
      (scheduledRootCreditLossPath_terminal_bound cs ε M deadline start hn hB Γ hΓ hK p J hε0 hε).2 ha.le)

theorem exists_uniform_rootCreditLoss_tail_threshold (T δ ζ a κ : ℝ)
    (hδ : δ < 1) (hζ : 0 < ζ) (ha : 0 < a) (hκ : 0 < κ) :
    ∃ N : ℕ, 2 ≤ N ∧ ∀ n : ℕ, N ≤ n →
      ∀ (B : ℝ) (cs : ℕ → SharedPhase n B) (M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
        (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint) (p : Grid n) (J : ℕ),
        (∀ j, (cs j).directions=Γ) → (∀ j, (cs j).K < 2) → phaseEndpoint cs 0 J ≤ T → B ≤ (n : ℝ)^δ →
        (phasePointMeasure cs ((n : ℝ)^(-ζ)) M deadline start hn hB p J).real
          {ω | a*Real.log (n : ℝ) ≤ scheduledRootCreditLossPath cs ((n : ℝ)^(-ζ)) M deadline start hn hB Γ p J ω} < κ := by
  obtain ⟨N,hN,h⟩ := exists_uniform_rootCreditLoss_threshold T δ ζ (a*κ) hδ hζ (mul_pos ha hκ)
  refine ⟨N,hN,?_⟩
  intro n hNn B cs M deadline start hn hB Γ p J hΓ hK hT hBn
  have hlog := log_nat_pos (hN.trans hNn)
  have he := h n hNn B cs M deadline start hn hB Γ p J hΓ hK hT hBn
  apply (scheduledRootCreditLoss_tail_le_mean cs ((n : ℝ)^(-ζ)) M deadline start hn hB Γ hΓ p J
    (a*Real.log (n : ℝ)) (mul_pos ha hlog)).trans_lt
  calc
    _ = ((∫ ω, scheduledRootCreditLossPath cs ((n : ℝ)^(-ζ)) M deadline start hn hB Γ p J ω
        ∂phasePointMeasure cs ((n : ℝ)^(-ζ)) M deadline start hn hB p J)/Real.log (n : ℝ))/a := by ring
    _ < (a*κ)/a := div_lt_div_of_pos_right he ha
    _ = κ := by field_simp

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.scheduledRootCreditLoss_tail_le_mean
#print axioms NoThreeLine.BirthWitness.exists_uniform_rootCreditLoss_tail_threshold
