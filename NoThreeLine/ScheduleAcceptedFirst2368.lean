import NoThreeLine.ScheduleAcceptedFirst1344
import NoThreeLine.ScheduleUnionBatch01344AcceptedList
import NoThreeLine.ScheduleUnionBatch01472AcceptedList
import NoThreeLine.ScheduleUnionBatch01600AcceptedList
import NoThreeLine.ScheduleUnionBatch01728AcceptedList
import NoThreeLine.ScheduleUnionBatch01856AcceptedList
import NoThreeLine.ScheduleUnionBatch01984AcceptedList
import NoThreeLine.ScheduleUnionBatch02112AcceptedList
import NoThreeLine.ScheduleUnionBatch02240AcceptedList

/-! Actual chronological prefix [0,2368), retaining accepted source data.
This is only the stated literal schedule prefix. Even when its end is 15348,
reference reconstruction, all risk certificates, and the final Target remain
separate obligations. -/
set_option autoImplicit false
open NoThreeLine.FinitePhase
noncomputable section
namespace NoThreeLine.ScheduleAcceptedFirst2368

theorem grid_pos : 0 < (32768 : ℕ) := by decide

def phases : List (CheckedAcceptedPhase 32768 8) :=
  (((ScheduleAcceptedFirst1344.phases ++ ScheduleUnionBatch01344AcceptedList.phases) ++ (ScheduleUnionBatch01472AcceptedList.phases ++ ScheduleUnionBatch01600AcceptedList.phases)) ++ ((ScheduleUnionBatch01728AcceptedList.phases ++ ScheduleUnionBatch01856AcceptedList.phases) ++ (ScheduleUnionBatch01984AcceptedList.phases ++ (ScheduleUnionBatch02112AcceptedList.phases ++ ScheduleUnionBatch02240AcceptedList.phases))))

theorem phase_count : phases.length = 2368 := by
  simp only [phases, List.length_append, ScheduleAcceptedFirst1344.phase_count,ScheduleUnionBatch01344AcceptedList.phase_count,ScheduleUnionBatch01472AcceptedList.phase_count,ScheduleUnionBatch01600AcceptedList.phase_count,ScheduleUnionBatch01728AcceptedList.phase_count,ScheduleUnionBatch01856AcceptedList.phase_count,ScheduleUnionBatch01984AcceptedList.phase_count,ScheduleUnionBatch02112AcceptedList.phase_count,ScheduleUnionBatch02240AcceptedList.phase_count]

theorem phases_mass : acceptedListMass phases grid_pos = (770589213853/1638400000000 : ℝ) := by
  simp only [phases, acceptedListMass_append, ScheduleAcceptedFirst1344.phases_mass,ScheduleUnionBatch01344AcceptedList.phases_mass,ScheduleUnionBatch01472AcceptedList.phases_mass,ScheduleUnionBatch01600AcceptedList.phases_mass,ScheduleUnionBatch01728AcceptedList.phases_mass,ScheduleUnionBatch01856AcceptedList.phases_mass,ScheduleUnionBatch01984AcceptedList.phases_mass,ScheduleUnionBatch02112AcceptedList.phases_mass,ScheduleUnionBatch02240AcceptedList.phases_mass]
  norm_num

def actualSchedule : Schedule phases.length := acceptedListSchedule phases grid_pos

def actualInput (r : Fin 4) (x y : ℝ) (j : Fin phases.length) : ℝ :=
  ((phases.get j).toPacket grid_pos).typedField r x y

theorem actual_schedule_mass :
    actualSchedule.typedInputMass (fun j => (phases.get j).phase.rootType)
      (fun j => ((phases.get j).toPacket grid_pos).field) = (770589213853/1638400000000 : ℝ) :=
  (acceptedListSchedule_mass phases grid_pos).trans phases_mass

theorem shortened_schedule_mass :
    (actualSchedule.scaled (249/250) (by norm_num)).typedInputMass
      (fun j => (phases.get j).phase.rootType) (fun j => ((phases.get j).toPacket grid_pos).field) =
        (191876714249397/409600000000000 : ℝ) := by
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

end NoThreeLine.ScheduleAcceptedFirst2368

#print axioms NoThreeLine.ScheduleAcceptedFirst2368.actual_schedule_mass
#print axioms NoThreeLine.ScheduleAcceptedFirst2368.shortened_schedule_mass
#print axioms NoThreeLine.ScheduleAcceptedFirst2368.root_deadline_prefix_le_coarse
