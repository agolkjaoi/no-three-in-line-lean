import NoThreeLine.GridCutTree
import NoThreeLine.DyadicPhaseInput
import NoThreeLine.PhaseUnionMass
import NoThreeLine.FiniteInputTreeCheck
import NoThreeLine.FiniteIndexBlocks

/-! Actual accepted unions for the explicitly listed bounded phase range.
The balanced literal representation changes no geometry or schedule weight.
Missing phases, inheritance, and the reference-prefix bridge remain separate. -/
set_option autoImplicit false
set_option maxRecDepth 4096
set_option maxHeartbeats 400000
open MeasureTheory NoThreeLine.FinitePhase
namespace NoThreeLine.ScheduleUnionBatch02496

-- Frozen phase 2496, atom 7956, type 1, source (45,61).
def leavesData0 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves0 : Fin 4 → DyadicLeaf := leavesData0.get
def raw0 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 45 61 leaves0 i
def outputData0 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨11520,11648,15616,15744⟩) (.single ⟨11520,11648,15744,15872⟩)) (.node (.single ⟨11648,11776,15616,15744⟩) (.single ⟨11648,11776,15744,15872⟩))) (.node (.node (.single ⟨15616,15744,11520,11648⟩) (.single ⟨15616,15744,11648,11776⟩)) (.node (.single ⟨15744,15872,11520,11648⟩) (.single ⟨15744,15872,11648,11776⟩)))) (.node (.node (.node (.single ⟨16896,17024,20992,21120⟩) (.single ⟨16896,17024,21120,21248⟩)) (.node (.single ⟨17024,17152,20992,21120⟩) (.single ⟨17024,17152,21120,21248⟩))) (.node (.node (.single ⟨20992,21120,16896,17024⟩) (.single ⟨20992,21120,17024,17152⟩)) (.node (.single ⟨21120,21248,16896,17024⟩) (.single ⟨21120,21248,17024,17152⟩)))))
def output0 : Fin 16 → GridBox := outputData0.get
def coverData0 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData0 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover0 (i : Fin 16) : Fin 16 := ⟨coverData0.get i % 16, Nat.mod_lt _ (by decide)⟩
def source0 (i : Fin 16) : Fin 16 := ⟨sourceData0.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree0 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 .empty (.cutY 14336 .empty (.cutX 11264 .empty (.cutY 15360 .empty (.cutX 11776 (.cutY 15872 (.cutX 11520 .empty (.cutY 15616 .empty (.cutX 11648 (.cutY 15744 .full .full) (.cutY 15744 .full .full)))) .empty) .empty)))))) (.cutY 12288 (.cutX 14336 .empty (.cutY 10240 .empty (.cutX 15360 .empty (.cutY 11264 .empty (.cutX 15872 (.cutY 11776 (.cutX 15616 .empty (.cutY 11520 .empty (.cutX 15744 (.cutY 11648 .full .full) (.cutY 11648 .full .full)))) .empty) .empty))))) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 (.cutY 22528 (.cutX 17408 (.cutY 21504 (.cutX 16896 .empty (.cutY 20992 .empty (.cutX 17152 (.cutY 21248 (.cutX 17024 (.cutY 21120 .full .full) (.cutY 21120 .full .full)) .empty) .empty))) .empty) .empty) .empty) .empty)) (.cutY 20480 (.cutX 22528 (.cutY 18432 (.cutX 21504 (.cutY 17408 (.cutX 20992 .empty (.cutY 16896 .empty (.cutX 21248 (.cutY 17152 (.cutX 21120 (.cutY 17024 .full .full) (.cutY 17024 .full .full)) .empty) .empty))) .empty) .empty) .empty) .empty) .empty)) .empty) .empty)))

theorem metadata0 : 0<82140708 ∧ 45<128 ∧ 61<128 ∧ 1<4 ∧
    7956/4160=1 ∧ 7956%4160=3796 ∧ ∀ i, (leaves0 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData0).mp
    (by decide +kernel)

theorem sourceChecked0_0 : ∀ i : Fin 16,
    (fun i => output0 i = raw0 (source0 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked0 : ∀ i : Fin 16, (fun i => output0 i = raw0 (source0 i)) i :=
  forallFin_of_zero_offset (fun i => output0 i = raw0 (source0 i)) sourceChecked0_0

theorem coverChecked0_0 : ∀ i : Fin 16,
    (fun i => (output0 (cover0 i)).ContainsBox (raw0 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked0 : ∀ i : Fin 16, (fun i => (output0 (cover0 i)).ContainsBox (raw0 i)) i :=
  forallFin_of_zero_offset (fun i => (output0 (cover0 i)).ContainsBox (raw0 i)) coverChecked0_0

theorem treeChecked0 : tree0.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves0 : List.ofFn output0 = tree0.leaves ⟨0,32768,0,32768⟩ := by
  unfold output0
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked0 : gridTreeUnionCheck 32768 raw0 output0 cover0 source0 tree0 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked0, coverChecked0, treeChecked0, treeLeaves0⟩

theorem areaUnits0 : gridUnionAreaUnits output0 = 262144 := by decide +kernel

noncomputable def phaseMass0 : ℝ := singlePhaseMass (82140708/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw0 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass0_eq : phaseMass0 = (20535177/409600000000 : ℝ) := by
  unfold phaseMass0
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw0 output0 cover0 source0
    (gridTreeUnionCheck_sound 32768 raw0 output0 cover0 source0 tree0 checked0)
    _ (by norm_num) _, areaUnits0]
  norm_num

-- Frozen phase 2497, atom 3970, type 0, source (50,70).
def leavesData1 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves1 : Fin 1 → DyadicLeaf := leavesData1.get
def raw1 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 50 70 leaves1 i
def outputData1 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨12800,13056,17920,18176⟩) (.single ⟨14592,14848,19712,19968⟩)) (.node (.single ⟨17920,18176,12800,13056⟩) (.single ⟨19712,19968,14592,14848⟩)))
def output1 : Fin 4 → GridBox := outputData1.get
def coverData1 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 2)) (.node (.single 3) (.single 1)))
def sourceData1 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 3)) (.node (.single 1) (.single 2)))
def cover1 (i : Fin 4) : Fin 4 := ⟨coverData1.get i % 4, Nat.mod_lt _ (by decide)⟩
def source1 (i : Fin 4) : Fin 4 := ⟨sourceData1.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree1 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 .empty (.cutY 20480 (.cutX 14336 (.cutY 18432 (.cutX 13312 (.cutY 17408 .empty (.cutX 12800 .empty (.cutY 17920 .empty (.cutX 13056 (.cutY 18176 .full .empty) .empty)))) .empty) .empty) (.cutY 18432 .empty (.cutX 15360 (.cutY 19456 .empty (.cutX 14848 (.cutY 19968 (.cutX 14592 .empty (.cutY 19712 .empty .full)) .empty) .empty)) .empty))) .empty)) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 .empty (.cutX 18432 (.cutY 14336 (.cutX 17408 .empty (.cutY 13312 (.cutX 17920 .empty (.cutY 12800 .empty (.cutX 18176 (.cutY 13056 .full .empty) .empty))) .empty)) .empty) (.cutY 14336 .empty (.cutX 19456 .empty (.cutY 15360 (.cutX 19968 (.cutY 14848 (.cutX 19712 .empty (.cutY 14592 .empty .full)) .empty) .empty) .empty))))) .empty)) .empty) .empty))

theorem metadata1 : 0<273125493 ∧ 50<128 ∧ 70<128 ∧ 0<4 ∧
    3970/4160=0 ∧ 3970%4160=3970 ∧ ∀ i, (leaves1 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData1).mp
    (by decide +kernel)

theorem sourceChecked1_0 : ∀ i : Fin 4,
    (fun i => output1 i = raw1 (source1 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked1 : ∀ i : Fin 4, (fun i => output1 i = raw1 (source1 i)) i :=
  forallFin_of_zero_offset (fun i => output1 i = raw1 (source1 i)) sourceChecked1_0

theorem coverChecked1_0 : ∀ i : Fin 4,
    (fun i => (output1 (cover1 i)).ContainsBox (raw1 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked1 : ∀ i : Fin 4, (fun i => (output1 (cover1 i)).ContainsBox (raw1 i)) i :=
  forallFin_of_zero_offset (fun i => (output1 (cover1 i)).ContainsBox (raw1 i)) coverChecked1_0

theorem treeChecked1 : tree1.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves1 : List.ofFn output1 = tree1.leaves ⟨0,32768,0,32768⟩ := by
  unfold output1
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked1 : gridTreeUnionCheck 32768 raw1 output1 cover1 source1 tree1 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked1, coverChecked1, treeChecked1, treeLeaves1⟩

theorem areaUnits1 : gridUnionAreaUnits output1 = 262144 := by decide +kernel

noncomputable def phaseMass1 : ℝ := singlePhaseMass (273125493/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw1 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass1_eq : phaseMass1 = (273125493/1638400000000 : ℝ) := by
  unfold phaseMass1
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw1 output1 cover1 source1
    (gridTreeUnionCheck_sound 32768 raw1 output1 cover1 source1 tree1 checked1)
    _ (by norm_num) _, areaUnits1]
  norm_num

-- Frozen phase 2498, atom 3940, type 0, source (49,69).
def leavesData2 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves2 : Fin 1 → DyadicLeaf := leavesData2.get
def raw2 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 49 69 leaves2 i
def outputData2 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨12544,12800,17664,17920⟩) (.single ⟨14848,15104,19968,20224⟩)) (.node (.single ⟨17664,17920,12544,12800⟩) (.single ⟨19968,20224,14848,15104⟩)))
def output2 : Fin 4 → GridBox := outputData2.get
def coverData2 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 2)) (.node (.single 3) (.single 1)))
def sourceData2 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 3)) (.node (.single 1) (.single 2)))
def cover2 (i : Fin 4) : Fin 4 := ⟨coverData2.get i % 4, Nat.mod_lt _ (by decide)⟩
def source2 (i : Fin 4) : Fin 4 := ⟨sourceData2.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree2 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 .empty (.cutY 20480 (.cutX 14336 (.cutY 18432 (.cutX 13312 (.cutY 17408 .empty (.cutX 12800 (.cutY 17920 (.cutX 12544 .empty (.cutY 17664 .empty .full)) .empty) .empty)) .empty) .empty) (.cutY 18432 .empty (.cutX 15360 (.cutY 19456 .empty (.cutX 14848 .empty (.cutY 19968 .empty (.cutX 15104 (.cutY 20224 .full .empty) .empty)))) .empty))) .empty)) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 .empty (.cutX 18432 (.cutY 14336 (.cutX 17408 .empty (.cutY 13312 (.cutX 17920 (.cutY 12800 (.cutX 17664 .empty (.cutY 12544 .empty .full)) .empty) .empty) .empty)) .empty) (.cutY 14336 .empty (.cutX 19456 .empty (.cutY 15360 (.cutX 19968 .empty (.cutY 14848 .empty (.cutX 20224 (.cutY 15104 .full .empty) .empty))) .empty))))) .empty)) .empty) .empty))

theorem metadata2 : 0<273125493 ∧ 49<128 ∧ 69<128 ∧ 0<4 ∧
    3940/4160=0 ∧ 3940%4160=3940 ∧ ∀ i, (leaves2 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData2).mp
    (by decide +kernel)

theorem sourceChecked2_0 : ∀ i : Fin 4,
    (fun i => output2 i = raw2 (source2 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked2 : ∀ i : Fin 4, (fun i => output2 i = raw2 (source2 i)) i :=
  forallFin_of_zero_offset (fun i => output2 i = raw2 (source2 i)) sourceChecked2_0

theorem coverChecked2_0 : ∀ i : Fin 4,
    (fun i => (output2 (cover2 i)).ContainsBox (raw2 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked2 : ∀ i : Fin 4, (fun i => (output2 (cover2 i)).ContainsBox (raw2 i)) i :=
  forallFin_of_zero_offset (fun i => (output2 (cover2 i)).ContainsBox (raw2 i)) coverChecked2_0

theorem treeChecked2 : tree2.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves2 : List.ofFn output2 = tree2.leaves ⟨0,32768,0,32768⟩ := by
  unfold output2
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked2 : gridTreeUnionCheck 32768 raw2 output2 cover2 source2 tree2 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked2, coverChecked2, treeChecked2, treeLeaves2⟩

theorem areaUnits2 : gridUnionAreaUnits output2 = 262144 := by decide +kernel

noncomputable def phaseMass2 : ℝ := singlePhaseMass (273125493/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw2 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass2_eq : phaseMass2 = (273125493/1638400000000 : ℝ) := by
  unfold phaseMass2
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw2 output2 cover2 source2
    (gridTreeUnionCheck_sound 32768 raw2 output2 cover2 source2 tree2 checked2)
    _ (by norm_num) _, areaUnits2]
  norm_num

-- Frozen phase 2499, atom 3998, type 0, source (51,71).
def leavesData3 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves3 : Fin 1 → DyadicLeaf := leavesData3.get
def raw3 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 51 71 leaves3 i
def outputData3 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨13056,13312,18176,18432⟩) (.single ⟨14336,14592,19456,19712⟩)) (.node (.single ⟨18176,18432,13056,13312⟩) (.single ⟨19456,19712,14336,14592⟩)))
def output3 : Fin 4 → GridBox := outputData3.get
def coverData3 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 2)) (.node (.single 3) (.single 1)))
def sourceData3 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 3)) (.node (.single 1) (.single 2)))
def cover3 (i : Fin 4) : Fin 4 := ⟨coverData3.get i % 4, Nat.mod_lt _ (by decide)⟩
def source3 (i : Fin 4) : Fin 4 := ⟨sourceData3.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree3 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 .empty (.cutY 20480 (.cutX 14336 (.cutY 18432 (.cutX 13312 (.cutY 17408 .empty (.cutX 12800 .empty (.cutY 17920 .empty (.cutX 13056 .empty (.cutY 18176 .empty .full))))) .empty) .empty) (.cutY 18432 .empty (.cutX 15360 (.cutY 19456 .empty (.cutX 14848 (.cutY 19968 (.cutX 14592 (.cutY 19712 .full .empty) .empty) .empty) .empty)) .empty))) .empty)) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 .empty (.cutX 18432 (.cutY 14336 (.cutX 17408 .empty (.cutY 13312 (.cutX 17920 .empty (.cutY 12800 .empty (.cutX 18176 .empty (.cutY 13056 .empty .full)))) .empty)) .empty) (.cutY 14336 .empty (.cutX 19456 .empty (.cutY 15360 (.cutX 19968 (.cutY 14848 (.cutX 19712 (.cutY 14592 .full .empty) .empty) .empty) .empty) .empty))))) .empty)) .empty) .empty))

theorem metadata3 : 0<273125493 ∧ 51<128 ∧ 71<128 ∧ 0<4 ∧
    3998/4160=0 ∧ 3998%4160=3998 ∧ ∀ i, (leaves3 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData3).mp
    (by decide +kernel)

theorem sourceChecked3_0 : ∀ i : Fin 4,
    (fun i => output3 i = raw3 (source3 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked3 : ∀ i : Fin 4, (fun i => output3 i = raw3 (source3 i)) i :=
  forallFin_of_zero_offset (fun i => output3 i = raw3 (source3 i)) sourceChecked3_0

theorem coverChecked3_0 : ∀ i : Fin 4,
    (fun i => (output3 (cover3 i)).ContainsBox (raw3 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked3 : ∀ i : Fin 4, (fun i => (output3 (cover3 i)).ContainsBox (raw3 i)) i :=
  forallFin_of_zero_offset (fun i => (output3 (cover3 i)).ContainsBox (raw3 i)) coverChecked3_0

theorem treeChecked3 : tree3.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves3 : List.ofFn output3 = tree3.leaves ⟨0,32768,0,32768⟩ := by
  unfold output3
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked3 : gridTreeUnionCheck 32768 raw3 output3 cover3 source3 tree3 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked3, coverChecked3, treeChecked3, treeLeaves3⟩

theorem areaUnits3 : gridUnionAreaUnits output3 = 262144 := by decide +kernel

noncomputable def phaseMass3 : ℝ := singlePhaseMass (273125493/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw3 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass3_eq : phaseMass3 = (273125493/1638400000000 : ℝ) := by
  unfold phaseMass3
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw3 output3 cover3 source3
    (gridTreeUnionCheck_sound 32768 raw3 output3 cover3 source3 tree3 checked3)
    _ (by norm_num) _, areaUnits3]
  norm_num

-- Frozen phase 2500, atom 3908, type 0, source (48,68).
def leavesData4 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves4 : Fin 1 → DyadicLeaf := leavesData4.get
def raw4 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 48 68 leaves4 i
def outputData4 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨12288,12544,17408,17664⟩) (.single ⟨15104,15360,20224,20480⟩)) (.node (.single ⟨17408,17664,12288,12544⟩) (.single ⟨20224,20480,15104,15360⟩)))
def output4 : Fin 4 → GridBox := outputData4.get
def coverData4 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 2)) (.node (.single 3) (.single 1)))
def sourceData4 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 3)) (.node (.single 1) (.single 2)))
def cover4 (i : Fin 4) : Fin 4 := ⟨coverData4.get i % 4, Nat.mod_lt _ (by decide)⟩
def source4 (i : Fin 4) : Fin 4 := ⟨sourceData4.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree4 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 .empty (.cutY 20480 (.cutX 14336 (.cutY 18432 (.cutX 13312 (.cutY 17408 .empty (.cutX 12800 (.cutY 17920 (.cutX 12544 (.cutY 17664 .full .empty) .empty) .empty) .empty)) .empty) .empty) (.cutY 18432 .empty (.cutX 15360 (.cutY 19456 .empty (.cutX 14848 .empty (.cutY 19968 .empty (.cutX 15104 .empty (.cutY 20224 .empty .full))))) .empty))) .empty)) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 .empty (.cutX 18432 (.cutY 14336 (.cutX 17408 .empty (.cutY 13312 (.cutX 17920 (.cutY 12800 (.cutX 17664 (.cutY 12544 .full .empty) .empty) .empty) .empty) .empty)) .empty) (.cutY 14336 .empty (.cutX 19456 .empty (.cutY 15360 (.cutX 19968 .empty (.cutY 14848 .empty (.cutX 20224 .empty (.cutY 15104 .empty .full)))) .empty))))) .empty)) .empty) .empty))

theorem metadata4 : 0<273125493 ∧ 48<128 ∧ 68<128 ∧ 0<4 ∧
    3908/4160=0 ∧ 3908%4160=3908 ∧ ∀ i, (leaves4 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData4).mp
    (by decide +kernel)

theorem sourceChecked4_0 : ∀ i : Fin 4,
    (fun i => output4 i = raw4 (source4 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked4 : ∀ i : Fin 4, (fun i => output4 i = raw4 (source4 i)) i :=
  forallFin_of_zero_offset (fun i => output4 i = raw4 (source4 i)) sourceChecked4_0

theorem coverChecked4_0 : ∀ i : Fin 4,
    (fun i => (output4 (cover4 i)).ContainsBox (raw4 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked4 : ∀ i : Fin 4, (fun i => (output4 (cover4 i)).ContainsBox (raw4 i)) i :=
  forallFin_of_zero_offset (fun i => (output4 (cover4 i)).ContainsBox (raw4 i)) coverChecked4_0

theorem treeChecked4 : tree4.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves4 : List.ofFn output4 = tree4.leaves ⟨0,32768,0,32768⟩ := by
  unfold output4
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked4 : gridTreeUnionCheck 32768 raw4 output4 cover4 source4 tree4 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked4, coverChecked4, treeChecked4, treeLeaves4⟩

theorem areaUnits4 : gridUnionAreaUnits output4 = 262144 := by decide +kernel

noncomputable def phaseMass4 : ℝ := singlePhaseMass (273125493/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw4 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass4_eq : phaseMass4 = (273125493/1638400000000 : ℝ) := by
  unfold phaseMass4
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw4 output4 cover4 source4
    (gridTreeUnionCheck_sound 32768 raw4 output4 cover4 source4 tree4 checked4)
    _ (by norm_num) _, areaUnits4]
  norm_num

-- Frozen phase 2501, atom 3189, type 0, source (33,54).
def leavesData5 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves5 : Fin 1 → DyadicLeaf := leavesData5.get
def raw5 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 33 54 leaves5 i
def outputData5 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨8448,8704,13824,14080⟩) (.single ⟨13824,14080,8448,8704⟩)) (.node (.single ⟨18688,18944,24064,24320⟩) (.single ⟨24064,24320,18688,18944⟩)))
def output5 : Fin 4 → GridBox := outputData5.get
def coverData5 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData5 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover5 (i : Fin 4) : Fin 4 := ⟨coverData5.get i % 4, Nat.mod_lt _ (by decide)⟩
def source5 (i : Fin 4) : Fin 4 := ⟨sourceData5.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree5 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 (.cutY 14336 (.cutX 9216 (.cutY 13312 .empty (.cutX 8704 (.cutY 13824 .empty (.cutX 8448 .empty (.cutY 14080 .full .empty))) .empty)) .empty) .empty) .empty)) (.cutY 12288 (.cutX 14336 (.cutY 10240 (.cutX 13312 .empty (.cutY 9216 (.cutX 13824 .empty (.cutY 8704 (.cutX 14080 (.cutY 8448 .empty .full) .empty) .empty)) .empty)) .empty) .empty) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 .empty (.cutY 22528 .empty (.cutX 19456 (.cutY 23552 .empty (.cutX 18944 (.cutY 24064 .empty (.cutX 18688 .empty (.cutY 24320 .full .empty))) .empty)) .empty)))) (.cutY 20480 (.cutX 22528 .empty (.cutY 18432 .empty (.cutX 23552 .empty (.cutY 19456 (.cutX 24064 .empty (.cutY 18944 (.cutX 24320 (.cutY 18688 .empty .full) .empty) .empty)) .empty)))) .empty)) .empty) .empty)))

theorem metadata5 : 0<256811171 ∧ 33<128 ∧ 54<128 ∧ 0<4 ∧
    3189/4160=0 ∧ 3189%4160=3189 ∧ ∀ i, (leaves5 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData5).mp
    (by decide +kernel)

theorem sourceChecked5_0 : ∀ i : Fin 4,
    (fun i => output5 i = raw5 (source5 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked5 : ∀ i : Fin 4, (fun i => output5 i = raw5 (source5 i)) i :=
  forallFin_of_zero_offset (fun i => output5 i = raw5 (source5 i)) sourceChecked5_0

theorem coverChecked5_0 : ∀ i : Fin 4,
    (fun i => (output5 (cover5 i)).ContainsBox (raw5 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked5 : ∀ i : Fin 4, (fun i => (output5 (cover5 i)).ContainsBox (raw5 i)) i :=
  forallFin_of_zero_offset (fun i => (output5 (cover5 i)).ContainsBox (raw5 i)) coverChecked5_0

theorem treeChecked5 : tree5.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves5 : List.ofFn output5 = tree5.leaves ⟨0,32768,0,32768⟩ := by
  unfold output5
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked5 : gridTreeUnionCheck 32768 raw5 output5 cover5 source5 tree5 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked5, coverChecked5, treeChecked5, treeLeaves5⟩

theorem areaUnits5 : gridUnionAreaUnits output5 = 262144 := by decide +kernel

noncomputable def phaseMass5 : ℝ := singlePhaseMass (256811171/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw5 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass5_eq : phaseMass5 = (256811171/1638400000000 : ℝ) := by
  unfold phaseMass5
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw5 output5 cover5 source5
    (gridTreeUnionCheck_sound 32768 raw5 output5 cover5 source5 tree5 checked5)
    _ (by norm_num) _, areaUnits5]
  norm_num

-- Frozen phase 2502, atom 7281, type 1, source (32,49).
def leavesData6 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves6 : Fin 4 → DyadicLeaf := leavesData6.get
def raw6 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 32 49 leaves6 i
def outputData6 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨8192,8320,12544,12672⟩) (.single ⟨8192,8320,12672,12800⟩)) (.node (.single ⟨8320,8448,12544,12672⟩) (.single ⟨8320,8448,12672,12800⟩))) (.node (.node (.single ⟨12544,12672,8192,8320⟩) (.single ⟨12544,12672,8320,8448⟩)) (.node (.single ⟨12672,12800,8192,8320⟩) (.single ⟨12672,12800,8320,8448⟩)))) (.node (.node (.node (.single ⟨19968,20096,24320,24448⟩) (.single ⟨19968,20096,24448,24576⟩)) (.node (.single ⟨20096,20224,24320,24448⟩) (.single ⟨20096,20224,24448,24576⟩))) (.node (.node (.single ⟨24320,24448,19968,20096⟩) (.single ⟨24320,24448,20096,20224⟩)) (.node (.single ⟨24448,24576,19968,20096⟩) (.single ⟨24448,24576,20096,20224⟩)))))
def output6 : Fin 16 → GridBox := outputData6.get
def coverData6 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData6 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover6 (i : Fin 16) : Fin 16 := ⟨coverData6.get i % 16, Nat.mod_lt _ (by decide)⟩
def source6 (i : Fin 16) : Fin 16 := ⟨sourceData6.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree6 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 (.cutY 14336 (.cutX 9216 (.cutY 13312 (.cutX 8704 (.cutY 12800 (.cutX 8448 (.cutY 12544 .empty (.cutX 8320 (.cutY 12672 .full .full) (.cutY 12672 .full .full))) .empty) .empty) .empty) .empty) .empty) .empty) .empty)) (.cutY 12288 (.cutX 14336 (.cutY 10240 (.cutX 13312 (.cutY 9216 (.cutX 12800 (.cutY 8704 (.cutX 12544 .empty (.cutY 8448 (.cutX 12672 (.cutY 8320 .full .full) (.cutY 8320 .full .full)) .empty)) .empty) .empty) .empty) .empty) .empty) .empty) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 .empty (.cutY 22528 .empty (.cutX 19456 .empty (.cutY 23552 .empty (.cutX 19968 .empty (.cutY 24064 .empty (.cutX 20224 (.cutY 24320 .empty (.cutX 20096 (.cutY 24448 .full .full) (.cutY 24448 .full .full))) .empty)))))))) (.cutY 20480 (.cutX 22528 .empty (.cutY 18432 .empty (.cutX 23552 .empty (.cutY 19456 .empty (.cutX 24064 .empty (.cutY 19968 .empty (.cutX 24320 .empty (.cutY 20224 (.cutX 24448 (.cutY 20096 .full .full) (.cutY 20096 .full .full)) .empty)))))))) .empty)) .empty) .empty)))

theorem metadata6 : 0<134822691 ∧ 32<128 ∧ 49<128 ∧ 1<4 ∧
    7281/4160=1 ∧ 7281%4160=3121 ∧ ∀ i, (leaves6 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData6).mp
    (by decide +kernel)

theorem sourceChecked6_0 : ∀ i : Fin 16,
    (fun i => output6 i = raw6 (source6 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked6 : ∀ i : Fin 16, (fun i => output6 i = raw6 (source6 i)) i :=
  forallFin_of_zero_offset (fun i => output6 i = raw6 (source6 i)) sourceChecked6_0

theorem coverChecked6_0 : ∀ i : Fin 16,
    (fun i => (output6 (cover6 i)).ContainsBox (raw6 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked6 : ∀ i : Fin 16, (fun i => (output6 (cover6 i)).ContainsBox (raw6 i)) i :=
  forallFin_of_zero_offset (fun i => (output6 (cover6 i)).ContainsBox (raw6 i)) coverChecked6_0

theorem treeChecked6 : tree6.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves6 : List.ofFn output6 = tree6.leaves ⟨0,32768,0,32768⟩ := by
  unfold output6
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked6 : gridTreeUnionCheck 32768 raw6 output6 cover6 source6 tree6 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked6, coverChecked6, treeChecked6, treeLeaves6⟩

theorem areaUnits6 : gridUnionAreaUnits output6 = 262144 := by decide +kernel

noncomputable def phaseMass6 : ℝ := singlePhaseMass (134822691/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw6 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass6_eq : phaseMass6 = (134822691/1638400000000 : ℝ) := by
  unfold phaseMass6
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw6 output6 cover6 source6
    (gridTreeUnionCheck_sound 32768 raw6 output6 cover6 source6 tree6 checked6)
    _ (by norm_num) _, areaUnits6]
  norm_num

-- Frozen phase 2503, atom 2290, type 0, source (21,43).
def leavesData7 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves7 : Fin 1 → DyadicLeaf := leavesData7.get
def raw7 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 21 43 leaves7 i
def outputData7 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨5376,5632,11008,11264⟩) (.single ⟨11008,11264,5376,5632⟩)) (.node (.single ⟨21504,21760,27136,27392⟩) (.single ⟨27136,27392,21504,21760⟩)))
def output7 : Fin 4 → GridBox := outputData7.get
def coverData7 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData7 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover7 (i : Fin 4) : Fin 4 := ⟨coverData7.get i % 4, Nat.mod_lt _ (by decide)⟩
def source7 (i : Fin 4) : Fin 4 := ⟨sourceData7.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree7 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 (.cutY 10240 .empty (.cutX 5120 .empty (.cutY 11264 (.cutX 5632 (.cutY 10752 .empty (.cutX 5376 .empty (.cutY 11008 .empty .full))) .empty) .empty))) .empty) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 .empty (.cutY 6144 (.cutX 11264 (.cutY 5120 .empty (.cutX 10752 .empty (.cutY 5632 (.cutX 11008 .empty (.cutY 5376 .empty .full)) .empty))) .empty) .empty))) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 (.cutY 26624 .empty (.cutX 21504 .empty (.cutY 27648 (.cutX 22016 (.cutY 27136 .empty (.cutX 21760 (.cutY 27392 .full .empty) .empty)) .empty) .empty))) .empty) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 .empty (.cutY 22528 (.cutX 27648 (.cutY 21504 .empty (.cutX 27136 .empty (.cutY 22016 (.cutX 27392 (.cutY 21760 .full .empty) .empty) .empty))) .empty) .empty))) .empty) .empty))))

theorem metadata7 : 0<73667111 ∧ 21<128 ∧ 43<128 ∧ 0<4 ∧
    2290/4160=0 ∧ 2290%4160=2290 ∧ ∀ i, (leaves7 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData7).mp
    (by decide +kernel)

theorem sourceChecked7_0 : ∀ i : Fin 4,
    (fun i => output7 i = raw7 (source7 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked7 : ∀ i : Fin 4, (fun i => output7 i = raw7 (source7 i)) i :=
  forallFin_of_zero_offset (fun i => output7 i = raw7 (source7 i)) sourceChecked7_0

theorem coverChecked7_0 : ∀ i : Fin 4,
    (fun i => (output7 (cover7 i)).ContainsBox (raw7 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked7 : ∀ i : Fin 4, (fun i => (output7 (cover7 i)).ContainsBox (raw7 i)) i :=
  forallFin_of_zero_offset (fun i => (output7 (cover7 i)).ContainsBox (raw7 i)) coverChecked7_0

theorem treeChecked7 : tree7.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves7 : List.ofFn output7 = tree7.leaves ⟨0,32768,0,32768⟩ := by
  unfold output7
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked7 : gridTreeUnionCheck 32768 raw7 output7 cover7 source7 tree7 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked7, coverChecked7, treeChecked7, treeLeaves7⟩

theorem areaUnits7 : gridUnionAreaUnits output7 = 262144 := by decide +kernel

noncomputable def phaseMass7 : ℝ := singlePhaseMass (73667111/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw7 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass7_eq : phaseMass7 = (73667111/1638400000000 : ℝ) := by
  unfold phaseMass7
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw7 output7 cover7 source7
    (gridTreeUnionCheck_sound 32768 raw7 output7 cover7 source7 tree7 checked7)
    _ (by norm_num) _, areaUnits7]
  norm_num

-- Frozen phase 2504, atom 6269, type 1, source (19,38).
def leavesData8 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves8 : Fin 4 → DyadicLeaf := leavesData8.get
def raw8 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 19 38 leaves8 i
def outputData8 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨4864,4992,9728,9856⟩) (.single ⟨4864,4992,9856,9984⟩)) (.node (.single ⟨4992,5120,9728,9856⟩) (.single ⟨4992,5120,9856,9984⟩))) (.node (.node (.single ⟨9728,9856,4864,4992⟩) (.single ⟨9728,9856,4992,5120⟩)) (.node (.single ⟨9856,9984,4864,4992⟩) (.single ⟨9856,9984,4992,5120⟩)))) (.node (.node (.node (.single ⟨22784,22912,27648,27776⟩) (.single ⟨22784,22912,27776,27904⟩)) (.node (.single ⟨22912,23040,27648,27776⟩) (.single ⟨22912,23040,27776,27904⟩))) (.node (.node (.single ⟨27648,27776,22784,22912⟩) (.single ⟨27648,27776,22912,23040⟩)) (.node (.single ⟨27776,27904,22784,22912⟩) (.single ⟨27776,27904,22912,23040⟩)))))
def output8 : Fin 16 → GridBox := outputData8.get
def coverData8 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData8 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover8 (i : Fin 16) : Fin 16 := ⟨coverData8.get i % 16, Nat.mod_lt _ (by decide)⟩
def source8 (i : Fin 16) : Fin 16 := ⟨sourceData8.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree8 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 (.cutY 10240 (.cutX 5120 (.cutY 9216 .empty (.cutX 4608 .empty (.cutY 9728 .empty (.cutX 4864 .empty (.cutY 9984 (.cutX 4992 (.cutY 9856 .full .full) (.cutY 9856 .full .full)) .empty))))) .empty) .empty) .empty) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 (.cutY 6144 (.cutX 9216 .empty (.cutY 5120 (.cutX 9728 .empty (.cutY 4608 .empty (.cutX 9984 (.cutY 4864 .empty (.cutX 9856 (.cutY 4992 .full .full) (.cutY 4992 .full .full))) .empty))) .empty)) .empty) .empty)) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 .empty (.cutY 26624 .empty (.cutX 23552 (.cutY 27648 .empty (.cutX 23040 (.cutY 28160 (.cutX 22784 .empty (.cutY 27904 (.cutX 22912 (.cutY 27776 .full .full) (.cutY 27776 .full .full)) .empty)) .empty) .empty)) .empty))) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 .empty (.cutY 22528 .empty (.cutX 27648 .empty (.cutY 23552 (.cutX 28160 (.cutY 23040 (.cutX 27904 (.cutY 22784 .empty (.cutX 27776 (.cutY 22912 .full .full) (.cutY 22912 .full .full))) .empty) .empty) .empty) .empty))))) .empty) .empty))))

theorem metadata8 : 0<161185172 ∧ 19<128 ∧ 38<128 ∧ 1<4 ∧
    6269/4160=1 ∧ 6269%4160=2109 ∧ ∀ i, (leaves8 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData8).mp
    (by decide +kernel)

theorem sourceChecked8_0 : ∀ i : Fin 16,
    (fun i => output8 i = raw8 (source8 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked8 : ∀ i : Fin 16, (fun i => output8 i = raw8 (source8 i)) i :=
  forallFin_of_zero_offset (fun i => output8 i = raw8 (source8 i)) sourceChecked8_0

theorem coverChecked8_0 : ∀ i : Fin 16,
    (fun i => (output8 (cover8 i)).ContainsBox (raw8 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked8 : ∀ i : Fin 16, (fun i => (output8 (cover8 i)).ContainsBox (raw8 i)) i :=
  forallFin_of_zero_offset (fun i => (output8 (cover8 i)).ContainsBox (raw8 i)) coverChecked8_0

theorem treeChecked8 : tree8.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves8 : List.ofFn output8 = tree8.leaves ⟨0,32768,0,32768⟩ := by
  unfold output8
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked8 : gridTreeUnionCheck 32768 raw8 output8 cover8 source8 tree8 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked8, coverChecked8, treeChecked8, treeLeaves8⟩

theorem areaUnits8 : gridUnionAreaUnits output8 = 262144 := by decide +kernel

noncomputable def phaseMass8 : ℝ := singlePhaseMass (161185172/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw8 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass8_eq : phaseMass8 = (40296293/409600000000 : ℝ) := by
  unfold phaseMass8
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw8 output8 cover8 source8
    (gridTreeUnionCheck_sound 32768 raw8 output8 cover8 source8 tree8 checked8)
    _ (by norm_num) _, areaUnits8]
  norm_num

-- Frozen phase 2505, atom 7345, type 1, source (33,50).
def leavesData9 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves9 : Fin 4 → DyadicLeaf := leavesData9.get
def raw9 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 33 50 leaves9 i
def outputData9 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨8448,8576,12800,12928⟩) (.single ⟨8448,8576,12928,13056⟩)) (.node (.single ⟨8576,8704,12800,12928⟩) (.single ⟨8576,8704,12928,13056⟩))) (.node (.node (.single ⟨12800,12928,8448,8576⟩) (.single ⟨12800,12928,8576,8704⟩)) (.node (.single ⟨12928,13056,8448,8576⟩) (.single ⟨12928,13056,8576,8704⟩)))) (.node (.node (.node (.single ⟨19712,19840,24064,24192⟩) (.single ⟨19712,19840,24192,24320⟩)) (.node (.single ⟨19840,19968,24064,24192⟩) (.single ⟨19840,19968,24192,24320⟩))) (.node (.node (.single ⟨24064,24192,19712,19840⟩) (.single ⟨24064,24192,19840,19968⟩)) (.node (.single ⟨24192,24320,19712,19840⟩) (.single ⟨24192,24320,19840,19968⟩)))))
def output9 : Fin 16 → GridBox := outputData9.get
def coverData9 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData9 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover9 (i : Fin 16) : Fin 16 := ⟨coverData9.get i % 16, Nat.mod_lt _ (by decide)⟩
def source9 (i : Fin 16) : Fin 16 := ⟨sourceData9.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree9 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 (.cutY 14336 (.cutX 9216 (.cutY 13312 (.cutX 8704 (.cutY 12800 .empty (.cutX 8448 .empty (.cutY 13056 (.cutX 8576 (.cutY 12928 .full .full) (.cutY 12928 .full .full)) .empty))) .empty) .empty) .empty) .empty) .empty)) (.cutY 12288 (.cutX 14336 (.cutY 10240 (.cutX 13312 (.cutY 9216 (.cutX 12800 .empty (.cutY 8704 (.cutX 13056 (.cutY 8448 .empty (.cutX 12928 (.cutY 8576 .full .full) (.cutY 8576 .full .full))) .empty) .empty)) .empty) .empty) .empty) .empty) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 .empty (.cutY 22528 .empty (.cutX 19456 .empty (.cutY 23552 .empty (.cutX 19968 (.cutY 24064 .empty (.cutX 19712 .empty (.cutY 24320 (.cutX 19840 (.cutY 24192 .full .full) (.cutY 24192 .full .full)) .empty))) .empty)))))) (.cutY 20480 (.cutX 22528 .empty (.cutY 18432 .empty (.cutX 23552 .empty (.cutY 19456 .empty (.cutX 24064 .empty (.cutY 19968 (.cutX 24320 (.cutY 19712 .empty (.cutX 24192 (.cutY 19840 .full .full) (.cutY 19840 .full .full))) .empty) .empty)))))) .empty)) .empty) .empty)))

theorem metadata9 : 0<134822691 ∧ 33<128 ∧ 50<128 ∧ 1<4 ∧
    7345/4160=1 ∧ 7345%4160=3185 ∧ ∀ i, (leaves9 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData9).mp
    (by decide +kernel)

theorem sourceChecked9_0 : ∀ i : Fin 16,
    (fun i => output9 i = raw9 (source9 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked9 : ∀ i : Fin 16, (fun i => output9 i = raw9 (source9 i)) i :=
  forallFin_of_zero_offset (fun i => output9 i = raw9 (source9 i)) sourceChecked9_0

theorem coverChecked9_0 : ∀ i : Fin 16,
    (fun i => (output9 (cover9 i)).ContainsBox (raw9 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked9 : ∀ i : Fin 16, (fun i => (output9 (cover9 i)).ContainsBox (raw9 i)) i :=
  forallFin_of_zero_offset (fun i => (output9 (cover9 i)).ContainsBox (raw9 i)) coverChecked9_0

theorem treeChecked9 : tree9.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves9 : List.ofFn output9 = tree9.leaves ⟨0,32768,0,32768⟩ := by
  unfold output9
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked9 : gridTreeUnionCheck 32768 raw9 output9 cover9 source9 tree9 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked9, coverChecked9, treeChecked9, treeLeaves9⟩

theorem areaUnits9 : gridUnionAreaUnits output9 = 262144 := by decide +kernel

noncomputable def phaseMass9 : ℝ := singlePhaseMass (134822691/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw9 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass9_eq : phaseMass9 = (134822691/1638400000000 : ℝ) := by
  unfold phaseMass9
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw9 output9 cover9 source9
    (gridTreeUnionCheck_sound 32768 raw9 output9 cover9 source9 tree9 checked9)
    _ (by norm_num) _, areaUnits9]
  norm_num

-- Frozen phase 2506, atom 6616, type 1, source (23,41).
def leavesData10 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves10 : Fin 4 → DyadicLeaf := leavesData10.get
def raw10 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 23 41 leaves10 i
def outputData10 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨5888,6016,10496,10624⟩) (.single ⟨5888,6016,10624,10752⟩)) (.node (.single ⟨6016,6144,10496,10624⟩) (.single ⟨6016,6144,10624,10752⟩))) (.node (.node (.single ⟨10496,10624,5888,6016⟩) (.single ⟨10496,10624,6016,6144⟩)) (.node (.single ⟨10624,10752,5888,6016⟩) (.single ⟨10624,10752,6016,6144⟩)))) (.node (.node (.node (.single ⟨22016,22144,26624,26752⟩) (.single ⟨22016,22144,26752,26880⟩)) (.node (.single ⟨22144,22272,26624,26752⟩) (.single ⟨22144,22272,26752,26880⟩))) (.node (.node (.single ⟨26624,26752,22016,22144⟩) (.single ⟨26624,26752,22144,22272⟩)) (.node (.single ⟨26752,26880,22016,22144⟩) (.single ⟨26752,26880,22144,22272⟩)))))
def output10 : Fin 16 → GridBox := outputData10.get
def coverData10 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData10 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover10 (i : Fin 16) : Fin 16 := ⟨coverData10.get i % 16, Nat.mod_lt _ (by decide)⟩
def source10 (i : Fin 16) : Fin 16 := ⟨sourceData10.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree10 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 (.cutY 10240 .empty (.cutX 5120 .empty (.cutY 11264 (.cutX 5632 .empty (.cutY 10752 (.cutX 5888 .empty (.cutY 10496 .empty (.cutX 6016 (.cutY 10624 .full .full) (.cutY 10624 .full .full)))) .empty)) .empty))) .empty) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 .empty (.cutY 6144 (.cutX 11264 (.cutY 5120 .empty (.cutX 10752 (.cutY 5632 .empty (.cutX 10496 .empty (.cutY 5888 .empty (.cutX 10624 (.cutY 6016 .full .full) (.cutY 6016 .full .full))))) .empty)) .empty) .empty))) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 (.cutY 26624 .empty (.cutX 21504 .empty (.cutY 27648 (.cutX 22016 .empty (.cutY 27136 (.cutX 22272 (.cutY 26880 (.cutX 22144 (.cutY 26752 .full .full) (.cutY 26752 .full .full)) .empty) .empty) .empty)) .empty))) .empty) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 .empty (.cutY 22528 (.cutX 27648 (.cutY 21504 .empty (.cutX 27136 (.cutY 22016 .empty (.cutX 26880 (.cutY 22272 (.cutX 26752 (.cutY 22144 .full .full) (.cutY 22144 .full .full)) .empty) .empty)) .empty)) .empty) .empty))) .empty) .empty))))

theorem metadata10 : 0<22259151 ∧ 23<128 ∧ 41<128 ∧ 1<4 ∧
    6616/4160=1 ∧ 6616%4160=2456 ∧ ∀ i, (leaves10 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData10).mp
    (by decide +kernel)

theorem sourceChecked10_0 : ∀ i : Fin 16,
    (fun i => output10 i = raw10 (source10 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked10 : ∀ i : Fin 16, (fun i => output10 i = raw10 (source10 i)) i :=
  forallFin_of_zero_offset (fun i => output10 i = raw10 (source10 i)) sourceChecked10_0

theorem coverChecked10_0 : ∀ i : Fin 16,
    (fun i => (output10 (cover10 i)).ContainsBox (raw10 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked10 : ∀ i : Fin 16, (fun i => (output10 (cover10 i)).ContainsBox (raw10 i)) i :=
  forallFin_of_zero_offset (fun i => (output10 (cover10 i)).ContainsBox (raw10 i)) coverChecked10_0

theorem treeChecked10 : tree10.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves10 : List.ofFn output10 = tree10.leaves ⟨0,32768,0,32768⟩ := by
  unfold output10
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked10 : gridTreeUnionCheck 32768 raw10 output10 cover10 source10 tree10 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked10, coverChecked10, treeChecked10, treeLeaves10⟩

theorem areaUnits10 : gridUnionAreaUnits output10 = 262144 := by decide +kernel

noncomputable def phaseMass10 : ℝ := singlePhaseMass (22259151/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw10 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass10_eq : phaseMass10 = (22259151/1638400000000 : ℝ) := by
  unfold phaseMass10
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw10 output10 cover10 source10
    (gridTreeUnionCheck_sound 32768 raw10 output10 cover10 source10 tree10 checked10)
    _ (by norm_num) _, areaUnits10]
  norm_num

-- Frozen phase 2507, atom 1324, type 0, source (11,37).
def leavesData11 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves11 : Fin 1 → DyadicLeaf := leavesData11.get
def raw11 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 11 37 leaves11 i
def outputData11 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨2816,3072,9472,9728⟩) (.single ⟨9472,9728,2816,3072⟩)) (.node (.single ⟨23040,23296,29696,29952⟩) (.single ⟨29696,29952,23040,23296⟩)))
def output11 : Fin 4 → GridBox := outputData11.get
def coverData11 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData11 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover11 (i : Fin 4) : Fin 4 := ⟨coverData11.get i % 4, Nat.mod_lt _ (by decide)⟩
def source11 (i : Fin 4) : Fin 4 := ⟨sourceData11.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree11 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 .empty (.cutY 10240 (.cutX 3072 (.cutY 9216 .empty (.cutX 2560 .empty (.cutY 9728 (.cutX 2816 .empty (.cutY 9472 .empty .full)) .empty))) .empty) .empty)) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 .empty (.cutX 9216 .empty (.cutY 3072 (.cutX 9728 (.cutY 2560 .empty (.cutX 9472 .empty (.cutY 2816 .empty .full))) .empty) .empty))) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 (.cutX 23552 (.cutY 29696 .empty (.cutX 23040 .empty (.cutY 30208 (.cutX 23296 (.cutY 29952 .full .empty) .empty) .empty))) .empty) .empty))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 (.cutY 22528 .empty (.cutX 29696 .empty (.cutY 23552 (.cutX 30208 (.cutY 23040 .empty (.cutX 29952 (.cutY 23296 .full .empty) .empty)) .empty) .empty))) .empty))) .empty))))

theorem metadata11 : 0<290391823 ∧ 11<128 ∧ 37<128 ∧ 0<4 ∧
    1324/4160=0 ∧ 1324%4160=1324 ∧ ∀ i, (leaves11 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData11).mp
    (by decide +kernel)

theorem sourceChecked11_0 : ∀ i : Fin 4,
    (fun i => output11 i = raw11 (source11 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked11 : ∀ i : Fin 4, (fun i => output11 i = raw11 (source11 i)) i :=
  forallFin_of_zero_offset (fun i => output11 i = raw11 (source11 i)) sourceChecked11_0

theorem coverChecked11_0 : ∀ i : Fin 4,
    (fun i => (output11 (cover11 i)).ContainsBox (raw11 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked11 : ∀ i : Fin 4, (fun i => (output11 (cover11 i)).ContainsBox (raw11 i)) i :=
  forallFin_of_zero_offset (fun i => (output11 (cover11 i)).ContainsBox (raw11 i)) coverChecked11_0

theorem treeChecked11 : tree11.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves11 : List.ofFn output11 = tree11.leaves ⟨0,32768,0,32768⟩ := by
  unfold output11
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked11 : gridTreeUnionCheck 32768 raw11 output11 cover11 source11 tree11 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked11, coverChecked11, treeChecked11, treeLeaves11⟩

theorem areaUnits11 : gridUnionAreaUnits output11 = 262144 := by decide +kernel

noncomputable def phaseMass11 : ℝ := singlePhaseMass (290391823/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw11 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass11_eq : phaseMass11 = (290391823/1638400000000 : ℝ) := by
  unfold phaseMass11
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw11 output11 cover11 source11
    (gridTreeUnionCheck_sound 32768 raw11 output11 cover11 source11 tree11 checked11)
    _ (by norm_num) _, areaUnits11]
  norm_num

-- Frozen phase 2508, atom 4443, type 1, source (2,31).
def leavesData12 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves12 : Fin 1 → DyadicLeaf := leavesData12.get
def raw12 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 2 31 leaves12 i
def outputData12 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨512,768,7936,8192⟩) (.single ⟨7936,8192,512,768⟩)) (.node (.single ⟨24576,24832,32000,32256⟩) (.single ⟨32000,32256,24576,24832⟩)))
def output12 : Fin 4 → GridBox := outputData12.get
def coverData12 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData12 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover12 (i : Fin 4) : Fin 4 := ⟨coverData12.get i % 4, Nat.mod_lt _ (by decide)⟩
def source12 (i : Fin 4) : Fin 4 := ⟨sourceData12.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree12 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 (.cutY 4096 .empty (.cutX 2048 (.cutY 6144 .empty (.cutX 1024 (.cutY 7168 .empty (.cutX 512 .empty (.cutY 7680 .empty (.cutX 768 (.cutY 7936 .empty .full) .empty)))) .empty)) .empty)) (.cutY 4096 (.cutX 6144 .empty (.cutY 2048 (.cutX 7168 .empty (.cutY 1024 (.cutX 7680 .empty (.cutY 512 .empty (.cutX 7936 .empty (.cutY 768 .full .empty)))) .empty)) .empty)) .empty)) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 .empty (.cutX 26624 (.cutY 30720 .empty (.cutX 25600 (.cutY 31744 .empty (.cutX 25088 (.cutY 32256 (.cutX 24832 (.cutY 32000 .empty .full) .empty) .empty) .empty)) .empty)) .empty)) (.cutY 28672 (.cutX 30720 .empty (.cutY 26624 (.cutX 31744 .empty (.cutY 25600 (.cutX 32256 (.cutY 25088 (.cutX 32000 .empty (.cutY 24832 .full .empty)) .empty) .empty) .empty)) .empty)) .empty))))))

theorem metadata12 : 0<568444819 ∧ 2<128 ∧ 31<128 ∧ 1<4 ∧
    4443/4160=1 ∧ 4443%4160=283 ∧ ∀ i, (leaves12 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData12).mp
    (by decide +kernel)

theorem sourceChecked12_0 : ∀ i : Fin 4,
    (fun i => output12 i = raw12 (source12 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked12 : ∀ i : Fin 4, (fun i => output12 i = raw12 (source12 i)) i :=
  forallFin_of_zero_offset (fun i => output12 i = raw12 (source12 i)) sourceChecked12_0

theorem coverChecked12_0 : ∀ i : Fin 4,
    (fun i => (output12 (cover12 i)).ContainsBox (raw12 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked12 : ∀ i : Fin 4, (fun i => (output12 (cover12 i)).ContainsBox (raw12 i)) i :=
  forallFin_of_zero_offset (fun i => (output12 (cover12 i)).ContainsBox (raw12 i)) coverChecked12_0

theorem treeChecked12 : tree12.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves12 : List.ofFn output12 = tree12.leaves ⟨0,32768,0,32768⟩ := by
  unfold output12
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked12 : gridTreeUnionCheck 32768 raw12 output12 cover12 source12 tree12 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked12, coverChecked12, treeChecked12, treeLeaves12⟩

theorem areaUnits12 : gridUnionAreaUnits output12 = 262144 := by decide +kernel

noncomputable def phaseMass12 : ℝ := singlePhaseMass (568444819/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw12 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass12_eq : phaseMass12 = (568444819/1638400000000 : ℝ) := by
  unfold phaseMass12
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw12 output12 cover12 source12
    (gridTreeUnionCheck_sound 32768 raw12 output12 cover12 source12 tree12 checked12)
    _ (by norm_num) _, areaUnits12]
  norm_num

-- Frozen phase 2509, atom 767, type 0, source (6,35).
def leavesData13 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves13 : Fin 1 → DyadicLeaf := leavesData13.get
def raw13 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 6 35 leaves13 i
def outputData13 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨1536,1792,8960,9216⟩) (.single ⟨8960,9216,1536,1792⟩)) (.node (.single ⟨23552,23808,30976,31232⟩) (.single ⟨30976,31232,23552,23808⟩)))
def output13 : Fin 4 → GridBox := outputData13.get
def coverData13 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData13 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover13 (i : Fin 4) : Fin 4 := ⟨coverData13.get i % 4, Nat.mod_lt _ (by decide)⟩
def source13 (i : Fin 4) : Fin 4 := ⟨sourceData13.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree13 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 (.cutY 10240 (.cutX 1024 .empty (.cutY 9216 (.cutX 1536 .empty (.cutY 8704 .empty (.cutX 1792 (.cutY 8960 .empty .full) .empty))) .empty)) .empty) .empty) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 (.cutX 9216 (.cutY 1024 .empty (.cutX 8704 .empty (.cutY 1536 .empty (.cutX 8960 .empty (.cutY 1792 .full .empty))))) .empty) .empty) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 .empty (.cutX 23552 .empty (.cutY 31744 (.cutX 24064 (.cutY 31232 (.cutX 23808 (.cutY 30976 .empty .full) .empty) .empty) .empty) .empty))))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 .empty (.cutY 22528 .empty (.cutX 31744 (.cutY 23552 .empty (.cutX 31232 (.cutY 24064 (.cutX 30976 .empty (.cutY 23808 .full .empty)) .empty) .empty)) .empty))))) .empty))))

theorem metadata13 : 0<523383676 ∧ 6<128 ∧ 35<128 ∧ 0<4 ∧
    767/4160=0 ∧ 767%4160=767 ∧ ∀ i, (leaves13 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData13).mp
    (by decide +kernel)

theorem sourceChecked13_0 : ∀ i : Fin 4,
    (fun i => output13 i = raw13 (source13 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked13 : ∀ i : Fin 4, (fun i => output13 i = raw13 (source13 i)) i :=
  forallFin_of_zero_offset (fun i => output13 i = raw13 (source13 i)) sourceChecked13_0

theorem coverChecked13_0 : ∀ i : Fin 4,
    (fun i => (output13 (cover13 i)).ContainsBox (raw13 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked13 : ∀ i : Fin 4, (fun i => (output13 (cover13 i)).ContainsBox (raw13 i)) i :=
  forallFin_of_zero_offset (fun i => (output13 (cover13 i)).ContainsBox (raw13 i)) coverChecked13_0

theorem treeChecked13 : tree13.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves13 : List.ofFn output13 = tree13.leaves ⟨0,32768,0,32768⟩ := by
  unfold output13
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked13 : gridTreeUnionCheck 32768 raw13 output13 cover13 source13 tree13 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked13, coverChecked13, treeChecked13, treeLeaves13⟩

theorem areaUnits13 : gridUnionAreaUnits output13 = 262144 := by decide +kernel

noncomputable def phaseMass13 : ℝ := singlePhaseMass (523383676/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw13 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass13_eq : phaseMass13 = (130845919/409600000000 : ℝ) := by
  unfold phaseMass13
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw13 output13 cover13 source13
    (gridTreeUnionCheck_sound 32768 raw13 output13 cover13 source13 tree13 checked13)
    _ (by norm_num) _, areaUnits13]
  norm_num

-- Frozen phase 2510, atom 1107, type 0, source (9,36).
def leavesData14 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves14 : Fin 1 → DyadicLeaf := leavesData14.get
def raw14 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 9 36 leaves14 i
def outputData14 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨2304,2560,9216,9472⟩) (.single ⟨9216,9472,2304,2560⟩)) (.node (.single ⟨23296,23552,30208,30464⟩) (.single ⟨30208,30464,23296,23552⟩)))
def output14 : Fin 4 → GridBox := outputData14.get
def coverData14 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData14 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover14 (i : Fin 4) : Fin 4 := ⟨coverData14.get i % 4, Nat.mod_lt _ (by decide)⟩
def source14 (i : Fin 4) : Fin 4 := ⟨sourceData14.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree14 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 .empty (.cutY 10240 (.cutX 3072 (.cutY 9216 .empty (.cutX 2560 (.cutY 9728 (.cutX 2304 .empty (.cutY 9472 .full .empty)) .empty) .empty)) .empty) .empty)) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 .empty (.cutX 9216 .empty (.cutY 3072 (.cutX 9728 (.cutY 2560 (.cutX 9472 (.cutY 2304 .empty .full) .empty) .empty) .empty) .empty))) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 (.cutX 23552 (.cutY 29696 .empty (.cutX 23040 .empty (.cutY 30208 .empty (.cutX 23296 .empty (.cutY 30464 .full .empty))))) .empty) .empty))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 (.cutY 22528 .empty (.cutX 29696 .empty (.cutY 23552 (.cutX 30208 .empty (.cutY 23040 .empty (.cutX 30464 (.cutY 23296 .empty .full) .empty))) .empty))) .empty))) .empty))))

theorem metadata14 : 0<290391823 ∧ 9<128 ∧ 36<128 ∧ 0<4 ∧
    1107/4160=0 ∧ 1107%4160=1107 ∧ ∀ i, (leaves14 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData14).mp
    (by decide +kernel)

theorem sourceChecked14_0 : ∀ i : Fin 4,
    (fun i => output14 i = raw14 (source14 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked14 : ∀ i : Fin 4, (fun i => output14 i = raw14 (source14 i)) i :=
  forallFin_of_zero_offset (fun i => output14 i = raw14 (source14 i)) sourceChecked14_0

theorem coverChecked14_0 : ∀ i : Fin 4,
    (fun i => (output14 (cover14 i)).ContainsBox (raw14 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked14 : ∀ i : Fin 4, (fun i => (output14 (cover14 i)).ContainsBox (raw14 i)) i :=
  forallFin_of_zero_offset (fun i => (output14 (cover14 i)).ContainsBox (raw14 i)) coverChecked14_0

theorem treeChecked14 : tree14.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves14 : List.ofFn output14 = tree14.leaves ⟨0,32768,0,32768⟩ := by
  unfold output14
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked14 : gridTreeUnionCheck 32768 raw14 output14 cover14 source14 tree14 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked14, coverChecked14, treeChecked14, treeLeaves14⟩

theorem areaUnits14 : gridUnionAreaUnits output14 = 262144 := by decide +kernel

noncomputable def phaseMass14 : ℝ := singlePhaseMass (290391823/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw14 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass14_eq : phaseMass14 = (290391823/1638400000000 : ℝ) := by
  unfold phaseMass14
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw14 output14 cover14 source14
    (gridTreeUnionCheck_sound 32768 raw14 output14 cover14 source14 tree14 checked14)
    _ (by norm_num) _, areaUnits14]
  norm_num

-- Frozen phase 2511, atom 2542, type 0, source (24,46).
def leavesData15 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves15 : Fin 1 → DyadicLeaf := leavesData15.get
def raw15 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 24 46 leaves15 i
def outputData15 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨6144,6400,11776,12032⟩) (.single ⟨11776,12032,6144,6400⟩)) (.node (.single ⟨20736,20992,26368,26624⟩) (.single ⟨26368,26624,20736,20992⟩)))
def output15 : Fin 4 → GridBox := outputData15.get
def coverData15 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData15 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover15 (i : Fin 4) : Fin 4 := ⟨coverData15.get i % 4, Nat.mod_lt _ (by decide)⟩
def source15 (i : Fin 4) : Fin 4 := ⟨sourceData15.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree15 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 .empty (.cutY 10240 .empty (.cutX 7168 (.cutY 11264 .empty (.cutX 6656 (.cutY 11776 .empty (.cutX 6400 (.cutY 12032 .full .empty) .empty)) .empty)) .empty))) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 .empty (.cutY 6144 .empty (.cutX 11264 .empty (.cutY 7168 (.cutX 11776 .empty (.cutY 6656 (.cutX 12032 (.cutY 6400 .full .empty) .empty) .empty)) .empty))))) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 (.cutY 26624 (.cutX 21504 (.cutY 25600 .empty (.cutX 20992 (.cutY 26112 .empty (.cutX 20736 .empty (.cutY 26368 .empty .full))) .empty)) .empty) .empty) .empty) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 (.cutY 22528 (.cutX 25600 .empty (.cutY 21504 (.cutX 26112 .empty (.cutY 20992 (.cutX 26368 .empty (.cutY 20736 .empty .full)) .empty)) .empty)) .empty) .empty)) .empty) .empty))))

theorem metadata15 : 0<214868664 ∧ 24<128 ∧ 46<128 ∧ 0<4 ∧
    2542/4160=0 ∧ 2542%4160=2542 ∧ ∀ i, (leaves15 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData15).mp
    (by decide +kernel)

theorem sourceChecked15_0 : ∀ i : Fin 4,
    (fun i => output15 i = raw15 (source15 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked15 : ∀ i : Fin 4, (fun i => output15 i = raw15 (source15 i)) i :=
  forallFin_of_zero_offset (fun i => output15 i = raw15 (source15 i)) sourceChecked15_0

theorem coverChecked15_0 : ∀ i : Fin 4,
    (fun i => (output15 (cover15 i)).ContainsBox (raw15 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked15 : ∀ i : Fin 4, (fun i => (output15 (cover15 i)).ContainsBox (raw15 i)) i :=
  forallFin_of_zero_offset (fun i => (output15 (cover15 i)).ContainsBox (raw15 i)) coverChecked15_0

theorem treeChecked15 : tree15.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves15 : List.ofFn output15 = tree15.leaves ⟨0,32768,0,32768⟩ := by
  unfold output15
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked15 : gridTreeUnionCheck 32768 raw15 output15 cover15 source15 tree15 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked15, coverChecked15, treeChecked15, treeLeaves15⟩

theorem areaUnits15 : gridUnionAreaUnits output15 = 262144 := by decide +kernel

noncomputable def phaseMass15 : ℝ := singlePhaseMass (214868664/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw15 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass15_eq : phaseMass15 = (26858583/204800000000 : ℝ) := by
  unfold phaseMass15
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw15 output15 cover15 source15
    (gridTreeUnionCheck_sound 32768 raw15 output15 cover15 source15 tree15 checked15)
    _ (by norm_num) _, areaUnits15]
  norm_num

-- Frozen phase 2512, atom 2021, type 0, source (18,41).
def leavesData16 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves16 : Fin 1 → DyadicLeaf := leavesData16.get
def raw16 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 18 41 leaves16 i
def outputData16 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨4608,4864,10496,10752⟩) (.single ⟨10496,10752,4608,4864⟩)) (.node (.single ⟨22016,22272,27904,28160⟩) (.single ⟨27904,28160,22016,22272⟩)))
def output16 : Fin 4 → GridBox := outputData16.get
def coverData16 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData16 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover16 (i : Fin 4) : Fin 4 := ⟨coverData16.get i % 4, Nat.mod_lt _ (by decide)⟩
def source16 (i : Fin 4) : Fin 4 := ⟨sourceData16.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree16 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 (.cutY 10240 .empty (.cutX 5120 (.cutY 11264 (.cutX 4608 .empty (.cutY 10752 (.cutX 4864 (.cutY 10496 .empty .full) .empty) .empty)) .empty) .empty)) .empty) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 .empty (.cutY 6144 (.cutX 11264 (.cutY 5120 (.cutX 10752 (.cutY 4608 .empty (.cutX 10496 .empty (.cutY 4864 .full .empty))) .empty) .empty) .empty) .empty))) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 (.cutY 26624 .empty (.cutX 21504 .empty (.cutY 27648 .empty (.cutX 22016 .empty (.cutY 28160 (.cutX 22272 (.cutY 27904 .empty .full) .empty) .empty))))) .empty) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 .empty (.cutY 22528 (.cutX 27648 .empty (.cutY 21504 .empty (.cutX 28160 (.cutY 22016 .empty (.cutX 27904 .empty (.cutY 22272 .full .empty))) .empty))) .empty))) .empty) .empty))))

theorem metadata16 : 0<73667111 ∧ 18<128 ∧ 41<128 ∧ 0<4 ∧
    2021/4160=0 ∧ 2021%4160=2021 ∧ ∀ i, (leaves16 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData16).mp
    (by decide +kernel)

theorem sourceChecked16_0 : ∀ i : Fin 4,
    (fun i => output16 i = raw16 (source16 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked16 : ∀ i : Fin 4, (fun i => output16 i = raw16 (source16 i)) i :=
  forallFin_of_zero_offset (fun i => output16 i = raw16 (source16 i)) sourceChecked16_0

theorem coverChecked16_0 : ∀ i : Fin 4,
    (fun i => (output16 (cover16 i)).ContainsBox (raw16 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked16 : ∀ i : Fin 4, (fun i => (output16 (cover16 i)).ContainsBox (raw16 i)) i :=
  forallFin_of_zero_offset (fun i => (output16 (cover16 i)).ContainsBox (raw16 i)) coverChecked16_0

theorem treeChecked16 : tree16.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves16 : List.ofFn output16 = tree16.leaves ⟨0,32768,0,32768⟩ := by
  unfold output16
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked16 : gridTreeUnionCheck 32768 raw16 output16 cover16 source16 tree16 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked16, coverChecked16, treeChecked16, treeLeaves16⟩

theorem areaUnits16 : gridUnionAreaUnits output16 = 262144 := by decide +kernel

noncomputable def phaseMass16 : ℝ := singlePhaseMass (73667111/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw16 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass16_eq : phaseMass16 = (73667111/1638400000000 : ℝ) := by
  unfold phaseMass16
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw16 output16 cover16 source16
    (gridTreeUnionCheck_sound 32768 raw16 output16 cover16 source16 tree16 checked16)
    _ (by norm_num) _, areaUnits16]
  norm_num

-- Frozen phase 2513, atom 2460, type 0, source (23,45).
def leavesData17 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves17 : Fin 1 → DyadicLeaf := leavesData17.get
def raw17 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 23 45 leaves17 i
def outputData17 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨5888,6144,11520,11776⟩) (.single ⟨11520,11776,5888,6144⟩)) (.node (.single ⟨20992,21248,26624,26880⟩) (.single ⟨26624,26880,20992,21248⟩)))
def output17 : Fin 4 → GridBox := outputData17.get
def coverData17 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData17 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover17 (i : Fin 4) : Fin 4 := ⟨coverData17.get i % 4, Nat.mod_lt _ (by decide)⟩
def source17 (i : Fin 4) : Fin 4 := ⟨sourceData17.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree17 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 (.cutY 10240 .empty (.cutX 5120 .empty (.cutY 11264 .empty (.cutX 5632 .empty (.cutY 11776 (.cutX 5888 .empty (.cutY 11520 .empty .full)) .empty))))) .empty) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 .empty (.cutY 6144 (.cutX 11264 .empty (.cutY 5120 .empty (.cutX 11776 (.cutY 5632 .empty (.cutX 11520 .empty (.cutY 5888 .empty .full))) .empty))) .empty))) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 (.cutY 26624 .empty (.cutX 21504 (.cutY 27648 (.cutX 20992 .empty (.cutY 27136 (.cutX 21248 (.cutY 26880 .full .empty) .empty) .empty)) .empty) .empty)) .empty) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 .empty (.cutY 22528 (.cutX 27648 (.cutY 21504 (.cutX 27136 (.cutY 20992 .empty (.cutX 26880 (.cutY 21248 .full .empty) .empty)) .empty) .empty) .empty) .empty))) .empty) .empty))))

theorem metadata17 : 0<73667111 ∧ 23<128 ∧ 45<128 ∧ 0<4 ∧
    2460/4160=0 ∧ 2460%4160=2460 ∧ ∀ i, (leaves17 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData17).mp
    (by decide +kernel)

theorem sourceChecked17_0 : ∀ i : Fin 4,
    (fun i => output17 i = raw17 (source17 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked17 : ∀ i : Fin 4, (fun i => output17 i = raw17 (source17 i)) i :=
  forallFin_of_zero_offset (fun i => output17 i = raw17 (source17 i)) sourceChecked17_0

theorem coverChecked17_0 : ∀ i : Fin 4,
    (fun i => (output17 (cover17 i)).ContainsBox (raw17 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked17 : ∀ i : Fin 4, (fun i => (output17 (cover17 i)).ContainsBox (raw17 i)) i :=
  forallFin_of_zero_offset (fun i => (output17 (cover17 i)).ContainsBox (raw17 i)) coverChecked17_0

theorem treeChecked17 : tree17.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves17 : List.ofFn output17 = tree17.leaves ⟨0,32768,0,32768⟩ := by
  unfold output17
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked17 : gridTreeUnionCheck 32768 raw17 output17 cover17 source17 tree17 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked17, coverChecked17, treeChecked17, treeLeaves17⟩

theorem areaUnits17 : gridUnionAreaUnits output17 = 262144 := by decide +kernel

noncomputable def phaseMass17 : ℝ := singlePhaseMass (73667111/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw17 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass17_eq : phaseMass17 = (73667111/1638400000000 : ℝ) := by
  unfold phaseMass17
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw17 output17 cover17 source17
    (gridTreeUnionCheck_sound 32768 raw17 output17 cover17 source17 tree17 checked17)
    _ (by norm_num) _, areaUnits17]
  norm_num

-- Frozen phase 2514, atom 6698, type 1, source (24,42).
def leavesData18 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves18 : Fin 4 → DyadicLeaf := leavesData18.get
def raw18 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 24 42 leaves18 i
def outputData18 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨6144,6272,10752,10880⟩) (.single ⟨6144,6272,10880,11008⟩)) (.node (.single ⟨6272,6400,10752,10880⟩) (.single ⟨6272,6400,10880,11008⟩))) (.node (.node (.single ⟨10752,10880,6144,6272⟩) (.single ⟨10752,10880,6272,6400⟩)) (.node (.single ⟨10880,11008,6144,6272⟩) (.single ⟨10880,11008,6272,6400⟩)))) (.node (.node (.node (.single ⟨21760,21888,26368,26496⟩) (.single ⟨21760,21888,26496,26624⟩)) (.node (.single ⟨21888,22016,26368,26496⟩) (.single ⟨21888,22016,26496,26624⟩))) (.node (.node (.single ⟨26368,26496,21760,21888⟩) (.single ⟨26368,26496,21888,22016⟩)) (.node (.single ⟨26496,26624,21760,21888⟩) (.single ⟨26496,26624,21888,22016⟩)))))
def output18 : Fin 16 → GridBox := outputData18.get
def coverData18 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData18 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover18 (i : Fin 16) : Fin 16 := ⟨coverData18.get i % 16, Nat.mod_lt _ (by decide)⟩
def source18 (i : Fin 16) : Fin 16 := ⟨sourceData18.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree18 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 .empty (.cutY 10240 .empty (.cutX 7168 (.cutY 11264 (.cutX 6656 (.cutY 10752 .empty (.cutX 6400 (.cutY 11008 (.cutX 6272 (.cutY 10880 .full .full) (.cutY 10880 .full .full)) .empty) .empty)) .empty) .empty) .empty))) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 .empty (.cutY 6144 .empty (.cutX 11264 (.cutY 7168 (.cutX 10752 .empty (.cutY 6656 (.cutX 11008 (.cutY 6400 (.cutX 10880 (.cutY 6272 .full .full) (.cutY 6272 .full .full)) .empty) .empty) .empty)) .empty) .empty)))) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 (.cutY 26624 (.cutX 21504 .empty (.cutY 25600 .empty (.cutX 22016 (.cutY 26112 .empty (.cutX 21760 .empty (.cutY 26368 .empty (.cutX 21888 (.cutY 26496 .full .full) (.cutY 26496 .full .full))))) .empty))) .empty) .empty) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 (.cutY 22528 (.cutX 25600 .empty (.cutY 21504 .empty (.cutX 26112 .empty (.cutY 22016 (.cutX 26368 .empty (.cutY 21760 .empty (.cutX 26496 (.cutY 21888 .full .full) (.cutY 21888 .full .full)))) .empty)))) .empty) .empty)) .empty) .empty))))

theorem metadata18 : 0<130629080 ∧ 24<128 ∧ 42<128 ∧ 1<4 ∧
    6698/4160=1 ∧ 6698%4160=2538 ∧ ∀ i, (leaves18 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData18).mp
    (by decide +kernel)

theorem sourceChecked18_0 : ∀ i : Fin 16,
    (fun i => output18 i = raw18 (source18 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked18 : ∀ i : Fin 16, (fun i => output18 i = raw18 (source18 i)) i :=
  forallFin_of_zero_offset (fun i => output18 i = raw18 (source18 i)) sourceChecked18_0

theorem coverChecked18_0 : ∀ i : Fin 16,
    (fun i => (output18 (cover18 i)).ContainsBox (raw18 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked18 : ∀ i : Fin 16, (fun i => (output18 (cover18 i)).ContainsBox (raw18 i)) i :=
  forallFin_of_zero_offset (fun i => (output18 (cover18 i)).ContainsBox (raw18 i)) coverChecked18_0

theorem treeChecked18 : tree18.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves18 : List.ofFn output18 = tree18.leaves ⟨0,32768,0,32768⟩ := by
  unfold output18
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked18 : gridTreeUnionCheck 32768 raw18 output18 cover18 source18 tree18 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked18, coverChecked18, treeChecked18, treeLeaves18⟩

theorem areaUnits18 : gridUnionAreaUnits output18 = 262144 := by decide +kernel

noncomputable def phaseMass18 : ℝ := singlePhaseMass (130629080/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw18 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass18_eq : phaseMass18 = (3265727/40960000000 : ℝ) := by
  unfold phaseMass18
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw18 output18 cover18 source18
    (gridTreeUnionCheck_sound 32768 raw18 output18 cover18 source18 tree18 checked18)
    _ (by norm_num) _, areaUnits18]
  norm_num

-- Frozen phase 2515, atom 3760, type 0, source (44,64).
def leavesData19 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves19 : Fin 1 → DyadicLeaf := leavesData19.get
def raw19 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 44 64 leaves19 i
def outputData19 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨11264,11520,16384,16640⟩) (.single ⟨16128,16384,21248,21504⟩)) (.node (.single ⟨16384,16640,11264,11520⟩) (.single ⟨21248,21504,16128,16384⟩)))
def output19 : Fin 4 → GridBox := outputData19.get
def coverData19 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 2)) (.node (.single 3) (.single 1)))
def sourceData19 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 3)) (.node (.single 1) (.single 2)))
def cover19 (i : Fin 4) : Fin 4 := ⟨coverData19.get i % 4, Nat.mod_lt _ (by decide)⟩
def source19 (i : Fin 4) : Fin 4 := ⟨sourceData19.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree19 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 .empty (.cutY 18432 (.cutX 11264 .empty (.cutY 17408 (.cutX 11776 (.cutY 16896 (.cutX 11520 (.cutY 16640 .full .empty) .empty) .empty) .empty) .empty)) .empty)) .empty) (.cutY 20480 .empty (.cutX 14336 .empty (.cutY 22528 (.cutX 15360 .empty (.cutY 21504 (.cutX 15872 .empty (.cutY 20992 .empty (.cutX 16128 .empty (.cutY 21248 .empty .full)))) .empty)) .empty)))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 (.cutY 10240 .empty (.cutX 17408 (.cutY 11264 .empty (.cutX 16896 (.cutY 11776 (.cutX 16640 (.cutY 11520 .full .empty) .empty) .empty) .empty)) .empty)) .empty) .empty) (.cutY 12288 .empty (.cutX 22528 (.cutY 14336 .empty (.cutX 21504 (.cutY 15360 .empty (.cutX 20992 .empty (.cutY 15872 .empty (.cutX 21248 .empty (.cutY 16128 .empty .full))))) .empty)) .empty)))) .empty) .empty))

theorem metadata19 : 0<20837145 ∧ 44<128 ∧ 64<128 ∧ 0<4 ∧
    3760/4160=0 ∧ 3760%4160=3760 ∧ ∀ i, (leaves19 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData19).mp
    (by decide +kernel)

theorem sourceChecked19_0 : ∀ i : Fin 4,
    (fun i => output19 i = raw19 (source19 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked19 : ∀ i : Fin 4, (fun i => output19 i = raw19 (source19 i)) i :=
  forallFin_of_zero_offset (fun i => output19 i = raw19 (source19 i)) sourceChecked19_0

theorem coverChecked19_0 : ∀ i : Fin 4,
    (fun i => (output19 (cover19 i)).ContainsBox (raw19 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked19 : ∀ i : Fin 4, (fun i => (output19 (cover19 i)).ContainsBox (raw19 i)) i :=
  forallFin_of_zero_offset (fun i => (output19 (cover19 i)).ContainsBox (raw19 i)) coverChecked19_0

theorem treeChecked19 : tree19.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves19 : List.ofFn output19 = tree19.leaves ⟨0,32768,0,32768⟩ := by
  unfold output19
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked19 : gridTreeUnionCheck 32768 raw19 output19 cover19 source19 tree19 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked19, coverChecked19, treeChecked19, treeLeaves19⟩

theorem areaUnits19 : gridUnionAreaUnits output19 = 262144 := by decide +kernel

noncomputable def phaseMass19 : ℝ := singlePhaseMass (20837145/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw19 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass19_eq : phaseMass19 = (4167429/327680000000 : ℝ) := by
  unfold phaseMass19
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw19 output19 cover19 source19
    (gridTreeUnionCheck_sound 32768 raw19 output19 cover19 source19 tree19 checked19)
    _ (by norm_num) _, areaUnits19]
  norm_num

-- Frozen phase 2516, atom 2376, type 0, source (22,44).
def leavesData20 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves20 : Fin 1 → DyadicLeaf := leavesData20.get
def raw20 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 22 44 leaves20 i
def outputData20 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨5632,5888,11264,11520⟩) (.single ⟨11264,11520,5632,5888⟩)) (.node (.single ⟨21248,21504,26880,27136⟩) (.single ⟨26880,27136,21248,21504⟩)))
def output20 : Fin 4 → GridBox := outputData20.get
def coverData20 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData20 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover20 (i : Fin 4) : Fin 4 := ⟨coverData20.get i % 4, Nat.mod_lt _ (by decide)⟩
def source20 (i : Fin 4) : Fin 4 := ⟨sourceData20.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree20 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 (.cutY 10240 .empty (.cutX 5120 .empty (.cutY 11264 .empty (.cutX 5632 .empty (.cutY 11776 (.cutX 5888 (.cutY 11520 .full .empty) .empty) .empty))))) .empty) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 .empty (.cutY 6144 (.cutX 11264 .empty (.cutY 5120 .empty (.cutX 11776 (.cutY 5632 .empty (.cutX 11520 (.cutY 5888 .full .empty) .empty)) .empty))) .empty))) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 (.cutY 26624 .empty (.cutX 21504 (.cutY 27648 (.cutX 20992 .empty (.cutY 27136 (.cutX 21248 .empty (.cutY 26880 .empty .full)) .empty)) .empty) .empty)) .empty) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 .empty (.cutY 22528 (.cutX 27648 (.cutY 21504 (.cutX 27136 (.cutY 20992 .empty (.cutX 26880 .empty (.cutY 21248 .empty .full))) .empty) .empty) .empty) .empty))) .empty) .empty))))

theorem metadata20 : 0<73667111 ∧ 22<128 ∧ 44<128 ∧ 0<4 ∧
    2376/4160=0 ∧ 2376%4160=2376 ∧ ∀ i, (leaves20 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData20).mp
    (by decide +kernel)

theorem sourceChecked20_0 : ∀ i : Fin 4,
    (fun i => output20 i = raw20 (source20 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked20 : ∀ i : Fin 4, (fun i => output20 i = raw20 (source20 i)) i :=
  forallFin_of_zero_offset (fun i => output20 i = raw20 (source20 i)) sourceChecked20_0

theorem coverChecked20_0 : ∀ i : Fin 4,
    (fun i => (output20 (cover20 i)).ContainsBox (raw20 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked20 : ∀ i : Fin 4, (fun i => (output20 (cover20 i)).ContainsBox (raw20 i)) i :=
  forallFin_of_zero_offset (fun i => (output20 (cover20 i)).ContainsBox (raw20 i)) coverChecked20_0

theorem treeChecked20 : tree20.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves20 : List.ofFn output20 = tree20.leaves ⟨0,32768,0,32768⟩ := by
  unfold output20
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked20 : gridTreeUnionCheck 32768 raw20 output20 cover20 source20 tree20 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked20, coverChecked20, treeChecked20, treeLeaves20⟩

theorem areaUnits20 : gridUnionAreaUnits output20 = 262144 := by decide +kernel

noncomputable def phaseMass20 : ℝ := singlePhaseMass (73667111/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw20 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass20_eq : phaseMass20 = (73667111/1638400000000 : ℝ) := by
  unfold phaseMass20
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw20 output20 cover20 source20
    (gridTreeUnionCheck_sound 32768 raw20 output20 cover20 source20 tree20 checked20)
    _ (by norm_num) _, areaUnits20]
  norm_num

-- Frozen phase 2517, atom 3251, type 0, source (34,55).
def leavesData21 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves21 : Fin 1 → DyadicLeaf := leavesData21.get
def raw21 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 34 55 leaves21 i
def outputData21 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨8704,8960,14080,14336⟩) (.single ⟨14080,14336,8704,8960⟩)) (.node (.single ⟨18432,18688,23808,24064⟩) (.single ⟨23808,24064,18432,18688⟩)))
def output21 : Fin 4 → GridBox := outputData21.get
def coverData21 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData21 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover21 (i : Fin 4) : Fin 4 := ⟨coverData21.get i % 4, Nat.mod_lt _ (by decide)⟩
def source21 (i : Fin 4) : Fin 4 := ⟨sourceData21.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree21 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 (.cutY 14336 (.cutX 9216 (.cutY 13312 .empty (.cutX 8704 .empty (.cutY 13824 .empty (.cutX 8960 (.cutY 14080 .empty .full) .empty)))) .empty) .empty) .empty)) (.cutY 12288 (.cutX 14336 (.cutY 10240 (.cutX 13312 .empty (.cutY 9216 (.cutX 13824 .empty (.cutY 8704 .empty (.cutX 14080 .empty (.cutY 8960 .full .empty)))) .empty)) .empty) .empty) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 .empty (.cutY 22528 .empty (.cutX 19456 (.cutY 23552 .empty (.cutX 18944 (.cutY 24064 (.cutX 18688 (.cutY 23808 .empty .full) .empty) .empty) .empty)) .empty)))) (.cutY 20480 (.cutX 22528 .empty (.cutY 18432 .empty (.cutX 23552 .empty (.cutY 19456 (.cutX 24064 (.cutY 18944 (.cutX 23808 .empty (.cutY 18688 .full .empty)) .empty) .empty) .empty)))) .empty)) .empty) .empty)))

theorem metadata21 : 0<256811171 ∧ 34<128 ∧ 55<128 ∧ 0<4 ∧
    3251/4160=0 ∧ 3251%4160=3251 ∧ ∀ i, (leaves21 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData21).mp
    (by decide +kernel)

theorem sourceChecked21_0 : ∀ i : Fin 4,
    (fun i => output21 i = raw21 (source21 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked21 : ∀ i : Fin 4, (fun i => output21 i = raw21 (source21 i)) i :=
  forallFin_of_zero_offset (fun i => output21 i = raw21 (source21 i)) sourceChecked21_0

theorem coverChecked21_0 : ∀ i : Fin 4,
    (fun i => (output21 (cover21 i)).ContainsBox (raw21 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked21 : ∀ i : Fin 4, (fun i => (output21 (cover21 i)).ContainsBox (raw21 i)) i :=
  forallFin_of_zero_offset (fun i => (output21 (cover21 i)).ContainsBox (raw21 i)) coverChecked21_0

theorem treeChecked21 : tree21.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves21 : List.ofFn output21 = tree21.leaves ⟨0,32768,0,32768⟩ := by
  unfold output21
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked21 : gridTreeUnionCheck 32768 raw21 output21 cover21 source21 tree21 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked21, coverChecked21, treeChecked21, treeLeaves21⟩

theorem areaUnits21 : gridUnionAreaUnits output21 = 262144 := by decide +kernel

noncomputable def phaseMass21 : ℝ := singlePhaseMass (256811171/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw21 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass21_eq : phaseMass21 = (256811171/1638400000000 : ℝ) := by
  unfold phaseMass21
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw21 output21 cover21 source21
    (gridTreeUnionCheck_sound 32768 raw21 output21 cover21 source21 tree21 checked21)
    _ (by norm_num) _, areaUnits21]
  norm_num

-- Frozen phase 2518, atom 2622, type 0, source (25,47).
def leavesData22 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves22 : Fin 1 → DyadicLeaf := leavesData22.get
def raw22 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 25 47 leaves22 i
def outputData22 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨6400,6656,12032,12288⟩) (.single ⟨12032,12288,6400,6656⟩)) (.node (.single ⟨20480,20736,26112,26368⟩) (.single ⟨26112,26368,20480,20736⟩)))
def output22 : Fin 4 → GridBox := outputData22.get
def coverData22 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData22 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover22 (i : Fin 4) : Fin 4 := ⟨coverData22.get i % 4, Nat.mod_lt _ (by decide)⟩
def source22 (i : Fin 4) : Fin 4 := ⟨sourceData22.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree22 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 .empty (.cutY 10240 .empty (.cutX 7168 (.cutY 11264 .empty (.cutX 6656 (.cutY 11776 .empty (.cutX 6400 .empty (.cutY 12032 .empty .full))) .empty)) .empty))) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 .empty (.cutY 6144 .empty (.cutX 11264 .empty (.cutY 7168 (.cutX 11776 .empty (.cutY 6656 (.cutX 12032 .empty (.cutY 6400 .empty .full)) .empty)) .empty))))) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 (.cutY 26624 (.cutX 21504 (.cutY 25600 .empty (.cutX 20992 (.cutY 26112 .empty (.cutX 20736 (.cutY 26368 .full .empty) .empty)) .empty)) .empty) .empty) .empty) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 (.cutY 22528 (.cutX 25600 .empty (.cutY 21504 (.cutX 26112 .empty (.cutY 20992 (.cutX 26368 (.cutY 20736 .full .empty) .empty) .empty)) .empty)) .empty) .empty)) .empty) .empty))))

theorem metadata22 : 0<214868664 ∧ 25<128 ∧ 47<128 ∧ 0<4 ∧
    2622/4160=0 ∧ 2622%4160=2622 ∧ ∀ i, (leaves22 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData22).mp
    (by decide +kernel)

theorem sourceChecked22_0 : ∀ i : Fin 4,
    (fun i => output22 i = raw22 (source22 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked22 : ∀ i : Fin 4, (fun i => output22 i = raw22 (source22 i)) i :=
  forallFin_of_zero_offset (fun i => output22 i = raw22 (source22 i)) sourceChecked22_0

theorem coverChecked22_0 : ∀ i : Fin 4,
    (fun i => (output22 (cover22 i)).ContainsBox (raw22 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked22 : ∀ i : Fin 4, (fun i => (output22 (cover22 i)).ContainsBox (raw22 i)) i :=
  forallFin_of_zero_offset (fun i => (output22 (cover22 i)).ContainsBox (raw22 i)) coverChecked22_0

theorem treeChecked22 : tree22.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves22 : List.ofFn output22 = tree22.leaves ⟨0,32768,0,32768⟩ := by
  unfold output22
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked22 : gridTreeUnionCheck 32768 raw22 output22 cover22 source22 tree22 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked22, coverChecked22, treeChecked22, treeLeaves22⟩

theorem areaUnits22 : gridUnionAreaUnits output22 = 262144 := by decide +kernel

noncomputable def phaseMass22 : ℝ := singlePhaseMass (214868664/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw22 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass22_eq : phaseMass22 = (26858583/204800000000 : ℝ) := by
  unfold phaseMass22
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw22 output22 cover22 source22
    (gridTreeUnionCheck_sound 32768 raw22 output22 cover22 source22 tree22 checked22)
    _ (by norm_num) _, areaUnits22]
  norm_num

-- Frozen phase 2519, atom 160, type 0, source (1,33).
def leavesData23 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves23 : Fin 1 → DyadicLeaf := leavesData23.get
def raw23 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 1 33 leaves23 i
def outputData23 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨256,512,8448,8704⟩) (.single ⟨8448,8704,256,512⟩)) (.node (.single ⟨24064,24320,32256,32512⟩) (.single ⟨32256,32512,24064,24320⟩)))
def output23 : Fin 4 → GridBox := outputData23.get
def coverData23 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData23 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover23 (i : Fin 4) : Fin 4 := ⟨coverData23.get i % 4, Nat.mod_lt _ (by decide)⟩
def source23 (i : Fin 4) : Fin 4 := ⟨sourceData23.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree23 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 (.cutY 10240 (.cutX 1024 (.cutY 9216 (.cutX 512 (.cutY 8704 (.cutX 256 .empty (.cutY 8448 .empty .full)) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 (.cutX 9216 (.cutY 1024 (.cutX 8704 (.cutY 512 (.cutX 8448 .empty (.cutY 256 .empty .full)) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 .empty (.cutX 23552 .empty (.cutY 31744 .empty (.cutX 24064 .empty (.cutY 32256 .empty (.cutX 24320 (.cutY 32512 .full .empty) .empty)))))))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 .empty (.cutY 22528 .empty (.cutX 31744 .empty (.cutY 23552 .empty (.cutX 32256 .empty (.cutY 24064 .empty (.cutX 32512 (.cutY 24320 .full .empty) .empty))))))))) .empty))))

theorem metadata23 : 0<523383676 ∧ 1<128 ∧ 33<128 ∧ 0<4 ∧
    160/4160=0 ∧ 160%4160=160 ∧ ∀ i, (leaves23 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData23).mp
    (by decide +kernel)

theorem sourceChecked23_0 : ∀ i : Fin 4,
    (fun i => output23 i = raw23 (source23 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked23 : ∀ i : Fin 4, (fun i => output23 i = raw23 (source23 i)) i :=
  forallFin_of_zero_offset (fun i => output23 i = raw23 (source23 i)) sourceChecked23_0

theorem coverChecked23_0 : ∀ i : Fin 4,
    (fun i => (output23 (cover23 i)).ContainsBox (raw23 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked23 : ∀ i : Fin 4, (fun i => (output23 (cover23 i)).ContainsBox (raw23 i)) i :=
  forallFin_of_zero_offset (fun i => (output23 (cover23 i)).ContainsBox (raw23 i)) coverChecked23_0

theorem treeChecked23 : tree23.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves23 : List.ofFn output23 = tree23.leaves ⟨0,32768,0,32768⟩ := by
  unfold output23
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked23 : gridTreeUnionCheck 32768 raw23 output23 cover23 source23 tree23 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked23, coverChecked23, treeChecked23, treeLeaves23⟩

theorem areaUnits23 : gridUnionAreaUnits output23 = 262144 := by decide +kernel

noncomputable def phaseMass23 : ℝ := singlePhaseMass (523383676/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw23 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass23_eq : phaseMass23 = (130845919/409600000000 : ℝ) := by
  unfold phaseMass23
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw23 output23 cover23 source23
    (gridTreeUnionCheck_sound 32768 raw23 output23 cover23 source23 tree23 checked23)
    _ (by norm_num) _, areaUnits23]
  norm_num

-- Frozen phase 2520, atom 4688, type 1, source (4,32).
def leavesData24 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves24 : Fin 1 → DyadicLeaf := leavesData24.get
def raw24 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 4 32 leaves24 i
def outputData24 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨1024,1280,8192,8448⟩) (.single ⟨8192,8448,1024,1280⟩)) (.node (.single ⟨24320,24576,31488,31744⟩) (.single ⟨31488,31744,24320,24576⟩)))
def output24 : Fin 4 → GridBox := outputData24.get
def coverData24 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData24 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover24 (i : Fin 4) : Fin 4 := ⟨coverData24.get i % 4, Nat.mod_lt _ (by decide)⟩
def source24 (i : Fin 4) : Fin 4 := ⟨sourceData24.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree24 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 (.cutY 10240 (.cutX 1024 .empty (.cutY 9216 (.cutX 1536 (.cutY 8704 (.cutX 1280 (.cutY 8448 .full .empty) .empty) .empty) .empty) .empty)) .empty) .empty) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 (.cutX 9216 (.cutY 1024 .empty (.cutX 8704 (.cutY 1536 (.cutX 8448 (.cutY 1280 .full .empty) .empty) .empty) .empty)) .empty) .empty) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 .empty (.cutX 23552 .empty (.cutY 31744 (.cutX 24064 .empty (.cutY 31232 .empty (.cutX 24320 .empty (.cutY 31488 .empty .full)))) .empty))))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 .empty (.cutY 22528 .empty (.cutX 31744 (.cutY 23552 .empty (.cutX 31232 .empty (.cutY 24064 .empty (.cutX 31488 .empty (.cutY 24320 .empty .full))))) .empty))))) .empty))))

theorem metadata24 : 0<475523442 ∧ 4<128 ∧ 32<128 ∧ 1<4 ∧
    4688/4160=1 ∧ 4688%4160=528 ∧ ∀ i, (leaves24 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData24).mp
    (by decide +kernel)

theorem sourceChecked24_0 : ∀ i : Fin 4,
    (fun i => output24 i = raw24 (source24 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked24 : ∀ i : Fin 4, (fun i => output24 i = raw24 (source24 i)) i :=
  forallFin_of_zero_offset (fun i => output24 i = raw24 (source24 i)) sourceChecked24_0

theorem coverChecked24_0 : ∀ i : Fin 4,
    (fun i => (output24 (cover24 i)).ContainsBox (raw24 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked24 : ∀ i : Fin 4, (fun i => (output24 (cover24 i)).ContainsBox (raw24 i)) i :=
  forallFin_of_zero_offset (fun i => (output24 (cover24 i)).ContainsBox (raw24 i)) coverChecked24_0

theorem treeChecked24 : tree24.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves24 : List.ofFn output24 = tree24.leaves ⟨0,32768,0,32768⟩ := by
  unfold output24
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked24 : gridTreeUnionCheck 32768 raw24 output24 cover24 source24 tree24 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked24, coverChecked24, treeChecked24, treeLeaves24⟩

theorem areaUnits24 : gridUnionAreaUnits output24 = 262144 := by decide +kernel

noncomputable def phaseMass24 : ℝ := singlePhaseMass (475523442/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw24 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass24_eq : phaseMass24 = (237761721/819200000000 : ℝ) := by
  unfold phaseMass24
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw24 output24 cover24 source24
    (gridTreeUnionCheck_sound 32768 raw24 output24 cover24 source24 tree24 checked24)
    _ (by norm_num) _, areaUnits24]
  norm_num

-- Frozen phase 2521, atom 409, type 0, source (3,34).
def leavesData25 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves25 : Fin 1 → DyadicLeaf := leavesData25.get
def raw25 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 3 34 leaves25 i
def outputData25 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨768,1024,8704,8960⟩) (.single ⟨8704,8960,768,1024⟩)) (.node (.single ⟨23808,24064,31744,32000⟩) (.single ⟨31744,32000,23808,24064⟩)))
def output25 : Fin 4 → GridBox := outputData25.get
def coverData25 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData25 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover25 (i : Fin 4) : Fin 4 := ⟨coverData25.get i % 4, Nat.mod_lt _ (by decide)⟩
def source25 (i : Fin 4) : Fin 4 := ⟨sourceData25.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree25 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 (.cutY 10240 (.cutX 1024 (.cutY 9216 (.cutX 512 .empty (.cutY 8704 .empty (.cutX 768 .empty (.cutY 8960 .full .empty)))) .empty) .empty) .empty) .empty) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 (.cutX 9216 (.cutY 1024 (.cutX 8704 .empty (.cutY 512 .empty (.cutX 8960 (.cutY 768 .empty .full) .empty))) .empty) .empty) .empty) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 .empty (.cutX 23552 .empty (.cutY 31744 .empty (.cutX 24064 (.cutY 32256 (.cutX 23808 .empty (.cutY 32000 .full .empty)) .empty) .empty)))))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 .empty (.cutY 22528 .empty (.cutX 31744 .empty (.cutY 23552 .empty (.cutX 32256 (.cutY 24064 (.cutX 32000 (.cutY 23808 .empty .full) .empty) .empty) .empty))))))) .empty))))

theorem metadata25 : 0<523383676 ∧ 3<128 ∧ 34<128 ∧ 0<4 ∧
    409/4160=0 ∧ 409%4160=409 ∧ ∀ i, (leaves25 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData25).mp
    (by decide +kernel)

theorem sourceChecked25_0 : ∀ i : Fin 4,
    (fun i => output25 i = raw25 (source25 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked25 : ∀ i : Fin 4, (fun i => output25 i = raw25 (source25 i)) i :=
  forallFin_of_zero_offset (fun i => output25 i = raw25 (source25 i)) sourceChecked25_0

theorem coverChecked25_0 : ∀ i : Fin 4,
    (fun i => (output25 (cover25 i)).ContainsBox (raw25 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked25 : ∀ i : Fin 4, (fun i => (output25 (cover25 i)).ContainsBox (raw25 i)) i :=
  forallFin_of_zero_offset (fun i => (output25 (cover25 i)).ContainsBox (raw25 i)) coverChecked25_0

theorem treeChecked25 : tree25.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves25 : List.ofFn output25 = tree25.leaves ⟨0,32768,0,32768⟩ := by
  unfold output25
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked25 : gridTreeUnionCheck 32768 raw25 output25 cover25 source25 tree25 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked25, coverChecked25, treeChecked25, treeLeaves25⟩

theorem areaUnits25 : gridUnionAreaUnits output25 = 262144 := by decide +kernel

noncomputable def phaseMass25 : ℝ := singlePhaseMass (523383676/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw25 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass25_eq : phaseMass25 = (130845919/409600000000 : ℝ) := by
  unfold phaseMass25
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw25 output25 cover25 source25
    (gridTreeUnionCheck_sound 32768 raw25 output25 cover25 source25 tree25 checked25)
    _ (by norm_num) _, areaUnits25]
  norm_num

-- Frozen phase 2522, atom 2700, type 0, source (26,48).
def leavesData26 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves26 : Fin 1 → DyadicLeaf := leavesData26.get
def raw26 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 26 48 leaves26 i
def outputData26 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨6656,6912,12288,12544⟩) (.single ⟨12288,12544,6656,6912⟩)) (.node (.single ⟨20224,20480,25856,26112⟩) (.single ⟨25856,26112,20224,20480⟩)))
def output26 : Fin 4 → GridBox := outputData26.get
def coverData26 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData26 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover26 (i : Fin 4) : Fin 4 := ⟨coverData26.get i % 4, Nat.mod_lt _ (by decide)⟩
def source26 (i : Fin 4) : Fin 4 := ⟨sourceData26.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree26 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 .empty (.cutY 14336 (.cutX 7168 (.cutY 13312 (.cutX 6656 .empty (.cutY 12800 (.cutX 6912 (.cutY 12544 .full .empty) .empty) .empty)) .empty) .empty) .empty))))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 (.cutY 6144 .empty (.cutX 13312 (.cutY 7168 (.cutX 12800 (.cutY 6656 .empty (.cutX 12544 (.cutY 6912 .full .empty) .empty)) .empty) .empty) .empty)) .empty))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 .empty (.cutY 26624 (.cutX 19456 .empty (.cutY 25600 .empty (.cutX 19968 .empty (.cutY 26112 (.cutX 20224 .empty (.cutY 25856 .empty .full)) .empty)))) .empty)) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 (.cutY 18432 .empty (.cutX 25600 .empty (.cutY 19456 .empty (.cutX 26112 (.cutY 19968 .empty (.cutX 25856 .empty (.cutY 20224 .empty .full))) .empty)))) .empty) .empty) .empty) .empty))))

theorem metadata26 : 0<300263580 ∧ 26<128 ∧ 48<128 ∧ 0<4 ∧
    2700/4160=0 ∧ 2700%4160=2700 ∧ ∀ i, (leaves26 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData26).mp
    (by decide +kernel)

theorem sourceChecked26_0 : ∀ i : Fin 4,
    (fun i => output26 i = raw26 (source26 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked26 : ∀ i : Fin 4, (fun i => output26 i = raw26 (source26 i)) i :=
  forallFin_of_zero_offset (fun i => output26 i = raw26 (source26 i)) sourceChecked26_0

theorem coverChecked26_0 : ∀ i : Fin 4,
    (fun i => (output26 (cover26 i)).ContainsBox (raw26 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked26 : ∀ i : Fin 4, (fun i => (output26 (cover26 i)).ContainsBox (raw26 i)) i :=
  forallFin_of_zero_offset (fun i => (output26 (cover26 i)).ContainsBox (raw26 i)) coverChecked26_0

theorem treeChecked26 : tree26.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves26 : List.ofFn output26 = tree26.leaves ⟨0,32768,0,32768⟩ := by
  unfold output26
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked26 : gridTreeUnionCheck 32768 raw26 output26 cover26 source26 tree26 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked26, coverChecked26, treeChecked26, treeLeaves26⟩

theorem areaUnits26 : gridUnionAreaUnits output26 = 262144 := by decide +kernel

noncomputable def phaseMass26 : ℝ := singlePhaseMass (300263580/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw26 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass26_eq : phaseMass26 = (15013179/81920000000 : ℝ) := by
  unfold phaseMass26
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw26 output26 cover26 source26
    (gridTreeUnionCheck_sound 32768 raw26 output26 cover26 source26 tree26 checked26)
    _ (by norm_num) _, areaUnits26]
  norm_num

-- Frozen phase 2523, atom 7407, type 1, source (34,51).
def leavesData27 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves27 : Fin 4 → DyadicLeaf := leavesData27.get
def raw27 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 34 51 leaves27 i
def outputData27 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨8704,8832,13056,13184⟩) (.single ⟨8704,8832,13184,13312⟩)) (.node (.single ⟨8832,8960,13056,13184⟩) (.single ⟨8832,8960,13184,13312⟩))) (.node (.node (.single ⟨13056,13184,8704,8832⟩) (.single ⟨13056,13184,8832,8960⟩)) (.node (.single ⟨13184,13312,8704,8832⟩) (.single ⟨13184,13312,8832,8960⟩)))) (.node (.node (.node (.single ⟨19456,19584,23808,23936⟩) (.single ⟨19456,19584,23936,24064⟩)) (.node (.single ⟨19584,19712,23808,23936⟩) (.single ⟨19584,19712,23936,24064⟩))) (.node (.node (.single ⟨23808,23936,19456,19584⟩) (.single ⟨23808,23936,19584,19712⟩)) (.node (.single ⟨23936,24064,19456,19584⟩) (.single ⟨23936,24064,19584,19712⟩)))))
def output27 : Fin 16 → GridBox := outputData27.get
def coverData27 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData27 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover27 (i : Fin 16) : Fin 16 := ⟨coverData27.get i % 16, Nat.mod_lt _ (by decide)⟩
def source27 (i : Fin 16) : Fin 16 := ⟨sourceData27.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree27 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 (.cutY 14336 (.cutX 9216 (.cutY 13312 (.cutX 8704 .empty (.cutY 12800 .empty (.cutX 8960 (.cutY 13056 .empty (.cutX 8832 (.cutY 13184 .full .full) (.cutY 13184 .full .full))) .empty))) .empty) .empty) .empty) .empty)) (.cutY 12288 (.cutX 14336 (.cutY 10240 (.cutX 13312 (.cutY 9216 (.cutX 12800 .empty (.cutY 8704 .empty (.cutX 13056 .empty (.cutY 8960 (.cutX 13184 (.cutY 8832 .full .full) (.cutY 8832 .full .full)) .empty)))) .empty) .empty) .empty) .empty) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 .empty (.cutY 22528 .empty (.cutX 19456 .empty (.cutY 23552 .empty (.cutX 19968 (.cutY 24064 (.cutX 19712 (.cutY 23808 .empty (.cutX 19584 (.cutY 23936 .full .full) (.cutY 23936 .full .full))) .empty) .empty) .empty)))))) (.cutY 20480 (.cutX 22528 .empty (.cutY 18432 .empty (.cutX 23552 .empty (.cutY 19456 .empty (.cutX 24064 (.cutY 19968 (.cutX 23808 .empty (.cutY 19712 (.cutX 23936 (.cutY 19584 .full .full) (.cutY 19584 .full .full)) .empty)) .empty) .empty))))) .empty)) .empty) .empty)))

theorem metadata27 : 0<134822691 ∧ 34<128 ∧ 51<128 ∧ 1<4 ∧
    7407/4160=1 ∧ 7407%4160=3247 ∧ ∀ i, (leaves27 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData27).mp
    (by decide +kernel)

theorem sourceChecked27_0 : ∀ i : Fin 16,
    (fun i => output27 i = raw27 (source27 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked27 : ∀ i : Fin 16, (fun i => output27 i = raw27 (source27 i)) i :=
  forallFin_of_zero_offset (fun i => output27 i = raw27 (source27 i)) sourceChecked27_0

theorem coverChecked27_0 : ∀ i : Fin 16,
    (fun i => (output27 (cover27 i)).ContainsBox (raw27 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked27 : ∀ i : Fin 16, (fun i => (output27 (cover27 i)).ContainsBox (raw27 i)) i :=
  forallFin_of_zero_offset (fun i => (output27 (cover27 i)).ContainsBox (raw27 i)) coverChecked27_0

theorem treeChecked27 : tree27.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves27 : List.ofFn output27 = tree27.leaves ⟨0,32768,0,32768⟩ := by
  unfold output27
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked27 : gridTreeUnionCheck 32768 raw27 output27 cover27 source27 tree27 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked27, coverChecked27, treeChecked27, treeLeaves27⟩

theorem areaUnits27 : gridUnionAreaUnits output27 = 262144 := by decide +kernel

noncomputable def phaseMass27 : ℝ := singlePhaseMass (134822691/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw27 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass27_eq : phaseMass27 = (134822691/1638400000000 : ℝ) := by
  unfold phaseMass27
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw27 output27 cover27 source27
    (gridTreeUnionCheck_sound 32768 raw27 output27 cover27 source27 tree27 checked27)
    _ (by norm_num) _, areaUnits27]
  norm_num

-- Frozen phase 2524, atom 4024, type 0, source (52,72).
def leavesData28 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves28 : Fin 1 → DyadicLeaf := leavesData28.get
def raw28 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 52 72 leaves28 i
def outputData28 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨13312,13568,18432,18688⟩) (.single ⟨14080,14336,19200,19456⟩)) (.node (.single ⟨18432,18688,13312,13568⟩) (.single ⟨19200,19456,14080,14336⟩)))
def output28 : Fin 4 → GridBox := outputData28.get
def coverData28 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 2)) (.node (.single 3) (.single 1)))
def sourceData28 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 3)) (.node (.single 1) (.single 2)))
def cover28 (i : Fin 4) : Fin 4 := ⟨coverData28.get i % 4, Nat.mod_lt _ (by decide)⟩
def source28 (i : Fin 4) : Fin 4 := ⟨sourceData28.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree28 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 .empty (.cutY 20480 (.cutX 14336 (.cutY 18432 .empty (.cutX 13312 .empty (.cutY 19456 (.cutX 13824 (.cutY 18944 (.cutX 13568 (.cutY 18688 .full .empty) .empty) .empty) (.cutY 18944 .empty (.cutX 14080 .empty (.cutY 19200 .empty .full)))) .empty))) .empty) .empty)) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 .empty (.cutX 18432 .empty (.cutY 14336 (.cutX 19456 (.cutY 13312 .empty (.cutX 18944 (.cutY 13824 (.cutX 18688 (.cutY 13568 .full .empty) .empty) .empty) (.cutY 13824 .empty (.cutX 19200 .empty (.cutY 14080 .empty .full))))) .empty) .empty))) .empty)) .empty) .empty))

theorem metadata28 : 0<76472504 ∧ 52<128 ∧ 72<128 ∧ 0<4 ∧
    4024/4160=0 ∧ 4024%4160=4024 ∧ ∀ i, (leaves28 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData28).mp
    (by decide +kernel)

theorem sourceChecked28_0 : ∀ i : Fin 4,
    (fun i => output28 i = raw28 (source28 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked28 : ∀ i : Fin 4, (fun i => output28 i = raw28 (source28 i)) i :=
  forallFin_of_zero_offset (fun i => output28 i = raw28 (source28 i)) sourceChecked28_0

theorem coverChecked28_0 : ∀ i : Fin 4,
    (fun i => (output28 (cover28 i)).ContainsBox (raw28 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked28 : ∀ i : Fin 4, (fun i => (output28 (cover28 i)).ContainsBox (raw28 i)) i :=
  forallFin_of_zero_offset (fun i => (output28 (cover28 i)).ContainsBox (raw28 i)) coverChecked28_0

theorem treeChecked28 : tree28.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves28 : List.ofFn output28 = tree28.leaves ⟨0,32768,0,32768⟩ := by
  unfold output28
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked28 : gridTreeUnionCheck 32768 raw28 output28 cover28 source28 tree28 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked28, coverChecked28, treeChecked28, treeLeaves28⟩

theorem areaUnits28 : gridUnionAreaUnits output28 = 262144 := by decide +kernel

noncomputable def phaseMass28 : ℝ := singlePhaseMass (76472504/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw28 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass28_eq : phaseMass28 = (9559063/204800000000 : ℝ) := by
  unfold phaseMass28
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw28 output28 cover28 source28
    (gridTreeUnionCheck_sound 32768 raw28 output28 cover28 source28 tree28 checked28)
    _ (by norm_num) _, areaUnits28]
  norm_num

-- Frozen phase 2525, atom 2776, type 0, source (27,49).
def leavesData29 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves29 : Fin 1 → DyadicLeaf := leavesData29.get
def raw29 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 27 49 leaves29 i
def outputData29 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨6912,7168,12544,12800⟩) (.single ⟨12544,12800,6912,7168⟩)) (.node (.single ⟨19968,20224,25600,25856⟩) (.single ⟨25600,25856,19968,20224⟩)))
def output29 : Fin 4 → GridBox := outputData29.get
def coverData29 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData29 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover29 (i : Fin 4) : Fin 4 := ⟨coverData29.get i % 4, Nat.mod_lt _ (by decide)⟩
def source29 (i : Fin 4) : Fin 4 := ⟨sourceData29.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree29 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 .empty (.cutY 14336 (.cutX 7168 (.cutY 13312 (.cutX 6656 .empty (.cutY 12800 (.cutX 6912 .empty (.cutY 12544 .empty .full)) .empty)) .empty) .empty) .empty))))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 (.cutY 6144 .empty (.cutX 13312 (.cutY 7168 (.cutX 12800 (.cutY 6656 .empty (.cutX 12544 .empty (.cutY 6912 .empty .full))) .empty) .empty) .empty)) .empty))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 .empty (.cutY 26624 (.cutX 19456 .empty (.cutY 25600 .empty (.cutX 19968 .empty (.cutY 26112 (.cutX 20224 (.cutY 25856 .full .empty) .empty) .empty)))) .empty)) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 (.cutY 18432 .empty (.cutX 25600 .empty (.cutY 19456 .empty (.cutX 26112 (.cutY 19968 .empty (.cutX 25856 (.cutY 20224 .full .empty) .empty)) .empty)))) .empty) .empty) .empty) .empty))))

theorem metadata29 : 0<300263580 ∧ 27<128 ∧ 49<128 ∧ 0<4 ∧
    2776/4160=0 ∧ 2776%4160=2776 ∧ ∀ i, (leaves29 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData29).mp
    (by decide +kernel)

theorem sourceChecked29_0 : ∀ i : Fin 4,
    (fun i => output29 i = raw29 (source29 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked29 : ∀ i : Fin 4, (fun i => output29 i = raw29 (source29 i)) i :=
  forallFin_of_zero_offset (fun i => output29 i = raw29 (source29 i)) sourceChecked29_0

theorem coverChecked29_0 : ∀ i : Fin 4,
    (fun i => (output29 (cover29 i)).ContainsBox (raw29 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked29 : ∀ i : Fin 4, (fun i => (output29 (cover29 i)).ContainsBox (raw29 i)) i :=
  forallFin_of_zero_offset (fun i => (output29 (cover29 i)).ContainsBox (raw29 i)) coverChecked29_0

theorem treeChecked29 : tree29.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves29 : List.ofFn output29 = tree29.leaves ⟨0,32768,0,32768⟩ := by
  unfold output29
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked29 : gridTreeUnionCheck 32768 raw29 output29 cover29 source29 tree29 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked29, coverChecked29, treeChecked29, treeLeaves29⟩

theorem areaUnits29 : gridUnionAreaUnits output29 = 262144 := by decide +kernel

noncomputable def phaseMass29 : ℝ := singlePhaseMass (300263580/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw29 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass29_eq : phaseMass29 = (15013179/81920000000 : ℝ) := by
  unfold phaseMass29
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw29 output29 cover29 source29
    (gridTreeUnionCheck_sound 32768 raw29 output29 cover29 source29 tree29 checked29)
    _ (by norm_num) _, areaUnits29]
  norm_num

-- Frozen phase 2526, atom 3874, type 0, source (47,67).
def leavesData30 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves30 : Fin 1 → DyadicLeaf := leavesData30.get
def raw30 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 47 67 leaves30 i
def outputData30 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨12032,12288,17152,17408⟩) (.single ⟨15360,15616,20480,20736⟩)) (.node (.single ⟨17152,17408,12032,12288⟩) (.single ⟨20480,20736,15360,15616⟩)))
def output30 : Fin 4 → GridBox := outputData30.get
def coverData30 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 2)) (.node (.single 3) (.single 1)))
def sourceData30 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 3)) (.node (.single 1) (.single 2)))
def cover30 (i : Fin 4) : Fin 4 := ⟨coverData30.get i % 4, Nat.mod_lt _ (by decide)⟩
def source30 (i : Fin 4) : Fin 4 := ⟨sourceData30.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree30 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 .empty (.cutY 18432 (.cutX 11264 .empty (.cutY 17408 (.cutX 11776 .empty (.cutY 16896 .empty (.cutX 12032 .empty (.cutY 17152 .empty .full)))) .empty)) .empty)) .empty) (.cutY 20480 .empty (.cutX 14336 .empty (.cutY 22528 (.cutX 15360 .empty (.cutY 21504 (.cutX 15872 (.cutY 20992 (.cutX 15616 (.cutY 20736 .full .empty) .empty) .empty) .empty) .empty)) .empty)))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 (.cutY 10240 .empty (.cutX 17408 (.cutY 11264 .empty (.cutX 16896 .empty (.cutY 11776 .empty (.cutX 17152 .empty (.cutY 12032 .empty .full))))) .empty)) .empty) .empty) (.cutY 12288 .empty (.cutX 22528 (.cutY 14336 .empty (.cutX 21504 (.cutY 15360 .empty (.cutX 20992 (.cutY 15872 (.cutX 20736 (.cutY 15616 .full .empty) .empty) .empty) .empty)) .empty)) .empty)))) .empty) .empty))

theorem metadata30 : 0<20837145 ∧ 47<128 ∧ 67<128 ∧ 0<4 ∧
    3874/4160=0 ∧ 3874%4160=3874 ∧ ∀ i, (leaves30 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData30).mp
    (by decide +kernel)

theorem sourceChecked30_0 : ∀ i : Fin 4,
    (fun i => output30 i = raw30 (source30 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked30 : ∀ i : Fin 4, (fun i => output30 i = raw30 (source30 i)) i :=
  forallFin_of_zero_offset (fun i => output30 i = raw30 (source30 i)) sourceChecked30_0

theorem coverChecked30_0 : ∀ i : Fin 4,
    (fun i => (output30 (cover30 i)).ContainsBox (raw30 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked30 : ∀ i : Fin 4, (fun i => (output30 (cover30 i)).ContainsBox (raw30 i)) i :=
  forallFin_of_zero_offset (fun i => (output30 (cover30 i)).ContainsBox (raw30 i)) coverChecked30_0

theorem treeChecked30 : tree30.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves30 : List.ofFn output30 = tree30.leaves ⟨0,32768,0,32768⟩ := by
  unfold output30
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked30 : gridTreeUnionCheck 32768 raw30 output30 cover30 source30 tree30 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked30, coverChecked30, treeChecked30, treeLeaves30⟩

theorem areaUnits30 : gridUnionAreaUnits output30 = 262144 := by decide +kernel

noncomputable def phaseMass30 : ℝ := singlePhaseMass (20837145/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw30 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass30_eq : phaseMass30 = (4167429/327680000000 : ℝ) := by
  unfold phaseMass30
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw30 output30 cover30 source30
    (gridTreeUnionCheck_sound 32768 raw30 output30 cover30 source30 tree30 checked30)
    _ (by norm_num) _, areaUnits30]
  norm_num

-- Frozen phase 2527, atom 3311, type 0, source (35,56).
def leavesData31 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves31 : Fin 1 → DyadicLeaf := leavesData31.get
def raw31 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 35 56 leaves31 i
def outputData31 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨8960,9216,14336,14592⟩) (.single ⟨14336,14592,8960,9216⟩)) (.node (.single ⟨18176,18432,23552,23808⟩) (.single ⟨23552,23808,18176,18432⟩)))
def output31 : Fin 4 → GridBox := outputData31.get
def coverData31 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData31 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover31 (i : Fin 4) : Fin 4 := ⟨coverData31.get i % 4, Nat.mod_lt _ (by decide)⟩
def source31 (i : Fin 4) : Fin 4 := ⟨sourceData31.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree31 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 (.cutY 14336 .empty (.cutX 9216 (.cutY 15360 (.cutX 8704 .empty (.cutY 14848 (.cutX 8960 .empty (.cutY 14592 .full .empty)) .empty)) .empty) .empty)) .empty)) (.cutY 12288 (.cutX 14336 .empty (.cutY 10240 (.cutX 15360 (.cutY 9216 (.cutX 14848 (.cutY 8704 .empty (.cutX 14592 (.cutY 8960 .empty .full) .empty)) .empty) .empty) .empty) .empty)) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 (.cutY 22528 .empty (.cutX 17408 .empty (.cutY 23552 .empty (.cutX 17920 .empty (.cutY 24064 (.cutX 18176 .empty (.cutY 23808 .full .empty)) .empty))))) .empty)) (.cutY 20480 (.cutX 22528 .empty (.cutY 18432 (.cutX 23552 .empty (.cutY 17408 .empty (.cutX 24064 (.cutY 17920 .empty (.cutX 23808 (.cutY 18176 .empty .full) .empty)) .empty))) .empty)) .empty)) .empty) .empty)))

theorem metadata31 : 0<200205545 ∧ 35<128 ∧ 56<128 ∧ 0<4 ∧
    3311/4160=0 ∧ 3311%4160=3311 ∧ ∀ i, (leaves31 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData31).mp
    (by decide +kernel)

theorem sourceChecked31_0 : ∀ i : Fin 4,
    (fun i => output31 i = raw31 (source31 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked31 : ∀ i : Fin 4, (fun i => output31 i = raw31 (source31 i)) i :=
  forallFin_of_zero_offset (fun i => output31 i = raw31 (source31 i)) sourceChecked31_0

theorem coverChecked31_0 : ∀ i : Fin 4,
    (fun i => (output31 (cover31 i)).ContainsBox (raw31 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked31 : ∀ i : Fin 4, (fun i => (output31 (cover31 i)).ContainsBox (raw31 i)) i :=
  forallFin_of_zero_offset (fun i => (output31 (cover31 i)).ContainsBox (raw31 i)) coverChecked31_0

theorem treeChecked31 : tree31.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves31 : List.ofFn output31 = tree31.leaves ⟨0,32768,0,32768⟩ := by
  unfold output31
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked31 : gridTreeUnionCheck 32768 raw31 output31 cover31 source31 tree31 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked31, coverChecked31, treeChecked31, treeLeaves31⟩

theorem areaUnits31 : gridUnionAreaUnits output31 = 262144 := by decide +kernel

noncomputable def phaseMass31 : ℝ := singlePhaseMass (200205545/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw31 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass31_eq : phaseMass31 = (40041109/327680000000 : ℝ) := by
  unfold phaseMass31
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw31 output31 cover31 source31
    (gridTreeUnionCheck_sound 32768 raw31 output31 cover31 source31 tree31 checked31)
    _ (by norm_num) _, areaUnits31]
  norm_num

-- Frozen phase 2528, atom 6778, type 1, source (25,43).
def leavesData32 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves32 : Fin 4 → DyadicLeaf := leavesData32.get
def raw32 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 25 43 leaves32 i
def outputData32 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨6400,6528,11008,11136⟩) (.single ⟨6400,6528,11136,11264⟩)) (.node (.single ⟨6528,6656,11008,11136⟩) (.single ⟨6528,6656,11136,11264⟩))) (.node (.node (.single ⟨11008,11136,6400,6528⟩) (.single ⟨11008,11136,6528,6656⟩)) (.node (.single ⟨11136,11264,6400,6528⟩) (.single ⟨11136,11264,6528,6656⟩)))) (.node (.node (.node (.single ⟨21504,21632,26112,26240⟩) (.single ⟨21504,21632,26240,26368⟩)) (.node (.single ⟨21632,21760,26112,26240⟩) (.single ⟨21632,21760,26240,26368⟩))) (.node (.node (.single ⟨26112,26240,21504,21632⟩) (.single ⟨26112,26240,21632,21760⟩)) (.node (.single ⟨26240,26368,21504,21632⟩) (.single ⟨26240,26368,21632,21760⟩)))))
def output32 : Fin 16 → GridBox := outputData32.get
def coverData32 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData32 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover32 (i : Fin 16) : Fin 16 := ⟨coverData32.get i % 16, Nat.mod_lt _ (by decide)⟩
def source32 (i : Fin 16) : Fin 16 := ⟨sourceData32.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree32 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 .empty (.cutY 10240 .empty (.cutX 7168 (.cutY 11264 (.cutX 6656 (.cutY 10752 .empty (.cutX 6400 .empty (.cutY 11008 .empty (.cutX 6528 (.cutY 11136 .full .full) (.cutY 11136 .full .full))))) .empty) .empty) .empty))) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 .empty (.cutY 6144 .empty (.cutX 11264 (.cutY 7168 (.cutX 10752 .empty (.cutY 6656 (.cutX 11008 .empty (.cutY 6400 .empty (.cutX 11136 (.cutY 6528 .full .full) (.cutY 6528 .full .full)))) .empty)) .empty) .empty)))) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 (.cutY 26624 (.cutX 21504 .empty (.cutY 25600 .empty (.cutX 22016 (.cutY 26112 .empty (.cutX 21760 (.cutY 26368 (.cutX 21632 (.cutY 26240 .full .full) (.cutY 26240 .full .full)) .empty) .empty)) .empty))) .empty) .empty) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 (.cutY 22528 (.cutX 25600 .empty (.cutY 21504 .empty (.cutX 26112 .empty (.cutY 22016 (.cutX 26368 (.cutY 21760 (.cutX 26240 (.cutY 21632 .full .full) (.cutY 21632 .full .full)) .empty) .empty) .empty)))) .empty) .empty)) .empty) .empty))))

theorem metadata32 : 0<130629080 ∧ 25<128 ∧ 43<128 ∧ 1<4 ∧
    6778/4160=1 ∧ 6778%4160=2618 ∧ ∀ i, (leaves32 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData32).mp
    (by decide +kernel)

theorem sourceChecked32_0 : ∀ i : Fin 16,
    (fun i => output32 i = raw32 (source32 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked32 : ∀ i : Fin 16, (fun i => output32 i = raw32 (source32 i)) i :=
  forallFin_of_zero_offset (fun i => output32 i = raw32 (source32 i)) sourceChecked32_0

theorem coverChecked32_0 : ∀ i : Fin 16,
    (fun i => (output32 (cover32 i)).ContainsBox (raw32 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked32 : ∀ i : Fin 16, (fun i => (output32 (cover32 i)).ContainsBox (raw32 i)) i :=
  forallFin_of_zero_offset (fun i => (output32 (cover32 i)).ContainsBox (raw32 i)) coverChecked32_0

theorem treeChecked32 : tree32.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves32 : List.ofFn output32 = tree32.leaves ⟨0,32768,0,32768⟩ := by
  unfold output32
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked32 : gridTreeUnionCheck 32768 raw32 output32 cover32 source32 tree32 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked32, coverChecked32, treeChecked32, treeLeaves32⟩

theorem areaUnits32 : gridUnionAreaUnits output32 = 262144 := by decide +kernel

noncomputable def phaseMass32 : ℝ := singlePhaseMass (130629080/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw32 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass32_eq : phaseMass32 = (3265727/40960000000 : ℝ) := by
  unfold phaseMass32
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw32 output32 cover32 source32
    (gridTreeUnionCheck_sound 32768 raw32 output32 cover32 source32 tree32 checked32)
    _ (by norm_num) _, areaUnits32]
  norm_num

-- Frozen phase 2529, atom 1832, type 0, source (16,40).
def leavesData33 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves33 : Fin 1 → DyadicLeaf := leavesData33.get
def raw33 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 16 40 leaves33 i
def outputData33 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨4096,4352,10240,10496⟩) (.single ⟨10240,10496,4096,4352⟩)) (.node (.single ⟨22272,22528,28416,28672⟩) (.single ⟨28416,28672,22272,22528⟩)))
def output33 : Fin 4 → GridBox := outputData33.get
def coverData33 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData33 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover33 (i : Fin 4) : Fin 4 := ⟨coverData33.get i % 4, Nat.mod_lt _ (by decide)⟩
def source33 (i : Fin 4) : Fin 4 := ⟨sourceData33.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree33 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 (.cutY 10240 .empty (.cutX 5120 (.cutY 11264 (.cutX 4608 (.cutY 10752 (.cutX 4352 (.cutY 10496 .full .empty) .empty) .empty) .empty) .empty) .empty)) .empty) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 .empty (.cutY 6144 (.cutX 11264 (.cutY 5120 (.cutX 10752 (.cutY 4608 (.cutX 10496 (.cutY 4352 .full .empty) .empty) .empty) .empty) .empty) .empty) .empty))) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 (.cutY 26624 .empty (.cutX 21504 .empty (.cutY 27648 .empty (.cutX 22016 .empty (.cutY 28160 .empty (.cutX 22272 .empty (.cutY 28416 .empty .full))))))) .empty) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 .empty (.cutY 22528 (.cutX 27648 .empty (.cutY 21504 .empty (.cutX 28160 .empty (.cutY 22016 .empty (.cutX 28416 .empty (.cutY 22272 .empty .full)))))) .empty))) .empty) .empty))))

theorem metadata33 : 0<73667111 ∧ 16<128 ∧ 40<128 ∧ 0<4 ∧
    1832/4160=0 ∧ 1832%4160=1832 ∧ ∀ i, (leaves33 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData33).mp
    (by decide +kernel)

theorem sourceChecked33_0 : ∀ i : Fin 4,
    (fun i => output33 i = raw33 (source33 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked33 : ∀ i : Fin 4, (fun i => output33 i = raw33 (source33 i)) i :=
  forallFin_of_zero_offset (fun i => output33 i = raw33 (source33 i)) sourceChecked33_0

theorem coverChecked33_0 : ∀ i : Fin 4,
    (fun i => (output33 (cover33 i)).ContainsBox (raw33 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked33 : ∀ i : Fin 4, (fun i => (output33 (cover33 i)).ContainsBox (raw33 i)) i :=
  forallFin_of_zero_offset (fun i => (output33 (cover33 i)).ContainsBox (raw33 i)) coverChecked33_0

theorem treeChecked33 : tree33.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves33 : List.ofFn output33 = tree33.leaves ⟨0,32768,0,32768⟩ := by
  unfold output33
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked33 : gridTreeUnionCheck 32768 raw33 output33 cover33 source33 tree33 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked33, coverChecked33, treeChecked33, treeLeaves33⟩

theorem areaUnits33 : gridUnionAreaUnits output33 = 262144 := by decide +kernel

noncomputable def phaseMass33 : ℝ := singlePhaseMass (73667111/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw33 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass33_eq : phaseMass33 = (73667111/1638400000000 : ℝ) := by
  unfold phaseMass33
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw33 output33 cover33 source33
    (gridTreeUnionCheck_sound 32768 raw33 output33 cover33 source33 tree33 checked33)
    _ (by norm_num) _, areaUnits33]
  norm_num

-- Frozen phase 2530, atom 2850, type 0, source (28,50).
def leavesData34 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves34 : Fin 1 → DyadicLeaf := leavesData34.get
def raw34 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 28 50 leaves34 i
def outputData34 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨7168,7424,12800,13056⟩) (.single ⟨12800,13056,7168,7424⟩)) (.node (.single ⟨19712,19968,25344,25600⟩) (.single ⟨25344,25600,19712,19968⟩)))
def output34 : Fin 4 → GridBox := outputData34.get
def coverData34 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData34 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover34 (i : Fin 4) : Fin 4 := ⟨coverData34.get i % 4, Nat.mod_lt _ (by decide)⟩
def source34 (i : Fin 4) : Fin 4 := ⟨sourceData34.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree34 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 .empty (.cutY 14336 (.cutX 7168 .empty (.cutY 13312 (.cutX 7680 (.cutY 12800 .empty (.cutX 7424 (.cutY 13056 .full .empty) .empty)) .empty) .empty)) .empty))))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 (.cutY 6144 .empty (.cutX 13312 (.cutY 7168 .empty (.cutX 12800 .empty (.cutY 7680 (.cutX 13056 (.cutY 7424 .full .empty) .empty) .empty))) .empty)) .empty))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 .empty (.cutY 26624 (.cutX 19456 .empty (.cutY 25600 (.cutX 19968 (.cutY 25088 .empty (.cutX 19712 .empty (.cutY 25344 .empty .full))) .empty) .empty)) .empty)) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 (.cutY 18432 .empty (.cutX 25600 (.cutY 19456 .empty (.cutX 25088 .empty (.cutY 19968 (.cutX 25344 .empty (.cutY 19712 .empty .full)) .empty))) .empty)) .empty) .empty) .empty) .empty))))

theorem metadata34 : 0<300263580 ∧ 28<128 ∧ 50<128 ∧ 0<4 ∧
    2850/4160=0 ∧ 2850%4160=2850 ∧ ∀ i, (leaves34 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData34).mp
    (by decide +kernel)

theorem sourceChecked34_0 : ∀ i : Fin 4,
    (fun i => output34 i = raw34 (source34 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked34 : ∀ i : Fin 4, (fun i => output34 i = raw34 (source34 i)) i :=
  forallFin_of_zero_offset (fun i => output34 i = raw34 (source34 i)) sourceChecked34_0

theorem coverChecked34_0 : ∀ i : Fin 4,
    (fun i => (output34 (cover34 i)).ContainsBox (raw34 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked34 : ∀ i : Fin 4, (fun i => (output34 (cover34 i)).ContainsBox (raw34 i)) i :=
  forallFin_of_zero_offset (fun i => (output34 (cover34 i)).ContainsBox (raw34 i)) coverChecked34_0

theorem treeChecked34 : tree34.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves34 : List.ofFn output34 = tree34.leaves ⟨0,32768,0,32768⟩ := by
  unfold output34
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked34 : gridTreeUnionCheck 32768 raw34 output34 cover34 source34 tree34 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked34, coverChecked34, treeChecked34, treeLeaves34⟩

theorem areaUnits34 : gridUnionAreaUnits output34 = 262144 := by decide +kernel

noncomputable def phaseMass34 : ℝ := singlePhaseMass (300263580/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw34 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass34_eq : phaseMass34 = (15013179/81920000000 : ℝ) := by
  unfold phaseMass34
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw34 output34 cover34 source34
    (gridTreeUnionCheck_sound 32768 raw34 output34 cover34 source34 tree34 checked34)
    _ (by norm_num) _, areaUnits34]
  norm_num

-- Frozen phase 2531, atom 1635, type 0, source (14,39).
def leavesData35 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves35 : Fin 1 → DyadicLeaf := leavesData35.get
def raw35 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 14 39 leaves35 i
def outputData35 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨3584,3840,9984,10240⟩) (.single ⟨9984,10240,3584,3840⟩)) (.node (.single ⟨22528,22784,28928,29184⟩) (.single ⟨28928,29184,22528,22784⟩)))
def output35 : Fin 4 → GridBox := outputData35.get
def coverData35 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData35 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover35 (i : Fin 4) : Fin 4 := ⟨coverData35.get i % 4, Nat.mod_lt _ (by decide)⟩
def source35 (i : Fin 4) : Fin 4 := ⟨sourceData35.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree35 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 .empty (.cutY 10240 (.cutX 3072 .empty (.cutY 9216 .empty (.cutX 3584 .empty (.cutY 9728 .empty (.cutX 3840 (.cutY 9984 .empty .full) .empty))))) .empty)) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 .empty (.cutX 9216 .empty (.cutY 3072 .empty (.cutX 9728 .empty (.cutY 3584 .empty (.cutX 9984 .empty (.cutY 3840 .full .empty))))))) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 (.cutX 23552 (.cutY 29696 (.cutX 23040 (.cutY 29184 (.cutX 22784 (.cutY 28928 .empty .full) .empty) .empty) .empty) .empty) .empty) .empty))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 (.cutY 22528 .empty (.cutX 29696 (.cutY 23552 (.cutX 29184 (.cutY 23040 (.cutX 28928 .empty (.cutY 22784 .full .empty)) .empty) .empty) .empty) .empty)) .empty))) .empty))))

theorem metadata35 : 0<290391823 ∧ 14<128 ∧ 39<128 ∧ 0<4 ∧
    1635/4160=0 ∧ 1635%4160=1635 ∧ ∀ i, (leaves35 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData35).mp
    (by decide +kernel)

theorem sourceChecked35_0 : ∀ i : Fin 4,
    (fun i => output35 i = raw35 (source35 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked35 : ∀ i : Fin 4, (fun i => output35 i = raw35 (source35 i)) i :=
  forallFin_of_zero_offset (fun i => output35 i = raw35 (source35 i)) sourceChecked35_0

theorem coverChecked35_0 : ∀ i : Fin 4,
    (fun i => (output35 (cover35 i)).ContainsBox (raw35 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked35 : ∀ i : Fin 4, (fun i => (output35 (cover35 i)).ContainsBox (raw35 i)) i :=
  forallFin_of_zero_offset (fun i => (output35 (cover35 i)).ContainsBox (raw35 i)) coverChecked35_0

theorem treeChecked35 : tree35.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves35 : List.ofFn output35 = tree35.leaves ⟨0,32768,0,32768⟩ := by
  unfold output35
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked35 : gridTreeUnionCheck 32768 raw35 output35 cover35 source35 tree35 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked35, coverChecked35, treeChecked35, treeLeaves35⟩

theorem areaUnits35 : gridUnionAreaUnits output35 = 262144 := by decide +kernel

noncomputable def phaseMass35 : ℝ := singlePhaseMass (290391823/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw35 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass35_eq : phaseMass35 = (290391823/1638400000000 : ℝ) := by
  unfold phaseMass35
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw35 output35 cover35 source35
    (gridTreeUnionCheck_sound 32768 raw35 output35 cover35 source35 tree35 checked35)
    _ (by norm_num) _, areaUnits35]
  norm_num

-- Frozen phase 2532, atom 7467, type 1, source (35,52).
def leavesData36 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves36 : Fin 4 → DyadicLeaf := leavesData36.get
def raw36 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 35 52 leaves36 i
def outputData36 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨8960,9088,13312,13440⟩) (.single ⟨8960,9088,13440,13568⟩)) (.node (.single ⟨9088,9216,13312,13440⟩) (.single ⟨9088,9216,13440,13568⟩))) (.node (.node (.single ⟨13312,13440,8960,9088⟩) (.single ⟨13312,13440,9088,9216⟩)) (.node (.single ⟨13440,13568,8960,9088⟩) (.single ⟨13440,13568,9088,9216⟩)))) (.node (.node (.node (.single ⟨19200,19328,23552,23680⟩) (.single ⟨19200,19328,23680,23808⟩)) (.node (.single ⟨19328,19456,23552,23680⟩) (.single ⟨19328,19456,23680,23808⟩))) (.node (.node (.single ⟨23552,23680,19200,19328⟩) (.single ⟨23552,23680,19328,19456⟩)) (.node (.single ⟨23680,23808,19200,19328⟩) (.single ⟨23680,23808,19328,19456⟩)))))
def output36 : Fin 16 → GridBox := outputData36.get
def coverData36 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData36 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover36 (i : Fin 16) : Fin 16 := ⟨coverData36.get i % 16, Nat.mod_lt _ (by decide)⟩
def source36 (i : Fin 16) : Fin 16 := ⟨sourceData36.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree36 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 (.cutY 14336 (.cutX 9216 (.cutY 13312 .empty (.cutX 8704 .empty (.cutY 13824 (.cutX 8960 .empty (.cutY 13568 (.cutX 9088 (.cutY 13440 .full .full) (.cutY 13440 .full .full)) .empty)) .empty))) .empty) .empty) .empty)) (.cutY 12288 (.cutX 14336 (.cutY 10240 (.cutX 13312 .empty (.cutY 9216 (.cutX 13824 (.cutY 8704 .empty (.cutX 13568 (.cutY 8960 .empty (.cutX 13440 (.cutY 9088 .full .full) (.cutY 9088 .full .full))) .empty)) .empty) .empty)) .empty) .empty) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 .empty (.cutY 22528 .empty (.cutX 19456 (.cutY 23552 .empty (.cutX 18944 .empty (.cutY 24064 (.cutX 19200 .empty (.cutY 23808 (.cutX 19328 (.cutY 23680 .full .full) (.cutY 23680 .full .full)) .empty)) .empty))) .empty)))) (.cutY 20480 (.cutX 22528 .empty (.cutY 18432 .empty (.cutX 23552 .empty (.cutY 19456 (.cutX 24064 (.cutY 18944 .empty (.cutX 23808 (.cutY 19200 .empty (.cutX 23680 (.cutY 19328 .full .full) (.cutY 19328 .full .full))) .empty)) .empty) .empty)))) .empty)) .empty) .empty)))

theorem metadata36 : 0<134822691 ∧ 35<128 ∧ 52<128 ∧ 1<4 ∧
    7467/4160=1 ∧ 7467%4160=3307 ∧ ∀ i, (leaves36 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData36).mp
    (by decide +kernel)

theorem sourceChecked36_0 : ∀ i : Fin 16,
    (fun i => output36 i = raw36 (source36 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked36 : ∀ i : Fin 16, (fun i => output36 i = raw36 (source36 i)) i :=
  forallFin_of_zero_offset (fun i => output36 i = raw36 (source36 i)) sourceChecked36_0

theorem coverChecked36_0 : ∀ i : Fin 16,
    (fun i => (output36 (cover36 i)).ContainsBox (raw36 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked36 : ∀ i : Fin 16, (fun i => (output36 (cover36 i)).ContainsBox (raw36 i)) i :=
  forallFin_of_zero_offset (fun i => (output36 (cover36 i)).ContainsBox (raw36 i)) coverChecked36_0

theorem treeChecked36 : tree36.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves36 : List.ofFn output36 = tree36.leaves ⟨0,32768,0,32768⟩ := by
  unfold output36
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked36 : gridTreeUnionCheck 32768 raw36 output36 cover36 source36 tree36 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked36, coverChecked36, treeChecked36, treeLeaves36⟩

theorem areaUnits36 : gridUnionAreaUnits output36 = 262144 := by decide +kernel

noncomputable def phaseMass36 : ℝ := singlePhaseMass (134822691/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw36 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass36_eq : phaseMass36 = (134822691/1638400000000 : ℝ) := by
  unfold phaseMass36
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw36 output36 cover36 source36
    (gridTreeUnionCheck_sound 32768 raw36 output36 cover36 source36 tree36 checked36)
    _ (by norm_num) _, areaUnits36]
  norm_num

-- Frozen phase 2533, atom 3369, type 0, source (36,57).
def leavesData37 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves37 : Fin 1 → DyadicLeaf := leavesData37.get
def raw37 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 36 57 leaves37 i
def outputData37 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨9216,9472,14592,14848⟩) (.single ⟨14592,14848,9216,9472⟩)) (.node (.single ⟨17920,18176,23296,23552⟩) (.single ⟨23296,23552,17920,18176⟩)))
def output37 : Fin 4 → GridBox := outputData37.get
def coverData37 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData37 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover37 (i : Fin 4) : Fin 4 := ⟨coverData37.get i % 4, Nat.mod_lt _ (by decide)⟩
def source37 (i : Fin 4) : Fin 4 := ⟨sourceData37.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree37 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 (.cutY 14336 .empty (.cutX 9216 .empty (.cutY 15360 (.cutX 9728 (.cutY 14848 (.cutX 9472 (.cutY 14592 .empty .full) .empty) .empty) .empty) .empty))) .empty)) (.cutY 12288 (.cutX 14336 .empty (.cutY 10240 (.cutX 15360 (.cutY 9216 .empty (.cutX 14848 (.cutY 9728 (.cutX 14592 .empty (.cutY 9472 .full .empty)) .empty) .empty)) .empty) .empty)) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 (.cutY 22528 .empty (.cutX 17408 .empty (.cutY 23552 (.cutX 17920 .empty (.cutY 23040 .empty (.cutX 18176 (.cutY 23296 .empty .full) .empty))) .empty))) .empty)) (.cutY 20480 (.cutX 22528 .empty (.cutY 18432 (.cutX 23552 (.cutY 17408 .empty (.cutX 23040 .empty (.cutY 17920 .empty (.cutX 23296 .empty (.cutY 18176 .full .empty))))) .empty) .empty)) .empty)) .empty) .empty)))

theorem metadata37 : 0<200205545 ∧ 36<128 ∧ 57<128 ∧ 0<4 ∧
    3369/4160=0 ∧ 3369%4160=3369 ∧ ∀ i, (leaves37 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData37).mp
    (by decide +kernel)

theorem sourceChecked37_0 : ∀ i : Fin 4,
    (fun i => output37 i = raw37 (source37 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked37 : ∀ i : Fin 4, (fun i => output37 i = raw37 (source37 i)) i :=
  forallFin_of_zero_offset (fun i => output37 i = raw37 (source37 i)) sourceChecked37_0

theorem coverChecked37_0 : ∀ i : Fin 4,
    (fun i => (output37 (cover37 i)).ContainsBox (raw37 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked37 : ∀ i : Fin 4, (fun i => (output37 (cover37 i)).ContainsBox (raw37 i)) i :=
  forallFin_of_zero_offset (fun i => (output37 (cover37 i)).ContainsBox (raw37 i)) coverChecked37_0

theorem treeChecked37 : tree37.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves37 : List.ofFn output37 = tree37.leaves ⟨0,32768,0,32768⟩ := by
  unfold output37
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked37 : gridTreeUnionCheck 32768 raw37 output37 cover37 source37 tree37 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked37, coverChecked37, treeChecked37, treeLeaves37⟩

theorem areaUnits37 : gridUnionAreaUnits output37 = 262144 := by decide +kernel

noncomputable def phaseMass37 : ℝ := singlePhaseMass (200205545/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw37 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass37_eq : phaseMass37 = (40041109/327680000000 : ℝ) := by
  unfold phaseMass37
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw37 output37 cover37 source37
    (gridTreeUnionCheck_sound 32768 raw37 output37 cover37 source37 tree37 checked37)
    _ (by norm_num) _, areaUnits37]
  norm_num

-- Frozen phase 2534, atom 4048, type 0, source (53,73).
def leavesData38 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves38 : Fin 1 → DyadicLeaf := leavesData38.get
def raw38 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 53 73 leaves38 i
def outputData38 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨13568,13824,18688,18944⟩) (.single ⟨13824,14080,18944,19200⟩)) (.node (.single ⟨18688,18944,13568,13824⟩) (.single ⟨18944,19200,13824,14080⟩)))
def output38 : Fin 4 → GridBox := outputData38.get
def coverData38 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 2)) (.node (.single 3) (.single 1)))
def sourceData38 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 3)) (.node (.single 1) (.single 2)))
def cover38 (i : Fin 4) : Fin 4 := ⟨coverData38.get i % 4, Nat.mod_lt _ (by decide)⟩
def source38 (i : Fin 4) : Fin 4 := ⟨sourceData38.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree38 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 .empty (.cutY 20480 (.cutX 14336 (.cutY 18432 .empty (.cutX 13312 .empty (.cutY 19456 (.cutX 13824 (.cutY 18944 (.cutX 13568 .empty (.cutY 18688 .empty .full)) .empty) (.cutY 18944 .empty (.cutX 14080 (.cutY 19200 .full .empty) .empty))) .empty))) .empty) .empty)) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 .empty (.cutX 18432 .empty (.cutY 14336 (.cutX 19456 (.cutY 13312 .empty (.cutX 18944 (.cutY 13824 (.cutX 18688 .empty (.cutY 13568 .empty .full)) .empty) (.cutY 13824 .empty (.cutX 19200 (.cutY 14080 .full .empty) .empty)))) .empty) .empty))) .empty)) .empty) .empty))

theorem metadata38 : 0<76472504 ∧ 53<128 ∧ 73<128 ∧ 0<4 ∧
    4048/4160=0 ∧ 4048%4160=4048 ∧ ∀ i, (leaves38 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData38).mp
    (by decide +kernel)

theorem sourceChecked38_0 : ∀ i : Fin 4,
    (fun i => output38 i = raw38 (source38 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked38 : ∀ i : Fin 4, (fun i => output38 i = raw38 (source38 i)) i :=
  forallFin_of_zero_offset (fun i => output38 i = raw38 (source38 i)) sourceChecked38_0

theorem coverChecked38_0 : ∀ i : Fin 4,
    (fun i => (output38 (cover38 i)).ContainsBox (raw38 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked38 : ∀ i : Fin 4, (fun i => (output38 (cover38 i)).ContainsBox (raw38 i)) i :=
  forallFin_of_zero_offset (fun i => (output38 (cover38 i)).ContainsBox (raw38 i)) coverChecked38_0

theorem treeChecked38 : tree38.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves38 : List.ofFn output38 = tree38.leaves ⟨0,32768,0,32768⟩ := by
  unfold output38
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked38 : gridTreeUnionCheck 32768 raw38 output38 cover38 source38 tree38 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked38, coverChecked38, treeChecked38, treeLeaves38⟩

theorem areaUnits38 : gridUnionAreaUnits output38 = 262144 := by decide +kernel

noncomputable def phaseMass38 : ℝ := singlePhaseMass (76472504/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw38 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass38_eq : phaseMass38 = (9559063/204800000000 : ℝ) := by
  unfold phaseMass38
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw38 output38 cover38 source38
    (gridTreeUnionCheck_sound 32768 raw38 output38 cover38 source38 tree38 checked38)
    _ (by norm_num) _, areaUnits38]
  norm_num

-- Frozen phase 2535, atom 3800, type 0, source (45,65).
def leavesData39 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves39 : Fin 1 → DyadicLeaf := leavesData39.get
def raw39 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 45 65 leaves39 i
def outputData39 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨11520,11776,16640,16896⟩) (.single ⟨15872,16128,20992,21248⟩)) (.node (.single ⟨16640,16896,11520,11776⟩) (.single ⟨20992,21248,15872,16128⟩)))
def output39 : Fin 4 → GridBox := outputData39.get
def coverData39 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 2)) (.node (.single 3) (.single 1)))
def sourceData39 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 3)) (.node (.single 1) (.single 2)))
def cover39 (i : Fin 4) : Fin 4 := ⟨coverData39.get i % 4, Nat.mod_lt _ (by decide)⟩
def source39 (i : Fin 4) : Fin 4 := ⟨sourceData39.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree39 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 .empty (.cutY 18432 (.cutX 11264 .empty (.cutY 17408 (.cutX 11776 (.cutY 16896 (.cutX 11520 .empty (.cutY 16640 .empty .full)) .empty) .empty) .empty)) .empty)) .empty) (.cutY 20480 .empty (.cutX 14336 .empty (.cutY 22528 (.cutX 15360 .empty (.cutY 21504 (.cutX 15872 .empty (.cutY 20992 .empty (.cutX 16128 (.cutY 21248 .full .empty) .empty))) .empty)) .empty)))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 (.cutY 10240 .empty (.cutX 17408 (.cutY 11264 .empty (.cutX 16896 (.cutY 11776 (.cutX 16640 .empty (.cutY 11520 .empty .full)) .empty) .empty)) .empty)) .empty) .empty) (.cutY 12288 .empty (.cutX 22528 (.cutY 14336 .empty (.cutX 21504 (.cutY 15360 .empty (.cutX 20992 .empty (.cutY 15872 .empty (.cutX 21248 (.cutY 16128 .full .empty) .empty)))) .empty)) .empty)))) .empty) .empty))

theorem metadata39 : 0<20837145 ∧ 45<128 ∧ 65<128 ∧ 0<4 ∧
    3800/4160=0 ∧ 3800%4160=3800 ∧ ∀ i, (leaves39 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData39).mp
    (by decide +kernel)

theorem sourceChecked39_0 : ∀ i : Fin 4,
    (fun i => output39 i = raw39 (source39 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked39 : ∀ i : Fin 4, (fun i => output39 i = raw39 (source39 i)) i :=
  forallFin_of_zero_offset (fun i => output39 i = raw39 (source39 i)) sourceChecked39_0

theorem coverChecked39_0 : ∀ i : Fin 4,
    (fun i => (output39 (cover39 i)).ContainsBox (raw39 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked39 : ∀ i : Fin 4, (fun i => (output39 (cover39 i)).ContainsBox (raw39 i)) i :=
  forallFin_of_zero_offset (fun i => (output39 (cover39 i)).ContainsBox (raw39 i)) coverChecked39_0

theorem treeChecked39 : tree39.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves39 : List.ofFn output39 = tree39.leaves ⟨0,32768,0,32768⟩ := by
  unfold output39
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked39 : gridTreeUnionCheck 32768 raw39 output39 cover39 source39 tree39 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked39, coverChecked39, treeChecked39, treeLeaves39⟩

theorem areaUnits39 : gridUnionAreaUnits output39 = 262144 := by decide +kernel

noncomputable def phaseMass39 : ℝ := singlePhaseMass (20837145/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw39 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass39_eq : phaseMass39 = (4167429/327680000000 : ℝ) := by
  unfold phaseMass39
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw39 output39 cover39 source39
    (gridTreeUnionCheck_sound 32768 raw39 output39 cover39 source39 tree39 checked39)
    _ (by norm_num) _, areaUnits39]
  norm_num

-- Frozen phase 2536, atom 2922, type 0, source (29,51).
def leavesData40 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves40 : Fin 1 → DyadicLeaf := leavesData40.get
def raw40 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 29 51 leaves40 i
def outputData40 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨7424,7680,13056,13312⟩) (.single ⟨13056,13312,7424,7680⟩)) (.node (.single ⟨19456,19712,25088,25344⟩) (.single ⟨25088,25344,19456,19712⟩)))
def output40 : Fin 4 → GridBox := outputData40.get
def coverData40 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData40 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover40 (i : Fin 4) : Fin 4 := ⟨coverData40.get i % 4, Nat.mod_lt _ (by decide)⟩
def source40 (i : Fin 4) : Fin 4 := ⟨sourceData40.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree40 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 .empty (.cutY 14336 (.cutX 7168 .empty (.cutY 13312 (.cutX 7680 (.cutY 12800 .empty (.cutX 7424 .empty (.cutY 13056 .empty .full))) .empty) .empty)) .empty))))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 (.cutY 6144 .empty (.cutX 13312 (.cutY 7168 .empty (.cutX 12800 .empty (.cutY 7680 (.cutX 13056 .empty (.cutY 7424 .empty .full)) .empty))) .empty)) .empty))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 .empty (.cutY 26624 (.cutX 19456 .empty (.cutY 25600 (.cutX 19968 (.cutY 25088 .empty (.cutX 19712 (.cutY 25344 .full .empty) .empty)) .empty) .empty)) .empty)) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 (.cutY 18432 .empty (.cutX 25600 (.cutY 19456 .empty (.cutX 25088 .empty (.cutY 19968 (.cutX 25344 (.cutY 19712 .full .empty) .empty) .empty))) .empty)) .empty) .empty) .empty) .empty))))

theorem metadata40 : 0<300263580 ∧ 29<128 ∧ 51<128 ∧ 0<4 ∧
    2922/4160=0 ∧ 2922%4160=2922 ∧ ∀ i, (leaves40 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData40).mp
    (by decide +kernel)

theorem sourceChecked40_0 : ∀ i : Fin 4,
    (fun i => output40 i = raw40 (source40 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked40 : ∀ i : Fin 4, (fun i => output40 i = raw40 (source40 i)) i :=
  forallFin_of_zero_offset (fun i => output40 i = raw40 (source40 i)) sourceChecked40_0

theorem coverChecked40_0 : ∀ i : Fin 4,
    (fun i => (output40 (cover40 i)).ContainsBox (raw40 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked40 : ∀ i : Fin 4, (fun i => (output40 (cover40 i)).ContainsBox (raw40 i)) i :=
  forallFin_of_zero_offset (fun i => (output40 (cover40 i)).ContainsBox (raw40 i)) coverChecked40_0

theorem treeChecked40 : tree40.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves40 : List.ofFn output40 = tree40.leaves ⟨0,32768,0,32768⟩ := by
  unfold output40
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked40 : gridTreeUnionCheck 32768 raw40 output40 cover40 source40 tree40 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked40, coverChecked40, treeChecked40, treeLeaves40⟩

theorem areaUnits40 : gridUnionAreaUnits output40 = 262144 := by decide +kernel

noncomputable def phaseMass40 : ℝ := singlePhaseMass (300263580/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw40 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass40_eq : phaseMass40 = (15013179/81920000000 : ℝ) := by
  unfold phaseMass40
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw40 output40 cover40 source40
    (gridTreeUnionCheck_sound 32768 raw40 output40 cover40 source40 tree40 checked40)
    _ (by norm_num) _, areaUnits40]
  norm_num

-- Frozen phase 2537, atom 6084, type 1, source (17,37).
def leavesData41 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves41 : Fin 4 → DyadicLeaf := leavesData41.get
def raw41 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 17 37 leaves41 i
def outputData41 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨4352,4480,9472,9600⟩) (.single ⟨4352,4480,9600,9728⟩)) (.node (.single ⟨4480,4608,9472,9600⟩) (.single ⟨4480,4608,9600,9728⟩))) (.node (.node (.single ⟨9472,9600,4352,4480⟩) (.single ⟨9472,9600,4480,4608⟩)) (.node (.single ⟨9600,9728,4352,4480⟩) (.single ⟨9600,9728,4480,4608⟩)))) (.node (.node (.node (.single ⟨23040,23168,28160,28288⟩) (.single ⟨23040,23168,28288,28416⟩)) (.node (.single ⟨23168,23296,28160,28288⟩) (.single ⟨23168,23296,28288,28416⟩))) (.node (.node (.single ⟨28160,28288,23040,23168⟩) (.single ⟨28160,28288,23168,23296⟩)) (.node (.single ⟨28288,28416,23040,23168⟩) (.single ⟨28288,28416,23168,23296⟩)))))
def output41 : Fin 16 → GridBox := outputData41.get
def coverData41 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData41 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover41 (i : Fin 16) : Fin 16 := ⟨coverData41.get i % 16, Nat.mod_lt _ (by decide)⟩
def source41 (i : Fin 16) : Fin 16 := ⟨sourceData41.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree41 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 (.cutY 10240 (.cutX 5120 (.cutY 9216 .empty (.cutX 4608 (.cutY 9728 (.cutX 4352 .empty (.cutY 9472 .empty (.cutX 4480 (.cutY 9600 .full .full) (.cutY 9600 .full .full)))) .empty) .empty)) .empty) .empty) .empty) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 (.cutY 6144 (.cutX 9216 .empty (.cutY 5120 (.cutX 9728 (.cutY 4608 (.cutX 9472 .empty (.cutY 4352 .empty (.cutX 9600 (.cutY 4480 .full .full) (.cutY 4480 .full .full)))) .empty) .empty) .empty)) .empty) .empty)) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 .empty (.cutY 26624 .empty (.cutX 23552 (.cutY 27648 .empty (.cutX 23040 .empty (.cutY 28160 .empty (.cutX 23296 (.cutY 28416 (.cutX 23168 (.cutY 28288 .full .full) (.cutY 28288 .full .full)) .empty) .empty)))) .empty))) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 .empty (.cutY 22528 .empty (.cutX 27648 .empty (.cutY 23552 (.cutX 28160 .empty (.cutY 23040 .empty (.cutX 28416 (.cutY 23296 (.cutX 28288 (.cutY 23168 .full .full) (.cutY 23168 .full .full)) .empty) .empty))) .empty))))) .empty) .empty))))

theorem metadata41 : 0<161185172 ∧ 17<128 ∧ 37<128 ∧ 1<4 ∧
    6084/4160=1 ∧ 6084%4160=1924 ∧ ∀ i, (leaves41 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData41).mp
    (by decide +kernel)

theorem sourceChecked41_0 : ∀ i : Fin 16,
    (fun i => output41 i = raw41 (source41 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked41 : ∀ i : Fin 16, (fun i => output41 i = raw41 (source41 i)) i :=
  forallFin_of_zero_offset (fun i => output41 i = raw41 (source41 i)) sourceChecked41_0

theorem coverChecked41_0 : ∀ i : Fin 16,
    (fun i => (output41 (cover41 i)).ContainsBox (raw41 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked41 : ∀ i : Fin 16, (fun i => (output41 (cover41 i)).ContainsBox (raw41 i)) i :=
  forallFin_of_zero_offset (fun i => (output41 (cover41 i)).ContainsBox (raw41 i)) coverChecked41_0

theorem treeChecked41 : tree41.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves41 : List.ofFn output41 = tree41.leaves ⟨0,32768,0,32768⟩ := by
  unfold output41
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked41 : gridTreeUnionCheck 32768 raw41 output41 cover41 source41 tree41 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked41, coverChecked41, treeChecked41, treeLeaves41⟩

theorem areaUnits41 : gridUnionAreaUnits output41 = 262144 := by decide +kernel

noncomputable def phaseMass41 : ℝ := singlePhaseMass (161185172/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw41 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass41_eq : phaseMass41 = (40296293/409600000000 : ℝ) := by
  unfold phaseMass41
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw41 output41 cover41 source41
    (gridTreeUnionCheck_sound 32768 raw41 output41 cover41 source41 tree41 checked41)
    _ (by norm_num) _, areaUnits41]
  norm_num

-- Frozen phase 2538, atom 5264, type 1, source (9,33).
def leavesData42 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves42 : Fin 1 → DyadicLeaf := leavesData42.get
def raw42 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 9 33 leaves42 i
def outputData42 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨2304,2560,8448,8704⟩) (.single ⟨8448,8704,2304,2560⟩)) (.node (.single ⟨24064,24320,30208,30464⟩) (.single ⟨30208,30464,24064,24320⟩)))
def output42 : Fin 4 → GridBox := outputData42.get
def coverData42 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData42 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover42 (i : Fin 4) : Fin 4 := ⟨coverData42.get i % 4, Nat.mod_lt _ (by decide)⟩
def source42 (i : Fin 4) : Fin 4 := ⟨sourceData42.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree42 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 .empty (.cutY 10240 (.cutX 3072 (.cutY 9216 (.cutX 2560 (.cutY 8704 (.cutX 2304 .empty (.cutY 8448 .empty .full)) .empty) .empty) .empty) .empty) .empty)) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 .empty (.cutX 9216 (.cutY 3072 (.cutX 8704 (.cutY 2560 (.cutX 8448 .empty (.cutY 2304 .empty .full)) .empty) .empty) .empty) .empty)) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 (.cutX 23552 .empty (.cutY 29696 .empty (.cutX 24064 .empty (.cutY 30208 .empty (.cutX 24320 (.cutY 30464 .full .empty) .empty))))) .empty))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 (.cutY 22528 .empty (.cutX 29696 .empty (.cutY 23552 .empty (.cutX 30208 .empty (.cutY 24064 .empty (.cutX 30464 (.cutY 24320 .full .empty) .empty)))))) .empty))) .empty))))

theorem metadata42 : 0<190129790 ∧ 9<128 ∧ 33<128 ∧ 1<4 ∧
    5264/4160=1 ∧ 5264%4160=1104 ∧ ∀ i, (leaves42 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData42).mp
    (by decide +kernel)

theorem sourceChecked42_0 : ∀ i : Fin 4,
    (fun i => output42 i = raw42 (source42 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked42 : ∀ i : Fin 4, (fun i => output42 i = raw42 (source42 i)) i :=
  forallFin_of_zero_offset (fun i => output42 i = raw42 (source42 i)) sourceChecked42_0

theorem coverChecked42_0 : ∀ i : Fin 4,
    (fun i => (output42 (cover42 i)).ContainsBox (raw42 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked42 : ∀ i : Fin 4, (fun i => (output42 (cover42 i)).ContainsBox (raw42 i)) i :=
  forallFin_of_zero_offset (fun i => (output42 (cover42 i)).ContainsBox (raw42 i)) coverChecked42_0

theorem treeChecked42 : tree42.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves42 : List.ofFn output42 = tree42.leaves ⟨0,32768,0,32768⟩ := by
  unfold output42
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked42 : gridTreeUnionCheck 32768 raw42 output42 cover42 source42 tree42 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked42, coverChecked42, treeChecked42, treeLeaves42⟩

theorem areaUnits42 : gridUnionAreaUnits output42 = 262144 := by decide +kernel

noncomputable def phaseMass42 : ℝ := singlePhaseMass (190129790/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw42 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass42_eq : phaseMass42 = (19012979/163840000000 : ℝ) := by
  unfold phaseMass42
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw42 output42 cover42 source42
    (gridTreeUnionCheck_sound 32768 raw42 output42 cover42 source42 tree42 checked42)
    _ (by norm_num) _, areaUnits42]
  norm_num

-- Frozen phase 2539, atom 650, type 0, source (5,35).
def leavesData43 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves43 : Fin 1 → DyadicLeaf := leavesData43.get
def raw43 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 5 35 leaves43 i
def outputData43 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨1280,1536,8960,9216⟩) (.single ⟨8960,9216,1280,1536⟩)) (.node (.single ⟨23552,23808,31232,31488⟩) (.single ⟨31232,31488,23552,23808⟩)))
def output43 : Fin 4 → GridBox := outputData43.get
def coverData43 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData43 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover43 (i : Fin 4) : Fin 4 := ⟨coverData43.get i % 4, Nat.mod_lt _ (by decide)⟩
def source43 (i : Fin 4) : Fin 4 := ⟨sourceData43.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree43 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 (.cutY 10240 (.cutX 1024 .empty (.cutY 9216 (.cutX 1536 (.cutY 8704 .empty (.cutX 1280 .empty (.cutY 8960 .empty .full))) .empty) .empty)) .empty) .empty) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 (.cutX 9216 (.cutY 1024 .empty (.cutX 8704 .empty (.cutY 1536 (.cutX 8960 .empty (.cutY 1280 .empty .full)) .empty))) .empty) .empty) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 .empty (.cutX 23552 .empty (.cutY 31744 (.cutX 24064 (.cutY 31232 .empty (.cutX 23808 (.cutY 31488 .full .empty) .empty)) .empty) .empty))))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 .empty (.cutY 22528 .empty (.cutX 31744 (.cutY 23552 .empty (.cutX 31232 .empty (.cutY 24064 (.cutX 31488 (.cutY 23808 .full .empty) .empty) .empty))) .empty))))) .empty))))

theorem metadata43 : 0<523383676 ∧ 5<128 ∧ 35<128 ∧ 0<4 ∧
    650/4160=0 ∧ 650%4160=650 ∧ ∀ i, (leaves43 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData43).mp
    (by decide +kernel)

theorem sourceChecked43_0 : ∀ i : Fin 4,
    (fun i => output43 i = raw43 (source43 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked43 : ∀ i : Fin 4, (fun i => output43 i = raw43 (source43 i)) i :=
  forallFin_of_zero_offset (fun i => output43 i = raw43 (source43 i)) sourceChecked43_0

theorem coverChecked43_0 : ∀ i : Fin 4,
    (fun i => (output43 (cover43 i)).ContainsBox (raw43 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked43 : ∀ i : Fin 4, (fun i => (output43 (cover43 i)).ContainsBox (raw43 i)) i :=
  forallFin_of_zero_offset (fun i => (output43 (cover43 i)).ContainsBox (raw43 i)) coverChecked43_0

theorem treeChecked43 : tree43.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves43 : List.ofFn output43 = tree43.leaves ⟨0,32768,0,32768⟩ := by
  unfold output43
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked43 : gridTreeUnionCheck 32768 raw43 output43 cover43 source43 tree43 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked43, coverChecked43, treeChecked43, treeLeaves43⟩

theorem areaUnits43 : gridUnionAreaUnits output43 = 262144 := by decide +kernel

noncomputable def phaseMass43 : ℝ := singlePhaseMass (523383676/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw43 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass43_eq : phaseMass43 = (130845919/409600000000 : ℝ) := by
  unfold phaseMass43
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw43 output43 cover43 source43
    (gridTreeUnionCheck_sound 32768 raw43 output43 cover43 source43 tree43 checked43)
    _ (by norm_num) _, areaUnits43]
  norm_num

-- Frozen phase 2540, atom 3838, type 0, source (46,66).
def leavesData44 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves44 : Fin 1 → DyadicLeaf := leavesData44.get
def raw44 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 46 66 leaves44 i
def outputData44 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨11776,12032,16896,17152⟩) (.single ⟨15616,15872,20736,20992⟩)) (.node (.single ⟨16896,17152,11776,12032⟩) (.single ⟨20736,20992,15616,15872⟩)))
def output44 : Fin 4 → GridBox := outputData44.get
def coverData44 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 2)) (.node (.single 3) (.single 1)))
def sourceData44 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 3)) (.node (.single 1) (.single 2)))
def cover44 (i : Fin 4) : Fin 4 := ⟨coverData44.get i % 4, Nat.mod_lt _ (by decide)⟩
def source44 (i : Fin 4) : Fin 4 := ⟨sourceData44.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree44 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 .empty (.cutY 18432 (.cutX 11264 .empty (.cutY 17408 (.cutX 11776 .empty (.cutY 16896 .empty (.cutX 12032 (.cutY 17152 .full .empty) .empty))) .empty)) .empty)) .empty) (.cutY 20480 .empty (.cutX 14336 .empty (.cutY 22528 (.cutX 15360 .empty (.cutY 21504 (.cutX 15872 (.cutY 20992 (.cutX 15616 .empty (.cutY 20736 .empty .full)) .empty) .empty) .empty)) .empty)))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 (.cutY 10240 .empty (.cutX 17408 (.cutY 11264 .empty (.cutX 16896 .empty (.cutY 11776 .empty (.cutX 17152 (.cutY 12032 .full .empty) .empty)))) .empty)) .empty) .empty) (.cutY 12288 .empty (.cutX 22528 (.cutY 14336 .empty (.cutX 21504 (.cutY 15360 .empty (.cutX 20992 (.cutY 15872 (.cutX 20736 .empty (.cutY 15616 .empty .full)) .empty) .empty)) .empty)) .empty)))) .empty) .empty))

theorem metadata44 : 0<20837145 ∧ 46<128 ∧ 66<128 ∧ 0<4 ∧
    3838/4160=0 ∧ 3838%4160=3838 ∧ ∀ i, (leaves44 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData44).mp
    (by decide +kernel)

theorem sourceChecked44_0 : ∀ i : Fin 4,
    (fun i => output44 i = raw44 (source44 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked44 : ∀ i : Fin 4, (fun i => output44 i = raw44 (source44 i)) i :=
  forallFin_of_zero_offset (fun i => output44 i = raw44 (source44 i)) sourceChecked44_0

theorem coverChecked44_0 : ∀ i : Fin 4,
    (fun i => (output44 (cover44 i)).ContainsBox (raw44 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked44 : ∀ i : Fin 4, (fun i => (output44 (cover44 i)).ContainsBox (raw44 i)) i :=
  forallFin_of_zero_offset (fun i => (output44 (cover44 i)).ContainsBox (raw44 i)) coverChecked44_0

theorem treeChecked44 : tree44.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves44 : List.ofFn output44 = tree44.leaves ⟨0,32768,0,32768⟩ := by
  unfold output44
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked44 : gridTreeUnionCheck 32768 raw44 output44 cover44 source44 tree44 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked44, coverChecked44, treeChecked44, treeLeaves44⟩

theorem areaUnits44 : gridUnionAreaUnits output44 = 262144 := by decide +kernel

noncomputable def phaseMass44 : ℝ := singlePhaseMass (20837145/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw44 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass44_eq : phaseMass44 = (4167429/327680000000 : ℝ) := by
  unfold phaseMass44
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw44 output44 cover44 source44
    (gridTreeUnionCheck_sound 32768 raw44 output44 cover44 source44 tree44 checked44)
    _ (by norm_num) _, areaUnits44]
  norm_num

-- Frozen phase 2541, atom 6359, type 1, source (20,39).
def leavesData45 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves45 : Fin 4 → DyadicLeaf := leavesData45.get
def raw45 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 20 39 leaves45 i
def outputData45 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨5120,5248,9984,10112⟩) (.single ⟨5120,5248,10112,10240⟩)) (.node (.single ⟨5248,5376,9984,10112⟩) (.single ⟨5248,5376,10112,10240⟩))) (.node (.node (.single ⟨9984,10112,5120,5248⟩) (.single ⟨9984,10112,5248,5376⟩)) (.node (.single ⟨10112,10240,5120,5248⟩) (.single ⟨10112,10240,5248,5376⟩)))) (.node (.node (.node (.single ⟨22528,22656,27392,27520⟩) (.single ⟨22528,22656,27520,27648⟩)) (.node (.single ⟨22656,22784,27392,27520⟩) (.single ⟨22656,22784,27520,27648⟩))) (.node (.node (.single ⟨27392,27520,22528,22656⟩) (.single ⟨27392,27520,22656,22784⟩)) (.node (.single ⟨27520,27648,22528,22656⟩) (.single ⟨27520,27648,22656,22784⟩)))))
def output45 : Fin 16 → GridBox := outputData45.get
def coverData45 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData45 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover45 (i : Fin 16) : Fin 16 := ⟨coverData45.get i % 16, Nat.mod_lt _ (by decide)⟩
def source45 (i : Fin 16) : Fin 16 := ⟨sourceData45.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree45 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 (.cutY 10240 (.cutX 5120 .empty (.cutY 9216 .empty (.cutX 5632 (.cutY 9728 .empty (.cutX 5376 (.cutY 9984 .empty (.cutX 5248 (.cutY 10112 .full .full) (.cutY 10112 .full .full))) .empty)) .empty))) .empty) .empty) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 (.cutY 6144 (.cutX 9216 .empty (.cutY 5120 .empty (.cutX 9728 .empty (.cutY 5632 (.cutX 9984 .empty (.cutY 5376 (.cutX 10112 (.cutY 5248 .full .full) (.cutY 5248 .full .full)) .empty)) .empty)))) .empty) .empty)) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 .empty (.cutY 26624 .empty (.cutX 23552 (.cutY 27648 (.cutX 23040 (.cutY 27136 .empty (.cutX 22784 (.cutY 27392 .empty (.cutX 22656 (.cutY 27520 .full .full) (.cutY 27520 .full .full))) .empty)) .empty) .empty) .empty))) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 .empty (.cutY 22528 .empty (.cutX 27648 (.cutY 23552 (.cutX 27136 .empty (.cutY 23040 (.cutX 27392 .empty (.cutY 22784 (.cutX 27520 (.cutY 22656 .full .full) (.cutY 22656 .full .full)) .empty)) .empty)) .empty) .empty)))) .empty) .empty))))

theorem metadata45 : 0<161185172 ∧ 20<128 ∧ 39<128 ∧ 1<4 ∧
    6359/4160=1 ∧ 6359%4160=2199 ∧ ∀ i, (leaves45 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData45).mp
    (by decide +kernel)

theorem sourceChecked45_0 : ∀ i : Fin 16,
    (fun i => output45 i = raw45 (source45 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked45 : ∀ i : Fin 16, (fun i => output45 i = raw45 (source45 i)) i :=
  forallFin_of_zero_offset (fun i => output45 i = raw45 (source45 i)) sourceChecked45_0

theorem coverChecked45_0 : ∀ i : Fin 16,
    (fun i => (output45 (cover45 i)).ContainsBox (raw45 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked45 : ∀ i : Fin 16, (fun i => (output45 (cover45 i)).ContainsBox (raw45 i)) i :=
  forallFin_of_zero_offset (fun i => (output45 (cover45 i)).ContainsBox (raw45 i)) coverChecked45_0

theorem treeChecked45 : tree45.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves45 : List.ofFn output45 = tree45.leaves ⟨0,32768,0,32768⟩ := by
  unfold output45
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked45 : gridTreeUnionCheck 32768 raw45 output45 cover45 source45 tree45 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked45, coverChecked45, treeChecked45, treeLeaves45⟩

theorem areaUnits45 : gridUnionAreaUnits output45 = 262144 := by decide +kernel

noncomputable def phaseMass45 : ℝ := singlePhaseMass (161185172/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw45 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass45_eq : phaseMass45 = (40296293/409600000000 : ℝ) := by
  unfold phaseMass45
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw45 output45 cover45 source45
    (gridTreeUnionCheck_sound 32768 raw45 output45 cover45 source45 tree45 checked45)
    _ (by norm_num) _, areaUnits45]
  norm_num

-- Frozen phase 2542, atom 6856, type 1, source (26,44).
def leavesData46 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves46 : Fin 4 → DyadicLeaf := leavesData46.get
def raw46 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 26 44 leaves46 i
def outputData46 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨6656,6784,11264,11392⟩) (.single ⟨6656,6784,11392,11520⟩)) (.node (.single ⟨6784,6912,11264,11392⟩) (.single ⟨6784,6912,11392,11520⟩))) (.node (.node (.single ⟨11264,11392,6656,6784⟩) (.single ⟨11264,11392,6784,6912⟩)) (.node (.single ⟨11392,11520,6656,6784⟩) (.single ⟨11392,11520,6784,6912⟩)))) (.node (.node (.node (.single ⟨21248,21376,25856,25984⟩) (.single ⟨21248,21376,25984,26112⟩)) (.node (.single ⟨21376,21504,25856,25984⟩) (.single ⟨21376,21504,25984,26112⟩))) (.node (.node (.single ⟨25856,25984,21248,21376⟩) (.single ⟨25856,25984,21376,21504⟩)) (.node (.single ⟨25984,26112,21248,21376⟩) (.single ⟨25984,26112,21376,21504⟩)))))
def output46 : Fin 16 → GridBox := outputData46.get
def coverData46 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData46 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover46 (i : Fin 16) : Fin 16 := ⟨coverData46.get i % 16, Nat.mod_lt _ (by decide)⟩
def source46 (i : Fin 16) : Fin 16 := ⟨sourceData46.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree46 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 .empty (.cutY 10240 .empty (.cutX 7168 (.cutY 11264 .empty (.cutX 6656 .empty (.cutY 11776 (.cutX 6912 (.cutY 11520 (.cutX 6784 (.cutY 11392 .full .full) (.cutY 11392 .full .full)) .empty) .empty) .empty))) .empty))) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 .empty (.cutY 6144 .empty (.cutX 11264 .empty (.cutY 7168 (.cutX 11776 (.cutY 6656 .empty (.cutX 11520 (.cutY 6912 (.cutX 11392 (.cutY 6784 .full .full) (.cutY 6784 .full .full)) .empty) .empty)) .empty) .empty))))) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 (.cutY 26624 (.cutX 21504 (.cutY 25600 .empty (.cutX 20992 .empty (.cutY 26112 (.cutX 21248 .empty (.cutY 25856 .empty (.cutX 21376 (.cutY 25984 .full .full) (.cutY 25984 .full .full)))) .empty))) .empty) .empty) .empty) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 (.cutY 22528 (.cutX 25600 .empty (.cutY 21504 (.cutX 26112 (.cutY 20992 .empty (.cutX 25856 .empty (.cutY 21248 .empty (.cutX 25984 (.cutY 21376 .full .full) (.cutY 21376 .full .full))))) .empty) .empty)) .empty) .empty)) .empty) .empty))))

theorem metadata46 : 0<130629080 ∧ 26<128 ∧ 44<128 ∧ 1<4 ∧
    6856/4160=1 ∧ 6856%4160=2696 ∧ ∀ i, (leaves46 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData46).mp
    (by decide +kernel)

theorem sourceChecked46_0 : ∀ i : Fin 16,
    (fun i => output46 i = raw46 (source46 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked46 : ∀ i : Fin 16, (fun i => output46 i = raw46 (source46 i)) i :=
  forallFin_of_zero_offset (fun i => output46 i = raw46 (source46 i)) sourceChecked46_0

theorem coverChecked46_0 : ∀ i : Fin 16,
    (fun i => (output46 (cover46 i)).ContainsBox (raw46 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked46 : ∀ i : Fin 16, (fun i => (output46 (cover46 i)).ContainsBox (raw46 i)) i :=
  forallFin_of_zero_offset (fun i => (output46 (cover46 i)).ContainsBox (raw46 i)) coverChecked46_0

theorem treeChecked46 : tree46.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves46 : List.ofFn output46 = tree46.leaves ⟨0,32768,0,32768⟩ := by
  unfold output46
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked46 : gridTreeUnionCheck 32768 raw46 output46 cover46 source46 tree46 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked46, coverChecked46, treeChecked46, treeLeaves46⟩

theorem areaUnits46 : gridUnionAreaUnits output46 = 262144 := by decide +kernel

noncomputable def phaseMass46 : ℝ := singlePhaseMass (130629080/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw46 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass46_eq : phaseMass46 = (3265727/40960000000 : ℝ) := by
  unfold phaseMass46
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw46 output46 cover46 source46
    (gridTreeUnionCheck_sound 32768 raw46 output46 cover46 source46 tree46 checked46)
    _ (by norm_num) _, areaUnits46]
  norm_num

-- Frozen phase 2543, atom 2113, type 0, source (19,42).
def leavesData47 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves47 : Fin 1 → DyadicLeaf := leavesData47.get
def raw47 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 19 42 leaves47 i
def outputData47 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨4864,5120,10752,11008⟩) (.single ⟨10752,11008,4864,5120⟩)) (.node (.single ⟨21760,22016,27648,27904⟩) (.single ⟨27648,27904,21760,22016⟩)))
def output47 : Fin 4 → GridBox := outputData47.get
def coverData47 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData47 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover47 (i : Fin 4) : Fin 4 := ⟨coverData47.get i % 4, Nat.mod_lt _ (by decide)⟩
def source47 (i : Fin 4) : Fin 4 := ⟨sourceData47.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree47 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 (.cutY 10240 .empty (.cutX 5120 (.cutY 11264 (.cutX 4608 .empty (.cutY 10752 .empty (.cutX 4864 .empty (.cutY 11008 .full .empty)))) .empty) .empty)) .empty) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 .empty (.cutY 6144 (.cutX 11264 (.cutY 5120 (.cutX 10752 .empty (.cutY 4608 .empty (.cutX 11008 (.cutY 4864 .empty .full) .empty))) .empty) .empty) .empty))) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 (.cutY 26624 .empty (.cutX 21504 .empty (.cutY 27648 .empty (.cutX 22016 (.cutY 28160 (.cutX 21760 .empty (.cutY 27904 .full .empty)) .empty) .empty)))) .empty) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 .empty (.cutY 22528 (.cutX 27648 .empty (.cutY 21504 .empty (.cutX 28160 (.cutY 22016 (.cutX 27904 (.cutY 21760 .empty .full) .empty) .empty) .empty))) .empty))) .empty) .empty))))

theorem metadata47 : 0<73667111 ∧ 19<128 ∧ 42<128 ∧ 0<4 ∧
    2113/4160=0 ∧ 2113%4160=2113 ∧ ∀ i, (leaves47 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData47).mp
    (by decide +kernel)

theorem sourceChecked47_0 : ∀ i : Fin 4,
    (fun i => output47 i = raw47 (source47 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked47 : ∀ i : Fin 4, (fun i => output47 i = raw47 (source47 i)) i :=
  forallFin_of_zero_offset (fun i => output47 i = raw47 (source47 i)) sourceChecked47_0

theorem coverChecked47_0 : ∀ i : Fin 4,
    (fun i => (output47 (cover47 i)).ContainsBox (raw47 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked47 : ∀ i : Fin 4, (fun i => (output47 (cover47 i)).ContainsBox (raw47 i)) i :=
  forallFin_of_zero_offset (fun i => (output47 (cover47 i)).ContainsBox (raw47 i)) coverChecked47_0

theorem treeChecked47 : tree47.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves47 : List.ofFn output47 = tree47.leaves ⟨0,32768,0,32768⟩ := by
  unfold output47
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked47 : gridTreeUnionCheck 32768 raw47 output47 cover47 source47 tree47 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked47, coverChecked47, treeChecked47, treeLeaves47⟩

theorem areaUnits47 : gridUnionAreaUnits output47 = 262144 := by decide +kernel

noncomputable def phaseMass47 : ℝ := singlePhaseMass (73667111/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw47 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass47_eq : phaseMass47 = (73667111/1638400000000 : ℝ) := by
  unfold phaseMass47
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw47 output47 cover47 source47
    (gridTreeUnionCheck_sound 32768 raw47 output47 cover47 source47 tree47 checked47)
    _ (by norm_num) _, areaUnits47]
  norm_num

-- Frozen phase 2544, atom 1430, type 0, source (12,38).
def leavesData48 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves48 : Fin 1 → DyadicLeaf := leavesData48.get
def raw48 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 12 38 leaves48 i
def outputData48 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨3072,3328,9728,9984⟩) (.single ⟨9728,9984,3072,3328⟩)) (.node (.single ⟨22784,23040,29440,29696⟩) (.single ⟨29440,29696,22784,23040⟩)))
def output48 : Fin 4 → GridBox := outputData48.get
def coverData48 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData48 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover48 (i : Fin 4) : Fin 4 := ⟨coverData48.get i % 4, Nat.mod_lt _ (by decide)⟩
def source48 (i : Fin 4) : Fin 4 := ⟨sourceData48.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree48 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 .empty (.cutY 10240 (.cutX 3072 .empty (.cutY 9216 .empty (.cutX 3584 (.cutY 9728 .empty (.cutX 3328 (.cutY 9984 .full .empty) .empty)) .empty))) .empty)) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 .empty (.cutX 9216 .empty (.cutY 3072 .empty (.cutX 9728 .empty (.cutY 3584 (.cutX 9984 (.cutY 3328 .full .empty) .empty) .empty))))) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 (.cutX 23552 (.cutY 29696 (.cutX 23040 (.cutY 29184 .empty (.cutX 22784 .empty (.cutY 29440 .empty .full))) .empty) .empty) .empty) .empty))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 (.cutY 22528 .empty (.cutX 29696 (.cutY 23552 (.cutX 29184 .empty (.cutY 23040 (.cutX 29440 .empty (.cutY 22784 .empty .full)) .empty)) .empty) .empty)) .empty))) .empty))))

theorem metadata48 : 0<290391823 ∧ 12<128 ∧ 38<128 ∧ 0<4 ∧
    1430/4160=0 ∧ 1430%4160=1430 ∧ ∀ i, (leaves48 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData48).mp
    (by decide +kernel)

theorem sourceChecked48_0 : ∀ i : Fin 4,
    (fun i => output48 i = raw48 (source48 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked48 : ∀ i : Fin 4, (fun i => output48 i = raw48 (source48 i)) i :=
  forallFin_of_zero_offset (fun i => output48 i = raw48 (source48 i)) sourceChecked48_0

theorem coverChecked48_0 : ∀ i : Fin 4,
    (fun i => (output48 (cover48 i)).ContainsBox (raw48 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked48 : ∀ i : Fin 4, (fun i => (output48 (cover48 i)).ContainsBox (raw48 i)) i :=
  forallFin_of_zero_offset (fun i => (output48 (cover48 i)).ContainsBox (raw48 i)) coverChecked48_0

theorem treeChecked48 : tree48.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves48 : List.ofFn output48 = tree48.leaves ⟨0,32768,0,32768⟩ := by
  unfold output48
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked48 : gridTreeUnionCheck 32768 raw48 output48 cover48 source48 tree48 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked48, coverChecked48, treeChecked48, treeLeaves48⟩

theorem areaUnits48 : gridUnionAreaUnits output48 = 262144 := by decide +kernel

noncomputable def phaseMass48 : ℝ := singlePhaseMass (290391823/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw48 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass48_eq : phaseMass48 = (290391823/1638400000000 : ℝ) := by
  unfold phaseMass48
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw48 output48 cover48 source48
    (gridTreeUnionCheck_sound 32768 raw48 output48 cover48 source48 tree48 checked48)
    _ (by norm_num) _, areaUnits48]
  norm_num

-- Frozen phase 2545, atom 5891, type 1, source (15,36).
def leavesData49 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves49 : Fin 4 → DyadicLeaf := leavesData49.get
def raw49 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 15 36 leaves49 i
def outputData49 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨3840,3968,9216,9344⟩) (.single ⟨3840,3968,9344,9472⟩)) (.node (.single ⟨3968,4096,9216,9344⟩) (.single ⟨3968,4096,9344,9472⟩))) (.node (.node (.single ⟨9216,9344,3840,3968⟩) (.single ⟨9216,9344,3968,4096⟩)) (.node (.single ⟨9344,9472,3840,3968⟩) (.single ⟨9344,9472,3968,4096⟩)))) (.node (.node (.node (.single ⟨23296,23424,28672,28800⟩) (.single ⟨23296,23424,28800,28928⟩)) (.node (.single ⟨23424,23552,28672,28800⟩) (.single ⟨23424,23552,28800,28928⟩))) (.node (.node (.single ⟨28672,28800,23296,23424⟩) (.single ⟨28672,28800,23424,23552⟩)) (.node (.single ⟨28800,28928,23296,23424⟩) (.single ⟨28800,28928,23424,23552⟩)))))
def output49 : Fin 16 → GridBox := outputData49.get
def coverData49 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData49 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover49 (i : Fin 16) : Fin 16 := ⟨coverData49.get i % 16, Nat.mod_lt _ (by decide)⟩
def source49 (i : Fin 16) : Fin 16 := ⟨sourceData49.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree49 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 .empty (.cutY 10240 (.cutX 3072 .empty (.cutY 9216 .empty (.cutX 3584 .empty (.cutY 9728 (.cutX 3840 .empty (.cutY 9472 (.cutX 3968 (.cutY 9344 .full .full) (.cutY 9344 .full .full)) .empty)) .empty)))) .empty)) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 .empty (.cutX 9216 .empty (.cutY 3072 .empty (.cutX 9728 (.cutY 3584 .empty (.cutX 9472 (.cutY 3840 .empty (.cutX 9344 (.cutY 3968 .full .full) (.cutY 3968 .full .full))) .empty)) .empty)))) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 (.cutX 23552 (.cutY 29696 (.cutX 23040 .empty (.cutY 29184 (.cutX 23296 .empty (.cutY 28928 (.cutX 23424 (.cutY 28800 .full .full) (.cutY 28800 .full .full)) .empty)) .empty)) .empty) .empty) .empty))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 (.cutY 22528 .empty (.cutX 29696 (.cutY 23552 (.cutX 29184 (.cutY 23040 .empty (.cutX 28928 (.cutY 23296 .empty (.cutX 28800 (.cutY 23424 .full .full) (.cutY 23424 .full .full))) .empty)) .empty) .empty) .empty)) .empty))) .empty))))

theorem metadata49 : 0<190129790 ∧ 15<128 ∧ 36<128 ∧ 1<4 ∧
    5891/4160=1 ∧ 5891%4160=1731 ∧ ∀ i, (leaves49 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData49).mp
    (by decide +kernel)

theorem sourceChecked49_0 : ∀ i : Fin 16,
    (fun i => output49 i = raw49 (source49 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked49 : ∀ i : Fin 16, (fun i => output49 i = raw49 (source49 i)) i :=
  forallFin_of_zero_offset (fun i => output49 i = raw49 (source49 i)) sourceChecked49_0

theorem coverChecked49_0 : ∀ i : Fin 16,
    (fun i => (output49 (cover49 i)).ContainsBox (raw49 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked49 : ∀ i : Fin 16, (fun i => (output49 (cover49 i)).ContainsBox (raw49 i)) i :=
  forallFin_of_zero_offset (fun i => (output49 (cover49 i)).ContainsBox (raw49 i)) coverChecked49_0

theorem treeChecked49 : tree49.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves49 : List.ofFn output49 = tree49.leaves ⟨0,32768,0,32768⟩ := by
  unfold output49
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked49 : gridTreeUnionCheck 32768 raw49 output49 cover49 source49 tree49 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked49, coverChecked49, treeChecked49, treeLeaves49⟩

theorem areaUnits49 : gridUnionAreaUnits output49 = 262144 := by decide +kernel

noncomputable def phaseMass49 : ℝ := singlePhaseMass (190129790/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw49 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass49_eq : phaseMass49 = (19012979/163840000000 : ℝ) := by
  unfold phaseMass49
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw49 output49 cover49 source49
    (gridTreeUnionCheck_sound 32768 raw49 output49 cover49 source49 tree49 checked49)
    _ (by norm_num) _, areaUnits49]
  norm_num

-- Frozen phase 2546, atom 5690, type 1, source (13,35).
def leavesData50 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves50 : Fin 4 → DyadicLeaf := leavesData50.get
def raw50 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 13 35 leaves50 i
def outputData50 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨3328,3456,8960,9088⟩) (.single ⟨3328,3456,9088,9216⟩)) (.node (.single ⟨3456,3584,8960,9088⟩) (.single ⟨3456,3584,9088,9216⟩))) (.node (.node (.single ⟨8960,9088,3328,3456⟩) (.single ⟨8960,9088,3456,3584⟩)) (.node (.single ⟨9088,9216,3328,3456⟩) (.single ⟨9088,9216,3456,3584⟩)))) (.node (.node (.node (.single ⟨23552,23680,29184,29312⟩) (.single ⟨23552,23680,29312,29440⟩)) (.node (.single ⟨23680,23808,29184,29312⟩) (.single ⟨23680,23808,29312,29440⟩))) (.node (.node (.single ⟨29184,29312,23552,23680⟩) (.single ⟨29184,29312,23680,23808⟩)) (.node (.single ⟨29312,29440,23552,23680⟩) (.single ⟨29312,29440,23680,23808⟩)))))
def output50 : Fin 16 → GridBox := outputData50.get
def coverData50 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData50 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover50 (i : Fin 16) : Fin 16 := ⟨coverData50.get i % 16, Nat.mod_lt _ (by decide)⟩
def source50 (i : Fin 16) : Fin 16 := ⟨sourceData50.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree50 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 .empty (.cutY 10240 (.cutX 3072 .empty (.cutY 9216 (.cutX 3584 (.cutY 8704 .empty (.cutX 3328 .empty (.cutY 8960 .empty (.cutX 3456 (.cutY 9088 .full .full) (.cutY 9088 .full .full))))) .empty) .empty)) .empty)) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 .empty (.cutX 9216 (.cutY 3072 .empty (.cutX 8704 .empty (.cutY 3584 (.cutX 8960 .empty (.cutY 3328 .empty (.cutX 9088 (.cutY 3456 .full .full) (.cutY 3456 .full .full)))) .empty))) .empty)) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 (.cutX 23552 .empty (.cutY 29696 (.cutX 24064 (.cutY 29184 .empty (.cutX 23808 (.cutY 29440 (.cutX 23680 (.cutY 29312 .full .full) (.cutY 29312 .full .full)) .empty) .empty)) .empty) .empty)) .empty))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 (.cutY 22528 .empty (.cutX 29696 (.cutY 23552 .empty (.cutX 29184 .empty (.cutY 24064 (.cutX 29440 (.cutY 23808 (.cutX 29312 (.cutY 23680 .full .full) (.cutY 23680 .full .full)) .empty) .empty) .empty))) .empty)) .empty))) .empty))))

theorem metadata50 : 0<190129790 ∧ 13<128 ∧ 35<128 ∧ 1<4 ∧
    5690/4160=1 ∧ 5690%4160=1530 ∧ ∀ i, (leaves50 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData50).mp
    (by decide +kernel)

theorem sourceChecked50_0 : ∀ i : Fin 16,
    (fun i => output50 i = raw50 (source50 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked50 : ∀ i : Fin 16, (fun i => output50 i = raw50 (source50 i)) i :=
  forallFin_of_zero_offset (fun i => output50 i = raw50 (source50 i)) sourceChecked50_0

theorem coverChecked50_0 : ∀ i : Fin 16,
    (fun i => (output50 (cover50 i)).ContainsBox (raw50 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked50 : ∀ i : Fin 16, (fun i => (output50 (cover50 i)).ContainsBox (raw50 i)) i :=
  forallFin_of_zero_offset (fun i => (output50 (cover50 i)).ContainsBox (raw50 i)) coverChecked50_0

theorem treeChecked50 : tree50.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves50 : List.ofFn output50 = tree50.leaves ⟨0,32768,0,32768⟩ := by
  unfold output50
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked50 : gridTreeUnionCheck 32768 raw50 output50 cover50 source50 tree50 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked50, coverChecked50, treeChecked50, treeLeaves50⟩

theorem areaUnits50 : gridUnionAreaUnits output50 = 262144 := by decide +kernel

noncomputable def phaseMass50 : ℝ := singlePhaseMass (190129790/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw50 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass50_eq : phaseMass50 = (19012979/163840000000 : ℝ) := by
  unfold phaseMass50
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw50 output50 cover50 source50
    (gridTreeUnionCheck_sound 32768 raw50 output50 cover50 source50 tree50 checked50)
    _ (by norm_num) _, areaUnits50]
  norm_num

-- Frozen phase 2547, atom 5481, type 1, source (11,34).
def leavesData51 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves51 : Fin 4 → DyadicLeaf := leavesData51.get
def raw51 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 11 34 leaves51 i
def outputData51 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨2816,2944,8704,8832⟩) (.single ⟨2816,2944,8832,8960⟩)) (.node (.single ⟨2944,3072,8704,8832⟩) (.single ⟨2944,3072,8832,8960⟩))) (.node (.node (.single ⟨8704,8832,2816,2944⟩) (.single ⟨8704,8832,2944,3072⟩)) (.node (.single ⟨8832,8960,2816,2944⟩) (.single ⟨8832,8960,2944,3072⟩)))) (.node (.node (.node (.single ⟨23808,23936,29696,29824⟩) (.single ⟨23808,23936,29824,29952⟩)) (.node (.single ⟨23936,24064,29696,29824⟩) (.single ⟨23936,24064,29824,29952⟩))) (.node (.node (.single ⟨29696,29824,23808,23936⟩) (.single ⟨29696,29824,23936,24064⟩)) (.node (.single ⟨29824,29952,23808,23936⟩) (.single ⟨29824,29952,23936,24064⟩)))))
def output51 : Fin 16 → GridBox := outputData51.get
def coverData51 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData51 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover51 (i : Fin 16) : Fin 16 := ⟨coverData51.get i % 16, Nat.mod_lt _ (by decide)⟩
def source51 (i : Fin 16) : Fin 16 := ⟨sourceData51.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree51 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 .empty (.cutY 10240 (.cutX 3072 (.cutY 9216 (.cutX 2560 .empty (.cutY 8704 .empty (.cutX 2816 .empty (.cutY 8960 (.cutX 2944 (.cutY 8832 .full .full) (.cutY 8832 .full .full)) .empty)))) .empty) .empty) .empty)) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 .empty (.cutX 9216 (.cutY 3072 (.cutX 8704 .empty (.cutY 2560 .empty (.cutX 8960 (.cutY 2816 .empty (.cutX 8832 (.cutY 2944 .full .full) (.cutY 2944 .full .full))) .empty))) .empty) .empty)) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 (.cutX 23552 .empty (.cutY 29696 .empty (.cutX 24064 (.cutY 30208 (.cutX 23808 .empty (.cutY 29952 (.cutX 23936 (.cutY 29824 .full .full) (.cutY 29824 .full .full)) .empty)) .empty) .empty))) .empty))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 (.cutY 22528 .empty (.cutX 29696 .empty (.cutY 23552 .empty (.cutX 30208 (.cutY 24064 (.cutX 29952 (.cutY 23808 .empty (.cutX 29824 (.cutY 23936 .full .full) (.cutY 23936 .full .full))) .empty) .empty) .empty)))) .empty))) .empty))))

theorem metadata51 : 0<190129790 ∧ 11<128 ∧ 34<128 ∧ 1<4 ∧
    5481/4160=1 ∧ 5481%4160=1321 ∧ ∀ i, (leaves51 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData51).mp
    (by decide +kernel)

theorem sourceChecked51_0 : ∀ i : Fin 16,
    (fun i => output51 i = raw51 (source51 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked51 : ∀ i : Fin 16, (fun i => output51 i = raw51 (source51 i)) i :=
  forallFin_of_zero_offset (fun i => output51 i = raw51 (source51 i)) sourceChecked51_0

theorem coverChecked51_0 : ∀ i : Fin 16,
    (fun i => (output51 (cover51 i)).ContainsBox (raw51 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked51 : ∀ i : Fin 16, (fun i => (output51 (cover51 i)).ContainsBox (raw51 i)) i :=
  forallFin_of_zero_offset (fun i => (output51 (cover51 i)).ContainsBox (raw51 i)) coverChecked51_0

theorem treeChecked51 : tree51.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves51 : List.ofFn output51 = tree51.leaves ⟨0,32768,0,32768⟩ := by
  unfold output51
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked51 : gridTreeUnionCheck 32768 raw51 output51 cover51 source51 tree51 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked51, coverChecked51, treeChecked51, treeLeaves51⟩

theorem areaUnits51 : gridUnionAreaUnits output51 = 262144 := by decide +kernel

noncomputable def phaseMass51 : ℝ := singlePhaseMass (190129790/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw51 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass51_eq : phaseMass51 = (19012979/163840000000 : ℝ) := by
  unfold phaseMass51
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw51 output51 cover51 source51
    (gridTreeUnionCheck_sound 32768 raw51 output51 cover51 source51 tree51 checked51)
    _ (by norm_num) _, areaUnits51]
  norm_num

-- Frozen phase 2548, atom 4190, type 1, source (0,30).
def leavesData52 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves52 : Fin 1 → DyadicLeaf := leavesData52.get
def raw52 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 0 30 leaves52 i
def outputData52 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨0,256,7680,7936⟩) (.single ⟨7680,7936,0,256⟩)) (.node (.single ⟨24832,25088,32512,32768⟩) (.single ⟨32512,32768,24832,25088⟩)))
def output52 : Fin 4 → GridBox := outputData52.get
def coverData52 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData52 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover52 (i : Fin 4) : Fin 4 := ⟨coverData52.get i % 4, Nat.mod_lt _ (by decide)⟩
def source52 (i : Fin 4) : Fin 4 := ⟨sourceData52.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree52 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 (.cutY 4096 .empty (.cutX 2048 (.cutY 6144 .empty (.cutX 1024 (.cutY 7168 .empty (.cutX 512 (.cutY 7680 .empty (.cutX 256 (.cutY 7936 .full .empty) .empty)) .empty)) .empty)) .empty)) (.cutY 4096 (.cutX 6144 .empty (.cutY 2048 (.cutX 7168 .empty (.cutY 1024 (.cutX 7680 .empty (.cutY 512 (.cutX 7936 (.cutY 256 .full .empty) .empty) .empty)) .empty)) .empty)) .empty)) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 .empty (.cutX 26624 (.cutY 30720 .empty (.cutX 25600 (.cutY 31744 .empty (.cutX 25088 (.cutY 32256 .empty (.cutX 24832 .empty (.cutY 32512 .empty .full))) .empty)) .empty)) .empty)) (.cutY 28672 (.cutX 30720 .empty (.cutY 26624 (.cutX 31744 .empty (.cutY 25600 (.cutX 32256 .empty (.cutY 25088 (.cutX 32512 .empty (.cutY 24832 .empty .full)) .empty)) .empty)) .empty)) .empty))))))

theorem metadata52 : 0<568444819 ∧ 0<128 ∧ 30<128 ∧ 1<4 ∧
    4190/4160=1 ∧ 4190%4160=30 ∧ ∀ i, (leaves52 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData52).mp
    (by decide +kernel)

theorem sourceChecked52_0 : ∀ i : Fin 4,
    (fun i => output52 i = raw52 (source52 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked52 : ∀ i : Fin 4, (fun i => output52 i = raw52 (source52 i)) i :=
  forallFin_of_zero_offset (fun i => output52 i = raw52 (source52 i)) sourceChecked52_0

theorem coverChecked52_0 : ∀ i : Fin 4,
    (fun i => (output52 (cover52 i)).ContainsBox (raw52 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked52 : ∀ i : Fin 4, (fun i => (output52 (cover52 i)).ContainsBox (raw52 i)) i :=
  forallFin_of_zero_offset (fun i => (output52 (cover52 i)).ContainsBox (raw52 i)) coverChecked52_0

theorem treeChecked52 : tree52.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves52 : List.ofFn output52 = tree52.leaves ⟨0,32768,0,32768⟩ := by
  unfold output52
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked52 : gridTreeUnionCheck 32768 raw52 output52 cover52 source52 tree52 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked52, coverChecked52, treeChecked52, treeLeaves52⟩

theorem areaUnits52 : gridUnionAreaUnits output52 = 262144 := by decide +kernel

noncomputable def phaseMass52 : ℝ := singlePhaseMass (568444819/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw52 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass52_eq : phaseMass52 = (568444819/1638400000000 : ℝ) := by
  unfold phaseMass52
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw52 output52 cover52 source52
    (gridTreeUnionCheck_sound 32768 raw52 output52 cover52 source52 tree52 checked52)
    _ (by norm_num) _, areaUnits52]
  norm_num

-- Frozen phase 2549, atom 4567, type 1, source (3,32).
def leavesData53 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves53 : Fin 1 → DyadicLeaf := leavesData53.get
def raw53 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 3 32 leaves53 i
def outputData53 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨768,1024,8192,8448⟩) (.single ⟨8192,8448,768,1024⟩)) (.node (.single ⟨24320,24576,31744,32000⟩) (.single ⟨31744,32000,24320,24576⟩)))
def output53 : Fin 4 → GridBox := outputData53.get
def coverData53 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData53 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover53 (i : Fin 4) : Fin 4 := ⟨coverData53.get i % 4, Nat.mod_lt _ (by decide)⟩
def source53 (i : Fin 4) : Fin 4 := ⟨sourceData53.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree53 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 (.cutY 10240 (.cutX 1024 (.cutY 9216 (.cutX 512 .empty (.cutY 8704 (.cutX 768 .empty (.cutY 8448 .full .empty)) .empty)) .empty) .empty) .empty) .empty) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 (.cutX 9216 (.cutY 1024 (.cutX 8704 (.cutY 512 .empty (.cutX 8448 (.cutY 768 .empty .full) .empty)) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 .empty (.cutX 23552 .empty (.cutY 31744 .empty (.cutX 24064 .empty (.cutY 32256 (.cutX 24320 .empty (.cutY 32000 .full .empty)) .empty))))))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 .empty (.cutY 22528 .empty (.cutX 31744 .empty (.cutY 23552 .empty (.cutX 32256 (.cutY 24064 .empty (.cutX 32000 (.cutY 24320 .empty .full) .empty)) .empty))))))) .empty))))

theorem metadata53 : 0<475523442 ∧ 3<128 ∧ 32<128 ∧ 1<4 ∧
    4567/4160=1 ∧ 4567%4160=407 ∧ ∀ i, (leaves53 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData53).mp
    (by decide +kernel)

theorem sourceChecked53_0 : ∀ i : Fin 4,
    (fun i => output53 i = raw53 (source53 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked53 : ∀ i : Fin 4, (fun i => output53 i = raw53 (source53 i)) i :=
  forallFin_of_zero_offset (fun i => output53 i = raw53 (source53 i)) sourceChecked53_0

theorem coverChecked53_0 : ∀ i : Fin 4,
    (fun i => (output53 (cover53 i)).ContainsBox (raw53 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked53 : ∀ i : Fin 4, (fun i => (output53 (cover53 i)).ContainsBox (raw53 i)) i :=
  forallFin_of_zero_offset (fun i => (output53 (cover53 i)).ContainsBox (raw53 i)) coverChecked53_0

theorem treeChecked53 : tree53.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves53 : List.ofFn output53 = tree53.leaves ⟨0,32768,0,32768⟩ := by
  unfold output53
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked53 : gridTreeUnionCheck 32768 raw53 output53 cover53 source53 tree53 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked53, coverChecked53, treeChecked53, treeLeaves53⟩

theorem areaUnits53 : gridUnionAreaUnits output53 = 262144 := by decide +kernel

noncomputable def phaseMass53 : ℝ := singlePhaseMass (475523442/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw53 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass53_eq : phaseMass53 = (237761721/819200000000 : ℝ) := by
  unfold phaseMass53
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw53 output53 cover53 source53
    (gridTreeUnionCheck_sound 32768 raw53 output53 cover53 source53 tree53 checked53)
    _ (by norm_num) _, areaUnits53]
  norm_num

-- Frozen phase 2550, atom 4318, type 1, source (1,31).
def leavesData54 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves54 : Fin 1 → DyadicLeaf := leavesData54.get
def raw54 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 1 31 leaves54 i
def outputData54 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨256,512,7936,8192⟩) (.single ⟨7936,8192,256,512⟩)) (.node (.single ⟨24576,24832,32256,32512⟩) (.single ⟨32256,32512,24576,24832⟩)))
def output54 : Fin 4 → GridBox := outputData54.get
def coverData54 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData54 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover54 (i : Fin 4) : Fin 4 := ⟨coverData54.get i % 4, Nat.mod_lt _ (by decide)⟩
def source54 (i : Fin 4) : Fin 4 := ⟨sourceData54.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree54 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 (.cutY 4096 .empty (.cutX 2048 (.cutY 6144 .empty (.cutX 1024 (.cutY 7168 .empty (.cutX 512 (.cutY 7680 .empty (.cutX 256 .empty (.cutY 7936 .empty .full))) .empty)) .empty)) .empty)) (.cutY 4096 (.cutX 6144 .empty (.cutY 2048 (.cutX 7168 .empty (.cutY 1024 (.cutX 7680 .empty (.cutY 512 (.cutX 7936 .empty (.cutY 256 .empty .full)) .empty)) .empty)) .empty)) .empty)) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 .empty (.cutX 26624 (.cutY 30720 .empty (.cutX 25600 (.cutY 31744 .empty (.cutX 25088 (.cutY 32256 .empty (.cutX 24832 (.cutY 32512 .full .empty) .empty)) .empty)) .empty)) .empty)) (.cutY 28672 (.cutX 30720 .empty (.cutY 26624 (.cutX 31744 .empty (.cutY 25600 (.cutX 32256 .empty (.cutY 25088 (.cutX 32512 (.cutY 24832 .full .empty) .empty) .empty)) .empty)) .empty)) .empty))))))

theorem metadata54 : 0<568444819 ∧ 1<128 ∧ 31<128 ∧ 1<4 ∧
    4318/4160=1 ∧ 4318%4160=158 ∧ ∀ i, (leaves54 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData54).mp
    (by decide +kernel)

theorem sourceChecked54_0 : ∀ i : Fin 4,
    (fun i => output54 i = raw54 (source54 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked54 : ∀ i : Fin 4, (fun i => output54 i = raw54 (source54 i)) i :=
  forallFin_of_zero_offset (fun i => output54 i = raw54 (source54 i)) sourceChecked54_0

theorem coverChecked54_0 : ∀ i : Fin 4,
    (fun i => (output54 (cover54 i)).ContainsBox (raw54 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked54 : ∀ i : Fin 4, (fun i => (output54 (cover54 i)).ContainsBox (raw54 i)) i :=
  forallFin_of_zero_offset (fun i => (output54 (cover54 i)).ContainsBox (raw54 i)) coverChecked54_0

theorem treeChecked54 : tree54.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves54 : List.ofFn output54 = tree54.leaves ⟨0,32768,0,32768⟩ := by
  unfold output54
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked54 : gridTreeUnionCheck 32768 raw54 output54 cover54 source54 tree54 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked54, coverChecked54, treeChecked54, treeLeaves54⟩

theorem areaUnits54 : gridUnionAreaUnits output54 = 262144 := by decide +kernel

noncomputable def phaseMass54 : ℝ := singlePhaseMass (568444819/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw54 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass54_eq : phaseMass54 = (568444819/1638400000000 : ℝ) := by
  unfold phaseMass54
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw54 output54 cover54 source54
    (gridTreeUnionCheck_sound 32768 raw54 output54 cover54 source54 tree54 checked54)
    _ (by norm_num) _, areaUnits54]
  norm_num

-- Frozen phase 2551, atom 5040, type 1, source (7,33).
def leavesData55 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves55 : Fin 4 → DyadicLeaf := leavesData55.get
def raw55 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 7 33 leaves55 i
def outputData55 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨1792,1920,8448,8576⟩) (.single ⟨1792,1920,8576,8704⟩)) (.node (.single ⟨1920,2048,8448,8576⟩) (.single ⟨1920,2048,8576,8704⟩))) (.node (.node (.single ⟨8448,8576,1792,1920⟩) (.single ⟨8448,8576,1920,2048⟩)) (.node (.single ⟨8576,8704,1792,1920⟩) (.single ⟨8576,8704,1920,2048⟩)))) (.node (.node (.node (.single ⟨24064,24192,30720,30848⟩) (.single ⟨24064,24192,30848,30976⟩)) (.node (.single ⟨24192,24320,30720,30848⟩) (.single ⟨24192,24320,30848,30976⟩))) (.node (.node (.single ⟨30720,30848,24064,24192⟩) (.single ⟨30720,30848,24192,24320⟩)) (.node (.single ⟨30848,30976,24064,24192⟩) (.single ⟨30848,30976,24192,24320⟩)))))
def output55 : Fin 16 → GridBox := outputData55.get
def coverData55 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData55 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover55 (i : Fin 16) : Fin 16 := ⟨coverData55.get i % 16, Nat.mod_lt _ (by decide)⟩
def source55 (i : Fin 16) : Fin 16 := ⟨sourceData55.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree55 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 (.cutY 10240 (.cutX 1024 .empty (.cutY 9216 (.cutX 1536 .empty (.cutY 8704 (.cutX 1792 .empty (.cutY 8448 .empty (.cutX 1920 (.cutY 8576 .full .full) (.cutY 8576 .full .full)))) .empty)) .empty)) .empty) .empty) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 (.cutX 9216 (.cutY 1024 .empty (.cutX 8704 (.cutY 1536 .empty (.cutX 8448 .empty (.cutY 1792 .empty (.cutX 8576 (.cutY 1920 .full .full) (.cutY 1920 .full .full))))) .empty)) .empty) .empty) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 .empty (.cutX 23552 .empty (.cutY 31744 (.cutX 24064 .empty (.cutY 31232 (.cutX 24320 (.cutY 30976 (.cutX 24192 (.cutY 30848 .full .full) (.cutY 30848 .full .full)) .empty) .empty) .empty)) .empty))))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 .empty (.cutY 22528 .empty (.cutX 31744 (.cutY 23552 .empty (.cutX 31232 (.cutY 24064 .empty (.cutX 30976 (.cutY 24320 (.cutX 30848 (.cutY 24192 .full .full) (.cutY 24192 .full .full)) .empty) .empty)) .empty)) .empty))))) .empty))))

theorem metadata55 : 0<475523442 ∧ 7<128 ∧ 33<128 ∧ 1<4 ∧
    5040/4160=1 ∧ 5040%4160=880 ∧ ∀ i, (leaves55 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData55).mp
    (by decide +kernel)

theorem sourceChecked55_0 : ∀ i : Fin 16,
    (fun i => output55 i = raw55 (source55 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked55 : ∀ i : Fin 16, (fun i => output55 i = raw55 (source55 i)) i :=
  forallFin_of_zero_offset (fun i => output55 i = raw55 (source55 i)) sourceChecked55_0

theorem coverChecked55_0 : ∀ i : Fin 16,
    (fun i => (output55 (cover55 i)).ContainsBox (raw55 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked55 : ∀ i : Fin 16, (fun i => (output55 (cover55 i)).ContainsBox (raw55 i)) i :=
  forallFin_of_zero_offset (fun i => (output55 (cover55 i)).ContainsBox (raw55 i)) coverChecked55_0

theorem treeChecked55 : tree55.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves55 : List.ofFn output55 = tree55.leaves ⟨0,32768,0,32768⟩ := by
  unfold output55
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked55 : gridTreeUnionCheck 32768 raw55 output55 cover55 source55 tree55 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked55, coverChecked55, treeChecked55, treeLeaves55⟩

theorem areaUnits55 : gridUnionAreaUnits output55 = 262144 := by decide +kernel

noncomputable def phaseMass55 : ℝ := singlePhaseMass (475523442/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw55 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass55_eq : phaseMass55 = (237761721/819200000000 : ℝ) := by
  unfold phaseMass55
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw55 output55 cover55 source55
    (gridTreeUnionCheck_sound 32768 raw55 output55 cover55 source55 tree55 checked55)
    _ (by norm_num) _, areaUnits55]
  norm_num

-- Frozen phase 2552, atom 4925, type 1, source (6,33).
def leavesData56 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves56 : Fin 1 → DyadicLeaf := leavesData56.get
def raw56 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 6 33 leaves56 i
def outputData56 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨1536,1792,8448,8704⟩) (.single ⟨8448,8704,1536,1792⟩)) (.node (.single ⟨24064,24320,30976,31232⟩) (.single ⟨30976,31232,24064,24320⟩)))
def output56 : Fin 4 → GridBox := outputData56.get
def coverData56 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData56 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover56 (i : Fin 4) : Fin 4 := ⟨coverData56.get i % 4, Nat.mod_lt _ (by decide)⟩
def source56 (i : Fin 4) : Fin 4 := ⟨sourceData56.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree56 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 (.cutY 10240 (.cutX 1024 .empty (.cutY 9216 (.cutX 1536 .empty (.cutY 8704 (.cutX 1792 (.cutY 8448 .empty .full) .empty) .empty)) .empty)) .empty) .empty) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 (.cutX 9216 (.cutY 1024 .empty (.cutX 8704 (.cutY 1536 .empty (.cutX 8448 .empty (.cutY 1792 .full .empty))) .empty)) .empty) .empty) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 .empty (.cutX 23552 .empty (.cutY 31744 (.cutX 24064 .empty (.cutY 31232 (.cutX 24320 (.cutY 30976 .empty .full) .empty) .empty)) .empty))))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 .empty (.cutY 22528 .empty (.cutX 31744 (.cutY 23552 .empty (.cutX 31232 (.cutY 24064 .empty (.cutX 30976 .empty (.cutY 24320 .full .empty))) .empty)) .empty))))) .empty))))

theorem metadata56 : 0<475523442 ∧ 6<128 ∧ 33<128 ∧ 1<4 ∧
    4925/4160=1 ∧ 4925%4160=765 ∧ ∀ i, (leaves56 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData56).mp
    (by decide +kernel)

theorem sourceChecked56_0 : ∀ i : Fin 4,
    (fun i => output56 i = raw56 (source56 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked56 : ∀ i : Fin 4, (fun i => output56 i = raw56 (source56 i)) i :=
  forallFin_of_zero_offset (fun i => output56 i = raw56 (source56 i)) sourceChecked56_0

theorem coverChecked56_0 : ∀ i : Fin 4,
    (fun i => (output56 (cover56 i)).ContainsBox (raw56 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked56 : ∀ i : Fin 4, (fun i => (output56 (cover56 i)).ContainsBox (raw56 i)) i :=
  forallFin_of_zero_offset (fun i => (output56 (cover56 i)).ContainsBox (raw56 i)) coverChecked56_0

theorem treeChecked56 : tree56.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves56 : List.ofFn output56 = tree56.leaves ⟨0,32768,0,32768⟩ := by
  unfold output56
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked56 : gridTreeUnionCheck 32768 raw56 output56 cover56 source56 tree56 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked56, coverChecked56, treeChecked56, treeLeaves56⟩

theorem areaUnits56 : gridUnionAreaUnits output56 = 262144 := by decide +kernel

noncomputable def phaseMass56 : ℝ := singlePhaseMass (475523442/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw56 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass56_eq : phaseMass56 = (237761721/819200000000 : ℝ) := by
  unfold phaseMass56
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw56 output56 cover56 source56
    (gridTreeUnionCheck_sound 32768 raw56 output56 cover56 source56 tree56 checked56)
    _ (by norm_num) _, areaUnits56]
  norm_num

-- Frozen phase 2553, atom 996, type 0, source (8,36).
def leavesData57 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves57 : Fin 1 → DyadicLeaf := leavesData57.get
def raw57 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 8 36 leaves57 i
def outputData57 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨2048,2304,9216,9472⟩) (.single ⟨9216,9472,2048,2304⟩)) (.node (.single ⟨23296,23552,30464,30720⟩) (.single ⟨30464,30720,23296,23552⟩)))
def output57 : Fin 4 → GridBox := outputData57.get
def coverData57 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData57 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover57 (i : Fin 4) : Fin 4 := ⟨coverData57.get i % 4, Nat.mod_lt _ (by decide)⟩
def source57 (i : Fin 4) : Fin 4 := ⟨sourceData57.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree57 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 .empty (.cutY 10240 (.cutX 3072 (.cutY 9216 .empty (.cutX 2560 (.cutY 9728 (.cutX 2304 (.cutY 9472 .full .empty) .empty) .empty) .empty)) .empty) .empty)) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 .empty (.cutX 9216 .empty (.cutY 3072 (.cutX 9728 (.cutY 2560 (.cutX 9472 (.cutY 2304 .full .empty) .empty) .empty) .empty) .empty))) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 (.cutX 23552 (.cutY 29696 .empty (.cutX 23040 .empty (.cutY 30208 .empty (.cutX 23296 .empty (.cutY 30464 .empty .full))))) .empty) .empty))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 (.cutY 22528 .empty (.cutX 29696 .empty (.cutY 23552 (.cutX 30208 .empty (.cutY 23040 .empty (.cutX 30464 .empty (.cutY 23296 .empty .full)))) .empty))) .empty))) .empty))))

theorem metadata57 : 0<290391823 ∧ 8<128 ∧ 36<128 ∧ 0<4 ∧
    996/4160=0 ∧ 996%4160=996 ∧ ∀ i, (leaves57 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData57).mp
    (by decide +kernel)

theorem sourceChecked57_0 : ∀ i : Fin 4,
    (fun i => output57 i = raw57 (source57 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked57 : ∀ i : Fin 4, (fun i => output57 i = raw57 (source57 i)) i :=
  forallFin_of_zero_offset (fun i => output57 i = raw57 (source57 i)) sourceChecked57_0

theorem coverChecked57_0 : ∀ i : Fin 4,
    (fun i => (output57 (cover57 i)).ContainsBox (raw57 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked57 : ∀ i : Fin 4, (fun i => (output57 (cover57 i)).ContainsBox (raw57 i)) i :=
  forallFin_of_zero_offset (fun i => (output57 (cover57 i)).ContainsBox (raw57 i)) coverChecked57_0

theorem treeChecked57 : tree57.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves57 : List.ofFn output57 = tree57.leaves ⟨0,32768,0,32768⟩ := by
  unfold output57
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked57 : gridTreeUnionCheck 32768 raw57 output57 cover57 source57 tree57 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked57, coverChecked57, treeChecked57, treeLeaves57⟩

theorem areaUnits57 : gridUnionAreaUnits output57 = 262144 := by decide +kernel

noncomputable def phaseMass57 : ℝ := singlePhaseMass (290391823/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw57 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass57_eq : phaseMass57 = (290391823/1638400000000 : ℝ) := by
  unfold phaseMass57
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw57 output57 cover57 source57
    (gridTreeUnionCheck_sound 32768 raw57 output57 cover57 source57 tree57 checked57)
    _ (by norm_num) _, areaUnits57]
  norm_num

-- Frozen phase 2554, atom 1217, type 0, source (10,37).
def leavesData58 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves58 : Fin 1 → DyadicLeaf := leavesData58.get
def raw58 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 10 37 leaves58 i
def outputData58 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨2560,2816,9472,9728⟩) (.single ⟨9472,9728,2560,2816⟩)) (.node (.single ⟨23040,23296,29952,30208⟩) (.single ⟨29952,30208,23040,23296⟩)))
def output58 : Fin 4 → GridBox := outputData58.get
def coverData58 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData58 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover58 (i : Fin 4) : Fin 4 := ⟨coverData58.get i % 4, Nat.mod_lt _ (by decide)⟩
def source58 (i : Fin 4) : Fin 4 := ⟨sourceData58.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree58 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 .empty (.cutY 10240 (.cutX 3072 (.cutY 9216 .empty (.cutX 2560 .empty (.cutY 9728 (.cutX 2816 (.cutY 9472 .empty .full) .empty) .empty))) .empty) .empty)) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 .empty (.cutX 9216 .empty (.cutY 3072 (.cutX 9728 (.cutY 2560 .empty (.cutX 9472 .empty (.cutY 2816 .full .empty))) .empty) .empty))) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 (.cutX 23552 (.cutY 29696 .empty (.cutX 23040 .empty (.cutY 30208 (.cutX 23296 (.cutY 29952 .empty .full) .empty) .empty))) .empty) .empty))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 (.cutY 22528 .empty (.cutX 29696 .empty (.cutY 23552 (.cutX 30208 (.cutY 23040 .empty (.cutX 29952 .empty (.cutY 23296 .full .empty))) .empty) .empty))) .empty))) .empty))))

theorem metadata58 : 0<290391823 ∧ 10<128 ∧ 37<128 ∧ 0<4 ∧
    1217/4160=0 ∧ 1217%4160=1217 ∧ ∀ i, (leaves58 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData58).mp
    (by decide +kernel)

theorem sourceChecked58_0 : ∀ i : Fin 4,
    (fun i => output58 i = raw58 (source58 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked58 : ∀ i : Fin 4, (fun i => output58 i = raw58 (source58 i)) i :=
  forallFin_of_zero_offset (fun i => output58 i = raw58 (source58 i)) sourceChecked58_0

theorem coverChecked58_0 : ∀ i : Fin 4,
    (fun i => (output58 (cover58 i)).ContainsBox (raw58 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked58 : ∀ i : Fin 4, (fun i => (output58 (cover58 i)).ContainsBox (raw58 i)) i :=
  forallFin_of_zero_offset (fun i => (output58 (cover58 i)).ContainsBox (raw58 i)) coverChecked58_0

theorem treeChecked58 : tree58.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves58 : List.ofFn output58 = tree58.leaves ⟨0,32768,0,32768⟩ := by
  unfold output58
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked58 : gridTreeUnionCheck 32768 raw58 output58 cover58 source58 tree58 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked58, coverChecked58, treeChecked58, treeLeaves58⟩

theorem areaUnits58 : gridUnionAreaUnits output58 = 262144 := by decide +kernel

noncomputable def phaseMass58 : ℝ := singlePhaseMass (290391823/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw58 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass58_eq : phaseMass58 = (290391823/1638400000000 : ℝ) := by
  unfold phaseMass58
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw58 output58 cover58 source58
    (gridTreeUnionCheck_sound 32768 raw58 output58 cover58 source58 tree58 checked58)
    _ (by norm_num) _, areaUnits58]
  norm_num

-- Frozen phase 2555, atom 286, type 0, source (2,34).
def leavesData59 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves59 : Fin 1 → DyadicLeaf := leavesData59.get
def raw59 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 2 34 leaves59 i
def outputData59 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨512,768,8704,8960⟩) (.single ⟨8704,8960,512,768⟩)) (.node (.single ⟨23808,24064,32000,32256⟩) (.single ⟨32000,32256,23808,24064⟩)))
def output59 : Fin 4 → GridBox := outputData59.get
def coverData59 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData59 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover59 (i : Fin 4) : Fin 4 := ⟨coverData59.get i % 4, Nat.mod_lt _ (by decide)⟩
def source59 (i : Fin 4) : Fin 4 := ⟨sourceData59.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree59 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 (.cutY 10240 (.cutX 1024 (.cutY 9216 (.cutX 512 .empty (.cutY 8704 .empty (.cutX 768 (.cutY 8960 .full .empty) .empty))) .empty) .empty) .empty) .empty) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 (.cutX 9216 (.cutY 1024 (.cutX 8704 .empty (.cutY 512 .empty (.cutX 8960 (.cutY 768 .full .empty) .empty))) .empty) .empty) .empty) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 .empty (.cutX 23552 .empty (.cutY 31744 .empty (.cutX 24064 (.cutY 32256 (.cutX 23808 .empty (.cutY 32000 .empty .full)) .empty) .empty)))))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 .empty (.cutY 22528 .empty (.cutX 31744 .empty (.cutY 23552 .empty (.cutX 32256 (.cutY 24064 (.cutX 32000 .empty (.cutY 23808 .empty .full)) .empty) .empty))))))) .empty))))

theorem metadata59 : 0<523383676 ∧ 2<128 ∧ 34<128 ∧ 0<4 ∧
    286/4160=0 ∧ 286%4160=286 ∧ ∀ i, (leaves59 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData59).mp
    (by decide +kernel)

theorem sourceChecked59_0 : ∀ i : Fin 4,
    (fun i => output59 i = raw59 (source59 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked59 : ∀ i : Fin 4, (fun i => output59 i = raw59 (source59 i)) i :=
  forallFin_of_zero_offset (fun i => output59 i = raw59 (source59 i)) sourceChecked59_0

theorem coverChecked59_0 : ∀ i : Fin 4,
    (fun i => (output59 (cover59 i)).ContainsBox (raw59 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked59 : ∀ i : Fin 4, (fun i => (output59 (cover59 i)).ContainsBox (raw59 i)) i :=
  forallFin_of_zero_offset (fun i => (output59 (cover59 i)).ContainsBox (raw59 i)) coverChecked59_0

theorem treeChecked59 : tree59.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves59 : List.ofFn output59 = tree59.leaves ⟨0,32768,0,32768⟩ := by
  unfold output59
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked59 : gridTreeUnionCheck 32768 raw59 output59 cover59 source59 tree59 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked59, coverChecked59, treeChecked59, treeLeaves59⟩

theorem areaUnits59 : gridUnionAreaUnits output59 = 262144 := by decide +kernel

noncomputable def phaseMass59 : ℝ := singlePhaseMass (523383676/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw59 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass59_eq : phaseMass59 = (130845919/409600000000 : ℝ) := by
  unfold phaseMass59
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw59 output59 cover59 source59
    (gridTreeUnionCheck_sound 32768 raw59 output59 cover59 source59 tree59 checked59)
    _ (by norm_num) _, areaUnits59]
  norm_num

-- Frozen phase 2556, atom 33, type 0, source (0,33).
def leavesData60 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves60 : Fin 1 → DyadicLeaf := leavesData60.get
def raw60 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 0 33 leaves60 i
def outputData60 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨0,256,8448,8704⟩) (.single ⟨8448,8704,0,256⟩)) (.node (.single ⟨24064,24320,32512,32768⟩) (.single ⟨32512,32768,24064,24320⟩)))
def output60 : Fin 4 → GridBox := outputData60.get
def coverData60 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData60 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover60 (i : Fin 4) : Fin 4 := ⟨coverData60.get i % 4, Nat.mod_lt _ (by decide)⟩
def source60 (i : Fin 4) : Fin 4 := ⟨sourceData60.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree60 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 (.cutY 10240 (.cutX 1024 (.cutY 9216 (.cutX 512 (.cutY 8704 (.cutX 256 (.cutY 8448 .empty .full) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 (.cutX 9216 (.cutY 1024 (.cutX 8704 (.cutY 512 (.cutX 8448 .empty (.cutY 256 .full .empty)) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 .empty (.cutX 23552 .empty (.cutY 31744 .empty (.cutX 24064 .empty (.cutY 32256 .empty (.cutX 24320 (.cutY 32512 .empty .full) .empty)))))))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 .empty (.cutY 22528 .empty (.cutX 31744 .empty (.cutY 23552 .empty (.cutX 32256 .empty (.cutY 24064 .empty (.cutX 32512 .empty (.cutY 24320 .full .empty)))))))))) .empty))))

theorem metadata60 : 0<523383676 ∧ 0<128 ∧ 33<128 ∧ 0<4 ∧
    33/4160=0 ∧ 33%4160=33 ∧ ∀ i, (leaves60 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData60).mp
    (by decide +kernel)

theorem sourceChecked60_0 : ∀ i : Fin 4,
    (fun i => output60 i = raw60 (source60 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked60 : ∀ i : Fin 4, (fun i => output60 i = raw60 (source60 i)) i :=
  forallFin_of_zero_offset (fun i => output60 i = raw60 (source60 i)) sourceChecked60_0

theorem coverChecked60_0 : ∀ i : Fin 4,
    (fun i => (output60 (cover60 i)).ContainsBox (raw60 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked60 : ∀ i : Fin 4, (fun i => (output60 (cover60 i)).ContainsBox (raw60 i)) i :=
  forallFin_of_zero_offset (fun i => (output60 (cover60 i)).ContainsBox (raw60 i)) coverChecked60_0

theorem treeChecked60 : tree60.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves60 : List.ofFn output60 = tree60.leaves ⟨0,32768,0,32768⟩ := by
  unfold output60
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked60 : gridTreeUnionCheck 32768 raw60 output60 cover60 source60 tree60 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked60, coverChecked60, treeChecked60, treeLeaves60⟩

theorem areaUnits60 : gridUnionAreaUnits output60 = 262144 := by decide +kernel

noncomputable def phaseMass60 : ℝ := singlePhaseMass (523383676/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw60 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass60_eq : phaseMass60 = (130845919/409600000000 : ℝ) := by
  unfold phaseMass60
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw60 output60 cover60 source60
    (gridTreeUnionCheck_sound 32768 raw60 output60 cover60 source60 tree60 checked60)
    _ (by norm_num) _, areaUnits60]
  norm_num

-- Frozen phase 2557, atom 7525, type 1, source (36,53).
def leavesData61 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves61 : Fin 4 → DyadicLeaf := leavesData61.get
def raw61 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 36 53 leaves61 i
def outputData61 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨9216,9344,13568,13696⟩) (.single ⟨9216,9344,13696,13824⟩)) (.node (.single ⟨9344,9472,13568,13696⟩) (.single ⟨9344,9472,13696,13824⟩))) (.node (.node (.single ⟨13568,13696,9216,9344⟩) (.single ⟨13568,13696,9344,9472⟩)) (.node (.single ⟨13696,13824,9216,9344⟩) (.single ⟨13696,13824,9344,9472⟩)))) (.node (.node (.node (.single ⟨18944,19072,23296,23424⟩) (.single ⟨18944,19072,23424,23552⟩)) (.node (.single ⟨19072,19200,23296,23424⟩) (.single ⟨19072,19200,23424,23552⟩))) (.node (.node (.single ⟨23296,23424,18944,19072⟩) (.single ⟨23296,23424,19072,19200⟩)) (.node (.single ⟨23424,23552,18944,19072⟩) (.single ⟨23424,23552,19072,19200⟩)))))
def output61 : Fin 16 → GridBox := outputData61.get
def coverData61 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData61 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover61 (i : Fin 16) : Fin 16 := ⟨coverData61.get i % 16, Nat.mod_lt _ (by decide)⟩
def source61 (i : Fin 16) : Fin 16 := ⟨sourceData61.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree61 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 (.cutY 14336 (.cutX 9216 .empty (.cutY 13312 .empty (.cutX 9728 (.cutY 13824 (.cutX 9472 (.cutY 13568 .empty (.cutX 9344 (.cutY 13696 .full .full) (.cutY 13696 .full .full))) .empty) .empty) .empty))) .empty) .empty)) (.cutY 12288 (.cutX 14336 (.cutY 10240 (.cutX 13312 .empty (.cutY 9216 .empty (.cutX 13824 (.cutY 9728 (.cutX 13568 .empty (.cutY 9472 (.cutX 13696 (.cutY 9344 .full .full) (.cutY 9344 .full .full)) .empty)) .empty) .empty))) .empty) .empty) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 .empty (.cutY 22528 .empty (.cutX 19456 (.cutY 23552 (.cutX 18944 .empty (.cutY 23040 .empty (.cutX 19200 (.cutY 23296 .empty (.cutX 19072 (.cutY 23424 .full .full) (.cutY 23424 .full .full))) .empty))) .empty) .empty)))) (.cutY 20480 (.cutX 22528 .empty (.cutY 18432 .empty (.cutX 23552 (.cutY 19456 (.cutX 23040 .empty (.cutY 18944 .empty (.cutX 23296 .empty (.cutY 19200 (.cutX 23424 (.cutY 19072 .full .full) (.cutY 19072 .full .full)) .empty)))) .empty) .empty))) .empty)) .empty) .empty)))

theorem metadata61 : 0<134822691 ∧ 36<128 ∧ 53<128 ∧ 1<4 ∧
    7525/4160=1 ∧ 7525%4160=3365 ∧ ∀ i, (leaves61 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData61).mp
    (by decide +kernel)

theorem sourceChecked61_0 : ∀ i : Fin 16,
    (fun i => output61 i = raw61 (source61 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked61 : ∀ i : Fin 16, (fun i => output61 i = raw61 (source61 i)) i :=
  forallFin_of_zero_offset (fun i => output61 i = raw61 (source61 i)) sourceChecked61_0

theorem coverChecked61_0 : ∀ i : Fin 16,
    (fun i => (output61 (cover61 i)).ContainsBox (raw61 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked61 : ∀ i : Fin 16, (fun i => (output61 (cover61 i)).ContainsBox (raw61 i)) i :=
  forallFin_of_zero_offset (fun i => (output61 (cover61 i)).ContainsBox (raw61 i)) coverChecked61_0

theorem treeChecked61 : tree61.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves61 : List.ofFn output61 = tree61.leaves ⟨0,32768,0,32768⟩ := by
  unfold output61
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked61 : gridTreeUnionCheck 32768 raw61 output61 cover61 source61 tree61 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked61, coverChecked61, treeChecked61, treeLeaves61⟩

theorem areaUnits61 : gridUnionAreaUnits output61 = 262144 := by decide +kernel

noncomputable def phaseMass61 : ℝ := singlePhaseMass (134822691/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw61 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass61_eq : phaseMass61 = (134822691/1638400000000 : ℝ) := by
  unfold phaseMass61
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw61 output61 cover61 source61
    (gridTreeUnionCheck_sound 32768 raw61 output61 cover61 source61 tree61 checked61)
    _ (by norm_num) _, areaUnits61]
  norm_num

-- Frozen phase 2558, atom 5153, type 1, source (8,33).
def leavesData62 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves62 : Fin 4 → DyadicLeaf := leavesData62.get
def raw62 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 8 33 leaves62 i
def outputData62 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨2048,2176,8448,8576⟩) (.single ⟨2048,2176,8576,8704⟩)) (.node (.single ⟨2176,2304,8448,8576⟩) (.single ⟨2176,2304,8576,8704⟩))) (.node (.node (.single ⟨8448,8576,2048,2176⟩) (.single ⟨8448,8576,2176,2304⟩)) (.node (.single ⟨8576,8704,2048,2176⟩) (.single ⟨8576,8704,2176,2304⟩)))) (.node (.node (.node (.single ⟨24064,24192,30464,30592⟩) (.single ⟨24064,24192,30592,30720⟩)) (.node (.single ⟨24192,24320,30464,30592⟩) (.single ⟨24192,24320,30592,30720⟩))) (.node (.node (.single ⟨30464,30592,24064,24192⟩) (.single ⟨30464,30592,24192,24320⟩)) (.node (.single ⟨30592,30720,24064,24192⟩) (.single ⟨30592,30720,24192,24320⟩)))))
def output62 : Fin 16 → GridBox := outputData62.get
def coverData62 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData62 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover62 (i : Fin 16) : Fin 16 := ⟨coverData62.get i % 16, Nat.mod_lt _ (by decide)⟩
def source62 (i : Fin 16) : Fin 16 := ⟨sourceData62.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree62 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 .empty (.cutY 10240 (.cutX 3072 (.cutY 9216 (.cutX 2560 (.cutY 8704 (.cutX 2304 (.cutY 8448 .empty (.cutX 2176 (.cutY 8576 .full .full) (.cutY 8576 .full .full))) .empty) .empty) .empty) .empty) .empty) .empty)) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 .empty (.cutX 9216 (.cutY 3072 (.cutX 8704 (.cutY 2560 (.cutX 8448 .empty (.cutY 2304 (.cutX 8576 (.cutY 2176 .full .full) (.cutY 2176 .full .full)) .empty)) .empty) .empty) .empty) .empty)) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 (.cutX 23552 .empty (.cutY 29696 .empty (.cutX 24064 .empty (.cutY 30208 .empty (.cutX 24320 (.cutY 30464 .empty (.cutX 24192 (.cutY 30592 .full .full) (.cutY 30592 .full .full))) .empty))))) .empty))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 (.cutY 22528 .empty (.cutX 29696 .empty (.cutY 23552 .empty (.cutX 30208 .empty (.cutY 24064 .empty (.cutX 30464 .empty (.cutY 24320 (.cutX 30592 (.cutY 24192 .full .full) (.cutY 24192 .full .full)) .empty))))))) .empty))) .empty))))

theorem metadata62 : 0<190129790 ∧ 8<128 ∧ 33<128 ∧ 1<4 ∧
    5153/4160=1 ∧ 5153%4160=993 ∧ ∀ i, (leaves62 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData62).mp
    (by decide +kernel)

theorem sourceChecked62_0 : ∀ i : Fin 16,
    (fun i => output62 i = raw62 (source62 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked62 : ∀ i : Fin 16, (fun i => output62 i = raw62 (source62 i)) i :=
  forallFin_of_zero_offset (fun i => output62 i = raw62 (source62 i)) sourceChecked62_0

theorem coverChecked62_0 : ∀ i : Fin 16,
    (fun i => (output62 (cover62 i)).ContainsBox (raw62 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked62 : ∀ i : Fin 16, (fun i => (output62 (cover62 i)).ContainsBox (raw62 i)) i :=
  forallFin_of_zero_offset (fun i => (output62 (cover62 i)).ContainsBox (raw62 i)) coverChecked62_0

theorem treeChecked62 : tree62.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves62 : List.ofFn output62 = tree62.leaves ⟨0,32768,0,32768⟩ := by
  unfold output62
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked62 : gridTreeUnionCheck 32768 raw62 output62 cover62 source62 tree62 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked62, coverChecked62, treeChecked62, treeLeaves62⟩

theorem areaUnits62 : gridUnionAreaUnits output62 = 262144 := by decide +kernel

noncomputable def phaseMass62 : ℝ := singlePhaseMass (190129790/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw62 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass62_eq : phaseMass62 = (19012979/163840000000 : ℝ) := by
  unfold phaseMass62
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw62 output62 cover62 source62
    (gridTreeUnionCheck_sound 32768 raw62 output62 cover62 source62 tree62 checked62)
    _ (by norm_num) _, areaUnits62]
  norm_num

-- Frozen phase 2559, atom 3425, type 0, source (37,58).
def leavesData63 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves63 : Fin 1 → DyadicLeaf := leavesData63.get
def raw63 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 37 58 leaves63 i
def outputData63 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨9472,9728,14848,15104⟩) (.single ⟨14848,15104,9472,9728⟩)) (.node (.single ⟨17664,17920,23040,23296⟩) (.single ⟨23040,23296,17664,17920⟩)))
def output63 : Fin 4 → GridBox := outputData63.get
def coverData63 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData63 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover63 (i : Fin 4) : Fin 4 := ⟨coverData63.get i % 4, Nat.mod_lt _ (by decide)⟩
def source63 (i : Fin 4) : Fin 4 := ⟨sourceData63.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree63 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 (.cutY 14336 .empty (.cutX 9216 .empty (.cutY 15360 (.cutX 9728 (.cutY 14848 .empty (.cutX 9472 .empty (.cutY 15104 .full .empty))) .empty) .empty))) .empty)) (.cutY 12288 (.cutX 14336 .empty (.cutY 10240 (.cutX 15360 (.cutY 9216 .empty (.cutX 14848 .empty (.cutY 9728 (.cutX 15104 (.cutY 9472 .empty .full) .empty) .empty))) .empty) .empty)) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 (.cutY 22528 .empty (.cutX 17408 .empty (.cutY 23552 (.cutX 17920 (.cutY 23040 .empty (.cutX 17664 .empty (.cutY 23296 .full .empty))) .empty) .empty))) .empty)) (.cutY 20480 (.cutX 22528 .empty (.cutY 18432 (.cutX 23552 (.cutY 17408 .empty (.cutX 23040 .empty (.cutY 17920 (.cutX 23296 (.cutY 17664 .empty .full) .empty) .empty))) .empty) .empty)) .empty)) .empty) .empty)))

theorem metadata63 : 0<200205545 ∧ 37<128 ∧ 58<128 ∧ 0<4 ∧
    3425/4160=0 ∧ 3425%4160=3425 ∧ ∀ i, (leaves63 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData63).mp
    (by decide +kernel)

theorem sourceChecked63_0 : ∀ i : Fin 4,
    (fun i => output63 i = raw63 (source63 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked63 : ∀ i : Fin 4, (fun i => output63 i = raw63 (source63 i)) i :=
  forallFin_of_zero_offset (fun i => output63 i = raw63 (source63 i)) sourceChecked63_0

theorem coverChecked63_0 : ∀ i : Fin 4,
    (fun i => (output63 (cover63 i)).ContainsBox (raw63 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked63 : ∀ i : Fin 4, (fun i => (output63 (cover63 i)).ContainsBox (raw63 i)) i :=
  forallFin_of_zero_offset (fun i => (output63 (cover63 i)).ContainsBox (raw63 i)) coverChecked63_0

theorem treeChecked63 : tree63.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves63 : List.ofFn output63 = tree63.leaves ⟨0,32768,0,32768⟩ := by
  unfold output63
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked63 : gridTreeUnionCheck 32768 raw63 output63 cover63 source63 tree63 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked63, coverChecked63, treeChecked63, treeLeaves63⟩

theorem areaUnits63 : gridUnionAreaUnits output63 = 262144 := by decide +kernel

noncomputable def phaseMass63 : ℝ := singlePhaseMass (200205545/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw63 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass63_eq : phaseMass63 = (40041109/327680000000 : ℝ) := by
  unfold phaseMass63
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw63 output63 cover63 source63
    (gridTreeUnionCheck_sound 32768 raw63 output63 cover63 source63 tree63 checked63)
    _ (by norm_num) _, areaUnits63]
  norm_num

-- Frozen phase 2560, atom 2992, type 0, source (30,52).
def leavesData64 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves64 : Fin 1 → DyadicLeaf := leavesData64.get
def raw64 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 30 52 leaves64 i
def outputData64 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨7680,7936,13312,13568⟩) (.single ⟨13312,13568,7680,7936⟩)) (.node (.single ⟨19200,19456,24832,25088⟩) (.single ⟨24832,25088,19200,19456⟩)))
def output64 : Fin 4 → GridBox := outputData64.get
def coverData64 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData64 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover64 (i : Fin 4) : Fin 4 := ⟨coverData64.get i % 4, Nat.mod_lt _ (by decide)⟩
def source64 (i : Fin 4) : Fin 4 := ⟨sourceData64.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree64 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 .empty (.cutY 14336 (.cutX 7168 .empty (.cutY 13312 .empty (.cutX 7680 .empty (.cutY 13824 (.cutX 7936 (.cutY 13568 .full .empty) .empty) .empty)))) .empty))))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 (.cutY 6144 .empty (.cutX 13312 .empty (.cutY 7168 .empty (.cutX 13824 (.cutY 7680 .empty (.cutX 13568 (.cutY 7936 .full .empty) .empty)) .empty)))) .empty))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 .empty (.cutY 26624 (.cutX 19456 (.cutY 25600 (.cutX 18944 .empty (.cutY 25088 (.cutX 19200 .empty (.cutY 24832 .empty .full)) .empty)) .empty) .empty) .empty)) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 (.cutY 18432 .empty (.cutX 25600 (.cutY 19456 (.cutX 25088 (.cutY 18944 .empty (.cutX 24832 .empty (.cutY 19200 .empty .full))) .empty) .empty) .empty)) .empty) .empty) .empty) .empty))))

theorem metadata64 : 0<300263580 ∧ 30<128 ∧ 52<128 ∧ 0<4 ∧
    2992/4160=0 ∧ 2992%4160=2992 ∧ ∀ i, (leaves64 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData64).mp
    (by decide +kernel)

theorem sourceChecked64_0 : ∀ i : Fin 4,
    (fun i => output64 i = raw64 (source64 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked64 : ∀ i : Fin 4, (fun i => output64 i = raw64 (source64 i)) i :=
  forallFin_of_zero_offset (fun i => output64 i = raw64 (source64 i)) sourceChecked64_0

theorem coverChecked64_0 : ∀ i : Fin 4,
    (fun i => (output64 (cover64 i)).ContainsBox (raw64 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked64 : ∀ i : Fin 4, (fun i => (output64 (cover64 i)).ContainsBox (raw64 i)) i :=
  forallFin_of_zero_offset (fun i => (output64 (cover64 i)).ContainsBox (raw64 i)) coverChecked64_0

theorem treeChecked64 : tree64.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves64 : List.ofFn output64 = tree64.leaves ⟨0,32768,0,32768⟩ := by
  unfold output64
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked64 : gridTreeUnionCheck 32768 raw64 output64 cover64 source64 tree64 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked64, coverChecked64, treeChecked64, treeLeaves64⟩

theorem areaUnits64 : gridUnionAreaUnits output64 = 262144 := by decide +kernel

noncomputable def phaseMass64 : ℝ := singlePhaseMass (300263580/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw64 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass64_eq : phaseMass64 = (15013179/81920000000 : ℝ) := by
  unfold phaseMass64
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw64 output64 cover64 source64
    (gridTreeUnionCheck_sound 32768 raw64 output64 cover64 source64 tree64 checked64)
    _ (by norm_num) _, areaUnits64]
  norm_num

-- Frozen phase 2561, atom 7581, type 1, source (37,54).
def leavesData65 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves65 : Fin 4 → DyadicLeaf := leavesData65.get
def raw65 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 37 54 leaves65 i
def outputData65 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨9472,9600,13824,13952⟩) (.single ⟨9472,9600,13952,14080⟩)) (.node (.single ⟨9600,9728,13824,13952⟩) (.single ⟨9600,9728,13952,14080⟩))) (.node (.node (.single ⟨13824,13952,9472,9600⟩) (.single ⟨13824,13952,9600,9728⟩)) (.node (.single ⟨13952,14080,9472,9600⟩) (.single ⟨13952,14080,9600,9728⟩)))) (.node (.node (.node (.single ⟨18688,18816,23040,23168⟩) (.single ⟨18688,18816,23168,23296⟩)) (.node (.single ⟨18816,18944,23040,23168⟩) (.single ⟨18816,18944,23168,23296⟩))) (.node (.node (.single ⟨23040,23168,18688,18816⟩) (.single ⟨23040,23168,18816,18944⟩)) (.node (.single ⟨23168,23296,18688,18816⟩) (.single ⟨23168,23296,18816,18944⟩)))))
def output65 : Fin 16 → GridBox := outputData65.get
def coverData65 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData65 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover65 (i : Fin 16) : Fin 16 := ⟨coverData65.get i % 16, Nat.mod_lt _ (by decide)⟩
def source65 (i : Fin 16) : Fin 16 := ⟨sourceData65.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree65 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 (.cutY 14336 (.cutX 9216 .empty (.cutY 13312 .empty (.cutX 9728 (.cutY 13824 .empty (.cutX 9472 .empty (.cutY 14080 (.cutX 9600 (.cutY 13952 .full .full) (.cutY 13952 .full .full)) .empty))) .empty))) .empty) .empty)) (.cutY 12288 (.cutX 14336 (.cutY 10240 (.cutX 13312 .empty (.cutY 9216 .empty (.cutX 13824 .empty (.cutY 9728 (.cutX 14080 (.cutY 9472 .empty (.cutX 13952 (.cutY 9600 .full .full) (.cutY 9600 .full .full))) .empty) .empty)))) .empty) .empty) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 .empty (.cutY 22528 .empty (.cutX 19456 (.cutY 23552 (.cutX 18944 (.cutY 23040 .empty (.cutX 18688 .empty (.cutY 23296 (.cutX 18816 (.cutY 23168 .full .full) (.cutY 23168 .full .full)) .empty))) .empty) .empty) .empty)))) (.cutY 20480 (.cutX 22528 .empty (.cutY 18432 .empty (.cutX 23552 (.cutY 19456 (.cutX 23040 .empty (.cutY 18944 (.cutX 23296 (.cutY 18688 .empty (.cutX 23168 (.cutY 18816 .full .full) (.cutY 18816 .full .full))) .empty) .empty)) .empty) .empty))) .empty)) .empty) .empty)))

theorem metadata65 : 0<134822691 ∧ 37<128 ∧ 54<128 ∧ 1<4 ∧
    7581/4160=1 ∧ 7581%4160=3421 ∧ ∀ i, (leaves65 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData65).mp
    (by decide +kernel)

theorem sourceChecked65_0 : ∀ i : Fin 16,
    (fun i => output65 i = raw65 (source65 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked65 : ∀ i : Fin 16, (fun i => output65 i = raw65 (source65 i)) i :=
  forallFin_of_zero_offset (fun i => output65 i = raw65 (source65 i)) sourceChecked65_0

theorem coverChecked65_0 : ∀ i : Fin 16,
    (fun i => (output65 (cover65 i)).ContainsBox (raw65 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked65 : ∀ i : Fin 16, (fun i => (output65 (cover65 i)).ContainsBox (raw65 i)) i :=
  forallFin_of_zero_offset (fun i => (output65 (cover65 i)).ContainsBox (raw65 i)) coverChecked65_0

theorem treeChecked65 : tree65.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves65 : List.ofFn output65 = tree65.leaves ⟨0,32768,0,32768⟩ := by
  unfold output65
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked65 : gridTreeUnionCheck 32768 raw65 output65 cover65 source65 tree65 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked65, coverChecked65, treeChecked65, treeLeaves65⟩

theorem areaUnits65 : gridUnionAreaUnits output65 = 262144 := by decide +kernel

noncomputable def phaseMass65 : ℝ := singlePhaseMass (134822691/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw65 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass65_eq : phaseMass65 = (134822691/1638400000000 : ℝ) := by
  unfold phaseMass65
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw65 output65 cover65 source65
    (gridTreeUnionCheck_sound 32768 raw65 output65 cover65 source65 tree65 checked65)
    _ (by norm_num) _, areaUnits65]
  norm_num

-- Frozen phase 2562, atom 6932, type 1, source (27,45).
def leavesData66 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves66 : Fin 4 → DyadicLeaf := leavesData66.get
def raw66 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 27 45 leaves66 i
def outputData66 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨6912,7040,11520,11648⟩) (.single ⟨6912,7040,11648,11776⟩)) (.node (.single ⟨7040,7168,11520,11648⟩) (.single ⟨7040,7168,11648,11776⟩))) (.node (.node (.single ⟨11520,11648,6912,7040⟩) (.single ⟨11520,11648,7040,7168⟩)) (.node (.single ⟨11648,11776,6912,7040⟩) (.single ⟨11648,11776,7040,7168⟩)))) (.node (.node (.node (.single ⟨20992,21120,25600,25728⟩) (.single ⟨20992,21120,25728,25856⟩)) (.node (.single ⟨21120,21248,25600,25728⟩) (.single ⟨21120,21248,25728,25856⟩))) (.node (.node (.single ⟨25600,25728,20992,21120⟩) (.single ⟨25600,25728,21120,21248⟩)) (.node (.single ⟨25728,25856,20992,21120⟩) (.single ⟨25728,25856,21120,21248⟩)))))
def output66 : Fin 16 → GridBox := outputData66.get
def coverData66 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData66 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover66 (i : Fin 16) : Fin 16 := ⟨coverData66.get i % 16, Nat.mod_lt _ (by decide)⟩
def source66 (i : Fin 16) : Fin 16 := ⟨sourceData66.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree66 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 .empty (.cutY 10240 .empty (.cutX 7168 (.cutY 11264 .empty (.cutX 6656 .empty (.cutY 11776 (.cutX 6912 .empty (.cutY 11520 .empty (.cutX 7040 (.cutY 11648 .full .full) (.cutY 11648 .full .full)))) .empty))) .empty))) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 .empty (.cutY 6144 .empty (.cutX 11264 .empty (.cutY 7168 (.cutX 11776 (.cutY 6656 .empty (.cutX 11520 .empty (.cutY 6912 .empty (.cutX 11648 (.cutY 7040 .full .full) (.cutY 7040 .full .full))))) .empty) .empty))))) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 (.cutY 26624 (.cutX 21504 (.cutY 25600 .empty (.cutX 20992 .empty (.cutY 26112 (.cutX 21248 (.cutY 25856 (.cutX 21120 (.cutY 25728 .full .full) (.cutY 25728 .full .full)) .empty) .empty) .empty))) .empty) .empty) .empty) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 (.cutY 22528 (.cutX 25600 .empty (.cutY 21504 (.cutX 26112 (.cutY 20992 .empty (.cutX 25856 (.cutY 21248 (.cutX 25728 (.cutY 21120 .full .full) (.cutY 21120 .full .full)) .empty) .empty)) .empty) .empty)) .empty) .empty)) .empty) .empty))))

theorem metadata66 : 0<130629080 ∧ 27<128 ∧ 45<128 ∧ 1<4 ∧
    6932/4160=1 ∧ 6932%4160=2772 ∧ ∀ i, (leaves66 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData66).mp
    (by decide +kernel)

theorem sourceChecked66_0 : ∀ i : Fin 16,
    (fun i => output66 i = raw66 (source66 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked66 : ∀ i : Fin 16, (fun i => output66 i = raw66 (source66 i)) i :=
  forallFin_of_zero_offset (fun i => output66 i = raw66 (source66 i)) sourceChecked66_0

theorem coverChecked66_0 : ∀ i : Fin 16,
    (fun i => (output66 (cover66 i)).ContainsBox (raw66 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked66 : ∀ i : Fin 16, (fun i => (output66 (cover66 i)).ContainsBox (raw66 i)) i :=
  forallFin_of_zero_offset (fun i => (output66 (cover66 i)).ContainsBox (raw66 i)) coverChecked66_0

theorem treeChecked66 : tree66.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves66 : List.ofFn output66 = tree66.leaves ⟨0,32768,0,32768⟩ := by
  unfold output66
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked66 : gridTreeUnionCheck 32768 raw66 output66 cover66 source66 tree66 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked66, coverChecked66, treeChecked66, treeLeaves66⟩

theorem areaUnits66 : gridUnionAreaUnits output66 = 262144 := by decide +kernel

noncomputable def phaseMass66 : ℝ := singlePhaseMass (130629080/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw66 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass66_eq : phaseMass66 = (3265727/40960000000 : ℝ) := by
  unfold phaseMass66
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw66 output66 cover66 source66
    (gridTreeUnionCheck_sound 32768 raw66 output66 cover66 source66 tree66 checked66)
    _ (by norm_num) _, areaUnits66]
  norm_num

-- Frozen phase 2563, atom 531, type 0, source (4,35).
def leavesData67 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves67 : Fin 1 → DyadicLeaf := leavesData67.get
def raw67 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 4 35 leaves67 i
def outputData67 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨1024,1280,8960,9216⟩) (.single ⟨8960,9216,1024,1280⟩)) (.node (.single ⟨23552,23808,31488,31744⟩) (.single ⟨31488,31744,23552,23808⟩)))
def output67 : Fin 4 → GridBox := outputData67.get
def coverData67 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData67 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover67 (i : Fin 4) : Fin 4 := ⟨coverData67.get i % 4, Nat.mod_lt _ (by decide)⟩
def source67 (i : Fin 4) : Fin 4 := ⟨sourceData67.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree67 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 (.cutY 10240 (.cutX 1024 .empty (.cutY 9216 (.cutX 1536 (.cutY 8704 .empty (.cutX 1280 (.cutY 8960 .empty .full) .empty)) .empty) .empty)) .empty) .empty) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 (.cutX 9216 (.cutY 1024 .empty (.cutX 8704 .empty (.cutY 1536 (.cutX 8960 .empty (.cutY 1280 .full .empty)) .empty))) .empty) .empty) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 .empty (.cutX 23552 .empty (.cutY 31744 (.cutX 24064 (.cutY 31232 .empty (.cutX 23808 (.cutY 31488 .empty .full) .empty)) .empty) .empty))))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 .empty (.cutY 22528 .empty (.cutX 31744 (.cutY 23552 .empty (.cutX 31232 .empty (.cutY 24064 (.cutX 31488 .empty (.cutY 23808 .full .empty)) .empty))) .empty))))) .empty))))

theorem metadata67 : 0<523383676 ∧ 4<128 ∧ 35<128 ∧ 0<4 ∧
    531/4160=0 ∧ 531%4160=531 ∧ ∀ i, (leaves67 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData67).mp
    (by decide +kernel)

theorem sourceChecked67_0 : ∀ i : Fin 4,
    (fun i => output67 i = raw67 (source67 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked67 : ∀ i : Fin 4, (fun i => output67 i = raw67 (source67 i)) i :=
  forallFin_of_zero_offset (fun i => output67 i = raw67 (source67 i)) sourceChecked67_0

theorem coverChecked67_0 : ∀ i : Fin 4,
    (fun i => (output67 (cover67 i)).ContainsBox (raw67 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked67 : ∀ i : Fin 4, (fun i => (output67 (cover67 i)).ContainsBox (raw67 i)) i :=
  forallFin_of_zero_offset (fun i => (output67 (cover67 i)).ContainsBox (raw67 i)) coverChecked67_0

theorem treeChecked67 : tree67.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves67 : List.ofFn output67 = tree67.leaves ⟨0,32768,0,32768⟩ := by
  unfold output67
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked67 : gridTreeUnionCheck 32768 raw67 output67 cover67 source67 tree67 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked67, coverChecked67, treeChecked67, treeLeaves67⟩

theorem areaUnits67 : gridUnionAreaUnits output67 = 262144 := by decide +kernel

noncomputable def phaseMass67 : ℝ := singlePhaseMass (523383676/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw67 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass67_eq : phaseMass67 = (130845919/409600000000 : ℝ) := by
  unfold phaseMass67
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw67 output67 cover67 source67
    (gridTreeUnionCheck_sound 32768 raw67 output67 cover67 source67 tree67 checked67)
    _ (by norm_num) _, areaUnits67]
  norm_num

-- Frozen phase 2564, atom 4808, type 1, source (5,33).
def leavesData68 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves68 : Fin 1 → DyadicLeaf := leavesData68.get
def raw68 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 5 33 leaves68 i
def outputData68 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨1280,1536,8448,8704⟩) (.single ⟨8448,8704,1280,1536⟩)) (.node (.single ⟨24064,24320,31232,31488⟩) (.single ⟨31232,31488,24064,24320⟩)))
def output68 : Fin 4 → GridBox := outputData68.get
def coverData68 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData68 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover68 (i : Fin 4) : Fin 4 := ⟨coverData68.get i % 4, Nat.mod_lt _ (by decide)⟩
def source68 (i : Fin 4) : Fin 4 := ⟨sourceData68.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree68 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 (.cutY 10240 (.cutX 1024 .empty (.cutY 9216 (.cutX 1536 (.cutY 8704 (.cutX 1280 .empty (.cutY 8448 .empty .full)) .empty) .empty) .empty)) .empty) .empty) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 (.cutX 9216 (.cutY 1024 .empty (.cutX 8704 (.cutY 1536 (.cutX 8448 .empty (.cutY 1280 .empty .full)) .empty) .empty)) .empty) .empty) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 .empty (.cutX 23552 .empty (.cutY 31744 (.cutX 24064 .empty (.cutY 31232 .empty (.cutX 24320 (.cutY 31488 .full .empty) .empty))) .empty))))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 .empty (.cutY 22528 .empty (.cutX 31744 (.cutY 23552 .empty (.cutX 31232 .empty (.cutY 24064 .empty (.cutX 31488 (.cutY 24320 .full .empty) .empty)))) .empty))))) .empty))))

theorem metadata68 : 0<475523442 ∧ 5<128 ∧ 33<128 ∧ 1<4 ∧
    4808/4160=1 ∧ 4808%4160=648 ∧ ∀ i, (leaves68 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData68).mp
    (by decide +kernel)

theorem sourceChecked68_0 : ∀ i : Fin 4,
    (fun i => output68 i = raw68 (source68 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked68 : ∀ i : Fin 4, (fun i => output68 i = raw68 (source68 i)) i :=
  forallFin_of_zero_offset (fun i => output68 i = raw68 (source68 i)) sourceChecked68_0

theorem coverChecked68_0 : ∀ i : Fin 4,
    (fun i => (output68 (cover68 i)).ContainsBox (raw68 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked68 : ∀ i : Fin 4, (fun i => (output68 (cover68 i)).ContainsBox (raw68 i)) i :=
  forallFin_of_zero_offset (fun i => (output68 (cover68 i)).ContainsBox (raw68 i)) coverChecked68_0

theorem treeChecked68 : tree68.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves68 : List.ofFn output68 = tree68.leaves ⟨0,32768,0,32768⟩ := by
  unfold output68
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked68 : gridTreeUnionCheck 32768 raw68 output68 cover68 source68 tree68 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked68, coverChecked68, treeChecked68, treeLeaves68⟩

theorem areaUnits68 : gridUnionAreaUnits output68 = 262144 := by decide +kernel

noncomputable def phaseMass68 : ℝ := singlePhaseMass (475523442/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw68 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass68_eq : phaseMass68 = (237761721/819200000000 : ℝ) := by
  unfold phaseMass68
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw68 output68 cover68 source68
    (gridTreeUnionCheck_sound 32768 raw68 output68 cover68 source68 tree68 checked68)
    _ (by norm_num) _, areaUnits68]
  norm_num

-- Frozen phase 2565, atom 3479, type 0, source (38,59).
def leavesData69 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves69 : Fin 1 → DyadicLeaf := leavesData69.get
def raw69 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 38 59 leaves69 i
def outputData69 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨9728,9984,15104,15360⟩) (.single ⟨15104,15360,9728,9984⟩)) (.node (.single ⟨17408,17664,22784,23040⟩) (.single ⟨22784,23040,17408,17664⟩)))
def output69 : Fin 4 → GridBox := outputData69.get
def coverData69 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData69 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover69 (i : Fin 4) : Fin 4 := ⟨coverData69.get i % 4, Nat.mod_lt _ (by decide)⟩
def source69 (i : Fin 4) : Fin 4 := ⟨sourceData69.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree69 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 (.cutY 14336 .empty (.cutX 9216 .empty (.cutY 15360 (.cutX 9728 .empty (.cutY 14848 .empty (.cutX 9984 (.cutY 15104 .empty .full) .empty))) .empty))) .empty)) (.cutY 12288 (.cutX 14336 .empty (.cutY 10240 (.cutX 15360 (.cutY 9216 .empty (.cutX 14848 .empty (.cutY 9728 .empty (.cutX 15104 .empty (.cutY 9984 .full .empty))))) .empty) .empty)) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 (.cutY 22528 .empty (.cutX 17408 .empty (.cutY 23552 (.cutX 17920 (.cutY 23040 (.cutX 17664 (.cutY 22784 .empty .full) .empty) .empty) .empty) .empty))) .empty)) (.cutY 20480 (.cutX 22528 .empty (.cutY 18432 (.cutX 23552 (.cutY 17408 .empty (.cutX 23040 (.cutY 17920 (.cutX 22784 .empty (.cutY 17664 .full .empty)) .empty) .empty)) .empty) .empty)) .empty)) .empty) .empty)))

theorem metadata69 : 0<200205545 ∧ 38<128 ∧ 59<128 ∧ 0<4 ∧
    3479/4160=0 ∧ 3479%4160=3479 ∧ ∀ i, (leaves69 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData69).mp
    (by decide +kernel)

theorem sourceChecked69_0 : ∀ i : Fin 4,
    (fun i => output69 i = raw69 (source69 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked69 : ∀ i : Fin 4, (fun i => output69 i = raw69 (source69 i)) i :=
  forallFin_of_zero_offset (fun i => output69 i = raw69 (source69 i)) sourceChecked69_0

theorem coverChecked69_0 : ∀ i : Fin 4,
    (fun i => (output69 (cover69 i)).ContainsBox (raw69 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked69 : ∀ i : Fin 4, (fun i => (output69 (cover69 i)).ContainsBox (raw69 i)) i :=
  forallFin_of_zero_offset (fun i => (output69 (cover69 i)).ContainsBox (raw69 i)) coverChecked69_0

theorem treeChecked69 : tree69.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves69 : List.ofFn output69 = tree69.leaves ⟨0,32768,0,32768⟩ := by
  unfold output69
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked69 : gridTreeUnionCheck 32768 raw69 output69 cover69 source69 tree69 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked69, coverChecked69, treeChecked69, treeLeaves69⟩

theorem areaUnits69 : gridUnionAreaUnits output69 = 262144 := by decide +kernel

noncomputable def phaseMass69 : ℝ := singlePhaseMass (200205545/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw69 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass69_eq : phaseMass69 = (40041109/327680000000 : ℝ) := by
  unfold phaseMass69
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw69 output69 cover69 source69
    (gridTreeUnionCheck_sound 32768 raw69 output69 cover69 source69 tree69 checked69)
    _ (by norm_num) _, areaUnits69]
  norm_num

-- Frozen phase 2566, atom 3531, type 0, source (39,60).
def leavesData70 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves70 : Fin 1 → DyadicLeaf := leavesData70.get
def raw70 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 39 60 leaves70 i
def outputData70 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨9984,10240,15360,15616⟩) (.single ⟨15360,15616,9984,10240⟩)) (.node (.single ⟨17152,17408,22528,22784⟩) (.single ⟨22528,22784,17152,17408⟩)))
def output70 : Fin 4 → GridBox := outputData70.get
def coverData70 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData70 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover70 (i : Fin 4) : Fin 4 := ⟨coverData70.get i % 4, Nat.mod_lt _ (by decide)⟩
def source70 (i : Fin 4) : Fin 4 := ⟨sourceData70.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree70 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 (.cutY 14336 .empty (.cutX 9216 .empty (.cutY 15360 .empty (.cutX 9728 .empty (.cutY 15872 (.cutX 9984 .empty (.cutY 15616 .full .empty)) .empty))))) .empty)) (.cutY 12288 (.cutX 14336 .empty (.cutY 10240 (.cutX 15360 .empty (.cutY 9216 .empty (.cutX 15872 (.cutY 9728 .empty (.cutX 15616 (.cutY 9984 .empty .full) .empty)) .empty))) .empty)) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 (.cutY 22528 .empty (.cutX 17408 (.cutY 23552 (.cutX 16896 .empty (.cutY 23040 (.cutX 17152 .empty (.cutY 22784 .full .empty)) .empty)) .empty) .empty)) .empty)) (.cutY 20480 (.cutX 22528 .empty (.cutY 18432 (.cutX 23552 (.cutY 17408 (.cutX 23040 (.cutY 16896 .empty (.cutX 22784 (.cutY 17152 .empty .full) .empty)) .empty) .empty) .empty) .empty)) .empty)) .empty) .empty)))

theorem metadata70 : 0<200205545 ∧ 39<128 ∧ 60<128 ∧ 0<4 ∧
    3531/4160=0 ∧ 3531%4160=3531 ∧ ∀ i, (leaves70 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData70).mp
    (by decide +kernel)

theorem sourceChecked70_0 : ∀ i : Fin 4,
    (fun i => output70 i = raw70 (source70 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked70 : ∀ i : Fin 4, (fun i => output70 i = raw70 (source70 i)) i :=
  forallFin_of_zero_offset (fun i => output70 i = raw70 (source70 i)) sourceChecked70_0

theorem coverChecked70_0 : ∀ i : Fin 4,
    (fun i => (output70 (cover70 i)).ContainsBox (raw70 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked70 : ∀ i : Fin 4, (fun i => (output70 (cover70 i)).ContainsBox (raw70 i)) i :=
  forallFin_of_zero_offset (fun i => (output70 (cover70 i)).ContainsBox (raw70 i)) coverChecked70_0

theorem treeChecked70 : tree70.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves70 : List.ofFn output70 = tree70.leaves ⟨0,32768,0,32768⟩ := by
  unfold output70
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked70 : gridTreeUnionCheck 32768 raw70 output70 cover70 source70 tree70 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked70, coverChecked70, treeChecked70, treeLeaves70⟩

theorem areaUnits70 : gridUnionAreaUnits output70 = 262144 := by decide +kernel

noncomputable def phaseMass70 : ℝ := singlePhaseMass (200205545/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw70 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass70_eq : phaseMass70 = (40041109/327680000000 : ℝ) := by
  unfold phaseMass70
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw70 output70 cover70 source70
    (gridTreeUnionCheck_sound 32768 raw70 output70 cover70 source70 tree70 checked70)
    _ (by norm_num) _, areaUnits70]
  norm_num

-- Frozen phase 2567, atom 3581, type 0, source (40,61).
def leavesData71 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves71 : Fin 1 → DyadicLeaf := leavesData71.get
def raw71 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 40 61 leaves71 i
def outputData71 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨10240,10496,15616,15872⟩) (.single ⟨15616,15872,10240,10496⟩)) (.node (.single ⟨16896,17152,22272,22528⟩) (.single ⟨22272,22528,16896,17152⟩)))
def output71 : Fin 4 → GridBox := outputData71.get
def coverData71 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData71 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover71 (i : Fin 4) : Fin 4 := ⟨coverData71.get i % 4, Nat.mod_lt _ (by decide)⟩
def source71 (i : Fin 4) : Fin 4 := ⟨sourceData71.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree71 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 .empty (.cutY 14336 .empty (.cutX 11264 (.cutY 15360 .empty (.cutX 10752 (.cutY 15872 (.cutX 10496 (.cutY 15616 .empty .full) .empty) .empty) .empty)) .empty)))) (.cutY 12288 (.cutX 14336 .empty (.cutY 10240 .empty (.cutX 15360 .empty (.cutY 11264 (.cutX 15872 (.cutY 10752 (.cutX 15616 .empty (.cutY 10496 .full .empty)) .empty) .empty) .empty)))) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 (.cutY 22528 (.cutX 17408 (.cutY 21504 .empty (.cutX 16896 .empty (.cutY 22016 .empty (.cutX 17152 (.cutY 22272 .empty .full) .empty)))) .empty) .empty) .empty)) (.cutY 20480 (.cutX 22528 (.cutY 18432 (.cutX 21504 .empty (.cutY 17408 (.cutX 22016 .empty (.cutY 16896 .empty (.cutX 22272 .empty (.cutY 17152 .full .empty)))) .empty)) .empty) .empty) .empty)) .empty) .empty)))

theorem metadata71 : 0<283978761 ∧ 40<128 ∧ 61<128 ∧ 0<4 ∧
    3581/4160=0 ∧ 3581%4160=3581 ∧ ∀ i, (leaves71 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData71).mp
    (by decide +kernel)

theorem sourceChecked71_0 : ∀ i : Fin 4,
    (fun i => output71 i = raw71 (source71 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked71 : ∀ i : Fin 4, (fun i => output71 i = raw71 (source71 i)) i :=
  forallFin_of_zero_offset (fun i => output71 i = raw71 (source71 i)) sourceChecked71_0

theorem coverChecked71_0 : ∀ i : Fin 4,
    (fun i => (output71 (cover71 i)).ContainsBox (raw71 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked71 : ∀ i : Fin 4, (fun i => (output71 (cover71 i)).ContainsBox (raw71 i)) i :=
  forallFin_of_zero_offset (fun i => (output71 (cover71 i)).ContainsBox (raw71 i)) coverChecked71_0

theorem treeChecked71 : tree71.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves71 : List.ofFn output71 = tree71.leaves ⟨0,32768,0,32768⟩ := by
  unfold output71
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked71 : gridTreeUnionCheck 32768 raw71 output71 cover71 source71 tree71 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked71, coverChecked71, treeChecked71, treeLeaves71⟩

theorem areaUnits71 : gridUnionAreaUnits output71 = 262144 := by decide +kernel

noncomputable def phaseMass71 : ℝ := singlePhaseMass (283978761/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw71 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass71_eq : phaseMass71 = (283978761/1638400000000 : ℝ) := by
  unfold phaseMass71
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw71 output71 cover71 source71
    (gridTreeUnionCheck_sound 32768 raw71 output71 cover71 source71 tree71 checked71)
    _ (by norm_num) _, areaUnits71]
  norm_num

-- Frozen phase 2568, atom 7635, type 1, source (38,55).
def leavesData72 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves72 : Fin 4 → DyadicLeaf := leavesData72.get
def raw72 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 38 55 leaves72 i
def outputData72 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨9728,9856,14080,14208⟩) (.single ⟨9728,9856,14208,14336⟩)) (.node (.single ⟨9856,9984,14080,14208⟩) (.single ⟨9856,9984,14208,14336⟩))) (.node (.node (.single ⟨14080,14208,9728,9856⟩) (.single ⟨14080,14208,9856,9984⟩)) (.node (.single ⟨14208,14336,9728,9856⟩) (.single ⟨14208,14336,9856,9984⟩)))) (.node (.node (.node (.single ⟨18432,18560,22784,22912⟩) (.single ⟨18432,18560,22912,23040⟩)) (.node (.single ⟨18560,18688,22784,22912⟩) (.single ⟨18560,18688,22912,23040⟩))) (.node (.node (.single ⟨22784,22912,18432,18560⟩) (.single ⟨22784,22912,18560,18688⟩)) (.node (.single ⟨22912,23040,18432,18560⟩) (.single ⟨22912,23040,18560,18688⟩)))))
def output72 : Fin 16 → GridBox := outputData72.get
def coverData72 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData72 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover72 (i : Fin 16) : Fin 16 := ⟨coverData72.get i % 16, Nat.mod_lt _ (by decide)⟩
def source72 (i : Fin 16) : Fin 16 := ⟨sourceData72.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree72 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 (.cutY 14336 (.cutX 9216 .empty (.cutY 13312 .empty (.cutX 9728 .empty (.cutY 13824 .empty (.cutX 9984 (.cutY 14080 .empty (.cutX 9856 (.cutY 14208 .full .full) (.cutY 14208 .full .full))) .empty))))) .empty) .empty)) (.cutY 12288 (.cutX 14336 (.cutY 10240 (.cutX 13312 .empty (.cutY 9216 .empty (.cutX 13824 .empty (.cutY 9728 .empty (.cutX 14080 .empty (.cutY 9984 (.cutX 14208 (.cutY 9856 .full .full) (.cutY 9856 .full .full)) .empty)))))) .empty) .empty) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 .empty (.cutY 22528 .empty (.cutX 19456 (.cutY 23552 (.cutX 18944 (.cutY 23040 (.cutX 18688 (.cutY 22784 .empty (.cutX 18560 (.cutY 22912 .full .full) (.cutY 22912 .full .full))) .empty) .empty) .empty) .empty) .empty)))) (.cutY 20480 (.cutX 22528 .empty (.cutY 18432 .empty (.cutX 23552 (.cutY 19456 (.cutX 23040 (.cutY 18944 (.cutX 22784 .empty (.cutY 18688 (.cutX 22912 (.cutY 18560 .full .full) (.cutY 18560 .full .full)) .empty)) .empty) .empty) .empty) .empty))) .empty)) .empty) .empty)))

theorem metadata72 : 0<134822691 ∧ 38<128 ∧ 55<128 ∧ 1<4 ∧
    7635/4160=1 ∧ 7635%4160=3475 ∧ ∀ i, (leaves72 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData72).mp
    (by decide +kernel)

theorem sourceChecked72_0 : ∀ i : Fin 16,
    (fun i => output72 i = raw72 (source72 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked72 : ∀ i : Fin 16, (fun i => output72 i = raw72 (source72 i)) i :=
  forallFin_of_zero_offset (fun i => output72 i = raw72 (source72 i)) sourceChecked72_0

theorem coverChecked72_0 : ∀ i : Fin 16,
    (fun i => (output72 (cover72 i)).ContainsBox (raw72 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked72 : ∀ i : Fin 16, (fun i => (output72 (cover72 i)).ContainsBox (raw72 i)) i :=
  forallFin_of_zero_offset (fun i => (output72 (cover72 i)).ContainsBox (raw72 i)) coverChecked72_0

theorem treeChecked72 : tree72.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves72 : List.ofFn output72 = tree72.leaves ⟨0,32768,0,32768⟩ := by
  unfold output72
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked72 : gridTreeUnionCheck 32768 raw72 output72 cover72 source72 tree72 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked72, coverChecked72, treeChecked72, treeLeaves72⟩

theorem areaUnits72 : gridUnionAreaUnits output72 = 262144 := by decide +kernel

noncomputable def phaseMass72 : ℝ := singlePhaseMass (134822691/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw72 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass72_eq : phaseMass72 = (134822691/1638400000000 : ℝ) := by
  unfold phaseMass72
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw72 output72 cover72 source72
    (gridTreeUnionCheck_sound 32768 raw72 output72 cover72 source72 tree72 checked72)
    _ (by norm_num) _, areaUnits72]
  norm_num

-- Frozen phase 2569, atom 3060, type 0, source (31,53).
def leavesData73 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves73 : Fin 1 → DyadicLeaf := leavesData73.get
def raw73 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 31 53 leaves73 i
def outputData73 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨7936,8192,13568,13824⟩) (.single ⟨13568,13824,7936,8192⟩)) (.node (.single ⟨18944,19200,24576,24832⟩) (.single ⟨24576,24832,18944,19200⟩)))
def output73 : Fin 4 → GridBox := outputData73.get
def coverData73 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData73 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover73 (i : Fin 4) : Fin 4 := ⟨coverData73.get i % 4, Nat.mod_lt _ (by decide)⟩
def source73 (i : Fin 4) : Fin 4 := ⟨sourceData73.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree73 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 .empty (.cutY 14336 (.cutX 7168 .empty (.cutY 13312 .empty (.cutX 7680 .empty (.cutY 13824 (.cutX 7936 .empty (.cutY 13568 .empty .full)) .empty)))) .empty))))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 (.cutY 6144 .empty (.cutX 13312 .empty (.cutY 7168 .empty (.cutX 13824 (.cutY 7680 .empty (.cutX 13568 .empty (.cutY 7936 .empty .full))) .empty)))) .empty))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 .empty (.cutY 26624 (.cutX 19456 (.cutY 25600 (.cutX 18944 .empty (.cutY 25088 (.cutX 19200 (.cutY 24832 .full .empty) .empty) .empty)) .empty) .empty) .empty)) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 (.cutY 18432 .empty (.cutX 25600 (.cutY 19456 (.cutX 25088 (.cutY 18944 .empty (.cutX 24832 (.cutY 19200 .full .empty) .empty)) .empty) .empty) .empty)) .empty) .empty) .empty) .empty))))

theorem metadata73 : 0<300263580 ∧ 31<128 ∧ 53<128 ∧ 0<4 ∧
    3060/4160=0 ∧ 3060%4160=3060 ∧ ∀ i, (leaves73 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData73).mp
    (by decide +kernel)

theorem sourceChecked73_0 : ∀ i : Fin 4,
    (fun i => output73 i = raw73 (source73 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked73 : ∀ i : Fin 4, (fun i => output73 i = raw73 (source73 i)) i :=
  forallFin_of_zero_offset (fun i => output73 i = raw73 (source73 i)) sourceChecked73_0

theorem coverChecked73_0 : ∀ i : Fin 4,
    (fun i => (output73 (cover73 i)).ContainsBox (raw73 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked73 : ∀ i : Fin 4, (fun i => (output73 (cover73 i)).ContainsBox (raw73 i)) i :=
  forallFin_of_zero_offset (fun i => (output73 (cover73 i)).ContainsBox (raw73 i)) coverChecked73_0

theorem treeChecked73 : tree73.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves73 : List.ofFn output73 = tree73.leaves ⟨0,32768,0,32768⟩ := by
  unfold output73
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked73 : gridTreeUnionCheck 32768 raw73 output73 cover73 source73 tree73 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked73, coverChecked73, treeChecked73, treeLeaves73⟩

theorem areaUnits73 : gridUnionAreaUnits output73 = 262144 := by decide +kernel

noncomputable def phaseMass73 : ℝ := singlePhaseMass (300263580/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw73 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass73_eq : phaseMass73 = (15013179/81920000000 : ℝ) := by
  unfold phaseMass73
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw73 output73 cover73 source73
    (gridTreeUnionCheck_sound 32768 raw73 output73 cover73 source73 tree73 checked73)
    _ (by norm_num) _, areaUnits73]
  norm_num

-- Frozen phase 2570, atom 883, type 0, source (7,36).
def leavesData74 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves74 : Fin 1 → DyadicLeaf := leavesData74.get
def raw74 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 7 36 leaves74 i
def outputData74 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨1792,2048,9216,9472⟩) (.single ⟨9216,9472,1792,2048⟩)) (.node (.single ⟨23296,23552,30720,30976⟩) (.single ⟨30720,30976,23296,23552⟩)))
def output74 : Fin 4 → GridBox := outputData74.get
def coverData74 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData74 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover74 (i : Fin 4) : Fin 4 := ⟨coverData74.get i % 4, Nat.mod_lt _ (by decide)⟩
def source74 (i : Fin 4) : Fin 4 := ⟨sourceData74.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree74 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 (.cutY 10240 (.cutX 1024 .empty (.cutY 9216 .empty (.cutX 1536 .empty (.cutY 9728 (.cutX 1792 .empty (.cutY 9472 .full .empty)) .empty)))) .empty) .empty) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 (.cutX 9216 .empty (.cutY 1024 .empty (.cutX 9728 (.cutY 1536 .empty (.cutX 9472 (.cutY 1792 .empty .full) .empty)) .empty))) .empty) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 .empty (.cutX 23552 (.cutY 31744 (.cutX 23040 .empty (.cutY 31232 (.cutX 23296 .empty (.cutY 30976 .full .empty)) .empty)) .empty) .empty)))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 .empty (.cutY 22528 .empty (.cutX 31744 (.cutY 23552 (.cutX 31232 (.cutY 23040 .empty (.cutX 30976 (.cutY 23296 .empty .full) .empty)) .empty) .empty) .empty))))) .empty))))

theorem metadata74 : 0<523383676 ∧ 7<128 ∧ 36<128 ∧ 0<4 ∧
    883/4160=0 ∧ 883%4160=883 ∧ ∀ i, (leaves74 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData74).mp
    (by decide +kernel)

theorem sourceChecked74_0 : ∀ i : Fin 4,
    (fun i => output74 i = raw74 (source74 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked74 : ∀ i : Fin 4, (fun i => output74 i = raw74 (source74 i)) i :=
  forallFin_of_zero_offset (fun i => output74 i = raw74 (source74 i)) sourceChecked74_0

theorem coverChecked74_0 : ∀ i : Fin 4,
    (fun i => (output74 (cover74 i)).ContainsBox (raw74 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked74 : ∀ i : Fin 4, (fun i => (output74 (cover74 i)).ContainsBox (raw74 i)) i :=
  forallFin_of_zero_offset (fun i => (output74 (cover74 i)).ContainsBox (raw74 i)) coverChecked74_0

theorem treeChecked74 : tree74.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves74 : List.ofFn output74 = tree74.leaves ⟨0,32768,0,32768⟩ := by
  unfold output74
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked74 : gridTreeUnionCheck 32768 raw74 output74 cover74 source74 tree74 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked74, coverChecked74, treeChecked74, treeLeaves74⟩

theorem areaUnits74 : gridUnionAreaUnits output74 = 262144 := by decide +kernel

noncomputable def phaseMass74 : ℝ := singlePhaseMass (523383676/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw74 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass74_eq : phaseMass74 = (130845919/409600000000 : ℝ) := by
  unfold phaseMass74
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw74 output74 cover74 source74
    (gridTreeUnionCheck_sound 32768 raw74 output74 cover74 source74 tree74 checked74)
    _ (by norm_num) _, areaUnits74]
  norm_num

-- Frozen phase 2571, atom 2203, type 0, source (20,43).
def leavesData75 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves75 : Fin 1 → DyadicLeaf := leavesData75.get
def raw75 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 20 43 leaves75 i
def outputData75 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨5120,5376,11008,11264⟩) (.single ⟨11008,11264,5120,5376⟩)) (.node (.single ⟨21504,21760,27392,27648⟩) (.single ⟨27392,27648,21504,21760⟩)))
def output75 : Fin 4 → GridBox := outputData75.get
def coverData75 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData75 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover75 (i : Fin 4) : Fin 4 := ⟨coverData75.get i % 4, Nat.mod_lt _ (by decide)⟩
def source75 (i : Fin 4) : Fin 4 := ⟨sourceData75.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree75 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 (.cutY 10240 .empty (.cutX 5120 .empty (.cutY 11264 (.cutX 5632 (.cutY 10752 .empty (.cutX 5376 (.cutY 11008 .empty .full) .empty)) .empty) .empty))) .empty) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 .empty (.cutY 6144 (.cutX 11264 (.cutY 5120 .empty (.cutX 10752 .empty (.cutY 5632 (.cutX 11008 .empty (.cutY 5376 .full .empty)) .empty))) .empty) .empty))) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 (.cutY 26624 .empty (.cutX 21504 .empty (.cutY 27648 (.cutX 22016 (.cutY 27136 .empty (.cutX 21760 (.cutY 27392 .empty .full) .empty)) .empty) .empty))) .empty) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 .empty (.cutY 22528 (.cutX 27648 (.cutY 21504 .empty (.cutX 27136 .empty (.cutY 22016 (.cutX 27392 .empty (.cutY 21760 .full .empty)) .empty))) .empty) .empty))) .empty) .empty))))

theorem metadata75 : 0<73667111 ∧ 20<128 ∧ 43<128 ∧ 0<4 ∧
    2203/4160=0 ∧ 2203%4160=2203 ∧ ∀ i, (leaves75 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData75).mp
    (by decide +kernel)

theorem sourceChecked75_0 : ∀ i : Fin 4,
    (fun i => output75 i = raw75 (source75 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked75 : ∀ i : Fin 4, (fun i => output75 i = raw75 (source75 i)) i :=
  forallFin_of_zero_offset (fun i => output75 i = raw75 (source75 i)) sourceChecked75_0

theorem coverChecked75_0 : ∀ i : Fin 4,
    (fun i => (output75 (cover75 i)).ContainsBox (raw75 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked75 : ∀ i : Fin 4, (fun i => (output75 (cover75 i)).ContainsBox (raw75 i)) i :=
  forallFin_of_zero_offset (fun i => (output75 (cover75 i)).ContainsBox (raw75 i)) coverChecked75_0

theorem treeChecked75 : tree75.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves75 : List.ofFn output75 = tree75.leaves ⟨0,32768,0,32768⟩ := by
  unfold output75
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked75 : gridTreeUnionCheck 32768 raw75 output75 cover75 source75 tree75 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked75, coverChecked75, treeChecked75, treeLeaves75⟩

theorem areaUnits75 : gridUnionAreaUnits output75 = 262144 := by decide +kernel

noncomputable def phaseMass75 : ℝ := singlePhaseMass (73667111/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw75 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass75_eq : phaseMass75 = (73667111/1638400000000 : ℝ) := by
  unfold phaseMass75
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw75 output75 cover75 source75
    (gridTreeUnionCheck_sound 32768 raw75 output75 cover75 source75 tree75 checked75)
    _ (by norm_num) _, areaUnits75]
  norm_num

-- Frozen phase 2572, atom 3629, type 0, source (41,62).
def leavesData76 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves76 : Fin 1 → DyadicLeaf := leavesData76.get
def raw76 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 41 62 leaves76 i
def outputData76 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨10496,10752,15872,16128⟩) (.single ⟨15872,16128,10496,10752⟩)) (.node (.single ⟨16640,16896,22016,22272⟩) (.single ⟨22016,22272,16640,16896⟩)))
def output76 : Fin 4 → GridBox := outputData76.get
def coverData76 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData76 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover76 (i : Fin 4) : Fin 4 := ⟨coverData76.get i % 4, Nat.mod_lt _ (by decide)⟩
def source76 (i : Fin 4) : Fin 4 := ⟨sourceData76.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree76 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 .empty (.cutY 14336 .empty (.cutX 11264 (.cutY 15360 .empty (.cutX 10752 (.cutY 15872 .empty (.cutX 10496 .empty (.cutY 16128 .full .empty))) .empty)) .empty)))) (.cutY 12288 (.cutX 14336 .empty (.cutY 10240 .empty (.cutX 15360 .empty (.cutY 11264 (.cutX 15872 .empty (.cutY 10752 (.cutX 16128 (.cutY 10496 .empty .full) .empty) .empty)) .empty)))) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 (.cutY 22528 (.cutX 17408 (.cutY 21504 .empty (.cutX 16896 (.cutY 22016 .empty (.cutX 16640 .empty (.cutY 22272 .full .empty))) .empty)) .empty) .empty) .empty)) (.cutY 20480 (.cutX 22528 (.cutY 18432 (.cutX 21504 .empty (.cutY 17408 (.cutX 22016 .empty (.cutY 16896 (.cutX 22272 (.cutY 16640 .empty .full) .empty) .empty)) .empty)) .empty) .empty) .empty)) .empty) .empty)))

theorem metadata76 : 0<283978761 ∧ 41<128 ∧ 62<128 ∧ 0<4 ∧
    3629/4160=0 ∧ 3629%4160=3629 ∧ ∀ i, (leaves76 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData76).mp
    (by decide +kernel)

theorem sourceChecked76_0 : ∀ i : Fin 4,
    (fun i => output76 i = raw76 (source76 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked76 : ∀ i : Fin 4, (fun i => output76 i = raw76 (source76 i)) i :=
  forallFin_of_zero_offset (fun i => output76 i = raw76 (source76 i)) sourceChecked76_0

theorem coverChecked76_0 : ∀ i : Fin 4,
    (fun i => (output76 (cover76 i)).ContainsBox (raw76 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked76 : ∀ i : Fin 4, (fun i => (output76 (cover76 i)).ContainsBox (raw76 i)) i :=
  forallFin_of_zero_offset (fun i => (output76 (cover76 i)).ContainsBox (raw76 i)) coverChecked76_0

theorem treeChecked76 : tree76.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves76 : List.ofFn output76 = tree76.leaves ⟨0,32768,0,32768⟩ := by
  unfold output76
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked76 : gridTreeUnionCheck 32768 raw76 output76 cover76 source76 tree76 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked76, coverChecked76, treeChecked76, treeLeaves76⟩

theorem areaUnits76 : gridUnionAreaUnits output76 = 262144 := by decide +kernel

noncomputable def phaseMass76 : ℝ := singlePhaseMass (283978761/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw76 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass76_eq : phaseMass76 = (283978761/1638400000000 : ℝ) := by
  unfold phaseMass76
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw76 output76 cover76 source76
    (gridTreeUnionCheck_sound 32768 raw76 output76 cover76 source76 tree76 checked76)
    _ (by norm_num) _, areaUnits76]
  norm_num

-- Frozen phase 2573, atom 1928, type 0, source (17,41).
def leavesData77 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves77 : Fin 1 → DyadicLeaf := leavesData77.get
def raw77 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 17 41 leaves77 i
def outputData77 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨4352,4608,10496,10752⟩) (.single ⟨10496,10752,4352,4608⟩)) (.node (.single ⟨22016,22272,28160,28416⟩) (.single ⟨28160,28416,22016,22272⟩)))
def output77 : Fin 4 → GridBox := outputData77.get
def coverData77 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData77 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover77 (i : Fin 4) : Fin 4 := ⟨coverData77.get i % 4, Nat.mod_lt _ (by decide)⟩
def source77 (i : Fin 4) : Fin 4 := ⟨sourceData77.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree77 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 (.cutY 10240 .empty (.cutX 5120 (.cutY 11264 (.cutX 4608 (.cutY 10752 (.cutX 4352 .empty (.cutY 10496 .empty .full)) .empty) .empty) .empty) .empty)) .empty) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 .empty (.cutY 6144 (.cutX 11264 (.cutY 5120 (.cutX 10752 (.cutY 4608 (.cutX 10496 .empty (.cutY 4352 .empty .full)) .empty) .empty) .empty) .empty) .empty))) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 (.cutY 26624 .empty (.cutX 21504 .empty (.cutY 27648 .empty (.cutX 22016 .empty (.cutY 28160 .empty (.cutX 22272 (.cutY 28416 .full .empty) .empty)))))) .empty) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 .empty (.cutY 22528 (.cutX 27648 .empty (.cutY 21504 .empty (.cutX 28160 .empty (.cutY 22016 .empty (.cutX 28416 (.cutY 22272 .full .empty) .empty))))) .empty))) .empty) .empty))))

theorem metadata77 : 0<73667111 ∧ 17<128 ∧ 41<128 ∧ 0<4 ∧
    1928/4160=0 ∧ 1928%4160=1928 ∧ ∀ i, (leaves77 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData77).mp
    (by decide +kernel)

theorem sourceChecked77_0 : ∀ i : Fin 4,
    (fun i => output77 i = raw77 (source77 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked77 : ∀ i : Fin 4, (fun i => output77 i = raw77 (source77 i)) i :=
  forallFin_of_zero_offset (fun i => output77 i = raw77 (source77 i)) sourceChecked77_0

theorem coverChecked77_0 : ∀ i : Fin 4,
    (fun i => (output77 (cover77 i)).ContainsBox (raw77 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked77 : ∀ i : Fin 4, (fun i => (output77 (cover77 i)).ContainsBox (raw77 i)) i :=
  forallFin_of_zero_offset (fun i => (output77 (cover77 i)).ContainsBox (raw77 i)) coverChecked77_0

theorem treeChecked77 : tree77.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves77 : List.ofFn output77 = tree77.leaves ⟨0,32768,0,32768⟩ := by
  unfold output77
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked77 : gridTreeUnionCheck 32768 raw77 output77 cover77 source77 tree77 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked77, coverChecked77, treeChecked77, treeLeaves77⟩

theorem areaUnits77 : gridUnionAreaUnits output77 = 262144 := by decide +kernel

noncomputable def phaseMass77 : ℝ := singlePhaseMass (73667111/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw77 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass77_eq : phaseMass77 = (73667111/1638400000000 : ℝ) := by
  unfold phaseMass77
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw77 output77 cover77 source77
    (gridTreeUnionCheck_sound 32768 raw77 output77 cover77 source77 tree77 checked77)
    _ (by norm_num) _, areaUnits77]
  norm_num

-- Frozen phase 2574, atom 1735, type 0, source (15,40).
def leavesData78 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves78 : Fin 1 → DyadicLeaf := leavesData78.get
def raw78 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 15 40 leaves78 i
def outputData78 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨3840,4096,10240,10496⟩) (.single ⟨10240,10496,3840,4096⟩)) (.node (.single ⟨22272,22528,28672,28928⟩) (.single ⟨28672,28928,22272,22528⟩)))
def output78 : Fin 4 → GridBox := outputData78.get
def coverData78 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData78 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover78 (i : Fin 4) : Fin 4 := ⟨coverData78.get i % 4, Nat.mod_lt _ (by decide)⟩
def source78 (i : Fin 4) : Fin 4 := ⟨sourceData78.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree78 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 .empty (.cutY 10240 .empty (.cutX 3072 .empty (.cutY 11264 (.cutX 3584 .empty (.cutY 10752 (.cutX 3840 .empty (.cutY 10496 .full .empty)) .empty)) .empty)))) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 .empty (.cutY 2048 .empty (.cutX 11264 (.cutY 3072 .empty (.cutX 10752 (.cutY 3584 .empty (.cutX 10496 (.cutY 3840 .empty .full) .empty)) .empty)) .empty))) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 (.cutY 30720 (.cutX 21504 .empty (.cutY 29696 (.cutX 22016 .empty (.cutY 29184 (.cutX 22272 .empty (.cutY 28928 .full .empty)) .empty)) .empty)) .empty) .empty)))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 (.cutY 22528 (.cutX 29696 (.cutY 21504 .empty (.cutX 29184 (.cutY 22016 .empty (.cutX 28928 (.cutY 22272 .empty .full) .empty)) .empty)) .empty) .empty) .empty))) .empty))))

theorem metadata78 : 0<296697202 ∧ 15<128 ∧ 40<128 ∧ 0<4 ∧
    1735/4160=0 ∧ 1735%4160=1735 ∧ ∀ i, (leaves78 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData78).mp
    (by decide +kernel)

theorem sourceChecked78_0 : ∀ i : Fin 4,
    (fun i => output78 i = raw78 (source78 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked78 : ∀ i : Fin 4, (fun i => output78 i = raw78 (source78 i)) i :=
  forallFin_of_zero_offset (fun i => output78 i = raw78 (source78 i)) sourceChecked78_0

theorem coverChecked78_0 : ∀ i : Fin 4,
    (fun i => (output78 (cover78 i)).ContainsBox (raw78 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked78 : ∀ i : Fin 4, (fun i => (output78 (cover78 i)).ContainsBox (raw78 i)) i :=
  forallFin_of_zero_offset (fun i => (output78 (cover78 i)).ContainsBox (raw78 i)) coverChecked78_0

theorem treeChecked78 : tree78.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves78 : List.ofFn output78 = tree78.leaves ⟨0,32768,0,32768⟩ := by
  unfold output78
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked78 : gridTreeUnionCheck 32768 raw78 output78 cover78 source78 tree78 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked78, coverChecked78, treeChecked78, treeLeaves78⟩

theorem areaUnits78 : gridUnionAreaUnits output78 = 262144 := by decide +kernel

noncomputable def phaseMass78 : ℝ := singlePhaseMass (296697202/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw78 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass78_eq : phaseMass78 = (148348601/819200000000 : ℝ) := by
  unfold phaseMass78
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw78 output78 cover78 source78
    (gridTreeUnionCheck_sound 32768 raw78 output78 cover78 source78 tree78 checked78)
    _ (by norm_num) _, areaUnits78]
  norm_num

-- Frozen phase 2575, atom 1534, type 0, source (13,39).
def leavesData79 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves79 : Fin 1 → DyadicLeaf := leavesData79.get
def raw79 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 13 39 leaves79 i
def outputData79 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨3328,3584,9984,10240⟩) (.single ⟨9984,10240,3328,3584⟩)) (.node (.single ⟨22528,22784,29184,29440⟩) (.single ⟨29184,29440,22528,22784⟩)))
def output79 : Fin 4 → GridBox := outputData79.get
def coverData79 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData79 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover79 (i : Fin 4) : Fin 4 := ⟨coverData79.get i % 4, Nat.mod_lt _ (by decide)⟩
def source79 (i : Fin 4) : Fin 4 := ⟨sourceData79.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree79 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 .empty (.cutY 10240 (.cutX 3072 .empty (.cutY 9216 .empty (.cutX 3584 (.cutY 9728 .empty (.cutX 3328 .empty (.cutY 9984 .empty .full))) .empty))) .empty)) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 .empty (.cutX 9216 .empty (.cutY 3072 .empty (.cutX 9728 .empty (.cutY 3584 (.cutX 9984 .empty (.cutY 3328 .empty .full)) .empty))))) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 (.cutX 23552 (.cutY 29696 (.cutX 23040 (.cutY 29184 .empty (.cutX 22784 (.cutY 29440 .full .empty) .empty)) .empty) .empty) .empty) .empty))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 (.cutY 22528 .empty (.cutX 29696 (.cutY 23552 (.cutX 29184 .empty (.cutY 23040 (.cutX 29440 (.cutY 22784 .full .empty) .empty) .empty)) .empty) .empty)) .empty))) .empty))))

theorem metadata79 : 0<290391823 ∧ 13<128 ∧ 39<128 ∧ 0<4 ∧
    1534/4160=0 ∧ 1534%4160=1534 ∧ ∀ i, (leaves79 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData79).mp
    (by decide +kernel)

theorem sourceChecked79_0 : ∀ i : Fin 4,
    (fun i => output79 i = raw79 (source79 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked79 : ∀ i : Fin 4, (fun i => output79 i = raw79 (source79 i)) i :=
  forallFin_of_zero_offset (fun i => output79 i = raw79 (source79 i)) sourceChecked79_0

theorem coverChecked79_0 : ∀ i : Fin 4,
    (fun i => (output79 (cover79 i)).ContainsBox (raw79 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked79 : ∀ i : Fin 4, (fun i => (output79 (cover79 i)).ContainsBox (raw79 i)) i :=
  forallFin_of_zero_offset (fun i => (output79 (cover79 i)).ContainsBox (raw79 i)) coverChecked79_0

theorem treeChecked79 : tree79.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves79 : List.ofFn output79 = tree79.leaves ⟨0,32768,0,32768⟩ := by
  unfold output79
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked79 : gridTreeUnionCheck 32768 raw79 output79 cover79 source79 tree79 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked79, coverChecked79, treeChecked79, treeLeaves79⟩

theorem areaUnits79 : gridUnionAreaUnits output79 = 262144 := by decide +kernel

noncomputable def phaseMass79 : ℝ := singlePhaseMass (290391823/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw79 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass79_eq : phaseMass79 = (290391823/1638400000000 : ℝ) := by
  unfold phaseMass79
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw79 output79 cover79 source79
    (gridTreeUnionCheck_sound 32768 raw79 output79 cover79 source79 tree79 checked79)
    _ (by norm_num) _, areaUnits79]
  norm_num

-- Frozen phase 2576, atom 161, type 0, source (1,34).
def leavesData80 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves80 : Fin 1 → DyadicLeaf := leavesData80.get
def raw80 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 1 34 leaves80 i
def outputData80 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨256,512,8704,8960⟩) (.single ⟨8704,8960,256,512⟩)) (.node (.single ⟨23808,24064,32256,32512⟩) (.single ⟨32256,32512,23808,24064⟩)))
def output80 : Fin 4 → GridBox := outputData80.get
def coverData80 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData80 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover80 (i : Fin 4) : Fin 4 := ⟨coverData80.get i % 4, Nat.mod_lt _ (by decide)⟩
def source80 (i : Fin 4) : Fin 4 := ⟨sourceData80.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree80 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 (.cutY 10240 (.cutX 1024 (.cutY 9216 (.cutX 512 (.cutY 8704 .empty (.cutX 256 .empty (.cutY 8960 .full .empty))) .empty) .empty) .empty) .empty) .empty) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 (.cutX 9216 (.cutY 1024 (.cutX 8704 .empty (.cutY 512 (.cutX 8960 (.cutY 256 .empty .full) .empty) .empty)) .empty) .empty) .empty) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 .empty (.cutX 23552 .empty (.cutY 31744 .empty (.cutX 24064 (.cutY 32256 .empty (.cutX 23808 .empty (.cutY 32512 .full .empty))) .empty)))))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 .empty (.cutY 22528 .empty (.cutX 31744 .empty (.cutY 23552 .empty (.cutX 32256 .empty (.cutY 24064 (.cutX 32512 (.cutY 23808 .empty .full) .empty) .empty)))))))) .empty))))

theorem metadata80 : 0<523383676 ∧ 1<128 ∧ 34<128 ∧ 0<4 ∧
    161/4160=0 ∧ 161%4160=161 ∧ ∀ i, (leaves80 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData80).mp
    (by decide +kernel)

theorem sourceChecked80_0 : ∀ i : Fin 4,
    (fun i => output80 i = raw80 (source80 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked80 : ∀ i : Fin 4, (fun i => output80 i = raw80 (source80 i)) i :=
  forallFin_of_zero_offset (fun i => output80 i = raw80 (source80 i)) sourceChecked80_0

theorem coverChecked80_0 : ∀ i : Fin 4,
    (fun i => (output80 (cover80 i)).ContainsBox (raw80 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked80 : ∀ i : Fin 4, (fun i => (output80 (cover80 i)).ContainsBox (raw80 i)) i :=
  forallFin_of_zero_offset (fun i => (output80 (cover80 i)).ContainsBox (raw80 i)) coverChecked80_0

theorem treeChecked80 : tree80.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves80 : List.ofFn output80 = tree80.leaves ⟨0,32768,0,32768⟩ := by
  unfold output80
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked80 : gridTreeUnionCheck 32768 raw80 output80 cover80 source80 tree80 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked80, coverChecked80, treeChecked80, treeLeaves80⟩

theorem areaUnits80 : gridUnionAreaUnits output80 = 262144 := by decide +kernel

noncomputable def phaseMass80 : ℝ := singlePhaseMass (523383676/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw80 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass80_eq : phaseMass80 = (130845919/409600000000 : ℝ) := by
  unfold phaseMass80
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw80 output80 cover80 source80
    (gridTreeUnionCheck_sound 32768 raw80 output80 cover80 source80 tree80 checked80)
    _ (by norm_num) _, areaUnits80]
  norm_num

-- Frozen phase 2577, atom 768, type 0, source (6,36).
def leavesData81 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves81 : Fin 1 → DyadicLeaf := leavesData81.get
def raw81 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 6 36 leaves81 i
def outputData81 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨1536,1792,9216,9472⟩) (.single ⟨9216,9472,1536,1792⟩)) (.node (.single ⟨23296,23552,30976,31232⟩) (.single ⟨30976,31232,23296,23552⟩)))
def output81 : Fin 4 → GridBox := outputData81.get
def coverData81 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData81 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover81 (i : Fin 4) : Fin 4 := ⟨coverData81.get i % 4, Nat.mod_lt _ (by decide)⟩
def source81 (i : Fin 4) : Fin 4 := ⟨sourceData81.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree81 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 (.cutY 10240 (.cutX 1024 .empty (.cutY 9216 .empty (.cutX 1536 .empty (.cutY 9728 (.cutX 1792 (.cutY 9472 .full .empty) .empty) .empty)))) .empty) .empty) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 (.cutX 9216 .empty (.cutY 1024 .empty (.cutX 9728 (.cutY 1536 .empty (.cutX 9472 (.cutY 1792 .full .empty) .empty)) .empty))) .empty) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 .empty (.cutX 23552 (.cutY 31744 (.cutX 23040 .empty (.cutY 31232 (.cutX 23296 .empty (.cutY 30976 .empty .full)) .empty)) .empty) .empty)))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 .empty (.cutY 22528 .empty (.cutX 31744 (.cutY 23552 (.cutX 31232 (.cutY 23040 .empty (.cutX 30976 .empty (.cutY 23296 .empty .full))) .empty) .empty) .empty))))) .empty))))

theorem metadata81 : 0<523383676 ∧ 6<128 ∧ 36<128 ∧ 0<4 ∧
    768/4160=0 ∧ 768%4160=768 ∧ ∀ i, (leaves81 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData81).mp
    (by decide +kernel)

theorem sourceChecked81_0 : ∀ i : Fin 4,
    (fun i => output81 i = raw81 (source81 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked81 : ∀ i : Fin 4, (fun i => output81 i = raw81 (source81 i)) i :=
  forallFin_of_zero_offset (fun i => output81 i = raw81 (source81 i)) sourceChecked81_0

theorem coverChecked81_0 : ∀ i : Fin 4,
    (fun i => (output81 (cover81 i)).ContainsBox (raw81 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked81 : ∀ i : Fin 4, (fun i => (output81 (cover81 i)).ContainsBox (raw81 i)) i :=
  forallFin_of_zero_offset (fun i => (output81 (cover81 i)).ContainsBox (raw81 i)) coverChecked81_0

theorem treeChecked81 : tree81.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves81 : List.ofFn output81 = tree81.leaves ⟨0,32768,0,32768⟩ := by
  unfold output81
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked81 : gridTreeUnionCheck 32768 raw81 output81 cover81 source81 tree81 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked81, coverChecked81, treeChecked81, treeLeaves81⟩

theorem areaUnits81 : gridUnionAreaUnits output81 = 262144 := by decide +kernel

noncomputable def phaseMass81 : ℝ := singlePhaseMass (523383676/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw81 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass81_eq : phaseMass81 = (130845919/409600000000 : ℝ) := by
  unfold phaseMass81
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw81 output81 cover81 source81
    (gridTreeUnionCheck_sound 32768 raw81 output81 cover81 source81 tree81 checked81)
    _ (by norm_num) _, areaUnits81]
  norm_num

-- Frozen phase 2578, atom 410, type 0, source (3,35).
def leavesData82 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves82 : Fin 1 → DyadicLeaf := leavesData82.get
def raw82 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 3 35 leaves82 i
def outputData82 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨768,1024,8960,9216⟩) (.single ⟨8960,9216,768,1024⟩)) (.node (.single ⟨23552,23808,31744,32000⟩) (.single ⟨31744,32000,23552,23808⟩)))
def output82 : Fin 4 → GridBox := outputData82.get
def coverData82 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData82 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover82 (i : Fin 4) : Fin 4 := ⟨coverData82.get i % 4, Nat.mod_lt _ (by decide)⟩
def source82 (i : Fin 4) : Fin 4 := ⟨sourceData82.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree82 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 (.cutY 10240 (.cutX 1024 (.cutY 9216 (.cutX 512 .empty (.cutY 8704 .empty (.cutX 768 .empty (.cutY 8960 .empty .full)))) .empty) .empty) .empty) .empty) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 (.cutX 9216 (.cutY 1024 (.cutX 8704 .empty (.cutY 512 .empty (.cutX 8960 .empty (.cutY 768 .empty .full)))) .empty) .empty) .empty) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 .empty (.cutX 23552 .empty (.cutY 31744 .empty (.cutX 24064 (.cutY 32256 (.cutX 23808 (.cutY 32000 .full .empty) .empty) .empty) .empty)))))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 .empty (.cutY 22528 .empty (.cutX 31744 .empty (.cutY 23552 .empty (.cutX 32256 (.cutY 24064 (.cutX 32000 (.cutY 23808 .full .empty) .empty) .empty) .empty))))))) .empty))))

theorem metadata82 : 0<523383676 ∧ 3<128 ∧ 35<128 ∧ 0<4 ∧
    410/4160=0 ∧ 410%4160=410 ∧ ∀ i, (leaves82 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData82).mp
    (by decide +kernel)

theorem sourceChecked82_0 : ∀ i : Fin 4,
    (fun i => output82 i = raw82 (source82 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked82 : ∀ i : Fin 4, (fun i => output82 i = raw82 (source82 i)) i :=
  forallFin_of_zero_offset (fun i => output82 i = raw82 (source82 i)) sourceChecked82_0

theorem coverChecked82_0 : ∀ i : Fin 4,
    (fun i => (output82 (cover82 i)).ContainsBox (raw82 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked82 : ∀ i : Fin 4, (fun i => (output82 (cover82 i)).ContainsBox (raw82 i)) i :=
  forallFin_of_zero_offset (fun i => (output82 (cover82 i)).ContainsBox (raw82 i)) coverChecked82_0

theorem treeChecked82 : tree82.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves82 : List.ofFn output82 = tree82.leaves ⟨0,32768,0,32768⟩ := by
  unfold output82
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked82 : gridTreeUnionCheck 32768 raw82 output82 cover82 source82 tree82 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked82, coverChecked82, treeChecked82, treeLeaves82⟩

theorem areaUnits82 : gridUnionAreaUnits output82 = 262144 := by decide +kernel

noncomputable def phaseMass82 : ℝ := singlePhaseMass (523383676/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw82 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass82_eq : phaseMass82 = (130845919/409600000000 : ℝ) := by
  unfold phaseMass82
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw82 output82 cover82 source82
    (gridTreeUnionCheck_sound 32768 raw82 output82 cover82 source82 tree82 checked82)
    _ (by norm_num) _, areaUnits82]
  norm_num

-- Frozen phase 2579, atom 6178, type 1, source (18,38).
def leavesData83 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves83 : Fin 4 → DyadicLeaf := leavesData83.get
def raw83 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 18 38 leaves83 i
def outputData83 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨4608,4736,9728,9856⟩) (.single ⟨4608,4736,9856,9984⟩)) (.node (.single ⟨4736,4864,9728,9856⟩) (.single ⟨4736,4864,9856,9984⟩))) (.node (.node (.single ⟨9728,9856,4608,4736⟩) (.single ⟨9728,9856,4736,4864⟩)) (.node (.single ⟨9856,9984,4608,4736⟩) (.single ⟨9856,9984,4736,4864⟩)))) (.node (.node (.node (.single ⟨22784,22912,27904,28032⟩) (.single ⟨22784,22912,28032,28160⟩)) (.node (.single ⟨22912,23040,27904,28032⟩) (.single ⟨22912,23040,28032,28160⟩))) (.node (.node (.single ⟨27904,28032,22784,22912⟩) (.single ⟨27904,28032,22912,23040⟩)) (.node (.single ⟨28032,28160,22784,22912⟩) (.single ⟨28032,28160,22912,23040⟩)))))
def output83 : Fin 16 → GridBox := outputData83.get
def coverData83 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData83 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover83 (i : Fin 16) : Fin 16 := ⟨coverData83.get i % 16, Nat.mod_lt _ (by decide)⟩
def source83 (i : Fin 16) : Fin 16 := ⟨sourceData83.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree83 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 (.cutY 10240 (.cutX 5120 (.cutY 9216 .empty (.cutX 4608 .empty (.cutY 9728 .empty (.cutX 4864 (.cutY 9984 (.cutX 4736 (.cutY 9856 .full .full) (.cutY 9856 .full .full)) .empty) .empty)))) .empty) .empty) .empty) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 (.cutY 6144 (.cutX 9216 .empty (.cutY 5120 (.cutX 9728 .empty (.cutY 4608 .empty (.cutX 9984 (.cutY 4864 (.cutX 9856 (.cutY 4736 .full .full) (.cutY 4736 .full .full)) .empty) .empty))) .empty)) .empty) .empty)) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 .empty (.cutY 26624 .empty (.cutX 23552 (.cutY 27648 .empty (.cutX 23040 (.cutY 28160 (.cutX 22784 .empty (.cutY 27904 .empty (.cutX 22912 (.cutY 28032 .full .full) (.cutY 28032 .full .full)))) .empty) .empty)) .empty))) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 .empty (.cutY 22528 .empty (.cutX 27648 .empty (.cutY 23552 (.cutX 28160 (.cutY 23040 (.cutX 27904 .empty (.cutY 22784 .empty (.cutX 28032 (.cutY 22912 .full .full) (.cutY 22912 .full .full)))) .empty) .empty) .empty))))) .empty) .empty))))

theorem metadata83 : 0<161185172 ∧ 18<128 ∧ 38<128 ∧ 1<4 ∧
    6178/4160=1 ∧ 6178%4160=2018 ∧ ∀ i, (leaves83 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData83).mp
    (by decide +kernel)

theorem sourceChecked83_0 : ∀ i : Fin 16,
    (fun i => output83 i = raw83 (source83 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked83 : ∀ i : Fin 16, (fun i => output83 i = raw83 (source83 i)) i :=
  forallFin_of_zero_offset (fun i => output83 i = raw83 (source83 i)) sourceChecked83_0

theorem coverChecked83_0 : ∀ i : Fin 16,
    (fun i => (output83 (cover83 i)).ContainsBox (raw83 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked83 : ∀ i : Fin 16, (fun i => (output83 (cover83 i)).ContainsBox (raw83 i)) i :=
  forallFin_of_zero_offset (fun i => (output83 (cover83 i)).ContainsBox (raw83 i)) coverChecked83_0

theorem treeChecked83 : tree83.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves83 : List.ofFn output83 = tree83.leaves ⟨0,32768,0,32768⟩ := by
  unfold output83
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked83 : gridTreeUnionCheck 32768 raw83 output83 cover83 source83 tree83 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked83, coverChecked83, treeChecked83, treeLeaves83⟩

theorem areaUnits83 : gridUnionAreaUnits output83 = 262144 := by decide +kernel

noncomputable def phaseMass83 : ℝ := singlePhaseMass (161185172/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw83 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass83_eq : phaseMass83 = (40296293/409600000000 : ℝ) := by
  unfold phaseMass83
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw83 output83 cover83 source83
    (gridTreeUnionCheck_sound 32768 raw83 output83 cover83 source83 tree83 checked83)
    _ (by norm_num) _, areaUnits83]
  norm_num

-- Frozen phase 2580, atom 7006, type 1, source (28,46).
def leavesData84 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves84 : Fin 4 → DyadicLeaf := leavesData84.get
def raw84 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 28 46 leaves84 i
def outputData84 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨7168,7296,11776,11904⟩) (.single ⟨7168,7296,11904,12032⟩)) (.node (.single ⟨7296,7424,11776,11904⟩) (.single ⟨7296,7424,11904,12032⟩))) (.node (.node (.single ⟨11776,11904,7168,7296⟩) (.single ⟨11776,11904,7296,7424⟩)) (.node (.single ⟨11904,12032,7168,7296⟩) (.single ⟨11904,12032,7296,7424⟩)))) (.node (.node (.node (.single ⟨20736,20864,25344,25472⟩) (.single ⟨20736,20864,25472,25600⟩)) (.node (.single ⟨20864,20992,25344,25472⟩) (.single ⟨20864,20992,25472,25600⟩))) (.node (.node (.single ⟨25344,25472,20736,20864⟩) (.single ⟨25344,25472,20864,20992⟩)) (.node (.single ⟨25472,25600,20736,20864⟩) (.single ⟨25472,25600,20864,20992⟩)))))
def output84 : Fin 16 → GridBox := outputData84.get
def coverData84 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData84 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover84 (i : Fin 16) : Fin 16 := ⟨coverData84.get i % 16, Nat.mod_lt _ (by decide)⟩
def source84 (i : Fin 16) : Fin 16 := ⟨sourceData84.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree84 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 .empty (.cutY 10240 .empty (.cutX 7168 .empty (.cutY 11264 .empty (.cutX 7680 (.cutY 11776 .empty (.cutX 7424 (.cutY 12032 (.cutX 7296 (.cutY 11904 .full .full) (.cutY 11904 .full .full)) .empty) .empty)) .empty))))) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 .empty (.cutY 6144 .empty (.cutX 11264 .empty (.cutY 7168 .empty (.cutX 11776 .empty (.cutY 7680 (.cutX 12032 (.cutY 7424 (.cutX 11904 (.cutY 7296 .full .full) (.cutY 7296 .full .full)) .empty) .empty) .empty))))))) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 (.cutY 26624 (.cutX 21504 (.cutY 25600 (.cutX 20992 (.cutY 25088 .empty (.cutX 20736 .empty (.cutY 25344 .empty (.cutX 20864 (.cutY 25472 .full .full) (.cutY 25472 .full .full))))) .empty) .empty) .empty) .empty) .empty) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 (.cutY 22528 (.cutX 25600 (.cutY 21504 (.cutX 25088 .empty (.cutY 20992 (.cutX 25344 .empty (.cutY 20736 .empty (.cutX 25472 (.cutY 20864 .full .full) (.cutY 20864 .full .full)))) .empty)) .empty) .empty) .empty) .empty)) .empty) .empty))))

theorem metadata84 : 0<130629080 ∧ 28<128 ∧ 46<128 ∧ 1<4 ∧
    7006/4160=1 ∧ 7006%4160=2846 ∧ ∀ i, (leaves84 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData84).mp
    (by decide +kernel)

theorem sourceChecked84_0 : ∀ i : Fin 16,
    (fun i => output84 i = raw84 (source84 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked84 : ∀ i : Fin 16, (fun i => output84 i = raw84 (source84 i)) i :=
  forallFin_of_zero_offset (fun i => output84 i = raw84 (source84 i)) sourceChecked84_0

theorem coverChecked84_0 : ∀ i : Fin 16,
    (fun i => (output84 (cover84 i)).ContainsBox (raw84 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked84 : ∀ i : Fin 16, (fun i => (output84 (cover84 i)).ContainsBox (raw84 i)) i :=
  forallFin_of_zero_offset (fun i => (output84 (cover84 i)).ContainsBox (raw84 i)) coverChecked84_0

theorem treeChecked84 : tree84.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves84 : List.ofFn output84 = tree84.leaves ⟨0,32768,0,32768⟩ := by
  unfold output84
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked84 : gridTreeUnionCheck 32768 raw84 output84 cover84 source84 tree84 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked84, coverChecked84, treeChecked84, treeLeaves84⟩

theorem areaUnits84 : gridUnionAreaUnits output84 = 262144 := by decide +kernel

noncomputable def phaseMass84 : ℝ := singlePhaseMass (130629080/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw84 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass84_eq : phaseMass84 = (3265727/40960000000 : ℝ) := by
  unfold phaseMass84
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw84 output84 cover84 source84
    (gridTreeUnionCheck_sound 32768 raw84 output84 cover84 source84 tree84 checked84)
    _ (by norm_num) _, areaUnits84]
  norm_num

-- Frozen phase 2581, atom 3126, type 0, source (32,54).
def leavesData85 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves85 : Fin 1 → DyadicLeaf := leavesData85.get
def raw85 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 32 54 leaves85 i
def outputData85 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨8192,8448,13824,14080⟩) (.single ⟨13824,14080,8192,8448⟩)) (.node (.single ⟨18688,18944,24320,24576⟩) (.single ⟨24320,24576,18688,18944⟩)))
def output85 : Fin 4 → GridBox := outputData85.get
def coverData85 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData85 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover85 (i : Fin 4) : Fin 4 := ⟨coverData85.get i % 4, Nat.mod_lt _ (by decide)⟩
def source85 (i : Fin 4) : Fin 4 := ⟨sourceData85.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree85 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 (.cutY 14336 (.cutX 9216 (.cutY 13312 .empty (.cutX 8704 (.cutY 13824 .empty (.cutX 8448 (.cutY 14080 .full .empty) .empty)) .empty)) .empty) .empty) .empty)) (.cutY 12288 (.cutX 14336 (.cutY 10240 (.cutX 13312 .empty (.cutY 9216 (.cutX 13824 .empty (.cutY 8704 (.cutX 14080 (.cutY 8448 .full .empty) .empty) .empty)) .empty)) .empty) .empty) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 .empty (.cutY 22528 .empty (.cutX 19456 (.cutY 23552 .empty (.cutX 18944 (.cutY 24064 .empty (.cutX 18688 .empty (.cutY 24320 .empty .full))) .empty)) .empty)))) (.cutY 20480 (.cutX 22528 .empty (.cutY 18432 .empty (.cutX 23552 .empty (.cutY 19456 (.cutX 24064 .empty (.cutY 18944 (.cutX 24320 .empty (.cutY 18688 .empty .full)) .empty)) .empty)))) .empty)) .empty) .empty)))

theorem metadata85 : 0<256811171 ∧ 32<128 ∧ 54<128 ∧ 0<4 ∧
    3126/4160=0 ∧ 3126%4160=3126 ∧ ∀ i, (leaves85 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData85).mp
    (by decide +kernel)

theorem sourceChecked85_0 : ∀ i : Fin 4,
    (fun i => output85 i = raw85 (source85 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked85 : ∀ i : Fin 4, (fun i => output85 i = raw85 (source85 i)) i :=
  forallFin_of_zero_offset (fun i => output85 i = raw85 (source85 i)) sourceChecked85_0

theorem coverChecked85_0 : ∀ i : Fin 4,
    (fun i => (output85 (cover85 i)).ContainsBox (raw85 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked85 : ∀ i : Fin 4, (fun i => (output85 (cover85 i)).ContainsBox (raw85 i)) i :=
  forallFin_of_zero_offset (fun i => (output85 (cover85 i)).ContainsBox (raw85 i)) coverChecked85_0

theorem treeChecked85 : tree85.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves85 : List.ofFn output85 = tree85.leaves ⟨0,32768,0,32768⟩ := by
  unfold output85
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked85 : gridTreeUnionCheck 32768 raw85 output85 cover85 source85 tree85 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked85, coverChecked85, treeChecked85, treeLeaves85⟩

theorem areaUnits85 : gridUnionAreaUnits output85 = 262144 := by decide +kernel

noncomputable def phaseMass85 : ℝ := singlePhaseMass (256811171/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw85 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass85_eq : phaseMass85 = (256811171/1638400000000 : ℝ) := by
  unfold phaseMass85
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw85 output85 cover85 source85
    (gridTreeUnionCheck_sound 32768 raw85 output85 cover85 source85 tree85 checked85)
    _ (by norm_num) _, areaUnits85]
  norm_num

-- Frozen phase 2582, atom 7687, type 1, source (39,56).
def leavesData86 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves86 : Fin 4 → DyadicLeaf := leavesData86.get
def raw86 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 39 56 leaves86 i
def outputData86 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨9984,10112,14336,14464⟩) (.single ⟨9984,10112,14464,14592⟩)) (.node (.single ⟨10112,10240,14336,14464⟩) (.single ⟨10112,10240,14464,14592⟩))) (.node (.node (.single ⟨14336,14464,9984,10112⟩) (.single ⟨14336,14464,10112,10240⟩)) (.node (.single ⟨14464,14592,9984,10112⟩) (.single ⟨14464,14592,10112,10240⟩)))) (.node (.node (.node (.single ⟨18176,18304,22528,22656⟩) (.single ⟨18176,18304,22656,22784⟩)) (.node (.single ⟨18304,18432,22528,22656⟩) (.single ⟨18304,18432,22656,22784⟩))) (.node (.node (.single ⟨22528,22656,18176,18304⟩) (.single ⟨22528,22656,18304,18432⟩)) (.node (.single ⟨22656,22784,18176,18304⟩) (.single ⟨22656,22784,18304,18432⟩)))))
def output86 : Fin 16 → GridBox := outputData86.get
def coverData86 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData86 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover86 (i : Fin 16) : Fin 16 := ⟨coverData86.get i % 16, Nat.mod_lt _ (by decide)⟩
def source86 (i : Fin 16) : Fin 16 := ⟨sourceData86.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree86 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 (.cutY 14336 .empty (.cutX 9216 .empty (.cutY 15360 (.cutX 9728 .empty (.cutY 14848 (.cutX 9984 .empty (.cutY 14592 (.cutX 10112 (.cutY 14464 .full .full) (.cutY 14464 .full .full)) .empty)) .empty)) .empty))) .empty)) (.cutY 12288 (.cutX 14336 .empty (.cutY 10240 (.cutX 15360 (.cutY 9216 .empty (.cutX 14848 (.cutY 9728 .empty (.cutX 14592 (.cutY 9984 .empty (.cutX 14464 (.cutY 10112 .full .full) (.cutY 10112 .full .full))) .empty)) .empty)) .empty) .empty)) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 (.cutY 22528 .empty (.cutX 17408 .empty (.cutY 23552 (.cutX 17920 .empty (.cutY 23040 (.cutX 18176 .empty (.cutY 22784 (.cutX 18304 (.cutY 22656 .full .full) (.cutY 22656 .full .full)) .empty)) .empty)) .empty))) .empty)) (.cutY 20480 (.cutX 22528 .empty (.cutY 18432 (.cutX 23552 (.cutY 17408 .empty (.cutX 23040 (.cutY 17920 .empty (.cutX 22784 (.cutY 18176 .empty (.cutX 22656 (.cutY 18304 .full .full) (.cutY 18304 .full .full))) .empty)) .empty)) .empty) .empty)) .empty)) .empty) .empty)))

theorem metadata86 : 0<168966520 ∧ 39<128 ∧ 56<128 ∧ 1<4 ∧
    7687/4160=1 ∧ 7687%4160=3527 ∧ ∀ i, (leaves86 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData86).mp
    (by decide +kernel)

theorem sourceChecked86_0 : ∀ i : Fin 16,
    (fun i => output86 i = raw86 (source86 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked86 : ∀ i : Fin 16, (fun i => output86 i = raw86 (source86 i)) i :=
  forallFin_of_zero_offset (fun i => output86 i = raw86 (source86 i)) sourceChecked86_0

theorem coverChecked86_0 : ∀ i : Fin 16,
    (fun i => (output86 (cover86 i)).ContainsBox (raw86 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked86 : ∀ i : Fin 16, (fun i => (output86 (cover86 i)).ContainsBox (raw86 i)) i :=
  forallFin_of_zero_offset (fun i => (output86 (cover86 i)).ContainsBox (raw86 i)) coverChecked86_0

theorem treeChecked86 : tree86.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves86 : List.ofFn output86 = tree86.leaves ⟨0,32768,0,32768⟩ := by
  unfold output86
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked86 : gridTreeUnionCheck 32768 raw86 output86 cover86 source86 tree86 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked86, coverChecked86, treeChecked86, treeLeaves86⟩

theorem areaUnits86 : gridUnionAreaUnits output86 = 262144 := by decide +kernel

noncomputable def phaseMass86 : ℝ := singlePhaseMass (168966520/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw86 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass86_eq : phaseMass86 = (4224163/40960000000 : ℝ) := by
  unfold phaseMass86
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw86 output86 cover86 source86
    (gridTreeUnionCheck_sound 32768 raw86 output86 cover86 source86 tree86 checked86)
    _ (by norm_num) _, areaUnits86]
  norm_num

-- Frozen phase 2583, atom 7078, type 1, source (29,47).
def leavesData87 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves87 : Fin 4 → DyadicLeaf := leavesData87.get
def raw87 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 29 47 leaves87 i
def outputData87 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨7424,7552,12032,12160⟩) (.single ⟨7424,7552,12160,12288⟩)) (.node (.single ⟨7552,7680,12032,12160⟩) (.single ⟨7552,7680,12160,12288⟩))) (.node (.node (.single ⟨12032,12160,7424,7552⟩) (.single ⟨12032,12160,7552,7680⟩)) (.node (.single ⟨12160,12288,7424,7552⟩) (.single ⟨12160,12288,7552,7680⟩)))) (.node (.node (.node (.single ⟨20480,20608,25088,25216⟩) (.single ⟨20480,20608,25216,25344⟩)) (.node (.single ⟨20608,20736,25088,25216⟩) (.single ⟨20608,20736,25216,25344⟩))) (.node (.node (.single ⟨25088,25216,20480,20608⟩) (.single ⟨25088,25216,20608,20736⟩)) (.node (.single ⟨25216,25344,20480,20608⟩) (.single ⟨25216,25344,20608,20736⟩)))))
def output87 : Fin 16 → GridBox := outputData87.get
def coverData87 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData87 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover87 (i : Fin 16) : Fin 16 := ⟨coverData87.get i % 16, Nat.mod_lt _ (by decide)⟩
def source87 (i : Fin 16) : Fin 16 := ⟨sourceData87.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree87 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 .empty (.cutY 10240 .empty (.cutX 7168 .empty (.cutY 11264 .empty (.cutX 7680 (.cutY 11776 .empty (.cutX 7424 .empty (.cutY 12032 .empty (.cutX 7552 (.cutY 12160 .full .full) (.cutY 12160 .full .full))))) .empty))))) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 .empty (.cutY 6144 .empty (.cutX 11264 .empty (.cutY 7168 .empty (.cutX 11776 .empty (.cutY 7680 (.cutX 12032 .empty (.cutY 7424 .empty (.cutX 12160 (.cutY 7552 .full .full) (.cutY 7552 .full .full)))) .empty))))))) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 (.cutY 26624 (.cutX 21504 (.cutY 25600 (.cutX 20992 (.cutY 25088 .empty (.cutX 20736 (.cutY 25344 (.cutX 20608 (.cutY 25216 .full .full) (.cutY 25216 .full .full)) .empty) .empty)) .empty) .empty) .empty) .empty) .empty) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 (.cutY 22528 (.cutX 25600 (.cutY 21504 (.cutX 25088 .empty (.cutY 20992 (.cutX 25344 (.cutY 20736 (.cutX 25216 (.cutY 20608 .full .full) (.cutY 20608 .full .full)) .empty) .empty) .empty)) .empty) .empty) .empty) .empty)) .empty) .empty))))

theorem metadata87 : 0<130629080 ∧ 29<128 ∧ 47<128 ∧ 1<4 ∧
    7078/4160=1 ∧ 7078%4160=2918 ∧ ∀ i, (leaves87 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData87).mp
    (by decide +kernel)

theorem sourceChecked87_0 : ∀ i : Fin 16,
    (fun i => output87 i = raw87 (source87 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked87 : ∀ i : Fin 16, (fun i => output87 i = raw87 (source87 i)) i :=
  forallFin_of_zero_offset (fun i => output87 i = raw87 (source87 i)) sourceChecked87_0

theorem coverChecked87_0 : ∀ i : Fin 16,
    (fun i => (output87 (cover87 i)).ContainsBox (raw87 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked87 : ∀ i : Fin 16, (fun i => (output87 (cover87 i)).ContainsBox (raw87 i)) i :=
  forallFin_of_zero_offset (fun i => (output87 (cover87 i)).ContainsBox (raw87 i)) coverChecked87_0

theorem treeChecked87 : tree87.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves87 : List.ofFn output87 = tree87.leaves ⟨0,32768,0,32768⟩ := by
  unfold output87
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked87 : gridTreeUnionCheck 32768 raw87 output87 cover87 source87 tree87 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked87, coverChecked87, treeChecked87, treeLeaves87⟩

theorem areaUnits87 : gridUnionAreaUnits output87 = 262144 := by decide +kernel

noncomputable def phaseMass87 : ℝ := singlePhaseMass (130629080/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw87 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass87_eq : phaseMass87 = (3265727/40960000000 : ℝ) := by
  unfold phaseMass87
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw87 output87 cover87 source87
    (gridTreeUnionCheck_sound 32768 raw87 output87 cover87 source87 tree87 checked87)
    _ (by norm_num) _, areaUnits87]
  norm_num

-- Frozen phase 2584, atom 7148, type 1, source (30,48).
def leavesData88 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves88 : Fin 4 → DyadicLeaf := leavesData88.get
def raw88 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 30 48 leaves88 i
def outputData88 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨7680,7808,12288,12416⟩) (.single ⟨7680,7808,12416,12544⟩)) (.node (.single ⟨7808,7936,12288,12416⟩) (.single ⟨7808,7936,12416,12544⟩))) (.node (.node (.single ⟨12288,12416,7680,7808⟩) (.single ⟨12288,12416,7808,7936⟩)) (.node (.single ⟨12416,12544,7680,7808⟩) (.single ⟨12416,12544,7808,7936⟩)))) (.node (.node (.node (.single ⟨20224,20352,24832,24960⟩) (.single ⟨20224,20352,24960,25088⟩)) (.node (.single ⟨20352,20480,24832,24960⟩) (.single ⟨20352,20480,24960,25088⟩))) (.node (.node (.single ⟨24832,24960,20224,20352⟩) (.single ⟨24832,24960,20352,20480⟩)) (.node (.single ⟨24960,25088,20224,20352⟩) (.single ⟨24960,25088,20352,20480⟩)))))
def output88 : Fin 16 → GridBox := outputData88.get
def coverData88 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData88 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover88 (i : Fin 16) : Fin 16 := ⟨coverData88.get i % 16, Nat.mod_lt _ (by decide)⟩
def source88 (i : Fin 16) : Fin 16 := ⟨sourceData88.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree88 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 .empty (.cutY 14336 (.cutX 7168 .empty (.cutY 13312 (.cutX 7680 .empty (.cutY 12800 (.cutX 7936 (.cutY 12544 (.cutX 7808 (.cutY 12416 .full .full) (.cutY 12416 .full .full)) .empty) .empty) .empty)) .empty)) .empty))))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 (.cutY 6144 .empty (.cutX 13312 (.cutY 7168 .empty (.cutX 12800 (.cutY 7680 .empty (.cutX 12544 (.cutY 7936 (.cutX 12416 (.cutY 7808 .full .full) (.cutY 7808 .full .full)) .empty) .empty)) .empty)) .empty)) .empty))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 .empty (.cutY 26624 (.cutX 19456 .empty (.cutY 25600 (.cutX 19968 .empty (.cutY 25088 (.cutX 20224 .empty (.cutY 24832 .empty (.cutX 20352 (.cutY 24960 .full .full) (.cutY 24960 .full .full)))) .empty)) .empty)) .empty)) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 (.cutY 18432 .empty (.cutX 25600 (.cutY 19456 .empty (.cutX 25088 (.cutY 19968 .empty (.cutX 24832 .empty (.cutY 20224 .empty (.cutX 24960 (.cutY 20352 .full .full) (.cutY 20352 .full .full))))) .empty)) .empty)) .empty) .empty) .empty) .empty))))

theorem metadata88 : 0<202650974 ∧ 30<128 ∧ 48<128 ∧ 1<4 ∧
    7148/4160=1 ∧ 7148%4160=2988 ∧ ∀ i, (leaves88 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData88).mp
    (by decide +kernel)

theorem sourceChecked88_0 : ∀ i : Fin 16,
    (fun i => output88 i = raw88 (source88 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked88 : ∀ i : Fin 16, (fun i => output88 i = raw88 (source88 i)) i :=
  forallFin_of_zero_offset (fun i => output88 i = raw88 (source88 i)) sourceChecked88_0

theorem coverChecked88_0 : ∀ i : Fin 16,
    (fun i => (output88 (cover88 i)).ContainsBox (raw88 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked88 : ∀ i : Fin 16, (fun i => (output88 (cover88 i)).ContainsBox (raw88 i)) i :=
  forallFin_of_zero_offset (fun i => (output88 (cover88 i)).ContainsBox (raw88 i)) coverChecked88_0

theorem treeChecked88 : tree88.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves88 : List.ofFn output88 = tree88.leaves ⟨0,32768,0,32768⟩ := by
  unfold output88
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked88 : gridTreeUnionCheck 32768 raw88 output88 cover88 source88 tree88 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked88, coverChecked88, treeChecked88, treeLeaves88⟩

theorem areaUnits88 : gridUnionAreaUnits output88 = 262144 := by decide +kernel

noncomputable def phaseMass88 : ℝ := singlePhaseMass (202650974/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw88 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass88_eq : phaseMass88 = (101325487/819200000000 : ℝ) := by
  unfold phaseMass88
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw88 output88 cover88 source88
    (gridTreeUnionCheck_sound 32768 raw88 output88 cover88 source88 tree88 checked88)
    _ (by norm_num) _, areaUnits88]
  norm_num

-- Frozen phase 2585, atom 1325, type 0, source (11,38).
def leavesData89 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves89 : Fin 1 → DyadicLeaf := leavesData89.get
def raw89 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 11 38 leaves89 i
def outputData89 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨2816,3072,9728,9984⟩) (.single ⟨9728,9984,2816,3072⟩)) (.node (.single ⟨22784,23040,29696,29952⟩) (.single ⟨29696,29952,22784,23040⟩)))
def output89 : Fin 4 → GridBox := outputData89.get
def coverData89 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData89 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover89 (i : Fin 4) : Fin 4 := ⟨coverData89.get i % 4, Nat.mod_lt _ (by decide)⟩
def source89 (i : Fin 4) : Fin 4 := ⟨sourceData89.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree89 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 .empty (.cutY 10240 (.cutX 3072 (.cutY 9216 .empty (.cutX 2560 .empty (.cutY 9728 .empty (.cutX 2816 .empty (.cutY 9984 .full .empty))))) .empty) .empty)) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 .empty (.cutX 9216 .empty (.cutY 3072 (.cutX 9728 .empty (.cutY 2560 .empty (.cutX 9984 (.cutY 2816 .empty .full) .empty))) .empty))) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 (.cutX 23552 (.cutY 29696 .empty (.cutX 23040 (.cutY 30208 (.cutX 22784 .empty (.cutY 29952 .full .empty)) .empty) .empty)) .empty) .empty))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 (.cutY 22528 .empty (.cutX 29696 .empty (.cutY 23552 (.cutX 30208 (.cutY 23040 (.cutX 29952 (.cutY 22784 .empty .full) .empty) .empty) .empty) .empty))) .empty))) .empty))))

theorem metadata89 : 0<290391823 ∧ 11<128 ∧ 38<128 ∧ 0<4 ∧
    1325/4160=0 ∧ 1325%4160=1325 ∧ ∀ i, (leaves89 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData89).mp
    (by decide +kernel)

theorem sourceChecked89_0 : ∀ i : Fin 4,
    (fun i => output89 i = raw89 (source89 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked89 : ∀ i : Fin 4, (fun i => output89 i = raw89 (source89 i)) i :=
  forallFin_of_zero_offset (fun i => output89 i = raw89 (source89 i)) sourceChecked89_0

theorem coverChecked89_0 : ∀ i : Fin 4,
    (fun i => (output89 (cover89 i)).ContainsBox (raw89 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked89 : ∀ i : Fin 4, (fun i => (output89 (cover89 i)).ContainsBox (raw89 i)) i :=
  forallFin_of_zero_offset (fun i => (output89 (cover89 i)).ContainsBox (raw89 i)) coverChecked89_0

theorem treeChecked89 : tree89.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves89 : List.ofFn output89 = tree89.leaves ⟨0,32768,0,32768⟩ := by
  unfold output89
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked89 : gridTreeUnionCheck 32768 raw89 output89 cover89 source89 tree89 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked89, coverChecked89, treeChecked89, treeLeaves89⟩

theorem areaUnits89 : gridUnionAreaUnits output89 = 262144 := by decide +kernel

noncomputable def phaseMass89 : ℝ := singlePhaseMass (290391823/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw89 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass89_eq : phaseMass89 = (290391823/1638400000000 : ℝ) := by
  unfold phaseMass89
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw89 output89 cover89 source89
    (gridTreeUnionCheck_sound 32768 raw89 output89 cover89 source89 tree89 checked89)
    _ (by norm_num) _, areaUnits89]
  norm_num

-- Frozen phase 2586, atom 1108, type 0, source (9,37).
def leavesData90 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves90 : Fin 1 → DyadicLeaf := leavesData90.get
def raw90 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 9 37 leaves90 i
def outputData90 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨2304,2560,9472,9728⟩) (.single ⟨9472,9728,2304,2560⟩)) (.node (.single ⟨23040,23296,30208,30464⟩) (.single ⟨30208,30464,23040,23296⟩)))
def output90 : Fin 4 → GridBox := outputData90.get
def coverData90 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData90 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover90 (i : Fin 4) : Fin 4 := ⟨coverData90.get i % 4, Nat.mod_lt _ (by decide)⟩
def source90 (i : Fin 4) : Fin 4 := ⟨sourceData90.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree90 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 .empty (.cutY 10240 (.cutX 3072 (.cutY 9216 .empty (.cutX 2560 (.cutY 9728 (.cutX 2304 .empty (.cutY 9472 .empty .full)) .empty) .empty)) .empty) .empty)) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 .empty (.cutX 9216 .empty (.cutY 3072 (.cutX 9728 (.cutY 2560 (.cutX 9472 .empty (.cutY 2304 .empty .full)) .empty) .empty) .empty))) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 (.cutX 23552 (.cutY 29696 .empty (.cutX 23040 .empty (.cutY 30208 .empty (.cutX 23296 (.cutY 30464 .full .empty) .empty)))) .empty) .empty))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 (.cutY 22528 .empty (.cutX 29696 .empty (.cutY 23552 (.cutX 30208 .empty (.cutY 23040 .empty (.cutX 30464 (.cutY 23296 .full .empty) .empty))) .empty))) .empty))) .empty))))

theorem metadata90 : 0<290391823 ∧ 9<128 ∧ 37<128 ∧ 0<4 ∧
    1108/4160=0 ∧ 1108%4160=1108 ∧ ∀ i, (leaves90 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData90).mp
    (by decide +kernel)

theorem sourceChecked90_0 : ∀ i : Fin 4,
    (fun i => output90 i = raw90 (source90 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked90 : ∀ i : Fin 4, (fun i => output90 i = raw90 (source90 i)) i :=
  forallFin_of_zero_offset (fun i => output90 i = raw90 (source90 i)) sourceChecked90_0

theorem coverChecked90_0 : ∀ i : Fin 4,
    (fun i => (output90 (cover90 i)).ContainsBox (raw90 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked90 : ∀ i : Fin 4, (fun i => (output90 (cover90 i)).ContainsBox (raw90 i)) i :=
  forallFin_of_zero_offset (fun i => (output90 (cover90 i)).ContainsBox (raw90 i)) coverChecked90_0

theorem treeChecked90 : tree90.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves90 : List.ofFn output90 = tree90.leaves ⟨0,32768,0,32768⟩ := by
  unfold output90
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked90 : gridTreeUnionCheck 32768 raw90 output90 cover90 source90 tree90 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked90, coverChecked90, treeChecked90, treeLeaves90⟩

theorem areaUnits90 : gridUnionAreaUnits output90 = 262144 := by decide +kernel

noncomputable def phaseMass90 : ℝ := singlePhaseMass (290391823/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw90 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass90_eq : phaseMass90 = (290391823/1638400000000 : ℝ) := by
  unfold phaseMass90
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw90 output90 cover90 source90
    (gridTreeUnionCheck_sound 32768 raw90 output90 cover90 source90 tree90 checked90)
    _ (by norm_num) _, areaUnits90]
  norm_num

-- Frozen phase 2587, atom 3675, type 0, source (42,63).
def leavesData91 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves91 : Fin 1 → DyadicLeaf := leavesData91.get
def raw91 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 42 63 leaves91 i
def outputData91 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨10752,11008,16128,16384⟩) (.single ⟨16128,16384,10752,11008⟩)) (.node (.single ⟨16384,16640,21760,22016⟩) (.single ⟨21760,22016,16384,16640⟩)))
def output91 : Fin 4 → GridBox := outputData91.get
def coverData91 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData91 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover91 (i : Fin 4) : Fin 4 := ⟨coverData91.get i % 4, Nat.mod_lt _ (by decide)⟩
def source91 (i : Fin 4) : Fin 4 := ⟨sourceData91.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree91 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 .empty (.cutY 14336 .empty (.cutX 11264 (.cutY 15360 .empty (.cutX 10752 .empty (.cutY 15872 .empty (.cutX 11008 (.cutY 16128 .empty .full) .empty)))) .empty)))) (.cutY 12288 (.cutX 14336 .empty (.cutY 10240 .empty (.cutX 15360 .empty (.cutY 11264 (.cutX 15872 .empty (.cutY 10752 .empty (.cutX 16128 .empty (.cutY 11008 .full .empty)))) .empty)))) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 (.cutY 22528 (.cutX 17408 (.cutY 21504 .empty (.cutX 16896 (.cutY 22016 (.cutX 16640 (.cutY 21760 .empty .full) .empty) .empty) .empty)) .empty) .empty) .empty)) (.cutY 20480 (.cutX 22528 (.cutY 18432 (.cutX 21504 .empty (.cutY 17408 (.cutX 22016 (.cutY 16896 (.cutX 21760 .empty (.cutY 16640 .full .empty)) .empty) .empty) .empty)) .empty) .empty) .empty)) .empty) .empty)))

theorem metadata91 : 0<283978761 ∧ 42<128 ∧ 63<128 ∧ 0<4 ∧
    3675/4160=0 ∧ 3675%4160=3675 ∧ ∀ i, (leaves91 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData91).mp
    (by decide +kernel)

theorem sourceChecked91_0 : ∀ i : Fin 4,
    (fun i => output91 i = raw91 (source91 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked91 : ∀ i : Fin 4, (fun i => output91 i = raw91 (source91 i)) i :=
  forallFin_of_zero_offset (fun i => output91 i = raw91 (source91 i)) sourceChecked91_0

theorem coverChecked91_0 : ∀ i : Fin 4,
    (fun i => (output91 (cover91 i)).ContainsBox (raw91 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked91 : ∀ i : Fin 4, (fun i => (output91 (cover91 i)).ContainsBox (raw91 i)) i :=
  forallFin_of_zero_offset (fun i => (output91 (cover91 i)).ContainsBox (raw91 i)) coverChecked91_0

theorem treeChecked91 : tree91.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves91 : List.ofFn output91 = tree91.leaves ⟨0,32768,0,32768⟩ := by
  unfold output91
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked91 : gridTreeUnionCheck 32768 raw91 output91 cover91 source91 tree91 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked91, coverChecked91, treeChecked91, treeLeaves91⟩

theorem areaUnits91 : gridUnionAreaUnits output91 = 262144 := by decide +kernel

noncomputable def phaseMass91 : ℝ := singlePhaseMass (283978761/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw91 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass91_eq : phaseMass91 = (283978761/1638400000000 : ℝ) := by
  unfold phaseMass91
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw91 output91 cover91 source91
    (gridTreeUnionCheck_sound 32768 raw91 output91 cover91 source91 tree91 checked91)
    _ (by norm_num) _, areaUnits91]
  norm_num

-- Frozen phase 2588, atom 2291, type 0, source (21,44).
def leavesData92 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves92 : Fin 1 → DyadicLeaf := leavesData92.get
def raw92 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 21 44 leaves92 i
def outputData92 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨5376,5632,11264,11520⟩) (.single ⟨11264,11520,5376,5632⟩)) (.node (.single ⟨21248,21504,27136,27392⟩) (.single ⟨27136,27392,21248,21504⟩)))
def output92 : Fin 4 → GridBox := outputData92.get
def coverData92 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData92 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover92 (i : Fin 4) : Fin 4 := ⟨coverData92.get i % 4, Nat.mod_lt _ (by decide)⟩
def source92 (i : Fin 4) : Fin 4 := ⟨sourceData92.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree92 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 (.cutY 10240 .empty (.cutX 5120 .empty (.cutY 11264 .empty (.cutX 5632 (.cutY 11776 (.cutX 5376 .empty (.cutY 11520 .full .empty)) .empty) .empty)))) .empty) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 .empty (.cutY 6144 (.cutX 11264 .empty (.cutY 5120 .empty (.cutX 11776 (.cutY 5632 (.cutX 11520 (.cutY 5376 .empty .full) .empty) .empty) .empty))) .empty))) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 (.cutY 26624 .empty (.cutX 21504 (.cutY 27648 (.cutX 20992 .empty (.cutY 27136 .empty (.cutX 21248 .empty (.cutY 27392 .full .empty)))) .empty) .empty)) .empty) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 .empty (.cutY 22528 (.cutX 27648 (.cutY 21504 (.cutX 27136 .empty (.cutY 20992 .empty (.cutX 27392 (.cutY 21248 .empty .full) .empty))) .empty) .empty) .empty))) .empty) .empty))))

theorem metadata92 : 0<73667111 ∧ 21<128 ∧ 44<128 ∧ 0<4 ∧
    2291/4160=0 ∧ 2291%4160=2291 ∧ ∀ i, (leaves92 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData92).mp
    (by decide +kernel)

theorem sourceChecked92_0 : ∀ i : Fin 4,
    (fun i => output92 i = raw92 (source92 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked92 : ∀ i : Fin 4, (fun i => output92 i = raw92 (source92 i)) i :=
  forallFin_of_zero_offset (fun i => output92 i = raw92 (source92 i)) sourceChecked92_0

theorem coverChecked92_0 : ∀ i : Fin 4,
    (fun i => (output92 (cover92 i)).ContainsBox (raw92 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked92 : ∀ i : Fin 4, (fun i => (output92 (cover92 i)).ContainsBox (raw92 i)) i :=
  forallFin_of_zero_offset (fun i => (output92 (cover92 i)).ContainsBox (raw92 i)) coverChecked92_0

theorem treeChecked92 : tree92.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves92 : List.ofFn output92 = tree92.leaves ⟨0,32768,0,32768⟩ := by
  unfold output92
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked92 : gridTreeUnionCheck 32768 raw92 output92 cover92 source92 tree92 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked92, coverChecked92, treeChecked92, treeLeaves92⟩

theorem areaUnits92 : gridUnionAreaUnits output92 = 262144 := by decide +kernel

noncomputable def phaseMass92 : ℝ := singlePhaseMass (73667111/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw92 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass92_eq : phaseMass92 = (73667111/1638400000000 : ℝ) := by
  unfold phaseMass92
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw92 output92 cover92 source92
    (gridTreeUnionCheck_sound 32768 raw92 output92 cover92 source92 tree92 checked92)
    _ (by norm_num) _, areaUnits92]
  norm_num

-- Frozen phase 2589, atom 6447, type 1, source (21,40).
def leavesData93 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves93 : Fin 4 → DyadicLeaf := leavesData93.get
def raw93 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 21 40 leaves93 i
def outputData93 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨5376,5504,10240,10368⟩) (.single ⟨5376,5504,10368,10496⟩)) (.node (.single ⟨5504,5632,10240,10368⟩) (.single ⟨5504,5632,10368,10496⟩))) (.node (.node (.single ⟨10240,10368,5376,5504⟩) (.single ⟨10240,10368,5504,5632⟩)) (.node (.single ⟨10368,10496,5376,5504⟩) (.single ⟨10368,10496,5504,5632⟩)))) (.node (.node (.node (.single ⟨22272,22400,27136,27264⟩) (.single ⟨22272,22400,27264,27392⟩)) (.node (.single ⟨22400,22528,27136,27264⟩) (.single ⟨22400,22528,27264,27392⟩))) (.node (.node (.single ⟨27136,27264,22272,22400⟩) (.single ⟨27136,27264,22400,22528⟩)) (.node (.single ⟨27264,27392,22272,22400⟩) (.single ⟨27264,27392,22400,22528⟩)))))
def output93 : Fin 16 → GridBox := outputData93.get
def coverData93 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData93 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover93 (i : Fin 16) : Fin 16 := ⟨coverData93.get i % 16, Nat.mod_lt _ (by decide)⟩
def source93 (i : Fin 16) : Fin 16 := ⟨sourceData93.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree93 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 (.cutY 10240 .empty (.cutX 5120 .empty (.cutY 11264 (.cutX 5632 (.cutY 10752 (.cutX 5376 .empty (.cutY 10496 (.cutX 5504 (.cutY 10368 .full .full) (.cutY 10368 .full .full)) .empty)) .empty) .empty) .empty))) .empty) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 .empty (.cutY 6144 (.cutX 11264 (.cutY 5120 .empty (.cutX 10752 (.cutY 5632 (.cutX 10496 (.cutY 5376 .empty (.cutX 10368 (.cutY 5504 .full .full) (.cutY 5504 .full .full))) .empty) .empty) .empty)) .empty) .empty))) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 (.cutY 26624 .empty (.cutX 21504 .empty (.cutY 27648 (.cutX 22016 .empty (.cutY 27136 .empty (.cutX 22272 .empty (.cutY 27392 (.cutX 22400 (.cutY 27264 .full .full) (.cutY 27264 .full .full)) .empty)))) .empty))) .empty) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 .empty (.cutY 22528 (.cutX 27648 (.cutY 21504 .empty (.cutX 27136 .empty (.cutY 22016 .empty (.cutX 27392 (.cutY 22272 .empty (.cutX 27264 (.cutY 22400 .full .full) (.cutY 22400 .full .full))) .empty)))) .empty) .empty))) .empty) .empty))))

theorem metadata93 : 0<22259151 ∧ 21<128 ∧ 40<128 ∧ 1<4 ∧
    6447/4160=1 ∧ 6447%4160=2287 ∧ ∀ i, (leaves93 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData93).mp
    (by decide +kernel)

theorem sourceChecked93_0 : ∀ i : Fin 16,
    (fun i => output93 i = raw93 (source93 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked93 : ∀ i : Fin 16, (fun i => output93 i = raw93 (source93 i)) i :=
  forallFin_of_zero_offset (fun i => output93 i = raw93 (source93 i)) sourceChecked93_0

theorem coverChecked93_0 : ∀ i : Fin 16,
    (fun i => (output93 (cover93 i)).ContainsBox (raw93 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked93 : ∀ i : Fin 16, (fun i => (output93 (cover93 i)).ContainsBox (raw93 i)) i :=
  forallFin_of_zero_offset (fun i => (output93 (cover93 i)).ContainsBox (raw93 i)) coverChecked93_0

theorem treeChecked93 : tree93.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves93 : List.ofFn output93 = tree93.leaves ⟨0,32768,0,32768⟩ := by
  unfold output93
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked93 : gridTreeUnionCheck 32768 raw93 output93 cover93 source93 tree93 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked93, coverChecked93, treeChecked93, treeLeaves93⟩

theorem areaUnits93 : gridUnionAreaUnits output93 = 262144 := by decide +kernel

noncomputable def phaseMass93 : ℝ := singlePhaseMass (22259151/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw93 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass93_eq : phaseMass93 = (22259151/1638400000000 : ℝ) := by
  unfold phaseMass93
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw93 output93 cover93 source93
    (gridTreeUnionCheck_sound 32768 raw93 output93 cover93 source93 tree93 checked93)
    _ (by norm_num) _, areaUnits93]
  norm_num

-- Frozen phase 2590, atom 7216, type 1, source (31,49).
def leavesData94 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves94 : Fin 4 → DyadicLeaf := leavesData94.get
def raw94 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 31 49 leaves94 i
def outputData94 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨7936,8064,12544,12672⟩) (.single ⟨7936,8064,12672,12800⟩)) (.node (.single ⟨8064,8192,12544,12672⟩) (.single ⟨8064,8192,12672,12800⟩))) (.node (.node (.single ⟨12544,12672,7936,8064⟩) (.single ⟨12544,12672,8064,8192⟩)) (.node (.single ⟨12672,12800,7936,8064⟩) (.single ⟨12672,12800,8064,8192⟩)))) (.node (.node (.node (.single ⟨19968,20096,24576,24704⟩) (.single ⟨19968,20096,24704,24832⟩)) (.node (.single ⟨20096,20224,24576,24704⟩) (.single ⟨20096,20224,24704,24832⟩))) (.node (.node (.single ⟨24576,24704,19968,20096⟩) (.single ⟨24576,24704,20096,20224⟩)) (.node (.single ⟨24704,24832,19968,20096⟩) (.single ⟨24704,24832,20096,20224⟩)))))
def output94 : Fin 16 → GridBox := outputData94.get
def coverData94 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData94 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover94 (i : Fin 16) : Fin 16 := ⟨coverData94.get i % 16, Nat.mod_lt _ (by decide)⟩
def source94 (i : Fin 16) : Fin 16 := ⟨sourceData94.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree94 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 .empty (.cutY 14336 (.cutX 7168 .empty (.cutY 13312 (.cutX 7680 .empty (.cutY 12800 (.cutX 7936 .empty (.cutY 12544 .empty (.cutX 8064 (.cutY 12672 .full .full) (.cutY 12672 .full .full)))) .empty)) .empty)) .empty))))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 (.cutY 6144 .empty (.cutX 13312 (.cutY 7168 .empty (.cutX 12800 (.cutY 7680 .empty (.cutX 12544 .empty (.cutY 7936 .empty (.cutX 12672 (.cutY 8064 .full .full) (.cutY 8064 .full .full))))) .empty)) .empty)) .empty))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 .empty (.cutY 26624 (.cutX 19456 .empty (.cutY 25600 (.cutX 19968 .empty (.cutY 25088 (.cutX 20224 (.cutY 24832 (.cutX 20096 (.cutY 24704 .full .full) (.cutY 24704 .full .full)) .empty) .empty) .empty)) .empty)) .empty)) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 (.cutY 18432 .empty (.cutX 25600 (.cutY 19456 .empty (.cutX 25088 (.cutY 19968 .empty (.cutX 24832 (.cutY 20224 (.cutX 24704 (.cutY 20096 .full .full) (.cutY 20096 .full .full)) .empty) .empty)) .empty)) .empty)) .empty) .empty) .empty) .empty))))

theorem metadata94 : 0<202650974 ∧ 31<128 ∧ 49<128 ∧ 1<4 ∧
    7216/4160=1 ∧ 7216%4160=3056 ∧ ∀ i, (leaves94 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData94).mp
    (by decide +kernel)

theorem sourceChecked94_0 : ∀ i : Fin 16,
    (fun i => output94 i = raw94 (source94 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked94 : ∀ i : Fin 16, (fun i => output94 i = raw94 (source94 i)) i :=
  forallFin_of_zero_offset (fun i => output94 i = raw94 (source94 i)) sourceChecked94_0

theorem coverChecked94_0 : ∀ i : Fin 16,
    (fun i => (output94 (cover94 i)).ContainsBox (raw94 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked94 : ∀ i : Fin 16, (fun i => (output94 (cover94 i)).ContainsBox (raw94 i)) i :=
  forallFin_of_zero_offset (fun i => (output94 (cover94 i)).ContainsBox (raw94 i)) coverChecked94_0

theorem treeChecked94 : tree94.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves94 : List.ofFn output94 = tree94.leaves ⟨0,32768,0,32768⟩ := by
  unfold output94
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked94 : gridTreeUnionCheck 32768 raw94 output94 cover94 source94 tree94 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked94, coverChecked94, treeChecked94, treeLeaves94⟩

theorem areaUnits94 : gridUnionAreaUnits output94 = 262144 := by decide +kernel

noncomputable def phaseMass94 : ℝ := singlePhaseMass (202650974/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw94 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass94_eq : phaseMass94 = (101325487/819200000000 : ℝ) := by
  unfold phaseMass94
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw94 output94 cover94 source94
    (gridTreeUnionCheck_sound 32768 raw94 output94 cover94 source94 tree94 checked94)
    _ (by norm_num) _, areaUnits94]
  norm_num

-- Frozen phase 2591, atom 3190, type 0, source (33,55).
def leavesData95 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves95 : Fin 1 → DyadicLeaf := leavesData95.get
def raw95 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 33 55 leaves95 i
def outputData95 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨8448,8704,14080,14336⟩) (.single ⟨14080,14336,8448,8704⟩)) (.node (.single ⟨18432,18688,24064,24320⟩) (.single ⟨24064,24320,18432,18688⟩)))
def output95 : Fin 4 → GridBox := outputData95.get
def coverData95 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData95 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover95 (i : Fin 4) : Fin 4 := ⟨coverData95.get i % 4, Nat.mod_lt _ (by decide)⟩
def source95 (i : Fin 4) : Fin 4 := ⟨sourceData95.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree95 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 (.cutY 14336 (.cutX 9216 (.cutY 13312 .empty (.cutX 8704 (.cutY 13824 .empty (.cutX 8448 .empty (.cutY 14080 .empty .full))) .empty)) .empty) .empty) .empty)) (.cutY 12288 (.cutX 14336 (.cutY 10240 (.cutX 13312 .empty (.cutY 9216 (.cutX 13824 .empty (.cutY 8704 (.cutX 14080 .empty (.cutY 8448 .empty .full)) .empty)) .empty)) .empty) .empty) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 .empty (.cutY 22528 .empty (.cutX 19456 (.cutY 23552 .empty (.cutX 18944 (.cutY 24064 .empty (.cutX 18688 (.cutY 24320 .full .empty) .empty)) .empty)) .empty)))) (.cutY 20480 (.cutX 22528 .empty (.cutY 18432 .empty (.cutX 23552 .empty (.cutY 19456 (.cutX 24064 .empty (.cutY 18944 (.cutX 24320 (.cutY 18688 .full .empty) .empty) .empty)) .empty)))) .empty)) .empty) .empty)))

theorem metadata95 : 0<256811171 ∧ 33<128 ∧ 55<128 ∧ 0<4 ∧
    3190/4160=0 ∧ 3190%4160=3190 ∧ ∀ i, (leaves95 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData95).mp
    (by decide +kernel)

theorem sourceChecked95_0 : ∀ i : Fin 4,
    (fun i => output95 i = raw95 (source95 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked95 : ∀ i : Fin 4, (fun i => output95 i = raw95 (source95 i)) i :=
  forallFin_of_zero_offset (fun i => output95 i = raw95 (source95 i)) sourceChecked95_0

theorem coverChecked95_0 : ∀ i : Fin 4,
    (fun i => (output95 (cover95 i)).ContainsBox (raw95 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked95 : ∀ i : Fin 4, (fun i => (output95 (cover95 i)).ContainsBox (raw95 i)) i :=
  forallFin_of_zero_offset (fun i => (output95 (cover95 i)).ContainsBox (raw95 i)) coverChecked95_0

theorem treeChecked95 : tree95.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves95 : List.ofFn output95 = tree95.leaves ⟨0,32768,0,32768⟩ := by
  unfold output95
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked95 : gridTreeUnionCheck 32768 raw95 output95 cover95 source95 tree95 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked95, coverChecked95, treeChecked95, treeLeaves95⟩

theorem areaUnits95 : gridUnionAreaUnits output95 = 262144 := by decide +kernel

noncomputable def phaseMass95 : ℝ := singlePhaseMass (256811171/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw95 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass95_eq : phaseMass95 = (256811171/1638400000000 : ℝ) := by
  unfold phaseMass95
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw95 output95 cover95 source95
    (gridTreeUnionCheck_sound 32768 raw95 output95 cover95 source95 tree95 checked95)
    _ (by norm_num) _, areaUnits95]
  norm_num

-- Frozen phase 2592, atom 2543, type 0, source (24,47).
def leavesData96 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves96 : Fin 1 → DyadicLeaf := leavesData96.get
def raw96 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 24 47 leaves96 i
def outputData96 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨6144,6400,12032,12288⟩) (.single ⟨12032,12288,6144,6400⟩)) (.node (.single ⟨20480,20736,26368,26624⟩) (.single ⟨26368,26624,20480,20736⟩)))
def output96 : Fin 4 → GridBox := outputData96.get
def coverData96 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData96 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover96 (i : Fin 4) : Fin 4 := ⟨coverData96.get i % 4, Nat.mod_lt _ (by decide)⟩
def source96 (i : Fin 4) : Fin 4 := ⟨sourceData96.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree96 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 .empty (.cutY 10240 .empty (.cutX 7168 (.cutY 11264 .empty (.cutX 6656 (.cutY 11776 .empty (.cutX 6400 (.cutY 12032 .empty .full) .empty)) .empty)) .empty))) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 .empty (.cutY 6144 .empty (.cutX 11264 .empty (.cutY 7168 (.cutX 11776 .empty (.cutY 6656 (.cutX 12032 .empty (.cutY 6400 .full .empty)) .empty)) .empty))))) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 (.cutY 26624 (.cutX 21504 (.cutY 25600 .empty (.cutX 20992 (.cutY 26112 .empty (.cutX 20736 (.cutY 26368 .empty .full) .empty)) .empty)) .empty) .empty) .empty) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 (.cutY 22528 (.cutX 25600 .empty (.cutY 21504 (.cutX 26112 .empty (.cutY 20992 (.cutX 26368 .empty (.cutY 20736 .full .empty)) .empty)) .empty)) .empty) .empty)) .empty) .empty))))

theorem metadata96 : 0<214868664 ∧ 24<128 ∧ 47<128 ∧ 0<4 ∧
    2543/4160=0 ∧ 2543%4160=2543 ∧ ∀ i, (leaves96 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData96).mp
    (by decide +kernel)

theorem sourceChecked96_0 : ∀ i : Fin 4,
    (fun i => output96 i = raw96 (source96 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked96 : ∀ i : Fin 4, (fun i => output96 i = raw96 (source96 i)) i :=
  forallFin_of_zero_offset (fun i => output96 i = raw96 (source96 i)) sourceChecked96_0

theorem coverChecked96_0 : ∀ i : Fin 4,
    (fun i => (output96 (cover96 i)).ContainsBox (raw96 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked96 : ∀ i : Fin 4, (fun i => (output96 (cover96 i)).ContainsBox (raw96 i)) i :=
  forallFin_of_zero_offset (fun i => (output96 (cover96 i)).ContainsBox (raw96 i)) coverChecked96_0

theorem treeChecked96 : tree96.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves96 : List.ofFn output96 = tree96.leaves ⟨0,32768,0,32768⟩ := by
  unfold output96
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked96 : gridTreeUnionCheck 32768 raw96 output96 cover96 source96 tree96 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked96, coverChecked96, treeChecked96, treeLeaves96⟩

theorem areaUnits96 : gridUnionAreaUnits output96 = 262144 := by decide +kernel

noncomputable def phaseMass96 : ℝ := singlePhaseMass (214868664/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw96 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass96_eq : phaseMass96 = (26858583/204800000000 : ℝ) := by
  unfold phaseMass96
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw96 output96 cover96 source96
    (gridTreeUnionCheck_sound 32768 raw96 output96 cover96 source96 tree96 checked96)
    _ (by norm_num) _, areaUnits96]
  norm_num

-- Frozen phase 2593, atom 2623, type 0, source (25,48).
def leavesData97 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves97 : Fin 1 → DyadicLeaf := leavesData97.get
def raw97 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 25 48 leaves97 i
def outputData97 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨6400,6656,12288,12544⟩) (.single ⟨12288,12544,6400,6656⟩)) (.node (.single ⟨20224,20480,26112,26368⟩) (.single ⟨26112,26368,20224,20480⟩)))
def output97 : Fin 4 → GridBox := outputData97.get
def coverData97 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData97 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover97 (i : Fin 4) : Fin 4 := ⟨coverData97.get i % 4, Nat.mod_lt _ (by decide)⟩
def source97 (i : Fin 4) : Fin 4 := ⟨sourceData97.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree97 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 .empty (.cutY 14336 (.cutX 7168 (.cutY 13312 (.cutX 6656 (.cutY 12800 (.cutX 6400 .empty (.cutY 12544 .full .empty)) .empty) .empty) .empty) .empty) .empty))))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 (.cutY 6144 .empty (.cutX 13312 (.cutY 7168 (.cutX 12800 (.cutY 6656 (.cutX 12544 (.cutY 6400 .empty .full) .empty) .empty) .empty) .empty) .empty)) .empty))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 .empty (.cutY 26624 (.cutX 19456 .empty (.cutY 25600 .empty (.cutX 19968 .empty (.cutY 26112 .empty (.cutX 20224 .empty (.cutY 26368 .full .empty)))))) .empty)) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 (.cutY 18432 .empty (.cutX 25600 .empty (.cutY 19456 .empty (.cutX 26112 .empty (.cutY 19968 .empty (.cutX 26368 (.cutY 20224 .empty .full) .empty)))))) .empty) .empty) .empty) .empty))))

theorem metadata97 : 0<300263580 ∧ 25<128 ∧ 48<128 ∧ 0<4 ∧
    2623/4160=0 ∧ 2623%4160=2623 ∧ ∀ i, (leaves97 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData97).mp
    (by decide +kernel)

theorem sourceChecked97_0 : ∀ i : Fin 4,
    (fun i => output97 i = raw97 (source97 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked97 : ∀ i : Fin 4, (fun i => output97 i = raw97 (source97 i)) i :=
  forallFin_of_zero_offset (fun i => output97 i = raw97 (source97 i)) sourceChecked97_0

theorem coverChecked97_0 : ∀ i : Fin 4,
    (fun i => (output97 (cover97 i)).ContainsBox (raw97 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked97 : ∀ i : Fin 4, (fun i => (output97 (cover97 i)).ContainsBox (raw97 i)) i :=
  forallFin_of_zero_offset (fun i => (output97 (cover97 i)).ContainsBox (raw97 i)) coverChecked97_0

theorem treeChecked97 : tree97.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves97 : List.ofFn output97 = tree97.leaves ⟨0,32768,0,32768⟩ := by
  unfold output97
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked97 : gridTreeUnionCheck 32768 raw97 output97 cover97 source97 tree97 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked97, coverChecked97, treeChecked97, treeLeaves97⟩

theorem areaUnits97 : gridUnionAreaUnits output97 = 262144 := by decide +kernel

noncomputable def phaseMass97 : ℝ := singlePhaseMass (300263580/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw97 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass97_eq : phaseMass97 = (15013179/81920000000 : ℝ) := by
  unfold phaseMass97
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw97 output97 cover97 source97
    (gridTreeUnionCheck_sound 32768 raw97 output97 cover97 source97 tree97 checked97)
    _ (by norm_num) _, areaUnits97]
  norm_num

-- Frozen phase 2594, atom 2701, type 0, source (26,49).
def leavesData98 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves98 : Fin 1 → DyadicLeaf := leavesData98.get
def raw98 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 26 49 leaves98 i
def outputData98 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨6656,6912,12544,12800⟩) (.single ⟨12544,12800,6656,6912⟩)) (.node (.single ⟨19968,20224,25856,26112⟩) (.single ⟨25856,26112,19968,20224⟩)))
def output98 : Fin 4 → GridBox := outputData98.get
def coverData98 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData98 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover98 (i : Fin 4) : Fin 4 := ⟨coverData98.get i % 4, Nat.mod_lt _ (by decide)⟩
def source98 (i : Fin 4) : Fin 4 := ⟨sourceData98.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree98 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 .empty (.cutY 14336 (.cutX 7168 (.cutY 13312 (.cutX 6656 .empty (.cutY 12800 (.cutX 6912 (.cutY 12544 .empty .full) .empty) .empty)) .empty) .empty) .empty))))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 (.cutY 6144 .empty (.cutX 13312 (.cutY 7168 (.cutX 12800 (.cutY 6656 .empty (.cutX 12544 .empty (.cutY 6912 .full .empty))) .empty) .empty) .empty)) .empty))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 .empty (.cutY 26624 (.cutX 19456 .empty (.cutY 25600 .empty (.cutX 19968 .empty (.cutY 26112 (.cutX 20224 (.cutY 25856 .empty .full) .empty) .empty)))) .empty)) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 (.cutY 18432 .empty (.cutX 25600 .empty (.cutY 19456 .empty (.cutX 26112 (.cutY 19968 .empty (.cutX 25856 .empty (.cutY 20224 .full .empty))) .empty)))) .empty) .empty) .empty) .empty))))

theorem metadata98 : 0<300263580 ∧ 26<128 ∧ 49<128 ∧ 0<4 ∧
    2701/4160=0 ∧ 2701%4160=2701 ∧ ∀ i, (leaves98 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData98).mp
    (by decide +kernel)

theorem sourceChecked98_0 : ∀ i : Fin 4,
    (fun i => output98 i = raw98 (source98 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked98 : ∀ i : Fin 4, (fun i => output98 i = raw98 (source98 i)) i :=
  forallFin_of_zero_offset (fun i => output98 i = raw98 (source98 i)) sourceChecked98_0

theorem coverChecked98_0 : ∀ i : Fin 4,
    (fun i => (output98 (cover98 i)).ContainsBox (raw98 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked98 : ∀ i : Fin 4, (fun i => (output98 (cover98 i)).ContainsBox (raw98 i)) i :=
  forallFin_of_zero_offset (fun i => (output98 (cover98 i)).ContainsBox (raw98 i)) coverChecked98_0

theorem treeChecked98 : tree98.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves98 : List.ofFn output98 = tree98.leaves ⟨0,32768,0,32768⟩ := by
  unfold output98
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked98 : gridTreeUnionCheck 32768 raw98 output98 cover98 source98 tree98 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked98, coverChecked98, treeChecked98, treeLeaves98⟩

theorem areaUnits98 : gridUnionAreaUnits output98 = 262144 := by decide +kernel

noncomputable def phaseMass98 : ℝ := singlePhaseMass (300263580/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw98 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass98_eq : phaseMass98 = (15013179/81920000000 : ℝ) := by
  unfold phaseMass98
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw98 output98 cover98 source98
    (gridTreeUnionCheck_sound 32768 raw98 output98 cover98 source98 tree98 checked98)
    _ (by norm_num) _, areaUnits98]
  norm_num

-- Frozen phase 2595, atom 4444, type 1, source (2,32).
def leavesData99 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves99 : Fin 1 → DyadicLeaf := leavesData99.get
def raw99 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 2 32 leaves99 i
def outputData99 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨512,768,8192,8448⟩) (.single ⟨8192,8448,512,768⟩)) (.node (.single ⟨24320,24576,32000,32256⟩) (.single ⟨32000,32256,24320,24576⟩)))
def output99 : Fin 4 → GridBox := outputData99.get
def coverData99 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData99 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover99 (i : Fin 4) : Fin 4 := ⟨coverData99.get i % 4, Nat.mod_lt _ (by decide)⟩
def source99 (i : Fin 4) : Fin 4 := ⟨sourceData99.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree99 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 (.cutY 10240 (.cutX 1024 (.cutY 9216 (.cutX 512 .empty (.cutY 8704 (.cutX 768 (.cutY 8448 .full .empty) .empty) .empty)) .empty) .empty) .empty) .empty) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 (.cutX 9216 (.cutY 1024 (.cutX 8704 (.cutY 512 .empty (.cutX 8448 (.cutY 768 .full .empty) .empty)) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 .empty (.cutX 23552 .empty (.cutY 31744 .empty (.cutX 24064 .empty (.cutY 32256 (.cutX 24320 .empty (.cutY 32000 .empty .full)) .empty))))))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 .empty (.cutY 22528 .empty (.cutX 31744 .empty (.cutY 23552 .empty (.cutX 32256 (.cutY 24064 .empty (.cutX 32000 .empty (.cutY 24320 .empty .full))) .empty))))))) .empty))))

theorem metadata99 : 0<475523442 ∧ 2<128 ∧ 32<128 ∧ 1<4 ∧
    4444/4160=1 ∧ 4444%4160=284 ∧ ∀ i, (leaves99 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData99).mp
    (by decide +kernel)

theorem sourceChecked99_0 : ∀ i : Fin 4,
    (fun i => output99 i = raw99 (source99 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked99 : ∀ i : Fin 4, (fun i => output99 i = raw99 (source99 i)) i :=
  forallFin_of_zero_offset (fun i => output99 i = raw99 (source99 i)) sourceChecked99_0

theorem coverChecked99_0 : ∀ i : Fin 4,
    (fun i => (output99 (cover99 i)).ContainsBox (raw99 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked99 : ∀ i : Fin 4, (fun i => (output99 (cover99 i)).ContainsBox (raw99 i)) i :=
  forallFin_of_zero_offset (fun i => (output99 (cover99 i)).ContainsBox (raw99 i)) coverChecked99_0

theorem treeChecked99 : tree99.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves99 : List.ofFn output99 = tree99.leaves ⟨0,32768,0,32768⟩ := by
  unfold output99
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked99 : gridTreeUnionCheck 32768 raw99 output99 cover99 source99 tree99 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked99, coverChecked99, treeChecked99, treeLeaves99⟩

theorem areaUnits99 : gridUnionAreaUnits output99 = 262144 := by decide +kernel

noncomputable def phaseMass99 : ℝ := singlePhaseMass (475523442/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw99 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass99_eq : phaseMass99 = (237761721/819200000000 : ℝ) := by
  unfold phaseMass99
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw99 output99 cover99 source99
    (gridTreeUnionCheck_sound 32768 raw99 output99 cover99 source99 tree99 checked99)
    _ (by norm_num) _, areaUnits99]
  norm_num

-- Frozen phase 2596, atom 7737, type 1, source (40,57).
def leavesData100 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves100 : Fin 4 → DyadicLeaf := leavesData100.get
def raw100 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 40 57 leaves100 i
def outputData100 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨10240,10368,14592,14720⟩) (.single ⟨10240,10368,14720,14848⟩)) (.node (.single ⟨10368,10496,14592,14720⟩) (.single ⟨10368,10496,14720,14848⟩))) (.node (.node (.single ⟨14592,14720,10240,10368⟩) (.single ⟨14592,14720,10368,10496⟩)) (.node (.single ⟨14720,14848,10240,10368⟩) (.single ⟨14720,14848,10368,10496⟩)))) (.node (.node (.node (.single ⟨17920,18048,22272,22400⟩) (.single ⟨17920,18048,22400,22528⟩)) (.node (.single ⟨18048,18176,22272,22400⟩) (.single ⟨18048,18176,22400,22528⟩))) (.node (.node (.single ⟨22272,22400,17920,18048⟩) (.single ⟨22272,22400,18048,18176⟩)) (.node (.single ⟨22400,22528,17920,18048⟩) (.single ⟨22400,22528,18048,18176⟩)))))
def output100 : Fin 16 → GridBox := outputData100.get
def coverData100 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData100 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover100 (i : Fin 16) : Fin 16 := ⟨coverData100.get i % 16, Nat.mod_lt _ (by decide)⟩
def source100 (i : Fin 16) : Fin 16 := ⟨sourceData100.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree100 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 .empty (.cutY 14336 .empty (.cutX 11264 (.cutY 15360 (.cutX 10752 (.cutY 14848 (.cutX 10496 (.cutY 14592 .empty (.cutX 10368 (.cutY 14720 .full .full) (.cutY 14720 .full .full))) .empty) .empty) .empty) .empty) .empty)))) (.cutY 12288 (.cutX 14336 .empty (.cutY 10240 .empty (.cutX 15360 (.cutY 11264 (.cutX 14848 (.cutY 10752 (.cutX 14592 .empty (.cutY 10496 (.cutX 14720 (.cutY 10368 .full .full) (.cutY 10368 .full .full)) .empty)) .empty) .empty) .empty) .empty))) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 (.cutY 22528 (.cutX 17408 .empty (.cutY 21504 .empty (.cutX 17920 .empty (.cutY 22016 .empty (.cutX 18176 (.cutY 22272 .empty (.cutX 18048 (.cutY 22400 .full .full) (.cutY 22400 .full .full))) .empty))))) .empty) .empty)) (.cutY 20480 (.cutX 22528 (.cutY 18432 (.cutX 21504 .empty (.cutY 17408 .empty (.cutX 22016 .empty (.cutY 17920 .empty (.cutX 22272 .empty (.cutY 18176 (.cutX 22400 (.cutY 18048 .full .full) (.cutY 18048 .full .full)) .empty)))))) .empty) .empty) .empty)) .empty) .empty)))

theorem metadata100 : 0<82140708 ∧ 40<128 ∧ 57<128 ∧ 1<4 ∧
    7737/4160=1 ∧ 7737%4160=3577 ∧ ∀ i, (leaves100 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData100).mp
    (by decide +kernel)

theorem sourceChecked100_0 : ∀ i : Fin 16,
    (fun i => output100 i = raw100 (source100 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked100 : ∀ i : Fin 16, (fun i => output100 i = raw100 (source100 i)) i :=
  forallFin_of_zero_offset (fun i => output100 i = raw100 (source100 i)) sourceChecked100_0

theorem coverChecked100_0 : ∀ i : Fin 16,
    (fun i => (output100 (cover100 i)).ContainsBox (raw100 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked100 : ∀ i : Fin 16, (fun i => (output100 (cover100 i)).ContainsBox (raw100 i)) i :=
  forallFin_of_zero_offset (fun i => (output100 (cover100 i)).ContainsBox (raw100 i)) coverChecked100_0

theorem treeChecked100 : tree100.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves100 : List.ofFn output100 = tree100.leaves ⟨0,32768,0,32768⟩ := by
  unfold output100
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked100 : gridTreeUnionCheck 32768 raw100 output100 cover100 source100 tree100 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked100, coverChecked100, treeChecked100, treeLeaves100⟩

theorem areaUnits100 : gridUnionAreaUnits output100 = 262144 := by decide +kernel

noncomputable def phaseMass100 : ℝ := singlePhaseMass (82140708/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw100 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass100_eq : phaseMass100 = (20535177/409600000000 : ℝ) := by
  unfold phaseMass100
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw100 output100 cover100 source100
    (gridTreeUnionCheck_sound 32768 raw100 output100 cover100 source100 tree100 checked100)
    _ (by norm_num) _, areaUnits100]
  norm_num

-- Frozen phase 2597, atom 2461, type 0, source (23,46).
def leavesData101 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves101 : Fin 1 → DyadicLeaf := leavesData101.get
def raw101 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 23 46 leaves101 i
def outputData101 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨5888,6144,11776,12032⟩) (.single ⟨11776,12032,5888,6144⟩)) (.node (.single ⟨20736,20992,26624,26880⟩) (.single ⟨26624,26880,20736,20992⟩)))
def output101 : Fin 4 → GridBox := outputData101.get
def coverData101 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData101 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover101 (i : Fin 4) : Fin 4 := ⟨coverData101.get i % 4, Nat.mod_lt _ (by decide)⟩
def source101 (i : Fin 4) : Fin 4 := ⟨sourceData101.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree101 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 (.cutY 10240 .empty (.cutX 5120 .empty (.cutY 11264 .empty (.cutX 5632 .empty (.cutY 11776 .empty (.cutX 5888 .empty (.cutY 12032 .full .empty))))))) .empty) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 .empty (.cutY 6144 (.cutX 11264 .empty (.cutY 5120 .empty (.cutX 11776 .empty (.cutY 5632 .empty (.cutX 12032 (.cutY 5888 .empty .full) .empty))))) .empty))) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 (.cutY 26624 .empty (.cutX 21504 (.cutY 27648 (.cutX 20992 (.cutY 27136 (.cutX 20736 .empty (.cutY 26880 .full .empty)) .empty) .empty) .empty) .empty)) .empty) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 .empty (.cutY 22528 (.cutX 27648 (.cutY 21504 (.cutX 27136 (.cutY 20992 (.cutX 26880 (.cutY 20736 .empty .full) .empty) .empty) .empty) .empty) .empty) .empty))) .empty) .empty))))

theorem metadata101 : 0<73667111 ∧ 23<128 ∧ 46<128 ∧ 0<4 ∧
    2461/4160=0 ∧ 2461%4160=2461 ∧ ∀ i, (leaves101 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData101).mp
    (by decide +kernel)

theorem sourceChecked101_0 : ∀ i : Fin 4,
    (fun i => output101 i = raw101 (source101 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked101 : ∀ i : Fin 4, (fun i => output101 i = raw101 (source101 i)) i :=
  forallFin_of_zero_offset (fun i => output101 i = raw101 (source101 i)) sourceChecked101_0

theorem coverChecked101_0 : ∀ i : Fin 4,
    (fun i => (output101 (cover101 i)).ContainsBox (raw101 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked101 : ∀ i : Fin 4, (fun i => (output101 (cover101 i)).ContainsBox (raw101 i)) i :=
  forallFin_of_zero_offset (fun i => (output101 (cover101 i)).ContainsBox (raw101 i)) coverChecked101_0

theorem treeChecked101 : tree101.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves101 : List.ofFn output101 = tree101.leaves ⟨0,32768,0,32768⟩ := by
  unfold output101
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked101 : gridTreeUnionCheck 32768 raw101 output101 cover101 source101 tree101 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked101, coverChecked101, treeChecked101, treeLeaves101⟩

theorem areaUnits101 : gridUnionAreaUnits output101 = 262144 := by decide +kernel

noncomputable def phaseMass101 : ℝ := singlePhaseMass (73667111/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw101 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass101_eq : phaseMass101 = (73667111/1638400000000 : ℝ) := by
  unfold phaseMass101
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw101 output101 cover101 source101
    (gridTreeUnionCheck_sound 32768 raw101 output101 cover101 source101 tree101 checked101)
    _ (by norm_num) _, areaUnits101]
  norm_num

-- Frozen phase 2598, atom 2777, type 0, source (27,50).
def leavesData102 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves102 : Fin 1 → DyadicLeaf := leavesData102.get
def raw102 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 27 50 leaves102 i
def outputData102 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨6912,7168,12800,13056⟩) (.single ⟨12800,13056,6912,7168⟩)) (.node (.single ⟨19712,19968,25600,25856⟩) (.single ⟨25600,25856,19712,19968⟩)))
def output102 : Fin 4 → GridBox := outputData102.get
def coverData102 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData102 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover102 (i : Fin 4) : Fin 4 := ⟨coverData102.get i % 4, Nat.mod_lt _ (by decide)⟩
def source102 (i : Fin 4) : Fin 4 := ⟨sourceData102.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree102 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 .empty (.cutY 14336 (.cutX 7168 (.cutY 13312 (.cutX 6656 .empty (.cutY 12800 .empty (.cutX 6912 .empty (.cutY 13056 .full .empty)))) .empty) .empty) .empty))))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 (.cutY 6144 .empty (.cutX 13312 (.cutY 7168 (.cutX 12800 .empty (.cutY 6656 .empty (.cutX 13056 (.cutY 6912 .empty .full) .empty))) .empty) .empty)) .empty))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 .empty (.cutY 26624 (.cutX 19456 .empty (.cutY 25600 .empty (.cutX 19968 (.cutY 26112 (.cutX 19712 .empty (.cutY 25856 .full .empty)) .empty) .empty))) .empty)) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 (.cutY 18432 .empty (.cutX 25600 .empty (.cutY 19456 .empty (.cutX 26112 (.cutY 19968 (.cutX 25856 (.cutY 19712 .empty .full) .empty) .empty) .empty)))) .empty) .empty) .empty) .empty))))

theorem metadata102 : 0<300263580 ∧ 27<128 ∧ 50<128 ∧ 0<4 ∧
    2777/4160=0 ∧ 2777%4160=2777 ∧ ∀ i, (leaves102 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData102).mp
    (by decide +kernel)

theorem sourceChecked102_0 : ∀ i : Fin 4,
    (fun i => output102 i = raw102 (source102 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked102 : ∀ i : Fin 4, (fun i => output102 i = raw102 (source102 i)) i :=
  forallFin_of_zero_offset (fun i => output102 i = raw102 (source102 i)) sourceChecked102_0

theorem coverChecked102_0 : ∀ i : Fin 4,
    (fun i => (output102 (cover102 i)).ContainsBox (raw102 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked102 : ∀ i : Fin 4, (fun i => (output102 (cover102 i)).ContainsBox (raw102 i)) i :=
  forallFin_of_zero_offset (fun i => (output102 (cover102 i)).ContainsBox (raw102 i)) coverChecked102_0

theorem treeChecked102 : tree102.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves102 : List.ofFn output102 = tree102.leaves ⟨0,32768,0,32768⟩ := by
  unfold output102
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked102 : gridTreeUnionCheck 32768 raw102 output102 cover102 source102 tree102 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked102, coverChecked102, treeChecked102, treeLeaves102⟩

theorem areaUnits102 : gridUnionAreaUnits output102 = 262144 := by decide +kernel

noncomputable def phaseMass102 : ℝ := singlePhaseMass (300263580/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw102 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass102_eq : phaseMass102 = (15013179/81920000000 : ℝ) := by
  unfold phaseMass102
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw102 output102 cover102 source102
    (gridTreeUnionCheck_sound 32768 raw102 output102 cover102 source102 tree102 checked102)
    _ (by norm_num) _, areaUnits102]
  norm_num

-- Frozen phase 2599, atom 2377, type 0, source (22,45).
def leavesData103 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves103 : Fin 1 → DyadicLeaf := leavesData103.get
def raw103 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 22 45 leaves103 i
def outputData103 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨5632,5888,11520,11776⟩) (.single ⟨11520,11776,5632,5888⟩)) (.node (.single ⟨20992,21248,26880,27136⟩) (.single ⟨26880,27136,20992,21248⟩)))
def output103 : Fin 4 → GridBox := outputData103.get
def coverData103 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData103 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover103 (i : Fin 4) : Fin 4 := ⟨coverData103.get i % 4, Nat.mod_lt _ (by decide)⟩
def source103 (i : Fin 4) : Fin 4 := ⟨sourceData103.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree103 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 (.cutY 10240 .empty (.cutX 5120 .empty (.cutY 11264 .empty (.cutX 5632 .empty (.cutY 11776 (.cutX 5888 (.cutY 11520 .empty .full) .empty) .empty))))) .empty) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 .empty (.cutY 6144 (.cutX 11264 .empty (.cutY 5120 .empty (.cutX 11776 (.cutY 5632 .empty (.cutX 11520 .empty (.cutY 5888 .full .empty))) .empty))) .empty))) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 (.cutY 26624 .empty (.cutX 21504 (.cutY 27648 (.cutX 20992 .empty (.cutY 27136 (.cutX 21248 (.cutY 26880 .empty .full) .empty) .empty)) .empty) .empty)) .empty) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 .empty (.cutY 22528 (.cutX 27648 (.cutY 21504 (.cutX 27136 (.cutY 20992 .empty (.cutX 26880 .empty (.cutY 21248 .full .empty))) .empty) .empty) .empty) .empty))) .empty) .empty))))

theorem metadata103 : 0<73667111 ∧ 22<128 ∧ 45<128 ∧ 0<4 ∧
    2377/4160=0 ∧ 2377%4160=2377 ∧ ∀ i, (leaves103 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData103).mp
    (by decide +kernel)

theorem sourceChecked103_0 : ∀ i : Fin 4,
    (fun i => output103 i = raw103 (source103 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked103 : ∀ i : Fin 4, (fun i => output103 i = raw103 (source103 i)) i :=
  forallFin_of_zero_offset (fun i => output103 i = raw103 (source103 i)) sourceChecked103_0

theorem coverChecked103_0 : ∀ i : Fin 4,
    (fun i => (output103 (cover103 i)).ContainsBox (raw103 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked103 : ∀ i : Fin 4, (fun i => (output103 (cover103 i)).ContainsBox (raw103 i)) i :=
  forallFin_of_zero_offset (fun i => (output103 (cover103 i)).ContainsBox (raw103 i)) coverChecked103_0

theorem treeChecked103 : tree103.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves103 : List.ofFn output103 = tree103.leaves ⟨0,32768,0,32768⟩ := by
  unfold output103
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked103 : gridTreeUnionCheck 32768 raw103 output103 cover103 source103 tree103 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked103, coverChecked103, treeChecked103, treeLeaves103⟩

theorem areaUnits103 : gridUnionAreaUnits output103 = 262144 := by decide +kernel

noncomputable def phaseMass103 : ℝ := singlePhaseMass (73667111/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw103 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass103_eq : phaseMass103 = (73667111/1638400000000 : ℝ) := by
  unfold phaseMass103
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw103 output103 cover103 source103
    (gridTreeUnionCheck_sound 32768 raw103 output103 cover103 source103 tree103 checked103)
    _ (by norm_num) _, areaUnits103]
  norm_num

-- Frozen phase 2600, atom 5374, type 1, source (10,34).
def leavesData104 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves104 : Fin 4 → DyadicLeaf := leavesData104.get
def raw104 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 10 34 leaves104 i
def outputData104 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨2560,2688,8704,8832⟩) (.single ⟨2560,2688,8832,8960⟩)) (.node (.single ⟨2688,2816,8704,8832⟩) (.single ⟨2688,2816,8832,8960⟩))) (.node (.node (.single ⟨8704,8832,2560,2688⟩) (.single ⟨8704,8832,2688,2816⟩)) (.node (.single ⟨8832,8960,2560,2688⟩) (.single ⟨8832,8960,2688,2816⟩)))) (.node (.node (.node (.single ⟨23808,23936,29952,30080⟩) (.single ⟨23808,23936,30080,30208⟩)) (.node (.single ⟨23936,24064,29952,30080⟩) (.single ⟨23936,24064,30080,30208⟩))) (.node (.node (.single ⟨29952,30080,23808,23936⟩) (.single ⟨29952,30080,23936,24064⟩)) (.node (.single ⟨30080,30208,23808,23936⟩) (.single ⟨30080,30208,23936,24064⟩)))))
def output104 : Fin 16 → GridBox := outputData104.get
def coverData104 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData104 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover104 (i : Fin 16) : Fin 16 := ⟨coverData104.get i % 16, Nat.mod_lt _ (by decide)⟩
def source104 (i : Fin 16) : Fin 16 := ⟨sourceData104.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree104 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 .empty (.cutY 10240 (.cutX 3072 (.cutY 9216 (.cutX 2560 .empty (.cutY 8704 .empty (.cutX 2816 (.cutY 8960 (.cutX 2688 (.cutY 8832 .full .full) (.cutY 8832 .full .full)) .empty) .empty))) .empty) .empty) .empty)) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 .empty (.cutX 9216 (.cutY 3072 (.cutX 8704 .empty (.cutY 2560 .empty (.cutX 8960 (.cutY 2816 (.cutX 8832 (.cutY 2688 .full .full) (.cutY 2688 .full .full)) .empty) .empty))) .empty) .empty)) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 (.cutX 23552 .empty (.cutY 29696 .empty (.cutX 24064 (.cutY 30208 (.cutX 23808 .empty (.cutY 29952 .empty (.cutX 23936 (.cutY 30080 .full .full) (.cutY 30080 .full .full)))) .empty) .empty))) .empty))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 (.cutY 22528 .empty (.cutX 29696 .empty (.cutY 23552 .empty (.cutX 30208 (.cutY 24064 (.cutX 29952 .empty (.cutY 23808 .empty (.cutX 30080 (.cutY 23936 .full .full) (.cutY 23936 .full .full)))) .empty) .empty)))) .empty))) .empty))))

theorem metadata104 : 0<190129790 ∧ 10<128 ∧ 34<128 ∧ 1<4 ∧
    5374/4160=1 ∧ 5374%4160=1214 ∧ ∀ i, (leaves104 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData104).mp
    (by decide +kernel)

theorem sourceChecked104_0 : ∀ i : Fin 16,
    (fun i => output104 i = raw104 (source104 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked104 : ∀ i : Fin 16, (fun i => output104 i = raw104 (source104 i)) i :=
  forallFin_of_zero_offset (fun i => output104 i = raw104 (source104 i)) sourceChecked104_0

theorem coverChecked104_0 : ∀ i : Fin 16,
    (fun i => (output104 (cover104 i)).ContainsBox (raw104 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked104 : ∀ i : Fin 16, (fun i => (output104 (cover104 i)).ContainsBox (raw104 i)) i :=
  forallFin_of_zero_offset (fun i => (output104 (cover104 i)).ContainsBox (raw104 i)) coverChecked104_0

theorem treeChecked104 : tree104.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves104 : List.ofFn output104 = tree104.leaves ⟨0,32768,0,32768⟩ := by
  unfold output104
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked104 : gridTreeUnionCheck 32768 raw104 output104 cover104 source104 tree104 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked104, coverChecked104, treeChecked104, treeLeaves104⟩

theorem areaUnits104 : gridUnionAreaUnits output104 = 262144 := by decide +kernel

noncomputable def phaseMass104 : ℝ := singlePhaseMass (190129790/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw104 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass104_eq : phaseMass104 = (19012979/163840000000 : ℝ) := by
  unfold phaseMass104
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw104 output104 cover104 source104
    (gridTreeUnionCheck_sound 32768 raw104 output104 cover104 source104 tree104 checked104)
    _ (by norm_num) _, areaUnits104]
  norm_num

-- Frozen phase 2601, atom 5792, type 1, source (14,36).
def leavesData105 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves105 : Fin 4 → DyadicLeaf := leavesData105.get
def raw105 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 14 36 leaves105 i
def outputData105 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨3584,3712,9216,9344⟩) (.single ⟨3584,3712,9344,9472⟩)) (.node (.single ⟨3712,3840,9216,9344⟩) (.single ⟨3712,3840,9344,9472⟩))) (.node (.node (.single ⟨9216,9344,3584,3712⟩) (.single ⟨9216,9344,3712,3840⟩)) (.node (.single ⟨9344,9472,3584,3712⟩) (.single ⟨9344,9472,3712,3840⟩)))) (.node (.node (.node (.single ⟨23296,23424,28928,29056⟩) (.single ⟨23296,23424,29056,29184⟩)) (.node (.single ⟨23424,23552,28928,29056⟩) (.single ⟨23424,23552,29056,29184⟩))) (.node (.node (.single ⟨28928,29056,23296,23424⟩) (.single ⟨28928,29056,23424,23552⟩)) (.node (.single ⟨29056,29184,23296,23424⟩) (.single ⟨29056,29184,23424,23552⟩)))))
def output105 : Fin 16 → GridBox := outputData105.get
def coverData105 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData105 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover105 (i : Fin 16) : Fin 16 := ⟨coverData105.get i % 16, Nat.mod_lt _ (by decide)⟩
def source105 (i : Fin 16) : Fin 16 := ⟨sourceData105.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree105 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 .empty (.cutY 10240 (.cutX 3072 .empty (.cutY 9216 .empty (.cutX 3584 .empty (.cutY 9728 (.cutX 3840 (.cutY 9472 (.cutX 3712 (.cutY 9344 .full .full) (.cutY 9344 .full .full)) .empty) .empty) .empty)))) .empty)) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 .empty (.cutX 9216 .empty (.cutY 3072 .empty (.cutX 9728 (.cutY 3584 .empty (.cutX 9472 (.cutY 3840 (.cutX 9344 (.cutY 3712 .full .full) (.cutY 3712 .full .full)) .empty) .empty)) .empty)))) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 (.cutX 23552 (.cutY 29696 (.cutX 23040 .empty (.cutY 29184 (.cutX 23296 .empty (.cutY 28928 .empty (.cutX 23424 (.cutY 29056 .full .full) (.cutY 29056 .full .full)))) .empty)) .empty) .empty) .empty))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 (.cutY 22528 .empty (.cutX 29696 (.cutY 23552 (.cutX 29184 (.cutY 23040 .empty (.cutX 28928 .empty (.cutY 23296 .empty (.cutX 29056 (.cutY 23424 .full .full) (.cutY 23424 .full .full))))) .empty) .empty) .empty)) .empty))) .empty))))

theorem metadata105 : 0<190129790 ∧ 14<128 ∧ 36<128 ∧ 1<4 ∧
    5792/4160=1 ∧ 5792%4160=1632 ∧ ∀ i, (leaves105 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData105).mp
    (by decide +kernel)

theorem sourceChecked105_0 : ∀ i : Fin 16,
    (fun i => output105 i = raw105 (source105 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked105 : ∀ i : Fin 16, (fun i => output105 i = raw105 (source105 i)) i :=
  forallFin_of_zero_offset (fun i => output105 i = raw105 (source105 i)) sourceChecked105_0

theorem coverChecked105_0 : ∀ i : Fin 16,
    (fun i => (output105 (cover105 i)).ContainsBox (raw105 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked105 : ∀ i : Fin 16, (fun i => (output105 (cover105 i)).ContainsBox (raw105 i)) i :=
  forallFin_of_zero_offset (fun i => (output105 (cover105 i)).ContainsBox (raw105 i)) coverChecked105_0

theorem treeChecked105 : tree105.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves105 : List.ofFn output105 = tree105.leaves ⟨0,32768,0,32768⟩ := by
  unfold output105
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked105 : gridTreeUnionCheck 32768 raw105 output105 cover105 source105 tree105 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked105, coverChecked105, treeChecked105, treeLeaves105⟩

theorem areaUnits105 : gridUnionAreaUnits output105 = 262144 := by decide +kernel

noncomputable def phaseMass105 : ℝ := singlePhaseMass (190129790/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw105 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass105_eq : phaseMass105 = (19012979/163840000000 : ℝ) := by
  unfold phaseMass105
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw105 output105 cover105 source105
    (gridTreeUnionCheck_sound 32768 raw105 output105 cover105 source105 tree105 checked105)
    _ (by norm_num) _, areaUnits105]
  norm_num

-- Frozen phase 2602, atom 5587, type 1, source (12,35).
def leavesData106 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves106 : Fin 4 → DyadicLeaf := leavesData106.get
def raw106 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 12 35 leaves106 i
def outputData106 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨3072,3200,8960,9088⟩) (.single ⟨3072,3200,9088,9216⟩)) (.node (.single ⟨3200,3328,8960,9088⟩) (.single ⟨3200,3328,9088,9216⟩))) (.node (.node (.single ⟨8960,9088,3072,3200⟩) (.single ⟨8960,9088,3200,3328⟩)) (.node (.single ⟨9088,9216,3072,3200⟩) (.single ⟨9088,9216,3200,3328⟩)))) (.node (.node (.node (.single ⟨23552,23680,29440,29568⟩) (.single ⟨23552,23680,29568,29696⟩)) (.node (.single ⟨23680,23808,29440,29568⟩) (.single ⟨23680,23808,29568,29696⟩))) (.node (.node (.single ⟨29440,29568,23552,23680⟩) (.single ⟨29440,29568,23680,23808⟩)) (.node (.single ⟨29568,29696,23552,23680⟩) (.single ⟨29568,29696,23680,23808⟩)))))
def output106 : Fin 16 → GridBox := outputData106.get
def coverData106 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData106 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover106 (i : Fin 16) : Fin 16 := ⟨coverData106.get i % 16, Nat.mod_lt _ (by decide)⟩
def source106 (i : Fin 16) : Fin 16 := ⟨sourceData106.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree106 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 .empty (.cutY 10240 (.cutX 3072 .empty (.cutY 9216 (.cutX 3584 (.cutY 8704 .empty (.cutX 3328 (.cutY 8960 .empty (.cutX 3200 (.cutY 9088 .full .full) (.cutY 9088 .full .full))) .empty)) .empty) .empty)) .empty)) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 .empty (.cutX 9216 (.cutY 3072 .empty (.cutX 8704 .empty (.cutY 3584 (.cutX 8960 .empty (.cutY 3328 (.cutX 9088 (.cutY 3200 .full .full) (.cutY 3200 .full .full)) .empty)) .empty))) .empty)) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 (.cutX 23552 .empty (.cutY 29696 (.cutX 24064 (.cutY 29184 .empty (.cutX 23808 (.cutY 29440 .empty (.cutX 23680 (.cutY 29568 .full .full) (.cutY 29568 .full .full))) .empty)) .empty) .empty)) .empty))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 (.cutY 22528 .empty (.cutX 29696 (.cutY 23552 .empty (.cutX 29184 .empty (.cutY 24064 (.cutX 29440 .empty (.cutY 23808 (.cutX 29568 (.cutY 23680 .full .full) (.cutY 23680 .full .full)) .empty)) .empty))) .empty)) .empty))) .empty))))

theorem metadata106 : 0<190129790 ∧ 12<128 ∧ 35<128 ∧ 1<4 ∧
    5587/4160=1 ∧ 5587%4160=1427 ∧ ∀ i, (leaves106 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData106).mp
    (by decide +kernel)

theorem sourceChecked106_0 : ∀ i : Fin 16,
    (fun i => output106 i = raw106 (source106 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked106 : ∀ i : Fin 16, (fun i => output106 i = raw106 (source106 i)) i :=
  forallFin_of_zero_offset (fun i => output106 i = raw106 (source106 i)) sourceChecked106_0

theorem coverChecked106_0 : ∀ i : Fin 16,
    (fun i => (output106 (cover106 i)).ContainsBox (raw106 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked106 : ∀ i : Fin 16, (fun i => (output106 (cover106 i)).ContainsBox (raw106 i)) i :=
  forallFin_of_zero_offset (fun i => (output106 (cover106 i)).ContainsBox (raw106 i)) coverChecked106_0

theorem treeChecked106 : tree106.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves106 : List.ofFn output106 = tree106.leaves ⟨0,32768,0,32768⟩ := by
  unfold output106
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked106 : gridTreeUnionCheck 32768 raw106 output106 cover106 source106 tree106 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked106, coverChecked106, treeChecked106, treeLeaves106⟩

theorem areaUnits106 : gridUnionAreaUnits output106 = 262144 := by decide +kernel

noncomputable def phaseMass106 : ℝ := singlePhaseMass (190129790/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw106 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass106_eq : phaseMass106 = (19012979/163840000000 : ℝ) := by
  unfold phaseMass106
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw106 output106 cover106 source106
    (gridTreeUnionCheck_sound 32768 raw106 output106 cover106 source106 tree106 checked106)
    _ (by norm_num) _, areaUnits106]
  norm_num

-- Frozen phase 2603, atom 5989, type 1, source (16,37).
def leavesData107 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves107 : Fin 4 → DyadicLeaf := leavesData107.get
def raw107 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 16 37 leaves107 i
def outputData107 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨4096,4224,9472,9600⟩) (.single ⟨4096,4224,9600,9728⟩)) (.node (.single ⟨4224,4352,9472,9600⟩) (.single ⟨4224,4352,9600,9728⟩))) (.node (.node (.single ⟨9472,9600,4096,4224⟩) (.single ⟨9472,9600,4224,4352⟩)) (.node (.single ⟨9600,9728,4096,4224⟩) (.single ⟨9600,9728,4224,4352⟩)))) (.node (.node (.node (.single ⟨23040,23168,28416,28544⟩) (.single ⟨23040,23168,28544,28672⟩)) (.node (.single ⟨23168,23296,28416,28544⟩) (.single ⟨23168,23296,28544,28672⟩))) (.node (.node (.single ⟨28416,28544,23040,23168⟩) (.single ⟨28416,28544,23168,23296⟩)) (.node (.single ⟨28544,28672,23040,23168⟩) (.single ⟨28544,28672,23168,23296⟩)))))
def output107 : Fin 16 → GridBox := outputData107.get
def coverData107 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData107 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover107 (i : Fin 16) : Fin 16 := ⟨coverData107.get i % 16, Nat.mod_lt _ (by decide)⟩
def source107 (i : Fin 16) : Fin 16 := ⟨sourceData107.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree107 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 (.cutY 10240 (.cutX 5120 (.cutY 9216 .empty (.cutX 4608 (.cutY 9728 (.cutX 4352 (.cutY 9472 .empty (.cutX 4224 (.cutY 9600 .full .full) (.cutY 9600 .full .full))) .empty) .empty) .empty)) .empty) .empty) .empty) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 (.cutY 6144 (.cutX 9216 .empty (.cutY 5120 (.cutX 9728 (.cutY 4608 (.cutX 9472 .empty (.cutY 4352 (.cutX 9600 (.cutY 4224 .full .full) (.cutY 4224 .full .full)) .empty)) .empty) .empty) .empty)) .empty) .empty)) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 .empty (.cutY 26624 .empty (.cutX 23552 (.cutY 27648 .empty (.cutX 23040 .empty (.cutY 28160 .empty (.cutX 23296 (.cutY 28416 .empty (.cutX 23168 (.cutY 28544 .full .full) (.cutY 28544 .full .full))) .empty)))) .empty))) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 .empty (.cutY 22528 .empty (.cutX 27648 .empty (.cutY 23552 (.cutX 28160 .empty (.cutY 23040 .empty (.cutX 28416 .empty (.cutY 23296 (.cutX 28544 (.cutY 23168 .full .full) (.cutY 23168 .full .full)) .empty)))) .empty))))) .empty) .empty))))

theorem metadata107 : 0<161185172 ∧ 16<128 ∧ 37<128 ∧ 1<4 ∧
    5989/4160=1 ∧ 5989%4160=1829 ∧ ∀ i, (leaves107 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData107).mp
    (by decide +kernel)

theorem sourceChecked107_0 : ∀ i : Fin 16,
    (fun i => output107 i = raw107 (source107 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked107 : ∀ i : Fin 16, (fun i => output107 i = raw107 (source107 i)) i :=
  forallFin_of_zero_offset (fun i => output107 i = raw107 (source107 i)) sourceChecked107_0

theorem coverChecked107_0 : ∀ i : Fin 16,
    (fun i => (output107 (cover107 i)).ContainsBox (raw107 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked107 : ∀ i : Fin 16, (fun i => (output107 (cover107 i)).ContainsBox (raw107 i)) i :=
  forallFin_of_zero_offset (fun i => (output107 (cover107 i)).ContainsBox (raw107 i)) coverChecked107_0

theorem treeChecked107 : tree107.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves107 : List.ofFn output107 = tree107.leaves ⟨0,32768,0,32768⟩ := by
  unfold output107
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked107 : gridTreeUnionCheck 32768 raw107 output107 cover107 source107 tree107 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked107, coverChecked107, treeChecked107, treeLeaves107⟩

theorem areaUnits107 : gridUnionAreaUnits output107 = 262144 := by decide +kernel

noncomputable def phaseMass107 : ℝ := singlePhaseMass (161185172/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw107 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass107_eq : phaseMass107 = (40296293/409600000000 : ℝ) := by
  unfold phaseMass107
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw107 output107 cover107 source107
    (gridTreeUnionCheck_sound 32768 raw107 output107 cover107 source107 tree107 checked107)
    _ (by norm_num) _, areaUnits107]
  norm_num

-- Frozen phase 2604, atom 7785, type 1, source (41,58).
def leavesData108 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves108 : Fin 4 → DyadicLeaf := leavesData108.get
def raw108 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 41 58 leaves108 i
def outputData108 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨10496,10624,14848,14976⟩) (.single ⟨10496,10624,14976,15104⟩)) (.node (.single ⟨10624,10752,14848,14976⟩) (.single ⟨10624,10752,14976,15104⟩))) (.node (.node (.single ⟨14848,14976,10496,10624⟩) (.single ⟨14848,14976,10624,10752⟩)) (.node (.single ⟨14976,15104,10496,10624⟩) (.single ⟨14976,15104,10624,10752⟩)))) (.node (.node (.node (.single ⟨17664,17792,22016,22144⟩) (.single ⟨17664,17792,22144,22272⟩)) (.node (.single ⟨17792,17920,22016,22144⟩) (.single ⟨17792,17920,22144,22272⟩))) (.node (.node (.single ⟨22016,22144,17664,17792⟩) (.single ⟨22016,22144,17792,17920⟩)) (.node (.single ⟨22144,22272,17664,17792⟩) (.single ⟨22144,22272,17792,17920⟩)))))
def output108 : Fin 16 → GridBox := outputData108.get
def coverData108 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData108 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover108 (i : Fin 16) : Fin 16 := ⟨coverData108.get i % 16, Nat.mod_lt _ (by decide)⟩
def source108 (i : Fin 16) : Fin 16 := ⟨sourceData108.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree108 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 .empty (.cutY 14336 .empty (.cutX 11264 (.cutY 15360 (.cutX 10752 (.cutY 14848 .empty (.cutX 10496 .empty (.cutY 15104 (.cutX 10624 (.cutY 14976 .full .full) (.cutY 14976 .full .full)) .empty))) .empty) .empty) .empty)))) (.cutY 12288 (.cutX 14336 .empty (.cutY 10240 .empty (.cutX 15360 (.cutY 11264 (.cutX 14848 .empty (.cutY 10752 (.cutX 15104 (.cutY 10496 .empty (.cutX 14976 (.cutY 10624 .full .full) (.cutY 10624 .full .full))) .empty) .empty)) .empty) .empty))) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 (.cutY 22528 (.cutX 17408 .empty (.cutY 21504 .empty (.cutX 17920 (.cutY 22016 .empty (.cutX 17664 .empty (.cutY 22272 (.cutX 17792 (.cutY 22144 .full .full) (.cutY 22144 .full .full)) .empty))) .empty))) .empty) .empty)) (.cutY 20480 (.cutX 22528 (.cutY 18432 (.cutX 21504 .empty (.cutY 17408 .empty (.cutX 22016 .empty (.cutY 17920 (.cutX 22272 (.cutY 17664 .empty (.cutX 22144 (.cutY 17792 .full .full) (.cutY 17792 .full .full))) .empty) .empty)))) .empty) .empty) .empty)) .empty) .empty)))

theorem metadata108 : 0<82140708 ∧ 41<128 ∧ 58<128 ∧ 1<4 ∧
    7785/4160=1 ∧ 7785%4160=3625 ∧ ∀ i, (leaves108 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData108).mp
    (by decide +kernel)

theorem sourceChecked108_0 : ∀ i : Fin 16,
    (fun i => output108 i = raw108 (source108 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked108 : ∀ i : Fin 16, (fun i => output108 i = raw108 (source108 i)) i :=
  forallFin_of_zero_offset (fun i => output108 i = raw108 (source108 i)) sourceChecked108_0

theorem coverChecked108_0 : ∀ i : Fin 16,
    (fun i => (output108 (cover108 i)).ContainsBox (raw108 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked108 : ∀ i : Fin 16, (fun i => (output108 (cover108 i)).ContainsBox (raw108 i)) i :=
  forallFin_of_zero_offset (fun i => (output108 (cover108 i)).ContainsBox (raw108 i)) coverChecked108_0

theorem treeChecked108 : tree108.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves108 : List.ofFn output108 = tree108.leaves ⟨0,32768,0,32768⟩ := by
  unfold output108
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked108 : gridTreeUnionCheck 32768 raw108 output108 cover108 source108 tree108 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked108, coverChecked108, treeChecked108, treeLeaves108⟩

theorem areaUnits108 : gridUnionAreaUnits output108 = 262144 := by decide +kernel

noncomputable def phaseMass108 : ℝ := singlePhaseMass (82140708/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw108 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass108_eq : phaseMass108 = (20535177/409600000000 : ℝ) := by
  unfold phaseMass108
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw108 output108 cover108 source108
    (gridTreeUnionCheck_sound 32768 raw108 output108 cover108 source108 tree108 checked108)
    _ (by norm_num) _, areaUnits108]
  norm_num

-- Frozen phase 2605, atom 651, type 0, source (5,36).
def leavesData109 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves109 : Fin 1 → DyadicLeaf := leavesData109.get
def raw109 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 5 36 leaves109 i
def outputData109 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨1280,1536,9216,9472⟩) (.single ⟨9216,9472,1280,1536⟩)) (.node (.single ⟨23296,23552,31232,31488⟩) (.single ⟨31232,31488,23296,23552⟩)))
def output109 : Fin 4 → GridBox := outputData109.get
def coverData109 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData109 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover109 (i : Fin 4) : Fin 4 := ⟨coverData109.get i % 4, Nat.mod_lt _ (by decide)⟩
def source109 (i : Fin 4) : Fin 4 := ⟨sourceData109.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree109 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 (.cutY 10240 (.cutX 1024 .empty (.cutY 9216 .empty (.cutX 1536 (.cutY 9728 (.cutX 1280 .empty (.cutY 9472 .full .empty)) .empty) .empty))) .empty) .empty) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 (.cutX 9216 .empty (.cutY 1024 .empty (.cutX 9728 (.cutY 1536 (.cutX 9472 (.cutY 1280 .empty .full) .empty) .empty) .empty))) .empty) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 .empty (.cutX 23552 (.cutY 31744 (.cutX 23040 .empty (.cutY 31232 .empty (.cutX 23296 .empty (.cutY 31488 .full .empty)))) .empty) .empty)))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 .empty (.cutY 22528 .empty (.cutX 31744 (.cutY 23552 (.cutX 31232 .empty (.cutY 23040 .empty (.cutX 31488 (.cutY 23296 .empty .full) .empty))) .empty) .empty))))) .empty))))

theorem metadata109 : 0<523383676 ∧ 5<128 ∧ 36<128 ∧ 0<4 ∧
    651/4160=0 ∧ 651%4160=651 ∧ ∀ i, (leaves109 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData109).mp
    (by decide +kernel)

theorem sourceChecked109_0 : ∀ i : Fin 4,
    (fun i => output109 i = raw109 (source109 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked109 : ∀ i : Fin 4, (fun i => output109 i = raw109 (source109 i)) i :=
  forallFin_of_zero_offset (fun i => output109 i = raw109 (source109 i)) sourceChecked109_0

theorem coverChecked109_0 : ∀ i : Fin 4,
    (fun i => (output109 (cover109 i)).ContainsBox (raw109 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked109 : ∀ i : Fin 4, (fun i => (output109 (cover109 i)).ContainsBox (raw109 i)) i :=
  forallFin_of_zero_offset (fun i => (output109 (cover109 i)).ContainsBox (raw109 i)) coverChecked109_0

theorem treeChecked109 : tree109.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves109 : List.ofFn output109 = tree109.leaves ⟨0,32768,0,32768⟩ := by
  unfold output109
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked109 : gridTreeUnionCheck 32768 raw109 output109 cover109 source109 tree109 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked109, coverChecked109, treeChecked109, treeLeaves109⟩

theorem areaUnits109 : gridUnionAreaUnits output109 = 262144 := by decide +kernel

noncomputable def phaseMass109 : ℝ := singlePhaseMass (523383676/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw109 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass109_eq : phaseMass109 = (130845919/409600000000 : ℝ) := by
  unfold phaseMass109
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw109 output109 cover109 source109
    (gridTreeUnionCheck_sound 32768 raw109 output109 cover109 source109 tree109 checked109)
    _ (by norm_num) _, areaUnits109]
  norm_num

-- Frozen phase 2606, atom 4689, type 1, source (4,33).
def leavesData110 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves110 : Fin 1 → DyadicLeaf := leavesData110.get
def raw110 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 4 33 leaves110 i
def outputData110 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨1024,1280,8448,8704⟩) (.single ⟨8448,8704,1024,1280⟩)) (.node (.single ⟨24064,24320,31488,31744⟩) (.single ⟨31488,31744,24064,24320⟩)))
def output110 : Fin 4 → GridBox := outputData110.get
def coverData110 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData110 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover110 (i : Fin 4) : Fin 4 := ⟨coverData110.get i % 4, Nat.mod_lt _ (by decide)⟩
def source110 (i : Fin 4) : Fin 4 := ⟨sourceData110.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree110 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 (.cutY 10240 (.cutX 1024 .empty (.cutY 9216 (.cutX 1536 (.cutY 8704 (.cutX 1280 (.cutY 8448 .empty .full) .empty) .empty) .empty) .empty)) .empty) .empty) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 (.cutX 9216 (.cutY 1024 .empty (.cutX 8704 (.cutY 1536 (.cutX 8448 .empty (.cutY 1280 .full .empty)) .empty) .empty)) .empty) .empty) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 .empty (.cutX 23552 .empty (.cutY 31744 (.cutX 24064 .empty (.cutY 31232 .empty (.cutX 24320 (.cutY 31488 .empty .full) .empty))) .empty))))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 .empty (.cutY 22528 .empty (.cutX 31744 (.cutY 23552 .empty (.cutX 31232 .empty (.cutY 24064 .empty (.cutX 31488 .empty (.cutY 24320 .full .empty))))) .empty))))) .empty))))

theorem metadata110 : 0<475523442 ∧ 4<128 ∧ 33<128 ∧ 1<4 ∧
    4689/4160=1 ∧ 4689%4160=529 ∧ ∀ i, (leaves110 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData110).mp
    (by decide +kernel)

theorem sourceChecked110_0 : ∀ i : Fin 4,
    (fun i => output110 i = raw110 (source110 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked110 : ∀ i : Fin 4, (fun i => output110 i = raw110 (source110 i)) i :=
  forallFin_of_zero_offset (fun i => output110 i = raw110 (source110 i)) sourceChecked110_0

theorem coverChecked110_0 : ∀ i : Fin 4,
    (fun i => (output110 (cover110 i)).ContainsBox (raw110 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked110 : ∀ i : Fin 4, (fun i => (output110 (cover110 i)).ContainsBox (raw110 i)) i :=
  forallFin_of_zero_offset (fun i => (output110 (cover110 i)).ContainsBox (raw110 i)) coverChecked110_0

theorem treeChecked110 : tree110.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves110 : List.ofFn output110 = tree110.leaves ⟨0,32768,0,32768⟩ := by
  unfold output110
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked110 : gridTreeUnionCheck 32768 raw110 output110 cover110 source110 tree110 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked110, coverChecked110, treeChecked110, treeLeaves110⟩

theorem areaUnits110 : gridUnionAreaUnits output110 = 262144 := by decide +kernel

noncomputable def phaseMass110 : ℝ := singlePhaseMass (475523442/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw110 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass110_eq : phaseMass110 = (237761721/819200000000 : ℝ) := by
  unfold phaseMass110
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw110 output110 cover110 source110
    (gridTreeUnionCheck_sound 32768 raw110 output110 cover110 source110 tree110 checked110)
    _ (by norm_num) _, areaUnits110]
  norm_num

-- Frozen phase 2607, atom 7282, type 1, source (32,50).
def leavesData111 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves111 : Fin 4 → DyadicLeaf := leavesData111.get
def raw111 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 32 50 leaves111 i
def outputData111 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨8192,8320,12800,12928⟩) (.single ⟨8192,8320,12928,13056⟩)) (.node (.single ⟨8320,8448,12800,12928⟩) (.single ⟨8320,8448,12928,13056⟩))) (.node (.node (.single ⟨12800,12928,8192,8320⟩) (.single ⟨12800,12928,8320,8448⟩)) (.node (.single ⟨12928,13056,8192,8320⟩) (.single ⟨12928,13056,8320,8448⟩)))) (.node (.node (.node (.single ⟨19712,19840,24320,24448⟩) (.single ⟨19712,19840,24448,24576⟩)) (.node (.single ⟨19840,19968,24320,24448⟩) (.single ⟨19840,19968,24448,24576⟩))) (.node (.node (.single ⟨24320,24448,19712,19840⟩) (.single ⟨24320,24448,19840,19968⟩)) (.node (.single ⟨24448,24576,19712,19840⟩) (.single ⟨24448,24576,19840,19968⟩)))))
def output111 : Fin 16 → GridBox := outputData111.get
def coverData111 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData111 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover111 (i : Fin 16) : Fin 16 := ⟨coverData111.get i % 16, Nat.mod_lt _ (by decide)⟩
def source111 (i : Fin 16) : Fin 16 := ⟨sourceData111.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree111 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 (.cutY 14336 (.cutX 9216 (.cutY 13312 (.cutX 8704 (.cutY 12800 .empty (.cutX 8448 (.cutY 13056 (.cutX 8320 (.cutY 12928 .full .full) (.cutY 12928 .full .full)) .empty) .empty)) .empty) .empty) .empty) .empty) .empty)) (.cutY 12288 (.cutX 14336 (.cutY 10240 (.cutX 13312 (.cutY 9216 (.cutX 12800 .empty (.cutY 8704 (.cutX 13056 (.cutY 8448 (.cutX 12928 (.cutY 8320 .full .full) (.cutY 8320 .full .full)) .empty) .empty) .empty)) .empty) .empty) .empty) .empty) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 .empty (.cutY 22528 .empty (.cutX 19456 .empty (.cutY 23552 .empty (.cutX 19968 (.cutY 24064 .empty (.cutX 19712 .empty (.cutY 24320 .empty (.cutX 19840 (.cutY 24448 .full .full) (.cutY 24448 .full .full))))) .empty)))))) (.cutY 20480 (.cutX 22528 .empty (.cutY 18432 .empty (.cutX 23552 .empty (.cutY 19456 .empty (.cutX 24064 .empty (.cutY 19968 (.cutX 24320 .empty (.cutY 19712 .empty (.cutX 24448 (.cutY 19840 .full .full) (.cutY 19840 .full .full)))) .empty)))))) .empty)) .empty) .empty)))

theorem metadata111 : 0<134822691 ∧ 32<128 ∧ 50<128 ∧ 1<4 ∧
    7282/4160=1 ∧ 7282%4160=3122 ∧ ∀ i, (leaves111 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData111).mp
    (by decide +kernel)

theorem sourceChecked111_0 : ∀ i : Fin 16,
    (fun i => output111 i = raw111 (source111 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked111 : ∀ i : Fin 16, (fun i => output111 i = raw111 (source111 i)) i :=
  forallFin_of_zero_offset (fun i => output111 i = raw111 (source111 i)) sourceChecked111_0

theorem coverChecked111_0 : ∀ i : Fin 16,
    (fun i => (output111 (cover111 i)).ContainsBox (raw111 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked111 : ∀ i : Fin 16, (fun i => (output111 (cover111 i)).ContainsBox (raw111 i)) i :=
  forallFin_of_zero_offset (fun i => (output111 (cover111 i)).ContainsBox (raw111 i)) coverChecked111_0

theorem treeChecked111 : tree111.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves111 : List.ofFn output111 = tree111.leaves ⟨0,32768,0,32768⟩ := by
  unfold output111
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked111 : gridTreeUnionCheck 32768 raw111 output111 cover111 source111 tree111 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked111, coverChecked111, treeChecked111, treeLeaves111⟩

theorem areaUnits111 : gridUnionAreaUnits output111 = 262144 := by decide +kernel

noncomputable def phaseMass111 : ℝ := singlePhaseMass (134822691/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw111 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass111_eq : phaseMass111 = (134822691/1638400000000 : ℝ) := by
  unfold phaseMass111
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw111 output111 cover111 source111
    (gridTreeUnionCheck_sound 32768 raw111 output111 cover111 source111 tree111 checked111)
    _ (by norm_num) _, areaUnits111]
  norm_num

-- Frozen phase 2608, atom 3252, type 0, source (34,56).
def leavesData112 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves112 : Fin 1 → DyadicLeaf := leavesData112.get
def raw112 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 34 56 leaves112 i
def outputData112 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨8704,8960,14336,14592⟩) (.single ⟨14336,14592,8704,8960⟩)) (.node (.single ⟨18176,18432,23808,24064⟩) (.single ⟨23808,24064,18176,18432⟩)))
def output112 : Fin 4 → GridBox := outputData112.get
def coverData112 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData112 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover112 (i : Fin 4) : Fin 4 := ⟨coverData112.get i % 4, Nat.mod_lt _ (by decide)⟩
def source112 (i : Fin 4) : Fin 4 := ⟨sourceData112.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree112 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 (.cutY 14336 .empty (.cutX 9216 (.cutY 15360 (.cutX 8704 .empty (.cutY 14848 (.cutX 8960 (.cutY 14592 .full .empty) .empty) .empty)) .empty) .empty)) .empty)) (.cutY 12288 (.cutX 14336 .empty (.cutY 10240 (.cutX 15360 (.cutY 9216 (.cutX 14848 (.cutY 8704 .empty (.cutX 14592 (.cutY 8960 .full .empty) .empty)) .empty) .empty) .empty) .empty)) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 (.cutY 22528 .empty (.cutX 17408 .empty (.cutY 23552 .empty (.cutX 17920 .empty (.cutY 24064 (.cutX 18176 .empty (.cutY 23808 .empty .full)) .empty))))) .empty)) (.cutY 20480 (.cutX 22528 .empty (.cutY 18432 (.cutX 23552 .empty (.cutY 17408 .empty (.cutX 24064 (.cutY 17920 .empty (.cutX 23808 .empty (.cutY 18176 .empty .full))) .empty))) .empty)) .empty)) .empty) .empty)))

theorem metadata112 : 0<200205545 ∧ 34<128 ∧ 56<128 ∧ 0<4 ∧
    3252/4160=0 ∧ 3252%4160=3252 ∧ ∀ i, (leaves112 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData112).mp
    (by decide +kernel)

theorem sourceChecked112_0 : ∀ i : Fin 4,
    (fun i => output112 i = raw112 (source112 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked112 : ∀ i : Fin 4, (fun i => output112 i = raw112 (source112 i)) i :=
  forallFin_of_zero_offset (fun i => output112 i = raw112 (source112 i)) sourceChecked112_0

theorem coverChecked112_0 : ∀ i : Fin 4,
    (fun i => (output112 (cover112 i)).ContainsBox (raw112 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked112 : ∀ i : Fin 4, (fun i => (output112 (cover112 i)).ContainsBox (raw112 i)) i :=
  forallFin_of_zero_offset (fun i => (output112 (cover112 i)).ContainsBox (raw112 i)) coverChecked112_0

theorem treeChecked112 : tree112.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves112 : List.ofFn output112 = tree112.leaves ⟨0,32768,0,32768⟩ := by
  unfold output112
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked112 : gridTreeUnionCheck 32768 raw112 output112 cover112 source112 tree112 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked112, coverChecked112, treeChecked112, treeLeaves112⟩

theorem areaUnits112 : gridUnionAreaUnits output112 = 262144 := by decide +kernel

noncomputable def phaseMass112 : ℝ := singlePhaseMass (200205545/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw112 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass112_eq : phaseMass112 = (40041109/327680000000 : ℝ) := by
  unfold phaseMass112
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw112 output112 cover112 source112
    (gridTreeUnionCheck_sound 32768 raw112 output112 cover112 source112 tree112 checked112)
    _ (by norm_num) _, areaUnits112]
  norm_num

-- Frozen phase 2609, atom 2022, type 0, source (18,42).
def leavesData113 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves113 : Fin 1 → DyadicLeaf := leavesData113.get
def raw113 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 18 42 leaves113 i
def outputData113 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨4608,4864,10752,11008⟩) (.single ⟨10752,11008,4608,4864⟩)) (.node (.single ⟨21760,22016,27904,28160⟩) (.single ⟨27904,28160,21760,22016⟩)))
def output113 : Fin 4 → GridBox := outputData113.get
def coverData113 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData113 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover113 (i : Fin 4) : Fin 4 := ⟨coverData113.get i % 4, Nat.mod_lt _ (by decide)⟩
def source113 (i : Fin 4) : Fin 4 := ⟨sourceData113.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree113 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 (.cutY 10240 .empty (.cutX 5120 (.cutY 11264 (.cutX 4608 .empty (.cutY 10752 .empty (.cutX 4864 (.cutY 11008 .full .empty) .empty))) .empty) .empty)) .empty) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 .empty (.cutY 6144 (.cutX 11264 (.cutY 5120 (.cutX 10752 .empty (.cutY 4608 .empty (.cutX 11008 (.cutY 4864 .full .empty) .empty))) .empty) .empty) .empty))) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 (.cutY 26624 .empty (.cutX 21504 .empty (.cutY 27648 .empty (.cutX 22016 (.cutY 28160 (.cutX 21760 .empty (.cutY 27904 .empty .full)) .empty) .empty)))) .empty) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 .empty (.cutY 22528 (.cutX 27648 .empty (.cutY 21504 .empty (.cutX 28160 (.cutY 22016 (.cutX 27904 .empty (.cutY 21760 .empty .full)) .empty) .empty))) .empty))) .empty) .empty))))

theorem metadata113 : 0<73667111 ∧ 18<128 ∧ 42<128 ∧ 0<4 ∧
    2022/4160=0 ∧ 2022%4160=2022 ∧ ∀ i, (leaves113 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData113).mp
    (by decide +kernel)

theorem sourceChecked113_0 : ∀ i : Fin 4,
    (fun i => output113 i = raw113 (source113 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked113 : ∀ i : Fin 4, (fun i => output113 i = raw113 (source113 i)) i :=
  forallFin_of_zero_offset (fun i => output113 i = raw113 (source113 i)) sourceChecked113_0

theorem coverChecked113_0 : ∀ i : Fin 4,
    (fun i => (output113 (cover113 i)).ContainsBox (raw113 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked113 : ∀ i : Fin 4, (fun i => (output113 (cover113 i)).ContainsBox (raw113 i)) i :=
  forallFin_of_zero_offset (fun i => (output113 (cover113 i)).ContainsBox (raw113 i)) coverChecked113_0

theorem treeChecked113 : tree113.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves113 : List.ofFn output113 = tree113.leaves ⟨0,32768,0,32768⟩ := by
  unfold output113
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked113 : gridTreeUnionCheck 32768 raw113 output113 cover113 source113 tree113 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked113, coverChecked113, treeChecked113, treeLeaves113⟩

theorem areaUnits113 : gridUnionAreaUnits output113 = 262144 := by decide +kernel

noncomputable def phaseMass113 : ℝ := singlePhaseMass (73667111/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw113 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass113_eq : phaseMass113 = (73667111/1638400000000 : ℝ) := by
  unfold phaseMass113
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw113 output113 cover113 source113
    (gridTreeUnionCheck_sound 32768 raw113 output113 cover113 source113 tree113 checked113)
    _ (by norm_num) _, areaUnits113]
  norm_num

-- Frozen phase 2610, atom 1636, type 0, source (14,40).
def leavesData114 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves114 : Fin 1 → DyadicLeaf := leavesData114.get
def raw114 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 14 40 leaves114 i
def outputData114 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨3584,3840,10240,10496⟩) (.single ⟨10240,10496,3584,3840⟩)) (.node (.single ⟨22272,22528,28928,29184⟩) (.single ⟨28928,29184,22272,22528⟩)))
def output114 : Fin 4 → GridBox := outputData114.get
def coverData114 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData114 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover114 (i : Fin 4) : Fin 4 := ⟨coverData114.get i % 4, Nat.mod_lt _ (by decide)⟩
def source114 (i : Fin 4) : Fin 4 := ⟨sourceData114.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree114 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 .empty (.cutY 10240 .empty (.cutX 3072 .empty (.cutY 11264 (.cutX 3584 .empty (.cutY 10752 (.cutX 3840 (.cutY 10496 .full .empty) .empty) .empty)) .empty)))) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 .empty (.cutY 2048 .empty (.cutX 11264 (.cutY 3072 .empty (.cutX 10752 (.cutY 3584 .empty (.cutX 10496 (.cutY 3840 .full .empty) .empty)) .empty)) .empty))) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 (.cutY 30720 (.cutX 21504 .empty (.cutY 29696 (.cutX 22016 .empty (.cutY 29184 (.cutX 22272 .empty (.cutY 28928 .empty .full)) .empty)) .empty)) .empty) .empty)))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 (.cutY 22528 (.cutX 29696 (.cutY 21504 .empty (.cutX 29184 (.cutY 22016 .empty (.cutX 28928 .empty (.cutY 22272 .empty .full))) .empty)) .empty) .empty) .empty))) .empty))))

theorem metadata114 : 0<296697202 ∧ 14<128 ∧ 40<128 ∧ 0<4 ∧
    1636/4160=0 ∧ 1636%4160=1636 ∧ ∀ i, (leaves114 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData114).mp
    (by decide +kernel)

theorem sourceChecked114_0 : ∀ i : Fin 4,
    (fun i => output114 i = raw114 (source114 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked114 : ∀ i : Fin 4, (fun i => output114 i = raw114 (source114 i)) i :=
  forallFin_of_zero_offset (fun i => output114 i = raw114 (source114 i)) sourceChecked114_0

theorem coverChecked114_0 : ∀ i : Fin 4,
    (fun i => (output114 (cover114 i)).ContainsBox (raw114 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked114 : ∀ i : Fin 4, (fun i => (output114 (cover114 i)).ContainsBox (raw114 i)) i :=
  forallFin_of_zero_offset (fun i => (output114 (cover114 i)).ContainsBox (raw114 i)) coverChecked114_0

theorem treeChecked114 : tree114.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves114 : List.ofFn output114 = tree114.leaves ⟨0,32768,0,32768⟩ := by
  unfold output114
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked114 : gridTreeUnionCheck 32768 raw114 output114 cover114 source114 tree114 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked114, coverChecked114, treeChecked114, treeLeaves114⟩

theorem areaUnits114 : gridUnionAreaUnits output114 = 262144 := by decide +kernel

noncomputable def phaseMass114 : ℝ := singlePhaseMass (296697202/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw114 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass114_eq : phaseMass114 = (148348601/819200000000 : ℝ) := by
  unfold phaseMass114
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw114 output114 cover114 source114
    (gridTreeUnionCheck_sound 32768 raw114 output114 cover114 source114 tree114 checked114)
    _ (by norm_num) _, areaUnits114]
  norm_num

-- Frozen phase 2611, atom 287, type 0, source (2,35).
def leavesData115 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves115 : Fin 1 → DyadicLeaf := leavesData115.get
def raw115 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 2 35 leaves115 i
def outputData115 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨512,768,8960,9216⟩) (.single ⟨8960,9216,512,768⟩)) (.node (.single ⟨23552,23808,32000,32256⟩) (.single ⟨32000,32256,23552,23808⟩)))
def output115 : Fin 4 → GridBox := outputData115.get
def coverData115 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData115 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover115 (i : Fin 4) : Fin 4 := ⟨coverData115.get i % 4, Nat.mod_lt _ (by decide)⟩
def source115 (i : Fin 4) : Fin 4 := ⟨sourceData115.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree115 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 (.cutY 10240 (.cutX 1024 (.cutY 9216 (.cutX 512 .empty (.cutY 8704 .empty (.cutX 768 (.cutY 8960 .empty .full) .empty))) .empty) .empty) .empty) .empty) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 (.cutX 9216 (.cutY 1024 (.cutX 8704 .empty (.cutY 512 .empty (.cutX 8960 .empty (.cutY 768 .full .empty)))) .empty) .empty) .empty) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 .empty (.cutX 23552 .empty (.cutY 31744 .empty (.cutX 24064 (.cutY 32256 (.cutX 23808 (.cutY 32000 .empty .full) .empty) .empty) .empty)))))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 .empty (.cutY 22528 .empty (.cutX 31744 .empty (.cutY 23552 .empty (.cutX 32256 (.cutY 24064 (.cutX 32000 .empty (.cutY 23808 .full .empty)) .empty) .empty))))))) .empty))))

theorem metadata115 : 0<523383676 ∧ 2<128 ∧ 35<128 ∧ 0<4 ∧
    287/4160=0 ∧ 287%4160=287 ∧ ∀ i, (leaves115 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData115).mp
    (by decide +kernel)

theorem sourceChecked115_0 : ∀ i : Fin 4,
    (fun i => output115 i = raw115 (source115 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked115 : ∀ i : Fin 4, (fun i => output115 i = raw115 (source115 i)) i :=
  forallFin_of_zero_offset (fun i => output115 i = raw115 (source115 i)) sourceChecked115_0

theorem coverChecked115_0 : ∀ i : Fin 4,
    (fun i => (output115 (cover115 i)).ContainsBox (raw115 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked115 : ∀ i : Fin 4, (fun i => (output115 (cover115 i)).ContainsBox (raw115 i)) i :=
  forallFin_of_zero_offset (fun i => (output115 (cover115 i)).ContainsBox (raw115 i)) coverChecked115_0

theorem treeChecked115 : tree115.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves115 : List.ofFn output115 = tree115.leaves ⟨0,32768,0,32768⟩ := by
  unfold output115
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked115 : gridTreeUnionCheck 32768 raw115 output115 cover115 source115 tree115 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked115, coverChecked115, treeChecked115, treeLeaves115⟩

theorem areaUnits115 : gridUnionAreaUnits output115 = 262144 := by decide +kernel

noncomputable def phaseMass115 : ℝ := singlePhaseMass (523383676/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw115 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass115_eq : phaseMass115 = (130845919/409600000000 : ℝ) := by
  unfold phaseMass115
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw115 output115 cover115 source115
    (gridTreeUnionCheck_sound 32768 raw115 output115 cover115 source115 tree115 checked115)
    _ (by norm_num) _, areaUnits115]
  norm_num

-- Frozen phase 2612, atom 34, type 0, source (0,34).
def leavesData116 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves116 : Fin 1 → DyadicLeaf := leavesData116.get
def raw116 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 0 34 leaves116 i
def outputData116 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨0,256,8704,8960⟩) (.single ⟨8704,8960,0,256⟩)) (.node (.single ⟨23808,24064,32512,32768⟩) (.single ⟨32512,32768,23808,24064⟩)))
def output116 : Fin 4 → GridBox := outputData116.get
def coverData116 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData116 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover116 (i : Fin 4) : Fin 4 := ⟨coverData116.get i % 4, Nat.mod_lt _ (by decide)⟩
def source116 (i : Fin 4) : Fin 4 := ⟨sourceData116.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree116 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 (.cutY 10240 (.cutX 1024 (.cutY 9216 (.cutX 512 (.cutY 8704 .empty (.cutX 256 (.cutY 8960 .full .empty) .empty)) .empty) .empty) .empty) .empty) .empty) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 (.cutX 9216 (.cutY 1024 (.cutX 8704 .empty (.cutY 512 (.cutX 8960 (.cutY 256 .full .empty) .empty) .empty)) .empty) .empty) .empty) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 .empty (.cutX 23552 .empty (.cutY 31744 .empty (.cutX 24064 (.cutY 32256 .empty (.cutX 23808 .empty (.cutY 32512 .empty .full))) .empty)))))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 .empty (.cutY 22528 .empty (.cutX 31744 .empty (.cutY 23552 .empty (.cutX 32256 .empty (.cutY 24064 (.cutX 32512 .empty (.cutY 23808 .empty .full)) .empty)))))))) .empty))))

theorem metadata116 : 0<523383676 ∧ 0<128 ∧ 34<128 ∧ 0<4 ∧
    34/4160=0 ∧ 34%4160=34 ∧ ∀ i, (leaves116 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData116).mp
    (by decide +kernel)

theorem sourceChecked116_0 : ∀ i : Fin 4,
    (fun i => output116 i = raw116 (source116 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked116 : ∀ i : Fin 4, (fun i => output116 i = raw116 (source116 i)) i :=
  forallFin_of_zero_offset (fun i => output116 i = raw116 (source116 i)) sourceChecked116_0

theorem coverChecked116_0 : ∀ i : Fin 4,
    (fun i => (output116 (cover116 i)).ContainsBox (raw116 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked116 : ∀ i : Fin 4, (fun i => (output116 (cover116 i)).ContainsBox (raw116 i)) i :=
  forallFin_of_zero_offset (fun i => (output116 (cover116 i)).ContainsBox (raw116 i)) coverChecked116_0

theorem treeChecked116 : tree116.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves116 : List.ofFn output116 = tree116.leaves ⟨0,32768,0,32768⟩ := by
  unfold output116
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked116 : gridTreeUnionCheck 32768 raw116 output116 cover116 source116 tree116 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked116, coverChecked116, treeChecked116, treeLeaves116⟩

theorem areaUnits116 : gridUnionAreaUnits output116 = 262144 := by decide +kernel

noncomputable def phaseMass116 : ℝ := singlePhaseMass (523383676/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw116 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass116_eq : phaseMass116 = (130845919/409600000000 : ℝ) := by
  unfold phaseMass116
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw116 output116 cover116 source116
    (gridTreeUnionCheck_sound 32768 raw116 output116 cover116 source116 tree116 checked116)
    _ (by norm_num) _, areaUnits116]
  norm_num

-- Frozen phase 2613, atom 3941, type 0, source (49,70).
def leavesData117 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves117 : Fin 1 → DyadicLeaf := leavesData117.get
def raw117 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 49 70 leaves117 i
def outputData117 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨12544,12800,17920,18176⟩) (.single ⟨14592,14848,19968,20224⟩)) (.node (.single ⟨17920,18176,12544,12800⟩) (.single ⟨19968,20224,14592,14848⟩)))
def output117 : Fin 4 → GridBox := outputData117.get
def coverData117 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 2)) (.node (.single 3) (.single 1)))
def sourceData117 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 3)) (.node (.single 1) (.single 2)))
def cover117 (i : Fin 4) : Fin 4 := ⟨coverData117.get i % 4, Nat.mod_lt _ (by decide)⟩
def source117 (i : Fin 4) : Fin 4 := ⟨sourceData117.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree117 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 .empty (.cutY 20480 (.cutX 14336 (.cutY 18432 (.cutX 13312 (.cutY 17408 .empty (.cutX 12800 (.cutY 17920 .empty (.cutX 12544 .empty (.cutY 18176 .full .empty))) .empty)) .empty) .empty) (.cutY 18432 .empty (.cutX 15360 (.cutY 19456 .empty (.cutX 14848 (.cutY 19968 .empty (.cutX 14592 .empty (.cutY 20224 .full .empty))) .empty)) .empty))) .empty)) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 .empty (.cutX 18432 (.cutY 14336 (.cutX 17408 .empty (.cutY 13312 (.cutX 17920 .empty (.cutY 12800 (.cutX 18176 (.cutY 12544 .empty .full) .empty) .empty)) .empty)) .empty) (.cutY 14336 .empty (.cutX 19456 .empty (.cutY 15360 (.cutX 19968 .empty (.cutY 14848 (.cutX 20224 (.cutY 14592 .empty .full) .empty) .empty)) .empty))))) .empty)) .empty) .empty))

theorem metadata117 : 0<273125493 ∧ 49<128 ∧ 70<128 ∧ 0<4 ∧
    3941/4160=0 ∧ 3941%4160=3941 ∧ ∀ i, (leaves117 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData117).mp
    (by decide +kernel)

theorem sourceChecked117_0 : ∀ i : Fin 4,
    (fun i => output117 i = raw117 (source117 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked117 : ∀ i : Fin 4, (fun i => output117 i = raw117 (source117 i)) i :=
  forallFin_of_zero_offset (fun i => output117 i = raw117 (source117 i)) sourceChecked117_0

theorem coverChecked117_0 : ∀ i : Fin 4,
    (fun i => (output117 (cover117 i)).ContainsBox (raw117 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked117 : ∀ i : Fin 4, (fun i => (output117 (cover117 i)).ContainsBox (raw117 i)) i :=
  forallFin_of_zero_offset (fun i => (output117 (cover117 i)).ContainsBox (raw117 i)) coverChecked117_0

theorem treeChecked117 : tree117.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves117 : List.ofFn output117 = tree117.leaves ⟨0,32768,0,32768⟩ := by
  unfold output117
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked117 : gridTreeUnionCheck 32768 raw117 output117 cover117 source117 tree117 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked117, coverChecked117, treeChecked117, treeLeaves117⟩

theorem areaUnits117 : gridUnionAreaUnits output117 = 262144 := by decide +kernel

noncomputable def phaseMass117 : ℝ := singlePhaseMass (273125493/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw117 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass117_eq : phaseMass117 = (273125493/1638400000000 : ℝ) := by
  unfold phaseMass117
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw117 output117 cover117 source117
    (gridTreeUnionCheck_sound 32768 raw117 output117 cover117 source117 tree117 checked117)
    _ (by norm_num) _, areaUnits117]
  norm_num

-- Frozen phase 2614, atom 3971, type 0, source (50,71).
def leavesData118 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves118 : Fin 1 → DyadicLeaf := leavesData118.get
def raw118 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 50 71 leaves118 i
def outputData118 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨12800,13056,18176,18432⟩) (.single ⟨14336,14592,19712,19968⟩)) (.node (.single ⟨18176,18432,12800,13056⟩) (.single ⟨19712,19968,14336,14592⟩)))
def output118 : Fin 4 → GridBox := outputData118.get
def coverData118 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 2)) (.node (.single 3) (.single 1)))
def sourceData118 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 3)) (.node (.single 1) (.single 2)))
def cover118 (i : Fin 4) : Fin 4 := ⟨coverData118.get i % 4, Nat.mod_lt _ (by decide)⟩
def source118 (i : Fin 4) : Fin 4 := ⟨sourceData118.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree118 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 .empty (.cutY 20480 (.cutX 14336 (.cutY 18432 (.cutX 13312 (.cutY 17408 .empty (.cutX 12800 .empty (.cutY 17920 .empty (.cutX 13056 (.cutY 18176 .empty .full) .empty)))) .empty) .empty) (.cutY 18432 .empty (.cutX 15360 (.cutY 19456 .empty (.cutX 14848 (.cutY 19968 (.cutX 14592 (.cutY 19712 .empty .full) .empty) .empty) .empty)) .empty))) .empty)) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 .empty (.cutX 18432 (.cutY 14336 (.cutX 17408 .empty (.cutY 13312 (.cutX 17920 .empty (.cutY 12800 .empty (.cutX 18176 .empty (.cutY 13056 .full .empty)))) .empty)) .empty) (.cutY 14336 .empty (.cutX 19456 .empty (.cutY 15360 (.cutX 19968 (.cutY 14848 (.cutX 19712 .empty (.cutY 14592 .full .empty)) .empty) .empty) .empty))))) .empty)) .empty) .empty))

theorem metadata118 : 0<273125493 ∧ 50<128 ∧ 71<128 ∧ 0<4 ∧
    3971/4160=0 ∧ 3971%4160=3971 ∧ ∀ i, (leaves118 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData118).mp
    (by decide +kernel)

theorem sourceChecked118_0 : ∀ i : Fin 4,
    (fun i => output118 i = raw118 (source118 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked118 : ∀ i : Fin 4, (fun i => output118 i = raw118 (source118 i)) i :=
  forallFin_of_zero_offset (fun i => output118 i = raw118 (source118 i)) sourceChecked118_0

theorem coverChecked118_0 : ∀ i : Fin 4,
    (fun i => (output118 (cover118 i)).ContainsBox (raw118 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked118 : ∀ i : Fin 4, (fun i => (output118 (cover118 i)).ContainsBox (raw118 i)) i :=
  forallFin_of_zero_offset (fun i => (output118 (cover118 i)).ContainsBox (raw118 i)) coverChecked118_0

theorem treeChecked118 : tree118.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves118 : List.ofFn output118 = tree118.leaves ⟨0,32768,0,32768⟩ := by
  unfold output118
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked118 : gridTreeUnionCheck 32768 raw118 output118 cover118 source118 tree118 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked118, coverChecked118, treeChecked118, treeLeaves118⟩

theorem areaUnits118 : gridUnionAreaUnits output118 = 262144 := by decide +kernel

noncomputable def phaseMass118 : ℝ := singlePhaseMass (273125493/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw118 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass118_eq : phaseMass118 = (273125493/1638400000000 : ℝ) := by
  unfold phaseMass118
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw118 output118 cover118 source118
    (gridTreeUnionCheck_sound 32768 raw118 output118 cover118 source118 tree118 checked118)
    _ (by norm_num) _, areaUnits118]
  norm_num

-- Frozen phase 2615, atom 3909, type 0, source (48,69).
def leavesData119 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves119 : Fin 1 → DyadicLeaf := leavesData119.get
def raw119 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 48 69 leaves119 i
def outputData119 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨12288,12544,17664,17920⟩) (.single ⟨14848,15104,20224,20480⟩)) (.node (.single ⟨17664,17920,12288,12544⟩) (.single ⟨20224,20480,14848,15104⟩)))
def output119 : Fin 4 → GridBox := outputData119.get
def coverData119 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 2)) (.node (.single 3) (.single 1)))
def sourceData119 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 3)) (.node (.single 1) (.single 2)))
def cover119 (i : Fin 4) : Fin 4 := ⟨coverData119.get i % 4, Nat.mod_lt _ (by decide)⟩
def source119 (i : Fin 4) : Fin 4 := ⟨sourceData119.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree119 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 .empty (.cutY 20480 (.cutX 14336 (.cutY 18432 (.cutX 13312 (.cutY 17408 .empty (.cutX 12800 (.cutY 17920 (.cutX 12544 (.cutY 17664 .empty .full) .empty) .empty) .empty)) .empty) .empty) (.cutY 18432 .empty (.cutX 15360 (.cutY 19456 .empty (.cutX 14848 .empty (.cutY 19968 .empty (.cutX 15104 (.cutY 20224 .empty .full) .empty)))) .empty))) .empty)) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 .empty (.cutX 18432 (.cutY 14336 (.cutX 17408 .empty (.cutY 13312 (.cutX 17920 (.cutY 12800 (.cutX 17664 .empty (.cutY 12544 .full .empty)) .empty) .empty) .empty)) .empty) (.cutY 14336 .empty (.cutX 19456 .empty (.cutY 15360 (.cutX 19968 .empty (.cutY 14848 .empty (.cutX 20224 .empty (.cutY 15104 .full .empty)))) .empty))))) .empty)) .empty) .empty))

theorem metadata119 : 0<273125493 ∧ 48<128 ∧ 69<128 ∧ 0<4 ∧
    3909/4160=0 ∧ 3909%4160=3909 ∧ ∀ i, (leaves119 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData119).mp
    (by decide +kernel)

theorem sourceChecked119_0 : ∀ i : Fin 4,
    (fun i => output119 i = raw119 (source119 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked119 : ∀ i : Fin 4, (fun i => output119 i = raw119 (source119 i)) i :=
  forallFin_of_zero_offset (fun i => output119 i = raw119 (source119 i)) sourceChecked119_0

theorem coverChecked119_0 : ∀ i : Fin 4,
    (fun i => (output119 (cover119 i)).ContainsBox (raw119 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked119 : ∀ i : Fin 4, (fun i => (output119 (cover119 i)).ContainsBox (raw119 i)) i :=
  forallFin_of_zero_offset (fun i => (output119 (cover119 i)).ContainsBox (raw119 i)) coverChecked119_0

theorem treeChecked119 : tree119.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves119 : List.ofFn output119 = tree119.leaves ⟨0,32768,0,32768⟩ := by
  unfold output119
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked119 : gridTreeUnionCheck 32768 raw119 output119 cover119 source119 tree119 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked119, coverChecked119, treeChecked119, treeLeaves119⟩

theorem areaUnits119 : gridUnionAreaUnits output119 = 262144 := by decide +kernel

noncomputable def phaseMass119 : ℝ := singlePhaseMass (273125493/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw119 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass119_eq : phaseMass119 = (273125493/1638400000000 : ℝ) := by
  unfold phaseMass119
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw119 output119 cover119 source119
    (gridTreeUnionCheck_sound 32768 raw119 output119 cover119 source119 tree119 checked119)
    _ (by norm_num) _, areaUnits119]
  norm_num

-- Frozen phase 2616, atom 2851, type 0, source (28,51).
def leavesData120 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves120 : Fin 1 → DyadicLeaf := leavesData120.get
def raw120 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 28 51 leaves120 i
def outputData120 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨7168,7424,13056,13312⟩) (.single ⟨13056,13312,7168,7424⟩)) (.node (.single ⟨19456,19712,25344,25600⟩) (.single ⟨25344,25600,19456,19712⟩)))
def output120 : Fin 4 → GridBox := outputData120.get
def coverData120 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData120 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover120 (i : Fin 4) : Fin 4 := ⟨coverData120.get i % 4, Nat.mod_lt _ (by decide)⟩
def source120 (i : Fin 4) : Fin 4 := ⟨sourceData120.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree120 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 .empty (.cutY 14336 (.cutX 7168 .empty (.cutY 13312 (.cutX 7680 (.cutY 12800 .empty (.cutX 7424 (.cutY 13056 .empty .full) .empty)) .empty) .empty)) .empty))))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 (.cutY 6144 .empty (.cutX 13312 (.cutY 7168 .empty (.cutX 12800 .empty (.cutY 7680 (.cutX 13056 .empty (.cutY 7424 .full .empty)) .empty))) .empty)) .empty))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 .empty (.cutY 26624 (.cutX 19456 .empty (.cutY 25600 (.cutX 19968 (.cutY 25088 .empty (.cutX 19712 (.cutY 25344 .empty .full) .empty)) .empty) .empty)) .empty)) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 (.cutY 18432 .empty (.cutX 25600 (.cutY 19456 .empty (.cutX 25088 .empty (.cutY 19968 (.cutX 25344 .empty (.cutY 19712 .full .empty)) .empty))) .empty)) .empty) .empty) .empty) .empty))))

theorem metadata120 : 0<300263580 ∧ 28<128 ∧ 51<128 ∧ 0<4 ∧
    2851/4160=0 ∧ 2851%4160=2851 ∧ ∀ i, (leaves120 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData120).mp
    (by decide +kernel)

theorem sourceChecked120_0 : ∀ i : Fin 4,
    (fun i => output120 i = raw120 (source120 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked120 : ∀ i : Fin 4, (fun i => output120 i = raw120 (source120 i)) i :=
  forallFin_of_zero_offset (fun i => output120 i = raw120 (source120 i)) sourceChecked120_0

theorem coverChecked120_0 : ∀ i : Fin 4,
    (fun i => (output120 (cover120 i)).ContainsBox (raw120 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked120 : ∀ i : Fin 4, (fun i => (output120 (cover120 i)).ContainsBox (raw120 i)) i :=
  forallFin_of_zero_offset (fun i => (output120 (cover120 i)).ContainsBox (raw120 i)) coverChecked120_0

theorem treeChecked120 : tree120.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves120 : List.ofFn output120 = tree120.leaves ⟨0,32768,0,32768⟩ := by
  unfold output120
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked120 : gridTreeUnionCheck 32768 raw120 output120 cover120 source120 tree120 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked120, coverChecked120, treeChecked120, treeLeaves120⟩

theorem areaUnits120 : gridUnionAreaUnits output120 = 262144 := by decide +kernel

noncomputable def phaseMass120 : ℝ := singlePhaseMass (300263580/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw120 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass120_eq : phaseMass120 = (15013179/81920000000 : ℝ) := by
  unfold phaseMass120
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw120 output120 cover120 source120
    (gridTreeUnionCheck_sound 32768 raw120 output120 cover120 source120 tree120 checked120)
    _ (by norm_num) _, areaUnits120]
  norm_num

-- Frozen phase 2617, atom 7831, type 1, source (42,59).
def leavesData121 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves121 : Fin 4 → DyadicLeaf := leavesData121.get
def raw121 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 42 59 leaves121 i
def outputData121 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨10752,10880,15104,15232⟩) (.single ⟨10752,10880,15232,15360⟩)) (.node (.single ⟨10880,11008,15104,15232⟩) (.single ⟨10880,11008,15232,15360⟩))) (.node (.node (.single ⟨15104,15232,10752,10880⟩) (.single ⟨15104,15232,10880,11008⟩)) (.node (.single ⟨15232,15360,10752,10880⟩) (.single ⟨15232,15360,10880,11008⟩)))) (.node (.node (.node (.single ⟨17408,17536,21760,21888⟩) (.single ⟨17408,17536,21888,22016⟩)) (.node (.single ⟨17536,17664,21760,21888⟩) (.single ⟨17536,17664,21888,22016⟩))) (.node (.node (.single ⟨21760,21888,17408,17536⟩) (.single ⟨21760,21888,17536,17664⟩)) (.node (.single ⟨21888,22016,17408,17536⟩) (.single ⟨21888,22016,17536,17664⟩)))))
def output121 : Fin 16 → GridBox := outputData121.get
def coverData121 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData121 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover121 (i : Fin 16) : Fin 16 := ⟨coverData121.get i % 16, Nat.mod_lt _ (by decide)⟩
def source121 (i : Fin 16) : Fin 16 := ⟨sourceData121.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree121 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 .empty (.cutY 14336 .empty (.cutX 11264 (.cutY 15360 (.cutX 10752 .empty (.cutY 14848 .empty (.cutX 11008 (.cutY 15104 .empty (.cutX 10880 (.cutY 15232 .full .full) (.cutY 15232 .full .full))) .empty))) .empty) .empty)))) (.cutY 12288 (.cutX 14336 .empty (.cutY 10240 .empty (.cutX 15360 (.cutY 11264 (.cutX 14848 .empty (.cutY 10752 .empty (.cutX 15104 .empty (.cutY 11008 (.cutX 15232 (.cutY 10880 .full .full) (.cutY 10880 .full .full)) .empty)))) .empty) .empty))) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 (.cutY 22528 (.cutX 17408 .empty (.cutY 21504 .empty (.cutX 17920 (.cutY 22016 (.cutX 17664 (.cutY 21760 .empty (.cutX 17536 (.cutY 21888 .full .full) (.cutY 21888 .full .full))) .empty) .empty) .empty))) .empty) .empty)) (.cutY 20480 (.cutX 22528 (.cutY 18432 (.cutX 21504 .empty (.cutY 17408 .empty (.cutX 22016 (.cutY 17920 (.cutX 21760 .empty (.cutY 17664 (.cutX 21888 (.cutY 17536 .full .full) (.cutY 17536 .full .full)) .empty)) .empty) .empty))) .empty) .empty) .empty)) .empty) .empty)))

theorem metadata121 : 0<82140708 ∧ 42<128 ∧ 59<128 ∧ 1<4 ∧
    7831/4160=1 ∧ 7831%4160=3671 ∧ ∀ i, (leaves121 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData121).mp
    (by decide +kernel)

theorem sourceChecked121_0 : ∀ i : Fin 16,
    (fun i => output121 i = raw121 (source121 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked121 : ∀ i : Fin 16, (fun i => output121 i = raw121 (source121 i)) i :=
  forallFin_of_zero_offset (fun i => output121 i = raw121 (source121 i)) sourceChecked121_0

theorem coverChecked121_0 : ∀ i : Fin 16,
    (fun i => (output121 (cover121 i)).ContainsBox (raw121 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked121 : ∀ i : Fin 16, (fun i => (output121 (cover121 i)).ContainsBox (raw121 i)) i :=
  forallFin_of_zero_offset (fun i => (output121 (cover121 i)).ContainsBox (raw121 i)) coverChecked121_0

theorem treeChecked121 : tree121.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves121 : List.ofFn output121 = tree121.leaves ⟨0,32768,0,32768⟩ := by
  unfold output121
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked121 : gridTreeUnionCheck 32768 raw121 output121 cover121 source121 tree121 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked121, coverChecked121, treeChecked121, treeLeaves121⟩

theorem areaUnits121 : gridUnionAreaUnits output121 = 262144 := by decide +kernel

noncomputable def phaseMass121 : ℝ := singlePhaseMass (82140708/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw121 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass121_eq : phaseMass121 = (20535177/409600000000 : ℝ) := by
  unfold phaseMass121
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw121 output121 cover121 source121
    (gridTreeUnionCheck_sound 32768 raw121 output121 cover121 source121 tree121 checked121)
    _ (by norm_num) _, areaUnits121]
  norm_num

-- Frozen phase 2618, atom 3719, type 0, source (43,64).
def leavesData122 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves122 : Fin 1 → DyadicLeaf := leavesData122.get
def raw122 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 43 64 leaves122 i
def outputData122 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨11008,11264,16384,16640⟩) (.single ⟨16128,16384,21504,21760⟩)) (.node (.single ⟨16384,16640,11008,11264⟩) (.single ⟨21504,21760,16128,16384⟩)))
def output122 : Fin 4 → GridBox := outputData122.get
def coverData122 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 2)) (.node (.single 3) (.single 1)))
def sourceData122 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 3)) (.node (.single 1) (.single 2)))
def cover122 (i : Fin 4) : Fin 4 := ⟨coverData122.get i % 4, Nat.mod_lt _ (by decide)⟩
def source122 (i : Fin 4) : Fin 4 := ⟨sourceData122.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree122 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 .empty (.cutY 18432 (.cutX 11264 (.cutY 17408 (.cutX 10752 .empty (.cutY 16896 (.cutX 11008 .empty (.cutY 16640 .full .empty)) .empty)) .empty) .empty) .empty)) .empty) (.cutY 20480 .empty (.cutX 14336 .empty (.cutY 22528 (.cutX 15360 .empty (.cutY 21504 .empty (.cutX 15872 .empty (.cutY 22016 (.cutX 16128 .empty (.cutY 21760 .full .empty)) .empty)))) .empty)))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 (.cutY 10240 .empty (.cutX 17408 (.cutY 11264 (.cutX 16896 (.cutY 10752 .empty (.cutX 16640 (.cutY 11008 .empty .full) .empty)) .empty) .empty) .empty)) .empty) .empty) (.cutY 12288 .empty (.cutX 22528 (.cutY 14336 .empty (.cutX 21504 .empty (.cutY 15360 .empty (.cutX 22016 (.cutY 15872 .empty (.cutX 21760 (.cutY 16128 .empty .full) .empty)) .empty)))) .empty)))) .empty) .empty))

theorem metadata122 : 0<20837145 ∧ 43<128 ∧ 64<128 ∧ 0<4 ∧
    3719/4160=0 ∧ 3719%4160=3719 ∧ ∀ i, (leaves122 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData122).mp
    (by decide +kernel)

theorem sourceChecked122_0 : ∀ i : Fin 4,
    (fun i => output122 i = raw122 (source122 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked122 : ∀ i : Fin 4, (fun i => output122 i = raw122 (source122 i)) i :=
  forallFin_of_zero_offset (fun i => output122 i = raw122 (source122 i)) sourceChecked122_0

theorem coverChecked122_0 : ∀ i : Fin 4,
    (fun i => (output122 (cover122 i)).ContainsBox (raw122 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked122 : ∀ i : Fin 4, (fun i => (output122 (cover122 i)).ContainsBox (raw122 i)) i :=
  forallFin_of_zero_offset (fun i => (output122 (cover122 i)).ContainsBox (raw122 i)) coverChecked122_0

theorem treeChecked122 : tree122.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves122 : List.ofFn output122 = tree122.leaves ⟨0,32768,0,32768⟩ := by
  unfold output122
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked122 : gridTreeUnionCheck 32768 raw122 output122 cover122 source122 tree122 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked122, coverChecked122, treeChecked122, treeLeaves122⟩

theorem areaUnits122 : gridUnionAreaUnits output122 = 262144 := by decide +kernel

noncomputable def phaseMass122 : ℝ := singlePhaseMass (20837145/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw122 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass122_eq : phaseMass122 = (4167429/327680000000 : ℝ) := by
  unfold phaseMass122
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw122 output122 cover122 source122
    (gridTreeUnionCheck_sound 32768 raw122 output122 cover122 source122 tree122 checked122)
    _ (by norm_num) _, areaUnits122]
  norm_num

-- Frozen phase 2619, atom 1431, type 0, source (12,39).
def leavesData123 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves123 : Fin 1 → DyadicLeaf := leavesData123.get
def raw123 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 12 39 leaves123 i
def outputData123 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨3072,3328,9984,10240⟩) (.single ⟨9984,10240,3072,3328⟩)) (.node (.single ⟨22528,22784,29440,29696⟩) (.single ⟨29440,29696,22528,22784⟩)))
def output123 : Fin 4 → GridBox := outputData123.get
def coverData123 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData123 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover123 (i : Fin 4) : Fin 4 := ⟨coverData123.get i % 4, Nat.mod_lt _ (by decide)⟩
def source123 (i : Fin 4) : Fin 4 := ⟨sourceData123.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree123 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 .empty (.cutY 10240 (.cutX 3072 .empty (.cutY 9216 .empty (.cutX 3584 (.cutY 9728 .empty (.cutX 3328 (.cutY 9984 .empty .full) .empty)) .empty))) .empty)) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 .empty (.cutX 9216 .empty (.cutY 3072 .empty (.cutX 9728 .empty (.cutY 3584 (.cutX 9984 .empty (.cutY 3328 .full .empty)) .empty))))) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 (.cutX 23552 (.cutY 29696 (.cutX 23040 (.cutY 29184 .empty (.cutX 22784 (.cutY 29440 .empty .full) .empty)) .empty) .empty) .empty) .empty))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 (.cutY 22528 .empty (.cutX 29696 (.cutY 23552 (.cutX 29184 .empty (.cutY 23040 (.cutX 29440 .empty (.cutY 22784 .full .empty)) .empty)) .empty) .empty)) .empty))) .empty))))

theorem metadata123 : 0<290391823 ∧ 12<128 ∧ 39<128 ∧ 0<4 ∧
    1431/4160=0 ∧ 1431%4160=1431 ∧ ∀ i, (leaves123 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData123).mp
    (by decide +kernel)

theorem sourceChecked123_0 : ∀ i : Fin 4,
    (fun i => output123 i = raw123 (source123 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked123 : ∀ i : Fin 4, (fun i => output123 i = raw123 (source123 i)) i :=
  forallFin_of_zero_offset (fun i => output123 i = raw123 (source123 i)) sourceChecked123_0

theorem coverChecked123_0 : ∀ i : Fin 4,
    (fun i => (output123 (cover123 i)).ContainsBox (raw123 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked123 : ∀ i : Fin 4, (fun i => (output123 (cover123 i)).ContainsBox (raw123 i)) i :=
  forallFin_of_zero_offset (fun i => (output123 (cover123 i)).ContainsBox (raw123 i)) coverChecked123_0

theorem treeChecked123 : tree123.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves123 : List.ofFn output123 = tree123.leaves ⟨0,32768,0,32768⟩ := by
  unfold output123
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked123 : gridTreeUnionCheck 32768 raw123 output123 cover123 source123 tree123 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked123, coverChecked123, treeChecked123, treeLeaves123⟩

theorem areaUnits123 : gridUnionAreaUnits output123 = 262144 := by decide +kernel

noncomputable def phaseMass123 : ℝ := singlePhaseMass (290391823/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw123 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass123_eq : phaseMass123 = (290391823/1638400000000 : ℝ) := by
  unfold phaseMass123
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw123 output123 cover123 source123
    (gridTreeUnionCheck_sound 32768 raw123 output123 cover123 source123 tree123 checked123)
    _ (by norm_num) _, areaUnits123]
  norm_num

-- Frozen phase 2620, atom 3312, type 0, source (35,57).
def leavesData124 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves124 : Fin 1 → DyadicLeaf := leavesData124.get
def raw124 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 35 57 leaves124 i
def outputData124 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨8960,9216,14592,14848⟩) (.single ⟨14592,14848,8960,9216⟩)) (.node (.single ⟨17920,18176,23552,23808⟩) (.single ⟨23552,23808,17920,18176⟩)))
def output124 : Fin 4 → GridBox := outputData124.get
def coverData124 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData124 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover124 (i : Fin 4) : Fin 4 := ⟨coverData124.get i % 4, Nat.mod_lt _ (by decide)⟩
def source124 (i : Fin 4) : Fin 4 := ⟨sourceData124.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree124 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 (.cutY 14336 .empty (.cutX 9216 (.cutY 15360 (.cutX 8704 .empty (.cutY 14848 (.cutX 8960 .empty (.cutY 14592 .empty .full)) .empty)) .empty) .empty)) .empty)) (.cutY 12288 (.cutX 14336 .empty (.cutY 10240 (.cutX 15360 (.cutY 9216 (.cutX 14848 (.cutY 8704 .empty (.cutX 14592 .empty (.cutY 8960 .empty .full))) .empty) .empty) .empty) .empty)) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 (.cutY 22528 .empty (.cutX 17408 .empty (.cutY 23552 .empty (.cutX 17920 .empty (.cutY 24064 (.cutX 18176 (.cutY 23808 .full .empty) .empty) .empty))))) .empty)) (.cutY 20480 (.cutX 22528 .empty (.cutY 18432 (.cutX 23552 .empty (.cutY 17408 .empty (.cutX 24064 (.cutY 17920 .empty (.cutX 23808 (.cutY 18176 .full .empty) .empty)) .empty))) .empty)) .empty)) .empty) .empty)))

theorem metadata124 : 0<200205545 ∧ 35<128 ∧ 57<128 ∧ 0<4 ∧
    3312/4160=0 ∧ 3312%4160=3312 ∧ ∀ i, (leaves124 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData124).mp
    (by decide +kernel)

theorem sourceChecked124_0 : ∀ i : Fin 4,
    (fun i => output124 i = raw124 (source124 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked124 : ∀ i : Fin 4, (fun i => output124 i = raw124 (source124 i)) i :=
  forallFin_of_zero_offset (fun i => output124 i = raw124 (source124 i)) sourceChecked124_0

theorem coverChecked124_0 : ∀ i : Fin 4,
    (fun i => (output124 (cover124 i)).ContainsBox (raw124 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked124 : ∀ i : Fin 4, (fun i => (output124 (cover124 i)).ContainsBox (raw124 i)) i :=
  forallFin_of_zero_offset (fun i => (output124 (cover124 i)).ContainsBox (raw124 i)) coverChecked124_0

theorem treeChecked124 : tree124.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves124 : List.ofFn output124 = tree124.leaves ⟨0,32768,0,32768⟩ := by
  unfold output124
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked124 : gridTreeUnionCheck 32768 raw124 output124 cover124 source124 tree124 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked124, coverChecked124, treeChecked124, treeLeaves124⟩

theorem areaUnits124 : gridUnionAreaUnits output124 = 262144 := by decide +kernel

noncomputable def phaseMass124 : ℝ := singlePhaseMass (200205545/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw124 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass124_eq : phaseMass124 = (40041109/327680000000 : ℝ) := by
  unfold phaseMass124
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw124 output124 cover124 source124
    (gridTreeUnionCheck_sound 32768 raw124 output124 cover124 source124 tree124 checked124)
    _ (by norm_num) _, areaUnits124]
  norm_num

-- Frozen phase 2621, atom 997, type 0, source (8,37).
def leavesData125 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves125 : Fin 1 → DyadicLeaf := leavesData125.get
def raw125 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 8 37 leaves125 i
def outputData125 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨2048,2304,9472,9728⟩) (.single ⟨9472,9728,2048,2304⟩)) (.node (.single ⟨23040,23296,30464,30720⟩) (.single ⟨30464,30720,23040,23296⟩)))
def output125 : Fin 4 → GridBox := outputData125.get
def coverData125 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData125 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover125 (i : Fin 4) : Fin 4 := ⟨coverData125.get i % 4, Nat.mod_lt _ (by decide)⟩
def source125 (i : Fin 4) : Fin 4 := ⟨sourceData125.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree125 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 .empty (.cutY 10240 (.cutX 3072 (.cutY 9216 .empty (.cutX 2560 (.cutY 9728 (.cutX 2304 (.cutY 9472 .empty .full) .empty) .empty) .empty)) .empty) .empty)) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 .empty (.cutX 9216 .empty (.cutY 3072 (.cutX 9728 (.cutY 2560 (.cutX 9472 .empty (.cutY 2304 .full .empty)) .empty) .empty) .empty))) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 (.cutX 23552 (.cutY 29696 .empty (.cutX 23040 .empty (.cutY 30208 .empty (.cutX 23296 (.cutY 30464 .empty .full) .empty)))) .empty) .empty))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 (.cutY 22528 .empty (.cutX 29696 .empty (.cutY 23552 (.cutX 30208 .empty (.cutY 23040 .empty (.cutX 30464 .empty (.cutY 23296 .full .empty)))) .empty))) .empty))) .empty))))

theorem metadata125 : 0<290391823 ∧ 8<128 ∧ 37<128 ∧ 0<4 ∧
    997/4160=0 ∧ 997%4160=997 ∧ ∀ i, (leaves125 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData125).mp
    (by decide +kernel)

theorem sourceChecked125_0 : ∀ i : Fin 4,
    (fun i => output125 i = raw125 (source125 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked125 : ∀ i : Fin 4, (fun i => output125 i = raw125 (source125 i)) i :=
  forallFin_of_zero_offset (fun i => output125 i = raw125 (source125 i)) sourceChecked125_0

theorem coverChecked125_0 : ∀ i : Fin 4,
    (fun i => (output125 (cover125 i)).ContainsBox (raw125 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked125 : ∀ i : Fin 4, (fun i => (output125 (cover125 i)).ContainsBox (raw125 i)) i :=
  forallFin_of_zero_offset (fun i => (output125 (cover125 i)).ContainsBox (raw125 i)) coverChecked125_0

theorem treeChecked125 : tree125.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves125 : List.ofFn output125 = tree125.leaves ⟨0,32768,0,32768⟩ := by
  unfold output125
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked125 : gridTreeUnionCheck 32768 raw125 output125 cover125 source125 tree125 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked125, coverChecked125, treeChecked125, treeLeaves125⟩

theorem areaUnits125 : gridUnionAreaUnits output125 = 262144 := by decide +kernel

noncomputable def phaseMass125 : ℝ := singlePhaseMass (290391823/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw125 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass125_eq : phaseMass125 = (290391823/1638400000000 : ℝ) := by
  unfold phaseMass125
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw125 output125 cover125 source125
    (gridTreeUnionCheck_sound 32768 raw125 output125 cover125 source125 tree125 checked125)
    _ (by norm_num) _, areaUnits125]
  norm_num

-- Frozen phase 2622, atom 1218, type 0, source (10,38).
def leavesData126 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves126 : Fin 1 → DyadicLeaf := leavesData126.get
def raw126 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 10 38 leaves126 i
def outputData126 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨2560,2816,9728,9984⟩) (.single ⟨9728,9984,2560,2816⟩)) (.node (.single ⟨22784,23040,29952,30208⟩) (.single ⟨29952,30208,22784,23040⟩)))
def output126 : Fin 4 → GridBox := outputData126.get
def coverData126 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData126 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover126 (i : Fin 4) : Fin 4 := ⟨coverData126.get i % 4, Nat.mod_lt _ (by decide)⟩
def source126 (i : Fin 4) : Fin 4 := ⟨sourceData126.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree126 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 .empty (.cutY 10240 (.cutX 3072 (.cutY 9216 .empty (.cutX 2560 .empty (.cutY 9728 .empty (.cutX 2816 (.cutY 9984 .full .empty) .empty)))) .empty) .empty)) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 .empty (.cutX 9216 .empty (.cutY 3072 (.cutX 9728 .empty (.cutY 2560 .empty (.cutX 9984 (.cutY 2816 .full .empty) .empty))) .empty))) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 (.cutX 23552 (.cutY 29696 .empty (.cutX 23040 (.cutY 30208 (.cutX 22784 .empty (.cutY 29952 .empty .full)) .empty) .empty)) .empty) .empty))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 (.cutY 22528 .empty (.cutX 29696 .empty (.cutY 23552 (.cutX 30208 (.cutY 23040 (.cutX 29952 .empty (.cutY 22784 .empty .full)) .empty) .empty) .empty))) .empty))) .empty))))

theorem metadata126 : 0<290391823 ∧ 10<128 ∧ 38<128 ∧ 0<4 ∧
    1218/4160=0 ∧ 1218%4160=1218 ∧ ∀ i, (leaves126 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData126).mp
    (by decide +kernel)

theorem sourceChecked126_0 : ∀ i : Fin 4,
    (fun i => output126 i = raw126 (source126 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked126 : ∀ i : Fin 4, (fun i => output126 i = raw126 (source126 i)) i :=
  forallFin_of_zero_offset (fun i => output126 i = raw126 (source126 i)) sourceChecked126_0

theorem coverChecked126_0 : ∀ i : Fin 4,
    (fun i => (output126 (cover126 i)).ContainsBox (raw126 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked126 : ∀ i : Fin 4, (fun i => (output126 (cover126 i)).ContainsBox (raw126 i)) i :=
  forallFin_of_zero_offset (fun i => (output126 (cover126 i)).ContainsBox (raw126 i)) coverChecked126_0

theorem treeChecked126 : tree126.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves126 : List.ofFn output126 = tree126.leaves ⟨0,32768,0,32768⟩ := by
  unfold output126
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked126 : gridTreeUnionCheck 32768 raw126 output126 cover126 source126 tree126 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked126, coverChecked126, treeChecked126, treeLeaves126⟩

theorem areaUnits126 : gridUnionAreaUnits output126 = 262144 := by decide +kernel

noncomputable def phaseMass126 : ℝ := singlePhaseMass (290391823/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw126 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass126_eq : phaseMass126 = (290391823/1638400000000 : ℝ) := by
  unfold phaseMass126
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw126 output126 cover126 source126
    (gridTreeUnionCheck_sound 32768 raw126 output126 cover126 source126 tree126 checked126)
    _ (by norm_num) _, areaUnits126]
  norm_num

-- Frozen phase 2623, atom 1833, type 0, source (16,41).
def leavesData127 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves127 : Fin 1 → DyadicLeaf := leavesData127.get
def raw127 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 16 41 leaves127 i
def outputData127 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨4096,4352,10496,10752⟩) (.single ⟨10496,10752,4096,4352⟩)) (.node (.single ⟨22016,22272,28416,28672⟩) (.single ⟨28416,28672,22016,22272⟩)))
def output127 : Fin 4 → GridBox := outputData127.get
def coverData127 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData127 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover127 (i : Fin 4) : Fin 4 := ⟨coverData127.get i % 4, Nat.mod_lt _ (by decide)⟩
def source127 (i : Fin 4) : Fin 4 := ⟨sourceData127.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree127 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 (.cutY 10240 .empty (.cutX 5120 (.cutY 11264 (.cutX 4608 (.cutY 10752 (.cutX 4352 (.cutY 10496 .empty .full) .empty) .empty) .empty) .empty) .empty)) .empty) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 .empty (.cutY 6144 (.cutX 11264 (.cutY 5120 (.cutX 10752 (.cutY 4608 (.cutX 10496 .empty (.cutY 4352 .full .empty)) .empty) .empty) .empty) .empty) .empty))) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 (.cutY 26624 .empty (.cutX 21504 .empty (.cutY 27648 .empty (.cutX 22016 .empty (.cutY 28160 .empty (.cutX 22272 (.cutY 28416 .empty .full) .empty)))))) .empty) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 .empty (.cutY 22528 (.cutX 27648 .empty (.cutY 21504 .empty (.cutX 28160 .empty (.cutY 22016 .empty (.cutX 28416 .empty (.cutY 22272 .full .empty)))))) .empty))) .empty) .empty))))

theorem metadata127 : 0<73667111 ∧ 16<128 ∧ 41<128 ∧ 0<4 ∧
    1833/4160=0 ∧ 1833%4160=1833 ∧ ∀ i, (leaves127 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData127).mp
    (by decide +kernel)

theorem sourceChecked127_0 : ∀ i : Fin 4,
    (fun i => output127 i = raw127 (source127 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked127 : ∀ i : Fin 4, (fun i => output127 i = raw127 (source127 i)) i :=
  forallFin_of_zero_offset (fun i => output127 i = raw127 (source127 i)) sourceChecked127_0

theorem coverChecked127_0 : ∀ i : Fin 4,
    (fun i => (output127 (cover127 i)).ContainsBox (raw127 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked127 : ∀ i : Fin 4, (fun i => (output127 (cover127 i)).ContainsBox (raw127 i)) i :=
  forallFin_of_zero_offset (fun i => (output127 (cover127 i)).ContainsBox (raw127 i)) coverChecked127_0

theorem treeChecked127 : tree127.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves127 : List.ofFn output127 = tree127.leaves ⟨0,32768,0,32768⟩ := by
  unfold output127
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked127 : gridTreeUnionCheck 32768 raw127 output127 cover127 source127 tree127 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked127, coverChecked127, treeChecked127, treeLeaves127⟩

theorem areaUnits127 : gridUnionAreaUnits output127 = 262144 := by decide +kernel

noncomputable def phaseMass127 : ℝ := singlePhaseMass (73667111/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw127 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass127_eq : phaseMass127 = (73667111/1638400000000 : ℝ) := by
  unfold phaseMass127
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw127 output127 cover127 source127
    (gridTreeUnionCheck_sound 32768 raw127 output127 cover127 source127 tree127 checked127)
    _ (by norm_num) _, areaUnits127]
  norm_num

noncomputable def batchActualMass : ℝ := [phaseMass0,phaseMass1,phaseMass2,phaseMass3,phaseMass4,phaseMass5,phaseMass6,phaseMass7,phaseMass8,phaseMass9,phaseMass10,phaseMass11,phaseMass12,phaseMass13,phaseMass14,phaseMass15,phaseMass16,phaseMass17,phaseMass18,phaseMass19,phaseMass20,phaseMass21,phaseMass22,phaseMass23,phaseMass24,phaseMass25,phaseMass26,phaseMass27,phaseMass28,phaseMass29,phaseMass30,phaseMass31,phaseMass32,phaseMass33,phaseMass34,phaseMass35,phaseMass36,phaseMass37,phaseMass38,phaseMass39,phaseMass40,phaseMass41,phaseMass42,phaseMass43,phaseMass44,phaseMass45,phaseMass46,phaseMass47,phaseMass48,phaseMass49,phaseMass50,phaseMass51,phaseMass52,phaseMass53,phaseMass54,phaseMass55,phaseMass56,phaseMass57,phaseMass58,phaseMass59,phaseMass60,phaseMass61,phaseMass62,phaseMass63,phaseMass64,phaseMass65,phaseMass66,phaseMass67,phaseMass68,phaseMass69,phaseMass70,phaseMass71,phaseMass72,phaseMass73,phaseMass74,phaseMass75,phaseMass76,phaseMass77,phaseMass78,phaseMass79,phaseMass80,phaseMass81,phaseMass82,phaseMass83,phaseMass84,phaseMass85,phaseMass86,phaseMass87,phaseMass88,phaseMass89,phaseMass90,phaseMass91,phaseMass92,phaseMass93,phaseMass94,phaseMass95,phaseMass96,phaseMass97,phaseMass98,phaseMass99,phaseMass100,phaseMass101,phaseMass102,phaseMass103,phaseMass104,phaseMass105,phaseMass106,phaseMass107,phaseMass108,phaseMass109,phaseMass110,phaseMass111,phaseMass112,phaseMass113,phaseMass114,phaseMass115,phaseMass116,phaseMass117,phaseMass118,phaseMass119,phaseMass120,phaseMass121,phaseMass122,phaseMass123,phaseMass124,phaseMass125,phaseMass126,phaseMass127].sum

theorem actual_batch_mass : batchActualMass = (15815339643/819200000000 : ℝ) := by
  unfold batchActualMass
  rw [phaseMass0_eq,phaseMass1_eq,phaseMass2_eq,phaseMass3_eq,phaseMass4_eq,phaseMass5_eq,phaseMass6_eq,phaseMass7_eq,phaseMass8_eq,phaseMass9_eq,phaseMass10_eq,phaseMass11_eq,phaseMass12_eq,phaseMass13_eq,phaseMass14_eq,phaseMass15_eq,phaseMass16_eq,phaseMass17_eq,phaseMass18_eq,phaseMass19_eq,phaseMass20_eq,phaseMass21_eq,phaseMass22_eq,phaseMass23_eq,phaseMass24_eq,phaseMass25_eq,phaseMass26_eq,phaseMass27_eq,phaseMass28_eq,phaseMass29_eq,phaseMass30_eq,phaseMass31_eq,phaseMass32_eq,phaseMass33_eq,phaseMass34_eq,phaseMass35_eq,phaseMass36_eq,phaseMass37_eq,phaseMass38_eq,phaseMass39_eq,phaseMass40_eq,phaseMass41_eq,phaseMass42_eq,phaseMass43_eq,phaseMass44_eq,phaseMass45_eq,phaseMass46_eq,phaseMass47_eq,phaseMass48_eq,phaseMass49_eq,phaseMass50_eq,phaseMass51_eq,phaseMass52_eq,phaseMass53_eq,phaseMass54_eq,phaseMass55_eq,phaseMass56_eq,phaseMass57_eq,phaseMass58_eq,phaseMass59_eq,phaseMass60_eq,phaseMass61_eq,phaseMass62_eq,phaseMass63_eq,phaseMass64_eq,phaseMass65_eq,phaseMass66_eq,phaseMass67_eq,phaseMass68_eq,phaseMass69_eq,phaseMass70_eq,phaseMass71_eq,phaseMass72_eq,phaseMass73_eq,phaseMass74_eq,phaseMass75_eq,phaseMass76_eq,phaseMass77_eq,phaseMass78_eq,phaseMass79_eq,phaseMass80_eq,phaseMass81_eq,phaseMass82_eq,phaseMass83_eq,phaseMass84_eq,phaseMass85_eq,phaseMass86_eq,phaseMass87_eq,phaseMass88_eq,phaseMass89_eq,phaseMass90_eq,phaseMass91_eq,phaseMass92_eq,phaseMass93_eq,phaseMass94_eq,phaseMass95_eq,phaseMass96_eq,phaseMass97_eq,phaseMass98_eq,phaseMass99_eq,phaseMass100_eq,phaseMass101_eq,phaseMass102_eq,phaseMass103_eq,phaseMass104_eq,phaseMass105_eq,phaseMass106_eq,phaseMass107_eq,phaseMass108_eq,phaseMass109_eq,phaseMass110_eq,phaseMass111_eq,phaseMass112_eq,phaseMass113_eq,phaseMass114_eq,phaseMass115_eq,phaseMass116_eq,phaseMass117_eq,phaseMass118_eq,phaseMass119_eq,phaseMass120_eq,phaseMass121_eq,phaseMass122_eq,phaseMass123_eq,phaseMass124_eq,phaseMass125_eq,phaseMass126_eq,phaseMass127_eq]
  norm_num

end NoThreeLine.ScheduleUnionBatch02496
#print axioms NoThreeLine.ScheduleUnionBatch02496.actual_batch_mass
