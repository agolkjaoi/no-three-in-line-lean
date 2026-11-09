import NoThreeLine.SchedulePacketRiemann
import NoThreeLine.AcceptedCommonGrid

/-! Shortening acts once on the actual input time integral and on its error.
The phase masks and parity labels are unchanged. -/
set_option autoImplicit false
open scoped BigOperators
noncomputable section
namespace NoThreeLine

theorem commonGridLines_card (G : ℕ) (hG : 0 < G) : (commonGridLines G).card = G+1 := by
  have hg : (G : ℝ) ≠ 0 := by exact_mod_cast (ne_of_gt hG)
  have hi : Function.Injective (fun k : ℕ => (k : ℝ)/(G : ℝ)) := by
    intro k l he
    have hh := congrArg (fun v : ℝ => v*(G : ℝ)) he
    simp only [div_mul_cancel₀ _ hg] at hh
    exact_mod_cast hh
  rw [commonGridLines, Finset.card_image_of_injective _ hi, Finset.card_range]

theorem CheckedAcceptedPhase.packetBoardInput_eq {n : ℕ}
    (a : CheckedAcceptedPhase 32768 8) (hG : 0 < (32768 : ℕ)) (q : Grid n) :
    (a.toPacket hG).boardInput q = a.phase.boardInput q := by
  unfold FinitePhase.PhasePacket.boardInput
  rw [CheckedAcceptedPhase.typedField_eq]
  simp only [AcceptedPhase.boardInput, GridChord.normX, GridChord.normY, PrimitiveLines.gridEmbed,
    Int.cast_natCast]

namespace FinitePhase

def Schedule.boardInputMass {J n : ℕ} (s : Schedule J) (m : Fin J → Grid n → ℝ) : ℝ :=
  (∑ q : Grid n, s.cumulative (fun j => m j q) s.total)/(n : ℝ)^2

theorem Schedule.boardInputMass_scaled {J n : ℕ} (s : Schedule J)
    (m : Fin J → Grid n → ℝ) (c : ℝ) (hc : 0 < c) :
    (s.scaled c hc).boardInputMass m = c*s.boardInputMass m := by
  unfold Schedule.boardInputMass
  simp_rw [Schedule.scaled_total, Schedule.scaled_cumulative _ _ _ _ _ s.total_nonneg]
  rw [← Finset.mul_sum]
  ring

theorem scaled_checkedBoardMass_area_error {J G L : ℕ}
    (a : Fin J → CheckedAcceptedPhase G L) (hG : 0 < G) (n : ℕ) (hn : 0 < n)
    (c : ℝ) (hc : 0 < c) :
    |((checkedAcceptedSchedule a hG).scaled c hc).boardInputMass
        (fun j => ((a j).toPacket hG).boardInput (n := n)) -
      ((checkedAcceptedSchedule a hG).scaled c hc).typedInputMass
        (fun j => (a j).phase.rootType) (fun j => ((a j).toPacket hG).field)| ≤
      c*checkedRiemannConstant a hG/(n : ℝ) := by
  rw [Schedule.boardInputMass_scaled, Schedule.scaled_typedInputMass]
  change |c*checkedBoardMass a hG n-c*_| ≤ _
  rw [← mul_sub, abs_mul, abs_of_pos hc]
  simpa only [mul_div_assoc] using
    mul_le_mul_of_nonneg_left (checkedBoardMass_area_error a hG n hn) hc.le

theorem checkedRiemannConstant_explicit {J G L : ℕ}
    (a : Fin J → CheckedAcceptedPhase G L) (hG : 0 < G) :
    checkedRiemannConstant a hG = ∑ j : Fin J,
      ((a j).toPacket hG).duration*(3*((a j).outCount : ℝ)+2*((G : ℝ)+1)) := by
  unfold checkedRiemannConstant
  simp_rw [commonGridLines_card G hG, Nat.cast_add, Nat.cast_one]
  apply Finset.sum_congr rfl
  intro j _
  ring

end FinitePhase
end NoThreeLine

#print axioms NoThreeLine.FinitePhase.scaled_checkedBoardMass_area_error
#print axioms NoThreeLine.CheckedAcceptedPhase.packetBoardInput_eq
