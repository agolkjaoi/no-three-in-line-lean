import NoThreeLine.ScheduledLineExcessPath
import NoThreeLine.ScheduledCutLongExcessSmall

/-! The actual full terminal point law inherits the established uniform
long-line excess bound through the proved cut-density tower. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines FiniteWitnessMoments FiniteDirections

theorem scheduledLongExcessPath_terminal_bound {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (p : Grid n)
    (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (hε0 : 0≤ε) (hε : ε<1) (k J : ℕ) (δ ℓ : ℝ) (hδ : 0<δ) (hℓ : 1≤ℓ) :
    0≤(∫ω,scheduledLongExcessPath cs ε M deadline start hn hB Γ p J ℓ ω
      ∂phasePointMeasure cs ε M deadline start hn hB p J) ∧
    (∫ω,scheduledLongExcessPath cs ε M deadline start hn hB Γ p J ℓ ω
      ∂phasePointMeasure cs ε M deadline start hn hB p J)≤
      16*(phaseEndpoint cs 0 J)^2/(1-ε)^(k+3).choose 2*(1+Real.log (n:ℝ))*
        lineExcessFactor (physicalRepeatErrorConstant (k+1)) δ ℓ k := by
  rw [scheduledLongExcessPath_terminal_mean]
  exact scheduledCutLongExcess_bound cs ε M deadline start hn hB Γ p hΓ hK hε0 hε k J δ ℓ hδ hℓ

theorem exists_uniform_terminalLongExcess_threshold (T ζ ρ : ℝ) (hζ : 0<ζ) (hρ : 0<ρ) :
    ∃N : ℕ,2≤N ∧ ∀n : ℕ,N≤n→
      ∀(B : ℝ) (cs : ℕ→SharedPhase n B) (M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
        (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (p : Grid n) (J : ℕ),
        (∀j,(cs j).directions=Γ)→(∀j,(cs j).K<2)→phaseEndpoint cs 0 J≤T→
        (∫ω,scheduledLongExcessPath cs ((n:ℝ)^(-ζ)) M deadline start hn hB Γ p J (Real.log (n:ℝ)) ω
          ∂phasePointMeasure cs ((n:ℝ)^(-ζ)) M deadline start hn hB p J)/Real.log (n:ℝ)<ρ := by
  obtain ⟨N,hN,h⟩ := exists_uniform_cutLongExcess_threshold T ζ ρ hζ hρ
  refine ⟨N,hN,?_⟩
  intro n hNn B cs M deadline start hn hB Γ p J hΓ hK hT
  rw [scheduledLongExcessPath_terminal_mean]
  exact h n hNn B cs M deadline start hn hB Γ p J hΓ hK hT

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.scheduledLongExcessPath_terminal_bound
#print axioms NoThreeLine.BirthWitness.exists_uniform_terminalLongExcess_threshold
