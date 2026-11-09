import NoThreeLine.ScheduleUnionBatch10898Meta
import NoThreeLine.ScheduleUnionBatch10898Cover
import NoThreeLine.ScheduleUnionBatch10898Tree

set_option autoImplicit false
set_option maxRecDepth 4096
set_option maxHeartbeats 400000
open MeasureTheory NoThreeLine.FinitePhase
namespace NoThreeLine.ScheduleUnionBatch10898

theorem checked0 : gridTreeUnionCheck 32768 raw0 output0 cover0 source0 tree0 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨fun i => (sourceCover0 i).1,fun i => (sourceCover0 i).2,treeChecked0,treeLeaves0⟩

noncomputable def phaseMass0 : ℝ := singlePhaseMass (27765579/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw0 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass0_eq : phaseMass0 = (28237593843/1677721600000000 : ℝ) := by
  unfold phaseMass0
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw0 output0 cover0 source0
    (gridTreeUnionCheck_sound 32768 raw0 output0 cover0 source0 tree0 checked0)
    _ (by norm_num) _,areaUnits0]
  norm_num

noncomputable def batchActualMass : ℝ := [phaseMass0].sum

theorem actual_batch_mass : batchActualMass = (28237593843/1677721600000000 : ℝ) := by
  unfold batchActualMass
  rw [phaseMass0_eq]
  norm_num

end NoThreeLine.ScheduleUnionBatch10898

#print axioms NoThreeLine.ScheduleUnionBatch10898.actual_batch_mass
