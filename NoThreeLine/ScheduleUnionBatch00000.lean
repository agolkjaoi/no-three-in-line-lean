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

namespace NoThreeLine.ScheduleUnionBatch00000

-- Frozen phase 0, atom 4159, type 0, source (63,64).
def leavesData0 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves0 (i : Fin 1) : DyadicLeaf := leavesData0.getD i.val ⟨0,0,0⟩
def raw0 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 63 64 leaves0 i
def outputData0 : Array GridBox := #[⟨16128,16384,16384,16640⟩,⟨16384,16640,16128,16384⟩]
def output0 (i : Fin 2) : GridBox := outputData0.getD i.val ⟨0,0,0,0⟩
def coverData0 : Array ℕ := #[0,1,1,0]
def sourceData0 : Array ℕ := #[0,1]
def cover0 (i : Fin 4) : Fin 2 := ⟨coverData0.getD i.val 0 % 2,Nat.mod_lt _ (by decide)⟩
def source0 (i : Fin 2) : Fin 4 := ⟨sourceData0.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree0 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 .empty (.cutY 20480 (.cutX 14336 .empty (.cutY 18432 (.cutX 15360 .empty (.cutY 17408 (.cutX 15872 .empty (.cutY 16896 (.cutX 16128 .empty (.cutY 16640 .full .empty)) .empty)) .empty)) .empty)) .empty)) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 .empty (.cutX 18432 (.cutY 14336 .empty (.cutX 17408 (.cutY 15360 .empty (.cutX 16896 (.cutY 15872 .empty (.cutX 16640 (.cutY 16128 .empty .full) .empty)) .empty)) .empty)) .empty)) .empty)) .empty) .empty))

theorem metadata0 : 0<319013231 ∧ 63<128 ∧ 64<128 ∧ 0<4 ∧
    4159/4160=0 ∧ 4159%4160=4159 ∧ ∀ i, (leaves0 i).Valid 8 := by decide +kernel

theorem checked0 : gridTreeUnionCheck 32768 raw0 output0 cover0 source0 tree0 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits0 : gridUnionAreaUnits output0 = 131072 := by decide +kernel

noncomputable def phaseMass0 : ℝ := singlePhaseMass (319013231/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw0 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass0_eq : phaseMass0 = (319013231/3276800000000 : ℝ) := by
  unfold phaseMass0
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw0 output0 cover0 source0
    (gridTreeUnionCheck_sound 32768 raw0 output0 cover0 source0 tree0 checked0)
    _ (by norm_num) _,areaUnits0]
  norm_num

-- Frozen phase 1, atom 4158, type 0, source (63,63).
def leavesData1 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves1 (i : Fin 1) : DyadicLeaf := leavesData1.getD i.val ⟨0,0,0⟩
def raw1 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 63 63 leaves1 i
def outputData1 : Array GridBox := #[⟨16128,16384,16128,16384⟩,⟨16384,16640,16384,16640⟩]
def output1 (i : Fin 2) : GridBox := outputData1.getD i.val ⟨0,0,0,0⟩
def coverData1 : Array ℕ := #[0,0,1,1]
def sourceData1 : Array ℕ := #[0,2]
def cover1 (i : Fin 4) : Fin 2 := ⟨coverData1.getD i.val 0 % 2,Nat.mod_lt _ (by decide)⟩
def source1 (i : Fin 2) : Fin 4 := ⟨sourceData1.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree1 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 .empty (.cutY 14336 .empty (.cutX 15360 .empty (.cutY 15360 .empty (.cutX 15872 .empty (.cutY 15872 .empty (.cutX 16128 .empty (.cutY 16128 .empty .full)))))))))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 (.cutY 18432 (.cutX 17408 (.cutY 17408 (.cutX 16896 (.cutY 16896 (.cutX 16640 (.cutY 16640 .full .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty)))

theorem metadata1 : 0<148355083 ∧ 63<128 ∧ 63<128 ∧ 0<4 ∧
    4158/4160=0 ∧ 4158%4160=4158 ∧ ∀ i, (leaves1 i).Valid 8 := by decide +kernel

theorem checked1 : gridTreeUnionCheck 32768 raw1 output1 cover1 source1 tree1 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits1 : gridUnionAreaUnits output1 = 131072 := by decide +kernel

noncomputable def phaseMass1 : ℝ := singlePhaseMass (148355083/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw1 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass1_eq : phaseMass1 = (148355083/3276800000000 : ℝ) := by
  unfold phaseMass1
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw1 output1 cover1 source1
    (gridTreeUnionCheck_sound 32768 raw1 output1 cover1 source1 tree1 checked1)
    _ (by norm_num) _,areaUnits1]
  norm_num

-- Frozen phase 2, atom 4157, type 0, source (62,65).
def leavesData2 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves2 (i : Fin 1) : DyadicLeaf := leavesData2.getD i.val ⟨0,0,0⟩
def raw2 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 62 65 leaves2 i
def outputData2 : Array GridBox := #[⟨15872,16128,16640,16896⟩,⟨16640,16896,15872,16128⟩]
def output2 (i : Fin 2) : GridBox := outputData2.getD i.val ⟨0,0,0,0⟩
def coverData2 : Array ℕ := #[0,1,1,0]
def sourceData2 : Array ℕ := #[0,1]
def cover2 (i : Fin 4) : Fin 2 := ⟨coverData2.getD i.val 0 % 2,Nat.mod_lt _ (by decide)⟩
def source2 (i : Fin 2) : Fin 4 := ⟨sourceData2.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree2 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 .empty (.cutY 20480 (.cutX 14336 .empty (.cutY 18432 (.cutX 15360 .empty (.cutY 17408 (.cutX 15872 .empty (.cutY 16896 (.cutX 16128 (.cutY 16640 .empty .full) .empty) .empty)) .empty)) .empty)) .empty)) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 .empty (.cutX 18432 (.cutY 14336 .empty (.cutX 17408 (.cutY 15360 .empty (.cutX 16896 (.cutY 15872 .empty (.cutX 16640 .empty (.cutY 16128 .full .empty))) .empty)) .empty)) .empty)) .empty)) .empty) .empty))

theorem metadata2 : 0<319013231 ∧ 62<128 ∧ 65<128 ∧ 0<4 ∧
    4157/4160=0 ∧ 4157%4160=4157 ∧ ∀ i, (leaves2 i).Valid 8 := by decide +kernel

theorem checked2 : gridTreeUnionCheck 32768 raw2 output2 cover2 source2 tree2 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits2 : gridUnionAreaUnits output2 = 131072 := by decide +kernel

noncomputable def phaseMass2 : ℝ := singlePhaseMass (319013231/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw2 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass2_eq : phaseMass2 = (319013231/3276800000000 : ℝ) := by
  unfold phaseMass2
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw2 output2 cover2 source2
    (gridTreeUnionCheck_sound 32768 raw2 output2 cover2 source2 tree2 checked2)
    _ (by norm_num) _,areaUnits2]
  norm_num

-- Frozen phase 3, atom 4156, type 0, source (62,64).
def leavesData3 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves3 (i : Fin 1) : DyadicLeaf := leavesData3.getD i.val ⟨0,0,0⟩
def raw3 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 62 64 leaves3 i
def outputData3 : Array GridBox := #[⟨15872,16128,16384,16640⟩,⟨16128,16384,16640,16896⟩,⟨16384,16640,15872,16128⟩,⟨16640,16896,16128,16384⟩]
def output3 (i : Fin 4) : GridBox := outputData3.getD i.val ⟨0,0,0,0⟩
def coverData3 : Array ℕ := #[0,2,3,1]
def sourceData3 : Array ℕ := #[0,3,1,2]
def cover3 (i : Fin 4) : Fin 4 := ⟨coverData3.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source3 (i : Fin 4) : Fin 4 := ⟨sourceData3.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree3 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 .empty (.cutY 20480 (.cutX 14336 .empty (.cutY 18432 (.cutX 15360 .empty (.cutY 17408 (.cutX 15872 .empty (.cutY 16896 (.cutX 16128 (.cutY 16640 .full .empty) (.cutY 16640 .empty .full)) .empty)) .empty)) .empty)) .empty)) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 .empty (.cutX 18432 (.cutY 14336 .empty (.cutX 17408 (.cutY 15360 .empty (.cutX 16896 (.cutY 15872 .empty (.cutX 16640 (.cutY 16128 .full .empty) (.cutY 16128 .empty .full))) .empty)) .empty)) .empty)) .empty)) .empty) .empty))

theorem metadata3 : 0<319013231 ∧ 62<128 ∧ 64<128 ∧ 0<4 ∧
    4156/4160=0 ∧ 4156%4160=4156 ∧ ∀ i, (leaves3 i).Valid 8 := by decide +kernel

theorem checked3 : gridTreeUnionCheck 32768 raw3 output3 cover3 source3 tree3 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits3 : gridUnionAreaUnits output3 = 262144 := by decide +kernel

noncomputable def phaseMass3 : ℝ := singlePhaseMass (319013231/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw3 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass3_eq : phaseMass3 = (319013231/1638400000000 : ℝ) := by
  unfold phaseMass3
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw3 output3 cover3 source3
    (gridTreeUnionCheck_sound 32768 raw3 output3 cover3 source3 tree3 checked3)
    _ (by norm_num) _,areaUnits3]
  norm_num

