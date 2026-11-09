import NoThreeLine.ScheduleUnionBatch00160
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
namespace NoThreeLine.ScheduleUnionBatch00160Accepted
open ScheduleUnionBatch00160

theorem grid_pos : 0 < (32768 : ℕ) := by decide

def accepted0 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 1
    sx := 23
    sy := 24
    rootType := 0
    leaves := leaves0
    valid := by
      rcases metadata0 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 4
  output := output0
  cover := cover0
  source := source0
  checked := gridTreeUnionCheck_sound 32768 raw0 output0 cover0 source0 tree0 checked0
  units := 327195324
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted0_mass : (accepted0.toPacket grid_pos).mass = phaseMass0 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (327195324 : ℝ)/100000000*(gridUnionAreaUnits output0 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass0
  rw [areaUnits0, phaseMass0_eq]
  norm_num

theorem sourceIndex0 : 2439%4160 = 23*(128-23)+24 ∧
    23<64 ∧ 23≤24 ∧ 24<128-23 := by decide +kernel

def accepted1 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 1
    sx := 23
    sy := 23
    rootType := 0
    leaves := leaves1
    valid := by
      rcases metadata1 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 2
  output := output1
  cover := cover1
  source := source1
  checked := gridTreeUnionCheck_sound 32768 raw1 output1 cover1 source1 tree1 checked1
  units := 320668678
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted1_mass : (accepted1.toPacket grid_pos).mass = phaseMass1 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (320668678 : ℝ)/100000000*(gridUnionAreaUnits output1 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass1
  rw [areaUnits1, phaseMass1_eq]
  norm_num

theorem sourceIndex1 : 2438%4160 = 23*(128-23)+23 ∧
    23<64 ∧ 23≤23 ∧ 23<128-23 := by decide +kernel

def accepted2 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 1
    sx := 22
    sy := 23
    rootType := 0
    leaves := leaves2
    valid := by
      rcases metadata2 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 4
  output := output2
  cover := cover2
  source := source2
  checked := gridTreeUnionCheck_sound 32768 raw2 output2 cover2 source2 tree2 checked2
  units := 320668678
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted2_mass : (accepted2.toPacket grid_pos).mass = phaseMass2 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (320668678 : ℝ)/100000000*(gridUnionAreaUnits output2 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass2
  rw [areaUnits2, phaseMass2_eq]
  norm_num

theorem sourceIndex2 : 2355%4160 = 22*(128-22)+23 ∧
    22<64 ∧ 22≤23 ∧ 23<128-22 := by decide +kernel

def accepted3 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 1
    sx := 22
    sy := 22
    rootType := 0
    leaves := leaves3
    valid := by
      rcases metadata3 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 2
  output := output3
  cover := cover3
  source := source3
  checked := gridTreeUnionCheck_sound 32768 raw3 output3 cover3 source3 tree3 checked3
  units := 320668678
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted3_mass : (accepted3.toPacket grid_pos).mass = phaseMass3 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (320668678 : ℝ)/100000000*(gridUnionAreaUnits output3 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass3
  rw [areaUnits3, phaseMass3_eq]
  norm_num

theorem sourceIndex3 : 2354%4160 = 22*(128-22)+22 ∧
    22<64 ∧ 22≤22 ∧ 22<128-22 := by decide +kernel

def accepted4 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 1
    sx := 22
    sy := 25
    rootType := 0
    leaves := leaves4
    valid := by
      rcases metadata4 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 4
  output := output4
  cover := cover4
  source := source4
  checked := gridTreeUnionCheck_sound 32768 raw4 output4 cover4 source4 tree4 checked4
  units := 327195324
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted4_mass : (accepted4.toPacket grid_pos).mass = phaseMass4 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (327195324 : ℝ)/100000000*(gridUnionAreaUnits output4 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass4
  rw [areaUnits4, phaseMass4_eq]
  norm_num

theorem sourceIndex4 : 2357%4160 = 22*(128-22)+25 ∧
    22<64 ∧ 22≤25 ∧ 25<128-22 := by decide +kernel

def accepted5 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 1
    sx := 22
    sy := 24
    rootType := 0
    leaves := leaves5
    valid := by
      rcases metadata5 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 4
  output := output5
  cover := cover5
  source := source5
  checked := gridTreeUnionCheck_sound 32768 raw5 output5 cover5 source5 tree5 checked5
  units := 327195324
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted5_mass : (accepted5.toPacket grid_pos).mass = phaseMass5 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (327195324 : ℝ)/100000000*(gridUnionAreaUnits output5 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass5
  rw [areaUnits5, phaseMass5_eq]
  norm_num

theorem sourceIndex5 : 2356%4160 = 22*(128-22)+24 ∧
    22<64 ∧ 22≤24 ∧ 24<128-22 := by decide +kernel

def accepted6 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 1
    sx := 21
    sy := 24
    rootType := 0
    leaves := leaves6
    valid := by
      rcases metadata6 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 4
  output := output6
  cover := cover6
  source := source6
  checked := gridTreeUnionCheck_sound 32768 raw6 output6 cover6 source6 tree6 checked6
  units := 327195324
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted6_mass : (accepted6.toPacket grid_pos).mass = phaseMass6 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (327195324 : ℝ)/100000000*(gridUnionAreaUnits output6 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass6
  rw [areaUnits6, phaseMass6_eq]
  norm_num

theorem sourceIndex6 : 2271%4160 = 21*(128-21)+24 ∧
    21<64 ∧ 21≤24 ∧ 24<128-21 := by decide +kernel

def accepted7 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 1
    sx := 21
    sy := 23
    rootType := 0
    leaves := leaves7
    valid := by
      rcases metadata7 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 4
  output := output7
  cover := cover7
  source := source7
  checked := gridTreeUnionCheck_sound 32768 raw7 output7 cover7 source7 tree7 checked7
  units := 320668678
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted7_mass : (accepted7.toPacket grid_pos).mass = phaseMass7 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (320668678 : ℝ)/100000000*(gridUnionAreaUnits output7 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass7
  rw [areaUnits7, phaseMass7_eq]
  norm_num

theorem sourceIndex7 : 2270%4160 = 21*(128-21)+23 ∧
    21<64 ∧ 21≤23 ∧ 23<128-21 := by decide +kernel

def accepted8 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 1
    sx := 21
    sy := 22
    rootType := 0
    leaves := leaves8
    valid := by
      rcases metadata8 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 4
  output := output8
  cover := cover8
  source := source8
  checked := gridTreeUnionCheck_sound 32768 raw8 output8 cover8 source8 tree8 checked8
  units := 320668678
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted8_mass : (accepted8.toPacket grid_pos).mass = phaseMass8 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (320668678 : ℝ)/100000000*(gridUnionAreaUnits output8 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass8
  rw [areaUnits8, phaseMass8_eq]
  norm_num

theorem sourceIndex8 : 2269%4160 = 21*(128-21)+22 ∧
    21<64 ∧ 21≤22 ∧ 22<128-21 := by decide +kernel

def accepted9 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 1
    sx := 20
    sy := 23
    rootType := 0
    leaves := leaves9
    valid := by
      rcases metadata9 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 4
  output := output9
  cover := cover9
  source := source9
  checked := gridTreeUnionCheck_sound 32768 raw9 output9 cover9 source9 tree9 checked9
  units := 320668678
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted9_mass : (accepted9.toPacket grid_pos).mass = phaseMass9 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (320668678 : ℝ)/100000000*(gridUnionAreaUnits output9 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass9
  rw [areaUnits9, phaseMass9_eq]
  norm_num

theorem sourceIndex9 : 2183%4160 = 20*(128-20)+23 ∧
    20<64 ∧ 20≤23 ∧ 23<128-20 := by decide +kernel

def accepted10 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 1
    sx := 20
    sy := 22
    rootType := 0
    leaves := leaves10
    valid := by
      rcases metadata10 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 4
  output := output10
  cover := cover10
  source := source10
  checked := gridTreeUnionCheck_sound 32768 raw10 output10 cover10 source10 tree10 checked10
  units := 320668678
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted10_mass : (accepted10.toPacket grid_pos).mass = phaseMass10 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (320668678 : ℝ)/100000000*(gridUnionAreaUnits output10 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass10
  rw [areaUnits10, phaseMass10_eq]
  norm_num

theorem sourceIndex10 : 2182%4160 = 20*(128-20)+22 ∧
    20<64 ∧ 20≤22 ∧ 22<128-20 := by decide +kernel

def accepted11 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 1
    sx := 21
    sy := 21
    rootType := 0
    leaves := leaves11
    valid := by
      rcases metadata11 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 2
  output := output11
  cover := cover11
  source := source11
  checked := gridTreeUnionCheck_sound 32768 raw11 output11 cover11 source11 tree11 checked11
  units := 320668678
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted11_mass : (accepted11.toPacket grid_pos).mass = phaseMass11 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (320668678 : ℝ)/100000000*(gridUnionAreaUnits output11 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass11
  rw [areaUnits11, phaseMass11_eq]
  norm_num

theorem sourceIndex11 : 2268%4160 = 21*(128-21)+21 ∧
    21<64 ∧ 21≤21 ∧ 21<128-21 := by decide +kernel

def accepted12 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 1
    sx := 20
    sy := 21
    rootType := 0
    leaves := leaves12
    valid := by
      rcases metadata12 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 4
  output := output12
  cover := cover12
  source := source12
  checked := gridTreeUnionCheck_sound 32768 raw12 output12 cover12 source12 tree12 checked12
  units := 320668678
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted12_mass : (accepted12.toPacket grid_pos).mass = phaseMass12 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (320668678 : ℝ)/100000000*(gridUnionAreaUnits output12 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass12
  rw [areaUnits12, phaseMass12_eq]
  norm_num

theorem sourceIndex12 : 2181%4160 = 20*(128-20)+21 ∧
    20<64 ∧ 20≤21 ∧ 21<128-20 := by decide +kernel

def accepted13 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 1
    sx := 19
    sy := 22
    rootType := 0
    leaves := leaves13
    valid := by
      rcases metadata13 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 4
  output := output13
  cover := cover13
  source := source13
  checked := gridTreeUnionCheck_sound 32768 raw13 output13 cover13 source13 tree13 checked13
  units := 320668678
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted13_mass : (accepted13.toPacket grid_pos).mass = phaseMass13 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (320668678 : ℝ)/100000000*(gridUnionAreaUnits output13 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass13
  rw [areaUnits13, phaseMass13_eq]
  norm_num

theorem sourceIndex13 : 2093%4160 = 19*(128-19)+22 ∧
    19<64 ∧ 19≤22 ∧ 22<128-19 := by decide +kernel

def accepted14 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 1
    sx := 19
    sy := 21
    rootType := 0
    leaves := leaves14
    valid := by
      rcases metadata14 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 4
  output := output14
  cover := cover14
  source := source14
  checked := gridTreeUnionCheck_sound 32768 raw14 output14 cover14 source14 tree14 checked14
  units := 320668678
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted14_mass : (accepted14.toPacket grid_pos).mass = phaseMass14 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (320668678 : ℝ)/100000000*(gridUnionAreaUnits output14 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass14
  rw [areaUnits14, phaseMass14_eq]
  norm_num

theorem sourceIndex14 : 2092%4160 = 19*(128-19)+21 ∧
    19<64 ∧ 19≤21 ∧ 21<128-19 := by decide +kernel

def accepted15 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 1
    sx := 20
    sy := 20
    rootType := 0
    leaves := leaves15
    valid := by
      rcases metadata15 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 2
  output := output15
  cover := cover15
  source := source15
  checked := gridTreeUnionCheck_sound 32768 raw15 output15 cover15 source15 tree15 checked15
  units := 320668678
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted15_mass : (accepted15.toPacket grid_pos).mass = phaseMass15 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (320668678 : ℝ)/100000000*(gridUnionAreaUnits output15 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass15
  rw [areaUnits15, phaseMass15_eq]
  norm_num

theorem sourceIndex15 : 2180%4160 = 20*(128-20)+20 ∧
    20<64 ∧ 20≤20 ∧ 20<128-20 := by decide +kernel

def accepted16 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 1
    sx := 19
    sy := 20
    rootType := 0
    leaves := leaves16
    valid := by
      rcases metadata16 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 4
  output := output16
  cover := cover16
  source := source16
  checked := gridTreeUnionCheck_sound 32768 raw16 output16 cover16 source16 tree16 checked16
  units := 320668678
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted16_mass : (accepted16.toPacket grid_pos).mass = phaseMass16 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (320668678 : ℝ)/100000000*(gridUnionAreaUnits output16 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass16
  rw [areaUnits16, phaseMass16_eq]
  norm_num

theorem sourceIndex16 : 2091%4160 = 19*(128-19)+20 ∧
    19<64 ∧ 19≤20 ∧ 20<128-19 := by decide +kernel

def accepted17 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 1
    sx := 18
    sy := 21
    rootType := 0
    leaves := leaves17
    valid := by
      rcases metadata17 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 4
  output := output17
  cover := cover17
  source := source17
  checked := gridTreeUnionCheck_sound 32768 raw17 output17 cover17 source17 tree17 checked17
  units := 320668678
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted17_mass : (accepted17.toPacket grid_pos).mass = phaseMass17 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (320668678 : ℝ)/100000000*(gridUnionAreaUnits output17 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass17
  rw [areaUnits17, phaseMass17_eq]
  norm_num

theorem sourceIndex17 : 2001%4160 = 18*(128-18)+21 ∧
    18<64 ∧ 18≤21 ∧ 21<128-18 := by decide +kernel

def accepted18 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 1
    sx := 18
    sy := 20
    rootType := 0
    leaves := leaves18
    valid := by
      rcases metadata18 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 4
  output := output18
  cover := cover18
  source := source18
  checked := gridTreeUnionCheck_sound 32768 raw18 output18 cover18 source18 tree18 checked18
  units := 320668678
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted18_mass : (accepted18.toPacket grid_pos).mass = phaseMass18 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (320668678 : ℝ)/100000000*(gridUnionAreaUnits output18 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass18
  rw [areaUnits18, phaseMass18_eq]
  norm_num

theorem sourceIndex18 : 2000%4160 = 18*(128-18)+20 ∧
    18<64 ∧ 18≤20 ∧ 20<128-18 := by decide +kernel

def accepted19 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 1
    sx := 19
    sy := 19
    rootType := 0
    leaves := leaves19
    valid := by
      rcases metadata19 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 2
  output := output19
  cover := cover19
  source := source19
  checked := gridTreeUnionCheck_sound 32768 raw19 output19 cover19 source19 tree19 checked19
  units := 320668678
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted19_mass : (accepted19.toPacket grid_pos).mass = phaseMass19 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (320668678 : ℝ)/100000000*(gridUnionAreaUnits output19 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass19
  rw [areaUnits19, phaseMass19_eq]
  norm_num

theorem sourceIndex19 : 2090%4160 = 19*(128-19)+19 ∧
    19<64 ∧ 19≤19 ∧ 19<128-19 := by decide +kernel

def accepted20 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 1
    sx := 18
    sy := 19
    rootType := 0
    leaves := leaves20
    valid := by
      rcases metadata20 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 4
  output := output20
  cover := cover20
  source := source20
  checked := gridTreeUnionCheck_sound 32768 raw20 output20 cover20 source20 tree20 checked20
  units := 320668678
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted20_mass : (accepted20.toPacket grid_pos).mass = phaseMass20 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (320668678 : ℝ)/100000000*(gridUnionAreaUnits output20 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass20
  rw [areaUnits20, phaseMass20_eq]
  norm_num

theorem sourceIndex20 : 1999%4160 = 18*(128-18)+19 ∧
    18<64 ∧ 18≤19 ∧ 19<128-18 := by decide +kernel

def accepted21 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 1
    sx := 17
    sy := 20
    rootType := 0
    leaves := leaves21
    valid := by
      rcases metadata21 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 4
  output := output21
  cover := cover21
  source := source21
  checked := gridTreeUnionCheck_sound 32768 raw21 output21 cover21 source21 tree21 checked21
  units := 320668678
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted21_mass : (accepted21.toPacket grid_pos).mass = phaseMass21 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (320668678 : ℝ)/100000000*(gridUnionAreaUnits output21 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass21
  rw [areaUnits21, phaseMass21_eq]
  norm_num

theorem sourceIndex21 : 1907%4160 = 17*(128-17)+20 ∧
    17<64 ∧ 17≤20 ∧ 20<128-17 := by decide +kernel

def accepted22 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 1
    sx := 17
    sy := 19
    rootType := 0
    leaves := leaves22
    valid := by
      rcases metadata22 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 4
  output := output22
  cover := cover22
  source := source22
  checked := gridTreeUnionCheck_sound 32768 raw22 output22 cover22 source22 tree22 checked22
  units := 320668678
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted22_mass : (accepted22.toPacket grid_pos).mass = phaseMass22 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (320668678 : ℝ)/100000000*(gridUnionAreaUnits output22 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass22
  rw [areaUnits22, phaseMass22_eq]
  norm_num

theorem sourceIndex22 : 1906%4160 = 17*(128-17)+19 ∧
    17<64 ∧ 17≤19 ∧ 19<128-17 := by decide +kernel

def accepted23 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 1
    sx := 18
    sy := 18
    rootType := 0
    leaves := leaves23
    valid := by
      rcases metadata23 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 2
  output := output23
  cover := cover23
  source := source23
  checked := gridTreeUnionCheck_sound 32768 raw23 output23 cover23 source23 tree23 checked23
  units := 320668678
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted23_mass : (accepted23.toPacket grid_pos).mass = phaseMass23 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (320668678 : ℝ)/100000000*(gridUnionAreaUnits output23 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass23
  rw [areaUnits23, phaseMass23_eq]
  norm_num

theorem sourceIndex23 : 1998%4160 = 18*(128-18)+18 ∧
    18<64 ∧ 18≤18 ∧ 18<128-18 := by decide +kernel

def accepted24 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 1
    sx := 17
    sy := 18
    rootType := 0
    leaves := leaves24
    valid := by
      rcases metadata24 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 4
  output := output24
  cover := cover24
  source := source24
  checked := gridTreeUnionCheck_sound 32768 raw24 output24 cover24 source24 tree24 checked24
  units := 320668678
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted24_mass : (accepted24.toPacket grid_pos).mass = phaseMass24 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (320668678 : ℝ)/100000000*(gridUnionAreaUnits output24 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass24
  rw [areaUnits24, phaseMass24_eq]
  norm_num

theorem sourceIndex24 : 1905%4160 = 17*(128-17)+18 ∧
    17<64 ∧ 17≤18 ∧ 18<128-17 := by decide +kernel

def accepted25 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 1
    sx := 16
    sy := 19
    rootType := 0
    leaves := leaves25
    valid := by
      rcases metadata25 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 4
  output := output25
  cover := cover25
  source := source25
  checked := gridTreeUnionCheck_sound 32768 raw25 output25 cover25 source25 tree25 checked25
  units := 320668678
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted25_mass : (accepted25.toPacket grid_pos).mass = phaseMass25 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (320668678 : ℝ)/100000000*(gridUnionAreaUnits output25 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass25
  rw [areaUnits25, phaseMass25_eq]
  norm_num

theorem sourceIndex25 : 1811%4160 = 16*(128-16)+19 ∧
    16<64 ∧ 16≤19 ∧ 19<128-16 := by decide +kernel

def accepted26 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 1
    sx := 16
    sy := 18
    rootType := 0
    leaves := leaves26
    valid := by
      rcases metadata26 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 4
  output := output26
  cover := cover26
  source := source26
  checked := gridTreeUnionCheck_sound 32768 raw26 output26 cover26 source26 tree26 checked26
  units := 320668678
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted26_mass : (accepted26.toPacket grid_pos).mass = phaseMass26 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (320668678 : ℝ)/100000000*(gridUnionAreaUnits output26 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass26
  rw [areaUnits26, phaseMass26_eq]
  norm_num

theorem sourceIndex26 : 1810%4160 = 16*(128-16)+18 ∧
    16<64 ∧ 16≤18 ∧ 18<128-16 := by decide +kernel

def accepted27 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 1
    sx := 16
    sy := 17
    rootType := 0
    leaves := leaves27
    valid := by
      rcases metadata27 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 4
  output := output27
  cover := cover27
  source := source27
  checked := gridTreeUnionCheck_sound 32768 raw27 output27 cover27 source27 tree27 checked27
  units := 320668678
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted27_mass : (accepted27.toPacket grid_pos).mass = phaseMass27 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (320668678 : ℝ)/100000000*(gridUnionAreaUnits output27 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass27
  rw [areaUnits27, phaseMass27_eq]
  norm_num

theorem sourceIndex27 : 1809%4160 = 16*(128-16)+17 ∧
    16<64 ∧ 16≤17 ∧ 17<128-16 := by decide +kernel

def accepted28 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 1
    sx := 15
    sy := 18
    rootType := 0
    leaves := leaves28
    valid := by
      rcases metadata28 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 4
  output := output28
  cover := cover28
  source := source28
  checked := gridTreeUnionCheck_sound 32768 raw28 output28 cover28 source28 tree28 checked28
  units := 543338492
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted28_mass : (accepted28.toPacket grid_pos).mass = phaseMass28 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (543338492 : ℝ)/100000000*(gridUnionAreaUnits output28 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass28
  rw [areaUnits28, phaseMass28_eq]
  norm_num

theorem sourceIndex28 : 1713%4160 = 15*(128-15)+18 ∧
    15<64 ∧ 15≤18 ∧ 18<128-15 := by decide +kernel

def accepted29 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 1
    sx := 15
    sy := 17
    rootType := 0
    leaves := leaves29
    valid := by
      rcases metadata29 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 4
  output := output29
  cover := cover29
  source := source29
  checked := gridTreeUnionCheck_sound 32768 raw29 output29 cover29 source29 tree29 checked29
  units := 543338492
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted29_mass : (accepted29.toPacket grid_pos).mass = phaseMass29 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (543338492 : ℝ)/100000000*(gridUnionAreaUnits output29 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass29
  rw [areaUnits29, phaseMass29_eq]
  norm_num

theorem sourceIndex29 : 1712%4160 = 15*(128-15)+17 ∧
    15<64 ∧ 15≤17 ∧ 17<128-15 := by decide +kernel

def accepted30 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 1
    sx := 17
    sy := 17
    rootType := 0
    leaves := leaves30
    valid := by
      rcases metadata30 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 2
  output := output30
  cover := cover30
  source := source30
  checked := gridTreeUnionCheck_sound 32768 raw30 output30 cover30 source30 tree30 checked30
  units := 320668678
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted30_mass : (accepted30.toPacket grid_pos).mass = phaseMass30 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (320668678 : ℝ)/100000000*(gridUnionAreaUnits output30 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass30
  rw [areaUnits30, phaseMass30_eq]
  norm_num

theorem sourceIndex30 : 1904%4160 = 17*(128-17)+17 ∧
    17<64 ∧ 17≤17 ∧ 17<128-17 := by decide +kernel

def accepted31 : CheckedAcceptedPhase 32768 8 where
  phase := {
    count := 1
    sx := 16
    sy := 16
    rootType := 0
    leaves := leaves31
    valid := by
      rcases metadata31 with ⟨_, _, _, _, _, _, h⟩
      exact h
  }
  outCount := 2
  output := output31
  cover := cover31
  source := source31
  checked := gridTreeUnionCheck_sound 32768 raw31 output31 cover31 source31 tree31 checked31
  units := 320668678
  scale := 100000000
  units_pos := by decide
  scale_pos := by decide

theorem accepted31_mass : (accepted31.toPacket grid_pos).mass = phaseMass31 := by
  rw [CheckedAcceptedPhase.mass_eq]
  change (320668678 : ℝ)/100000000*(gridUnionAreaUnits output31 : ℝ)/
    (4*(32768 : ℝ)^2) = phaseMass31
  rw [areaUnits31, phaseMass31_eq]
  norm_num

theorem sourceIndex31 : 1808%4160 = 16*(128-16)+16 ∧
    16<64 ∧ 16≤16 ∧ 16<128-16 := by decide +kernel

def acceptedData : FiniteInputTree (CheckedAcceptedPhase 32768 8) 32 :=
  (.node (.node (.node (.node (.node (.single accepted0) (.single accepted1)) (.node (.single accepted2) (.single accepted3))) (.node (.node (.single accepted4) (.single accepted5)) (.node (.single accepted6) (.single accepted7)))) (.node (.node (.node (.single accepted8) (.single accepted9)) (.node (.single accepted10) (.single accepted11))) (.node (.node (.single accepted12) (.single accepted13)) (.node (.single accepted14) (.single accepted15))))) (.node (.node (.node (.node (.single accepted16) (.single accepted17)) (.node (.single accepted18) (.single accepted19))) (.node (.node (.single accepted20) (.single accepted21)) (.node (.single accepted22) (.single accepted23)))) (.node (.node (.node (.single accepted24) (.single accepted25)) (.node (.single accepted26) (.single accepted27))) (.node (.node (.single accepted28) (.single accepted29)) (.node (.single accepted30) (.single accepted31))))))

def accepted : Fin 32 → CheckedAcceptedPhase 32768 8 := acceptedData.get

def actualSchedule : Schedule 32 := checkedAcceptedSchedule accepted grid_pos

theorem acceptedData_list : acceptedData.toList = [accepted0,accepted1,accepted2,accepted3,accepted4,accepted5,accepted6,accepted7,accepted8,accepted9,accepted10,accepted11,accepted12,accepted13,accepted14,accepted15,accepted16,accepted17,accepted18,accepted19,accepted20,accepted21,accepted22,accepted23,accepted24,accepted25,accepted26,accepted27,accepted28,accepted29,accepted30,accepted31] := rfl

theorem actual_schedule_mass :
    actualSchedule.typedInputMass (fun j => (accepted j).phase.rootType)
      (fun j => ((accepted j).toPacket grid_pos).field) =
        (2362542299/409600000000 : ℝ) := by
  unfold actualSchedule checkedAcceptedSchedule
  rw [scheduleOfDurations_mass _ _ _ _ (fun j => ((accepted j).toPacket grid_pos).integrable)]
  change (∑ j : Fin 32, ((acceptedData.get j).toPacket grid_pos).mass) = _
  rw [FiniteInputTree.sum_get acceptedData (fun a => (a.toPacket grid_pos).mass), acceptedData_list]
  simp only [List.map_cons, List.map_nil]
  rw [accepted0_mass,accepted1_mass,accepted2_mass,accepted3_mass,accepted4_mass,accepted5_mass,accepted6_mass,accepted7_mass,accepted8_mass,accepted9_mass,accepted10_mass,accepted11_mass,accepted12_mass,accepted13_mass,accepted14_mass,accepted15_mass,accepted16_mass,accepted17_mass,accepted18_mass,accepted19_mass,accepted20_mass,accepted21_mass,accepted22_mass,accepted23_mass,accepted24_mass,accepted25_mass,accepted26_mass,accepted27_mass,accepted28_mass,accepted29_mass,accepted30_mass,accepted31_mass]
  exact actual_batch_mass

theorem actual_prefix_le_coarse (T : ℝ) (hT : 0 ≤ T) (r : Fin 4) (x y : ℝ) :
    actualSchedule.cumulative (fun j => ((accepted j).toPacket grid_pos).typedField r x y) T ≤
      actualSchedule.coarseAcceptedPrefix (fun j => (accepted j).phase) 32768
        (commonGridLines 32768) (commonGridLines 32768) T r x y :=
  actualSchedule.checkedAcceptedPrefix_le_coarse accepted grid_pos T hT r x y

end NoThreeLine.ScheduleUnionBatch00160Accepted

#print axioms NoThreeLine.ScheduleUnionBatch00160Accepted.actual_schedule_mass
#print axioms NoThreeLine.ScheduleUnionBatch00160Accepted.actual_prefix_le_coarse
