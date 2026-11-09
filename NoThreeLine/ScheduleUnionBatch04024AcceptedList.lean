import NoThreeLine.ScheduleUnionBatch04024Accepted
import NoThreeLine.AcceptedPacketList

set_option autoImplicit false
open NoThreeLine.FinitePhase
noncomputable section
namespace NoThreeLine.ScheduleUnionBatch04024AcceptedList
open ScheduleUnionBatch04024Accepted

def phases : List (CheckedAcceptedPhase 32768 8) := acceptedData.toList

theorem phase_count : phases.length = 128 := FiniteInputTree.length_toList acceptedData

theorem phases_mass : acceptedListMass phases grid_pos = (20100593177/1638400000000 : ℝ) := by
  unfold acceptedListMass phases
  rw [acceptedData_list]
  simp only [List.map_cons, List.map_nil]
  rw [accepted0_mass,accepted1_mass,accepted2_mass,accepted3_mass,accepted4_mass,accepted5_mass,accepted6_mass,accepted7_mass,accepted8_mass,accepted9_mass,accepted10_mass,accepted11_mass,accepted12_mass,accepted13_mass,accepted14_mass,accepted15_mass,accepted16_mass,accepted17_mass,accepted18_mass,accepted19_mass,accepted20_mass,accepted21_mass,accepted22_mass,accepted23_mass,accepted24_mass,accepted25_mass,accepted26_mass,accepted27_mass,accepted28_mass,accepted29_mass,accepted30_mass,accepted31_mass,accepted32_mass,accepted33_mass,accepted34_mass,accepted35_mass,accepted36_mass,accepted37_mass,accepted38_mass,accepted39_mass,accepted40_mass,accepted41_mass,accepted42_mass,accepted43_mass,accepted44_mass,accepted45_mass,accepted46_mass,accepted47_mass,accepted48_mass,accepted49_mass,accepted50_mass,accepted51_mass,accepted52_mass,accepted53_mass,accepted54_mass,accepted55_mass,accepted56_mass,accepted57_mass,accepted58_mass,accepted59_mass,accepted60_mass,accepted61_mass,accepted62_mass,accepted63_mass,accepted64_mass,accepted65_mass,accepted66_mass,accepted67_mass,accepted68_mass,accepted69_mass,accepted70_mass,accepted71_mass,accepted72_mass,accepted73_mass,accepted74_mass,accepted75_mass,accepted76_mass,accepted77_mass,accepted78_mass,accepted79_mass,accepted80_mass,accepted81_mass,accepted82_mass,accepted83_mass,accepted84_mass,accepted85_mass,accepted86_mass,accepted87_mass,accepted88_mass,accepted89_mass,accepted90_mass,accepted91_mass,accepted92_mass,accepted93_mass,accepted94_mass,accepted95_mass,accepted96_mass,accepted97_mass,accepted98_mass,accepted99_mass,accepted100_mass,accepted101_mass,accepted102_mass,accepted103_mass,accepted104_mass,accepted105_mass,accepted106_mass,accepted107_mass,accepted108_mass,accepted109_mass,accepted110_mass,accepted111_mass,accepted112_mass,accepted113_mass,accepted114_mass,accepted115_mass,accepted116_mass,accepted117_mass,accepted118_mass,accepted119_mass,accepted120_mass,accepted121_mass,accepted122_mass,accepted123_mass,accepted124_mass,accepted125_mass,accepted126_mass,accepted127_mass]
  exact ScheduleUnionBatch04024.actual_batch_mass

theorem actual_schedule_mass :
    (acceptedListSchedule phases grid_pos).typedInputMass (fun j => (phases.get j).phase.rootType)
      (fun j => ((phases.get j).toPacket grid_pos).field) = (20100593177/1638400000000 : ℝ) :=
  (acceptedListSchedule_mass phases grid_pos).trans phases_mass

end NoThreeLine.ScheduleUnionBatch04024AcceptedList

#print axioms NoThreeLine.ScheduleUnionBatch04024AcceptedList.actual_schedule_mass