-- Frozen phase 4, atom 4155, type 0, source (62,63).
def leavesData4 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves4 (i : Fin 1) : DyadicLeaf := leavesData4.getD i.val ⟨0,0,0⟩
def raw4 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 62 63 leaves4 i
def outputData4 : Array GridBox := #[⟨15872,16128,16128,16384⟩,⟨16128,16384,15872,16128⟩,⟨16384,16640,16640,16896⟩,⟨16640,16896,16384,16640⟩]
def output4 (i : Fin 4) : GridBox := outputData4.getD i.val ⟨0,0,0,0⟩
def coverData4 : Array ℕ := #[0,1,3,2]
def sourceData4 : Array ℕ := #[0,1,3,2]
def cover4 (i : Fin 4) : Fin 4 := ⟨coverData4.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source4 (i : Fin 4) : Fin 4 := ⟨sourceData4.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree4 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 .empty (.cutY 14336 .empty (.cutX 15360 .empty (.cutY 15360 .empty (.cutX 15872 .empty (.cutY 15872 .empty (.cutX 16128 (.cutY 16128 .empty .full) (.cutY 16128 .full .empty)))))))))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 (.cutY 18432 (.cutX 17408 (.cutY 17408 (.cutX 16896 (.cutY 16896 (.cutX 16640 (.cutY 16640 .empty .full) (.cutY 16640 .full .empty)) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty)))

theorem metadata4 : 0<148355083 ∧ 62<128 ∧ 63<128 ∧ 0<4 ∧
    4155/4160=0 ∧ 4155%4160=4155 ∧ ∀ i, (leaves4 i).Valid 8 := by decide +kernel

theorem checked4 : gridTreeUnionCheck 32768 raw4 output4 cover4 source4 tree4 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits4 : gridUnionAreaUnits output4 = 262144 := by decide +kernel

noncomputable def phaseMass4 : ℝ := singlePhaseMass (148355083/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw4 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass4_eq : phaseMass4 = (148355083/1638400000000 : ℝ) := by
  unfold phaseMass4
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw4 output4 cover4 source4
    (gridTreeUnionCheck_sound 32768 raw4 output4 cover4 source4 tree4 checked4)
    _ (by norm_num) _,areaUnits4]
  norm_num

-- Frozen phase 5, atom 4151, type 0, source (61,64).
def leavesData5 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves5 (i : Fin 1) : DyadicLeaf := leavesData5.getD i.val ⟨0,0,0⟩
def raw5 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 61 64 leaves5 i
def outputData5 : Array GridBox := #[⟨15616,15872,16384,16640⟩,⟨16128,16384,16896,17152⟩,⟨16384,16640,15616,15872⟩,⟨16896,17152,16128,16384⟩]
def output5 (i : Fin 4) : GridBox := outputData5.getD i.val ⟨0,0,0,0⟩
def coverData5 : Array ℕ := #[0,2,3,1]
def sourceData5 : Array ℕ := #[0,3,1,2]
def cover5 (i : Fin 4) : Fin 4 := ⟨coverData5.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source5 (i : Fin 4) : Fin 4 := ⟨sourceData5.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree5 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 .empty (.cutY 20480 (.cutX 14336 .empty (.cutY 18432 (.cutX 15360 .empty (.cutY 17408 (.cutX 15872 (.cutY 16896 (.cutX 15616 .empty (.cutY 16640 .full .empty)) .empty) (.cutY 16896 .empty (.cutX 16128 .empty (.cutY 17152 .full .empty)))) .empty)) .empty)) .empty)) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 .empty (.cutX 18432 (.cutY 14336 .empty (.cutX 17408 (.cutY 15360 .empty (.cutX 16896 (.cutY 15872 (.cutX 16640 (.cutY 15616 .empty .full) .empty) .empty) (.cutY 15872 .empty (.cutX 17152 (.cutY 16128 .empty .full) .empty)))) .empty)) .empty)) .empty)) .empty) .empty))

theorem metadata5 : 0<319013231 ∧ 61<128 ∧ 64<128 ∧ 0<4 ∧
    4151/4160=0 ∧ 4151%4160=4151 ∧ ∀ i, (leaves5 i).Valid 8 := by decide +kernel

theorem checked5 : gridTreeUnionCheck 32768 raw5 output5 cover5 source5 tree5 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits5 : gridUnionAreaUnits output5 = 262144 := by decide +kernel

noncomputable def phaseMass5 : ℝ := singlePhaseMass (319013231/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw5 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass5_eq : phaseMass5 = (319013231/1638400000000 : ℝ) := by
  unfold phaseMass5
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw5 output5 cover5 source5
    (gridTreeUnionCheck_sound 32768 raw5 output5 cover5 source5 tree5 checked5)
    _ (by norm_num) _,areaUnits5]
  norm_num

-- Frozen phase 6, atom 4150, type 0, source (61,63).
def leavesData6 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves6 (i : Fin 1) : DyadicLeaf := leavesData6.getD i.val ⟨0,0,0⟩
def raw6 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 61 63 leaves6 i
def outputData6 : Array GridBox := #[⟨15616,15872,16128,16384⟩,⟨16128,16384,15616,15872⟩,⟨16384,16640,16896,17152⟩,⟨16896,17152,16384,16640⟩]
def output6 (i : Fin 4) : GridBox := outputData6.getD i.val ⟨0,0,0,0⟩
def coverData6 : Array ℕ := #[0,1,3,2]
def sourceData6 : Array ℕ := #[0,1,3,2]
def cover6 (i : Fin 4) : Fin 4 := ⟨coverData6.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source6 (i : Fin 4) : Fin 4 := ⟨sourceData6.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree6 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 .empty (.cutY 14336 .empty (.cutX 15360 .empty (.cutY 15360 .empty (.cutX 15872 (.cutY 15872 .empty (.cutX 15616 .empty (.cutY 16128 .empty .full))) (.cutY 15872 (.cutX 16128 .empty (.cutY 15616 .empty .full)) .empty)))))))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 (.cutY 18432 (.cutX 17408 (.cutY 17408 (.cutX 16896 (.cutY 16896 .empty (.cutX 16640 (.cutY 17152 .full .empty) .empty)) (.cutY 16896 (.cutX 17152 (.cutY 16640 .full .empty) .empty) .empty)) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty)))

theorem metadata6 : 0<148355083 ∧ 61<128 ∧ 63<128 ∧ 0<4 ∧
    4150/4160=0 ∧ 4150%4160=4150 ∧ ∀ i, (leaves6 i).Valid 8 := by decide +kernel

theorem checked6 : gridTreeUnionCheck 32768 raw6 output6 cover6 source6 tree6 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits6 : gridUnionAreaUnits output6 = 262144 := by decide +kernel

noncomputable def phaseMass6 : ℝ := singlePhaseMass (148355083/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw6 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass6_eq : phaseMass6 = (148355083/1638400000000 : ℝ) := by
  unfold phaseMass6
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw6 output6 cover6 source6
    (gridTreeUnionCheck_sound 32768 raw6 output6 cover6 source6 tree6 checked6)
    _ (by norm_num) _,areaUnits6]
  norm_num

-- Frozen phase 7, atom 4154, type 0, source (62,62).
def leavesData7 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves7 (i : Fin 1) : DyadicLeaf := leavesData7.getD i.val ⟨0,0,0⟩
def raw7 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 62 62 leaves7 i
def outputData7 : Array GridBox := #[⟨15872,16128,15872,16128⟩,⟨16640,16896,16640,16896⟩]
def output7 (i : Fin 2) : GridBox := outputData7.getD i.val ⟨0,0,0,0⟩
def coverData7 : Array ℕ := #[0,0,1,1]
def sourceData7 : Array ℕ := #[0,2]
def cover7 (i : Fin 4) : Fin 2 := ⟨coverData7.getD i.val 0 % 2,Nat.mod_lt _ (by decide)⟩
def source7 (i : Fin 2) : Fin 4 := ⟨sourceData7.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree7 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 .empty (.cutY 14336 .empty (.cutX 15360 .empty (.cutY 15360 .empty (.cutX 15872 .empty (.cutY 15872 .empty (.cutX 16128 (.cutY 16128 .full .empty) .empty))))))))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 (.cutY 18432 (.cutX 17408 (.cutY 17408 (.cutX 16896 (.cutY 16896 (.cutX 16640 .empty (.cutY 16640 .empty .full)) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty)))

theorem metadata7 : 0<148355083 ∧ 62<128 ∧ 62<128 ∧ 0<4 ∧
    4154/4160=0 ∧ 4154%4160=4154 ∧ ∀ i, (leaves7 i).Valid 8 := by decide +kernel

theorem checked7 : gridTreeUnionCheck 32768 raw7 output7 cover7 source7 tree7 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits7 : gridUnionAreaUnits output7 = 131072 := by decide +kernel

noncomputable def phaseMass7 : ℝ := singlePhaseMass (148355083/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw7 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass7_eq : phaseMass7 = (148355083/3276800000000 : ℝ) := by
  unfold phaseMass7
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw7 output7 cover7 source7
    (gridTreeUnionCheck_sound 32768 raw7 output7 cover7 source7 tree7 checked7)
    _ (by norm_num) _,areaUnits7]
  norm_num

-- Frozen phase 8, atom 4149, type 0, source (61,62).
def leavesData8 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves8 (i : Fin 1) : DyadicLeaf := leavesData8.getD i.val ⟨0,0,0⟩
def raw8 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 61 62 leaves8 i
def outputData8 : Array GridBox := #[⟨15616,15872,15872,16128⟩,⟨15872,16128,15616,15872⟩,⟨16640,16896,16896,17152⟩,⟨16896,17152,16640,16896⟩]
def output8 (i : Fin 4) : GridBox := outputData8.getD i.val ⟨0,0,0,0⟩
def coverData8 : Array ℕ := #[0,1,3,2]
def sourceData8 : Array ℕ := #[0,1,3,2]
def cover8 (i : Fin 4) : Fin 4 := ⟨coverData8.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source8 (i : Fin 4) : Fin 4 := ⟨sourceData8.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree8 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 .empty (.cutY 14336 .empty (.cutX 15360 .empty (.cutY 15360 .empty (.cutX 15872 (.cutY 15872 .empty (.cutX 15616 .empty (.cutY 16128 .full .empty))) (.cutY 15872 (.cutX 16128 (.cutY 15616 .empty .full) .empty) .empty)))))))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 (.cutY 18432 (.cutX 17408 (.cutY 17408 (.cutX 16896 (.cutY 16896 .empty (.cutX 16640 .empty (.cutY 17152 .full .empty))) (.cutY 16896 (.cutX 17152 (.cutY 16640 .empty .full) .empty) .empty)) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty)))

