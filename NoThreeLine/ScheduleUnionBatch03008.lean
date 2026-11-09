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
namespace NoThreeLine.ScheduleUnionBatch03008

-- Frozen phase 3008, atom 3373, type 0, source (36,61).
def leavesData0 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves0 : Fin 1 → DyadicLeaf := leavesData0.get
def raw0 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 36 61 leaves0 i
def outputData0 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨9216,9472,15616,15872⟩) (.single ⟨15616,15872,9216,9472⟩)) (.node (.single ⟨16896,17152,23296,23552⟩) (.single ⟨23296,23552,16896,17152⟩)))
def output0 : Fin 4 → GridBox := outputData0.get
def coverData0 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData0 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover0 (i : Fin 4) : Fin 4 := ⟨coverData0.get i % 4, Nat.mod_lt _ (by decide)⟩
def source0 (i : Fin 4) : Fin 4 := ⟨sourceData0.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree0 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 (.cutY 14336 .empty (.cutX 9216 .empty (.cutY 15360 .empty (.cutX 9728 (.cutY 15872 (.cutX 9472 (.cutY 15616 .empty .full) .empty) .empty) .empty)))) .empty)) (.cutY 12288 (.cutX 14336 .empty (.cutY 10240 (.cutX 15360 .empty (.cutY 9216 .empty (.cutX 15872 (.cutY 9728 (.cutX 15616 .empty (.cutY 9472 .full .empty)) .empty) .empty))) .empty)) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 (.cutY 22528 .empty (.cutX 17408 (.cutY 23552 (.cutX 16896 .empty (.cutY 23040 .empty (.cutX 17152 (.cutY 23296 .empty .full) .empty))) .empty) .empty)) .empty)) (.cutY 20480 (.cutX 22528 .empty (.cutY 18432 (.cutX 23552 (.cutY 17408 (.cutX 23040 .empty (.cutY 16896 .empty (.cutX 23296 .empty (.cutY 17152 .full .empty)))) .empty) .empty) .empty)) .empty)) .empty) .empty)))

theorem metadata0 : 0<200205545 ∧ 36<128 ∧ 61<128 ∧ 0<4 ∧
    3373/4160=0 ∧ 3373%4160=3373 ∧ ∀ i, (leaves0 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData0).mp
    (by decide +kernel)

theorem sourceChecked0_0 : ∀ i : Fin 4,
    (fun i => output0 i = raw0 (source0 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked0 : ∀ i : Fin 4, (fun i => output0 i = raw0 (source0 i)) i :=
  forallFin_of_zero_offset (fun i => output0 i = raw0 (source0 i)) sourceChecked0_0

theorem coverChecked0_0 : ∀ i : Fin 4,
    (fun i => (output0 (cover0 i)).ContainsBox (raw0 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked0 : ∀ i : Fin 4, (fun i => (output0 (cover0 i)).ContainsBox (raw0 i)) i :=
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

noncomputable def phaseMass0 : ℝ := singlePhaseMass (200205545/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw0 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass0_eq : phaseMass0 = (40041109/327680000000 : ℝ) := by
  unfold phaseMass0
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw0 output0 cover0 source0
    (gridTreeUnionCheck_sound 32768 raw0 output0 cover0 source0 tree0 checked0)
    _ (by norm_num) _, areaUnits0]
  norm_num

-- Frozen phase 3009, atom 7471, type 1, source (35,56).
def leavesData1 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves1 : Fin 7 → DyadicLeaf := leavesData1.get
def raw1 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 35 56 leaves1 i
def outputData1 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨8960,9088,14336,14464⟩) (.node (.single ⟨8960,9088,14464,14592⟩) (.single ⟨9088,9152,14336,14400⟩))) (.node (.node (.single ⟨9088,9152,14400,14464⟩) (.single ⟨9152,9216,14336,14400⟩)) (.node (.single ⟨9152,9216,14400,14464⟩) (.single ⟨9088,9216,14464,14592⟩)))) (.node (.node (.single ⟨14336,14464,8960,9088⟩) (.node (.single ⟨14336,14400,9088,9152⟩) (.single ⟨14336,14400,9152,9216⟩))) (.node (.node (.single ⟨14400,14464,9088,9152⟩) (.single ⟨14400,14464,9152,9216⟩)) (.node (.single ⟨14464,14592,8960,9088⟩) (.single ⟨14464,14592,9088,9216⟩))))) (.node (.node (.node (.single ⟨18176,18304,23552,23680⟩) (.node (.single ⟨18176,18304,23680,23808⟩) (.single ⟨18304,18368,23552,23616⟩))) (.node (.node (.single ⟨18304,18368,23616,23680⟩) (.single ⟨18368,18432,23552,23616⟩)) (.node (.single ⟨18368,18432,23616,23680⟩) (.single ⟨18304,18432,23680,23808⟩)))) (.node (.node (.single ⟨23552,23680,18176,18304⟩) (.node (.single ⟨23552,23616,18304,18368⟩) (.single ⟨23552,23616,18368,18432⟩))) (.node (.node (.single ⟨23616,23680,18304,18368⟩) (.single ⟨23616,23680,18368,18432⟩)) (.node (.single ⟨23680,23808,18176,18304⟩) (.single ⟨23680,23808,18304,18432⟩))))))
def output1 : Fin 28 → GridBox := outputData1.get
def coverData1 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData1 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover1 (i : Fin 28) : Fin 28 := ⟨coverData1.get i % 28, Nat.mod_lt _ (by decide)⟩
def source1 (i : Fin 28) : Fin 28 := ⟨sourceData1.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree1 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 (.cutY 14336 .empty (.cutX 9216 (.cutY 15360 (.cutX 8704 .empty (.cutY 14848 (.cutX 8960 .empty (.cutY 14592 (.cutX 9088 (.cutY 14464 .full .full) (.cutY 14464 (.cutX 9152 (.cutY 14400 .full .full) (.cutY 14400 .full .full)) .full)) .empty)) .empty)) .empty) .empty)) .empty)) (.cutY 12288 (.cutX 14336 .empty (.cutY 10240 (.cutX 15360 (.cutY 9216 (.cutX 14848 (.cutY 8704 .empty (.cutX 14592 (.cutY 8960 .empty (.cutX 14464 (.cutY 9088 .full (.cutX 14400 (.cutY 9152 .full .full) (.cutY 9152 .full .full))) (.cutY 9088 .full .full))) .empty)) .empty) .empty) .empty) .empty)) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 (.cutY 22528 .empty (.cutX 17408 .empty (.cutY 23552 .empty (.cutX 17920 .empty (.cutY 24064 (.cutX 18176 .empty (.cutY 23808 (.cutX 18304 (.cutY 23680 .full .full) (.cutY 23680 (.cutX 18368 (.cutY 23616 .full .full) (.cutY 23616 .full .full)) .full)) .empty)) .empty))))) .empty)) (.cutY 20480 (.cutX 22528 .empty (.cutY 18432 (.cutX 23552 .empty (.cutY 17408 .empty (.cutX 24064 (.cutY 17920 .empty (.cutX 23808 (.cutY 18176 .empty (.cutX 23680 (.cutY 18304 .full (.cutX 23616 (.cutY 18368 .full .full) (.cutY 18368 .full .full))) (.cutY 18304 .full .full))) .empty)) .empty))) .empty)) .empty)) .empty) .empty)))

theorem metadata1 : 0<168966520 ∧ 35<128 ∧ 56<128 ∧ 1<4 ∧
    7471/4160=1 ∧ 7471%4160=3311 ∧ ∀ i, (leaves1 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData1).mp
    (by decide +kernel)

theorem sourceChecked1_0 : ∀ i : Fin 28,
    (fun i => output1 i = raw1 (source1 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked1 : ∀ i : Fin 28, (fun i => output1 i = raw1 (source1 i)) i :=
  forallFin_of_zero_offset (fun i => output1 i = raw1 (source1 i)) sourceChecked1_0

theorem coverChecked1_0 : ∀ i : Fin 28,
    (fun i => (output1 (cover1 i)).ContainsBox (raw1 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked1 : ∀ i : Fin 28, (fun i => (output1 (cover1 i)).ContainsBox (raw1 i)) i :=
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

noncomputable def phaseMass1 : ℝ := singlePhaseMass (168966520/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw1 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass1_eq : phaseMass1 = (4224163/40960000000 : ℝ) := by
  unfold phaseMass1
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw1 output1 cover1 source1
    (gridTreeUnionCheck_sound 32768 raw1 output1 cover1 source1 tree1 checked1)
    _ (by norm_num) _, areaUnits1]
  norm_num

-- Frozen phase 3010, atom 4694, type 1, source (4,38).
def leavesData2 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves2 : Fin 4 → DyadicLeaf := leavesData2.get
def raw2 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 4 38 leaves2 i
def outputData2 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨1024,1152,9728,9856⟩) (.single ⟨1024,1152,9856,9984⟩)) (.node (.single ⟨1152,1280,9728,9856⟩) (.single ⟨1152,1280,9856,9984⟩))) (.node (.node (.single ⟨9728,9856,1024,1152⟩) (.single ⟨9728,9856,1152,1280⟩)) (.node (.single ⟨9856,9984,1024,1152⟩) (.single ⟨9856,9984,1152,1280⟩)))) (.node (.node (.node (.single ⟨22784,22912,31488,31616⟩) (.single ⟨22784,22912,31616,31744⟩)) (.node (.single ⟨22912,23040,31488,31616⟩) (.single ⟨22912,23040,31616,31744⟩))) (.node (.node (.single ⟨31488,31616,22784,22912⟩) (.single ⟨31488,31616,22912,23040⟩)) (.node (.single ⟨31616,31744,22784,22912⟩) (.single ⟨31616,31744,22912,23040⟩)))))
def output2 : Fin 16 → GridBox := outputData2.get
def coverData2 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData2 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover2 (i : Fin 16) : Fin 16 := ⟨coverData2.get i % 16, Nat.mod_lt _ (by decide)⟩
def source2 (i : Fin 16) : Fin 16 := ⟨sourceData2.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree2 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 (.cutY 10240 (.cutX 1024 .empty (.cutY 9216 .empty (.cutX 1536 (.cutY 9728 .empty (.cutX 1280 (.cutY 9984 (.cutX 1152 (.cutY 9856 .full .full) (.cutY 9856 .full .full)) .empty) .empty)) .empty))) .empty) .empty) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 (.cutX 9216 .empty (.cutY 1024 .empty (.cutX 9728 .empty (.cutY 1536 (.cutX 9984 (.cutY 1280 (.cutX 9856 (.cutY 1152 .full .full) (.cutY 1152 .full .full)) .empty) .empty) .empty)))) .empty) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 .empty (.cutX 23552 (.cutY 31744 (.cutX 23040 (.cutY 31232 .empty (.cutX 22784 .empty (.cutY 31488 .empty (.cutX 22912 (.cutY 31616 .full .full) (.cutY 31616 .full .full))))) .empty) .empty) .empty)))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 .empty (.cutY 22528 .empty (.cutX 31744 (.cutY 23552 (.cutX 31232 .empty (.cutY 23040 (.cutX 31488 .empty (.cutY 22784 .empty (.cutX 31616 (.cutY 22912 .full .full) (.cutY 22912 .full .full)))) .empty)) .empty) .empty))))) .empty))))

theorem metadata2 : 0<475523442 ∧ 4<128 ∧ 38<128 ∧ 1<4 ∧
    4694/4160=1 ∧ 4694%4160=534 ∧ ∀ i, (leaves2 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData2).mp
    (by decide +kernel)

theorem sourceChecked2_0 : ∀ i : Fin 16,
    (fun i => output2 i = raw2 (source2 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked2 : ∀ i : Fin 16, (fun i => output2 i = raw2 (source2 i)) i :=
  forallFin_of_zero_offset (fun i => output2 i = raw2 (source2 i)) sourceChecked2_0

theorem coverChecked2_0 : ∀ i : Fin 16,
    (fun i => (output2 (cover2 i)).ContainsBox (raw2 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked2 : ∀ i : Fin 16, (fun i => (output2 (cover2 i)).ContainsBox (raw2 i)) i :=
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

noncomputable def phaseMass2 : ℝ := singlePhaseMass (475523442/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw2 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass2_eq : phaseMass2 = (237761721/819200000000 : ℝ) := by
  unfold phaseMass2
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw2 output2 cover2 source2
    (gridTreeUnionCheck_sound 32768 raw2 output2 cover2 source2 tree2 checked2)
    _ (by norm_num) _, areaUnits2]
  norm_num

-- Frozen phase 3011, atom 656, type 0, source (5,41).
def leavesData3 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves3 : Fin 1 → DyadicLeaf := leavesData3.get
def raw3 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 5 41 leaves3 i
def outputData3 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨1280,1536,10496,10752⟩) (.single ⟨10496,10752,1280,1536⟩)) (.node (.single ⟨22016,22272,31232,31488⟩) (.single ⟨31232,31488,22016,22272⟩)))
def output3 : Fin 4 → GridBox := outputData3.get
def coverData3 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData3 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover3 (i : Fin 4) : Fin 4 := ⟨coverData3.get i % 4, Nat.mod_lt _ (by decide)⟩
def source3 (i : Fin 4) : Fin 4 := ⟨sourceData3.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree3 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 (.cutY 10240 .empty (.cutX 1024 .empty (.cutY 11264 (.cutX 1536 (.cutY 10752 (.cutX 1280 .empty (.cutY 10496 .empty .full)) .empty) .empty) .empty))) .empty) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 .empty (.cutY 2048 (.cutX 11264 (.cutY 1024 .empty (.cutX 10752 (.cutY 1536 (.cutX 10496 .empty (.cutY 1280 .empty .full)) .empty) .empty)) .empty) .empty)) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 (.cutY 30720 .empty (.cutX 21504 .empty (.cutY 31744 (.cutX 22016 .empty (.cutY 31232 .empty (.cutX 22272 (.cutY 31488 .full .empty) .empty))) .empty))) .empty)))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 .empty (.cutY 22528 (.cutX 31744 (.cutY 21504 .empty (.cutX 31232 .empty (.cutY 22016 .empty (.cutX 31488 (.cutY 22272 .full .empty) .empty)))) .empty) .empty)))) .empty))))

theorem metadata3 : 0<374268468 ∧ 5<128 ∧ 41<128 ∧ 0<4 ∧
    656/4160=0 ∧ 656%4160=656 ∧ ∀ i, (leaves3 i).Valid 8 := by
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

noncomputable def phaseMass3 : ℝ := singlePhaseMass (374268468/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw3 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass3_eq : phaseMass3 = (93567117/409600000000 : ℝ) := by
  unfold phaseMass3
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw3 output3 cover3 source3
    (gridTreeUnionCheck_sound 32768 raw3 output3 cover3 source3 tree3 checked3)
    _ (by norm_num) _, areaUnits3]
  norm_num

-- Frozen phase 3012, atom 5992, type 1, source (16,40).
def leavesData4 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves4 : Fin 13 → DyadicLeaf := leavesData4.get
def raw4 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 16 40 leaves4 i
def outputData4 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨4096,4160,10240,10304⟩) (.node (.single ⟨4096,4160,10304,10368⟩) (.single ⟨4160,4224,10240,10304⟩))) (.node (.single ⟨4160,4224,10304,10368⟩) (.node (.single ⟨4096,4224,10368,10496⟩) (.single ⟨4224,4288,10240,10304⟩)))) (.node (.node (.single ⟨4224,4288,10304,10368⟩) (.node (.single ⟨4288,4320,10240,10272⟩) (.single ⟨4288,4320,10272,10304⟩))) (.node (.node (.single ⟨4320,4352,10240,10272⟩) (.single ⟨4320,4352,10272,10304⟩)) (.node (.single ⟨4288,4352,10304,10368⟩) (.single ⟨4224,4352,10368,10496⟩))))) (.node (.node (.node (.single ⟨10240,10304,4096,4160⟩) (.node (.single ⟨10240,10304,4160,4224⟩) (.single ⟨10304,10368,4096,4160⟩))) (.node (.single ⟨10304,10368,4160,4224⟩) (.node (.single ⟨10240,10304,4224,4288⟩) (.single ⟨10240,10272,4288,4320⟩)))) (.node (.node (.single ⟨10240,10272,4320,4352⟩) (.node (.single ⟨10272,10304,4288,4320⟩) (.single ⟨10272,10304,4320,4352⟩))) (.node (.node (.single ⟨10304,10368,4224,4288⟩) (.single ⟨10304,10368,4288,4352⟩)) (.node (.single ⟨10368,10496,4096,4224⟩) (.single ⟨10368,10496,4224,4352⟩)))))) (.node (.node (.node (.node (.single ⟨22272,22400,28416,28544⟩) (.node (.single ⟨22272,22400,28544,28672⟩) (.single ⟨22400,22464,28416,28480⟩))) (.node (.single ⟨22400,22464,28480,28544⟩) (.node (.single ⟨22464,22496,28416,28448⟩) (.single ⟨22464,22496,28448,28480⟩)))) (.node (.node (.single ⟨22496,22528,28416,28448⟩) (.node (.single ⟨22496,22528,28448,28480⟩) (.single ⟨22464,22528,28480,28544⟩))) (.node (.node (.single ⟨22400,22464,28544,28608⟩) (.single ⟨22400,22464,28608,28672⟩)) (.node (.single ⟨22464,22528,28544,28608⟩) (.single ⟨22464,22528,28608,28672⟩))))) (.node (.node (.node (.single ⟨28416,28544,22272,22400⟩) (.node (.single ⟨28416,28480,22400,22464⟩) (.single ⟨28416,28448,22464,22496⟩))) (.node (.single ⟨28416,28448,22496,22528⟩) (.node (.single ⟨28448,28480,22464,22496⟩) (.single ⟨28448,28480,22496,22528⟩)))) (.node (.node (.single ⟨28480,28544,22400,22464⟩) (.node (.single ⟨28480,28544,22464,22528⟩) (.single ⟨28544,28672,22272,22400⟩))) (.node (.node (.single ⟨28544,28608,22400,22464⟩) (.single ⟨28544,28608,22464,22528⟩)) (.node (.single ⟨28608,28672,22400,22464⟩) (.single ⟨28608,28672,22464,22528⟩)))))))
def output4 : Fin 52 → GridBox := outputData4.get
def coverData4 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 24) (.single 47))) (.node (.single 27) (.node (.single 12) (.single 25)))) (.node (.node (.single 39) (.node (.single 26) (.single 5))) (.node (.node (.single 17) (.single 46)) (.node (.single 34) (.single 6))))) (.node (.node (.node (.single 22) (.node (.single 45) (.single 29))) (.node (.single 11) (.node (.single 23) (.single 40)))) (.node (.node (.single 28) (.node (.single 0) (.single 13))) (.node (.node (.single 51) (.single 38)) (.node (.single 1) (.single 15)))))) (.node (.node (.node (.node (.single 50) (.node (.single 36) (.single 2))) (.node (.single 14) (.node (.single 49) (.single 37)))) (.node (.node (.single 3) (.node (.single 16) (.single 48))) (.node (.node (.single 35) (.single 7)) (.node (.single 18) (.single 44))))) (.node (.node (.node (.single 33) (.node (.single 8) (.single 20))) (.node (.single 43) (.node (.single 31) (.single 9)))) (.node (.node (.single 19) (.node (.single 42) (.single 32))) (.node (.node (.single 10) (.single 21)) (.node (.single 41) (.single 30)))))))
def sourceData4 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover4 (i : Fin 52) : Fin 52 := ⟨coverData4.get i % 52, Nat.mod_lt _ (by decide)⟩
def source4 (i : Fin 52) : Fin 52 := ⟨sourceData4.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree4 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 (.cutY 10240 .empty (.cutX 5120 (.cutY 11264 (.cutX 4608 (.cutY 10752 (.cutX 4352 (.cutY 10496 (.cutX 4224 (.cutY 10368 (.cutX 4160 (.cutY 10304 .full .full) (.cutY 10304 .full .full)) .full) (.cutY 10368 (.cutX 4288 (.cutY 10304 .full .full) (.cutY 10304 (.cutX 4320 (.cutY 10272 .full .full) (.cutY 10272 .full .full)) .full)) .full)) .empty) .empty) .empty) .empty) .empty) .empty)) .empty) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 .empty (.cutY 6144 (.cutX 11264 (.cutY 5120 (.cutX 10752 (.cutY 4608 (.cutX 10496 (.cutY 4352 (.cutX 10368 (.cutY 4224 (.cutX 10304 (.cutY 4160 .full .full) (.cutY 4160 .full .full)) (.cutX 10304 (.cutY 4288 .full (.cutX 10272 (.cutY 4320 .full .full) (.cutY 4320 .full .full))) (.cutY 4288 .full .full))) (.cutY 4224 .full .full)) .empty) .empty) .empty) .empty) .empty) .empty) .empty))) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 (.cutY 26624 .empty (.cutX 21504 .empty (.cutY 27648 .empty (.cutX 22016 .empty (.cutY 28160 .empty (.cutX 22272 .empty (.cutY 28416 .empty (.cutX 22400 (.cutY 28544 .full .full) (.cutY 28544 (.cutX 22464 (.cutY 28480 .full .full) (.cutY 28480 (.cutX 22496 (.cutY 28448 .full .full) (.cutY 28448 .full .full)) .full)) (.cutX 22464 (.cutY 28608 .full .full) (.cutY 28608 .full .full))))))))))) .empty) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 .empty (.cutY 22528 (.cutX 27648 .empty (.cutY 21504 .empty (.cutX 28160 .empty (.cutY 22016 .empty (.cutX 28416 .empty (.cutY 22272 .empty (.cutX 28544 (.cutY 22400 .full (.cutX 28480 (.cutY 22464 .full (.cutX 28448 (.cutY 22496 .full .full) (.cutY 22496 .full .full))) (.cutY 22464 .full .full))) (.cutY 22400 .full (.cutX 28608 (.cutY 22464 .full .full) (.cutY 22464 .full .full)))))))))) .empty))) .empty) .empty))))

theorem metadata4 : 0<22259151 ∧ 16<128 ∧ 40<128 ∧ 1<4 ∧
    5992/4160=1 ∧ 5992%4160=1832 ∧ ∀ i, (leaves4 i).Valid 8 := by
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

noncomputable def phaseMass4 : ℝ := singlePhaseMass (22259151/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw4 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass4_eq : phaseMass4 = (22259151/1638400000000 : ℝ) := by
  unfold phaseMass4
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw4 output4 cover4 source4
    (gridTreeUnionCheck_sound 32768 raw4 output4 cover4 source4 tree4 checked4)
    _ (by norm_num) _, areaUnits4]
  norm_num

-- Frozen phase 3013, atom 5378, type 1, source (10,38).
def leavesData5 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves5 : Fin 7 → DyadicLeaf := leavesData5.get
def raw5 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 10 38 leaves5 i
def outputData5 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨2560,2688,9728,9856⟩) (.node (.single ⟨2560,2688,9856,9984⟩) (.single ⟨2688,2752,9728,9792⟩))) (.node (.node (.single ⟨2688,2752,9792,9856⟩) (.single ⟨2752,2816,9728,9792⟩)) (.node (.single ⟨2752,2816,9792,9856⟩) (.single ⟨2688,2816,9856,9984⟩)))) (.node (.node (.single ⟨9728,9856,2560,2688⟩) (.node (.single ⟨9728,9792,2688,2752⟩) (.single ⟨9728,9792,2752,2816⟩))) (.node (.node (.single ⟨9792,9856,2688,2752⟩) (.single ⟨9792,9856,2752,2816⟩)) (.node (.single ⟨9856,9984,2560,2688⟩) (.single ⟨9856,9984,2688,2816⟩))))) (.node (.node (.node (.single ⟨22784,22912,29952,30080⟩) (.node (.single ⟨22784,22912,30080,30208⟩) (.single ⟨22912,22976,29952,30016⟩))) (.node (.node (.single ⟨22912,22976,30016,30080⟩) (.single ⟨22976,23040,29952,30016⟩)) (.node (.single ⟨22976,23040,30016,30080⟩) (.single ⟨22912,23040,30080,30208⟩)))) (.node (.node (.single ⟨29952,30080,22784,22912⟩) (.node (.single ⟨29952,30016,22912,22976⟩) (.single ⟨29952,30016,22976,23040⟩))) (.node (.node (.single ⟨30016,30080,22912,22976⟩) (.single ⟨30016,30080,22976,23040⟩)) (.node (.single ⟨30080,30208,22784,22912⟩) (.single ⟨30080,30208,22912,23040⟩))))))
def output5 : Fin 28 → GridBox := outputData5.get
def coverData5 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData5 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover5 (i : Fin 28) : Fin 28 := ⟨coverData5.get i % 28, Nat.mod_lt _ (by decide)⟩
def source5 (i : Fin 28) : Fin 28 := ⟨sourceData5.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree5 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 .empty (.cutY 10240 (.cutX 3072 (.cutY 9216 .empty (.cutX 2560 .empty (.cutY 9728 .empty (.cutX 2816 (.cutY 9984 (.cutX 2688 (.cutY 9856 .full .full) (.cutY 9856 (.cutX 2752 (.cutY 9792 .full .full) (.cutY 9792 .full .full)) .full)) .empty) .empty)))) .empty) .empty)) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 .empty (.cutX 9216 .empty (.cutY 3072 (.cutX 9728 .empty (.cutY 2560 .empty (.cutX 9984 (.cutY 2816 (.cutX 9856 (.cutY 2688 .full (.cutX 9792 (.cutY 2752 .full .full) (.cutY 2752 .full .full))) (.cutY 2688 .full .full)) .empty) .empty))) .empty))) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 (.cutX 23552 (.cutY 29696 .empty (.cutX 23040 (.cutY 30208 (.cutX 22784 .empty (.cutY 29952 .empty (.cutX 22912 (.cutY 30080 .full .full) (.cutY 30080 (.cutX 22976 (.cutY 30016 .full .full) (.cutY 30016 .full .full)) .full)))) .empty) .empty)) .empty) .empty))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 (.cutY 22528 .empty (.cutX 29696 .empty (.cutY 23552 (.cutX 30208 (.cutY 23040 (.cutX 29952 .empty (.cutY 22784 .empty (.cutX 30080 (.cutY 22912 .full (.cutX 30016 (.cutY 22976 .full .full) (.cutY 22976 .full .full))) (.cutY 22912 .full .full)))) .empty) .empty) .empty))) .empty))) .empty))))

theorem metadata5 : 0<190129790 ∧ 10<128 ∧ 38<128 ∧ 1<4 ∧
    5378/4160=1 ∧ 5378%4160=1218 ∧ ∀ i, (leaves5 i).Valid 8 := by
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

noncomputable def phaseMass5 : ℝ := singlePhaseMass (190129790/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw5 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass5_eq : phaseMass5 = (19012979/163840000000 : ℝ) := by
  unfold phaseMass5
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw5 output5 cover5 source5
    (gridTreeUnionCheck_sound 32768 raw5 output5 cover5 source5 tree5 checked5)
    _ (by norm_num) _, areaUnits5]
  norm_num

-- Frozen phase 3014, atom 4196, type 1, source (0,36).
def leavesData6 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves6 : Fin 1 → DyadicLeaf := leavesData6.get
def raw6 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 0 36 leaves6 i
def outputData6 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨0,256,9216,9472⟩) (.single ⟨9216,9472,0,256⟩)) (.node (.single ⟨23296,23552,32512,32768⟩) (.single ⟨32512,32768,23296,23552⟩)))
def output6 : Fin 4 → GridBox := outputData6.get
def coverData6 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData6 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover6 (i : Fin 4) : Fin 4 := ⟨coverData6.get i % 4, Nat.mod_lt _ (by decide)⟩
def source6 (i : Fin 4) : Fin 4 := ⟨sourceData6.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree6 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 (.cutY 10240 (.cutX 1024 (.cutY 9216 .empty (.cutX 512 (.cutY 9728 (.cutX 256 (.cutY 9472 .full .empty) .empty) .empty) .empty)) .empty) .empty) .empty) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 (.cutX 9216 .empty (.cutY 1024 (.cutX 9728 (.cutY 512 (.cutX 9472 (.cutY 256 .full .empty) .empty) .empty) .empty) .empty)) .empty) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 .empty (.cutX 23552 (.cutY 31744 .empty (.cutX 23040 .empty (.cutY 32256 .empty (.cutX 23296 .empty (.cutY 32512 .empty .full))))) .empty)))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 .empty (.cutY 22528 .empty (.cutX 31744 .empty (.cutY 23552 (.cutX 32256 .empty (.cutY 23040 .empty (.cutX 32512 .empty (.cutY 23296 .empty .full)))) .empty)))))) .empty))))

theorem metadata6 : 0<475523442 ∧ 0<128 ∧ 36<128 ∧ 1<4 ∧
    4196/4160=1 ∧ 4196%4160=36 ∧ ∀ i, (leaves6 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData6).mp
    (by decide +kernel)

theorem sourceChecked6_0 : ∀ i : Fin 4,
    (fun i => output6 i = raw6 (source6 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked6 : ∀ i : Fin 4, (fun i => output6 i = raw6 (source6 i)) i :=
  forallFin_of_zero_offset (fun i => output6 i = raw6 (source6 i)) sourceChecked6_0

theorem coverChecked6_0 : ∀ i : Fin 4,
    (fun i => (output6 (cover6 i)).ContainsBox (raw6 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked6 : ∀ i : Fin 4, (fun i => (output6 (cover6 i)).ContainsBox (raw6 i)) i :=
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

noncomputable def phaseMass6 : ℝ := singlePhaseMass (475523442/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw6 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass6_eq : phaseMass6 = (237761721/819200000000 : ℝ) := by
  unfold phaseMass6
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw6 output6 cover6 source6
    (gridTreeUnionCheck_sound 32768 raw6 output6 cover6 source6 tree6 checked6)
    _ (by norm_num) _, areaUnits6]
  norm_num

-- Frozen phase 3015, atom 2118, type 0, source (19,47).
def leavesData7 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves7 : Fin 4 → DyadicLeaf := leavesData7.get
def raw7 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 19 47 leaves7 i
def outputData7 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨4864,4992,12032,12160⟩) (.single ⟨4864,4992,12160,12288⟩)) (.node (.single ⟨4992,5120,12032,12160⟩) (.single ⟨4992,5120,12160,12288⟩))) (.node (.node (.single ⟨12032,12160,4864,4992⟩) (.single ⟨12032,12160,4992,5120⟩)) (.node (.single ⟨12160,12288,4864,4992⟩) (.single ⟨12160,12288,4992,5120⟩)))) (.node (.node (.node (.single ⟨20480,20608,27648,27776⟩) (.single ⟨20480,20608,27776,27904⟩)) (.node (.single ⟨20608,20736,27648,27776⟩) (.single ⟨20608,20736,27776,27904⟩))) (.node (.node (.single ⟨27648,27776,20480,20608⟩) (.single ⟨27648,27776,20608,20736⟩)) (.node (.single ⟨27776,27904,20480,20608⟩) (.single ⟨27776,27904,20608,20736⟩)))))
def output7 : Fin 16 → GridBox := outputData7.get
def coverData7 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData7 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover7 (i : Fin 16) : Fin 16 := ⟨coverData7.get i % 16, Nat.mod_lt _ (by decide)⟩
def source7 (i : Fin 16) : Fin 16 := ⟨sourceData7.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree7 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 (.cutY 10240 .empty (.cutX 5120 (.cutY 11264 .empty (.cutX 4608 .empty (.cutY 11776 .empty (.cutX 4864 .empty (.cutY 12032 .empty (.cutX 4992 (.cutY 12160 .full .full) (.cutY 12160 .full .full))))))) .empty)) .empty) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 .empty (.cutY 6144 (.cutX 11264 .empty (.cutY 5120 (.cutX 11776 .empty (.cutY 4608 .empty (.cutX 12032 .empty (.cutY 4864 .empty (.cutX 12160 (.cutY 4992 .full .full) (.cutY 4992 .full .full)))))) .empty)) .empty))) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 (.cutY 26624 .empty (.cutX 21504 (.cutY 27648 .empty (.cutX 20992 (.cutY 28160 (.cutX 20736 (.cutY 27904 (.cutX 20608 (.cutY 27776 .full .full) (.cutY 27776 .full .full)) .empty) .empty) .empty) .empty)) .empty)) .empty) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 .empty (.cutY 22528 (.cutX 27648 .empty (.cutY 21504 (.cutX 28160 (.cutY 20992 (.cutX 27904 (.cutY 20736 (.cutX 27776 (.cutY 20608 .full .full) (.cutY 20608 .full .full)) .empty) .empty) .empty) .empty) .empty)) .empty))) .empty) .empty))))

theorem metadata7 : 0<73667111 ∧ 19<128 ∧ 47<128 ∧ 0<4 ∧
    2118/4160=0 ∧ 2118%4160=2118 ∧ ∀ i, (leaves7 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData7).mp
    (by decide +kernel)

theorem sourceChecked7_0 : ∀ i : Fin 16,
    (fun i => output7 i = raw7 (source7 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked7 : ∀ i : Fin 16, (fun i => output7 i = raw7 (source7 i)) i :=
  forallFin_of_zero_offset (fun i => output7 i = raw7 (source7 i)) sourceChecked7_0

theorem coverChecked7_0 : ∀ i : Fin 16,
    (fun i => (output7 (cover7 i)).ContainsBox (raw7 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked7 : ∀ i : Fin 16, (fun i => (output7 (cover7 i)).ContainsBox (raw7 i)) i :=
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

-- Frozen phase 3016, atom 5158, type 1, source (8,38).
def leavesData8 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩)) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))))
def leaves8 : Fin 7 → DyadicLeaf := leavesData8.get
def raw8 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 8 38 leaves8 i
def outputData8 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨2048,2112,9728,9792⟩) (.node (.single ⟨2048,2112,9792,9856⟩) (.single ⟨2112,2176,9728,9792⟩))) (.node (.node (.single ⟨2112,2176,9792,9856⟩) (.single ⟨2048,2176,9856,9984⟩)) (.node (.single ⟨2176,2304,9728,9856⟩) (.single ⟨2176,2304,9856,9984⟩)))) (.node (.node (.single ⟨9728,9792,2048,2112⟩) (.node (.single ⟨9728,9792,2112,2176⟩) (.single ⟨9792,9856,2048,2112⟩))) (.node (.node (.single ⟨9792,9856,2112,2176⟩) (.single ⟨9728,9856,2176,2304⟩)) (.node (.single ⟨9856,9984,2048,2176⟩) (.single ⟨9856,9984,2176,2304⟩))))) (.node (.node (.node (.single ⟨22784,22912,30464,30592⟩) (.node (.single ⟨22784,22912,30592,30720⟩) (.single ⟨22912,23040,30464,30592⟩))) (.node (.node (.single ⟨22912,22976,30592,30656⟩) (.single ⟨22912,22976,30656,30720⟩)) (.node (.single ⟨22976,23040,30592,30656⟩) (.single ⟨22976,23040,30656,30720⟩)))) (.node (.node (.single ⟨30464,30592,22784,22912⟩) (.node (.single ⟨30464,30592,22912,23040⟩) (.single ⟨30592,30720,22784,22912⟩))) (.node (.node (.single ⟨30592,30656,22912,22976⟩) (.single ⟨30592,30656,22976,23040⟩)) (.node (.single ⟨30656,30720,22912,22976⟩) (.single ⟨30656,30720,22976,23040⟩))))))
def output8 : Fin 28 → GridBox := outputData8.get
def coverData8 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 4) (.node (.single 12) (.single 23))) (.node (.node (.single 15) (.single 5)) (.node (.single 11) (.single 22)))) (.node (.node (.single 16) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 0) (.single 7))))) (.node (.node (.node (.single 27) (.node (.single 20) (.single 1))) (.node (.node (.single 9) (.single 26)) (.node (.single 18) (.single 2)))) (.node (.node (.single 8) (.node (.single 25) (.single 19))) (.node (.node (.single 3) (.single 10)) (.node (.single 24) (.single 17))))))
def sourceData8 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 12) (.node (.single 16) (.single 20))) (.node (.node (.single 24) (.single 0)) (.node (.single 4) (.single 8)))) (.node (.node (.single 13) (.node (.single 21) (.single 17))) (.node (.node (.single 25) (.single 5)) (.node (.single 1) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 3) (.single 7))) (.node (.node (.single 27) (.single 19)) (.node (.single 23) (.single 15)))) (.node (.node (.single 10) (.node (.single 6) (.single 2))) (.node (.node (.single 26) (.single 22)) (.node (.single 18) (.single 14))))))
def cover8 (i : Fin 28) : Fin 28 := ⟨coverData8.get i % 28, Nat.mod_lt _ (by decide)⟩
def source8 (i : Fin 28) : Fin 28 := ⟨sourceData8.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree8 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 .empty (.cutY 10240 (.cutX 3072 (.cutY 9216 .empty (.cutX 2560 (.cutY 9728 .empty (.cutX 2304 (.cutY 9984 (.cutX 2176 (.cutY 9856 (.cutX 2112 (.cutY 9792 .full .full) (.cutY 9792 .full .full)) .full) (.cutY 9856 .full .full)) .empty) .empty)) .empty)) .empty) .empty)) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 .empty (.cutX 9216 .empty (.cutY 3072 (.cutX 9728 .empty (.cutY 2560 (.cutX 9984 (.cutY 2304 (.cutX 9856 (.cutY 2176 (.cutX 9792 (.cutY 2112 .full .full) (.cutY 2112 .full .full)) .full) (.cutY 2176 .full .full)) .empty) .empty) .empty)) .empty))) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 (.cutX 23552 (.cutY 29696 .empty (.cutX 23040 (.cutY 30208 .empty (.cutX 22784 .empty (.cutY 30464 .empty (.cutX 22912 (.cutY 30592 .full .full) (.cutY 30592 .full (.cutX 22976 (.cutY 30656 .full .full) (.cutY 30656 .full .full))))))) .empty)) .empty) .empty))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 (.cutY 22528 .empty (.cutX 29696 .empty (.cutY 23552 (.cutX 30208 .empty (.cutY 23040 (.cutX 30464 .empty (.cutY 22784 .empty (.cutX 30592 (.cutY 22912 .full .full) (.cutY 22912 .full (.cutX 30656 (.cutY 22976 .full .full) (.cutY 22976 .full .full)))))) .empty)) .empty))) .empty))) .empty))))

theorem metadata8 : 0<190129790 ∧ 8<128 ∧ 38<128 ∧ 1<4 ∧
    5158/4160=1 ∧ 5158%4160=998 ∧ ∀ i, (leaves8 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData8).mp
    (by decide +kernel)

theorem sourceChecked8_0 : ∀ i : Fin 28,
    (fun i => output8 i = raw8 (source8 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked8 : ∀ i : Fin 28, (fun i => output8 i = raw8 (source8 i)) i :=
  forallFin_of_zero_offset (fun i => output8 i = raw8 (source8 i)) sourceChecked8_0

theorem coverChecked8_0 : ∀ i : Fin 28,
    (fun i => (output8 (cover8 i)).ContainsBox (raw8 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked8 : ∀ i : Fin 28, (fun i => (output8 (cover8 i)).ContainsBox (raw8 i)) i :=
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

noncomputable def phaseMass8 : ℝ := singlePhaseMass (190129790/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw8 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass8_eq : phaseMass8 = (19012979/163840000000 : ℝ) := by
  unfold phaseMass8
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw8 output8 cover8 source8
    (gridTreeUnionCheck_sound 32768 raw8 output8 cover8 source8 tree8 checked8)
    _ (by norm_num) _, areaUnits8]
  norm_num

-- Frozen phase 3017, atom 3064, type 0, source (31,57).
def leavesData9 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves9 : Fin 1 → DyadicLeaf := leavesData9.get
def raw9 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 31 57 leaves9 i
def outputData9 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨7936,8192,14592,14848⟩) (.single ⟨14592,14848,7936,8192⟩)) (.node (.single ⟨17920,18176,24576,24832⟩) (.single ⟨24576,24832,17920,18176⟩)))
def output9 : Fin 4 → GridBox := outputData9.get
def coverData9 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData9 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover9 (i : Fin 4) : Fin 4 := ⟨coverData9.get i % 4, Nat.mod_lt _ (by decide)⟩
def source9 (i : Fin 4) : Fin 4 := ⟨sourceData9.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree9 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 .empty (.cutY 14336 .empty (.cutX 7168 .empty (.cutY 15360 (.cutX 7680 .empty (.cutY 14848 (.cutX 7936 .empty (.cutY 14592 .empty .full)) .empty)) .empty))))))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 .empty (.cutY 6144 .empty (.cutX 15360 (.cutY 7168 .empty (.cutX 14848 (.cutY 7680 .empty (.cutX 14592 .empty (.cutY 7936 .empty .full))) .empty)) .empty))))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 (.cutY 26624 (.cutX 17408 .empty (.cutY 25600 (.cutX 17920 .empty (.cutY 25088 (.cutX 18176 (.cutY 24832 .full .empty) .empty) .empty)) .empty)) .empty) .empty) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 (.cutY 18432 (.cutX 25600 (.cutY 17408 .empty (.cutX 25088 (.cutY 17920 .empty (.cutX 24832 (.cutY 18176 .full .empty) .empty)) .empty)) .empty) .empty) .empty) .empty) .empty) .empty))))

theorem metadata9 : 0<29910597 ∧ 31<128 ∧ 57<128 ∧ 0<4 ∧
    3064/4160=0 ∧ 3064%4160=3064 ∧ ∀ i, (leaves9 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData9).mp
    (by decide +kernel)

theorem sourceChecked9_0 : ∀ i : Fin 4,
    (fun i => output9 i = raw9 (source9 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked9 : ∀ i : Fin 4, (fun i => output9 i = raw9 (source9 i)) i :=
  forallFin_of_zero_offset (fun i => output9 i = raw9 (source9 i)) sourceChecked9_0

theorem coverChecked9_0 : ∀ i : Fin 4,
    (fun i => (output9 (cover9 i)).ContainsBox (raw9 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked9 : ∀ i : Fin 4, (fun i => (output9 (cover9 i)).ContainsBox (raw9 i)) i :=
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

noncomputable def phaseMass9 : ℝ := singlePhaseMass (29910597/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw9 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass9_eq : phaseMass9 = (29910597/1638400000000 : ℝ) := by
  unfold phaseMass9
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw9 output9 cover9 source9
    (gridTreeUnionCheck_sound 32768 raw9 output9 cover9 source9 tree9 checked9)
    _ (by norm_num) _, areaUnits9]
  norm_num

-- Frozen phase 3018, atom 2208, type 0, source (20,48).
def leavesData10 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves10 : Fin 4 → DyadicLeaf := leavesData10.get
def raw10 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 20 48 leaves10 i
def outputData10 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨5120,5248,12288,12416⟩) (.single ⟨5120,5248,12416,12544⟩)) (.node (.single ⟨5248,5376,12288,12416⟩) (.single ⟨5248,5376,12416,12544⟩))) (.node (.node (.single ⟨12288,12416,5120,5248⟩) (.single ⟨12288,12416,5248,5376⟩)) (.node (.single ⟨12416,12544,5120,5248⟩) (.single ⟨12416,12544,5248,5376⟩)))) (.node (.node (.node (.single ⟨20224,20352,27392,27520⟩) (.single ⟨20224,20352,27520,27648⟩)) (.node (.single ⟨20352,20480,27392,27520⟩) (.single ⟨20352,20480,27520,27648⟩))) (.node (.node (.single ⟨27392,27520,20224,20352⟩) (.single ⟨27392,27520,20352,20480⟩)) (.node (.single ⟨27520,27648,20224,20352⟩) (.single ⟨27520,27648,20352,20480⟩)))))
def output10 : Fin 16 → GridBox := outputData10.get
def coverData10 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData10 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover10 (i : Fin 16) : Fin 16 := ⟨coverData10.get i % 16, Nat.mod_lt _ (by decide)⟩
def source10 (i : Fin 16) : Fin 16 := ⟨sourceData10.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree10 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 (.cutY 14336 (.cutX 5120 .empty (.cutY 13312 (.cutX 5632 (.cutY 12800 (.cutX 5376 (.cutY 12544 (.cutX 5248 (.cutY 12416 .full .full) (.cutY 12416 .full .full)) .empty) .empty) .empty) .empty) .empty)) .empty) .empty)))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 (.cutY 6144 (.cutX 13312 (.cutY 5120 .empty (.cutX 12800 (.cutY 5632 (.cutX 12544 (.cutY 5376 (.cutX 12416 (.cutY 5248 .full .full) (.cutY 5248 .full .full)) .empty) .empty) .empty) .empty)) .empty) .empty) .empty))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 .empty (.cutY 26624 .empty (.cutX 19456 .empty (.cutY 27648 (.cutX 19968 .empty (.cutY 27136 .empty (.cutX 20224 .empty (.cutY 27392 .empty (.cutX 20352 (.cutY 27520 .full .full) (.cutY 27520 .full .full)))))) .empty)))) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 .empty (.cutY 18432 .empty (.cutX 27648 (.cutY 19456 .empty (.cutX 27136 .empty (.cutY 19968 .empty (.cutX 27392 .empty (.cutY 20224 .empty (.cutX 27520 (.cutY 20352 .full .full) (.cutY 20352 .full .full))))))) .empty))) .empty) .empty) .empty))))

theorem metadata10 : 0<204777576 ∧ 20<128 ∧ 48<128 ∧ 0<4 ∧
    2208/4160=0 ∧ 2208%4160=2208 ∧ ∀ i, (leaves10 i).Valid 8 := by
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

noncomputable def phaseMass10 : ℝ := singlePhaseMass (204777576/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw10 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass10_eq : phaseMass10 = (25597197/204800000000 : ℝ) := by
  unfold phaseMass10
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw10 output10 cover10 source10
    (gridTreeUnionCheck_sound 32768 raw10 output10 cover10 source10 tree10 checked10)
    _ (by norm_num) _, areaUnits10]
  norm_num

-- Frozen phase 3019, atom 1740, type 0, source (15,45).
def leavesData11 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves11 : Fin 4 → DyadicLeaf := leavesData11.get
def raw11 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 15 45 leaves11 i
def outputData11 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨3840,3968,11520,11648⟩) (.single ⟨3840,3968,11648,11776⟩)) (.node (.single ⟨3968,4096,11520,11648⟩) (.single ⟨3968,4096,11648,11776⟩))) (.node (.node (.single ⟨11520,11648,3840,3968⟩) (.single ⟨11520,11648,3968,4096⟩)) (.node (.single ⟨11648,11776,3840,3968⟩) (.single ⟨11648,11776,3968,4096⟩)))) (.node (.node (.node (.single ⟨20992,21120,28672,28800⟩) (.single ⟨20992,21120,28800,28928⟩)) (.node (.single ⟨21120,21248,28672,28800⟩) (.single ⟨21120,21248,28800,28928⟩))) (.node (.node (.single ⟨28672,28800,20992,21120⟩) (.single ⟨28672,28800,21120,21248⟩)) (.node (.single ⟨28800,28928,20992,21120⟩) (.single ⟨28800,28928,21120,21248⟩)))))
def output11 : Fin 16 → GridBox := outputData11.get
def coverData11 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData11 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover11 (i : Fin 16) : Fin 16 := ⟨coverData11.get i % 16, Nat.mod_lt _ (by decide)⟩
def source11 (i : Fin 16) : Fin 16 := ⟨sourceData11.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree11 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 .empty (.cutY 10240 .empty (.cutX 3072 .empty (.cutY 11264 .empty (.cutX 3584 .empty (.cutY 11776 (.cutX 3840 .empty (.cutY 11520 .empty (.cutX 3968 (.cutY 11648 .full .full) (.cutY 11648 .full .full)))) .empty)))))) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 .empty (.cutY 2048 .empty (.cutX 11264 .empty (.cutY 3072 .empty (.cutX 11776 (.cutY 3584 .empty (.cutX 11520 .empty (.cutY 3840 .empty (.cutX 11648 (.cutY 3968 .full .full) (.cutY 3968 .full .full))))) .empty))))) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 (.cutY 30720 (.cutX 21504 (.cutY 29696 (.cutX 20992 .empty (.cutY 29184 (.cutX 21248 (.cutY 28928 (.cutX 21120 (.cutY 28800 .full .full) (.cutY 28800 .full .full)) .empty) .empty) .empty)) .empty) .empty) .empty) .empty)))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 (.cutY 22528 (.cutX 29696 (.cutY 21504 (.cutX 29184 (.cutY 20992 .empty (.cutX 28928 (.cutY 21248 (.cutX 28800 (.cutY 21120 .full .full) (.cutY 21120 .full .full)) .empty) .empty)) .empty) .empty) .empty) .empty) .empty))) .empty))))

theorem metadata11 : 0<296697202 ∧ 15<128 ∧ 45<128 ∧ 0<4 ∧
    1740/4160=0 ∧ 1740%4160=1740 ∧ ∀ i, (leaves11 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData11).mp
    (by decide +kernel)

theorem sourceChecked11_0 : ∀ i : Fin 16,
    (fun i => output11 i = raw11 (source11 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked11 : ∀ i : Fin 16, (fun i => output11 i = raw11 (source11 i)) i :=
  forallFin_of_zero_offset (fun i => output11 i = raw11 (source11 i)) sourceChecked11_0

theorem coverChecked11_0 : ∀ i : Fin 16,
    (fun i => (output11 (cover11 i)).ContainsBox (raw11 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked11 : ∀ i : Fin 16, (fun i => (output11 (cover11 i)).ContainsBox (raw11 i)) i :=
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

noncomputable def phaseMass11 : ℝ := singlePhaseMass (296697202/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw11 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass11_eq : phaseMass11 = (148348601/819200000000 : ℝ) := by
  unfold phaseMass11
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw11 output11 cover11 source11
    (gridTreeUnionCheck_sound 32768 raw11 output11 cover11 source11 tree11 checked11)
    _ (by norm_num) _, areaUnits11]
  norm_num

-- Frozen phase 3020, atom 2296, type 0, source (21,49).
def leavesData12 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves12 : Fin 1 → DyadicLeaf := leavesData12.get
def raw12 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 21 49 leaves12 i
def outputData12 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨5376,5632,12544,12800⟩) (.single ⟨12544,12800,5376,5632⟩)) (.node (.single ⟨19968,20224,27136,27392⟩) (.single ⟨27136,27392,19968,20224⟩)))
def output12 : Fin 4 → GridBox := outputData12.get
def coverData12 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData12 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover12 (i : Fin 4) : Fin 4 := ⟨coverData12.get i % 4, Nat.mod_lt _ (by decide)⟩
def source12 (i : Fin 4) : Fin 4 := ⟨sourceData12.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree12 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 (.cutY 14336 (.cutX 5120 .empty (.cutY 13312 (.cutX 5632 (.cutY 12800 (.cutX 5376 .empty (.cutY 12544 .empty .full)) .empty) .empty) .empty)) .empty) .empty)))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 (.cutY 6144 (.cutX 13312 (.cutY 5120 .empty (.cutX 12800 (.cutY 5632 (.cutX 12544 .empty (.cutY 5376 .empty .full)) .empty) .empty)) .empty) .empty) .empty))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 .empty (.cutY 26624 .empty (.cutX 19456 .empty (.cutY 27648 (.cutX 19968 .empty (.cutY 27136 .empty (.cutX 20224 (.cutY 27392 .full .empty) .empty))) .empty)))) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 .empty (.cutY 18432 .empty (.cutX 27648 (.cutY 19456 .empty (.cutX 27136 .empty (.cutY 19968 .empty (.cutX 27392 (.cutY 20224 .full .empty) .empty)))) .empty))) .empty) .empty) .empty))))

theorem metadata12 : 0<204777576 ∧ 21<128 ∧ 49<128 ∧ 0<4 ∧
    2296/4160=0 ∧ 2296%4160=2296 ∧ ∀ i, (leaves12 i).Valid 8 := by
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

noncomputable def phaseMass12 : ℝ := singlePhaseMass (204777576/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw12 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass12_eq : phaseMass12 = (25597197/204800000000 : ℝ) := by
  unfold phaseMass12
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw12 output12 cover12 source12
    (gridTreeUnionCheck_sound 32768 raw12 output12 cover12 source12 tree12 checked12)
    _ (by norm_num) _, areaUnits12]
  norm_num

-- Frozen phase 3021, atom 6450, type 1, source (21,43).
def leavesData13 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves13 : Fin 10 → DyadicLeaf := leavesData13.get
def raw13 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 21 43 leaves13 i
def outputData13 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨5376,5504,11008,11136⟩) (.single ⟨5376,5504,11136,11264⟩)) (.node (.single ⟨5504,5568,11008,11072⟩) (.node (.single ⟨5504,5568,11072,11136⟩) (.single ⟨5568,5600,11008,11040⟩)))) (.node (.node (.single ⟨5568,5600,11040,11072⟩) (.single ⟨5600,5632,11008,11040⟩)) (.node (.single ⟨5600,5632,11040,11072⟩) (.node (.single ⟨5568,5632,11072,11136⟩) (.single ⟨5504,5632,11136,11264⟩))))) (.node (.node (.node (.single ⟨11008,11136,5376,5504⟩) (.single ⟨11008,11072,5504,5568⟩)) (.node (.single ⟨11008,11040,5568,5600⟩) (.node (.single ⟨11008,11040,5600,5632⟩) (.single ⟨11040,11072,5568,5600⟩)))) (.node (.node (.single ⟨11040,11072,5600,5632⟩) (.single ⟨11072,11136,5504,5568⟩)) (.node (.single ⟨11072,11136,5568,5632⟩) (.node (.single ⟨11136,11264,5376,5504⟩) (.single ⟨11136,11264,5504,5632⟩)))))) (.node (.node (.node (.node (.single ⟨21504,21632,27136,27264⟩) (.single ⟨21504,21632,27264,27392⟩)) (.node (.single ⟨21632,21696,27136,27200⟩) (.node (.single ⟨21632,21696,27200,27264⟩) (.single ⟨21696,21728,27136,27168⟩)))) (.node (.node (.single ⟨21696,21728,27168,27200⟩) (.single ⟨21728,21760,27136,27168⟩)) (.node (.single ⟨21728,21760,27168,27200⟩) (.node (.single ⟨21696,21760,27200,27264⟩) (.single ⟨21632,21760,27264,27392⟩))))) (.node (.node (.node (.single ⟨27136,27264,21504,21632⟩) (.single ⟨27136,27200,21632,21696⟩)) (.node (.single ⟨27136,27168,21696,21728⟩) (.node (.single ⟨27136,27168,21728,21760⟩) (.single ⟨27168,27200,21696,21728⟩)))) (.node (.node (.single ⟨27168,27200,21728,21760⟩) (.single ⟨27200,27264,21632,21696⟩)) (.node (.single ⟨27200,27264,21696,21760⟩) (.node (.single ⟨27264,27392,21504,21632⟩) (.single ⟨27264,27392,21632,21760⟩)))))))
def output13 : Fin 40 → GridBox := outputData13.get
def coverData13 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 10)) (.node (.single 39) (.node (.single 29) (.single 1)))) (.node (.node (.single 18) (.single 38)) (.node (.single 21) (.node (.single 9) (.single 19))))) (.node (.node (.node (.single 30) (.single 20)) (.node (.single 2) (.node (.single 11) (.single 37)))) (.node (.node (.single 28) (.single 3)) (.node (.single 16) (.node (.single 36) (.single 23)))))) (.node (.node (.node (.node (.single 8) (.single 17)) (.node (.single 31) (.node (.single 22) (.single 4)))) (.node (.node (.single 12) (.single 35)) (.node (.single 27) (.node (.single 5) (.single 14))))) (.node (.node (.node (.single 34) (.single 25)) (.node (.single 6) (.node (.single 13) (.single 33)))) (.node (.node (.single 26) (.single 7)) (.node (.single 15) (.node (.single 32) (.single 24)))))))
def sourceData13 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9)))))) (.node (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover13 (i : Fin 40) : Fin 40 := ⟨coverData13.get i % 40, Nat.mod_lt _ (by decide)⟩
def source13 (i : Fin 40) : Fin 40 := ⟨sourceData13.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree13 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 (.cutY 10240 .empty (.cutX 5120 .empty (.cutY 11264 (.cutX 5632 (.cutY 10752 .empty (.cutX 5376 .empty (.cutY 11008 .empty (.cutX 5504 (.cutY 11136 .full .full) (.cutY 11136 (.cutX 5568 (.cutY 11072 .full .full) (.cutY 11072 (.cutX 5600 (.cutY 11040 .full .full) (.cutY 11040 .full .full)) .full)) .full))))) .empty) .empty))) .empty) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 .empty (.cutY 6144 (.cutX 11264 (.cutY 5120 .empty (.cutX 10752 .empty (.cutY 5632 (.cutX 11008 .empty (.cutY 5376 .empty (.cutX 11136 (.cutY 5504 .full (.cutX 11072 (.cutY 5568 .full (.cutX 11040 (.cutY 5600 .full .full) (.cutY 5600 .full .full))) (.cutY 5568 .full .full))) (.cutY 5504 .full .full)))) .empty))) .empty) .empty))) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 (.cutY 26624 .empty (.cutX 21504 .empty (.cutY 27648 (.cutX 22016 (.cutY 27136 .empty (.cutX 21760 (.cutY 27392 (.cutX 21632 (.cutY 27264 .full .full) (.cutY 27264 (.cutX 21696 (.cutY 27200 .full .full) (.cutY 27200 (.cutX 21728 (.cutY 27168 .full .full) (.cutY 27168 .full .full)) .full)) .full)) .empty) .empty)) .empty) .empty))) .empty) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 .empty (.cutY 22528 (.cutX 27648 (.cutY 21504 .empty (.cutX 27136 .empty (.cutY 22016 (.cutX 27392 (.cutY 21760 (.cutX 27264 (.cutY 21632 .full (.cutX 27200 (.cutY 21696 .full (.cutX 27168 (.cutY 21728 .full .full) (.cutY 21728 .full .full))) (.cutY 21696 .full .full))) (.cutY 21632 .full .full)) .empty) .empty) .empty))) .empty) .empty))) .empty) .empty))))

theorem metadata13 : 0<22259151 ∧ 21<128 ∧ 43<128 ∧ 1<4 ∧
    6450/4160=1 ∧ 6450%4160=2290 ∧ ∀ i, (leaves13 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData13).mp
    (by decide +kernel)

theorem sourceChecked13_0 : ∀ i : Fin 40,
    (fun i => output13 i = raw13 (source13 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked13 : ∀ i : Fin 40, (fun i => output13 i = raw13 (source13 i)) i :=
  forallFin_of_zero_offset (fun i => output13 i = raw13 (source13 i)) sourceChecked13_0

theorem coverChecked13_0 : ∀ i : Fin 40,
    (fun i => (output13 (cover13 i)).ContainsBox (raw13 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked13 : ∀ i : Fin 40, (fun i => (output13 (cover13 i)).ContainsBox (raw13 i)) i :=
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

noncomputable def phaseMass13 : ℝ := singlePhaseMass (22259151/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw13 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass13_eq : phaseMass13 = (22259151/1638400000000 : ℝ) := by
  unfold phaseMass13
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw13 output13 cover13 source13
    (gridTreeUnionCheck_sound 32768 raw13 output13 cover13 source13 tree13 checked13)
    _ (by norm_num) _, areaUnits13]
  norm_num

-- Frozen phase 3022, atom 6536, type 1, source (22,44).
def leavesData14 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves14 : Fin 7 → DyadicLeaf := leavesData14.get
def raw14 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 22 44 leaves14 i
def outputData14 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨5632,5760,11264,11392⟩) (.node (.single ⟨5632,5760,11392,11520⟩) (.single ⟨5760,5824,11264,11328⟩))) (.node (.node (.single ⟨5760,5824,11328,11392⟩) (.single ⟨5824,5888,11264,11328⟩)) (.node (.single ⟨5824,5888,11328,11392⟩) (.single ⟨5760,5888,11392,11520⟩)))) (.node (.node (.single ⟨11264,11392,5632,5760⟩) (.node (.single ⟨11264,11328,5760,5824⟩) (.single ⟨11264,11328,5824,5888⟩))) (.node (.node (.single ⟨11328,11392,5760,5824⟩) (.single ⟨11328,11392,5824,5888⟩)) (.node (.single ⟨11392,11520,5632,5760⟩) (.single ⟨11392,11520,5760,5888⟩))))) (.node (.node (.node (.single ⟨21248,21376,26880,27008⟩) (.node (.single ⟨21248,21376,27008,27136⟩) (.single ⟨21376,21440,26880,26944⟩))) (.node (.node (.single ⟨21376,21440,26944,27008⟩) (.single ⟨21440,21504,26880,26944⟩)) (.node (.single ⟨21440,21504,26944,27008⟩) (.single ⟨21376,21504,27008,27136⟩)))) (.node (.node (.single ⟨26880,27008,21248,21376⟩) (.node (.single ⟨26880,26944,21376,21440⟩) (.single ⟨26880,26944,21440,21504⟩))) (.node (.node (.single ⟨26944,27008,21376,21440⟩) (.single ⟨26944,27008,21440,21504⟩)) (.node (.single ⟨27008,27136,21248,21376⟩) (.single ⟨27008,27136,21376,21504⟩))))))
def output14 : Fin 28 → GridBox := outputData14.get
def coverData14 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData14 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover14 (i : Fin 28) : Fin 28 := ⟨coverData14.get i % 28, Nat.mod_lt _ (by decide)⟩
def source14 (i : Fin 28) : Fin 28 := ⟨sourceData14.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree14 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 (.cutY 10240 .empty (.cutX 5120 .empty (.cutY 11264 .empty (.cutX 5632 .empty (.cutY 11776 (.cutX 5888 (.cutY 11520 (.cutX 5760 (.cutY 11392 .full .full) (.cutY 11392 (.cutX 5824 (.cutY 11328 .full .full) (.cutY 11328 .full .full)) .full)) .empty) .empty) .empty))))) .empty) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 .empty (.cutY 6144 (.cutX 11264 .empty (.cutY 5120 .empty (.cutX 11776 (.cutY 5632 .empty (.cutX 11520 (.cutY 5888 (.cutX 11392 (.cutY 5760 .full (.cutX 11328 (.cutY 5824 .full .full) (.cutY 5824 .full .full))) (.cutY 5760 .full .full)) .empty) .empty)) .empty))) .empty))) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 (.cutY 26624 .empty (.cutX 21504 (.cutY 27648 (.cutX 20992 .empty (.cutY 27136 (.cutX 21248 .empty (.cutY 26880 .empty (.cutX 21376 (.cutY 27008 .full .full) (.cutY 27008 (.cutX 21440 (.cutY 26944 .full .full) (.cutY 26944 .full .full)) .full)))) .empty)) .empty) .empty)) .empty) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 .empty (.cutY 22528 (.cutX 27648 (.cutY 21504 (.cutX 27136 (.cutY 20992 .empty (.cutX 26880 .empty (.cutY 21248 .empty (.cutX 27008 (.cutY 21376 .full (.cutX 26944 (.cutY 21440 .full .full) (.cutY 21440 .full .full))) (.cutY 21376 .full .full))))) .empty) .empty) .empty) .empty))) .empty) .empty))))

theorem metadata14 : 0<22259151 ∧ 22<128 ∧ 44<128 ∧ 1<4 ∧
    6536/4160=1 ∧ 6536%4160=2376 ∧ ∀ i, (leaves14 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData14).mp
    (by decide +kernel)

theorem sourceChecked14_0 : ∀ i : Fin 28,
    (fun i => output14 i = raw14 (source14 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked14 : ∀ i : Fin 28, (fun i => output14 i = raw14 (source14 i)) i :=
  forallFin_of_zero_offset (fun i => output14 i = raw14 (source14 i)) sourceChecked14_0

theorem coverChecked14_0 : ∀ i : Fin 28,
    (fun i => (output14 (cover14 i)).ContainsBox (raw14 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked14 : ∀ i : Fin 28, (fun i => (output14 (cover14 i)).ContainsBox (raw14 i)) i :=
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

noncomputable def phaseMass14 : ℝ := singlePhaseMass (22259151/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw14 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass14_eq : phaseMass14 = (22259151/1638400000000 : ℝ) := by
  unfold phaseMass14
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw14 output14 cover14 source14
    (gridTreeUnionCheck_sound 32768 raw14 output14 cover14 source14 tree14 checked14)
    _ (by norm_num) _, areaUnits14]
  norm_num

-- Frozen phase 3023, atom 167, type 0, source (1,40).
def leavesData15 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves15 : Fin 1 → DyadicLeaf := leavesData15.get
def raw15 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 1 40 leaves15 i
def outputData15 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨256,512,10240,10496⟩) (.single ⟨10240,10496,256,512⟩)) (.node (.single ⟨22272,22528,32256,32512⟩) (.single ⟨32256,32512,22272,22528⟩)))
def output15 : Fin 4 → GridBox := outputData15.get
def coverData15 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData15 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover15 (i : Fin 4) : Fin 4 := ⟨coverData15.get i % 4, Nat.mod_lt _ (by decide)⟩
def source15 (i : Fin 4) : Fin 4 := ⟨sourceData15.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree15 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 (.cutY 10240 .empty (.cutX 1024 (.cutY 11264 (.cutX 512 (.cutY 10752 (.cutX 256 .empty (.cutY 10496 .full .empty)) .empty) .empty) .empty) .empty)) .empty) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 .empty (.cutY 2048 (.cutX 11264 (.cutY 1024 (.cutX 10752 (.cutY 512 (.cutX 10496 (.cutY 256 .empty .full) .empty) .empty) .empty) .empty) .empty) .empty)) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 (.cutY 30720 .empty (.cutX 21504 .empty (.cutY 31744 .empty (.cutX 22016 .empty (.cutY 32256 .empty (.cutX 22272 .empty (.cutY 32512 .full .empty))))))) .empty)))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 .empty (.cutY 22528 (.cutX 31744 .empty (.cutY 21504 .empty (.cutX 32256 .empty (.cutY 22016 .empty (.cutX 32512 (.cutY 22272 .empty .full) .empty))))) .empty)))) .empty))))

theorem metadata15 : 0<374268468 ∧ 1<128 ∧ 40<128 ∧ 0<4 ∧
    167/4160=0 ∧ 167%4160=167 ∧ ∀ i, (leaves15 i).Valid 8 := by
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

noncomputable def phaseMass15 : ℝ := singlePhaseMass (374268468/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw15 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass15_eq : phaseMass15 = (93567117/409600000000 : ℝ) := by
  unfold phaseMass15
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw15 output15 cover15 source15
    (gridTreeUnionCheck_sound 32768 raw15 output15 cover15 source15 tree15 checked15)
    _ (by norm_num) _, areaUnits15]
  norm_num

-- Frozen phase 3024, atom 7788, type 1, source (41,61).
def leavesData16 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves16 : Fin 7 → DyadicLeaf := leavesData16.get
def raw16 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 41 61 leaves16 i
def outputData16 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨10496,10624,15616,15744⟩) (.node (.single ⟨10496,10624,15744,15872⟩) (.single ⟨10624,10688,15616,15680⟩))) (.node (.node (.single ⟨10624,10688,15680,15744⟩) (.single ⟨10688,10752,15616,15680⟩)) (.node (.single ⟨10688,10752,15680,15744⟩) (.single ⟨10624,10752,15744,15872⟩)))) (.node (.node (.single ⟨15616,15744,10496,10624⟩) (.node (.single ⟨15616,15680,10624,10688⟩) (.single ⟨15616,15680,10688,10752⟩))) (.node (.node (.single ⟨15680,15744,10624,10688⟩) (.single ⟨15680,15744,10688,10752⟩)) (.node (.single ⟨15744,15872,10496,10624⟩) (.single ⟨15744,15872,10624,10752⟩))))) (.node (.node (.node (.single ⟨16896,17024,22016,22144⟩) (.node (.single ⟨16896,17024,22144,22272⟩) (.single ⟨17024,17088,22016,22080⟩))) (.node (.node (.single ⟨17024,17088,22080,22144⟩) (.single ⟨17088,17152,22016,22080⟩)) (.node (.single ⟨17088,17152,22080,22144⟩) (.single ⟨17024,17152,22144,22272⟩)))) (.node (.node (.single ⟨22016,22144,16896,17024⟩) (.node (.single ⟨22016,22080,17024,17088⟩) (.single ⟨22016,22080,17088,17152⟩))) (.node (.node (.single ⟨22080,22144,17024,17088⟩) (.single ⟨22080,22144,17088,17152⟩)) (.node (.single ⟨22144,22272,16896,17024⟩) (.single ⟨22144,22272,17024,17152⟩))))))
def output16 : Fin 28 → GridBox := outputData16.get
def coverData16 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData16 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover16 (i : Fin 28) : Fin 28 := ⟨coverData16.get i % 28, Nat.mod_lt _ (by decide)⟩
def source16 (i : Fin 28) : Fin 28 := ⟨sourceData16.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree16 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 .empty (.cutY 14336 .empty (.cutX 11264 (.cutY 15360 .empty (.cutX 10752 (.cutY 15872 (.cutX 10496 .empty (.cutY 15616 .empty (.cutX 10624 (.cutY 15744 .full .full) (.cutY 15744 (.cutX 10688 (.cutY 15680 .full .full) (.cutY 15680 .full .full)) .full)))) .empty) .empty)) .empty)))) (.cutY 12288 (.cutX 14336 .empty (.cutY 10240 .empty (.cutX 15360 .empty (.cutY 11264 (.cutX 15872 (.cutY 10752 (.cutX 15616 .empty (.cutY 10496 .empty (.cutX 15744 (.cutY 10624 .full (.cutX 15680 (.cutY 10688 .full .full) (.cutY 10688 .full .full))) (.cutY 10624 .full .full)))) .empty) .empty) .empty)))) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 (.cutY 22528 (.cutX 17408 (.cutY 21504 .empty (.cutX 16896 .empty (.cutY 22016 .empty (.cutX 17152 (.cutY 22272 (.cutX 17024 (.cutY 22144 .full .full) (.cutY 22144 (.cutX 17088 (.cutY 22080 .full .full) (.cutY 22080 .full .full)) .full)) .empty) .empty)))) .empty) .empty) .empty)) (.cutY 20480 (.cutX 22528 (.cutY 18432 (.cutX 21504 .empty (.cutY 17408 (.cutX 22016 .empty (.cutY 16896 .empty (.cutX 22272 (.cutY 17152 (.cutX 22144 (.cutY 17024 .full (.cutX 22080 (.cutY 17088 .full .full) (.cutY 17088 .full .full))) (.cutY 17024 .full .full)) .empty) .empty))) .empty)) .empty) .empty) .empty)) .empty) .empty)))

theorem metadata16 : 0<82140708 ∧ 41<128 ∧ 61<128 ∧ 1<4 ∧
    7788/4160=1 ∧ 7788%4160=3628 ∧ ∀ i, (leaves16 i).Valid 8 := by
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

noncomputable def phaseMass16 : ℝ := singlePhaseMass (82140708/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw16 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass16_eq : phaseMass16 = (20535177/409600000000 : ℝ) := by
  unfold phaseMass16
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw16 output16 cover16 source16
    (gridTreeUnionCheck_sound 32768 raw16 output16 cover16 source16 tree16 checked16)
    _ (by norm_num) _, areaUnits16]
  norm_num

-- Frozen phase 3025, atom 6181, type 1, source (18,41).
def leavesData17 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves17 : Fin 7 → DyadicLeaf := leavesData17.get
def raw17 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 18 41 leaves17 i
def outputData17 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨4608,4736,10496,10624⟩) (.node (.single ⟨4608,4736,10624,10752⟩) (.single ⟨4736,4800,10496,10560⟩))) (.node (.node (.single ⟨4736,4800,10560,10624⟩) (.single ⟨4800,4864,10496,10560⟩)) (.node (.single ⟨4800,4864,10560,10624⟩) (.single ⟨4736,4864,10624,10752⟩)))) (.node (.node (.single ⟨10496,10624,4608,4736⟩) (.node (.single ⟨10496,10560,4736,4800⟩) (.single ⟨10496,10560,4800,4864⟩))) (.node (.node (.single ⟨10560,10624,4736,4800⟩) (.single ⟨10560,10624,4800,4864⟩)) (.node (.single ⟨10624,10752,4608,4736⟩) (.single ⟨10624,10752,4736,4864⟩))))) (.node (.node (.node (.single ⟨22016,22144,27904,28032⟩) (.node (.single ⟨22016,22144,28032,28160⟩) (.single ⟨22144,22208,27904,27968⟩))) (.node (.node (.single ⟨22144,22208,27968,28032⟩) (.single ⟨22208,22272,27904,27968⟩)) (.node (.single ⟨22208,22272,27968,28032⟩) (.single ⟨22144,22272,28032,28160⟩)))) (.node (.node (.single ⟨27904,28032,22016,22144⟩) (.node (.single ⟨27904,27968,22144,22208⟩) (.single ⟨27904,27968,22208,22272⟩))) (.node (.node (.single ⟨27968,28032,22144,22208⟩) (.single ⟨27968,28032,22208,22272⟩)) (.node (.single ⟨28032,28160,22016,22144⟩) (.single ⟨28032,28160,22144,22272⟩))))))
def output17 : Fin 28 → GridBox := outputData17.get
def coverData17 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData17 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover17 (i : Fin 28) : Fin 28 := ⟨coverData17.get i % 28, Nat.mod_lt _ (by decide)⟩
def source17 (i : Fin 28) : Fin 28 := ⟨sourceData17.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree17 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 (.cutY 10240 .empty (.cutX 5120 (.cutY 11264 (.cutX 4608 .empty (.cutY 10752 (.cutX 4864 (.cutY 10496 .empty (.cutX 4736 (.cutY 10624 .full .full) (.cutY 10624 (.cutX 4800 (.cutY 10560 .full .full) (.cutY 10560 .full .full)) .full))) .empty) .empty)) .empty) .empty)) .empty) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 .empty (.cutY 6144 (.cutX 11264 (.cutY 5120 (.cutX 10752 (.cutY 4608 .empty (.cutX 10496 .empty (.cutY 4864 (.cutX 10624 (.cutY 4736 .full (.cutX 10560 (.cutY 4800 .full .full) (.cutY 4800 .full .full))) (.cutY 4736 .full .full)) .empty))) .empty) .empty) .empty) .empty))) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 (.cutY 26624 .empty (.cutX 21504 .empty (.cutY 27648 .empty (.cutX 22016 .empty (.cutY 28160 (.cutX 22272 (.cutY 27904 .empty (.cutX 22144 (.cutY 28032 .full .full) (.cutY 28032 (.cutX 22208 (.cutY 27968 .full .full) (.cutY 27968 .full .full)) .full))) .empty) .empty))))) .empty) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 .empty (.cutY 22528 (.cutX 27648 .empty (.cutY 21504 .empty (.cutX 28160 (.cutY 22016 .empty (.cutX 27904 .empty (.cutY 22272 (.cutX 28032 (.cutY 22144 .full (.cutX 27968 (.cutY 22208 .full .full) (.cutY 22208 .full .full))) (.cutY 22144 .full .full)) .empty))) .empty))) .empty))) .empty) .empty))))

theorem metadata17 : 0<22259151 ∧ 18<128 ∧ 41<128 ∧ 1<4 ∧
    6181/4160=1 ∧ 6181%4160=2021 ∧ ∀ i, (leaves17 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData17).mp
    (by decide +kernel)

theorem sourceChecked17_0 : ∀ i : Fin 28,
    (fun i => output17 i = raw17 (source17 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked17 : ∀ i : Fin 28, (fun i => output17 i = raw17 (source17 i)) i :=
  forallFin_of_zero_offset (fun i => output17 i = raw17 (source17 i)) sourceChecked17_0

theorem coverChecked17_0 : ∀ i : Fin 28,
    (fun i => (output17 (cover17 i)).ContainsBox (raw17 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked17 : ∀ i : Fin 28, (fun i => (output17 (cover17 i)).ContainsBox (raw17 i)) i :=
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

noncomputable def phaseMass17 : ℝ := singlePhaseMass (22259151/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw17 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass17_eq : phaseMass17 = (22259151/1638400000000 : ℝ) := by
  unfold phaseMass17
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw17 output17 cover17 source17
    (gridTreeUnionCheck_sound 32768 raw17 output17 cover17 source17 tree17 checked17)
    _ (by norm_num) _, areaUnits17]
  norm_num

-- Frozen phase 3026, atom 7529, type 1, source (36,57).
def leavesData18 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves18 : Fin 7 → DyadicLeaf := leavesData18.get
def raw18 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 36 57 leaves18 i
def outputData18 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨9216,9344,14592,14720⟩) (.node (.single ⟨9216,9344,14720,14848⟩) (.single ⟨9344,9408,14592,14656⟩))) (.node (.node (.single ⟨9344,9408,14656,14720⟩) (.single ⟨9408,9472,14592,14656⟩)) (.node (.single ⟨9408,9472,14656,14720⟩) (.single ⟨9344,9472,14720,14848⟩)))) (.node (.node (.single ⟨14592,14720,9216,9344⟩) (.node (.single ⟨14592,14656,9344,9408⟩) (.single ⟨14592,14656,9408,9472⟩))) (.node (.node (.single ⟨14656,14720,9344,9408⟩) (.single ⟨14656,14720,9408,9472⟩)) (.node (.single ⟨14720,14848,9216,9344⟩) (.single ⟨14720,14848,9344,9472⟩))))) (.node (.node (.node (.single ⟨17920,18048,23296,23424⟩) (.node (.single ⟨17920,18048,23424,23552⟩) (.single ⟨18048,18112,23296,23360⟩))) (.node (.node (.single ⟨18048,18112,23360,23424⟩) (.single ⟨18112,18176,23296,23360⟩)) (.node (.single ⟨18112,18176,23360,23424⟩) (.single ⟨18048,18176,23424,23552⟩)))) (.node (.node (.single ⟨23296,23424,17920,18048⟩) (.node (.single ⟨23296,23360,18048,18112⟩) (.single ⟨23296,23360,18112,18176⟩))) (.node (.node (.single ⟨23360,23424,18048,18112⟩) (.single ⟨23360,23424,18112,18176⟩)) (.node (.single ⟨23424,23552,17920,18048⟩) (.single ⟨23424,23552,18048,18176⟩))))))
def output18 : Fin 28 → GridBox := outputData18.get
def coverData18 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData18 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover18 (i : Fin 28) : Fin 28 := ⟨coverData18.get i % 28, Nat.mod_lt _ (by decide)⟩
def source18 (i : Fin 28) : Fin 28 := ⟨sourceData18.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree18 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 (.cutY 14336 .empty (.cutX 9216 .empty (.cutY 15360 (.cutX 9728 (.cutY 14848 (.cutX 9472 (.cutY 14592 .empty (.cutX 9344 (.cutY 14720 .full .full) (.cutY 14720 (.cutX 9408 (.cutY 14656 .full .full) (.cutY 14656 .full .full)) .full))) .empty) .empty) .empty) .empty))) .empty)) (.cutY 12288 (.cutX 14336 .empty (.cutY 10240 (.cutX 15360 (.cutY 9216 .empty (.cutX 14848 (.cutY 9728 (.cutX 14592 .empty (.cutY 9472 (.cutX 14720 (.cutY 9344 .full (.cutX 14656 (.cutY 9408 .full .full) (.cutY 9408 .full .full))) (.cutY 9344 .full .full)) .empty)) .empty) .empty)) .empty) .empty)) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 (.cutY 22528 .empty (.cutX 17408 .empty (.cutY 23552 (.cutX 17920 .empty (.cutY 23040 .empty (.cutX 18176 (.cutY 23296 .empty (.cutX 18048 (.cutY 23424 .full .full) (.cutY 23424 (.cutX 18112 (.cutY 23360 .full .full) (.cutY 23360 .full .full)) .full))) .empty))) .empty))) .empty)) (.cutY 20480 (.cutX 22528 .empty (.cutY 18432 (.cutX 23552 (.cutY 17408 .empty (.cutX 23040 .empty (.cutY 17920 .empty (.cutX 23296 .empty (.cutY 18176 (.cutX 23424 (.cutY 18048 .full (.cutX 23360 (.cutY 18112 .full .full) (.cutY 18112 .full .full))) (.cutY 18048 .full .full)) .empty))))) .empty) .empty)) .empty)) .empty) .empty)))

theorem metadata18 : 0<168966520 ∧ 36<128 ∧ 57<128 ∧ 1<4 ∧
    7529/4160=1 ∧ 7529%4160=3369 ∧ ∀ i, (leaves18 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData18).mp
    (by decide +kernel)

theorem sourceChecked18_0 : ∀ i : Fin 28,
    (fun i => output18 i = raw18 (source18 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked18 : ∀ i : Fin 28, (fun i => output18 i = raw18 (source18 i)) i :=
  forallFin_of_zero_offset (fun i => output18 i = raw18 (source18 i)) sourceChecked18_0

theorem coverChecked18_0 : ∀ i : Fin 28,
    (fun i => (output18 (cover18 i)).ContainsBox (raw18 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked18 : ∀ i : Fin 28, (fun i => (output18 (cover18 i)).ContainsBox (raw18 i)) i :=
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

noncomputable def phaseMass18 : ℝ := singlePhaseMass (168966520/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw18 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass18_eq : phaseMass18 = (4224163/40960000000 : ℝ) := by
  unfold phaseMass18
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw18 output18 cover18 source18
    (gridTreeUnionCheck_sound 32768 raw18 output18 cover18 source18 tree18 checked18)
    _ (by norm_num) _, areaUnits18]
  norm_num

-- Frozen phase 3027, atom 7220, type 1, source (31,53).
def leavesData19 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves19 : Fin 7 → DyadicLeaf := leavesData19.get
def raw19 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 31 53 leaves19 i
def outputData19 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨7936,8064,13568,13696⟩) (.node (.single ⟨7936,8064,13696,13824⟩) (.single ⟨8064,8128,13568,13632⟩))) (.node (.node (.single ⟨8064,8128,13632,13696⟩) (.single ⟨8128,8192,13568,13632⟩)) (.node (.single ⟨8128,8192,13632,13696⟩) (.single ⟨8064,8192,13696,13824⟩)))) (.node (.node (.single ⟨13568,13696,7936,8064⟩) (.node (.single ⟨13568,13632,8064,8128⟩) (.single ⟨13568,13632,8128,8192⟩))) (.node (.node (.single ⟨13632,13696,8064,8128⟩) (.single ⟨13632,13696,8128,8192⟩)) (.node (.single ⟨13696,13824,7936,8064⟩) (.single ⟨13696,13824,8064,8192⟩))))) (.node (.node (.node (.single ⟨18944,19072,24576,24704⟩) (.node (.single ⟨18944,19072,24704,24832⟩) (.single ⟨19072,19136,24576,24640⟩))) (.node (.node (.single ⟨19072,19136,24640,24704⟩) (.single ⟨19136,19200,24576,24640⟩)) (.node (.single ⟨19136,19200,24640,24704⟩) (.single ⟨19072,19200,24704,24832⟩)))) (.node (.node (.single ⟨24576,24704,18944,19072⟩) (.node (.single ⟨24576,24640,19072,19136⟩) (.single ⟨24576,24640,19136,19200⟩))) (.node (.node (.single ⟨24640,24704,19072,19136⟩) (.single ⟨24640,24704,19136,19200⟩)) (.node (.single ⟨24704,24832,18944,19072⟩) (.single ⟨24704,24832,19072,19200⟩))))))
def output19 : Fin 28 → GridBox := outputData19.get
def coverData19 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData19 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover19 (i : Fin 28) : Fin 28 := ⟨coverData19.get i % 28, Nat.mod_lt _ (by decide)⟩
def source19 (i : Fin 28) : Fin 28 := ⟨sourceData19.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree19 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 .empty (.cutY 14336 (.cutX 7168 .empty (.cutY 13312 .empty (.cutX 7680 .empty (.cutY 13824 (.cutX 7936 .empty (.cutY 13568 .empty (.cutX 8064 (.cutY 13696 .full .full) (.cutY 13696 (.cutX 8128 (.cutY 13632 .full .full) (.cutY 13632 .full .full)) .full)))) .empty)))) .empty))))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 (.cutY 6144 .empty (.cutX 13312 .empty (.cutY 7168 .empty (.cutX 13824 (.cutY 7680 .empty (.cutX 13568 .empty (.cutY 7936 .empty (.cutX 13696 (.cutY 8064 .full (.cutX 13632 (.cutY 8128 .full .full) (.cutY 8128 .full .full))) (.cutY 8064 .full .full))))) .empty)))) .empty))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 .empty (.cutY 26624 (.cutX 19456 (.cutY 25600 (.cutX 18944 .empty (.cutY 25088 (.cutX 19200 (.cutY 24832 (.cutX 19072 (.cutY 24704 .full .full) (.cutY 24704 (.cutX 19136 (.cutY 24640 .full .full) (.cutY 24640 .full .full)) .full)) .empty) .empty) .empty)) .empty) .empty) .empty)) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 (.cutY 18432 .empty (.cutX 25600 (.cutY 19456 (.cutX 25088 (.cutY 18944 .empty (.cutX 24832 (.cutY 19200 (.cutX 24704 (.cutY 19072 .full (.cutX 24640 (.cutY 19136 .full .full) (.cutY 19136 .full .full))) (.cutY 19072 .full .full)) .empty) .empty)) .empty) .empty) .empty)) .empty) .empty) .empty) .empty))))

theorem metadata19 : 0<202650974 ∧ 31<128 ∧ 53<128 ∧ 1<4 ∧
    7220/4160=1 ∧ 7220%4160=3060 ∧ ∀ i, (leaves19 i).Valid 8 := by
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

noncomputable def phaseMass19 : ℝ := singlePhaseMass (202650974/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw19 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass19_eq : phaseMass19 = (101325487/819200000000 : ℝ) := by
  unfold phaseMass19
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw19 output19 cover19 source19
    (gridTreeUnionCheck_sound 32768 raw19 output19 cover19 source19 tree19 checked19)
    _ (by norm_num) _, areaUnits19]
  norm_num

-- Frozen phase 3028, atom 4324, type 1, source (1,37).
def leavesData20 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves20 : Fin 1 → DyadicLeaf := leavesData20.get
def raw20 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 1 37 leaves20 i
def outputData20 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨256,512,9472,9728⟩) (.single ⟨9472,9728,256,512⟩)) (.node (.single ⟨23040,23296,32256,32512⟩) (.single ⟨32256,32512,23040,23296⟩)))
def output20 : Fin 4 → GridBox := outputData20.get
def coverData20 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData20 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover20 (i : Fin 4) : Fin 4 := ⟨coverData20.get i % 4, Nat.mod_lt _ (by decide)⟩
def source20 (i : Fin 4) : Fin 4 := ⟨sourceData20.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree20 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 (.cutY 10240 (.cutX 1024 (.cutY 9216 .empty (.cutX 512 (.cutY 9728 (.cutX 256 .empty (.cutY 9472 .empty .full)) .empty) .empty)) .empty) .empty) .empty) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 (.cutX 9216 .empty (.cutY 1024 (.cutX 9728 (.cutY 512 (.cutX 9472 .empty (.cutY 256 .empty .full)) .empty) .empty) .empty)) .empty) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 .empty (.cutX 23552 (.cutY 31744 .empty (.cutX 23040 .empty (.cutY 32256 .empty (.cutX 23296 (.cutY 32512 .full .empty) .empty)))) .empty)))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 .empty (.cutY 22528 .empty (.cutX 31744 .empty (.cutY 23552 (.cutX 32256 .empty (.cutY 23040 .empty (.cutX 32512 (.cutY 23296 .full .empty) .empty))) .empty)))))) .empty))))

theorem metadata20 : 0<475523442 ∧ 1<128 ∧ 37<128 ∧ 1<4 ∧
    4324/4160=1 ∧ 4324%4160=164 ∧ ∀ i, (leaves20 i).Valid 8 := by
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

noncomputable def phaseMass20 : ℝ := singlePhaseMass (475523442/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw20 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass20_eq : phaseMass20 = (237761721/819200000000 : ℝ) := by
  unfold phaseMass20
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw20 output20 cover20 source20
    (gridTreeUnionCheck_sound 32768 raw20 output20 cover20 source20 tree20 checked20)
    _ (by norm_num) _, areaUnits20]
  norm_num

-- Frozen phase 3029, atom 1002, type 0, source (8,42).
def leavesData21 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves21 : Fin 4 → DyadicLeaf := leavesData21.get
def raw21 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 8 42 leaves21 i
def outputData21 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨2048,2176,10752,10880⟩) (.single ⟨2048,2176,10880,11008⟩)) (.node (.single ⟨2176,2304,10752,10880⟩) (.single ⟨2176,2304,10880,11008⟩))) (.node (.node (.single ⟨10752,10880,2048,2176⟩) (.single ⟨10752,10880,2176,2304⟩)) (.node (.single ⟨10880,11008,2048,2176⟩) (.single ⟨10880,11008,2176,2304⟩)))) (.node (.node (.node (.single ⟨21760,21888,30464,30592⟩) (.single ⟨21760,21888,30592,30720⟩)) (.node (.single ⟨21888,22016,30464,30592⟩) (.single ⟨21888,22016,30592,30720⟩))) (.node (.node (.single ⟨30464,30592,21760,21888⟩) (.single ⟨30464,30592,21888,22016⟩)) (.node (.single ⟨30592,30720,21760,21888⟩) (.single ⟨30592,30720,21888,22016⟩)))))
def output21 : Fin 16 → GridBox := outputData21.get
def coverData21 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData21 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover21 (i : Fin 16) : Fin 16 := ⟨coverData21.get i % 16, Nat.mod_lt _ (by decide)⟩
def source21 (i : Fin 16) : Fin 16 := ⟨sourceData21.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree21 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 .empty (.cutY 10240 .empty (.cutX 3072 (.cutY 11264 (.cutX 2560 (.cutY 10752 .empty (.cutX 2304 (.cutY 11008 (.cutX 2176 (.cutY 10880 .full .full) (.cutY 10880 .full .full)) .empty) .empty)) .empty) .empty) .empty))) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 .empty (.cutY 2048 .empty (.cutX 11264 (.cutY 3072 (.cutX 10752 .empty (.cutY 2560 (.cutX 11008 (.cutY 2304 (.cutX 10880 (.cutY 2176 .full .full) (.cutY 2176 .full .full)) .empty) .empty) .empty)) .empty) .empty))) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 (.cutY 30720 (.cutX 21504 .empty (.cutY 29696 .empty (.cutX 22016 (.cutY 30208 .empty (.cutX 21760 .empty (.cutY 30464 .empty (.cutX 21888 (.cutY 30592 .full .full) (.cutY 30592 .full .full))))) .empty))) .empty) .empty)))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 (.cutY 22528 (.cutX 29696 .empty (.cutY 21504 .empty (.cutX 30208 .empty (.cutY 22016 (.cutX 30464 .empty (.cutY 21760 .empty (.cutX 30592 (.cutY 21888 .full .full) (.cutY 21888 .full .full)))) .empty)))) .empty) .empty))) .empty))))

theorem metadata21 : 0<296697202 ∧ 8<128 ∧ 42<128 ∧ 0<4 ∧
    1002/4160=0 ∧ 1002%4160=1002 ∧ ∀ i, (leaves21 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData21).mp
    (by decide +kernel)

theorem sourceChecked21_0 : ∀ i : Fin 16,
    (fun i => output21 i = raw21 (source21 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked21 : ∀ i : Fin 16, (fun i => output21 i = raw21 (source21 i)) i :=
  forallFin_of_zero_offset (fun i => output21 i = raw21 (source21 i)) sourceChecked21_0

theorem coverChecked21_0 : ∀ i : Fin 16,
    (fun i => (output21 (cover21 i)).ContainsBox (raw21 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked21 : ∀ i : Fin 16, (fun i => (output21 (cover21 i)).ContainsBox (raw21 i)) i :=
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

noncomputable def phaseMass21 : ℝ := singlePhaseMass (296697202/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw21 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass21_eq : phaseMass21 = (148348601/819200000000 : ℝ) := by
  unfold phaseMass21
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw21 output21 cover21 source21
    (gridTreeUnionCheck_sound 32768 raw21 output21 cover21 source21 tree21 checked21)
    _ (by norm_num) _, areaUnits21]
  norm_num

-- Frozen phase 3030, atom 3429, type 0, source (37,62).
def leavesData22 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves22 : Fin 1 → DyadicLeaf := leavesData22.get
def raw22 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 37 62 leaves22 i
def outputData22 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨9472,9728,15872,16128⟩) (.single ⟨15872,16128,9472,9728⟩)) (.node (.single ⟨16640,16896,23040,23296⟩) (.single ⟨23040,23296,16640,16896⟩)))
def output22 : Fin 4 → GridBox := outputData22.get
def coverData22 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData22 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover22 (i : Fin 4) : Fin 4 := ⟨coverData22.get i % 4, Nat.mod_lt _ (by decide)⟩
def source22 (i : Fin 4) : Fin 4 := ⟨sourceData22.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree22 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 (.cutY 14336 .empty (.cutX 9216 .empty (.cutY 15360 .empty (.cutX 9728 (.cutY 15872 .empty (.cutX 9472 .empty (.cutY 16128 .full .empty))) .empty)))) .empty)) (.cutY 12288 (.cutX 14336 .empty (.cutY 10240 (.cutX 15360 .empty (.cutY 9216 .empty (.cutX 15872 .empty (.cutY 9728 (.cutX 16128 (.cutY 9472 .empty .full) .empty) .empty)))) .empty)) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 (.cutY 22528 .empty (.cutX 17408 (.cutY 23552 (.cutX 16896 (.cutY 23040 .empty (.cutX 16640 .empty (.cutY 23296 .full .empty))) .empty) .empty) .empty)) .empty)) (.cutY 20480 (.cutX 22528 .empty (.cutY 18432 (.cutX 23552 (.cutY 17408 (.cutX 23040 .empty (.cutY 16896 (.cutX 23296 (.cutY 16640 .empty .full) .empty) .empty)) .empty) .empty) .empty)) .empty)) .empty) .empty)))

theorem metadata22 : 0<200205545 ∧ 37<128 ∧ 62<128 ∧ 0<4 ∧
    3429/4160=0 ∧ 3429%4160=3429 ∧ ∀ i, (leaves22 i).Valid 8 := by
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

noncomputable def phaseMass22 : ℝ := singlePhaseMass (200205545/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw22 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass22_eq : phaseMass22 = (40041109/327680000000 : ℝ) := by
  unfold phaseMass22
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw22 output22 cover22 source22
    (gridTreeUnionCheck_sound 32768 raw22 output22 cover22 source22 tree22 checked22)
    _ (by norm_num) _, areaUnits22]
  norm_num

-- Frozen phase 3031, atom 2382, type 0, source (22,50).
def leavesData23 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves23 : Fin 1 → DyadicLeaf := leavesData23.get
def raw23 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 22 50 leaves23 i
def outputData23 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨5632,5888,12800,13056⟩) (.single ⟨12800,13056,5632,5888⟩)) (.node (.single ⟨19712,19968,26880,27136⟩) (.single ⟨26880,27136,19712,19968⟩)))
def output23 : Fin 4 → GridBox := outputData23.get
def coverData23 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData23 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover23 (i : Fin 4) : Fin 4 := ⟨coverData23.get i % 4, Nat.mod_lt _ (by decide)⟩
def source23 (i : Fin 4) : Fin 4 := ⟨sourceData23.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree23 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 (.cutY 14336 (.cutX 5120 .empty (.cutY 13312 (.cutX 5632 .empty (.cutY 12800 .empty (.cutX 5888 (.cutY 13056 .full .empty) .empty))) .empty)) .empty) .empty)))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 (.cutY 6144 (.cutX 13312 (.cutY 5120 .empty (.cutX 12800 .empty (.cutY 5632 .empty (.cutX 13056 (.cutY 5888 .full .empty) .empty)))) .empty) .empty) .empty))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 .empty (.cutY 26624 .empty (.cutX 19456 .empty (.cutY 27648 (.cutX 19968 (.cutY 27136 (.cutX 19712 .empty (.cutY 26880 .empty .full)) .empty) .empty) .empty)))) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 .empty (.cutY 18432 .empty (.cutX 27648 (.cutY 19456 .empty (.cutX 27136 (.cutY 19968 (.cutX 26880 .empty (.cutY 19712 .empty .full)) .empty) .empty)) .empty))) .empty) .empty) .empty))))

theorem metadata23 : 0<204777576 ∧ 22<128 ∧ 50<128 ∧ 0<4 ∧
    2382/4160=0 ∧ 2382%4160=2382 ∧ ∀ i, (leaves23 i).Valid 8 := by
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

noncomputable def phaseMass23 : ℝ := singlePhaseMass (204777576/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw23 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass23_eq : phaseMass23 = (25597197/204800000000 : ℝ) := by
  unfold phaseMass23
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw23 output23 cover23 source23
    (gridTreeUnionCheck_sound 32768 raw23 output23 cover23 source23 tree23 checked23)
    _ (by norm_num) _, areaUnits23]
  norm_num

-- Frozen phase 3032, atom 2855, type 0, source (28,55).
def leavesData24 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves24 : Fin 1 → DyadicLeaf := leavesData24.get
def raw24 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 28 55 leaves24 i
def outputData24 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨7168,7424,14080,14336⟩) (.single ⟨14080,14336,7168,7424⟩)) (.node (.single ⟨18432,18688,25344,25600⟩) (.single ⟨25344,25600,18432,18688⟩)))
def output24 : Fin 4 → GridBox := outputData24.get
def coverData24 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData24 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover24 (i : Fin 4) : Fin 4 := ⟨coverData24.get i % 4, Nat.mod_lt _ (by decide)⟩
def source24 (i : Fin 4) : Fin 4 := ⟨sourceData24.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree24 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 .empty (.cutY 14336 (.cutX 7168 .empty (.cutY 13312 .empty (.cutX 7680 (.cutY 13824 .empty (.cutX 7424 (.cutY 14080 .empty .full) .empty)) .empty))) .empty))))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 (.cutY 6144 .empty (.cutX 13312 .empty (.cutY 7168 .empty (.cutX 13824 .empty (.cutY 7680 (.cutX 14080 .empty (.cutY 7424 .full .empty)) .empty))))) .empty))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 .empty (.cutY 26624 (.cutX 19456 (.cutY 25600 (.cutX 18944 (.cutY 25088 .empty (.cutX 18688 (.cutY 25344 .empty .full) .empty)) .empty) .empty) .empty) .empty)) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 (.cutY 18432 .empty (.cutX 25600 (.cutY 19456 (.cutX 25088 .empty (.cutY 18944 (.cutX 25344 .empty (.cutY 18688 .full .empty)) .empty)) .empty) .empty)) .empty) .empty) .empty) .empty))))

theorem metadata24 : 0<300263580 ∧ 28<128 ∧ 55<128 ∧ 0<4 ∧
    2855/4160=0 ∧ 2855%4160=2855 ∧ ∀ i, (leaves24 i).Valid 8 := by
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

noncomputable def phaseMass24 : ℝ := singlePhaseMass (300263580/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw24 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass24_eq : phaseMass24 = (15013179/81920000000 : ℝ) := by
  unfold phaseMass24
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw24 output24 cover24 source24
    (gridTreeUnionCheck_sound 32768 raw24 output24 cover24 source24 tree24 checked24)
    _ (by norm_num) _, areaUnits24]
  norm_num

-- Frozen phase 3033, atom 3130, type 0, source (32,58).
def leavesData25 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves25 : Fin 1 → DyadicLeaf := leavesData25.get
def raw25 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 32 58 leaves25 i
def outputData25 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨8192,8448,14848,15104⟩) (.single ⟨14848,15104,8192,8448⟩)) (.node (.single ⟨17664,17920,24320,24576⟩) (.single ⟨24320,24576,17664,17920⟩)))
def output25 : Fin 4 → GridBox := outputData25.get
def coverData25 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData25 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover25 (i : Fin 4) : Fin 4 := ⟨coverData25.get i % 4, Nat.mod_lt _ (by decide)⟩
def source25 (i : Fin 4) : Fin 4 := ⟨sourceData25.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree25 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 (.cutY 14336 .empty (.cutX 9216 (.cutY 15360 (.cutX 8704 (.cutY 14848 .empty (.cutX 8448 (.cutY 15104 .full .empty) .empty)) .empty) .empty) .empty)) .empty)) (.cutY 12288 (.cutX 14336 .empty (.cutY 10240 (.cutX 15360 (.cutY 9216 (.cutX 14848 .empty (.cutY 8704 (.cutX 15104 (.cutY 8448 .full .empty) .empty) .empty)) .empty) .empty) .empty)) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 (.cutY 22528 .empty (.cutX 17408 .empty (.cutY 23552 .empty (.cutX 17920 (.cutY 24064 .empty (.cutX 17664 .empty (.cutY 24320 .empty .full))) .empty)))) .empty)) (.cutY 20480 (.cutX 22528 .empty (.cutY 18432 (.cutX 23552 .empty (.cutY 17408 .empty (.cutX 24064 .empty (.cutY 17920 (.cutX 24320 .empty (.cutY 17664 .empty .full)) .empty)))) .empty)) .empty)) .empty) .empty)))

theorem metadata25 : 0<200205545 ∧ 32<128 ∧ 58<128 ∧ 0<4 ∧
    3130/4160=0 ∧ 3130%4160=3130 ∧ ∀ i, (leaves25 i).Valid 8 := by
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

noncomputable def phaseMass25 : ℝ := singlePhaseMass (200205545/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw25 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass25_eq : phaseMass25 = (40041109/327680000000 : ℝ) := by
  unfold phaseMass25
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw25 output25 cover25 source25
    (gridTreeUnionCheck_sound 32768 raw25 output25 cover25 source25 tree25 checked25)
    _ (by norm_num) _, areaUnits25]
  norm_num

-- Frozen phase 3034, atom 2466, type 0, source (23,51).
def leavesData26 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves26 : Fin 1 → DyadicLeaf := leavesData26.get
def raw26 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 23 51 leaves26 i
def outputData26 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨5888,6144,13056,13312⟩) (.single ⟨13056,13312,5888,6144⟩)) (.node (.single ⟨19456,19712,26624,26880⟩) (.single ⟨26624,26880,19456,19712⟩)))
def output26 : Fin 4 → GridBox := outputData26.get
def coverData26 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData26 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover26 (i : Fin 4) : Fin 4 := ⟨coverData26.get i % 4, Nat.mod_lt _ (by decide)⟩
def source26 (i : Fin 4) : Fin 4 := ⟨sourceData26.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree26 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 (.cutY 14336 (.cutX 5120 .empty (.cutY 13312 (.cutX 5632 .empty (.cutY 12800 .empty (.cutX 5888 .empty (.cutY 13056 .empty .full)))) .empty)) .empty) .empty)))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 (.cutY 6144 (.cutX 13312 (.cutY 5120 .empty (.cutX 12800 .empty (.cutY 5632 .empty (.cutX 13056 .empty (.cutY 5888 .empty .full))))) .empty) .empty) .empty))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 .empty (.cutY 26624 .empty (.cutX 19456 .empty (.cutY 27648 (.cutX 19968 (.cutY 27136 (.cutX 19712 (.cutY 26880 .full .empty) .empty) .empty) .empty) .empty)))) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 .empty (.cutY 18432 .empty (.cutX 27648 (.cutY 19456 .empty (.cutX 27136 (.cutY 19968 (.cutX 26880 (.cutY 19712 .full .empty) .empty) .empty) .empty)) .empty))) .empty) .empty) .empty))))

theorem metadata26 : 0<204777576 ∧ 23<128 ∧ 51<128 ∧ 0<4 ∧
    2466/4160=0 ∧ 2466%4160=2466 ∧ ∀ i, (leaves26 i).Valid 8 := by
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

noncomputable def phaseMass26 : ℝ := singlePhaseMass (204777576/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw26 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass26_eq : phaseMass26 = (25597197/204800000000 : ℝ) := by
  unfold phaseMass26
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw26 output26 cover26 source26
    (gridTreeUnionCheck_sound 32768 raw26 output26 cover26 source26 tree26 checked26)
    _ (by norm_num) _, areaUnits26]
  norm_num

-- Frozen phase 3035, atom 537, type 0, source (4,41).
def leavesData27 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves27 : Fin 1 → DyadicLeaf := leavesData27.get
def raw27 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 4 41 leaves27 i
def outputData27 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨1024,1280,10496,10752⟩) (.single ⟨10496,10752,1024,1280⟩)) (.node (.single ⟨22016,22272,31488,31744⟩) (.single ⟨31488,31744,22016,22272⟩)))
def output27 : Fin 4 → GridBox := outputData27.get
def coverData27 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData27 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover27 (i : Fin 4) : Fin 4 := ⟨coverData27.get i % 4, Nat.mod_lt _ (by decide)⟩
def source27 (i : Fin 4) : Fin 4 := ⟨sourceData27.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree27 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 (.cutY 10240 .empty (.cutX 1024 .empty (.cutY 11264 (.cutX 1536 (.cutY 10752 (.cutX 1280 (.cutY 10496 .empty .full) .empty) .empty) .empty) .empty))) .empty) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 .empty (.cutY 2048 (.cutX 11264 (.cutY 1024 .empty (.cutX 10752 (.cutY 1536 (.cutX 10496 .empty (.cutY 1280 .full .empty)) .empty) .empty)) .empty) .empty)) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 (.cutY 30720 .empty (.cutX 21504 .empty (.cutY 31744 (.cutX 22016 .empty (.cutY 31232 .empty (.cutX 22272 (.cutY 31488 .empty .full) .empty))) .empty))) .empty)))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 .empty (.cutY 22528 (.cutX 31744 (.cutY 21504 .empty (.cutX 31232 .empty (.cutY 22016 .empty (.cutX 31488 .empty (.cutY 22272 .full .empty))))) .empty) .empty)))) .empty))))

theorem metadata27 : 0<374268468 ∧ 4<128 ∧ 41<128 ∧ 0<4 ∧
    537/4160=0 ∧ 537%4160=537 ∧ ∀ i, (leaves27 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData27).mp
    (by decide +kernel)

theorem sourceChecked27_0 : ∀ i : Fin 4,
    (fun i => output27 i = raw27 (source27 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked27 : ∀ i : Fin 4, (fun i => output27 i = raw27 (source27 i)) i :=
  forallFin_of_zero_offset (fun i => output27 i = raw27 (source27 i)) sourceChecked27_0

theorem coverChecked27_0 : ∀ i : Fin 4,
    (fun i => (output27 (cover27 i)).ContainsBox (raw27 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked27 : ∀ i : Fin 4, (fun i => (output27 (cover27 i)).ContainsBox (raw27 i)) i :=
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

noncomputable def phaseMass27 : ℝ := singlePhaseMass (374268468/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw27 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass27_eq : phaseMass27 = (93567117/409600000000 : ℝ) := by
  unfold phaseMass27
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw27 output27 cover27 source27
    (gridTreeUnionCheck_sound 32768 raw27 output27 cover27 source27 tree27 checked27)
    _ (by norm_num) _, areaUnits27]
  norm_num

-- Frozen phase 3036, atom 1436, type 0, source (12,44).
def leavesData28 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves28 : Fin 1 → DyadicLeaf := leavesData28.get
def raw28 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 12 44 leaves28 i
def outputData28 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨3072,3328,11264,11520⟩) (.single ⟨11264,11520,3072,3328⟩)) (.node (.single ⟨21248,21504,29440,29696⟩) (.single ⟨29440,29696,21248,21504⟩)))
def output28 : Fin 4 → GridBox := outputData28.get
def coverData28 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData28 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover28 (i : Fin 4) : Fin 4 := ⟨coverData28.get i % 4, Nat.mod_lt _ (by decide)⟩
def source28 (i : Fin 4) : Fin 4 := ⟨sourceData28.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree28 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 .empty (.cutY 10240 .empty (.cutX 3072 .empty (.cutY 11264 .empty (.cutX 3584 (.cutY 11776 (.cutX 3328 (.cutY 11520 .full .empty) .empty) .empty) .empty))))) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 .empty (.cutY 2048 .empty (.cutX 11264 .empty (.cutY 3072 .empty (.cutX 11776 (.cutY 3584 (.cutX 11520 (.cutY 3328 .full .empty) .empty) .empty) .empty))))) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 (.cutY 30720 (.cutX 21504 (.cutY 29696 (.cutX 20992 .empty (.cutY 29184 .empty (.cutX 21248 .empty (.cutY 29440 .empty .full)))) .empty) .empty) .empty) .empty)))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 (.cutY 22528 (.cutX 29696 (.cutY 21504 (.cutX 29184 .empty (.cutY 20992 .empty (.cutX 29440 .empty (.cutY 21248 .empty .full)))) .empty) .empty) .empty) .empty))) .empty))))

theorem metadata28 : 0<296697202 ∧ 12<128 ∧ 44<128 ∧ 0<4 ∧
    1436/4160=0 ∧ 1436%4160=1436 ∧ ∀ i, (leaves28 i).Valid 8 := by
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

noncomputable def phaseMass28 : ℝ := singlePhaseMass (296697202/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw28 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass28_eq : phaseMass28 = (148348601/819200000000 : ℝ) := by
  unfold phaseMass28
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw28 output28 cover28 source28
    (gridTreeUnionCheck_sound 32768 raw28 output28 cover28 source28 tree28 checked28)
    _ (by norm_num) _, areaUnits28]
  norm_num

-- Frozen phase 3037, atom 1223, type 0, source (10,43).
def leavesData29 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves29 : Fin 4 → DyadicLeaf := leavesData29.get
def raw29 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 10 43 leaves29 i
def outputData29 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨2560,2688,11008,11136⟩) (.single ⟨2560,2688,11136,11264⟩)) (.node (.single ⟨2688,2816,11008,11136⟩) (.single ⟨2688,2816,11136,11264⟩))) (.node (.node (.single ⟨11008,11136,2560,2688⟩) (.single ⟨11008,11136,2688,2816⟩)) (.node (.single ⟨11136,11264,2560,2688⟩) (.single ⟨11136,11264,2688,2816⟩)))) (.node (.node (.node (.single ⟨21504,21632,29952,30080⟩) (.single ⟨21504,21632,30080,30208⟩)) (.node (.single ⟨21632,21760,29952,30080⟩) (.single ⟨21632,21760,30080,30208⟩))) (.node (.node (.single ⟨29952,30080,21504,21632⟩) (.single ⟨29952,30080,21632,21760⟩)) (.node (.single ⟨30080,30208,21504,21632⟩) (.single ⟨30080,30208,21632,21760⟩)))))
def output29 : Fin 16 → GridBox := outputData29.get
def coverData29 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData29 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover29 (i : Fin 16) : Fin 16 := ⟨coverData29.get i % 16, Nat.mod_lt _ (by decide)⟩
def source29 (i : Fin 16) : Fin 16 := ⟨sourceData29.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree29 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 .empty (.cutY 10240 .empty (.cutX 3072 (.cutY 11264 (.cutX 2560 .empty (.cutY 10752 .empty (.cutX 2816 (.cutY 11008 .empty (.cutX 2688 (.cutY 11136 .full .full) (.cutY 11136 .full .full))) .empty))) .empty) .empty))) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 .empty (.cutY 2048 .empty (.cutX 11264 (.cutY 3072 (.cutX 10752 .empty (.cutY 2560 .empty (.cutX 11008 .empty (.cutY 2816 (.cutX 11136 (.cutY 2688 .full .full) (.cutY 2688 .full .full)) .empty)))) .empty) .empty))) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 (.cutY 30720 (.cutX 21504 .empty (.cutY 29696 .empty (.cutX 22016 (.cutY 30208 (.cutX 21760 (.cutY 29952 .empty (.cutX 21632 (.cutY 30080 .full .full) (.cutY 30080 .full .full))) .empty) .empty) .empty))) .empty) .empty)))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 (.cutY 22528 (.cutX 29696 .empty (.cutY 21504 .empty (.cutX 30208 (.cutY 22016 (.cutX 29952 .empty (.cutY 21760 (.cutX 30080 (.cutY 21632 .full .full) (.cutY 21632 .full .full)) .empty)) .empty) .empty))) .empty) .empty))) .empty))))

theorem metadata29 : 0<296697202 ∧ 10<128 ∧ 43<128 ∧ 0<4 ∧
    1223/4160=0 ∧ 1223%4160=1223 ∧ ∀ i, (leaves29 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData29).mp
    (by decide +kernel)

theorem sourceChecked29_0 : ∀ i : Fin 16,
    (fun i => output29 i = raw29 (source29 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked29 : ∀ i : Fin 16, (fun i => output29 i = raw29 (source29 i)) i :=
  forallFin_of_zero_offset (fun i => output29 i = raw29 (source29 i)) sourceChecked29_0

theorem coverChecked29_0 : ∀ i : Fin 16,
    (fun i => (output29 (cover29 i)).ContainsBox (raw29 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked29 : ∀ i : Fin 16, (fun i => (output29 (cover29 i)).ContainsBox (raw29 i)) i :=
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

noncomputable def phaseMass29 : ℝ := singlePhaseMass (296697202/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw29 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass29_eq : phaseMass29 = (148348601/819200000000 : ℝ) := by
  unfold phaseMass29
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw29 output29 cover29 source29
    (gridTreeUnionCheck_sound 32768 raw29 output29 cover29 source29 tree29 checked29)
    _ (by norm_num) _, areaUnits29]
  norm_num

-- Frozen phase 3038, atom 1933, type 0, source (17,46).
def leavesData30 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves30 : Fin 4 → DyadicLeaf := leavesData30.get
def raw30 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 17 46 leaves30 i
def outputData30 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨4352,4480,11776,11904⟩) (.single ⟨4352,4480,11904,12032⟩)) (.node (.single ⟨4480,4608,11776,11904⟩) (.single ⟨4480,4608,11904,12032⟩))) (.node (.node (.single ⟨11776,11904,4352,4480⟩) (.single ⟨11776,11904,4480,4608⟩)) (.node (.single ⟨11904,12032,4352,4480⟩) (.single ⟨11904,12032,4480,4608⟩)))) (.node (.node (.node (.single ⟨20736,20864,28160,28288⟩) (.single ⟨20736,20864,28288,28416⟩)) (.node (.single ⟨20864,20992,28160,28288⟩) (.single ⟨20864,20992,28288,28416⟩))) (.node (.node (.single ⟨28160,28288,20736,20864⟩) (.single ⟨28160,28288,20864,20992⟩)) (.node (.single ⟨28288,28416,20736,20864⟩) (.single ⟨28288,28416,20864,20992⟩)))))
def output30 : Fin 16 → GridBox := outputData30.get
def coverData30 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData30 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover30 (i : Fin 16) : Fin 16 := ⟨coverData30.get i % 16, Nat.mod_lt _ (by decide)⟩
def source30 (i : Fin 16) : Fin 16 := ⟨sourceData30.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree30 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 (.cutY 10240 .empty (.cutX 5120 (.cutY 11264 .empty (.cutX 4608 (.cutY 11776 .empty (.cutX 4352 .empty (.cutY 12032 (.cutX 4480 (.cutY 11904 .full .full) (.cutY 11904 .full .full)) .empty))) .empty)) .empty)) .empty) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 .empty (.cutY 6144 (.cutX 11264 .empty (.cutY 5120 (.cutX 11776 .empty (.cutY 4608 (.cutX 12032 (.cutY 4352 .empty (.cutX 11904 (.cutY 4480 .full .full) (.cutY 4480 .full .full))) .empty) .empty)) .empty)) .empty))) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 (.cutY 26624 .empty (.cutX 21504 (.cutY 27648 .empty (.cutX 20992 (.cutY 28160 .empty (.cutX 20736 .empty (.cutY 28416 (.cutX 20864 (.cutY 28288 .full .full) (.cutY 28288 .full .full)) .empty))) .empty)) .empty)) .empty) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 .empty (.cutY 22528 (.cutX 27648 .empty (.cutY 21504 (.cutX 28160 .empty (.cutY 20992 (.cutX 28416 (.cutY 20736 .empty (.cutX 28288 (.cutY 20864 .full .full) (.cutY 20864 .full .full))) .empty) .empty)) .empty)) .empty))) .empty) .empty))))

theorem metadata30 : 0<73667111 ∧ 17<128 ∧ 46<128 ∧ 0<4 ∧
    1933/4160=0 ∧ 1933%4160=1933 ∧ ∀ i, (leaves30 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData30).mp
    (by decide +kernel)

theorem sourceChecked30_0 : ∀ i : Fin 16,
    (fun i => output30 i = raw30 (source30 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked30 : ∀ i : Fin 16, (fun i => output30 i = raw30 (source30 i)) i :=
  forallFin_of_zero_offset (fun i => output30 i = raw30 (source30 i)) sourceChecked30_0

theorem coverChecked30_0 : ∀ i : Fin 16,
    (fun i => (output30 (cover30 i)).ContainsBox (raw30 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked30 : ∀ i : Fin 16, (fun i => (output30 (cover30 i)).ContainsBox (raw30 i)) i :=
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

noncomputable def phaseMass30 : ℝ := singlePhaseMass (73667111/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw30 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass30_eq : phaseMass30 = (73667111/1638400000000 : ℝ) := by
  unfold phaseMass30
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw30 output30 cover30 source30
    (gridTreeUnionCheck_sound 32768 raw30 output30 cover30 source30 tree30 checked30)
    _ (by norm_num) _, areaUnits30]
  norm_num

-- Frozen phase 3039, atom 2548, type 0, source (24,52).
def leavesData31 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves31 : Fin 1 → DyadicLeaf := leavesData31.get
def raw31 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 24 52 leaves31 i
def outputData31 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨6144,6400,13312,13568⟩) (.single ⟨13312,13568,6144,6400⟩)) (.node (.single ⟨19200,19456,26368,26624⟩) (.single ⟨26368,26624,19200,19456⟩)))
def output31 : Fin 4 → GridBox := outputData31.get
def coverData31 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData31 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover31 (i : Fin 4) : Fin 4 := ⟨coverData31.get i % 4, Nat.mod_lt _ (by decide)⟩
def source31 (i : Fin 4) : Fin 4 := ⟨sourceData31.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree31 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 .empty (.cutY 14336 (.cutX 7168 (.cutY 13312 .empty (.cutX 6656 (.cutY 13824 (.cutX 6400 (.cutY 13568 .full .empty) .empty) .empty) .empty)) .empty) .empty))))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 (.cutY 6144 .empty (.cutX 13312 .empty (.cutY 7168 (.cutX 13824 (.cutY 6656 (.cutX 13568 (.cutY 6400 .full .empty) .empty) .empty) .empty) .empty))) .empty))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 .empty (.cutY 26624 (.cutX 19456 (.cutY 25600 .empty (.cutX 18944 .empty (.cutY 26112 .empty (.cutX 19200 .empty (.cutY 26368 .empty .full))))) .empty) .empty)) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 (.cutY 18432 .empty (.cutX 25600 .empty (.cutY 19456 (.cutX 26112 .empty (.cutY 18944 .empty (.cutX 26368 .empty (.cutY 19200 .empty .full)))) .empty))) .empty) .empty) .empty) .empty))))

theorem metadata31 : 0<300263580 ∧ 24<128 ∧ 52<128 ∧ 0<4 ∧
    2548/4160=0 ∧ 2548%4160=2548 ∧ ∀ i, (leaves31 i).Valid 8 := by
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

noncomputable def phaseMass31 : ℝ := singlePhaseMass (300263580/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw31 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass31_eq : phaseMass31 = (15013179/81920000000 : ℝ) := by
  unfold phaseMass31
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw31 output31 cover31 source31
    (gridTreeUnionCheck_sound 32768 raw31 output31 cover31 source31 tree31 checked31)
    _ (by norm_num) _, areaUnits31]
  norm_num

-- Frozen phase 3040, atom 1641, type 0, source (14,45).
def leavesData32 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves32 : Fin 4 → DyadicLeaf := leavesData32.get
def raw32 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 14 45 leaves32 i
def outputData32 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨3584,3712,11520,11648⟩) (.single ⟨3584,3712,11648,11776⟩)) (.node (.single ⟨3712,3840,11520,11648⟩) (.single ⟨3712,3840,11648,11776⟩))) (.node (.node (.single ⟨11520,11648,3584,3712⟩) (.single ⟨11520,11648,3712,3840⟩)) (.node (.single ⟨11648,11776,3584,3712⟩) (.single ⟨11648,11776,3712,3840⟩)))) (.node (.node (.node (.single ⟨20992,21120,28928,29056⟩) (.single ⟨20992,21120,29056,29184⟩)) (.node (.single ⟨21120,21248,28928,29056⟩) (.single ⟨21120,21248,29056,29184⟩))) (.node (.node (.single ⟨28928,29056,20992,21120⟩) (.single ⟨28928,29056,21120,21248⟩)) (.node (.single ⟨29056,29184,20992,21120⟩) (.single ⟨29056,29184,21120,21248⟩)))))
def output32 : Fin 16 → GridBox := outputData32.get
def coverData32 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData32 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover32 (i : Fin 16) : Fin 16 := ⟨coverData32.get i % 16, Nat.mod_lt _ (by decide)⟩
def source32 (i : Fin 16) : Fin 16 := ⟨sourceData32.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree32 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 .empty (.cutY 10240 .empty (.cutX 3072 .empty (.cutY 11264 .empty (.cutX 3584 .empty (.cutY 11776 (.cutX 3840 (.cutY 11520 .empty (.cutX 3712 (.cutY 11648 .full .full) (.cutY 11648 .full .full))) .empty) .empty)))))) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 .empty (.cutY 2048 .empty (.cutX 11264 .empty (.cutY 3072 .empty (.cutX 11776 (.cutY 3584 .empty (.cutX 11520 .empty (.cutY 3840 (.cutX 11648 (.cutY 3712 .full .full) (.cutY 3712 .full .full)) .empty))) .empty))))) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 (.cutY 30720 (.cutX 21504 (.cutY 29696 (.cutX 20992 .empty (.cutY 29184 (.cutX 21248 (.cutY 28928 .empty (.cutX 21120 (.cutY 29056 .full .full) (.cutY 29056 .full .full))) .empty) .empty)) .empty) .empty) .empty) .empty)))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 (.cutY 22528 (.cutX 29696 (.cutY 21504 (.cutX 29184 (.cutY 20992 .empty (.cutX 28928 .empty (.cutY 21248 (.cutX 29056 (.cutY 21120 .full .full) (.cutY 21120 .full .full)) .empty))) .empty) .empty) .empty) .empty) .empty))) .empty))))

theorem metadata32 : 0<296697202 ∧ 14<128 ∧ 45<128 ∧ 0<4 ∧
    1641/4160=0 ∧ 1641%4160=1641 ∧ ∀ i, (leaves32 i).Valid 8 := by
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

noncomputable def phaseMass32 : ℝ := singlePhaseMass (296697202/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw32 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass32_eq : phaseMass32 = (148348601/819200000000 : ℝ) := by
  unfold phaseMass32
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw32 output32 cover32 source32
    (gridTreeUnionCheck_sound 32768 raw32 output32 cover32 source32 tree32 checked32)
    _ (by norm_num) _, areaUnits32]
  norm_num

-- Frozen phase 3041, atom 4573, type 1, source (3,38).
def leavesData33 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves33 : Fin 4 → DyadicLeaf := leavesData33.get
def raw33 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 3 38 leaves33 i
def outputData33 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨768,896,9728,9856⟩) (.single ⟨768,896,9856,9984⟩)) (.node (.single ⟨896,1024,9728,9856⟩) (.single ⟨896,1024,9856,9984⟩))) (.node (.node (.single ⟨9728,9856,768,896⟩) (.single ⟨9728,9856,896,1024⟩)) (.node (.single ⟨9856,9984,768,896⟩) (.single ⟨9856,9984,896,1024⟩)))) (.node (.node (.node (.single ⟨22784,22912,31744,31872⟩) (.single ⟨22784,22912,31872,32000⟩)) (.node (.single ⟨22912,23040,31744,31872⟩) (.single ⟨22912,23040,31872,32000⟩))) (.node (.node (.single ⟨31744,31872,22784,22912⟩) (.single ⟨31744,31872,22912,23040⟩)) (.node (.single ⟨31872,32000,22784,22912⟩) (.single ⟨31872,32000,22912,23040⟩)))))
def output33 : Fin 16 → GridBox := outputData33.get
def coverData33 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData33 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover33 (i : Fin 16) : Fin 16 := ⟨coverData33.get i % 16, Nat.mod_lt _ (by decide)⟩
def source33 (i : Fin 16) : Fin 16 := ⟨sourceData33.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree33 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 (.cutY 10240 (.cutX 1024 (.cutY 9216 .empty (.cutX 512 .empty (.cutY 9728 .empty (.cutX 768 .empty (.cutY 9984 (.cutX 896 (.cutY 9856 .full .full) (.cutY 9856 .full .full)) .empty))))) .empty) .empty) .empty) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 (.cutX 9216 .empty (.cutY 1024 (.cutX 9728 .empty (.cutY 512 .empty (.cutX 9984 (.cutY 768 .empty (.cutX 9856 (.cutY 896 .full .full) (.cutY 896 .full .full))) .empty))) .empty)) .empty) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 .empty (.cutX 23552 (.cutY 31744 .empty (.cutX 23040 (.cutY 32256 (.cutX 22784 .empty (.cutY 32000 (.cutX 22912 (.cutY 31872 .full .full) (.cutY 31872 .full .full)) .empty)) .empty) .empty)) .empty)))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 .empty (.cutY 22528 .empty (.cutX 31744 .empty (.cutY 23552 (.cutX 32256 (.cutY 23040 (.cutX 32000 (.cutY 22784 .empty (.cutX 31872 (.cutY 22912 .full .full) (.cutY 22912 .full .full))) .empty) .empty) .empty) .empty)))))) .empty))))

theorem metadata33 : 0<475523442 ∧ 3<128 ∧ 38<128 ∧ 1<4 ∧
    4573/4160=1 ∧ 4573%4160=413 ∧ ∀ i, (leaves33 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData33).mp
    (by decide +kernel)

theorem sourceChecked33_0 : ∀ i : Fin 16,
    (fun i => output33 i = raw33 (source33 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked33 : ∀ i : Fin 16, (fun i => output33 i = raw33 (source33 i)) i :=
  forallFin_of_zero_offset (fun i => output33 i = raw33 (source33 i)) sourceChecked33_0

theorem coverChecked33_0 : ∀ i : Fin 16,
    (fun i => (output33 (cover33 i)).ContainsBox (raw33 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked33 : ∀ i : Fin 16, (fun i => (output33 (cover33 i)).ContainsBox (raw33 i)) i :=
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

noncomputable def phaseMass33 : ℝ := singlePhaseMass (475523442/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw33 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass33_eq : phaseMass33 = (237761721/819200000000 : ℝ) := by
  unfold phaseMass33
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw33 output33 cover33 source33
    (gridTreeUnionCheck_sound 32768 raw33 output33 cover33 source33 tree33 checked33)
    _ (by norm_num) _, areaUnits33]
  norm_num

-- Frozen phase 3042, atom 3632, type 0, source (41,65).
def leavesData34 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves34 : Fin 1 → DyadicLeaf := leavesData34.get
def raw34 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 41 65 leaves34 i
def outputData34 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨10496,10752,16640,16896⟩) (.single ⟨15872,16128,22016,22272⟩)) (.node (.single ⟨16640,16896,10496,10752⟩) (.single ⟨22016,22272,15872,16128⟩)))
def output34 : Fin 4 → GridBox := outputData34.get
def coverData34 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 2)) (.node (.single 3) (.single 1)))
def sourceData34 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 3)) (.node (.single 1) (.single 2)))
def cover34 (i : Fin 4) : Fin 4 := ⟨coverData34.get i % 4, Nat.mod_lt _ (by decide)⟩
def source34 (i : Fin 4) : Fin 4 := ⟨sourceData34.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree34 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 .empty (.cutY 18432 (.cutX 11264 (.cutY 17408 (.cutX 10752 (.cutY 16896 (.cutX 10496 .empty (.cutY 16640 .empty .full)) .empty) .empty) .empty) .empty) .empty)) .empty) (.cutY 20480 .empty (.cutX 14336 .empty (.cutY 22528 (.cutX 15360 .empty (.cutY 21504 .empty (.cutX 15872 .empty (.cutY 22016 .empty (.cutX 16128 (.cutY 22272 .full .empty) .empty))))) .empty)))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 (.cutY 10240 .empty (.cutX 17408 (.cutY 11264 (.cutX 16896 (.cutY 10752 (.cutX 16640 .empty (.cutY 10496 .empty .full)) .empty) .empty) .empty) .empty)) .empty) .empty) (.cutY 12288 .empty (.cutX 22528 (.cutY 14336 .empty (.cutX 21504 .empty (.cutY 15360 .empty (.cutX 22016 .empty (.cutY 15872 .empty (.cutX 22272 (.cutY 16128 .full .empty) .empty)))))) .empty)))) .empty) .empty))

theorem metadata34 : 0<20837145 ∧ 41<128 ∧ 65<128 ∧ 0<4 ∧
    3632/4160=0 ∧ 3632%4160=3632 ∧ ∀ i, (leaves34 i).Valid 8 := by
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

noncomputable def phaseMass34 : ℝ := singlePhaseMass (20837145/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw34 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass34_eq : phaseMass34 = (4167429/327680000000 : ℝ) := by
  unfold phaseMass34
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw34 output34 cover34 source34
    (gridTreeUnionCheck_sound 32768 raw34 output34 cover34 source34 tree34 checked34)
    _ (by norm_num) _, areaUnits34]
  norm_num

-- Frozen phase 3043, atom 5269, type 1, source (9,38).
def leavesData35 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves35 : Fin 10 → DyadicLeaf := leavesData35.get
def raw35 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 9 38 leaves35 i
def outputData35 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨2304,2368,9728,9792⟩) (.single ⟨2304,2368,9792,9856⟩)) (.node (.single ⟨2368,2432,9728,9792⟩) (.node (.single ⟨2368,2432,9792,9856⟩) (.single ⟨2304,2432,9856,9984⟩)))) (.node (.node (.single ⟨2432,2496,9728,9792⟩) (.single ⟨2432,2496,9792,9856⟩)) (.node (.single ⟨2496,2560,9728,9792⟩) (.node (.single ⟨2496,2560,9792,9856⟩) (.single ⟨2432,2560,9856,9984⟩))))) (.node (.node (.node (.single ⟨9728,9792,2304,2368⟩) (.single ⟨9728,9792,2368,2432⟩)) (.node (.single ⟨9792,9856,2304,2368⟩) (.node (.single ⟨9792,9856,2368,2432⟩) (.single ⟨9728,9792,2432,2496⟩)))) (.node (.node (.single ⟨9728,9792,2496,2560⟩) (.single ⟨9792,9856,2432,2496⟩)) (.node (.single ⟨9792,9856,2496,2560⟩) (.node (.single ⟨9856,9984,2304,2432⟩) (.single ⟨9856,9984,2432,2560⟩)))))) (.node (.node (.node (.node (.single ⟨22784,22912,30208,30336⟩) (.single ⟨22784,22912,30336,30464⟩)) (.node (.single ⟨22912,22976,30208,30272⟩) (.node (.single ⟨22912,22976,30272,30336⟩) (.single ⟨22976,23040,30208,30272⟩)))) (.node (.node (.single ⟨22976,23040,30272,30336⟩) (.single ⟨22912,22976,30336,30400⟩)) (.node (.single ⟨22912,22976,30400,30464⟩) (.node (.single ⟨22976,23040,30336,30400⟩) (.single ⟨22976,23040,30400,30464⟩))))) (.node (.node (.node (.single ⟨30208,30336,22784,22912⟩) (.single ⟨30208,30272,22912,22976⟩)) (.node (.single ⟨30208,30272,22976,23040⟩) (.node (.single ⟨30272,30336,22912,22976⟩) (.single ⟨30272,30336,22976,23040⟩)))) (.node (.node (.single ⟨30336,30464,22784,22912⟩) (.single ⟨30336,30400,22912,22976⟩)) (.node (.single ⟨30336,30400,22976,23040⟩) (.node (.single ⟨30400,30464,22912,22976⟩) (.single ⟨30400,30464,22976,23040⟩)))))))
def output35 : Fin 40 → GridBox := outputData35.get
def coverData35 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 18)) (.node (.single 35) (.node (.single 21) (.single 9)))) (.node (.node (.single 19) (.single 30)) (.node (.single 20) (.node (.single 5) (.single 14))))) (.node (.node (.node (.single 34) (.single 25)) (.node (.single 6) (.node (.single 16) (.single 33)))) (.node (.node (.single 23) (.single 7)) (.node (.single 15) (.node (.single 32) (.single 24)))))) (.node (.node (.node (.node (.single 8) (.single 17)) (.node (.single 31) (.node (.single 22) (.single 0)))) (.node (.node (.single 10) (.single 39)) (.node (.single 29) (.node (.single 1) (.single 12))))) (.node (.node (.node (.single 38) (.single 27)) (.node (.single 2) (.node (.single 11) (.single 37)))) (.node (.node (.single 28) (.single 3)) (.node (.single 13) (.node (.single 36) (.single 26)))))))
def sourceData35 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover35 (i : Fin 40) : Fin 40 := ⟨coverData35.get i % 40, Nat.mod_lt _ (by decide)⟩
def source35 (i : Fin 40) : Fin 40 := ⟨sourceData35.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree35 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 .empty (.cutY 10240 (.cutX 3072 (.cutY 9216 .empty (.cutX 2560 (.cutY 9728 .empty (.cutX 2304 .empty (.cutY 9984 (.cutX 2432 (.cutY 9856 (.cutX 2368 (.cutY 9792 .full .full) (.cutY 9792 .full .full)) .full) (.cutY 9856 (.cutX 2496 (.cutY 9792 .full .full) (.cutY 9792 .full .full)) .full)) .empty))) .empty)) .empty) .empty)) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 .empty (.cutX 9216 .empty (.cutY 3072 (.cutX 9728 .empty (.cutY 2560 (.cutX 9984 (.cutY 2304 .empty (.cutX 9856 (.cutY 2432 (.cutX 9792 (.cutY 2368 .full .full) (.cutY 2368 .full .full)) (.cutX 9792 (.cutY 2496 .full .full) (.cutY 2496 .full .full))) (.cutY 2432 .full .full))) .empty) .empty)) .empty))) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 (.cutX 23552 (.cutY 29696 .empty (.cutX 23040 (.cutY 30208 .empty (.cutX 22784 .empty (.cutY 30464 (.cutX 22912 (.cutY 30336 .full .full) (.cutY 30336 (.cutX 22976 (.cutY 30272 .full .full) (.cutY 30272 .full .full)) (.cutX 22976 (.cutY 30400 .full .full) (.cutY 30400 .full .full)))) .empty))) .empty)) .empty) .empty))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 (.cutY 22528 .empty (.cutX 29696 .empty (.cutY 23552 (.cutX 30208 .empty (.cutY 23040 (.cutX 30464 (.cutY 22784 .empty (.cutX 30336 (.cutY 22912 .full (.cutX 30272 (.cutY 22976 .full .full) (.cutY 22976 .full .full))) (.cutY 22912 .full (.cutX 30400 (.cutY 22976 .full .full) (.cutY 22976 .full .full))))) .empty) .empty)) .empty))) .empty))) .empty))))

theorem metadata35 : 0<190129790 ∧ 9<128 ∧ 38<128 ∧ 1<4 ∧
    5269/4160=1 ∧ 5269%4160=1109 ∧ ∀ i, (leaves35 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData35).mp
    (by decide +kernel)

theorem sourceChecked35_0 : ∀ i : Fin 40,
    (fun i => output35 i = raw35 (source35 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked35 : ∀ i : Fin 40, (fun i => output35 i = raw35 (source35 i)) i :=
  forallFin_of_zero_offset (fun i => output35 i = raw35 (source35 i)) sourceChecked35_0

theorem coverChecked35_0 : ∀ i : Fin 40,
    (fun i => (output35 (cover35 i)).ContainsBox (raw35 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked35 : ∀ i : Fin 40, (fun i => (output35 (cover35 i)).ContainsBox (raw35 i)) i :=
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

noncomputable def phaseMass35 : ℝ := singlePhaseMass (190129790/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw35 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass35_eq : phaseMass35 = (19012979/163840000000 : ℝ) := by
  unfold phaseMass35
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw35 output35 cover35 source35
    (gridTreeUnionCheck_sound 32768 raw35 output35 cover35 source35 tree35 checked35)
    _ (by norm_num) _, areaUnits35]
  norm_num

-- Frozen phase 3044, atom 5591, type 1, source (12,39).
def leavesData36 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves36 : Fin 7 → DyadicLeaf := leavesData36.get
def raw36 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 12 39 leaves36 i
def outputData36 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3072,3200,9984,10112⟩) (.node (.single ⟨3072,3200,10112,10240⟩) (.single ⟨3200,3264,9984,10048⟩))) (.node (.node (.single ⟨3200,3264,10048,10112⟩) (.single ⟨3264,3328,9984,10048⟩)) (.node (.single ⟨3264,3328,10048,10112⟩) (.single ⟨3200,3328,10112,10240⟩)))) (.node (.node (.single ⟨9984,10112,3072,3200⟩) (.node (.single ⟨9984,10048,3200,3264⟩) (.single ⟨9984,10048,3264,3328⟩))) (.node (.node (.single ⟨10048,10112,3200,3264⟩) (.single ⟨10048,10112,3264,3328⟩)) (.node (.single ⟨10112,10240,3072,3200⟩) (.single ⟨10112,10240,3200,3328⟩))))) (.node (.node (.node (.single ⟨22528,22656,29440,29568⟩) (.node (.single ⟨22528,22656,29568,29696⟩) (.single ⟨22656,22720,29440,29504⟩))) (.node (.node (.single ⟨22656,22720,29504,29568⟩) (.single ⟨22720,22784,29440,29504⟩)) (.node (.single ⟨22720,22784,29504,29568⟩) (.single ⟨22656,22784,29568,29696⟩)))) (.node (.node (.single ⟨29440,29568,22528,22656⟩) (.node (.single ⟨29440,29504,22656,22720⟩) (.single ⟨29440,29504,22720,22784⟩))) (.node (.node (.single ⟨29504,29568,22656,22720⟩) (.single ⟨29504,29568,22720,22784⟩)) (.node (.single ⟨29568,29696,22528,22656⟩) (.single ⟨29568,29696,22656,22784⟩))))))
def output36 : Fin 28 → GridBox := outputData36.get
def coverData36 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData36 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover36 (i : Fin 28) : Fin 28 := ⟨coverData36.get i % 28, Nat.mod_lt _ (by decide)⟩
def source36 (i : Fin 28) : Fin 28 := ⟨sourceData36.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree36 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 .empty (.cutY 10240 (.cutX 3072 .empty (.cutY 9216 .empty (.cutX 3584 (.cutY 9728 .empty (.cutX 3328 (.cutY 9984 .empty (.cutX 3200 (.cutY 10112 .full .full) (.cutY 10112 (.cutX 3264 (.cutY 10048 .full .full) (.cutY 10048 .full .full)) .full))) .empty)) .empty))) .empty)) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 .empty (.cutX 9216 .empty (.cutY 3072 .empty (.cutX 9728 .empty (.cutY 3584 (.cutX 9984 .empty (.cutY 3328 (.cutX 10112 (.cutY 3200 .full (.cutX 10048 (.cutY 3264 .full .full) (.cutY 3264 .full .full))) (.cutY 3200 .full .full)) .empty)) .empty))))) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 (.cutX 23552 (.cutY 29696 (.cutX 23040 (.cutY 29184 .empty (.cutX 22784 (.cutY 29440 .empty (.cutX 22656 (.cutY 29568 .full .full) (.cutY 29568 (.cutX 22720 (.cutY 29504 .full .full) (.cutY 29504 .full .full)) .full))) .empty)) .empty) .empty) .empty) .empty))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 (.cutY 22528 .empty (.cutX 29696 (.cutY 23552 (.cutX 29184 .empty (.cutY 23040 (.cutX 29440 .empty (.cutY 22784 (.cutX 29568 (.cutY 22656 .full (.cutX 29504 (.cutY 22720 .full .full) (.cutY 22720 .full .full))) (.cutY 22656 .full .full)) .empty)) .empty)) .empty) .empty)) .empty))) .empty))))

theorem metadata36 : 0<190129790 ∧ 12<128 ∧ 39<128 ∧ 1<4 ∧
    5591/4160=1 ∧ 5591%4160=1431 ∧ ∀ i, (leaves36 i).Valid 8 := by
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

noncomputable def phaseMass36 : ℝ := singlePhaseMass (190129790/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw36 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass36_eq : phaseMass36 = (19012979/163840000000 : ℝ) := by
  unfold phaseMass36
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw36 output36 cover36 source36
    (gridTreeUnionCheck_sound 32768 raw36 output36 cover36 source36 tree36 checked36)
    _ (by norm_num) _, areaUnits36]
  norm_num

-- Frozen phase 3045, atom 5895, type 1, source (15,40).
def leavesData37 : FiniteInputTree DyadicLeaf 28 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,0⟩))) (.node (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,1⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩)))) (.node (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,1⟩) (.single ⟨3,2,0⟩))) (.node (.node (.single ⟨3,2,1⟩) (.single ⟨3,3,0⟩)) (.node (.single ⟨3,3,1⟩) (.single ⟨3,4,0⟩))))) (.node (.node (.node (.single ⟨3,4,1⟩) (.node (.single ⟨3,5,1⟩) (.single ⟨4,12,0⟩))) (.node (.node (.single ⟨4,12,1⟩) (.single ⟨4,13,0⟩)) (.node (.single ⟨4,13,1⟩) (.single ⟨4,14,0⟩)))) (.node (.node (.single ⟨4,14,1⟩) (.node (.single ⟨4,15,0⟩) (.single ⟨4,15,1⟩))) (.node (.node (.single ⟨4,10,0⟩) (.single ⟨4,10,1⟩)) (.node (.single ⟨4,11,0⟩) (.single ⟨4,11,1⟩))))))
def leaves37 : Fin 28 → DyadicLeaf := leavesData37.get
def raw37 (i : Fin 112) : GridBox := phaseImageBoxes 32768 8 15 40 leaves37 i
def outputData37 : FiniteInputTree GridBox 112 := (.node (.node (.node (.node (.node (.node (.single ⟨3840,3904,10240,10304⟩) (.node (.single ⟨3840,3904,10304,10368⟩) (.single ⟨3904,3936,10240,10272⟩))) (.node (.node (.single ⟨3904,3936,10272,10304⟩) (.single ⟨3936,3968,10240,10272⟩)) (.node (.single ⟨3936,3968,10272,10304⟩) (.single ⟨3904,3968,10304,10368⟩)))) (.node (.node (.single ⟨3840,3968,10368,10496⟩) (.node (.single ⟨3968,4000,10240,10272⟩) (.single ⟨3968,4000,10272,10304⟩))) (.node (.node (.single ⟨4000,4016,10240,10256⟩) (.single ⟨4000,4016,10256,10272⟩)) (.node (.single ⟨4016,4032,10240,10256⟩) (.single ⟨4016,4032,10256,10272⟩))))) (.node (.node (.node (.single ⟨4000,4032,10272,10304⟩) (.node (.single ⟨3968,4032,10304,10368⟩) (.single ⟨4032,4048,10240,10256⟩))) (.node (.node (.single ⟨4032,4048,10256,10272⟩) (.single ⟨4048,4064,10240,10256⟩)) (.node (.single ⟨4048,4064,10256,10272⟩) (.single ⟨4032,4064,10272,10304⟩)))) (.node (.node (.single ⟨4064,4080,10240,10256⟩) (.node (.single ⟨4064,4080,10256,10272⟩) (.single ⟨4080,4096,10240,10256⟩))) (.node (.node (.single ⟨4080,4096,10256,10272⟩) (.single ⟨4064,4096,10272,10304⟩)) (.node (.single ⟨4032,4096,10304,10368⟩) (.single ⟨3968,4096,10368,10496⟩)))))) (.node (.node (.node (.node (.single ⟨10240,10304,3840,3904⟩) (.node (.single ⟨10240,10272,3904,3936⟩) (.single ⟨10240,10272,3936,3968⟩))) (.node (.node (.single ⟨10272,10304,3904,3936⟩) (.single ⟨10272,10304,3936,3968⟩)) (.node (.single ⟨10304,10368,3840,3904⟩) (.single ⟨10304,10368,3904,3968⟩)))) (.node (.node (.single ⟨10240,10272,3968,4000⟩) (.node (.single ⟨10240,10256,4000,4016⟩) (.single ⟨10240,10256,4016,4032⟩))) (.node (.node (.single ⟨10256,10272,4000,4016⟩) (.single ⟨10256,10272,4016,4032⟩)) (.node (.single ⟨10272,10304,3968,4000⟩) (.single ⟨10272,10304,4000,4032⟩))))) (.node (.node (.node (.single ⟨10240,10256,4032,4048⟩) (.node (.single ⟨10240,10256,4048,4064⟩) (.single ⟨10256,10272,4032,4048⟩))) (.node (.node (.single ⟨10256,10272,4048,4064⟩) (.single ⟨10240,10256,4064,4080⟩)) (.node (.single ⟨10240,10256,4080,4096⟩) (.single ⟨10256,10272,4064,4080⟩)))) (.node (.node (.single ⟨10256,10272,4080,4096⟩) (.node (.single ⟨10272,10304,4032,4064⟩) (.single ⟨10272,10304,4064,4096⟩))) (.node (.node (.single ⟨10304,10368,3968,4032⟩) (.single ⟨10304,10368,4032,4096⟩)) (.node (.single ⟨10368,10496,3840,3968⟩) (.single ⟨10368,10496,3968,4096⟩))))))) (.node (.node (.node (.node (.node (.single ⟨22272,22400,28672,28800⟩) (.node (.single ⟨22272,22400,28800,28928⟩) (.single ⟨22400,22464,28672,28736⟩))) (.node (.node (.single ⟨22400,22464,28736,28800⟩) (.single ⟨22464,22496,28672,28704⟩)) (.node (.single ⟨22464,22496,28704,28736⟩) (.single ⟨22496,22512,28672,28688⟩)))) (.node (.node (.single ⟨22496,22512,28688,28704⟩) (.node (.single ⟨22512,22528,28672,28688⟩) (.single ⟨22512,22528,28688,28704⟩))) (.node (.node (.single ⟨22496,22512,28704,28720⟩) (.single ⟨22496,22512,28720,28736⟩)) (.node (.single ⟨22512,22528,28704,28720⟩) (.single ⟨22512,22528,28720,28736⟩))))) (.node (.node (.node (.single ⟨22464,22496,28736,28768⟩) (.node (.single ⟨22464,22496,28768,28800⟩) (.single ⟨22496,22512,28736,28752⟩))) (.node (.node (.single ⟨22496,22512,28752,28768⟩) (.single ⟨22512,22528,28736,28752⟩)) (.node (.single ⟨22512,22528,28752,28768⟩) (.single ⟨22496,22528,28768,28800⟩)))) (.node (.node (.single ⟨22400,22464,28800,28864⟩) (.node (.single ⟨22400,22464,28864,28928⟩) (.single ⟨22464,22496,28800,28832⟩))) (.node (.node (.single ⟨22464,22496,28832,28864⟩) (.single ⟨22496,22528,28800,28832⟩)) (.node (.single ⟨22496,22528,28832,28864⟩) (.single ⟨22464,22528,28864,28928⟩)))))) (.node (.node (.node (.node (.single ⟨28672,28800,22272,22400⟩) (.node (.single ⟨28672,28736,22400,22464⟩) (.single ⟨28672,28704,22464,22496⟩))) (.node (.node (.single ⟨28672,28688,22496,22512⟩) (.single ⟨28672,28688,22512,22528⟩)) (.node (.single ⟨28688,28704,22496,22512⟩) (.single ⟨28688,28704,22512,22528⟩)))) (.node (.node (.single ⟨28704,28736,22464,22496⟩) (.node (.single ⟨28704,28720,22496,22512⟩) (.single ⟨28704,28720,22512,22528⟩))) (.node (.node (.single ⟨28720,28736,22496,22512⟩) (.single ⟨28720,28736,22512,22528⟩)) (.node (.single ⟨28736,28800,22400,22464⟩) (.single ⟨28736,28768,22464,22496⟩))))) (.node (.node (.node (.single ⟨28736,28752,22496,22512⟩) (.node (.single ⟨28736,28752,22512,22528⟩) (.single ⟨28752,28768,22496,22512⟩))) (.node (.node (.single ⟨28752,28768,22512,22528⟩) (.single ⟨28768,28800,22464,22496⟩)) (.node (.single ⟨28768,28800,22496,22528⟩) (.single ⟨28800,28928,22272,22400⟩)))) (.node (.node (.single ⟨28800,28864,22400,22464⟩) (.node (.single ⟨28800,28832,22464,22496⟩) (.single ⟨28800,28832,22496,22528⟩))) (.node (.node (.single ⟨28832,28864,22464,22496⟩) (.single ⟨28832,28864,22496,22528⟩)) (.node (.single ⟨28864,28928,22400,22464⟩) (.single ⟨28864,28928,22464,22528⟩))))))))
def output37 : Fin 112 → GridBox := outputData37.get
def coverData37 : FiniteInputTree ℕ 112 := (.node (.node (.node (.node (.node (.node (.single 7) (.node (.single 54) (.single 104))) (.node (.node (.single 57) (.single 27)) (.node (.single 55) (.single 84)))) (.node (.node (.single 56) (.node (.single 0) (.single 28))) (.node (.node (.single 111) (.single 83)) (.node (.single 1) (.single 33))))) (.node (.node (.node (.single 110) (.node (.single 78) (.single 6))) (.node (.node (.single 34) (.single 105)) (.node (.single 77) (.single 15)))) (.node (.node (.single 52) (.node (.single 96) (.single 59))) (.node (.node (.single 26) (.single 53)) (.node (.single 85) (.single 58)))))) (.node (.node (.node (.node (.single 20) (.node (.single 50) (.single 91))) (.node (.node (.single 61) (.single 25)) (.node (.single 51) (.single 86)))) (.node (.node (.single 60) (.node (.single 2) (.single 29))) (.node (.node (.single 109) (.single 82)) (.node (.single 3) (.single 31))))) (.node (.node (.node (.single 108) (.node (.single 80) (.single 4))) (.node (.node (.single 30) (.single 107)) (.node (.single 81) (.single 5)))) (.node (.node (.single 32) (.node (.single 106) (.single 79))) (.node (.node (.single 8) (.single 35)) (.node (.single 103) (.single 76))))))) (.node (.node (.node (.node (.node (.single 9) (.node (.single 40) (.single 102))) (.node (.node (.single 71) (.single 14)) (.node (.single 41) (.single 97)))) (.node (.node (.single 70) (.node (.single 16) (.single 42))) (.node (.node (.single 95) (.single 69)) (.node (.single 17) (.single 44))))) (.node (.node (.node (.single 94) (.node (.single 67) (.single 18))) (.node (.node (.single 43) (.single 93)) (.node (.single 68) (.single 19)))) (.node (.node (.single 45) (.node (.single 92) (.single 66))) (.node (.node (.single 21) (.single 46)) (.node (.single 90) (.single 65)))))) (.node (.node (.node (.node (.single 22) (.node (.single 48) (.single 89))) (.node (.node (.single 63) (.single 23)) (.node (.single 47) (.single 88)))) (.node (.node (.single 64) (.node (.single 24) (.single 49))) (.node (.node (.single 87) (.single 62)) (.node (.single 10) (.single 36))))) (.node (.node (.node (.single 101) (.node (.single 75) (.single 11))) (.node (.node (.single 38) (.single 100)) (.node (.single 73) (.single 12)))) (.node (.node (.single 37) (.node (.single 99) (.single 74))) (.node (.node (.single 13) (.single 39)) (.node (.single 98) (.single 72))))))))
def sourceData37 : FiniteInputTree ℕ 112 := (.node (.node (.node (.node (.node (.node (.single 8) (.node (.single 12) (.single 36))) (.node (.node (.single 40) (.single 44)) (.node (.single 48) (.single 16)))) (.node (.node (.single 0) (.node (.single 52) (.single 56))) (.node (.node (.single 96) (.single 100)) (.node (.single 104) (.single 108))))) (.node (.node (.node (.single 60) (.node (.single 20) (.single 64))) (.node (.node (.single 68) (.single 72)) (.node (.single 76) (.single 28)))) (.node (.node (.single 80) (.node (.single 84) (.single 88))) (.node (.node (.single 92) (.single 32)) (.node (.single 24) (.single 4)))))) (.node (.node (.node (.node (.single 9) (.node (.single 37) (.single 45))) (.node (.node (.single 41) (.single 49)) (.node (.single 13) (.single 17)))) (.node (.node (.single 53) (.node (.single 97) (.single 105))) (.node (.node (.single 101) (.single 109)) (.node (.single 57) (.single 61))))) (.node (.node (.node (.single 65) (.node (.single 73) (.single 69))) (.node (.node (.single 77) (.single 81)) (.node (.single 89) (.single 85)))) (.node (.node (.single 93) (.node (.single 29) (.single 33))) (.node (.node (.single 21) (.single 25)) (.node (.single 1) (.single 5))))))) (.node (.node (.node (.node (.node (.single 7) (.node (.single 3) (.single 27))) (.node (.node (.single 23) (.single 35)) (.node (.single 31) (.single 95)))) (.node (.node (.single 87) (.node (.single 91) (.single 83))) (.node (.node (.single 79) (.single 71)) (.node (.single 75) (.single 67))))) (.node (.node (.node (.single 63) (.node (.single 59) (.single 111))) (.node (.node (.single 103) (.single 107)) (.node (.single 99) (.single 55)))) (.node (.node (.single 19) (.node (.single 15) (.single 51))) (.node (.node (.single 43) (.single 47)) (.node (.single 39) (.single 11)))))) (.node (.node (.node (.node (.single 6) (.node (.single 26) (.single 34))) (.node (.node (.single 94) (.single 90)) (.node (.single 86) (.single 82)))) (.node (.node (.single 30) (.node (.single 78) (.single 74))) (.node (.node (.single 70) (.single 66)) (.node (.single 22) (.single 62))))) (.node (.node (.node (.single 110) (.node (.single 106) (.single 102))) (.node (.node (.single 98) (.single 58)) (.node (.single 54) (.single 2)))) (.node (.node (.single 18) (.node (.single 50) (.single 46))) (.node (.node (.single 42) (.single 38)) (.node (.single 14) (.single 10))))))))
def cover37 (i : Fin 112) : Fin 112 := ⟨coverData37.get i % 112, Nat.mod_lt _ (by decide)⟩
def source37 (i : Fin 112) : Fin 112 := ⟨sourceData37.get i % 112, Nat.mod_lt _ (by decide)⟩
def tree37 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 .empty (.cutY 10240 .empty (.cutX 3072 .empty (.cutY 11264 (.cutX 3584 .empty (.cutY 10752 (.cutX 3840 .empty (.cutY 10496 (.cutX 3968 (.cutY 10368 (.cutX 3904 (.cutY 10304 .full .full) (.cutY 10304 (.cutX 3936 (.cutY 10272 .full .full) (.cutY 10272 .full .full)) .full)) .full) (.cutY 10368 (.cutX 4032 (.cutY 10304 (.cutX 4000 (.cutY 10272 .full .full) (.cutY 10272 (.cutX 4016 (.cutY 10256 .full .full) (.cutY 10256 .full .full)) .full)) .full) (.cutY 10304 (.cutX 4064 (.cutY 10272 (.cutX 4048 (.cutY 10256 .full .full) (.cutY 10256 .full .full)) .full) (.cutY 10272 (.cutX 4080 (.cutY 10256 .full .full) (.cutY 10256 .full .full)) .full)) .full)) .full)) .empty)) .empty)) .empty)))) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 .empty (.cutY 2048 .empty (.cutX 11264 (.cutY 3072 .empty (.cutX 10752 (.cutY 3584 .empty (.cutX 10496 (.cutY 3840 .empty (.cutX 10368 (.cutY 3968 (.cutX 10304 (.cutY 3904 .full (.cutX 10272 (.cutY 3936 .full .full) (.cutY 3936 .full .full))) (.cutY 3904 .full .full)) (.cutX 10304 (.cutY 4032 (.cutX 10272 (.cutY 4000 .full (.cutX 10256 (.cutY 4016 .full .full) (.cutY 4016 .full .full))) (.cutY 4000 .full .full)) (.cutX 10272 (.cutY 4064 (.cutX 10256 (.cutY 4048 .full .full) (.cutY 4048 .full .full)) (.cutX 10256 (.cutY 4080 .full .full) (.cutY 4080 .full .full))) (.cutY 4064 .full .full))) (.cutY 4032 .full .full))) (.cutY 3968 .full .full))) .empty)) .empty)) .empty))) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 (.cutY 30720 (.cutX 21504 .empty (.cutY 29696 (.cutX 22016 .empty (.cutY 29184 (.cutX 22272 .empty (.cutY 28928 (.cutX 22400 (.cutY 28800 .full .full) (.cutY 28800 (.cutX 22464 (.cutY 28736 .full .full) (.cutY 28736 (.cutX 22496 (.cutY 28704 .full .full) (.cutY 28704 (.cutX 22512 (.cutY 28688 .full .full) (.cutY 28688 .full .full)) (.cutX 22512 (.cutY 28720 .full .full) (.cutY 28720 .full .full)))) (.cutX 22496 (.cutY 28768 .full .full) (.cutY 28768 (.cutX 22512 (.cutY 28752 .full .full) (.cutY 28752 .full .full)) .full)))) (.cutX 22464 (.cutY 28864 .full .full) (.cutY 28864 (.cutX 22496 (.cutY 28832 .full .full) (.cutY 28832 .full .full)) .full)))) .empty)) .empty)) .empty)) .empty) .empty)))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 (.cutY 22528 (.cutX 29696 (.cutY 21504 .empty (.cutX 29184 (.cutY 22016 .empty (.cutX 28928 (.cutY 22272 .empty (.cutX 28800 (.cutY 22400 .full (.cutX 28736 (.cutY 22464 .full (.cutX 28704 (.cutY 22496 .full (.cutX 28688 (.cutY 22512 .full .full) (.cutY 22512 .full .full))) (.cutY 22496 .full (.cutX 28720 (.cutY 22512 .full .full) (.cutY 22512 .full .full))))) (.cutY 22464 .full (.cutX 28768 (.cutY 22496 .full (.cutX 28752 (.cutY 22512 .full .full) (.cutY 22512 .full .full))) (.cutY 22496 .full .full))))) (.cutY 22400 .full (.cutX 28864 (.cutY 22464 .full (.cutX 28832 (.cutY 22496 .full .full) (.cutY 22496 .full .full))) (.cutY 22464 .full .full))))) .empty)) .empty)) .empty) .empty) .empty))) .empty))))

theorem metadata37 : 0<213482286 ∧ 15<128 ∧ 40<128 ∧ 1<4 ∧
    5895/4160=1 ∧ 5895%4160=1735 ∧ ∀ i, (leaves37 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData37).mp
    (by decide +kernel)

theorem sourceChecked37_0 : ∀ i : Fin 64,
    (fun i => output37 i = raw37 (source37 i)) (finOffset 112 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked37_64 : ∀ i : Fin 48,
    (fun i => output37 i = raw37 (source37 i)) (finOffset 112 64 48 (by decide) i) := by decide +kernel

theorem sourceChecked37 : ∀ i : Fin 112, (fun i => output37 i = raw37 (source37 i)) i :=
  forallFin_of_zero_offset (fun i => output37 i = raw37 (source37 i)) (forallFinOffset_add (fun i => output37 i = raw37 (source37 i)) 0 64 48 (by decide) sourceChecked37_0
    sourceChecked37_64)

theorem coverChecked37_0 : ∀ i : Fin 64,
    (fun i => (output37 (cover37 i)).ContainsBox (raw37 i)) (finOffset 112 0 64 (by decide) i) := by decide +kernel

theorem coverChecked37_64 : ∀ i : Fin 48,
    (fun i => (output37 (cover37 i)).ContainsBox (raw37 i)) (finOffset 112 64 48 (by decide) i) := by decide +kernel

theorem coverChecked37 : ∀ i : Fin 112, (fun i => (output37 (cover37 i)).ContainsBox (raw37 i)) i :=
  forallFin_of_zero_offset (fun i => (output37 (cover37 i)).ContainsBox (raw37 i)) (forallFinOffset_add (fun i => (output37 (cover37 i)).ContainsBox (raw37 i)) 0 64 48 (by decide) coverChecked37_0
    coverChecked37_64)

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

noncomputable def phaseMass37 : ℝ := singlePhaseMass (213482286/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw37 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass37_eq : phaseMass37 = (106741143/819200000000 : ℝ) := by
  unfold phaseMass37
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw37 output37 cover37 source37
    (gridTreeUnionCheck_sound 32768 raw37 output37 cover37 source37 tree37 checked37)
    _ (by norm_num) _, areaUnits37]
  norm_num

-- Frozen phase 3046, atom 7585, type 1, source (37,58).
def leavesData38 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves38 : Fin 7 → DyadicLeaf := leavesData38.get
def raw38 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 37 58 leaves38 i
def outputData38 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨9472,9600,14848,14976⟩) (.node (.single ⟨9472,9600,14976,15104⟩) (.single ⟨9600,9664,14848,14912⟩))) (.node (.node (.single ⟨9600,9664,14912,14976⟩) (.single ⟨9664,9728,14848,14912⟩)) (.node (.single ⟨9664,9728,14912,14976⟩) (.single ⟨9600,9728,14976,15104⟩)))) (.node (.node (.single ⟨14848,14976,9472,9600⟩) (.node (.single ⟨14848,14912,9600,9664⟩) (.single ⟨14848,14912,9664,9728⟩))) (.node (.node (.single ⟨14912,14976,9600,9664⟩) (.single ⟨14912,14976,9664,9728⟩)) (.node (.single ⟨14976,15104,9472,9600⟩) (.single ⟨14976,15104,9600,9728⟩))))) (.node (.node (.node (.single ⟨17664,17792,23040,23168⟩) (.node (.single ⟨17664,17792,23168,23296⟩) (.single ⟨17792,17856,23040,23104⟩))) (.node (.node (.single ⟨17792,17856,23104,23168⟩) (.single ⟨17856,17920,23040,23104⟩)) (.node (.single ⟨17856,17920,23104,23168⟩) (.single ⟨17792,17920,23168,23296⟩)))) (.node (.node (.single ⟨23040,23168,17664,17792⟩) (.node (.single ⟨23040,23104,17792,17856⟩) (.single ⟨23040,23104,17856,17920⟩))) (.node (.node (.single ⟨23104,23168,17792,17856⟩) (.single ⟨23104,23168,17856,17920⟩)) (.node (.single ⟨23168,23296,17664,17792⟩) (.single ⟨23168,23296,17792,17920⟩))))))
def output38 : Fin 28 → GridBox := outputData38.get
def coverData38 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData38 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover38 (i : Fin 28) : Fin 28 := ⟨coverData38.get i % 28, Nat.mod_lt _ (by decide)⟩
def source38 (i : Fin 28) : Fin 28 := ⟨sourceData38.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree38 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 (.cutY 14336 .empty (.cutX 9216 .empty (.cutY 15360 (.cutX 9728 (.cutY 14848 .empty (.cutX 9472 .empty (.cutY 15104 (.cutX 9600 (.cutY 14976 .full .full) (.cutY 14976 (.cutX 9664 (.cutY 14912 .full .full) (.cutY 14912 .full .full)) .full)) .empty))) .empty) .empty))) .empty)) (.cutY 12288 (.cutX 14336 .empty (.cutY 10240 (.cutX 15360 (.cutY 9216 .empty (.cutX 14848 .empty (.cutY 9728 (.cutX 15104 (.cutY 9472 .empty (.cutX 14976 (.cutY 9600 .full (.cutX 14912 (.cutY 9664 .full .full) (.cutY 9664 .full .full))) (.cutY 9600 .full .full))) .empty) .empty))) .empty) .empty)) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 (.cutY 22528 .empty (.cutX 17408 .empty (.cutY 23552 (.cutX 17920 (.cutY 23040 .empty (.cutX 17664 .empty (.cutY 23296 (.cutX 17792 (.cutY 23168 .full .full) (.cutY 23168 (.cutX 17856 (.cutY 23104 .full .full) (.cutY 23104 .full .full)) .full)) .empty))) .empty) .empty))) .empty)) (.cutY 20480 (.cutX 22528 .empty (.cutY 18432 (.cutX 23552 (.cutY 17408 .empty (.cutX 23040 .empty (.cutY 17920 (.cutX 23296 (.cutY 17664 .empty (.cutX 23168 (.cutY 17792 .full (.cutX 23104 (.cutY 17856 .full .full) (.cutY 17856 .full .full))) (.cutY 17792 .full .full))) .empty) .empty))) .empty) .empty)) .empty)) .empty) .empty)))

theorem metadata38 : 0<168966520 ∧ 37<128 ∧ 58<128 ∧ 1<4 ∧
    7585/4160=1 ∧ 7585%4160=3425 ∧ ∀ i, (leaves38 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData38).mp
    (by decide +kernel)

theorem sourceChecked38_0 : ∀ i : Fin 28,
    (fun i => output38 i = raw38 (source38 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked38 : ∀ i : Fin 28, (fun i => output38 i = raw38 (source38 i)) i :=
  forallFin_of_zero_offset (fun i => output38 i = raw38 (source38 i)) sourceChecked38_0

theorem coverChecked38_0 : ∀ i : Fin 28,
    (fun i => (output38 (cover38 i)).ContainsBox (raw38 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked38 : ∀ i : Fin 28, (fun i => (output38 (cover38 i)).ContainsBox (raw38 i)) i :=
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

noncomputable def phaseMass38 : ℝ := singlePhaseMass (168966520/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw38 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass38_eq : phaseMass38 = (4224163/40960000000 : ℝ) := by
  unfold phaseMass38
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw38 output38 cover38 source38
    (gridTreeUnionCheck_sound 32768 raw38 output38 cover38 source38 tree38 checked38)
    _ (by norm_num) _, areaUnits38]
  norm_num

-- Frozen phase 3047, atom 6861, type 1, source (26,49).
def leavesData39 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves39 : Fin 7 → DyadicLeaf := leavesData39.get
def raw39 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 26 49 leaves39 i
def outputData39 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨6656,6784,12544,12672⟩) (.node (.single ⟨6656,6784,12672,12800⟩) (.single ⟨6784,6848,12544,12608⟩))) (.node (.node (.single ⟨6784,6848,12608,12672⟩) (.single ⟨6848,6912,12544,12608⟩)) (.node (.single ⟨6848,6912,12608,12672⟩) (.single ⟨6784,6912,12672,12800⟩)))) (.node (.node (.single ⟨12544,12672,6656,6784⟩) (.node (.single ⟨12544,12608,6784,6848⟩) (.single ⟨12544,12608,6848,6912⟩))) (.node (.node (.single ⟨12608,12672,6784,6848⟩) (.single ⟨12608,12672,6848,6912⟩)) (.node (.single ⟨12672,12800,6656,6784⟩) (.single ⟨12672,12800,6784,6912⟩))))) (.node (.node (.node (.single ⟨19968,20096,25856,25984⟩) (.node (.single ⟨19968,20096,25984,26112⟩) (.single ⟨20096,20160,25856,25920⟩))) (.node (.node (.single ⟨20096,20160,25920,25984⟩) (.single ⟨20160,20224,25856,25920⟩)) (.node (.single ⟨20160,20224,25920,25984⟩) (.single ⟨20096,20224,25984,26112⟩)))) (.node (.node (.single ⟨25856,25984,19968,20096⟩) (.node (.single ⟨25856,25920,20096,20160⟩) (.single ⟨25856,25920,20160,20224⟩))) (.node (.node (.single ⟨25920,25984,20096,20160⟩) (.single ⟨25920,25984,20160,20224⟩)) (.node (.single ⟨25984,26112,19968,20096⟩) (.single ⟨25984,26112,20096,20224⟩))))))
def output39 : Fin 28 → GridBox := outputData39.get
def coverData39 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData39 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover39 (i : Fin 28) : Fin 28 := ⟨coverData39.get i % 28, Nat.mod_lt _ (by decide)⟩
def source39 (i : Fin 28) : Fin 28 := ⟨sourceData39.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree39 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 .empty (.cutY 14336 (.cutX 7168 (.cutY 13312 (.cutX 6656 .empty (.cutY 12800 (.cutX 6912 (.cutY 12544 .empty (.cutX 6784 (.cutY 12672 .full .full) (.cutY 12672 (.cutX 6848 (.cutY 12608 .full .full) (.cutY 12608 .full .full)) .full))) .empty) .empty)) .empty) .empty) .empty))))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 (.cutY 6144 .empty (.cutX 13312 (.cutY 7168 (.cutX 12800 (.cutY 6656 .empty (.cutX 12544 .empty (.cutY 6912 (.cutX 12672 (.cutY 6784 .full (.cutX 12608 (.cutY 6848 .full .full) (.cutY 6848 .full .full))) (.cutY 6784 .full .full)) .empty))) .empty) .empty) .empty)) .empty))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 .empty (.cutY 26624 (.cutX 19456 .empty (.cutY 25600 .empty (.cutX 19968 .empty (.cutY 26112 (.cutX 20224 (.cutY 25856 .empty (.cutX 20096 (.cutY 25984 .full .full) (.cutY 25984 (.cutX 20160 (.cutY 25920 .full .full) (.cutY 25920 .full .full)) .full))) .empty) .empty)))) .empty)) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 (.cutY 18432 .empty (.cutX 25600 .empty (.cutY 19456 .empty (.cutX 26112 (.cutY 19968 .empty (.cutX 25856 .empty (.cutY 20224 (.cutX 25984 (.cutY 20096 .full (.cutX 25920 (.cutY 20160 .full .full) (.cutY 20160 .full .full))) (.cutY 20096 .full .full)) .empty))) .empty)))) .empty) .empty) .empty) .empty))))

theorem metadata39 : 0<202650974 ∧ 26<128 ∧ 49<128 ∧ 1<4 ∧
    6861/4160=1 ∧ 6861%4160=2701 ∧ ∀ i, (leaves39 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData39).mp
    (by decide +kernel)

theorem sourceChecked39_0 : ∀ i : Fin 28,
    (fun i => output39 i = raw39 (source39 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked39 : ∀ i : Fin 28, (fun i => output39 i = raw39 (source39 i)) i :=
  forallFin_of_zero_offset (fun i => output39 i = raw39 (source39 i)) sourceChecked39_0

theorem coverChecked39_0 : ∀ i : Fin 28,
    (fun i => (output39 (cover39 i)).ContainsBox (raw39 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked39 : ∀ i : Fin 28, (fun i => (output39 (cover39 i)).ContainsBox (raw39 i)) i :=
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

noncomputable def phaseMass39 : ℝ := singlePhaseMass (202650974/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw39 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass39_eq : phaseMass39 = (101325487/819200000000 : ℝ) := by
  unfold phaseMass39
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw39 output39 cover39 source39
    (gridTreeUnionCheck_sound 32768 raw39 output39 cover39 source39 tree39 checked39)
    _ (by norm_num) _, areaUnits39]
  norm_num

-- Frozen phase 3048, atom 6937, type 1, source (27,50).
def leavesData40 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves40 : Fin 7 → DyadicLeaf := leavesData40.get
def raw40 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 27 50 leaves40 i
def outputData40 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨6912,7040,12800,12928⟩) (.node (.single ⟨6912,7040,12928,13056⟩) (.single ⟨7040,7104,12800,12864⟩))) (.node (.node (.single ⟨7040,7104,12864,12928⟩) (.single ⟨7104,7168,12800,12864⟩)) (.node (.single ⟨7104,7168,12864,12928⟩) (.single ⟨7040,7168,12928,13056⟩)))) (.node (.node (.single ⟨12800,12928,6912,7040⟩) (.node (.single ⟨12800,12864,7040,7104⟩) (.single ⟨12800,12864,7104,7168⟩))) (.node (.node (.single ⟨12864,12928,7040,7104⟩) (.single ⟨12864,12928,7104,7168⟩)) (.node (.single ⟨12928,13056,6912,7040⟩) (.single ⟨12928,13056,7040,7168⟩))))) (.node (.node (.node (.single ⟨19712,19840,25600,25728⟩) (.node (.single ⟨19712,19840,25728,25856⟩) (.single ⟨19840,19904,25600,25664⟩))) (.node (.node (.single ⟨19840,19904,25664,25728⟩) (.single ⟨19904,19968,25600,25664⟩)) (.node (.single ⟨19904,19968,25664,25728⟩) (.single ⟨19840,19968,25728,25856⟩)))) (.node (.node (.single ⟨25600,25728,19712,19840⟩) (.node (.single ⟨25600,25664,19840,19904⟩) (.single ⟨25600,25664,19904,19968⟩))) (.node (.node (.single ⟨25664,25728,19840,19904⟩) (.single ⟨25664,25728,19904,19968⟩)) (.node (.single ⟨25728,25856,19712,19840⟩) (.single ⟨25728,25856,19840,19968⟩))))))
def output40 : Fin 28 → GridBox := outputData40.get
def coverData40 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData40 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover40 (i : Fin 28) : Fin 28 := ⟨coverData40.get i % 28, Nat.mod_lt _ (by decide)⟩
def source40 (i : Fin 28) : Fin 28 := ⟨sourceData40.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree40 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 .empty (.cutY 14336 (.cutX 7168 (.cutY 13312 (.cutX 6656 .empty (.cutY 12800 .empty (.cutX 6912 .empty (.cutY 13056 (.cutX 7040 (.cutY 12928 .full .full) (.cutY 12928 (.cutX 7104 (.cutY 12864 .full .full) (.cutY 12864 .full .full)) .full)) .empty)))) .empty) .empty) .empty))))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 (.cutY 6144 .empty (.cutX 13312 (.cutY 7168 (.cutX 12800 .empty (.cutY 6656 .empty (.cutX 13056 (.cutY 6912 .empty (.cutX 12928 (.cutY 7040 .full (.cutX 12864 (.cutY 7104 .full .full) (.cutY 7104 .full .full))) (.cutY 7040 .full .full))) .empty))) .empty) .empty)) .empty))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 .empty (.cutY 26624 (.cutX 19456 .empty (.cutY 25600 .empty (.cutX 19968 (.cutY 26112 (.cutX 19712 .empty (.cutY 25856 (.cutX 19840 (.cutY 25728 .full .full) (.cutY 25728 (.cutX 19904 (.cutY 25664 .full .full) (.cutY 25664 .full .full)) .full)) .empty)) .empty) .empty))) .empty)) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 (.cutY 18432 .empty (.cutX 25600 .empty (.cutY 19456 .empty (.cutX 26112 (.cutY 19968 (.cutX 25856 (.cutY 19712 .empty (.cutX 25728 (.cutY 19840 .full (.cutX 25664 (.cutY 19904 .full .full) (.cutY 19904 .full .full))) (.cutY 19840 .full .full))) .empty) .empty) .empty)))) .empty) .empty) .empty) .empty))))

theorem metadata40 : 0<202650974 ∧ 27<128 ∧ 50<128 ∧ 1<4 ∧
    6937/4160=1 ∧ 6937%4160=2777 ∧ ∀ i, (leaves40 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData40).mp
    (by decide +kernel)

theorem sourceChecked40_0 : ∀ i : Fin 28,
    (fun i => output40 i = raw40 (source40 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked40 : ∀ i : Fin 28, (fun i => output40 i = raw40 (source40 i)) i :=
  forallFin_of_zero_offset (fun i => output40 i = raw40 (source40 i)) sourceChecked40_0

theorem coverChecked40_0 : ∀ i : Fin 28,
    (fun i => (output40 (cover40 i)).ContainsBox (raw40 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked40 : ∀ i : Fin 28, (fun i => (output40 (cover40 i)).ContainsBox (raw40 i)) i :=
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

noncomputable def phaseMass40 : ℝ := singlePhaseMass (202650974/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw40 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass40_eq : phaseMass40 = (101325487/819200000000 : ℝ) := by
  unfold phaseMass40
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw40 output40 cover40 source40
    (gridTreeUnionCheck_sound 32768 raw40 output40 cover40 source40 tree40 checked40)
    _ (by norm_num) _, areaUnits40]
  norm_num

-- Frozen phase 3049, atom 5796, type 1, source (14,40).
def leavesData41 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves41 : Fin 13 → DyadicLeaf := leavesData41.get
def raw41 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 14 40 leaves41 i
def outputData41 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨3584,3648,10240,10304⟩) (.node (.single ⟨3584,3648,10304,10368⟩) (.single ⟨3648,3712,10240,10304⟩))) (.node (.single ⟨3648,3712,10304,10368⟩) (.node (.single ⟨3584,3712,10368,10496⟩) (.single ⟨3712,3776,10240,10304⟩)))) (.node (.node (.single ⟨3712,3776,10304,10368⟩) (.node (.single ⟨3776,3808,10240,10272⟩) (.single ⟨3776,3808,10272,10304⟩))) (.node (.node (.single ⟨3808,3840,10240,10272⟩) (.single ⟨3808,3840,10272,10304⟩)) (.node (.single ⟨3776,3840,10304,10368⟩) (.single ⟨3712,3840,10368,10496⟩))))) (.node (.node (.node (.single ⟨10240,10304,3584,3648⟩) (.node (.single ⟨10240,10304,3648,3712⟩) (.single ⟨10304,10368,3584,3648⟩))) (.node (.single ⟨10304,10368,3648,3712⟩) (.node (.single ⟨10240,10304,3712,3776⟩) (.single ⟨10240,10272,3776,3808⟩)))) (.node (.node (.single ⟨10240,10272,3808,3840⟩) (.node (.single ⟨10272,10304,3776,3808⟩) (.single ⟨10272,10304,3808,3840⟩))) (.node (.node (.single ⟨10304,10368,3712,3776⟩) (.single ⟨10304,10368,3776,3840⟩)) (.node (.single ⟨10368,10496,3584,3712⟩) (.single ⟨10368,10496,3712,3840⟩)))))) (.node (.node (.node (.node (.single ⟨22272,22400,28928,29056⟩) (.node (.single ⟨22272,22400,29056,29184⟩) (.single ⟨22400,22464,28928,28992⟩))) (.node (.single ⟨22400,22464,28992,29056⟩) (.node (.single ⟨22464,22496,28928,28960⟩) (.single ⟨22464,22496,28960,28992⟩)))) (.node (.node (.single ⟨22496,22528,28928,28960⟩) (.node (.single ⟨22496,22528,28960,28992⟩) (.single ⟨22464,22528,28992,29056⟩))) (.node (.node (.single ⟨22400,22464,29056,29120⟩) (.single ⟨22400,22464,29120,29184⟩)) (.node (.single ⟨22464,22528,29056,29120⟩) (.single ⟨22464,22528,29120,29184⟩))))) (.node (.node (.node (.single ⟨28928,29056,22272,22400⟩) (.node (.single ⟨28928,28992,22400,22464⟩) (.single ⟨28928,28960,22464,22496⟩))) (.node (.single ⟨28928,28960,22496,22528⟩) (.node (.single ⟨28960,28992,22464,22496⟩) (.single ⟨28960,28992,22496,22528⟩)))) (.node (.node (.single ⟨28992,29056,22400,22464⟩) (.node (.single ⟨28992,29056,22464,22528⟩) (.single ⟨29056,29184,22272,22400⟩))) (.node (.node (.single ⟨29056,29120,22400,22464⟩) (.single ⟨29056,29120,22464,22528⟩)) (.node (.single ⟨29120,29184,22400,22464⟩) (.single ⟨29120,29184,22464,22528⟩)))))))
def output41 : Fin 52 → GridBox := outputData41.get
def coverData41 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 24) (.single 47))) (.node (.single 27) (.node (.single 12) (.single 25)))) (.node (.node (.single 39) (.node (.single 26) (.single 5))) (.node (.node (.single 17) (.single 46)) (.node (.single 34) (.single 6))))) (.node (.node (.node (.single 22) (.node (.single 45) (.single 29))) (.node (.single 11) (.node (.single 23) (.single 40)))) (.node (.node (.single 28) (.node (.single 0) (.single 13))) (.node (.node (.single 51) (.single 38)) (.node (.single 1) (.single 15)))))) (.node (.node (.node (.node (.single 50) (.node (.single 36) (.single 2))) (.node (.single 14) (.node (.single 49) (.single 37)))) (.node (.node (.single 3) (.node (.single 16) (.single 48))) (.node (.node (.single 35) (.single 7)) (.node (.single 18) (.single 44))))) (.node (.node (.node (.single 33) (.node (.single 8) (.single 20))) (.node (.single 43) (.node (.single 31) (.single 9)))) (.node (.node (.single 19) (.node (.single 42) (.single 32))) (.node (.node (.single 10) (.single 21)) (.node (.single 41) (.single 30)))))))
def sourceData41 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover41 (i : Fin 52) : Fin 52 := ⟨coverData41.get i % 52, Nat.mod_lt _ (by decide)⟩
def source41 (i : Fin 52) : Fin 52 := ⟨sourceData41.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree41 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 .empty (.cutY 10240 .empty (.cutX 3072 .empty (.cutY 11264 (.cutX 3584 .empty (.cutY 10752 (.cutX 3840 (.cutY 10496 (.cutX 3712 (.cutY 10368 (.cutX 3648 (.cutY 10304 .full .full) (.cutY 10304 .full .full)) .full) (.cutY 10368 (.cutX 3776 (.cutY 10304 .full .full) (.cutY 10304 (.cutX 3808 (.cutY 10272 .full .full) (.cutY 10272 .full .full)) .full)) .full)) .empty) .empty) .empty)) .empty)))) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 .empty (.cutY 2048 .empty (.cutX 11264 (.cutY 3072 .empty (.cutX 10752 (.cutY 3584 .empty (.cutX 10496 (.cutY 3840 (.cutX 10368 (.cutY 3712 (.cutX 10304 (.cutY 3648 .full .full) (.cutY 3648 .full .full)) (.cutX 10304 (.cutY 3776 .full (.cutX 10272 (.cutY 3808 .full .full) (.cutY 3808 .full .full))) (.cutY 3776 .full .full))) (.cutY 3712 .full .full)) .empty) .empty)) .empty)) .empty))) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 (.cutY 30720 (.cutX 21504 .empty (.cutY 29696 (.cutX 22016 .empty (.cutY 29184 (.cutX 22272 .empty (.cutY 28928 .empty (.cutX 22400 (.cutY 29056 .full .full) (.cutY 29056 (.cutX 22464 (.cutY 28992 .full .full) (.cutY 28992 (.cutX 22496 (.cutY 28960 .full .full) (.cutY 28960 .full .full)) .full)) (.cutX 22464 (.cutY 29120 .full .full) (.cutY 29120 .full .full)))))) .empty)) .empty)) .empty) .empty)))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 (.cutY 22528 (.cutX 29696 (.cutY 21504 .empty (.cutX 29184 (.cutY 22016 .empty (.cutX 28928 .empty (.cutY 22272 .empty (.cutX 29056 (.cutY 22400 .full (.cutX 28992 (.cutY 22464 .full (.cutX 28960 (.cutY 22496 .full .full) (.cutY 22496 .full .full))) (.cutY 22464 .full .full))) (.cutY 22400 .full (.cutX 29120 (.cutY 22464 .full .full) (.cutY 22464 .full .full))))))) .empty)) .empty) .empty) .empty))) .empty))))

theorem metadata41 : 0<213482286 ∧ 14<128 ∧ 40<128 ∧ 1<4 ∧
    5796/4160=1 ∧ 5796%4160=1636 ∧ ∀ i, (leaves41 i).Valid 8 := by
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

noncomputable def phaseMass41 : ℝ := singlePhaseMass (213482286/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw41 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass41_eq : phaseMass41 = (106741143/819200000000 : ℝ) := by
  unfold phaseMass41
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw41 output41 cover41 source41
    (gridTreeUnionCheck_sound 32768 raw41 output41 cover41 source41 tree41 checked41)
    _ (by norm_num) _, areaUnits41]
  norm_num

-- Frozen phase 3050, atom 7834, type 1, source (42,62).
def leavesData42 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves42 : Fin 10 → DyadicLeaf := leavesData42.get
def raw42 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 42 62 leaves42 i
def outputData42 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨10752,10880,15872,16000⟩) (.single ⟨10752,10880,16000,16128⟩)) (.node (.single ⟨10880,10944,15872,15936⟩) (.node (.single ⟨10880,10944,15936,16000⟩) (.single ⟨10944,10976,15872,15904⟩)))) (.node (.node (.single ⟨10944,10976,15904,15936⟩) (.single ⟨10976,11008,15872,15904⟩)) (.node (.single ⟨10976,11008,15904,15936⟩) (.node (.single ⟨10944,11008,15936,16000⟩) (.single ⟨10880,11008,16000,16128⟩))))) (.node (.node (.node (.single ⟨15872,16000,10752,10880⟩) (.single ⟨15872,15936,10880,10944⟩)) (.node (.single ⟨15872,15904,10944,10976⟩) (.node (.single ⟨15872,15904,10976,11008⟩) (.single ⟨15904,15936,10944,10976⟩)))) (.node (.node (.single ⟨15904,15936,10976,11008⟩) (.single ⟨15936,16000,10880,10944⟩)) (.node (.single ⟨15936,16000,10944,11008⟩) (.node (.single ⟨16000,16128,10752,10880⟩) (.single ⟨16000,16128,10880,11008⟩)))))) (.node (.node (.node (.node (.single ⟨16640,16768,21760,21888⟩) (.single ⟨16640,16768,21888,22016⟩)) (.node (.single ⟨16768,16832,21760,21824⟩) (.node (.single ⟨16768,16832,21824,21888⟩) (.single ⟨16832,16864,21760,21792⟩)))) (.node (.node (.single ⟨16832,16864,21792,21824⟩) (.single ⟨16864,16896,21760,21792⟩)) (.node (.single ⟨16864,16896,21792,21824⟩) (.node (.single ⟨16832,16896,21824,21888⟩) (.single ⟨16768,16896,21888,22016⟩))))) (.node (.node (.node (.single ⟨21760,21888,16640,16768⟩) (.single ⟨21760,21824,16768,16832⟩)) (.node (.single ⟨21760,21792,16832,16864⟩) (.node (.single ⟨21760,21792,16864,16896⟩) (.single ⟨21792,21824,16832,16864⟩)))) (.node (.node (.single ⟨21792,21824,16864,16896⟩) (.single ⟨21824,21888,16768,16832⟩)) (.node (.single ⟨21824,21888,16832,16896⟩) (.node (.single ⟨21888,22016,16640,16768⟩) (.single ⟨21888,22016,16768,16896⟩)))))))
def output42 : Fin 40 → GridBox := outputData42.get
def coverData42 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 10)) (.node (.single 39) (.node (.single 29) (.single 1)))) (.node (.node (.single 18) (.single 38)) (.node (.single 21) (.node (.single 9) (.single 19))))) (.node (.node (.node (.single 30) (.single 20)) (.node (.single 2) (.node (.single 11) (.single 37)))) (.node (.node (.single 28) (.single 3)) (.node (.single 16) (.node (.single 36) (.single 23)))))) (.node (.node (.node (.node (.single 8) (.single 17)) (.node (.single 31) (.node (.single 22) (.single 4)))) (.node (.node (.single 12) (.single 35)) (.node (.single 27) (.node (.single 5) (.single 14))))) (.node (.node (.node (.single 34) (.single 25)) (.node (.single 6) (.node (.single 13) (.single 33)))) (.node (.node (.single 26) (.single 7)) (.node (.single 15) (.node (.single 32) (.single 24)))))))
def sourceData42 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9)))))) (.node (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover42 (i : Fin 40) : Fin 40 := ⟨coverData42.get i % 40, Nat.mod_lt _ (by decide)⟩
def source42 (i : Fin 40) : Fin 40 := ⟨sourceData42.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree42 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 .empty (.cutY 14336 .empty (.cutX 11264 (.cutY 15360 .empty (.cutX 10752 .empty (.cutY 15872 .empty (.cutX 11008 (.cutY 16128 (.cutX 10880 (.cutY 16000 .full .full) (.cutY 16000 (.cutX 10944 (.cutY 15936 .full .full) (.cutY 15936 (.cutX 10976 (.cutY 15904 .full .full) (.cutY 15904 .full .full)) .full)) .full)) .empty) .empty)))) .empty)))) (.cutY 12288 (.cutX 14336 .empty (.cutY 10240 .empty (.cutX 15360 .empty (.cutY 11264 (.cutX 15872 .empty (.cutY 10752 .empty (.cutX 16128 (.cutY 11008 (.cutX 16000 (.cutY 10880 .full (.cutX 15936 (.cutY 10944 .full (.cutX 15904 (.cutY 10976 .full .full) (.cutY 10976 .full .full))) (.cutY 10944 .full .full))) (.cutY 10880 .full .full)) .empty) .empty))) .empty)))) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 (.cutY 22528 (.cutX 17408 (.cutY 21504 .empty (.cutX 16896 (.cutY 22016 (.cutX 16640 .empty (.cutY 21760 .empty (.cutX 16768 (.cutY 21888 .full .full) (.cutY 21888 (.cutX 16832 (.cutY 21824 .full .full) (.cutY 21824 (.cutX 16864 (.cutY 21792 .full .full) (.cutY 21792 .full .full)) .full)) .full)))) .empty) .empty)) .empty) .empty) .empty)) (.cutY 20480 (.cutX 22528 (.cutY 18432 (.cutX 21504 .empty (.cutY 17408 (.cutX 22016 (.cutY 16896 (.cutX 21760 .empty (.cutY 16640 .empty (.cutX 21888 (.cutY 16768 .full (.cutX 21824 (.cutY 16832 .full (.cutX 21792 (.cutY 16864 .full .full) (.cutY 16864 .full .full))) (.cutY 16832 .full .full))) (.cutY 16768 .full .full)))) .empty) .empty) .empty)) .empty) .empty) .empty)) .empty) .empty)))

theorem metadata42 : 0<82140708 ∧ 42<128 ∧ 62<128 ∧ 1<4 ∧
    7834/4160=1 ∧ 7834%4160=3674 ∧ ∀ i, (leaves42 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData42).mp
    (by decide +kernel)

theorem sourceChecked42_0 : ∀ i : Fin 40,
    (fun i => output42 i = raw42 (source42 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked42 : ∀ i : Fin 40, (fun i => output42 i = raw42 (source42 i)) i :=
  forallFin_of_zero_offset (fun i => output42 i = raw42 (source42 i)) sourceChecked42_0

theorem coverChecked42_0 : ∀ i : Fin 40,
    (fun i => (output42 (cover42 i)).ContainsBox (raw42 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked42 : ∀ i : Fin 40, (fun i => (output42 (cover42 i)).ContainsBox (raw42 i)) i :=
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

noncomputable def phaseMass42 : ℝ := singlePhaseMass (82140708/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw42 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass42_eq : phaseMass42 = (20535177/409600000000 : ℝ) := by
  unfold phaseMass42
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw42 output42 cover42 source42
    (gridTreeUnionCheck_sound 32768 raw42 output42 cover42 source42 tree42 checked42)
    _ (by norm_num) _, areaUnits42]
  norm_num

-- Frozen phase 3051, atom 889, type 0, source (7,42).
def leavesData43 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves43 : Fin 4 → DyadicLeaf := leavesData43.get
def raw43 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 7 42 leaves43 i
def outputData43 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨1792,1920,10752,10880⟩) (.single ⟨1792,1920,10880,11008⟩)) (.node (.single ⟨1920,2048,10752,10880⟩) (.single ⟨1920,2048,10880,11008⟩))) (.node (.node (.single ⟨10752,10880,1792,1920⟩) (.single ⟨10752,10880,1920,2048⟩)) (.node (.single ⟨10880,11008,1792,1920⟩) (.single ⟨10880,11008,1920,2048⟩)))) (.node (.node (.node (.single ⟨21760,21888,30720,30848⟩) (.single ⟨21760,21888,30848,30976⟩)) (.node (.single ⟨21888,22016,30720,30848⟩) (.single ⟨21888,22016,30848,30976⟩))) (.node (.node (.single ⟨30720,30848,21760,21888⟩) (.single ⟨30720,30848,21888,22016⟩)) (.node (.single ⟨30848,30976,21760,21888⟩) (.single ⟨30848,30976,21888,22016⟩)))))
def output43 : Fin 16 → GridBox := outputData43.get
def coverData43 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData43 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover43 (i : Fin 16) : Fin 16 := ⟨coverData43.get i % 16, Nat.mod_lt _ (by decide)⟩
def source43 (i : Fin 16) : Fin 16 := ⟨sourceData43.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree43 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 (.cutY 10240 .empty (.cutX 1024 .empty (.cutY 11264 (.cutX 1536 .empty (.cutY 10752 .empty (.cutX 1792 .empty (.cutY 11008 (.cutX 1920 (.cutY 10880 .full .full) (.cutY 10880 .full .full)) .empty)))) .empty))) .empty) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 .empty (.cutY 2048 (.cutX 11264 (.cutY 1024 .empty (.cutX 10752 .empty (.cutY 1536 .empty (.cutX 11008 (.cutY 1792 .empty (.cutX 10880 (.cutY 1920 .full .full) (.cutY 1920 .full .full))) .empty)))) .empty) .empty)) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 (.cutY 30720 .empty (.cutX 21504 .empty (.cutY 31744 (.cutX 22016 (.cutY 31232 (.cutX 21760 .empty (.cutY 30976 (.cutX 21888 (.cutY 30848 .full .full) (.cutY 30848 .full .full)) .empty)) .empty) .empty) .empty))) .empty)))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 .empty (.cutY 22528 (.cutX 31744 (.cutY 21504 .empty (.cutX 31232 (.cutY 22016 (.cutX 30976 (.cutY 21760 .empty (.cutX 30848 (.cutY 21888 .full .full) (.cutY 21888 .full .full))) .empty) .empty) .empty)) .empty) .empty)))) .empty))))

theorem metadata43 : 0<374268468 ∧ 7<128 ∧ 42<128 ∧ 0<4 ∧
    889/4160=0 ∧ 889%4160=889 ∧ ∀ i, (leaves43 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData43).mp
    (by decide +kernel)

theorem sourceChecked43_0 : ∀ i : Fin 16,
    (fun i => output43 i = raw43 (source43 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked43 : ∀ i : Fin 16, (fun i => output43 i = raw43 (source43 i)) i :=
  forallFin_of_zero_offset (fun i => output43 i = raw43 (source43 i)) sourceChecked43_0

theorem coverChecked43_0 : ∀ i : Fin 16,
    (fun i => (output43 (cover43 i)).ContainsBox (raw43 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked43 : ∀ i : Fin 16, (fun i => (output43 (cover43 i)).ContainsBox (raw43 i)) i :=
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

noncomputable def phaseMass43 : ℝ := singlePhaseMass (374268468/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw43 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass43_eq : phaseMass43 = (93567117/409600000000 : ℝ) := by
  unfold phaseMass43
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw43 output43 cover43 source43
    (gridTreeUnionCheck_sound 32768 raw43 output43 cover43 source43 tree43 checked43)
    _ (by norm_num) _, areaUnits43]
  norm_num

-- Frozen phase 3052, atom 7011, type 1, source (28,51).
def leavesData44 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves44 : Fin 7 → DyadicLeaf := leavesData44.get
def raw44 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 28 51 leaves44 i
def outputData44 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨7168,7296,13056,13184⟩) (.node (.single ⟨7168,7296,13184,13312⟩) (.single ⟨7296,7360,13056,13120⟩))) (.node (.node (.single ⟨7296,7360,13120,13184⟩) (.single ⟨7360,7424,13056,13120⟩)) (.node (.single ⟨7360,7424,13120,13184⟩) (.single ⟨7296,7424,13184,13312⟩)))) (.node (.node (.single ⟨13056,13184,7168,7296⟩) (.node (.single ⟨13056,13120,7296,7360⟩) (.single ⟨13056,13120,7360,7424⟩))) (.node (.node (.single ⟨13120,13184,7296,7360⟩) (.single ⟨13120,13184,7360,7424⟩)) (.node (.single ⟨13184,13312,7168,7296⟩) (.single ⟨13184,13312,7296,7424⟩))))) (.node (.node (.node (.single ⟨19456,19584,25344,25472⟩) (.node (.single ⟨19456,19584,25472,25600⟩) (.single ⟨19584,19648,25344,25408⟩))) (.node (.node (.single ⟨19584,19648,25408,25472⟩) (.single ⟨19648,19712,25344,25408⟩)) (.node (.single ⟨19648,19712,25408,25472⟩) (.single ⟨19584,19712,25472,25600⟩)))) (.node (.node (.single ⟨25344,25472,19456,19584⟩) (.node (.single ⟨25344,25408,19584,19648⟩) (.single ⟨25344,25408,19648,19712⟩))) (.node (.node (.single ⟨25408,25472,19584,19648⟩) (.single ⟨25408,25472,19648,19712⟩)) (.node (.single ⟨25472,25600,19456,19584⟩) (.single ⟨25472,25600,19584,19712⟩))))))
def output44 : Fin 28 → GridBox := outputData44.get
def coverData44 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData44 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover44 (i : Fin 28) : Fin 28 := ⟨coverData44.get i % 28, Nat.mod_lt _ (by decide)⟩
def source44 (i : Fin 28) : Fin 28 := ⟨sourceData44.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree44 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 .empty (.cutY 14336 (.cutX 7168 .empty (.cutY 13312 (.cutX 7680 (.cutY 12800 .empty (.cutX 7424 (.cutY 13056 .empty (.cutX 7296 (.cutY 13184 .full .full) (.cutY 13184 (.cutX 7360 (.cutY 13120 .full .full) (.cutY 13120 .full .full)) .full))) .empty)) .empty) .empty)) .empty))))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 (.cutY 6144 .empty (.cutX 13312 (.cutY 7168 .empty (.cutX 12800 .empty (.cutY 7680 (.cutX 13056 .empty (.cutY 7424 (.cutX 13184 (.cutY 7296 .full (.cutX 13120 (.cutY 7360 .full .full) (.cutY 7360 .full .full))) (.cutY 7296 .full .full)) .empty)) .empty))) .empty)) .empty))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 .empty (.cutY 26624 (.cutX 19456 .empty (.cutY 25600 (.cutX 19968 (.cutY 25088 .empty (.cutX 19712 (.cutY 25344 .empty (.cutX 19584 (.cutY 25472 .full .full) (.cutY 25472 (.cutX 19648 (.cutY 25408 .full .full) (.cutY 25408 .full .full)) .full))) .empty)) .empty) .empty)) .empty)) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 (.cutY 18432 .empty (.cutX 25600 (.cutY 19456 .empty (.cutX 25088 .empty (.cutY 19968 (.cutX 25344 .empty (.cutY 19712 (.cutX 25472 (.cutY 19584 .full (.cutX 25408 (.cutY 19648 .full .full) (.cutY 19648 .full .full))) (.cutY 19584 .full .full)) .empty)) .empty))) .empty)) .empty) .empty) .empty) .empty))))

theorem metadata44 : 0<202650974 ∧ 28<128 ∧ 51<128 ∧ 1<4 ∧
    7011/4160=1 ∧ 7011%4160=2851 ∧ ∀ i, (leaves44 i).Valid 8 := by
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

noncomputable def phaseMass44 : ℝ := singlePhaseMass (202650974/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw44 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass44_eq : phaseMass44 = (101325487/819200000000 : ℝ) := by
  unfold phaseMass44
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw44 output44 cover44 source44
    (gridTreeUnionCheck_sound 32768 raw44 output44 cover44 source44 tree44 checked44)
    _ (by norm_num) _, areaUnits44]
  norm_num

-- Frozen phase 3053, atom 6783, type 1, source (25,48).
def leavesData45 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves45 : Fin 7 → DyadicLeaf := leavesData45.get
def raw45 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 25 48 leaves45 i
def outputData45 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨6400,6528,12288,12416⟩) (.node (.single ⟨6400,6528,12416,12544⟩) (.single ⟨6528,6592,12288,12352⟩))) (.node (.node (.single ⟨6528,6592,12352,12416⟩) (.single ⟨6592,6656,12288,12352⟩)) (.node (.single ⟨6592,6656,12352,12416⟩) (.single ⟨6528,6656,12416,12544⟩)))) (.node (.node (.single ⟨12288,12416,6400,6528⟩) (.node (.single ⟨12288,12352,6528,6592⟩) (.single ⟨12288,12352,6592,6656⟩))) (.node (.node (.single ⟨12352,12416,6528,6592⟩) (.single ⟨12352,12416,6592,6656⟩)) (.node (.single ⟨12416,12544,6400,6528⟩) (.single ⟨12416,12544,6528,6656⟩))))) (.node (.node (.node (.single ⟨20224,20352,26112,26240⟩) (.node (.single ⟨20224,20352,26240,26368⟩) (.single ⟨20352,20416,26112,26176⟩))) (.node (.node (.single ⟨20352,20416,26176,26240⟩) (.single ⟨20416,20480,26112,26176⟩)) (.node (.single ⟨20416,20480,26176,26240⟩) (.single ⟨20352,20480,26240,26368⟩)))) (.node (.node (.single ⟨26112,26240,20224,20352⟩) (.node (.single ⟨26112,26176,20352,20416⟩) (.single ⟨26112,26176,20416,20480⟩))) (.node (.node (.single ⟨26176,26240,20352,20416⟩) (.single ⟨26176,26240,20416,20480⟩)) (.node (.single ⟨26240,26368,20224,20352⟩) (.single ⟨26240,26368,20352,20480⟩))))))
def output45 : Fin 28 → GridBox := outputData45.get
def coverData45 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData45 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover45 (i : Fin 28) : Fin 28 := ⟨coverData45.get i % 28, Nat.mod_lt _ (by decide)⟩
def source45 (i : Fin 28) : Fin 28 := ⟨sourceData45.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree45 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 .empty (.cutY 14336 (.cutX 7168 (.cutY 13312 (.cutX 6656 (.cutY 12800 (.cutX 6400 .empty (.cutY 12544 (.cutX 6528 (.cutY 12416 .full .full) (.cutY 12416 (.cutX 6592 (.cutY 12352 .full .full) (.cutY 12352 .full .full)) .full)) .empty)) .empty) .empty) .empty) .empty) .empty))))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 (.cutY 6144 .empty (.cutX 13312 (.cutY 7168 (.cutX 12800 (.cutY 6656 (.cutX 12544 (.cutY 6400 .empty (.cutX 12416 (.cutY 6528 .full (.cutX 12352 (.cutY 6592 .full .full) (.cutY 6592 .full .full))) (.cutY 6528 .full .full))) .empty) .empty) .empty) .empty) .empty)) .empty))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 .empty (.cutY 26624 (.cutX 19456 .empty (.cutY 25600 .empty (.cutX 19968 .empty (.cutY 26112 .empty (.cutX 20224 .empty (.cutY 26368 (.cutX 20352 (.cutY 26240 .full .full) (.cutY 26240 (.cutX 20416 (.cutY 26176 .full .full) (.cutY 26176 .full .full)) .full)) .empty)))))) .empty)) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 (.cutY 18432 .empty (.cutX 25600 .empty (.cutY 19456 .empty (.cutX 26112 .empty (.cutY 19968 .empty (.cutX 26368 (.cutY 20224 .empty (.cutX 26240 (.cutY 20352 .full (.cutX 26176 (.cutY 20416 .full .full) (.cutY 20416 .full .full))) (.cutY 20352 .full .full))) .empty)))))) .empty) .empty) .empty) .empty))))

theorem metadata45 : 0<202650974 ∧ 25<128 ∧ 48<128 ∧ 1<4 ∧
    6783/4160=1 ∧ 6783%4160=2623 ∧ ∀ i, (leaves45 i).Valid 8 := by
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

noncomputable def phaseMass45 : ℝ := singlePhaseMass (202650974/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw45 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass45_eq : phaseMass45 = (101325487/819200000000 : ℝ) := by
  unfold phaseMass45
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw45 output45 cover45 source45
    (gridTreeUnionCheck_sound 32768 raw45 output45 cover45 source45 tree45 checked45)
    _ (by norm_num) _, areaUnits45]
  norm_num

-- Frozen phase 3054, atom 7286, type 1, source (32,54).
def leavesData46 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves46 : Fin 7 → DyadicLeaf := leavesData46.get
def raw46 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 32 54 leaves46 i
def outputData46 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨8192,8320,13824,13952⟩) (.node (.single ⟨8192,8320,13952,14080⟩) (.single ⟨8320,8384,13824,13888⟩))) (.node (.node (.single ⟨8320,8384,13888,13952⟩) (.single ⟨8384,8448,13824,13888⟩)) (.node (.single ⟨8384,8448,13888,13952⟩) (.single ⟨8320,8448,13952,14080⟩)))) (.node (.node (.single ⟨13824,13952,8192,8320⟩) (.node (.single ⟨13824,13888,8320,8384⟩) (.single ⟨13824,13888,8384,8448⟩))) (.node (.node (.single ⟨13888,13952,8320,8384⟩) (.single ⟨13888,13952,8384,8448⟩)) (.node (.single ⟨13952,14080,8192,8320⟩) (.single ⟨13952,14080,8320,8448⟩))))) (.node (.node (.node (.single ⟨18688,18816,24320,24448⟩) (.node (.single ⟨18688,18816,24448,24576⟩) (.single ⟨18816,18880,24320,24384⟩))) (.node (.node (.single ⟨18816,18880,24384,24448⟩) (.single ⟨18880,18944,24320,24384⟩)) (.node (.single ⟨18880,18944,24384,24448⟩) (.single ⟨18816,18944,24448,24576⟩)))) (.node (.node (.single ⟨24320,24448,18688,18816⟩) (.node (.single ⟨24320,24384,18816,18880⟩) (.single ⟨24320,24384,18880,18944⟩))) (.node (.node (.single ⟨24384,24448,18816,18880⟩) (.single ⟨24384,24448,18880,18944⟩)) (.node (.single ⟨24448,24576,18688,18816⟩) (.single ⟨24448,24576,18816,18944⟩))))))
def output46 : Fin 28 → GridBox := outputData46.get
def coverData46 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData46 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover46 (i : Fin 28) : Fin 28 := ⟨coverData46.get i % 28, Nat.mod_lt _ (by decide)⟩
def source46 (i : Fin 28) : Fin 28 := ⟨sourceData46.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree46 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 (.cutY 14336 (.cutX 9216 (.cutY 13312 .empty (.cutX 8704 (.cutY 13824 .empty (.cutX 8448 (.cutY 14080 (.cutX 8320 (.cutY 13952 .full .full) (.cutY 13952 (.cutX 8384 (.cutY 13888 .full .full) (.cutY 13888 .full .full)) .full)) .empty) .empty)) .empty)) .empty) .empty) .empty)) (.cutY 12288 (.cutX 14336 (.cutY 10240 (.cutX 13312 .empty (.cutY 9216 (.cutX 13824 .empty (.cutY 8704 (.cutX 14080 (.cutY 8448 (.cutX 13952 (.cutY 8320 .full (.cutX 13888 (.cutY 8384 .full .full) (.cutY 8384 .full .full))) (.cutY 8320 .full .full)) .empty) .empty) .empty)) .empty)) .empty) .empty) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 .empty (.cutY 22528 .empty (.cutX 19456 (.cutY 23552 .empty (.cutX 18944 (.cutY 24064 .empty (.cutX 18688 .empty (.cutY 24320 .empty (.cutX 18816 (.cutY 24448 .full .full) (.cutY 24448 (.cutX 18880 (.cutY 24384 .full .full) (.cutY 24384 .full .full)) .full))))) .empty)) .empty)))) (.cutY 20480 (.cutX 22528 .empty (.cutY 18432 .empty (.cutX 23552 .empty (.cutY 19456 (.cutX 24064 .empty (.cutY 18944 (.cutX 24320 .empty (.cutY 18688 .empty (.cutX 24448 (.cutY 18816 .full (.cutX 24384 (.cutY 18880 .full .full) (.cutY 18880 .full .full))) (.cutY 18816 .full .full)))) .empty)) .empty)))) .empty)) .empty) .empty)))

theorem metadata46 : 0<134822691 ∧ 32<128 ∧ 54<128 ∧ 1<4 ∧
    7286/4160=1 ∧ 7286%4160=3126 ∧ ∀ i, (leaves46 i).Valid 8 := by
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

noncomputable def phaseMass46 : ℝ := singlePhaseMass (134822691/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw46 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass46_eq : phaseMass46 = (134822691/1638400000000 : ℝ) := by
  unfold phaseMass46
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw46 output46 cover46 source46
    (gridTreeUnionCheck_sound 32768 raw46 output46 cover46 source46 tree46 checked46)
    _ (by norm_num) _, areaUnits46]
  norm_num

-- Frozen phase 3055, atom 3194, type 0, source (33,59).
def leavesData47 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves47 : Fin 1 → DyadicLeaf := leavesData47.get
def raw47 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 33 59 leaves47 i
def outputData47 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨8448,8704,15104,15360⟩) (.single ⟨15104,15360,8448,8704⟩)) (.node (.single ⟨17408,17664,24064,24320⟩) (.single ⟨24064,24320,17408,17664⟩)))
def output47 : Fin 4 → GridBox := outputData47.get
def coverData47 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData47 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover47 (i : Fin 4) : Fin 4 := ⟨coverData47.get i % 4, Nat.mod_lt _ (by decide)⟩
def source47 (i : Fin 4) : Fin 4 := ⟨sourceData47.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree47 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 (.cutY 14336 .empty (.cutX 9216 (.cutY 15360 (.cutX 8704 (.cutY 14848 .empty (.cutX 8448 .empty (.cutY 15104 .empty .full))) .empty) .empty) .empty)) .empty)) (.cutY 12288 (.cutX 14336 .empty (.cutY 10240 (.cutX 15360 (.cutY 9216 (.cutX 14848 .empty (.cutY 8704 (.cutX 15104 .empty (.cutY 8448 .empty .full)) .empty)) .empty) .empty) .empty)) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 (.cutY 22528 .empty (.cutX 17408 .empty (.cutY 23552 .empty (.cutX 17920 (.cutY 24064 .empty (.cutX 17664 (.cutY 24320 .full .empty) .empty)) .empty)))) .empty)) (.cutY 20480 (.cutX 22528 .empty (.cutY 18432 (.cutX 23552 .empty (.cutY 17408 .empty (.cutX 24064 .empty (.cutY 17920 (.cutX 24320 (.cutY 17664 .full .empty) .empty) .empty)))) .empty)) .empty)) .empty) .empty)))

theorem metadata47 : 0<200205545 ∧ 33<128 ∧ 59<128 ∧ 0<4 ∧
    3194/4160=0 ∧ 3194%4160=3194 ∧ ∀ i, (leaves47 i).Valid 8 := by
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

noncomputable def phaseMass47 : ℝ := singlePhaseMass (200205545/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw47 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass47_eq : phaseMass47 = (40041109/327680000000 : ℝ) := by
  unfold phaseMass47
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw47 output47 cover47 source47
    (gridTreeUnionCheck_sound 32768 raw47 output47 cover47 source47 tree47 checked47)
    _ (by norm_num) _, areaUnits47]
  norm_num

-- Frozen phase 3056, atom 2628, type 0, source (25,53).
def leavesData48 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves48 : Fin 4 → DyadicLeaf := leavesData48.get
def raw48 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 25 53 leaves48 i
def outputData48 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨6400,6528,13568,13696⟩) (.single ⟨6400,6528,13696,13824⟩)) (.node (.single ⟨6528,6656,13568,13696⟩) (.single ⟨6528,6656,13696,13824⟩))) (.node (.node (.single ⟨13568,13696,6400,6528⟩) (.single ⟨13568,13696,6528,6656⟩)) (.node (.single ⟨13696,13824,6400,6528⟩) (.single ⟨13696,13824,6528,6656⟩)))) (.node (.node (.node (.single ⟨18944,19072,26112,26240⟩) (.single ⟨18944,19072,26240,26368⟩)) (.node (.single ⟨19072,19200,26112,26240⟩) (.single ⟨19072,19200,26240,26368⟩))) (.node (.node (.single ⟨26112,26240,18944,19072⟩) (.single ⟨26112,26240,19072,19200⟩)) (.node (.single ⟨26240,26368,18944,19072⟩) (.single ⟨26240,26368,19072,19200⟩)))))
def output48 : Fin 16 → GridBox := outputData48.get
def coverData48 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData48 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover48 (i : Fin 16) : Fin 16 := ⟨coverData48.get i % 16, Nat.mod_lt _ (by decide)⟩
def source48 (i : Fin 16) : Fin 16 := ⟨sourceData48.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree48 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 .empty (.cutY 14336 (.cutX 7168 (.cutY 13312 .empty (.cutX 6656 (.cutY 13824 (.cutX 6400 .empty (.cutY 13568 .empty (.cutX 6528 (.cutY 13696 .full .full) (.cutY 13696 .full .full)))) .empty) .empty)) .empty) .empty))))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 (.cutY 6144 .empty (.cutX 13312 .empty (.cutY 7168 (.cutX 13824 (.cutY 6656 (.cutX 13568 .empty (.cutY 6400 .empty (.cutX 13696 (.cutY 6528 .full .full) (.cutY 6528 .full .full)))) .empty) .empty) .empty))) .empty))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 .empty (.cutY 26624 (.cutX 19456 (.cutY 25600 .empty (.cutX 18944 .empty (.cutY 26112 .empty (.cutX 19200 (.cutY 26368 (.cutX 19072 (.cutY 26240 .full .full) (.cutY 26240 .full .full)) .empty) .empty)))) .empty) .empty)) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 (.cutY 18432 .empty (.cutX 25600 .empty (.cutY 19456 (.cutX 26112 .empty (.cutY 18944 .empty (.cutX 26368 (.cutY 19200 (.cutX 26240 (.cutY 19072 .full .full) (.cutY 19072 .full .full)) .empty) .empty))) .empty))) .empty) .empty) .empty) .empty))))

theorem metadata48 : 0<300263580 ∧ 25<128 ∧ 53<128 ∧ 0<4 ∧
    2628/4160=0 ∧ 2628%4160=2628 ∧ ∀ i, (leaves48 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData48).mp
    (by decide +kernel)

theorem sourceChecked48_0 : ∀ i : Fin 16,
    (fun i => output48 i = raw48 (source48 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked48 : ∀ i : Fin 16, (fun i => output48 i = raw48 (source48 i)) i :=
  forallFin_of_zero_offset (fun i => output48 i = raw48 (source48 i)) sourceChecked48_0

theorem coverChecked48_0 : ∀ i : Fin 16,
    (fun i => (output48 (cover48 i)).ContainsBox (raw48 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked48 : ∀ i : Fin 16, (fun i => (output48 (cover48 i)).ContainsBox (raw48 i)) i :=
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

noncomputable def phaseMass48 : ℝ := singlePhaseMass (300263580/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw48 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass48_eq : phaseMass48 = (15013179/81920000000 : ℝ) := by
  unfold phaseMass48
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw48 output48 cover48 source48
    (gridTreeUnionCheck_sound 32768 raw48 output48 cover48 source48 tree48 checked48)
    _ (by norm_num) _, areaUnits48]
  norm_num

-- Frozen phase 3057, atom 3483, type 0, source (38,63).
def leavesData49 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves49 : Fin 1 → DyadicLeaf := leavesData49.get
def raw49 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 38 63 leaves49 i
def outputData49 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨9728,9984,16128,16384⟩) (.single ⟨16128,16384,9728,9984⟩)) (.node (.single ⟨16384,16640,22784,23040⟩) (.single ⟨22784,23040,16384,16640⟩)))
def output49 : Fin 4 → GridBox := outputData49.get
def coverData49 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData49 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover49 (i : Fin 4) : Fin 4 := ⟨coverData49.get i % 4, Nat.mod_lt _ (by decide)⟩
def source49 (i : Fin 4) : Fin 4 := ⟨sourceData49.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree49 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 (.cutY 14336 .empty (.cutX 9216 .empty (.cutY 15360 .empty (.cutX 9728 .empty (.cutY 15872 .empty (.cutX 9984 (.cutY 16128 .empty .full) .empty)))))) .empty)) (.cutY 12288 (.cutX 14336 .empty (.cutY 10240 (.cutX 15360 .empty (.cutY 9216 .empty (.cutX 15872 .empty (.cutY 9728 .empty (.cutX 16128 .empty (.cutY 9984 .full .empty)))))) .empty)) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 (.cutY 22528 .empty (.cutX 17408 (.cutY 23552 (.cutX 16896 (.cutY 23040 (.cutX 16640 (.cutY 22784 .empty .full) .empty) .empty) .empty) .empty) .empty)) .empty)) (.cutY 20480 (.cutX 22528 .empty (.cutY 18432 (.cutX 23552 (.cutY 17408 (.cutX 23040 (.cutY 16896 (.cutX 22784 .empty (.cutY 16640 .full .empty)) .empty) .empty) .empty) .empty) .empty)) .empty)) .empty) .empty)))

theorem metadata49 : 0<200205545 ∧ 38<128 ∧ 63<128 ∧ 0<4 ∧
    3483/4160=0 ∧ 3483%4160=3483 ∧ ∀ i, (leaves49 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData49).mp
    (by decide +kernel)

theorem sourceChecked49_0 : ∀ i : Fin 4,
    (fun i => output49 i = raw49 (source49 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked49 : ∀ i : Fin 4, (fun i => output49 i = raw49 (source49 i)) i :=
  forallFin_of_zero_offset (fun i => output49 i = raw49 (source49 i)) sourceChecked49_0

theorem coverChecked49_0 : ∀ i : Fin 4,
    (fun i => (output49 (cover49 i)).ContainsBox (raw49 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked49 : ∀ i : Fin 4, (fun i => (output49 (cover49 i)).ContainsBox (raw49 i)) i :=
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

noncomputable def phaseMass49 : ℝ := singlePhaseMass (200205545/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw49 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass49_eq : phaseMass49 = (40041109/327680000000 : ℝ) := by
  unfold phaseMass49
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw49 output49 cover49 source49
    (gridTreeUnionCheck_sound 32768 raw49 output49 cover49 source49 tree49 checked49)
    _ (by norm_num) _, areaUnits49]
  norm_num

-- Frozen phase 3058, atom 40, type 0, source (0,40).
def leavesData50 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves50 : Fin 1 → DyadicLeaf := leavesData50.get
def raw50 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 0 40 leaves50 i
def outputData50 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨0,256,10240,10496⟩) (.single ⟨10240,10496,0,256⟩)) (.node (.single ⟨22272,22528,32512,32768⟩) (.single ⟨32512,32768,22272,22528⟩)))
def output50 : Fin 4 → GridBox := outputData50.get
def coverData50 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData50 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover50 (i : Fin 4) : Fin 4 := ⟨coverData50.get i % 4, Nat.mod_lt _ (by decide)⟩
def source50 (i : Fin 4) : Fin 4 := ⟨sourceData50.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree50 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 (.cutY 10240 .empty (.cutX 1024 (.cutY 11264 (.cutX 512 (.cutY 10752 (.cutX 256 (.cutY 10496 .full .empty) .empty) .empty) .empty) .empty) .empty)) .empty) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 .empty (.cutY 2048 (.cutX 11264 (.cutY 1024 (.cutX 10752 (.cutY 512 (.cutX 10496 (.cutY 256 .full .empty) .empty) .empty) .empty) .empty) .empty) .empty)) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 (.cutY 30720 .empty (.cutX 21504 .empty (.cutY 31744 .empty (.cutX 22016 .empty (.cutY 32256 .empty (.cutX 22272 .empty (.cutY 32512 .empty .full))))))) .empty)))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 .empty (.cutY 22528 (.cutX 31744 .empty (.cutY 21504 .empty (.cutX 32256 .empty (.cutY 22016 .empty (.cutX 32512 .empty (.cutY 22272 .empty .full)))))) .empty)))) .empty))))

theorem metadata50 : 0<374268468 ∧ 0<128 ∧ 40<128 ∧ 0<4 ∧
    40/4160=0 ∧ 40%4160=40 ∧ ∀ i, (leaves50 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData50).mp
    (by decide +kernel)

theorem sourceChecked50_0 : ∀ i : Fin 4,
    (fun i => output50 i = raw50 (source50 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked50 : ∀ i : Fin 4, (fun i => output50 i = raw50 (source50 i)) i :=
  forallFin_of_zero_offset (fun i => output50 i = raw50 (source50 i)) sourceChecked50_0

theorem coverChecked50_0 : ∀ i : Fin 4,
    (fun i => (output50 (cover50 i)).ContainsBox (raw50 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked50 : ∀ i : Fin 4, (fun i => (output50 (cover50 i)).ContainsBox (raw50 i)) i :=
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

noncomputable def phaseMass50 : ℝ := singlePhaseMass (374268468/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw50 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass50_eq : phaseMass50 = (93567117/409600000000 : ℝ) := by
  unfold phaseMass50
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw50 output50 cover50 source50
    (gridTreeUnionCheck_sound 32768 raw50 output50 cover50 source50 tree50 checked50)
    _ (by norm_num) _, areaUnits50]
  norm_num

-- Frozen phase 3059, atom 416, type 0, source (3,41).
def leavesData51 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves51 : Fin 1 → DyadicLeaf := leavesData51.get
def raw51 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 3 41 leaves51 i
def outputData51 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨768,1024,10496,10752⟩) (.single ⟨10496,10752,768,1024⟩)) (.node (.single ⟨22016,22272,31744,32000⟩) (.single ⟨31744,32000,22016,22272⟩)))
def output51 : Fin 4 → GridBox := outputData51.get
def coverData51 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData51 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover51 (i : Fin 4) : Fin 4 := ⟨coverData51.get i % 4, Nat.mod_lt _ (by decide)⟩
def source51 (i : Fin 4) : Fin 4 := ⟨sourceData51.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree51 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 (.cutY 10240 .empty (.cutX 1024 (.cutY 11264 (.cutX 512 .empty (.cutY 10752 (.cutX 768 .empty (.cutY 10496 .empty .full)) .empty)) .empty) .empty)) .empty) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 .empty (.cutY 2048 (.cutX 11264 (.cutY 1024 (.cutX 10752 (.cutY 512 .empty (.cutX 10496 .empty (.cutY 768 .empty .full))) .empty) .empty) .empty) .empty)) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 (.cutY 30720 .empty (.cutX 21504 .empty (.cutY 31744 .empty (.cutX 22016 .empty (.cutY 32256 (.cutX 22272 (.cutY 32000 .full .empty) .empty) .empty))))) .empty)))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 .empty (.cutY 22528 (.cutX 31744 .empty (.cutY 21504 .empty (.cutX 32256 (.cutY 22016 .empty (.cutX 32000 (.cutY 22272 .full .empty) .empty)) .empty))) .empty)))) .empty))))

theorem metadata51 : 0<374268468 ∧ 3<128 ∧ 41<128 ∧ 0<4 ∧
    416/4160=0 ∧ 416%4160=416 ∧ ∀ i, (leaves51 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData51).mp
    (by decide +kernel)

theorem sourceChecked51_0 : ∀ i : Fin 4,
    (fun i => output51 i = raw51 (source51 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked51 : ∀ i : Fin 4, (fun i => output51 i = raw51 (source51 i)) i :=
  forallFin_of_zero_offset (fun i => output51 i = raw51 (source51 i)) sourceChecked51_0

theorem coverChecked51_0 : ∀ i : Fin 4,
    (fun i => (output51 (cover51 i)).ContainsBox (raw51 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked51 : ∀ i : Fin 4, (fun i => (output51 (cover51 i)).ContainsBox (raw51 i)) i :=
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

noncomputable def phaseMass51 : ℝ := singlePhaseMass (374268468/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw51 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass51_eq : phaseMass51 = (93567117/409600000000 : ℝ) := by
  unfold phaseMass51
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw51 output51 cover51 source51
    (gridTreeUnionCheck_sound 32768 raw51 output51 cover51 source51 tree51 checked51)
    _ (by norm_num) _, areaUnits51]
  norm_num

-- Frozen phase 3060, atom 7639, type 1, source (38,59).
def leavesData52 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves52 : Fin 7 → DyadicLeaf := leavesData52.get
def raw52 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 38 59 leaves52 i
def outputData52 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨9728,9856,15104,15232⟩) (.node (.single ⟨9728,9856,15232,15360⟩) (.single ⟨9856,9920,15104,15168⟩))) (.node (.node (.single ⟨9856,9920,15168,15232⟩) (.single ⟨9920,9984,15104,15168⟩)) (.node (.single ⟨9920,9984,15168,15232⟩) (.single ⟨9856,9984,15232,15360⟩)))) (.node (.node (.single ⟨15104,15232,9728,9856⟩) (.node (.single ⟨15104,15168,9856,9920⟩) (.single ⟨15104,15168,9920,9984⟩))) (.node (.node (.single ⟨15168,15232,9856,9920⟩) (.single ⟨15168,15232,9920,9984⟩)) (.node (.single ⟨15232,15360,9728,9856⟩) (.single ⟨15232,15360,9856,9984⟩))))) (.node (.node (.node (.single ⟨17408,17536,22784,22912⟩) (.node (.single ⟨17408,17536,22912,23040⟩) (.single ⟨17536,17600,22784,22848⟩))) (.node (.node (.single ⟨17536,17600,22848,22912⟩) (.single ⟨17600,17664,22784,22848⟩)) (.node (.single ⟨17600,17664,22848,22912⟩) (.single ⟨17536,17664,22912,23040⟩)))) (.node (.node (.single ⟨22784,22912,17408,17536⟩) (.node (.single ⟨22784,22848,17536,17600⟩) (.single ⟨22784,22848,17600,17664⟩))) (.node (.node (.single ⟨22848,22912,17536,17600⟩) (.single ⟨22848,22912,17600,17664⟩)) (.node (.single ⟨22912,23040,17408,17536⟩) (.single ⟨22912,23040,17536,17664⟩))))))
def output52 : Fin 28 → GridBox := outputData52.get
def coverData52 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData52 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover52 (i : Fin 28) : Fin 28 := ⟨coverData52.get i % 28, Nat.mod_lt _ (by decide)⟩
def source52 (i : Fin 28) : Fin 28 := ⟨sourceData52.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree52 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 (.cutY 14336 .empty (.cutX 9216 .empty (.cutY 15360 (.cutX 9728 .empty (.cutY 14848 .empty (.cutX 9984 (.cutY 15104 .empty (.cutX 9856 (.cutY 15232 .full .full) (.cutY 15232 (.cutX 9920 (.cutY 15168 .full .full) (.cutY 15168 .full .full)) .full))) .empty))) .empty))) .empty)) (.cutY 12288 (.cutX 14336 .empty (.cutY 10240 (.cutX 15360 (.cutY 9216 .empty (.cutX 14848 .empty (.cutY 9728 .empty (.cutX 15104 .empty (.cutY 9984 (.cutX 15232 (.cutY 9856 .full (.cutX 15168 (.cutY 9920 .full .full) (.cutY 9920 .full .full))) (.cutY 9856 .full .full)) .empty))))) .empty) .empty)) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 (.cutY 22528 .empty (.cutX 17408 .empty (.cutY 23552 (.cutX 17920 (.cutY 23040 (.cutX 17664 (.cutY 22784 .empty (.cutX 17536 (.cutY 22912 .full .full) (.cutY 22912 (.cutX 17600 (.cutY 22848 .full .full) (.cutY 22848 .full .full)) .full))) .empty) .empty) .empty) .empty))) .empty)) (.cutY 20480 (.cutX 22528 .empty (.cutY 18432 (.cutX 23552 (.cutY 17408 .empty (.cutX 23040 (.cutY 17920 (.cutX 22784 .empty (.cutY 17664 (.cutX 22912 (.cutY 17536 .full (.cutX 22848 (.cutY 17600 .full .full) (.cutY 17600 .full .full))) (.cutY 17536 .full .full)) .empty)) .empty) .empty)) .empty) .empty)) .empty)) .empty) .empty)))

theorem metadata52 : 0<168966520 ∧ 38<128 ∧ 59<128 ∧ 1<4 ∧
    7639/4160=1 ∧ 7639%4160=3479 ∧ ∀ i, (leaves52 i).Valid 8 := by
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

noncomputable def phaseMass52 : ℝ := singlePhaseMass (168966520/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw52 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass52_eq : phaseMass52 = (4224163/40960000000 : ℝ) := by
  unfold phaseMass52
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw52 output52 cover52 source52
    (gridTreeUnionCheck_sound 32768 raw52 output52 cover52 source52 tree52 checked52)
    _ (by norm_num) _, areaUnits52]
  norm_num

-- Frozen phase 3061, atom 5486, type 1, source (11,39).
def leavesData53 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves53 : Fin 7 → DyadicLeaf := leavesData53.get
def raw53 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 11 39 leaves53 i
def outputData53 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨2816,2944,9984,10112⟩) (.node (.single ⟨2816,2944,10112,10240⟩) (.single ⟨2944,3008,9984,10048⟩))) (.node (.node (.single ⟨2944,3008,10048,10112⟩) (.single ⟨3008,3072,9984,10048⟩)) (.node (.single ⟨3008,3072,10048,10112⟩) (.single ⟨2944,3072,10112,10240⟩)))) (.node (.node (.single ⟨9984,10112,2816,2944⟩) (.node (.single ⟨9984,10048,2944,3008⟩) (.single ⟨9984,10048,3008,3072⟩))) (.node (.node (.single ⟨10048,10112,2944,3008⟩) (.single ⟨10048,10112,3008,3072⟩)) (.node (.single ⟨10112,10240,2816,2944⟩) (.single ⟨10112,10240,2944,3072⟩))))) (.node (.node (.node (.single ⟨22528,22656,29696,29824⟩) (.node (.single ⟨22528,22656,29824,29952⟩) (.single ⟨22656,22720,29696,29760⟩))) (.node (.node (.single ⟨22656,22720,29760,29824⟩) (.single ⟨22720,22784,29696,29760⟩)) (.node (.single ⟨22720,22784,29760,29824⟩) (.single ⟨22656,22784,29824,29952⟩)))) (.node (.node (.single ⟨29696,29824,22528,22656⟩) (.node (.single ⟨29696,29760,22656,22720⟩) (.single ⟨29696,29760,22720,22784⟩))) (.node (.node (.single ⟨29760,29824,22656,22720⟩) (.single ⟨29760,29824,22720,22784⟩)) (.node (.single ⟨29824,29952,22528,22656⟩) (.single ⟨29824,29952,22656,22784⟩))))))
def output53 : Fin 28 → GridBox := outputData53.get
def coverData53 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData53 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover53 (i : Fin 28) : Fin 28 := ⟨coverData53.get i % 28, Nat.mod_lt _ (by decide)⟩
def source53 (i : Fin 28) : Fin 28 := ⟨sourceData53.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree53 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 .empty (.cutY 10240 (.cutX 3072 (.cutY 9216 .empty (.cutX 2560 .empty (.cutY 9728 .empty (.cutX 2816 .empty (.cutY 9984 .empty (.cutX 2944 (.cutY 10112 .full .full) (.cutY 10112 (.cutX 3008 (.cutY 10048 .full .full) (.cutY 10048 .full .full)) .full))))))) .empty) .empty)) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 .empty (.cutX 9216 .empty (.cutY 3072 (.cutX 9728 .empty (.cutY 2560 .empty (.cutX 9984 .empty (.cutY 2816 .empty (.cutX 10112 (.cutY 2944 .full (.cutX 10048 (.cutY 3008 .full .full) (.cutY 3008 .full .full))) (.cutY 2944 .full .full)))))) .empty))) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 (.cutX 23552 (.cutY 29696 .empty (.cutX 23040 (.cutY 30208 (.cutX 22784 (.cutY 29952 (.cutX 22656 (.cutY 29824 .full .full) (.cutY 29824 (.cutX 22720 (.cutY 29760 .full .full) (.cutY 29760 .full .full)) .full)) .empty) .empty) .empty) .empty)) .empty) .empty))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 (.cutY 22528 .empty (.cutX 29696 .empty (.cutY 23552 (.cutX 30208 (.cutY 23040 (.cutX 29952 (.cutY 22784 (.cutX 29824 (.cutY 22656 .full (.cutX 29760 (.cutY 22720 .full .full) (.cutY 22720 .full .full))) (.cutY 22656 .full .full)) .empty) .empty) .empty) .empty) .empty))) .empty))) .empty))))

theorem metadata53 : 0<190129790 ∧ 11<128 ∧ 39<128 ∧ 1<4 ∧
    5486/4160=1 ∧ 5486%4160=1326 ∧ ∀ i, (leaves53 i).Valid 8 := by
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

noncomputable def phaseMass53 : ℝ := singlePhaseMass (190129790/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw53 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass53_eq : phaseMass53 = (19012979/163840000000 : ℝ) := by
  unfold phaseMass53
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw53 output53 cover53 source53
    (gridTreeUnionCheck_sound 32768 raw53 output53 cover53 source53 tree53 checked53)
    _ (by norm_num) _, areaUnits53]
  norm_num

-- Frozen phase 3062, atom 5046, type 1, source (7,39).
def leavesData54 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves54 : Fin 4 → DyadicLeaf := leavesData54.get
def raw54 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 7 39 leaves54 i
def outputData54 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨1792,1920,9984,10112⟩) (.single ⟨1792,1920,10112,10240⟩)) (.node (.single ⟨1920,2048,9984,10112⟩) (.single ⟨1920,2048,10112,10240⟩))) (.node (.node (.single ⟨9984,10112,1792,1920⟩) (.single ⟨9984,10112,1920,2048⟩)) (.node (.single ⟨10112,10240,1792,1920⟩) (.single ⟨10112,10240,1920,2048⟩)))) (.node (.node (.node (.single ⟨22528,22656,30720,30848⟩) (.single ⟨22528,22656,30848,30976⟩)) (.node (.single ⟨22656,22784,30720,30848⟩) (.single ⟨22656,22784,30848,30976⟩))) (.node (.node (.single ⟨30720,30848,22528,22656⟩) (.single ⟨30720,30848,22656,22784⟩)) (.node (.single ⟨30848,30976,22528,22656⟩) (.single ⟨30848,30976,22656,22784⟩)))))
def output54 : Fin 16 → GridBox := outputData54.get
def coverData54 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData54 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover54 (i : Fin 16) : Fin 16 := ⟨coverData54.get i % 16, Nat.mod_lt _ (by decide)⟩
def source54 (i : Fin 16) : Fin 16 := ⟨sourceData54.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree54 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 (.cutY 10240 (.cutX 1024 .empty (.cutY 9216 .empty (.cutX 1536 .empty (.cutY 9728 .empty (.cutX 1792 .empty (.cutY 9984 .empty (.cutX 1920 (.cutY 10112 .full .full) (.cutY 10112 .full .full)))))))) .empty) .empty) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 (.cutX 9216 .empty (.cutY 1024 .empty (.cutX 9728 .empty (.cutY 1536 .empty (.cutX 9984 .empty (.cutY 1792 .empty (.cutX 10112 (.cutY 1920 .full .full) (.cutY 1920 .full .full)))))))) .empty) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 .empty (.cutX 23552 (.cutY 31744 (.cutX 23040 (.cutY 31232 (.cutX 22784 (.cutY 30976 (.cutX 22656 (.cutY 30848 .full .full) (.cutY 30848 .full .full)) .empty) .empty) .empty) .empty) .empty) .empty)))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 .empty (.cutY 22528 .empty (.cutX 31744 (.cutY 23552 (.cutX 31232 (.cutY 23040 (.cutX 30976 (.cutY 22784 (.cutX 30848 (.cutY 22656 .full .full) (.cutY 22656 .full .full)) .empty) .empty) .empty) .empty) .empty) .empty))))) .empty))))

theorem metadata54 : 0<475523442 ∧ 7<128 ∧ 39<128 ∧ 1<4 ∧
    5046/4160=1 ∧ 5046%4160=886 ∧ ∀ i, (leaves54 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData54).mp
    (by decide +kernel)

theorem sourceChecked54_0 : ∀ i : Fin 16,
    (fun i => output54 i = raw54 (source54 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked54 : ∀ i : Fin 16, (fun i => output54 i = raw54 (source54 i)) i :=
  forallFin_of_zero_offset (fun i => output54 i = raw54 (source54 i)) sourceChecked54_0

theorem coverChecked54_0 : ∀ i : Fin 16,
    (fun i => (output54 (cover54 i)).ContainsBox (raw54 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked54 : ∀ i : Fin 16, (fun i => (output54 (cover54 i)).ContainsBox (raw54 i)) i :=
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

noncomputable def phaseMass54 : ℝ := singlePhaseMass (475523442/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw54 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass54_eq : phaseMass54 = (237761721/819200000000 : ℝ) := by
  unfold phaseMass54
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw54 output54 cover54 source54
    (gridTreeUnionCheck_sound 32768 raw54 output54 cover54 source54 tree54 checked54)
    _ (by norm_num) _, areaUnits54]
  norm_num

-- Frozen phase 3063, atom 4931, type 1, source (6,39).
def leavesData55 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves55 : Fin 4 → DyadicLeaf := leavesData55.get
def raw55 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 6 39 leaves55 i
def outputData55 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨1536,1664,9984,10112⟩) (.single ⟨1536,1664,10112,10240⟩)) (.node (.single ⟨1664,1792,9984,10112⟩) (.single ⟨1664,1792,10112,10240⟩))) (.node (.node (.single ⟨9984,10112,1536,1664⟩) (.single ⟨9984,10112,1664,1792⟩)) (.node (.single ⟨10112,10240,1536,1664⟩) (.single ⟨10112,10240,1664,1792⟩)))) (.node (.node (.node (.single ⟨22528,22656,30976,31104⟩) (.single ⟨22528,22656,31104,31232⟩)) (.node (.single ⟨22656,22784,30976,31104⟩) (.single ⟨22656,22784,31104,31232⟩))) (.node (.node (.single ⟨30976,31104,22528,22656⟩) (.single ⟨30976,31104,22656,22784⟩)) (.node (.single ⟨31104,31232,22528,22656⟩) (.single ⟨31104,31232,22656,22784⟩)))))
def output55 : Fin 16 → GridBox := outputData55.get
def coverData55 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData55 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover55 (i : Fin 16) : Fin 16 := ⟨coverData55.get i % 16, Nat.mod_lt _ (by decide)⟩
def source55 (i : Fin 16) : Fin 16 := ⟨sourceData55.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree55 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 (.cutY 10240 (.cutX 1024 .empty (.cutY 9216 .empty (.cutX 1536 .empty (.cutY 9728 .empty (.cutX 1792 (.cutY 9984 .empty (.cutX 1664 (.cutY 10112 .full .full) (.cutY 10112 .full .full))) .empty))))) .empty) .empty) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 (.cutX 9216 .empty (.cutY 1024 .empty (.cutX 9728 .empty (.cutY 1536 .empty (.cutX 9984 .empty (.cutY 1792 (.cutX 10112 (.cutY 1664 .full .full) (.cutY 1664 .full .full)) .empty)))))) .empty) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 .empty (.cutX 23552 (.cutY 31744 (.cutX 23040 (.cutY 31232 (.cutX 22784 (.cutY 30976 .empty (.cutX 22656 (.cutY 31104 .full .full) (.cutY 31104 .full .full))) .empty) .empty) .empty) .empty) .empty)))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 .empty (.cutY 22528 .empty (.cutX 31744 (.cutY 23552 (.cutX 31232 (.cutY 23040 (.cutX 30976 .empty (.cutY 22784 (.cutX 31104 (.cutY 22656 .full .full) (.cutY 22656 .full .full)) .empty)) .empty) .empty) .empty) .empty))))) .empty))))

theorem metadata55 : 0<475523442 ∧ 6<128 ∧ 39<128 ∧ 1<4 ∧
    4931/4160=1 ∧ 4931%4160=771 ∧ ∀ i, (leaves55 i).Valid 8 := by
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

-- Frozen phase 3064, atom 4450, type 1, source (2,38).
def leavesData56 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves56 : Fin 4 → DyadicLeaf := leavesData56.get
def raw56 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 2 38 leaves56 i
def outputData56 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨512,640,9728,9856⟩) (.single ⟨512,640,9856,9984⟩)) (.node (.single ⟨640,768,9728,9856⟩) (.single ⟨640,768,9856,9984⟩))) (.node (.node (.single ⟨9728,9856,512,640⟩) (.single ⟨9728,9856,640,768⟩)) (.node (.single ⟨9856,9984,512,640⟩) (.single ⟨9856,9984,640,768⟩)))) (.node (.node (.node (.single ⟨22784,22912,32000,32128⟩) (.single ⟨22784,22912,32128,32256⟩)) (.node (.single ⟨22912,23040,32000,32128⟩) (.single ⟨22912,23040,32128,32256⟩))) (.node (.node (.single ⟨32000,32128,22784,22912⟩) (.single ⟨32000,32128,22912,23040⟩)) (.node (.single ⟨32128,32256,22784,22912⟩) (.single ⟨32128,32256,22912,23040⟩)))))
def output56 : Fin 16 → GridBox := outputData56.get
def coverData56 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData56 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover56 (i : Fin 16) : Fin 16 := ⟨coverData56.get i % 16, Nat.mod_lt _ (by decide)⟩
def source56 (i : Fin 16) : Fin 16 := ⟨sourceData56.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree56 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 (.cutY 10240 (.cutX 1024 (.cutY 9216 .empty (.cutX 512 .empty (.cutY 9728 .empty (.cutX 768 (.cutY 9984 (.cutX 640 (.cutY 9856 .full .full) (.cutY 9856 .full .full)) .empty) .empty)))) .empty) .empty) .empty) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 (.cutX 9216 .empty (.cutY 1024 (.cutX 9728 .empty (.cutY 512 .empty (.cutX 9984 (.cutY 768 (.cutX 9856 (.cutY 640 .full .full) (.cutY 640 .full .full)) .empty) .empty))) .empty)) .empty) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 .empty (.cutX 23552 (.cutY 31744 .empty (.cutX 23040 (.cutY 32256 (.cutX 22784 .empty (.cutY 32000 .empty (.cutX 22912 (.cutY 32128 .full .full) (.cutY 32128 .full .full)))) .empty) .empty)) .empty)))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 .empty (.cutY 22528 .empty (.cutX 31744 .empty (.cutY 23552 (.cutX 32256 (.cutY 23040 (.cutX 32000 .empty (.cutY 22784 .empty (.cutX 32128 (.cutY 22912 .full .full) (.cutY 22912 .full .full)))) .empty) .empty) .empty)))))) .empty))))

theorem metadata56 : 0<475523442 ∧ 2<128 ∧ 38<128 ∧ 1<4 ∧
    4450/4160=1 ∧ 4450%4160=290 ∧ ∀ i, (leaves56 i).Valid 8 := by
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

noncomputable def phaseMass56 : ℝ := singlePhaseMass (475523442/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw56 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass56_eq : phaseMass56 = (237761721/819200000000 : ℝ) := by
  unfold phaseMass56
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw56 output56 cover56 source56
    (gridTreeUnionCheck_sound 32768 raw56 output56 cover56 source56 tree56 checked56)
    _ (by norm_num) _, areaUnits56]
  norm_num

-- Frozen phase 3065, atom 4814, type 1, source (5,39).
def leavesData57 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves57 : Fin 4 → DyadicLeaf := leavesData57.get
def raw57 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 5 39 leaves57 i
def outputData57 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨1280,1408,9984,10112⟩) (.single ⟨1280,1408,10112,10240⟩)) (.node (.single ⟨1408,1536,9984,10112⟩) (.single ⟨1408,1536,10112,10240⟩))) (.node (.node (.single ⟨9984,10112,1280,1408⟩) (.single ⟨9984,10112,1408,1536⟩)) (.node (.single ⟨10112,10240,1280,1408⟩) (.single ⟨10112,10240,1408,1536⟩)))) (.node (.node (.node (.single ⟨22528,22656,31232,31360⟩) (.single ⟨22528,22656,31360,31488⟩)) (.node (.single ⟨22656,22784,31232,31360⟩) (.single ⟨22656,22784,31360,31488⟩))) (.node (.node (.single ⟨31232,31360,22528,22656⟩) (.single ⟨31232,31360,22656,22784⟩)) (.node (.single ⟨31360,31488,22528,22656⟩) (.single ⟨31360,31488,22656,22784⟩)))))
def output57 : Fin 16 → GridBox := outputData57.get
def coverData57 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData57 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover57 (i : Fin 16) : Fin 16 := ⟨coverData57.get i % 16, Nat.mod_lt _ (by decide)⟩
def source57 (i : Fin 16) : Fin 16 := ⟨sourceData57.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree57 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 (.cutY 10240 (.cutX 1024 .empty (.cutY 9216 .empty (.cutX 1536 (.cutY 9728 .empty (.cutX 1280 .empty (.cutY 9984 .empty (.cutX 1408 (.cutY 10112 .full .full) (.cutY 10112 .full .full))))) .empty))) .empty) .empty) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 (.cutX 9216 .empty (.cutY 1024 .empty (.cutX 9728 .empty (.cutY 1536 (.cutX 9984 .empty (.cutY 1280 .empty (.cutX 10112 (.cutY 1408 .full .full) (.cutY 1408 .full .full)))) .empty)))) .empty) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 .empty (.cutX 23552 (.cutY 31744 (.cutX 23040 (.cutY 31232 .empty (.cutX 22784 (.cutY 31488 (.cutX 22656 (.cutY 31360 .full .full) (.cutY 31360 .full .full)) .empty) .empty)) .empty) .empty) .empty)))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 .empty (.cutY 22528 .empty (.cutX 31744 (.cutY 23552 (.cutX 31232 .empty (.cutY 23040 (.cutX 31488 (.cutY 22784 (.cutX 31360 (.cutY 22656 .full .full) (.cutY 22656 .full .full)) .empty) .empty) .empty)) .empty) .empty))))) .empty))))

theorem metadata57 : 0<475523442 ∧ 5<128 ∧ 39<128 ∧ 1<4 ∧
    4814/4160=1 ∧ 4814%4160=654 ∧ ∀ i, (leaves57 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData57).mp
    (by decide +kernel)

theorem sourceChecked57_0 : ∀ i : Fin 16,
    (fun i => output57 i = raw57 (source57 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked57 : ∀ i : Fin 16, (fun i => output57 i = raw57 (source57 i)) i :=
  forallFin_of_zero_offset (fun i => output57 i = raw57 (source57 i)) sourceChecked57_0

theorem coverChecked57_0 : ∀ i : Fin 16,
    (fun i => (output57 (cover57 i)).ContainsBox (raw57 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked57 : ∀ i : Fin 16, (fun i => (output57 (cover57 i)).ContainsBox (raw57 i)) i :=
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

noncomputable def phaseMass57 : ℝ := singlePhaseMass (475523442/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw57 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass57_eq : phaseMass57 = (237761721/819200000000 : ℝ) := by
  unfold phaseMass57
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw57 output57 cover57 source57
    (gridTreeUnionCheck_sound 32768 raw57 output57 cover57 source57 tree57 checked57)
    _ (by norm_num) _, areaUnits57]
  norm_num

-- Frozen phase 3066, atom 6273, type 1, source (19,42).
def leavesData58 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves58 : Fin 10 → DyadicLeaf := leavesData58.get
def raw58 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 19 42 leaves58 i
def outputData58 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨4864,4992,10752,10880⟩) (.single ⟨4864,4992,10880,11008⟩)) (.node (.single ⟨4992,5056,10752,10816⟩) (.node (.single ⟨4992,5056,10816,10880⟩) (.single ⟨5056,5088,10752,10784⟩)))) (.node (.node (.single ⟨5056,5088,10784,10816⟩) (.single ⟨5088,5120,10752,10784⟩)) (.node (.single ⟨5088,5120,10784,10816⟩) (.node (.single ⟨5056,5120,10816,10880⟩) (.single ⟨4992,5120,10880,11008⟩))))) (.node (.node (.node (.single ⟨10752,10880,4864,4992⟩) (.single ⟨10752,10816,4992,5056⟩)) (.node (.single ⟨10752,10784,5056,5088⟩) (.node (.single ⟨10752,10784,5088,5120⟩) (.single ⟨10784,10816,5056,5088⟩)))) (.node (.node (.single ⟨10784,10816,5088,5120⟩) (.single ⟨10816,10880,4992,5056⟩)) (.node (.single ⟨10816,10880,5056,5120⟩) (.node (.single ⟨10880,11008,4864,4992⟩) (.single ⟨10880,11008,4992,5120⟩)))))) (.node (.node (.node (.node (.single ⟨21760,21888,27648,27776⟩) (.single ⟨21760,21888,27776,27904⟩)) (.node (.single ⟨21888,21952,27648,27712⟩) (.node (.single ⟨21888,21952,27712,27776⟩) (.single ⟨21952,21984,27648,27680⟩)))) (.node (.node (.single ⟨21952,21984,27680,27712⟩) (.single ⟨21984,22016,27648,27680⟩)) (.node (.single ⟨21984,22016,27680,27712⟩) (.node (.single ⟨21952,22016,27712,27776⟩) (.single ⟨21888,22016,27776,27904⟩))))) (.node (.node (.node (.single ⟨27648,27776,21760,21888⟩) (.single ⟨27648,27712,21888,21952⟩)) (.node (.single ⟨27648,27680,21952,21984⟩) (.node (.single ⟨27648,27680,21984,22016⟩) (.single ⟨27680,27712,21952,21984⟩)))) (.node (.node (.single ⟨27680,27712,21984,22016⟩) (.single ⟨27712,27776,21888,21952⟩)) (.node (.single ⟨27712,27776,21952,22016⟩) (.node (.single ⟨27776,27904,21760,21888⟩) (.single ⟨27776,27904,21888,22016⟩)))))))
def output58 : Fin 40 → GridBox := outputData58.get
def coverData58 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 10)) (.node (.single 39) (.node (.single 29) (.single 1)))) (.node (.node (.single 18) (.single 38)) (.node (.single 21) (.node (.single 9) (.single 19))))) (.node (.node (.node (.single 30) (.single 20)) (.node (.single 2) (.node (.single 11) (.single 37)))) (.node (.node (.single 28) (.single 3)) (.node (.single 16) (.node (.single 36) (.single 23)))))) (.node (.node (.node (.node (.single 8) (.single 17)) (.node (.single 31) (.node (.single 22) (.single 4)))) (.node (.node (.single 12) (.single 35)) (.node (.single 27) (.node (.single 5) (.single 14))))) (.node (.node (.node (.single 34) (.single 25)) (.node (.single 6) (.node (.single 13) (.single 33)))) (.node (.node (.single 26) (.single 7)) (.node (.single 15) (.node (.single 32) (.single 24)))))))
def sourceData58 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9)))))) (.node (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover58 (i : Fin 40) : Fin 40 := ⟨coverData58.get i % 40, Nat.mod_lt _ (by decide)⟩
def source58 (i : Fin 40) : Fin 40 := ⟨sourceData58.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree58 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 (.cutY 10240 .empty (.cutX 5120 (.cutY 11264 (.cutX 4608 .empty (.cutY 10752 .empty (.cutX 4864 .empty (.cutY 11008 (.cutX 4992 (.cutY 10880 .full .full) (.cutY 10880 (.cutX 5056 (.cutY 10816 .full .full) (.cutY 10816 (.cutX 5088 (.cutY 10784 .full .full) (.cutY 10784 .full .full)) .full)) .full)) .empty)))) .empty) .empty)) .empty) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 .empty (.cutY 6144 (.cutX 11264 (.cutY 5120 (.cutX 10752 .empty (.cutY 4608 .empty (.cutX 11008 (.cutY 4864 .empty (.cutX 10880 (.cutY 4992 .full (.cutX 10816 (.cutY 5056 .full (.cutX 10784 (.cutY 5088 .full .full) (.cutY 5088 .full .full))) (.cutY 5056 .full .full))) (.cutY 4992 .full .full))) .empty))) .empty) .empty) .empty))) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 (.cutY 26624 .empty (.cutX 21504 .empty (.cutY 27648 .empty (.cutX 22016 (.cutY 28160 (.cutX 21760 .empty (.cutY 27904 (.cutX 21888 (.cutY 27776 .full .full) (.cutY 27776 (.cutX 21952 (.cutY 27712 .full .full) (.cutY 27712 (.cutX 21984 (.cutY 27680 .full .full) (.cutY 27680 .full .full)) .full)) .full)) .empty)) .empty) .empty)))) .empty) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 .empty (.cutY 22528 (.cutX 27648 .empty (.cutY 21504 .empty (.cutX 28160 (.cutY 22016 (.cutX 27904 (.cutY 21760 .empty (.cutX 27776 (.cutY 21888 .full (.cutX 27712 (.cutY 21952 .full (.cutX 27680 (.cutY 21984 .full .full) (.cutY 21984 .full .full))) (.cutY 21952 .full .full))) (.cutY 21888 .full .full))) .empty) .empty) .empty))) .empty))) .empty) .empty))))

theorem metadata58 : 0<22259151 ∧ 19<128 ∧ 42<128 ∧ 1<4 ∧
    6273/4160=1 ∧ 6273%4160=2113 ∧ ∀ i, (leaves58 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData58).mp
    (by decide +kernel)

theorem sourceChecked58_0 : ∀ i : Fin 40,
    (fun i => output58 i = raw58 (source58 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked58 : ∀ i : Fin 40, (fun i => output58 i = raw58 (source58 i)) i :=
  forallFin_of_zero_offset (fun i => output58 i = raw58 (source58 i)) sourceChecked58_0

theorem coverChecked58_0 : ∀ i : Fin 40,
    (fun i => (output58 (cover58 i)).ContainsBox (raw58 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked58 : ∀ i : Fin 40, (fun i => (output58 (cover58 i)).ContainsBox (raw58 i)) i :=
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

noncomputable def phaseMass58 : ℝ := singlePhaseMass (22259151/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw58 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass58_eq : phaseMass58 = (22259151/1638400000000 : ℝ) := by
  unfold phaseMass58
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw58 output58 cover58 source58
    (gridTreeUnionCheck_sound 32768 raw58 output58 cover58 source58 tree58 checked58)
    _ (by norm_num) _, areaUnits58]
  norm_num

-- Frozen phase 3067, atom 7878, type 1, source (43,63).
def leavesData59 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves59 : Fin 10 → DyadicLeaf := leavesData59.get
def raw59 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 43 63 leaves59 i
def outputData59 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨11008,11136,16128,16256⟩) (.single ⟨11008,11136,16256,16384⟩)) (.node (.single ⟨11136,11200,16128,16192⟩) (.node (.single ⟨11136,11200,16192,16256⟩) (.single ⟨11200,11232,16128,16160⟩)))) (.node (.node (.single ⟨11200,11232,16160,16192⟩) (.single ⟨11232,11264,16128,16160⟩)) (.node (.single ⟨11232,11264,16160,16192⟩) (.node (.single ⟨11200,11264,16192,16256⟩) (.single ⟨11136,11264,16256,16384⟩))))) (.node (.node (.node (.single ⟨16128,16256,11008,11136⟩) (.single ⟨16128,16192,11136,11200⟩)) (.node (.single ⟨16128,16160,11200,11232⟩) (.node (.single ⟨16128,16160,11232,11264⟩) (.single ⟨16160,16192,11200,11232⟩)))) (.node (.node (.single ⟨16160,16192,11232,11264⟩) (.single ⟨16192,16256,11136,11200⟩)) (.node (.single ⟨16192,16256,11200,11264⟩) (.node (.single ⟨16256,16384,11008,11136⟩) (.single ⟨16256,16384,11136,11264⟩)))))) (.node (.node (.node (.node (.single ⟨16384,16512,21504,21632⟩) (.single ⟨16384,16512,21632,21760⟩)) (.node (.single ⟨16512,16576,21504,21568⟩) (.node (.single ⟨16512,16576,21568,21632⟩) (.single ⟨16576,16608,21504,21536⟩)))) (.node (.node (.single ⟨16576,16608,21536,21568⟩) (.single ⟨16608,16640,21504,21536⟩)) (.node (.single ⟨16608,16640,21536,21568⟩) (.node (.single ⟨16576,16640,21568,21632⟩) (.single ⟨16512,16640,21632,21760⟩))))) (.node (.node (.node (.single ⟨21504,21632,16384,16512⟩) (.single ⟨21504,21568,16512,16576⟩)) (.node (.single ⟨21504,21536,16576,16608⟩) (.node (.single ⟨21504,21536,16608,16640⟩) (.single ⟨21536,21568,16576,16608⟩)))) (.node (.node (.single ⟨21536,21568,16608,16640⟩) (.single ⟨21568,21632,16512,16576⟩)) (.node (.single ⟨21568,21632,16576,16640⟩) (.node (.single ⟨21632,21760,16384,16512⟩) (.single ⟨21632,21760,16512,16640⟩)))))))
def output59 : Fin 40 → GridBox := outputData59.get
def coverData59 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 10)) (.node (.single 39) (.node (.single 29) (.single 1)))) (.node (.node (.single 18) (.single 38)) (.node (.single 21) (.node (.single 9) (.single 19))))) (.node (.node (.node (.single 30) (.single 20)) (.node (.single 2) (.node (.single 11) (.single 37)))) (.node (.node (.single 28) (.single 3)) (.node (.single 16) (.node (.single 36) (.single 23)))))) (.node (.node (.node (.node (.single 8) (.single 17)) (.node (.single 31) (.node (.single 22) (.single 4)))) (.node (.node (.single 12) (.single 35)) (.node (.single 27) (.node (.single 5) (.single 14))))) (.node (.node (.node (.single 34) (.single 25)) (.node (.single 6) (.node (.single 13) (.single 33)))) (.node (.node (.single 26) (.single 7)) (.node (.single 15) (.node (.single 32) (.single 24)))))))
def sourceData59 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9)))))) (.node (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover59 (i : Fin 40) : Fin 40 := ⟨coverData59.get i % 40, Nat.mod_lt _ (by decide)⟩
def source59 (i : Fin 40) : Fin 40 := ⟨sourceData59.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree59 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 .empty (.cutY 14336 .empty (.cutX 11264 (.cutY 15360 .empty (.cutX 10752 .empty (.cutY 15872 .empty (.cutX 11008 .empty (.cutY 16128 .empty (.cutX 11136 (.cutY 16256 .full .full) (.cutY 16256 (.cutX 11200 (.cutY 16192 .full .full) (.cutY 16192 (.cutX 11232 (.cutY 16160 .full .full) (.cutY 16160 .full .full)) .full)) .full))))))) .empty)))) (.cutY 12288 (.cutX 14336 .empty (.cutY 10240 .empty (.cutX 15360 .empty (.cutY 11264 (.cutX 15872 .empty (.cutY 10752 .empty (.cutX 16128 .empty (.cutY 11008 .empty (.cutX 16256 (.cutY 11136 .full (.cutX 16192 (.cutY 11200 .full (.cutX 16160 (.cutY 11232 .full .full) (.cutY 11232 .full .full))) (.cutY 11200 .full .full))) (.cutY 11136 .full .full)))))) .empty)))) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 (.cutY 22528 (.cutX 17408 (.cutY 21504 .empty (.cutX 16896 (.cutY 22016 (.cutX 16640 (.cutY 21760 (.cutX 16512 (.cutY 21632 .full .full) (.cutY 21632 (.cutX 16576 (.cutY 21568 .full .full) (.cutY 21568 (.cutX 16608 (.cutY 21536 .full .full) (.cutY 21536 .full .full)) .full)) .full)) .empty) .empty) .empty) .empty)) .empty) .empty) .empty)) (.cutY 20480 (.cutX 22528 (.cutY 18432 (.cutX 21504 .empty (.cutY 17408 (.cutX 22016 (.cutY 16896 (.cutX 21760 (.cutY 16640 (.cutX 21632 (.cutY 16512 .full (.cutX 21568 (.cutY 16576 .full (.cutX 21536 (.cutY 16608 .full .full) (.cutY 16608 .full .full))) (.cutY 16576 .full .full))) (.cutY 16512 .full .full)) .empty) .empty) .empty) .empty) .empty)) .empty) .empty) .empty)) .empty) .empty)))

theorem metadata59 : 0<82140708 ∧ 43<128 ∧ 63<128 ∧ 1<4 ∧
    7878/4160=1 ∧ 7878%4160=3718 ∧ ∀ i, (leaves59 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData59).mp
    (by decide +kernel)

theorem sourceChecked59_0 : ∀ i : Fin 40,
    (fun i => output59 i = raw59 (source59 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked59 : ∀ i : Fin 40, (fun i => output59 i = raw59 (source59 i)) i :=
  forallFin_of_zero_offset (fun i => output59 i = raw59 (source59 i)) sourceChecked59_0

theorem coverChecked59_0 : ∀ i : Fin 40,
    (fun i => (output59 (cover59 i)).ContainsBox (raw59 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked59 : ∀ i : Fin 40, (fun i => (output59 (cover59 i)).ContainsBox (raw59 i)) i :=
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

noncomputable def phaseMass59 : ℝ := singlePhaseMass (82140708/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw59 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass59_eq : phaseMass59 = (20535177/409600000000 : ℝ) := by
  unfold phaseMass59
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw59 output59 cover59 source59
    (gridTreeUnionCheck_sound 32768 raw59 output59 cover59 source59 tree59 checked59)
    _ (by norm_num) _, areaUnits59]
  norm_num

-- Frozen phase 3068, atom 7083, type 1, source (29,52).
def leavesData60 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves60 : Fin 7 → DyadicLeaf := leavesData60.get
def raw60 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 29 52 leaves60 i
def outputData60 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨7424,7552,13312,13440⟩) (.node (.single ⟨7424,7552,13440,13568⟩) (.single ⟨7552,7616,13312,13376⟩))) (.node (.node (.single ⟨7552,7616,13376,13440⟩) (.single ⟨7616,7680,13312,13376⟩)) (.node (.single ⟨7616,7680,13376,13440⟩) (.single ⟨7552,7680,13440,13568⟩)))) (.node (.node (.single ⟨13312,13440,7424,7552⟩) (.node (.single ⟨13312,13376,7552,7616⟩) (.single ⟨13312,13376,7616,7680⟩))) (.node (.node (.single ⟨13376,13440,7552,7616⟩) (.single ⟨13376,13440,7616,7680⟩)) (.node (.single ⟨13440,13568,7424,7552⟩) (.single ⟨13440,13568,7552,7680⟩))))) (.node (.node (.node (.single ⟨19200,19328,25088,25216⟩) (.node (.single ⟨19200,19328,25216,25344⟩) (.single ⟨19328,19392,25088,25152⟩))) (.node (.node (.single ⟨19328,19392,25152,25216⟩) (.single ⟨19392,19456,25088,25152⟩)) (.node (.single ⟨19392,19456,25152,25216⟩) (.single ⟨19328,19456,25216,25344⟩)))) (.node (.node (.single ⟨25088,25216,19200,19328⟩) (.node (.single ⟨25088,25152,19328,19392⟩) (.single ⟨25088,25152,19392,19456⟩))) (.node (.node (.single ⟨25152,25216,19328,19392⟩) (.single ⟨25152,25216,19392,19456⟩)) (.node (.single ⟨25216,25344,19200,19328⟩) (.single ⟨25216,25344,19328,19456⟩))))))
def output60 : Fin 28 → GridBox := outputData60.get
def coverData60 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData60 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover60 (i : Fin 28) : Fin 28 := ⟨coverData60.get i % 28, Nat.mod_lt _ (by decide)⟩
def source60 (i : Fin 28) : Fin 28 := ⟨sourceData60.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree60 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 .empty (.cutY 14336 (.cutX 7168 .empty (.cutY 13312 .empty (.cutX 7680 (.cutY 13824 (.cutX 7424 .empty (.cutY 13568 (.cutX 7552 (.cutY 13440 .full .full) (.cutY 13440 (.cutX 7616 (.cutY 13376 .full .full) (.cutY 13376 .full .full)) .full)) .empty)) .empty) .empty))) .empty))))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 (.cutY 6144 .empty (.cutX 13312 .empty (.cutY 7168 .empty (.cutX 13824 (.cutY 7680 (.cutX 13568 (.cutY 7424 .empty (.cutX 13440 (.cutY 7552 .full (.cutX 13376 (.cutY 7616 .full .full) (.cutY 7616 .full .full))) (.cutY 7552 .full .full))) .empty) .empty) .empty)))) .empty))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 .empty (.cutY 26624 (.cutX 19456 (.cutY 25600 (.cutX 18944 .empty (.cutY 25088 .empty (.cutX 19200 .empty (.cutY 25344 (.cutX 19328 (.cutY 25216 .full .full) (.cutY 25216 (.cutX 19392 (.cutY 25152 .full .full) (.cutY 25152 .full .full)) .full)) .empty)))) .empty) .empty) .empty)) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 (.cutY 18432 .empty (.cutX 25600 (.cutY 19456 (.cutX 25088 .empty (.cutY 18944 .empty (.cutX 25344 (.cutY 19200 .empty (.cutX 25216 (.cutY 19328 .full (.cutX 25152 (.cutY 19392 .full .full) (.cutY 19392 .full .full))) (.cutY 19328 .full .full))) .empty))) .empty) .empty)) .empty) .empty) .empty) .empty))))

theorem metadata60 : 0<202650974 ∧ 29<128 ∧ 52<128 ∧ 1<4 ∧
    7083/4160=1 ∧ 7083%4160=2923 ∧ ∀ i, (leaves60 i).Valid 8 := by
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

noncomputable def phaseMass60 : ℝ := singlePhaseMass (202650974/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw60 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass60_eq : phaseMass60 = (101325487/819200000000 : ℝ) := by
  unfold phaseMass60
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw60 output60 cover60 source60
    (gridTreeUnionCheck_sound 32768 raw60 output60 cover60 source60 tree60 checked60)
    _ (by norm_num) _, areaUnits60]
  norm_num

-- Frozen phase 3069, atom 6703, type 1, source (24,47).
def leavesData61 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves61 : Fin 10 → DyadicLeaf := leavesData61.get
def raw61 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 24 47 leaves61 i
def outputData61 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨6144,6272,12032,12160⟩) (.single ⟨6144,6272,12160,12288⟩)) (.node (.single ⟨6272,6336,12032,12096⟩) (.node (.single ⟨6272,6336,12096,12160⟩) (.single ⟨6336,6368,12032,12064⟩)))) (.node (.node (.single ⟨6336,6368,12064,12096⟩) (.single ⟨6368,6400,12032,12064⟩)) (.node (.single ⟨6368,6400,12064,12096⟩) (.node (.single ⟨6336,6400,12096,12160⟩) (.single ⟨6272,6400,12160,12288⟩))))) (.node (.node (.node (.single ⟨12032,12160,6144,6272⟩) (.single ⟨12032,12096,6272,6336⟩)) (.node (.single ⟨12032,12064,6336,6368⟩) (.node (.single ⟨12032,12064,6368,6400⟩) (.single ⟨12064,12096,6336,6368⟩)))) (.node (.node (.single ⟨12064,12096,6368,6400⟩) (.single ⟨12096,12160,6272,6336⟩)) (.node (.single ⟨12096,12160,6336,6400⟩) (.node (.single ⟨12160,12288,6144,6272⟩) (.single ⟨12160,12288,6272,6400⟩)))))) (.node (.node (.node (.node (.single ⟨20480,20608,26368,26496⟩) (.single ⟨20480,20608,26496,26624⟩)) (.node (.single ⟨20608,20672,26368,26432⟩) (.node (.single ⟨20608,20672,26432,26496⟩) (.single ⟨20672,20704,26368,26400⟩)))) (.node (.node (.single ⟨20672,20704,26400,26432⟩) (.single ⟨20704,20736,26368,26400⟩)) (.node (.single ⟨20704,20736,26400,26432⟩) (.node (.single ⟨20672,20736,26432,26496⟩) (.single ⟨20608,20736,26496,26624⟩))))) (.node (.node (.node (.single ⟨26368,26496,20480,20608⟩) (.single ⟨26368,26432,20608,20672⟩)) (.node (.single ⟨26368,26400,20672,20704⟩) (.node (.single ⟨26368,26400,20704,20736⟩) (.single ⟨26400,26432,20672,20704⟩)))) (.node (.node (.single ⟨26400,26432,20704,20736⟩) (.single ⟨26432,26496,20608,20672⟩)) (.node (.single ⟨26432,26496,20672,20736⟩) (.node (.single ⟨26496,26624,20480,20608⟩) (.single ⟨26496,26624,20608,20736⟩)))))))
def output61 : Fin 40 → GridBox := outputData61.get
def coverData61 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 10)) (.node (.single 39) (.node (.single 29) (.single 1)))) (.node (.node (.single 18) (.single 38)) (.node (.single 21) (.node (.single 9) (.single 19))))) (.node (.node (.node (.single 30) (.single 20)) (.node (.single 2) (.node (.single 11) (.single 37)))) (.node (.node (.single 28) (.single 3)) (.node (.single 16) (.node (.single 36) (.single 23)))))) (.node (.node (.node (.node (.single 8) (.single 17)) (.node (.single 31) (.node (.single 22) (.single 4)))) (.node (.node (.single 12) (.single 35)) (.node (.single 27) (.node (.single 5) (.single 14))))) (.node (.node (.node (.single 34) (.single 25)) (.node (.single 6) (.node (.single 13) (.single 33)))) (.node (.node (.single 26) (.single 7)) (.node (.single 15) (.node (.single 32) (.single 24)))))))
def sourceData61 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9)))))) (.node (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover61 (i : Fin 40) : Fin 40 := ⟨coverData61.get i % 40, Nat.mod_lt _ (by decide)⟩
def source61 (i : Fin 40) : Fin 40 := ⟨sourceData61.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree61 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 .empty (.cutY 10240 .empty (.cutX 7168 (.cutY 11264 .empty (.cutX 6656 (.cutY 11776 .empty (.cutX 6400 (.cutY 12032 .empty (.cutX 6272 (.cutY 12160 .full .full) (.cutY 12160 (.cutX 6336 (.cutY 12096 .full .full) (.cutY 12096 (.cutX 6368 (.cutY 12064 .full .full) (.cutY 12064 .full .full)) .full)) .full))) .empty)) .empty)) .empty))) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 .empty (.cutY 6144 .empty (.cutX 11264 .empty (.cutY 7168 (.cutX 11776 .empty (.cutY 6656 (.cutX 12032 .empty (.cutY 6400 (.cutX 12160 (.cutY 6272 .full (.cutX 12096 (.cutY 6336 .full (.cutX 12064 (.cutY 6368 .full .full) (.cutY 6368 .full .full))) (.cutY 6336 .full .full))) (.cutY 6272 .full .full)) .empty)) .empty)) .empty))))) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 (.cutY 26624 (.cutX 21504 (.cutY 25600 .empty (.cutX 20992 (.cutY 26112 .empty (.cutX 20736 (.cutY 26368 .empty (.cutX 20608 (.cutY 26496 .full .full) (.cutY 26496 (.cutX 20672 (.cutY 26432 .full .full) (.cutY 26432 (.cutX 20704 (.cutY 26400 .full .full) (.cutY 26400 .full .full)) .full)) .full))) .empty)) .empty)) .empty) .empty) .empty) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 (.cutY 22528 (.cutX 25600 .empty (.cutY 21504 (.cutX 26112 .empty (.cutY 20992 (.cutX 26368 .empty (.cutY 20736 (.cutX 26496 (.cutY 20608 .full (.cutX 26432 (.cutY 20672 .full (.cutX 26400 (.cutY 20704 .full .full) (.cutY 20704 .full .full))) (.cutY 20672 .full .full))) (.cutY 20608 .full .full)) .empty)) .empty)) .empty)) .empty) .empty)) .empty) .empty))))

theorem metadata61 : 0<130629080 ∧ 24<128 ∧ 47<128 ∧ 1<4 ∧
    6703/4160=1 ∧ 6703%4160=2543 ∧ ∀ i, (leaves61 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData61).mp
    (by decide +kernel)

theorem sourceChecked61_0 : ∀ i : Fin 40,
    (fun i => output61 i = raw61 (source61 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked61 : ∀ i : Fin 40, (fun i => output61 i = raw61 (source61 i)) i :=
  forallFin_of_zero_offset (fun i => output61 i = raw61 (source61 i)) sourceChecked61_0

theorem coverChecked61_0 : ∀ i : Fin 40,
    (fun i => (output61 (cover61 i)).ContainsBox (raw61 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked61 : ∀ i : Fin 40, (fun i => (output61 (cover61 i)).ContainsBox (raw61 i)) i :=
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

noncomputable def phaseMass61 : ℝ := singlePhaseMass (130629080/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw61 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass61_eq : phaseMass61 = (3265727/40960000000 : ℝ) := by
  unfold phaseMass61
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw61 output61 cover61 source61
    (gridTreeUnionCheck_sound 32768 raw61 output61 cover61 source61 tree61 checked61)
    _ (by norm_num) _, areaUnits61]
  norm_num

-- Frozen phase 3070, atom 5695, type 1, source (13,40).
def leavesData62 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves62 : Fin 7 → DyadicLeaf := leavesData62.get
def raw62 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 13 40 leaves62 i
def outputData62 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3328,3456,10240,10368⟩) (.node (.single ⟨3328,3456,10368,10496⟩) (.single ⟨3456,3520,10240,10304⟩))) (.node (.node (.single ⟨3456,3520,10304,10368⟩) (.single ⟨3520,3584,10240,10304⟩)) (.node (.single ⟨3520,3584,10304,10368⟩) (.single ⟨3456,3584,10368,10496⟩)))) (.node (.node (.single ⟨10240,10368,3328,3456⟩) (.node (.single ⟨10240,10304,3456,3520⟩) (.single ⟨10240,10304,3520,3584⟩))) (.node (.node (.single ⟨10304,10368,3456,3520⟩) (.single ⟨10304,10368,3520,3584⟩)) (.node (.single ⟨10368,10496,3328,3456⟩) (.single ⟨10368,10496,3456,3584⟩))))) (.node (.node (.node (.single ⟨22272,22400,29184,29312⟩) (.node (.single ⟨22272,22400,29312,29440⟩) (.single ⟨22400,22464,29184,29248⟩))) (.node (.node (.single ⟨22400,22464,29248,29312⟩) (.single ⟨22464,22528,29184,29248⟩)) (.node (.single ⟨22464,22528,29248,29312⟩) (.single ⟨22400,22528,29312,29440⟩)))) (.node (.node (.single ⟨29184,29312,22272,22400⟩) (.node (.single ⟨29184,29248,22400,22464⟩) (.single ⟨29184,29248,22464,22528⟩))) (.node (.node (.single ⟨29248,29312,22400,22464⟩) (.single ⟨29248,29312,22464,22528⟩)) (.node (.single ⟨29312,29440,22272,22400⟩) (.single ⟨29312,29440,22400,22528⟩))))))
def output62 : Fin 28 → GridBox := outputData62.get
def coverData62 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData62 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover62 (i : Fin 28) : Fin 28 := ⟨coverData62.get i % 28, Nat.mod_lt _ (by decide)⟩
def source62 (i : Fin 28) : Fin 28 := ⟨sourceData62.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree62 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 .empty (.cutY 10240 .empty (.cutX 3072 .empty (.cutY 11264 (.cutX 3584 (.cutY 10752 (.cutX 3328 .empty (.cutY 10496 (.cutX 3456 (.cutY 10368 .full .full) (.cutY 10368 (.cutX 3520 (.cutY 10304 .full .full) (.cutY 10304 .full .full)) .full)) .empty)) .empty) .empty) .empty)))) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 .empty (.cutY 2048 .empty (.cutX 11264 (.cutY 3072 .empty (.cutX 10752 (.cutY 3584 (.cutX 10496 (.cutY 3328 .empty (.cutX 10368 (.cutY 3456 .full (.cutX 10304 (.cutY 3520 .full .full) (.cutY 3520 .full .full))) (.cutY 3456 .full .full))) .empty) .empty) .empty)) .empty))) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 (.cutY 30720 (.cutX 21504 .empty (.cutY 29696 (.cutX 22016 .empty (.cutY 29184 .empty (.cutX 22272 .empty (.cutY 29440 (.cutX 22400 (.cutY 29312 .full .full) (.cutY 29312 (.cutX 22464 (.cutY 29248 .full .full) (.cutY 29248 .full .full)) .full)) .empty)))) .empty)) .empty) .empty)))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 (.cutY 22528 (.cutX 29696 (.cutY 21504 .empty (.cutX 29184 .empty (.cutY 22016 .empty (.cutX 29440 (.cutY 22272 .empty (.cutX 29312 (.cutY 22400 .full (.cutX 29248 (.cutY 22464 .full .full) (.cutY 22464 .full .full))) (.cutY 22400 .full .full))) .empty)))) .empty) .empty) .empty))) .empty))))

theorem metadata62 : 0<213482286 ∧ 13<128 ∧ 40<128 ∧ 1<4 ∧
    5695/4160=1 ∧ 5695%4160=1535 ∧ ∀ i, (leaves62 i).Valid 8 := by
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

noncomputable def phaseMass62 : ℝ := singlePhaseMass (213482286/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw62 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass62_eq : phaseMass62 = (106741143/819200000000 : ℝ) := by
  unfold phaseMass62
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw62 output62 cover62 source62
    (gridTreeUnionCheck_sound 32768 raw62 output62 cover62 source62 tree62 checked62)
    _ (by norm_num) _, areaUnits62]
  norm_num

-- Frozen phase 3071, atom 7350, type 1, source (33,55).
def leavesData63 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves63 : Fin 10 → DyadicLeaf := leavesData63.get
def raw63 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 33 55 leaves63 i
def outputData63 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨8448,8576,14080,14208⟩) (.single ⟨8448,8576,14208,14336⟩)) (.node (.single ⟨8576,8640,14080,14144⟩) (.node (.single ⟨8576,8640,14144,14208⟩) (.single ⟨8640,8672,14080,14112⟩)))) (.node (.node (.single ⟨8640,8672,14112,14144⟩) (.single ⟨8672,8704,14080,14112⟩)) (.node (.single ⟨8672,8704,14112,14144⟩) (.node (.single ⟨8640,8704,14144,14208⟩) (.single ⟨8576,8704,14208,14336⟩))))) (.node (.node (.node (.single ⟨14080,14208,8448,8576⟩) (.single ⟨14080,14144,8576,8640⟩)) (.node (.single ⟨14080,14112,8640,8672⟩) (.node (.single ⟨14080,14112,8672,8704⟩) (.single ⟨14112,14144,8640,8672⟩)))) (.node (.node (.single ⟨14112,14144,8672,8704⟩) (.single ⟨14144,14208,8576,8640⟩)) (.node (.single ⟨14144,14208,8640,8704⟩) (.node (.single ⟨14208,14336,8448,8576⟩) (.single ⟨14208,14336,8576,8704⟩)))))) (.node (.node (.node (.node (.single ⟨18432,18560,24064,24192⟩) (.single ⟨18432,18560,24192,24320⟩)) (.node (.single ⟨18560,18624,24064,24128⟩) (.node (.single ⟨18560,18624,24128,24192⟩) (.single ⟨18624,18656,24064,24096⟩)))) (.node (.node (.single ⟨18624,18656,24096,24128⟩) (.single ⟨18656,18688,24064,24096⟩)) (.node (.single ⟨18656,18688,24096,24128⟩) (.node (.single ⟨18624,18688,24128,24192⟩) (.single ⟨18560,18688,24192,24320⟩))))) (.node (.node (.node (.single ⟨24064,24192,18432,18560⟩) (.single ⟨24064,24128,18560,18624⟩)) (.node (.single ⟨24064,24096,18624,18656⟩) (.node (.single ⟨24064,24096,18656,18688⟩) (.single ⟨24096,24128,18624,18656⟩)))) (.node (.node (.single ⟨24096,24128,18656,18688⟩) (.single ⟨24128,24192,18560,18624⟩)) (.node (.single ⟨24128,24192,18624,18688⟩) (.node (.single ⟨24192,24320,18432,18560⟩) (.single ⟨24192,24320,18560,18688⟩)))))))
def output63 : Fin 40 → GridBox := outputData63.get
def coverData63 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 10)) (.node (.single 39) (.node (.single 29) (.single 1)))) (.node (.node (.single 18) (.single 38)) (.node (.single 21) (.node (.single 9) (.single 19))))) (.node (.node (.node (.single 30) (.single 20)) (.node (.single 2) (.node (.single 11) (.single 37)))) (.node (.node (.single 28) (.single 3)) (.node (.single 16) (.node (.single 36) (.single 23)))))) (.node (.node (.node (.node (.single 8) (.single 17)) (.node (.single 31) (.node (.single 22) (.single 4)))) (.node (.node (.single 12) (.single 35)) (.node (.single 27) (.node (.single 5) (.single 14))))) (.node (.node (.node (.single 34) (.single 25)) (.node (.single 6) (.node (.single 13) (.single 33)))) (.node (.node (.single 26) (.single 7)) (.node (.single 15) (.node (.single 32) (.single 24)))))))
def sourceData63 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9)))))) (.node (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover63 (i : Fin 40) : Fin 40 := ⟨coverData63.get i % 40, Nat.mod_lt _ (by decide)⟩
def source63 (i : Fin 40) : Fin 40 := ⟨sourceData63.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree63 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 (.cutY 14336 (.cutX 9216 (.cutY 13312 .empty (.cutX 8704 (.cutY 13824 .empty (.cutX 8448 .empty (.cutY 14080 .empty (.cutX 8576 (.cutY 14208 .full .full) (.cutY 14208 (.cutX 8640 (.cutY 14144 .full .full) (.cutY 14144 (.cutX 8672 (.cutY 14112 .full .full) (.cutY 14112 .full .full)) .full)) .full))))) .empty)) .empty) .empty) .empty)) (.cutY 12288 (.cutX 14336 (.cutY 10240 (.cutX 13312 .empty (.cutY 9216 (.cutX 13824 .empty (.cutY 8704 (.cutX 14080 .empty (.cutY 8448 .empty (.cutX 14208 (.cutY 8576 .full (.cutX 14144 (.cutY 8640 .full (.cutX 14112 (.cutY 8672 .full .full) (.cutY 8672 .full .full))) (.cutY 8640 .full .full))) (.cutY 8576 .full .full)))) .empty)) .empty)) .empty) .empty) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 .empty (.cutY 22528 .empty (.cutX 19456 (.cutY 23552 .empty (.cutX 18944 (.cutY 24064 .empty (.cutX 18688 (.cutY 24320 (.cutX 18560 (.cutY 24192 .full .full) (.cutY 24192 (.cutX 18624 (.cutY 24128 .full .full) (.cutY 24128 (.cutX 18656 (.cutY 24096 .full .full) (.cutY 24096 .full .full)) .full)) .full)) .empty) .empty)) .empty)) .empty)))) (.cutY 20480 (.cutX 22528 .empty (.cutY 18432 .empty (.cutX 23552 .empty (.cutY 19456 (.cutX 24064 .empty (.cutY 18944 (.cutX 24320 (.cutY 18688 (.cutX 24192 (.cutY 18560 .full (.cutX 24128 (.cutY 18624 .full (.cutX 24096 (.cutY 18656 .full .full) (.cutY 18656 .full .full))) (.cutY 18624 .full .full))) (.cutY 18560 .full .full)) .empty) .empty) .empty)) .empty)))) .empty)) .empty) .empty)))

theorem metadata63 : 0<134822691 ∧ 33<128 ∧ 55<128 ∧ 1<4 ∧
    7350/4160=1 ∧ 7350%4160=3190 ∧ ∀ i, (leaves63 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData63).mp
    (by decide +kernel)

theorem sourceChecked63_0 : ∀ i : Fin 40,
    (fun i => output63 i = raw63 (source63 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked63 : ∀ i : Fin 40, (fun i => output63 i = raw63 (source63 i)) i :=
  forallFin_of_zero_offset (fun i => output63 i = raw63 (source63 i)) sourceChecked63_0

theorem coverChecked63_0 : ∀ i : Fin 40,
    (fun i => (output63 (cover63 i)).ContainsBox (raw63 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked63 : ∀ i : Fin 40, (fun i => (output63 (cover63 i)).ContainsBox (raw63 i)) i :=
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

noncomputable def phaseMass63 : ℝ := singlePhaseMass (134822691/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw63 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass63_eq : phaseMass63 = (134822691/1638400000000 : ℝ) := by
  unfold phaseMass63
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw63 output63 cover63 source63
    (gridTreeUnionCheck_sound 32768 raw63 output63 cover63 source63 tree63 checked63)
    _ (by norm_num) _, areaUnits63]
  norm_num

-- Frozen phase 3072, atom 2027, type 0, source (18,47).
def leavesData64 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves64 : Fin 4 → DyadicLeaf := leavesData64.get
def raw64 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 18 47 leaves64 i
def outputData64 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨4608,4736,12032,12160⟩) (.single ⟨4608,4736,12160,12288⟩)) (.node (.single ⟨4736,4864,12032,12160⟩) (.single ⟨4736,4864,12160,12288⟩))) (.node (.node (.single ⟨12032,12160,4608,4736⟩) (.single ⟨12032,12160,4736,4864⟩)) (.node (.single ⟨12160,12288,4608,4736⟩) (.single ⟨12160,12288,4736,4864⟩)))) (.node (.node (.node (.single ⟨20480,20608,27904,28032⟩) (.single ⟨20480,20608,28032,28160⟩)) (.node (.single ⟨20608,20736,27904,28032⟩) (.single ⟨20608,20736,28032,28160⟩))) (.node (.node (.single ⟨27904,28032,20480,20608⟩) (.single ⟨27904,28032,20608,20736⟩)) (.node (.single ⟨28032,28160,20480,20608⟩) (.single ⟨28032,28160,20608,20736⟩)))))
def output64 : Fin 16 → GridBox := outputData64.get
def coverData64 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData64 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover64 (i : Fin 16) : Fin 16 := ⟨coverData64.get i % 16, Nat.mod_lt _ (by decide)⟩
def source64 (i : Fin 16) : Fin 16 := ⟨sourceData64.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree64 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 (.cutY 10240 .empty (.cutX 5120 (.cutY 11264 .empty (.cutX 4608 .empty (.cutY 11776 .empty (.cutX 4864 (.cutY 12032 .empty (.cutX 4736 (.cutY 12160 .full .full) (.cutY 12160 .full .full))) .empty)))) .empty)) .empty) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 .empty (.cutY 6144 (.cutX 11264 .empty (.cutY 5120 (.cutX 11776 .empty (.cutY 4608 .empty (.cutX 12032 .empty (.cutY 4864 (.cutX 12160 (.cutY 4736 .full .full) (.cutY 4736 .full .full)) .empty)))) .empty)) .empty))) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 (.cutY 26624 .empty (.cutX 21504 (.cutY 27648 .empty (.cutX 20992 (.cutY 28160 (.cutX 20736 (.cutY 27904 .empty (.cutX 20608 (.cutY 28032 .full .full) (.cutY 28032 .full .full))) .empty) .empty) .empty)) .empty)) .empty) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 .empty (.cutY 22528 (.cutX 27648 .empty (.cutY 21504 (.cutX 28160 (.cutY 20992 (.cutX 27904 .empty (.cutY 20736 (.cutX 28032 (.cutY 20608 .full .full) (.cutY 20608 .full .full)) .empty)) .empty) .empty) .empty)) .empty))) .empty) .empty))))

theorem metadata64 : 0<73667111 ∧ 18<128 ∧ 47<128 ∧ 0<4 ∧
    2027/4160=0 ∧ 2027%4160=2027 ∧ ∀ i, (leaves64 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData64).mp
    (by decide +kernel)

theorem sourceChecked64_0 : ∀ i : Fin 16,
    (fun i => output64 i = raw64 (source64 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked64 : ∀ i : Fin 16, (fun i => output64 i = raw64 (source64 i)) i :=
  forallFin_of_zero_offset (fun i => output64 i = raw64 (source64 i)) sourceChecked64_0

theorem coverChecked64_0 : ∀ i : Fin 16,
    (fun i => (output64 (cover64 i)).ContainsBox (raw64 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked64 : ∀ i : Fin 16, (fun i => (output64 (cover64 i)).ContainsBox (raw64 i)) i :=
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

noncomputable def phaseMass64 : ℝ := singlePhaseMass (73667111/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw64 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass64_eq : phaseMass64 = (73667111/1638400000000 : ℝ) := by
  unfold phaseMass64
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw64 output64 cover64 source64
    (gridTreeUnionCheck_sound 32768 raw64 output64 cover64 source64 tree64 checked64)
    _ (by norm_num) _, areaUnits64]
  norm_num

-- Frozen phase 3073, atom 4197, type 1, source (0,37).
def leavesData65 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves65 : Fin 1 → DyadicLeaf := leavesData65.get
def raw65 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 0 37 leaves65 i
def outputData65 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨0,256,9472,9728⟩) (.single ⟨9472,9728,0,256⟩)) (.node (.single ⟨23040,23296,32512,32768⟩) (.single ⟨32512,32768,23040,23296⟩)))
def output65 : Fin 4 → GridBox := outputData65.get
def coverData65 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData65 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover65 (i : Fin 4) : Fin 4 := ⟨coverData65.get i % 4, Nat.mod_lt _ (by decide)⟩
def source65 (i : Fin 4) : Fin 4 := ⟨sourceData65.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree65 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 (.cutY 10240 (.cutX 1024 (.cutY 9216 .empty (.cutX 512 (.cutY 9728 (.cutX 256 (.cutY 9472 .empty .full) .empty) .empty) .empty)) .empty) .empty) .empty) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 (.cutX 9216 .empty (.cutY 1024 (.cutX 9728 (.cutY 512 (.cutX 9472 .empty (.cutY 256 .full .empty)) .empty) .empty) .empty)) .empty) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 .empty (.cutX 23552 (.cutY 31744 .empty (.cutX 23040 .empty (.cutY 32256 .empty (.cutX 23296 (.cutY 32512 .empty .full) .empty)))) .empty)))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 .empty (.cutY 22528 .empty (.cutX 31744 .empty (.cutY 23552 (.cutX 32256 .empty (.cutY 23040 .empty (.cutX 32512 .empty (.cutY 23296 .full .empty)))) .empty)))))) .empty))))

theorem metadata65 : 0<475523442 ∧ 0<128 ∧ 37<128 ∧ 1<4 ∧
    4197/4160=1 ∧ 4197%4160=37 ∧ ∀ i, (leaves65 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData65).mp
    (by decide +kernel)

theorem sourceChecked65_0 : ∀ i : Fin 4,
    (fun i => output65 i = raw65 (source65 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked65 : ∀ i : Fin 4, (fun i => output65 i = raw65 (source65 i)) i :=
  forallFin_of_zero_offset (fun i => output65 i = raw65 (source65 i)) sourceChecked65_0

theorem coverChecked65_0 : ∀ i : Fin 4,
    (fun i => (output65 (cover65 i)).ContainsBox (raw65 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked65 : ∀ i : Fin 4, (fun i => (output65 (cover65 i)).ContainsBox (raw65 i)) i :=
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

noncomputable def phaseMass65 : ℝ := singlePhaseMass (475523442/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw65 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass65_eq : phaseMass65 = (237761721/819200000000 : ℝ) := by
  unfold phaseMass65
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw65 output65 cover65 source65
    (gridTreeUnionCheck_sound 32768 raw65 output65 cover65 source65 tree65 checked65)
    _ (by norm_num) _, areaUnits65]
  norm_num

-- Frozen phase 3074, atom 2927, type 0, source (29,56).
def leavesData66 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves66 : Fin 1 → DyadicLeaf := leavesData66.get
def raw66 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 29 56 leaves66 i
def outputData66 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨7424,7680,14336,14592⟩) (.single ⟨14336,14592,7424,7680⟩)) (.node (.single ⟨18176,18432,25088,25344⟩) (.single ⟨25088,25344,18176,18432⟩)))
def output66 : Fin 4 → GridBox := outputData66.get
def coverData66 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData66 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover66 (i : Fin 4) : Fin 4 := ⟨coverData66.get i % 4, Nat.mod_lt _ (by decide)⟩
def source66 (i : Fin 4) : Fin 4 := ⟨sourceData66.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree66 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 .empty (.cutY 14336 .empty (.cutX 7168 .empty (.cutY 15360 (.cutX 7680 (.cutY 14848 (.cutX 7424 .empty (.cutY 14592 .full .empty)) .empty) .empty) .empty))))))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 .empty (.cutY 6144 .empty (.cutX 15360 (.cutY 7168 .empty (.cutX 14848 (.cutY 7680 (.cutX 14592 (.cutY 7424 .empty .full) .empty) .empty) .empty)) .empty))))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 (.cutY 26624 (.cutX 17408 .empty (.cutY 25600 (.cutX 17920 .empty (.cutY 25088 .empty (.cutX 18176 .empty (.cutY 25344 .full .empty)))) .empty)) .empty) .empty) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 (.cutY 18432 (.cutX 25600 (.cutY 17408 .empty (.cutX 25088 .empty (.cutY 17920 .empty (.cutX 25344 (.cutY 18176 .empty .full) .empty)))) .empty) .empty) .empty) .empty) .empty) .empty))))

theorem metadata66 : 0<29910597 ∧ 29<128 ∧ 56<128 ∧ 0<4 ∧
    2927/4160=0 ∧ 2927%4160=2927 ∧ ∀ i, (leaves66 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData66).mp
    (by decide +kernel)

theorem sourceChecked66_0 : ∀ i : Fin 4,
    (fun i => output66 i = raw66 (source66 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked66 : ∀ i : Fin 4, (fun i => output66 i = raw66 (source66 i)) i :=
  forallFin_of_zero_offset (fun i => output66 i = raw66 (source66 i)) sourceChecked66_0

theorem coverChecked66_0 : ∀ i : Fin 4,
    (fun i => (output66 (cover66 i)).ContainsBox (raw66 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked66 : ∀ i : Fin 4, (fun i => (output66 (cover66 i)).ContainsBox (raw66 i)) i :=
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

noncomputable def phaseMass66 : ℝ := singlePhaseMass (29910597/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw66 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass66_eq : phaseMass66 = (29910597/1638400000000 : ℝ) := by
  unfold phaseMass66
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw66 output66 cover66 source66
    (gridTreeUnionCheck_sound 32768 raw66 output66 cover66 source66 tree66 checked66)
    _ (by norm_num) _, areaUnits66]
  norm_num

-- Frozen phase 3075, atom 774, type 0, source (6,42).
def leavesData67 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves67 : Fin 4 → DyadicLeaf := leavesData67.get
def raw67 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 6 42 leaves67 i
def outputData67 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨1536,1664,10752,10880⟩) (.single ⟨1536,1664,10880,11008⟩)) (.node (.single ⟨1664,1792,10752,10880⟩) (.single ⟨1664,1792,10880,11008⟩))) (.node (.node (.single ⟨10752,10880,1536,1664⟩) (.single ⟨10752,10880,1664,1792⟩)) (.node (.single ⟨10880,11008,1536,1664⟩) (.single ⟨10880,11008,1664,1792⟩)))) (.node (.node (.node (.single ⟨21760,21888,30976,31104⟩) (.single ⟨21760,21888,31104,31232⟩)) (.node (.single ⟨21888,22016,30976,31104⟩) (.single ⟨21888,22016,31104,31232⟩))) (.node (.node (.single ⟨30976,31104,21760,21888⟩) (.single ⟨30976,31104,21888,22016⟩)) (.node (.single ⟨31104,31232,21760,21888⟩) (.single ⟨31104,31232,21888,22016⟩)))))
def output67 : Fin 16 → GridBox := outputData67.get
def coverData67 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData67 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover67 (i : Fin 16) : Fin 16 := ⟨coverData67.get i % 16, Nat.mod_lt _ (by decide)⟩
def source67 (i : Fin 16) : Fin 16 := ⟨sourceData67.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree67 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 (.cutY 10240 .empty (.cutX 1024 .empty (.cutY 11264 (.cutX 1536 .empty (.cutY 10752 .empty (.cutX 1792 (.cutY 11008 (.cutX 1664 (.cutY 10880 .full .full) (.cutY 10880 .full .full)) .empty) .empty))) .empty))) .empty) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 .empty (.cutY 2048 (.cutX 11264 (.cutY 1024 .empty (.cutX 10752 .empty (.cutY 1536 .empty (.cutX 11008 (.cutY 1792 (.cutX 10880 (.cutY 1664 .full .full) (.cutY 1664 .full .full)) .empty) .empty)))) .empty) .empty)) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 (.cutY 30720 .empty (.cutX 21504 .empty (.cutY 31744 (.cutX 22016 (.cutY 31232 (.cutX 21760 .empty (.cutY 30976 .empty (.cutX 21888 (.cutY 31104 .full .full) (.cutY 31104 .full .full)))) .empty) .empty) .empty))) .empty)))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 .empty (.cutY 22528 (.cutX 31744 (.cutY 21504 .empty (.cutX 31232 (.cutY 22016 (.cutX 30976 .empty (.cutY 21760 .empty (.cutX 31104 (.cutY 21888 .full .full) (.cutY 21888 .full .full)))) .empty) .empty)) .empty) .empty)))) .empty))))

theorem metadata67 : 0<374268468 ∧ 6<128 ∧ 42<128 ∧ 0<4 ∧
    774/4160=0 ∧ 774%4160=774 ∧ ∀ i, (leaves67 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData67).mp
    (by decide +kernel)

theorem sourceChecked67_0 : ∀ i : Fin 16,
    (fun i => output67 i = raw67 (source67 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked67 : ∀ i : Fin 16, (fun i => output67 i = raw67 (source67 i)) i :=
  forallFin_of_zero_offset (fun i => output67 i = raw67 (source67 i)) sourceChecked67_0

theorem coverChecked67_0 : ∀ i : Fin 16,
    (fun i => (output67 (cover67 i)).ContainsBox (raw67 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked67 : ∀ i : Fin 16, (fun i => (output67 (cover67 i)).ContainsBox (raw67 i)) i :=
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

noncomputable def phaseMass67 : ℝ := singlePhaseMass (374268468/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw67 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass67_eq : phaseMass67 = (93567117/409600000000 : ℝ) := by
  unfold phaseMass67
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw67 output67 cover67 source67
    (gridTreeUnionCheck_sound 32768 raw67 output67 cover67 source67 tree67 checked67)
    _ (by norm_num) _, areaUnits67]
  norm_num

-- Frozen phase 3076, atom 1114, type 0, source (9,43).
def leavesData68 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves68 : Fin 4 → DyadicLeaf := leavesData68.get
def raw68 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 9 43 leaves68 i
def outputData68 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨2304,2432,11008,11136⟩) (.single ⟨2304,2432,11136,11264⟩)) (.node (.single ⟨2432,2560,11008,11136⟩) (.single ⟨2432,2560,11136,11264⟩))) (.node (.node (.single ⟨11008,11136,2304,2432⟩) (.single ⟨11008,11136,2432,2560⟩)) (.node (.single ⟨11136,11264,2304,2432⟩) (.single ⟨11136,11264,2432,2560⟩)))) (.node (.node (.node (.single ⟨21504,21632,30208,30336⟩) (.single ⟨21504,21632,30336,30464⟩)) (.node (.single ⟨21632,21760,30208,30336⟩) (.single ⟨21632,21760,30336,30464⟩))) (.node (.node (.single ⟨30208,30336,21504,21632⟩) (.single ⟨30208,30336,21632,21760⟩)) (.node (.single ⟨30336,30464,21504,21632⟩) (.single ⟨30336,30464,21632,21760⟩)))))
def output68 : Fin 16 → GridBox := outputData68.get
def coverData68 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData68 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover68 (i : Fin 16) : Fin 16 := ⟨coverData68.get i % 16, Nat.mod_lt _ (by decide)⟩
def source68 (i : Fin 16) : Fin 16 := ⟨sourceData68.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree68 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 .empty (.cutY 10240 .empty (.cutX 3072 (.cutY 11264 (.cutX 2560 (.cutY 10752 .empty (.cutX 2304 .empty (.cutY 11008 .empty (.cutX 2432 (.cutY 11136 .full .full) (.cutY 11136 .full .full))))) .empty) .empty) .empty))) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 .empty (.cutY 2048 .empty (.cutX 11264 (.cutY 3072 (.cutX 10752 .empty (.cutY 2560 (.cutX 11008 .empty (.cutY 2304 .empty (.cutX 11136 (.cutY 2432 .full .full) (.cutY 2432 .full .full)))) .empty)) .empty) .empty))) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 (.cutY 30720 (.cutX 21504 .empty (.cutY 29696 .empty (.cutX 22016 (.cutY 30208 .empty (.cutX 21760 (.cutY 30464 (.cutX 21632 (.cutY 30336 .full .full) (.cutY 30336 .full .full)) .empty) .empty)) .empty))) .empty) .empty)))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 (.cutY 22528 (.cutX 29696 .empty (.cutY 21504 .empty (.cutX 30208 .empty (.cutY 22016 (.cutX 30464 (.cutY 21760 (.cutX 30336 (.cutY 21632 .full .full) (.cutY 21632 .full .full)) .empty) .empty) .empty)))) .empty) .empty))) .empty))))

theorem metadata68 : 0<296697202 ∧ 9<128 ∧ 43<128 ∧ 0<4 ∧
    1114/4160=0 ∧ 1114%4160=1114 ∧ ∀ i, (leaves68 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData68).mp
    (by decide +kernel)

theorem sourceChecked68_0 : ∀ i : Fin 16,
    (fun i => output68 i = raw68 (source68 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked68 : ∀ i : Fin 16, (fun i => output68 i = raw68 (source68 i)) i :=
  forallFin_of_zero_offset (fun i => output68 i = raw68 (source68 i)) sourceChecked68_0

theorem coverChecked68_0 : ∀ i : Fin 16,
    (fun i => (output68 (cover68 i)).ContainsBox (raw68 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked68 : ∀ i : Fin 16, (fun i => (output68 (cover68 i)).ContainsBox (raw68 i)) i :=
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

noncomputable def phaseMass68 : ℝ := singlePhaseMass (296697202/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw68 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass68_eq : phaseMass68 = (148348601/819200000000 : ℝ) := by
  unfold phaseMass68
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw68 output68 cover68 source68
    (gridTreeUnionCheck_sound 32768 raw68 output68 cover68 source68 tree68 checked68)
    _ (by norm_num) _, areaUnits68]
  norm_num

-- Frozen phase 3077, atom 3678, type 0, source (42,66).
def leavesData69 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves69 : Fin 1 → DyadicLeaf := leavesData69.get
def raw69 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 42 66 leaves69 i
def outputData69 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨10752,11008,16896,17152⟩) (.single ⟨15616,15872,21760,22016⟩)) (.node (.single ⟨16896,17152,10752,11008⟩) (.single ⟨21760,22016,15616,15872⟩)))
def output69 : Fin 4 → GridBox := outputData69.get
def coverData69 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 2)) (.node (.single 3) (.single 1)))
def sourceData69 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 3)) (.node (.single 1) (.single 2)))
def cover69 (i : Fin 4) : Fin 4 := ⟨coverData69.get i % 4, Nat.mod_lt _ (by decide)⟩
def source69 (i : Fin 4) : Fin 4 := ⟨sourceData69.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree69 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 .empty (.cutY 18432 (.cutX 11264 (.cutY 17408 (.cutX 10752 .empty (.cutY 16896 .empty (.cutX 11008 (.cutY 17152 .full .empty) .empty))) .empty) .empty) .empty)) .empty) (.cutY 20480 .empty (.cutX 14336 .empty (.cutY 22528 (.cutX 15360 .empty (.cutY 21504 .empty (.cutX 15872 (.cutY 22016 (.cutX 15616 .empty (.cutY 21760 .empty .full)) .empty) .empty))) .empty)))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 (.cutY 10240 .empty (.cutX 17408 (.cutY 11264 (.cutX 16896 .empty (.cutY 10752 .empty (.cutX 17152 (.cutY 11008 .full .empty) .empty))) .empty) .empty)) .empty) .empty) (.cutY 12288 .empty (.cutX 22528 (.cutY 14336 .empty (.cutX 21504 .empty (.cutY 15360 .empty (.cutX 22016 (.cutY 15872 (.cutX 21760 .empty (.cutY 15616 .empty .full)) .empty) .empty)))) .empty)))) .empty) .empty))

theorem metadata69 : 0<20837145 ∧ 42<128 ∧ 66<128 ∧ 0<4 ∧
    3678/4160=0 ∧ 3678%4160=3678 ∧ ∀ i, (leaves69 i).Valid 8 := by
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

noncomputable def phaseMass69 : ℝ := singlePhaseMass (20837145/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw69 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass69_eq : phaseMass69 = (4167429/327680000000 : ℝ) := by
  unfold phaseMass69
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw69 output69 cover69 source69
    (gridTreeUnionCheck_sound 32768 raw69 output69 cover69 source69 tree69 checked69)
    _ (by norm_num) _, areaUnits69]
  norm_num

-- Frozen phase 3078, atom 3256, type 0, source (34,60).
def leavesData70 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves70 : Fin 1 → DyadicLeaf := leavesData70.get
def raw70 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 34 60 leaves70 i
def outputData70 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨8704,8960,15360,15616⟩) (.single ⟨15360,15616,8704,8960⟩)) (.node (.single ⟨17152,17408,23808,24064⟩) (.single ⟨23808,24064,17152,17408⟩)))
def output70 : Fin 4 → GridBox := outputData70.get
def coverData70 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData70 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover70 (i : Fin 4) : Fin 4 := ⟨coverData70.get i % 4, Nat.mod_lt _ (by decide)⟩
def source70 (i : Fin 4) : Fin 4 := ⟨sourceData70.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree70 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 (.cutY 14336 .empty (.cutX 9216 (.cutY 15360 .empty (.cutX 8704 .empty (.cutY 15872 (.cutX 8960 (.cutY 15616 .full .empty) .empty) .empty))) .empty)) .empty)) (.cutY 12288 (.cutX 14336 .empty (.cutY 10240 (.cutX 15360 .empty (.cutY 9216 (.cutX 15872 (.cutY 8704 .empty (.cutX 15616 (.cutY 8960 .full .empty) .empty)) .empty) .empty)) .empty)) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 (.cutY 22528 .empty (.cutX 17408 (.cutY 23552 .empty (.cutX 16896 .empty (.cutY 24064 (.cutX 17152 .empty (.cutY 23808 .empty .full)) .empty))) .empty)) .empty)) (.cutY 20480 (.cutX 22528 .empty (.cutY 18432 (.cutX 23552 .empty (.cutY 17408 (.cutX 24064 (.cutY 16896 .empty (.cutX 23808 .empty (.cutY 17152 .empty .full))) .empty) .empty)) .empty)) .empty)) .empty) .empty)))

theorem metadata70 : 0<200205545 ∧ 34<128 ∧ 60<128 ∧ 0<4 ∧
    3256/4160=0 ∧ 3256%4160=3256 ∧ ∀ i, (leaves70 i).Valid 8 := by
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

-- Frozen phase 3079, atom 2706, type 0, source (26,54).
def leavesData71 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves71 : Fin 1 → DyadicLeaf := leavesData71.get
def raw71 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 26 54 leaves71 i
def outputData71 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨6656,6912,13824,14080⟩) (.single ⟨13824,14080,6656,6912⟩)) (.node (.single ⟨18688,18944,25856,26112⟩) (.single ⟨25856,26112,18688,18944⟩)))
def output71 : Fin 4 → GridBox := outputData71.get
def coverData71 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData71 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover71 (i : Fin 4) : Fin 4 := ⟨coverData71.get i % 4, Nat.mod_lt _ (by decide)⟩
def source71 (i : Fin 4) : Fin 4 := ⟨sourceData71.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree71 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 .empty (.cutY 14336 (.cutX 7168 (.cutY 13312 .empty (.cutX 6656 .empty (.cutY 13824 .empty (.cutX 6912 (.cutY 14080 .full .empty) .empty)))) .empty) .empty))))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 (.cutY 6144 .empty (.cutX 13312 .empty (.cutY 7168 (.cutX 13824 .empty (.cutY 6656 .empty (.cutX 14080 (.cutY 6912 .full .empty) .empty))) .empty))) .empty))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 .empty (.cutY 26624 (.cutX 19456 (.cutY 25600 .empty (.cutX 18944 (.cutY 26112 (.cutX 18688 .empty (.cutY 25856 .empty .full)) .empty) .empty)) .empty) .empty)) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 (.cutY 18432 .empty (.cutX 25600 .empty (.cutY 19456 (.cutX 26112 (.cutY 18944 (.cutX 25856 .empty (.cutY 18688 .empty .full)) .empty) .empty) .empty))) .empty) .empty) .empty) .empty))))

theorem metadata71 : 0<300263580 ∧ 26<128 ∧ 54<128 ∧ 0<4 ∧
    2706/4160=0 ∧ 2706%4160=2706 ∧ ∀ i, (leaves71 i).Valid 8 := by
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

noncomputable def phaseMass71 : ℝ := singlePhaseMass (300263580/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw71 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass71_eq : phaseMass71 = (15013179/81920000000 : ℝ) := by
  unfold phaseMass71
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw71 output71 cover71 source71
    (gridTreeUnionCheck_sound 32768 raw71 output71 cover71 source71 tree71 checked71)
    _ (by norm_num) _, areaUnits71]
  norm_num

-- Frozen phase 3080, atom 1331, type 0, source (11,44).
def leavesData72 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves72 : Fin 4 → DyadicLeaf := leavesData72.get
def raw72 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 11 44 leaves72 i
def outputData72 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨2816,2944,11264,11392⟩) (.single ⟨2816,2944,11392,11520⟩)) (.node (.single ⟨2944,3072,11264,11392⟩) (.single ⟨2944,3072,11392,11520⟩))) (.node (.node (.single ⟨11264,11392,2816,2944⟩) (.single ⟨11264,11392,2944,3072⟩)) (.node (.single ⟨11392,11520,2816,2944⟩) (.single ⟨11392,11520,2944,3072⟩)))) (.node (.node (.node (.single ⟨21248,21376,29696,29824⟩) (.single ⟨21248,21376,29824,29952⟩)) (.node (.single ⟨21376,21504,29696,29824⟩) (.single ⟨21376,21504,29824,29952⟩))) (.node (.node (.single ⟨29696,29824,21248,21376⟩) (.single ⟨29696,29824,21376,21504⟩)) (.node (.single ⟨29824,29952,21248,21376⟩) (.single ⟨29824,29952,21376,21504⟩)))))
def output72 : Fin 16 → GridBox := outputData72.get
def coverData72 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData72 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover72 (i : Fin 16) : Fin 16 := ⟨coverData72.get i % 16, Nat.mod_lt _ (by decide)⟩
def source72 (i : Fin 16) : Fin 16 := ⟨sourceData72.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree72 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 .empty (.cutY 10240 .empty (.cutX 3072 (.cutY 11264 .empty (.cutX 2560 .empty (.cutY 11776 (.cutX 2816 .empty (.cutY 11520 (.cutX 2944 (.cutY 11392 .full .full) (.cutY 11392 .full .full)) .empty)) .empty))) .empty))) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 .empty (.cutY 2048 .empty (.cutX 11264 .empty (.cutY 3072 (.cutX 11776 (.cutY 2560 .empty (.cutX 11520 (.cutY 2816 .empty (.cutX 11392 (.cutY 2944 .full .full) (.cutY 2944 .full .full))) .empty)) .empty) .empty)))) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 (.cutY 30720 (.cutX 21504 (.cutY 29696 .empty (.cutX 20992 .empty (.cutY 30208 (.cutX 21248 .empty (.cutY 29952 (.cutX 21376 (.cutY 29824 .full .full) (.cutY 29824 .full .full)) .empty)) .empty))) .empty) .empty) .empty)))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 (.cutY 22528 (.cutX 29696 .empty (.cutY 21504 (.cutX 30208 (.cutY 20992 .empty (.cutX 29952 (.cutY 21248 .empty (.cutX 29824 (.cutY 21376 .full .full) (.cutY 21376 .full .full))) .empty)) .empty) .empty)) .empty) .empty))) .empty))))

theorem metadata72 : 0<296697202 ∧ 11<128 ∧ 44<128 ∧ 0<4 ∧
    1331/4160=0 ∧ 1331%4160=1331 ∧ ∀ i, (leaves72 i).Valid 8 := by
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

noncomputable def phaseMass72 : ℝ := singlePhaseMass (296697202/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw72 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass72_eq : phaseMass72 = (148348601/819200000000 : ℝ) := by
  unfold phaseMass72
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw72 output72 cover72 source72
    (gridTreeUnionCheck_sound 32768 raw72 output72 cover72 source72 tree72 checked72)
    _ (by norm_num) _, areaUnits72]
  norm_num

-- Frozen phase 3081, atom 1540, type 0, source (13,45).
def leavesData73 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves73 : Fin 4 → DyadicLeaf := leavesData73.get
def raw73 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 13 45 leaves73 i
def outputData73 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨3328,3456,11520,11648⟩) (.single ⟨3328,3456,11648,11776⟩)) (.node (.single ⟨3456,3584,11520,11648⟩) (.single ⟨3456,3584,11648,11776⟩))) (.node (.node (.single ⟨11520,11648,3328,3456⟩) (.single ⟨11520,11648,3456,3584⟩)) (.node (.single ⟨11648,11776,3328,3456⟩) (.single ⟨11648,11776,3456,3584⟩)))) (.node (.node (.node (.single ⟨20992,21120,29184,29312⟩) (.single ⟨20992,21120,29312,29440⟩)) (.node (.single ⟨21120,21248,29184,29312⟩) (.single ⟨21120,21248,29312,29440⟩))) (.node (.node (.single ⟨29184,29312,20992,21120⟩) (.single ⟨29184,29312,21120,21248⟩)) (.node (.single ⟨29312,29440,20992,21120⟩) (.single ⟨29312,29440,21120,21248⟩)))))
def output73 : Fin 16 → GridBox := outputData73.get
def coverData73 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData73 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover73 (i : Fin 16) : Fin 16 := ⟨coverData73.get i % 16, Nat.mod_lt _ (by decide)⟩
def source73 (i : Fin 16) : Fin 16 := ⟨sourceData73.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree73 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 .empty (.cutY 10240 .empty (.cutX 3072 .empty (.cutY 11264 .empty (.cutX 3584 (.cutY 11776 (.cutX 3328 .empty (.cutY 11520 .empty (.cutX 3456 (.cutY 11648 .full .full) (.cutY 11648 .full .full)))) .empty) .empty))))) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 .empty (.cutY 2048 .empty (.cutX 11264 .empty (.cutY 3072 .empty (.cutX 11776 (.cutY 3584 (.cutX 11520 .empty (.cutY 3328 .empty (.cutX 11648 (.cutY 3456 .full .full) (.cutY 3456 .full .full)))) .empty) .empty))))) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 (.cutY 30720 (.cutX 21504 (.cutY 29696 (.cutX 20992 .empty (.cutY 29184 .empty (.cutX 21248 (.cutY 29440 (.cutX 21120 (.cutY 29312 .full .full) (.cutY 29312 .full .full)) .empty) .empty))) .empty) .empty) .empty) .empty)))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 (.cutY 22528 (.cutX 29696 (.cutY 21504 (.cutX 29184 .empty (.cutY 20992 .empty (.cutX 29440 (.cutY 21248 (.cutX 29312 (.cutY 21120 .full .full) (.cutY 21120 .full .full)) .empty) .empty))) .empty) .empty) .empty) .empty))) .empty))))

theorem metadata73 : 0<296697202 ∧ 13<128 ∧ 45<128 ∧ 0<4 ∧
    1540/4160=0 ∧ 1540%4160=1540 ∧ ∀ i, (leaves73 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData73).mp
    (by decide +kernel)

theorem sourceChecked73_0 : ∀ i : Fin 16,
    (fun i => output73 i = raw73 (source73 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked73 : ∀ i : Fin 16, (fun i => output73 i = raw73 (source73 i)) i :=
  forallFin_of_zero_offset (fun i => output73 i = raw73 (source73 i)) sourceChecked73_0

theorem coverChecked73_0 : ∀ i : Fin 16,
    (fun i => (output73 (cover73 i)).ContainsBox (raw73 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked73 : ∀ i : Fin 16, (fun i => (output73 (cover73 i)).ContainsBox (raw73 i)) i :=
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

noncomputable def phaseMass73 : ℝ := singlePhaseMass (296697202/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw73 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass73_eq : phaseMass73 = (148348601/819200000000 : ℝ) := by
  unfold phaseMass73
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw73 output73 cover73 source73
    (gridTreeUnionCheck_sound 32768 raw73 output73 cover73 source73 tree73 checked73)
    _ (by norm_num) _, areaUnits73]
  norm_num

-- Frozen phase 3082, atom 1838, type 0, source (16,46).
def leavesData74 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves74 : Fin 4 → DyadicLeaf := leavesData74.get
def raw74 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 16 46 leaves74 i
def outputData74 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨4096,4224,11776,11904⟩) (.single ⟨4096,4224,11904,12032⟩)) (.node (.single ⟨4224,4352,11776,11904⟩) (.single ⟨4224,4352,11904,12032⟩))) (.node (.node (.single ⟨11776,11904,4096,4224⟩) (.single ⟨11776,11904,4224,4352⟩)) (.node (.single ⟨11904,12032,4096,4224⟩) (.single ⟨11904,12032,4224,4352⟩)))) (.node (.node (.node (.single ⟨20736,20864,28416,28544⟩) (.single ⟨20736,20864,28544,28672⟩)) (.node (.single ⟨20864,20992,28416,28544⟩) (.single ⟨20864,20992,28544,28672⟩))) (.node (.node (.single ⟨28416,28544,20736,20864⟩) (.single ⟨28416,28544,20864,20992⟩)) (.node (.single ⟨28544,28672,20736,20864⟩) (.single ⟨28544,28672,20864,20992⟩)))))
def output74 : Fin 16 → GridBox := outputData74.get
def coverData74 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData74 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover74 (i : Fin 16) : Fin 16 := ⟨coverData74.get i % 16, Nat.mod_lt _ (by decide)⟩
def source74 (i : Fin 16) : Fin 16 := ⟨sourceData74.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree74 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 (.cutY 10240 .empty (.cutX 5120 (.cutY 11264 .empty (.cutX 4608 (.cutY 11776 .empty (.cutX 4352 (.cutY 12032 (.cutX 4224 (.cutY 11904 .full .full) (.cutY 11904 .full .full)) .empty) .empty)) .empty)) .empty)) .empty) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 .empty (.cutY 6144 (.cutX 11264 .empty (.cutY 5120 (.cutX 11776 .empty (.cutY 4608 (.cutX 12032 (.cutY 4352 (.cutX 11904 (.cutY 4224 .full .full) (.cutY 4224 .full .full)) .empty) .empty) .empty)) .empty)) .empty))) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 (.cutY 26624 .empty (.cutX 21504 (.cutY 27648 .empty (.cutX 20992 (.cutY 28160 .empty (.cutX 20736 .empty (.cutY 28416 .empty (.cutX 20864 (.cutY 28544 .full .full) (.cutY 28544 .full .full))))) .empty)) .empty)) .empty) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 .empty (.cutY 22528 (.cutX 27648 .empty (.cutY 21504 (.cutX 28160 .empty (.cutY 20992 (.cutX 28416 .empty (.cutY 20736 .empty (.cutX 28544 (.cutY 20864 .full .full) (.cutY 20864 .full .full)))) .empty)) .empty)) .empty))) .empty) .empty))))

theorem metadata74 : 0<73667111 ∧ 16<128 ∧ 46<128 ∧ 0<4 ∧
    1838/4160=0 ∧ 1838%4160=1838 ∧ ∀ i, (leaves74 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData74).mp
    (by decide +kernel)

theorem sourceChecked74_0 : ∀ i : Fin 16,
    (fun i => output74 i = raw74 (source74 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked74 : ∀ i : Fin 16, (fun i => output74 i = raw74 (source74 i)) i :=
  forallFin_of_zero_offset (fun i => output74 i = raw74 (source74 i)) sourceChecked74_0

theorem coverChecked74_0 : ∀ i : Fin 16,
    (fun i => (output74 (cover74 i)).ContainsBox (raw74 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked74 : ∀ i : Fin 16, (fun i => (output74 (cover74 i)).ContainsBox (raw74 i)) i :=
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

noncomputable def phaseMass74 : ℝ := singlePhaseMass (73667111/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw74 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass74_eq : phaseMass74 = (73667111/1638400000000 : ℝ) := by
  unfold phaseMass74
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw74 output74 cover74 source74
    (gridTreeUnionCheck_sound 32768 raw74 output74 cover74 source74 tree74 checked74)
    _ (by norm_num) _, areaUnits74]
  norm_num

-- Frozen phase 3083, atom 2119, type 0, source (19,48).
def leavesData75 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves75 : Fin 4 → DyadicLeaf := leavesData75.get
def raw75 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 19 48 leaves75 i
def outputData75 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨4864,4992,12288,12416⟩) (.single ⟨4864,4992,12416,12544⟩)) (.node (.single ⟨4992,5120,12288,12416⟩) (.single ⟨4992,5120,12416,12544⟩))) (.node (.node (.single ⟨12288,12416,4864,4992⟩) (.single ⟨12288,12416,4992,5120⟩)) (.node (.single ⟨12416,12544,4864,4992⟩) (.single ⟨12416,12544,4992,5120⟩)))) (.node (.node (.node (.single ⟨20224,20352,27648,27776⟩) (.single ⟨20224,20352,27776,27904⟩)) (.node (.single ⟨20352,20480,27648,27776⟩) (.single ⟨20352,20480,27776,27904⟩))) (.node (.node (.single ⟨27648,27776,20224,20352⟩) (.single ⟨27648,27776,20352,20480⟩)) (.node (.single ⟨27776,27904,20224,20352⟩) (.single ⟨27776,27904,20352,20480⟩)))))
def output75 : Fin 16 → GridBox := outputData75.get
def coverData75 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData75 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover75 (i : Fin 16) : Fin 16 := ⟨coverData75.get i % 16, Nat.mod_lt _ (by decide)⟩
def source75 (i : Fin 16) : Fin 16 := ⟨sourceData75.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree75 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 (.cutY 14336 (.cutX 5120 (.cutY 13312 (.cutX 4608 .empty (.cutY 12800 (.cutX 4864 .empty (.cutY 12544 (.cutX 4992 (.cutY 12416 .full .full) (.cutY 12416 .full .full)) .empty)) .empty)) .empty) .empty) .empty) .empty)))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 (.cutY 6144 (.cutX 13312 (.cutY 5120 (.cutX 12800 (.cutY 4608 .empty (.cutX 12544 (.cutY 4864 .empty (.cutX 12416 (.cutY 4992 .full .full) (.cutY 4992 .full .full))) .empty)) .empty) .empty) .empty) .empty) .empty))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 .empty (.cutY 26624 .empty (.cutX 19456 .empty (.cutY 27648 .empty (.cutX 19968 .empty (.cutY 28160 (.cutX 20224 .empty (.cutY 27904 (.cutX 20352 (.cutY 27776 .full .full) (.cutY 27776 .full .full)) .empty)) .empty)))))) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 .empty (.cutY 18432 .empty (.cutX 27648 .empty (.cutY 19456 .empty (.cutX 28160 (.cutY 19968 .empty (.cutX 27904 (.cutY 20224 .empty (.cutX 27776 (.cutY 20352 .full .full) (.cutY 20352 .full .full))) .empty)) .empty))))) .empty) .empty) .empty))))

theorem metadata75 : 0<204777576 ∧ 19<128 ∧ 48<128 ∧ 0<4 ∧
    2119/4160=0 ∧ 2119%4160=2119 ∧ ∀ i, (leaves75 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData75).mp
    (by decide +kernel)

theorem sourceChecked75_0 : ∀ i : Fin 16,
    (fun i => output75 i = raw75 (source75 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked75 : ∀ i : Fin 16, (fun i => output75 i = raw75 (source75 i)) i :=
  forallFin_of_zero_offset (fun i => output75 i = raw75 (source75 i)) sourceChecked75_0

theorem coverChecked75_0 : ∀ i : Fin 16,
    (fun i => (output75 (cover75 i)).ContainsBox (raw75 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked75 : ∀ i : Fin 16, (fun i => (output75 (cover75 i)).ContainsBox (raw75 i)) i :=
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

noncomputable def phaseMass75 : ℝ := singlePhaseMass (204777576/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw75 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass75_eq : phaseMass75 = (25597197/204800000000 : ℝ) := by
  unfold phaseMass75
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw75 output75 cover75 source75
    (gridTreeUnionCheck_sound 32768 raw75 output75 cover75 source75 tree75 checked75)
    _ (by norm_num) _, areaUnits75]
  norm_num

-- Frozen phase 3084, atom 2209, type 0, source (20,49).
def leavesData76 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves76 : Fin 4 → DyadicLeaf := leavesData76.get
def raw76 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 20 49 leaves76 i
def outputData76 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨5120,5248,12544,12672⟩) (.single ⟨5120,5248,12672,12800⟩)) (.node (.single ⟨5248,5376,12544,12672⟩) (.single ⟨5248,5376,12672,12800⟩))) (.node (.node (.single ⟨12544,12672,5120,5248⟩) (.single ⟨12544,12672,5248,5376⟩)) (.node (.single ⟨12672,12800,5120,5248⟩) (.single ⟨12672,12800,5248,5376⟩)))) (.node (.node (.node (.single ⟨19968,20096,27392,27520⟩) (.single ⟨19968,20096,27520,27648⟩)) (.node (.single ⟨20096,20224,27392,27520⟩) (.single ⟨20096,20224,27520,27648⟩))) (.node (.node (.single ⟨27392,27520,19968,20096⟩) (.single ⟨27392,27520,20096,20224⟩)) (.node (.single ⟨27520,27648,19968,20096⟩) (.single ⟨27520,27648,20096,20224⟩)))))
def output76 : Fin 16 → GridBox := outputData76.get
def coverData76 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData76 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover76 (i : Fin 16) : Fin 16 := ⟨coverData76.get i % 16, Nat.mod_lt _ (by decide)⟩
def source76 (i : Fin 16) : Fin 16 := ⟨sourceData76.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree76 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 (.cutY 14336 (.cutX 5120 .empty (.cutY 13312 (.cutX 5632 (.cutY 12800 (.cutX 5376 (.cutY 12544 .empty (.cutX 5248 (.cutY 12672 .full .full) (.cutY 12672 .full .full))) .empty) .empty) .empty) .empty)) .empty) .empty)))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 (.cutY 6144 (.cutX 13312 (.cutY 5120 .empty (.cutX 12800 (.cutY 5632 (.cutX 12544 .empty (.cutY 5376 (.cutX 12672 (.cutY 5248 .full .full) (.cutY 5248 .full .full)) .empty)) .empty) .empty)) .empty) .empty) .empty))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 .empty (.cutY 26624 .empty (.cutX 19456 .empty (.cutY 27648 (.cutX 19968 .empty (.cutY 27136 .empty (.cutX 20224 (.cutY 27392 .empty (.cutX 20096 (.cutY 27520 .full .full) (.cutY 27520 .full .full))) .empty))) .empty)))) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 .empty (.cutY 18432 .empty (.cutX 27648 (.cutY 19456 .empty (.cutX 27136 .empty (.cutY 19968 .empty (.cutX 27392 .empty (.cutY 20224 (.cutX 27520 (.cutY 20096 .full .full) (.cutY 20096 .full .full)) .empty))))) .empty))) .empty) .empty) .empty))))

theorem metadata76 : 0<204777576 ∧ 20<128 ∧ 49<128 ∧ 0<4 ∧
    2209/4160=0 ∧ 2209%4160=2209 ∧ ∀ i, (leaves76 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData76).mp
    (by decide +kernel)

theorem sourceChecked76_0 : ∀ i : Fin 16,
    (fun i => output76 i = raw76 (source76 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked76 : ∀ i : Fin 16, (fun i => output76 i = raw76 (source76 i)) i :=
  forallFin_of_zero_offset (fun i => output76 i = raw76 (source76 i)) sourceChecked76_0

theorem coverChecked76_0 : ∀ i : Fin 16,
    (fun i => (output76 (cover76 i)).ContainsBox (raw76 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked76 : ∀ i : Fin 16, (fun i => (output76 (cover76 i)).ContainsBox (raw76 i)) i :=
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

noncomputable def phaseMass76 : ℝ := singlePhaseMass (204777576/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw76 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass76_eq : phaseMass76 = (25597197/204800000000 : ℝ) := by
  unfold phaseMass76
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw76 output76 cover76 source76
    (gridTreeUnionCheck_sound 32768 raw76 output76 cover76 source76 tree76 checked76)
    _ (by norm_num) _, areaUnits76]
  norm_num

-- Frozen phase 3085, atom 7153, type 1, source (30,53).
def leavesData77 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves77 : Fin 7 → DyadicLeaf := leavesData77.get
def raw77 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 30 53 leaves77 i
def outputData77 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨7680,7808,13568,13696⟩) (.node (.single ⟨7680,7808,13696,13824⟩) (.single ⟨7808,7872,13568,13632⟩))) (.node (.node (.single ⟨7808,7872,13632,13696⟩) (.single ⟨7872,7936,13568,13632⟩)) (.node (.single ⟨7872,7936,13632,13696⟩) (.single ⟨7808,7936,13696,13824⟩)))) (.node (.node (.single ⟨13568,13696,7680,7808⟩) (.node (.single ⟨13568,13632,7808,7872⟩) (.single ⟨13568,13632,7872,7936⟩))) (.node (.node (.single ⟨13632,13696,7808,7872⟩) (.single ⟨13632,13696,7872,7936⟩)) (.node (.single ⟨13696,13824,7680,7808⟩) (.single ⟨13696,13824,7808,7936⟩))))) (.node (.node (.node (.single ⟨18944,19072,24832,24960⟩) (.node (.single ⟨18944,19072,24960,25088⟩) (.single ⟨19072,19136,24832,24896⟩))) (.node (.node (.single ⟨19072,19136,24896,24960⟩) (.single ⟨19136,19200,24832,24896⟩)) (.node (.single ⟨19136,19200,24896,24960⟩) (.single ⟨19072,19200,24960,25088⟩)))) (.node (.node (.single ⟨24832,24960,18944,19072⟩) (.node (.single ⟨24832,24896,19072,19136⟩) (.single ⟨24832,24896,19136,19200⟩))) (.node (.node (.single ⟨24896,24960,19072,19136⟩) (.single ⟨24896,24960,19136,19200⟩)) (.node (.single ⟨24960,25088,18944,19072⟩) (.single ⟨24960,25088,19072,19200⟩))))))
def output77 : Fin 28 → GridBox := outputData77.get
def coverData77 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData77 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover77 (i : Fin 28) : Fin 28 := ⟨coverData77.get i % 28, Nat.mod_lt _ (by decide)⟩
def source77 (i : Fin 28) : Fin 28 := ⟨sourceData77.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree77 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 .empty (.cutY 14336 (.cutX 7168 .empty (.cutY 13312 .empty (.cutX 7680 .empty (.cutY 13824 (.cutX 7936 (.cutY 13568 .empty (.cutX 7808 (.cutY 13696 .full .full) (.cutY 13696 (.cutX 7872 (.cutY 13632 .full .full) (.cutY 13632 .full .full)) .full))) .empty) .empty)))) .empty))))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 (.cutY 6144 .empty (.cutX 13312 .empty (.cutY 7168 .empty (.cutX 13824 (.cutY 7680 .empty (.cutX 13568 .empty (.cutY 7936 (.cutX 13696 (.cutY 7808 .full (.cutX 13632 (.cutY 7872 .full .full) (.cutY 7872 .full .full))) (.cutY 7808 .full .full)) .empty))) .empty)))) .empty))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 .empty (.cutY 26624 (.cutX 19456 (.cutY 25600 (.cutX 18944 .empty (.cutY 25088 (.cutX 19200 (.cutY 24832 .empty (.cutX 19072 (.cutY 24960 .full .full) (.cutY 24960 (.cutX 19136 (.cutY 24896 .full .full) (.cutY 24896 .full .full)) .full))) .empty) .empty)) .empty) .empty) .empty)) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 (.cutY 18432 .empty (.cutX 25600 (.cutY 19456 (.cutX 25088 (.cutY 18944 .empty (.cutX 24832 .empty (.cutY 19200 (.cutX 24960 (.cutY 19072 .full (.cutX 24896 (.cutY 19136 .full .full) (.cutY 19136 .full .full))) (.cutY 19072 .full .full)) .empty))) .empty) .empty) .empty)) .empty) .empty) .empty) .empty))))

theorem metadata77 : 0<202650974 ∧ 30<128 ∧ 53<128 ∧ 1<4 ∧
    7153/4160=1 ∧ 7153%4160=2993 ∧ ∀ i, (leaves77 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData77).mp
    (by decide +kernel)

theorem sourceChecked77_0 : ∀ i : Fin 28,
    (fun i => output77 i = raw77 (source77 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked77 : ∀ i : Fin 28, (fun i => output77 i = raw77 (source77 i)) i :=
  forallFin_of_zero_offset (fun i => output77 i = raw77 (source77 i)) sourceChecked77_0

theorem coverChecked77_0 : ∀ i : Fin 28,
    (fun i => (output77 (cover77 i)).ContainsBox (raw77 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked77 : ∀ i : Fin 28, (fun i => (output77 (cover77 i)).ContainsBox (raw77 i)) i :=
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

noncomputable def phaseMass77 : ℝ := singlePhaseMass (202650974/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw77 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass77_eq : phaseMass77 = (101325487/819200000000 : ℝ) := by
  unfold phaseMass77
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw77 output77 cover77 source77
    (gridTreeUnionCheck_sound 32768 raw77 output77 cover77 source77 tree77 checked77)
    _ (by norm_num) _, areaUnits77]
  norm_num

-- Frozen phase 3086, atom 6088, type 1, source (17,41).
def leavesData78 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩)))) (.node (.node (.node (.single ⟨2,1,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.single ⟨3,7,1⟩))) (.node (.node (.single ⟨4,14,0⟩) (.single ⟨4,14,1⟩)) (.node (.single ⟨4,15,0⟩) (.single ⟨4,15,1⟩)))))
def leaves78 : Fin 16 → DyadicLeaf := leavesData78.get
def raw78 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 17 41 leaves78 i
def outputData78 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨4352,4416,10496,10560⟩) (.single ⟨4352,4416,10560,10624⟩)) (.node (.single ⟨4416,4480,10496,10560⟩) (.single ⟨4416,4480,10560,10624⟩))) (.node (.node (.single ⟨4352,4480,10624,10752⟩) (.single ⟨4480,4544,10496,10560⟩)) (.node (.single ⟨4480,4544,10560,10624⟩) (.single ⟨4544,4576,10496,10528⟩)))) (.node (.node (.node (.single ⟨4544,4576,10528,10560⟩) (.single ⟨4576,4592,10496,10512⟩)) (.node (.single ⟨4576,4592,10512,10528⟩) (.single ⟨4592,4608,10496,10512⟩))) (.node (.node (.single ⟨4592,4608,10512,10528⟩) (.single ⟨4576,4608,10528,10560⟩)) (.node (.single ⟨4544,4608,10560,10624⟩) (.single ⟨4480,4608,10624,10752⟩))))) (.node (.node (.node (.node (.single ⟨10496,10560,4352,4416⟩) (.single ⟨10496,10560,4416,4480⟩)) (.node (.single ⟨10560,10624,4352,4416⟩) (.single ⟨10560,10624,4416,4480⟩))) (.node (.node (.single ⟨10496,10560,4480,4544⟩) (.single ⟨10496,10528,4544,4576⟩)) (.node (.single ⟨10496,10512,4576,4592⟩) (.single ⟨10496,10512,4592,4608⟩)))) (.node (.node (.node (.single ⟨10512,10528,4576,4592⟩) (.single ⟨10512,10528,4592,4608⟩)) (.node (.single ⟨10528,10560,4544,4576⟩) (.single ⟨10528,10560,4576,4608⟩))) (.node (.node (.single ⟨10560,10624,4480,4544⟩) (.single ⟨10560,10624,4544,4608⟩)) (.node (.single ⟨10624,10752,4352,4480⟩) (.single ⟨10624,10752,4480,4608⟩)))))) (.node (.node (.node (.node (.node (.single ⟨22016,22144,28160,28288⟩) (.single ⟨22016,22144,28288,28416⟩)) (.node (.single ⟨22144,22208,28160,28224⟩) (.single ⟨22144,22208,28224,28288⟩))) (.node (.node (.single ⟨22208,22240,28160,28192⟩) (.single ⟨22208,22240,28192,28224⟩)) (.node (.single ⟨22240,22256,28160,28176⟩) (.single ⟨22240,22256,28176,28192⟩)))) (.node (.node (.node (.single ⟨22256,22272,28160,28176⟩) (.single ⟨22256,22272,28176,28192⟩)) (.node (.single ⟨22240,22272,28192,28224⟩) (.single ⟨22208,22272,28224,28288⟩))) (.node (.node (.single ⟨22144,22208,28288,28352⟩) (.single ⟨22144,22208,28352,28416⟩)) (.node (.single ⟨22208,22272,28288,28352⟩) (.single ⟨22208,22272,28352,28416⟩))))) (.node (.node (.node (.node (.single ⟨28160,28288,22016,22144⟩) (.single ⟨28160,28224,22144,22208⟩)) (.node (.single ⟨28160,28192,22208,22240⟩) (.single ⟨28160,28176,22240,22256⟩))) (.node (.node (.single ⟨28160,28176,22256,22272⟩) (.single ⟨28176,28192,22240,22256⟩)) (.node (.single ⟨28176,28192,22256,22272⟩) (.single ⟨28192,28224,22208,22240⟩)))) (.node (.node (.node (.single ⟨28192,28224,22240,22272⟩) (.single ⟨28224,28288,22144,22208⟩)) (.node (.single ⟨28224,28288,22208,22272⟩) (.single ⟨28288,28416,22016,22144⟩))) (.node (.node (.single ⟨28288,28352,22144,22208⟩) (.single ⟨28288,28352,22208,22272⟩)) (.node (.single ⟨28352,28416,22144,22208⟩) (.single ⟨28352,28416,22208,22272⟩)))))))
def output78 : Fin 64 → GridBox := outputData78.get
def coverData78 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 30)) (.node (.single 59) (.single 33))) (.node (.node (.single 15) (.single 31)) (.node (.single 48) (.single 32)))) (.node (.node (.node (.single 5) (.single 20)) (.node (.single 58) (.single 43))) (.node (.node (.single 6) (.single 28)) (.node (.single 57) (.single 35))))) (.node (.node (.node (.node (.single 14) (.single 29)) (.node (.single 49) (.single 34))) (.node (.node (.single 0) (.single 16)) (.node (.single 63) (.single 47)))) (.node (.node (.node (.single 1) (.single 18)) (.node (.single 62) (.single 45))) (.node (.node (.single 2) (.single 17)) (.node (.single 61) (.single 46)))))) (.node (.node (.node (.node (.node (.single 3) (.single 19)) (.node (.single 60) (.single 44))) (.node (.node (.single 7) (.single 21)) (.node (.single 56) (.single 42)))) (.node (.node (.node (.single 8) (.single 26)) (.node (.single 55) (.single 37))) (.node (.node (.single 13) (.single 27)) (.node (.single 50) (.single 36))))) (.node (.node (.node (.node (.single 9) (.single 22)) (.node (.single 54) (.single 41))) (.node (.node (.single 10) (.single 24)) (.node (.single 53) (.single 39)))) (.node (.node (.node (.single 11) (.single 23)) (.node (.single 52) (.single 40))) (.node (.node (.single 12) (.single 25)) (.node (.single 51) (.single 38)))))))
def sourceData78 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 20) (.single 24)) (.node (.single 28) (.single 32))) (.node (.node (.single 0) (.single 8)) (.node (.single 12) (.single 36)))) (.node (.node (.node (.single 40) (.single 48)) (.node (.single 52) (.single 56))) (.node (.node (.single 60) (.single 44)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.node (.single 21) (.single 29)) (.node (.single 25) (.single 33))) (.node (.node (.single 9) (.single 37)) (.node (.single 49) (.single 57)))) (.node (.node (.node (.single 53) (.single 61)) (.node (.single 41) (.single 45))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.node (.single 7) (.single 3)) (.node (.single 19) (.single 15))) (.node (.node (.single 47) (.single 43)) (.node (.single 63) (.single 55)))) (.node (.node (.node (.single 59) (.single 51)) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23))))) (.node (.node (.node (.node (.single 6) (.single 18)) (.node (.single 46) (.single 62))) (.node (.node (.single 58) (.single 54)) (.node (.single 50) (.single 42)))) (.node (.node (.node (.single 38) (.single 14)) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover78 (i : Fin 64) : Fin 64 := ⟨coverData78.get i % 64, Nat.mod_lt _ (by decide)⟩
def source78 (i : Fin 64) : Fin 64 := ⟨sourceData78.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree78 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 (.cutY 10240 .empty (.cutX 5120 (.cutY 11264 (.cutX 4608 (.cutY 10752 (.cutX 4352 .empty (.cutY 10496 .empty (.cutX 4480 (.cutY 10624 (.cutX 4416 (.cutY 10560 .full .full) (.cutY 10560 .full .full)) .full) (.cutY 10624 (.cutX 4544 (.cutY 10560 .full .full) (.cutY 10560 (.cutX 4576 (.cutY 10528 .full .full) (.cutY 10528 (.cutX 4592 (.cutY 10512 .full .full) (.cutY 10512 .full .full)) .full)) .full)) .full)))) .empty) .empty) .empty) .empty)) .empty) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 .empty (.cutY 6144 (.cutX 11264 (.cutY 5120 (.cutX 10752 (.cutY 4608 (.cutX 10496 .empty (.cutY 4352 .empty (.cutX 10624 (.cutY 4480 (.cutX 10560 (.cutY 4416 .full .full) (.cutY 4416 .full .full)) (.cutX 10560 (.cutY 4544 .full (.cutX 10528 (.cutY 4576 .full (.cutX 10512 (.cutY 4592 .full .full) (.cutY 4592 .full .full))) (.cutY 4576 .full .full))) (.cutY 4544 .full .full))) (.cutY 4480 .full .full)))) .empty) .empty) .empty) .empty) .empty))) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 (.cutY 26624 .empty (.cutX 21504 .empty (.cutY 27648 .empty (.cutX 22016 .empty (.cutY 28160 .empty (.cutX 22272 (.cutY 28416 (.cutX 22144 (.cutY 28288 .full .full) (.cutY 28288 (.cutX 22208 (.cutY 28224 .full .full) (.cutY 28224 (.cutX 22240 (.cutY 28192 .full .full) (.cutY 28192 (.cutX 22256 (.cutY 28176 .full .full) (.cutY 28176 .full .full)) .full)) .full)) (.cutX 22208 (.cutY 28352 .full .full) (.cutY 28352 .full .full)))) .empty) .empty)))))) .empty) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 .empty (.cutY 22528 (.cutX 27648 .empty (.cutY 21504 .empty (.cutX 28160 .empty (.cutY 22016 .empty (.cutX 28416 (.cutY 22272 (.cutX 28288 (.cutY 22144 .full (.cutX 28224 (.cutY 22208 .full (.cutX 28192 (.cutY 22240 .full (.cutX 28176 (.cutY 22256 .full .full) (.cutY 22256 .full .full))) (.cutY 22240 .full .full))) (.cutY 22208 .full .full))) (.cutY 22144 .full (.cutX 28352 (.cutY 22208 .full .full) (.cutY 22208 .full .full)))) .empty) .empty))))) .empty))) .empty) .empty))))

theorem metadata78 : 0<22259151 ∧ 17<128 ∧ 41<128 ∧ 1<4 ∧
    6088/4160=1 ∧ 6088%4160=1928 ∧ ∀ i, (leaves78 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData78).mp
    (by decide +kernel)

theorem sourceChecked78_0 : ∀ i : Fin 64,
    (fun i => output78 i = raw78 (source78 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked78 : ∀ i : Fin 64, (fun i => output78 i = raw78 (source78 i)) i :=
  forallFin_of_zero_offset (fun i => output78 i = raw78 (source78 i)) sourceChecked78_0

theorem coverChecked78_0 : ∀ i : Fin 64,
    (fun i => (output78 (cover78 i)).ContainsBox (raw78 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked78 : ∀ i : Fin 64, (fun i => (output78 (cover78 i)).ContainsBox (raw78 i)) i :=
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

noncomputable def phaseMass78 : ℝ := singlePhaseMass (22259151/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw78 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass78_eq : phaseMass78 = (22259151/1638400000000 : ℝ) := by
  unfold phaseMass78
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw78 output78 cover78 source78
    (gridTreeUnionCheck_sound 32768 raw78 output78 cover78 source78 tree78 checked78)
    _ (by norm_num) _, areaUnits78]
  norm_num

-- Frozen phase 3087, atom 4695, type 1, source (4,39).
def leavesData79 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves79 : Fin 4 → DyadicLeaf := leavesData79.get
def raw79 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 4 39 leaves79 i
def outputData79 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨1024,1152,9984,10112⟩) (.single ⟨1024,1152,10112,10240⟩)) (.node (.single ⟨1152,1280,9984,10112⟩) (.single ⟨1152,1280,10112,10240⟩))) (.node (.node (.single ⟨9984,10112,1024,1152⟩) (.single ⟨9984,10112,1152,1280⟩)) (.node (.single ⟨10112,10240,1024,1152⟩) (.single ⟨10112,10240,1152,1280⟩)))) (.node (.node (.node (.single ⟨22528,22656,31488,31616⟩) (.single ⟨22528,22656,31616,31744⟩)) (.node (.single ⟨22656,22784,31488,31616⟩) (.single ⟨22656,22784,31616,31744⟩))) (.node (.node (.single ⟨31488,31616,22528,22656⟩) (.single ⟨31488,31616,22656,22784⟩)) (.node (.single ⟨31616,31744,22528,22656⟩) (.single ⟨31616,31744,22656,22784⟩)))))
def output79 : Fin 16 → GridBox := outputData79.get
def coverData79 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData79 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover79 (i : Fin 16) : Fin 16 := ⟨coverData79.get i % 16, Nat.mod_lt _ (by decide)⟩
def source79 (i : Fin 16) : Fin 16 := ⟨sourceData79.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree79 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 (.cutY 10240 (.cutX 1024 .empty (.cutY 9216 .empty (.cutX 1536 (.cutY 9728 .empty (.cutX 1280 (.cutY 9984 .empty (.cutX 1152 (.cutY 10112 .full .full) (.cutY 10112 .full .full))) .empty)) .empty))) .empty) .empty) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 (.cutX 9216 .empty (.cutY 1024 .empty (.cutX 9728 .empty (.cutY 1536 (.cutX 9984 .empty (.cutY 1280 (.cutX 10112 (.cutY 1152 .full .full) (.cutY 1152 .full .full)) .empty)) .empty)))) .empty) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 .empty (.cutX 23552 (.cutY 31744 (.cutX 23040 (.cutY 31232 .empty (.cutX 22784 (.cutY 31488 .empty (.cutX 22656 (.cutY 31616 .full .full) (.cutY 31616 .full .full))) .empty)) .empty) .empty) .empty)))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 .empty (.cutY 22528 .empty (.cutX 31744 (.cutY 23552 (.cutX 31232 .empty (.cutY 23040 (.cutX 31488 .empty (.cutY 22784 (.cutX 31616 (.cutY 22656 .full .full) (.cutY 22656 .full .full)) .empty)) .empty)) .empty) .empty))))) .empty))))

theorem metadata79 : 0<475523442 ∧ 4<128 ∧ 39<128 ∧ 1<4 ∧
    4695/4160=1 ∧ 4695%4160=535 ∧ ∀ i, (leaves79 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData79).mp
    (by decide +kernel)

theorem sourceChecked79_0 : ∀ i : Fin 16,
    (fun i => output79 i = raw79 (source79 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked79 : ∀ i : Fin 16, (fun i => output79 i = raw79 (source79 i)) i :=
  forallFin_of_zero_offset (fun i => output79 i = raw79 (source79 i)) sourceChecked79_0

theorem coverChecked79_0 : ∀ i : Fin 16,
    (fun i => (output79 (cover79 i)).ContainsBox (raw79 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked79 : ∀ i : Fin 16, (fun i => (output79 (cover79 i)).ContainsBox (raw79 i)) i :=
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

noncomputable def phaseMass79 : ℝ := singlePhaseMass (475523442/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw79 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass79_eq : phaseMass79 = (237761721/819200000000 : ℝ) := by
  unfold phaseMass79
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw79 output79 cover79 source79
    (gridTreeUnionCheck_sound 32768 raw79 output79 cover79 source79 tree79 checked79)
    _ (by norm_num) _, areaUnits79]
  norm_num

-- Frozen phase 3088, atom 293, type 0, source (2,41).
def leavesData80 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves80 : Fin 1 → DyadicLeaf := leavesData80.get
def raw80 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 2 41 leaves80 i
def outputData80 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨512,768,10496,10752⟩) (.single ⟨10496,10752,512,768⟩)) (.node (.single ⟨22016,22272,32000,32256⟩) (.single ⟨32000,32256,22016,22272⟩)))
def output80 : Fin 4 → GridBox := outputData80.get
def coverData80 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData80 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover80 (i : Fin 4) : Fin 4 := ⟨coverData80.get i % 4, Nat.mod_lt _ (by decide)⟩
def source80 (i : Fin 4) : Fin 4 := ⟨sourceData80.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree80 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 (.cutY 10240 .empty (.cutX 1024 (.cutY 11264 (.cutX 512 .empty (.cutY 10752 (.cutX 768 (.cutY 10496 .empty .full) .empty) .empty)) .empty) .empty)) .empty) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 .empty (.cutY 2048 (.cutX 11264 (.cutY 1024 (.cutX 10752 (.cutY 512 .empty (.cutX 10496 .empty (.cutY 768 .full .empty))) .empty) .empty) .empty) .empty)) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 (.cutY 30720 .empty (.cutX 21504 .empty (.cutY 31744 .empty (.cutX 22016 .empty (.cutY 32256 (.cutX 22272 (.cutY 32000 .empty .full) .empty) .empty))))) .empty)))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 .empty (.cutY 22528 (.cutX 31744 .empty (.cutY 21504 .empty (.cutX 32256 (.cutY 22016 .empty (.cutX 32000 .empty (.cutY 22272 .full .empty))) .empty))) .empty)))) .empty))))

theorem metadata80 : 0<374268468 ∧ 2<128 ∧ 41<128 ∧ 0<4 ∧
    293/4160=0 ∧ 293%4160=293 ∧ ∀ i, (leaves80 i).Valid 8 := by
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

noncomputable def phaseMass80 : ℝ := singlePhaseMass (374268468/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw80 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass80_eq : phaseMass80 = (93567117/409600000000 : ℝ) := by
  unfold phaseMass80
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw80 output80 cover80 source80
    (gridTreeUnionCheck_sound 32768 raw80 output80 cover80 source80 tree80 checked80)
    _ (by norm_num) _, areaUnits80]
  norm_num

-- Frozen phase 3089, atom 5379, type 1, source (10,39).
def leavesData81 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves81 : Fin 7 → DyadicLeaf := leavesData81.get
def raw81 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 10 39 leaves81 i
def outputData81 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨2560,2688,9984,10112⟩) (.node (.single ⟨2560,2688,10112,10240⟩) (.single ⟨2688,2752,9984,10048⟩))) (.node (.node (.single ⟨2688,2752,10048,10112⟩) (.single ⟨2752,2816,9984,10048⟩)) (.node (.single ⟨2752,2816,10048,10112⟩) (.single ⟨2688,2816,10112,10240⟩)))) (.node (.node (.single ⟨9984,10112,2560,2688⟩) (.node (.single ⟨9984,10048,2688,2752⟩) (.single ⟨9984,10048,2752,2816⟩))) (.node (.node (.single ⟨10048,10112,2688,2752⟩) (.single ⟨10048,10112,2752,2816⟩)) (.node (.single ⟨10112,10240,2560,2688⟩) (.single ⟨10112,10240,2688,2816⟩))))) (.node (.node (.node (.single ⟨22528,22656,29952,30080⟩) (.node (.single ⟨22528,22656,30080,30208⟩) (.single ⟨22656,22720,29952,30016⟩))) (.node (.node (.single ⟨22656,22720,30016,30080⟩) (.single ⟨22720,22784,29952,30016⟩)) (.node (.single ⟨22720,22784,30016,30080⟩) (.single ⟨22656,22784,30080,30208⟩)))) (.node (.node (.single ⟨29952,30080,22528,22656⟩) (.node (.single ⟨29952,30016,22656,22720⟩) (.single ⟨29952,30016,22720,22784⟩))) (.node (.node (.single ⟨30016,30080,22656,22720⟩) (.single ⟨30016,30080,22720,22784⟩)) (.node (.single ⟨30080,30208,22528,22656⟩) (.single ⟨30080,30208,22656,22784⟩))))))
def output81 : Fin 28 → GridBox := outputData81.get
def coverData81 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData81 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover81 (i : Fin 28) : Fin 28 := ⟨coverData81.get i % 28, Nat.mod_lt _ (by decide)⟩
def source81 (i : Fin 28) : Fin 28 := ⟨sourceData81.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree81 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 .empty (.cutY 10240 (.cutX 3072 (.cutY 9216 .empty (.cutX 2560 .empty (.cutY 9728 .empty (.cutX 2816 (.cutY 9984 .empty (.cutX 2688 (.cutY 10112 .full .full) (.cutY 10112 (.cutX 2752 (.cutY 10048 .full .full) (.cutY 10048 .full .full)) .full))) .empty)))) .empty) .empty)) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 .empty (.cutX 9216 .empty (.cutY 3072 (.cutX 9728 .empty (.cutY 2560 .empty (.cutX 9984 .empty (.cutY 2816 (.cutX 10112 (.cutY 2688 .full (.cutX 10048 (.cutY 2752 .full .full) (.cutY 2752 .full .full))) (.cutY 2688 .full .full)) .empty)))) .empty))) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 (.cutX 23552 (.cutY 29696 .empty (.cutX 23040 (.cutY 30208 (.cutX 22784 (.cutY 29952 .empty (.cutX 22656 (.cutY 30080 .full .full) (.cutY 30080 (.cutX 22720 (.cutY 30016 .full .full) (.cutY 30016 .full .full)) .full))) .empty) .empty) .empty)) .empty) .empty))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 (.cutY 22528 .empty (.cutX 29696 .empty (.cutY 23552 (.cutX 30208 (.cutY 23040 (.cutX 29952 .empty (.cutY 22784 (.cutX 30080 (.cutY 22656 .full (.cutX 30016 (.cutY 22720 .full .full) (.cutY 22720 .full .full))) (.cutY 22656 .full .full)) .empty)) .empty) .empty) .empty))) .empty))) .empty))))

theorem metadata81 : 0<190129790 ∧ 10<128 ∧ 39<128 ∧ 1<4 ∧
    5379/4160=1 ∧ 5379%4160=1219 ∧ ∀ i, (leaves81 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData81).mp
    (by decide +kernel)

theorem sourceChecked81_0 : ∀ i : Fin 28,
    (fun i => output81 i = raw81 (source81 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked81 : ∀ i : Fin 28, (fun i => output81 i = raw81 (source81 i)) i :=
  forallFin_of_zero_offset (fun i => output81 i = raw81 (source81 i)) sourceChecked81_0

theorem coverChecked81_0 : ∀ i : Fin 28,
    (fun i => (output81 (cover81 i)).ContainsBox (raw81 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked81 : ∀ i : Fin 28, (fun i => (output81 (cover81 i)).ContainsBox (raw81 i)) i :=
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

noncomputable def phaseMass81 : ℝ := singlePhaseMass (190129790/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw81 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass81_eq : phaseMass81 = (19012979/163840000000 : ℝ) := by
  unfold phaseMass81
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw81 output81 cover81 source81
    (gridTreeUnionCheck_sound 32768 raw81 output81 cover81 source81 tree81 checked81)
    _ (by norm_num) _, areaUnits81]
  norm_num

-- Frozen phase 3090, atom 4325, type 1, source (1,38).
def leavesData82 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves82 : Fin 1 → DyadicLeaf := leavesData82.get
def raw82 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 1 38 leaves82 i
def outputData82 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨256,512,9728,9984⟩) (.single ⟨9728,9984,256,512⟩)) (.node (.single ⟨22784,23040,32256,32512⟩) (.single ⟨32256,32512,22784,23040⟩)))
def output82 : Fin 4 → GridBox := outputData82.get
def coverData82 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData82 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover82 (i : Fin 4) : Fin 4 := ⟨coverData82.get i % 4, Nat.mod_lt _ (by decide)⟩
def source82 (i : Fin 4) : Fin 4 := ⟨sourceData82.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree82 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 (.cutY 10240 (.cutX 1024 (.cutY 9216 .empty (.cutX 512 (.cutY 9728 .empty (.cutX 256 .empty (.cutY 9984 .full .empty))) .empty)) .empty) .empty) .empty) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 (.cutX 9216 .empty (.cutY 1024 (.cutX 9728 .empty (.cutY 512 (.cutX 9984 (.cutY 256 .empty .full) .empty) .empty)) .empty)) .empty) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 .empty (.cutX 23552 (.cutY 31744 .empty (.cutX 23040 (.cutY 32256 .empty (.cutX 22784 .empty (.cutY 32512 .full .empty))) .empty)) .empty)))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 .empty (.cutY 22528 .empty (.cutX 31744 .empty (.cutY 23552 (.cutX 32256 .empty (.cutY 23040 (.cutX 32512 (.cutY 22784 .empty .full) .empty) .empty)) .empty)))))) .empty))))

theorem metadata82 : 0<475523442 ∧ 1<128 ∧ 38<128 ∧ 1<4 ∧
    4325/4160=1 ∧ 4325%4160=165 ∧ ∀ i, (leaves82 i).Valid 8 := by
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

noncomputable def phaseMass82 : ℝ := singlePhaseMass (475523442/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw82 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass82_eq : phaseMass82 = (237761721/819200000000 : ℝ) := by
  unfold phaseMass82
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw82 output82 cover82 source82
    (gridTreeUnionCheck_sound 32768 raw82 output82 cover82 source82 tree82 checked82)
    _ (by norm_num) _, areaUnits82]
  norm_num

-- Frozen phase 3091, atom 6363, type 1, source (20,43).
def leavesData83 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves83 : Fin 10 → DyadicLeaf := leavesData83.get
def raw83 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 20 43 leaves83 i
def outputData83 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨5120,5248,11008,11136⟩) (.single ⟨5120,5248,11136,11264⟩)) (.node (.single ⟨5248,5312,11008,11072⟩) (.node (.single ⟨5248,5312,11072,11136⟩) (.single ⟨5312,5344,11008,11040⟩)))) (.node (.node (.single ⟨5312,5344,11040,11072⟩) (.single ⟨5344,5376,11008,11040⟩)) (.node (.single ⟨5344,5376,11040,11072⟩) (.node (.single ⟨5312,5376,11072,11136⟩) (.single ⟨5248,5376,11136,11264⟩))))) (.node (.node (.node (.single ⟨11008,11136,5120,5248⟩) (.single ⟨11008,11072,5248,5312⟩)) (.node (.single ⟨11008,11040,5312,5344⟩) (.node (.single ⟨11008,11040,5344,5376⟩) (.single ⟨11040,11072,5312,5344⟩)))) (.node (.node (.single ⟨11040,11072,5344,5376⟩) (.single ⟨11072,11136,5248,5312⟩)) (.node (.single ⟨11072,11136,5312,5376⟩) (.node (.single ⟨11136,11264,5120,5248⟩) (.single ⟨11136,11264,5248,5376⟩)))))) (.node (.node (.node (.node (.single ⟨21504,21632,27392,27520⟩) (.single ⟨21504,21632,27520,27648⟩)) (.node (.single ⟨21632,21696,27392,27456⟩) (.node (.single ⟨21632,21696,27456,27520⟩) (.single ⟨21696,21728,27392,27424⟩)))) (.node (.node (.single ⟨21696,21728,27424,27456⟩) (.single ⟨21728,21760,27392,27424⟩)) (.node (.single ⟨21728,21760,27424,27456⟩) (.node (.single ⟨21696,21760,27456,27520⟩) (.single ⟨21632,21760,27520,27648⟩))))) (.node (.node (.node (.single ⟨27392,27520,21504,21632⟩) (.single ⟨27392,27456,21632,21696⟩)) (.node (.single ⟨27392,27424,21696,21728⟩) (.node (.single ⟨27392,27424,21728,21760⟩) (.single ⟨27424,27456,21696,21728⟩)))) (.node (.node (.single ⟨27424,27456,21728,21760⟩) (.single ⟨27456,27520,21632,21696⟩)) (.node (.single ⟨27456,27520,21696,21760⟩) (.node (.single ⟨27520,27648,21504,21632⟩) (.single ⟨27520,27648,21632,21760⟩)))))))
def output83 : Fin 40 → GridBox := outputData83.get
def coverData83 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 10)) (.node (.single 39) (.node (.single 29) (.single 1)))) (.node (.node (.single 18) (.single 38)) (.node (.single 21) (.node (.single 9) (.single 19))))) (.node (.node (.node (.single 30) (.single 20)) (.node (.single 2) (.node (.single 11) (.single 37)))) (.node (.node (.single 28) (.single 3)) (.node (.single 16) (.node (.single 36) (.single 23)))))) (.node (.node (.node (.node (.single 8) (.single 17)) (.node (.single 31) (.node (.single 22) (.single 4)))) (.node (.node (.single 12) (.single 35)) (.node (.single 27) (.node (.single 5) (.single 14))))) (.node (.node (.node (.single 34) (.single 25)) (.node (.single 6) (.node (.single 13) (.single 33)))) (.node (.node (.single 26) (.single 7)) (.node (.single 15) (.node (.single 32) (.single 24)))))))
def sourceData83 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9)))))) (.node (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover83 (i : Fin 40) : Fin 40 := ⟨coverData83.get i % 40, Nat.mod_lt _ (by decide)⟩
def source83 (i : Fin 40) : Fin 40 := ⟨sourceData83.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree83 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 (.cutY 10240 .empty (.cutX 5120 .empty (.cutY 11264 (.cutX 5632 (.cutY 10752 .empty (.cutX 5376 (.cutY 11008 .empty (.cutX 5248 (.cutY 11136 .full .full) (.cutY 11136 (.cutX 5312 (.cutY 11072 .full .full) (.cutY 11072 (.cutX 5344 (.cutY 11040 .full .full) (.cutY 11040 .full .full)) .full)) .full))) .empty)) .empty) .empty))) .empty) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 .empty (.cutY 6144 (.cutX 11264 (.cutY 5120 .empty (.cutX 10752 .empty (.cutY 5632 (.cutX 11008 .empty (.cutY 5376 (.cutX 11136 (.cutY 5248 .full (.cutX 11072 (.cutY 5312 .full (.cutX 11040 (.cutY 5344 .full .full) (.cutY 5344 .full .full))) (.cutY 5312 .full .full))) (.cutY 5248 .full .full)) .empty)) .empty))) .empty) .empty))) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 (.cutY 26624 .empty (.cutX 21504 .empty (.cutY 27648 (.cutX 22016 (.cutY 27136 .empty (.cutX 21760 (.cutY 27392 .empty (.cutX 21632 (.cutY 27520 .full .full) (.cutY 27520 (.cutX 21696 (.cutY 27456 .full .full) (.cutY 27456 (.cutX 21728 (.cutY 27424 .full .full) (.cutY 27424 .full .full)) .full)) .full))) .empty)) .empty) .empty))) .empty) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 .empty (.cutY 22528 (.cutX 27648 (.cutY 21504 .empty (.cutX 27136 .empty (.cutY 22016 (.cutX 27392 .empty (.cutY 21760 (.cutX 27520 (.cutY 21632 .full (.cutX 27456 (.cutY 21696 .full (.cutX 27424 (.cutY 21728 .full .full) (.cutY 21728 .full .full))) (.cutY 21696 .full .full))) (.cutY 21632 .full .full)) .empty)) .empty))) .empty) .empty))) .empty) .empty))))

theorem metadata83 : 0<22259151 ∧ 20<128 ∧ 43<128 ∧ 1<4 ∧
    6363/4160=1 ∧ 6363%4160=2203 ∧ ∀ i, (leaves83 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData83).mp
    (by decide +kernel)

theorem sourceChecked83_0 : ∀ i : Fin 40,
    (fun i => output83 i = raw83 (source83 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked83 : ∀ i : Fin 40, (fun i => output83 i = raw83 (source83 i)) i :=
  forallFin_of_zero_offset (fun i => output83 i = raw83 (source83 i)) sourceChecked83_0

theorem coverChecked83_0 : ∀ i : Fin 40,
    (fun i => (output83 (cover83 i)).ContainsBox (raw83 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked83 : ∀ i : Fin 40, (fun i => (output83 (cover83 i)).ContainsBox (raw83 i)) i :=
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

noncomputable def phaseMass83 : ℝ := singlePhaseMass (22259151/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw83 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass83_eq : phaseMass83 = (22259151/1638400000000 : ℝ) := by
  unfold phaseMass83
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw83 output83 cover83 source83
    (gridTreeUnionCheck_sound 32768 raw83 output83 cover83 source83 tree83 checked83)
    _ (by norm_num) _, areaUnits83]
  norm_num

-- Frozen phase 3092, atom 5159, type 1, source (8,39).
def leavesData84 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩)) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))))
def leaves84 : Fin 7 → DyadicLeaf := leavesData84.get
def raw84 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 8 39 leaves84 i
def outputData84 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨2048,2112,9984,10048⟩) (.node (.single ⟨2048,2112,10048,10112⟩) (.single ⟨2112,2176,9984,10048⟩))) (.node (.node (.single ⟨2112,2176,10048,10112⟩) (.single ⟨2048,2176,10112,10240⟩)) (.node (.single ⟨2176,2304,9984,10112⟩) (.single ⟨2176,2304,10112,10240⟩)))) (.node (.node (.single ⟨9984,10048,2048,2112⟩) (.node (.single ⟨9984,10048,2112,2176⟩) (.single ⟨10048,10112,2048,2112⟩))) (.node (.node (.single ⟨10048,10112,2112,2176⟩) (.single ⟨9984,10112,2176,2304⟩)) (.node (.single ⟨10112,10240,2048,2176⟩) (.single ⟨10112,10240,2176,2304⟩))))) (.node (.node (.node (.single ⟨22528,22656,30464,30592⟩) (.node (.single ⟨22528,22656,30592,30720⟩) (.single ⟨22656,22784,30464,30592⟩))) (.node (.node (.single ⟨22656,22720,30592,30656⟩) (.single ⟨22656,22720,30656,30720⟩)) (.node (.single ⟨22720,22784,30592,30656⟩) (.single ⟨22720,22784,30656,30720⟩)))) (.node (.node (.single ⟨30464,30592,22528,22656⟩) (.node (.single ⟨30464,30592,22656,22784⟩) (.single ⟨30592,30720,22528,22656⟩))) (.node (.node (.single ⟨30592,30656,22656,22720⟩) (.single ⟨30592,30656,22720,22784⟩)) (.node (.single ⟨30656,30720,22656,22720⟩) (.single ⟨30656,30720,22720,22784⟩))))))
def output84 : Fin 28 → GridBox := outputData84.get
def coverData84 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 4) (.node (.single 12) (.single 23))) (.node (.node (.single 15) (.single 5)) (.node (.single 11) (.single 22)))) (.node (.node (.single 16) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 0) (.single 7))))) (.node (.node (.node (.single 27) (.node (.single 20) (.single 1))) (.node (.node (.single 9) (.single 26)) (.node (.single 18) (.single 2)))) (.node (.node (.single 8) (.node (.single 25) (.single 19))) (.node (.node (.single 3) (.single 10)) (.node (.single 24) (.single 17))))))
def sourceData84 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 12) (.node (.single 16) (.single 20))) (.node (.node (.single 24) (.single 0)) (.node (.single 4) (.single 8)))) (.node (.node (.single 13) (.node (.single 21) (.single 17))) (.node (.node (.single 25) (.single 5)) (.node (.single 1) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 3) (.single 7))) (.node (.node (.single 27) (.single 19)) (.node (.single 23) (.single 15)))) (.node (.node (.single 10) (.node (.single 6) (.single 2))) (.node (.node (.single 26) (.single 22)) (.node (.single 18) (.single 14))))))
def cover84 (i : Fin 28) : Fin 28 := ⟨coverData84.get i % 28, Nat.mod_lt _ (by decide)⟩
def source84 (i : Fin 28) : Fin 28 := ⟨sourceData84.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree84 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 .empty (.cutY 10240 (.cutX 3072 (.cutY 9216 .empty (.cutX 2560 (.cutY 9728 .empty (.cutX 2304 (.cutY 9984 .empty (.cutX 2176 (.cutY 10112 (.cutX 2112 (.cutY 10048 .full .full) (.cutY 10048 .full .full)) .full) (.cutY 10112 .full .full))) .empty)) .empty)) .empty) .empty)) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 .empty (.cutX 9216 .empty (.cutY 3072 (.cutX 9728 .empty (.cutY 2560 (.cutX 9984 .empty (.cutY 2304 (.cutX 10112 (.cutY 2176 (.cutX 10048 (.cutY 2112 .full .full) (.cutY 2112 .full .full)) .full) (.cutY 2176 .full .full)) .empty)) .empty)) .empty))) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 (.cutX 23552 (.cutY 29696 .empty (.cutX 23040 (.cutY 30208 .empty (.cutX 22784 (.cutY 30464 .empty (.cutX 22656 (.cutY 30592 .full .full) (.cutY 30592 .full (.cutX 22720 (.cutY 30656 .full .full) (.cutY 30656 .full .full))))) .empty)) .empty)) .empty) .empty))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 (.cutY 22528 .empty (.cutX 29696 .empty (.cutY 23552 (.cutX 30208 .empty (.cutY 23040 (.cutX 30464 .empty (.cutY 22784 (.cutX 30592 (.cutY 22656 .full .full) (.cutY 22656 .full (.cutX 30656 (.cutY 22720 .full .full) (.cutY 22720 .full .full)))) .empty)) .empty)) .empty))) .empty))) .empty))))

theorem metadata84 : 0<190129790 ∧ 8<128 ∧ 39<128 ∧ 1<4 ∧
    5159/4160=1 ∧ 5159%4160=999 ∧ ∀ i, (leaves84 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData84).mp
    (by decide +kernel)

theorem sourceChecked84_0 : ∀ i : Fin 28,
    (fun i => output84 i = raw84 (source84 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked84 : ∀ i : Fin 28, (fun i => output84 i = raw84 (source84 i)) i :=
  forallFin_of_zero_offset (fun i => output84 i = raw84 (source84 i)) sourceChecked84_0

theorem coverChecked84_0 : ∀ i : Fin 28,
    (fun i => (output84 (cover84 i)).ContainsBox (raw84 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked84 : ∀ i : Fin 28, (fun i => (output84 (cover84 i)).ContainsBox (raw84 i)) i :=
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

noncomputable def phaseMass84 : ℝ := singlePhaseMass (190129790/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw84 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass84_eq : phaseMass84 = (19012979/163840000000 : ℝ) := by
  unfold phaseMass84
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw84 output84 cover84 source84
    (gridTreeUnionCheck_sound 32768 raw84 output84 cover84 source84 tree84 checked84)
    _ (by norm_num) _, areaUnits84]
  norm_num

-- Frozen phase 3093, atom 7691, type 1, source (39,60).
def leavesData85 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves85 : Fin 10 → DyadicLeaf := leavesData85.get
def raw85 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 39 60 leaves85 i
def outputData85 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨9984,10112,15360,15488⟩) (.single ⟨9984,10112,15488,15616⟩)) (.node (.single ⟨10112,10176,15360,15424⟩) (.node (.single ⟨10112,10176,15424,15488⟩) (.single ⟨10176,10208,15360,15392⟩)))) (.node (.node (.single ⟨10176,10208,15392,15424⟩) (.single ⟨10208,10240,15360,15392⟩)) (.node (.single ⟨10208,10240,15392,15424⟩) (.node (.single ⟨10176,10240,15424,15488⟩) (.single ⟨10112,10240,15488,15616⟩))))) (.node (.node (.node (.single ⟨15360,15488,9984,10112⟩) (.single ⟨15360,15424,10112,10176⟩)) (.node (.single ⟨15360,15392,10176,10208⟩) (.node (.single ⟨15360,15392,10208,10240⟩) (.single ⟨15392,15424,10176,10208⟩)))) (.node (.node (.single ⟨15392,15424,10208,10240⟩) (.single ⟨15424,15488,10112,10176⟩)) (.node (.single ⟨15424,15488,10176,10240⟩) (.node (.single ⟨15488,15616,9984,10112⟩) (.single ⟨15488,15616,10112,10240⟩)))))) (.node (.node (.node (.node (.single ⟨17152,17280,22528,22656⟩) (.single ⟨17152,17280,22656,22784⟩)) (.node (.single ⟨17280,17344,22528,22592⟩) (.node (.single ⟨17280,17344,22592,22656⟩) (.single ⟨17344,17376,22528,22560⟩)))) (.node (.node (.single ⟨17344,17376,22560,22592⟩) (.single ⟨17376,17408,22528,22560⟩)) (.node (.single ⟨17376,17408,22560,22592⟩) (.node (.single ⟨17344,17408,22592,22656⟩) (.single ⟨17280,17408,22656,22784⟩))))) (.node (.node (.node (.single ⟨22528,22656,17152,17280⟩) (.single ⟨22528,22592,17280,17344⟩)) (.node (.single ⟨22528,22560,17344,17376⟩) (.node (.single ⟨22528,22560,17376,17408⟩) (.single ⟨22560,22592,17344,17376⟩)))) (.node (.node (.single ⟨22560,22592,17376,17408⟩) (.single ⟨22592,22656,17280,17344⟩)) (.node (.single ⟨22592,22656,17344,17408⟩) (.node (.single ⟨22656,22784,17152,17280⟩) (.single ⟨22656,22784,17280,17408⟩)))))))
def output85 : Fin 40 → GridBox := outputData85.get
def coverData85 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 10)) (.node (.single 39) (.node (.single 29) (.single 1)))) (.node (.node (.single 18) (.single 38)) (.node (.single 21) (.node (.single 9) (.single 19))))) (.node (.node (.node (.single 30) (.single 20)) (.node (.single 2) (.node (.single 11) (.single 37)))) (.node (.node (.single 28) (.single 3)) (.node (.single 16) (.node (.single 36) (.single 23)))))) (.node (.node (.node (.node (.single 8) (.single 17)) (.node (.single 31) (.node (.single 22) (.single 4)))) (.node (.node (.single 12) (.single 35)) (.node (.single 27) (.node (.single 5) (.single 14))))) (.node (.node (.node (.single 34) (.single 25)) (.node (.single 6) (.node (.single 13) (.single 33)))) (.node (.node (.single 26) (.single 7)) (.node (.single 15) (.node (.single 32) (.single 24)))))))
def sourceData85 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9)))))) (.node (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover85 (i : Fin 40) : Fin 40 := ⟨coverData85.get i % 40, Nat.mod_lt _ (by decide)⟩
def source85 (i : Fin 40) : Fin 40 := ⟨sourceData85.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree85 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 (.cutY 14336 .empty (.cutX 9216 .empty (.cutY 15360 .empty (.cutX 9728 .empty (.cutY 15872 (.cutX 9984 .empty (.cutY 15616 (.cutX 10112 (.cutY 15488 .full .full) (.cutY 15488 (.cutX 10176 (.cutY 15424 .full .full) (.cutY 15424 (.cutX 10208 (.cutY 15392 .full .full) (.cutY 15392 .full .full)) .full)) .full)) .empty)) .empty))))) .empty)) (.cutY 12288 (.cutX 14336 .empty (.cutY 10240 (.cutX 15360 .empty (.cutY 9216 .empty (.cutX 15872 (.cutY 9728 .empty (.cutX 15616 (.cutY 9984 .empty (.cutX 15488 (.cutY 10112 .full (.cutX 15424 (.cutY 10176 .full (.cutX 15392 (.cutY 10208 .full .full) (.cutY 10208 .full .full))) (.cutY 10176 .full .full))) (.cutY 10112 .full .full))) .empty)) .empty))) .empty)) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 (.cutY 22528 .empty (.cutX 17408 (.cutY 23552 (.cutX 16896 .empty (.cutY 23040 (.cutX 17152 .empty (.cutY 22784 (.cutX 17280 (.cutY 22656 .full .full) (.cutY 22656 (.cutX 17344 (.cutY 22592 .full .full) (.cutY 22592 (.cutX 17376 (.cutY 22560 .full .full) (.cutY 22560 .full .full)) .full)) .full)) .empty)) .empty)) .empty) .empty)) .empty)) (.cutY 20480 (.cutX 22528 .empty (.cutY 18432 (.cutX 23552 (.cutY 17408 (.cutX 23040 (.cutY 16896 .empty (.cutX 22784 (.cutY 17152 .empty (.cutX 22656 (.cutY 17280 .full (.cutX 22592 (.cutY 17344 .full (.cutX 22560 (.cutY 17376 .full .full) (.cutY 17376 .full .full))) (.cutY 17344 .full .full))) (.cutY 17280 .full .full))) .empty)) .empty) .empty) .empty) .empty)) .empty)) .empty) .empty)))

theorem metadata85 : 0<168966520 ∧ 39<128 ∧ 60<128 ∧ 1<4 ∧
    7691/4160=1 ∧ 7691%4160=3531 ∧ ∀ i, (leaves85 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData85).mp
    (by decide +kernel)

theorem sourceChecked85_0 : ∀ i : Fin 40,
    (fun i => output85 i = raw85 (source85 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked85 : ∀ i : Fin 40, (fun i => output85 i = raw85 (source85 i)) i :=
  forallFin_of_zero_offset (fun i => output85 i = raw85 (source85 i)) sourceChecked85_0

theorem coverChecked85_0 : ∀ i : Fin 40,
    (fun i => (output85 (cover85 i)).ContainsBox (raw85 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked85 : ∀ i : Fin 40, (fun i => (output85 (cover85 i)).ContainsBox (raw85 i)) i :=
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

noncomputable def phaseMass85 : ℝ := singlePhaseMass (168966520/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw85 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass85_eq : phaseMass85 = (4224163/40960000000 : ℝ) := by
  unfold phaseMass85
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw85 output85 cover85 source85
    (gridTreeUnionCheck_sound 32768 raw85 output85 cover85 source85 tree85 checked85)
    _ (by norm_num) _, areaUnits85]
  norm_num

-- Frozen phase 3094, atom 7412, type 1, source (34,56).
def leavesData86 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves86 : Fin 10 → DyadicLeaf := leavesData86.get
def raw86 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 34 56 leaves86 i
def outputData86 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨8704,8832,14336,14464⟩) (.single ⟨8704,8832,14464,14592⟩)) (.node (.single ⟨8832,8896,14336,14400⟩) (.node (.single ⟨8832,8896,14400,14464⟩) (.single ⟨8896,8928,14336,14368⟩)))) (.node (.node (.single ⟨8896,8928,14368,14400⟩) (.single ⟨8928,8960,14336,14368⟩)) (.node (.single ⟨8928,8960,14368,14400⟩) (.node (.single ⟨8896,8960,14400,14464⟩) (.single ⟨8832,8960,14464,14592⟩))))) (.node (.node (.node (.single ⟨14336,14464,8704,8832⟩) (.single ⟨14336,14400,8832,8896⟩)) (.node (.single ⟨14336,14368,8896,8928⟩) (.node (.single ⟨14336,14368,8928,8960⟩) (.single ⟨14368,14400,8896,8928⟩)))) (.node (.node (.single ⟨14368,14400,8928,8960⟩) (.single ⟨14400,14464,8832,8896⟩)) (.node (.single ⟨14400,14464,8896,8960⟩) (.node (.single ⟨14464,14592,8704,8832⟩) (.single ⟨14464,14592,8832,8960⟩)))))) (.node (.node (.node (.node (.single ⟨18176,18304,23808,23936⟩) (.single ⟨18176,18304,23936,24064⟩)) (.node (.single ⟨18304,18368,23808,23872⟩) (.node (.single ⟨18304,18368,23872,23936⟩) (.single ⟨18368,18400,23808,23840⟩)))) (.node (.node (.single ⟨18368,18400,23840,23872⟩) (.single ⟨18400,18432,23808,23840⟩)) (.node (.single ⟨18400,18432,23840,23872⟩) (.node (.single ⟨18368,18432,23872,23936⟩) (.single ⟨18304,18432,23936,24064⟩))))) (.node (.node (.node (.single ⟨23808,23936,18176,18304⟩) (.single ⟨23808,23872,18304,18368⟩)) (.node (.single ⟨23808,23840,18368,18400⟩) (.node (.single ⟨23808,23840,18400,18432⟩) (.single ⟨23840,23872,18368,18400⟩)))) (.node (.node (.single ⟨23840,23872,18400,18432⟩) (.single ⟨23872,23936,18304,18368⟩)) (.node (.single ⟨23872,23936,18368,18432⟩) (.node (.single ⟨23936,24064,18176,18304⟩) (.single ⟨23936,24064,18304,18432⟩)))))))
def output86 : Fin 40 → GridBox := outputData86.get
def coverData86 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 10)) (.node (.single 39) (.node (.single 29) (.single 1)))) (.node (.node (.single 18) (.single 38)) (.node (.single 21) (.node (.single 9) (.single 19))))) (.node (.node (.node (.single 30) (.single 20)) (.node (.single 2) (.node (.single 11) (.single 37)))) (.node (.node (.single 28) (.single 3)) (.node (.single 16) (.node (.single 36) (.single 23)))))) (.node (.node (.node (.node (.single 8) (.single 17)) (.node (.single 31) (.node (.single 22) (.single 4)))) (.node (.node (.single 12) (.single 35)) (.node (.single 27) (.node (.single 5) (.single 14))))) (.node (.node (.node (.single 34) (.single 25)) (.node (.single 6) (.node (.single 13) (.single 33)))) (.node (.node (.single 26) (.single 7)) (.node (.single 15) (.node (.single 32) (.single 24)))))))
def sourceData86 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9)))))) (.node (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover86 (i : Fin 40) : Fin 40 := ⟨coverData86.get i % 40, Nat.mod_lt _ (by decide)⟩
def source86 (i : Fin 40) : Fin 40 := ⟨sourceData86.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree86 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 (.cutY 14336 .empty (.cutX 9216 (.cutY 15360 (.cutX 8704 .empty (.cutY 14848 (.cutX 8960 (.cutY 14592 (.cutX 8832 (.cutY 14464 .full .full) (.cutY 14464 (.cutX 8896 (.cutY 14400 .full .full) (.cutY 14400 (.cutX 8928 (.cutY 14368 .full .full) (.cutY 14368 .full .full)) .full)) .full)) .empty) .empty) .empty)) .empty) .empty)) .empty)) (.cutY 12288 (.cutX 14336 .empty (.cutY 10240 (.cutX 15360 (.cutY 9216 (.cutX 14848 (.cutY 8704 .empty (.cutX 14592 (.cutY 8960 (.cutX 14464 (.cutY 8832 .full (.cutX 14400 (.cutY 8896 .full (.cutX 14368 (.cutY 8928 .full .full) (.cutY 8928 .full .full))) (.cutY 8896 .full .full))) (.cutY 8832 .full .full)) .empty) .empty)) .empty) .empty) .empty) .empty)) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 (.cutY 22528 .empty (.cutX 17408 .empty (.cutY 23552 .empty (.cutX 17920 .empty (.cutY 24064 (.cutX 18176 .empty (.cutY 23808 .empty (.cutX 18304 (.cutY 23936 .full .full) (.cutY 23936 (.cutX 18368 (.cutY 23872 .full .full) (.cutY 23872 (.cutX 18400 (.cutY 23840 .full .full) (.cutY 23840 .full .full)) .full)) .full)))) .empty))))) .empty)) (.cutY 20480 (.cutX 22528 .empty (.cutY 18432 (.cutX 23552 .empty (.cutY 17408 .empty (.cutX 24064 (.cutY 17920 .empty (.cutX 23808 .empty (.cutY 18176 .empty (.cutX 23936 (.cutY 18304 .full (.cutX 23872 (.cutY 18368 .full (.cutX 23840 (.cutY 18400 .full .full) (.cutY 18400 .full .full))) (.cutY 18368 .full .full))) (.cutY 18304 .full .full))))) .empty))) .empty)) .empty)) .empty) .empty)))

theorem metadata86 : 0<168966520 ∧ 34<128 ∧ 56<128 ∧ 1<4 ∧
    7412/4160=1 ∧ 7412%4160=3252 ∧ ∀ i, (leaves86 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData86).mp
    (by decide +kernel)

theorem sourceChecked86_0 : ∀ i : Fin 40,
    (fun i => output86 i = raw86 (source86 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked86 : ∀ i : Fin 40, (fun i => output86 i = raw86 (source86 i)) i :=
  forallFin_of_zero_offset (fun i => output86 i = raw86 (source86 i)) sourceChecked86_0

theorem coverChecked86_0 : ∀ i : Fin 40,
    (fun i => (output86 (cover86 i)).ContainsBox (raw86 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked86 : ∀ i : Fin 40, (fun i => (output86 (cover86 i)).ContainsBox (raw86 i)) i :=
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

-- Frozen phase 3095, atom 6621, type 1, source (23,46).
def leavesData87 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves87 : Fin 10 → DyadicLeaf := leavesData87.get
def raw87 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 23 46 leaves87 i
def outputData87 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨5888,6016,11776,11904⟩) (.single ⟨5888,6016,11904,12032⟩)) (.node (.single ⟨6016,6080,11776,11840⟩) (.node (.single ⟨6016,6080,11840,11904⟩) (.single ⟨6080,6112,11776,11808⟩)))) (.node (.node (.single ⟨6080,6112,11808,11840⟩) (.single ⟨6112,6144,11776,11808⟩)) (.node (.single ⟨6112,6144,11808,11840⟩) (.node (.single ⟨6080,6144,11840,11904⟩) (.single ⟨6016,6144,11904,12032⟩))))) (.node (.node (.node (.single ⟨11776,11904,5888,6016⟩) (.single ⟨11776,11840,6016,6080⟩)) (.node (.single ⟨11776,11808,6080,6112⟩) (.node (.single ⟨11776,11808,6112,6144⟩) (.single ⟨11808,11840,6080,6112⟩)))) (.node (.node (.single ⟨11808,11840,6112,6144⟩) (.single ⟨11840,11904,6016,6080⟩)) (.node (.single ⟨11840,11904,6080,6144⟩) (.node (.single ⟨11904,12032,5888,6016⟩) (.single ⟨11904,12032,6016,6144⟩)))))) (.node (.node (.node (.node (.single ⟨20736,20864,26624,26752⟩) (.single ⟨20736,20864,26752,26880⟩)) (.node (.single ⟨20864,20928,26624,26688⟩) (.node (.single ⟨20864,20928,26688,26752⟩) (.single ⟨20928,20960,26624,26656⟩)))) (.node (.node (.single ⟨20928,20960,26656,26688⟩) (.single ⟨20960,20992,26624,26656⟩)) (.node (.single ⟨20960,20992,26656,26688⟩) (.node (.single ⟨20928,20992,26688,26752⟩) (.single ⟨20864,20992,26752,26880⟩))))) (.node (.node (.node (.single ⟨26624,26752,20736,20864⟩) (.single ⟨26624,26688,20864,20928⟩)) (.node (.single ⟨26624,26656,20928,20960⟩) (.node (.single ⟨26624,26656,20960,20992⟩) (.single ⟨26656,26688,20928,20960⟩)))) (.node (.node (.single ⟨26656,26688,20960,20992⟩) (.single ⟨26688,26752,20864,20928⟩)) (.node (.single ⟨26688,26752,20928,20992⟩) (.node (.single ⟨26752,26880,20736,20864⟩) (.single ⟨26752,26880,20864,20992⟩)))))))
def output87 : Fin 40 → GridBox := outputData87.get
def coverData87 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 10)) (.node (.single 39) (.node (.single 29) (.single 1)))) (.node (.node (.single 18) (.single 38)) (.node (.single 21) (.node (.single 9) (.single 19))))) (.node (.node (.node (.single 30) (.single 20)) (.node (.single 2) (.node (.single 11) (.single 37)))) (.node (.node (.single 28) (.single 3)) (.node (.single 16) (.node (.single 36) (.single 23)))))) (.node (.node (.node (.node (.single 8) (.single 17)) (.node (.single 31) (.node (.single 22) (.single 4)))) (.node (.node (.single 12) (.single 35)) (.node (.single 27) (.node (.single 5) (.single 14))))) (.node (.node (.node (.single 34) (.single 25)) (.node (.single 6) (.node (.single 13) (.single 33)))) (.node (.node (.single 26) (.single 7)) (.node (.single 15) (.node (.single 32) (.single 24)))))))
def sourceData87 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9)))))) (.node (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover87 (i : Fin 40) : Fin 40 := ⟨coverData87.get i % 40, Nat.mod_lt _ (by decide)⟩
def source87 (i : Fin 40) : Fin 40 := ⟨sourceData87.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree87 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 (.cutY 10240 .empty (.cutX 5120 .empty (.cutY 11264 .empty (.cutX 5632 .empty (.cutY 11776 .empty (.cutX 5888 .empty (.cutY 12032 (.cutX 6016 (.cutY 11904 .full .full) (.cutY 11904 (.cutX 6080 (.cutY 11840 .full .full) (.cutY 11840 (.cutX 6112 (.cutY 11808 .full .full) (.cutY 11808 .full .full)) .full)) .full)) .empty))))))) .empty) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 .empty (.cutY 6144 (.cutX 11264 .empty (.cutY 5120 .empty (.cutX 11776 .empty (.cutY 5632 .empty (.cutX 12032 (.cutY 5888 .empty (.cutX 11904 (.cutY 6016 .full (.cutX 11840 (.cutY 6080 .full (.cutX 11808 (.cutY 6112 .full .full) (.cutY 6112 .full .full))) (.cutY 6080 .full .full))) (.cutY 6016 .full .full))) .empty))))) .empty))) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 (.cutY 26624 .empty (.cutX 21504 (.cutY 27648 (.cutX 20992 (.cutY 27136 (.cutX 20736 .empty (.cutY 26880 (.cutX 20864 (.cutY 26752 .full .full) (.cutY 26752 (.cutX 20928 (.cutY 26688 .full .full) (.cutY 26688 (.cutX 20960 (.cutY 26656 .full .full) (.cutY 26656 .full .full)) .full)) .full)) .empty)) .empty) .empty) .empty) .empty)) .empty) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 .empty (.cutY 22528 (.cutX 27648 (.cutY 21504 (.cutX 27136 (.cutY 20992 (.cutX 26880 (.cutY 20736 .empty (.cutX 26752 (.cutY 20864 .full (.cutX 26688 (.cutY 20928 .full (.cutX 26656 (.cutY 20960 .full .full) (.cutY 20960 .full .full))) (.cutY 20928 .full .full))) (.cutY 20864 .full .full))) .empty) .empty) .empty) .empty) .empty) .empty))) .empty) .empty))))

theorem metadata87 : 0<22259151 ∧ 23<128 ∧ 46<128 ∧ 1<4 ∧
    6621/4160=1 ∧ 6621%4160=2461 ∧ ∀ i, (leaves87 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData87).mp
    (by decide +kernel)

theorem sourceChecked87_0 : ∀ i : Fin 40,
    (fun i => output87 i = raw87 (source87 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked87 : ∀ i : Fin 40, (fun i => output87 i = raw87 (source87 i)) i :=
  forallFin_of_zero_offset (fun i => output87 i = raw87 (source87 i)) sourceChecked87_0

theorem coverChecked87_0 : ∀ i : Fin 40,
    (fun i => (output87 (cover87 i)).ContainsBox (raw87 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked87 : ∀ i : Fin 40, (fun i => (output87 (cover87 i)).ContainsBox (raw87 i)) i :=
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

noncomputable def phaseMass87 : ℝ := singlePhaseMass (22259151/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw87 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass87_eq : phaseMass87 = (22259151/1638400000000 : ℝ) := by
  unfold phaseMass87
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw87 output87 cover87 source87
    (gridTreeUnionCheck_sound 32768 raw87 output87 cover87 source87 tree87 checked87)
    _ (by norm_num) _, areaUnits87]
  norm_num

-- Frozen phase 3096, atom 657, type 0, source (5,42).
def leavesData88 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves88 : Fin 4 → DyadicLeaf := leavesData88.get
def raw88 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 5 42 leaves88 i
def outputData88 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨1280,1408,10752,10880⟩) (.single ⟨1280,1408,10880,11008⟩)) (.node (.single ⟨1408,1536,10752,10880⟩) (.single ⟨1408,1536,10880,11008⟩))) (.node (.node (.single ⟨10752,10880,1280,1408⟩) (.single ⟨10752,10880,1408,1536⟩)) (.node (.single ⟨10880,11008,1280,1408⟩) (.single ⟨10880,11008,1408,1536⟩)))) (.node (.node (.node (.single ⟨21760,21888,31232,31360⟩) (.single ⟨21760,21888,31360,31488⟩)) (.node (.single ⟨21888,22016,31232,31360⟩) (.single ⟨21888,22016,31360,31488⟩))) (.node (.node (.single ⟨31232,31360,21760,21888⟩) (.single ⟨31232,31360,21888,22016⟩)) (.node (.single ⟨31360,31488,21760,21888⟩) (.single ⟨31360,31488,21888,22016⟩)))))
def output88 : Fin 16 → GridBox := outputData88.get
def coverData88 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData88 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover88 (i : Fin 16) : Fin 16 := ⟨coverData88.get i % 16, Nat.mod_lt _ (by decide)⟩
def source88 (i : Fin 16) : Fin 16 := ⟨sourceData88.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree88 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 (.cutY 10240 .empty (.cutX 1024 .empty (.cutY 11264 (.cutX 1536 (.cutY 10752 .empty (.cutX 1280 .empty (.cutY 11008 (.cutX 1408 (.cutY 10880 .full .full) (.cutY 10880 .full .full)) .empty))) .empty) .empty))) .empty) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 .empty (.cutY 2048 (.cutX 11264 (.cutY 1024 .empty (.cutX 10752 .empty (.cutY 1536 (.cutX 11008 (.cutY 1280 .empty (.cutX 10880 (.cutY 1408 .full .full) (.cutY 1408 .full .full))) .empty) .empty))) .empty) .empty)) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 (.cutY 30720 .empty (.cutX 21504 .empty (.cutY 31744 (.cutX 22016 (.cutY 31232 .empty (.cutX 21760 .empty (.cutY 31488 (.cutX 21888 (.cutY 31360 .full .full) (.cutY 31360 .full .full)) .empty))) .empty) .empty))) .empty)))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 .empty (.cutY 22528 (.cutX 31744 (.cutY 21504 .empty (.cutX 31232 .empty (.cutY 22016 (.cutX 31488 (.cutY 21760 .empty (.cutX 31360 (.cutY 21888 .full .full) (.cutY 21888 .full .full))) .empty) .empty))) .empty) .empty)))) .empty))))

theorem metadata88 : 0<374268468 ∧ 5<128 ∧ 42<128 ∧ 0<4 ∧
    657/4160=0 ∧ 657%4160=657 ∧ ∀ i, (leaves88 i).Valid 8 := by
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

noncomputable def phaseMass88 : ℝ := singlePhaseMass (374268468/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw88 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass88_eq : phaseMass88 = (93567117/409600000000 : ℝ) := by
  unfold phaseMass88
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw88 output88 cover88 source88
    (gridTreeUnionCheck_sound 32768 raw88 output88 cover88 source88 tree88 checked88)
    _ (by norm_num) _, areaUnits88]
  norm_num

-- Frozen phase 3097, atom 7920, type 1, source (44,64).
def leavesData89 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves89 : Fin 7 → DyadicLeaf := leavesData89.get
def raw89 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 44 64 leaves89 i
def outputData89 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨11264,11392,16384,16512⟩) (.node (.single ⟨11264,11392,16512,16640⟩) (.single ⟨11392,11456,16384,16448⟩))) (.node (.node (.single ⟨11392,11456,16448,16512⟩) (.single ⟨11456,11520,16384,16448⟩)) (.node (.single ⟨11456,11520,16448,16512⟩) (.single ⟨11392,11520,16512,16640⟩)))) (.node (.node (.single ⟨16128,16256,21248,21376⟩) (.node (.single ⟨16128,16256,21376,21504⟩) (.single ⟨16256,16320,21248,21312⟩))) (.node (.node (.single ⟨16256,16320,21312,21376⟩) (.single ⟨16320,16384,21248,21312⟩)) (.node (.single ⟨16320,16384,21312,21376⟩) (.single ⟨16256,16384,21376,21504⟩))))) (.node (.node (.node (.single ⟨16384,16512,11264,11392⟩) (.node (.single ⟨16384,16448,11392,11456⟩) (.single ⟨16384,16448,11456,11520⟩))) (.node (.node (.single ⟨16448,16512,11392,11456⟩) (.single ⟨16448,16512,11456,11520⟩)) (.node (.single ⟨16512,16640,11264,11392⟩) (.single ⟨16512,16640,11392,11520⟩)))) (.node (.node (.single ⟨21248,21376,16128,16256⟩) (.node (.single ⟨21248,21312,16256,16320⟩) (.single ⟨21248,21312,16320,16384⟩))) (.node (.node (.single ⟨21312,21376,16256,16320⟩) (.single ⟨21312,21376,16320,16384⟩)) (.node (.single ⟨21376,21504,16128,16256⟩) (.single ⟨21376,21504,16256,16384⟩))))))
def output89 : Fin 28 → GridBox := outputData89.get
def coverData89 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData89 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover89 (i : Fin 28) : Fin 28 := ⟨coverData89.get i % 28, Nat.mod_lt _ (by decide)⟩
def source89 (i : Fin 28) : Fin 28 := ⟨sourceData89.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree89 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 .empty (.cutY 18432 (.cutX 11264 .empty (.cutY 17408 (.cutX 11776 (.cutY 16896 (.cutX 11520 (.cutY 16640 (.cutX 11392 (.cutY 16512 .full .full) (.cutY 16512 (.cutX 11456 (.cutY 16448 .full .full) (.cutY 16448 .full .full)) .full)) .empty) .empty) .empty) .empty) .empty)) .empty)) .empty) (.cutY 20480 .empty (.cutX 14336 .empty (.cutY 22528 (.cutX 15360 .empty (.cutY 21504 (.cutX 15872 .empty (.cutY 20992 .empty (.cutX 16128 .empty (.cutY 21248 .empty (.cutX 16256 (.cutY 21376 .full .full) (.cutY 21376 (.cutX 16320 (.cutY 21312 .full .full) (.cutY 21312 .full .full)) .full)))))) .empty)) .empty)))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 (.cutY 10240 .empty (.cutX 17408 (.cutY 11264 .empty (.cutX 16896 (.cutY 11776 (.cutX 16640 (.cutY 11520 (.cutX 16512 (.cutY 11392 .full (.cutX 16448 (.cutY 11456 .full .full) (.cutY 11456 .full .full))) (.cutY 11392 .full .full)) .empty) .empty) .empty) .empty)) .empty)) .empty) .empty) (.cutY 12288 .empty (.cutX 22528 (.cutY 14336 .empty (.cutX 21504 (.cutY 15360 .empty (.cutX 20992 .empty (.cutY 15872 .empty (.cutX 21248 .empty (.cutY 16128 .empty (.cutX 21376 (.cutY 16256 .full (.cutX 21312 (.cutY 16320 .full .full) (.cutY 16320 .full .full))) (.cutY 16256 .full .full))))))) .empty)) .empty)))) .empty) .empty))

theorem metadata89 : 0<50021215 ∧ 44<128 ∧ 64<128 ∧ 1<4 ∧
    7920/4160=1 ∧ 7920%4160=3760 ∧ ∀ i, (leaves89 i).Valid 8 := by
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

noncomputable def phaseMass89 : ℝ := singlePhaseMass (50021215/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw89 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass89_eq : phaseMass89 = (10004243/327680000000 : ℝ) := by
  unfold phaseMass89
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw89 output89 cover89 source89
    (gridTreeUnionCheck_sound 32768 raw89 output89 cover89 source89 tree89 checked89)
    _ (by norm_num) _, areaUnits89]
  norm_num

-- Frozen phase 3098, atom 2297, type 0, source (21,50).
def leavesData90 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves90 : Fin 1 → DyadicLeaf := leavesData90.get
def raw90 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 21 50 leaves90 i
def outputData90 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨5376,5632,12800,13056⟩) (.single ⟨12800,13056,5376,5632⟩)) (.node (.single ⟨19712,19968,27136,27392⟩) (.single ⟨27136,27392,19712,19968⟩)))
def output90 : Fin 4 → GridBox := outputData90.get
def coverData90 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData90 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover90 (i : Fin 4) : Fin 4 := ⟨coverData90.get i % 4, Nat.mod_lt _ (by decide)⟩
def source90 (i : Fin 4) : Fin 4 := ⟨sourceData90.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree90 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 (.cutY 14336 (.cutX 5120 .empty (.cutY 13312 (.cutX 5632 (.cutY 12800 .empty (.cutX 5376 .empty (.cutY 13056 .full .empty))) .empty) .empty)) .empty) .empty)))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 (.cutY 6144 (.cutX 13312 (.cutY 5120 .empty (.cutX 12800 .empty (.cutY 5632 (.cutX 13056 (.cutY 5376 .empty .full) .empty) .empty))) .empty) .empty) .empty))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 .empty (.cutY 26624 .empty (.cutX 19456 .empty (.cutY 27648 (.cutX 19968 (.cutY 27136 .empty (.cutX 19712 .empty (.cutY 27392 .full .empty))) .empty) .empty)))) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 .empty (.cutY 18432 .empty (.cutX 27648 (.cutY 19456 .empty (.cutX 27136 .empty (.cutY 19968 (.cutX 27392 (.cutY 19712 .empty .full) .empty) .empty))) .empty))) .empty) .empty) .empty))))

theorem metadata90 : 0<204777576 ∧ 21<128 ∧ 50<128 ∧ 0<4 ∧
    2297/4160=0 ∧ 2297%4160=2297 ∧ ∀ i, (leaves90 i).Valid 8 := by
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

noncomputable def phaseMass90 : ℝ := singlePhaseMass (204777576/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw90 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass90_eq : phaseMass90 = (25597197/204800000000 : ℝ) := by
  unfold phaseMass90
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw90 output90 cover90 source90
    (gridTreeUnionCheck_sound 32768 raw90 output90 cover90 source90 tree90 checked90)
    _ (by norm_num) _, areaUnits90]
  norm_num

-- Frozen phase 3099, atom 5270, type 1, source (9,39).
def leavesData91 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves91 : Fin 7 → DyadicLeaf := leavesData91.get
def raw91 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 9 39 leaves91 i
def outputData91 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨2304,2432,9984,10112⟩) (.node (.single ⟨2304,2432,10112,10240⟩) (.single ⟨2432,2496,9984,10048⟩))) (.node (.node (.single ⟨2432,2496,10048,10112⟩) (.single ⟨2496,2560,9984,10048⟩)) (.node (.single ⟨2496,2560,10048,10112⟩) (.single ⟨2432,2560,10112,10240⟩)))) (.node (.node (.single ⟨9984,10112,2304,2432⟩) (.node (.single ⟨9984,10048,2432,2496⟩) (.single ⟨9984,10048,2496,2560⟩))) (.node (.node (.single ⟨10048,10112,2432,2496⟩) (.single ⟨10048,10112,2496,2560⟩)) (.node (.single ⟨10112,10240,2304,2432⟩) (.single ⟨10112,10240,2432,2560⟩))))) (.node (.node (.node (.single ⟨22528,22656,30208,30336⟩) (.node (.single ⟨22528,22656,30336,30464⟩) (.single ⟨22656,22720,30208,30272⟩))) (.node (.node (.single ⟨22656,22720,30272,30336⟩) (.single ⟨22720,22784,30208,30272⟩)) (.node (.single ⟨22720,22784,30272,30336⟩) (.single ⟨22656,22784,30336,30464⟩)))) (.node (.node (.single ⟨30208,30336,22528,22656⟩) (.node (.single ⟨30208,30272,22656,22720⟩) (.single ⟨30208,30272,22720,22784⟩))) (.node (.node (.single ⟨30272,30336,22656,22720⟩) (.single ⟨30272,30336,22720,22784⟩)) (.node (.single ⟨30336,30464,22528,22656⟩) (.single ⟨30336,30464,22656,22784⟩))))))
def output91 : Fin 28 → GridBox := outputData91.get
def coverData91 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData91 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover91 (i : Fin 28) : Fin 28 := ⟨coverData91.get i % 28, Nat.mod_lt _ (by decide)⟩
def source91 (i : Fin 28) : Fin 28 := ⟨sourceData91.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree91 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 .empty (.cutY 10240 (.cutX 3072 (.cutY 9216 .empty (.cutX 2560 (.cutY 9728 .empty (.cutX 2304 .empty (.cutY 9984 .empty (.cutX 2432 (.cutY 10112 .full .full) (.cutY 10112 (.cutX 2496 (.cutY 10048 .full .full) (.cutY 10048 .full .full)) .full))))) .empty)) .empty) .empty)) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 .empty (.cutX 9216 .empty (.cutY 3072 (.cutX 9728 .empty (.cutY 2560 (.cutX 9984 .empty (.cutY 2304 .empty (.cutX 10112 (.cutY 2432 .full (.cutX 10048 (.cutY 2496 .full .full) (.cutY 2496 .full .full))) (.cutY 2432 .full .full)))) .empty)) .empty))) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 (.cutX 23552 (.cutY 29696 .empty (.cutX 23040 (.cutY 30208 .empty (.cutX 22784 (.cutY 30464 (.cutX 22656 (.cutY 30336 .full .full) (.cutY 30336 (.cutX 22720 (.cutY 30272 .full .full) (.cutY 30272 .full .full)) .full)) .empty) .empty)) .empty)) .empty) .empty))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 (.cutY 22528 .empty (.cutX 29696 .empty (.cutY 23552 (.cutX 30208 .empty (.cutY 23040 (.cutX 30464 (.cutY 22784 (.cutX 30336 (.cutY 22656 .full (.cutX 30272 (.cutY 22720 .full .full) (.cutY 22720 .full .full))) (.cutY 22656 .full .full)) .empty) .empty) .empty)) .empty))) .empty))) .empty))))

theorem metadata91 : 0<190129790 ∧ 9<128 ∧ 39<128 ∧ 1<4 ∧
    5270/4160=1 ∧ 5270%4160=1110 ∧ ∀ i, (leaves91 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData91).mp
    (by decide +kernel)

theorem sourceChecked91_0 : ∀ i : Fin 28,
    (fun i => output91 i = raw91 (source91 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked91 : ∀ i : Fin 28, (fun i => output91 i = raw91 (source91 i)) i :=
  forallFin_of_zero_offset (fun i => output91 i = raw91 (source91 i)) sourceChecked91_0

theorem coverChecked91_0 : ∀ i : Fin 28,
    (fun i => (output91 (cover91 i)).ContainsBox (raw91 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked91 : ∀ i : Fin 28, (fun i => (output91 (cover91 i)).ContainsBox (raw91 i)) i :=
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

noncomputable def phaseMass91 : ℝ := singlePhaseMass (190129790/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw91 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass91_eq : phaseMass91 = (19012979/163840000000 : ℝ) := by
  unfold phaseMass91
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw91 output91 cover91 source91
    (gridTreeUnionCheck_sound 32768 raw91 output91 cover91 source91 tree91 checked91)
    _ (by norm_num) _, areaUnits91]
  norm_num

-- Frozen phase 3100, atom 5592, type 1, source (12,40).
def leavesData92 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves92 : Fin 7 → DyadicLeaf := leavesData92.get
def raw92 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 12 40 leaves92 i
def outputData92 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3072,3200,10240,10368⟩) (.node (.single ⟨3072,3200,10368,10496⟩) (.single ⟨3200,3264,10240,10304⟩))) (.node (.node (.single ⟨3200,3264,10304,10368⟩) (.single ⟨3264,3328,10240,10304⟩)) (.node (.single ⟨3264,3328,10304,10368⟩) (.single ⟨3200,3328,10368,10496⟩)))) (.node (.node (.single ⟨10240,10368,3072,3200⟩) (.node (.single ⟨10240,10304,3200,3264⟩) (.single ⟨10240,10304,3264,3328⟩))) (.node (.node (.single ⟨10304,10368,3200,3264⟩) (.single ⟨10304,10368,3264,3328⟩)) (.node (.single ⟨10368,10496,3072,3200⟩) (.single ⟨10368,10496,3200,3328⟩))))) (.node (.node (.node (.single ⟨22272,22400,29440,29568⟩) (.node (.single ⟨22272,22400,29568,29696⟩) (.single ⟨22400,22464,29440,29504⟩))) (.node (.node (.single ⟨22400,22464,29504,29568⟩) (.single ⟨22464,22528,29440,29504⟩)) (.node (.single ⟨22464,22528,29504,29568⟩) (.single ⟨22400,22528,29568,29696⟩)))) (.node (.node (.single ⟨29440,29568,22272,22400⟩) (.node (.single ⟨29440,29504,22400,22464⟩) (.single ⟨29440,29504,22464,22528⟩))) (.node (.node (.single ⟨29504,29568,22400,22464⟩) (.single ⟨29504,29568,22464,22528⟩)) (.node (.single ⟨29568,29696,22272,22400⟩) (.single ⟨29568,29696,22400,22528⟩))))))
def output92 : Fin 28 → GridBox := outputData92.get
def coverData92 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData92 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover92 (i : Fin 28) : Fin 28 := ⟨coverData92.get i % 28, Nat.mod_lt _ (by decide)⟩
def source92 (i : Fin 28) : Fin 28 := ⟨sourceData92.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree92 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 .empty (.cutY 10240 .empty (.cutX 3072 .empty (.cutY 11264 (.cutX 3584 (.cutY 10752 (.cutX 3328 (.cutY 10496 (.cutX 3200 (.cutY 10368 .full .full) (.cutY 10368 (.cutX 3264 (.cutY 10304 .full .full) (.cutY 10304 .full .full)) .full)) .empty) .empty) .empty) .empty) .empty)))) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 .empty (.cutY 2048 .empty (.cutX 11264 (.cutY 3072 .empty (.cutX 10752 (.cutY 3584 (.cutX 10496 (.cutY 3328 (.cutX 10368 (.cutY 3200 .full (.cutX 10304 (.cutY 3264 .full .full) (.cutY 3264 .full .full))) (.cutY 3200 .full .full)) .empty) .empty) .empty) .empty)) .empty))) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 (.cutY 30720 (.cutX 21504 .empty (.cutY 29696 (.cutX 22016 .empty (.cutY 29184 .empty (.cutX 22272 .empty (.cutY 29440 .empty (.cutX 22400 (.cutY 29568 .full .full) (.cutY 29568 (.cutX 22464 (.cutY 29504 .full .full) (.cutY 29504 .full .full)) .full)))))) .empty)) .empty) .empty)))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 (.cutY 22528 (.cutX 29696 (.cutY 21504 .empty (.cutX 29184 .empty (.cutY 22016 .empty (.cutX 29440 .empty (.cutY 22272 .empty (.cutX 29568 (.cutY 22400 .full (.cutX 29504 (.cutY 22464 .full .full) (.cutY 22464 .full .full))) (.cutY 22400 .full .full))))))) .empty) .empty) .empty))) .empty))))

theorem metadata92 : 0<213482286 ∧ 12<128 ∧ 40<128 ∧ 1<4 ∧
    5592/4160=1 ∧ 5592%4160=1432 ∧ ∀ i, (leaves92 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData92).mp
    (by decide +kernel)

theorem sourceChecked92_0 : ∀ i : Fin 28,
    (fun i => output92 i = raw92 (source92 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked92 : ∀ i : Fin 28, (fun i => output92 i = raw92 (source92 i)) i :=
  forallFin_of_zero_offset (fun i => output92 i = raw92 (source92 i)) sourceChecked92_0

theorem coverChecked92_0 : ∀ i : Fin 28,
    (fun i => (output92 (cover92 i)).ContainsBox (raw92 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked92 : ∀ i : Fin 28, (fun i => (output92 (cover92 i)).ContainsBox (raw92 i)) i :=
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

noncomputable def phaseMass92 : ℝ := singlePhaseMass (213482286/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw92 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass92_eq : phaseMass92 = (106741143/819200000000 : ℝ) := by
  unfold phaseMass92
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw92 output92 cover92 source92
    (gridTreeUnionCheck_sound 32768 raw92 output92 cover92 source92 tree92 checked92)
    _ (by norm_num) _, areaUnits92]
  norm_num

-- Frozen phase 3101, atom 1741, type 0, source (15,46).
def leavesData93 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves93 : Fin 4 → DyadicLeaf := leavesData93.get
def raw93 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 15 46 leaves93 i
def outputData93 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨3840,3968,11776,11904⟩) (.single ⟨3840,3968,11904,12032⟩)) (.node (.single ⟨3968,4096,11776,11904⟩) (.single ⟨3968,4096,11904,12032⟩))) (.node (.node (.single ⟨11776,11904,3840,3968⟩) (.single ⟨11776,11904,3968,4096⟩)) (.node (.single ⟨11904,12032,3840,3968⟩) (.single ⟨11904,12032,3968,4096⟩)))) (.node (.node (.node (.single ⟨20736,20864,28672,28800⟩) (.single ⟨20736,20864,28800,28928⟩)) (.node (.single ⟨20864,20992,28672,28800⟩) (.single ⟨20864,20992,28800,28928⟩))) (.node (.node (.single ⟨28672,28800,20736,20864⟩) (.single ⟨28672,28800,20864,20992⟩)) (.node (.single ⟨28800,28928,20736,20864⟩) (.single ⟨28800,28928,20864,20992⟩)))))
def output93 : Fin 16 → GridBox := outputData93.get
def coverData93 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData93 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover93 (i : Fin 16) : Fin 16 := ⟨coverData93.get i % 16, Nat.mod_lt _ (by decide)⟩
def source93 (i : Fin 16) : Fin 16 := ⟨sourceData93.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree93 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 .empty (.cutY 10240 .empty (.cutX 3072 .empty (.cutY 11264 .empty (.cutX 3584 .empty (.cutY 11776 .empty (.cutX 3840 .empty (.cutY 12032 (.cutX 3968 (.cutY 11904 .full .full) (.cutY 11904 .full .full)) .empty)))))))) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 .empty (.cutY 2048 .empty (.cutX 11264 .empty (.cutY 3072 .empty (.cutX 11776 .empty (.cutY 3584 .empty (.cutX 12032 (.cutY 3840 .empty (.cutX 11904 (.cutY 3968 .full .full) (.cutY 3968 .full .full))) .empty))))))) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 (.cutY 30720 (.cutX 21504 (.cutY 29696 (.cutX 20992 (.cutY 29184 (.cutX 20736 .empty (.cutY 28928 (.cutX 20864 (.cutY 28800 .full .full) (.cutY 28800 .full .full)) .empty)) .empty) .empty) .empty) .empty) .empty) .empty)))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 (.cutY 22528 (.cutX 29696 (.cutY 21504 (.cutX 29184 (.cutY 20992 (.cutX 28928 (.cutY 20736 .empty (.cutX 28800 (.cutY 20864 .full .full) (.cutY 20864 .full .full))) .empty) .empty) .empty) .empty) .empty) .empty) .empty))) .empty))))

theorem metadata93 : 0<296697202 ∧ 15<128 ∧ 46<128 ∧ 0<4 ∧
    1741/4160=0 ∧ 1741%4160=1741 ∧ ∀ i, (leaves93 i).Valid 8 := by
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

noncomputable def phaseMass93 : ℝ := singlePhaseMass (296697202/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw93 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass93_eq : phaseMass93 = (148348601/819200000000 : ℝ) := by
  unfold phaseMass93
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw93 output93 cover93 source93
    (gridTreeUnionCheck_sound 32768 raw93 output93 cover93 source93 tree93 checked93)
    _ (by norm_num) _, areaUnits93]
  norm_num

-- Frozen phase 3102, atom 4574, type 1, source (3,39).
def leavesData94 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves94 : Fin 4 → DyadicLeaf := leavesData94.get
def raw94 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 3 39 leaves94 i
def outputData94 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨768,896,9984,10112⟩) (.single ⟨768,896,10112,10240⟩)) (.node (.single ⟨896,1024,9984,10112⟩) (.single ⟨896,1024,10112,10240⟩))) (.node (.node (.single ⟨9984,10112,768,896⟩) (.single ⟨9984,10112,896,1024⟩)) (.node (.single ⟨10112,10240,768,896⟩) (.single ⟨10112,10240,896,1024⟩)))) (.node (.node (.node (.single ⟨22528,22656,31744,31872⟩) (.single ⟨22528,22656,31872,32000⟩)) (.node (.single ⟨22656,22784,31744,31872⟩) (.single ⟨22656,22784,31872,32000⟩))) (.node (.node (.single ⟨31744,31872,22528,22656⟩) (.single ⟨31744,31872,22656,22784⟩)) (.node (.single ⟨31872,32000,22528,22656⟩) (.single ⟨31872,32000,22656,22784⟩)))))
def output94 : Fin 16 → GridBox := outputData94.get
def coverData94 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData94 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover94 (i : Fin 16) : Fin 16 := ⟨coverData94.get i % 16, Nat.mod_lt _ (by decide)⟩
def source94 (i : Fin 16) : Fin 16 := ⟨sourceData94.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree94 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 (.cutY 10240 (.cutX 1024 (.cutY 9216 .empty (.cutX 512 .empty (.cutY 9728 .empty (.cutX 768 .empty (.cutY 9984 .empty (.cutX 896 (.cutY 10112 .full .full) (.cutY 10112 .full .full))))))) .empty) .empty) .empty) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 (.cutY 2048 (.cutX 9216 .empty (.cutY 1024 (.cutX 9728 .empty (.cutY 512 .empty (.cutX 9984 .empty (.cutY 768 .empty (.cutX 10112 (.cutY 896 .full .full) (.cutY 896 .full .full)))))) .empty)) .empty) .empty) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 .empty (.cutY 30720 .empty (.cutX 23552 (.cutY 31744 .empty (.cutX 23040 (.cutY 32256 (.cutX 22784 (.cutY 32000 (.cutX 22656 (.cutY 31872 .full .full) (.cutY 31872 .full .full)) .empty) .empty) .empty) .empty)) .empty)))))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 .empty (.cutY 22528 .empty (.cutX 31744 .empty (.cutY 23552 (.cutX 32256 (.cutY 23040 (.cutX 32000 (.cutY 22784 (.cutX 31872 (.cutY 22656 .full .full) (.cutY 22656 .full .full)) .empty) .empty) .empty) .empty) .empty)))))) .empty))))

theorem metadata94 : 0<475523442 ∧ 3<128 ∧ 39<128 ∧ 1<4 ∧
    4574/4160=1 ∧ 4574%4160=414 ∧ ∀ i, (leaves94 i).Valid 8 := by
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

noncomputable def phaseMass94 : ℝ := singlePhaseMass (475523442/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw94 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass94_eq : phaseMass94 = (237761721/819200000000 : ℝ) := by
  unfold phaseMass94
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw94 output94 cover94 source94
    (gridTreeUnionCheck_sound 32768 raw94 output94 cover94 source94 tree94 checked94)
    _ (by norm_num) _, areaUnits94]
  norm_num

-- Frozen phase 3103, atom 3722, type 0, source (43,67).
def leavesData95 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves95 : Fin 1 → DyadicLeaf := leavesData95.get
def raw95 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 43 67 leaves95 i
def outputData95 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨11008,11264,17152,17408⟩) (.single ⟨15360,15616,21504,21760⟩)) (.node (.single ⟨17152,17408,11008,11264⟩) (.single ⟨21504,21760,15360,15616⟩)))
def output95 : Fin 4 → GridBox := outputData95.get
def coverData95 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 2)) (.node (.single 3) (.single 1)))
def sourceData95 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 3)) (.node (.single 1) (.single 2)))
def cover95 (i : Fin 4) : Fin 4 := ⟨coverData95.get i % 4, Nat.mod_lt _ (by decide)⟩
def source95 (i : Fin 4) : Fin 4 := ⟨sourceData95.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree95 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 .empty (.cutY 18432 (.cutX 11264 (.cutY 17408 (.cutX 10752 .empty (.cutY 16896 .empty (.cutX 11008 .empty (.cutY 17152 .empty .full)))) .empty) .empty) .empty)) .empty) (.cutY 20480 .empty (.cutX 14336 .empty (.cutY 22528 (.cutX 15360 .empty (.cutY 21504 .empty (.cutX 15872 (.cutY 22016 (.cutX 15616 (.cutY 21760 .full .empty) .empty) .empty) .empty))) .empty)))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 (.cutY 10240 .empty (.cutX 17408 (.cutY 11264 (.cutX 16896 .empty (.cutY 10752 .empty (.cutX 17152 .empty (.cutY 11008 .empty .full)))) .empty) .empty)) .empty) .empty) (.cutY 12288 .empty (.cutX 22528 (.cutY 14336 .empty (.cutX 21504 .empty (.cutY 15360 .empty (.cutX 22016 (.cutY 15872 (.cutX 21760 (.cutY 15616 .full .empty) .empty) .empty) .empty)))) .empty)))) .empty) .empty))

theorem metadata95 : 0<20837145 ∧ 43<128 ∧ 67<128 ∧ 0<4 ∧
    3722/4160=0 ∧ 3722%4160=3722 ∧ ∀ i, (leaves95 i).Valid 8 := by
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

noncomputable def phaseMass95 : ℝ := singlePhaseMass (20837145/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw95 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass95_eq : phaseMass95 = (4167429/327680000000 : ℝ) := by
  unfold phaseMass95
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw95 output95 cover95 source95
    (gridTreeUnionCheck_sound 32768 raw95 output95 cover95 source95 tree95 checked95)
    _ (by norm_num) _, areaUnits95]
  norm_num

-- Frozen phase 3104, atom 7472, type 1, source (35,57).
def leavesData96 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves96 : Fin 7 → DyadicLeaf := leavesData96.get
def raw96 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 35 57 leaves96 i
def outputData96 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨8960,9088,14592,14720⟩) (.node (.single ⟨8960,9088,14720,14848⟩) (.single ⟨9088,9152,14592,14656⟩))) (.node (.node (.single ⟨9088,9152,14656,14720⟩) (.single ⟨9152,9216,14592,14656⟩)) (.node (.single ⟨9152,9216,14656,14720⟩) (.single ⟨9088,9216,14720,14848⟩)))) (.node (.node (.single ⟨14592,14720,8960,9088⟩) (.node (.single ⟨14592,14656,9088,9152⟩) (.single ⟨14592,14656,9152,9216⟩))) (.node (.node (.single ⟨14656,14720,9088,9152⟩) (.single ⟨14656,14720,9152,9216⟩)) (.node (.single ⟨14720,14848,8960,9088⟩) (.single ⟨14720,14848,9088,9216⟩))))) (.node (.node (.node (.single ⟨17920,18048,23552,23680⟩) (.node (.single ⟨17920,18048,23680,23808⟩) (.single ⟨18048,18112,23552,23616⟩))) (.node (.node (.single ⟨18048,18112,23616,23680⟩) (.single ⟨18112,18176,23552,23616⟩)) (.node (.single ⟨18112,18176,23616,23680⟩) (.single ⟨18048,18176,23680,23808⟩)))) (.node (.node (.single ⟨23552,23680,17920,18048⟩) (.node (.single ⟨23552,23616,18048,18112⟩) (.single ⟨23552,23616,18112,18176⟩))) (.node (.node (.single ⟨23616,23680,18048,18112⟩) (.single ⟨23616,23680,18112,18176⟩)) (.node (.single ⟨23680,23808,17920,18048⟩) (.single ⟨23680,23808,18048,18176⟩))))))
def output96 : Fin 28 → GridBox := outputData96.get
def coverData96 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData96 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover96 (i : Fin 28) : Fin 28 := ⟨coverData96.get i % 28, Nat.mod_lt _ (by decide)⟩
def source96 (i : Fin 28) : Fin 28 := ⟨sourceData96.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree96 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 (.cutY 14336 .empty (.cutX 9216 (.cutY 15360 (.cutX 8704 .empty (.cutY 14848 (.cutX 8960 .empty (.cutY 14592 .empty (.cutX 9088 (.cutY 14720 .full .full) (.cutY 14720 (.cutX 9152 (.cutY 14656 .full .full) (.cutY 14656 .full .full)) .full)))) .empty)) .empty) .empty)) .empty)) (.cutY 12288 (.cutX 14336 .empty (.cutY 10240 (.cutX 15360 (.cutY 9216 (.cutX 14848 (.cutY 8704 .empty (.cutX 14592 .empty (.cutY 8960 .empty (.cutX 14720 (.cutY 9088 .full (.cutX 14656 (.cutY 9152 .full .full) (.cutY 9152 .full .full))) (.cutY 9088 .full .full))))) .empty) .empty) .empty) .empty)) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 (.cutY 22528 .empty (.cutX 17408 .empty (.cutY 23552 .empty (.cutX 17920 .empty (.cutY 24064 (.cutX 18176 (.cutY 23808 (.cutX 18048 (.cutY 23680 .full .full) (.cutY 23680 (.cutX 18112 (.cutY 23616 .full .full) (.cutY 23616 .full .full)) .full)) .empty) .empty) .empty))))) .empty)) (.cutY 20480 (.cutX 22528 .empty (.cutY 18432 (.cutX 23552 .empty (.cutY 17408 .empty (.cutX 24064 (.cutY 17920 .empty (.cutX 23808 (.cutY 18176 (.cutX 23680 (.cutY 18048 .full (.cutX 23616 (.cutY 18112 .full .full) (.cutY 18112 .full .full))) (.cutY 18048 .full .full)) .empty) .empty)) .empty))) .empty)) .empty)) .empty) .empty)))

theorem metadata96 : 0<168966520 ∧ 35<128 ∧ 57<128 ∧ 1<4 ∧
    7472/4160=1 ∧ 7472%4160=3312 ∧ ∀ i, (leaves96 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData96).mp
    (by decide +kernel)

theorem sourceChecked96_0 : ∀ i : Fin 28,
    (fun i => output96 i = raw96 (source96 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked96 : ∀ i : Fin 28, (fun i => output96 i = raw96 (source96 i)) i :=
  forallFin_of_zero_offset (fun i => output96 i = raw96 (source96 i)) sourceChecked96_0

theorem coverChecked96_0 : ∀ i : Fin 28,
    (fun i => (output96 (cover96 i)).ContainsBox (raw96 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked96 : ∀ i : Fin 28, (fun i => (output96 (cover96 i)).ContainsBox (raw96 i)) i :=
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

noncomputable def phaseMass96 : ℝ := singlePhaseMass (168966520/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw96 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass96_eq : phaseMass96 = (4224163/40960000000 : ℝ) := by
  unfold phaseMass96
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw96 output96 cover96 source96
    (gridTreeUnionCheck_sound 32768 raw96 output96 cover96 source96 tree96 checked96)
    _ (by norm_num) _, areaUnits96]
  norm_num

-- Frozen phase 3105, atom 3535, type 0, source (39,64).
def leavesData97 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves97 : Fin 1 → DyadicLeaf := leavesData97.get
def raw97 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 39 64 leaves97 i
def outputData97 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨9984,10240,16384,16640⟩) (.single ⟨16128,16384,22528,22784⟩)) (.node (.single ⟨16384,16640,9984,10240⟩) (.single ⟨22528,22784,16128,16384⟩)))
def output97 : Fin 4 → GridBox := outputData97.get
def coverData97 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 2)) (.node (.single 3) (.single 1)))
def sourceData97 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 3)) (.node (.single 1) (.single 2)))
def cover97 (i : Fin 4) : Fin 4 := ⟨coverData97.get i % 4, Nat.mod_lt _ (by decide)⟩
def source97 (i : Fin 4) : Fin 4 := ⟨sourceData97.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree97 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 (.cutY 18432 (.cutX 9216 .empty (.cutY 17408 (.cutX 9728 .empty (.cutY 16896 (.cutX 9984 .empty (.cutY 16640 .full .empty)) .empty)) .empty)) .empty) .empty) .empty) (.cutY 20480 .empty (.cutX 14336 .empty (.cutY 22528 .empty (.cutX 15360 .empty (.cutY 23552 (.cutX 15872 .empty (.cutY 23040 (.cutX 16128 .empty (.cutY 22784 .full .empty)) .empty)) .empty)))))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 (.cutY 10240 (.cutX 17408 (.cutY 9216 .empty (.cutX 16896 (.cutY 9728 .empty (.cutX 16640 (.cutY 9984 .empty .full) .empty)) .empty)) .empty) .empty) .empty) .empty) (.cutY 12288 .empty (.cutX 22528 .empty (.cutY 14336 .empty (.cutX 23552 (.cutY 15360 .empty (.cutX 23040 (.cutY 15872 .empty (.cutX 22784 (.cutY 16128 .empty .full) .empty)) .empty)) .empty)))))) .empty) .empty))

theorem metadata97 : 0<167572778 ∧ 39<128 ∧ 64<128 ∧ 0<4 ∧
    3535/4160=0 ∧ 3535%4160=3535 ∧ ∀ i, (leaves97 i).Valid 8 := by
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

noncomputable def phaseMass97 : ℝ := singlePhaseMass (167572778/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw97 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass97_eq : phaseMass97 = (83786389/819200000000 : ℝ) := by
  unfold phaseMass97
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw97 output97 cover97 source97
    (gridTreeUnionCheck_sound 32768 raw97 output97 cover97 source97 tree97 checked97)
    _ (by norm_num) _, areaUnits97]
  norm_num

-- Frozen phase 3106, atom 3316, type 0, source (35,61).
def leavesData98 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves98 : Fin 1 → DyadicLeaf := leavesData98.get
def raw98 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 35 61 leaves98 i
def outputData98 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨8960,9216,15616,15872⟩) (.single ⟨15616,15872,8960,9216⟩)) (.node (.single ⟨16896,17152,23552,23808⟩) (.single ⟨23552,23808,16896,17152⟩)))
def output98 : Fin 4 → GridBox := outputData98.get
def coverData98 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData98 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover98 (i : Fin 4) : Fin 4 := ⟨coverData98.get i % 4, Nat.mod_lt _ (by decide)⟩
def source98 (i : Fin 4) : Fin 4 := ⟨sourceData98.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree98 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 (.cutY 14336 .empty (.cutX 9216 (.cutY 15360 .empty (.cutX 8704 .empty (.cutY 15872 (.cutX 8960 .empty (.cutY 15616 .empty .full)) .empty))) .empty)) .empty)) (.cutY 12288 (.cutX 14336 .empty (.cutY 10240 (.cutX 15360 .empty (.cutY 9216 (.cutX 15872 (.cutY 8704 .empty (.cutX 15616 .empty (.cutY 8960 .empty .full))) .empty) .empty)) .empty)) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 (.cutY 22528 .empty (.cutX 17408 (.cutY 23552 .empty (.cutX 16896 .empty (.cutY 24064 (.cutX 17152 (.cutY 23808 .full .empty) .empty) .empty))) .empty)) .empty)) (.cutY 20480 (.cutX 22528 .empty (.cutY 18432 (.cutX 23552 .empty (.cutY 17408 (.cutX 24064 (.cutY 16896 .empty (.cutX 23808 (.cutY 17152 .full .empty) .empty)) .empty) .empty)) .empty)) .empty)) .empty) .empty)))

theorem metadata98 : 0<200205545 ∧ 35<128 ∧ 61<128 ∧ 0<4 ∧
    3316/4160=0 ∧ 3316%4160=3316 ∧ ∀ i, (leaves98 i).Valid 8 := by
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

noncomputable def phaseMass98 : ℝ := singlePhaseMass (200205545/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw98 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass98_eq : phaseMass98 = (40041109/327680000000 : ℝ) := by
  unfold phaseMass98
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw98 output98 cover98 source98
    (gridTreeUnionCheck_sound 32768 raw98 output98 cover98 source98 tree98 checked98)
    _ (by norm_num) _, areaUnits98]
  norm_num

-- Frozen phase 3107, atom 2782, type 0, source (27,55).
def leavesData99 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves99 : Fin 1 → DyadicLeaf := leavesData99.get
def raw99 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 27 55 leaves99 i
def outputData99 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨6912,7168,14080,14336⟩) (.single ⟨14080,14336,6912,7168⟩)) (.node (.single ⟨18432,18688,25600,25856⟩) (.single ⟨25600,25856,18432,18688⟩)))
def output99 : Fin 4 → GridBox := outputData99.get
def coverData99 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData99 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover99 (i : Fin 4) : Fin 4 := ⟨coverData99.get i % 4, Nat.mod_lt _ (by decide)⟩
def source99 (i : Fin 4) : Fin 4 := ⟨sourceData99.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree99 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 .empty (.cutY 14336 (.cutX 7168 (.cutY 13312 .empty (.cutX 6656 .empty (.cutY 13824 .empty (.cutX 6912 .empty (.cutY 14080 .empty .full))))) .empty) .empty))))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 (.cutY 6144 .empty (.cutX 13312 .empty (.cutY 7168 (.cutX 13824 .empty (.cutY 6656 .empty (.cutX 14080 .empty (.cutY 6912 .empty .full)))) .empty))) .empty))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 .empty (.cutY 26624 (.cutX 19456 (.cutY 25600 .empty (.cutX 18944 (.cutY 26112 (.cutX 18688 (.cutY 25856 .full .empty) .empty) .empty) .empty)) .empty) .empty)) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 (.cutY 18432 .empty (.cutX 25600 .empty (.cutY 19456 (.cutX 26112 (.cutY 18944 (.cutX 25856 (.cutY 18688 .full .empty) .empty) .empty) .empty) .empty))) .empty) .empty) .empty) .empty))))

theorem metadata99 : 0<300263580 ∧ 27<128 ∧ 55<128 ∧ 0<4 ∧
    2782/4160=0 ∧ 2782%4160=2782 ∧ ∀ i, (leaves99 i).Valid 8 := by
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

noncomputable def phaseMass99 : ℝ := singlePhaseMass (300263580/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw99 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass99_eq : phaseMass99 = (15013179/81920000000 : ℝ) := by
  unfold phaseMass99
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw99 output99 cover99 source99
    (gridTreeUnionCheck_sound 32768 raw99 output99 cover99 source99 tree99 checked99)
    _ (by norm_num) _, areaUnits99]
  norm_num

-- Frozen phase 3108, atom 6451, type 1, source (21,44).
def leavesData100 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves100 : Fin 10 → DyadicLeaf := leavesData100.get
def raw100 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 21 44 leaves100 i
def outputData100 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨5376,5504,11264,11392⟩) (.single ⟨5376,5504,11392,11520⟩)) (.node (.single ⟨5504,5568,11264,11328⟩) (.node (.single ⟨5504,5568,11328,11392⟩) (.single ⟨5568,5600,11264,11296⟩)))) (.node (.node (.single ⟨5568,5600,11296,11328⟩) (.single ⟨5600,5632,11264,11296⟩)) (.node (.single ⟨5600,5632,11296,11328⟩) (.node (.single ⟨5568,5632,11328,11392⟩) (.single ⟨5504,5632,11392,11520⟩))))) (.node (.node (.node (.single ⟨11264,11392,5376,5504⟩) (.single ⟨11264,11328,5504,5568⟩)) (.node (.single ⟨11264,11296,5568,5600⟩) (.node (.single ⟨11264,11296,5600,5632⟩) (.single ⟨11296,11328,5568,5600⟩)))) (.node (.node (.single ⟨11296,11328,5600,5632⟩) (.single ⟨11328,11392,5504,5568⟩)) (.node (.single ⟨11328,11392,5568,5632⟩) (.node (.single ⟨11392,11520,5376,5504⟩) (.single ⟨11392,11520,5504,5632⟩)))))) (.node (.node (.node (.node (.single ⟨21248,21376,27136,27264⟩) (.single ⟨21248,21376,27264,27392⟩)) (.node (.single ⟨21376,21440,27136,27200⟩) (.node (.single ⟨21376,21440,27200,27264⟩) (.single ⟨21440,21472,27136,27168⟩)))) (.node (.node (.single ⟨21440,21472,27168,27200⟩) (.single ⟨21472,21504,27136,27168⟩)) (.node (.single ⟨21472,21504,27168,27200⟩) (.node (.single ⟨21440,21504,27200,27264⟩) (.single ⟨21376,21504,27264,27392⟩))))) (.node (.node (.node (.single ⟨27136,27264,21248,21376⟩) (.single ⟨27136,27200,21376,21440⟩)) (.node (.single ⟨27136,27168,21440,21472⟩) (.node (.single ⟨27136,27168,21472,21504⟩) (.single ⟨27168,27200,21440,21472⟩)))) (.node (.node (.single ⟨27168,27200,21472,21504⟩) (.single ⟨27200,27264,21376,21440⟩)) (.node (.single ⟨27200,27264,21440,21504⟩) (.node (.single ⟨27264,27392,21248,21376⟩) (.single ⟨27264,27392,21376,21504⟩)))))))
def output100 : Fin 40 → GridBox := outputData100.get
def coverData100 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 10)) (.node (.single 39) (.node (.single 29) (.single 1)))) (.node (.node (.single 18) (.single 38)) (.node (.single 21) (.node (.single 9) (.single 19))))) (.node (.node (.node (.single 30) (.single 20)) (.node (.single 2) (.node (.single 11) (.single 37)))) (.node (.node (.single 28) (.single 3)) (.node (.single 16) (.node (.single 36) (.single 23)))))) (.node (.node (.node (.node (.single 8) (.single 17)) (.node (.single 31) (.node (.single 22) (.single 4)))) (.node (.node (.single 12) (.single 35)) (.node (.single 27) (.node (.single 5) (.single 14))))) (.node (.node (.node (.single 34) (.single 25)) (.node (.single 6) (.node (.single 13) (.single 33)))) (.node (.node (.single 26) (.single 7)) (.node (.single 15) (.node (.single 32) (.single 24)))))))
def sourceData100 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9)))))) (.node (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover100 (i : Fin 40) : Fin 40 := ⟨coverData100.get i % 40, Nat.mod_lt _ (by decide)⟩
def source100 (i : Fin 40) : Fin 40 := ⟨sourceData100.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree100 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 (.cutY 10240 .empty (.cutX 5120 .empty (.cutY 11264 .empty (.cutX 5632 (.cutY 11776 (.cutX 5376 .empty (.cutY 11520 (.cutX 5504 (.cutY 11392 .full .full) (.cutY 11392 (.cutX 5568 (.cutY 11328 .full .full) (.cutY 11328 (.cutX 5600 (.cutY 11296 .full .full) (.cutY 11296 .full .full)) .full)) .full)) .empty)) .empty) .empty)))) .empty) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 .empty (.cutY 6144 (.cutX 11264 .empty (.cutY 5120 .empty (.cutX 11776 (.cutY 5632 (.cutX 11520 (.cutY 5376 .empty (.cutX 11392 (.cutY 5504 .full (.cutX 11328 (.cutY 5568 .full (.cutX 11296 (.cutY 5600 .full .full) (.cutY 5600 .full .full))) (.cutY 5568 .full .full))) (.cutY 5504 .full .full))) .empty) .empty) .empty))) .empty))) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 (.cutY 26624 .empty (.cutX 21504 (.cutY 27648 (.cutX 20992 .empty (.cutY 27136 .empty (.cutX 21248 .empty (.cutY 27392 (.cutX 21376 (.cutY 27264 .full .full) (.cutY 27264 (.cutX 21440 (.cutY 27200 .full .full) (.cutY 27200 (.cutX 21472 (.cutY 27168 .full .full) (.cutY 27168 .full .full)) .full)) .full)) .empty)))) .empty) .empty)) .empty) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 .empty (.cutY 22528 (.cutX 27648 (.cutY 21504 (.cutX 27136 .empty (.cutY 20992 .empty (.cutX 27392 (.cutY 21248 .empty (.cutX 27264 (.cutY 21376 .full (.cutX 27200 (.cutY 21440 .full (.cutX 27168 (.cutY 21472 .full .full) (.cutY 21472 .full .full))) (.cutY 21440 .full .full))) (.cutY 21376 .full .full))) .empty))) .empty) .empty) .empty))) .empty) .empty))))

theorem metadata100 : 0<22259151 ∧ 21<128 ∧ 44<128 ∧ 1<4 ∧
    6451/4160=1 ∧ 6451%4160=2291 ∧ ∀ i, (leaves100 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData100).mp
    (by decide +kernel)

theorem sourceChecked100_0 : ∀ i : Fin 40,
    (fun i => output100 i = raw100 (source100 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked100 : ∀ i : Fin 40, (fun i => output100 i = raw100 (source100 i)) i :=
  forallFin_of_zero_offset (fun i => output100 i = raw100 (source100 i)) sourceChecked100_0

theorem coverChecked100_0 : ∀ i : Fin 40,
    (fun i => (output100 (cover100 i)).ContainsBox (raw100 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked100 : ∀ i : Fin 40, (fun i => (output100 (cover100 i)).ContainsBox (raw100 i)) i :=
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

noncomputable def phaseMass100 : ℝ := singlePhaseMass (22259151/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw100 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass100_eq : phaseMass100 = (22259151/1638400000000 : ℝ) := by
  unfold phaseMass100
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw100 output100 cover100 source100
    (gridTreeUnionCheck_sound 32768 raw100 output100 cover100 source100 tree100 checked100)
    _ (by norm_num) _, areaUnits100]
  norm_num

-- Frozen phase 3109, atom 3912, type 0, source (48,72).
def leavesData101 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves101 : Fin 1 → DyadicLeaf := leavesData101.get
def raw101 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 48 72 leaves101 i
def outputData101 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨12288,12544,18432,18688⟩) (.single ⟨14080,14336,20224,20480⟩)) (.node (.single ⟨18432,18688,12288,12544⟩) (.single ⟨20224,20480,14080,14336⟩)))
def output101 : Fin 4 → GridBox := outputData101.get
def coverData101 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 2)) (.node (.single 3) (.single 1)))
def sourceData101 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 3)) (.node (.single 1) (.single 2)))
def cover101 (i : Fin 4) : Fin 4 := ⟨coverData101.get i % 4, Nat.mod_lt _ (by decide)⟩
def source101 (i : Fin 4) : Fin 4 := ⟨sourceData101.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree101 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 .empty (.cutY 20480 (.cutX 14336 (.cutY 18432 .empty (.cutX 13312 (.cutY 19456 (.cutX 12800 (.cutY 18944 (.cutX 12544 (.cutY 18688 .full .empty) .empty) .empty) .empty) .empty) (.cutY 19456 .empty (.cutX 13824 .empty (.cutY 19968 .empty (.cutX 14080 .empty (.cutY 20224 .empty .full))))))) .empty) .empty)) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 .empty (.cutX 18432 .empty (.cutY 14336 (.cutX 19456 (.cutY 13312 (.cutX 18944 (.cutY 12800 (.cutX 18688 (.cutY 12544 .full .empty) .empty) .empty) .empty) .empty) (.cutY 13312 .empty (.cutX 19968 .empty (.cutY 13824 .empty (.cutX 20224 .empty (.cutY 14080 .empty .full)))))) .empty))) .empty)) .empty) .empty))

theorem metadata101 : 0<76472504 ∧ 48<128 ∧ 72<128 ∧ 0<4 ∧
    3912/4160=0 ∧ 3912%4160=3912 ∧ ∀ i, (leaves101 i).Valid 8 := by
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

noncomputable def phaseMass101 : ℝ := singlePhaseMass (76472504/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw101 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass101_eq : phaseMass101 = (9559063/204800000000 : ℝ) := by
  unfold phaseMass101
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw101 output101 cover101 source101
    (gridTreeUnionCheck_sound 32768 raw101 output101 cover101 source101 tree101 checked101)
    _ (by norm_num) _, areaUnits101]
  norm_num

-- Frozen phase 3110, atom 3878, type 0, source (47,71).
def leavesData102 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves102 : Fin 1 → DyadicLeaf := leavesData102.get
def raw102 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 47 71 leaves102 i
def outputData102 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨12032,12288,18176,18432⟩) (.single ⟨14336,14592,20480,20736⟩)) (.node (.single ⟨18176,18432,12032,12288⟩) (.single ⟨20480,20736,14336,14592⟩)))
def output102 : Fin 4 → GridBox := outputData102.get
def coverData102 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 2)) (.node (.single 3) (.single 1)))
def sourceData102 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 3)) (.node (.single 1) (.single 2)))
def cover102 (i : Fin 4) : Fin 4 := ⟨coverData102.get i % 4, Nat.mod_lt _ (by decide)⟩
def source102 (i : Fin 4) : Fin 4 := ⟨sourceData102.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree102 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 .empty (.cutY 18432 (.cutX 11264 .empty (.cutY 17408 .empty (.cutX 11776 .empty (.cutY 17920 .empty (.cutX 12032 .empty (.cutY 18176 .empty .full)))))) .empty)) .empty) (.cutY 20480 .empty (.cutX 14336 .empty (.cutY 22528 (.cutX 15360 (.cutY 21504 (.cutX 14848 (.cutY 20992 (.cutX 14592 (.cutY 20736 .full .empty) .empty) .empty) .empty) .empty) .empty) .empty)))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 (.cutY 10240 .empty (.cutX 17408 .empty (.cutY 11264 .empty (.cutX 17920 .empty (.cutY 11776 .empty (.cutX 18176 .empty (.cutY 12032 .empty .full))))))) .empty) .empty) (.cutY 12288 .empty (.cutX 22528 (.cutY 14336 .empty (.cutX 21504 (.cutY 15360 (.cutX 20992 (.cutY 14848 (.cutX 20736 (.cutY 14592 .full .empty) .empty) .empty) .empty) .empty) .empty)) .empty)))) .empty) .empty))

theorem metadata102 : 0<20837145 ∧ 47<128 ∧ 71<128 ∧ 0<4 ∧
    3878/4160=0 ∧ 3878%4160=3878 ∧ ∀ i, (leaves102 i).Valid 8 := by
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

noncomputable def phaseMass102 : ℝ := singlePhaseMass (20837145/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw102 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass102_eq : phaseMass102 = (4167429/327680000000 : ℝ) := by
  unfold phaseMass102
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw102 output102 cover102 source102
    (gridTreeUnionCheck_sound 32768 raw102 output102 cover102 source102 tree102 checked102)
    _ (by norm_num) _, areaUnits102]
  norm_num

-- Frozen phase 3111, atom 8100, type 1, source (49,69).
def leavesData103 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves103 : Fin 7 → DyadicLeaf := leavesData103.get
def raw103 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 49 69 leaves103 i
def outputData103 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨12544,12672,17664,17792⟩) (.node (.single ⟨12544,12672,17792,17920⟩) (.single ⟨12672,12736,17664,17728⟩))) (.node (.node (.single ⟨12672,12736,17728,17792⟩) (.single ⟨12736,12800,17664,17728⟩)) (.node (.single ⟨12736,12800,17728,17792⟩) (.single ⟨12672,12800,17792,17920⟩)))) (.node (.node (.single ⟨14848,14976,19968,20096⟩) (.node (.single ⟨14848,14976,20096,20224⟩) (.single ⟨14976,15040,19968,20032⟩))) (.node (.node (.single ⟨14976,15040,20032,20096⟩) (.single ⟨15040,15104,19968,20032⟩)) (.node (.single ⟨15040,15104,20032,20096⟩) (.single ⟨14976,15104,20096,20224⟩))))) (.node (.node (.node (.single ⟨17664,17792,12544,12672⟩) (.node (.single ⟨17664,17728,12672,12736⟩) (.single ⟨17664,17728,12736,12800⟩))) (.node (.node (.single ⟨17728,17792,12672,12736⟩) (.single ⟨17728,17792,12736,12800⟩)) (.node (.single ⟨17792,17920,12544,12672⟩) (.single ⟨17792,17920,12672,12800⟩)))) (.node (.node (.single ⟨19968,20096,14848,14976⟩) (.node (.single ⟨19968,20032,14976,15040⟩) (.single ⟨19968,20032,15040,15104⟩))) (.node (.node (.single ⟨20032,20096,14976,15040⟩) (.single ⟨20032,20096,15040,15104⟩)) (.node (.single ⟨20096,20224,14848,14976⟩) (.single ⟨20096,20224,14976,15104⟩))))))
def output103 : Fin 28 → GridBox := outputData103.get
def coverData103 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData103 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover103 (i : Fin 28) : Fin 28 := ⟨coverData103.get i % 28, Nat.mod_lt _ (by decide)⟩
def source103 (i : Fin 28) : Fin 28 := ⟨sourceData103.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree103 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 .empty (.cutY 20480 (.cutX 14336 (.cutY 18432 (.cutX 13312 (.cutY 17408 .empty (.cutX 12800 (.cutY 17920 (.cutX 12544 .empty (.cutY 17664 .empty (.cutX 12672 (.cutY 17792 .full .full) (.cutY 17792 (.cutX 12736 (.cutY 17728 .full .full) (.cutY 17728 .full .full)) .full)))) .empty) .empty)) .empty) .empty) (.cutY 18432 .empty (.cutX 15360 (.cutY 19456 .empty (.cutX 14848 .empty (.cutY 19968 .empty (.cutX 15104 (.cutY 20224 (.cutX 14976 (.cutY 20096 .full .full) (.cutY 20096 (.cutX 15040 (.cutY 20032 .full .full) (.cutY 20032 .full .full)) .full)) .empty) .empty)))) .empty))) .empty)) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 .empty (.cutX 18432 (.cutY 14336 (.cutX 17408 .empty (.cutY 13312 (.cutX 17920 (.cutY 12800 (.cutX 17664 .empty (.cutY 12544 .empty (.cutX 17792 (.cutY 12672 .full (.cutX 17728 (.cutY 12736 .full .full) (.cutY 12736 .full .full))) (.cutY 12672 .full .full)))) .empty) .empty) .empty)) .empty) (.cutY 14336 .empty (.cutX 19456 .empty (.cutY 15360 (.cutX 19968 .empty (.cutY 14848 .empty (.cutX 20224 (.cutY 15104 (.cutX 20096 (.cutY 14976 .full (.cutX 20032 (.cutY 15040 .full .full) (.cutY 15040 .full .full))) (.cutY 14976 .full .full)) .empty) .empty))) .empty))))) .empty)) .empty) .empty))

theorem metadata103 : 0<111439132 ∧ 49<128 ∧ 69<128 ∧ 1<4 ∧
    8100/4160=1 ∧ 8100%4160=3940 ∧ ∀ i, (leaves103 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData103).mp
    (by decide +kernel)

theorem sourceChecked103_0 : ∀ i : Fin 28,
    (fun i => output103 i = raw103 (source103 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked103 : ∀ i : Fin 28, (fun i => output103 i = raw103 (source103 i)) i :=
  forallFin_of_zero_offset (fun i => output103 i = raw103 (source103 i)) sourceChecked103_0

theorem coverChecked103_0 : ∀ i : Fin 28,
    (fun i => (output103 (cover103 i)).ContainsBox (raw103 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked103 : ∀ i : Fin 28, (fun i => (output103 (cover103 i)).ContainsBox (raw103 i)) i :=
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

noncomputable def phaseMass103 : ℝ := singlePhaseMass (111439132/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw103 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass103_eq : phaseMass103 = (27859783/409600000000 : ℝ) := by
  unfold phaseMass103
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw103 output103 cover103 source103
    (gridTreeUnionCheck_sound 32768 raw103 output103 cover103 source103 tree103 checked103)
    _ (by norm_num) _, areaUnits103]
  norm_num

-- Frozen phase 3112, atom 8130, type 1, source (50,70).
def leavesData104 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves104 : Fin 7 → DyadicLeaf := leavesData104.get
def raw104 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 50 70 leaves104 i
def outputData104 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨12800,12928,17920,18048⟩) (.node (.single ⟨12800,12928,18048,18176⟩) (.single ⟨12928,12992,17920,17984⟩))) (.node (.node (.single ⟨12928,12992,17984,18048⟩) (.single ⟨12992,13056,17920,17984⟩)) (.node (.single ⟨12992,13056,17984,18048⟩) (.single ⟨12928,13056,18048,18176⟩)))) (.node (.node (.single ⟨14592,14720,19712,19840⟩) (.node (.single ⟨14592,14720,19840,19968⟩) (.single ⟨14720,14784,19712,19776⟩))) (.node (.node (.single ⟨14720,14784,19776,19840⟩) (.single ⟨14784,14848,19712,19776⟩)) (.node (.single ⟨14784,14848,19776,19840⟩) (.single ⟨14720,14848,19840,19968⟩))))) (.node (.node (.node (.single ⟨17920,18048,12800,12928⟩) (.node (.single ⟨17920,17984,12928,12992⟩) (.single ⟨17920,17984,12992,13056⟩))) (.node (.node (.single ⟨17984,18048,12928,12992⟩) (.single ⟨17984,18048,12992,13056⟩)) (.node (.single ⟨18048,18176,12800,12928⟩) (.single ⟨18048,18176,12928,13056⟩)))) (.node (.node (.single ⟨19712,19840,14592,14720⟩) (.node (.single ⟨19712,19776,14720,14784⟩) (.single ⟨19712,19776,14784,14848⟩))) (.node (.node (.single ⟨19776,19840,14720,14784⟩) (.single ⟨19776,19840,14784,14848⟩)) (.node (.single ⟨19840,19968,14592,14720⟩) (.single ⟨19840,19968,14720,14848⟩))))))
def output104 : Fin 28 → GridBox := outputData104.get
def coverData104 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData104 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover104 (i : Fin 28) : Fin 28 := ⟨coverData104.get i % 28, Nat.mod_lt _ (by decide)⟩
def source104 (i : Fin 28) : Fin 28 := ⟨sourceData104.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree104 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 .empty (.cutY 20480 (.cutX 14336 (.cutY 18432 (.cutX 13312 (.cutY 17408 .empty (.cutX 12800 .empty (.cutY 17920 .empty (.cutX 13056 (.cutY 18176 (.cutX 12928 (.cutY 18048 .full .full) (.cutY 18048 (.cutX 12992 (.cutY 17984 .full .full) (.cutY 17984 .full .full)) .full)) .empty) .empty)))) .empty) .empty) (.cutY 18432 .empty (.cutX 15360 (.cutY 19456 .empty (.cutX 14848 (.cutY 19968 (.cutX 14592 .empty (.cutY 19712 .empty (.cutX 14720 (.cutY 19840 .full .full) (.cutY 19840 (.cutX 14784 (.cutY 19776 .full .full) (.cutY 19776 .full .full)) .full)))) .empty) .empty)) .empty))) .empty)) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 .empty (.cutX 18432 (.cutY 14336 (.cutX 17408 .empty (.cutY 13312 (.cutX 17920 .empty (.cutY 12800 .empty (.cutX 18176 (.cutY 13056 (.cutX 18048 (.cutY 12928 .full (.cutX 17984 (.cutY 12992 .full .full) (.cutY 12992 .full .full))) (.cutY 12928 .full .full)) .empty) .empty))) .empty)) .empty) (.cutY 14336 .empty (.cutX 19456 .empty (.cutY 15360 (.cutX 19968 (.cutY 14848 (.cutX 19712 .empty (.cutY 14592 .empty (.cutX 19840 (.cutY 14720 .full (.cutX 19776 (.cutY 14784 .full .full) (.cutY 14784 .full .full))) (.cutY 14720 .full .full)))) .empty) .empty) .empty))))) .empty)) .empty) .empty))

theorem metadata104 : 0<111439132 ∧ 50<128 ∧ 70<128 ∧ 1<4 ∧
    8130/4160=1 ∧ 8130%4160=3970 ∧ ∀ i, (leaves104 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData104).mp
    (by decide +kernel)

theorem sourceChecked104_0 : ∀ i : Fin 28,
    (fun i => output104 i = raw104 (source104 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked104 : ∀ i : Fin 28, (fun i => output104 i = raw104 (source104 i)) i :=
  forallFin_of_zero_offset (fun i => output104 i = raw104 (source104 i)) sourceChecked104_0

theorem coverChecked104_0 : ∀ i : Fin 28,
    (fun i => (output104 (cover104 i)).ContainsBox (raw104 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked104 : ∀ i : Fin 28, (fun i => (output104 (cover104 i)).ContainsBox (raw104 i)) i :=
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

noncomputable def phaseMass104 : ℝ := singlePhaseMass (111439132/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw104 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass104_eq : phaseMass104 = (27859783/409600000000 : ℝ) := by
  unfold phaseMass104
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw104 output104 cover104 source104
    (gridTreeUnionCheck_sound 32768 raw104 output104 cover104 source104 tree104 checked104)
    _ (by norm_num) _, areaUnits104]
  norm_num

-- Frozen phase 3113, atom 8068, type 1, source (48,68).
def leavesData105 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves105 : Fin 7 → DyadicLeaf := leavesData105.get
def raw105 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 48 68 leaves105 i
def outputData105 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨12288,12416,17408,17536⟩) (.node (.single ⟨12288,12416,17536,17664⟩) (.single ⟨12416,12480,17408,17472⟩))) (.node (.node (.single ⟨12416,12480,17472,17536⟩) (.single ⟨12480,12544,17408,17472⟩)) (.node (.single ⟨12480,12544,17472,17536⟩) (.single ⟨12416,12544,17536,17664⟩)))) (.node (.node (.single ⟨15104,15232,20224,20352⟩) (.node (.single ⟨15104,15232,20352,20480⟩) (.single ⟨15232,15296,20224,20288⟩))) (.node (.node (.single ⟨15232,15296,20288,20352⟩) (.single ⟨15296,15360,20224,20288⟩)) (.node (.single ⟨15296,15360,20288,20352⟩) (.single ⟨15232,15360,20352,20480⟩))))) (.node (.node (.node (.single ⟨17408,17536,12288,12416⟩) (.node (.single ⟨17408,17472,12416,12480⟩) (.single ⟨17408,17472,12480,12544⟩))) (.node (.node (.single ⟨17472,17536,12416,12480⟩) (.single ⟨17472,17536,12480,12544⟩)) (.node (.single ⟨17536,17664,12288,12416⟩) (.single ⟨17536,17664,12416,12544⟩)))) (.node (.node (.single ⟨20224,20352,15104,15232⟩) (.node (.single ⟨20224,20288,15232,15296⟩) (.single ⟨20224,20288,15296,15360⟩))) (.node (.node (.single ⟨20288,20352,15232,15296⟩) (.single ⟨20288,20352,15296,15360⟩)) (.node (.single ⟨20352,20480,15104,15232⟩) (.single ⟨20352,20480,15232,15360⟩))))))
def output105 : Fin 28 → GridBox := outputData105.get
def coverData105 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData105 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover105 (i : Fin 28) : Fin 28 := ⟨coverData105.get i % 28, Nat.mod_lt _ (by decide)⟩
def source105 (i : Fin 28) : Fin 28 := ⟨sourceData105.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree105 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 .empty (.cutY 20480 (.cutX 14336 (.cutY 18432 (.cutX 13312 (.cutY 17408 .empty (.cutX 12800 (.cutY 17920 (.cutX 12544 (.cutY 17664 (.cutX 12416 (.cutY 17536 .full .full) (.cutY 17536 (.cutX 12480 (.cutY 17472 .full .full) (.cutY 17472 .full .full)) .full)) .empty) .empty) .empty) .empty)) .empty) .empty) (.cutY 18432 .empty (.cutX 15360 (.cutY 19456 .empty (.cutX 14848 .empty (.cutY 19968 .empty (.cutX 15104 .empty (.cutY 20224 .empty (.cutX 15232 (.cutY 20352 .full .full) (.cutY 20352 (.cutX 15296 (.cutY 20288 .full .full) (.cutY 20288 .full .full)) .full))))))) .empty))) .empty)) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 .empty (.cutX 18432 (.cutY 14336 (.cutX 17408 .empty (.cutY 13312 (.cutX 17920 (.cutY 12800 (.cutX 17664 (.cutY 12544 (.cutX 17536 (.cutY 12416 .full (.cutX 17472 (.cutY 12480 .full .full) (.cutY 12480 .full .full))) (.cutY 12416 .full .full)) .empty) .empty) .empty) .empty) .empty)) .empty) (.cutY 14336 .empty (.cutX 19456 .empty (.cutY 15360 (.cutX 19968 .empty (.cutY 14848 .empty (.cutX 20224 .empty (.cutY 15104 .empty (.cutX 20352 (.cutY 15232 .full (.cutX 20288 (.cutY 15296 .full .full) (.cutY 15296 .full .full))) (.cutY 15232 .full .full)))))) .empty))))) .empty)) .empty) .empty))

theorem metadata105 : 0<111439132 ∧ 48<128 ∧ 68<128 ∧ 1<4 ∧
    8068/4160=1 ∧ 8068%4160=3908 ∧ ∀ i, (leaves105 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData105).mp
    (by decide +kernel)

theorem sourceChecked105_0 : ∀ i : Fin 28,
    (fun i => output105 i = raw105 (source105 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked105 : ∀ i : Fin 28, (fun i => output105 i = raw105 (source105 i)) i :=
  forallFin_of_zero_offset (fun i => output105 i = raw105 (source105 i)) sourceChecked105_0

theorem coverChecked105_0 : ∀ i : Fin 28,
    (fun i => (output105 (cover105 i)).ContainsBox (raw105 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked105 : ∀ i : Fin 28, (fun i => (output105 (cover105 i)).ContainsBox (raw105 i)) i :=
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

noncomputable def phaseMass105 : ℝ := singlePhaseMass (111439132/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw105 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass105_eq : phaseMass105 = (27859783/409600000000 : ℝ) := by
  unfold phaseMass105
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw105 output105 cover105 source105
    (gridTreeUnionCheck_sound 32768 raw105 output105 cover105 source105 tree105 checked105)
    _ (by norm_num) _, areaUnits105]
  norm_num

-- Frozen phase 3114, atom 8158, type 1, source (51,71).
def leavesData106 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves106 : Fin 7 → DyadicLeaf := leavesData106.get
def raw106 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 51 71 leaves106 i
def outputData106 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨13056,13184,18176,18304⟩) (.node (.single ⟨13056,13184,18304,18432⟩) (.single ⟨13184,13248,18176,18240⟩))) (.node (.node (.single ⟨13184,13248,18240,18304⟩) (.single ⟨13248,13312,18176,18240⟩)) (.node (.single ⟨13248,13312,18240,18304⟩) (.single ⟨13184,13312,18304,18432⟩)))) (.node (.node (.single ⟨14336,14464,19456,19584⟩) (.node (.single ⟨14336,14464,19584,19712⟩) (.single ⟨14464,14528,19456,19520⟩))) (.node (.node (.single ⟨14464,14528,19520,19584⟩) (.single ⟨14528,14592,19456,19520⟩)) (.node (.single ⟨14528,14592,19520,19584⟩) (.single ⟨14464,14592,19584,19712⟩))))) (.node (.node (.node (.single ⟨18176,18304,13056,13184⟩) (.node (.single ⟨18176,18240,13184,13248⟩) (.single ⟨18176,18240,13248,13312⟩))) (.node (.node (.single ⟨18240,18304,13184,13248⟩) (.single ⟨18240,18304,13248,13312⟩)) (.node (.single ⟨18304,18432,13056,13184⟩) (.single ⟨18304,18432,13184,13312⟩)))) (.node (.node (.single ⟨19456,19584,14336,14464⟩) (.node (.single ⟨19456,19520,14464,14528⟩) (.single ⟨19456,19520,14528,14592⟩))) (.node (.node (.single ⟨19520,19584,14464,14528⟩) (.single ⟨19520,19584,14528,14592⟩)) (.node (.single ⟨19584,19712,14336,14464⟩) (.single ⟨19584,19712,14464,14592⟩))))))
def output106 : Fin 28 → GridBox := outputData106.get
def coverData106 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData106 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover106 (i : Fin 28) : Fin 28 := ⟨coverData106.get i % 28, Nat.mod_lt _ (by decide)⟩
def source106 (i : Fin 28) : Fin 28 := ⟨sourceData106.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree106 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 .empty (.cutY 20480 (.cutX 14336 (.cutY 18432 (.cutX 13312 (.cutY 17408 .empty (.cutX 12800 .empty (.cutY 17920 .empty (.cutX 13056 .empty (.cutY 18176 .empty (.cutX 13184 (.cutY 18304 .full .full) (.cutY 18304 (.cutX 13248 (.cutY 18240 .full .full) (.cutY 18240 .full .full)) .full))))))) .empty) .empty) (.cutY 18432 .empty (.cutX 15360 (.cutY 19456 .empty (.cutX 14848 (.cutY 19968 (.cutX 14592 (.cutY 19712 (.cutX 14464 (.cutY 19584 .full .full) (.cutY 19584 (.cutX 14528 (.cutY 19520 .full .full) (.cutY 19520 .full .full)) .full)) .empty) .empty) .empty) .empty)) .empty))) .empty)) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 .empty (.cutX 18432 (.cutY 14336 (.cutX 17408 .empty (.cutY 13312 (.cutX 17920 .empty (.cutY 12800 .empty (.cutX 18176 .empty (.cutY 13056 .empty (.cutX 18304 (.cutY 13184 .full (.cutX 18240 (.cutY 13248 .full .full) (.cutY 13248 .full .full))) (.cutY 13184 .full .full)))))) .empty)) .empty) (.cutY 14336 .empty (.cutX 19456 .empty (.cutY 15360 (.cutX 19968 (.cutY 14848 (.cutX 19712 (.cutY 14592 (.cutX 19584 (.cutY 14464 .full (.cutX 19520 (.cutY 14528 .full .full) (.cutY 14528 .full .full))) (.cutY 14464 .full .full)) .empty) .empty) .empty) .empty) .empty))))) .empty)) .empty) .empty))

theorem metadata106 : 0<111439132 ∧ 51<128 ∧ 71<128 ∧ 1<4 ∧
    8158/4160=1 ∧ 8158%4160=3998 ∧ ∀ i, (leaves106 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData106).mp
    (by decide +kernel)

theorem sourceChecked106_0 : ∀ i : Fin 28,
    (fun i => output106 i = raw106 (source106 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked106 : ∀ i : Fin 28, (fun i => output106 i = raw106 (source106 i)) i :=
  forallFin_of_zero_offset (fun i => output106 i = raw106 (source106 i)) sourceChecked106_0

theorem coverChecked106_0 : ∀ i : Fin 28,
    (fun i => (output106 (cover106 i)).ContainsBox (raw106 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked106 : ∀ i : Fin 28, (fun i => (output106 (cover106 i)).ContainsBox (raw106 i)) i :=
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

noncomputable def phaseMass106 : ℝ := singlePhaseMass (111439132/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw106 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass106_eq : phaseMass106 = (27859783/409600000000 : ℝ) := by
  unfold phaseMass106
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw106 output106 cover106 source106
    (gridTreeUnionCheck_sound 32768 raw106 output106 cover106 source106 tree106 checked106)
    _ (by norm_num) _, areaUnits106]
  norm_num

-- Frozen phase 3115, atom 6537, type 1, source (22,45).
def leavesData107 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves107 : Fin 10 → DyadicLeaf := leavesData107.get
def raw107 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 22 45 leaves107 i
def outputData107 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨5632,5760,11520,11648⟩) (.single ⟨5632,5760,11648,11776⟩)) (.node (.single ⟨5760,5824,11520,11584⟩) (.node (.single ⟨5760,5824,11584,11648⟩) (.single ⟨5824,5856,11520,11552⟩)))) (.node (.node (.single ⟨5824,5856,11552,11584⟩) (.single ⟨5856,5888,11520,11552⟩)) (.node (.single ⟨5856,5888,11552,11584⟩) (.node (.single ⟨5824,5888,11584,11648⟩) (.single ⟨5760,5888,11648,11776⟩))))) (.node (.node (.node (.single ⟨11520,11648,5632,5760⟩) (.single ⟨11520,11584,5760,5824⟩)) (.node (.single ⟨11520,11552,5824,5856⟩) (.node (.single ⟨11520,11552,5856,5888⟩) (.single ⟨11552,11584,5824,5856⟩)))) (.node (.node (.single ⟨11552,11584,5856,5888⟩) (.single ⟨11584,11648,5760,5824⟩)) (.node (.single ⟨11584,11648,5824,5888⟩) (.node (.single ⟨11648,11776,5632,5760⟩) (.single ⟨11648,11776,5760,5888⟩)))))) (.node (.node (.node (.node (.single ⟨20992,21120,26880,27008⟩) (.single ⟨20992,21120,27008,27136⟩)) (.node (.single ⟨21120,21184,26880,26944⟩) (.node (.single ⟨21120,21184,26944,27008⟩) (.single ⟨21184,21216,26880,26912⟩)))) (.node (.node (.single ⟨21184,21216,26912,26944⟩) (.single ⟨21216,21248,26880,26912⟩)) (.node (.single ⟨21216,21248,26912,26944⟩) (.node (.single ⟨21184,21248,26944,27008⟩) (.single ⟨21120,21248,27008,27136⟩))))) (.node (.node (.node (.single ⟨26880,27008,20992,21120⟩) (.single ⟨26880,26944,21120,21184⟩)) (.node (.single ⟨26880,26912,21184,21216⟩) (.node (.single ⟨26880,26912,21216,21248⟩) (.single ⟨26912,26944,21184,21216⟩)))) (.node (.node (.single ⟨26912,26944,21216,21248⟩) (.single ⟨26944,27008,21120,21184⟩)) (.node (.single ⟨26944,27008,21184,21248⟩) (.node (.single ⟨27008,27136,20992,21120⟩) (.single ⟨27008,27136,21120,21248⟩)))))))
def output107 : Fin 40 → GridBox := outputData107.get
def coverData107 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 10)) (.node (.single 39) (.node (.single 29) (.single 1)))) (.node (.node (.single 18) (.single 38)) (.node (.single 21) (.node (.single 9) (.single 19))))) (.node (.node (.node (.single 30) (.single 20)) (.node (.single 2) (.node (.single 11) (.single 37)))) (.node (.node (.single 28) (.single 3)) (.node (.single 16) (.node (.single 36) (.single 23)))))) (.node (.node (.node (.node (.single 8) (.single 17)) (.node (.single 31) (.node (.single 22) (.single 4)))) (.node (.node (.single 12) (.single 35)) (.node (.single 27) (.node (.single 5) (.single 14))))) (.node (.node (.node (.single 34) (.single 25)) (.node (.single 6) (.node (.single 13) (.single 33)))) (.node (.node (.single 26) (.single 7)) (.node (.single 15) (.node (.single 32) (.single 24)))))))
def sourceData107 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9)))))) (.node (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover107 (i : Fin 40) : Fin 40 := ⟨coverData107.get i % 40, Nat.mod_lt _ (by decide)⟩
def source107 (i : Fin 40) : Fin 40 := ⟨sourceData107.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree107 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 (.cutY 10240 .empty (.cutX 5120 .empty (.cutY 11264 .empty (.cutX 5632 .empty (.cutY 11776 (.cutX 5888 (.cutY 11520 .empty (.cutX 5760 (.cutY 11648 .full .full) (.cutY 11648 (.cutX 5824 (.cutY 11584 .full .full) (.cutY 11584 (.cutX 5856 (.cutY 11552 .full .full) (.cutY 11552 .full .full)) .full)) .full))) .empty) .empty))))) .empty) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 .empty (.cutY 6144 (.cutX 11264 .empty (.cutY 5120 .empty (.cutX 11776 (.cutY 5632 .empty (.cutX 11520 .empty (.cutY 5888 (.cutX 11648 (.cutY 5760 .full (.cutX 11584 (.cutY 5824 .full (.cutX 11552 (.cutY 5856 .full .full) (.cutY 5856 .full .full))) (.cutY 5824 .full .full))) (.cutY 5760 .full .full)) .empty))) .empty))) .empty))) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 (.cutY 26624 .empty (.cutX 21504 (.cutY 27648 (.cutX 20992 .empty (.cutY 27136 (.cutX 21248 (.cutY 26880 .empty (.cutX 21120 (.cutY 27008 .full .full) (.cutY 27008 (.cutX 21184 (.cutY 26944 .full .full) (.cutY 26944 (.cutX 21216 (.cutY 26912 .full .full) (.cutY 26912 .full .full)) .full)) .full))) .empty) .empty)) .empty) .empty)) .empty) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 .empty (.cutY 22528 (.cutX 27648 (.cutY 21504 (.cutX 27136 (.cutY 20992 .empty (.cutX 26880 .empty (.cutY 21248 (.cutX 27008 (.cutY 21120 .full (.cutX 26944 (.cutY 21184 .full (.cutX 26912 (.cutY 21216 .full .full) (.cutY 21216 .full .full))) (.cutY 21184 .full .full))) (.cutY 21120 .full .full)) .empty))) .empty) .empty) .empty) .empty))) .empty) .empty))))

theorem metadata107 : 0<22259151 ∧ 22<128 ∧ 45<128 ∧ 1<4 ∧
    6537/4160=1 ∧ 6537%4160=2377 ∧ ∀ i, (leaves107 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData107).mp
    (by decide +kernel)

theorem sourceChecked107_0 : ∀ i : Fin 40,
    (fun i => output107 i = raw107 (source107 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked107 : ∀ i : Fin 40, (fun i => output107 i = raw107 (source107 i)) i :=
  forallFin_of_zero_offset (fun i => output107 i = raw107 (source107 i)) sourceChecked107_0

theorem coverChecked107_0 : ∀ i : Fin 40,
    (fun i => (output107 (cover107 i)).ContainsBox (raw107 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked107 : ∀ i : Fin 40, (fun i => (output107 (cover107 i)).ContainsBox (raw107 i)) i :=
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

noncomputable def phaseMass107 : ℝ := singlePhaseMass (22259151/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw107 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass107_eq : phaseMass107 = (22259151/1638400000000 : ℝ) := by
  unfold phaseMass107
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw107 output107 cover107 source107
    (gridTreeUnionCheck_sound 32768 raw107 output107 cover107 source107 tree107 checked107)
    _ (by norm_num) _, areaUnits107]
  norm_num

-- Frozen phase 3116, atom 5896, type 1, source (15,41).
def leavesData108 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩))) (.node (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩)))) (.node (.node (.node (.single ⟨3,4,0⟩) (.single ⟨3,4,1⟩)) (.node (.single ⟨3,5,0⟩) (.single ⟨3,5,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves108 : Fin 16 → DyadicLeaf := leavesData108.get
def raw108 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 15 41 leaves108 i
def outputData108 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨3840,3904,10496,10560⟩) (.single ⟨3840,3904,10560,10624⟩)) (.node (.single ⟨3904,3968,10496,10560⟩) (.single ⟨3904,3968,10560,10624⟩))) (.node (.node (.single ⟨3840,3968,10624,10752⟩) (.single ⟨3968,4000,10496,10528⟩)) (.node (.single ⟨3968,4000,10528,10560⟩) (.single ⟨4000,4032,10496,10528⟩)))) (.node (.node (.node (.single ⟨4000,4032,10528,10560⟩) (.single ⟨3968,4032,10560,10624⟩)) (.node (.single ⟨4032,4064,10496,10528⟩) (.single ⟨4032,4064,10528,10560⟩))) (.node (.node (.single ⟨4064,4096,10496,10528⟩) (.single ⟨4064,4096,10528,10560⟩)) (.node (.single ⟨4032,4096,10560,10624⟩) (.single ⟨3968,4096,10624,10752⟩))))) (.node (.node (.node (.node (.single ⟨10496,10560,3840,3904⟩) (.single ⟨10496,10560,3904,3968⟩)) (.node (.single ⟨10560,10624,3840,3904⟩) (.single ⟨10560,10624,3904,3968⟩))) (.node (.node (.single ⟨10496,10528,3968,4000⟩) (.single ⟨10496,10528,4000,4032⟩)) (.node (.single ⟨10528,10560,3968,4000⟩) (.single ⟨10528,10560,4000,4032⟩)))) (.node (.node (.node (.single ⟨10496,10528,4032,4064⟩) (.single ⟨10496,10528,4064,4096⟩)) (.node (.single ⟨10528,10560,4032,4064⟩) (.single ⟨10528,10560,4064,4096⟩))) (.node (.node (.single ⟨10560,10624,3968,4032⟩) (.single ⟨10560,10624,4032,4096⟩)) (.node (.single ⟨10624,10752,3840,3968⟩) (.single ⟨10624,10752,3968,4096⟩)))))) (.node (.node (.node (.node (.node (.single ⟨22016,22144,28672,28800⟩) (.single ⟨22016,22144,28800,28928⟩)) (.node (.single ⟨22144,22208,28672,28736⟩) (.single ⟨22144,22208,28736,28800⟩))) (.node (.node (.single ⟨22208,22240,28672,28704⟩) (.single ⟨22208,22240,28704,28736⟩)) (.node (.single ⟨22240,22272,28672,28704⟩) (.single ⟨22240,22272,28704,28736⟩)))) (.node (.node (.node (.single ⟨22208,22240,28736,28768⟩) (.single ⟨22208,22240,28768,28800⟩)) (.node (.single ⟨22240,22272,28736,28768⟩) (.single ⟨22240,22272,28768,28800⟩))) (.node (.node (.single ⟨22144,22208,28800,28864⟩) (.single ⟨22144,22208,28864,28928⟩)) (.node (.single ⟨22208,22272,28800,28864⟩) (.single ⟨22208,22272,28864,28928⟩))))) (.node (.node (.node (.node (.single ⟨28672,28800,22016,22144⟩) (.single ⟨28672,28736,22144,22208⟩)) (.node (.single ⟨28672,28704,22208,22240⟩) (.single ⟨28672,28704,22240,22272⟩))) (.node (.node (.single ⟨28704,28736,22208,22240⟩) (.single ⟨28704,28736,22240,22272⟩)) (.node (.single ⟨28736,28800,22144,22208⟩) (.single ⟨28736,28768,22208,22240⟩)))) (.node (.node (.node (.single ⟨28736,28768,22240,22272⟩) (.single ⟨28768,28800,22208,22240⟩)) (.node (.single ⟨28768,28800,22240,22272⟩) (.single ⟨28800,28928,22016,22144⟩))) (.node (.node (.single ⟨28800,28864,22144,22208⟩) (.single ⟨28800,28864,22208,22272⟩)) (.node (.single ⟨28864,28928,22144,22208⟩) (.single ⟨28864,28928,22208,22272⟩)))))))
def output108 : Fin 64 → GridBox := outputData108.get
def coverData108 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 30)) (.node (.single 59) (.single 33))) (.node (.node (.single 15) (.single 31)) (.node (.single 48) (.single 32)))) (.node (.node (.node (.single 0) (.single 16)) (.node (.single 63) (.single 47))) (.node (.node (.single 1) (.single 18)) (.node (.single 62) (.single 45))))) (.node (.node (.node (.node (.single 2) (.single 17)) (.node (.single 61) (.single 46))) (.node (.node (.single 3) (.single 19)) (.node (.single 60) (.single 44)))) (.node (.node (.node (.single 9) (.single 28)) (.node (.single 54) (.single 35))) (.node (.node (.single 14) (.single 29)) (.node (.single 49) (.single 34)))))) (.node (.node (.node (.node (.node (.single 5) (.single 20)) (.node (.single 58) (.single 43))) (.node (.node (.single 6) (.single 22)) (.node (.single 57) (.single 41)))) (.node (.node (.node (.single 7) (.single 21)) (.node (.single 56) (.single 42))) (.node (.node (.single 8) (.single 23)) (.node (.single 55) (.single 40))))) (.node (.node (.node (.node (.single 10) (.single 24)) (.node (.single 53) (.single 39))) (.node (.node (.single 11) (.single 26)) (.node (.single 52) (.single 37)))) (.node (.node (.node (.single 12) (.single 25)) (.node (.single 51) (.single 38))) (.node (.node (.single 13) (.single 27)) (.node (.single 50) (.single 36)))))))
def sourceData108 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.single 20))) (.node (.node (.single 0) (.single 32)) (.node (.single 36) (.single 40)))) (.node (.node (.node (.single 44) (.single 24)) (.node (.single 48) (.single 52))) (.node (.node (.single 56) (.single 60)) (.node (.single 28) (.single 4))))) (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.single 21))) (.node (.node (.single 33) (.single 41)) (.node (.single 37) (.single 45)))) (.node (.node (.node (.single 49) (.single 57)) (.node (.single 53) (.single 61))) (.node (.node (.single 25) (.single 29)) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.node (.single 7) (.single 3)) (.node (.single 31) (.single 27))) (.node (.node (.single 63) (.single 55)) (.node (.single 59) (.single 51)))) (.node (.node (.node (.single 47) (.single 39)) (.node (.single 43) (.single 35))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11))))) (.node (.node (.node (.node (.single 6) (.single 30)) (.node (.single 62) (.single 58))) (.node (.node (.single 54) (.single 50)) (.node (.single 26) (.single 46)))) (.node (.node (.node (.single 42) (.single 38)) (.node (.single 34) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover108 (i : Fin 64) : Fin 64 := ⟨coverData108.get i % 64, Nat.mod_lt _ (by decide)⟩
def source108 (i : Fin 64) : Fin 64 := ⟨sourceData108.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree108 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 .empty (.cutY 10240 .empty (.cutX 3072 .empty (.cutY 11264 (.cutX 3584 .empty (.cutY 10752 (.cutX 3840 .empty (.cutY 10496 .empty (.cutX 3968 (.cutY 10624 (.cutX 3904 (.cutY 10560 .full .full) (.cutY 10560 .full .full)) .full) (.cutY 10624 (.cutX 4032 (.cutY 10560 (.cutX 4000 (.cutY 10528 .full .full) (.cutY 10528 .full .full)) .full) (.cutY 10560 (.cutX 4064 (.cutY 10528 .full .full) (.cutY 10528 .full .full)) .full)) .full)))) .empty)) .empty)))) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 .empty (.cutY 2048 .empty (.cutX 11264 (.cutY 3072 .empty (.cutX 10752 (.cutY 3584 .empty (.cutX 10496 .empty (.cutY 3840 .empty (.cutX 10624 (.cutY 3968 (.cutX 10560 (.cutY 3904 .full .full) (.cutY 3904 .full .full)) (.cutX 10560 (.cutY 4032 (.cutX 10528 (.cutY 4000 .full .full) (.cutY 4000 .full .full)) (.cutX 10528 (.cutY 4064 .full .full) (.cutY 4064 .full .full))) (.cutY 4032 .full .full))) (.cutY 3968 .full .full))))) .empty)) .empty))) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 (.cutY 30720 (.cutX 21504 .empty (.cutY 29696 (.cutX 22016 .empty (.cutY 29184 (.cutX 22272 (.cutY 28928 (.cutX 22144 (.cutY 28800 .full .full) (.cutY 28800 (.cutX 22208 (.cutY 28736 .full .full) (.cutY 28736 (.cutX 22240 (.cutY 28704 .full .full) (.cutY 28704 .full .full)) (.cutX 22240 (.cutY 28768 .full .full) (.cutY 28768 .full .full)))) (.cutX 22208 (.cutY 28864 .full .full) (.cutY 28864 .full .full)))) .empty) .empty) .empty)) .empty)) .empty) .empty)))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 (.cutY 22528 (.cutX 29696 (.cutY 21504 .empty (.cutX 29184 (.cutY 22016 .empty (.cutX 28928 (.cutY 22272 (.cutX 28800 (.cutY 22144 .full (.cutX 28736 (.cutY 22208 .full (.cutX 28704 (.cutY 22240 .full .full) (.cutY 22240 .full .full))) (.cutY 22208 .full (.cutX 28768 (.cutY 22240 .full .full) (.cutY 22240 .full .full))))) (.cutY 22144 .full (.cutX 28864 (.cutY 22208 .full .full) (.cutY 22208 .full .full)))) .empty) .empty)) .empty)) .empty) .empty) .empty))) .empty))))

theorem metadata108 : 0<213482286 ∧ 15<128 ∧ 41<128 ∧ 1<4 ∧
    5896/4160=1 ∧ 5896%4160=1736 ∧ ∀ i, (leaves108 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData108).mp
    (by decide +kernel)

theorem sourceChecked108_0 : ∀ i : Fin 64,
    (fun i => output108 i = raw108 (source108 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked108 : ∀ i : Fin 64, (fun i => output108 i = raw108 (source108 i)) i :=
  forallFin_of_zero_offset (fun i => output108 i = raw108 (source108 i)) sourceChecked108_0

theorem coverChecked108_0 : ∀ i : Fin 64,
    (fun i => (output108 (cover108 i)).ContainsBox (raw108 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked108 : ∀ i : Fin 64, (fun i => (output108 (cover108 i)).ContainsBox (raw108 i)) i :=
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

noncomputable def phaseMass108 : ℝ := singlePhaseMass (213482286/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw108 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass108_eq : phaseMass108 = (106741143/819200000000 : ℝ) := by
  unfold phaseMass108
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw108 output108 cover108 source108
    (gridTreeUnionCheck_sound 32768 raw108 output108 cover108 source108 tree108 checked108)
    _ (by norm_num) _, areaUnits108]
  norm_num

-- Frozen phase 3117, atom 5797, type 1, source (14,41).
def leavesData109 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves109 : Fin 7 → DyadicLeaf := leavesData109.get
def raw109 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 14 41 leaves109 i
def outputData109 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3584,3712,10496,10624⟩) (.node (.single ⟨3584,3712,10624,10752⟩) (.single ⟨3712,3776,10496,10560⟩))) (.node (.node (.single ⟨3712,3776,10560,10624⟩) (.single ⟨3776,3840,10496,10560⟩)) (.node (.single ⟨3776,3840,10560,10624⟩) (.single ⟨3712,3840,10624,10752⟩)))) (.node (.node (.single ⟨10496,10624,3584,3712⟩) (.node (.single ⟨10496,10560,3712,3776⟩) (.single ⟨10496,10560,3776,3840⟩))) (.node (.node (.single ⟨10560,10624,3712,3776⟩) (.single ⟨10560,10624,3776,3840⟩)) (.node (.single ⟨10624,10752,3584,3712⟩) (.single ⟨10624,10752,3712,3840⟩))))) (.node (.node (.node (.single ⟨22016,22144,28928,29056⟩) (.node (.single ⟨22016,22144,29056,29184⟩) (.single ⟨22144,22208,28928,28992⟩))) (.node (.node (.single ⟨22144,22208,28992,29056⟩) (.single ⟨22208,22272,28928,28992⟩)) (.node (.single ⟨22208,22272,28992,29056⟩) (.single ⟨22144,22272,29056,29184⟩)))) (.node (.node (.single ⟨28928,29056,22016,22144⟩) (.node (.single ⟨28928,28992,22144,22208⟩) (.single ⟨28928,28992,22208,22272⟩))) (.node (.node (.single ⟨28992,29056,22144,22208⟩) (.single ⟨28992,29056,22208,22272⟩)) (.node (.single ⟨29056,29184,22016,22144⟩) (.single ⟨29056,29184,22144,22272⟩))))))
def output109 : Fin 28 → GridBox := outputData109.get
def coverData109 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData109 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover109 (i : Fin 28) : Fin 28 := ⟨coverData109.get i % 28, Nat.mod_lt _ (by decide)⟩
def source109 (i : Fin 28) : Fin 28 := ⟨sourceData109.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree109 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 .empty (.cutY 10240 .empty (.cutX 3072 .empty (.cutY 11264 (.cutX 3584 .empty (.cutY 10752 (.cutX 3840 (.cutY 10496 .empty (.cutX 3712 (.cutY 10624 .full .full) (.cutY 10624 (.cutX 3776 (.cutY 10560 .full .full) (.cutY 10560 .full .full)) .full))) .empty) .empty)) .empty)))) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 .empty (.cutY 2048 .empty (.cutX 11264 (.cutY 3072 .empty (.cutX 10752 (.cutY 3584 .empty (.cutX 10496 .empty (.cutY 3840 (.cutX 10624 (.cutY 3712 .full (.cutX 10560 (.cutY 3776 .full .full) (.cutY 3776 .full .full))) (.cutY 3712 .full .full)) .empty))) .empty)) .empty))) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 (.cutY 30720 (.cutX 21504 .empty (.cutY 29696 (.cutX 22016 .empty (.cutY 29184 (.cutX 22272 (.cutY 28928 .empty (.cutX 22144 (.cutY 29056 .full .full) (.cutY 29056 (.cutX 22208 (.cutY 28992 .full .full) (.cutY 28992 .full .full)) .full))) .empty) .empty)) .empty)) .empty) .empty)))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 (.cutY 22528 (.cutX 29696 (.cutY 21504 .empty (.cutX 29184 (.cutY 22016 .empty (.cutX 28928 .empty (.cutY 22272 (.cutX 29056 (.cutY 22144 .full (.cutX 28992 (.cutY 22208 .full .full) (.cutY 22208 .full .full))) (.cutY 22144 .full .full)) .empty))) .empty)) .empty) .empty) .empty))) .empty))))

theorem metadata109 : 0<213482286 ∧ 14<128 ∧ 41<128 ∧ 1<4 ∧
    5797/4160=1 ∧ 5797%4160=1637 ∧ ∀ i, (leaves109 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData109).mp
    (by decide +kernel)

theorem sourceChecked109_0 : ∀ i : Fin 28,
    (fun i => output109 i = raw109 (source109 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked109 : ∀ i : Fin 28, (fun i => output109 i = raw109 (source109 i)) i :=
  forallFin_of_zero_offset (fun i => output109 i = raw109 (source109 i)) sourceChecked109_0

theorem coverChecked109_0 : ∀ i : Fin 28,
    (fun i => (output109 (cover109 i)).ContainsBox (raw109 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked109 : ∀ i : Fin 28, (fun i => (output109 (cover109 i)).ContainsBox (raw109 i)) i :=
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

noncomputable def phaseMass109 : ℝ := singlePhaseMass (213482286/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw109 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass109_eq : phaseMass109 = (106741143/819200000000 : ℝ) := by
  unfold phaseMass109
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw109 output109 cover109 source109
    (gridTreeUnionCheck_sound 32768 raw109 output109 cover109 source109 tree109 checked109)
    _ (by norm_num) _, areaUnits109]
  norm_num

-- Frozen phase 3118, atom 5993, type 1, source (16,41).
def leavesData110 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩)))) (.node (.node (.node (.single ⟨3,0,0⟩) (.single ⟨3,0,1⟩)) (.node (.single ⟨3,1,0⟩) (.single ⟨3,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves110 : Fin 16 → DyadicLeaf := leavesData110.get
def raw110 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 16 41 leaves110 i
def outputData110 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨4096,4128,10496,10528⟩) (.single ⟨4096,4128,10528,10560⟩)) (.node (.single ⟨4128,4160,10496,10528⟩) (.single ⟨4128,4160,10528,10560⟩))) (.node (.node (.single ⟨4096,4160,10560,10624⟩) (.single ⟨4160,4224,10496,10560⟩)) (.node (.single ⟨4160,4224,10560,10624⟩) (.single ⟨4096,4224,10624,10752⟩)))) (.node (.node (.node (.single ⟨4224,4288,10496,10560⟩) (.single ⟨4224,4288,10560,10624⟩)) (.node (.single ⟨4288,4320,10496,10528⟩) (.single ⟨4288,4320,10528,10560⟩))) (.node (.node (.single ⟨4320,4352,10496,10528⟩) (.single ⟨4320,4352,10528,10560⟩)) (.node (.single ⟨4288,4352,10560,10624⟩) (.single ⟨4224,4352,10624,10752⟩))))) (.node (.node (.node (.node (.single ⟨10496,10528,4096,4128⟩) (.single ⟨10496,10528,4128,4160⟩)) (.node (.single ⟨10528,10560,4096,4128⟩) (.single ⟨10528,10560,4128,4160⟩))) (.node (.node (.single ⟨10496,10560,4160,4224⟩) (.single ⟨10560,10624,4096,4160⟩)) (.node (.single ⟨10560,10624,4160,4224⟩) (.single ⟨10496,10560,4224,4288⟩)))) (.node (.node (.node (.single ⟨10496,10528,4288,4320⟩) (.single ⟨10496,10528,4320,4352⟩)) (.node (.single ⟨10528,10560,4288,4320⟩) (.single ⟨10528,10560,4320,4352⟩))) (.node (.node (.single ⟨10560,10624,4224,4288⟩) (.single ⟨10560,10624,4288,4352⟩)) (.node (.single ⟨10624,10752,4096,4224⟩) (.single ⟨10624,10752,4224,4352⟩)))))) (.node (.node (.node (.node (.node (.single ⟨22016,22144,28416,28544⟩) (.single ⟨22016,22144,28544,28672⟩)) (.node (.single ⟨22144,22208,28416,28480⟩) (.single ⟨22144,22208,28480,28544⟩))) (.node (.node (.single ⟨22208,22240,28416,28448⟩) (.single ⟨22208,22240,28448,28480⟩)) (.node (.single ⟨22240,22272,28416,28448⟩) (.single ⟨22240,22272,28448,28480⟩)))) (.node (.node (.node (.single ⟨22208,22272,28480,28544⟩) (.single ⟨22144,22208,28544,28608⟩)) (.node (.single ⟨22144,22208,28608,28672⟩) (.single ⟨22208,22272,28544,28608⟩))) (.node (.node (.single ⟨22208,22240,28608,28640⟩) (.single ⟨22208,22240,28640,28672⟩)) (.node (.single ⟨22240,22272,28608,28640⟩) (.single ⟨22240,22272,28640,28672⟩))))) (.node (.node (.node (.node (.single ⟨28416,28544,22016,22144⟩) (.single ⟨28416,28480,22144,22208⟩)) (.node (.single ⟨28416,28448,22208,22240⟩) (.single ⟨28416,28448,22240,22272⟩))) (.node (.node (.single ⟨28448,28480,22208,22240⟩) (.single ⟨28448,28480,22240,22272⟩)) (.node (.single ⟨28480,28544,22144,22208⟩) (.single ⟨28480,28544,22208,22272⟩)))) (.node (.node (.node (.single ⟨28544,28672,22016,22144⟩) (.single ⟨28544,28608,22144,22208⟩)) (.node (.single ⟨28544,28608,22208,22272⟩) (.single ⟨28608,28672,22144,22208⟩))) (.node (.node (.single ⟨28608,28640,22208,22240⟩) (.single ⟨28608,28640,22240,22272⟩)) (.node (.single ⟨28640,28672,22208,22240⟩) (.single ⟨28640,28672,22240,22272⟩)))))))
def output110 : Fin 64 → GridBox := outputData110.get
def coverData110 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 7) (.single 30)) (.node (.single 56) (.single 33))) (.node (.node (.single 15) (.single 31)) (.node (.single 48) (.single 32)))) (.node (.node (.node (.single 4) (.single 21)) (.node (.single 59) (.single 42))) (.node (.node (.single 5) (.single 20)) (.node (.single 58) (.single 43))))) (.node (.node (.node (.node (.single 6) (.single 22)) (.node (.single 57) (.single 41))) (.node (.node (.single 8) (.single 23)) (.node (.single 55) (.single 40)))) (.node (.node (.node (.single 9) (.single 28)) (.node (.single 54) (.single 35))) (.node (.node (.single 14) (.single 29)) (.node (.single 49) (.single 34)))))) (.node (.node (.node (.node (.node (.single 0) (.single 16)) (.node (.single 63) (.single 47))) (.node (.node (.single 1) (.single 18)) (.node (.single 62) (.single 45)))) (.node (.node (.node (.single 2) (.single 17)) (.node (.single 61) (.single 46))) (.node (.node (.single 3) (.single 19)) (.node (.single 60) (.single 44))))) (.node (.node (.node (.node (.single 10) (.single 24)) (.node (.single 53) (.single 39))) (.node (.node (.single 11) (.single 26)) (.node (.single 52) (.single 37)))) (.node (.node (.node (.single 12) (.single 25)) (.node (.single 51) (.single 38))) (.node (.node (.single 13) (.single 27)) (.node (.single 50) (.single 36)))))))
def sourceData110 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 32) (.single 36)) (.node (.single 40) (.single 44))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.single 0)))) (.node (.node (.node (.single 20) (.single 24)) (.node (.single 48) (.single 52))) (.node (.node (.single 56) (.single 60)) (.node (.single 28) (.single 4))))) (.node (.node (.node (.node (.single 33) (.single 41)) (.node (.single 37) (.single 45))) (.node (.node (.single 13) (.single 9)) (.node (.single 17) (.single 21)))) (.node (.node (.node (.single 49) (.single 57)) (.node (.single 53) (.single 61))) (.node (.node (.single 25) (.single 29)) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.node (.single 7) (.single 3)) (.node (.single 31) (.single 27))) (.node (.node (.single 63) (.single 55)) (.node (.single 59) (.single 51)))) (.node (.node (.node (.single 23) (.single 19)) (.node (.single 11) (.single 15))) (.node (.node (.single 47) (.single 39)) (.node (.single 43) (.single 35))))) (.node (.node (.node (.node (.single 6) (.single 30)) (.node (.single 62) (.single 58))) (.node (.node (.single 54) (.single 50)) (.node (.single 26) (.single 22)))) (.node (.node (.node (.single 2) (.single 18)) (.node (.single 14) (.single 10))) (.node (.node (.single 46) (.single 42)) (.node (.single 38) (.single 34)))))))
def cover110 (i : Fin 64) : Fin 64 := ⟨coverData110.get i % 64, Nat.mod_lt _ (by decide)⟩
def source110 (i : Fin 64) : Fin 64 := ⟨sourceData110.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree110 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 (.cutY 10240 .empty (.cutX 5120 (.cutY 11264 (.cutX 4608 (.cutY 10752 (.cutX 4352 (.cutY 10496 .empty (.cutX 4224 (.cutY 10624 (.cutX 4160 (.cutY 10560 (.cutX 4128 (.cutY 10528 .full .full) (.cutY 10528 .full .full)) .full) (.cutY 10560 .full .full)) .full) (.cutY 10624 (.cutX 4288 (.cutY 10560 .full .full) (.cutY 10560 (.cutX 4320 (.cutY 10528 .full .full) (.cutY 10528 .full .full)) .full)) .full))) .empty) .empty) .empty) .empty) .empty)) .empty) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 .empty (.cutY 6144 (.cutX 11264 (.cutY 5120 (.cutX 10752 (.cutY 4608 (.cutX 10496 .empty (.cutY 4352 (.cutX 10624 (.cutY 4224 (.cutX 10560 (.cutY 4160 (.cutX 10528 (.cutY 4128 .full .full) (.cutY 4128 .full .full)) .full) (.cutY 4160 .full .full)) (.cutX 10560 (.cutY 4288 .full (.cutX 10528 (.cutY 4320 .full .full) (.cutY 4320 .full .full))) (.cutY 4288 .full .full))) (.cutY 4224 .full .full)) .empty)) .empty) .empty) .empty) .empty) .empty))) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 (.cutY 26624 .empty (.cutX 21504 .empty (.cutY 27648 .empty (.cutX 22016 .empty (.cutY 28160 .empty (.cutX 22272 (.cutY 28416 .empty (.cutX 22144 (.cutY 28544 .full .full) (.cutY 28544 (.cutX 22208 (.cutY 28480 .full .full) (.cutY 28480 (.cutX 22240 (.cutY 28448 .full .full) (.cutY 28448 .full .full)) .full)) (.cutX 22208 (.cutY 28608 .full .full) (.cutY 28608 .full (.cutX 22240 (.cutY 28640 .full .full) (.cutY 28640 .full .full))))))) .empty)))))) .empty) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 .empty (.cutY 22528 (.cutX 27648 .empty (.cutY 21504 .empty (.cutX 28160 .empty (.cutY 22016 .empty (.cutX 28416 .empty (.cutY 22272 (.cutX 28544 (.cutY 22144 .full (.cutX 28480 (.cutY 22208 .full (.cutX 28448 (.cutY 22240 .full .full) (.cutY 22240 .full .full))) (.cutY 22208 .full .full))) (.cutY 22144 .full (.cutX 28608 (.cutY 22208 .full .full) (.cutY 22208 .full (.cutX 28640 (.cutY 22240 .full .full) (.cutY 22240 .full .full)))))) .empty)))))) .empty))) .empty) .empty))))

theorem metadata110 : 0<22259151 ∧ 16<128 ∧ 41<128 ∧ 1<4 ∧
    5993/4160=1 ∧ 5993%4160=1833 ∧ ∀ i, (leaves110 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData110).mp
    (by decide +kernel)

theorem sourceChecked110_0 : ∀ i : Fin 64,
    (fun i => output110 i = raw110 (source110 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked110 : ∀ i : Fin 64, (fun i => output110 i = raw110 (source110 i)) i :=
  forallFin_of_zero_offset (fun i => output110 i = raw110 (source110 i)) sourceChecked110_0

theorem coverChecked110_0 : ∀ i : Fin 64,
    (fun i => (output110 (cover110 i)).ContainsBox (raw110 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked110 : ∀ i : Fin 64, (fun i => (output110 (cover110 i)).ContainsBox (raw110 i)) i :=
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

noncomputable def phaseMass110 : ℝ := singlePhaseMass (22259151/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw110 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass110_eq : phaseMass110 = (22259151/1638400000000 : ℝ) := by
  unfold phaseMass110
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw110 output110 cover110 source110
    (gridTreeUnionCheck_sound 32768 raw110 output110 cover110 source110 tree110 checked110)
    _ (by norm_num) _, areaUnits110]
  norm_num

-- Frozen phase 3119, atom 8184, type 1, source (52,72).
def leavesData111 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves111 : Fin 7 → DyadicLeaf := leavesData111.get
def raw111 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 52 72 leaves111 i
def outputData111 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨13312,13440,18432,18560⟩) (.node (.single ⟨13312,13440,18560,18688⟩) (.single ⟨13440,13504,18432,18496⟩))) (.node (.node (.single ⟨13440,13504,18496,18560⟩) (.single ⟨13504,13568,18432,18496⟩)) (.node (.single ⟨13504,13568,18496,18560⟩) (.single ⟨13440,13568,18560,18688⟩)))) (.node (.node (.single ⟨14080,14208,19200,19328⟩) (.node (.single ⟨14080,14208,19328,19456⟩) (.single ⟨14208,14272,19200,19264⟩))) (.node (.node (.single ⟨14208,14272,19264,19328⟩) (.single ⟨14272,14336,19200,19264⟩)) (.node (.single ⟨14272,14336,19264,19328⟩) (.single ⟨14208,14336,19328,19456⟩))))) (.node (.node (.node (.single ⟨18432,18560,13312,13440⟩) (.node (.single ⟨18432,18496,13440,13504⟩) (.single ⟨18432,18496,13504,13568⟩))) (.node (.node (.single ⟨18496,18560,13440,13504⟩) (.single ⟨18496,18560,13504,13568⟩)) (.node (.single ⟨18560,18688,13312,13440⟩) (.single ⟨18560,18688,13440,13568⟩)))) (.node (.node (.single ⟨19200,19328,14080,14208⟩) (.node (.single ⟨19200,19264,14208,14272⟩) (.single ⟨19200,19264,14272,14336⟩))) (.node (.node (.single ⟨19264,19328,14208,14272⟩) (.single ⟨19264,19328,14272,14336⟩)) (.node (.single ⟨19328,19456,14080,14208⟩) (.single ⟨19328,19456,14208,14336⟩))))))
def output111 : Fin 28 → GridBox := outputData111.get
def coverData111 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData111 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover111 (i : Fin 28) : Fin 28 := ⟨coverData111.get i % 28, Nat.mod_lt _ (by decide)⟩
def source111 (i : Fin 28) : Fin 28 := ⟨sourceData111.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree111 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 .empty (.cutY 20480 (.cutX 14336 (.cutY 18432 .empty (.cutX 13312 .empty (.cutY 19456 (.cutX 13824 (.cutY 18944 (.cutX 13568 (.cutY 18688 (.cutX 13440 (.cutY 18560 .full .full) (.cutY 18560 (.cutX 13504 (.cutY 18496 .full .full) (.cutY 18496 .full .full)) .full)) .empty) .empty) .empty) (.cutY 18944 .empty (.cutX 14080 .empty (.cutY 19200 .empty (.cutX 14208 (.cutY 19328 .full .full) (.cutY 19328 (.cutX 14272 (.cutY 19264 .full .full) (.cutY 19264 .full .full)) .full)))))) .empty))) .empty) .empty)) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 .empty (.cutX 18432 .empty (.cutY 14336 (.cutX 19456 (.cutY 13312 .empty (.cutX 18944 (.cutY 13824 (.cutX 18688 (.cutY 13568 (.cutX 18560 (.cutY 13440 .full (.cutX 18496 (.cutY 13504 .full .full) (.cutY 13504 .full .full))) (.cutY 13440 .full .full)) .empty) .empty) .empty) (.cutY 13824 .empty (.cutX 19200 .empty (.cutY 14080 .empty (.cutX 19328 (.cutY 14208 .full (.cutX 19264 (.cutY 14272 .full .full) (.cutY 14272 .full .full))) (.cutY 14208 .full .full))))))) .empty) .empty))) .empty)) .empty) .empty))

theorem metadata111 : 0<128045008 ∧ 52<128 ∧ 72<128 ∧ 1<4 ∧
    8184/4160=1 ∧ 8184%4160=4024 ∧ ∀ i, (leaves111 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData111).mp
    (by decide +kernel)

theorem sourceChecked111_0 : ∀ i : Fin 28,
    (fun i => output111 i = raw111 (source111 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked111 : ∀ i : Fin 28, (fun i => output111 i = raw111 (source111 i)) i :=
  forallFin_of_zero_offset (fun i => output111 i = raw111 (source111 i)) sourceChecked111_0

theorem coverChecked111_0 : ∀ i : Fin 28,
    (fun i => (output111 (cover111 i)).ContainsBox (raw111 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked111 : ∀ i : Fin 28, (fun i => (output111 (cover111 i)).ContainsBox (raw111 i)) i :=
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

noncomputable def phaseMass111 : ℝ := singlePhaseMass (128045008/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw111 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass111_eq : phaseMass111 = (8002813/102400000000 : ℝ) := by
  unfold phaseMass111
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw111 output111 cover111 source111
    (gridTreeUnionCheck_sound 32768 raw111 output111 cover111 source111 tree111 checked111)
    _ (by norm_num) _, areaUnits111]
  norm_num

-- Frozen phase 3120, atom 8034, type 1, source (47,67).
def leavesData112 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves112 : Fin 7 → DyadicLeaf := leavesData112.get
def raw112 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 47 67 leaves112 i
def outputData112 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨12032,12160,17152,17280⟩) (.node (.single ⟨12032,12160,17280,17408⟩) (.single ⟨12160,12224,17152,17216⟩))) (.node (.node (.single ⟨12160,12224,17216,17280⟩) (.single ⟨12224,12288,17152,17216⟩)) (.node (.single ⟨12224,12288,17216,17280⟩) (.single ⟨12160,12288,17280,17408⟩)))) (.node (.node (.single ⟨15360,15488,20480,20608⟩) (.node (.single ⟨15360,15488,20608,20736⟩) (.single ⟨15488,15552,20480,20544⟩))) (.node (.node (.single ⟨15488,15552,20544,20608⟩) (.single ⟨15552,15616,20480,20544⟩)) (.node (.single ⟨15552,15616,20544,20608⟩) (.single ⟨15488,15616,20608,20736⟩))))) (.node (.node (.node (.single ⟨17152,17280,12032,12160⟩) (.node (.single ⟨17152,17216,12160,12224⟩) (.single ⟨17152,17216,12224,12288⟩))) (.node (.node (.single ⟨17216,17280,12160,12224⟩) (.single ⟨17216,17280,12224,12288⟩)) (.node (.single ⟨17280,17408,12032,12160⟩) (.single ⟨17280,17408,12160,12288⟩)))) (.node (.node (.single ⟨20480,20608,15360,15488⟩) (.node (.single ⟨20480,20544,15488,15552⟩) (.single ⟨20480,20544,15552,15616⟩))) (.node (.node (.single ⟨20544,20608,15488,15552⟩) (.single ⟨20544,20608,15552,15616⟩)) (.node (.single ⟨20608,20736,15360,15488⟩) (.single ⟨20608,20736,15488,15616⟩))))))
def output112 : Fin 28 → GridBox := outputData112.get
def coverData112 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData112 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover112 (i : Fin 28) : Fin 28 := ⟨coverData112.get i % 28, Nat.mod_lt _ (by decide)⟩
def source112 (i : Fin 28) : Fin 28 := ⟨sourceData112.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree112 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 .empty (.cutY 18432 (.cutX 11264 .empty (.cutY 17408 (.cutX 11776 .empty (.cutY 16896 .empty (.cutX 12032 .empty (.cutY 17152 .empty (.cutX 12160 (.cutY 17280 .full .full) (.cutY 17280 (.cutX 12224 (.cutY 17216 .full .full) (.cutY 17216 .full .full)) .full)))))) .empty)) .empty)) .empty) (.cutY 20480 .empty (.cutX 14336 .empty (.cutY 22528 (.cutX 15360 .empty (.cutY 21504 (.cutX 15872 (.cutY 20992 (.cutX 15616 (.cutY 20736 (.cutX 15488 (.cutY 20608 .full .full) (.cutY 20608 (.cutX 15552 (.cutY 20544 .full .full) (.cutY 20544 .full .full)) .full)) .empty) .empty) .empty) .empty) .empty)) .empty)))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 (.cutY 10240 .empty (.cutX 17408 (.cutY 11264 .empty (.cutX 16896 .empty (.cutY 11776 .empty (.cutX 17152 .empty (.cutY 12032 .empty (.cutX 17280 (.cutY 12160 .full (.cutX 17216 (.cutY 12224 .full .full) (.cutY 12224 .full .full))) (.cutY 12160 .full .full))))))) .empty)) .empty) .empty) (.cutY 12288 .empty (.cutX 22528 (.cutY 14336 .empty (.cutX 21504 (.cutY 15360 .empty (.cutX 20992 (.cutY 15872 (.cutX 20736 (.cutY 15616 (.cutX 20608 (.cutY 15488 .full (.cutX 20544 (.cutY 15552 .full .full) (.cutY 15552 .full .full))) (.cutY 15488 .full .full)) .empty) .empty) .empty) .empty)) .empty)) .empty)))) .empty) .empty))

theorem metadata112 : 0<50021215 ∧ 47<128 ∧ 67<128 ∧ 1<4 ∧
    8034/4160=1 ∧ 8034%4160=3874 ∧ ∀ i, (leaves112 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData112).mp
    (by decide +kernel)

theorem sourceChecked112_0 : ∀ i : Fin 28,
    (fun i => output112 i = raw112 (source112 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked112 : ∀ i : Fin 28, (fun i => output112 i = raw112 (source112 i)) i :=
  forallFin_of_zero_offset (fun i => output112 i = raw112 (source112 i)) sourceChecked112_0

theorem coverChecked112_0 : ∀ i : Fin 28,
    (fun i => (output112 (cover112 i)).ContainsBox (raw112 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked112 : ∀ i : Fin 28, (fun i => (output112 (cover112 i)).ContainsBox (raw112 i)) i :=
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

noncomputable def phaseMass112 : ℝ := singlePhaseMass (50021215/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw112 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass112_eq : phaseMass112 = (10004243/327680000000 : ℝ) := by
  unfold phaseMass112
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw112 output112 cover112 source112
    (gridTreeUnionCheck_sound 32768 raw112 output112 cover112 source112 tree112 checked112)
    _ (by norm_num) _, areaUnits112]
  norm_num

-- Frozen phase 3121, atom 8208, type 1, source (53,73).
def leavesData113 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves113 : Fin 7 → DyadicLeaf := leavesData113.get
def raw113 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 53 73 leaves113 i
def outputData113 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨13568,13696,18688,18816⟩) (.node (.single ⟨13568,13696,18816,18944⟩) (.single ⟨13696,13760,18688,18752⟩))) (.node (.node (.single ⟨13696,13760,18752,18816⟩) (.single ⟨13760,13824,18688,18752⟩)) (.node (.single ⟨13760,13824,18752,18816⟩) (.single ⟨13696,13824,18816,18944⟩)))) (.node (.node (.single ⟨13824,13952,18944,19072⟩) (.node (.single ⟨13824,13952,19072,19200⟩) (.single ⟨13952,14016,18944,19008⟩))) (.node (.node (.single ⟨13952,14016,19008,19072⟩) (.single ⟨14016,14080,18944,19008⟩)) (.node (.single ⟨14016,14080,19008,19072⟩) (.single ⟨13952,14080,19072,19200⟩))))) (.node (.node (.node (.single ⟨18688,18816,13568,13696⟩) (.node (.single ⟨18688,18752,13696,13760⟩) (.single ⟨18688,18752,13760,13824⟩))) (.node (.node (.single ⟨18752,18816,13696,13760⟩) (.single ⟨18752,18816,13760,13824⟩)) (.node (.single ⟨18816,18944,13568,13696⟩) (.single ⟨18816,18944,13696,13824⟩)))) (.node (.node (.single ⟨18944,19072,13824,13952⟩) (.node (.single ⟨18944,19008,13952,14016⟩) (.single ⟨18944,19008,14016,14080⟩))) (.node (.node (.single ⟨19008,19072,13952,14016⟩) (.single ⟨19008,19072,14016,14080⟩)) (.node (.single ⟨19072,19200,13824,13952⟩) (.single ⟨19072,19200,13952,14080⟩))))))
def output113 : Fin 28 → GridBox := outputData113.get
def coverData113 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData113 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover113 (i : Fin 28) : Fin 28 := ⟨coverData113.get i % 28, Nat.mod_lt _ (by decide)⟩
def source113 (i : Fin 28) : Fin 28 := ⟨sourceData113.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree113 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 .empty (.cutY 20480 (.cutX 14336 (.cutY 18432 .empty (.cutX 13312 .empty (.cutY 19456 (.cutX 13824 (.cutY 18944 (.cutX 13568 .empty (.cutY 18688 .empty (.cutX 13696 (.cutY 18816 .full .full) (.cutY 18816 (.cutX 13760 (.cutY 18752 .full .full) (.cutY 18752 .full .full)) .full)))) .empty) (.cutY 18944 .empty (.cutX 14080 (.cutY 19200 (.cutX 13952 (.cutY 19072 .full .full) (.cutY 19072 (.cutX 14016 (.cutY 19008 .full .full) (.cutY 19008 .full .full)) .full)) .empty) .empty))) .empty))) .empty) .empty)) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 .empty (.cutX 18432 .empty (.cutY 14336 (.cutX 19456 (.cutY 13312 .empty (.cutX 18944 (.cutY 13824 (.cutX 18688 .empty (.cutY 13568 .empty (.cutX 18816 (.cutY 13696 .full (.cutX 18752 (.cutY 13760 .full .full) (.cutY 13760 .full .full))) (.cutY 13696 .full .full)))) .empty) (.cutY 13824 .empty (.cutX 19200 (.cutY 14080 (.cutX 19072 (.cutY 13952 .full (.cutX 19008 (.cutY 14016 .full .full) (.cutY 14016 .full .full))) (.cutY 13952 .full .full)) .empty) .empty)))) .empty) .empty))) .empty)) .empty) .empty))

theorem metadata113 : 0<128045008 ∧ 53<128 ∧ 73<128 ∧ 1<4 ∧
    8208/4160=1 ∧ 8208%4160=4048 ∧ ∀ i, (leaves113 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData113).mp
    (by decide +kernel)

theorem sourceChecked113_0 : ∀ i : Fin 28,
    (fun i => output113 i = raw113 (source113 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked113 : ∀ i : Fin 28, (fun i => output113 i = raw113 (source113 i)) i :=
  forallFin_of_zero_offset (fun i => output113 i = raw113 (source113 i)) sourceChecked113_0

theorem coverChecked113_0 : ∀ i : Fin 28,
    (fun i => (output113 (cover113 i)).ContainsBox (raw113 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked113 : ∀ i : Fin 28, (fun i => (output113 (cover113 i)).ContainsBox (raw113 i)) i :=
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

noncomputable def phaseMass113 : ℝ := singlePhaseMass (128045008/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw113 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass113_eq : phaseMass113 = (8002813/102400000000 : ℝ) := by
  unfold phaseMass113
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw113 output113 cover113 source113
    (gridTreeUnionCheck_sound 32768 raw113 output113 cover113 source113 tree113 checked113)
    _ (by norm_num) _, areaUnits113]
  norm_num

-- Frozen phase 3122, atom 7960, type 1, source (45,65).
def leavesData114 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves114 : Fin 7 → DyadicLeaf := leavesData114.get
def raw114 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 45 65 leaves114 i
def outputData114 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨11520,11648,16640,16768⟩) (.node (.single ⟨11520,11648,16768,16896⟩) (.single ⟨11648,11712,16640,16704⟩))) (.node (.node (.single ⟨11648,11712,16704,16768⟩) (.single ⟨11712,11776,16640,16704⟩)) (.node (.single ⟨11712,11776,16704,16768⟩) (.single ⟨11648,11776,16768,16896⟩)))) (.node (.node (.single ⟨15872,16000,20992,21120⟩) (.node (.single ⟨15872,16000,21120,21248⟩) (.single ⟨16000,16064,20992,21056⟩))) (.node (.node (.single ⟨16000,16064,21056,21120⟩) (.single ⟨16064,16128,20992,21056⟩)) (.node (.single ⟨16064,16128,21056,21120⟩) (.single ⟨16000,16128,21120,21248⟩))))) (.node (.node (.node (.single ⟨16640,16768,11520,11648⟩) (.node (.single ⟨16640,16704,11648,11712⟩) (.single ⟨16640,16704,11712,11776⟩))) (.node (.node (.single ⟨16704,16768,11648,11712⟩) (.single ⟨16704,16768,11712,11776⟩)) (.node (.single ⟨16768,16896,11520,11648⟩) (.single ⟨16768,16896,11648,11776⟩)))) (.node (.node (.single ⟨20992,21120,15872,16000⟩) (.node (.single ⟨20992,21056,16000,16064⟩) (.single ⟨20992,21056,16064,16128⟩))) (.node (.node (.single ⟨21056,21120,16000,16064⟩) (.single ⟨21056,21120,16064,16128⟩)) (.node (.single ⟨21120,21248,15872,16000⟩) (.single ⟨21120,21248,16000,16128⟩))))))
def output114 : Fin 28 → GridBox := outputData114.get
def coverData114 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData114 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover114 (i : Fin 28) : Fin 28 := ⟨coverData114.get i % 28, Nat.mod_lt _ (by decide)⟩
def source114 (i : Fin 28) : Fin 28 := ⟨sourceData114.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree114 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 .empty (.cutY 18432 (.cutX 11264 .empty (.cutY 17408 (.cutX 11776 (.cutY 16896 (.cutX 11520 .empty (.cutY 16640 .empty (.cutX 11648 (.cutY 16768 .full .full) (.cutY 16768 (.cutX 11712 (.cutY 16704 .full .full) (.cutY 16704 .full .full)) .full)))) .empty) .empty) .empty)) .empty)) .empty) (.cutY 20480 .empty (.cutX 14336 .empty (.cutY 22528 (.cutX 15360 .empty (.cutY 21504 (.cutX 15872 .empty (.cutY 20992 .empty (.cutX 16128 (.cutY 21248 (.cutX 16000 (.cutY 21120 .full .full) (.cutY 21120 (.cutX 16064 (.cutY 21056 .full .full) (.cutY 21056 .full .full)) .full)) .empty) .empty))) .empty)) .empty)))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 (.cutY 10240 .empty (.cutX 17408 (.cutY 11264 .empty (.cutX 16896 (.cutY 11776 (.cutX 16640 .empty (.cutY 11520 .empty (.cutX 16768 (.cutY 11648 .full (.cutX 16704 (.cutY 11712 .full .full) (.cutY 11712 .full .full))) (.cutY 11648 .full .full)))) .empty) .empty)) .empty)) .empty) .empty) (.cutY 12288 .empty (.cutX 22528 (.cutY 14336 .empty (.cutX 21504 (.cutY 15360 .empty (.cutX 20992 .empty (.cutY 15872 .empty (.cutX 21248 (.cutY 16128 (.cutX 21120 (.cutY 16000 .full (.cutX 21056 (.cutY 16064 .full .full) (.cutY 16064 .full .full))) (.cutY 16000 .full .full)) .empty) .empty)))) .empty)) .empty)))) .empty) .empty))

theorem metadata114 : 0<50021215 ∧ 45<128 ∧ 65<128 ∧ 1<4 ∧
    7960/4160=1 ∧ 7960%4160=3800 ∧ ∀ i, (leaves114 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData114).mp
    (by decide +kernel)

theorem sourceChecked114_0 : ∀ i : Fin 28,
    (fun i => output114 i = raw114 (source114 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked114 : ∀ i : Fin 28, (fun i => output114 i = raw114 (source114 i)) i :=
  forallFin_of_zero_offset (fun i => output114 i = raw114 (source114 i)) sourceChecked114_0

theorem coverChecked114_0 : ∀ i : Fin 28,
    (fun i => (output114 (cover114 i)).ContainsBox (raw114 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked114 : ∀ i : Fin 28, (fun i => (output114 (cover114 i)).ContainsBox (raw114 i)) i :=
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

noncomputable def phaseMass114 : ℝ := singlePhaseMass (50021215/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw114 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass114_eq : phaseMass114 = (10004243/327680000000 : ℝ) := by
  unfold phaseMass114
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw114 output114 cover114 source114
    (gridTreeUnionCheck_sound 32768 raw114 output114 cover114 source114 tree114 checked114)
    _ (by norm_num) _, areaUnits114]
  norm_num

-- Frozen phase 3123, atom 7221, type 1, source (31,54).
def leavesData115 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves115 : Fin 7 → DyadicLeaf := leavesData115.get
def raw115 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 31 54 leaves115 i
def outputData115 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨7936,8064,13824,13952⟩) (.node (.single ⟨7936,8064,13952,14080⟩) (.single ⟨8064,8128,13824,13888⟩))) (.node (.node (.single ⟨8064,8128,13888,13952⟩) (.single ⟨8128,8192,13824,13888⟩)) (.node (.single ⟨8128,8192,13888,13952⟩) (.single ⟨8064,8192,13952,14080⟩)))) (.node (.node (.single ⟨13824,13952,7936,8064⟩) (.node (.single ⟨13824,13888,8064,8128⟩) (.single ⟨13824,13888,8128,8192⟩))) (.node (.node (.single ⟨13888,13952,8064,8128⟩) (.single ⟨13888,13952,8128,8192⟩)) (.node (.single ⟨13952,14080,7936,8064⟩) (.single ⟨13952,14080,8064,8192⟩))))) (.node (.node (.node (.single ⟨18688,18816,24576,24704⟩) (.node (.single ⟨18688,18816,24704,24832⟩) (.single ⟨18816,18880,24576,24640⟩))) (.node (.node (.single ⟨18816,18880,24640,24704⟩) (.single ⟨18880,18944,24576,24640⟩)) (.node (.single ⟨18880,18944,24640,24704⟩) (.single ⟨18816,18944,24704,24832⟩)))) (.node (.node (.single ⟨24576,24704,18688,18816⟩) (.node (.single ⟨24576,24640,18816,18880⟩) (.single ⟨24576,24640,18880,18944⟩))) (.node (.node (.single ⟨24640,24704,18816,18880⟩) (.single ⟨24640,24704,18880,18944⟩)) (.node (.single ⟨24704,24832,18688,18816⟩) (.single ⟨24704,24832,18816,18944⟩))))))
def output115 : Fin 28 → GridBox := outputData115.get
def coverData115 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData115 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover115 (i : Fin 28) : Fin 28 := ⟨coverData115.get i % 28, Nat.mod_lt _ (by decide)⟩
def source115 (i : Fin 28) : Fin 28 := ⟨sourceData115.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree115 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 .empty (.cutY 14336 (.cutX 7168 .empty (.cutY 13312 .empty (.cutX 7680 .empty (.cutY 13824 .empty (.cutX 7936 .empty (.cutY 14080 (.cutX 8064 (.cutY 13952 .full .full) (.cutY 13952 (.cutX 8128 (.cutY 13888 .full .full) (.cutY 13888 .full .full)) .full)) .empty)))))) .empty))))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 (.cutY 6144 .empty (.cutX 13312 .empty (.cutY 7168 .empty (.cutX 13824 .empty (.cutY 7680 .empty (.cutX 14080 (.cutY 7936 .empty (.cutX 13952 (.cutY 8064 .full (.cutX 13888 (.cutY 8128 .full .full) (.cutY 8128 .full .full))) (.cutY 8064 .full .full))) .empty)))))) .empty))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 .empty (.cutY 26624 (.cutX 19456 (.cutY 25600 (.cutX 18944 (.cutY 25088 (.cutX 18688 .empty (.cutY 24832 (.cutX 18816 (.cutY 24704 .full .full) (.cutY 24704 (.cutX 18880 (.cutY 24640 .full .full) (.cutY 24640 .full .full)) .full)) .empty)) .empty) .empty) .empty) .empty) .empty)) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 (.cutY 18432 .empty (.cutX 25600 (.cutY 19456 (.cutX 25088 (.cutY 18944 (.cutX 24832 (.cutY 18688 .empty (.cutX 24704 (.cutY 18816 .full (.cutX 24640 (.cutY 18880 .full .full) (.cutY 18880 .full .full))) (.cutY 18816 .full .full))) .empty) .empty) .empty) .empty) .empty)) .empty) .empty) .empty) .empty))))

theorem metadata115 : 0<202650974 ∧ 31<128 ∧ 54<128 ∧ 1<4 ∧
    7221/4160=1 ∧ 7221%4160=3061 ∧ ∀ i, (leaves115 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData115).mp
    (by decide +kernel)

theorem sourceChecked115_0 : ∀ i : Fin 28,
    (fun i => output115 i = raw115 (source115 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked115 : ∀ i : Fin 28, (fun i => output115 i = raw115 (source115 i)) i :=
  forallFin_of_zero_offset (fun i => output115 i = raw115 (source115 i)) sourceChecked115_0

theorem coverChecked115_0 : ∀ i : Fin 28,
    (fun i => (output115 (cover115 i)).ContainsBox (raw115 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked115 : ∀ i : Fin 28, (fun i => (output115 (cover115 i)).ContainsBox (raw115 i)) i :=
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

noncomputable def phaseMass115 : ℝ := singlePhaseMass (202650974/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw115 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass115_eq : phaseMass115 = (101325487/819200000000 : ℝ) := by
  unfold phaseMass115
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw115 output115 cover115 source115
    (gridTreeUnionCheck_sound 32768 raw115 output115 cover115 source115 tree115 checked115)
    _ (by norm_num) _, areaUnits115]
  norm_num

-- Frozen phase 3124, atom 6784, type 1, source (25,49).
def leavesData116 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves116 : Fin 7 → DyadicLeaf := leavesData116.get
def raw116 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 25 49 leaves116 i
def outputData116 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨6400,6528,12544,12672⟩) (.node (.single ⟨6400,6528,12672,12800⟩) (.single ⟨6528,6592,12544,12608⟩))) (.node (.node (.single ⟨6528,6592,12608,12672⟩) (.single ⟨6592,6656,12544,12608⟩)) (.node (.single ⟨6592,6656,12608,12672⟩) (.single ⟨6528,6656,12672,12800⟩)))) (.node (.node (.single ⟨12544,12672,6400,6528⟩) (.node (.single ⟨12544,12608,6528,6592⟩) (.single ⟨12544,12608,6592,6656⟩))) (.node (.node (.single ⟨12608,12672,6528,6592⟩) (.single ⟨12608,12672,6592,6656⟩)) (.node (.single ⟨12672,12800,6400,6528⟩) (.single ⟨12672,12800,6528,6656⟩))))) (.node (.node (.node (.single ⟨19968,20096,26112,26240⟩) (.node (.single ⟨19968,20096,26240,26368⟩) (.single ⟨20096,20160,26112,26176⟩))) (.node (.node (.single ⟨20096,20160,26176,26240⟩) (.single ⟨20160,20224,26112,26176⟩)) (.node (.single ⟨20160,20224,26176,26240⟩) (.single ⟨20096,20224,26240,26368⟩)))) (.node (.node (.single ⟨26112,26240,19968,20096⟩) (.node (.single ⟨26112,26176,20096,20160⟩) (.single ⟨26112,26176,20160,20224⟩))) (.node (.node (.single ⟨26176,26240,20096,20160⟩) (.single ⟨26176,26240,20160,20224⟩)) (.node (.single ⟨26240,26368,19968,20096⟩) (.single ⟨26240,26368,20096,20224⟩))))))
def output116 : Fin 28 → GridBox := outputData116.get
def coverData116 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData116 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover116 (i : Fin 28) : Fin 28 := ⟨coverData116.get i % 28, Nat.mod_lt _ (by decide)⟩
def source116 (i : Fin 28) : Fin 28 := ⟨sourceData116.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree116 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 .empty (.cutY 14336 (.cutX 7168 (.cutY 13312 (.cutX 6656 (.cutY 12800 (.cutX 6400 .empty (.cutY 12544 .empty (.cutX 6528 (.cutY 12672 .full .full) (.cutY 12672 (.cutX 6592 (.cutY 12608 .full .full) (.cutY 12608 .full .full)) .full)))) .empty) .empty) .empty) .empty) .empty))))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 (.cutY 6144 .empty (.cutX 13312 (.cutY 7168 (.cutX 12800 (.cutY 6656 (.cutX 12544 .empty (.cutY 6400 .empty (.cutX 12672 (.cutY 6528 .full (.cutX 12608 (.cutY 6592 .full .full) (.cutY 6592 .full .full))) (.cutY 6528 .full .full)))) .empty) .empty) .empty) .empty)) .empty))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 .empty (.cutY 26624 (.cutX 19456 .empty (.cutY 25600 .empty (.cutX 19968 .empty (.cutY 26112 .empty (.cutX 20224 (.cutY 26368 (.cutX 20096 (.cutY 26240 .full .full) (.cutY 26240 (.cutX 20160 (.cutY 26176 .full .full) (.cutY 26176 .full .full)) .full)) .empty) .empty))))) .empty)) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 (.cutY 18432 .empty (.cutX 25600 .empty (.cutY 19456 .empty (.cutX 26112 .empty (.cutY 19968 .empty (.cutX 26368 (.cutY 20224 (.cutX 26240 (.cutY 20096 .full (.cutX 26176 (.cutY 20160 .full .full) (.cutY 20160 .full .full))) (.cutY 20096 .full .full)) .empty) .empty)))))) .empty) .empty) .empty) .empty))))

theorem metadata116 : 0<202650974 ∧ 25<128 ∧ 49<128 ∧ 1<4 ∧
    6784/4160=1 ∧ 6784%4160=2624 ∧ ∀ i, (leaves116 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData116).mp
    (by decide +kernel)

theorem sourceChecked116_0 : ∀ i : Fin 28,
    (fun i => output116 i = raw116 (source116 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked116 : ∀ i : Fin 28, (fun i => output116 i = raw116 (source116 i)) i :=
  forallFin_of_zero_offset (fun i => output116 i = raw116 (source116 i)) sourceChecked116_0

theorem coverChecked116_0 : ∀ i : Fin 28,
    (fun i => (output116 (cover116 i)).ContainsBox (raw116 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked116 : ∀ i : Fin 28, (fun i => (output116 (cover116 i)).ContainsBox (raw116 i)) i :=
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

noncomputable def phaseMass116 : ℝ := singlePhaseMass (202650974/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw116 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass116_eq : phaseMass116 = (101325487/819200000000 : ℝ) := by
  unfold phaseMass116
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw116 output116 cover116 source116
    (gridTreeUnionCheck_sound 32768 raw116 output116 cover116 source116 tree116 checked116)
    _ (by norm_num) _, areaUnits116]
  norm_num

-- Frozen phase 3125, atom 6862, type 1, source (26,50).
def leavesData117 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves117 : Fin 7 → DyadicLeaf := leavesData117.get
def raw117 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 26 50 leaves117 i
def outputData117 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨6656,6784,12800,12928⟩) (.node (.single ⟨6656,6784,12928,13056⟩) (.single ⟨6784,6848,12800,12864⟩))) (.node (.node (.single ⟨6784,6848,12864,12928⟩) (.single ⟨6848,6912,12800,12864⟩)) (.node (.single ⟨6848,6912,12864,12928⟩) (.single ⟨6784,6912,12928,13056⟩)))) (.node (.node (.single ⟨12800,12928,6656,6784⟩) (.node (.single ⟨12800,12864,6784,6848⟩) (.single ⟨12800,12864,6848,6912⟩))) (.node (.node (.single ⟨12864,12928,6784,6848⟩) (.single ⟨12864,12928,6848,6912⟩)) (.node (.single ⟨12928,13056,6656,6784⟩) (.single ⟨12928,13056,6784,6912⟩))))) (.node (.node (.node (.single ⟨19712,19840,25856,25984⟩) (.node (.single ⟨19712,19840,25984,26112⟩) (.single ⟨19840,19904,25856,25920⟩))) (.node (.node (.single ⟨19840,19904,25920,25984⟩) (.single ⟨19904,19968,25856,25920⟩)) (.node (.single ⟨19904,19968,25920,25984⟩) (.single ⟨19840,19968,25984,26112⟩)))) (.node (.node (.single ⟨25856,25984,19712,19840⟩) (.node (.single ⟨25856,25920,19840,19904⟩) (.single ⟨25856,25920,19904,19968⟩))) (.node (.node (.single ⟨25920,25984,19840,19904⟩) (.single ⟨25920,25984,19904,19968⟩)) (.node (.single ⟨25984,26112,19712,19840⟩) (.single ⟨25984,26112,19840,19968⟩))))))
def output117 : Fin 28 → GridBox := outputData117.get
def coverData117 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData117 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover117 (i : Fin 28) : Fin 28 := ⟨coverData117.get i % 28, Nat.mod_lt _ (by decide)⟩
def source117 (i : Fin 28) : Fin 28 := ⟨sourceData117.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree117 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 .empty (.cutY 14336 (.cutX 7168 (.cutY 13312 (.cutX 6656 .empty (.cutY 12800 .empty (.cutX 6912 (.cutY 13056 (.cutX 6784 (.cutY 12928 .full .full) (.cutY 12928 (.cutX 6848 (.cutY 12864 .full .full) (.cutY 12864 .full .full)) .full)) .empty) .empty))) .empty) .empty) .empty))))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 (.cutY 6144 .empty (.cutX 13312 (.cutY 7168 (.cutX 12800 .empty (.cutY 6656 .empty (.cutX 13056 (.cutY 6912 (.cutX 12928 (.cutY 6784 .full (.cutX 12864 (.cutY 6848 .full .full) (.cutY 6848 .full .full))) (.cutY 6784 .full .full)) .empty) .empty))) .empty) .empty)) .empty))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 .empty (.cutY 26624 (.cutX 19456 .empty (.cutY 25600 .empty (.cutX 19968 (.cutY 26112 (.cutX 19712 .empty (.cutY 25856 .empty (.cutX 19840 (.cutY 25984 .full .full) (.cutY 25984 (.cutX 19904 (.cutY 25920 .full .full) (.cutY 25920 .full .full)) .full)))) .empty) .empty))) .empty)) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 (.cutY 18432 .empty (.cutX 25600 .empty (.cutY 19456 .empty (.cutX 26112 (.cutY 19968 (.cutX 25856 .empty (.cutY 19712 .empty (.cutX 25984 (.cutY 19840 .full (.cutX 25920 (.cutY 19904 .full .full) (.cutY 19904 .full .full))) (.cutY 19840 .full .full)))) .empty) .empty)))) .empty) .empty) .empty) .empty))))

theorem metadata117 : 0<202650974 ∧ 26<128 ∧ 50<128 ∧ 1<4 ∧
    6862/4160=1 ∧ 6862%4160=2702 ∧ ∀ i, (leaves117 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData117).mp
    (by decide +kernel)

theorem sourceChecked117_0 : ∀ i : Fin 28,
    (fun i => output117 i = raw117 (source117 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked117 : ∀ i : Fin 28, (fun i => output117 i = raw117 (source117 i)) i :=
  forallFin_of_zero_offset (fun i => output117 i = raw117 (source117 i)) sourceChecked117_0

theorem coverChecked117_0 : ∀ i : Fin 28,
    (fun i => (output117 (cover117 i)).ContainsBox (raw117 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked117 : ∀ i : Fin 28, (fun i => (output117 (cover117 i)).ContainsBox (raw117 i)) i :=
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

noncomputable def phaseMass117 : ℝ := singlePhaseMass (202650974/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw117 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass117_eq : phaseMass117 = (101325487/819200000000 : ℝ) := by
  unfold phaseMass117
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw117 output117 cover117 source117
    (gridTreeUnionCheck_sound 32768 raw117 output117 cover117 source117 tree117 checked117)
    _ (by norm_num) _, areaUnits117]
  norm_num

-- Frozen phase 3126, atom 6938, type 1, source (27,51).
def leavesData118 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves118 : Fin 7 → DyadicLeaf := leavesData118.get
def raw118 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 27 51 leaves118 i
def outputData118 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨6912,7040,13056,13184⟩) (.node (.single ⟨6912,7040,13184,13312⟩) (.single ⟨7040,7104,13056,13120⟩))) (.node (.node (.single ⟨7040,7104,13120,13184⟩) (.single ⟨7104,7168,13056,13120⟩)) (.node (.single ⟨7104,7168,13120,13184⟩) (.single ⟨7040,7168,13184,13312⟩)))) (.node (.node (.single ⟨13056,13184,6912,7040⟩) (.node (.single ⟨13056,13120,7040,7104⟩) (.single ⟨13056,13120,7104,7168⟩))) (.node (.node (.single ⟨13120,13184,7040,7104⟩) (.single ⟨13120,13184,7104,7168⟩)) (.node (.single ⟨13184,13312,6912,7040⟩) (.single ⟨13184,13312,7040,7168⟩))))) (.node (.node (.node (.single ⟨19456,19584,25600,25728⟩) (.node (.single ⟨19456,19584,25728,25856⟩) (.single ⟨19584,19648,25600,25664⟩))) (.node (.node (.single ⟨19584,19648,25664,25728⟩) (.single ⟨19648,19712,25600,25664⟩)) (.node (.single ⟨19648,19712,25664,25728⟩) (.single ⟨19584,19712,25728,25856⟩)))) (.node (.node (.single ⟨25600,25728,19456,19584⟩) (.node (.single ⟨25600,25664,19584,19648⟩) (.single ⟨25600,25664,19648,19712⟩))) (.node (.node (.single ⟨25664,25728,19584,19648⟩) (.single ⟨25664,25728,19648,19712⟩)) (.node (.single ⟨25728,25856,19456,19584⟩) (.single ⟨25728,25856,19584,19712⟩))))))
def output118 : Fin 28 → GridBox := outputData118.get
def coverData118 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData118 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover118 (i : Fin 28) : Fin 28 := ⟨coverData118.get i % 28, Nat.mod_lt _ (by decide)⟩
def source118 (i : Fin 28) : Fin 28 := ⟨sourceData118.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree118 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 .empty (.cutY 14336 (.cutX 7168 (.cutY 13312 (.cutX 6656 .empty (.cutY 12800 .empty (.cutX 6912 .empty (.cutY 13056 .empty (.cutX 7040 (.cutY 13184 .full .full) (.cutY 13184 (.cutX 7104 (.cutY 13120 .full .full) (.cutY 13120 .full .full)) .full)))))) .empty) .empty) .empty))))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 (.cutY 6144 .empty (.cutX 13312 (.cutY 7168 (.cutX 12800 .empty (.cutY 6656 .empty (.cutX 13056 .empty (.cutY 6912 .empty (.cutX 13184 (.cutY 7040 .full (.cutX 13120 (.cutY 7104 .full .full) (.cutY 7104 .full .full))) (.cutY 7040 .full .full)))))) .empty) .empty)) .empty))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 .empty (.cutY 26624 (.cutX 19456 .empty (.cutY 25600 .empty (.cutX 19968 (.cutY 26112 (.cutX 19712 (.cutY 25856 (.cutX 19584 (.cutY 25728 .full .full) (.cutY 25728 (.cutX 19648 (.cutY 25664 .full .full) (.cutY 25664 .full .full)) .full)) .empty) .empty) .empty) .empty))) .empty)) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 (.cutY 18432 .empty (.cutX 25600 .empty (.cutY 19456 .empty (.cutX 26112 (.cutY 19968 (.cutX 25856 (.cutY 19712 (.cutX 25728 (.cutY 19584 .full (.cutX 25664 (.cutY 19648 .full .full) (.cutY 19648 .full .full))) (.cutY 19584 .full .full)) .empty) .empty) .empty) .empty)))) .empty) .empty) .empty) .empty))))

theorem metadata118 : 0<202650974 ∧ 27<128 ∧ 51<128 ∧ 1<4 ∧
    6938/4160=1 ∧ 6938%4160=2778 ∧ ∀ i, (leaves118 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData118).mp
    (by decide +kernel)

theorem sourceChecked118_0 : ∀ i : Fin 28,
    (fun i => output118 i = raw118 (source118 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked118 : ∀ i : Fin 28, (fun i => output118 i = raw118 (source118 i)) i :=
  forallFin_of_zero_offset (fun i => output118 i = raw118 (source118 i)) sourceChecked118_0

theorem coverChecked118_0 : ∀ i : Fin 28,
    (fun i => (output118 (cover118 i)).ContainsBox (raw118 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked118 : ∀ i : Fin 28, (fun i => (output118 (cover118 i)).ContainsBox (raw118 i)) i :=
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

noncomputable def phaseMass118 : ℝ := singlePhaseMass (202650974/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw118 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass118_eq : phaseMass118 = (101325487/819200000000 : ℝ) := by
  unfold phaseMass118
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw118 output118 cover118 source118
    (gridTreeUnionCheck_sound 32768 raw118 output118 cover118 source118 tree118 checked118)
    _ (by norm_num) _, areaUnits118]
  norm_num

-- Frozen phase 3127, atom 7741, type 1, source (40,61).
def leavesData119 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves119 : Fin 10 → DyadicLeaf := leavesData119.get
def raw119 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 40 61 leaves119 i
def outputData119 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨10240,10368,15616,15744⟩) (.single ⟨10240,10368,15744,15872⟩)) (.node (.single ⟨10368,10432,15616,15680⟩) (.node (.single ⟨10368,10432,15680,15744⟩) (.single ⟨10432,10464,15616,15648⟩)))) (.node (.node (.single ⟨10432,10464,15648,15680⟩) (.single ⟨10464,10496,15616,15648⟩)) (.node (.single ⟨10464,10496,15648,15680⟩) (.node (.single ⟨10432,10496,15680,15744⟩) (.single ⟨10368,10496,15744,15872⟩))))) (.node (.node (.node (.single ⟨15616,15744,10240,10368⟩) (.single ⟨15616,15680,10368,10432⟩)) (.node (.single ⟨15616,15648,10432,10464⟩) (.node (.single ⟨15616,15648,10464,10496⟩) (.single ⟨15648,15680,10432,10464⟩)))) (.node (.node (.single ⟨15648,15680,10464,10496⟩) (.single ⟨15680,15744,10368,10432⟩)) (.node (.single ⟨15680,15744,10432,10496⟩) (.node (.single ⟨15744,15872,10240,10368⟩) (.single ⟨15744,15872,10368,10496⟩)))))) (.node (.node (.node (.node (.single ⟨16896,17024,22272,22400⟩) (.single ⟨16896,17024,22400,22528⟩)) (.node (.single ⟨17024,17088,22272,22336⟩) (.node (.single ⟨17024,17088,22336,22400⟩) (.single ⟨17088,17120,22272,22304⟩)))) (.node (.node (.single ⟨17088,17120,22304,22336⟩) (.single ⟨17120,17152,22272,22304⟩)) (.node (.single ⟨17120,17152,22304,22336⟩) (.node (.single ⟨17088,17152,22336,22400⟩) (.single ⟨17024,17152,22400,22528⟩))))) (.node (.node (.node (.single ⟨22272,22400,16896,17024⟩) (.single ⟨22272,22336,17024,17088⟩)) (.node (.single ⟨22272,22304,17088,17120⟩) (.node (.single ⟨22272,22304,17120,17152⟩) (.single ⟨22304,22336,17088,17120⟩)))) (.node (.node (.single ⟨22304,22336,17120,17152⟩) (.single ⟨22336,22400,17024,17088⟩)) (.node (.single ⟨22336,22400,17088,17152⟩) (.node (.single ⟨22400,22528,16896,17024⟩) (.single ⟨22400,22528,17024,17152⟩)))))))
def output119 : Fin 40 → GridBox := outputData119.get
def coverData119 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 10)) (.node (.single 39) (.node (.single 29) (.single 1)))) (.node (.node (.single 18) (.single 38)) (.node (.single 21) (.node (.single 9) (.single 19))))) (.node (.node (.node (.single 30) (.single 20)) (.node (.single 2) (.node (.single 11) (.single 37)))) (.node (.node (.single 28) (.single 3)) (.node (.single 16) (.node (.single 36) (.single 23)))))) (.node (.node (.node (.node (.single 8) (.single 17)) (.node (.single 31) (.node (.single 22) (.single 4)))) (.node (.node (.single 12) (.single 35)) (.node (.single 27) (.node (.single 5) (.single 14))))) (.node (.node (.node (.single 34) (.single 25)) (.node (.single 6) (.node (.single 13) (.single 33)))) (.node (.node (.single 26) (.single 7)) (.node (.single 15) (.node (.single 32) (.single 24)))))))
def sourceData119 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9)))))) (.node (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover119 (i : Fin 40) : Fin 40 := ⟨coverData119.get i % 40, Nat.mod_lt _ (by decide)⟩
def source119 (i : Fin 40) : Fin 40 := ⟨sourceData119.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree119 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 .empty (.cutY 14336 .empty (.cutX 11264 (.cutY 15360 .empty (.cutX 10752 (.cutY 15872 (.cutX 10496 (.cutY 15616 .empty (.cutX 10368 (.cutY 15744 .full .full) (.cutY 15744 (.cutX 10432 (.cutY 15680 .full .full) (.cutY 15680 (.cutX 10464 (.cutY 15648 .full .full) (.cutY 15648 .full .full)) .full)) .full))) .empty) .empty) .empty)) .empty)))) (.cutY 12288 (.cutX 14336 .empty (.cutY 10240 .empty (.cutX 15360 .empty (.cutY 11264 (.cutX 15872 (.cutY 10752 (.cutX 15616 .empty (.cutY 10496 (.cutX 15744 (.cutY 10368 .full (.cutX 15680 (.cutY 10432 .full (.cutX 15648 (.cutY 10464 .full .full) (.cutY 10464 .full .full))) (.cutY 10432 .full .full))) (.cutY 10368 .full .full)) .empty)) .empty) .empty) .empty)))) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 (.cutY 22528 (.cutX 17408 (.cutY 21504 .empty (.cutX 16896 .empty (.cutY 22016 .empty (.cutX 17152 (.cutY 22272 .empty (.cutX 17024 (.cutY 22400 .full .full) (.cutY 22400 (.cutX 17088 (.cutY 22336 .full .full) (.cutY 22336 (.cutX 17120 (.cutY 22304 .full .full) (.cutY 22304 .full .full)) .full)) .full))) .empty)))) .empty) .empty) .empty)) (.cutY 20480 (.cutX 22528 (.cutY 18432 (.cutX 21504 .empty (.cutY 17408 (.cutX 22016 .empty (.cutY 16896 .empty (.cutX 22272 .empty (.cutY 17152 (.cutX 22400 (.cutY 17024 .full (.cutX 22336 (.cutY 17088 .full (.cutX 22304 (.cutY 17120 .full .full) (.cutY 17120 .full .full))) (.cutY 17088 .full .full))) (.cutY 17024 .full .full)) .empty)))) .empty)) .empty) .empty) .empty)) .empty) .empty)))

theorem metadata119 : 0<82140708 ∧ 40<128 ∧ 61<128 ∧ 1<4 ∧
    7741/4160=1 ∧ 7741%4160=3581 ∧ ∀ i, (leaves119 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData119).mp
    (by decide +kernel)

theorem sourceChecked119_0 : ∀ i : Fin 40,
    (fun i => output119 i = raw119 (source119 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked119 : ∀ i : Fin 40, (fun i => output119 i = raw119 (source119 i)) i :=
  forallFin_of_zero_offset (fun i => output119 i = raw119 (source119 i)) sourceChecked119_0

theorem coverChecked119_0 : ∀ i : Fin 40,
    (fun i => (output119 (cover119 i)).ContainsBox (raw119 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked119 : ∀ i : Fin 40, (fun i => (output119 (cover119 i)).ContainsBox (raw119 i)) i :=
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

noncomputable def phaseMass119 : ℝ := singlePhaseMass (82140708/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw119 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass119_eq : phaseMass119 = (20535177/409600000000 : ℝ) := by
  unfold phaseMass119
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw119 output119 cover119 source119
    (gridTreeUnionCheck_sound 32768 raw119 output119 cover119 source119 tree119 checked119)
    _ (by norm_num) _, areaUnits119]
  norm_num

-- Frozen phase 3128, atom 7530, type 1, source (36,58).
def leavesData120 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves120 : Fin 7 → DyadicLeaf := leavesData120.get
def raw120 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 36 58 leaves120 i
def outputData120 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨9216,9344,14848,14976⟩) (.node (.single ⟨9216,9344,14976,15104⟩) (.single ⟨9344,9408,14848,14912⟩))) (.node (.node (.single ⟨9344,9408,14912,14976⟩) (.single ⟨9408,9472,14848,14912⟩)) (.node (.single ⟨9408,9472,14912,14976⟩) (.single ⟨9344,9472,14976,15104⟩)))) (.node (.node (.single ⟨14848,14976,9216,9344⟩) (.node (.single ⟨14848,14912,9344,9408⟩) (.single ⟨14848,14912,9408,9472⟩))) (.node (.node (.single ⟨14912,14976,9344,9408⟩) (.single ⟨14912,14976,9408,9472⟩)) (.node (.single ⟨14976,15104,9216,9344⟩) (.single ⟨14976,15104,9344,9472⟩))))) (.node (.node (.node (.single ⟨17664,17792,23296,23424⟩) (.node (.single ⟨17664,17792,23424,23552⟩) (.single ⟨17792,17856,23296,23360⟩))) (.node (.node (.single ⟨17792,17856,23360,23424⟩) (.single ⟨17856,17920,23296,23360⟩)) (.node (.single ⟨17856,17920,23360,23424⟩) (.single ⟨17792,17920,23424,23552⟩)))) (.node (.node (.single ⟨23296,23424,17664,17792⟩) (.node (.single ⟨23296,23360,17792,17856⟩) (.single ⟨23296,23360,17856,17920⟩))) (.node (.node (.single ⟨23360,23424,17792,17856⟩) (.single ⟨23360,23424,17856,17920⟩)) (.node (.single ⟨23424,23552,17664,17792⟩) (.single ⟨23424,23552,17792,17920⟩))))))
def output120 : Fin 28 → GridBox := outputData120.get
def coverData120 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData120 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover120 (i : Fin 28) : Fin 28 := ⟨coverData120.get i % 28, Nat.mod_lt _ (by decide)⟩
def source120 (i : Fin 28) : Fin 28 := ⟨sourceData120.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree120 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 (.cutY 14336 .empty (.cutX 9216 .empty (.cutY 15360 (.cutX 9728 (.cutY 14848 .empty (.cutX 9472 (.cutY 15104 (.cutX 9344 (.cutY 14976 .full .full) (.cutY 14976 (.cutX 9408 (.cutY 14912 .full .full) (.cutY 14912 .full .full)) .full)) .empty) .empty)) .empty) .empty))) .empty)) (.cutY 12288 (.cutX 14336 .empty (.cutY 10240 (.cutX 15360 (.cutY 9216 .empty (.cutX 14848 .empty (.cutY 9728 (.cutX 15104 (.cutY 9472 (.cutX 14976 (.cutY 9344 .full (.cutX 14912 (.cutY 9408 .full .full) (.cutY 9408 .full .full))) (.cutY 9344 .full .full)) .empty) .empty) .empty))) .empty) .empty)) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 (.cutY 22528 .empty (.cutX 17408 .empty (.cutY 23552 (.cutX 17920 (.cutY 23040 .empty (.cutX 17664 .empty (.cutY 23296 .empty (.cutX 17792 (.cutY 23424 .full .full) (.cutY 23424 (.cutX 17856 (.cutY 23360 .full .full) (.cutY 23360 .full .full)) .full))))) .empty) .empty))) .empty)) (.cutY 20480 (.cutX 22528 .empty (.cutY 18432 (.cutX 23552 (.cutY 17408 .empty (.cutX 23040 .empty (.cutY 17920 (.cutX 23296 .empty (.cutY 17664 .empty (.cutX 23424 (.cutY 17792 .full (.cutX 23360 (.cutY 17856 .full .full) (.cutY 17856 .full .full))) (.cutY 17792 .full .full)))) .empty))) .empty) .empty)) .empty)) .empty) .empty)))

theorem metadata120 : 0<168966520 ∧ 36<128 ∧ 58<128 ∧ 1<4 ∧
    7530/4160=1 ∧ 7530%4160=3370 ∧ ∀ i, (leaves120 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData120).mp
    (by decide +kernel)

theorem sourceChecked120_0 : ∀ i : Fin 28,
    (fun i => output120 i = raw120 (source120 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked120 : ∀ i : Fin 28, (fun i => output120 i = raw120 (source120 i)) i :=
  forallFin_of_zero_offset (fun i => output120 i = raw120 (source120 i)) sourceChecked120_0

theorem coverChecked120_0 : ∀ i : Fin 28,
    (fun i => (output120 (cover120 i)).ContainsBox (raw120 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked120 : ∀ i : Fin 28, (fun i => (output120 (cover120 i)).ContainsBox (raw120 i)) i :=
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

noncomputable def phaseMass120 : ℝ := singlePhaseMass (168966520/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw120 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass120_eq : phaseMass120 = (4224163/40960000000 : ℝ) := by
  unfold phaseMass120
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw120 output120 cover120 source120
    (gridTreeUnionCheck_sound 32768 raw120 output120 cover120 source120 tree120 checked120)
    _ (by norm_num) _, areaUnits120]
  norm_num

-- Frozen phase 3129, atom 1003, type 0, source (8,43).
def leavesData121 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves121 : Fin 4 → DyadicLeaf := leavesData121.get
def raw121 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 8 43 leaves121 i
def outputData121 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨2048,2176,11008,11136⟩) (.single ⟨2048,2176,11136,11264⟩)) (.node (.single ⟨2176,2304,11008,11136⟩) (.single ⟨2176,2304,11136,11264⟩))) (.node (.node (.single ⟨11008,11136,2048,2176⟩) (.single ⟨11008,11136,2176,2304⟩)) (.node (.single ⟨11136,11264,2048,2176⟩) (.single ⟨11136,11264,2176,2304⟩)))) (.node (.node (.node (.single ⟨21504,21632,30464,30592⟩) (.single ⟨21504,21632,30592,30720⟩)) (.node (.single ⟨21632,21760,30464,30592⟩) (.single ⟨21632,21760,30592,30720⟩))) (.node (.node (.single ⟨30464,30592,21504,21632⟩) (.single ⟨30464,30592,21632,21760⟩)) (.node (.single ⟨30592,30720,21504,21632⟩) (.single ⟨30592,30720,21632,21760⟩)))))
def output121 : Fin 16 → GridBox := outputData121.get
def coverData121 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData121 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover121 (i : Fin 16) : Fin 16 := ⟨coverData121.get i % 16, Nat.mod_lt _ (by decide)⟩
def source121 (i : Fin 16) : Fin 16 := ⟨sourceData121.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree121 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 .empty (.cutY 10240 .empty (.cutX 3072 (.cutY 11264 (.cutX 2560 (.cutY 10752 .empty (.cutX 2304 (.cutY 11008 .empty (.cutX 2176 (.cutY 11136 .full .full) (.cutY 11136 .full .full))) .empty)) .empty) .empty) .empty))) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 .empty (.cutY 2048 .empty (.cutX 11264 (.cutY 3072 (.cutX 10752 .empty (.cutY 2560 (.cutX 11008 .empty (.cutY 2304 (.cutX 11136 (.cutY 2176 .full .full) (.cutY 2176 .full .full)) .empty)) .empty)) .empty) .empty))) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 (.cutY 30720 (.cutX 21504 .empty (.cutY 29696 .empty (.cutX 22016 (.cutY 30208 .empty (.cutX 21760 (.cutY 30464 .empty (.cutX 21632 (.cutY 30592 .full .full) (.cutY 30592 .full .full))) .empty)) .empty))) .empty) .empty)))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 (.cutY 22528 (.cutX 29696 .empty (.cutY 21504 .empty (.cutX 30208 .empty (.cutY 22016 (.cutX 30464 .empty (.cutY 21760 (.cutX 30592 (.cutY 21632 .full .full) (.cutY 21632 .full .full)) .empty)) .empty)))) .empty) .empty))) .empty))))

theorem metadata121 : 0<296697202 ∧ 8<128 ∧ 43<128 ∧ 0<4 ∧
    1003/4160=0 ∧ 1003%4160=1003 ∧ ∀ i, (leaves121 i).Valid 8 := by
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

noncomputable def phaseMass121 : ℝ := singlePhaseMass (296697202/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw121 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass121_eq : phaseMass121 = (148348601/819200000000 : ℝ) := by
  unfold phaseMass121
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw121 output121 cover121 source121
    (gridTreeUnionCheck_sound 32768 raw121 output121 cover121 source121 tree121 checked121)
    _ (by norm_num) _, areaUnits121]
  norm_num

-- Frozen phase 3130, atom 3764, type 0, source (44,68).
def leavesData122 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves122 : Fin 1 → DyadicLeaf := leavesData122.get
def raw122 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 44 68 leaves122 i
def outputData122 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨11264,11520,17408,17664⟩) (.single ⟨15104,15360,21248,21504⟩)) (.node (.single ⟨17408,17664,11264,11520⟩) (.single ⟨21248,21504,15104,15360⟩)))
def output122 : Fin 4 → GridBox := outputData122.get
def coverData122 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 2)) (.node (.single 3) (.single 1)))
def sourceData122 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 3)) (.node (.single 1) (.single 2)))
def cover122 (i : Fin 4) : Fin 4 := ⟨coverData122.get i % 4, Nat.mod_lt _ (by decide)⟩
def source122 (i : Fin 4) : Fin 4 := ⟨sourceData122.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree122 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 .empty (.cutY 18432 (.cutX 11264 .empty (.cutY 17408 .empty (.cutX 11776 (.cutY 17920 (.cutX 11520 (.cutY 17664 .full .empty) .empty) .empty) .empty))) .empty)) .empty) (.cutY 20480 .empty (.cutX 14336 .empty (.cutY 22528 (.cutX 15360 (.cutY 21504 (.cutX 14848 .empty (.cutY 20992 .empty (.cutX 15104 .empty (.cutY 21248 .empty .full)))) .empty) .empty) .empty)))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 (.cutY 10240 .empty (.cutX 17408 .empty (.cutY 11264 .empty (.cutX 17920 (.cutY 11776 (.cutX 17664 (.cutY 11520 .full .empty) .empty) .empty) .empty)))) .empty) .empty) (.cutY 12288 .empty (.cutX 22528 (.cutY 14336 .empty (.cutX 21504 (.cutY 15360 (.cutX 20992 .empty (.cutY 14848 .empty (.cutX 21248 .empty (.cutY 15104 .empty .full)))) .empty) .empty)) .empty)))) .empty) .empty))

theorem metadata122 : 0<20837145 ∧ 44<128 ∧ 68<128 ∧ 0<4 ∧
    3764/4160=0 ∧ 3764%4160=3764 ∧ ∀ i, (leaves122 i).Valid 8 := by
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

-- Frozen phase 3131, atom 6704, type 1, source (24,48).
def leavesData123 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves123 : Fin 10 → DyadicLeaf := leavesData123.get
def raw123 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 24 48 leaves123 i
def outputData123 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨6144,6272,12288,12416⟩) (.single ⟨6144,6272,12416,12544⟩)) (.node (.single ⟨6272,6336,12288,12352⟩) (.node (.single ⟨6272,6336,12352,12416⟩) (.single ⟨6336,6368,12288,12320⟩)))) (.node (.node (.single ⟨6336,6368,12320,12352⟩) (.single ⟨6368,6400,12288,12320⟩)) (.node (.single ⟨6368,6400,12320,12352⟩) (.node (.single ⟨6336,6400,12352,12416⟩) (.single ⟨6272,6400,12416,12544⟩))))) (.node (.node (.node (.single ⟨12288,12416,6144,6272⟩) (.single ⟨12288,12352,6272,6336⟩)) (.node (.single ⟨12288,12320,6336,6368⟩) (.node (.single ⟨12288,12320,6368,6400⟩) (.single ⟨12320,12352,6336,6368⟩)))) (.node (.node (.single ⟨12320,12352,6368,6400⟩) (.single ⟨12352,12416,6272,6336⟩)) (.node (.single ⟨12352,12416,6336,6400⟩) (.node (.single ⟨12416,12544,6144,6272⟩) (.single ⟨12416,12544,6272,6400⟩)))))) (.node (.node (.node (.node (.single ⟨20224,20352,26368,26496⟩) (.single ⟨20224,20352,26496,26624⟩)) (.node (.single ⟨20352,20416,26368,26432⟩) (.node (.single ⟨20352,20416,26432,26496⟩) (.single ⟨20416,20448,26368,26400⟩)))) (.node (.node (.single ⟨20416,20448,26400,26432⟩) (.single ⟨20448,20480,26368,26400⟩)) (.node (.single ⟨20448,20480,26400,26432⟩) (.node (.single ⟨20416,20480,26432,26496⟩) (.single ⟨20352,20480,26496,26624⟩))))) (.node (.node (.node (.single ⟨26368,26496,20224,20352⟩) (.single ⟨26368,26432,20352,20416⟩)) (.node (.single ⟨26368,26400,20416,20448⟩) (.node (.single ⟨26368,26400,20448,20480⟩) (.single ⟨26400,26432,20416,20448⟩)))) (.node (.node (.single ⟨26400,26432,20448,20480⟩) (.single ⟨26432,26496,20352,20416⟩)) (.node (.single ⟨26432,26496,20416,20480⟩) (.node (.single ⟨26496,26624,20224,20352⟩) (.single ⟨26496,26624,20352,20480⟩)))))))
def output123 : Fin 40 → GridBox := outputData123.get
def coverData123 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 10)) (.node (.single 39) (.node (.single 29) (.single 1)))) (.node (.node (.single 18) (.single 38)) (.node (.single 21) (.node (.single 9) (.single 19))))) (.node (.node (.node (.single 30) (.single 20)) (.node (.single 2) (.node (.single 11) (.single 37)))) (.node (.node (.single 28) (.single 3)) (.node (.single 16) (.node (.single 36) (.single 23)))))) (.node (.node (.node (.node (.single 8) (.single 17)) (.node (.single 31) (.node (.single 22) (.single 4)))) (.node (.node (.single 12) (.single 35)) (.node (.single 27) (.node (.single 5) (.single 14))))) (.node (.node (.node (.single 34) (.single 25)) (.node (.single 6) (.node (.single 13) (.single 33)))) (.node (.node (.single 26) (.single 7)) (.node (.single 15) (.node (.single 32) (.single 24)))))))
def sourceData123 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9)))))) (.node (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover123 (i : Fin 40) : Fin 40 := ⟨coverData123.get i % 40, Nat.mod_lt _ (by decide)⟩
def source123 (i : Fin 40) : Fin 40 := ⟨sourceData123.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree123 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 .empty (.cutY 14336 (.cutX 7168 (.cutY 13312 (.cutX 6656 (.cutY 12800 (.cutX 6400 (.cutY 12544 (.cutX 6272 (.cutY 12416 .full .full) (.cutY 12416 (.cutX 6336 (.cutY 12352 .full .full) (.cutY 12352 (.cutX 6368 (.cutY 12320 .full .full) (.cutY 12320 .full .full)) .full)) .full)) .empty) .empty) .empty) .empty) .empty) .empty) .empty))))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 (.cutY 6144 .empty (.cutX 13312 (.cutY 7168 (.cutX 12800 (.cutY 6656 (.cutX 12544 (.cutY 6400 (.cutX 12416 (.cutY 6272 .full (.cutX 12352 (.cutY 6336 .full (.cutX 12320 (.cutY 6368 .full .full) (.cutY 6368 .full .full))) (.cutY 6336 .full .full))) (.cutY 6272 .full .full)) .empty) .empty) .empty) .empty) .empty) .empty)) .empty))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 .empty (.cutY 26624 (.cutX 19456 .empty (.cutY 25600 .empty (.cutX 19968 .empty (.cutY 26112 .empty (.cutX 20224 .empty (.cutY 26368 .empty (.cutX 20352 (.cutY 26496 .full .full) (.cutY 26496 (.cutX 20416 (.cutY 26432 .full .full) (.cutY 26432 (.cutX 20448 (.cutY 26400 .full .full) (.cutY 26400 .full .full)) .full)) .full)))))))) .empty)) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 (.cutY 18432 .empty (.cutX 25600 .empty (.cutY 19456 .empty (.cutX 26112 .empty (.cutY 19968 .empty (.cutX 26368 .empty (.cutY 20224 .empty (.cutX 26496 (.cutY 20352 .full (.cutX 26432 (.cutY 20416 .full (.cutX 26400 (.cutY 20448 .full .full) (.cutY 20448 .full .full))) (.cutY 20416 .full .full))) (.cutY 20352 .full .full))))))))) .empty) .empty) .empty) .empty))))

theorem metadata123 : 0<202650974 ∧ 24<128 ∧ 48<128 ∧ 1<4 ∧
    6704/4160=1 ∧ 6704%4160=2544 ∧ ∀ i, (leaves123 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData123).mp
    (by decide +kernel)

theorem sourceChecked123_0 : ∀ i : Fin 40,
    (fun i => output123 i = raw123 (source123 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked123 : ∀ i : Fin 40, (fun i => output123 i = raw123 (source123 i)) i :=
  forallFin_of_zero_offset (fun i => output123 i = raw123 (source123 i)) sourceChecked123_0

theorem coverChecked123_0 : ∀ i : Fin 40,
    (fun i => (output123 (cover123 i)).ContainsBox (raw123 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked123 : ∀ i : Fin 40, (fun i => (output123 (cover123 i)).ContainsBox (raw123 i)) i :=
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

noncomputable def phaseMass123 : ℝ := singlePhaseMass (202650974/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw123 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass123_eq : phaseMass123 = (101325487/819200000000 : ℝ) := by
  unfold phaseMass123
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw123 output123 cover123 source123
    (gridTreeUnionCheck_sound 32768 raw123 output123 cover123 source123 tree123 checked123)
    _ (by norm_num) _, areaUnits123]
  norm_num

-- Frozen phase 3132, atom 7998, type 1, source (46,66).
def leavesData124 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves124 : Fin 7 → DyadicLeaf := leavesData124.get
def raw124 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 46 66 leaves124 i
def outputData124 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨11776,11904,16896,17024⟩) (.node (.single ⟨11776,11904,17024,17152⟩) (.single ⟨11904,11968,16896,16960⟩))) (.node (.node (.single ⟨11904,11968,16960,17024⟩) (.single ⟨11968,12032,16896,16960⟩)) (.node (.single ⟨11968,12032,16960,17024⟩) (.single ⟨11904,12032,17024,17152⟩)))) (.node (.node (.single ⟨15616,15744,20736,20864⟩) (.node (.single ⟨15616,15744,20864,20992⟩) (.single ⟨15744,15808,20736,20800⟩))) (.node (.node (.single ⟨15744,15808,20800,20864⟩) (.single ⟨15808,15872,20736,20800⟩)) (.node (.single ⟨15808,15872,20800,20864⟩) (.single ⟨15744,15872,20864,20992⟩))))) (.node (.node (.node (.single ⟨16896,17024,11776,11904⟩) (.node (.single ⟨16896,16960,11904,11968⟩) (.single ⟨16896,16960,11968,12032⟩))) (.node (.node (.single ⟨16960,17024,11904,11968⟩) (.single ⟨16960,17024,11968,12032⟩)) (.node (.single ⟨17024,17152,11776,11904⟩) (.single ⟨17024,17152,11904,12032⟩)))) (.node (.node (.single ⟨20736,20864,15616,15744⟩) (.node (.single ⟨20736,20800,15744,15808⟩) (.single ⟨20736,20800,15808,15872⟩))) (.node (.node (.single ⟨20800,20864,15744,15808⟩) (.single ⟨20800,20864,15808,15872⟩)) (.node (.single ⟨20864,20992,15616,15744⟩) (.single ⟨20864,20992,15744,15872⟩))))))
def output124 : Fin 28 → GridBox := outputData124.get
def coverData124 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData124 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover124 (i : Fin 28) : Fin 28 := ⟨coverData124.get i % 28, Nat.mod_lt _ (by decide)⟩
def source124 (i : Fin 28) : Fin 28 := ⟨sourceData124.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree124 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 .empty (.cutY 18432 (.cutX 11264 .empty (.cutY 17408 (.cutX 11776 .empty (.cutY 16896 .empty (.cutX 12032 (.cutY 17152 (.cutX 11904 (.cutY 17024 .full .full) (.cutY 17024 (.cutX 11968 (.cutY 16960 .full .full) (.cutY 16960 .full .full)) .full)) .empty) .empty))) .empty)) .empty)) .empty) (.cutY 20480 .empty (.cutX 14336 .empty (.cutY 22528 (.cutX 15360 .empty (.cutY 21504 (.cutX 15872 (.cutY 20992 (.cutX 15616 .empty (.cutY 20736 .empty (.cutX 15744 (.cutY 20864 .full .full) (.cutY 20864 (.cutX 15808 (.cutY 20800 .full .full) (.cutY 20800 .full .full)) .full)))) .empty) .empty) .empty)) .empty)))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 (.cutY 10240 .empty (.cutX 17408 (.cutY 11264 .empty (.cutX 16896 .empty (.cutY 11776 .empty (.cutX 17152 (.cutY 12032 (.cutX 17024 (.cutY 11904 .full (.cutX 16960 (.cutY 11968 .full .full) (.cutY 11968 .full .full))) (.cutY 11904 .full .full)) .empty) .empty)))) .empty)) .empty) .empty) (.cutY 12288 .empty (.cutX 22528 (.cutY 14336 .empty (.cutX 21504 (.cutY 15360 .empty (.cutX 20992 (.cutY 15872 (.cutX 20736 .empty (.cutY 15616 .empty (.cutX 20864 (.cutY 15744 .full (.cutX 20800 (.cutY 15808 .full .full) (.cutY 15808 .full .full))) (.cutY 15744 .full .full)))) .empty) .empty)) .empty)) .empty)))) .empty) .empty))

theorem metadata124 : 0<50021215 ∧ 46<128 ∧ 66<128 ∧ 1<4 ∧
    7998/4160=1 ∧ 7998%4160=3838 ∧ ∀ i, (leaves124 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData124).mp
    (by decide +kernel)

theorem sourceChecked124_0 : ∀ i : Fin 28,
    (fun i => output124 i = raw124 (source124 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked124 : ∀ i : Fin 28, (fun i => output124 i = raw124 (source124 i)) i :=
  forallFin_of_zero_offset (fun i => output124 i = raw124 (source124 i)) sourceChecked124_0

theorem coverChecked124_0 : ∀ i : Fin 28,
    (fun i => (output124 (cover124 i)).ContainsBox (raw124 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked124 : ∀ i : Fin 28, (fun i => (output124 (cover124 i)).ContainsBox (raw124 i)) i :=
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

noncomputable def phaseMass124 : ℝ := singlePhaseMass (50021215/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw124 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass124_eq : phaseMass124 = (10004243/327680000000 : ℝ) := by
  unfold phaseMass124
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw124 output124 cover124 source124
    (gridTreeUnionCheck_sound 32768 raw124 output124 cover124 source124 tree124 checked124)
    _ (by norm_num) _, areaUnits124]
  norm_num

-- Frozen phase 3133, atom 6182, type 1, source (18,42).
def leavesData125 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves125 : Fin 13 → DyadicLeaf := leavesData125.get
def raw125 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 18 42 leaves125 i
def outputData125 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨4608,4672,10752,10816⟩) (.node (.single ⟨4608,4672,10816,10880⟩) (.single ⟨4672,4736,10752,10816⟩))) (.node (.single ⟨4672,4736,10816,10880⟩) (.node (.single ⟨4608,4736,10880,11008⟩) (.single ⟨4736,4800,10752,10816⟩)))) (.node (.node (.single ⟨4736,4800,10816,10880⟩) (.node (.single ⟨4800,4832,10752,10784⟩) (.single ⟨4800,4832,10784,10816⟩))) (.node (.node (.single ⟨4832,4864,10752,10784⟩) (.single ⟨4832,4864,10784,10816⟩)) (.node (.single ⟨4800,4864,10816,10880⟩) (.single ⟨4736,4864,10880,11008⟩))))) (.node (.node (.node (.single ⟨10752,10816,4608,4672⟩) (.node (.single ⟨10752,10816,4672,4736⟩) (.single ⟨10816,10880,4608,4672⟩))) (.node (.single ⟨10816,10880,4672,4736⟩) (.node (.single ⟨10752,10816,4736,4800⟩) (.single ⟨10752,10784,4800,4832⟩)))) (.node (.node (.single ⟨10752,10784,4832,4864⟩) (.node (.single ⟨10784,10816,4800,4832⟩) (.single ⟨10784,10816,4832,4864⟩))) (.node (.node (.single ⟨10816,10880,4736,4800⟩) (.single ⟨10816,10880,4800,4864⟩)) (.node (.single ⟨10880,11008,4608,4736⟩) (.single ⟨10880,11008,4736,4864⟩)))))) (.node (.node (.node (.node (.single ⟨21760,21888,27904,28032⟩) (.node (.single ⟨21760,21888,28032,28160⟩) (.single ⟨21888,21952,27904,27968⟩))) (.node (.single ⟨21888,21952,27968,28032⟩) (.node (.single ⟨21952,21984,27904,27936⟩) (.single ⟨21952,21984,27936,27968⟩)))) (.node (.node (.single ⟨21984,22016,27904,27936⟩) (.node (.single ⟨21984,22016,27936,27968⟩) (.single ⟨21952,22016,27968,28032⟩))) (.node (.node (.single ⟨21888,21952,28032,28096⟩) (.single ⟨21888,21952,28096,28160⟩)) (.node (.single ⟨21952,22016,28032,28096⟩) (.single ⟨21952,22016,28096,28160⟩))))) (.node (.node (.node (.single ⟨27904,28032,21760,21888⟩) (.node (.single ⟨27904,27968,21888,21952⟩) (.single ⟨27904,27936,21952,21984⟩))) (.node (.single ⟨27904,27936,21984,22016⟩) (.node (.single ⟨27936,27968,21952,21984⟩) (.single ⟨27936,27968,21984,22016⟩)))) (.node (.node (.single ⟨27968,28032,21888,21952⟩) (.node (.single ⟨27968,28032,21952,22016⟩) (.single ⟨28032,28160,21760,21888⟩))) (.node (.node (.single ⟨28032,28096,21888,21952⟩) (.single ⟨28032,28096,21952,22016⟩)) (.node (.single ⟨28096,28160,21888,21952⟩) (.single ⟨28096,28160,21952,22016⟩)))))))
def output125 : Fin 52 → GridBox := outputData125.get
def coverData125 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 24) (.single 47))) (.node (.single 27) (.node (.single 12) (.single 25)))) (.node (.node (.single 39) (.node (.single 26) (.single 5))) (.node (.node (.single 17) (.single 46)) (.node (.single 34) (.single 6))))) (.node (.node (.node (.single 22) (.node (.single 45) (.single 29))) (.node (.single 11) (.node (.single 23) (.single 40)))) (.node (.node (.single 28) (.node (.single 0) (.single 13))) (.node (.node (.single 51) (.single 38)) (.node (.single 1) (.single 15)))))) (.node (.node (.node (.node (.single 50) (.node (.single 36) (.single 2))) (.node (.single 14) (.node (.single 49) (.single 37)))) (.node (.node (.single 3) (.node (.single 16) (.single 48))) (.node (.node (.single 35) (.single 7)) (.node (.single 18) (.single 44))))) (.node (.node (.node (.single 33) (.node (.single 8) (.single 20))) (.node (.single 43) (.node (.single 31) (.single 9)))) (.node (.node (.single 19) (.node (.single 42) (.single 32))) (.node (.node (.single 10) (.single 21)) (.node (.single 41) (.single 30)))))))
def sourceData125 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover125 (i : Fin 52) : Fin 52 := ⟨coverData125.get i % 52, Nat.mod_lt _ (by decide)⟩
def source125 (i : Fin 52) : Fin 52 := ⟨sourceData125.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree125 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 (.cutY 10240 .empty (.cutX 5120 (.cutY 11264 (.cutX 4608 .empty (.cutY 10752 .empty (.cutX 4864 (.cutY 11008 (.cutX 4736 (.cutY 10880 (.cutX 4672 (.cutY 10816 .full .full) (.cutY 10816 .full .full)) .full) (.cutY 10880 (.cutX 4800 (.cutY 10816 .full .full) (.cutY 10816 (.cutX 4832 (.cutY 10784 .full .full) (.cutY 10784 .full .full)) .full)) .full)) .empty) .empty))) .empty) .empty)) .empty) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 .empty (.cutY 6144 (.cutX 11264 (.cutY 5120 (.cutX 10752 .empty (.cutY 4608 .empty (.cutX 11008 (.cutY 4864 (.cutX 10880 (.cutY 4736 (.cutX 10816 (.cutY 4672 .full .full) (.cutY 4672 .full .full)) (.cutX 10816 (.cutY 4800 .full (.cutX 10784 (.cutY 4832 .full .full) (.cutY 4832 .full .full))) (.cutY 4800 .full .full))) (.cutY 4736 .full .full)) .empty) .empty))) .empty) .empty) .empty))) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 (.cutY 26624 .empty (.cutX 21504 .empty (.cutY 27648 .empty (.cutX 22016 (.cutY 28160 (.cutX 21760 .empty (.cutY 27904 .empty (.cutX 21888 (.cutY 28032 .full .full) (.cutY 28032 (.cutX 21952 (.cutY 27968 .full .full) (.cutY 27968 (.cutX 21984 (.cutY 27936 .full .full) (.cutY 27936 .full .full)) .full)) (.cutX 21952 (.cutY 28096 .full .full) (.cutY 28096 .full .full)))))) .empty) .empty)))) .empty) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 .empty (.cutY 22528 (.cutX 27648 .empty (.cutY 21504 .empty (.cutX 28160 (.cutY 22016 (.cutX 27904 .empty (.cutY 21760 .empty (.cutX 28032 (.cutY 21888 .full (.cutX 27968 (.cutY 21952 .full (.cutX 27936 (.cutY 21984 .full .full) (.cutY 21984 .full .full))) (.cutY 21952 .full .full))) (.cutY 21888 .full (.cutX 28096 (.cutY 21952 .full .full) (.cutY 21952 .full .full)))))) .empty) .empty))) .empty))) .empty) .empty))))

theorem metadata125 : 0<22259151 ∧ 18<128 ∧ 42<128 ∧ 1<4 ∧
    6182/4160=1 ∧ 6182%4160=2022 ∧ ∀ i, (leaves125 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData125).mp
    (by decide +kernel)

theorem sourceChecked125_0 : ∀ i : Fin 52,
    (fun i => output125 i = raw125 (source125 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked125 : ∀ i : Fin 52, (fun i => output125 i = raw125 (source125 i)) i :=
  forallFin_of_zero_offset (fun i => output125 i = raw125 (source125 i)) sourceChecked125_0

theorem coverChecked125_0 : ∀ i : Fin 52,
    (fun i => (output125 (cover125 i)).ContainsBox (raw125 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked125 : ∀ i : Fin 52, (fun i => (output125 (cover125 i)).ContainsBox (raw125 i)) i :=
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

noncomputable def phaseMass125 : ℝ := singlePhaseMass (22259151/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw125 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass125_eq : phaseMass125 = (22259151/1638400000000 : ℝ) := by
  unfold phaseMass125
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw125 output125 cover125 source125
    (gridTreeUnionCheck_sound 32768 raw125 output125 cover125 source125 tree125 checked125)
    _ (by norm_num) _, areaUnits125]
  norm_num

-- Frozen phase 3134, atom 2997, type 0, source (30,57).
def leavesData126 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves126 : Fin 1 → DyadicLeaf := leavesData126.get
def raw126 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 30 57 leaves126 i
def outputData126 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨7680,7936,14592,14848⟩) (.single ⟨14592,14848,7680,7936⟩)) (.node (.single ⟨17920,18176,24832,25088⟩) (.single ⟨24832,25088,17920,18176⟩)))
def output126 : Fin 4 → GridBox := outputData126.get
def coverData126 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData126 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover126 (i : Fin 4) : Fin 4 := ⟨coverData126.get i % 4, Nat.mod_lt _ (by decide)⟩
def source126 (i : Fin 4) : Fin 4 := ⟨sourceData126.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree126 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 .empty (.cutY 14336 .empty (.cutX 7168 .empty (.cutY 15360 (.cutX 7680 .empty (.cutY 14848 (.cutX 7936 (.cutY 14592 .empty .full) .empty) .empty)) .empty))))))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 .empty (.cutY 6144 .empty (.cutX 15360 (.cutY 7168 .empty (.cutX 14848 (.cutY 7680 .empty (.cutX 14592 .empty (.cutY 7936 .full .empty))) .empty)) .empty))))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 (.cutY 26624 (.cutX 17408 .empty (.cutY 25600 (.cutX 17920 .empty (.cutY 25088 (.cutX 18176 (.cutY 24832 .empty .full) .empty) .empty)) .empty)) .empty) .empty) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 (.cutY 18432 (.cutX 25600 (.cutY 17408 .empty (.cutX 25088 (.cutY 17920 .empty (.cutX 24832 .empty (.cutY 18176 .full .empty))) .empty)) .empty) .empty) .empty) .empty) .empty) .empty))))

theorem metadata126 : 0<29910597 ∧ 30<128 ∧ 57<128 ∧ 0<4 ∧
    2997/4160=0 ∧ 2997%4160=2997 ∧ ∀ i, (leaves126 i).Valid 8 := by
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

noncomputable def phaseMass126 : ℝ := singlePhaseMass (29910597/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw126 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass126_eq : phaseMass126 = (29910597/1638400000000 : ℝ) := by
  unfold phaseMass126
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw126 output126 cover126 source126
    (gridTreeUnionCheck_sound 32768 raw126 output126 cover126 source126 tree126 checked126)
    _ (by norm_num) _, areaUnits126]
  norm_num

-- Frozen phase 3135, atom 2383, type 0, source (22,51).
def leavesData127 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves127 : Fin 4 → DyadicLeaf := leavesData127.get
def raw127 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 22 51 leaves127 i
def outputData127 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨5632,5760,13056,13184⟩) (.single ⟨5632,5760,13184,13312⟩)) (.node (.single ⟨5760,5888,13056,13184⟩) (.single ⟨5760,5888,13184,13312⟩))) (.node (.node (.single ⟨13056,13184,5632,5760⟩) (.single ⟨13056,13184,5760,5888⟩)) (.node (.single ⟨13184,13312,5632,5760⟩) (.single ⟨13184,13312,5760,5888⟩)))) (.node (.node (.node (.single ⟨19456,19584,26880,27008⟩) (.single ⟨19456,19584,27008,27136⟩)) (.node (.single ⟨19584,19712,26880,27008⟩) (.single ⟨19584,19712,27008,27136⟩))) (.node (.node (.single ⟨26880,27008,19456,19584⟩) (.single ⟨26880,27008,19584,19712⟩)) (.node (.single ⟨27008,27136,19456,19584⟩) (.single ⟨27008,27136,19584,19712⟩)))))
def output127 : Fin 16 → GridBox := outputData127.get
def coverData127 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData127 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover127 (i : Fin 16) : Fin 16 := ⟨coverData127.get i % 16, Nat.mod_lt _ (by decide)⟩
def source127 (i : Fin 16) : Fin 16 := ⟨sourceData127.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree127 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 (.cutY 14336 (.cutX 5120 .empty (.cutY 13312 (.cutX 5632 .empty (.cutY 12800 .empty (.cutX 5888 (.cutY 13056 .empty (.cutX 5760 (.cutY 13184 .full .full) (.cutY 13184 .full .full))) .empty))) .empty)) .empty) .empty)))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 (.cutY 6144 (.cutX 13312 (.cutY 5120 .empty (.cutX 12800 .empty (.cutY 5632 .empty (.cutX 13056 .empty (.cutY 5888 (.cutX 13184 (.cutY 5760 .full .full) (.cutY 5760 .full .full)) .empty))))) .empty) .empty) .empty))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 .empty (.cutY 26624 .empty (.cutX 19456 .empty (.cutY 27648 (.cutX 19968 (.cutY 27136 (.cutX 19712 (.cutY 26880 .empty (.cutX 19584 (.cutY 27008 .full .full) (.cutY 27008 .full .full))) .empty) .empty) .empty) .empty)))) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 .empty (.cutY 18432 .empty (.cutX 27648 (.cutY 19456 .empty (.cutX 27136 (.cutY 19968 (.cutX 26880 .empty (.cutY 19712 (.cutX 27008 (.cutY 19584 .full .full) (.cutY 19584 .full .full)) .empty)) .empty) .empty)) .empty))) .empty) .empty) .empty))))

theorem metadata127 : 0<204777576 ∧ 22<128 ∧ 51<128 ∧ 0<4 ∧
    2383/4160=0 ∧ 2383%4160=2383 ∧ ∀ i, (leaves127 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData127).mp
    (by decide +kernel)

theorem sourceChecked127_0 : ∀ i : Fin 16,
    (fun i => output127 i = raw127 (source127 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked127 : ∀ i : Fin 16, (fun i => output127 i = raw127 (source127 i)) i :=
  forallFin_of_zero_offset (fun i => output127 i = raw127 (source127 i)) sourceChecked127_0

theorem coverChecked127_0 : ∀ i : Fin 16,
    (fun i => (output127 (cover127 i)).ContainsBox (raw127 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked127 : ∀ i : Fin 16, (fun i => (output127 (cover127 i)).ContainsBox (raw127 i)) i :=
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

noncomputable def phaseMass127 : ℝ := singlePhaseMass (204777576/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw127 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass127_eq : phaseMass127 = (25597197/204800000000 : ℝ) := by
  unfold phaseMass127
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw127 output127 cover127 source127
    (gridTreeUnionCheck_sound 32768 raw127 output127 cover127 source127 tree127 checked127)
    _ (by norm_num) _, areaUnits127]
  norm_num

noncomputable def batchActualMass : ℝ := [phaseMass0,phaseMass1,phaseMass2,phaseMass3,phaseMass4,phaseMass5,phaseMass6,phaseMass7,phaseMass8,phaseMass9,phaseMass10,phaseMass11,phaseMass12,phaseMass13,phaseMass14,phaseMass15,phaseMass16,phaseMass17,phaseMass18,phaseMass19,phaseMass20,phaseMass21,phaseMass22,phaseMass23,phaseMass24,phaseMass25,phaseMass26,phaseMass27,phaseMass28,phaseMass29,phaseMass30,phaseMass31,phaseMass32,phaseMass33,phaseMass34,phaseMass35,phaseMass36,phaseMass37,phaseMass38,phaseMass39,phaseMass40,phaseMass41,phaseMass42,phaseMass43,phaseMass44,phaseMass45,phaseMass46,phaseMass47,phaseMass48,phaseMass49,phaseMass50,phaseMass51,phaseMass52,phaseMass53,phaseMass54,phaseMass55,phaseMass56,phaseMass57,phaseMass58,phaseMass59,phaseMass60,phaseMass61,phaseMass62,phaseMass63,phaseMass64,phaseMass65,phaseMass66,phaseMass67,phaseMass68,phaseMass69,phaseMass70,phaseMass71,phaseMass72,phaseMass73,phaseMass74,phaseMass75,phaseMass76,phaseMass77,phaseMass78,phaseMass79,phaseMass80,phaseMass81,phaseMass82,phaseMass83,phaseMass84,phaseMass85,phaseMass86,phaseMass87,phaseMass88,phaseMass89,phaseMass90,phaseMass91,phaseMass92,phaseMass93,phaseMass94,phaseMass95,phaseMass96,phaseMass97,phaseMass98,phaseMass99,phaseMass100,phaseMass101,phaseMass102,phaseMass103,phaseMass104,phaseMass105,phaseMass106,phaseMass107,phaseMass108,phaseMass109,phaseMass110,phaseMass111,phaseMass112,phaseMass113,phaseMass114,phaseMass115,phaseMass116,phaseMass117,phaseMass118,phaseMass119,phaseMass120,phaseMass121,phaseMass122,phaseMass123,phaseMass124,phaseMass125,phaseMass126,phaseMass127].sum

theorem actual_batch_mass : batchActualMass = (5159726499/327680000000 : ℝ) := by
  unfold batchActualMass
  rw [phaseMass0_eq,phaseMass1_eq,phaseMass2_eq,phaseMass3_eq,phaseMass4_eq,phaseMass5_eq,phaseMass6_eq,phaseMass7_eq,phaseMass8_eq,phaseMass9_eq,phaseMass10_eq,phaseMass11_eq,phaseMass12_eq,phaseMass13_eq,phaseMass14_eq,phaseMass15_eq,phaseMass16_eq,phaseMass17_eq,phaseMass18_eq,phaseMass19_eq,phaseMass20_eq,phaseMass21_eq,phaseMass22_eq,phaseMass23_eq,phaseMass24_eq,phaseMass25_eq,phaseMass26_eq,phaseMass27_eq,phaseMass28_eq,phaseMass29_eq,phaseMass30_eq,phaseMass31_eq,phaseMass32_eq,phaseMass33_eq,phaseMass34_eq,phaseMass35_eq,phaseMass36_eq,phaseMass37_eq,phaseMass38_eq,phaseMass39_eq,phaseMass40_eq,phaseMass41_eq,phaseMass42_eq,phaseMass43_eq,phaseMass44_eq,phaseMass45_eq,phaseMass46_eq,phaseMass47_eq,phaseMass48_eq,phaseMass49_eq,phaseMass50_eq,phaseMass51_eq,phaseMass52_eq,phaseMass53_eq,phaseMass54_eq,phaseMass55_eq,phaseMass56_eq,phaseMass57_eq,phaseMass58_eq,phaseMass59_eq,phaseMass60_eq,phaseMass61_eq,phaseMass62_eq,phaseMass63_eq,phaseMass64_eq,phaseMass65_eq,phaseMass66_eq,phaseMass67_eq,phaseMass68_eq,phaseMass69_eq,phaseMass70_eq,phaseMass71_eq,phaseMass72_eq,phaseMass73_eq,phaseMass74_eq,phaseMass75_eq,phaseMass76_eq,phaseMass77_eq,phaseMass78_eq,phaseMass79_eq,phaseMass80_eq,phaseMass81_eq,phaseMass82_eq,phaseMass83_eq,phaseMass84_eq,phaseMass85_eq,phaseMass86_eq,phaseMass87_eq,phaseMass88_eq,phaseMass89_eq,phaseMass90_eq,phaseMass91_eq,phaseMass92_eq,phaseMass93_eq,phaseMass94_eq,phaseMass95_eq,phaseMass96_eq,phaseMass97_eq,phaseMass98_eq,phaseMass99_eq,phaseMass100_eq,phaseMass101_eq,phaseMass102_eq,phaseMass103_eq,phaseMass104_eq,phaseMass105_eq,phaseMass106_eq,phaseMass107_eq,phaseMass108_eq,phaseMass109_eq,phaseMass110_eq,phaseMass111_eq,phaseMass112_eq,phaseMass113_eq,phaseMass114_eq,phaseMass115_eq,phaseMass116_eq,phaseMass117_eq,phaseMass118_eq,phaseMass119_eq,phaseMass120_eq,phaseMass121_eq,phaseMass122_eq,phaseMass123_eq,phaseMass124_eq,phaseMass125_eq,phaseMass126_eq,phaseMass127_eq]
  norm_num

end NoThreeLine.ScheduleUnionBatch03008
#print axioms NoThreeLine.ScheduleUnionBatch03008.actual_batch_mass
