import NoThreeLine.ScheduleUnionBatch00160
import NoThreeLine.UnionPhasePacket
import NoThreeLine.UnionMassScaling

/-! Actual positive-duration, integrable accepted-union phase packets for
the explicitly listed batch. The packet list retains the input order. -/
set_option autoImplicit false
set_option maxRecDepth 2048
set_option maxHeartbeats 400000
open MeasureTheory NoThreeLine.FinitePhase
noncomputable section
namespace NoThreeLine.ScheduleUnionBatch00160Packets
open ScheduleUnionBatch00160

def packet0 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw0 output0 cover0 source0
    (gridTreeUnionCheck_sound 32768 raw0 output0 cover0 source0 tree0 checked0)
    327195324 100000000 (by decide) (by decide) 0

theorem packet0_mass : packet0.mass = phaseMass0 := by
  unfold packet0
  rw [gridPhasePacket_mass,areaUnits0,phaseMass0_eq]
  norm_num

def packet1 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw1 output1 cover1 source1
    (gridTreeUnionCheck_sound 32768 raw1 output1 cover1 source1 tree1 checked1)
    320668678 100000000 (by decide) (by decide) 0

theorem packet1_mass : packet1.mass = phaseMass1 := by
  unfold packet1
  rw [gridPhasePacket_mass,areaUnits1,phaseMass1_eq]
  norm_num

def packet2 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw2 output2 cover2 source2
    (gridTreeUnionCheck_sound 32768 raw2 output2 cover2 source2 tree2 checked2)
    320668678 100000000 (by decide) (by decide) 0

theorem packet2_mass : packet2.mass = phaseMass2 := by
  unfold packet2
  rw [gridPhasePacket_mass,areaUnits2,phaseMass2_eq]
  norm_num

def packet3 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw3 output3 cover3 source3
    (gridTreeUnionCheck_sound 32768 raw3 output3 cover3 source3 tree3 checked3)
    320668678 100000000 (by decide) (by decide) 0

theorem packet3_mass : packet3.mass = phaseMass3 := by
  unfold packet3
  rw [gridPhasePacket_mass,areaUnits3,phaseMass3_eq]
  norm_num

def packet4 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw4 output4 cover4 source4
    (gridTreeUnionCheck_sound 32768 raw4 output4 cover4 source4 tree4 checked4)
    327195324 100000000 (by decide) (by decide) 0

theorem packet4_mass : packet4.mass = phaseMass4 := by
  unfold packet4
  rw [gridPhasePacket_mass,areaUnits4,phaseMass4_eq]
  norm_num

def packet5 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw5 output5 cover5 source5
    (gridTreeUnionCheck_sound 32768 raw5 output5 cover5 source5 tree5 checked5)
    327195324 100000000 (by decide) (by decide) 0

theorem packet5_mass : packet5.mass = phaseMass5 := by
  unfold packet5
  rw [gridPhasePacket_mass,areaUnits5,phaseMass5_eq]
  norm_num

def packet6 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw6 output6 cover6 source6
    (gridTreeUnionCheck_sound 32768 raw6 output6 cover6 source6 tree6 checked6)
    327195324 100000000 (by decide) (by decide) 0

theorem packet6_mass : packet6.mass = phaseMass6 := by
  unfold packet6
  rw [gridPhasePacket_mass,areaUnits6,phaseMass6_eq]
  norm_num

def packet7 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw7 output7 cover7 source7
    (gridTreeUnionCheck_sound 32768 raw7 output7 cover7 source7 tree7 checked7)
    320668678 100000000 (by decide) (by decide) 0

theorem packet7_mass : packet7.mass = phaseMass7 := by
  unfold packet7
  rw [gridPhasePacket_mass,areaUnits7,phaseMass7_eq]
  norm_num

def packet8 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw8 output8 cover8 source8
    (gridTreeUnionCheck_sound 32768 raw8 output8 cover8 source8 tree8 checked8)
    320668678 100000000 (by decide) (by decide) 0

