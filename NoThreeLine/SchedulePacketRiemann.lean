import NoThreeLine.PacketRiemann
import NoThreeLine.AcceptedPacketList

/-! Actual accepted input mass on the board converges to its own checked
space-time mass.  Different phases may have different normalized partitions.
The explicit error is the duration-weighted sum of their individual errors. -/
set_option autoImplicit false
open MeasureTheory
open scoped BigOperators
noncomputable section
namespace NoThreeLine.FinitePhase

def checkedBoardMass {J G L : ℕ} (a : Fin J → CheckedAcceptedPhase G L)
    (hG : 0 < G) (n : ℕ) : ℝ :=
  (∑ q : Grid n, (checkedAcceptedSchedule a hG).cumulative
    (fun j => ((a j).toPacket hG).boardInput q) (checkedAcceptedSchedule a hG).total)/(n : ℝ)^2

def checkedRiemannConstant {J G L : ℕ} (a : Fin J → CheckedAcceptedPhase G L)
    (hG : 0 < G) : ℝ :=
  ∑ j : Fin J, ((a j).toPacket hG).duration*
    (3*((a j).outCount : ℝ)+(commonGridLines G).card+(commonGridLines G).card)

theorem checkedBoardMass_eq_sum {J G L : ℕ} (a : Fin J → CheckedAcceptedPhase G L)
    (hG : 0 < G) (n : ℕ) :
    checkedBoardMass a hG n = ∑ j : Fin J, ((a j).toPacket hG).duration*
      ((∑ q : Grid n, ((a j).toPacket hG).boardInput q)/(n : ℝ)^2) := by
  unfold checkedBoardMass
  simp_rw [Schedule.cumulative_total]
  rw [Finset.sum_comm, Finset.sum_div]
  apply Finset.sum_congr rfl
  intro j _
  rw [← Finset.mul_sum]
  change (checkedAcceptedSchedule a hG).duration j * _ / _ = _
  unfold checkedAcceptedSchedule
  rw [scheduleOfDurations_duration]
  ring

theorem checkedAcceptedSchedule_mass_packets {J G L : ℕ}
    (a : Fin J → CheckedAcceptedPhase G L) (hG : 0 < G) :
    (checkedAcceptedSchedule a hG).typedInputMass (fun j => (a j).phase.rootType)
      (fun j => ((a j).toPacket hG).field) = ∑ j : Fin J, ((a j).toPacket hG).mass := by
  unfold checkedAcceptedSchedule
  rw [scheduleOfDurations_mass _ _ _ _ (fun j => ((a j).toPacket hG).integrable)]
  rfl

theorem checkedBoardMass_area_error {J G L : ℕ} (a : Fin J → CheckedAcceptedPhase G L)
    (hG : 0 < G) (n : ℕ) (hn : 0 < n) :
    |checkedBoardMass a hG n -
      (checkedAcceptedSchedule a hG).typedInputMass (fun j => (a j).phase.rootType)
        (fun j => ((a j).toPacket hG).field)| ≤ checkedRiemannConstant a hG/(n : ℝ) := by
  rw [checkedBoardMass_eq_sum, checkedAcceptedSchedule_mass_packets, ← Finset.sum_sub_distrib]
  calc
    _ ≤ ∑ j : Fin J, |((a j).toPacket hG).duration*
        ((∑ q : Grid n, ((a j).toPacket hG).boardInput q)/(n : ℝ)^2) -
        ((a j).toPacket hG).mass| := Finset.abs_sum_le_sum_abs _ _
    _ ≤ ∑ j : Fin J, ((a j).toPacket hG).duration*
        ((3*((a j).outCount : ℝ)+(commonGridLines G).card+(commonGridLines G).card)/(n : ℝ)) :=
      Finset.sum_le_sum (fun j _ => (a j).board_mass_error hG n hn)
    _ = checkedRiemannConstant a hG/(n : ℝ) := by
      simp only [checkedRiemannConstant, mul_div_assoc, Finset.sum_div]

theorem checkedRiemannConstant_nonneg {J G L : ℕ}
    (a : Fin J → CheckedAcceptedPhase G L) (hG : 0 < G) :
    0 ≤ checkedRiemannConstant a hG := by
  apply Finset.sum_nonneg
  intro j _
  exact mul_nonneg ((a j).toPacket hG).positive.le (by positivity)

end NoThreeLine.FinitePhase

#print axioms NoThreeLine.FinitePhase.checkedBoardMass_area_error
