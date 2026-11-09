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
namespace NoThreeLine.ScheduleUnionBatch00160

-- Frozen phase 160, atom 2439, type 0, source (23,24).
def leavesData0 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves0 : Fin 1 → DyadicLeaf := leavesData0.get
def raw0 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 23 24 leaves0 i
def outputData0 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨5888,6144,6144,6400⟩) (.single ⟨6144,6400,5888,6144⟩)) (.node (.single ⟨26368,26624,26624,26880⟩) (.single ⟨26624,26880,26368,26624⟩)))
def output0 : Fin 4 → GridBox := outputData0.get
def coverData0 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData0 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover0 (i : Fin 4) : Fin 4 := ⟨coverData0.get i % 4, Nat.mod_lt _ (by decide)⟩
def source0 (i : Fin 4) : Fin 4 := ⟨sourceData0.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree0 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 (.cutY 6144 .empty (.cutX 5120 .empty (.cutY 7168 (.cutX 5632 .empty (.cutY 6656 (.cutX 5888 .empty (.cutY 6400 .full .empty)) .empty)) .empty))) (.cutY 6144 (.cutX 7168 (.cutY 5120 .empty (.cutX 6656 (.cutY 5632 .empty (.cutX 6400 (.cutY 5888 .empty .full) .empty)) .empty)) .empty) .empty)))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 (.cutY 26624 .empty (.cutX 25600 .empty (.cutY 27648 (.cutX 26112 .empty (.cutY 27136 (.cutX 26368 .empty (.cutY 26880 .full .empty)) .empty)) .empty))) (.cutY 26624 (.cutX 27648 (.cutY 25600 .empty (.cutX 27136 (.cutY 26112 .empty (.cutX 26880 (.cutY 26368 .empty .full) .empty)) .empty)) .empty) .empty)) .empty) .empty)))))

theorem metadata0 : 0<327195324 ∧ 23<128 ∧ 24<128 ∧ 0<4 ∧
    2439/4160=0 ∧ 2439%4160=2439 ∧ ∀ i, (leaves0 i).Valid 8 := by
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

noncomputable def phaseMass0 : ℝ := singlePhaseMass (327195324/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw0 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass0_eq : phaseMass0 = (81798831/409600000000 : ℝ) := by
  unfold phaseMass0
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw0 output0 cover0 source0
    (gridTreeUnionCheck_sound 32768 raw0 output0 cover0 source0 tree0 checked0)
    _ (by norm_num) _, areaUnits0]
  norm_num

-- Frozen phase 161, atom 2438, type 0, source (23,23).
def leavesData1 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves1 : Fin 1 → DyadicLeaf := leavesData1.get
def raw1 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 23 23 leaves1 i
def outputData1 : FiniteInputTree GridBox 2 := (.node (.single ⟨5888,6144,5888,6144⟩) (.single ⟨26624,26880,26624,26880⟩))
def output1 : Fin 2 → GridBox := outputData1.get
def coverData1 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 0)) (.node (.single 1) (.single 1)))
def sourceData1 : FiniteInputTree ℕ 2 := (.node (.single 0) (.single 2))
def cover1 (i : Fin 4) : Fin 2 := ⟨coverData1.get i % 2, Nat.mod_lt _ (by decide)⟩
def source1 (i : Fin 2) : Fin 4 := ⟨sourceData1.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree1 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 (.cutY 6144 (.cutX 5120 .empty (.cutY 5120 .empty (.cutX 5632 .empty (.cutY 5632 .empty (.cutX 5888 .empty (.cutY 5888 .empty .full)))))) .empty) .empty))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 .empty (.cutY 26624 .empty (.cutX 27648 (.cutY 27648 (.cutX 27136 (.cutY 27136 (.cutX 26880 (.cutY 26880 .full .empty) .empty) .empty) .empty) .empty) .empty))) .empty) .empty)))))

theorem metadata1 : 0<320668678 ∧ 23<128 ∧ 23<128 ∧ 0<4 ∧
    2438/4160=0 ∧ 2438%4160=2438 ∧ ∀ i, (leaves1 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData1).mp
    (by decide +kernel)

theorem sourceChecked1_0 : ∀ i : Fin 2,
    (fun i => output1 i = raw1 (source1 i)) (finOffset 2 0 2 (by decide) i) := by decide +kernel

theorem sourceChecked1 : ∀ i : Fin 2, (fun i => output1 i = raw1 (source1 i)) i :=
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

theorem areaUnits1 : gridUnionAreaUnits output1 = 131072 := by decide +kernel

noncomputable def phaseMass1 : ℝ := singlePhaseMass (320668678/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw1 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass1_eq : phaseMass1 = (160334339/1638400000000 : ℝ) := by
  unfold phaseMass1
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw1 output1 cover1 source1
    (gridTreeUnionCheck_sound 32768 raw1 output1 cover1 source1 tree1 checked1)
    _ (by norm_num) _, areaUnits1]
  norm_num

-- Frozen phase 162, atom 2355, type 0, source (22,23).
def leavesData2 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves2 : Fin 1 → DyadicLeaf := leavesData2.get
def raw2 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 22 23 leaves2 i
def outputData2 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨5632,5888,5888,6144⟩) (.single ⟨5888,6144,5632,5888⟩)) (.node (.single ⟨26624,26880,26880,27136⟩) (.single ⟨26880,27136,26624,26880⟩)))
def output2 : Fin 4 → GridBox := outputData2.get
def coverData2 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData2 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover2 (i : Fin 4) : Fin 4 := ⟨coverData2.get i % 4, Nat.mod_lt _ (by decide)⟩
def source2 (i : Fin 4) : Fin 4 := ⟨sourceData2.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree2 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 (.cutY 6144 (.cutX 5120 .empty (.cutY 5120 .empty (.cutX 5632 .empty (.cutY 5632 .empty (.cutX 5888 (.cutY 5888 .empty .full) (.cutY 5888 .full .empty)))))) .empty) .empty))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 .empty (.cutY 26624 .empty (.cutX 27648 (.cutY 27648 (.cutX 27136 (.cutY 27136 (.cutX 26880 (.cutY 26880 .empty .full) (.cutY 26880 .full .empty)) .empty) .empty) .empty) .empty))) .empty) .empty)))))

theorem metadata2 : 0<320668678 ∧ 22<128 ∧ 23<128 ∧ 0<4 ∧
    2355/4160=0 ∧ 2355%4160=2355 ∧ ∀ i, (leaves2 i).Valid 8 := by
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

noncomputable def phaseMass2 : ℝ := singlePhaseMass (320668678/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw2 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass2_eq : phaseMass2 = (160334339/819200000000 : ℝ) := by
  unfold phaseMass2
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw2 output2 cover2 source2
    (gridTreeUnionCheck_sound 32768 raw2 output2 cover2 source2 tree2 checked2)
    _ (by norm_num) _, areaUnits2]
  norm_num

-- Frozen phase 163, atom 2354, type 0, source (22,22).
def leavesData3 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves3 : Fin 1 → DyadicLeaf := leavesData3.get
def raw3 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 22 22 leaves3 i
def outputData3 : FiniteInputTree GridBox 2 := (.node (.single ⟨5632,5888,5632,5888⟩) (.single ⟨26880,27136,26880,27136⟩))
def output3 : Fin 2 → GridBox := outputData3.get
def coverData3 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 0)) (.node (.single 1) (.single 1)))
def sourceData3 : FiniteInputTree ℕ 2 := (.node (.single 0) (.single 2))
def cover3 (i : Fin 4) : Fin 2 := ⟨coverData3.get i % 2, Nat.mod_lt _ (by decide)⟩
def source3 (i : Fin 2) : Fin 4 := ⟨sourceData3.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree3 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 (.cutY 6144 (.cutX 5120 .empty (.cutY 5120 .empty (.cutX 5632 .empty (.cutY 5632 .empty (.cutX 5888 (.cutY 5888 .full .empty) .empty))))) .empty) .empty))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 .empty (.cutY 26624 .empty (.cutX 27648 (.cutY 27648 (.cutX 27136 (.cutY 27136 (.cutX 26880 .empty (.cutY 26880 .empty .full)) .empty) .empty) .empty) .empty))) .empty) .empty)))))

theorem metadata3 : 0<320668678 ∧ 22<128 ∧ 22<128 ∧ 0<4 ∧
    2354/4160=0 ∧ 2354%4160=2354 ∧ ∀ i, (leaves3 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData3).mp
    (by decide +kernel)

theorem sourceChecked3_0 : ∀ i : Fin 2,
    (fun i => output3 i = raw3 (source3 i)) (finOffset 2 0 2 (by decide) i) := by decide +kernel

theorem sourceChecked3 : ∀ i : Fin 2, (fun i => output3 i = raw3 (source3 i)) i :=
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

theorem areaUnits3 : gridUnionAreaUnits output3 = 131072 := by decide +kernel

noncomputable def phaseMass3 : ℝ := singlePhaseMass (320668678/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw3 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass3_eq : phaseMass3 = (160334339/1638400000000 : ℝ) := by
  unfold phaseMass3
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw3 output3 cover3 source3
    (gridTreeUnionCheck_sound 32768 raw3 output3 cover3 source3 tree3 checked3)
    _ (by norm_num) _, areaUnits3]
  norm_num

