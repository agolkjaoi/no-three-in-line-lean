import NoThreeLine.ScheduleUnionBatch04532AcceptedList
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
namespace NoThreeLine.ScheduleUnionBatch04532Reference
open ScheduleUnionBatch04532Accepted FrozenReference

def phaseIndex (i : Fin 112) : Fin 15348 :=
  ⟨4532+i.val, by have := i.isLt; omega⟩

theorem matches_0 : ∀ i : Fin 64,
    (fun i => FrozenReference.PhaseMatches (accepted i) (phaseIndex i)) (finOffset 112 0 64 (by decide) i) := by decide +kernel

theorem matches_64 : ∀ i : Fin 48,
    (fun i => FrozenReference.PhaseMatches (accepted i) (phaseIndex i)) (finOffset 112 64 48 (by decide) i) := by decide +kernel

theorem phase_matches : ∀ i : Fin 112, FrozenReference.PhaseMatches (accepted i) (phaseIndex i) :=
  forallFin_of_zero_offset (fun i => FrozenReference.PhaseMatches (accepted i) (phaseIndex i)) (forallFinOffset_add (fun i => FrozenReference.PhaseMatches (accepted i) (phaseIndex i)) 0 64 48 (by decide) matches_0
  matches_64)

theorem actual_duration_reference (i : Fin 112) :
    actualSchedule.duration i = (phaseUnits (phaseIndex i) : ℝ)/100000000 := by
  unfold actualSchedule checkedAcceptedSchedule
  rw [scheduleOfDurations_duration]
  exact FrozenReference.PhaseMatches.duration_eq (accepted i) grid_pos (phaseIndex i) (phase_matches i)

theorem actual_type_reference (i : Fin 112) :
    (accepted i).phase.rootType = FrozenReference.rootType (phaseIndex i) := (phase_matches i).2.2.1

theorem actual_source_reference (i : Fin 112) :
    ((accepted i).phase.sx, (accepted i).phase.sy) = phaseSource (phaseIndex i) :=
  Prod.ext (phase_matches i).2.2.2.1 (phase_matches i).2.2.2.2

theorem ordered_matches : FrozenReference.MatchesFrom 4532 ScheduleUnionBatch04532AcceptedList.phases := by
  unfold ScheduleUnionBatch04532AcceptedList.phases
  apply FrozenReference.matchesFrom_tree
  intro i
  exact ⟨(phaseIndex i).isLt, phase_matches i⟩

end NoThreeLine.ScheduleUnionBatch04532Reference

#print axioms NoThreeLine.ScheduleUnionBatch04532Reference.phase_matches
#print axioms NoThreeLine.ScheduleUnionBatch04532Reference.actual_duration_reference
#print axioms NoThreeLine.ScheduleUnionBatch04532Reference.ordered_matches
