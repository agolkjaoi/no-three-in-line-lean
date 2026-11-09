import NoThreeLine.ScheduleUnionBatch00032
import NoThreeLine.UnionPhasePacket
import NoThreeLine.UnionMassScaling

/-! Actual positive-duration, integrable accepted-union phase packets for
the explicitly listed batch. The packet list retains the input order. -/
set_option autoImplicit false
set_option maxRecDepth 2048
set_option maxHeartbeats 400000
open MeasureTheory NoThreeLine.FinitePhase
noncomputable section
namespace NoThreeLine.ScheduleUnionBatch00032Packets
open ScheduleUnionBatch00032

def packet0 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw0 output0 cover0 source0
    (gridTreeUnionCheck_sound 32768 raw0 output0 cover0 source0 tree0 checked0)
    314864438 100000000 (by decide) (by decide) 0

theorem packet0_mass : packet0.mass = phaseMass0 := by
  unfold packet0
  rw [gridPhasePacket_mass,areaUnits0,phaseMass0_eq]
  norm_num

def packet1 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw1 output1 cover1 source1
    (gridTreeUnionCheck_sound 32768 raw1 output1 cover1 source1 tree1 checked1)
    314864438 100000000 (by decide) (by decide) 0

theorem packet1_mass : packet1.mass = phaseMass1 := by
  unfold packet1
  rw [gridPhasePacket_mass,areaUnits1,phaseMass1_eq]
  norm_num

def packet2 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw2 output2 cover2 source2
    (gridTreeUnionCheck_sound 32768 raw2 output2 cover2 source2 tree2 checked2)
    148355083 100000000 (by decide) (by decide) 0

theorem packet2_mass : packet2.mass = phaseMass2 := by
  unfold packet2
  rw [gridPhasePacket_mass,areaUnits2,phaseMass2_eq]
  norm_num

def packet3 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw3 output3 cover3 source3
    (gridTreeUnionCheck_sound 32768 raw3 output3 cover3 source3 tree3 checked3)
    246335762 100000000 (by decide) (by decide) 0

theorem packet3_mass : packet3.mass = phaseMass3 := by
  unfold packet3
  rw [gridPhasePacket_mass,areaUnits3,phaseMass3_eq]
  norm_num

def packet4 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw4 output4 cover4 source4
    (gridTreeUnionCheck_sound 32768 raw4 output4 cover4 source4 tree4 checked4)
    246335762 100000000 (by decide) (by decide) 0

theorem packet4_mass : packet4.mass = phaseMass4 := by
  unfold packet4
  rw [gridPhasePacket_mass,areaUnits4,phaseMass4_eq]
  norm_num

def packet5 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw5 output5 cover5 source5
    (gridTreeUnionCheck_sound 32768 raw5 output5 cover5 source5 tree5 checked5)
    314864438 100000000 (by decide) (by decide) 0

theorem packet5_mass : packet5.mass = phaseMass5 := by
  unfold packet5
  rw [gridPhasePacket_mass,areaUnits5,phaseMass5_eq]
  norm_num

def packet6 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw6 output6 cover6 source6
    (gridTreeUnionCheck_sound 32768 raw6 output6 cover6 source6 tree6 checked6)
    246335762 100000000 (by decide) (by decide) 0

theorem packet6_mass : packet6.mass = phaseMass6 := by
  unfold packet6
  rw [gridPhasePacket_mass,areaUnits6,phaseMass6_eq]
  norm_num

def packet7 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw7 output7 cover7 source7
    (gridTreeUnionCheck_sound 32768 raw7 output7 cover7 source7 tree7 checked7)
    246335762 100000000 (by decide) (by decide) 0

theorem packet7_mass : packet7.mass = phaseMass7 := by
  unfold packet7
  rw [gridPhasePacket_mass,areaUnits7,phaseMass7_eq]
  norm_num

def packet8 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw8 output8 cover8 source8
    (gridTreeUnionCheck_sound 32768 raw8 output8 cover8 source8 tree8 checked8)
    246335762 100000000 (by decide) (by decide) 0

theorem packet8_mass : packet8.mass = phaseMass8 := by
  unfold packet8
  rw [gridPhasePacket_mass,areaUnits8,phaseMass8_eq]
  norm_num

def packet9 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw9 output9 cover9 source9
    (gridTreeUnionCheck_sound 32768 raw9 output9 cover9 source9 tree9 checked9)
    246335762 100000000 (by decide) (by decide) 0

theorem packet9_mass : packet9.mass = phaseMass9 := by
  unfold packet9
  rw [gridPhasePacket_mass,areaUnits9,phaseMass9_eq]
  norm_num

def packet10 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw10 output10 cover10 source10
    (gridTreeUnionCheck_sound 32768 raw10 output10 cover10 source10 tree10 checked10)
    246335762 100000000 (by decide) (by decide) 0

theorem packet10_mass : packet10.mass = phaseMass10 := by
  unfold packet10
  rw [gridPhasePacket_mass,areaUnits10,phaseMass10_eq]
  norm_num

def packet11 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw11 output11 cover11 source11
    (gridTreeUnionCheck_sound 32768 raw11 output11 cover11 source11 tree11 checked11)
    246335762 100000000 (by decide) (by decide) 0

theorem packet11_mass : packet11.mass = phaseMass11 := by
  unfold packet11
  rw [gridPhasePacket_mass,areaUnits11,phaseMass11_eq]
  norm_num

def packet12 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw12 output12 cover12 source12
    (gridTreeUnionCheck_sound 32768 raw12 output12 cover12 source12 tree12 checked12)
    246335762 100000000 (by decide) (by decide) 0

theorem packet12_mass : packet12.mass = phaseMass12 := by
  unfold packet12
  rw [gridPhasePacket_mass,areaUnits12,phaseMass12_eq]
  norm_num

def packet13 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw13 output13 cover13 source13
    (gridTreeUnionCheck_sound 32768 raw13 output13 cover13 source13 tree13 checked13)
    246335762 100000000 (by decide) (by decide) 0

theorem packet13_mass : packet13.mass = phaseMass13 := by
  unfold packet13
  rw [gridPhasePacket_mass,areaUnits13,phaseMass13_eq]
  norm_num

def packet14 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw14 output14 cover14 source14
    (gridTreeUnionCheck_sound 32768 raw14 output14 cover14 source14 tree14 checked14)
    246335762 100000000 (by decide) (by decide) 0

theorem packet14_mass : packet14.mass = phaseMass14 := by
  unfold packet14
  rw [gridPhasePacket_mass,areaUnits14,phaseMass14_eq]
  norm_num

def packet15 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw15 output15 cover15 source15
    (gridTreeUnionCheck_sound 32768 raw15 output15 cover15 source15 tree15 checked15)
    246335762 100000000 (by decide) (by decide) 0

theorem packet15_mass : packet15.mass = phaseMass15 := by
  unfold packet15
  rw [gridPhasePacket_mass,areaUnits15,phaseMass15_eq]
  norm_num