theorem packet8_mass : packet8.mass = phaseMass8 := by
  unfold packet8
  rw [gridPhasePacket_mass,areaUnits8,phaseMass8_eq]
  norm_num

def packet9 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw9 output9 cover9 source9
    (gridTreeUnionCheck_sound 32768 raw9 output9 cover9 source9 tree9 checked9)
    320668678 100000000 (by decide) (by decide) 0

theorem packet9_mass : packet9.mass = phaseMass9 := by
  unfold packet9
  rw [gridPhasePacket_mass,areaUnits9,phaseMass9_eq]
  norm_num

def packet10 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw10 output10 cover10 source10
    (gridTreeUnionCheck_sound 32768 raw10 output10 cover10 source10 tree10 checked10)
    320668678 100000000 (by decide) (by decide) 0

theorem packet10_mass : packet10.mass = phaseMass10 := by
  unfold packet10
  rw [gridPhasePacket_mass,areaUnits10,phaseMass10_eq]
  norm_num

def packet11 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw11 output11 cover11 source11
    (gridTreeUnionCheck_sound 32768 raw11 output11 cover11 source11 tree11 checked11)
    320668678 100000000 (by decide) (by decide) 0

theorem packet11_mass : packet11.mass = phaseMass11 := by
  unfold packet11
  rw [gridPhasePacket_mass,areaUnits11,phaseMass11_eq]
  norm_num

def packet12 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw12 output12 cover12 source12
    (gridTreeUnionCheck_sound 32768 raw12 output12 cover12 source12 tree12 checked12)
    320668678 100000000 (by decide) (by decide) 0

theorem packet12_mass : packet12.mass = phaseMass12 := by
  unfold packet12
  rw [gridPhasePacket_mass,areaUnits12,phaseMass12_eq]
  norm_num

def packet13 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw13 output13 cover13 source13
    (gridTreeUnionCheck_sound 32768 raw13 output13 cover13 source13 tree13 checked13)
    320668678 100000000 (by decide) (by decide) 0

theorem packet13_mass : packet13.mass = phaseMass13 := by
  unfold packet13
  rw [gridPhasePacket_mass,areaUnits13,phaseMass13_eq]
  norm_num

def packet14 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw14 output14 cover14 source14
    (gridTreeUnionCheck_sound 32768 raw14 output14 cover14 source14 tree14 checked14)
    320668678 100000000 (by decide) (by decide) 0

theorem packet14_mass : packet14.mass = phaseMass14 := by
  unfold packet14
  rw [gridPhasePacket_mass,areaUnits14,phaseMass14_eq]
  norm_num

def packet15 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw15 output15 cover15 source15
    (gridTreeUnionCheck_sound 32768 raw15 output15 cover15 source15 tree15 checked15)
    320668678 100000000 (by decide) (by decide) 0

theorem packet15_mass : packet15.mass = phaseMass15 := by
  unfold packet15
  rw [gridPhasePacket_mass,areaUnits15,phaseMass15_eq]
  norm_num

def packet16 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw16 output16 cover16 source16
    (gridTreeUnionCheck_sound 32768 raw16 output16 cover16 source16 tree16 checked16)
    320668678 100000000 (by decide) (by decide) 0

theorem packet16_mass : packet16.mass = phaseMass16 := by
  unfold packet16
  rw [gridPhasePacket_mass,areaUnits16,phaseMass16_eq]
  norm_num

def packet17 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw17 output17 cover17 source17
    (gridTreeUnionCheck_sound 32768 raw17 output17 cover17 source17 tree17 checked17)
    320668678 100000000 (by decide) (by decide) 0

theorem packet17_mass : packet17.mass = phaseMass17 := by
  unfold packet17
  rw [gridPhasePacket_mass,areaUnits17,phaseMass17_eq]
  norm_num

