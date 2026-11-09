import NoThreeLine.ScheduledLineMomentPath
import NoThreeLine.ScheduledTerminalRootMomentSmall

/-! The one-time C11 budget is an expectation of actual path integrals,
not just a formal sum of separately specified moments. This does not supply
the remaining two-time C13 comparison. -/
set_option autoImplicit false
set_option maxHeartbeats 1000000
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines FiniteDirections

def scheduledRootMomentPath {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (mask : ℕ → Grid n → ℝ) (Γ : Finset ZPoint)
    (p : Grid n) (J : ℕ) (ω : BoardClockPath n) : ℝ :=
  (∑ L ∈ nonSpecifiedRootBoardLines Γ p,
    scheduledWitnessMomentPath cs ε M deadline start hn hB mask L.val p J ω)/(n : ℝ)^2

theorem scheduledRootMomentPath_integrable {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (mask : ℕ → Grid n → ℝ) (hm : ∀ N q, 0 ≤ mask N q ∧ mask N q ≤ 1)
    (Γ : Finset ZPoint) (p : Grid n) (J : ℕ) (μ : Measure (BoardClockPath n)) [IsFiniteMeasure μ] :
    Integrable (scheduledRootMomentPath cs ε M deadline start hn hB mask Γ p J) μ :=
  (integrable_finset_sum _ (fun L _ =>
    scheduledWitnessMomentPath_integrable cs ε M deadline start hn hB mask hm L.val p J μ)).div_const _

theorem scheduledRootMomentPath_terminal_mean {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (mask : ℕ → Grid n → ℝ) (hm : ∀ N q, 0 ≤ mask N q ∧ mask N q ≤ 1)
    (Γ : Finset ZPoint) (p : Grid n) (J : ℕ) :
    (∫ ω, scheduledRootMomentPath cs ε M deadline start hn hB mask Γ p J ω
      ∂phasePointMeasure cs ε M deadline start hn hB p J) =
      scheduledTerminalRootMoment cs ε M deadline start hn hB mask Γ p J := by
  let μ := phasePointMeasure cs ε M deadline start hn hB p J
  letI : IsProbabilityMeasure μ := phasePointMeasure_probability cs ε M deadline start hn hB p J
  unfold scheduledRootMomentPath scheduledTerminalRootMoment
  rw [integral_div, integral_finset_sum _ (fun L _ =>
    scheduledWitnessMomentPath_integrable cs ε M deadline start hn hB mask hm L.val p J μ)]
  congr 1
  exact Finset.sum_congr rfl (fun L _ =>
    scheduledWitnessMomentPath_terminal_mean cs ε M deadline start hn hB mask hm L.val p J)

theorem scheduledRootMomentPath_terminal_bound {n : ℕ} {B : ℝ}
    (mask : ℕ → Grid n → ℝ) (hm : ∀ N q, 0 ≤ mask N q ∧ mask N q ≤ 1)
    (Γ : Finset ZPoint) (p : Grid n) (cs : ℕ → SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (hB : 1 ≤ B)
    (hΓ : ∀ j, (cs j).directions=Γ) (hK : ∀ j, (cs j).K < 2)
    (hε0 : 0 ≤ ε) (hε : ε < 1) (J : ℕ) :
    0 ≤ (∫ ω, scheduledRootMomentPath cs ε M deadline start hn hB mask Γ p J ω
      ∂phasePointMeasure cs ε M deadline start hn hB p J) ∧
    (∫ ω, scheduledRootMomentPath cs ε M deadline start hn hB mask Γ p J ω
      ∂phasePointMeasure cs ε M deadline start hn hB p J) ≤
      (2*(phaseEndpoint cs 0 J)^2/(1-ε)^6)*rootBoardLineErrorBudget p B := by
  rw [scheduledRootMomentPath_terminal_mean cs ε M deadline start hn hB mask hm]
  exact scheduledTerminalRootMoment_bound mask hm Γ p cs ε M deadline start hn hB hΓ hK hε0 hε J

theorem exists_uniform_rootMomentPath_threshold (T δ ζ ρ : ℝ)
    (hδ : δ < 1) (hζ : 0 < ζ) (hρ : 0 < ρ) :
    ∃ N : ℕ, 2 ≤ N ∧ ∀ n : ℕ, N ≤ n →
      ∀ (B : ℝ) (cs : ℕ → SharedPhase n B) (M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
        (hn : 0 < n) (hB : 1 ≤ B) (mask : ℕ → Grid n → ℝ) (Γ : Finset ZPoint) (p : Grid n) (J : ℕ),
        (∀ k q, 0 ≤ mask k q ∧ mask k q ≤ 1) → (∀ j, (cs j).directions=Γ) →
        (∀ j, (cs j).K < 2) → phaseEndpoint cs 0 J ≤ T → B ≤ (n : ℝ)^δ →
        (∫ ω, scheduledRootMomentPath cs ((n : ℝ)^(-ζ)) M deadline start hn hB mask Γ p J ω
          ∂phasePointMeasure cs ((n : ℝ)^(-ζ)) M deadline start hn hB p J)/Real.log (n : ℝ) < ρ := by
  obtain ⟨N,hN,h⟩ := exists_uniform_terminalRootMoment_threshold T δ ζ ρ hδ hζ hρ
  refine ⟨N,hN,?_⟩
  intro n hNn B cs M deadline start hn hB mask Γ p J hm hΓ hK hT hBn
  rw [scheduledRootMomentPath_terminal_mean cs _ M deadline start hn hB mask hm]
  exact h n hNn B cs M deadline start hn hB mask Γ p J hm hΓ hK hT hBn

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.scheduledRootMomentPath_terminal_mean
#print axioms NoThreeLine.BirthWitness.scheduledRootMomentPath_terminal_bound
#print axioms NoThreeLine.BirthWitness.exists_uniform_rootMomentPath_threshold
