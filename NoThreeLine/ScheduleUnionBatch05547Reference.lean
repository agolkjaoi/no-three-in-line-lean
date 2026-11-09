import NoThreeLine.ScheduleUnionBatch05547AcceptedList
import NoThreeLine.FrozenReferenceTables
import NoThreeLine.FiniteIndexBlocks
import NoThreeLine.ReferenceLists

/-! Every phase in this bounded batch uses exactly the common reference
order/type/source/units lookup. These are internal literal tables; proving
their JSON parsing and the external compressed reference identity is separate. -/
set_option autoImplicit false
set_option maxRecDepth 4096
set_option maxHeartbeats 400000
open NoThreeLine.FinitePhase
namespace NoThreeLine.ScheduleUnionBatch05547Reference
open ScheduleUnionBatch05547Accepted FrozenReference

def phaseIndex (i : Fin 96) : Fin 15348 :=
  ⟨5547+i.val, by have := i.isLt; omega⟩

theorem matches_0 : ∀ i : Fin 64,
    (fun i => FrozenReference.PhaseMatches (accepted i) (phaseIndex i)) (finOffset 96 0 64 (by decide) i) := by decide +kernel

theorem matches_64 : ∀ i : Fin 32,
    (fun i => FrozenReference.PhaseMatches (accepted i) (phaseIndex i)) (finOffset 96 64 32 (by decide) i) := by decide +kernel

theorem phase_matches : ∀ i : Fin 96, FrozenReference.PhaseMatches (accepted i) (phaseIndex i) :=
  forallFin_of_zero_offset (fun i => FrozenReference.PhaseMatches (accepted i) (phaseIndex i)) (forallFinOffset_add (fun i => FrozenReference.PhaseMatches (accepted i) (phaseIndex i)) 0 64 32 (by decide) matches_0
  matches_64)

theorem actual_duration_reference (i : Fin 96) :
    actualSchedule.duration i = (phaseUnits (phaseIndex i) : ℝ)/100000000 := by
  unfold actualSchedule checkedAcceptedSchedule
  rw [scheduleOfDurations_duration]
  exact FrozenReference.PhaseMatches.duration_eq (accepted i) grid_pos (phaseIndex i) (phase_matches i)

theorem actual_type_reference (i : Fin 96) :
    (accepted i).phase.rootType = FrozenReference.rootType (phaseIndex i) := (phase_matches i).2.2.1

theorem actual_source_reference (i : Fin 96) :
    ((accepted i).phase.sx, (accepted i).phase.sy) = phaseSource (phaseIndex i) :=
  Prod.ext (phase_matches i).2.2.2.1 (phase_matches i).2.2.2.2

theorem ordered_matches : FrozenReference.MatchesFrom 5547 ScheduleUnionBatch05547AcceptedList.phases := by
  unfold ScheduleUnionBatch05547AcceptedList.phases
  apply FrozenReference.matchesFrom_tree
  intro i
  exact ⟨(phaseIndex i).isLt, phase_matches i⟩

end NoThreeLine.ScheduleUnionBatch05547Reference

#print axioms NoThreeLine.ScheduleUnionBatch05547Reference.phase_matches
#print axioms NoThreeLine.ScheduleUnionBatch05547Reference.actual_duration_reference
#print axioms NoThreeLine.ScheduleUnionBatch05547Reference.ordered_matches
