import NoThreeLine.ScheduledRiskErrorSmall

/-! Probability consequences of the actual main/error decomposition.
The two main paths are still the original random paths; bounding their
joint tail remains a separate step and is not assumed to be complete. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness
open PrimitiveLines ShortStars

theorem scheduledOutsideRiskPath_excess_tail_le_error {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start ρ : ℝ)
    (hn : 0<n) (hB : 1≤B) (hρ : 0<ρ) (Γ : Finset ZPoint)
    (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2) (hρcfg : ∀j,ρ≤(cs j).rho)
    (p : Grid n) (J : ℕ) (ℓ τ a : ℝ) :
    (phasePointMeasure cs ε M deadline start hn hB p J).real
      {ω | a≤scheduledOutsideRiskPath cs ε M deadline start hn hB Γ p J ω-
        scheduledLongMainPath cs ε M deadline start hn hB Γ p J (B*ℓ) ω-
        scheduledStarCanonicalLatePath cs ε M deadline start hn hB Γ p (B*ℓ) τ J ω}≤
    (phasePointMeasure cs ε M deadline start hn hB p J).real
      {ω | a≤scheduledRiskErrorPath cs ε M deadline start ρ hn hB Γ p J ℓ τ ω} := by
  letI := phasePointMeasure_probability cs ε M deadline start hn hB p J
  refine measureReal_mono ?_ (by finiteness)
  intro ω hω
  simp only [Set.mem_setOf_eq] at hω ⊢
  have hh := scheduledOutsideRiskPath_le_main_error cs ε M deadline start ρ hn hB hρ Γ hΓ hK hρcfg p J ℓ τ ω
  linarith

theorem scheduledOutsideRiskPath_tail_le_main_and_error {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start ρ : ℝ)
    (hn : 0<n) (hB : 1≤B) (hρ : 0<ρ) (Γ : Finset ZPoint)
    (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2) (hρcfg : ∀j,ρ≤(cs j).rho)
    (p : Grid n) (J : ℕ) (ℓ τ r a : ℝ) :
    (phasePointMeasure cs ε M deadline start hn hB p J).real
      {ω | r+a≤scheduledOutsideRiskPath cs ε M deadline start hn hB Γ p J ω}≤
    (phasePointMeasure cs ε M deadline start hn hB p J).real
      {ω | r≤scheduledLongMainPath cs ε M deadline start hn hB Γ p J (B*ℓ) ω+
        scheduledStarCanonicalLatePath cs ε M deadline start hn hB Γ p (B*ℓ) τ J ω}+
    (phasePointMeasure cs ε M deadline start hn hB p J).real
      {ω | a≤scheduledRiskErrorPath cs ε M deadline start ρ hn hB Γ p J ℓ τ ω} := by
  let μ := phasePointMeasure cs ε M deadline start hn hB p J
  letI : IsProbabilityMeasure μ := phasePointMeasure_probability cs ε M deadline start hn hB p J
  apply le_trans (measureReal_mono (μ:=μ) ?_) (measureReal_union_le _ _)
  intro ω hω
  simp only [Set.mem_union,Set.mem_setOf_eq] at hω ⊢
  by_cases hh : r≤scheduledLongMainPath cs ε M deadline start hn hB Γ p J (B*ℓ) ω+
      scheduledStarCanonicalLatePath cs ε M deadline start hn hB Γ p (B*ℓ) τ J ω
  · exact Or.inl hh
  · right
    have hb := scheduledOutsideRiskPath_le_main_error cs ε M deadline start ρ hn hB hρ Γ hΓ hK hρcfg p J ℓ τ ω
    linarith

theorem exists_uniform_outsideRisk_main_excess_threshold (T δ γ ζ ρ a κ : ℝ)
    (hδ : δ<1) (hγ : γ<1) (hζ : 0<ζ) (hρ : 0<ρ) (ha : 0<a) (hκ : 0<κ) :
    ∃N : ℕ,2≤N ∧ ∀n : ℕ,N≤n →
      ∀(B : ℝ) (cs : ℕ→SharedPhase n B) (M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
        (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (p : Grid n) (J : ℕ),
        (∀j,(cs j).directions=Γ) → (∀j,(cs j).K<2) → (∀j,ρ≤(cs j).rho) →
        phaseEndpoint cs 0 J≤T → B≤(n:ℝ)^δ →
        (phasePointMeasure cs ((n:ℝ)^(-ζ)) M deadline start hn hB p J).real
          {ω | a*Real.log n≤scheduledOutsideRiskPath cs ((n:ℝ)^(-ζ)) M deadline start hn hB Γ p J ω-
            scheduledLongMainPath cs ((n:ℝ)^(-ζ)) M deadline start hn hB Γ p J (B*Real.log n) ω-
            scheduledStarCanonicalLatePath cs ((n:ℝ)^(-ζ)) M deadline start hn hB Γ p (B*Real.log n)
              ((n:ℝ)^(γ-1)) J ω}<κ := by
  obtain ⟨N,hN,hh⟩ := exists_uniform_scheduledRiskError_tail_threshold T δ γ ζ ρ a κ hδ hγ hζ hρ ha hκ
  refine ⟨N,hN,?_⟩
  intro n hNn B cs M deadline start hn hB Γ p J hΓ hK hρcfg hT hBn
  exact (scheduledOutsideRiskPath_excess_tail_le_error cs _ M deadline start ρ hn hB hρ Γ hΓ hK hρcfg p J
    (Real.log n) ((n:ℝ)^(γ-1)) (a*Real.log n)).trans_lt
    (hh n hNn B cs M deadline start hn hB Γ p J hΓ hK hT hBn)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.scheduledOutsideRiskPath_tail_le_main_and_error
#print axioms NoThreeLine.BirthWitness.exists_uniform_outsideRisk_main_excess_threshold