def packet16 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw16 output16 cover16 source16
    (gridTreeUnionCheck_sound 32768 raw16 output16 cover16 source16 tree16 checked16)
    246335762 100000000 (by decide) (by decide) 0

theorem packet16_mass : packet16.mass = phaseMass16 := by
  unfold packet16
  rw [gridPhasePacket_mass,areaUnits16,phaseMass16_eq]
  norm_num

def packet17 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw17 output17 cover17 source17
    (gridTreeUnionCheck_sound 32768 raw17 output17 cover17 source17 tree17 checked17)
    246335762 100000000 (by decide) (by decide) 0

theorem packet17_mass : packet17.mass = phaseMass17 := by
  unfold packet17
  rw [gridPhasePacket_mass,areaUnits17,phaseMass17_eq]
  norm_num

def packet18 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw18 output18 cover18 source18
    (gridTreeUnionCheck_sound 32768 raw18 output18 cover18 source18 tree18 checked18)
    246335762 100000000 (by decide) (by decide) 0

theorem packet18_mass : packet18.mass = phaseMass18 := by
  unfold packet18
  rw [gridPhasePacket_mass,areaUnits18,phaseMass18_eq]
  norm_num

def packet19 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw19 output19 cover19 source19
    (gridTreeUnionCheck_sound 32768 raw19 output19 cover19 source19 tree19 checked19)
    246335762 100000000 (by decide) (by decide) 0

theorem packet19_mass : packet19.mass = phaseMass19 := by
  unfold packet19
  rw [gridPhasePacket_mass,areaUnits19,phaseMass19_eq]
  norm_num

def packet20 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw20 output20 cover20 source20
    (gridTreeUnionCheck_sound 32768 raw20 output20 cover20 source20 tree20 checked20)
    246335762 100000000 (by decide) (by decide) 0

theorem packet20_mass : packet20.mass = phaseMass20 := by
  unfold packet20
  rw [gridPhasePacket_mass,areaUnits20,phaseMass20_eq]
  norm_num

def packet21 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw21 output21 cover21 source21
    (gridTreeUnionCheck_sound 32768 raw21 output21 cover21 source21 tree21 checked21)
    246335762 100000000 (by decide) (by decide) 0

theorem packet21_mass : packet21.mass = phaseMass21 := by
  unfold packet21
  rw [gridPhasePacket_mass,areaUnits21,phaseMass21_eq]
  norm_num

def packet22 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw22 output22 cover22 source22
    (gridTreeUnionCheck_sound 32768 raw22 output22 cover22 source22 tree22 checked22)
    246335762 100000000 (by decide) (by decide) 0

theorem packet22_mass : packet22.mass = phaseMass22 := by
  unfold packet22
  rw [gridPhasePacket_mass,areaUnits22,phaseMass22_eq]
  norm_num

def packet23 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw23 output23 cover23 source23
    (gridTreeUnionCheck_sound 32768 raw23 output23 cover23 source23 tree23 checked23)
    246335762 100000000 (by decide) (by decide) 0

theorem packet23_mass : packet23.mass = phaseMass23 := by
  unfold packet23
  rw [gridPhasePacket_mass,areaUnits23,phaseMass23_eq]
  norm_num

def packet24 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw24 output24 cover24 source24
    (gridTreeUnionCheck_sound 32768 raw24 output24 cover24 source24 tree24 checked24)
    246335762 100000000 (by decide) (by decide) 0

theorem packet24_mass : packet24.mass = phaseMass24 := by
  unfold packet24
  rw [gridPhasePacket_mass,areaUnits24,phaseMass24_eq]
  norm_num

def packet25 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw25 output25 cover25 source25
    (gridTreeUnionCheck_sound 32768 raw25 output25 cover25 source25 tree25 checked25)
    246335762 100000000 (by decide) (by decide) 0

theorem packet25_mass : packet25.mass = phaseMass25 := by
  unfold packet25
  rw [gridPhasePacket_mass,areaUnits25,phaseMass25_eq]
  norm_num

def packet26 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw26 output26 cover26 source26
    (gridTreeUnionCheck_sound 32768 raw26 output26 cover26 source26 tree26 checked26)
    246335762 100000000 (by decide) (by decide) 0

theorem packet26_mass : packet26.mass = phaseMass26 := by
  unfold packet26
  rw [gridPhasePacket_mass,areaUnits26,phaseMass26_eq]
  norm_num

def packet27 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw27 output27 cover27 source27
    (gridTreeUnionCheck_sound 32768 raw27 output27 cover27 source27 tree27 checked27)
    246335762 100000000 (by decide) (by decide) 0

theorem packet27_mass : packet27.mass = phaseMass27 := by
  unfold packet27
  rw [gridPhasePacket_mass,areaUnits27,phaseMass27_eq]
  norm_num

def packet28 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw28 output28 cover28 source28
    (gridTreeUnionCheck_sound 32768 raw28 output28 cover28 source28 tree28 checked28)
    246335762 100000000 (by decide) (by decide) 0

theorem packet28_mass : packet28.mass = phaseMass28 := by
  unfold packet28
  rw [gridPhasePacket_mass,areaUnits28,phaseMass28_eq]
  norm_num

def packet29 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw29 output29 cover29 source29
    (gridTreeUnionCheck_sound 32768 raw29 output29 cover29 source29 tree29 checked29)
    294935223 100000000 (by decide) (by decide) 0

theorem packet29_mass : packet29.mass = phaseMass29 := by
  unfold packet29
  rw [gridPhasePacket_mass,areaUnits29,phaseMass29_eq]
  norm_num

def packet30 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw30 output30 cover30 source30
    (gridTreeUnionCheck_sound 32768 raw30 output30 cover30 source30 tree30 checked30)
    294935223 100000000 (by decide) (by decide) 0

theorem packet30_mass : packet30.mass = phaseMass30 := by
  unfold packet30
  rw [gridPhasePacket_mass,areaUnits30,phaseMass30_eq]
  norm_num

def packet31 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw31 output31 cover31 source31
    (gridTreeUnionCheck_sound 32768 raw31 output31 cover31 source31 tree31 checked31)
    246335762 100000000 (by decide) (by decide) 0

theorem packet31_mass : packet31.mass = phaseMass31 := by
  unfold packet31
  rw [gridPhasePacket_mass,areaUnits31,phaseMass31_eq]
  norm_num

def packet32 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw32 output32 cover32 source32
    (gridTreeUnionCheck_sound 32768 raw32 output32 cover32 source32 tree32 checked32)
    294935223 100000000 (by decide) (by decide) 0

theorem packet32_mass : packet32.mass = phaseMass32 := by
  unfold packet32
  rw [gridPhasePacket_mass,areaUnits32,phaseMass32_eq]
  norm_num

def packet33 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw33 output33 cover33 source33
    (gridTreeUnionCheck_sound 32768 raw33 output33 cover33 source33 tree33 checked33)
    294935223 100000000 (by decide) (by decide) 0

theorem packet33_mass : packet33.mass = phaseMass33 := by
  unfold packet33
  rw [gridPhasePacket_mass,areaUnits33,phaseMass33_eq]
  norm_num