-- Frozen phase 164, atom 2357, type 0, source (22,25).
def leavesData4 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves4 : Fin 1 → DyadicLeaf := leavesData4.get
def raw4 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 22 25 leaves4 i
def outputData4 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨5632,5888,6400,6656⟩) (.single ⟨6400,6656,5632,5888⟩)) (.node (.single ⟨26112,26368,26880,27136⟩) (.single ⟨26880,27136,26112,26368⟩)))
def output4 : Fin 4 → GridBox := outputData4.get
def coverData4 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData4 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover4 (i : Fin 4) : Fin 4 := ⟨coverData4.get i % 4, Nat.mod_lt _ (by decide)⟩
def source4 (i : Fin 4) : Fin 4 := ⟨sourceData4.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree4 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 (.cutY 6144 .empty (.cutX 5120 .empty (.cutY 7168 (.cutX 5632 .empty (.cutY 6656 (.cutX 5888 (.cutY 6400 .empty .full) .empty) .empty)) .empty))) (.cutY 6144 (.cutX 7168 (.cutY 5120 .empty (.cutX 6656 (.cutY 5632 .empty (.cutX 6400 .empty (.cutY 5888 .full .empty))) .empty)) .empty) .empty)))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 (.cutY 26624 .empty (.cutX 25600 .empty (.cutY 27648 (.cutX 26112 .empty (.cutY 27136 (.cutX 26368 (.cutY 26880 .empty .full) .empty) .empty)) .empty))) (.cutY 26624 (.cutX 27648 (.cutY 25600 .empty (.cutX 27136 (.cutY 26112 .empty (.cutX 26880 .empty (.cutY 26368 .full .empty))) .empty)) .empty) .empty)) .empty) .empty)))))

theorem metadata4 : 0<327195324 ∧ 22<128 ∧ 25<128 ∧ 0<4 ∧
    2357/4160=0 ∧ 2357%4160=2357 ∧ ∀ i, (leaves4 i).Valid 8 := by
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

noncomputable def phaseMass4 : ℝ := singlePhaseMass (327195324/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw4 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass4_eq : phaseMass4 = (81798831/409600000000 : ℝ) := by
  unfold phaseMass4
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw4 output4 cover4 source4
    (gridTreeUnionCheck_sound 32768 raw4 output4 cover4 source4 tree4 checked4)
    _ (by norm_num) _, areaUnits4]
  norm_num

-- Frozen phase 165, atom 2356, type 0, source (22,24).
def leavesData5 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves5 : Fin 1 → DyadicLeaf := leavesData5.get
def raw5 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 22 24 leaves5 i
def outputData5 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨5632,5888,6144,6400⟩) (.single ⟨6144,6400,5632,5888⟩)) (.node (.single ⟨26368,26624,26880,27136⟩) (.single ⟨26880,27136,26368,26624⟩)))
def output5 : Fin 4 → GridBox := outputData5.get
def coverData5 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData5 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover5 (i : Fin 4) : Fin 4 := ⟨coverData5.get i % 4, Nat.mod_lt _ (by decide)⟩
def source5 (i : Fin 4) : Fin 4 := ⟨sourceData5.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree5 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 (.cutY 6144 .empty (.cutX 5120 .empty (.cutY 7168 (.cutX 5632 .empty (.cutY 6656 (.cutX 5888 (.cutY 6400 .full .empty) .empty) .empty)) .empty))) (.cutY 6144 (.cutX 7168 (.cutY 5120 .empty (.cutX 6656 (.cutY 5632 .empty (.cutX 6400 (.cutY 5888 .full .empty) .empty)) .empty)) .empty) .empty)))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 (.cutY 26624 .empty (.cutX 25600 .empty (.cutY 27648 (.cutX 26112 .empty (.cutY 27136 (.cutX 26368 .empty (.cutY 26880 .empty .full)) .empty)) .empty))) (.cutY 26624 (.cutX 27648 (.cutY 25600 .empty (.cutX 27136 (.cutY 26112 .empty (.cutX 26880 .empty (.cutY 26368 .empty .full))) .empty)) .empty) .empty)) .empty) .empty)))))

theorem metadata5 : 0<327195324 ∧ 22<128 ∧ 24<128 ∧ 0<4 ∧
    2356/4160=0 ∧ 2356%4160=2356 ∧ ∀ i, (leaves5 i).Valid 8 := by
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

noncomputable def phaseMass5 : ℝ := singlePhaseMass (327195324/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw5 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass5_eq : phaseMass5 = (81798831/409600000000 : ℝ) := by
  unfold phaseMass5
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw5 output5 cover5 source5
    (gridTreeUnionCheck_sound 32768 raw5 output5 cover5 source5 tree5 checked5)
    _ (by norm_num) _, areaUnits5]
  norm_num

-- Frozen phase 166, atom 2271, type 0, source (21,24).
def leavesData6 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves6 : Fin 1 → DyadicLeaf := leavesData6.get
def raw6 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 21 24 leaves6 i
def outputData6 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨5376,5632,6144,6400⟩) (.single ⟨6144,6400,5376,5632⟩)) (.node (.single ⟨26368,26624,27136,27392⟩) (.single ⟨27136,27392,26368,26624⟩)))
def output6 : Fin 4 → GridBox := outputData6.get
def coverData6 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData6 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover6 (i : Fin 4) : Fin 4 := ⟨coverData6.get i % 4, Nat.mod_lt _ (by decide)⟩
def source6 (i : Fin 4) : Fin 4 := ⟨sourceData6.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree6 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 (.cutY 6144 .empty (.cutX 5120 .empty (.cutY 7168 (.cutX 5632 (.cutY 6656 (.cutX 5376 .empty (.cutY 6400 .full .empty)) .empty) .empty) .empty))) (.cutY 6144 (.cutX 7168 (.cutY 5120 .empty (.cutX 6656 (.cutY 5632 (.cutX 6400 (.cutY 5376 .empty .full) .empty) .empty) .empty)) .empty) .empty)))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 (.cutY 26624 .empty (.cutX 25600 .empty (.cutY 27648 (.cutX 26112 .empty (.cutY 27136 .empty (.cutX 26368 .empty (.cutY 27392 .full .empty)))) .empty))) (.cutY 26624 (.cutX 27648 (.cutY 25600 .empty (.cutX 27136 .empty (.cutY 26112 .empty (.cutX 27392 (.cutY 26368 .empty .full) .empty)))) .empty) .empty)) .empty) .empty)))))

theorem metadata6 : 0<327195324 ∧ 21<128 ∧ 24<128 ∧ 0<4 ∧
    2271/4160=0 ∧ 2271%4160=2271 ∧ ∀ i, (leaves6 i).Valid 8 := by
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

noncomputable def phaseMass6 : ℝ := singlePhaseMass (327195324/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw6 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass6_eq : phaseMass6 = (81798831/409600000000 : ℝ) := by
  unfold phaseMass6
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw6 output6 cover6 source6
    (gridTreeUnionCheck_sound 32768 raw6 output6 cover6 source6 tree6 checked6)
    _ (by norm_num) _, areaUnits6]
  norm_num

-- Frozen phase 167, atom 2270, type 0, source (21,23).
def leavesData7 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves7 : Fin 1 → DyadicLeaf := leavesData7.get
def raw7 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 21 23 leaves7 i
def outputData7 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨5376,5632,5888,6144⟩) (.single ⟨5888,6144,5376,5632⟩)) (.node (.single ⟨26624,26880,27136,27392⟩) (.single ⟨27136,27392,26624,26880⟩)))
def output7 : Fin 4 → GridBox := outputData7.get
def coverData7 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData7 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover7 (i : Fin 4) : Fin 4 := ⟨coverData7.get i % 4, Nat.mod_lt _ (by decide)⟩
def source7 (i : Fin 4) : Fin 4 := ⟨sourceData7.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree7 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 (.cutY 6144 (.cutX 5120 .empty (.cutY 5120 .empty (.cutX 5632 (.cutY 5632 .empty (.cutX 5376 .empty (.cutY 5888 .empty .full))) (.cutY 5632 (.cutX 5888 .empty (.cutY 5376 .empty .full)) .empty)))) .empty) .empty))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 .empty (.cutY 26624 .empty (.cutX 27648 (.cutY 27648 (.cutX 27136 (.cutY 27136 .empty (.cutX 26880 (.cutY 27392 .full .empty) .empty)) (.cutY 27136 (.cutX 27392 (.cutY 26880 .full .empty) .empty) .empty)) .empty) .empty))) .empty) .empty)))))

theorem metadata7 : 0<320668678 ∧ 21<128 ∧ 23<128 ∧ 0<4 ∧
    2270/4160=0 ∧ 2270%4160=2270 ∧ ∀ i, (leaves7 i).Valid 8 := by
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

noncomputable def phaseMass7 : ℝ := singlePhaseMass (320668678/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw7 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass7_eq : phaseMass7 = (160334339/819200000000 : ℝ) := by
  unfold phaseMass7
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw7 output7 cover7 source7
    (gridTreeUnionCheck_sound 32768 raw7 output7 cover7 source7 tree7 checked7)
    _ (by norm_num) _, areaUnits7]
  norm_num

