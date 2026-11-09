import NoThreeLine.ScheduleAcceptedFirst6094
import NoThreeLine.ScheduleUnionBatch06094AcceptedList
import NoThreeLine.ScheduleUnionBatch06206AcceptedList
import NoThreeLine.ScheduleUnionBatch06323AcceptedList
import NoThreeLine.ScheduleUnionBatch06433AcceptedList
import NoThreeLine.ScheduleUnionBatch06526AcceptedList
import NoThreeLine.ScheduleUnionBatch06613AcceptedList
import NoThreeLine.ScheduleUnionBatch06710AcceptedList
import NoThreeLine.ScheduleUnionBatch06832AcceptedList

/-! Actual chronological prefix [0,6960), retaining accepted source data.
This is only the stated literal schedule prefix. Even when its end is 15348,
reference reconstruction, all risk certificates, and the final Target remain
separate obligations. -/
set_option autoImplicit false
open NoThreeLine.FinitePhase
noncomputable section
namespace NoThreeLine.ScheduleAcceptedFirst6960

theorem grid_pos : 0 < (32768 : ℕ) := by decide

def phases : List (CheckedAcceptedPhase 32768 8) :=
  (((ScheduleAcceptedFirst6094.phases ++ ScheduleUnionBatch06094AcceptedList.phases) ++ (ScheduleUnionBatch06206AcceptedList.phases ++ ScheduleUnionBatch06323AcceptedList.phases)) ++ ((ScheduleUnionBatch06433AcceptedList.phases ++ ScheduleUnionBatch06526AcceptedList.phases) ++ (ScheduleUnionBatch06613AcceptedList.phases ++ (ScheduleUnionBatch06710AcceptedList.phases ++ ScheduleUnionBatch06832AcceptedList.phases))))

theorem phase_count : phases.length = 6960 := by
  simp only [phases, List.length_append, ScheduleAcceptedFirst6094.phase_count,ScheduleUnionBatch06094AcceptedList.phase_count,ScheduleUnionBatch06206AcceptedList.phase_count,ScheduleUnionBatch06323AcceptedList.phase_count,ScheduleUnionBatch06433AcceptedList.phase_count,ScheduleUnionBatch06526AcceptedList.phase_count,ScheduleUnionBatch06613AcceptedList.phase_count,ScheduleUnionBatch06710AcceptedList.phase_count,ScheduleUnionBatch06832AcceptedList.phase_count]

theorem phases_mass : acceptedListMass phases grid_pos = (773010091857971/838860800000000 : ℝ) := by
  simp only [phases, acceptedListMass_append, ScheduleAcceptedFirst6094.phases_mass,ScheduleUnionBatch06094AcceptedList.phases_mass,ScheduleUnionBatch06206AcceptedList.phases_mass,ScheduleUnionBatch06323AcceptedList.phases_mass,ScheduleUnionBatch06433AcceptedList.phases_mass,ScheduleUnionBatch06526AcceptedList.phases_mass,ScheduleUnionBatch06613AcceptedList.phases_mass,ScheduleUnionBatch06710AcceptedList.phases_mass,ScheduleUnionBatch06832AcceptedList.phases_mass]
  norm_num

def actualSchedule : Schedule phases.length := acceptedListSchedule phases grid_pos

def actualInput (r : Fin 4) (x y : ℝ) (j : Fin phases.length) : ℝ :=
  ((phases.get j).toPacket grid_pos).typedField r x y

theorem actual_schedule_mass :
    actualSchedule.typedInputMass (fun j => (phases.get j).phase.rootType)
      (fun j => ((phases.get j).toPacket grid_pos).field) = (773010091857971/838860800000000 : ℝ) :=
  (acceptedListSchedule_mass phases grid_pos).trans phases_mass

theorem shortened_schedule_mass :
    (actualSchedule.scaled (249/250) (by norm_num)).typedInputMass
      (fun j => (phases.get j).phase.rootType) (fun j => ((phases.get j).toPacket grid_pos).field) =
        (192479512872634779/209715200000000000 : ℝ) := by
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

end NoThreeLine.ScheduleAcceptedFirst6960

#print axioms NoThreeLine.ScheduleAcceptedFirst6960.actual_schedule_mass
#print axioms NoThreeLine.ScheduleAcceptedFirst6960.shortened_schedule_mass
#print axioms NoThreeLine.ScheduleAcceptedFirst6960.root_deadline_prefix_le_coarse