def packet34 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw34 output34 cover34 source34
    (gridTreeUnionCheck_sound 32768 raw34 output34 cover34 source34 tree34 checked34)
    294935223 100000000 (by decide) (by decide) 0

theorem packet34_mass : packet34.mass = phaseMass34 := by
  unfold packet34
  rw [gridPhasePacket_mass,areaUnits34,phaseMass34_eq]
  norm_num

def packet35 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw35 output35 cover35 source35
    (gridTreeUnionCheck_sound 32768 raw35 output35 cover35 source35 tree35 checked35)
    255265193 100000000 (by decide) (by decide) 0

theorem packet35_mass : packet35.mass = phaseMass35 := by
  unfold packet35
  rw [gridPhasePacket_mass,areaUnits35,phaseMass35_eq]
  norm_num

def packet36 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw36 output36 cover36 source36
    (gridTreeUnionCheck_sound 32768 raw36 output36 cover36 source36 tree36 checked36)
    255265193 100000000 (by decide) (by decide) 0

theorem packet36_mass : packet36.mass = phaseMass36 := by
  unfold packet36
  rw [gridPhasePacket_mass,areaUnits36,phaseMass36_eq]
  norm_num

def packet37 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw37 output37 cover37 source37
    (gridTreeUnionCheck_sound 32768 raw37 output37 cover37 source37 tree37 checked37)
    294935223 100000000 (by decide) (by decide) 0

theorem packet37_mass : packet37.mass = phaseMass37 := by
  unfold packet37
  rw [gridPhasePacket_mass,areaUnits37,phaseMass37_eq]
  norm_num

def packet38 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw38 output38 cover38 source38
    (gridTreeUnionCheck_sound 32768 raw38 output38 cover38 source38 tree38 checked38)
    255265193 100000000 (by decide) (by decide) 0

theorem packet38_mass : packet38.mass = phaseMass38 := by
  unfold packet38
  rw [gridPhasePacket_mass,areaUnits38,phaseMass38_eq]
  norm_num

def packet39 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw39 output39 cover39 source39
    (gridTreeUnionCheck_sound 32768 raw39 output39 cover39 source39 tree39 checked39)
    255265193 100000000 (by decide) (by decide) 0

theorem packet39_mass : packet39.mass = phaseMass39 := by
  unfold packet39
  rw [gridPhasePacket_mass,areaUnits39,phaseMass39_eq]
  norm_num

def packet40 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw40 output40 cover40 source40
    (gridTreeUnionCheck_sound 32768 raw40 output40 cover40 source40 tree40 checked40)
    255265193 100000000 (by decide) (by decide) 0

theorem packet40_mass : packet40.mass = phaseMass40 := by
  unfold packet40
  rw [gridPhasePacket_mass,areaUnits40,phaseMass40_eq]
  norm_num

def packet41 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw41 output41 cover41 source41
    (gridTreeUnionCheck_sound 32768 raw41 output41 cover41 source41 tree41 checked41)
    255265193 100000000 (by decide) (by decide) 0

theorem packet41_mass : packet41.mass = phaseMass41 := by
  unfold packet41
  rw [gridPhasePacket_mass,areaUnits41,phaseMass41_eq]
  norm_num

def packet42 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw42 output42 cover42 source42
    (gridTreeUnionCheck_sound 32768 raw42 output42 cover42 source42 tree42 checked42)
    255265193 100000000 (by decide) (by decide) 0

theorem packet42_mass : packet42.mass = phaseMass42 := by
  unfold packet42
  rw [gridPhasePacket_mass,areaUnits42,phaseMass42_eq]
  norm_num

def packet43 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw43 output43 cover43 source43
    (gridTreeUnionCheck_sound 32768 raw43 output43 cover43 source43 tree43 checked43)
    255265193 100000000 (by decide) (by decide) 0

theorem packet43_mass : packet43.mass = phaseMass43 := by
  unfold packet43
  rw [gridPhasePacket_mass,areaUnits43,phaseMass43_eq]
  norm_num

def packet44 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw44 output44 cover44 source44
    (gridTreeUnionCheck_sound 32768 raw44 output44 cover44 source44 tree44 checked44)
    255265193 100000000 (by decide) (by decide) 0

theorem packet44_mass : packet44.mass = phaseMass44 := by
  unfold packet44
  rw [gridPhasePacket_mass,areaUnits44,phaseMass44_eq]
  norm_num

def packet45 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw45 output45 cover45 source45
    (gridTreeUnionCheck_sound 32768 raw45 output45 cover45 source45 tree45 checked45)
    255265193 100000000 (by decide) (by decide) 0

theorem packet45_mass : packet45.mass = phaseMass45 := by
  unfold packet45
  rw [gridPhasePacket_mass,areaUnits45,phaseMass45_eq]
  norm_num

def packet46 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw46 output46 cover46 source46
    (gridTreeUnionCheck_sound 32768 raw46 output46 cover46 source46 tree46 checked46)
    255265193 100000000 (by decide) (by decide) 0

theorem packet46_mass : packet46.mass = phaseMass46 := by
  unfold packet46
  rw [gridPhasePacket_mass,areaUnits46,phaseMass46_eq]
  norm_num

def packet47 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw47 output47 cover47 source47
    (gridTreeUnionCheck_sound 32768 raw47 output47 cover47 source47 tree47 checked47)
    255265193 100000000 (by decide) (by decide) 0

theorem packet47_mass : packet47.mass = phaseMass47 := by
  unfold packet47
  rw [gridPhasePacket_mass,areaUnits47,phaseMass47_eq]
  norm_num

def packet48 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw48 output48 cover48 source48
    (gridTreeUnionCheck_sound 32768 raw48 output48 cover48 source48 tree48 checked48)
    255265193 100000000 (by decide) (by decide) 0

theorem packet48_mass : packet48.mass = phaseMass48 := by
  unfold packet48
  rw [gridPhasePacket_mass,areaUnits48,phaseMass48_eq]
  norm_num

def packet49 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw49 output49 cover49 source49
    (gridTreeUnionCheck_sound 32768 raw49 output49 cover49 source49 tree49 checked49)
    255265193 100000000 (by decide) (by decide) 0

theorem packet49_mass : packet49.mass = phaseMass49 := by
  unfold packet49
  rw [gridPhasePacket_mass,areaUnits49,phaseMass49_eq]
  norm_num

def packet50 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw50 output50 cover50 source50
    (gridTreeUnionCheck_sound 32768 raw50 output50 cover50 source50 tree50 checked50)
    255265193 100000000 (by decide) (by decide) 0

theorem packet50_mass : packet50.mass = phaseMass50 := by
  unfold packet50
  rw [gridPhasePacket_mass,areaUnits50,phaseMass50_eq]
  norm_num

def packet51 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw51 output51 cover51 source51
    (gridTreeUnionCheck_sound 32768 raw51 output51 cover51 source51 tree51 checked51)
    255265193 100000000 (by decide) (by decide) 0