-- Frozen phase 168, atom 2269, type 0, source (21,22).
def leavesData8 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves8 : Fin 1 → DyadicLeaf := leavesData8.get
def raw8 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 21 22 leaves8 i
def outputData8 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨5376,5632,5632,5888⟩) (.single ⟨5632,5888,5376,5632⟩)) (.node (.single ⟨26880,27136,27136,27392⟩) (.single ⟨27136,27392,26880,27136⟩)))
def output8 : Fin 4 → GridBox := outputData8.get
def coverData8 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData8 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover8 (i : Fin 4) : Fin 4 := ⟨coverData8.get i % 4, Nat.mod_lt _ (by decide)⟩
def source8 (i : Fin 4) : Fin 4 := ⟨sourceData8.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree8 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 (.cutY 6144 (.cutX 5120 .empty (.cutY 5120 .empty (.cutX 5632 (.cutY 5632 .empty (.cutX 5376 .empty (.cutY 5888 .full .empty))) (.cutY 5632 (.cutX 5888 (.cutY 5376 .empty .full) .empty) .empty)))) .empty) .empty))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 .empty (.cutY 26624 .empty (.cutX 27648 (.cutY 27648 (.cutX 27136 (.cutY 27136 .empty (.cutX 26880 .empty (.cutY 27392 .full .empty))) (.cutY 27136 (.cutX 27392 (.cutY 26880 .empty .full) .empty) .empty)) .empty) .empty))) .empty) .empty)))))

theorem metadata8 : 0<320668678 ∧ 21<128 ∧ 22<128 ∧ 0<4 ∧
    2269/4160=0 ∧ 2269%4160=2269 ∧ ∀ i, (leaves8 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData8).mp
    (by decide +kernel)

theorem sourceChecked8_0 : ∀ i : Fin 4,
    (fun i => output8 i = raw8 (source8 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked8 : ∀ i : Fin 4, (fun i => output8 i = raw8 (source8 i)) i :=
  forallFin_of_zero_offset (fun i => output8 i = raw8 (source8 i)) sourceChecked8_0

theorem coverChecked8_0 : ∀ i : Fin 4,
    (fun i => (output8 (cover8 i)).ContainsBox (raw8 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked8 : ∀ i : Fin 4, (fun i => (output8 (cover8 i)).ContainsBox (raw8 i)) i :=
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

noncomputable def phaseMass8 : ℝ := singlePhaseMass (320668678/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw8 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass8_eq : phaseMass8 = (160334339/819200000000 : ℝ) := by
  unfold phaseMass8
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw8 output8 cover8 source8
    (gridTreeUnionCheck_sound 32768 raw8 output8 cover8 source8 tree8 checked8)
    _ (by norm_num) _, areaUnits8]
  norm_num

-- Frozen phase 169, atom 2183, type 0, source (20,23).
def leavesData9 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves9 : Fin 1 → DyadicLeaf := leavesData9.get
def raw9 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 20 23 leaves9 i
def outputData9 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨5120,5376,5888,6144⟩) (.single ⟨5888,6144,5120,5376⟩)) (.node (.single ⟨26624,26880,27392,27648⟩) (.single ⟨27392,27648,26624,26880⟩)))
def output9 : Fin 4 → GridBox := outputData9.get
def coverData9 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData9 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover9 (i : Fin 4) : Fin 4 := ⟨coverData9.get i % 4, Nat.mod_lt _ (by decide)⟩
def source9 (i : Fin 4) : Fin 4 := ⟨sourceData9.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree9 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 (.cutY 6144 (.cutX 5120 .empty (.cutY 5120 .empty (.cutX 5632 (.cutY 5632 .empty (.cutX 5376 (.cutY 5888 .empty .full) .empty)) (.cutY 5632 (.cutX 5888 .empty (.cutY 5376 .full .empty)) .empty)))) .empty) .empty))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 .empty (.cutY 26624 .empty (.cutX 27648 (.cutY 27648 (.cutX 27136 (.cutY 27136 .empty (.cutX 26880 (.cutY 27392 .empty .full) .empty)) (.cutY 27136 (.cutX 27392 .empty (.cutY 26880 .full .empty)) .empty)) .empty) .empty))) .empty) .empty)))))

theorem metadata9 : 0<320668678 ∧ 20<128 ∧ 23<128 ∧ 0<4 ∧
    2183/4160=0 ∧ 2183%4160=2183 ∧ ∀ i, (leaves9 i).Valid 8 := by
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

noncomputable def phaseMass9 : ℝ := singlePhaseMass (320668678/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw9 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass9_eq : phaseMass9 = (160334339/819200000000 : ℝ) := by
  unfold phaseMass9
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw9 output9 cover9 source9
    (gridTreeUnionCheck_sound 32768 raw9 output9 cover9 source9 tree9 checked9)
    _ (by norm_num) _, areaUnits9]
  norm_num

-- Frozen phase 170, atom 2182, type 0, source (20,22).
def leavesData10 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves10 : Fin 1 → DyadicLeaf := leavesData10.get
def raw10 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 20 22 leaves10 i
def outputData10 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨5120,5376,5632,5888⟩) (.single ⟨5632,5888,5120,5376⟩)) (.node (.single ⟨26880,27136,27392,27648⟩) (.single ⟨27392,27648,26880,27136⟩)))
def output10 : Fin 4 → GridBox := outputData10.get
def coverData10 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData10 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover10 (i : Fin 4) : Fin 4 := ⟨coverData10.get i % 4, Nat.mod_lt _ (by decide)⟩
def source10 (i : Fin 4) : Fin 4 := ⟨sourceData10.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree10 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 (.cutY 6144 (.cutX 5120 .empty (.cutY 5120 .empty (.cutX 5632 (.cutY 5632 .empty (.cutX 5376 (.cutY 5888 .full .empty) .empty)) (.cutY 5632 (.cutX 5888 (.cutY 5376 .full .empty) .empty) .empty)))) .empty) .empty))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 .empty (.cutY 26624 .empty (.cutX 27648 (.cutY 27648 (.cutX 27136 (.cutY 27136 .empty (.cutX 26880 .empty (.cutY 27392 .empty .full))) (.cutY 27136 (.cutX 27392 .empty (.cutY 26880 .empty .full)) .empty)) .empty) .empty))) .empty) .empty)))))

theorem metadata10 : 0<320668678 ∧ 20<128 ∧ 22<128 ∧ 0<4 ∧
    2182/4160=0 ∧ 2182%4160=2182 ∧ ∀ i, (leaves10 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData10).mp
    (by decide +kernel)

theorem sourceChecked10_0 : ∀ i : Fin 4,
    (fun i => output10 i = raw10 (source10 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked10 : ∀ i : Fin 4, (fun i => output10 i = raw10 (source10 i)) i :=
  forallFin_of_zero_offset (fun i => output10 i = raw10 (source10 i)) sourceChecked10_0

theorem coverChecked10_0 : ∀ i : Fin 4,
    (fun i => (output10 (cover10 i)).ContainsBox (raw10 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked10 : ∀ i : Fin 4, (fun i => (output10 (cover10 i)).ContainsBox (raw10 i)) i :=
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

noncomputable def phaseMass10 : ℝ := singlePhaseMass (320668678/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw10 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass10_eq : phaseMass10 = (160334339/819200000000 : ℝ) := by
  unfold phaseMass10
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw10 output10 cover10 source10
    (gridTreeUnionCheck_sound 32768 raw10 output10 cover10 source10 tree10 checked10)
    _ (by norm_num) _, areaUnits10]
  norm_num

-- Frozen phase 171, atom 2268, type 0, source (21,21).
def leavesData11 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves11 : Fin 1 → DyadicLeaf := leavesData11.get
def raw11 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 21 21 leaves11 i
def outputData11 : FiniteInputTree GridBox 2 := (.node (.single ⟨5376,5632,5376,5632⟩) (.single ⟨27136,27392,27136,27392⟩))
def output11 : Fin 2 → GridBox := outputData11.get
def coverData11 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 0)) (.node (.single 1) (.single 1)))
def sourceData11 : FiniteInputTree ℕ 2 := (.node (.single 0) (.single 2))
def cover11 (i : Fin 4) : Fin 2 := ⟨coverData11.get i % 2, Nat.mod_lt _ (by decide)⟩
def source11 (i : Fin 2) : Fin 4 := ⟨sourceData11.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree11 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 (.cutY 6144 (.cutX 5120 .empty (.cutY 5120 .empty (.cutX 5632 (.cutY 5632 (.cutX 5376 .empty (.cutY 5376 .empty .full)) .empty) .empty))) .empty) .empty))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 .empty (.cutY 26624 .empty (.cutX 27648 (.cutY 27648 (.cutX 27136 .empty (.cutY 27136 .empty (.cutX 27392 (.cutY 27392 .full .empty) .empty))) .empty) .empty))) .empty) .empty)))))

theorem metadata11 : 0<320668678 ∧ 21<128 ∧ 21<128 ∧ 0<4 ∧
    2268/4160=0 ∧ 2268%4160=2268 ∧ ∀ i, (leaves11 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData11).mp
    (by decide +kernel)

theorem sourceChecked11_0 : ∀ i : Fin 2,
    (fun i => output11 i = raw11 (source11 i)) (finOffset 2 0 2 (by decide) i) := by decide +kernel

theorem sourceChecked11 : ∀ i : Fin 2, (fun i => output11 i = raw11 (source11 i)) i :=
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

theorem areaUnits11 : gridUnionAreaUnits output11 = 131072 := by decide +kernel

noncomputable def phaseMass11 : ℝ := singlePhaseMass (320668678/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw11 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass11_eq : phaseMass11 = (160334339/1638400000000 : ℝ) := by
  unfold phaseMass11
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw11 output11 cover11 source11
    (gridTreeUnionCheck_sound 32768 raw11 output11 cover11 source11 tree11 checked11)
    _ (by norm_num) _, areaUnits11]
  norm_num