theorem metadata8 : 0<148355083 ∧ 61<128 ∧ 62<128 ∧ 0<4 ∧
    4149/4160=0 ∧ 4149%4160=4149 ∧ ∀ i, (leaves8 i).Valid 8 := by decide +kernel

theorem checked8 : gridTreeUnionCheck 32768 raw8 output8 cover8 source8 tree8 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits8 : gridUnionAreaUnits output8 = 262144 := by decide +kernel

noncomputable def phaseMass8 : ℝ := singlePhaseMass (148355083/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw8 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass8_eq : phaseMass8 = (148355083/1638400000000 : ℝ) := by
  unfold phaseMass8
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw8 output8 cover8 source8
    (gridTreeUnionCheck_sound 32768 raw8 output8 cover8 source8 tree8 checked8)
    _ (by norm_num) _,areaUnits8]
  norm_num

-- Frozen phase 9, atom 4143, type 0, source (60,63).
def leavesData9 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves9 (i : Fin 1) : DyadicLeaf := leavesData9.getD i.val ⟨0,0,0⟩
def raw9 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 60 63 leaves9 i
def outputData9 : Array GridBox := #[⟨15360,15616,16128,16384⟩,⟨16128,16384,15360,15616⟩,⟨16384,16640,17152,17408⟩,⟨17152,17408,16384,16640⟩]
def output9 (i : Fin 4) : GridBox := outputData9.getD i.val ⟨0,0,0,0⟩
def coverData9 : Array ℕ := #[0,1,3,2]
def sourceData9 : Array ℕ := #[0,1,3,2]
def cover9 (i : Fin 4) : Fin 4 := ⟨coverData9.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source9 (i : Fin 4) : Fin 4 := ⟨sourceData9.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree9 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 .empty (.cutY 14336 .empty (.cutX 15360 .empty (.cutY 15360 .empty (.cutX 15872 (.cutY 15872 .empty (.cutX 15616 (.cutY 16128 .empty .full) .empty)) (.cutY 15872 (.cutX 16128 .empty (.cutY 15616 .full .empty)) .empty)))))))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 (.cutY 18432 (.cutX 17408 (.cutY 17408 (.cutX 16896 (.cutY 16896 .empty (.cutX 16640 (.cutY 17152 .empty .full) .empty)) (.cutY 16896 (.cutX 17152 .empty (.cutY 16640 .full .empty)) .empty)) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty)))

theorem metadata9 : 0<148355083 ∧ 60<128 ∧ 63<128 ∧ 0<4 ∧
    4143/4160=0 ∧ 4143%4160=4143 ∧ ∀ i, (leaves9 i).Valid 8 := by decide +kernel

theorem checked9 : gridTreeUnionCheck 32768 raw9 output9 cover9 source9 tree9 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits9 : gridUnionAreaUnits output9 = 262144 := by decide +kernel

noncomputable def phaseMass9 : ℝ := singlePhaseMass (148355083/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw9 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass9_eq : phaseMass9 = (148355083/1638400000000 : ℝ) := by
  unfold phaseMass9
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw9 output9 cover9 source9
    (gridTreeUnionCheck_sound 32768 raw9 output9 cover9 source9 tree9 checked9)
    _ (by norm_num) _,areaUnits9]
  norm_num

-- Frozen phase 10, atom 4148, type 0, source (61,61).
def leavesData10 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves10 (i : Fin 1) : DyadicLeaf := leavesData10.getD i.val ⟨0,0,0⟩
def raw10 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 61 61 leaves10 i
def outputData10 : Array GridBox := #[⟨15616,15872,15616,15872⟩,⟨16896,17152,16896,17152⟩]
def output10 (i : Fin 2) : GridBox := outputData10.getD i.val ⟨0,0,0,0⟩
def coverData10 : Array ℕ := #[0,0,1,1]
def sourceData10 : Array ℕ := #[0,2]
def cover10 (i : Fin 4) : Fin 2 := ⟨coverData10.getD i.val 0 % 2,Nat.mod_lt _ (by decide)⟩
def source10 (i : Fin 2) : Fin 4 := ⟨sourceData10.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree10 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 .empty (.cutY 14336 .empty (.cutX 15360 .empty (.cutY 15360 .empty (.cutX 15872 (.cutY 15872 (.cutX 15616 .empty (.cutY 15616 .empty .full)) .empty) .empty))))))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 (.cutY 18432 (.cutX 17408 (.cutY 17408 (.cutX 16896 .empty (.cutY 16896 .empty (.cutX 17152 (.cutY 17152 .full .empty) .empty))) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty)))

theorem metadata10 : 0<148355083 ∧ 61<128 ∧ 61<128 ∧ 0<4 ∧
    4148/4160=0 ∧ 4148%4160=4148 ∧ ∀ i, (leaves10 i).Valid 8 := by decide +kernel

theorem checked10 : gridTreeUnionCheck 32768 raw10 output10 cover10 source10 tree10 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits10 : gridUnionAreaUnits output10 = 131072 := by decide +kernel

noncomputable def phaseMass10 : ℝ := singlePhaseMass (148355083/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw10 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass10_eq : phaseMass10 = (148355083/3276800000000 : ℝ) := by
  unfold phaseMass10
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw10 output10 cover10 source10
    (gridTreeUnionCheck_sound 32768 raw10 output10 cover10 source10 tree10 checked10)
    _ (by norm_num) _,areaUnits10]
  norm_num

-- Frozen phase 11, atom 4142, type 0, source (60,62).
def leavesData11 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves11 (i : Fin 1) : DyadicLeaf := leavesData11.getD i.val ⟨0,0,0⟩
def raw11 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 60 62 leaves11 i
def outputData11 : Array GridBox := #[⟨15360,15616,15872,16128⟩,⟨15872,16128,15360,15616⟩,⟨16640,16896,17152,17408⟩,⟨17152,17408,16640,16896⟩]
def output11 (i : Fin 4) : GridBox := outputData11.getD i.val ⟨0,0,0,0⟩
def coverData11 : Array ℕ := #[0,1,3,2]
def sourceData11 : Array ℕ := #[0,1,3,2]
def cover11 (i : Fin 4) : Fin 4 := ⟨coverData11.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source11 (i : Fin 4) : Fin 4 := ⟨sourceData11.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree11 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 .empty (.cutY 14336 .empty (.cutX 15360 .empty (.cutY 15360 .empty (.cutX 15872 (.cutY 15872 .empty (.cutX 15616 (.cutY 16128 .full .empty) .empty)) (.cutY 15872 (.cutX 16128 (.cutY 15616 .full .empty) .empty) .empty)))))))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 (.cutY 18432 (.cutX 17408 (.cutY 17408 (.cutX 16896 (.cutY 16896 .empty (.cutX 16640 .empty (.cutY 17152 .empty .full))) (.cutY 16896 (.cutX 17152 .empty (.cutY 16640 .empty .full)) .empty)) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty)))

theorem metadata11 : 0<148355083 ∧ 60<128 ∧ 62<128 ∧ 0<4 ∧
    4142/4160=0 ∧ 4142%4160=4142 ∧ ∀ i, (leaves11 i).Valid 8 := by decide +kernel

theorem checked11 : gridTreeUnionCheck 32768 raw11 output11 cover11 source11 tree11 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits11 : gridUnionAreaUnits output11 = 262144 := by decide +kernel

noncomputable def phaseMass11 : ℝ := singlePhaseMass (148355083/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw11 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass11_eq : phaseMass11 = (148355083/1638400000000 : ℝ) := by
  unfold phaseMass11
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw11 output11 cover11 source11
    (gridTreeUnionCheck_sound 32768 raw11 output11 cover11 source11 tree11 checked11)
    _ (by norm_num) _,areaUnits11]
  norm_num

-- Frozen phase 12, atom 4141, type 0, source (60,61).
def leavesData12 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves12 (i : Fin 1) : DyadicLeaf := leavesData12.getD i.val ⟨0,0,0⟩
def raw12 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 60 61 leaves12 i
def outputData12 : Array GridBox := #[⟨15360,15616,15616,15872⟩,⟨15616,15872,15360,15616⟩,⟨16896,17152,17152,17408⟩,⟨17152,17408,16896,17152⟩]
def output12 (i : Fin 4) : GridBox := outputData12.getD i.val ⟨0,0,0,0⟩
def coverData12 : Array ℕ := #[0,1,3,2]
def sourceData12 : Array ℕ := #[0,1,3,2]
def cover12 (i : Fin 4) : Fin 4 := ⟨coverData12.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source12 (i : Fin 4) : Fin 4 := ⟨sourceData12.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree12 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 .empty (.cutY 14336 .empty (.cutX 15360 .empty (.cutY 15360 .empty (.cutX 15872 (.cutY 15872 (.cutX 15616 (.cutY 15616 .empty .full) (.cutY 15616 .full .empty)) .empty) .empty))))))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 (.cutY 18432 (.cutX 17408 (.cutY 17408 (.cutX 16896 .empty (.cutY 16896 .empty (.cutX 17152 (.cutY 17152 .empty .full) (.cutY 17152 .full .empty)))) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty)))

theorem metadata12 : 0<148355083 ∧ 60<128 ∧ 61<128 ∧ 0<4 ∧
    4141/4160=0 ∧ 4141%4160=4141 ∧ ∀ i, (leaves12 i).Valid 8 := by decide +kernel