theorem packet51_mass : packet51.mass = phaseMass51 := by
  unfold packet51
  rw [gridPhasePacket_mass,areaUnits51,phaseMass51_eq]
  norm_num

def packet52 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw52 output52 cover52 source52
    (gridTreeUnionCheck_sound 32768 raw52 output52 cover52 source52 tree52 checked52)
    255265193 100000000 (by decide) (by decide) 0

theorem packet52_mass : packet52.mass = phaseMass52 := by
  unfold packet52
  rw [gridPhasePacket_mass,areaUnits52,phaseMass52_eq]
  norm_num

def packet53 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw53 output53 cover53 source53
    (gridTreeUnionCheck_sound 32768 raw53 output53 cover53 source53 tree53 checked53)
    255265193 100000000 (by decide) (by decide) 0

theorem packet53_mass : packet53.mass = phaseMass53 := by
  unfold packet53
  rw [gridPhasePacket_mass,areaUnits53,phaseMass53_eq]
  norm_num

def packet54 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw54 output54 cover54 source54
    (gridTreeUnionCheck_sound 32768 raw54 output54 cover54 source54 tree54 checked54)
    255265193 100000000 (by decide) (by decide) 0

theorem packet54_mass : packet54.mass = phaseMass54 := by
  unfold packet54
  rw [gridPhasePacket_mass,areaUnits54,phaseMass54_eq]
  norm_num

def packet55 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw55 output55 cover55 source55
    (gridTreeUnionCheck_sound 32768 raw55 output55 cover55 source55 tree55 checked55)
    255265193 100000000 (by decide) (by decide) 0

theorem packet55_mass : packet55.mass = phaseMass55 := by
  unfold packet55
  rw [gridPhasePacket_mass,areaUnits55,phaseMass55_eq]
  norm_num

def packet56 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw56 output56 cover56 source56
    (gridTreeUnionCheck_sound 32768 raw56 output56 cover56 source56 tree56 checked56)
    255265193 100000000 (by decide) (by decide) 0

theorem packet56_mass : packet56.mass = phaseMass56 := by
  unfold packet56
  rw [gridPhasePacket_mass,areaUnits56,phaseMass56_eq]
  norm_num

def packet57 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw57 output57 cover57 source57
    (gridTreeUnionCheck_sound 32768 raw57 output57 cover57 source57 tree57 checked57)
    255265193 100000000 (by decide) (by decide) 0

theorem packet57_mass : packet57.mass = phaseMass57 := by
  unfold packet57
  rw [gridPhasePacket_mass,areaUnits57,phaseMass57_eq]
  norm_num

def packet58 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw58 output58 cover58 source58
    (gridTreeUnionCheck_sound 32768 raw58 output58 cover58 source58 tree58 checked58)
    255265193 100000000 (by decide) (by decide) 0

theorem packet58_mass : packet58.mass = phaseMass58 := by
  unfold packet58
  rw [gridPhasePacket_mass,areaUnits58,phaseMass58_eq]
  norm_num

def packet59 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw59 output59 cover59 source59
    (gridTreeUnionCheck_sound 32768 raw59 output59 cover59 source59 tree59 checked59)
    255265193 100000000 (by decide) (by decide) 0

theorem packet59_mass : packet59.mass = phaseMass59 := by
  unfold packet59
  rw [gridPhasePacket_mass,areaUnits59,phaseMass59_eq]
  norm_num

def packet60 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw60 output60 cover60 source60
    (gridTreeUnionCheck_sound 32768 raw60 output60 cover60 source60 tree60 checked60)
    255265193 100000000 (by decide) (by decide) 0

theorem packet60_mass : packet60.mass = phaseMass60 := by
  unfold packet60
  rw [gridPhasePacket_mass,areaUnits60,phaseMass60_eq]
  norm_num

def packet61 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw61 output61 cover61 source61
    (gridTreeUnionCheck_sound 32768 raw61 output61 cover61 source61 tree61 checked61)
    255265193 100000000 (by decide) (by decide) 0

theorem packet61_mass : packet61.mass = phaseMass61 := by
  unfold packet61
  rw [gridPhasePacket_mass,areaUnits61,phaseMass61_eq]
  norm_num

def packet62 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw62 output62 cover62 source62
    (gridTreeUnionCheck_sound 32768 raw62 output62 cover62 source62 tree62 checked62)
    300212497 100000000 (by decide) (by decide) 0

theorem packet62_mass : packet62.mass = phaseMass62 := by
  unfold packet62
  rw [gridPhasePacket_mass,areaUnits62,phaseMass62_eq]
  norm_num

def packet63 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw63 output63 cover63 source63
    (gridTreeUnionCheck_sound 32768 raw63 output63 cover63 source63 tree63 checked63)
    300212497 100000000 (by decide) (by decide) 0

theorem packet63_mass : packet63.mass = phaseMass63 := by
  unfold packet63
  rw [gridPhasePacket_mass,areaUnits63,phaseMass63_eq]
  norm_num

def packet64 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw64 output64 cover64 source64
    (gridTreeUnionCheck_sound 32768 raw64 output64 cover64 source64 tree64 checked64)
    300212497 100000000 (by decide) (by decide) 0

theorem packet64_mass : packet64.mass = phaseMass64 := by
  unfold packet64
  rw [gridPhasePacket_mass,areaUnits64,phaseMass64_eq]
  norm_num

def packet65 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw65 output65 cover65 source65
    (gridTreeUnionCheck_sound 32768 raw65 output65 cover65 source65 tree65 checked65)
    300212497 100000000 (by decide) (by decide) 0

theorem packet65_mass : packet65.mass = phaseMass65 := by
  unfold packet65
  rw [gridPhasePacket_mass,areaUnits65,phaseMass65_eq]
  norm_num

def packet66 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw66 output66 cover66 source66
    (gridTreeUnionCheck_sound 32768 raw66 output66 cover66 source66 tree66 checked66)
    300212497 100000000 (by decide) (by decide) 0

theorem packet66_mass : packet66.mass = phaseMass66 := by
  unfold packet66
  rw [gridPhasePacket_mass,areaUnits66,phaseMass66_eq]
  norm_num

def packet67 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw67 output67 cover67 source67
    (gridTreeUnionCheck_sound 32768 raw67 output67 cover67 source67 tree67 checked67)
    273965208 100000000 (by decide) (by decide) 0

theorem packet67_mass : packet67.mass = phaseMass67 := by
  unfold packet67
  rw [gridPhasePacket_mass,areaUnits67,phaseMass67_eq]
  norm_num

def packet68 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw68 output68 cover68 source68
    (gridTreeUnionCheck_sound 32768 raw68 output68 cover68 source68 tree68 checked68)
    273965208 100000000 (by decide) (by decide) 0

theorem packet68_mass : packet68.mass = phaseMass68 := by
  unfold packet68
  rw [gridPhasePacket_mass,areaUnits68,phaseMass68_eq]
  norm_num

def packet69 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw69 output69 cover69 source69
    (gridTreeUnionCheck_sound 32768 raw69 output69 cover69 source69 tree69 checked69)
    300212497 100000000 (by decide) (by decide) 0

