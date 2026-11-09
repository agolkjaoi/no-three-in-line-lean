import NoThreeLine.ScheduleAcceptedFirst832
import NoThreeLine.AcceptedSourceBounds

/-! Actual board-input S6 for this literal 832-phase prefix. Source bounds
are checked here; common-cell separation, 0/1 bounds, and domination come
from the actual accepted unions. This is not a numerical leaf risk certificate. -/
set_option autoImplicit false
set_option maxRecDepth 4096
set_option maxHeartbeats 400000
open NoThreeLine.FinitePhase NoThreeLine.PrimitiveLines NoThreeLine.FiniteDirections
noncomputable section
namespace NoThreeLine.ScheduleAcceptedFirst832Sieve
open ScheduleAcceptedFirst832

theorem source_bounds_checked : phases.all CheckedAcceptedPhase.sourceBoundsBool = true := by
  decide +kernel

theorem source_bounds (i : Fin phases.length) :
    (phases.get i).phase.sx < 128 ∧ (phases.get i).phase.sy < 128 :=
  checkedSourceBounds_of_list phases source_bounds_checked i

def actualBoardInput {n : ℕ} (j : Fin phases.length) (q : Grid n) : ℝ :=
  actualInput (GridArea.typeCode (GridArea.pointType q))
    (GridChord.normX n (gridEmbed q)) (GridChord.normY n (gridEmbed q)) j

theorem actualBoardInput_eq {n : ℕ} :
    (actualBoardInput (n := n)) = (fun j => (phases.get j).phase.boardInput) := by
  funext j q
  change ((phases.get j).toPacket grid_pos).typedField _ _ _ = _
  rw [CheckedAcceptedPhase.typedField_eq]
  rfl

def referenceCoefficients (j : Fin phases.length) : ZPoint → Grid 128 → ℝ :=
  (phases.get j).phase.commonWeight (source_bounds j).1 (source_bounds j).2

theorem actual_deadline_sieve {n : ℕ} (p : Grid n) (hN : ConcreteSieve.Q ≤ n) :
    timePairRisk Finset.univ actualSchedule.lo actualSchedule.hi actualBoardInput p
      (actualSchedule.deadline (fun j => actualBoardInput j p)) ≤
    ((76/125 : ℝ)/24)*typedAngularIntegralSum Finset.univ coarseGridRect
      (actualSchedule.prefixWeights referenceCoefficients
        (actualSchedule.deadline (fun j => actualBoardInput j p)))
      (commonGridLines 32768) (commonGridLines 32768) p*Real.log n +
      ((4*(Finset.univ : Finset (Grid 128)).card+1)*actualSchedule.total)^2 +
      5*actualSchedule.total*((4*(Finset.univ : Finset (Grid 128)).card+1)*actualSchedule.total) +
      10*actualSchedule.total^2 +
      6*25586*(4*((Finset.univ : Finset (Grid 128)).card : ℝ)+3)*actualSchedule.total^2 := by
  rw [actualBoardInput_eq]
  exact actualSchedule.accepted_inputDeadline_upper (fun j => (phases.get j).phase)
    (fun j => (source_bounds j).1) (fun j => (source_bounds j).2) p hN

end NoThreeLine.ScheduleAcceptedFirst832Sieve

#print axioms NoThreeLine.ScheduleAcceptedFirst832Sieve.source_bounds_checked
#print axioms NoThreeLine.ScheduleAcceptedFirst832Sieve.actual_deadline_sieve
