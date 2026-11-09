import NoThreeLine.ScheduleAcceptedFirst832
import NoThreeLine.ScheduleUnionBatch00832AcceptedList
import NoThreeLine.ScheduleUnionBatch00960AcceptedList
import NoThreeLine.ScheduleUnionBatch01088AcceptedList
import NoThreeLine.ScheduleUnionBatch01216AcceptedList

/-! Actual chronological prefix [0,1344), retaining accepted source data.
This is only the stated literal schedule prefix. Even when its end is 15348,
reference reconstruction, all risk certificates, and the final Target remain
separate obligations. -/
set_option autoImplicit false
open NoThreeLine.FinitePhase
noncomputable section
namespace NoThreeLine.ScheduleAcceptedFirst1344

theorem grid_pos : 0 < (32768 : ℕ) := by decide

def phases : List (CheckedAcceptedPhase 32768 8) :=
  ((ScheduleAcceptedFirst832.phases ++ ScheduleUnionBatch00832AcceptedList.phases) ++ (ScheduleUnionBatch00960AcceptedList.phases ++ (ScheduleUnionBatch01088AcceptedList.phases ++ ScheduleUnionBatch01216AcceptedList.phases)))

theorem phase_count : phases.length = 1344 := by
  simp only [phases, List.length_append, ScheduleAcceptedFirst832.phase_count,ScheduleUnionBatch00832AcceptedList.phase_count,ScheduleUnionBatch00960AcceptedList.phase_count,ScheduleUnionBatch01088AcceptedList.phase_count,ScheduleUnionBatch01216AcceptedList.phase_count]

theorem phases_mass : acceptedListMass phases grid_pos = (215748141907/819200000000 : ℝ) := by
  simp only [phases, acceptedListMass_append, ScheduleAcceptedFirst832.phases_mass,ScheduleUnionBatch00832AcceptedList.phases_mass,ScheduleUnionBatch00960AcceptedList.phases_mass,ScheduleUnionBatch01088AcceptedList.phases_mass,ScheduleUnionBatch01216AcceptedList.phases_mass]
  norm_num

def actualSchedule : Schedule phases.length := acceptedListSchedule phases grid_pos

def actualInput (r : Fin 4) (x y : ℝ) (j : Fin phases.length) : ℝ :=
  ((phases.get j).toPacket grid_pos).typedField r x y

theorem actual_schedule_mass :
    actualSchedule.typedInputMass (fun j => (phases.get j).phase.rootType)
      (fun j => ((phases.get j).toPacket grid_pos).field) = (215748141907/819200000000 : ℝ) :=
  (acceptedListSchedule_mass phases grid_pos).trans phases_mass

theorem shortened_schedule_mass :
    (actualSchedule.scaled (249/250) (by norm_num)).typedInputMass
      (fun j => (phases.get j).phase.rootType) (fun j => ((phases.get j).toPacket grid_pos).field) =
        (53721287334843/204800000000000 : ℝ) := by
  rw [Schedule.scaled_typedInputMass, actual_schedule_mass]
  norm_num

theorem actual_prefix_le_coarse (T : ℝ) (hT : 0 ≤ T) (r : Fin 4) (x y : ℝ) :
    actualSchedule.cumulative (actualInput r x y) T ≤
      actualSchedule.coarseAcceptedPrefix (fun j => (phases.get j).phase) 32768
        (commonGridLines 32768) (commonGridLines 32768) T r x y :=
  acceptedListSchedule_prefix_le_coarse phases grid_pos T hT r x y

def pointDeadline (r : Fin 4) (x y : ℝ) : ℝ := actualSchedule.deadline (actualInput r x y)

theorem root_deadline_prefix_le_coarse (rootType r : Fin 4) (rootX rootY x y : ℝ) :
    actualSchedule.cumulative (actualInput r x y) (pointDeadline rootType rootX rootY) ≤
      actualSchedule.coarseAcceptedPrefix (fun j => (phases.get j).phase) 32768
        (commonGridLines 32768) (commonGridLines 32768) (pointDeadline rootType rootX rootY) r x y :=
  actual_prefix_le_coarse _ (actualSchedule.deadline_nonneg _) r x y

end NoThreeLine.ScheduleAcceptedFirst1344

#print axioms NoThreeLine.ScheduleAcceptedFirst1344.actual_schedule_mass
#print axioms NoThreeLine.ScheduleAcceptedFirst1344.shortened_schedule_mass
#print axioms NoThreeLine.ScheduleAcceptedFirst1344.root_deadline_prefix_le_coarse