theorem packet69_mass : packet69.mass = phaseMass69 := by
  unfold packet69
  rw [gridPhasePacket_mass,areaUnits69,phaseMass69_eq]
  norm_num

def packet70 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw70 output70 cover70 source70
    (gridTreeUnionCheck_sound 32768 raw70 output70 cover70 source70 tree70 checked70)
    273965208 100000000 (by decide) (by decide) 0

theorem packet70_mass : packet70.mass = phaseMass70 := by
  unfold packet70
  rw [gridPhasePacket_mass,areaUnits70,phaseMass70_eq]
  norm_num

def packet71 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw71 output71 cover71 source71
    (gridTreeUnionCheck_sound 32768 raw71 output71 cover71 source71 tree71 checked71)
    273965208 100000000 (by decide) (by decide) 0

theorem packet71_mass : packet71.mass = phaseMass71 := by
  unfold packet71
  rw [gridPhasePacket_mass,areaUnits71,phaseMass71_eq]
  norm_num

def packet72 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw72 output72 cover72 source72
    (gridTreeUnionCheck_sound 32768 raw72 output72 cover72 source72 tree72 checked72)
    273965208 100000000 (by decide) (by decide) 0

theorem packet72_mass : packet72.mass = phaseMass72 := by
  unfold packet72
  rw [gridPhasePacket_mass,areaUnits72,phaseMass72_eq]
  norm_num

def packet73 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw73 output73 cover73 source73
    (gridTreeUnionCheck_sound 32768 raw73 output73 cover73 source73 tree73 checked73)
    273965208 100000000 (by decide) (by decide) 0

theorem packet73_mass : packet73.mass = phaseMass73 := by
  unfold packet73
  rw [gridPhasePacket_mass,areaUnits73,phaseMass73_eq]
  norm_num

def packet74 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw74 output74 cover74 source74
    (gridTreeUnionCheck_sound 32768 raw74 output74 cover74 source74 tree74 checked74)
    273965208 100000000 (by decide) (by decide) 0

theorem packet74_mass : packet74.mass = phaseMass74 := by
  unfold packet74
  rw [gridPhasePacket_mass,areaUnits74,phaseMass74_eq]
  norm_num

def packet75 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw75 output75 cover75 source75
    (gridTreeUnionCheck_sound 32768 raw75 output75 cover75 source75 tree75 checked75)
    273965208 100000000 (by decide) (by decide) 0

theorem packet75_mass : packet75.mass = phaseMass75 := by
  unfold packet75
  rw [gridPhasePacket_mass,areaUnits75,phaseMass75_eq]
  norm_num

def packet76 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw76 output76 cover76 source76
    (gridTreeUnionCheck_sound 32768 raw76 output76 cover76 source76 tree76 checked76)
    273965208 100000000 (by decide) (by decide) 0

theorem packet76_mass : packet76.mass = phaseMass76 := by
  unfold packet76
  rw [gridPhasePacket_mass,areaUnits76,phaseMass76_eq]
  norm_num

def packet77 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw77 output77 cover77 source77
    (gridTreeUnionCheck_sound 32768 raw77 output77 cover77 source77 tree77 checked77)
    273965208 100000000 (by decide) (by decide) 0

theorem packet77_mass : packet77.mass = phaseMass77 := by
  unfold packet77
  rw [gridPhasePacket_mass,areaUnits77,phaseMass77_eq]
  norm_num

def packet78 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw78 output78 cover78 source78
    (gridTreeUnionCheck_sound 32768 raw78 output78 cover78 source78 tree78 checked78)
    273965208 100000000 (by decide) (by decide) 0

theorem packet78_mass : packet78.mass = phaseMass78 := by
  unfold packet78
  rw [gridPhasePacket_mass,areaUnits78,phaseMass78_eq]
  norm_num

def packet79 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw79 output79 cover79 source79
    (gridTreeUnionCheck_sound 32768 raw79 output79 cover79 source79 tree79 checked79)
    273965208 100000000 (by decide) (by decide) 0

theorem packet79_mass : packet79.mass = phaseMass79 := by
  unfold packet79
  rw [gridPhasePacket_mass,areaUnits79,phaseMass79_eq]
  norm_num

def packet80 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw80 output80 cover80 source80
    (gridTreeUnionCheck_sound 32768 raw80 output80 cover80 source80 tree80 checked80)
    273965208 100000000 (by decide) (by decide) 0

theorem packet80_mass : packet80.mass = phaseMass80 := by
  unfold packet80
  rw [gridPhasePacket_mass,areaUnits80,phaseMass80_eq]
  norm_num

def packet81 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw81 output81 cover81 source81
    (gridTreeUnionCheck_sound 32768 raw81 output81 cover81 source81 tree81 checked81)
    273965208 100000000 (by decide) (by decide) 0

theorem packet81_mass : packet81.mass = phaseMass81 := by
  unfold packet81
  rw [gridPhasePacket_mass,areaUnits81,phaseMass81_eq]
  norm_num

def packet82 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw82 output82 cover82 source82
    (gridTreeUnionCheck_sound 32768 raw82 output82 cover82 source82 tree82 checked82)
    273965208 100000000 (by decide) (by decide) 0

theorem packet82_mass : packet82.mass = phaseMass82 := by
  unfold packet82
  rw [gridPhasePacket_mass,areaUnits82,phaseMass82_eq]
  norm_num

def packet83 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw83 output83 cover83 source83
    (gridTreeUnionCheck_sound 32768 raw83 output83 cover83 source83 tree83 checked83)
    273965208 100000000 (by decide) (by decide) 0

theorem packet83_mass : packet83.mass = phaseMass83 := by
  unfold packet83
  rw [gridPhasePacket_mass,areaUnits83,phaseMass83_eq]
  norm_num

def packet84 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw84 output84 cover84 source84
    (gridTreeUnionCheck_sound 32768 raw84 output84 cover84 source84 tree84 checked84)
    273965208 100000000 (by decide) (by decide) 0

theorem packet84_mass : packet84.mass = phaseMass84 := by
  unfold packet84
  rw [gridPhasePacket_mass,areaUnits84,phaseMass84_eq]
  norm_num

def packet85 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw85 output85 cover85 source85
    (gridTreeUnionCheck_sound 32768 raw85 output85 cover85 source85 tree85 checked85)
    273965208 100000000 (by decide) (by decide) 0

theorem packet85_mass : packet85.mass = phaseMass85 := by
  unfold packet85
  rw [gridPhasePacket_mass,areaUnits85,phaseMass85_eq]
  norm_num

def packet86 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw86 output86 cover86 source86
    (gridTreeUnionCheck_sound 32768 raw86 output86 cover86 source86 tree86 checked86)
    273965208 100000000 (by decide) (by decide) 0

theorem packet86_mass : packet86.mass = phaseMass86 := by
  unfold packet86
  rw [gridPhasePacket_mass,areaUnits86,phaseMass86_eq]
  norm_num