-- Frozen phase 172, atom 2181, type 0, source (20,21).
def leavesData12 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves12 : Fin 1 → DyadicLeaf := leavesData12.get
def raw12 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 20 21 leaves12 i
def outputData12 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨5120,5376,5376,5632⟩) (.single ⟨5376,5632,5120,5376⟩)) (.node (.single ⟨27136,27392,27392,27648⟩) (.single ⟨27392,27648,27136,27392⟩)))
def output12 : Fin 4 → GridBox := outputData12.get
def coverData12 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData12 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover12 (i : Fin 4) : Fin 4 := ⟨coverData12.get i % 4, Nat.mod_lt _ (by decide)⟩
def source12 (i : Fin 4) : Fin 4 := ⟨sourceData12.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree12 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 (.cutY 6144 (.cutX 5120 .empty (.cutY 5120 .empty (.cutX 5632 (.cutY 5632 (.cutX 5376 (.cutY 5376 .empty .full) (.cutY 5376 .full .empty)) .empty) .empty))) .empty) .empty))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 .empty (.cutY 26624 .empty (.cutX 27648 (.cutY 27648 (.cutX 27136 .empty (.cutY 27136 .empty (.cutX 27392 (.cutY 27392 .empty .full) (.cutY 27392 .full .empty)))) .empty) .empty))) .empty) .empty)))))

theorem metadata12 : 0<320668678 ∧ 20<128 ∧ 21<128 ∧ 0<4 ∧
    2181/4160=0 ∧ 2181%4160=2181 ∧ ∀ i, (leaves12 i).Valid 8 := by
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

noncomputable def phaseMass12 : ℝ := singlePhaseMass (320668678/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw12 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass12_eq : phaseMass12 = (160334339/819200000000 : ℝ) := by
  unfold phaseMass12
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw12 output12 cover12 source12
    (gridTreeUnionCheck_sound 32768 raw12 output12 cover12 source12 tree12 checked12)
    _ (by norm_num) _, areaUnits12]
  norm_num

-- Frozen phase 173, atom 2093, type 0, source (19,22).
def leavesData13 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves13 : Fin 1 → DyadicLeaf := leavesData13.get
def raw13 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 19 22 leaves13 i
def outputData13 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨4864,5120,5632,5888⟩) (.single ⟨5632,5888,4864,5120⟩)) (.node (.single ⟨26880,27136,27648,27904⟩) (.single ⟨27648,27904,26880,27136⟩)))
def output13 : Fin 4 → GridBox := outputData13.get
def coverData13 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData13 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover13 (i : Fin 4) : Fin 4 := ⟨coverData13.get i % 4, Nat.mod_lt _ (by decide)⟩
def source13 (i : Fin 4) : Fin 4 := ⟨sourceData13.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree13 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 (.cutY 6144 (.cutX 5120 (.cutY 5120 .empty (.cutX 4608 .empty (.cutY 5632 .empty (.cutX 4864 .empty (.cutY 5888 .full .empty))))) (.cutY 5120 (.cutX 5632 .empty (.cutY 4608 .empty (.cutX 5888 (.cutY 4864 .empty .full) .empty))) .empty)) .empty) .empty))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 .empty (.cutY 26624 .empty (.cutX 27648 (.cutY 27648 .empty (.cutX 27136 (.cutY 28160 (.cutX 26880 .empty (.cutY 27904 .full .empty)) .empty) .empty)) (.cutY 27648 (.cutX 28160 (.cutY 27136 (.cutX 27904 (.cutY 26880 .empty .full) .empty) .empty) .empty) .empty)))) .empty) .empty)))))

theorem metadata13 : 0<320668678 ∧ 19<128 ∧ 22<128 ∧ 0<4 ∧
    2093/4160=0 ∧ 2093%4160=2093 ∧ ∀ i, (leaves13 i).Valid 8 := by
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

noncomputable def phaseMass13 : ℝ := singlePhaseMass (320668678/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw13 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass13_eq : phaseMass13 = (160334339/819200000000 : ℝ) := by
  unfold phaseMass13
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw13 output13 cover13 source13
    (gridTreeUnionCheck_sound 32768 raw13 output13 cover13 source13 tree13 checked13)
    _ (by norm_num) _, areaUnits13]
  norm_num

-- Frozen phase 174, atom 2092, type 0, source (19,21).
def leavesData14 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves14 : Fin 1 → DyadicLeaf := leavesData14.get
def raw14 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 19 21 leaves14 i
def outputData14 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨4864,5120,5376,5632⟩) (.single ⟨5376,5632,4864,5120⟩)) (.node (.single ⟨27136,27392,27648,27904⟩) (.single ⟨27648,27904,27136,27392⟩)))
def output14 : Fin 4 → GridBox := outputData14.get
def coverData14 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData14 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover14 (i : Fin 4) : Fin 4 := ⟨coverData14.get i % 4, Nat.mod_lt _ (by decide)⟩
def source14 (i : Fin 4) : Fin 4 := ⟨sourceData14.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree14 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 (.cutY 6144 (.cutX 5120 (.cutY 5120 .empty (.cutX 4608 .empty (.cutY 5632 (.cutX 4864 .empty (.cutY 5376 .empty .full)) .empty))) (.cutY 5120 (.cutX 5632 (.cutY 4608 .empty (.cutX 5376 .empty (.cutY 4864 .empty .full))) .empty) .empty)) .empty) .empty))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 .empty (.cutY 26624 .empty (.cutX 27648 (.cutY 27648 .empty (.cutX 27136 .empty (.cutY 28160 (.cutX 27392 (.cutY 27904 .full .empty) .empty) .empty))) (.cutY 27648 (.cutX 28160 (.cutY 27136 .empty (.cutX 27904 (.cutY 27392 .full .empty) .empty)) .empty) .empty)))) .empty) .empty)))))

theorem metadata14 : 0<320668678 ∧ 19<128 ∧ 21<128 ∧ 0<4 ∧
    2092/4160=0 ∧ 2092%4160=2092 ∧ ∀ i, (leaves14 i).Valid 8 := by
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

noncomputable def phaseMass14 : ℝ := singlePhaseMass (320668678/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw14 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass14_eq : phaseMass14 = (160334339/819200000000 : ℝ) := by
  unfold phaseMass14
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw14 output14 cover14 source14
    (gridTreeUnionCheck_sound 32768 raw14 output14 cover14 source14 tree14 checked14)
    _ (by norm_num) _, areaUnits14]
  norm_num

-- Frozen phase 175, atom 2180, type 0, source (20,20).
def leavesData15 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves15 : Fin 1 → DyadicLeaf := leavesData15.get
def raw15 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 20 20 leaves15 i
def outputData15 : FiniteInputTree GridBox 2 := (.node (.single ⟨5120,5376,5120,5376⟩) (.single ⟨27392,27648,27392,27648⟩))
def output15 : Fin 2 → GridBox := outputData15.get
def coverData15 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 0)) (.node (.single 1) (.single 1)))
def sourceData15 : FiniteInputTree ℕ 2 := (.node (.single 0) (.single 2))
def cover15 (i : Fin 4) : Fin 2 := ⟨coverData15.get i % 2, Nat.mod_lt _ (by decide)⟩
def source15 (i : Fin 2) : Fin 4 := ⟨sourceData15.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree15 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 (.cutY 6144 (.cutX 5120 .empty (.cutY 5120 .empty (.cutX 5632 (.cutY 5632 (.cutX 5376 (.cutY 5376 .full .empty) .empty) .empty) .empty))) .empty) .empty))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 .empty (.cutY 26624 .empty (.cutX 27648 (.cutY 27648 (.cutX 27136 .empty (.cutY 27136 .empty (.cutX 27392 .empty (.cutY 27392 .empty .full)))) .empty) .empty))) .empty) .empty)))))

theorem metadata15 : 0<320668678 ∧ 20<128 ∧ 20<128 ∧ 0<4 ∧
    2180/4160=0 ∧ 2180%4160=2180 ∧ ∀ i, (leaves15 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData15).mp
    (by decide +kernel)

theorem sourceChecked15_0 : ∀ i : Fin 2,
    (fun i => output15 i = raw15 (source15 i)) (finOffset 2 0 2 (by decide) i) := by decide +kernel

theorem sourceChecked15 : ∀ i : Fin 2, (fun i => output15 i = raw15 (source15 i)) i :=
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

theorem areaUnits15 : gridUnionAreaUnits output15 = 131072 := by decide +kernel

noncomputable def phaseMass15 : ℝ := singlePhaseMass (320668678/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw15 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass15_eq : phaseMass15 = (160334339/1638400000000 : ℝ) := by
  unfold phaseMass15
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw15 output15 cover15 source15
    (gridTreeUnionCheck_sound 32768 raw15 output15 cover15 source15 tree15 checked15)
    _ (by norm_num) _, areaUnits15]
  norm_num

