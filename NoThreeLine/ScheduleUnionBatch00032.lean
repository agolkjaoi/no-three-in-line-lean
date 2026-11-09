import NoThreeLine.GridCutTree
import NoThreeLine.DyadicPhaseInput
import NoThreeLine.PhaseUnionMass

/-! Actual accepted dyadic leaves, integer union witnesses, and exact
typed space-time masses for this explicitly bounded phase batch.
Full-schedule coverage and reference-prefix/risk checks are separate. -/

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

open MeasureTheory NoThreeLine.FinitePhase

namespace NoThreeLine.ScheduleUnionBatch00032

-- Frozen phase 32, atom 4071, type 0, source (55,56).
def leavesData0 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves0 (i : Fin 1) : DyadicLeaf := leavesData0.getD i.val ⟨0,0,0⟩
def raw0 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 55 56 leaves0 i
def outputData0 : Array GridBox := #[⟨14080,14336,14336,14592⟩,⟨14336,14592,14080,14336⟩,⟨18176,18432,18432,18688⟩,⟨18432,18688,18176,18432⟩]
def output0 (i : Fin 4) : GridBox := outputData0.getD i.val ⟨0,0,0,0⟩
def coverData0 : Array ℕ := #[0,1,3,2]
def sourceData0 : Array ℕ := #[0,1,3,2]
def cover0 (i : Fin 4) : Fin 4 := ⟨coverData0.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source0 (i : Fin 4) : Fin 4 := ⟨sourceData0.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree0 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 (.cutY 14336 .empty (.cutX 13312 .empty (.cutY 15360 (.cutX 13824 .empty (.cutY 14848 (.cutX 14080 .empty (.cutY 14592 .full .empty)) .empty)) .empty))) (.cutY 14336 (.cutX 15360 (.cutY 13312 .empty (.cutX 14848 (.cutY 13824 .empty (.cutX 14592 (.cutY 14080 .empty .full) .empty)) .empty)) .empty) .empty)))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 (.cutY 18432 .empty (.cutX 17408 .empty (.cutY 19456 (.cutX 17920 .empty (.cutY 18944 (.cutX 18176 .empty (.cutY 18688 .full .empty)) .empty)) .empty))) (.cutY 18432 (.cutX 19456 (.cutY 17408 .empty (.cutX 18944 (.cutY 17920 .empty (.cutX 18688 (.cutY 18176 .empty .full) .empty)) .empty)) .empty) .empty)) .empty) .empty) .empty) .empty)))

theorem metadata0 : 0<314864438 ∧ 55<128 ∧ 56<128 ∧ 0<4 ∧
    4071/4160=0 ∧ 4071%4160=4071 ∧ ∀ i, (leaves0 i).Valid 8 := by decide +kernel

theorem checked0 : gridTreeUnionCheck 32768 raw0 output0 cover0 source0 tree0 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits0 : gridUnionAreaUnits output0 = 262144 := by decide +kernel

noncomputable def phaseMass0 : ℝ := singlePhaseMass (314864438/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw0 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass0_eq : phaseMass0 = (157432219/819200000000 : ℝ) := by
  unfold phaseMass0
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw0 output0 cover0 source0
    (gridTreeUnionCheck_sound 32768 raw0 output0 cover0 source0 tree0 checked0)
    _ (by norm_num) _,areaUnits0]
  norm_num

-- Frozen phase 33, atom 4052, type 0, source (54,56).
def leavesData1 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves1 (i : Fin 1) : DyadicLeaf := leavesData1.getD i.val ⟨0,0,0⟩
def raw1 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 54 56 leaves1 i
def outputData1 : Array GridBox := #[⟨13824,14080,14336,14592⟩,⟨14336,14592,13824,14080⟩,⟨18176,18432,18688,18944⟩,⟨18688,18944,18176,18432⟩]
def output1 (i : Fin 4) : GridBox := outputData1.getD i.val ⟨0,0,0,0⟩
def coverData1 : Array ℕ := #[0,1,3,2]
def sourceData1 : Array ℕ := #[0,1,3,2]
def cover1 (i : Fin 4) : Fin 4 := ⟨coverData1.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source1 (i : Fin 4) : Fin 4 := ⟨sourceData1.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree1 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 (.cutY 14336 .empty (.cutX 13312 .empty (.cutY 15360 (.cutX 13824 .empty (.cutY 14848 (.cutX 14080 (.cutY 14592 .full .empty) .empty) .empty)) .empty))) (.cutY 14336 (.cutX 15360 (.cutY 13312 .empty (.cutX 14848 (.cutY 13824 .empty (.cutX 14592 (.cutY 14080 .full .empty) .empty)) .empty)) .empty) .empty)))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 (.cutY 18432 .empty (.cutX 17408 .empty (.cutY 19456 (.cutX 17920 .empty (.cutY 18944 (.cutX 18176 .empty (.cutY 18688 .empty .full)) .empty)) .empty))) (.cutY 18432 (.cutX 19456 (.cutY 17408 .empty (.cutX 18944 (.cutY 17920 .empty (.cutX 18688 .empty (.cutY 18176 .empty .full))) .empty)) .empty) .empty)) .empty) .empty) .empty) .empty)))

theorem metadata1 : 0<314864438 ∧ 54<128 ∧ 56<128 ∧ 0<4 ∧
    4052/4160=0 ∧ 4052%4160=4052 ∧ ∀ i, (leaves1 i).Valid 8 := by decide +kernel

theorem checked1 : gridTreeUnionCheck 32768 raw1 output1 cover1 source1 tree1 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits1 : gridUnionAreaUnits output1 = 262144 := by decide +kernel

noncomputable def phaseMass1 : ℝ := singlePhaseMass (314864438/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw1 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass1_eq : phaseMass1 = (157432219/819200000000 : ℝ) := by
  unfold phaseMass1
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw1 output1 cover1 source1
    (gridTreeUnionCheck_sound 32768 raw1 output1 cover1 source1 tree1 checked1)
    _ (by norm_num) _,areaUnits1]
  norm_num

-- Frozen phase 34, atom 4088, type 0, source (56,56).
def leavesData2 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves2 (i : Fin 1) : DyadicLeaf := leavesData2.getD i.val ⟨0,0,0⟩
def raw2 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 56 56 leaves2 i
def outputData2 : Array GridBox := #[⟨14336,14592,14336,14592⟩,⟨18176,18432,18176,18432⟩]
def output2 (i : Fin 2) : GridBox := outputData2.getD i.val ⟨0,0,0,0⟩
def coverData2 : Array ℕ := #[0,0,1,1]
def sourceData2 : Array ℕ := #[0,2]
def cover2 (i : Fin 4) : Fin 2 := ⟨coverData2.getD i.val 0 % 2,Nat.mod_lt _ (by decide)⟩
def source2 (i : Fin 2) : Fin 4 := ⟨sourceData2.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree2 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 .empty (.cutY 14336 .empty (.cutX 15360 (.cutY 15360 (.cutX 14848 (.cutY 14848 (.cutX 14592 (.cutY 14592 .full .empty) .empty) .empty) .empty) .empty) .empty))))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 (.cutY 18432 (.cutX 17408 .empty (.cutY 17408 .empty (.cutX 17920 .empty (.cutY 17920 .empty (.cutX 18176 .empty (.cutY 18176 .empty .full)))))) .empty) .empty) .empty) .empty) .empty) .empty)))

theorem metadata2 : 0<148355083 ∧ 56<128 ∧ 56<128 ∧ 0<4 ∧
    4088/4160=0 ∧ 4088%4160=4088 ∧ ∀ i, (leaves2 i).Valid 8 := by decide +kernel

theorem checked2 : gridTreeUnionCheck 32768 raw2 output2 cover2 source2 tree2 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits2 : gridUnionAreaUnits output2 = 131072 := by decide +kernel

noncomputable def phaseMass2 : ℝ := singlePhaseMass (148355083/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw2 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass2_eq : phaseMass2 = (148355083/3276800000000 : ℝ) := by
  unfold phaseMass2
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw2 output2 cover2 source2
    (gridTreeUnionCheck_sound 32768 raw2 output2 cover2 source2 tree2 checked2)
    _ (by norm_num) _,areaUnits2]
  norm_num

-- Frozen phase 35, atom 4070, type 0, source (55,55).
def leavesData3 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves3 (i : Fin 1) : DyadicLeaf := leavesData3.getD i.val ⟨0,0,0⟩
def raw3 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 55 55 leaves3 i
def outputData3 : Array GridBox := #[⟨14080,14336,14080,14336⟩,⟨18432,18688,18432,18688⟩]
def output3 (i : Fin 2) : GridBox := outputData3.getD i.val ⟨0,0,0,0⟩
def coverData3 : Array ℕ := #[0,0,1,1]
def sourceData3 : Array ℕ := #[0,2]
def cover3 (i : Fin 4) : Fin 2 := ⟨coverData3.getD i.val 0 % 2,Nat.mod_lt _ (by decide)⟩
def source3 (i : Fin 2) : Fin 4 := ⟨sourceData3.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree3 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 (.cutY 14336 (.cutX 13312 .empty (.cutY 13312 .empty (.cutX 13824 .empty (.cutY 13824 .empty (.cutX 14080 .empty (.cutY 14080 .empty .full)))))) .empty) .empty))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 .empty (.cutY 18432 .empty (.cutX 19456 (.cutY 19456 (.cutX 18944 (.cutY 18944 (.cutX 18688 (.cutY 18688 .full .empty) .empty) .empty) .empty) .empty) .empty))) .empty) .empty) .empty) .empty)))

theorem metadata3 : 0<246335762 ∧ 55<128 ∧ 55<128 ∧ 0<4 ∧
    4070/4160=0 ∧ 4070%4160=4070 ∧ ∀ i, (leaves3 i).Valid 8 := by decide +kernel

theorem checked3 : gridTreeUnionCheck 32768 raw3 output3 cover3 source3 tree3 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits3 : gridUnionAreaUnits output3 = 131072 := by decide +kernel

noncomputable def phaseMass3 : ℝ := singlePhaseMass (246335762/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw3 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass3_eq : phaseMass3 = (123167881/1638400000000 : ℝ) := by
  unfold phaseMass3
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw3 output3 cover3 source3
    (gridTreeUnionCheck_sound 32768 raw3 output3 cover3 source3 tree3 checked3)
    _ (by norm_num) _,areaUnits3]
  norm_num

-- Frozen phase 36, atom 4051, type 0, source (54,55).
def leavesData4 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves4 (i : Fin 1) : DyadicLeaf := leavesData4.getD i.val ⟨0,0,0⟩
def raw4 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 54 55 leaves4 i
def outputData4 : Array GridBox := #[⟨13824,14080,14080,14336⟩,⟨14080,14336,13824,14080⟩,⟨18432,18688,18688,18944⟩,⟨18688,18944,18432,18688⟩]
def output4 (i : Fin 4) : GridBox := outputData4.getD i.val ⟨0,0,0,0⟩
def coverData4 : Array ℕ := #[0,1,3,2]
def sourceData4 : Array ℕ := #[0,1,3,2]
def cover4 (i : Fin 4) : Fin 4 := ⟨coverData4.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source4 (i : Fin 4) : Fin 4 := ⟨sourceData4.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree4 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 (.cutY 14336 (.cutX 13312 .empty (.cutY 13312 .empty (.cutX 13824 .empty (.cutY 13824 .empty (.cutX 14080 (.cutY 14080 .empty .full) (.cutY 14080 .full .empty)))))) .empty) .empty))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 .empty (.cutY 18432 .empty (.cutX 19456 (.cutY 19456 (.cutX 18944 (.cutY 18944 (.cutX 18688 (.cutY 18688 .empty .full) (.cutY 18688 .full .empty)) .empty) .empty) .empty) .empty))) .empty) .empty) .empty) .empty)))

theorem metadata4 : 0<246335762 ∧ 54<128 ∧ 55<128 ∧ 0<4 ∧
    4051/4160=0 ∧ 4051%4160=4051 ∧ ∀ i, (leaves4 i).Valid 8 := by decide +kernel

theorem checked4 : gridTreeUnionCheck 32768 raw4 output4 cover4 source4 tree4 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits4 : gridUnionAreaUnits output4 = 262144 := by decide +kernel

noncomputable def phaseMass4 : ℝ := singlePhaseMass (246335762/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw4 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass4_eq : phaseMass4 = (123167881/819200000000 : ℝ) := by
  unfold phaseMass4
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw4 output4 cover4 source4
    (gridTreeUnionCheck_sound 32768 raw4 output4 cover4 source4 tree4 checked4)
    _ (by norm_num) _,areaUnits4]
  norm_num

-- Frozen phase 37, atom 4031, type 0, source (53,56).
def leavesData5 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves5 (i : Fin 1) : DyadicLeaf := leavesData5.getD i.val ⟨0,0,0⟩
def raw5 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 53 56 leaves5 i
def outputData5 : Array GridBox := #[⟨13568,13824,14336,14592⟩,⟨14336,14592,13568,13824⟩,⟨18176,18432,18944,19200⟩,⟨18944,19200,18176,18432⟩]
def output5 (i : Fin 4) : GridBox := outputData5.getD i.val ⟨0,0,0,0⟩
def coverData5 : Array ℕ := #[0,1,3,2]
def sourceData5 : Array ℕ := #[0,1,3,2]
def cover5 (i : Fin 4) : Fin 4 := ⟨coverData5.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source5 (i : Fin 4) : Fin 4 := ⟨sourceData5.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree5 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 (.cutY 14336 .empty (.cutX 13312 .empty (.cutY 15360 (.cutX 13824 (.cutY 14848 (.cutX 13568 .empty (.cutY 14592 .full .empty)) .empty) .empty) .empty))) (.cutY 14336 (.cutX 15360 (.cutY 13312 .empty (.cutX 14848 (.cutY 13824 (.cutX 14592 (.cutY 13568 .empty .full) .empty) .empty) .empty)) .empty) .empty)))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 (.cutY 18432 .empty (.cutX 17408 .empty (.cutY 19456 (.cutX 17920 .empty (.cutY 18944 .empty (.cutX 18176 .empty (.cutY 19200 .full .empty)))) .empty))) (.cutY 18432 (.cutX 19456 (.cutY 17408 .empty (.cutX 18944 .empty (.cutY 17920 .empty (.cutX 19200 (.cutY 18176 .empty .full) .empty)))) .empty) .empty)) .empty) .empty) .empty) .empty)))

theorem metadata5 : 0<314864438 ∧ 53<128 ∧ 56<128 ∧ 0<4 ∧
    4031/4160=0 ∧ 4031%4160=4031 ∧ ∀ i, (leaves5 i).Valid 8 := by decide +kernel

theorem checked5 : gridTreeUnionCheck 32768 raw5 output5 cover5 source5 tree5 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits5 : gridUnionAreaUnits output5 = 262144 := by decide +kernel

noncomputable def phaseMass5 : ℝ := singlePhaseMass (314864438/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw5 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass5_eq : phaseMass5 = (157432219/819200000000 : ℝ) := by
  unfold phaseMass5
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw5 output5 cover5 source5
    (gridTreeUnionCheck_sound 32768 raw5 output5 cover5 source5 tree5 checked5)
    _ (by norm_num) _,areaUnits5]
  norm_num

-- Frozen phase 38, atom 4030, type 0, source (53,55).
def leavesData6 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves6 (i : Fin 1) : DyadicLeaf := leavesData6.getD i.val ⟨0,0,0⟩
def raw6 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 53 55 leaves6 i
def outputData6 : Array GridBox := #[⟨13568,13824,14080,14336⟩,⟨14080,14336,13568,13824⟩,⟨18432,18688,18944,19200⟩,⟨18944,19200,18432,18688⟩]
def output6 (i : Fin 4) : GridBox := outputData6.getD i.val ⟨0,0,0,0⟩
def coverData6 : Array ℕ := #[0,1,3,2]
def sourceData6 : Array ℕ := #[0,1,3,2]
def cover6 (i : Fin 4) : Fin 4 := ⟨coverData6.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source6 (i : Fin 4) : Fin 4 := ⟨sourceData6.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree6 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 (.cutY 14336 (.cutX 13312 .empty (.cutY 13312 .empty (.cutX 13824 (.cutY 13824 .empty (.cutX 13568 .empty (.cutY 14080 .empty .full))) (.cutY 13824 (.cutX 14080 .empty (.cutY 13568 .empty .full)) .empty)))) .empty) .empty))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 .empty (.cutY 18432 .empty (.cutX 19456 (.cutY 19456 (.cutX 18944 (.cutY 18944 .empty (.cutX 18688 (.cutY 19200 .full .empty) .empty)) (.cutY 18944 (.cutX 19200 (.cutY 18688 .full .empty) .empty) .empty)) .empty) .empty))) .empty) .empty) .empty) .empty)))

theorem metadata6 : 0<246335762 ∧ 53<128 ∧ 55<128 ∧ 0<4 ∧
    4030/4160=0 ∧ 4030%4160=4030 ∧ ∀ i, (leaves6 i).Valid 8 := by decide +kernel

theorem checked6 : gridTreeUnionCheck 32768 raw6 output6 cover6 source6 tree6 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits6 : gridUnionAreaUnits output6 = 262144 := by decide +kernel

noncomputable def phaseMass6 : ℝ := singlePhaseMass (246335762/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw6 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass6_eq : phaseMass6 = (123167881/819200000000 : ℝ) := by
  unfold phaseMass6
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw6 output6 cover6 source6
    (gridTreeUnionCheck_sound 32768 raw6 output6 cover6 source6 tree6 checked6)
    _ (by norm_num) _,areaUnits6]
  norm_num

-- Frozen phase 39, atom 4050, type 0, source (54,54).
def leavesData7 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves7 (i : Fin 1) : DyadicLeaf := leavesData7.getD i.val ⟨0,0,0⟩
def raw7 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 54 54 leaves7 i
def outputData7 : Array GridBox := #[⟨13824,14080,13824,14080⟩,⟨18688,18944,18688,18944⟩]
def output7 (i : Fin 2) : GridBox := outputData7.getD i.val ⟨0,0,0,0⟩
def coverData7 : Array ℕ := #[0,0,1,1]
def sourceData7 : Array ℕ := #[0,2]
def cover7 (i : Fin 4) : Fin 2 := ⟨coverData7.getD i.val 0 % 2,Nat.mod_lt _ (by decide)⟩
def source7 (i : Fin 2) : Fin 4 := ⟨sourceData7.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree7 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 (.cutY 14336 (.cutX 13312 .empty (.cutY 13312 .empty (.cutX 13824 .empty (.cutY 13824 .empty (.cutX 14080 (.cutY 14080 .full .empty) .empty))))) .empty) .empty))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 .empty (.cutY 18432 .empty (.cutX 19456 (.cutY 19456 (.cutX 18944 (.cutY 18944 (.cutX 18688 .empty (.cutY 18688 .empty .full)) .empty) .empty) .empty) .empty))) .empty) .empty) .empty) .empty)))

theorem metadata7 : 0<246335762 ∧ 54<128 ∧ 54<128 ∧ 0<4 ∧
    4050/4160=0 ∧ 4050%4160=4050 ∧ ∀ i, (leaves7 i).Valid 8 := by decide +kernel

theorem checked7 : gridTreeUnionCheck 32768 raw7 output7 cover7 source7 tree7 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits7 : gridUnionAreaUnits output7 = 131072 := by decide +kernel

noncomputable def phaseMass7 : ℝ := singlePhaseMass (246335762/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw7 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass7_eq : phaseMass7 = (123167881/1638400000000 : ℝ) := by
  unfold phaseMass7
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw7 output7 cover7 source7
    (gridTreeUnionCheck_sound 32768 raw7 output7 cover7 source7 tree7 checked7)
    _ (by norm_num) _,areaUnits7]
  norm_num

-- Frozen phase 40, atom 4029, type 0, source (53,54).
def leavesData8 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves8 (i : Fin 1) : DyadicLeaf := leavesData8.getD i.val ⟨0,0,0⟩
def raw8 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 53 54 leaves8 i
def outputData8 : Array GridBox := #[⟨13568,13824,13824,14080⟩,⟨13824,14080,13568,13824⟩,⟨18688,18944,18944,19200⟩,⟨18944,19200,18688,18944⟩]
def output8 (i : Fin 4) : GridBox := outputData8.getD i.val ⟨0,0,0,0⟩
def coverData8 : Array ℕ := #[0,1,3,2]
def sourceData8 : Array ℕ := #[0,1,3,2]
def cover8 (i : Fin 4) : Fin 4 := ⟨coverData8.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source8 (i : Fin 4) : Fin 4 := ⟨sourceData8.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree8 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 (.cutY 14336 (.cutX 13312 .empty (.cutY 13312 .empty (.cutX 13824 (.cutY 13824 .empty (.cutX 13568 .empty (.cutY 14080 .full .empty))) (.cutY 13824 (.cutX 14080 (.cutY 13568 .empty .full) .empty) .empty)))) .empty) .empty))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 .empty (.cutY 18432 .empty (.cutX 19456 (.cutY 19456 (.cutX 18944 (.cutY 18944 .empty (.cutX 18688 .empty (.cutY 19200 .full .empty))) (.cutY 18944 (.cutX 19200 (.cutY 18688 .empty .full) .empty) .empty)) .empty) .empty))) .empty) .empty) .empty) .empty)))

theorem metadata8 : 0<246335762 ∧ 53<128 ∧ 54<128 ∧ 0<4 ∧
    4029/4160=0 ∧ 4029%4160=4029 ∧ ∀ i, (leaves8 i).Valid 8 := by decide +kernel

theorem checked8 : gridTreeUnionCheck 32768 raw8 output8 cover8 source8 tree8 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits8 : gridUnionAreaUnits output8 = 262144 := by decide +kernel

noncomputable def phaseMass8 : ℝ := singlePhaseMass (246335762/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw8 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass8_eq : phaseMass8 = (123167881/819200000000 : ℝ) := by
  unfold phaseMass8
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw8 output8 cover8 source8
    (gridTreeUnionCheck_sound 32768 raw8 output8 cover8 source8 tree8 checked8)
    _ (by norm_num) _,areaUnits8]
  norm_num

-- Frozen phase 41, atom 4028, type 0, source (53,53).
def leavesData9 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves9 (i : Fin 1) : DyadicLeaf := leavesData9.getD i.val ⟨0,0,0⟩
def raw9 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 53 53 leaves9 i
def outputData9 : Array GridBox := #[⟨13568,13824,13568,13824⟩,⟨18944,19200,18944,19200⟩]
def output9 (i : Fin 2) : GridBox := outputData9.getD i.val ⟨0,0,0,0⟩
def coverData9 : Array ℕ := #[0,0,1,1]
def sourceData9 : Array ℕ := #[0,2]
def cover9 (i : Fin 4) : Fin 2 := ⟨coverData9.getD i.val 0 % 2,Nat.mod_lt _ (by decide)⟩
def source9 (i : Fin 2) : Fin 4 := ⟨sourceData9.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree9 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 (.cutY 14336 (.cutX 13312 .empty (.cutY 13312 .empty (.cutX 13824 (.cutY 13824 (.cutX 13568 .empty (.cutY 13568 .empty .full)) .empty) .empty))) .empty) .empty))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 .empty (.cutY 18432 .empty (.cutX 19456 (.cutY 19456 (.cutX 18944 .empty (.cutY 18944 .empty (.cutX 19200 (.cutY 19200 .full .empty) .empty))) .empty) .empty))) .empty) .empty) .empty) .empty)))

theorem metadata9 : 0<246335762 ∧ 53<128 ∧ 53<128 ∧ 0<4 ∧
    4028/4160=0 ∧ 4028%4160=4028 ∧ ∀ i, (leaves9 i).Valid 8 := by decide +kernel

theorem checked9 : gridTreeUnionCheck 32768 raw9 output9 cover9 source9 tree9 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits9 : gridUnionAreaUnits output9 = 131072 := by decide +kernel

noncomputable def phaseMass9 : ℝ := singlePhaseMass (246335762/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw9 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass9_eq : phaseMass9 = (123167881/1638400000000 : ℝ) := by
  unfold phaseMass9
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw9 output9 cover9 source9
    (gridTreeUnionCheck_sound 32768 raw9 output9 cover9 source9 tree9 checked9)
    _ (by norm_num) _,areaUnits9]
  norm_num

-- Frozen phase 42, atom 4007, type 0, source (52,55).
def leavesData10 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves10 (i : Fin 1) : DyadicLeaf := leavesData10.getD i.val ⟨0,0,0⟩
def raw10 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 52 55 leaves10 i
def outputData10 : Array GridBox := #[⟨13312,13568,14080,14336⟩,⟨14080,14336,13312,13568⟩,⟨18432,18688,19200,19456⟩,⟨19200,19456,18432,18688⟩]
def output10 (i : Fin 4) : GridBox := outputData10.getD i.val ⟨0,0,0,0⟩
def coverData10 : Array ℕ := #[0,1,3,2]
def sourceData10 : Array ℕ := #[0,1,3,2]
def cover10 (i : Fin 4) : Fin 4 := ⟨coverData10.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source10 (i : Fin 4) : Fin 4 := ⟨sourceData10.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree10 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 (.cutY 14336 (.cutX 13312 .empty (.cutY 13312 .empty (.cutX 13824 (.cutY 13824 .empty (.cutX 13568 (.cutY 14080 .empty .full) .empty)) (.cutY 13824 (.cutX 14080 .empty (.cutY 13568 .full .empty)) .empty)))) .empty) .empty))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 .empty (.cutY 18432 .empty (.cutX 19456 (.cutY 19456 (.cutX 18944 (.cutY 18944 .empty (.cutX 18688 (.cutY 19200 .empty .full) .empty)) (.cutY 18944 (.cutX 19200 .empty (.cutY 18688 .full .empty)) .empty)) .empty) .empty))) .empty) .empty) .empty) .empty)))

theorem metadata10 : 0<246335762 ∧ 52<128 ∧ 55<128 ∧ 0<4 ∧
    4007/4160=0 ∧ 4007%4160=4007 ∧ ∀ i, (leaves10 i).Valid 8 := by decide +kernel

theorem checked10 : gridTreeUnionCheck 32768 raw10 output10 cover10 source10 tree10 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits10 : gridUnionAreaUnits output10 = 262144 := by decide +kernel

noncomputable def phaseMass10 : ℝ := singlePhaseMass (246335762/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw10 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass10_eq : phaseMass10 = (123167881/819200000000 : ℝ) := by
  unfold phaseMass10
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw10 output10 cover10 source10
    (gridTreeUnionCheck_sound 32768 raw10 output10 cover10 source10 tree10 checked10)
    _ (by norm_num) _,areaUnits10]
  norm_num

-- Frozen phase 43, atom 4006, type 0, source (52,54).
def leavesData11 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves11 (i : Fin 1) : DyadicLeaf := leavesData11.getD i.val ⟨0,0,0⟩
def raw11 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 52 54 leaves11 i
def outputData11 : Array GridBox := #[⟨13312,13568,13824,14080⟩,⟨13824,14080,13312,13568⟩,⟨18688,18944,19200,19456⟩,⟨19200,19456,18688,18944⟩]
def output11 (i : Fin 4) : GridBox := outputData11.getD i.val ⟨0,0,0,0⟩
def coverData11 : Array ℕ := #[0,1,3,2]
def sourceData11 : Array ℕ := #[0,1,3,2]
def cover11 (i : Fin 4) : Fin 4 := ⟨coverData11.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source11 (i : Fin 4) : Fin 4 := ⟨sourceData11.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree11 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 (.cutY 14336 (.cutX 13312 .empty (.cutY 13312 .empty (.cutX 13824 (.cutY 13824 .empty (.cutX 13568 (.cutY 14080 .full .empty) .empty)) (.cutY 13824 (.cutX 14080 (.cutY 13568 .full .empty) .empty) .empty)))) .empty) .empty))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 .empty (.cutY 18432 .empty (.cutX 19456 (.cutY 19456 (.cutX 18944 (.cutY 18944 .empty (.cutX 18688 .empty (.cutY 19200 .empty .full))) (.cutY 18944 (.cutX 19200 .empty (.cutY 18688 .empty .full)) .empty)) .empty) .empty))) .empty) .empty) .empty) .empty)))

theorem metadata11 : 0<246335762 ∧ 52<128 ∧ 54<128 ∧ 0<4 ∧
    4006/4160=0 ∧ 4006%4160=4006 ∧ ∀ i, (leaves11 i).Valid 8 := by decide +kernel

theorem checked11 : gridTreeUnionCheck 32768 raw11 output11 cover11 source11 tree11 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits11 : gridUnionAreaUnits output11 = 262144 := by decide +kernel

noncomputable def phaseMass11 : ℝ := singlePhaseMass (246335762/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw11 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass11_eq : phaseMass11 = (123167881/819200000000 : ℝ) := by
  unfold phaseMass11
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw11 output11 cover11 source11
    (gridTreeUnionCheck_sound 32768 raw11 output11 cover11 source11 tree11 checked11)
    _ (by norm_num) _,areaUnits11]
  norm_num

-- Frozen phase 44, atom 4005, type 0, source (52,53).
def leavesData12 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves12 (i : Fin 1) : DyadicLeaf := leavesData12.getD i.val ⟨0,0,0⟩
def raw12 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 52 53 leaves12 i
def outputData12 : Array GridBox := #[⟨13312,13568,13568,13824⟩,⟨13568,13824,13312,13568⟩,⟨18944,19200,19200,19456⟩,⟨19200,19456,18944,19200⟩]
def output12 (i : Fin 4) : GridBox := outputData12.getD i.val ⟨0,0,0,0⟩
def coverData12 : Array ℕ := #[0,1,3,2]
def sourceData12 : Array ℕ := #[0,1,3,2]
def cover12 (i : Fin 4) : Fin 4 := ⟨coverData12.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source12 (i : Fin 4) : Fin 4 := ⟨sourceData12.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree12 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 (.cutY 14336 (.cutX 13312 .empty (.cutY 13312 .empty (.cutX 13824 (.cutY 13824 (.cutX 13568 (.cutY 13568 .empty .full) (.cutY 13568 .full .empty)) .empty) .empty))) .empty) .empty))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 .empty (.cutY 18432 .empty (.cutX 19456 (.cutY 19456 (.cutX 18944 .empty (.cutY 18944 .empty (.cutX 19200 (.cutY 19200 .empty .full) (.cutY 19200 .full .empty)))) .empty) .empty))) .empty) .empty) .empty) .empty)))

theorem metadata12 : 0<246335762 ∧ 52<128 ∧ 53<128 ∧ 0<4 ∧
    4005/4160=0 ∧ 4005%4160=4005 ∧ ∀ i, (leaves12 i).Valid 8 := by decide +kernel

theorem checked12 : gridTreeUnionCheck 32768 raw12 output12 cover12 source12 tree12 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits12 : gridUnionAreaUnits output12 = 262144 := by decide +kernel

noncomputable def phaseMass12 : ℝ := singlePhaseMass (246335762/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw12 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass12_eq : phaseMass12 = (123167881/819200000000 : ℝ) := by
  unfold phaseMass12
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw12 output12 cover12 source12
    (gridTreeUnionCheck_sound 32768 raw12 output12 cover12 source12 tree12 checked12)
    _ (by norm_num) _,areaUnits12]
  norm_num

-- Frozen phase 45, atom 4004, type 0, source (52,52).
def leavesData13 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves13 (i : Fin 1) : DyadicLeaf := leavesData13.getD i.val ⟨0,0,0⟩
def raw13 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 52 52 leaves13 i
def outputData13 : Array GridBox := #[⟨13312,13568,13312,13568⟩,⟨19200,19456,19200,19456⟩]
def output13 (i : Fin 2) : GridBox := outputData13.getD i.val ⟨0,0,0,0⟩
def coverData13 : Array ℕ := #[0,0,1,1]
def sourceData13 : Array ℕ := #[0,2]
def cover13 (i : Fin 4) : Fin 2 := ⟨coverData13.getD i.val 0 % 2,Nat.mod_lt _ (by decide)⟩
def source13 (i : Fin 2) : Fin 4 := ⟨sourceData13.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree13 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 (.cutY 14336 (.cutX 13312 .empty (.cutY 13312 .empty (.cutX 13824 (.cutY 13824 (.cutX 13568 (.cutY 13568 .full .empty) .empty) .empty) .empty))) .empty) .empty))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 .empty (.cutY 18432 .empty (.cutX 19456 (.cutY 19456 (.cutX 18944 .empty (.cutY 18944 .empty (.cutX 19200 .empty (.cutY 19200 .empty .full)))) .empty) .empty))) .empty) .empty) .empty) .empty)))

theorem metadata13 : 0<246335762 ∧ 52<128 ∧ 52<128 ∧ 0<4 ∧
    4004/4160=0 ∧ 4004%4160=4004 ∧ ∀ i, (leaves13 i).Valid 8 := by decide +kernel

theorem checked13 : gridTreeUnionCheck 32768 raw13 output13 cover13 source13 tree13 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits13 : gridUnionAreaUnits output13 = 131072 := by decide +kernel

noncomputable def phaseMass13 : ℝ := singlePhaseMass (246335762/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw13 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass13_eq : phaseMass13 = (123167881/1638400000000 : ℝ) := by
  unfold phaseMass13
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw13 output13 cover13 source13
    (gridTreeUnionCheck_sound 32768 raw13 output13 cover13 source13 tree13 checked13)
    _ (by norm_num) _,areaUnits13]
  norm_num

-- Frozen phase 46, atom 3981, type 0, source (51,54).
def leavesData14 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves14 (i : Fin 1) : DyadicLeaf := leavesData14.getD i.val ⟨0,0,0⟩
def raw14 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 51 54 leaves14 i
def outputData14 : Array GridBox := #[⟨13056,13312,13824,14080⟩,⟨13824,14080,13056,13312⟩,⟨18688,18944,19456,19712⟩,⟨19456,19712,18688,18944⟩]
def output14 (i : Fin 4) : GridBox := outputData14.getD i.val ⟨0,0,0,0⟩
def coverData14 : Array ℕ := #[0,1,3,2]
def sourceData14 : Array ℕ := #[0,1,3,2]
def cover14 (i : Fin 4) : Fin 4 := ⟨coverData14.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source14 (i : Fin 4) : Fin 4 := ⟨sourceData14.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree14 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 (.cutY 14336 (.cutX 13312 (.cutY 13312 .empty (.cutX 12800 .empty (.cutY 13824 .empty (.cutX 13056 .empty (.cutY 14080 .full .empty))))) (.cutY 13312 (.cutX 13824 .empty (.cutY 12800 .empty (.cutX 14080 (.cutY 13056 .empty .full) .empty))) .empty)) .empty) .empty))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 .empty (.cutY 18432 .empty (.cutX 19456 (.cutY 19456 .empty (.cutX 18944 (.cutY 19968 (.cutX 18688 .empty (.cutY 19712 .full .empty)) .empty) .empty)) (.cutY 19456 (.cutX 19968 (.cutY 18944 (.cutX 19712 (.cutY 18688 .empty .full) .empty) .empty) .empty) .empty)))) .empty) .empty) .empty) .empty)))

theorem metadata14 : 0<246335762 ∧ 51<128 ∧ 54<128 ∧ 0<4 ∧
    3981/4160=0 ∧ 3981%4160=3981 ∧ ∀ i, (leaves14 i).Valid 8 := by decide +kernel

theorem checked14 : gridTreeUnionCheck 32768 raw14 output14 cover14 source14 tree14 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits14 : gridUnionAreaUnits output14 = 262144 := by decide +kernel

noncomputable def phaseMass14 : ℝ := singlePhaseMass (246335762/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw14 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass14_eq : phaseMass14 = (123167881/819200000000 : ℝ) := by
  unfold phaseMass14
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw14 output14 cover14 source14
    (gridTreeUnionCheck_sound 32768 raw14 output14 cover14 source14 tree14 checked14)
    _ (by norm_num) _,areaUnits14]
  norm_num

-- Frozen phase 47, atom 3980, type 0, source (51,53).
def leavesData15 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves15 (i : Fin 1) : DyadicLeaf := leavesData15.getD i.val ⟨0,0,0⟩
def raw15 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 51 53 leaves15 i
def outputData15 : Array GridBox := #[⟨13056,13312,13568,13824⟩,⟨13568,13824,13056,13312⟩,⟨18944,19200,19456,19712⟩,⟨19456,19712,18944,19200⟩]
def output15 (i : Fin 4) : GridBox := outputData15.getD i.val ⟨0,0,0,0⟩
def coverData15 : Array ℕ := #[0,1,3,2]
def sourceData15 : Array ℕ := #[0,1,3,2]
def cover15 (i : Fin 4) : Fin 4 := ⟨coverData15.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source15 (i : Fin 4) : Fin 4 := ⟨sourceData15.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree15 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 (.cutY 14336 (.cutX 13312 (.cutY 13312 .empty (.cutX 12800 .empty (.cutY 13824 (.cutX 13056 .empty (.cutY 13568 .empty .full)) .empty))) (.cutY 13312 (.cutX 13824 (.cutY 12800 .empty (.cutX 13568 .empty (.cutY 13056 .empty .full))) .empty) .empty)) .empty) .empty))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 .empty (.cutY 18432 .empty (.cutX 19456 (.cutY 19456 .empty (.cutX 18944 .empty (.cutY 19968 (.cutX 19200 (.cutY 19712 .full .empty) .empty) .empty))) (.cutY 19456 (.cutX 19968 (.cutY 18944 .empty (.cutX 19712 (.cutY 19200 .full .empty) .empty)) .empty) .empty)))) .empty) .empty) .empty) .empty)))

theorem metadata15 : 0<246335762 ∧ 51<128 ∧ 53<128 ∧ 0<4 ∧
    3980/4160=0 ∧ 3980%4160=3980 ∧ ∀ i, (leaves15 i).Valid 8 := by decide +kernel

theorem checked15 : gridTreeUnionCheck 32768 raw15 output15 cover15 source15 tree15 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits15 : gridUnionAreaUnits output15 = 262144 := by decide +kernel

noncomputable def phaseMass15 : ℝ := singlePhaseMass (246335762/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw15 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass15_eq : phaseMass15 = (123167881/819200000000 : ℝ) := by
  unfold phaseMass15
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw15 output15 cover15 source15
    (gridTreeUnionCheck_sound 32768 raw15 output15 cover15 source15 tree15 checked15)
    _ (by norm_num) _,areaUnits15]
  norm_num

