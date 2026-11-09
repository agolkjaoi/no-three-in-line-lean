import NoThreeLine.ScheduleUnionBatch10898Data
import NoThreeLine.ArrayInputFacts

set_option autoImplicit false
set_option maxRecDepth 4096
set_option maxHeartbeats 400000
open MeasureTheory NoThreeLine.FinitePhase
namespace NoThreeLine.ScheduleUnionBatch10898

theorem treeChecked0 : tree0.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves0 : List.ofFn output0 = tree0.leaves ⟨0,32768,0,32768⟩ := by
  unfold output0
  rw [array_ofFn_getD outputData0 ⟨0,0,0,0⟩ (by decide +kernel : outputData0.size = 1068)]
  rfl

theorem areaUnits0 : gridUnionAreaUnits output0 = 260352 := by decide +kernel

end NoThreeLine.ScheduleUnionBatch10898
#print axioms NoThreeLine.ScheduleUnionBatch10898.treeLeaves0
#print axioms NoThreeLine.ScheduleUnionBatch10898.areaUnits0