-- Frozen phase 176, atom 2091, type 0, source (19,20).
def leavesData16 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves16 : Fin 1 → DyadicLeaf := leavesData16.get
def raw16 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 19 20 leaves16 i
def outputData16 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨4864,5120,5120,5376⟩) (.single ⟨5120,5376,4864,5120⟩)) (.node (.single ⟨27392,27648,27648,27904⟩) (.single ⟨27648,27904,27392,27648⟩)))
def output16 : Fin 4 → GridBox := outputData16.get
def coverData16 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData16 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover16 (i : Fin 4) : Fin 4 := ⟨coverData16.get i % 4, Nat.mod_lt _ (by decide)⟩
def source16 (i : Fin 4) : Fin 4 := ⟨sourceData16.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree16 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 (.cutY 6144 (.cutX 5120 (.cutY 5120 .empty (.cutX 4608 .empty (.cutY 5632 (.cutX 4864 .empty (.cutY 5376 .full .empty)) .empty))) (.cutY 5120 (.cutX 5632 (.cutY 4608 .empty (.cutX 5376 (.cutY 4864 .empty .full) .empty)) .empty) .empty)) .empty) .empty))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 .empty (.cutY 26624 .empty (.cutX 27648 (.cutY 27648 .empty (.cutX 27136 .empty (.cutY 28160 (.cutX 27392 .empty (.cutY 27904 .full .empty)) .empty))) (.cutY 27648 (.cutX 28160 (.cutY 27136 .empty (.cutX 27904 (.cutY 27392 .empty .full) .empty)) .empty) .empty)))) .empty) .empty)))))

theorem metadata16 : 0<320668678 ∧ 19<128 ∧ 20<128 ∧ 0<4 ∧
    2091/4160=0 ∧ 2091%4160=2091 ∧ ∀ i, (leaves16 i).Valid 8 := by
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

noncomputable def phaseMass16 : ℝ := singlePhaseMass (320668678/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw16 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass16_eq : phaseMass16 = (160334339/819200000000 : ℝ) := by
  unfold phaseMass16
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw16 output16 cover16 source16
    (gridTreeUnionCheck_sound 32768 raw16 output16 cover16 source16 tree16 checked16)
    _ (by norm_num) _, areaUnits16]
  norm_num

-- Frozen phase 177, atom 2001, type 0, source (18,21).
def leavesData17 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves17 : Fin 1 → DyadicLeaf := leavesData17.get
def raw17 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 18 21 leaves17 i
def outputData17 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨4608,4864,5376,5632⟩) (.single ⟨5376,5632,4608,4864⟩)) (.node (.single ⟨27136,27392,27904,28160⟩) (.single ⟨27904,28160,27136,27392⟩)))
def output17 : Fin 4 → GridBox := outputData17.get
def coverData17 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData17 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover17 (i : Fin 4) : Fin 4 := ⟨coverData17.get i % 4, Nat.mod_lt _ (by decide)⟩
def source17 (i : Fin 4) : Fin 4 := ⟨sourceData17.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree17 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 (.cutY 6144 (.cutX 5120 (.cutY 5120 .empty (.cutX 4608 .empty (.cutY 5632 (.cutX 4864 (.cutY 5376 .empty .full) .empty) .empty))) (.cutY 5120 (.cutX 5632 (.cutY 4608 .empty (.cutX 5376 .empty (.cutY 4864 .full .empty))) .empty) .empty)) .empty) .empty))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 .empty (.cutY 26624 .empty (.cutX 27648 (.cutY 27648 .empty (.cutX 27136 .empty (.cutY 28160 (.cutX 27392 (.cutY 27904 .empty .full) .empty) .empty))) (.cutY 27648 (.cutX 28160 (.cutY 27136 .empty (.cutX 27904 .empty (.cutY 27392 .full .empty))) .empty) .empty)))) .empty) .empty)))))

theorem metadata17 : 0<320668678 ∧ 18<128 ∧ 21<128 ∧ 0<4 ∧
    2001/4160=0 ∧ 2001%4160=2001 ∧ ∀ i, (leaves17 i).Valid 8 := by
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

noncomputable def phaseMass17 : ℝ := singlePhaseMass (320668678/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw17 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass17_eq : phaseMass17 = (160334339/819200000000 : ℝ) := by
  unfold phaseMass17
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw17 output17 cover17 source17
    (gridTreeUnionCheck_sound 32768 raw17 output17 cover17 source17 tree17 checked17)
    _ (by norm_num) _, areaUnits17]
  norm_num

-- Frozen phase 178, atom 2000, type 0, source (18,20).
def leavesData18 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves18 : Fin 1 → DyadicLeaf := leavesData18.get
def raw18 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 18 20 leaves18 i
def outputData18 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨4608,4864,5120,5376⟩) (.single ⟨5120,5376,4608,4864⟩)) (.node (.single ⟨27392,27648,27904,28160⟩) (.single ⟨27904,28160,27392,27648⟩)))
def output18 : Fin 4 → GridBox := outputData18.get
def coverData18 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData18 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover18 (i : Fin 4) : Fin 4 := ⟨coverData18.get i % 4, Nat.mod_lt _ (by decide)⟩
def source18 (i : Fin 4) : Fin 4 := ⟨sourceData18.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree18 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 (.cutY 6144 (.cutX 5120 (.cutY 5120 .empty (.cutX 4608 .empty (.cutY 5632 (.cutX 4864 (.cutY 5376 .full .empty) .empty) .empty))) (.cutY 5120 (.cutX 5632 (.cutY 4608 .empty (.cutX 5376 (.cutY 4864 .full .empty) .empty)) .empty) .empty)) .empty) .empty))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 .empty (.cutY 26624 .empty (.cutX 27648 (.cutY 27648 .empty (.cutX 27136 .empty (.cutY 28160 (.cutX 27392 .empty (.cutY 27904 .empty .full)) .empty))) (.cutY 27648 (.cutX 28160 (.cutY 27136 .empty (.cutX 27904 .empty (.cutY 27392 .empty .full))) .empty) .empty)))) .empty) .empty)))))

theorem metadata18 : 0<320668678 ∧ 18<128 ∧ 20<128 ∧ 0<4 ∧
    2000/4160=0 ∧ 2000%4160=2000 ∧ ∀ i, (leaves18 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData18).mp
    (by decide +kernel)

theorem sourceChecked18_0 : ∀ i : Fin 4,
    (fun i => output18 i = raw18 (source18 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem sourceChecked18 : ∀ i : Fin 4, (fun i => output18 i = raw18 (source18 i)) i :=
  forallFin_of_zero_offset (fun i => output18 i = raw18 (source18 i)) sourceChecked18_0

theorem coverChecked18_0 : ∀ i : Fin 4,
    (fun i => (output18 (cover18 i)).ContainsBox (raw18 i)) (finOffset 4 0 4 (by decide) i) := by decide +kernel

theorem coverChecked18 : ∀ i : Fin 4, (fun i => (output18 (cover18 i)).ContainsBox (raw18 i)) i :=
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

noncomputable def phaseMass18 : ℝ := singlePhaseMass (320668678/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw18 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass18_eq : phaseMass18 = (160334339/819200000000 : ℝ) := by
  unfold phaseMass18
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw18 output18 cover18 source18
    (gridTreeUnionCheck_sound 32768 raw18 output18 cover18 source18 tree18 checked18)
    _ (by norm_num) _, areaUnits18]
  norm_num

-- Frozen phase 179, atom 2090, type 0, source (19,19).
def leavesData19 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves19 : Fin 1 → DyadicLeaf := leavesData19.get
def raw19 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 19 19 leaves19 i
def outputData19 : FiniteInputTree GridBox 2 := (.node (.single ⟨4864,5120,4864,5120⟩) (.single ⟨27648,27904,27648,27904⟩))
def output19 : Fin 2 → GridBox := outputData19.get
def coverData19 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 0)) (.node (.single 1) (.single 1)))
def sourceData19 : FiniteInputTree ℕ 2 := (.node (.single 0) (.single 2))
def cover19 (i : Fin 4) : Fin 2 := ⟨coverData19.get i % 2, Nat.mod_lt _ (by decide)⟩
def source19 (i : Fin 2) : Fin 4 := ⟨sourceData19.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree19 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 (.cutY 6144 (.cutX 5120 (.cutY 5120 (.cutX 4608 .empty (.cutY 4608 .empty (.cutX 4864 .empty (.cutY 4864 .empty .full)))) .empty) .empty) .empty) .empty))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 .empty (.cutY 26624 .empty (.cutX 27648 .empty (.cutY 27648 .empty (.cutX 28160 (.cutY 28160 (.cutX 27904 (.cutY 27904 .full .empty) .empty) .empty) .empty))))) .empty) .empty)))))

theorem metadata19 : 0<320668678 ∧ 19<128 ∧ 19<128 ∧ 0<4 ∧
    2090/4160=0 ∧ 2090%4160=2090 ∧ ∀ i, (leaves19 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData19).mp
    (by decide +kernel)

theorem sourceChecked19_0 : ∀ i : Fin 2,
    (fun i => output19 i = raw19 (source19 i)) (finOffset 2 0 2 (by decide) i) := by decide +kernel

theorem sourceChecked19 : ∀ i : Fin 2, (fun i => output19 i = raw19 (source19 i)) i :=
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

theorem areaUnits19 : gridUnionAreaUnits output19 = 131072 := by decide +kernel

noncomputable def phaseMass19 : ℝ := singlePhaseMass (320668678/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw19 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass19_eq : phaseMass19 = (160334339/1638400000000 : ℝ) := by
  unfold phaseMass19
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw19 output19 cover19 source19
    (gridTreeUnionCheck_sound 32768 raw19 output19 cover19 source19 tree19 checked19)
    _ (by norm_num) _, areaUnits19]
  norm_num