-- Frozen phase 48, atom 3979, type 0, source (51,52).
def leavesData16 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves16 (i : Fin 1) : DyadicLeaf := leavesData16.getD i.val ⟨0,0,0⟩
def raw16 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 51 52 leaves16 i
def outputData16 : Array GridBox := #[⟨13056,13312,13312,13568⟩,⟨13312,13568,13056,13312⟩,⟨19200,19456,19456,19712⟩,⟨19456,19712,19200,19456⟩]
def output16 (i : Fin 4) : GridBox := outputData16.getD i.val ⟨0,0,0,0⟩
def coverData16 : Array ℕ := #[0,1,3,2]
def sourceData16 : Array ℕ := #[0,1,3,2]
def cover16 (i : Fin 4) : Fin 4 := ⟨coverData16.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source16 (i : Fin 4) : Fin 4 := ⟨sourceData16.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree16 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 (.cutY 14336 (.cutX 13312 (.cutY 13312 .empty (.cutX 12800 .empty (.cutY 13824 (.cutX 13056 .empty (.cutY 13568 .full .empty)) .empty))) (.cutY 13312 (.cutX 13824 (.cutY 12800 .empty (.cutX 13568 (.cutY 13056 .empty .full) .empty)) .empty) .empty)) .empty) .empty))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 .empty (.cutY 18432 .empty (.cutX 19456 (.cutY 19456 .empty (.cutX 18944 .empty (.cutY 19968 (.cutX 19200 .empty (.cutY 19712 .full .empty)) .empty))) (.cutY 19456 (.cutX 19968 (.cutY 18944 .empty (.cutX 19712 (.cutY 19200 .empty .full) .empty)) .empty) .empty)))) .empty) .empty) .empty) .empty)))

theorem metadata16 : 0<246335762 ∧ 51<128 ∧ 52<128 ∧ 0<4 ∧
    3979/4160=0 ∧ 3979%4160=3979 ∧ ∀ i, (leaves16 i).Valid 8 := by decide +kernel

theorem checked16 : gridTreeUnionCheck 32768 raw16 output16 cover16 source16 tree16 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits16 : gridUnionAreaUnits output16 = 262144 := by decide +kernel

noncomputable def phaseMass16 : ℝ := singlePhaseMass (246335762/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw16 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass16_eq : phaseMass16 = (123167881/819200000000 : ℝ) := by
  unfold phaseMass16
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw16 output16 cover16 source16
    (gridTreeUnionCheck_sound 32768 raw16 output16 cover16 source16 tree16 checked16)
    _ (by norm_num) _,areaUnits16]
  norm_num

-- Frozen phase 49, atom 3978, type 0, source (51,51).
def leavesData17 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves17 (i : Fin 1) : DyadicLeaf := leavesData17.getD i.val ⟨0,0,0⟩
def raw17 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 51 51 leaves17 i
def outputData17 : Array GridBox := #[⟨13056,13312,13056,13312⟩,⟨19456,19712,19456,19712⟩]
def output17 (i : Fin 2) : GridBox := outputData17.getD i.val ⟨0,0,0,0⟩
def coverData17 : Array ℕ := #[0,0,1,1]
def sourceData17 : Array ℕ := #[0,2]
def cover17 (i : Fin 4) : Fin 2 := ⟨coverData17.getD i.val 0 % 2,Nat.mod_lt _ (by decide)⟩
def source17 (i : Fin 2) : Fin 4 := ⟨sourceData17.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree17 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 (.cutY 14336 (.cutX 13312 (.cutY 13312 (.cutX 12800 .empty (.cutY 12800 .empty (.cutX 13056 .empty (.cutY 13056 .empty .full)))) .empty) .empty) .empty) .empty))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 .empty (.cutY 18432 .empty (.cutX 19456 .empty (.cutY 19456 .empty (.cutX 19968 (.cutY 19968 (.cutX 19712 (.cutY 19712 .full .empty) .empty) .empty) .empty))))) .empty) .empty) .empty) .empty)))

theorem metadata17 : 0<246335762 ∧ 51<128 ∧ 51<128 ∧ 0<4 ∧
    3978/4160=0 ∧ 3978%4160=3978 ∧ ∀ i, (leaves17 i).Valid 8 := by decide +kernel

theorem checked17 : gridTreeUnionCheck 32768 raw17 output17 cover17 source17 tree17 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits17 : gridUnionAreaUnits output17 = 131072 := by decide +kernel

noncomputable def phaseMass17 : ℝ := singlePhaseMass (246335762/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw17 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass17_eq : phaseMass17 = (123167881/1638400000000 : ℝ) := by
  unfold phaseMass17
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw17 output17 cover17 source17
    (gridTreeUnionCheck_sound 32768 raw17 output17 cover17 source17 tree17 checked17)
    _ (by norm_num) _,areaUnits17]
  norm_num

-- Frozen phase 50, atom 3953, type 0, source (50,53).
def leavesData18 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves18 (i : Fin 1) : DyadicLeaf := leavesData18.getD i.val ⟨0,0,0⟩
def raw18 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 50 53 leaves18 i
def outputData18 : Array GridBox := #[⟨12800,13056,13568,13824⟩,⟨13568,13824,12800,13056⟩,⟨18944,19200,19712,19968⟩,⟨19712,19968,18944,19200⟩]
def output18 (i : Fin 4) : GridBox := outputData18.getD i.val ⟨0,0,0,0⟩
def coverData18 : Array ℕ := #[0,1,3,2]
def sourceData18 : Array ℕ := #[0,1,3,2]
def cover18 (i : Fin 4) : Fin 4 := ⟨coverData18.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source18 (i : Fin 4) : Fin 4 := ⟨sourceData18.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree18 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 (.cutY 14336 (.cutX 13312 (.cutY 13312 .empty (.cutX 12800 .empty (.cutY 13824 (.cutX 13056 (.cutY 13568 .empty .full) .empty) .empty))) (.cutY 13312 (.cutX 13824 (.cutY 12800 .empty (.cutX 13568 .empty (.cutY 13056 .full .empty))) .empty) .empty)) .empty) .empty))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 .empty (.cutY 18432 .empty (.cutX 19456 (.cutY 19456 .empty (.cutX 18944 .empty (.cutY 19968 (.cutX 19200 (.cutY 19712 .empty .full) .empty) .empty))) (.cutY 19456 (.cutX 19968 (.cutY 18944 .empty (.cutX 19712 .empty (.cutY 19200 .full .empty))) .empty) .empty)))) .empty) .empty) .empty) .empty)))

theorem metadata18 : 0<246335762 ∧ 50<128 ∧ 53<128 ∧ 0<4 ∧
    3953/4160=0 ∧ 3953%4160=3953 ∧ ∀ i, (leaves18 i).Valid 8 := by decide +kernel

theorem checked18 : gridTreeUnionCheck 32768 raw18 output18 cover18 source18 tree18 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits18 : gridUnionAreaUnits output18 = 262144 := by decide +kernel

noncomputable def phaseMass18 : ℝ := singlePhaseMass (246335762/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw18 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass18_eq : phaseMass18 = (123167881/819200000000 : ℝ) := by
  unfold phaseMass18
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw18 output18 cover18 source18
    (gridTreeUnionCheck_sound 32768 raw18 output18 cover18 source18 tree18 checked18)
    _ (by norm_num) _,areaUnits18]
  norm_num

-- Frozen phase 51, atom 3952, type 0, source (50,52).
def leavesData19 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves19 (i : Fin 1) : DyadicLeaf := leavesData19.getD i.val ⟨0,0,0⟩
def raw19 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 50 52 leaves19 i
def outputData19 : Array GridBox := #[⟨12800,13056,13312,13568⟩,⟨13312,13568,12800,13056⟩,⟨19200,19456,19712,19968⟩,⟨19712,19968,19200,19456⟩]
def output19 (i : Fin 4) : GridBox := outputData19.getD i.val ⟨0,0,0,0⟩
def coverData19 : Array ℕ := #[0,1,3,2]
def sourceData19 : Array ℕ := #[0,1,3,2]
def cover19 (i : Fin 4) : Fin 4 := ⟨coverData19.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source19 (i : Fin 4) : Fin 4 := ⟨sourceData19.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree19 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 (.cutY 14336 (.cutX 13312 (.cutY 13312 .empty (.cutX 12800 .empty (.cutY 13824 (.cutX 13056 (.cutY 13568 .full .empty) .empty) .empty))) (.cutY 13312 (.cutX 13824 (.cutY 12800 .empty (.cutX 13568 (.cutY 13056 .full .empty) .empty)) .empty) .empty)) .empty) .empty))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 .empty (.cutY 18432 .empty (.cutX 19456 (.cutY 19456 .empty (.cutX 18944 .empty (.cutY 19968 (.cutX 19200 .empty (.cutY 19712 .empty .full)) .empty))) (.cutY 19456 (.cutX 19968 (.cutY 18944 .empty (.cutX 19712 .empty (.cutY 19200 .empty .full))) .empty) .empty)))) .empty) .empty) .empty) .empty)))

theorem metadata19 : 0<246335762 ∧ 50<128 ∧ 52<128 ∧ 0<4 ∧
    3952/4160=0 ∧ 3952%4160=3952 ∧ ∀ i, (leaves19 i).Valid 8 := by decide +kernel

theorem checked19 : gridTreeUnionCheck 32768 raw19 output19 cover19 source19 tree19 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits19 : gridUnionAreaUnits output19 = 262144 := by decide +kernel

noncomputable def phaseMass19 : ℝ := singlePhaseMass (246335762/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw19 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass19_eq : phaseMass19 = (123167881/819200000000 : ℝ) := by
  unfold phaseMass19
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw19 output19 cover19 source19
    (gridTreeUnionCheck_sound 32768 raw19 output19 cover19 source19 tree19 checked19)
    _ (by norm_num) _,areaUnits19]
  norm_num

-- Frozen phase 52, atom 3951, type 0, source (50,51).
def leavesData20 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves20 (i : Fin 1) : DyadicLeaf := leavesData20.getD i.val ⟨0,0,0⟩
def raw20 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 50 51 leaves20 i
def outputData20 : Array GridBox := #[⟨12800,13056,13056,13312⟩,⟨13056,13312,12800,13056⟩,⟨19456,19712,19712,19968⟩,⟨19712,19968,19456,19712⟩]
def output20 (i : Fin 4) : GridBox := outputData20.getD i.val ⟨0,0,0,0⟩
def coverData20 : Array ℕ := #[0,1,3,2]
def sourceData20 : Array ℕ := #[0,1,3,2]
def cover20 (i : Fin 4) : Fin 4 := ⟨coverData20.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source20 (i : Fin 4) : Fin 4 := ⟨sourceData20.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree20 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 (.cutY 14336 (.cutX 13312 (.cutY 13312 (.cutX 12800 .empty (.cutY 12800 .empty (.cutX 13056 (.cutY 13056 .empty .full) (.cutY 13056 .full .empty)))) .empty) .empty) .empty) .empty))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 .empty (.cutY 18432 .empty (.cutX 19456 .empty (.cutY 19456 .empty (.cutX 19968 (.cutY 19968 (.cutX 19712 (.cutY 19712 .empty .full) (.cutY 19712 .full .empty)) .empty) .empty))))) .empty) .empty) .empty) .empty)))

theorem metadata20 : 0<246335762 ∧ 50<128 ∧ 51<128 ∧ 0<4 ∧
    3951/4160=0 ∧ 3951%4160=3951 ∧ ∀ i, (leaves20 i).Valid 8 := by decide +kernel

theorem checked20 : gridTreeUnionCheck 32768 raw20 output20 cover20 source20 tree20 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits20 : gridUnionAreaUnits output20 = 262144 := by decide +kernel

noncomputable def phaseMass20 : ℝ := singlePhaseMass (246335762/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw20 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass20_eq : phaseMass20 = (123167881/819200000000 : ℝ) := by
  unfold phaseMass20
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw20 output20 cover20 source20
    (gridTreeUnionCheck_sound 32768 raw20 output20 cover20 source20 tree20 checked20)
    _ (by norm_num) _,areaUnits20]
  norm_num

-- Frozen phase 53, atom 3950, type 0, source (50,50).
def leavesData21 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves21 (i : Fin 1) : DyadicLeaf := leavesData21.getD i.val ⟨0,0,0⟩
def raw21 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 50 50 leaves21 i
def outputData21 : Array GridBox := #[⟨12800,13056,12800,13056⟩,⟨19712,19968,19712,19968⟩]
def output21 (i : Fin 2) : GridBox := outputData21.getD i.val ⟨0,0,0,0⟩
def coverData21 : Array ℕ := #[0,0,1,1]
def sourceData21 : Array ℕ := #[0,2]
def cover21 (i : Fin 4) : Fin 2 := ⟨coverData21.getD i.val 0 % 2,Nat.mod_lt _ (by decide)⟩
def source21 (i : Fin 2) : Fin 4 := ⟨sourceData21.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree21 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 (.cutY 14336 (.cutX 13312 (.cutY 13312 (.cutX 12800 .empty (.cutY 12800 .empty (.cutX 13056 (.cutY 13056 .full .empty) .empty))) .empty) .empty) .empty) .empty))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 .empty (.cutY 18432 .empty (.cutX 19456 .empty (.cutY 19456 .empty (.cutX 19968 (.cutY 19968 (.cutX 19712 .empty (.cutY 19712 .empty .full)) .empty) .empty))))) .empty) .empty) .empty) .empty)))

theorem metadata21 : 0<246335762 ∧ 50<128 ∧ 50<128 ∧ 0<4 ∧
    3950/4160=0 ∧ 3950%4160=3950 ∧ ∀ i, (leaves21 i).Valid 8 := by decide +kernel

theorem checked21 : gridTreeUnionCheck 32768 raw21 output21 cover21 source21 tree21 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits21 : gridUnionAreaUnits output21 = 131072 := by decide +kernel

noncomputable def phaseMass21 : ℝ := singlePhaseMass (246335762/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw21 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass21_eq : phaseMass21 = (123167881/1638400000000 : ℝ) := by
  unfold phaseMass21
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw21 output21 cover21 source21
    (gridTreeUnionCheck_sound 32768 raw21 output21 cover21 source21 tree21 checked21)
    _ (by norm_num) _,areaUnits21]
  norm_num

-- Frozen phase 54, atom 3923, type 0, source (49,52).
def leavesData22 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves22 (i : Fin 1) : DyadicLeaf := leavesData22.getD i.val ⟨0,0,0⟩
def raw22 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 49 52 leaves22 i
def outputData22 : Array GridBox := #[⟨12544,12800,13312,13568⟩,⟨13312,13568,12544,12800⟩,⟨19200,19456,19968,20224⟩,⟨19968,20224,19200,19456⟩]
def output22 (i : Fin 4) : GridBox := outputData22.getD i.val ⟨0,0,0,0⟩
def coverData22 : Array ℕ := #[0,1,3,2]
def sourceData22 : Array ℕ := #[0,1,3,2]
def cover22 (i : Fin 4) : Fin 4 := ⟨coverData22.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source22 (i : Fin 4) : Fin 4 := ⟨sourceData22.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree22 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 (.cutY 14336 (.cutX 13312 (.cutY 13312 .empty (.cutX 12800 (.cutY 13824 (.cutX 12544 .empty (.cutY 13568 .full .empty)) .empty) .empty)) (.cutY 13312 (.cutX 13824 (.cutY 12800 (.cutX 13568 (.cutY 12544 .empty .full) .empty) .empty) .empty) .empty)) .empty) .empty))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 .empty (.cutY 18432 .empty (.cutX 19456 (.cutY 19456 .empty (.cutX 18944 .empty (.cutY 19968 .empty (.cutX 19200 .empty (.cutY 20224 .full .empty))))) (.cutY 19456 (.cutX 19968 .empty (.cutY 18944 .empty (.cutX 20224 (.cutY 19200 .empty .full) .empty))) .empty)))) .empty) .empty) .empty) .empty)))

theorem metadata22 : 0<246335762 ∧ 49<128 ∧ 52<128 ∧ 0<4 ∧
    3923/4160=0 ∧ 3923%4160=3923 ∧ ∀ i, (leaves22 i).Valid 8 := by decide +kernel

theorem checked22 : gridTreeUnionCheck 32768 raw22 output22 cover22 source22 tree22 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits22 : gridUnionAreaUnits output22 = 262144 := by decide +kernel

noncomputable def phaseMass22 : ℝ := singlePhaseMass (246335762/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw22 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass22_eq : phaseMass22 = (123167881/819200000000 : ℝ) := by
  unfold phaseMass22
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw22 output22 cover22 source22
    (gridTreeUnionCheck_sound 32768 raw22 output22 cover22 source22 tree22 checked22)
    _ (by norm_num) _,areaUnits22]
  norm_num

-- Frozen phase 55, atom 3922, type 0, source (49,51).
def leavesData23 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves23 (i : Fin 1) : DyadicLeaf := leavesData23.getD i.val ⟨0,0,0⟩
def raw23 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 49 51 leaves23 i
def outputData23 : Array GridBox := #[⟨12544,12800,13056,13312⟩,⟨13056,13312,12544,12800⟩,⟨19456,19712,19968,20224⟩,⟨19968,20224,19456,19712⟩]
def output23 (i : Fin 4) : GridBox := outputData23.getD i.val ⟨0,0,0,0⟩
def coverData23 : Array ℕ := #[0,1,3,2]
def sourceData23 : Array ℕ := #[0,1,3,2]
def cover23 (i : Fin 4) : Fin 4 := ⟨coverData23.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source23 (i : Fin 4) : Fin 4 := ⟨sourceData23.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree23 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 (.cutY 14336 (.cutX 13312 (.cutY 13312 (.cutX 12800 (.cutY 12800 .empty (.cutX 12544 .empty (.cutY 13056 .empty .full))) (.cutY 12800 (.cutX 13056 .empty (.cutY 12544 .empty .full)) .empty)) .empty) .empty) .empty) .empty))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 .empty (.cutY 18432 .empty (.cutX 19456 .empty (.cutY 19456 .empty (.cutX 19968 (.cutY 19968 .empty (.cutX 19712 (.cutY 20224 .full .empty) .empty)) (.cutY 19968 (.cutX 20224 (.cutY 19712 .full .empty) .empty) .empty)))))) .empty) .empty) .empty) .empty)))

theorem metadata23 : 0<246335762 ∧ 49<128 ∧ 51<128 ∧ 0<4 ∧
    3922/4160=0 ∧ 3922%4160=3922 ∧ ∀ i, (leaves23 i).Valid 8 := by decide +kernel

theorem checked23 : gridTreeUnionCheck 32768 raw23 output23 cover23 source23 tree23 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits23 : gridUnionAreaUnits output23 = 262144 := by decide +kernel

noncomputable def phaseMass23 : ℝ := singlePhaseMass (246335762/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw23 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass23_eq : phaseMass23 = (123167881/819200000000 : ℝ) := by
  unfold phaseMass23
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw23 output23 cover23 source23
    (gridTreeUnionCheck_sound 32768 raw23 output23 cover23 source23 tree23 checked23)
    _ (by norm_num) _,areaUnits23]
  norm_num

-- Frozen phase 56, atom 3921, type 0, source (49,50).
def leavesData24 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves24 (i : Fin 1) : DyadicLeaf := leavesData24.getD i.val ⟨0,0,0⟩
def raw24 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 49 50 leaves24 i
def outputData24 : Array GridBox := #[⟨12544,12800,12800,13056⟩,⟨12800,13056,12544,12800⟩,⟨19712,19968,19968,20224⟩,⟨19968,20224,19712,19968⟩]
def output24 (i : Fin 4) : GridBox := outputData24.getD i.val ⟨0,0,0,0⟩
def coverData24 : Array ℕ := #[0,1,3,2]
def sourceData24 : Array ℕ := #[0,1,3,2]
def cover24 (i : Fin 4) : Fin 4 := ⟨coverData24.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source24 (i : Fin 4) : Fin 4 := ⟨sourceData24.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree24 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 (.cutY 14336 (.cutX 13312 (.cutY 13312 (.cutX 12800 (.cutY 12800 .empty (.cutX 12544 .empty (.cutY 13056 .full .empty))) (.cutY 12800 (.cutX 13056 (.cutY 12544 .empty .full) .empty) .empty)) .empty) .empty) .empty) .empty))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 .empty (.cutY 18432 .empty (.cutX 19456 .empty (.cutY 19456 .empty (.cutX 19968 (.cutY 19968 .empty (.cutX 19712 .empty (.cutY 20224 .full .empty))) (.cutY 19968 (.cutX 20224 (.cutY 19712 .empty .full) .empty) .empty)))))) .empty) .empty) .empty) .empty)))

theorem metadata24 : 0<246335762 ∧ 49<128 ∧ 50<128 ∧ 0<4 ∧
    3921/4160=0 ∧ 3921%4160=3921 ∧ ∀ i, (leaves24 i).Valid 8 := by decide +kernel

theorem checked24 : gridTreeUnionCheck 32768 raw24 output24 cover24 source24 tree24 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits24 : gridUnionAreaUnits output24 = 262144 := by decide +kernel

noncomputable def phaseMass24 : ℝ := singlePhaseMass (246335762/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw24 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass24_eq : phaseMass24 = (123167881/819200000000 : ℝ) := by
  unfold phaseMass24
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw24 output24 cover24 source24
    (gridTreeUnionCheck_sound 32768 raw24 output24 cover24 source24 tree24 checked24)
    _ (by norm_num) _,areaUnits24]
  norm_num

-- Frozen phase 57, atom 3920, type 0, source (49,49).
def leavesData25 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves25 (i : Fin 1) : DyadicLeaf := leavesData25.getD i.val ⟨0,0,0⟩
def raw25 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 49 49 leaves25 i
def outputData25 : Array GridBox := #[⟨12544,12800,12544,12800⟩,⟨19968,20224,19968,20224⟩]
def output25 (i : Fin 2) : GridBox := outputData25.getD i.val ⟨0,0,0,0⟩
def coverData25 : Array ℕ := #[0,0,1,1]
def sourceData25 : Array ℕ := #[0,2]
def cover25 (i : Fin 4) : Fin 2 := ⟨coverData25.getD i.val 0 % 2,Nat.mod_lt _ (by decide)⟩
def source25 (i : Fin 2) : Fin 4 := ⟨sourceData25.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree25 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 (.cutY 14336 (.cutX 13312 (.cutY 13312 (.cutX 12800 (.cutY 12800 (.cutX 12544 .empty (.cutY 12544 .empty .full)) .empty) .empty) .empty) .empty) .empty) .empty))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 .empty (.cutY 18432 .empty (.cutX 19456 .empty (.cutY 19456 .empty (.cutX 19968 .empty (.cutY 19968 .empty (.cutX 20224 (.cutY 20224 .full .empty) .empty))))))) .empty) .empty) .empty) .empty)))

theorem metadata25 : 0<246335762 ∧ 49<128 ∧ 49<128 ∧ 0<4 ∧
    3920/4160=0 ∧ 3920%4160=3920 ∧ ∀ i, (leaves25 i).Valid 8 := by decide +kernel

theorem checked25 : gridTreeUnionCheck 32768 raw25 output25 cover25 source25 tree25 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits25 : gridUnionAreaUnits output25 = 131072 := by decide +kernel

noncomputable def phaseMass25 : ℝ := singlePhaseMass (246335762/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw25 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass25_eq : phaseMass25 = (123167881/1638400000000 : ℝ) := by
  unfold phaseMass25
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw25 output25 cover25 source25
    (gridTreeUnionCheck_sound 32768 raw25 output25 cover25 source25 tree25 checked25)
    _ (by norm_num) _,areaUnits25]
  norm_num

-- Frozen phase 58, atom 3891, type 0, source (48,51).
def leavesData26 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves26 (i : Fin 1) : DyadicLeaf := leavesData26.getD i.val ⟨0,0,0⟩
def raw26 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 48 51 leaves26 i
def outputData26 : Array GridBox := #[⟨12288,12544,13056,13312⟩,⟨13056,13312,12288,12544⟩,⟨19456,19712,20224,20480⟩,⟨20224,20480,19456,19712⟩]
def output26 (i : Fin 4) : GridBox := outputData26.getD i.val ⟨0,0,0,0⟩
def coverData26 : Array ℕ := #[0,1,3,2]
def sourceData26 : Array ℕ := #[0,1,3,2]
def cover26 (i : Fin 4) : Fin 4 := ⟨coverData26.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source26 (i : Fin 4) : Fin 4 := ⟨sourceData26.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree26 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 (.cutY 14336 (.cutX 13312 (.cutY 13312 (.cutX 12800 (.cutY 12800 .empty (.cutX 12544 (.cutY 13056 .empty .full) .empty)) (.cutY 12800 (.cutX 13056 .empty (.cutY 12544 .full .empty)) .empty)) .empty) .empty) .empty) .empty))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 .empty (.cutY 18432 .empty (.cutX 19456 .empty (.cutY 19456 .empty (.cutX 19968 (.cutY 19968 .empty (.cutX 19712 (.cutY 20224 .empty .full) .empty)) (.cutY 19968 (.cutX 20224 .empty (.cutY 19712 .full .empty)) .empty)))))) .empty) .empty) .empty) .empty)))

theorem metadata26 : 0<246335762 ∧ 48<128 ∧ 51<128 ∧ 0<4 ∧
    3891/4160=0 ∧ 3891%4160=3891 ∧ ∀ i, (leaves26 i).Valid 8 := by decide +kernel

theorem checked26 : gridTreeUnionCheck 32768 raw26 output26 cover26 source26 tree26 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits26 : gridUnionAreaUnits output26 = 262144 := by decide +kernel

noncomputable def phaseMass26 : ℝ := singlePhaseMass (246335762/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw26 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass26_eq : phaseMass26 = (123167881/819200000000 : ℝ) := by
  unfold phaseMass26
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw26 output26 cover26 source26
    (gridTreeUnionCheck_sound 32768 raw26 output26 cover26 source26 tree26 checked26)
    _ (by norm_num) _,areaUnits26]
  norm_num

-- Frozen phase 59, atom 3890, type 0, source (48,50).
def leavesData27 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves27 (i : Fin 1) : DyadicLeaf := leavesData27.getD i.val ⟨0,0,0⟩
def raw27 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 48 50 leaves27 i
def outputData27 : Array GridBox := #[⟨12288,12544,12800,13056⟩,⟨12800,13056,12288,12544⟩,⟨19712,19968,20224,20480⟩,⟨20224,20480,19712,19968⟩]
def output27 (i : Fin 4) : GridBox := outputData27.getD i.val ⟨0,0,0,0⟩
def coverData27 : Array ℕ := #[0,1,3,2]
def sourceData27 : Array ℕ := #[0,1,3,2]
def cover27 (i : Fin 4) : Fin 4 := ⟨coverData27.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source27 (i : Fin 4) : Fin 4 := ⟨sourceData27.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree27 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 (.cutY 14336 (.cutX 13312 (.cutY 13312 (.cutX 12800 (.cutY 12800 .empty (.cutX 12544 (.cutY 13056 .full .empty) .empty)) (.cutY 12800 (.cutX 13056 (.cutY 12544 .full .empty) .empty) .empty)) .empty) .empty) .empty) .empty))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 .empty (.cutY 18432 .empty (.cutX 19456 .empty (.cutY 19456 .empty (.cutX 19968 (.cutY 19968 .empty (.cutX 19712 .empty (.cutY 20224 .empty .full))) (.cutY 19968 (.cutX 20224 .empty (.cutY 19712 .empty .full)) .empty)))))) .empty) .empty) .empty) .empty)))

theorem metadata27 : 0<246335762 ∧ 48<128 ∧ 50<128 ∧ 0<4 ∧
    3890/4160=0 ∧ 3890%4160=3890 ∧ ∀ i, (leaves27 i).Valid 8 := by decide +kernel

theorem checked27 : gridTreeUnionCheck 32768 raw27 output27 cover27 source27 tree27 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits27 : gridUnionAreaUnits output27 = 262144 := by decide +kernel

noncomputable def phaseMass27 : ℝ := singlePhaseMass (246335762/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw27 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass27_eq : phaseMass27 = (123167881/819200000000 : ℝ) := by
  unfold phaseMass27
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw27 output27 cover27 source27
    (gridTreeUnionCheck_sound 32768 raw27 output27 cover27 source27 tree27 checked27)
    _ (by norm_num) _,areaUnits27]
  norm_num

-- Frozen phase 60, atom 3889, type 0, source (48,49).
def leavesData28 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves28 (i : Fin 1) : DyadicLeaf := leavesData28.getD i.val ⟨0,0,0⟩
def raw28 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 48 49 leaves28 i
def outputData28 : Array GridBox := #[⟨12288,12544,12544,12800⟩,⟨12544,12800,12288,12544⟩,⟨19968,20224,20224,20480⟩,⟨20224,20480,19968,20224⟩]
def output28 (i : Fin 4) : GridBox := outputData28.getD i.val ⟨0,0,0,0⟩
def coverData28 : Array ℕ := #[0,1,3,2]
def sourceData28 : Array ℕ := #[0,1,3,2]
def cover28 (i : Fin 4) : Fin 4 := ⟨coverData28.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source28 (i : Fin 4) : Fin 4 := ⟨sourceData28.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree28 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 (.cutY 14336 (.cutX 13312 (.cutY 13312 (.cutX 12800 (.cutY 12800 (.cutX 12544 (.cutY 12544 .empty .full) (.cutY 12544 .full .empty)) .empty) .empty) .empty) .empty) .empty) .empty))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 .empty (.cutY 18432 .empty (.cutX 19456 .empty (.cutY 19456 .empty (.cutX 19968 .empty (.cutY 19968 .empty (.cutX 20224 (.cutY 20224 .empty .full) (.cutY 20224 .full .empty)))))))) .empty) .empty) .empty) .empty)))

theorem metadata28 : 0<246335762 ∧ 48<128 ∧ 49<128 ∧ 0<4 ∧
    3889/4160=0 ∧ 3889%4160=3889 ∧ ∀ i, (leaves28 i).Valid 8 := by decide +kernel

theorem checked28 : gridTreeUnionCheck 32768 raw28 output28 cover28 source28 tree28 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits28 : gridUnionAreaUnits output28 = 262144 := by decide +kernel

noncomputable def phaseMass28 : ℝ := singlePhaseMass (246335762/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw28 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass28_eq : phaseMass28 = (123167881/819200000000 : ℝ) := by
  unfold phaseMass28
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw28 output28 cover28 source28
    (gridTreeUnionCheck_sound 32768 raw28 output28 cover28 source28 tree28 checked28)
    _ (by norm_num) _,areaUnits28]
  norm_num

-- Frozen phase 61, atom 3857, type 0, source (47,50).
def leavesData29 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves29 (i : Fin 1) : DyadicLeaf := leavesData29.getD i.val ⟨0,0,0⟩
def raw29 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 47 50 leaves29 i
def outputData29 : Array GridBox := #[⟨12032,12288,12800,13056⟩,⟨12800,13056,12032,12288⟩,⟨19712,19968,20480,20736⟩,⟨20480,20736,19712,19968⟩]
def output29 (i : Fin 4) : GridBox := outputData29.getD i.val ⟨0,0,0,0⟩
def coverData29 : Array ℕ := #[0,1,3,2]
def sourceData29 : Array ℕ := #[0,1,3,2]
def cover29 (i : Fin 4) : Fin 4 := ⟨coverData29.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source29 (i : Fin 4) : Fin 4 := ⟨sourceData29.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree29 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 .empty (.cutY 14336 (.cutX 11264 .empty (.cutY 13312 (.cutX 11776 .empty (.cutY 12800 .empty (.cutX 12032 .empty (.cutY 13056 .full .empty)))) .empty)) .empty))) (.cutY 12288 (.cutX 14336 (.cutY 10240 .empty (.cutX 13312 (.cutY 11264 .empty (.cutX 12800 .empty (.cutY 11776 .empty (.cutX 13056 (.cutY 12032 .empty .full) .empty)))) .empty)) .empty) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 .empty (.cutY 22528 (.cutX 19456 .empty (.cutY 21504 (.cutX 19968 (.cutY 20992 (.cutX 19712 .empty (.cutY 20736 .full .empty)) .empty) .empty) .empty)) .empty))) (.cutY 20480 (.cutX 22528 (.cutY 18432 .empty (.cutX 21504 (.cutY 19456 .empty (.cutX 20992 (.cutY 19968 (.cutX 20736 (.cutY 19712 .empty .full) .empty) .empty) .empty)) .empty)) .empty) .empty)) .empty) .empty)))

theorem metadata29 : 0<294935223 ∧ 47<128 ∧ 50<128 ∧ 0<4 ∧
    3857/4160=0 ∧ 3857%4160=3857 ∧ ∀ i, (leaves29 i).Valid 8 := by decide +kernel

theorem checked29 : gridTreeUnionCheck 32768 raw29 output29 cover29 source29 tree29 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits29 : gridUnionAreaUnits output29 = 262144 := by decide +kernel

noncomputable def phaseMass29 : ℝ := singlePhaseMass (294935223/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw29 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass29_eq : phaseMass29 = (294935223/1638400000000 : ℝ) := by
  unfold phaseMass29
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw29 output29 cover29 source29
    (gridTreeUnionCheck_sound 32768 raw29 output29 cover29 source29 tree29 checked29)
    _ (by norm_num) _,areaUnits29]
  norm_num

-- Frozen phase 62, atom 3856, type 0, source (47,49).
def leavesData30 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves30 (i : Fin 1) : DyadicLeaf := leavesData30.getD i.val ⟨0,0,0⟩
def raw30 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 47 49 leaves30 i
def outputData30 : Array GridBox := #[⟨12032,12288,12544,12800⟩,⟨12544,12800,12032,12288⟩,⟨19968,20224,20480,20736⟩,⟨20480,20736,19968,20224⟩]
def output30 (i : Fin 4) : GridBox := outputData30.getD i.val ⟨0,0,0,0⟩
def coverData30 : Array ℕ := #[0,1,3,2]
def sourceData30 : Array ℕ := #[0,1,3,2]
def cover30 (i : Fin 4) : Fin 4 := ⟨coverData30.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source30 (i : Fin 4) : Fin 4 := ⟨sourceData30.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree30 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 .empty (.cutY 14336 (.cutX 11264 .empty (.cutY 13312 (.cutX 11776 .empty (.cutY 12800 (.cutX 12032 .empty (.cutY 12544 .empty .full)) .empty)) .empty)) .empty))) (.cutY 12288 (.cutX 14336 (.cutY 10240 .empty (.cutX 13312 (.cutY 11264 .empty (.cutX 12800 (.cutY 11776 .empty (.cutX 12544 .empty (.cutY 12032 .empty .full))) .empty)) .empty)) .empty) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 .empty (.cutY 22528 (.cutX 19456 .empty (.cutY 21504 (.cutX 19968 .empty (.cutY 20992 (.cutX 20224 (.cutY 20736 .full .empty) .empty) .empty)) .empty)) .empty))) (.cutY 20480 (.cutX 22528 (.cutY 18432 .empty (.cutX 21504 (.cutY 19456 .empty (.cutX 20992 (.cutY 19968 .empty (.cutX 20736 (.cutY 20224 .full .empty) .empty)) .empty)) .empty)) .empty) .empty)) .empty) .empty)))

theorem metadata30 : 0<294935223 ∧ 47<128 ∧ 49<128 ∧ 0<4 ∧
    3856/4160=0 ∧ 3856%4160=3856 ∧ ∀ i, (leaves30 i).Valid 8 := by decide +kernel

theorem checked30 : gridTreeUnionCheck 32768 raw30 output30 cover30 source30 tree30 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits30 : gridUnionAreaUnits output30 = 262144 := by decide +kernel

noncomputable def phaseMass30 : ℝ := singlePhaseMass (294935223/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw30 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass30_eq : phaseMass30 = (294935223/1638400000000 : ℝ) := by
  unfold phaseMass30
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw30 output30 cover30 source30
    (gridTreeUnionCheck_sound 32768 raw30 output30 cover30 source30 tree30 checked30)
    _ (by norm_num) _,areaUnits30]
  norm_num

-- Frozen phase 63, atom 3888, type 0, source (48,48).
def leavesData31 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves31 (i : Fin 1) : DyadicLeaf := leavesData31.getD i.val ⟨0,0,0⟩
def raw31 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 48 48 leaves31 i
def outputData31 : Array GridBox := #[⟨12288,12544,12288,12544⟩,⟨20224,20480,20224,20480⟩]
def output31 (i : Fin 2) : GridBox := outputData31.getD i.val ⟨0,0,0,0⟩
def coverData31 : Array ℕ := #[0,0,1,1]
def sourceData31 : Array ℕ := #[0,2]
def cover31 (i : Fin 4) : Fin 2 := ⟨coverData31.getD i.val 0 % 2,Nat.mod_lt _ (by decide)⟩
def source31 (i : Fin 2) : Fin 4 := ⟨sourceData31.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree31 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 (.cutY 14336 (.cutX 13312 (.cutY 13312 (.cutX 12800 (.cutY 12800 (.cutX 12544 (.cutY 12544 .full .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 .empty (.cutY 18432 .empty (.cutX 19456 .empty (.cutY 19456 .empty (.cutX 19968 .empty (.cutY 19968 .empty (.cutX 20224 .empty (.cutY 20224 .empty .full)))))))) .empty) .empty) .empty) .empty)))

theorem metadata31 : 0<246335762 ∧ 48<128 ∧ 48<128 ∧ 0<4 ∧
    3888/4160=0 ∧ 3888%4160=3888 ∧ ∀ i, (leaves31 i).Valid 8 := by decide +kernel

theorem checked31 : gridTreeUnionCheck 32768 raw31 output31 cover31 source31 tree31 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits31 : gridUnionAreaUnits output31 = 131072 := by decide +kernel

noncomputable def phaseMass31 : ℝ := singlePhaseMass (246335762/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw31 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass31_eq : phaseMass31 = (123167881/1638400000000 : ℝ) := by
  unfold phaseMass31
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw31 output31 cover31 source31
    (gridTreeUnionCheck_sound 32768 raw31 output31 cover31 source31 tree31 checked31)
    _ (by norm_num) _,areaUnits31]
  norm_num