def packet87 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw87 output87 cover87 source87
    (gridTreeUnionCheck_sound 32768 raw87 output87 cover87 source87 tree87 checked87)
    273965208 100000000 (by decide) (by decide) 0

theorem packet87_mass : packet87.mass = phaseMass87 := by
  unfold packet87
  rw [gridPhasePacket_mass,areaUnits87,phaseMass87_eq]
  norm_num

def packet88 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw88 output88 cover88 source88
    (gridTreeUnionCheck_sound 32768 raw88 output88 cover88 source88 tree88 checked88)
    273965208 100000000 (by decide) (by decide) 0

theorem packet88_mass : packet88.mass = phaseMass88 := by
  unfold packet88
  rw [gridPhasePacket_mass,areaUnits88,phaseMass88_eq]
  norm_num

def packet89 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw89 output89 cover89 source89
    (gridTreeUnionCheck_sound 32768 raw89 output89 cover89 source89 tree89 checked89)
    273965208 100000000 (by decide) (by decide) 0

theorem packet89_mass : packet89.mass = phaseMass89 := by
  unfold packet89
  rw [gridPhasePacket_mass,areaUnits89,phaseMass89_eq]
  norm_num

def packet90 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw90 output90 cover90 source90
    (gridTreeUnionCheck_sound 32768 raw90 output90 cover90 source90 tree90 checked90)
    273965208 100000000 (by decide) (by decide) 0

theorem packet90_mass : packet90.mass = phaseMass90 := by
  unfold packet90
  rw [gridPhasePacket_mass,areaUnits90,phaseMass90_eq]
  norm_num

def packet91 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw91 output91 cover91 source91
    (gridTreeUnionCheck_sound 32768 raw91 output91 cover91 source91 tree91 checked91)
    273965208 100000000 (by decide) (by decide) 0

theorem packet91_mass : packet91.mass = phaseMass91 := by
  unfold packet91
  rw [gridPhasePacket_mass,areaUnits91,phaseMass91_eq]
  norm_num

def packet92 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw92 output92 cover92 source92
    (gridTreeUnionCheck_sound 32768 raw92 output92 cover92 source92 tree92 checked92)
    273965208 100000000 (by decide) (by decide) 0

theorem packet92_mass : packet92.mass = phaseMass92 := by
  unfold packet92
  rw [gridPhasePacket_mass,areaUnits92,phaseMass92_eq]
  norm_num

def packet93 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw93 output93 cover93 source93
    (gridTreeUnionCheck_sound 32768 raw93 output93 cover93 source93 tree93 checked93)
    320937622 100000000 (by decide) (by decide) 0

theorem packet93_mass : packet93.mass = phaseMass93 := by
  unfold packet93
  rw [gridPhasePacket_mass,areaUnits93,phaseMass93_eq]
  norm_num

def packet94 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw94 output94 cover94 source94
    (gridTreeUnionCheck_sound 32768 raw94 output94 cover94 source94 tree94 checked94)
    320937622 100000000 (by decide) (by decide) 0

theorem packet94_mass : packet94.mass = phaseMass94 := by
  unfold packet94
  rw [gridPhasePacket_mass,areaUnits94,phaseMass94_eq]
  norm_num

def packet95 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw95 output95 cover95 source95
    (gridTreeUnionCheck_sound 32768 raw95 output95 cover95 source95 tree95 checked95)
    273965208 100000000 (by decide) (by decide) 0

theorem packet95_mass : packet95.mass = phaseMass95 := by
  unfold packet95
  rw [gridPhasePacket_mass,areaUnits95,phaseMass95_eq]
  norm_num

def packet96 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw96 output96 cover96 source96
    (gridTreeUnionCheck_sound 32768 raw96 output96 cover96 source96 tree96 checked96)
    320937622 100000000 (by decide) (by decide) 0

theorem packet96_mass : packet96.mass = phaseMass96 := by
  unfold packet96
  rw [gridPhasePacket_mass,areaUnits96,phaseMass96_eq]
  norm_num

def packet97 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw97 output97 cover97 source97
    (gridTreeUnionCheck_sound 32768 raw97 output97 cover97 source97 tree97 checked97)
    320937622 100000000 (by decide) (by decide) 0

theorem packet97_mass : packet97.mass = phaseMass97 := by
  unfold packet97
  rw [gridPhasePacket_mass,areaUnits97,phaseMass97_eq]
  norm_num

def packet98 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw98 output98 cover98 source98
    (gridTreeUnionCheck_sound 32768 raw98 output98 cover98 source98 tree98 checked98)
    320937622 100000000 (by decide) (by decide) 0

theorem packet98_mass : packet98.mass = phaseMass98 := by
  unfold packet98
  rw [gridPhasePacket_mass,areaUnits98,phaseMass98_eq]
  norm_num

def packet99 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw99 output99 cover99 source99
    (gridTreeUnionCheck_sound 32768 raw99 output99 cover99 source99 tree99 checked99)
    321493533 100000000 (by decide) (by decide) 0

theorem packet99_mass : packet99.mass = phaseMass99 := by
  unfold packet99
  rw [gridPhasePacket_mass,areaUnits99,phaseMass99_eq]
  norm_num

def packet100 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw100 output100 cover100 source100
    (gridTreeUnionCheck_sound 32768 raw100 output100 cover100 source100 tree100 checked100)
    321493533 100000000 (by decide) (by decide) 0

theorem packet100_mass : packet100.mass = phaseMass100 := by
  unfold packet100
  rw [gridPhasePacket_mass,areaUnits100,phaseMass100_eq]
  norm_num

def packet101 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw101 output101 cover101 source101
    (gridTreeUnionCheck_sound 32768 raw101 output101 cover101 source101 tree101 checked101)
    321493533 100000000 (by decide) (by decide) 0

theorem packet101_mass : packet101.mass = phaseMass101 := by
  unfold packet101
  rw [gridPhasePacket_mass,areaUnits101,phaseMass101_eq]
  norm_num

def packet102 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw102 output102 cover102 source102
    (gridTreeUnionCheck_sound 32768 raw102 output102 cover102 source102 tree102 checked102)
    320937622 100000000 (by decide) (by decide) 0

theorem packet102_mass : packet102.mass = phaseMass102 := by
  unfold packet102
  rw [gridPhasePacket_mass,areaUnits102,phaseMass102_eq]
  norm_num

def packet103 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw103 output103 cover103 source103
    (gridTreeUnionCheck_sound 32768 raw103 output103 cover103 source103 tree103 checked103)
    321493533 100000000 (by decide) (by decide) 0

theorem packet103_mass : packet103.mass = phaseMass103 := by
  unfold packet103
  rw [gridPhasePacket_mass,areaUnits103,phaseMass103_eq]
  norm_num

def packet104 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw104 output104 cover104 source104
    (gridTreeUnionCheck_sound 32768 raw104 output104 cover104 source104 tree104 checked104)
    321493533 100000000 (by decide) (by decide) 0

theorem packet104_mass : packet104.mass = phaseMass104 := by
  unfold packet104
  rw [gridPhasePacket_mass,areaUnits104,phaseMass104_eq]
  norm_num

