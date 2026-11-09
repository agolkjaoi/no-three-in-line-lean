import NoThreeLine.ScheduledCreditDoubleSum
import NoThreeLine.ScheduledRootCreditMass

/-! All actual non-specified root lines and all pairs of phase times are
aggregated under one full-J point law. The proven diagonal C11 budget
controls this complete double-integral path sum with one time/eta factor. -/
set_option autoImplicit false
set_option maxHeartbeats 1000000
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines FiniteDirections

def scheduledRootCreditDoublePath {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint) (p : Grid n) (J : ℕ) (ω : BoardClockPath n) : ℝ :=
  (∑ L ∈ nonSpecifiedRootBoardLines Γ p, scheduledCreditDoublePath cs ε M deadline start hn hB L.val p J ω)/n

theorem scheduledRootCreditDoublePath_integrable {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint) (hΓ : ∀ j, (cs j).directions = Γ)
    (p : Grid n) (J : ℕ) (μ : Measure (BoardClockPath n)) [IsFiniteMeasure μ] :
    Integrable (scheduledRootCreditDoublePath cs ε M deadline start hn hB Γ p J) μ := by
  apply Integrable.div_const
  apply integrable_finsetSum
  intro L hL
  apply scheduledCreditDoublePath_integrable cs ε M deadline start hn hB L.val p J _ L.property μ
  intro N
  rw [hΓ N]
  exact (Finset.mem_filter.mp hL).2

theorem scheduledRootCreditDoublePath_le_diagonal {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint)
    (hΓ : ∀ j, (cs j).directions = Γ) (hK : ∀ j, (cs j).K < 2)
    (p : Grid n) (J : ℕ) (hε0 : 0 ≤ ε) (hε : ε < 1) :
    (∫ ω, scheduledRootCreditDoublePath cs ε M deadline start hn hB Γ p J ω
      ∂phasePointMeasure cs ε M deadline start hn hB p J) ≤
    phaseEndpoint cs 0 J/(1-ε)*(∫ ω, scheduledRootCreditMassPath cs ε M deadline start hn hB Γ p J ω
      ∂phasePointMeasure cs ε M deadline start hn hB p J) := by
  let μ := phasePointMeasure cs ε M deadline start hn hB p J
  letI : IsProbabilityMeasure μ := phasePointMeasure_probability cs ε M deadline start hn hB p J
  have hi (L : RootBoardLineIndex p) (hL : L ∈ nonSpecifiedRootBoardLines Γ p) :
      Integrable (scheduledCreditDoublePath cs ε M deadline start hn hB L.val p J) μ := by
    apply scheduledCreditDoublePath_integrable cs ε M deadline start hn hB L.val p J _ L.property μ
    intro N
    rw [hΓ N]
    exact (Finset.mem_filter.mp hL).2
  have hd (L : RootBoardLineIndex p) : Integrable (fun ω => ∑ j ∈ Finset.range J,
      scheduledCreditMassPath cs ε M deadline start hn hB L.val p j ω) μ :=
    integrable_finsetSum _ (fun j _ => scheduledCreditMassPath_integrable cs ε M deadline start hn hB L.val p j μ)
  calc
    _ = (∑ L ∈ nonSpecifiedRootBoardLines Γ p,
        ∫ ω, scheduledCreditDoublePath cs ε M deadline start hn hB L.val p J ω ∂μ)/n := by
      simp only [scheduledRootCreditDoublePath]
      rw [integral_div,integral_finsetSum _ hi]
    _ ≤ (∑ L ∈ nonSpecifiedRootBoardLines Γ p, phaseEndpoint cs 0 J/(1-ε)*
        (∫ ω, (∑ j ∈ Finset.range J, scheduledCreditMassPath cs ε M deadline start hn hB L.val p j ω) ∂μ))/n :=
      div_le_div_of_nonneg_right (Finset.sum_le_sum (fun L hL =>
        scheduledCreditDoublePath_terminal_bound cs ε M deadline start hn hB Γ hΓ hK J L.val
          (Finset.mem_filter.mp hL).2 p L.property hε0 hε)) (Nat.cast_nonneg n)
    _ = _ := by
      simp only [scheduledRootCreditMassPath]
      rw [integral_div,integral_finsetSum _ (fun L _ => hd L),←Finset.mul_sum]
      ring

theorem scheduledRootCreditDoublePath_terminal_bound {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint)
    (hΓ : ∀ j, (cs j).directions = Γ) (hK : ∀ j, (cs j).K < 2)
    (p : Grid n) (J : ℕ) (hε0 : 0 ≤ ε) (hε : ε < 1) :
    (∫ ω, scheduledRootCreditDoublePath cs ε M deadline start hn hB Γ p J ω
      ∂phasePointMeasure cs ε M deadline start hn hB p J) ≤
      (2*(phaseEndpoint cs 0 J)^3/(1-ε)^7)*rootBoardLineErrorBudget p B := by
  have hh := (scheduledRootCreditDoublePath_le_diagonal cs ε M deadline start hn hB Γ hΓ hK p J hε0 hε).trans
    (mul_le_mul_of_nonneg_left
      (scheduledRootCreditMassPath_terminal_bound Γ p cs ε M deadline start hn hB hΓ hK hε0 hε J).2
      (div_nonneg (phaseEndpoint_zero_nonneg cs J) (sub_nonneg.mpr hε.le)))
  apply hh.trans_eq
  field_simp
  <;> ring

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.scheduledRootCreditDoublePath_integrable
#print axioms NoThreeLine.BirthWitness.scheduledRootCreditDoublePath_le_diagonal
#print axioms NoThreeLine.BirthWitness.scheduledRootCreditDoublePath_terminal_bound