-- Frozen phase 64, atom 3855, type 0, source (47,48).
def leavesData32 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves32 (i : Fin 1) : DyadicLeaf := leavesData32.getD i.val ⟨0,0,0⟩
def raw32 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 47 48 leaves32 i
def outputData32 : Array GridBox := #[⟨12032,12288,12288,12544⟩,⟨12288,12544,12032,12288⟩,⟨20224,20480,20480,20736⟩,⟨20480,20736,20224,20480⟩]
def output32 (i : Fin 4) : GridBox := outputData32.getD i.val ⟨0,0,0,0⟩
def coverData32 : Array ℕ := #[0,1,3,2]
def sourceData32 : Array ℕ := #[0,1,3,2]
def cover32 (i : Fin 4) : Fin 4 := ⟨coverData32.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source32 (i : Fin 4) : Fin 4 := ⟨sourceData32.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree32 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 .empty (.cutY 14336 (.cutX 11264 .empty (.cutY 13312 (.cutX 11776 .empty (.cutY 12800 (.cutX 12032 .empty (.cutY 12544 .full .empty)) .empty)) .empty)) .empty))) (.cutY 12288 (.cutX 14336 (.cutY 10240 .empty (.cutX 13312 (.cutY 11264 .empty (.cutX 12800 (.cutY 11776 .empty (.cutX 12544 (.cutY 12032 .empty .full) .empty)) .empty)) .empty)) .empty) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 .empty (.cutY 22528 (.cutX 19456 .empty (.cutY 21504 (.cutX 19968 .empty (.cutY 20992 (.cutX 20224 .empty (.cutY 20736 .full .empty)) .empty)) .empty)) .empty))) (.cutY 20480 (.cutX 22528 (.cutY 18432 .empty (.cutX 21504 (.cutY 19456 .empty (.cutX 20992 (.cutY 19968 .empty (.cutX 20736 (.cutY 20224 .empty .full) .empty)) .empty)) .empty)) .empty) .empty)) .empty) .empty)))

theorem metadata32 : 0<294935223 ∧ 47<128 ∧ 48<128 ∧ 0<4 ∧
    3855/4160=0 ∧ 3855%4160=3855 ∧ ∀ i, (leaves32 i).Valid 8 := by decide +kernel

theorem checked32 : gridTreeUnionCheck 32768 raw32 output32 cover32 source32 tree32 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits32 : gridUnionAreaUnits output32 = 262144 := by decide +kernel

noncomputable def phaseMass32 : ℝ := singlePhaseMass (294935223/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw32 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass32_eq : phaseMass32 = (294935223/1638400000000 : ℝ) := by
  unfold phaseMass32
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw32 output32 cover32 source32
    (gridTreeUnionCheck_sound 32768 raw32 output32 cover32 source32 tree32 checked32)
    _ (by norm_num) _,areaUnits32]
  norm_num

-- Frozen phase 65, atom 3821, type 0, source (46,49).
def leavesData33 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves33 (i : Fin 1) : DyadicLeaf := leavesData33.getD i.val ⟨0,0,0⟩
def raw33 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 46 49 leaves33 i
def outputData33 : Array GridBox := #[⟨11776,12032,12544,12800⟩,⟨12544,12800,11776,12032⟩,⟨19968,20224,20736,20992⟩,⟨20736,20992,19968,20224⟩]
def output33 (i : Fin 4) : GridBox := outputData33.getD i.val ⟨0,0,0,0⟩
def coverData33 : Array ℕ := #[0,1,3,2]
def sourceData33 : Array ℕ := #[0,1,3,2]
def cover33 (i : Fin 4) : Fin 4 := ⟨coverData33.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source33 (i : Fin 4) : Fin 4 := ⟨sourceData33.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree33 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 .empty (.cutY 14336 (.cutX 11264 .empty (.cutY 13312 (.cutX 11776 .empty (.cutY 12800 (.cutX 12032 (.cutY 12544 .empty .full) .empty) .empty)) .empty)) .empty))) (.cutY 12288 (.cutX 14336 (.cutY 10240 .empty (.cutX 13312 (.cutY 11264 .empty (.cutX 12800 (.cutY 11776 .empty (.cutX 12544 .empty (.cutY 12032 .full .empty))) .empty)) .empty)) .empty) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 .empty (.cutY 22528 (.cutX 19456 .empty (.cutY 21504 (.cutX 19968 .empty (.cutY 20992 (.cutX 20224 (.cutY 20736 .empty .full) .empty) .empty)) .empty)) .empty))) (.cutY 20480 (.cutX 22528 (.cutY 18432 .empty (.cutX 21504 (.cutY 19456 .empty (.cutX 20992 (.cutY 19968 .empty (.cutX 20736 .empty (.cutY 20224 .full .empty))) .empty)) .empty)) .empty) .empty)) .empty) .empty)))

theorem metadata33 : 0<294935223 ∧ 46<128 ∧ 49<128 ∧ 0<4 ∧
    3821/4160=0 ∧ 3821%4160=3821 ∧ ∀ i, (leaves33 i).Valid 8 := by decide +kernel

theorem checked33 : gridTreeUnionCheck 32768 raw33 output33 cover33 source33 tree33 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits33 : gridUnionAreaUnits output33 = 262144 := by decide +kernel

noncomputable def phaseMass33 : ℝ := singlePhaseMass (294935223/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw33 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass33_eq : phaseMass33 = (294935223/1638400000000 : ℝ) := by
  unfold phaseMass33
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw33 output33 cover33 source33
    (gridTreeUnionCheck_sound 32768 raw33 output33 cover33 source33 tree33 checked33)
    _ (by norm_num) _,areaUnits33]
  norm_num

-- Frozen phase 66, atom 3820, type 0, source (46,48).
def leavesData34 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves34 (i : Fin 1) : DyadicLeaf := leavesData34.getD i.val ⟨0,0,0⟩
def raw34 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 46 48 leaves34 i
def outputData34 : Array GridBox := #[⟨11776,12032,12288,12544⟩,⟨12288,12544,11776,12032⟩,⟨20224,20480,20736,20992⟩,⟨20736,20992,20224,20480⟩]
def output34 (i : Fin 4) : GridBox := outputData34.getD i.val ⟨0,0,0,0⟩
def coverData34 : Array ℕ := #[0,1,3,2]
def sourceData34 : Array ℕ := #[0,1,3,2]
def cover34 (i : Fin 4) : Fin 4 := ⟨coverData34.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source34 (i : Fin 4) : Fin 4 := ⟨sourceData34.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree34 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 .empty (.cutY 14336 (.cutX 11264 .empty (.cutY 13312 (.cutX 11776 .empty (.cutY 12800 (.cutX 12032 (.cutY 12544 .full .empty) .empty) .empty)) .empty)) .empty))) (.cutY 12288 (.cutX 14336 (.cutY 10240 .empty (.cutX 13312 (.cutY 11264 .empty (.cutX 12800 (.cutY 11776 .empty (.cutX 12544 (.cutY 12032 .full .empty) .empty)) .empty)) .empty)) .empty) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 .empty (.cutY 22528 (.cutX 19456 .empty (.cutY 21504 (.cutX 19968 .empty (.cutY 20992 (.cutX 20224 .empty (.cutY 20736 .empty .full)) .empty)) .empty)) .empty))) (.cutY 20480 (.cutX 22528 (.cutY 18432 .empty (.cutX 21504 (.cutY 19456 .empty (.cutX 20992 (.cutY 19968 .empty (.cutX 20736 .empty (.cutY 20224 .empty .full))) .empty)) .empty)) .empty) .empty)) .empty) .empty)))

theorem metadata34 : 0<294935223 ∧ 46<128 ∧ 48<128 ∧ 0<4 ∧
    3820/4160=0 ∧ 3820%4160=3820 ∧ ∀ i, (leaves34 i).Valid 8 := by decide +kernel

theorem checked34 : gridTreeUnionCheck 32768 raw34 output34 cover34 source34 tree34 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits34 : gridUnionAreaUnits output34 = 262144 := by decide +kernel

noncomputable def phaseMass34 : ℝ := singlePhaseMass (294935223/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw34 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass34_eq : phaseMass34 = (294935223/1638400000000 : ℝ) := by
  unfold phaseMass34
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw34 output34 cover34 source34
    (gridTreeUnionCheck_sound 32768 raw34 output34 cover34 source34 tree34 checked34)
    _ (by norm_num) _,areaUnits34]
  norm_num

-- Frozen phase 67, atom 3854, type 0, source (47,47).
def leavesData35 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves35 (i : Fin 1) : DyadicLeaf := leavesData35.getD i.val ⟨0,0,0⟩
def raw35 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 47 47 leaves35 i
def outputData35 : Array GridBox := #[⟨12032,12288,12032,12288⟩,⟨20480,20736,20480,20736⟩]
def output35 (i : Fin 2) : GridBox := outputData35.getD i.val ⟨0,0,0,0⟩
def coverData35 : Array ℕ := #[0,0,1,1]
def sourceData35 : Array ℕ := #[0,2]
def cover35 (i : Fin 4) : Fin 2 := ⟨coverData35.getD i.val 0 % 2,Nat.mod_lt _ (by decide)⟩
def source35 (i : Fin 2) : Fin 4 := ⟨sourceData35.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree35 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 .empty (.cutY 10240 .empty (.cutX 11264 .empty (.cutY 11264 .empty (.cutX 11776 .empty (.cutY 11776 .empty (.cutX 12032 .empty (.cutY 12032 .empty .full)))))))) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 (.cutY 22528 (.cutX 21504 (.cutY 21504 (.cutX 20992 (.cutY 20992 (.cutX 20736 (.cutY 20736 .full .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty))) .empty) .empty)))

theorem metadata35 : 0<255265193 ∧ 47<128 ∧ 47<128 ∧ 0<4 ∧
    3854/4160=0 ∧ 3854%4160=3854 ∧ ∀ i, (leaves35 i).Valid 8 := by decide +kernel

theorem checked35 : gridTreeUnionCheck 32768 raw35 output35 cover35 source35 tree35 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits35 : gridUnionAreaUnits output35 = 131072 := by decide +kernel

noncomputable def phaseMass35 : ℝ := singlePhaseMass (255265193/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw35 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass35_eq : phaseMass35 = (255265193/3276800000000 : ℝ) := by
  unfold phaseMass35
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw35 output35 cover35 source35
    (gridTreeUnionCheck_sound 32768 raw35 output35 cover35 source35 tree35 checked35)
    _ (by norm_num) _,areaUnits35]
  norm_num

-- Frozen phase 68, atom 3819, type 0, source (46,47).
def leavesData36 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves36 (i : Fin 1) : DyadicLeaf := leavesData36.getD i.val ⟨0,0,0⟩
def raw36 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 46 47 leaves36 i
def outputData36 : Array GridBox := #[⟨11776,12032,12032,12288⟩,⟨12032,12288,11776,12032⟩,⟨20480,20736,20736,20992⟩,⟨20736,20992,20480,20736⟩]
def output36 (i : Fin 4) : GridBox := outputData36.getD i.val ⟨0,0,0,0⟩
def coverData36 : Array ℕ := #[0,1,3,2]
def sourceData36 : Array ℕ := #[0,1,3,2]
def cover36 (i : Fin 4) : Fin 4 := ⟨coverData36.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source36 (i : Fin 4) : Fin 4 := ⟨sourceData36.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree36 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 .empty (.cutY 10240 .empty (.cutX 11264 .empty (.cutY 11264 .empty (.cutX 11776 .empty (.cutY 11776 .empty (.cutX 12032 (.cutY 12032 .empty .full) (.cutY 12032 .full .empty)))))))) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 (.cutY 22528 (.cutX 21504 (.cutY 21504 (.cutX 20992 (.cutY 20992 (.cutX 20736 (.cutY 20736 .empty .full) (.cutY 20736 .full .empty)) .empty) .empty) .empty) .empty) .empty) .empty))) .empty) .empty)))

theorem metadata36 : 0<255265193 ∧ 46<128 ∧ 47<128 ∧ 0<4 ∧
    3819/4160=0 ∧ 3819%4160=3819 ∧ ∀ i, (leaves36 i).Valid 8 := by decide +kernel

theorem checked36 : gridTreeUnionCheck 32768 raw36 output36 cover36 source36 tree36 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits36 : gridUnionAreaUnits output36 = 262144 := by decide +kernel

noncomputable def phaseMass36 : ℝ := singlePhaseMass (255265193/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw36 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass36_eq : phaseMass36 = (255265193/1638400000000 : ℝ) := by
  unfold phaseMass36
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw36 output36 cover36 source36
    (gridTreeUnionCheck_sound 32768 raw36 output36 cover36 source36 tree36 checked36)
    _ (by norm_num) _,areaUnits36]
  norm_num

-- Frozen phase 69, atom 3783, type 0, source (45,48).
def leavesData37 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves37 (i : Fin 1) : DyadicLeaf := leavesData37.getD i.val ⟨0,0,0⟩
def raw37 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 45 48 leaves37 i
def outputData37 : Array GridBox := #[⟨11520,11776,12288,12544⟩,⟨12288,12544,11520,11776⟩,⟨20224,20480,20992,21248⟩,⟨20992,21248,20224,20480⟩]
def output37 (i : Fin 4) : GridBox := outputData37.getD i.val ⟨0,0,0,0⟩
def coverData37 : Array ℕ := #[0,1,3,2]
def sourceData37 : Array ℕ := #[0,1,3,2]
def cover37 (i : Fin 4) : Fin 4 := ⟨coverData37.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source37 (i : Fin 4) : Fin 4 := ⟨sourceData37.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree37 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 .empty (.cutY 14336 (.cutX 11264 .empty (.cutY 13312 (.cutX 11776 (.cutY 12800 (.cutX 11520 .empty (.cutY 12544 .full .empty)) .empty) .empty) .empty)) .empty))) (.cutY 12288 (.cutX 14336 (.cutY 10240 .empty (.cutX 13312 (.cutY 11264 .empty (.cutX 12800 (.cutY 11776 (.cutX 12544 (.cutY 11520 .empty .full) .empty) .empty) .empty)) .empty)) .empty) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 .empty (.cutY 22528 (.cutX 19456 .empty (.cutY 21504 (.cutX 19968 .empty (.cutY 20992 .empty (.cutX 20224 .empty (.cutY 21248 .full .empty)))) .empty)) .empty))) (.cutY 20480 (.cutX 22528 (.cutY 18432 .empty (.cutX 21504 (.cutY 19456 .empty (.cutX 20992 .empty (.cutY 19968 .empty (.cutX 21248 (.cutY 20224 .empty .full) .empty)))) .empty)) .empty) .empty)) .empty) .empty)))

theorem metadata37 : 0<294935223 ∧ 45<128 ∧ 48<128 ∧ 0<4 ∧
    3783/4160=0 ∧ 3783%4160=3783 ∧ ∀ i, (leaves37 i).Valid 8 := by decide +kernel

theorem checked37 : gridTreeUnionCheck 32768 raw37 output37 cover37 source37 tree37 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits37 : gridUnionAreaUnits output37 = 262144 := by decide +kernel

noncomputable def phaseMass37 : ℝ := singlePhaseMass (294935223/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw37 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass37_eq : phaseMass37 = (294935223/1638400000000 : ℝ) := by
  unfold phaseMass37
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw37 output37 cover37 source37
    (gridTreeUnionCheck_sound 32768 raw37 output37 cover37 source37 tree37 checked37)
    _ (by norm_num) _,areaUnits37]
  norm_num

-- Frozen phase 70, atom 3782, type 0, source (45,47).
def leavesData38 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves38 (i : Fin 1) : DyadicLeaf := leavesData38.getD i.val ⟨0,0,0⟩
def raw38 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 45 47 leaves38 i
def outputData38 : Array GridBox := #[⟨11520,11776,12032,12288⟩,⟨12032,12288,11520,11776⟩,⟨20480,20736,20992,21248⟩,⟨20992,21248,20480,20736⟩]
def output38 (i : Fin 4) : GridBox := outputData38.getD i.val ⟨0,0,0,0⟩
def coverData38 : Array ℕ := #[0,1,3,2]
def sourceData38 : Array ℕ := #[0,1,3,2]
def cover38 (i : Fin 4) : Fin 4 := ⟨coverData38.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source38 (i : Fin 4) : Fin 4 := ⟨sourceData38.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree38 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 .empty (.cutY 10240 .empty (.cutX 11264 .empty (.cutY 11264 .empty (.cutX 11776 (.cutY 11776 .empty (.cutX 11520 .empty (.cutY 12032 .empty .full))) (.cutY 11776 (.cutX 12032 .empty (.cutY 11520 .empty .full)) .empty)))))) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 (.cutY 22528 (.cutX 21504 (.cutY 21504 (.cutX 20992 (.cutY 20992 .empty (.cutX 20736 (.cutY 21248 .full .empty) .empty)) (.cutY 20992 (.cutX 21248 (.cutY 20736 .full .empty) .empty) .empty)) .empty) .empty) .empty) .empty))) .empty) .empty)))

theorem metadata38 : 0<255265193 ∧ 45<128 ∧ 47<128 ∧ 0<4 ∧
    3782/4160=0 ∧ 3782%4160=3782 ∧ ∀ i, (leaves38 i).Valid 8 := by decide +kernel

theorem checked38 : gridTreeUnionCheck 32768 raw38 output38 cover38 source38 tree38 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits38 : gridUnionAreaUnits output38 = 262144 := by decide +kernel

noncomputable def phaseMass38 : ℝ := singlePhaseMass (255265193/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw38 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass38_eq : phaseMass38 = (255265193/1638400000000 : ℝ) := by
  unfold phaseMass38
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw38 output38 cover38 source38
    (gridTreeUnionCheck_sound 32768 raw38 output38 cover38 source38 tree38 checked38)
    _ (by norm_num) _,areaUnits38]
  norm_num

-- Frozen phase 71, atom 3818, type 0, source (46,46).
def leavesData39 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves39 (i : Fin 1) : DyadicLeaf := leavesData39.getD i.val ⟨0,0,0⟩
def raw39 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 46 46 leaves39 i
def outputData39 : Array GridBox := #[⟨11776,12032,11776,12032⟩,⟨20736,20992,20736,20992⟩]
def output39 (i : Fin 2) : GridBox := outputData39.getD i.val ⟨0,0,0,0⟩
def coverData39 : Array ℕ := #[0,0,1,1]
def sourceData39 : Array ℕ := #[0,2]
def cover39 (i : Fin 4) : Fin 2 := ⟨coverData39.getD i.val 0 % 2,Nat.mod_lt _ (by decide)⟩
def source39 (i : Fin 2) : Fin 4 := ⟨sourceData39.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree39 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 .empty (.cutY 10240 .empty (.cutX 11264 .empty (.cutY 11264 .empty (.cutX 11776 .empty (.cutY 11776 .empty (.cutX 12032 (.cutY 12032 .full .empty) .empty))))))) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 (.cutY 22528 (.cutX 21504 (.cutY 21504 (.cutX 20992 (.cutY 20992 (.cutX 20736 .empty (.cutY 20736 .empty .full)) .empty) .empty) .empty) .empty) .empty) .empty))) .empty) .empty)))

theorem metadata39 : 0<255265193 ∧ 46<128 ∧ 46<128 ∧ 0<4 ∧
    3818/4160=0 ∧ 3818%4160=3818 ∧ ∀ i, (leaves39 i).Valid 8 := by decide +kernel

theorem checked39 : gridTreeUnionCheck 32768 raw39 output39 cover39 source39 tree39 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits39 : gridUnionAreaUnits output39 = 131072 := by decide +kernel

noncomputable def phaseMass39 : ℝ := singlePhaseMass (255265193/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw39 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass39_eq : phaseMass39 = (255265193/3276800000000 : ℝ) := by
  unfold phaseMass39
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw39 output39 cover39 source39
    (gridTreeUnionCheck_sound 32768 raw39 output39 cover39 source39 tree39 checked39)
    _ (by norm_num) _,areaUnits39]
  norm_num

-- Frozen phase 72, atom 3781, type 0, source (45,46).
def leavesData40 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves40 (i : Fin 1) : DyadicLeaf := leavesData40.getD i.val ⟨0,0,0⟩
def raw40 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 45 46 leaves40 i
def outputData40 : Array GridBox := #[⟨11520,11776,11776,12032⟩,⟨11776,12032,11520,11776⟩,⟨20736,20992,20992,21248⟩,⟨20992,21248,20736,20992⟩]
def output40 (i : Fin 4) : GridBox := outputData40.getD i.val ⟨0,0,0,0⟩
def coverData40 : Array ℕ := #[0,1,3,2]
def sourceData40 : Array ℕ := #[0,1,3,2]
def cover40 (i : Fin 4) : Fin 4 := ⟨coverData40.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source40 (i : Fin 4) : Fin 4 := ⟨sourceData40.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree40 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 .empty (.cutY 10240 .empty (.cutX 11264 .empty (.cutY 11264 .empty (.cutX 11776 (.cutY 11776 .empty (.cutX 11520 .empty (.cutY 12032 .full .empty))) (.cutY 11776 (.cutX 12032 (.cutY 11520 .empty .full) .empty) .empty)))))) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 (.cutY 22528 (.cutX 21504 (.cutY 21504 (.cutX 20992 (.cutY 20992 .empty (.cutX 20736 .empty (.cutY 21248 .full .empty))) (.cutY 20992 (.cutX 21248 (.cutY 20736 .empty .full) .empty) .empty)) .empty) .empty) .empty) .empty))) .empty) .empty)))

theorem metadata40 : 0<255265193 ∧ 45<128 ∧ 46<128 ∧ 0<4 ∧
    3781/4160=0 ∧ 3781%4160=3781 ∧ ∀ i, (leaves40 i).Valid 8 := by decide +kernel

theorem checked40 : gridTreeUnionCheck 32768 raw40 output40 cover40 source40 tree40 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits40 : gridUnionAreaUnits output40 = 262144 := by decide +kernel

noncomputable def phaseMass40 : ℝ := singlePhaseMass (255265193/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw40 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass40_eq : phaseMass40 = (255265193/1638400000000 : ℝ) := by
  unfold phaseMass40
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw40 output40 cover40 source40
    (gridTreeUnionCheck_sound 32768 raw40 output40 cover40 source40 tree40 checked40)
    _ (by norm_num) _,areaUnits40]
  norm_num

-- Frozen phase 73, atom 3780, type 0, source (45,45).
def leavesData41 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves41 (i : Fin 1) : DyadicLeaf := leavesData41.getD i.val ⟨0,0,0⟩
def raw41 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 45 45 leaves41 i
def outputData41 : Array GridBox := #[⟨11520,11776,11520,11776⟩,⟨20992,21248,20992,21248⟩]
def output41 (i : Fin 2) : GridBox := outputData41.getD i.val ⟨0,0,0,0⟩
def coverData41 : Array ℕ := #[0,0,1,1]
def sourceData41 : Array ℕ := #[0,2]
def cover41 (i : Fin 4) : Fin 2 := ⟨coverData41.getD i.val 0 % 2,Nat.mod_lt _ (by decide)⟩
def source41 (i : Fin 2) : Fin 4 := ⟨sourceData41.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree41 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 .empty (.cutY 10240 .empty (.cutX 11264 .empty (.cutY 11264 .empty (.cutX 11776 (.cutY 11776 (.cutX 11520 .empty (.cutY 11520 .empty .full)) .empty) .empty))))) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 (.cutY 22528 (.cutX 21504 (.cutY 21504 (.cutX 20992 .empty (.cutY 20992 .empty (.cutX 21248 (.cutY 21248 .full .empty) .empty))) .empty) .empty) .empty) .empty))) .empty) .empty)))

theorem metadata41 : 0<255265193 ∧ 45<128 ∧ 45<128 ∧ 0<4 ∧
    3780/4160=0 ∧ 3780%4160=3780 ∧ ∀ i, (leaves41 i).Valid 8 := by decide +kernel

theorem checked41 : gridTreeUnionCheck 32768 raw41 output41 cover41 source41 tree41 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits41 : gridUnionAreaUnits output41 = 131072 := by decide +kernel

noncomputable def phaseMass41 : ℝ := singlePhaseMass (255265193/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw41 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass41_eq : phaseMass41 = (255265193/3276800000000 : ℝ) := by
  unfold phaseMass41
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw41 output41 cover41 source41
    (gridTreeUnionCheck_sound 32768 raw41 output41 cover41 source41 tree41 checked41)
    _ (by norm_num) _,areaUnits41]
  norm_num

-- Frozen phase 74, atom 3743, type 0, source (44,47).
def leavesData42 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves42 (i : Fin 1) : DyadicLeaf := leavesData42.getD i.val ⟨0,0,0⟩
def raw42 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 44 47 leaves42 i
def outputData42 : Array GridBox := #[⟨11264,11520,12032,12288⟩,⟨12032,12288,11264,11520⟩,⟨20480,20736,21248,21504⟩,⟨21248,21504,20480,20736⟩]
def output42 (i : Fin 4) : GridBox := outputData42.getD i.val ⟨0,0,0,0⟩
def coverData42 : Array ℕ := #[0,1,3,2]
def sourceData42 : Array ℕ := #[0,1,3,2]
def cover42 (i : Fin 4) : Fin 4 := ⟨coverData42.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source42 (i : Fin 4) : Fin 4 := ⟨sourceData42.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree42 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 .empty (.cutY 10240 .empty (.cutX 11264 .empty (.cutY 11264 .empty (.cutX 11776 (.cutY 11776 .empty (.cutX 11520 (.cutY 12032 .empty .full) .empty)) (.cutY 11776 (.cutX 12032 .empty (.cutY 11520 .full .empty)) .empty)))))) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 (.cutY 22528 (.cutX 21504 (.cutY 21504 (.cutX 20992 (.cutY 20992 .empty (.cutX 20736 (.cutY 21248 .empty .full) .empty)) (.cutY 20992 (.cutX 21248 .empty (.cutY 20736 .full .empty)) .empty)) .empty) .empty) .empty) .empty))) .empty) .empty)))

theorem metadata42 : 0<255265193 ∧ 44<128 ∧ 47<128 ∧ 0<4 ∧
    3743/4160=0 ∧ 3743%4160=3743 ∧ ∀ i, (leaves42 i).Valid 8 := by decide +kernel

theorem checked42 : gridTreeUnionCheck 32768 raw42 output42 cover42 source42 tree42 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits42 : gridUnionAreaUnits output42 = 262144 := by decide +kernel

noncomputable def phaseMass42 : ℝ := singlePhaseMass (255265193/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw42 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass42_eq : phaseMass42 = (255265193/1638400000000 : ℝ) := by
  unfold phaseMass42
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw42 output42 cover42 source42
    (gridTreeUnionCheck_sound 32768 raw42 output42 cover42 source42 tree42 checked42)
    _ (by norm_num) _,areaUnits42]
  norm_num

-- Frozen phase 75, atom 3742, type 0, source (44,46).
def leavesData43 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves43 (i : Fin 1) : DyadicLeaf := leavesData43.getD i.val ⟨0,0,0⟩
def raw43 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 44 46 leaves43 i
def outputData43 : Array GridBox := #[⟨11264,11520,11776,12032⟩,⟨11776,12032,11264,11520⟩,⟨20736,20992,21248,21504⟩,⟨21248,21504,20736,20992⟩]
def output43 (i : Fin 4) : GridBox := outputData43.getD i.val ⟨0,0,0,0⟩
def coverData43 : Array ℕ := #[0,1,3,2]
def sourceData43 : Array ℕ := #[0,1,3,2]
def cover43 (i : Fin 4) : Fin 4 := ⟨coverData43.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source43 (i : Fin 4) : Fin 4 := ⟨sourceData43.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree43 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 .empty (.cutY 10240 .empty (.cutX 11264 .empty (.cutY 11264 .empty (.cutX 11776 (.cutY 11776 .empty (.cutX 11520 (.cutY 12032 .full .empty) .empty)) (.cutY 11776 (.cutX 12032 (.cutY 11520 .full .empty) .empty) .empty)))))) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 (.cutY 22528 (.cutX 21504 (.cutY 21504 (.cutX 20992 (.cutY 20992 .empty (.cutX 20736 .empty (.cutY 21248 .empty .full))) (.cutY 20992 (.cutX 21248 .empty (.cutY 20736 .empty .full)) .empty)) .empty) .empty) .empty) .empty))) .empty) .empty)))

theorem metadata43 : 0<255265193 ∧ 44<128 ∧ 46<128 ∧ 0<4 ∧
    3742/4160=0 ∧ 3742%4160=3742 ∧ ∀ i, (leaves43 i).Valid 8 := by decide +kernel

theorem checked43 : gridTreeUnionCheck 32768 raw43 output43 cover43 source43 tree43 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits43 : gridUnionAreaUnits output43 = 262144 := by decide +kernel

noncomputable def phaseMass43 : ℝ := singlePhaseMass (255265193/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw43 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass43_eq : phaseMass43 = (255265193/1638400000000 : ℝ) := by
  unfold phaseMass43
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw43 output43 cover43 source43
    (gridTreeUnionCheck_sound 32768 raw43 output43 cover43 source43 tree43 checked43)
    _ (by norm_num) _,areaUnits43]
  norm_num

-- Frozen phase 76, atom 3741, type 0, source (44,45).
def leavesData44 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves44 (i : Fin 1) : DyadicLeaf := leavesData44.getD i.val ⟨0,0,0⟩
def raw44 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 44 45 leaves44 i
def outputData44 : Array GridBox := #[⟨11264,11520,11520,11776⟩,⟨11520,11776,11264,11520⟩,⟨20992,21248,21248,21504⟩,⟨21248,21504,20992,21248⟩]
def output44 (i : Fin 4) : GridBox := outputData44.getD i.val ⟨0,0,0,0⟩
def coverData44 : Array ℕ := #[0,1,3,2]
def sourceData44 : Array ℕ := #[0,1,3,2]
def cover44 (i : Fin 4) : Fin 4 := ⟨coverData44.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source44 (i : Fin 4) : Fin 4 := ⟨sourceData44.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree44 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 .empty (.cutY 10240 .empty (.cutX 11264 .empty (.cutY 11264 .empty (.cutX 11776 (.cutY 11776 (.cutX 11520 (.cutY 11520 .empty .full) (.cutY 11520 .full .empty)) .empty) .empty))))) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 (.cutY 22528 (.cutX 21504 (.cutY 21504 (.cutX 20992 .empty (.cutY 20992 .empty (.cutX 21248 (.cutY 21248 .empty .full) (.cutY 21248 .full .empty)))) .empty) .empty) .empty) .empty))) .empty) .empty)))

theorem metadata44 : 0<255265193 ∧ 44<128 ∧ 45<128 ∧ 0<4 ∧
    3741/4160=0 ∧ 3741%4160=3741 ∧ ∀ i, (leaves44 i).Valid 8 := by decide +kernel

theorem checked44 : gridTreeUnionCheck 32768 raw44 output44 cover44 source44 tree44 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits44 : gridUnionAreaUnits output44 = 262144 := by decide +kernel

noncomputable def phaseMass44 : ℝ := singlePhaseMass (255265193/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw44 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass44_eq : phaseMass44 = (255265193/1638400000000 : ℝ) := by
  unfold phaseMass44
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw44 output44 cover44 source44
    (gridTreeUnionCheck_sound 32768 raw44 output44 cover44 source44 tree44 checked44)
    _ (by norm_num) _,areaUnits44]
  norm_num

-- Frozen phase 77, atom 3740, type 0, source (44,44).
def leavesData45 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves45 (i : Fin 1) : DyadicLeaf := leavesData45.getD i.val ⟨0,0,0⟩
def raw45 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 44 44 leaves45 i
def outputData45 : Array GridBox := #[⟨11264,11520,11264,11520⟩,⟨21248,21504,21248,21504⟩]
def output45 (i : Fin 2) : GridBox := outputData45.getD i.val ⟨0,0,0,0⟩
def coverData45 : Array ℕ := #[0,0,1,1]
def sourceData45 : Array ℕ := #[0,2]
def cover45 (i : Fin 4) : Fin 2 := ⟨coverData45.getD i.val 0 % 2,Nat.mod_lt _ (by decide)⟩
def source45 (i : Fin 2) : Fin 4 := ⟨sourceData45.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree45 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 .empty (.cutY 10240 .empty (.cutX 11264 .empty (.cutY 11264 .empty (.cutX 11776 (.cutY 11776 (.cutX 11520 (.cutY 11520 .full .empty) .empty) .empty) .empty))))) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 (.cutY 22528 (.cutX 21504 (.cutY 21504 (.cutX 20992 .empty (.cutY 20992 .empty (.cutX 21248 .empty (.cutY 21248 .empty .full)))) .empty) .empty) .empty) .empty))) .empty) .empty)))

theorem metadata45 : 0<255265193 ∧ 44<128 ∧ 44<128 ∧ 0<4 ∧
    3740/4160=0 ∧ 3740%4160=3740 ∧ ∀ i, (leaves45 i).Valid 8 := by decide +kernel

theorem checked45 : gridTreeUnionCheck 32768 raw45 output45 cover45 source45 tree45 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits45 : gridUnionAreaUnits output45 = 131072 := by decide +kernel

noncomputable def phaseMass45 : ℝ := singlePhaseMass (255265193/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw45 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass45_eq : phaseMass45 = (255265193/3276800000000 : ℝ) := by
  unfold phaseMass45
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw45 output45 cover45 source45
    (gridTreeUnionCheck_sound 32768 raw45 output45 cover45 source45 tree45 checked45)
    _ (by norm_num) _,areaUnits45]
  norm_num

-- Frozen phase 78, atom 3701, type 0, source (43,46).
def leavesData46 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves46 (i : Fin 1) : DyadicLeaf := leavesData46.getD i.val ⟨0,0,0⟩
def raw46 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 43 46 leaves46 i
def outputData46 : Array GridBox := #[⟨11008,11264,11776,12032⟩,⟨11776,12032,11008,11264⟩,⟨20736,20992,21504,21760⟩,⟨21504,21760,20736,20992⟩]
def output46 (i : Fin 4) : GridBox := outputData46.getD i.val ⟨0,0,0,0⟩
def coverData46 : Array ℕ := #[0,1,3,2]
def sourceData46 : Array ℕ := #[0,1,3,2]
def cover46 (i : Fin 4) : Fin 4 := ⟨coverData46.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source46 (i : Fin 4) : Fin 4 := ⟨sourceData46.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree46 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 .empty (.cutY 10240 .empty (.cutX 11264 (.cutY 11264 .empty (.cutX 10752 .empty (.cutY 11776 .empty (.cutX 11008 .empty (.cutY 12032 .full .empty))))) (.cutY 11264 (.cutX 11776 .empty (.cutY 10752 .empty (.cutX 12032 (.cutY 11008 .empty .full) .empty))) .empty)))) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 (.cutY 22528 (.cutX 21504 (.cutY 21504 .empty (.cutX 20992 (.cutY 22016 (.cutX 20736 .empty (.cutY 21760 .full .empty)) .empty) .empty)) (.cutY 21504 (.cutX 22016 (.cutY 20992 (.cutX 21760 (.cutY 20736 .empty .full) .empty) .empty) .empty) .empty)) .empty) .empty))) .empty) .empty)))

theorem metadata46 : 0<255265193 ∧ 43<128 ∧ 46<128 ∧ 0<4 ∧
    3701/4160=0 ∧ 3701%4160=3701 ∧ ∀ i, (leaves46 i).Valid 8 := by decide +kernel

theorem checked46 : gridTreeUnionCheck 32768 raw46 output46 cover46 source46 tree46 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits46 : gridUnionAreaUnits output46 = 262144 := by decide +kernel

noncomputable def phaseMass46 : ℝ := singlePhaseMass (255265193/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw46 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass46_eq : phaseMass46 = (255265193/1638400000000 : ℝ) := by
  unfold phaseMass46
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw46 output46 cover46 source46
    (gridTreeUnionCheck_sound 32768 raw46 output46 cover46 source46 tree46 checked46)
    _ (by norm_num) _,areaUnits46]
  norm_num

-- Frozen phase 79, atom 3700, type 0, source (43,45).
def leavesData47 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves47 (i : Fin 1) : DyadicLeaf := leavesData47.getD i.val ⟨0,0,0⟩
def raw47 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 43 45 leaves47 i
def outputData47 : Array GridBox := #[⟨11008,11264,11520,11776⟩,⟨11520,11776,11008,11264⟩,⟨20992,21248,21504,21760⟩,⟨21504,21760,20992,21248⟩]
def output47 (i : Fin 4) : GridBox := outputData47.getD i.val ⟨0,0,0,0⟩
def coverData47 : Array ℕ := #[0,1,3,2]
def sourceData47 : Array ℕ := #[0,1,3,2]
def cover47 (i : Fin 4) : Fin 4 := ⟨coverData47.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source47 (i : Fin 4) : Fin 4 := ⟨sourceData47.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree47 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 .empty (.cutY 10240 .empty (.cutX 11264 (.cutY 11264 .empty (.cutX 10752 .empty (.cutY 11776 (.cutX 11008 .empty (.cutY 11520 .empty .full)) .empty))) (.cutY 11264 (.cutX 11776 (.cutY 10752 .empty (.cutX 11520 .empty (.cutY 11008 .empty .full))) .empty) .empty)))) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 (.cutY 22528 (.cutX 21504 (.cutY 21504 .empty (.cutX 20992 .empty (.cutY 22016 (.cutX 21248 (.cutY 21760 .full .empty) .empty) .empty))) (.cutY 21504 (.cutX 22016 (.cutY 20992 .empty (.cutX 21760 (.cutY 21248 .full .empty) .empty)) .empty) .empty)) .empty) .empty))) .empty) .empty)))

theorem metadata47 : 0<255265193 ∧ 43<128 ∧ 45<128 ∧ 0<4 ∧
    3700/4160=0 ∧ 3700%4160=3700 ∧ ∀ i, (leaves47 i).Valid 8 := by decide +kernel

theorem checked47 : gridTreeUnionCheck 32768 raw47 output47 cover47 source47 tree47 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits47 : gridUnionAreaUnits output47 = 262144 := by decide +kernel

noncomputable def phaseMass47 : ℝ := singlePhaseMass (255265193/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw47 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass47_eq : phaseMass47 = (255265193/1638400000000 : ℝ) := by
  unfold phaseMass47
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw47 output47 cover47 source47
    (gridTreeUnionCheck_sound 32768 raw47 output47 cover47 source47 tree47 checked47)
    _ (by norm_num) _,areaUnits47]
  norm_num

-- Frozen phase 80, atom 3699, type 0, source (43,44).
def leavesData48 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves48 (i : Fin 1) : DyadicLeaf := leavesData48.getD i.val ⟨0,0,0⟩
def raw48 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 43 44 leaves48 i
def outputData48 : Array GridBox := #[⟨11008,11264,11264,11520⟩,⟨11264,11520,11008,11264⟩,⟨21248,21504,21504,21760⟩,⟨21504,21760,21248,21504⟩]
def output48 (i : Fin 4) : GridBox := outputData48.getD i.val ⟨0,0,0,0⟩
def coverData48 : Array ℕ := #[0,1,3,2]
def sourceData48 : Array ℕ := #[0,1,3,2]
def cover48 (i : Fin 4) : Fin 4 := ⟨coverData48.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source48 (i : Fin 4) : Fin 4 := ⟨sourceData48.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree48 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 .empty (.cutY 10240 .empty (.cutX 11264 (.cutY 11264 .empty (.cutX 10752 .empty (.cutY 11776 (.cutX 11008 .empty (.cutY 11520 .full .empty)) .empty))) (.cutY 11264 (.cutX 11776 (.cutY 10752 .empty (.cutX 11520 (.cutY 11008 .empty .full) .empty)) .empty) .empty)))) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 (.cutY 22528 (.cutX 21504 (.cutY 21504 .empty (.cutX 20992 .empty (.cutY 22016 (.cutX 21248 .empty (.cutY 21760 .full .empty)) .empty))) (.cutY 21504 (.cutX 22016 (.cutY 20992 .empty (.cutX 21760 (.cutY 21248 .empty .full) .empty)) .empty) .empty)) .empty) .empty))) .empty) .empty)))