theorem checked12 : gridTreeUnionCheck 32768 raw12 output12 cover12 source12 tree12 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits12 : gridUnionAreaUnits output12 = 262144 := by decide +kernel

noncomputable def phaseMass12 : ℝ := singlePhaseMass (148355083/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw12 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass12_eq : phaseMass12 = (148355083/1638400000000 : ℝ) := by
  unfold phaseMass12
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw12 output12 cover12 source12
    (gridTreeUnionCheck_sound 32768 raw12 output12 cover12 source12 tree12 checked12)
    _ (by norm_num) _,areaUnits12]
  norm_num

-- Frozen phase 13, atom 4140, type 0, source (60,60).
def leavesData13 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves13 (i : Fin 1) : DyadicLeaf := leavesData13.getD i.val ⟨0,0,0⟩
def raw13 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 60 60 leaves13 i
def outputData13 : Array GridBox := #[⟨15360,15616,15360,15616⟩,⟨17152,17408,17152,17408⟩]
def output13 (i : Fin 2) : GridBox := outputData13.getD i.val ⟨0,0,0,0⟩
def coverData13 : Array ℕ := #[0,0,1,1]
def sourceData13 : Array ℕ := #[0,2]
def cover13 (i : Fin 4) : Fin 2 := ⟨coverData13.getD i.val 0 % 2,Nat.mod_lt _ (by decide)⟩
def source13 (i : Fin 2) : Fin 4 := ⟨sourceData13.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree13 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 .empty (.cutY 14336 .empty (.cutX 15360 .empty (.cutY 15360 .empty (.cutX 15872 (.cutY 15872 (.cutX 15616 (.cutY 15616 .full .empty) .empty) .empty) .empty))))))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 (.cutY 18432 (.cutX 17408 (.cutY 17408 (.cutX 16896 .empty (.cutY 16896 .empty (.cutX 17152 .empty (.cutY 17152 .empty .full)))) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty)))

theorem metadata13 : 0<148355083 ∧ 60<128 ∧ 60<128 ∧ 0<4 ∧
    4140/4160=0 ∧ 4140%4160=4140 ∧ ∀ i, (leaves13 i).Valid 8 := by decide +kernel

theorem checked13 : gridTreeUnionCheck 32768 raw13 output13 cover13 source13 tree13 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits13 : gridUnionAreaUnits output13 = 131072 := by decide +kernel

noncomputable def phaseMass13 : ℝ := singlePhaseMass (148355083/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw13 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass13_eq : phaseMass13 = (148355083/3276800000000 : ℝ) := by
  unfold phaseMass13
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw13 output13 cover13 source13
    (gridTreeUnionCheck_sound 32768 raw13 output13 cover13 source13 tree13 checked13)
    _ (by norm_num) _,areaUnits13]
  norm_num

-- Frozen phase 14, atom 4133, type 0, source (59,62).
def leavesData14 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves14 (i : Fin 1) : DyadicLeaf := leavesData14.getD i.val ⟨0,0,0⟩
def raw14 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 59 62 leaves14 i
def outputData14 : Array GridBox := #[⟨15104,15360,15872,16128⟩,⟨15872,16128,15104,15360⟩,⟨16640,16896,17408,17664⟩,⟨17408,17664,16640,16896⟩]
def output14 (i : Fin 4) : GridBox := outputData14.getD i.val ⟨0,0,0,0⟩
def coverData14 : Array ℕ := #[0,1,3,2]
def sourceData14 : Array ℕ := #[0,1,3,2]
def cover14 (i : Fin 4) : Fin 4 := ⟨coverData14.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source14 (i : Fin 4) : Fin 4 := ⟨sourceData14.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree14 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 .empty (.cutY 14336 .empty (.cutX 15360 (.cutY 15360 .empty (.cutX 14848 .empty (.cutY 15872 .empty (.cutX 15104 .empty (.cutY 16128 .full .empty))))) (.cutY 15360 (.cutX 15872 .empty (.cutY 14848 .empty (.cutX 16128 (.cutY 15104 .empty .full) .empty))) .empty)))))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 (.cutY 18432 (.cutX 17408 (.cutY 17408 .empty (.cutX 16896 (.cutY 17920 (.cutX 16640 .empty (.cutY 17664 .full .empty)) .empty) .empty)) (.cutY 17408 (.cutX 17920 (.cutY 16896 (.cutX 17664 (.cutY 16640 .empty .full) .empty) .empty) .empty) .empty)) .empty) .empty) .empty) .empty) .empty) .empty)))

theorem metadata14 : 0<148355083 ∧ 59<128 ∧ 62<128 ∧ 0<4 ∧
    4133/4160=0 ∧ 4133%4160=4133 ∧ ∀ i, (leaves14 i).Valid 8 := by decide +kernel

theorem checked14 : gridTreeUnionCheck 32768 raw14 output14 cover14 source14 tree14 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits14 : gridUnionAreaUnits output14 = 262144 := by decide +kernel

noncomputable def phaseMass14 : ℝ := singlePhaseMass (148355083/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw14 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass14_eq : phaseMass14 = (148355083/1638400000000 : ℝ) := by
  unfold phaseMass14
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw14 output14 cover14 source14
    (gridTreeUnionCheck_sound 32768 raw14 output14 cover14 source14 tree14 checked14)
    _ (by norm_num) _,areaUnits14]
  norm_num

-- Frozen phase 15, atom 4132, type 0, source (59,61).
def leavesData15 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves15 (i : Fin 1) : DyadicLeaf := leavesData15.getD i.val ⟨0,0,0⟩
def raw15 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 59 61 leaves15 i
def outputData15 : Array GridBox := #[⟨15104,15360,15616,15872⟩,⟨15616,15872,15104,15360⟩,⟨16896,17152,17408,17664⟩,⟨17408,17664,16896,17152⟩]
def output15 (i : Fin 4) : GridBox := outputData15.getD i.val ⟨0,0,0,0⟩
def coverData15 : Array ℕ := #[0,1,3,2]
def sourceData15 : Array ℕ := #[0,1,3,2]
def cover15 (i : Fin 4) : Fin 4 := ⟨coverData15.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source15 (i : Fin 4) : Fin 4 := ⟨sourceData15.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree15 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 .empty (.cutY 14336 .empty (.cutX 15360 (.cutY 15360 .empty (.cutX 14848 .empty (.cutY 15872 (.cutX 15104 .empty (.cutY 15616 .empty .full)) .empty))) (.cutY 15360 (.cutX 15872 (.cutY 14848 .empty (.cutX 15616 .empty (.cutY 15104 .empty .full))) .empty) .empty)))))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 (.cutY 18432 (.cutX 17408 (.cutY 17408 .empty (.cutX 16896 .empty (.cutY 17920 (.cutX 17152 (.cutY 17664 .full .empty) .empty) .empty))) (.cutY 17408 (.cutX 17920 (.cutY 16896 .empty (.cutX 17664 (.cutY 17152 .full .empty) .empty)) .empty) .empty)) .empty) .empty) .empty) .empty) .empty) .empty)))

theorem metadata15 : 0<148355083 ∧ 59<128 ∧ 61<128 ∧ 0<4 ∧
    4132/4160=0 ∧ 4132%4160=4132 ∧ ∀ i, (leaves15 i).Valid 8 := by decide +kernel

theorem checked15 : gridTreeUnionCheck 32768 raw15 output15 cover15 source15 tree15 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits15 : gridUnionAreaUnits output15 = 262144 := by decide +kernel

noncomputable def phaseMass15 : ℝ := singlePhaseMass (148355083/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw15 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass15_eq : phaseMass15 = (148355083/1638400000000 : ℝ) := by
  unfold phaseMass15
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw15 output15 cover15 source15
    (gridTreeUnionCheck_sound 32768 raw15 output15 cover15 source15 tree15 checked15)
    _ (by norm_num) _,areaUnits15]
  norm_num

-- Frozen phase 16, atom 4131, type 0, source (59,60).
def leavesData16 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves16 (i : Fin 1) : DyadicLeaf := leavesData16.getD i.val ⟨0,0,0⟩
def raw16 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 59 60 leaves16 i
def outputData16 : Array GridBox := #[⟨15104,15360,15360,15616⟩,⟨15360,15616,15104,15360⟩,⟨17152,17408,17408,17664⟩,⟨17408,17664,17152,17408⟩]
def output16 (i : Fin 4) : GridBox := outputData16.getD i.val ⟨0,0,0,0⟩
def coverData16 : Array ℕ := #[0,1,3,2]
def sourceData16 : Array ℕ := #[0,1,3,2]
def cover16 (i : Fin 4) : Fin 4 := ⟨coverData16.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source16 (i : Fin 4) : Fin 4 := ⟨sourceData16.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree16 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 .empty (.cutY 14336 .empty (.cutX 15360 (.cutY 15360 .empty (.cutX 14848 .empty (.cutY 15872 (.cutX 15104 .empty (.cutY 15616 .full .empty)) .empty))) (.cutY 15360 (.cutX 15872 (.cutY 14848 .empty (.cutX 15616 (.cutY 15104 .empty .full) .empty)) .empty) .empty)))))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 (.cutY 18432 (.cutX 17408 (.cutY 17408 .empty (.cutX 16896 .empty (.cutY 17920 (.cutX 17152 .empty (.cutY 17664 .full .empty)) .empty))) (.cutY 17408 (.cutX 17920 (.cutY 16896 .empty (.cutX 17664 (.cutY 17152 .empty .full) .empty)) .empty) .empty)) .empty) .empty) .empty) .empty) .empty) .empty)))

theorem metadata16 : 0<148355083 ∧ 59<128 ∧ 60<128 ∧ 0<4 ∧
    4131/4160=0 ∧ 4131%4160=4131 ∧ ∀ i, (leaves16 i).Valid 8 := by decide +kernel

