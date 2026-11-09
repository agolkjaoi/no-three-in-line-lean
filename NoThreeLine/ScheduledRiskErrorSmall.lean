import NoThreeLine.ScheduledRiskMainError
import NoThreeLine.ScheduledStarEarlySmall
import NoThreeLine.ScheduledTerminalExcessSmall

/-! The three actual additive errors in the outside-risk decomposition
are uniformly small in L1 on one full-J point law. Accuracy is selected
before the board, schedule, root, phase count and deadlines. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory

namespace NoThreeLine.BirthWitness
open PrimitiveLines ShortStars FiniteWitnessMoments

theorem exists_uniform_scheduledRiskError_mean_threshold (T δ γ ζ ρ κ : ℝ)
    (hδ : δ<1) (hγ : γ<1) (hζ : 0<ζ) (hρ : 0<ρ) (hκ : 0<κ) :
    ∃N : ℕ,2≤N ∧ ∀n : ℕ,N≤n →
      ∀(B : ℝ) (cs : ℕ→SharedPhase n B) (M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
        (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (p : Grid n) (J : ℕ),
        (∀j,(cs j).directions=Γ) → (∀j,(cs j).K<2) → phaseEndpoint cs 0 J≤T → B≤(n:ℝ)^δ →
        (∫ω,scheduledRiskErrorPath cs ((n:ℝ)^(-ζ)) M deadline start ρ hn hB Γ p J
          (Real.log n) ((n:ℝ)^(γ-1)) ω
          ∂phasePointMeasure cs ((n:ℝ)^(-ζ)) M deadline start hn hB p J)/Real.log n<κ := by
  have hk3 : 0<κ/3 := by positivity
  obtain ⟨N1,hN1,h1⟩ := exists_uniform_earlyStar_mean_threshold γ ζ (κ/3) hγ hζ hk3
  obtain ⟨N2,hN2,h2⟩ := exists_uniform_terminalLongExcess_threshold T ζ (κ/3) hζ hk3
  obtain ⟨N3,hN3,h3⟩ := exists_uniform_rootCreditLoss_threshold T δ ζ (ρ*(κ/3)) hδ hζ (mul_pos hρ hk3)
  refine ⟨max (max N1 N2) N3,hN3.trans (le_max_right _ _),?_⟩
  intro n hNn B cs M deadline start hn hB Γ p J hΓ hK hT hBn
  have h1n : N1≤n := (le_max_left _ _).trans ((le_max_left _ _).trans hNn)
  have h2n : N2≤n := (le_max_right _ _).trans ((le_max_left _ _).trans hNn)
  have h3n : N3≤n := (le_max_right _ _).trans hNn
  have he := h1 n h1n B cs M deadline start hn hB Γ p (B*Real.log n) J hΓ hK
  have hl := h2 n h2n B cs M deadline start hn hB Γ p J hΓ hK hT
  have hc := h3 n h3n B cs M deadline start hn hB Γ p J hΓ hK hT hBn
  let μ := phasePointMeasure cs ((n:ℝ)^(-ζ)) M deadline start hn hB p J
  letI : IsProbabilityMeasure μ := phasePointMeasure_probability cs ((n:ℝ)^(-ζ)) M deadline start hn hB p J
  have hc' : ((∫ω,scheduledRootCreditLossPath cs ((n:ℝ)^(-ζ)) M deadline start hn hB Γ p J ω ∂μ)/ρ)/
      Real.log n<κ/3 := by
    calc
      _ = ((∫ω,scheduledRootCreditLossPath cs ((n:ℝ)^(-ζ)) M deadline start hn hB Γ p J ω ∂μ)/Real.log n)/ρ := by ring
      _ < (ρ*(κ/3))/ρ := div_lt_div_of_pos_right hc hρ
      _ = κ/3 := by field_simp
  rw [scheduledRiskErrorPath_integral cs _ M deadline start ρ hn hB Γ hΓ p J _ _ μ]
  simp only [add_div]
  linarith

theorem scheduledRiskErrorPath_tail_le_mean {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start ρ : ℝ)
    (hn : 0<n) (hB : 1≤B) (hρ : 0≤ρ) (Γ : Finset ZPoint) (hΓ : ∀j,(cs j).directions=Γ)
    (p : Grid n) (J : ℕ) (ℓ τ a : ℝ) (ha : 0<a) :
    (phasePointMeasure cs ε M deadline start hn hB p J).real
      {ω | a≤scheduledRiskErrorPath cs ε M deadline start ρ hn hB Γ p J ℓ τ ω}≤
    (∫ω,scheduledRiskErrorPath cs ε M deadline start ρ hn hB Γ p J ℓ τ ω
      ∂phasePointMeasure cs ε M deadline start hn hB p J)/a := by
  let μ := phasePointMeasure cs ε M deadline start hn hB p J
  letI : IsProbabilityMeasure μ := phasePointMeasure_probability cs ε M deadline start hn hB p J
  have hh := mul_meas_ge_le_integral_of_nonneg
    (Filter.Eventually.of_forall (scheduledRiskErrorPath_nonneg cs ε M deadline start ρ hn hB hρ Γ hΓ p J ℓ τ))
    (scheduledRiskErrorPath_integrable cs ε M deadline start ρ hn hB Γ hΓ p J ℓ τ μ) a
  apply (le_div_iff₀ ha).mpr
  simpa only [mul_comm] using hh

theorem exists_uniform_scheduledRiskError_tail_threshold (T δ γ ζ ρ a κ : ℝ)
    (hδ : δ<1) (hγ : γ<1) (hζ : 0<ζ) (hρ : 0<ρ) (ha : 0<a) (hκ : 0<κ) :
    ∃N : ℕ,2≤N ∧ ∀n : ℕ,N≤n →
      ∀(B : ℝ) (cs : ℕ→SharedPhase n B) (M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
        (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (p : Grid n) (J : ℕ),
        (∀j,(cs j).directions=Γ) → (∀j,(cs j).K<2) → phaseEndpoint cs 0 J≤T → B≤(n:ℝ)^δ →
        (phasePointMeasure cs ((n:ℝ)^(-ζ)) M deadline start hn hB p J).real
          {ω | a*Real.log n≤scheduledRiskErrorPath cs ((n:ℝ)^(-ζ)) M deadline start ρ hn hB Γ p J
            (Real.log n) ((n:ℝ)^(γ-1)) ω}<κ := by
  obtain ⟨N,hN,hh⟩ := exists_uniform_scheduledRiskError_mean_threshold T δ γ ζ ρ (a*κ)
    hδ hγ hζ hρ (mul_pos ha hκ)
  refine ⟨N,hN,?_⟩
  intro n hNn B cs M deadline start hn hB Γ p J hΓ hK hT hBn
  have hlog := log_nat_pos (hN.trans hNn)
  have he := hh n hNn B cs M deadline start hn hB Γ p J hΓ hK hT hBn
  apply (scheduledRiskErrorPath_tail_le_mean cs _ M deadline start ρ hn hB hρ.le Γ hΓ p J _ _
    (a*Real.log n) (mul_pos ha hlog)).trans_lt
  calc
    _ = ((∫ω,scheduledRiskErrorPath cs ((n:ℝ)^(-ζ)) M deadline start ρ hn hB Γ p J
        (Real.log n) ((n:ℝ)^(γ-1)) ω
        ∂phasePointMeasure cs ((n:ℝ)^(-ζ)) M deadline start hn hB p J)/Real.log n)/a := by ring
    _ < (a*κ)/a := div_lt_div_of_pos_right he ha
    _ = κ := by field_simp

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.exists_uniform_scheduledRiskError_mean_threshold
#print axioms NoThreeLine.BirthWitness.exists_uniform_scheduledRiskError_tail_threshold