-- Frozen phase 180, atom 1999, type 0, source (18,19).
def leavesData20 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves20 : Fin 1 → DyadicLeaf := leavesData20.get
def raw20 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 18 19 leaves20 i
def outputData20 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨4608,4864,4864,5120⟩) (.single ⟨4864,5120,4608,4864⟩)) (.node (.single ⟨27648,27904,27904,28160⟩) (.single ⟨27904,28160,27648,27904⟩)))
def output20 : Fin 4 → GridBox := outputData20.get
def coverData20 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData20 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover20 (i : Fin 4) : Fin 4 := ⟨coverData20.get i % 4, Nat.mod_lt _ (by decide)⟩
def source20 (i : Fin 4) : Fin 4 := ⟨sourceData20.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree20 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 (.cutY 6144 (.cutX 5120 (.cutY 5120 (.cutX 4608 .empty (.cutY 4608 .empty (.cutX 4864 (.cutY 4864 .empty .full) (.cutY 4864 .full .empty)))) .empty) .empty) .empty) .empty))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 .empty (.cutY 26624 .empty (.cutX 27648 .empty (.cutY 27648 .empty (.cutX 28160 (.cutY 28160 (.cutX 27904 (.cutY 27904 .empty .full) (.cutY 27904 .full .empty)) .empty) .empty))))) .empty) .empty)))))

theorem metadata20 : 0<320668678 ∧ 18<128 ∧ 19<128 ∧ 0<4 ∧
    1999/4160=0 ∧ 1999%4160=1999 ∧ ∀ i, (leaves20 i).Valid 8 := by
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

noncomputable def phaseMass20 : ℝ := singlePhaseMass (320668678/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw20 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass20_eq : phaseMass20 = (160334339/819200000000 : ℝ) := by
  unfold phaseMass20
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw20 output20 cover20 source20
    (gridTreeUnionCheck_sound 32768 raw20 output20 cover20 source20 tree20 checked20)
    _ (by norm_num) _, areaUnits20]
  norm_num

-- Frozen phase 181, atom 1907, type 0, source (17,20).
def leavesData21 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves21 : Fin 1 → DyadicLeaf := leavesData21.get
def raw21 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 17 20 leaves21 i
def outputData21 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨4352,4608,5120,5376⟩) (.single ⟨5120,5376,4352,4608⟩)) (.node (.single ⟨27392,27648,28160,28416⟩) (.single ⟨28160,28416,27392,27648⟩)))
def output21 : Fin 4 → GridBox := outputData21.get
def coverData21 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData21 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover21 (i : Fin 4) : Fin 4 := ⟨coverData21.get i % 4, Nat.mod_lt _ (by decide)⟩
def source21 (i : Fin 4) : Fin 4 := ⟨sourceData21.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree21 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 (.cutY 6144 (.cutX 5120 (.cutY 5120 .empty (.cutX 4608 (.cutY 5632 (.cutX 4352 .empty (.cutY 5376 .full .empty)) .empty) .empty)) (.cutY 5120 (.cutX 5632 (.cutY 4608 (.cutX 5376 (.cutY 4352 .empty .full) .empty) .empty) .empty) .empty)) .empty) .empty))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 .empty (.cutY 26624 .empty (.cutX 27648 (.cutY 27648 .empty (.cutX 27136 .empty (.cutY 28160 .empty (.cutX 27392 .empty (.cutY 28416 .full .empty))))) (.cutY 27648 (.cutX 28160 .empty (.cutY 27136 .empty (.cutX 28416 (.cutY 27392 .empty .full) .empty))) .empty)))) .empty) .empty)))))

theorem metadata21 : 0<320668678 ∧ 17<128 ∧ 20<128 ∧ 0<4 ∧
    1907/4160=0 ∧ 1907%4160=1907 ∧ ∀ i, (leaves21 i).Valid 8 := by
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

noncomputable def phaseMass21 : ℝ := singlePhaseMass (320668678/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw21 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass21_eq : phaseMass21 = (160334339/819200000000 : ℝ) := by
  unfold phaseMass21
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw21 output21 cover21 source21
    (gridTreeUnionCheck_sound 32768 raw21 output21 cover21 source21 tree21 checked21)
    _ (by norm_num) _, areaUnits21]
  norm_num

-- Frozen phase 182, atom 1906, type 0, source (17,19).
def leavesData22 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves22 : Fin 1 → DyadicLeaf := leavesData22.get
def raw22 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 17 19 leaves22 i
def outputData22 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨4352,4608,4864,5120⟩) (.single ⟨4864,5120,4352,4608⟩)) (.node (.single ⟨27648,27904,28160,28416⟩) (.single ⟨28160,28416,27648,27904⟩)))
def output22 : Fin 4 → GridBox := outputData22.get
def coverData22 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData22 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover22 (i : Fin 4) : Fin 4 := ⟨coverData22.get i % 4, Nat.mod_lt _ (by decide)⟩
def source22 (i : Fin 4) : Fin 4 := ⟨sourceData22.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree22 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 (.cutY 6144 (.cutX 5120 (.cutY 5120 (.cutX 4608 (.cutY 4608 .empty (.cutX 4352 .empty (.cutY 4864 .empty .full))) (.cutY 4608 (.cutX 4864 .empty (.cutY 4352 .empty .full)) .empty)) .empty) .empty) .empty) .empty))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 .empty (.cutY 26624 .empty (.cutX 27648 .empty (.cutY 27648 .empty (.cutX 28160 (.cutY 28160 .empty (.cutX 27904 (.cutY 28416 .full .empty) .empty)) (.cutY 28160 (.cutX 28416 (.cutY 27904 .full .empty) .empty) .empty)))))) .empty) .empty)))))

theorem metadata22 : 0<320668678 ∧ 17<128 ∧ 19<128 ∧ 0<4 ∧
    1906/4160=0 ∧ 1906%4160=1906 ∧ ∀ i, (leaves22 i).Valid 8 := by
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

noncomputable def phaseMass22 : ℝ := singlePhaseMass (320668678/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw22 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass22_eq : phaseMass22 = (160334339/819200000000 : ℝ) := by
  unfold phaseMass22
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw22 output22 cover22 source22
    (gridTreeUnionCheck_sound 32768 raw22 output22 cover22 source22 tree22 checked22)
    _ (by norm_num) _, areaUnits22]
  norm_num

-- Frozen phase 183, atom 1998, type 0, source (18,18).
def leavesData23 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves23 : Fin 1 → DyadicLeaf := leavesData23.get
def raw23 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 18 18 leaves23 i
def outputData23 : FiniteInputTree GridBox 2 := (.node (.single ⟨4608,4864,4608,4864⟩) (.single ⟨27904,28160,27904,28160⟩))
def output23 : Fin 2 → GridBox := outputData23.get
def coverData23 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 0)) (.node (.single 1) (.single 1)))
def sourceData23 : FiniteInputTree ℕ 2 := (.node (.single 0) (.single 2))
def cover23 (i : Fin 4) : Fin 2 := ⟨coverData23.get i % 2, Nat.mod_lt _ (by decide)⟩
def source23 (i : Fin 2) : Fin 4 := ⟨sourceData23.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree23 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 (.cutY 6144 (.cutX 5120 (.cutY 5120 (.cutX 4608 .empty (.cutY 4608 .empty (.cutX 4864 (.cutY 4864 .full .empty) .empty))) .empty) .empty) .empty) .empty))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 .empty (.cutY 26624 .empty (.cutX 27648 .empty (.cutY 27648 .empty (.cutX 28160 (.cutY 28160 (.cutX 27904 .empty (.cutY 27904 .empty .full)) .empty) .empty))))) .empty) .empty)))))

theorem metadata23 : 0<320668678 ∧ 18<128 ∧ 18<128 ∧ 0<4 ∧
    1998/4160=0 ∧ 1998%4160=1998 ∧ ∀ i, (leaves23 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData23).mp
    (by decide +kernel)

theorem sourceChecked23_0 : ∀ i : Fin 2,
    (fun i => output23 i = raw23 (source23 i)) (finOffset 2 0 2 (by decide) i) := by decide +kernel

theorem sourceChecked23 : ∀ i : Fin 2, (fun i => output23 i = raw23 (source23 i)) i :=
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

theorem areaUnits23 : gridUnionAreaUnits output23 = 131072 := by decide +kernel

noncomputable def phaseMass23 : ℝ := singlePhaseMass (320668678/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw23 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass23_eq : phaseMass23 = (160334339/1638400000000 : ℝ) := by
  unfold phaseMass23
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw23 output23 cover23 source23
    (gridTreeUnionCheck_sound 32768 raw23 output23 cover23 source23 tree23 checked23)
    _ (by norm_num) _, areaUnits23]
  norm_num

-- Frozen phase 184, atom 1905, type 0, source (17,18).
def leavesData24 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves24 : Fin 1 → DyadicLeaf := leavesData24.get
def raw24 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 17 18 leaves24 i
def outputData24 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨4352,4608,4608,4864⟩) (.single ⟨4608,4864,4352,4608⟩)) (.node (.single ⟨27904,28160,28160,28416⟩) (.single ⟨28160,28416,27904,28160⟩)))
def output24 : Fin 4 → GridBox := outputData24.get
def coverData24 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData24 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover24 (i : Fin 4) : Fin 4 := ⟨coverData24.get i % 4, Nat.mod_lt _ (by decide)⟩
def source24 (i : Fin 4) : Fin 4 := ⟨sourceData24.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree24 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 (.cutY 6144 (.cutX 5120 (.cutY 5120 (.cutX 4608 (.cutY 4608 .empty (.cutX 4352 .empty (.cutY 4864 .full .empty))) (.cutY 4608 (.cutX 4864 (.cutY 4352 .empty .full) .empty) .empty)) .empty) .empty) .empty) .empty))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 .empty (.cutY 26624 .empty (.cutX 27648 .empty (.cutY 27648 .empty (.cutX 28160 (.cutY 28160 .empty (.cutX 27904 .empty (.cutY 28416 .full .empty))) (.cutY 28160 (.cutX 28416 (.cutY 27904 .empty .full) .empty) .empty)))))) .empty) .empty)))))