theorem checked16 : gridTreeUnionCheck 32768 raw16 output16 cover16 source16 tree16 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits16 : gridUnionAreaUnits output16 = 262144 := by decide +kernel

noncomputable def phaseMass16 : ℝ := singlePhaseMass (148355083/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw16 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass16_eq : phaseMass16 = (148355083/1638400000000 : ℝ) := by
  unfold phaseMass16
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw16 output16 cover16 source16
    (gridTreeUnionCheck_sound 32768 raw16 output16 cover16 source16 tree16 checked16)
    _ (by norm_num) _,areaUnits16]
  norm_num

-- Frozen phase 17, atom 4130, type 0, source (59,59).
def leavesData17 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves17 (i : Fin 1) : DyadicLeaf := leavesData17.getD i.val ⟨0,0,0⟩
def raw17 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 59 59 leaves17 i
def outputData17 : Array GridBox := #[⟨15104,15360,15104,15360⟩,⟨17408,17664,17408,17664⟩]
def output17 (i : Fin 2) : GridBox := outputData17.getD i.val ⟨0,0,0,0⟩
def coverData17 : Array ℕ := #[0,0,1,1]
def sourceData17 : Array ℕ := #[0,2]
def cover17 (i : Fin 4) : Fin 2 := ⟨coverData17.getD i.val 0 % 2,Nat.mod_lt _ (by decide)⟩
def source17 (i : Fin 2) : Fin 4 := ⟨sourceData17.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree17 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 .empty (.cutY 14336 .empty (.cutX 15360 (.cutY 15360 (.cutX 14848 .empty (.cutY 14848 .empty (.cutX 15104 .empty (.cutY 15104 .empty .full)))) .empty) .empty))))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 (.cutY 18432 (.cutX 17408 .empty (.cutY 17408 .empty (.cutX 17920 (.cutY 17920 (.cutX 17664 (.cutY 17664 .full .empty) .empty) .empty) .empty))) .empty) .empty) .empty) .empty) .empty) .empty)))

theorem metadata17 : 0<148355083 ∧ 59<128 ∧ 59<128 ∧ 0<4 ∧
    4130/4160=0 ∧ 4130%4160=4130 ∧ ∀ i, (leaves17 i).Valid 8 := by decide +kernel

theorem checked17 : gridTreeUnionCheck 32768 raw17 output17 cover17 source17 tree17 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits17 : gridUnionAreaUnits output17 = 131072 := by decide +kernel

noncomputable def phaseMass17 : ℝ := singlePhaseMass (148355083/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw17 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass17_eq : phaseMass17 = (148355083/3276800000000 : ℝ) := by
  unfold phaseMass17
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw17 output17 cover17 source17
    (gridTreeUnionCheck_sound 32768 raw17 output17 cover17 source17 tree17 checked17)
    _ (by norm_num) _,areaUnits17]
  norm_num

-- Frozen phase 18, atom 4121, type 0, source (58,61).
def leavesData18 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves18 (i : Fin 1) : DyadicLeaf := leavesData18.getD i.val ⟨0,0,0⟩
def raw18 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 58 61 leaves18 i
def outputData18 : Array GridBox := #[⟨14848,15104,15616,15872⟩,⟨15616,15872,14848,15104⟩,⟨16896,17152,17664,17920⟩,⟨17664,17920,16896,17152⟩]
def output18 (i : Fin 4) : GridBox := outputData18.getD i.val ⟨0,0,0,0⟩
def coverData18 : Array ℕ := #[0,1,3,2]
def sourceData18 : Array ℕ := #[0,1,3,2]
def cover18 (i : Fin 4) : Fin 4 := ⟨coverData18.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source18 (i : Fin 4) : Fin 4 := ⟨sourceData18.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree18 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 .empty (.cutY 14336 .empty (.cutX 15360 (.cutY 15360 .empty (.cutX 14848 .empty (.cutY 15872 (.cutX 15104 (.cutY 15616 .empty .full) .empty) .empty))) (.cutY 15360 (.cutX 15872 (.cutY 14848 .empty (.cutX 15616 .empty (.cutY 15104 .full .empty))) .empty) .empty)))))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 (.cutY 18432 (.cutX 17408 (.cutY 17408 .empty (.cutX 16896 .empty (.cutY 17920 (.cutX 17152 (.cutY 17664 .empty .full) .empty) .empty))) (.cutY 17408 (.cutX 17920 (.cutY 16896 .empty (.cutX 17664 .empty (.cutY 17152 .full .empty))) .empty) .empty)) .empty) .empty) .empty) .empty) .empty) .empty)))

theorem metadata18 : 0<148355083 ∧ 58<128 ∧ 61<128 ∧ 0<4 ∧
    4121/4160=0 ∧ 4121%4160=4121 ∧ ∀ i, (leaves18 i).Valid 8 := by decide +kernel

theorem checked18 : gridTreeUnionCheck 32768 raw18 output18 cover18 source18 tree18 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits18 : gridUnionAreaUnits output18 = 262144 := by decide +kernel

noncomputable def phaseMass18 : ℝ := singlePhaseMass (148355083/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw18 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass18_eq : phaseMass18 = (148355083/1638400000000 : ℝ) := by
  unfold phaseMass18
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw18 output18 cover18 source18
    (gridTreeUnionCheck_sound 32768 raw18 output18 cover18 source18 tree18 checked18)
    _ (by norm_num) _,areaUnits18]
  norm_num

-- Frozen phase 19, atom 4120, type 0, source (58,60).
def leavesData19 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves19 (i : Fin 1) : DyadicLeaf := leavesData19.getD i.val ⟨0,0,0⟩
def raw19 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 58 60 leaves19 i
def outputData19 : Array GridBox := #[⟨14848,15104,15360,15616⟩,⟨15360,15616,14848,15104⟩,⟨17152,17408,17664,17920⟩,⟨17664,17920,17152,17408⟩]
def output19 (i : Fin 4) : GridBox := outputData19.getD i.val ⟨0,0,0,0⟩
def coverData19 : Array ℕ := #[0,1,3,2]
def sourceData19 : Array ℕ := #[0,1,3,2]
def cover19 (i : Fin 4) : Fin 4 := ⟨coverData19.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source19 (i : Fin 4) : Fin 4 := ⟨sourceData19.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree19 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 .empty (.cutY 14336 .empty (.cutX 15360 (.cutY 15360 .empty (.cutX 14848 .empty (.cutY 15872 (.cutX 15104 (.cutY 15616 .full .empty) .empty) .empty))) (.cutY 15360 (.cutX 15872 (.cutY 14848 .empty (.cutX 15616 (.cutY 15104 .full .empty) .empty)) .empty) .empty)))))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 (.cutY 18432 (.cutX 17408 (.cutY 17408 .empty (.cutX 16896 .empty (.cutY 17920 (.cutX 17152 .empty (.cutY 17664 .empty .full)) .empty))) (.cutY 17408 (.cutX 17920 (.cutY 16896 .empty (.cutX 17664 .empty (.cutY 17152 .empty .full))) .empty) .empty)) .empty) .empty) .empty) .empty) .empty) .empty)))

theorem metadata19 : 0<148355083 ∧ 58<128 ∧ 60<128 ∧ 0<4 ∧
    4120/4160=0 ∧ 4120%4160=4120 ∧ ∀ i, (leaves19 i).Valid 8 := by decide +kernel

theorem checked19 : gridTreeUnionCheck 32768 raw19 output19 cover19 source19 tree19 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits19 : gridUnionAreaUnits output19 = 262144 := by decide +kernel

noncomputable def phaseMass19 : ℝ := singlePhaseMass (148355083/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw19 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass19_eq : phaseMass19 = (148355083/1638400000000 : ℝ) := by
  unfold phaseMass19
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw19 output19 cover19 source19
    (gridTreeUnionCheck_sound 32768 raw19 output19 cover19 source19 tree19 checked19)
    _ (by norm_num) _,areaUnits19]
  norm_num

-- Frozen phase 20, atom 4119, type 0, source (58,59).
def leavesData20 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves20 (i : Fin 1) : DyadicLeaf := leavesData20.getD i.val ⟨0,0,0⟩
def raw20 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 58 59 leaves20 i
def outputData20 : Array GridBox := #[⟨14848,15104,15104,15360⟩,⟨15104,15360,14848,15104⟩,⟨17408,17664,17664,17920⟩,⟨17664,17920,17408,17664⟩]
def output20 (i : Fin 4) : GridBox := outputData20.getD i.val ⟨0,0,0,0⟩
def coverData20 : Array ℕ := #[0,1,3,2]
def sourceData20 : Array ℕ := #[0,1,3,2]
def cover20 (i : Fin 4) : Fin 4 := ⟨coverData20.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source20 (i : Fin 4) : Fin 4 := ⟨sourceData20.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree20 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 .empty (.cutY 14336 .empty (.cutX 15360 (.cutY 15360 (.cutX 14848 .empty (.cutY 14848 .empty (.cutX 15104 (.cutY 15104 .empty .full) (.cutY 15104 .full .empty)))) .empty) .empty))))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 (.cutY 18432 (.cutX 17408 .empty (.cutY 17408 .empty (.cutX 17920 (.cutY 17920 (.cutX 17664 (.cutY 17664 .empty .full) (.cutY 17664 .full .empty)) .empty) .empty))) .empty) .empty) .empty) .empty) .empty) .empty)))

theorem metadata20 : 0<148355083 ∧ 58<128 ∧ 59<128 ∧ 0<4 ∧
    4119/4160=0 ∧ 4119%4160=4119 ∧ ∀ i, (leaves20 i).Valid 8 := by decide +kernel

theorem checked20 : gridTreeUnionCheck 32768 raw20 output20 cover20 source20 tree20 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits20 : gridUnionAreaUnits output20 = 262144 := by decide +kernel

