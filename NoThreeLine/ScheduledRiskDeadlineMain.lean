import NoThreeLine.ScheduledRiskDeadlineError
import NoThreeLine.ScheduledExpiredRisk

/-! Full actual risk is controlled by main/error observables evaluated
only through the root-deadline prefix. Actual stopped birth rates supply
the truncation; no auxiliary-star disappearance is used. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness
open PrimitiveLines ShortStars

theorem scheduledOutsideRiskPath_le_deadline_main_error {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start ρ : ℝ)
    (hn : 0<n) (hB : 1≤B) (hρ : 0<ρ) (Γ : Finset ZPoint)
    (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2) (hρcfg : ∀j,ρ≤(cs j).rho)
    (p : Grid n) (k J : ℕ) (hkJ : k≤J) (hp : deadline p≤phaseEndpoint cs start k)
    (ℓ τ : ℝ) (ω : BoardClockPath n) :
    scheduledOutsideRiskPath cs ε M deadline start hn hB Γ p J ω≤
      scheduledLongMainPath cs ε M deadline start hn hB Γ p k (B*ℓ) ω+
      scheduledStarCanonicalLatePath cs ε M deadline start hn hB Γ p (B*ℓ) τ k ω+
      scheduledRiskErrorPath cs ε M deadline start ρ hn hB Γ p k ℓ τ ω := by
  rw [(scheduledOutsidePaths_deadline_prefix cs ε M deadline start hn hB Γ p k J hkJ hp ω).1]
  exact scheduledOutsideRiskPath_le_main_error cs ε M deadline start ρ hn hB hρ Γ hΓ hK hρcfg p k ℓ τ ω

theorem scheduledOutsideRiskPath_tail_le_deadline_main_error {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start ρ : ℝ)
    (hn : 0<n) (hB : 1≤B) (hρ : 0<ρ) (Γ : Finset ZPoint)
    (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2) (hρcfg : ∀j,ρ≤(cs j).rho)
    (p : Grid n) (k J : ℕ) (hkJ : k≤J) (hp : deadline p≤phaseEndpoint cs start k)
    (ℓ τ r a : ℝ) :
    (phasePointMeasure cs ε M deadline start hn hB p J).real
      {ω | r+a≤scheduledOutsideRiskPath cs ε M deadline start hn hB Γ p J ω}≤
    (phasePointMeasure cs ε M deadline start hn hB p J).real
      {ω | r≤scheduledLongMainPath cs ε M deadline start hn hB Γ p k (B*ℓ) ω+
        scheduledStarCanonicalLatePath cs ε M deadline start hn hB Γ p (B*ℓ) τ k ω}+
    (phasePointMeasure cs ε M deadline start hn hB p J).real
      {ω | a≤scheduledRiskErrorPath cs ε M deadline start ρ hn hB Γ p k ℓ τ ω} := by
  have he : scheduledOutsideRiskPath cs ε M deadline start hn hB Γ p J=
      scheduledOutsideRiskPath cs ε M deadline start hn hB Γ p k :=
    funext (fun ω=>(scheduledOutsidePaths_deadline_prefix cs ε M deadline start hn hB Γ p k J hkJ hp ω).1)
  rw [he,phasePointMeasure_deadline_stable cs ε M deadline start p hn hB k J hkJ hp]
  exact scheduledOutsideRiskPath_tail_le_main_and_error cs ε M deadline start ρ hn hB hρ Γ hΓ hK hρcfg p k ℓ τ r a

theorem exists_uniform_outsideRisk_deadline_main_excess_threshold (T δ γ ζ ρ a κ : ℝ)
    (hδ : δ<1) (hγ : γ<1) (hζ : 0<ζ) (hρ : 0<ρ) (ha : 0<a) (hκ : 0<κ) :
    ∃N : ℕ,2≤N ∧ ∀n : ℕ,N≤n →
      ∀(B : ℝ) (cs : ℕ→SharedPhase n B) (M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
        (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (p : Grid n) (k J : ℕ),
        k≤J → deadline p≤phaseEndpoint cs start k →
        (∀j,(cs j).directions=Γ) → (∀j,(cs j).K<2) → (∀j,ρ≤(cs j).rho) →
        phaseEndpoint cs 0 k≤T → B≤(n:ℝ)^δ →
        (phasePointMeasure cs ((n:ℝ)^(-ζ)) M deadline start hn hB p J).real
          {ω | a*Real.log n≤scheduledOutsideRiskPath cs ((n:ℝ)^(-ζ)) M deadline start hn hB Γ p J ω-
            scheduledLongMainPath cs ((n:ℝ)^(-ζ)) M deadline start hn hB Γ p k (B*Real.log n) ω-
            scheduledStarCanonicalLatePath cs ((n:ℝ)^(-ζ)) M deadline start hn hB Γ p (B*Real.log n)
              ((n:ℝ)^(γ-1)) k ω}<κ := by
  obtain ⟨N,hN,hh⟩ := exists_uniform_outsideRisk_main_excess_threshold T δ γ ζ ρ a κ hδ hγ hζ hρ ha hκ
  refine ⟨N,hN,?_⟩
  intro n hNn B cs M deadline start hn hB Γ p k J hkJ hp hΓ hK hρcfg hT hBn
  have he : scheduledOutsideRiskPath cs ((n:ℝ)^(-ζ)) M deadline start hn hB Γ p J=
      scheduledOutsideRiskPath cs ((n:ℝ)^(-ζ)) M deadline start hn hB Γ p k :=
    funext (fun ω=>(scheduledOutsidePaths_deadline_prefix cs _ M deadline start hn hB Γ p k J hkJ hp ω).1)
  rw [he,phasePointMeasure_deadline_stable cs ((n:ℝ)^(-ζ)) M deadline start p hn hB k J hkJ hp]
  exact hh n hNn B cs M deadline start hn hB Γ p k hΓ hK hρcfg hT hBn

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.scheduledOutsideRiskPath_le_deadline_main_error
#print axioms NoThreeLine.BirthWitness.exists_uniform_outsideRisk_deadline_main_excess_threshold
