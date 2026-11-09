import NoThreeLine.ScheduleUnionFirst160
import NoThreeLine.ScheduleUnionBatch00160Packets

/-! The actual chronological schedule for the first 192 literal phases.
This is a bounded prefix, not the complete 15348-phase schedule. -/
set_option autoImplicit false
open NoThreeLine.FinitePhase
noncomputable section
namespace NoThreeLine.ScheduleUnionFirst192

def packets : List PhasePacket :=
  ScheduleUnionFirst160.packets ++ ScheduleUnionBatch00160Packets.packets

theorem phase_count : packets.length = 192 := by
  rw [packets, List.length_append, ScheduleUnionFirst160.phase_count,
    ScheduleUnionBatch00160Packets.packet_count]

theorem packets_mass : packetListMass packets = (9169284671/327680000000 : ℝ) := by
  rw [packets, packetListMass_append, ScheduleUnionFirst160.packets_mass,
    ScheduleUnionBatch00160Packets.packets_mass]
  norm_num

theorem actual_schedule_mass :
    (packetSchedule packets).typedInputMass (fun i => (packets.get i).rootType)
      (fun i => (packets.get i).field) = (9169284671/327680000000 : ℝ) :=
  (packetSchedule_mass packets).trans packets_mass

theorem shortened_schedule_mass :
    ((packetSchedule packets).scaled (249/250) (by norm_num)).typedInputMass
      (fun i => (packets.get i).rootType) (fun i => (packets.get i).field) =
        (2283151883079/81920000000000 : ℝ) := by
  rw [Schedule.scaled_typedInputMass, actual_schedule_mass]
  norm_num

end NoThreeLine.ScheduleUnionFirst192

#print axioms NoThreeLine.ScheduleUnionFirst192.actual_schedule_mass
#print axioms NoThreeLine.ScheduleUnionFirst192.shortened_schedule_mass
