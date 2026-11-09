import NoThreeLine.ScheduleAcceptedFirst5347
import NoThreeLine.ScheduleUnionBatch05347AcceptedList
import NoThreeLine.ScheduleUnionBatch05446AcceptedList
import NoThreeLine.ScheduleUnionBatch05547AcceptedList
import NoThreeLine.ScheduleUnionBatch05643AcceptedList
import NoThreeLine.ScheduleUnionBatch05738AcceptedList
import NoThreeLine.ScheduleUnionBatch05825AcceptedList
import NoThreeLine.ScheduleUnionBatch05908AcceptedList
import NoThreeLine.ScheduleUnionBatch05996AcceptedList

/-! Actual chronological prefix [0,6094), retaining accepted source data.
This is only the stated literal schedule prefix. Even when its end is 15348,
reference reconstruction, all risk certificates, and the final Target remain
separate obligations. -/
set_option autoImplicit false
open NoThreeLine.FinitePhase
noncomputable section
namespace NoThreeLine.ScheduleAcceptedFirst6094

theorem grid_pos : 0 < (32768 : ℕ) := by decide

def phases : List (CheckedAcceptedPhase 32768 8) :=
  (((ScheduleAcceptedFirst5347.phases ++ ScheduleUnionBatch05347AcceptedList.phases) ++ (ScheduleUnionBatch05446AcceptedList.phases ++ ScheduleUnionBatch05547AcceptedList.phases)) ++ ((ScheduleUnionBatch05643AcceptedList.phases ++ ScheduleUnionBatch05738AcceptedList.phases) ++ (ScheduleUnionBatch05825AcceptedList.phases ++ (ScheduleUnionBatch05908AcceptedList.phases ++ ScheduleUnionBatch05996AcceptedList.phases))))

theorem phase_count : phases.length = 6094 := by
  simp only [phases, List.length_append, ScheduleAcceptedFirst5347.phase_count,ScheduleUnionBatch05347AcceptedList.phase_count,ScheduleUnionBatch05446AcceptedList.phase_count,ScheduleUnionBatch05547AcceptedList.phase_count,ScheduleUnionBatch05643AcceptedList.phase_count,ScheduleUnionBatch05738AcceptedList.phase_count,ScheduleUnionBatch05825AcceptedList.phase_count,ScheduleUnionBatch05908AcceptedList.phase_count,ScheduleUnionBatch05996AcceptedList.phase_count]

theorem phases_mass : acceptedListMass phases grid_pos = (721467734453043/838860800000000 : ℝ) := by
  simp only [phases, acceptedListMass_append, ScheduleAcceptedFirst5347.phases_mass,ScheduleUnionBatch05347AcceptedList.phases_mass,ScheduleUnionBatch05446AcceptedList.phases_mass,ScheduleUnionBatch05547AcceptedList.phases_mass,ScheduleUnionBatch05643AcceptedList.phases_mass,ScheduleUnionBatch05738AcceptedList.phases_mass,ScheduleUnionBatch05825AcceptedList.phases_mass,ScheduleUnionBatch05908AcceptedList.phases_mass,ScheduleUnionBatch05996AcceptedList.phases_mass]
  norm_num

def actualSchedule : Schedule phases.length := acceptedListSchedule phases grid_pos

def actualInput (r : Fin 4) (x y : ℝ) (j : Fin phases.length) : ℝ :=
  ((phases.get j).toPacket grid_pos).typedField r x y

theorem actual_schedule_mass :
    actualSchedule.typedInputMass (fun j => (phases.get j).phase.rootType)
      (fun j => ((phases.get j).toPacket grid_pos).field) = (721467734453043/838860800000000 : ℝ) :=
  (acceptedListSchedule_mass phases grid_pos).trans phases_mass

theorem shortened_schedule_mass :
    (actualSchedule.scaled (249/250) (by norm_num)).typedInputMass
      (fun j => (phases.get j).phase.rootType) (fun j => ((phases.get j).toPacket grid_pos).field) =
        (179645465878807707/209715200000000000 : ℝ) := by
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

end NoThreeLine.ScheduleAcceptedFirst6094

#print axioms NoThreeLine.ScheduleAcceptedFirst6094.actual_schedule_mass
#print axioms NoThreeLine.ScheduleAcceptedFirst6094.shortened_schedule_mass
#print axioms NoThreeLine.ScheduleAcceptedFirst6094.root_deadline_prefix_le_coarse
