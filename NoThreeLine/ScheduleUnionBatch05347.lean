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
namespace NoThreeLine.ScheduleUnionBatch05347

-- Frozen phase 5347, atom 314, type 0, source (2,62).
def leavesData0 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves0 : Fin 7 → DyadicLeaf := leavesData0.get
def raw0 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 2 62 leaves0 i
def outputData0 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨512,640,15872,16000⟩) (.node (.single ⟨512,640,16000,16128⟩) (.single ⟨640,704,15872,15936⟩))) (.node (.node (.single ⟨640,704,15936,16000⟩) (.single ⟨704,768,15872,15936⟩)) (.node (.single ⟨704,768,15936,16000⟩) (.single ⟨640,768,16000,16128⟩)))) (.node (.node (.single ⟨15872,16000,512,640⟩) (.node (.single ⟨15872,15936,640,704⟩) (.single ⟨15872,15936,704,768⟩))) (.node (.node (.single ⟨15936,16000,640,704⟩) (.single ⟨15936,16000,704,768⟩)) (.node (.single ⟨16000,16128,512,640⟩) (.single ⟨16000,16128,640,768⟩))))) (.node (.node (.node (.single ⟨16640,16768,32000,32128⟩) (.node (.single ⟨16640,16768,32128,32256⟩) (.single ⟨16768,16832,32000,32064⟩))) (.node (.node (.single ⟨16768,16832,32064,32128⟩) (.single ⟨16832,16896,32000,32064⟩)) (.node (.single ⟨16832,16896,32064,32128⟩) (.single ⟨16768,16896,32128,32256⟩)))) (.node (.node (.single ⟨32000,32128,16640,16768⟩) (.node (.single ⟨32000,32064,16768,16832⟩) (.single ⟨32000,32064,16832,16896⟩))) (.node (.node (.single ⟨32064,32128,16768,16832⟩) (.single ⟨32064,32128,16832,16896⟩)) (.node (.single ⟨32128,32256,16640,16768⟩) (.single ⟨32128,32256,16768,16896⟩))))))
def output0 : Fin 28 → GridBox := outputData0.get
def coverData0 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData0 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover0 (i : Fin 28) : Fin 28 := ⟨coverData0.get i % 28, Nat.mod_lt _ (by decide)⟩
def source0 (i : Fin 28) : Fin 28 := ⟨sourceData0.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree0 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 .empty (.cutX 1024 (.cutY 15360 .empty (.cutX 512 .empty (.cutY 15872 .empty (.cutX 768 (.cutY 16128 (.cutX 640 (.cutY 16000 .full .full) (.cutY 16000 (.cutX 704 (.cutY 15936 .full .full) (.cutY 15936 .full .full)) .full)) .empty) .empty)))) .empty)) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 (.cutX 15360 .empty (.cutY 1024 (.cutX 15872 .empty (.cutY 512 .empty (.cutX 16128 (.cutY 768 (.cutX 16000 (.cutY 640 .full (.cutX 15936 (.cutY 704 .full .full) (.cutY 704 .full .full))) (.cutY 640 .full .full)) .empty) .empty))) .empty)) .empty)) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 .empty (.cutX 17408 (.cutY 31744 .empty (.cutX 16896 (.cutY 32256 (.cutX 16640 .empty (.cutY 32000 .empty (.cutX 16768 (.cutY 32128 .full .full) (.cutY 32128 (.cutX 16832 (.cutY 32064 .full .full) (.cutY 32064 .full .full)) .full)))) .empty) .empty)) .empty)) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 (.cutX 31744 .empty (.cutY 17408 (.cutX 32256 (.cutY 16896 (.cutX 32000 .empty (.cutY 16640 .empty (.cutX 32128 (.cutY 16768 .full (.cutX 32064 (.cutY 16832 .full .full) (.cutY 16832 .full .full))) (.cutY 16768 .full .full)))) .empty) .empty) .empty)) .empty)) .empty)) .empty))))

theorem metadata0 : 0<89519217 ∧ 2<128 ∧ 62<128 ∧ 0<4 ∧
    314/4160=0 ∧ 314%4160=314 ∧ ∀ i, (leaves0 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData0).mp
    (by decide +kernel)

theorem sourceChecked0_0 : ∀ i : Fin 28,
    (fun i => output0 i = raw0 (source0 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked0 : ∀ i : Fin 28, (fun i => output0 i = raw0 (source0 i)) i :=
  forallFin_of_zero_offset (fun i => output0 i = raw0 (source0 i)) sourceChecked0_0

theorem coverChecked0_0 : ∀ i : Fin 28,
    (fun i => (output0 (cover0 i)).ContainsBox (raw0 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked0 : ∀ i : Fin 28, (fun i => (output0 (cover0 i)).ContainsBox (raw0 i)) i :=
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

noncomputable def phaseMass0 : ℝ := singlePhaseMass (89519217/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw0 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass0_eq : phaseMass0 = (89519217/1638400000000 : ℝ) := by
  unfold phaseMass0
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw0 output0 cover0 source0
    (gridTreeUnionCheck_sound 32768 raw0 output0 cover0 source0 tree0 checked0)
    _ (by norm_num) _, areaUnits0]
  norm_num

-- Frozen phase 5348, atom 4835, type 1, source (5,60).
def leavesData1 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,0⟩))) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves1 : Fin 13 → DyadicLeaf := leavesData1.get
def raw1 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 5 60 leaves1 i
def outputData1 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨1280,1344,15360,15424⟩) (.node (.single ⟨1280,1344,15424,15488⟩) (.single ⟨1344,1408,15360,15424⟩))) (.node (.single ⟨1344,1408,15424,15488⟩) (.node (.single ⟨1280,1408,15488,15616⟩) (.single ⟨1408,1472,15360,15424⟩)))) (.node (.node (.single ⟨1408,1472,15424,15488⟩) (.node (.single ⟨1472,1504,15360,15392⟩) (.single ⟨1472,1504,15392,15424⟩))) (.node (.node (.single ⟨1504,1536,15360,15392⟩) (.single ⟨1504,1536,15392,15424⟩)) (.node (.single ⟨1472,1536,15424,15488⟩) (.single ⟨1408,1536,15488,15616⟩))))) (.node (.node (.node (.single ⟨15360,15424,1280,1344⟩) (.node (.single ⟨15360,15424,1344,1408⟩) (.single ⟨15424,15488,1280,1344⟩))) (.node (.single ⟨15424,15488,1344,1408⟩) (.node (.single ⟨15360,15424,1408,1472⟩) (.single ⟨15360,15392,1472,1504⟩)))) (.node (.node (.single ⟨15360,15392,1504,1536⟩) (.node (.single ⟨15392,15424,1472,1504⟩) (.single ⟨15392,15424,1504,1536⟩))) (.node (.node (.single ⟨15424,15488,1408,1472⟩) (.single ⟨15424,15488,1472,1536⟩)) (.node (.single ⟨15488,15616,1280,1408⟩) (.single ⟨15488,15616,1408,1536⟩)))))) (.node (.node (.node (.node (.single ⟨17152,17280,31232,31360⟩) (.node (.single ⟨17152,17280,31360,31488⟩) (.single ⟨17280,17344,31232,31296⟩))) (.node (.single ⟨17280,17344,31296,31360⟩) (.node (.single ⟨17344,17376,31232,31264⟩) (.single ⟨17344,17376,31264,31296⟩)))) (.node (.node (.single ⟨17376,17408,31232,31264⟩) (.node (.single ⟨17376,17408,31264,31296⟩) (.single ⟨17344,17408,31296,31360⟩))) (.node (.node (.single ⟨17280,17344,31360,31424⟩) (.single ⟨17280,17344,31424,31488⟩)) (.node (.single ⟨17344,17408,31360,31424⟩) (.single ⟨17344,17408,31424,31488⟩))))) (.node (.node (.node (.single ⟨31232,31360,17152,17280⟩) (.node (.single ⟨31232,31296,17280,17344⟩) (.single ⟨31232,31264,17344,17376⟩))) (.node (.single ⟨31232,31264,17376,17408⟩) (.node (.single ⟨31264,31296,17344,17376⟩) (.single ⟨31264,31296,17376,17408⟩)))) (.node (.node (.single ⟨31296,31360,17280,17344⟩) (.node (.single ⟨31296,31360,17344,17408⟩) (.single ⟨31360,31488,17152,17280⟩))) (.node (.node (.single ⟨31360,31424,17280,17344⟩) (.single ⟨31360,31424,17344,17408⟩)) (.node (.single ⟨31424,31488,17280,17344⟩) (.single ⟨31424,31488,17344,17408⟩)))))))
def output1 : Fin 52 → GridBox := outputData1.get
def coverData1 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 24) (.single 47))) (.node (.single 27) (.node (.single 12) (.single 25)))) (.node (.node (.single 39) (.node (.single 26) (.single 0))) (.node (.node (.single 13) (.single 51)) (.node (.single 38) (.single 1))))) (.node (.node (.node (.single 15) (.node (.single 50) (.single 36))) (.node (.single 2) (.node (.single 14) (.single 49)))) (.node (.node (.single 37) (.node (.single 3) (.single 16))) (.node (.node (.single 48) (.single 35)) (.node (.single 5) (.single 17)))))) (.node (.node (.node (.node (.single 46) (.node (.single 34) (.single 6))) (.node (.single 22) (.node (.single 45) (.single 29)))) (.node (.node (.single 11) (.node (.single 23) (.single 40))) (.node (.node (.single 28) (.single 7)) (.node (.single 18) (.single 44))))) (.node (.node (.node (.single 33) (.node (.single 8) (.single 20))) (.node (.single 43) (.node (.single 31) (.single 9)))) (.node (.node (.single 19) (.node (.single 42) (.single 32))) (.node (.node (.single 10) (.single 21)) (.node (.single 41) (.single 30)))))))
def sourceData1 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.single 20) (.node (.single 0) (.single 24)))) (.node (.node (.single 28) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.single 9) (.node (.single 17) (.single 13))) (.node (.single 21) (.node (.single 25) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.single 7) (.node (.single 3) (.single 35))) (.node (.single 31) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11))))) (.node (.node (.node (.single 6) (.node (.single 34) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 30) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover1 (i : Fin 52) : Fin 52 := ⟨coverData1.get i % 52, Nat.mod_lt _ (by decide)⟩
def source1 (i : Fin 52) : Fin 52 := ⟨sourceData1.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree1 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 .empty (.cutX 1024 .empty (.cutY 15360 .empty (.cutX 1536 (.cutY 15872 (.cutX 1280 .empty (.cutY 15616 (.cutX 1408 (.cutY 15488 (.cutX 1344 (.cutY 15424 .full .full) (.cutY 15424 .full .full)) .full) (.cutY 15488 (.cutX 1472 (.cutY 15424 .full .full) (.cutY 15424 (.cutX 1504 (.cutY 15392 .full .full) (.cutY 15392 .full .full)) .full)) .full)) .empty)) .empty) .empty)))) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 (.cutX 15360 .empty (.cutY 1024 .empty (.cutX 15872 (.cutY 1536 (.cutX 15616 (.cutY 1280 .empty (.cutX 15488 (.cutY 1408 (.cutX 15424 (.cutY 1344 .full .full) (.cutY 1344 .full .full)) (.cutX 15424 (.cutY 1472 .full (.cutX 15392 (.cutY 1504 .full .full) (.cutY 1504 .full .full))) (.cutY 1472 .full .full))) (.cutY 1408 .full .full))) .empty) .empty) .empty))) .empty)) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 .empty (.cutX 17408 (.cutY 31744 (.cutX 16896 .empty (.cutY 31232 .empty (.cutX 17152 .empty (.cutY 31488 (.cutX 17280 (.cutY 31360 .full .full) (.cutY 31360 (.cutX 17344 (.cutY 31296 .full .full) (.cutY 31296 (.cutX 17376 (.cutY 31264 .full .full) (.cutY 31264 .full .full)) .full)) (.cutX 17344 (.cutY 31424 .full .full) (.cutY 31424 .full .full)))) .empty)))) .empty) .empty)) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 (.cutX 31744 (.cutY 17408 (.cutX 31232 .empty (.cutY 16896 .empty (.cutX 31488 (.cutY 17152 .empty (.cutX 31360 (.cutY 17280 .full (.cutX 31296 (.cutY 17344 .full (.cutX 31264 (.cutY 17376 .full .full) (.cutY 17376 .full .full))) (.cutY 17344 .full .full))) (.cutY 17280 .full (.cutX 31424 (.cutY 17344 .full .full) (.cutY 17344 .full .full))))) .empty))) .empty) .empty) .empty)) .empty)) .empty))))

theorem metadata1 : 0<169648215 ∧ 5<128 ∧ 60<128 ∧ 1<4 ∧
    4835/4160=1 ∧ 4835%4160=675 ∧ ∀ i, (leaves1 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData1).mp
    (by decide +kernel)

theorem sourceChecked1_0 : ∀ i : Fin 52,
    (fun i => output1 i = raw1 (source1 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked1 : ∀ i : Fin 52, (fun i => output1 i = raw1 (source1 i)) i :=
  forallFin_of_zero_offset (fun i => output1 i = raw1 (source1 i)) sourceChecked1_0

theorem coverChecked1_0 : ∀ i : Fin 52,
    (fun i => (output1 (cover1 i)).ContainsBox (raw1 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked1 : ∀ i : Fin 52, (fun i => (output1 (cover1 i)).ContainsBox (raw1 i)) i :=
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

noncomputable def phaseMass1 : ℝ := singlePhaseMass (169648215/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw1 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass1_eq : phaseMass1 = (33929643/327680000000 : ℝ) := by
  unfold phaseMass1
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw1 output1 cover1 source1
    (gridTreeUnionCheck_sound 32768 raw1 output1 cover1 source1 tree1 checked1)
    _ (by norm_num) _, areaUnits1]
  norm_num

-- Frozen phase 5349, atom 5719, type 1, source (13,64).
def leavesData2 : FiniteInputTree DyadicLeaf 19 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩))) (.node (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩))))) (.node (.node (.node (.single ⟨3,6,1⟩) (.single ⟨3,7,1⟩)) (.node (.single ⟨3,4,0⟩) (.node (.single ⟨3,4,1⟩) (.single ⟨3,5,0⟩)))) (.node (.node (.single ⟨3,5,1⟩) (.single ⟨4,14,0⟩)) (.node (.single ⟨4,14,1⟩) (.node (.single ⟨4,15,0⟩) (.single ⟨4,15,1⟩))))))
def leaves2 : Fin 19 → DyadicLeaf := leavesData2.get
def raw2 (i : Fin 76) : GridBox := phaseImageBoxes 32768 8 13 64 leaves2 i
def outputData2 : FiniteInputTree GridBox 76 := (.node (.node (.node (.node (.node (.node (.single ⟨3328,3392,16384,16448⟩) (.single ⟨3328,3392,16448,16512⟩)) (.node (.single ⟨3392,3456,16384,16448⟩) (.single ⟨3392,3456,16448,16512⟩))) (.node (.node (.single ⟨3328,3456,16512,16640⟩) (.single ⟨3456,3488,16384,16416⟩)) (.node (.single ⟨3456,3488,16416,16448⟩) (.node (.single ⟨3488,3520,16384,16416⟩) (.single ⟨3488,3520,16416,16448⟩))))) (.node (.node (.node (.single ⟨3456,3520,16448,16512⟩) (.single ⟨3520,3552,16384,16416⟩)) (.node (.single ⟨3520,3552,16416,16448⟩) (.node (.single ⟨3552,3568,16384,16400⟩) (.single ⟨3552,3568,16400,16416⟩)))) (.node (.node (.single ⟨3568,3584,16384,16400⟩) (.single ⟨3568,3584,16400,16416⟩)) (.node (.single ⟨3552,3584,16416,16448⟩) (.node (.single ⟨3520,3584,16448,16512⟩) (.single ⟨3456,3584,16512,16640⟩)))))) (.node (.node (.node (.node (.single ⟨16128,16256,29184,29312⟩) (.single ⟨16128,16256,29312,29440⟩)) (.node (.single ⟨16256,16320,29184,29248⟩) (.single ⟨16256,16320,29248,29312⟩))) (.node (.node (.single ⟨16320,16352,29184,29216⟩) (.single ⟨16320,16352,29216,29248⟩)) (.node (.single ⟨16352,16368,29184,29200⟩) (.node (.single ⟨16352,16368,29200,29216⟩) (.single ⟨16368,16384,29184,29200⟩))))) (.node (.node (.node (.single ⟨16368,16384,29200,29216⟩) (.single ⟨16352,16384,29216,29248⟩)) (.node (.single ⟨16320,16352,29248,29280⟩) (.node (.single ⟨16320,16352,29280,29312⟩) (.single ⟨16352,16384,29248,29280⟩)))) (.node (.node (.single ⟨16352,16384,29280,29312⟩) (.single ⟨16256,16320,29312,29376⟩)) (.node (.single ⟨16256,16320,29376,29440⟩) (.node (.single ⟨16320,16384,29312,29376⟩) (.single ⟨16320,16384,29376,29440⟩))))))) (.node (.node (.node (.node (.node (.single ⟨16384,16448,3328,3392⟩) (.single ⟨16384,16448,3392,3456⟩)) (.node (.single ⟨16448,16512,3328,3392⟩) (.single ⟨16448,16512,3392,3456⟩))) (.node (.node (.single ⟨16384,16416,3456,3488⟩) (.single ⟨16384,16416,3488,3520⟩)) (.node (.single ⟨16416,16448,3456,3488⟩) (.node (.single ⟨16416,16448,3488,3520⟩) (.single ⟨16384,16416,3520,3552⟩))))) (.node (.node (.node (.single ⟨16384,16400,3552,3568⟩) (.single ⟨16384,16400,3568,3584⟩)) (.node (.single ⟨16400,16416,3552,3568⟩) (.node (.single ⟨16400,16416,3568,3584⟩) (.single ⟨16416,16448,3520,3552⟩)))) (.node (.node (.single ⟨16416,16448,3552,3584⟩) (.single ⟨16448,16512,3456,3520⟩)) (.node (.single ⟨16448,16512,3520,3584⟩) (.node (.single ⟨16512,16640,3328,3456⟩) (.single ⟨16512,16640,3456,3584⟩)))))) (.node (.node (.node (.node (.single ⟨29184,29312,16128,16256⟩) (.single ⟨29184,29248,16256,16320⟩)) (.node (.single ⟨29184,29216,16320,16352⟩) (.single ⟨29184,29200,16352,16368⟩))) (.node (.node (.single ⟨29184,29200,16368,16384⟩) (.single ⟨29200,29216,16352,16368⟩)) (.node (.single ⟨29200,29216,16368,16384⟩) (.node (.single ⟨29216,29248,16320,16352⟩) (.single ⟨29216,29248,16352,16384⟩))))) (.node (.node (.node (.single ⟨29248,29312,16256,16320⟩) (.single ⟨29248,29280,16320,16352⟩)) (.node (.single ⟨29248,29280,16352,16384⟩) (.node (.single ⟨29280,29312,16320,16352⟩) (.single ⟨29280,29312,16352,16384⟩)))) (.node (.node (.single ⟨29312,29440,16128,16256⟩) (.single ⟨29312,29376,16256,16320⟩)) (.node (.single ⟨29312,29376,16320,16384⟩) (.node (.single ⟨29376,29440,16256,16320⟩) (.single ⟨29376,29440,16320,16384⟩))))))))
def output2 : Fin 76 → GridBox := outputData2.get
def coverData2 : FiniteInputTree ℕ 76 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 55)) (.node (.single 71) (.single 20))) (.node (.node (.single 18) (.single 56)) (.node (.single 57) (.node (.single 19) (.single 0))))) (.node (.node (.node (.single 38) (.single 75)) (.node (.single 37) (.node (.single 1) (.single 40)))) (.node (.node (.single 74) (.single 35)) (.node (.single 2) (.node (.single 39) (.single 73)))))) (.node (.node (.node (.node (.single 36) (.single 3)) (.node (.single 41) (.single 72))) (.node (.node (.single 34) (.single 9)) (.node (.single 53) (.node (.single 66) (.single 22))))) (.node (.node (.node (.single 17) (.single 54)) (.node (.single 58) (.node (.single 21) (.single 10)))) (.node (.node (.single 46) (.single 65)) (.node (.single 29) (.node (.single 11) (.single 51))))))) (.node (.node (.node (.node (.node (.single 64) (.single 24)) (.node (.single 16) (.single 52))) (.node (.node (.single 59) (.single 23)) (.node (.single 5) (.node (.single 42) (.single 70))))) (.node (.node (.node (.single 33) (.single 6)) (.node (.single 44) (.node (.single 69) (.single 31)))) (.node (.node (.single 7) (.single 43)) (.node (.single 68) (.node (.single 32) (.single 8)))))) (.node (.node (.node (.node (.single 45) (.single 67)) (.node (.single 30) (.single 12))) (.node (.node (.single 47) (.single 63)) (.node (.single 28) (.node (.single 13) (.single 49))))) (.node (.node (.node (.single 62) (.single 26)) (.node (.single 14) (.node (.single 48) (.single 61)))) (.node (.node (.single 27) (.single 15)) (.node (.single 50) (.node (.single 60) (.single 25))))))))
def sourceData2 : FiniteInputTree ℕ 76 := (.node (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.single 20))) (.node (.node (.single 0) (.single 44)) (.node (.single 48) (.node (.single 52) (.single 56))))) (.node (.node (.node (.single 24) (.single 32)) (.node (.single 36) (.node (.single 60) (.single 64)))) (.node (.node (.single 68) (.single 72)) (.node (.single 40) (.node (.single 28) (.single 4)))))) (.node (.node (.node (.node (.single 7) (.single 3)) (.node (.single 31) (.single 27))) (.node (.node (.single 43) (.single 39)) (.node (.single 75) (.node (.single 67) (.single 71))))) (.node (.node (.node (.single 63) (.single 35)) (.node (.single 59) (.node (.single 51) (.single 55)))) (.node (.node (.single 47) (.single 23)) (.node (.single 15) (.node (.single 19) (.single 11))))))) (.node (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.single 21))) (.node (.node (.single 45) (.single 53)) (.node (.single 49) (.node (.single 57) (.single 33))))) (.node (.node (.node (.single 61) (.single 69)) (.node (.single 65) (.node (.single 73) (.single 37)))) (.node (.node (.single 41) (.single 25)) (.node (.single 29) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.single 6) (.single 30)) (.node (.single 42) (.single 74))) (.node (.node (.single 70) (.single 66)) (.node (.single 62) (.node (.single 38) (.single 34))))) (.node (.node (.node (.single 26) (.single 58)) (.node (.single 54) (.node (.single 50) (.single 46)))) (.node (.node (.single 2) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10))))))))
def cover2 (i : Fin 76) : Fin 76 := ⟨coverData2.get i % 76, Nat.mod_lt _ (by decide)⟩
def source2 (i : Fin 76) : Fin 76 := ⟨sourceData2.get i % 76, Nat.mod_lt _ (by decide)⟩
def tree2 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 (.cutX 3072 .empty (.cutY 17408 (.cutX 3584 (.cutY 16896 (.cutX 3328 .empty (.cutY 16640 (.cutX 3456 (.cutY 16512 (.cutX 3392 (.cutY 16448 .full .full) (.cutY 16448 .full .full)) .full) (.cutY 16512 (.cutX 3520 (.cutY 16448 (.cutX 3488 (.cutY 16416 .full .full) (.cutY 16416 .full .full)) .full) (.cutY 16448 (.cutX 3552 (.cutY 16416 .full .full) (.cutY 16416 (.cutX 3568 (.cutY 16400 .full .full) (.cutY 16400 .full .full)) .full)) .full)) .full)) .empty)) .empty) .empty) .empty)) .empty)) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 (.cutX 15360 .empty (.cutY 29696 (.cutX 15872 .empty (.cutY 29184 .empty (.cutX 16128 .empty (.cutY 29440 (.cutX 16256 (.cutY 29312 .full .full) (.cutY 29312 (.cutX 16320 (.cutY 29248 .full .full) (.cutY 29248 (.cutX 16352 (.cutY 29216 .full .full) (.cutY 29216 (.cutX 16368 (.cutY 29200 .full .full) (.cutY 29200 .full .full)) .full)) (.cutX 16352 (.cutY 29280 .full .full) (.cutY 29280 .full .full)))) (.cutX 16320 (.cutY 29376 .full .full) (.cutY 29376 .full .full)))) .empty)))) .empty)) .empty))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 .empty (.cutX 17408 (.cutY 3072 .empty (.cutX 16896 (.cutY 3584 (.cutX 16640 (.cutY 3328 .empty (.cutX 16512 (.cutY 3456 (.cutX 16448 (.cutY 3392 .full .full) (.cutY 3392 .full .full)) (.cutX 16448 (.cutY 3520 (.cutX 16416 (.cutY 3488 .full .full) (.cutY 3488 .full .full)) (.cutX 16416 (.cutY 3552 .full (.cutX 16400 (.cutY 3568 .full .full) (.cutY 3568 .full .full))) (.cutY 3552 .full .full))) (.cutY 3520 .full .full))) (.cutY 3456 .full .full))) .empty) .empty) .empty)) .empty)) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 .empty (.cutX 29696 (.cutY 15360 .empty (.cutX 29184 .empty (.cutY 15872 .empty (.cutX 29440 (.cutY 16128 .empty (.cutX 29312 (.cutY 16256 .full (.cutX 29248 (.cutY 16320 .full (.cutX 29216 (.cutY 16352 .full (.cutX 29200 (.cutY 16368 .full .full) (.cutY 16368 .full .full))) (.cutY 16352 .full .full))) (.cutY 16320 .full (.cutX 29280 (.cutY 16352 .full .full) (.cutY 16352 .full .full))))) (.cutY 16256 .full (.cutX 29376 (.cutY 16320 .full .full) (.cutY 16320 .full .full))))) .empty)))) .empty)) .empty))))) .empty))

theorem metadata2 : 0<135229957 ∧ 13<128 ∧ 64<128 ∧ 1<4 ∧
    5719/4160=1 ∧ 5719%4160=1559 ∧ ∀ i, (leaves2 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData2).mp
    (by decide +kernel)

theorem sourceChecked2_0 : ∀ i : Fin 64,
    (fun i => output2 i = raw2 (source2 i)) (finOffset 76 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked2_64 : ∀ i : Fin 12,
    (fun i => output2 i = raw2 (source2 i)) (finOffset 76 64 12 (by decide) i) := by decide +kernel

theorem sourceChecked2 : ∀ i : Fin 76, (fun i => output2 i = raw2 (source2 i)) i :=
  forallFin_of_zero_offset (fun i => output2 i = raw2 (source2 i)) (forallFinOffset_add (fun i => output2 i = raw2 (source2 i)) 0 64 12 (by decide) sourceChecked2_0
    sourceChecked2_64)

theorem coverChecked2_0 : ∀ i : Fin 64,
    (fun i => (output2 (cover2 i)).ContainsBox (raw2 i)) (finOffset 76 0 64 (by decide) i) := by decide +kernel

theorem coverChecked2_64 : ∀ i : Fin 12,
    (fun i => (output2 (cover2 i)).ContainsBox (raw2 i)) (finOffset 76 64 12 (by decide) i) := by decide +kernel

theorem coverChecked2 : ∀ i : Fin 76, (fun i => (output2 (cover2 i)).ContainsBox (raw2 i)) i :=
  forallFin_of_zero_offset (fun i => (output2 (cover2 i)).ContainsBox (raw2 i)) (forallFinOffset_add (fun i => (output2 (cover2 i)).ContainsBox (raw2 i)) 0 64 12 (by decide) coverChecked2_0
    coverChecked2_64)

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

noncomputable def phaseMass2 : ℝ := singlePhaseMass (135229957/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw2 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass2_eq : phaseMass2 = (135229957/1638400000000 : ℝ) := by
  unfold phaseMass2
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw2 output2 cover2 source2
    (gridTreeUnionCheck_sound 32768 raw2 output2 cover2 source2 tree2 checked2)
    _ (by norm_num) _, areaUnits2]
  norm_num

-- Frozen phase 5350, atom 1136, type 0, source (9,65).
def leavesData3 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves3 : Fin 7 → DyadicLeaf := leavesData3.get
def raw3 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 9 65 leaves3 i
def outputData3 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨2304,2432,16640,16768⟩) (.node (.single ⟨2304,2432,16768,16896⟩) (.single ⟨2432,2496,16640,16704⟩))) (.node (.node (.single ⟨2432,2496,16704,16768⟩) (.single ⟨2496,2560,16640,16704⟩)) (.node (.single ⟨2496,2560,16704,16768⟩) (.single ⟨2432,2560,16768,16896⟩)))) (.node (.node (.single ⟨15872,16000,30208,30336⟩) (.node (.single ⟨15872,16000,30336,30464⟩) (.single ⟨16000,16064,30208,30272⟩))) (.node (.node (.single ⟨16000,16064,30272,30336⟩) (.single ⟨16064,16128,30208,30272⟩)) (.node (.single ⟨16064,16128,30272,30336⟩) (.single ⟨16000,16128,30336,30464⟩))))) (.node (.node (.node (.single ⟨16640,16768,2304,2432⟩) (.node (.single ⟨16640,16704,2432,2496⟩) (.single ⟨16640,16704,2496,2560⟩))) (.node (.node (.single ⟨16704,16768,2432,2496⟩) (.single ⟨16704,16768,2496,2560⟩)) (.node (.single ⟨16768,16896,2304,2432⟩) (.single ⟨16768,16896,2432,2560⟩)))) (.node (.node (.single ⟨30208,30336,15872,16000⟩) (.node (.single ⟨30208,30272,16000,16064⟩) (.single ⟨30208,30272,16064,16128⟩))) (.node (.node (.single ⟨30272,30336,16000,16064⟩) (.single ⟨30272,30336,16064,16128⟩)) (.node (.single ⟨30336,30464,15872,16000⟩) (.single ⟨30336,30464,16000,16128⟩))))))
def output3 : Fin 28 → GridBox := outputData3.get
def coverData3 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData3 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover3 (i : Fin 28) : Fin 28 := ⟨coverData3.get i % 28, Nat.mod_lt _ (by decide)⟩
def source3 (i : Fin 28) : Fin 28 := ⟨sourceData3.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree3 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 (.cutX 3072 (.cutY 17408 (.cutX 2560 (.cutY 16896 (.cutX 2304 .empty (.cutY 16640 .empty (.cutX 2432 (.cutY 16768 .full .full) (.cutY 16768 (.cutX 2496 (.cutY 16704 .full .full) (.cutY 16704 .full .full)) .full)))) .empty) .empty) .empty) .empty) .empty)) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 (.cutX 15360 .empty (.cutY 29696 .empty (.cutX 15872 .empty (.cutY 30208 .empty (.cutX 16128 (.cutY 30464 (.cutX 16000 (.cutY 30336 .full .full) (.cutY 30336 (.cutX 16064 (.cutY 30272 .full .full) (.cutY 30272 .full .full)) .full)) .empty) .empty))))) .empty))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 .empty (.cutX 17408 (.cutY 3072 (.cutX 16896 (.cutY 2560 (.cutX 16640 .empty (.cutY 2304 .empty (.cutX 16768 (.cutY 2432 .full (.cutX 16704 (.cutY 2496 .full .full) (.cutY 2496 .full .full))) (.cutY 2432 .full .full)))) .empty) .empty) .empty) .empty)) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 .empty (.cutX 29696 .empty (.cutY 15360 .empty (.cutX 30208 .empty (.cutY 15872 .empty (.cutX 30464 (.cutY 16128 (.cutX 30336 (.cutY 16000 .full (.cutX 30272 (.cutY 16064 .full .full) (.cutY 16064 .full .full))) (.cutY 16000 .full .full)) .empty) .empty)))))) .empty))))) .empty))

theorem metadata3 : 0<67702166 ∧ 9<128 ∧ 65<128 ∧ 0<4 ∧
    1136/4160=0 ∧ 1136%4160=1136 ∧ ∀ i, (leaves3 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData3).mp
    (by decide +kernel)

theorem sourceChecked3_0 : ∀ i : Fin 28,
    (fun i => output3 i = raw3 (source3 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked3 : ∀ i : Fin 28, (fun i => output3 i = raw3 (source3 i)) i :=
  forallFin_of_zero_offset (fun i => output3 i = raw3 (source3 i)) sourceChecked3_0

theorem coverChecked3_0 : ∀ i : Fin 28,
    (fun i => (output3 (cover3 i)).ContainsBox (raw3 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked3 : ∀ i : Fin 28, (fun i => (output3 (cover3 i)).ContainsBox (raw3 i)) i :=
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

noncomputable def phaseMass3 : ℝ := singlePhaseMass (67702166/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw3 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass3_eq : phaseMass3 = (33851083/819200000000 : ℝ) := by
  unfold phaseMass3
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw3 output3 cover3 source3
    (gridTreeUnionCheck_sound 32768 raw3 output3 cover3 source3 tree3 checked3)
    _ (by norm_num) _, areaUnits3]
  norm_num

-- Frozen phase 5351, atom 5510, type 1, source (11,63).
def leavesData4 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves4 : Fin 13 → DyadicLeaf := leavesData4.get
def raw4 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 11 63 leaves4 i
def outputData4 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨2816,2880,16128,16192⟩) (.node (.single ⟨2816,2880,16192,16256⟩) (.single ⟨2880,2944,16128,16192⟩))) (.node (.single ⟨2880,2944,16192,16256⟩) (.node (.single ⟨2816,2944,16256,16384⟩) (.single ⟨2944,3008,16128,16192⟩)))) (.node (.node (.single ⟨2944,3008,16192,16256⟩) (.node (.single ⟨3008,3040,16128,16160⟩) (.single ⟨3008,3040,16160,16192⟩))) (.node (.node (.single ⟨3040,3072,16128,16160⟩) (.single ⟨3040,3072,16160,16192⟩)) (.node (.single ⟨3008,3072,16192,16256⟩) (.single ⟨2944,3072,16256,16384⟩))))) (.node (.node (.node (.single ⟨16128,16192,2816,2880⟩) (.node (.single ⟨16128,16192,2880,2944⟩) (.single ⟨16192,16256,2816,2880⟩))) (.node (.single ⟨16192,16256,2880,2944⟩) (.node (.single ⟨16128,16192,2944,3008⟩) (.single ⟨16128,16160,3008,3040⟩)))) (.node (.node (.single ⟨16128,16160,3040,3072⟩) (.node (.single ⟨16160,16192,3008,3040⟩) (.single ⟨16160,16192,3040,3072⟩))) (.node (.node (.single ⟨16192,16256,2944,3008⟩) (.single ⟨16192,16256,3008,3072⟩)) (.node (.single ⟨16256,16384,2816,2944⟩) (.single ⟨16256,16384,2944,3072⟩)))))) (.node (.node (.node (.node (.single ⟨16384,16512,29696,29824⟩) (.node (.single ⟨16384,16512,29824,29952⟩) (.single ⟨16512,16576,29696,29760⟩))) (.node (.single ⟨16512,16576,29760,29824⟩) (.node (.single ⟨16576,16608,29696,29728⟩) (.single ⟨16576,16608,29728,29760⟩)))) (.node (.node (.single ⟨16608,16640,29696,29728⟩) (.node (.single ⟨16608,16640,29728,29760⟩) (.single ⟨16576,16640,29760,29824⟩))) (.node (.node (.single ⟨16512,16576,29824,29888⟩) (.single ⟨16512,16576,29888,29952⟩)) (.node (.single ⟨16576,16640,29824,29888⟩) (.single ⟨16576,16640,29888,29952⟩))))) (.node (.node (.node (.single ⟨29696,29824,16384,16512⟩) (.node (.single ⟨29696,29760,16512,16576⟩) (.single ⟨29696,29728,16576,16608⟩))) (.node (.single ⟨29696,29728,16608,16640⟩) (.node (.single ⟨29728,29760,16576,16608⟩) (.single ⟨29728,29760,16608,16640⟩)))) (.node (.node (.single ⟨29760,29824,16512,16576⟩) (.node (.single ⟨29760,29824,16576,16640⟩) (.single ⟨29824,29952,16384,16512⟩))) (.node (.node (.single ⟨29824,29888,16512,16576⟩) (.single ⟨29824,29888,16576,16640⟩)) (.node (.single ⟨29888,29952,16512,16576⟩) (.single ⟨29888,29952,16576,16640⟩)))))))
def output4 : Fin 52 → GridBox := outputData4.get
def coverData4 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 24) (.single 47))) (.node (.single 27) (.node (.single 12) (.single 25)))) (.node (.node (.single 39) (.node (.single 26) (.single 5))) (.node (.node (.single 17) (.single 46)) (.node (.single 34) (.single 6))))) (.node (.node (.node (.single 22) (.node (.single 45) (.single 29))) (.node (.single 11) (.node (.single 23) (.single 40)))) (.node (.node (.single 28) (.node (.single 0) (.single 13))) (.node (.node (.single 51) (.single 38)) (.node (.single 1) (.single 15)))))) (.node (.node (.node (.node (.single 50) (.node (.single 36) (.single 2))) (.node (.single 14) (.node (.single 49) (.single 37)))) (.node (.node (.single 3) (.node (.single 16) (.single 48))) (.node (.node (.single 35) (.single 7)) (.node (.single 18) (.single 44))))) (.node (.node (.node (.single 33) (.node (.single 8) (.single 20))) (.node (.single 43) (.node (.single 31) (.single 9)))) (.node (.node (.single 19) (.node (.single 42) (.single 32))) (.node (.node (.single 10) (.single 21)) (.node (.single 41) (.single 30)))))))
def sourceData4 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover4 (i : Fin 52) : Fin 52 := ⟨coverData4.get i % 52, Nat.mod_lt _ (by decide)⟩
def source4 (i : Fin 52) : Fin 52 := ⟨sourceData4.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree4 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 .empty (.cutX 3072 (.cutY 15360 .empty (.cutX 2560 .empty (.cutY 15872 .empty (.cutX 2816 .empty (.cutY 16128 .empty (.cutX 2944 (.cutY 16256 (.cutX 2880 (.cutY 16192 .full .full) (.cutY 16192 .full .full)) .full) (.cutY 16256 (.cutX 3008 (.cutY 16192 .full .full) (.cutY 16192 (.cutX 3040 (.cutY 16160 .full .full) (.cutY 16160 .full .full)) .full)) .full))))))) .empty)))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 .empty (.cutX 15360 .empty (.cutY 3072 (.cutX 15872 .empty (.cutY 2560 .empty (.cutX 16128 .empty (.cutY 2816 .empty (.cutX 16256 (.cutY 2944 (.cutX 16192 (.cutY 2880 .full .full) (.cutY 2880 .full .full)) (.cutX 16192 (.cutY 3008 .full (.cutX 16160 (.cutY 3040 .full .full) (.cutY 3040 .full .full))) (.cutY 3008 .full .full))) (.cutY 2944 .full .full)))))) .empty)))) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 (.cutX 17408 (.cutY 29696 .empty (.cutX 16896 (.cutY 30208 (.cutX 16640 (.cutY 29952 (.cutX 16512 (.cutY 29824 .full .full) (.cutY 29824 (.cutX 16576 (.cutY 29760 .full .full) (.cutY 29760 (.cutX 16608 (.cutY 29728 .full .full) (.cutY 29728 .full .full)) .full)) (.cutX 16576 (.cutY 29888 .full .full) (.cutY 29888 .full .full)))) .empty) .empty) .empty) .empty)) .empty) .empty) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 (.cutX 29696 .empty (.cutY 17408 (.cutX 30208 (.cutY 16896 (.cutX 29952 (.cutY 16640 (.cutX 29824 (.cutY 16512 .full (.cutX 29760 (.cutY 16576 .full (.cutX 29728 (.cutY 16608 .full .full) (.cutY 16608 .full .full))) (.cutY 16576 .full .full))) (.cutY 16512 .full (.cutX 29888 (.cutY 16576 .full .full) (.cutY 16576 .full .full)))) .empty) .empty) .empty) .empty) .empty)) .empty) .empty) .empty)) .empty))))

theorem metadata4 : 0<163200014 ∧ 11<128 ∧ 63<128 ∧ 1<4 ∧
    5510/4160=1 ∧ 5510%4160=1350 ∧ ∀ i, (leaves4 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData4).mp
    (by decide +kernel)

theorem sourceChecked4_0 : ∀ i : Fin 52,
    (fun i => output4 i = raw4 (source4 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked4 : ∀ i : Fin 52, (fun i => output4 i = raw4 (source4 i)) i :=
  forallFin_of_zero_offset (fun i => output4 i = raw4 (source4 i)) sourceChecked4_0

theorem coverChecked4_0 : ∀ i : Fin 52,
    (fun i => (output4 (cover4 i)).ContainsBox (raw4 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked4 : ∀ i : Fin 52, (fun i => (output4 (cover4 i)).ContainsBox (raw4 i)) i :=
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

noncomputable def phaseMass4 : ℝ := singlePhaseMass (163200014/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw4 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass4_eq : phaseMass4 = (81600007/819200000000 : ℝ) := by
  unfold phaseMass4
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw4 output4 cover4 source4
    (gridTreeUnionCheck_sound 32768 raw4 output4 cover4 source4 tree4 checked4)
    _ (by norm_num) _, areaUnits4]
  norm_num

-- Frozen phase 5352, atom 2491, type 0, source (23,76).
def leavesData5 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves5 : Fin 7 → DyadicLeaf := leavesData5.get
def raw5 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 23 76 leaves5 i
def outputData5 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨5888,6016,19456,19584⟩) (.node (.single ⟨5888,6016,19584,19712⟩) (.single ⟨6016,6080,19456,19520⟩))) (.node (.node (.single ⟨6016,6080,19520,19584⟩) (.single ⟨6080,6144,19456,19520⟩)) (.node (.single ⟨6080,6144,19520,19584⟩) (.single ⟨6016,6144,19584,19712⟩)))) (.node (.node (.single ⟨13056,13184,26624,26752⟩) (.node (.single ⟨13056,13184,26752,26880⟩) (.single ⟨13184,13248,26624,26688⟩))) (.node (.node (.single ⟨13184,13248,26688,26752⟩) (.single ⟨13248,13312,26624,26688⟩)) (.node (.single ⟨13248,13312,26688,26752⟩) (.single ⟨13184,13312,26752,26880⟩))))) (.node (.node (.node (.single ⟨19456,19584,5888,6016⟩) (.node (.single ⟨19456,19520,6016,6080⟩) (.single ⟨19456,19520,6080,6144⟩))) (.node (.node (.single ⟨19520,19584,6016,6080⟩) (.single ⟨19520,19584,6080,6144⟩)) (.node (.single ⟨19584,19712,5888,6016⟩) (.single ⟨19584,19712,6016,6144⟩)))) (.node (.node (.single ⟨26624,26752,13056,13184⟩) (.node (.single ⟨26624,26688,13184,13248⟩) (.single ⟨26624,26688,13248,13312⟩))) (.node (.node (.single ⟨26688,26752,13184,13248⟩) (.single ⟨26688,26752,13248,13312⟩)) (.node (.single ⟨26752,26880,13056,13184⟩) (.single ⟨26752,26880,13184,13312⟩))))))
def output5 : Fin 28 → GridBox := outputData5.get
def coverData5 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData5 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover5 (i : Fin 28) : Fin 28 := ⟨coverData5.get i % 28, Nat.mod_lt _ (by decide)⟩
def source5 (i : Fin 28) : Fin 28 := ⟨sourceData5.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree5 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 .empty (.cutX 5120 .empty (.cutY 19456 .empty (.cutX 5632 .empty (.cutY 19968 (.cutX 5888 .empty (.cutY 19712 (.cutX 6016 (.cutY 19584 .full .full) (.cutY 19584 (.cutX 6080 (.cutY 19520 .full .full) (.cutY 19520 .full .full)) .full)) .empty)) .empty))))) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 .empty (.cutX 13312 (.cutY 27648 (.cutX 12800 .empty (.cutY 27136 (.cutX 13056 .empty (.cutY 26880 (.cutX 13184 (.cutY 26752 .full .full) (.cutY 26752 (.cutX 13248 (.cutY 26688 .full .full) (.cutY 26688 .full .full)) .full)) .empty)) .empty)) .empty) .empty)) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 (.cutX 19456 .empty (.cutY 5120 .empty (.cutX 19968 (.cutY 5632 .empty (.cutX 19712 (.cutY 5888 .empty (.cutX 19584 (.cutY 6016 .full (.cutX 19520 (.cutY 6080 .full .full) (.cutY 6080 .full .full))) (.cutY 6016 .full .full))) .empty)) .empty))) .empty))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 (.cutX 27648 (.cutY 13312 (.cutX 27136 (.cutY 12800 .empty (.cutX 26880 (.cutY 13056 .empty (.cutX 26752 (.cutY 13184 .full (.cutX 26688 (.cutY 13248 .full .full) (.cutY 13248 .full .full))) (.cutY 13184 .full .full))) .empty)) .empty) .empty) .empty) .empty))) .empty))) .empty))

theorem metadata5 : 0<147396112 ∧ 23<128 ∧ 76<128 ∧ 0<4 ∧
    2491/4160=0 ∧ 2491%4160=2491 ∧ ∀ i, (leaves5 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData5).mp
    (by decide +kernel)

theorem sourceChecked5_0 : ∀ i : Fin 28,
    (fun i => output5 i = raw5 (source5 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked5 : ∀ i : Fin 28, (fun i => output5 i = raw5 (source5 i)) i :=
  forallFin_of_zero_offset (fun i => output5 i = raw5 (source5 i)) sourceChecked5_0

theorem coverChecked5_0 : ∀ i : Fin 28,
    (fun i => (output5 (cover5 i)).ContainsBox (raw5 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked5 : ∀ i : Fin 28, (fun i => (output5 (cover5 i)).ContainsBox (raw5 i)) i :=
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

noncomputable def phaseMass5 : ℝ := singlePhaseMass (147396112/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw5 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass5_eq : phaseMass5 = (9212257/102400000000 : ℝ) := by
  unfold phaseMass5
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw5 output5 cover5 source5
    (gridTreeUnionCheck_sound 32768 raw5 output5 cover5 source5 tree5 checked5)
    _ (by norm_num) _, areaUnits5]
  norm_num

-- Frozen phase 5353, atom 7497, type 1, source (35,82).
def leavesData6 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves6 : Fin 7 → DyadicLeaf := leavesData6.get
def raw6 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 35 82 leaves6 i
def outputData6 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨8960,9088,20992,21120⟩) (.node (.single ⟨8960,9088,21120,21248⟩) (.single ⟨9088,9152,20992,21056⟩))) (.node (.node (.single ⟨9088,9152,21056,21120⟩) (.single ⟨9152,9216,20992,21056⟩)) (.node (.single ⟨9152,9216,21056,21120⟩) (.single ⟨9088,9216,21120,21248⟩)))) (.node (.node (.single ⟨11520,11648,23552,23680⟩) (.node (.single ⟨11520,11648,23680,23808⟩) (.single ⟨11648,11712,23552,23616⟩))) (.node (.node (.single ⟨11648,11712,23616,23680⟩) (.single ⟨11712,11776,23552,23616⟩)) (.node (.single ⟨11712,11776,23616,23680⟩) (.single ⟨11648,11776,23680,23808⟩))))) (.node (.node (.node (.single ⟨20992,21120,8960,9088⟩) (.node (.single ⟨20992,21056,9088,9152⟩) (.single ⟨20992,21056,9152,9216⟩))) (.node (.node (.single ⟨21056,21120,9088,9152⟩) (.single ⟨21056,21120,9152,9216⟩)) (.node (.single ⟨21120,21248,8960,9088⟩) (.single ⟨21120,21248,9088,9216⟩)))) (.node (.node (.single ⟨23552,23680,11520,11648⟩) (.node (.single ⟨23552,23616,11648,11712⟩) (.single ⟨23552,23616,11712,11776⟩))) (.node (.node (.single ⟨23616,23680,11648,11712⟩) (.single ⟨23616,23680,11712,11776⟩)) (.node (.single ⟨23680,23808,11520,11648⟩) (.single ⟨23680,23808,11648,11776⟩))))))
def output6 : Fin 28 → GridBox := outputData6.get
def coverData6 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData6 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover6 (i : Fin 28) : Fin 28 := ⟨coverData6.get i % 28, Nat.mod_lt _ (by decide)⟩
def source6 (i : Fin 28) : Fin 28 := ⟨sourceData6.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree6 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 (.cutX 9216 (.cutY 21504 (.cutX 8704 .empty (.cutY 20992 .empty (.cutX 8960 .empty (.cutY 21248 (.cutX 9088 (.cutY 21120 .full .full) (.cutY 21120 (.cutX 9152 (.cutY 21056 .full .full) (.cutY 21056 .full .full)) .full)) .empty)))) .empty) .empty) .empty) (.cutY 22528 .empty (.cutX 11264 .empty (.cutY 23552 .empty (.cutX 11776 (.cutY 24064 (.cutX 11520 .empty (.cutY 23808 (.cutX 11648 (.cutY 23680 .full .full) (.cutY 23680 (.cutX 11712 (.cutY 23616 .full .full) (.cutY 23616 .full .full)) .full)) .empty)) .empty) .empty)))))) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 (.cutY 10240 (.cutX 21504 (.cutY 9216 (.cutX 20992 .empty (.cutY 8704 .empty (.cutX 21248 (.cutY 8960 .empty (.cutX 21120 (.cutY 9088 .full (.cutX 21056 (.cutY 9152 .full .full) (.cutY 9152 .full .full))) (.cutY 9088 .full .full))) .empty))) .empty) .empty) .empty) (.cutY 10240 .empty (.cutX 23552 .empty (.cutY 11264 .empty (.cutX 24064 (.cutY 11776 (.cutX 23808 (.cutY 11520 .empty (.cutX 23680 (.cutY 11648 .full (.cutX 23616 (.cutY 11712 .full .full) (.cutY 11712 .full .full))) (.cutY 11648 .full .full))) .empty) .empty) .empty))))) .empty))) .empty) .empty))

theorem metadata6 : 0<156512574 ∧ 35<128 ∧ 82<128 ∧ 1<4 ∧
    7497/4160=1 ∧ 7497%4160=3337 ∧ ∀ i, (leaves6 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData6).mp
    (by decide +kernel)

theorem sourceChecked6_0 : ∀ i : Fin 28,
    (fun i => output6 i = raw6 (source6 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked6 : ∀ i : Fin 28, (fun i => output6 i = raw6 (source6 i)) i :=
  forallFin_of_zero_offset (fun i => output6 i = raw6 (source6 i)) sourceChecked6_0

theorem coverChecked6_0 : ∀ i : Fin 28,
    (fun i => (output6 (cover6 i)).ContainsBox (raw6 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked6 : ∀ i : Fin 28, (fun i => (output6 (cover6 i)).ContainsBox (raw6 i)) i :=
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

noncomputable def phaseMass6 : ℝ := singlePhaseMass (156512574/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw6 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass6_eq : phaseMass6 = (78256287/819200000000 : ℝ) := by
  unfold phaseMass6
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw6 output6 cover6 source6
    (gridTreeUnionCheck_sound 32768 raw6 output6 cover6 source6 tree6 checked6)
    _ (by norm_num) _, areaUnits6]
  norm_num

-- Frozen phase 5354, atom 7036, type 1, source (28,76).
def leavesData7 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves7 : Fin 10 → DyadicLeaf := leavesData7.get
def raw7 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 28 76 leaves7 i
def outputData7 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨7168,7296,19456,19584⟩) (.single ⟨7168,7296,19584,19712⟩)) (.node (.single ⟨7296,7360,19456,19520⟩) (.node (.single ⟨7296,7360,19520,19584⟩) (.single ⟨7360,7392,19456,19488⟩)))) (.node (.node (.single ⟨7360,7392,19488,19520⟩) (.single ⟨7392,7424,19456,19488⟩)) (.node (.single ⟨7392,7424,19488,19520⟩) (.node (.single ⟨7360,7424,19520,19584⟩) (.single ⟨7296,7424,19584,19712⟩))))) (.node (.node (.node (.single ⟨13056,13184,25344,25472⟩) (.single ⟨13056,13184,25472,25600⟩)) (.node (.single ⟨13184,13248,25344,25408⟩) (.node (.single ⟨13184,13248,25408,25472⟩) (.single ⟨13248,13280,25344,25376⟩)))) (.node (.node (.single ⟨13248,13280,25376,25408⟩) (.single ⟨13280,13312,25344,25376⟩)) (.node (.single ⟨13280,13312,25376,25408⟩) (.node (.single ⟨13248,13312,25408,25472⟩) (.single ⟨13184,13312,25472,25600⟩)))))) (.node (.node (.node (.node (.single ⟨19456,19584,7168,7296⟩) (.single ⟨19456,19520,7296,7360⟩)) (.node (.single ⟨19456,19488,7360,7392⟩) (.node (.single ⟨19456,19488,7392,7424⟩) (.single ⟨19488,19520,7360,7392⟩)))) (.node (.node (.single ⟨19488,19520,7392,7424⟩) (.single ⟨19520,19584,7296,7360⟩)) (.node (.single ⟨19520,19584,7360,7424⟩) (.node (.single ⟨19584,19712,7168,7296⟩) (.single ⟨19584,19712,7296,7424⟩))))) (.node (.node (.node (.single ⟨25344,25472,13056,13184⟩) (.single ⟨25344,25408,13184,13248⟩)) (.node (.single ⟨25344,25376,13248,13280⟩) (.node (.single ⟨25344,25376,13280,13312⟩) (.single ⟨25376,25408,13248,13280⟩)))) (.node (.node (.single ⟨25376,25408,13280,13312⟩) (.single ⟨25408,25472,13184,13248⟩)) (.node (.single ⟨25408,25472,13248,13312⟩) (.node (.single ⟨25472,25600,13056,13184⟩) (.single ⟨25472,25600,13184,13312⟩)))))))
def output7 : Fin 40 → GridBox := outputData7.get
def coverData7 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 28) (.single 38)) (.node (.single 11) (.node (.single 9) (.single 29))))) (.node (.node (.node (.single 30) (.single 10)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 26) (.node (.single 36) (.single 13)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 23) (.single 33)))) (.node (.node (.single 16) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))))
def sourceData7 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover7 (i : Fin 40) : Fin 40 := ⟨coverData7.get i % 40, Nat.mod_lt _ (by decide)⟩
def source7 (i : Fin 40) : Fin 40 := ⟨sourceData7.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree7 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 .empty (.cutX 7168 .empty (.cutY 19456 .empty (.cutX 7680 (.cutY 19968 (.cutX 7424 (.cutY 19712 (.cutX 7296 (.cutY 19584 .full .full) (.cutY 19584 (.cutX 7360 (.cutY 19520 .full .full) (.cutY 19520 (.cutX 7392 (.cutY 19488 .full .full) (.cutY 19488 .full .full)) .full)) .full)) .empty) .empty) .empty) .empty))))) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 (.cutX 13312 (.cutY 25600 (.cutX 12800 .empty (.cutY 25088 .empty (.cutX 13056 .empty (.cutY 25344 .empty (.cutX 13184 (.cutY 25472 .full .full) (.cutY 25472 (.cutX 13248 (.cutY 25408 .full .full) (.cutY 25408 (.cutX 13280 (.cutY 25376 .full .full) (.cutY 25376 .full .full)) .full)) .full)))))) .empty) .empty) .empty) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 .empty (.cutX 19456 .empty (.cutY 7168 .empty (.cutX 19968 (.cutY 7680 (.cutX 19712 (.cutY 7424 (.cutX 19584 (.cutY 7296 .full (.cutX 19520 (.cutY 7360 .full (.cutX 19488 (.cutY 7392 .full .full) (.cutY 7392 .full .full))) (.cutY 7360 .full .full))) (.cutY 7296 .full .full)) .empty) .empty) .empty) .empty)))))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 (.cutX 25600 (.cutY 13312 (.cutX 25088 .empty (.cutY 12800 .empty (.cutX 25344 .empty (.cutY 13056 .empty (.cutX 25472 (.cutY 13184 .full (.cutX 25408 (.cutY 13248 .full (.cutX 25376 (.cutY 13280 .full .full) (.cutY 13280 .full .full))) (.cutY 13248 .full .full))) (.cutY 13184 .full .full)))))) .empty) .empty) .empty) .empty)) .empty))) .empty))

theorem metadata7 : 0<140060506 ∧ 28<128 ∧ 76<128 ∧ 1<4 ∧
    7036/4160=1 ∧ 7036%4160=2876 ∧ ∀ i, (leaves7 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData7).mp
    (by decide +kernel)

theorem sourceChecked7_0 : ∀ i : Fin 40,
    (fun i => output7 i = raw7 (source7 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked7 : ∀ i : Fin 40, (fun i => output7 i = raw7 (source7 i)) i :=
  forallFin_of_zero_offset (fun i => output7 i = raw7 (source7 i)) sourceChecked7_0

theorem coverChecked7_0 : ∀ i : Fin 40,
    (fun i => (output7 (cover7 i)).ContainsBox (raw7 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked7 : ∀ i : Fin 40, (fun i => (output7 (cover7 i)).ContainsBox (raw7 i)) i :=
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

noncomputable def phaseMass7 : ℝ := singlePhaseMass (140060506/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw7 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass7_eq : phaseMass7 = (70030253/819200000000 : ℝ) := by
  unfold phaseMass7
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw7 output7 cover7 source7
    (gridTreeUnionCheck_sound 32768 raw7 output7 cover7 source7 tree7 checked7)
    _ (by norm_num) _, areaUnits7]
  norm_num

-- Frozen phase 5355, atom 5068, type 1, source (7,61).
def leavesData8 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,0⟩))) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves8 : Fin 13 → DyadicLeaf := leavesData8.get
def raw8 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 7 61 leaves8 i
def outputData8 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨1792,1856,15616,15680⟩) (.node (.single ⟨1792,1856,15680,15744⟩) (.single ⟨1856,1920,15616,15680⟩))) (.node (.single ⟨1856,1920,15680,15744⟩) (.node (.single ⟨1792,1920,15744,15872⟩) (.single ⟨1920,1984,15616,15680⟩)))) (.node (.node (.single ⟨1920,1984,15680,15744⟩) (.node (.single ⟨1984,2016,15616,15648⟩) (.single ⟨1984,2016,15648,15680⟩))) (.node (.node (.single ⟨2016,2048,15616,15648⟩) (.single ⟨2016,2048,15648,15680⟩)) (.node (.single ⟨1984,2048,15680,15744⟩) (.single ⟨1920,2048,15744,15872⟩))))) (.node (.node (.node (.single ⟨15616,15680,1792,1856⟩) (.node (.single ⟨15616,15680,1856,1920⟩) (.single ⟨15680,15744,1792,1856⟩))) (.node (.single ⟨15680,15744,1856,1920⟩) (.node (.single ⟨15616,15680,1920,1984⟩) (.single ⟨15616,15648,1984,2016⟩)))) (.node (.node (.single ⟨15616,15648,2016,2048⟩) (.node (.single ⟨15648,15680,1984,2016⟩) (.single ⟨15648,15680,2016,2048⟩))) (.node (.node (.single ⟨15680,15744,1920,1984⟩) (.single ⟨15680,15744,1984,2048⟩)) (.node (.single ⟨15744,15872,1792,1920⟩) (.single ⟨15744,15872,1920,2048⟩)))))) (.node (.node (.node (.node (.single ⟨16896,17024,30720,30848⟩) (.node (.single ⟨16896,17024,30848,30976⟩) (.single ⟨17024,17088,30720,30784⟩))) (.node (.single ⟨17024,17088,30784,30848⟩) (.node (.single ⟨17088,17120,30720,30752⟩) (.single ⟨17088,17120,30752,30784⟩)))) (.node (.node (.single ⟨17120,17152,30720,30752⟩) (.node (.single ⟨17120,17152,30752,30784⟩) (.single ⟨17088,17152,30784,30848⟩))) (.node (.node (.single ⟨17024,17088,30848,30912⟩) (.single ⟨17024,17088,30912,30976⟩)) (.node (.single ⟨17088,17152,30848,30912⟩) (.single ⟨17088,17152,30912,30976⟩))))) (.node (.node (.node (.single ⟨30720,30848,16896,17024⟩) (.node (.single ⟨30720,30784,17024,17088⟩) (.single ⟨30720,30752,17088,17120⟩))) (.node (.single ⟨30720,30752,17120,17152⟩) (.node (.single ⟨30752,30784,17088,17120⟩) (.single ⟨30752,30784,17120,17152⟩)))) (.node (.node (.single ⟨30784,30848,17024,17088⟩) (.node (.single ⟨30784,30848,17088,17152⟩) (.single ⟨30848,30976,16896,17024⟩))) (.node (.node (.single ⟨30848,30912,17024,17088⟩) (.single ⟨30848,30912,17088,17152⟩)) (.node (.single ⟨30912,30976,17024,17088⟩) (.single ⟨30912,30976,17088,17152⟩)))))))
def output8 : Fin 52 → GridBox := outputData8.get
def coverData8 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 24) (.single 47))) (.node (.single 27) (.node (.single 12) (.single 25)))) (.node (.node (.single 39) (.node (.single 26) (.single 0))) (.node (.node (.single 13) (.single 51)) (.node (.single 38) (.single 1))))) (.node (.node (.node (.single 15) (.node (.single 50) (.single 36))) (.node (.single 2) (.node (.single 14) (.single 49)))) (.node (.node (.single 37) (.node (.single 3) (.single 16))) (.node (.node (.single 48) (.single 35)) (.node (.single 5) (.single 17)))))) (.node (.node (.node (.node (.single 46) (.node (.single 34) (.single 6))) (.node (.single 22) (.node (.single 45) (.single 29)))) (.node (.node (.single 11) (.node (.single 23) (.single 40))) (.node (.node (.single 28) (.single 7)) (.node (.single 18) (.single 44))))) (.node (.node (.node (.single 33) (.node (.single 8) (.single 20))) (.node (.single 43) (.node (.single 31) (.single 9)))) (.node (.node (.single 19) (.node (.single 42) (.single 32))) (.node (.node (.single 10) (.single 21)) (.node (.single 41) (.single 30)))))))
def sourceData8 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.single 20) (.node (.single 0) (.single 24)))) (.node (.node (.single 28) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.single 9) (.node (.single 17) (.single 13))) (.node (.single 21) (.node (.single 25) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.single 7) (.node (.single 3) (.single 35))) (.node (.single 31) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11))))) (.node (.node (.node (.single 6) (.node (.single 34) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 30) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover8 (i : Fin 52) : Fin 52 := ⟨coverData8.get i % 52, Nat.mod_lt _ (by decide)⟩
def source8 (i : Fin 52) : Fin 52 := ⟨sourceData8.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree8 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 .empty (.cutX 1024 .empty (.cutY 15360 .empty (.cutX 1536 .empty (.cutY 15872 (.cutX 1792 .empty (.cutY 15616 .empty (.cutX 1920 (.cutY 15744 (.cutX 1856 (.cutY 15680 .full .full) (.cutY 15680 .full .full)) .full) (.cutY 15744 (.cutX 1984 (.cutY 15680 .full .full) (.cutY 15680 (.cutX 2016 (.cutY 15648 .full .full) (.cutY 15648 .full .full)) .full)) .full)))) .empty))))) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 (.cutX 15360 .empty (.cutY 1024 .empty (.cutX 15872 (.cutY 1536 .empty (.cutX 15616 .empty (.cutY 1792 .empty (.cutX 15744 (.cutY 1920 (.cutX 15680 (.cutY 1856 .full .full) (.cutY 1856 .full .full)) (.cutX 15680 (.cutY 1984 .full (.cutX 15648 (.cutY 2016 .full .full) (.cutY 2016 .full .full))) (.cutY 1984 .full .full))) (.cutY 1920 .full .full))))) .empty))) .empty)) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 .empty (.cutX 17408 (.cutY 31744 (.cutX 16896 .empty (.cutY 31232 (.cutX 17152 (.cutY 30976 (.cutX 17024 (.cutY 30848 .full .full) (.cutY 30848 (.cutX 17088 (.cutY 30784 .full .full) (.cutY 30784 (.cutX 17120 (.cutY 30752 .full .full) (.cutY 30752 .full .full)) .full)) (.cutX 17088 (.cutY 30912 .full .full) (.cutY 30912 .full .full)))) .empty) .empty) .empty)) .empty) .empty)) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 (.cutX 31744 (.cutY 17408 (.cutX 31232 (.cutY 16896 .empty (.cutX 30976 (.cutY 17152 (.cutX 30848 (.cutY 17024 .full (.cutX 30784 (.cutY 17088 .full (.cutX 30752 (.cutY 17120 .full .full) (.cutY 17120 .full .full))) (.cutY 17088 .full .full))) (.cutY 17024 .full (.cutX 30912 (.cutY 17088 .full .full) (.cutY 17088 .full .full)))) .empty) .empty)) .empty) .empty) .empty) .empty)) .empty)) .empty))))

theorem metadata8 : 0<169648215 ∧ 7<128 ∧ 61<128 ∧ 1<4 ∧
    5068/4160=1 ∧ 5068%4160=908 ∧ ∀ i, (leaves8 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData8).mp
    (by decide +kernel)

theorem sourceChecked8_0 : ∀ i : Fin 52,
    (fun i => output8 i = raw8 (source8 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked8 : ∀ i : Fin 52, (fun i => output8 i = raw8 (source8 i)) i :=
  forallFin_of_zero_offset (fun i => output8 i = raw8 (source8 i)) sourceChecked8_0

theorem coverChecked8_0 : ∀ i : Fin 52,
    (fun i => (output8 (cover8 i)).ContainsBox (raw8 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked8 : ∀ i : Fin 52, (fun i => (output8 (cover8 i)).ContainsBox (raw8 i)) i :=
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

noncomputable def phaseMass8 : ℝ := singlePhaseMass (169648215/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw8 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass8_eq : phaseMass8 = (33929643/327680000000 : ℝ) := by
  unfold phaseMass8
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw8 output8 cover8 source8
    (gridTreeUnionCheck_sound 32768 raw8 output8 cover8 source8 tree8 checked8)
    _ (by norm_num) _, areaUnits8]
  norm_num

-- Frozen phase 5356, atom 5293, type 1, source (9,62).
def leavesData9 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩))) (.node (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩)))) (.node (.node (.node (.single ⟨3,4,0⟩) (.single ⟨3,4,1⟩)) (.node (.single ⟨3,5,0⟩) (.single ⟨3,5,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves9 : Fin 16 → DyadicLeaf := leavesData9.get
def raw9 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 9 62 leaves9 i
def outputData9 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨2304,2368,15872,15936⟩) (.single ⟨2304,2368,15936,16000⟩)) (.node (.single ⟨2368,2432,15872,15936⟩) (.single ⟨2368,2432,15936,16000⟩))) (.node (.node (.single ⟨2304,2432,16000,16128⟩) (.single ⟨2432,2464,15872,15904⟩)) (.node (.single ⟨2432,2464,15904,15936⟩) (.single ⟨2464,2496,15872,15904⟩)))) (.node (.node (.node (.single ⟨2464,2496,15904,15936⟩) (.single ⟨2432,2496,15936,16000⟩)) (.node (.single ⟨2496,2528,15872,15904⟩) (.single ⟨2496,2528,15904,15936⟩))) (.node (.node (.single ⟨2528,2560,15872,15904⟩) (.single ⟨2528,2560,15904,15936⟩)) (.node (.single ⟨2496,2560,15936,16000⟩) (.single ⟨2432,2560,16000,16128⟩))))) (.node (.node (.node (.node (.single ⟨15872,15936,2304,2368⟩) (.single ⟨15872,15936,2368,2432⟩)) (.node (.single ⟨15936,16000,2304,2368⟩) (.single ⟨15936,16000,2368,2432⟩))) (.node (.node (.single ⟨15872,15904,2432,2464⟩) (.single ⟨15872,15904,2464,2496⟩)) (.node (.single ⟨15904,15936,2432,2464⟩) (.single ⟨15904,15936,2464,2496⟩)))) (.node (.node (.node (.single ⟨15872,15904,2496,2528⟩) (.single ⟨15872,15904,2528,2560⟩)) (.node (.single ⟨15904,15936,2496,2528⟩) (.single ⟨15904,15936,2528,2560⟩))) (.node (.node (.single ⟨15936,16000,2432,2496⟩) (.single ⟨15936,16000,2496,2560⟩)) (.node (.single ⟨16000,16128,2304,2432⟩) (.single ⟨16000,16128,2432,2560⟩)))))) (.node (.node (.node (.node (.node (.single ⟨16640,16768,30208,30336⟩) (.single ⟨16640,16768,30336,30464⟩)) (.node (.single ⟨16768,16832,30208,30272⟩) (.single ⟨16768,16832,30272,30336⟩))) (.node (.node (.single ⟨16832,16864,30208,30240⟩) (.single ⟨16832,16864,30240,30272⟩)) (.node (.single ⟨16864,16896,30208,30240⟩) (.single ⟨16864,16896,30240,30272⟩)))) (.node (.node (.node (.single ⟨16832,16864,30272,30304⟩) (.single ⟨16832,16864,30304,30336⟩)) (.node (.single ⟨16864,16896,30272,30304⟩) (.single ⟨16864,16896,30304,30336⟩))) (.node (.node (.single ⟨16768,16832,30336,30400⟩) (.single ⟨16768,16832,30400,30464⟩)) (.node (.single ⟨16832,16896,30336,30400⟩) (.single ⟨16832,16896,30400,30464⟩))))) (.node (.node (.node (.node (.single ⟨30208,30336,16640,16768⟩) (.single ⟨30208,30272,16768,16832⟩)) (.node (.single ⟨30208,30240,16832,16864⟩) (.single ⟨30208,30240,16864,16896⟩))) (.node (.node (.single ⟨30240,30272,16832,16864⟩) (.single ⟨30240,30272,16864,16896⟩)) (.node (.single ⟨30272,30336,16768,16832⟩) (.single ⟨30272,30304,16832,16864⟩)))) (.node (.node (.node (.single ⟨30272,30304,16864,16896⟩) (.single ⟨30304,30336,16832,16864⟩)) (.node (.single ⟨30304,30336,16864,16896⟩) (.single ⟨30336,30464,16640,16768⟩))) (.node (.node (.single ⟨30336,30400,16768,16832⟩) (.single ⟨30336,30400,16832,16896⟩)) (.node (.single ⟨30400,30464,16768,16832⟩) (.single ⟨30400,30464,16832,16896⟩)))))))
def output9 : Fin 64 → GridBox := outputData9.get
def coverData9 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 30)) (.node (.single 59) (.single 33))) (.node (.node (.single 15) (.single 31)) (.node (.single 48) (.single 32)))) (.node (.node (.node (.single 0) (.single 16)) (.node (.single 63) (.single 47))) (.node (.node (.single 1) (.single 18)) (.node (.single 62) (.single 45))))) (.node (.node (.node (.node (.single 2) (.single 17)) (.node (.single 61) (.single 46))) (.node (.node (.single 3) (.single 19)) (.node (.single 60) (.single 44)))) (.node (.node (.node (.single 9) (.single 28)) (.node (.single 54) (.single 35))) (.node (.node (.single 14) (.single 29)) (.node (.single 49) (.single 34)))))) (.node (.node (.node (.node (.node (.single 5) (.single 20)) (.node (.single 58) (.single 43))) (.node (.node (.single 6) (.single 22)) (.node (.single 57) (.single 41)))) (.node (.node (.node (.single 7) (.single 21)) (.node (.single 56) (.single 42))) (.node (.node (.single 8) (.single 23)) (.node (.single 55) (.single 40))))) (.node (.node (.node (.node (.single 10) (.single 24)) (.node (.single 53) (.single 39))) (.node (.node (.single 11) (.single 26)) (.node (.single 52) (.single 37)))) (.node (.node (.node (.single 12) (.single 25)) (.node (.single 51) (.single 38))) (.node (.node (.single 13) (.single 27)) (.node (.single 50) (.single 36)))))))
def sourceData9 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.single 20))) (.node (.node (.single 0) (.single 32)) (.node (.single 36) (.single 40)))) (.node (.node (.node (.single 44) (.single 24)) (.node (.single 48) (.single 52))) (.node (.node (.single 56) (.single 60)) (.node (.single 28) (.single 4))))) (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.single 21))) (.node (.node (.single 33) (.single 41)) (.node (.single 37) (.single 45)))) (.node (.node (.node (.single 49) (.single 57)) (.node (.single 53) (.single 61))) (.node (.node (.single 25) (.single 29)) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.node (.single 7) (.single 3)) (.node (.single 31) (.single 27))) (.node (.node (.single 63) (.single 55)) (.node (.single 59) (.single 51)))) (.node (.node (.node (.single 47) (.single 39)) (.node (.single 43) (.single 35))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11))))) (.node (.node (.node (.node (.single 6) (.single 30)) (.node (.single 62) (.single 58))) (.node (.node (.single 54) (.single 50)) (.node (.single 26) (.single 46)))) (.node (.node (.node (.single 42) (.single 38)) (.node (.single 34) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover9 (i : Fin 64) : Fin 64 := ⟨coverData9.get i % 64, Nat.mod_lt _ (by decide)⟩
def source9 (i : Fin 64) : Fin 64 := ⟨sourceData9.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree9 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 .empty (.cutX 3072 (.cutY 15360 .empty (.cutX 2560 (.cutY 15872 .empty (.cutX 2304 .empty (.cutY 16128 (.cutX 2432 (.cutY 16000 (.cutX 2368 (.cutY 15936 .full .full) (.cutY 15936 .full .full)) .full) (.cutY 16000 (.cutX 2496 (.cutY 15936 (.cutX 2464 (.cutY 15904 .full .full) (.cutY 15904 .full .full)) .full) (.cutY 15936 (.cutX 2528 (.cutY 15904 .full .full) (.cutY 15904 .full .full)) .full)) .full)) .empty))) .empty)) .empty)))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 .empty (.cutX 15360 .empty (.cutY 3072 (.cutX 15872 .empty (.cutY 2560 (.cutX 16128 (.cutY 2304 .empty (.cutX 16000 (.cutY 2432 (.cutX 15936 (.cutY 2368 .full .full) (.cutY 2368 .full .full)) (.cutX 15936 (.cutY 2496 (.cutX 15904 (.cutY 2464 .full .full) (.cutY 2464 .full .full)) (.cutX 15904 (.cutY 2528 .full .full) (.cutY 2528 .full .full))) (.cutY 2496 .full .full))) (.cutY 2432 .full .full))) .empty) .empty)) .empty)))) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 (.cutX 17408 (.cutY 29696 .empty (.cutX 16896 (.cutY 30208 .empty (.cutX 16640 .empty (.cutY 30464 (.cutX 16768 (.cutY 30336 .full .full) (.cutY 30336 (.cutX 16832 (.cutY 30272 .full .full) (.cutY 30272 (.cutX 16864 (.cutY 30240 .full .full) (.cutY 30240 .full .full)) (.cutX 16864 (.cutY 30304 .full .full) (.cutY 30304 .full .full)))) (.cutX 16832 (.cutY 30400 .full .full) (.cutY 30400 .full .full)))) .empty))) .empty)) .empty) .empty) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 (.cutX 29696 .empty (.cutY 17408 (.cutX 30208 .empty (.cutY 16896 (.cutX 30464 (.cutY 16640 .empty (.cutX 30336 (.cutY 16768 .full (.cutX 30272 (.cutY 16832 .full (.cutX 30240 (.cutY 16864 .full .full) (.cutY 16864 .full .full))) (.cutY 16832 .full (.cutX 30304 (.cutY 16864 .full .full) (.cutY 16864 .full .full))))) (.cutY 16768 .full (.cutX 30400 (.cutY 16832 .full .full) (.cutY 16832 .full .full))))) .empty) .empty)) .empty)) .empty) .empty) .empty)) .empty))))

theorem metadata9 : 0<163200014 ∧ 9<128 ∧ 62<128 ∧ 1<4 ∧
    5293/4160=1 ∧ 5293%4160=1133 ∧ ∀ i, (leaves9 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData9).mp
    (by decide +kernel)

theorem sourceChecked9_0 : ∀ i : Fin 64,
    (fun i => output9 i = raw9 (source9 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked9 : ∀ i : Fin 64, (fun i => output9 i = raw9 (source9 i)) i :=
  forallFin_of_zero_offset (fun i => output9 i = raw9 (source9 i)) sourceChecked9_0

theorem coverChecked9_0 : ∀ i : Fin 64,
    (fun i => (output9 (cover9 i)).ContainsBox (raw9 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked9 : ∀ i : Fin 64, (fun i => (output9 (cover9 i)).ContainsBox (raw9 i)) i :=
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

noncomputable def phaseMass9 : ℝ := singlePhaseMass (163200014/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw9 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass9_eq : phaseMass9 = (81600007/819200000000 : ℝ) := by
  unfold phaseMass9
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw9 output9 cover9 source9
    (gridTreeUnionCheck_sound 32768 raw9 output9 cover9 source9 tree9 checked9)
    _ (by norm_num) _, areaUnits9]
  norm_num

-- Frozen phase 5357, atom 6208, type 1, source (18,68).
def leavesData10 : FiniteInputTree DyadicLeaf 27 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩))) (.node (.single ⟨2,1,0⟩) (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩))) (.node (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)) (.node (.single ⟨3,6,1⟩) (.single ⟨3,7,1⟩))))) (.node (.node (.node (.single ⟨3,4,0⟩) (.node (.single ⟨3,4,1⟩) (.single ⟨3,5,0⟩))) (.node (.node (.single ⟨3,5,1⟩) (.single ⟨4,12,0⟩)) (.node (.single ⟨4,12,1⟩) (.single ⟨4,13,0⟩)))) (.node (.node (.single ⟨4,13,1⟩) (.node (.single ⟨4,14,0⟩) (.single ⟨4,14,1⟩))) (.node (.node (.single ⟨4,15,1⟩) (.single ⟨5,30,0⟩)) (.node (.single ⟨5,30,1⟩) (.single ⟨5,31,1⟩))))))
def leaves10 : Fin 27 → DyadicLeaf := leavesData10.get
def raw10 (i : Fin 108) : GridBox := phaseImageBoxes 32768 8 18 68 leaves10 i
def outputData10 : FiniteInputTree GridBox 108 := (.node (.node (.node (.node (.node (.node (.single ⟨4608,4672,17408,17472⟩) (.node (.single ⟨4608,4672,17472,17536⟩) (.single ⟨4672,4736,17408,17472⟩))) (.node (.single ⟨4672,4736,17472,17536⟩) (.node (.single ⟨4608,4736,17536,17664⟩) (.single ⟨4736,4768,17408,17440⟩)))) (.node (.node (.single ⟨4736,4768,17440,17472⟩) (.node (.single ⟨4768,4800,17408,17440⟩) (.single ⟨4768,4800,17440,17472⟩))) (.node (.node (.single ⟨4736,4800,17472,17536⟩) (.single ⟨4800,4816,17408,17424⟩)) (.node (.single ⟨4800,4816,17424,17440⟩) (.single ⟨4816,4832,17408,17424⟩))))) (.node (.node (.node (.single ⟨4816,4832,17424,17440⟩) (.node (.single ⟨4800,4832,17440,17472⟩) (.single ⟨4832,4848,17408,17424⟩))) (.node (.node (.single ⟨4832,4848,17424,17440⟩) (.single ⟨4848,4856,17408,17416⟩)) (.node (.single ⟨4848,4856,17416,17424⟩) (.single ⟨4856,4864,17416,17424⟩)))) (.node (.node (.single ⟨4848,4864,17424,17440⟩) (.node (.single ⟨4832,4864,17440,17472⟩) (.single ⟨4800,4864,17472,17536⟩))) (.node (.node (.single ⟨4736,4800,17536,17600⟩) (.single ⟨4736,4800,17600,17664⟩)) (.node (.single ⟨4800,4864,17536,17600⟩) (.single ⟨4800,4864,17600,17664⟩)))))) (.node (.node (.node (.node (.single ⟨15104,15168,27904,27968⟩) (.node (.single ⟨15104,15168,27968,28032⟩) (.single ⟨15168,15232,27904,27968⟩))) (.node (.single ⟨15168,15232,27968,28032⟩) (.node (.single ⟨15104,15232,28032,28160⟩) (.single ⟨15232,15296,27904,27968⟩)))) (.node (.node (.single ⟨15232,15296,27968,28032⟩) (.node (.single ⟨15296,15328,27904,27936⟩) (.single ⟨15296,15328,27936,27968⟩))) (.node (.node (.single ⟨15328,15344,27904,27920⟩) (.single ⟨15328,15344,27920,27936⟩)) (.node (.single ⟨15344,15352,27904,27912⟩) (.single ⟨15344,15352,27912,27920⟩))))) (.node (.node (.node (.single ⟨15352,15360,27912,27920⟩) (.node (.single ⟨15344,15360,27920,27936⟩) (.single ⟨15328,15344,27936,27952⟩))) (.node (.node (.single ⟨15328,15344,27952,27968⟩) (.single ⟨15344,15360,27936,27952⟩)) (.node (.single ⟨15344,15360,27952,27968⟩) (.single ⟨15296,15328,27968,28000⟩)))) (.node (.node (.single ⟨15296,15328,28000,28032⟩) (.node (.single ⟨15328,15360,27968,28000⟩) (.single ⟨15328,15360,28000,28032⟩))) (.node (.node (.single ⟨15232,15296,28032,28096⟩) (.single ⟨15232,15296,28096,28160⟩)) (.node (.single ⟨15296,15360,28032,28096⟩) (.single ⟨15296,15360,28096,28160⟩))))))) (.node (.node (.node (.node (.node (.single ⟨17408,17472,4608,4672⟩) (.node (.single ⟨17408,17472,4672,4736⟩) (.single ⟨17472,17536,4608,4672⟩))) (.node (.single ⟨17472,17536,4672,4736⟩) (.node (.single ⟨17408,17440,4736,4768⟩) (.single ⟨17408,17440,4768,4800⟩)))) (.node (.node (.single ⟨17440,17472,4736,4768⟩) (.node (.single ⟨17440,17472,4768,4800⟩) (.single ⟨17408,17424,4800,4816⟩))) (.node (.node (.single ⟨17408,17424,4816,4832⟩) (.single ⟨17424,17440,4800,4816⟩)) (.node (.single ⟨17424,17440,4816,4832⟩) (.single ⟨17408,17424,4832,4848⟩))))) (.node (.node (.node (.single ⟨17408,17416,4848,4856⟩) (.node (.single ⟨17416,17424,4848,4856⟩) (.single ⟨17416,17424,4856,4864⟩))) (.node (.node (.single ⟨17424,17440,4832,4848⟩) (.single ⟨17424,17440,4848,4864⟩)) (.node (.single ⟨17440,17472,4800,4832⟩) (.single ⟨17440,17472,4832,4864⟩)))) (.node (.node (.single ⟨17472,17536,4736,4800⟩) (.node (.single ⟨17472,17536,4800,4864⟩) (.single ⟨17536,17664,4608,4736⟩))) (.node (.node (.single ⟨17536,17600,4736,4800⟩) (.single ⟨17536,17600,4800,4864⟩)) (.node (.single ⟨17600,17664,4736,4800⟩) (.single ⟨17600,17664,4800,4864⟩)))))) (.node (.node (.node (.node (.single ⟨27904,27968,15104,15168⟩) (.node (.single ⟨27904,27968,15168,15232⟩) (.single ⟨27968,28032,15104,15168⟩))) (.node (.single ⟨27968,28032,15168,15232⟩) (.node (.single ⟨27904,27968,15232,15296⟩) (.single ⟨27904,27936,15296,15328⟩)))) (.node (.node (.single ⟨27904,27920,15328,15344⟩) (.node (.single ⟨27904,27912,15344,15352⟩) (.single ⟨27912,27920,15344,15352⟩))) (.node (.node (.single ⟨27912,27920,15352,15360⟩) (.single ⟨27920,27936,15328,15344⟩)) (.node (.single ⟨27920,27936,15344,15360⟩) (.single ⟨27936,27968,15296,15328⟩))))) (.node (.node (.node (.single ⟨27936,27952,15328,15344⟩) (.node (.single ⟨27936,27952,15344,15360⟩) (.single ⟨27952,27968,15328,15344⟩))) (.node (.node (.single ⟨27952,27968,15344,15360⟩) (.single ⟨27968,28032,15232,15296⟩)) (.node (.single ⟨27968,28000,15296,15328⟩) (.single ⟨27968,28000,15328,15360⟩)))) (.node (.node (.single ⟨28000,28032,15296,15328⟩) (.node (.single ⟨28000,28032,15328,15360⟩) (.single ⟨28032,28160,15104,15232⟩))) (.node (.node (.single ⟨28032,28096,15232,15296⟩) (.single ⟨28032,28096,15296,15360⟩)) (.node (.single ⟨28096,28160,15232,15296⟩) (.single ⟨28096,28160,15296,15360⟩))))))))
def output10 : Fin 108 → GridBox := outputData10.get
def coverData10 : FiniteInputTree ℕ 108 := (.node (.node (.node (.node (.node (.node (.single 4) (.node (.single 76) (.single 103))) (.node (.single 31) (.node (.single 0) (.single 54)))) (.node (.node (.single 107) (.node (.single 53) (.single 1))) (.node (.node (.single 56) (.single 106)) (.node (.single 51) (.single 2))))) (.node (.node (.node (.single 55) (.node (.single 105) (.single 52))) (.node (.node (.single 3) (.single 57)) (.node (.single 104) (.single 50)))) (.node (.node (.single 9) (.node (.single 74) (.single 98))) (.node (.node (.single 33) (.single 22)) (.node (.single 75) (.single 85)))))) (.node (.node (.node (.node (.single 32) (.node (.single 23) (.single 77))) (.node (.single 84) (.node (.single 30) (.single 24)))) (.node (.node (.single 79) (.node (.single 83) (.single 28))) (.node (.node (.single 25) (.single 78)) (.node (.single 82) (.single 29))))) (.node (.node (.node (.single 26) (.node (.single 80) (.single 81))) (.node (.node (.single 27) (.single 14)) (.node (.single 72) (.single 93)))) (.node (.node (.single 35) (.node (.single 21) (.single 73))) (.node (.node (.single 86) (.single 34)) (.node (.single 5) (.single 58))))))) (.node (.node (.node (.node (.node (.single 102) (.node (.single 49) (.single 6))) (.node (.single 60) (.node (.single 101) (.single 47)))) (.node (.node (.single 7) (.node (.single 59) (.single 100))) (.node (.node (.single 48) (.single 8)) (.node (.single 61) (.single 99))))) (.node (.node (.node (.single 46) (.node (.single 10) (.single 62))) (.node (.node (.single 97) (.single 45)) (.node (.single 11) (.single 64)))) (.node (.node (.single 96) (.node (.single 43) (.single 12))) (.node (.node (.single 63) (.single 95)) (.node (.single 44) (.single 13)))))) (.node (.node (.node (.node (.single 65) (.node (.single 94) (.single 42))) (.node (.single 15) (.node (.single 66) (.single 92)))) (.node (.node (.single 41) (.node (.single 16) (.single 70))) (.node (.node (.single 91) (.single 37)) (.node (.single 20) (.single 71))))) (.node (.node (.node (.single 87) (.node (.single 36) (.single 17))) (.node (.node (.single 67) (.single 90)) (.node (.single 40) (.single 18)))) (.node (.node (.single 68) (.node (.single 89) (.single 39))) (.node (.node (.single 19) (.single 69)) (.node (.single 88) (.single 38))))))))
def sourceData10 : FiniteInputTree ℕ 108 := (.node (.node (.node (.node (.node (.node (.single 4) (.node (.single 8) (.single 12))) (.node (.single 16) (.node (.single 0) (.single 52)))) (.node (.node (.single 56) (.node (.single 60) (.single 64))) (.node (.node (.single 20) (.single 68)) (.node (.single 72) (.single 76))))) (.node (.node (.node (.single 80) (.node (.single 44) (.single 84))) (.node (.node (.single 88) (.single 96)) (.node (.single 100) (.single 104)))) (.node (.node (.single 92) (.node (.single 48) (.single 24))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.single 40)))))) (.node (.node (.node (.node (.single 43) (.node (.single 35) (.single 39))) (.node (.single 31) (.node (.single 3) (.single 27)))) (.node (.node (.single 23) (.node (.single 51) (.single 47))) (.node (.node (.single 95) (.single 91)) (.node (.single 107) (.single 103))))) (.node (.node (.node (.single 99) (.node (.single 87) (.single 83))) (.node (.node (.single 75) (.single 79)) (.node (.single 71) (.single 67)))) (.node (.node (.single 59) (.node (.single 63) (.single 55))) (.node (.node (.single 19) (.single 11)) (.node (.single 15) (.single 7))))))) (.node (.node (.node (.node (.node (.single 5) (.node (.single 13) (.single 9))) (.node (.single 17) (.node (.single 53) (.single 61)))) (.node (.node (.single 57) (.node (.single 65) (.single 69))) (.node (.node (.single 77) (.single 73)) (.node (.single 81) (.single 85))))) (.node (.node (.node (.single 97) (.node (.single 101) (.single 105))) (.node (.node (.single 89) (.single 93)) (.node (.single 45) (.single 49)))) (.node (.node (.single 21) (.node (.single 25) (.single 1))) (.node (.node (.single 29) (.single 37)) (.node (.single 33) (.single 41)))))) (.node (.node (.node (.node (.single 42) (.node (.single 38) (.single 34))) (.node (.single 30) (.node (.single 26) (.single 50)))) (.node (.node (.single 94) (.node (.single 106) (.single 102))) (.node (.node (.single 98) (.single 90)) (.node (.single 86) (.single 46))))) (.node (.node (.node (.single 82) (.node (.single 78) (.single 74))) (.node (.node (.single 70) (.single 22)) (.node (.single 66) (.single 62)))) (.node (.node (.single 58) (.node (.single 54) (.single 2))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.single 6))))))))
def cover10 (i : Fin 108) : Fin 108 := ⟨coverData10.get i % 108, Nat.mod_lt _ (by decide)⟩
def source10 (i : Fin 108) : Fin 108 := ⟨sourceData10.get i % 108, Nat.mod_lt _ (by decide)⟩
def tree10 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 (.cutX 5120 (.cutY 17408 .empty (.cutX 4608 .empty (.cutY 17920 (.cutX 4864 (.cutY 17664 (.cutX 4736 (.cutY 17536 (.cutX 4672 (.cutY 17472 .full .full) (.cutY 17472 .full .full)) .full) (.cutY 17536 (.cutX 4800 (.cutY 17472 (.cutX 4768 (.cutY 17440 .full .full) (.cutY 17440 .full .full)) .full) (.cutY 17472 (.cutX 4832 (.cutY 17440 (.cutX 4816 (.cutY 17424 .full .full) (.cutY 17424 .full .full)) .full) (.cutY 17440 (.cutX 4848 (.cutY 17424 .full .full) (.cutY 17424 (.cutX 4856 (.cutY 17416 .full .full) (.cutY 17416 .empty .full)) .full)) .full)) .full)) (.cutX 4800 (.cutY 17600 .full .full) (.cutY 17600 .full .full)))) .empty) .empty) .empty))) .empty) .empty) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 .empty (.cutX 15360 (.cutY 27648 .empty (.cutX 14848 .empty (.cutY 28160 (.cutX 15104 .empty (.cutY 27904 .empty (.cutX 15232 (.cutY 28032 (.cutX 15168 (.cutY 27968 .full .full) (.cutY 27968 .full .full)) .full) (.cutY 28032 (.cutX 15296 (.cutY 27968 .full .full) (.cutY 27968 (.cutX 15328 (.cutY 27936 .full .full) (.cutY 27936 (.cutX 15344 (.cutY 27920 .full .full) (.cutY 27920 (.cutX 15352 (.cutY 27912 .full .full) (.cutY 27912 .empty .full)) .full)) (.cutX 15344 (.cutY 27952 .full .full) (.cutY 27952 .full .full)))) (.cutX 15328 (.cutY 28000 .full .full) (.cutY 28000 .full .full)))) (.cutX 15296 (.cutY 28096 .full .full) (.cutY 28096 .full .full)))))) .empty))) .empty))) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 (.cutX 17408 .empty (.cutY 5120 (.cutX 17920 (.cutY 4608 .empty (.cutX 17664 (.cutY 4864 (.cutX 17536 (.cutY 4736 (.cutX 17472 (.cutY 4672 .full .full) (.cutY 4672 .full .full)) (.cutX 17472 (.cutY 4800 (.cutX 17440 (.cutY 4768 .full .full) (.cutY 4768 .full .full)) (.cutX 17440 (.cutY 4832 (.cutX 17424 (.cutY 4816 .full .full) (.cutY 4816 .full .full)) (.cutX 17424 (.cutY 4848 .full (.cutX 17416 (.cutY 4856 .full .empty) (.cutY 4856 .full .full))) (.cutY 4848 .full .full))) (.cutY 4832 .full .full))) (.cutY 4800 .full .full))) (.cutY 4736 .full (.cutX 17600 (.cutY 4800 .full .full) (.cutY 4800 .full .full)))) .empty) .empty)) .empty) .empty)) .empty) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 .empty (.cutX 27648 .empty (.cutY 15360 (.cutX 28160 (.cutY 14848 .empty (.cutX 27904 .empty (.cutY 15104 .empty (.cutX 28032 (.cutY 15232 (.cutX 27968 (.cutY 15168 .full .full) (.cutY 15168 .full .full)) (.cutX 27968 (.cutY 15296 .full (.cutX 27936 (.cutY 15328 .full (.cutX 27920 (.cutY 15344 .full (.cutX 27912 (.cutY 15352 .full .empty) (.cutY 15352 .full .full))) (.cutY 15344 .full .full))) (.cutY 15328 .full (.cutX 27952 (.cutY 15344 .full .full) (.cutY 15344 .full .full))))) (.cutY 15296 .full (.cutX 28000 (.cutY 15328 .full .full) (.cutY 15328 .full .full))))) (.cutY 15232 .full (.cutX 28096 (.cutY 15296 .full .full) (.cutY 15296 .full .full))))))) .empty) .empty))))) .empty))) .empty))

theorem metadata10 : 0<135260814 ∧ 18<128 ∧ 68<128 ∧ 1<4 ∧
    6208/4160=1 ∧ 6208%4160=2048 ∧ ∀ i, (leaves10 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData10).mp
    (by decide +kernel)

theorem sourceChecked10_0 : ∀ i : Fin 64,
    (fun i => output10 i = raw10 (source10 i)) (finOffset 108 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked10_64 : ∀ i : Fin 44,
    (fun i => output10 i = raw10 (source10 i)) (finOffset 108 64 44 (by decide) i) := by decide +kernel

theorem sourceChecked10 : ∀ i : Fin 108, (fun i => output10 i = raw10 (source10 i)) i :=
  forallFin_of_zero_offset (fun i => output10 i = raw10 (source10 i)) (forallFinOffset_add (fun i => output10 i = raw10 (source10 i)) 0 64 44 (by decide) sourceChecked10_0
    sourceChecked10_64)

theorem coverChecked10_0 : ∀ i : Fin 64,
    (fun i => (output10 (cover10 i)).ContainsBox (raw10 i)) (finOffset 108 0 64 (by decide) i) := by decide +kernel

theorem coverChecked10_64 : ∀ i : Fin 44,
    (fun i => (output10 (cover10 i)).ContainsBox (raw10 i)) (finOffset 108 64 44 (by decide) i) := by decide +kernel

theorem coverChecked10 : ∀ i : Fin 108, (fun i => (output10 (cover10 i)).ContainsBox (raw10 i)) i :=
  forallFin_of_zero_offset (fun i => (output10 (cover10 i)).ContainsBox (raw10 i)) (forallFinOffset_add (fun i => (output10 (cover10 i)).ContainsBox (raw10 i)) 0 64 44 (by decide) coverChecked10_0
    coverChecked10_64)

theorem treeChecked10 : tree10.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves10 : List.ofFn output10 = tree10.leaves ⟨0,32768,0,32768⟩ := by
  unfold output10
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked10 : gridTreeUnionCheck 32768 raw10 output10 cover10 source10 tree10 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked10, coverChecked10, treeChecked10, treeLeaves10⟩

theorem areaUnits10 : gridUnionAreaUnits output10 = 261888 := by decide +kernel

noncomputable def phaseMass10 : ℝ := singlePhaseMass (135260814/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw10 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass10_eq : phaseMass10 = (69185906361/838860800000000 : ℝ) := by
  unfold phaseMass10
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw10 output10 cover10 source10
    (gridTreeUnionCheck_sound 32768 raw10 output10 cover10 source10 tree10 checked10)
    _ (by norm_num) _, areaUnits10]
  norm_num

-- Frozen phase 5358, atom 6647, type 1, source (23,72).
def leavesData11 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩)))) (.node (.node (.node (.single ⟨2,1,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.single ⟨3,7,1⟩))) (.node (.node (.single ⟨4,14,0⟩) (.single ⟨4,14,1⟩)) (.node (.single ⟨4,15,0⟩) (.single ⟨4,15,1⟩)))))
def leaves11 : Fin 16 → DyadicLeaf := leavesData11.get
def raw11 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 23 72 leaves11 i
def outputData11 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨5888,5952,18432,18496⟩) (.single ⟨5888,5952,18496,18560⟩)) (.node (.single ⟨5952,6016,18432,18496⟩) (.single ⟨5952,6016,18496,18560⟩))) (.node (.node (.single ⟨5888,6016,18560,18688⟩) (.single ⟨6016,6080,18432,18496⟩)) (.node (.single ⟨6016,6080,18496,18560⟩) (.single ⟨6080,6112,18432,18464⟩)))) (.node (.node (.node (.single ⟨6080,6112,18464,18496⟩) (.single ⟨6112,6128,18432,18448⟩)) (.node (.single ⟨6112,6128,18448,18464⟩) (.single ⟨6128,6144,18432,18448⟩))) (.node (.node (.single ⟨6128,6144,18448,18464⟩) (.single ⟨6112,6144,18464,18496⟩)) (.node (.single ⟨6080,6144,18496,18560⟩) (.single ⟨6016,6144,18560,18688⟩))))) (.node (.node (.node (.node (.single ⟨14080,14208,26624,26752⟩) (.single ⟨14080,14208,26752,26880⟩)) (.node (.single ⟨14208,14272,26624,26688⟩) (.single ⟨14208,14272,26688,26752⟩))) (.node (.node (.single ⟨14272,14304,26624,26656⟩) (.single ⟨14272,14304,26656,26688⟩)) (.node (.single ⟨14304,14320,26624,26640⟩) (.single ⟨14304,14320,26640,26656⟩)))) (.node (.node (.node (.single ⟨14320,14336,26624,26640⟩) (.single ⟨14320,14336,26640,26656⟩)) (.node (.single ⟨14304,14336,26656,26688⟩) (.single ⟨14272,14336,26688,26752⟩))) (.node (.node (.single ⟨14208,14272,26752,26816⟩) (.single ⟨14208,14272,26816,26880⟩)) (.node (.single ⟨14272,14336,26752,26816⟩) (.single ⟨14272,14336,26816,26880⟩)))))) (.node (.node (.node (.node (.node (.single ⟨18432,18496,5888,5952⟩) (.single ⟨18432,18496,5952,6016⟩)) (.node (.single ⟨18496,18560,5888,5952⟩) (.single ⟨18496,18560,5952,6016⟩))) (.node (.node (.single ⟨18432,18496,6016,6080⟩) (.single ⟨18432,18464,6080,6112⟩)) (.node (.single ⟨18432,18448,6112,6128⟩) (.single ⟨18432,18448,6128,6144⟩)))) (.node (.node (.node (.single ⟨18448,18464,6112,6128⟩) (.single ⟨18448,18464,6128,6144⟩)) (.node (.single ⟨18464,18496,6080,6112⟩) (.single ⟨18464,18496,6112,6144⟩))) (.node (.node (.single ⟨18496,18560,6016,6080⟩) (.single ⟨18496,18560,6080,6144⟩)) (.node (.single ⟨18560,18688,5888,6016⟩) (.single ⟨18560,18688,6016,6144⟩))))) (.node (.node (.node (.node (.single ⟨26624,26752,14080,14208⟩) (.single ⟨26624,26688,14208,14272⟩)) (.node (.single ⟨26624,26656,14272,14304⟩) (.single ⟨26624,26640,14304,14320⟩))) (.node (.node (.single ⟨26624,26640,14320,14336⟩) (.single ⟨26640,26656,14304,14320⟩)) (.node (.single ⟨26640,26656,14320,14336⟩) (.single ⟨26656,26688,14272,14304⟩)))) (.node (.node (.node (.single ⟨26656,26688,14304,14336⟩) (.single ⟨26688,26752,14208,14272⟩)) (.node (.single ⟨26688,26752,14272,14336⟩) (.single ⟨26752,26880,14080,14208⟩))) (.node (.node (.single ⟨26752,26816,14208,14272⟩) (.single ⟨26752,26816,14272,14336⟩)) (.node (.single ⟨26816,26880,14208,14272⟩) (.single ⟨26816,26880,14272,14336⟩)))))))
def output11 : Fin 64 → GridBox := outputData11.get
def coverData11 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 46)) (.node (.single 59) (.single 17))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16)))) (.node (.node (.node (.single 5) (.single 36)) (.node (.single 58) (.single 27))) (.node (.node (.single 6) (.single 44)) (.node (.single 57) (.single 19))))) (.node (.node (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18))) (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31)))) (.node (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29))) (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30)))))) (.node (.node (.node (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28))) (.node (.node (.single 7) (.single 37)) (.node (.single 56) (.single 26)))) (.node (.node (.node (.single 8) (.single 42)) (.node (.single 55) (.single 21))) (.node (.node (.single 13) (.single 43)) (.node (.single 50) (.single 20))))) (.node (.node (.node (.node (.single 9) (.single 38)) (.node (.single 54) (.single 25))) (.node (.node (.single 10) (.single 40)) (.node (.single 53) (.single 23)))) (.node (.node (.node (.single 11) (.single 39)) (.node (.single 52) (.single 24))) (.node (.node (.single 12) (.single 41)) (.node (.single 51) (.single 22)))))))
def sourceData11 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 20) (.single 24)) (.node (.single 28) (.single 32))) (.node (.node (.single 0) (.single 8)) (.node (.single 12) (.single 36)))) (.node (.node (.node (.single 40) (.single 48)) (.node (.single 52) (.single 56))) (.node (.node (.single 60) (.single 44)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.node (.single 7) (.single 3)) (.node (.single 19) (.single 15))) (.node (.node (.single 47) (.single 43)) (.node (.single 63) (.single 55)))) (.node (.node (.node (.single 59) (.single 51)) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.node (.single 21) (.single 29)) (.node (.single 25) (.single 33))) (.node (.node (.single 9) (.single 37)) (.node (.single 49) (.single 57)))) (.node (.node (.node (.single 53) (.single 61)) (.node (.single 41) (.single 45))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.node (.single 6) (.single 18)) (.node (.single 46) (.single 62))) (.node (.node (.single 58) (.single 54)) (.node (.single 50) (.single 42)))) (.node (.node (.node (.single 38) (.single 14)) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover11 (i : Fin 64) : Fin 64 := ⟨coverData11.get i % 64, Nat.mod_lt _ (by decide)⟩
def source11 (i : Fin 64) : Fin 64 := ⟨sourceData11.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree11 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 .empty (.cutX 5120 .empty (.cutY 19456 (.cutX 5632 .empty (.cutY 18944 (.cutX 5888 .empty (.cutY 18688 (.cutX 6016 (.cutY 18560 (.cutX 5952 (.cutY 18496 .full .full) (.cutY 18496 .full .full)) .full) (.cutY 18560 (.cutX 6080 (.cutY 18496 .full .full) (.cutY 18496 (.cutX 6112 (.cutY 18464 .full .full) (.cutY 18464 (.cutX 6128 (.cutY 18448 .full .full) (.cutY 18448 .full .full)) .full)) .full)) .full)) .empty)) .empty)) .empty))) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 .empty (.cutX 13312 .empty (.cutY 27648 (.cutX 13824 .empty (.cutY 27136 (.cutX 14080 .empty (.cutY 26880 (.cutX 14208 (.cutY 26752 .full .full) (.cutY 26752 (.cutX 14272 (.cutY 26688 .full .full) (.cutY 26688 (.cutX 14304 (.cutY 26656 .full .full) (.cutY 26656 (.cutX 14320 (.cutY 26640 .full .full) (.cutY 26640 .full .full)) .full)) .full)) (.cutX 14272 (.cutY 26816 .full .full) (.cutY 26816 .full .full)))) .empty)) .empty)) .empty))) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 (.cutX 19456 (.cutY 5120 .empty (.cutX 18944 (.cutY 5632 .empty (.cutX 18688 (.cutY 5888 .empty (.cutX 18560 (.cutY 6016 (.cutX 18496 (.cutY 5952 .full .full) (.cutY 5952 .full .full)) (.cutX 18496 (.cutY 6080 .full (.cutX 18464 (.cutY 6112 .full (.cutX 18448 (.cutY 6128 .full .full) (.cutY 6128 .full .full))) (.cutY 6112 .full .full))) (.cutY 6080 .full .full))) (.cutY 6016 .full .full))) .empty)) .empty)) .empty) .empty))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 (.cutX 27648 (.cutY 13312 .empty (.cutX 27136 (.cutY 13824 .empty (.cutX 26880 (.cutY 14080 .empty (.cutX 26752 (.cutY 14208 .full (.cutX 26688 (.cutY 14272 .full (.cutX 26656 (.cutY 14304 .full (.cutX 26640 (.cutY 14320 .full .full) (.cutY 14320 .full .full))) (.cutY 14304 .full .full))) (.cutY 14272 .full .full))) (.cutY 14208 .full (.cutX 26816 (.cutY 14272 .full .full) (.cutY 14272 .full .full))))) .empty)) .empty)) .empty) .empty))) .empty))) .empty))

theorem metadata11 : 0<157738472 ∧ 23<128 ∧ 72<128 ∧ 1<4 ∧
    6647/4160=1 ∧ 6647%4160=2487 ∧ ∀ i, (leaves11 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData11).mp
    (by decide +kernel)

theorem sourceChecked11_0 : ∀ i : Fin 64,
    (fun i => output11 i = raw11 (source11 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked11 : ∀ i : Fin 64, (fun i => output11 i = raw11 (source11 i)) i :=
  forallFin_of_zero_offset (fun i => output11 i = raw11 (source11 i)) sourceChecked11_0

theorem coverChecked11_0 : ∀ i : Fin 64,
    (fun i => (output11 (cover11 i)).ContainsBox (raw11 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked11 : ∀ i : Fin 64, (fun i => (output11 (cover11 i)).ContainsBox (raw11 i)) i :=
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

noncomputable def phaseMass11 : ℝ := singlePhaseMass (157738472/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw11 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass11_eq : phaseMass11 = (19717309/204800000000 : ℝ) := by
  unfold phaseMass11
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw11 output11 cover11 source11
    (gridTreeUnionCheck_sound 32768 raw11 output11 cover11 source11 tree11 checked11)
    _ (by norm_num) _, areaUnits11]
  norm_num

-- Frozen phase 5359, atom 7765, type 1, source (40,85).
def leavesData12 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,0⟩))) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves12 : Fin 13 → DyadicLeaf := leavesData12.get
def raw12 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 40 85 leaves12 i
def outputData12 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨10240,10304,21760,21824⟩) (.node (.single ⟨10240,10304,21824,21888⟩) (.single ⟨10304,10368,21760,21824⟩))) (.node (.single ⟨10304,10368,21824,21888⟩) (.node (.single ⟨10240,10368,21888,22016⟩) (.single ⟨10368,10432,21760,21824⟩)))) (.node (.node (.single ⟨10368,10432,21824,21888⟩) (.node (.single ⟨10432,10464,21760,21792⟩) (.single ⟨10432,10464,21792,21824⟩))) (.node (.node (.single ⟨10464,10496,21760,21792⟩) (.single ⟨10464,10496,21792,21824⟩)) (.node (.single ⟨10432,10496,21824,21888⟩) (.single ⟨10368,10496,21888,22016⟩))))) (.node (.node (.node (.single ⟨10752,10880,22272,22400⟩) (.node (.single ⟨10752,10880,22400,22528⟩) (.single ⟨10880,10944,22272,22336⟩))) (.node (.single ⟨10880,10944,22336,22400⟩) (.node (.single ⟨10944,10976,22272,22304⟩) (.single ⟨10944,10976,22304,22336⟩)))) (.node (.node (.single ⟨10976,11008,22272,22304⟩) (.node (.single ⟨10976,11008,22304,22336⟩) (.single ⟨10944,11008,22336,22400⟩))) (.node (.node (.single ⟨10880,10944,22400,22464⟩) (.single ⟨10880,10944,22464,22528⟩)) (.node (.single ⟨10944,11008,22400,22464⟩) (.single ⟨10944,11008,22464,22528⟩)))))) (.node (.node (.node (.node (.single ⟨21760,21824,10240,10304⟩) (.node (.single ⟨21760,21824,10304,10368⟩) (.single ⟨21824,21888,10240,10304⟩))) (.node (.single ⟨21824,21888,10304,10368⟩) (.node (.single ⟨21760,21824,10368,10432⟩) (.single ⟨21760,21792,10432,10464⟩)))) (.node (.node (.single ⟨21760,21792,10464,10496⟩) (.node (.single ⟨21792,21824,10432,10464⟩) (.single ⟨21792,21824,10464,10496⟩))) (.node (.node (.single ⟨21824,21888,10368,10432⟩) (.single ⟨21824,21888,10432,10496⟩)) (.node (.single ⟨21888,22016,10240,10368⟩) (.single ⟨21888,22016,10368,10496⟩))))) (.node (.node (.node (.single ⟨22272,22400,10752,10880⟩) (.node (.single ⟨22272,22336,10880,10944⟩) (.single ⟨22272,22304,10944,10976⟩))) (.node (.single ⟨22272,22304,10976,11008⟩) (.node (.single ⟨22304,22336,10944,10976⟩) (.single ⟨22304,22336,10976,11008⟩)))) (.node (.node (.single ⟨22336,22400,10880,10944⟩) (.node (.single ⟨22336,22400,10944,11008⟩) (.single ⟨22400,22528,10752,10880⟩))) (.node (.node (.single ⟨22400,22464,10880,10944⟩) (.single ⟨22400,22464,10944,11008⟩)) (.node (.single ⟨22464,22528,10880,10944⟩) (.single ⟨22464,22528,10944,11008⟩)))))))
def output12 : Fin 52 → GridBox := outputData12.get
def coverData12 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 0))) (.node (.node (.single 26) (.single 51)) (.node (.single 25) (.single 1))))) (.node (.node (.node (.single 28) (.node (.single 50) (.single 23))) (.node (.single 2) (.node (.single 27) (.single 49)))) (.node (.node (.single 24) (.node (.single 3) (.single 29))) (.node (.node (.single 48) (.single 22)) (.node (.single 5) (.single 30)))))) (.node (.node (.node (.node (.single 46) (.node (.single 21) (.single 6))) (.node (.single 35) (.node (.single 45) (.single 16)))) (.node (.node (.single 11) (.node (.single 36) (.single 40))) (.node (.node (.single 15) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData12 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.single 20) (.node (.single 0) (.single 24)))) (.node (.node (.single 28) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 35))) (.node (.single 31) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.node (.single 17) (.single 13))) (.node (.single 21) (.node (.single 25) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 34) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 30) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover12 (i : Fin 52) : Fin 52 := ⟨coverData12.get i % 52, Nat.mod_lt _ (by decide)⟩
def source12 (i : Fin 52) : Fin 52 := ⟨sourceData12.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree12 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 .empty (.cutY 22528 (.cutX 11264 (.cutY 21504 .empty (.cutX 10752 (.cutY 22016 (.cutX 10496 (.cutY 21760 .empty (.cutX 10368 (.cutY 21888 (.cutX 10304 (.cutY 21824 .full .full) (.cutY 21824 .full .full)) .full) (.cutY 21888 (.cutX 10432 (.cutY 21824 .full .full) (.cutY 21824 (.cutX 10464 (.cutY 21792 .full .full) (.cutY 21792 .full .full)) .full)) .full))) .empty) .empty) (.cutY 22016 .empty (.cutX 11008 (.cutY 22272 .empty (.cutX 10880 (.cutY 22400 .full .full) (.cutY 22400 (.cutX 10944 (.cutY 22336 .full .full) (.cutY 22336 (.cutX 10976 (.cutY 22304 .full .full) (.cutY 22304 .full .full)) .full)) (.cutX 10944 (.cutY 22464 .full .full) (.cutY 22464 .full .full))))) .empty)))) .empty) .empty))) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 (.cutY 10240 .empty (.cutX 21504 .empty (.cutY 11264 (.cutX 22016 (.cutY 10752 (.cutX 21760 .empty (.cutY 10496 (.cutX 21888 (.cutY 10368 (.cutX 21824 (.cutY 10304 .full .full) (.cutY 10304 .full .full)) (.cutX 21824 (.cutY 10432 .full (.cutX 21792 (.cutY 10464 .full .full) (.cutY 10464 .full .full))) (.cutY 10432 .full .full))) (.cutY 10368 .full .full)) .empty)) .empty) (.cutY 10752 .empty (.cutX 22272 .empty (.cutY 11008 (.cutX 22400 (.cutY 10880 .full (.cutX 22336 (.cutY 10944 .full (.cutX 22304 (.cutY 10976 .full .full) (.cutY 10976 .full .full))) (.cutY 10944 .full .full))) (.cutY 10880 .full (.cutX 22464 (.cutY 10944 .full .full) (.cutY 10944 .full .full)))) .empty)))) .empty))) .empty) .empty))) .empty) .empty))

theorem metadata12 : 0<56923454 ∧ 40<128 ∧ 85<128 ∧ 1<4 ∧
    7765/4160=1 ∧ 7765%4160=3605 ∧ ∀ i, (leaves12 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData12).mp
    (by decide +kernel)

theorem sourceChecked12_0 : ∀ i : Fin 52,
    (fun i => output12 i = raw12 (source12 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked12 : ∀ i : Fin 52, (fun i => output12 i = raw12 (source12 i)) i :=
  forallFin_of_zero_offset (fun i => output12 i = raw12 (source12 i)) sourceChecked12_0

theorem coverChecked12_0 : ∀ i : Fin 52,
    (fun i => (output12 (cover12 i)).ContainsBox (raw12 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked12 : ∀ i : Fin 52, (fun i => (output12 (cover12 i)).ContainsBox (raw12 i)) i :=
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

noncomputable def phaseMass12 : ℝ := singlePhaseMass (56923454/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw12 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass12_eq : phaseMass12 = (28461727/819200000000 : ℝ) := by
  unfold phaseMass12
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw12 output12 cover12 source12
    (gridTreeUnionCheck_sound 32768 raw12 output12 cover12 source12 tree12 checked12)
    _ (by norm_num) _, areaUnits12]
  norm_num

-- Frozen phase 5360, atom 4471, type 1, source (2,59).
def leavesData13 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩))) (.node (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩)))) (.node (.node (.node (.single ⟨3,4,0⟩) (.single ⟨3,4,1⟩)) (.node (.single ⟨3,5,0⟩) (.single ⟨3,5,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves13 : Fin 16 → DyadicLeaf := leavesData13.get
def raw13 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 2 59 leaves13 i
def outputData13 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨512,576,15104,15168⟩) (.single ⟨512,576,15168,15232⟩)) (.node (.single ⟨576,640,15104,15168⟩) (.single ⟨576,640,15168,15232⟩))) (.node (.node (.single ⟨512,640,15232,15360⟩) (.single ⟨640,672,15104,15136⟩)) (.node (.single ⟨640,672,15136,15168⟩) (.single ⟨672,704,15104,15136⟩)))) (.node (.node (.node (.single ⟨672,704,15136,15168⟩) (.single ⟨640,704,15168,15232⟩)) (.node (.single ⟨704,736,15104,15136⟩) (.single ⟨704,736,15136,15168⟩))) (.node (.node (.single ⟨736,768,15104,15136⟩) (.single ⟨736,768,15136,15168⟩)) (.node (.single ⟨704,768,15168,15232⟩) (.single ⟨640,768,15232,15360⟩))))) (.node (.node (.node (.node (.single ⟨15104,15168,512,576⟩) (.single ⟨15104,15168,576,640⟩)) (.node (.single ⟨15168,15232,512,576⟩) (.single ⟨15168,15232,576,640⟩))) (.node (.node (.single ⟨15104,15136,640,672⟩) (.single ⟨15104,15136,672,704⟩)) (.node (.single ⟨15136,15168,640,672⟩) (.single ⟨15136,15168,672,704⟩)))) (.node (.node (.node (.single ⟨15104,15136,704,736⟩) (.single ⟨15104,15136,736,768⟩)) (.node (.single ⟨15136,15168,704,736⟩) (.single ⟨15136,15168,736,768⟩))) (.node (.node (.single ⟨15168,15232,640,704⟩) (.single ⟨15168,15232,704,768⟩)) (.node (.single ⟨15232,15360,512,640⟩) (.single ⟨15232,15360,640,768⟩)))))) (.node (.node (.node (.node (.node (.single ⟨17408,17536,32000,32128⟩) (.single ⟨17408,17536,32128,32256⟩)) (.node (.single ⟨17536,17600,32000,32064⟩) (.single ⟨17536,17600,32064,32128⟩))) (.node (.node (.single ⟨17600,17632,32000,32032⟩) (.single ⟨17600,17632,32032,32064⟩)) (.node (.single ⟨17632,17664,32000,32032⟩) (.single ⟨17632,17664,32032,32064⟩)))) (.node (.node (.node (.single ⟨17600,17632,32064,32096⟩) (.single ⟨17600,17632,32096,32128⟩)) (.node (.single ⟨17632,17664,32064,32096⟩) (.single ⟨17632,17664,32096,32128⟩))) (.node (.node (.single ⟨17536,17600,32128,32192⟩) (.single ⟨17536,17600,32192,32256⟩)) (.node (.single ⟨17600,17664,32128,32192⟩) (.single ⟨17600,17664,32192,32256⟩))))) (.node (.node (.node (.node (.single ⟨32000,32128,17408,17536⟩) (.single ⟨32000,32064,17536,17600⟩)) (.node (.single ⟨32000,32032,17600,17632⟩) (.single ⟨32000,32032,17632,17664⟩))) (.node (.node (.single ⟨32032,32064,17600,17632⟩) (.single ⟨32032,32064,17632,17664⟩)) (.node (.single ⟨32064,32128,17536,17600⟩) (.single ⟨32064,32096,17600,17632⟩)))) (.node (.node (.node (.single ⟨32064,32096,17632,17664⟩) (.single ⟨32096,32128,17600,17632⟩)) (.node (.single ⟨32096,32128,17632,17664⟩) (.single ⟨32128,32256,17408,17536⟩))) (.node (.node (.single ⟨32128,32192,17536,17600⟩) (.single ⟨32128,32192,17600,17664⟩)) (.node (.single ⟨32192,32256,17536,17600⟩) (.single ⟨32192,32256,17600,17664⟩)))))))
def output13 : Fin 64 → GridBox := outputData13.get
def coverData13 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 30)) (.node (.single 59) (.single 33))) (.node (.node (.single 15) (.single 31)) (.node (.single 48) (.single 32)))) (.node (.node (.node (.single 0) (.single 16)) (.node (.single 63) (.single 47))) (.node (.node (.single 1) (.single 18)) (.node (.single 62) (.single 45))))) (.node (.node (.node (.node (.single 2) (.single 17)) (.node (.single 61) (.single 46))) (.node (.node (.single 3) (.single 19)) (.node (.single 60) (.single 44)))) (.node (.node (.node (.single 9) (.single 28)) (.node (.single 54) (.single 35))) (.node (.node (.single 14) (.single 29)) (.node (.single 49) (.single 34)))))) (.node (.node (.node (.node (.node (.single 5) (.single 20)) (.node (.single 58) (.single 43))) (.node (.node (.single 6) (.single 22)) (.node (.single 57) (.single 41)))) (.node (.node (.node (.single 7) (.single 21)) (.node (.single 56) (.single 42))) (.node (.node (.single 8) (.single 23)) (.node (.single 55) (.single 40))))) (.node (.node (.node (.node (.single 10) (.single 24)) (.node (.single 53) (.single 39))) (.node (.node (.single 11) (.single 26)) (.node (.single 52) (.single 37)))) (.node (.node (.node (.single 12) (.single 25)) (.node (.single 51) (.single 38))) (.node (.node (.single 13) (.single 27)) (.node (.single 50) (.single 36)))))))
def sourceData13 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.single 20))) (.node (.node (.single 0) (.single 32)) (.node (.single 36) (.single 40)))) (.node (.node (.node (.single 44) (.single 24)) (.node (.single 48) (.single 52))) (.node (.node (.single 56) (.single 60)) (.node (.single 28) (.single 4))))) (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.single 21))) (.node (.node (.single 33) (.single 41)) (.node (.single 37) (.single 45)))) (.node (.node (.node (.single 49) (.single 57)) (.node (.single 53) (.single 61))) (.node (.node (.single 25) (.single 29)) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.node (.single 7) (.single 3)) (.node (.single 31) (.single 27))) (.node (.node (.single 63) (.single 55)) (.node (.single 59) (.single 51)))) (.node (.node (.node (.single 47) (.single 39)) (.node (.single 43) (.single 35))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11))))) (.node (.node (.node (.node (.single 6) (.single 30)) (.node (.single 62) (.single 58))) (.node (.node (.single 54) (.single 50)) (.node (.single 26) (.single 46)))) (.node (.node (.node (.single 42) (.single 38)) (.node (.single 34) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover13 (i : Fin 64) : Fin 64 := ⟨coverData13.get i % 64, Nat.mod_lt _ (by decide)⟩
def source13 (i : Fin 64) : Fin 64 := ⟨sourceData13.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree13 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 .empty (.cutX 1024 (.cutY 15360 (.cutX 512 .empty (.cutY 14848 .empty (.cutX 768 (.cutY 15104 .empty (.cutX 640 (.cutY 15232 (.cutX 576 (.cutY 15168 .full .full) (.cutY 15168 .full .full)) .full) (.cutY 15232 (.cutX 704 (.cutY 15168 (.cutX 672 (.cutY 15136 .full .full) (.cutY 15136 .full .full)) .full) (.cutY 15168 (.cutX 736 (.cutY 15136 .full .full) (.cutY 15136 .full .full)) .full)) .full))) .empty))) .empty) .empty)) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 (.cutX 15360 (.cutY 1024 (.cutX 14848 .empty (.cutY 512 .empty (.cutX 15104 .empty (.cutY 768 (.cutX 15232 (.cutY 640 (.cutX 15168 (.cutY 576 .full .full) (.cutY 576 .full .full)) (.cutX 15168 (.cutY 704 (.cutX 15136 (.cutY 672 .full .full) (.cutY 672 .full .full)) (.cutX 15136 (.cutY 736 .full .full) (.cutY 736 .full .full))) (.cutY 704 .full .full))) (.cutY 640 .full .full)) .empty)))) .empty) .empty) .empty)) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 .empty (.cutX 17408 .empty (.cutY 31744 .empty (.cutX 17920 (.cutY 32256 (.cutX 17664 (.cutY 32000 .empty (.cutX 17536 (.cutY 32128 .full .full) (.cutY 32128 (.cutX 17600 (.cutY 32064 .full .full) (.cutY 32064 (.cutX 17632 (.cutY 32032 .full .full) (.cutY 32032 .full .full)) (.cutX 17632 (.cutY 32096 .full .full) (.cutY 32096 .full .full)))) (.cutX 17600 (.cutY 32192 .full .full) (.cutY 32192 .full .full))))) .empty) .empty) .empty)))) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 (.cutX 31744 .empty (.cutY 17408 .empty (.cutX 32256 (.cutY 17920 (.cutX 32000 .empty (.cutY 17664 (.cutX 32128 (.cutY 17536 .full (.cutX 32064 (.cutY 17600 .full (.cutX 32032 (.cutY 17632 .full .full) (.cutY 17632 .full .full))) (.cutY 17600 .full (.cutX 32096 (.cutY 17632 .full .full) (.cutY 17632 .full .full))))) (.cutY 17536 .full (.cutX 32192 (.cutY 17600 .full .full) (.cutY 17600 .full .full)))) .empty)) .empty) .empty))) .empty)) .empty)) .empty))))

theorem metadata13 : 0<169648215 ∧ 2<128 ∧ 59<128 ∧ 1<4 ∧
    4471/4160=1 ∧ 4471%4160=311 ∧ ∀ i, (leaves13 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData13).mp
    (by decide +kernel)

theorem sourceChecked13_0 : ∀ i : Fin 64,
    (fun i => output13 i = raw13 (source13 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked13 : ∀ i : Fin 64, (fun i => output13 i = raw13 (source13 i)) i :=
  forallFin_of_zero_offset (fun i => output13 i = raw13 (source13 i)) sourceChecked13_0

theorem coverChecked13_0 : ∀ i : Fin 64,
    (fun i => (output13 (cover13 i)).ContainsBox (raw13 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked13 : ∀ i : Fin 64, (fun i => (output13 (cover13 i)).ContainsBox (raw13 i)) i :=
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

noncomputable def phaseMass13 : ℝ := singlePhaseMass (169648215/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw13 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass13_eq : phaseMass13 = (33929643/327680000000 : ℝ) := by
  unfold phaseMass13
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw13 output13 cover13 source13
    (gridTreeUnionCheck_sound 32768 raw13 output13 cover13 source13 tree13 checked13)
    _ (by norm_num) _, areaUnits13]
  norm_num

-- Frozen phase 5361, atom 5821, type 1, source (14,65).
def leavesData14 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves14 : Fin 13 → DyadicLeaf := leavesData14.get
def raw14 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 14 65 leaves14 i
def outputData14 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨3584,3648,16640,16704⟩) (.node (.single ⟨3584,3648,16704,16768⟩) (.single ⟨3648,3712,16640,16704⟩))) (.node (.single ⟨3648,3712,16704,16768⟩) (.node (.single ⟨3584,3712,16768,16896⟩) (.single ⟨3712,3776,16640,16704⟩)))) (.node (.node (.single ⟨3712,3776,16704,16768⟩) (.node (.single ⟨3776,3808,16640,16672⟩) (.single ⟨3776,3808,16672,16704⟩))) (.node (.node (.single ⟨3808,3840,16640,16672⟩) (.single ⟨3808,3840,16672,16704⟩)) (.node (.single ⟨3776,3840,16704,16768⟩) (.single ⟨3712,3840,16768,16896⟩))))) (.node (.node (.node (.single ⟨15872,16000,28928,29056⟩) (.node (.single ⟨15872,16000,29056,29184⟩) (.single ⟨16000,16064,28928,28992⟩))) (.node (.single ⟨16000,16064,28992,29056⟩) (.node (.single ⟨16064,16096,28928,28960⟩) (.single ⟨16064,16096,28960,28992⟩)))) (.node (.node (.single ⟨16096,16128,28928,28960⟩) (.node (.single ⟨16096,16128,28960,28992⟩) (.single ⟨16064,16128,28992,29056⟩))) (.node (.node (.single ⟨16000,16064,29056,29120⟩) (.single ⟨16000,16064,29120,29184⟩)) (.node (.single ⟨16064,16128,29056,29120⟩) (.single ⟨16064,16128,29120,29184⟩)))))) (.node (.node (.node (.node (.single ⟨16640,16704,3584,3648⟩) (.node (.single ⟨16640,16704,3648,3712⟩) (.single ⟨16704,16768,3584,3648⟩))) (.node (.single ⟨16704,16768,3648,3712⟩) (.node (.single ⟨16640,16704,3712,3776⟩) (.single ⟨16640,16672,3776,3808⟩)))) (.node (.node (.single ⟨16640,16672,3808,3840⟩) (.node (.single ⟨16672,16704,3776,3808⟩) (.single ⟨16672,16704,3808,3840⟩))) (.node (.node (.single ⟨16704,16768,3712,3776⟩) (.single ⟨16704,16768,3776,3840⟩)) (.node (.single ⟨16768,16896,3584,3712⟩) (.single ⟨16768,16896,3712,3840⟩))))) (.node (.node (.node (.single ⟨28928,29056,15872,16000⟩) (.node (.single ⟨28928,28992,16000,16064⟩) (.single ⟨28928,28960,16064,16096⟩))) (.node (.single ⟨28928,28960,16096,16128⟩) (.node (.single ⟨28960,28992,16064,16096⟩) (.single ⟨28960,28992,16096,16128⟩)))) (.node (.node (.single ⟨28992,29056,16000,16064⟩) (.node (.single ⟨28992,29056,16064,16128⟩) (.single ⟨29056,29184,15872,16000⟩))) (.node (.node (.single ⟨29056,29120,16000,16064⟩) (.single ⟨29056,29120,16064,16128⟩)) (.node (.single ⟨29120,29184,16000,16064⟩) (.single ⟨29120,29184,16064,16128⟩)))))))
def output14 : Fin 52 → GridBox := outputData14.get
def coverData14 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData14 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover14 (i : Fin 52) : Fin 52 := ⟨coverData14.get i % 52, Nat.mod_lt _ (by decide)⟩
def source14 (i : Fin 52) : Fin 52 := ⟨sourceData14.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree14 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 (.cutX 3072 .empty (.cutY 17408 (.cutX 3584 .empty (.cutY 16896 (.cutX 3840 (.cutY 16640 .empty (.cutX 3712 (.cutY 16768 (.cutX 3648 (.cutY 16704 .full .full) (.cutY 16704 .full .full)) .full) (.cutY 16768 (.cutX 3776 (.cutY 16704 .full .full) (.cutY 16704 (.cutX 3808 (.cutY 16672 .full .full) (.cutY 16672 .full .full)) .full)) .full))) .empty) .empty)) .empty)) .empty)) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 (.cutX 15360 .empty (.cutY 29696 (.cutX 15872 .empty (.cutY 29184 (.cutX 16128 (.cutY 28928 .empty (.cutX 16000 (.cutY 29056 .full .full) (.cutY 29056 (.cutX 16064 (.cutY 28992 .full .full) (.cutY 28992 (.cutX 16096 (.cutY 28960 .full .full) (.cutY 28960 .full .full)) .full)) (.cutX 16064 (.cutY 29120 .full .full) (.cutY 29120 .full .full))))) .empty) .empty)) .empty)) .empty))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 .empty (.cutX 17408 (.cutY 3072 .empty (.cutX 16896 (.cutY 3584 .empty (.cutX 16640 .empty (.cutY 3840 (.cutX 16768 (.cutY 3712 (.cutX 16704 (.cutY 3648 .full .full) (.cutY 3648 .full .full)) (.cutX 16704 (.cutY 3776 .full (.cutX 16672 (.cutY 3808 .full .full) (.cutY 3808 .full .full))) (.cutY 3776 .full .full))) (.cutY 3712 .full .full)) .empty))) .empty)) .empty)) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 .empty (.cutX 29696 (.cutY 15360 .empty (.cutX 29184 (.cutY 15872 .empty (.cutX 28928 .empty (.cutY 16128 (.cutX 29056 (.cutY 16000 .full (.cutX 28992 (.cutY 16064 .full (.cutX 28960 (.cutY 16096 .full .full) (.cutY 16096 .full .full))) (.cutY 16064 .full .full))) (.cutY 16000 .full (.cutX 29120 (.cutY 16064 .full .full) (.cutY 16064 .full .full)))) .empty))) .empty)) .empty)) .empty))))) .empty))

theorem metadata14 : 0<135229957 ∧ 14<128 ∧ 65<128 ∧ 1<4 ∧
    5821/4160=1 ∧ 5821%4160=1661 ∧ ∀ i, (leaves14 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData14).mp
    (by decide +kernel)

theorem sourceChecked14_0 : ∀ i : Fin 52,
    (fun i => output14 i = raw14 (source14 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked14 : ∀ i : Fin 52, (fun i => output14 i = raw14 (source14 i)) i :=
  forallFin_of_zero_offset (fun i => output14 i = raw14 (source14 i)) sourceChecked14_0

theorem coverChecked14_0 : ∀ i : Fin 52,
    (fun i => (output14 (cover14 i)).ContainsBox (raw14 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked14 : ∀ i : Fin 52, (fun i => (output14 (cover14 i)).ContainsBox (raw14 i)) i :=
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

noncomputable def phaseMass14 : ℝ := singlePhaseMass (135229957/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw14 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass14_eq : phaseMass14 = (135229957/1638400000000 : ℝ) := by
  unfold phaseMass14
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw14 output14 cover14 source14
    (gridTreeUnionCheck_sound 32768 raw14 output14 cover14 source14 tree14 checked14)
    _ (by norm_num) _, areaUnits14]
  norm_num

-- Frozen phase 5362, atom 7555, type 1, source (36,83).
def leavesData15 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves15 : Fin 7 → DyadicLeaf := leavesData15.get
def raw15 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 36 83 leaves15 i
def outputData15 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨9216,9344,21248,21376⟩) (.node (.single ⟨9216,9344,21376,21504⟩) (.single ⟨9344,9408,21248,21312⟩))) (.node (.node (.single ⟨9344,9408,21312,21376⟩) (.single ⟨9408,9472,21248,21312⟩)) (.node (.single ⟨9408,9472,21312,21376⟩) (.single ⟨9344,9472,21376,21504⟩)))) (.node (.node (.single ⟨11264,11392,23296,23424⟩) (.node (.single ⟨11264,11392,23424,23552⟩) (.single ⟨11392,11456,23296,23360⟩))) (.node (.node (.single ⟨11392,11456,23360,23424⟩) (.single ⟨11456,11520,23296,23360⟩)) (.node (.single ⟨11456,11520,23360,23424⟩) (.single ⟨11392,11520,23424,23552⟩))))) (.node (.node (.node (.single ⟨21248,21376,9216,9344⟩) (.node (.single ⟨21248,21312,9344,9408⟩) (.single ⟨21248,21312,9408,9472⟩))) (.node (.node (.single ⟨21312,21376,9344,9408⟩) (.single ⟨21312,21376,9408,9472⟩)) (.node (.single ⟨21376,21504,9216,9344⟩) (.single ⟨21376,21504,9344,9472⟩)))) (.node (.node (.single ⟨23296,23424,11264,11392⟩) (.node (.single ⟨23296,23360,11392,11456⟩) (.single ⟨23296,23360,11456,11520⟩))) (.node (.node (.single ⟨23360,23424,11392,11456⟩) (.single ⟨23360,23424,11456,11520⟩)) (.node (.single ⟨23424,23552,11264,11392⟩) (.single ⟨23424,23552,11392,11520⟩))))))
def output15 : Fin 28 → GridBox := outputData15.get
def coverData15 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData15 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover15 (i : Fin 28) : Fin 28 := ⟨coverData15.get i % 28, Nat.mod_lt _ (by decide)⟩
def source15 (i : Fin 28) : Fin 28 := ⟨sourceData15.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree15 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 (.cutX 9216 .empty (.cutY 21504 (.cutX 9728 (.cutY 20992 .empty (.cutX 9472 (.cutY 21248 .empty (.cutX 9344 (.cutY 21376 .full .full) (.cutY 21376 (.cutX 9408 (.cutY 21312 .full .full) (.cutY 21312 .full .full)) .full))) .empty)) .empty) .empty)) .empty) (.cutY 22528 .empty (.cutX 11264 .empty (.cutY 23552 (.cutX 11776 (.cutY 23040 .empty (.cutX 11520 (.cutY 23296 .empty (.cutX 11392 (.cutY 23424 .full .full) (.cutY 23424 (.cutX 11456 (.cutY 23360 .full .full) (.cutY 23360 .full .full)) .full))) .empty)) .empty) .empty))))) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 (.cutY 10240 (.cutX 21504 (.cutY 9216 .empty (.cutX 20992 .empty (.cutY 9728 (.cutX 21248 .empty (.cutY 9472 (.cutX 21376 (.cutY 9344 .full (.cutX 21312 (.cutY 9408 .full .full) (.cutY 9408 .full .full))) (.cutY 9344 .full .full)) .empty)) .empty))) .empty) .empty) (.cutY 10240 .empty (.cutX 23552 (.cutY 11264 .empty (.cutX 23040 .empty (.cutY 11776 (.cutX 23296 .empty (.cutY 11520 (.cutX 23424 (.cutY 11392 .full (.cutX 23360 (.cutY 11456 .full .full) (.cutY 11456 .full .full))) (.cutY 11392 .full .full)) .empty)) .empty))) .empty))) .empty))) .empty) .empty))

theorem metadata15 : 0<156512574 ∧ 36<128 ∧ 83<128 ∧ 1<4 ∧
    7555/4160=1 ∧ 7555%4160=3395 ∧ ∀ i, (leaves15 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData15).mp
    (by decide +kernel)

theorem sourceChecked15_0 : ∀ i : Fin 28,
    (fun i => output15 i = raw15 (source15 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked15 : ∀ i : Fin 28, (fun i => output15 i = raw15 (source15 i)) i :=
  forallFin_of_zero_offset (fun i => output15 i = raw15 (source15 i)) sourceChecked15_0

theorem coverChecked15_0 : ∀ i : Fin 28,
    (fun i => (output15 (cover15 i)).ContainsBox (raw15 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked15 : ∀ i : Fin 28, (fun i => (output15 (cover15 i)).ContainsBox (raw15 i)) i :=
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

noncomputable def phaseMass15 : ℝ := singlePhaseMass (156512574/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw15 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass15_eq : phaseMass15 = (78256287/819200000000 : ℝ) := by
  unfold phaseMass15
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw15 output15 cover15 source15
    (gridTreeUnionCheck_sound 32768 raw15 output15 cover15 source15 tree15 checked15)
    _ (by norm_num) _, areaUnits15]
  norm_num

-- Frozen phase 5363, atom 2144, type 0, source (19,73).
def leavesData16 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves16 : Fin 7 → DyadicLeaf := leavesData16.get
def raw16 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 19 73 leaves16 i
def outputData16 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨4864,4992,18688,18816⟩) (.node (.single ⟨4864,4992,18816,18944⟩) (.single ⟨4992,5056,18688,18752⟩))) (.node (.node (.single ⟨4992,5056,18752,18816⟩) (.single ⟨5056,5120,18688,18752⟩)) (.node (.single ⟨5056,5120,18752,18816⟩) (.single ⟨4992,5120,18816,18944⟩)))) (.node (.node (.single ⟨13824,13952,27648,27776⟩) (.node (.single ⟨13824,13952,27776,27904⟩) (.single ⟨13952,14016,27648,27712⟩))) (.node (.node (.single ⟨13952,14016,27712,27776⟩) (.single ⟨14016,14080,27648,27712⟩)) (.node (.single ⟨14016,14080,27712,27776⟩) (.single ⟨13952,14080,27776,27904⟩))))) (.node (.node (.node (.single ⟨18688,18816,4864,4992⟩) (.node (.single ⟨18688,18752,4992,5056⟩) (.single ⟨18688,18752,5056,5120⟩))) (.node (.node (.single ⟨18752,18816,4992,5056⟩) (.single ⟨18752,18816,5056,5120⟩)) (.node (.single ⟨18816,18944,4864,4992⟩) (.single ⟨18816,18944,4992,5120⟩)))) (.node (.node (.single ⟨27648,27776,13824,13952⟩) (.node (.single ⟨27648,27712,13952,14016⟩) (.single ⟨27648,27712,14016,14080⟩))) (.node (.node (.single ⟨27712,27776,13952,14016⟩) (.single ⟨27712,27776,14016,14080⟩)) (.node (.single ⟨27776,27904,13824,13952⟩) (.single ⟨27776,27904,13952,14080⟩))))))
def output16 : Fin 28 → GridBox := outputData16.get
def coverData16 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData16 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover16 (i : Fin 28) : Fin 28 := ⟨coverData16.get i % 28, Nat.mod_lt _ (by decide)⟩
def source16 (i : Fin 28) : Fin 28 := ⟨sourceData16.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree16 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 .empty (.cutX 5120 (.cutY 19456 (.cutX 4608 .empty (.cutY 18944 (.cutX 4864 .empty (.cutY 18688 .empty (.cutX 4992 (.cutY 18816 .full .full) (.cutY 18816 (.cutX 5056 (.cutY 18752 .full .full) (.cutY 18752 .full .full)) .full)))) .empty)) .empty) .empty)) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 .empty (.cutX 13312 .empty (.cutY 27648 .empty (.cutX 13824 .empty (.cutY 28160 (.cutX 14080 (.cutY 27904 (.cutX 13952 (.cutY 27776 .full .full) (.cutY 27776 (.cutX 14016 (.cutY 27712 .full .full) (.cutY 27712 .full .full)) .full)) .empty) .empty) .empty))))) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 (.cutX 19456 (.cutY 5120 (.cutX 18944 (.cutY 4608 .empty (.cutX 18688 .empty (.cutY 4864 .empty (.cutX 18816 (.cutY 4992 .full (.cutX 18752 (.cutY 5056 .full .full) (.cutY 5056 .full .full))) (.cutY 4992 .full .full))))) .empty) .empty) .empty) .empty))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 (.cutX 27648 .empty (.cutY 13312 .empty (.cutX 28160 (.cutY 13824 .empty (.cutX 27904 (.cutY 14080 (.cutX 27776 (.cutY 13952 .full (.cutX 27712 (.cutY 14016 .full .full) (.cutY 14016 .full .full))) (.cutY 13952 .full .full)) .empty) .empty)) .empty))) .empty))) .empty))) .empty))

theorem metadata16 : 0<147396112 ∧ 19<128 ∧ 73<128 ∧ 0<4 ∧
    2144/4160=0 ∧ 2144%4160=2144 ∧ ∀ i, (leaves16 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData16).mp
    (by decide +kernel)

theorem sourceChecked16_0 : ∀ i : Fin 28,
    (fun i => output16 i = raw16 (source16 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked16 : ∀ i : Fin 28, (fun i => output16 i = raw16 (source16 i)) i :=
  forallFin_of_zero_offset (fun i => output16 i = raw16 (source16 i)) sourceChecked16_0

theorem coverChecked16_0 : ∀ i : Fin 28,
    (fun i => (output16 (cover16 i)).ContainsBox (raw16 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked16 : ∀ i : Fin 28, (fun i => (output16 (cover16 i)).ContainsBox (raw16 i)) i :=
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

noncomputable def phaseMass16 : ℝ := singlePhaseMass (147396112/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw16 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass16_eq : phaseMass16 = (9212257/102400000000 : ℝ) := by
  unfold phaseMass16
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw16 output16 cover16 source16
    (gridTreeUnionCheck_sound 32768 raw16 output16 cover16 source16 tree16 checked16)
    _ (by norm_num) _, areaUnits16]
  norm_num

-- Frozen phase 5364, atom 6300, type 1, source (19,69).
def leavesData17 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩)))) (.node (.node (.node (.single ⟨2,1,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.single ⟨3,7,1⟩))) (.node (.node (.single ⟨4,14,0⟩) (.single ⟨4,14,1⟩)) (.node (.single ⟨4,15,0⟩) (.single ⟨4,15,1⟩)))))
def leaves17 : Fin 16 → DyadicLeaf := leavesData17.get
def raw17 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 19 69 leaves17 i
def outputData17 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨4864,4928,17664,17728⟩) (.single ⟨4864,4928,17728,17792⟩)) (.node (.single ⟨4928,4992,17664,17728⟩) (.single ⟨4928,4992,17728,17792⟩))) (.node (.node (.single ⟨4864,4992,17792,17920⟩) (.single ⟨4992,5056,17664,17728⟩)) (.node (.single ⟨4992,5056,17728,17792⟩) (.single ⟨5056,5088,17664,17696⟩)))) (.node (.node (.node (.single ⟨5056,5088,17696,17728⟩) (.single ⟨5088,5104,17664,17680⟩)) (.node (.single ⟨5088,5104,17680,17696⟩) (.single ⟨5104,5120,17664,17680⟩))) (.node (.node (.single ⟨5104,5120,17680,17696⟩) (.single ⟨5088,5120,17696,17728⟩)) (.node (.single ⟨5056,5120,17728,17792⟩) (.single ⟨4992,5120,17792,17920⟩))))) (.node (.node (.node (.node (.single ⟨14848,14976,27648,27776⟩) (.single ⟨14848,14976,27776,27904⟩)) (.node (.single ⟨14976,15040,27648,27712⟩) (.single ⟨14976,15040,27712,27776⟩))) (.node (.node (.single ⟨15040,15072,27648,27680⟩) (.single ⟨15040,15072,27680,27712⟩)) (.node (.single ⟨15072,15088,27648,27664⟩) (.single ⟨15072,15088,27664,27680⟩)))) (.node (.node (.node (.single ⟨15088,15104,27648,27664⟩) (.single ⟨15088,15104,27664,27680⟩)) (.node (.single ⟨15072,15104,27680,27712⟩) (.single ⟨15040,15104,27712,27776⟩))) (.node (.node (.single ⟨14976,15040,27776,27840⟩) (.single ⟨14976,15040,27840,27904⟩)) (.node (.single ⟨15040,15104,27776,27840⟩) (.single ⟨15040,15104,27840,27904⟩)))))) (.node (.node (.node (.node (.node (.single ⟨17664,17728,4864,4928⟩) (.single ⟨17664,17728,4928,4992⟩)) (.node (.single ⟨17728,17792,4864,4928⟩) (.single ⟨17728,17792,4928,4992⟩))) (.node (.node (.single ⟨17664,17728,4992,5056⟩) (.single ⟨17664,17696,5056,5088⟩)) (.node (.single ⟨17664,17680,5088,5104⟩) (.single ⟨17664,17680,5104,5120⟩)))) (.node (.node (.node (.single ⟨17680,17696,5088,5104⟩) (.single ⟨17680,17696,5104,5120⟩)) (.node (.single ⟨17696,17728,5056,5088⟩) (.single ⟨17696,17728,5088,5120⟩))) (.node (.node (.single ⟨17728,17792,4992,5056⟩) (.single ⟨17728,17792,5056,5120⟩)) (.node (.single ⟨17792,17920,4864,4992⟩) (.single ⟨17792,17920,4992,5120⟩))))) (.node (.node (.node (.node (.single ⟨27648,27776,14848,14976⟩) (.single ⟨27648,27712,14976,15040⟩)) (.node (.single ⟨27648,27680,15040,15072⟩) (.single ⟨27648,27664,15072,15088⟩))) (.node (.node (.single ⟨27648,27664,15088,15104⟩) (.single ⟨27664,27680,15072,15088⟩)) (.node (.single ⟨27664,27680,15088,15104⟩) (.single ⟨27680,27712,15040,15072⟩)))) (.node (.node (.node (.single ⟨27680,27712,15072,15104⟩) (.single ⟨27712,27776,14976,15040⟩)) (.node (.single ⟨27712,27776,15040,15104⟩) (.single ⟨27776,27904,14848,14976⟩))) (.node (.node (.single ⟨27776,27840,14976,15040⟩) (.single ⟨27776,27840,15040,15104⟩)) (.node (.single ⟨27840,27904,14976,15040⟩) (.single ⟨27840,27904,15040,15104⟩)))))))
def output17 : Fin 64 → GridBox := outputData17.get
def coverData17 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 46)) (.node (.single 59) (.single 17))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16)))) (.node (.node (.node (.single 5) (.single 36)) (.node (.single 58) (.single 27))) (.node (.node (.single 6) (.single 44)) (.node (.single 57) (.single 19))))) (.node (.node (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18))) (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31)))) (.node (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29))) (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30)))))) (.node (.node (.node (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28))) (.node (.node (.single 7) (.single 37)) (.node (.single 56) (.single 26)))) (.node (.node (.node (.single 8) (.single 42)) (.node (.single 55) (.single 21))) (.node (.node (.single 13) (.single 43)) (.node (.single 50) (.single 20))))) (.node (.node (.node (.node (.single 9) (.single 38)) (.node (.single 54) (.single 25))) (.node (.node (.single 10) (.single 40)) (.node (.single 53) (.single 23)))) (.node (.node (.node (.single 11) (.single 39)) (.node (.single 52) (.single 24))) (.node (.node (.single 12) (.single 41)) (.node (.single 51) (.single 22)))))))
def sourceData17 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 20) (.single 24)) (.node (.single 28) (.single 32))) (.node (.node (.single 0) (.single 8)) (.node (.single 12) (.single 36)))) (.node (.node (.node (.single 40) (.single 48)) (.node (.single 52) (.single 56))) (.node (.node (.single 60) (.single 44)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.node (.single 7) (.single 3)) (.node (.single 19) (.single 15))) (.node (.node (.single 47) (.single 43)) (.node (.single 63) (.single 55)))) (.node (.node (.node (.single 59) (.single 51)) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.node (.single 21) (.single 29)) (.node (.single 25) (.single 33))) (.node (.node (.single 9) (.single 37)) (.node (.single 49) (.single 57)))) (.node (.node (.node (.single 53) (.single 61)) (.node (.single 41) (.single 45))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.node (.single 6) (.single 18)) (.node (.single 46) (.single 62))) (.node (.node (.single 58) (.single 54)) (.node (.single 50) (.single 42)))) (.node (.node (.node (.single 38) (.single 14)) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover17 (i : Fin 64) : Fin 64 := ⟨coverData17.get i % 64, Nat.mod_lt _ (by decide)⟩
def source17 (i : Fin 64) : Fin 64 := ⟨sourceData17.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree17 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 (.cutX 5120 (.cutY 17408 .empty (.cutX 4608 .empty (.cutY 17920 (.cutX 4864 .empty (.cutY 17664 .empty (.cutX 4992 (.cutY 17792 (.cutX 4928 (.cutY 17728 .full .full) (.cutY 17728 .full .full)) .full) (.cutY 17792 (.cutX 5056 (.cutY 17728 .full .full) (.cutY 17728 (.cutX 5088 (.cutY 17696 .full .full) (.cutY 17696 (.cutX 5104 (.cutY 17680 .full .full) (.cutY 17680 .full .full)) .full)) .full)) .full)))) .empty))) .empty) .empty) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 .empty (.cutX 15360 (.cutY 27648 .empty (.cutX 14848 .empty (.cutY 28160 (.cutX 15104 (.cutY 27904 (.cutX 14976 (.cutY 27776 .full .full) (.cutY 27776 (.cutX 15040 (.cutY 27712 .full .full) (.cutY 27712 (.cutX 15072 (.cutY 27680 .full .full) (.cutY 27680 (.cutX 15088 (.cutY 27664 .full .full) (.cutY 27664 .full .full)) .full)) .full)) (.cutX 15040 (.cutY 27840 .full .full) (.cutY 27840 .full .full)))) .empty) .empty) .empty))) .empty))) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 (.cutX 17408 .empty (.cutY 5120 (.cutX 17920 (.cutY 4608 .empty (.cutX 17664 .empty (.cutY 4864 .empty (.cutX 17792 (.cutY 4992 (.cutX 17728 (.cutY 4928 .full .full) (.cutY 4928 .full .full)) (.cutX 17728 (.cutY 5056 .full (.cutX 17696 (.cutY 5088 .full (.cutX 17680 (.cutY 5104 .full .full) (.cutY 5104 .full .full))) (.cutY 5088 .full .full))) (.cutY 5056 .full .full))) (.cutY 4992 .full .full))))) .empty) .empty)) .empty) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 .empty (.cutX 27648 .empty (.cutY 15360 (.cutX 28160 (.cutY 14848 .empty (.cutX 27904 (.cutY 15104 (.cutX 27776 (.cutY 14976 .full (.cutX 27712 (.cutY 15040 .full (.cutX 27680 (.cutY 15072 .full (.cutX 27664 (.cutY 15088 .full .full) (.cutY 15088 .full .full))) (.cutY 15072 .full .full))) (.cutY 15040 .full .full))) (.cutY 14976 .full (.cutX 27840 (.cutY 15040 .full .full) (.cutY 15040 .full .full)))) .empty) .empty)) .empty) .empty))))) .empty))) .empty))

theorem metadata17 : 0<135260814 ∧ 19<128 ∧ 69<128 ∧ 1<4 ∧
    6300/4160=1 ∧ 6300%4160=2140 ∧ ∀ i, (leaves17 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData17).mp
    (by decide +kernel)

theorem sourceChecked17_0 : ∀ i : Fin 64,
    (fun i => output17 i = raw17 (source17 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked17 : ∀ i : Fin 64, (fun i => output17 i = raw17 (source17 i)) i :=
  forallFin_of_zero_offset (fun i => output17 i = raw17 (source17 i)) sourceChecked17_0

theorem coverChecked17_0 : ∀ i : Fin 64,
    (fun i => (output17 (cover17 i)).ContainsBox (raw17 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked17 : ∀ i : Fin 64, (fun i => (output17 (cover17 i)).ContainsBox (raw17 i)) i :=
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

noncomputable def phaseMass17 : ℝ := singlePhaseMass (135260814/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw17 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass17_eq : phaseMass17 = (67630407/819200000000 : ℝ) := by
  unfold phaseMass17
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw17 output17 cover17 source17
    (gridTreeUnionCheck_sound 32768 raw17 output17 cover17 source17 tree17 checked17)
    _ (by norm_num) _, areaUnits17]
  norm_num

-- Frozen phase 5365, atom 6729, type 1, source (24,73).
def leavesData18 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves18 : Fin 13 → DyadicLeaf := leavesData18.get
def raw18 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 24 73 leaves18 i
def outputData18 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨6144,6208,18688,18752⟩) (.node (.single ⟨6144,6208,18752,18816⟩) (.single ⟨6208,6272,18688,18752⟩))) (.node (.single ⟨6208,6272,18752,18816⟩) (.node (.single ⟨6144,6272,18816,18944⟩) (.single ⟨6272,6336,18688,18752⟩)))) (.node (.node (.single ⟨6272,6336,18752,18816⟩) (.node (.single ⟨6336,6368,18688,18720⟩) (.single ⟨6336,6368,18720,18752⟩))) (.node (.node (.single ⟨6368,6400,18688,18720⟩) (.single ⟨6368,6400,18720,18752⟩)) (.node (.single ⟨6336,6400,18752,18816⟩) (.single ⟨6272,6400,18816,18944⟩))))) (.node (.node (.node (.single ⟨13824,13952,26368,26496⟩) (.node (.single ⟨13824,13952,26496,26624⟩) (.single ⟨13952,14016,26368,26432⟩))) (.node (.single ⟨13952,14016,26432,26496⟩) (.node (.single ⟨14016,14048,26368,26400⟩) (.single ⟨14016,14048,26400,26432⟩)))) (.node (.node (.single ⟨14048,14080,26368,26400⟩) (.node (.single ⟨14048,14080,26400,26432⟩) (.single ⟨14016,14080,26432,26496⟩))) (.node (.node (.single ⟨13952,14016,26496,26560⟩) (.single ⟨13952,14016,26560,26624⟩)) (.node (.single ⟨14016,14080,26496,26560⟩) (.single ⟨14016,14080,26560,26624⟩)))))) (.node (.node (.node (.node (.single ⟨18688,18752,6144,6208⟩) (.node (.single ⟨18688,18752,6208,6272⟩) (.single ⟨18752,18816,6144,6208⟩))) (.node (.single ⟨18752,18816,6208,6272⟩) (.node (.single ⟨18688,18752,6272,6336⟩) (.single ⟨18688,18720,6336,6368⟩)))) (.node (.node (.single ⟨18688,18720,6368,6400⟩) (.node (.single ⟨18720,18752,6336,6368⟩) (.single ⟨18720,18752,6368,6400⟩))) (.node (.node (.single ⟨18752,18816,6272,6336⟩) (.single ⟨18752,18816,6336,6400⟩)) (.node (.single ⟨18816,18944,6144,6272⟩) (.single ⟨18816,18944,6272,6400⟩))))) (.node (.node (.node (.single ⟨26368,26496,13824,13952⟩) (.node (.single ⟨26368,26432,13952,14016⟩) (.single ⟨26368,26400,14016,14048⟩))) (.node (.single ⟨26368,26400,14048,14080⟩) (.node (.single ⟨26400,26432,14016,14048⟩) (.single ⟨26400,26432,14048,14080⟩)))) (.node (.node (.single ⟨26432,26496,13952,14016⟩) (.node (.single ⟨26432,26496,14016,14080⟩) (.single ⟨26496,26624,13824,13952⟩))) (.node (.node (.single ⟨26496,26560,13952,14016⟩) (.single ⟨26496,26560,14016,14080⟩)) (.node (.single ⟨26560,26624,13952,14016⟩) (.single ⟨26560,26624,14016,14080⟩)))))))
def output18 : Fin 52 → GridBox := outputData18.get
def coverData18 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData18 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover18 (i : Fin 52) : Fin 52 := ⟨coverData18.get i % 52, Nat.mod_lt _ (by decide)⟩
def source18 (i : Fin 52) : Fin 52 := ⟨sourceData18.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree18 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 .empty (.cutX 7168 (.cutY 19456 (.cutX 6656 (.cutY 18944 (.cutX 6400 (.cutY 18688 .empty (.cutX 6272 (.cutY 18816 (.cutX 6208 (.cutY 18752 .full .full) (.cutY 18752 .full .full)) .full) (.cutY 18816 (.cutX 6336 (.cutY 18752 .full .full) (.cutY 18752 (.cutX 6368 (.cutY 18720 .full .full) (.cutY 18720 .full .full)) .full)) .full))) .empty) .empty) .empty) .empty) .empty))) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 (.cutX 13312 .empty (.cutY 25600 .empty (.cutX 13824 .empty (.cutY 26112 .empty (.cutX 14080 (.cutY 26368 .empty (.cutX 13952 (.cutY 26496 .full .full) (.cutY 26496 (.cutX 14016 (.cutY 26432 .full .full) (.cutY 26432 (.cutX 14048 (.cutY 26400 .full .full) (.cutY 26400 .full .full)) .full)) (.cutX 14016 (.cutY 26560 .full .full) (.cutY 26560 .full .full))))) .empty))))) .empty) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 .empty (.cutX 19456 (.cutY 7168 (.cutX 18944 (.cutY 6656 (.cutX 18688 .empty (.cutY 6400 (.cutX 18816 (.cutY 6272 (.cutX 18752 (.cutY 6208 .full .full) (.cutY 6208 .full .full)) (.cutX 18752 (.cutY 6336 .full (.cutX 18720 (.cutY 6368 .full .full) (.cutY 6368 .full .full))) (.cutY 6336 .full .full))) (.cutY 6272 .full .full)) .empty)) .empty) .empty) .empty) .empty)))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 (.cutX 25600 .empty (.cutY 13312 .empty (.cutX 26112 .empty (.cutY 13824 .empty (.cutX 26368 .empty (.cutY 14080 (.cutX 26496 (.cutY 13952 .full (.cutX 26432 (.cutY 14016 .full (.cutX 26400 (.cutY 14048 .full .full) (.cutY 14048 .full .full))) (.cutY 14016 .full .full))) (.cutY 13952 .full (.cutX 26560 (.cutY 14016 .full .full) (.cutY 14016 .full .full)))) .empty)))))) .empty) .empty)) .empty))) .empty))

theorem metadata18 : 0<140060506 ∧ 24<128 ∧ 73<128 ∧ 1<4 ∧
    6729/4160=1 ∧ 6729%4160=2569 ∧ ∀ i, (leaves18 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData18).mp
    (by decide +kernel)

theorem sourceChecked18_0 : ∀ i : Fin 52,
    (fun i => output18 i = raw18 (source18 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked18 : ∀ i : Fin 52, (fun i => output18 i = raw18 (source18 i)) i :=
  forallFin_of_zero_offset (fun i => output18 i = raw18 (source18 i)) sourceChecked18_0

theorem coverChecked18_0 : ∀ i : Fin 52,
    (fun i => (output18 (cover18 i)).ContainsBox (raw18 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked18 : ∀ i : Fin 52, (fun i => (output18 (cover18 i)).ContainsBox (raw18 i)) i :=
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

noncomputable def phaseMass18 : ℝ := singlePhaseMass (140060506/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw18 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass18_eq : phaseMass18 = (70030253/819200000000 : ℝ) := by
  unfold phaseMass18
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw18 output18 cover18 source18
    (gridTreeUnionCheck_sound 32768 raw18 output18 cover18 source18 tree18 checked18)
    _ (by norm_num) _, areaUnits18]
  norm_num

-- Frozen phase 5366, atom 2573, type 0, source (24,77).
def leavesData19 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves19 : Fin 7 → DyadicLeaf := leavesData19.get
def raw19 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 24 77 leaves19 i
def outputData19 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨6144,6272,19712,19840⟩) (.node (.single ⟨6144,6272,19840,19968⟩) (.single ⟨6272,6336,19712,19776⟩))) (.node (.node (.single ⟨6272,6336,19776,19840⟩) (.single ⟨6336,6400,19712,19776⟩)) (.node (.single ⟨6336,6400,19776,19840⟩) (.single ⟨6272,6400,19840,19968⟩)))) (.node (.node (.single ⟨12800,12928,26368,26496⟩) (.node (.single ⟨12800,12928,26496,26624⟩) (.single ⟨12928,12992,26368,26432⟩))) (.node (.node (.single ⟨12928,12992,26432,26496⟩) (.single ⟨12992,13056,26368,26432⟩)) (.node (.single ⟨12992,13056,26432,26496⟩) (.single ⟨12928,13056,26496,26624⟩))))) (.node (.node (.node (.single ⟨19712,19840,6144,6272⟩) (.node (.single ⟨19712,19776,6272,6336⟩) (.single ⟨19712,19776,6336,6400⟩))) (.node (.node (.single ⟨19776,19840,6272,6336⟩) (.single ⟨19776,19840,6336,6400⟩)) (.node (.single ⟨19840,19968,6144,6272⟩) (.single ⟨19840,19968,6272,6400⟩)))) (.node (.node (.single ⟨26368,26496,12800,12928⟩) (.node (.single ⟨26368,26432,12928,12992⟩) (.single ⟨26368,26432,12992,13056⟩))) (.node (.node (.single ⟨26432,26496,12928,12992⟩) (.single ⟨26432,26496,12992,13056⟩)) (.node (.single ⟨26496,26624,12800,12928⟩) (.single ⟨26496,26624,12928,13056⟩))))))
def output19 : Fin 28 → GridBox := outputData19.get
def coverData19 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData19 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover19 (i : Fin 28) : Fin 28 := ⟨coverData19.get i % 28, Nat.mod_lt _ (by decide)⟩
def source19 (i : Fin 28) : Fin 28 := ⟨sourceData19.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree19 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 .empty (.cutX 7168 (.cutY 19456 .empty (.cutX 6656 (.cutY 19968 (.cutX 6400 (.cutY 19712 .empty (.cutX 6272 (.cutY 19840 .full .full) (.cutY 19840 (.cutX 6336 (.cutY 19776 .full .full) (.cutY 19776 .full .full)) .full))) .empty) .empty) .empty)) .empty))) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 (.cutX 13312 (.cutY 25600 .empty (.cutX 12800 .empty (.cutY 26112 .empty (.cutX 13056 (.cutY 26368 .empty (.cutX 12928 (.cutY 26496 .full .full) (.cutY 26496 (.cutX 12992 (.cutY 26432 .full .full) (.cutY 26432 .full .full)) .full))) .empty)))) .empty) .empty) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 .empty (.cutX 19456 .empty (.cutY 7168 (.cutX 19968 (.cutY 6656 (.cutX 19712 .empty (.cutY 6400 (.cutX 19840 (.cutY 6272 .full (.cutX 19776 (.cutY 6336 .full .full) (.cutY 6336 .full .full))) (.cutY 6272 .full .full)) .empty)) .empty) .empty) .empty))))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 (.cutX 25600 .empty (.cutY 13312 (.cutX 26112 .empty (.cutY 12800 .empty (.cutX 26368 .empty (.cutY 13056 (.cutX 26496 (.cutY 12928 .full (.cutX 26432 (.cutY 12992 .full .full) (.cutY 12992 .full .full))) (.cutY 12928 .full .full)) .empty)))) .empty)) .empty) .empty)) .empty))) .empty))

theorem metadata19 : 0<177866497 ∧ 24<128 ∧ 77<128 ∧ 0<4 ∧
    2573/4160=0 ∧ 2573%4160=2573 ∧ ∀ i, (leaves19 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData19).mp
    (by decide +kernel)

theorem sourceChecked19_0 : ∀ i : Fin 28,
    (fun i => output19 i = raw19 (source19 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked19 : ∀ i : Fin 28, (fun i => output19 i = raw19 (source19 i)) i :=
  forallFin_of_zero_offset (fun i => output19 i = raw19 (source19 i)) sourceChecked19_0

theorem coverChecked19_0 : ∀ i : Fin 28,
    (fun i => (output19 (cover19 i)).ContainsBox (raw19 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked19 : ∀ i : Fin 28, (fun i => (output19 (cover19 i)).ContainsBox (raw19 i)) i :=
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

noncomputable def phaseMass19 : ℝ := singlePhaseMass (177866497/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw19 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass19_eq : phaseMass19 = (177866497/1638400000000 : ℝ) := by
  unfold phaseMass19
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw19 output19 cover19 source19
    (gridTreeUnionCheck_sound 32768 raw19 output19 cover19 source19 tree19 checked19)
    _ (by norm_num) _, areaUnits19]
  norm_num

-- Frozen phase 5367, atom 7813, type 1, source (41,86).
def leavesData20 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves20 : Fin 7 → DyadicLeaf := leavesData20.get
def raw20 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 41 86 leaves20 i
def outputData20 : FiniteInputTree GridBox 14 := (.node (.node (.node (.single ⟨10496,10624,22016,22144⟩) (.node (.single ⟨10496,10624,22144,22272⟩) (.single ⟨10624,10688,22016,22080⟩))) (.node (.node (.single ⟨10624,10688,22080,22144⟩) (.single ⟨10688,10752,22016,22080⟩)) (.node (.single ⟨10688,10752,22080,22144⟩) (.single ⟨10624,10752,22144,22272⟩)))) (.node (.node (.single ⟨22016,22144,10496,10624⟩) (.node (.single ⟨22016,22080,10624,10688⟩) (.single ⟨22016,22080,10688,10752⟩))) (.node (.node (.single ⟨22080,22144,10624,10688⟩) (.single ⟨22080,22144,10688,10752⟩)) (.node (.single ⟨22144,22272,10496,10624⟩) (.single ⟨22144,22272,10624,10752⟩)))))
def output20 : Fin 14 → GridBox := outputData20.get
def coverData20 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 13))) (.node (.node (.single 6) (.single 1)) (.node (.single 12) (.single 12)))) (.node (.node (.single 1) (.node (.single 6) (.single 13))) (.node (.node (.single 7) (.single 0)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 11) (.node (.single 5) (.single 3))) (.node (.node (.single 10) (.single 10)) (.node (.single 3) (.single 4)))) (.node (.node (.single 9) (.node (.single 9) (.single 4))) (.node (.node (.single 5) (.single 11)) (.node (.single 8) (.single 2))))))
def sourceData20 : FiniteInputTree ℕ 14 := (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 15) (.single 3)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 14)) (.node (.single 5) (.single 2)))))
def cover20 (i : Fin 28) : Fin 14 := ⟨coverData20.get i % 14, Nat.mod_lt _ (by decide)⟩
def source20 (i : Fin 14) : Fin 28 := ⟨sourceData20.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree20 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 .empty (.cutY 22528 (.cutX 11264 (.cutY 21504 .empty (.cutX 10752 (.cutY 22016 .empty (.cutX 10496 .empty (.cutY 22272 (.cutX 10624 (.cutY 22144 .full .full) (.cutY 22144 (.cutX 10688 (.cutY 22080 .full .full) (.cutY 22080 .full .full)) .full)) .empty))) .empty)) .empty) .empty))) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 (.cutY 10240 .empty (.cutX 21504 .empty (.cutY 11264 (.cutX 22016 .empty (.cutY 10752 (.cutX 22272 (.cutY 10496 .empty (.cutX 22144 (.cutY 10624 .full (.cutX 22080 (.cutY 10688 .full .full) (.cutY 10688 .full .full))) (.cutY 10624 .full .full))) .empty) .empty)) .empty))) .empty) .empty))) .empty) .empty))

theorem metadata20 : 0<56923454 ∧ 41<128 ∧ 86<128 ∧ 1<4 ∧
    7813/4160=1 ∧ 7813%4160=3653 ∧ ∀ i, (leaves20 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData20).mp
    (by decide +kernel)

theorem sourceChecked20_0 : ∀ i : Fin 14,
    (fun i => output20 i = raw20 (source20 i)) (finOffset 14 0 14 (by decide) i) := by decide +kernel

theorem sourceChecked20 : ∀ i : Fin 14, (fun i => output20 i = raw20 (source20 i)) i :=
  forallFin_of_zero_offset (fun i => output20 i = raw20 (source20 i)) sourceChecked20_0

theorem coverChecked20_0 : ∀ i : Fin 28,
    (fun i => (output20 (cover20 i)).ContainsBox (raw20 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked20 : ∀ i : Fin 28, (fun i => (output20 (cover20 i)).ContainsBox (raw20 i)) i :=
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

theorem areaUnits20 : gridUnionAreaUnits output20 = 131072 := by decide +kernel

noncomputable def phaseMass20 : ℝ := singlePhaseMass (56923454/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw20 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass20_eq : phaseMass20 = (28461727/1638400000000 : ℝ) := by
  unfold phaseMass20
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw20 output20 cover20 source20
    (gridTreeUnionCheck_sound 32768 raw20 output20 cover20 source20 tree20 checked20)
    _ (by norm_num) _, areaUnits20]
  norm_num

-- Frozen phase 5368, atom 2234, type 0, source (20,74).
def leavesData21 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves21 : Fin 7 → DyadicLeaf := leavesData21.get
def raw21 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 20 74 leaves21 i
def outputData21 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨5120,5248,18944,19072⟩) (.node (.single ⟨5120,5248,19072,19200⟩) (.single ⟨5248,5312,18944,19008⟩))) (.node (.node (.single ⟨5248,5312,19008,19072⟩) (.single ⟨5312,5376,18944,19008⟩)) (.node (.single ⟨5312,5376,19008,19072⟩) (.single ⟨5248,5376,19072,19200⟩)))) (.node (.node (.single ⟨13568,13696,27392,27520⟩) (.node (.single ⟨13568,13696,27520,27648⟩) (.single ⟨13696,13760,27392,27456⟩))) (.node (.node (.single ⟨13696,13760,27456,27520⟩) (.single ⟨13760,13824,27392,27456⟩)) (.node (.single ⟨13760,13824,27456,27520⟩) (.single ⟨13696,13824,27520,27648⟩))))) (.node (.node (.node (.single ⟨18944,19072,5120,5248⟩) (.node (.single ⟨18944,19008,5248,5312⟩) (.single ⟨18944,19008,5312,5376⟩))) (.node (.node (.single ⟨19008,19072,5248,5312⟩) (.single ⟨19008,19072,5312,5376⟩)) (.node (.single ⟨19072,19200,5120,5248⟩) (.single ⟨19072,19200,5248,5376⟩)))) (.node (.node (.single ⟨27392,27520,13568,13696⟩) (.node (.single ⟨27392,27456,13696,13760⟩) (.single ⟨27392,27456,13760,13824⟩))) (.node (.node (.single ⟨27456,27520,13696,13760⟩) (.single ⟨27456,27520,13760,13824⟩)) (.node (.single ⟨27520,27648,13568,13696⟩) (.single ⟨27520,27648,13696,13824⟩))))))
def output21 : Fin 28 → GridBox := outputData21.get
def coverData21 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData21 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover21 (i : Fin 28) : Fin 28 := ⟨coverData21.get i % 28, Nat.mod_lt _ (by decide)⟩
def source21 (i : Fin 28) : Fin 28 := ⟨sourceData21.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree21 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 .empty (.cutX 5120 .empty (.cutY 19456 (.cutX 5632 (.cutY 18944 .empty (.cutX 5376 (.cutY 19200 (.cutX 5248 (.cutY 19072 .full .full) (.cutY 19072 (.cutX 5312 (.cutY 19008 .full .full) (.cutY 19008 .full .full)) .full)) .empty) .empty)) .empty) .empty))) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 .empty (.cutX 13312 .empty (.cutY 27648 (.cutX 13824 (.cutY 27136 .empty (.cutX 13568 .empty (.cutY 27392 .empty (.cutX 13696 (.cutY 27520 .full .full) (.cutY 27520 (.cutX 13760 (.cutY 27456 .full .full) (.cutY 27456 .full .full)) .full))))) .empty) .empty))) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 (.cutX 19456 (.cutY 5120 .empty (.cutX 18944 .empty (.cutY 5632 (.cutX 19200 (.cutY 5376 (.cutX 19072 (.cutY 5248 .full (.cutX 19008 (.cutY 5312 .full .full) (.cutY 5312 .full .full))) (.cutY 5248 .full .full)) .empty) .empty) .empty))) .empty) .empty))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 (.cutX 27648 (.cutY 13312 .empty (.cutX 27136 .empty (.cutY 13824 (.cutX 27392 .empty (.cutY 13568 .empty (.cutX 27520 (.cutY 13696 .full (.cutX 27456 (.cutY 13760 .full .full) (.cutY 13760 .full .full))) (.cutY 13696 .full .full)))) .empty))) .empty) .empty))) .empty))) .empty))

theorem metadata21 : 0<147396112 ∧ 20<128 ∧ 74<128 ∧ 0<4 ∧
    2234/4160=0 ∧ 2234%4160=2234 ∧ ∀ i, (leaves21 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData21).mp
    (by decide +kernel)

theorem sourceChecked21_0 : ∀ i : Fin 28,
    (fun i => output21 i = raw21 (source21 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked21 : ∀ i : Fin 28, (fun i => output21 i = raw21 (source21 i)) i :=
  forallFin_of_zero_offset (fun i => output21 i = raw21 (source21 i)) sourceChecked21_0

theorem coverChecked21_0 : ∀ i : Fin 28,
    (fun i => (output21 (cover21 i)).ContainsBox (raw21 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked21 : ∀ i : Fin 28, (fun i => (output21 (cover21 i)).ContainsBox (raw21 i)) i :=
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

noncomputable def phaseMass21 : ℝ := singlePhaseMass (147396112/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw21 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass21_eq : phaseMass21 = (9212257/102400000000 : ℝ) := by
  unfold phaseMass21
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw21 output21 cover21 source21
    (gridTreeUnionCheck_sound 32768 raw21 output21 cover21 source21 tree21 checked21)
    _ (by norm_num) _, areaUnits21]
  norm_num

-- Frozen phase 5369, atom 2880, type 0, source (28,80).
def leavesData22 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves22 : Fin 7 → DyadicLeaf := leavesData22.get
def raw22 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 28 80 leaves22 i
def outputData22 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨7168,7296,20480,20608⟩) (.node (.single ⟨7168,7296,20608,20736⟩) (.single ⟨7296,7360,20480,20544⟩))) (.node (.node (.single ⟨7296,7360,20544,20608⟩) (.single ⟨7360,7424,20480,20544⟩)) (.node (.single ⟨7360,7424,20544,20608⟩) (.single ⟨7296,7424,20608,20736⟩)))) (.node (.node (.single ⟨12032,12160,25344,25472⟩) (.node (.single ⟨12032,12160,25472,25600⟩) (.single ⟨12160,12224,25344,25408⟩))) (.node (.node (.single ⟨12160,12224,25408,25472⟩) (.single ⟨12224,12288,25344,25408⟩)) (.node (.single ⟨12224,12288,25408,25472⟩) (.single ⟨12160,12288,25472,25600⟩))))) (.node (.node (.node (.single ⟨20480,20608,7168,7296⟩) (.node (.single ⟨20480,20544,7296,7360⟩) (.single ⟨20480,20544,7360,7424⟩))) (.node (.node (.single ⟨20544,20608,7296,7360⟩) (.single ⟨20544,20608,7360,7424⟩)) (.node (.single ⟨20608,20736,7168,7296⟩) (.single ⟨20608,20736,7296,7424⟩)))) (.node (.node (.single ⟨25344,25472,12032,12160⟩) (.node (.single ⟨25344,25408,12160,12224⟩) (.single ⟨25344,25408,12224,12288⟩))) (.node (.node (.single ⟨25408,25472,12160,12224⟩) (.single ⟨25408,25472,12224,12288⟩)) (.node (.single ⟨25472,25600,12032,12160⟩) (.single ⟨25472,25600,12160,12288⟩))))))
def output22 : Fin 28 → GridBox := outputData22.get
def coverData22 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData22 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover22 (i : Fin 28) : Fin 28 := ⟨coverData22.get i % 28, Nat.mod_lt _ (by decide)⟩
def source22 (i : Fin 28) : Fin 28 := ⟨sourceData22.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree22 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 (.cutX 7168 .empty (.cutY 21504 (.cutX 7680 (.cutY 20992 (.cutX 7424 (.cutY 20736 (.cutX 7296 (.cutY 20608 .full .full) (.cutY 20608 (.cutX 7360 (.cutY 20544 .full .full) (.cutY 20544 .full .full)) .full)) .empty) .empty) .empty) .empty) .empty)) .empty)))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 (.cutX 11264 .empty (.cutY 25600 (.cutX 11776 .empty (.cutY 25088 .empty (.cutX 12032 .empty (.cutY 25344 .empty (.cutX 12160 (.cutY 25472 .full .full) (.cutY 25472 (.cutX 12224 (.cutY 25408 .full .full) (.cutY 25408 .full .full)) .full)))))) .empty)) .empty)) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 .empty (.cutX 21504 (.cutY 7168 .empty (.cutX 20992 (.cutY 7680 (.cutX 20736 (.cutY 7424 (.cutX 20608 (.cutY 7296 .full (.cutX 20544 (.cutY 7360 .full .full) (.cutY 7360 .full .full))) (.cutY 7296 .full .full)) .empty) .empty) .empty) .empty)) .empty)) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 .empty (.cutX 25600 (.cutY 11264 .empty (.cutX 25088 .empty (.cutY 11776 .empty (.cutX 25344 .empty (.cutY 12032 .empty (.cutX 25472 (.cutY 12160 .full (.cutX 25408 (.cutY 12224 .full .full) (.cutY 12224 .full .full))) (.cutY 12160 .full .full))))))) .empty)) .empty) .empty) .empty))) .empty))

theorem metadata22 : 0<104681033 ∧ 28<128 ∧ 80<128 ∧ 0<4 ∧
    2880/4160=0 ∧ 2880%4160=2880 ∧ ∀ i, (leaves22 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData22).mp
    (by decide +kernel)

theorem sourceChecked22_0 : ∀ i : Fin 28,
    (fun i => output22 i = raw22 (source22 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked22 : ∀ i : Fin 28, (fun i => output22 i = raw22 (source22 i)) i :=
  forallFin_of_zero_offset (fun i => output22 i = raw22 (source22 i)) sourceChecked22_0

theorem coverChecked22_0 : ∀ i : Fin 28,
    (fun i => (output22 (cover22 i)).ContainsBox (raw22 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked22 : ∀ i : Fin 28, (fun i => (output22 (cover22 i)).ContainsBox (raw22 i)) i :=
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

noncomputable def phaseMass22 : ℝ := singlePhaseMass (104681033/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw22 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass22_eq : phaseMass22 = (104681033/1638400000000 : ℝ) := by
  unfold phaseMass22
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw22 output22 cover22 source22
    (gridTreeUnionCheck_sound 32768 raw22 output22 cover22 source22 tree22 checked22)
    _ (by norm_num) _, areaUnits22]
  norm_num

-- Frozen phase 5370, atom 7108, type 1, source (29,77).
def leavesData23 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves23 : Fin 13 → DyadicLeaf := leavesData23.get
def raw23 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 29 77 leaves23 i
def outputData23 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨7424,7488,19712,19776⟩) (.node (.single ⟨7424,7488,19776,19840⟩) (.single ⟨7488,7552,19712,19776⟩))) (.node (.single ⟨7488,7552,19776,19840⟩) (.node (.single ⟨7424,7552,19840,19968⟩) (.single ⟨7552,7616,19712,19776⟩)))) (.node (.node (.single ⟨7552,7616,19776,19840⟩) (.node (.single ⟨7616,7648,19712,19744⟩) (.single ⟨7616,7648,19744,19776⟩))) (.node (.node (.single ⟨7648,7680,19712,19744⟩) (.single ⟨7648,7680,19744,19776⟩)) (.node (.single ⟨7616,7680,19776,19840⟩) (.single ⟨7552,7680,19840,19968⟩))))) (.node (.node (.node (.single ⟨12800,12928,25088,25216⟩) (.node (.single ⟨12800,12928,25216,25344⟩) (.single ⟨12928,12992,25088,25152⟩))) (.node (.single ⟨12928,12992,25152,25216⟩) (.node (.single ⟨12992,13024,25088,25120⟩) (.single ⟨12992,13024,25120,25152⟩)))) (.node (.node (.single ⟨13024,13056,25088,25120⟩) (.node (.single ⟨13024,13056,25120,25152⟩) (.single ⟨12992,13056,25152,25216⟩))) (.node (.node (.single ⟨12928,12992,25216,25280⟩) (.single ⟨12928,12992,25280,25344⟩)) (.node (.single ⟨12992,13056,25216,25280⟩) (.single ⟨12992,13056,25280,25344⟩)))))) (.node (.node (.node (.node (.single ⟨19712,19776,7424,7488⟩) (.node (.single ⟨19712,19776,7488,7552⟩) (.single ⟨19776,19840,7424,7488⟩))) (.node (.single ⟨19776,19840,7488,7552⟩) (.node (.single ⟨19712,19776,7552,7616⟩) (.single ⟨19712,19744,7616,7648⟩)))) (.node (.node (.single ⟨19712,19744,7648,7680⟩) (.node (.single ⟨19744,19776,7616,7648⟩) (.single ⟨19744,19776,7648,7680⟩))) (.node (.node (.single ⟨19776,19840,7552,7616⟩) (.single ⟨19776,19840,7616,7680⟩)) (.node (.single ⟨19840,19968,7424,7552⟩) (.single ⟨19840,19968,7552,7680⟩))))) (.node (.node (.node (.single ⟨25088,25216,12800,12928⟩) (.node (.single ⟨25088,25152,12928,12992⟩) (.single ⟨25088,25120,12992,13024⟩))) (.node (.single ⟨25088,25120,13024,13056⟩) (.node (.single ⟨25120,25152,12992,13024⟩) (.single ⟨25120,25152,13024,13056⟩)))) (.node (.node (.single ⟨25152,25216,12928,12992⟩) (.node (.single ⟨25152,25216,12992,13056⟩) (.single ⟨25216,25344,12800,12928⟩))) (.node (.node (.single ⟨25216,25280,12928,12992⟩) (.single ⟨25216,25280,12992,13056⟩)) (.node (.single ⟨25280,25344,12928,12992⟩) (.single ⟨25280,25344,12992,13056⟩)))))))
def output23 : Fin 52 → GridBox := outputData23.get
def coverData23 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData23 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover23 (i : Fin 52) : Fin 52 := ⟨coverData23.get i % 52, Nat.mod_lt _ (by decide)⟩
def source23 (i : Fin 52) : Fin 52 := ⟨sourceData23.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree23 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 .empty (.cutX 7168 .empty (.cutY 19456 .empty (.cutX 7680 (.cutY 19968 (.cutX 7424 .empty (.cutY 19712 .empty (.cutX 7552 (.cutY 19840 (.cutX 7488 (.cutY 19776 .full .full) (.cutY 19776 .full .full)) .full) (.cutY 19840 (.cutX 7616 (.cutY 19776 .full .full) (.cutY 19776 (.cutX 7648 (.cutY 19744 .full .full) (.cutY 19744 .full .full)) .full)) .full)))) .empty) .empty))))) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 (.cutX 13312 (.cutY 25600 (.cutX 12800 .empty (.cutY 25088 .empty (.cutX 13056 (.cutY 25344 (.cutX 12928 (.cutY 25216 .full .full) (.cutY 25216 (.cutX 12992 (.cutY 25152 .full .full) (.cutY 25152 (.cutX 13024 (.cutY 25120 .full .full) (.cutY 25120 .full .full)) .full)) (.cutX 12992 (.cutY 25280 .full .full) (.cutY 25280 .full .full)))) .empty) .empty))) .empty) .empty) .empty) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 .empty (.cutX 19456 .empty (.cutY 7168 .empty (.cutX 19968 (.cutY 7680 (.cutX 19712 .empty (.cutY 7424 .empty (.cutX 19840 (.cutY 7552 (.cutX 19776 (.cutY 7488 .full .full) (.cutY 7488 .full .full)) (.cutX 19776 (.cutY 7616 .full (.cutX 19744 (.cutY 7648 .full .full) (.cutY 7648 .full .full))) (.cutY 7616 .full .full))) (.cutY 7552 .full .full)))) .empty) .empty)))))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 (.cutX 25600 (.cutY 13312 (.cutX 25088 .empty (.cutY 12800 .empty (.cutX 25344 (.cutY 13056 (.cutX 25216 (.cutY 12928 .full (.cutX 25152 (.cutY 12992 .full (.cutX 25120 (.cutY 13024 .full .full) (.cutY 13024 .full .full))) (.cutY 12992 .full .full))) (.cutY 12928 .full (.cutX 25280 (.cutY 12992 .full .full) (.cutY 12992 .full .full)))) .empty) .empty))) .empty) .empty) .empty) .empty)) .empty))) .empty))

theorem metadata23 : 0<140060506 ∧ 29<128 ∧ 77<128 ∧ 1<4 ∧
    7108/4160=1 ∧ 7108%4160=2948 ∧ ∀ i, (leaves23 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData23).mp
    (by decide +kernel)

theorem sourceChecked23_0 : ∀ i : Fin 52,
    (fun i => output23 i = raw23 (source23 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked23 : ∀ i : Fin 52, (fun i => output23 i = raw23 (source23 i)) i :=
  forallFin_of_zero_offset (fun i => output23 i = raw23 (source23 i)) sourceChecked23_0

theorem coverChecked23_0 : ∀ i : Fin 52,
    (fun i => (output23 (cover23 i)).ContainsBox (raw23 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked23 : ∀ i : Fin 52, (fun i => (output23 (cover23 i)).ContainsBox (raw23 i)) i :=
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

noncomputable def phaseMass23 : ℝ := singlePhaseMass (140060506/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw23 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass23_eq : phaseMass23 = (70030253/819200000000 : ℝ) := by
  unfold phaseMass23
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw23 output23 cover23 source23
    (gridTreeUnionCheck_sound 32768 raw23 output23 cover23 source23 tree23 checked23)
    _ (by norm_num) _, areaUnits23]
  norm_num

-- Frozen phase 5371, atom 6390, type 1, source (20,70).
def leavesData24 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves24 : Fin 10 → DyadicLeaf := leavesData24.get
def raw24 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 20 70 leaves24 i
def outputData24 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨5120,5248,17920,18048⟩) (.single ⟨5120,5248,18048,18176⟩)) (.node (.single ⟨5248,5312,17920,17984⟩) (.node (.single ⟨5248,5312,17984,18048⟩) (.single ⟨5312,5344,17920,17952⟩)))) (.node (.node (.single ⟨5312,5344,17952,17984⟩) (.single ⟨5344,5376,17920,17952⟩)) (.node (.single ⟨5344,5376,17952,17984⟩) (.node (.single ⟨5312,5376,17984,18048⟩) (.single ⟨5248,5376,18048,18176⟩))))) (.node (.node (.node (.single ⟨14592,14720,27392,27520⟩) (.single ⟨14592,14720,27520,27648⟩)) (.node (.single ⟨14720,14784,27392,27456⟩) (.node (.single ⟨14720,14784,27456,27520⟩) (.single ⟨14784,14816,27392,27424⟩)))) (.node (.node (.single ⟨14784,14816,27424,27456⟩) (.single ⟨14816,14848,27392,27424⟩)) (.node (.single ⟨14816,14848,27424,27456⟩) (.node (.single ⟨14784,14848,27456,27520⟩) (.single ⟨14720,14848,27520,27648⟩)))))) (.node (.node (.node (.node (.single ⟨17920,18048,5120,5248⟩) (.single ⟨17920,17984,5248,5312⟩)) (.node (.single ⟨17920,17952,5312,5344⟩) (.node (.single ⟨17920,17952,5344,5376⟩) (.single ⟨17952,17984,5312,5344⟩)))) (.node (.node (.single ⟨17952,17984,5344,5376⟩) (.single ⟨17984,18048,5248,5312⟩)) (.node (.single ⟨17984,18048,5312,5376⟩) (.node (.single ⟨18048,18176,5120,5248⟩) (.single ⟨18048,18176,5248,5376⟩))))) (.node (.node (.node (.single ⟨27392,27520,14592,14720⟩) (.single ⟨27392,27456,14720,14784⟩)) (.node (.single ⟨27392,27424,14784,14816⟩) (.node (.single ⟨27392,27424,14816,14848⟩) (.single ⟨27424,27456,14784,14816⟩)))) (.node (.node (.single ⟨27424,27456,14816,14848⟩) (.single ⟨27456,27520,14720,14784⟩)) (.node (.single ⟨27456,27520,14784,14848⟩) (.node (.single ⟨27520,27648,14592,14720⟩) (.single ⟨27520,27648,14720,14848⟩)))))))
def output24 : Fin 40 → GridBox := outputData24.get
def coverData24 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 28) (.single 38)) (.node (.single 11) (.node (.single 9) (.single 29))))) (.node (.node (.node (.single 30) (.single 10)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 26) (.node (.single 36) (.single 13)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 23) (.single 33)))) (.node (.node (.single 16) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))))
def sourceData24 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover24 (i : Fin 40) : Fin 40 := ⟨coverData24.get i % 40, Nat.mod_lt _ (by decide)⟩
def source24 (i : Fin 40) : Fin 40 := ⟨sourceData24.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree24 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 (.cutX 5120 .empty (.cutY 17408 .empty (.cutX 5632 (.cutY 17920 .empty (.cutX 5376 (.cutY 18176 (.cutX 5248 (.cutY 18048 .full .full) (.cutY 18048 (.cutX 5312 (.cutY 17984 .full .full) (.cutY 17984 (.cutX 5344 (.cutY 17952 .full .full) (.cutY 17952 .full .full)) .full)) .full)) .empty) .empty)) .empty))) .empty) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 .empty (.cutX 15360 (.cutY 27648 (.cutX 14848 (.cutY 27136 .empty (.cutX 14592 .empty (.cutY 27392 .empty (.cutX 14720 (.cutY 27520 .full .full) (.cutY 27520 (.cutX 14784 (.cutY 27456 .full .full) (.cutY 27456 (.cutX 14816 (.cutY 27424 .full .full) (.cutY 27424 .full .full)) .full)) .full))))) .empty) .empty) .empty))) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 (.cutX 17408 .empty (.cutY 5120 .empty (.cutX 17920 .empty (.cutY 5632 (.cutX 18176 (.cutY 5376 (.cutX 18048 (.cutY 5248 .full (.cutX 17984 (.cutY 5312 .full (.cutX 17952 (.cutY 5344 .full .full) (.cutY 5344 .full .full))) (.cutY 5312 .full .full))) (.cutY 5248 .full .full)) .empty) .empty) .empty)))) .empty) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 .empty (.cutX 27648 (.cutY 15360 (.cutX 27136 .empty (.cutY 14848 (.cutX 27392 .empty (.cutY 14592 .empty (.cutX 27520 (.cutY 14720 .full (.cutX 27456 (.cutY 14784 .full (.cutX 27424 (.cutY 14816 .full .full) (.cutY 14816 .full .full))) (.cutY 14784 .full .full))) (.cutY 14720 .full .full)))) .empty)) .empty) .empty)))) .empty))) .empty))

theorem metadata24 : 0<135260814 ∧ 20<128 ∧ 70<128 ∧ 1<4 ∧
    6390/4160=1 ∧ 6390%4160=2230 ∧ ∀ i, (leaves24 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData24).mp
    (by decide +kernel)

theorem sourceChecked24_0 : ∀ i : Fin 40,
    (fun i => output24 i = raw24 (source24 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked24 : ∀ i : Fin 40, (fun i => output24 i = raw24 (source24 i)) i :=
  forallFin_of_zero_offset (fun i => output24 i = raw24 (source24 i)) sourceChecked24_0

theorem coverChecked24_0 : ∀ i : Fin 40,
    (fun i => (output24 (cover24 i)).ContainsBox (raw24 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked24 : ∀ i : Fin 40, (fun i => (output24 (cover24 i)).ContainsBox (raw24 i)) i :=
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

noncomputable def phaseMass24 : ℝ := singlePhaseMass (135260814/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw24 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass24_eq : phaseMass24 = (67630407/819200000000 : ℝ) := by
  unfold phaseMass24
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw24 output24 cover24 source24
    (gridTreeUnionCheck_sound 32768 raw24 output24 cover24 source24 tree24 checked24)
    _ (by norm_num) _, areaUnits24]
  norm_num

-- Frozen phase 5372, atom 7716, type 1, source (39,85).
def leavesData25 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves25 : Fin 13 → DyadicLeaf := leavesData25.get
def raw25 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 39 85 leaves25 i
def outputData25 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨9984,10048,21760,21824⟩) (.node (.single ⟨9984,10048,21824,21888⟩) (.single ⟨10048,10112,21760,21824⟩))) (.node (.single ⟨10048,10112,21824,21888⟩) (.node (.single ⟨9984,10112,21888,22016⟩) (.single ⟨10112,10176,21760,21824⟩)))) (.node (.node (.single ⟨10112,10176,21824,21888⟩) (.node (.single ⟨10176,10208,21760,21792⟩) (.single ⟨10176,10208,21792,21824⟩))) (.node (.node (.single ⟨10208,10240,21760,21792⟩) (.single ⟨10208,10240,21792,21824⟩)) (.node (.single ⟨10176,10240,21824,21888⟩) (.single ⟨10112,10240,21888,22016⟩))))) (.node (.node (.node (.single ⟨10752,10880,22528,22656⟩) (.node (.single ⟨10752,10880,22656,22784⟩) (.single ⟨10880,10944,22528,22592⟩))) (.node (.single ⟨10880,10944,22592,22656⟩) (.node (.single ⟨10944,10976,22528,22560⟩) (.single ⟨10944,10976,22560,22592⟩)))) (.node (.node (.single ⟨10976,11008,22528,22560⟩) (.node (.single ⟨10976,11008,22560,22592⟩) (.single ⟨10944,11008,22592,22656⟩))) (.node (.node (.single ⟨10880,10944,22656,22720⟩) (.single ⟨10880,10944,22720,22784⟩)) (.node (.single ⟨10944,11008,22656,22720⟩) (.single ⟨10944,11008,22720,22784⟩)))))) (.node (.node (.node (.node (.single ⟨21760,21824,9984,10048⟩) (.node (.single ⟨21760,21824,10048,10112⟩) (.single ⟨21824,21888,9984,10048⟩))) (.node (.single ⟨21824,21888,10048,10112⟩) (.node (.single ⟨21760,21824,10112,10176⟩) (.single ⟨21760,21792,10176,10208⟩)))) (.node (.node (.single ⟨21760,21792,10208,10240⟩) (.node (.single ⟨21792,21824,10176,10208⟩) (.single ⟨21792,21824,10208,10240⟩))) (.node (.node (.single ⟨21824,21888,10112,10176⟩) (.single ⟨21824,21888,10176,10240⟩)) (.node (.single ⟨21888,22016,9984,10112⟩) (.single ⟨21888,22016,10112,10240⟩))))) (.node (.node (.node (.single ⟨22528,22656,10752,10880⟩) (.node (.single ⟨22528,22592,10880,10944⟩) (.single ⟨22528,22560,10944,10976⟩))) (.node (.single ⟨22528,22560,10976,11008⟩) (.node (.single ⟨22560,22592,10944,10976⟩) (.single ⟨22560,22592,10976,11008⟩)))) (.node (.node (.single ⟨22592,22656,10880,10944⟩) (.node (.single ⟨22592,22656,10944,11008⟩) (.single ⟨22656,22784,10752,10880⟩))) (.node (.node (.single ⟨22656,22720,10880,10944⟩) (.single ⟨22656,22720,10944,11008⟩)) (.node (.single ⟨22720,22784,10880,10944⟩) (.single ⟨22720,22784,10944,11008⟩)))))))
def output25 : Fin 52 → GridBox := outputData25.get
def coverData25 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData25 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover25 (i : Fin 52) : Fin 52 := ⟨coverData25.get i % 52, Nat.mod_lt _ (by decide)⟩
def source25 (i : Fin 52) : Fin 52 := ⟨sourceData25.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree25 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 (.cutX 9216 .empty (.cutY 21504 .empty (.cutX 9728 .empty (.cutY 22016 (.cutX 9984 .empty (.cutY 21760 .empty (.cutX 10112 (.cutY 21888 (.cutX 10048 (.cutY 21824 .full .full) (.cutY 21824 .full .full)) .full) (.cutY 21888 (.cutX 10176 (.cutY 21824 .full .full) (.cutY 21824 (.cutX 10208 (.cutY 21792 .full .full) (.cutY 21792 .full .full)) .full)) .full)))) .empty)))) .empty) (.cutY 22528 .empty (.cutX 11264 (.cutY 23552 (.cutX 10752 .empty (.cutY 23040 (.cutX 11008 (.cutY 22784 (.cutX 10880 (.cutY 22656 .full .full) (.cutY 22656 (.cutX 10944 (.cutY 22592 .full .full) (.cutY 22592 (.cutX 10976 (.cutY 22560 .full .full) (.cutY 22560 .full .full)) .full)) (.cutX 10944 (.cutY 22720 .full .full) (.cutY 22720 .full .full)))) .empty) .empty) .empty)) .empty) .empty)))) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 (.cutY 10240 (.cutX 21504 .empty (.cutY 9216 .empty (.cutX 22016 (.cutY 9728 .empty (.cutX 21760 .empty (.cutY 9984 .empty (.cutX 21888 (.cutY 10112 (.cutX 21824 (.cutY 10048 .full .full) (.cutY 10048 .full .full)) (.cutX 21824 (.cutY 10176 .full (.cutX 21792 (.cutY 10208 .full .full) (.cutY 10208 .full .full))) (.cutY 10176 .full .full))) (.cutY 10112 .full .full))))) .empty))) .empty) (.cutY 10240 .empty (.cutX 23552 (.cutY 11264 (.cutX 23040 (.cutY 10752 .empty (.cutX 22784 (.cutY 11008 (.cutX 22656 (.cutY 10880 .full (.cutX 22592 (.cutY 10944 .full (.cutX 22560 (.cutY 10976 .full .full) (.cutY 10976 .full .full))) (.cutY 10944 .full .full))) (.cutY 10880 .full (.cutX 22720 (.cutY 10944 .full .full) (.cutY 10944 .full .full)))) .empty) .empty)) .empty) .empty) .empty))) .empty))) .empty) .empty))

theorem metadata25 : 0<156512574 ∧ 39<128 ∧ 85<128 ∧ 1<4 ∧
    7716/4160=1 ∧ 7716%4160=3556 ∧ ∀ i, (leaves25 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData25).mp
    (by decide +kernel)

theorem sourceChecked25_0 : ∀ i : Fin 52,
    (fun i => output25 i = raw25 (source25 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked25 : ∀ i : Fin 52, (fun i => output25 i = raw25 (source25 i)) i :=
  forallFin_of_zero_offset (fun i => output25 i = raw25 (source25 i)) sourceChecked25_0

theorem coverChecked25_0 : ∀ i : Fin 52,
    (fun i => (output25 (cover25 i)).ContainsBox (raw25 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked25 : ∀ i : Fin 52, (fun i => (output25 (cover25 i)).ContainsBox (raw25 i)) i :=
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

noncomputable def phaseMass25 : ℝ := singlePhaseMass (156512574/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw25 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass25_eq : phaseMass25 = (78256287/819200000000 : ℝ) := by
  unfold phaseMass25
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw25 output25 cover25 source25
    (gridTreeUnionCheck_sound 32768 raw25 output25 cover25 source25 tree25 checked25)
    _ (by norm_num) _, areaUnits25]
  norm_num

-- Frozen phase 5373, atom 7611, type 1, source (37,84).
def leavesData26 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves26 : Fin 7 → DyadicLeaf := leavesData26.get
def raw26 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 37 84 leaves26 i
def outputData26 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨9472,9600,21504,21632⟩) (.node (.single ⟨9472,9600,21632,21760⟩) (.single ⟨9600,9664,21504,21568⟩))) (.node (.node (.single ⟨9600,9664,21568,21632⟩) (.single ⟨9664,9728,21504,21568⟩)) (.node (.single ⟨9664,9728,21568,21632⟩) (.single ⟨9600,9728,21632,21760⟩)))) (.node (.node (.single ⟨11008,11136,23040,23168⟩) (.node (.single ⟨11008,11136,23168,23296⟩) (.single ⟨11136,11200,23040,23104⟩))) (.node (.node (.single ⟨11136,11200,23104,23168⟩) (.single ⟨11200,11264,23040,23104⟩)) (.node (.single ⟨11200,11264,23104,23168⟩) (.single ⟨11136,11264,23168,23296⟩))))) (.node (.node (.node (.single ⟨21504,21632,9472,9600⟩) (.node (.single ⟨21504,21568,9600,9664⟩) (.single ⟨21504,21568,9664,9728⟩))) (.node (.node (.single ⟨21568,21632,9600,9664⟩) (.single ⟨21568,21632,9664,9728⟩)) (.node (.single ⟨21632,21760,9472,9600⟩) (.single ⟨21632,21760,9600,9728⟩)))) (.node (.node (.single ⟨23040,23168,11008,11136⟩) (.node (.single ⟨23040,23104,11136,11200⟩) (.single ⟨23040,23104,11200,11264⟩))) (.node (.node (.single ⟨23104,23168,11136,11200⟩) (.single ⟨23104,23168,11200,11264⟩)) (.node (.single ⟨23168,23296,11008,11136⟩) (.single ⟨23168,23296,11136,11264⟩))))))
def output26 : Fin 28 → GridBox := outputData26.get
def coverData26 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData26 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover26 (i : Fin 28) : Fin 28 := ⟨coverData26.get i % 28, Nat.mod_lt _ (by decide)⟩
def source26 (i : Fin 28) : Fin 28 := ⟨sourceData26.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree26 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 (.cutX 9216 .empty (.cutY 21504 .empty (.cutX 9728 (.cutY 22016 (.cutX 9472 .empty (.cutY 21760 (.cutX 9600 (.cutY 21632 .full .full) (.cutY 21632 (.cutX 9664 (.cutY 21568 .full .full) (.cutY 21568 .full .full)) .full)) .empty)) .empty) .empty))) .empty) (.cutY 22528 .empty (.cutX 11264 (.cutY 23552 (.cutX 10752 .empty (.cutY 23040 .empty (.cutX 11008 .empty (.cutY 23296 (.cutX 11136 (.cutY 23168 .full .full) (.cutY 23168 (.cutX 11200 (.cutY 23104 .full .full) (.cutY 23104 .full .full)) .full)) .empty)))) .empty) .empty)))) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 (.cutY 10240 (.cutX 21504 .empty (.cutY 9216 .empty (.cutX 22016 (.cutY 9728 (.cutX 21760 (.cutY 9472 .empty (.cutX 21632 (.cutY 9600 .full (.cutX 21568 (.cutY 9664 .full .full) (.cutY 9664 .full .full))) (.cutY 9600 .full .full))) .empty) .empty) .empty))) .empty) (.cutY 10240 .empty (.cutX 23552 (.cutY 11264 (.cutX 23040 .empty (.cutY 10752 .empty (.cutX 23296 (.cutY 11008 .empty (.cutX 23168 (.cutY 11136 .full (.cutX 23104 (.cutY 11200 .full .full) (.cutY 11200 .full .full))) (.cutY 11136 .full .full))) .empty))) .empty) .empty))) .empty))) .empty) .empty))

theorem metadata26 : 0<156512574 ∧ 37<128 ∧ 84<128 ∧ 1<4 ∧
    7611/4160=1 ∧ 7611%4160=3451 ∧ ∀ i, (leaves26 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData26).mp
    (by decide +kernel)

theorem sourceChecked26_0 : ∀ i : Fin 28,
    (fun i => output26 i = raw26 (source26 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked26 : ∀ i : Fin 28, (fun i => output26 i = raw26 (source26 i)) i :=
  forallFin_of_zero_offset (fun i => output26 i = raw26 (source26 i)) sourceChecked26_0

theorem coverChecked26_0 : ∀ i : Fin 28,
    (fun i => (output26 (cover26 i)).ContainsBox (raw26 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked26 : ∀ i : Fin 28, (fun i => (output26 (cover26 i)).ContainsBox (raw26 i)) i :=
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

noncomputable def phaseMass26 : ℝ := singlePhaseMass (156512574/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw26 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass26_eq : phaseMass26 = (78256287/819200000000 : ℝ) := by
  unfold phaseMass26
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw26 output26 cover26 source26
    (gridTreeUnionCheck_sound 32768 raw26 output26 cover26 source26 tree26 checked26)
    _ (by norm_num) _, areaUnits26]
  norm_num

-- Frozen phase 5374, atom 1459, type 0, source (12,67).
def leavesData27 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves27 : Fin 7 → DyadicLeaf := leavesData27.get
def raw27 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 12 67 leaves27 i
def outputData27 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3072,3200,17152,17280⟩) (.node (.single ⟨3072,3200,17280,17408⟩) (.single ⟨3200,3264,17152,17216⟩))) (.node (.node (.single ⟨3200,3264,17216,17280⟩) (.single ⟨3264,3328,17152,17216⟩)) (.node (.single ⟨3264,3328,17216,17280⟩) (.single ⟨3200,3328,17280,17408⟩)))) (.node (.node (.single ⟨15360,15488,29440,29568⟩) (.node (.single ⟨15360,15488,29568,29696⟩) (.single ⟨15488,15552,29440,29504⟩))) (.node (.node (.single ⟨15488,15552,29504,29568⟩) (.single ⟨15552,15616,29440,29504⟩)) (.node (.single ⟨15552,15616,29504,29568⟩) (.single ⟨15488,15616,29568,29696⟩))))) (.node (.node (.node (.single ⟨17152,17280,3072,3200⟩) (.node (.single ⟨17152,17216,3200,3264⟩) (.single ⟨17152,17216,3264,3328⟩))) (.node (.node (.single ⟨17216,17280,3200,3264⟩) (.single ⟨17216,17280,3264,3328⟩)) (.node (.single ⟨17280,17408,3072,3200⟩) (.single ⟨17280,17408,3200,3328⟩)))) (.node (.node (.single ⟨29440,29568,15360,15488⟩) (.node (.single ⟨29440,29504,15488,15552⟩) (.single ⟨29440,29504,15552,15616⟩))) (.node (.node (.single ⟨29504,29568,15488,15552⟩) (.single ⟨29504,29568,15552,15616⟩)) (.node (.single ⟨29568,29696,15360,15488⟩) (.single ⟨29568,29696,15488,15616⟩))))))
def output27 : Fin 28 → GridBox := outputData27.get
def coverData27 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData27 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover27 (i : Fin 28) : Fin 28 := ⟨coverData27.get i % 28, Nat.mod_lt _ (by decide)⟩
def source27 (i : Fin 28) : Fin 28 := ⟨sourceData27.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree27 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 (.cutX 3072 .empty (.cutY 17408 (.cutX 3584 (.cutY 16896 .empty (.cutX 3328 (.cutY 17152 .empty (.cutX 3200 (.cutY 17280 .full .full) (.cutY 17280 (.cutX 3264 (.cutY 17216 .full .full) (.cutY 17216 .full .full)) .full))) .empty)) .empty) .empty)) .empty)) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 (.cutX 15360 .empty (.cutY 29696 (.cutX 15872 (.cutY 29184 .empty (.cutX 15616 (.cutY 29440 .empty (.cutX 15488 (.cutY 29568 .full .full) (.cutY 29568 (.cutX 15552 (.cutY 29504 .full .full) (.cutY 29504 .full .full)) .full))) .empty)) .empty) .empty)) .empty))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 .empty (.cutX 17408 (.cutY 3072 .empty (.cutX 16896 .empty (.cutY 3584 (.cutX 17152 .empty (.cutY 3328 (.cutX 17280 (.cutY 3200 .full (.cutX 17216 (.cutY 3264 .full .full) (.cutY 3264 .full .full))) (.cutY 3200 .full .full)) .empty)) .empty))) .empty)) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 .empty (.cutX 29696 (.cutY 15360 .empty (.cutX 29184 .empty (.cutY 15872 (.cutX 29440 .empty (.cutY 15616 (.cutX 29568 (.cutY 15488 .full (.cutX 29504 (.cutY 15552 .full .full) (.cutY 15552 .full .full))) (.cutY 15488 .full .full)) .empty)) .empty))) .empty)) .empty))))) .empty))

theorem metadata27 : 0<67702166 ∧ 12<128 ∧ 67<128 ∧ 0<4 ∧
    1459/4160=0 ∧ 1459%4160=1459 ∧ ∀ i, (leaves27 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData27).mp
    (by decide +kernel)

theorem sourceChecked27_0 : ∀ i : Fin 28,
    (fun i => output27 i = raw27 (source27 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked27 : ∀ i : Fin 28, (fun i => output27 i = raw27 (source27 i)) i :=
  forallFin_of_zero_offset (fun i => output27 i = raw27 (source27 i)) sourceChecked27_0

theorem coverChecked27_0 : ∀ i : Fin 28,
    (fun i => (output27 (cover27 i)).ContainsBox (raw27 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked27 : ∀ i : Fin 28, (fun i => (output27 (cover27 i)).ContainsBox (raw27 i)) i :=
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

noncomputable def phaseMass27 : ℝ := singlePhaseMass (67702166/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw27 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass27_eq : phaseMass27 = (33851083/819200000000 : ℝ) := by
  unfold phaseMass27
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw27 output27 cover27 source27
    (gridTreeUnionCheck_sound 32768 raw27 output27 cover27 source27 tree27 checked27)
    _ (by norm_num) _, areaUnits27]
  norm_num

-- Frozen phase 5375, atom 6809, type 1, source (25,74).
def leavesData28 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves28 : Fin 10 → DyadicLeaf := leavesData28.get
def raw28 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 25 74 leaves28 i
def outputData28 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨6400,6528,18944,19072⟩) (.single ⟨6400,6528,19072,19200⟩)) (.node (.single ⟨6528,6592,18944,19008⟩) (.node (.single ⟨6528,6592,19008,19072⟩) (.single ⟨6592,6624,18944,18976⟩)))) (.node (.node (.single ⟨6592,6624,18976,19008⟩) (.single ⟨6624,6656,18944,18976⟩)) (.node (.single ⟨6624,6656,18976,19008⟩) (.node (.single ⟨6592,6656,19008,19072⟩) (.single ⟨6528,6656,19072,19200⟩))))) (.node (.node (.node (.single ⟨13568,13696,26112,26240⟩) (.single ⟨13568,13696,26240,26368⟩)) (.node (.single ⟨13696,13760,26112,26176⟩) (.node (.single ⟨13696,13760,26176,26240⟩) (.single ⟨13760,13792,26112,26144⟩)))) (.node (.node (.single ⟨13760,13792,26144,26176⟩) (.single ⟨13792,13824,26112,26144⟩)) (.node (.single ⟨13792,13824,26144,26176⟩) (.node (.single ⟨13760,13824,26176,26240⟩) (.single ⟨13696,13824,26240,26368⟩)))))) (.node (.node (.node (.node (.single ⟨18944,19072,6400,6528⟩) (.single ⟨18944,19008,6528,6592⟩)) (.node (.single ⟨18944,18976,6592,6624⟩) (.node (.single ⟨18944,18976,6624,6656⟩) (.single ⟨18976,19008,6592,6624⟩)))) (.node (.node (.single ⟨18976,19008,6624,6656⟩) (.single ⟨19008,19072,6528,6592⟩)) (.node (.single ⟨19008,19072,6592,6656⟩) (.node (.single ⟨19072,19200,6400,6528⟩) (.single ⟨19072,19200,6528,6656⟩))))) (.node (.node (.node (.single ⟨26112,26240,13568,13696⟩) (.single ⟨26112,26176,13696,13760⟩)) (.node (.single ⟨26112,26144,13760,13792⟩) (.node (.single ⟨26112,26144,13792,13824⟩) (.single ⟨26144,26176,13760,13792⟩)))) (.node (.node (.single ⟨26144,26176,13792,13824⟩) (.single ⟨26176,26240,13696,13760⟩)) (.node (.single ⟨26176,26240,13760,13824⟩) (.node (.single ⟨26240,26368,13568,13696⟩) (.single ⟨26240,26368,13696,13824⟩)))))))
def output28 : Fin 40 → GridBox := outputData28.get
def coverData28 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 28) (.single 38)) (.node (.single 11) (.node (.single 9) (.single 29))))) (.node (.node (.node (.single 30) (.single 10)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 26) (.node (.single 36) (.single 13)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 23) (.single 33)))) (.node (.node (.single 16) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))))
def sourceData28 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover28 (i : Fin 40) : Fin 40 := ⟨coverData28.get i % 40, Nat.mod_lt _ (by decide)⟩
def source28 (i : Fin 40) : Fin 40 := ⟨sourceData28.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree28 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 .empty (.cutX 7168 (.cutY 19456 (.cutX 6656 (.cutY 18944 .empty (.cutX 6400 .empty (.cutY 19200 (.cutX 6528 (.cutY 19072 .full .full) (.cutY 19072 (.cutX 6592 (.cutY 19008 .full .full) (.cutY 19008 (.cutX 6624 (.cutY 18976 .full .full) (.cutY 18976 .full .full)) .full)) .full)) .empty))) .empty) .empty) .empty))) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 (.cutX 13312 .empty (.cutY 25600 .empty (.cutX 13824 (.cutY 26112 .empty (.cutX 13568 .empty (.cutY 26368 (.cutX 13696 (.cutY 26240 .full .full) (.cutY 26240 (.cutX 13760 (.cutY 26176 .full .full) (.cutY 26176 (.cutX 13792 (.cutY 26144 .full .full) (.cutY 26144 .full .full)) .full)) .full)) .empty))) .empty))) .empty) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 .empty (.cutX 19456 (.cutY 7168 (.cutX 18944 .empty (.cutY 6656 (.cutX 19200 (.cutY 6400 .empty (.cutX 19072 (.cutY 6528 .full (.cutX 19008 (.cutY 6592 .full (.cutX 18976 (.cutY 6624 .full .full) (.cutY 6624 .full .full))) (.cutY 6592 .full .full))) (.cutY 6528 .full .full))) .empty) .empty)) .empty) .empty)))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 (.cutX 25600 .empty (.cutY 13312 .empty (.cutX 26112 .empty (.cutY 13824 (.cutX 26368 (.cutY 13568 .empty (.cutX 26240 (.cutY 13696 .full (.cutX 26176 (.cutY 13760 .full (.cutX 26144 (.cutY 13792 .full .full) (.cutY 13792 .full .full))) (.cutY 13760 .full .full))) (.cutY 13696 .full .full))) .empty) .empty)))) .empty) .empty)) .empty))) .empty))

theorem metadata28 : 0<140060506 ∧ 25<128 ∧ 74<128 ∧ 1<4 ∧
    6809/4160=1 ∧ 6809%4160=2649 ∧ ∀ i, (leaves28 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData28).mp
    (by decide +kernel)

theorem sourceChecked28_0 : ∀ i : Fin 40,
    (fun i => output28 i = raw28 (source28 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked28 : ∀ i : Fin 40, (fun i => output28 i = raw28 (source28 i)) i :=
  forallFin_of_zero_offset (fun i => output28 i = raw28 (source28 i)) sourceChecked28_0

theorem coverChecked28_0 : ∀ i : Fin 40,
    (fun i => (output28 (cover28 i)).ContainsBox (raw28 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked28 : ∀ i : Fin 40, (fun i => (output28 (cover28 i)).ContainsBox (raw28 i)) i :=
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

noncomputable def phaseMass28 : ℝ := singlePhaseMass (140060506/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw28 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass28_eq : phaseMass28 = (70030253/819200000000 : ℝ) := by
  unfold phaseMass28
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw28 output28 cover28 source28
    (gridTreeUnionCheck_sound 32768 raw28 output28 cover28 source28 tree28 checked28)
    _ (by norm_num) _, areaUnits28]
  norm_num

-- Frozen phase 5376, atom 7178, type 1, source (30,78).
def leavesData29 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves29 : Fin 10 → DyadicLeaf := leavesData29.get
def raw29 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 30 78 leaves29 i
def outputData29 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨7680,7808,19968,20096⟩) (.single ⟨7680,7808,20096,20224⟩)) (.node (.single ⟨7808,7872,19968,20032⟩) (.node (.single ⟨7808,7872,20032,20096⟩) (.single ⟨7872,7904,19968,20000⟩)))) (.node (.node (.single ⟨7872,7904,20000,20032⟩) (.single ⟨7904,7936,19968,20000⟩)) (.node (.single ⟨7904,7936,20000,20032⟩) (.node (.single ⟨7872,7936,20032,20096⟩) (.single ⟨7808,7936,20096,20224⟩))))) (.node (.node (.node (.single ⟨12544,12672,24832,24960⟩) (.single ⟨12544,12672,24960,25088⟩)) (.node (.single ⟨12672,12736,24832,24896⟩) (.node (.single ⟨12672,12736,24896,24960⟩) (.single ⟨12736,12768,24832,24864⟩)))) (.node (.node (.single ⟨12736,12768,24864,24896⟩) (.single ⟨12768,12800,24832,24864⟩)) (.node (.single ⟨12768,12800,24864,24896⟩) (.node (.single ⟨12736,12800,24896,24960⟩) (.single ⟨12672,12800,24960,25088⟩)))))) (.node (.node (.node (.node (.single ⟨19968,20096,7680,7808⟩) (.single ⟨19968,20032,7808,7872⟩)) (.node (.single ⟨19968,20000,7872,7904⟩) (.node (.single ⟨19968,20000,7904,7936⟩) (.single ⟨20000,20032,7872,7904⟩)))) (.node (.node (.single ⟨20000,20032,7904,7936⟩) (.single ⟨20032,20096,7808,7872⟩)) (.node (.single ⟨20032,20096,7872,7936⟩) (.node (.single ⟨20096,20224,7680,7808⟩) (.single ⟨20096,20224,7808,7936⟩))))) (.node (.node (.node (.single ⟨24832,24960,12544,12672⟩) (.single ⟨24832,24896,12672,12736⟩)) (.node (.single ⟨24832,24864,12736,12768⟩) (.node (.single ⟨24832,24864,12768,12800⟩) (.single ⟨24864,24896,12736,12768⟩)))) (.node (.node (.single ⟨24864,24896,12768,12800⟩) (.single ⟨24896,24960,12672,12736⟩)) (.node (.single ⟨24896,24960,12736,12800⟩) (.node (.single ⟨24960,25088,12544,12672⟩) (.single ⟨24960,25088,12672,12800⟩)))))))
def output29 : Fin 40 → GridBox := outputData29.get
def coverData29 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 28) (.single 38)) (.node (.single 11) (.node (.single 9) (.single 29))))) (.node (.node (.node (.single 30) (.single 10)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 26) (.node (.single 36) (.single 13)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 23) (.single 33)))) (.node (.node (.single 16) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))))
def sourceData29 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover29 (i : Fin 40) : Fin 40 := ⟨coverData29.get i % 40, Nat.mod_lt _ (by decide)⟩
def source29 (i : Fin 40) : Fin 40 := ⟨sourceData29.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree29 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 .empty (.cutX 7168 .empty (.cutY 19456 .empty (.cutX 7680 .empty (.cutY 19968 .empty (.cutX 7936 (.cutY 20224 (.cutX 7808 (.cutY 20096 .full .full) (.cutY 20096 (.cutX 7872 (.cutY 20032 .full .full) (.cutY 20032 (.cutX 7904 (.cutY 20000 .full .full) (.cutY 20000 .full .full)) .full)) .full)) .empty) .empty))))))) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 (.cutX 13312 (.cutY 25600 (.cutX 12800 (.cutY 25088 (.cutX 12544 .empty (.cutY 24832 .empty (.cutX 12672 (.cutY 24960 .full .full) (.cutY 24960 (.cutX 12736 (.cutY 24896 .full .full) (.cutY 24896 (.cutX 12768 (.cutY 24864 .full .full) (.cutY 24864 .full .full)) .full)) .full)))) .empty) .empty) .empty) .empty) .empty) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 .empty (.cutX 19456 .empty (.cutY 7168 .empty (.cutX 19968 .empty (.cutY 7680 .empty (.cutX 20224 (.cutY 7936 (.cutX 20096 (.cutY 7808 .full (.cutX 20032 (.cutY 7872 .full (.cutX 20000 (.cutY 7904 .full .full) (.cutY 7904 .full .full))) (.cutY 7872 .full .full))) (.cutY 7808 .full .full)) .empty) .empty)))))))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 (.cutX 25600 (.cutY 13312 (.cutX 25088 (.cutY 12800 (.cutX 24832 .empty (.cutY 12544 .empty (.cutX 24960 (.cutY 12672 .full (.cutX 24896 (.cutY 12736 .full (.cutX 24864 (.cutY 12768 .full .full) (.cutY 12768 .full .full))) (.cutY 12736 .full .full))) (.cutY 12672 .full .full)))) .empty) .empty) .empty) .empty) .empty) .empty)) .empty))) .empty))

theorem metadata29 : 0<140060506 ∧ 30<128 ∧ 78<128 ∧ 1<4 ∧
    7178/4160=1 ∧ 7178%4160=3018 ∧ ∀ i, (leaves29 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData29).mp
    (by decide +kernel)

theorem sourceChecked29_0 : ∀ i : Fin 40,
    (fun i => output29 i = raw29 (source29 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked29 : ∀ i : Fin 40, (fun i => output29 i = raw29 (source29 i)) i :=
  forallFin_of_zero_offset (fun i => output29 i = raw29 (source29 i)) sourceChecked29_0

theorem coverChecked29_0 : ∀ i : Fin 40,
    (fun i => (output29 (cover29 i)).ContainsBox (raw29 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked29 : ∀ i : Fin 40, (fun i => (output29 (cover29 i)).ContainsBox (raw29 i)) i :=
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

noncomputable def phaseMass29 : ℝ := singlePhaseMass (140060506/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw29 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass29_eq : phaseMass29 = (70030253/819200000000 : ℝ) := by
  unfold phaseMass29
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw29 output29 cover29 source29
    (gridTreeUnionCheck_sound 32768 raw29 output29 cover29 source29 tree29 checked29)
    _ (by norm_num) _, areaUnits29]
  norm_num

-- Frozen phase 5377, atom 2653, type 0, source (25,78).
def leavesData30 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves30 : Fin 7 → DyadicLeaf := leavesData30.get
def raw30 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 25 78 leaves30 i
def outputData30 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨6400,6528,19968,20096⟩) (.node (.single ⟨6400,6528,20096,20224⟩) (.single ⟨6528,6592,19968,20032⟩))) (.node (.node (.single ⟨6528,6592,20032,20096⟩) (.single ⟨6592,6656,19968,20032⟩)) (.node (.single ⟨6592,6656,20032,20096⟩) (.single ⟨6528,6656,20096,20224⟩)))) (.node (.node (.single ⟨12544,12672,26112,26240⟩) (.node (.single ⟨12544,12672,26240,26368⟩) (.single ⟨12672,12736,26112,26176⟩))) (.node (.node (.single ⟨12672,12736,26176,26240⟩) (.single ⟨12736,12800,26112,26176⟩)) (.node (.single ⟨12736,12800,26176,26240⟩) (.single ⟨12672,12800,26240,26368⟩))))) (.node (.node (.node (.single ⟨19968,20096,6400,6528⟩) (.node (.single ⟨19968,20032,6528,6592⟩) (.single ⟨19968,20032,6592,6656⟩))) (.node (.node (.single ⟨20032,20096,6528,6592⟩) (.single ⟨20032,20096,6592,6656⟩)) (.node (.single ⟨20096,20224,6400,6528⟩) (.single ⟨20096,20224,6528,6656⟩)))) (.node (.node (.single ⟨26112,26240,12544,12672⟩) (.node (.single ⟨26112,26176,12672,12736⟩) (.single ⟨26112,26176,12736,12800⟩))) (.node (.node (.single ⟨26176,26240,12672,12736⟩) (.single ⟨26176,26240,12736,12800⟩)) (.node (.single ⟨26240,26368,12544,12672⟩) (.single ⟨26240,26368,12672,12800⟩))))))
def output30 : Fin 28 → GridBox := outputData30.get
def coverData30 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData30 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover30 (i : Fin 28) : Fin 28 := ⟨coverData30.get i % 28, Nat.mod_lt _ (by decide)⟩
def source30 (i : Fin 28) : Fin 28 := ⟨sourceData30.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree30 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 .empty (.cutX 7168 (.cutY 19456 .empty (.cutX 6656 (.cutY 19968 .empty (.cutX 6400 .empty (.cutY 20224 (.cutX 6528 (.cutY 20096 .full .full) (.cutY 20096 (.cutX 6592 (.cutY 20032 .full .full) (.cutY 20032 .full .full)) .full)) .empty))) .empty)) .empty))) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 (.cutX 13312 (.cutY 25600 .empty (.cutX 12800 (.cutY 26112 .empty (.cutX 12544 .empty (.cutY 26368 (.cutX 12672 (.cutY 26240 .full .full) (.cutY 26240 (.cutX 12736 (.cutY 26176 .full .full) (.cutY 26176 .full .full)) .full)) .empty))) .empty)) .empty) .empty) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 .empty (.cutX 19456 .empty (.cutY 7168 (.cutX 19968 .empty (.cutY 6656 (.cutX 20224 (.cutY 6400 .empty (.cutX 20096 (.cutY 6528 .full (.cutX 20032 (.cutY 6592 .full .full) (.cutY 6592 .full .full))) (.cutY 6528 .full .full))) .empty) .empty)) .empty))))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 (.cutX 25600 .empty (.cutY 13312 (.cutX 26112 .empty (.cutY 12800 (.cutX 26368 (.cutY 12544 .empty (.cutX 26240 (.cutY 12672 .full (.cutX 26176 (.cutY 12736 .full .full) (.cutY 12736 .full .full))) (.cutY 12672 .full .full))) .empty) .empty)) .empty)) .empty) .empty)) .empty))) .empty))

theorem metadata30 : 0<177866497 ∧ 25<128 ∧ 78<128 ∧ 0<4 ∧
    2653/4160=0 ∧ 2653%4160=2653 ∧ ∀ i, (leaves30 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData30).mp
    (by decide +kernel)

theorem sourceChecked30_0 : ∀ i : Fin 28,
    (fun i => output30 i = raw30 (source30 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked30 : ∀ i : Fin 28, (fun i => output30 i = raw30 (source30 i)) i :=
  forallFin_of_zero_offset (fun i => output30 i = raw30 (source30 i)) sourceChecked30_0

theorem coverChecked30_0 : ∀ i : Fin 28,
    (fun i => (output30 (cover30 i)).ContainsBox (raw30 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked30 : ∀ i : Fin 28, (fun i => (output30 (cover30 i)).ContainsBox (raw30 i)) i :=
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

noncomputable def phaseMass30 : ℝ := singlePhaseMass (177866497/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw30 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass30_eq : phaseMass30 = (177866497/1638400000000 : ℝ) := by
  unfold phaseMass30
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw30 output30 cover30 source30
    (gridTreeUnionCheck_sound 32768 raw30 output30 cover30 source30 tree30 checked30)
    _ (by norm_num) _, areaUnits30]
  norm_num

-- Frozen phase 5378, atom 1863, type 0, source (16,71).
def leavesData31 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves31 : Fin 13 → DyadicLeaf := leavesData31.get
def raw31 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 16 71 leaves31 i
def outputData31 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨4096,4160,18176,18240⟩) (.node (.single ⟨4096,4160,18240,18304⟩) (.single ⟨4160,4224,18176,18240⟩))) (.node (.single ⟨4160,4224,18240,18304⟩) (.node (.single ⟨4096,4224,18304,18432⟩) (.single ⟨4224,4288,18176,18240⟩)))) (.node (.node (.single ⟨4224,4288,18240,18304⟩) (.node (.single ⟨4288,4320,18176,18208⟩) (.single ⟨4288,4320,18208,18240⟩))) (.node (.node (.single ⟨4320,4352,18176,18208⟩) (.single ⟨4320,4352,18208,18240⟩)) (.node (.single ⟨4288,4352,18240,18304⟩) (.single ⟨4224,4352,18304,18432⟩))))) (.node (.node (.node (.single ⟨14336,14464,28416,28544⟩) (.node (.single ⟨14336,14464,28544,28672⟩) (.single ⟨14464,14528,28416,28480⟩))) (.node (.single ⟨14464,14528,28480,28544⟩) (.node (.single ⟨14528,14560,28416,28448⟩) (.single ⟨14528,14560,28448,28480⟩)))) (.node (.node (.single ⟨14560,14592,28416,28448⟩) (.node (.single ⟨14560,14592,28448,28480⟩) (.single ⟨14528,14592,28480,28544⟩))) (.node (.node (.single ⟨14464,14528,28544,28608⟩) (.single ⟨14464,14528,28608,28672⟩)) (.node (.single ⟨14528,14592,28544,28608⟩) (.single ⟨14528,14592,28608,28672⟩)))))) (.node (.node (.node (.node (.single ⟨18176,18240,4096,4160⟩) (.node (.single ⟨18176,18240,4160,4224⟩) (.single ⟨18240,18304,4096,4160⟩))) (.node (.single ⟨18240,18304,4160,4224⟩) (.node (.single ⟨18176,18240,4224,4288⟩) (.single ⟨18176,18208,4288,4320⟩)))) (.node (.node (.single ⟨18176,18208,4320,4352⟩) (.node (.single ⟨18208,18240,4288,4320⟩) (.single ⟨18208,18240,4320,4352⟩))) (.node (.node (.single ⟨18240,18304,4224,4288⟩) (.single ⟨18240,18304,4288,4352⟩)) (.node (.single ⟨18304,18432,4096,4224⟩) (.single ⟨18304,18432,4224,4352⟩))))) (.node (.node (.node (.single ⟨28416,28544,14336,14464⟩) (.node (.single ⟨28416,28480,14464,14528⟩) (.single ⟨28416,28448,14528,14560⟩))) (.node (.single ⟨28416,28448,14560,14592⟩) (.node (.single ⟨28448,28480,14528,14560⟩) (.single ⟨28448,28480,14560,14592⟩)))) (.node (.node (.single ⟨28480,28544,14464,14528⟩) (.node (.single ⟨28480,28544,14528,14592⟩) (.single ⟨28544,28672,14336,14464⟩))) (.node (.node (.single ⟨28544,28608,14464,14528⟩) (.single ⟨28544,28608,14528,14592⟩)) (.node (.single ⟨28608,28672,14464,14528⟩) (.single ⟨28608,28672,14528,14592⟩)))))))
def output31 : Fin 52 → GridBox := outputData31.get
def coverData31 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData31 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover31 (i : Fin 52) : Fin 52 := ⟨coverData31.get i % 52, Nat.mod_lt _ (by decide)⟩
def source31 (i : Fin 52) : Fin 52 := ⟨sourceData31.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree31 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 (.cutX 5120 (.cutY 17408 .empty (.cutX 4608 (.cutY 17920 .empty (.cutX 4352 (.cutY 18176 .empty (.cutX 4224 (.cutY 18304 (.cutX 4160 (.cutY 18240 .full .full) (.cutY 18240 .full .full)) .full) (.cutY 18304 (.cutX 4288 (.cutY 18240 .full .full) (.cutY 18240 (.cutX 4320 (.cutY 18208 .full .full) (.cutY 18208 .full .full)) .full)) .full))) .empty)) .empty)) .empty) .empty) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 .empty (.cutX 15360 (.cutY 27648 .empty (.cutX 14848 (.cutY 28160 .empty (.cutX 14592 (.cutY 28416 .empty (.cutX 14464 (.cutY 28544 .full .full) (.cutY 28544 (.cutX 14528 (.cutY 28480 .full .full) (.cutY 28480 (.cutX 14560 (.cutY 28448 .full .full) (.cutY 28448 .full .full)) .full)) (.cutX 14528 (.cutY 28608 .full .full) (.cutY 28608 .full .full))))) .empty)) .empty)) .empty))) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 (.cutX 17408 .empty (.cutY 5120 (.cutX 17920 .empty (.cutY 4608 (.cutX 18176 .empty (.cutY 4352 (.cutX 18304 (.cutY 4224 (.cutX 18240 (.cutY 4160 .full .full) (.cutY 4160 .full .full)) (.cutX 18240 (.cutY 4288 .full (.cutX 18208 (.cutY 4320 .full .full) (.cutY 4320 .full .full))) (.cutY 4288 .full .full))) (.cutY 4224 .full .full)) .empty)) .empty)) .empty)) .empty) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 .empty (.cutX 27648 .empty (.cutY 15360 (.cutX 28160 .empty (.cutY 14848 (.cutX 28416 .empty (.cutY 14592 (.cutX 28544 (.cutY 14464 .full (.cutX 28480 (.cutY 14528 .full (.cutX 28448 (.cutY 14560 .full .full) (.cutY 14560 .full .full))) (.cutY 14528 .full .full))) (.cutY 14464 .full (.cutX 28608 (.cutY 14528 .full .full) (.cutY 14528 .full .full)))) .empty)) .empty)) .empty))))) .empty))) .empty))

theorem metadata31 : 0<191564598 ∧ 16<128 ∧ 71<128 ∧ 0<4 ∧
    1863/4160=0 ∧ 1863%4160=1863 ∧ ∀ i, (leaves31 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData31).mp
    (by decide +kernel)

theorem sourceChecked31_0 : ∀ i : Fin 52,
    (fun i => output31 i = raw31 (source31 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked31 : ∀ i : Fin 52, (fun i => output31 i = raw31 (source31 i)) i :=
  forallFin_of_zero_offset (fun i => output31 i = raw31 (source31 i)) sourceChecked31_0

theorem coverChecked31_0 : ∀ i : Fin 52,
    (fun i => (output31 (cover31 i)).ContainsBox (raw31 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked31 : ∀ i : Fin 52, (fun i => (output31 (cover31 i)).ContainsBox (raw31 i)) i :=
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

noncomputable def phaseMass31 : ℝ := singlePhaseMass (191564598/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw31 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass31_eq : phaseMass31 = (95782299/819200000000 : ℝ) := by
  unfold phaseMass31
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw31 output31 cover31 source31
    (gridTreeUnionCheck_sound 32768 raw31 output31 cover31 source31 tree31 checked31)
    _ (by norm_num) _, areaUnits31]
  norm_num

-- Frozen phase 5379, atom 1959, type 0, source (17,72).
def leavesData32 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves32 : Fin 7 → DyadicLeaf := leavesData32.get
def raw32 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 17 72 leaves32 i
def outputData32 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨4352,4480,18432,18560⟩) (.node (.single ⟨4352,4480,18560,18688⟩) (.single ⟨4480,4544,18432,18496⟩))) (.node (.node (.single ⟨4480,4544,18496,18560⟩) (.single ⟨4544,4608,18432,18496⟩)) (.node (.single ⟨4544,4608,18496,18560⟩) (.single ⟨4480,4608,18560,18688⟩)))) (.node (.node (.single ⟨14080,14208,28160,28288⟩) (.node (.single ⟨14080,14208,28288,28416⟩) (.single ⟨14208,14272,28160,28224⟩))) (.node (.node (.single ⟨14208,14272,28224,28288⟩) (.single ⟨14272,14336,28160,28224⟩)) (.node (.single ⟨14272,14336,28224,28288⟩) (.single ⟨14208,14336,28288,28416⟩))))) (.node (.node (.node (.single ⟨18432,18560,4352,4480⟩) (.node (.single ⟨18432,18496,4480,4544⟩) (.single ⟨18432,18496,4544,4608⟩))) (.node (.node (.single ⟨18496,18560,4480,4544⟩) (.single ⟨18496,18560,4544,4608⟩)) (.node (.single ⟨18560,18688,4352,4480⟩) (.single ⟨18560,18688,4480,4608⟩)))) (.node (.node (.single ⟨28160,28288,14080,14208⟩) (.node (.single ⟨28160,28224,14208,14272⟩) (.single ⟨28160,28224,14272,14336⟩))) (.node (.node (.single ⟨28224,28288,14208,14272⟩) (.single ⟨28224,28288,14272,14336⟩)) (.node (.single ⟨28288,28416,14080,14208⟩) (.single ⟨28288,28416,14208,14336⟩))))))
def output32 : Fin 28 → GridBox := outputData32.get
def coverData32 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData32 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover32 (i : Fin 28) : Fin 28 := ⟨coverData32.get i % 28, Nat.mod_lt _ (by decide)⟩
def source32 (i : Fin 28) : Fin 28 := ⟨sourceData32.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree32 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 .empty (.cutX 5120 (.cutY 19456 (.cutX 4608 (.cutY 18944 (.cutX 4352 .empty (.cutY 18688 (.cutX 4480 (.cutY 18560 .full .full) (.cutY 18560 (.cutX 4544 (.cutY 18496 .full .full) (.cutY 18496 .full .full)) .full)) .empty)) .empty) .empty) .empty) .empty)) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 .empty (.cutX 13312 .empty (.cutY 27648 .empty (.cutX 13824 .empty (.cutY 28160 .empty (.cutX 14080 .empty (.cutY 28416 (.cutX 14208 (.cutY 28288 .full .full) (.cutY 28288 (.cutX 14272 (.cutY 28224 .full .full) (.cutY 28224 .full .full)) .full)) .empty))))))) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 (.cutX 19456 (.cutY 5120 (.cutX 18944 (.cutY 4608 (.cutX 18688 (.cutY 4352 .empty (.cutX 18560 (.cutY 4480 .full (.cutX 18496 (.cutY 4544 .full .full) (.cutY 4544 .full .full))) (.cutY 4480 .full .full))) .empty) .empty) .empty) .empty) .empty) .empty))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 (.cutX 27648 .empty (.cutY 13312 .empty (.cutX 28160 .empty (.cutY 13824 .empty (.cutX 28416 (.cutY 14080 .empty (.cutX 28288 (.cutY 14208 .full (.cutX 28224 (.cutY 14272 .full .full) (.cutY 14272 .full .full))) (.cutY 14208 .full .full))) .empty))))) .empty))) .empty))) .empty))

theorem metadata32 : 0<147396112 ∧ 17<128 ∧ 72<128 ∧ 0<4 ∧
    1959/4160=0 ∧ 1959%4160=1959 ∧ ∀ i, (leaves32 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData32).mp
    (by decide +kernel)

theorem sourceChecked32_0 : ∀ i : Fin 28,
    (fun i => output32 i = raw32 (source32 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked32 : ∀ i : Fin 28, (fun i => output32 i = raw32 (source32 i)) i :=
  forallFin_of_zero_offset (fun i => output32 i = raw32 (source32 i)) sourceChecked32_0

theorem coverChecked32_0 : ∀ i : Fin 28,
    (fun i => (output32 (cover32 i)).ContainsBox (raw32 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked32 : ∀ i : Fin 28, (fun i => (output32 (cover32 i)).ContainsBox (raw32 i)) i :=
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

noncomputable def phaseMass32 : ℝ := singlePhaseMass (147396112/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw32 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass32_eq : phaseMass32 = (9212257/102400000000 : ℝ) := by
  unfold phaseMass32
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw32 output32 cover32 source32
    (gridTreeUnionCheck_sound 32768 raw32 output32 cover32 source32 tree32 checked32)
    _ (by norm_num) _, areaUnits32]
  norm_num

-- Frozen phase 5380, atom 559, type 0, source (4,63).
def leavesData33 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves33 : Fin 7 → DyadicLeaf := leavesData33.get
def raw33 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 4 63 leaves33 i
def outputData33 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨1024,1152,16128,16256⟩) (.node (.single ⟨1024,1152,16256,16384⟩) (.single ⟨1152,1216,16128,16192⟩))) (.node (.node (.single ⟨1152,1216,16192,16256⟩) (.single ⟨1216,1280,16128,16192⟩)) (.node (.single ⟨1216,1280,16192,16256⟩) (.single ⟨1152,1280,16256,16384⟩)))) (.node (.node (.single ⟨16128,16256,1024,1152⟩) (.node (.single ⟨16128,16192,1152,1216⟩) (.single ⟨16128,16192,1216,1280⟩))) (.node (.node (.single ⟨16192,16256,1152,1216⟩) (.single ⟨16192,16256,1216,1280⟩)) (.node (.single ⟨16256,16384,1024,1152⟩) (.single ⟨16256,16384,1152,1280⟩))))) (.node (.node (.node (.single ⟨16384,16512,31488,31616⟩) (.node (.single ⟨16384,16512,31616,31744⟩) (.single ⟨16512,16576,31488,31552⟩))) (.node (.node (.single ⟨16512,16576,31552,31616⟩) (.single ⟨16576,16640,31488,31552⟩)) (.node (.single ⟨16576,16640,31552,31616⟩) (.single ⟨16512,16640,31616,31744⟩)))) (.node (.node (.single ⟨31488,31616,16384,16512⟩) (.node (.single ⟨31488,31552,16512,16576⟩) (.single ⟨31488,31552,16576,16640⟩))) (.node (.node (.single ⟨31552,31616,16512,16576⟩) (.single ⟨31552,31616,16576,16640⟩)) (.node (.single ⟨31616,31744,16384,16512⟩) (.single ⟨31616,31744,16512,16640⟩))))))
def output33 : Fin 28 → GridBox := outputData33.get
def coverData33 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData33 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover33 (i : Fin 28) : Fin 28 := ⟨coverData33.get i % 28, Nat.mod_lt _ (by decide)⟩
def source33 (i : Fin 28) : Fin 28 := ⟨sourceData33.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree33 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 .empty (.cutX 1024 .empty (.cutY 15360 .empty (.cutX 1536 (.cutY 15872 .empty (.cutX 1280 (.cutY 16128 .empty (.cutX 1152 (.cutY 16256 .full .full) (.cutY 16256 (.cutX 1216 (.cutY 16192 .full .full) (.cutY 16192 .full .full)) .full))) .empty)) .empty)))) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 (.cutX 15360 .empty (.cutY 1024 .empty (.cutX 15872 .empty (.cutY 1536 (.cutX 16128 .empty (.cutY 1280 (.cutX 16256 (.cutY 1152 .full (.cutX 16192 (.cutY 1216 .full .full) (.cutY 1216 .full .full))) (.cutY 1152 .full .full)) .empty)) .empty)))) .empty)) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 .empty (.cutX 17408 (.cutY 31744 (.cutX 16896 (.cutY 31232 .empty (.cutX 16640 (.cutY 31488 .empty (.cutX 16512 (.cutY 31616 .full .full) (.cutY 31616 (.cutX 16576 (.cutY 31552 .full .full) (.cutY 31552 .full .full)) .full))) .empty)) .empty) .empty) .empty)) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 (.cutX 31744 (.cutY 17408 (.cutX 31232 .empty (.cutY 16896 (.cutX 31488 .empty (.cutY 16640 (.cutX 31616 (.cutY 16512 .full (.cutX 31552 (.cutY 16576 .full .full) (.cutY 16576 .full .full))) (.cutY 16512 .full .full)) .empty)) .empty)) .empty) .empty) .empty)) .empty)) .empty))))

theorem metadata33 : 0<89519217 ∧ 4<128 ∧ 63<128 ∧ 0<4 ∧
    559/4160=0 ∧ 559%4160=559 ∧ ∀ i, (leaves33 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData33).mp
    (by decide +kernel)

theorem sourceChecked33_0 : ∀ i : Fin 28,
    (fun i => output33 i = raw33 (source33 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked33 : ∀ i : Fin 28, (fun i => output33 i = raw33 (source33 i)) i :=
  forallFin_of_zero_offset (fun i => output33 i = raw33 (source33 i)) sourceChecked33_0

theorem coverChecked33_0 : ∀ i : Fin 28,
    (fun i => (output33 (cover33 i)).ContainsBox (raw33 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked33 : ∀ i : Fin 28, (fun i => (output33 (cover33 i)).ContainsBox (raw33 i)) i :=
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

noncomputable def phaseMass33 : ℝ := singlePhaseMass (89519217/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw33 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass33_eq : phaseMass33 = (89519217/1638400000000 : ℝ) := by
  unfold phaseMass33
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw33 output33 cover33 source33
    (gridTreeUnionCheck_sound 32768 raw33 output33 cover33 source33 tree33 checked33)
    _ (by norm_num) _, areaUnits33]
  norm_num

-- Frozen phase 5381, atom 189, type 0, source (1,62).
def leavesData34 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves34 : Fin 7 → DyadicLeaf := leavesData34.get
def raw34 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 1 62 leaves34 i
def outputData34 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨256,384,15872,16000⟩) (.node (.single ⟨256,384,16000,16128⟩) (.single ⟨384,448,15872,15936⟩))) (.node (.node (.single ⟨384,448,15936,16000⟩) (.single ⟨448,512,15872,15936⟩)) (.node (.single ⟨448,512,15936,16000⟩) (.single ⟨384,512,16000,16128⟩)))) (.node (.node (.single ⟨15872,16000,256,384⟩) (.node (.single ⟨15872,15936,384,448⟩) (.single ⟨15872,15936,448,512⟩))) (.node (.node (.single ⟨15936,16000,384,448⟩) (.single ⟨15936,16000,448,512⟩)) (.node (.single ⟨16000,16128,256,384⟩) (.single ⟨16000,16128,384,512⟩))))) (.node (.node (.node (.single ⟨16640,16768,32256,32384⟩) (.node (.single ⟨16640,16768,32384,32512⟩) (.single ⟨16768,16832,32256,32320⟩))) (.node (.node (.single ⟨16768,16832,32320,32384⟩) (.single ⟨16832,16896,32256,32320⟩)) (.node (.single ⟨16832,16896,32320,32384⟩) (.single ⟨16768,16896,32384,32512⟩)))) (.node (.node (.single ⟨32256,32384,16640,16768⟩) (.node (.single ⟨32256,32320,16768,16832⟩) (.single ⟨32256,32320,16832,16896⟩))) (.node (.node (.single ⟨32320,32384,16768,16832⟩) (.single ⟨32320,32384,16832,16896⟩)) (.node (.single ⟨32384,32512,16640,16768⟩) (.single ⟨32384,32512,16768,16896⟩))))))
def output34 : Fin 28 → GridBox := outputData34.get
def coverData34 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData34 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover34 (i : Fin 28) : Fin 28 := ⟨coverData34.get i % 28, Nat.mod_lt _ (by decide)⟩
def source34 (i : Fin 28) : Fin 28 := ⟨sourceData34.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree34 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 .empty (.cutX 1024 (.cutY 15360 .empty (.cutX 512 (.cutY 15872 .empty (.cutX 256 .empty (.cutY 16128 (.cutX 384 (.cutY 16000 .full .full) (.cutY 16000 (.cutX 448 (.cutY 15936 .full .full) (.cutY 15936 .full .full)) .full)) .empty))) .empty)) .empty)) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 (.cutX 15360 .empty (.cutY 1024 (.cutX 15872 .empty (.cutY 512 (.cutX 16128 (.cutY 256 .empty (.cutX 16000 (.cutY 384 .full (.cutX 15936 (.cutY 448 .full .full) (.cutY 448 .full .full))) (.cutY 384 .full .full))) .empty) .empty)) .empty)) .empty)) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 .empty (.cutX 17408 (.cutY 31744 .empty (.cutX 16896 (.cutY 32256 .empty (.cutX 16640 .empty (.cutY 32512 (.cutX 16768 (.cutY 32384 .full .full) (.cutY 32384 (.cutX 16832 (.cutY 32320 .full .full) (.cutY 32320 .full .full)) .full)) .empty))) .empty)) .empty)) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 (.cutX 31744 .empty (.cutY 17408 (.cutX 32256 .empty (.cutY 16896 (.cutX 32512 (.cutY 16640 .empty (.cutX 32384 (.cutY 16768 .full (.cutX 32320 (.cutY 16832 .full .full) (.cutY 16832 .full .full))) (.cutY 16768 .full .full))) .empty) .empty)) .empty)) .empty)) .empty)) .empty))))

theorem metadata34 : 0<89519217 ∧ 1<128 ∧ 62<128 ∧ 0<4 ∧
    189/4160=0 ∧ 189%4160=189 ∧ ∀ i, (leaves34 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData34).mp
    (by decide +kernel)

theorem sourceChecked34_0 : ∀ i : Fin 28,
    (fun i => output34 i = raw34 (source34 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked34 : ∀ i : Fin 28, (fun i => output34 i = raw34 (source34 i)) i :=
  forallFin_of_zero_offset (fun i => output34 i = raw34 (source34 i)) sourceChecked34_0

theorem coverChecked34_0 : ∀ i : Fin 28,
    (fun i => (output34 (cover34 i)).ContainsBox (raw34 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked34 : ∀ i : Fin 28, (fun i => (output34 (cover34 i)).ContainsBox (raw34 i)) i :=
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

noncomputable def phaseMass34 : ℝ := singlePhaseMass (89519217/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw34 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass34_eq : phaseMass34 = (89519217/1638400000000 : ℝ) := by
  unfold phaseMass34
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw34 output34 cover34 source34
    (gridTreeUnionCheck_sound 32768 raw34 output34 cover34 source34 tree34 checked34)
    _ (by norm_num) _, areaUnits34]
  norm_num

-- Frozen phase 5382, atom 1765, type 0, source (15,70).
def leavesData35 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves35 : Fin 7 → DyadicLeaf := leavesData35.get
def raw35 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 15 70 leaves35 i
def outputData35 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3840,3968,17920,18048⟩) (.node (.single ⟨3840,3968,18048,18176⟩) (.single ⟨3968,4032,17920,17984⟩))) (.node (.node (.single ⟨3968,4032,17984,18048⟩) (.single ⟨4032,4096,17920,17984⟩)) (.node (.single ⟨4032,4096,17984,18048⟩) (.single ⟨3968,4096,18048,18176⟩)))) (.node (.node (.single ⟨14592,14720,28672,28800⟩) (.node (.single ⟨14592,14720,28800,28928⟩) (.single ⟨14720,14784,28672,28736⟩))) (.node (.node (.single ⟨14720,14784,28736,28800⟩) (.single ⟨14784,14848,28672,28736⟩)) (.node (.single ⟨14784,14848,28736,28800⟩) (.single ⟨14720,14848,28800,28928⟩))))) (.node (.node (.node (.single ⟨17920,18048,3840,3968⟩) (.node (.single ⟨17920,17984,3968,4032⟩) (.single ⟨17920,17984,4032,4096⟩))) (.node (.node (.single ⟨17984,18048,3968,4032⟩) (.single ⟨17984,18048,4032,4096⟩)) (.node (.single ⟨18048,18176,3840,3968⟩) (.single ⟨18048,18176,3968,4096⟩)))) (.node (.node (.single ⟨28672,28800,14592,14720⟩) (.node (.single ⟨28672,28736,14720,14784⟩) (.single ⟨28672,28736,14784,14848⟩))) (.node (.node (.single ⟨28736,28800,14720,14784⟩) (.single ⟨28736,28800,14784,14848⟩)) (.node (.single ⟨28800,28928,14592,14720⟩) (.single ⟨28800,28928,14720,14848⟩))))))
def output35 : Fin 28 → GridBox := outputData35.get
def coverData35 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData35 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover35 (i : Fin 28) : Fin 28 := ⟨coverData35.get i % 28, Nat.mod_lt _ (by decide)⟩
def source35 (i : Fin 28) : Fin 28 := ⟨sourceData35.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree35 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 (.cutX 3072 .empty (.cutY 17408 .empty (.cutX 3584 .empty (.cutY 17920 .empty (.cutX 3840 .empty (.cutY 18176 (.cutX 3968 (.cutY 18048 .full .full) (.cutY 18048 (.cutX 4032 (.cutY 17984 .full .full) (.cutY 17984 .full .full)) .full)) .empty)))))) .empty)) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 (.cutX 15360 (.cutY 29696 (.cutX 14848 (.cutY 29184 (.cutX 14592 .empty (.cutY 28928 (.cutX 14720 (.cutY 28800 .full .full) (.cutY 28800 (.cutX 14784 (.cutY 28736 .full .full) (.cutY 28736 .full .full)) .full)) .empty)) .empty) .empty) .empty) .empty) .empty))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 .empty (.cutX 17408 .empty (.cutY 3072 .empty (.cutX 17920 .empty (.cutY 3584 .empty (.cutX 18176 (.cutY 3840 .empty (.cutX 18048 (.cutY 3968 .full (.cutX 17984 (.cutY 4032 .full .full) (.cutY 4032 .full .full))) (.cutY 3968 .full .full))) .empty)))))) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 .empty (.cutX 29696 (.cutY 15360 (.cutX 29184 (.cutY 14848 (.cutX 28928 (.cutY 14592 .empty (.cutX 28800 (.cutY 14720 .full (.cutX 28736 (.cutY 14784 .full .full) (.cutY 14784 .full .full))) (.cutY 14720 .full .full))) .empty) .empty) .empty) .empty) .empty)) .empty))))) .empty))

theorem metadata35 : 0<67702166 ∧ 15<128 ∧ 70<128 ∧ 0<4 ∧
    1765/4160=0 ∧ 1765%4160=1765 ∧ ∀ i, (leaves35 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData35).mp
    (by decide +kernel)

theorem sourceChecked35_0 : ∀ i : Fin 28,
    (fun i => output35 i = raw35 (source35 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked35 : ∀ i : Fin 28, (fun i => output35 i = raw35 (source35 i)) i :=
  forallFin_of_zero_offset (fun i => output35 i = raw35 (source35 i)) sourceChecked35_0

theorem coverChecked35_0 : ∀ i : Fin 28,
    (fun i => (output35 (cover35 i)).ContainsBox (raw35 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked35 : ∀ i : Fin 28, (fun i => (output35 (cover35 i)).ContainsBox (raw35 i)) i :=
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

noncomputable def phaseMass35 : ℝ := singlePhaseMass (67702166/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw35 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass35_eq : phaseMass35 = (33851083/819200000000 : ℝ) := by
  unfold phaseMass35
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw35 output35 cover35 source35
    (gridTreeUnionCheck_sound 32768 raw35 output35 cover35 source35 tree35 checked35)
    _ (by norm_num) _, areaUnits35]
  norm_num

-- Frozen phase 5383, atom 1246, type 0, source (10,66).
def leavesData36 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves36 : Fin 7 → DyadicLeaf := leavesData36.get
def raw36 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 10 66 leaves36 i
def outputData36 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨2560,2688,16896,17024⟩) (.node (.single ⟨2560,2688,17024,17152⟩) (.single ⟨2688,2752,16896,16960⟩))) (.node (.node (.single ⟨2688,2752,16960,17024⟩) (.single ⟨2752,2816,16896,16960⟩)) (.node (.single ⟨2752,2816,16960,17024⟩) (.single ⟨2688,2816,17024,17152⟩)))) (.node (.node (.single ⟨15616,15744,29952,30080⟩) (.node (.single ⟨15616,15744,30080,30208⟩) (.single ⟨15744,15808,29952,30016⟩))) (.node (.node (.single ⟨15744,15808,30016,30080⟩) (.single ⟨15808,15872,29952,30016⟩)) (.node (.single ⟨15808,15872,30016,30080⟩) (.single ⟨15744,15872,30080,30208⟩))))) (.node (.node (.node (.single ⟨16896,17024,2560,2688⟩) (.node (.single ⟨16896,16960,2688,2752⟩) (.single ⟨16896,16960,2752,2816⟩))) (.node (.node (.single ⟨16960,17024,2688,2752⟩) (.single ⟨16960,17024,2752,2816⟩)) (.node (.single ⟨17024,17152,2560,2688⟩) (.single ⟨17024,17152,2688,2816⟩)))) (.node (.node (.single ⟨29952,30080,15616,15744⟩) (.node (.single ⟨29952,30016,15744,15808⟩) (.single ⟨29952,30016,15808,15872⟩))) (.node (.node (.single ⟨30016,30080,15744,15808⟩) (.single ⟨30016,30080,15808,15872⟩)) (.node (.single ⟨30080,30208,15616,15744⟩) (.single ⟨30080,30208,15744,15872⟩))))))
def output36 : Fin 28 → GridBox := outputData36.get
def coverData36 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData36 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover36 (i : Fin 28) : Fin 28 := ⟨coverData36.get i % 28, Nat.mod_lt _ (by decide)⟩
def source36 (i : Fin 28) : Fin 28 := ⟨sourceData36.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree36 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 (.cutX 3072 (.cutY 17408 (.cutX 2560 .empty (.cutY 16896 .empty (.cutX 2816 (.cutY 17152 (.cutX 2688 (.cutY 17024 .full .full) (.cutY 17024 (.cutX 2752 (.cutY 16960 .full .full) (.cutY 16960 .full .full)) .full)) .empty) .empty))) .empty) .empty) .empty)) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 (.cutX 15360 .empty (.cutY 29696 .empty (.cutX 15872 (.cutY 30208 (.cutX 15616 .empty (.cutY 29952 .empty (.cutX 15744 (.cutY 30080 .full .full) (.cutY 30080 (.cutX 15808 (.cutY 30016 .full .full) (.cutY 30016 .full .full)) .full)))) .empty) .empty))) .empty))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 .empty (.cutX 17408 (.cutY 3072 (.cutX 16896 .empty (.cutY 2560 .empty (.cutX 17152 (.cutY 2816 (.cutX 17024 (.cutY 2688 .full (.cutX 16960 (.cutY 2752 .full .full) (.cutY 2752 .full .full))) (.cutY 2688 .full .full)) .empty) .empty))) .empty) .empty)) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 .empty (.cutX 29696 .empty (.cutY 15360 .empty (.cutX 30208 (.cutY 15872 (.cutX 29952 .empty (.cutY 15616 .empty (.cutX 30080 (.cutY 15744 .full (.cutX 30016 (.cutY 15808 .full .full) (.cutY 15808 .full .full))) (.cutY 15744 .full .full)))) .empty) .empty)))) .empty))))) .empty))

theorem metadata36 : 0<67702166 ∧ 10<128 ∧ 66<128 ∧ 0<4 ∧
    1246/4160=0 ∧ 1246%4160=1246 ∧ ∀ i, (leaves36 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData36).mp
    (by decide +kernel)

theorem sourceChecked36_0 : ∀ i : Fin 28,
    (fun i => output36 i = raw36 (source36 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked36 : ∀ i : Fin 28, (fun i => output36 i = raw36 (source36 i)) i :=
  forallFin_of_zero_offset (fun i => output36 i = raw36 (source36 i)) sourceChecked36_0

theorem coverChecked36_0 : ∀ i : Fin 28,
    (fun i => (output36 (cover36 i)).ContainsBox (raw36 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked36 : ∀ i : Fin 28, (fun i => (output36 (cover36 i)).ContainsBox (raw36 i)) i :=
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

noncomputable def phaseMass36 : ℝ := singlePhaseMass (67702166/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw36 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass36_eq : phaseMass36 = (33851083/819200000000 : ℝ) := by
  unfold phaseMass36
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw36 output36 cover36 source36
    (gridTreeUnionCheck_sound 32768 raw36 output36 cover36 source36 tree36 checked36)
    _ (by norm_num) _, areaUnits36]
  norm_num

-- Frozen phase 5384, atom 5921, type 1, source (15,66).
def leavesData37 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves37 : Fin 10 → DyadicLeaf := leavesData37.get
def raw37 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 15 66 leaves37 i
def outputData37 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨3840,3968,16896,17024⟩) (.single ⟨3840,3968,17024,17152⟩)) (.node (.single ⟨3968,4032,16896,16960⟩) (.node (.single ⟨3968,4032,16960,17024⟩) (.single ⟨4032,4064,16896,16928⟩)))) (.node (.node (.single ⟨4032,4064,16928,16960⟩) (.single ⟨4064,4096,16896,16928⟩)) (.node (.single ⟨4064,4096,16928,16960⟩) (.node (.single ⟨4032,4096,16960,17024⟩) (.single ⟨3968,4096,17024,17152⟩))))) (.node (.node (.node (.single ⟨15616,15744,28672,28800⟩) (.single ⟨15616,15744,28800,28928⟩)) (.node (.single ⟨15744,15808,28672,28736⟩) (.node (.single ⟨15744,15808,28736,28800⟩) (.single ⟨15808,15840,28672,28704⟩)))) (.node (.node (.single ⟨15808,15840,28704,28736⟩) (.single ⟨15840,15872,28672,28704⟩)) (.node (.single ⟨15840,15872,28704,28736⟩) (.node (.single ⟨15808,15872,28736,28800⟩) (.single ⟨15744,15872,28800,28928⟩)))))) (.node (.node (.node (.node (.single ⟨16896,17024,3840,3968⟩) (.single ⟨16896,16960,3968,4032⟩)) (.node (.single ⟨16896,16928,4032,4064⟩) (.node (.single ⟨16896,16928,4064,4096⟩) (.single ⟨16928,16960,4032,4064⟩)))) (.node (.node (.single ⟨16928,16960,4064,4096⟩) (.single ⟨16960,17024,3968,4032⟩)) (.node (.single ⟨16960,17024,4032,4096⟩) (.node (.single ⟨17024,17152,3840,3968⟩) (.single ⟨17024,17152,3968,4096⟩))))) (.node (.node (.node (.single ⟨28672,28800,15616,15744⟩) (.single ⟨28672,28736,15744,15808⟩)) (.node (.single ⟨28672,28704,15808,15840⟩) (.node (.single ⟨28672,28704,15840,15872⟩) (.single ⟨28704,28736,15808,15840⟩)))) (.node (.node (.single ⟨28704,28736,15840,15872⟩) (.single ⟨28736,28800,15744,15808⟩)) (.node (.single ⟨28736,28800,15808,15872⟩) (.node (.single ⟨28800,28928,15616,15744⟩) (.single ⟨28800,28928,15744,15872⟩)))))))
def output37 : Fin 40 → GridBox := outputData37.get
def coverData37 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 28) (.single 38)) (.node (.single 11) (.node (.single 9) (.single 29))))) (.node (.node (.node (.single 30) (.single 10)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 26) (.node (.single 36) (.single 13)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 23) (.single 33)))) (.node (.node (.single 16) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))))
def sourceData37 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover37 (i : Fin 40) : Fin 40 := ⟨coverData37.get i % 40, Nat.mod_lt _ (by decide)⟩
def source37 (i : Fin 40) : Fin 40 := ⟨sourceData37.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree37 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 (.cutX 3072 .empty (.cutY 17408 (.cutX 3584 .empty (.cutY 16896 .empty (.cutX 3840 .empty (.cutY 17152 (.cutX 3968 (.cutY 17024 .full .full) (.cutY 17024 (.cutX 4032 (.cutY 16960 .full .full) (.cutY 16960 (.cutX 4064 (.cutY 16928 .full .full) (.cutY 16928 .full .full)) .full)) .full)) .empty)))) .empty)) .empty)) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 (.cutX 15360 .empty (.cutY 29696 (.cutX 15872 (.cutY 29184 (.cutX 15616 .empty (.cutY 28928 (.cutX 15744 (.cutY 28800 .full .full) (.cutY 28800 (.cutX 15808 (.cutY 28736 .full .full) (.cutY 28736 (.cutX 15840 (.cutY 28704 .full .full) (.cutY 28704 .full .full)) .full)) .full)) .empty)) .empty) .empty) .empty)) .empty))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 .empty (.cutX 17408 (.cutY 3072 .empty (.cutX 16896 .empty (.cutY 3584 .empty (.cutX 17152 (.cutY 3840 .empty (.cutX 17024 (.cutY 3968 .full (.cutX 16960 (.cutY 4032 .full (.cutX 16928 (.cutY 4064 .full .full) (.cutY 4064 .full .full))) (.cutY 4032 .full .full))) (.cutY 3968 .full .full))) .empty)))) .empty)) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 .empty (.cutX 29696 (.cutY 15360 .empty (.cutX 29184 (.cutY 15872 (.cutX 28928 (.cutY 15616 .empty (.cutX 28800 (.cutY 15744 .full (.cutX 28736 (.cutY 15808 .full (.cutX 28704 (.cutY 15840 .full .full) (.cutY 15840 .full .full))) (.cutY 15808 .full .full))) (.cutY 15744 .full .full))) .empty) .empty) .empty)) .empty)) .empty))))) .empty))

theorem metadata37 : 0<135229957 ∧ 15<128 ∧ 66<128 ∧ 1<4 ∧
    5921/4160=1 ∧ 5921%4160=1761 ∧ ∀ i, (leaves37 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData37).mp
    (by decide +kernel)

theorem sourceChecked37_0 : ∀ i : Fin 40,
    (fun i => output37 i = raw37 (source37 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked37 : ∀ i : Fin 40, (fun i => output37 i = raw37 (source37 i)) i :=
  forallFin_of_zero_offset (fun i => output37 i = raw37 (source37 i)) sourceChecked37_0

theorem coverChecked37_0 : ∀ i : Fin 40,
    (fun i => (output37 (cover37 i)).ContainsBox (raw37 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked37 : ∀ i : Fin 40, (fun i => (output37 (cover37 i)).ContainsBox (raw37 i)) i :=
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

noncomputable def phaseMass37 : ℝ := singlePhaseMass (135229957/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw37 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass37_eq : phaseMass37 = (135229957/1638400000000 : ℝ) := by
  unfold phaseMass37
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw37 output37 cover37 source37
    (gridTreeUnionCheck_sound 32768 raw37 output37 cover37 source37 tree37 checked37)
    _ (by norm_num) _, areaUnits37]
  norm_num

-- Frozen phase 5385, atom 6019, type 1, source (16,67).
def leavesData38 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves38 : Fin 10 → DyadicLeaf := leavesData38.get
def raw38 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 16 67 leaves38 i
def outputData38 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨4096,4224,17152,17280⟩) (.single ⟨4096,4224,17280,17408⟩)) (.node (.single ⟨4224,4288,17152,17216⟩) (.node (.single ⟨4224,4288,17216,17280⟩) (.single ⟨4288,4320,17152,17184⟩)))) (.node (.node (.single ⟨4288,4320,17184,17216⟩) (.single ⟨4320,4352,17152,17184⟩)) (.node (.single ⟨4320,4352,17184,17216⟩) (.node (.single ⟨4288,4352,17216,17280⟩) (.single ⟨4224,4352,17280,17408⟩))))) (.node (.node (.node (.single ⟨15360,15488,28416,28544⟩) (.single ⟨15360,15488,28544,28672⟩)) (.node (.single ⟨15488,15552,28416,28480⟩) (.node (.single ⟨15488,15552,28480,28544⟩) (.single ⟨15552,15584,28416,28448⟩)))) (.node (.node (.single ⟨15552,15584,28448,28480⟩) (.single ⟨15584,15616,28416,28448⟩)) (.node (.single ⟨15584,15616,28448,28480⟩) (.node (.single ⟨15552,15616,28480,28544⟩) (.single ⟨15488,15616,28544,28672⟩)))))) (.node (.node (.node (.node (.single ⟨17152,17280,4096,4224⟩) (.single ⟨17152,17216,4224,4288⟩)) (.node (.single ⟨17152,17184,4288,4320⟩) (.node (.single ⟨17152,17184,4320,4352⟩) (.single ⟨17184,17216,4288,4320⟩)))) (.node (.node (.single ⟨17184,17216,4320,4352⟩) (.single ⟨17216,17280,4224,4288⟩)) (.node (.single ⟨17216,17280,4288,4352⟩) (.node (.single ⟨17280,17408,4096,4224⟩) (.single ⟨17280,17408,4224,4352⟩))))) (.node (.node (.node (.single ⟨28416,28544,15360,15488⟩) (.single ⟨28416,28480,15488,15552⟩)) (.node (.single ⟨28416,28448,15552,15584⟩) (.node (.single ⟨28416,28448,15584,15616⟩) (.single ⟨28448,28480,15552,15584⟩)))) (.node (.node (.single ⟨28448,28480,15584,15616⟩) (.single ⟨28480,28544,15488,15552⟩)) (.node (.single ⟨28480,28544,15552,15616⟩) (.node (.single ⟨28544,28672,15360,15488⟩) (.single ⟨28544,28672,15488,15616⟩)))))))
def output38 : Fin 40 → GridBox := outputData38.get
def coverData38 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 28) (.single 38)) (.node (.single 11) (.node (.single 9) (.single 29))))) (.node (.node (.node (.single 30) (.single 10)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 26) (.node (.single 36) (.single 13)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 23) (.single 33)))) (.node (.node (.single 16) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))))
def sourceData38 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover38 (i : Fin 40) : Fin 40 := ⟨coverData38.get i % 40, Nat.mod_lt _ (by decide)⟩
def source38 (i : Fin 40) : Fin 40 := ⟨sourceData38.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree38 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 (.cutX 5120 (.cutY 17408 (.cutX 4608 (.cutY 16896 .empty (.cutX 4352 (.cutY 17152 .empty (.cutX 4224 (.cutY 17280 .full .full) (.cutY 17280 (.cutX 4288 (.cutY 17216 .full .full) (.cutY 17216 (.cutX 4320 (.cutY 17184 .full .full) (.cutY 17184 .full .full)) .full)) .full))) .empty)) .empty) .empty) .empty) .empty) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 .empty (.cutX 15360 .empty (.cutY 27648 .empty (.cutX 15872 (.cutY 28160 .empty (.cutX 15616 (.cutY 28416 .empty (.cutX 15488 (.cutY 28544 .full .full) (.cutY 28544 (.cutX 15552 (.cutY 28480 .full .full) (.cutY 28480 (.cutX 15584 (.cutY 28448 .full .full) (.cutY 28448 .full .full)) .full)) .full))) .empty)) .empty))))) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 (.cutX 17408 (.cutY 5120 (.cutX 16896 .empty (.cutY 4608 (.cutX 17152 .empty (.cutY 4352 (.cutX 17280 (.cutY 4224 .full (.cutX 17216 (.cutY 4288 .full (.cutX 17184 (.cutY 4320 .full .full) (.cutY 4320 .full .full))) (.cutY 4288 .full .full))) (.cutY 4224 .full .full)) .empty)) .empty)) .empty) .empty) .empty) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 .empty (.cutX 27648 .empty (.cutY 15360 .empty (.cutX 28160 .empty (.cutY 15872 (.cutX 28416 .empty (.cutY 15616 (.cutX 28544 (.cutY 15488 .full (.cutX 28480 (.cutY 15552 .full (.cutX 28448 (.cutY 15584 .full .full) (.cutY 15584 .full .full))) (.cutY 15552 .full .full))) (.cutY 15488 .full .full)) .empty)) .empty))))))) .empty))) .empty))

theorem metadata38 : 0<135260814 ∧ 16<128 ∧ 67<128 ∧ 1<4 ∧
    6019/4160=1 ∧ 6019%4160=1859 ∧ ∀ i, (leaves38 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData38).mp
    (by decide +kernel)

theorem sourceChecked38_0 : ∀ i : Fin 40,
    (fun i => output38 i = raw38 (source38 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked38 : ∀ i : Fin 40, (fun i => output38 i = raw38 (source38 i)) i :=
  forallFin_of_zero_offset (fun i => output38 i = raw38 (source38 i)) sourceChecked38_0

theorem coverChecked38_0 : ∀ i : Fin 40,
    (fun i => (output38 (cover38 i)).ContainsBox (raw38 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked38 : ∀ i : Fin 40, (fun i => (output38 (cover38 i)).ContainsBox (raw38 i)) i :=
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

noncomputable def phaseMass38 : ℝ := singlePhaseMass (135260814/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw38 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass38_eq : phaseMass38 = (67630407/819200000000 : ℝ) := by
  unfold phaseMass38
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw38 output38 cover38 source38
    (gridTreeUnionCheck_sound 32768 raw38 output38 cover38 source38 tree38 checked38)
    _ (by norm_num) _, areaUnits38]
  norm_num

-- Frozen phase 5386, atom 4716, type 1, source (4,60).
def leavesData39 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩))) (.node (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩)))) (.node (.node (.node (.single ⟨3,4,0⟩) (.single ⟨3,4,1⟩)) (.node (.single ⟨3,5,0⟩) (.single ⟨3,5,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves39 : Fin 16 → DyadicLeaf := leavesData39.get
def raw39 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 4 60 leaves39 i
def outputData39 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨1024,1088,15360,15424⟩) (.single ⟨1024,1088,15424,15488⟩)) (.node (.single ⟨1088,1152,15360,15424⟩) (.single ⟨1088,1152,15424,15488⟩))) (.node (.node (.single ⟨1024,1152,15488,15616⟩) (.single ⟨1152,1184,15360,15392⟩)) (.node (.single ⟨1152,1184,15392,15424⟩) (.single ⟨1184,1216,15360,15392⟩)))) (.node (.node (.node (.single ⟨1184,1216,15392,15424⟩) (.single ⟨1152,1216,15424,15488⟩)) (.node (.single ⟨1216,1248,15360,15392⟩) (.single ⟨1216,1248,15392,15424⟩))) (.node (.node (.single ⟨1248,1280,15360,15392⟩) (.single ⟨1248,1280,15392,15424⟩)) (.node (.single ⟨1216,1280,15424,15488⟩) (.single ⟨1152,1280,15488,15616⟩))))) (.node (.node (.node (.node (.single ⟨15360,15424,1024,1088⟩) (.single ⟨15360,15424,1088,1152⟩)) (.node (.single ⟨15424,15488,1024,1088⟩) (.single ⟨15424,15488,1088,1152⟩))) (.node (.node (.single ⟨15360,15392,1152,1184⟩) (.single ⟨15360,15392,1184,1216⟩)) (.node (.single ⟨15392,15424,1152,1184⟩) (.single ⟨15392,15424,1184,1216⟩)))) (.node (.node (.node (.single ⟨15360,15392,1216,1248⟩) (.single ⟨15360,15392,1248,1280⟩)) (.node (.single ⟨15392,15424,1216,1248⟩) (.single ⟨15392,15424,1248,1280⟩))) (.node (.node (.single ⟨15424,15488,1152,1216⟩) (.single ⟨15424,15488,1216,1280⟩)) (.node (.single ⟨15488,15616,1024,1152⟩) (.single ⟨15488,15616,1152,1280⟩)))))) (.node (.node (.node (.node (.node (.single ⟨17152,17280,31488,31616⟩) (.single ⟨17152,17280,31616,31744⟩)) (.node (.single ⟨17280,17344,31488,31552⟩) (.single ⟨17280,17344,31552,31616⟩))) (.node (.node (.single ⟨17344,17376,31488,31520⟩) (.single ⟨17344,17376,31520,31552⟩)) (.node (.single ⟨17376,17408,31488,31520⟩) (.single ⟨17376,17408,31520,31552⟩)))) (.node (.node (.node (.single ⟨17344,17376,31552,31584⟩) (.single ⟨17344,17376,31584,31616⟩)) (.node (.single ⟨17376,17408,31552,31584⟩) (.single ⟨17376,17408,31584,31616⟩))) (.node (.node (.single ⟨17280,17344,31616,31680⟩) (.single ⟨17280,17344,31680,31744⟩)) (.node (.single ⟨17344,17408,31616,31680⟩) (.single ⟨17344,17408,31680,31744⟩))))) (.node (.node (.node (.node (.single ⟨31488,31616,17152,17280⟩) (.single ⟨31488,31552,17280,17344⟩)) (.node (.single ⟨31488,31520,17344,17376⟩) (.single ⟨31488,31520,17376,17408⟩))) (.node (.node (.single ⟨31520,31552,17344,17376⟩) (.single ⟨31520,31552,17376,17408⟩)) (.node (.single ⟨31552,31616,17280,17344⟩) (.single ⟨31552,31584,17344,17376⟩)))) (.node (.node (.node (.single ⟨31552,31584,17376,17408⟩) (.single ⟨31584,31616,17344,17376⟩)) (.node (.single ⟨31584,31616,17376,17408⟩) (.single ⟨31616,31744,17152,17280⟩))) (.node (.node (.single ⟨31616,31680,17280,17344⟩) (.single ⟨31616,31680,17344,17408⟩)) (.node (.single ⟨31680,31744,17280,17344⟩) (.single ⟨31680,31744,17344,17408⟩)))))))
def output39 : Fin 64 → GridBox := outputData39.get
def coverData39 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 30)) (.node (.single 59) (.single 33))) (.node (.node (.single 15) (.single 31)) (.node (.single 48) (.single 32)))) (.node (.node (.node (.single 0) (.single 16)) (.node (.single 63) (.single 47))) (.node (.node (.single 1) (.single 18)) (.node (.single 62) (.single 45))))) (.node (.node (.node (.node (.single 2) (.single 17)) (.node (.single 61) (.single 46))) (.node (.node (.single 3) (.single 19)) (.node (.single 60) (.single 44)))) (.node (.node (.node (.single 9) (.single 28)) (.node (.single 54) (.single 35))) (.node (.node (.single 14) (.single 29)) (.node (.single 49) (.single 34)))))) (.node (.node (.node (.node (.node (.single 5) (.single 20)) (.node (.single 58) (.single 43))) (.node (.node (.single 6) (.single 22)) (.node (.single 57) (.single 41)))) (.node (.node (.node (.single 7) (.single 21)) (.node (.single 56) (.single 42))) (.node (.node (.single 8) (.single 23)) (.node (.single 55) (.single 40))))) (.node (.node (.node (.node (.single 10) (.single 24)) (.node (.single 53) (.single 39))) (.node (.node (.single 11) (.single 26)) (.node (.single 52) (.single 37)))) (.node (.node (.node (.single 12) (.single 25)) (.node (.single 51) (.single 38))) (.node (.node (.single 13) (.single 27)) (.node (.single 50) (.single 36)))))))
def sourceData39 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.single 20))) (.node (.node (.single 0) (.single 32)) (.node (.single 36) (.single 40)))) (.node (.node (.node (.single 44) (.single 24)) (.node (.single 48) (.single 52))) (.node (.node (.single 56) (.single 60)) (.node (.single 28) (.single 4))))) (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.single 21))) (.node (.node (.single 33) (.single 41)) (.node (.single 37) (.single 45)))) (.node (.node (.node (.single 49) (.single 57)) (.node (.single 53) (.single 61))) (.node (.node (.single 25) (.single 29)) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.node (.single 7) (.single 3)) (.node (.single 31) (.single 27))) (.node (.node (.single 63) (.single 55)) (.node (.single 59) (.single 51)))) (.node (.node (.node (.single 47) (.single 39)) (.node (.single 43) (.single 35))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11))))) (.node (.node (.node (.node (.single 6) (.single 30)) (.node (.single 62) (.single 58))) (.node (.node (.single 54) (.single 50)) (.node (.single 26) (.single 46)))) (.node (.node (.node (.single 42) (.single 38)) (.node (.single 34) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover39 (i : Fin 64) : Fin 64 := ⟨coverData39.get i % 64, Nat.mod_lt _ (by decide)⟩
def source39 (i : Fin 64) : Fin 64 := ⟨sourceData39.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree39 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 .empty (.cutX 1024 .empty (.cutY 15360 .empty (.cutX 1536 (.cutY 15872 (.cutX 1280 (.cutY 15616 (.cutX 1152 (.cutY 15488 (.cutX 1088 (.cutY 15424 .full .full) (.cutY 15424 .full .full)) .full) (.cutY 15488 (.cutX 1216 (.cutY 15424 (.cutX 1184 (.cutY 15392 .full .full) (.cutY 15392 .full .full)) .full) (.cutY 15424 (.cutX 1248 (.cutY 15392 .full .full) (.cutY 15392 .full .full)) .full)) .full)) .empty) .empty) .empty) .empty)))) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 (.cutX 15360 .empty (.cutY 1024 .empty (.cutX 15872 (.cutY 1536 (.cutX 15616 (.cutY 1280 (.cutX 15488 (.cutY 1152 (.cutX 15424 (.cutY 1088 .full .full) (.cutY 1088 .full .full)) (.cutX 15424 (.cutY 1216 (.cutX 15392 (.cutY 1184 .full .full) (.cutY 1184 .full .full)) (.cutX 15392 (.cutY 1248 .full .full) (.cutY 1248 .full .full))) (.cutY 1216 .full .full))) (.cutY 1152 .full .full)) .empty) .empty) .empty) .empty))) .empty)) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 .empty (.cutX 17408 (.cutY 31744 (.cutX 16896 .empty (.cutY 31232 .empty (.cutX 17152 .empty (.cutY 31488 .empty (.cutX 17280 (.cutY 31616 .full .full) (.cutY 31616 (.cutX 17344 (.cutY 31552 .full .full) (.cutY 31552 (.cutX 17376 (.cutY 31520 .full .full) (.cutY 31520 .full .full)) (.cutX 17376 (.cutY 31584 .full .full) (.cutY 31584 .full .full)))) (.cutX 17344 (.cutY 31680 .full .full) (.cutY 31680 .full .full)))))))) .empty) .empty)) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 (.cutX 31744 (.cutY 17408 (.cutX 31232 .empty (.cutY 16896 .empty (.cutX 31488 .empty (.cutY 17152 .empty (.cutX 31616 (.cutY 17280 .full (.cutX 31552 (.cutY 17344 .full (.cutX 31520 (.cutY 17376 .full .full) (.cutY 17376 .full .full))) (.cutY 17344 .full (.cutX 31584 (.cutY 17376 .full .full) (.cutY 17376 .full .full))))) (.cutY 17280 .full (.cutX 31680 (.cutY 17344 .full .full) (.cutY 17344 .full .full)))))))) .empty) .empty) .empty)) .empty)) .empty))))

theorem metadata39 : 0<169648215 ∧ 4<128 ∧ 60<128 ∧ 1<4 ∧
    4716/4160=1 ∧ 4716%4160=556 ∧ ∀ i, (leaves39 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData39).mp
    (by decide +kernel)

theorem sourceChecked39_0 : ∀ i : Fin 64,
    (fun i => output39 i = raw39 (source39 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked39 : ∀ i : Fin 64, (fun i => output39 i = raw39 (source39 i)) i :=
  forallFin_of_zero_offset (fun i => output39 i = raw39 (source39 i)) sourceChecked39_0

theorem coverChecked39_0 : ∀ i : Fin 64,
    (fun i => (output39 (cover39 i)).ContainsBox (raw39 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked39 : ∀ i : Fin 64, (fun i => (output39 (cover39 i)).ContainsBox (raw39 i)) i :=
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

noncomputable def phaseMass39 : ℝ := singlePhaseMass (169648215/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw39 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass39_eq : phaseMass39 = (33929643/327680000000 : ℝ) := by
  unfold phaseMass39
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw39 output39 cover39 source39
    (gridTreeUnionCheck_sound 32768 raw39 output39 cover39 source39 tree39 checked39)
    _ (by norm_num) _, areaUnits39]
  norm_num

-- Frozen phase 5387, atom 5403, type 1, source (10,63).
def leavesData40 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves40 : Fin 10 → DyadicLeaf := leavesData40.get
def raw40 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 10 63 leaves40 i
def outputData40 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨2560,2624,16128,16192⟩) (.single ⟨2560,2624,16192,16256⟩)) (.node (.single ⟨2624,2688,16128,16192⟩) (.node (.single ⟨2624,2688,16192,16256⟩) (.single ⟨2560,2688,16256,16384⟩)))) (.node (.node (.single ⟨2688,2752,16128,16192⟩) (.single ⟨2688,2752,16192,16256⟩)) (.node (.single ⟨2752,2816,16128,16192⟩) (.node (.single ⟨2752,2816,16192,16256⟩) (.single ⟨2688,2816,16256,16384⟩))))) (.node (.node (.node (.single ⟨16128,16192,2560,2624⟩) (.single ⟨16128,16192,2624,2688⟩)) (.node (.single ⟨16192,16256,2560,2624⟩) (.node (.single ⟨16192,16256,2624,2688⟩) (.single ⟨16128,16192,2688,2752⟩)))) (.node (.node (.single ⟨16128,16192,2752,2816⟩) (.single ⟨16192,16256,2688,2752⟩)) (.node (.single ⟨16192,16256,2752,2816⟩) (.node (.single ⟨16256,16384,2560,2688⟩) (.single ⟨16256,16384,2688,2816⟩)))))) (.node (.node (.node (.node (.single ⟨16384,16512,29952,30080⟩) (.single ⟨16384,16512,30080,30208⟩)) (.node (.single ⟨16512,16576,29952,30016⟩) (.node (.single ⟨16512,16576,30016,30080⟩) (.single ⟨16576,16640,29952,30016⟩)))) (.node (.node (.single ⟨16576,16640,30016,30080⟩) (.single ⟨16512,16576,30080,30144⟩)) (.node (.single ⟨16512,16576,30144,30208⟩) (.node (.single ⟨16576,16640,30080,30144⟩) (.single ⟨16576,16640,30144,30208⟩))))) (.node (.node (.node (.single ⟨29952,30080,16384,16512⟩) (.single ⟨29952,30016,16512,16576⟩)) (.node (.single ⟨29952,30016,16576,16640⟩) (.node (.single ⟨30016,30080,16512,16576⟩) (.single ⟨30016,30080,16576,16640⟩)))) (.node (.node (.single ⟨30080,30208,16384,16512⟩) (.single ⟨30080,30144,16512,16576⟩)) (.node (.single ⟨30080,30144,16576,16640⟩) (.node (.single ⟨30144,30208,16512,16576⟩) (.single ⟨30144,30208,16576,16640⟩)))))))
def output40 : Fin 40 → GridBox := outputData40.get
def coverData40 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 18)) (.node (.single 35) (.node (.single 21) (.single 9)))) (.node (.node (.single 19) (.single 30)) (.node (.single 20) (.node (.single 5) (.single 14))))) (.node (.node (.node (.single 34) (.single 25)) (.node (.single 6) (.node (.single 16) (.single 33)))) (.node (.node (.single 23) (.single 7)) (.node (.single 15) (.node (.single 32) (.single 24)))))) (.node (.node (.node (.node (.single 8) (.single 17)) (.node (.single 31) (.node (.single 22) (.single 0)))) (.node (.node (.single 10) (.single 39)) (.node (.single 29) (.node (.single 1) (.single 12))))) (.node (.node (.node (.single 38) (.single 27)) (.node (.single 2) (.node (.single 11) (.single 37)))) (.node (.node (.single 28) (.single 3)) (.node (.single 13) (.node (.single 36) (.single 26)))))))
def sourceData40 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover40 (i : Fin 40) : Fin 40 := ⟨coverData40.get i % 40, Nat.mod_lt _ (by decide)⟩
def source40 (i : Fin 40) : Fin 40 := ⟨sourceData40.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree40 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 .empty (.cutX 3072 (.cutY 15360 .empty (.cutX 2560 .empty (.cutY 15872 .empty (.cutX 2816 (.cutY 16128 .empty (.cutX 2688 (.cutY 16256 (.cutX 2624 (.cutY 16192 .full .full) (.cutY 16192 .full .full)) .full) (.cutY 16256 (.cutX 2752 (.cutY 16192 .full .full) (.cutY 16192 .full .full)) .full))) .empty)))) .empty)))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 .empty (.cutX 15360 .empty (.cutY 3072 (.cutX 15872 .empty (.cutY 2560 .empty (.cutX 16128 .empty (.cutY 2816 (.cutX 16256 (.cutY 2688 (.cutX 16192 (.cutY 2624 .full .full) (.cutY 2624 .full .full)) (.cutX 16192 (.cutY 2752 .full .full) (.cutY 2752 .full .full))) (.cutY 2688 .full .full)) .empty)))) .empty)))) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 (.cutX 17408 (.cutY 29696 .empty (.cutX 16896 (.cutY 30208 (.cutX 16640 (.cutY 29952 .empty (.cutX 16512 (.cutY 30080 .full .full) (.cutY 30080 (.cutX 16576 (.cutY 30016 .full .full) (.cutY 30016 .full .full)) (.cutX 16576 (.cutY 30144 .full .full) (.cutY 30144 .full .full))))) .empty) .empty) .empty)) .empty) .empty) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 (.cutX 29696 .empty (.cutY 17408 (.cutX 30208 (.cutY 16896 (.cutX 29952 .empty (.cutY 16640 (.cutX 30080 (.cutY 16512 .full (.cutX 30016 (.cutY 16576 .full .full) (.cutY 16576 .full .full))) (.cutY 16512 .full (.cutX 30144 (.cutY 16576 .full .full) (.cutY 16576 .full .full)))) .empty)) .empty) .empty) .empty)) .empty) .empty) .empty)) .empty))))

theorem metadata40 : 0<163200014 ∧ 10<128 ∧ 63<128 ∧ 1<4 ∧
    5403/4160=1 ∧ 5403%4160=1243 ∧ ∀ i, (leaves40 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData40).mp
    (by decide +kernel)

theorem sourceChecked40_0 : ∀ i : Fin 40,
    (fun i => output40 i = raw40 (source40 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked40 : ∀ i : Fin 40, (fun i => output40 i = raw40 (source40 i)) i :=
  forallFin_of_zero_offset (fun i => output40 i = raw40 (source40 i)) sourceChecked40_0

theorem coverChecked40_0 : ∀ i : Fin 40,
    (fun i => (output40 (cover40 i)).ContainsBox (raw40 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked40 : ∀ i : Fin 40, (fun i => (output40 (cover40 i)).ContainsBox (raw40 i)) i :=
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

noncomputable def phaseMass40 : ℝ := singlePhaseMass (163200014/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw40 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass40_eq : phaseMass40 = (81600007/819200000000 : ℝ) := by
  unfold phaseMass40
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw40 output40 cover40 source40
    (gridTreeUnionCheck_sound 32768 raw40 output40 cover40 source40 tree40 checked40)
    _ (by norm_num) _, areaUnits40]
  norm_num

-- Frozen phase 5388, atom 5616, type 1, source (12,64).
def leavesData41 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves41 : Fin 13 → DyadicLeaf := leavesData41.get
def raw41 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 12 64 leaves41 i
def outputData41 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨3072,3136,16384,16448⟩) (.node (.single ⟨3072,3136,16448,16512⟩) (.single ⟨3136,3200,16384,16448⟩))) (.node (.single ⟨3136,3200,16448,16512⟩) (.node (.single ⟨3072,3200,16512,16640⟩) (.single ⟨3200,3264,16384,16448⟩)))) (.node (.node (.single ⟨3200,3264,16448,16512⟩) (.node (.single ⟨3264,3296,16384,16416⟩) (.single ⟨3264,3296,16416,16448⟩))) (.node (.node (.single ⟨3296,3328,16384,16416⟩) (.single ⟨3296,3328,16416,16448⟩)) (.node (.single ⟨3264,3328,16448,16512⟩) (.single ⟨3200,3328,16512,16640⟩))))) (.node (.node (.node (.single ⟨16128,16256,29440,29568⟩) (.node (.single ⟨16128,16256,29568,29696⟩) (.single ⟨16256,16320,29440,29504⟩))) (.node (.single ⟨16256,16320,29504,29568⟩) (.node (.single ⟨16320,16352,29440,29472⟩) (.single ⟨16320,16352,29472,29504⟩)))) (.node (.node (.single ⟨16352,16384,29440,29472⟩) (.node (.single ⟨16352,16384,29472,29504⟩) (.single ⟨16320,16384,29504,29568⟩))) (.node (.node (.single ⟨16256,16320,29568,29632⟩) (.single ⟨16256,16320,29632,29696⟩)) (.node (.single ⟨16320,16384,29568,29632⟩) (.single ⟨16320,16384,29632,29696⟩)))))) (.node (.node (.node (.node (.single ⟨16384,16448,3072,3136⟩) (.node (.single ⟨16384,16448,3136,3200⟩) (.single ⟨16448,16512,3072,3136⟩))) (.node (.single ⟨16448,16512,3136,3200⟩) (.node (.single ⟨16384,16448,3200,3264⟩) (.single ⟨16384,16416,3264,3296⟩)))) (.node (.node (.single ⟨16384,16416,3296,3328⟩) (.node (.single ⟨16416,16448,3264,3296⟩) (.single ⟨16416,16448,3296,3328⟩))) (.node (.node (.single ⟨16448,16512,3200,3264⟩) (.single ⟨16448,16512,3264,3328⟩)) (.node (.single ⟨16512,16640,3072,3200⟩) (.single ⟨16512,16640,3200,3328⟩))))) (.node (.node (.node (.single ⟨29440,29568,16128,16256⟩) (.node (.single ⟨29440,29504,16256,16320⟩) (.single ⟨29440,29472,16320,16352⟩))) (.node (.single ⟨29440,29472,16352,16384⟩) (.node (.single ⟨29472,29504,16320,16352⟩) (.single ⟨29472,29504,16352,16384⟩)))) (.node (.node (.single ⟨29504,29568,16256,16320⟩) (.node (.single ⟨29504,29568,16320,16384⟩) (.single ⟨29568,29696,16128,16256⟩))) (.node (.node (.single ⟨29568,29632,16256,16320⟩) (.single ⟨29568,29632,16320,16384⟩)) (.node (.single ⟨29632,29696,16256,16320⟩) (.single ⟨29632,29696,16320,16384⟩)))))))
def output41 : Fin 52 → GridBox := outputData41.get
def coverData41 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData41 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover41 (i : Fin 52) : Fin 52 := ⟨coverData41.get i % 52, Nat.mod_lt _ (by decide)⟩
def source41 (i : Fin 52) : Fin 52 := ⟨sourceData41.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree41 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 (.cutX 3072 .empty (.cutY 17408 (.cutX 3584 (.cutY 16896 (.cutX 3328 (.cutY 16640 (.cutX 3200 (.cutY 16512 (.cutX 3136 (.cutY 16448 .full .full) (.cutY 16448 .full .full)) .full) (.cutY 16512 (.cutX 3264 (.cutY 16448 .full .full) (.cutY 16448 (.cutX 3296 (.cutY 16416 .full .full) (.cutY 16416 .full .full)) .full)) .full)) .empty) .empty) .empty) .empty) .empty)) .empty)) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 (.cutX 15360 .empty (.cutY 29696 (.cutX 15872 .empty (.cutY 29184 .empty (.cutX 16128 .empty (.cutY 29440 .empty (.cutX 16256 (.cutY 29568 .full .full) (.cutY 29568 (.cutX 16320 (.cutY 29504 .full .full) (.cutY 29504 (.cutX 16352 (.cutY 29472 .full .full) (.cutY 29472 .full .full)) .full)) (.cutX 16320 (.cutY 29632 .full .full) (.cutY 29632 .full .full)))))))) .empty)) .empty))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 .empty (.cutX 17408 (.cutY 3072 .empty (.cutX 16896 (.cutY 3584 (.cutX 16640 (.cutY 3328 (.cutX 16512 (.cutY 3200 (.cutX 16448 (.cutY 3136 .full .full) (.cutY 3136 .full .full)) (.cutX 16448 (.cutY 3264 .full (.cutX 16416 (.cutY 3296 .full .full) (.cutY 3296 .full .full))) (.cutY 3264 .full .full))) (.cutY 3200 .full .full)) .empty) .empty) .empty) .empty)) .empty)) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 .empty (.cutX 29696 (.cutY 15360 .empty (.cutX 29184 .empty (.cutY 15872 .empty (.cutX 29440 .empty (.cutY 16128 .empty (.cutX 29568 (.cutY 16256 .full (.cutX 29504 (.cutY 16320 .full (.cutX 29472 (.cutY 16352 .full .full) (.cutY 16352 .full .full))) (.cutY 16320 .full .full))) (.cutY 16256 .full (.cutX 29632 (.cutY 16320 .full .full) (.cutY 16320 .full .full))))))))) .empty)) .empty))))) .empty))

theorem metadata41 : 0<135229957 ∧ 12<128 ∧ 64<128 ∧ 1<4 ∧
    5616/4160=1 ∧ 5616%4160=1456 ∧ ∀ i, (leaves41 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData41).mp
    (by decide +kernel)

theorem sourceChecked41_0 : ∀ i : Fin 52,
    (fun i => output41 i = raw41 (source41 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked41 : ∀ i : Fin 52, (fun i => output41 i = raw41 (source41 i)) i :=
  forallFin_of_zero_offset (fun i => output41 i = raw41 (source41 i)) sourceChecked41_0

theorem coverChecked41_0 : ∀ i : Fin 52,
    (fun i => (output41 (cover41 i)).ContainsBox (raw41 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked41 : ∀ i : Fin 52, (fun i => (output41 (cover41 i)).ContainsBox (raw41 i)) i :=
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

noncomputable def phaseMass41 : ℝ := singlePhaseMass (135229957/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw41 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass41_eq : phaseMass41 = (135229957/1638400000000 : ℝ) := by
  unfold phaseMass41
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw41 output41 cover41 source41
    (gridTreeUnionCheck_sound 32768 raw41 output41 cover41 source41 tree41 checked41)
    _ (by norm_num) _, areaUnits41]
  norm_num

-- Frozen phase 5389, atom 5182, type 1, source (8,62).
def leavesData42 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves42 : Fin 13 → DyadicLeaf := leavesData42.get
def raw42 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 8 62 leaves42 i
def outputData42 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨2048,2112,15872,15936⟩) (.node (.single ⟨2048,2112,15936,16000⟩) (.single ⟨2112,2176,15872,15936⟩))) (.node (.single ⟨2112,2176,15936,16000⟩) (.node (.single ⟨2048,2176,16000,16128⟩) (.single ⟨2176,2240,15872,15936⟩)))) (.node (.node (.single ⟨2176,2240,15936,16000⟩) (.node (.single ⟨2240,2272,15872,15904⟩) (.single ⟨2240,2272,15904,15936⟩))) (.node (.node (.single ⟨2272,2304,15872,15904⟩) (.single ⟨2272,2304,15904,15936⟩)) (.node (.single ⟨2240,2304,15936,16000⟩) (.single ⟨2176,2304,16000,16128⟩))))) (.node (.node (.node (.single ⟨15872,15936,2048,2112⟩) (.node (.single ⟨15872,15936,2112,2176⟩) (.single ⟨15936,16000,2048,2112⟩))) (.node (.single ⟨15936,16000,2112,2176⟩) (.node (.single ⟨15872,15936,2176,2240⟩) (.single ⟨15872,15904,2240,2272⟩)))) (.node (.node (.single ⟨15872,15904,2272,2304⟩) (.node (.single ⟨15904,15936,2240,2272⟩) (.single ⟨15904,15936,2272,2304⟩))) (.node (.node (.single ⟨15936,16000,2176,2240⟩) (.single ⟨15936,16000,2240,2304⟩)) (.node (.single ⟨16000,16128,2048,2176⟩) (.single ⟨16000,16128,2176,2304⟩)))))) (.node (.node (.node (.node (.single ⟨16640,16768,30464,30592⟩) (.node (.single ⟨16640,16768,30592,30720⟩) (.single ⟨16768,16832,30464,30528⟩))) (.node (.single ⟨16768,16832,30528,30592⟩) (.node (.single ⟨16832,16864,30464,30496⟩) (.single ⟨16832,16864,30496,30528⟩)))) (.node (.node (.single ⟨16864,16896,30464,30496⟩) (.node (.single ⟨16864,16896,30496,30528⟩) (.single ⟨16832,16896,30528,30592⟩))) (.node (.node (.single ⟨16768,16832,30592,30656⟩) (.single ⟨16768,16832,30656,30720⟩)) (.node (.single ⟨16832,16896,30592,30656⟩) (.single ⟨16832,16896,30656,30720⟩))))) (.node (.node (.node (.single ⟨30464,30592,16640,16768⟩) (.node (.single ⟨30464,30528,16768,16832⟩) (.single ⟨30464,30496,16832,16864⟩))) (.node (.single ⟨30464,30496,16864,16896⟩) (.node (.single ⟨30496,30528,16832,16864⟩) (.single ⟨30496,30528,16864,16896⟩)))) (.node (.node (.single ⟨30528,30592,16768,16832⟩) (.node (.single ⟨30528,30592,16832,16896⟩) (.single ⟨30592,30720,16640,16768⟩))) (.node (.node (.single ⟨30592,30656,16768,16832⟩) (.single ⟨30592,30656,16832,16896⟩)) (.node (.single ⟨30656,30720,16768,16832⟩) (.single ⟨30656,30720,16832,16896⟩)))))))
def output42 : Fin 52 → GridBox := outputData42.get
def coverData42 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 24) (.single 47))) (.node (.single 27) (.node (.single 12) (.single 25)))) (.node (.node (.single 39) (.node (.single 26) (.single 5))) (.node (.node (.single 17) (.single 46)) (.node (.single 34) (.single 6))))) (.node (.node (.node (.single 22) (.node (.single 45) (.single 29))) (.node (.single 11) (.node (.single 23) (.single 40)))) (.node (.node (.single 28) (.node (.single 0) (.single 13))) (.node (.node (.single 51) (.single 38)) (.node (.single 1) (.single 15)))))) (.node (.node (.node (.node (.single 50) (.node (.single 36) (.single 2))) (.node (.single 14) (.node (.single 49) (.single 37)))) (.node (.node (.single 3) (.node (.single 16) (.single 48))) (.node (.node (.single 35) (.single 7)) (.node (.single 18) (.single 44))))) (.node (.node (.node (.single 33) (.node (.single 8) (.single 20))) (.node (.single 43) (.node (.single 31) (.single 9)))) (.node (.node (.single 19) (.node (.single 42) (.single 32))) (.node (.node (.single 10) (.single 21)) (.node (.single 41) (.single 30)))))))
def sourceData42 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover42 (i : Fin 52) : Fin 52 := ⟨coverData42.get i % 52, Nat.mod_lt _ (by decide)⟩
def source42 (i : Fin 52) : Fin 52 := ⟨sourceData42.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree42 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 .empty (.cutX 3072 (.cutY 15360 .empty (.cutX 2560 (.cutY 15872 .empty (.cutX 2304 (.cutY 16128 (.cutX 2176 (.cutY 16000 (.cutX 2112 (.cutY 15936 .full .full) (.cutY 15936 .full .full)) .full) (.cutY 16000 (.cutX 2240 (.cutY 15936 .full .full) (.cutY 15936 (.cutX 2272 (.cutY 15904 .full .full) (.cutY 15904 .full .full)) .full)) .full)) .empty) .empty)) .empty)) .empty)))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 .empty (.cutX 15360 .empty (.cutY 3072 (.cutX 15872 .empty (.cutY 2560 (.cutX 16128 (.cutY 2304 (.cutX 16000 (.cutY 2176 (.cutX 15936 (.cutY 2112 .full .full) (.cutY 2112 .full .full)) (.cutX 15936 (.cutY 2240 .full (.cutX 15904 (.cutY 2272 .full .full) (.cutY 2272 .full .full))) (.cutY 2240 .full .full))) (.cutY 2176 .full .full)) .empty) .empty) .empty)) .empty)))) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 (.cutX 17408 (.cutY 29696 .empty (.cutX 16896 (.cutY 30208 .empty (.cutX 16640 .empty (.cutY 30464 .empty (.cutX 16768 (.cutY 30592 .full .full) (.cutY 30592 (.cutX 16832 (.cutY 30528 .full .full) (.cutY 30528 (.cutX 16864 (.cutY 30496 .full .full) (.cutY 30496 .full .full)) .full)) (.cutX 16832 (.cutY 30656 .full .full) (.cutY 30656 .full .full))))))) .empty)) .empty) .empty) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 (.cutX 29696 .empty (.cutY 17408 (.cutX 30208 .empty (.cutY 16896 (.cutX 30464 .empty (.cutY 16640 .empty (.cutX 30592 (.cutY 16768 .full (.cutX 30528 (.cutY 16832 .full (.cutX 30496 (.cutY 16864 .full .full) (.cutY 16864 .full .full))) (.cutY 16832 .full .full))) (.cutY 16768 .full (.cutX 30656 (.cutY 16832 .full .full) (.cutY 16832 .full .full)))))) .empty)) .empty)) .empty) .empty) .empty)) .empty))))

theorem metadata42 : 0<163200014 ∧ 8<128 ∧ 62<128 ∧ 1<4 ∧
    5182/4160=1 ∧ 5182%4160=1022 ∧ ∀ i, (leaves42 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData42).mp
    (by decide +kernel)

theorem sourceChecked42_0 : ∀ i : Fin 52,
    (fun i => output42 i = raw42 (source42 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked42 : ∀ i : Fin 52, (fun i => output42 i = raw42 (source42 i)) i :=
  forallFin_of_zero_offset (fun i => output42 i = raw42 (source42 i)) sourceChecked42_0

theorem coverChecked42_0 : ∀ i : Fin 52,
    (fun i => (output42 (cover42 i)).ContainsBox (raw42 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked42 : ∀ i : Fin 52, (fun i => (output42 (cover42 i)).ContainsBox (raw42 i)) i :=
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

noncomputable def phaseMass42 : ℝ := singlePhaseMass (163200014/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw42 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass42_eq : phaseMass42 = (81600007/819200000000 : ℝ) := by
  unfold phaseMass42
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw42 output42 cover42 source42
    (gridTreeUnionCheck_sound 32768 raw42 output42 cover42 source42 tree42 checked42)
    _ (by norm_num) _, areaUnits42]
  norm_num

-- Frozen phase 5390, atom 7246, type 1, source (31,79).
def leavesData43 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves43 : Fin 10 → DyadicLeaf := leavesData43.get
def raw43 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 31 79 leaves43 i
def outputData43 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨7936,8064,20224,20352⟩) (.single ⟨7936,8064,20352,20480⟩)) (.node (.single ⟨8064,8128,20224,20288⟩) (.node (.single ⟨8064,8128,20288,20352⟩) (.single ⟨8128,8160,20224,20256⟩)))) (.node (.node (.single ⟨8128,8160,20256,20288⟩) (.single ⟨8160,8192,20224,20256⟩)) (.node (.single ⟨8160,8192,20256,20288⟩) (.node (.single ⟨8128,8192,20288,20352⟩) (.single ⟨8064,8192,20352,20480⟩))))) (.node (.node (.node (.single ⟨12288,12416,24576,24704⟩) (.single ⟨12288,12416,24704,24832⟩)) (.node (.single ⟨12416,12480,24576,24640⟩) (.node (.single ⟨12416,12480,24640,24704⟩) (.single ⟨12480,12512,24576,24608⟩)))) (.node (.node (.single ⟨12480,12512,24608,24640⟩) (.single ⟨12512,12544,24576,24608⟩)) (.node (.single ⟨12512,12544,24608,24640⟩) (.node (.single ⟨12480,12544,24640,24704⟩) (.single ⟨12416,12544,24704,24832⟩)))))) (.node (.node (.node (.node (.single ⟨20224,20352,7936,8064⟩) (.single ⟨20224,20288,8064,8128⟩)) (.node (.single ⟨20224,20256,8128,8160⟩) (.node (.single ⟨20224,20256,8160,8192⟩) (.single ⟨20256,20288,8128,8160⟩)))) (.node (.node (.single ⟨20256,20288,8160,8192⟩) (.single ⟨20288,20352,8064,8128⟩)) (.node (.single ⟨20288,20352,8128,8192⟩) (.node (.single ⟨20352,20480,7936,8064⟩) (.single ⟨20352,20480,8064,8192⟩))))) (.node (.node (.node (.single ⟨24576,24704,12288,12416⟩) (.single ⟨24576,24640,12416,12480⟩)) (.node (.single ⟨24576,24608,12480,12512⟩) (.node (.single ⟨24576,24608,12512,12544⟩) (.single ⟨24608,24640,12480,12512⟩)))) (.node (.node (.single ⟨24608,24640,12512,12544⟩) (.single ⟨24640,24704,12416,12480⟩)) (.node (.single ⟨24640,24704,12480,12544⟩) (.node (.single ⟨24704,24832,12288,12416⟩) (.single ⟨24704,24832,12416,12544⟩)))))))
def output43 : Fin 40 → GridBox := outputData43.get
def coverData43 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 28) (.single 38)) (.node (.single 11) (.node (.single 9) (.single 29))))) (.node (.node (.node (.single 30) (.single 10)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 26) (.node (.single 36) (.single 13)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 23) (.single 33)))) (.node (.node (.single 16) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))))
def sourceData43 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover43 (i : Fin 40) : Fin 40 := ⟨coverData43.get i % 40, Nat.mod_lt _ (by decide)⟩
def source43 (i : Fin 40) : Fin 40 := ⟨sourceData43.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree43 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 .empty (.cutX 7168 .empty (.cutY 19456 .empty (.cutX 7680 .empty (.cutY 19968 .empty (.cutX 7936 .empty (.cutY 20224 .empty (.cutX 8064 (.cutY 20352 .full .full) (.cutY 20352 (.cutX 8128 (.cutY 20288 .full .full) (.cutY 20288 (.cutX 8160 (.cutY 20256 .full .full) (.cutY 20256 .full .full)) .full)) .full)))))))))) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 (.cutX 13312 (.cutY 25600 (.cutX 12800 (.cutY 25088 (.cutX 12544 (.cutY 24832 (.cutX 12416 (.cutY 24704 .full .full) (.cutY 24704 (.cutX 12480 (.cutY 24640 .full .full) (.cutY 24640 (.cutX 12512 (.cutY 24608 .full .full) (.cutY 24608 .full .full)) .full)) .full)) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 .empty (.cutX 19456 .empty (.cutY 7168 .empty (.cutX 19968 .empty (.cutY 7680 .empty (.cutX 20224 .empty (.cutY 7936 .empty (.cutX 20352 (.cutY 8064 .full (.cutX 20288 (.cutY 8128 .full (.cutX 20256 (.cutY 8160 .full .full) (.cutY 8160 .full .full))) (.cutY 8128 .full .full))) (.cutY 8064 .full .full))))))))))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 (.cutX 25600 (.cutY 13312 (.cutX 25088 (.cutY 12800 (.cutX 24832 (.cutY 12544 (.cutX 24704 (.cutY 12416 .full (.cutX 24640 (.cutY 12480 .full (.cutX 24608 (.cutY 12512 .full .full) (.cutY 12512 .full .full))) (.cutY 12480 .full .full))) (.cutY 12416 .full .full)) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty)) .empty))) .empty))

theorem metadata43 : 0<140060506 ∧ 31<128 ∧ 79<128 ∧ 1<4 ∧
    7246/4160=1 ∧ 7246%4160=3086 ∧ ∀ i, (leaves43 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData43).mp
    (by decide +kernel)

theorem sourceChecked43_0 : ∀ i : Fin 40,
    (fun i => output43 i = raw43 (source43 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked43 : ∀ i : Fin 40, (fun i => output43 i = raw43 (source43 i)) i :=
  forallFin_of_zero_offset (fun i => output43 i = raw43 (source43 i)) sourceChecked43_0

theorem coverChecked43_0 : ∀ i : Fin 40,
    (fun i => (output43 (cover43 i)).ContainsBox (raw43 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked43 : ∀ i : Fin 40, (fun i => (output43 (cover43 i)).ContainsBox (raw43 i)) i :=
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

noncomputable def phaseMass43 : ℝ := singlePhaseMass (140060506/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw43 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass43_eq : phaseMass43 = (70030253/819200000000 : ℝ) := by
  unfold phaseMass43
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw43 output43 cover43 source43
    (gridTreeUnionCheck_sound 32768 raw43 output43 cover43 source43 tree43 checked43)
    _ (by norm_num) _, areaUnits43]
  norm_num

-- Frozen phase 5391, atom 7312, type 1, source (32,80).
def leavesData44 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves44 : Fin 7 → DyadicLeaf := leavesData44.get
def raw44 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 32 80 leaves44 i
def outputData44 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨8192,8320,20480,20608⟩) (.node (.single ⟨8192,8320,20608,20736⟩) (.single ⟨8320,8384,20480,20544⟩))) (.node (.node (.single ⟨8320,8384,20544,20608⟩) (.single ⟨8384,8448,20480,20544⟩)) (.node (.single ⟨8384,8448,20544,20608⟩) (.single ⟨8320,8448,20608,20736⟩)))) (.node (.node (.single ⟨12032,12160,24320,24448⟩) (.node (.single ⟨12032,12160,24448,24576⟩) (.single ⟨12160,12224,24320,24384⟩))) (.node (.node (.single ⟨12160,12224,24384,24448⟩) (.single ⟨12224,12288,24320,24384⟩)) (.node (.single ⟨12224,12288,24384,24448⟩) (.single ⟨12160,12288,24448,24576⟩))))) (.node (.node (.node (.single ⟨20480,20608,8192,8320⟩) (.node (.single ⟨20480,20544,8320,8384⟩) (.single ⟨20480,20544,8384,8448⟩))) (.node (.node (.single ⟨20544,20608,8320,8384⟩) (.single ⟨20544,20608,8384,8448⟩)) (.node (.single ⟨20608,20736,8192,8320⟩) (.single ⟨20608,20736,8320,8448⟩)))) (.node (.node (.single ⟨24320,24448,12032,12160⟩) (.node (.single ⟨24320,24384,12160,12224⟩) (.single ⟨24320,24384,12224,12288⟩))) (.node (.node (.single ⟨24384,24448,12160,12224⟩) (.single ⟨24384,24448,12224,12288⟩)) (.node (.single ⟨24448,24576,12032,12160⟩) (.single ⟨24448,24576,12160,12288⟩))))))
def output44 : Fin 28 → GridBox := outputData44.get
def coverData44 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData44 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover44 (i : Fin 28) : Fin 28 := ⟨coverData44.get i % 28, Nat.mod_lt _ (by decide)⟩
def source44 (i : Fin 28) : Fin 28 := ⟨sourceData44.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree44 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 (.cutX 9216 (.cutY 21504 (.cutX 8704 (.cutY 20992 (.cutX 8448 (.cutY 20736 (.cutX 8320 (.cutY 20608 .full .full) (.cutY 20608 (.cutX 8384 (.cutY 20544 .full .full) (.cutY 20544 .full .full)) .full)) .empty) .empty) .empty) .empty) .empty) .empty) .empty) (.cutY 22528 .empty (.cutX 11264 .empty (.cutY 23552 .empty (.cutX 11776 .empty (.cutY 24064 .empty (.cutX 12032 .empty (.cutY 24320 .empty (.cutX 12160 (.cutY 24448 .full .full) (.cutY 24448 (.cutX 12224 (.cutY 24384 .full .full) (.cutY 24384 .full .full)) .full))))))))))) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 (.cutY 10240 (.cutX 21504 (.cutY 9216 (.cutX 20992 (.cutY 8704 (.cutX 20736 (.cutY 8448 (.cutX 20608 (.cutY 8320 .full (.cutX 20544 (.cutY 8384 .full .full) (.cutY 8384 .full .full))) (.cutY 8320 .full .full)) .empty) .empty) .empty) .empty) .empty) .empty) .empty) (.cutY 10240 .empty (.cutX 23552 .empty (.cutY 11264 .empty (.cutX 24064 .empty (.cutY 11776 .empty (.cutX 24320 .empty (.cutY 12032 .empty (.cutX 24448 (.cutY 12160 .full (.cutX 24384 (.cutY 12224 .full .full) (.cutY 12224 .full .full))) (.cutY 12160 .full .full)))))))))) .empty))) .empty) .empty))

theorem metadata44 : 0<156512574 ∧ 32<128 ∧ 80<128 ∧ 1<4 ∧
    7312/4160=1 ∧ 7312%4160=3152 ∧ ∀ i, (leaves44 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData44).mp
    (by decide +kernel)

theorem sourceChecked44_0 : ∀ i : Fin 28,
    (fun i => output44 i = raw44 (source44 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked44 : ∀ i : Fin 28, (fun i => output44 i = raw44 (source44 i)) i :=
  forallFin_of_zero_offset (fun i => output44 i = raw44 (source44 i)) sourceChecked44_0

theorem coverChecked44_0 : ∀ i : Fin 28,
    (fun i => (output44 (cover44 i)).ContainsBox (raw44 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked44 : ∀ i : Fin 28, (fun i => (output44 (cover44 i)).ContainsBox (raw44 i)) i :=
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

noncomputable def phaseMass44 : ℝ := singlePhaseMass (156512574/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw44 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass44_eq : phaseMass44 = (78256287/819200000000 : ℝ) := by
  unfold phaseMass44
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw44 output44 cover44 source44
    (gridTreeUnionCheck_sound 32768 raw44 output44 cover44 source44 tree44 checked44)
    _ (by norm_num) _, areaUnits44]
  norm_num

-- Frozen phase 5392, atom 3455, type 0, source (37,88).
def leavesData45 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves45 : Fin 7 → DyadicLeaf := leavesData45.get
def raw45 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 37 88 leaves45 i
def outputData45 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨9472,9600,22528,22656⟩) (.node (.single ⟨9472,9600,22656,22784⟩) (.single ⟨9600,9664,22528,22592⟩))) (.node (.node (.single ⟨9600,9664,22592,22656⟩) (.single ⟨9664,9728,22528,22592⟩)) (.node (.single ⟨9664,9728,22592,22656⟩) (.single ⟨9600,9728,22656,22784⟩)))) (.node (.node (.single ⟨9984,10112,23040,23168⟩) (.node (.single ⟨9984,10112,23168,23296⟩) (.single ⟨10112,10176,23040,23104⟩))) (.node (.node (.single ⟨10112,10176,23104,23168⟩) (.single ⟨10176,10240,23040,23104⟩)) (.node (.single ⟨10176,10240,23104,23168⟩) (.single ⟨10112,10240,23168,23296⟩))))) (.node (.node (.node (.single ⟨22528,22656,9472,9600⟩) (.node (.single ⟨22528,22592,9600,9664⟩) (.single ⟨22528,22592,9664,9728⟩))) (.node (.node (.single ⟨22592,22656,9600,9664⟩) (.single ⟨22592,22656,9664,9728⟩)) (.node (.single ⟨22656,22784,9472,9600⟩) (.single ⟨22656,22784,9600,9728⟩)))) (.node (.node (.single ⟨23040,23168,9984,10112⟩) (.node (.single ⟨23040,23104,10112,10176⟩) (.single ⟨23040,23104,10176,10240⟩))) (.node (.node (.single ⟨23104,23168,10112,10176⟩) (.single ⟨23104,23168,10176,10240⟩)) (.node (.single ⟨23168,23296,9984,10112⟩) (.single ⟨23168,23296,10112,10240⟩))))))
def output45 : Fin 28 → GridBox := outputData45.get
def coverData45 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData45 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover45 (i : Fin 28) : Fin 28 := ⟨coverData45.get i % 28, Nat.mod_lt _ (by decide)⟩
def source45 (i : Fin 28) : Fin 28 := ⟨sourceData45.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree45 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 .empty (.cutX 9216 .empty (.cutY 23552 (.cutX 9728 (.cutY 23040 (.cutX 9472 .empty (.cutY 22784 (.cutX 9600 (.cutY 22656 .full .full) (.cutY 22656 (.cutX 9664 (.cutY 22592 .full .full) (.cutY 22592 .full .full)) .full)) .empty)) .empty) (.cutY 23040 .empty (.cutX 9984 .empty (.cutY 23296 (.cutX 10112 (.cutY 23168 .full .full) (.cutY 23168 (.cutX 10176 (.cutY 23104 .full .full) (.cutY 23104 .full .full)) .full)) .empty)))) .empty))) .empty)) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 .empty (.cutY 10240 (.cutX 23552 (.cutY 9216 .empty (.cutX 23040 (.cutY 9728 (.cutX 22784 (.cutY 9472 .empty (.cutX 22656 (.cutY 9600 .full (.cutX 22592 (.cutY 9664 .full .full) (.cutY 9664 .full .full))) (.cutY 9600 .full .full))) .empty) .empty) (.cutY 9728 .empty (.cutX 23296 (.cutY 9984 .empty (.cutX 23168 (.cutY 10112 .full (.cutX 23104 (.cutY 10176 .full .full) (.cutY 10176 .full .full))) (.cutY 10112 .full .full))) .empty)))) .empty) .empty)) .empty))) .empty) .empty))

theorem metadata45 : 0<75538780 ∧ 37<128 ∧ 88<128 ∧ 0<4 ∧
    3455/4160=0 ∧ 3455%4160=3455 ∧ ∀ i, (leaves45 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData45).mp
    (by decide +kernel)

theorem sourceChecked45_0 : ∀ i : Fin 28,
    (fun i => output45 i = raw45 (source45 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked45 : ∀ i : Fin 28, (fun i => output45 i = raw45 (source45 i)) i :=
  forallFin_of_zero_offset (fun i => output45 i = raw45 (source45 i)) sourceChecked45_0

theorem coverChecked45_0 : ∀ i : Fin 28,
    (fun i => (output45 (cover45 i)).ContainsBox (raw45 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked45 : ∀ i : Fin 28, (fun i => (output45 (cover45 i)).ContainsBox (raw45 i)) i :=
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

noncomputable def phaseMass45 : ℝ := singlePhaseMass (75538780/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw45 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass45_eq : phaseMass45 = (3776939/81920000000 : ℝ) := by
  unfold phaseMass45
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw45 output45 cover45 source45
    (gridTreeUnionCheck_sound 32768 raw45 output45 cover45 source45 tree45 checked45)
    _ (by norm_num) _, areaUnits45]
  norm_num

-- Frozen phase 5393, atom 1025, type 0, source (8,65).
def leavesData46 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves46 : Fin 7 → DyadicLeaf := leavesData46.get
def raw46 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 8 65 leaves46 i
def outputData46 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨2048,2176,16640,16768⟩) (.node (.single ⟨2048,2176,16768,16896⟩) (.single ⟨2176,2240,16640,16704⟩))) (.node (.node (.single ⟨2176,2240,16704,16768⟩) (.single ⟨2240,2304,16640,16704⟩)) (.node (.single ⟨2240,2304,16704,16768⟩) (.single ⟨2176,2304,16768,16896⟩)))) (.node (.node (.single ⟨15872,16000,30464,30592⟩) (.node (.single ⟨15872,16000,30592,30720⟩) (.single ⟨16000,16064,30464,30528⟩))) (.node (.node (.single ⟨16000,16064,30528,30592⟩) (.single ⟨16064,16128,30464,30528⟩)) (.node (.single ⟨16064,16128,30528,30592⟩) (.single ⟨16000,16128,30592,30720⟩))))) (.node (.node (.node (.single ⟨16640,16768,2048,2176⟩) (.node (.single ⟨16640,16704,2176,2240⟩) (.single ⟨16640,16704,2240,2304⟩))) (.node (.node (.single ⟨16704,16768,2176,2240⟩) (.single ⟨16704,16768,2240,2304⟩)) (.node (.single ⟨16768,16896,2048,2176⟩) (.single ⟨16768,16896,2176,2304⟩)))) (.node (.node (.single ⟨30464,30592,15872,16000⟩) (.node (.single ⟨30464,30528,16000,16064⟩) (.single ⟨30464,30528,16064,16128⟩))) (.node (.node (.single ⟨30528,30592,16000,16064⟩) (.single ⟨30528,30592,16064,16128⟩)) (.node (.single ⟨30592,30720,15872,16000⟩) (.single ⟨30592,30720,16000,16128⟩))))))
def output46 : Fin 28 → GridBox := outputData46.get
def coverData46 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData46 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover46 (i : Fin 28) : Fin 28 := ⟨coverData46.get i % 28, Nat.mod_lt _ (by decide)⟩
def source46 (i : Fin 28) : Fin 28 := ⟨sourceData46.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree46 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 (.cutX 3072 (.cutY 17408 (.cutX 2560 (.cutY 16896 (.cutX 2304 (.cutY 16640 .empty (.cutX 2176 (.cutY 16768 .full .full) (.cutY 16768 (.cutX 2240 (.cutY 16704 .full .full) (.cutY 16704 .full .full)) .full))) .empty) .empty) .empty) .empty) .empty) .empty)) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 (.cutX 15360 .empty (.cutY 29696 .empty (.cutX 15872 .empty (.cutY 30208 .empty (.cutX 16128 (.cutY 30464 .empty (.cutX 16000 (.cutY 30592 .full .full) (.cutY 30592 (.cutX 16064 (.cutY 30528 .full .full) (.cutY 30528 .full .full)) .full))) .empty))))) .empty))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 .empty (.cutX 17408 (.cutY 3072 (.cutX 16896 (.cutY 2560 (.cutX 16640 .empty (.cutY 2304 (.cutX 16768 (.cutY 2176 .full (.cutX 16704 (.cutY 2240 .full .full) (.cutY 2240 .full .full))) (.cutY 2176 .full .full)) .empty)) .empty) .empty) .empty) .empty)) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 .empty (.cutX 29696 .empty (.cutY 15360 .empty (.cutX 30208 .empty (.cutY 15872 .empty (.cutX 30464 .empty (.cutY 16128 (.cutX 30592 (.cutY 16000 .full (.cutX 30528 (.cutY 16064 .full .full) (.cutY 16064 .full .full))) (.cutY 16000 .full .full)) .empty))))))) .empty))))) .empty))

theorem metadata46 : 0<67702166 ∧ 8<128 ∧ 65<128 ∧ 0<4 ∧
    1025/4160=0 ∧ 1025%4160=1025 ∧ ∀ i, (leaves46 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData46).mp
    (by decide +kernel)

theorem sourceChecked46_0 : ∀ i : Fin 28,
    (fun i => output46 i = raw46 (source46 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked46 : ∀ i : Fin 28, (fun i => output46 i = raw46 (source46 i)) i :=
  forallFin_of_zero_offset (fun i => output46 i = raw46 (source46 i)) sourceChecked46_0

theorem coverChecked46_0 : ∀ i : Fin 28,
    (fun i => (output46 (cover46 i)).ContainsBox (raw46 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked46 : ∀ i : Fin 28, (fun i => (output46 (cover46 i)).ContainsBox (raw46 i)) i :=
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

noncomputable def phaseMass46 : ℝ := singlePhaseMass (67702166/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw46 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass46_eq : phaseMass46 = (33851083/819200000000 : ℝ) := by
  unfold phaseMass46
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw46 output46 cover46 source46
    (gridTreeUnionCheck_sound 32768 raw46 output46 cover46 source46 tree46 checked46)
    _ (by norm_num) _, areaUnits46]
  norm_num

-- Frozen phase 5394, atom 796, type 0, source (6,64).
def leavesData47 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩)))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩)))))
def leaves47 : Fin 10 → DyadicLeaf := leavesData47.get
def raw47 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 6 64 leaves47 i
def outputData47 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨1536,1600,16384,16448⟩) (.single ⟨1536,1600,16448,16512⟩)) (.node (.single ⟨1600,1664,16384,16448⟩) (.node (.single ⟨1600,1664,16448,16512⟩) (.single ⟨1536,1664,16512,16640⟩)))) (.node (.node (.single ⟨1664,1728,16384,16448⟩) (.single ⟨1664,1728,16448,16512⟩)) (.node (.single ⟨1728,1792,16384,16448⟩) (.node (.single ⟨1728,1792,16448,16512⟩) (.single ⟨1664,1792,16512,16640⟩))))) (.node (.node (.node (.single ⟨16128,16256,30976,31104⟩) (.single ⟨16128,16256,31104,31232⟩)) (.node (.single ⟨16256,16320,30976,31040⟩) (.node (.single ⟨16256,16320,31040,31104⟩) (.single ⟨16320,16384,30976,31040⟩)))) (.node (.node (.single ⟨16320,16384,31040,31104⟩) (.single ⟨16256,16320,31104,31168⟩)) (.node (.single ⟨16256,16320,31168,31232⟩) (.node (.single ⟨16320,16384,31104,31168⟩) (.single ⟨16320,16384,31168,31232⟩)))))) (.node (.node (.node (.node (.single ⟨16384,16448,1536,1600⟩) (.single ⟨16384,16448,1600,1664⟩)) (.node (.single ⟨16448,16512,1536,1600⟩) (.node (.single ⟨16448,16512,1600,1664⟩) (.single ⟨16384,16448,1664,1728⟩)))) (.node (.node (.single ⟨16384,16448,1728,1792⟩) (.single ⟨16448,16512,1664,1728⟩)) (.node (.single ⟨16448,16512,1728,1792⟩) (.node (.single ⟨16512,16640,1536,1664⟩) (.single ⟨16512,16640,1664,1792⟩))))) (.node (.node (.node (.single ⟨30976,31104,16128,16256⟩) (.single ⟨30976,31040,16256,16320⟩)) (.node (.single ⟨30976,31040,16320,16384⟩) (.node (.single ⟨31040,31104,16256,16320⟩) (.single ⟨31040,31104,16320,16384⟩)))) (.node (.node (.single ⟨31104,31232,16128,16256⟩) (.single ⟨31104,31168,16256,16320⟩)) (.node (.single ⟨31104,31168,16320,16384⟩) (.node (.single ⟨31168,31232,16256,16320⟩) (.single ⟨31168,31232,16320,16384⟩)))))))
def output47 : Fin 40 → GridBox := outputData47.get
def coverData47 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 0) (.single 20))))) (.node (.node (.node (.single 39) (.single 19)) (.node (.single 1) (.node (.single 22) (.single 38)))) (.node (.node (.single 17) (.single 2)) (.node (.single 21) (.node (.single 37) (.single 18)))))) (.node (.node (.node (.node (.single 3) (.single 23)) (.node (.single 36) (.node (.single 16) (.single 5)))) (.node (.node (.single 24) (.single 34)) (.node (.single 15) (.node (.single 6) (.single 26))))) (.node (.node (.node (.single 33) (.single 13)) (.node (.single 7) (.node (.single 25) (.single 32)))) (.node (.node (.single 14) (.single 8)) (.node (.single 27) (.node (.single 31) (.single 12)))))))
def sourceData47 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 0)))) (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 39) (.node (.single 31) (.single 35)))) (.node (.node (.single 27) (.single 23)) (.node (.single 15) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.node (.single 21) (.single 25)))) (.node (.node (.single 33) (.single 29)) (.node (.single 37) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))) (.node (.node (.single 2) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))))))
def cover47 (i : Fin 40) : Fin 40 := ⟨coverData47.get i % 40, Nat.mod_lt _ (by decide)⟩
def source47 (i : Fin 40) : Fin 40 := ⟨sourceData47.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree47 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 (.cutX 1024 .empty (.cutY 17408 (.cutX 1536 .empty (.cutY 16896 (.cutX 1792 (.cutY 16640 (.cutX 1664 (.cutY 16512 (.cutX 1600 (.cutY 16448 .full .full) (.cutY 16448 .full .full)) .full) (.cutY 16512 (.cutX 1728 (.cutY 16448 .full .full) (.cutY 16448 .full .full)) .full)) .empty) .empty) .empty)) .empty)) .empty) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 .empty (.cutX 15360 .empty (.cutY 31744 (.cutX 15872 .empty (.cutY 31232 (.cutX 16128 .empty (.cutY 30976 .empty (.cutX 16256 (.cutY 31104 .full .full) (.cutY 31104 (.cutX 16320 (.cutY 31040 .full .full) (.cutY 31040 .full .full)) (.cutX 16320 (.cutY 31168 .full .full) (.cutY 31168 .full .full)))))) .empty)) .empty))))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 (.cutX 17408 (.cutY 1024 .empty (.cutX 16896 (.cutY 1536 .empty (.cutX 16640 (.cutY 1792 (.cutX 16512 (.cutY 1664 (.cutX 16448 (.cutY 1600 .full .full) (.cutY 1600 .full .full)) (.cutX 16448 (.cutY 1728 .full .full) (.cutY 1728 .full .full))) (.cutY 1664 .full .full)) .empty) .empty)) .empty)) .empty) .empty) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 .empty (.cutX 31744 (.cutY 15360 .empty (.cutX 31232 (.cutY 15872 .empty (.cutX 30976 .empty (.cutY 16128 .empty (.cutX 31104 (.cutY 16256 .full (.cutX 31040 (.cutY 16320 .full .full) (.cutY 16320 .full .full))) (.cutY 16256 .full (.cutX 31168 (.cutY 16320 .full .full) (.cutY 16320 .full .full))))))) .empty)) .empty))))))) .empty))

theorem metadata47 : 0<114037843 ∧ 6<128 ∧ 64<128 ∧ 0<4 ∧
    796/4160=0 ∧ 796%4160=796 ∧ ∀ i, (leaves47 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData47).mp
    (by decide +kernel)

theorem sourceChecked47_0 : ∀ i : Fin 40,
    (fun i => output47 i = raw47 (source47 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked47 : ∀ i : Fin 40, (fun i => output47 i = raw47 (source47 i)) i :=
  forallFin_of_zero_offset (fun i => output47 i = raw47 (source47 i)) sourceChecked47_0

theorem coverChecked47_0 : ∀ i : Fin 40,
    (fun i => (output47 (cover47 i)).ContainsBox (raw47 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked47 : ∀ i : Fin 40, (fun i => (output47 (cover47 i)).ContainsBox (raw47 i)) i :=
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

noncomputable def phaseMass47 : ℝ := singlePhaseMass (114037843/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw47 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass47_eq : phaseMass47 = (114037843/1638400000000 : ℝ) := by
  unfold phaseMass47
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw47 output47 cover47 source47
    (gridTreeUnionCheck_sound 32768 raw47 output47 cover47 source47 tree47 checked47)
    _ (by norm_num) _, areaUnits47]
  norm_num

-- Frozen phase 5395, atom 7376, type 1, source (33,81).
def leavesData48 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves48 : Fin 7 → DyadicLeaf := leavesData48.get
def raw48 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 33 81 leaves48 i
def outputData48 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨8448,8576,20736,20864⟩) (.node (.single ⟨8448,8576,20864,20992⟩) (.single ⟨8576,8640,20736,20800⟩))) (.node (.node (.single ⟨8576,8640,20800,20864⟩) (.single ⟨8640,8704,20736,20800⟩)) (.node (.single ⟨8640,8704,20800,20864⟩) (.single ⟨8576,8704,20864,20992⟩)))) (.node (.node (.single ⟨11776,11904,24064,24192⟩) (.node (.single ⟨11776,11904,24192,24320⟩) (.single ⟨11904,11968,24064,24128⟩))) (.node (.node (.single ⟨11904,11968,24128,24192⟩) (.single ⟨11968,12032,24064,24128⟩)) (.node (.single ⟨11968,12032,24128,24192⟩) (.single ⟨11904,12032,24192,24320⟩))))) (.node (.node (.node (.single ⟨20736,20864,8448,8576⟩) (.node (.single ⟨20736,20800,8576,8640⟩) (.single ⟨20736,20800,8640,8704⟩))) (.node (.node (.single ⟨20800,20864,8576,8640⟩) (.single ⟨20800,20864,8640,8704⟩)) (.node (.single ⟨20864,20992,8448,8576⟩) (.single ⟨20864,20992,8576,8704⟩)))) (.node (.node (.single ⟨24064,24192,11776,11904⟩) (.node (.single ⟨24064,24128,11904,11968⟩) (.single ⟨24064,24128,11968,12032⟩))) (.node (.node (.single ⟨24128,24192,11904,11968⟩) (.single ⟨24128,24192,11968,12032⟩)) (.node (.single ⟨24192,24320,11776,11904⟩) (.single ⟨24192,24320,11904,12032⟩))))))
def output48 : Fin 28 → GridBox := outputData48.get
def coverData48 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData48 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover48 (i : Fin 28) : Fin 28 := ⟨coverData48.get i % 28, Nat.mod_lt _ (by decide)⟩
def source48 (i : Fin 28) : Fin 28 := ⟨sourceData48.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree48 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 (.cutX 9216 (.cutY 21504 (.cutX 8704 (.cutY 20992 (.cutX 8448 .empty (.cutY 20736 .empty (.cutX 8576 (.cutY 20864 .full .full) (.cutY 20864 (.cutX 8640 (.cutY 20800 .full .full) (.cutY 20800 .full .full)) .full)))) .empty) .empty) .empty) .empty) .empty) (.cutY 22528 .empty (.cutX 11264 .empty (.cutY 23552 .empty (.cutX 11776 .empty (.cutY 24064 .empty (.cutX 12032 (.cutY 24320 (.cutX 11904 (.cutY 24192 .full .full) (.cutY 24192 (.cutX 11968 (.cutY 24128 .full .full) (.cutY 24128 .full .full)) .full)) .empty) .empty)))))))) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 (.cutY 10240 (.cutX 21504 (.cutY 9216 (.cutX 20992 (.cutY 8704 (.cutX 20736 .empty (.cutY 8448 .empty (.cutX 20864 (.cutY 8576 .full (.cutX 20800 (.cutY 8640 .full .full) (.cutY 8640 .full .full))) (.cutY 8576 .full .full)))) .empty) .empty) .empty) .empty) .empty) (.cutY 10240 .empty (.cutX 23552 .empty (.cutY 11264 .empty (.cutX 24064 .empty (.cutY 11776 .empty (.cutX 24320 (.cutY 12032 (.cutX 24192 (.cutY 11904 .full (.cutX 24128 (.cutY 11968 .full .full) (.cutY 11968 .full .full))) (.cutY 11904 .full .full)) .empty) .empty))))))) .empty))) .empty) .empty))

theorem metadata48 : 0<156512574 ∧ 33<128 ∧ 81<128 ∧ 1<4 ∧
    7376/4160=1 ∧ 7376%4160=3216 ∧ ∀ i, (leaves48 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData48).mp
    (by decide +kernel)

theorem sourceChecked48_0 : ∀ i : Fin 28,
    (fun i => output48 i = raw48 (source48 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked48 : ∀ i : Fin 28, (fun i => output48 i = raw48 (source48 i)) i :=
  forallFin_of_zero_offset (fun i => output48 i = raw48 (source48 i)) sourceChecked48_0

theorem coverChecked48_0 : ∀ i : Fin 28,
    (fun i => (output48 (cover48 i)).ContainsBox (raw48 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked48 : ∀ i : Fin 28, (fun i => (output48 (cover48 i)).ContainsBox (raw48 i)) i :=
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

noncomputable def phaseMass48 : ℝ := singlePhaseMass (156512574/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw48 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass48_eq : phaseMass48 = (78256287/819200000000 : ℝ) := by
  unfold phaseMass48
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw48 output48 cover48 source48
    (gridTreeUnionCheck_sound 32768 raw48 output48 cover48 source48 tree48 checked48)
    _ (by norm_num) _, areaUnits48]
  norm_num

-- Frozen phase 5396, atom 7665, type 1, source (38,85).
def leavesData49 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves49 : Fin 7 → DyadicLeaf := leavesData49.get
def raw49 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 38 85 leaves49 i
def outputData49 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨9728,9856,21760,21888⟩) (.node (.single ⟨9728,9856,21888,22016⟩) (.single ⟨9856,9920,21760,21824⟩))) (.node (.node (.single ⟨9856,9920,21824,21888⟩) (.single ⟨9920,9984,21760,21824⟩)) (.node (.single ⟨9920,9984,21824,21888⟩) (.single ⟨9856,9984,21888,22016⟩)))) (.node (.node (.single ⟨10752,10880,22784,22912⟩) (.node (.single ⟨10752,10880,22912,23040⟩) (.single ⟨10880,10944,22784,22848⟩))) (.node (.node (.single ⟨10880,10944,22848,22912⟩) (.single ⟨10944,11008,22784,22848⟩)) (.node (.single ⟨10944,11008,22848,22912⟩) (.single ⟨10880,11008,22912,23040⟩))))) (.node (.node (.node (.single ⟨21760,21888,9728,9856⟩) (.node (.single ⟨21760,21824,9856,9920⟩) (.single ⟨21760,21824,9920,9984⟩))) (.node (.node (.single ⟨21824,21888,9856,9920⟩) (.single ⟨21824,21888,9920,9984⟩)) (.node (.single ⟨21888,22016,9728,9856⟩) (.single ⟨21888,22016,9856,9984⟩)))) (.node (.node (.single ⟨22784,22912,10752,10880⟩) (.node (.single ⟨22784,22848,10880,10944⟩) (.single ⟨22784,22848,10944,11008⟩))) (.node (.node (.single ⟨22848,22912,10880,10944⟩) (.single ⟨22848,22912,10944,11008⟩)) (.node (.single ⟨22912,23040,10752,10880⟩) (.single ⟨22912,23040,10880,11008⟩))))))
def output49 : Fin 28 → GridBox := outputData49.get
def coverData49 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData49 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover49 (i : Fin 28) : Fin 28 := ⟨coverData49.get i % 28, Nat.mod_lt _ (by decide)⟩
def source49 (i : Fin 28) : Fin 28 := ⟨sourceData49.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree49 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 (.cutX 9216 .empty (.cutY 21504 .empty (.cutX 9728 .empty (.cutY 22016 (.cutX 9984 (.cutY 21760 .empty (.cutX 9856 (.cutY 21888 .full .full) (.cutY 21888 (.cutX 9920 (.cutY 21824 .full .full) (.cutY 21824 .full .full)) .full))) .empty) .empty)))) .empty) (.cutY 22528 .empty (.cutX 11264 (.cutY 23552 (.cutX 10752 .empty (.cutY 23040 (.cutX 11008 (.cutY 22784 .empty (.cutX 10880 (.cutY 22912 .full .full) (.cutY 22912 (.cutX 10944 (.cutY 22848 .full .full) (.cutY 22848 .full .full)) .full))) .empty) .empty)) .empty) .empty)))) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 (.cutY 10240 (.cutX 21504 .empty (.cutY 9216 .empty (.cutX 22016 (.cutY 9728 .empty (.cutX 21760 .empty (.cutY 9984 (.cutX 21888 (.cutY 9856 .full (.cutX 21824 (.cutY 9920 .full .full) (.cutY 9920 .full .full))) (.cutY 9856 .full .full)) .empty))) .empty))) .empty) (.cutY 10240 .empty (.cutX 23552 (.cutY 11264 (.cutX 23040 (.cutY 10752 .empty (.cutX 22784 .empty (.cutY 11008 (.cutX 22912 (.cutY 10880 .full (.cutX 22848 (.cutY 10944 .full .full) (.cutY 10944 .full .full))) (.cutY 10880 .full .full)) .empty))) .empty) .empty) .empty))) .empty))) .empty) .empty))

theorem metadata49 : 0<156512574 ∧ 38<128 ∧ 85<128 ∧ 1<4 ∧
    7665/4160=1 ∧ 7665%4160=3505 ∧ ∀ i, (leaves49 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData49).mp
    (by decide +kernel)

theorem sourceChecked49_0 : ∀ i : Fin 28,
    (fun i => output49 i = raw49 (source49 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked49 : ∀ i : Fin 28, (fun i => output49 i = raw49 (source49 i)) i :=
  forallFin_of_zero_offset (fun i => output49 i = raw49 (source49 i)) sourceChecked49_0

theorem coverChecked49_0 : ∀ i : Fin 28,
    (fun i => (output49 (cover49 i)).ContainsBox (raw49 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked49 : ∀ i : Fin 28, (fun i => (output49 (cover49 i)).ContainsBox (raw49 i)) i :=
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

noncomputable def phaseMass49 : ℝ := singlePhaseMass (156512574/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw49 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass49_eq : phaseMass49 = (78256287/819200000000 : ℝ) := by
  unfold phaseMass49
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw49 output49 cover49 source49
    (gridTreeUnionCheck_sound 32768 raw49 output49 cover49 source49 tree49 checked49)
    _ (by norm_num) _, areaUnits49]
  norm_num

-- Frozen phase 5397, atom 1563, type 0, source (13,68).
def leavesData50 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves50 : Fin 10 → DyadicLeaf := leavesData50.get
def raw50 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 13 68 leaves50 i
def outputData50 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨3328,3392,17408,17472⟩) (.single ⟨3328,3392,17472,17536⟩)) (.node (.single ⟨3392,3456,17408,17472⟩) (.node (.single ⟨3392,3456,17472,17536⟩) (.single ⟨3328,3456,17536,17664⟩)))) (.node (.node (.single ⟨3456,3520,17408,17472⟩) (.single ⟨3456,3520,17472,17536⟩)) (.node (.single ⟨3520,3584,17408,17472⟩) (.node (.single ⟨3520,3584,17472,17536⟩) (.single ⟨3456,3584,17536,17664⟩))))) (.node (.node (.node (.single ⟨15104,15232,29184,29312⟩) (.single ⟨15104,15232,29312,29440⟩)) (.node (.single ⟨15232,15296,29184,29248⟩) (.node (.single ⟨15232,15296,29248,29312⟩) (.single ⟨15296,15360,29184,29248⟩)))) (.node (.node (.single ⟨15296,15360,29248,29312⟩) (.single ⟨15232,15296,29312,29376⟩)) (.node (.single ⟨15232,15296,29376,29440⟩) (.node (.single ⟨15296,15360,29312,29376⟩) (.single ⟨15296,15360,29376,29440⟩)))))) (.node (.node (.node (.node (.single ⟨17408,17472,3328,3392⟩) (.single ⟨17408,17472,3392,3456⟩)) (.node (.single ⟨17472,17536,3328,3392⟩) (.node (.single ⟨17472,17536,3392,3456⟩) (.single ⟨17408,17472,3456,3520⟩)))) (.node (.node (.single ⟨17408,17472,3520,3584⟩) (.single ⟨17472,17536,3456,3520⟩)) (.node (.single ⟨17472,17536,3520,3584⟩) (.node (.single ⟨17536,17664,3328,3456⟩) (.single ⟨17536,17664,3456,3584⟩))))) (.node (.node (.node (.single ⟨29184,29312,15104,15232⟩) (.single ⟨29184,29248,15232,15296⟩)) (.node (.single ⟨29184,29248,15296,15360⟩) (.node (.single ⟨29248,29312,15232,15296⟩) (.single ⟨29248,29312,15296,15360⟩)))) (.node (.node (.single ⟨29312,29440,15104,15232⟩) (.single ⟨29312,29376,15232,15296⟩)) (.node (.single ⟨29312,29376,15296,15360⟩) (.node (.single ⟨29376,29440,15232,15296⟩) (.single ⟨29376,29440,15296,15360⟩)))))))
def output50 : Fin 40 → GridBox := outputData50.get
def coverData50 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData50 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover50 (i : Fin 40) : Fin 40 := ⟨coverData50.get i % 40, Nat.mod_lt _ (by decide)⟩
def source50 (i : Fin 40) : Fin 40 := ⟨sourceData50.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree50 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 (.cutX 3072 .empty (.cutY 17408 .empty (.cutX 3584 (.cutY 17920 (.cutX 3328 .empty (.cutY 17664 (.cutX 3456 (.cutY 17536 (.cutX 3392 (.cutY 17472 .full .full) (.cutY 17472 .full .full)) .full) (.cutY 17536 (.cutX 3520 (.cutY 17472 .full .full) (.cutY 17472 .full .full)) .full)) .empty)) .empty) .empty))) .empty)) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 (.cutX 15360 (.cutY 29696 (.cutX 14848 .empty (.cutY 29184 .empty (.cutX 15104 .empty (.cutY 29440 (.cutX 15232 (.cutY 29312 .full .full) (.cutY 29312 (.cutX 15296 (.cutY 29248 .full .full) (.cutY 29248 .full .full)) (.cutX 15296 (.cutY 29376 .full .full) (.cutY 29376 .full .full)))) .empty)))) .empty) .empty) .empty))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 .empty (.cutX 17408 .empty (.cutY 3072 .empty (.cutX 17920 (.cutY 3584 (.cutX 17664 (.cutY 3328 .empty (.cutX 17536 (.cutY 3456 (.cutX 17472 (.cutY 3392 .full .full) (.cutY 3392 .full .full)) (.cutX 17472 (.cutY 3520 .full .full) (.cutY 3520 .full .full))) (.cutY 3456 .full .full))) .empty) .empty) .empty)))) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 .empty (.cutX 29696 (.cutY 15360 (.cutX 29184 .empty (.cutY 14848 .empty (.cutX 29440 (.cutY 15104 .empty (.cutX 29312 (.cutY 15232 .full (.cutX 29248 (.cutY 15296 .full .full) (.cutY 15296 .full .full))) (.cutY 15232 .full (.cutX 29376 (.cutY 15296 .full .full) (.cutY 15296 .full .full))))) .empty))) .empty) .empty)) .empty))))) .empty))

theorem metadata50 : 0<67702166 ∧ 13<128 ∧ 68<128 ∧ 0<4 ∧
    1563/4160=0 ∧ 1563%4160=1563 ∧ ∀ i, (leaves50 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData50).mp
    (by decide +kernel)

theorem sourceChecked50_0 : ∀ i : Fin 40,
    (fun i => output50 i = raw50 (source50 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked50 : ∀ i : Fin 40, (fun i => output50 i = raw50 (source50 i)) i :=
  forallFin_of_zero_offset (fun i => output50 i = raw50 (source50 i)) sourceChecked50_0

theorem coverChecked50_0 : ∀ i : Fin 40,
    (fun i => (output50 (cover50 i)).ContainsBox (raw50 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked50 : ∀ i : Fin 40, (fun i => (output50 (cover50 i)).ContainsBox (raw50 i)) i :=
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

noncomputable def phaseMass50 : ℝ := singlePhaseMass (67702166/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw50 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass50_eq : phaseMass50 = (33851083/819200000000 : ℝ) := by
  unfold phaseMass50
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw50 output50 cover50 source50
    (gridTreeUnionCheck_sound 32768 raw50 output50 cover50 source50 tree50 checked50)
    _ (by norm_num) _, areaUnits50]
  norm_num

-- Frozen phase 5398, atom 6478, type 1, source (21,71).
def leavesData51 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves51 : Fin 13 → DyadicLeaf := leavesData51.get
def raw51 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 21 71 leaves51 i
def outputData51 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨5376,5440,18176,18240⟩) (.node (.single ⟨5376,5440,18240,18304⟩) (.single ⟨5440,5504,18176,18240⟩))) (.node (.single ⟨5440,5504,18240,18304⟩) (.node (.single ⟨5376,5504,18304,18432⟩) (.single ⟨5504,5568,18176,18240⟩)))) (.node (.node (.single ⟨5504,5568,18240,18304⟩) (.node (.single ⟨5568,5600,18176,18208⟩) (.single ⟨5568,5600,18208,18240⟩))) (.node (.node (.single ⟨5600,5632,18176,18208⟩) (.single ⟨5600,5632,18208,18240⟩)) (.node (.single ⟨5568,5632,18240,18304⟩) (.single ⟨5504,5632,18304,18432⟩))))) (.node (.node (.node (.single ⟨14336,14464,27136,27264⟩) (.node (.single ⟨14336,14464,27264,27392⟩) (.single ⟨14464,14528,27136,27200⟩))) (.node (.single ⟨14464,14528,27200,27264⟩) (.node (.single ⟨14528,14560,27136,27168⟩) (.single ⟨14528,14560,27168,27200⟩)))) (.node (.node (.single ⟨14560,14592,27136,27168⟩) (.node (.single ⟨14560,14592,27168,27200⟩) (.single ⟨14528,14592,27200,27264⟩))) (.node (.node (.single ⟨14464,14528,27264,27328⟩) (.single ⟨14464,14528,27328,27392⟩)) (.node (.single ⟨14528,14592,27264,27328⟩) (.single ⟨14528,14592,27328,27392⟩)))))) (.node (.node (.node (.node (.single ⟨18176,18240,5376,5440⟩) (.node (.single ⟨18176,18240,5440,5504⟩) (.single ⟨18240,18304,5376,5440⟩))) (.node (.single ⟨18240,18304,5440,5504⟩) (.node (.single ⟨18176,18240,5504,5568⟩) (.single ⟨18176,18208,5568,5600⟩)))) (.node (.node (.single ⟨18176,18208,5600,5632⟩) (.node (.single ⟨18208,18240,5568,5600⟩) (.single ⟨18208,18240,5600,5632⟩))) (.node (.node (.single ⟨18240,18304,5504,5568⟩) (.single ⟨18240,18304,5568,5632⟩)) (.node (.single ⟨18304,18432,5376,5504⟩) (.single ⟨18304,18432,5504,5632⟩))))) (.node (.node (.node (.single ⟨27136,27264,14336,14464⟩) (.node (.single ⟨27136,27200,14464,14528⟩) (.single ⟨27136,27168,14528,14560⟩))) (.node (.single ⟨27136,27168,14560,14592⟩) (.node (.single ⟨27168,27200,14528,14560⟩) (.single ⟨27168,27200,14560,14592⟩)))) (.node (.node (.single ⟨27200,27264,14464,14528⟩) (.node (.single ⟨27200,27264,14528,14592⟩) (.single ⟨27264,27392,14336,14464⟩))) (.node (.node (.single ⟨27264,27328,14464,14528⟩) (.single ⟨27264,27328,14528,14592⟩)) (.node (.single ⟨27328,27392,14464,14528⟩) (.single ⟨27328,27392,14528,14592⟩)))))))
def output51 : Fin 52 → GridBox := outputData51.get
def coverData51 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData51 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover51 (i : Fin 52) : Fin 52 := ⟨coverData51.get i % 52, Nat.mod_lt _ (by decide)⟩
def source51 (i : Fin 52) : Fin 52 := ⟨sourceData51.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree51 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 (.cutX 5120 .empty (.cutY 17408 .empty (.cutX 5632 (.cutY 17920 .empty (.cutX 5376 .empty (.cutY 18176 .empty (.cutX 5504 (.cutY 18304 (.cutX 5440 (.cutY 18240 .full .full) (.cutY 18240 .full .full)) .full) (.cutY 18304 (.cutX 5568 (.cutY 18240 .full .full) (.cutY 18240 (.cutX 5600 (.cutY 18208 .full .full) (.cutY 18208 .full .full)) .full)) .full))))) .empty))) .empty) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 .empty (.cutX 15360 (.cutY 27648 (.cutX 14848 (.cutY 27136 .empty (.cutX 14592 (.cutY 27392 (.cutX 14464 (.cutY 27264 .full .full) (.cutY 27264 (.cutX 14528 (.cutY 27200 .full .full) (.cutY 27200 (.cutX 14560 (.cutY 27168 .full .full) (.cutY 27168 .full .full)) .full)) (.cutX 14528 (.cutY 27328 .full .full) (.cutY 27328 .full .full)))) .empty) .empty)) .empty) .empty) .empty))) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 (.cutX 17408 .empty (.cutY 5120 .empty (.cutX 17920 .empty (.cutY 5632 (.cutX 18176 .empty (.cutY 5376 .empty (.cutX 18304 (.cutY 5504 (.cutX 18240 (.cutY 5440 .full .full) (.cutY 5440 .full .full)) (.cutX 18240 (.cutY 5568 .full (.cutX 18208 (.cutY 5600 .full .full) (.cutY 5600 .full .full))) (.cutY 5568 .full .full))) (.cutY 5504 .full .full)))) .empty)))) .empty) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 .empty (.cutX 27648 (.cutY 15360 (.cutX 27136 .empty (.cutY 14848 (.cutX 27392 (.cutY 14592 (.cutX 27264 (.cutY 14464 .full (.cutX 27200 (.cutY 14528 .full (.cutX 27168 (.cutY 14560 .full .full) (.cutY 14560 .full .full))) (.cutY 14528 .full .full))) (.cutY 14464 .full (.cutX 27328 (.cutY 14528 .full .full) (.cutY 14528 .full .full)))) .empty) .empty) .empty)) .empty) .empty)))) .empty))) .empty))

theorem metadata51 : 0<135260814 ∧ 21<128 ∧ 71<128 ∧ 1<4 ∧
    6478/4160=1 ∧ 6478%4160=2318 ∧ ∀ i, (leaves51 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData51).mp
    (by decide +kernel)

theorem sourceChecked51_0 : ∀ i : Fin 52,
    (fun i => output51 i = raw51 (source51 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked51 : ∀ i : Fin 52, (fun i => output51 i = raw51 (source51 i)) i :=
  forallFin_of_zero_offset (fun i => output51 i = raw51 (source51 i)) sourceChecked51_0

theorem coverChecked51_0 : ∀ i : Fin 52,
    (fun i => (output51 (cover51 i)).ContainsBox (raw51 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked51 : ∀ i : Fin 52, (fun i => (output51 (cover51 i)).ContainsBox (raw51 i)) i :=
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

noncomputable def phaseMass51 : ℝ := singlePhaseMass (135260814/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw51 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass51_eq : phaseMass51 = (67630407/819200000000 : ℝ) := by
  unfold phaseMass51
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw51 output51 cover51 source51
    (gridTreeUnionCheck_sound 32768 raw51 output51 cover51 source51 tree51 checked51)
    _ (by norm_num) _, areaUnits51]
  norm_num

-- Frozen phase 5399, atom 1665, type 0, source (14,69).
def leavesData52 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves52 : Fin 7 → DyadicLeaf := leavesData52.get
def raw52 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 14 69 leaves52 i
def outputData52 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3584,3712,17664,17792⟩) (.node (.single ⟨3584,3712,17792,17920⟩) (.single ⟨3712,3776,17664,17728⟩))) (.node (.node (.single ⟨3712,3776,17728,17792⟩) (.single ⟨3776,3840,17664,17728⟩)) (.node (.single ⟨3776,3840,17728,17792⟩) (.single ⟨3712,3840,17792,17920⟩)))) (.node (.node (.single ⟨14848,14976,28928,29056⟩) (.node (.single ⟨14848,14976,29056,29184⟩) (.single ⟨14976,15040,28928,28992⟩))) (.node (.node (.single ⟨14976,15040,28992,29056⟩) (.single ⟨15040,15104,28928,28992⟩)) (.node (.single ⟨15040,15104,28992,29056⟩) (.single ⟨14976,15104,29056,29184⟩))))) (.node (.node (.node (.single ⟨17664,17792,3584,3712⟩) (.node (.single ⟨17664,17728,3712,3776⟩) (.single ⟨17664,17728,3776,3840⟩))) (.node (.node (.single ⟨17728,17792,3712,3776⟩) (.single ⟨17728,17792,3776,3840⟩)) (.node (.single ⟨17792,17920,3584,3712⟩) (.single ⟨17792,17920,3712,3840⟩)))) (.node (.node (.single ⟨28928,29056,14848,14976⟩) (.node (.single ⟨28928,28992,14976,15040⟩) (.single ⟨28928,28992,15040,15104⟩))) (.node (.node (.single ⟨28992,29056,14976,15040⟩) (.single ⟨28992,29056,15040,15104⟩)) (.node (.single ⟨29056,29184,14848,14976⟩) (.single ⟨29056,29184,14976,15104⟩))))))
def output52 : Fin 28 → GridBox := outputData52.get
def coverData52 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData52 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover52 (i : Fin 28) : Fin 28 := ⟨coverData52.get i % 28, Nat.mod_lt _ (by decide)⟩
def source52 (i : Fin 28) : Fin 28 := ⟨sourceData52.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree52 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 (.cutX 3072 .empty (.cutY 17408 .empty (.cutX 3584 .empty (.cutY 17920 (.cutX 3840 (.cutY 17664 .empty (.cutX 3712 (.cutY 17792 .full .full) (.cutY 17792 (.cutX 3776 (.cutY 17728 .full .full) (.cutY 17728 .full .full)) .full))) .empty) .empty)))) .empty)) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 (.cutX 15360 (.cutY 29696 (.cutX 14848 .empty (.cutY 29184 (.cutX 15104 (.cutY 28928 .empty (.cutX 14976 (.cutY 29056 .full .full) (.cutY 29056 (.cutX 15040 (.cutY 28992 .full .full) (.cutY 28992 .full .full)) .full))) .empty) .empty)) .empty) .empty) .empty))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 .empty (.cutX 17408 .empty (.cutY 3072 .empty (.cutX 17920 (.cutY 3584 .empty (.cutX 17664 .empty (.cutY 3840 (.cutX 17792 (.cutY 3712 .full (.cutX 17728 (.cutY 3776 .full .full) (.cutY 3776 .full .full))) (.cutY 3712 .full .full)) .empty))) .empty)))) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 .empty (.cutX 29696 (.cutY 15360 (.cutX 29184 (.cutY 14848 .empty (.cutX 28928 .empty (.cutY 15104 (.cutX 29056 (.cutY 14976 .full (.cutX 28992 (.cutY 15040 .full .full) (.cutY 15040 .full .full))) (.cutY 14976 .full .full)) .empty))) .empty) .empty) .empty)) .empty))))) .empty))

theorem metadata52 : 0<67702166 ∧ 14<128 ∧ 69<128 ∧ 0<4 ∧
    1665/4160=0 ∧ 1665%4160=1665 ∧ ∀ i, (leaves52 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData52).mp
    (by decide +kernel)

theorem sourceChecked52_0 : ∀ i : Fin 28,
    (fun i => output52 i = raw52 (source52 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked52 : ∀ i : Fin 28, (fun i => output52 i = raw52 (source52 i)) i :=
  forallFin_of_zero_offset (fun i => output52 i = raw52 (source52 i)) sourceChecked52_0

theorem coverChecked52_0 : ∀ i : Fin 28,
    (fun i => (output52 (cover52 i)).ContainsBox (raw52 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked52 : ∀ i : Fin 28, (fun i => (output52 (cover52 i)).ContainsBox (raw52 i)) i :=
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

noncomputable def phaseMass52 : ℝ := singlePhaseMass (67702166/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw52 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass52_eq : phaseMass52 = (33851083/819200000000 : ℝ) := by
  unfold phaseMass52
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw52 output52 cover52 source52
    (gridTreeUnionCheck_sound 32768 raw52 output52 cover52 source52 tree52 checked52)
    _ (by norm_num) _, areaUnits52]
  norm_num

-- Frozen phase 5400, atom 7438, type 1, source (34,82).
def leavesData53 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves53 : Fin 7 → DyadicLeaf := leavesData53.get
def raw53 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 34 82 leaves53 i
def outputData53 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨8704,8832,20992,21120⟩) (.node (.single ⟨8704,8832,21120,21248⟩) (.single ⟨8832,8896,20992,21056⟩))) (.node (.node (.single ⟨8832,8896,21056,21120⟩) (.single ⟨8896,8960,20992,21056⟩)) (.node (.single ⟨8896,8960,21056,21120⟩) (.single ⟨8832,8960,21120,21248⟩)))) (.node (.node (.single ⟨11520,11648,23808,23936⟩) (.node (.single ⟨11520,11648,23936,24064⟩) (.single ⟨11648,11712,23808,23872⟩))) (.node (.node (.single ⟨11648,11712,23872,23936⟩) (.single ⟨11712,11776,23808,23872⟩)) (.node (.single ⟨11712,11776,23872,23936⟩) (.single ⟨11648,11776,23936,24064⟩))))) (.node (.node (.node (.single ⟨20992,21120,8704,8832⟩) (.node (.single ⟨20992,21056,8832,8896⟩) (.single ⟨20992,21056,8896,8960⟩))) (.node (.node (.single ⟨21056,21120,8832,8896⟩) (.single ⟨21056,21120,8896,8960⟩)) (.node (.single ⟨21120,21248,8704,8832⟩) (.single ⟨21120,21248,8832,8960⟩)))) (.node (.node (.single ⟨23808,23936,11520,11648⟩) (.node (.single ⟨23808,23872,11648,11712⟩) (.single ⟨23808,23872,11712,11776⟩))) (.node (.node (.single ⟨23872,23936,11648,11712⟩) (.single ⟨23872,23936,11712,11776⟩)) (.node (.single ⟨23936,24064,11520,11648⟩) (.single ⟨23936,24064,11648,11776⟩))))))
def output53 : Fin 28 → GridBox := outputData53.get
def coverData53 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData53 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover53 (i : Fin 28) : Fin 28 := ⟨coverData53.get i % 28, Nat.mod_lt _ (by decide)⟩
def source53 (i : Fin 28) : Fin 28 := ⟨sourceData53.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree53 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 (.cutX 9216 (.cutY 21504 (.cutX 8704 .empty (.cutY 20992 .empty (.cutX 8960 (.cutY 21248 (.cutX 8832 (.cutY 21120 .full .full) (.cutY 21120 (.cutX 8896 (.cutY 21056 .full .full) (.cutY 21056 .full .full)) .full)) .empty) .empty))) .empty) .empty) .empty) (.cutY 22528 .empty (.cutX 11264 .empty (.cutY 23552 .empty (.cutX 11776 (.cutY 24064 (.cutX 11520 .empty (.cutY 23808 .empty (.cutX 11648 (.cutY 23936 .full .full) (.cutY 23936 (.cutX 11712 (.cutY 23872 .full .full) (.cutY 23872 .full .full)) .full)))) .empty) .empty)))))) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 (.cutY 10240 (.cutX 21504 (.cutY 9216 (.cutX 20992 .empty (.cutY 8704 .empty (.cutX 21248 (.cutY 8960 (.cutX 21120 (.cutY 8832 .full (.cutX 21056 (.cutY 8896 .full .full) (.cutY 8896 .full .full))) (.cutY 8832 .full .full)) .empty) .empty))) .empty) .empty) .empty) (.cutY 10240 .empty (.cutX 23552 .empty (.cutY 11264 .empty (.cutX 24064 (.cutY 11776 (.cutX 23808 .empty (.cutY 11520 .empty (.cutX 23936 (.cutY 11648 .full (.cutX 23872 (.cutY 11712 .full .full) (.cutY 11712 .full .full))) (.cutY 11648 .full .full)))) .empty) .empty))))) .empty))) .empty) .empty))

theorem metadata53 : 0<156512574 ∧ 34<128 ∧ 82<128 ∧ 1<4 ∧
    7438/4160=1 ∧ 7438%4160=3278 ∧ ∀ i, (leaves53 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData53).mp
    (by decide +kernel)

theorem sourceChecked53_0 : ∀ i : Fin 28,
    (fun i => output53 i = raw53 (source53 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked53 : ∀ i : Fin 28, (fun i => output53 i = raw53 (source53 i)) i :=
  forallFin_of_zero_offset (fun i => output53 i = raw53 (source53 i)) sourceChecked53_0

theorem coverChecked53_0 : ∀ i : Fin 28,
    (fun i => (output53 (cover53 i)).ContainsBox (raw53 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked53 : ∀ i : Fin 28, (fun i => (output53 (cover53 i)).ContainsBox (raw53 i)) i :=
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

noncomputable def phaseMass53 : ℝ := singlePhaseMass (156512574/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw53 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass53_eq : phaseMass53 = (78256287/819200000000 : ℝ) := by
  unfold phaseMass53
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw53 output53 cover53 source53
    (gridTreeUnionCheck_sound 32768 raw53 output53 cover53 source53 tree53 checked53)
    _ (by norm_num) _, areaUnits53]
  norm_num

-- Frozen phase 5401, atom 3509, type 0, source (38,89).
def leavesData54 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves54 : Fin 7 → DyadicLeaf := leavesData54.get
def raw54 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 38 89 leaves54 i
def outputData54 : FiniteInputTree GridBox 14 := (.node (.node (.node (.single ⟨9728,9856,22784,22912⟩) (.node (.single ⟨9728,9856,22912,23040⟩) (.single ⟨9856,9920,22784,22848⟩))) (.node (.node (.single ⟨9856,9920,22848,22912⟩) (.single ⟨9920,9984,22784,22848⟩)) (.node (.single ⟨9920,9984,22848,22912⟩) (.single ⟨9856,9984,22912,23040⟩)))) (.node (.node (.single ⟨22784,22912,9728,9856⟩) (.node (.single ⟨22784,22848,9856,9920⟩) (.single ⟨22784,22848,9920,9984⟩))) (.node (.node (.single ⟨22848,22912,9856,9920⟩) (.single ⟨22848,22912,9920,9984⟩)) (.node (.single ⟨22912,23040,9728,9856⟩) (.single ⟨22912,23040,9856,9984⟩)))))
def output54 : Fin 14 → GridBox := outputData54.get
def coverData54 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 13))) (.node (.node (.single 6) (.single 1)) (.node (.single 12) (.single 12)))) (.node (.node (.single 1) (.node (.single 6) (.single 13))) (.node (.node (.single 7) (.single 0)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 11) (.node (.single 5) (.single 3))) (.node (.node (.single 10) (.single 10)) (.node (.single 3) (.single 4)))) (.node (.node (.single 9) (.node (.single 9) (.single 4))) (.node (.node (.single 5) (.single 11)) (.node (.single 8) (.single 2))))))
def sourceData54 : FiniteInputTree ℕ 14 := (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 15) (.single 3)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 14)) (.node (.single 5) (.single 2)))))
def cover54 (i : Fin 28) : Fin 14 := ⟨coverData54.get i % 14, Nat.mod_lt _ (by decide)⟩
def source54 (i : Fin 14) : Fin 28 := ⟨sourceData54.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree54 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 .empty (.cutX 9216 .empty (.cutY 23552 (.cutX 9728 .empty (.cutY 23040 (.cutX 9984 (.cutY 22784 .empty (.cutX 9856 (.cutY 22912 .full .full) (.cutY 22912 (.cutX 9920 (.cutY 22848 .full .full) (.cutY 22848 .full .full)) .full))) .empty) .empty)) .empty))) .empty)) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 .empty (.cutY 10240 (.cutX 23552 (.cutY 9216 .empty (.cutX 23040 (.cutY 9728 .empty (.cutX 22784 .empty (.cutY 9984 (.cutX 22912 (.cutY 9856 .full (.cutX 22848 (.cutY 9920 .full .full) (.cutY 9920 .full .full))) (.cutY 9856 .full .full)) .empty))) .empty)) .empty) .empty)) .empty))) .empty) .empty))

theorem metadata54 : 0<75538780 ∧ 38<128 ∧ 89<128 ∧ 0<4 ∧
    3509/4160=0 ∧ 3509%4160=3509 ∧ ∀ i, (leaves54 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData54).mp
    (by decide +kernel)

theorem sourceChecked54_0 : ∀ i : Fin 14,
    (fun i => output54 i = raw54 (source54 i)) (finOffset 14 0 14 (by decide) i) := by decide +kernel

theorem sourceChecked54 : ∀ i : Fin 14, (fun i => output54 i = raw54 (source54 i)) i :=
  forallFin_of_zero_offset (fun i => output54 i = raw54 (source54 i)) sourceChecked54_0

theorem coverChecked54_0 : ∀ i : Fin 28,
    (fun i => (output54 (cover54 i)).ContainsBox (raw54 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked54 : ∀ i : Fin 28, (fun i => (output54 (cover54 i)).ContainsBox (raw54 i)) i :=
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

theorem areaUnits54 : gridUnionAreaUnits output54 = 131072 := by decide +kernel

noncomputable def phaseMass54 : ℝ := singlePhaseMass (75538780/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw54 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass54_eq : phaseMass54 = (3776939/163840000000 : ℝ) := by
  unfold phaseMass54
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw54 output54 cover54 source54
    (gridTreeUnionCheck_sound 32768 raw54 output54 cover54 source54 tree54 checked54)
    _ (by norm_num) _, areaUnits54]
  norm_num

-- Frozen phase 5402, atom 3156, type 0, source (32,84).
def leavesData55 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves55 : Fin 4 → DyadicLeaf := leavesData55.get
def raw55 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 32 84 leaves55 i
def outputData55 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨8192,8320,21504,21632⟩) (.single ⟨8192,8320,21632,21760⟩)) (.node (.single ⟨8320,8448,21504,21632⟩) (.single ⟨8320,8448,21632,21760⟩))) (.node (.node (.single ⟨11008,11136,24320,24448⟩) (.single ⟨11008,11136,24448,24576⟩)) (.node (.single ⟨11136,11264,24320,24448⟩) (.single ⟨11136,11264,24448,24576⟩)))) (.node (.node (.node (.single ⟨21504,21632,8192,8320⟩) (.single ⟨21504,21632,8320,8448⟩)) (.node (.single ⟨21632,21760,8192,8320⟩) (.single ⟨21632,21760,8320,8448⟩))) (.node (.node (.single ⟨24320,24448,11008,11136⟩) (.single ⟨24320,24448,11136,11264⟩)) (.node (.single ⟨24448,24576,11008,11136⟩) (.single ⟨24448,24576,11136,11264⟩)))))
def output55 : Fin 16 → GridBox := outputData55.get
def coverData55 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData55 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover55 (i : Fin 16) : Fin 16 := ⟨coverData55.get i % 16, Nat.mod_lt _ (by decide)⟩
def source55 (i : Fin 16) : Fin 16 := ⟨sourceData55.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree55 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 (.cutX 9216 (.cutY 21504 .empty (.cutX 8704 (.cutY 22016 (.cutX 8448 (.cutY 21760 (.cutX 8320 (.cutY 21632 .full .full) (.cutY 21632 .full .full)) .empty) .empty) .empty) .empty)) .empty) .empty) (.cutY 22528 .empty (.cutX 11264 (.cutY 23552 .empty (.cutX 10752 .empty (.cutY 24064 .empty (.cutX 11008 .empty (.cutY 24320 .empty (.cutX 11136 (.cutY 24448 .full .full) (.cutY 24448 .full .full))))))) .empty)))) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 (.cutY 10240 (.cutX 21504 .empty (.cutY 9216 (.cutX 22016 (.cutY 8704 (.cutX 21760 (.cutY 8448 (.cutX 21632 (.cutY 8320 .full .full) (.cutY 8320 .full .full)) .empty) .empty) .empty) .empty) .empty)) .empty) (.cutY 10240 .empty (.cutX 23552 .empty (.cutY 11264 (.cutX 24064 .empty (.cutY 10752 .empty (.cutX 24320 .empty (.cutY 11008 .empty (.cutX 24448 (.cutY 11136 .full .full) (.cutY 11136 .full .full)))))) .empty)))) .empty))) .empty) .empty))

theorem metadata55 : 0<167980383 ∧ 32<128 ∧ 84<128 ∧ 0<4 ∧
    3156/4160=0 ∧ 3156%4160=3156 ∧ ∀ i, (leaves55 i).Valid 8 := by
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

noncomputable def phaseMass55 : ℝ := singlePhaseMass (167980383/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw55 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass55_eq : phaseMass55 = (167980383/1638400000000 : ℝ) := by
  unfold phaseMass55
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw55 output55 cover55 source55
    (gridTreeUnionCheck_sound 32768 raw55 output55 cover55 source55 tree55 checked55)
    _ (by norm_num) _, areaUnits55]
  norm_num

-- Frozen phase 5403, atom 3220, type 0, source (33,85).
def leavesData56 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves56 : Fin 4 → DyadicLeaf := leavesData56.get
def raw56 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 33 85 leaves56 i
def outputData56 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨8448,8576,21760,21888⟩) (.single ⟨8448,8576,21888,22016⟩)) (.node (.single ⟨8576,8704,21760,21888⟩) (.single ⟨8576,8704,21888,22016⟩))) (.node (.node (.single ⟨10752,10880,24064,24192⟩) (.single ⟨10752,10880,24192,24320⟩)) (.node (.single ⟨10880,11008,24064,24192⟩) (.single ⟨10880,11008,24192,24320⟩)))) (.node (.node (.node (.single ⟨21760,21888,8448,8576⟩) (.single ⟨21760,21888,8576,8704⟩)) (.node (.single ⟨21888,22016,8448,8576⟩) (.single ⟨21888,22016,8576,8704⟩))) (.node (.node (.single ⟨24064,24192,10752,10880⟩) (.single ⟨24064,24192,10880,11008⟩)) (.node (.single ⟨24192,24320,10752,10880⟩) (.single ⟨24192,24320,10880,11008⟩)))))
def output56 : Fin 16 → GridBox := outputData56.get
def coverData56 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData56 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover56 (i : Fin 16) : Fin 16 := ⟨coverData56.get i % 16, Nat.mod_lt _ (by decide)⟩
def source56 (i : Fin 16) : Fin 16 := ⟨sourceData56.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree56 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 (.cutX 9216 (.cutY 21504 .empty (.cutX 8704 (.cutY 22016 (.cutX 8448 .empty (.cutY 21760 .empty (.cutX 8576 (.cutY 21888 .full .full) (.cutY 21888 .full .full)))) .empty) .empty)) .empty) .empty) (.cutY 22528 .empty (.cutX 11264 (.cutY 23552 .empty (.cutX 10752 .empty (.cutY 24064 .empty (.cutX 11008 (.cutY 24320 (.cutX 10880 (.cutY 24192 .full .full) (.cutY 24192 .full .full)) .empty) .empty)))) .empty)))) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 (.cutY 10240 (.cutX 21504 .empty (.cutY 9216 (.cutX 22016 (.cutY 8704 (.cutX 21760 .empty (.cutY 8448 .empty (.cutX 21888 (.cutY 8576 .full .full) (.cutY 8576 .full .full)))) .empty) .empty) .empty)) .empty) (.cutY 10240 .empty (.cutX 23552 .empty (.cutY 11264 (.cutX 24064 .empty (.cutY 10752 .empty (.cutX 24320 (.cutY 11008 (.cutX 24192 (.cutY 10880 .full .full) (.cutY 10880 .full .full)) .empty) .empty))) .empty)))) .empty))) .empty) .empty))

theorem metadata56 : 0<167980383 ∧ 33<128 ∧ 85<128 ∧ 0<4 ∧
    3220/4160=0 ∧ 3220%4160=3220 ∧ ∀ i, (leaves56 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData56).mp
    (by decide +kernel)

theorem sourceChecked56_0 : ∀ i : Fin 16,
    (fun i => output56 i = raw56 (source56 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked56 : ∀ i : Fin 16, (fun i => output56 i = raw56 (source56 i)) i :=
  forallFin_of_zero_offset (fun i => output56 i = raw56 (source56 i)) sourceChecked56_0

theorem coverChecked56_0 : ∀ i : Fin 16,
    (fun i => (output56 (cover56 i)).ContainsBox (raw56 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked56 : ∀ i : Fin 16, (fun i => (output56 (cover56 i)).ContainsBox (raw56 i)) i :=
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

noncomputable def phaseMass56 : ℝ := singlePhaseMass (167980383/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw56 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass56_eq : phaseMass56 = (167980383/1638400000000 : ℝ) := by
  unfold phaseMass56
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw56 output56 cover56 source56
    (gridTreeUnionCheck_sound 32768 raw56 output56 cover56 source56 tree56 checked56)
    _ (by norm_num) _, areaUnits56]
  norm_num

-- Frozen phase 5404, atom 2952, type 0, source (29,81).
def leavesData57 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves57 : Fin 7 → DyadicLeaf := leavesData57.get
def raw57 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 29 81 leaves57 i
def outputData57 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨7424,7552,20736,20864⟩) (.node (.single ⟨7424,7552,20864,20992⟩) (.single ⟨7552,7616,20736,20800⟩))) (.node (.node (.single ⟨7552,7616,20800,20864⟩) (.single ⟨7616,7680,20736,20800⟩)) (.node (.single ⟨7616,7680,20800,20864⟩) (.single ⟨7552,7680,20864,20992⟩)))) (.node (.node (.single ⟨11776,11904,25088,25216⟩) (.node (.single ⟨11776,11904,25216,25344⟩) (.single ⟨11904,11968,25088,25152⟩))) (.node (.node (.single ⟨11904,11968,25152,25216⟩) (.single ⟨11968,12032,25088,25152⟩)) (.node (.single ⟨11968,12032,25152,25216⟩) (.single ⟨11904,12032,25216,25344⟩))))) (.node (.node (.node (.single ⟨20736,20864,7424,7552⟩) (.node (.single ⟨20736,20800,7552,7616⟩) (.single ⟨20736,20800,7616,7680⟩))) (.node (.node (.single ⟨20800,20864,7552,7616⟩) (.single ⟨20800,20864,7616,7680⟩)) (.node (.single ⟨20864,20992,7424,7552⟩) (.single ⟨20864,20992,7552,7680⟩)))) (.node (.node (.single ⟨25088,25216,11776,11904⟩) (.node (.single ⟨25088,25152,11904,11968⟩) (.single ⟨25088,25152,11968,12032⟩))) (.node (.node (.single ⟨25152,25216,11904,11968⟩) (.single ⟨25152,25216,11968,12032⟩)) (.node (.single ⟨25216,25344,11776,11904⟩) (.single ⟨25216,25344,11904,12032⟩))))))
def output57 : Fin 28 → GridBox := outputData57.get
def coverData57 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData57 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover57 (i : Fin 28) : Fin 28 := ⟨coverData57.get i % 28, Nat.mod_lt _ (by decide)⟩
def source57 (i : Fin 28) : Fin 28 := ⟨sourceData57.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree57 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 (.cutX 7168 .empty (.cutY 21504 (.cutX 7680 (.cutY 20992 (.cutX 7424 .empty (.cutY 20736 .empty (.cutX 7552 (.cutY 20864 .full .full) (.cutY 20864 (.cutX 7616 (.cutY 20800 .full .full) (.cutY 20800 .full .full)) .full)))) .empty) .empty) .empty)) .empty)))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 (.cutX 11264 .empty (.cutY 25600 (.cutX 11776 .empty (.cutY 25088 .empty (.cutX 12032 (.cutY 25344 (.cutX 11904 (.cutY 25216 .full .full) (.cutY 25216 (.cutX 11968 (.cutY 25152 .full .full) (.cutY 25152 .full .full)) .full)) .empty) .empty))) .empty)) .empty)) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 .empty (.cutX 21504 (.cutY 7168 .empty (.cutX 20992 (.cutY 7680 (.cutX 20736 .empty (.cutY 7424 .empty (.cutX 20864 (.cutY 7552 .full (.cutX 20800 (.cutY 7616 .full .full) (.cutY 7616 .full .full))) (.cutY 7552 .full .full)))) .empty) .empty)) .empty)) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 .empty (.cutX 25600 (.cutY 11264 .empty (.cutX 25088 .empty (.cutY 11776 .empty (.cutX 25344 (.cutY 12032 (.cutX 25216 (.cutY 11904 .full (.cutX 25152 (.cutY 11968 .full .full) (.cutY 11968 .full .full))) (.cutY 11904 .full .full)) .empty) .empty)))) .empty)) .empty) .empty) .empty))) .empty))

theorem metadata57 : 0<104681033 ∧ 29<128 ∧ 81<128 ∧ 0<4 ∧
    2952/4160=0 ∧ 2952%4160=2952 ∧ ∀ i, (leaves57 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData57).mp
    (by decide +kernel)

theorem sourceChecked57_0 : ∀ i : Fin 28,
    (fun i => output57 i = raw57 (source57 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked57 : ∀ i : Fin 28, (fun i => output57 i = raw57 (source57 i)) i :=
  forallFin_of_zero_offset (fun i => output57 i = raw57 (source57 i)) sourceChecked57_0

theorem coverChecked57_0 : ∀ i : Fin 28,
    (fun i => (output57 (cover57 i)).ContainsBox (raw57 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked57 : ∀ i : Fin 28, (fun i => (output57 (cover57 i)).ContainsBox (raw57 i)) i :=
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

noncomputable def phaseMass57 : ℝ := singlePhaseMass (104681033/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw57 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass57_eq : phaseMass57 = (104681033/1638400000000 : ℝ) := by
  unfold phaseMass57
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw57 output57 cover57 source57
    (gridTreeUnionCheck_sound 32768 raw57 output57 cover57 source57 tree57 checked57)
    _ (by norm_num) _, areaUnits57]
  norm_num

-- Frozen phase 5405, atom 2322, type 0, source (21,75).
def leavesData58 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves58 : Fin 7 → DyadicLeaf := leavesData58.get
def raw58 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 21 75 leaves58 i
def outputData58 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨5376,5504,19200,19328⟩) (.node (.single ⟨5376,5504,19328,19456⟩) (.single ⟨5504,5568,19200,19264⟩))) (.node (.node (.single ⟨5504,5568,19264,19328⟩) (.single ⟨5568,5632,19200,19264⟩)) (.node (.single ⟨5568,5632,19264,19328⟩) (.single ⟨5504,5632,19328,19456⟩)))) (.node (.node (.single ⟨13312,13440,27136,27264⟩) (.node (.single ⟨13312,13440,27264,27392⟩) (.single ⟨13440,13504,27136,27200⟩))) (.node (.node (.single ⟨13440,13504,27200,27264⟩) (.single ⟨13504,13568,27136,27200⟩)) (.node (.single ⟨13504,13568,27200,27264⟩) (.single ⟨13440,13568,27264,27392⟩))))) (.node (.node (.node (.single ⟨19200,19328,5376,5504⟩) (.node (.single ⟨19200,19264,5504,5568⟩) (.single ⟨19200,19264,5568,5632⟩))) (.node (.node (.single ⟨19264,19328,5504,5568⟩) (.single ⟨19264,19328,5568,5632⟩)) (.node (.single ⟨19328,19456,5376,5504⟩) (.single ⟨19328,19456,5504,5632⟩)))) (.node (.node (.single ⟨27136,27264,13312,13440⟩) (.node (.single ⟨27136,27200,13440,13504⟩) (.single ⟨27136,27200,13504,13568⟩))) (.node (.node (.single ⟨27200,27264,13440,13504⟩) (.single ⟨27200,27264,13504,13568⟩)) (.node (.single ⟨27264,27392,13312,13440⟩) (.single ⟨27264,27392,13440,13568⟩))))))
def output58 : Fin 28 → GridBox := outputData58.get
def coverData58 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData58 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover58 (i : Fin 28) : Fin 28 := ⟨coverData58.get i % 28, Nat.mod_lt _ (by decide)⟩
def source58 (i : Fin 28) : Fin 28 := ⟨sourceData58.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree58 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 .empty (.cutX 5120 .empty (.cutY 19456 (.cutX 5632 (.cutY 18944 .empty (.cutX 5376 .empty (.cutY 19200 .empty (.cutX 5504 (.cutY 19328 .full .full) (.cutY 19328 (.cutX 5568 (.cutY 19264 .full .full) (.cutY 19264 .full .full)) .full))))) .empty) .empty))) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 .empty (.cutX 13312 .empty (.cutY 27648 (.cutX 13824 (.cutY 27136 .empty (.cutX 13568 (.cutY 27392 (.cutX 13440 (.cutY 27264 .full .full) (.cutY 27264 (.cutX 13504 (.cutY 27200 .full .full) (.cutY 27200 .full .full)) .full)) .empty) .empty)) .empty) .empty))) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 (.cutX 19456 (.cutY 5120 .empty (.cutX 18944 .empty (.cutY 5632 (.cutX 19200 .empty (.cutY 5376 .empty (.cutX 19328 (.cutY 5504 .full (.cutX 19264 (.cutY 5568 .full .full) (.cutY 5568 .full .full))) (.cutY 5504 .full .full)))) .empty))) .empty) .empty))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 (.cutX 27648 (.cutY 13312 .empty (.cutX 27136 .empty (.cutY 13824 (.cutX 27392 (.cutY 13568 (.cutX 27264 (.cutY 13440 .full (.cutX 27200 (.cutY 13504 .full .full) (.cutY 13504 .full .full))) (.cutY 13440 .full .full)) .empty) .empty) .empty))) .empty) .empty))) .empty))) .empty))

theorem metadata58 : 0<147396112 ∧ 21<128 ∧ 75<128 ∧ 0<4 ∧
    2322/4160=0 ∧ 2322%4160=2322 ∧ ∀ i, (leaves58 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData58).mp
    (by decide +kernel)

theorem sourceChecked58_0 : ∀ i : Fin 28,
    (fun i => output58 i = raw58 (source58 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked58 : ∀ i : Fin 28, (fun i => output58 i = raw58 (source58 i)) i :=
  forallFin_of_zero_offset (fun i => output58 i = raw58 (source58 i)) sourceChecked58_0

theorem coverChecked58_0 : ∀ i : Fin 28,
    (fun i => (output58 (cover58 i)).ContainsBox (raw58 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked58 : ∀ i : Fin 28, (fun i => (output58 (cover58 i)).ContainsBox (raw58 i)) i :=
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

noncomputable def phaseMass58 : ℝ := singlePhaseMass (147396112/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw58 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass58_eq : phaseMass58 = (9212257/102400000000 : ℝ) := by
  unfold phaseMass58
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw58 output58 cover58 source58
    (gridTreeUnionCheck_sound 32768 raw58 output58 cover58 source58 tree58 checked58)
    _ (by norm_num) _, areaUnits58]
  norm_num

-- Frozen phase 5406, atom 3090, type 0, source (31,83).
def leavesData59 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves59 : Fin 4 → DyadicLeaf := leavesData59.get
def raw59 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 31 83 leaves59 i
def outputData59 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨7936,8064,21248,21376⟩) (.single ⟨7936,8064,21376,21504⟩)) (.node (.single ⟨8064,8192,21248,21376⟩) (.single ⟨8064,8192,21376,21504⟩))) (.node (.node (.single ⟨11264,11392,24576,24704⟩) (.single ⟨11264,11392,24704,24832⟩)) (.node (.single ⟨11392,11520,24576,24704⟩) (.single ⟨11392,11520,24704,24832⟩)))) (.node (.node (.node (.single ⟨21248,21376,7936,8064⟩) (.single ⟨21248,21376,8064,8192⟩)) (.node (.single ⟨21376,21504,7936,8064⟩) (.single ⟨21376,21504,8064,8192⟩))) (.node (.node (.single ⟨24576,24704,11264,11392⟩) (.single ⟨24576,24704,11392,11520⟩)) (.node (.single ⟨24704,24832,11264,11392⟩) (.single ⟨24704,24832,11392,11520⟩)))))
def output59 : Fin 16 → GridBox := outputData59.get
def coverData59 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData59 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover59 (i : Fin 16) : Fin 16 := ⟨coverData59.get i % 16, Nat.mod_lt _ (by decide)⟩
def source59 (i : Fin 16) : Fin 16 := ⟨sourceData59.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree59 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 (.cutX 7168 .empty (.cutY 21504 (.cutX 7680 .empty (.cutY 20992 .empty (.cutX 7936 .empty (.cutY 21248 .empty (.cutX 8064 (.cutY 21376 .full .full) (.cutY 21376 .full .full)))))) .empty)) .empty)))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 (.cutX 11264 .empty (.cutY 25600 (.cutX 11776 (.cutY 25088 (.cutX 11520 (.cutY 24832 (.cutX 11392 (.cutY 24704 .full .full) (.cutY 24704 .full .full)) .empty) .empty) .empty) .empty) .empty)) .empty)) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 .empty (.cutX 21504 (.cutY 7168 .empty (.cutX 20992 .empty (.cutY 7680 .empty (.cutX 21248 .empty (.cutY 7936 .empty (.cutX 21376 (.cutY 8064 .full .full) (.cutY 8064 .full .full))))))) .empty)) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 .empty (.cutX 25600 (.cutY 11264 .empty (.cutX 25088 (.cutY 11776 (.cutX 24832 (.cutY 11520 (.cutX 24704 (.cutY 11392 .full .full) (.cutY 11392 .full .full)) .empty) .empty) .empty) .empty)) .empty)) .empty) .empty) .empty))) .empty))

theorem metadata59 : 0<104681033 ∧ 31<128 ∧ 83<128 ∧ 0<4 ∧
    3090/4160=0 ∧ 3090%4160=3090 ∧ ∀ i, (leaves59 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData59).mp
    (by decide +kernel)

theorem sourceChecked59_0 : ∀ i : Fin 16,
    (fun i => output59 i = raw59 (source59 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked59 : ∀ i : Fin 16, (fun i => output59 i = raw59 (source59 i)) i :=
  forallFin_of_zero_offset (fun i => output59 i = raw59 (source59 i)) sourceChecked59_0

theorem coverChecked59_0 : ∀ i : Fin 16,
    (fun i => (output59 (cover59 i)).ContainsBox (raw59 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked59 : ∀ i : Fin 16, (fun i => (output59 (cover59 i)).ContainsBox (raw59 i)) i :=
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

noncomputable def phaseMass59 : ℝ := singlePhaseMass (104681033/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw59 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass59_eq : phaseMass59 = (104681033/1638400000000 : ℝ) := by
  unfold phaseMass59
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw59 output59 cover59 source59
    (gridTreeUnionCheck_sound 32768 raw59 output59 cover59 source59 tree59 checked59)
    _ (by norm_num) _, areaUnits59]
  norm_num

-- Frozen phase 5407, atom 3022, type 0, source (30,82).
def leavesData60 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves60 : Fin 7 → DyadicLeaf := leavesData60.get
def raw60 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 30 82 leaves60 i
def outputData60 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨7680,7808,20992,21120⟩) (.node (.single ⟨7680,7808,21120,21248⟩) (.single ⟨7808,7872,20992,21056⟩))) (.node (.node (.single ⟨7808,7872,21056,21120⟩) (.single ⟨7872,7936,20992,21056⟩)) (.node (.single ⟨7872,7936,21056,21120⟩) (.single ⟨7808,7936,21120,21248⟩)))) (.node (.node (.single ⟨11520,11648,24832,24960⟩) (.node (.single ⟨11520,11648,24960,25088⟩) (.single ⟨11648,11712,24832,24896⟩))) (.node (.node (.single ⟨11648,11712,24896,24960⟩) (.single ⟨11712,11776,24832,24896⟩)) (.node (.single ⟨11712,11776,24896,24960⟩) (.single ⟨11648,11776,24960,25088⟩))))) (.node (.node (.node (.single ⟨20992,21120,7680,7808⟩) (.node (.single ⟨20992,21056,7808,7872⟩) (.single ⟨20992,21056,7872,7936⟩))) (.node (.node (.single ⟨21056,21120,7808,7872⟩) (.single ⟨21056,21120,7872,7936⟩)) (.node (.single ⟨21120,21248,7680,7808⟩) (.single ⟨21120,21248,7808,7936⟩)))) (.node (.node (.single ⟨24832,24960,11520,11648⟩) (.node (.single ⟨24832,24896,11648,11712⟩) (.single ⟨24832,24896,11712,11776⟩))) (.node (.node (.single ⟨24896,24960,11648,11712⟩) (.single ⟨24896,24960,11712,11776⟩)) (.node (.single ⟨24960,25088,11520,11648⟩) (.single ⟨24960,25088,11648,11776⟩))))))
def output60 : Fin 28 → GridBox := outputData60.get
def coverData60 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData60 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover60 (i : Fin 28) : Fin 28 := ⟨coverData60.get i % 28, Nat.mod_lt _ (by decide)⟩
def source60 (i : Fin 28) : Fin 28 := ⟨sourceData60.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree60 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 (.cutX 7168 .empty (.cutY 21504 (.cutX 7680 .empty (.cutY 20992 .empty (.cutX 7936 (.cutY 21248 (.cutX 7808 (.cutY 21120 .full .full) (.cutY 21120 (.cutX 7872 (.cutY 21056 .full .full) (.cutY 21056 .full .full)) .full)) .empty) .empty))) .empty)) .empty)))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 (.cutX 11264 .empty (.cutY 25600 (.cutX 11776 (.cutY 25088 (.cutX 11520 .empty (.cutY 24832 .empty (.cutX 11648 (.cutY 24960 .full .full) (.cutY 24960 (.cutX 11712 (.cutY 24896 .full .full) (.cutY 24896 .full .full)) .full)))) .empty) .empty) .empty)) .empty)) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 .empty (.cutX 21504 (.cutY 7168 .empty (.cutX 20992 .empty (.cutY 7680 .empty (.cutX 21248 (.cutY 7936 (.cutX 21120 (.cutY 7808 .full (.cutX 21056 (.cutY 7872 .full .full) (.cutY 7872 .full .full))) (.cutY 7808 .full .full)) .empty) .empty)))) .empty)) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 .empty (.cutX 25600 (.cutY 11264 .empty (.cutX 25088 (.cutY 11776 (.cutX 24832 .empty (.cutY 11520 .empty (.cutX 24960 (.cutY 11648 .full (.cutX 24896 (.cutY 11712 .full .full) (.cutY 11712 .full .full))) (.cutY 11648 .full .full)))) .empty) .empty)) .empty)) .empty) .empty) .empty))) .empty))

theorem metadata60 : 0<104681033 ∧ 30<128 ∧ 82<128 ∧ 0<4 ∧
    3022/4160=0 ∧ 3022%4160=3022 ∧ ∀ i, (leaves60 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData60).mp
    (by decide +kernel)

theorem sourceChecked60_0 : ∀ i : Fin 28,
    (fun i => output60 i = raw60 (source60 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked60 : ∀ i : Fin 28, (fun i => output60 i = raw60 (source60 i)) i :=
  forallFin_of_zero_offset (fun i => output60 i = raw60 (source60 i)) sourceChecked60_0

theorem coverChecked60_0 : ∀ i : Fin 28,
    (fun i => (output60 (cover60 i)).ContainsBox (raw60 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked60 : ∀ i : Fin 28, (fun i => (output60 (cover60 i)).ContainsBox (raw60 i)) i :=
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

noncomputable def phaseMass60 : ℝ := singlePhaseMass (104681033/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw60 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass60_eq : phaseMass60 = (104681033/1638400000000 : ℝ) := by
  unfold phaseMass60
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw60 output60 cover60 source60
    (gridTreeUnionCheck_sound 32768 raw60 output60 cover60 source60 tree60 checked60)
    _ (by norm_num) _, areaUnits60]
  norm_num

-- Frozen phase 5408, atom 3282, type 0, source (34,86).
def leavesData61 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves61 : Fin 7 → DyadicLeaf := leavesData61.get
def raw61 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 34 86 leaves61 i
def outputData61 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨8704,8832,22016,22144⟩) (.node (.single ⟨8704,8832,22144,22272⟩) (.single ⟨8832,8896,22016,22080⟩))) (.node (.node (.single ⟨8832,8896,22080,22144⟩) (.single ⟨8896,8960,22016,22080⟩)) (.node (.single ⟨8896,8960,22080,22144⟩) (.single ⟨8832,8960,22144,22272⟩)))) (.node (.node (.single ⟨10496,10624,23808,23936⟩) (.node (.single ⟨10496,10624,23936,24064⟩) (.single ⟨10624,10688,23808,23872⟩))) (.node (.node (.single ⟨10624,10688,23872,23936⟩) (.single ⟨10688,10752,23808,23872⟩)) (.node (.single ⟨10688,10752,23872,23936⟩) (.single ⟨10624,10752,23936,24064⟩))))) (.node (.node (.node (.single ⟨22016,22144,8704,8832⟩) (.node (.single ⟨22016,22080,8832,8896⟩) (.single ⟨22016,22080,8896,8960⟩))) (.node (.node (.single ⟨22080,22144,8832,8896⟩) (.single ⟨22080,22144,8896,8960⟩)) (.node (.single ⟨22144,22272,8704,8832⟩) (.single ⟨22144,22272,8832,8960⟩)))) (.node (.node (.single ⟨23808,23936,10496,10624⟩) (.node (.single ⟨23808,23872,10624,10688⟩) (.single ⟨23808,23872,10688,10752⟩))) (.node (.node (.single ⟨23872,23936,10624,10688⟩) (.single ⟨23872,23936,10688,10752⟩)) (.node (.single ⟨23936,24064,10496,10624⟩) (.single ⟨23936,24064,10624,10752⟩))))))
def output61 : Fin 28 → GridBox := outputData61.get
def coverData61 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData61 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover61 (i : Fin 28) : Fin 28 := ⟨coverData61.get i % 28, Nat.mod_lt _ (by decide)⟩
def source61 (i : Fin 28) : Fin 28 := ⟨sourceData61.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree61 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 (.cutX 9216 (.cutY 21504 .empty (.cutX 8704 .empty (.cutY 22016 .empty (.cutX 8960 (.cutY 22272 (.cutX 8832 (.cutY 22144 .full .full) (.cutY 22144 (.cutX 8896 (.cutY 22080 .full .full) (.cutY 22080 .full .full)) .full)) .empty) .empty)))) .empty) .empty) (.cutY 22528 .empty (.cutX 11264 (.cutY 23552 .empty (.cutX 10752 (.cutY 24064 (.cutX 10496 .empty (.cutY 23808 .empty (.cutX 10624 (.cutY 23936 .full .full) (.cutY 23936 (.cutX 10688 (.cutY 23872 .full .full) (.cutY 23872 .full .full)) .full)))) .empty) .empty)) .empty)))) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 (.cutY 10240 (.cutX 21504 .empty (.cutY 9216 (.cutX 22016 .empty (.cutY 8704 .empty (.cutX 22272 (.cutY 8960 (.cutX 22144 (.cutY 8832 .full (.cutX 22080 (.cutY 8896 .full .full) (.cutY 8896 .full .full))) (.cutY 8832 .full .full)) .empty) .empty))) .empty)) .empty) (.cutY 10240 .empty (.cutX 23552 .empty (.cutY 11264 (.cutX 24064 (.cutY 10752 (.cutX 23808 .empty (.cutY 10496 .empty (.cutX 23936 (.cutY 10624 .full (.cutX 23872 (.cutY 10688 .full .full) (.cutY 10688 .full .full))) (.cutY 10624 .full .full)))) .empty) .empty) .empty)))) .empty))) .empty) .empty))

theorem metadata61 : 0<167980383 ∧ 34<128 ∧ 86<128 ∧ 0<4 ∧
    3282/4160=0 ∧ 3282%4160=3282 ∧ ∀ i, (leaves61 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData61).mp
    (by decide +kernel)

theorem sourceChecked61_0 : ∀ i : Fin 28,
    (fun i => output61 i = raw61 (source61 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked61 : ∀ i : Fin 28, (fun i => output61 i = raw61 (source61 i)) i :=
  forallFin_of_zero_offset (fun i => output61 i = raw61 (source61 i)) sourceChecked61_0

theorem coverChecked61_0 : ∀ i : Fin 28,
    (fun i => (output61 (cover61 i)).ContainsBox (raw61 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked61 : ∀ i : Fin 28, (fun i => (output61 (cover61 i)).ContainsBox (raw61 i)) i :=
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

noncomputable def phaseMass61 : ℝ := singlePhaseMass (167980383/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw61 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass61_eq : phaseMass61 = (167980383/1638400000000 : ℝ) := by
  unfold phaseMass61
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw61 output61 cover61 source61
    (gridTreeUnionCheck_sound 32768 raw61 output61 cover61 source61 tree61 checked61)
    _ (by norm_num) _, areaUnits61]
  norm_num

-- Frozen phase 5409, atom 3342, type 0, source (35,87).
def leavesData62 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves62 : Fin 7 → DyadicLeaf := leavesData62.get
def raw62 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 35 87 leaves62 i
def outputData62 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨8960,9088,22272,22400⟩) (.node (.single ⟨8960,9088,22400,22528⟩) (.single ⟨9088,9152,22272,22336⟩))) (.node (.node (.single ⟨9088,9152,22336,22400⟩) (.single ⟨9152,9216,22272,22336⟩)) (.node (.single ⟨9152,9216,22336,22400⟩) (.single ⟨9088,9216,22400,22528⟩)))) (.node (.node (.single ⟨10240,10368,23552,23680⟩) (.node (.single ⟨10240,10368,23680,23808⟩) (.single ⟨10368,10432,23552,23616⟩))) (.node (.node (.single ⟨10368,10432,23616,23680⟩) (.single ⟨10432,10496,23552,23616⟩)) (.node (.single ⟨10432,10496,23616,23680⟩) (.single ⟨10368,10496,23680,23808⟩))))) (.node (.node (.node (.single ⟨22272,22400,8960,9088⟩) (.node (.single ⟨22272,22336,9088,9152⟩) (.single ⟨22272,22336,9152,9216⟩))) (.node (.node (.single ⟨22336,22400,9088,9152⟩) (.single ⟨22336,22400,9152,9216⟩)) (.node (.single ⟨22400,22528,8960,9088⟩) (.single ⟨22400,22528,9088,9216⟩)))) (.node (.node (.single ⟨23552,23680,10240,10368⟩) (.node (.single ⟨23552,23616,10368,10432⟩) (.single ⟨23552,23616,10432,10496⟩))) (.node (.node (.single ⟨23616,23680,10368,10432⟩) (.single ⟨23616,23680,10432,10496⟩)) (.node (.single ⟨23680,23808,10240,10368⟩) (.single ⟨23680,23808,10368,10496⟩))))))
def output62 : Fin 28 → GridBox := outputData62.get
def coverData62 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData62 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover62 (i : Fin 28) : Fin 28 := ⟨coverData62.get i % 28, Nat.mod_lt _ (by decide)⟩
def source62 (i : Fin 28) : Fin 28 := ⟨sourceData62.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree62 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 (.cutX 9216 (.cutY 21504 .empty (.cutX 8704 .empty (.cutY 22016 .empty (.cutX 8960 .empty (.cutY 22272 .empty (.cutX 9088 (.cutY 22400 .full .full) (.cutY 22400 (.cutX 9152 (.cutY 22336 .full .full) (.cutY 22336 .full .full)) .full))))))) .empty) .empty) (.cutY 22528 .empty (.cutX 11264 (.cutY 23552 .empty (.cutX 10752 (.cutY 24064 (.cutX 10496 (.cutY 23808 (.cutX 10368 (.cutY 23680 .full .full) (.cutY 23680 (.cutX 10432 (.cutY 23616 .full .full) (.cutY 23616 .full .full)) .full)) .empty) .empty) .empty) .empty)) .empty)))) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 (.cutY 10240 (.cutX 21504 .empty (.cutY 9216 (.cutX 22016 .empty (.cutY 8704 .empty (.cutX 22272 .empty (.cutY 8960 .empty (.cutX 22400 (.cutY 9088 .full (.cutX 22336 (.cutY 9152 .full .full) (.cutY 9152 .full .full))) (.cutY 9088 .full .full)))))) .empty)) .empty) (.cutY 10240 .empty (.cutX 23552 .empty (.cutY 11264 (.cutX 24064 (.cutY 10752 (.cutX 23808 (.cutY 10496 (.cutX 23680 (.cutY 10368 .full (.cutX 23616 (.cutY 10432 .full .full) (.cutY 10432 .full .full))) (.cutY 10368 .full .full)) .empty) .empty) .empty) .empty) .empty)))) .empty))) .empty) .empty))

theorem metadata62 : 0<167980383 ∧ 35<128 ∧ 87<128 ∧ 0<4 ∧
    3342/4160=0 ∧ 3342%4160=3342 ∧ ∀ i, (leaves62 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData62).mp
    (by decide +kernel)

theorem sourceChecked62_0 : ∀ i : Fin 28,
    (fun i => output62 i = raw62 (source62 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked62 : ∀ i : Fin 28, (fun i => output62 i = raw62 (source62 i)) i :=
  forallFin_of_zero_offset (fun i => output62 i = raw62 (source62 i)) sourceChecked62_0

theorem coverChecked62_0 : ∀ i : Fin 28,
    (fun i => (output62 (cover62 i)).ContainsBox (raw62 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked62 : ∀ i : Fin 28, (fun i => (output62 (cover62 i)).ContainsBox (raw62 i)) i :=
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

noncomputable def phaseMass62 : ℝ := singlePhaseMass (167980383/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw62 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass62_eq : phaseMass62 = (167980383/1638400000000 : ℝ) := by
  unfold phaseMass62
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw62 output62 cover62 source62
    (gridTreeUnionCheck_sound 32768 raw62 output62 cover62 source62 tree62 checked62)
    _ (by norm_num) _, areaUnits62]
  norm_num

-- Frozen phase 5410, atom 2731, type 0, source (26,79).
def leavesData63 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves63 : Fin 7 → DyadicLeaf := leavesData63.get
def raw63 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 26 79 leaves63 i
def outputData63 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨6656,6784,20224,20352⟩) (.node (.single ⟨6656,6784,20352,20480⟩) (.single ⟨6784,6848,20224,20288⟩))) (.node (.node (.single ⟨6784,6848,20288,20352⟩) (.single ⟨6848,6912,20224,20288⟩)) (.node (.single ⟨6848,6912,20288,20352⟩) (.single ⟨6784,6912,20352,20480⟩)))) (.node (.node (.single ⟨12288,12416,25856,25984⟩) (.node (.single ⟨12288,12416,25984,26112⟩) (.single ⟨12416,12480,25856,25920⟩))) (.node (.node (.single ⟨12416,12480,25920,25984⟩) (.single ⟨12480,12544,25856,25920⟩)) (.node (.single ⟨12480,12544,25920,25984⟩) (.single ⟨12416,12544,25984,26112⟩))))) (.node (.node (.node (.single ⟨20224,20352,6656,6784⟩) (.node (.single ⟨20224,20288,6784,6848⟩) (.single ⟨20224,20288,6848,6912⟩))) (.node (.node (.single ⟨20288,20352,6784,6848⟩) (.single ⟨20288,20352,6848,6912⟩)) (.node (.single ⟨20352,20480,6656,6784⟩) (.single ⟨20352,20480,6784,6912⟩)))) (.node (.node (.single ⟨25856,25984,12288,12416⟩) (.node (.single ⟨25856,25920,12416,12480⟩) (.single ⟨25856,25920,12480,12544⟩))) (.node (.node (.single ⟨25920,25984,12416,12480⟩) (.single ⟨25920,25984,12480,12544⟩)) (.node (.single ⟨25984,26112,12288,12416⟩) (.single ⟨25984,26112,12416,12544⟩))))))
def output63 : Fin 28 → GridBox := outputData63.get
def coverData63 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData63 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover63 (i : Fin 28) : Fin 28 := ⟨coverData63.get i % 28, Nat.mod_lt _ (by decide)⟩
def source63 (i : Fin 28) : Fin 28 := ⟨sourceData63.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree63 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 .empty (.cutX 7168 (.cutY 19456 .empty (.cutX 6656 .empty (.cutY 19968 .empty (.cutX 6912 (.cutY 20224 .empty (.cutX 6784 (.cutY 20352 .full .full) (.cutY 20352 (.cutX 6848 (.cutY 20288 .full .full) (.cutY 20288 .full .full)) .full))) .empty)))) .empty))) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 (.cutX 13312 (.cutY 25600 .empty (.cutX 12800 (.cutY 26112 (.cutX 12544 (.cutY 25856 .empty (.cutX 12416 (.cutY 25984 .full .full) (.cutY 25984 (.cutX 12480 (.cutY 25920 .full .full) (.cutY 25920 .full .full)) .full))) .empty) .empty) .empty)) .empty) .empty) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 .empty (.cutX 19456 .empty (.cutY 7168 (.cutX 19968 .empty (.cutY 6656 .empty (.cutX 20224 .empty (.cutY 6912 (.cutX 20352 (.cutY 6784 .full (.cutX 20288 (.cutY 6848 .full .full) (.cutY 6848 .full .full))) (.cutY 6784 .full .full)) .empty)))) .empty))))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 (.cutX 25600 .empty (.cutY 13312 (.cutX 26112 (.cutY 12800 (.cutX 25856 .empty (.cutY 12544 (.cutX 25984 (.cutY 12416 .full (.cutX 25920 (.cutY 12480 .full .full) (.cutY 12480 .full .full))) (.cutY 12416 .full .full)) .empty)) .empty) .empty) .empty)) .empty) .empty)) .empty))) .empty))

theorem metadata63 : 0<177866497 ∧ 26<128 ∧ 79<128 ∧ 0<4 ∧
    2731/4160=0 ∧ 2731%4160=2731 ∧ ∀ i, (leaves63 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData63).mp
    (by decide +kernel)

theorem sourceChecked63_0 : ∀ i : Fin 28,
    (fun i => output63 i = raw63 (source63 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked63 : ∀ i : Fin 28, (fun i => output63 i = raw63 (source63 i)) i :=
  forallFin_of_zero_offset (fun i => output63 i = raw63 (source63 i)) sourceChecked63_0

theorem coverChecked63_0 : ∀ i : Fin 28,
    (fun i => (output63 (cover63 i)).ContainsBox (raw63 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked63 : ∀ i : Fin 28, (fun i => (output63 (cover63 i)).ContainsBox (raw63 i)) i :=
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

noncomputable def phaseMass63 : ℝ := singlePhaseMass (177866497/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw63 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass63_eq : phaseMass63 = (177866497/1638400000000 : ℝ) := by
  unfold phaseMass63
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw63 output63 cover63 source63
    (gridTreeUnionCheck_sound 32768 raw63 output63 cover63 source63 tree63 checked63)
    _ (by norm_num) _, areaUnits63]
  norm_num

-- Frozen phase 5411, atom 6887, type 1, source (26,75).
def leavesData64 : FiniteInputTree DyadicLeaf 19 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩)) (.node (.single ⟨2,1,0⟩) (.node (.single ⟨2,1,1⟩) (.single ⟨3,6,0⟩))))) (.node (.node (.node (.single ⟨3,6,1⟩) (.single ⟨3,7,1⟩)) (.node (.single ⟨3,4,0⟩) (.node (.single ⟨3,4,1⟩) (.single ⟨3,5,0⟩)))) (.node (.node (.single ⟨3,5,1⟩) (.single ⟨4,14,0⟩)) (.node (.single ⟨4,14,1⟩) (.node (.single ⟨4,15,0⟩) (.single ⟨4,15,1⟩))))))
def leaves64 : Fin 19 → DyadicLeaf := leavesData64.get
def raw64 (i : Fin 76) : GridBox := phaseImageBoxes 32768 8 26 75 leaves64 i
def outputData64 : FiniteInputTree GridBox 76 := (.node (.node (.node (.node (.node (.node (.single ⟨6656,6720,19200,19264⟩) (.single ⟨6656,6720,19264,19328⟩)) (.node (.single ⟨6720,6784,19200,19264⟩) (.single ⟨6720,6784,19264,19328⟩))) (.node (.node (.single ⟨6656,6784,19328,19456⟩) (.single ⟨6784,6816,19200,19232⟩)) (.node (.single ⟨6784,6816,19232,19264⟩) (.node (.single ⟨6816,6848,19200,19232⟩) (.single ⟨6816,6848,19232,19264⟩))))) (.node (.node (.node (.single ⟨6784,6848,19264,19328⟩) (.single ⟨6848,6880,19200,19232⟩)) (.node (.single ⟨6848,6880,19232,19264⟩) (.node (.single ⟨6880,6896,19200,19216⟩) (.single ⟨6880,6896,19216,19232⟩)))) (.node (.node (.single ⟨6896,6912,19200,19216⟩) (.single ⟨6896,6912,19216,19232⟩)) (.node (.single ⟨6880,6912,19232,19264⟩) (.node (.single ⟨6848,6912,19264,19328⟩) (.single ⟨6784,6912,19328,19456⟩)))))) (.node (.node (.node (.node (.single ⟨13312,13440,25856,25984⟩) (.single ⟨13312,13440,25984,26112⟩)) (.node (.single ⟨13440,13504,25856,25920⟩) (.single ⟨13440,13504,25920,25984⟩))) (.node (.node (.single ⟨13504,13536,25856,25888⟩) (.single ⟨13504,13536,25888,25920⟩)) (.node (.single ⟨13536,13552,25856,25872⟩) (.node (.single ⟨13536,13552,25872,25888⟩) (.single ⟨13552,13568,25856,25872⟩))))) (.node (.node (.node (.single ⟨13552,13568,25872,25888⟩) (.single ⟨13536,13568,25888,25920⟩)) (.node (.single ⟨13504,13536,25920,25952⟩) (.node (.single ⟨13504,13536,25952,25984⟩) (.single ⟨13536,13568,25920,25952⟩)))) (.node (.node (.single ⟨13536,13568,25952,25984⟩) (.single ⟨13440,13504,25984,26048⟩)) (.node (.single ⟨13440,13504,26048,26112⟩) (.node (.single ⟨13504,13568,25984,26048⟩) (.single ⟨13504,13568,26048,26112⟩))))))) (.node (.node (.node (.node (.node (.single ⟨19200,19264,6656,6720⟩) (.single ⟨19200,19264,6720,6784⟩)) (.node (.single ⟨19264,19328,6656,6720⟩) (.single ⟨19264,19328,6720,6784⟩))) (.node (.node (.single ⟨19200,19232,6784,6816⟩) (.single ⟨19200,19232,6816,6848⟩)) (.node (.single ⟨19232,19264,6784,6816⟩) (.node (.single ⟨19232,19264,6816,6848⟩) (.single ⟨19200,19232,6848,6880⟩))))) (.node (.node (.node (.single ⟨19200,19216,6880,6896⟩) (.single ⟨19200,19216,6896,6912⟩)) (.node (.single ⟨19216,19232,6880,6896⟩) (.node (.single ⟨19216,19232,6896,6912⟩) (.single ⟨19232,19264,6848,6880⟩)))) (.node (.node (.single ⟨19232,19264,6880,6912⟩) (.single ⟨19264,19328,6784,6848⟩)) (.node (.single ⟨19264,19328,6848,6912⟩) (.node (.single ⟨19328,19456,6656,6784⟩) (.single ⟨19328,19456,6784,6912⟩)))))) (.node (.node (.node (.node (.single ⟨25856,25984,13312,13440⟩) (.single ⟨25856,25920,13440,13504⟩)) (.node (.single ⟨25856,25888,13504,13536⟩) (.single ⟨25856,25872,13536,13552⟩))) (.node (.node (.single ⟨25856,25872,13552,13568⟩) (.single ⟨25872,25888,13536,13552⟩)) (.node (.single ⟨25872,25888,13552,13568⟩) (.node (.single ⟨25888,25920,13504,13536⟩) (.single ⟨25888,25920,13536,13568⟩))))) (.node (.node (.node (.single ⟨25920,25984,13440,13504⟩) (.single ⟨25920,25952,13504,13536⟩)) (.node (.single ⟨25920,25952,13536,13568⟩) (.node (.single ⟨25952,25984,13504,13536⟩) (.single ⟨25952,25984,13536,13568⟩)))) (.node (.node (.single ⟨25984,26112,13312,13440⟩) (.single ⟨25984,26048,13440,13504⟩)) (.node (.single ⟨25984,26048,13504,13568⟩) (.node (.single ⟨26048,26112,13440,13504⟩) (.single ⟨26048,26112,13504,13568⟩))))))))
def output64 : Fin 76 → GridBox := outputData64.get
def coverData64 : FiniteInputTree ℕ 76 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 55)) (.node (.single 71) (.single 20))) (.node (.node (.single 18) (.single 56)) (.node (.single 57) (.node (.single 19) (.single 9))))) (.node (.node (.node (.single 53) (.single 66)) (.node (.single 22) (.node (.single 17) (.single 54)))) (.node (.node (.single 58) (.single 21)) (.node (.single 0) (.node (.single 38) (.single 75)))))) (.node (.node (.node (.node (.single 37) (.single 1)) (.node (.single 40) (.single 74))) (.node (.node (.single 35) (.single 2)) (.node (.single 39) (.node (.single 73) (.single 36))))) (.node (.node (.node (.single 3) (.single 41)) (.node (.single 72) (.node (.single 34) (.single 10)))) (.node (.node (.single 46) (.single 65)) (.node (.single 29) (.node (.single 11) (.single 51))))))) (.node (.node (.node (.node (.node (.single 64) (.single 24)) (.node (.single 16) (.single 52))) (.node (.node (.single 59) (.single 23)) (.node (.single 5) (.node (.single 42) (.single 70))))) (.node (.node (.node (.single 33) (.single 6)) (.node (.single 44) (.node (.single 69) (.single 31)))) (.node (.node (.single 7) (.single 43)) (.node (.single 68) (.node (.single 32) (.single 8)))))) (.node (.node (.node (.node (.single 45) (.single 67)) (.node (.single 30) (.single 12))) (.node (.node (.single 47) (.single 63)) (.node (.single 28) (.node (.single 13) (.single 49))))) (.node (.node (.node (.single 62) (.single 26)) (.node (.single 14) (.node (.single 48) (.single 61)))) (.node (.node (.single 27) (.single 15)) (.node (.single 50) (.node (.single 60) (.single 25))))))))
def sourceData64 : FiniteInputTree ℕ 76 := (.node (.node (.node (.node (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 28))) (.node (.node (.single 0) (.single 44)) (.node (.single 48) (.node (.single 52) (.single 56))))) (.node (.node (.node (.single 8) (.single 32)) (.node (.single 36) (.node (.single 60) (.single 64)))) (.node (.node (.single 68) (.single 72)) (.node (.single 40) (.node (.single 12) (.single 4)))))) (.node (.node (.node (.node (.single 7) (.single 3)) (.node (.single 15) (.single 11))) (.node (.node (.single 43) (.single 39)) (.node (.single 75) (.node (.single 67) (.single 71))))) (.node (.node (.node (.single 63) (.single 35)) (.node (.single 59) (.node (.single 51) (.single 55)))) (.node (.node (.single 47) (.single 31)) (.node (.single 23) (.node (.single 27) (.single 19))))))) (.node (.node (.node (.node (.node (.single 17) (.single 25)) (.node (.single 21) (.single 29))) (.node (.node (.single 45) (.single 53)) (.node (.single 49) (.node (.single 57) (.single 33))))) (.node (.node (.node (.single 61) (.single 69)) (.node (.single 65) (.node (.single 73) (.single 37)))) (.node (.node (.single 41) (.single 9)) (.node (.single 13) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.single 6) (.single 14)) (.node (.single 42) (.single 74))) (.node (.node (.single 70) (.single 66)) (.node (.single 62) (.node (.single 38) (.single 34))))) (.node (.node (.node (.single 10) (.single 58)) (.node (.single 54) (.node (.single 50) (.single 46)))) (.node (.node (.single 2) (.single 30)) (.node (.single 26) (.node (.single 22) (.single 18))))))))
def cover64 (i : Fin 76) : Fin 76 := ⟨coverData64.get i % 76, Nat.mod_lt _ (by decide)⟩
def source64 (i : Fin 76) : Fin 76 := ⟨sourceData64.get i % 76, Nat.mod_lt _ (by decide)⟩
def tree64 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 .empty (.cutX 7168 (.cutY 19456 (.cutX 6656 .empty (.cutY 18944 .empty (.cutX 6912 (.cutY 19200 .empty (.cutX 6784 (.cutY 19328 (.cutX 6720 (.cutY 19264 .full .full) (.cutY 19264 .full .full)) .full) (.cutY 19328 (.cutX 6848 (.cutY 19264 (.cutX 6816 (.cutY 19232 .full .full) (.cutY 19232 .full .full)) .full) (.cutY 19264 (.cutX 6880 (.cutY 19232 .full .full) (.cutY 19232 (.cutX 6896 (.cutY 19216 .full .full) (.cutY 19216 .full .full)) .full)) .full)) .full))) .empty))) .empty) .empty))) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 (.cutX 13312 .empty (.cutY 25600 .empty (.cutX 13824 (.cutY 26112 (.cutX 13568 (.cutY 25856 .empty (.cutX 13440 (.cutY 25984 .full .full) (.cutY 25984 (.cutX 13504 (.cutY 25920 .full .full) (.cutY 25920 (.cutX 13536 (.cutY 25888 .full .full) (.cutY 25888 (.cutX 13552 (.cutY 25872 .full .full) (.cutY 25872 .full .full)) .full)) (.cutX 13536 (.cutY 25952 .full .full) (.cutY 25952 .full .full)))) (.cutX 13504 (.cutY 26048 .full .full) (.cutY 26048 .full .full))))) .empty) .empty) .empty))) .empty) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 .empty (.cutX 19456 (.cutY 7168 (.cutX 18944 .empty (.cutY 6656 .empty (.cutX 19200 .empty (.cutY 6912 (.cutX 19328 (.cutY 6784 (.cutX 19264 (.cutY 6720 .full .full) (.cutY 6720 .full .full)) (.cutX 19264 (.cutY 6848 (.cutX 19232 (.cutY 6816 .full .full) (.cutY 6816 .full .full)) (.cutX 19232 (.cutY 6880 .full (.cutX 19216 (.cutY 6896 .full .full) (.cutY 6896 .full .full))) (.cutY 6880 .full .full))) (.cutY 6848 .full .full))) (.cutY 6784 .full .full)) .empty)))) .empty) .empty)))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 (.cutX 25600 .empty (.cutY 13312 .empty (.cutX 26112 (.cutY 13824 (.cutX 25856 .empty (.cutY 13568 (.cutX 25984 (.cutY 13440 .full (.cutX 25920 (.cutY 13504 .full (.cutX 25888 (.cutY 13536 .full (.cutX 25872 (.cutY 13552 .full .full) (.cutY 13552 .full .full))) (.cutY 13536 .full .full))) (.cutY 13504 .full (.cutX 25952 (.cutY 13536 .full .full) (.cutY 13536 .full .full))))) (.cutY 13440 .full (.cutX 26048 (.cutY 13504 .full .full) (.cutY 13504 .full .full)))) .empty)) .empty) .empty))) .empty) .empty)) .empty))) .empty))

theorem metadata64 : 0<140060506 ∧ 26<128 ∧ 75<128 ∧ 1<4 ∧
    6887/4160=1 ∧ 6887%4160=2727 ∧ ∀ i, (leaves64 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData64).mp
    (by decide +kernel)

theorem sourceChecked64_0 : ∀ i : Fin 64,
    (fun i => output64 i = raw64 (source64 i)) (finOffset 76 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked64_64 : ∀ i : Fin 12,
    (fun i => output64 i = raw64 (source64 i)) (finOffset 76 64 12 (by decide) i) := by decide +kernel

theorem sourceChecked64 : ∀ i : Fin 76, (fun i => output64 i = raw64 (source64 i)) i :=
  forallFin_of_zero_offset (fun i => output64 i = raw64 (source64 i)) (forallFinOffset_add (fun i => output64 i = raw64 (source64 i)) 0 64 12 (by decide) sourceChecked64_0
    sourceChecked64_64)

theorem coverChecked64_0 : ∀ i : Fin 64,
    (fun i => (output64 (cover64 i)).ContainsBox (raw64 i)) (finOffset 76 0 64 (by decide) i) := by decide +kernel

theorem coverChecked64_64 : ∀ i : Fin 12,
    (fun i => (output64 (cover64 i)).ContainsBox (raw64 i)) (finOffset 76 64 12 (by decide) i) := by decide +kernel

theorem coverChecked64 : ∀ i : Fin 76, (fun i => (output64 (cover64 i)).ContainsBox (raw64 i)) i :=
  forallFin_of_zero_offset (fun i => (output64 (cover64 i)).ContainsBox (raw64 i)) (forallFinOffset_add (fun i => (output64 (cover64 i)).ContainsBox (raw64 i)) 0 64 12 (by decide) coverChecked64_0
    coverChecked64_64)

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

noncomputable def phaseMass64 : ℝ := singlePhaseMass (140060506/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw64 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass64_eq : phaseMass64 = (70030253/819200000000 : ℝ) := by
  unfold phaseMass64
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw64 output64 cover64 source64
    (gridTreeUnionCheck_sound 32768 raw64 output64 cover64 source64 tree64 checked64)
    _ (by norm_num) _, areaUnits64]
  norm_num

-- Frozen phase 5412, atom 4346, type 1, source (1,59).
def leavesData65 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩))) (.node (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩)))) (.node (.node (.node (.single ⟨3,4,0⟩) (.single ⟨3,4,1⟩)) (.node (.single ⟨3,5,0⟩) (.single ⟨3,5,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves65 : Fin 16 → DyadicLeaf := leavesData65.get
def raw65 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 1 59 leaves65 i
def outputData65 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨256,320,15104,15168⟩) (.single ⟨256,320,15168,15232⟩)) (.node (.single ⟨320,384,15104,15168⟩) (.single ⟨320,384,15168,15232⟩))) (.node (.node (.single ⟨256,384,15232,15360⟩) (.single ⟨384,416,15104,15136⟩)) (.node (.single ⟨384,416,15136,15168⟩) (.single ⟨416,448,15104,15136⟩)))) (.node (.node (.node (.single ⟨416,448,15136,15168⟩) (.single ⟨384,448,15168,15232⟩)) (.node (.single ⟨448,480,15104,15136⟩) (.single ⟨448,480,15136,15168⟩))) (.node (.node (.single ⟨480,512,15104,15136⟩) (.single ⟨480,512,15136,15168⟩)) (.node (.single ⟨448,512,15168,15232⟩) (.single ⟨384,512,15232,15360⟩))))) (.node (.node (.node (.node (.single ⟨15104,15168,256,320⟩) (.single ⟨15104,15168,320,384⟩)) (.node (.single ⟨15168,15232,256,320⟩) (.single ⟨15168,15232,320,384⟩))) (.node (.node (.single ⟨15104,15136,384,416⟩) (.single ⟨15104,15136,416,448⟩)) (.node (.single ⟨15136,15168,384,416⟩) (.single ⟨15136,15168,416,448⟩)))) (.node (.node (.node (.single ⟨15104,15136,448,480⟩) (.single ⟨15104,15136,480,512⟩)) (.node (.single ⟨15136,15168,448,480⟩) (.single ⟨15136,15168,480,512⟩))) (.node (.node (.single ⟨15168,15232,384,448⟩) (.single ⟨15168,15232,448,512⟩)) (.node (.single ⟨15232,15360,256,384⟩) (.single ⟨15232,15360,384,512⟩)))))) (.node (.node (.node (.node (.node (.single ⟨17408,17536,32256,32384⟩) (.single ⟨17408,17536,32384,32512⟩)) (.node (.single ⟨17536,17600,32256,32320⟩) (.single ⟨17536,17600,32320,32384⟩))) (.node (.node (.single ⟨17600,17632,32256,32288⟩) (.single ⟨17600,17632,32288,32320⟩)) (.node (.single ⟨17632,17664,32256,32288⟩) (.single ⟨17632,17664,32288,32320⟩)))) (.node (.node (.node (.single ⟨17600,17632,32320,32352⟩) (.single ⟨17600,17632,32352,32384⟩)) (.node (.single ⟨17632,17664,32320,32352⟩) (.single ⟨17632,17664,32352,32384⟩))) (.node (.node (.single ⟨17536,17600,32384,32448⟩) (.single ⟨17536,17600,32448,32512⟩)) (.node (.single ⟨17600,17664,32384,32448⟩) (.single ⟨17600,17664,32448,32512⟩))))) (.node (.node (.node (.node (.single ⟨32256,32384,17408,17536⟩) (.single ⟨32256,32320,17536,17600⟩)) (.node (.single ⟨32256,32288,17600,17632⟩) (.single ⟨32256,32288,17632,17664⟩))) (.node (.node (.single ⟨32288,32320,17600,17632⟩) (.single ⟨32288,32320,17632,17664⟩)) (.node (.single ⟨32320,32384,17536,17600⟩) (.single ⟨32320,32352,17600,17632⟩)))) (.node (.node (.node (.single ⟨32320,32352,17632,17664⟩) (.single ⟨32352,32384,17600,17632⟩)) (.node (.single ⟨32352,32384,17632,17664⟩) (.single ⟨32384,32512,17408,17536⟩))) (.node (.node (.single ⟨32384,32448,17536,17600⟩) (.single ⟨32384,32448,17600,17664⟩)) (.node (.single ⟨32448,32512,17536,17600⟩) (.single ⟨32448,32512,17600,17664⟩)))))))
def output65 : Fin 64 → GridBox := outputData65.get
def coverData65 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 30)) (.node (.single 59) (.single 33))) (.node (.node (.single 15) (.single 31)) (.node (.single 48) (.single 32)))) (.node (.node (.node (.single 0) (.single 16)) (.node (.single 63) (.single 47))) (.node (.node (.single 1) (.single 18)) (.node (.single 62) (.single 45))))) (.node (.node (.node (.node (.single 2) (.single 17)) (.node (.single 61) (.single 46))) (.node (.node (.single 3) (.single 19)) (.node (.single 60) (.single 44)))) (.node (.node (.node (.single 9) (.single 28)) (.node (.single 54) (.single 35))) (.node (.node (.single 14) (.single 29)) (.node (.single 49) (.single 34)))))) (.node (.node (.node (.node (.node (.single 5) (.single 20)) (.node (.single 58) (.single 43))) (.node (.node (.single 6) (.single 22)) (.node (.single 57) (.single 41)))) (.node (.node (.node (.single 7) (.single 21)) (.node (.single 56) (.single 42))) (.node (.node (.single 8) (.single 23)) (.node (.single 55) (.single 40))))) (.node (.node (.node (.node (.single 10) (.single 24)) (.node (.single 53) (.single 39))) (.node (.node (.single 11) (.single 26)) (.node (.single 52) (.single 37)))) (.node (.node (.node (.single 12) (.single 25)) (.node (.single 51) (.single 38))) (.node (.node (.single 13) (.single 27)) (.node (.single 50) (.single 36)))))))
def sourceData65 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.single 20))) (.node (.node (.single 0) (.single 32)) (.node (.single 36) (.single 40)))) (.node (.node (.node (.single 44) (.single 24)) (.node (.single 48) (.single 52))) (.node (.node (.single 56) (.single 60)) (.node (.single 28) (.single 4))))) (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.single 21))) (.node (.node (.single 33) (.single 41)) (.node (.single 37) (.single 45)))) (.node (.node (.node (.single 49) (.single 57)) (.node (.single 53) (.single 61))) (.node (.node (.single 25) (.single 29)) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.node (.single 7) (.single 3)) (.node (.single 31) (.single 27))) (.node (.node (.single 63) (.single 55)) (.node (.single 59) (.single 51)))) (.node (.node (.node (.single 47) (.single 39)) (.node (.single 43) (.single 35))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11))))) (.node (.node (.node (.node (.single 6) (.single 30)) (.node (.single 62) (.single 58))) (.node (.node (.single 54) (.single 50)) (.node (.single 26) (.single 46)))) (.node (.node (.node (.single 42) (.single 38)) (.node (.single 34) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover65 (i : Fin 64) : Fin 64 := ⟨coverData65.get i % 64, Nat.mod_lt _ (by decide)⟩
def source65 (i : Fin 64) : Fin 64 := ⟨sourceData65.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree65 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 .empty (.cutX 1024 (.cutY 15360 (.cutX 512 (.cutY 14848 .empty (.cutX 256 .empty (.cutY 15104 .empty (.cutX 384 (.cutY 15232 (.cutX 320 (.cutY 15168 .full .full) (.cutY 15168 .full .full)) .full) (.cutY 15232 (.cutX 448 (.cutY 15168 (.cutX 416 (.cutY 15136 .full .full) (.cutY 15136 .full .full)) .full) (.cutY 15168 (.cutX 480 (.cutY 15136 .full .full) (.cutY 15136 .full .full)) .full)) .full))))) .empty) .empty) .empty)) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 (.cutX 15360 (.cutY 1024 (.cutX 14848 .empty (.cutY 512 (.cutX 15104 .empty (.cutY 256 .empty (.cutX 15232 (.cutY 384 (.cutX 15168 (.cutY 320 .full .full) (.cutY 320 .full .full)) (.cutX 15168 (.cutY 448 (.cutX 15136 (.cutY 416 .full .full) (.cutY 416 .full .full)) (.cutX 15136 (.cutY 480 .full .full) (.cutY 480 .full .full))) (.cutY 448 .full .full))) (.cutY 384 .full .full)))) .empty)) .empty) .empty) .empty)) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 .empty (.cutX 17408 .empty (.cutY 31744 .empty (.cutX 17920 (.cutY 32256 .empty (.cutX 17664 (.cutY 32512 (.cutX 17536 (.cutY 32384 .full .full) (.cutY 32384 (.cutX 17600 (.cutY 32320 .full .full) (.cutY 32320 (.cutX 17632 (.cutY 32288 .full .full) (.cutY 32288 .full .full)) (.cutX 17632 (.cutY 32352 .full .full) (.cutY 32352 .full .full)))) (.cutX 17600 (.cutY 32448 .full .full) (.cutY 32448 .full .full)))) .empty) .empty)) .empty)))) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 (.cutX 31744 .empty (.cutY 17408 .empty (.cutX 32256 .empty (.cutY 17920 (.cutX 32512 (.cutY 17664 (.cutX 32384 (.cutY 17536 .full (.cutX 32320 (.cutY 17600 .full (.cutX 32288 (.cutY 17632 .full .full) (.cutY 17632 .full .full))) (.cutY 17600 .full (.cutX 32352 (.cutY 17632 .full .full) (.cutY 17632 .full .full))))) (.cutY 17536 .full (.cutX 32448 (.cutY 17600 .full .full) (.cutY 17600 .full .full)))) .empty) .empty) .empty)))) .empty)) .empty)) .empty))))

theorem metadata65 : 0<169648215 ∧ 1<128 ∧ 59<128 ∧ 1<4 ∧
    4346/4160=1 ∧ 4346%4160=186 ∧ ∀ i, (leaves65 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData65).mp
    (by decide +kernel)

theorem sourceChecked65_0 : ∀ i : Fin 64,
    (fun i => output65 i = raw65 (source65 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked65 : ∀ i : Fin 64, (fun i => output65 i = raw65 (source65 i)) i :=
  forallFin_of_zero_offset (fun i => output65 i = raw65 (source65 i)) sourceChecked65_0

theorem coverChecked65_0 : ∀ i : Fin 64,
    (fun i => (output65 (cover65 i)).ContainsBox (raw65 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked65 : ∀ i : Fin 64, (fun i => (output65 (cover65 i)).ContainsBox (raw65 i)) i :=
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

noncomputable def phaseMass65 : ℝ := singlePhaseMass (169648215/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw65 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass65_eq : phaseMass65 = (33929643/327680000000 : ℝ) := by
  unfold phaseMass65
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw65 output65 cover65 source65
    (gridTreeUnionCheck_sound 32768 raw65 output65 cover65 source65 tree65 checked65)
    _ (by norm_num) _, areaUnits65]
  norm_num

-- Frozen phase 5413, atom 4953, type 1, source (6,61).
def leavesData66 : FiniteInputTree DyadicLeaf 25 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩))) (.node (.single ⟨2,1,0⟩) (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩))) (.node (.single ⟨2,3,2⟩) (.node (.single ⟨2,3,3⟩) (.single ⟨3,6,1⟩))))) (.node (.node (.node (.single ⟨3,7,1⟩) (.node (.single ⟨3,4,0⟩) (.single ⟨3,4,1⟩))) (.node (.single ⟨3,5,0⟩) (.node (.single ⟨3,5,1⟩) (.single ⟨4,12,0⟩)))) (.node (.node (.single ⟨4,12,1⟩) (.node (.single ⟨4,13,0⟩) (.single ⟨4,13,1⟩))) (.node (.node (.single ⟨4,14,0⟩) (.single ⟨4,14,1⟩)) (.node (.single ⟨4,15,0⟩) (.single ⟨4,15,1⟩))))))
def leaves66 : Fin 25 → DyadicLeaf := leavesData66.get
def raw66 (i : Fin 100) : GridBox := phaseImageBoxes 32768 8 6 61 leaves66 i
def outputData66 : FiniteInputTree GridBox 100 := (.node (.node (.node (.node (.node (.node (.single ⟨1536,1600,15616,15680⟩) (.node (.single ⟨1536,1600,15680,15744⟩) (.single ⟨1600,1664,15616,15680⟩))) (.node (.single ⟨1600,1664,15680,15744⟩) (.node (.single ⟨1536,1664,15744,15872⟩) (.single ⟨1664,1696,15616,15648⟩)))) (.node (.node (.single ⟨1664,1696,15648,15680⟩) (.node (.single ⟨1696,1728,15616,15648⟩) (.single ⟨1696,1728,15648,15680⟩))) (.node (.single ⟨1664,1728,15680,15744⟩) (.node (.single ⟨1728,1744,15616,15632⟩) (.single ⟨1728,1744,15632,15648⟩))))) (.node (.node (.node (.single ⟨1744,1760,15616,15632⟩) (.node (.single ⟨1744,1760,15632,15648⟩) (.single ⟨1728,1760,15648,15680⟩))) (.node (.single ⟨1760,1776,15616,15632⟩) (.node (.single ⟨1760,1776,15632,15648⟩) (.single ⟨1776,1792,15616,15632⟩)))) (.node (.node (.single ⟨1776,1792,15632,15648⟩) (.node (.single ⟨1760,1792,15648,15680⟩) (.single ⟨1728,1792,15680,15744⟩))) (.node (.node (.single ⟨1664,1728,15744,15808⟩) (.single ⟨1664,1728,15808,15872⟩)) (.node (.single ⟨1728,1792,15744,15808⟩) (.single ⟨1728,1792,15808,15872⟩)))))) (.node (.node (.node (.node (.single ⟨15616,15680,1536,1600⟩) (.node (.single ⟨15616,15680,1600,1664⟩) (.single ⟨15680,15744,1536,1600⟩))) (.node (.single ⟨15680,15744,1600,1664⟩) (.node (.single ⟨15616,15648,1664,1696⟩) (.single ⟨15616,15648,1696,1728⟩)))) (.node (.node (.single ⟨15648,15680,1664,1696⟩) (.node (.single ⟨15648,15680,1696,1728⟩) (.single ⟨15616,15632,1728,1744⟩))) (.node (.single ⟨15616,15632,1744,1760⟩) (.node (.single ⟨15632,15648,1728,1744⟩) (.single ⟨15632,15648,1744,1760⟩))))) (.node (.node (.node (.single ⟨15616,15632,1760,1776⟩) (.node (.single ⟨15616,15632,1776,1792⟩) (.single ⟨15632,15648,1760,1776⟩))) (.node (.single ⟨15632,15648,1776,1792⟩) (.node (.single ⟨15648,15680,1728,1760⟩) (.single ⟨15648,15680,1760,1792⟩)))) (.node (.node (.single ⟨15680,15744,1664,1728⟩) (.node (.single ⟨15680,15744,1728,1792⟩) (.single ⟨15744,15872,1536,1664⟩))) (.node (.node (.single ⟨15744,15808,1664,1728⟩) (.single ⟨15744,15808,1728,1792⟩)) (.node (.single ⟨15808,15872,1664,1728⟩) (.single ⟨15808,15872,1728,1792⟩))))))) (.node (.node (.node (.node (.node (.single ⟨16896,16960,30976,31040⟩) (.node (.single ⟨16896,16960,31040,31104⟩) (.single ⟨16960,17024,30976,31040⟩))) (.node (.single ⟨16960,17024,31040,31104⟩) (.node (.single ⟨16896,17024,31104,31232⟩) (.single ⟨17024,17088,30976,31040⟩)))) (.node (.node (.single ⟨17024,17088,31040,31104⟩) (.node (.single ⟨17088,17120,30976,31008⟩) (.single ⟨17088,17120,31008,31040⟩))) (.node (.single ⟨17120,17136,30976,30992⟩) (.node (.single ⟨17120,17136,30992,31008⟩) (.single ⟨17136,17152,30976,30992⟩))))) (.node (.node (.node (.single ⟨17136,17152,30992,31008⟩) (.node (.single ⟨17120,17136,31008,31024⟩) (.single ⟨17120,17136,31024,31040⟩))) (.node (.single ⟨17136,17152,31008,31024⟩) (.node (.single ⟨17136,17152,31024,31040⟩) (.single ⟨17088,17120,31040,31072⟩)))) (.node (.node (.single ⟨17088,17120,31072,31104⟩) (.node (.single ⟨17120,17152,31040,31072⟩) (.single ⟨17120,17152,31072,31104⟩))) (.node (.node (.single ⟨17024,17088,31104,31168⟩) (.single ⟨17024,17088,31168,31232⟩)) (.node (.single ⟨17088,17152,31104,31168⟩) (.single ⟨17088,17152,31168,31232⟩)))))) (.node (.node (.node (.node (.single ⟨30976,31040,16896,16960⟩) (.node (.single ⟨30976,31040,16960,17024⟩) (.single ⟨31040,31104,16896,16960⟩))) (.node (.single ⟨31040,31104,16960,17024⟩) (.node (.single ⟨30976,31040,17024,17088⟩) (.single ⟨30976,31008,17088,17120⟩)))) (.node (.node (.single ⟨30976,30992,17120,17136⟩) (.node (.single ⟨30976,30992,17136,17152⟩) (.single ⟨30992,31008,17120,17136⟩))) (.node (.single ⟨30992,31008,17136,17152⟩) (.node (.single ⟨31008,31040,17088,17120⟩) (.single ⟨31008,31024,17120,17136⟩))))) (.node (.node (.node (.single ⟨31008,31024,17136,17152⟩) (.node (.single ⟨31024,31040,17120,17136⟩) (.single ⟨31024,31040,17136,17152⟩))) (.node (.single ⟨31040,31104,17024,17088⟩) (.node (.single ⟨31040,31072,17088,17120⟩) (.single ⟨31040,31072,17120,17152⟩)))) (.node (.node (.single ⟨31072,31104,17088,17120⟩) (.node (.single ⟨31072,31104,17120,17152⟩) (.single ⟨31104,31232,16896,17024⟩))) (.node (.node (.single ⟨31104,31168,17024,17088⟩) (.single ⟨31104,31168,17088,17152⟩)) (.node (.single ⟨31168,31232,17024,17088⟩) (.single ⟨31168,31232,17088,17152⟩))))))))
def output66 : Fin 100 → GridBox := outputData66.get
def coverData66 : FiniteInputTree ℕ 100 := (.node (.node (.node (.node (.node (.node (.single 4) (.node (.single 45) (.single 95))) (.node (.single 54) (.node (.single 0) (.single 25)))) (.node (.node (.single 99) (.node (.single 74) (.single 1))) (.node (.single 27) (.node (.single 98) (.single 72))))) (.node (.node (.node (.single 2) (.node (.single 26) (.single 97))) (.node (.single 73) (.node (.single 3) (.single 28)))) (.node (.node (.single 96) (.node (.single 71) (.single 9))) (.node (.node (.single 43) (.single 90)) (.node (.single 56) (.single 20)))))) (.node (.node (.node (.node (.single 44) (.node (.single 79) (.single 55))) (.node (.single 21) (.node (.single 46) (.single 78)))) (.node (.node (.single 53) (.node (.single 22) (.single 48))) (.node (.single 77) (.node (.single 51) (.single 23))))) (.node (.node (.node (.single 47) (.node (.single 76) (.single 52))) (.node (.single 24) (.node (.single 49) (.single 75)))) (.node (.node (.single 50) (.node (.single 14) (.single 41))) (.node (.node (.single 85) (.single 58)) (.node (.single 19) (.single 42))))))) (.node (.node (.node (.node (.node (.single 80) (.node (.single 57) (.single 5))) (.node (.single 29) (.node (.single 94) (.single 70)))) (.node (.node (.single 6) (.node (.single 31) (.single 93))) (.node (.single 68) (.node (.single 7) (.single 30))))) (.node (.node (.node (.single 92) (.node (.single 69) (.single 8))) (.node (.single 32) (.node (.single 91) (.single 67)))) (.node (.node (.single 10) (.node (.single 33) (.single 89))) (.node (.node (.single 66) (.single 11)) (.node (.single 35) (.single 88)))))) (.node (.node (.node (.node (.single 64) (.node (.single 12) (.single 34))) (.node (.single 87) (.node (.single 65) (.single 13)))) (.node (.node (.single 36) (.node (.single 86) (.single 63))) (.node (.single 15) (.node (.single 37) (.single 84))))) (.node (.node (.node (.single 62) (.node (.single 16) (.single 39))) (.node (.single 83) (.node (.single 60) (.single 17)))) (.node (.node (.single 38) (.node (.single 82) (.single 61))) (.node (.node (.single 18) (.single 40)) (.node (.single 81) (.single 59))))))))
def sourceData66 : FiniteInputTree ℕ 100 := (.node (.node (.node (.node (.node (.node (.single 4) (.node (.single 8) (.single 12))) (.node (.single 16) (.node (.single 0) (.single 52)))) (.node (.node (.single 56) (.node (.single 60) (.single 64))) (.node (.single 20) (.node (.single 68) (.single 72))))) (.node (.node (.node (.single 76) (.node (.single 80) (.single 44))) (.node (.single 84) (.node (.single 88) (.single 92)))) (.node (.node (.single 96) (.node (.single 48) (.single 24))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.single 40)))))) (.node (.node (.node (.node (.single 5) (.node (.single 13) (.single 9))) (.node (.single 17) (.node (.single 53) (.single 61)))) (.node (.node (.single 57) (.node (.single 65) (.single 69))) (.node (.single 77) (.node (.single 73) (.single 81))))) (.node (.node (.node (.single 85) (.node (.single 93) (.single 89))) (.node (.single 97) (.node (.single 45) (.single 49)))) (.node (.node (.single 21) (.node (.single 25) (.single 1))) (.node (.node (.single 29) (.single 37)) (.node (.single 33) (.single 41))))))) (.node (.node (.node (.node (.node (.single 43) (.node (.single 35) (.single 39))) (.node (.single 31) (.node (.single 3) (.single 27)))) (.node (.node (.single 23) (.node (.single 51) (.single 47))) (.node (.single 99) (.node (.single 91) (.single 95))))) (.node (.node (.node (.single 87) (.node (.single 83) (.single 75))) (.node (.single 79) (.node (.single 71) (.single 67)))) (.node (.node (.single 59) (.node (.single 63) (.single 55))) (.node (.node (.single 19) (.single 11)) (.node (.single 15) (.single 7)))))) (.node (.node (.node (.node (.single 42) (.node (.single 38) (.single 34))) (.node (.single 30) (.node (.single 26) (.single 50)))) (.node (.node (.single 98) (.node (.single 94) (.single 90))) (.node (.single 86) (.node (.single 46) (.single 82))))) (.node (.node (.node (.single 78) (.node (.single 74) (.single 70))) (.node (.single 22) (.node (.single 66) (.single 62)))) (.node (.node (.single 58) (.node (.single 54) (.single 2))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.single 6))))))))
def cover66 (i : Fin 100) : Fin 100 := ⟨coverData66.get i % 100, Nat.mod_lt _ (by decide)⟩
def source66 (i : Fin 100) : Fin 100 := ⟨sourceData66.get i % 100, Nat.mod_lt _ (by decide)⟩
def tree66 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 .empty (.cutX 1024 .empty (.cutY 15360 .empty (.cutX 1536 .empty (.cutY 15872 (.cutX 1792 (.cutY 15616 .empty (.cutX 1664 (.cutY 15744 (.cutX 1600 (.cutY 15680 .full .full) (.cutY 15680 .full .full)) .full) (.cutY 15744 (.cutX 1728 (.cutY 15680 (.cutX 1696 (.cutY 15648 .full .full) (.cutY 15648 .full .full)) .full) (.cutY 15680 (.cutX 1760 (.cutY 15648 (.cutX 1744 (.cutY 15632 .full .full) (.cutY 15632 .full .full)) .full) (.cutY 15648 (.cutX 1776 (.cutY 15632 .full .full) (.cutY 15632 .full .full)) .full)) .full)) (.cutX 1728 (.cutY 15808 .full .full) (.cutY 15808 .full .full))))) .empty) .empty))))) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 (.cutX 15360 .empty (.cutY 1024 .empty (.cutX 15872 (.cutY 1536 .empty (.cutX 15616 .empty (.cutY 1792 (.cutX 15744 (.cutY 1664 (.cutX 15680 (.cutY 1600 .full .full) (.cutY 1600 .full .full)) (.cutX 15680 (.cutY 1728 (.cutX 15648 (.cutY 1696 .full .full) (.cutY 1696 .full .full)) (.cutX 15648 (.cutY 1760 (.cutX 15632 (.cutY 1744 .full .full) (.cutY 1744 .full .full)) (.cutX 15632 (.cutY 1776 .full .full) (.cutY 1776 .full .full))) (.cutY 1760 .full .full))) (.cutY 1728 .full .full))) (.cutY 1664 .full (.cutX 15808 (.cutY 1728 .full .full) (.cutY 1728 .full .full)))) .empty))) .empty))) .empty)) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 .empty (.cutX 17408 (.cutY 31744 (.cutX 16896 .empty (.cutY 31232 (.cutX 17152 (.cutY 30976 .empty (.cutX 17024 (.cutY 31104 (.cutX 16960 (.cutY 31040 .full .full) (.cutY 31040 .full .full)) .full) (.cutY 31104 (.cutX 17088 (.cutY 31040 .full .full) (.cutY 31040 (.cutX 17120 (.cutY 31008 .full .full) (.cutY 31008 (.cutX 17136 (.cutY 30992 .full .full) (.cutY 30992 .full .full)) (.cutX 17136 (.cutY 31024 .full .full) (.cutY 31024 .full .full)))) (.cutX 17120 (.cutY 31072 .full .full) (.cutY 31072 .full .full)))) (.cutX 17088 (.cutY 31168 .full .full) (.cutY 31168 .full .full))))) .empty) .empty)) .empty) .empty)) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 (.cutX 31744 (.cutY 17408 (.cutX 31232 (.cutY 16896 .empty (.cutX 30976 .empty (.cutY 17152 (.cutX 31104 (.cutY 17024 (.cutX 31040 (.cutY 16960 .full .full) (.cutY 16960 .full .full)) (.cutX 31040 (.cutY 17088 .full (.cutX 31008 (.cutY 17120 .full (.cutX 30992 (.cutY 17136 .full .full) (.cutY 17136 .full .full))) (.cutY 17120 .full (.cutX 31024 (.cutY 17136 .full .full) (.cutY 17136 .full .full))))) (.cutY 17088 .full (.cutX 31072 (.cutY 17120 .full .full) (.cutY 17120 .full .full))))) (.cutY 17024 .full (.cutX 31168 (.cutY 17088 .full .full) (.cutY 17088 .full .full)))) .empty))) .empty) .empty) .empty) .empty)) .empty)) .empty))))

theorem metadata66 : 0<169648215 ∧ 6<128 ∧ 61<128 ∧ 1<4 ∧
    4953/4160=1 ∧ 4953%4160=793 ∧ ∀ i, (leaves66 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData66).mp
    (by decide +kernel)

theorem sourceChecked66_0 : ∀ i : Fin 64,
    (fun i => output66 i = raw66 (source66 i)) (finOffset 100 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked66_64 : ∀ i : Fin 36,
    (fun i => output66 i = raw66 (source66 i)) (finOffset 100 64 36 (by decide) i) := by decide +kernel

theorem sourceChecked66 : ∀ i : Fin 100, (fun i => output66 i = raw66 (source66 i)) i :=
  forallFin_of_zero_offset (fun i => output66 i = raw66 (source66 i)) (forallFinOffset_add (fun i => output66 i = raw66 (source66 i)) 0 64 36 (by decide) sourceChecked66_0
    sourceChecked66_64)

theorem coverChecked66_0 : ∀ i : Fin 64,
    (fun i => (output66 (cover66 i)).ContainsBox (raw66 i)) (finOffset 100 0 64 (by decide) i) := by decide +kernel

theorem coverChecked66_64 : ∀ i : Fin 36,
    (fun i => (output66 (cover66 i)).ContainsBox (raw66 i)) (finOffset 100 64 36 (by decide) i) := by decide +kernel

theorem coverChecked66 : ∀ i : Fin 100, (fun i => (output66 (cover66 i)).ContainsBox (raw66 i)) i :=
  forallFin_of_zero_offset (fun i => (output66 (cover66 i)).ContainsBox (raw66 i)) (forallFinOffset_add (fun i => (output66 (cover66 i)).ContainsBox (raw66 i)) 0 64 36 (by decide) coverChecked66_0
    coverChecked66_64)

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

noncomputable def phaseMass66 : ℝ := singlePhaseMass (169648215/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw66 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass66_eq : phaseMass66 = (33929643/327680000000 : ℝ) := by
  unfold phaseMass66
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw66 output66 cover66 source66
    (gridTreeUnionCheck_sound 32768 raw66 output66 cover66 source66 tree66 checked66)
    _ (by norm_num) _, areaUnits66]
  norm_num

-- Frozen phase 5414, atom 4595, type 1, source (3,60).
def leavesData67 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,0⟩))) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves67 : Fin 13 → DyadicLeaf := leavesData67.get
def raw67 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 3 60 leaves67 i
def outputData67 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨768,832,15360,15424⟩) (.node (.single ⟨768,832,15424,15488⟩) (.single ⟨832,896,15360,15424⟩))) (.node (.single ⟨832,896,15424,15488⟩) (.node (.single ⟨768,896,15488,15616⟩) (.single ⟨896,960,15360,15424⟩)))) (.node (.node (.single ⟨896,960,15424,15488⟩) (.node (.single ⟨960,992,15360,15392⟩) (.single ⟨960,992,15392,15424⟩))) (.node (.node (.single ⟨992,1024,15360,15392⟩) (.single ⟨992,1024,15392,15424⟩)) (.node (.single ⟨960,1024,15424,15488⟩) (.single ⟨896,1024,15488,15616⟩))))) (.node (.node (.node (.single ⟨15360,15424,768,832⟩) (.node (.single ⟨15360,15424,832,896⟩) (.single ⟨15424,15488,768,832⟩))) (.node (.single ⟨15424,15488,832,896⟩) (.node (.single ⟨15360,15424,896,960⟩) (.single ⟨15360,15392,960,992⟩)))) (.node (.node (.single ⟨15360,15392,992,1024⟩) (.node (.single ⟨15392,15424,960,992⟩) (.single ⟨15392,15424,992,1024⟩))) (.node (.node (.single ⟨15424,15488,896,960⟩) (.single ⟨15424,15488,960,1024⟩)) (.node (.single ⟨15488,15616,768,896⟩) (.single ⟨15488,15616,896,1024⟩)))))) (.node (.node (.node (.node (.single ⟨17152,17280,31744,31872⟩) (.node (.single ⟨17152,17280,31872,32000⟩) (.single ⟨17280,17344,31744,31808⟩))) (.node (.single ⟨17280,17344,31808,31872⟩) (.node (.single ⟨17344,17376,31744,31776⟩) (.single ⟨17344,17376,31776,31808⟩)))) (.node (.node (.single ⟨17376,17408,31744,31776⟩) (.node (.single ⟨17376,17408,31776,31808⟩) (.single ⟨17344,17408,31808,31872⟩))) (.node (.node (.single ⟨17280,17344,31872,31936⟩) (.single ⟨17280,17344,31936,32000⟩)) (.node (.single ⟨17344,17408,31872,31936⟩) (.single ⟨17344,17408,31936,32000⟩))))) (.node (.node (.node (.single ⟨31744,31872,17152,17280⟩) (.node (.single ⟨31744,31808,17280,17344⟩) (.single ⟨31744,31776,17344,17376⟩))) (.node (.single ⟨31744,31776,17376,17408⟩) (.node (.single ⟨31776,31808,17344,17376⟩) (.single ⟨31776,31808,17376,17408⟩)))) (.node (.node (.single ⟨31808,31872,17280,17344⟩) (.node (.single ⟨31808,31872,17344,17408⟩) (.single ⟨31872,32000,17152,17280⟩))) (.node (.node (.single ⟨31872,31936,17280,17344⟩) (.single ⟨31872,31936,17344,17408⟩)) (.node (.single ⟨31936,32000,17280,17344⟩) (.single ⟨31936,32000,17344,17408⟩)))))))
def output67 : Fin 52 → GridBox := outputData67.get
def coverData67 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 24) (.single 47))) (.node (.single 27) (.node (.single 12) (.single 25)))) (.node (.node (.single 39) (.node (.single 26) (.single 0))) (.node (.node (.single 13) (.single 51)) (.node (.single 38) (.single 1))))) (.node (.node (.node (.single 15) (.node (.single 50) (.single 36))) (.node (.single 2) (.node (.single 14) (.single 49)))) (.node (.node (.single 37) (.node (.single 3) (.single 16))) (.node (.node (.single 48) (.single 35)) (.node (.single 5) (.single 17)))))) (.node (.node (.node (.node (.single 46) (.node (.single 34) (.single 6))) (.node (.single 22) (.node (.single 45) (.single 29)))) (.node (.node (.single 11) (.node (.single 23) (.single 40))) (.node (.node (.single 28) (.single 7)) (.node (.single 18) (.single 44))))) (.node (.node (.node (.single 33) (.node (.single 8) (.single 20))) (.node (.single 43) (.node (.single 31) (.single 9)))) (.node (.node (.single 19) (.node (.single 42) (.single 32))) (.node (.node (.single 10) (.single 21)) (.node (.single 41) (.single 30)))))))
def sourceData67 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.single 20) (.node (.single 0) (.single 24)))) (.node (.node (.single 28) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.single 9) (.node (.single 17) (.single 13))) (.node (.single 21) (.node (.single 25) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.single 7) (.node (.single 3) (.single 35))) (.node (.single 31) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11))))) (.node (.node (.node (.single 6) (.node (.single 34) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 30) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover67 (i : Fin 52) : Fin 52 := ⟨coverData67.get i % 52, Nat.mod_lt _ (by decide)⟩
def source67 (i : Fin 52) : Fin 52 := ⟨sourceData67.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree67 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 .empty (.cutX 1024 (.cutY 15360 .empty (.cutX 512 .empty (.cutY 15872 (.cutX 768 .empty (.cutY 15616 (.cutX 896 (.cutY 15488 (.cutX 832 (.cutY 15424 .full .full) (.cutY 15424 .full .full)) .full) (.cutY 15488 (.cutX 960 (.cutY 15424 .full .full) (.cutY 15424 (.cutX 992 (.cutY 15392 .full .full) (.cutY 15392 .full .full)) .full)) .full)) .empty)) .empty))) .empty)) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 (.cutX 15360 .empty (.cutY 1024 (.cutX 15872 (.cutY 512 .empty (.cutX 15616 (.cutY 768 .empty (.cutX 15488 (.cutY 896 (.cutX 15424 (.cutY 832 .full .full) (.cutY 832 .full .full)) (.cutX 15424 (.cutY 960 .full (.cutX 15392 (.cutY 992 .full .full) (.cutY 992 .full .full))) (.cutY 960 .full .full))) (.cutY 896 .full .full))) .empty)) .empty) .empty)) .empty)) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 .empty (.cutX 17408 (.cutY 31744 .empty (.cutX 16896 .empty (.cutY 32256 (.cutX 17152 .empty (.cutY 32000 (.cutX 17280 (.cutY 31872 .full .full) (.cutY 31872 (.cutX 17344 (.cutY 31808 .full .full) (.cutY 31808 (.cutX 17376 (.cutY 31776 .full .full) (.cutY 31776 .full .full)) .full)) (.cutX 17344 (.cutY 31936 .full .full) (.cutY 31936 .full .full)))) .empty)) .empty))) .empty)) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 (.cutX 31744 .empty (.cutY 17408 (.cutX 32256 (.cutY 16896 .empty (.cutX 32000 (.cutY 17152 .empty (.cutX 31872 (.cutY 17280 .full (.cutX 31808 (.cutY 17344 .full (.cutX 31776 (.cutY 17376 .full .full) (.cutY 17376 .full .full))) (.cutY 17344 .full .full))) (.cutY 17280 .full (.cutX 31936 (.cutY 17344 .full .full) (.cutY 17344 .full .full))))) .empty)) .empty) .empty)) .empty)) .empty)) .empty))))

theorem metadata67 : 0<169648215 ∧ 3<128 ∧ 60<128 ∧ 1<4 ∧
    4595/4160=1 ∧ 4595%4160=435 ∧ ∀ i, (leaves67 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData67).mp
    (by decide +kernel)

theorem sourceChecked67_0 : ∀ i : Fin 52,
    (fun i => output67 i = raw67 (source67 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked67 : ∀ i : Fin 52, (fun i => output67 i = raw67 (source67 i)) i :=
  forallFin_of_zero_offset (fun i => output67 i = raw67 (source67 i)) sourceChecked67_0

theorem coverChecked67_0 : ∀ i : Fin 52,
    (fun i => (output67 (cover67 i)).ContainsBox (raw67 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked67 : ∀ i : Fin 52, (fun i => (output67 (cover67 i)).ContainsBox (raw67 i)) i :=
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

noncomputable def phaseMass67 : ℝ := singlePhaseMass (169648215/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw67 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass67_eq : phaseMass67 = (33929643/327680000000 : ℝ) := by
  unfold phaseMass67
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw67 output67 cover67 source67
    (gridTreeUnionCheck_sound 32768 raw67 output67 cover67 source67 tree67 checked67)
    _ (by norm_num) _, areaUnits67]
  norm_num

-- Frozen phase 5415, atom 438, type 0, source (3,63).
def leavesData68 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves68 : Fin 10 → DyadicLeaf := leavesData68.get
def raw68 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 3 63 leaves68 i
def outputData68 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨768,832,16128,16192⟩) (.single ⟨768,832,16192,16256⟩)) (.node (.single ⟨832,896,16128,16192⟩) (.node (.single ⟨832,896,16192,16256⟩) (.single ⟨768,896,16256,16384⟩)))) (.node (.node (.single ⟨896,960,16128,16192⟩) (.single ⟨896,960,16192,16256⟩)) (.node (.single ⟨960,1024,16128,16192⟩) (.node (.single ⟨960,1024,16192,16256⟩) (.single ⟨896,1024,16256,16384⟩))))) (.node (.node (.node (.single ⟨16128,16192,768,832⟩) (.single ⟨16128,16192,832,896⟩)) (.node (.single ⟨16192,16256,768,832⟩) (.node (.single ⟨16192,16256,832,896⟩) (.single ⟨16128,16192,896,960⟩)))) (.node (.node (.single ⟨16128,16192,960,1024⟩) (.single ⟨16192,16256,896,960⟩)) (.node (.single ⟨16192,16256,960,1024⟩) (.node (.single ⟨16256,16384,768,896⟩) (.single ⟨16256,16384,896,1024⟩)))))) (.node (.node (.node (.node (.single ⟨16384,16512,31744,31872⟩) (.single ⟨16384,16512,31872,32000⟩)) (.node (.single ⟨16512,16576,31744,31808⟩) (.node (.single ⟨16512,16576,31808,31872⟩) (.single ⟨16576,16640,31744,31808⟩)))) (.node (.node (.single ⟨16576,16640,31808,31872⟩) (.single ⟨16512,16576,31872,31936⟩)) (.node (.single ⟨16512,16576,31936,32000⟩) (.node (.single ⟨16576,16640,31872,31936⟩) (.single ⟨16576,16640,31936,32000⟩))))) (.node (.node (.node (.single ⟨31744,31872,16384,16512⟩) (.single ⟨31744,31808,16512,16576⟩)) (.node (.single ⟨31744,31808,16576,16640⟩) (.node (.single ⟨31808,31872,16512,16576⟩) (.single ⟨31808,31872,16576,16640⟩)))) (.node (.node (.single ⟨31872,32000,16384,16512⟩) (.single ⟨31872,31936,16512,16576⟩)) (.node (.single ⟨31872,31936,16576,16640⟩) (.node (.single ⟨31936,32000,16512,16576⟩) (.single ⟨31936,32000,16576,16640⟩)))))))
def output68 : Fin 40 → GridBox := outputData68.get
def coverData68 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 18)) (.node (.single 35) (.node (.single 21) (.single 9)))) (.node (.node (.single 19) (.single 30)) (.node (.single 20) (.node (.single 5) (.single 14))))) (.node (.node (.node (.single 34) (.single 25)) (.node (.single 6) (.node (.single 16) (.single 33)))) (.node (.node (.single 23) (.single 7)) (.node (.single 15) (.node (.single 32) (.single 24)))))) (.node (.node (.node (.node (.single 8) (.single 17)) (.node (.single 31) (.node (.single 22) (.single 0)))) (.node (.node (.single 10) (.single 39)) (.node (.single 29) (.node (.single 1) (.single 12))))) (.node (.node (.node (.single 38) (.single 27)) (.node (.single 2) (.node (.single 11) (.single 37)))) (.node (.node (.single 28) (.single 3)) (.node (.single 13) (.node (.single 36) (.single 26)))))))
def sourceData68 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover68 (i : Fin 40) : Fin 40 := ⟨coverData68.get i % 40, Nat.mod_lt _ (by decide)⟩
def source68 (i : Fin 40) : Fin 40 := ⟨sourceData68.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree68 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 .empty (.cutX 1024 (.cutY 15360 .empty (.cutX 512 .empty (.cutY 15872 .empty (.cutX 768 .empty (.cutY 16128 .empty (.cutX 896 (.cutY 16256 (.cutX 832 (.cutY 16192 .full .full) (.cutY 16192 .full .full)) .full) (.cutY 16256 (.cutX 960 (.cutY 16192 .full .full) (.cutY 16192 .full .full)) .full))))))) .empty)) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 (.cutX 15360 .empty (.cutY 1024 (.cutX 15872 .empty (.cutY 512 .empty (.cutX 16128 .empty (.cutY 768 .empty (.cutX 16256 (.cutY 896 (.cutX 16192 (.cutY 832 .full .full) (.cutY 832 .full .full)) (.cutX 16192 (.cutY 960 .full .full) (.cutY 960 .full .full))) (.cutY 896 .full .full)))))) .empty)) .empty)) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 .empty (.cutX 17408 (.cutY 31744 .empty (.cutX 16896 (.cutY 32256 (.cutX 16640 (.cutY 32000 (.cutX 16512 (.cutY 31872 .full .full) (.cutY 31872 (.cutX 16576 (.cutY 31808 .full .full) (.cutY 31808 .full .full)) (.cutX 16576 (.cutY 31936 .full .full) (.cutY 31936 .full .full)))) .empty) .empty) .empty) .empty)) .empty)) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 (.cutX 31744 .empty (.cutY 17408 (.cutX 32256 (.cutY 16896 (.cutX 32000 (.cutY 16640 (.cutX 31872 (.cutY 16512 .full (.cutX 31808 (.cutY 16576 .full .full) (.cutY 16576 .full .full))) (.cutY 16512 .full (.cutX 31936 (.cutY 16576 .full .full) (.cutY 16576 .full .full)))) .empty) .empty) .empty) .empty) .empty)) .empty)) .empty)) .empty))))

theorem metadata68 : 0<89519217 ∧ 3<128 ∧ 63<128 ∧ 0<4 ∧
    438/4160=0 ∧ 438%4160=438 ∧ ∀ i, (leaves68 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData68).mp
    (by decide +kernel)

theorem sourceChecked68_0 : ∀ i : Fin 40,
    (fun i => output68 i = raw68 (source68 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked68 : ∀ i : Fin 40, (fun i => output68 i = raw68 (source68 i)) i :=
  forallFin_of_zero_offset (fun i => output68 i = raw68 (source68 i)) sourceChecked68_0

theorem coverChecked68_0 : ∀ i : Fin 40,
    (fun i => (output68 (cover68 i)).ContainsBox (raw68 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked68 : ∀ i : Fin 40, (fun i => (output68 (cover68 i)).ContainsBox (raw68 i)) i :=
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

noncomputable def phaseMass68 : ℝ := singlePhaseMass (89519217/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw68 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass68_eq : phaseMass68 = (89519217/1638400000000 : ℝ) := by
  unfold phaseMass68
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw68 output68 cover68 source68
    (gridTreeUnionCheck_sound 32768 raw68 output68 cover68 source68 tree68 checked68)
    _ (by norm_num) _, areaUnits68]
  norm_num

-- Frozen phase 5416, atom 679, type 0, source (5,64).
def leavesData69 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves69 : Fin 7 → DyadicLeaf := leavesData69.get
def raw69 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 5 64 leaves69 i
def outputData69 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨1280,1408,16384,16512⟩) (.node (.single ⟨1280,1408,16512,16640⟩) (.single ⟨1408,1472,16384,16448⟩))) (.node (.node (.single ⟨1408,1472,16448,16512⟩) (.single ⟨1472,1536,16384,16448⟩)) (.node (.single ⟨1472,1536,16448,16512⟩) (.single ⟨1408,1536,16512,16640⟩)))) (.node (.node (.single ⟨16128,16256,31232,31360⟩) (.node (.single ⟨16128,16256,31360,31488⟩) (.single ⟨16256,16320,31232,31296⟩))) (.node (.node (.single ⟨16256,16320,31296,31360⟩) (.single ⟨16320,16384,31232,31296⟩)) (.node (.single ⟨16320,16384,31296,31360⟩) (.single ⟨16256,16384,31360,31488⟩))))) (.node (.node (.node (.single ⟨16384,16512,1280,1408⟩) (.node (.single ⟨16384,16448,1408,1472⟩) (.single ⟨16384,16448,1472,1536⟩))) (.node (.node (.single ⟨16448,16512,1408,1472⟩) (.single ⟨16448,16512,1472,1536⟩)) (.node (.single ⟨16512,16640,1280,1408⟩) (.single ⟨16512,16640,1408,1536⟩)))) (.node (.node (.single ⟨31232,31360,16128,16256⟩) (.node (.single ⟨31232,31296,16256,16320⟩) (.single ⟨31232,31296,16320,16384⟩))) (.node (.node (.single ⟨31296,31360,16256,16320⟩) (.single ⟨31296,31360,16320,16384⟩)) (.node (.single ⟨31360,31488,16128,16256⟩) (.single ⟨31360,31488,16256,16384⟩))))))
def output69 : Fin 28 → GridBox := outputData69.get
def coverData69 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData69 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover69 (i : Fin 28) : Fin 28 := ⟨coverData69.get i % 28, Nat.mod_lt _ (by decide)⟩
def source69 (i : Fin 28) : Fin 28 := ⟨sourceData69.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree69 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 (.cutX 1024 .empty (.cutY 17408 (.cutX 1536 (.cutY 16896 (.cutX 1280 .empty (.cutY 16640 (.cutX 1408 (.cutY 16512 .full .full) (.cutY 16512 (.cutX 1472 (.cutY 16448 .full .full) (.cutY 16448 .full .full)) .full)) .empty)) .empty) .empty) .empty)) .empty) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 .empty (.cutX 15360 .empty (.cutY 31744 (.cutX 15872 .empty (.cutY 31232 .empty (.cutX 16128 .empty (.cutY 31488 (.cutX 16256 (.cutY 31360 .full .full) (.cutY 31360 (.cutX 16320 (.cutY 31296 .full .full) (.cutY 31296 .full .full)) .full)) .empty)))) .empty))))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 (.cutX 17408 (.cutY 1024 .empty (.cutX 16896 (.cutY 1536 (.cutX 16640 (.cutY 1280 .empty (.cutX 16512 (.cutY 1408 .full (.cutX 16448 (.cutY 1472 .full .full) (.cutY 1472 .full .full))) (.cutY 1408 .full .full))) .empty) .empty) .empty)) .empty) .empty) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 .empty (.cutX 31744 (.cutY 15360 .empty (.cutX 31232 .empty (.cutY 15872 .empty (.cutX 31488 (.cutY 16128 .empty (.cutX 31360 (.cutY 16256 .full (.cutX 31296 (.cutY 16320 .full .full) (.cutY 16320 .full .full))) (.cutY 16256 .full .full))) .empty)))) .empty))))))) .empty))

theorem metadata69 : 0<114037843 ∧ 5<128 ∧ 64<128 ∧ 0<4 ∧
    679/4160=0 ∧ 679%4160=679 ∧ ∀ i, (leaves69 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData69).mp
    (by decide +kernel)

theorem sourceChecked69_0 : ∀ i : Fin 28,
    (fun i => output69 i = raw69 (source69 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked69 : ∀ i : Fin 28, (fun i => output69 i = raw69 (source69 i)) i :=
  forallFin_of_zero_offset (fun i => output69 i = raw69 (source69 i)) sourceChecked69_0

theorem coverChecked69_0 : ∀ i : Fin 28,
    (fun i => (output69 (cover69 i)).ContainsBox (raw69 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked69 : ∀ i : Fin 28, (fun i => (output69 (cover69 i)).ContainsBox (raw69 i)) i :=
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

noncomputable def phaseMass69 : ℝ := singlePhaseMass (114037843/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw69 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass69_eq : phaseMass69 = (114037843/1638400000000 : ℝ) := by
  unfold phaseMass69
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw69 output69 cover69 source69
    (gridTreeUnionCheck_sound 32768 raw69 output69 cover69 source69 tree69 checked69)
    _ (by norm_num) _, areaUnits69]
  norm_num

-- Frozen phase 5417, atom 62, type 0, source (0,62).
def leavesData70 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves70 : Fin 7 → DyadicLeaf := leavesData70.get
def raw70 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 0 62 leaves70 i
def outputData70 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨0,128,15872,16000⟩) (.node (.single ⟨0,128,16000,16128⟩) (.single ⟨128,192,15872,15936⟩))) (.node (.node (.single ⟨128,192,15936,16000⟩) (.single ⟨192,256,15872,15936⟩)) (.node (.single ⟨192,256,15936,16000⟩) (.single ⟨128,256,16000,16128⟩)))) (.node (.node (.single ⟨15872,16000,0,128⟩) (.node (.single ⟨15872,15936,128,192⟩) (.single ⟨15872,15936,192,256⟩))) (.node (.node (.single ⟨15936,16000,128,192⟩) (.single ⟨15936,16000,192,256⟩)) (.node (.single ⟨16000,16128,0,128⟩) (.single ⟨16000,16128,128,256⟩))))) (.node (.node (.node (.single ⟨16640,16768,32512,32640⟩) (.node (.single ⟨16640,16768,32640,32768⟩) (.single ⟨16768,16832,32512,32576⟩))) (.node (.node (.single ⟨16768,16832,32576,32640⟩) (.single ⟨16832,16896,32512,32576⟩)) (.node (.single ⟨16832,16896,32576,32640⟩) (.single ⟨16768,16896,32640,32768⟩)))) (.node (.node (.single ⟨32512,32640,16640,16768⟩) (.node (.single ⟨32512,32576,16768,16832⟩) (.single ⟨32512,32576,16832,16896⟩))) (.node (.node (.single ⟨32576,32640,16768,16832⟩) (.single ⟨32576,32640,16832,16896⟩)) (.node (.single ⟨32640,32768,16640,16768⟩) (.single ⟨32640,32768,16768,16896⟩))))))
def output70 : Fin 28 → GridBox := outputData70.get
def coverData70 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData70 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover70 (i : Fin 28) : Fin 28 := ⟨coverData70.get i % 28, Nat.mod_lt _ (by decide)⟩
def source70 (i : Fin 28) : Fin 28 := ⟨sourceData70.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree70 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 .empty (.cutX 1024 (.cutY 15360 .empty (.cutX 512 (.cutY 15872 .empty (.cutX 256 (.cutY 16128 (.cutX 128 (.cutY 16000 .full .full) (.cutY 16000 (.cutX 192 (.cutY 15936 .full .full) (.cutY 15936 .full .full)) .full)) .empty) .empty)) .empty)) .empty)) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 (.cutX 15360 .empty (.cutY 1024 (.cutX 15872 .empty (.cutY 512 (.cutX 16128 (.cutY 256 (.cutX 16000 (.cutY 128 .full (.cutX 15936 (.cutY 192 .full .full) (.cutY 192 .full .full))) (.cutY 128 .full .full)) .empty) .empty) .empty)) .empty)) .empty)) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 .empty (.cutX 17408 (.cutY 31744 .empty (.cutX 16896 (.cutY 32256 .empty (.cutX 16640 .empty (.cutY 32512 .empty (.cutX 16768 (.cutY 32640 .full .full) (.cutY 32640 (.cutX 16832 (.cutY 32576 .full .full) (.cutY 32576 .full .full)) .full))))) .empty)) .empty)) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 (.cutX 31744 .empty (.cutY 17408 (.cutX 32256 .empty (.cutY 16896 (.cutX 32512 .empty (.cutY 16640 .empty (.cutX 32640 (.cutY 16768 .full (.cutX 32576 (.cutY 16832 .full .full) (.cutY 16832 .full .full))) (.cutY 16768 .full .full)))) .empty)) .empty)) .empty)) .empty)) .empty))))

theorem metadata70 : 0<89519217 ∧ 0<128 ∧ 62<128 ∧ 0<4 ∧
    62/4160=0 ∧ 62%4160=62 ∧ ∀ i, (leaves70 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData70).mp
    (by decide +kernel)

theorem sourceChecked70_0 : ∀ i : Fin 28,
    (fun i => output70 i = raw70 (source70 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked70 : ∀ i : Fin 28, (fun i => output70 i = raw70 (source70 i)) i :=
  forallFin_of_zero_offset (fun i => output70 i = raw70 (source70 i)) sourceChecked70_0

theorem coverChecked70_0 : ∀ i : Fin 28,
    (fun i => (output70 (cover70 i)).ContainsBox (raw70 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked70 : ∀ i : Fin 28, (fun i => (output70 (cover70 i)).ContainsBox (raw70 i)) i :=
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

noncomputable def phaseMass70 : ℝ := singlePhaseMass (89519217/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw70 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass70_eq : phaseMass70 = (89519217/1638400000000 : ℝ) := by
  unfold phaseMass70
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw70 output70 cover70 source70
    (gridTreeUnionCheck_sound 32768 raw70 output70 cover70 source70 tree70 checked70)
    _ (by norm_num) _, areaUnits70]
  norm_num

-- Frozen phase 5418, atom 6115, type 1, source (17,68).
def leavesData71 : FiniteInputTree DyadicLeaf 22 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.single ⟨3,6,0⟩) (.node (.single ⟨3,6,1⟩) (.single ⟨3,7,1⟩))))) (.node (.node (.node (.single ⟨3,4,0⟩) (.single ⟨3,4,1⟩)) (.node (.single ⟨3,5,0⟩) (.node (.single ⟨3,5,1⟩) (.single ⟨4,14,0⟩)))) (.node (.node (.single ⟨4,14,1⟩) (.node (.single ⟨4,15,1⟩) (.single ⟨5,30,0⟩))) (.node (.single ⟨5,30,1⟩) (.node (.single ⟨5,31,0⟩) (.single ⟨5,31,1⟩))))))
def leaves71 : Fin 22 → DyadicLeaf := leavesData71.get
def raw71 (i : Fin 88) : GridBox := phaseImageBoxes 32768 8 17 68 leaves71 i
def outputData71 : FiniteInputTree GridBox 88 := (.node (.node (.node (.node (.node (.node (.single ⟨4352,4416,17408,17472⟩) (.single ⟨4352,4416,17472,17536⟩)) (.node (.single ⟨4416,4480,17408,17472⟩) (.node (.single ⟨4416,4480,17472,17536⟩) (.single ⟨4352,4480,17536,17664⟩)))) (.node (.node (.single ⟨4480,4512,17408,17440⟩) (.node (.single ⟨4480,4512,17440,17472⟩) (.single ⟨4512,4544,17408,17440⟩))) (.node (.single ⟨4512,4544,17440,17472⟩) (.node (.single ⟨4480,4544,17472,17536⟩) (.single ⟨4544,4576,17408,17440⟩))))) (.node (.node (.node (.single ⟨4544,4576,17440,17472⟩) (.single ⟨4576,4592,17408,17424⟩)) (.node (.single ⟨4576,4592,17424,17440⟩) (.node (.single ⟨4592,4600,17408,17416⟩) (.single ⟨4592,4600,17416,17424⟩)))) (.node (.node (.single ⟨4600,4608,17408,17416⟩) (.node (.single ⟨4600,4608,17416,17424⟩) (.single ⟨4592,4608,17424,17440⟩))) (.node (.single ⟨4576,4608,17440,17472⟩) (.node (.single ⟨4544,4608,17472,17536⟩) (.single ⟨4480,4608,17536,17664⟩)))))) (.node (.node (.node (.node (.single ⟨15104,15232,28160,28288⟩) (.single ⟨15104,15232,28288,28416⟩)) (.node (.single ⟨15232,15296,28160,28224⟩) (.node (.single ⟨15232,15296,28224,28288⟩) (.single ⟨15296,15328,28160,28192⟩)))) (.node (.node (.single ⟨15296,15328,28192,28224⟩) (.node (.single ⟨15328,15344,28160,28176⟩) (.single ⟨15328,15344,28176,28192⟩))) (.node (.single ⟨15344,15352,28160,28168⟩) (.node (.single ⟨15344,15352,28168,28176⟩) (.single ⟨15352,15360,28160,28168⟩))))) (.node (.node (.node (.single ⟨15352,15360,28168,28176⟩) (.single ⟨15344,15360,28176,28192⟩)) (.node (.single ⟨15328,15360,28192,28224⟩) (.node (.single ⟨15296,15328,28224,28256⟩) (.single ⟨15296,15328,28256,28288⟩)))) (.node (.node (.single ⟨15328,15360,28224,28256⟩) (.node (.single ⟨15328,15360,28256,28288⟩) (.single ⟨15232,15296,28288,28352⟩))) (.node (.single ⟨15232,15296,28352,28416⟩) (.node (.single ⟨15296,15360,28288,28352⟩) (.single ⟨15296,15360,28352,28416⟩))))))) (.node (.node (.node (.node (.node (.single ⟨17408,17472,4352,4416⟩) (.single ⟨17408,17472,4416,4480⟩)) (.node (.single ⟨17472,17536,4352,4416⟩) (.node (.single ⟨17472,17536,4416,4480⟩) (.single ⟨17408,17440,4480,4512⟩)))) (.node (.node (.single ⟨17408,17440,4512,4544⟩) (.node (.single ⟨17440,17472,4480,4512⟩) (.single ⟨17440,17472,4512,4544⟩))) (.node (.single ⟨17408,17440,4544,4576⟩) (.node (.single ⟨17408,17424,4576,4592⟩) (.single ⟨17408,17416,4592,4600⟩))))) (.node (.node (.node (.single ⟨17408,17416,4600,4608⟩) (.single ⟨17416,17424,4592,4600⟩)) (.node (.single ⟨17416,17424,4600,4608⟩) (.node (.single ⟨17424,17440,4576,4592⟩) (.single ⟨17424,17440,4592,4608⟩)))) (.node (.node (.single ⟨17440,17472,4544,4576⟩) (.node (.single ⟨17440,17472,4576,4608⟩) (.single ⟨17472,17536,4480,4544⟩))) (.node (.single ⟨17472,17536,4544,4608⟩) (.node (.single ⟨17536,17664,4352,4480⟩) (.single ⟨17536,17664,4480,4608⟩)))))) (.node (.node (.node (.node (.single ⟨28160,28288,15104,15232⟩) (.single ⟨28160,28224,15232,15296⟩)) (.node (.single ⟨28160,28192,15296,15328⟩) (.node (.single ⟨28160,28176,15328,15344⟩) (.single ⟨28160,28168,15344,15352⟩)))) (.node (.node (.single ⟨28160,28168,15352,15360⟩) (.node (.single ⟨28168,28176,15344,15352⟩) (.single ⟨28168,28176,15352,15360⟩))) (.node (.single ⟨28176,28192,15328,15344⟩) (.node (.single ⟨28176,28192,15344,15360⟩) (.single ⟨28192,28224,15296,15328⟩))))) (.node (.node (.node (.single ⟨28192,28224,15328,15360⟩) (.single ⟨28224,28288,15232,15296⟩)) (.node (.single ⟨28224,28256,15296,15328⟩) (.node (.single ⟨28224,28256,15328,15360⟩) (.single ⟨28256,28288,15296,15328⟩)))) (.node (.node (.single ⟨28256,28288,15328,15360⟩) (.node (.single ⟨28288,28416,15104,15232⟩) (.single ⟨28288,28352,15232,15296⟩))) (.node (.single ⟨28288,28352,15296,15360⟩) (.node (.single ⟨28352,28416,15232,15296⟩) (.single ⟨28352,28416,15296,15360⟩))))))))
def output71 : Fin 88 → GridBox := outputData71.get
def coverData71 : FiniteInputTree ℕ 88 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 64)) (.node (.single 83) (.node (.single 23) (.single 21)))) (.node (.node (.single 65) (.node (.single 66) (.single 22))) (.node (.single 9) (.node (.single 62) (.single 78))))) (.node (.node (.node (.single 25) (.single 20)) (.node (.single 63) (.node (.single 67) (.single 24)))) (.node (.node (.single 0) (.node (.single 44) (.single 87))) (.node (.single 43) (.node (.single 1) (.single 46)))))) (.node (.node (.node (.node (.single 86) (.single 41)) (.node (.single 2) (.node (.single 45) (.single 85)))) (.node (.node (.single 42) (.node (.single 3) (.single 47))) (.node (.single 84) (.node (.single 40) (.single 10))))) (.node (.node (.node (.single 52) (.single 77)) (.node (.single 35) (.node (.single 11) (.single 60)))) (.node (.node (.single 76) (.node (.single 27) (.single 19))) (.node (.single 61) (.node (.single 68) (.single 26))))))) (.node (.node (.node (.node (.node (.single 5) (.single 48)) (.node (.single 82) (.node (.single 39) (.single 6)))) (.node (.node (.single 50) (.node (.single 81) (.single 37))) (.node (.single 7) (.node (.single 49) (.single 80))))) (.node (.node (.node (.single 38) (.single 8)) (.node (.single 51) (.node (.single 79) (.single 36)))) (.node (.node (.single 12) (.node (.single 53) (.single 75))) (.node (.single 34) (.node (.single 13) (.single 58)))))) (.node (.node (.node (.node (.single 74) (.single 29)) (.node (.single 18) (.node (.single 59) (.single 69)))) (.node (.node (.single 28) (.node (.single 14) (.single 54))) (.node (.single 73) (.node (.single 33) (.single 15))))) (.node (.node (.node (.single 56) (.single 72)) (.node (.single 31) (.node (.single 16) (.single 55)))) (.node (.node (.single 71) (.node (.single 32) (.single 17))) (.node (.single 57) (.node (.single 70) (.single 30))))))))
def sourceData71 : FiniteInputTree ℕ 88 := (.node (.node (.node (.node (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.node (.single 28) (.single 0)))) (.node (.node (.single 44) (.node (.single 48) (.single 52))) (.node (.single 56) (.node (.single 8) (.single 32))))) (.node (.node (.node (.single 36) (.single 60)) (.node (.single 64) (.node (.single 72) (.single 76)))) (.node (.node (.single 80) (.node (.single 84) (.single 68))) (.node (.single 40) (.node (.single 12) (.single 4)))))) (.node (.node (.node (.node (.single 7) (.single 3)) (.node (.single 15) (.node (.single 11) (.single 43)))) (.node (.node (.single 39) (.node (.single 71) (.single 67))) (.node (.single 87) (.node (.single 79) (.single 83))))) (.node (.node (.node (.single 75) (.single 63)) (.node (.single 35) (.node (.single 59) (.single 51)))) (.node (.node (.single 55) (.node (.single 47) (.single 31))) (.node (.single 23) (.node (.single 27) (.single 19))))))) (.node (.node (.node (.node (.node (.single 17) (.single 25)) (.node (.single 21) (.node (.single 29) (.single 45)))) (.node (.node (.single 53) (.node (.single 49) (.single 57))) (.node (.single 33) (.node (.single 61) (.single 73))))) (.node (.node (.node (.single 81) (.single 77)) (.node (.single 85) (.node (.single 65) (.single 69)))) (.node (.node (.single 37) (.node (.single 41) (.single 9))) (.node (.single 13) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.single 6) (.single 14)) (.node (.single 42) (.node (.single 70) (.single 86)))) (.node (.node (.single 82) (.node (.single 78) (.single 74))) (.node (.single 66) (.node (.single 62) (.single 38))))) (.node (.node (.node (.single 34) (.single 10)) (.node (.single 58) (.node (.single 54) (.single 50)))) (.node (.node (.single 46) (.node (.single 2) (.single 30))) (.node (.single 26) (.node (.single 22) (.single 18))))))))
def cover71 (i : Fin 88) : Fin 88 := ⟨coverData71.get i % 88, Nat.mod_lt _ (by decide)⟩
def source71 (i : Fin 88) : Fin 88 := ⟨sourceData71.get i % 88, Nat.mod_lt _ (by decide)⟩
def tree71 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 (.cutX 5120 (.cutY 17408 .empty (.cutX 4608 (.cutY 17920 (.cutX 4352 .empty (.cutY 17664 (.cutX 4480 (.cutY 17536 (.cutX 4416 (.cutY 17472 .full .full) (.cutY 17472 .full .full)) .full) (.cutY 17536 (.cutX 4544 (.cutY 17472 (.cutX 4512 (.cutY 17440 .full .full) (.cutY 17440 .full .full)) .full) (.cutY 17472 (.cutX 4576 (.cutY 17440 .full .full) (.cutY 17440 (.cutX 4592 (.cutY 17424 .full .full) (.cutY 17424 (.cutX 4600 (.cutY 17416 .full .full) (.cutY 17416 .full .full)) .full)) .full)) .full)) .full)) .empty)) .empty) .empty)) .empty) .empty) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 .empty (.cutX 15360 (.cutY 27648 .empty (.cutX 14848 .empty (.cutY 28160 .empty (.cutX 15104 .empty (.cutY 28416 (.cutX 15232 (.cutY 28288 .full .full) (.cutY 28288 (.cutX 15296 (.cutY 28224 .full .full) (.cutY 28224 (.cutX 15328 (.cutY 28192 .full .full) (.cutY 28192 (.cutX 15344 (.cutY 28176 .full .full) (.cutY 28176 (.cutX 15352 (.cutY 28168 .full .full) (.cutY 28168 .full .full)) .full)) .full)) (.cutX 15328 (.cutY 28256 .full .full) (.cutY 28256 .full .full)))) (.cutX 15296 (.cutY 28352 .full .full) (.cutY 28352 .full .full)))) .empty))))) .empty))) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 (.cutX 17408 .empty (.cutY 5120 (.cutX 17920 (.cutY 4608 (.cutX 17664 (.cutY 4352 .empty (.cutX 17536 (.cutY 4480 (.cutX 17472 (.cutY 4416 .full .full) (.cutY 4416 .full .full)) (.cutX 17472 (.cutY 4544 (.cutX 17440 (.cutY 4512 .full .full) (.cutY 4512 .full .full)) (.cutX 17440 (.cutY 4576 .full (.cutX 17424 (.cutY 4592 .full (.cutX 17416 (.cutY 4600 .full .full) (.cutY 4600 .full .full))) (.cutY 4592 .full .full))) (.cutY 4576 .full .full))) (.cutY 4544 .full .full))) (.cutY 4480 .full .full))) .empty) .empty) .empty) .empty)) .empty) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 .empty (.cutX 27648 .empty (.cutY 15360 (.cutX 28160 .empty (.cutY 14848 .empty (.cutX 28416 (.cutY 15104 .empty (.cutX 28288 (.cutY 15232 .full (.cutX 28224 (.cutY 15296 .full (.cutX 28192 (.cutY 15328 .full (.cutX 28176 (.cutY 15344 .full (.cutX 28168 (.cutY 15352 .full .full) (.cutY 15352 .full .full))) (.cutY 15344 .full .full))) (.cutY 15328 .full .full))) (.cutY 15296 .full (.cutX 28256 (.cutY 15328 .full .full) (.cutY 15328 .full .full))))) (.cutY 15232 .full (.cutX 28352 (.cutY 15296 .full .full) (.cutY 15296 .full .full))))) .empty))) .empty))))) .empty))) .empty))

theorem metadata71 : 0<135260814 ∧ 17<128 ∧ 68<128 ∧ 1<4 ∧
    6115/4160=1 ∧ 6115%4160=1955 ∧ ∀ i, (leaves71 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData71).mp
    (by decide +kernel)

theorem sourceChecked71_0 : ∀ i : Fin 64,
    (fun i => output71 i = raw71 (source71 i)) (finOffset 88 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked71_64 : ∀ i : Fin 24,
    (fun i => output71 i = raw71 (source71 i)) (finOffset 88 64 24 (by decide) i) := by decide +kernel

theorem sourceChecked71 : ∀ i : Fin 88, (fun i => output71 i = raw71 (source71 i)) i :=
  forallFin_of_zero_offset (fun i => output71 i = raw71 (source71 i)) (forallFinOffset_add (fun i => output71 i = raw71 (source71 i)) 0 64 24 (by decide) sourceChecked71_0
    sourceChecked71_64)

theorem coverChecked71_0 : ∀ i : Fin 64,
    (fun i => (output71 (cover71 i)).ContainsBox (raw71 i)) (finOffset 88 0 64 (by decide) i) := by decide +kernel

theorem coverChecked71_64 : ∀ i : Fin 24,
    (fun i => (output71 (cover71 i)).ContainsBox (raw71 i)) (finOffset 88 64 24 (by decide) i) := by decide +kernel

theorem coverChecked71 : ∀ i : Fin 88, (fun i => (output71 (cover71 i)).ContainsBox (raw71 i)) i :=
  forallFin_of_zero_offset (fun i => (output71 (cover71 i)).ContainsBox (raw71 i)) (forallFinOffset_add (fun i => (output71 (cover71 i)).ContainsBox (raw71 i)) 0 64 24 (by decide) coverChecked71_0
    coverChecked71_64)

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

noncomputable def phaseMass71 : ℝ := singlePhaseMass (135260814/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw71 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass71_eq : phaseMass71 = (67630407/819200000000 : ℝ) := by
  unfold phaseMass71
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw71 output71 cover71 source71
    (gridTreeUnionCheck_sound 32768 raw71 output71 cover71 source71 tree71 checked71)
    _ (by norm_num) _, areaUnits71]
  norm_num

-- Frozen phase 5419, atom 2408, type 0, source (22,76).
def leavesData72 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves72 : Fin 7 → DyadicLeaf := leavesData72.get
def raw72 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 22 76 leaves72 i
def outputData72 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨5632,5760,19456,19584⟩) (.node (.single ⟨5632,5760,19584,19712⟩) (.single ⟨5760,5824,19456,19520⟩))) (.node (.node (.single ⟨5760,5824,19520,19584⟩) (.single ⟨5824,5888,19456,19520⟩)) (.node (.single ⟨5824,5888,19520,19584⟩) (.single ⟨5760,5888,19584,19712⟩)))) (.node (.node (.single ⟨13056,13184,26880,27008⟩) (.node (.single ⟨13056,13184,27008,27136⟩) (.single ⟨13184,13248,26880,26944⟩))) (.node (.node (.single ⟨13184,13248,26944,27008⟩) (.single ⟨13248,13312,26880,26944⟩)) (.node (.single ⟨13248,13312,26944,27008⟩) (.single ⟨13184,13312,27008,27136⟩))))) (.node (.node (.node (.single ⟨19456,19584,5632,5760⟩) (.node (.single ⟨19456,19520,5760,5824⟩) (.single ⟨19456,19520,5824,5888⟩))) (.node (.node (.single ⟨19520,19584,5760,5824⟩) (.single ⟨19520,19584,5824,5888⟩)) (.node (.single ⟨19584,19712,5632,5760⟩) (.single ⟨19584,19712,5760,5888⟩)))) (.node (.node (.single ⟨26880,27008,13056,13184⟩) (.node (.single ⟨26880,26944,13184,13248⟩) (.single ⟨26880,26944,13248,13312⟩))) (.node (.node (.single ⟨26944,27008,13184,13248⟩) (.single ⟨26944,27008,13248,13312⟩)) (.node (.single ⟨27008,27136,13056,13184⟩) (.single ⟨27008,27136,13184,13312⟩))))))
def output72 : Fin 28 → GridBox := outputData72.get
def coverData72 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData72 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover72 (i : Fin 28) : Fin 28 := ⟨coverData72.get i % 28, Nat.mod_lt _ (by decide)⟩
def source72 (i : Fin 28) : Fin 28 := ⟨sourceData72.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree72 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 .empty (.cutX 5120 .empty (.cutY 19456 .empty (.cutX 5632 .empty (.cutY 19968 (.cutX 5888 (.cutY 19712 (.cutX 5760 (.cutY 19584 .full .full) (.cutY 19584 (.cutX 5824 (.cutY 19520 .full .full) (.cutY 19520 .full .full)) .full)) .empty) .empty) .empty))))) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 .empty (.cutX 13312 (.cutY 27648 (.cutX 12800 .empty (.cutY 27136 (.cutX 13056 .empty (.cutY 26880 .empty (.cutX 13184 (.cutY 27008 .full .full) (.cutY 27008 (.cutX 13248 (.cutY 26944 .full .full) (.cutY 26944 .full .full)) .full)))) .empty)) .empty) .empty)) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 (.cutX 19456 .empty (.cutY 5120 .empty (.cutX 19968 (.cutY 5632 .empty (.cutX 19712 (.cutY 5888 (.cutX 19584 (.cutY 5760 .full (.cutX 19520 (.cutY 5824 .full .full) (.cutY 5824 .full .full))) (.cutY 5760 .full .full)) .empty) .empty)) .empty))) .empty))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 (.cutX 27648 (.cutY 13312 (.cutX 27136 (.cutY 12800 .empty (.cutX 26880 .empty (.cutY 13056 .empty (.cutX 27008 (.cutY 13184 .full (.cutX 26944 (.cutY 13248 .full .full) (.cutY 13248 .full .full))) (.cutY 13184 .full .full))))) .empty) .empty) .empty) .empty))) .empty))) .empty))

theorem metadata72 : 0<147396112 ∧ 22<128 ∧ 76<128 ∧ 0<4 ∧
    2408/4160=0 ∧ 2408%4160=2408 ∧ ∀ i, (leaves72 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData72).mp
    (by decide +kernel)

theorem sourceChecked72_0 : ∀ i : Fin 28,
    (fun i => output72 i = raw72 (source72 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked72 : ∀ i : Fin 28, (fun i => output72 i = raw72 (source72 i)) i :=
  forallFin_of_zero_offset (fun i => output72 i = raw72 (source72 i)) sourceChecked72_0

theorem coverChecked72_0 : ∀ i : Fin 28,
    (fun i => (output72 (cover72 i)).ContainsBox (raw72 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked72 : ∀ i : Fin 28, (fun i => (output72 (cover72 i)).ContainsBox (raw72 i)) i :=
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

noncomputable def phaseMass72 : ℝ := singlePhaseMass (147396112/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw72 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass72_eq : phaseMass72 = (9212257/102400000000 : ℝ) := by
  unfold phaseMass72
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw72 output72 cover72 source72
    (gridTreeUnionCheck_sound 32768 raw72 output72 cover72 source72 tree72 checked72)
    _ (by norm_num) _, areaUnits72]
  norm_num

-- Frozen phase 5420, atom 7766, type 1, source (40,86).
def leavesData73 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩)))) (.node (.node (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves73 : Fin 16 → DyadicLeaf := leavesData73.get
def raw73 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 40 86 leaves73 i
def outputData73 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨10240,10304,22016,22080⟩) (.single ⟨10240,10304,22080,22144⟩)) (.node (.single ⟨10304,10368,22016,22080⟩) (.single ⟨10304,10368,22080,22144⟩))) (.node (.node (.single ⟨10240,10368,22144,22272⟩) (.single ⟨10368,10432,22016,22080⟩)) (.node (.single ⟨10368,10432,22080,22144⟩) (.single ⟨10432,10464,22016,22048⟩)))) (.node (.node (.node (.single ⟨10432,10464,22048,22080⟩) (.single ⟨10464,10496,22016,22048⟩)) (.node (.single ⟨10464,10496,22048,22080⟩) (.single ⟨10432,10496,22080,22144⟩))) (.node (.node (.single ⟨10368,10432,22144,22208⟩) (.single ⟨10368,10432,22208,22272⟩)) (.node (.single ⟨10432,10496,22144,22208⟩) (.single ⟨10432,10496,22208,22272⟩))))) (.node (.node (.node (.node (.single ⟨10496,10560,22272,22336⟩) (.single ⟨10496,10560,22336,22400⟩)) (.node (.single ⟨10560,10624,22272,22336⟩) (.single ⟨10560,10624,22336,22400⟩))) (.node (.node (.single ⟨10496,10624,22400,22528⟩) (.single ⟨10624,10688,22272,22336⟩)) (.node (.single ⟨10624,10688,22336,22400⟩) (.single ⟨10688,10720,22272,22304⟩)))) (.node (.node (.node (.single ⟨10688,10720,22304,22336⟩) (.single ⟨10720,10752,22272,22304⟩)) (.node (.single ⟨10720,10752,22304,22336⟩) (.single ⟨10688,10752,22336,22400⟩))) (.node (.node (.single ⟨10624,10688,22400,22464⟩) (.single ⟨10624,10688,22464,22528⟩)) (.node (.single ⟨10688,10752,22400,22464⟩) (.single ⟨10688,10752,22464,22528⟩)))))) (.node (.node (.node (.node (.node (.single ⟨22016,22080,10240,10304⟩) (.single ⟨22016,22080,10304,10368⟩)) (.node (.single ⟨22080,22144,10240,10304⟩) (.single ⟨22080,22144,10304,10368⟩))) (.node (.node (.single ⟨22016,22080,10368,10432⟩) (.single ⟨22016,22048,10432,10464⟩)) (.node (.single ⟨22016,22048,10464,10496⟩) (.single ⟨22048,22080,10432,10464⟩)))) (.node (.node (.node (.single ⟨22048,22080,10464,10496⟩) (.single ⟨22080,22144,10368,10432⟩)) (.node (.single ⟨22080,22144,10432,10496⟩) (.single ⟨22144,22272,10240,10368⟩))) (.node (.node (.single ⟨22144,22208,10368,10432⟩) (.single ⟨22144,22208,10432,10496⟩)) (.node (.single ⟨22208,22272,10368,10432⟩) (.single ⟨22208,22272,10432,10496⟩))))) (.node (.node (.node (.node (.single ⟨22272,22336,10496,10560⟩) (.single ⟨22272,22336,10560,10624⟩)) (.node (.single ⟨22336,22400,10496,10560⟩) (.single ⟨22336,22400,10560,10624⟩))) (.node (.node (.single ⟨22272,22336,10624,10688⟩) (.single ⟨22272,22304,10688,10720⟩)) (.node (.single ⟨22272,22304,10720,10752⟩) (.single ⟨22304,22336,10688,10720⟩)))) (.node (.node (.node (.single ⟨22304,22336,10720,10752⟩) (.single ⟨22336,22400,10624,10688⟩)) (.node (.single ⟨22336,22400,10688,10752⟩) (.single ⟨22400,22528,10496,10624⟩))) (.node (.node (.single ⟨22400,22464,10624,10688⟩) (.single ⟨22400,22464,10688,10752⟩)) (.node (.single ⟨22464,22528,10624,10688⟩) (.single ⟨22464,22528,10688,10752⟩)))))))
def output73 : Fin 64 → GridBox := outputData73.get
def coverData73 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 43)) (.node (.single 59) (.single 20))) (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31)))) (.node (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29))) (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30))))) (.node (.node (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28))) (.node (.node (.single 5) (.single 36)) (.node (.single 58) (.single 27)))) (.node (.node (.node (.single 6) (.single 41)) (.node (.single 57) (.single 22))) (.node (.node (.single 11) (.single 42)) (.node (.single 52) (.single 21)))))) (.node (.node (.node (.node (.node (.single 12) (.single 44)) (.node (.single 51) (.single 19))) (.node (.node (.single 13) (.single 46)) (.node (.single 50) (.single 17)))) (.node (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16))))) (.node (.node (.node (.node (.single 7) (.single 37)) (.node (.single 56) (.single 26))) (.node (.node (.single 8) (.single 39)) (.node (.single 55) (.single 24)))) (.node (.node (.node (.single 9) (.single 38)) (.node (.single 54) (.single 25))) (.node (.node (.single 10) (.single 40)) (.node (.single 53) (.single 23)))))))
def sourceData73 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 8)) (.node (.single 12) (.single 16))) (.node (.node (.single 0) (.single 20)) (.node (.single 24) (.single 48)))) (.node (.node (.node (.single 52) (.single 56)) (.node (.single 60) (.single 28))) (.node (.node (.single 32) (.single 36)) (.node (.single 40) (.single 44))))) (.node (.node (.node (.node (.single 47) (.single 39)) (.node (.single 43) (.single 35))) (.node (.node (.single 3) (.single 31)) (.node (.single 27) (.single 63)))) (.node (.node (.node (.single 55) (.single 59)) (.node (.single 51) (.single 23))) (.node (.node (.single 19) (.single 11)) (.node (.single 15) (.single 7)))))) (.node (.node (.node (.node (.node (.single 5) (.single 13)) (.node (.single 9) (.single 17))) (.node (.node (.single 21) (.single 49)) (.node (.single 57) (.single 53)))) (.node (.node (.node (.single 61) (.single 25)) (.node (.single 29) (.single 1))) (.node (.node (.single 33) (.single 41)) (.node (.single 37) (.single 45))))) (.node (.node (.node (.node (.single 46) (.single 42)) (.node (.single 38) (.single 34))) (.node (.node (.single 30) (.single 62)) (.node (.single 58) (.single 54)))) (.node (.node (.node (.single 50) (.single 26)) (.node (.single 22) (.single 2))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.single 6)))))))
def cover73 (i : Fin 64) : Fin 64 := ⟨coverData73.get i % 64, Nat.mod_lt _ (by decide)⟩
def source73 (i : Fin 64) : Fin 64 := ⟨sourceData73.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree73 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 .empty (.cutY 22528 (.cutX 11264 (.cutY 21504 .empty (.cutX 10752 (.cutY 22016 .empty (.cutX 10496 (.cutY 22272 (.cutX 10368 (.cutY 22144 (.cutX 10304 (.cutY 22080 .full .full) (.cutY 22080 .full .full)) .full) (.cutY 22144 (.cutX 10432 (.cutY 22080 .full .full) (.cutY 22080 (.cutX 10464 (.cutY 22048 .full .full) (.cutY 22048 .full .full)) .full)) (.cutX 10432 (.cutY 22208 .full .full) (.cutY 22208 .full .full)))) .empty) (.cutY 22272 .empty (.cutX 10624 (.cutY 22400 (.cutX 10560 (.cutY 22336 .full .full) (.cutY 22336 .full .full)) .full) (.cutY 22400 (.cutX 10688 (.cutY 22336 .full .full) (.cutY 22336 (.cutX 10720 (.cutY 22304 .full .full) (.cutY 22304 .full .full)) .full)) (.cutX 10688 (.cutY 22464 .full .full) (.cutY 22464 .full .full))))))) .empty)) .empty) .empty))) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 (.cutY 10240 .empty (.cutX 21504 .empty (.cutY 11264 (.cutX 22016 .empty (.cutY 10752 (.cutX 22272 (.cutY 10496 (.cutX 22144 (.cutY 10368 (.cutX 22080 (.cutY 10304 .full .full) (.cutY 10304 .full .full)) (.cutX 22080 (.cutY 10432 .full (.cutX 22048 (.cutY 10464 .full .full) (.cutY 10464 .full .full))) (.cutY 10432 .full .full))) (.cutY 10368 .full (.cutX 22208 (.cutY 10432 .full .full) (.cutY 10432 .full .full)))) .empty) (.cutY 10496 .empty (.cutX 22400 (.cutY 10624 (.cutX 22336 (.cutY 10560 .full .full) (.cutY 10560 .full .full)) (.cutX 22336 (.cutY 10688 .full (.cutX 22304 (.cutY 10720 .full .full) (.cutY 10720 .full .full))) (.cutY 10688 .full .full))) (.cutY 10624 .full (.cutX 22464 (.cutY 10688 .full .full) (.cutY 10688 .full .full)))))) .empty)) .empty))) .empty) .empty))) .empty) .empty))

theorem metadata73 : 0<56923454 ∧ 40<128 ∧ 86<128 ∧ 1<4 ∧
    7766/4160=1 ∧ 7766%4160=3606 ∧ ∀ i, (leaves73 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData73).mp
    (by decide +kernel)

theorem sourceChecked73_0 : ∀ i : Fin 64,
    (fun i => output73 i = raw73 (source73 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked73 : ∀ i : Fin 64, (fun i => output73 i = raw73 (source73 i)) i :=
  forallFin_of_zero_offset (fun i => output73 i = raw73 (source73 i)) sourceChecked73_0

theorem coverChecked73_0 : ∀ i : Fin 64,
    (fun i => (output73 (cover73 i)).ContainsBox (raw73 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked73 : ∀ i : Fin 64, (fun i => (output73 (cover73 i)).ContainsBox (raw73 i)) i :=
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

noncomputable def phaseMass73 : ℝ := singlePhaseMass (56923454/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw73 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass73_eq : phaseMass73 = (28461727/819200000000 : ℝ) := by
  unfold phaseMass73
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw73 output73 cover73 source73
    (gridTreeUnionCheck_sound 32768 raw73 output73 cover73 source73 tree73 checked73)
    _ (by norm_num) _, areaUnits73]
  norm_num

-- Frozen phase 5421, atom 6963, type 1, source (27,76).
def leavesData74 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves74 : Fin 13 → DyadicLeaf := leavesData74.get
def raw74 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 27 76 leaves74 i
def outputData74 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨6912,6976,19456,19520⟩) (.node (.single ⟨6912,6976,19520,19584⟩) (.single ⟨6976,7040,19456,19520⟩))) (.node (.single ⟨6976,7040,19520,19584⟩) (.node (.single ⟨6912,7040,19584,19712⟩) (.single ⟨7040,7104,19456,19520⟩)))) (.node (.node (.single ⟨7040,7104,19520,19584⟩) (.node (.single ⟨7104,7136,19456,19488⟩) (.single ⟨7104,7136,19488,19520⟩))) (.node (.node (.single ⟨7136,7168,19456,19488⟩) (.single ⟨7136,7168,19488,19520⟩)) (.node (.single ⟨7104,7168,19520,19584⟩) (.single ⟨7040,7168,19584,19712⟩))))) (.node (.node (.node (.single ⟨13056,13184,25600,25728⟩) (.node (.single ⟨13056,13184,25728,25856⟩) (.single ⟨13184,13248,25600,25664⟩))) (.node (.single ⟨13184,13248,25664,25728⟩) (.node (.single ⟨13248,13280,25600,25632⟩) (.single ⟨13248,13280,25632,25664⟩)))) (.node (.node (.single ⟨13280,13312,25600,25632⟩) (.node (.single ⟨13280,13312,25632,25664⟩) (.single ⟨13248,13312,25664,25728⟩))) (.node (.node (.single ⟨13184,13248,25728,25792⟩) (.single ⟨13184,13248,25792,25856⟩)) (.node (.single ⟨13248,13312,25728,25792⟩) (.single ⟨13248,13312,25792,25856⟩)))))) (.node (.node (.node (.node (.single ⟨19456,19520,6912,6976⟩) (.node (.single ⟨19456,19520,6976,7040⟩) (.single ⟨19520,19584,6912,6976⟩))) (.node (.single ⟨19520,19584,6976,7040⟩) (.node (.single ⟨19456,19520,7040,7104⟩) (.single ⟨19456,19488,7104,7136⟩)))) (.node (.node (.single ⟨19456,19488,7136,7168⟩) (.node (.single ⟨19488,19520,7104,7136⟩) (.single ⟨19488,19520,7136,7168⟩))) (.node (.node (.single ⟨19520,19584,7040,7104⟩) (.single ⟨19520,19584,7104,7168⟩)) (.node (.single ⟨19584,19712,6912,7040⟩) (.single ⟨19584,19712,7040,7168⟩))))) (.node (.node (.node (.single ⟨25600,25728,13056,13184⟩) (.node (.single ⟨25600,25664,13184,13248⟩) (.single ⟨25600,25632,13248,13280⟩))) (.node (.single ⟨25600,25632,13280,13312⟩) (.node (.single ⟨25632,25664,13248,13280⟩) (.single ⟨25632,25664,13280,13312⟩)))) (.node (.node (.single ⟨25664,25728,13184,13248⟩) (.node (.single ⟨25664,25728,13248,13312⟩) (.single ⟨25728,25856,13056,13184⟩))) (.node (.node (.single ⟨25728,25792,13184,13248⟩) (.single ⟨25728,25792,13248,13312⟩)) (.node (.single ⟨25792,25856,13184,13248⟩) (.single ⟨25792,25856,13248,13312⟩)))))))
def output74 : Fin 52 → GridBox := outputData74.get
def coverData74 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData74 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover74 (i : Fin 52) : Fin 52 := ⟨coverData74.get i % 52, Nat.mod_lt _ (by decide)⟩
def source74 (i : Fin 52) : Fin 52 := ⟨sourceData74.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree74 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 .empty (.cutX 7168 (.cutY 19456 .empty (.cutX 6656 .empty (.cutY 19968 (.cutX 6912 .empty (.cutY 19712 (.cutX 7040 (.cutY 19584 (.cutX 6976 (.cutY 19520 .full .full) (.cutY 19520 .full .full)) .full) (.cutY 19584 (.cutX 7104 (.cutY 19520 .full .full) (.cutY 19520 (.cutX 7136 (.cutY 19488 .full .full) (.cutY 19488 .full .full)) .full)) .full)) .empty)) .empty))) .empty))) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 (.cutX 13312 (.cutY 25600 .empty (.cutX 12800 .empty (.cutY 26112 (.cutX 13056 .empty (.cutY 25856 (.cutX 13184 (.cutY 25728 .full .full) (.cutY 25728 (.cutX 13248 (.cutY 25664 .full .full) (.cutY 25664 (.cutX 13280 (.cutY 25632 .full .full) (.cutY 25632 .full .full)) .full)) (.cutX 13248 (.cutY 25792 .full .full) (.cutY 25792 .full .full)))) .empty)) .empty))) .empty) .empty) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 .empty (.cutX 19456 .empty (.cutY 7168 (.cutX 19968 (.cutY 6656 .empty (.cutX 19712 (.cutY 6912 .empty (.cutX 19584 (.cutY 7040 (.cutX 19520 (.cutY 6976 .full .full) (.cutY 6976 .full .full)) (.cutX 19520 (.cutY 7104 .full (.cutX 19488 (.cutY 7136 .full .full) (.cutY 7136 .full .full))) (.cutY 7104 .full .full))) (.cutY 7040 .full .full))) .empty)) .empty) .empty))))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 (.cutX 25600 .empty (.cutY 13312 (.cutX 26112 (.cutY 12800 .empty (.cutX 25856 (.cutY 13056 .empty (.cutX 25728 (.cutY 13184 .full (.cutX 25664 (.cutY 13248 .full (.cutX 25632 (.cutY 13280 .full .full) (.cutY 13280 .full .full))) (.cutY 13248 .full .full))) (.cutY 13184 .full (.cutX 25792 (.cutY 13248 .full .full) (.cutY 13248 .full .full))))) .empty)) .empty) .empty)) .empty) .empty)) .empty))) .empty))

theorem metadata74 : 0<140060506 ∧ 27<128 ∧ 76<128 ∧ 1<4 ∧
    6963/4160=1 ∧ 6963%4160=2803 ∧ ∀ i, (leaves74 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData74).mp
    (by decide +kernel)

theorem sourceChecked74_0 : ∀ i : Fin 52,
    (fun i => output74 i = raw74 (source74 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked74 : ∀ i : Fin 52, (fun i => output74 i = raw74 (source74 i)) i :=
  forallFin_of_zero_offset (fun i => output74 i = raw74 (source74 i)) sourceChecked74_0

theorem coverChecked74_0 : ∀ i : Fin 52,
    (fun i => (output74 (cover74 i)).ContainsBox (raw74 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked74 : ∀ i : Fin 52, (fun i => (output74 (cover74 i)).ContainsBox (raw74 i)) i :=
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

noncomputable def phaseMass74 : ℝ := singlePhaseMass (140060506/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw74 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass74_eq : phaseMass74 = (70030253/819200000000 : ℝ) := by
  unfold phaseMass74
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw74 output74 cover74 source74
    (gridTreeUnionCheck_sound 32768 raw74 output74 cover74 source74 tree74 checked74)
    _ (by norm_num) _, areaUnits74]
  norm_num

-- Frozen phase 5422, atom 6564, type 1, source (22,72).
def leavesData75 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩)))) (.node (.node (.node (.single ⟨2,1,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.single ⟨3,7,1⟩))) (.node (.node (.single ⟨4,14,0⟩) (.single ⟨4,14,1⟩)) (.node (.single ⟨4,15,0⟩) (.single ⟨4,15,1⟩)))))
def leaves75 : Fin 16 → DyadicLeaf := leavesData75.get
def raw75 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 22 72 leaves75 i
def outputData75 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨5632,5696,18432,18496⟩) (.single ⟨5632,5696,18496,18560⟩)) (.node (.single ⟨5696,5760,18432,18496⟩) (.single ⟨5696,5760,18496,18560⟩))) (.node (.node (.single ⟨5632,5760,18560,18688⟩) (.single ⟨5760,5824,18432,18496⟩)) (.node (.single ⟨5760,5824,18496,18560⟩) (.single ⟨5824,5856,18432,18464⟩)))) (.node (.node (.node (.single ⟨5824,5856,18464,18496⟩) (.single ⟨5856,5872,18432,18448⟩)) (.node (.single ⟨5856,5872,18448,18464⟩) (.single ⟨5872,5888,18432,18448⟩))) (.node (.node (.single ⟨5872,5888,18448,18464⟩) (.single ⟨5856,5888,18464,18496⟩)) (.node (.single ⟨5824,5888,18496,18560⟩) (.single ⟨5760,5888,18560,18688⟩))))) (.node (.node (.node (.node (.single ⟨14080,14208,26880,27008⟩) (.single ⟨14080,14208,27008,27136⟩)) (.node (.single ⟨14208,14272,26880,26944⟩) (.single ⟨14208,14272,26944,27008⟩))) (.node (.node (.single ⟨14272,14304,26880,26912⟩) (.single ⟨14272,14304,26912,26944⟩)) (.node (.single ⟨14304,14320,26880,26896⟩) (.single ⟨14304,14320,26896,26912⟩)))) (.node (.node (.node (.single ⟨14320,14336,26880,26896⟩) (.single ⟨14320,14336,26896,26912⟩)) (.node (.single ⟨14304,14336,26912,26944⟩) (.single ⟨14272,14336,26944,27008⟩))) (.node (.node (.single ⟨14208,14272,27008,27072⟩) (.single ⟨14208,14272,27072,27136⟩)) (.node (.single ⟨14272,14336,27008,27072⟩) (.single ⟨14272,14336,27072,27136⟩)))))) (.node (.node (.node (.node (.node (.single ⟨18432,18496,5632,5696⟩) (.single ⟨18432,18496,5696,5760⟩)) (.node (.single ⟨18496,18560,5632,5696⟩) (.single ⟨18496,18560,5696,5760⟩))) (.node (.node (.single ⟨18432,18496,5760,5824⟩) (.single ⟨18432,18464,5824,5856⟩)) (.node (.single ⟨18432,18448,5856,5872⟩) (.single ⟨18432,18448,5872,5888⟩)))) (.node (.node (.node (.single ⟨18448,18464,5856,5872⟩) (.single ⟨18448,18464,5872,5888⟩)) (.node (.single ⟨18464,18496,5824,5856⟩) (.single ⟨18464,18496,5856,5888⟩))) (.node (.node (.single ⟨18496,18560,5760,5824⟩) (.single ⟨18496,18560,5824,5888⟩)) (.node (.single ⟨18560,18688,5632,5760⟩) (.single ⟨18560,18688,5760,5888⟩))))) (.node (.node (.node (.node (.single ⟨26880,27008,14080,14208⟩) (.single ⟨26880,26944,14208,14272⟩)) (.node (.single ⟨26880,26912,14272,14304⟩) (.single ⟨26880,26896,14304,14320⟩))) (.node (.node (.single ⟨26880,26896,14320,14336⟩) (.single ⟨26896,26912,14304,14320⟩)) (.node (.single ⟨26896,26912,14320,14336⟩) (.single ⟨26912,26944,14272,14304⟩)))) (.node (.node (.node (.single ⟨26912,26944,14304,14336⟩) (.single ⟨26944,27008,14208,14272⟩)) (.node (.single ⟨26944,27008,14272,14336⟩) (.single ⟨27008,27136,14080,14208⟩))) (.node (.node (.single ⟨27008,27072,14208,14272⟩) (.single ⟨27008,27072,14272,14336⟩)) (.node (.single ⟨27072,27136,14208,14272⟩) (.single ⟨27072,27136,14272,14336⟩)))))))
def output75 : Fin 64 → GridBox := outputData75.get
def coverData75 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 46)) (.node (.single 59) (.single 17))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16)))) (.node (.node (.node (.single 5) (.single 36)) (.node (.single 58) (.single 27))) (.node (.node (.single 6) (.single 44)) (.node (.single 57) (.single 19))))) (.node (.node (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18))) (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31)))) (.node (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29))) (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30)))))) (.node (.node (.node (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28))) (.node (.node (.single 7) (.single 37)) (.node (.single 56) (.single 26)))) (.node (.node (.node (.single 8) (.single 42)) (.node (.single 55) (.single 21))) (.node (.node (.single 13) (.single 43)) (.node (.single 50) (.single 20))))) (.node (.node (.node (.node (.single 9) (.single 38)) (.node (.single 54) (.single 25))) (.node (.node (.single 10) (.single 40)) (.node (.single 53) (.single 23)))) (.node (.node (.node (.single 11) (.single 39)) (.node (.single 52) (.single 24))) (.node (.node (.single 12) (.single 41)) (.node (.single 51) (.single 22)))))))
def sourceData75 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 20) (.single 24)) (.node (.single 28) (.single 32))) (.node (.node (.single 0) (.single 8)) (.node (.single 12) (.single 36)))) (.node (.node (.node (.single 40) (.single 48)) (.node (.single 52) (.single 56))) (.node (.node (.single 60) (.single 44)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.node (.single 7) (.single 3)) (.node (.single 19) (.single 15))) (.node (.node (.single 47) (.single 43)) (.node (.single 63) (.single 55)))) (.node (.node (.node (.single 59) (.single 51)) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.node (.single 21) (.single 29)) (.node (.single 25) (.single 33))) (.node (.node (.single 9) (.single 37)) (.node (.single 49) (.single 57)))) (.node (.node (.node (.single 53) (.single 61)) (.node (.single 41) (.single 45))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.node (.single 6) (.single 18)) (.node (.single 46) (.single 62))) (.node (.node (.single 58) (.single 54)) (.node (.single 50) (.single 42)))) (.node (.node (.node (.single 38) (.single 14)) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover75 (i : Fin 64) : Fin 64 := ⟨coverData75.get i % 64, Nat.mod_lt _ (by decide)⟩
def source75 (i : Fin 64) : Fin 64 := ⟨sourceData75.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree75 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 .empty (.cutX 5120 .empty (.cutY 19456 (.cutX 5632 .empty (.cutY 18944 (.cutX 5888 (.cutY 18688 (.cutX 5760 (.cutY 18560 (.cutX 5696 (.cutY 18496 .full .full) (.cutY 18496 .full .full)) .full) (.cutY 18560 (.cutX 5824 (.cutY 18496 .full .full) (.cutY 18496 (.cutX 5856 (.cutY 18464 .full .full) (.cutY 18464 (.cutX 5872 (.cutY 18448 .full .full) (.cutY 18448 .full .full)) .full)) .full)) .full)) .empty) .empty) .empty)) .empty))) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 .empty (.cutX 13312 .empty (.cutY 27648 (.cutX 13824 .empty (.cutY 27136 (.cutX 14080 .empty (.cutY 26880 .empty (.cutX 14208 (.cutY 27008 .full .full) (.cutY 27008 (.cutX 14272 (.cutY 26944 .full .full) (.cutY 26944 (.cutX 14304 (.cutY 26912 .full .full) (.cutY 26912 (.cutX 14320 (.cutY 26896 .full .full) (.cutY 26896 .full .full)) .full)) .full)) (.cutX 14272 (.cutY 27072 .full .full) (.cutY 27072 .full .full)))))) .empty)) .empty))) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 (.cutX 19456 (.cutY 5120 .empty (.cutX 18944 (.cutY 5632 .empty (.cutX 18688 (.cutY 5888 (.cutX 18560 (.cutY 5760 (.cutX 18496 (.cutY 5696 .full .full) (.cutY 5696 .full .full)) (.cutX 18496 (.cutY 5824 .full (.cutX 18464 (.cutY 5856 .full (.cutX 18448 (.cutY 5872 .full .full) (.cutY 5872 .full .full))) (.cutY 5856 .full .full))) (.cutY 5824 .full .full))) (.cutY 5760 .full .full)) .empty) .empty)) .empty)) .empty) .empty))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 (.cutX 27648 (.cutY 13312 .empty (.cutX 27136 (.cutY 13824 .empty (.cutX 26880 .empty (.cutY 14080 .empty (.cutX 27008 (.cutY 14208 .full (.cutX 26944 (.cutY 14272 .full (.cutX 26912 (.cutY 14304 .full (.cutX 26896 (.cutY 14320 .full .full) (.cutY 14320 .full .full))) (.cutY 14304 .full .full))) (.cutY 14272 .full .full))) (.cutY 14208 .full (.cutX 27072 (.cutY 14272 .full .full) (.cutY 14272 .full .full))))))) .empty)) .empty) .empty))) .empty))) .empty))

theorem metadata75 : 0<157738472 ∧ 22<128 ∧ 72<128 ∧ 1<4 ∧
    6564/4160=1 ∧ 6564%4160=2404 ∧ ∀ i, (leaves75 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData75).mp
    (by decide +kernel)

theorem sourceChecked75_0 : ∀ i : Fin 64,
    (fun i => output75 i = raw75 (source75 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked75 : ∀ i : Fin 64, (fun i => output75 i = raw75 (source75 i)) i :=
  forallFin_of_zero_offset (fun i => output75 i = raw75 (source75 i)) sourceChecked75_0

theorem coverChecked75_0 : ∀ i : Fin 64,
    (fun i => (output75 (cover75 i)).ContainsBox (raw75 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked75 : ∀ i : Fin 64, (fun i => (output75 (cover75 i)).ContainsBox (raw75 i)) i :=
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

noncomputable def phaseMass75 : ℝ := singlePhaseMass (157738472/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw75 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass75_eq : phaseMass75 = (19717309/204800000000 : ℝ) := by
  unfold phaseMass75
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw75 output75 cover75 source75
    (gridTreeUnionCheck_sound 32768 raw75 output75 cover75 source75 tree75 checked75)
    _ (by norm_num) _, areaUnits75]
  norm_num

-- Frozen phase 5423, atom 7498, type 1, source (35,83).
def leavesData76 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves76 : Fin 7 → DyadicLeaf := leavesData76.get
def raw76 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 35 83 leaves76 i
def outputData76 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨8960,9088,21248,21376⟩) (.node (.single ⟨8960,9088,21376,21504⟩) (.single ⟨9088,9152,21248,21312⟩))) (.node (.node (.single ⟨9088,9152,21312,21376⟩) (.single ⟨9152,9216,21248,21312⟩)) (.node (.single ⟨9152,9216,21312,21376⟩) (.single ⟨9088,9216,21376,21504⟩)))) (.node (.node (.single ⟨11264,11392,23552,23680⟩) (.node (.single ⟨11264,11392,23680,23808⟩) (.single ⟨11392,11456,23552,23616⟩))) (.node (.node (.single ⟨11392,11456,23616,23680⟩) (.single ⟨11456,11520,23552,23616⟩)) (.node (.single ⟨11456,11520,23616,23680⟩) (.single ⟨11392,11520,23680,23808⟩))))) (.node (.node (.node (.single ⟨21248,21376,8960,9088⟩) (.node (.single ⟨21248,21312,9088,9152⟩) (.single ⟨21248,21312,9152,9216⟩))) (.node (.node (.single ⟨21312,21376,9088,9152⟩) (.single ⟨21312,21376,9152,9216⟩)) (.node (.single ⟨21376,21504,8960,9088⟩) (.single ⟨21376,21504,9088,9216⟩)))) (.node (.node (.single ⟨23552,23680,11264,11392⟩) (.node (.single ⟨23552,23616,11392,11456⟩) (.single ⟨23552,23616,11456,11520⟩))) (.node (.node (.single ⟨23616,23680,11392,11456⟩) (.single ⟨23616,23680,11456,11520⟩)) (.node (.single ⟨23680,23808,11264,11392⟩) (.single ⟨23680,23808,11392,11520⟩))))))
def output76 : Fin 28 → GridBox := outputData76.get
def coverData76 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData76 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover76 (i : Fin 28) : Fin 28 := ⟨coverData76.get i % 28, Nat.mod_lt _ (by decide)⟩
def source76 (i : Fin 28) : Fin 28 := ⟨sourceData76.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree76 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 (.cutX 9216 (.cutY 21504 (.cutX 8704 .empty (.cutY 20992 .empty (.cutX 8960 .empty (.cutY 21248 .empty (.cutX 9088 (.cutY 21376 .full .full) (.cutY 21376 (.cutX 9152 (.cutY 21312 .full .full) (.cutY 21312 .full .full)) .full)))))) .empty) .empty) .empty) (.cutY 22528 .empty (.cutX 11264 .empty (.cutY 23552 .empty (.cutX 11776 (.cutY 24064 (.cutX 11520 (.cutY 23808 (.cutX 11392 (.cutY 23680 .full .full) (.cutY 23680 (.cutX 11456 (.cutY 23616 .full .full) (.cutY 23616 .full .full)) .full)) .empty) .empty) .empty) .empty)))))) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 (.cutY 10240 (.cutX 21504 (.cutY 9216 (.cutX 20992 .empty (.cutY 8704 .empty (.cutX 21248 .empty (.cutY 8960 .empty (.cutX 21376 (.cutY 9088 .full (.cutX 21312 (.cutY 9152 .full .full) (.cutY 9152 .full .full))) (.cutY 9088 .full .full)))))) .empty) .empty) .empty) (.cutY 10240 .empty (.cutX 23552 .empty (.cutY 11264 .empty (.cutX 24064 (.cutY 11776 (.cutX 23808 (.cutY 11520 (.cutX 23680 (.cutY 11392 .full (.cutX 23616 (.cutY 11456 .full .full) (.cutY 11456 .full .full))) (.cutY 11392 .full .full)) .empty) .empty) .empty) .empty))))) .empty))) .empty) .empty))

theorem metadata76 : 0<156512574 ∧ 35<128 ∧ 83<128 ∧ 1<4 ∧
    7498/4160=1 ∧ 7498%4160=3338 ∧ ∀ i, (leaves76 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData76).mp
    (by decide +kernel)

theorem sourceChecked76_0 : ∀ i : Fin 28,
    (fun i => output76 i = raw76 (source76 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked76 : ∀ i : Fin 28, (fun i => output76 i = raw76 (source76 i)) i :=
  forallFin_of_zero_offset (fun i => output76 i = raw76 (source76 i)) sourceChecked76_0

theorem coverChecked76_0 : ∀ i : Fin 28,
    (fun i => (output76 (cover76 i)).ContainsBox (raw76 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked76 : ∀ i : Fin 28, (fun i => (output76 (cover76 i)).ContainsBox (raw76 i)) i :=
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

noncomputable def phaseMass76 : ℝ := singlePhaseMass (156512574/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw76 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass76_eq : phaseMass76 = (78256287/819200000000 : ℝ) := by
  unfold phaseMass76
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw76 output76 cover76 source76
    (gridTreeUnionCheck_sound 32768 raw76 output76 cover76 source76 tree76 checked76)
    _ (by norm_num) _, areaUnits76]
  norm_num

-- Frozen phase 5424, atom 2053, type 0, source (18,73).
def leavesData77 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves77 : Fin 13 → DyadicLeaf := leavesData77.get
def raw77 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 18 73 leaves77 i
def outputData77 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨4608,4672,18688,18752⟩) (.node (.single ⟨4608,4672,18752,18816⟩) (.single ⟨4672,4736,18688,18752⟩))) (.node (.single ⟨4672,4736,18752,18816⟩) (.node (.single ⟨4608,4736,18816,18944⟩) (.single ⟨4736,4800,18688,18752⟩)))) (.node (.node (.single ⟨4736,4800,18752,18816⟩) (.node (.single ⟨4800,4832,18688,18720⟩) (.single ⟨4800,4832,18720,18752⟩))) (.node (.node (.single ⟨4832,4864,18688,18720⟩) (.single ⟨4832,4864,18720,18752⟩)) (.node (.single ⟨4800,4864,18752,18816⟩) (.single ⟨4736,4864,18816,18944⟩))))) (.node (.node (.node (.single ⟨13824,13952,27904,28032⟩) (.node (.single ⟨13824,13952,28032,28160⟩) (.single ⟨13952,14016,27904,27968⟩))) (.node (.single ⟨13952,14016,27968,28032⟩) (.node (.single ⟨14016,14048,27904,27936⟩) (.single ⟨14016,14048,27936,27968⟩)))) (.node (.node (.single ⟨14048,14080,27904,27936⟩) (.node (.single ⟨14048,14080,27936,27968⟩) (.single ⟨14016,14080,27968,28032⟩))) (.node (.node (.single ⟨13952,14016,28032,28096⟩) (.single ⟨13952,14016,28096,28160⟩)) (.node (.single ⟨14016,14080,28032,28096⟩) (.single ⟨14016,14080,28096,28160⟩)))))) (.node (.node (.node (.node (.single ⟨18688,18752,4608,4672⟩) (.node (.single ⟨18688,18752,4672,4736⟩) (.single ⟨18752,18816,4608,4672⟩))) (.node (.single ⟨18752,18816,4672,4736⟩) (.node (.single ⟨18688,18752,4736,4800⟩) (.single ⟨18688,18720,4800,4832⟩)))) (.node (.node (.single ⟨18688,18720,4832,4864⟩) (.node (.single ⟨18720,18752,4800,4832⟩) (.single ⟨18720,18752,4832,4864⟩))) (.node (.node (.single ⟨18752,18816,4736,4800⟩) (.single ⟨18752,18816,4800,4864⟩)) (.node (.single ⟨18816,18944,4608,4736⟩) (.single ⟨18816,18944,4736,4864⟩))))) (.node (.node (.node (.single ⟨27904,28032,13824,13952⟩) (.node (.single ⟨27904,27968,13952,14016⟩) (.single ⟨27904,27936,14016,14048⟩))) (.node (.single ⟨27904,27936,14048,14080⟩) (.node (.single ⟨27936,27968,14016,14048⟩) (.single ⟨27936,27968,14048,14080⟩)))) (.node (.node (.single ⟨27968,28032,13952,14016⟩) (.node (.single ⟨27968,28032,14016,14080⟩) (.single ⟨28032,28160,13824,13952⟩))) (.node (.node (.single ⟨28032,28096,13952,14016⟩) (.single ⟨28032,28096,14016,14080⟩)) (.node (.single ⟨28096,28160,13952,14016⟩) (.single ⟨28096,28160,14016,14080⟩)))))))
def output77 : Fin 52 → GridBox := outputData77.get
def coverData77 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData77 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover77 (i : Fin 52) : Fin 52 := ⟨coverData77.get i % 52, Nat.mod_lt _ (by decide)⟩
def source77 (i : Fin 52) : Fin 52 := ⟨sourceData77.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree77 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 .empty (.cutX 5120 (.cutY 19456 (.cutX 4608 .empty (.cutY 18944 (.cutX 4864 (.cutY 18688 .empty (.cutX 4736 (.cutY 18816 (.cutX 4672 (.cutY 18752 .full .full) (.cutY 18752 .full .full)) .full) (.cutY 18816 (.cutX 4800 (.cutY 18752 .full .full) (.cutY 18752 (.cutX 4832 (.cutY 18720 .full .full) (.cutY 18720 .full .full)) .full)) .full))) .empty) .empty)) .empty) .empty)) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 .empty (.cutX 13312 .empty (.cutY 27648 .empty (.cutX 13824 .empty (.cutY 28160 (.cutX 14080 (.cutY 27904 .empty (.cutX 13952 (.cutY 28032 .full .full) (.cutY 28032 (.cutX 14016 (.cutY 27968 .full .full) (.cutY 27968 (.cutX 14048 (.cutY 27936 .full .full) (.cutY 27936 .full .full)) .full)) (.cutX 14016 (.cutY 28096 .full .full) (.cutY 28096 .full .full))))) .empty) .empty))))) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 (.cutX 19456 (.cutY 5120 (.cutX 18944 (.cutY 4608 .empty (.cutX 18688 .empty (.cutY 4864 (.cutX 18816 (.cutY 4736 (.cutX 18752 (.cutY 4672 .full .full) (.cutY 4672 .full .full)) (.cutX 18752 (.cutY 4800 .full (.cutX 18720 (.cutY 4832 .full .full) (.cutY 4832 .full .full))) (.cutY 4800 .full .full))) (.cutY 4736 .full .full)) .empty))) .empty) .empty) .empty) .empty))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 (.cutX 27648 .empty (.cutY 13312 .empty (.cutX 28160 (.cutY 13824 .empty (.cutX 27904 .empty (.cutY 14080 (.cutX 28032 (.cutY 13952 .full (.cutX 27968 (.cutY 14016 .full (.cutX 27936 (.cutY 14048 .full .full) (.cutY 14048 .full .full))) (.cutY 14016 .full .full))) (.cutY 13952 .full (.cutX 28096 (.cutY 14016 .full .full) (.cutY 14016 .full .full)))) .empty))) .empty))) .empty))) .empty))) .empty))

theorem metadata77 : 0<147396112 ∧ 18<128 ∧ 73<128 ∧ 0<4 ∧
    2053/4160=0 ∧ 2053%4160=2053 ∧ ∀ i, (leaves77 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData77).mp
    (by decide +kernel)

theorem sourceChecked77_0 : ∀ i : Fin 52,
    (fun i => output77 i = raw77 (source77 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked77 : ∀ i : Fin 52, (fun i => output77 i = raw77 (source77 i)) i :=
  forallFin_of_zero_offset (fun i => output77 i = raw77 (source77 i)) sourceChecked77_0

theorem coverChecked77_0 : ∀ i : Fin 52,
    (fun i => (output77 (cover77 i)).ContainsBox (raw77 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked77 : ∀ i : Fin 52, (fun i => (output77 (cover77 i)).ContainsBox (raw77 i)) i :=
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

noncomputable def phaseMass77 : ℝ := singlePhaseMass (147396112/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw77 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass77_eq : phaseMass77 = (9212257/102400000000 : ℝ) := by
  unfold phaseMass77
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw77 output77 cover77 source77
    (gridTreeUnionCheck_sound 32768 raw77 output77 cover77 source77 tree77 checked77)
    _ (by norm_num) _, areaUnits77]
  norm_num

-- Frozen phase 5425, atom 6209, type 1, source (18,69).
def leavesData78 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves78 : Fin 13 → DyadicLeaf := leavesData78.get
def raw78 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 18 69 leaves78 i
def outputData78 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨4608,4672,17664,17728⟩) (.node (.single ⟨4608,4672,17728,17792⟩) (.single ⟨4672,4736,17664,17728⟩))) (.node (.single ⟨4672,4736,17728,17792⟩) (.node (.single ⟨4608,4736,17792,17920⟩) (.single ⟨4736,4800,17664,17728⟩)))) (.node (.node (.single ⟨4736,4800,17728,17792⟩) (.node (.single ⟨4800,4832,17664,17696⟩) (.single ⟨4800,4832,17696,17728⟩))) (.node (.node (.single ⟨4832,4864,17664,17696⟩) (.single ⟨4832,4864,17696,17728⟩)) (.node (.single ⟨4800,4864,17728,17792⟩) (.single ⟨4736,4864,17792,17920⟩))))) (.node (.node (.node (.single ⟨14848,14976,27904,28032⟩) (.node (.single ⟨14848,14976,28032,28160⟩) (.single ⟨14976,15040,27904,27968⟩))) (.node (.single ⟨14976,15040,27968,28032⟩) (.node (.single ⟨15040,15072,27904,27936⟩) (.single ⟨15040,15072,27936,27968⟩)))) (.node (.node (.single ⟨15072,15104,27904,27936⟩) (.node (.single ⟨15072,15104,27936,27968⟩) (.single ⟨15040,15104,27968,28032⟩))) (.node (.node (.single ⟨14976,15040,28032,28096⟩) (.single ⟨14976,15040,28096,28160⟩)) (.node (.single ⟨15040,15104,28032,28096⟩) (.single ⟨15040,15104,28096,28160⟩)))))) (.node (.node (.node (.node (.single ⟨17664,17728,4608,4672⟩) (.node (.single ⟨17664,17728,4672,4736⟩) (.single ⟨17728,17792,4608,4672⟩))) (.node (.single ⟨17728,17792,4672,4736⟩) (.node (.single ⟨17664,17728,4736,4800⟩) (.single ⟨17664,17696,4800,4832⟩)))) (.node (.node (.single ⟨17664,17696,4832,4864⟩) (.node (.single ⟨17696,17728,4800,4832⟩) (.single ⟨17696,17728,4832,4864⟩))) (.node (.node (.single ⟨17728,17792,4736,4800⟩) (.single ⟨17728,17792,4800,4864⟩)) (.node (.single ⟨17792,17920,4608,4736⟩) (.single ⟨17792,17920,4736,4864⟩))))) (.node (.node (.node (.single ⟨27904,28032,14848,14976⟩) (.node (.single ⟨27904,27968,14976,15040⟩) (.single ⟨27904,27936,15040,15072⟩))) (.node (.single ⟨27904,27936,15072,15104⟩) (.node (.single ⟨27936,27968,15040,15072⟩) (.single ⟨27936,27968,15072,15104⟩)))) (.node (.node (.single ⟨27968,28032,14976,15040⟩) (.node (.single ⟨27968,28032,15040,15104⟩) (.single ⟨28032,28160,14848,14976⟩))) (.node (.node (.single ⟨28032,28096,14976,15040⟩) (.single ⟨28032,28096,15040,15104⟩)) (.node (.single ⟨28096,28160,14976,15040⟩) (.single ⟨28096,28160,15040,15104⟩)))))))
def output78 : Fin 52 → GridBox := outputData78.get
def coverData78 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData78 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover78 (i : Fin 52) : Fin 52 := ⟨coverData78.get i % 52, Nat.mod_lt _ (by decide)⟩
def source78 (i : Fin 52) : Fin 52 := ⟨sourceData78.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree78 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 (.cutX 5120 (.cutY 17408 .empty (.cutX 4608 .empty (.cutY 17920 (.cutX 4864 (.cutY 17664 .empty (.cutX 4736 (.cutY 17792 (.cutX 4672 (.cutY 17728 .full .full) (.cutY 17728 .full .full)) .full) (.cutY 17792 (.cutX 4800 (.cutY 17728 .full .full) (.cutY 17728 (.cutX 4832 (.cutY 17696 .full .full) (.cutY 17696 .full .full)) .full)) .full))) .empty) .empty))) .empty) .empty) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 .empty (.cutX 15360 (.cutY 27648 .empty (.cutX 14848 .empty (.cutY 28160 (.cutX 15104 (.cutY 27904 .empty (.cutX 14976 (.cutY 28032 .full .full) (.cutY 28032 (.cutX 15040 (.cutY 27968 .full .full) (.cutY 27968 (.cutX 15072 (.cutY 27936 .full .full) (.cutY 27936 .full .full)) .full)) (.cutX 15040 (.cutY 28096 .full .full) (.cutY 28096 .full .full))))) .empty) .empty))) .empty))) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 (.cutX 17408 .empty (.cutY 5120 (.cutX 17920 (.cutY 4608 .empty (.cutX 17664 .empty (.cutY 4864 (.cutX 17792 (.cutY 4736 (.cutX 17728 (.cutY 4672 .full .full) (.cutY 4672 .full .full)) (.cutX 17728 (.cutY 4800 .full (.cutX 17696 (.cutY 4832 .full .full) (.cutY 4832 .full .full))) (.cutY 4800 .full .full))) (.cutY 4736 .full .full)) .empty))) .empty) .empty)) .empty) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 .empty (.cutX 27648 .empty (.cutY 15360 (.cutX 28160 (.cutY 14848 .empty (.cutX 27904 .empty (.cutY 15104 (.cutX 28032 (.cutY 14976 .full (.cutX 27968 (.cutY 15040 .full (.cutX 27936 (.cutY 15072 .full .full) (.cutY 15072 .full .full))) (.cutY 15040 .full .full))) (.cutY 14976 .full (.cutX 28096 (.cutY 15040 .full .full) (.cutY 15040 .full .full)))) .empty))) .empty) .empty))))) .empty))) .empty))

theorem metadata78 : 0<135260814 ∧ 18<128 ∧ 69<128 ∧ 1<4 ∧
    6209/4160=1 ∧ 6209%4160=2049 ∧ ∀ i, (leaves78 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData78).mp
    (by decide +kernel)

theorem sourceChecked78_0 : ∀ i : Fin 52,
    (fun i => output78 i = raw78 (source78 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked78 : ∀ i : Fin 52, (fun i => output78 i = raw78 (source78 i)) i :=
  forallFin_of_zero_offset (fun i => output78 i = raw78 (source78 i)) sourceChecked78_0

theorem coverChecked78_0 : ∀ i : Fin 52,
    (fun i => (output78 (cover78 i)).ContainsBox (raw78 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked78 : ∀ i : Fin 52, (fun i => (output78 (cover78 i)).ContainsBox (raw78 i)) i :=
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

noncomputable def phaseMass78 : ℝ := singlePhaseMass (135260814/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw78 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass78_eq : phaseMass78 = (67630407/819200000000 : ℝ) := by
  unfold phaseMass78
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw78 output78 cover78 source78
    (gridTreeUnionCheck_sound 32768 raw78 output78 cover78 source78 tree78 checked78)
    _ (by norm_num) _, areaUnits78]
  norm_num

-- Frozen phase 5426, atom 2492, type 0, source (23,77).
def leavesData79 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves79 : Fin 7 → DyadicLeaf := leavesData79.get
def raw79 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 23 77 leaves79 i
def outputData79 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨5888,6016,19712,19840⟩) (.node (.single ⟨5888,6016,19840,19968⟩) (.single ⟨6016,6080,19712,19776⟩))) (.node (.node (.single ⟨6016,6080,19776,19840⟩) (.single ⟨6080,6144,19712,19776⟩)) (.node (.single ⟨6080,6144,19776,19840⟩) (.single ⟨6016,6144,19840,19968⟩)))) (.node (.node (.single ⟨12800,12928,26624,26752⟩) (.node (.single ⟨12800,12928,26752,26880⟩) (.single ⟨12928,12992,26624,26688⟩))) (.node (.node (.single ⟨12928,12992,26688,26752⟩) (.single ⟨12992,13056,26624,26688⟩)) (.node (.single ⟨12992,13056,26688,26752⟩) (.single ⟨12928,13056,26752,26880⟩))))) (.node (.node (.node (.single ⟨19712,19840,5888,6016⟩) (.node (.single ⟨19712,19776,6016,6080⟩) (.single ⟨19712,19776,6080,6144⟩))) (.node (.node (.single ⟨19776,19840,6016,6080⟩) (.single ⟨19776,19840,6080,6144⟩)) (.node (.single ⟨19840,19968,5888,6016⟩) (.single ⟨19840,19968,6016,6144⟩)))) (.node (.node (.single ⟨26624,26752,12800,12928⟩) (.node (.single ⟨26624,26688,12928,12992⟩) (.single ⟨26624,26688,12992,13056⟩))) (.node (.node (.single ⟨26688,26752,12928,12992⟩) (.single ⟨26688,26752,12992,13056⟩)) (.node (.single ⟨26752,26880,12800,12928⟩) (.single ⟨26752,26880,12928,13056⟩))))))
def output79 : Fin 28 → GridBox := outputData79.get
def coverData79 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData79 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover79 (i : Fin 28) : Fin 28 := ⟨coverData79.get i % 28, Nat.mod_lt _ (by decide)⟩
def source79 (i : Fin 28) : Fin 28 := ⟨sourceData79.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree79 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 .empty (.cutX 5120 .empty (.cutY 19456 .empty (.cutX 5632 .empty (.cutY 19968 (.cutX 5888 .empty (.cutY 19712 .empty (.cutX 6016 (.cutY 19840 .full .full) (.cutY 19840 (.cutX 6080 (.cutY 19776 .full .full) (.cutY 19776 .full .full)) .full)))) .empty))))) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 .empty (.cutX 13312 (.cutY 27648 (.cutX 12800 .empty (.cutY 27136 (.cutX 13056 (.cutY 26880 (.cutX 12928 (.cutY 26752 .full .full) (.cutY 26752 (.cutX 12992 (.cutY 26688 .full .full) (.cutY 26688 .full .full)) .full)) .empty) .empty) .empty)) .empty) .empty)) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 (.cutX 19456 .empty (.cutY 5120 .empty (.cutX 19968 (.cutY 5632 .empty (.cutX 19712 .empty (.cutY 5888 .empty (.cutX 19840 (.cutY 6016 .full (.cutX 19776 (.cutY 6080 .full .full) (.cutY 6080 .full .full))) (.cutY 6016 .full .full))))) .empty))) .empty))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 (.cutX 27648 (.cutY 13312 (.cutX 27136 (.cutY 12800 .empty (.cutX 26880 (.cutY 13056 (.cutX 26752 (.cutY 12928 .full (.cutX 26688 (.cutY 12992 .full .full) (.cutY 12992 .full .full))) (.cutY 12928 .full .full)) .empty) .empty)) .empty) .empty) .empty) .empty))) .empty))) .empty))

theorem metadata79 : 0<147396112 ∧ 23<128 ∧ 77<128 ∧ 0<4 ∧
    2492/4160=0 ∧ 2492%4160=2492 ∧ ∀ i, (leaves79 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData79).mp
    (by decide +kernel)

theorem sourceChecked79_0 : ∀ i : Fin 28,
    (fun i => output79 i = raw79 (source79 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked79 : ∀ i : Fin 28, (fun i => output79 i = raw79 (source79 i)) i :=
  forallFin_of_zero_offset (fun i => output79 i = raw79 (source79 i)) sourceChecked79_0

theorem coverChecked79_0 : ∀ i : Fin 28,
    (fun i => (output79 (cover79 i)).ContainsBox (raw79 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked79 : ∀ i : Fin 28, (fun i => (output79 (cover79 i)).ContainsBox (raw79 i)) i :=
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

noncomputable def phaseMass79 : ℝ := singlePhaseMass (147396112/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw79 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass79_eq : phaseMass79 = (9212257/102400000000 : ℝ) := by
  unfold phaseMass79
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw79 output79 cover79 source79
    (gridTreeUnionCheck_sound 32768 raw79 output79 cover79 source79 tree79 checked79)
    _ (by norm_num) _, areaUnits79]
  norm_num

-- Frozen phase 5427, atom 6648, type 1, source (23,73).
def leavesData80 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves80 : Fin 13 → DyadicLeaf := leavesData80.get
def raw80 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 23 73 leaves80 i
def outputData80 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨5888,5952,18688,18752⟩) (.node (.single ⟨5888,5952,18752,18816⟩) (.single ⟨5952,6016,18688,18752⟩))) (.node (.single ⟨5952,6016,18752,18816⟩) (.node (.single ⟨5888,6016,18816,18944⟩) (.single ⟨6016,6080,18688,18752⟩)))) (.node (.node (.single ⟨6016,6080,18752,18816⟩) (.node (.single ⟨6080,6112,18688,18720⟩) (.single ⟨6080,6112,18720,18752⟩))) (.node (.node (.single ⟨6112,6144,18688,18720⟩) (.single ⟨6112,6144,18720,18752⟩)) (.node (.single ⟨6080,6144,18752,18816⟩) (.single ⟨6016,6144,18816,18944⟩))))) (.node (.node (.node (.single ⟨13824,13952,26624,26752⟩) (.node (.single ⟨13824,13952,26752,26880⟩) (.single ⟨13952,14016,26624,26688⟩))) (.node (.single ⟨13952,14016,26688,26752⟩) (.node (.single ⟨14016,14048,26624,26656⟩) (.single ⟨14016,14048,26656,26688⟩)))) (.node (.node (.single ⟨14048,14080,26624,26656⟩) (.node (.single ⟨14048,14080,26656,26688⟩) (.single ⟨14016,14080,26688,26752⟩))) (.node (.node (.single ⟨13952,14016,26752,26816⟩) (.single ⟨13952,14016,26816,26880⟩)) (.node (.single ⟨14016,14080,26752,26816⟩) (.single ⟨14016,14080,26816,26880⟩)))))) (.node (.node (.node (.node (.single ⟨18688,18752,5888,5952⟩) (.node (.single ⟨18688,18752,5952,6016⟩) (.single ⟨18752,18816,5888,5952⟩))) (.node (.single ⟨18752,18816,5952,6016⟩) (.node (.single ⟨18688,18752,6016,6080⟩) (.single ⟨18688,18720,6080,6112⟩)))) (.node (.node (.single ⟨18688,18720,6112,6144⟩) (.node (.single ⟨18720,18752,6080,6112⟩) (.single ⟨18720,18752,6112,6144⟩))) (.node (.node (.single ⟨18752,18816,6016,6080⟩) (.single ⟨18752,18816,6080,6144⟩)) (.node (.single ⟨18816,18944,5888,6016⟩) (.single ⟨18816,18944,6016,6144⟩))))) (.node (.node (.node (.single ⟨26624,26752,13824,13952⟩) (.node (.single ⟨26624,26688,13952,14016⟩) (.single ⟨26624,26656,14016,14048⟩))) (.node (.single ⟨26624,26656,14048,14080⟩) (.node (.single ⟨26656,26688,14016,14048⟩) (.single ⟨26656,26688,14048,14080⟩)))) (.node (.node (.single ⟨26688,26752,13952,14016⟩) (.node (.single ⟨26688,26752,14016,14080⟩) (.single ⟨26752,26880,13824,13952⟩))) (.node (.node (.single ⟨26752,26816,13952,14016⟩) (.single ⟨26752,26816,14016,14080⟩)) (.node (.single ⟨26816,26880,13952,14016⟩) (.single ⟨26816,26880,14016,14080⟩)))))))
def output80 : Fin 52 → GridBox := outputData80.get
def coverData80 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData80 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover80 (i : Fin 52) : Fin 52 := ⟨coverData80.get i % 52, Nat.mod_lt _ (by decide)⟩
def source80 (i : Fin 52) : Fin 52 := ⟨sourceData80.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree80 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 .empty (.cutX 5120 .empty (.cutY 19456 (.cutX 5632 .empty (.cutY 18944 (.cutX 5888 .empty (.cutY 18688 .empty (.cutX 6016 (.cutY 18816 (.cutX 5952 (.cutY 18752 .full .full) (.cutY 18752 .full .full)) .full) (.cutY 18816 (.cutX 6080 (.cutY 18752 .full .full) (.cutY 18752 (.cutX 6112 (.cutY 18720 .full .full) (.cutY 18720 .full .full)) .full)) .full)))) .empty)) .empty))) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 .empty (.cutX 13312 .empty (.cutY 27648 (.cutX 13824 .empty (.cutY 27136 (.cutX 14080 (.cutY 26880 (.cutX 13952 (.cutY 26752 .full .full) (.cutY 26752 (.cutX 14016 (.cutY 26688 .full .full) (.cutY 26688 (.cutX 14048 (.cutY 26656 .full .full) (.cutY 26656 .full .full)) .full)) (.cutX 14016 (.cutY 26816 .full .full) (.cutY 26816 .full .full)))) .empty) .empty) .empty)) .empty))) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 (.cutX 19456 (.cutY 5120 .empty (.cutX 18944 (.cutY 5632 .empty (.cutX 18688 .empty (.cutY 5888 .empty (.cutX 18816 (.cutY 6016 (.cutX 18752 (.cutY 5952 .full .full) (.cutY 5952 .full .full)) (.cutX 18752 (.cutY 6080 .full (.cutX 18720 (.cutY 6112 .full .full) (.cutY 6112 .full .full))) (.cutY 6080 .full .full))) (.cutY 6016 .full .full))))) .empty)) .empty) .empty))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 (.cutX 27648 (.cutY 13312 .empty (.cutX 27136 (.cutY 13824 .empty (.cutX 26880 (.cutY 14080 (.cutX 26752 (.cutY 13952 .full (.cutX 26688 (.cutY 14016 .full (.cutX 26656 (.cutY 14048 .full .full) (.cutY 14048 .full .full))) (.cutY 14016 .full .full))) (.cutY 13952 .full (.cutX 26816 (.cutY 14016 .full .full) (.cutY 14016 .full .full)))) .empty) .empty)) .empty)) .empty) .empty))) .empty))) .empty))

theorem metadata80 : 0<157738472 ∧ 23<128 ∧ 73<128 ∧ 1<4 ∧
    6648/4160=1 ∧ 6648%4160=2488 ∧ ∀ i, (leaves80 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData80).mp
    (by decide +kernel)

theorem sourceChecked80_0 : ∀ i : Fin 52,
    (fun i => output80 i = raw80 (source80 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked80 : ∀ i : Fin 52, (fun i => output80 i = raw80 (source80 i)) i :=
  forallFin_of_zero_offset (fun i => output80 i = raw80 (source80 i)) sourceChecked80_0

theorem coverChecked80_0 : ∀ i : Fin 52,
    (fun i => (output80 (cover80 i)).ContainsBox (raw80 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked80 : ∀ i : Fin 52, (fun i => (output80 (cover80 i)).ContainsBox (raw80 i)) i :=
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

noncomputable def phaseMass80 : ℝ := singlePhaseMass (157738472/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw80 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass80_eq : phaseMass80 = (19717309/204800000000 : ℝ) := by
  unfold phaseMass80
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw80 output80 cover80 source80
    (gridTreeUnionCheck_sound 32768 raw80 output80 cover80 source80 tree80 checked80)
    _ (by norm_num) _, areaUnits80]
  norm_num

-- Frozen phase 5428, atom 4836, type 1, source (5,61).
def leavesData81 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves81 : Fin 13 → DyadicLeaf := leavesData81.get
def raw81 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 5 61 leaves81 i
def outputData81 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨1280,1344,15616,15680⟩) (.node (.single ⟨1280,1344,15680,15744⟩) (.single ⟨1344,1408,15616,15680⟩))) (.node (.single ⟨1344,1408,15680,15744⟩) (.node (.single ⟨1280,1408,15744,15872⟩) (.single ⟨1408,1472,15616,15680⟩)))) (.node (.node (.single ⟨1408,1472,15680,15744⟩) (.node (.single ⟨1472,1504,15616,15648⟩) (.single ⟨1472,1504,15648,15680⟩))) (.node (.node (.single ⟨1504,1536,15616,15648⟩) (.single ⟨1504,1536,15648,15680⟩)) (.node (.single ⟨1472,1536,15680,15744⟩) (.single ⟨1408,1536,15744,15872⟩))))) (.node (.node (.node (.single ⟨15616,15680,1280,1344⟩) (.node (.single ⟨15616,15680,1344,1408⟩) (.single ⟨15680,15744,1280,1344⟩))) (.node (.single ⟨15680,15744,1344,1408⟩) (.node (.single ⟨15616,15680,1408,1472⟩) (.single ⟨15616,15648,1472,1504⟩)))) (.node (.node (.single ⟨15616,15648,1504,1536⟩) (.node (.single ⟨15648,15680,1472,1504⟩) (.single ⟨15648,15680,1504,1536⟩))) (.node (.node (.single ⟨15680,15744,1408,1472⟩) (.single ⟨15680,15744,1472,1536⟩)) (.node (.single ⟨15744,15872,1280,1408⟩) (.single ⟨15744,15872,1408,1536⟩)))))) (.node (.node (.node (.node (.single ⟨16896,17024,31232,31360⟩) (.node (.single ⟨16896,17024,31360,31488⟩) (.single ⟨17024,17088,31232,31296⟩))) (.node (.single ⟨17024,17088,31296,31360⟩) (.node (.single ⟨17088,17120,31232,31264⟩) (.single ⟨17088,17120,31264,31296⟩)))) (.node (.node (.single ⟨17120,17152,31232,31264⟩) (.node (.single ⟨17120,17152,31264,31296⟩) (.single ⟨17088,17152,31296,31360⟩))) (.node (.node (.single ⟨17024,17088,31360,31424⟩) (.single ⟨17024,17088,31424,31488⟩)) (.node (.single ⟨17088,17152,31360,31424⟩) (.single ⟨17088,17152,31424,31488⟩))))) (.node (.node (.node (.single ⟨31232,31360,16896,17024⟩) (.node (.single ⟨31232,31296,17024,17088⟩) (.single ⟨31232,31264,17088,17120⟩))) (.node (.single ⟨31232,31264,17120,17152⟩) (.node (.single ⟨31264,31296,17088,17120⟩) (.single ⟨31264,31296,17120,17152⟩)))) (.node (.node (.single ⟨31296,31360,17024,17088⟩) (.node (.single ⟨31296,31360,17088,17152⟩) (.single ⟨31360,31488,16896,17024⟩))) (.node (.node (.single ⟨31360,31424,17024,17088⟩) (.single ⟨31360,31424,17088,17152⟩)) (.node (.single ⟨31424,31488,17024,17088⟩) (.single ⟨31424,31488,17088,17152⟩)))))))
def output81 : Fin 52 → GridBox := outputData81.get
def coverData81 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 24) (.single 47))) (.node (.single 27) (.node (.single 12) (.single 25)))) (.node (.node (.single 39) (.node (.single 26) (.single 5))) (.node (.node (.single 17) (.single 46)) (.node (.single 34) (.single 6))))) (.node (.node (.node (.single 22) (.node (.single 45) (.single 29))) (.node (.single 11) (.node (.single 23) (.single 40)))) (.node (.node (.single 28) (.node (.single 0) (.single 13))) (.node (.node (.single 51) (.single 38)) (.node (.single 1) (.single 15)))))) (.node (.node (.node (.node (.single 50) (.node (.single 36) (.single 2))) (.node (.single 14) (.node (.single 49) (.single 37)))) (.node (.node (.single 3) (.node (.single 16) (.single 48))) (.node (.node (.single 35) (.single 7)) (.node (.single 18) (.single 44))))) (.node (.node (.node (.single 33) (.node (.single 8) (.single 20))) (.node (.single 43) (.node (.single 31) (.single 9)))) (.node (.node (.single 19) (.node (.single 42) (.single 32))) (.node (.node (.single 10) (.single 21)) (.node (.single 41) (.single 30)))))))
def sourceData81 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover81 (i : Fin 52) : Fin 52 := ⟨coverData81.get i % 52, Nat.mod_lt _ (by decide)⟩
def source81 (i : Fin 52) : Fin 52 := ⟨sourceData81.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree81 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 .empty (.cutX 1024 .empty (.cutY 15360 .empty (.cutX 1536 (.cutY 15872 (.cutX 1280 .empty (.cutY 15616 .empty (.cutX 1408 (.cutY 15744 (.cutX 1344 (.cutY 15680 .full .full) (.cutY 15680 .full .full)) .full) (.cutY 15744 (.cutX 1472 (.cutY 15680 .full .full) (.cutY 15680 (.cutX 1504 (.cutY 15648 .full .full) (.cutY 15648 .full .full)) .full)) .full)))) .empty) .empty)))) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 (.cutX 15360 .empty (.cutY 1024 .empty (.cutX 15872 (.cutY 1536 (.cutX 15616 .empty (.cutY 1280 .empty (.cutX 15744 (.cutY 1408 (.cutX 15680 (.cutY 1344 .full .full) (.cutY 1344 .full .full)) (.cutX 15680 (.cutY 1472 .full (.cutX 15648 (.cutY 1504 .full .full) (.cutY 1504 .full .full))) (.cutY 1472 .full .full))) (.cutY 1408 .full .full)))) .empty) .empty))) .empty)) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 .empty (.cutX 17408 (.cutY 31744 (.cutX 16896 .empty (.cutY 31232 .empty (.cutX 17152 (.cutY 31488 (.cutX 17024 (.cutY 31360 .full .full) (.cutY 31360 (.cutX 17088 (.cutY 31296 .full .full) (.cutY 31296 (.cutX 17120 (.cutY 31264 .full .full) (.cutY 31264 .full .full)) .full)) (.cutX 17088 (.cutY 31424 .full .full) (.cutY 31424 .full .full)))) .empty) .empty))) .empty) .empty)) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 (.cutX 31744 (.cutY 17408 (.cutX 31232 .empty (.cutY 16896 .empty (.cutX 31488 (.cutY 17152 (.cutX 31360 (.cutY 17024 .full (.cutX 31296 (.cutY 17088 .full (.cutX 31264 (.cutY 17120 .full .full) (.cutY 17120 .full .full))) (.cutY 17088 .full .full))) (.cutY 17024 .full (.cutX 31424 (.cutY 17088 .full .full) (.cutY 17088 .full .full)))) .empty) .empty))) .empty) .empty) .empty)) .empty)) .empty))))

theorem metadata81 : 0<169648215 ∧ 5<128 ∧ 61<128 ∧ 1<4 ∧
    4836/4160=1 ∧ 4836%4160=676 ∧ ∀ i, (leaves81 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData81).mp
    (by decide +kernel)

theorem sourceChecked81_0 : ∀ i : Fin 52,
    (fun i => output81 i = raw81 (source81 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked81 : ∀ i : Fin 52, (fun i => output81 i = raw81 (source81 i)) i :=
  forallFin_of_zero_offset (fun i => output81 i = raw81 (source81 i)) sourceChecked81_0

theorem coverChecked81_0 : ∀ i : Fin 52,
    (fun i => (output81 (cover81 i)).ContainsBox (raw81 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked81 : ∀ i : Fin 52, (fun i => (output81 (cover81 i)).ContainsBox (raw81 i)) i :=
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

noncomputable def phaseMass81 : ℝ := singlePhaseMass (169648215/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw81 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass81_eq : phaseMass81 = (33929643/327680000000 : ℝ) := by
  unfold phaseMass81
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw81 output81 cover81 source81
    (gridTreeUnionCheck_sound 32768 raw81 output81 cover81 source81 tree81 checked81)
    _ (by norm_num) _, areaUnits81]
  norm_num

-- Frozen phase 5429, atom 4219, type 1, source (0,59).
def leavesData82 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves82 : Fin 13 → DyadicLeaf := leavesData82.get
def raw82 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 0 59 leaves82 i
def outputData82 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨0,64,15104,15168⟩) (.node (.single ⟨0,64,15168,15232⟩) (.single ⟨64,128,15104,15168⟩))) (.node (.single ⟨64,128,15168,15232⟩) (.node (.single ⟨0,128,15232,15360⟩) (.single ⟨128,192,15104,15168⟩)))) (.node (.node (.single ⟨128,192,15168,15232⟩) (.node (.single ⟨192,224,15104,15136⟩) (.single ⟨192,224,15136,15168⟩))) (.node (.node (.single ⟨224,256,15104,15136⟩) (.single ⟨224,256,15136,15168⟩)) (.node (.single ⟨192,256,15168,15232⟩) (.single ⟨128,256,15232,15360⟩))))) (.node (.node (.node (.single ⟨15104,15168,0,64⟩) (.node (.single ⟨15104,15168,64,128⟩) (.single ⟨15168,15232,0,64⟩))) (.node (.single ⟨15168,15232,64,128⟩) (.node (.single ⟨15104,15168,128,192⟩) (.single ⟨15104,15136,192,224⟩)))) (.node (.node (.single ⟨15104,15136,224,256⟩) (.node (.single ⟨15136,15168,192,224⟩) (.single ⟨15136,15168,224,256⟩))) (.node (.node (.single ⟨15168,15232,128,192⟩) (.single ⟨15168,15232,192,256⟩)) (.node (.single ⟨15232,15360,0,128⟩) (.single ⟨15232,15360,128,256⟩)))))) (.node (.node (.node (.node (.single ⟨17408,17536,32512,32640⟩) (.node (.single ⟨17408,17536,32640,32768⟩) (.single ⟨17536,17600,32512,32576⟩))) (.node (.single ⟨17536,17600,32576,32640⟩) (.node (.single ⟨17600,17632,32512,32544⟩) (.single ⟨17600,17632,32544,32576⟩)))) (.node (.node (.single ⟨17632,17664,32512,32544⟩) (.node (.single ⟨17632,17664,32544,32576⟩) (.single ⟨17600,17664,32576,32640⟩))) (.node (.node (.single ⟨17536,17600,32640,32704⟩) (.single ⟨17536,17600,32704,32768⟩)) (.node (.single ⟨17600,17664,32640,32704⟩) (.single ⟨17600,17664,32704,32768⟩))))) (.node (.node (.node (.single ⟨32512,32640,17408,17536⟩) (.node (.single ⟨32512,32576,17536,17600⟩) (.single ⟨32512,32544,17600,17632⟩))) (.node (.single ⟨32512,32544,17632,17664⟩) (.node (.single ⟨32544,32576,17600,17632⟩) (.single ⟨32544,32576,17632,17664⟩)))) (.node (.node (.single ⟨32576,32640,17536,17600⟩) (.node (.single ⟨32576,32640,17600,17664⟩) (.single ⟨32640,32768,17408,17536⟩))) (.node (.node (.single ⟨32640,32704,17536,17600⟩) (.single ⟨32640,32704,17600,17664⟩)) (.node (.single ⟨32704,32768,17536,17600⟩) (.single ⟨32704,32768,17600,17664⟩)))))))
def output82 : Fin 52 → GridBox := outputData82.get
def coverData82 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 24) (.single 47))) (.node (.single 27) (.node (.single 12) (.single 25)))) (.node (.node (.single 39) (.node (.single 26) (.single 5))) (.node (.node (.single 17) (.single 46)) (.node (.single 34) (.single 6))))) (.node (.node (.node (.single 22) (.node (.single 45) (.single 29))) (.node (.single 11) (.node (.single 23) (.single 40)))) (.node (.node (.single 28) (.node (.single 0) (.single 13))) (.node (.node (.single 51) (.single 38)) (.node (.single 1) (.single 15)))))) (.node (.node (.node (.node (.single 50) (.node (.single 36) (.single 2))) (.node (.single 14) (.node (.single 49) (.single 37)))) (.node (.node (.single 3) (.node (.single 16) (.single 48))) (.node (.node (.single 35) (.single 7)) (.node (.single 18) (.single 44))))) (.node (.node (.node (.single 33) (.node (.single 8) (.single 20))) (.node (.single 43) (.node (.single 31) (.single 9)))) (.node (.node (.single 19) (.node (.single 42) (.single 32))) (.node (.node (.single 10) (.single 21)) (.node (.single 41) (.single 30)))))))
def sourceData82 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover82 (i : Fin 52) : Fin 52 := ⟨coverData82.get i % 52, Nat.mod_lt _ (by decide)⟩
def source82 (i : Fin 52) : Fin 52 := ⟨sourceData82.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree82 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 .empty (.cutX 1024 (.cutY 15360 (.cutX 512 (.cutY 14848 .empty (.cutX 256 (.cutY 15104 .empty (.cutX 128 (.cutY 15232 (.cutX 64 (.cutY 15168 .full .full) (.cutY 15168 .full .full)) .full) (.cutY 15232 (.cutX 192 (.cutY 15168 .full .full) (.cutY 15168 (.cutX 224 (.cutY 15136 .full .full) (.cutY 15136 .full .full)) .full)) .full))) .empty)) .empty) .empty) .empty)) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 (.cutX 15360 (.cutY 1024 (.cutX 14848 .empty (.cutY 512 (.cutX 15104 .empty (.cutY 256 (.cutX 15232 (.cutY 128 (.cutX 15168 (.cutY 64 .full .full) (.cutY 64 .full .full)) (.cutX 15168 (.cutY 192 .full (.cutX 15136 (.cutY 224 .full .full) (.cutY 224 .full .full))) (.cutY 192 .full .full))) (.cutY 128 .full .full)) .empty)) .empty)) .empty) .empty) .empty)) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 .empty (.cutX 17408 .empty (.cutY 31744 .empty (.cutX 17920 (.cutY 32256 .empty (.cutX 17664 (.cutY 32512 .empty (.cutX 17536 (.cutY 32640 .full .full) (.cutY 32640 (.cutX 17600 (.cutY 32576 .full .full) (.cutY 32576 (.cutX 17632 (.cutY 32544 .full .full) (.cutY 32544 .full .full)) .full)) (.cutX 17600 (.cutY 32704 .full .full) (.cutY 32704 .full .full))))) .empty)) .empty)))) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 (.cutX 31744 .empty (.cutY 17408 .empty (.cutX 32256 .empty (.cutY 17920 (.cutX 32512 .empty (.cutY 17664 (.cutX 32640 (.cutY 17536 .full (.cutX 32576 (.cutY 17600 .full (.cutX 32544 (.cutY 17632 .full .full) (.cutY 17632 .full .full))) (.cutY 17600 .full .full))) (.cutY 17536 .full (.cutX 32704 (.cutY 17600 .full .full) (.cutY 17600 .full .full)))) .empty)) .empty)))) .empty)) .empty)) .empty))))

theorem metadata82 : 0<169648215 ∧ 0<128 ∧ 59<128 ∧ 1<4 ∧
    4219/4160=1 ∧ 4219%4160=59 ∧ ∀ i, (leaves82 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData82).mp
    (by decide +kernel)

theorem sourceChecked82_0 : ∀ i : Fin 52,
    (fun i => output82 i = raw82 (source82 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked82 : ∀ i : Fin 52, (fun i => output82 i = raw82 (source82 i)) i :=
  forallFin_of_zero_offset (fun i => output82 i = raw82 (source82 i)) sourceChecked82_0

theorem coverChecked82_0 : ∀ i : Fin 52,
    (fun i => (output82 (cover82 i)).ContainsBox (raw82 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked82 : ∀ i : Fin 52, (fun i => (output82 (cover82 i)).ContainsBox (raw82 i)) i :=
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

noncomputable def phaseMass82 : ℝ := singlePhaseMass (169648215/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw82 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass82_eq : phaseMass82 = (33929643/327680000000 : ℝ) := by
  unfold phaseMass82
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw82 output82 cover82 source82
    (gridTreeUnionCheck_sound 32768 raw82 output82 cover82 source82 tree82 checked82)
    _ (by norm_num) _, areaUnits82]
  norm_num

-- Frozen phase 5430, atom 7556, type 1, source (36,84).
def leavesData83 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves83 : Fin 7 → DyadicLeaf := leavesData83.get
def raw83 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 36 84 leaves83 i
def outputData83 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨9216,9344,21504,21632⟩) (.node (.single ⟨9216,9344,21632,21760⟩) (.single ⟨9344,9408,21504,21568⟩))) (.node (.node (.single ⟨9344,9408,21568,21632⟩) (.single ⟨9408,9472,21504,21568⟩)) (.node (.single ⟨9408,9472,21568,21632⟩) (.single ⟨9344,9472,21632,21760⟩)))) (.node (.node (.single ⟨11008,11136,23296,23424⟩) (.node (.single ⟨11008,11136,23424,23552⟩) (.single ⟨11136,11200,23296,23360⟩))) (.node (.node (.single ⟨11136,11200,23360,23424⟩) (.single ⟨11200,11264,23296,23360⟩)) (.node (.single ⟨11200,11264,23360,23424⟩) (.single ⟨11136,11264,23424,23552⟩))))) (.node (.node (.node (.single ⟨21504,21632,9216,9344⟩) (.node (.single ⟨21504,21568,9344,9408⟩) (.single ⟨21504,21568,9408,9472⟩))) (.node (.node (.single ⟨21568,21632,9344,9408⟩) (.single ⟨21568,21632,9408,9472⟩)) (.node (.single ⟨21632,21760,9216,9344⟩) (.single ⟨21632,21760,9344,9472⟩)))) (.node (.node (.single ⟨23296,23424,11008,11136⟩) (.node (.single ⟨23296,23360,11136,11200⟩) (.single ⟨23296,23360,11200,11264⟩))) (.node (.node (.single ⟨23360,23424,11136,11200⟩) (.single ⟨23360,23424,11200,11264⟩)) (.node (.single ⟨23424,23552,11008,11136⟩) (.single ⟨23424,23552,11136,11264⟩))))))
def output83 : Fin 28 → GridBox := outputData83.get
def coverData83 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData83 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover83 (i : Fin 28) : Fin 28 := ⟨coverData83.get i % 28, Nat.mod_lt _ (by decide)⟩
def source83 (i : Fin 28) : Fin 28 := ⟨sourceData83.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree83 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 (.cutX 9216 .empty (.cutY 21504 .empty (.cutX 9728 (.cutY 22016 (.cutX 9472 (.cutY 21760 (.cutX 9344 (.cutY 21632 .full .full) (.cutY 21632 (.cutX 9408 (.cutY 21568 .full .full) (.cutY 21568 .full .full)) .full)) .empty) .empty) .empty) .empty))) .empty) (.cutY 22528 .empty (.cutX 11264 (.cutY 23552 (.cutX 10752 .empty (.cutY 23040 .empty (.cutX 11008 .empty (.cutY 23296 .empty (.cutX 11136 (.cutY 23424 .full .full) (.cutY 23424 (.cutX 11200 (.cutY 23360 .full .full) (.cutY 23360 .full .full)) .full)))))) .empty) .empty)))) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 (.cutY 10240 (.cutX 21504 .empty (.cutY 9216 .empty (.cutX 22016 (.cutY 9728 (.cutX 21760 (.cutY 9472 (.cutX 21632 (.cutY 9344 .full (.cutX 21568 (.cutY 9408 .full .full) (.cutY 9408 .full .full))) (.cutY 9344 .full .full)) .empty) .empty) .empty) .empty))) .empty) (.cutY 10240 .empty (.cutX 23552 (.cutY 11264 (.cutX 23040 .empty (.cutY 10752 .empty (.cutX 23296 .empty (.cutY 11008 .empty (.cutX 23424 (.cutY 11136 .full (.cutX 23360 (.cutY 11200 .full .full) (.cutY 11200 .full .full))) (.cutY 11136 .full .full)))))) .empty) .empty))) .empty))) .empty) .empty))

theorem metadata83 : 0<156512574 ∧ 36<128 ∧ 84<128 ∧ 1<4 ∧
    7556/4160=1 ∧ 7556%4160=3396 ∧ ∀ i, (leaves83 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData83).mp
    (by decide +kernel)

theorem sourceChecked83_0 : ∀ i : Fin 28,
    (fun i => output83 i = raw83 (source83 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked83 : ∀ i : Fin 28, (fun i => output83 i = raw83 (source83 i)) i :=
  forallFin_of_zero_offset (fun i => output83 i = raw83 (source83 i)) sourceChecked83_0

theorem coverChecked83_0 : ∀ i : Fin 28,
    (fun i => (output83 (cover83 i)).ContainsBox (raw83 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked83 : ∀ i : Fin 28, (fun i => (output83 (cover83 i)).ContainsBox (raw83 i)) i :=
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

noncomputable def phaseMass83 : ℝ := singlePhaseMass (156512574/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw83 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass83_eq : phaseMass83 = (78256287/819200000000 : ℝ) := by
  unfold phaseMass83
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw83 output83 cover83 source83
    (gridTreeUnionCheck_sound 32768 raw83 output83 cover83 source83 tree83 checked83)
    _ (by norm_num) _, areaUnits83]
  norm_num

-- Frozen phase 5431, atom 7717, type 1, source (39,86).
def leavesData84 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩)))) (.node (.node (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves84 : Fin 16 → DyadicLeaf := leavesData84.get
def raw84 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 39 86 leaves84 i
def outputData84 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨9984,10048,22016,22080⟩) (.single ⟨9984,10048,22080,22144⟩)) (.node (.single ⟨10048,10112,22016,22080⟩) (.single ⟨10048,10112,22080,22144⟩))) (.node (.node (.single ⟨9984,10112,22144,22272⟩) (.single ⟨10112,10176,22016,22080⟩)) (.node (.single ⟨10112,10176,22080,22144⟩) (.single ⟨10176,10208,22016,22048⟩)))) (.node (.node (.node (.single ⟨10176,10208,22048,22080⟩) (.single ⟨10208,10240,22016,22048⟩)) (.node (.single ⟨10208,10240,22048,22080⟩) (.single ⟨10176,10240,22080,22144⟩))) (.node (.node (.single ⟨10112,10176,22144,22208⟩) (.single ⟨10112,10176,22208,22272⟩)) (.node (.single ⟨10176,10240,22144,22208⟩) (.single ⟨10176,10240,22208,22272⟩))))) (.node (.node (.node (.node (.single ⟨10496,10560,22528,22592⟩) (.single ⟨10496,10560,22592,22656⟩)) (.node (.single ⟨10560,10624,22528,22592⟩) (.single ⟨10560,10624,22592,22656⟩))) (.node (.node (.single ⟨10496,10624,22656,22784⟩) (.single ⟨10624,10688,22528,22592⟩)) (.node (.single ⟨10624,10688,22592,22656⟩) (.single ⟨10688,10720,22528,22560⟩)))) (.node (.node (.node (.single ⟨10688,10720,22560,22592⟩) (.single ⟨10720,10752,22528,22560⟩)) (.node (.single ⟨10720,10752,22560,22592⟩) (.single ⟨10688,10752,22592,22656⟩))) (.node (.node (.single ⟨10624,10688,22656,22720⟩) (.single ⟨10624,10688,22720,22784⟩)) (.node (.single ⟨10688,10752,22656,22720⟩) (.single ⟨10688,10752,22720,22784⟩)))))) (.node (.node (.node (.node (.node (.single ⟨22016,22080,9984,10048⟩) (.single ⟨22016,22080,10048,10112⟩)) (.node (.single ⟨22080,22144,9984,10048⟩) (.single ⟨22080,22144,10048,10112⟩))) (.node (.node (.single ⟨22016,22080,10112,10176⟩) (.single ⟨22016,22048,10176,10208⟩)) (.node (.single ⟨22016,22048,10208,10240⟩) (.single ⟨22048,22080,10176,10208⟩)))) (.node (.node (.node (.single ⟨22048,22080,10208,10240⟩) (.single ⟨22080,22144,10112,10176⟩)) (.node (.single ⟨22080,22144,10176,10240⟩) (.single ⟨22144,22272,9984,10112⟩))) (.node (.node (.single ⟨22144,22208,10112,10176⟩) (.single ⟨22144,22208,10176,10240⟩)) (.node (.single ⟨22208,22272,10112,10176⟩) (.single ⟨22208,22272,10176,10240⟩))))) (.node (.node (.node (.node (.single ⟨22528,22592,10496,10560⟩) (.single ⟨22528,22592,10560,10624⟩)) (.node (.single ⟨22592,22656,10496,10560⟩) (.single ⟨22592,22656,10560,10624⟩))) (.node (.node (.single ⟨22528,22592,10624,10688⟩) (.single ⟨22528,22560,10688,10720⟩)) (.node (.single ⟨22528,22560,10720,10752⟩) (.single ⟨22560,22592,10688,10720⟩)))) (.node (.node (.node (.single ⟨22560,22592,10720,10752⟩) (.single ⟨22592,22656,10624,10688⟩)) (.node (.single ⟨22592,22656,10688,10752⟩) (.single ⟨22656,22784,10496,10624⟩))) (.node (.node (.single ⟨22656,22720,10624,10688⟩) (.single ⟨22656,22720,10688,10752⟩)) (.node (.single ⟨22720,22784,10624,10688⟩) (.single ⟨22720,22784,10688,10752⟩)))))))
def output84 : Fin 64 → GridBox := outputData84.get
def coverData84 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 43)) (.node (.single 59) (.single 20))) (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31)))) (.node (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29))) (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30))))) (.node (.node (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28))) (.node (.node (.single 5) (.single 36)) (.node (.single 58) (.single 27)))) (.node (.node (.node (.single 6) (.single 41)) (.node (.single 57) (.single 22))) (.node (.node (.single 11) (.single 42)) (.node (.single 52) (.single 21)))))) (.node (.node (.node (.node (.node (.single 12) (.single 44)) (.node (.single 51) (.single 19))) (.node (.node (.single 13) (.single 46)) (.node (.single 50) (.single 17)))) (.node (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16))))) (.node (.node (.node (.node (.single 7) (.single 37)) (.node (.single 56) (.single 26))) (.node (.node (.single 8) (.single 39)) (.node (.single 55) (.single 24)))) (.node (.node (.node (.single 9) (.single 38)) (.node (.single 54) (.single 25))) (.node (.node (.single 10) (.single 40)) (.node (.single 53) (.single 23)))))))
def sourceData84 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 8)) (.node (.single 12) (.single 16))) (.node (.node (.single 0) (.single 20)) (.node (.single 24) (.single 48)))) (.node (.node (.node (.single 52) (.single 56)) (.node (.single 60) (.single 28))) (.node (.node (.single 32) (.single 36)) (.node (.single 40) (.single 44))))) (.node (.node (.node (.node (.single 47) (.single 39)) (.node (.single 43) (.single 35))) (.node (.node (.single 3) (.single 31)) (.node (.single 27) (.single 63)))) (.node (.node (.node (.single 55) (.single 59)) (.node (.single 51) (.single 23))) (.node (.node (.single 19) (.single 11)) (.node (.single 15) (.single 7)))))) (.node (.node (.node (.node (.node (.single 5) (.single 13)) (.node (.single 9) (.single 17))) (.node (.node (.single 21) (.single 49)) (.node (.single 57) (.single 53)))) (.node (.node (.node (.single 61) (.single 25)) (.node (.single 29) (.single 1))) (.node (.node (.single 33) (.single 41)) (.node (.single 37) (.single 45))))) (.node (.node (.node (.node (.single 46) (.single 42)) (.node (.single 38) (.single 34))) (.node (.node (.single 30) (.single 62)) (.node (.single 58) (.single 54)))) (.node (.node (.node (.single 50) (.single 26)) (.node (.single 22) (.single 2))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.single 6)))))))
def cover84 (i : Fin 64) : Fin 64 := ⟨coverData84.get i % 64, Nat.mod_lt _ (by decide)⟩
def source84 (i : Fin 64) : Fin 64 := ⟨sourceData84.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree84 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 (.cutX 9216 .empty (.cutY 21504 .empty (.cutX 9728 .empty (.cutY 22016 .empty (.cutX 9984 .empty (.cutY 22272 (.cutX 10112 (.cutY 22144 (.cutX 10048 (.cutY 22080 .full .full) (.cutY 22080 .full .full)) .full) (.cutY 22144 (.cutX 10176 (.cutY 22080 .full .full) (.cutY 22080 (.cutX 10208 (.cutY 22048 .full .full) (.cutY 22048 .full .full)) .full)) (.cutX 10176 (.cutY 22208 .full .full) (.cutY 22208 .full .full)))) .empty)))))) .empty) (.cutY 22528 .empty (.cutX 11264 (.cutY 23552 (.cutX 10752 (.cutY 23040 (.cutX 10496 .empty (.cutY 22784 (.cutX 10624 (.cutY 22656 (.cutX 10560 (.cutY 22592 .full .full) (.cutY 22592 .full .full)) .full) (.cutY 22656 (.cutX 10688 (.cutY 22592 .full .full) (.cutY 22592 (.cutX 10720 (.cutY 22560 .full .full) (.cutY 22560 .full .full)) .full)) (.cutX 10688 (.cutY 22720 .full .full) (.cutY 22720 .full .full)))) .empty)) .empty) .empty) .empty) .empty)))) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 (.cutY 10240 (.cutX 21504 .empty (.cutY 9216 .empty (.cutX 22016 .empty (.cutY 9728 .empty (.cutX 22272 (.cutY 9984 .empty (.cutX 22144 (.cutY 10112 (.cutX 22080 (.cutY 10048 .full .full) (.cutY 10048 .full .full)) (.cutX 22080 (.cutY 10176 .full (.cutX 22048 (.cutY 10208 .full .full) (.cutY 10208 .full .full))) (.cutY 10176 .full .full))) (.cutY 10112 .full (.cutX 22208 (.cutY 10176 .full .full) (.cutY 10176 .full .full))))) .empty))))) .empty) (.cutY 10240 .empty (.cutX 23552 (.cutY 11264 (.cutX 23040 (.cutY 10752 (.cutX 22784 (.cutY 10496 .empty (.cutX 22656 (.cutY 10624 (.cutX 22592 (.cutY 10560 .full .full) (.cutY 10560 .full .full)) (.cutX 22592 (.cutY 10688 .full (.cutX 22560 (.cutY 10720 .full .full) (.cutY 10720 .full .full))) (.cutY 10688 .full .full))) (.cutY 10624 .full (.cutX 22720 (.cutY 10688 .full .full) (.cutY 10688 .full .full))))) .empty) .empty) .empty) .empty) .empty))) .empty))) .empty) .empty))

theorem metadata84 : 0<156512574 ∧ 39<128 ∧ 86<128 ∧ 1<4 ∧
    7717/4160=1 ∧ 7717%4160=3557 ∧ ∀ i, (leaves84 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData84).mp
    (by decide +kernel)

theorem sourceChecked84_0 : ∀ i : Fin 64,
    (fun i => output84 i = raw84 (source84 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked84 : ∀ i : Fin 64, (fun i => output84 i = raw84 (source84 i)) i :=
  forallFin_of_zero_offset (fun i => output84 i = raw84 (source84 i)) sourceChecked84_0

theorem coverChecked84_0 : ∀ i : Fin 64,
    (fun i => (output84 (cover84 i)).ContainsBox (raw84 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked84 : ∀ i : Fin 64, (fun i => (output84 (cover84 i)).ContainsBox (raw84 i)) i :=
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

noncomputable def phaseMass84 : ℝ := singlePhaseMass (156512574/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw84 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass84_eq : phaseMass84 = (78256287/819200000000 : ℝ) := by
  unfold phaseMass84
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw84 output84 cover84 source84
    (gridTreeUnionCheck_sound 32768 raw84 output84 cover84 source84 tree84 checked84)
    _ (by norm_num) _, areaUnits84]
  norm_num

-- Frozen phase 5432, atom 2807, type 0, source (27,80).
def leavesData85 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves85 : Fin 7 → DyadicLeaf := leavesData85.get
def raw85 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 27 80 leaves85 i
def outputData85 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨6912,7040,20480,20608⟩) (.node (.single ⟨6912,7040,20608,20736⟩) (.single ⟨7040,7104,20480,20544⟩))) (.node (.node (.single ⟨7040,7104,20544,20608⟩) (.single ⟨7104,7168,20480,20544⟩)) (.node (.single ⟨7104,7168,20544,20608⟩) (.single ⟨7040,7168,20608,20736⟩)))) (.node (.node (.single ⟨12032,12160,25600,25728⟩) (.node (.single ⟨12032,12160,25728,25856⟩) (.single ⟨12160,12224,25600,25664⟩))) (.node (.node (.single ⟨12160,12224,25664,25728⟩) (.single ⟨12224,12288,25600,25664⟩)) (.node (.single ⟨12224,12288,25664,25728⟩) (.single ⟨12160,12288,25728,25856⟩))))) (.node (.node (.node (.single ⟨20480,20608,6912,7040⟩) (.node (.single ⟨20480,20544,7040,7104⟩) (.single ⟨20480,20544,7104,7168⟩))) (.node (.node (.single ⟨20544,20608,7040,7104⟩) (.single ⟨20544,20608,7104,7168⟩)) (.node (.single ⟨20608,20736,6912,7040⟩) (.single ⟨20608,20736,7040,7168⟩)))) (.node (.node (.single ⟨25600,25728,12032,12160⟩) (.node (.single ⟨25600,25664,12160,12224⟩) (.single ⟨25600,25664,12224,12288⟩))) (.node (.node (.single ⟨25664,25728,12160,12224⟩) (.single ⟨25664,25728,12224,12288⟩)) (.node (.single ⟨25728,25856,12032,12160⟩) (.single ⟨25728,25856,12160,12288⟩))))))
def output85 : Fin 28 → GridBox := outputData85.get
def coverData85 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData85 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover85 (i : Fin 28) : Fin 28 := ⟨coverData85.get i % 28, Nat.mod_lt _ (by decide)⟩
def source85 (i : Fin 28) : Fin 28 := ⟨sourceData85.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree85 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 (.cutX 7168 (.cutY 21504 (.cutX 6656 .empty (.cutY 20992 (.cutX 6912 .empty (.cutY 20736 (.cutX 7040 (.cutY 20608 .full .full) (.cutY 20608 (.cutX 7104 (.cutY 20544 .full .full) (.cutY 20544 .full .full)) .full)) .empty)) .empty)) .empty) .empty) .empty)))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 (.cutX 11264 .empty (.cutY 25600 .empty (.cutX 11776 .empty (.cutY 26112 (.cutX 12032 .empty (.cutY 25856 (.cutX 12160 (.cutY 25728 .full .full) (.cutY 25728 (.cutX 12224 (.cutY 25664 .full .full) (.cutY 25664 .full .full)) .full)) .empty)) .empty)))) .empty)) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 .empty (.cutX 21504 (.cutY 7168 (.cutX 20992 (.cutY 6656 .empty (.cutX 20736 (.cutY 6912 .empty (.cutX 20608 (.cutY 7040 .full (.cutX 20544 (.cutY 7104 .full .full) (.cutY 7104 .full .full))) (.cutY 7040 .full .full))) .empty)) .empty) .empty) .empty)) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 .empty (.cutX 25600 .empty (.cutY 11264 .empty (.cutX 26112 (.cutY 11776 .empty (.cutX 25856 (.cutY 12032 .empty (.cutX 25728 (.cutY 12160 .full (.cutX 25664 (.cutY 12224 .full .full) (.cutY 12224 .full .full))) (.cutY 12160 .full .full))) .empty)) .empty)))) .empty) .empty) .empty))) .empty))

theorem metadata85 : 0<104681033 ∧ 27<128 ∧ 80<128 ∧ 0<4 ∧
    2807/4160=0 ∧ 2807%4160=2807 ∧ ∀ i, (leaves85 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData85).mp
    (by decide +kernel)

theorem sourceChecked85_0 : ∀ i : Fin 28,
    (fun i => output85 i = raw85 (source85 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked85 : ∀ i : Fin 28, (fun i => output85 i = raw85 (source85 i)) i :=
  forallFin_of_zero_offset (fun i => output85 i = raw85 (source85 i)) sourceChecked85_0

theorem coverChecked85_0 : ∀ i : Fin 28,
    (fun i => (output85 (cover85 i)).ContainsBox (raw85 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked85 : ∀ i : Fin 28, (fun i => (output85 (cover85 i)).ContainsBox (raw85 i)) i :=
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

noncomputable def phaseMass85 : ℝ := singlePhaseMass (104681033/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw85 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass85_eq : phaseMass85 = (104681033/1638400000000 : ℝ) := by
  unfold phaseMass85
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw85 output85 cover85 source85
    (gridTreeUnionCheck_sound 32768 raw85 output85 cover85 source85 tree85 checked85)
    _ (by norm_num) _, areaUnits85]
  norm_num

-- Frozen phase 5433, atom 2145, type 0, source (19,74).
def leavesData86 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves86 : Fin 7 → DyadicLeaf := leavesData86.get
def raw86 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 19 74 leaves86 i
def outputData86 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨4864,4992,18944,19072⟩) (.node (.single ⟨4864,4992,19072,19200⟩) (.single ⟨4992,5056,18944,19008⟩))) (.node (.node (.single ⟨4992,5056,19008,19072⟩) (.single ⟨5056,5120,18944,19008⟩)) (.node (.single ⟨5056,5120,19008,19072⟩) (.single ⟨4992,5120,19072,19200⟩)))) (.node (.node (.single ⟨13568,13696,27648,27776⟩) (.node (.single ⟨13568,13696,27776,27904⟩) (.single ⟨13696,13760,27648,27712⟩))) (.node (.node (.single ⟨13696,13760,27712,27776⟩) (.single ⟨13760,13824,27648,27712⟩)) (.node (.single ⟨13760,13824,27712,27776⟩) (.single ⟨13696,13824,27776,27904⟩))))) (.node (.node (.node (.single ⟨18944,19072,4864,4992⟩) (.node (.single ⟨18944,19008,4992,5056⟩) (.single ⟨18944,19008,5056,5120⟩))) (.node (.node (.single ⟨19008,19072,4992,5056⟩) (.single ⟨19008,19072,5056,5120⟩)) (.node (.single ⟨19072,19200,4864,4992⟩) (.single ⟨19072,19200,4992,5120⟩)))) (.node (.node (.single ⟨27648,27776,13568,13696⟩) (.node (.single ⟨27648,27712,13696,13760⟩) (.single ⟨27648,27712,13760,13824⟩))) (.node (.node (.single ⟨27712,27776,13696,13760⟩) (.single ⟨27712,27776,13760,13824⟩)) (.node (.single ⟨27776,27904,13568,13696⟩) (.single ⟨27776,27904,13696,13824⟩))))))
def output86 : Fin 28 → GridBox := outputData86.get
def coverData86 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData86 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover86 (i : Fin 28) : Fin 28 := ⟨coverData86.get i % 28, Nat.mod_lt _ (by decide)⟩
def source86 (i : Fin 28) : Fin 28 := ⟨sourceData86.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree86 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 .empty (.cutX 5120 (.cutY 19456 (.cutX 4608 .empty (.cutY 18944 .empty (.cutX 4864 .empty (.cutY 19200 (.cutX 4992 (.cutY 19072 .full .full) (.cutY 19072 (.cutX 5056 (.cutY 19008 .full .full) (.cutY 19008 .full .full)) .full)) .empty)))) .empty) .empty)) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 .empty (.cutX 13312 .empty (.cutY 27648 .empty (.cutX 13824 (.cutY 28160 (.cutX 13568 .empty (.cutY 27904 (.cutX 13696 (.cutY 27776 .full .full) (.cutY 27776 (.cutX 13760 (.cutY 27712 .full .full) (.cutY 27712 .full .full)) .full)) .empty)) .empty) .empty)))) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 (.cutX 19456 (.cutY 5120 (.cutX 18944 .empty (.cutY 4608 .empty (.cutX 19200 (.cutY 4864 .empty (.cutX 19072 (.cutY 4992 .full (.cutX 19008 (.cutY 5056 .full .full) (.cutY 5056 .full .full))) (.cutY 4992 .full .full))) .empty))) .empty) .empty) .empty))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 (.cutX 27648 .empty (.cutY 13312 .empty (.cutX 28160 (.cutY 13824 (.cutX 27904 (.cutY 13568 .empty (.cutX 27776 (.cutY 13696 .full (.cutX 27712 (.cutY 13760 .full .full) (.cutY 13760 .full .full))) (.cutY 13696 .full .full))) .empty) .empty) .empty))) .empty))) .empty))) .empty))

theorem metadata86 : 0<147396112 ∧ 19<128 ∧ 74<128 ∧ 0<4 ∧
    2145/4160=0 ∧ 2145%4160=2145 ∧ ∀ i, (leaves86 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData86).mp
    (by decide +kernel)

theorem sourceChecked86_0 : ∀ i : Fin 28,
    (fun i => output86 i = raw86 (source86 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked86 : ∀ i : Fin 28, (fun i => output86 i = raw86 (source86 i)) i :=
  forallFin_of_zero_offset (fun i => output86 i = raw86 (source86 i)) sourceChecked86_0

theorem coverChecked86_0 : ∀ i : Fin 28,
    (fun i => (output86 (cover86 i)).ContainsBox (raw86 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked86 : ∀ i : Fin 28, (fun i => (output86 (cover86 i)).ContainsBox (raw86 i)) i :=
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

noncomputable def phaseMass86 : ℝ := singlePhaseMass (147396112/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw86 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass86_eq : phaseMass86 = (9212257/102400000000 : ℝ) := by
  unfold phaseMass86
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw86 output86 cover86 source86
    (gridTreeUnionCheck_sound 32768 raw86 output86 cover86 source86 tree86 checked86)
    _ (by norm_num) _, areaUnits86]
  norm_num

-- Frozen phase 5434, atom 7037, type 1, source (28,77).
def leavesData87 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩)))) (.node (.node (.node (.single ⟨2,1,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.single ⟨3,7,1⟩))) (.node (.node (.single ⟨4,14,0⟩) (.single ⟨4,14,1⟩)) (.node (.single ⟨4,15,0⟩) (.single ⟨4,15,1⟩)))))
def leaves87 : Fin 16 → DyadicLeaf := leavesData87.get
def raw87 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 28 77 leaves87 i
def outputData87 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨7168,7232,19712,19776⟩) (.single ⟨7168,7232,19776,19840⟩)) (.node (.single ⟨7232,7296,19712,19776⟩) (.single ⟨7232,7296,19776,19840⟩))) (.node (.node (.single ⟨7168,7296,19840,19968⟩) (.single ⟨7296,7360,19712,19776⟩)) (.node (.single ⟨7296,7360,19776,19840⟩) (.single ⟨7360,7392,19712,19744⟩)))) (.node (.node (.node (.single ⟨7360,7392,19744,19776⟩) (.single ⟨7392,7408,19712,19728⟩)) (.node (.single ⟨7392,7408,19728,19744⟩) (.single ⟨7408,7424,19712,19728⟩))) (.node (.node (.single ⟨7408,7424,19728,19744⟩) (.single ⟨7392,7424,19744,19776⟩)) (.node (.single ⟨7360,7424,19776,19840⟩) (.single ⟨7296,7424,19840,19968⟩))))) (.node (.node (.node (.node (.single ⟨12800,12928,25344,25472⟩) (.single ⟨12800,12928,25472,25600⟩)) (.node (.single ⟨12928,12992,25344,25408⟩) (.single ⟨12928,12992,25408,25472⟩))) (.node (.node (.single ⟨12992,13024,25344,25376⟩) (.single ⟨12992,13024,25376,25408⟩)) (.node (.single ⟨13024,13040,25344,25360⟩) (.single ⟨13024,13040,25360,25376⟩)))) (.node (.node (.node (.single ⟨13040,13056,25344,25360⟩) (.single ⟨13040,13056,25360,25376⟩)) (.node (.single ⟨13024,13056,25376,25408⟩) (.single ⟨12992,13056,25408,25472⟩))) (.node (.node (.single ⟨12928,12992,25472,25536⟩) (.single ⟨12928,12992,25536,25600⟩)) (.node (.single ⟨12992,13056,25472,25536⟩) (.single ⟨12992,13056,25536,25600⟩)))))) (.node (.node (.node (.node (.node (.single ⟨19712,19776,7168,7232⟩) (.single ⟨19712,19776,7232,7296⟩)) (.node (.single ⟨19776,19840,7168,7232⟩) (.single ⟨19776,19840,7232,7296⟩))) (.node (.node (.single ⟨19712,19776,7296,7360⟩) (.single ⟨19712,19744,7360,7392⟩)) (.node (.single ⟨19712,19728,7392,7408⟩) (.single ⟨19712,19728,7408,7424⟩)))) (.node (.node (.node (.single ⟨19728,19744,7392,7408⟩) (.single ⟨19728,19744,7408,7424⟩)) (.node (.single ⟨19744,19776,7360,7392⟩) (.single ⟨19744,19776,7392,7424⟩))) (.node (.node (.single ⟨19776,19840,7296,7360⟩) (.single ⟨19776,19840,7360,7424⟩)) (.node (.single ⟨19840,19968,7168,7296⟩) (.single ⟨19840,19968,7296,7424⟩))))) (.node (.node (.node (.node (.single ⟨25344,25472,12800,12928⟩) (.single ⟨25344,25408,12928,12992⟩)) (.node (.single ⟨25344,25376,12992,13024⟩) (.single ⟨25344,25360,13024,13040⟩))) (.node (.node (.single ⟨25344,25360,13040,13056⟩) (.single ⟨25360,25376,13024,13040⟩)) (.node (.single ⟨25360,25376,13040,13056⟩) (.single ⟨25376,25408,12992,13024⟩)))) (.node (.node (.node (.single ⟨25376,25408,13024,13056⟩) (.single ⟨25408,25472,12928,12992⟩)) (.node (.single ⟨25408,25472,12992,13056⟩) (.single ⟨25472,25600,12800,12928⟩))) (.node (.node (.single ⟨25472,25536,12928,12992⟩) (.single ⟨25472,25536,12992,13056⟩)) (.node (.single ⟨25536,25600,12928,12992⟩) (.single ⟨25536,25600,12992,13056⟩)))))))
def output87 : Fin 64 → GridBox := outputData87.get
def coverData87 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 46)) (.node (.single 59) (.single 17))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16)))) (.node (.node (.node (.single 5) (.single 36)) (.node (.single 58) (.single 27))) (.node (.node (.single 6) (.single 44)) (.node (.single 57) (.single 19))))) (.node (.node (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18))) (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31)))) (.node (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29))) (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30)))))) (.node (.node (.node (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28))) (.node (.node (.single 7) (.single 37)) (.node (.single 56) (.single 26)))) (.node (.node (.node (.single 8) (.single 42)) (.node (.single 55) (.single 21))) (.node (.node (.single 13) (.single 43)) (.node (.single 50) (.single 20))))) (.node (.node (.node (.node (.single 9) (.single 38)) (.node (.single 54) (.single 25))) (.node (.node (.single 10) (.single 40)) (.node (.single 53) (.single 23)))) (.node (.node (.node (.single 11) (.single 39)) (.node (.single 52) (.single 24))) (.node (.node (.single 12) (.single 41)) (.node (.single 51) (.single 22)))))))
def sourceData87 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 20) (.single 24)) (.node (.single 28) (.single 32))) (.node (.node (.single 0) (.single 8)) (.node (.single 12) (.single 36)))) (.node (.node (.node (.single 40) (.single 48)) (.node (.single 52) (.single 56))) (.node (.node (.single 60) (.single 44)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.node (.single 7) (.single 3)) (.node (.single 19) (.single 15))) (.node (.node (.single 47) (.single 43)) (.node (.single 63) (.single 55)))) (.node (.node (.node (.single 59) (.single 51)) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.node (.single 21) (.single 29)) (.node (.single 25) (.single 33))) (.node (.node (.single 9) (.single 37)) (.node (.single 49) (.single 57)))) (.node (.node (.node (.single 53) (.single 61)) (.node (.single 41) (.single 45))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.node (.single 6) (.single 18)) (.node (.single 46) (.single 62))) (.node (.node (.single 58) (.single 54)) (.node (.single 50) (.single 42)))) (.node (.node (.node (.single 38) (.single 14)) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover87 (i : Fin 64) : Fin 64 := ⟨coverData87.get i % 64, Nat.mod_lt _ (by decide)⟩
def source87 (i : Fin 64) : Fin 64 := ⟨sourceData87.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree87 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 .empty (.cutX 7168 .empty (.cutY 19456 .empty (.cutX 7680 (.cutY 19968 (.cutX 7424 (.cutY 19712 .empty (.cutX 7296 (.cutY 19840 (.cutX 7232 (.cutY 19776 .full .full) (.cutY 19776 .full .full)) .full) (.cutY 19840 (.cutX 7360 (.cutY 19776 .full .full) (.cutY 19776 (.cutX 7392 (.cutY 19744 .full .full) (.cutY 19744 (.cutX 7408 (.cutY 19728 .full .full) (.cutY 19728 .full .full)) .full)) .full)) .full))) .empty) .empty) .empty))))) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 (.cutX 13312 (.cutY 25600 (.cutX 12800 .empty (.cutY 25088 .empty (.cutX 13056 (.cutY 25344 .empty (.cutX 12928 (.cutY 25472 .full .full) (.cutY 25472 (.cutX 12992 (.cutY 25408 .full .full) (.cutY 25408 (.cutX 13024 (.cutY 25376 .full .full) (.cutY 25376 (.cutX 13040 (.cutY 25360 .full .full) (.cutY 25360 .full .full)) .full)) .full)) (.cutX 12992 (.cutY 25536 .full .full) (.cutY 25536 .full .full))))) .empty))) .empty) .empty) .empty) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 .empty (.cutX 19456 .empty (.cutY 7168 .empty (.cutX 19968 (.cutY 7680 (.cutX 19712 .empty (.cutY 7424 (.cutX 19840 (.cutY 7296 (.cutX 19776 (.cutY 7232 .full .full) (.cutY 7232 .full .full)) (.cutX 19776 (.cutY 7360 .full (.cutX 19744 (.cutY 7392 .full (.cutX 19728 (.cutY 7408 .full .full) (.cutY 7408 .full .full))) (.cutY 7392 .full .full))) (.cutY 7360 .full .full))) (.cutY 7296 .full .full)) .empty)) .empty) .empty)))))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 (.cutX 25600 (.cutY 13312 (.cutX 25088 .empty (.cutY 12800 .empty (.cutX 25344 .empty (.cutY 13056 (.cutX 25472 (.cutY 12928 .full (.cutX 25408 (.cutY 12992 .full (.cutX 25376 (.cutY 13024 .full (.cutX 25360 (.cutY 13040 .full .full) (.cutY 13040 .full .full))) (.cutY 13024 .full .full))) (.cutY 12992 .full .full))) (.cutY 12928 .full (.cutX 25536 (.cutY 12992 .full .full) (.cutY 12992 .full .full)))) .empty)))) .empty) .empty) .empty) .empty)) .empty))) .empty))

theorem metadata87 : 0<140060506 ∧ 28<128 ∧ 77<128 ∧ 1<4 ∧
    7037/4160=1 ∧ 7037%4160=2877 ∧ ∀ i, (leaves87 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData87).mp
    (by decide +kernel)

theorem sourceChecked87_0 : ∀ i : Fin 64,
    (fun i => output87 i = raw87 (source87 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked87 : ∀ i : Fin 64, (fun i => output87 i = raw87 (source87 i)) i :=
  forallFin_of_zero_offset (fun i => output87 i = raw87 (source87 i)) sourceChecked87_0

theorem coverChecked87_0 : ∀ i : Fin 64,
    (fun i => (output87 (cover87 i)).ContainsBox (raw87 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked87 : ∀ i : Fin 64, (fun i => (output87 (cover87 i)).ContainsBox (raw87 i)) i :=
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

noncomputable def phaseMass87 : ℝ := singlePhaseMass (140060506/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw87 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass87_eq : phaseMass87 = (70030253/819200000000 : ℝ) := by
  unfold phaseMass87
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw87 output87 cover87 source87
    (gridTreeUnionCheck_sound 32768 raw87 output87 cover87 source87 tree87 checked87)
    _ (by norm_num) _, areaUnits87]
  norm_num

-- Frozen phase 5435, atom 6301, type 1, source (19,70).
def leavesData88 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves88 : Fin 13 → DyadicLeaf := leavesData88.get
def raw88 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 19 70 leaves88 i
def outputData88 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨4864,4928,17920,17984⟩) (.node (.single ⟨4864,4928,17984,18048⟩) (.single ⟨4928,4992,17920,17984⟩))) (.node (.single ⟨4928,4992,17984,18048⟩) (.node (.single ⟨4864,4992,18048,18176⟩) (.single ⟨4992,5056,17920,17984⟩)))) (.node (.node (.single ⟨4992,5056,17984,18048⟩) (.node (.single ⟨5056,5088,17920,17952⟩) (.single ⟨5056,5088,17952,17984⟩))) (.node (.node (.single ⟨5088,5120,17920,17952⟩) (.single ⟨5088,5120,17952,17984⟩)) (.node (.single ⟨5056,5120,17984,18048⟩) (.single ⟨4992,5120,18048,18176⟩))))) (.node (.node (.node (.single ⟨14592,14720,27648,27776⟩) (.node (.single ⟨14592,14720,27776,27904⟩) (.single ⟨14720,14784,27648,27712⟩))) (.node (.single ⟨14720,14784,27712,27776⟩) (.node (.single ⟨14784,14816,27648,27680⟩) (.single ⟨14784,14816,27680,27712⟩)))) (.node (.node (.single ⟨14816,14848,27648,27680⟩) (.node (.single ⟨14816,14848,27680,27712⟩) (.single ⟨14784,14848,27712,27776⟩))) (.node (.node (.single ⟨14720,14784,27776,27840⟩) (.single ⟨14720,14784,27840,27904⟩)) (.node (.single ⟨14784,14848,27776,27840⟩) (.single ⟨14784,14848,27840,27904⟩)))))) (.node (.node (.node (.node (.single ⟨17920,17984,4864,4928⟩) (.node (.single ⟨17920,17984,4928,4992⟩) (.single ⟨17984,18048,4864,4928⟩))) (.node (.single ⟨17984,18048,4928,4992⟩) (.node (.single ⟨17920,17984,4992,5056⟩) (.single ⟨17920,17952,5056,5088⟩)))) (.node (.node (.single ⟨17920,17952,5088,5120⟩) (.node (.single ⟨17952,17984,5056,5088⟩) (.single ⟨17952,17984,5088,5120⟩))) (.node (.node (.single ⟨17984,18048,4992,5056⟩) (.single ⟨17984,18048,5056,5120⟩)) (.node (.single ⟨18048,18176,4864,4992⟩) (.single ⟨18048,18176,4992,5120⟩))))) (.node (.node (.node (.single ⟨27648,27776,14592,14720⟩) (.node (.single ⟨27648,27712,14720,14784⟩) (.single ⟨27648,27680,14784,14816⟩))) (.node (.single ⟨27648,27680,14816,14848⟩) (.node (.single ⟨27680,27712,14784,14816⟩) (.single ⟨27680,27712,14816,14848⟩)))) (.node (.node (.single ⟨27712,27776,14720,14784⟩) (.node (.single ⟨27712,27776,14784,14848⟩) (.single ⟨27776,27904,14592,14720⟩))) (.node (.node (.single ⟨27776,27840,14720,14784⟩) (.single ⟨27776,27840,14784,14848⟩)) (.node (.single ⟨27840,27904,14720,14784⟩) (.single ⟨27840,27904,14784,14848⟩)))))))
def output88 : Fin 52 → GridBox := outputData88.get
def coverData88 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData88 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover88 (i : Fin 52) : Fin 52 := ⟨coverData88.get i % 52, Nat.mod_lt _ (by decide)⟩
def source88 (i : Fin 52) : Fin 52 := ⟨sourceData88.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree88 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 (.cutX 5120 (.cutY 17408 .empty (.cutX 4608 .empty (.cutY 17920 .empty (.cutX 4864 .empty (.cutY 18176 (.cutX 4992 (.cutY 18048 (.cutX 4928 (.cutY 17984 .full .full) (.cutY 17984 .full .full)) .full) (.cutY 18048 (.cutX 5056 (.cutY 17984 .full .full) (.cutY 17984 (.cutX 5088 (.cutY 17952 .full .full) (.cutY 17952 .full .full)) .full)) .full)) .empty))))) .empty) .empty) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 .empty (.cutX 15360 (.cutY 27648 .empty (.cutX 14848 (.cutY 28160 (.cutX 14592 .empty (.cutY 27904 (.cutX 14720 (.cutY 27776 .full .full) (.cutY 27776 (.cutX 14784 (.cutY 27712 .full .full) (.cutY 27712 (.cutX 14816 (.cutY 27680 .full .full) (.cutY 27680 .full .full)) .full)) (.cutX 14784 (.cutY 27840 .full .full) (.cutY 27840 .full .full)))) .empty)) .empty) .empty)) .empty))) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 (.cutX 17408 .empty (.cutY 5120 (.cutX 17920 .empty (.cutY 4608 .empty (.cutX 18176 (.cutY 4864 .empty (.cutX 18048 (.cutY 4992 (.cutX 17984 (.cutY 4928 .full .full) (.cutY 4928 .full .full)) (.cutX 17984 (.cutY 5056 .full (.cutX 17952 (.cutY 5088 .full .full) (.cutY 5088 .full .full))) (.cutY 5056 .full .full))) (.cutY 4992 .full .full))) .empty))) .empty)) .empty) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 .empty (.cutX 27648 .empty (.cutY 15360 (.cutX 28160 (.cutY 14848 (.cutX 27904 (.cutY 14592 .empty (.cutX 27776 (.cutY 14720 .full (.cutX 27712 (.cutY 14784 .full (.cutX 27680 (.cutY 14816 .full .full) (.cutY 14816 .full .full))) (.cutY 14784 .full .full))) (.cutY 14720 .full (.cutX 27840 (.cutY 14784 .full .full) (.cutY 14784 .full .full))))) .empty) .empty) .empty) .empty))))) .empty))) .empty))

theorem metadata88 : 0<135260814 ∧ 19<128 ∧ 70<128 ∧ 1<4 ∧
    6301/4160=1 ∧ 6301%4160=2141 ∧ ∀ i, (leaves88 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData88).mp
    (by decide +kernel)

theorem sourceChecked88_0 : ∀ i : Fin 52,
    (fun i => output88 i = raw88 (source88 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked88 : ∀ i : Fin 52, (fun i => output88 i = raw88 (source88 i)) i :=
  forallFin_of_zero_offset (fun i => output88 i = raw88 (source88 i)) sourceChecked88_0

theorem coverChecked88_0 : ∀ i : Fin 52,
    (fun i => (output88 (cover88 i)).ContainsBox (raw88 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked88 : ∀ i : Fin 52, (fun i => (output88 (cover88 i)).ContainsBox (raw88 i)) i :=
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

noncomputable def phaseMass88 : ℝ := singlePhaseMass (135260814/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw88 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass88_eq : phaseMass88 = (67630407/819200000000 : ℝ) := by
  unfold phaseMass88
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw88 output88 cover88 source88
    (gridTreeUnionCheck_sound 32768 raw88 output88 cover88 source88 tree88 checked88)
    _ (by norm_num) _, areaUnits88]
  norm_num

-- Frozen phase 5436, atom 7612, type 1, source (37,85).
def leavesData89 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves89 : Fin 7 → DyadicLeaf := leavesData89.get
def raw89 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 37 85 leaves89 i
def outputData89 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨9472,9600,21760,21888⟩) (.node (.single ⟨9472,9600,21888,22016⟩) (.single ⟨9600,9664,21760,21824⟩))) (.node (.node (.single ⟨9600,9664,21824,21888⟩) (.single ⟨9664,9728,21760,21824⟩)) (.node (.single ⟨9664,9728,21824,21888⟩) (.single ⟨9600,9728,21888,22016⟩)))) (.node (.node (.single ⟨10752,10880,23040,23168⟩) (.node (.single ⟨10752,10880,23168,23296⟩) (.single ⟨10880,10944,23040,23104⟩))) (.node (.node (.single ⟨10880,10944,23104,23168⟩) (.single ⟨10944,11008,23040,23104⟩)) (.node (.single ⟨10944,11008,23104,23168⟩) (.single ⟨10880,11008,23168,23296⟩))))) (.node (.node (.node (.single ⟨21760,21888,9472,9600⟩) (.node (.single ⟨21760,21824,9600,9664⟩) (.single ⟨21760,21824,9664,9728⟩))) (.node (.node (.single ⟨21824,21888,9600,9664⟩) (.single ⟨21824,21888,9664,9728⟩)) (.node (.single ⟨21888,22016,9472,9600⟩) (.single ⟨21888,22016,9600,9728⟩)))) (.node (.node (.single ⟨23040,23168,10752,10880⟩) (.node (.single ⟨23040,23104,10880,10944⟩) (.single ⟨23040,23104,10944,11008⟩))) (.node (.node (.single ⟨23104,23168,10880,10944⟩) (.single ⟨23104,23168,10944,11008⟩)) (.node (.single ⟨23168,23296,10752,10880⟩) (.single ⟨23168,23296,10880,11008⟩))))))
def output89 : Fin 28 → GridBox := outputData89.get
def coverData89 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData89 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover89 (i : Fin 28) : Fin 28 := ⟨coverData89.get i % 28, Nat.mod_lt _ (by decide)⟩
def source89 (i : Fin 28) : Fin 28 := ⟨sourceData89.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree89 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 (.cutX 9216 .empty (.cutY 21504 .empty (.cutX 9728 (.cutY 22016 (.cutX 9472 .empty (.cutY 21760 .empty (.cutX 9600 (.cutY 21888 .full .full) (.cutY 21888 (.cutX 9664 (.cutY 21824 .full .full) (.cutY 21824 .full .full)) .full)))) .empty) .empty))) .empty) (.cutY 22528 .empty (.cutX 11264 (.cutY 23552 (.cutX 10752 .empty (.cutY 23040 .empty (.cutX 11008 (.cutY 23296 (.cutX 10880 (.cutY 23168 .full .full) (.cutY 23168 (.cutX 10944 (.cutY 23104 .full .full) (.cutY 23104 .full .full)) .full)) .empty) .empty))) .empty) .empty)))) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 (.cutY 10240 (.cutX 21504 .empty (.cutY 9216 .empty (.cutX 22016 (.cutY 9728 (.cutX 21760 .empty (.cutY 9472 .empty (.cutX 21888 (.cutY 9600 .full (.cutX 21824 (.cutY 9664 .full .full) (.cutY 9664 .full .full))) (.cutY 9600 .full .full)))) .empty) .empty))) .empty) (.cutY 10240 .empty (.cutX 23552 (.cutY 11264 (.cutX 23040 .empty (.cutY 10752 .empty (.cutX 23296 (.cutY 11008 (.cutX 23168 (.cutY 10880 .full (.cutX 23104 (.cutY 10944 .full .full) (.cutY 10944 .full .full))) (.cutY 10880 .full .full)) .empty) .empty))) .empty) .empty))) .empty))) .empty) .empty))

theorem metadata89 : 0<156512574 ∧ 37<128 ∧ 85<128 ∧ 1<4 ∧
    7612/4160=1 ∧ 7612%4160=3452 ∧ ∀ i, (leaves89 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData89).mp
    (by decide +kernel)

theorem sourceChecked89_0 : ∀ i : Fin 28,
    (fun i => output89 i = raw89 (source89 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked89 : ∀ i : Fin 28, (fun i => output89 i = raw89 (source89 i)) i :=
  forallFin_of_zero_offset (fun i => output89 i = raw89 (source89 i)) sourceChecked89_0

theorem coverChecked89_0 : ∀ i : Fin 28,
    (fun i => (output89 (cover89 i)).ContainsBox (raw89 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked89 : ∀ i : Fin 28, (fun i => (output89 (cover89 i)).ContainsBox (raw89 i)) i :=
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

noncomputable def phaseMass89 : ℝ := singlePhaseMass (156512574/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw89 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass89_eq : phaseMass89 = (78256287/819200000000 : ℝ) := by
  unfold phaseMass89
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw89 output89 cover89 source89
    (gridTreeUnionCheck_sound 32768 raw89 output89 cover89 source89 tree89 checked89)
    _ (by norm_num) _, areaUnits89]
  norm_num

-- Frozen phase 5437, atom 3400, type 0, source (36,88).
def leavesData90 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves90 : Fin 4 → DyadicLeaf := leavesData90.get
def raw90 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 36 88 leaves90 i
def outputData90 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨9216,9344,22528,22656⟩) (.single ⟨9216,9344,22656,22784⟩)) (.node (.single ⟨9344,9472,22528,22656⟩) (.single ⟨9344,9472,22656,22784⟩))) (.node (.node (.single ⟨9984,10112,23296,23424⟩) (.single ⟨9984,10112,23424,23552⟩)) (.node (.single ⟨10112,10240,23296,23424⟩) (.single ⟨10112,10240,23424,23552⟩)))) (.node (.node (.node (.single ⟨22528,22656,9216,9344⟩) (.single ⟨22528,22656,9344,9472⟩)) (.node (.single ⟨22656,22784,9216,9344⟩) (.single ⟨22656,22784,9344,9472⟩))) (.node (.node (.single ⟨23296,23424,9984,10112⟩) (.single ⟨23296,23424,10112,10240⟩)) (.node (.single ⟨23424,23552,9984,10112⟩) (.single ⟨23424,23552,10112,10240⟩)))))
def output90 : Fin 16 → GridBox := outputData90.get
def coverData90 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData90 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover90 (i : Fin 16) : Fin 16 := ⟨coverData90.get i % 16, Nat.mod_lt _ (by decide)⟩
def source90 (i : Fin 16) : Fin 16 := ⟨sourceData90.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree90 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 .empty (.cutX 9216 .empty (.cutY 23552 (.cutX 9728 (.cutY 23040 (.cutX 9472 (.cutY 22784 (.cutX 9344 (.cutY 22656 .full .full) (.cutY 22656 .full .full)) .empty) .empty) .empty) (.cutY 23040 .empty (.cutX 9984 .empty (.cutY 23296 .empty (.cutX 10112 (.cutY 23424 .full .full) (.cutY 23424 .full .full)))))) .empty))) .empty)) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 .empty (.cutY 10240 (.cutX 23552 (.cutY 9216 .empty (.cutX 23040 (.cutY 9728 (.cutX 22784 (.cutY 9472 (.cutX 22656 (.cutY 9344 .full .full) (.cutY 9344 .full .full)) .empty) .empty) .empty) (.cutY 9728 .empty (.cutX 23296 .empty (.cutY 9984 .empty (.cutX 23424 (.cutY 10112 .full .full) (.cutY 10112 .full .full))))))) .empty) .empty)) .empty))) .empty) .empty))

theorem metadata90 : 0<75538780 ∧ 36<128 ∧ 88<128 ∧ 0<4 ∧
    3400/4160=0 ∧ 3400%4160=3400 ∧ ∀ i, (leaves90 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData90).mp
    (by decide +kernel)

theorem sourceChecked90_0 : ∀ i : Fin 16,
    (fun i => output90 i = raw90 (source90 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked90 : ∀ i : Fin 16, (fun i => output90 i = raw90 (source90 i)) i :=
  forallFin_of_zero_offset (fun i => output90 i = raw90 (source90 i)) sourceChecked90_0

theorem coverChecked90_0 : ∀ i : Fin 16,
    (fun i => (output90 (cover90 i)).ContainsBox (raw90 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked90 : ∀ i : Fin 16, (fun i => (output90 (cover90 i)).ContainsBox (raw90 i)) i :=
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

noncomputable def phaseMass90 : ℝ := singlePhaseMass (75538780/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw90 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass90_eq : phaseMass90 = (3776939/81920000000 : ℝ) := by
  unfold phaseMass90
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw90 output90 cover90 source90
    (gridTreeUnionCheck_sound 32768 raw90 output90 cover90 source90 tree90 checked90)
    _ (by norm_num) _, areaUnits90]
  norm_num

-- Frozen phase 5438, atom 7109, type 1, source (29,78).
def leavesData91 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves91 : Fin 10 → DyadicLeaf := leavesData91.get
def raw91 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 29 78 leaves91 i
def outputData91 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨7424,7552,19968,20096⟩) (.single ⟨7424,7552,20096,20224⟩)) (.node (.single ⟨7552,7616,19968,20032⟩) (.node (.single ⟨7552,7616,20032,20096⟩) (.single ⟨7616,7648,19968,20000⟩)))) (.node (.node (.single ⟨7616,7648,20000,20032⟩) (.single ⟨7648,7680,19968,20000⟩)) (.node (.single ⟨7648,7680,20000,20032⟩) (.node (.single ⟨7616,7680,20032,20096⟩) (.single ⟨7552,7680,20096,20224⟩))))) (.node (.node (.node (.single ⟨12544,12672,25088,25216⟩) (.single ⟨12544,12672,25216,25344⟩)) (.node (.single ⟨12672,12736,25088,25152⟩) (.node (.single ⟨12672,12736,25152,25216⟩) (.single ⟨12736,12768,25088,25120⟩)))) (.node (.node (.single ⟨12736,12768,25120,25152⟩) (.single ⟨12768,12800,25088,25120⟩)) (.node (.single ⟨12768,12800,25120,25152⟩) (.node (.single ⟨12736,12800,25152,25216⟩) (.single ⟨12672,12800,25216,25344⟩)))))) (.node (.node (.node (.node (.single ⟨19968,20096,7424,7552⟩) (.single ⟨19968,20032,7552,7616⟩)) (.node (.single ⟨19968,20000,7616,7648⟩) (.node (.single ⟨19968,20000,7648,7680⟩) (.single ⟨20000,20032,7616,7648⟩)))) (.node (.node (.single ⟨20000,20032,7648,7680⟩) (.single ⟨20032,20096,7552,7616⟩)) (.node (.single ⟨20032,20096,7616,7680⟩) (.node (.single ⟨20096,20224,7424,7552⟩) (.single ⟨20096,20224,7552,7680⟩))))) (.node (.node (.node (.single ⟨25088,25216,12544,12672⟩) (.single ⟨25088,25152,12672,12736⟩)) (.node (.single ⟨25088,25120,12736,12768⟩) (.node (.single ⟨25088,25120,12768,12800⟩) (.single ⟨25120,25152,12736,12768⟩)))) (.node (.node (.single ⟨25120,25152,12768,12800⟩) (.single ⟨25152,25216,12672,12736⟩)) (.node (.single ⟨25152,25216,12736,12800⟩) (.node (.single ⟨25216,25344,12544,12672⟩) (.single ⟨25216,25344,12672,12800⟩)))))))
def output91 : Fin 40 → GridBox := outputData91.get
def coverData91 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 28) (.single 38)) (.node (.single 11) (.node (.single 9) (.single 29))))) (.node (.node (.node (.single 30) (.single 10)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 26) (.node (.single 36) (.single 13)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 23) (.single 33)))) (.node (.node (.single 16) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))))
def sourceData91 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover91 (i : Fin 40) : Fin 40 := ⟨coverData91.get i % 40, Nat.mod_lt _ (by decide)⟩
def source91 (i : Fin 40) : Fin 40 := ⟨sourceData91.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree91 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 .empty (.cutX 7168 .empty (.cutY 19456 .empty (.cutX 7680 (.cutY 19968 .empty (.cutX 7424 .empty (.cutY 20224 (.cutX 7552 (.cutY 20096 .full .full) (.cutY 20096 (.cutX 7616 (.cutY 20032 .full .full) (.cutY 20032 (.cutX 7648 (.cutY 20000 .full .full) (.cutY 20000 .full .full)) .full)) .full)) .empty))) .empty))))) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 (.cutX 13312 (.cutY 25600 (.cutX 12800 (.cutY 25088 .empty (.cutX 12544 .empty (.cutY 25344 (.cutX 12672 (.cutY 25216 .full .full) (.cutY 25216 (.cutX 12736 (.cutY 25152 .full .full) (.cutY 25152 (.cutX 12768 (.cutY 25120 .full .full) (.cutY 25120 .full .full)) .full)) .full)) .empty))) .empty) .empty) .empty) .empty) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 .empty (.cutX 19456 .empty (.cutY 7168 .empty (.cutX 19968 .empty (.cutY 7680 (.cutX 20224 (.cutY 7424 .empty (.cutX 20096 (.cutY 7552 .full (.cutX 20032 (.cutY 7616 .full (.cutX 20000 (.cutY 7648 .full .full) (.cutY 7648 .full .full))) (.cutY 7616 .full .full))) (.cutY 7552 .full .full))) .empty) .empty))))))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 (.cutX 25600 (.cutY 13312 (.cutX 25088 .empty (.cutY 12800 (.cutX 25344 (.cutY 12544 .empty (.cutX 25216 (.cutY 12672 .full (.cutX 25152 (.cutY 12736 .full (.cutX 25120 (.cutY 12768 .full .full) (.cutY 12768 .full .full))) (.cutY 12736 .full .full))) (.cutY 12672 .full .full))) .empty) .empty)) .empty) .empty) .empty) .empty)) .empty))) .empty))

theorem metadata91 : 0<140060506 ∧ 29<128 ∧ 78<128 ∧ 1<4 ∧
    7109/4160=1 ∧ 7109%4160=2949 ∧ ∀ i, (leaves91 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData91).mp
    (by decide +kernel)

theorem sourceChecked91_0 : ∀ i : Fin 40,
    (fun i => output91 i = raw91 (source91 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked91 : ∀ i : Fin 40, (fun i => output91 i = raw91 (source91 i)) i :=
  forallFin_of_zero_offset (fun i => output91 i = raw91 (source91 i)) sourceChecked91_0

theorem coverChecked91_0 : ∀ i : Fin 40,
    (fun i => (output91 (cover91 i)).ContainsBox (raw91 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked91 : ∀ i : Fin 40, (fun i => (output91 (cover91 i)).ContainsBox (raw91 i)) i :=
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

noncomputable def phaseMass91 : ℝ := singlePhaseMass (140060506/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw91 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass91_eq : phaseMass91 = (70030253/819200000000 : ℝ) := by
  unfold phaseMass91
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw91 output91 cover91 source91
    (gridTreeUnionCheck_sound 32768 raw91 output91 cover91 source91 tree91 checked91)
    _ (by norm_num) _, areaUnits91]
  norm_num

-- Frozen phase 5439, atom 5069, type 1, source (7,62).
def leavesData92 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves92 : Fin 13 → DyadicLeaf := leavesData92.get
def raw92 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 7 62 leaves92 i
def outputData92 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨1792,1856,15872,15936⟩) (.node (.single ⟨1792,1856,15936,16000⟩) (.single ⟨1856,1920,15872,15936⟩))) (.node (.single ⟨1856,1920,15936,16000⟩) (.node (.single ⟨1792,1920,16000,16128⟩) (.single ⟨1920,1984,15872,15936⟩)))) (.node (.node (.single ⟨1920,1984,15936,16000⟩) (.node (.single ⟨1984,2016,15872,15904⟩) (.single ⟨1984,2016,15904,15936⟩))) (.node (.node (.single ⟨2016,2048,15872,15904⟩) (.single ⟨2016,2048,15904,15936⟩)) (.node (.single ⟨1984,2048,15936,16000⟩) (.single ⟨1920,2048,16000,16128⟩))))) (.node (.node (.node (.single ⟨15872,15936,1792,1856⟩) (.node (.single ⟨15872,15936,1856,1920⟩) (.single ⟨15936,16000,1792,1856⟩))) (.node (.single ⟨15936,16000,1856,1920⟩) (.node (.single ⟨15872,15936,1920,1984⟩) (.single ⟨15872,15904,1984,2016⟩)))) (.node (.node (.single ⟨15872,15904,2016,2048⟩) (.node (.single ⟨15904,15936,1984,2016⟩) (.single ⟨15904,15936,2016,2048⟩))) (.node (.node (.single ⟨15936,16000,1920,1984⟩) (.single ⟨15936,16000,1984,2048⟩)) (.node (.single ⟨16000,16128,1792,1920⟩) (.single ⟨16000,16128,1920,2048⟩)))))) (.node (.node (.node (.node (.single ⟨16640,16768,30720,30848⟩) (.node (.single ⟨16640,16768,30848,30976⟩) (.single ⟨16768,16832,30720,30784⟩))) (.node (.single ⟨16768,16832,30784,30848⟩) (.node (.single ⟨16832,16864,30720,30752⟩) (.single ⟨16832,16864,30752,30784⟩)))) (.node (.node (.single ⟨16864,16896,30720,30752⟩) (.node (.single ⟨16864,16896,30752,30784⟩) (.single ⟨16832,16896,30784,30848⟩))) (.node (.node (.single ⟨16768,16832,30848,30912⟩) (.single ⟨16768,16832,30912,30976⟩)) (.node (.single ⟨16832,16896,30848,30912⟩) (.single ⟨16832,16896,30912,30976⟩))))) (.node (.node (.node (.single ⟨30720,30848,16640,16768⟩) (.node (.single ⟨30720,30784,16768,16832⟩) (.single ⟨30720,30752,16832,16864⟩))) (.node (.single ⟨30720,30752,16864,16896⟩) (.node (.single ⟨30752,30784,16832,16864⟩) (.single ⟨30752,30784,16864,16896⟩)))) (.node (.node (.single ⟨30784,30848,16768,16832⟩) (.node (.single ⟨30784,30848,16832,16896⟩) (.single ⟨30848,30976,16640,16768⟩))) (.node (.node (.single ⟨30848,30912,16768,16832⟩) (.single ⟨30848,30912,16832,16896⟩)) (.node (.single ⟨30912,30976,16768,16832⟩) (.single ⟨30912,30976,16832,16896⟩)))))))
def output92 : Fin 52 → GridBox := outputData92.get
def coverData92 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 24) (.single 47))) (.node (.single 27) (.node (.single 12) (.single 25)))) (.node (.node (.single 39) (.node (.single 26) (.single 5))) (.node (.node (.single 17) (.single 46)) (.node (.single 34) (.single 6))))) (.node (.node (.node (.single 22) (.node (.single 45) (.single 29))) (.node (.single 11) (.node (.single 23) (.single 40)))) (.node (.node (.single 28) (.node (.single 0) (.single 13))) (.node (.node (.single 51) (.single 38)) (.node (.single 1) (.single 15)))))) (.node (.node (.node (.node (.single 50) (.node (.single 36) (.single 2))) (.node (.single 14) (.node (.single 49) (.single 37)))) (.node (.node (.single 3) (.node (.single 16) (.single 48))) (.node (.node (.single 35) (.single 7)) (.node (.single 18) (.single 44))))) (.node (.node (.node (.single 33) (.node (.single 8) (.single 20))) (.node (.single 43) (.node (.single 31) (.single 9)))) (.node (.node (.single 19) (.node (.single 42) (.single 32))) (.node (.node (.single 10) (.single 21)) (.node (.single 41) (.single 30)))))))
def sourceData92 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover92 (i : Fin 52) : Fin 52 := ⟨coverData92.get i % 52, Nat.mod_lt _ (by decide)⟩
def source92 (i : Fin 52) : Fin 52 := ⟨sourceData92.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree92 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 .empty (.cutX 1024 .empty (.cutY 15360 .empty (.cutX 1536 .empty (.cutY 15872 .empty (.cutX 1792 .empty (.cutY 16128 (.cutX 1920 (.cutY 16000 (.cutX 1856 (.cutY 15936 .full .full) (.cutY 15936 .full .full)) .full) (.cutY 16000 (.cutX 1984 (.cutY 15936 .full .full) (.cutY 15936 (.cutX 2016 (.cutY 15904 .full .full) (.cutY 15904 .full .full)) .full)) .full)) .empty))))))) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 (.cutX 15360 .empty (.cutY 1024 .empty (.cutX 15872 .empty (.cutY 1536 .empty (.cutX 16128 (.cutY 1792 .empty (.cutX 16000 (.cutY 1920 (.cutX 15936 (.cutY 1856 .full .full) (.cutY 1856 .full .full)) (.cutX 15936 (.cutY 1984 .full (.cutX 15904 (.cutY 2016 .full .full) (.cutY 2016 .full .full))) (.cutY 1984 .full .full))) (.cutY 1920 .full .full))) .empty))))) .empty)) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 .empty (.cutX 17408 (.cutY 31744 (.cutX 16896 (.cutY 31232 (.cutX 16640 .empty (.cutY 30976 (.cutX 16768 (.cutY 30848 .full .full) (.cutY 30848 (.cutX 16832 (.cutY 30784 .full .full) (.cutY 30784 (.cutX 16864 (.cutY 30752 .full .full) (.cutY 30752 .full .full)) .full)) (.cutX 16832 (.cutY 30912 .full .full) (.cutY 30912 .full .full)))) .empty)) .empty) .empty) .empty) .empty)) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 (.cutX 31744 (.cutY 17408 (.cutX 31232 (.cutY 16896 (.cutX 30976 (.cutY 16640 .empty (.cutX 30848 (.cutY 16768 .full (.cutX 30784 (.cutY 16832 .full (.cutX 30752 (.cutY 16864 .full .full) (.cutY 16864 .full .full))) (.cutY 16832 .full .full))) (.cutY 16768 .full (.cutX 30912 (.cutY 16832 .full .full) (.cutY 16832 .full .full))))) .empty) .empty) .empty) .empty) .empty) .empty)) .empty)) .empty))))

theorem metadata92 : 0<169648215 ∧ 7<128 ∧ 62<128 ∧ 1<4 ∧
    5069/4160=1 ∧ 5069%4160=909 ∧ ∀ i, (leaves92 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData92).mp
    (by decide +kernel)

theorem sourceChecked92_0 : ∀ i : Fin 52,
    (fun i => output92 i = raw92 (source92 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked92 : ∀ i : Fin 52, (fun i => output92 i = raw92 (source92 i)) i :=
  forallFin_of_zero_offset (fun i => output92 i = raw92 (source92 i)) sourceChecked92_0

theorem coverChecked92_0 : ∀ i : Fin 52,
    (fun i => (output92 (cover92 i)).ContainsBox (raw92 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked92 : ∀ i : Fin 52, (fun i => (output92 (cover92 i)).ContainsBox (raw92 i)) i :=
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

noncomputable def phaseMass92 : ℝ := singlePhaseMass (169648215/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw92 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass92_eq : phaseMass92 = (33929643/327680000000 : ℝ) := by
  unfold phaseMass92
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw92 output92 cover92 source92
    (gridTreeUnionCheck_sound 32768 raw92 output92 cover92 source92 tree92 checked92)
    _ (by norm_num) _, areaUnits92]
  norm_num

-- Frozen phase 5440, atom 2574, type 0, source (24,78).
def leavesData93 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves93 : Fin 7 → DyadicLeaf := leavesData93.get
def raw93 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 24 78 leaves93 i
def outputData93 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨6144,6272,19968,20096⟩) (.node (.single ⟨6144,6272,20096,20224⟩) (.single ⟨6272,6336,19968,20032⟩))) (.node (.node (.single ⟨6272,6336,20032,20096⟩) (.single ⟨6336,6400,19968,20032⟩)) (.node (.single ⟨6336,6400,20032,20096⟩) (.single ⟨6272,6400,20096,20224⟩)))) (.node (.node (.single ⟨12544,12672,26368,26496⟩) (.node (.single ⟨12544,12672,26496,26624⟩) (.single ⟨12672,12736,26368,26432⟩))) (.node (.node (.single ⟨12672,12736,26432,26496⟩) (.single ⟨12736,12800,26368,26432⟩)) (.node (.single ⟨12736,12800,26432,26496⟩) (.single ⟨12672,12800,26496,26624⟩))))) (.node (.node (.node (.single ⟨19968,20096,6144,6272⟩) (.node (.single ⟨19968,20032,6272,6336⟩) (.single ⟨19968,20032,6336,6400⟩))) (.node (.node (.single ⟨20032,20096,6272,6336⟩) (.single ⟨20032,20096,6336,6400⟩)) (.node (.single ⟨20096,20224,6144,6272⟩) (.single ⟨20096,20224,6272,6400⟩)))) (.node (.node (.single ⟨26368,26496,12544,12672⟩) (.node (.single ⟨26368,26432,12672,12736⟩) (.single ⟨26368,26432,12736,12800⟩))) (.node (.node (.single ⟨26432,26496,12672,12736⟩) (.single ⟨26432,26496,12736,12800⟩)) (.node (.single ⟨26496,26624,12544,12672⟩) (.single ⟨26496,26624,12672,12800⟩))))))
def output93 : Fin 28 → GridBox := outputData93.get
def coverData93 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData93 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover93 (i : Fin 28) : Fin 28 := ⟨coverData93.get i % 28, Nat.mod_lt _ (by decide)⟩
def source93 (i : Fin 28) : Fin 28 := ⟨sourceData93.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree93 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 .empty (.cutX 7168 (.cutY 19456 .empty (.cutX 6656 (.cutY 19968 .empty (.cutX 6400 (.cutY 20224 (.cutX 6272 (.cutY 20096 .full .full) (.cutY 20096 (.cutX 6336 (.cutY 20032 .full .full) (.cutY 20032 .full .full)) .full)) .empty) .empty)) .empty)) .empty))) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 (.cutX 13312 (.cutY 25600 .empty (.cutX 12800 (.cutY 26112 .empty (.cutX 12544 .empty (.cutY 26368 .empty (.cutX 12672 (.cutY 26496 .full .full) (.cutY 26496 (.cutX 12736 (.cutY 26432 .full .full) (.cutY 26432 .full .full)) .full))))) .empty)) .empty) .empty) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 .empty (.cutX 19456 .empty (.cutY 7168 (.cutX 19968 .empty (.cutY 6656 (.cutX 20224 (.cutY 6400 (.cutX 20096 (.cutY 6272 .full (.cutX 20032 (.cutY 6336 .full .full) (.cutY 6336 .full .full))) (.cutY 6272 .full .full)) .empty) .empty) .empty)) .empty))))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 (.cutX 25600 .empty (.cutY 13312 (.cutX 26112 .empty (.cutY 12800 (.cutX 26368 .empty (.cutY 12544 .empty (.cutX 26496 (.cutY 12672 .full (.cutX 26432 (.cutY 12736 .full .full) (.cutY 12736 .full .full))) (.cutY 12672 .full .full)))) .empty)) .empty)) .empty) .empty)) .empty))) .empty))

theorem metadata93 : 0<177866497 ∧ 24<128 ∧ 78<128 ∧ 0<4 ∧
    2574/4160=0 ∧ 2574%4160=2574 ∧ ∀ i, (leaves93 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData93).mp
    (by decide +kernel)

theorem sourceChecked93_0 : ∀ i : Fin 28,
    (fun i => output93 i = raw93 (source93 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked93 : ∀ i : Fin 28, (fun i => output93 i = raw93 (source93 i)) i :=
  forallFin_of_zero_offset (fun i => output93 i = raw93 (source93 i)) sourceChecked93_0

theorem coverChecked93_0 : ∀ i : Fin 28,
    (fun i => (output93 (cover93 i)).ContainsBox (raw93 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked93 : ∀ i : Fin 28, (fun i => (output93 (cover93 i)).ContainsBox (raw93 i)) i :=
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

noncomputable def phaseMass93 : ℝ := singlePhaseMass (177866497/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw93 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass93_eq : phaseMass93 = (177866497/1638400000000 : ℝ) := by
  unfold phaseMass93
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw93 output93 cover93 source93
    (gridTreeUnionCheck_sound 32768 raw93 output93 cover93 source93 tree93 checked93)
    _ (by norm_num) _, areaUnits93]
  norm_num

-- Frozen phase 5441, atom 912, type 0, source (7,65).
def leavesData94 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves94 : Fin 10 → DyadicLeaf := leavesData94.get
def raw94 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 7 65 leaves94 i
def outputData94 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨1792,1856,16640,16704⟩) (.single ⟨1792,1856,16704,16768⟩)) (.node (.single ⟨1856,1920,16640,16704⟩) (.node (.single ⟨1856,1920,16704,16768⟩) (.single ⟨1792,1920,16768,16896⟩)))) (.node (.node (.single ⟨1920,1984,16640,16704⟩) (.single ⟨1920,1984,16704,16768⟩)) (.node (.single ⟨1984,2048,16640,16704⟩) (.node (.single ⟨1984,2048,16704,16768⟩) (.single ⟨1920,2048,16768,16896⟩))))) (.node (.node (.node (.single ⟨15872,16000,30720,30848⟩) (.single ⟨15872,16000,30848,30976⟩)) (.node (.single ⟨16000,16064,30720,30784⟩) (.node (.single ⟨16000,16064,30784,30848⟩) (.single ⟨16064,16128,30720,30784⟩)))) (.node (.node (.single ⟨16064,16128,30784,30848⟩) (.single ⟨16000,16064,30848,30912⟩)) (.node (.single ⟨16000,16064,30912,30976⟩) (.node (.single ⟨16064,16128,30848,30912⟩) (.single ⟨16064,16128,30912,30976⟩)))))) (.node (.node (.node (.node (.single ⟨16640,16704,1792,1856⟩) (.single ⟨16640,16704,1856,1920⟩)) (.node (.single ⟨16704,16768,1792,1856⟩) (.node (.single ⟨16704,16768,1856,1920⟩) (.single ⟨16640,16704,1920,1984⟩)))) (.node (.node (.single ⟨16640,16704,1984,2048⟩) (.single ⟨16704,16768,1920,1984⟩)) (.node (.single ⟨16704,16768,1984,2048⟩) (.node (.single ⟨16768,16896,1792,1920⟩) (.single ⟨16768,16896,1920,2048⟩))))) (.node (.node (.node (.single ⟨30720,30848,15872,16000⟩) (.single ⟨30720,30784,16000,16064⟩)) (.node (.single ⟨30720,30784,16064,16128⟩) (.node (.single ⟨30784,30848,16000,16064⟩) (.single ⟨30784,30848,16064,16128⟩)))) (.node (.node (.single ⟨30848,30976,15872,16000⟩) (.single ⟨30848,30912,16000,16064⟩)) (.node (.single ⟨30848,30912,16064,16128⟩) (.node (.single ⟨30912,30976,16000,16064⟩) (.single ⟨30912,30976,16064,16128⟩)))))))
def output94 : Fin 40 → GridBox := outputData94.get
def coverData94 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData94 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover94 (i : Fin 40) : Fin 40 := ⟨coverData94.get i % 40, Nat.mod_lt _ (by decide)⟩
def source94 (i : Fin 40) : Fin 40 := ⟨sourceData94.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree94 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 (.cutX 1024 .empty (.cutY 17408 (.cutX 1536 .empty (.cutY 16896 (.cutX 1792 .empty (.cutY 16640 .empty (.cutX 1920 (.cutY 16768 (.cutX 1856 (.cutY 16704 .full .full) (.cutY 16704 .full .full)) .full) (.cutY 16768 (.cutX 1984 (.cutY 16704 .full .full) (.cutY 16704 .full .full)) .full)))) .empty)) .empty)) .empty) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 .empty (.cutX 15360 .empty (.cutY 31744 (.cutX 15872 .empty (.cutY 31232 (.cutX 16128 (.cutY 30976 (.cutX 16000 (.cutY 30848 .full .full) (.cutY 30848 (.cutX 16064 (.cutY 30784 .full .full) (.cutY 30784 .full .full)) (.cutX 16064 (.cutY 30912 .full .full) (.cutY 30912 .full .full)))) .empty) .empty) .empty)) .empty))))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 (.cutX 17408 (.cutY 1024 .empty (.cutX 16896 (.cutY 1536 .empty (.cutX 16640 .empty (.cutY 1792 .empty (.cutX 16768 (.cutY 1920 (.cutX 16704 (.cutY 1856 .full .full) (.cutY 1856 .full .full)) (.cutX 16704 (.cutY 1984 .full .full) (.cutY 1984 .full .full))) (.cutY 1920 .full .full))))) .empty)) .empty) .empty) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 .empty (.cutX 31744 (.cutY 15360 .empty (.cutX 31232 (.cutY 15872 .empty (.cutX 30976 (.cutY 16128 (.cutX 30848 (.cutY 16000 .full (.cutX 30784 (.cutY 16064 .full .full) (.cutY 16064 .full .full))) (.cutY 16000 .full (.cutX 30912 (.cutY 16064 .full .full) (.cutY 16064 .full .full)))) .empty) .empty)) .empty)) .empty))))))) .empty))

theorem metadata94 : 0<114037843 ∧ 7<128 ∧ 65<128 ∧ 0<4 ∧
    912/4160=0 ∧ 912%4160=912 ∧ ∀ i, (leaves94 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData94).mp
    (by decide +kernel)

theorem sourceChecked94_0 : ∀ i : Fin 40,
    (fun i => output94 i = raw94 (source94 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked94 : ∀ i : Fin 40, (fun i => output94 i = raw94 (source94 i)) i :=
  forallFin_of_zero_offset (fun i => output94 i = raw94 (source94 i)) sourceChecked94_0

theorem coverChecked94_0 : ∀ i : Fin 40,
    (fun i => (output94 (cover94 i)).ContainsBox (raw94 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked94 : ∀ i : Fin 40, (fun i => (output94 (cover94 i)).ContainsBox (raw94 i)) i :=
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

noncomputable def phaseMass94 : ℝ := singlePhaseMass (114037843/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw94 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass94_eq : phaseMass94 = (114037843/1638400000000 : ℝ) := by
  unfold phaseMass94
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw94 output94 cover94 source94
    (gridTreeUnionCheck_sound 32768 raw94 output94 cover94 source94 tree94 checked94)
    _ (by norm_num) _, areaUnits94]
  norm_num

-- Frozen phase 5442, atom 1354, type 0, source (11,67).
def leavesData95 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves95 : Fin 10 → DyadicLeaf := leavesData95.get
def raw95 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 11 67 leaves95 i
def outputData95 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨2816,2880,17152,17216⟩) (.single ⟨2816,2880,17216,17280⟩)) (.node (.single ⟨2880,2944,17152,17216⟩) (.node (.single ⟨2880,2944,17216,17280⟩) (.single ⟨2816,2944,17280,17408⟩)))) (.node (.node (.single ⟨2944,3008,17152,17216⟩) (.single ⟨2944,3008,17216,17280⟩)) (.node (.single ⟨3008,3072,17152,17216⟩) (.node (.single ⟨3008,3072,17216,17280⟩) (.single ⟨2944,3072,17280,17408⟩))))) (.node (.node (.node (.single ⟨15360,15488,29696,29824⟩) (.single ⟨15360,15488,29824,29952⟩)) (.node (.single ⟨15488,15552,29696,29760⟩) (.node (.single ⟨15488,15552,29760,29824⟩) (.single ⟨15552,15616,29696,29760⟩)))) (.node (.node (.single ⟨15552,15616,29760,29824⟩) (.single ⟨15488,15552,29824,29888⟩)) (.node (.single ⟨15488,15552,29888,29952⟩) (.node (.single ⟨15552,15616,29824,29888⟩) (.single ⟨15552,15616,29888,29952⟩)))))) (.node (.node (.node (.node (.single ⟨17152,17216,2816,2880⟩) (.single ⟨17152,17216,2880,2944⟩)) (.node (.single ⟨17216,17280,2816,2880⟩) (.node (.single ⟨17216,17280,2880,2944⟩) (.single ⟨17152,17216,2944,3008⟩)))) (.node (.node (.single ⟨17152,17216,3008,3072⟩) (.single ⟨17216,17280,2944,3008⟩)) (.node (.single ⟨17216,17280,3008,3072⟩) (.node (.single ⟨17280,17408,2816,2944⟩) (.single ⟨17280,17408,2944,3072⟩))))) (.node (.node (.node (.single ⟨29696,29824,15360,15488⟩) (.single ⟨29696,29760,15488,15552⟩)) (.node (.single ⟨29696,29760,15552,15616⟩) (.node (.single ⟨29760,29824,15488,15552⟩) (.single ⟨29760,29824,15552,15616⟩)))) (.node (.node (.single ⟨29824,29952,15360,15488⟩) (.single ⟨29824,29888,15488,15552⟩)) (.node (.single ⟨29824,29888,15552,15616⟩) (.node (.single ⟨29888,29952,15488,15552⟩) (.single ⟨29888,29952,15552,15616⟩)))))))
def output95 : Fin 40 → GridBox := outputData95.get
def coverData95 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData95 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover95 (i : Fin 40) : Fin 40 := ⟨coverData95.get i % 40, Nat.mod_lt _ (by decide)⟩
def source95 (i : Fin 40) : Fin 40 := ⟨sourceData95.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree95 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 (.cutX 3072 (.cutY 17408 (.cutX 2560 .empty (.cutY 16896 .empty (.cutX 2816 .empty (.cutY 17152 .empty (.cutX 2944 (.cutY 17280 (.cutX 2880 (.cutY 17216 .full .full) (.cutY 17216 .full .full)) .full) (.cutY 17280 (.cutX 3008 (.cutY 17216 .full .full) (.cutY 17216 .full .full)) .full)))))) .empty) .empty) .empty)) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 (.cutX 15360 .empty (.cutY 29696 .empty (.cutX 15872 (.cutY 30208 (.cutX 15616 (.cutY 29952 (.cutX 15488 (.cutY 29824 .full .full) (.cutY 29824 (.cutX 15552 (.cutY 29760 .full .full) (.cutY 29760 .full .full)) (.cutX 15552 (.cutY 29888 .full .full) (.cutY 29888 .full .full)))) .empty) .empty) .empty) .empty))) .empty))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 .empty (.cutX 17408 (.cutY 3072 (.cutX 16896 .empty (.cutY 2560 .empty (.cutX 17152 .empty (.cutY 2816 .empty (.cutX 17280 (.cutY 2944 (.cutX 17216 (.cutY 2880 .full .full) (.cutY 2880 .full .full)) (.cutX 17216 (.cutY 3008 .full .full) (.cutY 3008 .full .full))) (.cutY 2944 .full .full)))))) .empty) .empty)) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 .empty (.cutX 29696 .empty (.cutY 15360 .empty (.cutX 30208 (.cutY 15872 (.cutX 29952 (.cutY 15616 (.cutX 29824 (.cutY 15488 .full (.cutX 29760 (.cutY 15552 .full .full) (.cutY 15552 .full .full))) (.cutY 15488 .full (.cutX 29888 (.cutY 15552 .full .full) (.cutY 15552 .full .full)))) .empty) .empty) .empty) .empty)))) .empty))))) .empty))

theorem metadata95 : 0<67702166 ∧ 11<128 ∧ 67<128 ∧ 0<4 ∧
    1354/4160=0 ∧ 1354%4160=1354 ∧ ∀ i, (leaves95 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData95).mp
    (by decide +kernel)

theorem sourceChecked95_0 : ∀ i : Fin 40,
    (fun i => output95 i = raw95 (source95 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked95 : ∀ i : Fin 40, (fun i => output95 i = raw95 (source95 i)) i :=
  forallFin_of_zero_offset (fun i => output95 i = raw95 (source95 i)) sourceChecked95_0

theorem coverChecked95_0 : ∀ i : Fin 40,
    (fun i => (output95 (cover95 i)).ContainsBox (raw95 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked95 : ∀ i : Fin 40, (fun i => (output95 (cover95 i)).ContainsBox (raw95 i)) i :=
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

noncomputable def phaseMass95 : ℝ := singlePhaseMass (67702166/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw95 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass95_eq : phaseMass95 = (33851083/819200000000 : ℝ) := by
  unfold phaseMass95
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw95 output95 cover95 source95
    (gridTreeUnionCheck_sound 32768 raw95 output95 cover95 source95 tree95 checked95)
    _ (by norm_num) _, areaUnits95]
  norm_num

-- Frozen phase 5443, atom 5720, type 1, source (13,65).
def leavesData96 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,0⟩))) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves96 : Fin 13 → DyadicLeaf := leavesData96.get
def raw96 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 13 65 leaves96 i
def outputData96 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨3328,3392,16640,16704⟩) (.node (.single ⟨3328,3392,16704,16768⟩) (.single ⟨3392,3456,16640,16704⟩))) (.node (.single ⟨3392,3456,16704,16768⟩) (.node (.single ⟨3328,3456,16768,16896⟩) (.single ⟨3456,3520,16640,16704⟩)))) (.node (.node (.single ⟨3456,3520,16704,16768⟩) (.node (.single ⟨3520,3552,16640,16672⟩) (.single ⟨3520,3552,16672,16704⟩))) (.node (.node (.single ⟨3552,3584,16640,16672⟩) (.single ⟨3552,3584,16672,16704⟩)) (.node (.single ⟨3520,3584,16704,16768⟩) (.single ⟨3456,3584,16768,16896⟩))))) (.node (.node (.node (.single ⟨15872,16000,29184,29312⟩) (.node (.single ⟨15872,16000,29312,29440⟩) (.single ⟨16000,16064,29184,29248⟩))) (.node (.single ⟨16000,16064,29248,29312⟩) (.node (.single ⟨16064,16096,29184,29216⟩) (.single ⟨16064,16096,29216,29248⟩)))) (.node (.node (.single ⟨16096,16128,29184,29216⟩) (.node (.single ⟨16096,16128,29216,29248⟩) (.single ⟨16064,16128,29248,29312⟩))) (.node (.node (.single ⟨16000,16064,29312,29376⟩) (.single ⟨16000,16064,29376,29440⟩)) (.node (.single ⟨16064,16128,29312,29376⟩) (.single ⟨16064,16128,29376,29440⟩)))))) (.node (.node (.node (.node (.single ⟨16640,16704,3328,3392⟩) (.node (.single ⟨16640,16704,3392,3456⟩) (.single ⟨16704,16768,3328,3392⟩))) (.node (.single ⟨16704,16768,3392,3456⟩) (.node (.single ⟨16640,16704,3456,3520⟩) (.single ⟨16640,16672,3520,3552⟩)))) (.node (.node (.single ⟨16640,16672,3552,3584⟩) (.node (.single ⟨16672,16704,3520,3552⟩) (.single ⟨16672,16704,3552,3584⟩))) (.node (.node (.single ⟨16704,16768,3456,3520⟩) (.single ⟨16704,16768,3520,3584⟩)) (.node (.single ⟨16768,16896,3328,3456⟩) (.single ⟨16768,16896,3456,3584⟩))))) (.node (.node (.node (.single ⟨29184,29312,15872,16000⟩) (.node (.single ⟨29184,29248,16000,16064⟩) (.single ⟨29184,29216,16064,16096⟩))) (.node (.single ⟨29184,29216,16096,16128⟩) (.node (.single ⟨29216,29248,16064,16096⟩) (.single ⟨29216,29248,16096,16128⟩)))) (.node (.node (.single ⟨29248,29312,16000,16064⟩) (.node (.single ⟨29248,29312,16064,16128⟩) (.single ⟨29312,29440,15872,16000⟩))) (.node (.node (.single ⟨29312,29376,16000,16064⟩) (.single ⟨29312,29376,16064,16128⟩)) (.node (.single ⟨29376,29440,16000,16064⟩) (.single ⟨29376,29440,16064,16128⟩)))))))
def output96 : Fin 52 → GridBox := outputData96.get
def coverData96 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 0))) (.node (.node (.single 26) (.single 51)) (.node (.single 25) (.single 1))))) (.node (.node (.node (.single 28) (.node (.single 50) (.single 23))) (.node (.single 2) (.node (.single 27) (.single 49)))) (.node (.node (.single 24) (.node (.single 3) (.single 29))) (.node (.node (.single 48) (.single 22)) (.node (.single 5) (.single 30)))))) (.node (.node (.node (.node (.single 46) (.node (.single 21) (.single 6))) (.node (.single 35) (.node (.single 45) (.single 16)))) (.node (.node (.single 11) (.node (.single 36) (.single 40))) (.node (.node (.single 15) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData96 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.single 20) (.node (.single 0) (.single 24)))) (.node (.node (.single 28) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 35))) (.node (.single 31) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.node (.single 17) (.single 13))) (.node (.single 21) (.node (.single 25) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 34) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 30) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover96 (i : Fin 52) : Fin 52 := ⟨coverData96.get i % 52, Nat.mod_lt _ (by decide)⟩
def source96 (i : Fin 52) : Fin 52 := ⟨sourceData96.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree96 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 (.cutX 3072 .empty (.cutY 17408 (.cutX 3584 (.cutY 16896 (.cutX 3328 .empty (.cutY 16640 .empty (.cutX 3456 (.cutY 16768 (.cutX 3392 (.cutY 16704 .full .full) (.cutY 16704 .full .full)) .full) (.cutY 16768 (.cutX 3520 (.cutY 16704 .full .full) (.cutY 16704 (.cutX 3552 (.cutY 16672 .full .full) (.cutY 16672 .full .full)) .full)) .full)))) .empty) .empty) .empty)) .empty)) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 (.cutX 15360 .empty (.cutY 29696 (.cutX 15872 .empty (.cutY 29184 .empty (.cutX 16128 (.cutY 29440 (.cutX 16000 (.cutY 29312 .full .full) (.cutY 29312 (.cutX 16064 (.cutY 29248 .full .full) (.cutY 29248 (.cutX 16096 (.cutY 29216 .full .full) (.cutY 29216 .full .full)) .full)) (.cutX 16064 (.cutY 29376 .full .full) (.cutY 29376 .full .full)))) .empty) .empty))) .empty)) .empty))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 .empty (.cutX 17408 (.cutY 3072 .empty (.cutX 16896 (.cutY 3584 (.cutX 16640 .empty (.cutY 3328 .empty (.cutX 16768 (.cutY 3456 (.cutX 16704 (.cutY 3392 .full .full) (.cutY 3392 .full .full)) (.cutX 16704 (.cutY 3520 .full (.cutX 16672 (.cutY 3552 .full .full) (.cutY 3552 .full .full))) (.cutY 3520 .full .full))) (.cutY 3456 .full .full)))) .empty) .empty)) .empty)) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 .empty (.cutX 29696 (.cutY 15360 .empty (.cutX 29184 .empty (.cutY 15872 .empty (.cutX 29440 (.cutY 16128 (.cutX 29312 (.cutY 16000 .full (.cutX 29248 (.cutY 16064 .full (.cutX 29216 (.cutY 16096 .full .full) (.cutY 16096 .full .full))) (.cutY 16064 .full .full))) (.cutY 16000 .full (.cutX 29376 (.cutY 16064 .full .full) (.cutY 16064 .full .full)))) .empty) .empty)))) .empty)) .empty))))) .empty))

theorem metadata96 : 0<135229957 ∧ 13<128 ∧ 65<128 ∧ 1<4 ∧
    5720/4160=1 ∧ 5720%4160=1560 ∧ ∀ i, (leaves96 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData96).mp
    (by decide +kernel)

theorem sourceChecked96_0 : ∀ i : Fin 52,
    (fun i => output96 i = raw96 (source96 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked96 : ∀ i : Fin 52, (fun i => output96 i = raw96 (source96 i)) i :=
  forallFin_of_zero_offset (fun i => output96 i = raw96 (source96 i)) sourceChecked96_0

theorem coverChecked96_0 : ∀ i : Fin 52,
    (fun i => (output96 (cover96 i)).ContainsBox (raw96 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked96 : ∀ i : Fin 52, (fun i => (output96 (cover96 i)).ContainsBox (raw96 i)) i :=
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

noncomputable def phaseMass96 : ℝ := singlePhaseMass (135229957/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw96 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass96_eq : phaseMass96 = (135229957/1638400000000 : ℝ) := by
  unfold phaseMass96
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw96 output96 cover96 source96
    (gridTreeUnionCheck_sound 32768 raw96 output96 cover96 source96 tree96 checked96)
    _ (by norm_num) _, areaUnits96]
  norm_num

-- Frozen phase 5444, atom 1137, type 0, source (9,66).
def leavesData97 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves97 : Fin 10 → DyadicLeaf := leavesData97.get
def raw97 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 9 66 leaves97 i
def outputData97 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨2304,2368,16896,16960⟩) (.single ⟨2304,2368,16960,17024⟩)) (.node (.single ⟨2368,2432,16896,16960⟩) (.node (.single ⟨2368,2432,16960,17024⟩) (.single ⟨2304,2432,17024,17152⟩)))) (.node (.node (.single ⟨2432,2496,16896,16960⟩) (.single ⟨2432,2496,16960,17024⟩)) (.node (.single ⟨2496,2560,16896,16960⟩) (.node (.single ⟨2496,2560,16960,17024⟩) (.single ⟨2432,2560,17024,17152⟩))))) (.node (.node (.node (.single ⟨15616,15744,30208,30336⟩) (.single ⟨15616,15744,30336,30464⟩)) (.node (.single ⟨15744,15808,30208,30272⟩) (.node (.single ⟨15744,15808,30272,30336⟩) (.single ⟨15808,15872,30208,30272⟩)))) (.node (.node (.single ⟨15808,15872,30272,30336⟩) (.single ⟨15744,15808,30336,30400⟩)) (.node (.single ⟨15744,15808,30400,30464⟩) (.node (.single ⟨15808,15872,30336,30400⟩) (.single ⟨15808,15872,30400,30464⟩)))))) (.node (.node (.node (.node (.single ⟨16896,16960,2304,2368⟩) (.single ⟨16896,16960,2368,2432⟩)) (.node (.single ⟨16960,17024,2304,2368⟩) (.node (.single ⟨16960,17024,2368,2432⟩) (.single ⟨16896,16960,2432,2496⟩)))) (.node (.node (.single ⟨16896,16960,2496,2560⟩) (.single ⟨16960,17024,2432,2496⟩)) (.node (.single ⟨16960,17024,2496,2560⟩) (.node (.single ⟨17024,17152,2304,2432⟩) (.single ⟨17024,17152,2432,2560⟩))))) (.node (.node (.node (.single ⟨30208,30336,15616,15744⟩) (.single ⟨30208,30272,15744,15808⟩)) (.node (.single ⟨30208,30272,15808,15872⟩) (.node (.single ⟨30272,30336,15744,15808⟩) (.single ⟨30272,30336,15808,15872⟩)))) (.node (.node (.single ⟨30336,30464,15616,15744⟩) (.single ⟨30336,30400,15744,15808⟩)) (.node (.single ⟨30336,30400,15808,15872⟩) (.node (.single ⟨30400,30464,15744,15808⟩) (.single ⟨30400,30464,15808,15872⟩)))))))
def output97 : Fin 40 → GridBox := outputData97.get
def coverData97 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData97 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover97 (i : Fin 40) : Fin 40 := ⟨coverData97.get i % 40, Nat.mod_lt _ (by decide)⟩
def source97 (i : Fin 40) : Fin 40 := ⟨sourceData97.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree97 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 (.cutX 3072 (.cutY 17408 (.cutX 2560 (.cutY 16896 .empty (.cutX 2304 .empty (.cutY 17152 (.cutX 2432 (.cutY 17024 (.cutX 2368 (.cutY 16960 .full .full) (.cutY 16960 .full .full)) .full) (.cutY 17024 (.cutX 2496 (.cutY 16960 .full .full) (.cutY 16960 .full .full)) .full)) .empty))) .empty) .empty) .empty) .empty)) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 (.cutX 15360 .empty (.cutY 29696 .empty (.cutX 15872 (.cutY 30208 .empty (.cutX 15616 .empty (.cutY 30464 (.cutX 15744 (.cutY 30336 .full .full) (.cutY 30336 (.cutX 15808 (.cutY 30272 .full .full) (.cutY 30272 .full .full)) (.cutX 15808 (.cutY 30400 .full .full) (.cutY 30400 .full .full)))) .empty))) .empty))) .empty))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 .empty (.cutX 17408 (.cutY 3072 (.cutX 16896 .empty (.cutY 2560 (.cutX 17152 (.cutY 2304 .empty (.cutX 17024 (.cutY 2432 (.cutX 16960 (.cutY 2368 .full .full) (.cutY 2368 .full .full)) (.cutX 16960 (.cutY 2496 .full .full) (.cutY 2496 .full .full))) (.cutY 2432 .full .full))) .empty) .empty)) .empty) .empty)) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 .empty (.cutX 29696 .empty (.cutY 15360 .empty (.cutX 30208 .empty (.cutY 15872 (.cutX 30464 (.cutY 15616 .empty (.cutX 30336 (.cutY 15744 .full (.cutX 30272 (.cutY 15808 .full .full) (.cutY 15808 .full .full))) (.cutY 15744 .full (.cutX 30400 (.cutY 15808 .full .full) (.cutY 15808 .full .full))))) .empty) .empty))))) .empty))))) .empty))

theorem metadata97 : 0<67702166 ∧ 9<128 ∧ 66<128 ∧ 0<4 ∧
    1137/4160=0 ∧ 1137%4160=1137 ∧ ∀ i, (leaves97 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData97).mp
    (by decide +kernel)

theorem sourceChecked97_0 : ∀ i : Fin 40,
    (fun i => output97 i = raw97 (source97 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked97 : ∀ i : Fin 40, (fun i => output97 i = raw97 (source97 i)) i :=
  forallFin_of_zero_offset (fun i => output97 i = raw97 (source97 i)) sourceChecked97_0

theorem coverChecked97_0 : ∀ i : Fin 40,
    (fun i => (output97 (cover97 i)).ContainsBox (raw97 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked97 : ∀ i : Fin 40, (fun i => (output97 (cover97 i)).ContainsBox (raw97 i)) i :=
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

noncomputable def phaseMass97 : ℝ := singlePhaseMass (67702166/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw97 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass97_eq : phaseMass97 = (33851083/819200000000 : ℝ) := by
  unfold phaseMass97
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw97 output97 cover97 source97
    (gridTreeUnionCheck_sound 32768 raw97 output97 cover97 source97 tree97 checked97)
    _ (by norm_num) _, areaUnits97]
  norm_num

-- Frozen phase 5445, atom 5294, type 1, source (9,63).
def leavesData98 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,0⟩))) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves98 : Fin 13 → DyadicLeaf := leavesData98.get
def raw98 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 9 63 leaves98 i
def outputData98 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨2304,2368,16128,16192⟩) (.node (.single ⟨2304,2368,16192,16256⟩) (.single ⟨2368,2432,16128,16192⟩))) (.node (.single ⟨2368,2432,16192,16256⟩) (.node (.single ⟨2304,2432,16256,16384⟩) (.single ⟨2432,2496,16128,16192⟩)))) (.node (.node (.single ⟨2432,2496,16192,16256⟩) (.node (.single ⟨2496,2528,16128,16160⟩) (.single ⟨2496,2528,16160,16192⟩))) (.node (.node (.single ⟨2528,2560,16128,16160⟩) (.single ⟨2528,2560,16160,16192⟩)) (.node (.single ⟨2496,2560,16192,16256⟩) (.single ⟨2432,2560,16256,16384⟩))))) (.node (.node (.node (.single ⟨16128,16192,2304,2368⟩) (.node (.single ⟨16128,16192,2368,2432⟩) (.single ⟨16192,16256,2304,2368⟩))) (.node (.single ⟨16192,16256,2368,2432⟩) (.node (.single ⟨16128,16192,2432,2496⟩) (.single ⟨16128,16160,2496,2528⟩)))) (.node (.node (.single ⟨16128,16160,2528,2560⟩) (.node (.single ⟨16160,16192,2496,2528⟩) (.single ⟨16160,16192,2528,2560⟩))) (.node (.node (.single ⟨16192,16256,2432,2496⟩) (.single ⟨16192,16256,2496,2560⟩)) (.node (.single ⟨16256,16384,2304,2432⟩) (.single ⟨16256,16384,2432,2560⟩)))))) (.node (.node (.node (.node (.single ⟨16384,16512,30208,30336⟩) (.node (.single ⟨16384,16512,30336,30464⟩) (.single ⟨16512,16576,30208,30272⟩))) (.node (.single ⟨16512,16576,30272,30336⟩) (.node (.single ⟨16576,16608,30208,30240⟩) (.single ⟨16576,16608,30240,30272⟩)))) (.node (.node (.single ⟨16608,16640,30208,30240⟩) (.node (.single ⟨16608,16640,30240,30272⟩) (.single ⟨16576,16640,30272,30336⟩))) (.node (.node (.single ⟨16512,16576,30336,30400⟩) (.single ⟨16512,16576,30400,30464⟩)) (.node (.single ⟨16576,16640,30336,30400⟩) (.single ⟨16576,16640,30400,30464⟩))))) (.node (.node (.node (.single ⟨30208,30336,16384,16512⟩) (.node (.single ⟨30208,30272,16512,16576⟩) (.single ⟨30208,30240,16576,16608⟩))) (.node (.single ⟨30208,30240,16608,16640⟩) (.node (.single ⟨30240,30272,16576,16608⟩) (.single ⟨30240,30272,16608,16640⟩)))) (.node (.node (.single ⟨30272,30336,16512,16576⟩) (.node (.single ⟨30272,30336,16576,16640⟩) (.single ⟨30336,30464,16384,16512⟩))) (.node (.node (.single ⟨30336,30400,16512,16576⟩) (.single ⟨30336,30400,16576,16640⟩)) (.node (.single ⟨30400,30464,16512,16576⟩) (.single ⟨30400,30464,16576,16640⟩)))))))
def output98 : Fin 52 → GridBox := outputData98.get
def coverData98 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 24) (.single 47))) (.node (.single 27) (.node (.single 12) (.single 25)))) (.node (.node (.single 39) (.node (.single 26) (.single 0))) (.node (.node (.single 13) (.single 51)) (.node (.single 38) (.single 1))))) (.node (.node (.node (.single 15) (.node (.single 50) (.single 36))) (.node (.single 2) (.node (.single 14) (.single 49)))) (.node (.node (.single 37) (.node (.single 3) (.single 16))) (.node (.node (.single 48) (.single 35)) (.node (.single 5) (.single 17)))))) (.node (.node (.node (.node (.single 46) (.node (.single 34) (.single 6))) (.node (.single 22) (.node (.single 45) (.single 29)))) (.node (.node (.single 11) (.node (.single 23) (.single 40))) (.node (.node (.single 28) (.single 7)) (.node (.single 18) (.single 44))))) (.node (.node (.node (.single 33) (.node (.single 8) (.single 20))) (.node (.single 43) (.node (.single 31) (.single 9)))) (.node (.node (.single 19) (.node (.single 42) (.single 32))) (.node (.node (.single 10) (.single 21)) (.node (.single 41) (.single 30)))))))
def sourceData98 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.single 20) (.node (.single 0) (.single 24)))) (.node (.node (.single 28) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.single 9) (.node (.single 17) (.single 13))) (.node (.single 21) (.node (.single 25) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.single 7) (.node (.single 3) (.single 35))) (.node (.single 31) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11))))) (.node (.node (.node (.single 6) (.node (.single 34) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 30) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover98 (i : Fin 52) : Fin 52 := ⟨coverData98.get i % 52, Nat.mod_lt _ (by decide)⟩
def source98 (i : Fin 52) : Fin 52 := ⟨sourceData98.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree98 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 .empty (.cutX 3072 (.cutY 15360 .empty (.cutX 2560 (.cutY 15872 .empty (.cutX 2304 .empty (.cutY 16128 .empty (.cutX 2432 (.cutY 16256 (.cutX 2368 (.cutY 16192 .full .full) (.cutY 16192 .full .full)) .full) (.cutY 16256 (.cutX 2496 (.cutY 16192 .full .full) (.cutY 16192 (.cutX 2528 (.cutY 16160 .full .full) (.cutY 16160 .full .full)) .full)) .full))))) .empty)) .empty)))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 .empty (.cutX 15360 .empty (.cutY 3072 (.cutX 15872 .empty (.cutY 2560 (.cutX 16128 .empty (.cutY 2304 .empty (.cutX 16256 (.cutY 2432 (.cutX 16192 (.cutY 2368 .full .full) (.cutY 2368 .full .full)) (.cutX 16192 (.cutY 2496 .full (.cutX 16160 (.cutY 2528 .full .full) (.cutY 2528 .full .full))) (.cutY 2496 .full .full))) (.cutY 2432 .full .full)))) .empty)) .empty)))) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 (.cutX 17408 (.cutY 29696 .empty (.cutX 16896 (.cutY 30208 .empty (.cutX 16640 (.cutY 30464 (.cutX 16512 (.cutY 30336 .full .full) (.cutY 30336 (.cutX 16576 (.cutY 30272 .full .full) (.cutY 30272 (.cutX 16608 (.cutY 30240 .full .full) (.cutY 30240 .full .full)) .full)) (.cutX 16576 (.cutY 30400 .full .full) (.cutY 30400 .full .full)))) .empty) .empty)) .empty)) .empty) .empty) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 (.cutX 29696 .empty (.cutY 17408 (.cutX 30208 .empty (.cutY 16896 (.cutX 30464 (.cutY 16640 (.cutX 30336 (.cutY 16512 .full (.cutX 30272 (.cutY 16576 .full (.cutX 30240 (.cutY 16608 .full .full) (.cutY 16608 .full .full))) (.cutY 16576 .full .full))) (.cutY 16512 .full (.cutX 30400 (.cutY 16576 .full .full) (.cutY 16576 .full .full)))) .empty) .empty) .empty)) .empty)) .empty) .empty) .empty)) .empty))))

theorem metadata98 : 0<163200014 ∧ 9<128 ∧ 63<128 ∧ 1<4 ∧
    5294/4160=1 ∧ 5294%4160=1134 ∧ ∀ i, (leaves98 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData98).mp
    (by decide +kernel)

theorem sourceChecked98_0 : ∀ i : Fin 52,
    (fun i => output98 i = raw98 (source98 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked98 : ∀ i : Fin 52, (fun i => output98 i = raw98 (source98 i)) i :=
  forallFin_of_zero_offset (fun i => output98 i = raw98 (source98 i)) sourceChecked98_0

theorem coverChecked98_0 : ∀ i : Fin 52,
    (fun i => (output98 (cover98 i)).ContainsBox (raw98 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked98 : ∀ i : Fin 52, (fun i => (output98 (cover98 i)).ContainsBox (raw98 i)) i :=
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

noncomputable def phaseMass98 : ℝ := singlePhaseMass (163200014/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw98 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass98_eq : phaseMass98 = (81600007/819200000000 : ℝ) := by
  unfold phaseMass98
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw98 output98 cover98 source98
    (gridTreeUnionCheck_sound 32768 raw98 output98 cover98 source98 tree98 checked98)
    _ (by norm_num) _, areaUnits98]
  norm_num

noncomputable def batchActualMass : ℝ := [phaseMass0,phaseMass1,phaseMass2,phaseMass3,phaseMass4,phaseMass5,phaseMass6,phaseMass7,phaseMass8,phaseMass9,phaseMass10,phaseMass11,phaseMass12,phaseMass13,phaseMass14,phaseMass15,phaseMass16,phaseMass17,phaseMass18,phaseMass19,phaseMass20,phaseMass21,phaseMass22,phaseMass23,phaseMass24,phaseMass25,phaseMass26,phaseMass27,phaseMass28,phaseMass29,phaseMass30,phaseMass31,phaseMass32,phaseMass33,phaseMass34,phaseMass35,phaseMass36,phaseMass37,phaseMass38,phaseMass39,phaseMass40,phaseMass41,phaseMass42,phaseMass43,phaseMass44,phaseMass45,phaseMass46,phaseMass47,phaseMass48,phaseMass49,phaseMass50,phaseMass51,phaseMass52,phaseMass53,phaseMass54,phaseMass55,phaseMass56,phaseMass57,phaseMass58,phaseMass59,phaseMass60,phaseMass61,phaseMass62,phaseMass63,phaseMass64,phaseMass65,phaseMass66,phaseMass67,phaseMass68,phaseMass69,phaseMass70,phaseMass71,phaseMass72,phaseMass73,phaseMass74,phaseMass75,phaseMass76,phaseMass77,phaseMass78,phaseMass79,phaseMass80,phaseMass81,phaseMass82,phaseMass83,phaseMass84,phaseMass85,phaseMass86,phaseMass87,phaseMass88,phaseMass89,phaseMass90,phaseMass91,phaseMass92,phaseMass93,phaseMass94,phaseMass95,phaseMass96,phaseMass97,phaseMass98].sum

theorem actual_batch_mass : batchActualMass = (6746964364473/838860800000000 : ℝ) := by
  unfold batchActualMass
  rw [phaseMass0_eq,phaseMass1_eq,phaseMass2_eq,phaseMass3_eq,phaseMass4_eq,phaseMass5_eq,phaseMass6_eq,phaseMass7_eq,phaseMass8_eq,phaseMass9_eq,phaseMass10_eq,phaseMass11_eq,phaseMass12_eq,phaseMass13_eq,phaseMass14_eq,phaseMass15_eq,phaseMass16_eq,phaseMass17_eq,phaseMass18_eq,phaseMass19_eq,phaseMass20_eq,phaseMass21_eq,phaseMass22_eq,phaseMass23_eq,phaseMass24_eq,phaseMass25_eq,phaseMass26_eq,phaseMass27_eq,phaseMass28_eq,phaseMass29_eq,phaseMass30_eq,phaseMass31_eq,phaseMass32_eq,phaseMass33_eq,phaseMass34_eq,phaseMass35_eq,phaseMass36_eq,phaseMass37_eq,phaseMass38_eq,phaseMass39_eq,phaseMass40_eq,phaseMass41_eq,phaseMass42_eq,phaseMass43_eq,phaseMass44_eq,phaseMass45_eq,phaseMass46_eq,phaseMass47_eq,phaseMass48_eq,phaseMass49_eq,phaseMass50_eq,phaseMass51_eq,phaseMass52_eq,phaseMass53_eq,phaseMass54_eq,phaseMass55_eq,phaseMass56_eq,phaseMass57_eq,phaseMass58_eq,phaseMass59_eq,phaseMass60_eq,phaseMass61_eq,phaseMass62_eq,phaseMass63_eq,phaseMass64_eq,phaseMass65_eq,phaseMass66_eq,phaseMass67_eq,phaseMass68_eq,phaseMass69_eq,phaseMass70_eq,phaseMass71_eq,phaseMass72_eq,phaseMass73_eq,phaseMass74_eq,phaseMass75_eq,phaseMass76_eq,phaseMass77_eq,phaseMass78_eq,phaseMass79_eq,phaseMass80_eq,phaseMass81_eq,phaseMass82_eq,phaseMass83_eq,phaseMass84_eq,phaseMass85_eq,phaseMass86_eq,phaseMass87_eq,phaseMass88_eq,phaseMass89_eq,phaseMass90_eq,phaseMass91_eq,phaseMass92_eq,phaseMass93_eq,phaseMass94_eq,phaseMass95_eq,phaseMass96_eq,phaseMass97_eq,phaseMass98_eq]
  norm_num

end NoThreeLine.ScheduleUnionBatch05347
#print axioms NoThreeLine.ScheduleUnionBatch05347.actual_batch_mass