noncomputable def phaseMass20 : ℝ := singlePhaseMass (148355083/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw20 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass20_eq : phaseMass20 = (148355083/1638400000000 : ℝ) := by
  unfold phaseMass20
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw20 output20 cover20 source20
    (gridTreeUnionCheck_sound 32768 raw20 output20 cover20 source20 tree20 checked20)
    _ (by norm_num) _,areaUnits20]
  norm_num

-- Frozen phase 21, atom 4118, type 0, source (58,58).
def leavesData21 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves21 (i : Fin 1) : DyadicLeaf := leavesData21.getD i.val ⟨0,0,0⟩
def raw21 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 58 58 leaves21 i
def outputData21 : Array GridBox := #[⟨14848,15104,14848,15104⟩,⟨17664,17920,17664,17920⟩]
def output21 (i : Fin 2) : GridBox := outputData21.getD i.val ⟨0,0,0,0⟩
def coverData21 : Array ℕ := #[0,0,1,1]
def sourceData21 : Array ℕ := #[0,2]
def cover21 (i : Fin 4) : Fin 2 := ⟨coverData21.getD i.val 0 % 2,Nat.mod_lt _ (by decide)⟩
def source21 (i : Fin 2) : Fin 4 := ⟨sourceData21.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree21 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 .empty (.cutY 14336 .empty (.cutX 15360 (.cutY 15360 (.cutX 14848 .empty (.cutY 14848 .empty (.cutX 15104 (.cutY 15104 .full .empty) .empty))) .empty) .empty))))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 (.cutY 18432 (.cutX 17408 .empty (.cutY 17408 .empty (.cutX 17920 (.cutY 17920 (.cutX 17664 .empty (.cutY 17664 .empty .full)) .empty) .empty))) .empty) .empty) .empty) .empty) .empty) .empty)))

theorem metadata21 : 0<148355083 ∧ 58<128 ∧ 58<128 ∧ 0<4 ∧
    4118/4160=0 ∧ 4118%4160=4118 ∧ ∀ i, (leaves21 i).Valid 8 := by decide +kernel

theorem checked21 : gridTreeUnionCheck 32768 raw21 output21 cover21 source21 tree21 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits21 : gridUnionAreaUnits output21 = 131072 := by decide +kernel

noncomputable def phaseMass21 : ℝ := singlePhaseMass (148355083/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw21 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass21_eq : phaseMass21 = (148355083/3276800000000 : ℝ) := by
  unfold phaseMass21
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw21 output21 cover21 source21
    (gridTreeUnionCheck_sound 32768 raw21 output21 cover21 source21 tree21 checked21)
    _ (by norm_num) _,areaUnits21]
  norm_num

-- Frozen phase 22, atom 4107, type 0, source (57,60).
def leavesData22 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves22 (i : Fin 1) : DyadicLeaf := leavesData22.getD i.val ⟨0,0,0⟩
def raw22 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 57 60 leaves22 i
def outputData22 : Array GridBox := #[⟨14592,14848,15360,15616⟩,⟨15360,15616,14592,14848⟩,⟨17152,17408,17920,18176⟩,⟨17920,18176,17152,17408⟩]
def output22 (i : Fin 4) : GridBox := outputData22.getD i.val ⟨0,0,0,0⟩
def coverData22 : Array ℕ := #[0,1,3,2]
def sourceData22 : Array ℕ := #[0,1,3,2]
def cover22 (i : Fin 4) : Fin 4 := ⟨coverData22.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source22 (i : Fin 4) : Fin 4 := ⟨sourceData22.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree22 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 .empty (.cutY 14336 .empty (.cutX 15360 (.cutY 15360 .empty (.cutX 14848 (.cutY 15872 (.cutX 14592 .empty (.cutY 15616 .full .empty)) .empty) .empty)) (.cutY 15360 (.cutX 15872 (.cutY 14848 (.cutX 15616 (.cutY 14592 .empty .full) .empty) .empty) .empty) .empty)))))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 (.cutY 18432 (.cutX 17408 (.cutY 17408 .empty (.cutX 16896 .empty (.cutY 17920 .empty (.cutX 17152 .empty (.cutY 18176 .full .empty))))) (.cutY 17408 (.cutX 17920 .empty (.cutY 16896 .empty (.cutX 18176 (.cutY 17152 .empty .full) .empty))) .empty)) .empty) .empty) .empty) .empty) .empty) .empty)))

theorem metadata22 : 0<148355083 ∧ 57<128 ∧ 60<128 ∧ 0<4 ∧
    4107/4160=0 ∧ 4107%4160=4107 ∧ ∀ i, (leaves22 i).Valid 8 := by decide +kernel

theorem checked22 : gridTreeUnionCheck 32768 raw22 output22 cover22 source22 tree22 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits22 : gridUnionAreaUnits output22 = 262144 := by decide +kernel

noncomputable def phaseMass22 : ℝ := singlePhaseMass (148355083/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw22 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass22_eq : phaseMass22 = (148355083/1638400000000 : ℝ) := by
  unfold phaseMass22
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw22 output22 cover22 source22
    (gridTreeUnionCheck_sound 32768 raw22 output22 cover22 source22 tree22 checked22)
    _ (by norm_num) _,areaUnits22]
  norm_num

-- Frozen phase 23, atom 4106, type 0, source (57,59).
def leavesData23 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves23 (i : Fin 1) : DyadicLeaf := leavesData23.getD i.val ⟨0,0,0⟩
def raw23 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 57 59 leaves23 i
def outputData23 : Array GridBox := #[⟨14592,14848,15104,15360⟩,⟨15104,15360,14592,14848⟩,⟨17408,17664,17920,18176⟩,⟨17920,18176,17408,17664⟩]
def output23 (i : Fin 4) : GridBox := outputData23.getD i.val ⟨0,0,0,0⟩
def coverData23 : Array ℕ := #[0,1,3,2]
def sourceData23 : Array ℕ := #[0,1,3,2]
def cover23 (i : Fin 4) : Fin 4 := ⟨coverData23.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source23 (i : Fin 4) : Fin 4 := ⟨sourceData23.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree23 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 .empty (.cutY 14336 .empty (.cutX 15360 (.cutY 15360 (.cutX 14848 (.cutY 14848 .empty (.cutX 14592 .empty (.cutY 15104 .empty .full))) (.cutY 14848 (.cutX 15104 .empty (.cutY 14592 .empty .full)) .empty)) .empty) .empty))))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 (.cutY 18432 (.cutX 17408 .empty (.cutY 17408 .empty (.cutX 17920 (.cutY 17920 .empty (.cutX 17664 (.cutY 18176 .full .empty) .empty)) (.cutY 17920 (.cutX 18176 (.cutY 17664 .full .empty) .empty) .empty)))) .empty) .empty) .empty) .empty) .empty) .empty)))

theorem metadata23 : 0<148355083 ∧ 57<128 ∧ 59<128 ∧ 0<4 ∧
    4106/4160=0 ∧ 4106%4160=4106 ∧ ∀ i, (leaves23 i).Valid 8 := by decide +kernel

theorem checked23 : gridTreeUnionCheck 32768 raw23 output23 cover23 source23 tree23 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits23 : gridUnionAreaUnits output23 = 262144 := by decide +kernel

noncomputable def phaseMass23 : ℝ := singlePhaseMass (148355083/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw23 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass23_eq : phaseMass23 = (148355083/1638400000000 : ℝ) := by
  unfold phaseMass23
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw23 output23 cover23 source23
    (gridTreeUnionCheck_sound 32768 raw23 output23 cover23 source23 tree23 checked23)
    _ (by norm_num) _,areaUnits23]
  norm_num

-- Frozen phase 24, atom 4105, type 0, source (57,58).
def leavesData24 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves24 (i : Fin 1) : DyadicLeaf := leavesData24.getD i.val ⟨0,0,0⟩
def raw24 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 57 58 leaves24 i
def outputData24 : Array GridBox := #[⟨14592,14848,14848,15104⟩,⟨14848,15104,14592,14848⟩,⟨17664,17920,17920,18176⟩,⟨17920,18176,17664,17920⟩]
def output24 (i : Fin 4) : GridBox := outputData24.getD i.val ⟨0,0,0,0⟩
def coverData24 : Array ℕ := #[0,1,3,2]
def sourceData24 : Array ℕ := #[0,1,3,2]
def cover24 (i : Fin 4) : Fin 4 := ⟨coverData24.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source24 (i : Fin 4) : Fin 4 := ⟨sourceData24.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree24 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 .empty (.cutY 14336 .empty (.cutX 15360 (.cutY 15360 (.cutX 14848 (.cutY 14848 .empty (.cutX 14592 .empty (.cutY 15104 .full .empty))) (.cutY 14848 (.cutX 15104 (.cutY 14592 .empty .full) .empty) .empty)) .empty) .empty))))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 (.cutY 18432 (.cutX 17408 .empty (.cutY 17408 .empty (.cutX 17920 (.cutY 17920 .empty (.cutX 17664 .empty (.cutY 18176 .full .empty))) (.cutY 17920 (.cutX 18176 (.cutY 17664 .empty .full) .empty) .empty)))) .empty) .empty) .empty) .empty) .empty) .empty)))

theorem metadata24 : 0<148355083 ∧ 57<128 ∧ 58<128 ∧ 0<4 ∧
    4105/4160=0 ∧ 4105%4160=4105 ∧ ∀ i, (leaves24 i).Valid 8 := by decide +kernel

theorem checked24 : gridTreeUnionCheck 32768 raw24 output24 cover24 source24 tree24 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits24 : gridUnionAreaUnits output24 = 262144 := by decide +kernel

