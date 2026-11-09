import NoThreeLine.ScheduleUnionBatch00000Reference
import NoThreeLine.ScheduleUnionBatch00000AcceptedList
import NoThreeLine.ReferenceLists

set_option autoImplicit false
namespace NoThreeLine.ScheduleUnionBatch00000ReferenceList
open FrozenReference ScheduleUnionBatch00000Accepted ScheduleUnionBatch00000Reference

theorem ordered_matches : MatchesFrom 0 ScheduleUnionBatch00000AcceptedList.phases := by
  unfold ScheduleUnionBatch00000AcceptedList.phases
  apply matchesFrom_tree
  intro i
  exact ⟨(phaseIndex i).isLt, phase_matches i⟩

end NoThreeLine.ScheduleUnionBatch00000ReferenceList

#print axioms NoThreeLine.ScheduleUnionBatch00000ReferenceList.ordered_matches
