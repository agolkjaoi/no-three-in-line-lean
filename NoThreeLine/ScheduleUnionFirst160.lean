import NoThreeLine.ScheduleUnionBatch00000Packets
import NoThreeLine.ScheduleUnionBatch00032Packets

/-! One actual chronological schedule for literal phases 0 through 159,
formed by concatenating the two verified packet lists in input order. -/
set_option autoImplicit false
open NoThreeLine.FinitePhase
noncomputable section
namespace NoThreeLine.ScheduleUnionFirst160

def packets : List PhasePacket :=
  ScheduleUnionBatch00000Packets.packets ++ ScheduleUnionBatch00032Packets.packets

theorem phase_count : packets.length = 160 := by
  rw [packets,List.length_append,ScheduleUnionBatch00000Packets.packet_count,
    ScheduleUnionBatch00032Packets.packet_count]

theorem packets_mass : packetListMass packets = (36396254159/1638400000000 : ℝ) := by
  rw [packets,packetListMass_append,ScheduleUnionBatch00000Packets.packets_mass,
    ScheduleUnionBatch00032Packets.packets_mass]
  norm_num

theorem actual_schedule_mass :
    (packetSchedule packets).typedInputMass (fun i => (packets.get i).rootType)
      (fun i => (packets.get i).field) = (36396254159/1638400000000 : ℝ) :=
  (packetSchedule_mass packets).trans packets_mass

theorem shortened_schedule_mass :
    ((packetSchedule packets).scaled (249/250) (by norm_num)).typedInputMass
      (fun i => (packets.get i).rootType) (fun i => (packets.get i).field) =
        (9062667285591/409600000000000 : ℝ) := by
  rw [Schedule.scaled_typedInputMass,actual_schedule_mass]
  norm_num

end NoThreeLine.ScheduleUnionFirst160

#print axioms NoThreeLine.ScheduleUnionFirst160.actual_schedule_mass
#print axioms NoThreeLine.ScheduleUnionFirst160.shortened_schedule_mass