def packet18 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw18 output18 cover18 source18
    (gridTreeUnionCheck_sound 32768 raw18 output18 cover18 source18 tree18 checked18)
    320668678 100000000 (by decide) (by decide) 0

theorem packet18_mass : packet18.mass = phaseMass18 := by
  unfold packet18
  rw [gridPhasePacket_mass,areaUnits18,phaseMass18_eq]
  norm_num

def packet19 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw19 output19 cover19 source19
    (gridTreeUnionCheck_sound 32768 raw19 output19 cover19 source19 tree19 checked19)
    320668678 100000000 (by decide) (by decide) 0

theorem packet19_mass : packet19.mass = phaseMass19 := by
  unfold packet19
  rw [gridPhasePacket_mass,areaUnits19,phaseMass19_eq]
  norm_num

def packet20 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw20 output20 cover20 source20
    (gridTreeUnionCheck_sound 32768 raw20 output20 cover20 source20 tree20 checked20)
    320668678 100000000 (by decide) (by decide) 0

theorem packet20_mass : packet20.mass = phaseMass20 := by
  unfold packet20
  rw [gridPhasePacket_mass,areaUnits20,phaseMass20_eq]
  norm_num

def packet21 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw21 output21 cover21 source21
    (gridTreeUnionCheck_sound 32768 raw21 output21 cover21 source21 tree21 checked21)
    320668678 100000000 (by decide) (by decide) 0

theorem packet21_mass : packet21.mass = phaseMass21 := by
  unfold packet21
  rw [gridPhasePacket_mass,areaUnits21,phaseMass21_eq]
  norm_num

def packet22 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw22 output22 cover22 source22
    (gridTreeUnionCheck_sound 32768 raw22 output22 cover22 source22 tree22 checked22)
    320668678 100000000 (by decide) (by decide) 0

theorem packet22_mass : packet22.mass = phaseMass22 := by
  unfold packet22
  rw [gridPhasePacket_mass,areaUnits22,phaseMass22_eq]
  norm_num

def packet23 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw23 output23 cover23 source23
    (gridTreeUnionCheck_sound 32768 raw23 output23 cover23 source23 tree23 checked23)
    320668678 100000000 (by decide) (by decide) 0

theorem packet23_mass : packet23.mass = phaseMass23 := by
  unfold packet23
  rw [gridPhasePacket_mass,areaUnits23,phaseMass23_eq]
  norm_num

def packet24 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw24 output24 cover24 source24
    (gridTreeUnionCheck_sound 32768 raw24 output24 cover24 source24 tree24 checked24)
    320668678 100000000 (by decide) (by decide) 0

theorem packet24_mass : packet24.mass = phaseMass24 := by
  unfold packet24
  rw [gridPhasePacket_mass,areaUnits24,phaseMass24_eq]
  norm_num

def packet25 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw25 output25 cover25 source25
    (gridTreeUnionCheck_sound 32768 raw25 output25 cover25 source25 tree25 checked25)
    320668678 100000000 (by decide) (by decide) 0

theorem packet25_mass : packet25.mass = phaseMass25 := by
  unfold packet25
  rw [gridPhasePacket_mass,areaUnits25,phaseMass25_eq]
  norm_num

def packet26 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw26 output26 cover26 source26
    (gridTreeUnionCheck_sound 32768 raw26 output26 cover26 source26 tree26 checked26)
    320668678 100000000 (by decide) (by decide) 0

theorem packet26_mass : packet26.mass = phaseMass26 := by
  unfold packet26
  rw [gridPhasePacket_mass,areaUnits26,phaseMass26_eq]
  norm_num

def packet27 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw27 output27 cover27 source27
    (gridTreeUnionCheck_sound 32768 raw27 output27 cover27 source27 tree27 checked27)
    320668678 100000000 (by decide) (by decide) 0