theorem metadata48 : 0<255265193 ∧ 43<128 ∧ 44<128 ∧ 0<4 ∧
    3699/4160=0 ∧ 3699%4160=3699 ∧ ∀ i, (leaves48 i).Valid 8 := by decide +kernel

theorem checked48 : gridTreeUnionCheck 32768 raw48 output48 cover48 source48 tree48 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits48 : gridUnionAreaUnits output48 = 262144 := by decide +kernel

noncomputable def phaseMass48 : ℝ := singlePhaseMass (255265193/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw48 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass48_eq : phaseMass48 = (255265193/1638400000000 : ℝ) := by
  unfold phaseMass48
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw48 output48 cover48 source48
    (gridTreeUnionCheck_sound 32768 raw48 output48 cover48 source48 tree48 checked48)
    _ (by norm_num) _,areaUnits48]
  norm_num

-- Frozen phase 81, atom 3698, type 0, source (43,43).
def leavesData49 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves49 (i : Fin 1) : DyadicLeaf := leavesData49.getD i.val ⟨0,0,0⟩
def raw49 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 43 43 leaves49 i
def outputData49 : Array GridBox := #[⟨11008,11264,11008,11264⟩,⟨21504,21760,21504,21760⟩]
def output49 (i : Fin 2) : GridBox := outputData49.getD i.val ⟨0,0,0,0⟩
def coverData49 : Array ℕ := #[0,0,1,1]
def sourceData49 : Array ℕ := #[0,2]
def cover49 (i : Fin 4) : Fin 2 := ⟨coverData49.getD i.val 0 % 2,Nat.mod_lt _ (by decide)⟩
def source49 (i : Fin 2) : Fin 4 := ⟨sourceData49.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree49 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 .empty (.cutY 10240 .empty (.cutX 11264 (.cutY 11264 (.cutX 10752 .empty (.cutY 10752 .empty (.cutX 11008 .empty (.cutY 11008 .empty .full)))) .empty) .empty))) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 (.cutY 22528 (.cutX 21504 .empty (.cutY 21504 .empty (.cutX 22016 (.cutY 22016 (.cutX 21760 (.cutY 21760 .full .empty) .empty) .empty) .empty))) .empty) .empty))) .empty) .empty)))

theorem metadata49 : 0<255265193 ∧ 43<128 ∧ 43<128 ∧ 0<4 ∧
    3698/4160=0 ∧ 3698%4160=3698 ∧ ∀ i, (leaves49 i).Valid 8 := by decide +kernel

theorem checked49 : gridTreeUnionCheck 32768 raw49 output49 cover49 source49 tree49 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits49 : gridUnionAreaUnits output49 = 131072 := by decide +kernel

noncomputable def phaseMass49 : ℝ := singlePhaseMass (255265193/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw49 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass49_eq : phaseMass49 = (255265193/3276800000000 : ℝ) := by
  unfold phaseMass49
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw49 output49 cover49 source49
    (gridTreeUnionCheck_sound 32768 raw49 output49 cover49 source49 tree49 checked49)
    _ (by norm_num) _,areaUnits49]
  norm_num

-- Frozen phase 82, atom 3657, type 0, source (42,45).
def leavesData50 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves50 (i : Fin 1) : DyadicLeaf := leavesData50.getD i.val ⟨0,0,0⟩
def raw50 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 42 45 leaves50 i
def outputData50 : Array GridBox := #[⟨10752,11008,11520,11776⟩,⟨11520,11776,10752,11008⟩,⟨20992,21248,21760,22016⟩,⟨21760,22016,20992,21248⟩]
def output50 (i : Fin 4) : GridBox := outputData50.getD i.val ⟨0,0,0,0⟩
def coverData50 : Array ℕ := #[0,1,3,2]
def sourceData50 : Array ℕ := #[0,1,3,2]
def cover50 (i : Fin 4) : Fin 4 := ⟨coverData50.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source50 (i : Fin 4) : Fin 4 := ⟨sourceData50.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree50 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 .empty (.cutY 10240 .empty (.cutX 11264 (.cutY 11264 .empty (.cutX 10752 .empty (.cutY 11776 (.cutX 11008 (.cutY 11520 .empty .full) .empty) .empty))) (.cutY 11264 (.cutX 11776 (.cutY 10752 .empty (.cutX 11520 .empty (.cutY 11008 .full .empty))) .empty) .empty)))) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 (.cutY 22528 (.cutX 21504 (.cutY 21504 .empty (.cutX 20992 .empty (.cutY 22016 (.cutX 21248 (.cutY 21760 .empty .full) .empty) .empty))) (.cutY 21504 (.cutX 22016 (.cutY 20992 .empty (.cutX 21760 .empty (.cutY 21248 .full .empty))) .empty) .empty)) .empty) .empty))) .empty) .empty)))

theorem metadata50 : 0<255265193 ∧ 42<128 ∧ 45<128 ∧ 0<4 ∧
    3657/4160=0 ∧ 3657%4160=3657 ∧ ∀ i, (leaves50 i).Valid 8 := by decide +kernel

theorem checked50 : gridTreeUnionCheck 32768 raw50 output50 cover50 source50 tree50 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits50 : gridUnionAreaUnits output50 = 262144 := by decide +kernel

noncomputable def phaseMass50 : ℝ := singlePhaseMass (255265193/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw50 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass50_eq : phaseMass50 = (255265193/1638400000000 : ℝ) := by
  unfold phaseMass50
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw50 output50 cover50 source50
    (gridTreeUnionCheck_sound 32768 raw50 output50 cover50 source50 tree50 checked50)
    _ (by norm_num) _,areaUnits50]
  norm_num

-- Frozen phase 83, atom 3656, type 0, source (42,44).
def leavesData51 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves51 (i : Fin 1) : DyadicLeaf := leavesData51.getD i.val ⟨0,0,0⟩
def raw51 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 42 44 leaves51 i
def outputData51 : Array GridBox := #[⟨10752,11008,11264,11520⟩,⟨11264,11520,10752,11008⟩,⟨21248,21504,21760,22016⟩,⟨21760,22016,21248,21504⟩]
def output51 (i : Fin 4) : GridBox := outputData51.getD i.val ⟨0,0,0,0⟩
def coverData51 : Array ℕ := #[0,1,3,2]
def sourceData51 : Array ℕ := #[0,1,3,2]
def cover51 (i : Fin 4) : Fin 4 := ⟨coverData51.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source51 (i : Fin 4) : Fin 4 := ⟨sourceData51.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree51 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 .empty (.cutY 10240 .empty (.cutX 11264 (.cutY 11264 .empty (.cutX 10752 .empty (.cutY 11776 (.cutX 11008 (.cutY 11520 .full .empty) .empty) .empty))) (.cutY 11264 (.cutX 11776 (.cutY 10752 .empty (.cutX 11520 (.cutY 11008 .full .empty) .empty)) .empty) .empty)))) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 (.cutY 22528 (.cutX 21504 (.cutY 21504 .empty (.cutX 20992 .empty (.cutY 22016 (.cutX 21248 .empty (.cutY 21760 .empty .full)) .empty))) (.cutY 21504 (.cutX 22016 (.cutY 20992 .empty (.cutX 21760 .empty (.cutY 21248 .empty .full))) .empty) .empty)) .empty) .empty))) .empty) .empty)))

theorem metadata51 : 0<255265193 ∧ 42<128 ∧ 44<128 ∧ 0<4 ∧
    3656/4160=0 ∧ 3656%4160=3656 ∧ ∀ i, (leaves51 i).Valid 8 := by decide +kernel

theorem checked51 : gridTreeUnionCheck 32768 raw51 output51 cover51 source51 tree51 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits51 : gridUnionAreaUnits output51 = 262144 := by decide +kernel

noncomputable def phaseMass51 : ℝ := singlePhaseMass (255265193/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw51 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass51_eq : phaseMass51 = (255265193/1638400000000 : ℝ) := by
  unfold phaseMass51
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw51 output51 cover51 source51
    (gridTreeUnionCheck_sound 32768 raw51 output51 cover51 source51 tree51 checked51)
    _ (by norm_num) _,areaUnits51]
  norm_num

-- Frozen phase 84, atom 3655, type 0, source (42,43).
def leavesData52 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves52 (i : Fin 1) : DyadicLeaf := leavesData52.getD i.val ⟨0,0,0⟩
def raw52 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 42 43 leaves52 i
def outputData52 : Array GridBox := #[⟨10752,11008,11008,11264⟩,⟨11008,11264,10752,11008⟩,⟨21504,21760,21760,22016⟩,⟨21760,22016,21504,21760⟩]
def output52 (i : Fin 4) : GridBox := outputData52.getD i.val ⟨0,0,0,0⟩
def coverData52 : Array ℕ := #[0,1,3,2]
def sourceData52 : Array ℕ := #[0,1,3,2]
def cover52 (i : Fin 4) : Fin 4 := ⟨coverData52.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source52 (i : Fin 4) : Fin 4 := ⟨sourceData52.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree52 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 .empty (.cutY 10240 .empty (.cutX 11264 (.cutY 11264 (.cutX 10752 .empty (.cutY 10752 .empty (.cutX 11008 (.cutY 11008 .empty .full) (.cutY 11008 .full .empty)))) .empty) .empty))) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 (.cutY 22528 (.cutX 21504 .empty (.cutY 21504 .empty (.cutX 22016 (.cutY 22016 (.cutX 21760 (.cutY 21760 .empty .full) (.cutY 21760 .full .empty)) .empty) .empty))) .empty) .empty))) .empty) .empty)))

theorem metadata52 : 0<255265193 ∧ 42<128 ∧ 43<128 ∧ 0<4 ∧
    3655/4160=0 ∧ 3655%4160=3655 ∧ ∀ i, (leaves52 i).Valid 8 := by decide +kernel

theorem checked52 : gridTreeUnionCheck 32768 raw52 output52 cover52 source52 tree52 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits52 : gridUnionAreaUnits output52 = 262144 := by decide +kernel

noncomputable def phaseMass52 : ℝ := singlePhaseMass (255265193/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw52 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass52_eq : phaseMass52 = (255265193/1638400000000 : ℝ) := by
  unfold phaseMass52
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw52 output52 cover52 source52
    (gridTreeUnionCheck_sound 32768 raw52 output52 cover52 source52 tree52 checked52)
    _ (by norm_num) _,areaUnits52]
  norm_num

-- Frozen phase 85, atom 3654, type 0, source (42,42).
def leavesData53 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves53 (i : Fin 1) : DyadicLeaf := leavesData53.getD i.val ⟨0,0,0⟩
def raw53 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 42 42 leaves53 i
def outputData53 : Array GridBox := #[⟨10752,11008,10752,11008⟩,⟨21760,22016,21760,22016⟩]
def output53 (i : Fin 2) : GridBox := outputData53.getD i.val ⟨0,0,0,0⟩
def coverData53 : Array ℕ := #[0,0,1,1]
def sourceData53 : Array ℕ := #[0,2]
def cover53 (i : Fin 4) : Fin 2 := ⟨coverData53.getD i.val 0 % 2,Nat.mod_lt _ (by decide)⟩
def source53 (i : Fin 2) : Fin 4 := ⟨sourceData53.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree53 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 .empty (.cutY 10240 .empty (.cutX 11264 (.cutY 11264 (.cutX 10752 .empty (.cutY 10752 .empty (.cutX 11008 (.cutY 11008 .full .empty) .empty))) .empty) .empty))) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 (.cutY 22528 (.cutX 21504 .empty (.cutY 21504 .empty (.cutX 22016 (.cutY 22016 (.cutX 21760 .empty (.cutY 21760 .empty .full)) .empty) .empty))) .empty) .empty))) .empty) .empty)))

theorem metadata53 : 0<255265193 ∧ 42<128 ∧ 42<128 ∧ 0<4 ∧
    3654/4160=0 ∧ 3654%4160=3654 ∧ ∀ i, (leaves53 i).Valid 8 := by decide +kernel

theorem checked53 : gridTreeUnionCheck 32768 raw53 output53 cover53 source53 tree53 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits53 : gridUnionAreaUnits output53 = 131072 := by decide +kernel

noncomputable def phaseMass53 : ℝ := singlePhaseMass (255265193/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw53 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass53_eq : phaseMass53 = (255265193/3276800000000 : ℝ) := by
  unfold phaseMass53
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw53 output53 cover53 source53
    (gridTreeUnionCheck_sound 32768 raw53 output53 cover53 source53 tree53 checked53)
    _ (by norm_num) _,areaUnits53]
  norm_num

-- Frozen phase 86, atom 3611, type 0, source (41,44).
def leavesData54 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves54 (i : Fin 1) : DyadicLeaf := leavesData54.getD i.val ⟨0,0,0⟩
def raw54 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 41 44 leaves54 i
def outputData54 : Array GridBox := #[⟨10496,10752,11264,11520⟩,⟨11264,11520,10496,10752⟩,⟨21248,21504,22016,22272⟩,⟨22016,22272,21248,21504⟩]
def output54 (i : Fin 4) : GridBox := outputData54.getD i.val ⟨0,0,0,0⟩
def coverData54 : Array ℕ := #[0,1,3,2]
def sourceData54 : Array ℕ := #[0,1,3,2]
def cover54 (i : Fin 4) : Fin 4 := ⟨coverData54.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source54 (i : Fin 4) : Fin 4 := ⟨sourceData54.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree54 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 .empty (.cutY 10240 .empty (.cutX 11264 (.cutY 11264 .empty (.cutX 10752 (.cutY 11776 (.cutX 10496 .empty (.cutY 11520 .full .empty)) .empty) .empty)) (.cutY 11264 (.cutX 11776 (.cutY 10752 (.cutX 11520 (.cutY 10496 .empty .full) .empty) .empty) .empty) .empty)))) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 (.cutY 22528 (.cutX 21504 (.cutY 21504 .empty (.cutX 20992 .empty (.cutY 22016 .empty (.cutX 21248 .empty (.cutY 22272 .full .empty))))) (.cutY 21504 (.cutX 22016 .empty (.cutY 20992 .empty (.cutX 22272 (.cutY 21248 .empty .full) .empty))) .empty)) .empty) .empty))) .empty) .empty)))

theorem metadata54 : 0<255265193 ∧ 41<128 ∧ 44<128 ∧ 0<4 ∧
    3611/4160=0 ∧ 3611%4160=3611 ∧ ∀ i, (leaves54 i).Valid 8 := by decide +kernel

theorem checked54 : gridTreeUnionCheck 32768 raw54 output54 cover54 source54 tree54 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits54 : gridUnionAreaUnits output54 = 262144 := by decide +kernel

noncomputable def phaseMass54 : ℝ := singlePhaseMass (255265193/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw54 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass54_eq : phaseMass54 = (255265193/1638400000000 : ℝ) := by
  unfold phaseMass54
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw54 output54 cover54 source54
    (gridTreeUnionCheck_sound 32768 raw54 output54 cover54 source54 tree54 checked54)
    _ (by norm_num) _,areaUnits54]
  norm_num

-- Frozen phase 87, atom 3610, type 0, source (41,43).
def leavesData55 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves55 (i : Fin 1) : DyadicLeaf := leavesData55.getD i.val ⟨0,0,0⟩
def raw55 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 41 43 leaves55 i
def outputData55 : Array GridBox := #[⟨10496,10752,11008,11264⟩,⟨11008,11264,10496,10752⟩,⟨21504,21760,22016,22272⟩,⟨22016,22272,21504,21760⟩]
def output55 (i : Fin 4) : GridBox := outputData55.getD i.val ⟨0,0,0,0⟩
def coverData55 : Array ℕ := #[0,1,3,2]
def sourceData55 : Array ℕ := #[0,1,3,2]
def cover55 (i : Fin 4) : Fin 4 := ⟨coverData55.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source55 (i : Fin 4) : Fin 4 := ⟨sourceData55.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree55 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 .empty (.cutY 10240 .empty (.cutX 11264 (.cutY 11264 (.cutX 10752 (.cutY 10752 .empty (.cutX 10496 .empty (.cutY 11008 .empty .full))) (.cutY 10752 (.cutX 11008 .empty (.cutY 10496 .empty .full)) .empty)) .empty) .empty))) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 (.cutY 22528 (.cutX 21504 .empty (.cutY 21504 .empty (.cutX 22016 (.cutY 22016 .empty (.cutX 21760 (.cutY 22272 .full .empty) .empty)) (.cutY 22016 (.cutX 22272 (.cutY 21760 .full .empty) .empty) .empty)))) .empty) .empty))) .empty) .empty)))

theorem metadata55 : 0<255265193 ∧ 41<128 ∧ 43<128 ∧ 0<4 ∧
    3610/4160=0 ∧ 3610%4160=3610 ∧ ∀ i, (leaves55 i).Valid 8 := by decide +kernel

theorem checked55 : gridTreeUnionCheck 32768 raw55 output55 cover55 source55 tree55 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits55 : gridUnionAreaUnits output55 = 262144 := by decide +kernel

noncomputable def phaseMass55 : ℝ := singlePhaseMass (255265193/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw55 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass55_eq : phaseMass55 = (255265193/1638400000000 : ℝ) := by
  unfold phaseMass55
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw55 output55 cover55 source55
    (gridTreeUnionCheck_sound 32768 raw55 output55 cover55 source55 tree55 checked55)
    _ (by norm_num) _,areaUnits55]
  norm_num

-- Frozen phase 88, atom 3609, type 0, source (41,42).
def leavesData56 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves56 (i : Fin 1) : DyadicLeaf := leavesData56.getD i.val ⟨0,0,0⟩
def raw56 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 41 42 leaves56 i
def outputData56 : Array GridBox := #[⟨10496,10752,10752,11008⟩,⟨10752,11008,10496,10752⟩,⟨21760,22016,22016,22272⟩,⟨22016,22272,21760,22016⟩]
def output56 (i : Fin 4) : GridBox := outputData56.getD i.val ⟨0,0,0,0⟩
def coverData56 : Array ℕ := #[0,1,3,2]
def sourceData56 : Array ℕ := #[0,1,3,2]
def cover56 (i : Fin 4) : Fin 4 := ⟨coverData56.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source56 (i : Fin 4) : Fin 4 := ⟨sourceData56.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree56 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 .empty (.cutY 10240 .empty (.cutX 11264 (.cutY 11264 (.cutX 10752 (.cutY 10752 .empty (.cutX 10496 .empty (.cutY 11008 .full .empty))) (.cutY 10752 (.cutX 11008 (.cutY 10496 .empty .full) .empty) .empty)) .empty) .empty))) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 (.cutY 22528 (.cutX 21504 .empty (.cutY 21504 .empty (.cutX 22016 (.cutY 22016 .empty (.cutX 21760 .empty (.cutY 22272 .full .empty))) (.cutY 22016 (.cutX 22272 (.cutY 21760 .empty .full) .empty) .empty)))) .empty) .empty))) .empty) .empty)))

theorem metadata56 : 0<255265193 ∧ 41<128 ∧ 42<128 ∧ 0<4 ∧
    3609/4160=0 ∧ 3609%4160=3609 ∧ ∀ i, (leaves56 i).Valid 8 := by decide +kernel

theorem checked56 : gridTreeUnionCheck 32768 raw56 output56 cover56 source56 tree56 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits56 : gridUnionAreaUnits output56 = 262144 := by decide +kernel

noncomputable def phaseMass56 : ℝ := singlePhaseMass (255265193/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw56 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass56_eq : phaseMass56 = (255265193/1638400000000 : ℝ) := by
  unfold phaseMass56
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw56 output56 cover56 source56
    (gridTreeUnionCheck_sound 32768 raw56 output56 cover56 source56 tree56 checked56)
    _ (by norm_num) _,areaUnits56]
  norm_num

-- Frozen phase 89, atom 3608, type 0, source (41,41).
def leavesData57 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves57 (i : Fin 1) : DyadicLeaf := leavesData57.getD i.val ⟨0,0,0⟩
def raw57 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 41 41 leaves57 i
def outputData57 : Array GridBox := #[⟨10496,10752,10496,10752⟩,⟨22016,22272,22016,22272⟩]
def output57 (i : Fin 2) : GridBox := outputData57.getD i.val ⟨0,0,0,0⟩
def coverData57 : Array ℕ := #[0,0,1,1]
def sourceData57 : Array ℕ := #[0,2]
def cover57 (i : Fin 4) : Fin 2 := ⟨coverData57.getD i.val 0 % 2,Nat.mod_lt _ (by decide)⟩
def source57 (i : Fin 2) : Fin 4 := ⟨sourceData57.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree57 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 .empty (.cutY 10240 .empty (.cutX 11264 (.cutY 11264 (.cutX 10752 (.cutY 10752 (.cutX 10496 .empty (.cutY 10496 .empty .full)) .empty) .empty) .empty) .empty))) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 (.cutY 22528 (.cutX 21504 .empty (.cutY 21504 .empty (.cutX 22016 .empty (.cutY 22016 .empty (.cutX 22272 (.cutY 22272 .full .empty) .empty))))) .empty) .empty))) .empty) .empty)))

theorem metadata57 : 0<255265193 ∧ 41<128 ∧ 41<128 ∧ 0<4 ∧
    3608/4160=0 ∧ 3608%4160=3608 ∧ ∀ i, (leaves57 i).Valid 8 := by decide +kernel

theorem checked57 : gridTreeUnionCheck 32768 raw57 output57 cover57 source57 tree57 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits57 : gridUnionAreaUnits output57 = 131072 := by decide +kernel

noncomputable def phaseMass57 : ℝ := singlePhaseMass (255265193/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw57 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass57_eq : phaseMass57 = (255265193/3276800000000 : ℝ) := by
  unfold phaseMass57
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw57 output57 cover57 source57
    (gridTreeUnionCheck_sound 32768 raw57 output57 cover57 source57 tree57 checked57)
    _ (by norm_num) _,areaUnits57]
  norm_num

-- Frozen phase 90, atom 3563, type 0, source (40,43).
def leavesData58 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves58 (i : Fin 1) : DyadicLeaf := leavesData58.getD i.val ⟨0,0,0⟩
def raw58 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 40 43 leaves58 i
def outputData58 : Array GridBox := #[⟨10240,10496,11008,11264⟩,⟨11008,11264,10240,10496⟩,⟨21504,21760,22272,22528⟩,⟨22272,22528,21504,21760⟩]
def output58 (i : Fin 4) : GridBox := outputData58.getD i.val ⟨0,0,0,0⟩
def coverData58 : Array ℕ := #[0,1,3,2]
def sourceData58 : Array ℕ := #[0,1,3,2]
def cover58 (i : Fin 4) : Fin 4 := ⟨coverData58.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source58 (i : Fin 4) : Fin 4 := ⟨sourceData58.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree58 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 .empty (.cutY 10240 .empty (.cutX 11264 (.cutY 11264 (.cutX 10752 (.cutY 10752 .empty (.cutX 10496 (.cutY 11008 .empty .full) .empty)) (.cutY 10752 (.cutX 11008 .empty (.cutY 10496 .full .empty)) .empty)) .empty) .empty))) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 (.cutY 22528 (.cutX 21504 .empty (.cutY 21504 .empty (.cutX 22016 (.cutY 22016 .empty (.cutX 21760 (.cutY 22272 .empty .full) .empty)) (.cutY 22016 (.cutX 22272 .empty (.cutY 21760 .full .empty)) .empty)))) .empty) .empty))) .empty) .empty)))

theorem metadata58 : 0<255265193 ∧ 40<128 ∧ 43<128 ∧ 0<4 ∧
    3563/4160=0 ∧ 3563%4160=3563 ∧ ∀ i, (leaves58 i).Valid 8 := by decide +kernel

theorem checked58 : gridTreeUnionCheck 32768 raw58 output58 cover58 source58 tree58 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits58 : gridUnionAreaUnits output58 = 262144 := by decide +kernel

noncomputable def phaseMass58 : ℝ := singlePhaseMass (255265193/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw58 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass58_eq : phaseMass58 = (255265193/1638400000000 : ℝ) := by
  unfold phaseMass58
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw58 output58 cover58 source58
    (gridTreeUnionCheck_sound 32768 raw58 output58 cover58 source58 tree58 checked58)
    _ (by norm_num) _,areaUnits58]
  norm_num

-- Frozen phase 91, atom 3562, type 0, source (40,42).
def leavesData59 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves59 (i : Fin 1) : DyadicLeaf := leavesData59.getD i.val ⟨0,0,0⟩
def raw59 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 40 42 leaves59 i
def outputData59 : Array GridBox := #[⟨10240,10496,10752,11008⟩,⟨10752,11008,10240,10496⟩,⟨21760,22016,22272,22528⟩,⟨22272,22528,21760,22016⟩]
def output59 (i : Fin 4) : GridBox := outputData59.getD i.val ⟨0,0,0,0⟩
def coverData59 : Array ℕ := #[0,1,3,2]
def sourceData59 : Array ℕ := #[0,1,3,2]
def cover59 (i : Fin 4) : Fin 4 := ⟨coverData59.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source59 (i : Fin 4) : Fin 4 := ⟨sourceData59.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree59 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 .empty (.cutY 10240 .empty (.cutX 11264 (.cutY 11264 (.cutX 10752 (.cutY 10752 .empty (.cutX 10496 (.cutY 11008 .full .empty) .empty)) (.cutY 10752 (.cutX 11008 (.cutY 10496 .full .empty) .empty) .empty)) .empty) .empty))) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 (.cutY 22528 (.cutX 21504 .empty (.cutY 21504 .empty (.cutX 22016 (.cutY 22016 .empty (.cutX 21760 .empty (.cutY 22272 .empty .full))) (.cutY 22016 (.cutX 22272 .empty (.cutY 21760 .empty .full)) .empty)))) .empty) .empty))) .empty) .empty)))

theorem metadata59 : 0<255265193 ∧ 40<128 ∧ 42<128 ∧ 0<4 ∧
    3562/4160=0 ∧ 3562%4160=3562 ∧ ∀ i, (leaves59 i).Valid 8 := by decide +kernel

theorem checked59 : gridTreeUnionCheck 32768 raw59 output59 cover59 source59 tree59 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits59 : gridUnionAreaUnits output59 = 262144 := by decide +kernel

noncomputable def phaseMass59 : ℝ := singlePhaseMass (255265193/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw59 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass59_eq : phaseMass59 = (255265193/1638400000000 : ℝ) := by
  unfold phaseMass59
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw59 output59 cover59 source59
    (gridTreeUnionCheck_sound 32768 raw59 output59 cover59 source59 tree59 checked59)
    _ (by norm_num) _,areaUnits59]
  norm_num

-- Frozen phase 92, atom 3561, type 0, source (40,41).
def leavesData60 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves60 (i : Fin 1) : DyadicLeaf := leavesData60.getD i.val ⟨0,0,0⟩
def raw60 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 40 41 leaves60 i
def outputData60 : Array GridBox := #[⟨10240,10496,10496,10752⟩,⟨10496,10752,10240,10496⟩,⟨22016,22272,22272,22528⟩,⟨22272,22528,22016,22272⟩]
def output60 (i : Fin 4) : GridBox := outputData60.getD i.val ⟨0,0,0,0⟩
def coverData60 : Array ℕ := #[0,1,3,2]
def sourceData60 : Array ℕ := #[0,1,3,2]
def cover60 (i : Fin 4) : Fin 4 := ⟨coverData60.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source60 (i : Fin 4) : Fin 4 := ⟨sourceData60.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree60 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 .empty (.cutY 10240 .empty (.cutX 11264 (.cutY 11264 (.cutX 10752 (.cutY 10752 (.cutX 10496 (.cutY 10496 .empty .full) (.cutY 10496 .full .empty)) .empty) .empty) .empty) .empty))) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 (.cutY 22528 (.cutX 21504 .empty (.cutY 21504 .empty (.cutX 22016 .empty (.cutY 22016 .empty (.cutX 22272 (.cutY 22272 .empty .full) (.cutY 22272 .full .empty)))))) .empty) .empty))) .empty) .empty)))

theorem metadata60 : 0<255265193 ∧ 40<128 ∧ 41<128 ∧ 0<4 ∧
    3561/4160=0 ∧ 3561%4160=3561 ∧ ∀ i, (leaves60 i).Valid 8 := by decide +kernel

theorem checked60 : gridTreeUnionCheck 32768 raw60 output60 cover60 source60 tree60 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits60 : gridUnionAreaUnits output60 = 262144 := by decide +kernel

noncomputable def phaseMass60 : ℝ := singlePhaseMass (255265193/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw60 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass60_eq : phaseMass60 = (255265193/1638400000000 : ℝ) := by
  unfold phaseMass60
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw60 output60 cover60 source60
    (gridTreeUnionCheck_sound 32768 raw60 output60 cover60 source60 tree60 checked60)
    _ (by norm_num) _,areaUnits60]
  norm_num

-- Frozen phase 93, atom 3560, type 0, source (40,40).
def leavesData61 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves61 (i : Fin 1) : DyadicLeaf := leavesData61.getD i.val ⟨0,0,0⟩
def raw61 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 40 40 leaves61 i
def outputData61 : Array GridBox := #[⟨10240,10496,10240,10496⟩,⟨22272,22528,22272,22528⟩]
def output61 (i : Fin 2) : GridBox := outputData61.getD i.val ⟨0,0,0,0⟩
def coverData61 : Array ℕ := #[0,0,1,1]
def sourceData61 : Array ℕ := #[0,2]
def cover61 (i : Fin 4) : Fin 2 := ⟨coverData61.getD i.val 0 % 2,Nat.mod_lt _ (by decide)⟩
def source61 (i : Fin 2) : Fin 4 := ⟨sourceData61.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree61 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 .empty (.cutY 10240 .empty (.cutX 11264 (.cutY 11264 (.cutX 10752 (.cutY 10752 (.cutX 10496 (.cutY 10496 .full .empty) .empty) .empty) .empty) .empty) .empty))) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 (.cutY 22528 (.cutX 21504 .empty (.cutY 21504 .empty (.cutX 22016 .empty (.cutY 22016 .empty (.cutX 22272 .empty (.cutY 22272 .empty .full)))))) .empty) .empty))) .empty) .empty)))

theorem metadata61 : 0<255265193 ∧ 40<128 ∧ 40<128 ∧ 0<4 ∧
    3560/4160=0 ∧ 3560%4160=3560 ∧ ∀ i, (leaves61 i).Valid 8 := by decide +kernel

theorem checked61 : gridTreeUnionCheck 32768 raw61 output61 cover61 source61 tree61 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits61 : gridUnionAreaUnits output61 = 131072 := by decide +kernel

noncomputable def phaseMass61 : ℝ := singlePhaseMass (255265193/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw61 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass61_eq : phaseMass61 = (255265193/3276800000000 : ℝ) := by
  unfold phaseMass61
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw61 output61 cover61 source61
    (gridTreeUnionCheck_sound 32768 raw61 output61 cover61 source61 tree61 checked61)
    _ (by norm_num) _,areaUnits61]
  norm_num

-- Frozen phase 94, atom 3513, type 0, source (39,42).
def leavesData62 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves62 (i : Fin 1) : DyadicLeaf := leavesData62.getD i.val ⟨0,0,0⟩
def raw62 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 39 42 leaves62 i
def outputData62 : Array GridBox := #[⟨9984,10240,10752,11008⟩,⟨10752,11008,9984,10240⟩,⟨21760,22016,22528,22784⟩,⟨22528,22784,21760,22016⟩]
def output62 (i : Fin 4) : GridBox := outputData62.getD i.val ⟨0,0,0,0⟩
def coverData62 : Array ℕ := #[0,1,3,2]
def sourceData62 : Array ℕ := #[0,1,3,2]
def cover62 (i : Fin 4) : Fin 4 := ⟨coverData62.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source62 (i : Fin 4) : Fin 4 := ⟨sourceData62.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree62 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 (.cutY 10240 .empty (.cutX 9216 .empty (.cutY 11264 (.cutX 9728 .empty (.cutY 10752 .empty (.cutX 9984 .empty (.cutY 11008 .full .empty)))) .empty))) (.cutY 10240 (.cutX 11264 (.cutY 9216 .empty (.cutX 10752 .empty (.cutY 9728 .empty (.cutX 11008 (.cutY 9984 .empty .full) .empty)))) .empty) .empty)) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 (.cutY 22528 .empty (.cutX 21504 .empty (.cutY 23552 (.cutX 22016 (.cutY 23040 (.cutX 21760 .empty (.cutY 22784 .full .empty)) .empty) .empty) .empty))) (.cutY 22528 (.cutX 23552 (.cutY 21504 .empty (.cutX 23040 (.cutY 22016 (.cutX 22784 (.cutY 21760 .empty .full) .empty) .empty) .empty)) .empty) .empty)))) .empty) .empty)))

theorem metadata62 : 0<300212497 ∧ 39<128 ∧ 42<128 ∧ 0<4 ∧
    3513/4160=0 ∧ 3513%4160=3513 ∧ ∀ i, (leaves62 i).Valid 8 := by decide +kernel

theorem checked62 : gridTreeUnionCheck 32768 raw62 output62 cover62 source62 tree62 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits62 : gridUnionAreaUnits output62 = 262144 := by decide +kernel

noncomputable def phaseMass62 : ℝ := singlePhaseMass (300212497/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw62 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass62_eq : phaseMass62 = (300212497/1638400000000 : ℝ) := by
  unfold phaseMass62
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw62 output62 cover62 source62
    (gridTreeUnionCheck_sound 32768 raw62 output62 cover62 source62 tree62 checked62)
    _ (by norm_num) _,areaUnits62]
  norm_num

-- Frozen phase 95, atom 3512, type 0, source (39,41).
def leavesData63 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves63 (i : Fin 1) : DyadicLeaf := leavesData63.getD i.val ⟨0,0,0⟩
def raw63 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 39 41 leaves63 i
def outputData63 : Array GridBox := #[⟨9984,10240,10496,10752⟩,⟨10496,10752,9984,10240⟩,⟨22016,22272,22528,22784⟩,⟨22528,22784,22016,22272⟩]
def output63 (i : Fin 4) : GridBox := outputData63.getD i.val ⟨0,0,0,0⟩
def coverData63 : Array ℕ := #[0,1,3,2]
def sourceData63 : Array ℕ := #[0,1,3,2]
def cover63 (i : Fin 4) : Fin 4 := ⟨coverData63.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source63 (i : Fin 4) : Fin 4 := ⟨sourceData63.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree63 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 (.cutY 10240 .empty (.cutX 9216 .empty (.cutY 11264 (.cutX 9728 .empty (.cutY 10752 (.cutX 9984 .empty (.cutY 10496 .empty .full)) .empty)) .empty))) (.cutY 10240 (.cutX 11264 (.cutY 9216 .empty (.cutX 10752 (.cutY 9728 .empty (.cutX 10496 .empty (.cutY 9984 .empty .full))) .empty)) .empty) .empty)) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 (.cutY 22528 .empty (.cutX 21504 .empty (.cutY 23552 (.cutX 22016 .empty (.cutY 23040 (.cutX 22272 (.cutY 22784 .full .empty) .empty) .empty)) .empty))) (.cutY 22528 (.cutX 23552 (.cutY 21504 .empty (.cutX 23040 (.cutY 22016 .empty (.cutX 22784 (.cutY 22272 .full .empty) .empty)) .empty)) .empty) .empty)))) .empty) .empty)))

theorem metadata63 : 0<300212497 ∧ 39<128 ∧ 41<128 ∧ 0<4 ∧
    3512/4160=0 ∧ 3512%4160=3512 ∧ ∀ i, (leaves63 i).Valid 8 := by decide +kernel

theorem checked63 : gridTreeUnionCheck 32768 raw63 output63 cover63 source63 tree63 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits63 : gridUnionAreaUnits output63 = 262144 := by decide +kernel

noncomputable def phaseMass63 : ℝ := singlePhaseMass (300212497/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw63 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass63_eq : phaseMass63 = (300212497/1638400000000 : ℝ) := by
  unfold phaseMass63
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw63 output63 cover63 source63
    (gridTreeUnionCheck_sound 32768 raw63 output63 cover63 source63 tree63 checked63)
    _ (by norm_num) _,areaUnits63]
  norm_num

-- Frozen phase 96, atom 3511, type 0, source (39,40).
def leavesData64 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves64 (i : Fin 1) : DyadicLeaf := leavesData64.getD i.val ⟨0,0,0⟩
def raw64 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 39 40 leaves64 i
def outputData64 : Array GridBox := #[⟨9984,10240,10240,10496⟩,⟨10240,10496,9984,10240⟩,⟨22272,22528,22528,22784⟩,⟨22528,22784,22272,22528⟩]
def output64 (i : Fin 4) : GridBox := outputData64.getD i.val ⟨0,0,0,0⟩
def coverData64 : Array ℕ := #[0,1,3,2]
def sourceData64 : Array ℕ := #[0,1,3,2]
def cover64 (i : Fin 4) : Fin 4 := ⟨coverData64.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source64 (i : Fin 4) : Fin 4 := ⟨sourceData64.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree64 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 (.cutY 10240 .empty (.cutX 9216 .empty (.cutY 11264 (.cutX 9728 .empty (.cutY 10752 (.cutX 9984 .empty (.cutY 10496 .full .empty)) .empty)) .empty))) (.cutY 10240 (.cutX 11264 (.cutY 9216 .empty (.cutX 10752 (.cutY 9728 .empty (.cutX 10496 (.cutY 9984 .empty .full) .empty)) .empty)) .empty) .empty)) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 (.cutY 22528 .empty (.cutX 21504 .empty (.cutY 23552 (.cutX 22016 .empty (.cutY 23040 (.cutX 22272 .empty (.cutY 22784 .full .empty)) .empty)) .empty))) (.cutY 22528 (.cutX 23552 (.cutY 21504 .empty (.cutX 23040 (.cutY 22016 .empty (.cutX 22784 (.cutY 22272 .empty .full) .empty)) .empty)) .empty) .empty)))) .empty) .empty)))

theorem metadata64 : 0<300212497 ∧ 39<128 ∧ 40<128 ∧ 0<4 ∧
    3511/4160=0 ∧ 3511%4160=3511 ∧ ∀ i, (leaves64 i).Valid 8 := by decide +kernel

