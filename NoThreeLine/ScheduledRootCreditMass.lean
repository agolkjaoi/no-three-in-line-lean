import NoThreeLine.ScheduledCreditMassPath
import NoThreeLine.ScheduledRootMomentPath

/-! Actual diagonal credit-decay/mass integrals are uniformly o(log n).
The remaining C13 task is to dominate its two-time loss by this same-time
quantity using the actual conditional leaf estimate. -/
set_option autoImplicit false
set_option maxHeartbeats 1000000
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines FiniteDirections FiniteWitnessMoments

def scheduledRootCreditMassPath {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint) (p : Grid n) (J : ℕ) (ω : BoardClockPath n) : ℝ :=
  (∑ L ∈ nonSpecifiedRootBoardLines Γ p, ∑ N ∈ Finset.range J,
    scheduledCreditMassPath cs ε M deadline start hn hB L.val p N ω)/n

theorem scheduledRootCreditMassPath_nonneg {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint) (p : Grid n) (J : ℕ) (ω : BoardClockPath n) :
    0 ≤ scheduledRootCreditMassPath cs ε M deadline start hn hB Γ p J ω :=
  div_nonneg (Finset.sum_nonneg (fun L _ => Finset.sum_nonneg (fun N _ =>
    (scheduledCreditMassPath_bounds cs ε M deadline start hn hB L.val p N ω).1))) (Nat.cast_nonneg n)

theorem scheduledRootCreditMassPath_integrable {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint) (p : Grid n) (J : ℕ)
    (μ : Measure (BoardClockPath n)) [IsFiniteMeasure μ] :
    Integrable (scheduledRootCreditMassPath cs ε M deadline start hn hB Γ p J) μ :=
  (integrable_finsetSum _ (fun L _ => integrable_finsetSum _ (fun N _ =>
    scheduledCreditMassPath_integrable cs ε M deadline start hn hB L.val p N μ))).div_const _

theorem scheduledRootCreditMassPath_le_momentPath {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint) (p : Grid n) (J : ℕ) (ω : BoardClockPath n) :
    scheduledRootCreditMassPath cs ε M deadline start hn hB Γ p J ω ≤
      scheduledRootMomentPath cs ε M deadline start hn hB (fun _ _ => 1) Γ p J ω := by
  have hline (L : RootBoardLineIndex p) :
      (∑ N ∈ Finset.range J, scheduledCreditMassPath cs ε M deadline start hn hB L.val p N ω) ≤
        scheduledWitnessMomentPath cs ε M deadline start hn hB (fun _ _ => 1) L.val p J ω/n := by
    calc
      _ ≤ ∑ N ∈ Finset.range J, (∑ z ∈ L.val.val.erase p,
          (scheduledLineMomentPath cs ε M deadline start hn hB (fun _ => 1) L.val p z 2 N ω +
          B*scheduledLineMomentPath cs ε M deadline start hn hB (fun _ => 1) L.val p z 1 N ω))/n :=
        Finset.sum_le_sum (fun N _ =>
          scheduledCreditMassPath_le_witness_integrals cs ε M deadline start hn hB L.val p L.property N ω)
      _ = _ := by
        rw [←Finset.sum_div, Finset.sum_comm]
        rfl
  calc
    _ ≤ (∑ L ∈ nonSpecifiedRootBoardLines Γ p,
        scheduledWitnessMomentPath cs ε M deadline start hn hB (fun _ _ => 1) L.val p J ω/n)/n :=
      div_le_div_of_nonneg_right (Finset.sum_le_sum (fun L _ => hline L)) (Nat.cast_nonneg n)
    _ = _ := by
      rw [←Finset.sum_div]
      unfold scheduledRootMomentPath
      ring

