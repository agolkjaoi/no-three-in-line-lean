import NoThreeLine.VirtualCauseEvent
import NoThreeLine.PointDensityCap
import NoThreeLine.VirtualActualC5

/-! Actual virtual causes are rare under every terminal saved-credit point
law. The board C5 exponent is increased by d before the density cap B≤n^d
is applied. There is no union over point measures or over times. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine
open BirthWitness PrimitiveLines

theorem initial_virtualCause_point_le_board_hit {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (p q : Grid n) (J H : ℕ) :
    (phasePointMeasure cs ε M deadline start hn hB q H).real
      (scheduledBoundaryCauseBefore cs ε M deadline start hn (augInitialState B hB deadline start) p .virtual J) ≤
      B * (boardClockMeasure n (B/n)).real
        (VirtualWitness.anyActualVirtualHit cs ε M deadline start hn hB J) := by
  letI := boardClockMeasure_probability n (B/n)
    (div_pos (zero_lt_one.trans_le hB) (by exact_mod_cast hn))
  exact (phasePointMeasure_real_le_board cs ε M deadline start hn hB q H _
    (scheduledBoundaryCauseBefore_measurableSet cs ε M deadline start hn _ p .virtual J)).trans
      (mul_le_mul_of_nonneg_left
        (measureReal_mono (initial_virtualCauseBefore_subset_actualHit cs ε M deadline start hn hB p J))
        (zero_le_one.trans hB))

theorem virtualCause_uniform_point_polynomial_tail
    (Γ : Finset ZPoint) (K ρ δ T ξ d γ r : ℝ) (hξ : 0 < ξ) (hξd : ξ < d) (hdγ : d < γ)
    (hK0 : 0 ≤ K) (hK2 : K < 2) (hρ1 : ρ ≤ 1)
    (hδ : 0 < δ) (hδ1 : δ ≤ 1) (hδρ : δ ≤ ρ) (hδK : δ ≤ (2-K)/2) :
    ∃ m : ℕ, 0 < m ∧ ∃ N : ℕ, 1 ≤ N ∧
      ∀ n ≥ N, ∀ (B ε : ℝ) (cs : ℕ → SharedPhase n B)
        (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (hB : 1 ≤ B)
        (p q : Grid n) (J H : ℕ),
        B ≤ (n:ℝ)^d → (∀ j, (cs j).directions = Γ) → (∀ j, (cs j).K ≤ K) →
        (∀ j, ρ ≤ (cs j).rho) → 0 ≤ ε → ε ≤ 1/2 → phaseEndpoint cs start J-start ≤ T →
        (phasePointMeasure cs ε ((n:ℝ)^γ) deadline start hn hB q H).real
          (scheduledBoundaryCauseBefore cs ε ((n:ℝ)^γ) deadline start hn
            (augInitialState B hB deadline start) p .virtual J) ≤ (n:ℝ)^(-r) := by
  obtain ⟨m,hm,N,hN,hbound⟩ := VirtualWitness.anyActualVirtualHit_uniform_polynomial_tail
    Γ K ρ δ T ξ d γ (r+d) hξ hξd hdγ hK0 hK2 hρ1 hδ hδ1 hδρ hδK
  refine ⟨m,hm,N,hN,?_⟩
  intro n hnN B ε cs deadline start hn hB p q J H hBd hΓ hK hρ hε0 hε hT
  have hn0 : (0:ℝ) < n := by exact_mod_cast hn
  have ht := hbound n hnN B ε cs deadline start hn hB J hBd hΓ hK hρ hε0 hε hT
  calc
    _ ≤ B * (boardClockMeasure n (B/n)).real
        (VirtualWitness.anyActualVirtualHit cs ε ((n:ℝ)^γ) deadline start hn hB J) :=
      initial_virtualCause_point_le_board_hit cs ε ((n:ℝ)^γ) deadline start hn hB p q J H
    _ ≤ B * (n:ℝ)^(-(r+d)) := mul_le_mul_of_nonneg_left ht (zero_le_one.trans hB)
    _ ≤ (n:ℝ)^d * (n:ℝ)^(-(r+d)) :=
      mul_le_mul_of_nonneg_right hBd (Real.rpow_nonneg hn0.le _)
    _ = (n:ℝ)^(-r) := by
      rw [← Real.rpow_add hn0]
      congr 1
      ring

end NoThreeLine

#print axioms NoThreeLine.initial_virtualCause_point_le_board_hit
#print axioms NoThreeLine.virtualCause_uniform_point_polynomial_tail