theorem checked64 : gridTreeUnionCheck 32768 raw64 output64 cover64 source64 tree64 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits64 : gridUnionAreaUnits output64 = 262144 := by decide +kernel

noncomputable def phaseMass64 : ℝ := singlePhaseMass (300212497/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw64 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass64_eq : phaseMass64 = (300212497/1638400000000 : ℝ) := by
  unfold phaseMass64
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw64 output64 cover64 source64
    (gridTreeUnionCheck_sound 32768 raw64 output64 cover64 source64 tree64 checked64)
    _ (by norm_num) _,areaUnits64]
  norm_num

-- Frozen phase 97, atom 3461, type 0, source (38,41).
def leavesData65 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves65 (i : Fin 1) : DyadicLeaf := leavesData65.getD i.val ⟨0,0,0⟩
def raw65 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 38 41 leaves65 i
def outputData65 : Array GridBox := #[⟨9728,9984,10496,10752⟩,⟨10496,10752,9728,9984⟩,⟨22016,22272,22784,23040⟩,⟨22784,23040,22016,22272⟩]
def output65 (i : Fin 4) : GridBox := outputData65.getD i.val ⟨0,0,0,0⟩
def coverData65 : Array ℕ := #[0,1,3,2]
def sourceData65 : Array ℕ := #[0,1,3,2]
def cover65 (i : Fin 4) : Fin 4 := ⟨coverData65.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source65 (i : Fin 4) : Fin 4 := ⟨sourceData65.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree65 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 (.cutY 10240 .empty (.cutX 9216 .empty (.cutY 11264 (.cutX 9728 .empty (.cutY 10752 (.cutX 9984 (.cutY 10496 .empty .full) .empty) .empty)) .empty))) (.cutY 10240 (.cutX 11264 (.cutY 9216 .empty (.cutX 10752 (.cutY 9728 .empty (.cutX 10496 .empty (.cutY 9984 .full .empty))) .empty)) .empty) .empty)) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 (.cutY 22528 .empty (.cutX 21504 .empty (.cutY 23552 (.cutX 22016 .empty (.cutY 23040 (.cutX 22272 (.cutY 22784 .empty .full) .empty) .empty)) .empty))) (.cutY 22528 (.cutX 23552 (.cutY 21504 .empty (.cutX 23040 (.cutY 22016 .empty (.cutX 22784 .empty (.cutY 22272 .full .empty))) .empty)) .empty) .empty)))) .empty) .empty)))

theorem metadata65 : 0<300212497 ∧ 38<128 ∧ 41<128 ∧ 0<4 ∧
    3461/4160=0 ∧ 3461%4160=3461 ∧ ∀ i, (leaves65 i).Valid 8 := by decide +kernel

theorem checked65 : gridTreeUnionCheck 32768 raw65 output65 cover65 source65 tree65 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits65 : gridUnionAreaUnits output65 = 262144 := by decide +kernel

noncomputable def phaseMass65 : ℝ := singlePhaseMass (300212497/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw65 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass65_eq : phaseMass65 = (300212497/1638400000000 : ℝ) := by
  unfold phaseMass65
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw65 output65 cover65 source65
    (gridTreeUnionCheck_sound 32768 raw65 output65 cover65 source65 tree65 checked65)
    _ (by norm_num) _,areaUnits65]
  norm_num

-- Frozen phase 98, atom 3460, type 0, source (38,40).
def leavesData66 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves66 (i : Fin 1) : DyadicLeaf := leavesData66.getD i.val ⟨0,0,0⟩
def raw66 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 38 40 leaves66 i
def outputData66 : Array GridBox := #[⟨9728,9984,10240,10496⟩,⟨10240,10496,9728,9984⟩,⟨22272,22528,22784,23040⟩,⟨22784,23040,22272,22528⟩]
def output66 (i : Fin 4) : GridBox := outputData66.getD i.val ⟨0,0,0,0⟩
def coverData66 : Array ℕ := #[0,1,3,2]
def sourceData66 : Array ℕ := #[0,1,3,2]
def cover66 (i : Fin 4) : Fin 4 := ⟨coverData66.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source66 (i : Fin 4) : Fin 4 := ⟨sourceData66.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree66 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 (.cutY 10240 .empty (.cutX 9216 .empty (.cutY 11264 (.cutX 9728 .empty (.cutY 10752 (.cutX 9984 (.cutY 10496 .full .empty) .empty) .empty)) .empty))) (.cutY 10240 (.cutX 11264 (.cutY 9216 .empty (.cutX 10752 (.cutY 9728 .empty (.cutX 10496 (.cutY 9984 .full .empty) .empty)) .empty)) .empty) .empty)) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 (.cutY 22528 .empty (.cutX 21504 .empty (.cutY 23552 (.cutX 22016 .empty (.cutY 23040 (.cutX 22272 .empty (.cutY 22784 .empty .full)) .empty)) .empty))) (.cutY 22528 (.cutX 23552 (.cutY 21504 .empty (.cutX 23040 (.cutY 22016 .empty (.cutX 22784 .empty (.cutY 22272 .empty .full))) .empty)) .empty) .empty)))) .empty) .empty)))

theorem metadata66 : 0<300212497 ∧ 38<128 ∧ 40<128 ∧ 0<4 ∧
    3460/4160=0 ∧ 3460%4160=3460 ∧ ∀ i, (leaves66 i).Valid 8 := by decide +kernel

theorem checked66 : gridTreeUnionCheck 32768 raw66 output66 cover66 source66 tree66 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits66 : gridUnionAreaUnits output66 = 262144 := by decide +kernel

noncomputable def phaseMass66 : ℝ := singlePhaseMass (300212497/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw66 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass66_eq : phaseMass66 = (300212497/1638400000000 : ℝ) := by
  unfold phaseMass66
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw66 output66 cover66 source66
    (gridTreeUnionCheck_sound 32768 raw66 output66 cover66 source66 tree66 checked66)
    _ (by norm_num) _,areaUnits66]
  norm_num

-- Frozen phase 99, atom 3510, type 0, source (39,39).
def leavesData67 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves67 (i : Fin 1) : DyadicLeaf := leavesData67.getD i.val ⟨0,0,0⟩
def raw67 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 39 39 leaves67 i
def outputData67 : Array GridBox := #[⟨9984,10240,9984,10240⟩,⟨22528,22784,22528,22784⟩]
def output67 (i : Fin 2) : GridBox := outputData67.getD i.val ⟨0,0,0,0⟩
def coverData67 : Array ℕ := #[0,0,1,1]
def sourceData67 : Array ℕ := #[0,2]
def cover67 (i : Fin 4) : Fin 2 := ⟨coverData67.getD i.val 0 % 2,Nat.mod_lt _ (by decide)⟩
def source67 (i : Fin 2) : Fin 4 := ⟨sourceData67.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree67 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 (.cutY 10240 (.cutX 9216 .empty (.cutY 9216 .empty (.cutX 9728 .empty (.cutY 9728 .empty (.cutX 9984 .empty (.cutY 9984 .empty .full)))))) .empty) .empty) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 .empty (.cutY 22528 .empty (.cutX 23552 (.cutY 23552 (.cutX 23040 (.cutY 23040 (.cutX 22784 (.cutY 22784 .full .empty) .empty) .empty) .empty) .empty) .empty))))) .empty) .empty)))

theorem metadata67 : 0<273965208 ∧ 39<128 ∧ 39<128 ∧ 0<4 ∧
    3510/4160=0 ∧ 3510%4160=3510 ∧ ∀ i, (leaves67 i).Valid 8 := by decide +kernel

theorem checked67 : gridTreeUnionCheck 32768 raw67 output67 cover67 source67 tree67 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits67 : gridUnionAreaUnits output67 = 131072 := by decide +kernel

noncomputable def phaseMass67 : ℝ := singlePhaseMass (273965208/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw67 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass67_eq : phaseMass67 = (34245651/409600000000 : ℝ) := by
  unfold phaseMass67
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw67 output67 cover67 source67
    (gridTreeUnionCheck_sound 32768 raw67 output67 cover67 source67 tree67 checked67)
    _ (by norm_num) _,areaUnits67]
  norm_num

-- Frozen phase 100, atom 3459, type 0, source (38,39).
def leavesData68 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves68 (i : Fin 1) : DyadicLeaf := leavesData68.getD i.val ⟨0,0,0⟩
def raw68 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 38 39 leaves68 i
def outputData68 : Array GridBox := #[⟨9728,9984,9984,10240⟩,⟨9984,10240,9728,9984⟩,⟨22528,22784,22784,23040⟩,⟨22784,23040,22528,22784⟩]
def output68 (i : Fin 4) : GridBox := outputData68.getD i.val ⟨0,0,0,0⟩
def coverData68 : Array ℕ := #[0,1,3,2]
def sourceData68 : Array ℕ := #[0,1,3,2]
def cover68 (i : Fin 4) : Fin 4 := ⟨coverData68.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source68 (i : Fin 4) : Fin 4 := ⟨sourceData68.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree68 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 (.cutY 10240 (.cutX 9216 .empty (.cutY 9216 .empty (.cutX 9728 .empty (.cutY 9728 .empty (.cutX 9984 (.cutY 9984 .empty .full) (.cutY 9984 .full .empty)))))) .empty) .empty) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 .empty (.cutY 22528 .empty (.cutX 23552 (.cutY 23552 (.cutX 23040 (.cutY 23040 (.cutX 22784 (.cutY 22784 .empty .full) (.cutY 22784 .full .empty)) .empty) .empty) .empty) .empty))))) .empty) .empty)))

theorem metadata68 : 0<273965208 ∧ 38<128 ∧ 39<128 ∧ 0<4 ∧
    3459/4160=0 ∧ 3459%4160=3459 ∧ ∀ i, (leaves68 i).Valid 8 := by decide +kernel

theorem checked68 : gridTreeUnionCheck 32768 raw68 output68 cover68 source68 tree68 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits68 : gridUnionAreaUnits output68 = 262144 := by decide +kernel

noncomputable def phaseMass68 : ℝ := singlePhaseMass (273965208/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw68 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass68_eq : phaseMass68 = (34245651/204800000000 : ℝ) := by
  unfold phaseMass68
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw68 output68 cover68 source68
    (gridTreeUnionCheck_sound 32768 raw68 output68 cover68 source68 tree68 checked68)
    _ (by norm_num) _,areaUnits68]
  norm_num

-- Frozen phase 101, atom 3407, type 0, source (37,40).
def leavesData69 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves69 (i : Fin 1) : DyadicLeaf := leavesData69.getD i.val ⟨0,0,0⟩
def raw69 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 37 40 leaves69 i
def outputData69 : Array GridBox := #[⟨9472,9728,10240,10496⟩,⟨10240,10496,9472,9728⟩,⟨22272,22528,23040,23296⟩,⟨23040,23296,22272,22528⟩]
def output69 (i : Fin 4) : GridBox := outputData69.getD i.val ⟨0,0,0,0⟩
def coverData69 : Array ℕ := #[0,1,3,2]
def sourceData69 : Array ℕ := #[0,1,3,2]
def cover69 (i : Fin 4) : Fin 4 := ⟨coverData69.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source69 (i : Fin 4) : Fin 4 := ⟨sourceData69.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree69 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 (.cutY 10240 .empty (.cutX 9216 .empty (.cutY 11264 (.cutX 9728 (.cutY 10752 (.cutX 9472 .empty (.cutY 10496 .full .empty)) .empty) .empty) .empty))) (.cutY 10240 (.cutX 11264 (.cutY 9216 .empty (.cutX 10752 (.cutY 9728 (.cutX 10496 (.cutY 9472 .empty .full) .empty) .empty) .empty)) .empty) .empty)) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 (.cutY 22528 .empty (.cutX 21504 .empty (.cutY 23552 (.cutX 22016 .empty (.cutY 23040 .empty (.cutX 22272 .empty (.cutY 23296 .full .empty)))) .empty))) (.cutY 22528 (.cutX 23552 (.cutY 21504 .empty (.cutX 23040 .empty (.cutY 22016 .empty (.cutX 23296 (.cutY 22272 .empty .full) .empty)))) .empty) .empty)))) .empty) .empty)))

theorem metadata69 : 0<300212497 ∧ 37<128 ∧ 40<128 ∧ 0<4 ∧
    3407/4160=0 ∧ 3407%4160=3407 ∧ ∀ i, (leaves69 i).Valid 8 := by decide +kernel

theorem checked69 : gridTreeUnionCheck 32768 raw69 output69 cover69 source69 tree69 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits69 : gridUnionAreaUnits output69 = 262144 := by decide +kernel

noncomputable def phaseMass69 : ℝ := singlePhaseMass (300212497/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw69 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass69_eq : phaseMass69 = (300212497/1638400000000 : ℝ) := by
  unfold phaseMass69
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw69 output69 cover69 source69
    (gridTreeUnionCheck_sound 32768 raw69 output69 cover69 source69 tree69 checked69)
    _ (by norm_num) _,areaUnits69]
  norm_num

-- Frozen phase 102, atom 3406, type 0, source (37,39).
def leavesData70 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves70 (i : Fin 1) : DyadicLeaf := leavesData70.getD i.val ⟨0,0,0⟩
def raw70 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 37 39 leaves70 i
def outputData70 : Array GridBox := #[⟨9472,9728,9984,10240⟩,⟨9984,10240,9472,9728⟩,⟨22528,22784,23040,23296⟩,⟨23040,23296,22528,22784⟩]
def output70 (i : Fin 4) : GridBox := outputData70.getD i.val ⟨0,0,0,0⟩
def coverData70 : Array ℕ := #[0,1,3,2]
def sourceData70 : Array ℕ := #[0,1,3,2]
def cover70 (i : Fin 4) : Fin 4 := ⟨coverData70.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source70 (i : Fin 4) : Fin 4 := ⟨sourceData70.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree70 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 (.cutY 10240 (.cutX 9216 .empty (.cutY 9216 .empty (.cutX 9728 (.cutY 9728 .empty (.cutX 9472 .empty (.cutY 9984 .empty .full))) (.cutY 9728 (.cutX 9984 .empty (.cutY 9472 .empty .full)) .empty)))) .empty) .empty) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 .empty (.cutY 22528 .empty (.cutX 23552 (.cutY 23552 (.cutX 23040 (.cutY 23040 .empty (.cutX 22784 (.cutY 23296 .full .empty) .empty)) (.cutY 23040 (.cutX 23296 (.cutY 22784 .full .empty) .empty) .empty)) .empty) .empty))))) .empty) .empty)))

theorem metadata70 : 0<273965208 ∧ 37<128 ∧ 39<128 ∧ 0<4 ∧
    3406/4160=0 ∧ 3406%4160=3406 ∧ ∀ i, (leaves70 i).Valid 8 := by decide +kernel

theorem checked70 : gridTreeUnionCheck 32768 raw70 output70 cover70 source70 tree70 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits70 : gridUnionAreaUnits output70 = 262144 := by decide +kernel

noncomputable def phaseMass70 : ℝ := singlePhaseMass (273965208/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw70 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass70_eq : phaseMass70 = (34245651/204800000000 : ℝ) := by
  unfold phaseMass70
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw70 output70 cover70 source70
    (gridTreeUnionCheck_sound 32768 raw70 output70 cover70 source70 tree70 checked70)
    _ (by norm_num) _,areaUnits70]
  norm_num

-- Frozen phase 103, atom 3458, type 0, source (38,38).
def leavesData71 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves71 (i : Fin 1) : DyadicLeaf := leavesData71.getD i.val ⟨0,0,0⟩
def raw71 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 38 38 leaves71 i
def outputData71 : Array GridBox := #[⟨9728,9984,9728,9984⟩,⟨22784,23040,22784,23040⟩]
def output71 (i : Fin 2) : GridBox := outputData71.getD i.val ⟨0,0,0,0⟩
def coverData71 : Array ℕ := #[0,0,1,1]
def sourceData71 : Array ℕ := #[0,2]
def cover71 (i : Fin 4) : Fin 2 := ⟨coverData71.getD i.val 0 % 2,Nat.mod_lt _ (by decide)⟩
def source71 (i : Fin 2) : Fin 4 := ⟨sourceData71.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree71 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 (.cutY 10240 (.cutX 9216 .empty (.cutY 9216 .empty (.cutX 9728 .empty (.cutY 9728 .empty (.cutX 9984 (.cutY 9984 .full .empty) .empty))))) .empty) .empty) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 .empty (.cutY 22528 .empty (.cutX 23552 (.cutY 23552 (.cutX 23040 (.cutY 23040 (.cutX 22784 .empty (.cutY 22784 .empty .full)) .empty) .empty) .empty) .empty))))) .empty) .empty)))

theorem metadata71 : 0<273965208 ∧ 38<128 ∧ 38<128 ∧ 0<4 ∧
    3458/4160=0 ∧ 3458%4160=3458 ∧ ∀ i, (leaves71 i).Valid 8 := by decide +kernel

theorem checked71 : gridTreeUnionCheck 32768 raw71 output71 cover71 source71 tree71 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits71 : gridUnionAreaUnits output71 = 131072 := by decide +kernel

noncomputable def phaseMass71 : ℝ := singlePhaseMass (273965208/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw71 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass71_eq : phaseMass71 = (34245651/409600000000 : ℝ) := by
  unfold phaseMass71
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw71 output71 cover71 source71
    (gridTreeUnionCheck_sound 32768 raw71 output71 cover71 source71 tree71 checked71)
    _ (by norm_num) _,areaUnits71]
  norm_num

-- Frozen phase 104, atom 3405, type 0, source (37,38).
def leavesData72 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves72 (i : Fin 1) : DyadicLeaf := leavesData72.getD i.val ⟨0,0,0⟩
def raw72 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 37 38 leaves72 i
def outputData72 : Array GridBox := #[⟨9472,9728,9728,9984⟩,⟨9728,9984,9472,9728⟩,⟨22784,23040,23040,23296⟩,⟨23040,23296,22784,23040⟩]
def output72 (i : Fin 4) : GridBox := outputData72.getD i.val ⟨0,0,0,0⟩
def coverData72 : Array ℕ := #[0,1,3,2]
def sourceData72 : Array ℕ := #[0,1,3,2]
def cover72 (i : Fin 4) : Fin 4 := ⟨coverData72.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source72 (i : Fin 4) : Fin 4 := ⟨sourceData72.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree72 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 (.cutY 10240 (.cutX 9216 .empty (.cutY 9216 .empty (.cutX 9728 (.cutY 9728 .empty (.cutX 9472 .empty (.cutY 9984 .full .empty))) (.cutY 9728 (.cutX 9984 (.cutY 9472 .empty .full) .empty) .empty)))) .empty) .empty) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 .empty (.cutY 22528 .empty (.cutX 23552 (.cutY 23552 (.cutX 23040 (.cutY 23040 .empty (.cutX 22784 .empty (.cutY 23296 .full .empty))) (.cutY 23040 (.cutX 23296 (.cutY 22784 .empty .full) .empty) .empty)) .empty) .empty))))) .empty) .empty)))

theorem metadata72 : 0<273965208 ∧ 37<128 ∧ 38<128 ∧ 0<4 ∧
    3405/4160=0 ∧ 3405%4160=3405 ∧ ∀ i, (leaves72 i).Valid 8 := by decide +kernel

theorem checked72 : gridTreeUnionCheck 32768 raw72 output72 cover72 source72 tree72 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits72 : gridUnionAreaUnits output72 = 262144 := by decide +kernel

noncomputable def phaseMass72 : ℝ := singlePhaseMass (273965208/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw72 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass72_eq : phaseMass72 = (34245651/204800000000 : ℝ) := by
  unfold phaseMass72
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw72 output72 cover72 source72
    (gridTreeUnionCheck_sound 32768 raw72 output72 cover72 source72 tree72 checked72)
    _ (by norm_num) _,areaUnits72]
  norm_num

-- Frozen phase 105, atom 3351, type 0, source (36,39).
def leavesData73 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves73 (i : Fin 1) : DyadicLeaf := leavesData73.getD i.val ⟨0,0,0⟩
def raw73 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 36 39 leaves73 i
def outputData73 : Array GridBox := #[⟨9216,9472,9984,10240⟩,⟨9984,10240,9216,9472⟩,⟨22528,22784,23296,23552⟩,⟨23296,23552,22528,22784⟩]
def output73 (i : Fin 4) : GridBox := outputData73.getD i.val ⟨0,0,0,0⟩
def coverData73 : Array ℕ := #[0,1,3,2]
def sourceData73 : Array ℕ := #[0,1,3,2]
def cover73 (i : Fin 4) : Fin 4 := ⟨coverData73.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source73 (i : Fin 4) : Fin 4 := ⟨sourceData73.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree73 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 (.cutY 10240 (.cutX 9216 .empty (.cutY 9216 .empty (.cutX 9728 (.cutY 9728 .empty (.cutX 9472 (.cutY 9984 .empty .full) .empty)) (.cutY 9728 (.cutX 9984 .empty (.cutY 9472 .full .empty)) .empty)))) .empty) .empty) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 .empty (.cutY 22528 .empty (.cutX 23552 (.cutY 23552 (.cutX 23040 (.cutY 23040 .empty (.cutX 22784 (.cutY 23296 .empty .full) .empty)) (.cutY 23040 (.cutX 23296 .empty (.cutY 22784 .full .empty)) .empty)) .empty) .empty))))) .empty) .empty)))

theorem metadata73 : 0<273965208 ∧ 36<128 ∧ 39<128 ∧ 0<4 ∧
    3351/4160=0 ∧ 3351%4160=3351 ∧ ∀ i, (leaves73 i).Valid 8 := by decide +kernel

theorem checked73 : gridTreeUnionCheck 32768 raw73 output73 cover73 source73 tree73 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits73 : gridUnionAreaUnits output73 = 262144 := by decide +kernel

noncomputable def phaseMass73 : ℝ := singlePhaseMass (273965208/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw73 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass73_eq : phaseMass73 = (34245651/204800000000 : ℝ) := by
  unfold phaseMass73
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw73 output73 cover73 source73
    (gridTreeUnionCheck_sound 32768 raw73 output73 cover73 source73 tree73 checked73)
    _ (by norm_num) _,areaUnits73]
  norm_num

-- Frozen phase 106, atom 3350, type 0, source (36,38).
def leavesData74 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves74 (i : Fin 1) : DyadicLeaf := leavesData74.getD i.val ⟨0,0,0⟩
def raw74 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 36 38 leaves74 i
def outputData74 : Array GridBox := #[⟨9216,9472,9728,9984⟩,⟨9728,9984,9216,9472⟩,⟨22784,23040,23296,23552⟩,⟨23296,23552,22784,23040⟩]
def output74 (i : Fin 4) : GridBox := outputData74.getD i.val ⟨0,0,0,0⟩
def coverData74 : Array ℕ := #[0,1,3,2]
def sourceData74 : Array ℕ := #[0,1,3,2]
def cover74 (i : Fin 4) : Fin 4 := ⟨coverData74.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source74 (i : Fin 4) : Fin 4 := ⟨sourceData74.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree74 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 (.cutY 10240 (.cutX 9216 .empty (.cutY 9216 .empty (.cutX 9728 (.cutY 9728 .empty (.cutX 9472 (.cutY 9984 .full .empty) .empty)) (.cutY 9728 (.cutX 9984 (.cutY 9472 .full .empty) .empty) .empty)))) .empty) .empty) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 .empty (.cutY 22528 .empty (.cutX 23552 (.cutY 23552 (.cutX 23040 (.cutY 23040 .empty (.cutX 22784 .empty (.cutY 23296 .empty .full))) (.cutY 23040 (.cutX 23296 .empty (.cutY 22784 .empty .full)) .empty)) .empty) .empty))))) .empty) .empty)))

theorem metadata74 : 0<273965208 ∧ 36<128 ∧ 38<128 ∧ 0<4 ∧
    3350/4160=0 ∧ 3350%4160=3350 ∧ ∀ i, (leaves74 i).Valid 8 := by decide +kernel

theorem checked74 : gridTreeUnionCheck 32768 raw74 output74 cover74 source74 tree74 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits74 : gridUnionAreaUnits output74 = 262144 := by decide +kernel

noncomputable def phaseMass74 : ℝ := singlePhaseMass (273965208/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw74 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass74_eq : phaseMass74 = (34245651/204800000000 : ℝ) := by
  unfold phaseMass74
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw74 output74 cover74 source74
    (gridTreeUnionCheck_sound 32768 raw74 output74 cover74 source74 tree74 checked74)
    _ (by norm_num) _,areaUnits74]
  norm_num

-- Frozen phase 107, atom 3404, type 0, source (37,37).
def leavesData75 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves75 (i : Fin 1) : DyadicLeaf := leavesData75.getD i.val ⟨0,0,0⟩
def raw75 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 37 37 leaves75 i
def outputData75 : Array GridBox := #[⟨9472,9728,9472,9728⟩,⟨23040,23296,23040,23296⟩]
def output75 (i : Fin 2) : GridBox := outputData75.getD i.val ⟨0,0,0,0⟩
def coverData75 : Array ℕ := #[0,0,1,1]
def sourceData75 : Array ℕ := #[0,2]
def cover75 (i : Fin 4) : Fin 2 := ⟨coverData75.getD i.val 0 % 2,Nat.mod_lt _ (by decide)⟩
def source75 (i : Fin 2) : Fin 4 := ⟨sourceData75.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree75 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 (.cutY 10240 (.cutX 9216 .empty (.cutY 9216 .empty (.cutX 9728 (.cutY 9728 (.cutX 9472 .empty (.cutY 9472 .empty .full)) .empty) .empty))) .empty) .empty) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 .empty (.cutY 22528 .empty (.cutX 23552 (.cutY 23552 (.cutX 23040 .empty (.cutY 23040 .empty (.cutX 23296 (.cutY 23296 .full .empty) .empty))) .empty) .empty))))) .empty) .empty)))

theorem metadata75 : 0<273965208 ∧ 37<128 ∧ 37<128 ∧ 0<4 ∧
    3404/4160=0 ∧ 3404%4160=3404 ∧ ∀ i, (leaves75 i).Valid 8 := by decide +kernel

theorem checked75 : gridTreeUnionCheck 32768 raw75 output75 cover75 source75 tree75 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits75 : gridUnionAreaUnits output75 = 131072 := by decide +kernel

noncomputable def phaseMass75 : ℝ := singlePhaseMass (273965208/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw75 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass75_eq : phaseMass75 = (34245651/409600000000 : ℝ) := by
  unfold phaseMass75
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw75 output75 cover75 source75
    (gridTreeUnionCheck_sound 32768 raw75 output75 cover75 source75 tree75 checked75)
    _ (by norm_num) _,areaUnits75]
  norm_num

-- Frozen phase 108, atom 3349, type 0, source (36,37).
def leavesData76 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves76 (i : Fin 1) : DyadicLeaf := leavesData76.getD i.val ⟨0,0,0⟩
def raw76 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 36 37 leaves76 i
def outputData76 : Array GridBox := #[⟨9216,9472,9472,9728⟩,⟨9472,9728,9216,9472⟩,⟨23040,23296,23296,23552⟩,⟨23296,23552,23040,23296⟩]
def output76 (i : Fin 4) : GridBox := outputData76.getD i.val ⟨0,0,0,0⟩
def coverData76 : Array ℕ := #[0,1,3,2]
def sourceData76 : Array ℕ := #[0,1,3,2]
def cover76 (i : Fin 4) : Fin 4 := ⟨coverData76.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source76 (i : Fin 4) : Fin 4 := ⟨sourceData76.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree76 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 (.cutY 10240 (.cutX 9216 .empty (.cutY 9216 .empty (.cutX 9728 (.cutY 9728 (.cutX 9472 (.cutY 9472 .empty .full) (.cutY 9472 .full .empty)) .empty) .empty))) .empty) .empty) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 .empty (.cutY 22528 .empty (.cutX 23552 (.cutY 23552 (.cutX 23040 .empty (.cutY 23040 .empty (.cutX 23296 (.cutY 23296 .empty .full) (.cutY 23296 .full .empty)))) .empty) .empty))))) .empty) .empty)))

theorem metadata76 : 0<273965208 ∧ 36<128 ∧ 37<128 ∧ 0<4 ∧
    3349/4160=0 ∧ 3349%4160=3349 ∧ ∀ i, (leaves76 i).Valid 8 := by decide +kernel

theorem checked76 : gridTreeUnionCheck 32768 raw76 output76 cover76 source76 tree76 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits76 : gridUnionAreaUnits output76 = 262144 := by decide +kernel

noncomputable def phaseMass76 : ℝ := singlePhaseMass (273965208/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw76 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass76_eq : phaseMass76 = (34245651/204800000000 : ℝ) := by
  unfold phaseMass76
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw76 output76 cover76 source76
    (gridTreeUnionCheck_sound 32768 raw76 output76 cover76 source76 tree76 checked76)
    _ (by norm_num) _,areaUnits76]
  norm_num

-- Frozen phase 109, atom 3293, type 0, source (35,38).
def leavesData77 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves77 (i : Fin 1) : DyadicLeaf := leavesData77.getD i.val ⟨0,0,0⟩
def raw77 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 35 38 leaves77 i
def outputData77 : Array GridBox := #[⟨8960,9216,9728,9984⟩,⟨9728,9984,8960,9216⟩,⟨22784,23040,23552,23808⟩,⟨23552,23808,22784,23040⟩]
def output77 (i : Fin 4) : GridBox := outputData77.getD i.val ⟨0,0,0,0⟩
def coverData77 : Array ℕ := #[0,1,3,2]
def sourceData77 : Array ℕ := #[0,1,3,2]
def cover77 (i : Fin 4) : Fin 4 := ⟨coverData77.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source77 (i : Fin 4) : Fin 4 := ⟨sourceData77.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree77 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 (.cutY 10240 (.cutX 9216 (.cutY 9216 .empty (.cutX 8704 .empty (.cutY 9728 .empty (.cutX 8960 .empty (.cutY 9984 .full .empty))))) (.cutY 9216 (.cutX 9728 .empty (.cutY 8704 .empty (.cutX 9984 (.cutY 8960 .empty .full) .empty))) .empty)) .empty) .empty) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 .empty (.cutY 22528 .empty (.cutX 23552 (.cutY 23552 .empty (.cutX 23040 (.cutY 24064 (.cutX 22784 .empty (.cutY 23808 .full .empty)) .empty) .empty)) (.cutY 23552 (.cutX 24064 (.cutY 23040 (.cutX 23808 (.cutY 22784 .empty .full) .empty) .empty) .empty) .empty)))))) .empty) .empty)))

theorem metadata77 : 0<273965208 ∧ 35<128 ∧ 38<128 ∧ 0<4 ∧
    3293/4160=0 ∧ 3293%4160=3293 ∧ ∀ i, (leaves77 i).Valid 8 := by decide +kernel

theorem checked77 : gridTreeUnionCheck 32768 raw77 output77 cover77 source77 tree77 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits77 : gridUnionAreaUnits output77 = 262144 := by decide +kernel

noncomputable def phaseMass77 : ℝ := singlePhaseMass (273965208/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw77 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass77_eq : phaseMass77 = (34245651/204800000000 : ℝ) := by
  unfold phaseMass77
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw77 output77 cover77 source77
    (gridTreeUnionCheck_sound 32768 raw77 output77 cover77 source77 tree77 checked77)
    _ (by norm_num) _,areaUnits77]
  norm_num

-- Frozen phase 110, atom 3292, type 0, source (35,37).
def leavesData78 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves78 (i : Fin 1) : DyadicLeaf := leavesData78.getD i.val ⟨0,0,0⟩
def raw78 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 35 37 leaves78 i
def outputData78 : Array GridBox := #[⟨8960,9216,9472,9728⟩,⟨9472,9728,8960,9216⟩,⟨23040,23296,23552,23808⟩,⟨23552,23808,23040,23296⟩]
def output78 (i : Fin 4) : GridBox := outputData78.getD i.val ⟨0,0,0,0⟩
def coverData78 : Array ℕ := #[0,1,3,2]
def sourceData78 : Array ℕ := #[0,1,3,2]
def cover78 (i : Fin 4) : Fin 4 := ⟨coverData78.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source78 (i : Fin 4) : Fin 4 := ⟨sourceData78.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree78 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 (.cutY 10240 (.cutX 9216 (.cutY 9216 .empty (.cutX 8704 .empty (.cutY 9728 (.cutX 8960 .empty (.cutY 9472 .empty .full)) .empty))) (.cutY 9216 (.cutX 9728 (.cutY 8704 .empty (.cutX 9472 .empty (.cutY 8960 .empty .full))) .empty) .empty)) .empty) .empty) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 .empty (.cutY 22528 .empty (.cutX 23552 (.cutY 23552 .empty (.cutX 23040 .empty (.cutY 24064 (.cutX 23296 (.cutY 23808 .full .empty) .empty) .empty))) (.cutY 23552 (.cutX 24064 (.cutY 23040 .empty (.cutX 23808 (.cutY 23296 .full .empty) .empty)) .empty) .empty)))))) .empty) .empty)))

theorem metadata78 : 0<273965208 ∧ 35<128 ∧ 37<128 ∧ 0<4 ∧
    3292/4160=0 ∧ 3292%4160=3292 ∧ ∀ i, (leaves78 i).Valid 8 := by decide +kernel

theorem checked78 : gridTreeUnionCheck 32768 raw78 output78 cover78 source78 tree78 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits78 : gridUnionAreaUnits output78 = 262144 := by decide +kernel

noncomputable def phaseMass78 : ℝ := singlePhaseMass (273965208/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw78 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass78_eq : phaseMass78 = (34245651/204800000000 : ℝ) := by
  unfold phaseMass78
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw78 output78 cover78 source78
    (gridTreeUnionCheck_sound 32768 raw78 output78 cover78 source78 tree78 checked78)
    _ (by norm_num) _,areaUnits78]
  norm_num

-- Frozen phase 111, atom 3348, type 0, source (36,36).
def leavesData79 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves79 (i : Fin 1) : DyadicLeaf := leavesData79.getD i.val ⟨0,0,0⟩
def raw79 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 36 36 leaves79 i
def outputData79 : Array GridBox := #[⟨9216,9472,9216,9472⟩,⟨23296,23552,23296,23552⟩]
def output79 (i : Fin 2) : GridBox := outputData79.getD i.val ⟨0,0,0,0⟩
def coverData79 : Array ℕ := #[0,0,1,1]
def sourceData79 : Array ℕ := #[0,2]
def cover79 (i : Fin 4) : Fin 2 := ⟨coverData79.getD i.val 0 % 2,Nat.mod_lt _ (by decide)⟩
def source79 (i : Fin 2) : Fin 4 := ⟨sourceData79.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree79 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 (.cutY 10240 (.cutX 9216 .empty (.cutY 9216 .empty (.cutX 9728 (.cutY 9728 (.cutX 9472 (.cutY 9472 .full .empty) .empty) .empty) .empty))) .empty) .empty) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 .empty (.cutY 22528 .empty (.cutX 23552 (.cutY 23552 (.cutX 23040 .empty (.cutY 23040 .empty (.cutX 23296 .empty (.cutY 23296 .empty .full)))) .empty) .empty))))) .empty) .empty)))

theorem metadata79 : 0<273965208 ∧ 36<128 ∧ 36<128 ∧ 0<4 ∧
    3348/4160=0 ∧ 3348%4160=3348 ∧ ∀ i, (leaves79 i).Valid 8 := by decide +kernel

theorem checked79 : gridTreeUnionCheck 32768 raw79 output79 cover79 source79 tree79 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits79 : gridUnionAreaUnits output79 = 131072 := by decide +kernel

noncomputable def phaseMass79 : ℝ := singlePhaseMass (273965208/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw79 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass79_eq : phaseMass79 = (34245651/409600000000 : ℝ) := by
  unfold phaseMass79
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw79 output79 cover79 source79
    (gridTreeUnionCheck_sound 32768 raw79 output79 cover79 source79 tree79 checked79)
    _ (by norm_num) _,areaUnits79]
  norm_num

-- Frozen phase 112, atom 3291, type 0, source (35,36).
def leavesData80 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves80 (i : Fin 1) : DyadicLeaf := leavesData80.getD i.val ⟨0,0,0⟩
def raw80 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 35 36 leaves80 i
def outputData80 : Array GridBox := #[⟨8960,9216,9216,9472⟩,⟨9216,9472,8960,9216⟩,⟨23296,23552,23552,23808⟩,⟨23552,23808,23296,23552⟩]
def output80 (i : Fin 4) : GridBox := outputData80.getD i.val ⟨0,0,0,0⟩
def coverData80 : Array ℕ := #[0,1,3,2]
def sourceData80 : Array ℕ := #[0,1,3,2]
def cover80 (i : Fin 4) : Fin 4 := ⟨coverData80.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source80 (i : Fin 4) : Fin 4 := ⟨sourceData80.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree80 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 (.cutY 10240 (.cutX 9216 (.cutY 9216 .empty (.cutX 8704 .empty (.cutY 9728 (.cutX 8960 .empty (.cutY 9472 .full .empty)) .empty))) (.cutY 9216 (.cutX 9728 (.cutY 8704 .empty (.cutX 9472 (.cutY 8960 .empty .full) .empty)) .empty) .empty)) .empty) .empty) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 .empty (.cutY 22528 .empty (.cutX 23552 (.cutY 23552 .empty (.cutX 23040 .empty (.cutY 24064 (.cutX 23296 .empty (.cutY 23808 .full .empty)) .empty))) (.cutY 23552 (.cutX 24064 (.cutY 23040 .empty (.cutX 23808 (.cutY 23296 .empty .full) .empty)) .empty) .empty)))))) .empty) .empty)))

theorem metadata80 : 0<273965208 ∧ 35<128 ∧ 36<128 ∧ 0<4 ∧
    3291/4160=0 ∧ 3291%4160=3291 ∧ ∀ i, (leaves80 i).Valid 8 := by decide +kernel

theorem checked80 : gridTreeUnionCheck 32768 raw80 output80 cover80 source80 tree80 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits80 : gridUnionAreaUnits output80 = 262144 := by decide +kernel

noncomputable def phaseMass80 : ℝ := singlePhaseMass (273965208/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw80 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass80_eq : phaseMass80 = (34245651/204800000000 : ℝ) := by
  unfold phaseMass80
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw80 output80 cover80 source80
    (gridTreeUnionCheck_sound 32768 raw80 output80 cover80 source80 tree80 checked80)
    _ (by norm_num) _,areaUnits80]
  norm_num