theorem packet27_mass : packet27.mass = phaseMass27 := by
  unfold packet27
  rw [gridPhasePacket_mass,areaUnits27,phaseMass27_eq]
  norm_num

def packet28 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw28 output28 cover28 source28
    (gridTreeUnionCheck_sound 32768 raw28 output28 cover28 source28 tree28 checked28)
    543338492 100000000 (by decide) (by decide) 0

theorem packet28_mass : packet28.mass = phaseMass28 := by
  unfold packet28
  rw [gridPhasePacket_mass,areaUnits28,phaseMass28_eq]
  norm_num

def packet29 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw29 output29 cover29 source29
    (gridTreeUnionCheck_sound 32768 raw29 output29 cover29 source29 tree29 checked29)
    543338492 100000000 (by decide) (by decide) 0

theorem packet29_mass : packet29.mass = phaseMass29 := by
  unfold packet29
  rw [gridPhasePacket_mass,areaUnits29,phaseMass29_eq]
  norm_num

def packet30 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw30 output30 cover30 source30
    (gridTreeUnionCheck_sound 32768 raw30 output30 cover30 source30 tree30 checked30)
    320668678 100000000 (by decide) (by decide) 0

theorem packet30_mass : packet30.mass = phaseMass30 := by
  unfold packet30
  rw [gridPhasePacket_mass,areaUnits30,phaseMass30_eq]
  norm_num

def packet31 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw31 output31 cover31 source31
    (gridTreeUnionCheck_sound 32768 raw31 output31 cover31 source31 tree31 checked31)
    320668678 100000000 (by decide) (by decide) 0

theorem packet31_mass : packet31.mass = phaseMass31 := by
  unfold packet31
  rw [gridPhasePacket_mass,areaUnits31,phaseMass31_eq]
  norm_num

def packets : List PhasePacket := [packet0,packet1,packet2,packet3,packet4,packet5,packet6,packet7,packet8,packet9,packet10,packet11,packet12,packet13,packet14,packet15,packet16,packet17,packet18,packet19,packet20,packet21,packet22,packet23,packet24,packet25,packet26,packet27,packet28,packet29,packet30,packet31]

theorem packet_count : packets.length = 32 := rfl

theorem packet_mass_eq : packetListMass packets = batchActualMass := by
  simp only [packetListMass,packets,List.map_cons,List.map_nil]
  rw [packet0_mass,packet1_mass,packet2_mass,packet3_mass,packet4_mass,packet5_mass,packet6_mass,packet7_mass,packet8_mass,packet9_mass,packet10_mass,packet11_mass,packet12_mass,packet13_mass,packet14_mass,packet15_mass,packet16_mass,packet17_mass,packet18_mass,packet19_mass,packet20_mass,packet21_mass,packet22_mass,packet23_mass,packet24_mass,packet25_mass,packet26_mass,packet27_mass,packet28_mass,packet29_mass,packet30_mass,packet31_mass]
  rfl

theorem packets_mass : packetListMass packets = (2362542299/409600000000 : ℝ) :=
  packet_mass_eq.trans actual_batch_mass

theorem actual_schedule_mass :
    (packetSchedule packets).typedInputMass (fun i => (packets.get i).rootType)
      (fun i => (packets.get i).field) = (2362542299/409600000000 : ℝ) :=
  (packetSchedule_mass packets).trans packets_mass

theorem shortened_schedule_mass :
    ((packetSchedule packets).scaled (249/250) (by norm_num)).typedInputMass
      (fun i => (packets.get i).rootType) (fun i => (packets.get i).field) =
        (588273032451/102400000000000 : ℝ) := by
  rw [Schedule.scaled_typedInputMass,actual_schedule_mass]
  norm_num

end NoThreeLine.ScheduleUnionBatch00160Packets

#print axioms NoThreeLine.ScheduleUnionBatch00160Packets.actual_schedule_mass
#print axioms NoThreeLine.ScheduleUnionBatch00160Packets.shortened_schedule_mass