theorem scheduledRootCreditMassPath_terminal_bound {n : ℕ} {B : ℝ}
    (Γ : Finset ZPoint) (p : Grid n) (cs : ℕ → SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (hB : 1 ≤ B)
    (hΓ : ∀ j, (cs j).directions=Γ) (hK : ∀ j, (cs j).K < 2)
    (hε0 : 0 ≤ ε) (hε : ε < 1) (J : ℕ) :
    0 ≤ (∫ ω, scheduledRootCreditMassPath cs ε M deadline start hn hB Γ p J ω
      ∂phasePointMeasure cs ε M deadline start hn hB p J) ∧
    (∫ ω, scheduledRootCreditMassPath cs ε M deadline start hn hB Γ p J ω
      ∂phasePointMeasure cs ε M deadline start hn hB p J) ≤
      (2*(phaseEndpoint cs 0 J)^2/(1-ε)^6)*rootBoardLineErrorBudget p B := by
  let μ := phasePointMeasure cs ε M deadline start hn hB p J
  letI : IsProbabilityMeasure μ := phasePointMeasure_probability cs ε M deadline start hn hB p J
  have hh := integral_mono (scheduledRootCreditMassPath_integrable cs ε M deadline start hn hB Γ p J μ)
    (scheduledRootMomentPath_integrable cs ε M deadline start hn hB (fun _ _ => 1)
      (fun _ _ => ⟨zero_le_one,le_rfl⟩) Γ p J μ)
    (scheduledRootCreditMassPath_le_momentPath cs ε M deadline start hn hB Γ p J)
  exact ⟨integral_nonneg (scheduledRootCreditMassPath_nonneg cs ε M deadline start hn hB Γ p J),
    hh.trans (scheduledRootMomentPath_terminal_bound (fun _ _ => 1) (fun _ _ => ⟨zero_le_one,le_rfl⟩)
      Γ p cs ε M deadline start hn hB hΓ hK hε0 hε J).2⟩

theorem exists_uniform_rootCreditMass_threshold (T δ ζ ρ : ℝ)
    (hδ : δ < 1) (hζ : 0 < ζ) (hρ : 0 < ρ) :
    ∃ N : ℕ, 2 ≤ N ∧ ∀ n : ℕ, N ≤ n →
      ∀ (B : ℝ) (cs : ℕ → SharedPhase n B) (M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
        (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint) (p : Grid n) (J : ℕ),
        (∀ j, (cs j).directions=Γ) → (∀ j, (cs j).K < 2) → phaseEndpoint cs 0 J ≤ T → B ≤ (n : ℝ)^δ →
        (∫ ω, scheduledRootCreditMassPath cs ((n : ℝ)^(-ζ)) M deadline start hn hB Γ p J ω
          ∂phasePointMeasure cs ((n : ℝ)^(-ζ)) M deadline start hn hB p J)/Real.log (n : ℝ) < ρ := by
  obtain ⟨N,hN,h⟩ := exists_uniform_rootMomentPath_threshold T δ ζ ρ hδ hζ hρ
  refine ⟨N,hN,?_⟩
  intro n hNn B cs M deadline start hn hB Γ p J hΓ hK hT hBn
  let μ := phasePointMeasure cs ((n : ℝ)^(-ζ)) M deadline start hn hB p J
  letI : IsProbabilityMeasure μ := phasePointMeasure_probability cs _ M deadline start hn hB p J
  have hh := integral_mono (scheduledRootCreditMassPath_integrable cs ((n : ℝ)^(-ζ)) M deadline start hn hB Γ p J μ)
    (scheduledRootMomentPath_integrable cs ((n : ℝ)^(-ζ)) M deadline start hn hB (fun _ _ => 1)
      (fun _ _ => ⟨zero_le_one,le_rfl⟩) Γ p J μ)
    (scheduledRootCreditMassPath_le_momentPath cs ((n : ℝ)^(-ζ)) M deadline start hn hB Γ p J)
  exact (div_le_div_of_nonneg_right hh (log_nat_pos (hN.trans hNn)).le).trans_lt
    (h n hNn B cs M deadline start hn hB (fun _ _ => 1) Γ p J
      (fun _ _ => ⟨zero_le_one,le_rfl⟩) hΓ hK hT hBn)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.scheduledRootCreditMassPath_le_momentPath
#print axioms NoThreeLine.BirthWitness.scheduledRootCreditMassPath_terminal_bound
#print axioms NoThreeLine.BirthWitness.exists_uniform_rootCreditMass_threshold
