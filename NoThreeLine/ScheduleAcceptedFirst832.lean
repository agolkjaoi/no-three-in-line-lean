import NoThreeLine.ScheduleAcceptedFirst320
import NoThreeLine.ScheduleUnionBatch00320AcceptedList
import NoThreeLine.ScheduleUnionBatch00448AcceptedList
import NoThreeLine.ScheduleUnionBatch00576AcceptedList
import NoThreeLine.ScheduleUnionBatch00704AcceptedList

/-! Actual chronological prefix [0,832), retaining accepted source data.
This is only the stated literal schedule prefix. Even when its end is 15348,
reference reconstruction, all risk certificates, and the final Target remain
separate obligations. -/
set_option autoImplicit false
open NoThreeLine.FinitePhase
noncomputable section
namespace NoThreeLine.ScheduleAcceptedFirst832

theorem grid_pos : 0 < (32768 : ℕ) := by decide

def phases : List (CheckedAcceptedPhase 32768 8) :=
  ((ScheduleAcceptedFirst320.phases ++ ScheduleUnionBatch00320AcceptedList.phases) ++ (ScheduleUnionBatch00448AcceptedList.phases ++ (ScheduleUnionBatch00576AcceptedList.phases ++ ScheduleUnionBatch00704AcceptedList.phases)))

theorem phase_count : phases.length = 832 := by
  simp only [phases, List.length_append, ScheduleAcceptedFirst320.phase_count,ScheduleUnionBatch00320AcceptedList.phase_count,ScheduleUnionBatch00448AcceptedList.phase_count,ScheduleUnionBatch00576AcceptedList.phase_count,ScheduleUnionBatch00704AcceptedList.phase_count]

theorem phases_mass : acceptedListMass phases grid_pos = (11068028179/65536000000 : ℝ) := by
  simp only [phases, acceptedListMass_append, ScheduleAcceptedFirst320.phases_mass,ScheduleUnionBatch00320AcceptedList.phases_mass,ScheduleUnionBatch00448AcceptedList.phases_mass,ScheduleUnionBatch00576AcceptedList.phases_mass,ScheduleUnionBatch00704AcceptedList.phases_mass]
  norm_num

def actualSchedule : Schedule phases.length := acceptedListSchedule phases grid_pos

def actualInput (r : Fin 4) (x y : ℝ) (j : Fin phases.length) : ℝ :=
  ((phases.get j).toPacket grid_pos).typedField r x y

theorem actual_schedule_mass :
    actualSchedule.typedInputMass (fun j => (phases.get j).phase.rootType)
      (fun j => ((phases.get j).toPacket grid_pos).field) = (11068028179/65536000000 : ℝ) :=
  (acceptedListSchedule_mass phases grid_pos).trans phases_mass

theorem shortened_schedule_mass :
    (actualSchedule.scaled (249/250) (by norm_num)).typedInputMass
      (fun j => (phases.get j).phase.rootType) (fun j => ((phases.get j).toPacket grid_pos).field) =
        (2755939016571/16384000000000 : ℝ) := by
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

end NoThreeLine.ScheduleAcceptedFirst832

#print axioms NoThreeLine.ScheduleAcceptedFirst832.actual_schedule_mass
#print axioms NoThreeLine.ScheduleAcceptedFirst832.shortened_schedule_mass
#print axioms NoThreeLine.ScheduleAcceptedFirst832.root_deadline_prefix_le_coarse
