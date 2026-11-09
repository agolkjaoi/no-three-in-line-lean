import NoThreeLine.ScheduleUnionBatch05738
import NoThreeLine.AcceptedPhasePacket
import NoThreeLine.FiniteInputTreeSum

/-! The checked packet retains the actual accepted leaves and source cell.
Actual typed prefixes are dominated by the matching coarse-source prefix.
Compressed-reference identity and missing full-schedule phases are separate. -/
set_option autoImplicit false
set_option maxRecDepth 4096
set_option maxHeartbeats 400000
open MeasureTheory NoThreeLine.FinitePhase
noncomputable section
namespace NoThreeLine.ScheduleUnionBatch05738Accepted
open ScheduleUnionBatch05738

theorem grid_pos : 0 < (32768 : ℕ) := by decide

def accepted0 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 7
    sx := 30
    sy := 83
    rootType := 1
    leaves := leaves0
    valid := by
      rcases metadata0 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 28
  output := output0
  cover := cover0
  source := source0
  checked := gridTreeUnionCheck_sound 32768 raw0 output0 cover0 source0 tree0 checked0
  units := 144359671
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted0_mass : (accepted0.toPacket grid_pos).mass = phaseMass0 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (144359671 : ℝ)/100000000*(gridUnionAreaUnits output0 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass0
  rw [areaUnits0, phaseMass0_eq]
  norm_num

theorem sourceIndex0 : 7183%4160 = 30*(128-30)+83 ∧
    30<64 ∧ 30≤83 ∧ 83<128-30 := by decide +kernel

def accepted1 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 10
    sx := 29
    sy := 82
    rootType := 1
    leaves := leaves1
    valid := by
      rcases metadata1 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 40
  output := output1
  cover := cover1
  source := source1
  checked := gridTreeUnionCheck_sound 32768 raw1 output1 cover1 source1 tree1 checked1
  units := 144359671
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted1_mass : (accepted1.toPacket grid_pos).mass = phaseMass1 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (144359671 : ℝ)/100000000*(gridUnionAreaUnits output1 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass1
  rw [areaUnits1, phaseMass1_eq]
  norm_num

theorem sourceIndex1 : 7113%4160 = 29*(128-29)+82 ∧
    29<64 ∧ 29≤82 ∧ 82<128-29 := by decide +kernel

def accepted2 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 13
    sx := 25
    sy := 79
    rootType := 1
    leaves := leaves2
    valid := by
      rcases metadata2 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 52
  output := output2
  cover := cover2
  source := source2
  checked := gridTreeUnionCheck_sound 32768 raw2 output2 cover2 source2 tree2 checked2
  units := 140060506
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted2_mass : (accepted2.toPacket grid_pos).mass = phaseMass2 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (140060506 : ℝ)/100000000*(gridUnionAreaUnits output2 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass2
  rw [areaUnits2, phaseMass2_eq]
  norm_num

theorem sourceIndex2 : 6814%4160 = 25*(128-25)+79 ∧
    25<64 ∧ 25≤79 ∧ 79<128-25 := by decide +kernel

def accepted3 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 13
    sx := 13
    sy := 69
    rootType := 1
    leaves := leaves3
    valid := by
      rcases metadata3 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 52
  output := output3
  cover := cover3
  source := source3
  checked := gridTreeUnionCheck_sound 32768 raw3 output3 cover3 source3 tree3 checked3
  units := 135229957
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted3_mass : (accepted3.toPacket grid_pos).mass = phaseMass3 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (135229957 : ℝ)/100000000*(gridUnionAreaUnits output3 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass3
  rw [areaUnits3, phaseMass3_eq]
  norm_num

theorem sourceIndex3 : 5724%4160 = 13*(128-13)+69 ∧
    13<64 ∧ 13≤69 ∧ 69<128-13 := by decide +kernel

def accepted4 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 16
    sx := 7
    sy := 66
    rootType := 1
    leaves := leaves4
    valid := by
      rcases metadata4 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 64
  output := output4
  cover := cover4
  source := source4
  checked := gridTreeUnionCheck_sound 32768 raw4 output4 cover4 source4 tree4 checked4
  units := 202148459
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted4_mass : (accepted4.toPacket grid_pos).mass = phaseMass4 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (202148459 : ℝ)/100000000*(gridUnionAreaUnits output4 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass4
  rw [areaUnits4, phaseMass4_eq]
  norm_num

theorem sourceIndex4 : 5073%4160 = 7*(128-7)+66 ∧
    7<64 ∧ 7≤66 ∧ 66<128-7 := by decide +kernel

def accepted5 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 7
    sx := 26
    sy := 83
    rootType := 0
    leaves := leaves5
    valid := by
      rcases metadata5 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 28
  output := output5
  cover := cover5
  source := source5
  checked := gridTreeUnionCheck_sound 32768 raw5 output5 cover5 source5 tree5 checked5
  units := 104681033
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted5_mass : (accepted5.toPacket grid_pos).mass = phaseMass5 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (104681033 : ℝ)/100000000*(gridUnionAreaUnits output5 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass5
  rw [areaUnits5, phaseMass5_eq]
  norm_num

theorem sourceIndex5 : 2735%4160 = 26*(128-26)+83 ∧
    26<64 ∧ 26≤83 ∧ 83<128-26 := by decide +kernel

def accepted6 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 7
    sx := 20
    sy := 79
    rootType := 0
    leaves := leaves6
    valid := by
      rcases metadata6 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 28
  output := output6
  cover := cover6
  source := source6
  checked := gridTreeUnionCheck_sound 32768 raw6 output6 cover6 source6 tree6 checked6
  units := 147396112
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted6_mass : (accepted6.toPacket grid_pos).mass = phaseMass6 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (147396112 : ℝ)/100000000*(gridUnionAreaUnits output6 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass6
  rw [areaUnits6, phaseMass6_eq]
  norm_num

theorem sourceIndex6 : 2239%4160 = 20*(128-20)+79 ∧
    20<64 ∧ 20≤79 ∧ 79<128-20 := by decide +kernel

def accepted7 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 13
    sx := 21
    sy := 76
    rootType := 1
    leaves := leaves7
    valid := by
      rcases metadata7 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 52
  output := output7
  cover := cover7
  source := source7
  checked := gridTreeUnionCheck_sound 32768 raw7 output7 cover7 source7 tree7 checked7
  units := 157738472
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted7_mass : (accepted7.toPacket grid_pos).mass = phaseMass7 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (157738472 : ℝ)/100000000*(gridUnionAreaUnits output7 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass7
  rw [areaUnits7, phaseMass7_eq]
  norm_num

theorem sourceIndex7 : 6483%4160 = 21*(128-21)+76 ∧
    21<64 ∧ 21≤76 ∧ 76<128-21 := by decide +kernel

def accepted8 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 7
    sx := 14
    sy := 70
    rootType := 1
    leaves := leaves8
    valid := by
      rcases metadata8 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 28
  output := output8
  cover := cover8
  source := source8
  checked := gridTreeUnionCheck_sound 32768 raw8 output8 cover8 source8 tree8 checked8
  units := 135229957
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted8_mass : (accepted8.toPacket grid_pos).mass = phaseMass8 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (135229957 : ℝ)/100000000*(gridUnionAreaUnits output8 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass8
  rw [areaUnits8, phaseMass8_eq]
  norm_num

theorem sourceIndex8 : 5826%4160 = 14*(128-14)+70 ∧
    14<64 ∧ 14≤70 ∧ 70<128-14 := by decide +kernel

def accepted9 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 10
    sx := 15
    sy := 71
    rootType := 1
    leaves := leaves9
    valid := by
      rcases metadata9 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 40
  output := output9
  cover := cover9
  source := source9
  checked := gridTreeUnionCheck_sound 32768 raw9 output9 cover9 source9 tree9 checked9
  units := 135229957
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted9_mass : (accepted9.toPacket grid_pos).mass = phaseMass9 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (135229957 : ℝ)/100000000*(gridUnionAreaUnits output9 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass9
  rw [areaUnits9, phaseMass9_eq]
  norm_num

theorem sourceIndex9 : 5926%4160 = 15*(128-15)+71 ∧
    15<64 ∧ 15≤71 ∧ 71<128-15 := by decide +kernel

def accepted10 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 13
    sx := 16
    sy := 72
    rootType := 1
    leaves := leaves10
    valid := by
      rcases metadata10 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 52
  output := output10
  cover := cover10
  source := source10
  checked := gridTreeUnionCheck_sound 32768 raw10 output10 cover10 source10 tree10 checked10
  units := 157738472
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted10_mass : (accepted10.toPacket grid_pos).mass = phaseMass10 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (157738472 : ℝ)/100000000*(gridUnionAreaUnits output10 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass10
  rw [areaUnits10, phaseMass10_eq]
  norm_num

theorem sourceIndex10 : 6024%4160 = 16*(128-16)+72 ∧
    16<64 ∧ 16≤72 ∧ 72<128-16 := by decide +kernel

def accepted11 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 13
    sx := 10
    sy := 70
    rootType := 0
    leaves := leaves11
    valid := by
      rcases metadata11 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 52
  output := output11
  cover := cover11
  source := source11
  checked := gridTreeUnionCheck_sound 32768 raw11 output11 cover11 source11 tree11 checked11
  units := 67702166
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted11_mass : (accepted11.toPacket grid_pos).mass = phaseMass11 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (67702166 : ℝ)/100000000*(gridUnionAreaUnits output11 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass11
  rw [areaUnits11, phaseMass11_eq]
  norm_num

theorem sourceIndex11 : 1250%4160 = 10*(128-10)+70 ∧
    10<64 ∧ 10≤70 ∧ 70<128-10 := by decide +kernel

def accepted12 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 10
    sx := 11
    sy := 68
    rootType := 1
    leaves := leaves12
    valid := by
      rcases metadata12 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 40
  output := output12
  cover := cover12
  source := source12
  checked := gridTreeUnionCheck_sound 32768 raw12 output12 cover12 source12 tree12 checked12
  units := 135229957
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted12_mass : (accepted12.toPacket grid_pos).mass = phaseMass12 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (135229957 : ℝ)/100000000*(gridUnionAreaUnits output12 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass12
  rw [areaUnits12, phaseMass12_eq]
  norm_num

theorem sourceIndex12 : 5515%4160 = 11*(128-11)+68 ∧
    11<64 ∧ 11≤68 ∧ 68<128-11 := by decide +kernel

def accepted13 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 13
    sx := 4
    sy := 65
    rootType := 1
    leaves := leaves13
    valid := by
      rcases metadata13 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 52
  output := output13
  cover := cover13
  source := source13
  checked := gridTreeUnionCheck_sound 32768 raw13 output13 cover13 source13 tree13 checked13
  units := 202148459
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted13_mass : (accepted13.toPacket grid_pos).mass = phaseMass13 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (202148459 : ℝ)/100000000*(gridUnionAreaUnits output13 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass13
  rw [areaUnits13, phaseMass13_eq]
  norm_num

theorem sourceIndex13 : 4721%4160 = 4*(128-4)+65 ∧
    4<64 ∧ 4≤65 ∧ 65<128-4 := by decide +kernel

def accepted14 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 13
    sx := 1
    sy := 66
    rootType := 0
    leaves := leaves14
    valid := by
      rcases metadata14 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 52
  output := output14
  cover := cover14
  source := source14
  checked := gridTreeUnionCheck_sound 32768 raw14 output14 cover14 source14 tree14 checked14
  units := 114037843
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted14_mass : (accepted14.toPacket grid_pos).mass = phaseMass14 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (114037843 : ℝ)/100000000*(gridUnionAreaUnits output14 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass14
  rw [areaUnits14, phaseMass14_eq]
  norm_num

theorem sourceIndex14 : 193%4160 = 1*(128-1)+66 ∧
    1<64 ∧ 1≤66 ∧ 66<128-1 := by decide +kernel

def accepted15 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 22
    sx := 2
    sy := 64
    rootType := 1
    leaves := leaves15
    valid := by
      rcases metadata15 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 88
  output := output15
  cover := cover15
  source := source15
  checked := gridTreeUnionCheck_sound 32768 raw15 output15 cover15 source15 tree15 checked15
  units := 202148459
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted15_mass : (accepted15.toPacket grid_pos).mass = phaseMass15 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (202148459 : ℝ)/100000000*(gridUnionAreaUnits output15 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass15
  rw [areaUnits15, phaseMass15_eq]
  norm_num

theorem sourceIndex15 : 4476%4160 = 2*(128-2)+64 ∧
    2<64 ∧ 2≤64 ∧ 64<128-2 := by decide +kernel

def accepted16 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 13
    sx := 17
    sy := 73
    rootType := 1
    leaves := leaves16
    valid := by
      rcases metadata16 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 52
  output := output16
  cover := cover16
  source := source16
  checked := gridTreeUnionCheck_sound 32768 raw16 output16 cover16 source16 tree16 checked16
  units := 157738472
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted16_mass : (accepted16.toPacket grid_pos).mass = phaseMass16 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (157738472 : ℝ)/100000000*(gridUnionAreaUnits output16 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass16
  rw [areaUnits16, phaseMass16_eq]
  norm_num

theorem sourceIndex16 : 6120%4160 = 17*(128-17)+73 ∧
    17<64 ∧ 17≤73 ∧ 73<128-17 := by decide +kernel

def accepted17 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 16
    sx := 0
    sy := 63
    rootType := 1
    leaves := leaves17
    valid := by
      rcases metadata17 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 64
  output := output17
  cover := cover17
  source := source17
  checked := gridTreeUnionCheck_sound 32768 raw17 output17 cover17 source17 tree17 checked17
  units := 169648215
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted17_mass : (accepted17.toPacket grid_pos).mass = phaseMass17 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (169648215 : ℝ)/100000000*(gridUnionAreaUnits output17 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass17
  rw [areaUnits17, phaseMass17_eq]
  norm_num

theorem sourceIndex17 : 4223%4160 = 0*(128-0)+63 ∧
    0<64 ∧ 0≤63 ∧ 63<128-0 := by decide +kernel

def accepted18 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 19
    sx := 6
    sy := 66
    rootType := 1
    leaves := leaves18
    valid := by
      rcases metadata18 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 76
  output := output18
  cover := cover18
  source := source18
  checked := gridTreeUnionCheck_sound 32768 raw18 output18 cover18 source18 tree18 checked18
  units := 202148459
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted18_mass : (accepted18.toPacket grid_pos).mass = phaseMass18 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (202148459 : ℝ)/100000000*(gridUnionAreaUnits output18 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass18
  rw [areaUnits18, phaseMass18_eq]
  norm_num

theorem sourceIndex18 : 4958%4160 = 6*(128-6)+66 ∧
    6<64 ∧ 6≤66 ∧ 66<128-6 := by decide +kernel

def accepted19 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 10
    sx := 23
    sy := 81
    rootType := 0
    leaves := leaves19
    valid := by
      rcases metadata19 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 40
  output := output19
  cover := cover19
  source := source19
  checked := gridTreeUnionCheck_sound 32768 raw19 output19 cover19 source19 tree19 checked19
  units := 152546139
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted19_mass : (accepted19.toPacket grid_pos).mass = phaseMass19 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (152546139 : ℝ)/100000000*(gridUnionAreaUnits output19 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass19
  rw [areaUnits19, phaseMass19_eq]
  norm_num

theorem sourceIndex19 : 2496%4160 = 23*(128-23)+81 ∧
    23<64 ∧ 23≤81 ∧ 81<128-23 := by decide +kernel

def accepted20 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 10
    sx := 5
    sy := 68
    rootType := 0
    leaves := leaves20
    valid := by
      rcases metadata20 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 40
  output := output20
  cover := cover20
  source := source20
  checked := gridTreeUnionCheck_sound 32768 raw20 output20 cover20 source20 tree20 checked20
  units := 114037843
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted20_mass : (accepted20.toPacket grid_pos).mass = phaseMass20 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (114037843 : ℝ)/100000000*(gridUnionAreaUnits output20 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass20
  rw [areaUnits20, phaseMass20_eq]
  norm_num

theorem sourceIndex20 : 683%4160 = 5*(128-5)+68 ∧
    5<64 ∧ 5≤68 ∧ 68<128-5 := by decide +kernel

def accepted21 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 19
    sx := 3
    sy := 67
    rootType := 0
    leaves := leaves21
    valid := by
      rcases metadata21 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 76
  output := output21
  cover := cover21
  source := source21
  checked := gridTreeUnionCheck_sound 32768 raw21 output21 cover21 source21 tree21 checked21
  units := 114037843
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted21_mass : (accepted21.toPacket grid_pos).mass = phaseMass21 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (114037843 : ℝ)/100000000*(gridUnionAreaUnits output21 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass21
  rw [areaUnits21, phaseMass21_eq]
  norm_num

theorem sourceIndex21 : 442%4160 = 3*(128-3)+67 ∧
    3<64 ∧ 3≤67 ∧ 67<128-3 := by decide +kernel

def accepted22 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 13
    sx := 22
    sy := 77
    rootType := 1
    leaves := leaves22
    valid := by
      rcases metadata22 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 52
  output := output22
  cover := cover22
  source := source22
  checked := gridTreeUnionCheck_sound 32768 raw22 output22 cover22 source22 tree22 checked22
  units := 157738472
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted22_mass : (accepted22.toPacket grid_pos).mass = phaseMass22 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (157738472 : ℝ)/100000000*(gridUnionAreaUnits output22 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass22
  rw [areaUnits22, phaseMass22_eq]
  norm_num

theorem sourceIndex22 : 6569%4160 = 22*(128-22)+77 ∧
    22<64 ∧ 22≤77 ∧ 77<128-22 := by decide +kernel

def accepted23 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 10
    sx := 26
    sy := 80
    rootType := 1
    leaves := leaves23
    valid := by
      rcases metadata23 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 40
  output := output23
  cover := cover23
  source := source23
  checked := gridTreeUnionCheck_sound 32768 raw23 output23 cover23 source23 tree23 checked23
  units := 144359671
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted23_mass : (accepted23.toPacket grid_pos).mass = phaseMass23 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (144359671 : ℝ)/100000000*(gridUnionAreaUnits output23 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass23
  rw [areaUnits23, phaseMass23_eq]
  norm_num

theorem sourceIndex23 : 6892%4160 = 26*(128-26)+80 ∧
    26<64 ∧ 26≤80 ∧ 80<128-26 := by decide +kernel

def accepted24 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 13
    sx := 8
    sy := 69
    rootType := 0
    leaves := leaves24
    valid := by
      rcases metadata24 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 52
  output := output24
  cover := cover24
  source := source24
  checked := gridTreeUnionCheck_sound 32768 raw24 output24 cover24 source24 tree24 checked24
  units := 67702166
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted24_mass : (accepted24.toPacket grid_pos).mass = phaseMass24 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (67702166 : ℝ)/100000000*(gridUnionAreaUnits output24 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass24
  rw [areaUnits24, phaseMass24_eq]
  norm_num

theorem sourceIndex24 : 1029%4160 = 8*(128-8)+69 ∧
    8<64 ∧ 8≤69 ∧ 69<128-8 := by decide +kernel

def accepted25 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 25
    sx := 9
    sy := 67
    rootType := 1
    leaves := leaves25
    valid := by
      rcases metadata25 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 100
  output := output25
  cover := cover25
  source := source25
  checked := gridTreeUnionCheck_sound 32768 raw25 output25 cover25 source25 tree25 checked25
  units := 135229957
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted25_mass : (accepted25.toPacket grid_pos).mass = phaseMass25 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (135229957 : ℝ)/100000000*(gridUnionAreaUnits output25 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass25
  rw [areaUnits25, phaseMass25_eq]
  norm_num

theorem sourceIndex25 : 5298%4160 = 9*(128-9)+67 ∧
    9<64 ∧ 9≤67 ∧ 67<128-9 := by decide +kernel

def accepted26 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 13
    sx := 3
    sy := 65
    rootType := 1
    leaves := leaves26
    valid := by
      rcases metadata26 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 52
  output := output26
  cover := cover26
  source := source26
  checked := gridTreeUnionCheck_sound 32768 raw26 output26 cover26 source26 tree26 checked26
  units := 202148459
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted26_mass : (accepted26.toPacket grid_pos).mass = phaseMass26 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (202148459 : ℝ)/100000000*(gridUnionAreaUnits output26 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass26
  rw [areaUnits26, phaseMass26_eq]
  norm_num

theorem sourceIndex26 : 4600%4160 = 3*(128-3)+65 ∧
    3<64 ∧ 3≤65 ∧ 65<128-3 := by decide +kernel

def accepted27 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 7
    sx := 21
    sy := 80
    rootType := 0
    leaves := leaves27
    valid := by
      rcases metadata27 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 28
  output := output27
  cover := cover27
  source := source27
  checked := gridTreeUnionCheck_sound 32768 raw27 output27 cover27 source27 tree27 checked27
  units := 152546139
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted27_mass : (accepted27.toPacket grid_pos).mass = phaseMass27 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (152546139 : ℝ)/100000000*(gridUnionAreaUnits output27 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass27
  rw [areaUnits27, phaseMass27_eq]
  norm_num

theorem sourceIndex27 : 2327%4160 = 21*(128-21)+80 ∧
    21<64 ∧ 21≤80 ∧ 80<128-21 := by decide +kernel

def accepted28 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 7
    sx := 16
    sy := 76
    rootType := 0
    leaves := leaves28
    valid := by
      rcases metadata28 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 28
  output := output28
  cover := cover28
  source := source28
  checked := gridTreeUnionCheck_sound 32768 raw28 output28 cover28 source28 tree28 checked28
  units := 147396112
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted28_mass : (accepted28.toPacket grid_pos).mass = phaseMass28 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (147396112 : ℝ)/100000000*(gridUnionAreaUnits output28 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass28
  rw [areaUnits28, phaseMass28_eq]
  norm_num

theorem sourceIndex28 : 1868%4160 = 16*(128-16)+76 ∧
    16<64 ∧ 16≤76 ∧ 76<128-16 := by decide +kernel

def accepted29 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 7
    sx := 17
    sy := 77
    rootType := 0
    leaves := leaves29
    valid := by
      rcases metadata29 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 28
  output := output29
  cover := cover29
  source := source29
  checked := gridTreeUnionCheck_sound 32768 raw29 output29 cover29 source29 tree29 checked29
  units := 147396112
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted29_mass : (accepted29.toPacket grid_pos).mass = phaseMass29 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (147396112 : ℝ)/100000000*(gridUnionAreaUnits output29 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass29
  rw [areaUnits29, phaseMass29_eq]
  norm_num

theorem sourceIndex29 : 1964%4160 = 17*(128-17)+77 ∧
    17<64 ∧ 17≤77 ∧ 77<128-17 := by decide +kernel

def accepted30 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 13
    sx := 18
    sy := 74
    rootType := 1
    leaves := leaves30
    valid := by
      rcases metadata30 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 52
  output := output30
  cover := cover30
  source := source30
  checked := gridTreeUnionCheck_sound 32768 raw30 output30 cover30 source30 tree30 checked30
  units := 157738472
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted30_mass : (accepted30.toPacket grid_pos).mass = phaseMass30 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (157738472 : ℝ)/100000000*(gridUnionAreaUnits output30 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass30
  rw [areaUnits30, phaseMass30_eq]
  norm_num

theorem sourceIndex30 : 6214%4160 = 18*(128-18)+74 ∧
    18<64 ∧ 18≤74 ∧ 74<128-18 := by decide +kernel

def accepted31 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 13
    sx := 11
    sy := 71
    rootType := 0
    leaves := leaves31
    valid := by
      rcases metadata31 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 52
  output := output31
  cover := cover31
  source := source31
  checked := gridTreeUnionCheck_sound 32768 raw31 output31 cover31 source31 tree31 checked31
  units := 67702166
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted31_mass : (accepted31.toPacket grid_pos).mass = phaseMass31 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (67702166 : ℝ)/100000000*(gridUnionAreaUnits output31 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass31
  rw [areaUnits31, phaseMass31_eq]
  norm_num

theorem sourceIndex31 : 1358%4160 = 11*(128-11)+71 ∧
    11<64 ∧ 11≤71 ∧ 71<128-11 := by decide +kernel

def accepted32 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 10
    sx := 0
    sy := 66
    rootType := 0
    leaves := leaves32
    valid := by
      rcases metadata32 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 40
  output := output32
  cover := cover32
  source := source32
  checked := gridTreeUnionCheck_sound 32768 raw32 output32 cover32 source32 tree32 checked32
  units := 114037843
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted32_mass : (accepted32.toPacket grid_pos).mass = phaseMass32 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (114037843 : ℝ)/100000000*(gridUnionAreaUnits output32 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass32
  rw [areaUnits32, phaseMass32_eq]
  norm_num

theorem sourceIndex32 : 66%4160 = 0*(128-0)+66 ∧
    0<64 ∧ 0≤66 ∧ 66<128-0 := by decide +kernel

def accepted33 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 7
    sx := 37
    sy := 89
    rootType := 1
    leaves := leaves33
    valid := by
      rcases metadata33 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 28
  output := output33
  cover := cover33
  source := source33
  checked := gridTreeUnionCheck_sound 32768 raw33 output33 cover33 source33 tree33 checked33
  units := 67962893
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted33_mass : (accepted33.toPacket grid_pos).mass = phaseMass33 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (67962893 : ℝ)/100000000*(gridUnionAreaUnits output33 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass33
  rw [areaUnits33, phaseMass33_eq]
  norm_num

theorem sourceIndex33 : 7616%4160 = 37*(128-37)+89 ∧
    37<64 ∧ 37≤89 ∧ 89<128-37 := by decide +kernel

def accepted34 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 13
    sx := 5
    sy := 66
    rootType := 1
    leaves := leaves34
    valid := by
      rcases metadata34 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 52
  output := output34
  cover := cover34
  source := source34
  checked := gridTreeUnionCheck_sound 32768 raw34 output34 cover34 source34 tree34 checked34
  units := 202148459
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted34_mass : (accepted34.toPacket grid_pos).mass = phaseMass34 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (202148459 : ℝ)/100000000*(gridUnionAreaUnits output34 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass34
  rw [areaUnits34, phaseMass34_eq]
  norm_num

theorem sourceIndex34 : 4841%4160 = 5*(128-5)+66 ∧
    5<64 ∧ 5≤66 ∧ 66<128-5 := by decide +kernel

def accepted35 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 7
    sx := 27
    sy := 84
    rootType := 0
    leaves := leaves35
    valid := by
      rcases metadata35 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 28
  output := output35
  cover := cover35
  source := source35
  checked := gridTreeUnionCheck_sound 32768 raw35 output35 cover35 source35 tree35 checked35
  units := 104681033
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted35_mass : (accepted35.toPacket grid_pos).mass = phaseMass35 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (104681033 : ℝ)/100000000*(gridUnionAreaUnits output35 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass35
  rw [areaUnits35, phaseMass35_eq]
  norm_num

theorem sourceIndex35 : 2811%4160 = 27*(128-27)+84 ∧
    27<64 ∧ 27≤84 ∧ 84<128-27 := by decide +kernel

def accepted36 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 19
    sx := 1
    sy := 64
    rootType := 1
    leaves := leaves36
    valid := by
      rcases metadata36 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 76
  output := output36
  cover := cover36
  source := source36
  checked := gridTreeUnionCheck_sound 32768 raw36 output36 cover36 source36 tree36 checked36
  units := 202148459
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted36_mass : (accepted36.toPacket grid_pos).mass = phaseMass36 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (202148459 : ℝ)/100000000*(gridUnionAreaUnits output36 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass36
  rw [areaUnits36, phaseMass36_eq]
  norm_num

theorem sourceIndex36 : 4351%4160 = 1*(128-1)+64 ∧
    1<64 ∧ 1≤64 ∧ 64<128-1 := by decide +kernel

def accepted37 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 13
    sx := 23
    sy := 78
    rootType := 1
    leaves := leaves37
    valid := by
      rcases metadata37 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 52
  output := output37
  cover := cover37
  source := source37
  checked := gridTreeUnionCheck_sound 32768 raw37 output37 cover37 source37 tree37 checked37
  units := 157738472
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted37_mass : (accepted37.toPacket grid_pos).mass = phaseMass37 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (157738472 : ℝ)/100000000*(gridUnionAreaUnits output37 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass37
  rw [areaUnits37, phaseMass37_eq]
  norm_num

theorem sourceIndex37 : 6653%4160 = 23*(128-23)+78 ∧
    23<64 ∧ 23≤78 ∧ 78<128-23 := by decide +kernel

def accepted38 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 7
    sx := 15
    sy := 75
    rootType := 0
    leaves := leaves38
    valid := by
      rcases metadata38 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 28
  output := output38
  cover := cover38
  source := source38
  checked := gridTreeUnionCheck_sound 32768 raw38 output38 cover38 source38 tree38 checked38
  units := 48363413
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted38_mass : (accepted38.toPacket grid_pos).mass = phaseMass38 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (48363413 : ℝ)/100000000*(gridUnionAreaUnits output38 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass38
  rw [areaUnits38, phaseMass38_eq]
  norm_num

theorem sourceIndex38 : 1770%4160 = 15*(128-15)+75 ∧
    15<64 ∧ 15≤75 ∧ 75<128-15 := by decide +kernel

def accepted39 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 13
    sx := 12
    sy := 69
    rootType := 1
    leaves := leaves39
    valid := by
      rcases metadata39 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 52
  output := output39
  cover := cover39
  source := source39
  checked := gridTreeUnionCheck_sound 32768 raw39 output39 cover39 source39 tree39 checked39
  units := 135229957
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted39_mass : (accepted39.toPacket grid_pos).mass = phaseMass39 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (135229957 : ℝ)/100000000*(gridUnionAreaUnits output39 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass39
  rw [areaUnits39, phaseMass39_eq]
  norm_num

theorem sourceIndex39 : 5621%4160 = 12*(128-12)+69 ∧
    12<64 ∧ 12≤69 ∧ 69<128-12 := by decide +kernel

def accepted40 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 7
    sx := 12
    sy := 72
    rootType := 0
    leaves := leaves40
    valid := by
      rcases metadata40 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 28
  output := output40
  cover := cover40
  source := source40
  checked := gridTreeUnionCheck_sound 32768 raw40 output40 cover40 source40 tree40 checked40
  units := 48363413
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted40_mass : (accepted40.toPacket grid_pos).mass = phaseMass40 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (48363413 : ℝ)/100000000*(gridUnionAreaUnits output40 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass40
  rw [areaUnits40, phaseMass40_eq]
  norm_num

theorem sourceIndex40 : 1464%4160 = 12*(128-12)+72 ∧
    12<64 ∧ 12≤72 ∧ 72<128-12 := by decide +kernel

def accepted41 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 13
    sx := 2
    sy := 67
    rootType := 0
    leaves := leaves41
    valid := by
      rcases metadata41 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 52
  output := output41
  cover := cover41
  source := source41
  checked := gridTreeUnionCheck_sound 32768 raw41 output41 cover41 source41 tree41 checked41
  units := 114037843
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted41_mass : (accepted41.toPacket grid_pos).mass = phaseMass41 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (114037843 : ℝ)/100000000*(gridUnionAreaUnits output41 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass41
  rw [areaUnits41, phaseMass41_eq]
  norm_num

theorem sourceIndex41 : 319%4160 = 2*(128-2)+67 ∧
    2<64 ∧ 2≤67 ∧ 67<128-2 := by decide +kernel

def accepted42 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 13
    sx := 19
    sy := 75
    rootType := 1
    leaves := leaves42
    valid := by
      rcases metadata42 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 52
  output := output42
  cover := cover42
  source := source42
  checked := gridTreeUnionCheck_sound 32768 raw42 output42 cover42 source42 tree42 checked42
  units := 157738472
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted42_mass : (accepted42.toPacket grid_pos).mass = phaseMass42 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (157738472 : ℝ)/100000000*(gridUnionAreaUnits output42 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass42
  rw [areaUnits42, phaseMass42_eq]
  norm_num

theorem sourceIndex42 : 6306%4160 = 19*(128-19)+75 ∧
    19<64 ∧ 19≤75 ∧ 75<128-19 := by decide +kernel

def accepted43 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 13
    sx := 10
    sy := 68
    rootType := 1
    leaves := leaves43
    valid := by
      rcases metadata43 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 52
  output := output43
  cover := cover43
  source := source43
  checked := gridTreeUnionCheck_sound 32768 raw43 output43 cover43 source43 tree43 checked43
  units := 135229957
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted43_mass : (accepted43.toPacket grid_pos).mass = phaseMass43 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (135229957 : ℝ)/100000000*(gridUnionAreaUnits output43 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass43
  rw [areaUnits43, phaseMass43_eq]
  norm_num

theorem sourceIndex43 : 5408%4160 = 10*(128-10)+68 ∧
    10<64 ∧ 10≤68 ∧ 68<128-10 := by decide +kernel

def accepted44 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 10
    sx := 4
    sy := 68
    rootType := 0
    leaves := leaves44
    valid := by
      rcases metadata44 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 40
  output := output44
  cover := cover44
  source := source44
  checked := gridTreeUnionCheck_sound 32768 raw44 output44 cover44 source44 tree44 checked44
  units := 114037843
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted44_mass : (accepted44.toPacket grid_pos).mass = phaseMass44 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (114037843 : ℝ)/100000000*(gridUnionAreaUnits output44 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass44
  rw [areaUnits44, phaseMass44_eq]
  norm_num

theorem sourceIndex44 : 564%4160 = 4*(128-4)+68 ∧
    4<64 ∧ 4≤68 ∧ 68<128-4 := by decide +kernel

def accepted45 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 7
    sx := 14
    sy := 74
    rootType := 0
    leaves := leaves45
    valid := by
      rcases metadata45 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 28
  output := output45
  cover := cover45
  source := source45
  checked := gridTreeUnionCheck_sound 32768 raw45 output45 cover45 source45 tree45 checked45
  units := 48363413
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted45_mass : (accepted45.toPacket grid_pos).mass = phaseMass45 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (48363413 : ℝ)/100000000*(gridUnionAreaUnits output45 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass45
  rw [areaUnits45, phaseMass45_eq]
  norm_num

theorem sourceIndex45 : 1670%4160 = 14*(128-14)+74 ∧
    14<64 ∧ 14≤74 ∧ 74<128-14 := by decide +kernel

def accepted46 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 7
    sx := 24
    sy := 82
    rootType := 0
    leaves := leaves46
    valid := by
      rcases metadata46 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 28
  output := output46
  cover := cover46
  source := source46
  checked := gridTreeUnionCheck_sound 32768 raw46 output46 cover46 source46 tree46 checked46
  units := 104681033
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted46_mass : (accepted46.toPacket grid_pos).mass = phaseMass46 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (104681033 : ℝ)/100000000*(gridUnionAreaUnits output46 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass46
  rw [areaUnits46, phaseMass46_eq]
  norm_num

theorem sourceIndex46 : 2578%4160 = 24*(128-24)+82 ∧
    24<64 ∧ 24≤82 ∧ 82<128-24 := by decide +kernel

def accepted47 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 10
    sx := 27
    sy := 81
    rootType := 1
    leaves := leaves47
    valid := by
      rcases metadata47 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 40
  output := output47
  cover := cover47
  source := source47
  checked := gridTreeUnionCheck_sound 32768 raw47 output47 cover47 source47 tree47 checked47
  units := 144359671
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted47_mass : (accepted47.toPacket grid_pos).mass = phaseMass47 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (144359671 : ℝ)/100000000*(gridUnionAreaUnits output47 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass47
  rw [areaUnits47, phaseMass47_eq]
  norm_num

theorem sourceIndex47 : 6968%4160 = 27*(128-27)+81 ∧
    27<64 ∧ 27≤81 ∧ 81<128-27 := by decide +kernel

def accepted48 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 10
    sx := 18
    sy := 78
    rootType := 0
    leaves := leaves48
    valid := by
      rcases metadata48 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 40
  output := output48
  cover := cover48
  source := source48
  checked := gridTreeUnionCheck_sound 32768 raw48 output48 cover48 source48 tree48 checked48
  units := 147396112
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted48_mass : (accepted48.toPacket grid_pos).mass = phaseMass48 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (147396112 : ℝ)/100000000*(gridUnionAreaUnits output48 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass48
  rw [areaUnits48, phaseMass48_eq]
  norm_num

theorem sourceIndex48 : 2058%4160 = 18*(128-18)+78 ∧
    18<64 ∧ 18≤78 ∧ 78<128-18 := by decide +kernel

def accepted49 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 7
    sx := 24
    sy := 79
    rootType := 1
    leaves := leaves49
    valid := by
      rcases metadata49 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 28
  output := output49
  cover := cover49
  source := source49
  checked := gridTreeUnionCheck_sound 32768 raw49 output49 cover49 source49 tree49 checked49
  units := 140060506
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted49_mass : (accepted49.toPacket grid_pos).mass = phaseMass49 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (140060506 : ℝ)/100000000*(gridUnionAreaUnits output49 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass49
  rw [areaUnits49, phaseMass49_eq]
  norm_num

theorem sourceIndex49 : 6735%4160 = 24*(128-24)+79 ∧
    24<64 ∧ 24≤79 ∧ 79<128-24 := by decide +kernel

def accepted50 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 13
    sx := 20
    sy := 76
    rootType := 1
    leaves := leaves50
    valid := by
      rcases metadata50 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 52
  output := output50
  cover := cover50
  source := source50
  checked := gridTreeUnionCheck_sound 32768 raw50 output50 cover50 source50 tree50 checked50
  units := 157738472
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted50_mass : (accepted50.toPacket grid_pos).mass = phaseMass50 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (157738472 : ℝ)/100000000*(gridUnionAreaUnits output50 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass50
  rw [areaUnits50, phaseMass50_eq]
  norm_num

theorem sourceIndex50 : 6396%4160 = 20*(128-20)+76 ∧
    20<64 ∧ 20≤76 ∧ 76<128-20 := by decide +kernel

def accepted51 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 19
    sx := 7
    sy := 69
    rootType := 0
    leaves := leaves51
    valid := by
      rcases metadata51 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 76
  output := output51
  cover := cover51
  source := source51
  checked := gridTreeUnionCheck_sound 32768 raw51 output51 cover51 source51 tree51 checked51
  units := 114037843
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted51_mass : (accepted51.toPacket grid_pos).mass = phaseMass51 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (114037843 : ℝ)/100000000*(gridUnionAreaUnits output51 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass51
  rw [areaUnits51, phaseMass51_eq]
  norm_num

theorem sourceIndex51 : 916%4160 = 7*(128-7)+69 ∧
    7<64 ∧ 7≤69 ∧ 69<128-7 := by decide +kernel

def accepted52 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 19
    sx := 8
    sy := 67
    rootType := 1
    leaves := leaves52
    valid := by
      rcases metadata52 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 76
  output := output52
  cover := cover52
  source := source52
  checked := gridTreeUnionCheck_sound 32768 raw52 output52 cover52 source52 tree52 checked52
  units := 135229957
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted52_mass : (accepted52.toPacket grid_pos).mass = phaseMass52 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (135229957 : ℝ)/100000000*(gridUnionAreaUnits output52 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass52
  rw [areaUnits52, phaseMass52_eq]
  norm_num

theorem sourceIndex52 : 5187%4160 = 8*(128-8)+67 ∧
    8<64 ∧ 8≤67 ∧ 67<128-8 := by decide +kernel

def accepted53 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 7
    sx := 28
    sy := 85
    rootType := 0
    leaves := leaves53
    valid := by
      rcases metadata53 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 28
  output := output53
  cover := cover53
  source := source53
  checked := gridTreeUnionCheck_sound 32768 raw53 output53 cover53 source53 tree53 checked53
  units := 104681033
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted53_mass : (accepted53.toPacket grid_pos).mass = phaseMass53 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (104681033 : ℝ)/100000000*(gridUnionAreaUnits output53 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass53
  rw [areaUnits53, phaseMass53_eq]
  norm_num

theorem sourceIndex53 : 2885%4160 = 28*(128-28)+85 ∧
    28<64 ∧ 28≤85 ∧ 85<128-28 := by decide +kernel

def accepted54 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 7
    sx := 34
    sy := 90
    rootType := 0
    leaves := leaves54
    valid := by
      rcases metadata54 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 28
  output := output54
  cover := cover54
  source := source54
  checked := gridTreeUnionCheck_sound 32768 raw54 output54 cover54 source54 tree54 checked54
  units := 75538780
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted54_mass : (accepted54.toPacket grid_pos).mass = phaseMass54 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (75538780 : ℝ)/100000000*(gridUnionAreaUnits output54 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass54
  rw [areaUnits54, phaseMass54_eq]
  norm_num

theorem sourceIndex54 : 3286%4160 = 34*(128-34)+90 ∧
    34<64 ∧ 34≤90 ∧ 90<128-34 := by decide +kernel

def accepted55 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 7
    sx := 33
    sy := 89
    rootType := 0
    leaves := leaves55
    valid := by
      rcases metadata55 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 28
  output := output55
  cover := cover55
  source := source55
  checked := gridTreeUnionCheck_sound 32768 raw55 output55 cover55 source55 tree55 checked55
  units := 75538780
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted55_mass : (accepted55.toPacket grid_pos).mass = phaseMass55 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (75538780 : ℝ)/100000000*(gridUnionAreaUnits output55 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass55
  rw [areaUnits55, phaseMass55_eq]
  norm_num

theorem sourceIndex55 : 3224%4160 = 33*(128-33)+89 ∧
    33<64 ∧ 33≤89 ∧ 89<128-33 := by decide +kernel

def accepted56 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 7
    sx := 13
    sy := 73
    rootType := 0
    leaves := leaves56
    valid := by
      rcases metadata56 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 28
  output := output56
  cover := cover56
  source := source56
  checked := gridTreeUnionCheck_sound 32768 raw56 output56 cover56 source56 tree56 checked56
  units := 48363413
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted56_mass : (accepted56.toPacket grid_pos).mass = phaseMass56 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (48363413 : ℝ)/100000000*(gridUnionAreaUnits output56 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass56
  rw [areaUnits56, phaseMass56_eq]
  norm_num

theorem sourceIndex56 : 1568%4160 = 13*(128-13)+73 ∧
    13<64 ∧ 13≤73 ∧ 73<128-13 := by decide +kernel

def accepted57 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 16
    sx := 9
    sy := 70
    rootType := 0
    leaves := leaves57
    valid := by
      rcases metadata57 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 64
  output := output57
  cover := cover57
  source := source57
  checked := gridTreeUnionCheck_sound 32768 raw57 output57 cover57 source57 tree57 checked57
  units := 67702166
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted57_mass : (accepted57.toPacket grid_pos).mass = phaseMass57 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (67702166 : ℝ)/100000000*(gridUnionAreaUnits output57 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass57
  rw [areaUnits57, phaseMass57_eq]
  norm_num

theorem sourceIndex57 : 1141%4160 = 9*(128-9)+70 ∧
    9<64 ∧ 9≤70 ∧ 70<128-9 := by decide +kernel

def accepted58 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 7
    sx := 19
    sy := 79
    rootType := 0
    leaves := leaves58
    valid := by
      rcases metadata58 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 28
  output := output58
  cover := cover58
  source := source58
  checked := gridTreeUnionCheck_sound 32768 raw58 output58 cover58 source58 tree58 checked58
  units := 147396112
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted58_mass : (accepted58.toPacket grid_pos).mass = phaseMass58 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (147396112 : ℝ)/100000000*(gridUnionAreaUnits output58 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass58
  rw [areaUnits58, phaseMass58_eq]
  norm_num

theorem sourceIndex58 : 2150%4160 = 19*(128-19)+79 ∧
    19<64 ∧ 19≤79 ∧ 79<128-19 := by decide +kernel

def accepted59 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 13
    sx := 13
    sy := 70
    rootType := 1
    leaves := leaves59
    valid := by
      rcases metadata59 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 52
  output := output59
  cover := cover59
  source := source59
  checked := gridTreeUnionCheck_sound 32768 raw59 output59 cover59 source59 tree59 checked59
  units := 135229957
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted59_mass : (accepted59.toPacket grid_pos).mass = phaseMass59 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (135229957 : ℝ)/100000000*(gridUnionAreaUnits output59 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass59
  rw [areaUnits59, phaseMass59_eq]
  norm_num

theorem sourceIndex59 : 5725%4160 = 13*(128-13)+70 ∧
    13<64 ∧ 13≤70 ∧ 70<128-13 := by decide +kernel

def accepted60 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 13
    sx := 2
    sy := 65
    rootType := 1
    leaves := leaves60
    valid := by
      rcases metadata60 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 52
  output := output60
  cover := cover60
  source := source60
  checked := gridTreeUnionCheck_sound 32768 raw60 output60 cover60 source60 tree60 checked60
  units := 202148459
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted60_mass : (accepted60.toPacket grid_pos).mass = phaseMass60 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (202148459 : ℝ)/100000000*(gridUnionAreaUnits output60 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass60
  rw [areaUnits60, phaseMass60_eq]
  norm_num

theorem sourceIndex60 : 4477%4160 = 2*(128-2)+65 ∧
    2<64 ∧ 2≤65 ∧ 65<128-2 := by decide +kernel

def accepted61 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 16
    sx := 0
    sy := 64
    rootType := 1
    leaves := leaves61
    valid := by
      rcases metadata61 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 64
  output := output61
  cover := cover61
  source := source61
  checked := gridTreeUnionCheck_sound 32768 raw61 output61 cover61 source61 tree61 checked61
  units := 202148459
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted61_mass : (accepted61.toPacket grid_pos).mass = phaseMass61 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (202148459 : ℝ)/100000000*(gridUnionAreaUnits output61 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass61
  rw [areaUnits61, phaseMass61_eq]
  norm_num

theorem sourceIndex61 : 4224%4160 = 0*(128-0)+64 ∧
    0<64 ∧ 0≤64 ∧ 64<128-0 := by decide +kernel

def accepted62 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 13
    sx := 4
    sy := 66
    rootType := 1
    leaves := leaves62
    valid := by
      rcases metadata62 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 52
  output := output62
  cover := cover62
  source := source62
  checked := gridTreeUnionCheck_sound 32768 raw62 output62 cover62 source62 tree62 checked62
  units := 202148459
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted62_mass : (accepted62.toPacket grid_pos).mass = phaseMass62 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (202148459 : ℝ)/100000000*(gridUnionAreaUnits output62 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass62
  rw [areaUnits62, phaseMass62_eq]
  norm_num

theorem sourceIndex62 : 4722%4160 = 4*(128-4)+66 ∧
    4<64 ∧ 4≤66 ∧ 66<128-4 := by decide +kernel

def accepted63 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 31
    sx := 7
    sy := 67
    rootType := 1
    leaves := leaves63
    valid := by
      rcases metadata63 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 124
  output := output63
  cover := cover63
  source := source63
  checked := gridTreeUnionCheck_sound 32768 raw63 output63 cover63 source63 tree63 checked63
  units := 202148459
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted63_mass : (accepted63.toPacket grid_pos).mass = phaseMass63 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (202148459 : ℝ)/100000000*(gridUnionAreaUnits output63 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass63
  rw [areaUnits63, phaseMass63_eq]
  norm_num

theorem sourceIndex63 : 5074%4160 = 7*(128-7)+67 ∧
    7<64 ∧ 7≤67 ∧ 67<128-7 := by decide +kernel

def accepted64 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 10
    sx := 1
    sy := 67
    rootType := 0
    leaves := leaves64
    valid := by
      rcases metadata64 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 40
  output := output64
  cover := cover64
  source := source64
  checked := gridTreeUnionCheck_sound 32768 raw64 output64 cover64 source64 tree64 checked64
  units := 114037843
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted64_mass : (accepted64.toPacket grid_pos).mass = phaseMass64 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (114037843 : ℝ)/100000000*(gridUnionAreaUnits output64 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass64
  rw [areaUnits64, phaseMass64_eq]
  norm_num

theorem sourceIndex64 : 194%4160 = 1*(128-1)+67 ∧
    1<64 ∧ 1≤67 ∧ 67<128-1 := by decide +kernel

def accepted65 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 13
    sx := 6
    sy := 69
    rootType := 0
    leaves := leaves65
    valid := by
      rcases metadata65 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 52
  output := output65
  cover := cover65
  source := source65
  checked := gridTreeUnionCheck_sound 32768 raw65 output65 cover65 source65 tree65 checked65
  units := 114037843
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted65_mass : (accepted65.toPacket grid_pos).mass = phaseMass65 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (114037843 : ℝ)/100000000*(gridUnionAreaUnits output65 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass65
  rw [areaUnits65, phaseMass65_eq]
  norm_num

theorem sourceIndex65 : 801%4160 = 6*(128-6)+69 ∧
    6<64 ∧ 6≤69 ∧ 69<128-6 := by decide +kernel

def accepted66 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 10
    sx := 3
    sy := 68
    rootType := 0
    leaves := leaves66
    valid := by
      rcases metadata66 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 40
  output := output66
  cover := cover66
  source := source66
  checked := gridTreeUnionCheck_sound 32768 raw66 output66 cover66 source66 tree66 checked66
  units := 114037843
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted66_mass : (accepted66.toPacket grid_pos).mass = phaseMass66 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (114037843 : ℝ)/100000000*(gridUnionAreaUnits output66 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass66
  rw [areaUnits66, phaseMass66_eq]
  norm_num

theorem sourceIndex66 : 443%4160 = 3*(128-3)+68 ∧
    3<64 ∧ 3≤68 ∧ 68<128-3 := by decide +kernel

def accepted67 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 7
    sx := 15
    sy := 72
    rootType := 1
    leaves := leaves67
    valid := by
      rcases metadata67 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 28
  output := output67
  cover := cover67
  source := source67
  checked := gridTreeUnionCheck_sound 32768 raw67 output67 cover67 source67 tree67 checked67
  units := 94387549
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted67_mass : (accepted67.toPacket grid_pos).mass = phaseMass67 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (94387549 : ℝ)/100000000*(gridUnionAreaUnits output67 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass67
  rw [areaUnits67, phaseMass67_eq]
  norm_num

theorem sourceIndex67 : 5927%4160 = 15*(128-15)+72 ∧
    15<64 ∧ 15≤72 ∧ 72<128-15 := by decide +kernel

def accepted68 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 13
    sx := 14
    sy := 71
    rootType := 1
    leaves := leaves68
    valid := by
      rcases metadata68 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 52
  output := output68
  cover := cover68
  source := source68
  checked := gridTreeUnionCheck_sound 32768 raw68 output68 cover68 source68 tree68 checked68
  units := 135229957
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted68_mass : (accepted68.toPacket grid_pos).mass = phaseMass68 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (135229957 : ℝ)/100000000*(gridUnionAreaUnits output68 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass68
  rw [areaUnits68, phaseMass68_eq]
  norm_num

theorem sourceIndex68 : 5827%4160 = 14*(128-14)+71 ∧
    14<64 ∧ 14≤71 ∧ 71<128-14 := by decide +kernel

def accepted69 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 13
    sx := 11
    sy := 69
    rootType := 1
    leaves := leaves69
    valid := by
      rcases metadata69 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 52
  output := output69
  cover := cover69
  source := source69
  checked := gridTreeUnionCheck_sound 32768 raw69 output69 cover69 source69 tree69 checked69
  units := 135229957
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted69_mass : (accepted69.toPacket grid_pos).mass = phaseMass69 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (135229957 : ℝ)/100000000*(gridUnionAreaUnits output69 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass69
  rw [areaUnits69, phaseMass69_eq]
  norm_num

theorem sourceIndex69 : 5516%4160 = 11*(128-11)+69 ∧
    11<64 ∧ 11≤69 ∧ 69<128-11 := by decide +kernel

def accepted70 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 13
    sx := 9
    sy := 68
    rootType := 1
    leaves := leaves70
    valid := by
      rcases metadata70 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 52
  output := output70
  cover := cover70
  source := source70
  checked := gridTreeUnionCheck_sound 32768 raw70 output70 cover70 source70 tree70 checked70
  units := 135229957
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted70_mass : (accepted70.toPacket grid_pos).mass = phaseMass70 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (135229957 : ℝ)/100000000*(gridUnionAreaUnits output70 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass70
  rw [areaUnits70, phaseMass70_eq]
  norm_num

theorem sourceIndex70 : 5299%4160 = 9*(128-9)+68 ∧
    9<64 ∧ 9≤68 ∧ 68<128-9 := by decide +kernel

def accepted71 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 13
    sx := 21
    sy := 77
    rootType := 1
    leaves := leaves71
    valid := by
      rcases metadata71 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 52
  output := output71
  cover := cover71
  source := source71
  checked := gridTreeUnionCheck_sound 32768 raw71 output71 cover71 source71 tree71 checked71
  units := 157738472
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted71_mass : (accepted71.toPacket grid_pos).mass = phaseMass71 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (157738472 : ℝ)/100000000*(gridUnionAreaUnits output71 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass71
  rw [areaUnits71, phaseMass71_eq]
  norm_num

theorem sourceIndex71 : 6484%4160 = 21*(128-21)+77 ∧
    21<64 ∧ 21≤77 ∧ 77<128-21 := by decide +kernel

def accepted72 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 13
    sx := 22
    sy := 81
    rootType := 0
    leaves := leaves72
    valid := by
      rcases metadata72 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 52
  output := output72
  cover := cover72
  source := source72
  checked := gridTreeUnionCheck_sound 32768 raw72 output72 cover72 source72 tree72 checked72
  units := 152546139
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted72_mass : (accepted72.toPacket grid_pos).mass = phaseMass72 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (152546139 : ℝ)/100000000*(gridUnionAreaUnits output72 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass72
  rw [areaUnits72, phaseMass72_eq]
  norm_num

theorem sourceIndex72 : 2413%4160 = 22*(128-22)+81 ∧
    22<64 ∧ 22≤81 ∧ 81<128-22 := by decide +kernel

def accepted73 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 13
    sx := 28
    sy := 82
    rootType := 1
    leaves := leaves73
    valid := by
      rcases metadata73 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 52
  output := output73
  cover := cover73
  source := source73
  checked := gridTreeUnionCheck_sound 32768 raw73 output73 cover73 source73 tree73 checked73
  units := 144359671
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted73_mass : (accepted73.toPacket grid_pos).mass = phaseMass73 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (144359671 : ℝ)/100000000*(gridUnionAreaUnits output73 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass73
  rw [areaUnits73, phaseMass73_eq]
  norm_num

theorem sourceIndex73 : 7042%4160 = 28*(128-28)+82 ∧
    28<64 ∧ 28≤82 ∧ 82<128-28 := by decide +kernel

def accepted74 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 7
    sx := 35
    sy := 91
    rootType := 0
    leaves := leaves74
    valid := by
      rcases metadata74 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 28
  output := output74
  cover := cover74
  source := source74
  checked := gridTreeUnionCheck_sound 32768 raw74 output74 cover74 source74 tree74 checked74
  units := 75538780
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted74_mass : (accepted74.toPacket grid_pos).mass = phaseMass74 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (75538780 : ℝ)/100000000*(gridUnionAreaUnits output74 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass74
  rw [areaUnits74, phaseMass74_eq]
  norm_num

theorem sourceIndex74 : 3346%4160 = 35*(128-35)+91 ∧
    35<64 ∧ 35≤91 ∧ 91<128-35 := by decide +kernel

def accepted75 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 7
    sx := 35
    sy := 88
    rootType := 1
    leaves := leaves75
    valid := by
      rcases metadata75 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 28
  output := output75
  cover := cover75
  source := source75
  checked := gridTreeUnionCheck_sound 32768 raw75 output75 cover75 source75 tree75 checked75
  units := 67962893
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted75_mass : (accepted75.toPacket grid_pos).mass = phaseMass75 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (67962893 : ℝ)/100000000*(gridUnionAreaUnits output75 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass75
  rw [areaUnits75, phaseMass75_eq]
  norm_num

theorem sourceIndex75 : 7503%4160 = 35*(128-35)+88 ∧
    35<64 ∧ 35≤88 ∧ 88<128-35 := by decide +kernel

def accepted76 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 7
    sx := 29
    sy := 86
    rootType := 0
    leaves := leaves76
    valid := by
      rcases metadata76 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 28
  output := output76
  cover := cover76
  source := source76
  checked := gridTreeUnionCheck_sound 32768 raw76 output76 cover76 source76 tree76 checked76
  units := 104681033
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted76_mass : (accepted76.toPacket grid_pos).mass = phaseMass76 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (104681033 : ℝ)/100000000*(gridUnionAreaUnits output76 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass76
  rw [areaUnits76, phaseMass76_eq]
  norm_num

theorem sourceIndex76 : 2957%4160 = 29*(128-29)+86 ∧
    29<64 ∧ 29≤86 ∧ 86<128-29 := by decide +kernel

def accepted77 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 7
    sx := 30
    sy := 87
    rootType := 0
    leaves := leaves77
    valid := by
      rcases metadata77 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 28
  output := output77
  cover := cover77
  source := source77
  checked := gridTreeUnionCheck_sound 32768 raw77 output77 cover77 source77 tree77 checked77
  units := 104681033
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted77_mass : (accepted77.toPacket grid_pos).mass = phaseMass77 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (104681033 : ℝ)/100000000*(gridUnionAreaUnits output77 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass77
  rw [areaUnits77, phaseMass77_eq]
  norm_num

theorem sourceIndex77 : 3027%4160 = 30*(128-30)+87 ∧
    30<64 ∧ 30≤87 ∧ 87<128-30 := by decide +kernel

def accepted78 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 7
    sx := 25
    sy := 83
    rootType := 0
    leaves := leaves78
    valid := by
      rcases metadata78 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 28
  output := output78
  cover := cover78
  source := source78
  checked := gridTreeUnionCheck_sound 32768 raw78 output78 cover78 source78 tree78 checked78
  units := 104681033
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted78_mass : (accepted78.toPacket grid_pos).mass = phaseMass78 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (104681033 : ℝ)/100000000*(gridUnionAreaUnits output78 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass78
  rw [areaUnits78, phaseMass78_eq]
  norm_num

theorem sourceIndex78 : 2658%4160 = 25*(128-25)+83 ∧
    25<64 ∧ 25≤83 ∧ 83<128-25 := by decide +kernel

def accepted79 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 7
    sx := 31
    sy := 88
    rootType := 0
    leaves := leaves79
    valid := by
      rcases metadata79 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 28
  output := output79
  cover := cover79
  source := source79
  checked := gridTreeUnionCheck_sound 32768 raw79 output79 cover79 source79 tree79 checked79
  units := 145899414
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted79_mass : (accepted79.toPacket grid_pos).mass = phaseMass79 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (145899414 : ℝ)/100000000*(gridUnionAreaUnits output79 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass79
  rw [areaUnits79, phaseMass79_eq]
  norm_num

theorem sourceIndex79 : 3095%4160 = 31*(128-31)+88 ∧
    31<64 ∧ 31≤88 ∧ 88<128-31 := by decide +kernel

def accepted80 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 7
    sx := 32
    sy := 86
    rootType := 1
    leaves := leaves80
    valid := by
      rcases metadata80 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 28
  output := output80
  cover := cover80
  source := source80
  checked := gridTreeUnionCheck_sound 32768 raw80 output80 cover80 source80 tree80 checked80
  units := 156512574
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted80_mass : (accepted80.toPacket grid_pos).mass = phaseMass80 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (156512574 : ℝ)/100000000*(gridUnionAreaUnits output80 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass80
  rw [areaUnits80, phaseMass80_eq]
  norm_num

theorem sourceIndex80 : 7318%4160 = 32*(128-32)+86 ∧
    32<64 ∧ 32≤86 ∧ 86<128-32 := by decide +kernel

def accepted81 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 7
    sx := 31
    sy := 85
    rootType := 1
    leaves := leaves81
    valid := by
      rcases metadata81 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 28
  output := output81
  cover := cover81
  source := source81
  checked := gridTreeUnionCheck_sound 32768 raw81 output81 cover81 source81 tree81 checked81
  units := 144359671
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted81_mass : (accepted81.toPacket grid_pos).mass = phaseMass81 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (144359671 : ℝ)/100000000*(gridUnionAreaUnits output81 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass81
  rw [areaUnits81, phaseMass81_eq]
  norm_num

theorem sourceIndex81 : 7252%4160 = 31*(128-31)+85 ∧
    31<64 ∧ 31≤85 ∧ 85<128-31 := by decide +kernel

def accepted82 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 10
    sx := 29
    sy := 83
    rootType := 1
    leaves := leaves82
    valid := by
      rcases metadata82 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 40
  output := output82
  cover := cover82
  source := source82
  checked := gridTreeUnionCheck_sound 32768 raw82 output82 cover82 source82 tree82 checked82
  units := 144359671
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted82_mass : (accepted82.toPacket grid_pos).mass = phaseMass82 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (144359671 : ℝ)/100000000*(gridUnionAreaUnits output82 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass82
  rw [areaUnits82, phaseMass82_eq]
  norm_num

theorem sourceIndex82 : 7114%4160 = 29*(128-29)+83 ∧
    29<64 ∧ 29≤83 ∧ 83<128-29 := by decide +kernel

def accepted83 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 7
    sx := 33
    sy := 87
    rootType := 1
    leaves := leaves83
    valid := by
      rcases metadata83 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 28
  output := output83
  cover := cover83
  source := source83
  checked := gridTreeUnionCheck_sound 32768 raw83 output83 cover83 source83 tree83 checked83
  units := 156512574
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted83_mass : (accepted83.toPacket grid_pos).mass = phaseMass83 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (156512574 : ℝ)/100000000*(gridUnionAreaUnits output83 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass83
  rw [areaUnits83, phaseMass83_eq]
  norm_num

theorem sourceIndex83 : 7382%4160 = 33*(128-33)+87 ∧
    33<64 ∧ 33≤87 ∧ 87<128-33 := by decide +kernel

def accepted84 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 19
    sx := 16
    sy := 73
    rootType := 1
    leaves := leaves84
    valid := by
      rcases metadata84 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 76
  output := output84
  cover := cover84
  source := source84
  checked := gridTreeUnionCheck_sound 32768 raw84 output84 cover84 source84 tree84 checked84
  units := 157738472
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted84_mass : (accepted84.toPacket grid_pos).mass = phaseMass84 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (157738472 : ℝ)/100000000*(gridUnionAreaUnits output84 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass84
  rw [areaUnits84, phaseMass84_eq]
  norm_num

theorem sourceIndex84 : 6025%4160 = 16*(128-16)+73 ∧
    16<64 ∧ 16≤73 ∧ 73<128-16 := by decide +kernel

def accepted85 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 31
    sx := 6
    sy := 67
    rootType := 1
    leaves := leaves85
    valid := by
      rcases metadata85 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 124
  output := output85
  cover := cover85
  source := source85
  checked := gridTreeUnionCheck_sound 32768 raw85 output85 cover85 source85 tree85 checked85
  units := 202148459
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted85_mass : (accepted85.toPacket grid_pos).mass = phaseMass85 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (202148459 : ℝ)/100000000*(gridUnionAreaUnits output85 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass85
  rw [areaUnits85, phaseMass85_eq]
  norm_num

theorem sourceIndex85 : 4959%4160 = 6*(128-6)+67 ∧
    6<64 ∧ 6≤67 ∧ 67<128-6 := by decide +kernel

def accepted86 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 10
    sx := 30
    sy := 84
    rootType := 1
    leaves := leaves86
    valid := by
      rcases metadata86 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 40
  output := output86
  cover := cover86
  source := source86
  checked := gridTreeUnionCheck_sound 32768 raw86 output86 cover86 source86 tree86 checked86
  units := 144359671
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted86_mass : (accepted86.toPacket grid_pos).mass = phaseMass86 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (144359671 : ℝ)/100000000*(gridUnionAreaUnits output86 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass86
  rw [areaUnits86, phaseMass86_eq]
  norm_num

theorem sourceIndex86 : 7184%4160 = 30*(128-30)+84 ∧
    30<64 ∧ 30≤84 ∧ 84<128-30 := by decide +kernel

def acceptedData : FiniteInputTree (CheckedAcceptedPhase 32768 8) 87 :=
  (.node (.node (.node (.node (.node (.node (.single accepted0) (.single accepted1)) (.node (.single accepted2) (.node (.single accepted3) (.single accepted4)))) (.node (.node (.single accepted5) (.single accepted6)) (.node (.single accepted7) (.node (.single accepted8) (.single accepted9))))) (.node (.node (.node (.single accepted10) (.single accepted11)) (.node (.single accepted12) (.node (.single accepted13) (.single accepted14)))) (.node (.node (.single accepted15) (.node (.single accepted16) (.single accepted17))) (.node (.single accepted18) (.node (.single accepted19) (.single accepted20)))))) (.node (.node (.node (.node (.single accepted21) (.single accepted22)) (.node (.single accepted23) (.node (.single accepted24) (.single accepted25)))) (.node (.node (.single accepted26) (.node (.single accepted27) (.single accepted28))) (.node (.single accepted29) (.node (.single accepted30) (.single accepted31))))) (.node (.node (.node (.single accepted32) (.single accepted33)) (.node (.single accepted34) (.node (.single accepted35) (.single accepted36)))) (.node (.node (.single accepted37) (.node (.single accepted38) (.single accepted39))) (.node (.single accepted40) (.node (.single accepted41) (.single accepted42))))))) (.node (.node (.node (.node (.node (.single accepted43) (.single accepted44)) (.node (.single accepted45) (.node (.single accepted46) (.single accepted47)))) (.node (.node (.single accepted48) (.node (.single accepted49) (.single accepted50))) (.node (.single accepted51) (.node (.single accepted52) (.single accepted53))))) (.node (.node (.node (.single accepted54) (.single accepted55)) (.node (.single accepted56) (.node (.single accepted57) (.single accepted58)))) (.node (.node (.single accepted59) (.node (.single accepted60) (.single accepted61))) (.node (.single accepted62) (.node (.single accepted63) (.single accepted64)))))) (.node (.node (.node (.node (.single accepted65) (.single accepted66)) (.node (.single accepted67) (.node (.single accepted68) (.single accepted69)))) (.node (.node (.single accepted70) (.node (.single accepted71) (.single accepted72))) (.node (.single accepted73) (.node (.single accepted74) (.single accepted75))))) (.node (.node (.node (.single accepted76) (.single accepted77)) (.node (.single accepted78) (.node (.single accepted79) (.single accepted80)))) (.node (.node (.single accepted81) (.node (.single accepted82) (.single accepted83))) (.node (.single accepted84) (.node (.single accepted85) (.single accepted86))))))))

def accepted : Fin 87 → CheckedAcceptedPhase 32768 8 := acceptedData.get

def actualSchedule : Schedule 87 := checkedAcceptedSchedule accepted grid_pos

theorem acceptedData_list : acceptedData.toList = [accepted0,accepted1,accepted2,accepted3,accepted4,accepted5,accepted6,accepted7,accepted8,accepted9,accepted10,accepted11,accepted12,accepted13,accepted14,accepted15,accepted16,accepted17,accepted18,accepted19,accepted20,accepted21,accepted22,accepted23,accepted24,accepted25,accepted26,accepted27,accepted28,accepted29,accepted30,accepted31,accepted32,accepted33,accepted34,accepted35,accepted36,accepted37,accepted38,accepted39,accepted40,accepted41,accepted42,accepted43,accepted44,accepted45,accepted46,accepted47,accepted48,accepted49,accepted50,accepted51,accepted52,accepted53,accepted54,accepted55,accepted56,accepted57,accepted58,accepted59,accepted60,accepted61,accepted62,accepted63,accepted64,accepted65,accepted66,accepted67,accepted68,accepted69,accepted70,accepted71,accepted72,accepted73,accepted74,accepted75,accepted76,accepted77,accepted78,accepted79,accepted80,accepted81,accepted82,accepted83,accepted84,accepted85,accepted86] := rfl

theorem actual_schedule_mass :
    actualSchedule.typedInputMass (fun j => (accepted j).phase.rootType)
      (fun j => ((accepted j).toPacket grid_pos).field) =
        (5839226749/819200000000 : ℝ) := by
  unfold actualSchedule checkedAcceptedSchedule
  rw [scheduleOfDurations_mass _ _ _ _ (fun j => ((accepted j).toPacket grid_pos).integrable)]
  change (∑ j : Fin 87, ((acceptedData.get j).toPacket grid_pos).mass) = _
  rw [FiniteInputTree.sum_get acceptedData (fun a => (a.toPacket grid_pos).mass), acceptedData_list]
  simp only [List.map_cons, List.map_nil]
  rw [accepted0_mass,accepted1_mass,accepted2_mass,accepted3_mass,accepted4_mass,accepted5_mass,accepted6_mass,accepted7_mass,accepted8_mass,accepted9_mass,accepted10_mass,accepted11_mass,accepted12_mass,accepted13_mass,accepted14_mass,accepted15_mass,accepted16_mass,accepted17_mass,accepted18_mass,accepted19_mass,accepted20_mass,accepted21_mass,accepted22_mass,accepted23_mass,accepted24_mass,accepted25_mass,accepted26_mass,accepted27_mass,accepted28_mass,accepted29_mass,accepted30_mass,accepted31_mass,accepted32_mass,accepted33_mass,accepted34_mass,accepted35_mass,accepted36_mass,accepted37_mass,accepted38_mass,accepted39_mass,accepted40_mass,accepted41_mass,accepted42_mass,accepted43_mass,accepted44_mass,accepted45_mass,accepted46_mass,accepted47_mass,accepted48_mass,accepted49_mass,accepted50_mass,accepted51_mass,accepted52_mass,accepted53_mass,accepted54_mass,accepted55_mass,accepted56_mass,accepted57_mass,accepted58_mass,accepted59_mass,accepted60_mass,accepted61_mass,accepted62_mass,accepted63_mass,accepted64_mass,accepted65_mass,accepted66_mass,accepted67_mass,accepted68_mass,accepted69_mass,accepted70_mass,accepted71_mass,accepted72_mass,accepted73_mass,accepted74_mass,accepted75_mass,accepted76_mass,accepted77_mass,accepted78_mass,accepted79_mass,accepted80_mass,accepted81_mass,accepted82_mass,accepted83_mass,accepted84_mass,accepted85_mass,accepted86_mass]
  exact actual_batch_mass

theorem actual_prefix_le_coarse (T : ℝ) (hT : 0 ≤ T) (r : Fin 4) (x y : ℝ) :
    actualSchedule.cumulative (fun j => ((accepted j).toPacket grid_pos).typedField r x y) T ≤
      actualSchedule.coarseAcceptedPrefix (fun j => (accepted j).phase) 32768
        (commonGridLines 32768) (commonGridLines 32768) T r x y :=
  actualSchedule.checkedAcceptedPrefix_le_coarse accepted grid_pos T hT r x y

end NoThreeLine.ScheduleUnionBatch05738Accepted

#print axioms NoThreeLine.ScheduleUnionBatch05738Accepted.actual_schedule_mass
#print axioms NoThreeLine.ScheduleUnionBatch05738Accepted.actual_prefix_le_coarse