def packet105 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw105 output105 cover105 source105
    (gridTreeUnionCheck_sound 32768 raw105 output105 cover105 source105 tree105 checked105)
    321493533 100000000 (by decide) (by decide) 0

theorem packet105_mass : packet105.mass = phaseMass105 := by
  unfold packet105
  rw [gridPhasePacket_mass,areaUnits105,phaseMass105_eq]
  norm_num

def packet106 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw106 output106 cover106 source106
    (gridTreeUnionCheck_sound 32768 raw106 output106 cover106 source106 tree106 checked106)
    321493533 100000000 (by decide) (by decide) 0

theorem packet106_mass : packet106.mass = phaseMass106 := by
  unfold packet106
  rw [gridPhasePacket_mass,areaUnits106,phaseMass106_eq]
  norm_num

def packet107 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw107 output107 cover107 source107
    (gridTreeUnionCheck_sound 32768 raw107 output107 cover107 source107 tree107 checked107)
    321493533 100000000 (by decide) (by decide) 0

theorem packet107_mass : packet107.mass = phaseMass107 := by
  unfold packet107
  rw [gridPhasePacket_mass,areaUnits107,phaseMass107_eq]
  norm_num

def packet108 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw108 output108 cover108 source108
    (gridTreeUnionCheck_sound 32768 raw108 output108 cover108 source108 tree108 checked108)
    321493533 100000000 (by decide) (by decide) 0

theorem packet108_mass : packet108.mass = phaseMass108 := by
  unfold packet108
  rw [gridPhasePacket_mass,areaUnits108,phaseMass108_eq]
  norm_num

def packet109 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw109 output109 cover109 source109
    (gridTreeUnionCheck_sound 32768 raw109 output109 cover109 source109 tree109 checked109)
    321493533 100000000 (by decide) (by decide) 0

theorem packet109_mass : packet109.mass = phaseMass109 := by
  unfold packet109
  rw [gridPhasePacket_mass,areaUnits109,phaseMass109_eq]
  norm_num

def packet110 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw110 output110 cover110 source110
    (gridTreeUnionCheck_sound 32768 raw110 output110 cover110 source110 tree110 checked110)
    321493533 100000000 (by decide) (by decide) 0

theorem packet110_mass : packet110.mass = phaseMass110 := by
  unfold packet110
  rw [gridPhasePacket_mass,areaUnits110,phaseMass110_eq]
  norm_num

def packet111 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw111 output111 cover111 source111
    (gridTreeUnionCheck_sound 32768 raw111 output111 cover111 source111 tree111 checked111)
    321493533 100000000 (by decide) (by decide) 0

theorem packet111_mass : packet111.mass = phaseMass111 := by
  unfold packet111
  rw [gridPhasePacket_mass,areaUnits111,phaseMass111_eq]
  norm_num

def packet112 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw112 output112 cover112 source112
    (gridTreeUnionCheck_sound 32768 raw112 output112 cover112 source112 tree112 checked112)
    321493533 100000000 (by decide) (by decide) 0

theorem packet112_mass : packet112.mass = phaseMass112 := by
  unfold packet112
  rw [gridPhasePacket_mass,areaUnits112,phaseMass112_eq]
  norm_num

def packet113 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw113 output113 cover113 source113
    (gridTreeUnionCheck_sound 32768 raw113 output113 cover113 source113 tree113 checked113)
    321493533 100000000 (by decide) (by decide) 0

theorem packet113_mass : packet113.mass = phaseMass113 := by
  unfold packet113
  rw [gridPhasePacket_mass,areaUnits113,phaseMass113_eq]
  norm_num

def packet114 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw114 output114 cover114 source114
    (gridTreeUnionCheck_sound 32768 raw114 output114 cover114 source114 tree114 checked114)
    321493533 100000000 (by decide) (by decide) 0

theorem packet114_mass : packet114.mass = phaseMass114 := by
  unfold packet114
  rw [gridPhasePacket_mass,areaUnits114,phaseMass114_eq]
  norm_num

def packet115 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw115 output115 cover115 source115
    (gridTreeUnionCheck_sound 32768 raw115 output115 cover115 source115 tree115 checked115)
    321493533 100000000 (by decide) (by decide) 0

theorem packet115_mass : packet115.mass = phaseMass115 := by
  unfold packet115
  rw [gridPhasePacket_mass,areaUnits115,phaseMass115_eq]
  norm_num

def packet116 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw116 output116 cover116 source116
    (gridTreeUnionCheck_sound 32768 raw116 output116 cover116 source116 tree116 checked116)
    321493533 100000000 (by decide) (by decide) 0

theorem packet116_mass : packet116.mass = phaseMass116 := by
  unfold packet116
  rw [gridPhasePacket_mass,areaUnits116,phaseMass116_eq]
  norm_num

def packet117 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw117 output117 cover117 source117
    (gridTreeUnionCheck_sound 32768 raw117 output117 cover117 source117 tree117 checked117)
    321493533 100000000 (by decide) (by decide) 0

theorem packet117_mass : packet117.mass = phaseMass117 := by
  unfold packet117
  rw [gridPhasePacket_mass,areaUnits117,phaseMass117_eq]
  norm_num

def packet118 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw118 output118 cover118 source118
    (gridTreeUnionCheck_sound 32768 raw118 output118 cover118 source118 tree118 checked118)
    321493533 100000000 (by decide) (by decide) 0

theorem packet118_mass : packet118.mass = phaseMass118 := by
  unfold packet118
  rw [gridPhasePacket_mass,areaUnits118,phaseMass118_eq]
  norm_num

def packet119 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw119 output119 cover119 source119
    (gridTreeUnionCheck_sound 32768 raw119 output119 cover119 source119 tree119 checked119)
    321493533 100000000 (by decide) (by decide) 0

theorem packet119_mass : packet119.mass = phaseMass119 := by
  unfold packet119
  rw [gridPhasePacket_mass,areaUnits119,phaseMass119_eq]
  norm_num

def packet120 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw120 output120 cover120 source120
    (gridTreeUnionCheck_sound 32768 raw120 output120 cover120 source120 tree120 checked120)
    321493533 100000000 (by decide) (by decide) 0

theorem packet120_mass : packet120.mass = phaseMass120 := by
  unfold packet120
  rw [gridPhasePacket_mass,areaUnits120,phaseMass120_eq]
  norm_num

def packet121 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw121 output121 cover121 source121
    (gridTreeUnionCheck_sound 32768 raw121 output121 cover121 source121 tree121 checked121)
    321493533 100000000 (by decide) (by decide) 0

theorem packet121_mass : packet121.mass = phaseMass121 := by
  unfold packet121
  rw [gridPhasePacket_mass,areaUnits121,phaseMass121_eq]
  norm_num

def packet122 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw122 output122 cover122 source122
    (gridTreeUnionCheck_sound 32768 raw122 output122 cover122 source122 tree122 checked122)
    321493533 100000000 (by decide) (by decide) 0