theorem metadata24 : 0<320668678 ∧ 17<128 ∧ 18<128 ∧ 0<4 ∧
    1905/4160=0 ∧ 1905%4160=1905 ∧ ∀ i, (leaves24 i).Valid 8 := by
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

noncomputable def phaseMass24 : ℝ := singlePhaseMass (320668678/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw24 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass24_eq : phaseMass24 = (160334339/819200000000 : ℝ) := by
  unfold phaseMass24
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw24 output24 cover24 source24
    (gridTreeUnionCheck_sound 32768 raw24 output24 cover24 source24 tree24 checked24)
    _ (by norm_num) _, areaUnits24]
  norm_num

-- Frozen phase 185, atom 1811, type 0, source (16,19).
def leavesData25 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves25 : Fin 1 → DyadicLeaf := leavesData25.get
def raw25 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 16 19 leaves25 i
def outputData25 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨4096,4352,4864,5120⟩) (.single ⟨4864,5120,4096,4352⟩)) (.node (.single ⟨27648,27904,28416,28672⟩) (.single ⟨28416,28672,27648,27904⟩)))
def output25 : Fin 4 → GridBox := outputData25.get
def coverData25 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData25 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover25 (i : Fin 4) : Fin 4 := ⟨coverData25.get i % 4, Nat.mod_lt _ (by decide)⟩
def source25 (i : Fin 4) : Fin 4 := ⟨sourceData25.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree25 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 (.cutY 6144 (.cutX 5120 (.cutY 5120 (.cutX 4608 (.cutY 4608 .empty (.cutX 4352 (.cutY 4864 .empty .full) .empty)) (.cutY 4608 (.cutX 4864 .empty (.cutY 4352 .full .empty)) .empty)) .empty) .empty) .empty) .empty))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 .empty (.cutY 26624 .empty (.cutX 27648 .empty (.cutY 27648 .empty (.cutX 28160 (.cutY 28160 .empty (.cutX 27904 (.cutY 28416 .empty .full) .empty)) (.cutY 28160 (.cutX 28416 .empty (.cutY 27904 .full .empty)) .empty)))))) .empty) .empty)))))

theorem metadata25 : 0<320668678 ∧ 16<128 ∧ 19<128 ∧ 0<4 ∧
    1811/4160=0 ∧ 1811%4160=1811 ∧ ∀ i, (leaves25 i).Valid 8 := by
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

noncomputable def phaseMass25 : ℝ := singlePhaseMass (320668678/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw25 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass25_eq : phaseMass25 = (160334339/819200000000 : ℝ) := by
  unfold phaseMass25
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw25 output25 cover25 source25
    (gridTreeUnionCheck_sound 32768 raw25 output25 cover25 source25 tree25 checked25)
    _ (by norm_num) _, areaUnits25]
  norm_num

-- Frozen phase 186, atom 1810, type 0, source (16,18).
def leavesData26 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves26 : Fin 1 → DyadicLeaf := leavesData26.get
def raw26 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 16 18 leaves26 i
def outputData26 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨4096,4352,4608,4864⟩) (.single ⟨4608,4864,4096,4352⟩)) (.node (.single ⟨27904,28160,28416,28672⟩) (.single ⟨28416,28672,27904,28160⟩)))
def output26 : Fin 4 → GridBox := outputData26.get
def coverData26 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData26 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover26 (i : Fin 4) : Fin 4 := ⟨coverData26.get i % 4, Nat.mod_lt _ (by decide)⟩
def source26 (i : Fin 4) : Fin 4 := ⟨sourceData26.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree26 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 (.cutY 6144 (.cutX 5120 (.cutY 5120 (.cutX 4608 (.cutY 4608 .empty (.cutX 4352 (.cutY 4864 .full .empty) .empty)) (.cutY 4608 (.cutX 4864 (.cutY 4352 .full .empty) .empty) .empty)) .empty) .empty) .empty) .empty))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 .empty (.cutY 26624 .empty (.cutX 27648 .empty (.cutY 27648 .empty (.cutX 28160 (.cutY 28160 .empty (.cutX 27904 .empty (.cutY 28416 .empty .full))) (.cutY 28160 (.cutX 28416 .empty (.cutY 27904 .empty .full)) .empty)))))) .empty) .empty)))))

theorem metadata26 : 0<320668678 ∧ 16<128 ∧ 18<128 ∧ 0<4 ∧
    1810/4160=0 ∧ 1810%4160=1810 ∧ ∀ i, (leaves26 i).Valid 8 := by
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

noncomputable def phaseMass26 : ℝ := singlePhaseMass (320668678/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw26 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass26_eq : phaseMass26 = (160334339/819200000000 : ℝ) := by
  unfold phaseMass26
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw26 output26 cover26 source26
    (gridTreeUnionCheck_sound 32768 raw26 output26 cover26 source26 tree26 checked26)
    _ (by norm_num) _, areaUnits26]
  norm_num

-- Frozen phase 187, atom 1809, type 0, source (16,17).
def leavesData27 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves27 : Fin 1 → DyadicLeaf := leavesData27.get
def raw27 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 16 17 leaves27 i
def outputData27 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨4096,4352,4352,4608⟩) (.single ⟨4352,4608,4096,4352⟩)) (.node (.single ⟨28160,28416,28416,28672⟩) (.single ⟨28416,28672,28160,28416⟩)))
def output27 : Fin 4 → GridBox := outputData27.get
def coverData27 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData27 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover27 (i : Fin 4) : Fin 4 := ⟨coverData27.get i % 4, Nat.mod_lt _ (by decide)⟩
def source27 (i : Fin 4) : Fin 4 := ⟨sourceData27.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree27 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 (.cutY 6144 (.cutX 5120 (.cutY 5120 (.cutX 4608 (.cutY 4608 (.cutX 4352 (.cutY 4352 .empty .full) (.cutY 4352 .full .empty)) .empty) .empty) .empty) .empty) .empty) .empty))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 .empty (.cutY 26624 .empty (.cutX 27648 .empty (.cutY 27648 .empty (.cutX 28160 .empty (.cutY 28160 .empty (.cutX 28416 (.cutY 28416 .empty .full) (.cutY 28416 .full .empty)))))))) .empty) .empty)))))

theorem metadata27 : 0<320668678 ∧ 16<128 ∧ 17<128 ∧ 0<4 ∧
    1809/4160=0 ∧ 1809%4160=1809 ∧ ∀ i, (leaves27 i).Valid 8 := by
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

noncomputable def phaseMass27 : ℝ := singlePhaseMass (320668678/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw27 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass27_eq : phaseMass27 = (160334339/819200000000 : ℝ) := by
  unfold phaseMass27
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw27 output27 cover27 source27
    (gridTreeUnionCheck_sound 32768 raw27 output27 cover27 source27 tree27 checked27)
    _ (by norm_num) _, areaUnits27]
  norm_num

-- Frozen phase 188, atom 1713, type 0, source (15,18).
def leavesData28 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves28 : Fin 1 → DyadicLeaf := leavesData28.get
def raw28 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 15 18 leaves28 i
def outputData28 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨3840,4096,4608,4864⟩) (.single ⟨4608,4864,3840,4096⟩)) (.node (.single ⟨27904,28160,28672,28928⟩) (.single ⟨28672,28928,27904,28160⟩)))
def output28 : Fin 4 → GridBox := outputData28.get
def coverData28 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData28 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover28 (i : Fin 4) : Fin 4 := ⟨coverData28.get i % 4, Nat.mod_lt _ (by decide)⟩
def source28 (i : Fin 4) : Fin 4 := ⟨sourceData28.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree28 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 (.cutY 4096 .empty (.cutX 2048 .empty (.cutY 6144 (.cutX 3072 .empty (.cutY 5120 (.cutX 3584 .empty (.cutY 4608 .empty (.cutX 3840 .empty (.cutY 4864 .full .empty)))) .empty)) .empty))) (.cutY 4096 (.cutX 6144 (.cutY 2048 .empty (.cutX 5120 (.cutY 3072 .empty (.cutX 4608 .empty (.cutY 3584 .empty (.cutX 4864 (.cutY 3840 .empty .full) .empty)))) .empty)) .empty) .empty)) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 .empty (.cutX 26624 .empty (.cutY 30720 (.cutX 27648 .empty (.cutY 29696 (.cutX 28160 (.cutY 29184 (.cutX 27904 .empty (.cutY 28928 .full .empty)) .empty) .empty) .empty)) .empty))) (.cutY 28672 (.cutX 30720 (.cutY 26624 .empty (.cutX 29696 (.cutY 27648 .empty (.cutX 29184 (.cutY 28160 (.cutX 28928 (.cutY 27904 .empty .full) .empty) .empty) .empty)) .empty)) .empty) .empty))))))

theorem metadata28 : 0<543338492 ∧ 15<128 ∧ 18<128 ∧ 0<4 ∧
    1713/4160=0 ∧ 1713%4160=1713 ∧ ∀ i, (leaves28 i).Valid 8 := by
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

noncomputable def phaseMass28 : ℝ := singlePhaseMass (543338492/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw28 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass28_eq : phaseMass28 = (135834623/409600000000 : ℝ) := by
  unfold phaseMass28
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw28 output28 cover28 source28
    (gridTreeUnionCheck_sound 32768 raw28 output28 cover28 source28 tree28 checked28)
    _ (by norm_num) _, areaUnits28]
  norm_num

