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
namespace NoThreeLine.ScheduleUnionBatch04979

-- Frozen phase 4979, atom 3697, type 0, source (42,85).
def leavesData0 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves0 : Fin 4 → DyadicLeaf := leavesData0.get
def raw0 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 42 85 leaves0 i
def outputData0 : FiniteInputTree GridBox 8 := (.node (.node (.node (.single ⟨10752,10880,21760,21888⟩) (.single ⟨10752,10880,21888,22016⟩)) (.node (.single ⟨10880,11008,21760,21888⟩) (.single ⟨10880,11008,21888,22016⟩))) (.node (.node (.single ⟨21760,21888,10752,10880⟩) (.single ⟨21760,21888,10880,11008⟩)) (.node (.single ⟨21888,22016,10752,10880⟩) (.single ⟨21888,22016,10880,11008⟩))))
def output0 : Fin 8 → GridBox := outputData0.get
def coverData0 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 7) (.single 3))) (.node (.node (.single 1) (.single 6)) (.node (.single 6) (.single 1)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 5) (.single 2))) (.node (.node (.single 3) (.single 7)) (.node (.single 4) (.single 0)))))
def sourceData0 : FiniteInputTree ℕ 8 := (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 3))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 2))))
def cover0 (i : Fin 16) : Fin 8 := ⟨coverData0.get i % 8, Nat.mod_lt _ (by decide)⟩
def source0 (i : Fin 8) : Fin 16 := ⟨sourceData0.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree0 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 .empty (.cutY 22528 (.cutX 11264 (.cutY 21504 .empty (.cutX 10752 .empty (.cutY 22016 (.cutX 11008 (.cutY 21760 .empty (.cutX 10880 (.cutY 21888 .full .full) (.cutY 21888 .full .full))) .empty) .empty))) .empty) .empty))) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 (.cutY 10240 .empty (.cutX 21504 .empty (.cutY 11264 (.cutX 22016 (.cutY 10752 .empty (.cutX 21760 .empty (.cutY 11008 (.cutX 21888 (.cutY 10880 .full .full) (.cutY 10880 .full .full)) .empty))) .empty) .empty))) .empty) .empty))) .empty) .empty))

theorem metadata0 : 0<1701312 ∧ 42<128 ∧ 85<128 ∧ 0<4 ∧
    3697/4160=0 ∧ 3697%4160=3697 ∧ ∀ i, (leaves0 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData0).mp
    (by decide +kernel)

theorem sourceChecked0_0 : ∀ i : Fin 8,
    (fun i => output0 i = raw0 (source0 i)) (finOffset 8 0 8 (by decide) i) := by decide +kernel

theorem sourceChecked0 : ∀ i : Fin 8, (fun i => output0 i = raw0 (source0 i)) i :=
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

theorem areaUnits0 : gridUnionAreaUnits output0 = 131072 := by decide +kernel

noncomputable def phaseMass0 : ℝ := singlePhaseMass (1701312/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw0 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass0_eq : phaseMass0 = (26583/51200000000 : ℝ) := by
  unfold phaseMass0
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw0 output0 cover0 source0
    (gridTreeUnionCheck_sound 32768 raw0 output0 cover0 source0 tree0 checked0)
    _ (by norm_num) _, areaUnits0]
  norm_num

-- Frozen phase 4980, atom 2486, type 0, source (23,71).
def leavesData1 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves1 : Fin 7 → DyadicLeaf := leavesData1.get
def raw1 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 23 71 leaves1 i
def outputData1 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨5888,6016,18176,18304⟩) (.node (.single ⟨5888,6016,18304,18432⟩) (.single ⟨6016,6080,18176,18240⟩))) (.node (.node (.single ⟨6016,6080,18240,18304⟩) (.single ⟨6080,6144,18176,18240⟩)) (.node (.single ⟨6080,6144,18240,18304⟩) (.single ⟨6016,6144,18304,18432⟩)))) (.node (.node (.single ⟨14336,14464,26624,26752⟩) (.node (.single ⟨14336,14464,26752,26880⟩) (.single ⟨14464,14528,26624,26688⟩))) (.node (.node (.single ⟨14464,14528,26688,26752⟩) (.single ⟨14528,14592,26624,26688⟩)) (.node (.single ⟨14528,14592,26688,26752⟩) (.single ⟨14464,14592,26752,26880⟩))))) (.node (.node (.node (.single ⟨18176,18304,5888,6016⟩) (.node (.single ⟨18176,18240,6016,6080⟩) (.single ⟨18176,18240,6080,6144⟩))) (.node (.node (.single ⟨18240,18304,6016,6080⟩) (.single ⟨18240,18304,6080,6144⟩)) (.node (.single ⟨18304,18432,5888,6016⟩) (.single ⟨18304,18432,6016,6144⟩)))) (.node (.node (.single ⟨26624,26752,14336,14464⟩) (.node (.single ⟨26624,26688,14464,14528⟩) (.single ⟨26624,26688,14528,14592⟩))) (.node (.node (.single ⟨26688,26752,14464,14528⟩) (.single ⟨26688,26752,14528,14592⟩)) (.node (.single ⟨26752,26880,14336,14464⟩) (.single ⟨26752,26880,14464,14592⟩))))))
def output1 : Fin 28 → GridBox := outputData1.get
def coverData1 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData1 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover1 (i : Fin 28) : Fin 28 := ⟨coverData1.get i % 28, Nat.mod_lt _ (by decide)⟩
def source1 (i : Fin 28) : Fin 28 := ⟨sourceData1.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree1 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 (.cutX 5120 .empty (.cutY 17408 .empty (.cutX 5632 .empty (.cutY 17920 .empty (.cutX 5888 .empty (.cutY 18176 .empty (.cutX 6016 (.cutY 18304 .full .full) (.cutY 18304 (.cutX 6080 (.cutY 18240 .full .full) (.cutY 18240 .full .full)) .full)))))))) .empty) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 .empty (.cutX 15360 (.cutY 27648 (.cutX 14848 (.cutY 27136 (.cutX 14592 (.cutY 26880 (.cutX 14464 (.cutY 26752 .full .full) (.cutY 26752 (.cutX 14528 (.cutY 26688 .full .full) (.cutY 26688 .full .full)) .full)) .empty) .empty) .empty) .empty) .empty) .empty))) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 (.cutX 17408 .empty (.cutY 5120 .empty (.cutX 17920 .empty (.cutY 5632 .empty (.cutX 18176 .empty (.cutY 5888 .empty (.cutX 18304 (.cutY 6016 .full (.cutX 18240 (.cutY 6080 .full .full) (.cutY 6080 .full .full))) (.cutY 6016 .full .full)))))))) .empty) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 .empty (.cutX 27648 (.cutY 15360 (.cutX 27136 (.cutY 14848 (.cutX 26880 (.cutY 14592 (.cutX 26752 (.cutY 14464 .full (.cutX 26688 (.cutY 14528 .full .full) (.cutY 14528 .full .full))) (.cutY 14464 .full .full)) .empty) .empty) .empty) .empty) .empty) .empty)))) .empty))) .empty))

theorem metadata1 : 0<191564598 ∧ 23<128 ∧ 71<128 ∧ 0<4 ∧
    2486/4160=0 ∧ 2486%4160=2486 ∧ ∀ i, (leaves1 i).Valid 8 := by
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

noncomputable def phaseMass1 : ℝ := singlePhaseMass (191564598/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw1 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass1_eq : phaseMass1 = (95782299/819200000000 : ℝ) := by
  unfold phaseMass1
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw1 output1 cover1 source1
    (gridTreeUnionCheck_sound 32768 raw1 output1 cover1 source1 tree1 checked1)
    _ (by norm_num) _, areaUnits1]
  norm_num

-- Frozen phase 4981, atom 434, type 0, source (3,59).
def leavesData2 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves2 : Fin 4 → DyadicLeaf := leavesData2.get
def raw2 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 3 59 leaves2 i
def outputData2 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨768,896,15104,15232⟩) (.single ⟨768,896,15232,15360⟩)) (.node (.single ⟨896,1024,15104,15232⟩) (.single ⟨896,1024,15232,15360⟩))) (.node (.node (.single ⟨15104,15232,768,896⟩) (.single ⟨15104,15232,896,1024⟩)) (.node (.single ⟨15232,15360,768,896⟩) (.single ⟨15232,15360,896,1024⟩)))) (.node (.node (.node (.single ⟨17408,17536,31744,31872⟩) (.single ⟨17408,17536,31872,32000⟩)) (.node (.single ⟨17536,17664,31744,31872⟩) (.single ⟨17536,17664,31872,32000⟩))) (.node (.node (.single ⟨31744,31872,17408,17536⟩) (.single ⟨31744,31872,17536,17664⟩)) (.node (.single ⟨31872,32000,17408,17536⟩) (.single ⟨31872,32000,17536,17664⟩)))))
def output2 : Fin 16 → GridBox := outputData2.get
def coverData2 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData2 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover2 (i : Fin 16) : Fin 16 := ⟨coverData2.get i % 16, Nat.mod_lt _ (by decide)⟩
def source2 (i : Fin 16) : Fin 16 := ⟨sourceData2.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree2 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 .empty (.cutX 1024 (.cutY 15360 (.cutX 512 .empty (.cutY 14848 .empty (.cutX 768 .empty (.cutY 15104 .empty (.cutX 896 (.cutY 15232 .full .full) (.cutY 15232 .full .full)))))) .empty) .empty)) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 (.cutX 15360 (.cutY 1024 (.cutX 14848 .empty (.cutY 512 .empty (.cutX 15104 .empty (.cutY 768 .empty (.cutX 15232 (.cutY 896 .full .full) (.cutY 896 .full .full)))))) .empty) .empty) .empty)) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 .empty (.cutX 17408 .empty (.cutY 31744 .empty (.cutX 17920 (.cutY 32256 (.cutX 17664 (.cutY 32000 (.cutX 17536 (.cutY 31872 .full .full) (.cutY 31872 .full .full)) .empty) .empty) .empty) .empty)))) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 (.cutX 31744 .empty (.cutY 17408 .empty (.cutX 32256 (.cutY 17920 (.cutX 32000 (.cutY 17664 (.cutX 31872 (.cutY 17536 .full .full) (.cutY 17536 .full .full)) .empty) .empty) .empty) .empty))) .empty)) .empty)) .empty))))

theorem metadata2 : 0<89519217 ∧ 3<128 ∧ 59<128 ∧ 0<4 ∧
    434/4160=0 ∧ 434%4160=434 ∧ ∀ i, (leaves2 i).Valid 8 := by
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

noncomputable def phaseMass2 : ℝ := singlePhaseMass (89519217/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw2 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass2_eq : phaseMass2 = (89519217/1638400000000 : ℝ) := by
  unfold phaseMass2
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw2 output2 cover2 source2
    (gridTreeUnionCheck_sound 32768 raw2 output2 cover2 source2 tree2 checked2)
    _ (by norm_num) _, areaUnits2]
  norm_num

-- Frozen phase 4982, atom 4468, type 1, source (2,56).
def leavesData3 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves3 : Fin 13 → DyadicLeaf := leavesData3.get
def raw3 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 2 56 leaves3 i
def outputData3 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨512,576,14336,14400⟩) (.node (.single ⟨512,576,14400,14464⟩) (.single ⟨576,640,14336,14400⟩))) (.node (.single ⟨576,640,14400,14464⟩) (.node (.single ⟨512,640,14464,14592⟩) (.single ⟨640,704,14336,14400⟩)))) (.node (.node (.single ⟨640,704,14400,14464⟩) (.node (.single ⟨704,736,14336,14368⟩) (.single ⟨704,736,14368,14400⟩))) (.node (.node (.single ⟨736,768,14336,14368⟩) (.single ⟨736,768,14368,14400⟩)) (.node (.single ⟨704,768,14400,14464⟩) (.single ⟨640,768,14464,14592⟩))))) (.node (.node (.node (.single ⟨14336,14400,512,576⟩) (.node (.single ⟨14336,14400,576,640⟩) (.single ⟨14400,14464,512,576⟩))) (.node (.single ⟨14400,14464,576,640⟩) (.node (.single ⟨14336,14400,640,704⟩) (.single ⟨14336,14368,704,736⟩)))) (.node (.node (.single ⟨14336,14368,736,768⟩) (.node (.single ⟨14368,14400,704,736⟩) (.single ⟨14368,14400,736,768⟩))) (.node (.node (.single ⟨14400,14464,640,704⟩) (.single ⟨14400,14464,704,768⟩)) (.node (.single ⟨14464,14592,512,640⟩) (.single ⟨14464,14592,640,768⟩)))))) (.node (.node (.node (.node (.single ⟨18176,18304,32000,32128⟩) (.node (.single ⟨18176,18304,32128,32256⟩) (.single ⟨18304,18368,32000,32064⟩))) (.node (.single ⟨18304,18368,32064,32128⟩) (.node (.single ⟨18368,18400,32000,32032⟩) (.single ⟨18368,18400,32032,32064⟩)))) (.node (.node (.single ⟨18400,18432,32000,32032⟩) (.node (.single ⟨18400,18432,32032,32064⟩) (.single ⟨18368,18432,32064,32128⟩))) (.node (.node (.single ⟨18304,18368,32128,32192⟩) (.single ⟨18304,18368,32192,32256⟩)) (.node (.single ⟨18368,18432,32128,32192⟩) (.single ⟨18368,18432,32192,32256⟩))))) (.node (.node (.node (.single ⟨32000,32128,18176,18304⟩) (.node (.single ⟨32000,32064,18304,18368⟩) (.single ⟨32000,32032,18368,18400⟩))) (.node (.single ⟨32000,32032,18400,18432⟩) (.node (.single ⟨32032,32064,18368,18400⟩) (.single ⟨32032,32064,18400,18432⟩)))) (.node (.node (.single ⟨32064,32128,18304,18368⟩) (.node (.single ⟨32064,32128,18368,18432⟩) (.single ⟨32128,32256,18176,18304⟩))) (.node (.node (.single ⟨32128,32192,18304,18368⟩) (.single ⟨32128,32192,18368,18432⟩)) (.node (.single ⟨32192,32256,18304,18368⟩) (.single ⟨32192,32256,18368,18432⟩)))))))
def output3 : Fin 52 → GridBox := outputData3.get
def coverData3 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 24) (.single 47))) (.node (.single 27) (.node (.single 12) (.single 25)))) (.node (.node (.single 39) (.node (.single 26) (.single 5))) (.node (.node (.single 17) (.single 46)) (.node (.single 34) (.single 6))))) (.node (.node (.node (.single 22) (.node (.single 45) (.single 29))) (.node (.single 11) (.node (.single 23) (.single 40)))) (.node (.node (.single 28) (.node (.single 0) (.single 13))) (.node (.node (.single 51) (.single 38)) (.node (.single 1) (.single 15)))))) (.node (.node (.node (.node (.single 50) (.node (.single 36) (.single 2))) (.node (.single 14) (.node (.single 49) (.single 37)))) (.node (.node (.single 3) (.node (.single 16) (.single 48))) (.node (.node (.single 35) (.single 7)) (.node (.single 18) (.single 44))))) (.node (.node (.node (.single 33) (.node (.single 8) (.single 20))) (.node (.single 43) (.node (.single 31) (.single 9)))) (.node (.node (.single 19) (.node (.single 42) (.single 32))) (.node (.node (.single 10) (.single 21)) (.node (.single 41) (.single 30)))))))
def sourceData3 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover3 (i : Fin 52) : Fin 52 := ⟨coverData3.get i % 52, Nat.mod_lt _ (by decide)⟩
def source3 (i : Fin 52) : Fin 52 := ⟨sourceData3.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree3 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 .empty (.cutX 1024 (.cutY 15360 (.cutX 512 .empty (.cutY 14848 (.cutX 768 (.cutY 14592 (.cutX 640 (.cutY 14464 (.cutX 576 (.cutY 14400 .full .full) (.cutY 14400 .full .full)) .full) (.cutY 14464 (.cutX 704 (.cutY 14400 .full .full) (.cutY 14400 (.cutX 736 (.cutY 14368 .full .full) (.cutY 14368 .full .full)) .full)) .full)) .empty) .empty) .empty)) .empty) .empty)) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 (.cutX 15360 (.cutY 1024 (.cutX 14848 (.cutY 512 .empty (.cutX 14592 (.cutY 768 (.cutX 14464 (.cutY 640 (.cutX 14400 (.cutY 576 .full .full) (.cutY 576 .full .full)) (.cutX 14400 (.cutY 704 .full (.cutX 14368 (.cutY 736 .full .full) (.cutY 736 .full .full))) (.cutY 704 .full .full))) (.cutY 640 .full .full)) .empty) .empty)) .empty) .empty) .empty) .empty)) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 .empty (.cutX 17408 .empty (.cutY 31744 .empty (.cutX 17920 .empty (.cutY 32256 (.cutX 18176 .empty (.cutY 32000 .empty (.cutX 18304 (.cutY 32128 .full .full) (.cutY 32128 (.cutX 18368 (.cutY 32064 .full .full) (.cutY 32064 (.cutX 18400 (.cutY 32032 .full .full) (.cutY 32032 .full .full)) .full)) (.cutX 18368 (.cutY 32192 .full .full) (.cutY 32192 .full .full)))))) .empty))))) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 (.cutX 31744 .empty (.cutY 17408 .empty (.cutX 32256 (.cutY 17920 .empty (.cutX 32000 .empty (.cutY 18176 .empty (.cutX 32128 (.cutY 18304 .full (.cutX 32064 (.cutY 18368 .full (.cutX 32032 (.cutY 18400 .full .full) (.cutY 18400 .full .full))) (.cutY 18368 .full .full))) (.cutY 18304 .full (.cutX 32192 (.cutY 18368 .full .full) (.cutY 18368 .full .full))))))) .empty))) .empty)) .empty)) .empty))))

theorem metadata3 : 0<169648215 ∧ 2<128 ∧ 56<128 ∧ 1<4 ∧
    4468/4160=1 ∧ 4468%4160=308 ∧ ∀ i, (leaves3 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData3).mp
    (by decide +kernel)

theorem sourceChecked3_0 : ∀ i : Fin 52,
    (fun i => output3 i = raw3 (source3 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked3 : ∀ i : Fin 52, (fun i => output3 i = raw3 (source3 i)) i :=
  forallFin_of_zero_offset (fun i => output3 i = raw3 (source3 i)) sourceChecked3_0

theorem coverChecked3_0 : ∀ i : Fin 52,
    (fun i => (output3 (cover3 i)).ContainsBox (raw3 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked3 : ∀ i : Fin 52, (fun i => (output3 (cover3 i)).ContainsBox (raw3 i)) i :=
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

noncomputable def phaseMass3 : ℝ := singlePhaseMass (169648215/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw3 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass3_eq : phaseMass3 = (33929643/327680000000 : ℝ) := by
  unfold phaseMass3
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw3 output3 cover3 source3
    (gridTreeUnionCheck_sound 32768 raw3 output3 cover3 source3 tree3 checked3)
    _ (by norm_num) _, areaUnits3]
  norm_num

-- Frozen phase 4983, atom 3335, type 0, source (35,80).
def leavesData4 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves4 : Fin 4 → DyadicLeaf := leavesData4.get
def raw4 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 35 80 leaves4 i
def outputData4 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨8960,9088,20480,20608⟩) (.single ⟨8960,9088,20608,20736⟩)) (.node (.single ⟨9088,9216,20480,20608⟩) (.single ⟨9088,9216,20608,20736⟩))) (.node (.node (.single ⟨12032,12160,23552,23680⟩) (.single ⟨12032,12160,23680,23808⟩)) (.node (.single ⟨12160,12288,23552,23680⟩) (.single ⟨12160,12288,23680,23808⟩)))) (.node (.node (.node (.single ⟨20480,20608,8960,9088⟩) (.single ⟨20480,20608,9088,9216⟩)) (.node (.single ⟨20608,20736,8960,9088⟩) (.single ⟨20608,20736,9088,9216⟩))) (.node (.node (.single ⟨23552,23680,12032,12160⟩) (.single ⟨23552,23680,12160,12288⟩)) (.node (.single ⟨23680,23808,12032,12160⟩) (.single ⟨23680,23808,12160,12288⟩)))))
def output4 : Fin 16 → GridBox := outputData4.get
def coverData4 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData4 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover4 (i : Fin 16) : Fin 16 := ⟨coverData4.get i % 16, Nat.mod_lt _ (by decide)⟩
def source4 (i : Fin 16) : Fin 16 := ⟨sourceData4.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree4 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 (.cutX 9216 (.cutY 21504 (.cutX 8704 .empty (.cutY 20992 (.cutX 8960 .empty (.cutY 20736 (.cutX 9088 (.cutY 20608 .full .full) (.cutY 20608 .full .full)) .empty)) .empty)) .empty) .empty) .empty) (.cutY 22528 .empty (.cutX 11264 .empty (.cutY 23552 .empty (.cutX 11776 .empty (.cutY 24064 (.cutX 12032 .empty (.cutY 23808 (.cutX 12160 (.cutY 23680 .full .full) (.cutY 23680 .full .full)) .empty)) .empty))))))) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 (.cutY 10240 (.cutX 21504 (.cutY 9216 (.cutX 20992 (.cutY 8704 .empty (.cutX 20736 (.cutY 8960 .empty (.cutX 20608 (.cutY 9088 .full .full) (.cutY 9088 .full .full))) .empty)) .empty) .empty) .empty) .empty) (.cutY 10240 .empty (.cutX 23552 .empty (.cutY 11264 .empty (.cutX 24064 (.cutY 11776 .empty (.cutX 23808 (.cutY 12032 .empty (.cutX 23680 (.cutY 12160 .full .full) (.cutY 12160 .full .full))) .empty)) .empty))))) .empty))) .empty) .empty))

theorem metadata4 : 0<167980383 ∧ 35<128 ∧ 80<128 ∧ 0<4 ∧
    3335/4160=0 ∧ 3335%4160=3335 ∧ ∀ i, (leaves4 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData4).mp
    (by decide +kernel)

theorem sourceChecked4_0 : ∀ i : Fin 16,
    (fun i => output4 i = raw4 (source4 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked4 : ∀ i : Fin 16, (fun i => output4 i = raw4 (source4 i)) i :=
  forallFin_of_zero_offset (fun i => output4 i = raw4 (source4 i)) sourceChecked4_0

theorem coverChecked4_0 : ∀ i : Fin 16,
    (fun i => (output4 (cover4 i)).ContainsBox (raw4 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked4 : ∀ i : Fin 16, (fun i => (output4 (cover4 i)).ContainsBox (raw4 i)) i :=
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

noncomputable def phaseMass4 : ℝ := singlePhaseMass (167980383/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw4 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass4_eq : phaseMass4 = (167980383/1638400000000 : ℝ) := by
  unfold phaseMass4
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw4 output4 cover4 source4
    (gridTreeUnionCheck_sound 32768 raw4 output4 cover4 source4 tree4 checked4)
    _ (by norm_num) _, areaUnits4]
  norm_num

-- Frozen phase 4984, atom 3393, type 0, source (36,81).
def leavesData5 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves5 : Fin 4 → DyadicLeaf := leavesData5.get
def raw5 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 36 81 leaves5 i
def outputData5 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨9216,9344,20736,20864⟩) (.single ⟨9216,9344,20864,20992⟩)) (.node (.single ⟨9344,9472,20736,20864⟩) (.single ⟨9344,9472,20864,20992⟩))) (.node (.node (.single ⟨11776,11904,23296,23424⟩) (.single ⟨11776,11904,23424,23552⟩)) (.node (.single ⟨11904,12032,23296,23424⟩) (.single ⟨11904,12032,23424,23552⟩)))) (.node (.node (.node (.single ⟨20736,20864,9216,9344⟩) (.single ⟨20736,20864,9344,9472⟩)) (.node (.single ⟨20864,20992,9216,9344⟩) (.single ⟨20864,20992,9344,9472⟩))) (.node (.node (.single ⟨23296,23424,11776,11904⟩) (.single ⟨23296,23424,11904,12032⟩)) (.node (.single ⟨23424,23552,11776,11904⟩) (.single ⟨23424,23552,11904,12032⟩)))))
def output5 : Fin 16 → GridBox := outputData5.get
def coverData5 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData5 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover5 (i : Fin 16) : Fin 16 := ⟨coverData5.get i % 16, Nat.mod_lt _ (by decide)⟩
def source5 (i : Fin 16) : Fin 16 := ⟨sourceData5.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree5 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 (.cutX 9216 .empty (.cutY 21504 (.cutX 9728 (.cutY 20992 (.cutX 9472 (.cutY 20736 .empty (.cutX 9344 (.cutY 20864 .full .full) (.cutY 20864 .full .full))) .empty) .empty) .empty) .empty)) .empty) (.cutY 22528 .empty (.cutX 11264 .empty (.cutY 23552 (.cutX 11776 .empty (.cutY 23040 .empty (.cutX 12032 (.cutY 23296 .empty (.cutX 11904 (.cutY 23424 .full .full) (.cutY 23424 .full .full))) .empty))) .empty))))) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 (.cutY 10240 (.cutX 21504 (.cutY 9216 .empty (.cutX 20992 (.cutY 9728 (.cutX 20736 .empty (.cutY 9472 (.cutX 20864 (.cutY 9344 .full .full) (.cutY 9344 .full .full)) .empty)) .empty) .empty)) .empty) .empty) (.cutY 10240 .empty (.cutX 23552 (.cutY 11264 .empty (.cutX 23040 .empty (.cutY 11776 .empty (.cutX 23296 .empty (.cutY 12032 (.cutX 23424 (.cutY 11904 .full .full) (.cutY 11904 .full .full)) .empty))))) .empty))) .empty))) .empty) .empty))

theorem metadata5 : 0<167980383 ∧ 36<128 ∧ 81<128 ∧ 0<4 ∧
    3393/4160=0 ∧ 3393%4160=3393 ∧ ∀ i, (leaves5 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData5).mp
    (by decide +kernel)

theorem sourceChecked5_0 : ∀ i : Fin 16,
    (fun i => output5 i = raw5 (source5 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked5 : ∀ i : Fin 16, (fun i => output5 i = raw5 (source5 i)) i :=
  forallFin_of_zero_offset (fun i => output5 i = raw5 (source5 i)) sourceChecked5_0

theorem coverChecked5_0 : ∀ i : Fin 16,
    (fun i => (output5 (cover5 i)).ContainsBox (raw5 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked5 : ∀ i : Fin 16, (fun i => (output5 (cover5 i)).ContainsBox (raw5 i)) i :=
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

noncomputable def phaseMass5 : ℝ := singlePhaseMass (167980383/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw5 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass5_eq : phaseMass5 = (167980383/1638400000000 : ℝ) := by
  unfold phaseMass5
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw5 output5 cover5 source5
    (gridTreeUnionCheck_sound 32768 raw5 output5 cover5 source5 tree5 checked5)
    _ (by norm_num) _, areaUnits5]
  norm_num

-- Frozen phase 4985, atom 3554, type 0, source (39,83).
def leavesData6 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves6 : Fin 4 → DyadicLeaf := leavesData6.get
def raw6 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 39 83 leaves6 i
def outputData6 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨9984,10112,21248,21376⟩) (.single ⟨9984,10112,21376,21504⟩)) (.node (.single ⟨10112,10240,21248,21376⟩) (.single ⟨10112,10240,21376,21504⟩))) (.node (.node (.single ⟨11264,11392,22528,22656⟩) (.single ⟨11264,11392,22656,22784⟩)) (.node (.single ⟨11392,11520,22528,22656⟩) (.single ⟨11392,11520,22656,22784⟩)))) (.node (.node (.node (.single ⟨21248,21376,9984,10112⟩) (.single ⟨21248,21376,10112,10240⟩)) (.node (.single ⟨21376,21504,9984,10112⟩) (.single ⟨21376,21504,10112,10240⟩))) (.node (.node (.single ⟨22528,22656,11264,11392⟩) (.single ⟨22528,22656,11392,11520⟩)) (.node (.single ⟨22656,22784,11264,11392⟩) (.single ⟨22656,22784,11392,11520⟩)))))
def output6 : Fin 16 → GridBox := outputData6.get
def coverData6 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData6 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover6 (i : Fin 16) : Fin 16 := ⟨coverData6.get i % 16, Nat.mod_lt _ (by decide)⟩
def source6 (i : Fin 16) : Fin 16 := ⟨sourceData6.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree6 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 (.cutX 9216 .empty (.cutY 21504 (.cutX 9728 .empty (.cutY 20992 .empty (.cutX 9984 .empty (.cutY 21248 .empty (.cutX 10112 (.cutY 21376 .full .full) (.cutY 21376 .full .full)))))) .empty)) .empty) (.cutY 22528 .empty (.cutX 11264 .empty (.cutY 23552 (.cutX 11776 (.cutY 23040 (.cutX 11520 (.cutY 22784 (.cutX 11392 (.cutY 22656 .full .full) (.cutY 22656 .full .full)) .empty) .empty) .empty) .empty) .empty))))) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 (.cutY 10240 (.cutX 21504 (.cutY 9216 .empty (.cutX 20992 .empty (.cutY 9728 .empty (.cutX 21248 .empty (.cutY 9984 .empty (.cutX 21376 (.cutY 10112 .full .full) (.cutY 10112 .full .full))))))) .empty) .empty) (.cutY 10240 .empty (.cutX 23552 (.cutY 11264 .empty (.cutX 23040 (.cutY 11776 (.cutX 22784 (.cutY 11520 (.cutX 22656 (.cutY 11392 .full .full) (.cutY 11392 .full .full)) .empty) .empty) .empty) .empty)) .empty))) .empty))) .empty) .empty))

theorem metadata6 : 0<167980383 ∧ 39<128 ∧ 83<128 ∧ 0<4 ∧
    3554/4160=0 ∧ 3554%4160=3554 ∧ ∀ i, (leaves6 i).Valid 8 := by
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

noncomputable def phaseMass6 : ℝ := singlePhaseMass (167980383/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw6 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass6_eq : phaseMass6 = (167980383/1638400000000 : ℝ) := by
  unfold phaseMass6
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw6 output6 cover6 source6
    (gridTreeUnionCheck_sound 32768 raw6 output6 cover6 source6 tree6 checked6)
    _ (by norm_num) _, areaUnits6]
  norm_num

-- Frozen phase 4986, atom 2229, type 0, source (20,69).
def leavesData7 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves7 : Fin 7 → DyadicLeaf := leavesData7.get
def raw7 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 20 69 leaves7 i
def outputData7 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨5120,5248,17664,17792⟩) (.node (.single ⟨5120,5248,17792,17920⟩) (.single ⟨5248,5312,17664,17728⟩))) (.node (.node (.single ⟨5248,5312,17728,17792⟩) (.single ⟨5312,5376,17664,17728⟩)) (.node (.single ⟨5312,5376,17728,17792⟩) (.single ⟨5248,5376,17792,17920⟩)))) (.node (.node (.single ⟨14848,14976,27392,27520⟩) (.node (.single ⟨14848,14976,27520,27648⟩) (.single ⟨14976,15040,27392,27456⟩))) (.node (.node (.single ⟨14976,15040,27456,27520⟩) (.single ⟨15040,15104,27392,27456⟩)) (.node (.single ⟨15040,15104,27456,27520⟩) (.single ⟨14976,15104,27520,27648⟩))))) (.node (.node (.node (.single ⟨17664,17792,5120,5248⟩) (.node (.single ⟨17664,17728,5248,5312⟩) (.single ⟨17664,17728,5312,5376⟩))) (.node (.node (.single ⟨17728,17792,5248,5312⟩) (.single ⟨17728,17792,5312,5376⟩)) (.node (.single ⟨17792,17920,5120,5248⟩) (.single ⟨17792,17920,5248,5376⟩)))) (.node (.node (.single ⟨27392,27520,14848,14976⟩) (.node (.single ⟨27392,27456,14976,15040⟩) (.single ⟨27392,27456,15040,15104⟩))) (.node (.node (.single ⟨27456,27520,14976,15040⟩) (.single ⟨27456,27520,15040,15104⟩)) (.node (.single ⟨27520,27648,14848,14976⟩) (.single ⟨27520,27648,14976,15104⟩))))))
def output7 : Fin 28 → GridBox := outputData7.get
def coverData7 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData7 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover7 (i : Fin 28) : Fin 28 := ⟨coverData7.get i % 28, Nat.mod_lt _ (by decide)⟩
def source7 (i : Fin 28) : Fin 28 := ⟨sourceData7.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree7 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 (.cutX 5120 .empty (.cutY 17408 .empty (.cutX 5632 (.cutY 17920 (.cutX 5376 (.cutY 17664 .empty (.cutX 5248 (.cutY 17792 .full .full) (.cutY 17792 (.cutX 5312 (.cutY 17728 .full .full) (.cutY 17728 .full .full)) .full))) .empty) .empty) .empty))) .empty) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 .empty (.cutX 15360 (.cutY 27648 (.cutX 14848 .empty (.cutY 27136 .empty (.cutX 15104 (.cutY 27392 .empty (.cutX 14976 (.cutY 27520 .full .full) (.cutY 27520 (.cutX 15040 (.cutY 27456 .full .full) (.cutY 27456 .full .full)) .full))) .empty))) .empty) .empty))) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 (.cutX 17408 .empty (.cutY 5120 .empty (.cutX 17920 (.cutY 5632 (.cutX 17664 .empty (.cutY 5376 (.cutX 17792 (.cutY 5248 .full (.cutX 17728 (.cutY 5312 .full .full) (.cutY 5312 .full .full))) (.cutY 5248 .full .full)) .empty)) .empty) .empty))) .empty) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 .empty (.cutX 27648 (.cutY 15360 (.cutX 27136 .empty (.cutY 14848 .empty (.cutX 27392 .empty (.cutY 15104 (.cutX 27520 (.cutY 14976 .full (.cutX 27456 (.cutY 15040 .full .full) (.cutY 15040 .full .full))) (.cutY 14976 .full .full)) .empty)))) .empty) .empty)))) .empty))) .empty))

theorem metadata7 : 0<191564598 ∧ 20<128 ∧ 69<128 ∧ 0<4 ∧
    2229/4160=0 ∧ 2229%4160=2229 ∧ ∀ i, (leaves7 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData7).mp
    (by decide +kernel)

theorem sourceChecked7_0 : ∀ i : Fin 28,
    (fun i => output7 i = raw7 (source7 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked7 : ∀ i : Fin 28, (fun i => output7 i = raw7 (source7 i)) i :=
  forallFin_of_zero_offset (fun i => output7 i = raw7 (source7 i)) sourceChecked7_0

theorem coverChecked7_0 : ∀ i : Fin 28,
    (fun i => (output7 (cover7 i)).ContainsBox (raw7 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked7 : ∀ i : Fin 28, (fun i => (output7 (cover7 i)).ContainsBox (raw7 i)) i :=
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

noncomputable def phaseMass7 : ℝ := singlePhaseMass (191564598/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw7 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass7_eq : phaseMass7 = (95782299/819200000000 : ℝ) := by
  unfold phaseMass7
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw7 output7 cover7 source7
    (gridTreeUnionCheck_sound 32768 raw7 output7 cover7 source7 tree7 checked7)
    _ (by norm_num) _, areaUnits7]
  norm_num

-- Frozen phase 4987, atom 1954, type 0, source (17,67).
def leavesData8 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves8 : Fin 7 → DyadicLeaf := leavesData8.get
def raw8 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 17 67 leaves8 i
def outputData8 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨4352,4480,17152,17280⟩) (.node (.single ⟨4352,4480,17280,17408⟩) (.single ⟨4480,4544,17152,17216⟩))) (.node (.node (.single ⟨4480,4544,17216,17280⟩) (.single ⟨4544,4608,17152,17216⟩)) (.node (.single ⟨4544,4608,17216,17280⟩) (.single ⟨4480,4608,17280,17408⟩)))) (.node (.node (.single ⟨15360,15488,28160,28288⟩) (.node (.single ⟨15360,15488,28288,28416⟩) (.single ⟨15488,15552,28160,28224⟩))) (.node (.node (.single ⟨15488,15552,28224,28288⟩) (.single ⟨15552,15616,28160,28224⟩)) (.node (.single ⟨15552,15616,28224,28288⟩) (.single ⟨15488,15616,28288,28416⟩))))) (.node (.node (.node (.single ⟨17152,17280,4352,4480⟩) (.node (.single ⟨17152,17216,4480,4544⟩) (.single ⟨17152,17216,4544,4608⟩))) (.node (.node (.single ⟨17216,17280,4480,4544⟩) (.single ⟨17216,17280,4544,4608⟩)) (.node (.single ⟨17280,17408,4352,4480⟩) (.single ⟨17280,17408,4480,4608⟩)))) (.node (.node (.single ⟨28160,28288,15360,15488⟩) (.node (.single ⟨28160,28224,15488,15552⟩) (.single ⟨28160,28224,15552,15616⟩))) (.node (.node (.single ⟨28224,28288,15488,15552⟩) (.single ⟨28224,28288,15552,15616⟩)) (.node (.single ⟨28288,28416,15360,15488⟩) (.single ⟨28288,28416,15488,15616⟩))))))
def output8 : Fin 28 → GridBox := outputData8.get
def coverData8 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData8 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover8 (i : Fin 28) : Fin 28 := ⟨coverData8.get i % 28, Nat.mod_lt _ (by decide)⟩
def source8 (i : Fin 28) : Fin 28 := ⟨sourceData8.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree8 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 (.cutX 5120 (.cutY 17408 (.cutX 4608 (.cutY 16896 .empty (.cutX 4352 .empty (.cutY 17152 .empty (.cutX 4480 (.cutY 17280 .full .full) (.cutY 17280 (.cutX 4544 (.cutY 17216 .full .full) (.cutY 17216 .full .full)) .full))))) .empty) .empty) .empty) .empty) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 .empty (.cutX 15360 .empty (.cutY 27648 .empty (.cutX 15872 (.cutY 28160 .empty (.cutX 15616 (.cutY 28416 (.cutX 15488 (.cutY 28288 .full .full) (.cutY 28288 (.cutX 15552 (.cutY 28224 .full .full) (.cutY 28224 .full .full)) .full)) .empty) .empty)) .empty))))) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 (.cutX 17408 (.cutY 5120 (.cutX 16896 .empty (.cutY 4608 (.cutX 17152 .empty (.cutY 4352 .empty (.cutX 17280 (.cutY 4480 .full (.cutX 17216 (.cutY 4544 .full .full) (.cutY 4544 .full .full))) (.cutY 4480 .full .full)))) .empty)) .empty) .empty) .empty) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 .empty (.cutX 27648 .empty (.cutY 15360 .empty (.cutX 28160 .empty (.cutY 15872 (.cutX 28416 (.cutY 15616 (.cutX 28288 (.cutY 15488 .full (.cutX 28224 (.cutY 15552 .full .full) (.cutY 15552 .full .full))) (.cutY 15488 .full .full)) .empty) .empty) .empty))))))) .empty))) .empty))

theorem metadata8 : 0<191564598 ∧ 17<128 ∧ 67<128 ∧ 0<4 ∧
    1954/4160=0 ∧ 1954%4160=1954 ∧ ∀ i, (leaves8 i).Valid 8 := by
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

noncomputable def phaseMass8 : ℝ := singlePhaseMass (191564598/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw8 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass8_eq : phaseMass8 = (95782299/819200000000 : ℝ) := by
  unfold phaseMass8
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw8 output8 cover8 source8
    (gridTreeUnionCheck_sound 32768 raw8 output8 cover8 source8 tree8 checked8)
    _ (by norm_num) _, areaUnits8]
  norm_num

-- Frozen phase 4988, atom 2801, type 0, source (27,74).
def leavesData9 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves9 : Fin 7 → DyadicLeaf := leavesData9.get
def raw9 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 27 74 leaves9 i
def outputData9 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨6912,7040,18944,19072⟩) (.node (.single ⟨6912,7040,19072,19200⟩) (.single ⟨7040,7104,18944,19008⟩))) (.node (.node (.single ⟨7040,7104,19008,19072⟩) (.single ⟨7104,7168,18944,19008⟩)) (.node (.single ⟨7104,7168,19008,19072⟩) (.single ⟨7040,7168,19072,19200⟩)))) (.node (.node (.single ⟨13568,13696,25600,25728⟩) (.node (.single ⟨13568,13696,25728,25856⟩) (.single ⟨13696,13760,25600,25664⟩))) (.node (.node (.single ⟨13696,13760,25664,25728⟩) (.single ⟨13760,13824,25600,25664⟩)) (.node (.single ⟨13760,13824,25664,25728⟩) (.single ⟨13696,13824,25728,25856⟩))))) (.node (.node (.node (.single ⟨18944,19072,6912,7040⟩) (.node (.single ⟨18944,19008,7040,7104⟩) (.single ⟨18944,19008,7104,7168⟩))) (.node (.node (.single ⟨19008,19072,7040,7104⟩) (.single ⟨19008,19072,7104,7168⟩)) (.node (.single ⟨19072,19200,6912,7040⟩) (.single ⟨19072,19200,7040,7168⟩)))) (.node (.node (.single ⟨25600,25728,13568,13696⟩) (.node (.single ⟨25600,25664,13696,13760⟩) (.single ⟨25600,25664,13760,13824⟩))) (.node (.node (.single ⟨25664,25728,13696,13760⟩) (.single ⟨25664,25728,13760,13824⟩)) (.node (.single ⟨25728,25856,13568,13696⟩) (.single ⟨25728,25856,13696,13824⟩))))))
def output9 : Fin 28 → GridBox := outputData9.get
def coverData9 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData9 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover9 (i : Fin 28) : Fin 28 := ⟨coverData9.get i % 28, Nat.mod_lt _ (by decide)⟩
def source9 (i : Fin 28) : Fin 28 := ⟨sourceData9.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree9 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 .empty (.cutX 7168 (.cutY 19456 (.cutX 6656 .empty (.cutY 18944 .empty (.cutX 6912 .empty (.cutY 19200 (.cutX 7040 (.cutY 19072 .full .full) (.cutY 19072 (.cutX 7104 (.cutY 19008 .full .full) (.cutY 19008 .full .full)) .full)) .empty)))) .empty) .empty))) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 (.cutX 13312 .empty (.cutY 25600 .empty (.cutX 13824 (.cutY 26112 (.cutX 13568 .empty (.cutY 25856 (.cutX 13696 (.cutY 25728 .full .full) (.cutY 25728 (.cutX 13760 (.cutY 25664 .full .full) (.cutY 25664 .full .full)) .full)) .empty)) .empty) .empty))) .empty) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 .empty (.cutX 19456 (.cutY 7168 (.cutX 18944 .empty (.cutY 6656 .empty (.cutX 19200 (.cutY 6912 .empty (.cutX 19072 (.cutY 7040 .full (.cutX 19008 (.cutY 7104 .full .full) (.cutY 7104 .full .full))) (.cutY 7040 .full .full))) .empty))) .empty) .empty)))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 (.cutX 25600 .empty (.cutY 13312 .empty (.cutX 26112 (.cutY 13824 (.cutX 25856 (.cutY 13568 .empty (.cutX 25728 (.cutY 13696 .full (.cutX 25664 (.cutY 13760 .full .full) (.cutY 13760 .full .full))) (.cutY 13696 .full .full))) .empty) .empty) .empty))) .empty) .empty)) .empty))) .empty))

theorem metadata9 : 0<177866497 ∧ 27<128 ∧ 74<128 ∧ 0<4 ∧
    2801/4160=0 ∧ 2801%4160=2801 ∧ ∀ i, (leaves9 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData9).mp
    (by decide +kernel)

theorem sourceChecked9_0 : ∀ i : Fin 28,
    (fun i => output9 i = raw9 (source9 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked9 : ∀ i : Fin 28, (fun i => output9 i = raw9 (source9 i)) i :=
  forallFin_of_zero_offset (fun i => output9 i = raw9 (source9 i)) sourceChecked9_0

theorem coverChecked9_0 : ∀ i : Fin 28,
    (fun i => (output9 (cover9 i)).ContainsBox (raw9 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked9 : ∀ i : Fin 28, (fun i => (output9 (cover9 i)).ContainsBox (raw9 i)) i :=
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

noncomputable def phaseMass9 : ℝ := singlePhaseMass (177866497/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw9 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass9_eq : phaseMass9 = (177866497/1638400000000 : ℝ) := by
  unfold phaseMass9
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw9 output9 cover9 source9
    (gridTreeUnionCheck_sound 32768 raw9 output9 cover9 source9 tree9 checked9)
    _ (by norm_num) _, areaUnits9]
  norm_num

-- Frozen phase 4989, atom 792, type 0, source (6,60).
def leavesData10 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves10 : Fin 7 → DyadicLeaf := leavesData10.get
def raw10 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 6 60 leaves10 i
def outputData10 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨1536,1664,15360,15488⟩) (.node (.single ⟨1536,1664,15488,15616⟩) (.single ⟨1664,1728,15360,15424⟩))) (.node (.node (.single ⟨1664,1728,15424,15488⟩) (.single ⟨1728,1792,15360,15424⟩)) (.node (.single ⟨1728,1792,15424,15488⟩) (.single ⟨1664,1792,15488,15616⟩)))) (.node (.node (.single ⟨15360,15488,1536,1664⟩) (.node (.single ⟨15360,15424,1664,1728⟩) (.single ⟨15360,15424,1728,1792⟩))) (.node (.node (.single ⟨15424,15488,1664,1728⟩) (.single ⟨15424,15488,1728,1792⟩)) (.node (.single ⟨15488,15616,1536,1664⟩) (.single ⟨15488,15616,1664,1792⟩))))) (.node (.node (.node (.single ⟨17152,17280,30976,31104⟩) (.node (.single ⟨17152,17280,31104,31232⟩) (.single ⟨17280,17344,30976,31040⟩))) (.node (.node (.single ⟨17280,17344,31040,31104⟩) (.single ⟨17344,17408,30976,31040⟩)) (.node (.single ⟨17344,17408,31040,31104⟩) (.single ⟨17280,17408,31104,31232⟩)))) (.node (.node (.single ⟨30976,31104,17152,17280⟩) (.node (.single ⟨30976,31040,17280,17344⟩) (.single ⟨30976,31040,17344,17408⟩))) (.node (.node (.single ⟨31040,31104,17280,17344⟩) (.single ⟨31040,31104,17344,17408⟩)) (.node (.single ⟨31104,31232,17152,17280⟩) (.single ⟨31104,31232,17280,17408⟩))))))
def output10 : Fin 28 → GridBox := outputData10.get
def coverData10 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData10 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover10 (i : Fin 28) : Fin 28 := ⟨coverData10.get i % 28, Nat.mod_lt _ (by decide)⟩
def source10 (i : Fin 28) : Fin 28 := ⟨sourceData10.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree10 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 .empty (.cutX 1024 .empty (.cutY 15360 .empty (.cutX 1536 .empty (.cutY 15872 (.cutX 1792 (.cutY 15616 (.cutX 1664 (.cutY 15488 .full .full) (.cutY 15488 (.cutX 1728 (.cutY 15424 .full .full) (.cutY 15424 .full .full)) .full)) .empty) .empty) .empty))))) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 (.cutX 15360 .empty (.cutY 1024 .empty (.cutX 15872 (.cutY 1536 .empty (.cutX 15616 (.cutY 1792 (.cutX 15488 (.cutY 1664 .full (.cutX 15424 (.cutY 1728 .full .full) (.cutY 1728 .full .full))) (.cutY 1664 .full .full)) .empty) .empty)) .empty))) .empty)) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 .empty (.cutX 17408 (.cutY 31744 (.cutX 16896 .empty (.cutY 31232 (.cutX 17152 .empty (.cutY 30976 .empty (.cutX 17280 (.cutY 31104 .full .full) (.cutY 31104 (.cutX 17344 (.cutY 31040 .full .full) (.cutY 31040 .full .full)) .full)))) .empty)) .empty) .empty)) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 (.cutX 31744 (.cutY 17408 (.cutX 31232 (.cutY 16896 .empty (.cutX 30976 .empty (.cutY 17152 .empty (.cutX 31104 (.cutY 17280 .full (.cutX 31040 (.cutY 17344 .full .full) (.cutY 17344 .full .full))) (.cutY 17280 .full .full))))) .empty) .empty) .empty) .empty)) .empty)) .empty))))

theorem metadata10 : 0<89519217 ∧ 6<128 ∧ 60<128 ∧ 0<4 ∧
    792/4160=0 ∧ 792%4160=792 ∧ ∀ i, (leaves10 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData10).mp
    (by decide +kernel)

theorem sourceChecked10_0 : ∀ i : Fin 28,
    (fun i => output10 i = raw10 (source10 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked10 : ∀ i : Fin 28, (fun i => output10 i = raw10 (source10 i)) i :=
  forallFin_of_zero_offset (fun i => output10 i = raw10 (source10 i)) sourceChecked10_0

theorem coverChecked10_0 : ∀ i : Fin 28,
    (fun i => (output10 (cover10 i)).ContainsBox (raw10 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked10 : ∀ i : Fin 28, (fun i => (output10 (cover10 i)).ContainsBox (raw10 i)) i :=
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

noncomputable def phaseMass10 : ℝ := singlePhaseMass (89519217/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw10 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass10_eq : phaseMass10 = (89519217/1638400000000 : ℝ) := by
  unfold phaseMass10
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw10 output10 cover10 source10
    (gridTreeUnionCheck_sound 32768 raw10 output10 cover10 source10 tree10 checked10)
    _ (by norm_num) _, areaUnits10]
  norm_num

-- Frozen phase 4990, atom 7492, type 1, source (35,77).
def leavesData11 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves11 : Fin 7 → DyadicLeaf := leavesData11.get
def raw11 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 35 77 leaves11 i
def outputData11 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨8960,9088,19712,19840⟩) (.node (.single ⟨8960,9088,19840,19968⟩) (.single ⟨9088,9152,19712,19776⟩))) (.node (.node (.single ⟨9088,9152,19776,19840⟩) (.single ⟨9152,9216,19712,19776⟩)) (.node (.single ⟨9152,9216,19776,19840⟩) (.single ⟨9088,9216,19840,19968⟩)))) (.node (.node (.single ⟨12800,12928,23552,23680⟩) (.node (.single ⟨12800,12928,23680,23808⟩) (.single ⟨12928,12992,23552,23616⟩))) (.node (.node (.single ⟨12928,12992,23616,23680⟩) (.single ⟨12992,13056,23552,23616⟩)) (.node (.single ⟨12992,13056,23616,23680⟩) (.single ⟨12928,13056,23680,23808⟩))))) (.node (.node (.node (.single ⟨19712,19840,8960,9088⟩) (.node (.single ⟨19712,19776,9088,9152⟩) (.single ⟨19712,19776,9152,9216⟩))) (.node (.node (.single ⟨19776,19840,9088,9152⟩) (.single ⟨19776,19840,9152,9216⟩)) (.node (.single ⟨19840,19968,8960,9088⟩) (.single ⟨19840,19968,9088,9216⟩)))) (.node (.node (.single ⟨23552,23680,12800,12928⟩) (.node (.single ⟨23552,23616,12928,12992⟩) (.single ⟨23552,23616,12992,13056⟩))) (.node (.node (.single ⟨23616,23680,12928,12992⟩) (.single ⟨23616,23680,12992,13056⟩)) (.node (.single ⟨23680,23808,12800,12928⟩) (.single ⟨23680,23808,12928,13056⟩))))))
def output11 : Fin 28 → GridBox := outputData11.get
def coverData11 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData11 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover11 (i : Fin 28) : Fin 28 := ⟨coverData11.get i % 28, Nat.mod_lt _ (by decide)⟩
def source11 (i : Fin 28) : Fin 28 := ⟨sourceData11.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree11 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 (.cutY 18432 .empty (.cutX 9216 (.cutY 19456 .empty (.cutX 8704 .empty (.cutY 19968 (.cutX 8960 .empty (.cutY 19712 .empty (.cutX 9088 (.cutY 19840 .full .full) (.cutY 19840 (.cutX 9152 (.cutY 19776 .full .full) (.cutY 19776 .full .full)) .full)))) .empty))) .empty)) .empty) .empty) (.cutY 20480 .empty (.cutX 14336 (.cutY 22528 .empty (.cutX 13312 (.cutY 23552 .empty (.cutX 12800 .empty (.cutY 24064 (.cutX 13056 (.cutY 23808 (.cutX 12928 (.cutY 23680 .full .full) (.cutY 23680 (.cutX 12992 (.cutY 23616 .full .full) (.cutY 23616 .full .full)) .full)) .empty) .empty) .empty))) .empty)) .empty))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 .empty (.cutY 10240 (.cutX 19456 .empty (.cutY 9216 (.cutX 19968 (.cutY 8704 .empty (.cutX 19712 .empty (.cutY 8960 .empty (.cutX 19840 (.cutY 9088 .full (.cutX 19776 (.cutY 9152 .full .full) (.cutY 9152 .full .full))) (.cutY 9088 .full .full))))) .empty) .empty)) .empty)) .empty) (.cutY 12288 .empty (.cutX 22528 .empty (.cutY 14336 (.cutX 23552 .empty (.cutY 13312 (.cutX 24064 (.cutY 12800 .empty (.cutX 23808 (.cutY 13056 (.cutX 23680 (.cutY 12928 .full (.cutX 23616 (.cutY 12992 .full .full) (.cutY 12992 .full .full))) (.cutY 12928 .full .full)) .empty) .empty)) .empty) .empty)) .empty))))) .empty) .empty))

theorem metadata11 : 0<167101800 ∧ 35<128 ∧ 77<128 ∧ 1<4 ∧
    7492/4160=1 ∧ 7492%4160=3332 ∧ ∀ i, (leaves11 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData11).mp
    (by decide +kernel)

theorem sourceChecked11_0 : ∀ i : Fin 28,
    (fun i => output11 i = raw11 (source11 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked11 : ∀ i : Fin 28, (fun i => output11 i = raw11 (source11 i)) i :=
  forallFin_of_zero_offset (fun i => output11 i = raw11 (source11 i)) sourceChecked11_0

theorem coverChecked11_0 : ∀ i : Fin 28,
    (fun i => (output11 (cover11 i)).ContainsBox (raw11 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked11 : ∀ i : Fin 28, (fun i => (output11 (cover11 i)).ContainsBox (raw11 i)) i :=
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

noncomputable def phaseMass11 : ℝ := singlePhaseMass (167101800/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw11 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass11_eq : phaseMass11 = (835509/8192000000 : ℝ) := by
  unfold phaseMass11
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw11 output11 cover11 source11
    (gridTreeUnionCheck_sound 32768 raw11 output11 cover11 source11 tree11 checked11)
    _ (by norm_num) _, areaUnits11]
  norm_num

-- Frozen phase 4991, atom 7173, type 1, source (30,73).
def leavesData12 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves12 : Fin 10 → DyadicLeaf := leavesData12.get
def raw12 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 30 73 leaves12 i
def outputData12 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨7680,7808,18688,18816⟩) (.single ⟨7680,7808,18816,18944⟩)) (.node (.single ⟨7808,7872,18688,18752⟩) (.node (.single ⟨7808,7872,18752,18816⟩) (.single ⟨7872,7904,18688,18720⟩)))) (.node (.node (.single ⟨7872,7904,18720,18752⟩) (.single ⟨7904,7936,18688,18720⟩)) (.node (.single ⟨7904,7936,18720,18752⟩) (.node (.single ⟨7872,7936,18752,18816⟩) (.single ⟨7808,7936,18816,18944⟩))))) (.node (.node (.node (.single ⟨13824,13952,24832,24960⟩) (.single ⟨13824,13952,24960,25088⟩)) (.node (.single ⟨13952,14016,24832,24896⟩) (.node (.single ⟨13952,14016,24896,24960⟩) (.single ⟨14016,14048,24832,24864⟩)))) (.node (.node (.single ⟨14016,14048,24864,24896⟩) (.single ⟨14048,14080,24832,24864⟩)) (.node (.single ⟨14048,14080,24864,24896⟩) (.node (.single ⟨14016,14080,24896,24960⟩) (.single ⟨13952,14080,24960,25088⟩)))))) (.node (.node (.node (.node (.single ⟨18688,18816,7680,7808⟩) (.single ⟨18688,18752,7808,7872⟩)) (.node (.single ⟨18688,18720,7872,7904⟩) (.node (.single ⟨18688,18720,7904,7936⟩) (.single ⟨18720,18752,7872,7904⟩)))) (.node (.node (.single ⟨18720,18752,7904,7936⟩) (.single ⟨18752,18816,7808,7872⟩)) (.node (.single ⟨18752,18816,7872,7936⟩) (.node (.single ⟨18816,18944,7680,7808⟩) (.single ⟨18816,18944,7808,7936⟩))))) (.node (.node (.node (.single ⟨24832,24960,13824,13952⟩) (.single ⟨24832,24896,13952,14016⟩)) (.node (.single ⟨24832,24864,14016,14048⟩) (.node (.single ⟨24832,24864,14048,14080⟩) (.single ⟨24864,24896,14016,14048⟩)))) (.node (.node (.single ⟨24864,24896,14048,14080⟩) (.single ⟨24896,24960,13952,14016⟩)) (.node (.single ⟨24896,24960,14016,14080⟩) (.node (.single ⟨24960,25088,13824,13952⟩) (.single ⟨24960,25088,13952,14080⟩)))))))
def output12 : Fin 40 → GridBox := outputData12.get
def coverData12 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 28) (.single 38)) (.node (.single 11) (.node (.single 9) (.single 29))))) (.node (.node (.node (.single 30) (.single 10)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 26) (.node (.single 36) (.single 13)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 23) (.single 33)))) (.node (.node (.single 16) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))))
def sourceData12 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover12 (i : Fin 40) : Fin 40 := ⟨coverData12.get i % 40, Nat.mod_lt _ (by decide)⟩
def source12 (i : Fin 40) : Fin 40 := ⟨sourceData12.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree12 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 .empty (.cutX 7168 .empty (.cutY 19456 (.cutX 7680 .empty (.cutY 18944 (.cutX 7936 (.cutY 18688 .empty (.cutX 7808 (.cutY 18816 .full .full) (.cutY 18816 (.cutX 7872 (.cutY 18752 .full .full) (.cutY 18752 (.cutX 7904 (.cutY 18720 .full .full) (.cutY 18720 .full .full)) .full)) .full))) .empty) .empty)) .empty)))) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 (.cutX 13312 .empty (.cutY 25600 (.cutX 13824 .empty (.cutY 25088 (.cutX 14080 (.cutY 24832 .empty (.cutX 13952 (.cutY 24960 .full .full) (.cutY 24960 (.cutX 14016 (.cutY 24896 .full .full) (.cutY 24896 (.cutX 14048 (.cutY 24864 .full .full) (.cutY 24864 .full .full)) .full)) .full))) .empty) .empty)) .empty)) .empty) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 .empty (.cutX 19456 (.cutY 7168 .empty (.cutX 18944 (.cutY 7680 .empty (.cutX 18688 .empty (.cutY 7936 (.cutX 18816 (.cutY 7808 .full (.cutX 18752 (.cutY 7872 .full (.cutX 18720 (.cutY 7904 .full .full) (.cutY 7904 .full .full))) (.cutY 7872 .full .full))) (.cutY 7808 .full .full)) .empty))) .empty)) .empty)))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 (.cutX 25600 (.cutY 13312 .empty (.cutX 25088 (.cutY 13824 .empty (.cutX 24832 .empty (.cutY 14080 (.cutX 24960 (.cutY 13952 .full (.cutX 24896 (.cutY 14016 .full (.cutX 24864 (.cutY 14048 .full .full) (.cutY 14048 .full .full))) (.cutY 14016 .full .full))) (.cutY 13952 .full .full)) .empty))) .empty)) .empty) .empty) .empty)) .empty))) .empty))

theorem metadata12 : 0<140060506 ∧ 30<128 ∧ 73<128 ∧ 1<4 ∧
    7173/4160=1 ∧ 7173%4160=3013 ∧ ∀ i, (leaves12 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData12).mp
    (by decide +kernel)

theorem sourceChecked12_0 : ∀ i : Fin 40,
    (fun i => output12 i = raw12 (source12 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked12 : ∀ i : Fin 40, (fun i => output12 i = raw12 (source12 i)) i :=
  forallFin_of_zero_offset (fun i => output12 i = raw12 (source12 i)) sourceChecked12_0

theorem coverChecked12_0 : ∀ i : Fin 40,
    (fun i => (output12 (cover12 i)).ContainsBox (raw12 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked12 : ∀ i : Fin 40, (fun i => (output12 (cover12 i)).ContainsBox (raw12 i)) i :=
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

noncomputable def phaseMass12 : ℝ := singlePhaseMass (140060506/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw12 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass12_eq : phaseMass12 = (70030253/819200000000 : ℝ) := by
  unfold phaseMass12
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw12 output12 cover12 source12
    (gridTreeUnionCheck_sound 32768 raw12 output12 cover12 source12 tree12 checked12)
    _ (by norm_num) _, areaUnits12]
  norm_num

-- Frozen phase 4992, atom 3084, type 0, source (31,77).
def leavesData13 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves13 : Fin 4 → DyadicLeaf := leavesData13.get
def raw13 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 31 77 leaves13 i
def outputData13 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨7936,8064,19712,19840⟩) (.single ⟨7936,8064,19840,19968⟩)) (.node (.single ⟨8064,8192,19712,19840⟩) (.single ⟨8064,8192,19840,19968⟩))) (.node (.node (.single ⟨12800,12928,24576,24704⟩) (.single ⟨12800,12928,24704,24832⟩)) (.node (.single ⟨12928,13056,24576,24704⟩) (.single ⟨12928,13056,24704,24832⟩)))) (.node (.node (.node (.single ⟨19712,19840,7936,8064⟩) (.single ⟨19712,19840,8064,8192⟩)) (.node (.single ⟨19840,19968,7936,8064⟩) (.single ⟨19840,19968,8064,8192⟩))) (.node (.node (.single ⟨24576,24704,12800,12928⟩) (.single ⟨24576,24704,12928,13056⟩)) (.node (.single ⟨24704,24832,12800,12928⟩) (.single ⟨24704,24832,12928,13056⟩)))))
def output13 : Fin 16 → GridBox := outputData13.get
def coverData13 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData13 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover13 (i : Fin 16) : Fin 16 := ⟨coverData13.get i % 16, Nat.mod_lt _ (by decide)⟩
def source13 (i : Fin 16) : Fin 16 := ⟨sourceData13.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree13 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 .empty (.cutX 7168 .empty (.cutY 19456 .empty (.cutX 7680 .empty (.cutY 19968 (.cutX 7936 .empty (.cutY 19712 .empty (.cutX 8064 (.cutY 19840 .full .full) (.cutY 19840 .full .full)))) .empty)))))) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 (.cutX 13312 (.cutY 25600 (.cutX 12800 .empty (.cutY 25088 (.cutX 13056 (.cutY 24832 (.cutX 12928 (.cutY 24704 .full .full) (.cutY 24704 .full .full)) .empty) .empty) .empty)) .empty) .empty) .empty) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 .empty (.cutX 19456 .empty (.cutY 7168 .empty (.cutX 19968 (.cutY 7680 .empty (.cutX 19712 .empty (.cutY 7936 .empty (.cutX 19840 (.cutY 8064 .full .full) (.cutY 8064 .full .full))))) .empty)))))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 (.cutX 25600 (.cutY 13312 (.cutX 25088 (.cutY 12800 .empty (.cutX 24832 (.cutY 13056 (.cutX 24704 (.cutY 12928 .full .full) (.cutY 12928 .full .full)) .empty) .empty)) .empty) .empty) .empty) .empty) .empty)) .empty))) .empty))

theorem metadata13 : 0<177866497 ∧ 31<128 ∧ 77<128 ∧ 0<4 ∧
    3084/4160=0 ∧ 3084%4160=3084 ∧ ∀ i, (leaves13 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData13).mp
    (by decide +kernel)

theorem sourceChecked13_0 : ∀ i : Fin 16,
    (fun i => output13 i = raw13 (source13 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked13 : ∀ i : Fin 16, (fun i => output13 i = raw13 (source13 i)) i :=
  forallFin_of_zero_offset (fun i => output13 i = raw13 (source13 i)) sourceChecked13_0

theorem coverChecked13_0 : ∀ i : Fin 16,
    (fun i => (output13 (cover13 i)).ContainsBox (raw13 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked13 : ∀ i : Fin 16, (fun i => (output13 (cover13 i)).ContainsBox (raw13 i)) i :=
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

noncomputable def phaseMass13 : ℝ := singlePhaseMass (177866497/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw13 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass13_eq : phaseMass13 = (177866497/1638400000000 : ℝ) := by
  unfold phaseMass13
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw13 output13 cover13 source13
    (gridTreeUnionCheck_sound 32768 raw13 output13 cover13 source13 tree13 checked13)
    _ (by norm_num) _, areaUnits13]
  norm_num

-- Frozen phase 4993, atom 6882, type 1, source (26,70).
def leavesData14 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves14 : Fin 13 → DyadicLeaf := leavesData14.get
def raw14 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 26 70 leaves14 i
def outputData14 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨6656,6720,17920,17984⟩) (.node (.single ⟨6656,6720,17984,18048⟩) (.single ⟨6720,6784,17920,17984⟩))) (.node (.single ⟨6720,6784,17984,18048⟩) (.node (.single ⟨6656,6784,18048,18176⟩) (.single ⟨6784,6848,17920,17984⟩)))) (.node (.node (.single ⟨6784,6848,17984,18048⟩) (.node (.single ⟨6848,6880,17920,17952⟩) (.single ⟨6848,6880,17952,17984⟩))) (.node (.node (.single ⟨6880,6912,17920,17952⟩) (.single ⟨6880,6912,17952,17984⟩)) (.node (.single ⟨6848,6912,17984,18048⟩) (.single ⟨6784,6912,18048,18176⟩))))) (.node (.node (.node (.single ⟨14592,14720,25856,25984⟩) (.node (.single ⟨14592,14720,25984,26112⟩) (.single ⟨14720,14784,25856,25920⟩))) (.node (.single ⟨14720,14784,25920,25984⟩) (.node (.single ⟨14784,14816,25856,25888⟩) (.single ⟨14784,14816,25888,25920⟩)))) (.node (.node (.single ⟨14816,14848,25856,25888⟩) (.node (.single ⟨14816,14848,25888,25920⟩) (.single ⟨14784,14848,25920,25984⟩))) (.node (.node (.single ⟨14720,14784,25984,26048⟩) (.single ⟨14720,14784,26048,26112⟩)) (.node (.single ⟨14784,14848,25984,26048⟩) (.single ⟨14784,14848,26048,26112⟩)))))) (.node (.node (.node (.node (.single ⟨17920,17984,6656,6720⟩) (.node (.single ⟨17920,17984,6720,6784⟩) (.single ⟨17984,18048,6656,6720⟩))) (.node (.single ⟨17984,18048,6720,6784⟩) (.node (.single ⟨17920,17984,6784,6848⟩) (.single ⟨17920,17952,6848,6880⟩)))) (.node (.node (.single ⟨17920,17952,6880,6912⟩) (.node (.single ⟨17952,17984,6848,6880⟩) (.single ⟨17952,17984,6880,6912⟩))) (.node (.node (.single ⟨17984,18048,6784,6848⟩) (.single ⟨17984,18048,6848,6912⟩)) (.node (.single ⟨18048,18176,6656,6784⟩) (.single ⟨18048,18176,6784,6912⟩))))) (.node (.node (.node (.single ⟨25856,25984,14592,14720⟩) (.node (.single ⟨25856,25920,14720,14784⟩) (.single ⟨25856,25888,14784,14816⟩))) (.node (.single ⟨25856,25888,14816,14848⟩) (.node (.single ⟨25888,25920,14784,14816⟩) (.single ⟨25888,25920,14816,14848⟩)))) (.node (.node (.single ⟨25920,25984,14720,14784⟩) (.node (.single ⟨25920,25984,14784,14848⟩) (.single ⟨25984,26112,14592,14720⟩))) (.node (.node (.single ⟨25984,26048,14720,14784⟩) (.single ⟨25984,26048,14784,14848⟩)) (.node (.single ⟨26048,26112,14720,14784⟩) (.single ⟨26048,26112,14784,14848⟩)))))))
def output14 : Fin 52 → GridBox := outputData14.get
def coverData14 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData14 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover14 (i : Fin 52) : Fin 52 := ⟨coverData14.get i % 52, Nat.mod_lt _ (by decide)⟩
def source14 (i : Fin 52) : Fin 52 := ⟨sourceData14.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree14 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 (.cutX 7168 (.cutY 17408 .empty (.cutX 6656 .empty (.cutY 17920 .empty (.cutX 6912 (.cutY 18176 (.cutX 6784 (.cutY 18048 (.cutX 6720 (.cutY 17984 .full .full) (.cutY 17984 .full .full)) .full) (.cutY 18048 (.cutX 6848 (.cutY 17984 .full .full) (.cutY 17984 (.cutX 6880 (.cutY 17952 .full .full) (.cutY 17952 .full .full)) .full)) .full)) .empty) .empty)))) .empty) .empty)) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 (.cutX 15360 (.cutY 25600 .empty (.cutX 14848 (.cutY 26112 (.cutX 14592 .empty (.cutY 25856 .empty (.cutX 14720 (.cutY 25984 .full .full) (.cutY 25984 (.cutX 14784 (.cutY 25920 .full .full) (.cutY 25920 (.cutX 14816 (.cutY 25888 .full .full) (.cutY 25888 .full .full)) .full)) (.cutX 14784 (.cutY 26048 .full .full) (.cutY 26048 .full .full)))))) .empty) .empty)) .empty) .empty)) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 .empty (.cutX 17408 .empty (.cutY 7168 (.cutX 17920 .empty (.cutY 6656 .empty (.cutX 18176 (.cutY 6912 (.cutX 18048 (.cutY 6784 (.cutX 17984 (.cutY 6720 .full .full) (.cutY 6720 .full .full)) (.cutX 17984 (.cutY 6848 .full (.cutX 17952 (.cutY 6880 .full .full) (.cutY 6880 .full .full))) (.cutY 6848 .full .full))) (.cutY 6784 .full .full)) .empty) .empty))) .empty))) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 .empty (.cutX 25600 .empty (.cutY 15360 (.cutX 26112 (.cutY 14848 (.cutX 25856 .empty (.cutY 14592 .empty (.cutX 25984 (.cutY 14720 .full (.cutX 25920 (.cutY 14784 .full (.cutX 25888 (.cutY 14816 .full .full) (.cutY 14816 .full .full))) (.cutY 14784 .full .full))) (.cutY 14720 .full (.cutX 26048 (.cutY 14784 .full .full) (.cutY 14784 .full .full)))))) .empty) .empty) .empty))) .empty)) .empty))) .empty))

theorem metadata14 : 0<175587969 ∧ 26<128 ∧ 70<128 ∧ 1<4 ∧
    6882/4160=1 ∧ 6882%4160=2722 ∧ ∀ i, (leaves14 i).Valid 8 := by
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

noncomputable def phaseMass14 : ℝ := singlePhaseMass (175587969/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw14 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass14_eq : phaseMass14 = (175587969/1638400000000 : ℝ) := by
  unfold phaseMass14
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw14 output14 cover14 source14
    (gridTreeUnionCheck_sound 32768 raw14 output14 cover14 source14 tree14 checked14)
    _ (by norm_num) _, areaUnits14]
  norm_num

-- Frozen phase 4994, atom 5917, type 1, source (15,62).
def leavesData15 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves15 : Fin 10 → DyadicLeaf := leavesData15.get
def raw15 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 15 62 leaves15 i
def outputData15 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨3840,3968,15872,16000⟩) (.single ⟨3840,3968,16000,16128⟩)) (.node (.single ⟨3968,4032,15872,15936⟩) (.node (.single ⟨3968,4032,15936,16000⟩) (.single ⟨4032,4064,15872,15904⟩)))) (.node (.node (.single ⟨4032,4064,15904,15936⟩) (.single ⟨4064,4096,15872,15904⟩)) (.node (.single ⟨4064,4096,15904,15936⟩) (.node (.single ⟨4032,4096,15936,16000⟩) (.single ⟨3968,4096,16000,16128⟩))))) (.node (.node (.node (.single ⟨15872,16000,3840,3968⟩) (.single ⟨15872,15936,3968,4032⟩)) (.node (.single ⟨15872,15904,4032,4064⟩) (.node (.single ⟨15872,15904,4064,4096⟩) (.single ⟨15904,15936,4032,4064⟩)))) (.node (.node (.single ⟨15904,15936,4064,4096⟩) (.single ⟨15936,16000,3968,4032⟩)) (.node (.single ⟨15936,16000,4032,4096⟩) (.node (.single ⟨16000,16128,3840,3968⟩) (.single ⟨16000,16128,3968,4096⟩)))))) (.node (.node (.node (.node (.single ⟨16640,16768,28672,28800⟩) (.single ⟨16640,16768,28800,28928⟩)) (.node (.single ⟨16768,16832,28672,28736⟩) (.node (.single ⟨16768,16832,28736,28800⟩) (.single ⟨16832,16864,28672,28704⟩)))) (.node (.node (.single ⟨16832,16864,28704,28736⟩) (.single ⟨16864,16896,28672,28704⟩)) (.node (.single ⟨16864,16896,28704,28736⟩) (.node (.single ⟨16832,16896,28736,28800⟩) (.single ⟨16768,16896,28800,28928⟩))))) (.node (.node (.node (.single ⟨28672,28800,16640,16768⟩) (.single ⟨28672,28736,16768,16832⟩)) (.node (.single ⟨28672,28704,16832,16864⟩) (.node (.single ⟨28672,28704,16864,16896⟩) (.single ⟨28704,28736,16832,16864⟩)))) (.node (.node (.single ⟨28704,28736,16864,16896⟩) (.single ⟨28736,28800,16768,16832⟩)) (.node (.single ⟨28736,28800,16832,16896⟩) (.node (.single ⟨28800,28928,16640,16768⟩) (.single ⟨28800,28928,16768,16896⟩)))))))
def output15 : Fin 40 → GridBox := outputData15.get
def coverData15 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 10)) (.node (.single 39) (.node (.single 29) (.single 1)))) (.node (.node (.single 18) (.single 38)) (.node (.single 21) (.node (.single 9) (.single 19))))) (.node (.node (.node (.single 30) (.single 20)) (.node (.single 2) (.node (.single 11) (.single 37)))) (.node (.node (.single 28) (.single 3)) (.node (.single 16) (.node (.single 36) (.single 23)))))) (.node (.node (.node (.node (.single 8) (.single 17)) (.node (.single 31) (.node (.single 22) (.single 4)))) (.node (.node (.single 12) (.single 35)) (.node (.single 27) (.node (.single 5) (.single 14))))) (.node (.node (.node (.single 34) (.single 25)) (.node (.single 6) (.node (.single 13) (.single 33)))) (.node (.node (.single 26) (.single 7)) (.node (.single 15) (.node (.single 32) (.single 24)))))))
def sourceData15 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9)))))) (.node (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover15 (i : Fin 40) : Fin 40 := ⟨coverData15.get i % 40, Nat.mod_lt _ (by decide)⟩
def source15 (i : Fin 40) : Fin 40 := ⟨sourceData15.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree15 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 .empty (.cutX 3072 .empty (.cutY 15360 .empty (.cutX 3584 .empty (.cutY 15872 .empty (.cutX 3840 .empty (.cutY 16128 (.cutX 3968 (.cutY 16000 .full .full) (.cutY 16000 (.cutX 4032 (.cutY 15936 .full .full) (.cutY 15936 (.cutX 4064 (.cutY 15904 .full .full) (.cutY 15904 .full .full)) .full)) .full)) .empty))))))))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 .empty (.cutX 15360 .empty (.cutY 3072 .empty (.cutX 15872 .empty (.cutY 3584 .empty (.cutX 16128 (.cutY 3840 .empty (.cutX 16000 (.cutY 3968 .full (.cutX 15936 (.cutY 4032 .full (.cutX 15904 (.cutY 4064 .full .full) (.cutY 4064 .full .full))) (.cutY 4032 .full .full))) (.cutY 3968 .full .full))) .empty))))))) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 (.cutX 17408 (.cutY 29696 (.cutX 16896 (.cutY 29184 (.cutX 16640 .empty (.cutY 28928 (.cutX 16768 (.cutY 28800 .full .full) (.cutY 28800 (.cutX 16832 (.cutY 28736 .full .full) (.cutY 28736 (.cutX 16864 (.cutY 28704 .full .full) (.cutY 28704 .full .full)) .full)) .full)) .empty)) .empty) .empty) .empty) .empty) .empty) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 (.cutX 29696 (.cutY 17408 (.cutX 29184 (.cutY 16896 (.cutX 28928 (.cutY 16640 .empty (.cutX 28800 (.cutY 16768 .full (.cutX 28736 (.cutY 16832 .full (.cutX 28704 (.cutY 16864 .full .full) (.cutY 16864 .full .full))) (.cutY 16832 .full .full))) (.cutY 16768 .full .full))) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty)) .empty))))

theorem metadata15 : 0<163200014 ∧ 15<128 ∧ 62<128 ∧ 1<4 ∧
    5917/4160=1 ∧ 5917%4160=1757 ∧ ∀ i, (leaves15 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData15).mp
    (by decide +kernel)

theorem sourceChecked15_0 : ∀ i : Fin 40,
    (fun i => output15 i = raw15 (source15 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked15 : ∀ i : Fin 40, (fun i => output15 i = raw15 (source15 i)) i :=
  forallFin_of_zero_offset (fun i => output15 i = raw15 (source15 i)) sourceChecked15_0

theorem coverChecked15_0 : ∀ i : Fin 40,
    (fun i => (output15 (cover15 i)).ContainsBox (raw15 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked15 : ∀ i : Fin 40, (fun i => (output15 (cover15 i)).ContainsBox (raw15 i)) i :=
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

noncomputable def phaseMass15 : ℝ := singlePhaseMass (163200014/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw15 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass15_eq : phaseMass15 = (81600007/819200000000 : ℝ) := by
  unfold phaseMass15
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw15 output15 cover15 source15
    (gridTreeUnionCheck_sound 32768 raw15 output15 cover15 source15 tree15 checked15)
    _ (by norm_num) _, areaUnits15]
  norm_num

-- Frozen phase 4995, atom 5612, type 1, source (12,60).
def leavesData16 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves16 : Fin 7 → DyadicLeaf := leavesData16.get
def raw16 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 12 60 leaves16 i
def outputData16 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3072,3200,15360,15488⟩) (.node (.single ⟨3072,3200,15488,15616⟩) (.single ⟨3200,3264,15360,15424⟩))) (.node (.node (.single ⟨3200,3264,15424,15488⟩) (.single ⟨3264,3328,15360,15424⟩)) (.node (.single ⟨3264,3328,15424,15488⟩) (.single ⟨3200,3328,15488,15616⟩)))) (.node (.node (.single ⟨15360,15488,3072,3200⟩) (.node (.single ⟨15360,15424,3200,3264⟩) (.single ⟨15360,15424,3264,3328⟩))) (.node (.node (.single ⟨15424,15488,3200,3264⟩) (.single ⟨15424,15488,3264,3328⟩)) (.node (.single ⟨15488,15616,3072,3200⟩) (.single ⟨15488,15616,3200,3328⟩))))) (.node (.node (.node (.single ⟨17152,17280,29440,29568⟩) (.node (.single ⟨17152,17280,29568,29696⟩) (.single ⟨17280,17344,29440,29504⟩))) (.node (.node (.single ⟨17280,17344,29504,29568⟩) (.single ⟨17344,17408,29440,29504⟩)) (.node (.single ⟨17344,17408,29504,29568⟩) (.single ⟨17280,17408,29568,29696⟩)))) (.node (.node (.single ⟨29440,29568,17152,17280⟩) (.node (.single ⟨29440,29504,17280,17344⟩) (.single ⟨29440,29504,17344,17408⟩))) (.node (.node (.single ⟨29504,29568,17280,17344⟩) (.single ⟨29504,29568,17344,17408⟩)) (.node (.single ⟨29568,29696,17152,17280⟩) (.single ⟨29568,29696,17280,17408⟩))))))
def output16 : Fin 28 → GridBox := outputData16.get
def coverData16 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData16 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover16 (i : Fin 28) : Fin 28 := ⟨coverData16.get i % 28, Nat.mod_lt _ (by decide)⟩
def source16 (i : Fin 28) : Fin 28 := ⟨sourceData16.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree16 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 .empty (.cutX 3072 .empty (.cutY 15360 .empty (.cutX 3584 (.cutY 15872 (.cutX 3328 (.cutY 15616 (.cutX 3200 (.cutY 15488 .full .full) (.cutY 15488 (.cutX 3264 (.cutY 15424 .full .full) (.cutY 15424 .full .full)) .full)) .empty) .empty) .empty) .empty)))))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 .empty (.cutX 15360 .empty (.cutY 3072 .empty (.cutX 15872 (.cutY 3584 (.cutX 15616 (.cutY 3328 (.cutX 15488 (.cutY 3200 .full (.cutX 15424 (.cutY 3264 .full .full) (.cutY 3264 .full .full))) (.cutY 3200 .full .full)) .empty) .empty) .empty) .empty))))) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 (.cutX 17408 (.cutY 29696 (.cutX 16896 .empty (.cutY 29184 .empty (.cutX 17152 .empty (.cutY 29440 .empty (.cutX 17280 (.cutY 29568 .full .full) (.cutY 29568 (.cutX 17344 (.cutY 29504 .full .full) (.cutY 29504 .full .full)) .full)))))) .empty) .empty) .empty) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 (.cutX 29696 (.cutY 17408 (.cutX 29184 .empty (.cutY 16896 .empty (.cutX 29440 .empty (.cutY 17152 .empty (.cutX 29568 (.cutY 17280 .full (.cutX 29504 (.cutY 17344 .full .full) (.cutY 17344 .full .full))) (.cutY 17280 .full .full)))))) .empty) .empty) .empty) .empty) .empty)) .empty))))

theorem metadata16 : 0<163200014 ∧ 12<128 ∧ 60<128 ∧ 1<4 ∧
    5612/4160=1 ∧ 5612%4160=1452 ∧ ∀ i, (leaves16 i).Valid 8 := by
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

noncomputable def phaseMass16 : ℝ := singlePhaseMass (163200014/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw16 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass16_eq : phaseMass16 = (81600007/819200000000 : ℝ) := by
  unfold phaseMass16
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw16 output16 cover16 source16
    (gridTreeUnionCheck_sound 32768 raw16 output16 cover16 source16 tree16 checked16)
    _ (by norm_num) _, areaUnits16]
  norm_num

-- Frozen phase 4996, atom 5399, type 1, source (10,59).
def leavesData17 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves17 : Fin 7 → DyadicLeaf := leavesData17.get
def raw17 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 10 59 leaves17 i
def outputData17 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨2560,2688,15104,15232⟩) (.node (.single ⟨2560,2688,15232,15360⟩) (.single ⟨2688,2752,15104,15168⟩))) (.node (.node (.single ⟨2688,2752,15168,15232⟩) (.single ⟨2752,2816,15104,15168⟩)) (.node (.single ⟨2752,2816,15168,15232⟩) (.single ⟨2688,2816,15232,15360⟩)))) (.node (.node (.single ⟨15104,15232,2560,2688⟩) (.node (.single ⟨15104,15168,2688,2752⟩) (.single ⟨15104,15168,2752,2816⟩))) (.node (.node (.single ⟨15168,15232,2688,2752⟩) (.single ⟨15168,15232,2752,2816⟩)) (.node (.single ⟨15232,15360,2560,2688⟩) (.single ⟨15232,15360,2688,2816⟩))))) (.node (.node (.node (.single ⟨17408,17536,29952,30080⟩) (.node (.single ⟨17408,17536,30080,30208⟩) (.single ⟨17536,17600,29952,30016⟩))) (.node (.node (.single ⟨17536,17600,30016,30080⟩) (.single ⟨17600,17664,29952,30016⟩)) (.node (.single ⟨17600,17664,30016,30080⟩) (.single ⟨17536,17664,30080,30208⟩)))) (.node (.node (.single ⟨29952,30080,17408,17536⟩) (.node (.single ⟨29952,30016,17536,17600⟩) (.single ⟨29952,30016,17600,17664⟩))) (.node (.node (.single ⟨30016,30080,17536,17600⟩) (.single ⟨30016,30080,17600,17664⟩)) (.node (.single ⟨30080,30208,17408,17536⟩) (.single ⟨30080,30208,17536,17664⟩))))))
def output17 : Fin 28 → GridBox := outputData17.get
def coverData17 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData17 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover17 (i : Fin 28) : Fin 28 := ⟨coverData17.get i % 28, Nat.mod_lt _ (by decide)⟩
def source17 (i : Fin 28) : Fin 28 := ⟨sourceData17.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree17 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 .empty (.cutX 3072 (.cutY 15360 (.cutX 2560 .empty (.cutY 14848 .empty (.cutX 2816 (.cutY 15104 .empty (.cutX 2688 (.cutY 15232 .full .full) (.cutY 15232 (.cutX 2752 (.cutY 15168 .full .full) (.cutY 15168 .full .full)) .full))) .empty))) .empty) .empty)))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 .empty (.cutX 15360 (.cutY 3072 (.cutX 14848 .empty (.cutY 2560 .empty (.cutX 15104 .empty (.cutY 2816 (.cutX 15232 (.cutY 2688 .full (.cutX 15168 (.cutY 2752 .full .full) (.cutY 2752 .full .full))) (.cutY 2688 .full .full)) .empty)))) .empty) .empty))) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 (.cutX 17408 .empty (.cutY 29696 .empty (.cutX 17920 (.cutY 30208 (.cutX 17664 (.cutY 29952 .empty (.cutX 17536 (.cutY 30080 .full .full) (.cutY 30080 (.cutX 17600 (.cutY 30016 .full .full) (.cutY 30016 .full .full)) .full))) .empty) .empty) .empty))) .empty) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 (.cutX 29696 .empty (.cutY 17408 .empty (.cutX 30208 (.cutY 17920 (.cutX 29952 .empty (.cutY 17664 (.cutX 30080 (.cutY 17536 .full (.cutX 30016 (.cutY 17600 .full .full) (.cutY 17600 .full .full))) (.cutY 17536 .full .full)) .empty)) .empty) .empty))) .empty) .empty) .empty)) .empty))))

theorem metadata17 : 0<163200014 ∧ 10<128 ∧ 59<128 ∧ 1<4 ∧
    5399/4160=1 ∧ 5399%4160=1239 ∧ ∀ i, (leaves17 i).Valid 8 := by
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

noncomputable def phaseMass17 : ℝ := singlePhaseMass (163200014/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw17 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass17_eq : phaseMass17 = (81600007/819200000000 : ℝ) := by
  unfold phaseMass17
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw17 output17 cover17 source17
    (gridTreeUnionCheck_sound 32768 raw17 output17 cover17 source17 tree17 checked17)
    _ (by norm_num) _, areaUnits17]
  norm_num

-- Frozen phase 4997, atom 5178, type 1, source (8,58).
def leavesData18 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves18 : Fin 10 → DyadicLeaf := leavesData18.get
def raw18 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 8 58 leaves18 i
def outputData18 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨2048,2112,14848,14912⟩) (.single ⟨2048,2112,14912,14976⟩)) (.node (.single ⟨2112,2176,14848,14912⟩) (.node (.single ⟨2112,2176,14912,14976⟩) (.single ⟨2048,2176,14976,15104⟩)))) (.node (.node (.single ⟨2176,2240,14848,14912⟩) (.single ⟨2176,2240,14912,14976⟩)) (.node (.single ⟨2240,2304,14848,14912⟩) (.node (.single ⟨2240,2304,14912,14976⟩) (.single ⟨2176,2304,14976,15104⟩))))) (.node (.node (.node (.single ⟨14848,14912,2048,2112⟩) (.single ⟨14848,14912,2112,2176⟩)) (.node (.single ⟨14912,14976,2048,2112⟩) (.node (.single ⟨14912,14976,2112,2176⟩) (.single ⟨14848,14912,2176,2240⟩)))) (.node (.node (.single ⟨14848,14912,2240,2304⟩) (.single ⟨14912,14976,2176,2240⟩)) (.node (.single ⟨14912,14976,2240,2304⟩) (.node (.single ⟨14976,15104,2048,2176⟩) (.single ⟨14976,15104,2176,2304⟩)))))) (.node (.node (.node (.node (.single ⟨17664,17792,30464,30592⟩) (.single ⟨17664,17792,30592,30720⟩)) (.node (.single ⟨17792,17856,30464,30528⟩) (.node (.single ⟨17792,17856,30528,30592⟩) (.single ⟨17856,17920,30464,30528⟩)))) (.node (.node (.single ⟨17856,17920,30528,30592⟩) (.single ⟨17792,17856,30592,30656⟩)) (.node (.single ⟨17792,17856,30656,30720⟩) (.node (.single ⟨17856,17920,30592,30656⟩) (.single ⟨17856,17920,30656,30720⟩))))) (.node (.node (.node (.single ⟨30464,30592,17664,17792⟩) (.single ⟨30464,30528,17792,17856⟩)) (.node (.single ⟨30464,30528,17856,17920⟩) (.node (.single ⟨30528,30592,17792,17856⟩) (.single ⟨30528,30592,17856,17920⟩)))) (.node (.node (.single ⟨30592,30720,17664,17792⟩) (.single ⟨30592,30656,17792,17856⟩)) (.node (.single ⟨30592,30656,17856,17920⟩) (.node (.single ⟨30656,30720,17792,17856⟩) (.single ⟨30656,30720,17856,17920⟩)))))))
def output18 : Fin 40 → GridBox := outputData18.get
def coverData18 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 18)) (.node (.single 35) (.node (.single 21) (.single 9)))) (.node (.node (.single 19) (.single 30)) (.node (.single 20) (.node (.single 5) (.single 14))))) (.node (.node (.node (.single 34) (.single 25)) (.node (.single 6) (.node (.single 16) (.single 33)))) (.node (.node (.single 23) (.single 7)) (.node (.single 15) (.node (.single 32) (.single 24)))))) (.node (.node (.node (.node (.single 8) (.single 17)) (.node (.single 31) (.node (.single 22) (.single 0)))) (.node (.node (.single 10) (.single 39)) (.node (.single 29) (.node (.single 1) (.single 12))))) (.node (.node (.node (.single 38) (.single 27)) (.node (.single 2) (.node (.single 11) (.single 37)))) (.node (.node (.single 28) (.single 3)) (.node (.single 13) (.node (.single 36) (.single 26)))))))
def sourceData18 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover18 (i : Fin 40) : Fin 40 := ⟨coverData18.get i % 40, Nat.mod_lt _ (by decide)⟩
def source18 (i : Fin 40) : Fin 40 := ⟨sourceData18.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree18 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 .empty (.cutX 3072 (.cutY 15360 (.cutX 2560 (.cutY 14848 .empty (.cutX 2304 (.cutY 15104 (.cutX 2176 (.cutY 14976 (.cutX 2112 (.cutY 14912 .full .full) (.cutY 14912 .full .full)) .full) (.cutY 14976 (.cutX 2240 (.cutY 14912 .full .full) (.cutY 14912 .full .full)) .full)) .empty) .empty)) .empty) .empty) .empty)))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 .empty (.cutX 15360 (.cutY 3072 (.cutX 14848 .empty (.cutY 2560 (.cutX 15104 (.cutY 2304 (.cutX 14976 (.cutY 2176 (.cutX 14912 (.cutY 2112 .full .full) (.cutY 2112 .full .full)) (.cutX 14912 (.cutY 2240 .full .full) (.cutY 2240 .full .full))) (.cutY 2176 .full .full)) .empty) .empty) .empty)) .empty) .empty))) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 (.cutX 17408 .empty (.cutY 29696 .empty (.cutX 17920 (.cutY 30208 .empty (.cutX 17664 .empty (.cutY 30464 .empty (.cutX 17792 (.cutY 30592 .full .full) (.cutY 30592 (.cutX 17856 (.cutY 30528 .full .full) (.cutY 30528 .full .full)) (.cutX 17856 (.cutY 30656 .full .full) (.cutY 30656 .full .full))))))) .empty))) .empty) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 (.cutX 29696 .empty (.cutY 17408 .empty (.cutX 30208 .empty (.cutY 17920 (.cutX 30464 .empty (.cutY 17664 .empty (.cutX 30592 (.cutY 17792 .full (.cutX 30528 (.cutY 17856 .full .full) (.cutY 17856 .full .full))) (.cutY 17792 .full (.cutX 30656 (.cutY 17856 .full .full) (.cutY 17856 .full .full)))))) .empty)))) .empty) .empty) .empty)) .empty))))

theorem metadata18 : 0<163200014 ∧ 8<128 ∧ 58<128 ∧ 1<4 ∧
    5178/4160=1 ∧ 5178%4160=1018 ∧ ∀ i, (leaves18 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData18).mp
    (by decide +kernel)

theorem sourceChecked18_0 : ∀ i : Fin 40,
    (fun i => output18 i = raw18 (source18 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked18 : ∀ i : Fin 40, (fun i => output18 i = raw18 (source18 i)) i :=
  forallFin_of_zero_offset (fun i => output18 i = raw18 (source18 i)) sourceChecked18_0

theorem coverChecked18_0 : ∀ i : Fin 40,
    (fun i => (output18 (cover18 i)).ContainsBox (raw18 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked18 : ∀ i : Fin 40, (fun i => (output18 (cover18 i)).ContainsBox (raw18 i)) i :=
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

noncomputable def phaseMass18 : ℝ := singlePhaseMass (163200014/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw18 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass18_eq : phaseMass18 = (81600007/819200000000 : ℝ) := by
  unfold phaseMass18
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw18 output18 cover18 source18
    (gridTreeUnionCheck_sound 32768 raw18 output18 cover18 source18 tree18 checked18)
    _ (by norm_num) _, areaUnits18]
  norm_num

-- Frozen phase 4998, atom 4832, type 1, source (5,57).
def leavesData19 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves19 : Fin 13 → DyadicLeaf := leavesData19.get
def raw19 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 5 57 leaves19 i
def outputData19 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨1280,1344,14592,14656⟩) (.node (.single ⟨1280,1344,14656,14720⟩) (.single ⟨1344,1408,14592,14656⟩))) (.node (.single ⟨1344,1408,14656,14720⟩) (.node (.single ⟨1280,1408,14720,14848⟩) (.single ⟨1408,1472,14592,14656⟩)))) (.node (.node (.single ⟨1408,1472,14656,14720⟩) (.node (.single ⟨1472,1504,14592,14624⟩) (.single ⟨1472,1504,14624,14656⟩))) (.node (.node (.single ⟨1504,1536,14592,14624⟩) (.single ⟨1504,1536,14624,14656⟩)) (.node (.single ⟨1472,1536,14656,14720⟩) (.single ⟨1408,1536,14720,14848⟩))))) (.node (.node (.node (.single ⟨14592,14656,1280,1344⟩) (.node (.single ⟨14592,14656,1344,1408⟩) (.single ⟨14656,14720,1280,1344⟩))) (.node (.single ⟨14656,14720,1344,1408⟩) (.node (.single ⟨14592,14656,1408,1472⟩) (.single ⟨14592,14624,1472,1504⟩)))) (.node (.node (.single ⟨14592,14624,1504,1536⟩) (.node (.single ⟨14624,14656,1472,1504⟩) (.single ⟨14624,14656,1504,1536⟩))) (.node (.node (.single ⟨14656,14720,1408,1472⟩) (.single ⟨14656,14720,1472,1536⟩)) (.node (.single ⟨14720,14848,1280,1408⟩) (.single ⟨14720,14848,1408,1536⟩)))))) (.node (.node (.node (.node (.single ⟨17920,18048,31232,31360⟩) (.node (.single ⟨17920,18048,31360,31488⟩) (.single ⟨18048,18112,31232,31296⟩))) (.node (.single ⟨18048,18112,31296,31360⟩) (.node (.single ⟨18112,18144,31232,31264⟩) (.single ⟨18112,18144,31264,31296⟩)))) (.node (.node (.single ⟨18144,18176,31232,31264⟩) (.node (.single ⟨18144,18176,31264,31296⟩) (.single ⟨18112,18176,31296,31360⟩))) (.node (.node (.single ⟨18048,18112,31360,31424⟩) (.single ⟨18048,18112,31424,31488⟩)) (.node (.single ⟨18112,18176,31360,31424⟩) (.single ⟨18112,18176,31424,31488⟩))))) (.node (.node (.node (.single ⟨31232,31360,17920,18048⟩) (.node (.single ⟨31232,31296,18048,18112⟩) (.single ⟨31232,31264,18112,18144⟩))) (.node (.single ⟨31232,31264,18144,18176⟩) (.node (.single ⟨31264,31296,18112,18144⟩) (.single ⟨31264,31296,18144,18176⟩)))) (.node (.node (.single ⟨31296,31360,18048,18112⟩) (.node (.single ⟨31296,31360,18112,18176⟩) (.single ⟨31360,31488,17920,18048⟩))) (.node (.node (.single ⟨31360,31424,18048,18112⟩) (.single ⟨31360,31424,18112,18176⟩)) (.node (.single ⟨31424,31488,18048,18112⟩) (.single ⟨31424,31488,18112,18176⟩)))))))
def output19 : Fin 52 → GridBox := outputData19.get
def coverData19 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 24) (.single 47))) (.node (.single 27) (.node (.single 12) (.single 25)))) (.node (.node (.single 39) (.node (.single 26) (.single 5))) (.node (.node (.single 17) (.single 46)) (.node (.single 34) (.single 6))))) (.node (.node (.node (.single 22) (.node (.single 45) (.single 29))) (.node (.single 11) (.node (.single 23) (.single 40)))) (.node (.node (.single 28) (.node (.single 0) (.single 13))) (.node (.node (.single 51) (.single 38)) (.node (.single 1) (.single 15)))))) (.node (.node (.node (.node (.single 50) (.node (.single 36) (.single 2))) (.node (.single 14) (.node (.single 49) (.single 37)))) (.node (.node (.single 3) (.node (.single 16) (.single 48))) (.node (.node (.single 35) (.single 7)) (.node (.single 18) (.single 44))))) (.node (.node (.node (.single 33) (.node (.single 8) (.single 20))) (.node (.single 43) (.node (.single 31) (.single 9)))) (.node (.node (.single 19) (.node (.single 42) (.single 32))) (.node (.node (.single 10) (.single 21)) (.node (.single 41) (.single 30)))))))
def sourceData19 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover19 (i : Fin 52) : Fin 52 := ⟨coverData19.get i % 52, Nat.mod_lt _ (by decide)⟩
def source19 (i : Fin 52) : Fin 52 := ⟨sourceData19.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree19 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 .empty (.cutX 1024 .empty (.cutY 15360 (.cutX 1536 (.cutY 14848 (.cutX 1280 .empty (.cutY 14592 .empty (.cutX 1408 (.cutY 14720 (.cutX 1344 (.cutY 14656 .full .full) (.cutY 14656 .full .full)) .full) (.cutY 14720 (.cutX 1472 (.cutY 14656 .full .full) (.cutY 14656 (.cutX 1504 (.cutY 14624 .full .full) (.cutY 14624 .full .full)) .full)) .full)))) .empty) .empty) .empty))) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 (.cutX 15360 (.cutY 1024 .empty (.cutX 14848 (.cutY 1536 (.cutX 14592 .empty (.cutY 1280 .empty (.cutX 14720 (.cutY 1408 (.cutX 14656 (.cutY 1344 .full .full) (.cutY 1344 .full .full)) (.cutX 14656 (.cutY 1472 .full (.cutX 14624 (.cutY 1504 .full .full) (.cutY 1504 .full .full))) (.cutY 1472 .full .full))) (.cutY 1408 .full .full)))) .empty) .empty)) .empty) .empty)) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 .empty (.cutX 17408 .empty (.cutY 31744 (.cutX 17920 .empty (.cutY 31232 .empty (.cutX 18176 (.cutY 31488 (.cutX 18048 (.cutY 31360 .full .full) (.cutY 31360 (.cutX 18112 (.cutY 31296 .full .full) (.cutY 31296 (.cutX 18144 (.cutY 31264 .full .full) (.cutY 31264 .full .full)) .full)) (.cutX 18112 (.cutY 31424 .full .full) (.cutY 31424 .full .full)))) .empty) .empty))) .empty))) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 (.cutX 31744 (.cutY 17408 .empty (.cutX 31232 .empty (.cutY 17920 .empty (.cutX 31488 (.cutY 18176 (.cutX 31360 (.cutY 18048 .full (.cutX 31296 (.cutY 18112 .full (.cutX 31264 (.cutY 18144 .full .full) (.cutY 18144 .full .full))) (.cutY 18112 .full .full))) (.cutY 18048 .full (.cutX 31424 (.cutY 18112 .full .full) (.cutY 18112 .full .full)))) .empty) .empty)))) .empty) .empty)) .empty)) .empty))))

theorem metadata19 : 0<169648215 ∧ 5<128 ∧ 57<128 ∧ 1<4 ∧
    4832/4160=1 ∧ 4832%4160=672 ∧ ∀ i, (leaves19 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData19).mp
    (by decide +kernel)

theorem sourceChecked19_0 : ∀ i : Fin 52,
    (fun i => output19 i = raw19 (source19 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked19 : ∀ i : Fin 52, (fun i => output19 i = raw19 (source19 i)) i :=
  forallFin_of_zero_offset (fun i => output19 i = raw19 (source19 i)) sourceChecked19_0

theorem coverChecked19_0 : ∀ i : Fin 52,
    (fun i => (output19 (cover19 i)).ContainsBox (raw19 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked19 : ∀ i : Fin 52, (fun i => (output19 (cover19 i)).ContainsBox (raw19 i)) i :=
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

noncomputable def phaseMass19 : ℝ := singlePhaseMass (169648215/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw19 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass19_eq : phaseMass19 = (33929643/327680000000 : ℝ) := by
  unfold phaseMass19
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw19 output19 cover19 source19
    (gridTreeUnionCheck_sound 32768 raw19 output19 cover19 source19 tree19 checked19)
    _ (by norm_num) _, areaUnits19]
  norm_num

-- Frozen phase 4999, atom 6559, type 1, source (22,67).
def leavesData20 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves20 : Fin 13 → DyadicLeaf := leavesData20.get
def raw20 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 22 67 leaves20 i
def outputData20 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨5632,5696,17152,17216⟩) (.node (.single ⟨5632,5696,17216,17280⟩) (.single ⟨5696,5760,17152,17216⟩))) (.node (.single ⟨5696,5760,17216,17280⟩) (.node (.single ⟨5632,5760,17280,17408⟩) (.single ⟨5760,5824,17152,17216⟩)))) (.node (.node (.single ⟨5760,5824,17216,17280⟩) (.node (.single ⟨5824,5856,17152,17184⟩) (.single ⟨5824,5856,17184,17216⟩))) (.node (.node (.single ⟨5856,5888,17152,17184⟩) (.single ⟨5856,5888,17184,17216⟩)) (.node (.single ⟨5824,5888,17216,17280⟩) (.single ⟨5760,5888,17280,17408⟩))))) (.node (.node (.node (.single ⟨15360,15488,26880,27008⟩) (.node (.single ⟨15360,15488,27008,27136⟩) (.single ⟨15488,15552,26880,26944⟩))) (.node (.single ⟨15488,15552,26944,27008⟩) (.node (.single ⟨15552,15584,26880,26912⟩) (.single ⟨15552,15584,26912,26944⟩)))) (.node (.node (.single ⟨15584,15616,26880,26912⟩) (.node (.single ⟨15584,15616,26912,26944⟩) (.single ⟨15552,15616,26944,27008⟩))) (.node (.node (.single ⟨15488,15552,27008,27072⟩) (.single ⟨15488,15552,27072,27136⟩)) (.node (.single ⟨15552,15616,27008,27072⟩) (.single ⟨15552,15616,27072,27136⟩)))))) (.node (.node (.node (.node (.single ⟨17152,17216,5632,5696⟩) (.node (.single ⟨17152,17216,5696,5760⟩) (.single ⟨17216,17280,5632,5696⟩))) (.node (.single ⟨17216,17280,5696,5760⟩) (.node (.single ⟨17152,17216,5760,5824⟩) (.single ⟨17152,17184,5824,5856⟩)))) (.node (.node (.single ⟨17152,17184,5856,5888⟩) (.node (.single ⟨17184,17216,5824,5856⟩) (.single ⟨17184,17216,5856,5888⟩))) (.node (.node (.single ⟨17216,17280,5760,5824⟩) (.single ⟨17216,17280,5824,5888⟩)) (.node (.single ⟨17280,17408,5632,5760⟩) (.single ⟨17280,17408,5760,5888⟩))))) (.node (.node (.node (.single ⟨26880,27008,15360,15488⟩) (.node (.single ⟨26880,26944,15488,15552⟩) (.single ⟨26880,26912,15552,15584⟩))) (.node (.single ⟨26880,26912,15584,15616⟩) (.node (.single ⟨26912,26944,15552,15584⟩) (.single ⟨26912,26944,15584,15616⟩)))) (.node (.node (.single ⟨26944,27008,15488,15552⟩) (.node (.single ⟨26944,27008,15552,15616⟩) (.single ⟨27008,27136,15360,15488⟩))) (.node (.node (.single ⟨27008,27072,15488,15552⟩) (.single ⟨27008,27072,15552,15616⟩)) (.node (.single ⟨27072,27136,15488,15552⟩) (.single ⟨27072,27136,15552,15616⟩)))))))
def output20 : Fin 52 → GridBox := outputData20.get
def coverData20 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData20 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover20 (i : Fin 52) : Fin 52 := ⟨coverData20.get i % 52, Nat.mod_lt _ (by decide)⟩
def source20 (i : Fin 52) : Fin 52 := ⟨sourceData20.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree20 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 (.cutX 5120 .empty (.cutY 17408 (.cutX 5632 .empty (.cutY 16896 .empty (.cutX 5888 (.cutY 17152 .empty (.cutX 5760 (.cutY 17280 (.cutX 5696 (.cutY 17216 .full .full) (.cutY 17216 .full .full)) .full) (.cutY 17280 (.cutX 5824 (.cutY 17216 .full .full) (.cutY 17216 (.cutX 5856 (.cutY 17184 .full .full) (.cutY 17184 .full .full)) .full)) .full))) .empty))) .empty)) .empty) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 .empty (.cutX 15360 .empty (.cutY 27648 (.cutX 15872 (.cutY 27136 (.cutX 15616 (.cutY 26880 .empty (.cutX 15488 (.cutY 27008 .full .full) (.cutY 27008 (.cutX 15552 (.cutY 26944 .full .full) (.cutY 26944 (.cutX 15584 (.cutY 26912 .full .full) (.cutY 26912 .full .full)) .full)) (.cutX 15552 (.cutY 27072 .full .full) (.cutY 27072 .full .full))))) .empty) .empty) .empty) .empty)))) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 (.cutX 17408 (.cutY 5120 .empty (.cutX 16896 .empty (.cutY 5632 .empty (.cutX 17152 .empty (.cutY 5888 (.cutX 17280 (.cutY 5760 (.cutX 17216 (.cutY 5696 .full .full) (.cutY 5696 .full .full)) (.cutX 17216 (.cutY 5824 .full (.cutX 17184 (.cutY 5856 .full .full) (.cutY 5856 .full .full))) (.cutY 5824 .full .full))) (.cutY 5760 .full .full)) .empty))))) .empty) .empty) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 .empty (.cutX 27648 (.cutY 15360 .empty (.cutX 27136 (.cutY 15872 (.cutX 26880 .empty (.cutY 15616 (.cutX 27008 (.cutY 15488 .full (.cutX 26944 (.cutY 15552 .full (.cutX 26912 (.cutY 15584 .full .full) (.cutY 15584 .full .full))) (.cutY 15552 .full .full))) (.cutY 15488 .full (.cutX 27072 (.cutY 15552 .full .full) (.cutY 15552 .full .full)))) .empty)) .empty) .empty)) .empty)))) .empty))) .empty))

theorem metadata20 : 0<135260814 ∧ 22<128 ∧ 67<128 ∧ 1<4 ∧
    6559/4160=1 ∧ 6559%4160=2399 ∧ ∀ i, (leaves20 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData20).mp
    (by decide +kernel)

theorem sourceChecked20_0 : ∀ i : Fin 52,
    (fun i => output20 i = raw20 (source20 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked20 : ∀ i : Fin 52, (fun i => output20 i = raw20 (source20 i)) i :=
  forallFin_of_zero_offset (fun i => output20 i = raw20 (source20 i)) sourceChecked20_0

theorem coverChecked20_0 : ∀ i : Fin 52,
    (fun i => (output20 (cover20 i)).ContainsBox (raw20 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked20 : ∀ i : Fin 52, (fun i => (output20 (cover20 i)).ContainsBox (raw20 i)) i :=
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

noncomputable def phaseMass20 : ℝ := singlePhaseMass (135260814/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw20 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass20_eq : phaseMass20 = (67630407/819200000000 : ℝ) := by
  unfold phaseMass20
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw20 output20 cover20 source20
    (gridTreeUnionCheck_sound 32768 raw20 output20 cover20 source20 tree20 checked20)
    _ (by norm_num) _, areaUnits20]
  norm_num

-- Frozen phase 5000, atom 7808, type 1, source (41,81).
def leavesData21 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves21 : Fin 10 → DyadicLeaf := leavesData21.get
def raw21 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 41 81 leaves21 i
def outputData21 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨10496,10624,20736,20864⟩) (.single ⟨10496,10624,20864,20992⟩)) (.node (.single ⟨10624,10688,20736,20800⟩) (.node (.single ⟨10624,10688,20800,20864⟩) (.single ⟨10688,10720,20736,20768⟩)))) (.node (.node (.single ⟨10688,10720,20768,20800⟩) (.single ⟨10720,10752,20736,20768⟩)) (.node (.single ⟨10720,10752,20768,20800⟩) (.node (.single ⟨10688,10752,20800,20864⟩) (.single ⟨10624,10752,20864,20992⟩))))) (.node (.node (.node (.single ⟨11776,11904,22016,22144⟩) (.single ⟨11776,11904,22144,22272⟩)) (.node (.single ⟨11904,11968,22016,22080⟩) (.node (.single ⟨11904,11968,22080,22144⟩) (.single ⟨11968,12000,22016,22048⟩)))) (.node (.node (.single ⟨11968,12000,22048,22080⟩) (.single ⟨12000,12032,22016,22048⟩)) (.node (.single ⟨12000,12032,22048,22080⟩) (.node (.single ⟨11968,12032,22080,22144⟩) (.single ⟨11904,12032,22144,22272⟩)))))) (.node (.node (.node (.node (.single ⟨20736,20864,10496,10624⟩) (.single ⟨20736,20800,10624,10688⟩)) (.node (.single ⟨20736,20768,10688,10720⟩) (.node (.single ⟨20736,20768,10720,10752⟩) (.single ⟨20768,20800,10688,10720⟩)))) (.node (.node (.single ⟨20768,20800,10720,10752⟩) (.single ⟨20800,20864,10624,10688⟩)) (.node (.single ⟨20800,20864,10688,10752⟩) (.node (.single ⟨20864,20992,10496,10624⟩) (.single ⟨20864,20992,10624,10752⟩))))) (.node (.node (.node (.single ⟨22016,22144,11776,11904⟩) (.single ⟨22016,22080,11904,11968⟩)) (.node (.single ⟨22016,22048,11968,12000⟩) (.node (.single ⟨22016,22048,12000,12032⟩) (.single ⟨22048,22080,11968,12000⟩)))) (.node (.node (.single ⟨22048,22080,12000,12032⟩) (.single ⟨22080,22144,11904,11968⟩)) (.node (.single ⟨22080,22144,11968,12032⟩) (.node (.single ⟨22144,22272,11776,11904⟩) (.single ⟨22144,22272,11904,12032⟩)))))))
def output21 : Fin 40 → GridBox := outputData21.get
def coverData21 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 28) (.single 38)) (.node (.single 11) (.node (.single 9) (.single 29))))) (.node (.node (.node (.single 30) (.single 10)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 26) (.node (.single 36) (.single 13)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 23) (.single 33)))) (.node (.node (.single 16) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))))
def sourceData21 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover21 (i : Fin 40) : Fin 40 := ⟨coverData21.get i % 40, Nat.mod_lt _ (by decide)⟩
def source21 (i : Fin 40) : Fin 40 := ⟨sourceData21.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree21 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 .empty (.cutY 22528 (.cutX 11264 (.cutY 21504 (.cutX 10752 (.cutY 20992 (.cutX 10496 .empty (.cutY 20736 .empty (.cutX 10624 (.cutY 20864 .full .full) (.cutY 20864 (.cutX 10688 (.cutY 20800 .full .full) (.cutY 20800 (.cutX 10720 (.cutY 20768 .full .full) (.cutY 20768 .full .full)) .full)) .full)))) .empty) .empty) .empty) (.cutY 21504 .empty (.cutX 11776 .empty (.cutY 22016 .empty (.cutX 12032 (.cutY 22272 (.cutX 11904 (.cutY 22144 .full .full) (.cutY 22144 (.cutX 11968 (.cutY 22080 .full .full) (.cutY 22080 (.cutX 12000 (.cutY 22048 .full .full) (.cutY 22048 .full .full)) .full)) .full)) .empty) .empty))))) .empty))) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 (.cutY 10240 .empty (.cutX 21504 (.cutY 11264 (.cutX 20992 (.cutY 10752 (.cutX 20736 .empty (.cutY 10496 .empty (.cutX 20864 (.cutY 10624 .full (.cutX 20800 (.cutY 10688 .full (.cutX 20768 (.cutY 10720 .full .full) (.cutY 10720 .full .full))) (.cutY 10688 .full .full))) (.cutY 10624 .full .full)))) .empty) .empty) .empty) (.cutY 11264 .empty (.cutX 22016 .empty (.cutY 11776 .empty (.cutX 22272 (.cutY 12032 (.cutX 22144 (.cutY 11904 .full (.cutX 22080 (.cutY 11968 .full (.cutX 22048 (.cutY 12000 .full .full) (.cutY 12000 .full .full))) (.cutY 11968 .full .full))) (.cutY 11904 .full .full)) .empty) .empty)))))) .empty) .empty))) .empty) .empty))

theorem metadata21 : 0<56923454 ∧ 41<128 ∧ 81<128 ∧ 1<4 ∧
    7808/4160=1 ∧ 7808%4160=3648 ∧ ∀ i, (leaves21 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData21).mp
    (by decide +kernel)

theorem sourceChecked21_0 : ∀ i : Fin 40,
    (fun i => output21 i = raw21 (source21 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked21 : ∀ i : Fin 40, (fun i => output21 i = raw21 (source21 i)) i :=
  forallFin_of_zero_offset (fun i => output21 i = raw21 (source21 i)) sourceChecked21_0

theorem coverChecked21_0 : ∀ i : Fin 40,
    (fun i => (output21 (cover21 i)).ContainsBox (raw21 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked21 : ∀ i : Fin 40, (fun i => (output21 (cover21 i)).ContainsBox (raw21 i)) i :=
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

noncomputable def phaseMass21 : ℝ := singlePhaseMass (56923454/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw21 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass21_eq : phaseMass21 = (28461727/819200000000 : ℝ) := by
  unfold phaseMass21
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw21 output21 cover21 source21
    (gridTreeUnionCheck_sound 32768 raw21 output21 cover21 source21 tree21 checked21)
    _ (by norm_num) _, areaUnits21]
  norm_num

-- Frozen phase 5001, atom 7241, type 1, source (31,74).
def leavesData22 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves22 : Fin 7 → DyadicLeaf := leavesData22.get
def raw22 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 31 74 leaves22 i
def outputData22 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨7936,8064,18944,19072⟩) (.node (.single ⟨7936,8064,19072,19200⟩) (.single ⟨8064,8128,18944,19008⟩))) (.node (.node (.single ⟨8064,8128,19008,19072⟩) (.single ⟨8128,8192,18944,19008⟩)) (.node (.single ⟨8128,8192,19008,19072⟩) (.single ⟨8064,8192,19072,19200⟩)))) (.node (.node (.single ⟨13568,13696,24576,24704⟩) (.node (.single ⟨13568,13696,24704,24832⟩) (.single ⟨13696,13760,24576,24640⟩))) (.node (.node (.single ⟨13696,13760,24640,24704⟩) (.single ⟨13760,13824,24576,24640⟩)) (.node (.single ⟨13760,13824,24640,24704⟩) (.single ⟨13696,13824,24704,24832⟩))))) (.node (.node (.node (.single ⟨18944,19072,7936,8064⟩) (.node (.single ⟨18944,19008,8064,8128⟩) (.single ⟨18944,19008,8128,8192⟩))) (.node (.node (.single ⟨19008,19072,8064,8128⟩) (.single ⟨19008,19072,8128,8192⟩)) (.node (.single ⟨19072,19200,7936,8064⟩) (.single ⟨19072,19200,8064,8192⟩)))) (.node (.node (.single ⟨24576,24704,13568,13696⟩) (.node (.single ⟨24576,24640,13696,13760⟩) (.single ⟨24576,24640,13760,13824⟩))) (.node (.node (.single ⟨24640,24704,13696,13760⟩) (.single ⟨24640,24704,13760,13824⟩)) (.node (.single ⟨24704,24832,13568,13696⟩) (.single ⟨24704,24832,13696,13824⟩))))))
def output22 : Fin 28 → GridBox := outputData22.get
def coverData22 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData22 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover22 (i : Fin 28) : Fin 28 := ⟨coverData22.get i % 28, Nat.mod_lt _ (by decide)⟩
def source22 (i : Fin 28) : Fin 28 := ⟨sourceData22.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree22 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 .empty (.cutX 7168 .empty (.cutY 19456 (.cutX 7680 .empty (.cutY 18944 .empty (.cutX 7936 .empty (.cutY 19200 (.cutX 8064 (.cutY 19072 .full .full) (.cutY 19072 (.cutX 8128 (.cutY 19008 .full .full) (.cutY 19008 .full .full)) .full)) .empty)))) .empty)))) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 (.cutX 13312 .empty (.cutY 25600 (.cutX 13824 (.cutY 25088 (.cutX 13568 .empty (.cutY 24832 (.cutX 13696 (.cutY 24704 .full .full) (.cutY 24704 (.cutX 13760 (.cutY 24640 .full .full) (.cutY 24640 .full .full)) .full)) .empty)) .empty) .empty) .empty)) .empty) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 .empty (.cutX 19456 (.cutY 7168 .empty (.cutX 18944 .empty (.cutY 7680 .empty (.cutX 19200 (.cutY 7936 .empty (.cutX 19072 (.cutY 8064 .full (.cutX 19008 (.cutY 8128 .full .full) (.cutY 8128 .full .full))) (.cutY 8064 .full .full))) .empty)))) .empty)))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 (.cutX 25600 (.cutY 13312 .empty (.cutX 25088 (.cutY 13824 (.cutX 24832 (.cutY 13568 .empty (.cutX 24704 (.cutY 13696 .full (.cutX 24640 (.cutY 13760 .full .full) (.cutY 13760 .full .full))) (.cutY 13696 .full .full))) .empty) .empty) .empty)) .empty) .empty) .empty)) .empty))) .empty))

theorem metadata22 : 0<140060506 ∧ 31<128 ∧ 74<128 ∧ 1<4 ∧
    7241/4160=1 ∧ 7241%4160=3081 ∧ ∀ i, (leaves22 i).Valid 8 := by
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

noncomputable def phaseMass22 : ℝ := singlePhaseMass (140060506/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw22 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass22_eq : phaseMass22 = (70030253/819200000000 : ℝ) := by
  unfold phaseMass22
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw22 output22 cover22 source22
    (gridTreeUnionCheck_sound 32768 raw22 output22 cover22 source22 tree22 checked22)
    _ (by norm_num) _, areaUnits22]
  norm_num

-- Frozen phase 5002, atom 3449, type 0, source (37,82).
def leavesData23 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves23 : Fin 4 → DyadicLeaf := leavesData23.get
def raw23 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 37 82 leaves23 i
def outputData23 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨9472,9600,20992,21120⟩) (.single ⟨9472,9600,21120,21248⟩)) (.node (.single ⟨9600,9728,20992,21120⟩) (.single ⟨9600,9728,21120,21248⟩))) (.node (.node (.single ⟨11520,11648,23040,23168⟩) (.single ⟨11520,11648,23168,23296⟩)) (.node (.single ⟨11648,11776,23040,23168⟩) (.single ⟨11648,11776,23168,23296⟩)))) (.node (.node (.node (.single ⟨20992,21120,9472,9600⟩) (.single ⟨20992,21120,9600,9728⟩)) (.node (.single ⟨21120,21248,9472,9600⟩) (.single ⟨21120,21248,9600,9728⟩))) (.node (.node (.single ⟨23040,23168,11520,11648⟩) (.single ⟨23040,23168,11648,11776⟩)) (.node (.single ⟨23168,23296,11520,11648⟩) (.single ⟨23168,23296,11648,11776⟩)))))
def output23 : Fin 16 → GridBox := outputData23.get
def coverData23 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData23 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover23 (i : Fin 16) : Fin 16 := ⟨coverData23.get i % 16, Nat.mod_lt _ (by decide)⟩
def source23 (i : Fin 16) : Fin 16 := ⟨sourceData23.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree23 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 (.cutX 9216 .empty (.cutY 21504 (.cutX 9728 (.cutY 20992 .empty (.cutX 9472 .empty (.cutY 21248 (.cutX 9600 (.cutY 21120 .full .full) (.cutY 21120 .full .full)) .empty))) .empty) .empty)) .empty) (.cutY 22528 .empty (.cutX 11264 .empty (.cutY 23552 (.cutX 11776 (.cutY 23040 .empty (.cutX 11520 .empty (.cutY 23296 (.cutX 11648 (.cutY 23168 .full .full) (.cutY 23168 .full .full)) .empty))) .empty) .empty))))) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 (.cutY 10240 (.cutX 21504 (.cutY 9216 .empty (.cutX 20992 .empty (.cutY 9728 (.cutX 21248 (.cutY 9472 .empty (.cutX 21120 (.cutY 9600 .full .full) (.cutY 9600 .full .full))) .empty) .empty))) .empty) .empty) (.cutY 10240 .empty (.cutX 23552 (.cutY 11264 .empty (.cutX 23040 .empty (.cutY 11776 (.cutX 23296 (.cutY 11520 .empty (.cutX 23168 (.cutY 11648 .full .full) (.cutY 11648 .full .full))) .empty) .empty))) .empty))) .empty))) .empty) .empty))

theorem metadata23 : 0<167980383 ∧ 37<128 ∧ 82<128 ∧ 0<4 ∧
    3449/4160=0 ∧ 3449%4160=3449 ∧ ∀ i, (leaves23 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData23).mp
    (by decide +kernel)

theorem sourceChecked23_0 : ∀ i : Fin 16,
    (fun i => output23 i = raw23 (source23 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked23 : ∀ i : Fin 16, (fun i => output23 i = raw23 (source23 i)) i :=
  forallFin_of_zero_offset (fun i => output23 i = raw23 (source23 i)) sourceChecked23_0

theorem coverChecked23_0 : ∀ i : Fin 16,
    (fun i => (output23 (cover23 i)).ContainsBox (raw23 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked23 : ∀ i : Fin 16, (fun i => (output23 (cover23 i)).ContainsBox (raw23 i)) i :=
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

noncomputable def phaseMass23 : ℝ := singlePhaseMass (167980383/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw23 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass23_eq : phaseMass23 = (167980383/1638400000000 : ℝ) := by
  unfold phaseMass23
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw23 output23 cover23 source23
    (gridTreeUnionCheck_sound 32768 raw23 output23 cover23 source23 tree23 checked23)
    _ (by norm_num) _, areaUnits23]
  norm_num

-- Frozen phase 5003, atom 6958, type 1, source (27,71).
def leavesData24 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves24 : Fin 10 → DyadicLeaf := leavesData24.get
def raw24 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 27 71 leaves24 i
def outputData24 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨6912,7040,18176,18304⟩) (.single ⟨6912,7040,18304,18432⟩)) (.node (.single ⟨7040,7104,18176,18240⟩) (.node (.single ⟨7040,7104,18240,18304⟩) (.single ⟨7104,7136,18176,18208⟩)))) (.node (.node (.single ⟨7104,7136,18208,18240⟩) (.single ⟨7136,7168,18176,18208⟩)) (.node (.single ⟨7136,7168,18208,18240⟩) (.node (.single ⟨7104,7168,18240,18304⟩) (.single ⟨7040,7168,18304,18432⟩))))) (.node (.node (.node (.single ⟨14336,14464,25600,25728⟩) (.single ⟨14336,14464,25728,25856⟩)) (.node (.single ⟨14464,14528,25600,25664⟩) (.node (.single ⟨14464,14528,25664,25728⟩) (.single ⟨14528,14560,25600,25632⟩)))) (.node (.node (.single ⟨14528,14560,25632,25664⟩) (.single ⟨14560,14592,25600,25632⟩)) (.node (.single ⟨14560,14592,25632,25664⟩) (.node (.single ⟨14528,14592,25664,25728⟩) (.single ⟨14464,14592,25728,25856⟩)))))) (.node (.node (.node (.node (.single ⟨18176,18304,6912,7040⟩) (.single ⟨18176,18240,7040,7104⟩)) (.node (.single ⟨18176,18208,7104,7136⟩) (.node (.single ⟨18176,18208,7136,7168⟩) (.single ⟨18208,18240,7104,7136⟩)))) (.node (.node (.single ⟨18208,18240,7136,7168⟩) (.single ⟨18240,18304,7040,7104⟩)) (.node (.single ⟨18240,18304,7104,7168⟩) (.node (.single ⟨18304,18432,6912,7040⟩) (.single ⟨18304,18432,7040,7168⟩))))) (.node (.node (.node (.single ⟨25600,25728,14336,14464⟩) (.single ⟨25600,25664,14464,14528⟩)) (.node (.single ⟨25600,25632,14528,14560⟩) (.node (.single ⟨25600,25632,14560,14592⟩) (.single ⟨25632,25664,14528,14560⟩)))) (.node (.node (.single ⟨25632,25664,14560,14592⟩) (.single ⟨25664,25728,14464,14528⟩)) (.node (.single ⟨25664,25728,14528,14592⟩) (.node (.single ⟨25728,25856,14336,14464⟩) (.single ⟨25728,25856,14464,14592⟩)))))))
def output24 : Fin 40 → GridBox := outputData24.get
def coverData24 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 28) (.single 38)) (.node (.single 11) (.node (.single 9) (.single 29))))) (.node (.node (.node (.single 30) (.single 10)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 26) (.node (.single 36) (.single 13)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 23) (.single 33)))) (.node (.node (.single 16) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))))
def sourceData24 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover24 (i : Fin 40) : Fin 40 := ⟨coverData24.get i % 40, Nat.mod_lt _ (by decide)⟩
def source24 (i : Fin 40) : Fin 40 := ⟨sourceData24.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree24 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 (.cutX 7168 (.cutY 17408 .empty (.cutX 6656 .empty (.cutY 17920 .empty (.cutX 6912 .empty (.cutY 18176 .empty (.cutX 7040 (.cutY 18304 .full .full) (.cutY 18304 (.cutX 7104 (.cutY 18240 .full .full) (.cutY 18240 (.cutX 7136 (.cutY 18208 .full .full) (.cutY 18208 .full .full)) .full)) .full))))))) .empty) .empty)) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 (.cutX 15360 (.cutY 25600 .empty (.cutX 14848 (.cutY 26112 (.cutX 14592 (.cutY 25856 (.cutX 14464 (.cutY 25728 .full .full) (.cutY 25728 (.cutX 14528 (.cutY 25664 .full .full) (.cutY 25664 (.cutX 14560 (.cutY 25632 .full .full) (.cutY 25632 .full .full)) .full)) .full)) .empty) .empty) .empty) .empty)) .empty) .empty)) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 .empty (.cutX 17408 .empty (.cutY 7168 (.cutX 17920 .empty (.cutY 6656 .empty (.cutX 18176 .empty (.cutY 6912 .empty (.cutX 18304 (.cutY 7040 .full (.cutX 18240 (.cutY 7104 .full (.cutX 18208 (.cutY 7136 .full .full) (.cutY 7136 .full .full))) (.cutY 7104 .full .full))) (.cutY 7040 .full .full)))))) .empty))) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 .empty (.cutX 25600 .empty (.cutY 15360 (.cutX 26112 (.cutY 14848 (.cutX 25856 (.cutY 14592 (.cutX 25728 (.cutY 14464 .full (.cutX 25664 (.cutY 14528 .full (.cutX 25632 (.cutY 14560 .full .full) (.cutY 14560 .full .full))) (.cutY 14528 .full .full))) (.cutY 14464 .full .full)) .empty) .empty) .empty) .empty) .empty))) .empty)) .empty))) .empty))

theorem metadata24 : 0<175587969 ∧ 27<128 ∧ 71<128 ∧ 1<4 ∧
    6958/4160=1 ∧ 6958%4160=2798 ∧ ∀ i, (leaves24 i).Valid 8 := by
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

noncomputable def phaseMass24 : ℝ := singlePhaseMass (175587969/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw24 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass24_eq : phaseMass24 = (175587969/1638400000000 : ℝ) := by
  unfold phaseMass24
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw24 output24 cover24 source24
    (gridTreeUnionCheck_sound 32768 raw24 output24 cover24 source24 tree24 checked24)
    _ (by norm_num) _, areaUnits24]
  norm_num

-- Frozen phase 5004, atom 7711, type 1, source (39,80).
def leavesData25 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves25 : Fin 13 → DyadicLeaf := leavesData25.get
def raw25 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 39 80 leaves25 i
def outputData25 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨9984,10048,20480,20544⟩) (.node (.single ⟨9984,10048,20544,20608⟩) (.single ⟨10048,10112,20480,20544⟩))) (.node (.single ⟨10048,10112,20544,20608⟩) (.node (.single ⟨9984,10112,20608,20736⟩) (.single ⟨10112,10176,20480,20544⟩)))) (.node (.node (.single ⟨10112,10176,20544,20608⟩) (.node (.single ⟨10176,10208,20480,20512⟩) (.single ⟨10176,10208,20512,20544⟩))) (.node (.node (.single ⟨10208,10240,20480,20512⟩) (.single ⟨10208,10240,20512,20544⟩)) (.node (.single ⟨10176,10240,20544,20608⟩) (.single ⟨10112,10240,20608,20736⟩))))) (.node (.node (.node (.single ⟨12032,12160,22528,22656⟩) (.node (.single ⟨12032,12160,22656,22784⟩) (.single ⟨12160,12224,22528,22592⟩))) (.node (.single ⟨12160,12224,22592,22656⟩) (.node (.single ⟨12224,12256,22528,22560⟩) (.single ⟨12224,12256,22560,22592⟩)))) (.node (.node (.single ⟨12256,12288,22528,22560⟩) (.node (.single ⟨12256,12288,22560,22592⟩) (.single ⟨12224,12288,22592,22656⟩))) (.node (.node (.single ⟨12160,12224,22656,22720⟩) (.single ⟨12160,12224,22720,22784⟩)) (.node (.single ⟨12224,12288,22656,22720⟩) (.single ⟨12224,12288,22720,22784⟩)))))) (.node (.node (.node (.node (.single ⟨20480,20544,9984,10048⟩) (.node (.single ⟨20480,20544,10048,10112⟩) (.single ⟨20544,20608,9984,10048⟩))) (.node (.single ⟨20544,20608,10048,10112⟩) (.node (.single ⟨20480,20544,10112,10176⟩) (.single ⟨20480,20512,10176,10208⟩)))) (.node (.node (.single ⟨20480,20512,10208,10240⟩) (.node (.single ⟨20512,20544,10176,10208⟩) (.single ⟨20512,20544,10208,10240⟩))) (.node (.node (.single ⟨20544,20608,10112,10176⟩) (.single ⟨20544,20608,10176,10240⟩)) (.node (.single ⟨20608,20736,9984,10112⟩) (.single ⟨20608,20736,10112,10240⟩))))) (.node (.node (.node (.single ⟨22528,22656,12032,12160⟩) (.node (.single ⟨22528,22592,12160,12224⟩) (.single ⟨22528,22560,12224,12256⟩))) (.node (.single ⟨22528,22560,12256,12288⟩) (.node (.single ⟨22560,22592,12224,12256⟩) (.single ⟨22560,22592,12256,12288⟩)))) (.node (.node (.single ⟨22592,22656,12160,12224⟩) (.node (.single ⟨22592,22656,12224,12288⟩) (.single ⟨22656,22784,12032,12160⟩))) (.node (.node (.single ⟨22656,22720,12160,12224⟩) (.single ⟨22656,22720,12224,12288⟩)) (.node (.single ⟨22720,22784,12160,12224⟩) (.single ⟨22720,22784,12224,12288⟩)))))))
def output25 : Fin 52 → GridBox := outputData25.get
def coverData25 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData25 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover25 (i : Fin 52) : Fin 52 := ⟨coverData25.get i % 52, Nat.mod_lt _ (by decide)⟩
def source25 (i : Fin 52) : Fin 52 := ⟨sourceData25.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree25 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 (.cutX 9216 .empty (.cutY 21504 (.cutX 9728 .empty (.cutY 20992 (.cutX 9984 .empty (.cutY 20736 (.cutX 10112 (.cutY 20608 (.cutX 10048 (.cutY 20544 .full .full) (.cutY 20544 .full .full)) .full) (.cutY 20608 (.cutX 10176 (.cutY 20544 .full .full) (.cutY 20544 (.cutX 10208 (.cutY 20512 .full .full) (.cutY 20512 .full .full)) .full)) .full)) .empty)) .empty)) .empty)) .empty) (.cutY 22528 .empty (.cutX 11264 .empty (.cutY 23552 (.cutX 11776 .empty (.cutY 23040 (.cutX 12032 .empty (.cutY 22784 (.cutX 12160 (.cutY 22656 .full .full) (.cutY 22656 (.cutX 12224 (.cutY 22592 .full .full) (.cutY 22592 (.cutX 12256 (.cutY 22560 .full .full) (.cutY 22560 .full .full)) .full)) (.cutX 12224 (.cutY 22720 .full .full) (.cutY 22720 .full .full)))) .empty)) .empty)) .empty))))) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 (.cutY 10240 (.cutX 21504 (.cutY 9216 .empty (.cutX 20992 (.cutY 9728 .empty (.cutX 20736 (.cutY 9984 .empty (.cutX 20608 (.cutY 10112 (.cutX 20544 (.cutY 10048 .full .full) (.cutY 10048 .full .full)) (.cutX 20544 (.cutY 10176 .full (.cutX 20512 (.cutY 10208 .full .full) (.cutY 10208 .full .full))) (.cutY 10176 .full .full))) (.cutY 10112 .full .full))) .empty)) .empty)) .empty) .empty) (.cutY 10240 .empty (.cutX 23552 (.cutY 11264 .empty (.cutX 23040 (.cutY 11776 .empty (.cutX 22784 (.cutY 12032 .empty (.cutX 22656 (.cutY 12160 .full (.cutX 22592 (.cutY 12224 .full (.cutX 22560 (.cutY 12256 .full .full) (.cutY 12256 .full .full))) (.cutY 12224 .full .full))) (.cutY 12160 .full (.cutX 22720 (.cutY 12224 .full .full) (.cutY 12224 .full .full))))) .empty)) .empty)) .empty))) .empty))) .empty) .empty))

theorem metadata25 : 0<156512574 ∧ 39<128 ∧ 80<128 ∧ 1<4 ∧
    7711/4160=1 ∧ 7711%4160=3551 ∧ ∀ i, (leaves25 i).Valid 8 := by
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

-- Frozen phase 5005, atom 7550, type 1, source (36,78).
def leavesData26 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves26 : Fin 7 → DyadicLeaf := leavesData26.get
def raw26 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 36 78 leaves26 i
def outputData26 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨9216,9344,19968,20096⟩) (.node (.single ⟨9216,9344,20096,20224⟩) (.single ⟨9344,9408,19968,20032⟩))) (.node (.node (.single ⟨9344,9408,20032,20096⟩) (.single ⟨9408,9472,19968,20032⟩)) (.node (.single ⟨9408,9472,20032,20096⟩) (.single ⟨9344,9472,20096,20224⟩)))) (.node (.node (.single ⟨12544,12672,23296,23424⟩) (.node (.single ⟨12544,12672,23424,23552⟩) (.single ⟨12672,12736,23296,23360⟩))) (.node (.node (.single ⟨12672,12736,23360,23424⟩) (.single ⟨12736,12800,23296,23360⟩)) (.node (.single ⟨12736,12800,23360,23424⟩) (.single ⟨12672,12800,23424,23552⟩))))) (.node (.node (.node (.single ⟨19968,20096,9216,9344⟩) (.node (.single ⟨19968,20032,9344,9408⟩) (.single ⟨19968,20032,9408,9472⟩))) (.node (.node (.single ⟨20032,20096,9344,9408⟩) (.single ⟨20032,20096,9408,9472⟩)) (.node (.single ⟨20096,20224,9216,9344⟩) (.single ⟨20096,20224,9344,9472⟩)))) (.node (.node (.single ⟨23296,23424,12544,12672⟩) (.node (.single ⟨23296,23360,12672,12736⟩) (.single ⟨23296,23360,12736,12800⟩))) (.node (.node (.single ⟨23360,23424,12672,12736⟩) (.single ⟨23360,23424,12736,12800⟩)) (.node (.single ⟨23424,23552,12544,12672⟩) (.single ⟨23424,23552,12672,12800⟩))))))
def output26 : Fin 28 → GridBox := outputData26.get
def coverData26 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData26 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover26 (i : Fin 28) : Fin 28 := ⟨coverData26.get i % 28, Nat.mod_lt _ (by decide)⟩
def source26 (i : Fin 28) : Fin 28 := ⟨sourceData26.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree26 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 (.cutY 18432 .empty (.cutX 9216 .empty (.cutY 19456 .empty (.cutX 9728 (.cutY 19968 .empty (.cutX 9472 (.cutY 20224 (.cutX 9344 (.cutY 20096 .full .full) (.cutY 20096 (.cutX 9408 (.cutY 20032 .full .full) (.cutY 20032 .full .full)) .full)) .empty) .empty)) .empty)))) .empty) .empty) (.cutY 20480 .empty (.cutX 14336 (.cutY 22528 .empty (.cutX 13312 (.cutY 23552 (.cutX 12800 (.cutY 23040 .empty (.cutX 12544 .empty (.cutY 23296 .empty (.cutX 12672 (.cutY 23424 .full .full) (.cutY 23424 (.cutX 12736 (.cutY 23360 .full .full) (.cutY 23360 .full .full)) .full))))) .empty) .empty) .empty)) .empty))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 .empty (.cutY 10240 (.cutX 19456 .empty (.cutY 9216 .empty (.cutX 19968 .empty (.cutY 9728 (.cutX 20224 (.cutY 9472 (.cutX 20096 (.cutY 9344 .full (.cutX 20032 (.cutY 9408 .full .full) (.cutY 9408 .full .full))) (.cutY 9344 .full .full)) .empty) .empty) .empty)))) .empty)) .empty) (.cutY 12288 .empty (.cutX 22528 .empty (.cutY 14336 (.cutX 23552 (.cutY 13312 (.cutX 23040 .empty (.cutY 12800 (.cutX 23296 .empty (.cutY 12544 .empty (.cutX 23424 (.cutY 12672 .full (.cutX 23360 (.cutY 12736 .full .full) (.cutY 12736 .full .full))) (.cutY 12672 .full .full)))) .empty)) .empty) .empty) .empty))))) .empty) .empty))

theorem metadata26 : 0<167101800 ∧ 36<128 ∧ 78<128 ∧ 1<4 ∧
    7550/4160=1 ∧ 7550%4160=3390 ∧ ∀ i, (leaves26 i).Valid 8 := by
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

noncomputable def phaseMass26 : ℝ := singlePhaseMass (167101800/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw26 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass26_eq : phaseMass26 = (835509/8192000000 : ℝ) := by
  unfold phaseMass26
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw26 output26 cover26 source26
    (gridTreeUnionCheck_sound 32768 raw26 output26 cover26 source26 tree26 checked26)
    _ (by norm_num) _, areaUnits26]
  norm_num

-- Frozen phase 5006, atom 1350, type 0, source (11,63).
def leavesData27 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves27 : Fin 4 → DyadicLeaf := leavesData27.get
def raw27 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 11 63 leaves27 i
def outputData27 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨2816,2944,16128,16256⟩) (.single ⟨2816,2944,16256,16384⟩)) (.node (.single ⟨2944,3072,16128,16256⟩) (.single ⟨2944,3072,16256,16384⟩))) (.node (.node (.single ⟨16128,16256,2816,2944⟩) (.single ⟨16128,16256,2944,3072⟩)) (.node (.single ⟨16256,16384,2816,2944⟩) (.single ⟨16256,16384,2944,3072⟩)))) (.node (.node (.node (.single ⟨16384,16512,29696,29824⟩) (.single ⟨16384,16512,29824,29952⟩)) (.node (.single ⟨16512,16640,29696,29824⟩) (.single ⟨16512,16640,29824,29952⟩))) (.node (.node (.single ⟨29696,29824,16384,16512⟩) (.single ⟨29696,29824,16512,16640⟩)) (.node (.single ⟨29824,29952,16384,16512⟩) (.single ⟨29824,29952,16512,16640⟩)))))
def output27 : Fin 16 → GridBox := outputData27.get
def coverData27 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData27 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover27 (i : Fin 16) : Fin 16 := ⟨coverData27.get i % 16, Nat.mod_lt _ (by decide)⟩
def source27 (i : Fin 16) : Fin 16 := ⟨sourceData27.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree27 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 .empty (.cutX 3072 (.cutY 15360 .empty (.cutX 2560 .empty (.cutY 15872 .empty (.cutX 2816 .empty (.cutY 16128 .empty (.cutX 2944 (.cutY 16256 .full .full) (.cutY 16256 .full .full))))))) .empty)))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 .empty (.cutX 15360 .empty (.cutY 3072 (.cutX 15872 .empty (.cutY 2560 .empty (.cutX 16128 .empty (.cutY 2816 .empty (.cutX 16256 (.cutY 2944 .full .full) (.cutY 2944 .full .full)))))) .empty)))) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 (.cutX 17408 (.cutY 29696 .empty (.cutX 16896 (.cutY 30208 (.cutX 16640 (.cutY 29952 (.cutX 16512 (.cutY 29824 .full .full) (.cutY 29824 .full .full)) .empty) .empty) .empty) .empty)) .empty) .empty) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 (.cutX 29696 .empty (.cutY 17408 (.cutX 30208 (.cutY 16896 (.cutX 29952 (.cutY 16640 (.cutX 29824 (.cutY 16512 .full .full) (.cutY 16512 .full .full)) .empty) .empty) .empty) .empty) .empty)) .empty) .empty) .empty)) .empty))))

theorem metadata27 : 0<116912559 ∧ 11<128 ∧ 63<128 ∧ 0<4 ∧
    1350/4160=0 ∧ 1350%4160=1350 ∧ ∀ i, (leaves27 i).Valid 8 := by
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

noncomputable def phaseMass27 : ℝ := singlePhaseMass (116912559/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw27 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass27_eq : phaseMass27 = (116912559/1638400000000 : ℝ) := by
  unfold phaseMass27
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw27 output27 cover27 source27
    (gridTreeUnionCheck_sound 32768 raw27 output27 cover27 source27 tree27 checked27)
    _ (by norm_num) _, areaUnits27]
  norm_num

-- Frozen phase 5007, atom 1559, type 0, source (13,64).
def leavesData28 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves28 : Fin 7 → DyadicLeaf := leavesData28.get
def raw28 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 13 64 leaves28 i
def outputData28 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3328,3456,16384,16512⟩) (.node (.single ⟨3328,3456,16512,16640⟩) (.single ⟨3456,3520,16384,16448⟩))) (.node (.node (.single ⟨3456,3520,16448,16512⟩) (.single ⟨3520,3584,16384,16448⟩)) (.node (.single ⟨3520,3584,16448,16512⟩) (.single ⟨3456,3584,16512,16640⟩)))) (.node (.node (.single ⟨16128,16256,29184,29312⟩) (.node (.single ⟨16128,16256,29312,29440⟩) (.single ⟨16256,16320,29184,29248⟩))) (.node (.node (.single ⟨16256,16320,29248,29312⟩) (.single ⟨16320,16384,29184,29248⟩)) (.node (.single ⟨16320,16384,29248,29312⟩) (.single ⟨16256,16384,29312,29440⟩))))) (.node (.node (.node (.single ⟨16384,16512,3328,3456⟩) (.node (.single ⟨16384,16448,3456,3520⟩) (.single ⟨16384,16448,3520,3584⟩))) (.node (.node (.single ⟨16448,16512,3456,3520⟩) (.single ⟨16448,16512,3520,3584⟩)) (.node (.single ⟨16512,16640,3328,3456⟩) (.single ⟨16512,16640,3456,3584⟩)))) (.node (.node (.single ⟨29184,29312,16128,16256⟩) (.node (.single ⟨29184,29248,16256,16320⟩) (.single ⟨29184,29248,16320,16384⟩))) (.node (.node (.single ⟨29248,29312,16256,16320⟩) (.single ⟨29248,29312,16320,16384⟩)) (.node (.single ⟨29312,29440,16128,16256⟩) (.single ⟨29312,29440,16256,16384⟩))))))
def output28 : Fin 28 → GridBox := outputData28.get
def coverData28 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData28 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover28 (i : Fin 28) : Fin 28 := ⟨coverData28.get i % 28, Nat.mod_lt _ (by decide)⟩
def source28 (i : Fin 28) : Fin 28 := ⟨sourceData28.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree28 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 (.cutX 3072 .empty (.cutY 17408 (.cutX 3584 (.cutY 16896 (.cutX 3328 .empty (.cutY 16640 (.cutX 3456 (.cutY 16512 .full .full) (.cutY 16512 (.cutX 3520 (.cutY 16448 .full .full) (.cutY 16448 .full .full)) .full)) .empty)) .empty) .empty) .empty)) .empty)) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 (.cutX 15360 .empty (.cutY 29696 (.cutX 15872 .empty (.cutY 29184 .empty (.cutX 16128 .empty (.cutY 29440 (.cutX 16256 (.cutY 29312 .full .full) (.cutY 29312 (.cutX 16320 (.cutY 29248 .full .full) (.cutY 29248 .full .full)) .full)) .empty)))) .empty)) .empty))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 .empty (.cutX 17408 (.cutY 3072 .empty (.cutX 16896 (.cutY 3584 (.cutX 16640 (.cutY 3328 .empty (.cutX 16512 (.cutY 3456 .full (.cutX 16448 (.cutY 3520 .full .full) (.cutY 3520 .full .full))) (.cutY 3456 .full .full))) .empty) .empty) .empty)) .empty)) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 .empty (.cutX 29696 (.cutY 15360 .empty (.cutX 29184 .empty (.cutY 15872 .empty (.cutX 29440 (.cutY 16128 .empty (.cutX 29312 (.cutY 16256 .full (.cutX 29248 (.cutY 16320 .full .full) (.cutY 16320 .full .full))) (.cutY 16256 .full .full))) .empty)))) .empty)) .empty))))) .empty))

theorem metadata28 : 0<67702166 ∧ 13<128 ∧ 64<128 ∧ 0<4 ∧
    1559/4160=0 ∧ 1559%4160=1559 ∧ ∀ i, (leaves28 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData28).mp
    (by decide +kernel)

theorem sourceChecked28_0 : ∀ i : Fin 28,
    (fun i => output28 i = raw28 (source28 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked28 : ∀ i : Fin 28, (fun i => output28 i = raw28 (source28 i)) i :=
  forallFin_of_zero_offset (fun i => output28 i = raw28 (source28 i)) sourceChecked28_0

theorem coverChecked28_0 : ∀ i : Fin 28,
    (fun i => (output28 (cover28 i)).ContainsBox (raw28 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked28 : ∀ i : Fin 28, (fun i => (output28 (cover28 i)).ContainsBox (raw28 i)) i :=
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

noncomputable def phaseMass28 : ℝ := singlePhaseMass (67702166/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw28 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass28_eq : phaseMass28 = (33851083/819200000000 : ℝ) := by
  unfold phaseMass28
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw28 output28 cover28 source28
    (gridTreeUnionCheck_sound 32768 raw28 output28 cover28 source28 tree28 checked28)
    _ (by norm_num) _, areaUnits28]
  norm_num

-- Frozen phase 5008, atom 6296, type 1, source (19,65).
def leavesData29 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves29 : Fin 13 → DyadicLeaf := leavesData29.get
def raw29 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 19 65 leaves29 i
def outputData29 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨4864,4928,16640,16704⟩) (.node (.single ⟨4864,4928,16704,16768⟩) (.single ⟨4928,4992,16640,16704⟩))) (.node (.single ⟨4928,4992,16704,16768⟩) (.node (.single ⟨4864,4992,16768,16896⟩) (.single ⟨4992,5056,16640,16704⟩)))) (.node (.node (.single ⟨4992,5056,16704,16768⟩) (.node (.single ⟨5056,5088,16640,16672⟩) (.single ⟨5056,5088,16672,16704⟩))) (.node (.node (.single ⟨5088,5120,16640,16672⟩) (.single ⟨5088,5120,16672,16704⟩)) (.node (.single ⟨5056,5120,16704,16768⟩) (.single ⟨4992,5120,16768,16896⟩))))) (.node (.node (.node (.single ⟨15872,16000,27648,27776⟩) (.node (.single ⟨15872,16000,27776,27904⟩) (.single ⟨16000,16064,27648,27712⟩))) (.node (.single ⟨16000,16064,27712,27776⟩) (.node (.single ⟨16064,16096,27648,27680⟩) (.single ⟨16064,16096,27680,27712⟩)))) (.node (.node (.single ⟨16096,16128,27648,27680⟩) (.node (.single ⟨16096,16128,27680,27712⟩) (.single ⟨16064,16128,27712,27776⟩))) (.node (.node (.single ⟨16000,16064,27776,27840⟩) (.single ⟨16000,16064,27840,27904⟩)) (.node (.single ⟨16064,16128,27776,27840⟩) (.single ⟨16064,16128,27840,27904⟩)))))) (.node (.node (.node (.node (.single ⟨16640,16704,4864,4928⟩) (.node (.single ⟨16640,16704,4928,4992⟩) (.single ⟨16704,16768,4864,4928⟩))) (.node (.single ⟨16704,16768,4928,4992⟩) (.node (.single ⟨16640,16704,4992,5056⟩) (.single ⟨16640,16672,5056,5088⟩)))) (.node (.node (.single ⟨16640,16672,5088,5120⟩) (.node (.single ⟨16672,16704,5056,5088⟩) (.single ⟨16672,16704,5088,5120⟩))) (.node (.node (.single ⟨16704,16768,4992,5056⟩) (.single ⟨16704,16768,5056,5120⟩)) (.node (.single ⟨16768,16896,4864,4992⟩) (.single ⟨16768,16896,4992,5120⟩))))) (.node (.node (.node (.single ⟨27648,27776,15872,16000⟩) (.node (.single ⟨27648,27712,16000,16064⟩) (.single ⟨27648,27680,16064,16096⟩))) (.node (.single ⟨27648,27680,16096,16128⟩) (.node (.single ⟨27680,27712,16064,16096⟩) (.single ⟨27680,27712,16096,16128⟩)))) (.node (.node (.single ⟨27712,27776,16000,16064⟩) (.node (.single ⟨27712,27776,16064,16128⟩) (.single ⟨27776,27904,15872,16000⟩))) (.node (.node (.single ⟨27776,27840,16000,16064⟩) (.single ⟨27776,27840,16064,16128⟩)) (.node (.single ⟨27840,27904,16000,16064⟩) (.single ⟨27840,27904,16064,16128⟩)))))))
def output29 : Fin 52 → GridBox := outputData29.get
def coverData29 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData29 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover29 (i : Fin 52) : Fin 52 := ⟨coverData29.get i % 52, Nat.mod_lt _ (by decide)⟩
def source29 (i : Fin 52) : Fin 52 := ⟨sourceData29.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree29 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 (.cutX 5120 (.cutY 17408 (.cutX 4608 .empty (.cutY 16896 (.cutX 4864 .empty (.cutY 16640 .empty (.cutX 4992 (.cutY 16768 (.cutX 4928 (.cutY 16704 .full .full) (.cutY 16704 .full .full)) .full) (.cutY 16768 (.cutX 5056 (.cutY 16704 .full .full) (.cutY 16704 (.cutX 5088 (.cutY 16672 .full .full) (.cutY 16672 .full .full)) .full)) .full)))) .empty)) .empty) .empty) .empty) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 .empty (.cutX 15360 .empty (.cutY 27648 .empty (.cutX 15872 .empty (.cutY 28160 (.cutX 16128 (.cutY 27904 (.cutX 16000 (.cutY 27776 .full .full) (.cutY 27776 (.cutX 16064 (.cutY 27712 .full .full) (.cutY 27712 (.cutX 16096 (.cutY 27680 .full .full) (.cutY 27680 .full .full)) .full)) (.cutX 16064 (.cutY 27840 .full .full) (.cutY 27840 .full .full)))) .empty) .empty) .empty)))))) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 (.cutX 17408 (.cutY 5120 (.cutX 16896 (.cutY 4608 .empty (.cutX 16640 .empty (.cutY 4864 .empty (.cutX 16768 (.cutY 4992 (.cutX 16704 (.cutY 4928 .full .full) (.cutY 4928 .full .full)) (.cutX 16704 (.cutY 5056 .full (.cutX 16672 (.cutY 5088 .full .full) (.cutY 5088 .full .full))) (.cutY 5056 .full .full))) (.cutY 4992 .full .full))))) .empty) .empty) .empty) .empty) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 .empty (.cutX 27648 .empty (.cutY 15360 .empty (.cutX 28160 (.cutY 15872 .empty (.cutX 27904 (.cutY 16128 (.cutX 27776 (.cutY 16000 .full (.cutX 27712 (.cutY 16064 .full (.cutX 27680 (.cutY 16096 .full .full) (.cutY 16096 .full .full))) (.cutY 16064 .full .full))) (.cutY 16000 .full (.cutX 27840 (.cutY 16064 .full .full) (.cutY 16064 .full .full)))) .empty) .empty)) .empty)))))) .empty))) .empty))

theorem metadata29 : 0<135260814 ∧ 19<128 ∧ 65<128 ∧ 1<4 ∧
    6296/4160=1 ∧ 6296%4160=2136 ∧ ∀ i, (leaves29 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData29).mp
    (by decide +kernel)

theorem sourceChecked29_0 : ∀ i : Fin 52,
    (fun i => output29 i = raw29 (source29 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked29 : ∀ i : Fin 52, (fun i => output29 i = raw29 (source29 i)) i :=
  forallFin_of_zero_offset (fun i => output29 i = raw29 (source29 i)) sourceChecked29_0

theorem coverChecked29_0 : ∀ i : Fin 52,
    (fun i => (output29 (cover29 i)).ContainsBox (raw29 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked29 : ∀ i : Fin 52, (fun i => (output29 (cover29 i)).ContainsBox (raw29 i)) i :=
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

noncomputable def phaseMass29 : ℝ := singlePhaseMass (135260814/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw29 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass29_eq : phaseMass29 = (67630407/819200000000 : ℝ) := by
  unfold phaseMass29
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw29 output29 cover29 source29
    (gridTreeUnionCheck_sound 32768 raw29 output29 cover29 source29 tree29 checked29)
    _ (by norm_num) _, areaUnits29]
  norm_num

-- Frozen phase 5009, atom 6015, type 1, source (16,63).
def leavesData30 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves30 : Fin 13 → DyadicLeaf := leavesData30.get
def raw30 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 16 63 leaves30 i
def outputData30 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨4096,4160,16128,16192⟩) (.node (.single ⟨4096,4160,16192,16256⟩) (.single ⟨4160,4224,16128,16192⟩))) (.node (.single ⟨4160,4224,16192,16256⟩) (.node (.single ⟨4096,4224,16256,16384⟩) (.single ⟨4224,4288,16128,16192⟩)))) (.node (.node (.single ⟨4224,4288,16192,16256⟩) (.node (.single ⟨4288,4320,16128,16160⟩) (.single ⟨4288,4320,16160,16192⟩))) (.node (.node (.single ⟨4320,4352,16128,16160⟩) (.single ⟨4320,4352,16160,16192⟩)) (.node (.single ⟨4288,4352,16192,16256⟩) (.single ⟨4224,4352,16256,16384⟩))))) (.node (.node (.node (.single ⟨16128,16192,4096,4160⟩) (.node (.single ⟨16128,16192,4160,4224⟩) (.single ⟨16192,16256,4096,4160⟩))) (.node (.single ⟨16192,16256,4160,4224⟩) (.node (.single ⟨16128,16192,4224,4288⟩) (.single ⟨16128,16160,4288,4320⟩)))) (.node (.node (.single ⟨16128,16160,4320,4352⟩) (.node (.single ⟨16160,16192,4288,4320⟩) (.single ⟨16160,16192,4320,4352⟩))) (.node (.node (.single ⟨16192,16256,4224,4288⟩) (.single ⟨16192,16256,4288,4352⟩)) (.node (.single ⟨16256,16384,4096,4224⟩) (.single ⟨16256,16384,4224,4352⟩)))))) (.node (.node (.node (.node (.single ⟨16384,16512,28416,28544⟩) (.node (.single ⟨16384,16512,28544,28672⟩) (.single ⟨16512,16576,28416,28480⟩))) (.node (.single ⟨16512,16576,28480,28544⟩) (.node (.single ⟨16576,16608,28416,28448⟩) (.single ⟨16576,16608,28448,28480⟩)))) (.node (.node (.single ⟨16608,16640,28416,28448⟩) (.node (.single ⟨16608,16640,28448,28480⟩) (.single ⟨16576,16640,28480,28544⟩))) (.node (.node (.single ⟨16512,16576,28544,28608⟩) (.single ⟨16512,16576,28608,28672⟩)) (.node (.single ⟨16576,16640,28544,28608⟩) (.single ⟨16576,16640,28608,28672⟩))))) (.node (.node (.node (.single ⟨28416,28544,16384,16512⟩) (.node (.single ⟨28416,28480,16512,16576⟩) (.single ⟨28416,28448,16576,16608⟩))) (.node (.single ⟨28416,28448,16608,16640⟩) (.node (.single ⟨28448,28480,16576,16608⟩) (.single ⟨28448,28480,16608,16640⟩)))) (.node (.node (.single ⟨28480,28544,16512,16576⟩) (.node (.single ⟨28480,28544,16576,16640⟩) (.single ⟨28544,28672,16384,16512⟩))) (.node (.node (.single ⟨28544,28608,16512,16576⟩) (.single ⟨28544,28608,16576,16640⟩)) (.node (.single ⟨28608,28672,16512,16576⟩) (.single ⟨28608,28672,16576,16640⟩)))))))
def output30 : Fin 52 → GridBox := outputData30.get
def coverData30 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 24) (.single 47))) (.node (.single 27) (.node (.single 12) (.single 25)))) (.node (.node (.single 39) (.node (.single 26) (.single 5))) (.node (.node (.single 17) (.single 46)) (.node (.single 34) (.single 6))))) (.node (.node (.node (.single 22) (.node (.single 45) (.single 29))) (.node (.single 11) (.node (.single 23) (.single 40)))) (.node (.node (.single 28) (.node (.single 0) (.single 13))) (.node (.node (.single 51) (.single 38)) (.node (.single 1) (.single 15)))))) (.node (.node (.node (.node (.single 50) (.node (.single 36) (.single 2))) (.node (.single 14) (.node (.single 49) (.single 37)))) (.node (.node (.single 3) (.node (.single 16) (.single 48))) (.node (.node (.single 35) (.single 7)) (.node (.single 18) (.single 44))))) (.node (.node (.node (.single 33) (.node (.single 8) (.single 20))) (.node (.single 43) (.node (.single 31) (.single 9)))) (.node (.node (.single 19) (.node (.single 42) (.single 32))) (.node (.node (.single 10) (.single 21)) (.node (.single 41) (.single 30)))))))
def sourceData30 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover30 (i : Fin 52) : Fin 52 := ⟨coverData30.get i % 52, Nat.mod_lt _ (by decide)⟩
def source30 (i : Fin 52) : Fin 52 := ⟨sourceData30.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree30 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 (.cutY 14336 .empty (.cutX 5120 (.cutY 15360 .empty (.cutX 4608 (.cutY 15872 .empty (.cutX 4352 (.cutY 16128 .empty (.cutX 4224 (.cutY 16256 (.cutX 4160 (.cutY 16192 .full .full) (.cutY 16192 .full .full)) .full) (.cutY 16256 (.cutX 4288 (.cutY 16192 .full .full) (.cutY 16192 (.cutX 4320 (.cutY 16160 .full .full) (.cutY 16160 .full .full)) .full)) .full))) .empty)) .empty)) .empty)) .empty)))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 .empty (.cutY 6144 (.cutX 15360 .empty (.cutY 5120 (.cutX 15872 .empty (.cutY 4608 (.cutX 16128 .empty (.cutY 4352 (.cutX 16256 (.cutY 4224 (.cutX 16192 (.cutY 4160 .full .full) (.cutY 4160 .full .full)) (.cutX 16192 (.cutY 4288 .full (.cutX 16160 (.cutY 4320 .full .full) (.cutY 4320 .full .full))) (.cutY 4288 .full .full))) (.cutY 4224 .full .full)) .empty)) .empty)) .empty)) .empty)))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 (.cutY 26624 .empty (.cutX 17408 (.cutY 27648 .empty (.cutX 16896 (.cutY 28160 .empty (.cutX 16640 (.cutY 28416 .empty (.cutX 16512 (.cutY 28544 .full .full) (.cutY 28544 (.cutX 16576 (.cutY 28480 .full .full) (.cutY 28480 (.cutX 16608 (.cutY 28448 .full .full) (.cutY 28448 .full .full)) .full)) (.cutX 16576 (.cutY 28608 .full .full) (.cutY 28608 .full .full))))) .empty)) .empty)) .empty)) .empty) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 .empty (.cutY 18432 (.cutX 27648 .empty (.cutY 17408 (.cutX 28160 .empty (.cutY 16896 (.cutX 28416 .empty (.cutY 16640 (.cutX 28544 (.cutY 16512 .full (.cutX 28480 (.cutY 16576 .full (.cutX 28448 (.cutY 16608 .full .full) (.cutY 16608 .full .full))) (.cutY 16576 .full .full))) (.cutY 16512 .full (.cutX 28608 (.cutY 16576 .full .full) (.cutY 16576 .full .full)))) .empty)) .empty)) .empty)) .empty)) .empty) .empty) .empty))))

theorem metadata30 : 0<166308920 ∧ 16<128 ∧ 63<128 ∧ 1<4 ∧
    6015/4160=1 ∧ 6015%4160=1855 ∧ ∀ i, (leaves30 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData30).mp
    (by decide +kernel)

theorem sourceChecked30_0 : ∀ i : Fin 52,
    (fun i => output30 i = raw30 (source30 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked30 : ∀ i : Fin 52, (fun i => output30 i = raw30 (source30 i)) i :=
  forallFin_of_zero_offset (fun i => output30 i = raw30 (source30 i)) sourceChecked30_0

theorem coverChecked30_0 : ∀ i : Fin 52,
    (fun i => (output30 (cover30 i)).ContainsBox (raw30 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked30 : ∀ i : Fin 52, (fun i => (output30 (cover30 i)).ContainsBox (raw30 i)) i :=
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

noncomputable def phaseMass30 : ℝ := singlePhaseMass (166308920/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw30 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass30_eq : phaseMass30 = (4157723/40960000000 : ℝ) := by
  unfold phaseMass30
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw30 output30 cover30 source30
    (gridTreeUnionCheck_sound 32768 raw30 output30 cover30 source30 tree30 checked30)
    _ (by norm_num) _, areaUnits30]
  norm_num

-- Frozen phase 5010, atom 2568, type 0, source (24,72).
def leavesData31 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves31 : Fin 7 → DyadicLeaf := leavesData31.get
def raw31 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 24 72 leaves31 i
def outputData31 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨6144,6272,18432,18560⟩) (.node (.single ⟨6144,6272,18560,18688⟩) (.single ⟨6272,6336,18432,18496⟩))) (.node (.node (.single ⟨6272,6336,18496,18560⟩) (.single ⟨6336,6400,18432,18496⟩)) (.node (.single ⟨6336,6400,18496,18560⟩) (.single ⟨6272,6400,18560,18688⟩)))) (.node (.node (.single ⟨14080,14208,26368,26496⟩) (.node (.single ⟨14080,14208,26496,26624⟩) (.single ⟨14208,14272,26368,26432⟩))) (.node (.node (.single ⟨14208,14272,26432,26496⟩) (.single ⟨14272,14336,26368,26432⟩)) (.node (.single ⟨14272,14336,26432,26496⟩) (.single ⟨14208,14336,26496,26624⟩))))) (.node (.node (.node (.single ⟨18432,18560,6144,6272⟩) (.node (.single ⟨18432,18496,6272,6336⟩) (.single ⟨18432,18496,6336,6400⟩))) (.node (.node (.single ⟨18496,18560,6272,6336⟩) (.single ⟨18496,18560,6336,6400⟩)) (.node (.single ⟨18560,18688,6144,6272⟩) (.single ⟨18560,18688,6272,6400⟩)))) (.node (.node (.single ⟨26368,26496,14080,14208⟩) (.node (.single ⟨26368,26432,14208,14272⟩) (.single ⟨26368,26432,14272,14336⟩))) (.node (.node (.single ⟨26432,26496,14208,14272⟩) (.single ⟨26432,26496,14272,14336⟩)) (.node (.single ⟨26496,26624,14080,14208⟩) (.single ⟨26496,26624,14208,14336⟩))))))
def output31 : Fin 28 → GridBox := outputData31.get
def coverData31 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData31 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover31 (i : Fin 28) : Fin 28 := ⟨coverData31.get i % 28, Nat.mod_lt _ (by decide)⟩
def source31 (i : Fin 28) : Fin 28 := ⟨sourceData31.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree31 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 .empty (.cutX 7168 (.cutY 19456 (.cutX 6656 (.cutY 18944 (.cutX 6400 (.cutY 18688 (.cutX 6272 (.cutY 18560 .full .full) (.cutY 18560 (.cutX 6336 (.cutY 18496 .full .full) (.cutY 18496 .full .full)) .full)) .empty) .empty) .empty) .empty) .empty) .empty))) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 (.cutX 13312 .empty (.cutY 25600 .empty (.cutX 13824 .empty (.cutY 26112 .empty (.cutX 14080 .empty (.cutY 26368 .empty (.cutX 14208 (.cutY 26496 .full .full) (.cutY 26496 (.cutX 14272 (.cutY 26432 .full .full) (.cutY 26432 .full .full)) .full)))))))) .empty) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 .empty (.cutX 19456 (.cutY 7168 (.cutX 18944 (.cutY 6656 (.cutX 18688 (.cutY 6400 (.cutX 18560 (.cutY 6272 .full (.cutX 18496 (.cutY 6336 .full .full) (.cutY 6336 .full .full))) (.cutY 6272 .full .full)) .empty) .empty) .empty) .empty) .empty) .empty)))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 (.cutX 25600 .empty (.cutY 13312 .empty (.cutX 26112 .empty (.cutY 13824 .empty (.cutX 26368 .empty (.cutY 14080 .empty (.cutX 26496 (.cutY 14208 .full (.cutX 26432 (.cutY 14272 .full .full) (.cutY 14272 .full .full))) (.cutY 14208 .full .full)))))))) .empty) .empty)) .empty))) .empty))

theorem metadata31 : 0<177866497 ∧ 24<128 ∧ 72<128 ∧ 0<4 ∧
    2568/4160=0 ∧ 2568%4160=2568 ∧ ∀ i, (leaves31 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData31).mp
    (by decide +kernel)

theorem sourceChecked31_0 : ∀ i : Fin 28,
    (fun i => output31 i = raw31 (source31 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked31 : ∀ i : Fin 28, (fun i => output31 i = raw31 (source31 i)) i :=
  forallFin_of_zero_offset (fun i => output31 i = raw31 (source31 i)) sourceChecked31_0

theorem coverChecked31_0 : ∀ i : Fin 28,
    (fun i => (output31 (cover31 i)).ContainsBox (raw31 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked31 : ∀ i : Fin 28, (fun i => (output31 (cover31 i)).ContainsBox (raw31 i)) i :=
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

noncomputable def phaseMass31 : ℝ := singlePhaseMass (177866497/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw31 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass31_eq : phaseMass31 = (177866497/1638400000000 : ℝ) := by
  unfold phaseMass31
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw31 output31 cover31 source31
    (gridTreeUnionCheck_sound 32768 raw31 output31 cover31 source31 tree31 checked31)
    _ (by norm_num) _, areaUnits31]
  norm_num

-- Frozen phase 5011, atom 2875, type 0, source (28,75).
def leavesData32 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves32 : Fin 7 → DyadicLeaf := leavesData32.get
def raw32 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 28 75 leaves32 i
def outputData32 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨7168,7296,19200,19328⟩) (.node (.single ⟨7168,7296,19328,19456⟩) (.single ⟨7296,7360,19200,19264⟩))) (.node (.node (.single ⟨7296,7360,19264,19328⟩) (.single ⟨7360,7424,19200,19264⟩)) (.node (.single ⟨7360,7424,19264,19328⟩) (.single ⟨7296,7424,19328,19456⟩)))) (.node (.node (.single ⟨13312,13440,25344,25472⟩) (.node (.single ⟨13312,13440,25472,25600⟩) (.single ⟨13440,13504,25344,25408⟩))) (.node (.node (.single ⟨13440,13504,25408,25472⟩) (.single ⟨13504,13568,25344,25408⟩)) (.node (.single ⟨13504,13568,25408,25472⟩) (.single ⟨13440,13568,25472,25600⟩))))) (.node (.node (.node (.single ⟨19200,19328,7168,7296⟩) (.node (.single ⟨19200,19264,7296,7360⟩) (.single ⟨19200,19264,7360,7424⟩))) (.node (.node (.single ⟨19264,19328,7296,7360⟩) (.single ⟨19264,19328,7360,7424⟩)) (.node (.single ⟨19328,19456,7168,7296⟩) (.single ⟨19328,19456,7296,7424⟩)))) (.node (.node (.single ⟨25344,25472,13312,13440⟩) (.node (.single ⟨25344,25408,13440,13504⟩) (.single ⟨25344,25408,13504,13568⟩))) (.node (.node (.single ⟨25408,25472,13440,13504⟩) (.single ⟨25408,25472,13504,13568⟩)) (.node (.single ⟨25472,25600,13312,13440⟩) (.single ⟨25472,25600,13440,13568⟩))))))
def output32 : Fin 28 → GridBox := outputData32.get
def coverData32 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData32 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover32 (i : Fin 28) : Fin 28 := ⟨coverData32.get i % 28, Nat.mod_lt _ (by decide)⟩
def source32 (i : Fin 28) : Fin 28 := ⟨sourceData32.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree32 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 .empty (.cutX 7168 .empty (.cutY 19456 (.cutX 7680 (.cutY 18944 .empty (.cutX 7424 (.cutY 19200 .empty (.cutX 7296 (.cutY 19328 .full .full) (.cutY 19328 (.cutX 7360 (.cutY 19264 .full .full) (.cutY 19264 .full .full)) .full))) .empty)) .empty) .empty)))) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 (.cutX 13312 .empty (.cutY 25600 (.cutX 13824 (.cutY 25088 .empty (.cutX 13568 (.cutY 25344 .empty (.cutX 13440 (.cutY 25472 .full .full) (.cutY 25472 (.cutX 13504 (.cutY 25408 .full .full) (.cutY 25408 .full .full)) .full))) .empty)) .empty) .empty)) .empty) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 .empty (.cutX 19456 (.cutY 7168 .empty (.cutX 18944 .empty (.cutY 7680 (.cutX 19200 .empty (.cutY 7424 (.cutX 19328 (.cutY 7296 .full (.cutX 19264 (.cutY 7360 .full .full) (.cutY 7360 .full .full))) (.cutY 7296 .full .full)) .empty)) .empty))) .empty)))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 (.cutX 25600 (.cutY 13312 .empty (.cutX 25088 .empty (.cutY 13824 (.cutX 25344 .empty (.cutY 13568 (.cutX 25472 (.cutY 13440 .full (.cutX 25408 (.cutY 13504 .full .full) (.cutY 13504 .full .full))) (.cutY 13440 .full .full)) .empty)) .empty))) .empty) .empty) .empty)) .empty))) .empty))

theorem metadata32 : 0<177866497 ∧ 28<128 ∧ 75<128 ∧ 0<4 ∧
    2875/4160=0 ∧ 2875%4160=2875 ∧ ∀ i, (leaves32 i).Valid 8 := by
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

noncomputable def phaseMass32 : ℝ := singlePhaseMass (177866497/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw32 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass32_eq : phaseMass32 = (177866497/1638400000000 : ℝ) := by
  unfold phaseMass32
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw32 output32 cover32 source32
    (gridTreeUnionCheck_sound 32768 raw32 output32 cover32 source32 tree32 checked32)
    _ (by norm_num) _, areaUnits32]
  norm_num

-- Frozen phase 5012, atom 3150, type 0, source (32,78).
def leavesData33 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves33 : Fin 4 → DyadicLeaf := leavesData33.get
def raw33 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 32 78 leaves33 i
def outputData33 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨8192,8320,19968,20096⟩) (.single ⟨8192,8320,20096,20224⟩)) (.node (.single ⟨8320,8448,19968,20096⟩) (.single ⟨8320,8448,20096,20224⟩))) (.node (.node (.single ⟨12544,12672,24320,24448⟩) (.single ⟨12544,12672,24448,24576⟩)) (.node (.single ⟨12672,12800,24320,24448⟩) (.single ⟨12672,12800,24448,24576⟩)))) (.node (.node (.node (.single ⟨19968,20096,8192,8320⟩) (.single ⟨19968,20096,8320,8448⟩)) (.node (.single ⟨20096,20224,8192,8320⟩) (.single ⟨20096,20224,8320,8448⟩))) (.node (.node (.single ⟨24320,24448,12544,12672⟩) (.single ⟨24320,24448,12672,12800⟩)) (.node (.single ⟨24448,24576,12544,12672⟩) (.single ⟨24448,24576,12672,12800⟩)))))
def output33 : Fin 16 → GridBox := outputData33.get
def coverData33 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData33 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover33 (i : Fin 16) : Fin 16 := ⟨coverData33.get i % 16, Nat.mod_lt _ (by decide)⟩
def source33 (i : Fin 16) : Fin 16 := ⟨sourceData33.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree33 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 (.cutY 18432 .empty (.cutX 9216 (.cutY 19456 .empty (.cutX 8704 (.cutY 19968 .empty (.cutX 8448 (.cutY 20224 (.cutX 8320 (.cutY 20096 .full .full) (.cutY 20096 .full .full)) .empty) .empty)) .empty)) .empty)) .empty) .empty) (.cutY 20480 .empty (.cutX 14336 (.cutY 22528 .empty (.cutX 13312 (.cutY 23552 .empty (.cutX 12800 (.cutY 24064 .empty (.cutX 12544 .empty (.cutY 24320 .empty (.cutX 12672 (.cutY 24448 .full .full) (.cutY 24448 .full .full))))) .empty)) .empty)) .empty))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 .empty (.cutY 10240 (.cutX 19456 .empty (.cutY 9216 (.cutX 19968 .empty (.cutY 8704 (.cutX 20224 (.cutY 8448 (.cutX 20096 (.cutY 8320 .full .full) (.cutY 8320 .full .full)) .empty) .empty) .empty)) .empty)) .empty)) .empty) (.cutY 12288 .empty (.cutX 22528 .empty (.cutY 14336 (.cutX 23552 .empty (.cutY 13312 (.cutX 24064 .empty (.cutY 12800 (.cutX 24320 .empty (.cutY 12544 .empty (.cutX 24448 (.cutY 12672 .full .full) (.cutY 12672 .full .full)))) .empty)) .empty)) .empty))))) .empty) .empty))

theorem metadata33 : 0<109574533 ∧ 32<128 ∧ 78<128 ∧ 0<4 ∧
    3150/4160=0 ∧ 3150%4160=3150 ∧ ∀ i, (leaves33 i).Valid 8 := by
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

noncomputable def phaseMass33 : ℝ := singlePhaseMass (109574533/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw33 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass33_eq : phaseMass33 = (109574533/1638400000000 : ℝ) := by
  unfold phaseMass33
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw33 output33 cover33 source33
    (gridTreeUnionCheck_sound 32768 raw33 output33 cover33 source33 tree33 checked33)
    _ (by norm_num) _, areaUnits33]
  norm_num

-- Frozen phase 5013, atom 2317, type 0, source (21,70).
def leavesData34 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves34 : Fin 7 → DyadicLeaf := leavesData34.get
def raw34 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 21 70 leaves34 i
def outputData34 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨5376,5504,17920,18048⟩) (.node (.single ⟨5376,5504,18048,18176⟩) (.single ⟨5504,5568,17920,17984⟩))) (.node (.node (.single ⟨5504,5568,17984,18048⟩) (.single ⟨5568,5632,17920,17984⟩)) (.node (.single ⟨5568,5632,17984,18048⟩) (.single ⟨5504,5632,18048,18176⟩)))) (.node (.node (.single ⟨14592,14720,27136,27264⟩) (.node (.single ⟨14592,14720,27264,27392⟩) (.single ⟨14720,14784,27136,27200⟩))) (.node (.node (.single ⟨14720,14784,27200,27264⟩) (.single ⟨14784,14848,27136,27200⟩)) (.node (.single ⟨14784,14848,27200,27264⟩) (.single ⟨14720,14848,27264,27392⟩))))) (.node (.node (.node (.single ⟨17920,18048,5376,5504⟩) (.node (.single ⟨17920,17984,5504,5568⟩) (.single ⟨17920,17984,5568,5632⟩))) (.node (.node (.single ⟨17984,18048,5504,5568⟩) (.single ⟨17984,18048,5568,5632⟩)) (.node (.single ⟨18048,18176,5376,5504⟩) (.single ⟨18048,18176,5504,5632⟩)))) (.node (.node (.single ⟨27136,27264,14592,14720⟩) (.node (.single ⟨27136,27200,14720,14784⟩) (.single ⟨27136,27200,14784,14848⟩))) (.node (.node (.single ⟨27200,27264,14720,14784⟩) (.single ⟨27200,27264,14784,14848⟩)) (.node (.single ⟨27264,27392,14592,14720⟩) (.single ⟨27264,27392,14720,14848⟩))))))
def output34 : Fin 28 → GridBox := outputData34.get
def coverData34 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData34 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover34 (i : Fin 28) : Fin 28 := ⟨coverData34.get i % 28, Nat.mod_lt _ (by decide)⟩
def source34 (i : Fin 28) : Fin 28 := ⟨sourceData34.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree34 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 (.cutX 5120 .empty (.cutY 17408 .empty (.cutX 5632 (.cutY 17920 .empty (.cutX 5376 .empty (.cutY 18176 (.cutX 5504 (.cutY 18048 .full .full) (.cutY 18048 (.cutX 5568 (.cutY 17984 .full .full) (.cutY 17984 .full .full)) .full)) .empty))) .empty))) .empty) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 .empty (.cutX 15360 (.cutY 27648 (.cutX 14848 (.cutY 27136 .empty (.cutX 14592 .empty (.cutY 27392 (.cutX 14720 (.cutY 27264 .full .full) (.cutY 27264 (.cutX 14784 (.cutY 27200 .full .full) (.cutY 27200 .full .full)) .full)) .empty))) .empty) .empty) .empty))) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 (.cutX 17408 .empty (.cutY 5120 .empty (.cutX 17920 .empty (.cutY 5632 (.cutX 18176 (.cutY 5376 .empty (.cutX 18048 (.cutY 5504 .full (.cutX 17984 (.cutY 5568 .full .full) (.cutY 5568 .full .full))) (.cutY 5504 .full .full))) .empty) .empty)))) .empty) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 .empty (.cutX 27648 (.cutY 15360 (.cutX 27136 .empty (.cutY 14848 (.cutX 27392 (.cutY 14592 .empty (.cutX 27264 (.cutY 14720 .full (.cutX 27200 (.cutY 14784 .full .full) (.cutY 14784 .full .full))) (.cutY 14720 .full .full))) .empty) .empty)) .empty) .empty)))) .empty))) .empty))

theorem metadata34 : 0<191564598 ∧ 21<128 ∧ 70<128 ∧ 0<4 ∧
    2317/4160=0 ∧ 2317%4160=2317 ∧ ∀ i, (leaves34 i).Valid 8 := by
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

noncomputable def phaseMass34 : ℝ := singlePhaseMass (191564598/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw34 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass34_eq : phaseMass34 = (95782299/819200000000 : ℝ) := by
  unfold phaseMass34
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw34 output34 cover34 source34
    (gridTreeUnionCheck_sound 32768 raw34 output34 cover34 source34 tree34 checked34)
    _ (by norm_num) _, areaUnits34]
  norm_num

-- Frozen phase 5014, atom 675, type 0, source (5,60).
def leavesData35 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves35 : Fin 4 → DyadicLeaf := leavesData35.get
def raw35 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 5 60 leaves35 i
def outputData35 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨1280,1408,15360,15488⟩) (.single ⟨1280,1408,15488,15616⟩)) (.node (.single ⟨1408,1536,15360,15488⟩) (.single ⟨1408,1536,15488,15616⟩))) (.node (.node (.single ⟨15360,15488,1280,1408⟩) (.single ⟨15360,15488,1408,1536⟩)) (.node (.single ⟨15488,15616,1280,1408⟩) (.single ⟨15488,15616,1408,1536⟩)))) (.node (.node (.node (.single ⟨17152,17280,31232,31360⟩) (.single ⟨17152,17280,31360,31488⟩)) (.node (.single ⟨17280,17408,31232,31360⟩) (.single ⟨17280,17408,31360,31488⟩))) (.node (.node (.single ⟨31232,31360,17152,17280⟩) (.single ⟨31232,31360,17280,17408⟩)) (.node (.single ⟨31360,31488,17152,17280⟩) (.single ⟨31360,31488,17280,17408⟩)))))
def output35 : Fin 16 → GridBox := outputData35.get
def coverData35 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData35 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover35 (i : Fin 16) : Fin 16 := ⟨coverData35.get i % 16, Nat.mod_lt _ (by decide)⟩
def source35 (i : Fin 16) : Fin 16 := ⟨sourceData35.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree35 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 .empty (.cutX 1024 .empty (.cutY 15360 .empty (.cutX 1536 (.cutY 15872 (.cutX 1280 .empty (.cutY 15616 (.cutX 1408 (.cutY 15488 .full .full) (.cutY 15488 .full .full)) .empty)) .empty) .empty)))) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 (.cutX 15360 .empty (.cutY 1024 .empty (.cutX 15872 (.cutY 1536 (.cutX 15616 (.cutY 1280 .empty (.cutX 15488 (.cutY 1408 .full .full) (.cutY 1408 .full .full))) .empty) .empty) .empty))) .empty)) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 .empty (.cutX 17408 (.cutY 31744 (.cutX 16896 .empty (.cutY 31232 .empty (.cutX 17152 .empty (.cutY 31488 (.cutX 17280 (.cutY 31360 .full .full) (.cutY 31360 .full .full)) .empty)))) .empty) .empty)) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 (.cutX 31744 (.cutY 17408 (.cutX 31232 .empty (.cutY 16896 .empty (.cutX 31488 (.cutY 17152 .empty (.cutX 31360 (.cutY 17280 .full .full) (.cutY 17280 .full .full))) .empty))) .empty) .empty) .empty)) .empty)) .empty))))

theorem metadata35 : 0<89519217 ∧ 5<128 ∧ 60<128 ∧ 0<4 ∧
    675/4160=0 ∧ 675%4160=675 ∧ ∀ i, (leaves35 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData35).mp
    (by decide +kernel)

theorem sourceChecked35_0 : ∀ i : Fin 16,
    (fun i => output35 i = raw35 (source35 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked35 : ∀ i : Fin 16, (fun i => output35 i = raw35 (source35 i)) i :=
  forallFin_of_zero_offset (fun i => output35 i = raw35 (source35 i)) sourceChecked35_0

theorem coverChecked35_0 : ∀ i : Fin 16,
    (fun i => (output35 (cover35 i)).ContainsBox (raw35 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked35 : ∀ i : Fin 16, (fun i => (output35 (cover35 i)).ContainsBox (raw35 i)) i :=
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

noncomputable def phaseMass35 : ℝ := singlePhaseMass (89519217/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw35 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass35_eq : phaseMass35 = (89519217/1638400000000 : ℝ) := by
  unfold phaseMass35
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw35 output35 cover35 source35
    (gridTreeUnionCheck_sound 32768 raw35 output35 cover35 source35 tree35 checked35)
    _ (by norm_num) _, areaUnits35]
  norm_num

-- Frozen phase 5015, atom 1133, type 0, source (9,62).
def leavesData36 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves36 : Fin 4 → DyadicLeaf := leavesData36.get
def raw36 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 9 62 leaves36 i
def outputData36 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨2304,2432,15872,16000⟩) (.single ⟨2304,2432,16000,16128⟩)) (.node (.single ⟨2432,2560,15872,16000⟩) (.single ⟨2432,2560,16000,16128⟩))) (.node (.node (.single ⟨15872,16000,2304,2432⟩) (.single ⟨15872,16000,2432,2560⟩)) (.node (.single ⟨16000,16128,2304,2432⟩) (.single ⟨16000,16128,2432,2560⟩)))) (.node (.node (.node (.single ⟨16640,16768,30208,30336⟩) (.single ⟨16640,16768,30336,30464⟩)) (.node (.single ⟨16768,16896,30208,30336⟩) (.single ⟨16768,16896,30336,30464⟩))) (.node (.node (.single ⟨30208,30336,16640,16768⟩) (.single ⟨30208,30336,16768,16896⟩)) (.node (.single ⟨30336,30464,16640,16768⟩) (.single ⟨30336,30464,16768,16896⟩)))))
def output36 : Fin 16 → GridBox := outputData36.get
def coverData36 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData36 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover36 (i : Fin 16) : Fin 16 := ⟨coverData36.get i % 16, Nat.mod_lt _ (by decide)⟩
def source36 (i : Fin 16) : Fin 16 := ⟨sourceData36.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree36 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 .empty (.cutX 3072 (.cutY 15360 .empty (.cutX 2560 (.cutY 15872 .empty (.cutX 2304 .empty (.cutY 16128 (.cutX 2432 (.cutY 16000 .full .full) (.cutY 16000 .full .full)) .empty))) .empty)) .empty)))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 .empty (.cutX 15360 .empty (.cutY 3072 (.cutX 15872 .empty (.cutY 2560 (.cutX 16128 (.cutY 2304 .empty (.cutX 16000 (.cutY 2432 .full .full) (.cutY 2432 .full .full))) .empty) .empty)) .empty)))) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 (.cutX 17408 (.cutY 29696 .empty (.cutX 16896 (.cutY 30208 .empty (.cutX 16640 .empty (.cutY 30464 (.cutX 16768 (.cutY 30336 .full .full) (.cutY 30336 .full .full)) .empty))) .empty)) .empty) .empty) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 (.cutX 29696 .empty (.cutY 17408 (.cutX 30208 .empty (.cutY 16896 (.cutX 30464 (.cutY 16640 .empty (.cutX 30336 (.cutY 16768 .full .full) (.cutY 16768 .full .full))) .empty) .empty)) .empty)) .empty) .empty) .empty)) .empty))))

theorem metadata36 : 0<116912559 ∧ 9<128 ∧ 62<128 ∧ 0<4 ∧
    1133/4160=0 ∧ 1133%4160=1133 ∧ ∀ i, (leaves36 i).Valid 8 := by
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

noncomputable def phaseMass36 : ℝ := singlePhaseMass (116912559/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw36 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass36_eq : phaseMass36 = (116912559/1638400000000 : ℝ) := by
  unfold phaseMass36
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw36 output36 cover36 source36
    (gridTreeUnionCheck_sound 32768 raw36 output36 cover36 source36 tree36 checked36)
    _ (by norm_num) _, areaUnits36]
  norm_num

-- Frozen phase 5016, atom 908, type 0, source (7,61).
def leavesData37 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves37 : Fin 4 → DyadicLeaf := leavesData37.get
def raw37 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 7 61 leaves37 i
def outputData37 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨1792,1920,15616,15744⟩) (.single ⟨1792,1920,15744,15872⟩)) (.node (.single ⟨1920,2048,15616,15744⟩) (.single ⟨1920,2048,15744,15872⟩))) (.node (.node (.single ⟨15616,15744,1792,1920⟩) (.single ⟨15616,15744,1920,2048⟩)) (.node (.single ⟨15744,15872,1792,1920⟩) (.single ⟨15744,15872,1920,2048⟩)))) (.node (.node (.node (.single ⟨16896,17024,30720,30848⟩) (.single ⟨16896,17024,30848,30976⟩)) (.node (.single ⟨17024,17152,30720,30848⟩) (.single ⟨17024,17152,30848,30976⟩))) (.node (.node (.single ⟨30720,30848,16896,17024⟩) (.single ⟨30720,30848,17024,17152⟩)) (.node (.single ⟨30848,30976,16896,17024⟩) (.single ⟨30848,30976,17024,17152⟩)))))
def output37 : Fin 16 → GridBox := outputData37.get
def coverData37 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData37 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover37 (i : Fin 16) : Fin 16 := ⟨coverData37.get i % 16, Nat.mod_lt _ (by decide)⟩
def source37 (i : Fin 16) : Fin 16 := ⟨sourceData37.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree37 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 .empty (.cutX 1024 .empty (.cutY 15360 .empty (.cutX 1536 .empty (.cutY 15872 (.cutX 1792 .empty (.cutY 15616 .empty (.cutX 1920 (.cutY 15744 .full .full) (.cutY 15744 .full .full)))) .empty))))) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 (.cutX 15360 .empty (.cutY 1024 .empty (.cutX 15872 (.cutY 1536 .empty (.cutX 15616 .empty (.cutY 1792 .empty (.cutX 15744 (.cutY 1920 .full .full) (.cutY 1920 .full .full))))) .empty))) .empty)) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 .empty (.cutX 17408 (.cutY 31744 (.cutX 16896 .empty (.cutY 31232 (.cutX 17152 (.cutY 30976 (.cutX 17024 (.cutY 30848 .full .full) (.cutY 30848 .full .full)) .empty) .empty) .empty)) .empty) .empty)) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 (.cutX 31744 (.cutY 17408 (.cutX 31232 (.cutY 16896 .empty (.cutX 30976 (.cutY 17152 (.cutX 30848 (.cutY 17024 .full .full) (.cutY 17024 .full .full)) .empty) .empty)) .empty) .empty) .empty) .empty)) .empty)) .empty))))

theorem metadata37 : 0<89519217 ∧ 7<128 ∧ 61<128 ∧ 0<4 ∧
    908/4160=0 ∧ 908%4160=908 ∧ ∀ i, (leaves37 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData37).mp
    (by decide +kernel)

theorem sourceChecked37_0 : ∀ i : Fin 16,
    (fun i => output37 i = raw37 (source37 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked37 : ∀ i : Fin 16, (fun i => output37 i = raw37 (source37 i)) i :=
  forallFin_of_zero_offset (fun i => output37 i = raw37 (source37 i)) sourceChecked37_0

theorem coverChecked37_0 : ∀ i : Fin 16,
    (fun i => (output37 (cover37 i)).ContainsBox (raw37 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked37 : ∀ i : Fin 16, (fun i => (output37 (cover37 i)).ContainsBox (raw37 i)) i :=
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

noncomputable def phaseMass37 : ℝ := singlePhaseMass (89519217/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw37 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass37_eq : phaseMass37 = (89519217/1638400000000 : ℝ) := by
  unfold phaseMass37
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw37 output37 cover37 source37
    (gridTreeUnionCheck_sound 32768 raw37 output37 cover37 source37 tree37 checked37)
    _ (by norm_num) _, areaUnits37]
  norm_num

-- Frozen phase 5017, atom 311, type 0, source (2,59).
def leavesData38 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves38 : Fin 4 → DyadicLeaf := leavesData38.get
def raw38 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 2 59 leaves38 i
def outputData38 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨512,640,15104,15232⟩) (.single ⟨512,640,15232,15360⟩)) (.node (.single ⟨640,768,15104,15232⟩) (.single ⟨640,768,15232,15360⟩))) (.node (.node (.single ⟨15104,15232,512,640⟩) (.single ⟨15104,15232,640,768⟩)) (.node (.single ⟨15232,15360,512,640⟩) (.single ⟨15232,15360,640,768⟩)))) (.node (.node (.node (.single ⟨17408,17536,32000,32128⟩) (.single ⟨17408,17536,32128,32256⟩)) (.node (.single ⟨17536,17664,32000,32128⟩) (.single ⟨17536,17664,32128,32256⟩))) (.node (.node (.single ⟨32000,32128,17408,17536⟩) (.single ⟨32000,32128,17536,17664⟩)) (.node (.single ⟨32128,32256,17408,17536⟩) (.single ⟨32128,32256,17536,17664⟩)))))
def output38 : Fin 16 → GridBox := outputData38.get
def coverData38 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData38 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover38 (i : Fin 16) : Fin 16 := ⟨coverData38.get i % 16, Nat.mod_lt _ (by decide)⟩
def source38 (i : Fin 16) : Fin 16 := ⟨sourceData38.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree38 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 .empty (.cutX 1024 (.cutY 15360 (.cutX 512 .empty (.cutY 14848 .empty (.cutX 768 (.cutY 15104 .empty (.cutX 640 (.cutY 15232 .full .full) (.cutY 15232 .full .full))) .empty))) .empty) .empty)) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 (.cutX 15360 (.cutY 1024 (.cutX 14848 .empty (.cutY 512 .empty (.cutX 15104 .empty (.cutY 768 (.cutX 15232 (.cutY 640 .full .full) (.cutY 640 .full .full)) .empty)))) .empty) .empty) .empty)) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 .empty (.cutX 17408 .empty (.cutY 31744 .empty (.cutX 17920 (.cutY 32256 (.cutX 17664 (.cutY 32000 .empty (.cutX 17536 (.cutY 32128 .full .full) (.cutY 32128 .full .full))) .empty) .empty) .empty)))) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 (.cutX 31744 .empty (.cutY 17408 .empty (.cutX 32256 (.cutY 17920 (.cutX 32000 .empty (.cutY 17664 (.cutX 32128 (.cutY 17536 .full .full) (.cutY 17536 .full .full)) .empty)) .empty) .empty))) .empty)) .empty)) .empty))))

theorem metadata38 : 0<89519217 ∧ 2<128 ∧ 59<128 ∧ 0<4 ∧
    311/4160=0 ∧ 311%4160=311 ∧ ∀ i, (leaves38 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData38).mp
    (by decide +kernel)

theorem sourceChecked38_0 : ∀ i : Fin 16,
    (fun i => output38 i = raw38 (source38 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked38 : ∀ i : Fin 16, (fun i => output38 i = raw38 (source38 i)) i :=
  forallFin_of_zero_offset (fun i => output38 i = raw38 (source38 i)) sourceChecked38_0

theorem coverChecked38_0 : ∀ i : Fin 16,
    (fun i => (output38 (cover38 i)).ContainsBox (raw38 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked38 : ∀ i : Fin 16, (fun i => (output38 (cover38 i)).ContainsBox (raw38 i)) i :=
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

noncomputable def phaseMass38 : ℝ := singlePhaseMass (89519217/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw38 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass38_eq : phaseMass38 = (89519217/1638400000000 : ℝ) := by
  unfold phaseMass38
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw38 output38 cover38 source38
    (gridTreeUnionCheck_sound 32768 raw38 output38 cover38 source38 tree38 checked38)
    _ (by norm_num) _, areaUnits38]
  norm_num

-- Frozen phase 5018, atom 6643, type 1, source (23,68).
def leavesData39 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves39 : Fin 13 → DyadicLeaf := leavesData39.get
def raw39 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 23 68 leaves39 i
def outputData39 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨5888,5952,17408,17472⟩) (.node (.single ⟨5888,5952,17472,17536⟩) (.single ⟨5952,6016,17408,17472⟩))) (.node (.single ⟨5952,6016,17472,17536⟩) (.node (.single ⟨5888,6016,17536,17664⟩) (.single ⟨6016,6080,17408,17472⟩)))) (.node (.node (.single ⟨6016,6080,17472,17536⟩) (.node (.single ⟨6080,6112,17408,17440⟩) (.single ⟨6080,6112,17440,17472⟩))) (.node (.node (.single ⟨6112,6144,17408,17440⟩) (.single ⟨6112,6144,17440,17472⟩)) (.node (.single ⟨6080,6144,17472,17536⟩) (.single ⟨6016,6144,17536,17664⟩))))) (.node (.node (.node (.single ⟨15104,15232,26624,26752⟩) (.node (.single ⟨15104,15232,26752,26880⟩) (.single ⟨15232,15296,26624,26688⟩))) (.node (.single ⟨15232,15296,26688,26752⟩) (.node (.single ⟨15296,15328,26624,26656⟩) (.single ⟨15296,15328,26656,26688⟩)))) (.node (.node (.single ⟨15328,15360,26624,26656⟩) (.node (.single ⟨15328,15360,26656,26688⟩) (.single ⟨15296,15360,26688,26752⟩))) (.node (.node (.single ⟨15232,15296,26752,26816⟩) (.single ⟨15232,15296,26816,26880⟩)) (.node (.single ⟨15296,15360,26752,26816⟩) (.single ⟨15296,15360,26816,26880⟩)))))) (.node (.node (.node (.node (.single ⟨17408,17472,5888,5952⟩) (.node (.single ⟨17408,17472,5952,6016⟩) (.single ⟨17472,17536,5888,5952⟩))) (.node (.single ⟨17472,17536,5952,6016⟩) (.node (.single ⟨17408,17472,6016,6080⟩) (.single ⟨17408,17440,6080,6112⟩)))) (.node (.node (.single ⟨17408,17440,6112,6144⟩) (.node (.single ⟨17440,17472,6080,6112⟩) (.single ⟨17440,17472,6112,6144⟩))) (.node (.node (.single ⟨17472,17536,6016,6080⟩) (.single ⟨17472,17536,6080,6144⟩)) (.node (.single ⟨17536,17664,5888,6016⟩) (.single ⟨17536,17664,6016,6144⟩))))) (.node (.node (.node (.single ⟨26624,26752,15104,15232⟩) (.node (.single ⟨26624,26688,15232,15296⟩) (.single ⟨26624,26656,15296,15328⟩))) (.node (.single ⟨26624,26656,15328,15360⟩) (.node (.single ⟨26656,26688,15296,15328⟩) (.single ⟨26656,26688,15328,15360⟩)))) (.node (.node (.single ⟨26688,26752,15232,15296⟩) (.node (.single ⟨26688,26752,15296,15360⟩) (.single ⟨26752,26880,15104,15232⟩))) (.node (.node (.single ⟨26752,26816,15232,15296⟩) (.single ⟨26752,26816,15296,15360⟩)) (.node (.single ⟨26816,26880,15232,15296⟩) (.single ⟨26816,26880,15296,15360⟩)))))))
def output39 : Fin 52 → GridBox := outputData39.get
def coverData39 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData39 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover39 (i : Fin 52) : Fin 52 := ⟨coverData39.get i % 52, Nat.mod_lt _ (by decide)⟩
def source39 (i : Fin 52) : Fin 52 := ⟨sourceData39.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree39 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 (.cutX 5120 .empty (.cutY 17408 .empty (.cutX 5632 .empty (.cutY 17920 (.cutX 5888 .empty (.cutY 17664 (.cutX 6016 (.cutY 17536 (.cutX 5952 (.cutY 17472 .full .full) (.cutY 17472 .full .full)) .full) (.cutY 17536 (.cutX 6080 (.cutY 17472 .full .full) (.cutY 17472 (.cutX 6112 (.cutY 17440 .full .full) (.cutY 17440 .full .full)) .full)) .full)) .empty)) .empty)))) .empty) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 .empty (.cutX 15360 (.cutY 27648 (.cutX 14848 .empty (.cutY 27136 (.cutX 15104 .empty (.cutY 26880 (.cutX 15232 (.cutY 26752 .full .full) (.cutY 26752 (.cutX 15296 (.cutY 26688 .full .full) (.cutY 26688 (.cutX 15328 (.cutY 26656 .full .full) (.cutY 26656 .full .full)) .full)) (.cutX 15296 (.cutY 26816 .full .full) (.cutY 26816 .full .full)))) .empty)) .empty)) .empty) .empty))) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 (.cutX 17408 .empty (.cutY 5120 .empty (.cutX 17920 (.cutY 5632 .empty (.cutX 17664 (.cutY 5888 .empty (.cutX 17536 (.cutY 6016 (.cutX 17472 (.cutY 5952 .full .full) (.cutY 5952 .full .full)) (.cutX 17472 (.cutY 6080 .full (.cutX 17440 (.cutY 6112 .full .full) (.cutY 6112 .full .full))) (.cutY 6080 .full .full))) (.cutY 6016 .full .full))) .empty)) .empty))) .empty) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 .empty (.cutX 27648 (.cutY 15360 (.cutX 27136 (.cutY 14848 .empty (.cutX 26880 (.cutY 15104 .empty (.cutX 26752 (.cutY 15232 .full (.cutX 26688 (.cutY 15296 .full (.cutX 26656 (.cutY 15328 .full .full) (.cutY 15328 .full .full))) (.cutY 15296 .full .full))) (.cutY 15232 .full (.cutX 26816 (.cutY 15296 .full .full) (.cutY 15296 .full .full))))) .empty)) .empty) .empty) .empty)))) .empty))) .empty))

theorem metadata39 : 0<135260814 ∧ 23<128 ∧ 68<128 ∧ 1<4 ∧
    6643/4160=1 ∧ 6643%4160=2483 ∧ ∀ i, (leaves39 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData39).mp
    (by decide +kernel)

theorem sourceChecked39_0 : ∀ i : Fin 52,
    (fun i => output39 i = raw39 (source39 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked39 : ∀ i : Fin 52, (fun i => output39 i = raw39 (source39 i)) i :=
  forallFin_of_zero_offset (fun i => output39 i = raw39 (source39 i)) sourceChecked39_0

theorem coverChecked39_0 : ∀ i : Fin 52,
    (fun i => (output39 (cover39 i)).ContainsBox (raw39 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked39 : ∀ i : Fin 52, (fun i => (output39 (cover39 i)).ContainsBox (raw39 i)) i :=
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

noncomputable def phaseMass39 : ℝ := singlePhaseMass (135260814/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw39 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass39_eq : phaseMass39 = (67630407/819200000000 : ℝ) := by
  unfold phaseMass39
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw39 output39 cover39 source39
    (gridTreeUnionCheck_sound 32768 raw39 output39 cover39 source39 tree39 checked39)
    _ (by norm_num) _, areaUnits39]
  norm_num

-- Frozen phase 5019, atom 3503, type 0, source (38,83).
def leavesData40 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves40 : Fin 4 → DyadicLeaf := leavesData40.get
def raw40 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 38 83 leaves40 i
def outputData40 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨9728,9856,21248,21376⟩) (.single ⟨9728,9856,21376,21504⟩)) (.node (.single ⟨9856,9984,21248,21376⟩) (.single ⟨9856,9984,21376,21504⟩))) (.node (.node (.single ⟨11264,11392,22784,22912⟩) (.single ⟨11264,11392,22912,23040⟩)) (.node (.single ⟨11392,11520,22784,22912⟩) (.single ⟨11392,11520,22912,23040⟩)))) (.node (.node (.node (.single ⟨21248,21376,9728,9856⟩) (.single ⟨21248,21376,9856,9984⟩)) (.node (.single ⟨21376,21504,9728,9856⟩) (.single ⟨21376,21504,9856,9984⟩))) (.node (.node (.single ⟨22784,22912,11264,11392⟩) (.single ⟨22784,22912,11392,11520⟩)) (.node (.single ⟨22912,23040,11264,11392⟩) (.single ⟨22912,23040,11392,11520⟩)))))
def output40 : Fin 16 → GridBox := outputData40.get
def coverData40 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData40 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover40 (i : Fin 16) : Fin 16 := ⟨coverData40.get i % 16, Nat.mod_lt _ (by decide)⟩
def source40 (i : Fin 16) : Fin 16 := ⟨sourceData40.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree40 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 (.cutX 9216 .empty (.cutY 21504 (.cutX 9728 .empty (.cutY 20992 .empty (.cutX 9984 (.cutY 21248 .empty (.cutX 9856 (.cutY 21376 .full .full) (.cutY 21376 .full .full))) .empty))) .empty)) .empty) (.cutY 22528 .empty (.cutX 11264 .empty (.cutY 23552 (.cutX 11776 (.cutY 23040 (.cutX 11520 (.cutY 22784 .empty (.cutX 11392 (.cutY 22912 .full .full) (.cutY 22912 .full .full))) .empty) .empty) .empty) .empty))))) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 (.cutY 10240 (.cutX 21504 (.cutY 9216 .empty (.cutX 20992 .empty (.cutY 9728 .empty (.cutX 21248 .empty (.cutY 9984 (.cutX 21376 (.cutY 9856 .full .full) (.cutY 9856 .full .full)) .empty))))) .empty) .empty) (.cutY 10240 .empty (.cutX 23552 (.cutY 11264 .empty (.cutX 23040 (.cutY 11776 (.cutX 22784 .empty (.cutY 11520 (.cutX 22912 (.cutY 11392 .full .full) (.cutY 11392 .full .full)) .empty)) .empty) .empty)) .empty))) .empty))) .empty) .empty))

theorem metadata40 : 0<167980383 ∧ 38<128 ∧ 83<128 ∧ 0<4 ∧
    3503/4160=0 ∧ 3503%4160=3503 ∧ ∀ i, (leaves40 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData40).mp
    (by decide +kernel)

theorem sourceChecked40_0 : ∀ i : Fin 16,
    (fun i => output40 i = raw40 (source40 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked40 : ∀ i : Fin 16, (fun i => output40 i = raw40 (source40 i)) i :=
  forallFin_of_zero_offset (fun i => output40 i = raw40 (source40 i)) sourceChecked40_0

theorem coverChecked40_0 : ∀ i : Fin 16,
    (fun i => (output40 (cover40 i)).ContainsBox (raw40 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked40 : ∀ i : Fin 16, (fun i => (output40 (cover40 i)).ContainsBox (raw40 i)) i :=
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

noncomputable def phaseMass40 : ℝ := singlePhaseMass (167980383/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw40 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass40_eq : phaseMass40 = (167980383/1638400000000 : ℝ) := by
  unfold phaseMass40
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw40 output40 cover40 source40
    (gridTreeUnionCheck_sound 32768 raw40 output40 cover40 source40 tree40 checked40)
    _ (by norm_num) _, areaUnits40]
  norm_num

-- Frozen phase 5020, atom 3604, type 0, source (40,84).
def leavesData41 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves41 : Fin 4 → DyadicLeaf := leavesData41.get
def raw41 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 40 84 leaves41 i
def outputData41 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨10240,10368,21504,21632⟩) (.single ⟨10240,10368,21632,21760⟩)) (.node (.single ⟨10368,10496,21504,21632⟩) (.single ⟨10368,10496,21632,21760⟩))) (.node (.node (.single ⟨11008,11136,22272,22400⟩) (.single ⟨11008,11136,22400,22528⟩)) (.node (.single ⟨11136,11264,22272,22400⟩) (.single ⟨11136,11264,22400,22528⟩)))) (.node (.node (.node (.single ⟨21504,21632,10240,10368⟩) (.single ⟨21504,21632,10368,10496⟩)) (.node (.single ⟨21632,21760,10240,10368⟩) (.single ⟨21632,21760,10368,10496⟩))) (.node (.node (.single ⟨22272,22400,11008,11136⟩) (.single ⟨22272,22400,11136,11264⟩)) (.node (.single ⟨22400,22528,11008,11136⟩) (.single ⟨22400,22528,11136,11264⟩)))))
def output41 : Fin 16 → GridBox := outputData41.get
def coverData41 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData41 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover41 (i : Fin 16) : Fin 16 := ⟨coverData41.get i % 16, Nat.mod_lt _ (by decide)⟩
def source41 (i : Fin 16) : Fin 16 := ⟨sourceData41.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree41 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 .empty (.cutY 22528 (.cutX 11264 (.cutY 21504 .empty (.cutX 10752 (.cutY 22016 (.cutX 10496 (.cutY 21760 (.cutX 10368 (.cutY 21632 .full .full) (.cutY 21632 .full .full)) .empty) .empty) .empty) (.cutY 22016 .empty (.cutX 11008 .empty (.cutY 22272 .empty (.cutX 11136 (.cutY 22400 .full .full) (.cutY 22400 .full .full))))))) .empty) .empty))) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 (.cutY 10240 .empty (.cutX 21504 .empty (.cutY 11264 (.cutX 22016 (.cutY 10752 (.cutX 21760 (.cutY 10496 (.cutX 21632 (.cutY 10368 .full .full) (.cutY 10368 .full .full)) .empty) .empty) .empty) (.cutY 10752 .empty (.cutX 22272 .empty (.cutY 11008 .empty (.cutX 22400 (.cutY 11136 .full .full) (.cutY 11136 .full .full)))))) .empty))) .empty) .empty))) .empty) .empty))

theorem metadata41 : 0<1701312 ∧ 40<128 ∧ 84<128 ∧ 0<4 ∧
    3604/4160=0 ∧ 3604%4160=3604 ∧ ∀ i, (leaves41 i).Valid 8 := by
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

noncomputable def phaseMass41 : ℝ := singlePhaseMass (1701312/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw41 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass41_eq : phaseMass41 = (26583/25600000000 : ℝ) := by
  unfold phaseMass41
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw41 output41 cover41 source41
    (gridTreeUnionCheck_sound 32768 raw41 output41 cover41 source41 tree41 checked41)
    _ (by norm_num) _, areaUnits41]
  norm_num

-- Frozen phase 5021, atom 2947, type 0, source (29,76).
def leavesData42 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves42 : Fin 4 → DyadicLeaf := leavesData42.get
def raw42 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 29 76 leaves42 i
def outputData42 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨7424,7552,19456,19584⟩) (.single ⟨7424,7552,19584,19712⟩)) (.node (.single ⟨7552,7680,19456,19584⟩) (.single ⟨7552,7680,19584,19712⟩))) (.node (.node (.single ⟨13056,13184,25088,25216⟩) (.single ⟨13056,13184,25216,25344⟩)) (.node (.single ⟨13184,13312,25088,25216⟩) (.single ⟨13184,13312,25216,25344⟩)))) (.node (.node (.node (.single ⟨19456,19584,7424,7552⟩) (.single ⟨19456,19584,7552,7680⟩)) (.node (.single ⟨19584,19712,7424,7552⟩) (.single ⟨19584,19712,7552,7680⟩))) (.node (.node (.single ⟨25088,25216,13056,13184⟩) (.single ⟨25088,25216,13184,13312⟩)) (.node (.single ⟨25216,25344,13056,13184⟩) (.single ⟨25216,25344,13184,13312⟩)))))
def output42 : Fin 16 → GridBox := outputData42.get
def coverData42 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData42 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover42 (i : Fin 16) : Fin 16 := ⟨coverData42.get i % 16, Nat.mod_lt _ (by decide)⟩
def source42 (i : Fin 16) : Fin 16 := ⟨sourceData42.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree42 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 .empty (.cutX 7168 .empty (.cutY 19456 .empty (.cutX 7680 (.cutY 19968 (.cutX 7424 .empty (.cutY 19712 (.cutX 7552 (.cutY 19584 .full .full) (.cutY 19584 .full .full)) .empty)) .empty) .empty))))) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 (.cutX 13312 (.cutY 25600 (.cutX 12800 .empty (.cutY 25088 .empty (.cutX 13056 .empty (.cutY 25344 (.cutX 13184 (.cutY 25216 .full .full) (.cutY 25216 .full .full)) .empty)))) .empty) .empty) .empty) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 .empty (.cutX 19456 .empty (.cutY 7168 .empty (.cutX 19968 (.cutY 7680 (.cutX 19712 (.cutY 7424 .empty (.cutX 19584 (.cutY 7552 .full .full) (.cutY 7552 .full .full))) .empty) .empty) .empty)))))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 (.cutX 25600 (.cutY 13312 (.cutX 25088 .empty (.cutY 12800 .empty (.cutX 25344 (.cutY 13056 .empty (.cutX 25216 (.cutY 13184 .full .full) (.cutY 13184 .full .full))) .empty))) .empty) .empty) .empty) .empty)) .empty))) .empty))

theorem metadata42 : 0<177866497 ∧ 29<128 ∧ 76<128 ∧ 0<4 ∧
    2947/4160=0 ∧ 2947%4160=2947 ∧ ∀ i, (leaves42 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData42).mp
    (by decide +kernel)

theorem sourceChecked42_0 : ∀ i : Fin 16,
    (fun i => output42 i = raw42 (source42 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked42 : ∀ i : Fin 16, (fun i => output42 i = raw42 (source42 i)) i :=
  forallFin_of_zero_offset (fun i => output42 i = raw42 (source42 i)) sourceChecked42_0

theorem coverChecked42_0 : ∀ i : Fin 16,
    (fun i => (output42 (cover42 i)).ContainsBox (raw42 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked42 : ∀ i : Fin 16, (fun i => (output42 (cover42 i)).ContainsBox (raw42 i)) i :=
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

noncomputable def phaseMass42 : ℝ := singlePhaseMass (177866497/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw42 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass42_eq : phaseMass42 = (177866497/1638400000000 : ℝ) := by
  unfold phaseMass42
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw42 output42 cover42 source42
    (gridTreeUnionCheck_sound 32768 raw42 output42 cover42 source42 tree42 checked42)
    _ (by norm_num) _, areaUnits42]
  norm_num

-- Frozen phase 5022, atom 2648, type 0, source (25,73).
def leavesData43 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves43 : Fin 7 → DyadicLeaf := leavesData43.get
def raw43 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 25 73 leaves43 i
def outputData43 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨6400,6528,18688,18816⟩) (.node (.single ⟨6400,6528,18816,18944⟩) (.single ⟨6528,6592,18688,18752⟩))) (.node (.node (.single ⟨6528,6592,18752,18816⟩) (.single ⟨6592,6656,18688,18752⟩)) (.node (.single ⟨6592,6656,18752,18816⟩) (.single ⟨6528,6656,18816,18944⟩)))) (.node (.node (.single ⟨13824,13952,26112,26240⟩) (.node (.single ⟨13824,13952,26240,26368⟩) (.single ⟨13952,14016,26112,26176⟩))) (.node (.node (.single ⟨13952,14016,26176,26240⟩) (.single ⟨14016,14080,26112,26176⟩)) (.node (.single ⟨14016,14080,26176,26240⟩) (.single ⟨13952,14080,26240,26368⟩))))) (.node (.node (.node (.single ⟨18688,18816,6400,6528⟩) (.node (.single ⟨18688,18752,6528,6592⟩) (.single ⟨18688,18752,6592,6656⟩))) (.node (.node (.single ⟨18752,18816,6528,6592⟩) (.single ⟨18752,18816,6592,6656⟩)) (.node (.single ⟨18816,18944,6400,6528⟩) (.single ⟨18816,18944,6528,6656⟩)))) (.node (.node (.single ⟨26112,26240,13824,13952⟩) (.node (.single ⟨26112,26176,13952,14016⟩) (.single ⟨26112,26176,14016,14080⟩))) (.node (.node (.single ⟨26176,26240,13952,14016⟩) (.single ⟨26176,26240,14016,14080⟩)) (.node (.single ⟨26240,26368,13824,13952⟩) (.single ⟨26240,26368,13952,14080⟩))))))
def output43 : Fin 28 → GridBox := outputData43.get
def coverData43 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData43 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover43 (i : Fin 28) : Fin 28 := ⟨coverData43.get i % 28, Nat.mod_lt _ (by decide)⟩
def source43 (i : Fin 28) : Fin 28 := ⟨sourceData43.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree43 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 .empty (.cutX 7168 (.cutY 19456 (.cutX 6656 (.cutY 18944 (.cutX 6400 .empty (.cutY 18688 .empty (.cutX 6528 (.cutY 18816 .full .full) (.cutY 18816 (.cutX 6592 (.cutY 18752 .full .full) (.cutY 18752 .full .full)) .full)))) .empty) .empty) .empty) .empty))) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 (.cutX 13312 .empty (.cutY 25600 .empty (.cutX 13824 .empty (.cutY 26112 .empty (.cutX 14080 (.cutY 26368 (.cutX 13952 (.cutY 26240 .full .full) (.cutY 26240 (.cutX 14016 (.cutY 26176 .full .full) (.cutY 26176 .full .full)) .full)) .empty) .empty))))) .empty) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 .empty (.cutX 19456 (.cutY 7168 (.cutX 18944 (.cutY 6656 (.cutX 18688 .empty (.cutY 6400 .empty (.cutX 18816 (.cutY 6528 .full (.cutX 18752 (.cutY 6592 .full .full) (.cutY 6592 .full .full))) (.cutY 6528 .full .full)))) .empty) .empty) .empty) .empty)))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 (.cutX 25600 .empty (.cutY 13312 .empty (.cutX 26112 .empty (.cutY 13824 .empty (.cutX 26368 (.cutY 14080 (.cutX 26240 (.cutY 13952 .full (.cutX 26176 (.cutY 14016 .full .full) (.cutY 14016 .full .full))) (.cutY 13952 .full .full)) .empty) .empty))))) .empty) .empty)) .empty))) .empty))

theorem metadata43 : 0<177866497 ∧ 25<128 ∧ 73<128 ∧ 0<4 ∧
    2648/4160=0 ∧ 2648%4160=2648 ∧ ∀ i, (leaves43 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData43).mp
    (by decide +kernel)

theorem sourceChecked43_0 : ∀ i : Fin 28,
    (fun i => output43 i = raw43 (source43 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked43 : ∀ i : Fin 28, (fun i => output43 i = raw43 (source43 i)) i :=
  forallFin_of_zero_offset (fun i => output43 i = raw43 (source43 i)) sourceChecked43_0

theorem coverChecked43_0 : ∀ i : Fin 28,
    (fun i => (output43 (cover43 i)).ContainsBox (raw43 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked43 : ∀ i : Fin 28, (fun i => (output43 (cover43 i)).ContainsBox (raw43 i)) i :=
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

noncomputable def phaseMass43 : ℝ := singlePhaseMass (177866497/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw43 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass43_eq : phaseMass43 = (177866497/1638400000000 : ℝ) := by
  unfold phaseMass43
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw43 output43 cover43 source43
    (gridTreeUnionCheck_sound 32768 raw43 output43 cover43 source43 tree43 checked43)
    _ (by norm_num) _, areaUnits43]
  norm_num

-- Frozen phase 5023, atom 2048, type 0, source (18,68).
def leavesData44 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves44 : Fin 7 → DyadicLeaf := leavesData44.get
def raw44 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 18 68 leaves44 i
def outputData44 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨4608,4736,17408,17536⟩) (.node (.single ⟨4608,4736,17536,17664⟩) (.single ⟨4736,4800,17408,17472⟩))) (.node (.node (.single ⟨4736,4800,17472,17536⟩) (.single ⟨4800,4864,17408,17472⟩)) (.node (.single ⟨4800,4864,17472,17536⟩) (.single ⟨4736,4864,17536,17664⟩)))) (.node (.node (.single ⟨15104,15232,27904,28032⟩) (.node (.single ⟨15104,15232,28032,28160⟩) (.single ⟨15232,15296,27904,27968⟩))) (.node (.node (.single ⟨15232,15296,27968,28032⟩) (.single ⟨15296,15360,27904,27968⟩)) (.node (.single ⟨15296,15360,27968,28032⟩) (.single ⟨15232,15360,28032,28160⟩))))) (.node (.node (.node (.single ⟨17408,17536,4608,4736⟩) (.node (.single ⟨17408,17472,4736,4800⟩) (.single ⟨17408,17472,4800,4864⟩))) (.node (.node (.single ⟨17472,17536,4736,4800⟩) (.single ⟨17472,17536,4800,4864⟩)) (.node (.single ⟨17536,17664,4608,4736⟩) (.single ⟨17536,17664,4736,4864⟩)))) (.node (.node (.single ⟨27904,28032,15104,15232⟩) (.node (.single ⟨27904,27968,15232,15296⟩) (.single ⟨27904,27968,15296,15360⟩))) (.node (.node (.single ⟨27968,28032,15232,15296⟩) (.single ⟨27968,28032,15296,15360⟩)) (.node (.single ⟨28032,28160,15104,15232⟩) (.single ⟨28032,28160,15232,15360⟩))))))
def output44 : Fin 28 → GridBox := outputData44.get
def coverData44 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData44 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover44 (i : Fin 28) : Fin 28 := ⟨coverData44.get i % 28, Nat.mod_lt _ (by decide)⟩
def source44 (i : Fin 28) : Fin 28 := ⟨sourceData44.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree44 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 (.cutX 5120 (.cutY 17408 .empty (.cutX 4608 .empty (.cutY 17920 (.cutX 4864 (.cutY 17664 (.cutX 4736 (.cutY 17536 .full .full) (.cutY 17536 (.cutX 4800 (.cutY 17472 .full .full) (.cutY 17472 .full .full)) .full)) .empty) .empty) .empty))) .empty) .empty) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 .empty (.cutX 15360 (.cutY 27648 .empty (.cutX 14848 .empty (.cutY 28160 (.cutX 15104 .empty (.cutY 27904 .empty (.cutX 15232 (.cutY 28032 .full .full) (.cutY 28032 (.cutX 15296 (.cutY 27968 .full .full) (.cutY 27968 .full .full)) .full)))) .empty))) .empty))) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 (.cutX 17408 .empty (.cutY 5120 (.cutX 17920 (.cutY 4608 .empty (.cutX 17664 (.cutY 4864 (.cutX 17536 (.cutY 4736 .full (.cutX 17472 (.cutY 4800 .full .full) (.cutY 4800 .full .full))) (.cutY 4736 .full .full)) .empty) .empty)) .empty) .empty)) .empty) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 .empty (.cutX 27648 .empty (.cutY 15360 (.cutX 28160 (.cutY 14848 .empty (.cutX 27904 .empty (.cutY 15104 .empty (.cutX 28032 (.cutY 15232 .full (.cutX 27968 (.cutY 15296 .full .full) (.cutY 15296 .full .full))) (.cutY 15232 .full .full))))) .empty) .empty))))) .empty))) .empty))

theorem metadata44 : 0<191564598 ∧ 18<128 ∧ 68<128 ∧ 0<4 ∧
    2048/4160=0 ∧ 2048%4160=2048 ∧ ∀ i, (leaves44 i).Valid 8 := by
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

noncomputable def phaseMass44 : ℝ := singlePhaseMass (191564598/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw44 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass44_eq : phaseMass44 = (95782299/819200000000 : ℝ) := by
  unfold phaseMass44
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw44 output44 cover44 source44
    (gridTreeUnionCheck_sound 32768 raw44 output44 cover44 source44 tree44 checked44)
    _ (by norm_num) _, areaUnits44]
  norm_num

-- Frozen phase 5024, atom 7854, type 1, source (42,82).
def leavesData45 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves45 : Fin 10 → DyadicLeaf := leavesData45.get
def raw45 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 42 82 leaves45 i
def outputData45 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨10752,10880,20992,21120⟩) (.single ⟨10752,10880,21120,21248⟩)) (.node (.single ⟨10880,10944,20992,21056⟩) (.node (.single ⟨10880,10944,21056,21120⟩) (.single ⟨10944,10976,20992,21024⟩)))) (.node (.node (.single ⟨10944,10976,21024,21056⟩) (.single ⟨10976,11008,20992,21024⟩)) (.node (.single ⟨10976,11008,21024,21056⟩) (.node (.single ⟨10944,11008,21056,21120⟩) (.single ⟨10880,11008,21120,21248⟩))))) (.node (.node (.node (.single ⟨11520,11648,21760,21888⟩) (.single ⟨11520,11648,21888,22016⟩)) (.node (.single ⟨11648,11712,21760,21824⟩) (.node (.single ⟨11648,11712,21824,21888⟩) (.single ⟨11712,11744,21760,21792⟩)))) (.node (.node (.single ⟨11712,11744,21792,21824⟩) (.single ⟨11744,11776,21760,21792⟩)) (.node (.single ⟨11744,11776,21792,21824⟩) (.node (.single ⟨11712,11776,21824,21888⟩) (.single ⟨11648,11776,21888,22016⟩)))))) (.node (.node (.node (.node (.single ⟨20992,21120,10752,10880⟩) (.single ⟨20992,21056,10880,10944⟩)) (.node (.single ⟨20992,21024,10944,10976⟩) (.node (.single ⟨20992,21024,10976,11008⟩) (.single ⟨21024,21056,10944,10976⟩)))) (.node (.node (.single ⟨21024,21056,10976,11008⟩) (.single ⟨21056,21120,10880,10944⟩)) (.node (.single ⟨21056,21120,10944,11008⟩) (.node (.single ⟨21120,21248,10752,10880⟩) (.single ⟨21120,21248,10880,11008⟩))))) (.node (.node (.node (.single ⟨21760,21888,11520,11648⟩) (.single ⟨21760,21824,11648,11712⟩)) (.node (.single ⟨21760,21792,11712,11744⟩) (.node (.single ⟨21760,21792,11744,11776⟩) (.single ⟨21792,21824,11712,11744⟩)))) (.node (.node (.single ⟨21792,21824,11744,11776⟩) (.single ⟨21824,21888,11648,11712⟩)) (.node (.single ⟨21824,21888,11712,11776⟩) (.node (.single ⟨21888,22016,11520,11648⟩) (.single ⟨21888,22016,11648,11776⟩)))))))
def output45 : Fin 40 → GridBox := outputData45.get
def coverData45 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 28) (.single 38)) (.node (.single 11) (.node (.single 9) (.single 29))))) (.node (.node (.node (.single 30) (.single 10)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 26) (.node (.single 36) (.single 13)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 23) (.single 33)))) (.node (.node (.single 16) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))))
def sourceData45 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover45 (i : Fin 40) : Fin 40 := ⟨coverData45.get i % 40, Nat.mod_lt _ (by decide)⟩
def source45 (i : Fin 40) : Fin 40 := ⟨sourceData45.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree45 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 .empty (.cutY 22528 (.cutX 11264 (.cutY 21504 (.cutX 10752 .empty (.cutY 20992 .empty (.cutX 11008 (.cutY 21248 (.cutX 10880 (.cutY 21120 .full .full) (.cutY 21120 (.cutX 10944 (.cutY 21056 .full .full) (.cutY 21056 (.cutX 10976 (.cutY 21024 .full .full) (.cutY 21024 .full .full)) .full)) .full)) .empty) .empty))) .empty) (.cutY 21504 .empty (.cutX 11776 (.cutY 22016 (.cutX 11520 .empty (.cutY 21760 .empty (.cutX 11648 (.cutY 21888 .full .full) (.cutY 21888 (.cutX 11712 (.cutY 21824 .full .full) (.cutY 21824 (.cutX 11744 (.cutY 21792 .full .full) (.cutY 21792 .full .full)) .full)) .full)))) .empty) .empty))) .empty))) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 (.cutY 10240 .empty (.cutX 21504 (.cutY 11264 (.cutX 20992 .empty (.cutY 10752 .empty (.cutX 21248 (.cutY 11008 (.cutX 21120 (.cutY 10880 .full (.cutX 21056 (.cutY 10944 .full (.cutX 21024 (.cutY 10976 .full .full) (.cutY 10976 .full .full))) (.cutY 10944 .full .full))) (.cutY 10880 .full .full)) .empty) .empty))) .empty) (.cutY 11264 .empty (.cutX 22016 (.cutY 11776 (.cutX 21760 .empty (.cutY 11520 .empty (.cutX 21888 (.cutY 11648 .full (.cutX 21824 (.cutY 11712 .full (.cutX 21792 (.cutY 11744 .full .full) (.cutY 11744 .full .full))) (.cutY 11712 .full .full))) (.cutY 11648 .full .full)))) .empty) .empty)))) .empty) .empty))) .empty) .empty))

theorem metadata45 : 0<56923454 ∧ 42<128 ∧ 82<128 ∧ 1<4 ∧
    7854/4160=1 ∧ 7854%4160=3694 ∧ ∀ i, (leaves45 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData45).mp
    (by decide +kernel)

theorem sourceChecked45_0 : ∀ i : Fin 40,
    (fun i => output45 i = raw45 (source45 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked45 : ∀ i : Fin 40, (fun i => output45 i = raw45 (source45 i)) i :=
  forallFin_of_zero_offset (fun i => output45 i = raw45 (source45 i)) sourceChecked45_0

theorem coverChecked45_0 : ∀ i : Fin 40,
    (fun i => (output45 (cover45 i)).ContainsBox (raw45 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked45 : ∀ i : Fin 40, (fun i => (output45 (cover45 i)).ContainsBox (raw45 i)) i :=
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

noncomputable def phaseMass45 : ℝ := singlePhaseMass (56923454/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw45 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass45_eq : phaseMass45 = (28461727/819200000000 : ℝ) := by
  unfold phaseMass45
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw45 output45 cover45 source45
    (gridTreeUnionCheck_sound 32768 raw45 output45 cover45 source45 tree45 checked45)
    _ (by norm_num) _, areaUnits45]
  norm_num

-- Frozen phase 5025, atom 4343, type 1, source (1,56).
def leavesData46 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves46 : Fin 10 → DyadicLeaf := leavesData46.get
def raw46 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 1 56 leaves46 i
def outputData46 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨256,320,14336,14400⟩) (.single ⟨256,320,14400,14464⟩)) (.node (.single ⟨320,384,14336,14400⟩) (.node (.single ⟨320,384,14400,14464⟩) (.single ⟨256,384,14464,14592⟩)))) (.node (.node (.single ⟨384,448,14336,14400⟩) (.single ⟨384,448,14400,14464⟩)) (.node (.single ⟨448,512,14336,14400⟩) (.node (.single ⟨448,512,14400,14464⟩) (.single ⟨384,512,14464,14592⟩))))) (.node (.node (.node (.single ⟨14336,14400,256,320⟩) (.single ⟨14336,14400,320,384⟩)) (.node (.single ⟨14400,14464,256,320⟩) (.node (.single ⟨14400,14464,320,384⟩) (.single ⟨14336,14400,384,448⟩)))) (.node (.node (.single ⟨14336,14400,448,512⟩) (.single ⟨14400,14464,384,448⟩)) (.node (.single ⟨14400,14464,448,512⟩) (.node (.single ⟨14464,14592,256,384⟩) (.single ⟨14464,14592,384,512⟩)))))) (.node (.node (.node (.node (.single ⟨18176,18304,32256,32384⟩) (.single ⟨18176,18304,32384,32512⟩)) (.node (.single ⟨18304,18368,32256,32320⟩) (.node (.single ⟨18304,18368,32320,32384⟩) (.single ⟨18368,18432,32256,32320⟩)))) (.node (.node (.single ⟨18368,18432,32320,32384⟩) (.single ⟨18304,18368,32384,32448⟩)) (.node (.single ⟨18304,18368,32448,32512⟩) (.node (.single ⟨18368,18432,32384,32448⟩) (.single ⟨18368,18432,32448,32512⟩))))) (.node (.node (.node (.single ⟨32256,32384,18176,18304⟩) (.single ⟨32256,32320,18304,18368⟩)) (.node (.single ⟨32256,32320,18368,18432⟩) (.node (.single ⟨32320,32384,18304,18368⟩) (.single ⟨32320,32384,18368,18432⟩)))) (.node (.node (.single ⟨32384,32512,18176,18304⟩) (.single ⟨32384,32448,18304,18368⟩)) (.node (.single ⟨32384,32448,18368,18432⟩) (.node (.single ⟨32448,32512,18304,18368⟩) (.single ⟨32448,32512,18368,18432⟩)))))))
def output46 : Fin 40 → GridBox := outputData46.get
def coverData46 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 18)) (.node (.single 35) (.node (.single 21) (.single 9)))) (.node (.node (.single 19) (.single 30)) (.node (.single 20) (.node (.single 5) (.single 14))))) (.node (.node (.node (.single 34) (.single 25)) (.node (.single 6) (.node (.single 16) (.single 33)))) (.node (.node (.single 23) (.single 7)) (.node (.single 15) (.node (.single 32) (.single 24)))))) (.node (.node (.node (.node (.single 8) (.single 17)) (.node (.single 31) (.node (.single 22) (.single 0)))) (.node (.node (.single 10) (.single 39)) (.node (.single 29) (.node (.single 1) (.single 12))))) (.node (.node (.node (.single 38) (.single 27)) (.node (.single 2) (.node (.single 11) (.single 37)))) (.node (.node (.single 28) (.single 3)) (.node (.single 13) (.node (.single 36) (.single 26)))))))
def sourceData46 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover46 (i : Fin 40) : Fin 40 := ⟨coverData46.get i % 40, Nat.mod_lt _ (by decide)⟩
def source46 (i : Fin 40) : Fin 40 := ⟨sourceData46.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree46 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 .empty (.cutX 1024 (.cutY 15360 (.cutX 512 (.cutY 14848 (.cutX 256 .empty (.cutY 14592 (.cutX 384 (.cutY 14464 (.cutX 320 (.cutY 14400 .full .full) (.cutY 14400 .full .full)) .full) (.cutY 14464 (.cutX 448 (.cutY 14400 .full .full) (.cutY 14400 .full .full)) .full)) .empty)) .empty) .empty) .empty) .empty)) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 (.cutX 15360 (.cutY 1024 (.cutX 14848 (.cutY 512 (.cutX 14592 (.cutY 256 .empty (.cutX 14464 (.cutY 384 (.cutX 14400 (.cutY 320 .full .full) (.cutY 320 .full .full)) (.cutX 14400 (.cutY 448 .full .full) (.cutY 448 .full .full))) (.cutY 384 .full .full))) .empty) .empty) .empty) .empty) .empty) .empty)) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 .empty (.cutX 17408 .empty (.cutY 31744 .empty (.cutX 17920 .empty (.cutY 32256 .empty (.cutX 18176 .empty (.cutY 32512 (.cutX 18304 (.cutY 32384 .full .full) (.cutY 32384 (.cutX 18368 (.cutY 32320 .full .full) (.cutY 32320 .full .full)) (.cutX 18368 (.cutY 32448 .full .full) (.cutY 32448 .full .full)))) .empty))))))) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 (.cutX 31744 .empty (.cutY 17408 .empty (.cutX 32256 .empty (.cutY 17920 .empty (.cutX 32512 (.cutY 18176 .empty (.cutX 32384 (.cutY 18304 .full (.cutX 32320 (.cutY 18368 .full .full) (.cutY 18368 .full .full))) (.cutY 18304 .full (.cutX 32448 (.cutY 18368 .full .full) (.cutY 18368 .full .full))))) .empty))))) .empty)) .empty)) .empty))))

theorem metadata46 : 0<169648215 ∧ 1<128 ∧ 56<128 ∧ 1<4 ∧
    4343/4160=1 ∧ 4343%4160=183 ∧ ∀ i, (leaves46 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData46).mp
    (by decide +kernel)

theorem sourceChecked46_0 : ∀ i : Fin 40,
    (fun i => output46 i = raw46 (source46 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked46 : ∀ i : Fin 40, (fun i => output46 i = raw46 (source46 i)) i :=
  forallFin_of_zero_offset (fun i => output46 i = raw46 (source46 i)) sourceChecked46_0

theorem coverChecked46_0 : ∀ i : Fin 40,
    (fun i => (output46 (cover46 i)).ContainsBox (raw46 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked46 : ∀ i : Fin 40, (fun i => (output46 (cover46 i)).ContainsBox (raw46 i)) i :=
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

noncomputable def phaseMass46 : ℝ := singlePhaseMass (169648215/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw46 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass46_eq : phaseMass46 = (33929643/327680000000 : ℝ) := by
  unfold phaseMass46
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw46 output46 cover46 source46
    (gridTreeUnionCheck_sound 32768 raw46 output46 cover46 source46 tree46 checked46)
    _ (by norm_num) _, areaUnits46]
  norm_num

-- Frozen phase 5026, atom 7307, type 1, source (32,75).
def leavesData47 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves47 : Fin 10 → DyadicLeaf := leavesData47.get
def raw47 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 32 75 leaves47 i
def outputData47 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨8192,8320,19200,19328⟩) (.single ⟨8192,8320,19328,19456⟩)) (.node (.single ⟨8320,8384,19200,19264⟩) (.node (.single ⟨8320,8384,19264,19328⟩) (.single ⟨8384,8416,19200,19232⟩)))) (.node (.node (.single ⟨8384,8416,19232,19264⟩) (.single ⟨8416,8448,19200,19232⟩)) (.node (.single ⟨8416,8448,19232,19264⟩) (.node (.single ⟨8384,8448,19264,19328⟩) (.single ⟨8320,8448,19328,19456⟩))))) (.node (.node (.node (.single ⟨13312,13440,24320,24448⟩) (.single ⟨13312,13440,24448,24576⟩)) (.node (.single ⟨13440,13504,24320,24384⟩) (.node (.single ⟨13440,13504,24384,24448⟩) (.single ⟨13504,13536,24320,24352⟩)))) (.node (.node (.single ⟨13504,13536,24352,24384⟩) (.single ⟨13536,13568,24320,24352⟩)) (.node (.single ⟨13536,13568,24352,24384⟩) (.node (.single ⟨13504,13568,24384,24448⟩) (.single ⟨13440,13568,24448,24576⟩)))))) (.node (.node (.node (.node (.single ⟨19200,19328,8192,8320⟩) (.single ⟨19200,19264,8320,8384⟩)) (.node (.single ⟨19200,19232,8384,8416⟩) (.node (.single ⟨19200,19232,8416,8448⟩) (.single ⟨19232,19264,8384,8416⟩)))) (.node (.node (.single ⟨19232,19264,8416,8448⟩) (.single ⟨19264,19328,8320,8384⟩)) (.node (.single ⟨19264,19328,8384,8448⟩) (.node (.single ⟨19328,19456,8192,8320⟩) (.single ⟨19328,19456,8320,8448⟩))))) (.node (.node (.node (.single ⟨24320,24448,13312,13440⟩) (.single ⟨24320,24384,13440,13504⟩)) (.node (.single ⟨24320,24352,13504,13536⟩) (.node (.single ⟨24320,24352,13536,13568⟩) (.single ⟨24352,24384,13504,13536⟩)))) (.node (.node (.single ⟨24352,24384,13536,13568⟩) (.single ⟨24384,24448,13440,13504⟩)) (.node (.single ⟨24384,24448,13504,13568⟩) (.node (.single ⟨24448,24576,13312,13440⟩) (.single ⟨24448,24576,13440,13568⟩)))))))
def output47 : Fin 40 → GridBox := outputData47.get
def coverData47 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 28) (.single 38)) (.node (.single 11) (.node (.single 9) (.single 29))))) (.node (.node (.node (.single 30) (.single 10)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 26) (.node (.single 36) (.single 13)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 23) (.single 33)))) (.node (.node (.single 16) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))))
def sourceData47 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover47 (i : Fin 40) : Fin 40 := ⟨coverData47.get i % 40, Nat.mod_lt _ (by decide)⟩
def source47 (i : Fin 40) : Fin 40 := ⟨sourceData47.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree47 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 (.cutY 18432 .empty (.cutX 9216 (.cutY 19456 (.cutX 8704 (.cutY 18944 .empty (.cutX 8448 (.cutY 19200 .empty (.cutX 8320 (.cutY 19328 .full .full) (.cutY 19328 (.cutX 8384 (.cutY 19264 .full .full) (.cutY 19264 (.cutX 8416 (.cutY 19232 .full .full) (.cutY 19232 .full .full)) .full)) .full))) .empty)) .empty) .empty) .empty)) .empty) .empty) (.cutY 20480 .empty (.cutX 14336 (.cutY 22528 .empty (.cutX 13312 .empty (.cutY 23552 .empty (.cutX 13824 (.cutY 24064 .empty (.cutX 13568 (.cutY 24320 .empty (.cutX 13440 (.cutY 24448 .full .full) (.cutY 24448 (.cutX 13504 (.cutY 24384 .full .full) (.cutY 24384 (.cutX 13536 (.cutY 24352 .full .full) (.cutY 24352 .full .full)) .full)) .full))) .empty)) .empty)))) .empty))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 .empty (.cutY 10240 (.cutX 19456 (.cutY 9216 (.cutX 18944 .empty (.cutY 8704 (.cutX 19200 .empty (.cutY 8448 (.cutX 19328 (.cutY 8320 .full (.cutX 19264 (.cutY 8384 .full (.cutX 19232 (.cutY 8416 .full .full) (.cutY 8416 .full .full))) (.cutY 8384 .full .full))) (.cutY 8320 .full .full)) .empty)) .empty)) .empty) .empty) .empty)) .empty) (.cutY 12288 .empty (.cutX 22528 .empty (.cutY 14336 (.cutX 23552 .empty (.cutY 13312 .empty (.cutX 24064 .empty (.cutY 13824 (.cutX 24320 .empty (.cutY 13568 (.cutX 24448 (.cutY 13440 .full (.cutX 24384 (.cutY 13504 .full (.cutX 24352 (.cutY 13536 .full .full) (.cutY 13536 .full .full))) (.cutY 13504 .full .full))) (.cutY 13440 .full .full)) .empty)) .empty)))) .empty))))) .empty) .empty))

theorem metadata47 : 0<167101800 ∧ 32<128 ∧ 75<128 ∧ 1<4 ∧
    7307/4160=1 ∧ 7307%4160=3147 ∧ ∀ i, (leaves47 i).Valid 8 := by
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

noncomputable def phaseMass47 : ℝ := singlePhaseMass (167101800/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw47 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass47_eq : phaseMass47 = (835509/8192000000 : ℝ) := by
  unfold phaseMass47
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw47 output47 cover47 source47
    (gridTreeUnionCheck_sound 32768 raw47 output47 cover47 source47 tree47 checked47)
    _ (by norm_num) _, areaUnits47]
  norm_num

-- Frozen phase 5027, atom 5716, type 1, source (13,61).
def leavesData48 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves48 : Fin 7 → DyadicLeaf := leavesData48.get
def raw48 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 13 61 leaves48 i
def outputData48 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3328,3456,15616,15744⟩) (.node (.single ⟨3328,3456,15744,15872⟩) (.single ⟨3456,3520,15616,15680⟩))) (.node (.node (.single ⟨3456,3520,15680,15744⟩) (.single ⟨3520,3584,15616,15680⟩)) (.node (.single ⟨3520,3584,15680,15744⟩) (.single ⟨3456,3584,15744,15872⟩)))) (.node (.node (.single ⟨15616,15744,3328,3456⟩) (.node (.single ⟨15616,15680,3456,3520⟩) (.single ⟨15616,15680,3520,3584⟩))) (.node (.node (.single ⟨15680,15744,3456,3520⟩) (.single ⟨15680,15744,3520,3584⟩)) (.node (.single ⟨15744,15872,3328,3456⟩) (.single ⟨15744,15872,3456,3584⟩))))) (.node (.node (.node (.single ⟨16896,17024,29184,29312⟩) (.node (.single ⟨16896,17024,29312,29440⟩) (.single ⟨17024,17088,29184,29248⟩))) (.node (.node (.single ⟨17024,17088,29248,29312⟩) (.single ⟨17088,17152,29184,29248⟩)) (.node (.single ⟨17088,17152,29248,29312⟩) (.single ⟨17024,17152,29312,29440⟩)))) (.node (.node (.single ⟨29184,29312,16896,17024⟩) (.node (.single ⟨29184,29248,17024,17088⟩) (.single ⟨29184,29248,17088,17152⟩))) (.node (.node (.single ⟨29248,29312,17024,17088⟩) (.single ⟨29248,29312,17088,17152⟩)) (.node (.single ⟨29312,29440,16896,17024⟩) (.single ⟨29312,29440,17024,17152⟩))))))
def output48 : Fin 28 → GridBox := outputData48.get
def coverData48 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData48 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover48 (i : Fin 28) : Fin 28 := ⟨coverData48.get i % 28, Nat.mod_lt _ (by decide)⟩
def source48 (i : Fin 28) : Fin 28 := ⟨sourceData48.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree48 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 .empty (.cutX 3072 .empty (.cutY 15360 .empty (.cutX 3584 (.cutY 15872 (.cutX 3328 .empty (.cutY 15616 .empty (.cutX 3456 (.cutY 15744 .full .full) (.cutY 15744 (.cutX 3520 (.cutY 15680 .full .full) (.cutY 15680 .full .full)) .full)))) .empty) .empty)))))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 .empty (.cutX 15360 .empty (.cutY 3072 .empty (.cutX 15872 (.cutY 3584 (.cutX 15616 .empty (.cutY 3328 .empty (.cutX 15744 (.cutY 3456 .full (.cutX 15680 (.cutY 3520 .full .full) (.cutY 3520 .full .full))) (.cutY 3456 .full .full)))) .empty) .empty))))) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 (.cutX 17408 (.cutY 29696 (.cutX 16896 .empty (.cutY 29184 .empty (.cutX 17152 (.cutY 29440 (.cutX 17024 (.cutY 29312 .full .full) (.cutY 29312 (.cutX 17088 (.cutY 29248 .full .full) (.cutY 29248 .full .full)) .full)) .empty) .empty))) .empty) .empty) .empty) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 (.cutX 29696 (.cutY 17408 (.cutX 29184 .empty (.cutY 16896 .empty (.cutX 29440 (.cutY 17152 (.cutX 29312 (.cutY 17024 .full (.cutX 29248 (.cutY 17088 .full .full) (.cutY 17088 .full .full))) (.cutY 17024 .full .full)) .empty) .empty))) .empty) .empty) .empty) .empty) .empty)) .empty))))

theorem metadata48 : 0<163200014 ∧ 13<128 ∧ 61<128 ∧ 1<4 ∧
    5716/4160=1 ∧ 5716%4160=1556 ∧ ∀ i, (leaves48 i).Valid 8 := by
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

noncomputable def phaseMass48 : ℝ := singlePhaseMass (163200014/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw48 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass48_eq : phaseMass48 = (81600007/819200000000 : ℝ) := by
  unfold phaseMass48
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw48 output48 cover48 source48
    (gridTreeUnionCheck_sound 32768 raw48 output48 cover48 source48 tree48 checked48)
    _ (by norm_num) _, areaUnits48]
  norm_num

-- Frozen phase 5028, atom 2403, type 0, source (22,71).
def leavesData49 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves49 : Fin 7 → DyadicLeaf := leavesData49.get
def raw49 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 22 71 leaves49 i
def outputData49 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨5632,5760,18176,18304⟩) (.node (.single ⟨5632,5760,18304,18432⟩) (.single ⟨5760,5824,18176,18240⟩))) (.node (.node (.single ⟨5760,5824,18240,18304⟩) (.single ⟨5824,5888,18176,18240⟩)) (.node (.single ⟨5824,5888,18240,18304⟩) (.single ⟨5760,5888,18304,18432⟩)))) (.node (.node (.single ⟨14336,14464,26880,27008⟩) (.node (.single ⟨14336,14464,27008,27136⟩) (.single ⟨14464,14528,26880,26944⟩))) (.node (.node (.single ⟨14464,14528,26944,27008⟩) (.single ⟨14528,14592,26880,26944⟩)) (.node (.single ⟨14528,14592,26944,27008⟩) (.single ⟨14464,14592,27008,27136⟩))))) (.node (.node (.node (.single ⟨18176,18304,5632,5760⟩) (.node (.single ⟨18176,18240,5760,5824⟩) (.single ⟨18176,18240,5824,5888⟩))) (.node (.node (.single ⟨18240,18304,5760,5824⟩) (.single ⟨18240,18304,5824,5888⟩)) (.node (.single ⟨18304,18432,5632,5760⟩) (.single ⟨18304,18432,5760,5888⟩)))) (.node (.node (.single ⟨26880,27008,14336,14464⟩) (.node (.single ⟨26880,26944,14464,14528⟩) (.single ⟨26880,26944,14528,14592⟩))) (.node (.node (.single ⟨26944,27008,14464,14528⟩) (.single ⟨26944,27008,14528,14592⟩)) (.node (.single ⟨27008,27136,14336,14464⟩) (.single ⟨27008,27136,14464,14592⟩))))))
def output49 : Fin 28 → GridBox := outputData49.get
def coverData49 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData49 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover49 (i : Fin 28) : Fin 28 := ⟨coverData49.get i % 28, Nat.mod_lt _ (by decide)⟩
def source49 (i : Fin 28) : Fin 28 := ⟨sourceData49.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree49 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 (.cutX 5120 .empty (.cutY 17408 .empty (.cutX 5632 .empty (.cutY 17920 .empty (.cutX 5888 (.cutY 18176 .empty (.cutX 5760 (.cutY 18304 .full .full) (.cutY 18304 (.cutX 5824 (.cutY 18240 .full .full) (.cutY 18240 .full .full)) .full))) .empty))))) .empty) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 .empty (.cutX 15360 (.cutY 27648 (.cutX 14848 (.cutY 27136 (.cutX 14592 (.cutY 26880 .empty (.cutX 14464 (.cutY 27008 .full .full) (.cutY 27008 (.cutX 14528 (.cutY 26944 .full .full) (.cutY 26944 .full .full)) .full))) .empty) .empty) .empty) .empty) .empty))) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 (.cutX 17408 .empty (.cutY 5120 .empty (.cutX 17920 .empty (.cutY 5632 .empty (.cutX 18176 .empty (.cutY 5888 (.cutX 18304 (.cutY 5760 .full (.cutX 18240 (.cutY 5824 .full .full) (.cutY 5824 .full .full))) (.cutY 5760 .full .full)) .empty)))))) .empty) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 .empty (.cutX 27648 (.cutY 15360 (.cutX 27136 (.cutY 14848 (.cutX 26880 .empty (.cutY 14592 (.cutX 27008 (.cutY 14464 .full (.cutX 26944 (.cutY 14528 .full .full) (.cutY 14528 .full .full))) (.cutY 14464 .full .full)) .empty)) .empty) .empty) .empty) .empty)))) .empty))) .empty))

theorem metadata49 : 0<191564598 ∧ 22<128 ∧ 71<128 ∧ 0<4 ∧
    2403/4160=0 ∧ 2403%4160=2403 ∧ ∀ i, (leaves49 i).Valid 8 := by
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

noncomputable def phaseMass49 : ℝ := singlePhaseMass (191564598/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw49 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass49_eq : phaseMass49 = (95782299/819200000000 : ℝ) := by
  unfold phaseMass49
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw49 output49 cover49 source49
    (gridTreeUnionCheck_sound 32768 raw49 output49 cover49 source49 tree49 checked49)
    _ (by norm_num) _, areaUnits49]
  norm_num

-- Frozen phase 5029, atom 7606, type 1, source (37,79).
def leavesData50 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves50 : Fin 7 → DyadicLeaf := leavesData50.get
def raw50 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 37 79 leaves50 i
def outputData50 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨9472,9600,20224,20352⟩) (.node (.single ⟨9472,9600,20352,20480⟩) (.single ⟨9600,9664,20224,20288⟩))) (.node (.node (.single ⟨9600,9664,20288,20352⟩) (.single ⟨9664,9728,20224,20288⟩)) (.node (.single ⟨9664,9728,20288,20352⟩) (.single ⟨9600,9728,20352,20480⟩)))) (.node (.node (.single ⟨12288,12416,23040,23168⟩) (.node (.single ⟨12288,12416,23168,23296⟩) (.single ⟨12416,12480,23040,23104⟩))) (.node (.node (.single ⟨12416,12480,23104,23168⟩) (.single ⟨12480,12544,23040,23104⟩)) (.node (.single ⟨12480,12544,23104,23168⟩) (.single ⟨12416,12544,23168,23296⟩))))) (.node (.node (.node (.single ⟨20224,20352,9472,9600⟩) (.node (.single ⟨20224,20288,9600,9664⟩) (.single ⟨20224,20288,9664,9728⟩))) (.node (.node (.single ⟨20288,20352,9600,9664⟩) (.single ⟨20288,20352,9664,9728⟩)) (.node (.single ⟨20352,20480,9472,9600⟩) (.single ⟨20352,20480,9600,9728⟩)))) (.node (.node (.single ⟨23040,23168,12288,12416⟩) (.node (.single ⟨23040,23104,12416,12480⟩) (.single ⟨23040,23104,12480,12544⟩))) (.node (.node (.single ⟨23104,23168,12416,12480⟩) (.single ⟨23104,23168,12480,12544⟩)) (.node (.single ⟨23168,23296,12288,12416⟩) (.single ⟨23168,23296,12416,12544⟩))))))
def output50 : Fin 28 → GridBox := outputData50.get
def coverData50 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData50 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover50 (i : Fin 28) : Fin 28 := ⟨coverData50.get i % 28, Nat.mod_lt _ (by decide)⟩
def source50 (i : Fin 28) : Fin 28 := ⟨sourceData50.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree50 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 (.cutY 18432 .empty (.cutX 9216 .empty (.cutY 19456 .empty (.cutX 9728 (.cutY 19968 .empty (.cutX 9472 .empty (.cutY 20224 .empty (.cutX 9600 (.cutY 20352 .full .full) (.cutY 20352 (.cutX 9664 (.cutY 20288 .full .full) (.cutY 20288 .full .full)) .full))))) .empty)))) .empty) .empty) (.cutY 20480 .empty (.cutX 14336 (.cutY 22528 .empty (.cutX 13312 (.cutY 23552 (.cutX 12800 (.cutY 23040 .empty (.cutX 12544 (.cutY 23296 (.cutX 12416 (.cutY 23168 .full .full) (.cutY 23168 (.cutX 12480 (.cutY 23104 .full .full) (.cutY 23104 .full .full)) .full)) .empty) .empty)) .empty) .empty) .empty)) .empty))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 .empty (.cutY 10240 (.cutX 19456 .empty (.cutY 9216 .empty (.cutX 19968 .empty (.cutY 9728 (.cutX 20224 .empty (.cutY 9472 .empty (.cutX 20352 (.cutY 9600 .full (.cutX 20288 (.cutY 9664 .full .full) (.cutY 9664 .full .full))) (.cutY 9600 .full .full)))) .empty)))) .empty)) .empty) (.cutY 12288 .empty (.cutX 22528 .empty (.cutY 14336 (.cutX 23552 (.cutY 13312 (.cutX 23040 .empty (.cutY 12800 (.cutX 23296 (.cutY 12544 (.cutX 23168 (.cutY 12416 .full (.cutX 23104 (.cutY 12480 .full .full) (.cutY 12480 .full .full))) (.cutY 12416 .full .full)) .empty) .empty) .empty)) .empty) .empty) .empty))))) .empty) .empty))

theorem metadata50 : 0<167101800 ∧ 37<128 ∧ 79<128 ∧ 1<4 ∧
    7606/4160=1 ∧ 7606%4160=3446 ∧ ∀ i, (leaves50 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData50).mp
    (by decide +kernel)

theorem sourceChecked50_0 : ∀ i : Fin 28,
    (fun i => output50 i = raw50 (source50 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked50 : ∀ i : Fin 28, (fun i => output50 i = raw50 (source50 i)) i :=
  forallFin_of_zero_offset (fun i => output50 i = raw50 (source50 i)) sourceChecked50_0

theorem coverChecked50_0 : ∀ i : Fin 28,
    (fun i => (output50 (cover50 i)).ContainsBox (raw50 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked50 : ∀ i : Fin 28, (fun i => (output50 (cover50 i)).ContainsBox (raw50 i)) i :=
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

noncomputable def phaseMass50 : ℝ := singlePhaseMass (167101800/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw50 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass50_eq : phaseMass50 = (835509/8192000000 : ℝ) := by
  unfold phaseMass50
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw50 output50 cover50 source50
    (gridTreeUnionCheck_sound 32768 raw50 output50 cover50 source50 tree50 checked50)
    _ (by norm_num) _, areaUnits50]
  norm_num

-- Frozen phase 5030, atom 6386, type 1, source (20,66).
def leavesData51 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves51 : Fin 10 → DyadicLeaf := leavesData51.get
def raw51 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 20 66 leaves51 i
def outputData51 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨5120,5248,16896,17024⟩) (.single ⟨5120,5248,17024,17152⟩)) (.node (.single ⟨5248,5312,16896,16960⟩) (.node (.single ⟨5248,5312,16960,17024⟩) (.single ⟨5312,5344,16896,16928⟩)))) (.node (.node (.single ⟨5312,5344,16928,16960⟩) (.single ⟨5344,5376,16896,16928⟩)) (.node (.single ⟨5344,5376,16928,16960⟩) (.node (.single ⟨5312,5376,16960,17024⟩) (.single ⟨5248,5376,17024,17152⟩))))) (.node (.node (.node (.single ⟨15616,15744,27392,27520⟩) (.single ⟨15616,15744,27520,27648⟩)) (.node (.single ⟨15744,15808,27392,27456⟩) (.node (.single ⟨15744,15808,27456,27520⟩) (.single ⟨15808,15840,27392,27424⟩)))) (.node (.node (.single ⟨15808,15840,27424,27456⟩) (.single ⟨15840,15872,27392,27424⟩)) (.node (.single ⟨15840,15872,27424,27456⟩) (.node (.single ⟨15808,15872,27456,27520⟩) (.single ⟨15744,15872,27520,27648⟩)))))) (.node (.node (.node (.node (.single ⟨16896,17024,5120,5248⟩) (.single ⟨16896,16960,5248,5312⟩)) (.node (.single ⟨16896,16928,5312,5344⟩) (.node (.single ⟨16896,16928,5344,5376⟩) (.single ⟨16928,16960,5312,5344⟩)))) (.node (.node (.single ⟨16928,16960,5344,5376⟩) (.single ⟨16960,17024,5248,5312⟩)) (.node (.single ⟨16960,17024,5312,5376⟩) (.node (.single ⟨17024,17152,5120,5248⟩) (.single ⟨17024,17152,5248,5376⟩))))) (.node (.node (.node (.single ⟨27392,27520,15616,15744⟩) (.single ⟨27392,27456,15744,15808⟩)) (.node (.single ⟨27392,27424,15808,15840⟩) (.node (.single ⟨27392,27424,15840,15872⟩) (.single ⟨27424,27456,15808,15840⟩)))) (.node (.node (.single ⟨27424,27456,15840,15872⟩) (.single ⟨27456,27520,15744,15808⟩)) (.node (.single ⟨27456,27520,15808,15872⟩) (.node (.single ⟨27520,27648,15616,15744⟩) (.single ⟨27520,27648,15744,15872⟩)))))))
def output51 : Fin 40 → GridBox := outputData51.get
def coverData51 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 28) (.single 38)) (.node (.single 11) (.node (.single 9) (.single 29))))) (.node (.node (.node (.single 30) (.single 10)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 26) (.node (.single 36) (.single 13)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 23) (.single 33)))) (.node (.node (.single 16) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))))
def sourceData51 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover51 (i : Fin 40) : Fin 40 := ⟨coverData51.get i % 40, Nat.mod_lt _ (by decide)⟩
def source51 (i : Fin 40) : Fin 40 := ⟨sourceData51.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree51 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 (.cutX 5120 .empty (.cutY 17408 (.cutX 5632 (.cutY 16896 .empty (.cutX 5376 (.cutY 17152 (.cutX 5248 (.cutY 17024 .full .full) (.cutY 17024 (.cutX 5312 (.cutY 16960 .full .full) (.cutY 16960 (.cutX 5344 (.cutY 16928 .full .full) (.cutY 16928 .full .full)) .full)) .full)) .empty) .empty)) .empty) .empty)) .empty) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 .empty (.cutX 15360 .empty (.cutY 27648 (.cutX 15872 (.cutY 27136 .empty (.cutX 15616 .empty (.cutY 27392 .empty (.cutX 15744 (.cutY 27520 .full .full) (.cutY 27520 (.cutX 15808 (.cutY 27456 .full .full) (.cutY 27456 (.cutX 15840 (.cutY 27424 .full .full) (.cutY 27424 .full .full)) .full)) .full))))) .empty) .empty)))) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 (.cutX 17408 (.cutY 5120 .empty (.cutX 16896 .empty (.cutY 5632 (.cutX 17152 (.cutY 5376 (.cutX 17024 (.cutY 5248 .full (.cutX 16960 (.cutY 5312 .full (.cutX 16928 (.cutY 5344 .full .full) (.cutY 5344 .full .full))) (.cutY 5312 .full .full))) (.cutY 5248 .full .full)) .empty) .empty) .empty))) .empty) .empty) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 .empty (.cutX 27648 (.cutY 15360 .empty (.cutX 27136 .empty (.cutY 15872 (.cutX 27392 .empty (.cutY 15616 .empty (.cutX 27520 (.cutY 15744 .full (.cutX 27456 (.cutY 15808 .full (.cutX 27424 (.cutY 15840 .full .full) (.cutY 15840 .full .full))) (.cutY 15808 .full .full))) (.cutY 15744 .full .full)))) .empty))) .empty)))) .empty))) .empty))

theorem metadata51 : 0<135260814 ∧ 20<128 ∧ 66<128 ∧ 1<4 ∧
    6386/4160=1 ∧ 6386%4160=2226 ∧ ∀ i, (leaves51 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData51).mp
    (by decide +kernel)

theorem sourceChecked51_0 : ∀ i : Fin 40,
    (fun i => output51 i = raw51 (source51 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked51 : ∀ i : Fin 40, (fun i => output51 i = raw51 (source51 i)) i :=
  forallFin_of_zero_offset (fun i => output51 i = raw51 (source51 i)) sourceChecked51_0

theorem coverChecked51_0 : ∀ i : Fin 40,
    (fun i => (output51 (cover51 i)).ContainsBox (raw51 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked51 : ∀ i : Fin 40, (fun i => (output51 (cover51 i)).ContainsBox (raw51 i)) i :=
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

-- Frozen phase 5031, atom 7032, type 1, source (28,72).
def leavesData52 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves52 : Fin 10 → DyadicLeaf := leavesData52.get
def raw52 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 28 72 leaves52 i
def outputData52 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨7168,7296,18432,18560⟩) (.single ⟨7168,7296,18560,18688⟩)) (.node (.single ⟨7296,7360,18432,18496⟩) (.node (.single ⟨7296,7360,18496,18560⟩) (.single ⟨7360,7392,18432,18464⟩)))) (.node (.node (.single ⟨7360,7392,18464,18496⟩) (.single ⟨7392,7424,18432,18464⟩)) (.node (.single ⟨7392,7424,18464,18496⟩) (.node (.single ⟨7360,7424,18496,18560⟩) (.single ⟨7296,7424,18560,18688⟩))))) (.node (.node (.node (.single ⟨14080,14208,25344,25472⟩) (.single ⟨14080,14208,25472,25600⟩)) (.node (.single ⟨14208,14272,25344,25408⟩) (.node (.single ⟨14208,14272,25408,25472⟩) (.single ⟨14272,14304,25344,25376⟩)))) (.node (.node (.single ⟨14272,14304,25376,25408⟩) (.single ⟨14304,14336,25344,25376⟩)) (.node (.single ⟨14304,14336,25376,25408⟩) (.node (.single ⟨14272,14336,25408,25472⟩) (.single ⟨14208,14336,25472,25600⟩)))))) (.node (.node (.node (.node (.single ⟨18432,18560,7168,7296⟩) (.single ⟨18432,18496,7296,7360⟩)) (.node (.single ⟨18432,18464,7360,7392⟩) (.node (.single ⟨18432,18464,7392,7424⟩) (.single ⟨18464,18496,7360,7392⟩)))) (.node (.node (.single ⟨18464,18496,7392,7424⟩) (.single ⟨18496,18560,7296,7360⟩)) (.node (.single ⟨18496,18560,7360,7424⟩) (.node (.single ⟨18560,18688,7168,7296⟩) (.single ⟨18560,18688,7296,7424⟩))))) (.node (.node (.node (.single ⟨25344,25472,14080,14208⟩) (.single ⟨25344,25408,14208,14272⟩)) (.node (.single ⟨25344,25376,14272,14304⟩) (.node (.single ⟨25344,25376,14304,14336⟩) (.single ⟨25376,25408,14272,14304⟩)))) (.node (.node (.single ⟨25376,25408,14304,14336⟩) (.single ⟨25408,25472,14208,14272⟩)) (.node (.single ⟨25408,25472,14272,14336⟩) (.node (.single ⟨25472,25600,14080,14208⟩) (.single ⟨25472,25600,14208,14336⟩)))))))
def output52 : Fin 40 → GridBox := outputData52.get
def coverData52 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 28) (.single 38)) (.node (.single 11) (.node (.single 9) (.single 29))))) (.node (.node (.node (.single 30) (.single 10)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 26) (.node (.single 36) (.single 13)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 23) (.single 33)))) (.node (.node (.single 16) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))))
def sourceData52 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover52 (i : Fin 40) : Fin 40 := ⟨coverData52.get i % 40, Nat.mod_lt _ (by decide)⟩
def source52 (i : Fin 40) : Fin 40 := ⟨sourceData52.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree52 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 .empty (.cutX 7168 .empty (.cutY 19456 (.cutX 7680 (.cutY 18944 (.cutX 7424 (.cutY 18688 (.cutX 7296 (.cutY 18560 .full .full) (.cutY 18560 (.cutX 7360 (.cutY 18496 .full .full) (.cutY 18496 (.cutX 7392 (.cutY 18464 .full .full) (.cutY 18464 .full .full)) .full)) .full)) .empty) .empty) .empty) .empty) .empty)))) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 (.cutX 13312 .empty (.cutY 25600 (.cutX 13824 .empty (.cutY 25088 .empty (.cutX 14080 .empty (.cutY 25344 .empty (.cutX 14208 (.cutY 25472 .full .full) (.cutY 25472 (.cutX 14272 (.cutY 25408 .full .full) (.cutY 25408 (.cutX 14304 (.cutY 25376 .full .full) (.cutY 25376 .full .full)) .full)) .full)))))) .empty)) .empty) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 .empty (.cutX 19456 (.cutY 7168 .empty (.cutX 18944 (.cutY 7680 (.cutX 18688 (.cutY 7424 (.cutX 18560 (.cutY 7296 .full (.cutX 18496 (.cutY 7360 .full (.cutX 18464 (.cutY 7392 .full .full) (.cutY 7392 .full .full))) (.cutY 7360 .full .full))) (.cutY 7296 .full .full)) .empty) .empty) .empty) .empty)) .empty)))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 (.cutX 25600 (.cutY 13312 .empty (.cutX 25088 .empty (.cutY 13824 .empty (.cutX 25344 .empty (.cutY 14080 .empty (.cutX 25472 (.cutY 14208 .full (.cutX 25408 (.cutY 14272 .full (.cutX 25376 (.cutY 14304 .full .full) (.cutY 14304 .full .full))) (.cutY 14272 .full .full))) (.cutY 14208 .full .full))))))) .empty) .empty) .empty)) .empty))) .empty))

theorem metadata52 : 0<140060506 ∧ 28<128 ∧ 72<128 ∧ 1<4 ∧
    7032/4160=1 ∧ 7032%4160=2872 ∧ ∀ i, (leaves52 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData52).mp
    (by decide +kernel)

theorem sourceChecked52_0 : ∀ i : Fin 40,
    (fun i => output52 i = raw52 (source52 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked52 : ∀ i : Fin 40, (fun i => output52 i = raw52 (source52 i)) i :=
  forallFin_of_zero_offset (fun i => output52 i = raw52 (source52 i)) sourceChecked52_0

theorem coverChecked52_0 : ∀ i : Fin 40,
    (fun i => (output52 (cover52 i)).ContainsBox (raw52 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked52 : ∀ i : Fin 40, (fun i => (output52 (cover52 i)).ContainsBox (raw52 i)) i :=
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

noncomputable def phaseMass52 : ℝ := singlePhaseMass (140060506/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw52 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass52_eq : phaseMass52 = (70030253/819200000000 : ℝ) := by
  unfold phaseMass52
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw52 output52 cover52 source52
    (gridTreeUnionCheck_sound 32768 raw52 output52 cover52 source52 tree52 checked52)
    _ (by norm_num) _, areaUnits52]
  norm_num

-- Frozen phase 5032, atom 6725, type 1, source (24,69).
def leavesData53 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves53 : Fin 13 → DyadicLeaf := leavesData53.get
def raw53 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 24 69 leaves53 i
def outputData53 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨6144,6208,17664,17728⟩) (.node (.single ⟨6144,6208,17728,17792⟩) (.single ⟨6208,6272,17664,17728⟩))) (.node (.single ⟨6208,6272,17728,17792⟩) (.node (.single ⟨6144,6272,17792,17920⟩) (.single ⟨6272,6336,17664,17728⟩)))) (.node (.node (.single ⟨6272,6336,17728,17792⟩) (.node (.single ⟨6336,6368,17664,17696⟩) (.single ⟨6336,6368,17696,17728⟩))) (.node (.node (.single ⟨6368,6400,17664,17696⟩) (.single ⟨6368,6400,17696,17728⟩)) (.node (.single ⟨6336,6400,17728,17792⟩) (.single ⟨6272,6400,17792,17920⟩))))) (.node (.node (.node (.single ⟨14848,14976,26368,26496⟩) (.node (.single ⟨14848,14976,26496,26624⟩) (.single ⟨14976,15040,26368,26432⟩))) (.node (.single ⟨14976,15040,26432,26496⟩) (.node (.single ⟨15040,15072,26368,26400⟩) (.single ⟨15040,15072,26400,26432⟩)))) (.node (.node (.single ⟨15072,15104,26368,26400⟩) (.node (.single ⟨15072,15104,26400,26432⟩) (.single ⟨15040,15104,26432,26496⟩))) (.node (.node (.single ⟨14976,15040,26496,26560⟩) (.single ⟨14976,15040,26560,26624⟩)) (.node (.single ⟨15040,15104,26496,26560⟩) (.single ⟨15040,15104,26560,26624⟩)))))) (.node (.node (.node (.node (.single ⟨17664,17728,6144,6208⟩) (.node (.single ⟨17664,17728,6208,6272⟩) (.single ⟨17728,17792,6144,6208⟩))) (.node (.single ⟨17728,17792,6208,6272⟩) (.node (.single ⟨17664,17728,6272,6336⟩) (.single ⟨17664,17696,6336,6368⟩)))) (.node (.node (.single ⟨17664,17696,6368,6400⟩) (.node (.single ⟨17696,17728,6336,6368⟩) (.single ⟨17696,17728,6368,6400⟩))) (.node (.node (.single ⟨17728,17792,6272,6336⟩) (.single ⟨17728,17792,6336,6400⟩)) (.node (.single ⟨17792,17920,6144,6272⟩) (.single ⟨17792,17920,6272,6400⟩))))) (.node (.node (.node (.single ⟨26368,26496,14848,14976⟩) (.node (.single ⟨26368,26432,14976,15040⟩) (.single ⟨26368,26400,15040,15072⟩))) (.node (.single ⟨26368,26400,15072,15104⟩) (.node (.single ⟨26400,26432,15040,15072⟩) (.single ⟨26400,26432,15072,15104⟩)))) (.node (.node (.single ⟨26432,26496,14976,15040⟩) (.node (.single ⟨26432,26496,15040,15104⟩) (.single ⟨26496,26624,14848,14976⟩))) (.node (.node (.single ⟨26496,26560,14976,15040⟩) (.single ⟨26496,26560,15040,15104⟩)) (.node (.single ⟨26560,26624,14976,15040⟩) (.single ⟨26560,26624,15040,15104⟩)))))))
def output53 : Fin 52 → GridBox := outputData53.get
def coverData53 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData53 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover53 (i : Fin 52) : Fin 52 := ⟨coverData53.get i % 52, Nat.mod_lt _ (by decide)⟩
def source53 (i : Fin 52) : Fin 52 := ⟨sourceData53.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree53 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 (.cutX 7168 (.cutY 17408 .empty (.cutX 6656 (.cutY 17920 (.cutX 6400 (.cutY 17664 .empty (.cutX 6272 (.cutY 17792 (.cutX 6208 (.cutY 17728 .full .full) (.cutY 17728 .full .full)) .full) (.cutY 17792 (.cutX 6336 (.cutY 17728 .full .full) (.cutY 17728 (.cutX 6368 (.cutY 17696 .full .full) (.cutY 17696 .full .full)) .full)) .full))) .empty) .empty) .empty)) .empty) .empty)) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 (.cutX 15360 (.cutY 25600 .empty (.cutX 14848 .empty (.cutY 26112 .empty (.cutX 15104 (.cutY 26368 .empty (.cutX 14976 (.cutY 26496 .full .full) (.cutY 26496 (.cutX 15040 (.cutY 26432 .full .full) (.cutY 26432 (.cutX 15072 (.cutY 26400 .full .full) (.cutY 26400 .full .full)) .full)) (.cutX 15040 (.cutY 26560 .full .full) (.cutY 26560 .full .full))))) .empty)))) .empty) .empty)) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 .empty (.cutX 17408 .empty (.cutY 7168 (.cutX 17920 (.cutY 6656 (.cutX 17664 .empty (.cutY 6400 (.cutX 17792 (.cutY 6272 (.cutX 17728 (.cutY 6208 .full .full) (.cutY 6208 .full .full)) (.cutX 17728 (.cutY 6336 .full (.cutX 17696 (.cutY 6368 .full .full) (.cutY 6368 .full .full))) (.cutY 6336 .full .full))) (.cutY 6272 .full .full)) .empty)) .empty) .empty) .empty))) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 .empty (.cutX 25600 .empty (.cutY 15360 (.cutX 26112 .empty (.cutY 14848 .empty (.cutX 26368 .empty (.cutY 15104 (.cutX 26496 (.cutY 14976 .full (.cutX 26432 (.cutY 15040 .full (.cutX 26400 (.cutY 15072 .full .full) (.cutY 15072 .full .full))) (.cutY 15040 .full .full))) (.cutY 14976 .full (.cutX 26560 (.cutY 15040 .full .full) (.cutY 15040 .full .full)))) .empty)))) .empty))) .empty)) .empty))) .empty))

theorem metadata53 : 0<175587969 ∧ 24<128 ∧ 69<128 ∧ 1<4 ∧
    6725/4160=1 ∧ 6725%4160=2565 ∧ ∀ i, (leaves53 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData53).mp
    (by decide +kernel)

theorem sourceChecked53_0 : ∀ i : Fin 52,
    (fun i => output53 i = raw53 (source53 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked53 : ∀ i : Fin 52, (fun i => output53 i = raw53 (source53 i)) i :=
  forallFin_of_zero_offset (fun i => output53 i = raw53 (source53 i)) sourceChecked53_0

theorem coverChecked53_0 : ∀ i : Fin 52,
    (fun i => (output53 (cover53 i)).ContainsBox (raw53 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked53 : ∀ i : Fin 52, (fun i => (output53 (cover53 i)).ContainsBox (raw53 i)) i :=
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

noncomputable def phaseMass53 : ℝ := singlePhaseMass (175587969/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw53 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass53_eq : phaseMass53 = (175587969/1638400000000 : ℝ) := by
  unfold phaseMass53
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw53 output53 cover53 source53
    (gridTreeUnionCheck_sound 32768 raw53 output53 cover53 source53 tree53 checked53)
    _ (by norm_num) _, areaUnits53]
  norm_num

-- Frozen phase 5033, atom 1661, type 0, source (14,65).
def leavesData54 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves54 : Fin 7 → DyadicLeaf := leavesData54.get
def raw54 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 14 65 leaves54 i
def outputData54 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3584,3712,16640,16768⟩) (.node (.single ⟨3584,3712,16768,16896⟩) (.single ⟨3712,3776,16640,16704⟩))) (.node (.node (.single ⟨3712,3776,16704,16768⟩) (.single ⟨3776,3840,16640,16704⟩)) (.node (.single ⟨3776,3840,16704,16768⟩) (.single ⟨3712,3840,16768,16896⟩)))) (.node (.node (.single ⟨15872,16000,28928,29056⟩) (.node (.single ⟨15872,16000,29056,29184⟩) (.single ⟨16000,16064,28928,28992⟩))) (.node (.node (.single ⟨16000,16064,28992,29056⟩) (.single ⟨16064,16128,28928,28992⟩)) (.node (.single ⟨16064,16128,28992,29056⟩) (.single ⟨16000,16128,29056,29184⟩))))) (.node (.node (.node (.single ⟨16640,16768,3584,3712⟩) (.node (.single ⟨16640,16704,3712,3776⟩) (.single ⟨16640,16704,3776,3840⟩))) (.node (.node (.single ⟨16704,16768,3712,3776⟩) (.single ⟨16704,16768,3776,3840⟩)) (.node (.single ⟨16768,16896,3584,3712⟩) (.single ⟨16768,16896,3712,3840⟩)))) (.node (.node (.single ⟨28928,29056,15872,16000⟩) (.node (.single ⟨28928,28992,16000,16064⟩) (.single ⟨28928,28992,16064,16128⟩))) (.node (.node (.single ⟨28992,29056,16000,16064⟩) (.single ⟨28992,29056,16064,16128⟩)) (.node (.single ⟨29056,29184,15872,16000⟩) (.single ⟨29056,29184,16000,16128⟩))))))
def output54 : Fin 28 → GridBox := outputData54.get
def coverData54 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData54 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover54 (i : Fin 28) : Fin 28 := ⟨coverData54.get i % 28, Nat.mod_lt _ (by decide)⟩
def source54 (i : Fin 28) : Fin 28 := ⟨sourceData54.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree54 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 (.cutX 3072 .empty (.cutY 17408 (.cutX 3584 .empty (.cutY 16896 (.cutX 3840 (.cutY 16640 .empty (.cutX 3712 (.cutY 16768 .full .full) (.cutY 16768 (.cutX 3776 (.cutY 16704 .full .full) (.cutY 16704 .full .full)) .full))) .empty) .empty)) .empty)) .empty)) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 (.cutX 15360 .empty (.cutY 29696 (.cutX 15872 .empty (.cutY 29184 (.cutX 16128 (.cutY 28928 .empty (.cutX 16000 (.cutY 29056 .full .full) (.cutY 29056 (.cutX 16064 (.cutY 28992 .full .full) (.cutY 28992 .full .full)) .full))) .empty) .empty)) .empty)) .empty))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 .empty (.cutX 17408 (.cutY 3072 .empty (.cutX 16896 (.cutY 3584 .empty (.cutX 16640 .empty (.cutY 3840 (.cutX 16768 (.cutY 3712 .full (.cutX 16704 (.cutY 3776 .full .full) (.cutY 3776 .full .full))) (.cutY 3712 .full .full)) .empty))) .empty)) .empty)) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 .empty (.cutX 29696 (.cutY 15360 .empty (.cutX 29184 (.cutY 15872 .empty (.cutX 28928 .empty (.cutY 16128 (.cutX 29056 (.cutY 16000 .full (.cutX 28992 (.cutY 16064 .full .full) (.cutY 16064 .full .full))) (.cutY 16000 .full .full)) .empty))) .empty)) .empty)) .empty))))) .empty))

theorem metadata54 : 0<67702166 ∧ 14<128 ∧ 65<128 ∧ 0<4 ∧
    1661/4160=0 ∧ 1661%4160=1661 ∧ ∀ i, (leaves54 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData54).mp
    (by decide +kernel)

theorem sourceChecked54_0 : ∀ i : Fin 28,
    (fun i => output54 i = raw54 (source54 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked54 : ∀ i : Fin 28, (fun i => output54 i = raw54 (source54 i)) i :=
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

theorem areaUnits54 : gridUnionAreaUnits output54 = 262144 := by decide +kernel

noncomputable def phaseMass54 : ℝ := singlePhaseMass (67702166/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw54 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass54_eq : phaseMass54 = (33851083/819200000000 : ℝ) := by
  unfold phaseMass54
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw54 output54 cover54 source54
    (gridTreeUnionCheck_sound 32768 raw54 output54 cover54 source54 tree54 checked54)
    _ (by norm_num) _, areaUnits54]
  norm_num

-- Frozen phase 5034, atom 7898, type 1, source (43,83).
def leavesData55 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩)))) (.node (.node (.single ⟨3,6,0⟩) (.node (.single ⟨3,6,1⟩) (.single ⟨3,7,1⟩))) (.node (.node (.single ⟨4,14,0⟩) (.single ⟨4,14,1⟩)) (.node (.single ⟨4,15,0⟩) (.single ⟨4,15,1⟩)))))
def leaves55 : Fin 13 → DyadicLeaf := leavesData55.get
def raw55 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 43 83 leaves55 i
def outputData55 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨11008,11136,21248,21376⟩) (.node (.single ⟨11008,11136,21376,21504⟩) (.single ⟨11136,11200,21248,21312⟩))) (.node (.single ⟨11136,11200,21312,21376⟩) (.node (.single ⟨11200,11232,21248,21280⟩) (.single ⟨11200,11232,21280,21312⟩)))) (.node (.node (.single ⟨11232,11248,21248,21264⟩) (.node (.single ⟨11232,11248,21264,21280⟩) (.single ⟨11248,11264,21248,21264⟩))) (.node (.node (.single ⟨11248,11264,21264,21280⟩) (.single ⟨11232,11264,21280,21312⟩)) (.node (.single ⟨11200,11264,21312,21376⟩) (.single ⟨11136,11264,21376,21504⟩))))) (.node (.node (.node (.single ⟨11264,11392,21504,21632⟩) (.node (.single ⟨11264,11392,21632,21760⟩) (.single ⟨11392,11456,21504,21568⟩))) (.node (.single ⟨11392,11456,21568,21632⟩) (.node (.single ⟨11456,11488,21504,21536⟩) (.single ⟨11456,11488,21536,21568⟩)))) (.node (.node (.single ⟨11488,11504,21504,21520⟩) (.node (.single ⟨11488,11504,21520,21536⟩) (.single ⟨11504,11520,21504,21520⟩))) (.node (.node (.single ⟨11504,11520,21520,21536⟩) (.single ⟨11488,11520,21536,21568⟩)) (.node (.single ⟨11456,11520,21568,21632⟩) (.single ⟨11392,11520,21632,21760⟩)))))) (.node (.node (.node (.node (.single ⟨21248,21376,11008,11136⟩) (.node (.single ⟨21248,21312,11136,11200⟩) (.single ⟨21248,21280,11200,11232⟩))) (.node (.single ⟨21248,21264,11232,11248⟩) (.node (.single ⟨21248,21264,11248,11264⟩) (.single ⟨21264,21280,11232,11248⟩)))) (.node (.node (.single ⟨21264,21280,11248,11264⟩) (.node (.single ⟨21280,21312,11200,11232⟩) (.single ⟨21280,21312,11232,11264⟩))) (.node (.node (.single ⟨21312,21376,11136,11200⟩) (.single ⟨21312,21376,11200,11264⟩)) (.node (.single ⟨21376,21504,11008,11136⟩) (.single ⟨21376,21504,11136,11264⟩))))) (.node (.node (.node (.single ⟨21504,21632,11264,11392⟩) (.node (.single ⟨21504,21568,11392,11456⟩) (.single ⟨21504,21536,11456,11488⟩))) (.node (.single ⟨21504,21520,11488,11504⟩) (.node (.single ⟨21504,21520,11504,11520⟩) (.single ⟨21520,21536,11488,11504⟩)))) (.node (.node (.single ⟨21520,21536,11504,11520⟩) (.node (.single ⟨21536,21568,11456,11488⟩) (.single ⟨21536,21568,11488,11520⟩))) (.node (.node (.single ⟨21568,21632,11392,11456⟩) (.single ⟨21568,21632,11456,11520⟩)) (.node (.single ⟨21632,21760,11264,11392⟩) (.single ⟨21632,21760,11392,11520⟩)))))))
def output55 : Fin 52 → GridBox := outputData55.get
def coverData55 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 0) (.node (.single 26) (.single 51))) (.node (.single 25) (.node (.single 1) (.single 37)))) (.node (.node (.single 50) (.node (.single 14) (.single 12))) (.node (.node (.single 38) (.single 39)) (.node (.single 13) (.single 2))))) (.node (.node (.node (.single 27) (.node (.single 49) (.single 24))) (.node (.single 3) (.node (.single 35) (.single 48)))) (.node (.node (.single 16) (.node (.single 11) (.single 36))) (.node (.node (.single 40) (.single 15)) (.node (.single 4) (.single 28)))))) (.node (.node (.node (.node (.single 47) (.node (.single 23) (.single 5))) (.node (.single 33) (.node (.single 46) (.single 18)))) (.node (.node (.single 10) (.node (.single 34) (.single 41))) (.node (.node (.single 17) (.single 6)) (.node (.single 29) (.single 45))))) (.node (.node (.node (.single 22) (.node (.single 7) (.single 31))) (.node (.single 44) (.node (.single 20) (.single 8)))) (.node (.node (.single 30) (.node (.single 43) (.single 21))) (.node (.node (.single 9) (.single 32)) (.node (.single 42) (.single 19)))))))
def sourceData55 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.single 16) (.node (.single 24) (.single 28)))) (.node (.node (.single 36) (.node (.single 40) (.single 44))) (.node (.node (.single 48) (.single 32)) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 23))) (.node (.single 19) (.node (.single 35) (.single 31)))) (.node (.node (.single 51) (.node (.single 43) (.single 47))) (.node (.node (.single 39) (.single 27)) (.node (.single 15) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.node (.single 13) (.single 25))) (.node (.single 37) (.node (.single 45) (.single 41)))) (.node (.node (.single 49) (.node (.single 29) (.single 33))) (.node (.node (.single 17) (.single 21)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 10) (.node (.single 22) (.single 34))) (.node (.single 50) (.node (.single 46) (.single 42)))) (.node (.node (.single 38) (.node (.single 30) (.single 26))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2)))))))
def cover55 (i : Fin 52) : Fin 52 := ⟨coverData55.get i % 52, Nat.mod_lt _ (by decide)⟩
def source55 (i : Fin 52) : Fin 52 := ⟨sourceData55.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree55 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 .empty (.cutY 22528 (.cutX 11264 (.cutY 21504 (.cutX 10752 .empty (.cutY 20992 .empty (.cutX 11008 .empty (.cutY 21248 .empty (.cutX 11136 (.cutY 21376 .full .full) (.cutY 21376 (.cutX 11200 (.cutY 21312 .full .full) (.cutY 21312 (.cutX 11232 (.cutY 21280 .full .full) (.cutY 21280 (.cutX 11248 (.cutY 21264 .full .full) (.cutY 21264 .full .full)) .full)) .full)) .full)))))) .empty) (.cutY 21504 .empty (.cutX 11776 (.cutY 22016 (.cutX 11520 (.cutY 21760 (.cutX 11392 (.cutY 21632 .full .full) (.cutY 21632 (.cutX 11456 (.cutY 21568 .full .full) (.cutY 21568 (.cutX 11488 (.cutY 21536 .full .full) (.cutY 21536 (.cutX 11504 (.cutY 21520 .full .full) (.cutY 21520 .full .full)) .full)) .full)) .full)) .empty) .empty) .empty) .empty))) .empty))) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 (.cutY 10240 .empty (.cutX 21504 (.cutY 11264 (.cutX 20992 .empty (.cutY 10752 .empty (.cutX 21248 .empty (.cutY 11008 .empty (.cutX 21376 (.cutY 11136 .full (.cutX 21312 (.cutY 11200 .full (.cutX 21280 (.cutY 11232 .full (.cutX 21264 (.cutY 11248 .full .full) (.cutY 11248 .full .full))) (.cutY 11232 .full .full))) (.cutY 11200 .full .full))) (.cutY 11136 .full .full)))))) .empty) (.cutY 11264 .empty (.cutX 22016 (.cutY 11776 (.cutX 21760 (.cutY 11520 (.cutX 21632 (.cutY 11392 .full (.cutX 21568 (.cutY 11456 .full (.cutX 21536 (.cutY 11488 .full (.cutX 21520 (.cutY 11504 .full .full) (.cutY 11504 .full .full))) (.cutY 11488 .full .full))) (.cutY 11456 .full .full))) (.cutY 11392 .full .full)) .empty) .empty) .empty) .empty)))) .empty) .empty))) .empty) .empty))

theorem metadata55 : 0<56923454 ∧ 43<128 ∧ 83<128 ∧ 1<4 ∧
    7898/4160=1 ∧ 7898%4160=3738 ∧ ∀ i, (leaves55 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData55).mp
    (by decide +kernel)

theorem sourceChecked55_0 : ∀ i : Fin 52,
    (fun i => output55 i = raw55 (source55 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked55 : ∀ i : Fin 52, (fun i => output55 i = raw55 (source55 i)) i :=
  forallFin_of_zero_offset (fun i => output55 i = raw55 (source55 i)) sourceChecked55_0

theorem coverChecked55_0 : ∀ i : Fin 52,
    (fun i => (output55 (cover55 i)).ContainsBox (raw55 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked55 : ∀ i : Fin 52, (fun i => (output55 (cover55 i)).ContainsBox (raw55 i)) i :=
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

noncomputable def phaseMass55 : ℝ := singlePhaseMass (56923454/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw55 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass55_eq : phaseMass55 = (28461727/819200000000 : ℝ) := by
  unfold phaseMass55
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw55 output55 cover55 source55
    (gridTreeUnionCheck_sound 32768 raw55 output55 cover55 source55 tree55 checked55)
    _ (by norm_num) _, areaUnits55]
  norm_num

-- Frozen phase 5035, atom 3214, type 0, source (33,79).
def leavesData56 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves56 : Fin 4 → DyadicLeaf := leavesData56.get
def raw56 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 33 79 leaves56 i
def outputData56 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨8448,8576,20224,20352⟩) (.single ⟨8448,8576,20352,20480⟩)) (.node (.single ⟨8576,8704,20224,20352⟩) (.single ⟨8576,8704,20352,20480⟩))) (.node (.node (.single ⟨12288,12416,24064,24192⟩) (.single ⟨12288,12416,24192,24320⟩)) (.node (.single ⟨12416,12544,24064,24192⟩) (.single ⟨12416,12544,24192,24320⟩)))) (.node (.node (.node (.single ⟨20224,20352,8448,8576⟩) (.single ⟨20224,20352,8576,8704⟩)) (.node (.single ⟨20352,20480,8448,8576⟩) (.single ⟨20352,20480,8576,8704⟩))) (.node (.node (.single ⟨24064,24192,12288,12416⟩) (.single ⟨24064,24192,12416,12544⟩)) (.node (.single ⟨24192,24320,12288,12416⟩) (.single ⟨24192,24320,12416,12544⟩)))))
def output56 : Fin 16 → GridBox := outputData56.get
def coverData56 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData56 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover56 (i : Fin 16) : Fin 16 := ⟨coverData56.get i % 16, Nat.mod_lt _ (by decide)⟩
def source56 (i : Fin 16) : Fin 16 := ⟨sourceData56.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree56 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 (.cutY 18432 .empty (.cutX 9216 (.cutY 19456 .empty (.cutX 8704 (.cutY 19968 .empty (.cutX 8448 .empty (.cutY 20224 .empty (.cutX 8576 (.cutY 20352 .full .full) (.cutY 20352 .full .full))))) .empty)) .empty)) .empty) .empty) (.cutY 20480 .empty (.cutX 14336 (.cutY 22528 .empty (.cutX 13312 (.cutY 23552 .empty (.cutX 12800 (.cutY 24064 .empty (.cutX 12544 (.cutY 24320 (.cutX 12416 (.cutY 24192 .full .full) (.cutY 24192 .full .full)) .empty) .empty)) .empty)) .empty)) .empty))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 .empty (.cutY 10240 (.cutX 19456 .empty (.cutY 9216 (.cutX 19968 .empty (.cutY 8704 (.cutX 20224 .empty (.cutY 8448 .empty (.cutX 20352 (.cutY 8576 .full .full) (.cutY 8576 .full .full)))) .empty)) .empty)) .empty)) .empty) (.cutY 12288 .empty (.cutX 22528 .empty (.cutY 14336 (.cutX 23552 .empty (.cutY 13312 (.cutX 24064 .empty (.cutY 12800 (.cutX 24320 (.cutY 12544 (.cutX 24192 (.cutY 12416 .full .full) (.cutY 12416 .full .full)) .empty) .empty) .empty)) .empty)) .empty))))) .empty) .empty))

theorem metadata56 : 0<109574533 ∧ 33<128 ∧ 79<128 ∧ 0<4 ∧
    3214/4160=0 ∧ 3214%4160=3214 ∧ ∀ i, (leaves56 i).Valid 8 := by
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

noncomputable def phaseMass56 : ℝ := singlePhaseMass (109574533/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw56 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass56_eq : phaseMass56 = (109574533/1638400000000 : ℝ) := by
  unfold phaseMass56
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw56 output56 cover56 source56
    (gridTreeUnionCheck_sound 32768 raw56 output56 cover56 source56 tree56 checked56)
    _ (by norm_num) _, areaUnits56]
  norm_num

-- Frozen phase 5036, atom 3276, type 0, source (34,80).
def leavesData57 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves57 : Fin 4 → DyadicLeaf := leavesData57.get
def raw57 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 34 80 leaves57 i
def outputData57 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨8704,8832,20480,20608⟩) (.single ⟨8704,8832,20608,20736⟩)) (.node (.single ⟨8832,8960,20480,20608⟩) (.single ⟨8832,8960,20608,20736⟩))) (.node (.node (.single ⟨12032,12160,23808,23936⟩) (.single ⟨12032,12160,23936,24064⟩)) (.node (.single ⟨12160,12288,23808,23936⟩) (.single ⟨12160,12288,23936,24064⟩)))) (.node (.node (.node (.single ⟨20480,20608,8704,8832⟩) (.single ⟨20480,20608,8832,8960⟩)) (.node (.single ⟨20608,20736,8704,8832⟩) (.single ⟨20608,20736,8832,8960⟩))) (.node (.node (.single ⟨23808,23936,12032,12160⟩) (.single ⟨23808,23936,12160,12288⟩)) (.node (.single ⟨23936,24064,12032,12160⟩) (.single ⟨23936,24064,12160,12288⟩)))))
def output57 : Fin 16 → GridBox := outputData57.get
def coverData57 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData57 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover57 (i : Fin 16) : Fin 16 := ⟨coverData57.get i % 16, Nat.mod_lt _ (by decide)⟩
def source57 (i : Fin 16) : Fin 16 := ⟨sourceData57.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree57 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 (.cutX 9216 (.cutY 21504 (.cutX 8704 .empty (.cutY 20992 (.cutX 8960 (.cutY 20736 (.cutX 8832 (.cutY 20608 .full .full) (.cutY 20608 .full .full)) .empty) .empty) .empty)) .empty) .empty) .empty) (.cutY 22528 .empty (.cutX 11264 .empty (.cutY 23552 .empty (.cutX 11776 .empty (.cutY 24064 (.cutX 12032 .empty (.cutY 23808 .empty (.cutX 12160 (.cutY 23936 .full .full) (.cutY 23936 .full .full)))) .empty))))))) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 (.cutY 10240 (.cutX 21504 (.cutY 9216 (.cutX 20992 (.cutY 8704 .empty (.cutX 20736 (.cutY 8960 (.cutX 20608 (.cutY 8832 .full .full) (.cutY 8832 .full .full)) .empty) .empty)) .empty) .empty) .empty) .empty) (.cutY 10240 .empty (.cutX 23552 .empty (.cutY 11264 .empty (.cutX 24064 (.cutY 11776 .empty (.cutX 23808 .empty (.cutY 12032 .empty (.cutX 23936 (.cutY 12160 .full .full) (.cutY 12160 .full .full))))) .empty))))) .empty))) .empty) .empty))

theorem metadata57 : 0<167980383 ∧ 34<128 ∧ 80<128 ∧ 0<4 ∧
    3276/4160=0 ∧ 3276%4160=3276 ∧ ∀ i, (leaves57 i).Valid 8 := by
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

noncomputable def phaseMass57 : ℝ := singlePhaseMass (167980383/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw57 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass57_eq : phaseMass57 = (167980383/1638400000000 : ℝ) := by
  unfold phaseMass57
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw57 output57 cover57 source57
    (gridTreeUnionCheck_sound 32768 raw57 output57 cover57 source57 tree57 checked57)
    _ (by norm_num) _, areaUnits57]
  norm_num

-- Frozen phase 5037, atom 7371, type 1, source (33,76).
def leavesData58 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves58 : Fin 7 → DyadicLeaf := leavesData58.get
def raw58 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 33 76 leaves58 i
def outputData58 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨8448,8576,19456,19584⟩) (.node (.single ⟨8448,8576,19584,19712⟩) (.single ⟨8576,8640,19456,19520⟩))) (.node (.node (.single ⟨8576,8640,19520,19584⟩) (.single ⟨8640,8704,19456,19520⟩)) (.node (.single ⟨8640,8704,19520,19584⟩) (.single ⟨8576,8704,19584,19712⟩)))) (.node (.node (.single ⟨13056,13184,24064,24192⟩) (.node (.single ⟨13056,13184,24192,24320⟩) (.single ⟨13184,13248,24064,24128⟩))) (.node (.node (.single ⟨13184,13248,24128,24192⟩) (.single ⟨13248,13312,24064,24128⟩)) (.node (.single ⟨13248,13312,24128,24192⟩) (.single ⟨13184,13312,24192,24320⟩))))) (.node (.node (.node (.single ⟨19456,19584,8448,8576⟩) (.node (.single ⟨19456,19520,8576,8640⟩) (.single ⟨19456,19520,8640,8704⟩))) (.node (.node (.single ⟨19520,19584,8576,8640⟩) (.single ⟨19520,19584,8640,8704⟩)) (.node (.single ⟨19584,19712,8448,8576⟩) (.single ⟨19584,19712,8576,8704⟩)))) (.node (.node (.single ⟨24064,24192,13056,13184⟩) (.node (.single ⟨24064,24128,13184,13248⟩) (.single ⟨24064,24128,13248,13312⟩))) (.node (.node (.single ⟨24128,24192,13184,13248⟩) (.single ⟨24128,24192,13248,13312⟩)) (.node (.single ⟨24192,24320,13056,13184⟩) (.single ⟨24192,24320,13184,13312⟩))))))
def output58 : Fin 28 → GridBox := outputData58.get
def coverData58 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData58 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover58 (i : Fin 28) : Fin 28 := ⟨coverData58.get i % 28, Nat.mod_lt _ (by decide)⟩
def source58 (i : Fin 28) : Fin 28 := ⟨sourceData58.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree58 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 (.cutY 18432 .empty (.cutX 9216 (.cutY 19456 .empty (.cutX 8704 (.cutY 19968 (.cutX 8448 .empty (.cutY 19712 (.cutX 8576 (.cutY 19584 .full .full) (.cutY 19584 (.cutX 8640 (.cutY 19520 .full .full) (.cutY 19520 .full .full)) .full)) .empty)) .empty) .empty)) .empty)) .empty) .empty) (.cutY 20480 .empty (.cutX 14336 (.cutY 22528 .empty (.cutX 13312 (.cutY 23552 .empty (.cutX 12800 .empty (.cutY 24064 .empty (.cutX 13056 .empty (.cutY 24320 (.cutX 13184 (.cutY 24192 .full .full) (.cutY 24192 (.cutX 13248 (.cutY 24128 .full .full) (.cutY 24128 .full .full)) .full)) .empty))))) .empty)) .empty))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 .empty (.cutY 10240 (.cutX 19456 .empty (.cutY 9216 (.cutX 19968 (.cutY 8704 (.cutX 19712 (.cutY 8448 .empty (.cutX 19584 (.cutY 8576 .full (.cutX 19520 (.cutY 8640 .full .full) (.cutY 8640 .full .full))) (.cutY 8576 .full .full))) .empty) .empty) .empty) .empty)) .empty)) .empty) (.cutY 12288 .empty (.cutX 22528 .empty (.cutY 14336 (.cutX 23552 .empty (.cutY 13312 (.cutX 24064 .empty (.cutY 12800 .empty (.cutX 24320 (.cutY 13056 .empty (.cutX 24192 (.cutY 13184 .full (.cutX 24128 (.cutY 13248 .full .full) (.cutY 13248 .full .full))) (.cutY 13184 .full .full))) .empty))) .empty)) .empty))))) .empty) .empty))

theorem metadata58 : 0<167101800 ∧ 33<128 ∧ 76<128 ∧ 1<4 ∧
    7371/4160=1 ∧ 7371%4160=3211 ∧ ∀ i, (leaves58 i).Valid 8 := by
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

noncomputable def phaseMass58 : ℝ := singlePhaseMass (167101800/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw58 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass58_eq : phaseMass58 = (835509/8192000000 : ℝ) := by
  unfold phaseMass58
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw58 output58 cover58 source58
    (gridTreeUnionCheck_sound 32768 raw58 output58 cover58 source58 tree58 checked58)
    _ (by norm_num) _, areaUnits58]
  norm_num

-- Frozen phase 5038, atom 6111, type 1, source (17,64).
def leavesData59 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves59 : Fin 10 → DyadicLeaf := leavesData59.get
def raw59 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 17 64 leaves59 i
def outputData59 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨4352,4480,16384,16512⟩) (.single ⟨4352,4480,16512,16640⟩)) (.node (.single ⟨4480,4544,16384,16448⟩) (.node (.single ⟨4480,4544,16448,16512⟩) (.single ⟨4544,4576,16384,16416⟩)))) (.node (.node (.single ⟨4544,4576,16416,16448⟩) (.single ⟨4576,4608,16384,16416⟩)) (.node (.single ⟨4576,4608,16416,16448⟩) (.node (.single ⟨4544,4608,16448,16512⟩) (.single ⟨4480,4608,16512,16640⟩))))) (.node (.node (.node (.single ⟨16128,16256,28160,28288⟩) (.single ⟨16128,16256,28288,28416⟩)) (.node (.single ⟨16256,16320,28160,28224⟩) (.node (.single ⟨16256,16320,28224,28288⟩) (.single ⟨16320,16352,28160,28192⟩)))) (.node (.node (.single ⟨16320,16352,28192,28224⟩) (.single ⟨16352,16384,28160,28192⟩)) (.node (.single ⟨16352,16384,28192,28224⟩) (.node (.single ⟨16320,16384,28224,28288⟩) (.single ⟨16256,16384,28288,28416⟩)))))) (.node (.node (.node (.node (.single ⟨16384,16512,4352,4480⟩) (.single ⟨16384,16448,4480,4544⟩)) (.node (.single ⟨16384,16416,4544,4576⟩) (.node (.single ⟨16384,16416,4576,4608⟩) (.single ⟨16416,16448,4544,4576⟩)))) (.node (.node (.single ⟨16416,16448,4576,4608⟩) (.single ⟨16448,16512,4480,4544⟩)) (.node (.single ⟨16448,16512,4544,4608⟩) (.node (.single ⟨16512,16640,4352,4480⟩) (.single ⟨16512,16640,4480,4608⟩))))) (.node (.node (.node (.single ⟨28160,28288,16128,16256⟩) (.single ⟨28160,28224,16256,16320⟩)) (.node (.single ⟨28160,28192,16320,16352⟩) (.node (.single ⟨28160,28192,16352,16384⟩) (.single ⟨28192,28224,16320,16352⟩)))) (.node (.node (.single ⟨28192,28224,16352,16384⟩) (.single ⟨28224,28288,16256,16320⟩)) (.node (.single ⟨28224,28288,16320,16384⟩) (.node (.single ⟨28288,28416,16128,16256⟩) (.single ⟨28288,28416,16256,16384⟩)))))))
def output59 : Fin 40 → GridBox := outputData59.get
def coverData59 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 28) (.single 38)) (.node (.single 11) (.node (.single 9) (.single 29))))) (.node (.node (.node (.single 30) (.single 10)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 26) (.node (.single 36) (.single 13)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 23) (.single 33)))) (.node (.node (.single 16) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))))
def sourceData59 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover59 (i : Fin 40) : Fin 40 := ⟨coverData59.get i % 40, Nat.mod_lt _ (by decide)⟩
def source59 (i : Fin 40) : Fin 40 := ⟨sourceData59.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree59 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 (.cutX 5120 (.cutY 17408 (.cutX 4608 (.cutY 16896 (.cutX 4352 .empty (.cutY 16640 (.cutX 4480 (.cutY 16512 .full .full) (.cutY 16512 (.cutX 4544 (.cutY 16448 .full .full) (.cutY 16448 (.cutX 4576 (.cutY 16416 .full .full) (.cutY 16416 .full .full)) .full)) .full)) .empty)) .empty) .empty) .empty) .empty) .empty) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 .empty (.cutX 15360 .empty (.cutY 27648 .empty (.cutX 15872 .empty (.cutY 28160 .empty (.cutX 16128 .empty (.cutY 28416 (.cutX 16256 (.cutY 28288 .full .full) (.cutY 28288 (.cutX 16320 (.cutY 28224 .full .full) (.cutY 28224 (.cutX 16352 (.cutY 28192 .full .full) (.cutY 28192 .full .full)) .full)) .full)) .empty)))))))) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 (.cutX 17408 (.cutY 5120 (.cutX 16896 (.cutY 4608 (.cutX 16640 (.cutY 4352 .empty (.cutX 16512 (.cutY 4480 .full (.cutX 16448 (.cutY 4544 .full (.cutX 16416 (.cutY 4576 .full .full) (.cutY 4576 .full .full))) (.cutY 4544 .full .full))) (.cutY 4480 .full .full))) .empty) .empty) .empty) .empty) .empty) .empty) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 .empty (.cutX 27648 .empty (.cutY 15360 .empty (.cutX 28160 .empty (.cutY 15872 .empty (.cutX 28416 (.cutY 16128 .empty (.cutX 28288 (.cutY 16256 .full (.cutX 28224 (.cutY 16320 .full (.cutX 28192 (.cutY 16352 .full .full) (.cutY 16352 .full .full))) (.cutY 16320 .full .full))) (.cutY 16256 .full .full))) .empty)))))))) .empty))) .empty))

theorem metadata59 : 0<135260814 ∧ 17<128 ∧ 64<128 ∧ 1<4 ∧
    6111/4160=1 ∧ 6111%4160=1951 ∧ ∀ i, (leaves59 i).Valid 8 := by
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

noncomputable def phaseMass59 : ℝ := singlePhaseMass (135260814/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw59 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass59_eq : phaseMass59 = (67630407/819200000000 : ℝ) := by
  unfold phaseMass59
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw59 output59 cover59 source59
    (gridTreeUnionCheck_sound 32768 raw59 output59 cover59 source59 tree59 checked59)
    _ (by norm_num) _, areaUnits59]
  norm_num

-- Frozen phase 5039, atom 3652, type 0, source (41,85).
def leavesData60 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves60 : Fin 4 → DyadicLeaf := leavesData60.get
def raw60 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 41 85 leaves60 i
def outputData60 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨10496,10624,21760,21888⟩) (.single ⟨10496,10624,21888,22016⟩)) (.node (.single ⟨10624,10752,21760,21888⟩) (.single ⟨10624,10752,21888,22016⟩))) (.node (.node (.single ⟨10752,10880,22016,22144⟩) (.single ⟨10752,10880,22144,22272⟩)) (.node (.single ⟨10880,11008,22016,22144⟩) (.single ⟨10880,11008,22144,22272⟩)))) (.node (.node (.node (.single ⟨21760,21888,10496,10624⟩) (.single ⟨21760,21888,10624,10752⟩)) (.node (.single ⟨21888,22016,10496,10624⟩) (.single ⟨21888,22016,10624,10752⟩))) (.node (.node (.single ⟨22016,22144,10752,10880⟩) (.single ⟨22016,22144,10880,11008⟩)) (.node (.single ⟨22144,22272,10752,10880⟩) (.single ⟨22144,22272,10880,11008⟩)))))
def output60 : Fin 16 → GridBox := outputData60.get
def coverData60 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData60 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover60 (i : Fin 16) : Fin 16 := ⟨coverData60.get i % 16, Nat.mod_lt _ (by decide)⟩
def source60 (i : Fin 16) : Fin 16 := ⟨sourceData60.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree60 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 .empty (.cutY 22528 (.cutX 11264 (.cutY 21504 .empty (.cutX 10752 (.cutY 22016 (.cutX 10496 .empty (.cutY 21760 .empty (.cutX 10624 (.cutY 21888 .full .full) (.cutY 21888 .full .full)))) .empty) (.cutY 22016 .empty (.cutX 11008 (.cutY 22272 (.cutX 10880 (.cutY 22144 .full .full) (.cutY 22144 .full .full)) .empty) .empty)))) .empty) .empty))) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 (.cutY 10240 .empty (.cutX 21504 .empty (.cutY 11264 (.cutX 22016 (.cutY 10752 (.cutX 21760 .empty (.cutY 10496 .empty (.cutX 21888 (.cutY 10624 .full .full) (.cutY 10624 .full .full)))) .empty) (.cutY 10752 .empty (.cutX 22272 (.cutY 11008 (.cutX 22144 (.cutY 10880 .full .full) (.cutY 10880 .full .full)) .empty) .empty))) .empty))) .empty) .empty))) .empty) .empty))

theorem metadata60 : 0<1701312 ∧ 41<128 ∧ 85<128 ∧ 0<4 ∧
    3652/4160=0 ∧ 3652%4160=3652 ∧ ∀ i, (leaves60 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData60).mp
    (by decide +kernel)

theorem sourceChecked60_0 : ∀ i : Fin 16,
    (fun i => output60 i = raw60 (source60 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked60 : ∀ i : Fin 16, (fun i => output60 i = raw60 (source60 i)) i :=
  forallFin_of_zero_offset (fun i => output60 i = raw60 (source60 i)) sourceChecked60_0

theorem coverChecked60_0 : ∀ i : Fin 16,
    (fun i => (output60 (cover60 i)).ContainsBox (raw60 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked60 : ∀ i : Fin 16, (fun i => (output60 (cover60 i)).ContainsBox (raw60 i)) i :=
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

noncomputable def phaseMass60 : ℝ := singlePhaseMass (1701312/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw60 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass60_eq : phaseMass60 = (26583/25600000000 : ℝ) := by
  unfold phaseMass60
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw60 output60 cover60 source60
    (gridTreeUnionCheck_sound 32768 raw60 output60 cover60 source60 tree60 checked60)
    _ (by norm_num) _, areaUnits60]
  norm_num

-- Frozen phase 5040, atom 2140, type 0, source (19,69).
def leavesData61 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves61 : Fin 7 → DyadicLeaf := leavesData61.get
def raw61 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 19 69 leaves61 i
def outputData61 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨4864,4992,17664,17792⟩) (.node (.single ⟨4864,4992,17792,17920⟩) (.single ⟨4992,5056,17664,17728⟩))) (.node (.node (.single ⟨4992,5056,17728,17792⟩) (.single ⟨5056,5120,17664,17728⟩)) (.node (.single ⟨5056,5120,17728,17792⟩) (.single ⟨4992,5120,17792,17920⟩)))) (.node (.node (.single ⟨14848,14976,27648,27776⟩) (.node (.single ⟨14848,14976,27776,27904⟩) (.single ⟨14976,15040,27648,27712⟩))) (.node (.node (.single ⟨14976,15040,27712,27776⟩) (.single ⟨15040,15104,27648,27712⟩)) (.node (.single ⟨15040,15104,27712,27776⟩) (.single ⟨14976,15104,27776,27904⟩))))) (.node (.node (.node (.single ⟨17664,17792,4864,4992⟩) (.node (.single ⟨17664,17728,4992,5056⟩) (.single ⟨17664,17728,5056,5120⟩))) (.node (.node (.single ⟨17728,17792,4992,5056⟩) (.single ⟨17728,17792,5056,5120⟩)) (.node (.single ⟨17792,17920,4864,4992⟩) (.single ⟨17792,17920,4992,5120⟩)))) (.node (.node (.single ⟨27648,27776,14848,14976⟩) (.node (.single ⟨27648,27712,14976,15040⟩) (.single ⟨27648,27712,15040,15104⟩))) (.node (.node (.single ⟨27712,27776,14976,15040⟩) (.single ⟨27712,27776,15040,15104⟩)) (.node (.single ⟨27776,27904,14848,14976⟩) (.single ⟨27776,27904,14976,15104⟩))))))
def output61 : Fin 28 → GridBox := outputData61.get
def coverData61 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData61 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover61 (i : Fin 28) : Fin 28 := ⟨coverData61.get i % 28, Nat.mod_lt _ (by decide)⟩
def source61 (i : Fin 28) : Fin 28 := ⟨sourceData61.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree61 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 (.cutX 5120 (.cutY 17408 .empty (.cutX 4608 .empty (.cutY 17920 (.cutX 4864 .empty (.cutY 17664 .empty (.cutX 4992 (.cutY 17792 .full .full) (.cutY 17792 (.cutX 5056 (.cutY 17728 .full .full) (.cutY 17728 .full .full)) .full)))) .empty))) .empty) .empty) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 .empty (.cutX 15360 (.cutY 27648 .empty (.cutX 14848 .empty (.cutY 28160 (.cutX 15104 (.cutY 27904 (.cutX 14976 (.cutY 27776 .full .full) (.cutY 27776 (.cutX 15040 (.cutY 27712 .full .full) (.cutY 27712 .full .full)) .full)) .empty) .empty) .empty))) .empty))) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 (.cutX 17408 .empty (.cutY 5120 (.cutX 17920 (.cutY 4608 .empty (.cutX 17664 .empty (.cutY 4864 .empty (.cutX 17792 (.cutY 4992 .full (.cutX 17728 (.cutY 5056 .full .full) (.cutY 5056 .full .full))) (.cutY 4992 .full .full))))) .empty) .empty)) .empty) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 .empty (.cutX 27648 .empty (.cutY 15360 (.cutX 28160 (.cutY 14848 .empty (.cutX 27904 (.cutY 15104 (.cutX 27776 (.cutY 14976 .full (.cutX 27712 (.cutY 15040 .full .full) (.cutY 15040 .full .full))) (.cutY 14976 .full .full)) .empty) .empty)) .empty) .empty))))) .empty))) .empty))

theorem metadata61 : 0<191564598 ∧ 19<128 ∧ 69<128 ∧ 0<4 ∧
    2140/4160=0 ∧ 2140%4160=2140 ∧ ∀ i, (leaves61 i).Valid 8 := by
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

noncomputable def phaseMass61 : ℝ := singlePhaseMass (191564598/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw61 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass61_eq : phaseMass61 = (95782299/819200000000 : ℝ) := by
  unfold phaseMass61
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw61 output61 cover61 source61
    (gridTreeUnionCheck_sound 32768 raw61 output61 cover61 source61 tree61 checked61)
    _ (by norm_num) _, areaUnits61]
  norm_num

-- Frozen phase 5041, atom 2726, type 0, source (26,74).
def leavesData62 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves62 : Fin 7 → DyadicLeaf := leavesData62.get
def raw62 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 26 74 leaves62 i
def outputData62 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨6656,6784,18944,19072⟩) (.node (.single ⟨6656,6784,19072,19200⟩) (.single ⟨6784,6848,18944,19008⟩))) (.node (.node (.single ⟨6784,6848,19008,19072⟩) (.single ⟨6848,6912,18944,19008⟩)) (.node (.single ⟨6848,6912,19008,19072⟩) (.single ⟨6784,6912,19072,19200⟩)))) (.node (.node (.single ⟨13568,13696,25856,25984⟩) (.node (.single ⟨13568,13696,25984,26112⟩) (.single ⟨13696,13760,25856,25920⟩))) (.node (.node (.single ⟨13696,13760,25920,25984⟩) (.single ⟨13760,13824,25856,25920⟩)) (.node (.single ⟨13760,13824,25920,25984⟩) (.single ⟨13696,13824,25984,26112⟩))))) (.node (.node (.node (.single ⟨18944,19072,6656,6784⟩) (.node (.single ⟨18944,19008,6784,6848⟩) (.single ⟨18944,19008,6848,6912⟩))) (.node (.node (.single ⟨19008,19072,6784,6848⟩) (.single ⟨19008,19072,6848,6912⟩)) (.node (.single ⟨19072,19200,6656,6784⟩) (.single ⟨19072,19200,6784,6912⟩)))) (.node (.node (.single ⟨25856,25984,13568,13696⟩) (.node (.single ⟨25856,25920,13696,13760⟩) (.single ⟨25856,25920,13760,13824⟩))) (.node (.node (.single ⟨25920,25984,13696,13760⟩) (.single ⟨25920,25984,13760,13824⟩)) (.node (.single ⟨25984,26112,13568,13696⟩) (.single ⟨25984,26112,13696,13824⟩))))))
def output62 : Fin 28 → GridBox := outputData62.get
def coverData62 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData62 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover62 (i : Fin 28) : Fin 28 := ⟨coverData62.get i % 28, Nat.mod_lt _ (by decide)⟩
def source62 (i : Fin 28) : Fin 28 := ⟨sourceData62.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree62 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 .empty (.cutX 7168 (.cutY 19456 (.cutX 6656 .empty (.cutY 18944 .empty (.cutX 6912 (.cutY 19200 (.cutX 6784 (.cutY 19072 .full .full) (.cutY 19072 (.cutX 6848 (.cutY 19008 .full .full) (.cutY 19008 .full .full)) .full)) .empty) .empty))) .empty) .empty))) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 (.cutX 13312 .empty (.cutY 25600 .empty (.cutX 13824 (.cutY 26112 (.cutX 13568 .empty (.cutY 25856 .empty (.cutX 13696 (.cutY 25984 .full .full) (.cutY 25984 (.cutX 13760 (.cutY 25920 .full .full) (.cutY 25920 .full .full)) .full)))) .empty) .empty))) .empty) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 .empty (.cutX 19456 (.cutY 7168 (.cutX 18944 .empty (.cutY 6656 .empty (.cutX 19200 (.cutY 6912 (.cutX 19072 (.cutY 6784 .full (.cutX 19008 (.cutY 6848 .full .full) (.cutY 6848 .full .full))) (.cutY 6784 .full .full)) .empty) .empty))) .empty) .empty)))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 (.cutX 25600 .empty (.cutY 13312 .empty (.cutX 26112 (.cutY 13824 (.cutX 25856 .empty (.cutY 13568 .empty (.cutX 25984 (.cutY 13696 .full (.cutX 25920 (.cutY 13760 .full .full) (.cutY 13760 .full .full))) (.cutY 13696 .full .full)))) .empty) .empty))) .empty) .empty)) .empty))) .empty))

theorem metadata62 : 0<177866497 ∧ 26<128 ∧ 74<128 ∧ 0<4 ∧
    2726/4160=0 ∧ 2726%4160=2726 ∧ ∀ i, (leaves62 i).Valid 8 := by
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

noncomputable def phaseMass62 : ℝ := singlePhaseMass (177866497/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw62 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass62_eq : phaseMass62 = (177866497/1638400000000 : ℝ) := by
  unfold phaseMass62
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw62 output62 cover62 source62
    (gridTreeUnionCheck_sound 32768 raw62 output62 cover62 source62 tree62 checked62)
    _ (by norm_num) _, areaUnits62]
  norm_num

-- Frozen phase 5042, atom 1243, type 0, source (10,63).
def leavesData63 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves63 : Fin 4 → DyadicLeaf := leavesData63.get
def raw63 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 10 63 leaves63 i
def outputData63 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨2560,2688,16128,16256⟩) (.single ⟨2560,2688,16256,16384⟩)) (.node (.single ⟨2688,2816,16128,16256⟩) (.single ⟨2688,2816,16256,16384⟩))) (.node (.node (.single ⟨16128,16256,2560,2688⟩) (.single ⟨16128,16256,2688,2816⟩)) (.node (.single ⟨16256,16384,2560,2688⟩) (.single ⟨16256,16384,2688,2816⟩)))) (.node (.node (.node (.single ⟨16384,16512,29952,30080⟩) (.single ⟨16384,16512,30080,30208⟩)) (.node (.single ⟨16512,16640,29952,30080⟩) (.single ⟨16512,16640,30080,30208⟩))) (.node (.node (.single ⟨29952,30080,16384,16512⟩) (.single ⟨29952,30080,16512,16640⟩)) (.node (.single ⟨30080,30208,16384,16512⟩) (.single ⟨30080,30208,16512,16640⟩)))))
def output63 : Fin 16 → GridBox := outputData63.get
def coverData63 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData63 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover63 (i : Fin 16) : Fin 16 := ⟨coverData63.get i % 16, Nat.mod_lt _ (by decide)⟩
def source63 (i : Fin 16) : Fin 16 := ⟨sourceData63.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree63 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 .empty (.cutX 3072 (.cutY 15360 .empty (.cutX 2560 .empty (.cutY 15872 .empty (.cutX 2816 (.cutY 16128 .empty (.cutX 2688 (.cutY 16256 .full .full) (.cutY 16256 .full .full))) .empty)))) .empty)))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 .empty (.cutX 15360 .empty (.cutY 3072 (.cutX 15872 .empty (.cutY 2560 .empty (.cutX 16128 .empty (.cutY 2816 (.cutX 16256 (.cutY 2688 .full .full) (.cutY 2688 .full .full)) .empty)))) .empty)))) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 (.cutX 17408 (.cutY 29696 .empty (.cutX 16896 (.cutY 30208 (.cutX 16640 (.cutY 29952 .empty (.cutX 16512 (.cutY 30080 .full .full) (.cutY 30080 .full .full))) .empty) .empty) .empty)) .empty) .empty) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 (.cutX 29696 .empty (.cutY 17408 (.cutX 30208 (.cutY 16896 (.cutX 29952 .empty (.cutY 16640 (.cutX 30080 (.cutY 16512 .full .full) (.cutY 16512 .full .full)) .empty)) .empty) .empty) .empty)) .empty) .empty) .empty)) .empty))))

theorem metadata63 : 0<116912559 ∧ 10<128 ∧ 63<128 ∧ 0<4 ∧
    1243/4160=0 ∧ 1243%4160=1243 ∧ ∀ i, (leaves63 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData63).mp
    (by decide +kernel)

theorem sourceChecked63_0 : ∀ i : Fin 16,
    (fun i => output63 i = raw63 (source63 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked63 : ∀ i : Fin 16, (fun i => output63 i = raw63 (source63 i)) i :=
  forallFin_of_zero_offset (fun i => output63 i = raw63 (source63 i)) sourceChecked63_0

theorem coverChecked63_0 : ∀ i : Fin 16,
    (fun i => (output63 (cover63 i)).ContainsBox (raw63 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked63 : ∀ i : Fin 16, (fun i => (output63 (cover63 i)).ContainsBox (raw63 i)) i :=
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

noncomputable def phaseMass63 : ℝ := singlePhaseMass (116912559/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw63 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass63_eq : phaseMass63 = (116912559/1638400000000 : ℝ) := by
  unfold phaseMass63
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw63 output63 cover63 source63
    (gridTreeUnionCheck_sound 32768 raw63 output63 cover63 source63 tree63 checked63)
    _ (by norm_num) _, areaUnits63]
  norm_num

-- Frozen phase 5043, atom 3336, type 0, source (35,81).
def leavesData64 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves64 : Fin 4 → DyadicLeaf := leavesData64.get
def raw64 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 35 81 leaves64 i
def outputData64 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨8960,9088,20736,20864⟩) (.single ⟨8960,9088,20864,20992⟩)) (.node (.single ⟨9088,9216,20736,20864⟩) (.single ⟨9088,9216,20864,20992⟩))) (.node (.node (.single ⟨11776,11904,23552,23680⟩) (.single ⟨11776,11904,23680,23808⟩)) (.node (.single ⟨11904,12032,23552,23680⟩) (.single ⟨11904,12032,23680,23808⟩)))) (.node (.node (.node (.single ⟨20736,20864,8960,9088⟩) (.single ⟨20736,20864,9088,9216⟩)) (.node (.single ⟨20864,20992,8960,9088⟩) (.single ⟨20864,20992,9088,9216⟩))) (.node (.node (.single ⟨23552,23680,11776,11904⟩) (.single ⟨23552,23680,11904,12032⟩)) (.node (.single ⟨23680,23808,11776,11904⟩) (.single ⟨23680,23808,11904,12032⟩)))))
def output64 : Fin 16 → GridBox := outputData64.get
def coverData64 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData64 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover64 (i : Fin 16) : Fin 16 := ⟨coverData64.get i % 16, Nat.mod_lt _ (by decide)⟩
def source64 (i : Fin 16) : Fin 16 := ⟨sourceData64.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree64 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 (.cutX 9216 (.cutY 21504 (.cutX 8704 .empty (.cutY 20992 (.cutX 8960 .empty (.cutY 20736 .empty (.cutX 9088 (.cutY 20864 .full .full) (.cutY 20864 .full .full)))) .empty)) .empty) .empty) .empty) (.cutY 22528 .empty (.cutX 11264 .empty (.cutY 23552 .empty (.cutX 11776 .empty (.cutY 24064 (.cutX 12032 (.cutY 23808 (.cutX 11904 (.cutY 23680 .full .full) (.cutY 23680 .full .full)) .empty) .empty) .empty))))))) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 (.cutY 10240 (.cutX 21504 (.cutY 9216 (.cutX 20992 (.cutY 8704 .empty (.cutX 20736 .empty (.cutY 8960 .empty (.cutX 20864 (.cutY 9088 .full .full) (.cutY 9088 .full .full))))) .empty) .empty) .empty) .empty) (.cutY 10240 .empty (.cutX 23552 .empty (.cutY 11264 .empty (.cutX 24064 (.cutY 11776 .empty (.cutX 23808 (.cutY 12032 (.cutX 23680 (.cutY 11904 .full .full) (.cutY 11904 .full .full)) .empty) .empty)) .empty))))) .empty))) .empty) .empty))

theorem metadata64 : 0<167980383 ∧ 35<128 ∧ 81<128 ∧ 0<4 ∧
    3336/4160=0 ∧ 3336%4160=3336 ∧ ∀ i, (leaves64 i).Valid 8 := by
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

noncomputable def phaseMass64 : ℝ := singlePhaseMass (167980383/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw64 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass64_eq : phaseMass64 = (167980383/1638400000000 : ℝ) := by
  unfold phaseMass64
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw64 output64 cover64 source64
    (gridTreeUnionCheck_sound 32768 raw64 output64 cover64 source64 tree64 checked64)
    _ (by norm_num) _, areaUnits64]
  norm_num

-- Frozen phase 5044, atom 3017, type 0, source (30,77).
def leavesData65 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves65 : Fin 7 → DyadicLeaf := leavesData65.get
def raw65 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 30 77 leaves65 i
def outputData65 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨7680,7808,19712,19840⟩) (.node (.single ⟨7680,7808,19840,19968⟩) (.single ⟨7808,7872,19712,19776⟩))) (.node (.node (.single ⟨7808,7872,19776,19840⟩) (.single ⟨7872,7936,19712,19776⟩)) (.node (.single ⟨7872,7936,19776,19840⟩) (.single ⟨7808,7936,19840,19968⟩)))) (.node (.node (.single ⟨12800,12928,24832,24960⟩) (.node (.single ⟨12800,12928,24960,25088⟩) (.single ⟨12928,12992,24832,24896⟩))) (.node (.node (.single ⟨12928,12992,24896,24960⟩) (.single ⟨12992,13056,24832,24896⟩)) (.node (.single ⟨12992,13056,24896,24960⟩) (.single ⟨12928,13056,24960,25088⟩))))) (.node (.node (.node (.single ⟨19712,19840,7680,7808⟩) (.node (.single ⟨19712,19776,7808,7872⟩) (.single ⟨19712,19776,7872,7936⟩))) (.node (.node (.single ⟨19776,19840,7808,7872⟩) (.single ⟨19776,19840,7872,7936⟩)) (.node (.single ⟨19840,19968,7680,7808⟩) (.single ⟨19840,19968,7808,7936⟩)))) (.node (.node (.single ⟨24832,24960,12800,12928⟩) (.node (.single ⟨24832,24896,12928,12992⟩) (.single ⟨24832,24896,12992,13056⟩))) (.node (.node (.single ⟨24896,24960,12928,12992⟩) (.single ⟨24896,24960,12992,13056⟩)) (.node (.single ⟨24960,25088,12800,12928⟩) (.single ⟨24960,25088,12928,13056⟩))))))
def output65 : Fin 28 → GridBox := outputData65.get
def coverData65 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData65 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover65 (i : Fin 28) : Fin 28 := ⟨coverData65.get i % 28, Nat.mod_lt _ (by decide)⟩
def source65 (i : Fin 28) : Fin 28 := ⟨sourceData65.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree65 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 .empty (.cutX 7168 .empty (.cutY 19456 .empty (.cutX 7680 .empty (.cutY 19968 (.cutX 7936 (.cutY 19712 .empty (.cutX 7808 (.cutY 19840 .full .full) (.cutY 19840 (.cutX 7872 (.cutY 19776 .full .full) (.cutY 19776 .full .full)) .full))) .empty) .empty)))))) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 (.cutX 13312 (.cutY 25600 (.cutX 12800 .empty (.cutY 25088 (.cutX 13056 (.cutY 24832 .empty (.cutX 12928 (.cutY 24960 .full .full) (.cutY 24960 (.cutX 12992 (.cutY 24896 .full .full) (.cutY 24896 .full .full)) .full))) .empty) .empty)) .empty) .empty) .empty) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 .empty (.cutX 19456 .empty (.cutY 7168 .empty (.cutX 19968 (.cutY 7680 .empty (.cutX 19712 .empty (.cutY 7936 (.cutX 19840 (.cutY 7808 .full (.cutX 19776 (.cutY 7872 .full .full) (.cutY 7872 .full .full))) (.cutY 7808 .full .full)) .empty))) .empty)))))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 (.cutX 25600 (.cutY 13312 (.cutX 25088 (.cutY 12800 .empty (.cutX 24832 .empty (.cutY 13056 (.cutX 24960 (.cutY 12928 .full (.cutX 24896 (.cutY 12992 .full .full) (.cutY 12992 .full .full))) (.cutY 12928 .full .full)) .empty))) .empty) .empty) .empty) .empty) .empty)) .empty))) .empty))

theorem metadata65 : 0<177866497 ∧ 30<128 ∧ 77<128 ∧ 0<4 ∧
    3017/4160=0 ∧ 3017%4160=3017 ∧ ∀ i, (leaves65 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData65).mp
    (by decide +kernel)

theorem sourceChecked65_0 : ∀ i : Fin 28,
    (fun i => output65 i = raw65 (source65 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked65 : ∀ i : Fin 28, (fun i => output65 i = raw65 (source65 i)) i :=
  forallFin_of_zero_offset (fun i => output65 i = raw65 (source65 i)) sourceChecked65_0

theorem coverChecked65_0 : ∀ i : Fin 28,
    (fun i => (output65 (cover65 i)).ContainsBox (raw65 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked65 : ∀ i : Fin 28, (fun i => (output65 (cover65 i)).ContainsBox (raw65 i)) i :=
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

noncomputable def phaseMass65 : ℝ := singlePhaseMass (177866497/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw65 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass65_eq : phaseMass65 = (177866497/1638400000000 : ℝ) := by
  unfold phaseMass65
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw65 output65 cover65 source65
    (gridTreeUnionCheck_sound 32768 raw65 output65 cover65 source65 tree65 checked65)
    _ (by norm_num) _, areaUnits65]
  norm_num

-- Frozen phase 5045, atom 1761, type 0, source (15,66).
def leavesData66 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves66 : Fin 7 → DyadicLeaf := leavesData66.get
def raw66 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 15 66 leaves66 i
def outputData66 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3840,3968,16896,17024⟩) (.node (.single ⟨3840,3968,17024,17152⟩) (.single ⟨3968,4032,16896,16960⟩))) (.node (.node (.single ⟨3968,4032,16960,17024⟩) (.single ⟨4032,4096,16896,16960⟩)) (.node (.single ⟨4032,4096,16960,17024⟩) (.single ⟨3968,4096,17024,17152⟩)))) (.node (.node (.single ⟨15616,15744,28672,28800⟩) (.node (.single ⟨15616,15744,28800,28928⟩) (.single ⟨15744,15808,28672,28736⟩))) (.node (.node (.single ⟨15744,15808,28736,28800⟩) (.single ⟨15808,15872,28672,28736⟩)) (.node (.single ⟨15808,15872,28736,28800⟩) (.single ⟨15744,15872,28800,28928⟩))))) (.node (.node (.node (.single ⟨16896,17024,3840,3968⟩) (.node (.single ⟨16896,16960,3968,4032⟩) (.single ⟨16896,16960,4032,4096⟩))) (.node (.node (.single ⟨16960,17024,3968,4032⟩) (.single ⟨16960,17024,4032,4096⟩)) (.node (.single ⟨17024,17152,3840,3968⟩) (.single ⟨17024,17152,3968,4096⟩)))) (.node (.node (.single ⟨28672,28800,15616,15744⟩) (.node (.single ⟨28672,28736,15744,15808⟩) (.single ⟨28672,28736,15808,15872⟩))) (.node (.node (.single ⟨28736,28800,15744,15808⟩) (.single ⟨28736,28800,15808,15872⟩)) (.node (.single ⟨28800,28928,15616,15744⟩) (.single ⟨28800,28928,15744,15872⟩))))))
def output66 : Fin 28 → GridBox := outputData66.get
def coverData66 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData66 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover66 (i : Fin 28) : Fin 28 := ⟨coverData66.get i % 28, Nat.mod_lt _ (by decide)⟩
def source66 (i : Fin 28) : Fin 28 := ⟨sourceData66.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree66 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 (.cutX 3072 .empty (.cutY 17408 (.cutX 3584 .empty (.cutY 16896 .empty (.cutX 3840 .empty (.cutY 17152 (.cutX 3968 (.cutY 17024 .full .full) (.cutY 17024 (.cutX 4032 (.cutY 16960 .full .full) (.cutY 16960 .full .full)) .full)) .empty)))) .empty)) .empty)) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 (.cutX 15360 .empty (.cutY 29696 (.cutX 15872 (.cutY 29184 (.cutX 15616 .empty (.cutY 28928 (.cutX 15744 (.cutY 28800 .full .full) (.cutY 28800 (.cutX 15808 (.cutY 28736 .full .full) (.cutY 28736 .full .full)) .full)) .empty)) .empty) .empty) .empty)) .empty))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 .empty (.cutX 17408 (.cutY 3072 .empty (.cutX 16896 .empty (.cutY 3584 .empty (.cutX 17152 (.cutY 3840 .empty (.cutX 17024 (.cutY 3968 .full (.cutX 16960 (.cutY 4032 .full .full) (.cutY 4032 .full .full))) (.cutY 3968 .full .full))) .empty)))) .empty)) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 .empty (.cutX 29696 (.cutY 15360 .empty (.cutX 29184 (.cutY 15872 (.cutX 28928 (.cutY 15616 .empty (.cutX 28800 (.cutY 15744 .full (.cutX 28736 (.cutY 15808 .full .full) (.cutY 15808 .full .full))) (.cutY 15744 .full .full))) .empty) .empty) .empty)) .empty)) .empty))))) .empty))

theorem metadata66 : 0<67702166 ∧ 15<128 ∧ 66<128 ∧ 0<4 ∧
    1761/4160=0 ∧ 1761%4160=1761 ∧ ∀ i, (leaves66 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData66).mp
    (by decide +kernel)

theorem sourceChecked66_0 : ∀ i : Fin 28,
    (fun i => output66 i = raw66 (source66 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked66 : ∀ i : Fin 28, (fun i => output66 i = raw66 (source66 i)) i :=
  forallFin_of_zero_offset (fun i => output66 i = raw66 (source66 i)) sourceChecked66_0

theorem coverChecked66_0 : ∀ i : Fin 28,
    (fun i => (output66 (cover66 i)).ContainsBox (raw66 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked66 : ∀ i : Fin 28, (fun i => (output66 (cover66 i)).ContainsBox (raw66 i)) i :=
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

noncomputable def phaseMass66 : ℝ := singlePhaseMass (67702166/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw66 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass66_eq : phaseMass66 = (33851083/819200000000 : ℝ) := by
  unfold phaseMass66
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw66 output66 cover66 source66
    (gridTreeUnionCheck_sound 32768 raw66 output66 cover66 source66 tree66 checked66)
    _ (by norm_num) _, areaUnits66]
  norm_num

-- Frozen phase 5046, atom 1859, type 0, source (16,67).
def leavesData67 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves67 : Fin 7 → DyadicLeaf := leavesData67.get
def raw67 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 16 67 leaves67 i
def outputData67 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨4096,4224,17152,17280⟩) (.node (.single ⟨4096,4224,17280,17408⟩) (.single ⟨4224,4288,17152,17216⟩))) (.node (.node (.single ⟨4224,4288,17216,17280⟩) (.single ⟨4288,4352,17152,17216⟩)) (.node (.single ⟨4288,4352,17216,17280⟩) (.single ⟨4224,4352,17280,17408⟩)))) (.node (.node (.single ⟨15360,15488,28416,28544⟩) (.node (.single ⟨15360,15488,28544,28672⟩) (.single ⟨15488,15552,28416,28480⟩))) (.node (.node (.single ⟨15488,15552,28480,28544⟩) (.single ⟨15552,15616,28416,28480⟩)) (.node (.single ⟨15552,15616,28480,28544⟩) (.single ⟨15488,15616,28544,28672⟩))))) (.node (.node (.node (.single ⟨17152,17280,4096,4224⟩) (.node (.single ⟨17152,17216,4224,4288⟩) (.single ⟨17152,17216,4288,4352⟩))) (.node (.node (.single ⟨17216,17280,4224,4288⟩) (.single ⟨17216,17280,4288,4352⟩)) (.node (.single ⟨17280,17408,4096,4224⟩) (.single ⟨17280,17408,4224,4352⟩)))) (.node (.node (.single ⟨28416,28544,15360,15488⟩) (.node (.single ⟨28416,28480,15488,15552⟩) (.single ⟨28416,28480,15552,15616⟩))) (.node (.node (.single ⟨28480,28544,15488,15552⟩) (.single ⟨28480,28544,15552,15616⟩)) (.node (.single ⟨28544,28672,15360,15488⟩) (.single ⟨28544,28672,15488,15616⟩))))))
def output67 : Fin 28 → GridBox := outputData67.get
def coverData67 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData67 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover67 (i : Fin 28) : Fin 28 := ⟨coverData67.get i % 28, Nat.mod_lt _ (by decide)⟩
def source67 (i : Fin 28) : Fin 28 := ⟨sourceData67.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree67 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 (.cutX 5120 (.cutY 17408 (.cutX 4608 (.cutY 16896 .empty (.cutX 4352 (.cutY 17152 .empty (.cutX 4224 (.cutY 17280 .full .full) (.cutY 17280 (.cutX 4288 (.cutY 17216 .full .full) (.cutY 17216 .full .full)) .full))) .empty)) .empty) .empty) .empty) .empty) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 .empty (.cutX 15360 .empty (.cutY 27648 .empty (.cutX 15872 (.cutY 28160 .empty (.cutX 15616 (.cutY 28416 .empty (.cutX 15488 (.cutY 28544 .full .full) (.cutY 28544 (.cutX 15552 (.cutY 28480 .full .full) (.cutY 28480 .full .full)) .full))) .empty)) .empty))))) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 (.cutX 17408 (.cutY 5120 (.cutX 16896 .empty (.cutY 4608 (.cutX 17152 .empty (.cutY 4352 (.cutX 17280 (.cutY 4224 .full (.cutX 17216 (.cutY 4288 .full .full) (.cutY 4288 .full .full))) (.cutY 4224 .full .full)) .empty)) .empty)) .empty) .empty) .empty) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 .empty (.cutX 27648 .empty (.cutY 15360 .empty (.cutX 28160 .empty (.cutY 15872 (.cutX 28416 .empty (.cutY 15616 (.cutX 28544 (.cutY 15488 .full (.cutX 28480 (.cutY 15552 .full .full) (.cutY 15552 .full .full))) (.cutY 15488 .full .full)) .empty)) .empty))))))) .empty))) .empty))

theorem metadata67 : 0<191564598 ∧ 16<128 ∧ 67<128 ∧ 0<4 ∧
    1859/4160=0 ∧ 1859%4160=1859 ∧ ∀ i, (leaves67 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData67).mp
    (by decide +kernel)

theorem sourceChecked67_0 : ∀ i : Fin 28,
    (fun i => output67 i = raw67 (source67 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked67 : ∀ i : Fin 28, (fun i => output67 i = raw67 (source67 i)) i :=
  forallFin_of_zero_offset (fun i => output67 i = raw67 (source67 i)) sourceChecked67_0

theorem coverChecked67_0 : ∀ i : Fin 28,
    (fun i => (output67 (cover67 i)).ContainsBox (raw67 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked67 : ∀ i : Fin 28, (fun i => (output67 (cover67 i)).ContainsBox (raw67 i)) i :=
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

noncomputable def phaseMass67 : ℝ := singlePhaseMass (191564598/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw67 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass67_eq : phaseMass67 = (95782299/819200000000 : ℝ) := by
  unfold phaseMass67
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw67 output67 cover67 source67
    (gridTreeUnionCheck_sound 32768 raw67 output67 cover67 source67 tree67 checked67)
    _ (by norm_num) _, areaUnits67]
  norm_num

-- Frozen phase 5047, atom 186, type 0, source (1,59).
def leavesData68 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves68 : Fin 4 → DyadicLeaf := leavesData68.get
def raw68 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 1 59 leaves68 i
def outputData68 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨256,384,15104,15232⟩) (.single ⟨256,384,15232,15360⟩)) (.node (.single ⟨384,512,15104,15232⟩) (.single ⟨384,512,15232,15360⟩))) (.node (.node (.single ⟨15104,15232,256,384⟩) (.single ⟨15104,15232,384,512⟩)) (.node (.single ⟨15232,15360,256,384⟩) (.single ⟨15232,15360,384,512⟩)))) (.node (.node (.node (.single ⟨17408,17536,32256,32384⟩) (.single ⟨17408,17536,32384,32512⟩)) (.node (.single ⟨17536,17664,32256,32384⟩) (.single ⟨17536,17664,32384,32512⟩))) (.node (.node (.single ⟨32256,32384,17408,17536⟩) (.single ⟨32256,32384,17536,17664⟩)) (.node (.single ⟨32384,32512,17408,17536⟩) (.single ⟨32384,32512,17536,17664⟩)))))
def output68 : Fin 16 → GridBox := outputData68.get
def coverData68 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData68 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover68 (i : Fin 16) : Fin 16 := ⟨coverData68.get i % 16, Nat.mod_lt _ (by decide)⟩
def source68 (i : Fin 16) : Fin 16 := ⟨sourceData68.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree68 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 .empty (.cutX 1024 (.cutY 15360 (.cutX 512 (.cutY 14848 .empty (.cutX 256 .empty (.cutY 15104 .empty (.cutX 384 (.cutY 15232 .full .full) (.cutY 15232 .full .full))))) .empty) .empty) .empty)) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 (.cutX 15360 (.cutY 1024 (.cutX 14848 .empty (.cutY 512 (.cutX 15104 .empty (.cutY 256 .empty (.cutX 15232 (.cutY 384 .full .full) (.cutY 384 .full .full)))) .empty)) .empty) .empty) .empty)) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 .empty (.cutX 17408 .empty (.cutY 31744 .empty (.cutX 17920 (.cutY 32256 .empty (.cutX 17664 (.cutY 32512 (.cutX 17536 (.cutY 32384 .full .full) (.cutY 32384 .full .full)) .empty) .empty)) .empty)))) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 (.cutX 31744 .empty (.cutY 17408 .empty (.cutX 32256 .empty (.cutY 17920 (.cutX 32512 (.cutY 17664 (.cutX 32384 (.cutY 17536 .full .full) (.cutY 17536 .full .full)) .empty) .empty) .empty)))) .empty)) .empty)) .empty))))

theorem metadata68 : 0<89519217 ∧ 1<128 ∧ 59<128 ∧ 0<4 ∧
    186/4160=0 ∧ 186%4160=186 ∧ ∀ i, (leaves68 i).Valid 8 := by
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

noncomputable def phaseMass68 : ℝ := singlePhaseMass (89519217/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw68 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass68_eq : phaseMass68 = (89519217/1638400000000 : ℝ) := by
  unfold phaseMass68
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw68 output68 cover68 source68
    (gridTreeUnionCheck_sound 32768 raw68 output68 cover68 source68 tree68 checked68)
    _ (by norm_num) _, areaUnits68]
  norm_num

-- Frozen phase 5048, atom 1022, type 0, source (8,62).
def leavesData69 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves69 : Fin 4 → DyadicLeaf := leavesData69.get
def raw69 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 8 62 leaves69 i
def outputData69 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨2048,2176,15872,16000⟩) (.single ⟨2048,2176,16000,16128⟩)) (.node (.single ⟨2176,2304,15872,16000⟩) (.single ⟨2176,2304,16000,16128⟩))) (.node (.node (.single ⟨15872,16000,2048,2176⟩) (.single ⟨15872,16000,2176,2304⟩)) (.node (.single ⟨16000,16128,2048,2176⟩) (.single ⟨16000,16128,2176,2304⟩)))) (.node (.node (.node (.single ⟨16640,16768,30464,30592⟩) (.single ⟨16640,16768,30592,30720⟩)) (.node (.single ⟨16768,16896,30464,30592⟩) (.single ⟨16768,16896,30592,30720⟩))) (.node (.node (.single ⟨30464,30592,16640,16768⟩) (.single ⟨30464,30592,16768,16896⟩)) (.node (.single ⟨30592,30720,16640,16768⟩) (.single ⟨30592,30720,16768,16896⟩)))))
def output69 : Fin 16 → GridBox := outputData69.get
def coverData69 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData69 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover69 (i : Fin 16) : Fin 16 := ⟨coverData69.get i % 16, Nat.mod_lt _ (by decide)⟩
def source69 (i : Fin 16) : Fin 16 := ⟨sourceData69.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree69 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 .empty (.cutX 3072 (.cutY 15360 .empty (.cutX 2560 (.cutY 15872 .empty (.cutX 2304 (.cutY 16128 (.cutX 2176 (.cutY 16000 .full .full) (.cutY 16000 .full .full)) .empty) .empty)) .empty)) .empty)))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 .empty (.cutX 15360 .empty (.cutY 3072 (.cutX 15872 .empty (.cutY 2560 (.cutX 16128 (.cutY 2304 (.cutX 16000 (.cutY 2176 .full .full) (.cutY 2176 .full .full)) .empty) .empty) .empty)) .empty)))) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 (.cutX 17408 (.cutY 29696 .empty (.cutX 16896 (.cutY 30208 .empty (.cutX 16640 .empty (.cutY 30464 .empty (.cutX 16768 (.cutY 30592 .full .full) (.cutY 30592 .full .full))))) .empty)) .empty) .empty) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 (.cutX 29696 .empty (.cutY 17408 (.cutX 30208 .empty (.cutY 16896 (.cutX 30464 .empty (.cutY 16640 .empty (.cutX 30592 (.cutY 16768 .full .full) (.cutY 16768 .full .full)))) .empty)) .empty)) .empty) .empty) .empty)) .empty))))

theorem metadata69 : 0<116912559 ∧ 8<128 ∧ 62<128 ∧ 0<4 ∧
    1022/4160=0 ∧ 1022%4160=1022 ∧ ∀ i, (leaves69 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData69).mp
    (by decide +kernel)

theorem sourceChecked69_0 : ∀ i : Fin 16,
    (fun i => output69 i = raw69 (source69 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked69 : ∀ i : Fin 16, (fun i => output69 i = raw69 (source69 i)) i :=
  forallFin_of_zero_offset (fun i => output69 i = raw69 (source69 i)) sourceChecked69_0

theorem coverChecked69_0 : ∀ i : Fin 16,
    (fun i => (output69 (cover69 i)).ContainsBox (raw69 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked69 : ∀ i : Fin 16, (fun i => (output69 (cover69 i)).ContainsBox (raw69 i)) i :=
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

noncomputable def phaseMass69 : ℝ := singlePhaseMass (116912559/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw69 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass69_eq : phaseMass69 = (116912559/1638400000000 : ℝ) := by
  unfold phaseMass69
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw69 output69 cover69 source69
    (gridTreeUnionCheck_sound 32768 raw69 output69 cover69 source69 tree69 checked69)
    _ (by norm_num) _, areaUnits69]
  norm_num

-- Frozen phase 5049, atom 1456, type 0, source (12,64).
def leavesData70 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves70 : Fin 4 → DyadicLeaf := leavesData70.get
def raw70 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 12 64 leaves70 i
def outputData70 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨3072,3200,16384,16512⟩) (.single ⟨3072,3200,16512,16640⟩)) (.node (.single ⟨3200,3328,16384,16512⟩) (.single ⟨3200,3328,16512,16640⟩))) (.node (.node (.single ⟨16128,16256,29440,29568⟩) (.single ⟨16128,16256,29568,29696⟩)) (.node (.single ⟨16256,16384,29440,29568⟩) (.single ⟨16256,16384,29568,29696⟩)))) (.node (.node (.node (.single ⟨16384,16512,3072,3200⟩) (.single ⟨16384,16512,3200,3328⟩)) (.node (.single ⟨16512,16640,3072,3200⟩) (.single ⟨16512,16640,3200,3328⟩))) (.node (.node (.single ⟨29440,29568,16128,16256⟩) (.single ⟨29440,29568,16256,16384⟩)) (.node (.single ⟨29568,29696,16128,16256⟩) (.single ⟨29568,29696,16256,16384⟩)))))
def output70 : Fin 16 → GridBox := outputData70.get
def coverData70 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData70 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover70 (i : Fin 16) : Fin 16 := ⟨coverData70.get i % 16, Nat.mod_lt _ (by decide)⟩
def source70 (i : Fin 16) : Fin 16 := ⟨sourceData70.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree70 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 (.cutX 3072 .empty (.cutY 17408 (.cutX 3584 (.cutY 16896 (.cutX 3328 (.cutY 16640 (.cutX 3200 (.cutY 16512 .full .full) (.cutY 16512 .full .full)) .empty) .empty) .empty) .empty) .empty)) .empty)) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 (.cutX 15360 .empty (.cutY 29696 (.cutX 15872 .empty (.cutY 29184 .empty (.cutX 16128 .empty (.cutY 29440 .empty (.cutX 16256 (.cutY 29568 .full .full) (.cutY 29568 .full .full)))))) .empty)) .empty))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 .empty (.cutX 17408 (.cutY 3072 .empty (.cutX 16896 (.cutY 3584 (.cutX 16640 (.cutY 3328 (.cutX 16512 (.cutY 3200 .full .full) (.cutY 3200 .full .full)) .empty) .empty) .empty) .empty)) .empty)) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 .empty (.cutX 29696 (.cutY 15360 .empty (.cutX 29184 .empty (.cutY 15872 .empty (.cutX 29440 .empty (.cutY 16128 .empty (.cutX 29568 (.cutY 16256 .full .full) (.cutY 16256 .full .full))))))) .empty)) .empty))))) .empty))

theorem metadata70 : 0<67702166 ∧ 12<128 ∧ 64<128 ∧ 0<4 ∧
    1456/4160=0 ∧ 1456%4160=1456 ∧ ∀ i, (leaves70 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData70).mp
    (by decide +kernel)

theorem sourceChecked70_0 : ∀ i : Fin 16,
    (fun i => output70 i = raw70 (source70 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked70 : ∀ i : Fin 16, (fun i => output70 i = raw70 (source70 i)) i :=
  forallFin_of_zero_offset (fun i => output70 i = raw70 (source70 i)) sourceChecked70_0

theorem coverChecked70_0 : ∀ i : Fin 16,
    (fun i => (output70 (cover70 i)).ContainsBox (raw70 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked70 : ∀ i : Fin 16, (fun i => (output70 (cover70 i)).ContainsBox (raw70 i)) i :=
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

noncomputable def phaseMass70 : ℝ := singlePhaseMass (67702166/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw70 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass70_eq : phaseMass70 = (33851083/819200000000 : ℝ) := by
  unfold phaseMass70
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw70 output70 cover70 source70
    (gridTreeUnionCheck_sound 32768 raw70 output70 cover70 source70 tree70 checked70)
    _ (by norm_num) _, areaUnits70]
  norm_num

-- Frozen phase 5050, atom 7104, type 1, source (29,73).
def leavesData71 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves71 : Fin 7 → DyadicLeaf := leavesData71.get
def raw71 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 29 73 leaves71 i
def outputData71 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨7424,7552,18688,18816⟩) (.node (.single ⟨7424,7552,18816,18944⟩) (.single ⟨7552,7616,18688,18752⟩))) (.node (.node (.single ⟨7552,7616,18752,18816⟩) (.single ⟨7616,7680,18688,18752⟩)) (.node (.single ⟨7616,7680,18752,18816⟩) (.single ⟨7552,7680,18816,18944⟩)))) (.node (.node (.single ⟨13824,13952,25088,25216⟩) (.node (.single ⟨13824,13952,25216,25344⟩) (.single ⟨13952,14016,25088,25152⟩))) (.node (.node (.single ⟨13952,14016,25152,25216⟩) (.single ⟨14016,14080,25088,25152⟩)) (.node (.single ⟨14016,14080,25152,25216⟩) (.single ⟨13952,14080,25216,25344⟩))))) (.node (.node (.node (.single ⟨18688,18816,7424,7552⟩) (.node (.single ⟨18688,18752,7552,7616⟩) (.single ⟨18688,18752,7616,7680⟩))) (.node (.node (.single ⟨18752,18816,7552,7616⟩) (.single ⟨18752,18816,7616,7680⟩)) (.node (.single ⟨18816,18944,7424,7552⟩) (.single ⟨18816,18944,7552,7680⟩)))) (.node (.node (.single ⟨25088,25216,13824,13952⟩) (.node (.single ⟨25088,25152,13952,14016⟩) (.single ⟨25088,25152,14016,14080⟩))) (.node (.node (.single ⟨25152,25216,13952,14016⟩) (.single ⟨25152,25216,14016,14080⟩)) (.node (.single ⟨25216,25344,13824,13952⟩) (.single ⟨25216,25344,13952,14080⟩))))))
def output71 : Fin 28 → GridBox := outputData71.get
def coverData71 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData71 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover71 (i : Fin 28) : Fin 28 := ⟨coverData71.get i % 28, Nat.mod_lt _ (by decide)⟩
def source71 (i : Fin 28) : Fin 28 := ⟨sourceData71.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree71 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 .empty (.cutX 7168 .empty (.cutY 19456 (.cutX 7680 (.cutY 18944 (.cutX 7424 .empty (.cutY 18688 .empty (.cutX 7552 (.cutY 18816 .full .full) (.cutY 18816 (.cutX 7616 (.cutY 18752 .full .full) (.cutY 18752 .full .full)) .full)))) .empty) .empty) .empty)))) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 (.cutX 13312 .empty (.cutY 25600 (.cutX 13824 .empty (.cutY 25088 .empty (.cutX 14080 (.cutY 25344 (.cutX 13952 (.cutY 25216 .full .full) (.cutY 25216 (.cutX 14016 (.cutY 25152 .full .full) (.cutY 25152 .full .full)) .full)) .empty) .empty))) .empty)) .empty) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 .empty (.cutX 19456 (.cutY 7168 .empty (.cutX 18944 (.cutY 7680 (.cutX 18688 .empty (.cutY 7424 .empty (.cutX 18816 (.cutY 7552 .full (.cutX 18752 (.cutY 7616 .full .full) (.cutY 7616 .full .full))) (.cutY 7552 .full .full)))) .empty) .empty)) .empty)))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 (.cutX 25600 (.cutY 13312 .empty (.cutX 25088 .empty (.cutY 13824 .empty (.cutX 25344 (.cutY 14080 (.cutX 25216 (.cutY 13952 .full (.cutX 25152 (.cutY 14016 .full .full) (.cutY 14016 .full .full))) (.cutY 13952 .full .full)) .empty) .empty)))) .empty) .empty) .empty)) .empty))) .empty))

theorem metadata71 : 0<140060506 ∧ 29<128 ∧ 73<128 ∧ 1<4 ∧
    7104/4160=1 ∧ 7104%4160=2944 ∧ ∀ i, (leaves71 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData71).mp
    (by decide +kernel)

theorem sourceChecked71_0 : ∀ i : Fin 28,
    (fun i => output71 i = raw71 (source71 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked71 : ∀ i : Fin 28, (fun i => output71 i = raw71 (source71 i)) i :=
  forallFin_of_zero_offset (fun i => output71 i = raw71 (source71 i)) sourceChecked71_0

theorem coverChecked71_0 : ∀ i : Fin 28,
    (fun i => (output71 (cover71 i)).ContainsBox (raw71 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked71 : ∀ i : Fin 28, (fun i => (output71 (cover71 i)).ContainsBox (raw71 i)) i :=
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

noncomputable def phaseMass71 : ℝ := singlePhaseMass (140060506/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw71 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass71_eq : phaseMass71 = (70030253/819200000000 : ℝ) := by
  unfold phaseMass71
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw71 output71 cover71 source71
    (gridTreeUnionCheck_sound 32768 raw71 output71 cover71 source71 tree71 checked71)
    _ (by norm_num) _, areaUnits71]
  norm_num

-- Frozen phase 5051, atom 6805, type 1, source (25,70).
def leavesData72 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves72 : Fin 13 → DyadicLeaf := leavesData72.get
def raw72 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 25 70 leaves72 i
def outputData72 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨6400,6464,17920,17984⟩) (.node (.single ⟨6400,6464,17984,18048⟩) (.single ⟨6464,6528,17920,17984⟩))) (.node (.single ⟨6464,6528,17984,18048⟩) (.node (.single ⟨6400,6528,18048,18176⟩) (.single ⟨6528,6592,17920,17984⟩)))) (.node (.node (.single ⟨6528,6592,17984,18048⟩) (.node (.single ⟨6592,6624,17920,17952⟩) (.single ⟨6592,6624,17952,17984⟩))) (.node (.node (.single ⟨6624,6656,17920,17952⟩) (.single ⟨6624,6656,17952,17984⟩)) (.node (.single ⟨6592,6656,17984,18048⟩) (.single ⟨6528,6656,18048,18176⟩))))) (.node (.node (.node (.single ⟨14592,14720,26112,26240⟩) (.node (.single ⟨14592,14720,26240,26368⟩) (.single ⟨14720,14784,26112,26176⟩))) (.node (.single ⟨14720,14784,26176,26240⟩) (.node (.single ⟨14784,14816,26112,26144⟩) (.single ⟨14784,14816,26144,26176⟩)))) (.node (.node (.single ⟨14816,14848,26112,26144⟩) (.node (.single ⟨14816,14848,26144,26176⟩) (.single ⟨14784,14848,26176,26240⟩))) (.node (.node (.single ⟨14720,14784,26240,26304⟩) (.single ⟨14720,14784,26304,26368⟩)) (.node (.single ⟨14784,14848,26240,26304⟩) (.single ⟨14784,14848,26304,26368⟩)))))) (.node (.node (.node (.node (.single ⟨17920,17984,6400,6464⟩) (.node (.single ⟨17920,17984,6464,6528⟩) (.single ⟨17984,18048,6400,6464⟩))) (.node (.single ⟨17984,18048,6464,6528⟩) (.node (.single ⟨17920,17984,6528,6592⟩) (.single ⟨17920,17952,6592,6624⟩)))) (.node (.node (.single ⟨17920,17952,6624,6656⟩) (.node (.single ⟨17952,17984,6592,6624⟩) (.single ⟨17952,17984,6624,6656⟩))) (.node (.node (.single ⟨17984,18048,6528,6592⟩) (.single ⟨17984,18048,6592,6656⟩)) (.node (.single ⟨18048,18176,6400,6528⟩) (.single ⟨18048,18176,6528,6656⟩))))) (.node (.node (.node (.single ⟨26112,26240,14592,14720⟩) (.node (.single ⟨26112,26176,14720,14784⟩) (.single ⟨26112,26144,14784,14816⟩))) (.node (.single ⟨26112,26144,14816,14848⟩) (.node (.single ⟨26144,26176,14784,14816⟩) (.single ⟨26144,26176,14816,14848⟩)))) (.node (.node (.single ⟨26176,26240,14720,14784⟩) (.node (.single ⟨26176,26240,14784,14848⟩) (.single ⟨26240,26368,14592,14720⟩))) (.node (.node (.single ⟨26240,26304,14720,14784⟩) (.single ⟨26240,26304,14784,14848⟩)) (.node (.single ⟨26304,26368,14720,14784⟩) (.single ⟨26304,26368,14784,14848⟩)))))))
def output72 : Fin 52 → GridBox := outputData72.get
def coverData72 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData72 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover72 (i : Fin 52) : Fin 52 := ⟨coverData72.get i % 52, Nat.mod_lt _ (by decide)⟩
def source72 (i : Fin 52) : Fin 52 := ⟨sourceData72.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree72 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 (.cutX 7168 (.cutY 17408 .empty (.cutX 6656 (.cutY 17920 .empty (.cutX 6400 .empty (.cutY 18176 (.cutX 6528 (.cutY 18048 (.cutX 6464 (.cutY 17984 .full .full) (.cutY 17984 .full .full)) .full) (.cutY 18048 (.cutX 6592 (.cutY 17984 .full .full) (.cutY 17984 (.cutX 6624 (.cutY 17952 .full .full) (.cutY 17952 .full .full)) .full)) .full)) .empty))) .empty)) .empty) .empty)) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 (.cutX 15360 (.cutY 25600 .empty (.cutX 14848 (.cutY 26112 .empty (.cutX 14592 .empty (.cutY 26368 (.cutX 14720 (.cutY 26240 .full .full) (.cutY 26240 (.cutX 14784 (.cutY 26176 .full .full) (.cutY 26176 (.cutX 14816 (.cutY 26144 .full .full) (.cutY 26144 .full .full)) .full)) (.cutX 14784 (.cutY 26304 .full .full) (.cutY 26304 .full .full)))) .empty))) .empty)) .empty) .empty)) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 .empty (.cutX 17408 .empty (.cutY 7168 (.cutX 17920 .empty (.cutY 6656 (.cutX 18176 (.cutY 6400 .empty (.cutX 18048 (.cutY 6528 (.cutX 17984 (.cutY 6464 .full .full) (.cutY 6464 .full .full)) (.cutX 17984 (.cutY 6592 .full (.cutX 17952 (.cutY 6624 .full .full) (.cutY 6624 .full .full))) (.cutY 6592 .full .full))) (.cutY 6528 .full .full))) .empty) .empty)) .empty))) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 .empty (.cutX 25600 .empty (.cutY 15360 (.cutX 26112 .empty (.cutY 14848 (.cutX 26368 (.cutY 14592 .empty (.cutX 26240 (.cutY 14720 .full (.cutX 26176 (.cutY 14784 .full (.cutX 26144 (.cutY 14816 .full .full) (.cutY 14816 .full .full))) (.cutY 14784 .full .full))) (.cutY 14720 .full (.cutX 26304 (.cutY 14784 .full .full) (.cutY 14784 .full .full))))) .empty) .empty)) .empty))) .empty)) .empty))) .empty))

theorem metadata72 : 0<175587969 ∧ 25<128 ∧ 70<128 ∧ 1<4 ∧
    6805/4160=1 ∧ 6805%4160=2645 ∧ ∀ i, (leaves72 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData72).mp
    (by decide +kernel)

theorem sourceChecked72_0 : ∀ i : Fin 52,
    (fun i => output72 i = raw72 (source72 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked72 : ∀ i : Fin 52, (fun i => output72 i = raw72 (source72 i)) i :=
  forallFin_of_zero_offset (fun i => output72 i = raw72 (source72 i)) sourceChecked72_0

theorem coverChecked72_0 : ∀ i : Fin 52,
    (fun i => (output72 (cover72 i)).ContainsBox (raw72 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked72 : ∀ i : Fin 52, (fun i => (output72 (cover72 i)).ContainsBox (raw72 i)) i :=
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

noncomputable def phaseMass72 : ℝ := singlePhaseMass (175587969/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw72 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass72_eq : phaseMass72 = (175587969/1638400000000 : ℝ) := by
  unfold phaseMass72
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw72 output72 cover72 source72
    (gridTreeUnionCheck_sound 32768 raw72 output72 cover72 source72 tree72 checked72)
    _ (by norm_num) _, areaUnits72]
  norm_num

-- Frozen phase 5052, atom 556, type 0, source (4,60).
def leavesData73 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves73 : Fin 4 → DyadicLeaf := leavesData73.get
def raw73 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 4 60 leaves73 i
def outputData73 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨1024,1152,15360,15488⟩) (.single ⟨1024,1152,15488,15616⟩)) (.node (.single ⟨1152,1280,15360,15488⟩) (.single ⟨1152,1280,15488,15616⟩))) (.node (.node (.single ⟨15360,15488,1024,1152⟩) (.single ⟨15360,15488,1152,1280⟩)) (.node (.single ⟨15488,15616,1024,1152⟩) (.single ⟨15488,15616,1152,1280⟩)))) (.node (.node (.node (.single ⟨17152,17280,31488,31616⟩) (.single ⟨17152,17280,31616,31744⟩)) (.node (.single ⟨17280,17408,31488,31616⟩) (.single ⟨17280,17408,31616,31744⟩))) (.node (.node (.single ⟨31488,31616,17152,17280⟩) (.single ⟨31488,31616,17280,17408⟩)) (.node (.single ⟨31616,31744,17152,17280⟩) (.single ⟨31616,31744,17280,17408⟩)))))
def output73 : Fin 16 → GridBox := outputData73.get
def coverData73 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData73 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover73 (i : Fin 16) : Fin 16 := ⟨coverData73.get i % 16, Nat.mod_lt _ (by decide)⟩
def source73 (i : Fin 16) : Fin 16 := ⟨sourceData73.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree73 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 .empty (.cutX 1024 .empty (.cutY 15360 .empty (.cutX 1536 (.cutY 15872 (.cutX 1280 (.cutY 15616 (.cutX 1152 (.cutY 15488 .full .full) (.cutY 15488 .full .full)) .empty) .empty) .empty) .empty)))) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 (.cutX 15360 .empty (.cutY 1024 .empty (.cutX 15872 (.cutY 1536 (.cutX 15616 (.cutY 1280 (.cutX 15488 (.cutY 1152 .full .full) (.cutY 1152 .full .full)) .empty) .empty) .empty) .empty))) .empty)) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 .empty (.cutX 17408 (.cutY 31744 (.cutX 16896 .empty (.cutY 31232 .empty (.cutX 17152 .empty (.cutY 31488 .empty (.cutX 17280 (.cutY 31616 .full .full) (.cutY 31616 .full .full)))))) .empty) .empty)) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 (.cutX 31744 (.cutY 17408 (.cutX 31232 .empty (.cutY 16896 .empty (.cutX 31488 .empty (.cutY 17152 .empty (.cutX 31616 (.cutY 17280 .full .full) (.cutY 17280 .full .full)))))) .empty) .empty) .empty)) .empty)) .empty))))

theorem metadata73 : 0<89519217 ∧ 4<128 ∧ 60<128 ∧ 0<4 ∧
    556/4160=0 ∧ 556%4160=556 ∧ ∀ i, (leaves73 i).Valid 8 := by
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

noncomputable def phaseMass73 : ℝ := singlePhaseMass (89519217/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw73 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass73_eq : phaseMass73 = (89519217/1638400000000 : ℝ) := by
  unfold phaseMass73
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw73 output73 cover73 source73
    (gridTreeUnionCheck_sound 32768 raw73 output73 cover73 source73 tree73 checked73)
    _ (by norm_num) _, areaUnits73]
  norm_num

-- Frozen phase 5053, atom 4713, type 1, source (4,57).
def leavesData74 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves74 : Fin 10 → DyadicLeaf := leavesData74.get
def raw74 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 4 57 leaves74 i
def outputData74 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨1024,1088,14592,14656⟩) (.single ⟨1024,1088,14656,14720⟩)) (.node (.single ⟨1088,1152,14592,14656⟩) (.node (.single ⟨1088,1152,14656,14720⟩) (.single ⟨1024,1152,14720,14848⟩)))) (.node (.node (.single ⟨1152,1216,14592,14656⟩) (.single ⟨1152,1216,14656,14720⟩)) (.node (.single ⟨1216,1280,14592,14656⟩) (.node (.single ⟨1216,1280,14656,14720⟩) (.single ⟨1152,1280,14720,14848⟩))))) (.node (.node (.node (.single ⟨14592,14656,1024,1088⟩) (.single ⟨14592,14656,1088,1152⟩)) (.node (.single ⟨14656,14720,1024,1088⟩) (.node (.single ⟨14656,14720,1088,1152⟩) (.single ⟨14592,14656,1152,1216⟩)))) (.node (.node (.single ⟨14592,14656,1216,1280⟩) (.single ⟨14656,14720,1152,1216⟩)) (.node (.single ⟨14656,14720,1216,1280⟩) (.node (.single ⟨14720,14848,1024,1152⟩) (.single ⟨14720,14848,1152,1280⟩)))))) (.node (.node (.node (.node (.single ⟨17920,18048,31488,31616⟩) (.single ⟨17920,18048,31616,31744⟩)) (.node (.single ⟨18048,18112,31488,31552⟩) (.node (.single ⟨18048,18112,31552,31616⟩) (.single ⟨18112,18176,31488,31552⟩)))) (.node (.node (.single ⟨18112,18176,31552,31616⟩) (.single ⟨18048,18112,31616,31680⟩)) (.node (.single ⟨18048,18112,31680,31744⟩) (.node (.single ⟨18112,18176,31616,31680⟩) (.single ⟨18112,18176,31680,31744⟩))))) (.node (.node (.node (.single ⟨31488,31616,17920,18048⟩) (.single ⟨31488,31552,18048,18112⟩)) (.node (.single ⟨31488,31552,18112,18176⟩) (.node (.single ⟨31552,31616,18048,18112⟩) (.single ⟨31552,31616,18112,18176⟩)))) (.node (.node (.single ⟨31616,31744,17920,18048⟩) (.single ⟨31616,31680,18048,18112⟩)) (.node (.single ⟨31616,31680,18112,18176⟩) (.node (.single ⟨31680,31744,18048,18112⟩) (.single ⟨31680,31744,18112,18176⟩)))))))
def output74 : Fin 40 → GridBox := outputData74.get
def coverData74 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 18)) (.node (.single 35) (.node (.single 21) (.single 9)))) (.node (.node (.single 19) (.single 30)) (.node (.single 20) (.node (.single 5) (.single 14))))) (.node (.node (.node (.single 34) (.single 25)) (.node (.single 6) (.node (.single 16) (.single 33)))) (.node (.node (.single 23) (.single 7)) (.node (.single 15) (.node (.single 32) (.single 24)))))) (.node (.node (.node (.node (.single 8) (.single 17)) (.node (.single 31) (.node (.single 22) (.single 0)))) (.node (.node (.single 10) (.single 39)) (.node (.single 29) (.node (.single 1) (.single 12))))) (.node (.node (.node (.single 38) (.single 27)) (.node (.single 2) (.node (.single 11) (.single 37)))) (.node (.node (.single 28) (.single 3)) (.node (.single 13) (.node (.single 36) (.single 26)))))))
def sourceData74 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover74 (i : Fin 40) : Fin 40 := ⟨coverData74.get i % 40, Nat.mod_lt _ (by decide)⟩
def source74 (i : Fin 40) : Fin 40 := ⟨sourceData74.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree74 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 .empty (.cutX 1024 .empty (.cutY 15360 (.cutX 1536 (.cutY 14848 (.cutX 1280 (.cutY 14592 .empty (.cutX 1152 (.cutY 14720 (.cutX 1088 (.cutY 14656 .full .full) (.cutY 14656 .full .full)) .full) (.cutY 14720 (.cutX 1216 (.cutY 14656 .full .full) (.cutY 14656 .full .full)) .full))) .empty) .empty) .empty) .empty))) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 (.cutX 15360 (.cutY 1024 .empty (.cutX 14848 (.cutY 1536 (.cutX 14592 .empty (.cutY 1280 (.cutX 14720 (.cutY 1152 (.cutX 14656 (.cutY 1088 .full .full) (.cutY 1088 .full .full)) (.cutX 14656 (.cutY 1216 .full .full) (.cutY 1216 .full .full))) (.cutY 1152 .full .full)) .empty)) .empty) .empty)) .empty) .empty)) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 .empty (.cutX 17408 .empty (.cutY 31744 (.cutX 17920 .empty (.cutY 31232 .empty (.cutX 18176 (.cutY 31488 .empty (.cutX 18048 (.cutY 31616 .full .full) (.cutY 31616 (.cutX 18112 (.cutY 31552 .full .full) (.cutY 31552 .full .full)) (.cutX 18112 (.cutY 31680 .full .full) (.cutY 31680 .full .full))))) .empty))) .empty))) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 (.cutX 31744 (.cutY 17408 .empty (.cutX 31232 .empty (.cutY 17920 .empty (.cutX 31488 .empty (.cutY 18176 (.cutX 31616 (.cutY 18048 .full (.cutX 31552 (.cutY 18112 .full .full) (.cutY 18112 .full .full))) (.cutY 18048 .full (.cutX 31680 (.cutY 18112 .full .full) (.cutY 18112 .full .full)))) .empty))))) .empty) .empty)) .empty)) .empty))))

theorem metadata74 : 0<169648215 ∧ 4<128 ∧ 57<128 ∧ 1<4 ∧
    4713/4160=1 ∧ 4713%4160=553 ∧ ∀ i, (leaves74 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData74).mp
    (by decide +kernel)

theorem sourceChecked74_0 : ∀ i : Fin 40,
    (fun i => output74 i = raw74 (source74 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked74 : ∀ i : Fin 40, (fun i => output74 i = raw74 (source74 i)) i :=
  forallFin_of_zero_offset (fun i => output74 i = raw74 (source74 i)) sourceChecked74_0

theorem coverChecked74_0 : ∀ i : Fin 40,
    (fun i => (output74 (cover74 i)).ContainsBox (raw74 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked74 : ∀ i : Fin 40, (fun i => (output74 (cover74 i)).ContainsBox (raw74 i)) i :=
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

noncomputable def phaseMass74 : ℝ := singlePhaseMass (169648215/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw74 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass74_eq : phaseMass74 = (33929643/327680000000 : ℝ) := by
  unfold phaseMass74
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw74 output74 cover74 source74
    (gridTreeUnionCheck_sound 32768 raw74 output74 cover74 source74 tree74 checked74)
    _ (by norm_num) _, areaUnits74]
  norm_num

-- Frozen phase 5054, atom 5290, type 1, source (9,59).
def leavesData75 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves75 : Fin 7 → DyadicLeaf := leavesData75.get
def raw75 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 9 59 leaves75 i
def outputData75 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨2304,2432,15104,15232⟩) (.node (.single ⟨2304,2432,15232,15360⟩) (.single ⟨2432,2496,15104,15168⟩))) (.node (.node (.single ⟨2432,2496,15168,15232⟩) (.single ⟨2496,2560,15104,15168⟩)) (.node (.single ⟨2496,2560,15168,15232⟩) (.single ⟨2432,2560,15232,15360⟩)))) (.node (.node (.single ⟨15104,15232,2304,2432⟩) (.node (.single ⟨15104,15168,2432,2496⟩) (.single ⟨15104,15168,2496,2560⟩))) (.node (.node (.single ⟨15168,15232,2432,2496⟩) (.single ⟨15168,15232,2496,2560⟩)) (.node (.single ⟨15232,15360,2304,2432⟩) (.single ⟨15232,15360,2432,2560⟩))))) (.node (.node (.node (.single ⟨17408,17536,30208,30336⟩) (.node (.single ⟨17408,17536,30336,30464⟩) (.single ⟨17536,17600,30208,30272⟩))) (.node (.node (.single ⟨17536,17600,30272,30336⟩) (.single ⟨17600,17664,30208,30272⟩)) (.node (.single ⟨17600,17664,30272,30336⟩) (.single ⟨17536,17664,30336,30464⟩)))) (.node (.node (.single ⟨30208,30336,17408,17536⟩) (.node (.single ⟨30208,30272,17536,17600⟩) (.single ⟨30208,30272,17600,17664⟩))) (.node (.node (.single ⟨30272,30336,17536,17600⟩) (.single ⟨30272,30336,17600,17664⟩)) (.node (.single ⟨30336,30464,17408,17536⟩) (.single ⟨30336,30464,17536,17664⟩))))))
def output75 : Fin 28 → GridBox := outputData75.get
def coverData75 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData75 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover75 (i : Fin 28) : Fin 28 := ⟨coverData75.get i % 28, Nat.mod_lt _ (by decide)⟩
def source75 (i : Fin 28) : Fin 28 := ⟨sourceData75.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree75 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 .empty (.cutX 3072 (.cutY 15360 (.cutX 2560 (.cutY 14848 .empty (.cutX 2304 .empty (.cutY 15104 .empty (.cutX 2432 (.cutY 15232 .full .full) (.cutY 15232 (.cutX 2496 (.cutY 15168 .full .full) (.cutY 15168 .full .full)) .full))))) .empty) .empty) .empty)))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 .empty (.cutX 15360 (.cutY 3072 (.cutX 14848 .empty (.cutY 2560 (.cutX 15104 .empty (.cutY 2304 .empty (.cutX 15232 (.cutY 2432 .full (.cutX 15168 (.cutY 2496 .full .full) (.cutY 2496 .full .full))) (.cutY 2432 .full .full)))) .empty)) .empty) .empty))) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 (.cutX 17408 .empty (.cutY 29696 .empty (.cutX 17920 (.cutY 30208 .empty (.cutX 17664 (.cutY 30464 (.cutX 17536 (.cutY 30336 .full .full) (.cutY 30336 (.cutX 17600 (.cutY 30272 .full .full) (.cutY 30272 .full .full)) .full)) .empty) .empty)) .empty))) .empty) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 (.cutX 29696 .empty (.cutY 17408 .empty (.cutX 30208 .empty (.cutY 17920 (.cutX 30464 (.cutY 17664 (.cutX 30336 (.cutY 17536 .full (.cutX 30272 (.cutY 17600 .full .full) (.cutY 17600 .full .full))) (.cutY 17536 .full .full)) .empty) .empty) .empty)))) .empty) .empty) .empty)) .empty))))

theorem metadata75 : 0<163200014 ∧ 9<128 ∧ 59<128 ∧ 1<4 ∧
    5290/4160=1 ∧ 5290%4160=1130 ∧ ∀ i, (leaves75 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData75).mp
    (by decide +kernel)

theorem sourceChecked75_0 : ∀ i : Fin 28,
    (fun i => output75 i = raw75 (source75 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked75 : ∀ i : Fin 28, (fun i => output75 i = raw75 (source75 i)) i :=
  forallFin_of_zero_offset (fun i => output75 i = raw75 (source75 i)) sourceChecked75_0

theorem coverChecked75_0 : ∀ i : Fin 28,
    (fun i => (output75 (cover75 i)).ContainsBox (raw75 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked75 : ∀ i : Fin 28, (fun i => (output75 (cover75 i)).ContainsBox (raw75 i)) i :=
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

noncomputable def phaseMass75 : ℝ := singlePhaseMass (163200014/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw75 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass75_eq : phaseMass75 = (81600007/819200000000 : ℝ) := by
  unfold phaseMass75
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw75 output75 cover75 source75
    (gridTreeUnionCheck_sound 32768 raw75 output75 cover75 source75 tree75 checked75)
    _ (by norm_num) _, areaUnits75]
  norm_num

-- Frozen phase 5055, atom 5507, type 1, source (11,60).
def leavesData76 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves76 : Fin 13 → DyadicLeaf := leavesData76.get
def raw76 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 11 60 leaves76 i
def outputData76 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨2816,2880,15360,15424⟩) (.node (.single ⟨2816,2880,15424,15488⟩) (.single ⟨2880,2944,15360,15424⟩))) (.node (.single ⟨2880,2944,15424,15488⟩) (.node (.single ⟨2816,2944,15488,15616⟩) (.single ⟨2944,3008,15360,15424⟩)))) (.node (.node (.single ⟨2944,3008,15424,15488⟩) (.node (.single ⟨3008,3040,15360,15392⟩) (.single ⟨3008,3040,15392,15424⟩))) (.node (.node (.single ⟨3040,3072,15360,15392⟩) (.single ⟨3040,3072,15392,15424⟩)) (.node (.single ⟨3008,3072,15424,15488⟩) (.single ⟨2944,3072,15488,15616⟩))))) (.node (.node (.node (.single ⟨15360,15424,2816,2880⟩) (.node (.single ⟨15360,15424,2880,2944⟩) (.single ⟨15424,15488,2816,2880⟩))) (.node (.single ⟨15424,15488,2880,2944⟩) (.node (.single ⟨15360,15424,2944,3008⟩) (.single ⟨15360,15392,3008,3040⟩)))) (.node (.node (.single ⟨15360,15392,3040,3072⟩) (.node (.single ⟨15392,15424,3008,3040⟩) (.single ⟨15392,15424,3040,3072⟩))) (.node (.node (.single ⟨15424,15488,2944,3008⟩) (.single ⟨15424,15488,3008,3072⟩)) (.node (.single ⟨15488,15616,2816,2944⟩) (.single ⟨15488,15616,2944,3072⟩)))))) (.node (.node (.node (.node (.single ⟨17152,17280,29696,29824⟩) (.node (.single ⟨17152,17280,29824,29952⟩) (.single ⟨17280,17344,29696,29760⟩))) (.node (.single ⟨17280,17344,29760,29824⟩) (.node (.single ⟨17344,17376,29696,29728⟩) (.single ⟨17344,17376,29728,29760⟩)))) (.node (.node (.single ⟨17376,17408,29696,29728⟩) (.node (.single ⟨17376,17408,29728,29760⟩) (.single ⟨17344,17408,29760,29824⟩))) (.node (.node (.single ⟨17280,17344,29824,29888⟩) (.single ⟨17280,17344,29888,29952⟩)) (.node (.single ⟨17344,17408,29824,29888⟩) (.single ⟨17344,17408,29888,29952⟩))))) (.node (.node (.node (.single ⟨29696,29824,17152,17280⟩) (.node (.single ⟨29696,29760,17280,17344⟩) (.single ⟨29696,29728,17344,17376⟩))) (.node (.single ⟨29696,29728,17376,17408⟩) (.node (.single ⟨29728,29760,17344,17376⟩) (.single ⟨29728,29760,17376,17408⟩)))) (.node (.node (.single ⟨29760,29824,17280,17344⟩) (.node (.single ⟨29760,29824,17344,17408⟩) (.single ⟨29824,29952,17152,17280⟩))) (.node (.node (.single ⟨29824,29888,17280,17344⟩) (.single ⟨29824,29888,17344,17408⟩)) (.node (.single ⟨29888,29952,17280,17344⟩) (.single ⟨29888,29952,17344,17408⟩)))))))
def output76 : Fin 52 → GridBox := outputData76.get
def coverData76 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 24) (.single 47))) (.node (.single 27) (.node (.single 12) (.single 25)))) (.node (.node (.single 39) (.node (.single 26) (.single 5))) (.node (.node (.single 17) (.single 46)) (.node (.single 34) (.single 6))))) (.node (.node (.node (.single 22) (.node (.single 45) (.single 29))) (.node (.single 11) (.node (.single 23) (.single 40)))) (.node (.node (.single 28) (.node (.single 0) (.single 13))) (.node (.node (.single 51) (.single 38)) (.node (.single 1) (.single 15)))))) (.node (.node (.node (.node (.single 50) (.node (.single 36) (.single 2))) (.node (.single 14) (.node (.single 49) (.single 37)))) (.node (.node (.single 3) (.node (.single 16) (.single 48))) (.node (.node (.single 35) (.single 7)) (.node (.single 18) (.single 44))))) (.node (.node (.node (.single 33) (.node (.single 8) (.single 20))) (.node (.single 43) (.node (.single 31) (.single 9)))) (.node (.node (.single 19) (.node (.single 42) (.single 32))) (.node (.node (.single 10) (.single 21)) (.node (.single 41) (.single 30)))))))
def sourceData76 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover76 (i : Fin 52) : Fin 52 := ⟨coverData76.get i % 52, Nat.mod_lt _ (by decide)⟩
def source76 (i : Fin 52) : Fin 52 := ⟨sourceData76.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree76 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 .empty (.cutX 3072 (.cutY 15360 .empty (.cutX 2560 .empty (.cutY 15872 (.cutX 2816 .empty (.cutY 15616 (.cutX 2944 (.cutY 15488 (.cutX 2880 (.cutY 15424 .full .full) (.cutY 15424 .full .full)) .full) (.cutY 15488 (.cutX 3008 (.cutY 15424 .full .full) (.cutY 15424 (.cutX 3040 (.cutY 15392 .full .full) (.cutY 15392 .full .full)) .full)) .full)) .empty)) .empty))) .empty)))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 .empty (.cutX 15360 .empty (.cutY 3072 (.cutX 15872 (.cutY 2560 .empty (.cutX 15616 (.cutY 2816 .empty (.cutX 15488 (.cutY 2944 (.cutX 15424 (.cutY 2880 .full .full) (.cutY 2880 .full .full)) (.cutX 15424 (.cutY 3008 .full (.cutX 15392 (.cutY 3040 .full .full) (.cutY 3040 .full .full))) (.cutY 3008 .full .full))) (.cutY 2944 .full .full))) .empty)) .empty) .empty)))) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 (.cutX 17408 (.cutY 29696 .empty (.cutX 16896 .empty (.cutY 30208 (.cutX 17152 .empty (.cutY 29952 (.cutX 17280 (.cutY 29824 .full .full) (.cutY 29824 (.cutX 17344 (.cutY 29760 .full .full) (.cutY 29760 (.cutX 17376 (.cutY 29728 .full .full) (.cutY 29728 .full .full)) .full)) (.cutX 17344 (.cutY 29888 .full .full) (.cutY 29888 .full .full)))) .empty)) .empty))) .empty) .empty) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 (.cutX 29696 .empty (.cutY 17408 (.cutX 30208 (.cutY 16896 .empty (.cutX 29952 (.cutY 17152 .empty (.cutX 29824 (.cutY 17280 .full (.cutX 29760 (.cutY 17344 .full (.cutX 29728 (.cutY 17376 .full .full) (.cutY 17376 .full .full))) (.cutY 17344 .full .full))) (.cutY 17280 .full (.cutX 29888 (.cutY 17344 .full .full) (.cutY 17344 .full .full))))) .empty)) .empty) .empty)) .empty) .empty) .empty)) .empty))))

theorem metadata76 : 0<163200014 ∧ 11<128 ∧ 60<128 ∧ 1<4 ∧
    5507/4160=1 ∧ 5507%4160=1347 ∧ ∀ i, (leaves76 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData76).mp
    (by decide +kernel)

theorem sourceChecked76_0 : ∀ i : Fin 52,
    (fun i => output76 i = raw76 (source76 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked76 : ∀ i : Fin 52, (fun i => output76 i = raw76 (source76 i)) i :=
  forallFin_of_zero_offset (fun i => output76 i = raw76 (source76 i)) sourceChecked76_0

theorem coverChecked76_0 : ∀ i : Fin 52,
    (fun i => (output76 (cover76 i)).ContainsBox (raw76 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked76 : ∀ i : Fin 52, (fun i => (output76 (cover76 i)).ContainsBox (raw76 i)) i :=
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

noncomputable def phaseMass76 : ℝ := singlePhaseMass (163200014/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw76 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass76_eq : phaseMass76 = (81600007/819200000000 : ℝ) := by
  unfold phaseMass76
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw76 output76 cover76 source76
    (gridTreeUnionCheck_sound 32768 raw76 output76 cover76 source76 tree76 checked76)
    _ (by norm_num) _, areaUnits76]
  norm_num

-- Frozen phase 5056, atom 5065, type 1, source (7,58).
def leavesData77 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩))) (.node (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩)))) (.node (.node (.node (.single ⟨3,4,0⟩) (.single ⟨3,4,1⟩)) (.node (.single ⟨3,5,0⟩) (.single ⟨3,5,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves77 : Fin 16 → DyadicLeaf := leavesData77.get
def raw77 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 7 58 leaves77 i
def outputData77 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨1792,1856,14848,14912⟩) (.single ⟨1792,1856,14912,14976⟩)) (.node (.single ⟨1856,1920,14848,14912⟩) (.single ⟨1856,1920,14912,14976⟩))) (.node (.node (.single ⟨1792,1920,14976,15104⟩) (.single ⟨1920,1952,14848,14880⟩)) (.node (.single ⟨1920,1952,14880,14912⟩) (.single ⟨1952,1984,14848,14880⟩)))) (.node (.node (.node (.single ⟨1952,1984,14880,14912⟩) (.single ⟨1920,1984,14912,14976⟩)) (.node (.single ⟨1984,2016,14848,14880⟩) (.single ⟨1984,2016,14880,14912⟩))) (.node (.node (.single ⟨2016,2048,14848,14880⟩) (.single ⟨2016,2048,14880,14912⟩)) (.node (.single ⟨1984,2048,14912,14976⟩) (.single ⟨1920,2048,14976,15104⟩))))) (.node (.node (.node (.node (.single ⟨14848,14912,1792,1856⟩) (.single ⟨14848,14912,1856,1920⟩)) (.node (.single ⟨14912,14976,1792,1856⟩) (.single ⟨14912,14976,1856,1920⟩))) (.node (.node (.single ⟨14848,14880,1920,1952⟩) (.single ⟨14848,14880,1952,1984⟩)) (.node (.single ⟨14880,14912,1920,1952⟩) (.single ⟨14880,14912,1952,1984⟩)))) (.node (.node (.node (.single ⟨14848,14880,1984,2016⟩) (.single ⟨14848,14880,2016,2048⟩)) (.node (.single ⟨14880,14912,1984,2016⟩) (.single ⟨14880,14912,2016,2048⟩))) (.node (.node (.single ⟨14912,14976,1920,1984⟩) (.single ⟨14912,14976,1984,2048⟩)) (.node (.single ⟨14976,15104,1792,1920⟩) (.single ⟨14976,15104,1920,2048⟩)))))) (.node (.node (.node (.node (.node (.single ⟨17664,17792,30720,30848⟩) (.single ⟨17664,17792,30848,30976⟩)) (.node (.single ⟨17792,17856,30720,30784⟩) (.single ⟨17792,17856,30784,30848⟩))) (.node (.node (.single ⟨17856,17888,30720,30752⟩) (.single ⟨17856,17888,30752,30784⟩)) (.node (.single ⟨17888,17920,30720,30752⟩) (.single ⟨17888,17920,30752,30784⟩)))) (.node (.node (.node (.single ⟨17856,17888,30784,30816⟩) (.single ⟨17856,17888,30816,30848⟩)) (.node (.single ⟨17888,17920,30784,30816⟩) (.single ⟨17888,17920,30816,30848⟩))) (.node (.node (.single ⟨17792,17856,30848,30912⟩) (.single ⟨17792,17856,30912,30976⟩)) (.node (.single ⟨17856,17920,30848,30912⟩) (.single ⟨17856,17920,30912,30976⟩))))) (.node (.node (.node (.node (.single ⟨30720,30848,17664,17792⟩) (.single ⟨30720,30784,17792,17856⟩)) (.node (.single ⟨30720,30752,17856,17888⟩) (.single ⟨30720,30752,17888,17920⟩))) (.node (.node (.single ⟨30752,30784,17856,17888⟩) (.single ⟨30752,30784,17888,17920⟩)) (.node (.single ⟨30784,30848,17792,17856⟩) (.single ⟨30784,30816,17856,17888⟩)))) (.node (.node (.node (.single ⟨30784,30816,17888,17920⟩) (.single ⟨30816,30848,17856,17888⟩)) (.node (.single ⟨30816,30848,17888,17920⟩) (.single ⟨30848,30976,17664,17792⟩))) (.node (.node (.single ⟨30848,30912,17792,17856⟩) (.single ⟨30848,30912,17856,17920⟩)) (.node (.single ⟨30912,30976,17792,17856⟩) (.single ⟨30912,30976,17856,17920⟩)))))))
def output77 : Fin 64 → GridBox := outputData77.get
def coverData77 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 30)) (.node (.single 59) (.single 33))) (.node (.node (.single 15) (.single 31)) (.node (.single 48) (.single 32)))) (.node (.node (.node (.single 0) (.single 16)) (.node (.single 63) (.single 47))) (.node (.node (.single 1) (.single 18)) (.node (.single 62) (.single 45))))) (.node (.node (.node (.node (.single 2) (.single 17)) (.node (.single 61) (.single 46))) (.node (.node (.single 3) (.single 19)) (.node (.single 60) (.single 44)))) (.node (.node (.node (.single 9) (.single 28)) (.node (.single 54) (.single 35))) (.node (.node (.single 14) (.single 29)) (.node (.single 49) (.single 34)))))) (.node (.node (.node (.node (.node (.single 5) (.single 20)) (.node (.single 58) (.single 43))) (.node (.node (.single 6) (.single 22)) (.node (.single 57) (.single 41)))) (.node (.node (.node (.single 7) (.single 21)) (.node (.single 56) (.single 42))) (.node (.node (.single 8) (.single 23)) (.node (.single 55) (.single 40))))) (.node (.node (.node (.node (.single 10) (.single 24)) (.node (.single 53) (.single 39))) (.node (.node (.single 11) (.single 26)) (.node (.single 52) (.single 37)))) (.node (.node (.node (.single 12) (.single 25)) (.node (.single 51) (.single 38))) (.node (.node (.single 13) (.single 27)) (.node (.single 50) (.single 36)))))))
def sourceData77 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.single 20))) (.node (.node (.single 0) (.single 32)) (.node (.single 36) (.single 40)))) (.node (.node (.node (.single 44) (.single 24)) (.node (.single 48) (.single 52))) (.node (.node (.single 56) (.single 60)) (.node (.single 28) (.single 4))))) (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.single 21))) (.node (.node (.single 33) (.single 41)) (.node (.single 37) (.single 45)))) (.node (.node (.node (.single 49) (.single 57)) (.node (.single 53) (.single 61))) (.node (.node (.single 25) (.single 29)) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.node (.single 7) (.single 3)) (.node (.single 31) (.single 27))) (.node (.node (.single 63) (.single 55)) (.node (.single 59) (.single 51)))) (.node (.node (.node (.single 47) (.single 39)) (.node (.single 43) (.single 35))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11))))) (.node (.node (.node (.node (.single 6) (.single 30)) (.node (.single 62) (.single 58))) (.node (.node (.single 54) (.single 50)) (.node (.single 26) (.single 46)))) (.node (.node (.node (.single 42) (.single 38)) (.node (.single 34) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover77 (i : Fin 64) : Fin 64 := ⟨coverData77.get i % 64, Nat.mod_lt _ (by decide)⟩
def source77 (i : Fin 64) : Fin 64 := ⟨sourceData77.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree77 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 .empty (.cutX 1024 .empty (.cutY 15360 (.cutX 1536 .empty (.cutY 14848 .empty (.cutX 1792 .empty (.cutY 15104 (.cutX 1920 (.cutY 14976 (.cutX 1856 (.cutY 14912 .full .full) (.cutY 14912 .full .full)) .full) (.cutY 14976 (.cutX 1984 (.cutY 14912 (.cutX 1952 (.cutY 14880 .full .full) (.cutY 14880 .full .full)) .full) (.cutY 14912 (.cutX 2016 (.cutY 14880 .full .full) (.cutY 14880 .full .full)) .full)) .full)) .empty)))) .empty))) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 (.cutX 15360 (.cutY 1024 .empty (.cutX 14848 .empty (.cutY 1536 .empty (.cutX 15104 (.cutY 1792 .empty (.cutX 14976 (.cutY 1920 (.cutX 14912 (.cutY 1856 .full .full) (.cutY 1856 .full .full)) (.cutX 14912 (.cutY 1984 (.cutX 14880 (.cutY 1952 .full .full) (.cutY 1952 .full .full)) (.cutX 14880 (.cutY 2016 .full .full) (.cutY 2016 .full .full))) (.cutY 1984 .full .full))) (.cutY 1920 .full .full))) .empty)))) .empty) .empty)) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 .empty (.cutX 17408 .empty (.cutY 31744 (.cutX 17920 (.cutY 31232 (.cutX 17664 .empty (.cutY 30976 (.cutX 17792 (.cutY 30848 .full .full) (.cutY 30848 (.cutX 17856 (.cutY 30784 .full .full) (.cutY 30784 (.cutX 17888 (.cutY 30752 .full .full) (.cutY 30752 .full .full)) (.cutX 17888 (.cutY 30816 .full .full) (.cutY 30816 .full .full)))) (.cutX 17856 (.cutY 30912 .full .full) (.cutY 30912 .full .full)))) .empty)) .empty) .empty) .empty))) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 (.cutX 31744 (.cutY 17408 .empty (.cutX 31232 (.cutY 17920 (.cutX 30976 (.cutY 17664 .empty (.cutX 30848 (.cutY 17792 .full (.cutX 30784 (.cutY 17856 .full (.cutX 30752 (.cutY 17888 .full .full) (.cutY 17888 .full .full))) (.cutY 17856 .full (.cutX 30816 (.cutY 17888 .full .full) (.cutY 17888 .full .full))))) (.cutY 17792 .full (.cutX 30912 (.cutY 17856 .full .full) (.cutY 17856 .full .full))))) .empty) .empty) .empty)) .empty) .empty)) .empty)) .empty))))

theorem metadata77 : 0<169648215 ∧ 7<128 ∧ 58<128 ∧ 1<4 ∧
    5065/4160=1 ∧ 5065%4160=905 ∧ ∀ i, (leaves77 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData77).mp
    (by decide +kernel)

theorem sourceChecked77_0 : ∀ i : Fin 64,
    (fun i => output77 i = raw77 (source77 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked77 : ∀ i : Fin 64, (fun i => output77 i = raw77 (source77 i)) i :=
  forallFin_of_zero_offset (fun i => output77 i = raw77 (source77 i)) sourceChecked77_0

theorem coverChecked77_0 : ∀ i : Fin 64,
    (fun i => (output77 (cover77 i)).ContainsBox (raw77 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked77 : ∀ i : Fin 64, (fun i => (output77 (cover77 i)).ContainsBox (raw77 i)) i :=
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

noncomputable def phaseMass77 : ℝ := singlePhaseMass (169648215/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw77 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass77_eq : phaseMass77 = (33929643/327680000000 : ℝ) := by
  unfold phaseMass77
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw77 output77 cover77 source77
    (gridTreeUnionCheck_sound 32768 raw77 output77 cover77 source77 tree77 checked77)
    _ (by norm_num) _, areaUnits77]
  norm_num

-- Frozen phase 5057, atom 7660, type 1, source (38,80).
def leavesData78 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves78 : Fin 7 → DyadicLeaf := leavesData78.get
def raw78 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 38 80 leaves78 i
def outputData78 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨9728,9856,20480,20608⟩) (.node (.single ⟨9728,9856,20608,20736⟩) (.single ⟨9856,9920,20480,20544⟩))) (.node (.node (.single ⟨9856,9920,20544,20608⟩) (.single ⟨9920,9984,20480,20544⟩)) (.node (.single ⟨9920,9984,20544,20608⟩) (.single ⟨9856,9984,20608,20736⟩)))) (.node (.node (.single ⟨12032,12160,22784,22912⟩) (.node (.single ⟨12032,12160,22912,23040⟩) (.single ⟨12160,12224,22784,22848⟩))) (.node (.node (.single ⟨12160,12224,22848,22912⟩) (.single ⟨12224,12288,22784,22848⟩)) (.node (.single ⟨12224,12288,22848,22912⟩) (.single ⟨12160,12288,22912,23040⟩))))) (.node (.node (.node (.single ⟨20480,20608,9728,9856⟩) (.node (.single ⟨20480,20544,9856,9920⟩) (.single ⟨20480,20544,9920,9984⟩))) (.node (.node (.single ⟨20544,20608,9856,9920⟩) (.single ⟨20544,20608,9920,9984⟩)) (.node (.single ⟨20608,20736,9728,9856⟩) (.single ⟨20608,20736,9856,9984⟩)))) (.node (.node (.single ⟨22784,22912,12032,12160⟩) (.node (.single ⟨22784,22848,12160,12224⟩) (.single ⟨22784,22848,12224,12288⟩))) (.node (.node (.single ⟨22848,22912,12160,12224⟩) (.single ⟨22848,22912,12224,12288⟩)) (.node (.single ⟨22912,23040,12032,12160⟩) (.single ⟨22912,23040,12160,12288⟩))))))
def output78 : Fin 28 → GridBox := outputData78.get
def coverData78 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData78 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover78 (i : Fin 28) : Fin 28 := ⟨coverData78.get i % 28, Nat.mod_lt _ (by decide)⟩
def source78 (i : Fin 28) : Fin 28 := ⟨sourceData78.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree78 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 (.cutX 9216 .empty (.cutY 21504 (.cutX 9728 .empty (.cutY 20992 (.cutX 9984 (.cutY 20736 (.cutX 9856 (.cutY 20608 .full .full) (.cutY 20608 (.cutX 9920 (.cutY 20544 .full .full) (.cutY 20544 .full .full)) .full)) .empty) .empty) .empty)) .empty)) .empty) (.cutY 22528 .empty (.cutX 11264 .empty (.cutY 23552 (.cutX 11776 .empty (.cutY 23040 (.cutX 12032 .empty (.cutY 22784 .empty (.cutX 12160 (.cutY 22912 .full .full) (.cutY 22912 (.cutX 12224 (.cutY 22848 .full .full) (.cutY 22848 .full .full)) .full)))) .empty)) .empty))))) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 (.cutY 10240 (.cutX 21504 (.cutY 9216 .empty (.cutX 20992 (.cutY 9728 .empty (.cutX 20736 (.cutY 9984 (.cutX 20608 (.cutY 9856 .full (.cutX 20544 (.cutY 9920 .full .full) (.cutY 9920 .full .full))) (.cutY 9856 .full .full)) .empty) .empty)) .empty)) .empty) .empty) (.cutY 10240 .empty (.cutX 23552 (.cutY 11264 .empty (.cutX 23040 (.cutY 11776 .empty (.cutX 22784 .empty (.cutY 12032 .empty (.cutX 22912 (.cutY 12160 .full (.cutX 22848 (.cutY 12224 .full .full) (.cutY 12224 .full .full))) (.cutY 12160 .full .full))))) .empty)) .empty))) .empty))) .empty) .empty))

theorem metadata78 : 0<156512574 ∧ 38<128 ∧ 80<128 ∧ 1<4 ∧
    7660/4160=1 ∧ 7660%4160=3500 ∧ ∀ i, (leaves78 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData78).mp
    (by decide +kernel)

theorem sourceChecked78_0 : ∀ i : Fin 28,
    (fun i => output78 i = raw78 (source78 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked78 : ∀ i : Fin 28, (fun i => output78 i = raw78 (source78 i)) i :=
  forallFin_of_zero_offset (fun i => output78 i = raw78 (source78 i)) sourceChecked78_0

theorem coverChecked78_0 : ∀ i : Fin 28,
    (fun i => (output78 (cover78 i)).ContainsBox (raw78 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked78 : ∀ i : Fin 28, (fun i => (output78 (cover78 i)).ContainsBox (raw78 i)) i :=
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

noncomputable def phaseMass78 : ℝ := singlePhaseMass (156512574/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw78 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass78_eq : phaseMass78 = (78256287/819200000000 : ℝ) := by
  unfold phaseMass78
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw78 output78 cover78 source78
    (gridTreeUnionCheck_sound 32768 raw78 output78 cover78 source78 tree78 checked78)
    _ (by norm_num) _, areaUnits78]
  norm_num

-- Frozen phase 5058, atom 3394, type 0, source (36,82).
def leavesData79 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves79 : Fin 4 → DyadicLeaf := leavesData79.get
def raw79 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 36 82 leaves79 i
def outputData79 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨9216,9344,20992,21120⟩) (.single ⟨9216,9344,21120,21248⟩)) (.node (.single ⟨9344,9472,20992,21120⟩) (.single ⟨9344,9472,21120,21248⟩))) (.node (.node (.single ⟨11520,11648,23296,23424⟩) (.single ⟨11520,11648,23424,23552⟩)) (.node (.single ⟨11648,11776,23296,23424⟩) (.single ⟨11648,11776,23424,23552⟩)))) (.node (.node (.node (.single ⟨20992,21120,9216,9344⟩) (.single ⟨20992,21120,9344,9472⟩)) (.node (.single ⟨21120,21248,9216,9344⟩) (.single ⟨21120,21248,9344,9472⟩))) (.node (.node (.single ⟨23296,23424,11520,11648⟩) (.single ⟨23296,23424,11648,11776⟩)) (.node (.single ⟨23424,23552,11520,11648⟩) (.single ⟨23424,23552,11648,11776⟩)))))
def output79 : Fin 16 → GridBox := outputData79.get
def coverData79 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData79 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover79 (i : Fin 16) : Fin 16 := ⟨coverData79.get i % 16, Nat.mod_lt _ (by decide)⟩
def source79 (i : Fin 16) : Fin 16 := ⟨sourceData79.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree79 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 (.cutX 9216 .empty (.cutY 21504 (.cutX 9728 (.cutY 20992 .empty (.cutX 9472 (.cutY 21248 (.cutX 9344 (.cutY 21120 .full .full) (.cutY 21120 .full .full)) .empty) .empty)) .empty) .empty)) .empty) (.cutY 22528 .empty (.cutX 11264 .empty (.cutY 23552 (.cutX 11776 (.cutY 23040 .empty (.cutX 11520 .empty (.cutY 23296 .empty (.cutX 11648 (.cutY 23424 .full .full) (.cutY 23424 .full .full))))) .empty) .empty))))) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 (.cutY 10240 (.cutX 21504 (.cutY 9216 .empty (.cutX 20992 .empty (.cutY 9728 (.cutX 21248 (.cutY 9472 (.cutX 21120 (.cutY 9344 .full .full) (.cutY 9344 .full .full)) .empty) .empty) .empty))) .empty) .empty) (.cutY 10240 .empty (.cutX 23552 (.cutY 11264 .empty (.cutX 23040 .empty (.cutY 11776 (.cutX 23296 .empty (.cutY 11520 .empty (.cutX 23424 (.cutY 11648 .full .full) (.cutY 11648 .full .full)))) .empty))) .empty))) .empty))) .empty) .empty))

theorem metadata79 : 0<167980383 ∧ 36<128 ∧ 82<128 ∧ 0<4 ∧
    3394/4160=0 ∧ 3394%4160=3394 ∧ ∀ i, (leaves79 i).Valid 8 := by
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

noncomputable def phaseMass79 : ℝ := singlePhaseMass (167980383/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw79 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass79_eq : phaseMass79 = (167980383/1638400000000 : ℝ) := by
  unfold phaseMass79
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw79 output79 cover79 source79
    (gridTreeUnionCheck_sound 32768 raw79 output79 cover79 source79 tree79 checked79)
    _ (by norm_num) _, areaUnits79]
  norm_num

-- Frozen phase 5059, atom 3555, type 0, source (39,84).
def leavesData80 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves80 : Fin 4 → DyadicLeaf := leavesData80.get
def raw80 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 39 84 leaves80 i
def outputData80 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨9984,10112,21504,21632⟩) (.single ⟨9984,10112,21632,21760⟩)) (.node (.single ⟨10112,10240,21504,21632⟩) (.single ⟨10112,10240,21632,21760⟩))) (.node (.node (.single ⟨11008,11136,22528,22656⟩) (.single ⟨11008,11136,22656,22784⟩)) (.node (.single ⟨11136,11264,22528,22656⟩) (.single ⟨11136,11264,22656,22784⟩)))) (.node (.node (.node (.single ⟨21504,21632,9984,10112⟩) (.single ⟨21504,21632,10112,10240⟩)) (.node (.single ⟨21632,21760,9984,10112⟩) (.single ⟨21632,21760,10112,10240⟩))) (.node (.node (.single ⟨22528,22656,11008,11136⟩) (.single ⟨22528,22656,11136,11264⟩)) (.node (.single ⟨22656,22784,11008,11136⟩) (.single ⟨22656,22784,11136,11264⟩)))))
def output80 : Fin 16 → GridBox := outputData80.get
def coverData80 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData80 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover80 (i : Fin 16) : Fin 16 := ⟨coverData80.get i % 16, Nat.mod_lt _ (by decide)⟩
def source80 (i : Fin 16) : Fin 16 := ⟨sourceData80.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree80 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 (.cutX 9216 .empty (.cutY 21504 .empty (.cutX 9728 .empty (.cutY 22016 (.cutX 9984 .empty (.cutY 21760 (.cutX 10112 (.cutY 21632 .full .full) (.cutY 21632 .full .full)) .empty)) .empty)))) .empty) (.cutY 22528 .empty (.cutX 11264 (.cutY 23552 (.cutX 10752 .empty (.cutY 23040 (.cutX 11008 .empty (.cutY 22784 (.cutX 11136 (.cutY 22656 .full .full) (.cutY 22656 .full .full)) .empty)) .empty)) .empty) .empty)))) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 (.cutY 10240 (.cutX 21504 .empty (.cutY 9216 .empty (.cutX 22016 (.cutY 9728 .empty (.cutX 21760 (.cutY 9984 .empty (.cutX 21632 (.cutY 10112 .full .full) (.cutY 10112 .full .full))) .empty)) .empty))) .empty) (.cutY 10240 .empty (.cutX 23552 (.cutY 11264 (.cutX 23040 (.cutY 10752 .empty (.cutX 22784 (.cutY 11008 .empty (.cutX 22656 (.cutY 11136 .full .full) (.cutY 11136 .full .full))) .empty)) .empty) .empty) .empty))) .empty))) .empty) .empty))

theorem metadata80 : 0<167980383 ∧ 39<128 ∧ 84<128 ∧ 0<4 ∧
    3555/4160=0 ∧ 3555%4160=3555 ∧ ∀ i, (leaves80 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData80).mp
    (by decide +kernel)

theorem sourceChecked80_0 : ∀ i : Fin 16,
    (fun i => output80 i = raw80 (source80 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked80 : ∀ i : Fin 16, (fun i => output80 i = raw80 (source80 i)) i :=
  forallFin_of_zero_offset (fun i => output80 i = raw80 (source80 i)) sourceChecked80_0

theorem coverChecked80_0 : ∀ i : Fin 16,
    (fun i => (output80 (cover80 i)).ContainsBox (raw80 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked80 : ∀ i : Fin 16, (fun i => (output80 (cover80 i)).ContainsBox (raw80 i)) i :=
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

noncomputable def phaseMass80 : ℝ := singlePhaseMass (167980383/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw80 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass80_eq : phaseMass80 = (167980383/1638400000000 : ℝ) := by
  unfold phaseMass80
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw80 output80 cover80 source80
    (gridTreeUnionCheck_sound 32768 raw80 output80 cover80 source80 tree80 checked80)
    _ (by norm_num) _, areaUnits80]
  norm_num

-- Frozen phase 5060, atom 2487, type 0, source (23,72).
def leavesData81 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves81 : Fin 7 → DyadicLeaf := leavesData81.get
def raw81 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 23 72 leaves81 i
def outputData81 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨5888,6016,18432,18560⟩) (.node (.single ⟨5888,6016,18560,18688⟩) (.single ⟨6016,6080,18432,18496⟩))) (.node (.node (.single ⟨6016,6080,18496,18560⟩) (.single ⟨6080,6144,18432,18496⟩)) (.node (.single ⟨6080,6144,18496,18560⟩) (.single ⟨6016,6144,18560,18688⟩)))) (.node (.node (.single ⟨14080,14208,26624,26752⟩) (.node (.single ⟨14080,14208,26752,26880⟩) (.single ⟨14208,14272,26624,26688⟩))) (.node (.node (.single ⟨14208,14272,26688,26752⟩) (.single ⟨14272,14336,26624,26688⟩)) (.node (.single ⟨14272,14336,26688,26752⟩) (.single ⟨14208,14336,26752,26880⟩))))) (.node (.node (.node (.single ⟨18432,18560,5888,6016⟩) (.node (.single ⟨18432,18496,6016,6080⟩) (.single ⟨18432,18496,6080,6144⟩))) (.node (.node (.single ⟨18496,18560,6016,6080⟩) (.single ⟨18496,18560,6080,6144⟩)) (.node (.single ⟨18560,18688,5888,6016⟩) (.single ⟨18560,18688,6016,6144⟩)))) (.node (.node (.single ⟨26624,26752,14080,14208⟩) (.node (.single ⟨26624,26688,14208,14272⟩) (.single ⟨26624,26688,14272,14336⟩))) (.node (.node (.single ⟨26688,26752,14208,14272⟩) (.single ⟨26688,26752,14272,14336⟩)) (.node (.single ⟨26752,26880,14080,14208⟩) (.single ⟨26752,26880,14208,14336⟩))))))
def output81 : Fin 28 → GridBox := outputData81.get
def coverData81 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData81 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover81 (i : Fin 28) : Fin 28 := ⟨coverData81.get i % 28, Nat.mod_lt _ (by decide)⟩
def source81 (i : Fin 28) : Fin 28 := ⟨sourceData81.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree81 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 .empty (.cutX 5120 .empty (.cutY 19456 (.cutX 5632 .empty (.cutY 18944 (.cutX 5888 .empty (.cutY 18688 (.cutX 6016 (.cutY 18560 .full .full) (.cutY 18560 (.cutX 6080 (.cutY 18496 .full .full) (.cutY 18496 .full .full)) .full)) .empty)) .empty)) .empty))) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 .empty (.cutX 13312 .empty (.cutY 27648 (.cutX 13824 .empty (.cutY 27136 (.cutX 14080 .empty (.cutY 26880 (.cutX 14208 (.cutY 26752 .full .full) (.cutY 26752 (.cutX 14272 (.cutY 26688 .full .full) (.cutY 26688 .full .full)) .full)) .empty)) .empty)) .empty))) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 (.cutX 19456 (.cutY 5120 .empty (.cutX 18944 (.cutY 5632 .empty (.cutX 18688 (.cutY 5888 .empty (.cutX 18560 (.cutY 6016 .full (.cutX 18496 (.cutY 6080 .full .full) (.cutY 6080 .full .full))) (.cutY 6016 .full .full))) .empty)) .empty)) .empty) .empty))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 (.cutX 27648 (.cutY 13312 .empty (.cutX 27136 (.cutY 13824 .empty (.cutX 26880 (.cutY 14080 .empty (.cutX 26752 (.cutY 14208 .full (.cutX 26688 (.cutY 14272 .full .full) (.cutY 14272 .full .full))) (.cutY 14208 .full .full))) .empty)) .empty)) .empty) .empty))) .empty))) .empty))

theorem metadata81 : 0<147396112 ∧ 23<128 ∧ 72<128 ∧ 0<4 ∧
    2487/4160=0 ∧ 2487%4160=2487 ∧ ∀ i, (leaves81 i).Valid 8 := by
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

noncomputable def phaseMass81 : ℝ := singlePhaseMass (147396112/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw81 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass81_eq : phaseMass81 = (9212257/102400000000 : ℝ) := by
  unfold phaseMass81
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw81 output81 cover81 source81
    (gridTreeUnionCheck_sound 32768 raw81 output81 cover81 source81 tree81 checked81)
    _ (by norm_num) _, areaUnits81]
  norm_num

-- Frozen phase 5061, atom 2230, type 0, source (20,70).
def leavesData82 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves82 : Fin 7 → DyadicLeaf := leavesData82.get
def raw82 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 20 70 leaves82 i
def outputData82 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨5120,5248,17920,18048⟩) (.node (.single ⟨5120,5248,18048,18176⟩) (.single ⟨5248,5312,17920,17984⟩))) (.node (.node (.single ⟨5248,5312,17984,18048⟩) (.single ⟨5312,5376,17920,17984⟩)) (.node (.single ⟨5312,5376,17984,18048⟩) (.single ⟨5248,5376,18048,18176⟩)))) (.node (.node (.single ⟨14592,14720,27392,27520⟩) (.node (.single ⟨14592,14720,27520,27648⟩) (.single ⟨14720,14784,27392,27456⟩))) (.node (.node (.single ⟨14720,14784,27456,27520⟩) (.single ⟨14784,14848,27392,27456⟩)) (.node (.single ⟨14784,14848,27456,27520⟩) (.single ⟨14720,14848,27520,27648⟩))))) (.node (.node (.node (.single ⟨17920,18048,5120,5248⟩) (.node (.single ⟨17920,17984,5248,5312⟩) (.single ⟨17920,17984,5312,5376⟩))) (.node (.node (.single ⟨17984,18048,5248,5312⟩) (.single ⟨17984,18048,5312,5376⟩)) (.node (.single ⟨18048,18176,5120,5248⟩) (.single ⟨18048,18176,5248,5376⟩)))) (.node (.node (.single ⟨27392,27520,14592,14720⟩) (.node (.single ⟨27392,27456,14720,14784⟩) (.single ⟨27392,27456,14784,14848⟩))) (.node (.node (.single ⟨27456,27520,14720,14784⟩) (.single ⟨27456,27520,14784,14848⟩)) (.node (.single ⟨27520,27648,14592,14720⟩) (.single ⟨27520,27648,14720,14848⟩))))))
def output82 : Fin 28 → GridBox := outputData82.get
def coverData82 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData82 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover82 (i : Fin 28) : Fin 28 := ⟨coverData82.get i % 28, Nat.mod_lt _ (by decide)⟩
def source82 (i : Fin 28) : Fin 28 := ⟨sourceData82.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree82 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 (.cutX 5120 .empty (.cutY 17408 .empty (.cutX 5632 (.cutY 17920 .empty (.cutX 5376 (.cutY 18176 (.cutX 5248 (.cutY 18048 .full .full) (.cutY 18048 (.cutX 5312 (.cutY 17984 .full .full) (.cutY 17984 .full .full)) .full)) .empty) .empty)) .empty))) .empty) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 .empty (.cutX 15360 (.cutY 27648 (.cutX 14848 (.cutY 27136 .empty (.cutX 14592 .empty (.cutY 27392 .empty (.cutX 14720 (.cutY 27520 .full .full) (.cutY 27520 (.cutX 14784 (.cutY 27456 .full .full) (.cutY 27456 .full .full)) .full))))) .empty) .empty) .empty))) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 (.cutX 17408 .empty (.cutY 5120 .empty (.cutX 17920 .empty (.cutY 5632 (.cutX 18176 (.cutY 5376 (.cutX 18048 (.cutY 5248 .full (.cutX 17984 (.cutY 5312 .full .full) (.cutY 5312 .full .full))) (.cutY 5248 .full .full)) .empty) .empty) .empty)))) .empty) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 .empty (.cutX 27648 (.cutY 15360 (.cutX 27136 .empty (.cutY 14848 (.cutX 27392 .empty (.cutY 14592 .empty (.cutX 27520 (.cutY 14720 .full (.cutX 27456 (.cutY 14784 .full .full) (.cutY 14784 .full .full))) (.cutY 14720 .full .full)))) .empty)) .empty) .empty)))) .empty))) .empty))

theorem metadata82 : 0<191564598 ∧ 20<128 ∧ 70<128 ∧ 0<4 ∧
    2230/4160=0 ∧ 2230%4160=2230 ∧ ∀ i, (leaves82 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData82).mp
    (by decide +kernel)

theorem sourceChecked82_0 : ∀ i : Fin 28,
    (fun i => output82 i = raw82 (source82 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked82 : ∀ i : Fin 28, (fun i => output82 i = raw82 (source82 i)) i :=
  forallFin_of_zero_offset (fun i => output82 i = raw82 (source82 i)) sourceChecked82_0

theorem coverChecked82_0 : ∀ i : Fin 28,
    (fun i => (output82 (cover82 i)).ContainsBox (raw82 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked82 : ∀ i : Fin 28, (fun i => (output82 (cover82 i)).ContainsBox (raw82 i)) i :=
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

noncomputable def phaseMass82 : ℝ := singlePhaseMass (191564598/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw82 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass82_eq : phaseMass82 = (95782299/819200000000 : ℝ) := by
  unfold phaseMass82
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw82 output82 cover82 source82
    (gridTreeUnionCheck_sound 32768 raw82 output82 cover82 source82 tree82 checked82)
    _ (by norm_num) _, areaUnits82]
  norm_num

-- Frozen phase 5062, atom 6474, type 1, source (21,67).
def leavesData83 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves83 : Fin 13 → DyadicLeaf := leavesData83.get
def raw83 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 21 67 leaves83 i
def outputData83 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨5376,5440,17152,17216⟩) (.node (.single ⟨5376,5440,17216,17280⟩) (.single ⟨5440,5504,17152,17216⟩))) (.node (.single ⟨5440,5504,17216,17280⟩) (.node (.single ⟨5376,5504,17280,17408⟩) (.single ⟨5504,5568,17152,17216⟩)))) (.node (.node (.single ⟨5504,5568,17216,17280⟩) (.node (.single ⟨5568,5600,17152,17184⟩) (.single ⟨5568,5600,17184,17216⟩))) (.node (.node (.single ⟨5600,5632,17152,17184⟩) (.single ⟨5600,5632,17184,17216⟩)) (.node (.single ⟨5568,5632,17216,17280⟩) (.single ⟨5504,5632,17280,17408⟩))))) (.node (.node (.node (.single ⟨15360,15488,27136,27264⟩) (.node (.single ⟨15360,15488,27264,27392⟩) (.single ⟨15488,15552,27136,27200⟩))) (.node (.single ⟨15488,15552,27200,27264⟩) (.node (.single ⟨15552,15584,27136,27168⟩) (.single ⟨15552,15584,27168,27200⟩)))) (.node (.node (.single ⟨15584,15616,27136,27168⟩) (.node (.single ⟨15584,15616,27168,27200⟩) (.single ⟨15552,15616,27200,27264⟩))) (.node (.node (.single ⟨15488,15552,27264,27328⟩) (.single ⟨15488,15552,27328,27392⟩)) (.node (.single ⟨15552,15616,27264,27328⟩) (.single ⟨15552,15616,27328,27392⟩)))))) (.node (.node (.node (.node (.single ⟨17152,17216,5376,5440⟩) (.node (.single ⟨17152,17216,5440,5504⟩) (.single ⟨17216,17280,5376,5440⟩))) (.node (.single ⟨17216,17280,5440,5504⟩) (.node (.single ⟨17152,17216,5504,5568⟩) (.single ⟨17152,17184,5568,5600⟩)))) (.node (.node (.single ⟨17152,17184,5600,5632⟩) (.node (.single ⟨17184,17216,5568,5600⟩) (.single ⟨17184,17216,5600,5632⟩))) (.node (.node (.single ⟨17216,17280,5504,5568⟩) (.single ⟨17216,17280,5568,5632⟩)) (.node (.single ⟨17280,17408,5376,5504⟩) (.single ⟨17280,17408,5504,5632⟩))))) (.node (.node (.node (.single ⟨27136,27264,15360,15488⟩) (.node (.single ⟨27136,27200,15488,15552⟩) (.single ⟨27136,27168,15552,15584⟩))) (.node (.single ⟨27136,27168,15584,15616⟩) (.node (.single ⟨27168,27200,15552,15584⟩) (.single ⟨27168,27200,15584,15616⟩)))) (.node (.node (.single ⟨27200,27264,15488,15552⟩) (.node (.single ⟨27200,27264,15552,15616⟩) (.single ⟨27264,27392,15360,15488⟩))) (.node (.node (.single ⟨27264,27328,15488,15552⟩) (.single ⟨27264,27328,15552,15616⟩)) (.node (.single ⟨27328,27392,15488,15552⟩) (.single ⟨27328,27392,15552,15616⟩)))))))
def output83 : Fin 52 → GridBox := outputData83.get
def coverData83 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData83 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover83 (i : Fin 52) : Fin 52 := ⟨coverData83.get i % 52, Nat.mod_lt _ (by decide)⟩
def source83 (i : Fin 52) : Fin 52 := ⟨sourceData83.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree83 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 (.cutX 5120 .empty (.cutY 17408 (.cutX 5632 (.cutY 16896 .empty (.cutX 5376 .empty (.cutY 17152 .empty (.cutX 5504 (.cutY 17280 (.cutX 5440 (.cutY 17216 .full .full) (.cutY 17216 .full .full)) .full) (.cutY 17280 (.cutX 5568 (.cutY 17216 .full .full) (.cutY 17216 (.cutX 5600 (.cutY 17184 .full .full) (.cutY 17184 .full .full)) .full)) .full))))) .empty) .empty)) .empty) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 .empty (.cutX 15360 .empty (.cutY 27648 (.cutX 15872 (.cutY 27136 .empty (.cutX 15616 (.cutY 27392 (.cutX 15488 (.cutY 27264 .full .full) (.cutY 27264 (.cutX 15552 (.cutY 27200 .full .full) (.cutY 27200 (.cutX 15584 (.cutY 27168 .full .full) (.cutY 27168 .full .full)) .full)) (.cutX 15552 (.cutY 27328 .full .full) (.cutY 27328 .full .full)))) .empty) .empty)) .empty) .empty)))) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 (.cutX 17408 (.cutY 5120 .empty (.cutX 16896 .empty (.cutY 5632 (.cutX 17152 .empty (.cutY 5376 .empty (.cutX 17280 (.cutY 5504 (.cutX 17216 (.cutY 5440 .full .full) (.cutY 5440 .full .full)) (.cutX 17216 (.cutY 5568 .full (.cutX 17184 (.cutY 5600 .full .full) (.cutY 5600 .full .full))) (.cutY 5568 .full .full))) (.cutY 5504 .full .full)))) .empty))) .empty) .empty) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 .empty (.cutX 27648 (.cutY 15360 .empty (.cutX 27136 .empty (.cutY 15872 (.cutX 27392 (.cutY 15616 (.cutX 27264 (.cutY 15488 .full (.cutX 27200 (.cutY 15552 .full (.cutX 27168 (.cutY 15584 .full .full) (.cutY 15584 .full .full))) (.cutY 15552 .full .full))) (.cutY 15488 .full (.cutX 27328 (.cutY 15552 .full .full) (.cutY 15552 .full .full)))) .empty) .empty) .empty))) .empty)))) .empty))) .empty))

theorem metadata83 : 0<135260814 ∧ 21<128 ∧ 67<128 ∧ 1<4 ∧
    6474/4160=1 ∧ 6474%4160=2314 ∧ ∀ i, (leaves83 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData83).mp
    (by decide +kernel)

theorem sourceChecked83_0 : ∀ i : Fin 52,
    (fun i => output83 i = raw83 (source83 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked83 : ∀ i : Fin 52, (fun i => output83 i = raw83 (source83 i)) i :=
  forallFin_of_zero_offset (fun i => output83 i = raw83 (source83 i)) sourceChecked83_0

theorem coverChecked83_0 : ∀ i : Fin 52,
    (fun i => (output83 (cover83 i)).ContainsBox (raw83 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked83 : ∀ i : Fin 52, (fun i => (output83 (cover83 i)).ContainsBox (raw83 i)) i :=
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

noncomputable def phaseMass83 : ℝ := singlePhaseMass (135260814/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw83 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass83_eq : phaseMass83 = (67630407/819200000000 : ℝ) := by
  unfold phaseMass83
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw83 output83 cover83 source83
    (gridTreeUnionCheck_sound 32768 raw83 output83 cover83 source83 tree83 checked83)
    _ (by norm_num) _, areaUnits83]
  norm_num

-- Frozen phase 5063, atom 5818, type 1, source (14,62).
def leavesData84 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves84 : Fin 13 → DyadicLeaf := leavesData84.get
def raw84 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 14 62 leaves84 i
def outputData84 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨3584,3648,15872,15936⟩) (.node (.single ⟨3584,3648,15936,16000⟩) (.single ⟨3648,3712,15872,15936⟩))) (.node (.single ⟨3648,3712,15936,16000⟩) (.node (.single ⟨3584,3712,16000,16128⟩) (.single ⟨3712,3776,15872,15936⟩)))) (.node (.node (.single ⟨3712,3776,15936,16000⟩) (.node (.single ⟨3776,3808,15872,15904⟩) (.single ⟨3776,3808,15904,15936⟩))) (.node (.node (.single ⟨3808,3840,15872,15904⟩) (.single ⟨3808,3840,15904,15936⟩)) (.node (.single ⟨3776,3840,15936,16000⟩) (.single ⟨3712,3840,16000,16128⟩))))) (.node (.node (.node (.single ⟨15872,15936,3584,3648⟩) (.node (.single ⟨15872,15936,3648,3712⟩) (.single ⟨15936,16000,3584,3648⟩))) (.node (.single ⟨15936,16000,3648,3712⟩) (.node (.single ⟨15872,15936,3712,3776⟩) (.single ⟨15872,15904,3776,3808⟩)))) (.node (.node (.single ⟨15872,15904,3808,3840⟩) (.node (.single ⟨15904,15936,3776,3808⟩) (.single ⟨15904,15936,3808,3840⟩))) (.node (.node (.single ⟨15936,16000,3712,3776⟩) (.single ⟨15936,16000,3776,3840⟩)) (.node (.single ⟨16000,16128,3584,3712⟩) (.single ⟨16000,16128,3712,3840⟩)))))) (.node (.node (.node (.node (.single ⟨16640,16768,28928,29056⟩) (.node (.single ⟨16640,16768,29056,29184⟩) (.single ⟨16768,16832,28928,28992⟩))) (.node (.single ⟨16768,16832,28992,29056⟩) (.node (.single ⟨16832,16864,28928,28960⟩) (.single ⟨16832,16864,28960,28992⟩)))) (.node (.node (.single ⟨16864,16896,28928,28960⟩) (.node (.single ⟨16864,16896,28960,28992⟩) (.single ⟨16832,16896,28992,29056⟩))) (.node (.node (.single ⟨16768,16832,29056,29120⟩) (.single ⟨16768,16832,29120,29184⟩)) (.node (.single ⟨16832,16896,29056,29120⟩) (.single ⟨16832,16896,29120,29184⟩))))) (.node (.node (.node (.single ⟨28928,29056,16640,16768⟩) (.node (.single ⟨28928,28992,16768,16832⟩) (.single ⟨28928,28960,16832,16864⟩))) (.node (.single ⟨28928,28960,16864,16896⟩) (.node (.single ⟨28960,28992,16832,16864⟩) (.single ⟨28960,28992,16864,16896⟩)))) (.node (.node (.single ⟨28992,29056,16768,16832⟩) (.node (.single ⟨28992,29056,16832,16896⟩) (.single ⟨29056,29184,16640,16768⟩))) (.node (.node (.single ⟨29056,29120,16768,16832⟩) (.single ⟨29056,29120,16832,16896⟩)) (.node (.single ⟨29120,29184,16768,16832⟩) (.single ⟨29120,29184,16832,16896⟩)))))))
def output84 : Fin 52 → GridBox := outputData84.get
def coverData84 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 24) (.single 47))) (.node (.single 27) (.node (.single 12) (.single 25)))) (.node (.node (.single 39) (.node (.single 26) (.single 5))) (.node (.node (.single 17) (.single 46)) (.node (.single 34) (.single 6))))) (.node (.node (.node (.single 22) (.node (.single 45) (.single 29))) (.node (.single 11) (.node (.single 23) (.single 40)))) (.node (.node (.single 28) (.node (.single 0) (.single 13))) (.node (.node (.single 51) (.single 38)) (.node (.single 1) (.single 15)))))) (.node (.node (.node (.node (.single 50) (.node (.single 36) (.single 2))) (.node (.single 14) (.node (.single 49) (.single 37)))) (.node (.node (.single 3) (.node (.single 16) (.single 48))) (.node (.node (.single 35) (.single 7)) (.node (.single 18) (.single 44))))) (.node (.node (.node (.single 33) (.node (.single 8) (.single 20))) (.node (.single 43) (.node (.single 31) (.single 9)))) (.node (.node (.single 19) (.node (.single 42) (.single 32))) (.node (.node (.single 10) (.single 21)) (.node (.single 41) (.single 30)))))))
def sourceData84 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover84 (i : Fin 52) : Fin 52 := ⟨coverData84.get i % 52, Nat.mod_lt _ (by decide)⟩
def source84 (i : Fin 52) : Fin 52 := ⟨sourceData84.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree84 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 .empty (.cutX 3072 .empty (.cutY 15360 .empty (.cutX 3584 .empty (.cutY 15872 .empty (.cutX 3840 (.cutY 16128 (.cutX 3712 (.cutY 16000 (.cutX 3648 (.cutY 15936 .full .full) (.cutY 15936 .full .full)) .full) (.cutY 16000 (.cutX 3776 (.cutY 15936 .full .full) (.cutY 15936 (.cutX 3808 (.cutY 15904 .full .full) (.cutY 15904 .full .full)) .full)) .full)) .empty) .empty)))))))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 .empty (.cutX 15360 .empty (.cutY 3072 .empty (.cutX 15872 .empty (.cutY 3584 .empty (.cutX 16128 (.cutY 3840 (.cutX 16000 (.cutY 3712 (.cutX 15936 (.cutY 3648 .full .full) (.cutY 3648 .full .full)) (.cutX 15936 (.cutY 3776 .full (.cutX 15904 (.cutY 3808 .full .full) (.cutY 3808 .full .full))) (.cutY 3776 .full .full))) (.cutY 3712 .full .full)) .empty) .empty))))))) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 (.cutX 17408 (.cutY 29696 (.cutX 16896 (.cutY 29184 (.cutX 16640 .empty (.cutY 28928 .empty (.cutX 16768 (.cutY 29056 .full .full) (.cutY 29056 (.cutX 16832 (.cutY 28992 .full .full) (.cutY 28992 (.cutX 16864 (.cutY 28960 .full .full) (.cutY 28960 .full .full)) .full)) (.cutX 16832 (.cutY 29120 .full .full) (.cutY 29120 .full .full)))))) .empty) .empty) .empty) .empty) .empty) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 (.cutX 29696 (.cutY 17408 (.cutX 29184 (.cutY 16896 (.cutX 28928 .empty (.cutY 16640 .empty (.cutX 29056 (.cutY 16768 .full (.cutX 28992 (.cutY 16832 .full (.cutX 28960 (.cutY 16864 .full .full) (.cutY 16864 .full .full))) (.cutY 16832 .full .full))) (.cutY 16768 .full (.cutX 29120 (.cutY 16832 .full .full) (.cutY 16832 .full .full)))))) .empty) .empty) .empty) .empty) .empty) .empty) .empty)) .empty))))

theorem metadata84 : 0<163200014 ∧ 14<128 ∧ 62<128 ∧ 1<4 ∧
    5818/4160=1 ∧ 5818%4160=1658 ∧ ∀ i, (leaves84 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData84).mp
    (by decide +kernel)

theorem sourceChecked84_0 : ∀ i : Fin 52,
    (fun i => output84 i = raw84 (source84 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked84 : ∀ i : Fin 52, (fun i => output84 i = raw84 (source84 i)) i :=
  forallFin_of_zero_offset (fun i => output84 i = raw84 (source84 i)) sourceChecked84_0

theorem coverChecked84_0 : ∀ i : Fin 52,
    (fun i => (output84 (cover84 i)).ContainsBox (raw84 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked84 : ∀ i : Fin 52, (fun i => (output84 (cover84 i)).ContainsBox (raw84 i)) i :=
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

noncomputable def phaseMass84 : ℝ := singlePhaseMass (163200014/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw84 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass84_eq : phaseMass84 = (81600007/819200000000 : ℝ) := by
  unfold phaseMass84
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw84 output84 cover84 source84
    (gridTreeUnionCheck_sound 32768 raw84 output84 cover84 source84 tree84 checked84)
    _ (by norm_num) _, areaUnits84]
  norm_num

-- Frozen phase 5064, atom 7433, type 1, source (34,77).
def leavesData85 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves85 : Fin 10 → DyadicLeaf := leavesData85.get
def raw85 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 34 77 leaves85 i
def outputData85 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨8704,8832,19712,19840⟩) (.single ⟨8704,8832,19840,19968⟩)) (.node (.single ⟨8832,8896,19712,19776⟩) (.node (.single ⟨8832,8896,19776,19840⟩) (.single ⟨8896,8928,19712,19744⟩)))) (.node (.node (.single ⟨8896,8928,19744,19776⟩) (.single ⟨8928,8960,19712,19744⟩)) (.node (.single ⟨8928,8960,19744,19776⟩) (.node (.single ⟨8896,8960,19776,19840⟩) (.single ⟨8832,8960,19840,19968⟩))))) (.node (.node (.node (.single ⟨12800,12928,23808,23936⟩) (.single ⟨12800,12928,23936,24064⟩)) (.node (.single ⟨12928,12992,23808,23872⟩) (.node (.single ⟨12928,12992,23872,23936⟩) (.single ⟨12992,13024,23808,23840⟩)))) (.node (.node (.single ⟨12992,13024,23840,23872⟩) (.single ⟨13024,13056,23808,23840⟩)) (.node (.single ⟨13024,13056,23840,23872⟩) (.node (.single ⟨12992,13056,23872,23936⟩) (.single ⟨12928,13056,23936,24064⟩)))))) (.node (.node (.node (.node (.single ⟨19712,19840,8704,8832⟩) (.single ⟨19712,19776,8832,8896⟩)) (.node (.single ⟨19712,19744,8896,8928⟩) (.node (.single ⟨19712,19744,8928,8960⟩) (.single ⟨19744,19776,8896,8928⟩)))) (.node (.node (.single ⟨19744,19776,8928,8960⟩) (.single ⟨19776,19840,8832,8896⟩)) (.node (.single ⟨19776,19840,8896,8960⟩) (.node (.single ⟨19840,19968,8704,8832⟩) (.single ⟨19840,19968,8832,8960⟩))))) (.node (.node (.node (.single ⟨23808,23936,12800,12928⟩) (.single ⟨23808,23872,12928,12992⟩)) (.node (.single ⟨23808,23840,12992,13024⟩) (.node (.single ⟨23808,23840,13024,13056⟩) (.single ⟨23840,23872,12992,13024⟩)))) (.node (.node (.single ⟨23840,23872,13024,13056⟩) (.single ⟨23872,23936,12928,12992⟩)) (.node (.single ⟨23872,23936,12992,13056⟩) (.node (.single ⟨23936,24064,12800,12928⟩) (.single ⟨23936,24064,12928,13056⟩)))))))
def output85 : Fin 40 → GridBox := outputData85.get
def coverData85 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 28) (.single 38)) (.node (.single 11) (.node (.single 9) (.single 29))))) (.node (.node (.node (.single 30) (.single 10)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 26) (.node (.single 36) (.single 13)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 23) (.single 33)))) (.node (.node (.single 16) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))))
def sourceData85 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover85 (i : Fin 40) : Fin 40 := ⟨coverData85.get i % 40, Nat.mod_lt _ (by decide)⟩
def source85 (i : Fin 40) : Fin 40 := ⟨sourceData85.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree85 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 (.cutY 18432 .empty (.cutX 9216 (.cutY 19456 .empty (.cutX 8704 .empty (.cutY 19968 (.cutX 8960 (.cutY 19712 .empty (.cutX 8832 (.cutY 19840 .full .full) (.cutY 19840 (.cutX 8896 (.cutY 19776 .full .full) (.cutY 19776 (.cutX 8928 (.cutY 19744 .full .full) (.cutY 19744 .full .full)) .full)) .full))) .empty) .empty))) .empty)) .empty) .empty) (.cutY 20480 .empty (.cutX 14336 (.cutY 22528 .empty (.cutX 13312 (.cutY 23552 .empty (.cutX 12800 .empty (.cutY 24064 (.cutX 13056 (.cutY 23808 .empty (.cutX 12928 (.cutY 23936 .full .full) (.cutY 23936 (.cutX 12992 (.cutY 23872 .full .full) (.cutY 23872 (.cutX 13024 (.cutY 23840 .full .full) (.cutY 23840 .full .full)) .full)) .full))) .empty) .empty))) .empty)) .empty))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 .empty (.cutY 10240 (.cutX 19456 .empty (.cutY 9216 (.cutX 19968 (.cutY 8704 .empty (.cutX 19712 .empty (.cutY 8960 (.cutX 19840 (.cutY 8832 .full (.cutX 19776 (.cutY 8896 .full (.cutX 19744 (.cutY 8928 .full .full) (.cutY 8928 .full .full))) (.cutY 8896 .full .full))) (.cutY 8832 .full .full)) .empty))) .empty) .empty)) .empty)) .empty) (.cutY 12288 .empty (.cutX 22528 .empty (.cutY 14336 (.cutX 23552 .empty (.cutY 13312 (.cutX 24064 (.cutY 12800 .empty (.cutX 23808 .empty (.cutY 13056 (.cutX 23936 (.cutY 12928 .full (.cutX 23872 (.cutY 12992 .full (.cutX 23840 (.cutY 13024 .full .full) (.cutY 13024 .full .full))) (.cutY 12992 .full .full))) (.cutY 12928 .full .full)) .empty))) .empty) .empty)) .empty))))) .empty) .empty))

theorem metadata85 : 0<167101800 ∧ 34<128 ∧ 77<128 ∧ 1<4 ∧
    7433/4160=1 ∧ 7433%4160=3273 ∧ ∀ i, (leaves85 i).Valid 8 := by
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

noncomputable def phaseMass85 : ℝ := singlePhaseMass (167101800/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw85 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass85_eq : phaseMass85 = (835509/8192000000 : ℝ) := by
  unfold phaseMass85
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw85 output85 cover85 source85
    (gridTreeUnionCheck_sound 32768 raw85 output85 cover85 source85 tree85 checked85)
    _ (by norm_num) _, areaUnits85]
  norm_num

-- Frozen phase 5065, atom 4216, type 1, source (0,56).
def leavesData86 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves86 : Fin 7 → DyadicLeaf := leavesData86.get
def raw86 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 0 56 leaves86 i
def outputData86 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨0,128,14336,14464⟩) (.node (.single ⟨0,128,14464,14592⟩) (.single ⟨128,192,14336,14400⟩))) (.node (.node (.single ⟨128,192,14400,14464⟩) (.single ⟨192,256,14336,14400⟩)) (.node (.single ⟨192,256,14400,14464⟩) (.single ⟨128,256,14464,14592⟩)))) (.node (.node (.single ⟨14336,14464,0,128⟩) (.node (.single ⟨14336,14400,128,192⟩) (.single ⟨14336,14400,192,256⟩))) (.node (.node (.single ⟨14400,14464,128,192⟩) (.single ⟨14400,14464,192,256⟩)) (.node (.single ⟨14464,14592,0,128⟩) (.single ⟨14464,14592,128,256⟩))))) (.node (.node (.node (.single ⟨18176,18304,32512,32640⟩) (.node (.single ⟨18176,18304,32640,32768⟩) (.single ⟨18304,18368,32512,32576⟩))) (.node (.node (.single ⟨18304,18368,32576,32640⟩) (.single ⟨18368,18432,32512,32576⟩)) (.node (.single ⟨18368,18432,32576,32640⟩) (.single ⟨18304,18432,32640,32768⟩)))) (.node (.node (.single ⟨32512,32640,18176,18304⟩) (.node (.single ⟨32512,32576,18304,18368⟩) (.single ⟨32512,32576,18368,18432⟩))) (.node (.node (.single ⟨32576,32640,18304,18368⟩) (.single ⟨32576,32640,18368,18432⟩)) (.node (.single ⟨32640,32768,18176,18304⟩) (.single ⟨32640,32768,18304,18432⟩))))))
def output86 : Fin 28 → GridBox := outputData86.get
def coverData86 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData86 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover86 (i : Fin 28) : Fin 28 := ⟨coverData86.get i % 28, Nat.mod_lt _ (by decide)⟩
def source86 (i : Fin 28) : Fin 28 := ⟨sourceData86.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree86 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 .empty (.cutX 1024 (.cutY 15360 (.cutX 512 (.cutY 14848 (.cutX 256 (.cutY 14592 (.cutX 128 (.cutY 14464 .full .full) (.cutY 14464 (.cutX 192 (.cutY 14400 .full .full) (.cutY 14400 .full .full)) .full)) .empty) .empty) .empty) .empty) .empty) .empty)) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 (.cutX 15360 (.cutY 1024 (.cutX 14848 (.cutY 512 (.cutX 14592 (.cutY 256 (.cutX 14464 (.cutY 128 .full (.cutX 14400 (.cutY 192 .full .full) (.cutY 192 .full .full))) (.cutY 128 .full .full)) .empty) .empty) .empty) .empty) .empty) .empty) .empty)) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 .empty (.cutX 17408 .empty (.cutY 31744 .empty (.cutX 17920 .empty (.cutY 32256 .empty (.cutX 18176 .empty (.cutY 32512 .empty (.cutX 18304 (.cutY 32640 .full .full) (.cutY 32640 (.cutX 18368 (.cutY 32576 .full .full) (.cutY 32576 .full .full)) .full))))))))) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 (.cutX 31744 .empty (.cutY 17408 .empty (.cutX 32256 .empty (.cutY 17920 .empty (.cutX 32512 .empty (.cutY 18176 .empty (.cutX 32640 (.cutY 18304 .full (.cutX 32576 (.cutY 18368 .full .full) (.cutY 18368 .full .full))) (.cutY 18304 .full .full)))))))) .empty)) .empty)) .empty))))

theorem metadata86 : 0<169648215 ∧ 0<128 ∧ 56<128 ∧ 1<4 ∧
    4216/4160=1 ∧ 4216%4160=56 ∧ ∀ i, (leaves86 i).Valid 8 := by
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

noncomputable def phaseMass86 : ℝ := singlePhaseMass (169648215/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw86 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass86_eq : phaseMass86 = (33929643/327680000000 : ℝ) := by
  unfold phaseMass86
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw86 output86 cover86 source86
    (gridTreeUnionCheck_sound 32768 raw86 output86 cover86 source86 tree86 checked86)
    _ (by norm_num) _, areaUnits86]
  norm_num

-- Frozen phase 5066, atom 59, type 0, source (0,59).
def leavesData87 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves87 : Fin 4 → DyadicLeaf := leavesData87.get
def raw87 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 0 59 leaves87 i
def outputData87 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨0,128,15104,15232⟩) (.single ⟨0,128,15232,15360⟩)) (.node (.single ⟨128,256,15104,15232⟩) (.single ⟨128,256,15232,15360⟩))) (.node (.node (.single ⟨15104,15232,0,128⟩) (.single ⟨15104,15232,128,256⟩)) (.node (.single ⟨15232,15360,0,128⟩) (.single ⟨15232,15360,128,256⟩)))) (.node (.node (.node (.single ⟨17408,17536,32512,32640⟩) (.single ⟨17408,17536,32640,32768⟩)) (.node (.single ⟨17536,17664,32512,32640⟩) (.single ⟨17536,17664,32640,32768⟩))) (.node (.node (.single ⟨32512,32640,17408,17536⟩) (.single ⟨32512,32640,17536,17664⟩)) (.node (.single ⟨32640,32768,17408,17536⟩) (.single ⟨32640,32768,17536,17664⟩)))))
def output87 : Fin 16 → GridBox := outputData87.get
def coverData87 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData87 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover87 (i : Fin 16) : Fin 16 := ⟨coverData87.get i % 16, Nat.mod_lt _ (by decide)⟩
def source87 (i : Fin 16) : Fin 16 := ⟨sourceData87.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree87 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 .empty (.cutX 1024 (.cutY 15360 (.cutX 512 (.cutY 14848 .empty (.cutX 256 (.cutY 15104 .empty (.cutX 128 (.cutY 15232 .full .full) (.cutY 15232 .full .full))) .empty)) .empty) .empty) .empty)) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 (.cutX 15360 (.cutY 1024 (.cutX 14848 .empty (.cutY 512 (.cutX 15104 .empty (.cutY 256 (.cutX 15232 (.cutY 128 .full .full) (.cutY 128 .full .full)) .empty)) .empty)) .empty) .empty) .empty)) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 .empty (.cutX 17408 .empty (.cutY 31744 .empty (.cutX 17920 (.cutY 32256 .empty (.cutX 17664 (.cutY 32512 .empty (.cutX 17536 (.cutY 32640 .full .full) (.cutY 32640 .full .full))) .empty)) .empty)))) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 (.cutX 31744 .empty (.cutY 17408 .empty (.cutX 32256 .empty (.cutY 17920 (.cutX 32512 .empty (.cutY 17664 (.cutX 32640 (.cutY 17536 .full .full) (.cutY 17536 .full .full)) .empty)) .empty)))) .empty)) .empty)) .empty))))

theorem metadata87 : 0<89519217 ∧ 0<128 ∧ 59<128 ∧ 0<4 ∧
    59/4160=0 ∧ 59%4160=59 ∧ ∀ i, (leaves87 i).Valid 8 := by
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

noncomputable def phaseMass87 : ℝ := singlePhaseMass (89519217/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw87 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass87_eq : phaseMass87 = (89519217/1638400000000 : ℝ) := by
  unfold phaseMass87
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw87 output87 cover87 source87
    (gridTreeUnionCheck_sound 32768 raw87 output87 cover87 source87 tree87 checked87)
    _ (by norm_num) _, areaUnits87]
  norm_num

-- Frozen phase 5067, atom 2802, type 0, source (27,75).
def leavesData88 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves88 : Fin 7 → DyadicLeaf := leavesData88.get
def raw88 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 27 75 leaves88 i
def outputData88 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨6912,7040,19200,19328⟩) (.node (.single ⟨6912,7040,19328,19456⟩) (.single ⟨7040,7104,19200,19264⟩))) (.node (.node (.single ⟨7040,7104,19264,19328⟩) (.single ⟨7104,7168,19200,19264⟩)) (.node (.single ⟨7104,7168,19264,19328⟩) (.single ⟨7040,7168,19328,19456⟩)))) (.node (.node (.single ⟨13312,13440,25600,25728⟩) (.node (.single ⟨13312,13440,25728,25856⟩) (.single ⟨13440,13504,25600,25664⟩))) (.node (.node (.single ⟨13440,13504,25664,25728⟩) (.single ⟨13504,13568,25600,25664⟩)) (.node (.single ⟨13504,13568,25664,25728⟩) (.single ⟨13440,13568,25728,25856⟩))))) (.node (.node (.node (.single ⟨19200,19328,6912,7040⟩) (.node (.single ⟨19200,19264,7040,7104⟩) (.single ⟨19200,19264,7104,7168⟩))) (.node (.node (.single ⟨19264,19328,7040,7104⟩) (.single ⟨19264,19328,7104,7168⟩)) (.node (.single ⟨19328,19456,6912,7040⟩) (.single ⟨19328,19456,7040,7168⟩)))) (.node (.node (.single ⟨25600,25728,13312,13440⟩) (.node (.single ⟨25600,25664,13440,13504⟩) (.single ⟨25600,25664,13504,13568⟩))) (.node (.node (.single ⟨25664,25728,13440,13504⟩) (.single ⟨25664,25728,13504,13568⟩)) (.node (.single ⟨25728,25856,13312,13440⟩) (.single ⟨25728,25856,13440,13568⟩))))))
def output88 : Fin 28 → GridBox := outputData88.get
def coverData88 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData88 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover88 (i : Fin 28) : Fin 28 := ⟨coverData88.get i % 28, Nat.mod_lt _ (by decide)⟩
def source88 (i : Fin 28) : Fin 28 := ⟨sourceData88.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree88 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 .empty (.cutX 7168 (.cutY 19456 (.cutX 6656 .empty (.cutY 18944 .empty (.cutX 6912 .empty (.cutY 19200 .empty (.cutX 7040 (.cutY 19328 .full .full) (.cutY 19328 (.cutX 7104 (.cutY 19264 .full .full) (.cutY 19264 .full .full)) .full)))))) .empty) .empty))) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 (.cutX 13312 .empty (.cutY 25600 .empty (.cutX 13824 (.cutY 26112 (.cutX 13568 (.cutY 25856 (.cutX 13440 (.cutY 25728 .full .full) (.cutY 25728 (.cutX 13504 (.cutY 25664 .full .full) (.cutY 25664 .full .full)) .full)) .empty) .empty) .empty) .empty))) .empty) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 .empty (.cutX 19456 (.cutY 7168 (.cutX 18944 .empty (.cutY 6656 .empty (.cutX 19200 .empty (.cutY 6912 .empty (.cutX 19328 (.cutY 7040 .full (.cutX 19264 (.cutY 7104 .full .full) (.cutY 7104 .full .full))) (.cutY 7040 .full .full)))))) .empty) .empty)))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 (.cutX 25600 .empty (.cutY 13312 .empty (.cutX 26112 (.cutY 13824 (.cutX 25856 (.cutY 13568 (.cutX 25728 (.cutY 13440 .full (.cutX 25664 (.cutY 13504 .full .full) (.cutY 13504 .full .full))) (.cutY 13440 .full .full)) .empty) .empty) .empty) .empty))) .empty) .empty)) .empty))) .empty))

theorem metadata88 : 0<177866497 ∧ 27<128 ∧ 75<128 ∧ 0<4 ∧
    2802/4160=0 ∧ 2802%4160=2802 ∧ ∀ i, (leaves88 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData88).mp
    (by decide +kernel)

theorem sourceChecked88_0 : ∀ i : Fin 28,
    (fun i => output88 i = raw88 (source88 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked88 : ∀ i : Fin 28, (fun i => output88 i = raw88 (source88 i)) i :=
  forallFin_of_zero_offset (fun i => output88 i = raw88 (source88 i)) sourceChecked88_0

theorem coverChecked88_0 : ∀ i : Fin 28,
    (fun i => (output88 (cover88 i)).ContainsBox (raw88 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked88 : ∀ i : Fin 28, (fun i => (output88 (cover88 i)).ContainsBox (raw88 i)) i :=
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

noncomputable def phaseMass88 : ℝ := singlePhaseMass (177866497/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw88 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass88_eq : phaseMass88 = (177866497/1638400000000 : ℝ) := by
  unfold phaseMass88
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw88 output88 cover88 source88
    (gridTreeUnionCheck_sound 32768 raw88 output88 cover88 source88 tree88 checked88)
    _ (by norm_num) _, areaUnits88]
  norm_num

-- Frozen phase 5068, atom 6205, type 1, source (18,65).
def leavesData89 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves89 : Fin 10 → DyadicLeaf := leavesData89.get
def raw89 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 18 65 leaves89 i
def outputData89 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨4608,4736,16640,16768⟩) (.single ⟨4608,4736,16768,16896⟩)) (.node (.single ⟨4736,4800,16640,16704⟩) (.node (.single ⟨4736,4800,16704,16768⟩) (.single ⟨4800,4832,16640,16672⟩)))) (.node (.node (.single ⟨4800,4832,16672,16704⟩) (.single ⟨4832,4864,16640,16672⟩)) (.node (.single ⟨4832,4864,16672,16704⟩) (.node (.single ⟨4800,4864,16704,16768⟩) (.single ⟨4736,4864,16768,16896⟩))))) (.node (.node (.node (.single ⟨15872,16000,27904,28032⟩) (.single ⟨15872,16000,28032,28160⟩)) (.node (.single ⟨16000,16064,27904,27968⟩) (.node (.single ⟨16000,16064,27968,28032⟩) (.single ⟨16064,16096,27904,27936⟩)))) (.node (.node (.single ⟨16064,16096,27936,27968⟩) (.single ⟨16096,16128,27904,27936⟩)) (.node (.single ⟨16096,16128,27936,27968⟩) (.node (.single ⟨16064,16128,27968,28032⟩) (.single ⟨16000,16128,28032,28160⟩)))))) (.node (.node (.node (.node (.single ⟨16640,16768,4608,4736⟩) (.single ⟨16640,16704,4736,4800⟩)) (.node (.single ⟨16640,16672,4800,4832⟩) (.node (.single ⟨16640,16672,4832,4864⟩) (.single ⟨16672,16704,4800,4832⟩)))) (.node (.node (.single ⟨16672,16704,4832,4864⟩) (.single ⟨16704,16768,4736,4800⟩)) (.node (.single ⟨16704,16768,4800,4864⟩) (.node (.single ⟨16768,16896,4608,4736⟩) (.single ⟨16768,16896,4736,4864⟩))))) (.node (.node (.node (.single ⟨27904,28032,15872,16000⟩) (.single ⟨27904,27968,16000,16064⟩)) (.node (.single ⟨27904,27936,16064,16096⟩) (.node (.single ⟨27904,27936,16096,16128⟩) (.single ⟨27936,27968,16064,16096⟩)))) (.node (.node (.single ⟨27936,27968,16096,16128⟩) (.single ⟨27968,28032,16000,16064⟩)) (.node (.single ⟨27968,28032,16064,16128⟩) (.node (.single ⟨28032,28160,15872,16000⟩) (.single ⟨28032,28160,16000,16128⟩)))))))
def output89 : Fin 40 → GridBox := outputData89.get
def coverData89 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 28) (.single 38)) (.node (.single 11) (.node (.single 9) (.single 29))))) (.node (.node (.node (.single 30) (.single 10)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 26) (.node (.single 36) (.single 13)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 23) (.single 33)))) (.node (.node (.single 16) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))))
def sourceData89 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover89 (i : Fin 40) : Fin 40 := ⟨coverData89.get i % 40, Nat.mod_lt _ (by decide)⟩
def source89 (i : Fin 40) : Fin 40 := ⟨sourceData89.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree89 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 (.cutX 5120 (.cutY 17408 (.cutX 4608 .empty (.cutY 16896 (.cutX 4864 (.cutY 16640 .empty (.cutX 4736 (.cutY 16768 .full .full) (.cutY 16768 (.cutX 4800 (.cutY 16704 .full .full) (.cutY 16704 (.cutX 4832 (.cutY 16672 .full .full) (.cutY 16672 .full .full)) .full)) .full))) .empty) .empty)) .empty) .empty) .empty) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 .empty (.cutX 15360 .empty (.cutY 27648 .empty (.cutX 15872 .empty (.cutY 28160 (.cutX 16128 (.cutY 27904 .empty (.cutX 16000 (.cutY 28032 .full .full) (.cutY 28032 (.cutX 16064 (.cutY 27968 .full .full) (.cutY 27968 (.cutX 16096 (.cutY 27936 .full .full) (.cutY 27936 .full .full)) .full)) .full))) .empty) .empty)))))) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 (.cutX 17408 (.cutY 5120 (.cutX 16896 (.cutY 4608 .empty (.cutX 16640 .empty (.cutY 4864 (.cutX 16768 (.cutY 4736 .full (.cutX 16704 (.cutY 4800 .full (.cutX 16672 (.cutY 4832 .full .full) (.cutY 4832 .full .full))) (.cutY 4800 .full .full))) (.cutY 4736 .full .full)) .empty))) .empty) .empty) .empty) .empty) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 .empty (.cutX 27648 .empty (.cutY 15360 .empty (.cutX 28160 (.cutY 15872 .empty (.cutX 27904 .empty (.cutY 16128 (.cutX 28032 (.cutY 16000 .full (.cutX 27968 (.cutY 16064 .full (.cutX 27936 (.cutY 16096 .full .full) (.cutY 16096 .full .full))) (.cutY 16064 .full .full))) (.cutY 16000 .full .full)) .empty))) .empty)))))) .empty))) .empty))

theorem metadata89 : 0<135260814 ∧ 18<128 ∧ 65<128 ∧ 1<4 ∧
    6205/4160=1 ∧ 6205%4160=2045 ∧ ∀ i, (leaves89 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData89).mp
    (by decide +kernel)

theorem sourceChecked89_0 : ∀ i : Fin 40,
    (fun i => output89 i = raw89 (source89 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked89 : ∀ i : Fin 40, (fun i => output89 i = raw89 (source89 i)) i :=
  forallFin_of_zero_offset (fun i => output89 i = raw89 (source89 i)) sourceChecked89_0

theorem coverChecked89_0 : ∀ i : Fin 40,
    (fun i => (output89 (cover89 i)).ContainsBox (raw89 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked89 : ∀ i : Fin 40, (fun i => (output89 (cover89 i)).ContainsBox (raw89 i)) i :=
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

noncomputable def phaseMass89 : ℝ := singlePhaseMass (135260814/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw89 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass89_eq : phaseMass89 = (67630407/819200000000 : ℝ) := by
  unfold phaseMass89
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw89 output89 cover89 source89
    (gridTreeUnionCheck_sound 32768 raw89 output89 cover89 source89 tree89 checked89)
    _ (by norm_num) _, areaUnits89]
  norm_num

-- Frozen phase 5069, atom 6883, type 1, source (26,71).
def leavesData90 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves90 : Fin 10 → DyadicLeaf := leavesData90.get
def raw90 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 26 71 leaves90 i
def outputData90 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨6656,6784,18176,18304⟩) (.single ⟨6656,6784,18304,18432⟩)) (.node (.single ⟨6784,6848,18176,18240⟩) (.node (.single ⟨6784,6848,18240,18304⟩) (.single ⟨6848,6880,18176,18208⟩)))) (.node (.node (.single ⟨6848,6880,18208,18240⟩) (.single ⟨6880,6912,18176,18208⟩)) (.node (.single ⟨6880,6912,18208,18240⟩) (.node (.single ⟨6848,6912,18240,18304⟩) (.single ⟨6784,6912,18304,18432⟩))))) (.node (.node (.node (.single ⟨14336,14464,25856,25984⟩) (.single ⟨14336,14464,25984,26112⟩)) (.node (.single ⟨14464,14528,25856,25920⟩) (.node (.single ⟨14464,14528,25920,25984⟩) (.single ⟨14528,14560,25856,25888⟩)))) (.node (.node (.single ⟨14528,14560,25888,25920⟩) (.single ⟨14560,14592,25856,25888⟩)) (.node (.single ⟨14560,14592,25888,25920⟩) (.node (.single ⟨14528,14592,25920,25984⟩) (.single ⟨14464,14592,25984,26112⟩)))))) (.node (.node (.node (.node (.single ⟨18176,18304,6656,6784⟩) (.single ⟨18176,18240,6784,6848⟩)) (.node (.single ⟨18176,18208,6848,6880⟩) (.node (.single ⟨18176,18208,6880,6912⟩) (.single ⟨18208,18240,6848,6880⟩)))) (.node (.node (.single ⟨18208,18240,6880,6912⟩) (.single ⟨18240,18304,6784,6848⟩)) (.node (.single ⟨18240,18304,6848,6912⟩) (.node (.single ⟨18304,18432,6656,6784⟩) (.single ⟨18304,18432,6784,6912⟩))))) (.node (.node (.node (.single ⟨25856,25984,14336,14464⟩) (.single ⟨25856,25920,14464,14528⟩)) (.node (.single ⟨25856,25888,14528,14560⟩) (.node (.single ⟨25856,25888,14560,14592⟩) (.single ⟨25888,25920,14528,14560⟩)))) (.node (.node (.single ⟨25888,25920,14560,14592⟩) (.single ⟨25920,25984,14464,14528⟩)) (.node (.single ⟨25920,25984,14528,14592⟩) (.node (.single ⟨25984,26112,14336,14464⟩) (.single ⟨25984,26112,14464,14592⟩)))))))
def output90 : Fin 40 → GridBox := outputData90.get
def coverData90 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 28) (.single 38)) (.node (.single 11) (.node (.single 9) (.single 29))))) (.node (.node (.node (.single 30) (.single 10)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 26) (.node (.single 36) (.single 13)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 23) (.single 33)))) (.node (.node (.single 16) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))))
def sourceData90 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover90 (i : Fin 40) : Fin 40 := ⟨coverData90.get i % 40, Nat.mod_lt _ (by decide)⟩
def source90 (i : Fin 40) : Fin 40 := ⟨sourceData90.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree90 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 (.cutX 7168 (.cutY 17408 .empty (.cutX 6656 .empty (.cutY 17920 .empty (.cutX 6912 (.cutY 18176 .empty (.cutX 6784 (.cutY 18304 .full .full) (.cutY 18304 (.cutX 6848 (.cutY 18240 .full .full) (.cutY 18240 (.cutX 6880 (.cutY 18208 .full .full) (.cutY 18208 .full .full)) .full)) .full))) .empty)))) .empty) .empty)) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 (.cutX 15360 (.cutY 25600 .empty (.cutX 14848 (.cutY 26112 (.cutX 14592 (.cutY 25856 .empty (.cutX 14464 (.cutY 25984 .full .full) (.cutY 25984 (.cutX 14528 (.cutY 25920 .full .full) (.cutY 25920 (.cutX 14560 (.cutY 25888 .full .full) (.cutY 25888 .full .full)) .full)) .full))) .empty) .empty) .empty)) .empty) .empty)) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 .empty (.cutX 17408 .empty (.cutY 7168 (.cutX 17920 .empty (.cutY 6656 .empty (.cutX 18176 .empty (.cutY 6912 (.cutX 18304 (.cutY 6784 .full (.cutX 18240 (.cutY 6848 .full (.cutX 18208 (.cutY 6880 .full .full) (.cutY 6880 .full .full))) (.cutY 6848 .full .full))) (.cutY 6784 .full .full)) .empty)))) .empty))) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 .empty (.cutX 25600 .empty (.cutY 15360 (.cutX 26112 (.cutY 14848 (.cutX 25856 .empty (.cutY 14592 (.cutX 25984 (.cutY 14464 .full (.cutX 25920 (.cutY 14528 .full (.cutX 25888 (.cutY 14560 .full .full) (.cutY 14560 .full .full))) (.cutY 14528 .full .full))) (.cutY 14464 .full .full)) .empty)) .empty) .empty) .empty))) .empty)) .empty))) .empty))

theorem metadata90 : 0<175587969 ∧ 26<128 ∧ 71<128 ∧ 1<4 ∧
    6883/4160=1 ∧ 6883%4160=2723 ∧ ∀ i, (leaves90 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData90).mp
    (by decide +kernel)

theorem sourceChecked90_0 : ∀ i : Fin 40,
    (fun i => output90 i = raw90 (source90 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked90 : ∀ i : Fin 40, (fun i => output90 i = raw90 (source90 i)) i :=
  forallFin_of_zero_offset (fun i => output90 i = raw90 (source90 i)) sourceChecked90_0

theorem coverChecked90_0 : ∀ i : Fin 40,
    (fun i => (output90 (cover90 i)).ContainsBox (raw90 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked90 : ∀ i : Fin 40, (fun i => (output90 (cover90 i)).ContainsBox (raw90 i)) i :=
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

noncomputable def phaseMass90 : ℝ := singlePhaseMass (175587969/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw90 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass90_eq : phaseMass90 = (175587969/1638400000000 : ℝ) := by
  unfold phaseMass90
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw90 output90 cover90 source90
    (gridTreeUnionCheck_sound 32768 raw90 output90 cover90 source90 tree90 checked90)
    _ (by norm_num) _, areaUnits90]
  norm_num

-- Frozen phase 5070, atom 7174, type 1, source (30,74).
def leavesData91 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves91 : Fin 10 → DyadicLeaf := leavesData91.get
def raw91 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 30 74 leaves91 i
def outputData91 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨7680,7808,18944,19072⟩) (.single ⟨7680,7808,19072,19200⟩)) (.node (.single ⟨7808,7872,18944,19008⟩) (.node (.single ⟨7808,7872,19008,19072⟩) (.single ⟨7872,7904,18944,18976⟩)))) (.node (.node (.single ⟨7872,7904,18976,19008⟩) (.single ⟨7904,7936,18944,18976⟩)) (.node (.single ⟨7904,7936,18976,19008⟩) (.node (.single ⟨7872,7936,19008,19072⟩) (.single ⟨7808,7936,19072,19200⟩))))) (.node (.node (.node (.single ⟨13568,13696,24832,24960⟩) (.single ⟨13568,13696,24960,25088⟩)) (.node (.single ⟨13696,13760,24832,24896⟩) (.node (.single ⟨13696,13760,24896,24960⟩) (.single ⟨13760,13792,24832,24864⟩)))) (.node (.node (.single ⟨13760,13792,24864,24896⟩) (.single ⟨13792,13824,24832,24864⟩)) (.node (.single ⟨13792,13824,24864,24896⟩) (.node (.single ⟨13760,13824,24896,24960⟩) (.single ⟨13696,13824,24960,25088⟩)))))) (.node (.node (.node (.node (.single ⟨18944,19072,7680,7808⟩) (.single ⟨18944,19008,7808,7872⟩)) (.node (.single ⟨18944,18976,7872,7904⟩) (.node (.single ⟨18944,18976,7904,7936⟩) (.single ⟨18976,19008,7872,7904⟩)))) (.node (.node (.single ⟨18976,19008,7904,7936⟩) (.single ⟨19008,19072,7808,7872⟩)) (.node (.single ⟨19008,19072,7872,7936⟩) (.node (.single ⟨19072,19200,7680,7808⟩) (.single ⟨19072,19200,7808,7936⟩))))) (.node (.node (.node (.single ⟨24832,24960,13568,13696⟩) (.single ⟨24832,24896,13696,13760⟩)) (.node (.single ⟨24832,24864,13760,13792⟩) (.node (.single ⟨24832,24864,13792,13824⟩) (.single ⟨24864,24896,13760,13792⟩)))) (.node (.node (.single ⟨24864,24896,13792,13824⟩) (.single ⟨24896,24960,13696,13760⟩)) (.node (.single ⟨24896,24960,13760,13824⟩) (.node (.single ⟨24960,25088,13568,13696⟩) (.single ⟨24960,25088,13696,13824⟩)))))))
def output91 : Fin 40 → GridBox := outputData91.get
def coverData91 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 28) (.single 38)) (.node (.single 11) (.node (.single 9) (.single 29))))) (.node (.node (.node (.single 30) (.single 10)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 26) (.node (.single 36) (.single 13)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 23) (.single 33)))) (.node (.node (.single 16) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))))
def sourceData91 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover91 (i : Fin 40) : Fin 40 := ⟨coverData91.get i % 40, Nat.mod_lt _ (by decide)⟩
def source91 (i : Fin 40) : Fin 40 := ⟨sourceData91.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree91 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 .empty (.cutX 7168 .empty (.cutY 19456 (.cutX 7680 .empty (.cutY 18944 .empty (.cutX 7936 (.cutY 19200 (.cutX 7808 (.cutY 19072 .full .full) (.cutY 19072 (.cutX 7872 (.cutY 19008 .full .full) (.cutY 19008 (.cutX 7904 (.cutY 18976 .full .full) (.cutY 18976 .full .full)) .full)) .full)) .empty) .empty))) .empty)))) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 (.cutX 13312 .empty (.cutY 25600 (.cutX 13824 (.cutY 25088 (.cutX 13568 .empty (.cutY 24832 .empty (.cutX 13696 (.cutY 24960 .full .full) (.cutY 24960 (.cutX 13760 (.cutY 24896 .full .full) (.cutY 24896 (.cutX 13792 (.cutY 24864 .full .full) (.cutY 24864 .full .full)) .full)) .full)))) .empty) .empty) .empty)) .empty) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 .empty (.cutX 19456 (.cutY 7168 .empty (.cutX 18944 .empty (.cutY 7680 .empty (.cutX 19200 (.cutY 7936 (.cutX 19072 (.cutY 7808 .full (.cutX 19008 (.cutY 7872 .full (.cutX 18976 (.cutY 7904 .full .full) (.cutY 7904 .full .full))) (.cutY 7872 .full .full))) (.cutY 7808 .full .full)) .empty) .empty)))) .empty)))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 (.cutX 25600 (.cutY 13312 .empty (.cutX 25088 (.cutY 13824 (.cutX 24832 .empty (.cutY 13568 .empty (.cutX 24960 (.cutY 13696 .full (.cutX 24896 (.cutY 13760 .full (.cutX 24864 (.cutY 13792 .full .full) (.cutY 13792 .full .full))) (.cutY 13760 .full .full))) (.cutY 13696 .full .full)))) .empty) .empty)) .empty) .empty) .empty)) .empty))) .empty))

theorem metadata91 : 0<140060506 ∧ 30<128 ∧ 74<128 ∧ 1<4 ∧
    7174/4160=1 ∧ 7174%4160=3014 ∧ ∀ i, (leaves91 i).Valid 8 := by
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

-- Frozen phase 5071, atom 3085, type 0, source (31,78).
def leavesData92 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves92 : Fin 4 → DyadicLeaf := leavesData92.get
def raw92 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 31 78 leaves92 i
def outputData92 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨7936,8064,19968,20096⟩) (.single ⟨7936,8064,20096,20224⟩)) (.node (.single ⟨8064,8192,19968,20096⟩) (.single ⟨8064,8192,20096,20224⟩))) (.node (.node (.single ⟨12544,12672,24576,24704⟩) (.single ⟨12544,12672,24704,24832⟩)) (.node (.single ⟨12672,12800,24576,24704⟩) (.single ⟨12672,12800,24704,24832⟩)))) (.node (.node (.node (.single ⟨19968,20096,7936,8064⟩) (.single ⟨19968,20096,8064,8192⟩)) (.node (.single ⟨20096,20224,7936,8064⟩) (.single ⟨20096,20224,8064,8192⟩))) (.node (.node (.single ⟨24576,24704,12544,12672⟩) (.single ⟨24576,24704,12672,12800⟩)) (.node (.single ⟨24704,24832,12544,12672⟩) (.single ⟨24704,24832,12672,12800⟩)))))
def output92 : Fin 16 → GridBox := outputData92.get
def coverData92 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData92 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover92 (i : Fin 16) : Fin 16 := ⟨coverData92.get i % 16, Nat.mod_lt _ (by decide)⟩
def source92 (i : Fin 16) : Fin 16 := ⟨sourceData92.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree92 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 .empty (.cutX 7168 .empty (.cutY 19456 .empty (.cutX 7680 .empty (.cutY 19968 .empty (.cutX 7936 .empty (.cutY 20224 (.cutX 8064 (.cutY 20096 .full .full) (.cutY 20096 .full .full)) .empty)))))))) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 (.cutX 13312 (.cutY 25600 (.cutX 12800 (.cutY 25088 (.cutX 12544 .empty (.cutY 24832 (.cutX 12672 (.cutY 24704 .full .full) (.cutY 24704 .full .full)) .empty)) .empty) .empty) .empty) .empty) .empty) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 .empty (.cutX 19456 .empty (.cutY 7168 .empty (.cutX 19968 .empty (.cutY 7680 .empty (.cutX 20224 (.cutY 7936 .empty (.cutX 20096 (.cutY 8064 .full .full) (.cutY 8064 .full .full))) .empty)))))))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 (.cutX 25600 (.cutY 13312 (.cutX 25088 (.cutY 12800 (.cutX 24832 (.cutY 12544 .empty (.cutX 24704 (.cutY 12672 .full .full) (.cutY 12672 .full .full))) .empty) .empty) .empty) .empty) .empty) .empty) .empty)) .empty))) .empty))

theorem metadata92 : 0<177866497 ∧ 31<128 ∧ 78<128 ∧ 0<4 ∧
    3085/4160=0 ∧ 3085%4160=3085 ∧ ∀ i, (leaves92 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData92).mp
    (by decide +kernel)

theorem sourceChecked92_0 : ∀ i : Fin 16,
    (fun i => output92 i = raw92 (source92 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked92 : ∀ i : Fin 16, (fun i => output92 i = raw92 (source92 i)) i :=
  forallFin_of_zero_offset (fun i => output92 i = raw92 (source92 i)) sourceChecked92_0

theorem coverChecked92_0 : ∀ i : Fin 16,
    (fun i => (output92 (cover92 i)).ContainsBox (raw92 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked92 : ∀ i : Fin 16, (fun i => (output92 (cover92 i)).ContainsBox (raw92 i)) i :=
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

noncomputable def phaseMass92 : ℝ := singlePhaseMass (177866497/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw92 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass92_eq : phaseMass92 = (177866497/1638400000000 : ℝ) := by
  unfold phaseMass92
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw92 output92 cover92 source92
    (gridTreeUnionCheck_sound 32768 raw92 output92 cover92 source92 tree92 checked92)
    _ (by norm_num) _, areaUnits92]
  norm_num

-- Frozen phase 5072, atom 435, type 0, source (3,60).
def leavesData93 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves93 : Fin 4 → DyadicLeaf := leavesData93.get
def raw93 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 3 60 leaves93 i
def outputData93 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨768,896,15360,15488⟩) (.single ⟨768,896,15488,15616⟩)) (.node (.single ⟨896,1024,15360,15488⟩) (.single ⟨896,1024,15488,15616⟩))) (.node (.node (.single ⟨15360,15488,768,896⟩) (.single ⟨15360,15488,896,1024⟩)) (.node (.single ⟨15488,15616,768,896⟩) (.single ⟨15488,15616,896,1024⟩)))) (.node (.node (.node (.single ⟨17152,17280,31744,31872⟩) (.single ⟨17152,17280,31872,32000⟩)) (.node (.single ⟨17280,17408,31744,31872⟩) (.single ⟨17280,17408,31872,32000⟩))) (.node (.node (.single ⟨31744,31872,17152,17280⟩) (.single ⟨31744,31872,17280,17408⟩)) (.node (.single ⟨31872,32000,17152,17280⟩) (.single ⟨31872,32000,17280,17408⟩)))))
def output93 : Fin 16 → GridBox := outputData93.get
def coverData93 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData93 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover93 (i : Fin 16) : Fin 16 := ⟨coverData93.get i % 16, Nat.mod_lt _ (by decide)⟩
def source93 (i : Fin 16) : Fin 16 := ⟨sourceData93.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree93 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 .empty (.cutX 1024 (.cutY 15360 .empty (.cutX 512 .empty (.cutY 15872 (.cutX 768 .empty (.cutY 15616 (.cutX 896 (.cutY 15488 .full .full) (.cutY 15488 .full .full)) .empty)) .empty))) .empty)) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 (.cutX 15360 .empty (.cutY 1024 (.cutX 15872 (.cutY 512 .empty (.cutX 15616 (.cutY 768 .empty (.cutX 15488 (.cutY 896 .full .full) (.cutY 896 .full .full))) .empty)) .empty) .empty)) .empty)) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 .empty (.cutX 17408 (.cutY 31744 .empty (.cutX 16896 .empty (.cutY 32256 (.cutX 17152 .empty (.cutY 32000 (.cutX 17280 (.cutY 31872 .full .full) (.cutY 31872 .full .full)) .empty)) .empty))) .empty)) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 (.cutX 31744 .empty (.cutY 17408 (.cutX 32256 (.cutY 16896 .empty (.cutX 32000 (.cutY 17152 .empty (.cutX 31872 (.cutY 17280 .full .full) (.cutY 17280 .full .full))) .empty)) .empty) .empty)) .empty)) .empty)) .empty))))

theorem metadata93 : 0<89519217 ∧ 3<128 ∧ 60<128 ∧ 0<4 ∧
    435/4160=0 ∧ 435%4160=435 ∧ ∀ i, (leaves93 i).Valid 8 := by
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

noncomputable def phaseMass93 : ℝ := singlePhaseMass (89519217/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw93 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass93_eq : phaseMass93 = (89519217/1638400000000 : ℝ) := by
  unfold phaseMass93
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw93 output93 cover93 source93
    (gridTreeUnionCheck_sound 32768 raw93 output93 cover93 source93 tree93 checked93)
    _ (by norm_num) _, areaUnits93]
  norm_num

-- Frozen phase 5073, atom 1955, type 0, source (17,68).
def leavesData94 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves94 : Fin 7 → DyadicLeaf := leavesData94.get
def raw94 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 17 68 leaves94 i
def outputData94 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨4352,4480,17408,17536⟩) (.node (.single ⟨4352,4480,17536,17664⟩) (.single ⟨4480,4544,17408,17472⟩))) (.node (.node (.single ⟨4480,4544,17472,17536⟩) (.single ⟨4544,4608,17408,17472⟩)) (.node (.single ⟨4544,4608,17472,17536⟩) (.single ⟨4480,4608,17536,17664⟩)))) (.node (.node (.single ⟨15104,15232,28160,28288⟩) (.node (.single ⟨15104,15232,28288,28416⟩) (.single ⟨15232,15296,28160,28224⟩))) (.node (.node (.single ⟨15232,15296,28224,28288⟩) (.single ⟨15296,15360,28160,28224⟩)) (.node (.single ⟨15296,15360,28224,28288⟩) (.single ⟨15232,15360,28288,28416⟩))))) (.node (.node (.node (.single ⟨17408,17536,4352,4480⟩) (.node (.single ⟨17408,17472,4480,4544⟩) (.single ⟨17408,17472,4544,4608⟩))) (.node (.node (.single ⟨17472,17536,4480,4544⟩) (.single ⟨17472,17536,4544,4608⟩)) (.node (.single ⟨17536,17664,4352,4480⟩) (.single ⟨17536,17664,4480,4608⟩)))) (.node (.node (.single ⟨28160,28288,15104,15232⟩) (.node (.single ⟨28160,28224,15232,15296⟩) (.single ⟨28160,28224,15296,15360⟩))) (.node (.node (.single ⟨28224,28288,15232,15296⟩) (.single ⟨28224,28288,15296,15360⟩)) (.node (.single ⟨28288,28416,15104,15232⟩) (.single ⟨28288,28416,15232,15360⟩))))))
def output94 : Fin 28 → GridBox := outputData94.get
def coverData94 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData94 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover94 (i : Fin 28) : Fin 28 := ⟨coverData94.get i % 28, Nat.mod_lt _ (by decide)⟩
def source94 (i : Fin 28) : Fin 28 := ⟨sourceData94.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree94 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 (.cutX 5120 (.cutY 17408 .empty (.cutX 4608 (.cutY 17920 (.cutX 4352 .empty (.cutY 17664 (.cutX 4480 (.cutY 17536 .full .full) (.cutY 17536 (.cutX 4544 (.cutY 17472 .full .full) (.cutY 17472 .full .full)) .full)) .empty)) .empty) .empty)) .empty) .empty) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 .empty (.cutX 15360 (.cutY 27648 .empty (.cutX 14848 .empty (.cutY 28160 .empty (.cutX 15104 .empty (.cutY 28416 (.cutX 15232 (.cutY 28288 .full .full) (.cutY 28288 (.cutX 15296 (.cutY 28224 .full .full) (.cutY 28224 .full .full)) .full)) .empty))))) .empty))) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 (.cutX 17408 .empty (.cutY 5120 (.cutX 17920 (.cutY 4608 (.cutX 17664 (.cutY 4352 .empty (.cutX 17536 (.cutY 4480 .full (.cutX 17472 (.cutY 4544 .full .full) (.cutY 4544 .full .full))) (.cutY 4480 .full .full))) .empty) .empty) .empty) .empty)) .empty) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 .empty (.cutX 27648 .empty (.cutY 15360 (.cutX 28160 .empty (.cutY 14848 .empty (.cutX 28416 (.cutY 15104 .empty (.cutX 28288 (.cutY 15232 .full (.cutX 28224 (.cutY 15296 .full .full) (.cutY 15296 .full .full))) (.cutY 15232 .full .full))) .empty))) .empty))))) .empty))) .empty))

theorem metadata94 : 0<191564598 ∧ 17<128 ∧ 68<128 ∧ 0<4 ∧
    1955/4160=0 ∧ 1955%4160=1955 ∧ ∀ i, (leaves94 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData94).mp
    (by decide +kernel)

theorem sourceChecked94_0 : ∀ i : Fin 28,
    (fun i => output94 i = raw94 (source94 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked94 : ∀ i : Fin 28, (fun i => output94 i = raw94 (source94 i)) i :=
  forallFin_of_zero_offset (fun i => output94 i = raw94 (source94 i)) sourceChecked94_0

theorem coverChecked94_0 : ∀ i : Fin 28,
    (fun i => (output94 (cover94 i)).ContainsBox (raw94 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked94 : ∀ i : Fin 28, (fun i => (output94 (cover94 i)).ContainsBox (raw94 i)) i :=
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

noncomputable def phaseMass94 : ℝ := singlePhaseMass (191564598/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw94 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass94_eq : phaseMass94 = (95782299/819200000000 : ℝ) := by
  unfold phaseMass94
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw94 output94 cover94 source94
    (gridTreeUnionCheck_sound 32768 raw94 output94 cover94 source94 tree94 checked94)
    _ (by norm_num) _, areaUnits94]
  norm_num

-- Frozen phase 5074, atom 7761, type 1, source (40,81).
def leavesData95 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves95 : Fin 13 → DyadicLeaf := leavesData95.get
def raw95 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 40 81 leaves95 i
def outputData95 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨10240,10304,20736,20800⟩) (.node (.single ⟨10240,10304,20800,20864⟩) (.single ⟨10304,10368,20736,20800⟩))) (.node (.single ⟨10304,10368,20800,20864⟩) (.node (.single ⟨10240,10368,20864,20992⟩) (.single ⟨10368,10432,20736,20800⟩)))) (.node (.node (.single ⟨10368,10432,20800,20864⟩) (.node (.single ⟨10432,10464,20736,20768⟩) (.single ⟨10432,10464,20768,20800⟩))) (.node (.node (.single ⟨10464,10496,20736,20768⟩) (.single ⟨10464,10496,20768,20800⟩)) (.node (.single ⟨10432,10496,20800,20864⟩) (.single ⟨10368,10496,20864,20992⟩))))) (.node (.node (.node (.single ⟨11776,11904,22272,22400⟩) (.node (.single ⟨11776,11904,22400,22528⟩) (.single ⟨11904,11968,22272,22336⟩))) (.node (.single ⟨11904,11968,22336,22400⟩) (.node (.single ⟨11968,12000,22272,22304⟩) (.single ⟨11968,12000,22304,22336⟩)))) (.node (.node (.single ⟨12000,12032,22272,22304⟩) (.node (.single ⟨12000,12032,22304,22336⟩) (.single ⟨11968,12032,22336,22400⟩))) (.node (.node (.single ⟨11904,11968,22400,22464⟩) (.single ⟨11904,11968,22464,22528⟩)) (.node (.single ⟨11968,12032,22400,22464⟩) (.single ⟨11968,12032,22464,22528⟩)))))) (.node (.node (.node (.node (.single ⟨20736,20800,10240,10304⟩) (.node (.single ⟨20736,20800,10304,10368⟩) (.single ⟨20800,20864,10240,10304⟩))) (.node (.single ⟨20800,20864,10304,10368⟩) (.node (.single ⟨20736,20800,10368,10432⟩) (.single ⟨20736,20768,10432,10464⟩)))) (.node (.node (.single ⟨20736,20768,10464,10496⟩) (.node (.single ⟨20768,20800,10432,10464⟩) (.single ⟨20768,20800,10464,10496⟩))) (.node (.node (.single ⟨20800,20864,10368,10432⟩) (.single ⟨20800,20864,10432,10496⟩)) (.node (.single ⟨20864,20992,10240,10368⟩) (.single ⟨20864,20992,10368,10496⟩))))) (.node (.node (.node (.single ⟨22272,22400,11776,11904⟩) (.node (.single ⟨22272,22336,11904,11968⟩) (.single ⟨22272,22304,11968,12000⟩))) (.node (.single ⟨22272,22304,12000,12032⟩) (.node (.single ⟨22304,22336,11968,12000⟩) (.single ⟨22304,22336,12000,12032⟩)))) (.node (.node (.single ⟨22336,22400,11904,11968⟩) (.node (.single ⟨22336,22400,11968,12032⟩) (.single ⟨22400,22528,11776,11904⟩))) (.node (.node (.single ⟨22400,22464,11904,11968⟩) (.single ⟨22400,22464,11968,12032⟩)) (.node (.single ⟨22464,22528,11904,11968⟩) (.single ⟨22464,22528,11968,12032⟩)))))))
def output95 : Fin 52 → GridBox := outputData95.get
def coverData95 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData95 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover95 (i : Fin 52) : Fin 52 := ⟨coverData95.get i % 52, Nat.mod_lt _ (by decide)⟩
def source95 (i : Fin 52) : Fin 52 := ⟨sourceData95.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree95 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 .empty (.cutY 22528 (.cutX 11264 (.cutY 21504 (.cutX 10752 (.cutY 20992 (.cutX 10496 (.cutY 20736 .empty (.cutX 10368 (.cutY 20864 (.cutX 10304 (.cutY 20800 .full .full) (.cutY 20800 .full .full)) .full) (.cutY 20864 (.cutX 10432 (.cutY 20800 .full .full) (.cutY 20800 (.cutX 10464 (.cutY 20768 .full .full) (.cutY 20768 .full .full)) .full)) .full))) .empty) .empty) .empty) .empty) (.cutY 21504 .empty (.cutX 11776 .empty (.cutY 22016 .empty (.cutX 12032 (.cutY 22272 .empty (.cutX 11904 (.cutY 22400 .full .full) (.cutY 22400 (.cutX 11968 (.cutY 22336 .full .full) (.cutY 22336 (.cutX 12000 (.cutY 22304 .full .full) (.cutY 22304 .full .full)) .full)) (.cutX 11968 (.cutY 22464 .full .full) (.cutY 22464 .full .full))))) .empty))))) .empty))) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 (.cutY 10240 .empty (.cutX 21504 (.cutY 11264 (.cutX 20992 (.cutY 10752 (.cutX 20736 .empty (.cutY 10496 (.cutX 20864 (.cutY 10368 (.cutX 20800 (.cutY 10304 .full .full) (.cutY 10304 .full .full)) (.cutX 20800 (.cutY 10432 .full (.cutX 20768 (.cutY 10464 .full .full) (.cutY 10464 .full .full))) (.cutY 10432 .full .full))) (.cutY 10368 .full .full)) .empty)) .empty) .empty) .empty) (.cutY 11264 .empty (.cutX 22016 .empty (.cutY 11776 .empty (.cutX 22272 .empty (.cutY 12032 (.cutX 22400 (.cutY 11904 .full (.cutX 22336 (.cutY 11968 .full (.cutX 22304 (.cutY 12000 .full .full) (.cutY 12000 .full .full))) (.cutY 11968 .full .full))) (.cutY 11904 .full (.cutX 22464 (.cutY 11968 .full .full) (.cutY 11968 .full .full)))) .empty))))))) .empty) .empty))) .empty) .empty))

theorem metadata95 : 0<56923454 ∧ 40<128 ∧ 81<128 ∧ 1<4 ∧
    7761/4160=1 ∧ 7761%4160=3601 ∧ ∀ i, (leaves95 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData95).mp
    (by decide +kernel)

theorem sourceChecked95_0 : ∀ i : Fin 52,
    (fun i => output95 i = raw95 (source95 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked95 : ∀ i : Fin 52, (fun i => output95 i = raw95 (source95 i)) i :=
  forallFin_of_zero_offset (fun i => output95 i = raw95 (source95 i)) sourceChecked95_0

theorem coverChecked95_0 : ∀ i : Fin 52,
    (fun i => (output95 (cover95 i)).ContainsBox (raw95 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked95 : ∀ i : Fin 52, (fun i => (output95 (cover95 i)).ContainsBox (raw95 i)) i :=
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

noncomputable def phaseMass95 : ℝ := singlePhaseMass (56923454/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw95 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass95_eq : phaseMass95 = (28461727/819200000000 : ℝ) := by
  unfold phaseMass95
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw95 output95 cover95 source95
    (gridTreeUnionCheck_sound 32768 raw95 output95 cover95 source95 tree95 checked95)
    _ (by norm_num) _, areaUnits95]
  norm_num

-- Frozen phase 5075, atom 7493, type 1, source (35,78).
def leavesData96 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves96 : Fin 7 → DyadicLeaf := leavesData96.get
def raw96 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 35 78 leaves96 i
def outputData96 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨8960,9088,19968,20096⟩) (.node (.single ⟨8960,9088,20096,20224⟩) (.single ⟨9088,9152,19968,20032⟩))) (.node (.node (.single ⟨9088,9152,20032,20096⟩) (.single ⟨9152,9216,19968,20032⟩)) (.node (.single ⟨9152,9216,20032,20096⟩) (.single ⟨9088,9216,20096,20224⟩)))) (.node (.node (.single ⟨12544,12672,23552,23680⟩) (.node (.single ⟨12544,12672,23680,23808⟩) (.single ⟨12672,12736,23552,23616⟩))) (.node (.node (.single ⟨12672,12736,23616,23680⟩) (.single ⟨12736,12800,23552,23616⟩)) (.node (.single ⟨12736,12800,23616,23680⟩) (.single ⟨12672,12800,23680,23808⟩))))) (.node (.node (.node (.single ⟨19968,20096,8960,9088⟩) (.node (.single ⟨19968,20032,9088,9152⟩) (.single ⟨19968,20032,9152,9216⟩))) (.node (.node (.single ⟨20032,20096,9088,9152⟩) (.single ⟨20032,20096,9152,9216⟩)) (.node (.single ⟨20096,20224,8960,9088⟩) (.single ⟨20096,20224,9088,9216⟩)))) (.node (.node (.single ⟨23552,23680,12544,12672⟩) (.node (.single ⟨23552,23616,12672,12736⟩) (.single ⟨23552,23616,12736,12800⟩))) (.node (.node (.single ⟨23616,23680,12672,12736⟩) (.single ⟨23616,23680,12736,12800⟩)) (.node (.single ⟨23680,23808,12544,12672⟩) (.single ⟨23680,23808,12672,12800⟩))))))
def output96 : Fin 28 → GridBox := outputData96.get
def coverData96 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData96 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover96 (i : Fin 28) : Fin 28 := ⟨coverData96.get i % 28, Nat.mod_lt _ (by decide)⟩
def source96 (i : Fin 28) : Fin 28 := ⟨sourceData96.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree96 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 (.cutY 18432 .empty (.cutX 9216 (.cutY 19456 .empty (.cutX 8704 .empty (.cutY 19968 .empty (.cutX 8960 .empty (.cutY 20224 (.cutX 9088 (.cutY 20096 .full .full) (.cutY 20096 (.cutX 9152 (.cutY 20032 .full .full) (.cutY 20032 .full .full)) .full)) .empty))))) .empty)) .empty) .empty) (.cutY 20480 .empty (.cutX 14336 (.cutY 22528 .empty (.cutX 13312 (.cutY 23552 .empty (.cutX 12800 (.cutY 24064 (.cutX 12544 .empty (.cutY 23808 (.cutX 12672 (.cutY 23680 .full .full) (.cutY 23680 (.cutX 12736 (.cutY 23616 .full .full) (.cutY 23616 .full .full)) .full)) .empty)) .empty) .empty)) .empty)) .empty))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 .empty (.cutY 10240 (.cutX 19456 .empty (.cutY 9216 (.cutX 19968 .empty (.cutY 8704 .empty (.cutX 20224 (.cutY 8960 .empty (.cutX 20096 (.cutY 9088 .full (.cutX 20032 (.cutY 9152 .full .full) (.cutY 9152 .full .full))) (.cutY 9088 .full .full))) .empty))) .empty)) .empty)) .empty) (.cutY 12288 .empty (.cutX 22528 .empty (.cutY 14336 (.cutX 23552 .empty (.cutY 13312 (.cutX 24064 (.cutY 12800 (.cutX 23808 (.cutY 12544 .empty (.cutX 23680 (.cutY 12672 .full (.cutX 23616 (.cutY 12736 .full .full) (.cutY 12736 .full .full))) (.cutY 12672 .full .full))) .empty) .empty) .empty) .empty)) .empty))))) .empty) .empty))

theorem metadata96 : 0<167101800 ∧ 35<128 ∧ 78<128 ∧ 1<4 ∧
    7493/4160=1 ∧ 7493%4160=3333 ∧ ∀ i, (leaves96 i).Valid 8 := by
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

noncomputable def phaseMass96 : ℝ := singlePhaseMass (167101800/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw96 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass96_eq : phaseMass96 = (835509/8192000000 : ℝ) := by
  unfold phaseMass96
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw96 output96 cover96 source96
    (gridTreeUnionCheck_sound 32768 raw96 output96 cover96 source96 tree96 checked96)
    _ (by norm_num) _, areaUnits96]
  norm_num

-- Frozen phase 5076, atom 3450, type 0, source (37,83).
def leavesData97 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves97 : Fin 4 → DyadicLeaf := leavesData97.get
def raw97 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 37 83 leaves97 i
def outputData97 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨9472,9600,21248,21376⟩) (.single ⟨9472,9600,21376,21504⟩)) (.node (.single ⟨9600,9728,21248,21376⟩) (.single ⟨9600,9728,21376,21504⟩))) (.node (.node (.single ⟨11264,11392,23040,23168⟩) (.single ⟨11264,11392,23168,23296⟩)) (.node (.single ⟨11392,11520,23040,23168⟩) (.single ⟨11392,11520,23168,23296⟩)))) (.node (.node (.node (.single ⟨21248,21376,9472,9600⟩) (.single ⟨21248,21376,9600,9728⟩)) (.node (.single ⟨21376,21504,9472,9600⟩) (.single ⟨21376,21504,9600,9728⟩))) (.node (.node (.single ⟨23040,23168,11264,11392⟩) (.single ⟨23040,23168,11392,11520⟩)) (.node (.single ⟨23168,23296,11264,11392⟩) (.single ⟨23168,23296,11392,11520⟩)))))
def output97 : Fin 16 → GridBox := outputData97.get
def coverData97 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData97 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover97 (i : Fin 16) : Fin 16 := ⟨coverData97.get i % 16, Nat.mod_lt _ (by decide)⟩
def source97 (i : Fin 16) : Fin 16 := ⟨sourceData97.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree97 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 (.cutX 9216 .empty (.cutY 21504 (.cutX 9728 (.cutY 20992 .empty (.cutX 9472 .empty (.cutY 21248 .empty (.cutX 9600 (.cutY 21376 .full .full) (.cutY 21376 .full .full))))) .empty) .empty)) .empty) (.cutY 22528 .empty (.cutX 11264 .empty (.cutY 23552 (.cutX 11776 (.cutY 23040 .empty (.cutX 11520 (.cutY 23296 (.cutX 11392 (.cutY 23168 .full .full) (.cutY 23168 .full .full)) .empty) .empty)) .empty) .empty))))) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 (.cutY 10240 (.cutX 21504 (.cutY 9216 .empty (.cutX 20992 .empty (.cutY 9728 (.cutX 21248 .empty (.cutY 9472 .empty (.cutX 21376 (.cutY 9600 .full .full) (.cutY 9600 .full .full)))) .empty))) .empty) .empty) (.cutY 10240 .empty (.cutX 23552 (.cutY 11264 .empty (.cutX 23040 .empty (.cutY 11776 (.cutX 23296 (.cutY 11520 (.cutX 23168 (.cutY 11392 .full .full) (.cutY 11392 .full .full)) .empty) .empty) .empty))) .empty))) .empty))) .empty) .empty))

theorem metadata97 : 0<167980383 ∧ 37<128 ∧ 83<128 ∧ 0<4 ∧
    3450/4160=0 ∧ 3450%4160=3450 ∧ ∀ i, (leaves97 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData97).mp
    (by decide +kernel)

theorem sourceChecked97_0 : ∀ i : Fin 16,
    (fun i => output97 i = raw97 (source97 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked97 : ∀ i : Fin 16, (fun i => output97 i = raw97 (source97 i)) i :=
  forallFin_of_zero_offset (fun i => output97 i = raw97 (source97 i)) sourceChecked97_0

theorem coverChecked97_0 : ∀ i : Fin 16,
    (fun i => (output97 (cover97 i)).ContainsBox (raw97 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked97 : ∀ i : Fin 16, (fun i => (output97 (cover97 i)).ContainsBox (raw97 i)) i :=
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

noncomputable def phaseMass97 : ℝ := singlePhaseMass (167980383/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw97 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass97_eq : phaseMass97 = (167980383/1638400000000 : ℝ) := by
  unfold phaseMass97
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw97 output97 cover97 source97
    (gridTreeUnionCheck_sound 32768 raw97 output97 cover97 source97 tree97 checked97)
    _ (by norm_num) _, areaUnits97]
  norm_num

-- Frozen phase 5077, atom 793, type 0, source (6,61).
def leavesData98 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves98 : Fin 7 → DyadicLeaf := leavesData98.get
def raw98 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 6 61 leaves98 i
def outputData98 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨1536,1664,15616,15744⟩) (.node (.single ⟨1536,1664,15744,15872⟩) (.single ⟨1664,1728,15616,15680⟩))) (.node (.node (.single ⟨1664,1728,15680,15744⟩) (.single ⟨1728,1792,15616,15680⟩)) (.node (.single ⟨1728,1792,15680,15744⟩) (.single ⟨1664,1792,15744,15872⟩)))) (.node (.node (.single ⟨15616,15744,1536,1664⟩) (.node (.single ⟨15616,15680,1664,1728⟩) (.single ⟨15616,15680,1728,1792⟩))) (.node (.node (.single ⟨15680,15744,1664,1728⟩) (.single ⟨15680,15744,1728,1792⟩)) (.node (.single ⟨15744,15872,1536,1664⟩) (.single ⟨15744,15872,1664,1792⟩))))) (.node (.node (.node (.single ⟨16896,17024,30976,31104⟩) (.node (.single ⟨16896,17024,31104,31232⟩) (.single ⟨17024,17088,30976,31040⟩))) (.node (.node (.single ⟨17024,17088,31040,31104⟩) (.single ⟨17088,17152,30976,31040⟩)) (.node (.single ⟨17088,17152,31040,31104⟩) (.single ⟨17024,17152,31104,31232⟩)))) (.node (.node (.single ⟨30976,31104,16896,17024⟩) (.node (.single ⟨30976,31040,17024,17088⟩) (.single ⟨30976,31040,17088,17152⟩))) (.node (.node (.single ⟨31040,31104,17024,17088⟩) (.single ⟨31040,31104,17088,17152⟩)) (.node (.single ⟨31104,31232,16896,17024⟩) (.single ⟨31104,31232,17024,17152⟩))))))
def output98 : Fin 28 → GridBox := outputData98.get
def coverData98 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData98 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover98 (i : Fin 28) : Fin 28 := ⟨coverData98.get i % 28, Nat.mod_lt _ (by decide)⟩
def source98 (i : Fin 28) : Fin 28 := ⟨sourceData98.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree98 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 .empty (.cutX 1024 .empty (.cutY 15360 .empty (.cutX 1536 .empty (.cutY 15872 (.cutX 1792 (.cutY 15616 .empty (.cutX 1664 (.cutY 15744 .full .full) (.cutY 15744 (.cutX 1728 (.cutY 15680 .full .full) (.cutY 15680 .full .full)) .full))) .empty) .empty))))) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 (.cutX 15360 .empty (.cutY 1024 .empty (.cutX 15872 (.cutY 1536 .empty (.cutX 15616 .empty (.cutY 1792 (.cutX 15744 (.cutY 1664 .full (.cutX 15680 (.cutY 1728 .full .full) (.cutY 1728 .full .full))) (.cutY 1664 .full .full)) .empty))) .empty))) .empty)) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 .empty (.cutX 17408 (.cutY 31744 (.cutX 16896 .empty (.cutY 31232 (.cutX 17152 (.cutY 30976 .empty (.cutX 17024 (.cutY 31104 .full .full) (.cutY 31104 (.cutX 17088 (.cutY 31040 .full .full) (.cutY 31040 .full .full)) .full))) .empty) .empty)) .empty) .empty)) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 (.cutX 31744 (.cutY 17408 (.cutX 31232 (.cutY 16896 .empty (.cutX 30976 .empty (.cutY 17152 (.cutX 31104 (.cutY 17024 .full (.cutX 31040 (.cutY 17088 .full .full) (.cutY 17088 .full .full))) (.cutY 17024 .full .full)) .empty))) .empty) .empty) .empty) .empty)) .empty)) .empty))))

theorem metadata98 : 0<89519217 ∧ 6<128 ∧ 61<128 ∧ 0<4 ∧
    793/4160=0 ∧ 793%4160=793 ∧ ∀ i, (leaves98 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData98).mp
    (by decide +kernel)

theorem sourceChecked98_0 : ∀ i : Fin 28,
    (fun i => output98 i = raw98 (source98 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked98 : ∀ i : Fin 28, (fun i => output98 i = raw98 (source98 i)) i :=
  forallFin_of_zero_offset (fun i => output98 i = raw98 (source98 i)) sourceChecked98_0

theorem coverChecked98_0 : ∀ i : Fin 28,
    (fun i => (output98 (cover98 i)).ContainsBox (raw98 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked98 : ∀ i : Fin 28, (fun i => (output98 (cover98 i)).ContainsBox (raw98 i)) i :=
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

noncomputable def phaseMass98 : ℝ := singlePhaseMass (89519217/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw98 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass98_eq : phaseMass98 = (89519217/1638400000000 : ℝ) := by
  unfold phaseMass98
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw98 output98 cover98 source98
    (gridTreeUnionCheck_sound 32768 raw98 output98 cover98 source98 tree98 checked98)
    _ (by norm_num) _, areaUnits98]
  norm_num

-- Frozen phase 5078, atom 2569, type 0, source (24,73).
def leavesData99 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves99 : Fin 7 → DyadicLeaf := leavesData99.get
def raw99 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 24 73 leaves99 i
def outputData99 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨6144,6272,18688,18816⟩) (.node (.single ⟨6144,6272,18816,18944⟩) (.single ⟨6272,6336,18688,18752⟩))) (.node (.node (.single ⟨6272,6336,18752,18816⟩) (.single ⟨6336,6400,18688,18752⟩)) (.node (.single ⟨6336,6400,18752,18816⟩) (.single ⟨6272,6400,18816,18944⟩)))) (.node (.node (.single ⟨13824,13952,26368,26496⟩) (.node (.single ⟨13824,13952,26496,26624⟩) (.single ⟨13952,14016,26368,26432⟩))) (.node (.node (.single ⟨13952,14016,26432,26496⟩) (.single ⟨14016,14080,26368,26432⟩)) (.node (.single ⟨14016,14080,26432,26496⟩) (.single ⟨13952,14080,26496,26624⟩))))) (.node (.node (.node (.single ⟨18688,18816,6144,6272⟩) (.node (.single ⟨18688,18752,6272,6336⟩) (.single ⟨18688,18752,6336,6400⟩))) (.node (.node (.single ⟨18752,18816,6272,6336⟩) (.single ⟨18752,18816,6336,6400⟩)) (.node (.single ⟨18816,18944,6144,6272⟩) (.single ⟨18816,18944,6272,6400⟩)))) (.node (.node (.single ⟨26368,26496,13824,13952⟩) (.node (.single ⟨26368,26432,13952,14016⟩) (.single ⟨26368,26432,14016,14080⟩))) (.node (.node (.single ⟨26432,26496,13952,14016⟩) (.single ⟨26432,26496,14016,14080⟩)) (.node (.single ⟨26496,26624,13824,13952⟩) (.single ⟨26496,26624,13952,14080⟩))))))
def output99 : Fin 28 → GridBox := outputData99.get
def coverData99 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData99 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover99 (i : Fin 28) : Fin 28 := ⟨coverData99.get i % 28, Nat.mod_lt _ (by decide)⟩
def source99 (i : Fin 28) : Fin 28 := ⟨sourceData99.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree99 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 .empty (.cutX 7168 (.cutY 19456 (.cutX 6656 (.cutY 18944 (.cutX 6400 (.cutY 18688 .empty (.cutX 6272 (.cutY 18816 .full .full) (.cutY 18816 (.cutX 6336 (.cutY 18752 .full .full) (.cutY 18752 .full .full)) .full))) .empty) .empty) .empty) .empty) .empty))) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 (.cutX 13312 .empty (.cutY 25600 .empty (.cutX 13824 .empty (.cutY 26112 .empty (.cutX 14080 (.cutY 26368 .empty (.cutX 13952 (.cutY 26496 .full .full) (.cutY 26496 (.cutX 14016 (.cutY 26432 .full .full) (.cutY 26432 .full .full)) .full))) .empty))))) .empty) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 .empty (.cutX 19456 (.cutY 7168 (.cutX 18944 (.cutY 6656 (.cutX 18688 .empty (.cutY 6400 (.cutX 18816 (.cutY 6272 .full (.cutX 18752 (.cutY 6336 .full .full) (.cutY 6336 .full .full))) (.cutY 6272 .full .full)) .empty)) .empty) .empty) .empty) .empty)))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 (.cutX 25600 .empty (.cutY 13312 .empty (.cutX 26112 .empty (.cutY 13824 .empty (.cutX 26368 .empty (.cutY 14080 (.cutX 26496 (.cutY 13952 .full (.cutX 26432 (.cutY 14016 .full .full) (.cutY 14016 .full .full))) (.cutY 13952 .full .full)) .empty)))))) .empty) .empty)) .empty))) .empty))

theorem metadata99 : 0<177866497 ∧ 24<128 ∧ 73<128 ∧ 0<4 ∧
    2569/4160=0 ∧ 2569%4160=2569 ∧ ∀ i, (leaves99 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData99).mp
    (by decide +kernel)

theorem sourceChecked99_0 : ∀ i : Fin 28,
    (fun i => output99 i = raw99 (source99 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked99 : ∀ i : Fin 28, (fun i => output99 i = raw99 (source99 i)) i :=
  forallFin_of_zero_offset (fun i => output99 i = raw99 (source99 i)) sourceChecked99_0

theorem coverChecked99_0 : ∀ i : Fin 28,
    (fun i => (output99 (cover99 i)).ContainsBox (raw99 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked99 : ∀ i : Fin 28, (fun i => (output99 (cover99 i)).ContainsBox (raw99 i)) i :=
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

noncomputable def phaseMass99 : ℝ := singlePhaseMass (177866497/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw99 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass99_eq : phaseMass99 = (177866497/1638400000000 : ℝ) := by
  unfold phaseMass99
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw99 output99 cover99 source99
    (gridTreeUnionCheck_sound 32768 raw99 output99 cover99 source99 tree99 checked99)
    _ (by norm_num) _, areaUnits99]
  norm_num

-- Frozen phase 5079, atom 2876, type 0, source (28,76).
def leavesData100 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves100 : Fin 7 → DyadicLeaf := leavesData100.get
def raw100 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 28 76 leaves100 i
def outputData100 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨7168,7296,19456,19584⟩) (.node (.single ⟨7168,7296,19584,19712⟩) (.single ⟨7296,7360,19456,19520⟩))) (.node (.node (.single ⟨7296,7360,19520,19584⟩) (.single ⟨7360,7424,19456,19520⟩)) (.node (.single ⟨7360,7424,19520,19584⟩) (.single ⟨7296,7424,19584,19712⟩)))) (.node (.node (.single ⟨13056,13184,25344,25472⟩) (.node (.single ⟨13056,13184,25472,25600⟩) (.single ⟨13184,13248,25344,25408⟩))) (.node (.node (.single ⟨13184,13248,25408,25472⟩) (.single ⟨13248,13312,25344,25408⟩)) (.node (.single ⟨13248,13312,25408,25472⟩) (.single ⟨13184,13312,25472,25600⟩))))) (.node (.node (.node (.single ⟨19456,19584,7168,7296⟩) (.node (.single ⟨19456,19520,7296,7360⟩) (.single ⟨19456,19520,7360,7424⟩))) (.node (.node (.single ⟨19520,19584,7296,7360⟩) (.single ⟨19520,19584,7360,7424⟩)) (.node (.single ⟨19584,19712,7168,7296⟩) (.single ⟨19584,19712,7296,7424⟩)))) (.node (.node (.single ⟨25344,25472,13056,13184⟩) (.node (.single ⟨25344,25408,13184,13248⟩) (.single ⟨25344,25408,13248,13312⟩))) (.node (.node (.single ⟨25408,25472,13184,13248⟩) (.single ⟨25408,25472,13248,13312⟩)) (.node (.single ⟨25472,25600,13056,13184⟩) (.single ⟨25472,25600,13184,13312⟩))))))
def output100 : Fin 28 → GridBox := outputData100.get
def coverData100 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData100 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover100 (i : Fin 28) : Fin 28 := ⟨coverData100.get i % 28, Nat.mod_lt _ (by decide)⟩
def source100 (i : Fin 28) : Fin 28 := ⟨sourceData100.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree100 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 .empty (.cutX 7168 .empty (.cutY 19456 .empty (.cutX 7680 (.cutY 19968 (.cutX 7424 (.cutY 19712 (.cutX 7296 (.cutY 19584 .full .full) (.cutY 19584 (.cutX 7360 (.cutY 19520 .full .full) (.cutY 19520 .full .full)) .full)) .empty) .empty) .empty) .empty))))) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 (.cutX 13312 (.cutY 25600 (.cutX 12800 .empty (.cutY 25088 .empty (.cutX 13056 .empty (.cutY 25344 .empty (.cutX 13184 (.cutY 25472 .full .full) (.cutY 25472 (.cutX 13248 (.cutY 25408 .full .full) (.cutY 25408 .full .full)) .full)))))) .empty) .empty) .empty) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 .empty (.cutX 19456 .empty (.cutY 7168 .empty (.cutX 19968 (.cutY 7680 (.cutX 19712 (.cutY 7424 (.cutX 19584 (.cutY 7296 .full (.cutX 19520 (.cutY 7360 .full .full) (.cutY 7360 .full .full))) (.cutY 7296 .full .full)) .empty) .empty) .empty) .empty)))))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 (.cutX 25600 (.cutY 13312 (.cutX 25088 .empty (.cutY 12800 .empty (.cutX 25344 .empty (.cutY 13056 .empty (.cutX 25472 (.cutY 13184 .full (.cutX 25408 (.cutY 13248 .full .full) (.cutY 13248 .full .full))) (.cutY 13184 .full .full)))))) .empty) .empty) .empty) .empty)) .empty))) .empty))

theorem metadata100 : 0<177866497 ∧ 28<128 ∧ 76<128 ∧ 0<4 ∧
    2876/4160=0 ∧ 2876%4160=2876 ∧ ∀ i, (leaves100 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData100).mp
    (by decide +kernel)

theorem sourceChecked100_0 : ∀ i : Fin 28,
    (fun i => output100 i = raw100 (source100 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked100 : ∀ i : Fin 28, (fun i => output100 i = raw100 (source100 i)) i :=
  forallFin_of_zero_offset (fun i => output100 i = raw100 (source100 i)) sourceChecked100_0

theorem coverChecked100_0 : ∀ i : Fin 28,
    (fun i => (output100 (cover100 i)).ContainsBox (raw100 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked100 : ∀ i : Fin 28, (fun i => (output100 (cover100 i)).ContainsBox (raw100 i)) i :=
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

noncomputable def phaseMass100 : ℝ := singlePhaseMass (177866497/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw100 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass100_eq : phaseMass100 = (177866497/1638400000000 : ℝ) := by
  unfold phaseMass100
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw100 output100 cover100 source100
    (gridTreeUnionCheck_sound 32768 raw100 output100 cover100 source100 tree100 checked100)
    _ (by norm_num) _, areaUnits100]
  norm_num

-- Frozen phase 5080, atom 5918, type 1, source (15,63).
def leavesData101 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves101 : Fin 10 → DyadicLeaf := leavesData101.get
def raw101 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 15 63 leaves101 i
def outputData101 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨3840,3968,16128,16256⟩) (.single ⟨3840,3968,16256,16384⟩)) (.node (.single ⟨3968,4032,16128,16192⟩) (.node (.single ⟨3968,4032,16192,16256⟩) (.single ⟨4032,4064,16128,16160⟩)))) (.node (.node (.single ⟨4032,4064,16160,16192⟩) (.single ⟨4064,4096,16128,16160⟩)) (.node (.single ⟨4064,4096,16160,16192⟩) (.node (.single ⟨4032,4096,16192,16256⟩) (.single ⟨3968,4096,16256,16384⟩))))) (.node (.node (.node (.single ⟨16128,16256,3840,3968⟩) (.single ⟨16128,16192,3968,4032⟩)) (.node (.single ⟨16128,16160,4032,4064⟩) (.node (.single ⟨16128,16160,4064,4096⟩) (.single ⟨16160,16192,4032,4064⟩)))) (.node (.node (.single ⟨16160,16192,4064,4096⟩) (.single ⟨16192,16256,3968,4032⟩)) (.node (.single ⟨16192,16256,4032,4096⟩) (.node (.single ⟨16256,16384,3840,3968⟩) (.single ⟨16256,16384,3968,4096⟩)))))) (.node (.node (.node (.node (.single ⟨16384,16512,28672,28800⟩) (.single ⟨16384,16512,28800,28928⟩)) (.node (.single ⟨16512,16576,28672,28736⟩) (.node (.single ⟨16512,16576,28736,28800⟩) (.single ⟨16576,16608,28672,28704⟩)))) (.node (.node (.single ⟨16576,16608,28704,28736⟩) (.single ⟨16608,16640,28672,28704⟩)) (.node (.single ⟨16608,16640,28704,28736⟩) (.node (.single ⟨16576,16640,28736,28800⟩) (.single ⟨16512,16640,28800,28928⟩))))) (.node (.node (.node (.single ⟨28672,28800,16384,16512⟩) (.single ⟨28672,28736,16512,16576⟩)) (.node (.single ⟨28672,28704,16576,16608⟩) (.node (.single ⟨28672,28704,16608,16640⟩) (.single ⟨28704,28736,16576,16608⟩)))) (.node (.node (.single ⟨28704,28736,16608,16640⟩) (.single ⟨28736,28800,16512,16576⟩)) (.node (.single ⟨28736,28800,16576,16640⟩) (.node (.single ⟨28800,28928,16384,16512⟩) (.single ⟨28800,28928,16512,16640⟩)))))))
def output101 : Fin 40 → GridBox := outputData101.get
def coverData101 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 10)) (.node (.single 39) (.node (.single 29) (.single 1)))) (.node (.node (.single 18) (.single 38)) (.node (.single 21) (.node (.single 9) (.single 19))))) (.node (.node (.node (.single 30) (.single 20)) (.node (.single 2) (.node (.single 11) (.single 37)))) (.node (.node (.single 28) (.single 3)) (.node (.single 16) (.node (.single 36) (.single 23)))))) (.node (.node (.node (.node (.single 8) (.single 17)) (.node (.single 31) (.node (.single 22) (.single 4)))) (.node (.node (.single 12) (.single 35)) (.node (.single 27) (.node (.single 5) (.single 14))))) (.node (.node (.node (.single 34) (.single 25)) (.node (.single 6) (.node (.single 13) (.single 33)))) (.node (.node (.single 26) (.single 7)) (.node (.single 15) (.node (.single 32) (.single 24)))))))
def sourceData101 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9)))))) (.node (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover101 (i : Fin 40) : Fin 40 := ⟨coverData101.get i % 40, Nat.mod_lt _ (by decide)⟩
def source101 (i : Fin 40) : Fin 40 := ⟨sourceData101.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree101 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 .empty (.cutX 3072 .empty (.cutY 15360 .empty (.cutX 3584 .empty (.cutY 15872 .empty (.cutX 3840 .empty (.cutY 16128 .empty (.cutX 3968 (.cutY 16256 .full .full) (.cutY 16256 (.cutX 4032 (.cutY 16192 .full .full) (.cutY 16192 (.cutX 4064 (.cutY 16160 .full .full) (.cutY 16160 .full .full)) .full)) .full))))))))))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 .empty (.cutX 15360 .empty (.cutY 3072 .empty (.cutX 15872 .empty (.cutY 3584 .empty (.cutX 16128 .empty (.cutY 3840 .empty (.cutX 16256 (.cutY 3968 .full (.cutX 16192 (.cutY 4032 .full (.cutX 16160 (.cutY 4064 .full .full) (.cutY 4064 .full .full))) (.cutY 4032 .full .full))) (.cutY 3968 .full .full)))))))))) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 (.cutX 17408 (.cutY 29696 (.cutX 16896 (.cutY 29184 (.cutX 16640 (.cutY 28928 (.cutX 16512 (.cutY 28800 .full .full) (.cutY 28800 (.cutX 16576 (.cutY 28736 .full .full) (.cutY 28736 (.cutX 16608 (.cutY 28704 .full .full) (.cutY 28704 .full .full)) .full)) .full)) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 (.cutX 29696 (.cutY 17408 (.cutX 29184 (.cutY 16896 (.cutX 28928 (.cutY 16640 (.cutX 28800 (.cutY 16512 .full (.cutX 28736 (.cutY 16576 .full (.cutX 28704 (.cutY 16608 .full .full) (.cutY 16608 .full .full))) (.cutY 16576 .full .full))) (.cutY 16512 .full .full)) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty)) .empty))))

theorem metadata101 : 0<163200014 ∧ 15<128 ∧ 63<128 ∧ 1<4 ∧
    5918/4160=1 ∧ 5918%4160=1758 ∧ ∀ i, (leaves101 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData101).mp
    (by decide +kernel)

theorem sourceChecked101_0 : ∀ i : Fin 40,
    (fun i => output101 i = raw101 (source101 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked101 : ∀ i : Fin 40, (fun i => output101 i = raw101 (source101 i)) i :=
  forallFin_of_zero_offset (fun i => output101 i = raw101 (source101 i)) sourceChecked101_0

theorem coverChecked101_0 : ∀ i : Fin 40,
    (fun i => (output101 (cover101 i)).ContainsBox (raw101 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked101 : ∀ i : Fin 40, (fun i => (output101 (cover101 i)).ContainsBox (raw101 i)) i :=
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

noncomputable def phaseMass101 : ℝ := singlePhaseMass (163200014/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw101 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass101_eq : phaseMass101 = (81600007/819200000000 : ℝ) := by
  unfold phaseMass101
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw101 output101 cover101 source101
    (gridTreeUnionCheck_sound 32768 raw101 output101 cover101 source101 tree101 checked101)
    _ (by norm_num) _, areaUnits101]
  norm_num

-- Frozen phase 5081, atom 4592, type 1, source (3,57).
def leavesData102 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves102 : Fin 10 → DyadicLeaf := leavesData102.get
def raw102 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 3 57 leaves102 i
def outputData102 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨768,832,14592,14656⟩) (.single ⟨768,832,14656,14720⟩)) (.node (.single ⟨832,896,14592,14656⟩) (.node (.single ⟨832,896,14656,14720⟩) (.single ⟨768,896,14720,14848⟩)))) (.node (.node (.single ⟨896,960,14592,14656⟩) (.single ⟨896,960,14656,14720⟩)) (.node (.single ⟨960,1024,14592,14656⟩) (.node (.single ⟨960,1024,14656,14720⟩) (.single ⟨896,1024,14720,14848⟩))))) (.node (.node (.node (.single ⟨14592,14656,768,832⟩) (.single ⟨14592,14656,832,896⟩)) (.node (.single ⟨14656,14720,768,832⟩) (.node (.single ⟨14656,14720,832,896⟩) (.single ⟨14592,14656,896,960⟩)))) (.node (.node (.single ⟨14592,14656,960,1024⟩) (.single ⟨14656,14720,896,960⟩)) (.node (.single ⟨14656,14720,960,1024⟩) (.node (.single ⟨14720,14848,768,896⟩) (.single ⟨14720,14848,896,1024⟩)))))) (.node (.node (.node (.node (.single ⟨17920,18048,31744,31872⟩) (.single ⟨17920,18048,31872,32000⟩)) (.node (.single ⟨18048,18112,31744,31808⟩) (.node (.single ⟨18048,18112,31808,31872⟩) (.single ⟨18112,18176,31744,31808⟩)))) (.node (.node (.single ⟨18112,18176,31808,31872⟩) (.single ⟨18048,18112,31872,31936⟩)) (.node (.single ⟨18048,18112,31936,32000⟩) (.node (.single ⟨18112,18176,31872,31936⟩) (.single ⟨18112,18176,31936,32000⟩))))) (.node (.node (.node (.single ⟨31744,31872,17920,18048⟩) (.single ⟨31744,31808,18048,18112⟩)) (.node (.single ⟨31744,31808,18112,18176⟩) (.node (.single ⟨31808,31872,18048,18112⟩) (.single ⟨31808,31872,18112,18176⟩)))) (.node (.node (.single ⟨31872,32000,17920,18048⟩) (.single ⟨31872,31936,18048,18112⟩)) (.node (.single ⟨31872,31936,18112,18176⟩) (.node (.single ⟨31936,32000,18048,18112⟩) (.single ⟨31936,32000,18112,18176⟩)))))))
def output102 : Fin 40 → GridBox := outputData102.get
def coverData102 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 18)) (.node (.single 35) (.node (.single 21) (.single 9)))) (.node (.node (.single 19) (.single 30)) (.node (.single 20) (.node (.single 5) (.single 14))))) (.node (.node (.node (.single 34) (.single 25)) (.node (.single 6) (.node (.single 16) (.single 33)))) (.node (.node (.single 23) (.single 7)) (.node (.single 15) (.node (.single 32) (.single 24)))))) (.node (.node (.node (.node (.single 8) (.single 17)) (.node (.single 31) (.node (.single 22) (.single 0)))) (.node (.node (.single 10) (.single 39)) (.node (.single 29) (.node (.single 1) (.single 12))))) (.node (.node (.node (.single 38) (.single 27)) (.node (.single 2) (.node (.single 11) (.single 37)))) (.node (.node (.single 28) (.single 3)) (.node (.single 13) (.node (.single 36) (.single 26)))))))
def sourceData102 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover102 (i : Fin 40) : Fin 40 := ⟨coverData102.get i % 40, Nat.mod_lt _ (by decide)⟩
def source102 (i : Fin 40) : Fin 40 := ⟨sourceData102.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree102 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 .empty (.cutX 1024 (.cutY 15360 (.cutX 512 .empty (.cutY 14848 (.cutX 768 .empty (.cutY 14592 .empty (.cutX 896 (.cutY 14720 (.cutX 832 (.cutY 14656 .full .full) (.cutY 14656 .full .full)) .full) (.cutY 14720 (.cutX 960 (.cutY 14656 .full .full) (.cutY 14656 .full .full)) .full)))) .empty)) .empty) .empty)) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 (.cutX 15360 (.cutY 1024 (.cutX 14848 (.cutY 512 .empty (.cutX 14592 .empty (.cutY 768 .empty (.cutX 14720 (.cutY 896 (.cutX 14656 (.cutY 832 .full .full) (.cutY 832 .full .full)) (.cutX 14656 (.cutY 960 .full .full) (.cutY 960 .full .full))) (.cutY 896 .full .full))))) .empty) .empty) .empty) .empty)) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 .empty (.cutX 17408 .empty (.cutY 31744 .empty (.cutX 17920 .empty (.cutY 32256 (.cutX 18176 (.cutY 32000 (.cutX 18048 (.cutY 31872 .full .full) (.cutY 31872 (.cutX 18112 (.cutY 31808 .full .full) (.cutY 31808 .full .full)) (.cutX 18112 (.cutY 31936 .full .full) (.cutY 31936 .full .full)))) .empty) .empty) .empty))))) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 (.cutX 31744 .empty (.cutY 17408 .empty (.cutX 32256 (.cutY 17920 .empty (.cutX 32000 (.cutY 18176 (.cutX 31872 (.cutY 18048 .full (.cutX 31808 (.cutY 18112 .full .full) (.cutY 18112 .full .full))) (.cutY 18048 .full (.cutX 31936 (.cutY 18112 .full .full) (.cutY 18112 .full .full)))) .empty) .empty)) .empty))) .empty)) .empty)) .empty))))

theorem metadata102 : 0<169648215 ∧ 3<128 ∧ 57<128 ∧ 1<4 ∧
    4592/4160=1 ∧ 4592%4160=432 ∧ ∀ i, (leaves102 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData102).mp
    (by decide +kernel)

theorem sourceChecked102_0 : ∀ i : Fin 40,
    (fun i => output102 i = raw102 (source102 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked102 : ∀ i : Fin 40, (fun i => output102 i = raw102 (source102 i)) i :=
  forallFin_of_zero_offset (fun i => output102 i = raw102 (source102 i)) sourceChecked102_0

theorem coverChecked102_0 : ∀ i : Fin 40,
    (fun i => (output102 (cover102 i)).ContainsBox (raw102 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked102 : ∀ i : Fin 40, (fun i => (output102 (cover102 i)).ContainsBox (raw102 i)) i :=
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

noncomputable def phaseMass102 : ℝ := singlePhaseMass (169648215/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw102 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass102_eq : phaseMass102 = (33929643/327680000000 : ℝ) := by
  unfold phaseMass102
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw102 output102 cover102 source102
    (gridTreeUnionCheck_sound 32768 raw102 output102 cover102 source102 tree102 checked102)
    _ (by norm_num) _, areaUnits102]
  norm_num

-- Frozen phase 5082, atom 2318, type 0, source (21,71).
def leavesData103 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves103 : Fin 7 → DyadicLeaf := leavesData103.get
def raw103 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 21 71 leaves103 i
def outputData103 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨5376,5504,18176,18304⟩) (.node (.single ⟨5376,5504,18304,18432⟩) (.single ⟨5504,5568,18176,18240⟩))) (.node (.node (.single ⟨5504,5568,18240,18304⟩) (.single ⟨5568,5632,18176,18240⟩)) (.node (.single ⟨5568,5632,18240,18304⟩) (.single ⟨5504,5632,18304,18432⟩)))) (.node (.node (.single ⟨14336,14464,27136,27264⟩) (.node (.single ⟨14336,14464,27264,27392⟩) (.single ⟨14464,14528,27136,27200⟩))) (.node (.node (.single ⟨14464,14528,27200,27264⟩) (.single ⟨14528,14592,27136,27200⟩)) (.node (.single ⟨14528,14592,27200,27264⟩) (.single ⟨14464,14592,27264,27392⟩))))) (.node (.node (.node (.single ⟨18176,18304,5376,5504⟩) (.node (.single ⟨18176,18240,5504,5568⟩) (.single ⟨18176,18240,5568,5632⟩))) (.node (.node (.single ⟨18240,18304,5504,5568⟩) (.single ⟨18240,18304,5568,5632⟩)) (.node (.single ⟨18304,18432,5376,5504⟩) (.single ⟨18304,18432,5504,5632⟩)))) (.node (.node (.single ⟨27136,27264,14336,14464⟩) (.node (.single ⟨27136,27200,14464,14528⟩) (.single ⟨27136,27200,14528,14592⟩))) (.node (.node (.single ⟨27200,27264,14464,14528⟩) (.single ⟨27200,27264,14528,14592⟩)) (.node (.single ⟨27264,27392,14336,14464⟩) (.single ⟨27264,27392,14464,14592⟩))))))
def output103 : Fin 28 → GridBox := outputData103.get
def coverData103 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData103 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover103 (i : Fin 28) : Fin 28 := ⟨coverData103.get i % 28, Nat.mod_lt _ (by decide)⟩
def source103 (i : Fin 28) : Fin 28 := ⟨sourceData103.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree103 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 (.cutX 5120 .empty (.cutY 17408 .empty (.cutX 5632 (.cutY 17920 .empty (.cutX 5376 .empty (.cutY 18176 .empty (.cutX 5504 (.cutY 18304 .full .full) (.cutY 18304 (.cutX 5568 (.cutY 18240 .full .full) (.cutY 18240 .full .full)) .full))))) .empty))) .empty) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 .empty (.cutX 15360 (.cutY 27648 (.cutX 14848 (.cutY 27136 .empty (.cutX 14592 (.cutY 27392 (.cutX 14464 (.cutY 27264 .full .full) (.cutY 27264 (.cutX 14528 (.cutY 27200 .full .full) (.cutY 27200 .full .full)) .full)) .empty) .empty)) .empty) .empty) .empty))) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 (.cutX 17408 .empty (.cutY 5120 .empty (.cutX 17920 .empty (.cutY 5632 (.cutX 18176 .empty (.cutY 5376 .empty (.cutX 18304 (.cutY 5504 .full (.cutX 18240 (.cutY 5568 .full .full) (.cutY 5568 .full .full))) (.cutY 5504 .full .full)))) .empty)))) .empty) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 .empty (.cutX 27648 (.cutY 15360 (.cutX 27136 .empty (.cutY 14848 (.cutX 27392 (.cutY 14592 (.cutX 27264 (.cutY 14464 .full (.cutX 27200 (.cutY 14528 .full .full) (.cutY 14528 .full .full))) (.cutY 14464 .full .full)) .empty) .empty) .empty)) .empty) .empty)))) .empty))) .empty))

theorem metadata103 : 0<191564598 ∧ 21<128 ∧ 71<128 ∧ 0<4 ∧
    2318/4160=0 ∧ 2318%4160=2318 ∧ ∀ i, (leaves103 i).Valid 8 := by
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

noncomputable def phaseMass103 : ℝ := singlePhaseMass (191564598/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw103 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass103_eq : phaseMass103 = (95782299/819200000000 : ℝ) := by
  unfold phaseMass103
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw103 output103 cover103 source103
    (gridTreeUnionCheck_sound 32768 raw103 output103 cover103 source103 tree103 checked103)
    _ (by norm_num) _, areaUnits103]
  norm_num

-- Frozen phase 5083, atom 6560, type 1, source (22,68).
def leavesData104 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves104 : Fin 13 → DyadicLeaf := leavesData104.get
def raw104 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 22 68 leaves104 i
def outputData104 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨5632,5696,17408,17472⟩) (.node (.single ⟨5632,5696,17472,17536⟩) (.single ⟨5696,5760,17408,17472⟩))) (.node (.single ⟨5696,5760,17472,17536⟩) (.node (.single ⟨5632,5760,17536,17664⟩) (.single ⟨5760,5824,17408,17472⟩)))) (.node (.node (.single ⟨5760,5824,17472,17536⟩) (.node (.single ⟨5824,5856,17408,17440⟩) (.single ⟨5824,5856,17440,17472⟩))) (.node (.node (.single ⟨5856,5888,17408,17440⟩) (.single ⟨5856,5888,17440,17472⟩)) (.node (.single ⟨5824,5888,17472,17536⟩) (.single ⟨5760,5888,17536,17664⟩))))) (.node (.node (.node (.single ⟨15104,15232,26880,27008⟩) (.node (.single ⟨15104,15232,27008,27136⟩) (.single ⟨15232,15296,26880,26944⟩))) (.node (.single ⟨15232,15296,26944,27008⟩) (.node (.single ⟨15296,15328,26880,26912⟩) (.single ⟨15296,15328,26912,26944⟩)))) (.node (.node (.single ⟨15328,15360,26880,26912⟩) (.node (.single ⟨15328,15360,26912,26944⟩) (.single ⟨15296,15360,26944,27008⟩))) (.node (.node (.single ⟨15232,15296,27008,27072⟩) (.single ⟨15232,15296,27072,27136⟩)) (.node (.single ⟨15296,15360,27008,27072⟩) (.single ⟨15296,15360,27072,27136⟩)))))) (.node (.node (.node (.node (.single ⟨17408,17472,5632,5696⟩) (.node (.single ⟨17408,17472,5696,5760⟩) (.single ⟨17472,17536,5632,5696⟩))) (.node (.single ⟨17472,17536,5696,5760⟩) (.node (.single ⟨17408,17472,5760,5824⟩) (.single ⟨17408,17440,5824,5856⟩)))) (.node (.node (.single ⟨17408,17440,5856,5888⟩) (.node (.single ⟨17440,17472,5824,5856⟩) (.single ⟨17440,17472,5856,5888⟩))) (.node (.node (.single ⟨17472,17536,5760,5824⟩) (.single ⟨17472,17536,5824,5888⟩)) (.node (.single ⟨17536,17664,5632,5760⟩) (.single ⟨17536,17664,5760,5888⟩))))) (.node (.node (.node (.single ⟨26880,27008,15104,15232⟩) (.node (.single ⟨26880,26944,15232,15296⟩) (.single ⟨26880,26912,15296,15328⟩))) (.node (.single ⟨26880,26912,15328,15360⟩) (.node (.single ⟨26912,26944,15296,15328⟩) (.single ⟨26912,26944,15328,15360⟩)))) (.node (.node (.single ⟨26944,27008,15232,15296⟩) (.node (.single ⟨26944,27008,15296,15360⟩) (.single ⟨27008,27136,15104,15232⟩))) (.node (.node (.single ⟨27008,27072,15232,15296⟩) (.single ⟨27008,27072,15296,15360⟩)) (.node (.single ⟨27072,27136,15232,15296⟩) (.single ⟨27072,27136,15296,15360⟩)))))))
def output104 : Fin 52 → GridBox := outputData104.get
def coverData104 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData104 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover104 (i : Fin 52) : Fin 52 := ⟨coverData104.get i % 52, Nat.mod_lt _ (by decide)⟩
def source104 (i : Fin 52) : Fin 52 := ⟨sourceData104.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree104 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 (.cutX 5120 .empty (.cutY 17408 .empty (.cutX 5632 .empty (.cutY 17920 (.cutX 5888 (.cutY 17664 (.cutX 5760 (.cutY 17536 (.cutX 5696 (.cutY 17472 .full .full) (.cutY 17472 .full .full)) .full) (.cutY 17536 (.cutX 5824 (.cutY 17472 .full .full) (.cutY 17472 (.cutX 5856 (.cutY 17440 .full .full) (.cutY 17440 .full .full)) .full)) .full)) .empty) .empty) .empty)))) .empty) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 .empty (.cutX 15360 (.cutY 27648 (.cutX 14848 .empty (.cutY 27136 (.cutX 15104 .empty (.cutY 26880 .empty (.cutX 15232 (.cutY 27008 .full .full) (.cutY 27008 (.cutX 15296 (.cutY 26944 .full .full) (.cutY 26944 (.cutX 15328 (.cutY 26912 .full .full) (.cutY 26912 .full .full)) .full)) (.cutX 15296 (.cutY 27072 .full .full) (.cutY 27072 .full .full)))))) .empty)) .empty) .empty))) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 (.cutX 17408 .empty (.cutY 5120 .empty (.cutX 17920 (.cutY 5632 .empty (.cutX 17664 (.cutY 5888 (.cutX 17536 (.cutY 5760 (.cutX 17472 (.cutY 5696 .full .full) (.cutY 5696 .full .full)) (.cutX 17472 (.cutY 5824 .full (.cutX 17440 (.cutY 5856 .full .full) (.cutY 5856 .full .full))) (.cutY 5824 .full .full))) (.cutY 5760 .full .full)) .empty) .empty)) .empty))) .empty) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 .empty (.cutX 27648 (.cutY 15360 (.cutX 27136 (.cutY 14848 .empty (.cutX 26880 .empty (.cutY 15104 .empty (.cutX 27008 (.cutY 15232 .full (.cutX 26944 (.cutY 15296 .full (.cutX 26912 (.cutY 15328 .full .full) (.cutY 15328 .full .full))) (.cutY 15296 .full .full))) (.cutY 15232 .full (.cutX 27072 (.cutY 15296 .full .full) (.cutY 15296 .full .full))))))) .empty) .empty) .empty)))) .empty))) .empty))

theorem metadata104 : 0<135260814 ∧ 22<128 ∧ 68<128 ∧ 1<4 ∧
    6560/4160=1 ∧ 6560%4160=2400 ∧ ∀ i, (leaves104 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData104).mp
    (by decide +kernel)

theorem sourceChecked104_0 : ∀ i : Fin 52,
    (fun i => output104 i = raw104 (source104 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked104 : ∀ i : Fin 52, (fun i => output104 i = raw104 (source104 i)) i :=
  forallFin_of_zero_offset (fun i => output104 i = raw104 (source104 i)) sourceChecked104_0

theorem coverChecked104_0 : ∀ i : Fin 52,
    (fun i => (output104 (cover104 i)).ContainsBox (raw104 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked104 : ∀ i : Fin 52, (fun i => (output104 (cover104 i)).ContainsBox (raw104 i)) i :=
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

noncomputable def phaseMass104 : ℝ := singlePhaseMass (135260814/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw104 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass104_eq : phaseMass104 = (67630407/819200000000 : ℝ) := by
  unfold phaseMass104
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw104 output104 cover104 source104
    (gridTreeUnionCheck_sound 32768 raw104 output104 cover104 source104 tree104 checked104)
    _ (by norm_num) _, areaUnits104]
  norm_num

-- Frozen phase 5084, atom 3151, type 0, source (32,79).
def leavesData105 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves105 : Fin 4 → DyadicLeaf := leavesData105.get
def raw105 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 32 79 leaves105 i
def outputData105 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨8192,8320,20224,20352⟩) (.single ⟨8192,8320,20352,20480⟩)) (.node (.single ⟨8320,8448,20224,20352⟩) (.single ⟨8320,8448,20352,20480⟩))) (.node (.node (.single ⟨12288,12416,24320,24448⟩) (.single ⟨12288,12416,24448,24576⟩)) (.node (.single ⟨12416,12544,24320,24448⟩) (.single ⟨12416,12544,24448,24576⟩)))) (.node (.node (.node (.single ⟨20224,20352,8192,8320⟩) (.single ⟨20224,20352,8320,8448⟩)) (.node (.single ⟨20352,20480,8192,8320⟩) (.single ⟨20352,20480,8320,8448⟩))) (.node (.node (.single ⟨24320,24448,12288,12416⟩) (.single ⟨24320,24448,12416,12544⟩)) (.node (.single ⟨24448,24576,12288,12416⟩) (.single ⟨24448,24576,12416,12544⟩)))))
def output105 : Fin 16 → GridBox := outputData105.get
def coverData105 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData105 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover105 (i : Fin 16) : Fin 16 := ⟨coverData105.get i % 16, Nat.mod_lt _ (by decide)⟩
def source105 (i : Fin 16) : Fin 16 := ⟨sourceData105.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree105 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 (.cutY 18432 .empty (.cutX 9216 (.cutY 19456 .empty (.cutX 8704 (.cutY 19968 .empty (.cutX 8448 (.cutY 20224 .empty (.cutX 8320 (.cutY 20352 .full .full) (.cutY 20352 .full .full))) .empty)) .empty)) .empty)) .empty) .empty) (.cutY 20480 .empty (.cutX 14336 (.cutY 22528 .empty (.cutX 13312 (.cutY 23552 .empty (.cutX 12800 (.cutY 24064 .empty (.cutX 12544 (.cutY 24320 .empty (.cutX 12416 (.cutY 24448 .full .full) (.cutY 24448 .full .full))) .empty)) .empty)) .empty)) .empty))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 .empty (.cutY 10240 (.cutX 19456 .empty (.cutY 9216 (.cutX 19968 .empty (.cutY 8704 (.cutX 20224 .empty (.cutY 8448 (.cutX 20352 (.cutY 8320 .full .full) (.cutY 8320 .full .full)) .empty)) .empty)) .empty)) .empty)) .empty) (.cutY 12288 .empty (.cutX 22528 .empty (.cutY 14336 (.cutX 23552 .empty (.cutY 13312 (.cutX 24064 .empty (.cutY 12800 (.cutX 24320 .empty (.cutY 12544 (.cutX 24448 (.cutY 12416 .full .full) (.cutY 12416 .full .full)) .empty)) .empty)) .empty)) .empty))))) .empty) .empty))

theorem metadata105 : 0<109574533 ∧ 32<128 ∧ 79<128 ∧ 0<4 ∧
    3151/4160=0 ∧ 3151%4160=3151 ∧ ∀ i, (leaves105 i).Valid 8 := by
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

noncomputable def phaseMass105 : ℝ := singlePhaseMass (109574533/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw105 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass105_eq : phaseMass105 = (109574533/1638400000000 : ℝ) := by
  unfold phaseMass105
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw105 output105 cover105 source105
    (gridTreeUnionCheck_sound 32768 raw105 output105 cover105 source105 tree105 checked105)
    _ (by norm_num) _, areaUnits105]
  norm_num

-- Frozen phase 5085, atom 2049, type 0, source (18,69).
def leavesData106 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves106 : Fin 7 → DyadicLeaf := leavesData106.get
def raw106 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 18 69 leaves106 i
def outputData106 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨4608,4736,17664,17792⟩) (.node (.single ⟨4608,4736,17792,17920⟩) (.single ⟨4736,4800,17664,17728⟩))) (.node (.node (.single ⟨4736,4800,17728,17792⟩) (.single ⟨4800,4864,17664,17728⟩)) (.node (.single ⟨4800,4864,17728,17792⟩) (.single ⟨4736,4864,17792,17920⟩)))) (.node (.node (.single ⟨14848,14976,27904,28032⟩) (.node (.single ⟨14848,14976,28032,28160⟩) (.single ⟨14976,15040,27904,27968⟩))) (.node (.node (.single ⟨14976,15040,27968,28032⟩) (.single ⟨15040,15104,27904,27968⟩)) (.node (.single ⟨15040,15104,27968,28032⟩) (.single ⟨14976,15104,28032,28160⟩))))) (.node (.node (.node (.single ⟨17664,17792,4608,4736⟩) (.node (.single ⟨17664,17728,4736,4800⟩) (.single ⟨17664,17728,4800,4864⟩))) (.node (.node (.single ⟨17728,17792,4736,4800⟩) (.single ⟨17728,17792,4800,4864⟩)) (.node (.single ⟨17792,17920,4608,4736⟩) (.single ⟨17792,17920,4736,4864⟩)))) (.node (.node (.single ⟨27904,28032,14848,14976⟩) (.node (.single ⟨27904,27968,14976,15040⟩) (.single ⟨27904,27968,15040,15104⟩))) (.node (.node (.single ⟨27968,28032,14976,15040⟩) (.single ⟨27968,28032,15040,15104⟩)) (.node (.single ⟨28032,28160,14848,14976⟩) (.single ⟨28032,28160,14976,15104⟩))))))
def output106 : Fin 28 → GridBox := outputData106.get
def coverData106 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData106 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover106 (i : Fin 28) : Fin 28 := ⟨coverData106.get i % 28, Nat.mod_lt _ (by decide)⟩
def source106 (i : Fin 28) : Fin 28 := ⟨sourceData106.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree106 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 (.cutX 5120 (.cutY 17408 .empty (.cutX 4608 .empty (.cutY 17920 (.cutX 4864 (.cutY 17664 .empty (.cutX 4736 (.cutY 17792 .full .full) (.cutY 17792 (.cutX 4800 (.cutY 17728 .full .full) (.cutY 17728 .full .full)) .full))) .empty) .empty))) .empty) .empty) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 .empty (.cutX 15360 (.cutY 27648 .empty (.cutX 14848 .empty (.cutY 28160 (.cutX 15104 (.cutY 27904 .empty (.cutX 14976 (.cutY 28032 .full .full) (.cutY 28032 (.cutX 15040 (.cutY 27968 .full .full) (.cutY 27968 .full .full)) .full))) .empty) .empty))) .empty))) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 (.cutX 17408 .empty (.cutY 5120 (.cutX 17920 (.cutY 4608 .empty (.cutX 17664 .empty (.cutY 4864 (.cutX 17792 (.cutY 4736 .full (.cutX 17728 (.cutY 4800 .full .full) (.cutY 4800 .full .full))) (.cutY 4736 .full .full)) .empty))) .empty) .empty)) .empty) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 .empty (.cutX 27648 .empty (.cutY 15360 (.cutX 28160 (.cutY 14848 .empty (.cutX 27904 .empty (.cutY 15104 (.cutX 28032 (.cutY 14976 .full (.cutX 27968 (.cutY 15040 .full .full) (.cutY 15040 .full .full))) (.cutY 14976 .full .full)) .empty))) .empty) .empty))))) .empty))) .empty))

theorem metadata106 : 0<191564598 ∧ 18<128 ∧ 69<128 ∧ 0<4 ∧
    2049/4160=0 ∧ 2049%4160=2049 ∧ ∀ i, (leaves106 i).Valid 8 := by
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

noncomputable def phaseMass106 : ℝ := singlePhaseMass (191564598/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw106 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass106_eq : phaseMass106 = (95782299/819200000000 : ℝ) := by
  unfold phaseMass106
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw106 output106 cover106 source106
    (gridTreeUnionCheck_sound 32768 raw106 output106 cover106 source106 tree106 checked106)
    _ (by norm_num) _, areaUnits106]
  norm_num

-- Frozen phase 5086, atom 3215, type 0, source (33,80).
def leavesData107 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves107 : Fin 4 → DyadicLeaf := leavesData107.get
def raw107 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 33 80 leaves107 i
def outputData107 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨8448,8576,20480,20608⟩) (.single ⟨8448,8576,20608,20736⟩)) (.node (.single ⟨8576,8704,20480,20608⟩) (.single ⟨8576,8704,20608,20736⟩))) (.node (.node (.single ⟨12032,12160,24064,24192⟩) (.single ⟨12032,12160,24192,24320⟩)) (.node (.single ⟨12160,12288,24064,24192⟩) (.single ⟨12160,12288,24192,24320⟩)))) (.node (.node (.node (.single ⟨20480,20608,8448,8576⟩) (.single ⟨20480,20608,8576,8704⟩)) (.node (.single ⟨20608,20736,8448,8576⟩) (.single ⟨20608,20736,8576,8704⟩))) (.node (.node (.single ⟨24064,24192,12032,12160⟩) (.single ⟨24064,24192,12160,12288⟩)) (.node (.single ⟨24192,24320,12032,12160⟩) (.single ⟨24192,24320,12160,12288⟩)))))
def output107 : Fin 16 → GridBox := outputData107.get
def coverData107 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData107 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover107 (i : Fin 16) : Fin 16 := ⟨coverData107.get i % 16, Nat.mod_lt _ (by decide)⟩
def source107 (i : Fin 16) : Fin 16 := ⟨sourceData107.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree107 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 (.cutX 9216 (.cutY 21504 (.cutX 8704 (.cutY 20992 (.cutX 8448 .empty (.cutY 20736 (.cutX 8576 (.cutY 20608 .full .full) (.cutY 20608 .full .full)) .empty)) .empty) .empty) .empty) .empty) .empty) (.cutY 22528 .empty (.cutX 11264 .empty (.cutY 23552 .empty (.cutX 11776 .empty (.cutY 24064 .empty (.cutX 12032 .empty (.cutY 24320 (.cutX 12160 (.cutY 24192 .full .full) (.cutY 24192 .full .full)) .empty))))))))) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 (.cutY 10240 (.cutX 21504 (.cutY 9216 (.cutX 20992 (.cutY 8704 (.cutX 20736 (.cutY 8448 .empty (.cutX 20608 (.cutY 8576 .full .full) (.cutY 8576 .full .full))) .empty) .empty) .empty) .empty) .empty) .empty) (.cutY 10240 .empty (.cutX 23552 .empty (.cutY 11264 .empty (.cutX 24064 .empty (.cutY 11776 .empty (.cutX 24320 (.cutY 12032 .empty (.cutX 24192 (.cutY 12160 .full .full) (.cutY 12160 .full .full))) .empty))))))) .empty))) .empty) .empty))

theorem metadata107 : 0<167980383 ∧ 33<128 ∧ 80<128 ∧ 0<4 ∧
    3215/4160=0 ∧ 3215%4160=3215 ∧ ∀ i, (leaves107 i).Valid 8 := by
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

noncomputable def phaseMass107 : ℝ := singlePhaseMass (167980383/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw107 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass107_eq : phaseMass107 = (167980383/1638400000000 : ℝ) := by
  unfold phaseMass107
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw107 output107 cover107 source107
    (gridTreeUnionCheck_sound 32768 raw107 output107 cover107 source107 tree107 checked107)
    _ (by norm_num) _, areaUnits107]
  norm_num

-- Frozen phase 5087, atom 3504, type 0, source (38,84).
def leavesData108 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves108 : Fin 4 → DyadicLeaf := leavesData108.get
def raw108 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 38 84 leaves108 i
def outputData108 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨9728,9856,21504,21632⟩) (.single ⟨9728,9856,21632,21760⟩)) (.node (.single ⟨9856,9984,21504,21632⟩) (.single ⟨9856,9984,21632,21760⟩))) (.node (.node (.single ⟨11008,11136,22784,22912⟩) (.single ⟨11008,11136,22912,23040⟩)) (.node (.single ⟨11136,11264,22784,22912⟩) (.single ⟨11136,11264,22912,23040⟩)))) (.node (.node (.node (.single ⟨21504,21632,9728,9856⟩) (.single ⟨21504,21632,9856,9984⟩)) (.node (.single ⟨21632,21760,9728,9856⟩) (.single ⟨21632,21760,9856,9984⟩))) (.node (.node (.single ⟨22784,22912,11008,11136⟩) (.single ⟨22784,22912,11136,11264⟩)) (.node (.single ⟨22912,23040,11008,11136⟩) (.single ⟨22912,23040,11136,11264⟩)))))
def output108 : Fin 16 → GridBox := outputData108.get
def coverData108 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData108 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover108 (i : Fin 16) : Fin 16 := ⟨coverData108.get i % 16, Nat.mod_lt _ (by decide)⟩
def source108 (i : Fin 16) : Fin 16 := ⟨sourceData108.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree108 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 (.cutX 9216 .empty (.cutY 21504 .empty (.cutX 9728 .empty (.cutY 22016 (.cutX 9984 (.cutY 21760 (.cutX 9856 (.cutY 21632 .full .full) (.cutY 21632 .full .full)) .empty) .empty) .empty)))) .empty) (.cutY 22528 .empty (.cutX 11264 (.cutY 23552 (.cutX 10752 .empty (.cutY 23040 (.cutX 11008 .empty (.cutY 22784 .empty (.cutX 11136 (.cutY 22912 .full .full) (.cutY 22912 .full .full)))) .empty)) .empty) .empty)))) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 (.cutY 10240 (.cutX 21504 .empty (.cutY 9216 .empty (.cutX 22016 (.cutY 9728 .empty (.cutX 21760 (.cutY 9984 (.cutX 21632 (.cutY 9856 .full .full) (.cutY 9856 .full .full)) .empty) .empty)) .empty))) .empty) (.cutY 10240 .empty (.cutX 23552 (.cutY 11264 (.cutX 23040 (.cutY 10752 .empty (.cutX 22784 .empty (.cutY 11008 .empty (.cutX 22912 (.cutY 11136 .full .full) (.cutY 11136 .full .full))))) .empty) .empty) .empty))) .empty))) .empty) .empty))

theorem metadata108 : 0<167980383 ∧ 38<128 ∧ 84<128 ∧ 0<4 ∧
    3504/4160=0 ∧ 3504%4160=3504 ∧ ∀ i, (leaves108 i).Valid 8 := by
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

noncomputable def phaseMass108 : ℝ := singlePhaseMass (167980383/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw108 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass108_eq : phaseMass108 = (167980383/1638400000000 : ℝ) := by
  unfold phaseMass108
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw108 output108 cover108 source108
    (gridTreeUnionCheck_sound 32768 raw108 output108 cover108 source108 tree108 checked108)
    _ (by norm_num) _, areaUnits108]
  norm_num

-- Frozen phase 5088, atom 3605, type 0, source (40,85).
def leavesData109 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves109 : Fin 4 → DyadicLeaf := leavesData109.get
def raw109 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 40 85 leaves109 i
def outputData109 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨10240,10368,21760,21888⟩) (.single ⟨10240,10368,21888,22016⟩)) (.node (.single ⟨10368,10496,21760,21888⟩) (.single ⟨10368,10496,21888,22016⟩))) (.node (.node (.single ⟨10752,10880,22272,22400⟩) (.single ⟨10752,10880,22400,22528⟩)) (.node (.single ⟨10880,11008,22272,22400⟩) (.single ⟨10880,11008,22400,22528⟩)))) (.node (.node (.node (.single ⟨21760,21888,10240,10368⟩) (.single ⟨21760,21888,10368,10496⟩)) (.node (.single ⟨21888,22016,10240,10368⟩) (.single ⟨21888,22016,10368,10496⟩))) (.node (.node (.single ⟨22272,22400,10752,10880⟩) (.single ⟨22272,22400,10880,11008⟩)) (.node (.single ⟨22400,22528,10752,10880⟩) (.single ⟨22400,22528,10880,11008⟩)))))
def output109 : Fin 16 → GridBox := outputData109.get
def coverData109 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData109 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover109 (i : Fin 16) : Fin 16 := ⟨coverData109.get i % 16, Nat.mod_lt _ (by decide)⟩
def source109 (i : Fin 16) : Fin 16 := ⟨sourceData109.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree109 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 .empty (.cutY 22528 (.cutX 11264 (.cutY 21504 .empty (.cutX 10752 (.cutY 22016 (.cutX 10496 (.cutY 21760 .empty (.cutX 10368 (.cutY 21888 .full .full) (.cutY 21888 .full .full))) .empty) .empty) (.cutY 22016 .empty (.cutX 11008 (.cutY 22272 .empty (.cutX 10880 (.cutY 22400 .full .full) (.cutY 22400 .full .full))) .empty)))) .empty) .empty))) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 (.cutY 10240 .empty (.cutX 21504 .empty (.cutY 11264 (.cutX 22016 (.cutY 10752 (.cutX 21760 .empty (.cutY 10496 (.cutX 21888 (.cutY 10368 .full .full) (.cutY 10368 .full .full)) .empty)) .empty) (.cutY 10752 .empty (.cutX 22272 .empty (.cutY 11008 (.cutX 22400 (.cutY 10880 .full .full) (.cutY 10880 .full .full)) .empty)))) .empty))) .empty) .empty))) .empty) .empty))

theorem metadata109 : 0<1701312 ∧ 40<128 ∧ 85<128 ∧ 0<4 ∧
    3605/4160=0 ∧ 3605%4160=3605 ∧ ∀ i, (leaves109 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData109).mp
    (by decide +kernel)

theorem sourceChecked109_0 : ∀ i : Fin 16,
    (fun i => output109 i = raw109 (source109 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked109 : ∀ i : Fin 16, (fun i => output109 i = raw109 (source109 i)) i :=
  forallFin_of_zero_offset (fun i => output109 i = raw109 (source109 i)) sourceChecked109_0

theorem coverChecked109_0 : ∀ i : Fin 16,
    (fun i => (output109 (cover109 i)).ContainsBox (raw109 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked109 : ∀ i : Fin 16, (fun i => (output109 (cover109 i)).ContainsBox (raw109 i)) i :=
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

noncomputable def phaseMass109 : ℝ := singlePhaseMass (1701312/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw109 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass109_eq : phaseMass109 = (26583/25600000000 : ℝ) := by
  unfold phaseMass109
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw109 output109 cover109 source109
    (gridTreeUnionCheck_sound 32768 raw109 output109 cover109 source109 tree109 checked109)
    _ (by norm_num) _, areaUnits109]
  norm_num

-- Frozen phase 5089, atom 2649, type 0, source (25,74).
def leavesData110 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves110 : Fin 7 → DyadicLeaf := leavesData110.get
def raw110 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 25 74 leaves110 i
def outputData110 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨6400,6528,18944,19072⟩) (.node (.single ⟨6400,6528,19072,19200⟩) (.single ⟨6528,6592,18944,19008⟩))) (.node (.node (.single ⟨6528,6592,19008,19072⟩) (.single ⟨6592,6656,18944,19008⟩)) (.node (.single ⟨6592,6656,19008,19072⟩) (.single ⟨6528,6656,19072,19200⟩)))) (.node (.node (.single ⟨13568,13696,26112,26240⟩) (.node (.single ⟨13568,13696,26240,26368⟩) (.single ⟨13696,13760,26112,26176⟩))) (.node (.node (.single ⟨13696,13760,26176,26240⟩) (.single ⟨13760,13824,26112,26176⟩)) (.node (.single ⟨13760,13824,26176,26240⟩) (.single ⟨13696,13824,26240,26368⟩))))) (.node (.node (.node (.single ⟨18944,19072,6400,6528⟩) (.node (.single ⟨18944,19008,6528,6592⟩) (.single ⟨18944,19008,6592,6656⟩))) (.node (.node (.single ⟨19008,19072,6528,6592⟩) (.single ⟨19008,19072,6592,6656⟩)) (.node (.single ⟨19072,19200,6400,6528⟩) (.single ⟨19072,19200,6528,6656⟩)))) (.node (.node (.single ⟨26112,26240,13568,13696⟩) (.node (.single ⟨26112,26176,13696,13760⟩) (.single ⟨26112,26176,13760,13824⟩))) (.node (.node (.single ⟨26176,26240,13696,13760⟩) (.single ⟨26176,26240,13760,13824⟩)) (.node (.single ⟨26240,26368,13568,13696⟩) (.single ⟨26240,26368,13696,13824⟩))))))
def output110 : Fin 28 → GridBox := outputData110.get
def coverData110 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData110 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover110 (i : Fin 28) : Fin 28 := ⟨coverData110.get i % 28, Nat.mod_lt _ (by decide)⟩
def source110 (i : Fin 28) : Fin 28 := ⟨sourceData110.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree110 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 .empty (.cutX 7168 (.cutY 19456 (.cutX 6656 (.cutY 18944 .empty (.cutX 6400 .empty (.cutY 19200 (.cutX 6528 (.cutY 19072 .full .full) (.cutY 19072 (.cutX 6592 (.cutY 19008 .full .full) (.cutY 19008 .full .full)) .full)) .empty))) .empty) .empty) .empty))) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 (.cutX 13312 .empty (.cutY 25600 .empty (.cutX 13824 (.cutY 26112 .empty (.cutX 13568 .empty (.cutY 26368 (.cutX 13696 (.cutY 26240 .full .full) (.cutY 26240 (.cutX 13760 (.cutY 26176 .full .full) (.cutY 26176 .full .full)) .full)) .empty))) .empty))) .empty) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 .empty (.cutX 19456 (.cutY 7168 (.cutX 18944 .empty (.cutY 6656 (.cutX 19200 (.cutY 6400 .empty (.cutX 19072 (.cutY 6528 .full (.cutX 19008 (.cutY 6592 .full .full) (.cutY 6592 .full .full))) (.cutY 6528 .full .full))) .empty) .empty)) .empty) .empty)))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 (.cutX 25600 .empty (.cutY 13312 .empty (.cutX 26112 .empty (.cutY 13824 (.cutX 26368 (.cutY 13568 .empty (.cutX 26240 (.cutY 13696 .full (.cutX 26176 (.cutY 13760 .full .full) (.cutY 13760 .full .full))) (.cutY 13696 .full .full))) .empty) .empty)))) .empty) .empty)) .empty))) .empty))

theorem metadata110 : 0<177866497 ∧ 25<128 ∧ 74<128 ∧ 0<4 ∧
    2649/4160=0 ∧ 2649%4160=2649 ∧ ∀ i, (leaves110 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData110).mp
    (by decide +kernel)

theorem sourceChecked110_0 : ∀ i : Fin 28,
    (fun i => output110 i = raw110 (source110 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked110 : ∀ i : Fin 28, (fun i => output110 i = raw110 (source110 i)) i :=
  forallFin_of_zero_offset (fun i => output110 i = raw110 (source110 i)) sourceChecked110_0

theorem coverChecked110_0 : ∀ i : Fin 28,
    (fun i => (output110 (cover110 i)).ContainsBox (raw110 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked110 : ∀ i : Fin 28, (fun i => (output110 (cover110 i)).ContainsBox (raw110 i)) i :=
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

noncomputable def phaseMass110 : ℝ := singlePhaseMass (177866497/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw110 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass110_eq : phaseMass110 = (177866497/1638400000000 : ℝ) := by
  unfold phaseMass110
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw110 output110 cover110 source110
    (gridTreeUnionCheck_sound 32768 raw110 output110 cover110 source110 tree110 checked110)
    _ (by norm_num) _, areaUnits110]
  norm_num

-- Frozen phase 5090, atom 3277, type 0, source (34,81).
def leavesData111 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves111 : Fin 4 → DyadicLeaf := leavesData111.get
def raw111 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 34 81 leaves111 i
def outputData111 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨8704,8832,20736,20864⟩) (.single ⟨8704,8832,20864,20992⟩)) (.node (.single ⟨8832,8960,20736,20864⟩) (.single ⟨8832,8960,20864,20992⟩))) (.node (.node (.single ⟨11776,11904,23808,23936⟩) (.single ⟨11776,11904,23936,24064⟩)) (.node (.single ⟨11904,12032,23808,23936⟩) (.single ⟨11904,12032,23936,24064⟩)))) (.node (.node (.node (.single ⟨20736,20864,8704,8832⟩) (.single ⟨20736,20864,8832,8960⟩)) (.node (.single ⟨20864,20992,8704,8832⟩) (.single ⟨20864,20992,8832,8960⟩))) (.node (.node (.single ⟨23808,23936,11776,11904⟩) (.single ⟨23808,23936,11904,12032⟩)) (.node (.single ⟨23936,24064,11776,11904⟩) (.single ⟨23936,24064,11904,12032⟩)))))
def output111 : Fin 16 → GridBox := outputData111.get
def coverData111 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData111 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover111 (i : Fin 16) : Fin 16 := ⟨coverData111.get i % 16, Nat.mod_lt _ (by decide)⟩
def source111 (i : Fin 16) : Fin 16 := ⟨sourceData111.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree111 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 (.cutX 9216 (.cutY 21504 (.cutX 8704 .empty (.cutY 20992 (.cutX 8960 (.cutY 20736 .empty (.cutX 8832 (.cutY 20864 .full .full) (.cutY 20864 .full .full))) .empty) .empty)) .empty) .empty) .empty) (.cutY 22528 .empty (.cutX 11264 .empty (.cutY 23552 .empty (.cutX 11776 .empty (.cutY 24064 (.cutX 12032 (.cutY 23808 .empty (.cutX 11904 (.cutY 23936 .full .full) (.cutY 23936 .full .full))) .empty) .empty))))))) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 (.cutY 10240 (.cutX 21504 (.cutY 9216 (.cutX 20992 (.cutY 8704 .empty (.cutX 20736 .empty (.cutY 8960 (.cutX 20864 (.cutY 8832 .full .full) (.cutY 8832 .full .full)) .empty))) .empty) .empty) .empty) .empty) (.cutY 10240 .empty (.cutX 23552 .empty (.cutY 11264 .empty (.cutX 24064 (.cutY 11776 .empty (.cutX 23808 .empty (.cutY 12032 (.cutX 23936 (.cutY 11904 .full .full) (.cutY 11904 .full .full)) .empty))) .empty))))) .empty))) .empty) .empty))

theorem metadata111 : 0<167980383 ∧ 34<128 ∧ 81<128 ∧ 0<4 ∧
    3277/4160=0 ∧ 3277%4160=3277 ∧ ∀ i, (leaves111 i).Valid 8 := by
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

noncomputable def phaseMass111 : ℝ := singlePhaseMass (167980383/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw111 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass111_eq : phaseMass111 = (167980383/1638400000000 : ℝ) := by
  unfold phaseMass111
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw111 output111 cover111 source111
    (gridTreeUnionCheck_sound 32768 raw111 output111 cover111 source111 tree111 checked111)
    _ (by norm_num) _, areaUnits111]
  norm_num

-- Frozen phase 5091, atom 7551, type 1, source (36,79).
def leavesData112 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves112 : Fin 7 → DyadicLeaf := leavesData112.get
def raw112 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 36 79 leaves112 i
def outputData112 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨9216,9344,20224,20352⟩) (.node (.single ⟨9216,9344,20352,20480⟩) (.single ⟨9344,9408,20224,20288⟩))) (.node (.node (.single ⟨9344,9408,20288,20352⟩) (.single ⟨9408,9472,20224,20288⟩)) (.node (.single ⟨9408,9472,20288,20352⟩) (.single ⟨9344,9472,20352,20480⟩)))) (.node (.node (.single ⟨12288,12416,23296,23424⟩) (.node (.single ⟨12288,12416,23424,23552⟩) (.single ⟨12416,12480,23296,23360⟩))) (.node (.node (.single ⟨12416,12480,23360,23424⟩) (.single ⟨12480,12544,23296,23360⟩)) (.node (.single ⟨12480,12544,23360,23424⟩) (.single ⟨12416,12544,23424,23552⟩))))) (.node (.node (.node (.single ⟨20224,20352,9216,9344⟩) (.node (.single ⟨20224,20288,9344,9408⟩) (.single ⟨20224,20288,9408,9472⟩))) (.node (.node (.single ⟨20288,20352,9344,9408⟩) (.single ⟨20288,20352,9408,9472⟩)) (.node (.single ⟨20352,20480,9216,9344⟩) (.single ⟨20352,20480,9344,9472⟩)))) (.node (.node (.single ⟨23296,23424,12288,12416⟩) (.node (.single ⟨23296,23360,12416,12480⟩) (.single ⟨23296,23360,12480,12544⟩))) (.node (.node (.single ⟨23360,23424,12416,12480⟩) (.single ⟨23360,23424,12480,12544⟩)) (.node (.single ⟨23424,23552,12288,12416⟩) (.single ⟨23424,23552,12416,12544⟩))))))
def output112 : Fin 28 → GridBox := outputData112.get
def coverData112 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData112 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover112 (i : Fin 28) : Fin 28 := ⟨coverData112.get i % 28, Nat.mod_lt _ (by decide)⟩
def source112 (i : Fin 28) : Fin 28 := ⟨sourceData112.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree112 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 (.cutY 18432 .empty (.cutX 9216 .empty (.cutY 19456 .empty (.cutX 9728 (.cutY 19968 .empty (.cutX 9472 (.cutY 20224 .empty (.cutX 9344 (.cutY 20352 .full .full) (.cutY 20352 (.cutX 9408 (.cutY 20288 .full .full) (.cutY 20288 .full .full)) .full))) .empty)) .empty)))) .empty) .empty) (.cutY 20480 .empty (.cutX 14336 (.cutY 22528 .empty (.cutX 13312 (.cutY 23552 (.cutX 12800 (.cutY 23040 .empty (.cutX 12544 (.cutY 23296 .empty (.cutX 12416 (.cutY 23424 .full .full) (.cutY 23424 (.cutX 12480 (.cutY 23360 .full .full) (.cutY 23360 .full .full)) .full))) .empty)) .empty) .empty) .empty)) .empty))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 .empty (.cutY 10240 (.cutX 19456 .empty (.cutY 9216 .empty (.cutX 19968 .empty (.cutY 9728 (.cutX 20224 .empty (.cutY 9472 (.cutX 20352 (.cutY 9344 .full (.cutX 20288 (.cutY 9408 .full .full) (.cutY 9408 .full .full))) (.cutY 9344 .full .full)) .empty)) .empty)))) .empty)) .empty) (.cutY 12288 .empty (.cutX 22528 .empty (.cutY 14336 (.cutX 23552 (.cutY 13312 (.cutX 23040 .empty (.cutY 12800 (.cutX 23296 .empty (.cutY 12544 (.cutX 23424 (.cutY 12416 .full (.cutX 23360 (.cutY 12480 .full .full) (.cutY 12480 .full .full))) (.cutY 12416 .full .full)) .empty)) .empty)) .empty) .empty) .empty))))) .empty) .empty))

theorem metadata112 : 0<167101800 ∧ 36<128 ∧ 79<128 ∧ 1<4 ∧
    7551/4160=1 ∧ 7551%4160=3391 ∧ ∀ i, (leaves112 i).Valid 8 := by
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

noncomputable def phaseMass112 : ℝ := singlePhaseMass (167101800/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw112 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass112_eq : phaseMass112 = (835509/8192000000 : ℝ) := by
  unfold phaseMass112
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw112 output112 cover112 source112
    (gridTreeUnionCheck_sound 32768 raw112 output112 cover112 source112 tree112 checked112)
    _ (by norm_num) _, areaUnits112]
  norm_num

-- Frozen phase 5092, atom 7242, type 1, source (31,75).
def leavesData113 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves113 : Fin 10 → DyadicLeaf := leavesData113.get
def raw113 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 31 75 leaves113 i
def outputData113 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨7936,8064,19200,19328⟩) (.single ⟨7936,8064,19328,19456⟩)) (.node (.single ⟨8064,8128,19200,19264⟩) (.node (.single ⟨8064,8128,19264,19328⟩) (.single ⟨8128,8160,19200,19232⟩)))) (.node (.node (.single ⟨8128,8160,19232,19264⟩) (.single ⟨8160,8192,19200,19232⟩)) (.node (.single ⟨8160,8192,19232,19264⟩) (.node (.single ⟨8128,8192,19264,19328⟩) (.single ⟨8064,8192,19328,19456⟩))))) (.node (.node (.node (.single ⟨13312,13440,24576,24704⟩) (.single ⟨13312,13440,24704,24832⟩)) (.node (.single ⟨13440,13504,24576,24640⟩) (.node (.single ⟨13440,13504,24640,24704⟩) (.single ⟨13504,13536,24576,24608⟩)))) (.node (.node (.single ⟨13504,13536,24608,24640⟩) (.single ⟨13536,13568,24576,24608⟩)) (.node (.single ⟨13536,13568,24608,24640⟩) (.node (.single ⟨13504,13568,24640,24704⟩) (.single ⟨13440,13568,24704,24832⟩)))))) (.node (.node (.node (.node (.single ⟨19200,19328,7936,8064⟩) (.single ⟨19200,19264,8064,8128⟩)) (.node (.single ⟨19200,19232,8128,8160⟩) (.node (.single ⟨19200,19232,8160,8192⟩) (.single ⟨19232,19264,8128,8160⟩)))) (.node (.node (.single ⟨19232,19264,8160,8192⟩) (.single ⟨19264,19328,8064,8128⟩)) (.node (.single ⟨19264,19328,8128,8192⟩) (.node (.single ⟨19328,19456,7936,8064⟩) (.single ⟨19328,19456,8064,8192⟩))))) (.node (.node (.node (.single ⟨24576,24704,13312,13440⟩) (.single ⟨24576,24640,13440,13504⟩)) (.node (.single ⟨24576,24608,13504,13536⟩) (.node (.single ⟨24576,24608,13536,13568⟩) (.single ⟨24608,24640,13504,13536⟩)))) (.node (.node (.single ⟨24608,24640,13536,13568⟩) (.single ⟨24640,24704,13440,13504⟩)) (.node (.single ⟨24640,24704,13504,13568⟩) (.node (.single ⟨24704,24832,13312,13440⟩) (.single ⟨24704,24832,13440,13568⟩)))))))
def output113 : Fin 40 → GridBox := outputData113.get
def coverData113 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 28) (.single 38)) (.node (.single 11) (.node (.single 9) (.single 29))))) (.node (.node (.node (.single 30) (.single 10)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 26) (.node (.single 36) (.single 13)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 23) (.single 33)))) (.node (.node (.single 16) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))))
def sourceData113 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover113 (i : Fin 40) : Fin 40 := ⟨coverData113.get i % 40, Nat.mod_lt _ (by decide)⟩
def source113 (i : Fin 40) : Fin 40 := ⟨sourceData113.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree113 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 .empty (.cutX 7168 .empty (.cutY 19456 (.cutX 7680 .empty (.cutY 18944 .empty (.cutX 7936 .empty (.cutY 19200 .empty (.cutX 8064 (.cutY 19328 .full .full) (.cutY 19328 (.cutX 8128 (.cutY 19264 .full .full) (.cutY 19264 (.cutX 8160 (.cutY 19232 .full .full) (.cutY 19232 .full .full)) .full)) .full)))))) .empty)))) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 (.cutX 13312 .empty (.cutY 25600 (.cutX 13824 (.cutY 25088 (.cutX 13568 (.cutY 24832 (.cutX 13440 (.cutY 24704 .full .full) (.cutY 24704 (.cutX 13504 (.cutY 24640 .full .full) (.cutY 24640 (.cutX 13536 (.cutY 24608 .full .full) (.cutY 24608 .full .full)) .full)) .full)) .empty) .empty) .empty) .empty) .empty)) .empty) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 .empty (.cutX 19456 (.cutY 7168 .empty (.cutX 18944 .empty (.cutY 7680 .empty (.cutX 19200 .empty (.cutY 7936 .empty (.cutX 19328 (.cutY 8064 .full (.cutX 19264 (.cutY 8128 .full (.cutX 19232 (.cutY 8160 .full .full) (.cutY 8160 .full .full))) (.cutY 8128 .full .full))) (.cutY 8064 .full .full))))))) .empty)))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 (.cutX 25600 (.cutY 13312 .empty (.cutX 25088 (.cutY 13824 (.cutX 24832 (.cutY 13568 (.cutX 24704 (.cutY 13440 .full (.cutX 24640 (.cutY 13504 .full (.cutX 24608 (.cutY 13536 .full .full) (.cutY 13536 .full .full))) (.cutY 13504 .full .full))) (.cutY 13440 .full .full)) .empty) .empty) .empty) .empty)) .empty) .empty) .empty)) .empty))) .empty))

theorem metadata113 : 0<140060506 ∧ 31<128 ∧ 75<128 ∧ 1<4 ∧
    7242/4160=1 ∧ 7242%4160=3082 ∧ ∀ i, (leaves113 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData113).mp
    (by decide +kernel)

theorem sourceChecked113_0 : ∀ i : Fin 40,
    (fun i => output113 i = raw113 (source113 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked113 : ∀ i : Fin 40, (fun i => output113 i = raw113 (source113 i)) i :=
  forallFin_of_zero_offset (fun i => output113 i = raw113 (source113 i)) sourceChecked113_0

theorem coverChecked113_0 : ∀ i : Fin 40,
    (fun i => (output113 (cover113 i)).ContainsBox (raw113 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked113 : ∀ i : Fin 40, (fun i => (output113 (cover113 i)).ContainsBox (raw113 i)) i :=
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

noncomputable def phaseMass113 : ℝ := singlePhaseMass (140060506/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw113 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass113_eq : phaseMass113 = (70030253/819200000000 : ℝ) := by
  unfold phaseMass113
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw113 output113 cover113 source113
    (gridTreeUnionCheck_sound 32768 raw113 output113 cover113 source113 tree113 checked113)
    _ (by norm_num) _, areaUnits113]
  norm_num

-- Frozen phase 5093, atom 7809, type 1, source (41,82).
def leavesData114 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves114 : Fin 10 → DyadicLeaf := leavesData114.get
def raw114 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 41 82 leaves114 i
def outputData114 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨10496,10624,20992,21120⟩) (.single ⟨10496,10624,21120,21248⟩)) (.node (.single ⟨10624,10688,20992,21056⟩) (.node (.single ⟨10624,10688,21056,21120⟩) (.single ⟨10688,10720,20992,21024⟩)))) (.node (.node (.single ⟨10688,10720,21024,21056⟩) (.single ⟨10720,10752,20992,21024⟩)) (.node (.single ⟨10720,10752,21024,21056⟩) (.node (.single ⟨10688,10752,21056,21120⟩) (.single ⟨10624,10752,21120,21248⟩))))) (.node (.node (.node (.single ⟨11520,11648,22016,22144⟩) (.single ⟨11520,11648,22144,22272⟩)) (.node (.single ⟨11648,11712,22016,22080⟩) (.node (.single ⟨11648,11712,22080,22144⟩) (.single ⟨11712,11744,22016,22048⟩)))) (.node (.node (.single ⟨11712,11744,22048,22080⟩) (.single ⟨11744,11776,22016,22048⟩)) (.node (.single ⟨11744,11776,22048,22080⟩) (.node (.single ⟨11712,11776,22080,22144⟩) (.single ⟨11648,11776,22144,22272⟩)))))) (.node (.node (.node (.node (.single ⟨20992,21120,10496,10624⟩) (.single ⟨20992,21056,10624,10688⟩)) (.node (.single ⟨20992,21024,10688,10720⟩) (.node (.single ⟨20992,21024,10720,10752⟩) (.single ⟨21024,21056,10688,10720⟩)))) (.node (.node (.single ⟨21024,21056,10720,10752⟩) (.single ⟨21056,21120,10624,10688⟩)) (.node (.single ⟨21056,21120,10688,10752⟩) (.node (.single ⟨21120,21248,10496,10624⟩) (.single ⟨21120,21248,10624,10752⟩))))) (.node (.node (.node (.single ⟨22016,22144,11520,11648⟩) (.single ⟨22016,22080,11648,11712⟩)) (.node (.single ⟨22016,22048,11712,11744⟩) (.node (.single ⟨22016,22048,11744,11776⟩) (.single ⟨22048,22080,11712,11744⟩)))) (.node (.node (.single ⟨22048,22080,11744,11776⟩) (.single ⟨22080,22144,11648,11712⟩)) (.node (.single ⟨22080,22144,11712,11776⟩) (.node (.single ⟨22144,22272,11520,11648⟩) (.single ⟨22144,22272,11648,11776⟩)))))))
def output114 : Fin 40 → GridBox := outputData114.get
def coverData114 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 28) (.single 38)) (.node (.single 11) (.node (.single 9) (.single 29))))) (.node (.node (.node (.single 30) (.single 10)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 26) (.node (.single 36) (.single 13)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 23) (.single 33)))) (.node (.node (.single 16) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))))
def sourceData114 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover114 (i : Fin 40) : Fin 40 := ⟨coverData114.get i % 40, Nat.mod_lt _ (by decide)⟩
def source114 (i : Fin 40) : Fin 40 := ⟨sourceData114.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree114 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 .empty (.cutY 22528 (.cutX 11264 (.cutY 21504 (.cutX 10752 (.cutY 20992 .empty (.cutX 10496 .empty (.cutY 21248 (.cutX 10624 (.cutY 21120 .full .full) (.cutY 21120 (.cutX 10688 (.cutY 21056 .full .full) (.cutY 21056 (.cutX 10720 (.cutY 21024 .full .full) (.cutY 21024 .full .full)) .full)) .full)) .empty))) .empty) .empty) (.cutY 21504 .empty (.cutX 11776 (.cutY 22016 .empty (.cutX 11520 .empty (.cutY 22272 (.cutX 11648 (.cutY 22144 .full .full) (.cutY 22144 (.cutX 11712 (.cutY 22080 .full .full) (.cutY 22080 (.cutX 11744 (.cutY 22048 .full .full) (.cutY 22048 .full .full)) .full)) .full)) .empty))) .empty))) .empty))) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 (.cutY 10240 .empty (.cutX 21504 (.cutY 11264 (.cutX 20992 .empty (.cutY 10752 (.cutX 21248 (.cutY 10496 .empty (.cutX 21120 (.cutY 10624 .full (.cutX 21056 (.cutY 10688 .full (.cutX 21024 (.cutY 10720 .full .full) (.cutY 10720 .full .full))) (.cutY 10688 .full .full))) (.cutY 10624 .full .full))) .empty) .empty)) .empty) (.cutY 11264 .empty (.cutX 22016 .empty (.cutY 11776 (.cutX 22272 (.cutY 11520 .empty (.cutX 22144 (.cutY 11648 .full (.cutX 22080 (.cutY 11712 .full (.cutX 22048 (.cutY 11744 .full .full) (.cutY 11744 .full .full))) (.cutY 11712 .full .full))) (.cutY 11648 .full .full))) .empty) .empty))))) .empty) .empty))) .empty) .empty))

theorem metadata114 : 0<56923454 ∧ 41<128 ∧ 82<128 ∧ 1<4 ∧
    7809/4160=1 ∧ 7809%4160=3649 ∧ ∀ i, (leaves114 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData114).mp
    (by decide +kernel)

theorem sourceChecked114_0 : ∀ i : Fin 40,
    (fun i => output114 i = raw114 (source114 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked114 : ∀ i : Fin 40, (fun i => output114 i = raw114 (source114 i)) i :=
  forallFin_of_zero_offset (fun i => output114 i = raw114 (source114 i)) sourceChecked114_0

theorem coverChecked114_0 : ∀ i : Fin 40,
    (fun i => (output114 (cover114 i)).ContainsBox (raw114 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked114 : ∀ i : Fin 40, (fun i => (output114 (cover114 i)).ContainsBox (raw114 i)) i :=
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

noncomputable def phaseMass114 : ℝ := singlePhaseMass (56923454/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw114 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass114_eq : phaseMass114 = (28461727/819200000000 : ℝ) := by
  unfold phaseMass114
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw114 output114 cover114 source114
    (gridTreeUnionCheck_sound 32768 raw114 output114 cover114 source114 tree114 checked114)
    _ (by norm_num) _, areaUnits114]
  norm_num

-- Frozen phase 5094, atom 5613, type 1, source (12,61).
def leavesData115 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves115 : Fin 10 → DyadicLeaf := leavesData115.get
def raw115 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 12 61 leaves115 i
def outputData115 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨3072,3136,15616,15680⟩) (.single ⟨3072,3136,15680,15744⟩)) (.node (.single ⟨3136,3200,15616,15680⟩) (.node (.single ⟨3136,3200,15680,15744⟩) (.single ⟨3072,3200,15744,15872⟩)))) (.node (.node (.single ⟨3200,3264,15616,15680⟩) (.single ⟨3200,3264,15680,15744⟩)) (.node (.single ⟨3264,3328,15616,15680⟩) (.node (.single ⟨3264,3328,15680,15744⟩) (.single ⟨3200,3328,15744,15872⟩))))) (.node (.node (.node (.single ⟨15616,15680,3072,3136⟩) (.single ⟨15616,15680,3136,3200⟩)) (.node (.single ⟨15680,15744,3072,3136⟩) (.node (.single ⟨15680,15744,3136,3200⟩) (.single ⟨15616,15680,3200,3264⟩)))) (.node (.node (.single ⟨15616,15680,3264,3328⟩) (.single ⟨15680,15744,3200,3264⟩)) (.node (.single ⟨15680,15744,3264,3328⟩) (.node (.single ⟨15744,15872,3072,3200⟩) (.single ⟨15744,15872,3200,3328⟩)))))) (.node (.node (.node (.node (.single ⟨16896,17024,29440,29568⟩) (.single ⟨16896,17024,29568,29696⟩)) (.node (.single ⟨17024,17088,29440,29504⟩) (.node (.single ⟨17024,17088,29504,29568⟩) (.single ⟨17088,17152,29440,29504⟩)))) (.node (.node (.single ⟨17088,17152,29504,29568⟩) (.single ⟨17024,17088,29568,29632⟩)) (.node (.single ⟨17024,17088,29632,29696⟩) (.node (.single ⟨17088,17152,29568,29632⟩) (.single ⟨17088,17152,29632,29696⟩))))) (.node (.node (.node (.single ⟨29440,29568,16896,17024⟩) (.single ⟨29440,29504,17024,17088⟩)) (.node (.single ⟨29440,29504,17088,17152⟩) (.node (.single ⟨29504,29568,17024,17088⟩) (.single ⟨29504,29568,17088,17152⟩)))) (.node (.node (.single ⟨29568,29696,16896,17024⟩) (.single ⟨29568,29632,17024,17088⟩)) (.node (.single ⟨29568,29632,17088,17152⟩) (.node (.single ⟨29632,29696,17024,17088⟩) (.single ⟨29632,29696,17088,17152⟩)))))))
def output115 : Fin 40 → GridBox := outputData115.get
def coverData115 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 18)) (.node (.single 35) (.node (.single 21) (.single 9)))) (.node (.node (.single 19) (.single 30)) (.node (.single 20) (.node (.single 5) (.single 14))))) (.node (.node (.node (.single 34) (.single 25)) (.node (.single 6) (.node (.single 16) (.single 33)))) (.node (.node (.single 23) (.single 7)) (.node (.single 15) (.node (.single 32) (.single 24)))))) (.node (.node (.node (.node (.single 8) (.single 17)) (.node (.single 31) (.node (.single 22) (.single 0)))) (.node (.node (.single 10) (.single 39)) (.node (.single 29) (.node (.single 1) (.single 12))))) (.node (.node (.node (.single 38) (.single 27)) (.node (.single 2) (.node (.single 11) (.single 37)))) (.node (.node (.single 28) (.single 3)) (.node (.single 13) (.node (.single 36) (.single 26)))))))
def sourceData115 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover115 (i : Fin 40) : Fin 40 := ⟨coverData115.get i % 40, Nat.mod_lt _ (by decide)⟩
def source115 (i : Fin 40) : Fin 40 := ⟨sourceData115.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree115 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 .empty (.cutX 3072 .empty (.cutY 15360 .empty (.cutX 3584 (.cutY 15872 (.cutX 3328 (.cutY 15616 .empty (.cutX 3200 (.cutY 15744 (.cutX 3136 (.cutY 15680 .full .full) (.cutY 15680 .full .full)) .full) (.cutY 15744 (.cutX 3264 (.cutY 15680 .full .full) (.cutY 15680 .full .full)) .full))) .empty) .empty) .empty)))))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 .empty (.cutX 15360 .empty (.cutY 3072 .empty (.cutX 15872 (.cutY 3584 (.cutX 15616 .empty (.cutY 3328 (.cutX 15744 (.cutY 3200 (.cutX 15680 (.cutY 3136 .full .full) (.cutY 3136 .full .full)) (.cutX 15680 (.cutY 3264 .full .full) (.cutY 3264 .full .full))) (.cutY 3200 .full .full)) .empty)) .empty) .empty))))) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 (.cutX 17408 (.cutY 29696 (.cutX 16896 .empty (.cutY 29184 .empty (.cutX 17152 (.cutY 29440 .empty (.cutX 17024 (.cutY 29568 .full .full) (.cutY 29568 (.cutX 17088 (.cutY 29504 .full .full) (.cutY 29504 .full .full)) (.cutX 17088 (.cutY 29632 .full .full) (.cutY 29632 .full .full))))) .empty))) .empty) .empty) .empty) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 (.cutX 29696 (.cutY 17408 (.cutX 29184 .empty (.cutY 16896 .empty (.cutX 29440 .empty (.cutY 17152 (.cutX 29568 (.cutY 17024 .full (.cutX 29504 (.cutY 17088 .full .full) (.cutY 17088 .full .full))) (.cutY 17024 .full (.cutX 29632 (.cutY 17088 .full .full) (.cutY 17088 .full .full)))) .empty)))) .empty) .empty) .empty) .empty) .empty)) .empty))))

theorem metadata115 : 0<163200014 ∧ 12<128 ∧ 61<128 ∧ 1<4 ∧
    5613/4160=1 ∧ 5613%4160=1453 ∧ ∀ i, (leaves115 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData115).mp
    (by decide +kernel)

theorem sourceChecked115_0 : ∀ i : Fin 40,
    (fun i => output115 i = raw115 (source115 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked115 : ∀ i : Fin 40, (fun i => output115 i = raw115 (source115 i)) i :=
  forallFin_of_zero_offset (fun i => output115 i = raw115 (source115 i)) sourceChecked115_0

theorem coverChecked115_0 : ∀ i : Fin 40,
    (fun i => (output115 (cover115 i)).ContainsBox (raw115 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked115 : ∀ i : Fin 40, (fun i => (output115 (cover115 i)).ContainsBox (raw115 i)) i :=
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

noncomputable def phaseMass115 : ℝ := singlePhaseMass (163200014/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw115 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass115_eq : phaseMass115 = (81600007/819200000000 : ℝ) := by
  unfold phaseMass115
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw115 output115 cover115 source115
    (gridTreeUnionCheck_sound 32768 raw115 output115 cover115 source115 tree115 checked115)
    _ (by norm_num) _, areaUnits115]
  norm_num

-- Frozen phase 5095, atom 6959, type 1, source (27,72).
def leavesData116 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves116 : Fin 10 → DyadicLeaf := leavesData116.get
def raw116 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 27 72 leaves116 i
def outputData116 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨6912,7040,18432,18560⟩) (.single ⟨6912,7040,18560,18688⟩)) (.node (.single ⟨7040,7104,18432,18496⟩) (.node (.single ⟨7040,7104,18496,18560⟩) (.single ⟨7104,7136,18432,18464⟩)))) (.node (.node (.single ⟨7104,7136,18464,18496⟩) (.single ⟨7136,7168,18432,18464⟩)) (.node (.single ⟨7136,7168,18464,18496⟩) (.node (.single ⟨7104,7168,18496,18560⟩) (.single ⟨7040,7168,18560,18688⟩))))) (.node (.node (.node (.single ⟨14080,14208,25600,25728⟩) (.single ⟨14080,14208,25728,25856⟩)) (.node (.single ⟨14208,14272,25600,25664⟩) (.node (.single ⟨14208,14272,25664,25728⟩) (.single ⟨14272,14304,25600,25632⟩)))) (.node (.node (.single ⟨14272,14304,25632,25664⟩) (.single ⟨14304,14336,25600,25632⟩)) (.node (.single ⟨14304,14336,25632,25664⟩) (.node (.single ⟨14272,14336,25664,25728⟩) (.single ⟨14208,14336,25728,25856⟩)))))) (.node (.node (.node (.node (.single ⟨18432,18560,6912,7040⟩) (.single ⟨18432,18496,7040,7104⟩)) (.node (.single ⟨18432,18464,7104,7136⟩) (.node (.single ⟨18432,18464,7136,7168⟩) (.single ⟨18464,18496,7104,7136⟩)))) (.node (.node (.single ⟨18464,18496,7136,7168⟩) (.single ⟨18496,18560,7040,7104⟩)) (.node (.single ⟨18496,18560,7104,7168⟩) (.node (.single ⟨18560,18688,6912,7040⟩) (.single ⟨18560,18688,7040,7168⟩))))) (.node (.node (.node (.single ⟨25600,25728,14080,14208⟩) (.single ⟨25600,25664,14208,14272⟩)) (.node (.single ⟨25600,25632,14272,14304⟩) (.node (.single ⟨25600,25632,14304,14336⟩) (.single ⟨25632,25664,14272,14304⟩)))) (.node (.node (.single ⟨25632,25664,14304,14336⟩) (.single ⟨25664,25728,14208,14272⟩)) (.node (.single ⟨25664,25728,14272,14336⟩) (.node (.single ⟨25728,25856,14080,14208⟩) (.single ⟨25728,25856,14208,14336⟩)))))))
def output116 : Fin 40 → GridBox := outputData116.get
def coverData116 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 28) (.single 38)) (.node (.single 11) (.node (.single 9) (.single 29))))) (.node (.node (.node (.single 30) (.single 10)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 26) (.node (.single 36) (.single 13)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 23) (.single 33)))) (.node (.node (.single 16) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))))
def sourceData116 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover116 (i : Fin 40) : Fin 40 := ⟨coverData116.get i % 40, Nat.mod_lt _ (by decide)⟩
def source116 (i : Fin 40) : Fin 40 := ⟨sourceData116.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree116 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 .empty (.cutX 7168 (.cutY 19456 (.cutX 6656 .empty (.cutY 18944 (.cutX 6912 .empty (.cutY 18688 (.cutX 7040 (.cutY 18560 .full .full) (.cutY 18560 (.cutX 7104 (.cutY 18496 .full .full) (.cutY 18496 (.cutX 7136 (.cutY 18464 .full .full) (.cutY 18464 .full .full)) .full)) .full)) .empty)) .empty)) .empty) .empty))) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 (.cutX 13312 .empty (.cutY 25600 .empty (.cutX 13824 .empty (.cutY 26112 (.cutX 14080 .empty (.cutY 25856 (.cutX 14208 (.cutY 25728 .full .full) (.cutY 25728 (.cutX 14272 (.cutY 25664 .full .full) (.cutY 25664 (.cutX 14304 (.cutY 25632 .full .full) (.cutY 25632 .full .full)) .full)) .full)) .empty)) .empty)))) .empty) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 .empty (.cutX 19456 (.cutY 7168 (.cutX 18944 (.cutY 6656 .empty (.cutX 18688 (.cutY 6912 .empty (.cutX 18560 (.cutY 7040 .full (.cutX 18496 (.cutY 7104 .full (.cutX 18464 (.cutY 7136 .full .full) (.cutY 7136 .full .full))) (.cutY 7104 .full .full))) (.cutY 7040 .full .full))) .empty)) .empty) .empty) .empty)))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 (.cutX 25600 .empty (.cutY 13312 .empty (.cutX 26112 (.cutY 13824 .empty (.cutX 25856 (.cutY 14080 .empty (.cutX 25728 (.cutY 14208 .full (.cutX 25664 (.cutY 14272 .full (.cutX 25632 (.cutY 14304 .full .full) (.cutY 14304 .full .full))) (.cutY 14272 .full .full))) (.cutY 14208 .full .full))) .empty)) .empty))) .empty) .empty)) .empty))) .empty))

theorem metadata116 : 0<140060506 ∧ 27<128 ∧ 72<128 ∧ 1<4 ∧
    6959/4160=1 ∧ 6959%4160=2799 ∧ ∀ i, (leaves116 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData116).mp
    (by decide +kernel)

theorem sourceChecked116_0 : ∀ i : Fin 40,
    (fun i => output116 i = raw116 (source116 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked116 : ∀ i : Fin 40, (fun i => output116 i = raw116 (source116 i)) i :=
  forallFin_of_zero_offset (fun i => output116 i = raw116 (source116 i)) sourceChecked116_0

theorem coverChecked116_0 : ∀ i : Fin 40,
    (fun i => (output116 (cover116 i)).ContainsBox (raw116 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked116 : ∀ i : Fin 40, (fun i => (output116 (cover116 i)).ContainsBox (raw116 i)) i :=
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

noncomputable def phaseMass116 : ℝ := singlePhaseMass (140060506/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw116 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass116_eq : phaseMass116 = (70030253/819200000000 : ℝ) := by
  unfold phaseMass116
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw116 output116 cover116 source116
    (gridTreeUnionCheck_sound 32768 raw116 output116 cover116 source116 tree116 checked116)
    _ (by norm_num) _, areaUnits116]
  norm_num

-- Frozen phase 5096, atom 6644, type 1, source (23,69).
def leavesData117 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves117 : Fin 10 → DyadicLeaf := leavesData117.get
def raw117 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 23 69 leaves117 i
def outputData117 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨5888,6016,17664,17792⟩) (.single ⟨5888,6016,17792,17920⟩)) (.node (.single ⟨6016,6080,17664,17728⟩) (.node (.single ⟨6016,6080,17728,17792⟩) (.single ⟨6080,6112,17664,17696⟩)))) (.node (.node (.single ⟨6080,6112,17696,17728⟩) (.single ⟨6112,6144,17664,17696⟩)) (.node (.single ⟨6112,6144,17696,17728⟩) (.node (.single ⟨6080,6144,17728,17792⟩) (.single ⟨6016,6144,17792,17920⟩))))) (.node (.node (.node (.single ⟨14848,14976,26624,26752⟩) (.single ⟨14848,14976,26752,26880⟩)) (.node (.single ⟨14976,15040,26624,26688⟩) (.node (.single ⟨14976,15040,26688,26752⟩) (.single ⟨15040,15072,26624,26656⟩)))) (.node (.node (.single ⟨15040,15072,26656,26688⟩) (.single ⟨15072,15104,26624,26656⟩)) (.node (.single ⟨15072,15104,26656,26688⟩) (.node (.single ⟨15040,15104,26688,26752⟩) (.single ⟨14976,15104,26752,26880⟩)))))) (.node (.node (.node (.node (.single ⟨17664,17792,5888,6016⟩) (.single ⟨17664,17728,6016,6080⟩)) (.node (.single ⟨17664,17696,6080,6112⟩) (.node (.single ⟨17664,17696,6112,6144⟩) (.single ⟨17696,17728,6080,6112⟩)))) (.node (.node (.single ⟨17696,17728,6112,6144⟩) (.single ⟨17728,17792,6016,6080⟩)) (.node (.single ⟨17728,17792,6080,6144⟩) (.node (.single ⟨17792,17920,5888,6016⟩) (.single ⟨17792,17920,6016,6144⟩))))) (.node (.node (.node (.single ⟨26624,26752,14848,14976⟩) (.single ⟨26624,26688,14976,15040⟩)) (.node (.single ⟨26624,26656,15040,15072⟩) (.node (.single ⟨26624,26656,15072,15104⟩) (.single ⟨26656,26688,15040,15072⟩)))) (.node (.node (.single ⟨26656,26688,15072,15104⟩) (.single ⟨26688,26752,14976,15040⟩)) (.node (.single ⟨26688,26752,15040,15104⟩) (.node (.single ⟨26752,26880,14848,14976⟩) (.single ⟨26752,26880,14976,15104⟩)))))))
def output117 : Fin 40 → GridBox := outputData117.get
def coverData117 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 28) (.single 38)) (.node (.single 11) (.node (.single 9) (.single 29))))) (.node (.node (.node (.single 30) (.single 10)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 26) (.node (.single 36) (.single 13)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 23) (.single 33)))) (.node (.node (.single 16) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))))
def sourceData117 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover117 (i : Fin 40) : Fin 40 := ⟨coverData117.get i % 40, Nat.mod_lt _ (by decide)⟩
def source117 (i : Fin 40) : Fin 40 := ⟨sourceData117.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree117 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 (.cutX 5120 .empty (.cutY 17408 .empty (.cutX 5632 .empty (.cutY 17920 (.cutX 5888 .empty (.cutY 17664 .empty (.cutX 6016 (.cutY 17792 .full .full) (.cutY 17792 (.cutX 6080 (.cutY 17728 .full .full) (.cutY 17728 (.cutX 6112 (.cutY 17696 .full .full) (.cutY 17696 .full .full)) .full)) .full)))) .empty)))) .empty) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 .empty (.cutX 15360 (.cutY 27648 (.cutX 14848 .empty (.cutY 27136 (.cutX 15104 (.cutY 26880 (.cutX 14976 (.cutY 26752 .full .full) (.cutY 26752 (.cutX 15040 (.cutY 26688 .full .full) (.cutY 26688 (.cutX 15072 (.cutY 26656 .full .full) (.cutY 26656 .full .full)) .full)) .full)) .empty) .empty) .empty)) .empty) .empty))) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 (.cutX 17408 .empty (.cutY 5120 .empty (.cutX 17920 (.cutY 5632 .empty (.cutX 17664 .empty (.cutY 5888 .empty (.cutX 17792 (.cutY 6016 .full (.cutX 17728 (.cutY 6080 .full (.cutX 17696 (.cutY 6112 .full .full) (.cutY 6112 .full .full))) (.cutY 6080 .full .full))) (.cutY 6016 .full .full))))) .empty))) .empty) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 .empty (.cutX 27648 (.cutY 15360 (.cutX 27136 (.cutY 14848 .empty (.cutX 26880 (.cutY 15104 (.cutX 26752 (.cutY 14976 .full (.cutX 26688 (.cutY 15040 .full (.cutX 26656 (.cutY 15072 .full .full) (.cutY 15072 .full .full))) (.cutY 15040 .full .full))) (.cutY 14976 .full .full)) .empty) .empty)) .empty) .empty) .empty)))) .empty))) .empty))

theorem metadata117 : 0<135260814 ∧ 23<128 ∧ 69<128 ∧ 1<4 ∧
    6644/4160=1 ∧ 6644%4160=2484 ∧ ∀ i, (leaves117 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData117).mp
    (by decide +kernel)

theorem sourceChecked117_0 : ∀ i : Fin 40,
    (fun i => output117 i = raw117 (source117 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked117 : ∀ i : Fin 40, (fun i => output117 i = raw117 (source117 i)) i :=
  forallFin_of_zero_offset (fun i => output117 i = raw117 (source117 i)) sourceChecked117_0

theorem coverChecked117_0 : ∀ i : Fin 40,
    (fun i => (output117 (cover117 i)).ContainsBox (raw117 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked117 : ∀ i : Fin 40, (fun i => (output117 (cover117 i)).ContainsBox (raw117 i)) i :=
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

noncomputable def phaseMass117 : ℝ := singlePhaseMass (135260814/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw117 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass117_eq : phaseMass117 = (67630407/819200000000 : ℝ) := by
  unfold phaseMass117
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw117 output117 cover117 source117
    (gridTreeUnionCheck_sound 32768 raw117 output117 cover117 source117 tree117 checked117)
    _ (by norm_num) _, areaUnits117]
  norm_num

-- Frozen phase 5097, atom 6297, type 1, source (19,66).
def leavesData118 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves118 : Fin 13 → DyadicLeaf := leavesData118.get
def raw118 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 19 66 leaves118 i
def outputData118 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨4864,4928,16896,16960⟩) (.node (.single ⟨4864,4928,16960,17024⟩) (.single ⟨4928,4992,16896,16960⟩))) (.node (.single ⟨4928,4992,16960,17024⟩) (.node (.single ⟨4864,4992,17024,17152⟩) (.single ⟨4992,5056,16896,16960⟩)))) (.node (.node (.single ⟨4992,5056,16960,17024⟩) (.node (.single ⟨5056,5088,16896,16928⟩) (.single ⟨5056,5088,16928,16960⟩))) (.node (.node (.single ⟨5088,5120,16896,16928⟩) (.single ⟨5088,5120,16928,16960⟩)) (.node (.single ⟨5056,5120,16960,17024⟩) (.single ⟨4992,5120,17024,17152⟩))))) (.node (.node (.node (.single ⟨15616,15744,27648,27776⟩) (.node (.single ⟨15616,15744,27776,27904⟩) (.single ⟨15744,15808,27648,27712⟩))) (.node (.single ⟨15744,15808,27712,27776⟩) (.node (.single ⟨15808,15840,27648,27680⟩) (.single ⟨15808,15840,27680,27712⟩)))) (.node (.node (.single ⟨15840,15872,27648,27680⟩) (.node (.single ⟨15840,15872,27680,27712⟩) (.single ⟨15808,15872,27712,27776⟩))) (.node (.node (.single ⟨15744,15808,27776,27840⟩) (.single ⟨15744,15808,27840,27904⟩)) (.node (.single ⟨15808,15872,27776,27840⟩) (.single ⟨15808,15872,27840,27904⟩)))))) (.node (.node (.node (.node (.single ⟨16896,16960,4864,4928⟩) (.node (.single ⟨16896,16960,4928,4992⟩) (.single ⟨16960,17024,4864,4928⟩))) (.node (.single ⟨16960,17024,4928,4992⟩) (.node (.single ⟨16896,16960,4992,5056⟩) (.single ⟨16896,16928,5056,5088⟩)))) (.node (.node (.single ⟨16896,16928,5088,5120⟩) (.node (.single ⟨16928,16960,5056,5088⟩) (.single ⟨16928,16960,5088,5120⟩))) (.node (.node (.single ⟨16960,17024,4992,5056⟩) (.single ⟨16960,17024,5056,5120⟩)) (.node (.single ⟨17024,17152,4864,4992⟩) (.single ⟨17024,17152,4992,5120⟩))))) (.node (.node (.node (.single ⟨27648,27776,15616,15744⟩) (.node (.single ⟨27648,27712,15744,15808⟩) (.single ⟨27648,27680,15808,15840⟩))) (.node (.single ⟨27648,27680,15840,15872⟩) (.node (.single ⟨27680,27712,15808,15840⟩) (.single ⟨27680,27712,15840,15872⟩)))) (.node (.node (.single ⟨27712,27776,15744,15808⟩) (.node (.single ⟨27712,27776,15808,15872⟩) (.single ⟨27776,27904,15616,15744⟩))) (.node (.node (.single ⟨27776,27840,15744,15808⟩) (.single ⟨27776,27840,15808,15872⟩)) (.node (.single ⟨27840,27904,15744,15808⟩) (.single ⟨27840,27904,15808,15872⟩)))))))
def output118 : Fin 52 → GridBox := outputData118.get
def coverData118 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData118 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover118 (i : Fin 52) : Fin 52 := ⟨coverData118.get i % 52, Nat.mod_lt _ (by decide)⟩
def source118 (i : Fin 52) : Fin 52 := ⟨sourceData118.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree118 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 (.cutX 5120 (.cutY 17408 (.cutX 4608 .empty (.cutY 16896 .empty (.cutX 4864 .empty (.cutY 17152 (.cutX 4992 (.cutY 17024 (.cutX 4928 (.cutY 16960 .full .full) (.cutY 16960 .full .full)) .full) (.cutY 17024 (.cutX 5056 (.cutY 16960 .full .full) (.cutY 16960 (.cutX 5088 (.cutY 16928 .full .full) (.cutY 16928 .full .full)) .full)) .full)) .empty)))) .empty) .empty) .empty) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 .empty (.cutX 15360 .empty (.cutY 27648 .empty (.cutX 15872 (.cutY 28160 (.cutX 15616 .empty (.cutY 27904 (.cutX 15744 (.cutY 27776 .full .full) (.cutY 27776 (.cutX 15808 (.cutY 27712 .full .full) (.cutY 27712 (.cutX 15840 (.cutY 27680 .full .full) (.cutY 27680 .full .full)) .full)) (.cutX 15808 (.cutY 27840 .full .full) (.cutY 27840 .full .full)))) .empty)) .empty) .empty))))) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 (.cutX 17408 (.cutY 5120 (.cutX 16896 .empty (.cutY 4608 .empty (.cutX 17152 (.cutY 4864 .empty (.cutX 17024 (.cutY 4992 (.cutX 16960 (.cutY 4928 .full .full) (.cutY 4928 .full .full)) (.cutX 16960 (.cutY 5056 .full (.cutX 16928 (.cutY 5088 .full .full) (.cutY 5088 .full .full))) (.cutY 5056 .full .full))) (.cutY 4992 .full .full))) .empty))) .empty) .empty) .empty) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 .empty (.cutX 27648 .empty (.cutY 15360 .empty (.cutX 28160 (.cutY 15872 (.cutX 27904 (.cutY 15616 .empty (.cutX 27776 (.cutY 15744 .full (.cutX 27712 (.cutY 15808 .full (.cutX 27680 (.cutY 15840 .full .full) (.cutY 15840 .full .full))) (.cutY 15808 .full .full))) (.cutY 15744 .full (.cutX 27840 (.cutY 15808 .full .full) (.cutY 15808 .full .full))))) .empty) .empty) .empty)))))) .empty))) .empty))

theorem metadata118 : 0<135260814 ∧ 19<128 ∧ 66<128 ∧ 1<4 ∧
    6297/4160=1 ∧ 6297%4160=2137 ∧ ∀ i, (leaves118 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData118).mp
    (by decide +kernel)

theorem sourceChecked118_0 : ∀ i : Fin 52,
    (fun i => output118 i = raw118 (source118 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked118 : ∀ i : Fin 52, (fun i => output118 i = raw118 (source118 i)) i :=
  forallFin_of_zero_offset (fun i => output118 i = raw118 (source118 i)) sourceChecked118_0

theorem coverChecked118_0 : ∀ i : Fin 52,
    (fun i => (output118 (cover118 i)).ContainsBox (raw118 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked118 : ∀ i : Fin 52, (fun i => (output118 (cover118 i)).ContainsBox (raw118 i)) i :=
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

noncomputable def phaseMass118 : ℝ := singlePhaseMass (135260814/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw118 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass118_eq : phaseMass118 = (67630407/819200000000 : ℝ) := by
  unfold phaseMass118
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw118 output118 cover118 source118
    (gridTreeUnionCheck_sound 32768 raw118 output118 cover118 source118 tree118 checked118)
    _ (by norm_num) _, areaUnits118]
  norm_num

-- Frozen phase 5098, atom 5179, type 1, source (8,59).
def leavesData119 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves119 : Fin 7 → DyadicLeaf := leavesData119.get
def raw119 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 8 59 leaves119 i
def outputData119 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨2048,2176,15104,15232⟩) (.node (.single ⟨2048,2176,15232,15360⟩) (.single ⟨2176,2240,15104,15168⟩))) (.node (.node (.single ⟨2176,2240,15168,15232⟩) (.single ⟨2240,2304,15104,15168⟩)) (.node (.single ⟨2240,2304,15168,15232⟩) (.single ⟨2176,2304,15232,15360⟩)))) (.node (.node (.single ⟨15104,15232,2048,2176⟩) (.node (.single ⟨15104,15168,2176,2240⟩) (.single ⟨15104,15168,2240,2304⟩))) (.node (.node (.single ⟨15168,15232,2176,2240⟩) (.single ⟨15168,15232,2240,2304⟩)) (.node (.single ⟨15232,15360,2048,2176⟩) (.single ⟨15232,15360,2176,2304⟩))))) (.node (.node (.node (.single ⟨17408,17536,30464,30592⟩) (.node (.single ⟨17408,17536,30592,30720⟩) (.single ⟨17536,17600,30464,30528⟩))) (.node (.node (.single ⟨17536,17600,30528,30592⟩) (.single ⟨17600,17664,30464,30528⟩)) (.node (.single ⟨17600,17664,30528,30592⟩) (.single ⟨17536,17664,30592,30720⟩)))) (.node (.node (.single ⟨30464,30592,17408,17536⟩) (.node (.single ⟨30464,30528,17536,17600⟩) (.single ⟨30464,30528,17600,17664⟩))) (.node (.node (.single ⟨30528,30592,17536,17600⟩) (.single ⟨30528,30592,17600,17664⟩)) (.node (.single ⟨30592,30720,17408,17536⟩) (.single ⟨30592,30720,17536,17664⟩))))))
def output119 : Fin 28 → GridBox := outputData119.get
def coverData119 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData119 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover119 (i : Fin 28) : Fin 28 := ⟨coverData119.get i % 28, Nat.mod_lt _ (by decide)⟩
def source119 (i : Fin 28) : Fin 28 := ⟨sourceData119.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree119 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 .empty (.cutX 3072 (.cutY 15360 (.cutX 2560 (.cutY 14848 .empty (.cutX 2304 (.cutY 15104 .empty (.cutX 2176 (.cutY 15232 .full .full) (.cutY 15232 (.cutX 2240 (.cutY 15168 .full .full) (.cutY 15168 .full .full)) .full))) .empty)) .empty) .empty) .empty)))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 .empty (.cutX 15360 (.cutY 3072 (.cutX 14848 .empty (.cutY 2560 (.cutX 15104 .empty (.cutY 2304 (.cutX 15232 (.cutY 2176 .full (.cutX 15168 (.cutY 2240 .full .full) (.cutY 2240 .full .full))) (.cutY 2176 .full .full)) .empty)) .empty)) .empty) .empty))) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 (.cutX 17408 .empty (.cutY 29696 .empty (.cutX 17920 (.cutY 30208 .empty (.cutX 17664 (.cutY 30464 .empty (.cutX 17536 (.cutY 30592 .full .full) (.cutY 30592 (.cutX 17600 (.cutY 30528 .full .full) (.cutY 30528 .full .full)) .full))) .empty)) .empty))) .empty) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 (.cutX 29696 .empty (.cutY 17408 .empty (.cutX 30208 .empty (.cutY 17920 (.cutX 30464 .empty (.cutY 17664 (.cutX 30592 (.cutY 17536 .full (.cutX 30528 (.cutY 17600 .full .full) (.cutY 17600 .full .full))) (.cutY 17536 .full .full)) .empty)) .empty)))) .empty) .empty) .empty)) .empty))))

theorem metadata119 : 0<163200014 ∧ 8<128 ∧ 59<128 ∧ 1<4 ∧
    5179/4160=1 ∧ 5179%4160=1019 ∧ ∀ i, (leaves119 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData119).mp
    (by decide +kernel)

theorem sourceChecked119_0 : ∀ i : Fin 28,
    (fun i => output119 i = raw119 (source119 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked119 : ∀ i : Fin 28, (fun i => output119 i = raw119 (source119 i)) i :=
  forallFin_of_zero_offset (fun i => output119 i = raw119 (source119 i)) sourceChecked119_0

theorem coverChecked119_0 : ∀ i : Fin 28,
    (fun i => (output119 (cover119 i)).ContainsBox (raw119 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked119 : ∀ i : Fin 28, (fun i => (output119 (cover119 i)).ContainsBox (raw119 i)) i :=
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

noncomputable def phaseMass119 : ℝ := singlePhaseMass (163200014/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw119 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass119_eq : phaseMass119 = (81600007/819200000000 : ℝ) := by
  unfold phaseMass119
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw119 output119 cover119 source119
    (gridTreeUnionCheck_sound 32768 raw119 output119 cover119 source119 tree119 checked119)
    _ (by norm_num) _, areaUnits119]
  norm_num

-- Frozen phase 5099, atom 7308, type 1, source (32,76).
def leavesData120 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves120 : Fin 7 → DyadicLeaf := leavesData120.get
def raw120 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 32 76 leaves120 i
def outputData120 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨8192,8320,19456,19584⟩) (.node (.single ⟨8192,8320,19584,19712⟩) (.single ⟨8320,8384,19456,19520⟩))) (.node (.node (.single ⟨8320,8384,19520,19584⟩) (.single ⟨8384,8448,19456,19520⟩)) (.node (.single ⟨8384,8448,19520,19584⟩) (.single ⟨8320,8448,19584,19712⟩)))) (.node (.node (.single ⟨13056,13184,24320,24448⟩) (.node (.single ⟨13056,13184,24448,24576⟩) (.single ⟨13184,13248,24320,24384⟩))) (.node (.node (.single ⟨13184,13248,24384,24448⟩) (.single ⟨13248,13312,24320,24384⟩)) (.node (.single ⟨13248,13312,24384,24448⟩) (.single ⟨13184,13312,24448,24576⟩))))) (.node (.node (.node (.single ⟨19456,19584,8192,8320⟩) (.node (.single ⟨19456,19520,8320,8384⟩) (.single ⟨19456,19520,8384,8448⟩))) (.node (.node (.single ⟨19520,19584,8320,8384⟩) (.single ⟨19520,19584,8384,8448⟩)) (.node (.single ⟨19584,19712,8192,8320⟩) (.single ⟨19584,19712,8320,8448⟩)))) (.node (.node (.single ⟨24320,24448,13056,13184⟩) (.node (.single ⟨24320,24384,13184,13248⟩) (.single ⟨24320,24384,13248,13312⟩))) (.node (.node (.single ⟨24384,24448,13184,13248⟩) (.single ⟨24384,24448,13248,13312⟩)) (.node (.single ⟨24448,24576,13056,13184⟩) (.single ⟨24448,24576,13184,13312⟩))))))
def output120 : Fin 28 → GridBox := outputData120.get
def coverData120 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData120 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover120 (i : Fin 28) : Fin 28 := ⟨coverData120.get i % 28, Nat.mod_lt _ (by decide)⟩
def source120 (i : Fin 28) : Fin 28 := ⟨sourceData120.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree120 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 (.cutY 18432 .empty (.cutX 9216 (.cutY 19456 .empty (.cutX 8704 (.cutY 19968 (.cutX 8448 (.cutY 19712 (.cutX 8320 (.cutY 19584 .full .full) (.cutY 19584 (.cutX 8384 (.cutY 19520 .full .full) (.cutY 19520 .full .full)) .full)) .empty) .empty) .empty) .empty)) .empty)) .empty) .empty) (.cutY 20480 .empty (.cutX 14336 (.cutY 22528 .empty (.cutX 13312 (.cutY 23552 .empty (.cutX 12800 .empty (.cutY 24064 .empty (.cutX 13056 .empty (.cutY 24320 .empty (.cutX 13184 (.cutY 24448 .full .full) (.cutY 24448 (.cutX 13248 (.cutY 24384 .full .full) (.cutY 24384 .full .full)) .full))))))) .empty)) .empty))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 .empty (.cutY 10240 (.cutX 19456 .empty (.cutY 9216 (.cutX 19968 (.cutY 8704 (.cutX 19712 (.cutY 8448 (.cutX 19584 (.cutY 8320 .full (.cutX 19520 (.cutY 8384 .full .full) (.cutY 8384 .full .full))) (.cutY 8320 .full .full)) .empty) .empty) .empty) .empty) .empty)) .empty)) .empty) (.cutY 12288 .empty (.cutX 22528 .empty (.cutY 14336 (.cutX 23552 .empty (.cutY 13312 (.cutX 24064 .empty (.cutY 12800 .empty (.cutX 24320 .empty (.cutY 13056 .empty (.cutX 24448 (.cutY 13184 .full (.cutX 24384 (.cutY 13248 .full .full) (.cutY 13248 .full .full))) (.cutY 13184 .full .full)))))) .empty)) .empty))))) .empty) .empty))

theorem metadata120 : 0<167101800 ∧ 32<128 ∧ 76<128 ∧ 1<4 ∧
    7308/4160=1 ∧ 7308%4160=3148 ∧ ∀ i, (leaves120 i).Valid 8 := by
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

noncomputable def phaseMass120 : ℝ := singlePhaseMass (167101800/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw120 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass120_eq : phaseMass120 = (835509/8192000000 : ℝ) := by
  unfold phaseMass120
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw120 output120 cover120 source120
    (gridTreeUnionCheck_sound 32768 raw120 output120 cover120 source120 tree120 checked120)
    _ (by norm_num) _, areaUnits120]
  norm_num

-- Frozen phase 5100, atom 4950, type 1, source (6,58).
def leavesData121 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩))) (.node (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩)))) (.node (.node (.node (.single ⟨3,4,0⟩) (.single ⟨3,4,1⟩)) (.node (.single ⟨3,5,0⟩) (.single ⟨3,5,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves121 : Fin 16 → DyadicLeaf := leavesData121.get
def raw121 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 6 58 leaves121 i
def outputData121 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨1536,1600,14848,14912⟩) (.single ⟨1536,1600,14912,14976⟩)) (.node (.single ⟨1600,1664,14848,14912⟩) (.single ⟨1600,1664,14912,14976⟩))) (.node (.node (.single ⟨1536,1664,14976,15104⟩) (.single ⟨1664,1696,14848,14880⟩)) (.node (.single ⟨1664,1696,14880,14912⟩) (.single ⟨1696,1728,14848,14880⟩)))) (.node (.node (.node (.single ⟨1696,1728,14880,14912⟩) (.single ⟨1664,1728,14912,14976⟩)) (.node (.single ⟨1728,1760,14848,14880⟩) (.single ⟨1728,1760,14880,14912⟩))) (.node (.node (.single ⟨1760,1792,14848,14880⟩) (.single ⟨1760,1792,14880,14912⟩)) (.node (.single ⟨1728,1792,14912,14976⟩) (.single ⟨1664,1792,14976,15104⟩))))) (.node (.node (.node (.node (.single ⟨14848,14912,1536,1600⟩) (.single ⟨14848,14912,1600,1664⟩)) (.node (.single ⟨14912,14976,1536,1600⟩) (.single ⟨14912,14976,1600,1664⟩))) (.node (.node (.single ⟨14848,14880,1664,1696⟩) (.single ⟨14848,14880,1696,1728⟩)) (.node (.single ⟨14880,14912,1664,1696⟩) (.single ⟨14880,14912,1696,1728⟩)))) (.node (.node (.node (.single ⟨14848,14880,1728,1760⟩) (.single ⟨14848,14880,1760,1792⟩)) (.node (.single ⟨14880,14912,1728,1760⟩) (.single ⟨14880,14912,1760,1792⟩))) (.node (.node (.single ⟨14912,14976,1664,1728⟩) (.single ⟨14912,14976,1728,1792⟩)) (.node (.single ⟨14976,15104,1536,1664⟩) (.single ⟨14976,15104,1664,1792⟩)))))) (.node (.node (.node (.node (.node (.single ⟨17664,17792,30976,31104⟩) (.single ⟨17664,17792,31104,31232⟩)) (.node (.single ⟨17792,17856,30976,31040⟩) (.single ⟨17792,17856,31040,31104⟩))) (.node (.node (.single ⟨17856,17888,30976,31008⟩) (.single ⟨17856,17888,31008,31040⟩)) (.node (.single ⟨17888,17920,30976,31008⟩) (.single ⟨17888,17920,31008,31040⟩)))) (.node (.node (.node (.single ⟨17856,17888,31040,31072⟩) (.single ⟨17856,17888,31072,31104⟩)) (.node (.single ⟨17888,17920,31040,31072⟩) (.single ⟨17888,17920,31072,31104⟩))) (.node (.node (.single ⟨17792,17856,31104,31168⟩) (.single ⟨17792,17856,31168,31232⟩)) (.node (.single ⟨17856,17920,31104,31168⟩) (.single ⟨17856,17920,31168,31232⟩))))) (.node (.node (.node (.node (.single ⟨30976,31104,17664,17792⟩) (.single ⟨30976,31040,17792,17856⟩)) (.node (.single ⟨30976,31008,17856,17888⟩) (.single ⟨30976,31008,17888,17920⟩))) (.node (.node (.single ⟨31008,31040,17856,17888⟩) (.single ⟨31008,31040,17888,17920⟩)) (.node (.single ⟨31040,31104,17792,17856⟩) (.single ⟨31040,31072,17856,17888⟩)))) (.node (.node (.node (.single ⟨31040,31072,17888,17920⟩) (.single ⟨31072,31104,17856,17888⟩)) (.node (.single ⟨31072,31104,17888,17920⟩) (.single ⟨31104,31232,17664,17792⟩))) (.node (.node (.single ⟨31104,31168,17792,17856⟩) (.single ⟨31104,31168,17856,17920⟩)) (.node (.single ⟨31168,31232,17792,17856⟩) (.single ⟨31168,31232,17856,17920⟩)))))))
def output121 : Fin 64 → GridBox := outputData121.get
def coverData121 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 30)) (.node (.single 59) (.single 33))) (.node (.node (.single 15) (.single 31)) (.node (.single 48) (.single 32)))) (.node (.node (.node (.single 0) (.single 16)) (.node (.single 63) (.single 47))) (.node (.node (.single 1) (.single 18)) (.node (.single 62) (.single 45))))) (.node (.node (.node (.node (.single 2) (.single 17)) (.node (.single 61) (.single 46))) (.node (.node (.single 3) (.single 19)) (.node (.single 60) (.single 44)))) (.node (.node (.node (.single 9) (.single 28)) (.node (.single 54) (.single 35))) (.node (.node (.single 14) (.single 29)) (.node (.single 49) (.single 34)))))) (.node (.node (.node (.node (.node (.single 5) (.single 20)) (.node (.single 58) (.single 43))) (.node (.node (.single 6) (.single 22)) (.node (.single 57) (.single 41)))) (.node (.node (.node (.single 7) (.single 21)) (.node (.single 56) (.single 42))) (.node (.node (.single 8) (.single 23)) (.node (.single 55) (.single 40))))) (.node (.node (.node (.node (.single 10) (.single 24)) (.node (.single 53) (.single 39))) (.node (.node (.single 11) (.single 26)) (.node (.single 52) (.single 37)))) (.node (.node (.node (.single 12) (.single 25)) (.node (.single 51) (.single 38))) (.node (.node (.single 13) (.single 27)) (.node (.single 50) (.single 36)))))))
def sourceData121 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.single 20))) (.node (.node (.single 0) (.single 32)) (.node (.single 36) (.single 40)))) (.node (.node (.node (.single 44) (.single 24)) (.node (.single 48) (.single 52))) (.node (.node (.single 56) (.single 60)) (.node (.single 28) (.single 4))))) (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.single 21))) (.node (.node (.single 33) (.single 41)) (.node (.single 37) (.single 45)))) (.node (.node (.node (.single 49) (.single 57)) (.node (.single 53) (.single 61))) (.node (.node (.single 25) (.single 29)) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.node (.single 7) (.single 3)) (.node (.single 31) (.single 27))) (.node (.node (.single 63) (.single 55)) (.node (.single 59) (.single 51)))) (.node (.node (.node (.single 47) (.single 39)) (.node (.single 43) (.single 35))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11))))) (.node (.node (.node (.node (.single 6) (.single 30)) (.node (.single 62) (.single 58))) (.node (.node (.single 54) (.single 50)) (.node (.single 26) (.single 46)))) (.node (.node (.node (.single 42) (.single 38)) (.node (.single 34) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover121 (i : Fin 64) : Fin 64 := ⟨coverData121.get i % 64, Nat.mod_lt _ (by decide)⟩
def source121 (i : Fin 64) : Fin 64 := ⟨sourceData121.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree121 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 .empty (.cutX 1024 .empty (.cutY 15360 (.cutX 1536 .empty (.cutY 14848 .empty (.cutX 1792 (.cutY 15104 (.cutX 1664 (.cutY 14976 (.cutX 1600 (.cutY 14912 .full .full) (.cutY 14912 .full .full)) .full) (.cutY 14976 (.cutX 1728 (.cutY 14912 (.cutX 1696 (.cutY 14880 .full .full) (.cutY 14880 .full .full)) .full) (.cutY 14912 (.cutX 1760 (.cutY 14880 .full .full) (.cutY 14880 .full .full)) .full)) .full)) .empty) .empty))) .empty))) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 (.cutX 15360 (.cutY 1024 .empty (.cutX 14848 .empty (.cutY 1536 .empty (.cutX 15104 (.cutY 1792 (.cutX 14976 (.cutY 1664 (.cutX 14912 (.cutY 1600 .full .full) (.cutY 1600 .full .full)) (.cutX 14912 (.cutY 1728 (.cutX 14880 (.cutY 1696 .full .full) (.cutY 1696 .full .full)) (.cutX 14880 (.cutY 1760 .full .full) (.cutY 1760 .full .full))) (.cutY 1728 .full .full))) (.cutY 1664 .full .full)) .empty) .empty)))) .empty) .empty)) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 .empty (.cutX 17408 .empty (.cutY 31744 (.cutX 17920 (.cutY 31232 (.cutX 17664 .empty (.cutY 30976 .empty (.cutX 17792 (.cutY 31104 .full .full) (.cutY 31104 (.cutX 17856 (.cutY 31040 .full .full) (.cutY 31040 (.cutX 17888 (.cutY 31008 .full .full) (.cutY 31008 .full .full)) (.cutX 17888 (.cutY 31072 .full .full) (.cutY 31072 .full .full)))) (.cutX 17856 (.cutY 31168 .full .full) (.cutY 31168 .full .full)))))) .empty) .empty) .empty))) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 (.cutX 31744 (.cutY 17408 .empty (.cutX 31232 (.cutY 17920 (.cutX 30976 .empty (.cutY 17664 .empty (.cutX 31104 (.cutY 17792 .full (.cutX 31040 (.cutY 17856 .full (.cutX 31008 (.cutY 17888 .full .full) (.cutY 17888 .full .full))) (.cutY 17856 .full (.cutX 31072 (.cutY 17888 .full .full) (.cutY 17888 .full .full))))) (.cutY 17792 .full (.cutX 31168 (.cutY 17856 .full .full) (.cutY 17856 .full .full)))))) .empty) .empty)) .empty) .empty)) .empty)) .empty))))

theorem metadata121 : 0<169648215 ∧ 6<128 ∧ 58<128 ∧ 1<4 ∧
    4950/4160=1 ∧ 4950%4160=790 ∧ ∀ i, (leaves121 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData121).mp
    (by decide +kernel)

theorem sourceChecked121_0 : ∀ i : Fin 64,
    (fun i => output121 i = raw121 (source121 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked121 : ∀ i : Fin 64, (fun i => output121 i = raw121 (source121 i)) i :=
  forallFin_of_zero_offset (fun i => output121 i = raw121 (source121 i)) sourceChecked121_0

theorem coverChecked121_0 : ∀ i : Fin 64,
    (fun i => (output121 (cover121 i)).ContainsBox (raw121 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked121 : ∀ i : Fin 64, (fun i => (output121 (cover121 i)).ContainsBox (raw121 i)) i :=
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

noncomputable def phaseMass121 : ℝ := singlePhaseMass (169648215/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw121 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass121_eq : phaseMass121 = (33929643/327680000000 : ℝ) := by
  unfold phaseMass121
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw121 output121 cover121 source121
    (gridTreeUnionCheck_sound 32768 raw121 output121 cover121 source121 tree121 checked121)
    _ (by norm_num) _, areaUnits121]
  norm_num

-- Frozen phase 5101, atom 676, type 0, source (5,61).
def leavesData122 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves122 : Fin 4 → DyadicLeaf := leavesData122.get
def raw122 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 5 61 leaves122 i
def outputData122 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨1280,1408,15616,15744⟩) (.single ⟨1280,1408,15744,15872⟩)) (.node (.single ⟨1408,1536,15616,15744⟩) (.single ⟨1408,1536,15744,15872⟩))) (.node (.node (.single ⟨15616,15744,1280,1408⟩) (.single ⟨15616,15744,1408,1536⟩)) (.node (.single ⟨15744,15872,1280,1408⟩) (.single ⟨15744,15872,1408,1536⟩)))) (.node (.node (.node (.single ⟨16896,17024,31232,31360⟩) (.single ⟨16896,17024,31360,31488⟩)) (.node (.single ⟨17024,17152,31232,31360⟩) (.single ⟨17024,17152,31360,31488⟩))) (.node (.node (.single ⟨31232,31360,16896,17024⟩) (.single ⟨31232,31360,17024,17152⟩)) (.node (.single ⟨31360,31488,16896,17024⟩) (.single ⟨31360,31488,17024,17152⟩)))))
def output122 : Fin 16 → GridBox := outputData122.get
def coverData122 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData122 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover122 (i : Fin 16) : Fin 16 := ⟨coverData122.get i % 16, Nat.mod_lt _ (by decide)⟩
def source122 (i : Fin 16) : Fin 16 := ⟨sourceData122.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree122 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 .empty (.cutX 1024 .empty (.cutY 15360 .empty (.cutX 1536 (.cutY 15872 (.cutX 1280 .empty (.cutY 15616 .empty (.cutX 1408 (.cutY 15744 .full .full) (.cutY 15744 .full .full)))) .empty) .empty)))) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 (.cutX 15360 .empty (.cutY 1024 .empty (.cutX 15872 (.cutY 1536 (.cutX 15616 .empty (.cutY 1280 .empty (.cutX 15744 (.cutY 1408 .full .full) (.cutY 1408 .full .full)))) .empty) .empty))) .empty)) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 .empty (.cutX 17408 (.cutY 31744 (.cutX 16896 .empty (.cutY 31232 .empty (.cutX 17152 (.cutY 31488 (.cutX 17024 (.cutY 31360 .full .full) (.cutY 31360 .full .full)) .empty) .empty))) .empty) .empty)) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 (.cutX 31744 (.cutY 17408 (.cutX 31232 .empty (.cutY 16896 .empty (.cutX 31488 (.cutY 17152 (.cutX 31360 (.cutY 17024 .full .full) (.cutY 17024 .full .full)) .empty) .empty))) .empty) .empty) .empty)) .empty)) .empty))))

theorem metadata122 : 0<89519217 ∧ 5<128 ∧ 61<128 ∧ 0<4 ∧
    676/4160=0 ∧ 676%4160=676 ∧ ∀ i, (leaves122 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData122).mp
    (by decide +kernel)

theorem sourceChecked122_0 : ∀ i : Fin 16,
    (fun i => output122 i = raw122 (source122 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked122 : ∀ i : Fin 16, (fun i => output122 i = raw122 (source122 i)) i :=
  forallFin_of_zero_offset (fun i => output122 i = raw122 (source122 i)) sourceChecked122_0

theorem coverChecked122_0 : ∀ i : Fin 16,
    (fun i => (output122 (cover122 i)).ContainsBox (raw122 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked122 : ∀ i : Fin 16, (fun i => (output122 (cover122 i)).ContainsBox (raw122 i)) i :=
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

noncomputable def phaseMass122 : ℝ := singlePhaseMass (89519217/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw122 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass122_eq : phaseMass122 = (89519217/1638400000000 : ℝ) := by
  unfold phaseMass122
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw122 output122 cover122 source122
    (gridTreeUnionCheck_sound 32768 raw122 output122 cover122 source122 tree122 checked122)
    _ (by norm_num) _, areaUnits122]
  norm_num

-- Frozen phase 5102, atom 1134, type 0, source (9,63).
def leavesData123 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves123 : Fin 4 → DyadicLeaf := leavesData123.get
def raw123 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 9 63 leaves123 i
def outputData123 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨2304,2432,16128,16256⟩) (.single ⟨2304,2432,16256,16384⟩)) (.node (.single ⟨2432,2560,16128,16256⟩) (.single ⟨2432,2560,16256,16384⟩))) (.node (.node (.single ⟨16128,16256,2304,2432⟩) (.single ⟨16128,16256,2432,2560⟩)) (.node (.single ⟨16256,16384,2304,2432⟩) (.single ⟨16256,16384,2432,2560⟩)))) (.node (.node (.node (.single ⟨16384,16512,30208,30336⟩) (.single ⟨16384,16512,30336,30464⟩)) (.node (.single ⟨16512,16640,30208,30336⟩) (.single ⟨16512,16640,30336,30464⟩))) (.node (.node (.single ⟨30208,30336,16384,16512⟩) (.single ⟨30208,30336,16512,16640⟩)) (.node (.single ⟨30336,30464,16384,16512⟩) (.single ⟨30336,30464,16512,16640⟩)))))
def output123 : Fin 16 → GridBox := outputData123.get
def coverData123 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData123 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover123 (i : Fin 16) : Fin 16 := ⟨coverData123.get i % 16, Nat.mod_lt _ (by decide)⟩
def source123 (i : Fin 16) : Fin 16 := ⟨sourceData123.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree123 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 .empty (.cutX 3072 (.cutY 15360 .empty (.cutX 2560 (.cutY 15872 .empty (.cutX 2304 .empty (.cutY 16128 .empty (.cutX 2432 (.cutY 16256 .full .full) (.cutY 16256 .full .full))))) .empty)) .empty)))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 .empty (.cutX 15360 .empty (.cutY 3072 (.cutX 15872 .empty (.cutY 2560 (.cutX 16128 .empty (.cutY 2304 .empty (.cutX 16256 (.cutY 2432 .full .full) (.cutY 2432 .full .full)))) .empty)) .empty)))) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 (.cutX 17408 (.cutY 29696 .empty (.cutX 16896 (.cutY 30208 .empty (.cutX 16640 (.cutY 30464 (.cutX 16512 (.cutY 30336 .full .full) (.cutY 30336 .full .full)) .empty) .empty)) .empty)) .empty) .empty) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 (.cutX 29696 .empty (.cutY 17408 (.cutX 30208 .empty (.cutY 16896 (.cutX 30464 (.cutY 16640 (.cutX 30336 (.cutY 16512 .full .full) (.cutY 16512 .full .full)) .empty) .empty) .empty)) .empty)) .empty) .empty) .empty)) .empty))))

theorem metadata123 : 0<116912559 ∧ 9<128 ∧ 63<128 ∧ 0<4 ∧
    1134/4160=0 ∧ 1134%4160=1134 ∧ ∀ i, (leaves123 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData123).mp
    (by decide +kernel)

theorem sourceChecked123_0 : ∀ i : Fin 16,
    (fun i => output123 i = raw123 (source123 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked123 : ∀ i : Fin 16, (fun i => output123 i = raw123 (source123 i)) i :=
  forallFin_of_zero_offset (fun i => output123 i = raw123 (source123 i)) sourceChecked123_0

theorem coverChecked123_0 : ∀ i : Fin 16,
    (fun i => (output123 (cover123 i)).ContainsBox (raw123 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked123 : ∀ i : Fin 16, (fun i => (output123 (cover123 i)).ContainsBox (raw123 i)) i :=
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

noncomputable def phaseMass123 : ℝ := singlePhaseMass (116912559/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw123 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass123_eq : phaseMass123 = (116912559/1638400000000 : ℝ) := by
  unfold phaseMass123
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw123 output123 cover123 source123
    (gridTreeUnionCheck_sound 32768 raw123 output123 cover123 source123 tree123 checked123)
    _ (by norm_num) _, areaUnits123]
  norm_num

-- Frozen phase 5103, atom 909, type 0, source (7,62).
def leavesData124 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves124 : Fin 4 → DyadicLeaf := leavesData124.get
def raw124 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 7 62 leaves124 i
def outputData124 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨1792,1920,15872,16000⟩) (.single ⟨1792,1920,16000,16128⟩)) (.node (.single ⟨1920,2048,15872,16000⟩) (.single ⟨1920,2048,16000,16128⟩))) (.node (.node (.single ⟨15872,16000,1792,1920⟩) (.single ⟨15872,16000,1920,2048⟩)) (.node (.single ⟨16000,16128,1792,1920⟩) (.single ⟨16000,16128,1920,2048⟩)))) (.node (.node (.node (.single ⟨16640,16768,30720,30848⟩) (.single ⟨16640,16768,30848,30976⟩)) (.node (.single ⟨16768,16896,30720,30848⟩) (.single ⟨16768,16896,30848,30976⟩))) (.node (.node (.single ⟨30720,30848,16640,16768⟩) (.single ⟨30720,30848,16768,16896⟩)) (.node (.single ⟨30848,30976,16640,16768⟩) (.single ⟨30848,30976,16768,16896⟩)))))
def output124 : Fin 16 → GridBox := outputData124.get
def coverData124 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData124 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover124 (i : Fin 16) : Fin 16 := ⟨coverData124.get i % 16, Nat.mod_lt _ (by decide)⟩
def source124 (i : Fin 16) : Fin 16 := ⟨sourceData124.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree124 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 .empty (.cutX 1024 .empty (.cutY 15360 .empty (.cutX 1536 .empty (.cutY 15872 .empty (.cutX 1792 .empty (.cutY 16128 (.cutX 1920 (.cutY 16000 .full .full) (.cutY 16000 .full .full)) .empty))))))) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 (.cutX 15360 .empty (.cutY 1024 .empty (.cutX 15872 .empty (.cutY 1536 .empty (.cutX 16128 (.cutY 1792 .empty (.cutX 16000 (.cutY 1920 .full .full) (.cutY 1920 .full .full))) .empty))))) .empty)) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 .empty (.cutX 17408 (.cutY 31744 (.cutX 16896 (.cutY 31232 (.cutX 16640 .empty (.cutY 30976 (.cutX 16768 (.cutY 30848 .full .full) (.cutY 30848 .full .full)) .empty)) .empty) .empty) .empty) .empty)) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 (.cutX 31744 (.cutY 17408 (.cutX 31232 (.cutY 16896 (.cutX 30976 (.cutY 16640 .empty (.cutX 30848 (.cutY 16768 .full .full) (.cutY 16768 .full .full))) .empty) .empty) .empty) .empty) .empty) .empty)) .empty)) .empty))))

theorem metadata124 : 0<89519217 ∧ 7<128 ∧ 62<128 ∧ 0<4 ∧
    909/4160=0 ∧ 909%4160=909 ∧ ∀ i, (leaves124 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData124).mp
    (by decide +kernel)

theorem sourceChecked124_0 : ∀ i : Fin 16,
    (fun i => output124 i = raw124 (source124 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked124 : ∀ i : Fin 16, (fun i => output124 i = raw124 (source124 i)) i :=
  forallFin_of_zero_offset (fun i => output124 i = raw124 (source124 i)) sourceChecked124_0

theorem coverChecked124_0 : ∀ i : Fin 16,
    (fun i => (output124 (cover124 i)).ContainsBox (raw124 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked124 : ∀ i : Fin 16, (fun i => (output124 (cover124 i)).ContainsBox (raw124 i)) i :=
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

noncomputable def phaseMass124 : ℝ := singlePhaseMass (89519217/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw124 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass124_eq : phaseMass124 = (89519217/1638400000000 : ℝ) := by
  unfold phaseMass124
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw124 output124 cover124 source124
    (gridTreeUnionCheck_sound 32768 raw124 output124 cover124 source124 tree124 checked124)
    _ (by norm_num) _, areaUnits124]
  norm_num

-- Frozen phase 5104, atom 6016, type 1, source (16,64).
def leavesData125 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves125 : Fin 10 → DyadicLeaf := leavesData125.get
def raw125 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 16 64 leaves125 i
def outputData125 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨4096,4224,16384,16512⟩) (.single ⟨4096,4224,16512,16640⟩)) (.node (.single ⟨4224,4288,16384,16448⟩) (.node (.single ⟨4224,4288,16448,16512⟩) (.single ⟨4288,4320,16384,16416⟩)))) (.node (.node (.single ⟨4288,4320,16416,16448⟩) (.single ⟨4320,4352,16384,16416⟩)) (.node (.single ⟨4320,4352,16416,16448⟩) (.node (.single ⟨4288,4352,16448,16512⟩) (.single ⟨4224,4352,16512,16640⟩))))) (.node (.node (.node (.single ⟨16128,16256,28416,28544⟩) (.single ⟨16128,16256,28544,28672⟩)) (.node (.single ⟨16256,16320,28416,28480⟩) (.node (.single ⟨16256,16320,28480,28544⟩) (.single ⟨16320,16352,28416,28448⟩)))) (.node (.node (.single ⟨16320,16352,28448,28480⟩) (.single ⟨16352,16384,28416,28448⟩)) (.node (.single ⟨16352,16384,28448,28480⟩) (.node (.single ⟨16320,16384,28480,28544⟩) (.single ⟨16256,16384,28544,28672⟩)))))) (.node (.node (.node (.node (.single ⟨16384,16512,4096,4224⟩) (.single ⟨16384,16448,4224,4288⟩)) (.node (.single ⟨16384,16416,4288,4320⟩) (.node (.single ⟨16384,16416,4320,4352⟩) (.single ⟨16416,16448,4288,4320⟩)))) (.node (.node (.single ⟨16416,16448,4320,4352⟩) (.single ⟨16448,16512,4224,4288⟩)) (.node (.single ⟨16448,16512,4288,4352⟩) (.node (.single ⟨16512,16640,4096,4224⟩) (.single ⟨16512,16640,4224,4352⟩))))) (.node (.node (.node (.single ⟨28416,28544,16128,16256⟩) (.single ⟨28416,28480,16256,16320⟩)) (.node (.single ⟨28416,28448,16320,16352⟩) (.node (.single ⟨28416,28448,16352,16384⟩) (.single ⟨28448,28480,16320,16352⟩)))) (.node (.node (.single ⟨28448,28480,16352,16384⟩) (.single ⟨28480,28544,16256,16320⟩)) (.node (.single ⟨28480,28544,16320,16384⟩) (.node (.single ⟨28544,28672,16128,16256⟩) (.single ⟨28544,28672,16256,16384⟩)))))))
def output125 : Fin 40 → GridBox := outputData125.get
def coverData125 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 28) (.single 38)) (.node (.single 11) (.node (.single 9) (.single 29))))) (.node (.node (.node (.single 30) (.single 10)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 26) (.node (.single 36) (.single 13)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 23) (.single 33)))) (.node (.node (.single 16) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))))
def sourceData125 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover125 (i : Fin 40) : Fin 40 := ⟨coverData125.get i % 40, Nat.mod_lt _ (by decide)⟩
def source125 (i : Fin 40) : Fin 40 := ⟨sourceData125.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree125 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 (.cutX 5120 (.cutY 17408 (.cutX 4608 (.cutY 16896 (.cutX 4352 (.cutY 16640 (.cutX 4224 (.cutY 16512 .full .full) (.cutY 16512 (.cutX 4288 (.cutY 16448 .full .full) (.cutY 16448 (.cutX 4320 (.cutY 16416 .full .full) (.cutY 16416 .full .full)) .full)) .full)) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 .empty (.cutX 15360 .empty (.cutY 27648 .empty (.cutX 15872 .empty (.cutY 28160 .empty (.cutX 16128 .empty (.cutY 28416 .empty (.cutX 16256 (.cutY 28544 .full .full) (.cutY 28544 (.cutX 16320 (.cutY 28480 .full .full) (.cutY 28480 (.cutX 16352 (.cutY 28448 .full .full) (.cutY 28448 .full .full)) .full)) .full)))))))))) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 (.cutX 17408 (.cutY 5120 (.cutX 16896 (.cutY 4608 (.cutX 16640 (.cutY 4352 (.cutX 16512 (.cutY 4224 .full (.cutX 16448 (.cutY 4288 .full (.cutX 16416 (.cutY 4320 .full .full) (.cutY 4320 .full .full))) (.cutY 4288 .full .full))) (.cutY 4224 .full .full)) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 .empty (.cutX 27648 .empty (.cutY 15360 .empty (.cutX 28160 .empty (.cutY 15872 .empty (.cutX 28416 .empty (.cutY 16128 .empty (.cutX 28544 (.cutY 16256 .full (.cutX 28480 (.cutY 16320 .full (.cutX 28448 (.cutY 16352 .full .full) (.cutY 16352 .full .full))) (.cutY 16320 .full .full))) (.cutY 16256 .full .full))))))))))) .empty))) .empty))

theorem metadata125 : 0<135260814 ∧ 16<128 ∧ 64<128 ∧ 1<4 ∧
    6016/4160=1 ∧ 6016%4160=1856 ∧ ∀ i, (leaves125 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData125).mp
    (by decide +kernel)

theorem sourceChecked125_0 : ∀ i : Fin 40,
    (fun i => output125 i = raw125 (source125 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked125 : ∀ i : Fin 40, (fun i => output125 i = raw125 (source125 i)) i :=
  forallFin_of_zero_offset (fun i => output125 i = raw125 (source125 i)) sourceChecked125_0

theorem coverChecked125_0 : ∀ i : Fin 40,
    (fun i => (output125 (cover125 i)).ContainsBox (raw125 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked125 : ∀ i : Fin 40, (fun i => (output125 (cover125 i)).ContainsBox (raw125 i)) i :=
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

noncomputable def phaseMass125 : ℝ := singlePhaseMass (135260814/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw125 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass125_eq : phaseMass125 = (67630407/819200000000 : ℝ) := by
  unfold phaseMass125
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw125 output125 cover125 source125
    (gridTreeUnionCheck_sound 32768 raw125 output125 cover125 source125 tree125 checked125)
    _ (by norm_num) _, areaUnits125]
  norm_num

-- Frozen phase 5105, atom 5400, type 1, source (10,60).
def leavesData126 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves126 : Fin 13 → DyadicLeaf := leavesData126.get
def raw126 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 10 60 leaves126 i
def outputData126 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨2560,2624,15360,15424⟩) (.node (.single ⟨2560,2624,15424,15488⟩) (.single ⟨2624,2688,15360,15424⟩))) (.node (.single ⟨2624,2688,15424,15488⟩) (.node (.single ⟨2560,2688,15488,15616⟩) (.single ⟨2688,2752,15360,15424⟩)))) (.node (.node (.single ⟨2688,2752,15424,15488⟩) (.node (.single ⟨2752,2784,15360,15392⟩) (.single ⟨2752,2784,15392,15424⟩))) (.node (.node (.single ⟨2784,2816,15360,15392⟩) (.single ⟨2784,2816,15392,15424⟩)) (.node (.single ⟨2752,2816,15424,15488⟩) (.single ⟨2688,2816,15488,15616⟩))))) (.node (.node (.node (.single ⟨15360,15424,2560,2624⟩) (.node (.single ⟨15360,15424,2624,2688⟩) (.single ⟨15424,15488,2560,2624⟩))) (.node (.single ⟨15424,15488,2624,2688⟩) (.node (.single ⟨15360,15424,2688,2752⟩) (.single ⟨15360,15392,2752,2784⟩)))) (.node (.node (.single ⟨15360,15392,2784,2816⟩) (.node (.single ⟨15392,15424,2752,2784⟩) (.single ⟨15392,15424,2784,2816⟩))) (.node (.node (.single ⟨15424,15488,2688,2752⟩) (.single ⟨15424,15488,2752,2816⟩)) (.node (.single ⟨15488,15616,2560,2688⟩) (.single ⟨15488,15616,2688,2816⟩)))))) (.node (.node (.node (.node (.single ⟨17152,17280,29952,30080⟩) (.node (.single ⟨17152,17280,30080,30208⟩) (.single ⟨17280,17344,29952,30016⟩))) (.node (.single ⟨17280,17344,30016,30080⟩) (.node (.single ⟨17344,17376,29952,29984⟩) (.single ⟨17344,17376,29984,30016⟩)))) (.node (.node (.single ⟨17376,17408,29952,29984⟩) (.node (.single ⟨17376,17408,29984,30016⟩) (.single ⟨17344,17408,30016,30080⟩))) (.node (.node (.single ⟨17280,17344,30080,30144⟩) (.single ⟨17280,17344,30144,30208⟩)) (.node (.single ⟨17344,17408,30080,30144⟩) (.single ⟨17344,17408,30144,30208⟩))))) (.node (.node (.node (.single ⟨29952,30080,17152,17280⟩) (.node (.single ⟨29952,30016,17280,17344⟩) (.single ⟨29952,29984,17344,17376⟩))) (.node (.single ⟨29952,29984,17376,17408⟩) (.node (.single ⟨29984,30016,17344,17376⟩) (.single ⟨29984,30016,17376,17408⟩)))) (.node (.node (.single ⟨30016,30080,17280,17344⟩) (.node (.single ⟨30016,30080,17344,17408⟩) (.single ⟨30080,30208,17152,17280⟩))) (.node (.node (.single ⟨30080,30144,17280,17344⟩) (.single ⟨30080,30144,17344,17408⟩)) (.node (.single ⟨30144,30208,17280,17344⟩) (.single ⟨30144,30208,17344,17408⟩)))))))
def output126 : Fin 52 → GridBox := outputData126.get
def coverData126 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 24) (.single 47))) (.node (.single 27) (.node (.single 12) (.single 25)))) (.node (.node (.single 39) (.node (.single 26) (.single 5))) (.node (.node (.single 17) (.single 46)) (.node (.single 34) (.single 6))))) (.node (.node (.node (.single 22) (.node (.single 45) (.single 29))) (.node (.single 11) (.node (.single 23) (.single 40)))) (.node (.node (.single 28) (.node (.single 0) (.single 13))) (.node (.node (.single 51) (.single 38)) (.node (.single 1) (.single 15)))))) (.node (.node (.node (.node (.single 50) (.node (.single 36) (.single 2))) (.node (.single 14) (.node (.single 49) (.single 37)))) (.node (.node (.single 3) (.node (.single 16) (.single 48))) (.node (.node (.single 35) (.single 7)) (.node (.single 18) (.single 44))))) (.node (.node (.node (.single 33) (.node (.single 8) (.single 20))) (.node (.single 43) (.node (.single 31) (.single 9)))) (.node (.node (.single 19) (.node (.single 42) (.single 32))) (.node (.node (.single 10) (.single 21)) (.node (.single 41) (.single 30)))))))
def sourceData126 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover126 (i : Fin 52) : Fin 52 := ⟨coverData126.get i % 52, Nat.mod_lt _ (by decide)⟩
def source126 (i : Fin 52) : Fin 52 := ⟨sourceData126.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree126 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 .empty (.cutX 3072 (.cutY 15360 .empty (.cutX 2560 .empty (.cutY 15872 (.cutX 2816 (.cutY 15616 (.cutX 2688 (.cutY 15488 (.cutX 2624 (.cutY 15424 .full .full) (.cutY 15424 .full .full)) .full) (.cutY 15488 (.cutX 2752 (.cutY 15424 .full .full) (.cutY 15424 (.cutX 2784 (.cutY 15392 .full .full) (.cutY 15392 .full .full)) .full)) .full)) .empty) .empty) .empty))) .empty)))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 .empty (.cutX 15360 .empty (.cutY 3072 (.cutX 15872 (.cutY 2560 .empty (.cutX 15616 (.cutY 2816 (.cutX 15488 (.cutY 2688 (.cutX 15424 (.cutY 2624 .full .full) (.cutY 2624 .full .full)) (.cutX 15424 (.cutY 2752 .full (.cutX 15392 (.cutY 2784 .full .full) (.cutY 2784 .full .full))) (.cutY 2752 .full .full))) (.cutY 2688 .full .full)) .empty) .empty)) .empty) .empty)))) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 (.cutX 17408 (.cutY 29696 .empty (.cutX 16896 .empty (.cutY 30208 (.cutX 17152 .empty (.cutY 29952 .empty (.cutX 17280 (.cutY 30080 .full .full) (.cutY 30080 (.cutX 17344 (.cutY 30016 .full .full) (.cutY 30016 (.cutX 17376 (.cutY 29984 .full .full) (.cutY 29984 .full .full)) .full)) (.cutX 17344 (.cutY 30144 .full .full) (.cutY 30144 .full .full)))))) .empty))) .empty) .empty) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 (.cutX 29696 .empty (.cutY 17408 (.cutX 30208 (.cutY 16896 .empty (.cutX 29952 .empty (.cutY 17152 .empty (.cutX 30080 (.cutY 17280 .full (.cutX 30016 (.cutY 17344 .full (.cutX 29984 (.cutY 17376 .full .full) (.cutY 17376 .full .full))) (.cutY 17344 .full .full))) (.cutY 17280 .full (.cutX 30144 (.cutY 17344 .full .full) (.cutY 17344 .full .full))))))) .empty) .empty)) .empty) .empty) .empty)) .empty))))

theorem metadata126 : 0<163200014 ∧ 10<128 ∧ 60<128 ∧ 1<4 ∧
    5400/4160=1 ∧ 5400%4160=1240 ∧ ∀ i, (leaves126 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData126).mp
    (by decide +kernel)

theorem sourceChecked126_0 : ∀ i : Fin 52,
    (fun i => output126 i = raw126 (source126 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked126 : ∀ i : Fin 52, (fun i => output126 i = raw126 (source126 i)) i :=
  forallFin_of_zero_offset (fun i => output126 i = raw126 (source126 i)) sourceChecked126_0

theorem coverChecked126_0 : ∀ i : Fin 52,
    (fun i => (output126 (cover126 i)).ContainsBox (raw126 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked126 : ∀ i : Fin 52, (fun i => (output126 (cover126 i)).ContainsBox (raw126 i)) i :=
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

noncomputable def phaseMass126 : ℝ := singlePhaseMass (163200014/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw126 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass126_eq : phaseMass126 = (81600007/819200000000 : ℝ) := by
  unfold phaseMass126
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw126 output126 cover126 source126
    (gridTreeUnionCheck_sound 32768 raw126 output126 cover126 source126 tree126 checked126)
    _ (by norm_num) _, areaUnits126]
  norm_num

-- Frozen phase 5106, atom 7712, type 1, source (39,81).
def leavesData127 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves127 : Fin 13 → DyadicLeaf := leavesData127.get
def raw127 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 39 81 leaves127 i
def outputData127 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨9984,10048,20736,20800⟩) (.node (.single ⟨9984,10048,20800,20864⟩) (.single ⟨10048,10112,20736,20800⟩))) (.node (.single ⟨10048,10112,20800,20864⟩) (.node (.single ⟨9984,10112,20864,20992⟩) (.single ⟨10112,10176,20736,20800⟩)))) (.node (.node (.single ⟨10112,10176,20800,20864⟩) (.node (.single ⟨10176,10208,20736,20768⟩) (.single ⟨10176,10208,20768,20800⟩))) (.node (.node (.single ⟨10208,10240,20736,20768⟩) (.single ⟨10208,10240,20768,20800⟩)) (.node (.single ⟨10176,10240,20800,20864⟩) (.single ⟨10112,10240,20864,20992⟩))))) (.node (.node (.node (.single ⟨11776,11904,22528,22656⟩) (.node (.single ⟨11776,11904,22656,22784⟩) (.single ⟨11904,11968,22528,22592⟩))) (.node (.single ⟨11904,11968,22592,22656⟩) (.node (.single ⟨11968,12000,22528,22560⟩) (.single ⟨11968,12000,22560,22592⟩)))) (.node (.node (.single ⟨12000,12032,22528,22560⟩) (.node (.single ⟨12000,12032,22560,22592⟩) (.single ⟨11968,12032,22592,22656⟩))) (.node (.node (.single ⟨11904,11968,22656,22720⟩) (.single ⟨11904,11968,22720,22784⟩)) (.node (.single ⟨11968,12032,22656,22720⟩) (.single ⟨11968,12032,22720,22784⟩)))))) (.node (.node (.node (.node (.single ⟨20736,20800,9984,10048⟩) (.node (.single ⟨20736,20800,10048,10112⟩) (.single ⟨20800,20864,9984,10048⟩))) (.node (.single ⟨20800,20864,10048,10112⟩) (.node (.single ⟨20736,20800,10112,10176⟩) (.single ⟨20736,20768,10176,10208⟩)))) (.node (.node (.single ⟨20736,20768,10208,10240⟩) (.node (.single ⟨20768,20800,10176,10208⟩) (.single ⟨20768,20800,10208,10240⟩))) (.node (.node (.single ⟨20800,20864,10112,10176⟩) (.single ⟨20800,20864,10176,10240⟩)) (.node (.single ⟨20864,20992,9984,10112⟩) (.single ⟨20864,20992,10112,10240⟩))))) (.node (.node (.node (.single ⟨22528,22656,11776,11904⟩) (.node (.single ⟨22528,22592,11904,11968⟩) (.single ⟨22528,22560,11968,12000⟩))) (.node (.single ⟨22528,22560,12000,12032⟩) (.node (.single ⟨22560,22592,11968,12000⟩) (.single ⟨22560,22592,12000,12032⟩)))) (.node (.node (.single ⟨22592,22656,11904,11968⟩) (.node (.single ⟨22592,22656,11968,12032⟩) (.single ⟨22656,22784,11776,11904⟩))) (.node (.node (.single ⟨22656,22720,11904,11968⟩) (.single ⟨22656,22720,11968,12032⟩)) (.node (.single ⟨22720,22784,11904,11968⟩) (.single ⟨22720,22784,11968,12032⟩)))))))
def output127 : Fin 52 → GridBox := outputData127.get
def coverData127 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData127 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover127 (i : Fin 52) : Fin 52 := ⟨coverData127.get i % 52, Nat.mod_lt _ (by decide)⟩
def source127 (i : Fin 52) : Fin 52 := ⟨sourceData127.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree127 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 (.cutX 9216 .empty (.cutY 21504 (.cutX 9728 .empty (.cutY 20992 (.cutX 9984 .empty (.cutY 20736 .empty (.cutX 10112 (.cutY 20864 (.cutX 10048 (.cutY 20800 .full .full) (.cutY 20800 .full .full)) .full) (.cutY 20864 (.cutX 10176 (.cutY 20800 .full .full) (.cutY 20800 (.cutX 10208 (.cutY 20768 .full .full) (.cutY 20768 .full .full)) .full)) .full)))) .empty)) .empty)) .empty) (.cutY 22528 .empty (.cutX 11264 .empty (.cutY 23552 (.cutX 11776 .empty (.cutY 23040 (.cutX 12032 (.cutY 22784 (.cutX 11904 (.cutY 22656 .full .full) (.cutY 22656 (.cutX 11968 (.cutY 22592 .full .full) (.cutY 22592 (.cutX 12000 (.cutY 22560 .full .full) (.cutY 22560 .full .full)) .full)) (.cutX 11968 (.cutY 22720 .full .full) (.cutY 22720 .full .full)))) .empty) .empty) .empty)) .empty))))) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 (.cutY 10240 (.cutX 21504 (.cutY 9216 .empty (.cutX 20992 (.cutY 9728 .empty (.cutX 20736 .empty (.cutY 9984 .empty (.cutX 20864 (.cutY 10112 (.cutX 20800 (.cutY 10048 .full .full) (.cutY 10048 .full .full)) (.cutX 20800 (.cutY 10176 .full (.cutX 20768 (.cutY 10208 .full .full) (.cutY 10208 .full .full))) (.cutY 10176 .full .full))) (.cutY 10112 .full .full))))) .empty)) .empty) .empty) (.cutY 10240 .empty (.cutX 23552 (.cutY 11264 .empty (.cutX 23040 (.cutY 11776 .empty (.cutX 22784 (.cutY 12032 (.cutX 22656 (.cutY 11904 .full (.cutX 22592 (.cutY 11968 .full (.cutX 22560 (.cutY 12000 .full .full) (.cutY 12000 .full .full))) (.cutY 11968 .full .full))) (.cutY 11904 .full (.cutX 22720 (.cutY 11968 .full .full) (.cutY 11968 .full .full)))) .empty) .empty)) .empty)) .empty))) .empty))) .empty) .empty))

theorem metadata127 : 0<156512574 ∧ 39<128 ∧ 81<128 ∧ 1<4 ∧
    7712/4160=1 ∧ 7712%4160=3552 ∧ ∀ i, (leaves127 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData127).mp
    (by decide +kernel)

theorem sourceChecked127_0 : ∀ i : Fin 52,
    (fun i => output127 i = raw127 (source127 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked127 : ∀ i : Fin 52, (fun i => output127 i = raw127 (source127 i)) i :=
  forallFin_of_zero_offset (fun i => output127 i = raw127 (source127 i)) sourceChecked127_0

theorem coverChecked127_0 : ∀ i : Fin 52,
    (fun i => (output127 (cover127 i)).ContainsBox (raw127 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked127 : ∀ i : Fin 52, (fun i => (output127 (cover127 i)).ContainsBox (raw127 i)) i :=
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

noncomputable def phaseMass127 : ℝ := singlePhaseMass (156512574/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw127 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass127_eq : phaseMass127 = (78256287/819200000000 : ℝ) := by
  unfold phaseMass127
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw127 output127 cover127 source127
    (gridTreeUnionCheck_sound 32768 raw127 output127 cover127 source127 tree127 checked127)
    _ (by norm_num) _, areaUnits127]
  norm_num

noncomputable def batchActualMass : ℝ := [phaseMass0,phaseMass1,phaseMass2,phaseMass3,phaseMass4,phaseMass5,phaseMass6,phaseMass7,phaseMass8,phaseMass9,phaseMass10,phaseMass11,phaseMass12,phaseMass13,phaseMass14,phaseMass15,phaseMass16,phaseMass17,phaseMass18,phaseMass19,phaseMass20,phaseMass21,phaseMass22,phaseMass23,phaseMass24,phaseMass25,phaseMass26,phaseMass27,phaseMass28,phaseMass29,phaseMass30,phaseMass31,phaseMass32,phaseMass33,phaseMass34,phaseMass35,phaseMass36,phaseMass37,phaseMass38,phaseMass39,phaseMass40,phaseMass41,phaseMass42,phaseMass43,phaseMass44,phaseMass45,phaseMass46,phaseMass47,phaseMass48,phaseMass49,phaseMass50,phaseMass51,phaseMass52,phaseMass53,phaseMass54,phaseMass55,phaseMass56,phaseMass57,phaseMass58,phaseMass59,phaseMass60,phaseMass61,phaseMass62,phaseMass63,phaseMass64,phaseMass65,phaseMass66,phaseMass67,phaseMass68,phaseMass69,phaseMass70,phaseMass71,phaseMass72,phaseMass73,phaseMass74,phaseMass75,phaseMass76,phaseMass77,phaseMass78,phaseMass79,phaseMass80,phaseMass81,phaseMass82,phaseMass83,phaseMass84,phaseMass85,phaseMass86,phaseMass87,phaseMass88,phaseMass89,phaseMass90,phaseMass91,phaseMass92,phaseMass93,phaseMass94,phaseMass95,phaseMass96,phaseMass97,phaseMass98,phaseMass99,phaseMass100,phaseMass101,phaseMass102,phaseMass103,phaseMass104,phaseMass105,phaseMass106,phaseMass107,phaseMass108,phaseMass109,phaseMass110,phaseMass111,phaseMass112,phaseMass113,phaseMass114,phaseMass115,phaseMass116,phaseMass117,phaseMass118,phaseMass119,phaseMass120,phaseMass121,phaseMass122,phaseMass123,phaseMass124,phaseMass125,phaseMass126,phaseMass127].sum

theorem actual_batch_mass : batchActualMass = (18292659323/1638400000000 : ℝ) := by
  unfold batchActualMass
  rw [phaseMass0_eq,phaseMass1_eq,phaseMass2_eq,phaseMass3_eq,phaseMass4_eq,phaseMass5_eq,phaseMass6_eq,phaseMass7_eq,phaseMass8_eq,phaseMass9_eq,phaseMass10_eq,phaseMass11_eq,phaseMass12_eq,phaseMass13_eq,phaseMass14_eq,phaseMass15_eq,phaseMass16_eq,phaseMass17_eq,phaseMass18_eq,phaseMass19_eq,phaseMass20_eq,phaseMass21_eq,phaseMass22_eq,phaseMass23_eq,phaseMass24_eq,phaseMass25_eq,phaseMass26_eq,phaseMass27_eq,phaseMass28_eq,phaseMass29_eq,phaseMass30_eq,phaseMass31_eq,phaseMass32_eq,phaseMass33_eq,phaseMass34_eq,phaseMass35_eq,phaseMass36_eq,phaseMass37_eq,phaseMass38_eq,phaseMass39_eq,phaseMass40_eq,phaseMass41_eq,phaseMass42_eq,phaseMass43_eq,phaseMass44_eq,phaseMass45_eq,phaseMass46_eq,phaseMass47_eq,phaseMass48_eq,phaseMass49_eq,phaseMass50_eq,phaseMass51_eq,phaseMass52_eq,phaseMass53_eq,phaseMass54_eq,phaseMass55_eq,phaseMass56_eq,phaseMass57_eq,phaseMass58_eq,phaseMass59_eq,phaseMass60_eq,phaseMass61_eq,phaseMass62_eq,phaseMass63_eq,phaseMass64_eq,phaseMass65_eq,phaseMass66_eq,phaseMass67_eq,phaseMass68_eq,phaseMass69_eq,phaseMass70_eq,phaseMass71_eq,phaseMass72_eq,phaseMass73_eq,phaseMass74_eq,phaseMass75_eq,phaseMass76_eq,phaseMass77_eq,phaseMass78_eq,phaseMass79_eq,phaseMass80_eq,phaseMass81_eq,phaseMass82_eq,phaseMass83_eq,phaseMass84_eq,phaseMass85_eq,phaseMass86_eq,phaseMass87_eq,phaseMass88_eq,phaseMass89_eq,phaseMass90_eq,phaseMass91_eq,phaseMass92_eq,phaseMass93_eq,phaseMass94_eq,phaseMass95_eq,phaseMass96_eq,phaseMass97_eq,phaseMass98_eq,phaseMass99_eq,phaseMass100_eq,phaseMass101_eq,phaseMass102_eq,phaseMass103_eq,phaseMass104_eq,phaseMass105_eq,phaseMass106_eq,phaseMass107_eq,phaseMass108_eq,phaseMass109_eq,phaseMass110_eq,phaseMass111_eq,phaseMass112_eq,phaseMass113_eq,phaseMass114_eq,phaseMass115_eq,phaseMass116_eq,phaseMass117_eq,phaseMass118_eq,phaseMass119_eq,phaseMass120_eq,phaseMass121_eq,phaseMass122_eq,phaseMass123_eq,phaseMass124_eq,phaseMass125_eq,phaseMass126_eq,phaseMass127_eq]
  norm_num

end NoThreeLine.ScheduleUnionBatch04979
#print axioms NoThreeLine.ScheduleUnionBatch04979.actual_batch_mass