theorem packet122_mass : packet122.mass = phaseMass122 := by
  unfold packet122
  rw [gridPhasePacket_mass,areaUnits122,phaseMass122_eq]
  norm_num

def packet123 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw123 output123 cover123 source123
    (gridTreeUnionCheck_sound 32768 raw123 output123 cover123 source123 tree123 checked123)
    321493533 100000000 (by decide) (by decide) 0

theorem packet123_mass : packet123.mass = phaseMass123 := by
  unfold packet123
  rw [gridPhasePacket_mass,areaUnits123,phaseMass123_eq]
  norm_num

def packet124 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw124 output124 cover124 source124
    (gridTreeUnionCheck_sound 32768 raw124 output124 cover124 source124 tree124 checked124)
    321493533 100000000 (by decide) (by decide) 0

theorem packet124_mass : packet124.mass = phaseMass124 := by
  unfold packet124
  rw [gridPhasePacket_mass,areaUnits124,phaseMass124_eq]
  norm_num

def packet125 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw125 output125 cover125 source125
    (gridTreeUnionCheck_sound 32768 raw125 output125 cover125 source125 tree125 checked125)
    321493533 100000000 (by decide) (by decide) 0

theorem packet125_mass : packet125.mass = phaseMass125 := by
  unfold packet125
  rw [gridPhasePacket_mass,areaUnits125,phaseMass125_eq]
  norm_num

def packet126 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw126 output126 cover126 source126
    (gridTreeUnionCheck_sound 32768 raw126 output126 cover126 source126 tree126 checked126)
    327195324 100000000 (by decide) (by decide) 0

theorem packet126_mass : packet126.mass = phaseMass126 := by
  unfold packet126
  rw [gridPhasePacket_mass,areaUnits126,phaseMass126_eq]
  norm_num

def packet127 : PhasePacket :=
  gridPhasePacket 32768 (by decide) raw127 output127 cover127 source127
    (gridTreeUnionCheck_sound 32768 raw127 output127 cover127 source127 tree127 checked127)
    327195324 100000000 (by decide) (by decide) 0

theorem packet127_mass : packet127.mass = phaseMass127 := by
  unfold packet127
  rw [gridPhasePacket_mass,areaUnits127,phaseMass127_eq]
  norm_num

def packets : List PhasePacket := [packet0,packet1,packet2,packet3,packet4,packet5,packet6,packet7,packet8,packet9,packet10,packet11,packet12,packet13,packet14,packet15,packet16,packet17,packet18,packet19,packet20,packet21,packet22,packet23,packet24,packet25,packet26,packet27,packet28,packet29,packet30,packet31,packet32,packet33,packet34,packet35,packet36,packet37,packet38,packet39,packet40,packet41,packet42,packet43,packet44,packet45,packet46,packet47,packet48,packet49,packet50,packet51,packet52,packet53,packet54,packet55,packet56,packet57,packet58,packet59,packet60,packet61,packet62,packet63,packet64,packet65,packet66,packet67,packet68,packet69,packet70,packet71,packet72,packet73,packet74,packet75,packet76,packet77,packet78,packet79,packet80,packet81,packet82,packet83,packet84,packet85,packet86,packet87,packet88,packet89,packet90,packet91,packet92,packet93,packet94,packet95,packet96,packet97,packet98,packet99,packet100,packet101,packet102,packet103,packet104,packet105,packet106,packet107,packet108,packet109,packet110,packet111,packet112,packet113,packet114,packet115,packet116,packet117,packet118,packet119,packet120,packet121,packet122,packet123,packet124,packet125,packet126,packet127]

theorem packet_count : packets.length = 128 := rfl

theorem packet_mass_eq : packetListMass packets = batchActualMass := by
  simp only [packetListMass,packets,List.map_cons,List.map_nil]
  rw [packet0_mass,packet1_mass,packet2_mass,packet3_mass,packet4_mass,packet5_mass,packet6_mass,packet7_mass,packet8_mass,packet9_mass,packet10_mass,packet11_mass,packet12_mass,packet13_mass,packet14_mass,packet15_mass,packet16_mass,packet17_mass,packet18_mass,packet19_mass,packet20_mass,packet21_mass,packet22_mass,packet23_mass,packet24_mass,packet25_mass,packet26_mass,packet27_mass,packet28_mass,packet29_mass,packet30_mass,packet31_mass,packet32_mass,packet33_mass,packet34_mass,packet35_mass,packet36_mass,packet37_mass,packet38_mass,packet39_mass,packet40_mass,packet41_mass,packet42_mass,packet43_mass,packet44_mass,packet45_mass,packet46_mass,packet47_mass,packet48_mass,packet49_mass,packet50_mass,packet51_mass,packet52_mass,packet53_mass,packet54_mass,packet55_mass,packet56_mass,packet57_mass,packet58_mass,packet59_mass,packet60_mass,packet61_mass,packet62_mass,packet63_mass,packet64_mass,packet65_mass,packet66_mass,packet67_mass,packet68_mass,packet69_mass,packet70_mass,packet71_mass,packet72_mass,packet73_mass,packet74_mass,packet75_mass,packet76_mass,packet77_mass,packet78_mass,packet79_mass,packet80_mass,packet81_mass,packet82_mass,packet83_mass,packet84_mass,packet85_mass,packet86_mass,packet87_mass,packet88_mass,packet89_mass,packet90_mass,packet91_mass,packet92_mass,packet93_mass,packet94_mass,packet95_mass,packet96_mass,packet97_mass,packet98_mass,packet99_mass,packet100_mass,packet101_mass,packet102_mass,packet103_mass,packet104_mass,packet105_mass,packet106_mass,packet107_mass,packet108_mass,packet109_mass,packet110_mass,packet111_mass,packet112_mass,packet113_mass,packet114_mass,packet115_mass,packet116_mass,packet117_mass,packet118_mass,packet119_mass,packet120_mass,packet121_mass,packet122_mass,packet123_mass,packet124_mass,packet125_mass,packet126_mass,packet127_mass]
  rfl

theorem packets_mass : packetListMass packets = (12521994747/655360000000 : ℝ) :=
  packet_mass_eq.trans actual_batch_mass

theorem actual_schedule_mass :
    (packetSchedule packets).typedInputMass (fun i => (packets.get i).rootType)
      (fun i => (packets.get i).field) = (12521994747/655360000000 : ℝ) :=
  (packetSchedule_mass packets).trans packets_mass

theorem shortened_schedule_mass :
    ((packetSchedule packets).scaled (249/250) (by norm_num)).typedInputMass
      (fun i => (packets.get i).rootType) (fun i => (packets.get i).field) =
        (3117976692003/163840000000000 : ℝ) := by
  rw [Schedule.scaled_typedInputMass,actual_schedule_mass]
  norm_num

end NoThreeLine.ScheduleUnionBatch00032Packets

#print axioms NoThreeLine.ScheduleUnionBatch00032Packets.actual_schedule_mass
#print axioms NoThreeLine.ScheduleUnionBatch00032Packets.shortened_schedule_mass