-- Frozen phase 189, atom 1712, type 0, source (15,17).
def leavesData29 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves29 : Fin 1 → DyadicLeaf := leavesData29.get
def raw29 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 15 17 leaves29 i
def outputData29 : FiniteInputTree GridBox 4 := (.node (.node (.single ⟨3840,4096,4352,4608⟩) (.single ⟨4352,4608,3840,4096⟩)) (.node (.single ⟨28160,28416,28672,28928⟩) (.single ⟨28672,28928,28160,28416⟩)))
def output29 : Fin 4 → GridBox := outputData29.get
def coverData29 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def sourceData29 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 1)) (.node (.single 3) (.single 2)))
def cover29 (i : Fin 4) : Fin 4 := ⟨coverData29.get i % 4, Nat.mod_lt _ (by decide)⟩
def source29 (i : Fin 4) : Fin 4 := ⟨sourceData29.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree29 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 (.cutY 4096 .empty (.cutX 2048 .empty (.cutY 6144 (.cutX 3072 .empty (.cutY 5120 (.cutX 3584 .empty (.cutY 4608 (.cutX 3840 .empty (.cutY 4352 .empty .full)) .empty)) .empty)) .empty))) (.cutY 4096 (.cutX 6144 (.cutY 2048 .empty (.cutX 5120 (.cutY 3072 .empty (.cutX 4608 (.cutY 3584 .empty (.cutX 4352 .empty (.cutY 3840 .empty .full))) .empty)) .empty)) .empty) .empty)) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 .empty (.cutX 26624 .empty (.cutY 30720 (.cutX 27648 .empty (.cutY 29696 (.cutX 28160 .empty (.cutY 29184 (.cutX 28416 (.cutY 28928 .full .empty) .empty) .empty)) .empty)) .empty))) (.cutY 28672 (.cutX 30720 (.cutY 26624 .empty (.cutX 29696 (.cutY 27648 .empty (.cutX 29184 (.cutY 28160 .empty (.cutX 28928 (.cutY 28416 .full .empty) .empty)) .empty)) .empty)) .empty) .empty))))))

theorem metadata29 : 0<543338492 ∧ 15<128 ∧ 17<128 ∧ 0<4 ∧
    1712/4160=0 ∧ 1712%4160=1712 ∧ ∀ i, (leaves29 i).Valid 8 := by
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

noncomputable def phaseMass29 : ℝ := singlePhaseMass (543338492/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw29 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass29_eq : phaseMass29 = (135834623/409600000000 : ℝ) := by
  unfold phaseMass29
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw29 output29 cover29 source29
    (gridTreeUnionCheck_sound 32768 raw29 output29 cover29 source29 tree29 checked29)
    _ (by norm_num) _, areaUnits29]
  norm_num

-- Frozen phase 190, atom 1904, type 0, source (17,17).
def leavesData30 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves30 : Fin 1 → DyadicLeaf := leavesData30.get
def raw30 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 17 17 leaves30 i
def outputData30 : FiniteInputTree GridBox 2 := (.node (.single ⟨4352,4608,4352,4608⟩) (.single ⟨28160,28416,28160,28416⟩))
def output30 : Fin 2 → GridBox := outputData30.get
def coverData30 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 0)) (.node (.single 1) (.single 1)))
def sourceData30 : FiniteInputTree ℕ 2 := (.node (.single 0) (.single 2))
def cover30 (i : Fin 4) : Fin 2 := ⟨coverData30.get i % 2, Nat.mod_lt _ (by decide)⟩
def source30 (i : Fin 2) : Fin 4 := ⟨sourceData30.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree30 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 (.cutY 6144 (.cutX 5120 (.cutY 5120 (.cutX 4608 (.cutY 4608 (.cutX 4352 .empty (.cutY 4352 .empty .full)) .empty) .empty) .empty) .empty) .empty) .empty))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 .empty (.cutY 26624 .empty (.cutX 27648 .empty (.cutY 27648 .empty (.cutX 28160 .empty (.cutY 28160 .empty (.cutX 28416 (.cutY 28416 .full .empty) .empty))))))) .empty) .empty)))))

theorem metadata30 : 0<320668678 ∧ 17<128 ∧ 17<128 ∧ 0<4 ∧
    1904/4160=0 ∧ 1904%4160=1904 ∧ ∀ i, (leaves30 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData30).mp
    (by decide +kernel)

theorem sourceChecked30_0 : ∀ i : Fin 2,
    (fun i => output30 i = raw30 (source30 i)) (finOffset 2 0 2 (by decide) i) := by decide +kernel

theorem sourceChecked30 : ∀ i : Fin 2, (fun i => output30 i = raw30 (source30 i)) i :=
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

theorem areaUnits30 : gridUnionAreaUnits output30 = 131072 := by decide +kernel

noncomputable def phaseMass30 : ℝ := singlePhaseMass (320668678/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw30 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass30_eq : phaseMass30 = (160334339/1638400000000 : ℝ) := by
  unfold phaseMass30
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw30 output30 cover30 source30
    (gridTreeUnionCheck_sound 32768 raw30 output30 cover30 source30 tree30 checked30)
    _ (by norm_num) _, areaUnits30]
  norm_num

-- Frozen phase 191, atom 1808, type 0, source (16,16).
def leavesData31 : FiniteInputTree DyadicLeaf 1 := (.single ⟨0,0,0⟩)
def leaves31 : Fin 1 → DyadicLeaf := leavesData31.get
def raw31 (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 16 16 leaves31 i
def outputData31 : FiniteInputTree GridBox 2 := (.node (.single ⟨4096,4352,4096,4352⟩) (.single ⟨28416,28672,28416,28672⟩))
def output31 : Fin 2 → GridBox := outputData31.get
def coverData31 : FiniteInputTree ℕ 4 := (.node (.node (.single 0) (.single 0)) (.node (.single 1) (.single 1)))
def sourceData31 : FiniteInputTree ℕ 2 := (.node (.single 0) (.single 2))
def cover31 (i : Fin 4) : Fin 2 := ⟨coverData31.get i % 2, Nat.mod_lt _ (by decide)⟩
def source31 (i : Fin 2) : Fin 4 := ⟨sourceData31.get i % 4, Nat.mod_lt _ (by decide)⟩
def tree31 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 (.cutY 6144 (.cutX 5120 (.cutY 5120 (.cutX 4608 (.cutY 4608 (.cutX 4352 (.cutY 4352 .full .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 .empty (.cutY 26624 .empty (.cutX 27648 .empty (.cutY 27648 .empty (.cutX 28160 .empty (.cutY 28160 .empty (.cutX 28416 .empty (.cutY 28416 .empty .full)))))))) .empty) .empty)))))

theorem metadata31 : 0<320668678 ∧ 16<128 ∧ 16<128 ∧ 0<4 ∧
    1808/4160=0 ∧ 1808%4160=1808 ∧ ∀ i, (leaves31 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData31).mp
    (by decide +kernel)

theorem sourceChecked31_0 : ∀ i : Fin 2,
    (fun i => output31 i = raw31 (source31 i)) (finOffset 2 0 2 (by decide) i) := by decide +kernel

theorem sourceChecked31 : ∀ i : Fin 2, (fun i => output31 i = raw31 (source31 i)) i :=
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

theorem areaUnits31 : gridUnionAreaUnits output31 = 131072 := by decide +kernel

noncomputable def phaseMass31 : ℝ := singlePhaseMass (320668678/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw31 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass31_eq : phaseMass31 = (160334339/1638400000000 : ℝ) := by
  unfold phaseMass31
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw31 output31 cover31 source31
    (gridTreeUnionCheck_sound 32768 raw31 output31 cover31 source31 tree31 checked31)
    _ (by norm_num) _, areaUnits31]
  norm_num

noncomputable def batchActualMass : ℝ := [phaseMass0,phaseMass1,phaseMass2,phaseMass3,phaseMass4,phaseMass5,phaseMass6,phaseMass7,phaseMass8,phaseMass9,phaseMass10,phaseMass11,phaseMass12,phaseMass13,phaseMass14,phaseMass15,phaseMass16,phaseMass17,phaseMass18,phaseMass19,phaseMass20,phaseMass21,phaseMass22,phaseMass23,phaseMass24,phaseMass25,phaseMass26,phaseMass27,phaseMass28,phaseMass29,phaseMass30,phaseMass31].sum

theorem actual_batch_mass : batchActualMass = (2362542299/409600000000 : ℝ) := by
  unfold batchActualMass
  rw [phaseMass0_eq,phaseMass1_eq,phaseMass2_eq,phaseMass3_eq,phaseMass4_eq,phaseMass5_eq,phaseMass6_eq,phaseMass7_eq,phaseMass8_eq,phaseMass9_eq,phaseMass10_eq,phaseMass11_eq,phaseMass12_eq,phaseMass13_eq,phaseMass14_eq,phaseMass15_eq,phaseMass16_eq,phaseMass17_eq,phaseMass18_eq,phaseMass19_eq,phaseMass20_eq,phaseMass21_eq,phaseMass22_eq,phaseMass23_eq,phaseMass24_eq,phaseMass25_eq,phaseMass26_eq,phaseMass27_eq,phaseMass28_eq,phaseMass29_eq,phaseMass30_eq,phaseMass31_eq]
  norm_num

end NoThreeLine.ScheduleUnionBatch00160
#print axioms NoThreeLine.ScheduleUnionBatch00160.actual_batch_mass
