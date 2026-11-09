import NoThreeLine.ScheduledCreditLossDecomposition
import NoThreeLine.ScheduledRootCreditDoubleSmall

/-! The actual all-phase credit-loss mass, summed over non-specified root
lines, equals the proved time double integral under the same full-J point
law. This yields its uniform o(log n) bound; the separate risk/proxy
domination is not asserted in this module. -/
set_option autoImplicit false
set_option maxHeartbeats 1000000
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines FiniteDirections

def scheduledRootCreditLossPath {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint) (p : Grid n) (J : ℕ) (ω : BoardClockPath n) : ℝ :=
  (∑ L ∈ nonSpecifiedRootBoardLines Γ p, ∑ N ∈ Finset.range J,
    scheduledCreditLossMassPath cs ε M deadline start hn hB L.val p N ω)/n

theorem scheduledRootCreditLossPath_nonneg {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint) (hΓ : ∀ j, (cs j).directions = Γ)
    (p : Grid n) (J : ℕ) (ω : BoardClockPath n) :
    0 ≤ scheduledRootCreditLossPath cs ε M deadline start hn hB Γ p J ω := by
  apply div_nonneg _ (Nat.cast_nonneg n)
  apply Finset.sum_nonneg
  intro L hL
  apply Finset.sum_nonneg
  intro N _
  exact (scheduledCreditLossMassPath_bounds cs ε M deadline start hn hB L.val p N
    (by rw [hΓ N]; exact (Finset.mem_filter.mp hL).2) L.property ω).1

theorem scheduledRootCreditLossPath_integrable {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint) (hΓ : ∀ j, (cs j).directions = Γ)
    (p : Grid n) (J : ℕ) (μ : Measure (BoardClockPath n)) [IsFiniteMeasure μ] :
    Integrable (scheduledRootCreditLossPath cs ε M deadline start hn hB Γ p J) μ := by
  apply Integrable.div_const
  apply integrable_finsetSum
  intro L hL
  apply integrable_finsetSum
  intro N _
  exact scheduledCreditLossMassPath_integrable cs ε M deadline start hn hB L.val p N
    (by rw [hΓ N]; exact (Finset.mem_filter.mp hL).2) L.property μ

theorem scheduledRootCreditLossPath_eq_double_ae {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint) (hΓ : ∀ j, (cs j).directions = Γ)
    (p : Grid n) (J : ℕ) :
    ∀ᵐ ω ∂phasePointMeasure cs ε M deadline start hn hB p J,
      scheduledRootCreditLossPath cs ε M deadline start hn hB Γ p J ω =
        scheduledRootCreditDoublePath cs ε M deadline start hn hB Γ p J ω := by
  classical
  have hall : ∀ᵐ ω ∂phasePointMeasure cs ε M deadline start hn hB p J,
      ∀ L : RootBoardLineIndex p, ¬specified Γ L.val →
        (∑ N ∈ Finset.range J, scheduledCreditLossMassPath cs ε M deadline start hn hB L.val p N ω) =
          scheduledCreditDoublePath cs ε M deadline start hn hB L.val p J ω :=
    ae_all_iff.mpr (fun L => by
      by_cases hL : ¬specified Γ L.val
      · exact (scheduledCreditLossMassPath_sum_eq_double_ae cs ε M deadline start hn hB L.val p J
          (fun N => by rw [hΓ N]; exact hL) L.property).mono (fun ω hω _ => hω)
      · exact Filter.Eventually.of_forall (fun _ h => False.elim (hL h)))
  filter_upwards [hall] with ω hω
  apply congrArg (fun x : ℝ => x/n)
  exact Finset.sum_congr rfl (fun L hL => hω L (Finset.mem_filter.mp hL).2)

theorem scheduledRootCreditLossPath_terminal_mean {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint) (hΓ : ∀ j, (cs j).directions = Γ)
    (p : Grid n) (J : ℕ) :
    (∫ ω, scheduledRootCreditLossPath cs ε M deadline start hn hB Γ p J ω
      ∂phasePointMeasure cs ε M deadline start hn hB p J) =
    (∫ ω, scheduledRootCreditDoublePath cs ε M deadline start hn hB Γ p J ω
      ∂phasePointMeasure cs ε M deadline start hn hB p J) :=
  integral_congr_ae (scheduledRootCreditLossPath_eq_double_ae cs ε M deadline start hn hB Γ hΓ p J)

theorem scheduledRootCreditLossPath_terminal_bound {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint)
    (hΓ : ∀ j, (cs j).directions = Γ) (hK : ∀ j, (cs j).K < 2)
    (p : Grid n) (J : ℕ) (hε0 : 0 ≤ ε) (hε : ε < 1) :
    0 ≤ (∫ ω, scheduledRootCreditLossPath cs ε M deadline start hn hB Γ p J ω
      ∂phasePointMeasure cs ε M deadline start hn hB p J) ∧
    (∫ ω, scheduledRootCreditLossPath cs ε M deadline start hn hB Γ p J ω
      ∂phasePointMeasure cs ε M deadline start hn hB p J) ≤
      (2*(phaseEndpoint cs 0 J)^3/(1-ε)^7)*rootBoardLineErrorBudget p B := by
  refine ⟨integral_nonneg (scheduledRootCreditLossPath_nonneg cs ε M deadline start hn hB Γ hΓ p J),?_⟩
  rw [scheduledRootCreditLossPath_terminal_mean cs ε M deadline start hn hB Γ hΓ p J]
  exact scheduledRootCreditDoublePath_terminal_bound cs ε M deadline start hn hB Γ hΓ hK p J hε0 hε

theorem exists_uniform_rootCreditLoss_threshold (T δ ζ ρ : ℝ)
    (hδ : δ < 1) (hζ : 0 < ζ) (hρ : 0 < ρ) :
    ∃ N : ℕ, 2 ≤ N ∧ ∀ n : ℕ, N ≤ n →
      ∀ (B : ℝ) (cs : ℕ → SharedPhase n B) (M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
        (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint) (p : Grid n) (J : ℕ),
        (∀ j, (cs j).directions=Γ) → (∀ j, (cs j).K < 2) → phaseEndpoint cs 0 J ≤ T → B ≤ (n : ℝ)^δ →
        (∫ ω, scheduledRootCreditLossPath cs ((n : ℝ)^(-ζ)) M deadline start hn hB Γ p J ω
          ∂phasePointMeasure cs ((n : ℝ)^(-ζ)) M deadline start hn hB p J)/Real.log (n : ℝ) < ρ := by
  obtain ⟨N,hN,h⟩ := exists_uniform_rootCreditDouble_threshold T δ ζ ρ hδ hζ hρ
  refine ⟨N,hN,?_⟩
  intro n hNn B cs M deadline start hn hB Γ p J hΓ hK hT hBn
  rw [scheduledRootCreditLossPath_terminal_mean cs _ M deadline start hn hB Γ hΓ p J]
  exact h n hNn B cs M deadline start hn hB Γ p J hΓ hK hT hBn

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.scheduledRootCreditLossPath_eq_double_ae
#print axioms NoThreeLine.BirthWitness.scheduledRootCreditLossPath_terminal_bound
#print axioms NoThreeLine.BirthWitness.exists_uniform_rootCreditLoss_threshold
