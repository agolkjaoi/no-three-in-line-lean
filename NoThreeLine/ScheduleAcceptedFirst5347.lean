import NoThreeLine.ScheduleAcceptedFirst4408
import NoThreeLine.ScheduleUnionBatch04408AcceptedList
import NoThreeLine.ScheduleUnionBatch04532AcceptedList
import NoThreeLine.ScheduleUnionBatch04644AcceptedList
import NoThreeLine.ScheduleUnionBatch04748AcceptedList
import NoThreeLine.ScheduleUnionBatch04860AcceptedList
import NoThreeLine.ScheduleUnionBatch04979AcceptedList
import NoThreeLine.ScheduleUnionBatch05107AcceptedList
import NoThreeLine.ScheduleUnionBatch05233AcceptedList

/-! Actual chronological prefix [0,5347), retaining accepted source data.
This is only the stated literal schedule prefix. Even when its end is 15348,
reference reconstruction, all risk certificates, and the final Target remain
separate obligations. -/
set_option autoImplicit false
open NoThreeLine.FinitePhase
noncomputable section
namespace NoThreeLine.ScheduleAcceptedFirst5347

theorem grid_pos : 0 < (32768 : ℕ) := by decide

def phases : List (CheckedAcceptedPhase 32768 8) :=
  (((ScheduleAcceptedFirst4408.phases ++ ScheduleUnionBatch04408AcceptedList.phases) ++ (ScheduleUnionBatch04532AcceptedList.phases ++ ScheduleUnionBatch04644AcceptedList.phases)) ++ ((ScheduleUnionBatch04748AcceptedList.phases ++ ScheduleUnionBatch04860AcceptedList.phases) ++ (ScheduleUnionBatch04979AcceptedList.phases ++ (ScheduleUnionBatch05107AcceptedList.phases ++ ScheduleUnionBatch05233AcceptedList.phases))))

theorem phase_count : phases.length = 5347 := by
  simp only [phases, List.length_append, ScheduleAcceptedFirst4408.phase_count,ScheduleUnionBatch04408AcceptedList.phase_count,ScheduleUnionBatch04532AcceptedList.phase_count,ScheduleUnionBatch04644AcceptedList.phase_count,ScheduleUnionBatch04748AcceptedList.phase_count,ScheduleUnionBatch04860AcceptedList.phase_count,ScheduleUnionBatch04979AcceptedList.phase_count,ScheduleUnionBatch05107AcceptedList.phase_count,ScheduleUnionBatch05233AcceptedList.phase_count]

theorem phases_mass : acceptedListMass phases grid_pos = (671860178343119/838860800000000 : ℝ) := by
  simp only [phases, acceptedListMass_append, ScheduleAcceptedFirst4408.phases_mass,ScheduleUnionBatch04408AcceptedList.phases_mass,ScheduleUnionBatch04532AcceptedList.phases_mass,ScheduleUnionBatch04644AcceptedList.phases_mass,ScheduleUnionBatch04748AcceptedList.phases_mass,ScheduleUnionBatch04860AcceptedList.phases_mass,ScheduleUnionBatch04979AcceptedList.phases_mass,ScheduleUnionBatch05107AcceptedList.phases_mass,ScheduleUnionBatch05233AcceptedList.phases_mass]
  norm_num

def actualSchedule : Schedule phases.length := acceptedListSchedule phases grid_pos

def actualInput (r : Fin 4) (x y : ℝ) (j : Fin phases.length) : ℝ :=
  ((phases.get j).toPacket grid_pos).typedField r x y

theorem actual_schedule_mass :
    actualSchedule.typedInputMass (fun j => (phases.get j).phase.rootType)
      (fun j => ((phases.get j).toPacket grid_pos).field) = (671860178343119/838860800000000 : ℝ) :=
  (acceptedListSchedule_mass phases grid_pos).trans phases_mass

theorem shortened_schedule_mass :
    (actualSchedule.scaled (249/250) (by norm_num)).typedInputMass
      (fun j => (phases.get j).phase.rootType) (fun j => ((phases.get j).toPacket grid_pos).field) =
        (167293184407436631/209715200000000000 : ℝ) := by
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

end NoThreeLine.ScheduleAcceptedFirst5347

#print axioms NoThreeLine.ScheduleAcceptedFirst5347.actual_schedule_mass
#print axioms NoThreeLine.ScheduleAcceptedFirst5347.shortened_schedule_mass
#print axioms NoThreeLine.ScheduleAcceptedFirst5347.root_deadline_prefix_le_coarse
