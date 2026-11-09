import NoThreeLine.ScheduleUnionBatch11884
import NoThreeLine.UnionPhasePacket
import NoThreeLine.UnionMassScaling

/-! Actual positive-duration, integrable accepted-union phase packets for
the explicitly listed batch. The packet list retains the input order. -/
set_option autoImplicit false
set_option maxRecDepth 2048
set_option maxHeartbeats 400000
open MeasureTheory NoThreeLine.FinitePhase
noncomputable section
namespace NoThreeLine.ScheduleUnionBatch11884Packets
open ScheduleUnionBatch11884

def packet0 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw0 output0 cover0 source0
    (gridTreeUnionCheck_sound 32768 raw0 output0 cover0 source0 tree0 checked0)
    32396580 100000000 (by decide) (by decide) 3

theorem packet0_mass : packet0.mass = phaseMass0 := by
  unfold packet0
  rw [gridPhasePacket_mass,areaUnits0,phaseMass0_eq]
  norm_num

def packets : List PhasePacket := [packet0]

theorem packet_count : packets.length = 1 := rfl

theorem packet_mass_eq : packetListMass packets = batchActualMass := by
  simp only [packetListMass,packets,List.map_cons,List.map_nil]
  rw [packet0_mass]
  rfl

theorem packets_mass : packetListMass packets = (1619829/81920000000 : ℝ) :=
  packet_mass_eq.trans actual_batch_mass

theorem actual_schedule_mass :
    (packetSchedule packets).typedInputMass (fun i => (packets.get i).rootType)
      (fun i => (packets.get i).field) = (1619829/81920000000 : ℝ) :=
  (packetSchedule_mass packets).trans packets_mass

theorem shortened_schedule_mass :
    ((packetSchedule packets).scaled (249/250) (by norm_num)).typedInputMass
      (fun i => (packets.get i).rootType) (fun i => (packets.get i).field) =
        (403337421/20480000000000 : ℝ) := by
  rw [Schedule.scaled_typedInputMass,actual_schedule_mass]
  norm_num

end NoThreeLine.ScheduleUnionBatch11884Packets

#print axioms NoThreeLine.ScheduleUnionBatch11884Packets.actual_schedule_mass
#print axioms NoThreeLine.ScheduleUnionBatch11884Packets.shortened_schedule_mass
