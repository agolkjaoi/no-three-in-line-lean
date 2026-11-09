import NoThreeLine.ScheduleAcceptedFirst3392
import NoThreeLine.ScheduleUnionBatch03392AcceptedList
import NoThreeLine.ScheduleUnionBatch03520AcceptedList
import NoThreeLine.ScheduleUnionBatch03640AcceptedList
import NoThreeLine.ScheduleUnionBatch03768AcceptedList
import NoThreeLine.ScheduleUnionBatch03896AcceptedList
import NoThreeLine.ScheduleUnionBatch04024AcceptedList
import NoThreeLine.ScheduleUnionBatch04152AcceptedList
import NoThreeLine.ScheduleUnionBatch04280AcceptedList

/-! Actual chronological prefix [0,4408), retaining accepted source data.
This is only the stated literal schedule prefix. Even when its end is 15348,
reference reconstruction, all risk certificates, and the final Target remain
separate obligations. -/
set_option autoImplicit false
open NoThreeLine.FinitePhase
noncomputable section
namespace NoThreeLine.ScheduleAcceptedFirst4408

theorem grid_pos : 0 < (32768 : ℕ) := by decide

def phases : List (CheckedAcceptedPhase 32768 8) :=
  (((ScheduleAcceptedFirst3392.phases ++ ScheduleUnionBatch03392AcceptedList.phases) ++ (ScheduleUnionBatch03520AcceptedList.phases ++ ScheduleUnionBatch03640AcceptedList.phases)) ++ ((ScheduleUnionBatch03768AcceptedList.phases ++ ScheduleUnionBatch03896AcceptedList.phases) ++ (ScheduleUnionBatch04024AcceptedList.phases ++ (ScheduleUnionBatch04152AcceptedList.phases ++ ScheduleUnionBatch04280AcceptedList.phases))))

theorem phase_count : phases.length = 4408 := by
  simp only [phases, List.length_append, ScheduleAcceptedFirst3392.phase_count,ScheduleUnionBatch03392AcceptedList.phase_count,ScheduleUnionBatch03520AcceptedList.phase_count,ScheduleUnionBatch03640AcceptedList.phase_count,ScheduleUnionBatch03768AcceptedList.phase_count,ScheduleUnionBatch03896AcceptedList.phase_count,ScheduleUnionBatch04024AcceptedList.phase_count,ScheduleUnionBatch04152AcceptedList.phase_count,ScheduleUnionBatch04280AcceptedList.phase_count]

theorem phases_mass : acceptedListMass phases grid_pos = (300545439114009/419430400000000 : ℝ) := by
  simp only [phases, acceptedListMass_append, ScheduleAcceptedFirst3392.phases_mass,ScheduleUnionBatch03392AcceptedList.phases_mass,ScheduleUnionBatch03520AcceptedList.phases_mass,ScheduleUnionBatch03640AcceptedList.phases_mass,ScheduleUnionBatch03768AcceptedList.phases_mass,ScheduleUnionBatch03896AcceptedList.phases_mass,ScheduleUnionBatch04024AcceptedList.phases_mass,ScheduleUnionBatch04152AcceptedList.phases_mass,ScheduleUnionBatch04280AcceptedList.phases_mass]
  norm_num

def actualSchedule : Schedule phases.length := acceptedListSchedule phases grid_pos

def actualInput (r : Fin 4) (x y : ℝ) (j : Fin phases.length) : ℝ :=
  ((phases.get j).toPacket grid_pos).typedField r x y

theorem actual_schedule_mass :
    actualSchedule.typedInputMass (fun j => (phases.get j).phase.rootType)
      (fun j => ((phases.get j).toPacket grid_pos).field) = (300545439114009/419430400000000 : ℝ) :=
  (acceptedListSchedule_mass phases grid_pos).trans phases_mass

theorem shortened_schedule_mass :
    (actualSchedule.scaled (249/250) (by norm_num)).typedInputMass
      (fun j => (phases.get j).phase.rootType) (fun j => ((phases.get j).toPacket grid_pos).field) =
        (74835814339388241/104857600000000000 : ℝ) := by
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

end NoThreeLine.ScheduleAcceptedFirst4408

#print axioms NoThreeLine.ScheduleAcceptedFirst4408.actual_schedule_mass
#print axioms NoThreeLine.ScheduleAcceptedFirst4408.shortened_schedule_mass
#print axioms NoThreeLine.ScheduleAcceptedFirst4408.root_deadline_prefix_le_coarse
