import NoThreeLine.ScheduleUnionBatch15301Accepted
import NoThreeLine.AcceptedPacketList

set_option autoImplicit false
open NoThreeLine.FinitePhase
noncomputable section
namespace NoThreeLine.ScheduleUnionBatch15301AcceptedList
open ScheduleUnionBatch15301Accepted

def phases : List (CheckedAcceptedPhase 32768 8) := acceptedData.toList

theorem phase_count : phases.length = 47 := FiniteInputTree.length_toList acceptedData

theorem phases_mass : acceptedListMass phases grid_pos = (3346515609677/838860800000000 : ℝ) := by
  unfold acceptedListMass phases
  rw [acceptedData_list]
  simp only [List.map_cons, List.map_nil]
  rw [accepted0_mass,accepted1_mass,accepted2_mass,accepted3_mass,accepted4_mass,accepted5_mass,accepted6_mass,accepted7_mass,accepted8_mass,accepted9_mass,accepted10_mass,accepted11_mass,accepted12_mass,accepted13_mass,accepted14_mass,accepted15_mass,accepted16_mass,accepted17_mass,accepted18_mass,accepted19_mass,accepted20_mass,accepted21_mass,accepted22_mass,accepted23_mass,accepted24_mass,accepted25_mass,accepted26_mass,accepted27_mass,accepted28_mass,accepted29_mass,accepted30_mass,accepted31_mass,accepted32_mass,accepted33_mass,accepted34_mass,accepted35_mass,accepted36_mass,accepted37_mass,accepted38_mass,accepted39_mass,accepted40_mass,accepted41_mass,accepted42_mass,accepted43_mass,accepted44_mass,accepted45_mass,accepted46_mass]
  exact ScheduleUnionBatch15301.actual_batch_mass

theorem actual_schedule_mass :
    (acceptedListSchedule phases grid_pos).typedInputMass (fun j => (phases.get j).phase.rootType)
      (fun j => ((phases.get j).toPacket grid_pos).field) = (3346515609677/838860800000000 : ℝ) :=
  (acceptedListSchedule_mass phases grid_pos).trans phases_mass

end NoThreeLine.ScheduleUnionBatch15301AcceptedList

#print axioms NoThreeLine.ScheduleUnionBatch15301AcceptedList.actual_schedule_mass
