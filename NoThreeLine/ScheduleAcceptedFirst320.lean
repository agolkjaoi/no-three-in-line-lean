import NoThreeLine.ScheduleUnionBatch00000AcceptedList
import NoThreeLine.ScheduleUnionBatch00032AcceptedList
import NoThreeLine.ScheduleUnionBatch00160AcceptedList
import NoThreeLine.ScheduleUnionBatch00192AcceptedList

/-! Actual source/leaf-retaining chronology for phases 0 through 319.
The point deadline is computed from this schedule's own actual typed masks.
No complete-schedule or compressed-reference-field identity is asserted. -/
set_option autoImplicit false
open NoThreeLine.FinitePhase
noncomputable section
namespace NoThreeLine.ScheduleAcceptedFirst320

theorem grid_pos : 0 < (32768 : ℕ) := by decide

def phases : List (CheckedAcceptedPhase 32768 8) :=
  (ScheduleUnionBatch00000AcceptedList.phases ++ ScheduleUnionBatch00032AcceptedList.phases) ++
  (ScheduleUnionBatch00160AcceptedList.phases ++ ScheduleUnionBatch00192AcceptedList.phases)

theorem phase_count : phases.length = 320 := by
  simp only [phases, List.length_append, ScheduleUnionBatch00000AcceptedList.phase_count,
    ScheduleUnionBatch00032AcceptedList.phase_count, ScheduleUnionBatch00160AcceptedList.phase_count,
    ScheduleUnionBatch00192AcceptedList.phase_count]

theorem phases_mass : acceptedListMass phases grid_pos = (95050249629/1638400000000 : ℝ) := by
  simp only [phases, acceptedListMass_append, ScheduleUnionBatch00000AcceptedList.phases_mass,
    ScheduleUnionBatch00032AcceptedList.phases_mass, ScheduleUnionBatch00160AcceptedList.phases_mass,
    ScheduleUnionBatch00192AcceptedList.phases_mass]
  norm_num

def actualSchedule : Schedule phases.length := acceptedListSchedule phases grid_pos

def actualInput (r : Fin 4) (x y : ℝ) (j : Fin phases.length) : ℝ :=
  ((phases.get j).toPacket grid_pos).typedField r x y

theorem actual_schedule_mass :
    actualSchedule.typedInputMass (fun j => (phases.get j).phase.rootType)
      (fun j => ((phases.get j).toPacket grid_pos).field) = (95050249629/1638400000000 : ℝ) :=
  (acceptedListSchedule_mass phases grid_pos).trans phases_mass

theorem shortened_schedule_mass :
    (actualSchedule.scaled (249/250) (by norm_num)).typedInputMass
      (fun j => (phases.get j).phase.rootType) (fun j => ((phases.get j).toPacket grid_pos).field) =
        (23667512157621/409600000000000 : ℝ) := by
  rw [Schedule.scaled_typedInputMass, actual_schedule_mass]
  norm_num

theorem actual_prefix_le_coarse (T : ℝ) (hT : 0 ≤ T) (r : Fin 4) (x y : ℝ) :
    actualSchedule.cumulative (actualInput r x y) T ≤
      actualSchedule.coarseAcceptedPrefix (fun j => (phases.get j).phase) 32768
        (commonGridLines 32768) (commonGridLines 32768) T r x y :=
  acceptedListSchedule_prefix_le_coarse phases grid_pos T hT r x y

def pointDeadline (r : Fin 4) (x y : ℝ) : ℝ := actualSchedule.deadline (actualInput r x y)

theorem deadline_prefix_le_coarse (r : Fin 4) (x y : ℝ) :
    actualSchedule.cumulative (actualInput r x y) (pointDeadline r x y) ≤
      actualSchedule.coarseAcceptedPrefix (fun j => (phases.get j).phase) 32768
        (commonGridLines 32768) (commonGridLines 32768) (pointDeadline r x y) r x y :=
  actual_prefix_le_coarse _ (actualSchedule.deadline_nonneg _) r x y

end NoThreeLine.ScheduleAcceptedFirst320

#print axioms NoThreeLine.ScheduleAcceptedFirst320.actual_schedule_mass
#print axioms NoThreeLine.ScheduleAcceptedFirst320.shortened_schedule_mass
#print axioms NoThreeLine.ScheduleAcceptedFirst320.deadline_prefix_le_coarse