-- Frozen phase 113, atom 3233, type 0, source (34,37).
def leavesData81 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves81 (i : Fin 1) : DyadicLeaf := leavesData81.getD i.val ⟨0,0,0⟩
def raw81 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 34 37 leaves81 i
def outputData81 : Array GridBox := #[⟨8704,8960,9472,9728⟩,⟨9472,9728,8704,8960⟩,⟨23040,23296,23808,24064⟩,⟨23808,24064,23040,23296⟩]
def output81 (i : Fin 4) : GridBox := outputData81.getD i.val ⟨0,0,0,0⟩
def coverData81 : Array ℕ := #[0,1,3,2]
def sourceData81 : Array ℕ := #[0,1,3,2]
def cover81 (i : Fin 4) : Fin 4 := ⟨coverData81.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source81 (i : Fin 4) : Fin 4 := ⟨sourceData81.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree81 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 (.cutY 10240 (.cutX 9216 (.cutY 9216 .empty (.cutX 8704 .empty (.cutY 9728 (.cutX 8960 (.cutY 9472 .empty .full) .empty) .empty))) (.cutY 9216 (.cutX 9728 (.cutY 8704 .empty (.cutX 9472 .empty (.cutY 8960 .full .empty))) .empty) .empty)) .empty) .empty) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 .empty (.cutY 22528 .empty (.cutX 23552 (.cutY 23552 .empty (.cutX 23040 .empty (.cutY 24064 (.cutX 23296 (.cutY 23808 .empty .full) .empty) .empty))) (.cutY 23552 (.cutX 24064 (.cutY 23040 .empty (.cutX 23808 .empty (.cutY 23296 .full .empty))) .empty) .empty)))))) .empty) .empty)))

theorem metadata81 : 0<273965208 ∧ 34<128 ∧ 37<128 ∧ 0<4 ∧
    3233/4160=0 ∧ 3233%4160=3233 ∧ ∀ i, (leaves81 i).Valid 8 := by decide +kernel

theorem checked81 : gridTreeUnionCheck 32768 raw81 output81 cover81 source81 tree81 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits81 : gridUnionAreaUnits output81 = 262144 := by decide +kernel

noncomputable def phaseMass81 : ℝ := singlePhaseMass (273965208/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw81 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass81_eq : phaseMass81 = (34245651/204800000000 : ℝ) := by
  unfold phaseMass81
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw81 output81 cover81 source81
    (gridTreeUnionCheck_sound 32768 raw81 output81 cover81 source81 tree81 checked81)
    _ (by norm_num) _,areaUnits81]
  norm_num

-- Frozen phase 114, atom 3232, type 0, source (34,36).
def leavesData82 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves82 (i : Fin 1) : DyadicLeaf := leavesData82.getD i.val ⟨0,0,0⟩
def raw82 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 34 36 leaves82 i
def outputData82 : Array GridBox := #[⟨8704,8960,9216,9472⟩,⟨9216,9472,8704,8960⟩,⟨23296,23552,23808,24064⟩,⟨23808,24064,23296,23552⟩]
def output82 (i : Fin 4) : GridBox := outputData82.getD i.val ⟨0,0,0,0⟩
def coverData82 : Array ℕ := #[0,1,3,2]
def sourceData82 : Array ℕ := #[0,1,3,2]
def cover82 (i : Fin 4) : Fin 4 := ⟨coverData82.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source82 (i : Fin 4) : Fin 4 := ⟨sourceData82.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree82 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 (.cutY 10240 (.cutX 9216 (.cutY 9216 .empty (.cutX 8704 .empty (.cutY 9728 (.cutX 8960 (.cutY 9472 .full .empty) .empty) .empty))) (.cutY 9216 (.cutX 9728 (.cutY 8704 .empty (.cutX 9472 (.cutY 8960 .full .empty) .empty)) .empty) .empty)) .empty) .empty) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 .empty (.cutY 22528 .empty (.cutX 23552 (.cutY 23552 .empty (.cutX 23040 .empty (.cutY 24064 (.cutX 23296 .empty (.cutY 23808 .empty .full)) .empty))) (.cutY 23552 (.cutX 24064 (.cutY 23040 .empty (.cutX 23808 .empty (.cutY 23296 .empty .full))) .empty) .empty)))))) .empty) .empty)))

theorem metadata82 : 0<273965208 ∧ 34<128 ∧ 36<128 ∧ 0<4 ∧
    3232/4160=0 ∧ 3232%4160=3232 ∧ ∀ i, (leaves82 i).Valid 8 := by decide +kernel

theorem checked82 : gridTreeUnionCheck 32768 raw82 output82 cover82 source82 tree82 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits82 : gridUnionAreaUnits output82 = 262144 := by decide +kernel

noncomputable def phaseMass82 : ℝ := singlePhaseMass (273965208/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw82 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass82_eq : phaseMass82 = (34245651/204800000000 : ℝ) := by
  unfold phaseMass82
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw82 output82 cover82 source82
    (gridTreeUnionCheck_sound 32768 raw82 output82 cover82 source82 tree82 checked82)
    _ (by norm_num) _,areaUnits82]
  norm_num

-- Frozen phase 115, atom 3290, type 0, source (35,35).
def leavesData83 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves83 (i : Fin 1) : DyadicLeaf := leavesData83.getD i.val ⟨0,0,0⟩
def raw83 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 35 35 leaves83 i
def outputData83 : Array GridBox := #[⟨8960,9216,8960,9216⟩,⟨23552,23808,23552,23808⟩]
def output83 (i : Fin 2) : GridBox := outputData83.getD i.val ⟨0,0,0,0⟩
def coverData83 : Array ℕ := #[0,0,1,1]
def sourceData83 : Array ℕ := #[0,2]
def cover83 (i : Fin 4) : Fin 2 := ⟨coverData83.getD i.val 0 % 2,Nat.mod_lt _ (by decide)⟩
def source83 (i : Fin 2) : Fin 4 := ⟨sourceData83.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree83 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 (.cutY 10240 (.cutX 9216 (.cutY 9216 (.cutX 8704 .empty (.cutY 8704 .empty (.cutX 8960 .empty (.cutY 8960 .empty .full)))) .empty) .empty) .empty) .empty) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 .empty (.cutY 22528 .empty (.cutX 23552 .empty (.cutY 23552 .empty (.cutX 24064 (.cutY 24064 (.cutX 23808 (.cutY 23808 .full .empty) .empty) .empty) .empty))))))) .empty) .empty)))

theorem metadata83 : 0<273965208 ∧ 35<128 ∧ 35<128 ∧ 0<4 ∧
    3290/4160=0 ∧ 3290%4160=3290 ∧ ∀ i, (leaves83 i).Valid 8 := by decide +kernel

theorem checked83 : gridTreeUnionCheck 32768 raw83 output83 cover83 source83 tree83 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits83 : gridUnionAreaUnits output83 = 131072 := by decide +kernel

noncomputable def phaseMass83 : ℝ := singlePhaseMass (273965208/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw83 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass83_eq : phaseMass83 = (34245651/409600000000 : ℝ) := by
  unfold phaseMass83
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw83 output83 cover83 source83
    (gridTreeUnionCheck_sound 32768 raw83 output83 cover83 source83 tree83 checked83)
    _ (by norm_num) _,areaUnits83]
  norm_num

-- Frozen phase 116, atom 3231, type 0, source (34,35).
def leavesData84 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves84 (i : Fin 1) : DyadicLeaf := leavesData84.getD i.val ⟨0,0,0⟩
def raw84 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 34 35 leaves84 i
def outputData84 : Array GridBox := #[⟨8704,8960,8960,9216⟩,⟨8960,9216,8704,8960⟩,⟨23552,23808,23808,24064⟩,⟨23808,24064,23552,23808⟩]
def output84 (i : Fin 4) : GridBox := outputData84.getD i.val ⟨0,0,0,0⟩
def coverData84 : Array ℕ := #[0,1,3,2]
def sourceData84 : Array ℕ := #[0,1,3,2]
def cover84 (i : Fin 4) : Fin 4 := ⟨coverData84.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source84 (i : Fin 4) : Fin 4 := ⟨sourceData84.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree84 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 (.cutY 10240 (.cutX 9216 (.cutY 9216 (.cutX 8704 .empty (.cutY 8704 .empty (.cutX 8960 (.cutY 8960 .empty .full) (.cutY 8960 .full .empty)))) .empty) .empty) .empty) .empty) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 .empty (.cutY 22528 .empty (.cutX 23552 .empty (.cutY 23552 .empty (.cutX 24064 (.cutY 24064 (.cutX 23808 (.cutY 23808 .empty .full) (.cutY 23808 .full .empty)) .empty) .empty))))))) .empty) .empty)))

theorem metadata84 : 0<273965208 ∧ 34<128 ∧ 35<128 ∧ 0<4 ∧
    3231/4160=0 ∧ 3231%4160=3231 ∧ ∀ i, (leaves84 i).Valid 8 := by decide +kernel

theorem checked84 : gridTreeUnionCheck 32768 raw84 output84 cover84 source84 tree84 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits84 : gridUnionAreaUnits output84 = 262144 := by decide +kernel

noncomputable def phaseMass84 : ℝ := singlePhaseMass (273965208/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw84 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass84_eq : phaseMass84 = (34245651/204800000000 : ℝ) := by
  unfold phaseMass84
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw84 output84 cover84 source84
    (gridTreeUnionCheck_sound 32768 raw84 output84 cover84 source84 tree84 checked84)
    _ (by norm_num) _,areaUnits84]
  norm_num

-- Frozen phase 117, atom 3230, type 0, source (34,34).
def leavesData85 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves85 (i : Fin 1) : DyadicLeaf := leavesData85.getD i.val ⟨0,0,0⟩
def raw85 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 34 34 leaves85 i
def outputData85 : Array GridBox := #[⟨8704,8960,8704,8960⟩,⟨23808,24064,23808,24064⟩]
def output85 (i : Fin 2) : GridBox := outputData85.getD i.val ⟨0,0,0,0⟩
def coverData85 : Array ℕ := #[0,0,1,1]
def sourceData85 : Array ℕ := #[0,2]
def cover85 (i : Fin 4) : Fin 2 := ⟨coverData85.getD i.val 0 % 2,Nat.mod_lt _ (by decide)⟩
def source85 (i : Fin 2) : Fin 4 := ⟨sourceData85.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree85 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 (.cutY 10240 (.cutX 9216 (.cutY 9216 (.cutX 8704 .empty (.cutY 8704 .empty (.cutX 8960 (.cutY 8960 .full .empty) .empty))) .empty) .empty) .empty) .empty) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 .empty (.cutY 22528 .empty (.cutX 23552 .empty (.cutY 23552 .empty (.cutX 24064 (.cutY 24064 (.cutX 23808 .empty (.cutY 23808 .empty .full)) .empty) .empty))))))) .empty) .empty)))

theorem metadata85 : 0<273965208 ∧ 34<128 ∧ 34<128 ∧ 0<4 ∧
    3230/4160=0 ∧ 3230%4160=3230 ∧ ∀ i, (leaves85 i).Valid 8 := by decide +kernel

theorem checked85 : gridTreeUnionCheck 32768 raw85 output85 cover85 source85 tree85 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits85 : gridUnionAreaUnits output85 = 131072 := by decide +kernel

noncomputable def phaseMass85 : ℝ := singlePhaseMass (273965208/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw85 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass85_eq : phaseMass85 = (34245651/409600000000 : ℝ) := by
  unfold phaseMass85
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw85 output85 cover85 source85
    (gridTreeUnionCheck_sound 32768 raw85 output85 cover85 source85 tree85 checked85)
    _ (by norm_num) _,areaUnits85]
  norm_num

-- Frozen phase 118, atom 3171, type 0, source (33,36).
def leavesData86 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves86 (i : Fin 1) : DyadicLeaf := leavesData86.getD i.val ⟨0,0,0⟩
def raw86 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 33 36 leaves86 i
def outputData86 : Array GridBox := #[⟨8448,8704,9216,9472⟩,⟨9216,9472,8448,8704⟩,⟨23296,23552,24064,24320⟩,⟨24064,24320,23296,23552⟩]
def output86 (i : Fin 4) : GridBox := outputData86.getD i.val ⟨0,0,0,0⟩
def coverData86 : Array ℕ := #[0,1,3,2]
def sourceData86 : Array ℕ := #[0,1,3,2]
def cover86 (i : Fin 4) : Fin 4 := ⟨coverData86.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source86 (i : Fin 4) : Fin 4 := ⟨sourceData86.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree86 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 (.cutY 10240 (.cutX 9216 (.cutY 9216 .empty (.cutX 8704 (.cutY 9728 (.cutX 8448 .empty (.cutY 9472 .full .empty)) .empty) .empty)) (.cutY 9216 (.cutX 9728 (.cutY 8704 (.cutX 9472 (.cutY 8448 .empty .full) .empty) .empty) .empty) .empty)) .empty) .empty) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 .empty (.cutY 22528 .empty (.cutX 23552 (.cutY 23552 .empty (.cutX 23040 .empty (.cutY 24064 .empty (.cutX 23296 .empty (.cutY 24320 .full .empty))))) (.cutY 23552 (.cutX 24064 .empty (.cutY 23040 .empty (.cutX 24320 (.cutY 23296 .empty .full) .empty))) .empty)))))) .empty) .empty)))

theorem metadata86 : 0<273965208 ∧ 33<128 ∧ 36<128 ∧ 0<4 ∧
    3171/4160=0 ∧ 3171%4160=3171 ∧ ∀ i, (leaves86 i).Valid 8 := by decide +kernel

theorem checked86 : gridTreeUnionCheck 32768 raw86 output86 cover86 source86 tree86 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits86 : gridUnionAreaUnits output86 = 262144 := by decide +kernel

noncomputable def phaseMass86 : ℝ := singlePhaseMass (273965208/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw86 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass86_eq : phaseMass86 = (34245651/204800000000 : ℝ) := by
  unfold phaseMass86
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw86 output86 cover86 source86
    (gridTreeUnionCheck_sound 32768 raw86 output86 cover86 source86 tree86 checked86)
    _ (by norm_num) _,areaUnits86]
  norm_num

-- Frozen phase 119, atom 3170, type 0, source (33,35).
def leavesData87 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves87 (i : Fin 1) : DyadicLeaf := leavesData87.getD i.val ⟨0,0,0⟩
def raw87 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 33 35 leaves87 i
def outputData87 : Array GridBox := #[⟨8448,8704,8960,9216⟩,⟨8960,9216,8448,8704⟩,⟨23552,23808,24064,24320⟩,⟨24064,24320,23552,23808⟩]
def output87 (i : Fin 4) : GridBox := outputData87.getD i.val ⟨0,0,0,0⟩
def coverData87 : Array ℕ := #[0,1,3,2]
def sourceData87 : Array ℕ := #[0,1,3,2]
def cover87 (i : Fin 4) : Fin 4 := ⟨coverData87.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source87 (i : Fin 4) : Fin 4 := ⟨sourceData87.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree87 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 (.cutY 10240 (.cutX 9216 (.cutY 9216 (.cutX 8704 (.cutY 8704 .empty (.cutX 8448 .empty (.cutY 8960 .empty .full))) (.cutY 8704 (.cutX 8960 .empty (.cutY 8448 .empty .full)) .empty)) .empty) .empty) .empty) .empty) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 .empty (.cutY 22528 .empty (.cutX 23552 .empty (.cutY 23552 .empty (.cutX 24064 (.cutY 24064 .empty (.cutX 23808 (.cutY 24320 .full .empty) .empty)) (.cutY 24064 (.cutX 24320 (.cutY 23808 .full .empty) .empty) .empty)))))))) .empty) .empty)))

theorem metadata87 : 0<273965208 ∧ 33<128 ∧ 35<128 ∧ 0<4 ∧
    3170/4160=0 ∧ 3170%4160=3170 ∧ ∀ i, (leaves87 i).Valid 8 := by decide +kernel

theorem checked87 : gridTreeUnionCheck 32768 raw87 output87 cover87 source87 tree87 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits87 : gridUnionAreaUnits output87 = 262144 := by decide +kernel

noncomputable def phaseMass87 : ℝ := singlePhaseMass (273965208/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw87 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass87_eq : phaseMass87 = (34245651/204800000000 : ℝ) := by
  unfold phaseMass87
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw87 output87 cover87 source87
    (gridTreeUnionCheck_sound 32768 raw87 output87 cover87 source87 tree87 checked87)
    _ (by norm_num) _,areaUnits87]
  norm_num

-- Frozen phase 120, atom 3169, type 0, source (33,34).
def leavesData88 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves88 (i : Fin 1) : DyadicLeaf := leavesData88.getD i.val ⟨0,0,0⟩
def raw88 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 33 34 leaves88 i
def outputData88 : Array GridBox := #[⟨8448,8704,8704,8960⟩,⟨8704,8960,8448,8704⟩,⟨23808,24064,24064,24320⟩,⟨24064,24320,23808,24064⟩]
def output88 (i : Fin 4) : GridBox := outputData88.getD i.val ⟨0,0,0,0⟩
def coverData88 : Array ℕ := #[0,1,3,2]
def sourceData88 : Array ℕ := #[0,1,3,2]
def cover88 (i : Fin 4) : Fin 4 := ⟨coverData88.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source88 (i : Fin 4) : Fin 4 := ⟨sourceData88.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree88 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 (.cutY 10240 (.cutX 9216 (.cutY 9216 (.cutX 8704 (.cutY 8704 .empty (.cutX 8448 .empty (.cutY 8960 .full .empty))) (.cutY 8704 (.cutX 8960 (.cutY 8448 .empty .full) .empty) .empty)) .empty) .empty) .empty) .empty) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 .empty (.cutY 22528 .empty (.cutX 23552 .empty (.cutY 23552 .empty (.cutX 24064 (.cutY 24064 .empty (.cutX 23808 .empty (.cutY 24320 .full .empty))) (.cutY 24064 (.cutX 24320 (.cutY 23808 .empty .full) .empty) .empty)))))))) .empty) .empty)))

theorem metadata88 : 0<273965208 ∧ 33<128 ∧ 34<128 ∧ 0<4 ∧
    3169/4160=0 ∧ 3169%4160=3169 ∧ ∀ i, (leaves88 i).Valid 8 := by decide +kernel

theorem checked88 : gridTreeUnionCheck 32768 raw88 output88 cover88 source88 tree88 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits88 : gridUnionAreaUnits output88 = 262144 := by decide +kernel

noncomputable def phaseMass88 : ℝ := singlePhaseMass (273965208/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw88 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass88_eq : phaseMass88 = (34245651/204800000000 : ℝ) := by
  unfold phaseMass88
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw88 output88 cover88 source88
    (gridTreeUnionCheck_sound 32768 raw88 output88 cover88 source88 tree88 checked88)
    _ (by norm_num) _,areaUnits88]
  norm_num

-- Frozen phase 121, atom 3168, type 0, source (33,33).
def leavesData89 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves89 (i : Fin 1) : DyadicLeaf := leavesData89.getD i.val ⟨0,0,0⟩
def raw89 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 33 33 leaves89 i
def outputData89 : Array GridBox := #[⟨8448,8704,8448,8704⟩,⟨24064,24320,24064,24320⟩]
def output89 (i : Fin 2) : GridBox := outputData89.getD i.val ⟨0,0,0,0⟩
def coverData89 : Array ℕ := #[0,0,1,1]
def sourceData89 : Array ℕ := #[0,2]
def cover89 (i : Fin 4) : Fin 2 := ⟨coverData89.getD i.val 0 % 2,Nat.mod_lt _ (by decide)⟩
def source89 (i : Fin 2) : Fin 4 := ⟨sourceData89.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree89 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 (.cutY 10240 (.cutX 9216 (.cutY 9216 (.cutX 8704 (.cutY 8704 (.cutX 8448 .empty (.cutY 8448 .empty .full)) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 .empty (.cutY 22528 .empty (.cutX 23552 .empty (.cutY 23552 .empty (.cutX 24064 .empty (.cutY 24064 .empty (.cutX 24320 (.cutY 24320 .full .empty) .empty))))))))) .empty) .empty)))

theorem metadata89 : 0<273965208 ∧ 33<128 ∧ 33<128 ∧ 0<4 ∧
    3168/4160=0 ∧ 3168%4160=3168 ∧ ∀ i, (leaves89 i).Valid 8 := by decide +kernel

theorem checked89 : gridTreeUnionCheck 32768 raw89 output89 cover89 source89 tree89 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits89 : gridUnionAreaUnits output89 = 131072 := by decide +kernel

noncomputable def phaseMass89 : ℝ := singlePhaseMass (273965208/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw89 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass89_eq : phaseMass89 = (34245651/409600000000 : ℝ) := by
  unfold phaseMass89
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw89 output89 cover89 source89
    (gridTreeUnionCheck_sound 32768 raw89 output89 cover89 source89 tree89 checked89)
    _ (by norm_num) _,areaUnits89]
  norm_num

-- Frozen phase 122, atom 3107, type 0, source (32,35).
def leavesData90 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves90 (i : Fin 1) : DyadicLeaf := leavesData90.getD i.val ⟨0,0,0⟩
def raw90 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 32 35 leaves90 i
def outputData90 : Array GridBox := #[⟨8192,8448,8960,9216⟩,⟨8960,9216,8192,8448⟩,⟨23552,23808,24320,24576⟩,⟨24320,24576,23552,23808⟩]
def output90 (i : Fin 4) : GridBox := outputData90.getD i.val ⟨0,0,0,0⟩
def coverData90 : Array ℕ := #[0,1,3,2]
def sourceData90 : Array ℕ := #[0,1,3,2]
def cover90 (i : Fin 4) : Fin 4 := ⟨coverData90.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source90 (i : Fin 4) : Fin 4 := ⟨sourceData90.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree90 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 (.cutY 10240 (.cutX 9216 (.cutY 9216 (.cutX 8704 (.cutY 8704 .empty (.cutX 8448 (.cutY 8960 .empty .full) .empty)) (.cutY 8704 (.cutX 8960 .empty (.cutY 8448 .full .empty)) .empty)) .empty) .empty) .empty) .empty) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 .empty (.cutY 22528 .empty (.cutX 23552 .empty (.cutY 23552 .empty (.cutX 24064 (.cutY 24064 .empty (.cutX 23808 (.cutY 24320 .empty .full) .empty)) (.cutY 24064 (.cutX 24320 .empty (.cutY 23808 .full .empty)) .empty)))))))) .empty) .empty)))

theorem metadata90 : 0<273965208 ∧ 32<128 ∧ 35<128 ∧ 0<4 ∧
    3107/4160=0 ∧ 3107%4160=3107 ∧ ∀ i, (leaves90 i).Valid 8 := by decide +kernel

theorem checked90 : gridTreeUnionCheck 32768 raw90 output90 cover90 source90 tree90 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits90 : gridUnionAreaUnits output90 = 262144 := by decide +kernel

noncomputable def phaseMass90 : ℝ := singlePhaseMass (273965208/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw90 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass90_eq : phaseMass90 = (34245651/204800000000 : ℝ) := by
  unfold phaseMass90
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw90 output90 cover90 source90
    (gridTreeUnionCheck_sound 32768 raw90 output90 cover90 source90 tree90 checked90)
    _ (by norm_num) _,areaUnits90]
  norm_num

-- Frozen phase 123, atom 3106, type 0, source (32,34).
def leavesData91 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves91 (i : Fin 1) : DyadicLeaf := leavesData91.getD i.val ⟨0,0,0⟩
def raw91 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 32 34 leaves91 i
def outputData91 : Array GridBox := #[⟨8192,8448,8704,8960⟩,⟨8704,8960,8192,8448⟩,⟨23808,24064,24320,24576⟩,⟨24320,24576,23808,24064⟩]
def output91 (i : Fin 4) : GridBox := outputData91.getD i.val ⟨0,0,0,0⟩
def coverData91 : Array ℕ := #[0,1,3,2]
def sourceData91 : Array ℕ := #[0,1,3,2]
def cover91 (i : Fin 4) : Fin 4 := ⟨coverData91.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source91 (i : Fin 4) : Fin 4 := ⟨sourceData91.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree91 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 (.cutY 10240 (.cutX 9216 (.cutY 9216 (.cutX 8704 (.cutY 8704 .empty (.cutX 8448 (.cutY 8960 .full .empty) .empty)) (.cutY 8704 (.cutX 8960 (.cutY 8448 .full .empty) .empty) .empty)) .empty) .empty) .empty) .empty) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 .empty (.cutY 22528 .empty (.cutX 23552 .empty (.cutY 23552 .empty (.cutX 24064 (.cutY 24064 .empty (.cutX 23808 .empty (.cutY 24320 .empty .full))) (.cutY 24064 (.cutX 24320 .empty (.cutY 23808 .empty .full)) .empty)))))))) .empty) .empty)))

theorem metadata91 : 0<273965208 ∧ 32<128 ∧ 34<128 ∧ 0<4 ∧
    3106/4160=0 ∧ 3106%4160=3106 ∧ ∀ i, (leaves91 i).Valid 8 := by decide +kernel

theorem checked91 : gridTreeUnionCheck 32768 raw91 output91 cover91 source91 tree91 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits91 : gridUnionAreaUnits output91 = 262144 := by decide +kernel

noncomputable def phaseMass91 : ℝ := singlePhaseMass (273965208/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw91 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass91_eq : phaseMass91 = (34245651/204800000000 : ℝ) := by
  unfold phaseMass91
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw91 output91 cover91 source91
    (gridTreeUnionCheck_sound 32768 raw91 output91 cover91 source91 tree91 checked91)
    _ (by norm_num) _,areaUnits91]
  norm_num

-- Frozen phase 124, atom 3105, type 0, source (32,33).
def leavesData92 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves92 (i : Fin 1) : DyadicLeaf := leavesData92.getD i.val ⟨0,0,0⟩
def raw92 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 32 33 leaves92 i
def outputData92 : Array GridBox := #[⟨8192,8448,8448,8704⟩,⟨8448,8704,8192,8448⟩,⟨24064,24320,24320,24576⟩,⟨24320,24576,24064,24320⟩]
def output92 (i : Fin 4) : GridBox := outputData92.getD i.val ⟨0,0,0,0⟩
def coverData92 : Array ℕ := #[0,1,3,2]
def sourceData92 : Array ℕ := #[0,1,3,2]
def cover92 (i : Fin 4) : Fin 4 := ⟨coverData92.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source92 (i : Fin 4) : Fin 4 := ⟨sourceData92.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree92 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 (.cutY 10240 (.cutX 9216 (.cutY 9216 (.cutX 8704 (.cutY 8704 (.cutX 8448 (.cutY 8448 .empty .full) (.cutY 8448 .full .empty)) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 .empty (.cutY 22528 .empty (.cutX 23552 .empty (.cutY 23552 .empty (.cutX 24064 .empty (.cutY 24064 .empty (.cutX 24320 (.cutY 24320 .empty .full) (.cutY 24320 .full .empty)))))))))) .empty) .empty)))

theorem metadata92 : 0<273965208 ∧ 32<128 ∧ 33<128 ∧ 0<4 ∧
    3105/4160=0 ∧ 3105%4160=3105 ∧ ∀ i, (leaves92 i).Valid 8 := by decide +kernel

theorem checked92 : gridTreeUnionCheck 32768 raw92 output92 cover92 source92 tree92 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits92 : gridUnionAreaUnits output92 = 262144 := by decide +kernel

noncomputable def phaseMass92 : ℝ := singlePhaseMass (273965208/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw92 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass92_eq : phaseMass92 = (34245651/204800000000 : ℝ) := by
  unfold phaseMass92
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw92 output92 cover92 source92
    (gridTreeUnionCheck_sound 32768 raw92 output92 cover92 source92 tree92 checked92)
    _ (by norm_num) _,areaUnits92]
  norm_num

-- Frozen phase 125, atom 3041, type 0, source (31,34).
def leavesData93 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves93 (i : Fin 1) : DyadicLeaf := leavesData93.getD i.val ⟨0,0,0⟩
def raw93 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 31 34 leaves93 i
def outputData93 : Array GridBox := #[⟨7936,8192,8704,8960⟩,⟨8704,8960,7936,8192⟩,⟨23808,24064,24576,24832⟩,⟨24576,24832,23808,24064⟩]
def output93 (i : Fin 4) : GridBox := outputData93.getD i.val ⟨0,0,0,0⟩
def coverData93 : Array ℕ := #[0,1,3,2]
def sourceData93 : Array ℕ := #[0,1,3,2]
def cover93 (i : Fin 4) : Fin 4 := ⟨coverData93.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source93 (i : Fin 4) : Fin 4 := ⟨sourceData93.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree93 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 .empty (.cutY 10240 (.cutX 7168 .empty (.cutY 9216 (.cutX 7680 .empty (.cutY 8704 .empty (.cutX 7936 .empty (.cutY 8960 .full .empty)))) .empty)) .empty)) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 (.cutY 6144 .empty (.cutX 9216 (.cutY 7168 .empty (.cutX 8704 .empty (.cutY 7680 .empty (.cutX 8960 (.cutY 7936 .empty .full) .empty)))) .empty)) .empty)) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 .empty (.cutY 26624 (.cutX 23552 .empty (.cutY 25600 (.cutX 24064 (.cutY 25088 (.cutX 23808 .empty (.cutY 24832 .full .empty)) .empty) .empty) .empty)) .empty)) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 (.cutY 22528 .empty (.cutX 25600 (.cutY 23552 .empty (.cutX 25088 (.cutY 24064 (.cutX 24832 (.cutY 23808 .empty .full) .empty) .empty) .empty)) .empty)) .empty)) .empty) .empty))))

theorem metadata93 : 0<320937622 ∧ 31<128 ∧ 34<128 ∧ 0<4 ∧
    3041/4160=0 ∧ 3041%4160=3041 ∧ ∀ i, (leaves93 i).Valid 8 := by decide +kernel

theorem checked93 : gridTreeUnionCheck 32768 raw93 output93 cover93 source93 tree93 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits93 : gridUnionAreaUnits output93 = 262144 := by decide +kernel

noncomputable def phaseMass93 : ℝ := singlePhaseMass (320937622/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw93 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass93_eq : phaseMass93 = (160468811/819200000000 : ℝ) := by
  unfold phaseMass93
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw93 output93 cover93 source93
    (gridTreeUnionCheck_sound 32768 raw93 output93 cover93 source93 tree93 checked93)
    _ (by norm_num) _,areaUnits93]
  norm_num

-- Frozen phase 126, atom 3040, type 0, source (31,33).
def leavesData94 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves94 (i : Fin 1) : DyadicLeaf := leavesData94.getD i.val ⟨0,0,0⟩
def raw94 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 31 33 leaves94 i
def outputData94 : Array GridBox := #[⟨7936,8192,8448,8704⟩,⟨8448,8704,7936,8192⟩,⟨24064,24320,24576,24832⟩,⟨24576,24832,24064,24320⟩]
def output94 (i : Fin 4) : GridBox := outputData94.getD i.val ⟨0,0,0,0⟩
def coverData94 : Array ℕ := #[0,1,3,2]
def sourceData94 : Array ℕ := #[0,1,3,2]
def cover94 (i : Fin 4) : Fin 4 := ⟨coverData94.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source94 (i : Fin 4) : Fin 4 := ⟨sourceData94.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree94 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 .empty (.cutY 10240 (.cutX 7168 .empty (.cutY 9216 (.cutX 7680 .empty (.cutY 8704 (.cutX 7936 .empty (.cutY 8448 .empty .full)) .empty)) .empty)) .empty)) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 (.cutY 6144 .empty (.cutX 9216 (.cutY 7168 .empty (.cutX 8704 (.cutY 7680 .empty (.cutX 8448 .empty (.cutY 7936 .empty .full))) .empty)) .empty)) .empty)) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 .empty (.cutY 26624 (.cutX 23552 .empty (.cutY 25600 (.cutX 24064 .empty (.cutY 25088 (.cutX 24320 (.cutY 24832 .full .empty) .empty) .empty)) .empty)) .empty)) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 (.cutY 22528 .empty (.cutX 25600 (.cutY 23552 .empty (.cutX 25088 (.cutY 24064 .empty (.cutX 24832 (.cutY 24320 .full .empty) .empty)) .empty)) .empty)) .empty)) .empty) .empty))))

theorem metadata94 : 0<320937622 ∧ 31<128 ∧ 33<128 ∧ 0<4 ∧
    3040/4160=0 ∧ 3040%4160=3040 ∧ ∀ i, (leaves94 i).Valid 8 := by decide +kernel

theorem checked94 : gridTreeUnionCheck 32768 raw94 output94 cover94 source94 tree94 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits94 : gridUnionAreaUnits output94 = 262144 := by decide +kernel

noncomputable def phaseMass94 : ℝ := singlePhaseMass (320937622/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw94 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass94_eq : phaseMass94 = (160468811/819200000000 : ℝ) := by
  unfold phaseMass94
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw94 output94 cover94 source94
    (gridTreeUnionCheck_sound 32768 raw94 output94 cover94 source94 tree94 checked94)
    _ (by norm_num) _,areaUnits94]
  norm_num

-- Frozen phase 127, atom 3104, type 0, source (32,32).
def leavesData95 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves95 (i : Fin 1) : DyadicLeaf := leavesData95.getD i.val ⟨0,0,0⟩
def raw95 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 32 32 leaves95 i
def outputData95 : Array GridBox := #[⟨8192,8448,8192,8448⟩,⟨24320,24576,24320,24576⟩]
def output95 (i : Fin 2) : GridBox := outputData95.getD i.val ⟨0,0,0,0⟩
def coverData95 : Array ℕ := #[0,0,1,1]
def sourceData95 : Array ℕ := #[0,2]
def cover95 (i : Fin 4) : Fin 2 := ⟨coverData95.getD i.val 0 % 2,Nat.mod_lt _ (by decide)⟩
def source95 (i : Fin 2) : Fin 4 := ⟨sourceData95.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree95 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 (.cutY 10240 (.cutX 9216 (.cutY 9216 (.cutX 8704 (.cutY 8704 (.cutX 8448 (.cutY 8448 .full .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 .empty (.cutY 22528 .empty (.cutX 23552 .empty (.cutY 23552 .empty (.cutX 24064 .empty (.cutY 24064 .empty (.cutX 24320 .empty (.cutY 24320 .empty .full)))))))))) .empty) .empty)))

theorem metadata95 : 0<273965208 ∧ 32<128 ∧ 32<128 ∧ 0<4 ∧
    3104/4160=0 ∧ 3104%4160=3104 ∧ ∀ i, (leaves95 i).Valid 8 := by decide +kernel

theorem checked95 : gridTreeUnionCheck 32768 raw95 output95 cover95 source95 tree95 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits95 : gridUnionAreaUnits output95 = 131072 := by decide +kernel

noncomputable def phaseMass95 : ℝ := singlePhaseMass (273965208/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw95 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass95_eq : phaseMass95 = (34245651/409600000000 : ℝ) := by
  unfold phaseMass95
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw95 output95 cover95 source95
    (gridTreeUnionCheck_sound 32768 raw95 output95 cover95 source95 tree95 checked95)
    _ (by norm_num) _,areaUnits95]
  norm_num

-- Frozen phase 128, atom 3039, type 0, source (31,32).
def leavesData96 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves96 (i : Fin 1) : DyadicLeaf := leavesData96.getD i.val ⟨0,0,0⟩
def raw96 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 31 32 leaves96 i
def outputData96 : Array GridBox := #[⟨7936,8192,8192,8448⟩,⟨8192,8448,7936,8192⟩,⟨24320,24576,24576,24832⟩,⟨24576,24832,24320,24576⟩]
def output96 (i : Fin 4) : GridBox := outputData96.getD i.val ⟨0,0,0,0⟩
def coverData96 : Array ℕ := #[0,1,3,2]
def sourceData96 : Array ℕ := #[0,1,3,2]
def cover96 (i : Fin 4) : Fin 4 := ⟨coverData96.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source96 (i : Fin 4) : Fin 4 := ⟨sourceData96.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree96 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 .empty (.cutY 10240 (.cutX 7168 .empty (.cutY 9216 (.cutX 7680 .empty (.cutY 8704 (.cutX 7936 .empty (.cutY 8448 .full .empty)) .empty)) .empty)) .empty)) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 (.cutY 6144 .empty (.cutX 9216 (.cutY 7168 .empty (.cutX 8704 (.cutY 7680 .empty (.cutX 8448 (.cutY 7936 .empty .full) .empty)) .empty)) .empty)) .empty)) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 .empty (.cutY 26624 (.cutX 23552 .empty (.cutY 25600 (.cutX 24064 .empty (.cutY 25088 (.cutX 24320 .empty (.cutY 24832 .full .empty)) .empty)) .empty)) .empty)) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 (.cutY 22528 .empty (.cutX 25600 (.cutY 23552 .empty (.cutX 25088 (.cutY 24064 .empty (.cutX 24832 (.cutY 24320 .empty .full) .empty)) .empty)) .empty)) .empty)) .empty) .empty))))

theorem metadata96 : 0<320937622 ∧ 31<128 ∧ 32<128 ∧ 0<4 ∧
    3039/4160=0 ∧ 3039%4160=3039 ∧ ∀ i, (leaves96 i).Valid 8 := by decide +kernel

theorem checked96 : gridTreeUnionCheck 32768 raw96 output96 cover96 source96 tree96 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits96 : gridUnionAreaUnits output96 = 262144 := by decide +kernel

noncomputable def phaseMass96 : ℝ := singlePhaseMass (320937622/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw96 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass96_eq : phaseMass96 = (160468811/819200000000 : ℝ) := by
  unfold phaseMass96
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw96 output96 cover96 source96
    (gridTreeUnionCheck_sound 32768 raw96 output96 cover96 source96 tree96 checked96)
    _ (by norm_num) _,areaUnits96]
  norm_num

-- Frozen phase 129, atom 2973, type 0, source (30,33).
def leavesData97 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves97 (i : Fin 1) : DyadicLeaf := leavesData97.getD i.val ⟨0,0,0⟩
def raw97 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 30 33 leaves97 i
def outputData97 : Array GridBox := #[⟨7680,7936,8448,8704⟩,⟨8448,8704,7680,7936⟩,⟨24064,24320,24832,25088⟩,⟨24832,25088,24064,24320⟩]
def output97 (i : Fin 4) : GridBox := outputData97.getD i.val ⟨0,0,0,0⟩
def coverData97 : Array ℕ := #[0,1,3,2]
def sourceData97 : Array ℕ := #[0,1,3,2]
def cover97 (i : Fin 4) : Fin 4 := ⟨coverData97.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source97 (i : Fin 4) : Fin 4 := ⟨sourceData97.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree97 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 .empty (.cutY 10240 (.cutX 7168 .empty (.cutY 9216 (.cutX 7680 .empty (.cutY 8704 (.cutX 7936 (.cutY 8448 .empty .full) .empty) .empty)) .empty)) .empty)) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 (.cutY 6144 .empty (.cutX 9216 (.cutY 7168 .empty (.cutX 8704 (.cutY 7680 .empty (.cutX 8448 .empty (.cutY 7936 .full .empty))) .empty)) .empty)) .empty)) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 .empty (.cutY 26624 (.cutX 23552 .empty (.cutY 25600 (.cutX 24064 .empty (.cutY 25088 (.cutX 24320 (.cutY 24832 .empty .full) .empty) .empty)) .empty)) .empty)) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 (.cutY 22528 .empty (.cutX 25600 (.cutY 23552 .empty (.cutX 25088 (.cutY 24064 .empty (.cutX 24832 .empty (.cutY 24320 .full .empty))) .empty)) .empty)) .empty)) .empty) .empty))))

