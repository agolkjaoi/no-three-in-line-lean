import NoThreeLine.ScheduleAcceptedFirst2368
import NoThreeLine.ScheduleUnionBatch02368AcceptedList
import NoThreeLine.ScheduleUnionBatch02496AcceptedList
import NoThreeLine.ScheduleUnionBatch02624AcceptedList
import NoThreeLine.ScheduleUnionBatch02752AcceptedList
import NoThreeLine.ScheduleUnionBatch02880AcceptedList
import NoThreeLine.ScheduleUnionBatch03008AcceptedList
import NoThreeLine.ScheduleUnionBatch03136AcceptedList
import NoThreeLine.ScheduleUnionBatch03264AcceptedList

/-! Actual chronological prefix [0,3392), retaining accepted source data.
This is only the stated literal schedule prefix. Even when its end is 15348,
reference reconstruction, all risk certificates, and the final Target remain
separate obligations. -/
set_option autoImplicit false
open NoThreeLine.FinitePhase
noncomputable section
namespace NoThreeLine.ScheduleAcceptedFirst3392

theorem grid_pos : 0 < (32768 : ℕ) := by decide

def phases : List (CheckedAcceptedPhase 32768 8) :=
  (((ScheduleAcceptedFirst2368.phases ++ ScheduleUnionBatch02368AcceptedList.phases) ++ (ScheduleUnionBatch02496AcceptedList.phases ++ ScheduleUnionBatch02624AcceptedList.phases)) ++ ((ScheduleUnionBatch02752AcceptedList.phases ++ ScheduleUnionBatch02880AcceptedList.phases) ++ (ScheduleUnionBatch03008AcceptedList.phases ++ (ScheduleUnionBatch03136AcceptedList.phases ++ ScheduleUnionBatch03264AcceptedList.phases))))

theorem phase_count : phases.length = 3392 := by
  simp only [phases, List.length_append, ScheduleAcceptedFirst2368.phase_count,ScheduleUnionBatch02368AcceptedList.phase_count,ScheduleUnionBatch02496AcceptedList.phase_count,ScheduleUnionBatch02624AcceptedList.phase_count,ScheduleUnionBatch02752AcceptedList.phase_count,ScheduleUnionBatch02880AcceptedList.phase_count,ScheduleUnionBatch03008AcceptedList.phase_count,ScheduleUnionBatch03136AcceptedList.phase_count,ScheduleUnionBatch03264AcceptedList.phase_count]

theorem phases_mass : acceptedListMass phases grid_pos = (255877415499383/419430400000000 : ℝ) := by
  simp only [phases, acceptedListMass_append, ScheduleAcceptedFirst2368.phases_mass,ScheduleUnionBatch02368AcceptedList.phases_mass,ScheduleUnionBatch02496AcceptedList.phases_mass,ScheduleUnionBatch02624AcceptedList.phases_mass,ScheduleUnionBatch02752AcceptedList.phases_mass,ScheduleUnionBatch02880AcceptedList.phases_mass,ScheduleUnionBatch03008AcceptedList.phases_mass,ScheduleUnionBatch03136AcceptedList.phases_mass,ScheduleUnionBatch03264AcceptedList.phases_mass]
  norm_num

def actualSchedule : Schedule phases.length := acceptedListSchedule phases grid_pos

def actualInput (r : Fin 4) (x y : ℝ) (j : Fin phases.length) : ℝ :=
  ((phases.get j).toPacket grid_pos).typedField r x y

theorem actual_schedule_mass :
    actualSchedule.typedInputMass (fun j => (phases.get j).phase.rootType)
      (fun j => ((phases.get j).toPacket grid_pos).field) = (255877415499383/419430400000000 : ℝ) :=
  (acceptedListSchedule_mass phases grid_pos).trans phases_mass

theorem shortened_schedule_mass :
    (actualSchedule.scaled (249/250) (by norm_num)).typedInputMass
      (fun j => (phases.get j).phase.rootType) (fun j => ((phases.get j).toPacket grid_pos).field) =
        (63713476459346367/104857600000000000 : ℝ) := by
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

end NoThreeLine.ScheduleAcceptedFirst3392

#print axioms NoThreeLine.ScheduleAcceptedFirst3392.actual_schedule_mass
#print axioms NoThreeLine.ScheduleAcceptedFirst3392.shortened_schedule_mass
#print axioms NoThreeLine.ScheduleAcceptedFirst3392.root_deadline_prefix_le_coarse