noncomputable def phaseMass24 : ℝ := singlePhaseMass (148355083/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw24 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass24_eq : phaseMass24 = (148355083/1638400000000 : ℝ) := by
  unfold phaseMass24
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw24 output24 cover24 source24
    (gridTreeUnionCheck_sound 32768 raw24 output24 cover24 source24 tree24 checked24)
    _ (by norm_num) _,areaUnits24]
  norm_num

-- Frozen phase 25, atom 4104, type 0, source (57,57).
def leavesData25 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves25 (i : Fin 1) : DyadicLeaf := leavesData25.getD i.val ⟨0,0,0⟩
def raw25 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 57 57 leaves25 i
def outputData25 : Array GridBox := #[⟨14592,14848,14592,14848⟩,⟨17920,18176,17920,18176⟩]
def output25 (i : Fin 2) : GridBox := outputData25.getD i.val ⟨0,0,0,0⟩
def coverData25 : Array ℕ := #[0,0,1,1]
def sourceData25 : Array ℕ := #[0,2]
def cover25 (i : Fin 4) : Fin 2 := ⟨coverData25.getD i.val 0 % 2,Nat.mod_lt _ (by decide)⟩
def source25 (i : Fin 2) : Fin 4 := ⟨sourceData25.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree25 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 .empty (.cutY 14336 .empty (.cutX 15360 (.cutY 15360 (.cutX 14848 (.cutY 14848 (.cutX 14592 .empty (.cutY 14592 .empty .full)) .empty) .empty) .empty) .empty))))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 (.cutY 18432 (.cutX 17408 .empty (.cutY 17408 .empty (.cutX 17920 .empty (.cutY 17920 .empty (.cutX 18176 (.cutY 18176 .full .empty) .empty))))) .empty) .empty) .empty) .empty) .empty) .empty)))

theorem metadata25 : 0<148355083 ∧ 57<128 ∧ 57<128 ∧ 0<4 ∧
    4104/4160=0 ∧ 4104%4160=4104 ∧ ∀ i, (leaves25 i).Valid 8 := by decide +kernel

theorem checked25 : gridTreeUnionCheck 32768 raw25 output25 cover25 source25 tree25 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits25 : gridUnionAreaUnits output25 = 131072 := by decide +kernel

noncomputable def phaseMass25 : ℝ := singlePhaseMass (148355083/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw25 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass25_eq : phaseMass25 = (148355083/3276800000000 : ℝ) := by
  unfold phaseMass25
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw25 output25 cover25 source25
    (gridTreeUnionCheck_sound 32768 raw25 output25 cover25 source25 tree25 checked25)
    _ (by norm_num) _,areaUnits25]
  norm_num

-- Frozen phase 26, atom 4091, type 0, source (56,59).
def leavesData26 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves26 (i : Fin 1) : DyadicLeaf := leavesData26.getD i.val ⟨0,0,0⟩
def raw26 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 56 59 leaves26 i
def outputData26 : Array GridBox := #[⟨14336,14592,15104,15360⟩,⟨15104,15360,14336,14592⟩,⟨17408,17664,18176,18432⟩,⟨18176,18432,17408,17664⟩]
def output26 (i : Fin 4) : GridBox := outputData26.getD i.val ⟨0,0,0,0⟩
def coverData26 : Array ℕ := #[0,1,3,2]
def sourceData26 : Array ℕ := #[0,1,3,2]
def cover26 (i : Fin 4) : Fin 4 := ⟨coverData26.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source26 (i : Fin 4) : Fin 4 := ⟨sourceData26.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree26 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 .empty (.cutY 14336 .empty (.cutX 15360 (.cutY 15360 (.cutX 14848 (.cutY 14848 .empty (.cutX 14592 (.cutY 15104 .empty .full) .empty)) (.cutY 14848 (.cutX 15104 .empty (.cutY 14592 .full .empty)) .empty)) .empty) .empty))))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 (.cutY 18432 (.cutX 17408 .empty (.cutY 17408 .empty (.cutX 17920 (.cutY 17920 .empty (.cutX 17664 (.cutY 18176 .empty .full) .empty)) (.cutY 17920 (.cutX 18176 .empty (.cutY 17664 .full .empty)) .empty)))) .empty) .empty) .empty) .empty) .empty) .empty)))

theorem metadata26 : 0<148355083 ∧ 56<128 ∧ 59<128 ∧ 0<4 ∧
    4091/4160=0 ∧ 4091%4160=4091 ∧ ∀ i, (leaves26 i).Valid 8 := by decide +kernel

theorem checked26 : gridTreeUnionCheck 32768 raw26 output26 cover26 source26 tree26 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits26 : gridUnionAreaUnits output26 = 262144 := by decide +kernel

noncomputable def phaseMass26 : ℝ := singlePhaseMass (148355083/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw26 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass26_eq : phaseMass26 = (148355083/1638400000000 : ℝ) := by
  unfold phaseMass26
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw26 output26 cover26 source26
    (gridTreeUnionCheck_sound 32768 raw26 output26 cover26 source26 tree26 checked26)
    _ (by norm_num) _,areaUnits26]
  norm_num

-- Frozen phase 27, atom 4090, type 0, source (56,58).
def leavesData27 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves27 (i : Fin 1) : DyadicLeaf := leavesData27.getD i.val ⟨0,0,0⟩
def raw27 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 56 58 leaves27 i
def outputData27 : Array GridBox := #[⟨14336,14592,14848,15104⟩,⟨14848,15104,14336,14592⟩,⟨17664,17920,18176,18432⟩,⟨18176,18432,17664,17920⟩]
def output27 (i : Fin 4) : GridBox := outputData27.getD i.val ⟨0,0,0,0⟩
def coverData27 : Array ℕ := #[0,1,3,2]
def sourceData27 : Array ℕ := #[0,1,3,2]
def cover27 (i : Fin 4) : Fin 4 := ⟨coverData27.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source27 (i : Fin 4) : Fin 4 := ⟨sourceData27.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree27 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 .empty (.cutY 14336 .empty (.cutX 15360 (.cutY 15360 (.cutX 14848 (.cutY 14848 .empty (.cutX 14592 (.cutY 15104 .full .empty) .empty)) (.cutY 14848 (.cutX 15104 (.cutY 14592 .full .empty) .empty) .empty)) .empty) .empty))))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 (.cutY 18432 (.cutX 17408 .empty (.cutY 17408 .empty (.cutX 17920 (.cutY 17920 .empty (.cutX 17664 .empty (.cutY 18176 .empty .full))) (.cutY 17920 (.cutX 18176 .empty (.cutY 17664 .empty .full)) .empty)))) .empty) .empty) .empty) .empty) .empty) .empty)))

theorem metadata27 : 0<148355083 ∧ 56<128 ∧ 58<128 ∧ 0<4 ∧
    4090/4160=0 ∧ 4090%4160=4090 ∧ ∀ i, (leaves27 i).Valid 8 := by decide +kernel

theorem checked27 : gridTreeUnionCheck 32768 raw27 output27 cover27 source27 tree27 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits27 : gridUnionAreaUnits output27 = 262144 := by decide +kernel

noncomputable def phaseMass27 : ℝ := singlePhaseMass (148355083/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw27 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass27_eq : phaseMass27 = (148355083/1638400000000 : ℝ) := by
  unfold phaseMass27
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw27 output27 cover27 source27
    (gridTreeUnionCheck_sound 32768 raw27 output27 cover27 source27 tree27 checked27)
    _ (by norm_num) _,areaUnits27]
  norm_num

-- Frozen phase 28, atom 4073, type 0, source (55,58).
def leavesData28 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves28 (i : Fin 1) : DyadicLeaf := leavesData28.getD i.val ⟨0,0,0⟩
def raw28 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 55 58 leaves28 i
def outputData28 : Array GridBox := #[⟨14080,14336,14848,15104⟩,⟨14848,15104,14080,14336⟩,⟨17664,17920,18432,18688⟩,⟨18432,18688,17664,17920⟩]
def output28 (i : Fin 4) : GridBox := outputData28.getD i.val ⟨0,0,0,0⟩
def coverData28 : Array ℕ := #[0,1,3,2]
def sourceData28 : Array ℕ := #[0,1,3,2]
def cover28 (i : Fin 4) : Fin 4 := ⟨coverData28.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source28 (i : Fin 4) : Fin 4 := ⟨sourceData28.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree28 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 (.cutY 14336 .empty (.cutX 13312 .empty (.cutY 15360 (.cutX 13824 .empty (.cutY 14848 .empty (.cutX 14080 .empty (.cutY 15104 .full .empty)))) .empty))) (.cutY 14336 (.cutX 15360 (.cutY 13312 .empty (.cutX 14848 .empty (.cutY 13824 .empty (.cutX 15104 (.cutY 14080 .empty .full) .empty)))) .empty) .empty)))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 (.cutY 18432 .empty (.cutX 17408 .empty (.cutY 19456 (.cutX 17920 (.cutY 18944 (.cutX 17664 .empty (.cutY 18688 .full .empty)) .empty) .empty) .empty))) (.cutY 18432 (.cutX 19456 (.cutY 17408 .empty (.cutX 18944 (.cutY 17920 (.cutX 18688 (.cutY 17664 .empty .full) .empty) .empty) .empty)) .empty) .empty)) .empty) .empty) .empty) .empty)))

theorem metadata28 : 0<314864438 ∧ 55<128 ∧ 58<128 ∧ 0<4 ∧
    4073/4160=0 ∧ 4073%4160=4073 ∧ ∀ i, (leaves28 i).Valid 8 := by decide +kernel

theorem checked28 : gridTreeUnionCheck 32768 raw28 output28 cover28 source28 tree28 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits28 : gridUnionAreaUnits output28 = 262144 := by decide +kernel

noncomputable def phaseMass28 : ℝ := singlePhaseMass (314864438/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw28 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass28_eq : phaseMass28 = (157432219/819200000000 : ℝ) := by
  unfold phaseMass28
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw28 output28 cover28 source28
    (gridTreeUnionCheck_sound 32768 raw28 output28 cover28 source28 tree28 checked28)
    _ (by norm_num) _,areaUnits28]
  norm_num