theorem metadata97 : 0<320937622 ∧ 30<128 ∧ 33<128 ∧ 0<4 ∧
    2973/4160=0 ∧ 2973%4160=2973 ∧ ∀ i, (leaves97 i).Valid 8 := by decide +kernel

theorem checked97 : gridTreeUnionCheck 32768 raw97 output97 cover97 source97 tree97 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits97 : gridUnionAreaUnits output97 = 262144 := by decide +kernel

noncomputable def phaseMass97 : ℝ := singlePhaseMass (320937622/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw97 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass97_eq : phaseMass97 = (160468811/819200000000 : ℝ) := by
  unfold phaseMass97
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw97 output97 cover97 source97
    (gridTreeUnionCheck_sound 32768 raw97 output97 cover97 source97 tree97 checked97)
    _ (by norm_num) _,areaUnits97]
  norm_num

-- Frozen phase 130, atom 2972, type 0, source (30,32).
def leavesData98 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves98 (i : Fin 1) : DyadicLeaf := leavesData98.getD i.val ⟨0,0,0⟩
def raw98 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 30 32 leaves98 i
def outputData98 : Array GridBox := #[⟨7680,7936,8192,8448⟩,⟨8192,8448,7680,7936⟩,⟨24320,24576,24832,25088⟩,⟨24832,25088,24320,24576⟩]
def output98 (i : Fin 4) : GridBox := outputData98.getD i.val ⟨0,0,0,0⟩
def coverData98 : Array ℕ := #[0,1,3,2]
def sourceData98 : Array ℕ := #[0,1,3,2]
def cover98 (i : Fin 4) : Fin 4 := ⟨coverData98.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source98 (i : Fin 4) : Fin 4 := ⟨sourceData98.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree98 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 .empty (.cutY 10240 (.cutX 7168 .empty (.cutY 9216 (.cutX 7680 .empty (.cutY 8704 (.cutX 7936 (.cutY 8448 .full .empty) .empty) .empty)) .empty)) .empty)) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 (.cutY 6144 .empty (.cutX 9216 (.cutY 7168 .empty (.cutX 8704 (.cutY 7680 .empty (.cutX 8448 (.cutY 7936 .full .empty) .empty)) .empty)) .empty)) .empty)) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 .empty (.cutY 26624 (.cutX 23552 .empty (.cutY 25600 (.cutX 24064 .empty (.cutY 25088 (.cutX 24320 .empty (.cutY 24832 .empty .full)) .empty)) .empty)) .empty)) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 (.cutY 22528 .empty (.cutX 25600 (.cutY 23552 .empty (.cutX 25088 (.cutY 24064 .empty (.cutX 24832 .empty (.cutY 24320 .empty .full))) .empty)) .empty)) .empty)) .empty) .empty))))

theorem metadata98 : 0<320937622 ∧ 30<128 ∧ 32<128 ∧ 0<4 ∧
    2972/4160=0 ∧ 2972%4160=2972 ∧ ∀ i, (leaves98 i).Valid 8 := by decide +kernel

theorem checked98 : gridTreeUnionCheck 32768 raw98 output98 cover98 source98 tree98 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits98 : gridUnionAreaUnits output98 = 262144 := by decide +kernel

noncomputable def phaseMass98 : ℝ := singlePhaseMass (320937622/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw98 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass98_eq : phaseMass98 = (160468811/819200000000 : ℝ) := by
  unfold phaseMass98
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw98 output98 cover98 source98
    (gridTreeUnionCheck_sound 32768 raw98 output98 cover98 source98 tree98 checked98)
    _ (by norm_num) _,areaUnits98]
  norm_num

-- Frozen phase 131, atom 3038, type 0, source (31,31).
def leavesData99 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves99 (i : Fin 1) : DyadicLeaf := leavesData99.getD i.val ⟨0,0,0⟩
def raw99 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 31 31 leaves99 i
def outputData99 : Array GridBox := #[⟨7936,8192,7936,8192⟩,⟨24576,24832,24576,24832⟩]
def output99 (i : Fin 2) : GridBox := outputData99.getD i.val ⟨0,0,0,0⟩
def coverData99 : Array ℕ := #[0,0,1,1]
def sourceData99 : Array ℕ := #[0,2]
def cover99 (i : Fin 4) : Fin 2 := ⟨coverData99.getD i.val 0 % 2,Nat.mod_lt _ (by decide)⟩
def source99 (i : Fin 2) : Fin 4 := ⟨sourceData99.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree99 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 .empty (.cutY 6144 .empty (.cutX 7168 .empty (.cutY 7168 .empty (.cutX 7680 .empty (.cutY 7680 .empty (.cutX 7936 .empty (.cutY 7936 .empty .full)))))))))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 (.cutY 26624 (.cutX 25600 (.cutY 25600 (.cutX 25088 (.cutY 25088 (.cutX 24832 (.cutY 24832 .full .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty)))))

theorem metadata99 : 0<321493533 ∧ 31<128 ∧ 31<128 ∧ 0<4 ∧
    3038/4160=0 ∧ 3038%4160=3038 ∧ ∀ i, (leaves99 i).Valid 8 := by decide +kernel

theorem checked99 : gridTreeUnionCheck 32768 raw99 output99 cover99 source99 tree99 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits99 : gridUnionAreaUnits output99 = 131072 := by decide +kernel

noncomputable def phaseMass99 : ℝ := singlePhaseMass (321493533/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw99 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass99_eq : phaseMass99 = (321493533/3276800000000 : ℝ) := by
  unfold phaseMass99
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw99 output99 cover99 source99
    (gridTreeUnionCheck_sound 32768 raw99 output99 cover99 source99 tree99 checked99)
    _ (by norm_num) _,areaUnits99]
  norm_num

-- Frozen phase 132, atom 2971, type 0, source (30,31).
def leavesData100 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves100 (i : Fin 1) : DyadicLeaf := leavesData100.getD i.val ⟨0,0,0⟩
def raw100 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 30 31 leaves100 i
def outputData100 : Array GridBox := #[⟨7680,7936,7936,8192⟩,⟨7936,8192,7680,7936⟩,⟨24576,24832,24832,25088⟩,⟨24832,25088,24576,24832⟩]
def output100 (i : Fin 4) : GridBox := outputData100.getD i.val ⟨0,0,0,0⟩
def coverData100 : Array ℕ := #[0,1,3,2]
def sourceData100 : Array ℕ := #[0,1,3,2]
def cover100 (i : Fin 4) : Fin 4 := ⟨coverData100.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source100 (i : Fin 4) : Fin 4 := ⟨sourceData100.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree100 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 .empty (.cutY 6144 .empty (.cutX 7168 .empty (.cutY 7168 .empty (.cutX 7680 .empty (.cutY 7680 .empty (.cutX 7936 (.cutY 7936 .empty .full) (.cutY 7936 .full .empty)))))))))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 (.cutY 26624 (.cutX 25600 (.cutY 25600 (.cutX 25088 (.cutY 25088 (.cutX 24832 (.cutY 24832 .empty .full) (.cutY 24832 .full .empty)) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty)))))

theorem metadata100 : 0<321493533 ∧ 30<128 ∧ 31<128 ∧ 0<4 ∧
    2971/4160=0 ∧ 2971%4160=2971 ∧ ∀ i, (leaves100 i).Valid 8 := by decide +kernel

theorem checked100 : gridTreeUnionCheck 32768 raw100 output100 cover100 source100 tree100 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits100 : gridUnionAreaUnits output100 = 262144 := by decide +kernel

noncomputable def phaseMass100 : ℝ := singlePhaseMass (321493533/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw100 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass100_eq : phaseMass100 = (321493533/1638400000000 : ℝ) := by
  unfold phaseMass100
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw100 output100 cover100 source100
    (gridTreeUnionCheck_sound 32768 raw100 output100 cover100 source100 tree100 checked100)
    _ (by norm_num) _,areaUnits100]
  norm_num

-- Frozen phase 133, atom 2970, type 0, source (30,30).
def leavesData101 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves101 (i : Fin 1) : DyadicLeaf := leavesData101.getD i.val ⟨0,0,0⟩
def raw101 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 30 30 leaves101 i
def outputData101 : Array GridBox := #[⟨7680,7936,7680,7936⟩,⟨24832,25088,24832,25088⟩]
def output101 (i : Fin 2) : GridBox := outputData101.getD i.val ⟨0,0,0,0⟩
def coverData101 : Array ℕ := #[0,0,1,1]
def sourceData101 : Array ℕ := #[0,2]
def cover101 (i : Fin 4) : Fin 2 := ⟨coverData101.getD i.val 0 % 2,Nat.mod_lt _ (by decide)⟩
def source101 (i : Fin 2) : Fin 4 := ⟨sourceData101.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree101 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 .empty (.cutY 6144 .empty (.cutX 7168 .empty (.cutY 7168 .empty (.cutX 7680 .empty (.cutY 7680 .empty (.cutX 7936 (.cutY 7936 .full .empty) .empty))))))))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 (.cutY 26624 (.cutX 25600 (.cutY 25600 (.cutX 25088 (.cutY 25088 (.cutX 24832 .empty (.cutY 24832 .empty .full)) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty)))))

theorem metadata101 : 0<321493533 ∧ 30<128 ∧ 30<128 ∧ 0<4 ∧
    2970/4160=0 ∧ 2970%4160=2970 ∧ ∀ i, (leaves101 i).Valid 8 := by decide +kernel

theorem checked101 : gridTreeUnionCheck 32768 raw101 output101 cover101 source101 tree101 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits101 : gridUnionAreaUnits output101 = 131072 := by decide +kernel

noncomputable def phaseMass101 : ℝ := singlePhaseMass (321493533/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw101 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass101_eq : phaseMass101 = (321493533/3276800000000 : ℝ) := by
  unfold phaseMass101
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw101 output101 cover101 source101
    (gridTreeUnionCheck_sound 32768 raw101 output101 cover101 source101 tree101 checked101)
    _ (by norm_num) _,areaUnits101]
  norm_num

-- Frozen phase 134, atom 2903, type 0, source (29,32).
def leavesData102 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves102 (i : Fin 1) : DyadicLeaf := leavesData102.getD i.val ⟨0,0,0⟩
def raw102 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 29 32 leaves102 i
def outputData102 : Array GridBox := #[⟨7424,7680,8192,8448⟩,⟨8192,8448,7424,7680⟩,⟨24320,24576,25088,25344⟩,⟨25088,25344,24320,24576⟩]
def output102 (i : Fin 4) : GridBox := outputData102.getD i.val ⟨0,0,0,0⟩
def coverData102 : Array ℕ := #[0,1,3,2]
def sourceData102 : Array ℕ := #[0,1,3,2]
def cover102 (i : Fin 4) : Fin 4 := ⟨coverData102.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source102 (i : Fin 4) : Fin 4 := ⟨sourceData102.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree102 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 .empty (.cutY 10240 (.cutX 7168 .empty (.cutY 9216 (.cutX 7680 (.cutY 8704 (.cutX 7424 .empty (.cutY 8448 .full .empty)) .empty) .empty) .empty)) .empty)) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 (.cutY 6144 .empty (.cutX 9216 (.cutY 7168 .empty (.cutX 8704 (.cutY 7680 (.cutX 8448 (.cutY 7424 .empty .full) .empty) .empty) .empty)) .empty)) .empty)) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 .empty (.cutY 26624 (.cutX 23552 .empty (.cutY 25600 (.cutX 24064 .empty (.cutY 25088 .empty (.cutX 24320 .empty (.cutY 25344 .full .empty)))) .empty)) .empty)) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 (.cutY 22528 .empty (.cutX 25600 (.cutY 23552 .empty (.cutX 25088 .empty (.cutY 24064 .empty (.cutX 25344 (.cutY 24320 .empty .full) .empty)))) .empty)) .empty)) .empty) .empty))))

theorem metadata102 : 0<320937622 ∧ 29<128 ∧ 32<128 ∧ 0<4 ∧
    2903/4160=0 ∧ 2903%4160=2903 ∧ ∀ i, (leaves102 i).Valid 8 := by decide +kernel

theorem checked102 : gridTreeUnionCheck 32768 raw102 output102 cover102 source102 tree102 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits102 : gridUnionAreaUnits output102 = 262144 := by decide +kernel

noncomputable def phaseMass102 : ℝ := singlePhaseMass (320937622/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw102 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass102_eq : phaseMass102 = (160468811/819200000000 : ℝ) := by
  unfold phaseMass102
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw102 output102 cover102 source102
    (gridTreeUnionCheck_sound 32768 raw102 output102 cover102 source102 tree102 checked102)
    _ (by norm_num) _,areaUnits102]
  norm_num

-- Frozen phase 135, atom 2902, type 0, source (29,31).
def leavesData103 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves103 (i : Fin 1) : DyadicLeaf := leavesData103.getD i.val ⟨0,0,0⟩
def raw103 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 29 31 leaves103 i
def outputData103 : Array GridBox := #[⟨7424,7680,7936,8192⟩,⟨7936,8192,7424,7680⟩,⟨24576,24832,25088,25344⟩,⟨25088,25344,24576,24832⟩]
def output103 (i : Fin 4) : GridBox := outputData103.getD i.val ⟨0,0,0,0⟩
def coverData103 : Array ℕ := #[0,1,3,2]
def sourceData103 : Array ℕ := #[0,1,3,2]
def cover103 (i : Fin 4) : Fin 4 := ⟨coverData103.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source103 (i : Fin 4) : Fin 4 := ⟨sourceData103.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree103 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 .empty (.cutY 6144 .empty (.cutX 7168 .empty (.cutY 7168 .empty (.cutX 7680 (.cutY 7680 .empty (.cutX 7424 .empty (.cutY 7936 .empty .full))) (.cutY 7680 (.cutX 7936 .empty (.cutY 7424 .empty .full)) .empty)))))))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 (.cutY 26624 (.cutX 25600 (.cutY 25600 (.cutX 25088 (.cutY 25088 .empty (.cutX 24832 (.cutY 25344 .full .empty) .empty)) (.cutY 25088 (.cutX 25344 (.cutY 24832 .full .empty) .empty) .empty)) .empty) .empty) .empty) .empty) .empty) .empty)))))

theorem metadata103 : 0<321493533 ∧ 29<128 ∧ 31<128 ∧ 0<4 ∧
    2902/4160=0 ∧ 2902%4160=2902 ∧ ∀ i, (leaves103 i).Valid 8 := by decide +kernel

theorem checked103 : gridTreeUnionCheck 32768 raw103 output103 cover103 source103 tree103 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits103 : gridUnionAreaUnits output103 = 262144 := by decide +kernel

noncomputable def phaseMass103 : ℝ := singlePhaseMass (321493533/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw103 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass103_eq : phaseMass103 = (321493533/1638400000000 : ℝ) := by
  unfold phaseMass103
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw103 output103 cover103 source103
    (gridTreeUnionCheck_sound 32768 raw103 output103 cover103 source103 tree103 checked103)
    _ (by norm_num) _,areaUnits103]
  norm_num

-- Frozen phase 136, atom 2901, type 0, source (29,30).
def leavesData104 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves104 (i : Fin 1) : DyadicLeaf := leavesData104.getD i.val ⟨0,0,0⟩
def raw104 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 29 30 leaves104 i
def outputData104 : Array GridBox := #[⟨7424,7680,7680,7936⟩,⟨7680,7936,7424,7680⟩,⟨24832,25088,25088,25344⟩,⟨25088,25344,24832,25088⟩]
def output104 (i : Fin 4) : GridBox := outputData104.getD i.val ⟨0,0,0,0⟩
def coverData104 : Array ℕ := #[0,1,3,2]
def sourceData104 : Array ℕ := #[0,1,3,2]
def cover104 (i : Fin 4) : Fin 4 := ⟨coverData104.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source104 (i : Fin 4) : Fin 4 := ⟨sourceData104.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree104 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 .empty (.cutY 6144 .empty (.cutX 7168 .empty (.cutY 7168 .empty (.cutX 7680 (.cutY 7680 .empty (.cutX 7424 .empty (.cutY 7936 .full .empty))) (.cutY 7680 (.cutX 7936 (.cutY 7424 .empty .full) .empty) .empty)))))))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 (.cutY 26624 (.cutX 25600 (.cutY 25600 (.cutX 25088 (.cutY 25088 .empty (.cutX 24832 .empty (.cutY 25344 .full .empty))) (.cutY 25088 (.cutX 25344 (.cutY 24832 .empty .full) .empty) .empty)) .empty) .empty) .empty) .empty) .empty) .empty)))))

theorem metadata104 : 0<321493533 ∧ 29<128 ∧ 30<128 ∧ 0<4 ∧
    2901/4160=0 ∧ 2901%4160=2901 ∧ ∀ i, (leaves104 i).Valid 8 := by decide +kernel

theorem checked104 : gridTreeUnionCheck 32768 raw104 output104 cover104 source104 tree104 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits104 : gridUnionAreaUnits output104 = 262144 := by decide +kernel

noncomputable def phaseMass104 : ℝ := singlePhaseMass (321493533/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw104 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass104_eq : phaseMass104 = (321493533/1638400000000 : ℝ) := by
  unfold phaseMass104
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw104 output104 cover104 source104
    (gridTreeUnionCheck_sound 32768 raw104 output104 cover104 source104 tree104 checked104)
    _ (by norm_num) _,areaUnits104]
  norm_num

-- Frozen phase 137, atom 2900, type 0, source (29,29).
def leavesData105 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves105 (i : Fin 1) : DyadicLeaf := leavesData105.getD i.val ⟨0,0,0⟩
def raw105 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 29 29 leaves105 i
def outputData105 : Array GridBox := #[⟨7424,7680,7424,7680⟩,⟨25088,25344,25088,25344⟩]
def output105 (i : Fin 2) : GridBox := outputData105.getD i.val ⟨0,0,0,0⟩
def coverData105 : Array ℕ := #[0,0,1,1]
def sourceData105 : Array ℕ := #[0,2]
def cover105 (i : Fin 4) : Fin 2 := ⟨coverData105.getD i.val 0 % 2,Nat.mod_lt _ (by decide)⟩
def source105 (i : Fin 2) : Fin 4 := ⟨sourceData105.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree105 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 .empty (.cutY 6144 .empty (.cutX 7168 .empty (.cutY 7168 .empty (.cutX 7680 (.cutY 7680 (.cutX 7424 .empty (.cutY 7424 .empty .full)) .empty) .empty))))))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 (.cutY 26624 (.cutX 25600 (.cutY 25600 (.cutX 25088 .empty (.cutY 25088 .empty (.cutX 25344 (.cutY 25344 .full .empty) .empty))) .empty) .empty) .empty) .empty) .empty) .empty)))))

theorem metadata105 : 0<321493533 ∧ 29<128 ∧ 29<128 ∧ 0<4 ∧
    2900/4160=0 ∧ 2900%4160=2900 ∧ ∀ i, (leaves105 i).Valid 8 := by decide +kernel

theorem checked105 : gridTreeUnionCheck 32768 raw105 output105 cover105 source105 tree105 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits105 : gridUnionAreaUnits output105 = 131072 := by decide +kernel

noncomputable def phaseMass105 : ℝ := singlePhaseMass (321493533/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw105 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass105_eq : phaseMass105 = (321493533/3276800000000 : ℝ) := by
  unfold phaseMass105
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw105 output105 cover105 source105
    (gridTreeUnionCheck_sound 32768 raw105 output105 cover105 source105 tree105 checked105)
    _ (by norm_num) _,areaUnits105]
  norm_num

-- Frozen phase 138, atom 2831, type 0, source (28,31).
def leavesData106 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves106 (i : Fin 1) : DyadicLeaf := leavesData106.getD i.val ⟨0,0,0⟩
def raw106 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 28 31 leaves106 i
def outputData106 : Array GridBox := #[⟨7168,7424,7936,8192⟩,⟨7936,8192,7168,7424⟩,⟨24576,24832,25344,25600⟩,⟨25344,25600,24576,24832⟩]
def output106 (i : Fin 4) : GridBox := outputData106.getD i.val ⟨0,0,0,0⟩
def coverData106 : Array ℕ := #[0,1,3,2]
def sourceData106 : Array ℕ := #[0,1,3,2]
def cover106 (i : Fin 4) : Fin 4 := ⟨coverData106.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source106 (i : Fin 4) : Fin 4 := ⟨sourceData106.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree106 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 .empty (.cutY 6144 .empty (.cutX 7168 .empty (.cutY 7168 .empty (.cutX 7680 (.cutY 7680 .empty (.cutX 7424 (.cutY 7936 .empty .full) .empty)) (.cutY 7680 (.cutX 7936 .empty (.cutY 7424 .full .empty)) .empty)))))))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 (.cutY 26624 (.cutX 25600 (.cutY 25600 (.cutX 25088 (.cutY 25088 .empty (.cutX 24832 (.cutY 25344 .empty .full) .empty)) (.cutY 25088 (.cutX 25344 .empty (.cutY 24832 .full .empty)) .empty)) .empty) .empty) .empty) .empty) .empty) .empty)))))

theorem metadata106 : 0<321493533 ∧ 28<128 ∧ 31<128 ∧ 0<4 ∧
    2831/4160=0 ∧ 2831%4160=2831 ∧ ∀ i, (leaves106 i).Valid 8 := by decide +kernel

theorem checked106 : gridTreeUnionCheck 32768 raw106 output106 cover106 source106 tree106 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits106 : gridUnionAreaUnits output106 = 262144 := by decide +kernel

noncomputable def phaseMass106 : ℝ := singlePhaseMass (321493533/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw106 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass106_eq : phaseMass106 = (321493533/1638400000000 : ℝ) := by
  unfold phaseMass106
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw106 output106 cover106 source106
    (gridTreeUnionCheck_sound 32768 raw106 output106 cover106 source106 tree106 checked106)
    _ (by norm_num) _,areaUnits106]
  norm_num

-- Frozen phase 139, atom 2830, type 0, source (28,30).
def leavesData107 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves107 (i : Fin 1) : DyadicLeaf := leavesData107.getD i.val ⟨0,0,0⟩
def raw107 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 28 30 leaves107 i
def outputData107 : Array GridBox := #[⟨7168,7424,7680,7936⟩,⟨7680,7936,7168,7424⟩,⟨24832,25088,25344,25600⟩,⟨25344,25600,24832,25088⟩]
def output107 (i : Fin 4) : GridBox := outputData107.getD i.val ⟨0,0,0,0⟩
def coverData107 : Array ℕ := #[0,1,3,2]
def sourceData107 : Array ℕ := #[0,1,3,2]
def cover107 (i : Fin 4) : Fin 4 := ⟨coverData107.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source107 (i : Fin 4) : Fin 4 := ⟨sourceData107.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree107 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 .empty (.cutY 6144 .empty (.cutX 7168 .empty (.cutY 7168 .empty (.cutX 7680 (.cutY 7680 .empty (.cutX 7424 (.cutY 7936 .full .empty) .empty)) (.cutY 7680 (.cutX 7936 (.cutY 7424 .full .empty) .empty) .empty)))))))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 (.cutY 26624 (.cutX 25600 (.cutY 25600 (.cutX 25088 (.cutY 25088 .empty (.cutX 24832 .empty (.cutY 25344 .empty .full))) (.cutY 25088 (.cutX 25344 .empty (.cutY 24832 .empty .full)) .empty)) .empty) .empty) .empty) .empty) .empty) .empty)))))

theorem metadata107 : 0<321493533 ∧ 28<128 ∧ 30<128 ∧ 0<4 ∧
    2830/4160=0 ∧ 2830%4160=2830 ∧ ∀ i, (leaves107 i).Valid 8 := by decide +kernel

theorem checked107 : gridTreeUnionCheck 32768 raw107 output107 cover107 source107 tree107 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits107 : gridUnionAreaUnits output107 = 262144 := by decide +kernel

noncomputable def phaseMass107 : ℝ := singlePhaseMass (321493533/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw107 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass107_eq : phaseMass107 = (321493533/1638400000000 : ℝ) := by
  unfold phaseMass107
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw107 output107 cover107 source107
    (gridTreeUnionCheck_sound 32768 raw107 output107 cover107 source107 tree107 checked107)
    _ (by norm_num) _,areaUnits107]
  norm_num

-- Frozen phase 140, atom 2829, type 0, source (28,29).
def leavesData108 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves108 (i : Fin 1) : DyadicLeaf := leavesData108.getD i.val ⟨0,0,0⟩
def raw108 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 28 29 leaves108 i
def outputData108 : Array GridBox := #[⟨7168,7424,7424,7680⟩,⟨7424,7680,7168,7424⟩,⟨25088,25344,25344,25600⟩,⟨25344,25600,25088,25344⟩]
def output108 (i : Fin 4) : GridBox := outputData108.getD i.val ⟨0,0,0,0⟩
def coverData108 : Array ℕ := #[0,1,3,2]
def sourceData108 : Array ℕ := #[0,1,3,2]
def cover108 (i : Fin 4) : Fin 4 := ⟨coverData108.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source108 (i : Fin 4) : Fin 4 := ⟨sourceData108.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree108 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 .empty (.cutY 6144 .empty (.cutX 7168 .empty (.cutY 7168 .empty (.cutX 7680 (.cutY 7680 (.cutX 7424 (.cutY 7424 .empty .full) (.cutY 7424 .full .empty)) .empty) .empty))))))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 (.cutY 26624 (.cutX 25600 (.cutY 25600 (.cutX 25088 .empty (.cutY 25088 .empty (.cutX 25344 (.cutY 25344 .empty .full) (.cutY 25344 .full .empty)))) .empty) .empty) .empty) .empty) .empty) .empty)))))

theorem metadata108 : 0<321493533 ∧ 28<128 ∧ 29<128 ∧ 0<4 ∧
    2829/4160=0 ∧ 2829%4160=2829 ∧ ∀ i, (leaves108 i).Valid 8 := by decide +kernel

theorem checked108 : gridTreeUnionCheck 32768 raw108 output108 cover108 source108 tree108 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits108 : gridUnionAreaUnits output108 = 262144 := by decide +kernel

noncomputable def phaseMass108 : ℝ := singlePhaseMass (321493533/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw108 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass108_eq : phaseMass108 = (321493533/1638400000000 : ℝ) := by
  unfold phaseMass108
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw108 output108 cover108 source108
    (gridTreeUnionCheck_sound 32768 raw108 output108 cover108 source108 tree108 checked108)
    _ (by norm_num) _,areaUnits108]
  norm_num

-- Frozen phase 141, atom 2828, type 0, source (28,28).
def leavesData109 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves109 (i : Fin 1) : DyadicLeaf := leavesData109.getD i.val ⟨0,0,0⟩
def raw109 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 28 28 leaves109 i
def outputData109 : Array GridBox := #[⟨7168,7424,7168,7424⟩,⟨25344,25600,25344,25600⟩]
def output109 (i : Fin 2) : GridBox := outputData109.getD i.val ⟨0,0,0,0⟩
def coverData109 : Array ℕ := #[0,0,1,1]
def sourceData109 : Array ℕ := #[0,2]
def cover109 (i : Fin 4) : Fin 2 := ⟨coverData109.getD i.val 0 % 2,Nat.mod_lt _ (by decide)⟩
def source109 (i : Fin 2) : Fin 4 := ⟨sourceData109.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree109 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 .empty (.cutY 6144 .empty (.cutX 7168 .empty (.cutY 7168 .empty (.cutX 7680 (.cutY 7680 (.cutX 7424 (.cutY 7424 .full .empty) .empty) .empty) .empty))))))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 (.cutY 26624 (.cutX 25600 (.cutY 25600 (.cutX 25088 .empty (.cutY 25088 .empty (.cutX 25344 .empty (.cutY 25344 .empty .full)))) .empty) .empty) .empty) .empty) .empty) .empty)))))

theorem metadata109 : 0<321493533 ∧ 28<128 ∧ 28<128 ∧ 0<4 ∧
    2828/4160=0 ∧ 2828%4160=2828 ∧ ∀ i, (leaves109 i).Valid 8 := by decide +kernel

theorem checked109 : gridTreeUnionCheck 32768 raw109 output109 cover109 source109 tree109 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits109 : gridUnionAreaUnits output109 = 131072 := by decide +kernel

noncomputable def phaseMass109 : ℝ := singlePhaseMass (321493533/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw109 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass109_eq : phaseMass109 = (321493533/3276800000000 : ℝ) := by
  unfold phaseMass109
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw109 output109 cover109 source109
    (gridTreeUnionCheck_sound 32768 raw109 output109 cover109 source109 tree109 checked109)
    _ (by norm_num) _,areaUnits109]
  norm_num

-- Frozen phase 142, atom 2757, type 0, source (27,30).
def leavesData110 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves110 (i : Fin 1) : DyadicLeaf := leavesData110.getD i.val ⟨0,0,0⟩
def raw110 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 27 30 leaves110 i
def outputData110 : Array GridBox := #[⟨6912,7168,7680,7936⟩,⟨7680,7936,6912,7168⟩,⟨24832,25088,25600,25856⟩,⟨25600,25856,24832,25088⟩]
def output110 (i : Fin 4) : GridBox := outputData110.getD i.val ⟨0,0,0,0⟩
def coverData110 : Array ℕ := #[0,1,3,2]
def sourceData110 : Array ℕ := #[0,1,3,2]
def cover110 (i : Fin 4) : Fin 4 := ⟨coverData110.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source110 (i : Fin 4) : Fin 4 := ⟨sourceData110.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree110 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 .empty (.cutY 6144 .empty (.cutX 7168 (.cutY 7168 .empty (.cutX 6656 .empty (.cutY 7680 .empty (.cutX 6912 .empty (.cutY 7936 .full .empty))))) (.cutY 7168 (.cutX 7680 .empty (.cutY 6656 .empty (.cutX 7936 (.cutY 6912 .empty .full) .empty))) .empty)))))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 (.cutY 26624 (.cutX 25600 (.cutY 25600 .empty (.cutX 25088 (.cutY 26112 (.cutX 24832 .empty (.cutY 25856 .full .empty)) .empty) .empty)) (.cutY 25600 (.cutX 26112 (.cutY 25088 (.cutX 25856 (.cutY 24832 .empty .full) .empty) .empty) .empty) .empty)) .empty) .empty) .empty) .empty)))))

theorem metadata110 : 0<321493533 ∧ 27<128 ∧ 30<128 ∧ 0<4 ∧
    2757/4160=0 ∧ 2757%4160=2757 ∧ ∀ i, (leaves110 i).Valid 8 := by decide +kernel

theorem checked110 : gridTreeUnionCheck 32768 raw110 output110 cover110 source110 tree110 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits110 : gridUnionAreaUnits output110 = 262144 := by decide +kernel

noncomputable def phaseMass110 : ℝ := singlePhaseMass (321493533/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw110 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass110_eq : phaseMass110 = (321493533/1638400000000 : ℝ) := by
  unfold phaseMass110
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw110 output110 cover110 source110
    (gridTreeUnionCheck_sound 32768 raw110 output110 cover110 source110 tree110 checked110)
    _ (by norm_num) _,areaUnits110]
  norm_num

-- Frozen phase 143, atom 2756, type 0, source (27,29).
def leavesData111 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves111 (i : Fin 1) : DyadicLeaf := leavesData111.getD i.val ⟨0,0,0⟩
def raw111 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 27 29 leaves111 i
def outputData111 : Array GridBox := #[⟨6912,7168,7424,7680⟩,⟨7424,7680,6912,7168⟩,⟨25088,25344,25600,25856⟩,⟨25600,25856,25088,25344⟩]
def output111 (i : Fin 4) : GridBox := outputData111.getD i.val ⟨0,0,0,0⟩
def coverData111 : Array ℕ := #[0,1,3,2]
def sourceData111 : Array ℕ := #[0,1,3,2]
def cover111 (i : Fin 4) : Fin 4 := ⟨coverData111.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source111 (i : Fin 4) : Fin 4 := ⟨sourceData111.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree111 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 .empty (.cutY 6144 .empty (.cutX 7168 (.cutY 7168 .empty (.cutX 6656 .empty (.cutY 7680 (.cutX 6912 .empty (.cutY 7424 .empty .full)) .empty))) (.cutY 7168 (.cutX 7680 (.cutY 6656 .empty (.cutX 7424 .empty (.cutY 6912 .empty .full))) .empty) .empty)))))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 (.cutY 26624 (.cutX 25600 (.cutY 25600 .empty (.cutX 25088 .empty (.cutY 26112 (.cutX 25344 (.cutY 25856 .full .empty) .empty) .empty))) (.cutY 25600 (.cutX 26112 (.cutY 25088 .empty (.cutX 25856 (.cutY 25344 .full .empty) .empty)) .empty) .empty)) .empty) .empty) .empty) .empty)))))

theorem metadata111 : 0<321493533 ∧ 27<128 ∧ 29<128 ∧ 0<4 ∧
    2756/4160=0 ∧ 2756%4160=2756 ∧ ∀ i, (leaves111 i).Valid 8 := by decide +kernel

theorem checked111 : gridTreeUnionCheck 32768 raw111 output111 cover111 source111 tree111 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits111 : gridUnionAreaUnits output111 = 262144 := by decide +kernel

noncomputable def phaseMass111 : ℝ := singlePhaseMass (321493533/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw111 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass111_eq : phaseMass111 = (321493533/1638400000000 : ℝ) := by
  unfold phaseMass111
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw111 output111 cover111 source111
    (gridTreeUnionCheck_sound 32768 raw111 output111 cover111 source111 tree111 checked111)
    _ (by norm_num) _,areaUnits111]
  norm_num

-- Frozen phase 144, atom 2755, type 0, source (27,28).
def leavesData112 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves112 (i : Fin 1) : DyadicLeaf := leavesData112.getD i.val ⟨0,0,0⟩
def raw112 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 27 28 leaves112 i
def outputData112 : Array GridBox := #[⟨6912,7168,7168,7424⟩,⟨7168,7424,6912,7168⟩,⟨25344,25600,25600,25856⟩,⟨25600,25856,25344,25600⟩]
def output112 (i : Fin 4) : GridBox := outputData112.getD i.val ⟨0,0,0,0⟩
def coverData112 : Array ℕ := #[0,1,3,2]
def sourceData112 : Array ℕ := #[0,1,3,2]
def cover112 (i : Fin 4) : Fin 4 := ⟨coverData112.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source112 (i : Fin 4) : Fin 4 := ⟨sourceData112.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree112 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 .empty (.cutY 6144 .empty (.cutX 7168 (.cutY 7168 .empty (.cutX 6656 .empty (.cutY 7680 (.cutX 6912 .empty (.cutY 7424 .full .empty)) .empty))) (.cutY 7168 (.cutX 7680 (.cutY 6656 .empty (.cutX 7424 (.cutY 6912 .empty .full) .empty)) .empty) .empty)))))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 (.cutY 26624 (.cutX 25600 (.cutY 25600 .empty (.cutX 25088 .empty (.cutY 26112 (.cutX 25344 .empty (.cutY 25856 .full .empty)) .empty))) (.cutY 25600 (.cutX 26112 (.cutY 25088 .empty (.cutX 25856 (.cutY 25344 .empty .full) .empty)) .empty) .empty)) .empty) .empty) .empty) .empty)))))

theorem metadata112 : 0<321493533 ∧ 27<128 ∧ 28<128 ∧ 0<4 ∧
    2755/4160=0 ∧ 2755%4160=2755 ∧ ∀ i, (leaves112 i).Valid 8 := by decide +kernel

theorem checked112 : gridTreeUnionCheck 32768 raw112 output112 cover112 source112 tree112 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits112 : gridUnionAreaUnits output112 = 262144 := by decide +kernel

noncomputable def phaseMass112 : ℝ := singlePhaseMass (321493533/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw112 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass112_eq : phaseMass112 = (321493533/1638400000000 : ℝ) := by
  unfold phaseMass112
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw112 output112 cover112 source112
    (gridTreeUnionCheck_sound 32768 raw112 output112 cover112 source112 tree112 checked112)
    _ (by norm_num) _,areaUnits112]
  norm_num

-- Frozen phase 145, atom 2754, type 0, source (27,27).
def leavesData113 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves113 (i : Fin 1) : DyadicLeaf := leavesData113.getD i.val ⟨0,0,0⟩
def raw113 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 27 27 leaves113 i
def outputData113 : Array GridBox := #[⟨6912,7168,6912,7168⟩,⟨25600,25856,25600,25856⟩]
def output113 (i : Fin 2) : GridBox := outputData113.getD i.val ⟨0,0,0,0⟩
def coverData113 : Array ℕ := #[0,0,1,1]
def sourceData113 : Array ℕ := #[0,2]
def cover113 (i : Fin 4) : Fin 2 := ⟨coverData113.getD i.val 0 % 2,Nat.mod_lt _ (by decide)⟩
def source113 (i : Fin 2) : Fin 4 := ⟨sourceData113.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree113 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 .empty (.cutY 6144 .empty (.cutX 7168 (.cutY 7168 (.cutX 6656 .empty (.cutY 6656 .empty (.cutX 6912 .empty (.cutY 6912 .empty .full)))) .empty) .empty))))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 (.cutY 26624 (.cutX 25600 .empty (.cutY 25600 .empty (.cutX 26112 (.cutY 26112 (.cutX 25856 (.cutY 25856 .full .empty) .empty) .empty) .empty))) .empty) .empty) .empty) .empty)))))

theorem metadata113 : 0<321493533 ∧ 27<128 ∧ 27<128 ∧ 0<4 ∧
    2754/4160=0 ∧ 2754%4160=2754 ∧ ∀ i, (leaves113 i).Valid 8 := by decide +kernel

theorem checked113 : gridTreeUnionCheck 32768 raw113 output113 cover113 source113 tree113 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits113 : gridUnionAreaUnits output113 = 131072 := by decide +kernel

noncomputable def phaseMass113 : ℝ := singlePhaseMass (321493533/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw113 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass113_eq : phaseMass113 = (321493533/3276800000000 : ℝ) := by
  unfold phaseMass113
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw113 output113 cover113 source113
    (gridTreeUnionCheck_sound 32768 raw113 output113 cover113 source113 tree113 checked113)
    _ (by norm_num) _,areaUnits113]
  norm_num

