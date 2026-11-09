import NoThreeLine.PhasePointLaw

/-! The actual point law has a bounded saved-credit density. This comparison
uses only the density cap, with no history-event identification. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine

theorem savedCreditMeasure_real_le_cap {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsFiniteMeasure μ] (Z : Ω → ℝ) (hZi : Integrable Z μ)
    (h0 : ∀ ω, 0 ≤ Z ω) (B : ℝ) (hB : ∀ ω, Z ω ≤ B)
    (E : Set Ω) (hE : MeasurableSet E) :
    (savedCreditMeasure μ Z).real E ≤ B * μ.real E := by
  rw [savedCreditMeasure_real_apply μ Z hZi h0 E hE]
  calc
    _ ≤ ∫ ω in E, B ∂μ := integral_mono_ae hZi.integrableOn (integrable_const B)
      (ae_of_all _ hB)
    _ = B * μ.real E := by simp [mul_comm]

theorem phasePointMeasure_real_le_board {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (p : Grid n) (H : ℕ)
    (E : Set (BoardClockPath n)) (hE : MeasurableSet E) :
    (phasePointMeasure cs ε M deadline start hn hB p H).real E ≤
      B * (boardClockMeasure n (B/n)).real E := by
  letI := boardClockMeasure_probability n (B/n)
    (div_pos (zero_lt_one.trans_le hB) (by exact_mod_cast hn))
  exact savedCreditMeasure_real_le_cap _ _
    (phasePointCredit_integrable cs ε M deadline start hn hB p H)
    (fun ω => (phasePointCredit_bounds cs ε M deadline start hn hB p H ω).1) B
    (fun ω => (phasePointCredit_bounds cs ε M deadline start hn hB p H ω).2) E hE

end NoThreeLine

#print axioms NoThreeLine.savedCreditMeasure_real_le_cap
#print axioms NoThreeLine.phasePointMeasure_real_le_board