-- Frozen phase 29, atom 4089, type 0, source (56,57).
def leavesData29 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves29 (i : Fin 1) : DyadicLeaf := leavesData29.getD i.val ⟨0,0,0⟩
def raw29 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 56 57 leaves29 i
def outputData29 : Array GridBox := #[⟨14336,14592,14592,14848⟩,⟨14592,14848,14336,14592⟩,⟨17920,18176,18176,18432⟩,⟨18176,18432,17920,18176⟩]
def output29 (i : Fin 4) : GridBox := outputData29.getD i.val ⟨0,0,0,0⟩
def coverData29 : Array ℕ := #[0,1,3,2]
def sourceData29 : Array ℕ := #[0,1,3,2]
def cover29 (i : Fin 4) : Fin 4 := ⟨coverData29.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source29 (i : Fin 4) : Fin 4 := ⟨sourceData29.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree29 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 .empty (.cutY 14336 .empty (.cutX 15360 (.cutY 15360 (.cutX 14848 (.cutY 14848 (.cutX 14592 (.cutY 14592 .empty .full) (.cutY 14592 .full .empty)) .empty) .empty) .empty) .empty))))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 (.cutY 18432 (.cutX 17408 .empty (.cutY 17408 .empty (.cutX 17920 .empty (.cutY 17920 .empty (.cutX 18176 (.cutY 18176 .empty .full) (.cutY 18176 .full .empty)))))) .empty) .empty) .empty) .empty) .empty) .empty)))

theorem metadata29 : 0<148355083 ∧ 56<128 ∧ 57<128 ∧ 0<4 ∧
    4089/4160=0 ∧ 4089%4160=4089 ∧ ∀ i, (leaves29 i).Valid 8 := by decide +kernel

theorem checked29 : gridTreeUnionCheck 32768 raw29 output29 cover29 source29 tree29 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits29 : gridUnionAreaUnits output29 = 262144 := by decide +kernel

noncomputable def phaseMass29 : ℝ := singlePhaseMass (148355083/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw29 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass29_eq : phaseMass29 = (148355083/1638400000000 : ℝ) := by
  unfold phaseMass29
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw29 output29 cover29 source29
    (gridTreeUnionCheck_sound 32768 raw29 output29 cover29 source29 tree29 checked29)
    _ (by norm_num) _,areaUnits29]
  norm_num

-- Frozen phase 30, atom 4072, type 0, source (55,57).
def leavesData30 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves30 (i : Fin 1) : DyadicLeaf := leavesData30.getD i.val ⟨0,0,0⟩
def raw30 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 55 57 leaves30 i
def outputData30 : Array GridBox := #[⟨14080,14336,14592,14848⟩,⟨14592,14848,14080,14336⟩,⟨17920,18176,18432,18688⟩,⟨18432,18688,17920,18176⟩]
def output30 (i : Fin 4) : GridBox := outputData30.getD i.val ⟨0,0,0,0⟩
def coverData30 : Array ℕ := #[0,1,3,2]
def sourceData30 : Array ℕ := #[0,1,3,2]
def cover30 (i : Fin 4) : Fin 4 := ⟨coverData30.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source30 (i : Fin 4) : Fin 4 := ⟨sourceData30.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree30 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 (.cutY 14336 .empty (.cutX 13312 .empty (.cutY 15360 (.cutX 13824 .empty (.cutY 14848 (.cutX 14080 .empty (.cutY 14592 .empty .full)) .empty)) .empty))) (.cutY 14336 (.cutX 15360 (.cutY 13312 .empty (.cutX 14848 (.cutY 13824 .empty (.cutX 14592 .empty (.cutY 14080 .empty .full))) .empty)) .empty) .empty)))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 (.cutY 18432 .empty (.cutX 17408 .empty (.cutY 19456 (.cutX 17920 .empty (.cutY 18944 (.cutX 18176 (.cutY 18688 .full .empty) .empty) .empty)) .empty))) (.cutY 18432 (.cutX 19456 (.cutY 17408 .empty (.cutX 18944 (.cutY 17920 .empty (.cutX 18688 (.cutY 18176 .full .empty) .empty)) .empty)) .empty) .empty)) .empty) .empty) .empty) .empty)))

theorem metadata30 : 0<314864438 ∧ 55<128 ∧ 57<128 ∧ 0<4 ∧
    4072/4160=0 ∧ 4072%4160=4072 ∧ ∀ i, (leaves30 i).Valid 8 := by decide +kernel

theorem checked30 : gridTreeUnionCheck 32768 raw30 output30 cover30 source30 tree30 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits30 : gridUnionAreaUnits output30 = 262144 := by decide +kernel

noncomputable def phaseMass30 : ℝ := singlePhaseMass (314864438/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw30 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass30_eq : phaseMass30 = (157432219/819200000000 : ℝ) := by
  unfold phaseMass30
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw30 output30 cover30 source30
    (gridTreeUnionCheck_sound 32768 raw30 output30 cover30 source30 tree30 checked30)
    _ (by norm_num) _,areaUnits30]
  norm_num

-- Frozen phase 31, atom 4053, type 0, source (54,57).
def leavesData31 : Array DyadicLeaf := #[⟨0,0,0⟩]
def leaves31 (i : Fin 1) : DyadicLeaf := leavesData31.getD i.val ⟨0,0,0⟩
def raw31 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 54 57 leaves31 i
def outputData31 : Array GridBox := #[⟨13824,14080,14592,14848⟩,⟨14592,14848,13824,14080⟩,⟨17920,18176,18688,18944⟩,⟨18688,18944,17920,18176⟩]
def output31 (i : Fin 4) : GridBox := outputData31.getD i.val ⟨0,0,0,0⟩
def coverData31 : Array ℕ := #[0,1,3,2]
def sourceData31 : Array ℕ := #[0,1,3,2]
def cover31 (i : Fin 4) : Fin 4 := ⟨coverData31.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def source31 (i : Fin 4) : Fin 4 := ⟨sourceData31.getD i.val 0 % 4,Nat.mod_lt _ (by decide)⟩
def tree31 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 .empty (.cutY 12288 .empty (.cutX 14336 (.cutY 14336 .empty (.cutX 13312 .empty (.cutY 15360 (.cutX 13824 .empty (.cutY 14848 (.cutX 14080 (.cutY 14592 .empty .full) .empty) .empty)) .empty))) (.cutY 14336 (.cutX 15360 (.cutY 13312 .empty (.cutX 14848 (.cutY 13824 .empty (.cutX 14592 .empty (.cutY 14080 .full .empty))) .empty)) .empty) .empty)))))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 (.cutX 18432 (.cutY 18432 .empty (.cutX 17408 .empty (.cutY 19456 (.cutX 17920 .empty (.cutY 18944 (.cutX 18176 (.cutY 18688 .empty .full) .empty) .empty)) .empty))) (.cutY 18432 (.cutX 19456 (.cutY 17408 .empty (.cutX 18944 (.cutY 17920 .empty (.cutX 18688 .empty (.cutY 18176 .full .empty))) .empty)) .empty) .empty)) .empty) .empty) .empty) .empty)))

theorem metadata31 : 0<314864438 ∧ 54<128 ∧ 57<128 ∧ 0<4 ∧
    4053/4160=0 ∧ 4053%4160=4053 ∧ ∀ i, (leaves31 i).Valid 8 := by decide +kernel

theorem checked31 : gridTreeUnionCheck 32768 raw31 output31 cover31 source31 tree31 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem areaUnits31 : gridUnionAreaUnits output31 = 262144 := by decide +kernel

noncomputable def phaseMass31 : ℝ := singlePhaseMass (314864438/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw31 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass31_eq : phaseMass31 = (157432219/819200000000 : ℝ) := by
  unfold phaseMass31
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw31 output31 cover31 source31
    (gridTreeUnionCheck_sound 32768 raw31 output31 cover31 source31 tree31 checked31)
    _ (by norm_num) _,areaUnits31]
  norm_num

noncomputable def batchActualMass : ℝ := [phaseMass0,phaseMass1,phaseMass2,phaseMass3,phaseMass4,phaseMass5,phaseMass6,phaseMass7,phaseMass8,phaseMass9,phaseMass10,phaseMass11,phaseMass12,phaseMass13,phaseMass14,phaseMass15,phaseMass16,phaseMass17,phaseMass18,phaseMass19,phaseMass20,phaseMass21,phaseMass22,phaseMass23,phaseMass24,phaseMass25,phaseMass26,phaseMass27,phaseMass28,phaseMass29,phaseMass30,phaseMass31].sum

theorem actual_batch_mass : batchActualMass = (10182534583/3276800000000 : ℝ) := by
  unfold batchActualMass
  rw [phaseMass0_eq,phaseMass1_eq,phaseMass2_eq,phaseMass3_eq,phaseMass4_eq,phaseMass5_eq,phaseMass6_eq,phaseMass7_eq,phaseMass8_eq,phaseMass9_eq,phaseMass10_eq,phaseMass11_eq,phaseMass12_eq,phaseMass13_eq,phaseMass14_eq,phaseMass15_eq,phaseMass16_eq,phaseMass17_eq,phaseMass18_eq,phaseMass19_eq,phaseMass20_eq,phaseMass21_eq,phaseMass22_eq,phaseMass23_eq,phaseMass24_eq,phaseMass25_eq,phaseMass26_eq,phaseMass27_eq,phaseMass28_eq,phaseMass29_eq,phaseMass30_eq,phaseMass31_eq]
  norm_num

end NoThreeLine.ScheduleUnionBatch00000

#print axioms NoThreeLine.ScheduleUnionBatch00000.actual_batch_mass