-- Frozen phase 146, atom 2681, type 0, source (26,29).
def leavesData114 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves114 (i : Fin 1) : DyadicLeaf := leavesData114.getD i.val ⟨0,0,0⟩
def raw114 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 26 29 leaves114 i
def outputData114 : Array GridBox := #[⟨6656,6912,7424,7680⟩,⟨7424,7680,6656,6912⟩,⟨25088,25344,25856,26112⟩,⟨25856,26112,25088,25344⟩]
def output114 (i : Fin 4) : GridBox := outputData114.getD i.val ⟨0,0,0,0⟩
def coverData114 : Array ℕ := #[0,1,3,2]
def sourceData114 : Array ℕ := #[0,1,3,2]
def cover114 (i : Fin 4) : Fin 4 := ⟨coverData114.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source114 (i : Fin 4) : Fin 4 := ⟨sourceData114.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree114 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 .empty (.cutY 6144 .empty (.cutX 7168 (.cutY 7168 .empty (.cutX 6656 .empty (.cutY 7680 (.cutX 6912 (.cutY 7424 .empty .full) .empty) .empty))) (.cutY 7168 (.cutX 7680 (.cutY 6656 .empty (.cutX 7424 .empty (.cutY 6912 .full .empty))) .empty) .empty)))))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 (.cutY 26624 (.cutX 25600 (.cutY 25600 .empty (.cutX 25088 .empty (.cutY 26112 (.cutX 25344 (.cutY 25856 .empty .full) .empty) .empty))) (.cutY 25600 (.cutX 26112 (.cutY 25088 .empty (.cutX 25856 .empty (.cutY 25344 .full .empty))) .empty) .empty)) .empty) .empty) .empty) .empty)))))

theorem metadata114 : 0<321493533 ∧ 26<128 ∧ 29<128 ∧ 0<4 ∧
    2681/4160=0 ∧ 2681%4160=2681 ∧ ∀ i, (leaves114 i).Valid 8 := by decide +kernel

theorem checked114 : gridTreeUnionCheck 32768 raw114 output114 cover114 source114 tree114 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits114 : gridUnionAreaUnits output114 = 262144 := by decide +kernel

noncomputable def phaseMass114 : ℝ := singlePhaseMass (321493533/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw114 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass114_eq : phaseMass114 = (321493533/1638400000000 : ℝ) := by
  unfold phaseMass114
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw114 output114 cover114 source114
    (gridTreeUnionCheck_sound 32768 raw114 output114 cover114 source114 tree114 checked114)
    _ (by norm_num) _,areaUnits114]
  norm_num

-- Frozen phase 147, atom 2680, type 0, source (26,28).
def leavesData115 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves115 (i : Fin 1) : DyadicLeaf := leavesData115.getD i.val ⟨0,0,0⟩
def raw115 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 26 28 leaves115 i
def outputData115 : Array GridBox := #[⟨6656,6912,7168,7424⟩,⟨7168,7424,6656,6912⟩,⟨25344,25600,25856,26112⟩,⟨25856,26112,25344,25600⟩]
def output115 (i : Fin 4) : GridBox := outputData115.getD i.val ⟨0,0,0,0⟩
def coverData115 : Array ℕ := #[0,1,3,2]
def sourceData115 : Array ℕ := #[0,1,3,2]
def cover115 (i : Fin 4) : Fin 4 := ⟨coverData115.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source115 (i : Fin 4) : Fin 4 := ⟨sourceData115.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree115 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 .empty (.cutY 6144 .empty (.cutX 7168 (.cutY 7168 .empty (.cutX 6656 .empty (.cutY 7680 (.cutX 6912 (.cutY 7424 .full .empty) .empty) .empty))) (.cutY 7168 (.cutX 7680 (.cutY 6656 .empty (.cutX 7424 (.cutY 6912 .full .empty) .empty)) .empty) .empty)))))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 (.cutY 26624 (.cutX 25600 (.cutY 25600 .empty (.cutX 25088 .empty (.cutY 26112 (.cutX 25344 .empty (.cutY 25856 .empty .full)) .empty))) (.cutY 25600 (.cutX 26112 (.cutY 25088 .empty (.cutX 25856 .empty (.cutY 25344 .empty .full))) .empty) .empty)) .empty) .empty) .empty) .empty)))))

theorem metadata115 : 0<321493533 ∧ 26<128 ∧ 28<128 ∧ 0<4 ∧
    2680/4160=0 ∧ 2680%4160=2680 ∧ ∀ i, (leaves115 i).Valid 8 := by decide +kernel

theorem checked115 : gridTreeUnionCheck 32768 raw115 output115 cover115 source115 tree115 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits115 : gridUnionAreaUnits output115 = 262144 := by decide +kernel

noncomputable def phaseMass115 : ℝ := singlePhaseMass (321493533/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw115 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass115_eq : phaseMass115 = (321493533/1638400000000 : ℝ) := by
  unfold phaseMass115
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw115 output115 cover115 source115
    (gridTreeUnionCheck_sound 32768 raw115 output115 cover115 source115 tree115 checked115)
    _ (by norm_num) _,areaUnits115]
  norm_num

-- Frozen phase 148, atom 2679, type 0, source (26,27).
def leavesData116 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves116 (i : Fin 1) : DyadicLeaf := leavesData116.getD i.val ⟨0,0,0⟩
def raw116 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 26 27 leaves116 i
def outputData116 : Array GridBox := #[⟨6656,6912,6912,7168⟩,⟨6912,7168,6656,6912⟩,⟨25600,25856,25856,26112⟩,⟨25856,26112,25600,25856⟩]
def output116 (i : Fin 4) : GridBox := outputData116.getD i.val ⟨0,0,0,0⟩
def coverData116 : Array ℕ := #[0,1,3,2]
def sourceData116 : Array ℕ := #[0,1,3,2]
def cover116 (i : Fin 4) : Fin 4 := ⟨coverData116.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source116 (i : Fin 4) : Fin 4 := ⟨sourceData116.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree116 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 .empty (.cutY 6144 .empty (.cutX 7168 (.cutY 7168 (.cutX 6656 .empty (.cutY 6656 .empty (.cutX 6912 (.cutY 6912 .empty .full) (.cutY 6912 .full .empty)))) .empty) .empty))))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 (.cutY 26624 (.cutX 25600 .empty (.cutY 25600 .empty (.cutX 26112 (.cutY 26112 (.cutX 25856 (.cutY 25856 .empty .full) (.cutY 25856 .full .empty)) .empty) .empty))) .empty) .empty) .empty) .empty)))))

theorem metadata116 : 0<321493533 ∧ 26<128 ∧ 27<128 ∧ 0<4 ∧
    2679/4160=0 ∧ 2679%4160=2679 ∧ ∀ i, (leaves116 i).Valid 8 := by decide +kernel

theorem checked116 : gridTreeUnionCheck 32768 raw116 output116 cover116 source116 tree116 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits116 : gridUnionAreaUnits output116 = 262144 := by decide +kernel

noncomputable def phaseMass116 : ℝ := singlePhaseMass (321493533/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw116 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass116_eq : phaseMass116 = (321493533/1638400000000 : ℝ) := by
  unfold phaseMass116
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw116 output116 cover116 source116
    (gridTreeUnionCheck_sound 32768 raw116 output116 cover116 source116 tree116 checked116)
    _ (by norm_num) _,areaUnits116]
  norm_num

-- Frozen phase 149, atom 2678, type 0, source (26,26).
def leavesData117 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves117 (i : Fin 1) : DyadicLeaf := leavesData117.getD i.val ⟨0,0,0⟩
def raw117 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 26 26 leaves117 i
def outputData117 : Array GridBox := #[⟨6656,6912,6656,6912⟩,⟨25856,26112,25856,26112⟩]
def output117 (i : Fin 2) : GridBox := outputData117.getD i.val ⟨0,0,0,0⟩
def coverData117 : Array ℕ := #[0,0,1,1]
def sourceData117 : Array ℕ := #[0,2]
def cover117 (i : Fin 4) : Fin 2 := ⟨coverData117.getD i.val 0 % 2,Nat.mod_lt _ (by decide)⟩
def source117 (i : Fin 2) : Fin 4 := ⟨sourceData117.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree117 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 .empty (.cutY 6144 .empty (.cutX 7168 (.cutY 7168 (.cutX 6656 .empty (.cutY 6656 .empty (.cutX 6912 (.cutY 6912 .full .empty) .empty))) .empty) .empty))))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 (.cutY 26624 (.cutX 25600 .empty (.cutY 25600 .empty (.cutX 26112 (.cutY 26112 (.cutX 25856 .empty (.cutY 25856 .empty .full)) .empty) .empty))) .empty) .empty) .empty) .empty)))))

theorem metadata117 : 0<321493533 ∧ 26<128 ∧ 26<128 ∧ 0<4 ∧
    2678/4160=0 ∧ 2678%4160=2678 ∧ ∀ i, (leaves117 i).Valid 8 := by decide +kernel

theorem checked117 : gridTreeUnionCheck 32768 raw117 output117 cover117 source117 tree117 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits117 : gridUnionAreaUnits output117 = 131072 := by decide +kernel

noncomputable def phaseMass117 : ℝ := singlePhaseMass (321493533/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw117 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass117_eq : phaseMass117 = (321493533/3276800000000 : ℝ) := by
  unfold phaseMass117
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw117 output117 cover117 source117
    (gridTreeUnionCheck_sound 32768 raw117 output117 cover117 source117 tree117 checked117)
    _ (by norm_num) _,areaUnits117]
  norm_num

-- Frozen phase 150, atom 2603, type 0, source (25,28).
def leavesData118 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves118 (i : Fin 1) : DyadicLeaf := leavesData118.getD i.val ⟨0,0,0⟩
def raw118 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 25 28 leaves118 i
def outputData118 : Array GridBox := #[⟨6400,6656,7168,7424⟩,⟨7168,7424,6400,6656⟩,⟨25344,25600,26112,26368⟩,⟨26112,26368,25344,25600⟩]
def output118 (i : Fin 4) : GridBox := outputData118.getD i.val ⟨0,0,0,0⟩
def coverData118 : Array ℕ := #[0,1,3,2]
def sourceData118 : Array ℕ := #[0,1,3,2]
def cover118 (i : Fin 4) : Fin 4 := ⟨coverData118.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source118 (i : Fin 4) : Fin 4 := ⟨sourceData118.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree118 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 .empty (.cutY 6144 .empty (.cutX 7168 (.cutY 7168 .empty (.cutX 6656 (.cutY 7680 (.cutX 6400 .empty (.cutY 7424 .full .empty)) .empty) .empty)) (.cutY 7168 (.cutX 7680 (.cutY 6656 (.cutX 7424 (.cutY 6400 .empty .full) .empty) .empty) .empty) .empty)))))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 (.cutY 26624 (.cutX 25600 (.cutY 25600 .empty (.cutX 25088 .empty (.cutY 26112 .empty (.cutX 25344 .empty (.cutY 26368 .full .empty))))) (.cutY 25600 (.cutX 26112 .empty (.cutY 25088 .empty (.cutX 26368 (.cutY 25344 .empty .full) .empty))) .empty)) .empty) .empty) .empty) .empty)))))

theorem metadata118 : 0<321493533 ∧ 25<128 ∧ 28<128 ∧ 0<4 ∧
    2603/4160=0 ∧ 2603%4160=2603 ∧ ∀ i, (leaves118 i).Valid 8 := by decide +kernel

theorem checked118 : gridTreeUnionCheck 32768 raw118 output118 cover118 source118 tree118 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits118 : gridUnionAreaUnits output118 = 262144 := by decide +kernel

noncomputable def phaseMass118 : ℝ := singlePhaseMass (321493533/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw118 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass118_eq : phaseMass118 = (321493533/1638400000000 : ℝ) := by
  unfold phaseMass118
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw118 output118 cover118 source118
    (gridTreeUnionCheck_sound 32768 raw118 output118 cover118 source118 tree118 checked118)
    _ (by norm_num) _,areaUnits118]
  norm_num

-- Frozen phase 151, atom 2602, type 0, source (25,27).
def leavesData119 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves119 (i : Fin 1) : DyadicLeaf := leavesData119.getD i.val ⟨0,0,0⟩
def raw119 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 25 27 leaves119 i
def outputData119 : Array GridBox := #[⟨6400,6656,6912,7168⟩,⟨6912,7168,6400,6656⟩,⟨25600,25856,26112,26368⟩,⟨26112,26368,25600,25856⟩]
def output119 (i : Fin 4) : GridBox := outputData119.getD i.val ⟨0,0,0,0⟩
def coverData119 : Array ℕ := #[0,1,3,2]
def sourceData119 : Array ℕ := #[0,1,3,2]
def cover119 (i : Fin 4) : Fin 4 := ⟨coverData119.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source119 (i : Fin 4) : Fin 4 := ⟨sourceData119.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree119 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 .empty (.cutY 6144 .empty (.cutX 7168 (.cutY 7168 (.cutX 6656 (.cutY 6656 .empty (.cutX 6400 .empty (.cutY 6912 .empty .full))) (.cutY 6656 (.cutX 6912 .empty (.cutY 6400 .empty .full)) .empty)) .empty) .empty))))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 (.cutY 26624 (.cutX 25600 .empty (.cutY 25600 .empty (.cutX 26112 (.cutY 26112 .empty (.cutX 25856 (.cutY 26368 .full .empty) .empty)) (.cutY 26112 (.cutX 26368 (.cutY 25856 .full .empty) .empty) .empty)))) .empty) .empty) .empty) .empty)))))

theorem metadata119 : 0<321493533 ∧ 25<128 ∧ 27<128 ∧ 0<4 ∧
    2602/4160=0 ∧ 2602%4160=2602 ∧ ∀ i, (leaves119 i).Valid 8 := by decide +kernel

theorem checked119 : gridTreeUnionCheck 32768 raw119 output119 cover119 source119 tree119 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits119 : gridUnionAreaUnits output119 = 262144 := by decide +kernel

noncomputable def phaseMass119 : ℝ := singlePhaseMass (321493533/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw119 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass119_eq : phaseMass119 = (321493533/1638400000000 : ℝ) := by
  unfold phaseMass119
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw119 output119 cover119 source119
    (gridTreeUnionCheck_sound 32768 raw119 output119 cover119 source119 tree119 checked119)
    _ (by norm_num) _,areaUnits119]
  norm_num

-- Frozen phase 152, atom 2601, type 0, source (25,26).
def leavesData120 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves120 (i : Fin 1) : DyadicLeaf := leavesData120.getD i.val ⟨0,0,0⟩
def raw120 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 25 26 leaves120 i
def outputData120 : Array GridBox := #[⟨6400,6656,6656,6912⟩,⟨6656,6912,6400,6656⟩,⟨25856,26112,26112,26368⟩,⟨26112,26368,25856,26112⟩]
def output120 (i : Fin 4) : GridBox := outputData120.getD i.val ⟨0,0,0,0⟩
def coverData120 : Array ℕ := #[0,1,3,2]
def sourceData120 : Array ℕ := #[0,1,3,2]
def cover120 (i : Fin 4) : Fin 4 := ⟨coverData120.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source120 (i : Fin 4) : Fin 4 := ⟨sourceData120.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree120 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 .empty (.cutY 6144 .empty (.cutX 7168 (.cutY 7168 (.cutX 6656 (.cutY 6656 .empty (.cutX 6400 .empty (.cutY 6912 .full .empty))) (.cutY 6656 (.cutX 6912 (.cutY 6400 .empty .full) .empty) .empty)) .empty) .empty))))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 (.cutY 26624 (.cutX 25600 .empty (.cutY 25600 .empty (.cutX 26112 (.cutY 26112 .empty (.cutX 25856 .empty (.cutY 26368 .full .empty))) (.cutY 26112 (.cutX 26368 (.cutY 25856 .empty .full) .empty) .empty)))) .empty) .empty) .empty) .empty)))))

theorem metadata120 : 0<321493533 ∧ 25<128 ∧ 26<128 ∧ 0<4 ∧
    2601/4160=0 ∧ 2601%4160=2601 ∧ ∀ i, (leaves120 i).Valid 8 := by decide +kernel

theorem checked120 : gridTreeUnionCheck 32768 raw120 output120 cover120 source120 tree120 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits120 : gridUnionAreaUnits output120 = 262144 := by decide +kernel

noncomputable def phaseMass120 : ℝ := singlePhaseMass (321493533/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw120 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass120_eq : phaseMass120 = (321493533/1638400000000 : ℝ) := by
  unfold phaseMass120
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw120 output120 cover120 source120
    (gridTreeUnionCheck_sound 32768 raw120 output120 cover120 source120 tree120 checked120)
    _ (by norm_num) _,areaUnits120]
  norm_num

-- Frozen phase 153, atom 2600, type 0, source (25,25).
def leavesData121 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves121 (i : Fin 1) : DyadicLeaf := leavesData121.getD i.val ⟨0,0,0⟩
def raw121 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 25 25 leaves121 i
def outputData121 : Array GridBox := #[⟨6400,6656,6400,6656⟩,⟨26112,26368,26112,26368⟩]
def output121 (i : Fin 2) : GridBox := outputData121.getD i.val ⟨0,0,0,0⟩
def coverData121 : Array ℕ := #[0,0,1,1]
def sourceData121 : Array ℕ := #[0,2]
def cover121 (i : Fin 4) : Fin 2 := ⟨coverData121.getD i.val 0 % 2,Nat.mod_lt _ (by decide)⟩
def source121 (i : Fin 2) : Fin 4 := ⟨sourceData121.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree121 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 .empty (.cutY 6144 .empty (.cutX 7168 (.cutY 7168 (.cutX 6656 (.cutY 6656 (.cutX 6400 .empty (.cutY 6400 .empty .full)) .empty) .empty) .empty) .empty))))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 (.cutY 26624 (.cutX 25600 .empty (.cutY 25600 .empty (.cutX 26112 .empty (.cutY 26112 .empty (.cutX 26368 (.cutY 26368 .full .empty) .empty))))) .empty) .empty) .empty) .empty)))))

theorem metadata121 : 0<321493533 ∧ 25<128 ∧ 25<128 ∧ 0<4 ∧
    2600/4160=0 ∧ 2600%4160=2600 ∧ ∀ i, (leaves121 i).Valid 8 := by decide +kernel

theorem checked121 : gridTreeUnionCheck 32768 raw121 output121 cover121 source121 tree121 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits121 : gridUnionAreaUnits output121 = 131072 := by decide +kernel

noncomputable def phaseMass121 : ℝ := singlePhaseMass (321493533/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw121 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass121_eq : phaseMass121 = (321493533/3276800000000 : ℝ) := by
  unfold phaseMass121
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw121 output121 cover121 source121
    (gridTreeUnionCheck_sound 32768 raw121 output121 cover121 source121 tree121 checked121)
    _ (by norm_num) _,areaUnits121]
  norm_num

-- Frozen phase 154, atom 2523, type 0, source (24,27).
def leavesData122 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves122 (i : Fin 1) : DyadicLeaf := leavesData122.getD i.val ⟨0,0,0⟩
def raw122 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 24 27 leaves122 i
def outputData122 : Array GridBox := #[⟨6144,6400,6912,7168⟩,⟨6912,7168,6144,6400⟩,⟨25600,25856,26368,26624⟩,⟨26368,26624,25600,25856⟩]
def output122 (i : Fin 4) : GridBox := outputData122.getD i.val ⟨0,0,0,0⟩
def coverData122 : Array ℕ := #[0,1,3,2]
def sourceData122 : Array ℕ := #[0,1,3,2]
def cover122 (i : Fin 4) : Fin 4 := ⟨coverData122.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source122 (i : Fin 4) : Fin 4 := ⟨sourceData122.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree122 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 .empty (.cutY 6144 .empty (.cutX 7168 (.cutY 7168 (.cutX 6656 (.cutY 6656 .empty (.cutX 6400 (.cutY 6912 .empty .full) .empty)) (.cutY 6656 (.cutX 6912 .empty (.cutY 6400 .full .empty)) .empty)) .empty) .empty))))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 (.cutY 26624 (.cutX 25600 .empty (.cutY 25600 .empty (.cutX 26112 (.cutY 26112 .empty (.cutX 25856 (.cutY 26368 .empty .full) .empty)) (.cutY 26112 (.cutX 26368 .empty (.cutY 25856 .full .empty)) .empty)))) .empty) .empty) .empty) .empty)))))

theorem metadata122 : 0<321493533 ∧ 24<128 ∧ 27<128 ∧ 0<4 ∧
    2523/4160=0 ∧ 2523%4160=2523 ∧ ∀ i, (leaves122 i).Valid 8 := by decide +kernel

theorem checked122 : gridTreeUnionCheck 32768 raw122 output122 cover122 source122 tree122 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits122 : gridUnionAreaUnits output122 = 262144 := by decide +kernel

noncomputable def phaseMass122 : ℝ := singlePhaseMass (321493533/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw122 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass122_eq : phaseMass122 = (321493533/1638400000000 : ℝ) := by
  unfold phaseMass122
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw122 output122 cover122 source122
    (gridTreeUnionCheck_sound 32768 raw122 output122 cover122 source122 tree122 checked122)
    _ (by norm_num) _,areaUnits122]
  norm_num

-- Frozen phase 155, atom 2522, type 0, source (24,26).
def leavesData123 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves123 (i : Fin 1) : DyadicLeaf := leavesData123.getD i.val ⟨0,0,0⟩
def raw123 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 24 26 leaves123 i
def outputData123 : Array GridBox := #[⟨6144,6400,6656,6912⟩,⟨6656,6912,6144,6400⟩,⟨25856,26112,26368,26624⟩,⟨26368,26624,25856,26112⟩]
def output123 (i : Fin 4) : GridBox := outputData123.getD i.val ⟨0,0,0,0⟩
def coverData123 : Array ℕ := #[0,1,3,2]
def sourceData123 : Array ℕ := #[0,1,3,2]
def cover123 (i : Fin 4) : Fin 4 := ⟨coverData123.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source123 (i : Fin 4) : Fin 4 := ⟨sourceData123.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree123 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 .empty (.cutY 6144 .empty (.cutX 7168 (.cutY 7168 (.cutX 6656 (.cutY 6656 .empty (.cutX 6400 (.cutY 6912 .full .empty) .empty)) (.cutY 6656 (.cutX 6912 (.cutY 6400 .full .empty) .empty) .empty)) .empty) .empty))))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 (.cutY 26624 (.cutX 25600 .empty (.cutY 25600 .empty (.cutX 26112 (.cutY 26112 .empty (.cutX 25856 .empty (.cutY 26368 .empty .full))) (.cutY 26112 (.cutX 26368 .empty (.cutY 25856 .empty .full)) .empty)))) .empty) .empty) .empty) .empty)))))

theorem metadata123 : 0<321493533 ∧ 24<128 ∧ 26<128 ∧ 0<4 ∧
    2522/4160=0 ∧ 2522%4160=2522 ∧ ∀ i, (leaves123 i).Valid 8 := by decide +kernel

theorem checked123 : gridTreeUnionCheck 32768 raw123 output123 cover123 source123 tree123 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits123 : gridUnionAreaUnits output123 = 262144 := by decide +kernel

noncomputable def phaseMass123 : ℝ := singlePhaseMass (321493533/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw123 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass123_eq : phaseMass123 = (321493533/1638400000000 : ℝ) := by
  unfold phaseMass123
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw123 output123 cover123 source123
    (gridTreeUnionCheck_sound 32768 raw123 output123 cover123 source123 tree123 checked123)
    _ (by norm_num) _,areaUnits123]
  norm_num

-- Frozen phase 156, atom 2521, type 0, source (24,25).
def leavesData124 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves124 (i : Fin 1) : DyadicLeaf := leavesData124.getD i.val ⟨0,0,0⟩
def raw124 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 24 25 leaves124 i
def outputData124 : Array GridBox := #[⟨6144,6400,6400,6656⟩,⟨6400,6656,6144,6400⟩,⟨26112,26368,26368,26624⟩,⟨26368,26624,26112,26368⟩]
def output124 (i : Fin 4) : GridBox := outputData124.getD i.val ⟨0,0,0,0⟩
def coverData124 : Array ℕ := #[0,1,3,2]
def sourceData124 : Array ℕ := #[0,1,3,2]
def cover124 (i : Fin 4) : Fin 4 := ⟨coverData124.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source124 (i : Fin 4) : Fin 4 := ⟨sourceData124.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree124 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 .empty (.cutY 6144 .empty (.cutX 7168 (.cutY 7168 (.cutX 6656 (.cutY 6656 (.cutX 6400 (.cutY 6400 .empty .full) (.cutY 6400 .full .empty)) .empty) .empty) .empty) .empty))))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 (.cutY 26624 (.cutX 25600 .empty (.cutY 25600 .empty (.cutX 26112 .empty (.cutY 26112 .empty (.cutX 26368 (.cutY 26368 .empty .full) (.cutY 26368 .full .empty)))))) .empty) .empty) .empty) .empty)))))

theorem metadata124 : 0<321493533 ∧ 24<128 ∧ 25<128 ∧ 0<4 ∧
    2521/4160=0 ∧ 2521%4160=2521 ∧ ∀ i, (leaves124 i).Valid 8 := by decide +kernel

theorem checked124 : gridTreeUnionCheck 32768 raw124 output124 cover124 source124 tree124 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits124 : gridUnionAreaUnits output124 = 262144 := by decide +kernel

noncomputable def phaseMass124 : ℝ := singlePhaseMass (321493533/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw124 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass124_eq : phaseMass124 = (321493533/1638400000000 : ℝ) := by
  unfold phaseMass124
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw124 output124 cover124 source124
    (gridTreeUnionCheck_sound 32768 raw124 output124 cover124 source124 tree124 checked124)
    _ (by norm_num) _,areaUnits124]
  norm_num

-- Frozen phase 157, atom 2520, type 0, source (24,24).
def leavesData125 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves125 (i : Fin 1) : DyadicLeaf := leavesData125.getD i.val ⟨0,0,0⟩
def raw125 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 24 24 leaves125 i
def outputData125 : Array GridBox := #[⟨6144,6400,6144,6400⟩,⟨26368,26624,26368,26624⟩]
def output125 (i : Fin 2) : GridBox := outputData125.getD i.val ⟨0,0,0,0⟩
def coverData125 : Array ℕ := #[0,0,1,1]
def sourceData125 : Array ℕ := #[0,2]
def cover125 (i : Fin 4) : Fin 2 := ⟨coverData125.getD i.val 0 % 2,Nat.mod_lt _ (by decide)⟩
def source125 (i : Fin 2) : Fin 4 := ⟨sourceData125.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree125 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 .empty (.cutY 6144 .empty (.cutX 7168 (.cutY 7168 (.cutX 6656 (.cutY 6656 (.cutX 6400 (.cutY 6400 .full .empty) .empty) .empty) .empty) .empty) .empty))))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 (.cutY 26624 (.cutX 25600 .empty (.cutY 25600 .empty (.cutX 26112 .empty (.cutY 26112 .empty (.cutX 26368 .empty (.cutY 26368 .empty .full)))))) .empty) .empty) .empty) .empty)))))

theorem metadata125 : 0<321493533 ∧ 24<128 ∧ 24<128 ∧ 0<4 ∧
    2520/4160=0 ∧ 2520%4160=2520 ∧ ∀ i, (leaves125 i).Valid 8 := by decide +kernel

theorem checked125 : gridTreeUnionCheck 32768 raw125 output125 cover125 source125 tree125 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits125 : gridUnionAreaUnits output125 = 131072 := by decide +kernel

noncomputable def phaseMass125 : ℝ := singlePhaseMass (321493533/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw125 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass125_eq : phaseMass125 = (321493533/3276800000000 : ℝ) := by
  unfold phaseMass125
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw125 output125 cover125 source125
    (gridTreeUnionCheck_sound 32768 raw125 output125 cover125 source125 tree125 checked125)
    _ (by norm_num) _,areaUnits125]
  norm_num

-- Frozen phase 158, atom 2441, type 0, source (23,26).
def leavesData126 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves126 (i : Fin 1) : DyadicLeaf := leavesData126.getD i.val ⟨0,0,0⟩
def raw126 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 23 26 leaves126 i
def outputData126 : Array GridBox := #[⟨5888,6144,6656,6912⟩,⟨6656,6912,5888,6144⟩,⟨25856,26112,26624,26880⟩,⟨26624,26880,25856,26112⟩]
def output126 (i : Fin 4) : GridBox := outputData126.getD i.val ⟨0,0,0,0⟩
def coverData126 : Array ℕ := #[0,1,3,2]
def sourceData126 : Array ℕ := #[0,1,3,2]
def cover126 (i : Fin 4) : Fin 4 := ⟨coverData126.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source126 (i : Fin 4) : Fin 4 := ⟨sourceData126.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree126 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 (.cutY 6144 .empty (.cutX 5120 .empty (.cutY 7168 (.cutX 5632 .empty (.cutY 6656 .empty (.cutX 5888 .empty (.cutY 6912 .full .empty)))) .empty))) (.cutY 6144 (.cutX 7168 (.cutY 5120 .empty (.cutX 6656 .empty (.cutY 5632 .empty (.cutX 6912 (.cutY 5888 .empty .full) .empty)))) .empty) .empty)))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 (.cutY 26624 .empty (.cutX 25600 .empty (.cutY 27648 (.cutX 26112 (.cutY 27136 (.cutX 25856 .empty (.cutY 26880 .full .empty)) .empty) .empty) .empty))) (.cutY 26624 (.cutX 27648 (.cutY 25600 .empty (.cutX 27136 (.cutY 26112 (.cutX 26880 (.cutY 25856 .empty .full) .empty) .empty) .empty)) .empty) .empty)) .empty) .empty)))))

theorem metadata126 : 0<327195324 ∧ 23<128 ∧ 26<128 ∧ 0<4 ∧
    2441/4160=0 ∧ 2441%4160=2441 ∧ ∀ i, (leaves126 i).Valid 8 := by decide +kernel

theorem checked126 : gridTreeUnionCheck 32768 raw126 output126 cover126 source126 tree126 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits126 : gridUnionAreaUnits output126 = 262144 := by decide +kernel

noncomputable def phaseMass126 : ℝ := singlePhaseMass (327195324/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw126 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass126_eq : phaseMass126 = (81798831/409600000000 : ℝ) := by
  unfold phaseMass126
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw126 output126 cover126 source126
    (gridTreeUnionCheck_sound 32768 raw126 output126 cover126 source126 tree126 checked126)
    _ (by norm_num) _,areaUnits126]
  norm_num

-- Frozen phase 159, atom 2440, type 0, source (23,25).
def leavesData127 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves127 (i : Fin 1) : DyadicLeaf := leavesData127.getD i.val ⟨0,0,0⟩
def raw127 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 23 25 leaves127 i
def outputData127 : Array GridBox := #[⟨5888,6144,6400,6656⟩,⟨6400,6656,5888,6144⟩,⟨26112,26368,26624,26880⟩,⟨26624,26880,26112,26368⟩]
def output127 (i : Fin 4) : GridBox := outputData127.getD i.val ⟨0,0,0,0⟩
def coverData127 : Array ℕ := #[0,1,3,2]
def sourceData127 : Array ℕ := #[0,1,3,2]
def cover127 (i : Fin 4) : Fin 4 := ⟨coverData127.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source127 (i : Fin 4) : Fin 4 := ⟨sourceData127.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree127 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 (.cutY 6144 .empty (.cutX 5120 .empty (.cutY 7168 (.cutX 5632 .empty (.cutY 6656 (.cutX 5888 .empty (.cutY 6400 .empty .full)) .empty)) .empty))) (.cutY 6144 (.cutX 7168 (.cutY 5120 .empty (.cutX 6656 (.cutY 5632 .empty (.cutX 6400 .empty (.cutY 5888 .empty .full))) .empty)) .empty) .empty)))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 (.cutY 26624 .empty (.cutX 25600 .empty (.cutY 27648 (.cutX 26112 .empty (.cutY 27136 (.cutX 26368 (.cutY 26880 .full .empty) .empty) .empty)) .empty))) (.cutY 26624 (.cutX 27648 (.cutY 25600 .empty (.cutX 27136 (.cutY 26112 .empty (.cutX 26880 (.cutY 26368 .full .empty) .empty)) .empty)) .empty) .empty)) .empty) .empty)))))

theorem metadata127 : 0<327195324 ∧ 23<128 ∧ 25<128 ∧ 0<4 ∧
    2440/4160=0 ∧ 2440%4160=2440 ∧ ∀ i, (leaves127 i).Valid 8 := by decide +kernel

theorem checked127 : gridTreeUnionCheck 32768 raw127 output127 cover127 source127 tree127 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits127 : gridUnionAreaUnits output127 = 262144 := by decide +kernel

noncomputable def phaseMass127 : ℝ := singlePhaseMass (327195324/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw127 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass127_eq : phaseMass127 = (81798831/409600000000 : ℝ) := by
  unfold phaseMass127
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw127 output127 cover127 source127
    (gridTreeUnionCheck_sound 32768 raw127 output127 cover127 source127 tree127 checked127)
    _ (by norm_num) _,areaUnits127]
  norm_num

noncomputable def batchActualMass : ℝ := [phaseMass0,phaseMass1,phaseMass2,phaseMass3,phaseMass4,phaseMass5,phaseMass6,phaseMass7,phaseMass8,phaseMass9,phaseMass10,phaseMass11,phaseMass12,phaseMass13,phaseMass14,phaseMass15,phaseMass16,phaseMass17,phaseMass18,phaseMass19,phaseMass20,phaseMass21,phaseMass22,phaseMass23,phaseMass24,phaseMass25,phaseMass26,phaseMass27,phaseMass28,phaseMass29,phaseMass30,phaseMass31,phaseMass32,phaseMass33,phaseMass34,phaseMass35,phaseMass36,phaseMass37,phaseMass38,phaseMass39,phaseMass40,phaseMass41,phaseMass42,phaseMass43,phaseMass44,phaseMass45,phaseMass46,phaseMass47,phaseMass48,phaseMass49,phaseMass50,phaseMass51,phaseMass52,phaseMass53,phaseMass54,phaseMass55,phaseMass56,phaseMass57,phaseMass58,phaseMass59,phaseMass60,phaseMass61,phaseMass62,phaseMass63,phaseMass64,phaseMass65,phaseMass66,phaseMass67,phaseMass68,phaseMass69,phaseMass70,phaseMass71,phaseMass72,phaseMass73,phaseMass74,phaseMass75,phaseMass76,phaseMass77,phaseMass78,phaseMass79,phaseMass80,phaseMass81,phaseMass82,phaseMass83,phaseMass84,phaseMass85,phaseMass86,phaseMass87,phaseMass88,phaseMass89,phaseMass90,phaseMass91,phaseMass92,phaseMass93,phaseMass94,phaseMass95,phaseMass96,phaseMass97,phaseMass98,phaseMass99,phaseMass100,phaseMass101,phaseMass102,phaseMass103,phaseMass104,phaseMass105,phaseMass106,phaseMass107,phaseMass108,phaseMass109,phaseMass110,phaseMass111,phaseMass112,phaseMass113,phaseMass114,phaseMass115,phaseMass116,phaseMass117,phaseMass118,phaseMass119,phaseMass120,phaseMass121,phaseMass122,phaseMass123,phaseMass124,phaseMass125,phaseMass126,phaseMass127].sum

theorem actual_batch_mass : batchActualMass = (12521994747/655360000000 : ℝ) := by
  unfold batchActualMass
  rw [phaseMass0_eq,phaseMass1_eq,phaseMass2_eq,phaseMass3_eq,phaseMass4_eq,phaseMass5_eq,phaseMass6_eq,phaseMass7_eq,phaseMass8_eq,phaseMass9_eq,phaseMass10_eq,phaseMass11_eq,phaseMass12_eq,phaseMass13_eq,phaseMass14_eq,phaseMass15_eq,phaseMass16_eq,phaseMass17_eq,phaseMass18_eq,phaseMass19_eq,phaseMass20_eq,phaseMass21_eq,phaseMass22_eq,phaseMass23_eq,phaseMass24_eq,phaseMass25_eq,phaseMass26_eq,phaseMass27_eq,phaseMass28_eq,phaseMass29_eq,phaseMass30_eq,phaseMass31_eq,phaseMass32_eq,phaseMass33_eq,phaseMass34_eq,phaseMass35_eq,phaseMass36_eq,phaseMass37_eq,phaseMass38_eq,phaseMass39_eq,phaseMass40_eq,phaseMass41_eq,phaseMass42_eq,phaseMass43_eq,phaseMass44_eq,phaseMass45_eq,phaseMass46_eq,phaseMass47_eq,phaseMass48_eq,phaseMass49_eq,phaseMass50_eq,phaseMass51_eq,phaseMass52_eq,phaseMass53_eq,phaseMass54_eq,phaseMass55_eq,phaseMass56_eq,phaseMass57_eq,phaseMass58_eq,phaseMass59_eq,phaseMass60_eq,phaseMass61_eq,phaseMass62_eq,phaseMass63_eq,phaseMass64_eq,phaseMass65_eq,phaseMass66_eq,phaseMass67_eq,phaseMass68_eq,phaseMass69_eq,phaseMass70_eq,phaseMass71_eq,phaseMass72_eq,phaseMass73_eq,phaseMass74_eq,phaseMass75_eq,phaseMass76_eq,phaseMass77_eq,phaseMass78_eq,phaseMass79_eq,phaseMass80_eq,phaseMass81_eq,phaseMass82_eq,phaseMass83_eq,phaseMass84_eq,phaseMass85_eq,phaseMass86_eq,phaseMass87_eq,phaseMass88_eq,phaseMass89_eq,phaseMass90_eq,phaseMass91_eq,phaseMass92_eq,phaseMass93_eq,phaseMass94_eq,phaseMass95_eq,phaseMass96_eq,phaseMass97_eq,phaseMass98_eq,phaseMass99_eq,phaseMass100_eq,phaseMass101_eq,phaseMass102_eq,phaseMass103_eq,phaseMass104_eq,phaseMass105_eq,phaseMass106_eq,phaseMass107_eq,phaseMass108_eq,phaseMass109_eq,phaseMass110_eq,phaseMass111_eq,phaseMass112_eq,phaseMass113_eq,phaseMass114_eq,phaseMass115_eq,phaseMass116_eq,phaseMass117_eq,phaseMass118_eq,phaseMass119_eq,phaseMass120_eq,phaseMass121_eq,phaseMass122_eq,phaseMass123_eq,phaseMass124_eq,phaseMass125_eq,phaseMass126_eq,phaseMass127_eq]
  norm_num

end NoThreeLine.ScheduleUnionBatch00032

#print axioms NoThreeLine.ScheduleUnionBatch00032.actual_batch_mass
