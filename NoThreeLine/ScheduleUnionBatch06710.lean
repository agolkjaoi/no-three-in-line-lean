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
namespace NoThreeLine.ScheduleUnionBatch06710

-- Frozen phase 6710, atom 451, type 0, source (3,76).
def leavesData0 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩)))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩)))))
def leaves0 : Fin 10 → DyadicLeaf := leavesData0.get
def raw0 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 3 76 leaves0 i
def outputData0 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨768,832,19456,19520⟩) (.single ⟨768,832,19520,19584⟩)) (.node (.single ⟨832,896,19456,19520⟩) (.node (.single ⟨832,896,19520,19584⟩) (.single ⟨768,896,19584,19712⟩)))) (.node (.node (.single ⟨896,960,19456,19520⟩) (.single ⟨896,960,19520,19584⟩)) (.node (.single ⟨960,1024,19456,19520⟩) (.node (.single ⟨960,1024,19520,19584⟩) (.single ⟨896,1024,19584,19712⟩))))) (.node (.node (.node (.single ⟨13056,13184,31744,31872⟩) (.single ⟨13056,13184,31872,32000⟩)) (.node (.single ⟨13184,13248,31744,31808⟩) (.node (.single ⟨13184,13248,31808,31872⟩) (.single ⟨13248,13312,31744,31808⟩)))) (.node (.node (.single ⟨13248,13312,31808,31872⟩) (.single ⟨13184,13248,31872,31936⟩)) (.node (.single ⟨13184,13248,31936,32000⟩) (.node (.single ⟨13248,13312,31872,31936⟩) (.single ⟨13248,13312,31936,32000⟩)))))) (.node (.node (.node (.node (.single ⟨19456,19520,768,832⟩) (.single ⟨19456,19520,832,896⟩)) (.node (.single ⟨19520,19584,768,832⟩) (.node (.single ⟨19520,19584,832,896⟩) (.single ⟨19456,19520,896,960⟩)))) (.node (.node (.single ⟨19456,19520,960,1024⟩) (.single ⟨19520,19584,896,960⟩)) (.node (.single ⟨19520,19584,960,1024⟩) (.node (.single ⟨19584,19712,768,896⟩) (.single ⟨19584,19712,896,1024⟩))))) (.node (.node (.node (.single ⟨31744,31872,13056,13184⟩) (.single ⟨31744,31808,13184,13248⟩)) (.node (.single ⟨31744,31808,13248,13312⟩) (.node (.single ⟨31808,31872,13184,13248⟩) (.single ⟨31808,31872,13248,13312⟩)))) (.node (.node (.single ⟨31872,32000,13056,13184⟩) (.single ⟨31872,31936,13184,13248⟩)) (.node (.single ⟨31872,31936,13248,13312⟩) (.node (.single ⟨31936,32000,13184,13248⟩) (.single ⟨31936,32000,13248,13312⟩)))))))
def output0 : Fin 40 → GridBox := outputData0.get
def coverData0 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 0) (.single 20))))) (.node (.node (.node (.single 39) (.single 19)) (.node (.single 1) (.node (.single 22) (.single 38)))) (.node (.node (.single 17) (.single 2)) (.node (.single 21) (.node (.single 37) (.single 18)))))) (.node (.node (.node (.node (.single 3) (.single 23)) (.node (.single 36) (.node (.single 16) (.single 5)))) (.node (.node (.single 24) (.single 34)) (.node (.single 15) (.node (.single 6) (.single 26))))) (.node (.node (.node (.single 33) (.single 13)) (.node (.single 7) (.node (.single 25) (.single 32)))) (.node (.node (.single 14) (.single 8)) (.node (.single 27) (.node (.single 31) (.single 12)))))))
def sourceData0 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 0)))) (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 39) (.node (.single 31) (.single 35)))) (.node (.node (.single 27) (.single 23)) (.node (.single 15) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.node (.single 21) (.single 25)))) (.node (.node (.single 33) (.single 29)) (.node (.single 37) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))) (.node (.node (.single 2) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))))))
def cover0 (i : Fin 40) : Fin 40 := ⟨coverData0.get i % 40, Nat.mod_lt _ (by decide)⟩
def source0 (i : Fin 40) : Fin 40 := ⟨sourceData0.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree0 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 (.cutY 19456 .empty (.cutX 512 .empty (.cutY 19968 (.cutX 768 .empty (.cutY 19712 (.cutX 896 (.cutY 19584 (.cutX 832 (.cutY 19520 .full .full) (.cutY 19520 .full .full)) .full) (.cutY 19584 (.cutX 960 (.cutY 19520 .full .full) (.cutY 19520 .full .full)) .full)) .empty)) .empty))) .empty)) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 (.cutY 31744 .empty (.cutX 12800 .empty (.cutY 32256 (.cutX 13056 .empty (.cutY 32000 (.cutX 13184 (.cutY 31872 .full .full) (.cutY 31872 (.cutX 13248 (.cutY 31808 .full .full) (.cutY 31808 .full .full)) (.cutX 13248 (.cutY 31936 .full .full) (.cutY 31936 .full .full)))) .empty)) .empty))) .empty)) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 .empty (.cutY 1024 (.cutX 19968 (.cutY 512 .empty (.cutX 19712 (.cutY 768 .empty (.cutX 19584 (.cutY 896 (.cutX 19520 (.cutY 832 .full .full) (.cutY 832 .full .full)) (.cutX 19520 (.cutY 960 .full .full) (.cutY 960 .full .full))) (.cutY 896 .full .full))) .empty)) .empty) .empty)) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 .empty (.cutY 13312 (.cutX 32256 (.cutY 12800 .empty (.cutX 32000 (.cutY 13056 .empty (.cutX 31872 (.cutY 13184 .full (.cutX 31808 (.cutY 13248 .full .full) (.cutY 13248 .full .full))) (.cutY 13184 .full (.cutX 31936 (.cutY 13248 .full .full) (.cutY 13248 .full .full))))) .empty)) .empty) .empty)) .empty)))))) .empty))

theorem metadata0 : 0<34183877 ∧ 3<128 ∧ 76<128 ∧ 0<4 ∧
    451/4160=0 ∧ 451%4160=451 ∧ ∀ i, (leaves0 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData0).mp
    (by decide +kernel)

theorem sourceChecked0_0 : ∀ i : Fin 40,
    (fun i => output0 i = raw0 (source0 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked0 : ∀ i : Fin 40, (fun i => output0 i = raw0 (source0 i)) i :=
  forallFin_of_zero_offset (fun i => output0 i = raw0 (source0 i)) sourceChecked0_0

theorem coverChecked0_0 : ∀ i : Fin 40,
    (fun i => (output0 (cover0 i)).ContainsBox (raw0 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked0 : ∀ i : Fin 40, (fun i => (output0 (cover0 i)).ContainsBox (raw0 i)) i :=
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

noncomputable def phaseMass0 : ℝ := singlePhaseMass (34183877/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw0 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass0_eq : phaseMass0 = (34183877/1638400000000 : ℝ) := by
  unfold phaseMass0
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw0 output0 cover0 source0
    (gridTreeUnionCheck_sound 32768 raw0 output0 cover0 source0 tree0 checked0)
    _ (by norm_num) _, areaUnits0]
  norm_num

-- Frozen phase 6711, atom 5084, type 1, source (7,77).
def leavesData1 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves1 : Fin 7 → DyadicLeaf := leavesData1.get
def raw1 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 7 77 leaves1 i
def outputData1 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨1792,1920,19712,19840⟩) (.node (.single ⟨1792,1920,19840,19968⟩) (.single ⟨1920,1984,19712,19776⟩))) (.node (.node (.single ⟨1920,1984,19776,19840⟩) (.single ⟨1984,2048,19712,19776⟩)) (.node (.single ⟨1984,2048,19776,19840⟩) (.single ⟨1920,2048,19840,19968⟩)))) (.node (.node (.single ⟨12800,12928,30720,30848⟩) (.node (.single ⟨12800,12928,30848,30976⟩) (.single ⟨12928,12992,30720,30784⟩))) (.node (.node (.single ⟨12928,12992,30784,30848⟩) (.single ⟨12992,13056,30720,30784⟩)) (.node (.single ⟨12992,13056,30784,30848⟩) (.single ⟨12928,13056,30848,30976⟩))))) (.node (.node (.node (.single ⟨19712,19840,1792,1920⟩) (.node (.single ⟨19712,19776,1920,1984⟩) (.single ⟨19712,19776,1984,2048⟩))) (.node (.node (.single ⟨19776,19840,1920,1984⟩) (.single ⟨19776,19840,1984,2048⟩)) (.node (.single ⟨19840,19968,1792,1920⟩) (.single ⟨19840,19968,1920,2048⟩)))) (.node (.node (.single ⟨30720,30848,12800,12928⟩) (.node (.single ⟨30720,30784,12928,12992⟩) (.single ⟨30720,30784,12992,13056⟩))) (.node (.node (.single ⟨30784,30848,12928,12992⟩) (.single ⟨30784,30848,12992,13056⟩)) (.node (.single ⟨30848,30976,12800,12928⟩) (.single ⟨30848,30976,12928,13056⟩))))))
def output1 : Fin 28 → GridBox := outputData1.get
def coverData1 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData1 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover1 (i : Fin 28) : Fin 28 := ⟨coverData1.get i % 28, Nat.mod_lt _ (by decide)⟩
def source1 (i : Fin 28) : Fin 28 := ⟨sourceData1.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree1 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 .empty (.cutY 19456 .empty (.cutX 1536 .empty (.cutY 19968 (.cutX 1792 .empty (.cutY 19712 .empty (.cutX 1920 (.cutY 19840 .full .full) (.cutY 19840 (.cutX 1984 (.cutY 19776 .full .full) (.cutY 19776 .full .full)) .full)))) .empty))))) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 (.cutY 31744 (.cutX 12800 .empty (.cutY 31232 (.cutX 13056 (.cutY 30976 (.cutX 12928 (.cutY 30848 .full .full) (.cutY 30848 (.cutX 12992 (.cutY 30784 .full .full) (.cutY 30784 .full .full)) .full)) .empty) .empty) .empty)) .empty) .empty)) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 .empty (.cutY 1024 .empty (.cutX 19968 (.cutY 1536 .empty (.cutX 19712 .empty (.cutY 1792 .empty (.cutX 19840 (.cutY 1920 .full (.cutX 19776 (.cutY 1984 .full .full) (.cutY 1984 .full .full))) (.cutY 1920 .full .full))))) .empty))) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 (.cutY 13312 (.cutX 31232 (.cutY 12800 .empty (.cutX 30976 (.cutY 13056 (.cutX 30848 (.cutY 12928 .full (.cutX 30784 (.cutY 12992 .full .full) (.cutY 12992 .full .full))) (.cutY 12928 .full .full)) .empty) .empty)) .empty) .empty) .empty) .empty)))))) .empty))

theorem metadata1 : 0<137362203 ∧ 7<128 ∧ 77<128 ∧ 1<4 ∧
    5084/4160=1 ∧ 5084%4160=924 ∧ ∀ i, (leaves1 i).Valid 8 := by
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

noncomputable def phaseMass1 : ℝ := singlePhaseMass (137362203/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw1 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass1_eq : phaseMass1 = (137362203/1638400000000 : ℝ) := by
  unfold phaseMass1
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw1 output1 cover1 source1
    (gridTreeUnionCheck_sound 32768 raw1 output1 cover1 source1 tree1 checked1)
    _ (by norm_num) _, areaUnits1]
  norm_num

-- Frozen phase 6712, atom 4851, type 1, source (5,76).
def leavesData2 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves2 : Fin 7 → DyadicLeaf := leavesData2.get
def raw2 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 5 76 leaves2 i
def outputData2 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨1280,1408,19456,19584⟩) (.node (.single ⟨1280,1408,19584,19712⟩) (.single ⟨1408,1472,19456,19520⟩))) (.node (.node (.single ⟨1408,1472,19520,19584⟩) (.single ⟨1472,1536,19456,19520⟩)) (.node (.single ⟨1472,1536,19520,19584⟩) (.single ⟨1408,1536,19584,19712⟩)))) (.node (.node (.single ⟨13056,13184,31232,31360⟩) (.node (.single ⟨13056,13184,31360,31488⟩) (.single ⟨13184,13248,31232,31296⟩))) (.node (.node (.single ⟨13184,13248,31296,31360⟩) (.single ⟨13248,13312,31232,31296⟩)) (.node (.single ⟨13248,13312,31296,31360⟩) (.single ⟨13184,13312,31360,31488⟩))))) (.node (.node (.node (.single ⟨19456,19584,1280,1408⟩) (.node (.single ⟨19456,19520,1408,1472⟩) (.single ⟨19456,19520,1472,1536⟩))) (.node (.node (.single ⟨19520,19584,1408,1472⟩) (.single ⟨19520,19584,1472,1536⟩)) (.node (.single ⟨19584,19712,1280,1408⟩) (.single ⟨19584,19712,1408,1536⟩)))) (.node (.node (.single ⟨31232,31360,13056,13184⟩) (.node (.single ⟨31232,31296,13184,13248⟩) (.single ⟨31232,31296,13248,13312⟩))) (.node (.node (.single ⟨31296,31360,13184,13248⟩) (.single ⟨31296,31360,13248,13312⟩)) (.node (.single ⟨31360,31488,13056,13184⟩) (.single ⟨31360,31488,13184,13312⟩))))))
def output2 : Fin 28 → GridBox := outputData2.get
def coverData2 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData2 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover2 (i : Fin 28) : Fin 28 := ⟨coverData2.get i % 28, Nat.mod_lt _ (by decide)⟩
def source2 (i : Fin 28) : Fin 28 := ⟨sourceData2.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree2 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 .empty (.cutY 19456 .empty (.cutX 1536 (.cutY 19968 (.cutX 1280 .empty (.cutY 19712 (.cutX 1408 (.cutY 19584 .full .full) (.cutY 19584 (.cutX 1472 (.cutY 19520 .full .full) (.cutY 19520 .full .full)) .full)) .empty)) .empty) .empty)))) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 (.cutY 31744 (.cutX 12800 .empty (.cutY 31232 .empty (.cutX 13056 .empty (.cutY 31488 (.cutX 13184 (.cutY 31360 .full .full) (.cutY 31360 (.cutX 13248 (.cutY 31296 .full .full) (.cutY 31296 .full .full)) .full)) .empty)))) .empty) .empty)) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 .empty (.cutY 1024 .empty (.cutX 19968 (.cutY 1536 (.cutX 19712 (.cutY 1280 .empty (.cutX 19584 (.cutY 1408 .full (.cutX 19520 (.cutY 1472 .full .full) (.cutY 1472 .full .full))) (.cutY 1408 .full .full))) .empty) .empty) .empty))) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 (.cutY 13312 (.cutX 31232 .empty (.cutY 12800 .empty (.cutX 31488 (.cutY 13056 .empty (.cutX 31360 (.cutY 13184 .full (.cutX 31296 (.cutY 13248 .full .full) (.cutY 13248 .full .full))) (.cutY 13184 .full .full))) .empty))) .empty) .empty) .empty)))))) .empty))

theorem metadata2 : 0<137362203 ∧ 5<128 ∧ 76<128 ∧ 1<4 ∧
    4851/4160=1 ∧ 4851%4160=691 ∧ ∀ i, (leaves2 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData2).mp
    (by decide +kernel)

theorem sourceChecked2_0 : ∀ i : Fin 28,
    (fun i => output2 i = raw2 (source2 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked2 : ∀ i : Fin 28, (fun i => output2 i = raw2 (source2 i)) i :=
  forallFin_of_zero_offset (fun i => output2 i = raw2 (source2 i)) sourceChecked2_0

theorem coverChecked2_0 : ∀ i : Fin 28,
    (fun i => (output2 (cover2 i)).ContainsBox (raw2 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked2 : ∀ i : Fin 28, (fun i => (output2 (cover2 i)).ContainsBox (raw2 i)) i :=
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

noncomputable def phaseMass2 : ℝ := singlePhaseMass (137362203/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw2 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass2_eq : phaseMass2 = (137362203/1638400000000 : ℝ) := by
  unfold phaseMass2
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw2 output2 cover2 source2
    (gridTreeUnionCheck_sound 32768 raw2 output2 cover2 source2 tree2 checked2)
    _ (by norm_num) _, areaUnits2]
  norm_num

-- Frozen phase 6713, atom 2076, type 0, source (18,96).
def leavesData3 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,0⟩))) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves3 : Fin 13 → DyadicLeaf := leavesData3.get
def raw3 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 18 96 leaves3 i
def outputData3 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨4608,4672,24576,24640⟩) (.node (.single ⟨4608,4672,24640,24704⟩) (.single ⟨4672,4736,24576,24640⟩))) (.node (.single ⟨4672,4736,24640,24704⟩) (.node (.single ⟨4608,4736,24704,24832⟩) (.single ⟨4736,4800,24576,24640⟩)))) (.node (.node (.single ⟨4736,4800,24640,24704⟩) (.node (.single ⟨4800,4832,24576,24608⟩) (.single ⟨4800,4832,24608,24640⟩))) (.node (.node (.single ⟨4832,4864,24576,24608⟩) (.single ⟨4832,4864,24608,24640⟩)) (.node (.single ⟨4800,4864,24640,24704⟩) (.single ⟨4736,4864,24704,24832⟩))))) (.node (.node (.node (.single ⟨7936,8064,27904,28032⟩) (.node (.single ⟨7936,8064,28032,28160⟩) (.single ⟨8064,8128,27904,27968⟩))) (.node (.single ⟨8064,8128,27968,28032⟩) (.node (.single ⟨8128,8160,27904,27936⟩) (.single ⟨8128,8160,27936,27968⟩)))) (.node (.node (.single ⟨8160,8192,27904,27936⟩) (.node (.single ⟨8160,8192,27936,27968⟩) (.single ⟨8128,8192,27968,28032⟩))) (.node (.node (.single ⟨8064,8128,28032,28096⟩) (.single ⟨8064,8128,28096,28160⟩)) (.node (.single ⟨8128,8192,28032,28096⟩) (.single ⟨8128,8192,28096,28160⟩)))))) (.node (.node (.node (.node (.single ⟨24576,24640,4608,4672⟩) (.node (.single ⟨24576,24640,4672,4736⟩) (.single ⟨24640,24704,4608,4672⟩))) (.node (.single ⟨24640,24704,4672,4736⟩) (.node (.single ⟨24576,24640,4736,4800⟩) (.single ⟨24576,24608,4800,4832⟩)))) (.node (.node (.single ⟨24576,24608,4832,4864⟩) (.node (.single ⟨24608,24640,4800,4832⟩) (.single ⟨24608,24640,4832,4864⟩))) (.node (.node (.single ⟨24640,24704,4736,4800⟩) (.single ⟨24640,24704,4800,4864⟩)) (.node (.single ⟨24704,24832,4608,4736⟩) (.single ⟨24704,24832,4736,4864⟩))))) (.node (.node (.node (.single ⟨27904,28032,7936,8064⟩) (.node (.single ⟨27904,27968,8064,8128⟩) (.single ⟨27904,27936,8128,8160⟩))) (.node (.single ⟨27904,27936,8160,8192⟩) (.node (.single ⟨27936,27968,8128,8160⟩) (.single ⟨27936,27968,8160,8192⟩)))) (.node (.node (.single ⟨27968,28032,8064,8128⟩) (.node (.single ⟨27968,28032,8128,8192⟩) (.single ⟨28032,28160,7936,8064⟩))) (.node (.node (.single ⟨28032,28096,8064,8128⟩) (.single ⟨28032,28096,8128,8192⟩)) (.node (.single ⟨28096,28160,8064,8128⟩) (.single ⟨28096,28160,8128,8192⟩)))))))
def output3 : Fin 52 → GridBox := outputData3.get
def coverData3 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 0))) (.node (.node (.single 26) (.single 51)) (.node (.single 25) (.single 1))))) (.node (.node (.node (.single 28) (.node (.single 50) (.single 23))) (.node (.single 2) (.node (.single 27) (.single 49)))) (.node (.node (.single 24) (.node (.single 3) (.single 29))) (.node (.node (.single 48) (.single 22)) (.node (.single 5) (.single 30)))))) (.node (.node (.node (.node (.single 46) (.node (.single 21) (.single 6))) (.node (.single 35) (.node (.single 45) (.single 16)))) (.node (.node (.single 11) (.node (.single 36) (.single 40))) (.node (.node (.single 15) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData3 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.single 20) (.node (.single 0) (.single 24)))) (.node (.node (.single 28) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 35))) (.node (.single 31) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.node (.single 17) (.single 13))) (.node (.single 21) (.node (.single 25) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 34) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 30) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover3 (i : Fin 52) : Fin 52 := ⟨coverData3.get i % 52, Nat.mod_lt _ (by decide)⟩
def source3 (i : Fin 52) : Fin 52 := ⟨sourceData3.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree3 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 (.cutY 26624 (.cutX 5120 (.cutY 25600 (.cutX 4608 .empty (.cutY 25088 (.cutX 4864 (.cutY 24832 (.cutX 4736 (.cutY 24704 (.cutX 4672 (.cutY 24640 .full .full) (.cutY 24640 .full .full)) .full) (.cutY 24704 (.cutX 4800 (.cutY 24640 .full .full) (.cutY 24640 (.cutX 4832 (.cutY 24608 .full .full) (.cutY 24608 .full .full)) .full)) .full)) .empty) .empty) .empty)) .empty) .empty) .empty) (.cutY 26624 .empty (.cutX 7168 .empty (.cutY 27648 .empty (.cutX 7680 .empty (.cutY 28160 (.cutX 7936 .empty (.cutY 27904 .empty (.cutX 8064 (.cutY 28032 .full .full) (.cutY 28032 (.cutX 8128 (.cutY 27968 .full .full) (.cutY 27968 (.cutX 8160 (.cutY 27936 .full .full) (.cutY 27936 .full .full)) .full)) (.cutX 8128 (.cutY 28096 .full .full) (.cutY 28096 .full .full)))))) .empty)))))) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 (.cutX 25600 (.cutY 5120 (.cutX 25088 (.cutY 4608 .empty (.cutX 24832 (.cutY 4864 (.cutX 24704 (.cutY 4736 (.cutX 24640 (.cutY 4672 .full .full) (.cutY 4672 .full .full)) (.cutX 24640 (.cutY 4800 .full (.cutX 24608 (.cutY 4832 .full .full) (.cutY 4832 .full .full))) (.cutY 4800 .full .full))) (.cutY 4736 .full .full)) .empty) .empty)) .empty) .empty) .empty) .empty) (.cutY 6144 .empty (.cutX 27648 .empty (.cutY 7168 .empty (.cutX 28160 (.cutY 7680 .empty (.cutX 27904 .empty (.cutY 7936 .empty (.cutX 28032 (.cutY 8064 .full (.cutX 27968 (.cutY 8128 .full (.cutX 27936 (.cutY 8160 .full .full) (.cutY 8160 .full .full))) (.cutY 8128 .full .full))) (.cutY 8064 .full (.cutX 28096 (.cutY 8128 .full .full) (.cutY 8128 .full .full))))))) .empty)))))) .empty) .empty)) .empty))

theorem metadata3 : 0<121837468 ∧ 18<128 ∧ 96<128 ∧ 0<4 ∧
    2076/4160=0 ∧ 2076%4160=2076 ∧ ∀ i, (leaves3 i).Valid 8 := by
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

noncomputable def phaseMass3 : ℝ := singlePhaseMass (121837468/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw3 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass3_eq : phaseMass3 = (30459367/409600000000 : ℝ) := by
  unfold phaseMass3
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw3 output3 cover3 source3
    (gridTreeUnionCheck_sound 32768 raw3 output3 cover3 source3 tree3 checked3)
    _ (by norm_num) _, areaUnits3]
  norm_num

-- Frozen phase 6714, atom 926, type 0, source (7,79).
def leavesData4 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves4 : Fin 7 → DyadicLeaf := leavesData4.get
def raw4 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 7 79 leaves4 i
def outputData4 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨1792,1920,20224,20352⟩) (.node (.single ⟨1792,1920,20352,20480⟩) (.single ⟨1920,1984,20224,20288⟩))) (.node (.node (.single ⟨1920,1984,20288,20352⟩) (.single ⟨1984,2048,20224,20288⟩)) (.node (.single ⟨1984,2048,20288,20352⟩) (.single ⟨1920,2048,20352,20480⟩)))) (.node (.node (.single ⟨12288,12416,30720,30848⟩) (.node (.single ⟨12288,12416,30848,30976⟩) (.single ⟨12416,12480,30720,30784⟩))) (.node (.node (.single ⟨12416,12480,30784,30848⟩) (.single ⟨12480,12544,30720,30784⟩)) (.node (.single ⟨12480,12544,30784,30848⟩) (.single ⟨12416,12544,30848,30976⟩))))) (.node (.node (.node (.single ⟨20224,20352,1792,1920⟩) (.node (.single ⟨20224,20288,1920,1984⟩) (.single ⟨20224,20288,1984,2048⟩))) (.node (.node (.single ⟨20288,20352,1920,1984⟩) (.single ⟨20288,20352,1984,2048⟩)) (.node (.single ⟨20352,20480,1792,1920⟩) (.single ⟨20352,20480,1920,2048⟩)))) (.node (.node (.single ⟨30720,30848,12288,12416⟩) (.node (.single ⟨30720,30784,12416,12480⟩) (.single ⟨30720,30784,12480,12544⟩))) (.node (.node (.single ⟨30784,30848,12416,12480⟩) (.single ⟨30784,30848,12480,12544⟩)) (.node (.single ⟨30848,30976,12288,12416⟩) (.single ⟨30848,30976,12416,12544⟩))))))
def output4 : Fin 28 → GridBox := outputData4.get
def coverData4 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData4 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover4 (i : Fin 28) : Fin 28 := ⟨coverData4.get i % 28, Nat.mod_lt _ (by decide)⟩
def source4 (i : Fin 28) : Fin 28 := ⟨sourceData4.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree4 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 .empty (.cutY 19456 .empty (.cutX 1536 .empty (.cutY 19968 .empty (.cutX 1792 .empty (.cutY 20224 .empty (.cutX 1920 (.cutY 20352 .full .full) (.cutY 20352 (.cutX 1984 (.cutY 20288 .full .full) (.cutY 20288 .full .full)) .full))))))))) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 (.cutY 31744 (.cutX 12800 (.cutY 31232 (.cutX 12544 (.cutY 30976 (.cutX 12416 (.cutY 30848 .full .full) (.cutY 30848 (.cutX 12480 (.cutY 30784 .full .full) (.cutY 30784 .full .full)) .full)) .empty) .empty) .empty) .empty) .empty) .empty)) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 .empty (.cutY 1024 .empty (.cutX 19968 .empty (.cutY 1536 .empty (.cutX 20224 .empty (.cutY 1792 .empty (.cutX 20352 (.cutY 1920 .full (.cutX 20288 (.cutY 1984 .full .full) (.cutY 1984 .full .full))) (.cutY 1920 .full .full)))))))) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 (.cutY 13312 (.cutX 31232 (.cutY 12800 (.cutX 30976 (.cutY 12544 (.cutX 30848 (.cutY 12416 .full (.cutX 30784 (.cutY 12480 .full .full) (.cutY 12480 .full .full))) (.cutY 12416 .full .full)) .empty) .empty) .empty) .empty) .empty) .empty) .empty)))))) .empty))

theorem metadata4 : 0<34183877 ∧ 7<128 ∧ 79<128 ∧ 0<4 ∧
    926/4160=0 ∧ 926%4160=926 ∧ ∀ i, (leaves4 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData4).mp
    (by decide +kernel)

theorem sourceChecked4_0 : ∀ i : Fin 28,
    (fun i => output4 i = raw4 (source4 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked4 : ∀ i : Fin 28, (fun i => output4 i = raw4 (source4 i)) i :=
  forallFin_of_zero_offset (fun i => output4 i = raw4 (source4 i)) sourceChecked4_0

theorem coverChecked4_0 : ∀ i : Fin 28,
    (fun i => (output4 (cover4 i)).ContainsBox (raw4 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked4 : ∀ i : Fin 28, (fun i => (output4 (cover4 i)).ContainsBox (raw4 i)) i :=
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

noncomputable def phaseMass4 : ℝ := singlePhaseMass (34183877/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw4 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass4_eq : phaseMass4 = (34183877/1638400000000 : ℝ) := by
  unfold phaseMass4
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw4 output4 cover4 source4
    (gridTreeUnionCheck_sound 32768 raw4 output4 cover4 source4 tree4 checked4)
    _ (by norm_num) _, areaUnits4]
  norm_num

-- Frozen phase 6715, atom 1262, type 0, source (10,82).
def leavesData5 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves5 : Fin 7 → DyadicLeaf := leavesData5.get
def raw5 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 10 82 leaves5 i
def outputData5 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨2560,2688,20992,21120⟩) (.node (.single ⟨2560,2688,21120,21248⟩) (.single ⟨2688,2752,20992,21056⟩))) (.node (.node (.single ⟨2688,2752,21056,21120⟩) (.single ⟨2752,2816,20992,21056⟩)) (.node (.single ⟨2752,2816,21056,21120⟩) (.single ⟨2688,2816,21120,21248⟩)))) (.node (.node (.single ⟨11520,11648,29952,30080⟩) (.node (.single ⟨11520,11648,30080,30208⟩) (.single ⟨11648,11712,29952,30016⟩))) (.node (.node (.single ⟨11648,11712,30016,30080⟩) (.single ⟨11712,11776,29952,30016⟩)) (.node (.single ⟨11712,11776,30016,30080⟩) (.single ⟨11648,11776,30080,30208⟩))))) (.node (.node (.node (.single ⟨20992,21120,2560,2688⟩) (.node (.single ⟨20992,21056,2688,2752⟩) (.single ⟨20992,21056,2752,2816⟩))) (.node (.node (.single ⟨21056,21120,2688,2752⟩) (.single ⟨21056,21120,2752,2816⟩)) (.node (.single ⟨21120,21248,2560,2688⟩) (.single ⟨21120,21248,2688,2816⟩)))) (.node (.node (.single ⟨29952,30080,11520,11648⟩) (.node (.single ⟨29952,30016,11648,11712⟩) (.single ⟨29952,30016,11712,11776⟩))) (.node (.node (.single ⟨30016,30080,11648,11712⟩) (.single ⟨30016,30080,11712,11776⟩)) (.node (.single ⟨30080,30208,11520,11648⟩) (.single ⟨30080,30208,11648,11776⟩))))))
def output5 : Fin 28 → GridBox := outputData5.get
def coverData5 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData5 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover5 (i : Fin 28) : Fin 28 := ⟨coverData5.get i % 28, Nat.mod_lt _ (by decide)⟩
def source5 (i : Fin 28) : Fin 28 := ⟨sourceData5.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree5 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 (.cutY 21504 (.cutX 2560 .empty (.cutY 20992 .empty (.cutX 2816 (.cutY 21248 (.cutX 2688 (.cutY 21120 .full .full) (.cutY 21120 (.cutX 2752 (.cutY 21056 .full .full) (.cutY 21056 .full .full)) .full)) .empty) .empty))) .empty) .empty) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 .empty (.cutY 29696 .empty (.cutX 11776 (.cutY 30208 (.cutX 11520 .empty (.cutY 29952 .empty (.cutX 11648 (.cutY 30080 .full .full) (.cutY 30080 (.cutX 11712 (.cutY 30016 .full .full) (.cutY 30016 .full .full)) .full)))) .empty) .empty))) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 (.cutY 3072 (.cutX 20992 .empty (.cutY 2560 .empty (.cutX 21248 (.cutY 2816 (.cutX 21120 (.cutY 2688 .full (.cutX 21056 (.cutY 2752 .full .full) (.cutY 2752 .full .full))) (.cutY 2688 .full .full)) .empty) .empty))) .empty) .empty)) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 .empty (.cutY 11264 .empty (.cutX 30208 (.cutY 11776 (.cutX 29952 .empty (.cutY 11520 .empty (.cutX 30080 (.cutY 11648 .full (.cutX 30016 (.cutY 11712 .full .full) (.cutY 11712 .full .full))) (.cutY 11648 .full .full)))) .empty) .empty)))) .empty) .empty)))) .empty))

theorem metadata5 : 0<72090291 ∧ 10<128 ∧ 82<128 ∧ 0<4 ∧
    1262/4160=0 ∧ 1262%4160=1262 ∧ ∀ i, (leaves5 i).Valid 8 := by
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

noncomputable def phaseMass5 : ℝ := singlePhaseMass (72090291/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw5 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass5_eq : phaseMass5 = (72090291/1638400000000 : ℝ) := by
  unfold phaseMass5
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw5 output5 cover5 source5
    (gridTreeUnionCheck_sound 32768 raw5 output5 cover5 source5 tree5 checked5)
    _ (by norm_num) _, areaUnits5]
  norm_num

-- Frozen phase 6716, atom 1152, type 0, source (9,81).
def leavesData6 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves6 : Fin 7 → DyadicLeaf := leavesData6.get
def raw6 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 9 81 leaves6 i
def outputData6 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨2304,2432,20736,20864⟩) (.node (.single ⟨2304,2432,20864,20992⟩) (.single ⟨2432,2496,20736,20800⟩))) (.node (.node (.single ⟨2432,2496,20800,20864⟩) (.single ⟨2496,2560,20736,20800⟩)) (.node (.single ⟨2496,2560,20800,20864⟩) (.single ⟨2432,2560,20864,20992⟩)))) (.node (.node (.single ⟨11776,11904,30208,30336⟩) (.node (.single ⟨11776,11904,30336,30464⟩) (.single ⟨11904,11968,30208,30272⟩))) (.node (.node (.single ⟨11904,11968,30272,30336⟩) (.single ⟨11968,12032,30208,30272⟩)) (.node (.single ⟨11968,12032,30272,30336⟩) (.single ⟨11904,12032,30336,30464⟩))))) (.node (.node (.node (.single ⟨20736,20864,2304,2432⟩) (.node (.single ⟨20736,20800,2432,2496⟩) (.single ⟨20736,20800,2496,2560⟩))) (.node (.node (.single ⟨20800,20864,2432,2496⟩) (.single ⟨20800,20864,2496,2560⟩)) (.node (.single ⟨20864,20992,2304,2432⟩) (.single ⟨20864,20992,2432,2560⟩)))) (.node (.node (.single ⟨30208,30336,11776,11904⟩) (.node (.single ⟨30208,30272,11904,11968⟩) (.single ⟨30208,30272,11968,12032⟩))) (.node (.node (.single ⟨30272,30336,11904,11968⟩) (.single ⟨30272,30336,11968,12032⟩)) (.node (.single ⟨30336,30464,11776,11904⟩) (.single ⟨30336,30464,11904,12032⟩))))))
def output6 : Fin 28 → GridBox := outputData6.get
def coverData6 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData6 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover6 (i : Fin 28) : Fin 28 := ⟨coverData6.get i % 28, Nat.mod_lt _ (by decide)⟩
def source6 (i : Fin 28) : Fin 28 := ⟨sourceData6.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree6 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 (.cutY 21504 (.cutX 2560 (.cutY 20992 (.cutX 2304 .empty (.cutY 20736 .empty (.cutX 2432 (.cutY 20864 .full .full) (.cutY 20864 (.cutX 2496 (.cutY 20800 .full .full) (.cutY 20800 .full .full)) .full)))) .empty) .empty) .empty) .empty) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 .empty (.cutY 29696 .empty (.cutX 11776 .empty (.cutY 30208 .empty (.cutX 12032 (.cutY 30464 (.cutX 11904 (.cutY 30336 .full .full) (.cutY 30336 (.cutX 11968 (.cutY 30272 .full .full) (.cutY 30272 .full .full)) .full)) .empty) .empty))))) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 (.cutY 3072 (.cutX 20992 (.cutY 2560 (.cutX 20736 .empty (.cutY 2304 .empty (.cutX 20864 (.cutY 2432 .full (.cutX 20800 (.cutY 2496 .full .full) (.cutY 2496 .full .full))) (.cutY 2432 .full .full)))) .empty) .empty) .empty) .empty)) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 .empty (.cutY 11264 .empty (.cutX 30208 .empty (.cutY 11776 .empty (.cutX 30464 (.cutY 12032 (.cutX 30336 (.cutY 11904 .full (.cutX 30272 (.cutY 11968 .full .full) (.cutY 11968 .full .full))) (.cutY 11904 .full .full)) .empty) .empty)))))) .empty) .empty)))) .empty))

theorem metadata6 : 0<72090291 ∧ 9<128 ∧ 81<128 ∧ 0<4 ∧
    1152/4160=0 ∧ 1152%4160=1152 ∧ ∀ i, (leaves6 i).Valid 8 := by
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

noncomputable def phaseMass6 : ℝ := singlePhaseMass (72090291/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw6 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass6_eq : phaseMass6 = (72090291/1638400000000 : ℝ) := by
  unfold phaseMass6
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw6 output6 cover6 source6
    (gridTreeUnionCheck_sound 32768 raw6 output6 cover6 source6 tree6 checked6)
    _ (by norm_num) _, areaUnits6]
  norm_num

-- Frozen phase 6717, atom 1788, type 0, source (15,93).
def leavesData7 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves7 : Fin 13 → DyadicLeaf := leavesData7.get
def raw7 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 15 93 leaves7 i
def outputData7 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨3840,3968,23808,23936⟩) (.node (.single ⟨3840,3968,23936,24064⟩) (.single ⟨3968,4032,23808,23872⟩))) (.node (.single ⟨3968,4032,23872,23936⟩) (.node (.single ⟨4032,4064,23808,23840⟩) (.single ⟨4032,4064,23840,23872⟩)))) (.node (.node (.single ⟨4064,4096,23808,23840⟩) (.node (.single ⟨4064,4096,23840,23872⟩) (.single ⟨4032,4096,23872,23936⟩))) (.node (.node (.single ⟨3968,4032,23936,24000⟩) (.single ⟨3968,4032,24000,24064⟩)) (.node (.single ⟨4032,4096,23936,24000⟩) (.single ⟨4032,4096,24000,24064⟩))))) (.node (.node (.node (.single ⟨8704,8768,28672,28736⟩) (.node (.single ⟨8704,8768,28736,28800⟩) (.single ⟨8768,8832,28672,28736⟩))) (.node (.single ⟨8768,8832,28736,28800⟩) (.node (.single ⟨8704,8832,28800,28928⟩) (.single ⟨8832,8896,28672,28736⟩)))) (.node (.node (.single ⟨8832,8896,28736,28800⟩) (.node (.single ⟨8896,8928,28672,28704⟩) (.single ⟨8896,8928,28704,28736⟩))) (.node (.node (.single ⟨8928,8960,28672,28704⟩) (.single ⟨8928,8960,28704,28736⟩)) (.node (.single ⟨8896,8960,28736,28800⟩) (.single ⟨8832,8960,28800,28928⟩)))))) (.node (.node (.node (.node (.single ⟨23808,23936,3840,3968⟩) (.node (.single ⟨23808,23872,3968,4032⟩) (.single ⟨23808,23840,4032,4064⟩))) (.node (.single ⟨23808,23840,4064,4096⟩) (.node (.single ⟨23840,23872,4032,4064⟩) (.single ⟨23840,23872,4064,4096⟩)))) (.node (.node (.single ⟨23872,23936,3968,4032⟩) (.node (.single ⟨23872,23936,4032,4096⟩) (.single ⟨23936,24064,3840,3968⟩))) (.node (.node (.single ⟨23936,24000,3968,4032⟩) (.single ⟨23936,24000,4032,4096⟩)) (.node (.single ⟨24000,24064,3968,4032⟩) (.single ⟨24000,24064,4032,4096⟩))))) (.node (.node (.node (.single ⟨28672,28736,8704,8768⟩) (.node (.single ⟨28672,28736,8768,8832⟩) (.single ⟨28736,28800,8704,8768⟩))) (.node (.single ⟨28736,28800,8768,8832⟩) (.node (.single ⟨28672,28736,8832,8896⟩) (.single ⟨28672,28704,8896,8928⟩)))) (.node (.node (.single ⟨28672,28704,8928,8960⟩) (.node (.single ⟨28704,28736,8896,8928⟩) (.single ⟨28704,28736,8928,8960⟩))) (.node (.node (.single ⟨28736,28800,8832,8896⟩) (.single ⟨28736,28800,8896,8960⟩)) (.node (.single ⟨28800,28928,8704,8832⟩) (.single ⟨28800,28928,8832,8960⟩)))))))
def output7 : Fin 52 → GridBox := outputData7.get
def coverData7 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 0) (.node (.single 26) (.single 51))) (.node (.single 25) (.node (.single 1) (.single 34)))) (.node (.node (.single 50) (.node (.single 17) (.single 2))) (.node (.node (.single 27) (.single 49)) (.node (.single 24) (.single 3))))) (.node (.node (.node (.single 32) (.node (.single 48) (.single 19))) (.node (.single 9) (.node (.single 35) (.single 42)))) (.node (.node (.single 16) (.node (.single 10) (.single 37))) (.node (.node (.single 41) (.single 14)) (.node (.single 8) (.single 33)))))) (.node (.node (.node (.node (.single 43) (.node (.single 18) (.single 11))) (.node (.single 36) (.node (.single 40) (.single 15)))) (.node (.node (.single 12) (.node (.single 38) (.single 39))) (.node (.node (.single 13) (.single 4)) (.node (.single 28) (.single 47))))) (.node (.node (.node (.single 23) (.node (.single 5) (.single 30))) (.node (.single 46) (.node (.single 21) (.single 6)))) (.node (.node (.single 29) (.node (.single 45) (.single 22))) (.node (.node (.single 7) (.single 31)) (.node (.single 44) (.single 20)))))))
def sourceData7 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 8))) (.node (.single 12) (.node (.single 36) (.single 40)))) (.node (.node (.single 44) (.node (.single 48) (.single 24))) (.node (.node (.single 16) (.single 20)) (.node (.single 28) (.single 32))))) (.node (.node (.node (.single 35) (.node (.single 23) (.single 31))) (.node (.single 19) (.node (.single 7) (.single 27)))) (.node (.node (.single 15) (.node (.single 51) (.single 43))) (.node (.node (.single 47) (.single 39)) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.node (.single 9) (.single 37))) (.node (.single 45) (.node (.single 41) (.single 49)))) (.node (.node (.single 13) (.node (.single 25) (.single 5))) (.node (.node (.single 17) (.single 29)) (.node (.single 21) (.single 33))))) (.node (.node (.node (.single 34) (.node (.single 30) (.single 22))) (.node (.single 18) (.node (.single 26) (.single 50)))) (.node (.node (.single 46) (.node (.single 42) (.single 38))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))))
def cover7 (i : Fin 52) : Fin 52 := ⟨coverData7.get i % 52, Nat.mod_lt _ (by decide)⟩
def source7 (i : Fin 52) : Fin 52 := ⟨sourceData7.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree7 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 .empty (.cutX 3072 .empty (.cutY 23552 .empty (.cutX 3584 .empty (.cutY 24064 (.cutX 3840 .empty (.cutY 23808 .empty (.cutX 3968 (.cutY 23936 .full .full) (.cutY 23936 (.cutX 4032 (.cutY 23872 .full .full) (.cutY 23872 (.cutX 4064 (.cutY 23840 .full .full) (.cutY 23840 .full .full)) .full)) (.cutX 4032 (.cutY 24000 .full .full) (.cutY 24000 .full .full)))))) .empty))))))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 (.cutY 30720 (.cutX 9216 (.cutY 29696 (.cutX 8704 .empty (.cutY 29184 (.cutX 8960 (.cutY 28928 (.cutX 8832 (.cutY 28800 (.cutX 8768 (.cutY 28736 .full .full) (.cutY 28736 .full .full)) .full) (.cutY 28800 (.cutX 8896 (.cutY 28736 .full .full) (.cutY 28736 (.cutX 8928 (.cutY 28704 .full .full) (.cutY 28704 .full .full)) .full)) .full)) .empty) .empty) .empty)) .empty) .empty) .empty) .empty)) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 .empty (.cutY 2048 .empty (.cutX 23552 .empty (.cutY 3072 .empty (.cutX 24064 (.cutY 3584 .empty (.cutX 23808 .empty (.cutY 3840 .empty (.cutX 23936 (.cutY 3968 .full (.cutX 23872 (.cutY 4032 .full (.cutX 23840 (.cutY 4064 .full .full) (.cutY 4064 .full .full))) (.cutY 4032 .full .full))) (.cutY 3968 .full (.cutX 24000 (.cutY 4032 .full .full) (.cutY 4032 .full .full))))))) .empty))))) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 (.cutX 29696 (.cutY 9216 (.cutX 29184 (.cutY 8704 .empty (.cutX 28928 (.cutY 8960 (.cutX 28800 (.cutY 8832 (.cutX 28736 (.cutY 8768 .full .full) (.cutY 8768 .full .full)) (.cutX 28736 (.cutY 8896 .full (.cutX 28704 (.cutY 8928 .full .full) (.cutY 8928 .full .full))) (.cutY 8896 .full .full))) (.cutY 8832 .full .full)) .empty) .empty)) .empty) .empty) .empty) .empty) .empty) .empty)))) .empty))

theorem metadata7 : 0<77641223 ∧ 15<128 ∧ 93<128 ∧ 0<4 ∧
    1788/4160=0 ∧ 1788%4160=1788 ∧ ∀ i, (leaves7 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData7).mp
    (by decide +kernel)

theorem sourceChecked7_0 : ∀ i : Fin 52,
    (fun i => output7 i = raw7 (source7 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked7 : ∀ i : Fin 52, (fun i => output7 i = raw7 (source7 i)) i :=
  forallFin_of_zero_offset (fun i => output7 i = raw7 (source7 i)) sourceChecked7_0

theorem coverChecked7_0 : ∀ i : Fin 52,
    (fun i => (output7 (cover7 i)).ContainsBox (raw7 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked7 : ∀ i : Fin 52, (fun i => (output7 (cover7 i)).ContainsBox (raw7 i)) i :=
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

noncomputable def phaseMass7 : ℝ := singlePhaseMass (77641223/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw7 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass7_eq : phaseMass7 = (77641223/1638400000000 : ℝ) := by
  unfold phaseMass7
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw7 output7 cover7 source7
    (gridTreeUnionCheck_sound 32768 raw7 output7 cover7 source7 tree7 checked7)
    _ (by norm_num) _, areaUnits7]
  norm_num

-- Frozen phase 6718, atom 1582, type 0, source (13,87).
def leavesData8 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,2,2⟩))) (.node (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,1⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))) (.node (.node (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩)) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves8 : Fin 16 → DyadicLeaf := leavesData8.get
def raw8 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 13 87 leaves8 i
def outputData8 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨3328,3392,22272,22336⟩) (.single ⟨3328,3392,22336,22400⟩)) (.node (.single ⟨3392,3456,22272,22336⟩) (.single ⟨3392,3456,22336,22400⟩))) (.node (.node (.single ⟨3328,3456,22400,22528⟩) (.single ⟨3456,3520,22272,22336⟩)) (.node (.single ⟨3456,3520,22336,22400⟩) (.single ⟨3520,3552,22272,22304⟩)))) (.node (.node (.node (.single ⟨3520,3552,22304,22336⟩) (.single ⟨3552,3584,22272,22304⟩)) (.node (.single ⟨3552,3584,22304,22336⟩) (.single ⟨3520,3584,22336,22400⟩))) (.node (.node (.single ⟨3456,3520,22400,22464⟩) (.single ⟨3456,3520,22464,22528⟩)) (.node (.single ⟨3520,3584,22400,22464⟩) (.single ⟨3520,3584,22464,22528⟩))))) (.node (.node (.node (.node (.single ⟨10240,10304,29184,29248⟩) (.single ⟨10240,10304,29248,29312⟩)) (.node (.single ⟨10304,10368,29184,29248⟩) (.single ⟨10304,10368,29248,29312⟩))) (.node (.node (.single ⟨10240,10368,29312,29440⟩) (.single ⟨10368,10432,29184,29248⟩)) (.node (.single ⟨10368,10432,29248,29312⟩) (.single ⟨10432,10464,29184,29216⟩)))) (.node (.node (.node (.single ⟨10432,10464,29216,29248⟩) (.single ⟨10464,10496,29184,29216⟩)) (.node (.single ⟨10464,10496,29216,29248⟩) (.single ⟨10432,10496,29248,29312⟩))) (.node (.node (.single ⟨10368,10432,29312,29376⟩) (.single ⟨10368,10432,29376,29440⟩)) (.node (.single ⟨10432,10496,29312,29376⟩) (.single ⟨10432,10496,29376,29440⟩)))))) (.node (.node (.node (.node (.node (.single ⟨22272,22336,3328,3392⟩) (.single ⟨22272,22336,3392,3456⟩)) (.node (.single ⟨22336,22400,3328,3392⟩) (.single ⟨22336,22400,3392,3456⟩))) (.node (.node (.single ⟨22272,22336,3456,3520⟩) (.single ⟨22272,22304,3520,3552⟩)) (.node (.single ⟨22272,22304,3552,3584⟩) (.single ⟨22304,22336,3520,3552⟩)))) (.node (.node (.node (.single ⟨22304,22336,3552,3584⟩) (.single ⟨22336,22400,3456,3520⟩)) (.node (.single ⟨22336,22400,3520,3584⟩) (.single ⟨22400,22528,3328,3456⟩))) (.node (.node (.single ⟨22400,22464,3456,3520⟩) (.single ⟨22400,22464,3520,3584⟩)) (.node (.single ⟨22464,22528,3456,3520⟩) (.single ⟨22464,22528,3520,3584⟩))))) (.node (.node (.node (.node (.single ⟨29184,29248,10240,10304⟩) (.single ⟨29184,29248,10304,10368⟩)) (.node (.single ⟨29248,29312,10240,10304⟩) (.single ⟨29248,29312,10304,10368⟩))) (.node (.node (.single ⟨29184,29248,10368,10432⟩) (.single ⟨29184,29216,10432,10464⟩)) (.node (.single ⟨29184,29216,10464,10496⟩) (.single ⟨29216,29248,10432,10464⟩)))) (.node (.node (.node (.single ⟨29216,29248,10464,10496⟩) (.single ⟨29248,29312,10368,10432⟩)) (.node (.single ⟨29248,29312,10432,10496⟩) (.single ⟨29312,29440,10240,10368⟩))) (.node (.node (.single ⟨29312,29376,10368,10432⟩) (.single ⟨29312,29376,10432,10496⟩)) (.node (.single ⟨29376,29440,10368,10432⟩) (.single ⟨29376,29440,10432,10496⟩)))))))
def output8 : Fin 64 → GridBox := outputData8.get
def coverData8 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 43)) (.node (.single 59) (.single 20))) (.node (.node (.single 5) (.single 36)) (.node (.single 58) (.single 27)))) (.node (.node (.node (.single 6) (.single 41)) (.node (.single 57) (.single 22))) (.node (.node (.single 12) (.single 44)) (.node (.single 51) (.single 19))))) (.node (.node (.node (.node (.single 13) (.single 46)) (.node (.single 50) (.single 17))) (.node (.node (.single 11) (.single 42)) (.node (.single 52) (.single 21)))) (.node (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16)))))) (.node (.node (.node (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31))) (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29)))) (.node (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30))) (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28))))) (.node (.node (.node (.node (.single 7) (.single 37)) (.node (.single 56) (.single 26))) (.node (.node (.single 8) (.single 39)) (.node (.single 55) (.single 24)))) (.node (.node (.node (.single 9) (.single 38)) (.node (.single 54) (.single 25))) (.node (.node (.single 10) (.single 40)) (.node (.single 53) (.single 23)))))))
def sourceData8 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 32) (.single 36)) (.node (.single 40) (.single 44))) (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 48)))) (.node (.node (.node (.single 52) (.single 56)) (.node (.single 60) (.single 20))) (.node (.node (.single 12) (.single 16)) (.node (.single 24) (.single 28))))) (.node (.node (.node (.node (.single 31) (.single 19)) (.node (.single 27) (.single 15))) (.node (.node (.single 3) (.single 23)) (.node (.single 11) (.single 63)))) (.node (.node (.node (.single 55) (.single 59)) (.node (.single 51) (.single 7))) (.node (.node (.single 47) (.single 39)) (.node (.single 43) (.single 35)))))) (.node (.node (.node (.node (.node (.single 33) (.single 41)) (.node (.single 37) (.single 45))) (.node (.node (.single 5) (.single 49)) (.node (.single 57) (.single 53)))) (.node (.node (.node (.single 61) (.single 9)) (.node (.single 21) (.single 1))) (.node (.node (.single 13) (.single 25)) (.node (.single 17) (.single 29))))) (.node (.node (.node (.node (.single 30) (.single 26)) (.node (.single 18) (.single 14))) (.node (.node (.single 22) (.single 62)) (.node (.single 58) (.single 54)))) (.node (.node (.node (.single 50) (.single 10)) (.node (.single 6) (.single 2))) (.node (.node (.single 46) (.single 42)) (.node (.single 38) (.single 34)))))))
def cover8 (i : Fin 64) : Fin 64 := ⟨coverData8.get i % 64, Nat.mod_lt _ (by decide)⟩
def source8 (i : Fin 64) : Fin 64 := ⟨sourceData8.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree8 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 .empty (.cutY 21504 .empty (.cutX 3584 (.cutY 22016 .empty (.cutX 3328 .empty (.cutY 22272 .empty (.cutX 3456 (.cutY 22400 (.cutX 3392 (.cutY 22336 .full .full) (.cutY 22336 .full .full)) .full) (.cutY 22400 (.cutX 3520 (.cutY 22336 .full .full) (.cutY 22336 (.cutX 3552 (.cutY 22304 .full .full) (.cutY 22304 .full .full)) .full)) (.cutX 3520 (.cutY 22464 .full .full) (.cutY 22464 .full .full))))))) .empty))) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 (.cutY 29696 (.cutX 10752 (.cutY 29184 .empty (.cutX 10496 (.cutY 29440 (.cutX 10368 (.cutY 29312 (.cutX 10304 (.cutY 29248 .full .full) (.cutY 29248 .full .full)) .full) (.cutY 29312 (.cutX 10432 (.cutY 29248 .full .full) (.cutY 29248 (.cutX 10464 (.cutY 29216 .full .full) (.cutY 29216 .full .full)) .full)) (.cutX 10432 (.cutY 29376 .full .full) (.cutY 29376 .full .full)))) .empty) .empty)) .empty) .empty) .empty) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 .empty (.cutY 3072 .empty (.cutX 22016 .empty (.cutY 3584 (.cutX 22272 .empty (.cutY 3328 .empty (.cutX 22400 (.cutY 3456 (.cutX 22336 (.cutY 3392 .full .full) (.cutY 3392 .full .full)) (.cutX 22336 (.cutY 3520 .full (.cutX 22304 (.cutY 3552 .full .full) (.cutY 3552 .full .full))) (.cutY 3520 .full .full))) (.cutY 3456 .full (.cutX 22464 (.cutY 3520 .full .full) (.cutY 3520 .full .full)))))) .empty))))) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 (.cutY 11264 (.cutX 29184 .empty (.cutY 10752 (.cutX 29440 (.cutY 10496 (.cutX 29312 (.cutY 10368 (.cutX 29248 (.cutY 10304 .full .full) (.cutY 10304 .full .full)) (.cutX 29248 (.cutY 10432 .full (.cutX 29216 (.cutY 10464 .full .full) (.cutY 10464 .full .full))) (.cutY 10432 .full .full))) (.cutY 10368 .full (.cutX 29376 (.cutY 10432 .full .full) (.cutY 10432 .full .full)))) .empty) .empty) .empty)) .empty) .empty)) .empty) .empty)))) .empty))

theorem metadata8 : 0<72090291 ∧ 13<128 ∧ 87<128 ∧ 0<4 ∧
    1582/4160=0 ∧ 1582%4160=1582 ∧ ∀ i, (leaves8 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData8).mp
    (by decide +kernel)

theorem sourceChecked8_0 : ∀ i : Fin 64,
    (fun i => output8 i = raw8 (source8 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked8 : ∀ i : Fin 64, (fun i => output8 i = raw8 (source8 i)) i :=
  forallFin_of_zero_offset (fun i => output8 i = raw8 (source8 i)) sourceChecked8_0

theorem coverChecked8_0 : ∀ i : Fin 64,
    (fun i => (output8 (cover8 i)).ContainsBox (raw8 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked8 : ∀ i : Fin 64, (fun i => (output8 (cover8 i)).ContainsBox (raw8 i)) i :=
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

noncomputable def phaseMass8 : ℝ := singlePhaseMass (72090291/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw8 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass8_eq : phaseMass8 = (72090291/1638400000000 : ℝ) := by
  unfold phaseMass8
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw8 output8 cover8 source8
    (gridTreeUnionCheck_sound 32768 raw8 output8 cover8 source8 tree8 checked8)
    _ (by norm_num) _, areaUnits8]
  norm_num

-- Frozen phase 6719, atom 2257, type 0, source (20,97).
def leavesData9 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves9 : Fin 10 → DyadicLeaf := leavesData9.get
def raw9 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 20 97 leaves9 i
def outputData9 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨5120,5184,24832,24896⟩) (.single ⟨5120,5184,24896,24960⟩)) (.node (.single ⟨5184,5248,24832,24896⟩) (.node (.single ⟨5184,5248,24896,24960⟩) (.single ⟨5120,5248,24960,25088⟩)))) (.node (.node (.single ⟨5248,5312,24832,24896⟩) (.single ⟨5248,5312,24896,24960⟩)) (.node (.single ⟨5312,5376,24832,24896⟩) (.node (.single ⟨5312,5376,24896,24960⟩) (.single ⟨5248,5376,24960,25088⟩))))) (.node (.node (.node (.single ⟨7680,7808,27392,27520⟩) (.single ⟨7680,7808,27520,27648⟩)) (.node (.single ⟨7808,7872,27392,27456⟩) (.node (.single ⟨7808,7872,27456,27520⟩) (.single ⟨7872,7936,27392,27456⟩)))) (.node (.node (.single ⟨7872,7936,27456,27520⟩) (.single ⟨7808,7872,27520,27584⟩)) (.node (.single ⟨7808,7872,27584,27648⟩) (.node (.single ⟨7872,7936,27520,27584⟩) (.single ⟨7872,7936,27584,27648⟩)))))) (.node (.node (.node (.node (.single ⟨24832,24896,5120,5184⟩) (.single ⟨24832,24896,5184,5248⟩)) (.node (.single ⟨24896,24960,5120,5184⟩) (.node (.single ⟨24896,24960,5184,5248⟩) (.single ⟨24832,24896,5248,5312⟩)))) (.node (.node (.single ⟨24832,24896,5312,5376⟩) (.single ⟨24896,24960,5248,5312⟩)) (.node (.single ⟨24896,24960,5312,5376⟩) (.node (.single ⟨24960,25088,5120,5248⟩) (.single ⟨24960,25088,5248,5376⟩))))) (.node (.node (.node (.single ⟨27392,27520,7680,7808⟩) (.single ⟨27392,27456,7808,7872⟩)) (.node (.single ⟨27392,27456,7872,7936⟩) (.node (.single ⟨27456,27520,7808,7872⟩) (.single ⟨27456,27520,7872,7936⟩)))) (.node (.node (.single ⟨27520,27648,7680,7808⟩) (.single ⟨27520,27584,7808,7872⟩)) (.node (.single ⟨27520,27584,7872,7936⟩) (.node (.single ⟨27584,27648,7808,7872⟩) (.single ⟨27584,27648,7872,7936⟩)))))))
def output9 : Fin 40 → GridBox := outputData9.get
def coverData9 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData9 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover9 (i : Fin 40) : Fin 40 := ⟨coverData9.get i % 40, Nat.mod_lt _ (by decide)⟩
def source9 (i : Fin 40) : Fin 40 := ⟨sourceData9.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree9 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 (.cutY 26624 (.cutX 5120 .empty (.cutY 25600 (.cutX 5632 (.cutY 25088 (.cutX 5376 (.cutY 24832 .empty (.cutX 5248 (.cutY 24960 (.cutX 5184 (.cutY 24896 .full .full) (.cutY 24896 .full .full)) .full) (.cutY 24960 (.cutX 5312 (.cutY 24896 .full .full) (.cutY 24896 .full .full)) .full))) .empty) .empty) .empty) .empty)) .empty) (.cutY 26624 .empty (.cutX 7168 .empty (.cutY 27648 (.cutX 7680 .empty (.cutY 27136 .empty (.cutX 7936 (.cutY 27392 .empty (.cutX 7808 (.cutY 27520 .full .full) (.cutY 27520 (.cutX 7872 (.cutY 27456 .full .full) (.cutY 27456 .full .full)) (.cutX 7872 (.cutY 27584 .full .full) (.cutY 27584 .full .full))))) .empty))) .empty)))) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 (.cutX 25600 (.cutY 5120 .empty (.cutX 25088 (.cutY 5632 (.cutX 24832 .empty (.cutY 5376 (.cutX 24960 (.cutY 5248 (.cutX 24896 (.cutY 5184 .full .full) (.cutY 5184 .full .full)) (.cutX 24896 (.cutY 5312 .full .full) (.cutY 5312 .full .full))) (.cutY 5248 .full .full)) .empty)) .empty) .empty)) .empty) .empty) (.cutY 6144 .empty (.cutX 27648 (.cutY 7168 .empty (.cutX 27136 .empty (.cutY 7680 .empty (.cutX 27392 .empty (.cutY 7936 (.cutX 27520 (.cutY 7808 .full (.cutX 27456 (.cutY 7872 .full .full) (.cutY 7872 .full .full))) (.cutY 7808 .full (.cutX 27584 (.cutY 7872 .full .full) (.cutY 7872 .full .full)))) .empty))))) .empty)))) .empty) .empty)) .empty))

theorem metadata9 : 0<121837468 ∧ 20<128 ∧ 97<128 ∧ 0<4 ∧
    2257/4160=0 ∧ 2257%4160=2257 ∧ ∀ i, (leaves9 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData9).mp
    (by decide +kernel)

theorem sourceChecked9_0 : ∀ i : Fin 40,
    (fun i => output9 i = raw9 (source9 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked9 : ∀ i : Fin 40, (fun i => output9 i = raw9 (source9 i)) i :=
  forallFin_of_zero_offset (fun i => output9 i = raw9 (source9 i)) sourceChecked9_0

theorem coverChecked9_0 : ∀ i : Fin 40,
    (fun i => (output9 (cover9 i)).ContainsBox (raw9 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked9 : ∀ i : Fin 40, (fun i => (output9 (cover9 i)).ContainsBox (raw9 i)) i :=
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

noncomputable def phaseMass9 : ℝ := singlePhaseMass (121837468/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw9 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass9_eq : phaseMass9 = (30459367/409600000000 : ℝ) := by
  unfold phaseMass9
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw9 output9 cover9 source9
    (gridTreeUnionCheck_sound 32768 raw9 output9 cover9 source9 tree9 checked9)
    _ (by norm_num) _, areaUnits9]
  norm_num

-- Frozen phase 6720, atom 7129, type 1, source (29,98).
def leavesData10 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩)) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves10 : Fin 16 → DyadicLeaf := leavesData10.get
def raw10 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 29 98 leaves10 i
def outputData10 : FiniteInputTree GridBox 32 := (.node (.node (.node (.node (.node (.single ⟨7424,7488,25088,25152⟩) (.single ⟨7424,7488,25152,25216⟩)) (.node (.single ⟨7488,7552,25088,25152⟩) (.single ⟨7488,7552,25152,25216⟩))) (.node (.node (.single ⟨7424,7552,25216,25344⟩) (.single ⟨7552,7616,25088,25152⟩)) (.node (.single ⟨7552,7616,25152,25216⟩) (.single ⟨7616,7648,25088,25120⟩)))) (.node (.node (.node (.single ⟨7616,7648,25120,25152⟩) (.single ⟨7648,7680,25088,25120⟩)) (.node (.single ⟨7648,7680,25120,25152⟩) (.single ⟨7616,7680,25152,25216⟩))) (.node (.node (.single ⟨7552,7616,25216,25280⟩) (.single ⟨7552,7616,25280,25344⟩)) (.node (.single ⟨7616,7680,25216,25280⟩) (.single ⟨7616,7680,25280,25344⟩))))) (.node (.node (.node (.node (.single ⟨25088,25152,7424,7488⟩) (.single ⟨25088,25152,7488,7552⟩)) (.node (.single ⟨25152,25216,7424,7488⟩) (.single ⟨25152,25216,7488,7552⟩))) (.node (.node (.single ⟨25088,25152,7552,7616⟩) (.single ⟨25088,25120,7616,7648⟩)) (.node (.single ⟨25088,25120,7648,7680⟩) (.single ⟨25120,25152,7616,7648⟩)))) (.node (.node (.node (.single ⟨25120,25152,7648,7680⟩) (.single ⟨25152,25216,7552,7616⟩)) (.node (.single ⟨25152,25216,7616,7680⟩) (.single ⟨25216,25344,7424,7552⟩))) (.node (.node (.single ⟨25216,25280,7552,7616⟩) (.single ⟨25216,25280,7616,7680⟩)) (.node (.single ⟨25280,25344,7552,7616⟩) (.single ⟨25280,25344,7616,7680⟩))))))
def output10 : Fin 32 → GridBox := outputData10.get
def coverData10 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 27)) (.node (.single 27) (.single 4))) (.node (.node (.single 5) (.single 20)) (.node (.single 26) (.single 11)))) (.node (.node (.node (.single 6) (.single 25)) (.node (.single 25) (.single 6))) (.node (.node (.single 11) (.single 26)) (.node (.single 20) (.single 5))))) (.node (.node (.node (.node (.single 0) (.single 16)) (.node (.single 31) (.single 15))) (.node (.node (.single 1) (.single 18)) (.node (.single 30) (.single 13)))) (.node (.node (.node (.single 2) (.single 17)) (.node (.single 29) (.single 14))) (.node (.node (.single 3) (.single 19)) (.node (.single 28) (.single 12)))))) (.node (.node (.node (.node (.node (.single 12) (.single 28)) (.node (.single 19) (.single 3))) (.node (.node (.single 13) (.single 30)) (.node (.single 18) (.single 1)))) (.node (.node (.node (.single 14) (.single 29)) (.node (.single 17) (.single 2))) (.node (.node (.single 15) (.single 31)) (.node (.single 16) (.single 0))))) (.node (.node (.node (.node (.single 7) (.single 21)) (.node (.single 24) (.single 10))) (.node (.node (.single 8) (.single 23)) (.node (.single 23) (.single 8)))) (.node (.node (.node (.single 9) (.single 22)) (.node (.single 22) (.single 9))) (.node (.node (.single 10) (.single 24)) (.node (.single 21) (.single 7)))))))
def sourceData10 : FiniteInputTree ℕ 32 := (.node (.node (.node (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 28))) (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 48)))) (.node (.node (.node (.single 52) (.single 56)) (.node (.single 51) (.single 7))) (.node (.node (.single 31) (.single 23)) (.node (.single 27) (.single 19))))) (.node (.node (.node (.node (.single 17) (.single 25)) (.node (.single 21) (.single 29))) (.node (.node (.single 5) (.single 49)) (.node (.single 57) (.single 53)))) (.node (.node (.node (.single 50) (.single 9)) (.node (.single 6) (.single 1))) (.node (.node (.single 30) (.single 26)) (.node (.single 22) (.single 18))))))
def cover10 (i : Fin 64) : Fin 32 := ⟨coverData10.get i % 32, Nat.mod_lt _ (by decide)⟩
def source10 (i : Fin 32) : Fin 64 := ⟨sourceData10.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree10 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 .empty (.cutY 26624 (.cutX 7168 .empty (.cutY 25600 (.cutX 7680 (.cutY 25088 .empty (.cutX 7424 .empty (.cutY 25344 (.cutX 7552 (.cutY 25216 (.cutX 7488 (.cutY 25152 .full .full) (.cutY 25152 .full .full)) .full) (.cutY 25216 (.cutX 7616 (.cutY 25152 .full .full) (.cutY 25152 (.cutX 7648 (.cutY 25120 .full .full) (.cutY 25120 .full .full)) .full)) (.cutX 7616 (.cutY 25280 .full .full) (.cutY 25280 .full .full)))) .empty))) .empty) .empty)) .empty)) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 .empty (.cutX 25600 (.cutY 7168 .empty (.cutX 25088 .empty (.cutY 7680 (.cutX 25344 (.cutY 7424 .empty (.cutX 25216 (.cutY 7552 (.cutX 25152 (.cutY 7488 .full .full) (.cutY 7488 .full .full)) (.cutX 25152 (.cutY 7616 .full (.cutX 25120 (.cutY 7648 .full .full) (.cutY 7648 .full .full))) (.cutY 7616 .full .full))) (.cutY 7552 .full (.cutX 25280 (.cutY 7616 .full .full) (.cutY 7616 .full .full))))) .empty) .empty))) .empty)) .empty)) .empty) .empty)) .empty))

theorem metadata10 : 0<48020332 ∧ 29<128 ∧ 98<128 ∧ 1<4 ∧
    7129/4160=1 ∧ 7129%4160=2969 ∧ ∀ i, (leaves10 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData10).mp
    (by decide +kernel)

theorem sourceChecked10_0 : ∀ i : Fin 32,
    (fun i => output10 i = raw10 (source10 i)) (finOffset 32 0 32 (by decide) i) := by decide +kernel

theorem sourceChecked10 : ∀ i : Fin 32, (fun i => output10 i = raw10 (source10 i)) i :=
  forallFin_of_zero_offset (fun i => output10 i = raw10 (source10 i)) sourceChecked10_0

theorem coverChecked10_0 : ∀ i : Fin 64,
    (fun i => (output10 (cover10 i)).ContainsBox (raw10 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked10 : ∀ i : Fin 64, (fun i => (output10 (cover10 i)).ContainsBox (raw10 i)) i :=
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

theorem areaUnits10 : gridUnionAreaUnits output10 = 131072 := by decide +kernel

noncomputable def phaseMass10 : ℝ := singlePhaseMass (48020332/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw10 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass10_eq : phaseMass10 = (12005083/819200000000 : ℝ) := by
  unfold phaseMass10
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw10 output10 cover10 source10
    (gridTreeUnionCheck_sound 32768 raw10 output10 cover10 source10 tree10 checked10)
    _ (by norm_num) _, areaUnits10]
  norm_num

-- Frozen phase 6721, atom 5942, type 1, source (15,87).
def leavesData11 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,2,2⟩)))) (.node (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,0⟩)) (.node (.single ⟨2,3,1⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves11 : Fin 10 → DyadicLeaf := leavesData11.get
def raw11 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 15 87 leaves11 i
def outputData11 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨3840,3968,22272,22400⟩) (.single ⟨3840,3968,22400,22528⟩)) (.node (.single ⟨3968,4032,22272,22336⟩) (.node (.single ⟨3968,4032,22336,22400⟩) (.single ⟨4032,4096,22272,22336⟩)))) (.node (.node (.single ⟨4032,4096,22336,22400⟩) (.single ⟨3968,4032,22400,22464⟩)) (.node (.single ⟨3968,4032,22464,22528⟩) (.node (.single ⟨4032,4096,22400,22464⟩) (.single ⟨4032,4096,22464,22528⟩))))) (.node (.node (.node (.single ⟨10240,10304,28672,28736⟩) (.single ⟨10240,10304,28736,28800⟩)) (.node (.single ⟨10304,10368,28672,28736⟩) (.node (.single ⟨10304,10368,28736,28800⟩) (.single ⟨10240,10368,28800,28928⟩)))) (.node (.node (.single ⟨10368,10432,28672,28736⟩) (.single ⟨10368,10432,28736,28800⟩)) (.node (.single ⟨10432,10496,28672,28736⟩) (.node (.single ⟨10432,10496,28736,28800⟩) (.single ⟨10368,10496,28800,28928⟩)))))) (.node (.node (.node (.node (.single ⟨22272,22400,3840,3968⟩) (.single ⟨22272,22336,3968,4032⟩)) (.node (.single ⟨22272,22336,4032,4096⟩) (.node (.single ⟨22336,22400,3968,4032⟩) (.single ⟨22336,22400,4032,4096⟩)))) (.node (.node (.single ⟨22400,22528,3840,3968⟩) (.single ⟨22400,22464,3968,4032⟩)) (.node (.single ⟨22400,22464,4032,4096⟩) (.node (.single ⟨22464,22528,3968,4032⟩) (.single ⟨22464,22528,4032,4096⟩))))) (.node (.node (.node (.single ⟨28672,28736,10240,10304⟩) (.single ⟨28672,28736,10304,10368⟩)) (.node (.single ⟨28736,28800,10240,10304⟩) (.node (.single ⟨28736,28800,10304,10368⟩) (.single ⟨28672,28736,10368,10432⟩)))) (.node (.node (.single ⟨28672,28736,10432,10496⟩) (.single ⟨28736,28800,10368,10432⟩)) (.node (.single ⟨28736,28800,10432,10496⟩) (.node (.single ⟨28800,28928,10240,10368⟩) (.single ⟨28800,28928,10368,10496⟩)))))))
def output11 : Fin 40 → GridBox := outputData11.get
def coverData11 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 25) (.single 38)) (.node (.single 14) (.node (.single 2) (.single 21))))) (.node (.node (.node (.single 37) (.single 18)) (.node (.single 3) (.node (.single 23) (.single 36)))) (.node (.node (.single 16) (.single 6)) (.node (.single 26) (.node (.single 33) (.single 13)))))) (.node (.node (.node (.node (.single 7) (.single 28)) (.node (.single 32) (.node (.single 11) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 8) (.node (.single 27) (.single 31)))) (.node (.node (.single 12) (.single 9)) (.node (.single 29) (.node (.single 30) (.single 10)))))))
def sourceData11 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 12) (.single 24)))) (.node (.node (.single 28) (.single 16)) (.node (.single 20) (.node (.single 32) (.single 36))))) (.node (.node (.node (.single 39) (.single 23)) (.node (.single 35) (.node (.single 19) (.single 7)))) (.node (.node (.single 31) (.single 15)) (.node (.single 27) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 25) (.node (.single 13) (.single 29)))) (.node (.node (.single 5) (.single 17)) (.node (.single 33) (.node (.single 21) (.single 37))))) (.node (.node (.node (.single 38) (.single 34)) (.node (.single 22) (.node (.single 18) (.single 30)))) (.node (.node (.single 26) (.single 14)) (.node (.single 10) (.node (.single 6) (.single 2)))))))
def cover11 (i : Fin 40) : Fin 40 := ⟨coverData11.get i % 40, Nat.mod_lt _ (by decide)⟩
def source11 (i : Fin 40) : Fin 40 := ⟨sourceData11.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree11 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 .empty (.cutY 21504 .empty (.cutX 3584 .empty (.cutY 22016 .empty (.cutX 3840 .empty (.cutY 22272 .empty (.cutX 3968 (.cutY 22400 .full .full) (.cutY 22400 (.cutX 4032 (.cutY 22336 .full .full) (.cutY 22336 .full .full)) (.cutX 4032 (.cutY 22464 .full .full) (.cutY 22464 .full .full)))))))))) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 (.cutY 29696 (.cutX 10752 (.cutY 29184 (.cutX 10496 (.cutY 28928 (.cutX 10368 (.cutY 28800 (.cutX 10304 (.cutY 28736 .full .full) (.cutY 28736 .full .full)) .full) (.cutY 28800 (.cutX 10432 (.cutY 28736 .full .full) (.cutY 28736 .full .full)) .full)) .empty) .empty) .empty) .empty) .empty) .empty) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 .empty (.cutY 3072 .empty (.cutX 22016 .empty (.cutY 3584 .empty (.cutX 22272 .empty (.cutY 3840 .empty (.cutX 22400 (.cutY 3968 .full (.cutX 22336 (.cutY 4032 .full .full) (.cutY 4032 .full .full))) (.cutY 3968 .full (.cutX 22464 (.cutY 4032 .full .full) (.cutY 4032 .full .full))))))))))) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 (.cutY 11264 (.cutX 29184 (.cutY 10752 (.cutX 28928 (.cutY 10496 (.cutX 28800 (.cutY 10368 (.cutX 28736 (.cutY 10304 .full .full) (.cutY 10304 .full .full)) (.cutX 28736 (.cutY 10432 .full .full) (.cutY 10432 .full .full))) (.cutY 10368 .full .full)) .empty) .empty) .empty) .empty) .empty) .empty)) .empty) .empty)))) .empty))

theorem metadata11 : 0<139307719 ∧ 15<128 ∧ 87<128 ∧ 1<4 ∧
    5942/4160=1 ∧ 5942%4160=1782 ∧ ∀ i, (leaves11 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData11).mp
    (by decide +kernel)

theorem sourceChecked11_0 : ∀ i : Fin 40,
    (fun i => output11 i = raw11 (source11 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked11 : ∀ i : Fin 40, (fun i => output11 i = raw11 (source11 i)) i :=
  forallFin_of_zero_offset (fun i => output11 i = raw11 (source11 i)) sourceChecked11_0

theorem coverChecked11_0 : ∀ i : Fin 40,
    (fun i => (output11 (cover11 i)).ContainsBox (raw11 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked11 : ∀ i : Fin 40, (fun i => (output11 (cover11 i)).ContainsBox (raw11 i)) i :=
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

noncomputable def phaseMass11 : ℝ := singlePhaseMass (139307719/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw11 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass11_eq : phaseMass11 = (139307719/1638400000000 : ℝ) := by
  unfold phaseMass11
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw11 output11 cover11 source11
    (gridTreeUnionCheck_sound 32768 raw11 output11 cover11 source11 tree11 checked11)
    _ (by norm_num) _, areaUnits11]
  norm_num

-- Frozen phase 6722, atom 1687, type 0, source (14,91).
def leavesData12 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,2,2⟩)) (.node (.single ⟨2,2,3⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves12 : Fin 10 → DyadicLeaf := leavesData12.get
def raw12 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 14 91 leaves12 i
def outputData12 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨3584,3712,23296,23424⟩) (.single ⟨3584,3712,23424,23552⟩)) (.node (.single ⟨3712,3776,23296,23360⟩) (.node (.single ⟨3712,3776,23360,23424⟩) (.single ⟨3776,3840,23296,23360⟩)))) (.node (.node (.single ⟨3776,3840,23360,23424⟩) (.single ⟨3712,3776,23424,23488⟩)) (.node (.single ⟨3712,3776,23488,23552⟩) (.node (.single ⟨3776,3840,23424,23488⟩) (.single ⟨3776,3840,23488,23552⟩))))) (.node (.node (.node (.single ⟨9216,9280,28928,28992⟩) (.single ⟨9216,9280,28992,29056⟩)) (.node (.single ⟨9280,9344,28928,28992⟩) (.node (.single ⟨9280,9344,28992,29056⟩) (.single ⟨9216,9344,29056,29184⟩)))) (.node (.node (.single ⟨9344,9408,28928,28992⟩) (.single ⟨9344,9408,28992,29056⟩)) (.node (.single ⟨9408,9472,28928,28992⟩) (.node (.single ⟨9408,9472,28992,29056⟩) (.single ⟨9344,9472,29056,29184⟩)))))) (.node (.node (.node (.node (.single ⟨23296,23424,3584,3712⟩) (.single ⟨23296,23360,3712,3776⟩)) (.node (.single ⟨23296,23360,3776,3840⟩) (.node (.single ⟨23360,23424,3712,3776⟩) (.single ⟨23360,23424,3776,3840⟩)))) (.node (.node (.single ⟨23424,23552,3584,3712⟩) (.single ⟨23424,23488,3712,3776⟩)) (.node (.single ⟨23424,23488,3776,3840⟩) (.node (.single ⟨23488,23552,3712,3776⟩) (.single ⟨23488,23552,3776,3840⟩))))) (.node (.node (.node (.single ⟨28928,28992,9216,9280⟩) (.single ⟨28928,28992,9280,9344⟩)) (.node (.single ⟨28992,29056,9216,9280⟩) (.node (.single ⟨28992,29056,9280,9344⟩) (.single ⟨28928,28992,9344,9408⟩)))) (.node (.node (.single ⟨28928,28992,9408,9472⟩) (.single ⟨28992,29056,9344,9408⟩)) (.node (.single ⟨28992,29056,9408,9472⟩) (.node (.single ⟨29056,29184,9216,9344⟩) (.single ⟨29056,29184,9344,9472⟩)))))))
def output12 : Fin 40 → GridBox := outputData12.get
def coverData12 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 25) (.single 38)) (.node (.single 14) (.node (.single 2) (.single 21))))) (.node (.node (.node (.single 37) (.single 18)) (.node (.single 3) (.node (.single 23) (.single 36)))) (.node (.node (.single 16) (.single 4)) (.node (.single 22) (.node (.single 35) (.single 17)))))) (.node (.node (.node (.node (.single 5) (.single 24)) (.node (.single 34) (.node (.single 15) (.single 6)))) (.node (.node (.single 26) (.single 33)) (.node (.single 13) (.node (.single 7) (.single 28))))) (.node (.node (.node (.single 32) (.single 11)) (.node (.single 8) (.node (.single 27) (.single 31)))) (.node (.node (.single 12) (.single 9)) (.node (.single 29) (.node (.single 30) (.single 10)))))))
def sourceData12 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 12) (.single 16)))) (.node (.node (.single 20) (.single 24)) (.node (.single 28) (.node (.single 32) (.single 36))))) (.node (.node (.node (.single 39) (.single 31)) (.node (.single 35) (.node (.single 27) (.single 7)))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 17) (.node (.single 13) (.single 21)))) (.node (.node (.single 5) (.single 25)) (.node (.single 33) (.node (.single 29) (.single 37))))) (.node (.node (.node (.single 38) (.single 34)) (.node (.single 30) (.node (.single 26) (.single 22)))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.node (.single 6) (.single 2)))))))
def cover12 (i : Fin 40) : Fin 40 := ⟨coverData12.get i % 40, Nat.mod_lt _ (by decide)⟩
def source12 (i : Fin 40) : Fin 40 := ⟨sourceData12.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree12 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 .empty (.cutX 3072 .empty (.cutY 23552 (.cutX 3584 .empty (.cutY 23040 .empty (.cutX 3840 (.cutY 23296 .empty (.cutX 3712 (.cutY 23424 .full .full) (.cutY 23424 (.cutX 3776 (.cutY 23360 .full .full) (.cutY 23360 .full .full)) (.cutX 3776 (.cutY 23488 .full .full) (.cutY 23488 .full .full))))) .empty))) .empty))))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 (.cutY 30720 (.cutX 9216 .empty (.cutY 29696 (.cutX 9728 (.cutY 29184 (.cutX 9472 (.cutY 28928 .empty (.cutX 9344 (.cutY 29056 (.cutX 9280 (.cutY 28992 .full .full) (.cutY 28992 .full .full)) .full) (.cutY 29056 (.cutX 9408 (.cutY 28992 .full .full) (.cutY 28992 .full .full)) .full))) .empty) .empty) .empty) .empty)) .empty) .empty)) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 .empty (.cutY 2048 .empty (.cutX 23552 (.cutY 3072 .empty (.cutX 23040 .empty (.cutY 3584 .empty (.cutX 23296 .empty (.cutY 3840 (.cutX 23424 (.cutY 3712 .full (.cutX 23360 (.cutY 3776 .full .full) (.cutY 3776 .full .full))) (.cutY 3712 .full (.cutX 23488 (.cutY 3776 .full .full) (.cutY 3776 .full .full)))) .empty))))) .empty))) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 (.cutX 29696 (.cutY 9216 .empty (.cutX 29184 (.cutY 9728 (.cutX 28928 .empty (.cutY 9472 (.cutX 29056 (.cutY 9344 (.cutX 28992 (.cutY 9280 .full .full) (.cutY 9280 .full .full)) (.cutX 28992 (.cutY 9408 .full .full) (.cutY 9408 .full .full))) (.cutY 9344 .full .full)) .empty)) .empty) .empty)) .empty) .empty) .empty) .empty)))) .empty))

theorem metadata12 : 0<77641223 ∧ 14<128 ∧ 91<128 ∧ 0<4 ∧
    1687/4160=0 ∧ 1687%4160=1687 ∧ ∀ i, (leaves12 i).Valid 8 := by
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

noncomputable def phaseMass12 : ℝ := singlePhaseMass (77641223/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw12 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass12_eq : phaseMass12 = (77641223/1638400000000 : ℝ) := by
  unfold phaseMass12
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw12 output12 cover12 source12
    (gridTreeUnionCheck_sound 32768 raw12 output12 cover12 source12 tree12 checked12)
    _ (by norm_num) _, areaUnits12]
  norm_num

-- Frozen phase 6723, atom 6043, type 1, source (16,91).
def leavesData13 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves13 : Fin 13 → DyadicLeaf := leavesData13.get
def raw13 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 16 91 leaves13 i
def outputData13 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨4096,4224,23296,23424⟩) (.node (.single ⟨4096,4224,23424,23552⟩) (.single ⟨4224,4288,23296,23360⟩))) (.node (.single ⟨4224,4288,23360,23424⟩) (.node (.single ⟨4288,4320,23296,23328⟩) (.single ⟨4288,4320,23328,23360⟩)))) (.node (.node (.single ⟨4320,4352,23296,23328⟩) (.node (.single ⟨4320,4352,23328,23360⟩) (.single ⟨4288,4352,23360,23424⟩))) (.node (.node (.single ⟨4224,4288,23424,23488⟩) (.single ⟨4224,4288,23488,23552⟩)) (.node (.single ⟨4288,4352,23424,23488⟩) (.single ⟨4288,4352,23488,23552⟩))))) (.node (.node (.node (.single ⟨9216,9280,28416,28480⟩) (.node (.single ⟨9216,9280,28480,28544⟩) (.single ⟨9280,9344,28416,28480⟩))) (.node (.single ⟨9280,9344,28480,28544⟩) (.node (.single ⟨9216,9344,28544,28672⟩) (.single ⟨9344,9408,28416,28480⟩)))) (.node (.node (.single ⟨9344,9408,28480,28544⟩) (.node (.single ⟨9408,9440,28416,28448⟩) (.single ⟨9408,9440,28448,28480⟩))) (.node (.node (.single ⟨9440,9472,28416,28448⟩) (.single ⟨9440,9472,28448,28480⟩)) (.node (.single ⟨9408,9472,28480,28544⟩) (.single ⟨9344,9472,28544,28672⟩)))))) (.node (.node (.node (.node (.single ⟨23296,23424,4096,4224⟩) (.node (.single ⟨23296,23360,4224,4288⟩) (.single ⟨23296,23328,4288,4320⟩))) (.node (.single ⟨23296,23328,4320,4352⟩) (.node (.single ⟨23328,23360,4288,4320⟩) (.single ⟨23328,23360,4320,4352⟩)))) (.node (.node (.single ⟨23360,23424,4224,4288⟩) (.node (.single ⟨23360,23424,4288,4352⟩) (.single ⟨23424,23552,4096,4224⟩))) (.node (.node (.single ⟨23424,23488,4224,4288⟩) (.single ⟨23424,23488,4288,4352⟩)) (.node (.single ⟨23488,23552,4224,4288⟩) (.single ⟨23488,23552,4288,4352⟩))))) (.node (.node (.node (.single ⟨28416,28480,9216,9280⟩) (.node (.single ⟨28416,28480,9280,9344⟩) (.single ⟨28480,28544,9216,9280⟩))) (.node (.single ⟨28480,28544,9280,9344⟩) (.node (.single ⟨28416,28480,9344,9408⟩) (.single ⟨28416,28448,9408,9440⟩)))) (.node (.node (.single ⟨28416,28448,9440,9472⟩) (.node (.single ⟨28448,28480,9408,9440⟩) (.single ⟨28448,28480,9440,9472⟩))) (.node (.node (.single ⟨28480,28544,9344,9408⟩) (.single ⟨28480,28544,9408,9472⟩)) (.node (.single ⟨28544,28672,9216,9344⟩) (.single ⟨28544,28672,9344,9472⟩)))))))
def output13 : Fin 52 → GridBox := outputData13.get
def coverData13 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 0) (.node (.single 26) (.single 51))) (.node (.single 25) (.node (.single 1) (.single 34)))) (.node (.node (.single 50) (.node (.single 17) (.single 2))) (.node (.node (.single 27) (.single 49)) (.node (.single 24) (.single 3))))) (.node (.node (.node (.single 32) (.node (.single 48) (.single 19))) (.node (.single 9) (.node (.single 35) (.single 42)))) (.node (.node (.single 16) (.node (.single 10) (.single 37))) (.node (.node (.single 41) (.single 14)) (.node (.single 8) (.single 33)))))) (.node (.node (.node (.node (.single 43) (.node (.single 18) (.single 11))) (.node (.single 36) (.node (.single 40) (.single 15)))) (.node (.node (.single 12) (.node (.single 38) (.single 39))) (.node (.node (.single 13) (.single 4)) (.node (.single 28) (.single 47))))) (.node (.node (.node (.single 23) (.node (.single 5) (.single 30))) (.node (.single 46) (.node (.single 21) (.single 6)))) (.node (.node (.single 29) (.node (.single 45) (.single 22))) (.node (.node (.single 7) (.single 31)) (.node (.single 44) (.single 20)))))))
def sourceData13 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 8))) (.node (.single 12) (.node (.single 36) (.single 40)))) (.node (.node (.single 44) (.node (.single 48) (.single 24))) (.node (.node (.single 16) (.single 20)) (.node (.single 28) (.single 32))))) (.node (.node (.node (.single 35) (.node (.single 23) (.single 31))) (.node (.single 19) (.node (.single 7) (.single 27)))) (.node (.node (.single 15) (.node (.single 51) (.single 43))) (.node (.node (.single 47) (.single 39)) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.node (.single 9) (.single 37))) (.node (.single 45) (.node (.single 41) (.single 49)))) (.node (.node (.single 13) (.node (.single 25) (.single 5))) (.node (.node (.single 17) (.single 29)) (.node (.single 21) (.single 33))))) (.node (.node (.node (.single 34) (.node (.single 30) (.single 22))) (.node (.single 18) (.node (.single 26) (.single 50)))) (.node (.node (.single 46) (.node (.single 42) (.single 38))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))))
def cover13 (i : Fin 52) : Fin 52 := ⟨coverData13.get i % 52, Nat.mod_lt _ (by decide)⟩
def source13 (i : Fin 52) : Fin 52 := ⟨sourceData13.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree13 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 .empty (.cutX 5120 (.cutY 23552 (.cutX 4608 (.cutY 23040 .empty (.cutX 4352 (.cutY 23296 .empty (.cutX 4224 (.cutY 23424 .full .full) (.cutY 23424 (.cutX 4288 (.cutY 23360 .full .full) (.cutY 23360 (.cutX 4320 (.cutY 23328 .full .full) (.cutY 23328 .full .full)) .full)) (.cutX 4288 (.cutY 23488 .full .full) (.cutY 23488 .full .full))))) .empty)) .empty) .empty) .empty)) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 .empty (.cutX 9216 .empty (.cutY 27648 .empty (.cutX 9728 (.cutY 28160 .empty (.cutX 9472 (.cutY 28416 .empty (.cutX 9344 (.cutY 28544 (.cutX 9280 (.cutY 28480 .full .full) (.cutY 28480 .full .full)) .full) (.cutY 28544 (.cutX 9408 (.cutY 28480 .full .full) (.cutY 28480 (.cutX 9440 (.cutY 28448 .full .full) (.cutY 28448 .full .full)) .full)) .full))) .empty)) .empty)))) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 (.cutX 23552 (.cutY 5120 (.cutX 23040 .empty (.cutY 4608 (.cutX 23296 .empty (.cutY 4352 (.cutX 23424 (.cutY 4224 .full (.cutX 23360 (.cutY 4288 .full (.cutX 23328 (.cutY 4320 .full .full) (.cutY 4320 .full .full))) (.cutY 4288 .full .full))) (.cutY 4224 .full (.cutX 23488 (.cutY 4288 .full .full) (.cutY 4288 .full .full)))) .empty)) .empty)) .empty) .empty) .empty)))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 (.cutX 27648 .empty (.cutY 9216 .empty (.cutX 28160 .empty (.cutY 9728 (.cutX 28416 .empty (.cutY 9472 (.cutX 28544 (.cutY 9344 (.cutX 28480 (.cutY 9280 .full .full) (.cutY 9280 .full .full)) (.cutX 28480 (.cutY 9408 .full (.cutX 28448 (.cutY 9440 .full .full) (.cutY 9440 .full .full))) (.cutY 9408 .full .full))) (.cutY 9344 .full .full)) .empty)) .empty)))) .empty)) .empty) .empty))) .empty))

theorem metadata13 : 0<192153497 ∧ 16<128 ∧ 91<128 ∧ 1<4 ∧
    6043/4160=1 ∧ 6043%4160=1883 ∧ ∀ i, (leaves13 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData13).mp
    (by decide +kernel)

theorem sourceChecked13_0 : ∀ i : Fin 52,
    (fun i => output13 i = raw13 (source13 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked13 : ∀ i : Fin 52, (fun i => output13 i = raw13 (source13 i)) i :=
  forallFin_of_zero_offset (fun i => output13 i = raw13 (source13 i)) sourceChecked13_0

theorem coverChecked13_0 : ∀ i : Fin 52,
    (fun i => (output13 (cover13 i)).ContainsBox (raw13 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked13 : ∀ i : Fin 52, (fun i => (output13 (cover13 i)).ContainsBox (raw13 i)) i :=
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

noncomputable def phaseMass13 : ℝ := singlePhaseMass (192153497/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw13 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass13_eq : phaseMass13 = (192153497/1638400000000 : ℝ) := by
  unfold phaseMass13
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw13 output13 cover13 source13
    (gridTreeUnionCheck_sound 32768 raw13 output13 cover13 source13 tree13 checked13)
    _ (by norm_num) _, areaUnits13]
  norm_num

-- Frozen phase 6724, atom 1477, type 0, source (12,85).
def leavesData14 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,2,2⟩)))) (.node (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,0⟩)) (.node (.single ⟨2,3,1⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves14 : Fin 10 → DyadicLeaf := leavesData14.get
def raw14 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 12 85 leaves14 i
def outputData14 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨3072,3200,21760,21888⟩) (.single ⟨3072,3200,21888,22016⟩)) (.node (.single ⟨3200,3264,21760,21824⟩) (.node (.single ⟨3200,3264,21824,21888⟩) (.single ⟨3264,3328,21760,21824⟩)))) (.node (.node (.single ⟨3264,3328,21824,21888⟩) (.single ⟨3200,3264,21888,21952⟩)) (.node (.single ⟨3200,3264,21952,22016⟩) (.node (.single ⟨3264,3328,21888,21952⟩) (.single ⟨3264,3328,21952,22016⟩))))) (.node (.node (.node (.single ⟨10752,10816,29440,29504⟩) (.single ⟨10752,10816,29504,29568⟩)) (.node (.single ⟨10816,10880,29440,29504⟩) (.node (.single ⟨10816,10880,29504,29568⟩) (.single ⟨10752,10880,29568,29696⟩)))) (.node (.node (.single ⟨10880,10944,29440,29504⟩) (.single ⟨10880,10944,29504,29568⟩)) (.node (.single ⟨10944,11008,29440,29504⟩) (.node (.single ⟨10944,11008,29504,29568⟩) (.single ⟨10880,11008,29568,29696⟩)))))) (.node (.node (.node (.node (.single ⟨21760,21888,3072,3200⟩) (.single ⟨21760,21824,3200,3264⟩)) (.node (.single ⟨21760,21824,3264,3328⟩) (.node (.single ⟨21824,21888,3200,3264⟩) (.single ⟨21824,21888,3264,3328⟩)))) (.node (.node (.single ⟨21888,22016,3072,3200⟩) (.single ⟨21888,21952,3200,3264⟩)) (.node (.single ⟨21888,21952,3264,3328⟩) (.node (.single ⟨21952,22016,3200,3264⟩) (.single ⟨21952,22016,3264,3328⟩))))) (.node (.node (.node (.single ⟨29440,29504,10752,10816⟩) (.single ⟨29440,29504,10816,10880⟩)) (.node (.single ⟨29504,29568,10752,10816⟩) (.node (.single ⟨29504,29568,10816,10880⟩) (.single ⟨29440,29504,10880,10944⟩)))) (.node (.node (.single ⟨29440,29504,10944,11008⟩) (.single ⟨29504,29568,10880,10944⟩)) (.node (.single ⟨29504,29568,10944,11008⟩) (.node (.single ⟨29568,29696,10752,10880⟩) (.single ⟨29568,29696,10880,11008⟩)))))))
def output14 : Fin 40 → GridBox := outputData14.get
def coverData14 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 25) (.single 38)) (.node (.single 14) (.node (.single 2) (.single 21))))) (.node (.node (.node (.single 37) (.single 18)) (.node (.single 3) (.node (.single 23) (.single 36)))) (.node (.node (.single 16) (.single 6)) (.node (.single 26) (.node (.single 33) (.single 13)))))) (.node (.node (.node (.node (.single 7) (.single 28)) (.node (.single 32) (.node (.single 11) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 8) (.node (.single 27) (.single 31)))) (.node (.node (.single 12) (.single 9)) (.node (.single 29) (.node (.single 30) (.single 10)))))))
def sourceData14 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 12) (.single 24)))) (.node (.node (.single 28) (.single 16)) (.node (.single 20) (.node (.single 32) (.single 36))))) (.node (.node (.node (.single 39) (.single 23)) (.node (.single 35) (.node (.single 19) (.single 7)))) (.node (.node (.single 31) (.single 15)) (.node (.single 27) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 25) (.node (.single 13) (.single 29)))) (.node (.node (.single 5) (.single 17)) (.node (.single 33) (.node (.single 21) (.single 37))))) (.node (.node (.node (.single 38) (.single 34)) (.node (.single 22) (.node (.single 18) (.single 30)))) (.node (.node (.single 26) (.single 14)) (.node (.single 10) (.node (.single 6) (.single 2)))))))
def cover14 (i : Fin 40) : Fin 40 := ⟨coverData14.get i % 40, Nat.mod_lt _ (by decide)⟩
def source14 (i : Fin 40) : Fin 40 := ⟨sourceData14.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree14 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 .empty (.cutY 21504 .empty (.cutX 3584 (.cutY 22016 (.cutX 3328 (.cutY 21760 .empty (.cutX 3200 (.cutY 21888 .full .full) (.cutY 21888 (.cutX 3264 (.cutY 21824 .full .full) (.cutY 21824 .full .full)) (.cutX 3264 (.cutY 21952 .full .full) (.cutY 21952 .full .full))))) .empty) .empty) .empty))) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 (.cutY 29696 (.cutX 10752 .empty (.cutY 29184 .empty (.cutX 11008 (.cutY 29440 .empty (.cutX 10880 (.cutY 29568 (.cutX 10816 (.cutY 29504 .full .full) (.cutY 29504 .full .full)) .full) (.cutY 29568 (.cutX 10944 (.cutY 29504 .full .full) (.cutY 29504 .full .full)) .full))) .empty))) .empty) .empty) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 .empty (.cutY 3072 .empty (.cutX 22016 (.cutY 3584 (.cutX 21760 .empty (.cutY 3328 (.cutX 21888 (.cutY 3200 .full (.cutX 21824 (.cutY 3264 .full .full) (.cutY 3264 .full .full))) (.cutY 3200 .full (.cutX 21952 (.cutY 3264 .full .full) (.cutY 3264 .full .full)))) .empty)) .empty) .empty)))) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 (.cutY 11264 (.cutX 29184 .empty (.cutY 10752 .empty (.cutX 29440 .empty (.cutY 11008 (.cutX 29568 (.cutY 10880 (.cutX 29504 (.cutY 10816 .full .full) (.cutY 10816 .full .full)) (.cutX 29504 (.cutY 10944 .full .full) (.cutY 10944 .full .full))) (.cutY 10880 .full .full)) .empty)))) .empty) .empty)) .empty) .empty)))) .empty))

theorem metadata14 : 0<72090291 ∧ 12<128 ∧ 85<128 ∧ 0<4 ∧
    1477/4160=0 ∧ 1477%4160=1477 ∧ ∀ i, (leaves14 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData14).mp
    (by decide +kernel)

theorem sourceChecked14_0 : ∀ i : Fin 40,
    (fun i => output14 i = raw14 (source14 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked14 : ∀ i : Fin 40, (fun i => output14 i = raw14 (source14 i)) i :=
  forallFin_of_zero_offset (fun i => output14 i = raw14 (source14 i)) sourceChecked14_0

theorem coverChecked14_0 : ∀ i : Fin 40,
    (fun i => (output14 (cover14 i)).ContainsBox (raw14 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked14 : ∀ i : Fin 40, (fun i => (output14 (cover14 i)).ContainsBox (raw14 i)) i :=
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

noncomputable def phaseMass14 : ℝ := singlePhaseMass (72090291/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw14 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass14_eq : phaseMass14 = (72090291/1638400000000 : ℝ) := by
  unfold phaseMass14
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw14 output14 cover14 source14
    (gridTreeUnionCheck_sound 32768 raw14 output14 cover14 source14 tree14 checked14)
    _ (by norm_num) _, areaUnits14]
  norm_num

-- Frozen phase 6725, atom 2673, type 0, source (25,98).
def leavesData15 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,0⟩))) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves15 : Fin 13 → DyadicLeaf := leavesData15.get
def raw15 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 25 98 leaves15 i
def outputData15 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨6400,6464,25088,25152⟩) (.node (.single ⟨6400,6464,25152,25216⟩) (.single ⟨6464,6528,25088,25152⟩))) (.node (.single ⟨6464,6528,25152,25216⟩) (.node (.single ⟨6400,6528,25216,25344⟩) (.single ⟨6528,6592,25088,25152⟩)))) (.node (.node (.single ⟨6528,6592,25152,25216⟩) (.node (.single ⟨6592,6624,25088,25120⟩) (.single ⟨6592,6624,25120,25152⟩))) (.node (.node (.single ⟨6624,6656,25088,25120⟩) (.single ⟨6624,6656,25120,25152⟩)) (.node (.single ⟨6592,6656,25152,25216⟩) (.single ⟨6528,6656,25216,25344⟩))))) (.node (.node (.node (.single ⟨7424,7552,26112,26240⟩) (.node (.single ⟨7424,7552,26240,26368⟩) (.single ⟨7552,7616,26112,26176⟩))) (.node (.single ⟨7552,7616,26176,26240⟩) (.node (.single ⟨7616,7648,26112,26144⟩) (.single ⟨7616,7648,26144,26176⟩)))) (.node (.node (.single ⟨7648,7680,26112,26144⟩) (.node (.single ⟨7648,7680,26144,26176⟩) (.single ⟨7616,7680,26176,26240⟩))) (.node (.node (.single ⟨7552,7616,26240,26304⟩) (.single ⟨7552,7616,26304,26368⟩)) (.node (.single ⟨7616,7680,26240,26304⟩) (.single ⟨7616,7680,26304,26368⟩)))))) (.node (.node (.node (.node (.single ⟨25088,25152,6400,6464⟩) (.node (.single ⟨25088,25152,6464,6528⟩) (.single ⟨25152,25216,6400,6464⟩))) (.node (.single ⟨25152,25216,6464,6528⟩) (.node (.single ⟨25088,25152,6528,6592⟩) (.single ⟨25088,25120,6592,6624⟩)))) (.node (.node (.single ⟨25088,25120,6624,6656⟩) (.node (.single ⟨25120,25152,6592,6624⟩) (.single ⟨25120,25152,6624,6656⟩))) (.node (.node (.single ⟨25152,25216,6528,6592⟩) (.single ⟨25152,25216,6592,6656⟩)) (.node (.single ⟨25216,25344,6400,6528⟩) (.single ⟨25216,25344,6528,6656⟩))))) (.node (.node (.node (.single ⟨26112,26240,7424,7552⟩) (.node (.single ⟨26112,26176,7552,7616⟩) (.single ⟨26112,26144,7616,7648⟩))) (.node (.single ⟨26112,26144,7648,7680⟩) (.node (.single ⟨26144,26176,7616,7648⟩) (.single ⟨26144,26176,7648,7680⟩)))) (.node (.node (.single ⟨26176,26240,7552,7616⟩) (.node (.single ⟨26176,26240,7616,7680⟩) (.single ⟨26240,26368,7424,7552⟩))) (.node (.node (.single ⟨26240,26304,7552,7616⟩) (.single ⟨26240,26304,7616,7680⟩)) (.node (.single ⟨26304,26368,7552,7616⟩) (.single ⟨26304,26368,7616,7680⟩)))))))
def output15 : Fin 52 → GridBox := outputData15.get
def coverData15 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 0))) (.node (.node (.single 26) (.single 51)) (.node (.single 25) (.single 1))))) (.node (.node (.node (.single 28) (.node (.single 50) (.single 23))) (.node (.single 2) (.node (.single 27) (.single 49)))) (.node (.node (.single 24) (.node (.single 3) (.single 29))) (.node (.node (.single 48) (.single 22)) (.node (.single 5) (.single 30)))))) (.node (.node (.node (.node (.single 46) (.node (.single 21) (.single 6))) (.node (.single 35) (.node (.single 45) (.single 16)))) (.node (.node (.single 11) (.node (.single 36) (.single 40))) (.node (.node (.single 15) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData15 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.single 20) (.node (.single 0) (.single 24)))) (.node (.node (.single 28) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 35))) (.node (.single 31) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.node (.single 17) (.single 13))) (.node (.single 21) (.node (.single 25) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 34) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 30) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover15 (i : Fin 52) : Fin 52 := ⟨coverData15.get i % 52, Nat.mod_lt _ (by decide)⟩
def source15 (i : Fin 52) : Fin 52 := ⟨sourceData15.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree15 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 .empty (.cutY 26624 (.cutX 7168 (.cutY 25600 (.cutX 6656 (.cutY 25088 .empty (.cutX 6400 .empty (.cutY 25344 (.cutX 6528 (.cutY 25216 (.cutX 6464 (.cutY 25152 .full .full) (.cutY 25152 .full .full)) .full) (.cutY 25216 (.cutX 6592 (.cutY 25152 .full .full) (.cutY 25152 (.cutX 6624 (.cutY 25120 .full .full) (.cutY 25120 .full .full)) .full)) .full)) .empty))) .empty) .empty) (.cutY 25600 .empty (.cutX 7680 (.cutY 26112 .empty (.cutX 7424 .empty (.cutY 26368 (.cutX 7552 (.cutY 26240 .full .full) (.cutY 26240 (.cutX 7616 (.cutY 26176 .full .full) (.cutY 26176 (.cutX 7648 (.cutY 26144 .full .full) (.cutY 26144 .full .full)) .full)) (.cutX 7616 (.cutY 26304 .full .full) (.cutY 26304 .full .full)))) .empty))) .empty))) .empty)) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 .empty (.cutX 25600 (.cutY 7168 (.cutX 25088 .empty (.cutY 6656 (.cutX 25344 (.cutY 6400 .empty (.cutX 25216 (.cutY 6528 (.cutX 25152 (.cutY 6464 .full .full) (.cutY 6464 .full .full)) (.cutX 25152 (.cutY 6592 .full (.cutX 25120 (.cutY 6624 .full .full) (.cutY 6624 .full .full))) (.cutY 6592 .full .full))) (.cutY 6528 .full .full))) .empty) .empty)) .empty) (.cutY 7168 .empty (.cutX 26112 .empty (.cutY 7680 (.cutX 26368 (.cutY 7424 .empty (.cutX 26240 (.cutY 7552 .full (.cutX 26176 (.cutY 7616 .full (.cutX 26144 (.cutY 7648 .full .full) (.cutY 7648 .full .full))) (.cutY 7616 .full .full))) (.cutY 7552 .full (.cutX 26304 (.cutY 7616 .full .full) (.cutY 7616 .full .full))))) .empty) .empty))))) .empty)) .empty) .empty)) .empty))

theorem metadata15 : 0<31548346 ∧ 25<128 ∧ 98<128 ∧ 0<4 ∧
    2673/4160=0 ∧ 2673%4160=2673 ∧ ∀ i, (leaves15 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData15).mp
    (by decide +kernel)

theorem sourceChecked15_0 : ∀ i : Fin 52,
    (fun i => output15 i = raw15 (source15 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked15 : ∀ i : Fin 52, (fun i => output15 i = raw15 (source15 i)) i :=
  forallFin_of_zero_offset (fun i => output15 i = raw15 (source15 i)) sourceChecked15_0

theorem coverChecked15_0 : ∀ i : Fin 52,
    (fun i => (output15 (cover15 i)).ContainsBox (raw15 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked15 : ∀ i : Fin 52, (fun i => (output15 (cover15 i)).ContainsBox (raw15 i)) i :=
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

noncomputable def phaseMass15 : ℝ := singlePhaseMass (31548346/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw15 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass15_eq : phaseMass15 = (15774173/819200000000 : ℝ) := by
  unfold phaseMass15
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw15 output15 cover15 source15
    (gridTreeUnionCheck_sound 32768 raw15 output15 cover15 source15 tree15 checked15)
    _ (by norm_num) _, areaUnits15]
  norm_num

-- Frozen phase 6726, atom 1583, type 0, source (13,88).
def leavesData16 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,2,2⟩)))) (.node (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,0⟩)) (.node (.single ⟨2,3,1⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves16 : Fin 10 → DyadicLeaf := leavesData16.get
def raw16 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 13 88 leaves16 i
def outputData16 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨3328,3456,22528,22656⟩) (.single ⟨3328,3456,22656,22784⟩)) (.node (.single ⟨3456,3520,22528,22592⟩) (.node (.single ⟨3456,3520,22592,22656⟩) (.single ⟨3520,3584,22528,22592⟩)))) (.node (.node (.single ⟨3520,3584,22592,22656⟩) (.single ⟨3456,3520,22656,22720⟩)) (.node (.single ⟨3456,3520,22720,22784⟩) (.node (.single ⟨3520,3584,22656,22720⟩) (.single ⟨3520,3584,22720,22784⟩))))) (.node (.node (.node (.single ⟨9984,10048,29184,29248⟩) (.single ⟨9984,10048,29248,29312⟩)) (.node (.single ⟨10048,10112,29184,29248⟩) (.node (.single ⟨10048,10112,29248,29312⟩) (.single ⟨9984,10112,29312,29440⟩)))) (.node (.node (.single ⟨10112,10176,29184,29248⟩) (.single ⟨10112,10176,29248,29312⟩)) (.node (.single ⟨10176,10240,29184,29248⟩) (.node (.single ⟨10176,10240,29248,29312⟩) (.single ⟨10112,10240,29312,29440⟩)))))) (.node (.node (.node (.node (.single ⟨22528,22656,3328,3456⟩) (.single ⟨22528,22592,3456,3520⟩)) (.node (.single ⟨22528,22592,3520,3584⟩) (.node (.single ⟨22592,22656,3456,3520⟩) (.single ⟨22592,22656,3520,3584⟩)))) (.node (.node (.single ⟨22656,22784,3328,3456⟩) (.single ⟨22656,22720,3456,3520⟩)) (.node (.single ⟨22656,22720,3520,3584⟩) (.node (.single ⟨22720,22784,3456,3520⟩) (.single ⟨22720,22784,3520,3584⟩))))) (.node (.node (.node (.single ⟨29184,29248,9984,10048⟩) (.single ⟨29184,29248,10048,10112⟩)) (.node (.single ⟨29248,29312,9984,10048⟩) (.node (.single ⟨29248,29312,10048,10112⟩) (.single ⟨29184,29248,10112,10176⟩)))) (.node (.node (.single ⟨29184,29248,10176,10240⟩) (.single ⟨29248,29312,10112,10176⟩)) (.node (.single ⟨29248,29312,10176,10240⟩) (.node (.single ⟨29312,29440,9984,10112⟩) (.single ⟨29312,29440,10112,10240⟩)))))))
def output16 : Fin 40 → GridBox := outputData16.get
def coverData16 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 25) (.single 38)) (.node (.single 14) (.node (.single 2) (.single 21))))) (.node (.node (.node (.single 37) (.single 18)) (.node (.single 3) (.node (.single 23) (.single 36)))) (.node (.node (.single 16) (.single 6)) (.node (.single 26) (.node (.single 33) (.single 13)))))) (.node (.node (.node (.node (.single 7) (.single 28)) (.node (.single 32) (.node (.single 11) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 8) (.node (.single 27) (.single 31)))) (.node (.node (.single 12) (.single 9)) (.node (.single 29) (.node (.single 30) (.single 10)))))))
def sourceData16 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 12) (.single 24)))) (.node (.node (.single 28) (.single 16)) (.node (.single 20) (.node (.single 32) (.single 36))))) (.node (.node (.node (.single 39) (.single 23)) (.node (.single 35) (.node (.single 19) (.single 7)))) (.node (.node (.single 31) (.single 15)) (.node (.single 27) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 25) (.node (.single 13) (.single 29)))) (.node (.node (.single 5) (.single 17)) (.node (.single 33) (.node (.single 21) (.single 37))))) (.node (.node (.node (.single 38) (.single 34)) (.node (.single 22) (.node (.single 18) (.single 30)))) (.node (.node (.single 26) (.single 14)) (.node (.single 10) (.node (.single 6) (.single 2)))))))
def cover16 (i : Fin 40) : Fin 40 := ⟨coverData16.get i % 40, Nat.mod_lt _ (by decide)⟩
def source16 (i : Fin 40) : Fin 40 := ⟨sourceData16.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree16 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 .empty (.cutX 3072 .empty (.cutY 23552 (.cutX 3584 (.cutY 23040 (.cutX 3328 .empty (.cutY 22784 (.cutX 3456 (.cutY 22656 .full .full) (.cutY 22656 (.cutX 3520 (.cutY 22592 .full .full) (.cutY 22592 .full .full)) (.cutX 3520 (.cutY 22720 .full .full) (.cutY 22720 .full .full)))) .empty)) .empty) .empty) .empty))))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 (.cutY 30720 (.cutX 9216 .empty (.cutY 29696 (.cutX 9728 .empty (.cutY 29184 .empty (.cutX 9984 .empty (.cutY 29440 (.cutX 10112 (.cutY 29312 (.cutX 10048 (.cutY 29248 .full .full) (.cutY 29248 .full .full)) .full) (.cutY 29312 (.cutX 10176 (.cutY 29248 .full .full) (.cutY 29248 .full .full)) .full)) .empty)))) .empty)) .empty) .empty)) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 .empty (.cutY 2048 .empty (.cutX 23552 (.cutY 3072 .empty (.cutX 23040 (.cutY 3584 (.cutX 22784 (.cutY 3328 .empty (.cutX 22656 (.cutY 3456 .full (.cutX 22592 (.cutY 3520 .full .full) (.cutY 3520 .full .full))) (.cutY 3456 .full (.cutX 22720 (.cutY 3520 .full .full) (.cutY 3520 .full .full))))) .empty) .empty) .empty)) .empty))) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 (.cutX 29696 (.cutY 9216 .empty (.cutX 29184 .empty (.cutY 9728 .empty (.cutX 29440 (.cutY 9984 .empty (.cutX 29312 (.cutY 10112 (.cutX 29248 (.cutY 10048 .full .full) (.cutY 10048 .full .full)) (.cutX 29248 (.cutY 10176 .full .full) (.cutY 10176 .full .full))) (.cutY 10112 .full .full))) .empty)))) .empty) .empty) .empty) .empty)))) .empty))

theorem metadata16 : 0<77641223 ∧ 13<128 ∧ 88<128 ∧ 0<4 ∧
    1583/4160=0 ∧ 1583%4160=1583 ∧ ∀ i, (leaves16 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData16).mp
    (by decide +kernel)

theorem sourceChecked16_0 : ∀ i : Fin 40,
    (fun i => output16 i = raw16 (source16 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked16 : ∀ i : Fin 40, (fun i => output16 i = raw16 (source16 i)) i :=
  forallFin_of_zero_offset (fun i => output16 i = raw16 (source16 i)) sourceChecked16_0

theorem coverChecked16_0 : ∀ i : Fin 40,
    (fun i => (output16 (cover16 i)).ContainsBox (raw16 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked16 : ∀ i : Fin 40, (fun i => (output16 (cover16 i)).ContainsBox (raw16 i)) i :=
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

noncomputable def phaseMass16 : ℝ := singlePhaseMass (77641223/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw16 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass16_eq : phaseMass16 = (77641223/1638400000000 : ℝ) := by
  unfold phaseMass16
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw16 output16 cover16 source16
    (gridTreeUnionCheck_sound 32768 raw16 output16 cover16 source16 tree16 checked16)
    _ (by norm_num) _, areaUnits16]
  norm_num

-- Frozen phase 6727, atom 1887, type 0, source (16,95).
def leavesData17 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves17 : Fin 7 → DyadicLeaf := leavesData17.get
def raw17 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 16 95 leaves17 i
def outputData17 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨4096,4224,24320,24448⟩) (.node (.single ⟨4096,4224,24448,24576⟩) (.single ⟨4224,4288,24320,24384⟩))) (.node (.node (.single ⟨4224,4288,24384,24448⟩) (.single ⟨4288,4352,24320,24384⟩)) (.node (.single ⟨4288,4352,24384,24448⟩) (.single ⟨4224,4352,24448,24576⟩)))) (.node (.node (.single ⟨8192,8320,28416,28544⟩) (.node (.single ⟨8192,8320,28544,28672⟩) (.single ⟨8320,8384,28416,28480⟩))) (.node (.node (.single ⟨8320,8384,28480,28544⟩) (.single ⟨8384,8448,28416,28480⟩)) (.node (.single ⟨8384,8448,28480,28544⟩) (.single ⟨8320,8448,28544,28672⟩))))) (.node (.node (.node (.single ⟨24320,24448,4096,4224⟩) (.node (.single ⟨24320,24384,4224,4288⟩) (.single ⟨24320,24384,4288,4352⟩))) (.node (.node (.single ⟨24384,24448,4224,4288⟩) (.single ⟨24384,24448,4288,4352⟩)) (.node (.single ⟨24448,24576,4096,4224⟩) (.single ⟨24448,24576,4224,4352⟩)))) (.node (.node (.single ⟨28416,28544,8192,8320⟩) (.node (.single ⟨28416,28480,8320,8384⟩) (.single ⟨28416,28480,8384,8448⟩))) (.node (.node (.single ⟨28480,28544,8320,8384⟩) (.single ⟨28480,28544,8384,8448⟩)) (.node (.single ⟨28544,28672,8192,8320⟩) (.single ⟨28544,28672,8320,8448⟩))))))
def output17 : Fin 28 → GridBox := outputData17.get
def coverData17 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData17 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover17 (i : Fin 28) : Fin 28 := ⟨coverData17.get i % 28, Nat.mod_lt _ (by decide)⟩
def source17 (i : Fin 28) : Fin 28 := ⟨sourceData17.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree17 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 .empty (.cutX 5120 (.cutY 23552 .empty (.cutX 4608 (.cutY 24064 .empty (.cutX 4352 (.cutY 24320 .empty (.cutX 4224 (.cutY 24448 .full .full) (.cutY 24448 (.cutX 4288 (.cutY 24384 .full .full) (.cutY 24384 .full .full)) .full))) .empty)) .empty)) .empty)) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 .empty (.cutX 9216 (.cutY 27648 .empty (.cutX 8704 (.cutY 28160 .empty (.cutX 8448 (.cutY 28416 .empty (.cutX 8320 (.cutY 28544 .full .full) (.cutY 28544 (.cutX 8384 (.cutY 28480 .full .full) (.cutY 28480 .full .full)) .full))) .empty)) .empty)) .empty)) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 (.cutX 23552 .empty (.cutY 5120 (.cutX 24064 .empty (.cutY 4608 (.cutX 24320 .empty (.cutY 4352 (.cutX 24448 (.cutY 4224 .full (.cutX 24384 (.cutY 4288 .full .full) (.cutY 4288 .full .full))) (.cutY 4224 .full .full)) .empty)) .empty)) .empty)) .empty)))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 (.cutX 27648 .empty (.cutY 9216 (.cutX 28160 .empty (.cutY 8704 (.cutX 28416 .empty (.cutY 8448 (.cutX 28544 (.cutY 8320 .full (.cutX 28480 (.cutY 8384 .full .full) (.cutY 8384 .full .full))) (.cutY 8320 .full .full)) .empty)) .empty)) .empty)) .empty)) .empty) .empty))) .empty))

theorem metadata17 : 0<156282496 ∧ 16<128 ∧ 95<128 ∧ 0<4 ∧
    1887/4160=0 ∧ 1887%4160=1887 ∧ ∀ i, (leaves17 i).Valid 8 := by
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

noncomputable def phaseMass17 : ℝ := singlePhaseMass (156282496/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw17 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass17_eq : phaseMass17 = (1220957/12800000000 : ℝ) := by
  unfold phaseMass17
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw17 output17 cover17 source17
    (gridTreeUnionCheck_sound 32768 raw17 output17 cover17 source17 tree17 checked17)
    _ (by norm_num) _, areaUnits17]
  norm_num

-- Frozen phase 6728, atom 5738, type 1, source (13,83).
def leavesData18 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves18 : Fin 7 → DyadicLeaf := leavesData18.get
def raw18 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 13 83 leaves18 i
def outputData18 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3328,3456,21248,21376⟩) (.node (.single ⟨3328,3456,21376,21504⟩) (.single ⟨3456,3520,21248,21312⟩))) (.node (.node (.single ⟨3456,3520,21312,21376⟩) (.single ⟨3520,3584,21248,21312⟩)) (.node (.single ⟨3520,3584,21312,21376⟩) (.single ⟨3456,3584,21376,21504⟩)))) (.node (.node (.single ⟨11264,11392,29184,29312⟩) (.node (.single ⟨11264,11392,29312,29440⟩) (.single ⟨11392,11456,29184,29248⟩))) (.node (.node (.single ⟨11392,11456,29248,29312⟩) (.single ⟨11456,11520,29184,29248⟩)) (.node (.single ⟨11456,11520,29248,29312⟩) (.single ⟨11392,11520,29312,29440⟩))))) (.node (.node (.node (.single ⟨21248,21376,3328,3456⟩) (.node (.single ⟨21248,21312,3456,3520⟩) (.single ⟨21248,21312,3520,3584⟩))) (.node (.node (.single ⟨21312,21376,3456,3520⟩) (.single ⟨21312,21376,3520,3584⟩)) (.node (.single ⟨21376,21504,3328,3456⟩) (.single ⟨21376,21504,3456,3584⟩)))) (.node (.node (.single ⟨29184,29312,11264,11392⟩) (.node (.single ⟨29184,29248,11392,11456⟩) (.single ⟨29184,29248,11456,11520⟩))) (.node (.node (.single ⟨29248,29312,11392,11456⟩) (.single ⟨29248,29312,11456,11520⟩)) (.node (.single ⟨29312,29440,11264,11392⟩) (.single ⟨29312,29440,11392,11520⟩))))))
def output18 : Fin 28 → GridBox := outputData18.get
def coverData18 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData18 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover18 (i : Fin 28) : Fin 28 := ⟨coverData18.get i % 28, Nat.mod_lt _ (by decide)⟩
def source18 (i : Fin 28) : Fin 28 := ⟨sourceData18.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree18 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 .empty (.cutY 21504 (.cutX 3584 (.cutY 20992 .empty (.cutX 3328 .empty (.cutY 21248 .empty (.cutX 3456 (.cutY 21376 .full .full) (.cutY 21376 (.cutX 3520 (.cutY 21312 .full .full) (.cutY 21312 .full .full)) .full))))) .empty) .empty)) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 .empty (.cutY 29696 (.cutX 11776 (.cutY 29184 .empty (.cutX 11520 (.cutY 29440 (.cutX 11392 (.cutY 29312 .full .full) (.cutY 29312 (.cutX 11456 (.cutY 29248 .full .full) (.cutY 29248 .full .full)) .full)) .empty) .empty)) .empty) .empty)) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 (.cutY 3072 .empty (.cutX 20992 .empty (.cutY 3584 (.cutX 21248 .empty (.cutY 3328 .empty (.cutX 21376 (.cutY 3456 .full (.cutX 21312 (.cutY 3520 .full .full) (.cutY 3520 .full .full))) (.cutY 3456 .full .full)))) .empty))) .empty)) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 (.cutY 11264 .empty (.cutX 29184 .empty (.cutY 11776 (.cutX 29440 (.cutY 11520 (.cutX 29312 (.cutY 11392 .full (.cutX 29248 (.cutY 11456 .full .full) (.cutY 11456 .full .full))) (.cutY 11392 .full .full)) .empty) .empty) .empty))) .empty)) .empty) .empty)))) .empty))

theorem metadata18 : 0<139307719 ∧ 13<128 ∧ 83<128 ∧ 1<4 ∧
    5738/4160=1 ∧ 5738%4160=1578 ∧ ∀ i, (leaves18 i).Valid 8 := by
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

noncomputable def phaseMass18 : ℝ := singlePhaseMass (139307719/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw18 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass18_eq : phaseMass18 = (139307719/1638400000000 : ℝ) := by
  unfold phaseMass18
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw18 output18 cover18 source18
    (gridTreeUnionCheck_sound 32768 raw18 output18 cover18 source18 tree18 checked18)
    _ (by norm_num) _, areaUnits18]
  norm_num

-- Frozen phase 6729, atom 5841, type 1, source (14,85).
def leavesData19 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves19 : Fin 7 → DyadicLeaf := leavesData19.get
def raw19 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 14 85 leaves19 i
def outputData19 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3584,3712,21760,21888⟩) (.node (.single ⟨3584,3712,21888,22016⟩) (.single ⟨3712,3776,21760,21824⟩))) (.node (.node (.single ⟨3712,3776,21824,21888⟩) (.single ⟨3776,3840,21760,21824⟩)) (.node (.single ⟨3776,3840,21824,21888⟩) (.single ⟨3712,3840,21888,22016⟩)))) (.node (.node (.single ⟨10752,10880,28928,29056⟩) (.node (.single ⟨10752,10880,29056,29184⟩) (.single ⟨10880,10944,28928,28992⟩))) (.node (.node (.single ⟨10880,10944,28992,29056⟩) (.single ⟨10944,11008,28928,28992⟩)) (.node (.single ⟨10944,11008,28992,29056⟩) (.single ⟨10880,11008,29056,29184⟩))))) (.node (.node (.node (.single ⟨21760,21888,3584,3712⟩) (.node (.single ⟨21760,21824,3712,3776⟩) (.single ⟨21760,21824,3776,3840⟩))) (.node (.node (.single ⟨21824,21888,3712,3776⟩) (.single ⟨21824,21888,3776,3840⟩)) (.node (.single ⟨21888,22016,3584,3712⟩) (.single ⟨21888,22016,3712,3840⟩)))) (.node (.node (.single ⟨28928,29056,10752,10880⟩) (.node (.single ⟨28928,28992,10880,10944⟩) (.single ⟨28928,28992,10944,11008⟩))) (.node (.node (.single ⟨28992,29056,10880,10944⟩) (.single ⟨28992,29056,10944,11008⟩)) (.node (.single ⟨29056,29184,10752,10880⟩) (.single ⟨29056,29184,10880,11008⟩))))))
def output19 : Fin 28 → GridBox := outputData19.get
def coverData19 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData19 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover19 (i : Fin 28) : Fin 28 := ⟨coverData19.get i % 28, Nat.mod_lt _ (by decide)⟩
def source19 (i : Fin 28) : Fin 28 := ⟨sourceData19.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree19 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 .empty (.cutY 21504 .empty (.cutX 3584 .empty (.cutY 22016 (.cutX 3840 (.cutY 21760 .empty (.cutX 3712 (.cutY 21888 .full .full) (.cutY 21888 (.cutX 3776 (.cutY 21824 .full .full) (.cutY 21824 .full .full)) .full))) .empty) .empty)))) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 (.cutY 29696 (.cutX 10752 .empty (.cutY 29184 (.cutX 11008 (.cutY 28928 .empty (.cutX 10880 (.cutY 29056 .full .full) (.cutY 29056 (.cutX 10944 (.cutY 28992 .full .full) (.cutY 28992 .full .full)) .full))) .empty) .empty)) .empty) .empty) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 .empty (.cutY 3072 .empty (.cutX 22016 (.cutY 3584 .empty (.cutX 21760 .empty (.cutY 3840 (.cutX 21888 (.cutY 3712 .full (.cutX 21824 (.cutY 3776 .full .full) (.cutY 3776 .full .full))) (.cutY 3712 .full .full)) .empty))) .empty)))) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 (.cutY 11264 (.cutX 29184 (.cutY 10752 .empty (.cutX 28928 .empty (.cutY 11008 (.cutX 29056 (.cutY 10880 .full (.cutX 28992 (.cutY 10944 .full .full) (.cutY 10944 .full .full))) (.cutY 10880 .full .full)) .empty))) .empty) .empty) .empty)) .empty) .empty)))) .empty))

theorem metadata19 : 0<139307719 ∧ 14<128 ∧ 85<128 ∧ 1<4 ∧
    5841/4160=1 ∧ 5841%4160=1681 ∧ ∀ i, (leaves19 i).Valid 8 := by
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

noncomputable def phaseMass19 : ℝ := singlePhaseMass (139307719/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw19 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass19_eq : phaseMass19 = (139307719/1638400000000 : ℝ) := by
  unfold phaseMass19
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw19 output19 cover19 source19
    (gridTreeUnionCheck_sound 32768 raw19 output19 cover19 source19 tree19 checked19)
    _ (by norm_num) _, areaUnits19]
  norm_num

-- Frozen phase 6730, atom 5943, type 1, source (15,88).
def leavesData20 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,2,2⟩)))) (.node (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,0⟩)) (.node (.single ⟨2,3,1⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves20 : Fin 10 → DyadicLeaf := leavesData20.get
def raw20 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 15 88 leaves20 i
def outputData20 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨3840,3968,22528,22656⟩) (.single ⟨3840,3968,22656,22784⟩)) (.node (.single ⟨3968,4032,22528,22592⟩) (.node (.single ⟨3968,4032,22592,22656⟩) (.single ⟨4032,4096,22528,22592⟩)))) (.node (.node (.single ⟨4032,4096,22592,22656⟩) (.single ⟨3968,4032,22656,22720⟩)) (.node (.single ⟨3968,4032,22720,22784⟩) (.node (.single ⟨4032,4096,22656,22720⟩) (.single ⟨4032,4096,22720,22784⟩))))) (.node (.node (.node (.single ⟨9984,10048,28672,28736⟩) (.single ⟨9984,10048,28736,28800⟩)) (.node (.single ⟨10048,10112,28672,28736⟩) (.node (.single ⟨10048,10112,28736,28800⟩) (.single ⟨9984,10112,28800,28928⟩)))) (.node (.node (.single ⟨10112,10176,28672,28736⟩) (.single ⟨10112,10176,28736,28800⟩)) (.node (.single ⟨10176,10240,28672,28736⟩) (.node (.single ⟨10176,10240,28736,28800⟩) (.single ⟨10112,10240,28800,28928⟩)))))) (.node (.node (.node (.node (.single ⟨22528,22656,3840,3968⟩) (.single ⟨22528,22592,3968,4032⟩)) (.node (.single ⟨22528,22592,4032,4096⟩) (.node (.single ⟨22592,22656,3968,4032⟩) (.single ⟨22592,22656,4032,4096⟩)))) (.node (.node (.single ⟨22656,22784,3840,3968⟩) (.single ⟨22656,22720,3968,4032⟩)) (.node (.single ⟨22656,22720,4032,4096⟩) (.node (.single ⟨22720,22784,3968,4032⟩) (.single ⟨22720,22784,4032,4096⟩))))) (.node (.node (.node (.single ⟨28672,28736,9984,10048⟩) (.single ⟨28672,28736,10048,10112⟩)) (.node (.single ⟨28736,28800,9984,10048⟩) (.node (.single ⟨28736,28800,10048,10112⟩) (.single ⟨28672,28736,10112,10176⟩)))) (.node (.node (.single ⟨28672,28736,10176,10240⟩) (.single ⟨28736,28800,10112,10176⟩)) (.node (.single ⟨28736,28800,10176,10240⟩) (.node (.single ⟨28800,28928,9984,10112⟩) (.single ⟨28800,28928,10112,10240⟩)))))))
def output20 : Fin 40 → GridBox := outputData20.get
def coverData20 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 25) (.single 38)) (.node (.single 14) (.node (.single 2) (.single 21))))) (.node (.node (.node (.single 37) (.single 18)) (.node (.single 3) (.node (.single 23) (.single 36)))) (.node (.node (.single 16) (.single 6)) (.node (.single 26) (.node (.single 33) (.single 13)))))) (.node (.node (.node (.node (.single 7) (.single 28)) (.node (.single 32) (.node (.single 11) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 8) (.node (.single 27) (.single 31)))) (.node (.node (.single 12) (.single 9)) (.node (.single 29) (.node (.single 30) (.single 10)))))))
def sourceData20 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 12) (.single 24)))) (.node (.node (.single 28) (.single 16)) (.node (.single 20) (.node (.single 32) (.single 36))))) (.node (.node (.node (.single 39) (.single 23)) (.node (.single 35) (.node (.single 19) (.single 7)))) (.node (.node (.single 31) (.single 15)) (.node (.single 27) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 25) (.node (.single 13) (.single 29)))) (.node (.node (.single 5) (.single 17)) (.node (.single 33) (.node (.single 21) (.single 37))))) (.node (.node (.node (.single 38) (.single 34)) (.node (.single 22) (.node (.single 18) (.single 30)))) (.node (.node (.single 26) (.single 14)) (.node (.single 10) (.node (.single 6) (.single 2)))))))
def cover20 (i : Fin 40) : Fin 40 := ⟨coverData20.get i % 40, Nat.mod_lt _ (by decide)⟩
def source20 (i : Fin 40) : Fin 40 := ⟨sourceData20.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree20 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 .empty (.cutX 3072 .empty (.cutY 23552 (.cutX 3584 .empty (.cutY 23040 (.cutX 3840 .empty (.cutY 22784 (.cutX 3968 (.cutY 22656 .full .full) (.cutY 22656 (.cutX 4032 (.cutY 22592 .full .full) (.cutY 22592 .full .full)) (.cutX 4032 (.cutY 22720 .full .full) (.cutY 22720 .full .full)))) .empty)) .empty)) .empty))))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 (.cutY 30720 (.cutX 9216 .empty (.cutY 29696 (.cutX 9728 .empty (.cutY 29184 (.cutX 9984 .empty (.cutY 28928 (.cutX 10112 (.cutY 28800 (.cutX 10048 (.cutY 28736 .full .full) (.cutY 28736 .full .full)) .full) (.cutY 28800 (.cutX 10176 (.cutY 28736 .full .full) (.cutY 28736 .full .full)) .full)) .empty)) .empty)) .empty)) .empty) .empty)) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 .empty (.cutY 2048 .empty (.cutX 23552 (.cutY 3072 .empty (.cutX 23040 (.cutY 3584 .empty (.cutX 22784 (.cutY 3840 .empty (.cutX 22656 (.cutY 3968 .full (.cutX 22592 (.cutY 4032 .full .full) (.cutY 4032 .full .full))) (.cutY 3968 .full (.cutX 22720 (.cutY 4032 .full .full) (.cutY 4032 .full .full))))) .empty)) .empty)) .empty))) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 (.cutX 29696 (.cutY 9216 .empty (.cutX 29184 (.cutY 9728 .empty (.cutX 28928 (.cutY 9984 .empty (.cutX 28800 (.cutY 10112 (.cutX 28736 (.cutY 10048 .full .full) (.cutY 10048 .full .full)) (.cutX 28736 (.cutY 10176 .full .full) (.cutY 10176 .full .full))) (.cutY 10112 .full .full))) .empty)) .empty)) .empty) .empty) .empty) .empty)))) .empty))

theorem metadata20 : 0<112823226 ∧ 15<128 ∧ 88<128 ∧ 1<4 ∧
    5943/4160=1 ∧ 5943%4160=1783 ∧ ∀ i, (leaves20 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData20).mp
    (by decide +kernel)

theorem sourceChecked20_0 : ∀ i : Fin 40,
    (fun i => output20 i = raw20 (source20 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked20 : ∀ i : Fin 40, (fun i => output20 i = raw20 (source20 i)) i :=
  forallFin_of_zero_offset (fun i => output20 i = raw20 (source20 i)) sourceChecked20_0

theorem coverChecked20_0 : ∀ i : Fin 40,
    (fun i => (output20 (cover20 i)).ContainsBox (raw20 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked20 : ∀ i : Fin 40, (fun i => (output20 (cover20 i)).ContainsBox (raw20 i)) i :=
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

noncomputable def phaseMass20 : ℝ := singlePhaseMass (112823226/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw20 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass20_eq : phaseMass20 = (56411613/819200000000 : ℝ) := by
  unfold phaseMass20
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw20 output20 cover20 source20
    (gridTreeUnionCheck_sound 32768 raw20 output20 cover20 source20 tree20 checked20)
    _ (by norm_num) _, areaUnits20]
  norm_num

-- Frozen phase 6731, atom 6044, type 1, source (16,92).
def leavesData21 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,2,2⟩)) (.node (.single ⟨2,2,3⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves21 : Fin 10 → DyadicLeaf := leavesData21.get
def raw21 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 16 92 leaves21 i
def outputData21 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨4096,4224,23552,23680⟩) (.single ⟨4096,4224,23680,23808⟩)) (.node (.single ⟨4224,4288,23552,23616⟩) (.node (.single ⟨4224,4288,23616,23680⟩) (.single ⟨4288,4352,23552,23616⟩)))) (.node (.node (.single ⟨4288,4352,23616,23680⟩) (.single ⟨4224,4288,23680,23744⟩)) (.node (.single ⟨4224,4288,23744,23808⟩) (.node (.single ⟨4288,4352,23680,23744⟩) (.single ⟨4288,4352,23744,23808⟩))))) (.node (.node (.node (.single ⟨8960,9024,28416,28480⟩) (.single ⟨8960,9024,28480,28544⟩)) (.node (.single ⟨9024,9088,28416,28480⟩) (.node (.single ⟨9024,9088,28480,28544⟩) (.single ⟨8960,9088,28544,28672⟩)))) (.node (.node (.single ⟨9088,9152,28416,28480⟩) (.single ⟨9088,9152,28480,28544⟩)) (.node (.single ⟨9152,9216,28416,28480⟩) (.node (.single ⟨9152,9216,28480,28544⟩) (.single ⟨9088,9216,28544,28672⟩)))))) (.node (.node (.node (.node (.single ⟨23552,23680,4096,4224⟩) (.single ⟨23552,23616,4224,4288⟩)) (.node (.single ⟨23552,23616,4288,4352⟩) (.node (.single ⟨23616,23680,4224,4288⟩) (.single ⟨23616,23680,4288,4352⟩)))) (.node (.node (.single ⟨23680,23808,4096,4224⟩) (.single ⟨23680,23744,4224,4288⟩)) (.node (.single ⟨23680,23744,4288,4352⟩) (.node (.single ⟨23744,23808,4224,4288⟩) (.single ⟨23744,23808,4288,4352⟩))))) (.node (.node (.node (.single ⟨28416,28480,8960,9024⟩) (.single ⟨28416,28480,9024,9088⟩)) (.node (.single ⟨28480,28544,8960,9024⟩) (.node (.single ⟨28480,28544,9024,9088⟩) (.single ⟨28416,28480,9088,9152⟩)))) (.node (.node (.single ⟨28416,28480,9152,9216⟩) (.single ⟨28480,28544,9088,9152⟩)) (.node (.single ⟨28480,28544,9152,9216⟩) (.node (.single ⟨28544,28672,8960,9088⟩) (.single ⟨28544,28672,9088,9216⟩)))))))
def output21 : Fin 40 → GridBox := outputData21.get
def coverData21 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 25) (.single 38)) (.node (.single 14) (.node (.single 2) (.single 21))))) (.node (.node (.node (.single 37) (.single 18)) (.node (.single 3) (.node (.single 23) (.single 36)))) (.node (.node (.single 16) (.single 4)) (.node (.single 22) (.node (.single 35) (.single 17)))))) (.node (.node (.node (.node (.single 5) (.single 24)) (.node (.single 34) (.node (.single 15) (.single 6)))) (.node (.node (.single 26) (.single 33)) (.node (.single 13) (.node (.single 7) (.single 28))))) (.node (.node (.node (.single 32) (.single 11)) (.node (.single 8) (.node (.single 27) (.single 31)))) (.node (.node (.single 12) (.single 9)) (.node (.single 29) (.node (.single 30) (.single 10)))))))
def sourceData21 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 12) (.single 16)))) (.node (.node (.single 20) (.single 24)) (.node (.single 28) (.node (.single 32) (.single 36))))) (.node (.node (.node (.single 39) (.single 31)) (.node (.single 35) (.node (.single 27) (.single 7)))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 17) (.node (.single 13) (.single 21)))) (.node (.node (.single 5) (.single 25)) (.node (.single 33) (.node (.single 29) (.single 37))))) (.node (.node (.node (.single 38) (.single 34)) (.node (.single 30) (.node (.single 26) (.single 22)))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.node (.single 6) (.single 2)))))))
def cover21 (i : Fin 40) : Fin 40 := ⟨coverData21.get i % 40, Nat.mod_lt _ (by decide)⟩
def source21 (i : Fin 40) : Fin 40 := ⟨sourceData21.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree21 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 .empty (.cutX 5120 (.cutY 23552 .empty (.cutX 4608 (.cutY 24064 (.cutX 4352 (.cutY 23808 (.cutX 4224 (.cutY 23680 .full .full) (.cutY 23680 (.cutX 4288 (.cutY 23616 .full .full) (.cutY 23616 .full .full)) (.cutX 4288 (.cutY 23744 .full .full) (.cutY 23744 .full .full)))) .empty) .empty) .empty) .empty)) .empty)) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 .empty (.cutX 9216 (.cutY 27648 .empty (.cutX 8704 .empty (.cutY 28160 .empty (.cutX 8960 .empty (.cutY 28416 .empty (.cutX 9088 (.cutY 28544 (.cutX 9024 (.cutY 28480 .full .full) (.cutY 28480 .full .full)) .full) (.cutY 28544 (.cutX 9152 (.cutY 28480 .full .full) (.cutY 28480 .full .full)) .full))))))) .empty)) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 (.cutX 23552 .empty (.cutY 5120 (.cutX 24064 (.cutY 4608 (.cutX 23808 (.cutY 4352 (.cutX 23680 (.cutY 4224 .full (.cutX 23616 (.cutY 4288 .full .full) (.cutY 4288 .full .full))) (.cutY 4224 .full (.cutX 23744 (.cutY 4288 .full .full) (.cutY 4288 .full .full)))) .empty) .empty) .empty) .empty) .empty)) .empty)))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 (.cutX 27648 .empty (.cutY 9216 (.cutX 28160 .empty (.cutY 8704 .empty (.cutX 28416 .empty (.cutY 8960 .empty (.cutX 28544 (.cutY 9088 (.cutX 28480 (.cutY 9024 .full .full) (.cutY 9024 .full .full)) (.cutX 28480 (.cutY 9152 .full .full) (.cutY 9152 .full .full))) (.cutY 9088 .full .full)))))) .empty)) .empty)) .empty) .empty))) .empty))

theorem metadata21 : 0<192153497 ∧ 16<128 ∧ 92<128 ∧ 1<4 ∧
    6044/4160=1 ∧ 6044%4160=1884 ∧ ∀ i, (leaves21 i).Valid 8 := by
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

noncomputable def phaseMass21 : ℝ := singlePhaseMass (192153497/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw21 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass21_eq : phaseMass21 = (192153497/1638400000000 : ℝ) := by
  unfold phaseMass21
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw21 output21 cover21 source21
    (gridTreeUnionCheck_sound 32768 raw21 output21 cover21 source21 tree21 checked21)
    _ (by norm_num) _, areaUnits21]
  norm_num

-- Frozen phase 6732, atom 6140, type 1, source (17,93).
def leavesData22 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,2,2⟩)))) (.node (.node (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,1⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves22 : Fin 16 → DyadicLeaf := leavesData22.get
def raw22 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 17 93 leaves22 i
def outputData22 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨4352,4416,23808,23872⟩) (.single ⟨4352,4416,23872,23936⟩)) (.node (.single ⟨4416,4480,23808,23872⟩) (.single ⟨4416,4480,23872,23936⟩))) (.node (.node (.single ⟨4352,4480,23936,24064⟩) (.single ⟨4480,4544,23808,23872⟩)) (.node (.single ⟨4480,4544,23872,23936⟩) (.single ⟨4544,4576,23808,23840⟩)))) (.node (.node (.node (.single ⟨4544,4576,23840,23872⟩) (.single ⟨4576,4608,23808,23840⟩)) (.node (.single ⟨4576,4608,23840,23872⟩) (.single ⟨4544,4608,23872,23936⟩))) (.node (.node (.single ⟨4480,4544,23936,24000⟩) (.single ⟨4480,4544,24000,24064⟩)) (.node (.single ⟨4544,4608,23936,24000⟩) (.single ⟨4544,4608,24000,24064⟩))))) (.node (.node (.node (.node (.single ⟨8704,8768,28160,28224⟩) (.single ⟨8704,8768,28224,28288⟩)) (.node (.single ⟨8768,8832,28160,28224⟩) (.single ⟨8768,8832,28224,28288⟩))) (.node (.node (.single ⟨8704,8832,28288,28416⟩) (.single ⟨8832,8896,28160,28224⟩)) (.node (.single ⟨8832,8896,28224,28288⟩) (.single ⟨8896,8928,28160,28192⟩)))) (.node (.node (.node (.single ⟨8896,8928,28192,28224⟩) (.single ⟨8928,8960,28160,28192⟩)) (.node (.single ⟨8928,8960,28192,28224⟩) (.single ⟨8896,8960,28224,28288⟩))) (.node (.node (.single ⟨8832,8896,28288,28352⟩) (.single ⟨8832,8896,28352,28416⟩)) (.node (.single ⟨8896,8960,28288,28352⟩) (.single ⟨8896,8960,28352,28416⟩)))))) (.node (.node (.node (.node (.node (.single ⟨23808,23872,4352,4416⟩) (.single ⟨23808,23872,4416,4480⟩)) (.node (.single ⟨23872,23936,4352,4416⟩) (.single ⟨23872,23936,4416,4480⟩))) (.node (.node (.single ⟨23808,23872,4480,4544⟩) (.single ⟨23808,23840,4544,4576⟩)) (.node (.single ⟨23808,23840,4576,4608⟩) (.single ⟨23840,23872,4544,4576⟩)))) (.node (.node (.node (.single ⟨23840,23872,4576,4608⟩) (.single ⟨23872,23936,4480,4544⟩)) (.node (.single ⟨23872,23936,4544,4608⟩) (.single ⟨23936,24064,4352,4480⟩))) (.node (.node (.single ⟨23936,24000,4480,4544⟩) (.single ⟨23936,24000,4544,4608⟩)) (.node (.single ⟨24000,24064,4480,4544⟩) (.single ⟨24000,24064,4544,4608⟩))))) (.node (.node (.node (.node (.single ⟨28160,28224,8704,8768⟩) (.single ⟨28160,28224,8768,8832⟩)) (.node (.single ⟨28224,28288,8704,8768⟩) (.single ⟨28224,28288,8768,8832⟩))) (.node (.node (.single ⟨28160,28224,8832,8896⟩) (.single ⟨28160,28192,8896,8928⟩)) (.node (.single ⟨28160,28192,8928,8960⟩) (.single ⟨28192,28224,8896,8928⟩)))) (.node (.node (.node (.single ⟨28192,28224,8928,8960⟩) (.single ⟨28224,28288,8832,8896⟩)) (.node (.single ⟨28224,28288,8896,8960⟩) (.single ⟨28288,28416,8704,8832⟩))) (.node (.node (.single ⟨28288,28352,8832,8896⟩) (.single ⟨28288,28352,8896,8960⟩)) (.node (.single ⟨28352,28416,8832,8896⟩) (.single ⟨28352,28416,8896,8960⟩)))))))
def output22 : Fin 64 → GridBox := outputData22.get
def coverData22 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 43)) (.node (.single 59) (.single 20))) (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31)))) (.node (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29))) (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30))))) (.node (.node (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28))) (.node (.node (.single 5) (.single 36)) (.node (.single 58) (.single 27)))) (.node (.node (.node (.single 6) (.single 41)) (.node (.single 57) (.single 22))) (.node (.node (.single 12) (.single 44)) (.node (.single 51) (.single 19)))))) (.node (.node (.node (.node (.node (.single 13) (.single 46)) (.node (.single 50) (.single 17))) (.node (.node (.single 11) (.single 42)) (.node (.single 52) (.single 21)))) (.node (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16))))) (.node (.node (.node (.node (.single 7) (.single 37)) (.node (.single 56) (.single 26))) (.node (.node (.single 8) (.single 39)) (.node (.single 55) (.single 24)))) (.node (.node (.node (.single 9) (.single 38)) (.node (.single 54) (.single 25))) (.node (.node (.single 10) (.single 40)) (.node (.single 53) (.single 23)))))))
def sourceData22 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 8)) (.node (.single 12) (.single 16))) (.node (.node (.single 0) (.single 20)) (.node (.single 24) (.single 48)))) (.node (.node (.node (.single 52) (.single 56)) (.node (.single 60) (.single 36))) (.node (.node (.single 28) (.single 32)) (.node (.single 40) (.single 44))))) (.node (.node (.node (.node (.single 47) (.single 35)) (.node (.single 43) (.single 31))) (.node (.node (.single 3) (.single 39)) (.node (.single 27) (.single 63)))) (.node (.node (.node (.single 55) (.single 59)) (.node (.single 51) (.single 23))) (.node (.node (.single 19) (.single 11)) (.node (.single 15) (.single 7)))))) (.node (.node (.node (.node (.node (.single 5) (.single 13)) (.node (.single 9) (.single 17))) (.node (.node (.single 21) (.single 49)) (.node (.single 57) (.single 53)))) (.node (.node (.node (.single 61) (.single 25)) (.node (.single 37) (.single 1))) (.node (.node (.single 29) (.single 41)) (.node (.single 33) (.single 45))))) (.node (.node (.node (.node (.single 46) (.single 42)) (.node (.single 34) (.single 30))) (.node (.node (.single 38) (.single 62)) (.node (.single 58) (.single 54)))) (.node (.node (.node (.single 50) (.single 26)) (.node (.single 22) (.single 2))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.single 6)))))))
def cover22 (i : Fin 64) : Fin 64 := ⟨coverData22.get i % 64, Nat.mod_lt _ (by decide)⟩
def source22 (i : Fin 64) : Fin 64 := ⟨sourceData22.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree22 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 .empty (.cutX 5120 (.cutY 23552 .empty (.cutX 4608 (.cutY 24064 (.cutX 4352 .empty (.cutY 23808 .empty (.cutX 4480 (.cutY 23936 (.cutX 4416 (.cutY 23872 .full .full) (.cutY 23872 .full .full)) .full) (.cutY 23936 (.cutX 4544 (.cutY 23872 .full .full) (.cutY 23872 (.cutX 4576 (.cutY 23840 .full .full) (.cutY 23840 .full .full)) .full)) (.cutX 4544 (.cutY 24000 .full .full) (.cutY 24000 .full .full)))))) .empty) .empty)) .empty)) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 .empty (.cutX 9216 (.cutY 27648 .empty (.cutX 8704 .empty (.cutY 28160 .empty (.cutX 8960 (.cutY 28416 (.cutX 8832 (.cutY 28288 (.cutX 8768 (.cutY 28224 .full .full) (.cutY 28224 .full .full)) .full) (.cutY 28288 (.cutX 8896 (.cutY 28224 .full .full) (.cutY 28224 (.cutX 8928 (.cutY 28192 .full .full) (.cutY 28192 .full .full)) .full)) (.cutX 8896 (.cutY 28352 .full .full) (.cutY 28352 .full .full)))) .empty) .empty)))) .empty)) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 (.cutX 23552 .empty (.cutY 5120 (.cutX 24064 (.cutY 4608 (.cutX 23808 .empty (.cutY 4352 .empty (.cutX 23936 (.cutY 4480 (.cutX 23872 (.cutY 4416 .full .full) (.cutY 4416 .full .full)) (.cutX 23872 (.cutY 4544 .full (.cutX 23840 (.cutY 4576 .full .full) (.cutY 4576 .full .full))) (.cutY 4544 .full .full))) (.cutY 4480 .full (.cutX 24000 (.cutY 4544 .full .full) (.cutY 4544 .full .full)))))) .empty) .empty) .empty)) .empty)))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 (.cutX 27648 .empty (.cutY 9216 (.cutX 28160 .empty (.cutY 8704 .empty (.cutX 28416 (.cutY 8960 (.cutX 28288 (.cutY 8832 (.cutX 28224 (.cutY 8768 .full .full) (.cutY 8768 .full .full)) (.cutX 28224 (.cutY 8896 .full (.cutX 28192 (.cutY 8928 .full .full) (.cutY 8928 .full .full))) (.cutY 8896 .full .full))) (.cutY 8832 .full (.cutX 28352 (.cutY 8896 .full .full) (.cutY 8896 .full .full)))) .empty) .empty))) .empty)) .empty)) .empty) .empty))) .empty))

theorem metadata22 : 0<192153497 ∧ 17<128 ∧ 93<128 ∧ 1<4 ∧
    6140/4160=1 ∧ 6140%4160=1980 ∧ ∀ i, (leaves22 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData22).mp
    (by decide +kernel)

theorem sourceChecked22_0 : ∀ i : Fin 64,
    (fun i => output22 i = raw22 (source22 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked22 : ∀ i : Fin 64, (fun i => output22 i = raw22 (source22 i)) i :=
  forallFin_of_zero_offset (fun i => output22 i = raw22 (source22 i)) sourceChecked22_0

theorem coverChecked22_0 : ∀ i : Fin 64,
    (fun i => (output22 (cover22 i)).ContainsBox (raw22 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked22 : ∀ i : Fin 64, (fun i => (output22 (cover22 i)).ContainsBox (raw22 i)) i :=
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

noncomputable def phaseMass22 : ℝ := singlePhaseMass (192153497/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw22 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass22_eq : phaseMass22 = (192153497/1638400000000 : ℝ) := by
  unfold phaseMass22
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw22 output22 cover22 source22
    (gridTreeUnionCheck_sound 32768 raw22 output22 cover22 source22 tree22 checked22)
    _ (by norm_num) _, areaUnits22]
  norm_num

-- Frozen phase 6733, atom 1688, type 0, source (14,92).
def leavesData23 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves23 : Fin 7 → DyadicLeaf := leavesData23.get
def raw23 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 14 92 leaves23 i
def outputData23 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3584,3712,23552,23680⟩) (.node (.single ⟨3584,3712,23680,23808⟩) (.single ⟨3712,3776,23552,23616⟩))) (.node (.node (.single ⟨3712,3776,23616,23680⟩) (.single ⟨3776,3840,23552,23616⟩)) (.node (.single ⟨3776,3840,23616,23680⟩) (.single ⟨3712,3840,23680,23808⟩)))) (.node (.node (.single ⟨8960,9088,28928,29056⟩) (.node (.single ⟨8960,9088,29056,29184⟩) (.single ⟨9088,9152,28928,28992⟩))) (.node (.node (.single ⟨9088,9152,28992,29056⟩) (.single ⟨9152,9216,28928,28992⟩)) (.node (.single ⟨9152,9216,28992,29056⟩) (.single ⟨9088,9216,29056,29184⟩))))) (.node (.node (.node (.single ⟨23552,23680,3584,3712⟩) (.node (.single ⟨23552,23616,3712,3776⟩) (.single ⟨23552,23616,3776,3840⟩))) (.node (.node (.single ⟨23616,23680,3712,3776⟩) (.single ⟨23616,23680,3776,3840⟩)) (.node (.single ⟨23680,23808,3584,3712⟩) (.single ⟨23680,23808,3712,3840⟩)))) (.node (.node (.single ⟨28928,29056,8960,9088⟩) (.node (.single ⟨28928,28992,9088,9152⟩) (.single ⟨28928,28992,9152,9216⟩))) (.node (.node (.single ⟨28992,29056,9088,9152⟩) (.single ⟨28992,29056,9152,9216⟩)) (.node (.single ⟨29056,29184,8960,9088⟩) (.single ⟨29056,29184,9088,9216⟩))))))
def output23 : Fin 28 → GridBox := outputData23.get
def coverData23 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData23 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover23 (i : Fin 28) : Fin 28 := ⟨coverData23.get i % 28, Nat.mod_lt _ (by decide)⟩
def source23 (i : Fin 28) : Fin 28 := ⟨sourceData23.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree23 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 .empty (.cutX 3072 .empty (.cutY 23552 .empty (.cutX 3584 .empty (.cutY 24064 (.cutX 3840 (.cutY 23808 (.cutX 3712 (.cutY 23680 .full .full) (.cutY 23680 (.cutX 3776 (.cutY 23616 .full .full) (.cutY 23616 .full .full)) .full)) .empty) .empty) .empty))))))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 (.cutY 30720 (.cutX 9216 (.cutY 29696 (.cutX 8704 .empty (.cutY 29184 (.cutX 8960 .empty (.cutY 28928 .empty (.cutX 9088 (.cutY 29056 .full .full) (.cutY 29056 (.cutX 9152 (.cutY 28992 .full .full) (.cutY 28992 .full .full)) .full)))) .empty)) .empty) .empty) .empty) .empty)) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 .empty (.cutY 2048 .empty (.cutX 23552 .empty (.cutY 3072 .empty (.cutX 24064 (.cutY 3584 .empty (.cutX 23808 (.cutY 3840 (.cutX 23680 (.cutY 3712 .full (.cutX 23616 (.cutY 3776 .full .full) (.cutY 3776 .full .full))) (.cutY 3712 .full .full)) .empty) .empty)) .empty))))) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 (.cutX 29696 (.cutY 9216 (.cutX 29184 (.cutY 8704 .empty (.cutX 28928 .empty (.cutY 8960 .empty (.cutX 29056 (.cutY 9088 .full (.cutX 28992 (.cutY 9152 .full .full) (.cutY 9152 .full .full))) (.cutY 9088 .full .full))))) .empty) .empty) .empty) .empty) .empty) .empty)))) .empty))

theorem metadata23 : 0<77641223 ∧ 14<128 ∧ 92<128 ∧ 0<4 ∧
    1688/4160=0 ∧ 1688%4160=1688 ∧ ∀ i, (leaves23 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData23).mp
    (by decide +kernel)

theorem sourceChecked23_0 : ∀ i : Fin 28,
    (fun i => output23 i = raw23 (source23 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked23 : ∀ i : Fin 28, (fun i => output23 i = raw23 (source23 i)) i :=
  forallFin_of_zero_offset (fun i => output23 i = raw23 (source23 i)) sourceChecked23_0

theorem coverChecked23_0 : ∀ i : Fin 28,
    (fun i => (output23 (cover23 i)).ContainsBox (raw23 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked23 : ∀ i : Fin 28, (fun i => (output23 (cover23 i)).ContainsBox (raw23 i)) i :=
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

noncomputable def phaseMass23 : ℝ := singlePhaseMass (77641223/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw23 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass23_eq : phaseMass23 = (77641223/1638400000000 : ℝ) := by
  unfold phaseMass23
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw23 output23 cover23 source23
    (gridTreeUnionCheck_sound 32768 raw23 output23 cover23 source23 tree23 checked23)
    _ (by norm_num) _, areaUnits23]
  norm_num

-- Frozen phase 6734, atom 573, type 0, source (4,77).
def leavesData24 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves24 : Fin 7 → DyadicLeaf := leavesData24.get
def raw24 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 4 77 leaves24 i
def outputData24 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨1024,1152,19712,19840⟩) (.node (.single ⟨1024,1152,19840,19968⟩) (.single ⟨1152,1216,19712,19776⟩))) (.node (.node (.single ⟨1152,1216,19776,19840⟩) (.single ⟨1216,1280,19712,19776⟩)) (.node (.single ⟨1216,1280,19776,19840⟩) (.single ⟨1152,1280,19840,19968⟩)))) (.node (.node (.single ⟨12800,12928,31488,31616⟩) (.node (.single ⟨12800,12928,31616,31744⟩) (.single ⟨12928,12992,31488,31552⟩))) (.node (.node (.single ⟨12928,12992,31552,31616⟩) (.single ⟨12992,13056,31488,31552⟩)) (.node (.single ⟨12992,13056,31552,31616⟩) (.single ⟨12928,13056,31616,31744⟩))))) (.node (.node (.node (.single ⟨19712,19840,1024,1152⟩) (.node (.single ⟨19712,19776,1152,1216⟩) (.single ⟨19712,19776,1216,1280⟩))) (.node (.node (.single ⟨19776,19840,1152,1216⟩) (.single ⟨19776,19840,1216,1280⟩)) (.node (.single ⟨19840,19968,1024,1152⟩) (.single ⟨19840,19968,1152,1280⟩)))) (.node (.node (.single ⟨31488,31616,12800,12928⟩) (.node (.single ⟨31488,31552,12928,12992⟩) (.single ⟨31488,31552,12992,13056⟩))) (.node (.node (.single ⟨31552,31616,12928,12992⟩) (.single ⟨31552,31616,12992,13056⟩)) (.node (.single ⟨31616,31744,12800,12928⟩) (.single ⟨31616,31744,12928,13056⟩))))))
def output24 : Fin 28 → GridBox := outputData24.get
def coverData24 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData24 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover24 (i : Fin 28) : Fin 28 := ⟨coverData24.get i % 28, Nat.mod_lt _ (by decide)⟩
def source24 (i : Fin 28) : Fin 28 := ⟨sourceData24.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree24 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 .empty (.cutY 19456 .empty (.cutX 1536 (.cutY 19968 (.cutX 1280 (.cutY 19712 .empty (.cutX 1152 (.cutY 19840 .full .full) (.cutY 19840 (.cutX 1216 (.cutY 19776 .full .full) (.cutY 19776 .full .full)) .full))) .empty) .empty) .empty)))) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 (.cutY 31744 (.cutX 12800 .empty (.cutY 31232 .empty (.cutX 13056 (.cutY 31488 .empty (.cutX 12928 (.cutY 31616 .full .full) (.cutY 31616 (.cutX 12992 (.cutY 31552 .full .full) (.cutY 31552 .full .full)) .full))) .empty))) .empty) .empty)) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 .empty (.cutY 1024 .empty (.cutX 19968 (.cutY 1536 (.cutX 19712 .empty (.cutY 1280 (.cutX 19840 (.cutY 1152 .full (.cutX 19776 (.cutY 1216 .full .full) (.cutY 1216 .full .full))) (.cutY 1152 .full .full)) .empty)) .empty) .empty))) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 (.cutY 13312 (.cutX 31232 .empty (.cutY 12800 .empty (.cutX 31488 .empty (.cutY 13056 (.cutX 31616 (.cutY 12928 .full (.cutX 31552 (.cutY 12992 .full .full) (.cutY 12992 .full .full))) (.cutY 12928 .full .full)) .empty)))) .empty) .empty) .empty)))))) .empty))

theorem metadata24 : 0<34183877 ∧ 4<128 ∧ 77<128 ∧ 0<4 ∧
    573/4160=0 ∧ 573%4160=573 ∧ ∀ i, (leaves24 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData24).mp
    (by decide +kernel)

theorem sourceChecked24_0 : ∀ i : Fin 28,
    (fun i => output24 i = raw24 (source24 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked24 : ∀ i : Fin 28, (fun i => output24 i = raw24 (source24 i)) i :=
  forallFin_of_zero_offset (fun i => output24 i = raw24 (source24 i)) sourceChecked24_0

theorem coverChecked24_0 : ∀ i : Fin 28,
    (fun i => (output24 (cover24 i)).ContainsBox (raw24 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked24 : ∀ i : Fin 28, (fun i => (output24 (cover24 i)).ContainsBox (raw24 i)) i :=
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

noncomputable def phaseMass24 : ℝ := singlePhaseMass (34183877/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw24 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass24_eq : phaseMass24 = (34183877/1638400000000 : ℝ) := by
  unfold phaseMass24
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw24 output24 cover24 source24
    (gridTreeUnionCheck_sound 32768 raw24 output24 cover24 source24 tree24 checked24)
    _ (by norm_num) _, areaUnits24]
  norm_num

-- Frozen phase 6735, atom 4969, type 1, source (6,77).
def leavesData25 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves25 : Fin 4 → DyadicLeaf := leavesData25.get
def raw25 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 6 77 leaves25 i
def outputData25 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨1536,1664,19712,19840⟩) (.single ⟨1536,1664,19840,19968⟩)) (.node (.single ⟨1664,1792,19712,19840⟩) (.single ⟨1664,1792,19840,19968⟩))) (.node (.node (.single ⟨12800,12928,30976,31104⟩) (.single ⟨12800,12928,31104,31232⟩)) (.node (.single ⟨12928,13056,30976,31104⟩) (.single ⟨12928,13056,31104,31232⟩)))) (.node (.node (.node (.single ⟨19712,19840,1536,1664⟩) (.single ⟨19712,19840,1664,1792⟩)) (.node (.single ⟨19840,19968,1536,1664⟩) (.single ⟨19840,19968,1664,1792⟩))) (.node (.node (.single ⟨30976,31104,12800,12928⟩) (.single ⟨30976,31104,12928,13056⟩)) (.node (.single ⟨31104,31232,12800,12928⟩) (.single ⟨31104,31232,12928,13056⟩)))))
def output25 : Fin 16 → GridBox := outputData25.get
def coverData25 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData25 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover25 (i : Fin 16) : Fin 16 := ⟨coverData25.get i % 16, Nat.mod_lt _ (by decide)⟩
def source25 (i : Fin 16) : Fin 16 := ⟨sourceData25.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree25 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 .empty (.cutY 19456 .empty (.cutX 1536 .empty (.cutY 19968 (.cutX 1792 (.cutY 19712 .empty (.cutX 1664 (.cutY 19840 .full .full) (.cutY 19840 .full .full))) .empty) .empty))))) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 (.cutY 31744 (.cutX 12800 .empty (.cutY 31232 (.cutX 13056 (.cutY 30976 .empty (.cutX 12928 (.cutY 31104 .full .full) (.cutY 31104 .full .full))) .empty) .empty)) .empty) .empty)) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 .empty (.cutY 1024 .empty (.cutX 19968 (.cutY 1536 .empty (.cutX 19712 .empty (.cutY 1792 (.cutX 19840 (.cutY 1664 .full .full) (.cutY 1664 .full .full)) .empty))) .empty))) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 (.cutY 13312 (.cutX 31232 (.cutY 12800 .empty (.cutX 30976 .empty (.cutY 13056 (.cutX 31104 (.cutY 12928 .full .full) (.cutY 12928 .full .full)) .empty))) .empty) .empty) .empty) .empty)))))) .empty))

theorem metadata25 : 0<137362203 ∧ 6<128 ∧ 77<128 ∧ 1<4 ∧
    4969/4160=1 ∧ 4969%4160=809 ∧ ∀ i, (leaves25 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData25).mp
    (by decide +kernel)

theorem sourceChecked25_0 : ∀ i : Fin 16,
    (fun i => output25 i = raw25 (source25 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked25 : ∀ i : Fin 16, (fun i => output25 i = raw25 (source25 i)) i :=
  forallFin_of_zero_offset (fun i => output25 i = raw25 (source25 i)) sourceChecked25_0

theorem coverChecked25_0 : ∀ i : Fin 16,
    (fun i => (output25 (cover25 i)).ContainsBox (raw25 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked25 : ∀ i : Fin 16, (fun i => (output25 (cover25 i)).ContainsBox (raw25 i)) i :=
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

noncomputable def phaseMass25 : ℝ := singlePhaseMass (137362203/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw25 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass25_eq : phaseMass25 = (137362203/1638400000000 : ℝ) := by
  unfold phaseMass25
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw25 output25 cover25 source25
    (gridTreeUnionCheck_sound 32768 raw25 output25 cover25 source25 tree25 checked25)
    _ (by norm_num) _, areaUnits25]
  norm_num

-- Frozen phase 6736, atom 6752, type 1, source (24,96).
def leavesData26 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves26 : Fin 10 → DyadicLeaf := leavesData26.get
def raw26 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 24 96 leaves26 i
def outputData26 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨6144,6208,24576,24640⟩) (.single ⟨6144,6208,24640,24704⟩)) (.node (.single ⟨6208,6272,24576,24640⟩) (.node (.single ⟨6208,6272,24640,24704⟩) (.single ⟨6144,6272,24704,24832⟩)))) (.node (.node (.single ⟨6272,6336,24576,24640⟩) (.single ⟨6272,6336,24640,24704⟩)) (.node (.single ⟨6336,6400,24576,24640⟩) (.node (.single ⟨6336,6400,24640,24704⟩) (.single ⟨6272,6400,24704,24832⟩))))) (.node (.node (.node (.single ⟨7936,8064,26368,26496⟩) (.single ⟨7936,8064,26496,26624⟩)) (.node (.single ⟨8064,8128,26368,26432⟩) (.node (.single ⟨8064,8128,26432,26496⟩) (.single ⟨8128,8192,26368,26432⟩)))) (.node (.node (.single ⟨8128,8192,26432,26496⟩) (.single ⟨8064,8128,26496,26560⟩)) (.node (.single ⟨8064,8128,26560,26624⟩) (.node (.single ⟨8128,8192,26496,26560⟩) (.single ⟨8128,8192,26560,26624⟩)))))) (.node (.node (.node (.node (.single ⟨24576,24640,6144,6208⟩) (.single ⟨24576,24640,6208,6272⟩)) (.node (.single ⟨24640,24704,6144,6208⟩) (.node (.single ⟨24640,24704,6208,6272⟩) (.single ⟨24576,24640,6272,6336⟩)))) (.node (.node (.single ⟨24576,24640,6336,6400⟩) (.single ⟨24640,24704,6272,6336⟩)) (.node (.single ⟨24640,24704,6336,6400⟩) (.node (.single ⟨24704,24832,6144,6272⟩) (.single ⟨24704,24832,6272,6400⟩))))) (.node (.node (.node (.single ⟨26368,26496,7936,8064⟩) (.single ⟨26368,26432,8064,8128⟩)) (.node (.single ⟨26368,26432,8128,8192⟩) (.node (.single ⟨26432,26496,8064,8128⟩) (.single ⟨26432,26496,8128,8192⟩)))) (.node (.node (.single ⟨26496,26624,7936,8064⟩) (.single ⟨26496,26560,8064,8128⟩)) (.node (.single ⟨26496,26560,8128,8192⟩) (.node (.single ⟨26560,26624,8064,8128⟩) (.single ⟨26560,26624,8128,8192⟩)))))))
def output26 : Fin 40 → GridBox := outputData26.get
def coverData26 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData26 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover26 (i : Fin 40) : Fin 40 := ⟨coverData26.get i % 40, Nat.mod_lt _ (by decide)⟩
def source26 (i : Fin 40) : Fin 40 := ⟨sourceData26.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree26 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 .empty (.cutY 26624 (.cutX 7168 (.cutY 25600 (.cutX 6656 (.cutY 25088 (.cutX 6400 (.cutY 24832 (.cutX 6272 (.cutY 24704 (.cutX 6208 (.cutY 24640 .full .full) (.cutY 24640 .full .full)) .full) (.cutY 24704 (.cutX 6336 (.cutY 24640 .full .full) (.cutY 24640 .full .full)) .full)) .empty) .empty) .empty) .empty) .empty) (.cutY 25600 .empty (.cutX 7680 .empty (.cutY 26112 .empty (.cutX 7936 .empty (.cutY 26368 .empty (.cutX 8064 (.cutY 26496 .full .full) (.cutY 26496 (.cutX 8128 (.cutY 26432 .full .full) (.cutY 26432 .full .full)) (.cutX 8128 (.cutY 26560 .full .full) (.cutY 26560 .full .full)))))))))) .empty)) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 .empty (.cutX 25600 (.cutY 7168 (.cutX 25088 (.cutY 6656 (.cutX 24832 (.cutY 6400 (.cutX 24704 (.cutY 6272 (.cutX 24640 (.cutY 6208 .full .full) (.cutY 6208 .full .full)) (.cutX 24640 (.cutY 6336 .full .full) (.cutY 6336 .full .full))) (.cutY 6272 .full .full)) .empty) .empty) .empty) .empty) .empty) (.cutY 7168 .empty (.cutX 26112 .empty (.cutY 7680 .empty (.cutX 26368 .empty (.cutY 7936 .empty (.cutX 26496 (.cutY 8064 .full (.cutX 26432 (.cutY 8128 .full .full) (.cutY 8128 .full .full))) (.cutY 8064 .full (.cutX 26560 (.cutY 8128 .full .full) (.cutY 8128 .full .full))))))))))) .empty)) .empty) .empty)) .empty))

theorem metadata26 : 0<48020332 ∧ 24<128 ∧ 96<128 ∧ 1<4 ∧
    6752/4160=1 ∧ 6752%4160=2592 ∧ ∀ i, (leaves26 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData26).mp
    (by decide +kernel)

theorem sourceChecked26_0 : ∀ i : Fin 40,
    (fun i => output26 i = raw26 (source26 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked26 : ∀ i : Fin 40, (fun i => output26 i = raw26 (source26 i)) i :=
  forallFin_of_zero_offset (fun i => output26 i = raw26 (source26 i)) sourceChecked26_0

theorem coverChecked26_0 : ∀ i : Fin 40,
    (fun i => (output26 (cover26 i)).ContainsBox (raw26 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked26 : ∀ i : Fin 40, (fun i => (output26 (cover26 i)).ContainsBox (raw26 i)) i :=
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

noncomputable def phaseMass26 : ℝ := singlePhaseMass (48020332/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw26 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass26_eq : phaseMass26 = (12005083/409600000000 : ℝ) := by
  unfold phaseMass26
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw26 output26 cover26 source26
    (gridTreeUnionCheck_sound 32768 raw26 output26 cover26 source26 tree26 checked26)
    _ (by norm_num) _, areaUnits26]
  norm_num

-- Frozen phase 6737, atom 6234, type 1, source (18,94).
def leavesData27 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,0⟩))) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves27 : Fin 13 → DyadicLeaf := leavesData27.get
def raw27 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 18 94 leaves27 i
def outputData27 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨4608,4672,24064,24128⟩) (.node (.single ⟨4608,4672,24128,24192⟩) (.single ⟨4672,4736,24064,24128⟩))) (.node (.single ⟨4672,4736,24128,24192⟩) (.node (.single ⟨4608,4736,24192,24320⟩) (.single ⟨4736,4800,24064,24128⟩)))) (.node (.node (.single ⟨4736,4800,24128,24192⟩) (.node (.single ⟨4800,4832,24064,24096⟩) (.single ⟨4800,4832,24096,24128⟩))) (.node (.node (.single ⟨4832,4864,24064,24096⟩) (.single ⟨4832,4864,24096,24128⟩)) (.node (.single ⟨4800,4864,24128,24192⟩) (.single ⟨4736,4864,24192,24320⟩))))) (.node (.node (.node (.single ⟨8448,8576,27904,28032⟩) (.node (.single ⟨8448,8576,28032,28160⟩) (.single ⟨8576,8640,27904,27968⟩))) (.node (.single ⟨8576,8640,27968,28032⟩) (.node (.single ⟨8640,8672,27904,27936⟩) (.single ⟨8640,8672,27936,27968⟩)))) (.node (.node (.single ⟨8672,8704,27904,27936⟩) (.node (.single ⟨8672,8704,27936,27968⟩) (.single ⟨8640,8704,27968,28032⟩))) (.node (.node (.single ⟨8576,8640,28032,28096⟩) (.single ⟨8576,8640,28096,28160⟩)) (.node (.single ⟨8640,8704,28032,28096⟩) (.single ⟨8640,8704,28096,28160⟩)))))) (.node (.node (.node (.node (.single ⟨24064,24128,4608,4672⟩) (.node (.single ⟨24064,24128,4672,4736⟩) (.single ⟨24128,24192,4608,4672⟩))) (.node (.single ⟨24128,24192,4672,4736⟩) (.node (.single ⟨24064,24128,4736,4800⟩) (.single ⟨24064,24096,4800,4832⟩)))) (.node (.node (.single ⟨24064,24096,4832,4864⟩) (.node (.single ⟨24096,24128,4800,4832⟩) (.single ⟨24096,24128,4832,4864⟩))) (.node (.node (.single ⟨24128,24192,4736,4800⟩) (.single ⟨24128,24192,4800,4864⟩)) (.node (.single ⟨24192,24320,4608,4736⟩) (.single ⟨24192,24320,4736,4864⟩))))) (.node (.node (.node (.single ⟨27904,28032,8448,8576⟩) (.node (.single ⟨27904,27968,8576,8640⟩) (.single ⟨27904,27936,8640,8672⟩))) (.node (.single ⟨27904,27936,8672,8704⟩) (.node (.single ⟨27936,27968,8640,8672⟩) (.single ⟨27936,27968,8672,8704⟩)))) (.node (.node (.single ⟨27968,28032,8576,8640⟩) (.node (.single ⟨27968,28032,8640,8704⟩) (.single ⟨28032,28160,8448,8576⟩))) (.node (.node (.single ⟨28032,28096,8576,8640⟩) (.single ⟨28032,28096,8640,8704⟩)) (.node (.single ⟨28096,28160,8576,8640⟩) (.single ⟨28096,28160,8640,8704⟩)))))))
def output27 : Fin 52 → GridBox := outputData27.get
def coverData27 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 0))) (.node (.node (.single 26) (.single 51)) (.node (.single 25) (.single 1))))) (.node (.node (.node (.single 28) (.node (.single 50) (.single 23))) (.node (.single 2) (.node (.single 27) (.single 49)))) (.node (.node (.single 24) (.node (.single 3) (.single 29))) (.node (.node (.single 48) (.single 22)) (.node (.single 5) (.single 30)))))) (.node (.node (.node (.node (.single 46) (.node (.single 21) (.single 6))) (.node (.single 35) (.node (.single 45) (.single 16)))) (.node (.node (.single 11) (.node (.single 36) (.single 40))) (.node (.node (.single 15) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData27 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.single 20) (.node (.single 0) (.single 24)))) (.node (.node (.single 28) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 35))) (.node (.single 31) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.node (.single 17) (.single 13))) (.node (.single 21) (.node (.single 25) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 34) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 30) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover27 (i : Fin 52) : Fin 52 := ⟨coverData27.get i % 52, Nat.mod_lt _ (by decide)⟩
def source27 (i : Fin 52) : Fin 52 := ⟨sourceData27.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree27 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 .empty (.cutX 5120 (.cutY 23552 .empty (.cutX 4608 .empty (.cutY 24064 .empty (.cutX 4864 (.cutY 24320 (.cutX 4736 (.cutY 24192 (.cutX 4672 (.cutY 24128 .full .full) (.cutY 24128 .full .full)) .full) (.cutY 24192 (.cutX 4800 (.cutY 24128 .full .full) (.cutY 24128 (.cutX 4832 (.cutY 24096 .full .full) (.cutY 24096 .full .full)) .full)) .full)) .empty) .empty)))) .empty)) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 .empty (.cutX 9216 (.cutY 27648 .empty (.cutX 8704 (.cutY 28160 (.cutX 8448 .empty (.cutY 27904 .empty (.cutX 8576 (.cutY 28032 .full .full) (.cutY 28032 (.cutX 8640 (.cutY 27968 .full .full) (.cutY 27968 (.cutX 8672 (.cutY 27936 .full .full) (.cutY 27936 .full .full)) .full)) (.cutX 8640 (.cutY 28096 .full .full) (.cutY 28096 .full .full)))))) .empty) .empty)) .empty)) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 (.cutX 23552 .empty (.cutY 5120 (.cutX 24064 .empty (.cutY 4608 .empty (.cutX 24320 (.cutY 4864 (.cutX 24192 (.cutY 4736 (.cutX 24128 (.cutY 4672 .full .full) (.cutY 4672 .full .full)) (.cutX 24128 (.cutY 4800 .full (.cutX 24096 (.cutY 4832 .full .full) (.cutY 4832 .full .full))) (.cutY 4800 .full .full))) (.cutY 4736 .full .full)) .empty) .empty))) .empty)) .empty)))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 (.cutX 27648 .empty (.cutY 9216 (.cutX 28160 (.cutY 8704 (.cutX 27904 .empty (.cutY 8448 .empty (.cutX 28032 (.cutY 8576 .full (.cutX 27968 (.cutY 8640 .full (.cutX 27936 (.cutY 8672 .full .full) (.cutY 8672 .full .full))) (.cutY 8640 .full .full))) (.cutY 8576 .full (.cutX 28096 (.cutY 8640 .full .full) (.cutY 8640 .full .full)))))) .empty) .empty) .empty)) .empty)) .empty) .empty))) .empty))

theorem metadata27 : 0<192153497 ∧ 18<128 ∧ 94<128 ∧ 1<4 ∧
    6234/4160=1 ∧ 6234%4160=2074 ∧ ∀ i, (leaves27 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData27).mp
    (by decide +kernel)

theorem sourceChecked27_0 : ∀ i : Fin 52,
    (fun i => output27 i = raw27 (source27 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked27 : ∀ i : Fin 52, (fun i => output27 i = raw27 (source27 i)) i :=
  forallFin_of_zero_offset (fun i => output27 i = raw27 (source27 i)) sourceChecked27_0

theorem coverChecked27_0 : ∀ i : Fin 52,
    (fun i => (output27 (cover27 i)).ContainsBox (raw27 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked27 : ∀ i : Fin 52, (fun i => (output27 (cover27 i)).ContainsBox (raw27 i)) i :=
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

noncomputable def phaseMass27 : ℝ := singlePhaseMass (192153497/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw27 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass27_eq : phaseMass27 = (192153497/1638400000000 : ℝ) := by
  unfold phaseMass27
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw27 output27 cover27 source27
    (gridTreeUnionCheck_sound 32768 raw27 output27 cover27 source27 tree27 checked27)
    _ (by norm_num) _, areaUnits27]
  norm_num

-- Frozen phase 6738, atom 5634, type 1, source (12,82).
def leavesData28 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves28 : Fin 7 → DyadicLeaf := leavesData28.get
def raw28 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 12 82 leaves28 i
def outputData28 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3072,3200,20992,21120⟩) (.node (.single ⟨3072,3200,21120,21248⟩) (.single ⟨3200,3264,20992,21056⟩))) (.node (.node (.single ⟨3200,3264,21056,21120⟩) (.single ⟨3264,3328,20992,21056⟩)) (.node (.single ⟨3264,3328,21056,21120⟩) (.single ⟨3200,3328,21120,21248⟩)))) (.node (.node (.single ⟨11520,11648,29440,29568⟩) (.node (.single ⟨11520,11648,29568,29696⟩) (.single ⟨11648,11712,29440,29504⟩))) (.node (.node (.single ⟨11648,11712,29504,29568⟩) (.single ⟨11712,11776,29440,29504⟩)) (.node (.single ⟨11712,11776,29504,29568⟩) (.single ⟨11648,11776,29568,29696⟩))))) (.node (.node (.node (.single ⟨20992,21120,3072,3200⟩) (.node (.single ⟨20992,21056,3200,3264⟩) (.single ⟨20992,21056,3264,3328⟩))) (.node (.node (.single ⟨21056,21120,3200,3264⟩) (.single ⟨21056,21120,3264,3328⟩)) (.node (.single ⟨21120,21248,3072,3200⟩) (.single ⟨21120,21248,3200,3328⟩)))) (.node (.node (.single ⟨29440,29568,11520,11648⟩) (.node (.single ⟨29440,29504,11648,11712⟩) (.single ⟨29440,29504,11712,11776⟩))) (.node (.node (.single ⟨29504,29568,11648,11712⟩) (.single ⟨29504,29568,11712,11776⟩)) (.node (.single ⟨29568,29696,11520,11648⟩) (.single ⟨29568,29696,11648,11776⟩))))))
def output28 : Fin 28 → GridBox := outputData28.get
def coverData28 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData28 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover28 (i : Fin 28) : Fin 28 := ⟨coverData28.get i % 28, Nat.mod_lt _ (by decide)⟩
def source28 (i : Fin 28) : Fin 28 := ⟨sourceData28.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree28 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 .empty (.cutY 21504 (.cutX 3584 (.cutY 20992 .empty (.cutX 3328 (.cutY 21248 (.cutX 3200 (.cutY 21120 .full .full) (.cutY 21120 (.cutX 3264 (.cutY 21056 .full .full) (.cutY 21056 .full .full)) .full)) .empty) .empty)) .empty) .empty)) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 .empty (.cutY 29696 (.cutX 11776 (.cutY 29184 .empty (.cutX 11520 .empty (.cutY 29440 .empty (.cutX 11648 (.cutY 29568 .full .full) (.cutY 29568 (.cutX 11712 (.cutY 29504 .full .full) (.cutY 29504 .full .full)) .full))))) .empty) .empty)) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 (.cutY 3072 .empty (.cutX 20992 .empty (.cutY 3584 (.cutX 21248 (.cutY 3328 (.cutX 21120 (.cutY 3200 .full (.cutX 21056 (.cutY 3264 .full .full) (.cutY 3264 .full .full))) (.cutY 3200 .full .full)) .empty) .empty) .empty))) .empty)) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 (.cutY 11264 .empty (.cutX 29184 .empty (.cutY 11776 (.cutX 29440 .empty (.cutY 11520 .empty (.cutX 29568 (.cutY 11648 .full (.cutX 29504 (.cutY 11712 .full .full) (.cutY 11712 .full .full))) (.cutY 11648 .full .full)))) .empty))) .empty)) .empty) .empty)))) .empty))

theorem metadata28 : 0<139307719 ∧ 12<128 ∧ 82<128 ∧ 1<4 ∧
    5634/4160=1 ∧ 5634%4160=1474 ∧ ∀ i, (leaves28 i).Valid 8 := by
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

noncomputable def phaseMass28 : ℝ := singlePhaseMass (139307719/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw28 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass28_eq : phaseMass28 = (139307719/1638400000000 : ℝ) := by
  unfold phaseMass28
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw28 output28 cover28 source28
    (gridTreeUnionCheck_sound 32768 raw28 output28 cover28 source28 tree28 checked28)
    _ (by norm_num) _, areaUnits28]
  norm_num

-- Frozen phase 6739, atom 4732, type 1, source (4,76).
def leavesData29 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves29 : Fin 7 → DyadicLeaf := leavesData29.get
def raw29 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 4 76 leaves29 i
def outputData29 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨1024,1152,19456,19584⟩) (.node (.single ⟨1024,1152,19584,19712⟩) (.single ⟨1152,1216,19456,19520⟩))) (.node (.node (.single ⟨1152,1216,19520,19584⟩) (.single ⟨1216,1280,19456,19520⟩)) (.node (.single ⟨1216,1280,19520,19584⟩) (.single ⟨1152,1280,19584,19712⟩)))) (.node (.node (.single ⟨13056,13184,31488,31616⟩) (.node (.single ⟨13056,13184,31616,31744⟩) (.single ⟨13184,13248,31488,31552⟩))) (.node (.node (.single ⟨13184,13248,31552,31616⟩) (.single ⟨13248,13312,31488,31552⟩)) (.node (.single ⟨13248,13312,31552,31616⟩) (.single ⟨13184,13312,31616,31744⟩))))) (.node (.node (.node (.single ⟨19456,19584,1024,1152⟩) (.node (.single ⟨19456,19520,1152,1216⟩) (.single ⟨19456,19520,1216,1280⟩))) (.node (.node (.single ⟨19520,19584,1152,1216⟩) (.single ⟨19520,19584,1216,1280⟩)) (.node (.single ⟨19584,19712,1024,1152⟩) (.single ⟨19584,19712,1152,1280⟩)))) (.node (.node (.single ⟨31488,31616,13056,13184⟩) (.node (.single ⟨31488,31552,13184,13248⟩) (.single ⟨31488,31552,13248,13312⟩))) (.node (.node (.single ⟨31552,31616,13184,13248⟩) (.single ⟨31552,31616,13248,13312⟩)) (.node (.single ⟨31616,31744,13056,13184⟩) (.single ⟨31616,31744,13184,13312⟩))))))
def output29 : Fin 28 → GridBox := outputData29.get
def coverData29 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData29 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover29 (i : Fin 28) : Fin 28 := ⟨coverData29.get i % 28, Nat.mod_lt _ (by decide)⟩
def source29 (i : Fin 28) : Fin 28 := ⟨sourceData29.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree29 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 .empty (.cutY 19456 .empty (.cutX 1536 (.cutY 19968 (.cutX 1280 (.cutY 19712 (.cutX 1152 (.cutY 19584 .full .full) (.cutY 19584 (.cutX 1216 (.cutY 19520 .full .full) (.cutY 19520 .full .full)) .full)) .empty) .empty) .empty) .empty)))) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 (.cutY 31744 (.cutX 12800 .empty (.cutY 31232 .empty (.cutX 13056 .empty (.cutY 31488 .empty (.cutX 13184 (.cutY 31616 .full .full) (.cutY 31616 (.cutX 13248 (.cutY 31552 .full .full) (.cutY 31552 .full .full)) .full)))))) .empty) .empty)) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 .empty (.cutY 1024 .empty (.cutX 19968 (.cutY 1536 (.cutX 19712 (.cutY 1280 (.cutX 19584 (.cutY 1152 .full (.cutX 19520 (.cutY 1216 .full .full) (.cutY 1216 .full .full))) (.cutY 1152 .full .full)) .empty) .empty) .empty) .empty))) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 (.cutY 13312 (.cutX 31232 .empty (.cutY 12800 .empty (.cutX 31488 .empty (.cutY 13056 .empty (.cutX 31616 (.cutY 13184 .full (.cutX 31552 (.cutY 13248 .full .full) (.cutY 13248 .full .full))) (.cutY 13184 .full .full)))))) .empty) .empty) .empty)))))) .empty))

theorem metadata29 : 0<137362203 ∧ 4<128 ∧ 76<128 ∧ 1<4 ∧
    4732/4160=1 ∧ 4732%4160=572 ∧ ∀ i, (leaves29 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData29).mp
    (by decide +kernel)

theorem sourceChecked29_0 : ∀ i : Fin 28,
    (fun i => output29 i = raw29 (source29 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked29 : ∀ i : Fin 28, (fun i => output29 i = raw29 (source29 i)) i :=
  forallFin_of_zero_offset (fun i => output29 i = raw29 (source29 i)) sourceChecked29_0

theorem coverChecked29_0 : ∀ i : Fin 28,
    (fun i => (output29 (cover29 i)).ContainsBox (raw29 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked29 : ∀ i : Fin 28, (fun i => (output29 (cover29 i)).ContainsBox (raw29 i)) i :=
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

noncomputable def phaseMass29 : ℝ := singlePhaseMass (137362203/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw29 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass29_eq : phaseMass29 = (137362203/1638400000000 : ℝ) := by
  unfold phaseMass29
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw29 output29 cover29 source29
    (gridTreeUnionCheck_sound 32768 raw29 output29 cover29 source29 tree29 checked29)
    _ (by norm_num) _, areaUnits29]
  norm_num

-- Frozen phase 6740, atom 6671, type 1, source (23,96).
def leavesData30 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩)))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩)))))
def leaves30 : Fin 10 → DyadicLeaf := leavesData30.get
def raw30 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 23 96 leaves30 i
def outputData30 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨5888,5952,24576,24640⟩) (.single ⟨5888,5952,24640,24704⟩)) (.node (.single ⟨5952,6016,24576,24640⟩) (.node (.single ⟨5952,6016,24640,24704⟩) (.single ⟨5888,6016,24704,24832⟩)))) (.node (.node (.single ⟨6016,6080,24576,24640⟩) (.single ⟨6016,6080,24640,24704⟩)) (.node (.single ⟨6080,6144,24576,24640⟩) (.node (.single ⟨6080,6144,24640,24704⟩) (.single ⟨6016,6144,24704,24832⟩))))) (.node (.node (.node (.single ⟨7936,8064,26624,26752⟩) (.single ⟨7936,8064,26752,26880⟩)) (.node (.single ⟨8064,8128,26624,26688⟩) (.node (.single ⟨8064,8128,26688,26752⟩) (.single ⟨8128,8192,26624,26688⟩)))) (.node (.node (.single ⟨8128,8192,26688,26752⟩) (.single ⟨8064,8128,26752,26816⟩)) (.node (.single ⟨8064,8128,26816,26880⟩) (.node (.single ⟨8128,8192,26752,26816⟩) (.single ⟨8128,8192,26816,26880⟩)))))) (.node (.node (.node (.node (.single ⟨24576,24640,5888,5952⟩) (.single ⟨24576,24640,5952,6016⟩)) (.node (.single ⟨24640,24704,5888,5952⟩) (.node (.single ⟨24640,24704,5952,6016⟩) (.single ⟨24576,24640,6016,6080⟩)))) (.node (.node (.single ⟨24576,24640,6080,6144⟩) (.single ⟨24640,24704,6016,6080⟩)) (.node (.single ⟨24640,24704,6080,6144⟩) (.node (.single ⟨24704,24832,5888,6016⟩) (.single ⟨24704,24832,6016,6144⟩))))) (.node (.node (.node (.single ⟨26624,26752,7936,8064⟩) (.single ⟨26624,26688,8064,8128⟩)) (.node (.single ⟨26624,26688,8128,8192⟩) (.node (.single ⟨26688,26752,8064,8128⟩) (.single ⟨26688,26752,8128,8192⟩)))) (.node (.node (.single ⟨26752,26880,7936,8064⟩) (.single ⟨26752,26816,8064,8128⟩)) (.node (.single ⟨26752,26816,8128,8192⟩) (.node (.single ⟨26816,26880,8064,8128⟩) (.single ⟨26816,26880,8128,8192⟩)))))))
def output30 : Fin 40 → GridBox := outputData30.get
def coverData30 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 0) (.single 20))))) (.node (.node (.node (.single 39) (.single 19)) (.node (.single 1) (.node (.single 22) (.single 38)))) (.node (.node (.single 17) (.single 2)) (.node (.single 21) (.node (.single 37) (.single 18)))))) (.node (.node (.node (.node (.single 3) (.single 23)) (.node (.single 36) (.node (.single 16) (.single 5)))) (.node (.node (.single 24) (.single 34)) (.node (.single 15) (.node (.single 6) (.single 26))))) (.node (.node (.node (.single 33) (.single 13)) (.node (.single 7) (.node (.single 25) (.single 32)))) (.node (.node (.single 14) (.single 8)) (.node (.single 27) (.node (.single 31) (.single 12)))))))
def sourceData30 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 0)))) (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 39) (.node (.single 31) (.single 35)))) (.node (.node (.single 27) (.single 23)) (.node (.single 15) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.node (.single 21) (.single 25)))) (.node (.node (.single 33) (.single 29)) (.node (.single 37) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))) (.node (.node (.single 2) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))))))
def cover30 (i : Fin 40) : Fin 40 := ⟨coverData30.get i % 40, Nat.mod_lt _ (by decide)⟩
def source30 (i : Fin 40) : Fin 40 := ⟨sourceData30.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree30 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 (.cutY 26624 (.cutX 5120 .empty (.cutY 25600 (.cutX 5632 .empty (.cutY 25088 (.cutX 5888 .empty (.cutY 24832 (.cutX 6016 (.cutY 24704 (.cutX 5952 (.cutY 24640 .full .full) (.cutY 24640 .full .full)) .full) (.cutY 24704 (.cutX 6080 (.cutY 24640 .full .full) (.cutY 24640 .full .full)) .full)) .empty)) .empty)) .empty)) .empty) (.cutY 26624 .empty (.cutX 7168 .empty (.cutY 27648 (.cutX 7680 .empty (.cutY 27136 (.cutX 7936 .empty (.cutY 26880 (.cutX 8064 (.cutY 26752 .full .full) (.cutY 26752 (.cutX 8128 (.cutY 26688 .full .full) (.cutY 26688 .full .full)) (.cutX 8128 (.cutY 26816 .full .full) (.cutY 26816 .full .full)))) .empty)) .empty)) .empty)))) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 (.cutX 25600 (.cutY 5120 .empty (.cutX 25088 (.cutY 5632 .empty (.cutX 24832 (.cutY 5888 .empty (.cutX 24704 (.cutY 6016 (.cutX 24640 (.cutY 5952 .full .full) (.cutY 5952 .full .full)) (.cutX 24640 (.cutY 6080 .full .full) (.cutY 6080 .full .full))) (.cutY 6016 .full .full))) .empty)) .empty)) .empty) .empty) (.cutY 6144 .empty (.cutX 27648 (.cutY 7168 .empty (.cutX 27136 (.cutY 7680 .empty (.cutX 26880 (.cutY 7936 .empty (.cutX 26752 (.cutY 8064 .full (.cutX 26688 (.cutY 8128 .full .full) (.cutY 8128 .full .full))) (.cutY 8064 .full (.cutX 26816 (.cutY 8128 .full .full) (.cutY 8128 .full .full))))) .empty)) .empty)) .empty)))) .empty) .empty)) .empty))

theorem metadata30 : 0<151956162 ∧ 23<128 ∧ 96<128 ∧ 1<4 ∧
    6671/4160=1 ∧ 6671%4160=2511 ∧ ∀ i, (leaves30 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData30).mp
    (by decide +kernel)

theorem sourceChecked30_0 : ∀ i : Fin 40,
    (fun i => output30 i = raw30 (source30 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked30 : ∀ i : Fin 40, (fun i => output30 i = raw30 (source30 i)) i :=
  forallFin_of_zero_offset (fun i => output30 i = raw30 (source30 i)) sourceChecked30_0

theorem coverChecked30_0 : ∀ i : Fin 40,
    (fun i => (output30 (cover30 i)).ContainsBox (raw30 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked30 : ∀ i : Fin 40, (fun i => (output30 (cover30 i)).ContainsBox (raw30 i)) i :=
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

noncomputable def phaseMass30 : ℝ := singlePhaseMass (151956162/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw30 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass30_eq : phaseMass30 = (75978081/819200000000 : ℝ) := by
  unfold phaseMass30
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw30 output30 cover30 source30
    (gridTreeUnionCheck_sound 32768 raw30 output30 cover30 source30 tree30 checked30)
    _ (by norm_num) _, areaUnits30]
  norm_num

-- Frozen phase 6741, atom 2594, type 0, source (24,98).
def leavesData31 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩)))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩)))))
def leaves31 : Fin 10 → DyadicLeaf := leavesData31.get
def raw31 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 24 98 leaves31 i
def outputData31 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨6144,6208,25088,25152⟩) (.single ⟨6144,6208,25152,25216⟩)) (.node (.single ⟨6208,6272,25088,25152⟩) (.node (.single ⟨6208,6272,25152,25216⟩) (.single ⟨6144,6272,25216,25344⟩)))) (.node (.node (.single ⟨6272,6336,25088,25152⟩) (.single ⟨6272,6336,25152,25216⟩)) (.node (.single ⟨6336,6400,25088,25152⟩) (.node (.single ⟨6336,6400,25152,25216⟩) (.single ⟨6272,6400,25216,25344⟩))))) (.node (.node (.node (.single ⟨7424,7552,26368,26496⟩) (.single ⟨7424,7552,26496,26624⟩)) (.node (.single ⟨7552,7616,26368,26432⟩) (.node (.single ⟨7552,7616,26432,26496⟩) (.single ⟨7616,7680,26368,26432⟩)))) (.node (.node (.single ⟨7616,7680,26432,26496⟩) (.single ⟨7552,7616,26496,26560⟩)) (.node (.single ⟨7552,7616,26560,26624⟩) (.node (.single ⟨7616,7680,26496,26560⟩) (.single ⟨7616,7680,26560,26624⟩)))))) (.node (.node (.node (.node (.single ⟨25088,25152,6144,6208⟩) (.single ⟨25088,25152,6208,6272⟩)) (.node (.single ⟨25152,25216,6144,6208⟩) (.node (.single ⟨25152,25216,6208,6272⟩) (.single ⟨25088,25152,6272,6336⟩)))) (.node (.node (.single ⟨25088,25152,6336,6400⟩) (.single ⟨25152,25216,6272,6336⟩)) (.node (.single ⟨25152,25216,6336,6400⟩) (.node (.single ⟨25216,25344,6144,6272⟩) (.single ⟨25216,25344,6272,6400⟩))))) (.node (.node (.node (.single ⟨26368,26496,7424,7552⟩) (.single ⟨26368,26432,7552,7616⟩)) (.node (.single ⟨26368,26432,7616,7680⟩) (.node (.single ⟨26432,26496,7552,7616⟩) (.single ⟨26432,26496,7616,7680⟩)))) (.node (.node (.single ⟨26496,26624,7424,7552⟩) (.single ⟨26496,26560,7552,7616⟩)) (.node (.single ⟨26496,26560,7616,7680⟩) (.node (.single ⟨26560,26624,7552,7616⟩) (.single ⟨26560,26624,7616,7680⟩)))))))
def output31 : Fin 40 → GridBox := outputData31.get
def coverData31 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 0) (.single 20))))) (.node (.node (.node (.single 39) (.single 19)) (.node (.single 1) (.node (.single 22) (.single 38)))) (.node (.node (.single 17) (.single 2)) (.node (.single 21) (.node (.single 37) (.single 18)))))) (.node (.node (.node (.node (.single 3) (.single 23)) (.node (.single 36) (.node (.single 16) (.single 5)))) (.node (.node (.single 24) (.single 34)) (.node (.single 15) (.node (.single 6) (.single 26))))) (.node (.node (.node (.single 33) (.single 13)) (.node (.single 7) (.node (.single 25) (.single 32)))) (.node (.node (.single 14) (.single 8)) (.node (.single 27) (.node (.single 31) (.single 12)))))))
def sourceData31 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 0)))) (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 39) (.node (.single 31) (.single 35)))) (.node (.node (.single 27) (.single 23)) (.node (.single 15) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.node (.single 21) (.single 25)))) (.node (.node (.single 33) (.single 29)) (.node (.single 37) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))) (.node (.node (.single 2) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))))))
def cover31 (i : Fin 40) : Fin 40 := ⟨coverData31.get i % 40, Nat.mod_lt _ (by decide)⟩
def source31 (i : Fin 40) : Fin 40 := ⟨sourceData31.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree31 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 .empty (.cutY 26624 (.cutX 7168 (.cutY 25600 (.cutX 6656 (.cutY 25088 .empty (.cutX 6400 (.cutY 25344 (.cutX 6272 (.cutY 25216 (.cutX 6208 (.cutY 25152 .full .full) (.cutY 25152 .full .full)) .full) (.cutY 25216 (.cutX 6336 (.cutY 25152 .full .full) (.cutY 25152 .full .full)) .full)) .empty) .empty)) .empty) .empty) (.cutY 25600 .empty (.cutX 7680 (.cutY 26112 .empty (.cutX 7424 .empty (.cutY 26368 .empty (.cutX 7552 (.cutY 26496 .full .full) (.cutY 26496 (.cutX 7616 (.cutY 26432 .full .full) (.cutY 26432 .full .full)) (.cutX 7616 (.cutY 26560 .full .full) (.cutY 26560 .full .full))))))) .empty))) .empty)) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 .empty (.cutX 25600 (.cutY 7168 (.cutX 25088 .empty (.cutY 6656 (.cutX 25344 (.cutY 6400 (.cutX 25216 (.cutY 6272 (.cutX 25152 (.cutY 6208 .full .full) (.cutY 6208 .full .full)) (.cutX 25152 (.cutY 6336 .full .full) (.cutY 6336 .full .full))) (.cutY 6272 .full .full)) .empty) .empty) .empty)) .empty) (.cutY 7168 .empty (.cutX 26112 .empty (.cutY 7680 (.cutX 26368 .empty (.cutY 7424 .empty (.cutX 26496 (.cutY 7552 .full (.cutX 26432 (.cutY 7616 .full .full) (.cutY 7616 .full .full))) (.cutY 7552 .full (.cutX 26560 (.cutY 7616 .full .full) (.cutY 7616 .full .full)))))) .empty))))) .empty)) .empty) .empty)) .empty))

theorem metadata31 : 0<31548346 ∧ 24<128 ∧ 98<128 ∧ 0<4 ∧
    2594/4160=0 ∧ 2594%4160=2594 ∧ ∀ i, (leaves31 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData31).mp
    (by decide +kernel)

theorem sourceChecked31_0 : ∀ i : Fin 40,
    (fun i => output31 i = raw31 (source31 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked31 : ∀ i : Fin 40, (fun i => output31 i = raw31 (source31 i)) i :=
  forallFin_of_zero_offset (fun i => output31 i = raw31 (source31 i)) sourceChecked31_0

theorem coverChecked31_0 : ∀ i : Fin 40,
    (fun i => (output31 (cover31 i)).ContainsBox (raw31 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked31 : ∀ i : Fin 40, (fun i => (output31 (cover31 i)).ContainsBox (raw31 i)) i :=
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

noncomputable def phaseMass31 : ℝ := singlePhaseMass (31548346/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw31 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass31_eq : phaseMass31 = (15774173/819200000000 : ℝ) := by
  unfold phaseMass31
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw31 output31 cover31 source31
    (gridTreeUnionCheck_sound 32768 raw31 output31 cover31 source31 tree31 checked31)
    _ (by norm_num) _, areaUnits31]
  norm_num

-- Frozen phase 6742, atom 2513, type 0, source (23,98).
def leavesData32 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩)))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩)))))
def leaves32 : Fin 10 → DyadicLeaf := leavesData32.get
def raw32 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 23 98 leaves32 i
def outputData32 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨5888,5952,25088,25152⟩) (.single ⟨5888,5952,25152,25216⟩)) (.node (.single ⟨5952,6016,25088,25152⟩) (.node (.single ⟨5952,6016,25152,25216⟩) (.single ⟨5888,6016,25216,25344⟩)))) (.node (.node (.single ⟨6016,6080,25088,25152⟩) (.single ⟨6016,6080,25152,25216⟩)) (.node (.single ⟨6080,6144,25088,25152⟩) (.node (.single ⟨6080,6144,25152,25216⟩) (.single ⟨6016,6144,25216,25344⟩))))) (.node (.node (.node (.single ⟨7424,7552,26624,26752⟩) (.single ⟨7424,7552,26752,26880⟩)) (.node (.single ⟨7552,7616,26624,26688⟩) (.node (.single ⟨7552,7616,26688,26752⟩) (.single ⟨7616,7680,26624,26688⟩)))) (.node (.node (.single ⟨7616,7680,26688,26752⟩) (.single ⟨7552,7616,26752,26816⟩)) (.node (.single ⟨7552,7616,26816,26880⟩) (.node (.single ⟨7616,7680,26752,26816⟩) (.single ⟨7616,7680,26816,26880⟩)))))) (.node (.node (.node (.node (.single ⟨25088,25152,5888,5952⟩) (.single ⟨25088,25152,5952,6016⟩)) (.node (.single ⟨25152,25216,5888,5952⟩) (.node (.single ⟨25152,25216,5952,6016⟩) (.single ⟨25088,25152,6016,6080⟩)))) (.node (.node (.single ⟨25088,25152,6080,6144⟩) (.single ⟨25152,25216,6016,6080⟩)) (.node (.single ⟨25152,25216,6080,6144⟩) (.node (.single ⟨25216,25344,5888,6016⟩) (.single ⟨25216,25344,6016,6144⟩))))) (.node (.node (.node (.single ⟨26624,26752,7424,7552⟩) (.single ⟨26624,26688,7552,7616⟩)) (.node (.single ⟨26624,26688,7616,7680⟩) (.node (.single ⟨26688,26752,7552,7616⟩) (.single ⟨26688,26752,7616,7680⟩)))) (.node (.node (.single ⟨26752,26880,7424,7552⟩) (.single ⟨26752,26816,7552,7616⟩)) (.node (.single ⟨26752,26816,7616,7680⟩) (.node (.single ⟨26816,26880,7552,7616⟩) (.single ⟨26816,26880,7616,7680⟩)))))))
def output32 : Fin 40 → GridBox := outputData32.get
def coverData32 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 0) (.single 20))))) (.node (.node (.node (.single 39) (.single 19)) (.node (.single 1) (.node (.single 22) (.single 38)))) (.node (.node (.single 17) (.single 2)) (.node (.single 21) (.node (.single 37) (.single 18)))))) (.node (.node (.node (.node (.single 3) (.single 23)) (.node (.single 36) (.node (.single 16) (.single 5)))) (.node (.node (.single 24) (.single 34)) (.node (.single 15) (.node (.single 6) (.single 26))))) (.node (.node (.node (.single 33) (.single 13)) (.node (.single 7) (.node (.single 25) (.single 32)))) (.node (.node (.single 14) (.single 8)) (.node (.single 27) (.node (.single 31) (.single 12)))))))
def sourceData32 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 0)))) (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 39) (.node (.single 31) (.single 35)))) (.node (.node (.single 27) (.single 23)) (.node (.single 15) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.node (.single 21) (.single 25)))) (.node (.node (.single 33) (.single 29)) (.node (.single 37) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))) (.node (.node (.single 2) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))))))
def cover32 (i : Fin 40) : Fin 40 := ⟨coverData32.get i % 40, Nat.mod_lt _ (by decide)⟩
def source32 (i : Fin 40) : Fin 40 := ⟨sourceData32.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree32 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 (.cutY 26624 (.cutX 5120 .empty (.cutY 25600 (.cutX 5632 .empty (.cutY 25088 .empty (.cutX 5888 .empty (.cutY 25344 (.cutX 6016 (.cutY 25216 (.cutX 5952 (.cutY 25152 .full .full) (.cutY 25152 .full .full)) .full) (.cutY 25216 (.cutX 6080 (.cutY 25152 .full .full) (.cutY 25152 .full .full)) .full)) .empty)))) .empty)) .empty) (.cutY 26624 .empty (.cutX 7168 .empty (.cutY 27648 (.cutX 7680 (.cutY 27136 (.cutX 7424 .empty (.cutY 26880 (.cutX 7552 (.cutY 26752 .full .full) (.cutY 26752 (.cutX 7616 (.cutY 26688 .full .full) (.cutY 26688 .full .full)) (.cutX 7616 (.cutY 26816 .full .full) (.cutY 26816 .full .full)))) .empty)) .empty) .empty) .empty)))) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 (.cutX 25600 (.cutY 5120 .empty (.cutX 25088 .empty (.cutY 5632 .empty (.cutX 25344 (.cutY 5888 .empty (.cutX 25216 (.cutY 6016 (.cutX 25152 (.cutY 5952 .full .full) (.cutY 5952 .full .full)) (.cutX 25152 (.cutY 6080 .full .full) (.cutY 6080 .full .full))) (.cutY 6016 .full .full))) .empty)))) .empty) .empty) (.cutY 6144 .empty (.cutX 27648 (.cutY 7168 .empty (.cutX 27136 (.cutY 7680 (.cutX 26880 (.cutY 7424 .empty (.cutX 26752 (.cutY 7552 .full (.cutX 26688 (.cutY 7616 .full .full) (.cutY 7616 .full .full))) (.cutY 7552 .full (.cutX 26816 (.cutY 7616 .full .full) (.cutY 7616 .full .full))))) .empty) .empty) .empty)) .empty)))) .empty) .empty)) .empty))

theorem metadata32 : 0<121837468 ∧ 23<128 ∧ 98<128 ∧ 0<4 ∧
    2513/4160=0 ∧ 2513%4160=2513 ∧ ∀ i, (leaves32 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData32).mp
    (by decide +kernel)

theorem sourceChecked32_0 : ∀ i : Fin 40,
    (fun i => output32 i = raw32 (source32 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked32 : ∀ i : Fin 40, (fun i => output32 i = raw32 (source32 i)) i :=
  forallFin_of_zero_offset (fun i => output32 i = raw32 (source32 i)) sourceChecked32_0

theorem coverChecked32_0 : ∀ i : Fin 40,
    (fun i => (output32 (cover32 i)).ContainsBox (raw32 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked32 : ∀ i : Fin 40, (fun i => (output32 (cover32 i)).ContainsBox (raw32 i)) i :=
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

noncomputable def phaseMass32 : ℝ := singlePhaseMass (121837468/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw32 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass32_eq : phaseMass32 = (30459367/409600000000 : ℝ) := by
  unfold phaseMass32
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw32 output32 cover32 source32
    (gridTreeUnionCheck_sound 32768 raw32 output32 cover32 source32 tree32 checked32)
    _ (by norm_num) _, areaUnits32]
  norm_num

-- Frozen phase 6743, atom 2430, type 0, source (22,98).
def leavesData33 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves33 : Fin 10 → DyadicLeaf := leavesData33.get
def raw33 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 22 98 leaves33 i
def outputData33 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨5632,5696,25088,25152⟩) (.single ⟨5632,5696,25152,25216⟩)) (.node (.single ⟨5696,5760,25088,25152⟩) (.node (.single ⟨5696,5760,25152,25216⟩) (.single ⟨5632,5760,25216,25344⟩)))) (.node (.node (.single ⟨5760,5824,25088,25152⟩) (.single ⟨5760,5824,25152,25216⟩)) (.node (.single ⟨5824,5888,25088,25152⟩) (.node (.single ⟨5824,5888,25152,25216⟩) (.single ⟨5760,5888,25216,25344⟩))))) (.node (.node (.node (.single ⟨7424,7552,26880,27008⟩) (.single ⟨7424,7552,27008,27136⟩)) (.node (.single ⟨7552,7616,26880,26944⟩) (.node (.single ⟨7552,7616,26944,27008⟩) (.single ⟨7616,7680,26880,26944⟩)))) (.node (.node (.single ⟨7616,7680,26944,27008⟩) (.single ⟨7552,7616,27008,27072⟩)) (.node (.single ⟨7552,7616,27072,27136⟩) (.node (.single ⟨7616,7680,27008,27072⟩) (.single ⟨7616,7680,27072,27136⟩)))))) (.node (.node (.node (.node (.single ⟨25088,25152,5632,5696⟩) (.single ⟨25088,25152,5696,5760⟩)) (.node (.single ⟨25152,25216,5632,5696⟩) (.node (.single ⟨25152,25216,5696,5760⟩) (.single ⟨25088,25152,5760,5824⟩)))) (.node (.node (.single ⟨25088,25152,5824,5888⟩) (.single ⟨25152,25216,5760,5824⟩)) (.node (.single ⟨25152,25216,5824,5888⟩) (.node (.single ⟨25216,25344,5632,5760⟩) (.single ⟨25216,25344,5760,5888⟩))))) (.node (.node (.node (.single ⟨26880,27008,7424,7552⟩) (.single ⟨26880,26944,7552,7616⟩)) (.node (.single ⟨26880,26944,7616,7680⟩) (.node (.single ⟨26944,27008,7552,7616⟩) (.single ⟨26944,27008,7616,7680⟩)))) (.node (.node (.single ⟨27008,27136,7424,7552⟩) (.single ⟨27008,27072,7552,7616⟩)) (.node (.single ⟨27008,27072,7616,7680⟩) (.node (.single ⟨27072,27136,7552,7616⟩) (.single ⟨27072,27136,7616,7680⟩)))))))
def output33 : Fin 40 → GridBox := outputData33.get
def coverData33 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData33 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover33 (i : Fin 40) : Fin 40 := ⟨coverData33.get i % 40, Nat.mod_lt _ (by decide)⟩
def source33 (i : Fin 40) : Fin 40 := ⟨sourceData33.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree33 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 (.cutY 26624 (.cutX 5120 .empty (.cutY 25600 (.cutX 5632 .empty (.cutY 25088 .empty (.cutX 5888 (.cutY 25344 (.cutX 5760 (.cutY 25216 (.cutX 5696 (.cutY 25152 .full .full) (.cutY 25152 .full .full)) .full) (.cutY 25216 (.cutX 5824 (.cutY 25152 .full .full) (.cutY 25152 .full .full)) .full)) .empty) .empty))) .empty)) .empty) (.cutY 26624 .empty (.cutX 7168 .empty (.cutY 27648 (.cutX 7680 (.cutY 27136 (.cutX 7424 .empty (.cutY 26880 .empty (.cutX 7552 (.cutY 27008 .full .full) (.cutY 27008 (.cutX 7616 (.cutY 26944 .full .full) (.cutY 26944 .full .full)) (.cutX 7616 (.cutY 27072 .full .full) (.cutY 27072 .full .full)))))) .empty) .empty) .empty)))) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 (.cutX 25600 (.cutY 5120 .empty (.cutX 25088 .empty (.cutY 5632 .empty (.cutX 25344 (.cutY 5888 (.cutX 25216 (.cutY 5760 (.cutX 25152 (.cutY 5696 .full .full) (.cutY 5696 .full .full)) (.cutX 25152 (.cutY 5824 .full .full) (.cutY 5824 .full .full))) (.cutY 5760 .full .full)) .empty) .empty)))) .empty) .empty) (.cutY 6144 .empty (.cutX 27648 (.cutY 7168 .empty (.cutX 27136 (.cutY 7680 (.cutX 26880 .empty (.cutY 7424 .empty (.cutX 27008 (.cutY 7552 .full (.cutX 26944 (.cutY 7616 .full .full) (.cutY 7616 .full .full))) (.cutY 7552 .full (.cutX 27072 (.cutY 7616 .full .full) (.cutY 7616 .full .full)))))) .empty) .empty)) .empty)))) .empty) .empty)) .empty))

theorem metadata33 : 0<121837468 ∧ 22<128 ∧ 98<128 ∧ 0<4 ∧
    2430/4160=0 ∧ 2430%4160=2430 ∧ ∀ i, (leaves33 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData33).mp
    (by decide +kernel)

theorem sourceChecked33_0 : ∀ i : Fin 40,
    (fun i => output33 i = raw33 (source33 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked33 : ∀ i : Fin 40, (fun i => output33 i = raw33 (source33 i)) i :=
  forallFin_of_zero_offset (fun i => output33 i = raw33 (source33 i)) sourceChecked33_0

theorem coverChecked33_0 : ∀ i : Fin 40,
    (fun i => (output33 (cover33 i)).ContainsBox (raw33 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked33 : ∀ i : Fin 40, (fun i => (output33 (cover33 i)).ContainsBox (raw33 i)) i :=
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

noncomputable def phaseMass33 : ℝ := singlePhaseMass (121837468/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw33 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass33_eq : phaseMass33 = (30459367/409600000000 : ℝ) := by
  unfold phaseMass33
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw33 output33 cover33 source33
    (gridTreeUnionCheck_sound 32768 raw33 output33 cover33 source33 tree33 checked33)
    _ (by norm_num) _, areaUnits33]
  norm_num

-- Frozen phase 6744, atom 2751, type 0, source (26,99).
def leavesData34 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves34 : Fin 10 → DyadicLeaf := leavesData34.get
def raw34 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 26 99 leaves34 i
def outputData34 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨6656,6720,25344,25408⟩) (.single ⟨6656,6720,25408,25472⟩)) (.node (.single ⟨6720,6784,25344,25408⟩) (.node (.single ⟨6720,6784,25408,25472⟩) (.single ⟨6656,6784,25472,25600⟩)))) (.node (.node (.single ⟨6784,6848,25344,25408⟩) (.single ⟨6784,6848,25408,25472⟩)) (.node (.single ⟨6848,6912,25344,25408⟩) (.node (.single ⟨6848,6912,25408,25472⟩) (.single ⟨6784,6912,25472,25600⟩))))) (.node (.node (.node (.single ⟨7168,7296,25856,25984⟩) (.single ⟨7168,7296,25984,26112⟩)) (.node (.single ⟨7296,7360,25856,25920⟩) (.node (.single ⟨7296,7360,25920,25984⟩) (.single ⟨7360,7424,25856,25920⟩)))) (.node (.node (.single ⟨7360,7424,25920,25984⟩) (.single ⟨7296,7360,25984,26048⟩)) (.node (.single ⟨7296,7360,26048,26112⟩) (.node (.single ⟨7360,7424,25984,26048⟩) (.single ⟨7360,7424,26048,26112⟩)))))) (.node (.node (.node (.node (.single ⟨25344,25408,6656,6720⟩) (.single ⟨25344,25408,6720,6784⟩)) (.node (.single ⟨25408,25472,6656,6720⟩) (.node (.single ⟨25408,25472,6720,6784⟩) (.single ⟨25344,25408,6784,6848⟩)))) (.node (.node (.single ⟨25344,25408,6848,6912⟩) (.single ⟨25408,25472,6784,6848⟩)) (.node (.single ⟨25408,25472,6848,6912⟩) (.node (.single ⟨25472,25600,6656,6784⟩) (.single ⟨25472,25600,6784,6912⟩))))) (.node (.node (.node (.single ⟨25856,25984,7168,7296⟩) (.single ⟨25856,25920,7296,7360⟩)) (.node (.single ⟨25856,25920,7360,7424⟩) (.node (.single ⟨25920,25984,7296,7360⟩) (.single ⟨25920,25984,7360,7424⟩)))) (.node (.node (.single ⟨25984,26112,7168,7296⟩) (.single ⟨25984,26048,7296,7360⟩)) (.node (.single ⟨25984,26048,7360,7424⟩) (.node (.single ⟨26048,26112,7296,7360⟩) (.single ⟨26048,26112,7360,7424⟩)))))))
def output34 : Fin 40 → GridBox := outputData34.get
def coverData34 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData34 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover34 (i : Fin 40) : Fin 40 := ⟨coverData34.get i % 40, Nat.mod_lt _ (by decide)⟩
def source34 (i : Fin 40) : Fin 40 := ⟨sourceData34.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree34 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 .empty (.cutY 26624 (.cutX 7168 (.cutY 25600 (.cutX 6656 .empty (.cutY 25088 .empty (.cutX 6912 (.cutY 25344 .empty (.cutX 6784 (.cutY 25472 (.cutX 6720 (.cutY 25408 .full .full) (.cutY 25408 .full .full)) .full) (.cutY 25472 (.cutX 6848 (.cutY 25408 .full .full) (.cutY 25408 .full .full)) .full))) .empty))) .empty) (.cutY 25600 .empty (.cutX 7680 (.cutY 26112 (.cutX 7424 (.cutY 25856 .empty (.cutX 7296 (.cutY 25984 .full .full) (.cutY 25984 (.cutX 7360 (.cutY 25920 .full .full) (.cutY 25920 .full .full)) (.cutX 7360 (.cutY 26048 .full .full) (.cutY 26048 .full .full))))) .empty) .empty) .empty))) .empty)) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 .empty (.cutX 25600 (.cutY 7168 (.cutX 25088 .empty (.cutY 6656 .empty (.cutX 25344 .empty (.cutY 6912 (.cutX 25472 (.cutY 6784 (.cutX 25408 (.cutY 6720 .full .full) (.cutY 6720 .full .full)) (.cutX 25408 (.cutY 6848 .full .full) (.cutY 6848 .full .full))) (.cutY 6784 .full .full)) .empty)))) .empty) (.cutY 7168 .empty (.cutX 26112 (.cutY 7680 (.cutX 25856 .empty (.cutY 7424 (.cutX 25984 (.cutY 7296 .full (.cutX 25920 (.cutY 7360 .full .full) (.cutY 7360 .full .full))) (.cutY 7296 .full (.cutX 26048 (.cutY 7360 .full .full) (.cutY 7360 .full .full)))) .empty)) .empty) .empty)))) .empty)) .empty) .empty)) .empty))

theorem metadata34 : 0<31548346 ∧ 26<128 ∧ 99<128 ∧ 0<4 ∧
    2751/4160=0 ∧ 2751%4160=2751 ∧ ∀ i, (leaves34 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData34).mp
    (by decide +kernel)

theorem sourceChecked34_0 : ∀ i : Fin 40,
    (fun i => output34 i = raw34 (source34 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked34 : ∀ i : Fin 40, (fun i => output34 i = raw34 (source34 i)) i :=
  forallFin_of_zero_offset (fun i => output34 i = raw34 (source34 i)) sourceChecked34_0

theorem coverChecked34_0 : ∀ i : Fin 40,
    (fun i => (output34 (cover34 i)).ContainsBox (raw34 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked34 : ∀ i : Fin 40, (fun i => (output34 (cover34 i)).ContainsBox (raw34 i)) i :=
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

noncomputable def phaseMass34 : ℝ := singlePhaseMass (31548346/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw34 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass34_eq : phaseMass34 = (15774173/819200000000 : ℝ) := by
  unfold phaseMass34
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw34 output34 cover34 source34
    (gridTreeUnionCheck_sound 32768 raw34 output34 cover34 source34 tree34 checked34)
    _ (by norm_num) _, areaUnits34]
  norm_num

-- Frozen phase 6745, atom 2345, type 0, source (21,98).
def leavesData35 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves35 : Fin 7 → DyadicLeaf := leavesData35.get
def raw35 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 21 98 leaves35 i
def outputData35 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨5376,5504,25088,25216⟩) (.node (.single ⟨5376,5504,25216,25344⟩) (.single ⟨5504,5568,25088,25152⟩))) (.node (.node (.single ⟨5504,5568,25152,25216⟩) (.single ⟨5568,5632,25088,25152⟩)) (.node (.single ⟨5568,5632,25152,25216⟩) (.single ⟨5504,5632,25216,25344⟩)))) (.node (.node (.single ⟨7424,7552,27136,27264⟩) (.node (.single ⟨7424,7552,27264,27392⟩) (.single ⟨7552,7616,27136,27200⟩))) (.node (.node (.single ⟨7552,7616,27200,27264⟩) (.single ⟨7616,7680,27136,27200⟩)) (.node (.single ⟨7616,7680,27200,27264⟩) (.single ⟨7552,7680,27264,27392⟩))))) (.node (.node (.node (.single ⟨25088,25216,5376,5504⟩) (.node (.single ⟨25088,25152,5504,5568⟩) (.single ⟨25088,25152,5568,5632⟩))) (.node (.node (.single ⟨25152,25216,5504,5568⟩) (.single ⟨25152,25216,5568,5632⟩)) (.node (.single ⟨25216,25344,5376,5504⟩) (.single ⟨25216,25344,5504,5632⟩)))) (.node (.node (.single ⟨27136,27264,7424,7552⟩) (.node (.single ⟨27136,27200,7552,7616⟩) (.single ⟨27136,27200,7616,7680⟩))) (.node (.node (.single ⟨27200,27264,7552,7616⟩) (.single ⟨27200,27264,7616,7680⟩)) (.node (.single ⟨27264,27392,7424,7552⟩) (.single ⟨27264,27392,7552,7680⟩))))))
def output35 : Fin 28 → GridBox := outputData35.get
def coverData35 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData35 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover35 (i : Fin 28) : Fin 28 := ⟨coverData35.get i % 28, Nat.mod_lt _ (by decide)⟩
def source35 (i : Fin 28) : Fin 28 := ⟨sourceData35.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree35 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 (.cutY 26624 (.cutX 5120 .empty (.cutY 25600 (.cutX 5632 (.cutY 25088 .empty (.cutX 5376 .empty (.cutY 25344 (.cutX 5504 (.cutY 25216 .full .full) (.cutY 25216 (.cutX 5568 (.cutY 25152 .full .full) (.cutY 25152 .full .full)) .full)) .empty))) .empty) .empty)) .empty) (.cutY 26624 .empty (.cutX 7168 .empty (.cutY 27648 (.cutX 7680 (.cutY 27136 .empty (.cutX 7424 .empty (.cutY 27392 (.cutX 7552 (.cutY 27264 .full .full) (.cutY 27264 (.cutX 7616 (.cutY 27200 .full .full) (.cutY 27200 .full .full)) .full)) .empty))) .empty) .empty)))) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 (.cutX 25600 (.cutY 5120 .empty (.cutX 25088 .empty (.cutY 5632 (.cutX 25344 (.cutY 5376 .empty (.cutX 25216 (.cutY 5504 .full (.cutX 25152 (.cutY 5568 .full .full) (.cutY 5568 .full .full))) (.cutY 5504 .full .full))) .empty) .empty))) .empty) .empty) (.cutY 6144 .empty (.cutX 27648 (.cutY 7168 .empty (.cutX 27136 .empty (.cutY 7680 (.cutX 27392 (.cutY 7424 .empty (.cutX 27264 (.cutY 7552 .full (.cutX 27200 (.cutY 7616 .full .full) (.cutY 7616 .full .full))) (.cutY 7552 .full .full))) .empty) .empty))) .empty)))) .empty) .empty)) .empty))

theorem metadata35 : 0<121837468 ∧ 21<128 ∧ 98<128 ∧ 0<4 ∧
    2345/4160=0 ∧ 2345%4160=2345 ∧ ∀ i, (leaves35 i).Valid 8 := by
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

noncomputable def phaseMass35 : ℝ := singlePhaseMass (121837468/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw35 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass35_eq : phaseMass35 = (30459367/409600000000 : ℝ) := by
  unfold phaseMass35
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw35 output35 cover35 source35
    (gridTreeUnionCheck_sound 32768 raw35 output35 cover35 source35 tree35 checked35)
    _ (by norm_num) _, areaUnits35]
  norm_num

-- Frozen phase 6746, atom 1983, type 0, source (17,96).
def leavesData36 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves36 : Fin 13 → DyadicLeaf := leavesData36.get
def raw36 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 17 96 leaves36 i
def outputData36 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨4352,4416,24576,24640⟩) (.node (.single ⟨4352,4416,24640,24704⟩) (.single ⟨4416,4480,24576,24640⟩))) (.node (.single ⟨4416,4480,24640,24704⟩) (.node (.single ⟨4352,4480,24704,24832⟩) (.single ⟨4480,4544,24576,24640⟩)))) (.node (.node (.single ⟨4480,4544,24640,24704⟩) (.node (.single ⟨4544,4576,24576,24608⟩) (.single ⟨4544,4576,24608,24640⟩))) (.node (.node (.single ⟨4576,4608,24576,24608⟩) (.single ⟨4576,4608,24608,24640⟩)) (.node (.single ⟨4544,4608,24640,24704⟩) (.single ⟨4480,4608,24704,24832⟩))))) (.node (.node (.node (.single ⟨7936,8064,28160,28288⟩) (.node (.single ⟨7936,8064,28288,28416⟩) (.single ⟨8064,8128,28160,28224⟩))) (.node (.single ⟨8064,8128,28224,28288⟩) (.node (.single ⟨8128,8160,28160,28192⟩) (.single ⟨8128,8160,28192,28224⟩)))) (.node (.node (.single ⟨8160,8192,28160,28192⟩) (.node (.single ⟨8160,8192,28192,28224⟩) (.single ⟨8128,8192,28224,28288⟩))) (.node (.node (.single ⟨8064,8128,28288,28352⟩) (.single ⟨8064,8128,28352,28416⟩)) (.node (.single ⟨8128,8192,28288,28352⟩) (.single ⟨8128,8192,28352,28416⟩)))))) (.node (.node (.node (.node (.single ⟨24576,24640,4352,4416⟩) (.node (.single ⟨24576,24640,4416,4480⟩) (.single ⟨24640,24704,4352,4416⟩))) (.node (.single ⟨24640,24704,4416,4480⟩) (.node (.single ⟨24576,24640,4480,4544⟩) (.single ⟨24576,24608,4544,4576⟩)))) (.node (.node (.single ⟨24576,24608,4576,4608⟩) (.node (.single ⟨24608,24640,4544,4576⟩) (.single ⟨24608,24640,4576,4608⟩))) (.node (.node (.single ⟨24640,24704,4480,4544⟩) (.single ⟨24640,24704,4544,4608⟩)) (.node (.single ⟨24704,24832,4352,4480⟩) (.single ⟨24704,24832,4480,4608⟩))))) (.node (.node (.node (.single ⟨28160,28288,7936,8064⟩) (.node (.single ⟨28160,28224,8064,8128⟩) (.single ⟨28160,28192,8128,8160⟩))) (.node (.single ⟨28160,28192,8160,8192⟩) (.node (.single ⟨28192,28224,8128,8160⟩) (.single ⟨28192,28224,8160,8192⟩)))) (.node (.node (.single ⟨28224,28288,8064,8128⟩) (.node (.single ⟨28224,28288,8128,8192⟩) (.single ⟨28288,28416,7936,8064⟩))) (.node (.node (.single ⟨28288,28352,8064,8128⟩) (.single ⟨28288,28352,8128,8192⟩)) (.node (.single ⟨28352,28416,8064,8128⟩) (.single ⟨28352,28416,8128,8192⟩)))))))
def output36 : Fin 52 → GridBox := outputData36.get
def coverData36 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData36 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover36 (i : Fin 52) : Fin 52 := ⟨coverData36.get i % 52, Nat.mod_lt _ (by decide)⟩
def source36 (i : Fin 52) : Fin 52 := ⟨sourceData36.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree36 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 (.cutY 26624 (.cutX 5120 (.cutY 25600 (.cutX 4608 (.cutY 25088 (.cutX 4352 .empty (.cutY 24832 (.cutX 4480 (.cutY 24704 (.cutX 4416 (.cutY 24640 .full .full) (.cutY 24640 .full .full)) .full) (.cutY 24704 (.cutX 4544 (.cutY 24640 .full .full) (.cutY 24640 (.cutX 4576 (.cutY 24608 .full .full) (.cutY 24608 .full .full)) .full)) .full)) .empty)) .empty) .empty) .empty) .empty) .empty) (.cutY 26624 .empty (.cutX 7168 .empty (.cutY 27648 .empty (.cutX 7680 .empty (.cutY 28160 .empty (.cutX 7936 .empty (.cutY 28416 (.cutX 8064 (.cutY 28288 .full .full) (.cutY 28288 (.cutX 8128 (.cutY 28224 .full .full) (.cutY 28224 (.cutX 8160 (.cutY 28192 .full .full) (.cutY 28192 .full .full)) .full)) (.cutX 8128 (.cutY 28352 .full .full) (.cutY 28352 .full .full)))) .empty)))))))) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 (.cutX 25600 (.cutY 5120 (.cutX 25088 (.cutY 4608 (.cutX 24832 (.cutY 4352 .empty (.cutX 24704 (.cutY 4480 (.cutX 24640 (.cutY 4416 .full .full) (.cutY 4416 .full .full)) (.cutX 24640 (.cutY 4544 .full (.cutX 24608 (.cutY 4576 .full .full) (.cutY 4576 .full .full))) (.cutY 4544 .full .full))) (.cutY 4480 .full .full))) .empty) .empty) .empty) .empty) .empty) .empty) (.cutY 6144 .empty (.cutX 27648 .empty (.cutY 7168 .empty (.cutX 28160 .empty (.cutY 7680 .empty (.cutX 28416 (.cutY 7936 .empty (.cutX 28288 (.cutY 8064 .full (.cutX 28224 (.cutY 8128 .full (.cutX 28192 (.cutY 8160 .full .full) (.cutY 8160 .full .full))) (.cutY 8128 .full .full))) (.cutY 8064 .full (.cutX 28352 (.cutY 8128 .full .full) (.cutY 8128 .full .full))))) .empty)))))))) .empty) .empty)) .empty))

theorem metadata36 : 0<121837468 ∧ 17<128 ∧ 96<128 ∧ 0<4 ∧
    1983/4160=0 ∧ 1983%4160=1983 ∧ ∀ i, (leaves36 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData36).mp
    (by decide +kernel)

theorem sourceChecked36_0 : ∀ i : Fin 52,
    (fun i => output36 i = raw36 (source36 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked36 : ∀ i : Fin 52, (fun i => output36 i = raw36 (source36 i)) i :=
  forallFin_of_zero_offset (fun i => output36 i = raw36 (source36 i)) sourceChecked36_0

theorem coverChecked36_0 : ∀ i : Fin 52,
    (fun i => (output36 (cover36 i)).ContainsBox (raw36 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked36 : ∀ i : Fin 52, (fun i => (output36 (cover36 i)).ContainsBox (raw36 i)) i :=
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

noncomputable def phaseMass36 : ℝ := singlePhaseMass (121837468/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw36 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass36_eq : phaseMass36 = (30459367/409600000000 : ℝ) := by
  unfold phaseMass36
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw36 output36 cover36 source36
    (gridTreeUnionCheck_sound 32768 raw36 output36 cover36 source36 tree36 checked36)
    _ (by norm_num) _, areaUnits36]
  norm_num

-- Frozen phase 6747, atom 6326, type 1, source (19,95).
def leavesData37 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves37 : Fin 10 → DyadicLeaf := leavesData37.get
def raw37 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 19 95 leaves37 i
def outputData37 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨4864,4928,24320,24384⟩) (.single ⟨4864,4928,24384,24448⟩)) (.node (.single ⟨4928,4992,24320,24384⟩) (.node (.single ⟨4928,4992,24384,24448⟩) (.single ⟨4864,4992,24448,24576⟩)))) (.node (.node (.single ⟨4992,5056,24320,24384⟩) (.single ⟨4992,5056,24384,24448⟩)) (.node (.single ⟨5056,5120,24320,24384⟩) (.node (.single ⟨5056,5120,24384,24448⟩) (.single ⟨4992,5120,24448,24576⟩))))) (.node (.node (.node (.single ⟨8192,8320,27648,27776⟩) (.single ⟨8192,8320,27776,27904⟩)) (.node (.single ⟨8320,8384,27648,27712⟩) (.node (.single ⟨8320,8384,27712,27776⟩) (.single ⟨8384,8448,27648,27712⟩)))) (.node (.node (.single ⟨8384,8448,27712,27776⟩) (.single ⟨8320,8384,27776,27840⟩)) (.node (.single ⟨8320,8384,27840,27904⟩) (.node (.single ⟨8384,8448,27776,27840⟩) (.single ⟨8384,8448,27840,27904⟩)))))) (.node (.node (.node (.node (.single ⟨24320,24384,4864,4928⟩) (.single ⟨24320,24384,4928,4992⟩)) (.node (.single ⟨24384,24448,4864,4928⟩) (.node (.single ⟨24384,24448,4928,4992⟩) (.single ⟨24320,24384,4992,5056⟩)))) (.node (.node (.single ⟨24320,24384,5056,5120⟩) (.single ⟨24384,24448,4992,5056⟩)) (.node (.single ⟨24384,24448,5056,5120⟩) (.node (.single ⟨24448,24576,4864,4992⟩) (.single ⟨24448,24576,4992,5120⟩))))) (.node (.node (.node (.single ⟨27648,27776,8192,8320⟩) (.single ⟨27648,27712,8320,8384⟩)) (.node (.single ⟨27648,27712,8384,8448⟩) (.node (.single ⟨27712,27776,8320,8384⟩) (.single ⟨27712,27776,8384,8448⟩)))) (.node (.node (.single ⟨27776,27904,8192,8320⟩) (.single ⟨27776,27840,8320,8384⟩)) (.node (.single ⟨27776,27840,8384,8448⟩) (.node (.single ⟨27840,27904,8320,8384⟩) (.single ⟨27840,27904,8384,8448⟩)))))))
def output37 : Fin 40 → GridBox := outputData37.get
def coverData37 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData37 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover37 (i : Fin 40) : Fin 40 := ⟨coverData37.get i % 40, Nat.mod_lt _ (by decide)⟩
def source37 (i : Fin 40) : Fin 40 := ⟨sourceData37.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree37 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 .empty (.cutX 5120 (.cutY 23552 .empty (.cutX 4608 .empty (.cutY 24064 .empty (.cutX 4864 .empty (.cutY 24320 .empty (.cutX 4992 (.cutY 24448 (.cutX 4928 (.cutY 24384 .full .full) (.cutY 24384 .full .full)) .full) (.cutY 24448 (.cutX 5056 (.cutY 24384 .full .full) (.cutY 24384 .full .full)) .full))))))) .empty)) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 .empty (.cutX 9216 (.cutY 27648 .empty (.cutX 8704 (.cutY 28160 (.cutX 8448 (.cutY 27904 (.cutX 8320 (.cutY 27776 .full .full) (.cutY 27776 (.cutX 8384 (.cutY 27712 .full .full) (.cutY 27712 .full .full)) (.cutX 8384 (.cutY 27840 .full .full) (.cutY 27840 .full .full)))) .empty) .empty) .empty) .empty)) .empty)) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 (.cutX 23552 .empty (.cutY 5120 (.cutX 24064 .empty (.cutY 4608 .empty (.cutX 24320 .empty (.cutY 4864 .empty (.cutX 24448 (.cutY 4992 (.cutX 24384 (.cutY 4928 .full .full) (.cutY 4928 .full .full)) (.cutX 24384 (.cutY 5056 .full .full) (.cutY 5056 .full .full))) (.cutY 4992 .full .full)))))) .empty)) .empty)))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 (.cutX 27648 .empty (.cutY 9216 (.cutX 28160 (.cutY 8704 (.cutX 27904 (.cutY 8448 (.cutX 27776 (.cutY 8320 .full (.cutX 27712 (.cutY 8384 .full .full) (.cutY 8384 .full .full))) (.cutY 8320 .full (.cutX 27840 (.cutY 8384 .full .full) (.cutY 8384 .full .full)))) .empty) .empty) .empty) .empty) .empty)) .empty)) .empty) .empty))) .empty))

theorem metadata37 : 0<192153497 ∧ 19<128 ∧ 95<128 ∧ 1<4 ∧
    6326/4160=1 ∧ 6326%4160=2166 ∧ ∀ i, (leaves37 i).Valid 8 := by
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

noncomputable def phaseMass37 : ℝ := singlePhaseMass (192153497/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw37 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass37_eq : phaseMass37 = (192153497/1638400000000 : ℝ) := by
  unfold phaseMass37
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw37 output37 cover37 source37
    (gridTreeUnionCheck_sound 32768 raw37 output37 cover37 source37 tree37 checked37)
    _ (by norm_num) _, areaUnits37]
  norm_num

-- Frozen phase 6748, atom 2168, type 0, source (19,97).
def leavesData38 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩)))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩)))))
def leaves38 : Fin 10 → DyadicLeaf := leavesData38.get
def raw38 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 19 97 leaves38 i
def outputData38 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨4864,4928,24832,24896⟩) (.single ⟨4864,4928,24896,24960⟩)) (.node (.single ⟨4928,4992,24832,24896⟩) (.node (.single ⟨4928,4992,24896,24960⟩) (.single ⟨4864,4992,24960,25088⟩)))) (.node (.node (.single ⟨4992,5056,24832,24896⟩) (.single ⟨4992,5056,24896,24960⟩)) (.node (.single ⟨5056,5120,24832,24896⟩) (.node (.single ⟨5056,5120,24896,24960⟩) (.single ⟨4992,5120,24960,25088⟩))))) (.node (.node (.node (.single ⟨7680,7808,27648,27776⟩) (.single ⟨7680,7808,27776,27904⟩)) (.node (.single ⟨7808,7872,27648,27712⟩) (.node (.single ⟨7808,7872,27712,27776⟩) (.single ⟨7872,7936,27648,27712⟩)))) (.node (.node (.single ⟨7872,7936,27712,27776⟩) (.single ⟨7808,7872,27776,27840⟩)) (.node (.single ⟨7808,7872,27840,27904⟩) (.node (.single ⟨7872,7936,27776,27840⟩) (.single ⟨7872,7936,27840,27904⟩)))))) (.node (.node (.node (.node (.single ⟨24832,24896,4864,4928⟩) (.single ⟨24832,24896,4928,4992⟩)) (.node (.single ⟨24896,24960,4864,4928⟩) (.node (.single ⟨24896,24960,4928,4992⟩) (.single ⟨24832,24896,4992,5056⟩)))) (.node (.node (.single ⟨24832,24896,5056,5120⟩) (.single ⟨24896,24960,4992,5056⟩)) (.node (.single ⟨24896,24960,5056,5120⟩) (.node (.single ⟨24960,25088,4864,4992⟩) (.single ⟨24960,25088,4992,5120⟩))))) (.node (.node (.node (.single ⟨27648,27776,7680,7808⟩) (.single ⟨27648,27712,7808,7872⟩)) (.node (.single ⟨27648,27712,7872,7936⟩) (.node (.single ⟨27712,27776,7808,7872⟩) (.single ⟨27712,27776,7872,7936⟩)))) (.node (.node (.single ⟨27776,27904,7680,7808⟩) (.single ⟨27776,27840,7808,7872⟩)) (.node (.single ⟨27776,27840,7872,7936⟩) (.node (.single ⟨27840,27904,7808,7872⟩) (.single ⟨27840,27904,7872,7936⟩)))))))
def output38 : Fin 40 → GridBox := outputData38.get
def coverData38 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 0) (.single 20))))) (.node (.node (.node (.single 39) (.single 19)) (.node (.single 1) (.node (.single 22) (.single 38)))) (.node (.node (.single 17) (.single 2)) (.node (.single 21) (.node (.single 37) (.single 18)))))) (.node (.node (.node (.node (.single 3) (.single 23)) (.node (.single 36) (.node (.single 16) (.single 5)))) (.node (.node (.single 24) (.single 34)) (.node (.single 15) (.node (.single 6) (.single 26))))) (.node (.node (.node (.single 33) (.single 13)) (.node (.single 7) (.node (.single 25) (.single 32)))) (.node (.node (.single 14) (.single 8)) (.node (.single 27) (.node (.single 31) (.single 12)))))))
def sourceData38 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 0)))) (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 39) (.node (.single 31) (.single 35)))) (.node (.node (.single 27) (.single 23)) (.node (.single 15) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.node (.single 21) (.single 25)))) (.node (.node (.single 33) (.single 29)) (.node (.single 37) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))) (.node (.node (.single 2) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))))))
def cover38 (i : Fin 40) : Fin 40 := ⟨coverData38.get i % 40, Nat.mod_lt _ (by decide)⟩
def source38 (i : Fin 40) : Fin 40 := ⟨sourceData38.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree38 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 (.cutY 26624 (.cutX 5120 (.cutY 25600 (.cutX 4608 .empty (.cutY 25088 (.cutX 4864 .empty (.cutY 24832 .empty (.cutX 4992 (.cutY 24960 (.cutX 4928 (.cutY 24896 .full .full) (.cutY 24896 .full .full)) .full) (.cutY 24960 (.cutX 5056 (.cutY 24896 .full .full) (.cutY 24896 .full .full)) .full)))) .empty)) .empty) .empty) .empty) (.cutY 26624 .empty (.cutX 7168 .empty (.cutY 27648 .empty (.cutX 7680 .empty (.cutY 28160 (.cutX 7936 (.cutY 27904 (.cutX 7808 (.cutY 27776 .full .full) (.cutY 27776 (.cutX 7872 (.cutY 27712 .full .full) (.cutY 27712 .full .full)) (.cutX 7872 (.cutY 27840 .full .full) (.cutY 27840 .full .full)))) .empty) .empty) .empty)))))) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 (.cutX 25600 (.cutY 5120 (.cutX 25088 (.cutY 4608 .empty (.cutX 24832 .empty (.cutY 4864 .empty (.cutX 24960 (.cutY 4992 (.cutX 24896 (.cutY 4928 .full .full) (.cutY 4928 .full .full)) (.cutX 24896 (.cutY 5056 .full .full) (.cutY 5056 .full .full))) (.cutY 4992 .full .full))))) .empty) .empty) .empty) .empty) (.cutY 6144 .empty (.cutX 27648 .empty (.cutY 7168 .empty (.cutX 28160 (.cutY 7680 .empty (.cutX 27904 (.cutY 7936 (.cutX 27776 (.cutY 7808 .full (.cutX 27712 (.cutY 7872 .full .full) (.cutY 7872 .full .full))) (.cutY 7808 .full (.cutX 27840 (.cutY 7872 .full .full) (.cutY 7872 .full .full)))) .empty) .empty)) .empty)))))) .empty) .empty)) .empty))

theorem metadata38 : 0<121837468 ∧ 19<128 ∧ 97<128 ∧ 0<4 ∧
    2168/4160=0 ∧ 2168%4160=2168 ∧ ∀ i, (leaves38 i).Valid 8 := by
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

noncomputable def phaseMass38 : ℝ := singlePhaseMass (121837468/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw38 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass38_eq : phaseMass38 = (30459367/409600000000 : ℝ) := by
  unfold phaseMass38
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw38 output38 cover38 source38
    (gridTreeUnionCheck_sound 32768 raw38 output38 cover38 source38 tree38 checked38)
    _ (by norm_num) _, areaUnits38]
  norm_num

-- Frozen phase 6749, atom 328, type 0, source (2,76).
def leavesData39 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves39 : Fin 10 → DyadicLeaf := leavesData39.get
def raw39 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 2 76 leaves39 i
def outputData39 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨512,576,19456,19520⟩) (.single ⟨512,576,19520,19584⟩)) (.node (.single ⟨576,640,19456,19520⟩) (.node (.single ⟨576,640,19520,19584⟩) (.single ⟨512,640,19584,19712⟩)))) (.node (.node (.single ⟨640,704,19456,19520⟩) (.single ⟨640,704,19520,19584⟩)) (.node (.single ⟨704,768,19456,19520⟩) (.node (.single ⟨704,768,19520,19584⟩) (.single ⟨640,768,19584,19712⟩))))) (.node (.node (.node (.single ⟨13056,13184,32000,32128⟩) (.single ⟨13056,13184,32128,32256⟩)) (.node (.single ⟨13184,13248,32000,32064⟩) (.node (.single ⟨13184,13248,32064,32128⟩) (.single ⟨13248,13312,32000,32064⟩)))) (.node (.node (.single ⟨13248,13312,32064,32128⟩) (.single ⟨13184,13248,32128,32192⟩)) (.node (.single ⟨13184,13248,32192,32256⟩) (.node (.single ⟨13248,13312,32128,32192⟩) (.single ⟨13248,13312,32192,32256⟩)))))) (.node (.node (.node (.node (.single ⟨19456,19520,512,576⟩) (.single ⟨19456,19520,576,640⟩)) (.node (.single ⟨19520,19584,512,576⟩) (.node (.single ⟨19520,19584,576,640⟩) (.single ⟨19456,19520,640,704⟩)))) (.node (.node (.single ⟨19456,19520,704,768⟩) (.single ⟨19520,19584,640,704⟩)) (.node (.single ⟨19520,19584,704,768⟩) (.node (.single ⟨19584,19712,512,640⟩) (.single ⟨19584,19712,640,768⟩))))) (.node (.node (.node (.single ⟨32000,32128,13056,13184⟩) (.single ⟨32000,32064,13184,13248⟩)) (.node (.single ⟨32000,32064,13248,13312⟩) (.node (.single ⟨32064,32128,13184,13248⟩) (.single ⟨32064,32128,13248,13312⟩)))) (.node (.node (.single ⟨32128,32256,13056,13184⟩) (.single ⟨32128,32192,13184,13248⟩)) (.node (.single ⟨32128,32192,13248,13312⟩) (.node (.single ⟨32192,32256,13184,13248⟩) (.single ⟨32192,32256,13248,13312⟩)))))))
def output39 : Fin 40 → GridBox := outputData39.get
def coverData39 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData39 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover39 (i : Fin 40) : Fin 40 := ⟨coverData39.get i % 40, Nat.mod_lt _ (by decide)⟩
def source39 (i : Fin 40) : Fin 40 := ⟨sourceData39.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree39 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 (.cutY 19456 .empty (.cutX 512 .empty (.cutY 19968 (.cutX 768 (.cutY 19712 (.cutX 640 (.cutY 19584 (.cutX 576 (.cutY 19520 .full .full) (.cutY 19520 .full .full)) .full) (.cutY 19584 (.cutX 704 (.cutY 19520 .full .full) (.cutY 19520 .full .full)) .full)) .empty) .empty) .empty))) .empty)) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 (.cutY 31744 .empty (.cutX 12800 .empty (.cutY 32256 (.cutX 13056 .empty (.cutY 32000 .empty (.cutX 13184 (.cutY 32128 .full .full) (.cutY 32128 (.cutX 13248 (.cutY 32064 .full .full) (.cutY 32064 .full .full)) (.cutX 13248 (.cutY 32192 .full .full) (.cutY 32192 .full .full)))))) .empty))) .empty)) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 .empty (.cutY 1024 (.cutX 19968 (.cutY 512 .empty (.cutX 19712 (.cutY 768 (.cutX 19584 (.cutY 640 (.cutX 19520 (.cutY 576 .full .full) (.cutY 576 .full .full)) (.cutX 19520 (.cutY 704 .full .full) (.cutY 704 .full .full))) (.cutY 640 .full .full)) .empty) .empty)) .empty) .empty)) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 .empty (.cutY 13312 (.cutX 32256 (.cutY 12800 .empty (.cutX 32000 .empty (.cutY 13056 .empty (.cutX 32128 (.cutY 13184 .full (.cutX 32064 (.cutY 13248 .full .full) (.cutY 13248 .full .full))) (.cutY 13184 .full (.cutX 32192 (.cutY 13248 .full .full) (.cutY 13248 .full .full))))))) .empty) .empty)) .empty)))))) .empty))

theorem metadata39 : 0<34183877 ∧ 2<128 ∧ 76<128 ∧ 0<4 ∧
    328/4160=0 ∧ 328%4160=328 ∧ ∀ i, (leaves39 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData39).mp
    (by decide +kernel)

theorem sourceChecked39_0 : ∀ i : Fin 40,
    (fun i => output39 i = raw39 (source39 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked39 : ∀ i : Fin 40, (fun i => output39 i = raw39 (source39 i)) i :=
  forallFin_of_zero_offset (fun i => output39 i = raw39 (source39 i)) sourceChecked39_0

theorem coverChecked39_0 : ∀ i : Fin 40,
    (fun i => (output39 (cover39 i)).ContainsBox (raw39 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked39 : ∀ i : Fin 40, (fun i => (output39 (cover39 i)).ContainsBox (raw39 i)) i :=
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

noncomputable def phaseMass39 : ℝ := singlePhaseMass (34183877/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw39 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass39_eq : phaseMass39 = (34183877/1638400000000 : ℝ) := by
  unfold phaseMass39
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw39 output39 cover39 source39
    (gridTreeUnionCheck_sound 32768 raw39 output39 cover39 source39 tree39 checked39)
    _ (by norm_num) _, areaUnits39]
  norm_num

-- Frozen phase 6750, atom 1789, type 0, source (15,94).
def leavesData40 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,2,2⟩)))) (.node (.node (.single ⟨2,2,3⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves40 : Fin 13 → DyadicLeaf := leavesData40.get
def raw40 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 15 94 leaves40 i
def outputData40 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨3840,3968,24064,24192⟩) (.node (.single ⟨3840,3968,24192,24320⟩) (.single ⟨3968,4032,24064,24128⟩))) (.node (.single ⟨3968,4032,24128,24192⟩) (.node (.single ⟨4032,4064,24064,24096⟩) (.single ⟨4032,4064,24096,24128⟩)))) (.node (.node (.single ⟨4064,4096,24064,24096⟩) (.node (.single ⟨4064,4096,24096,24128⟩) (.single ⟨4032,4096,24128,24192⟩))) (.node (.node (.single ⟨3968,4032,24192,24256⟩) (.single ⟨3968,4032,24256,24320⟩)) (.node (.single ⟨4032,4096,24192,24256⟩) (.single ⟨4032,4096,24256,24320⟩))))) (.node (.node (.node (.single ⟨8448,8512,28672,28736⟩) (.node (.single ⟨8448,8512,28736,28800⟩) (.single ⟨8512,8576,28672,28736⟩))) (.node (.single ⟨8512,8576,28736,28800⟩) (.node (.single ⟨8448,8576,28800,28928⟩) (.single ⟨8576,8640,28672,28736⟩)))) (.node (.node (.single ⟨8576,8640,28736,28800⟩) (.node (.single ⟨8640,8672,28672,28704⟩) (.single ⟨8640,8672,28704,28736⟩))) (.node (.node (.single ⟨8672,8704,28672,28704⟩) (.single ⟨8672,8704,28704,28736⟩)) (.node (.single ⟨8640,8704,28736,28800⟩) (.single ⟨8576,8704,28800,28928⟩)))))) (.node (.node (.node (.node (.single ⟨24064,24192,3840,3968⟩) (.node (.single ⟨24064,24128,3968,4032⟩) (.single ⟨24064,24096,4032,4064⟩))) (.node (.single ⟨24064,24096,4064,4096⟩) (.node (.single ⟨24096,24128,4032,4064⟩) (.single ⟨24096,24128,4064,4096⟩)))) (.node (.node (.single ⟨24128,24192,3968,4032⟩) (.node (.single ⟨24128,24192,4032,4096⟩) (.single ⟨24192,24320,3840,3968⟩))) (.node (.node (.single ⟨24192,24256,3968,4032⟩) (.single ⟨24192,24256,4032,4096⟩)) (.node (.single ⟨24256,24320,3968,4032⟩) (.single ⟨24256,24320,4032,4096⟩))))) (.node (.node (.node (.single ⟨28672,28736,8448,8512⟩) (.node (.single ⟨28672,28736,8512,8576⟩) (.single ⟨28736,28800,8448,8512⟩))) (.node (.single ⟨28736,28800,8512,8576⟩) (.node (.single ⟨28672,28736,8576,8640⟩) (.single ⟨28672,28704,8640,8672⟩)))) (.node (.node (.single ⟨28672,28704,8672,8704⟩) (.node (.single ⟨28704,28736,8640,8672⟩) (.single ⟨28704,28736,8672,8704⟩))) (.node (.node (.single ⟨28736,28800,8576,8640⟩) (.single ⟨28736,28800,8640,8704⟩)) (.node (.single ⟨28800,28928,8448,8576⟩) (.single ⟨28800,28928,8576,8704⟩)))))))
def output40 : Fin 52 → GridBox := outputData40.get
def coverData40 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 0) (.node (.single 26) (.single 51))) (.node (.single 25) (.node (.single 1) (.single 34)))) (.node (.node (.single 50) (.node (.single 17) (.single 2))) (.node (.node (.single 27) (.single 49)) (.node (.single 24) (.single 3))))) (.node (.node (.node (.single 32) (.node (.single 48) (.single 19))) (.node (.single 8) (.node (.single 33) (.single 43)))) (.node (.node (.single 18) (.node (.single 9) (.single 35))) (.node (.node (.single 42) (.single 16)) (.node (.single 10) (.single 37)))))) (.node (.node (.node (.node (.single 41) (.node (.single 14) (.single 11))) (.node (.single 36) (.node (.single 40) (.single 15)))) (.node (.node (.single 12) (.node (.single 38) (.single 39))) (.node (.node (.single 13) (.single 4)) (.node (.single 28) (.single 47))))) (.node (.node (.node (.single 23) (.node (.single 5) (.single 30))) (.node (.single 46) (.node (.single 21) (.single 6)))) (.node (.node (.single 29) (.node (.single 45) (.single 22))) (.node (.node (.single 7) (.single 31)) (.node (.single 44) (.single 20)))))))
def sourceData40 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 8))) (.node (.single 12) (.node (.single 36) (.single 40)))) (.node (.node (.single 44) (.node (.single 48) (.single 16))) (.node (.node (.single 20) (.single 24)) (.node (.single 28) (.single 32))))) (.node (.node (.node (.single 35) (.node (.single 27) (.single 31))) (.node (.single 23) (.node (.single 7) (.single 19)))) (.node (.node (.single 15) (.node (.single 51) (.single 43))) (.node (.node (.single 47) (.single 39)) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.node (.single 9) (.single 37))) (.node (.single 45) (.node (.single 41) (.single 49)))) (.node (.node (.single 13) (.node (.single 17) (.single 5))) (.node (.node (.single 21) (.single 29)) (.node (.single 25) (.single 33))))) (.node (.node (.node (.single 34) (.node (.single 30) (.single 26))) (.node (.single 22) (.node (.single 18) (.single 50)))) (.node (.node (.single 46) (.node (.single 42) (.single 38))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))))
def cover40 (i : Fin 52) : Fin 52 := ⟨coverData40.get i % 52, Nat.mod_lt _ (by decide)⟩
def source40 (i : Fin 52) : Fin 52 := ⟨sourceData40.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree40 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 .empty (.cutX 3072 .empty (.cutY 23552 .empty (.cutX 3584 .empty (.cutY 24064 .empty (.cutX 3840 .empty (.cutY 24320 (.cutX 3968 (.cutY 24192 .full .full) (.cutY 24192 (.cutX 4032 (.cutY 24128 .full .full) (.cutY 24128 (.cutX 4064 (.cutY 24096 .full .full) (.cutY 24096 .full .full)) .full)) (.cutX 4032 (.cutY 24256 .full .full) (.cutY 24256 .full .full)))) .empty))))))))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 (.cutY 30720 (.cutX 9216 (.cutY 29696 (.cutX 8704 (.cutY 29184 (.cutX 8448 .empty (.cutY 28928 (.cutX 8576 (.cutY 28800 (.cutX 8512 (.cutY 28736 .full .full) (.cutY 28736 .full .full)) .full) (.cutY 28800 (.cutX 8640 (.cutY 28736 .full .full) (.cutY 28736 (.cutX 8672 (.cutY 28704 .full .full) (.cutY 28704 .full .full)) .full)) .full)) .empty)) .empty) .empty) .empty) .empty) .empty) .empty)) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 .empty (.cutY 2048 .empty (.cutX 23552 .empty (.cutY 3072 .empty (.cutX 24064 .empty (.cutY 3584 .empty (.cutX 24320 (.cutY 3840 .empty (.cutX 24192 (.cutY 3968 .full (.cutX 24128 (.cutY 4032 .full (.cutX 24096 (.cutY 4064 .full .full) (.cutY 4064 .full .full))) (.cutY 4032 .full .full))) (.cutY 3968 .full (.cutX 24256 (.cutY 4032 .full .full) (.cutY 4032 .full .full))))) .empty))))))) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 (.cutX 29696 (.cutY 9216 (.cutX 29184 (.cutY 8704 (.cutX 28928 (.cutY 8448 .empty (.cutX 28800 (.cutY 8576 (.cutX 28736 (.cutY 8512 .full .full) (.cutY 8512 .full .full)) (.cutX 28736 (.cutY 8640 .full (.cutX 28704 (.cutY 8672 .full .full) (.cutY 8672 .full .full))) (.cutY 8640 .full .full))) (.cutY 8576 .full .full))) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty)))) .empty))

theorem metadata40 : 0<77641223 ∧ 15<128 ∧ 94<128 ∧ 0<4 ∧
    1789/4160=0 ∧ 1789%4160=1789 ∧ ∀ i, (leaves40 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData40).mp
    (by decide +kernel)

theorem sourceChecked40_0 : ∀ i : Fin 52,
    (fun i => output40 i = raw40 (source40 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked40 : ∀ i : Fin 52, (fun i => output40 i = raw40 (source40 i)) i :=
  forallFin_of_zero_offset (fun i => output40 i = raw40 (source40 i)) sourceChecked40_0

theorem coverChecked40_0 : ∀ i : Fin 52,
    (fun i => (output40 (cover40 i)).ContainsBox (raw40 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked40 : ∀ i : Fin 52, (fun i => (output40 (cover40 i)).ContainsBox (raw40 i)) i :=
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

noncomputable def phaseMass40 : ℝ := singlePhaseMass (77641223/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw40 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass40_eq : phaseMass40 = (77641223/1638400000000 : ℝ) := by
  unfold phaseMass40
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw40 output40 cover40 source40
    (gridTreeUnionCheck_sound 32768 raw40 output40 cover40 source40 tree40 checked40)
    _ (by norm_num) _, areaUnits40]
  norm_num

-- Frozen phase 6751, atom 6984, type 1, source (27,97).
def leavesData41 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves41 : Fin 13 → DyadicLeaf := leavesData41.get
def raw41 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 27 97 leaves41 i
def outputData41 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨6912,6976,24832,24896⟩) (.node (.single ⟨6912,6976,24896,24960⟩) (.single ⟨6976,7040,24832,24896⟩))) (.node (.single ⟨6976,7040,24896,24960⟩) (.node (.single ⟨6912,7040,24960,25088⟩) (.single ⟨7040,7104,24832,24896⟩)))) (.node (.node (.single ⟨7040,7104,24896,24960⟩) (.node (.single ⟨7104,7136,24832,24864⟩) (.single ⟨7104,7136,24864,24896⟩))) (.node (.node (.single ⟨7136,7168,24832,24864⟩) (.single ⟨7136,7168,24864,24896⟩)) (.node (.single ⟨7104,7168,24896,24960⟩) (.single ⟨7040,7168,24960,25088⟩))))) (.node (.node (.node (.single ⟨7680,7808,25600,25728⟩) (.node (.single ⟨7680,7808,25728,25856⟩) (.single ⟨7808,7872,25600,25664⟩))) (.node (.single ⟨7808,7872,25664,25728⟩) (.node (.single ⟨7872,7904,25600,25632⟩) (.single ⟨7872,7904,25632,25664⟩)))) (.node (.node (.single ⟨7904,7936,25600,25632⟩) (.node (.single ⟨7904,7936,25632,25664⟩) (.single ⟨7872,7936,25664,25728⟩))) (.node (.node (.single ⟨7808,7872,25728,25792⟩) (.single ⟨7808,7872,25792,25856⟩)) (.node (.single ⟨7872,7936,25728,25792⟩) (.single ⟨7872,7936,25792,25856⟩)))))) (.node (.node (.node (.node (.single ⟨24832,24896,6912,6976⟩) (.node (.single ⟨24832,24896,6976,7040⟩) (.single ⟨24896,24960,6912,6976⟩))) (.node (.single ⟨24896,24960,6976,7040⟩) (.node (.single ⟨24832,24896,7040,7104⟩) (.single ⟨24832,24864,7104,7136⟩)))) (.node (.node (.single ⟨24832,24864,7136,7168⟩) (.node (.single ⟨24864,24896,7104,7136⟩) (.single ⟨24864,24896,7136,7168⟩))) (.node (.node (.single ⟨24896,24960,7040,7104⟩) (.single ⟨24896,24960,7104,7168⟩)) (.node (.single ⟨24960,25088,6912,7040⟩) (.single ⟨24960,25088,7040,7168⟩))))) (.node (.node (.node (.single ⟨25600,25728,7680,7808⟩) (.node (.single ⟨25600,25664,7808,7872⟩) (.single ⟨25600,25632,7872,7904⟩))) (.node (.single ⟨25600,25632,7904,7936⟩) (.node (.single ⟨25632,25664,7872,7904⟩) (.single ⟨25632,25664,7904,7936⟩)))) (.node (.node (.single ⟨25664,25728,7808,7872⟩) (.node (.single ⟨25664,25728,7872,7936⟩) (.single ⟨25728,25856,7680,7808⟩))) (.node (.node (.single ⟨25728,25792,7808,7872⟩) (.single ⟨25728,25792,7872,7936⟩)) (.node (.single ⟨25792,25856,7808,7872⟩) (.single ⟨25792,25856,7872,7936⟩)))))))
def output41 : Fin 52 → GridBox := outputData41.get
def coverData41 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData41 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover41 (i : Fin 52) : Fin 52 := ⟨coverData41.get i % 52, Nat.mod_lt _ (by decide)⟩
def source41 (i : Fin 52) : Fin 52 := ⟨sourceData41.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree41 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 .empty (.cutY 26624 (.cutX 7168 (.cutY 25600 (.cutX 6656 .empty (.cutY 25088 (.cutX 6912 .empty (.cutY 24832 .empty (.cutX 7040 (.cutY 24960 (.cutX 6976 (.cutY 24896 .full .full) (.cutY 24896 .full .full)) .full) (.cutY 24960 (.cutX 7104 (.cutY 24896 .full .full) (.cutY 24896 (.cutX 7136 (.cutY 24864 .full .full) (.cutY 24864 .full .full)) .full)) .full)))) .empty)) .empty) (.cutY 25600 .empty (.cutX 7680 .empty (.cutY 26112 (.cutX 7936 (.cutY 25856 (.cutX 7808 (.cutY 25728 .full .full) (.cutY 25728 (.cutX 7872 (.cutY 25664 .full .full) (.cutY 25664 (.cutX 7904 (.cutY 25632 .full .full) (.cutY 25632 .full .full)) .full)) (.cutX 7872 (.cutY 25792 .full .full) (.cutY 25792 .full .full)))) .empty) .empty) .empty)))) .empty)) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 .empty (.cutX 25600 (.cutY 7168 (.cutX 25088 (.cutY 6656 .empty (.cutX 24832 .empty (.cutY 6912 .empty (.cutX 24960 (.cutY 7040 (.cutX 24896 (.cutY 6976 .full .full) (.cutY 6976 .full .full)) (.cutX 24896 (.cutY 7104 .full (.cutX 24864 (.cutY 7136 .full .full) (.cutY 7136 .full .full))) (.cutY 7104 .full .full))) (.cutY 7040 .full .full))))) .empty) .empty) (.cutY 7168 .empty (.cutX 26112 (.cutY 7680 .empty (.cutX 25856 (.cutY 7936 (.cutX 25728 (.cutY 7808 .full (.cutX 25664 (.cutY 7872 .full (.cutX 25632 (.cutY 7904 .full .full) (.cutY 7904 .full .full))) (.cutY 7872 .full .full))) (.cutY 7808 .full (.cutX 25792 (.cutY 7872 .full .full) (.cutY 7872 .full .full)))) .empty) .empty)) .empty)))) .empty)) .empty) .empty)) .empty))

theorem metadata41 : 0<48020332 ∧ 27<128 ∧ 97<128 ∧ 1<4 ∧
    6984/4160=1 ∧ 6984%4160=2824 ∧ ∀ i, (leaves41 i).Valid 8 := by
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

noncomputable def phaseMass41 : ℝ := singlePhaseMass (48020332/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw41 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass41_eq : phaseMass41 = (12005083/409600000000 : ℝ) := by
  unfold phaseMass41
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw41 output41 cover41 source41
    (gridTreeUnionCheck_sound 32768 raw41 output41 cover41 source41 tree41 checked41)
    _ (by norm_num) _, areaUnits41]
  norm_num

-- Frozen phase 6752, atom 6588, type 1, source (22,96).
def leavesData42 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,0⟩))) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves42 : Fin 13 → DyadicLeaf := leavesData42.get
def raw42 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 22 96 leaves42 i
def outputData42 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨5632,5696,24576,24640⟩) (.node (.single ⟨5632,5696,24640,24704⟩) (.single ⟨5696,5760,24576,24640⟩))) (.node (.single ⟨5696,5760,24640,24704⟩) (.node (.single ⟨5632,5760,24704,24832⟩) (.single ⟨5760,5824,24576,24640⟩)))) (.node (.node (.single ⟨5760,5824,24640,24704⟩) (.node (.single ⟨5824,5856,24576,24608⟩) (.single ⟨5824,5856,24608,24640⟩))) (.node (.node (.single ⟨5856,5888,24576,24608⟩) (.single ⟨5856,5888,24608,24640⟩)) (.node (.single ⟨5824,5888,24640,24704⟩) (.single ⟨5760,5888,24704,24832⟩))))) (.node (.node (.node (.single ⟨7936,8064,26880,27008⟩) (.node (.single ⟨7936,8064,27008,27136⟩) (.single ⟨8064,8128,26880,26944⟩))) (.node (.single ⟨8064,8128,26944,27008⟩) (.node (.single ⟨8128,8160,26880,26912⟩) (.single ⟨8128,8160,26912,26944⟩)))) (.node (.node (.single ⟨8160,8192,26880,26912⟩) (.node (.single ⟨8160,8192,26912,26944⟩) (.single ⟨8128,8192,26944,27008⟩))) (.node (.node (.single ⟨8064,8128,27008,27072⟩) (.single ⟨8064,8128,27072,27136⟩)) (.node (.single ⟨8128,8192,27008,27072⟩) (.single ⟨8128,8192,27072,27136⟩)))))) (.node (.node (.node (.node (.single ⟨24576,24640,5632,5696⟩) (.node (.single ⟨24576,24640,5696,5760⟩) (.single ⟨24640,24704,5632,5696⟩))) (.node (.single ⟨24640,24704,5696,5760⟩) (.node (.single ⟨24576,24640,5760,5824⟩) (.single ⟨24576,24608,5824,5856⟩)))) (.node (.node (.single ⟨24576,24608,5856,5888⟩) (.node (.single ⟨24608,24640,5824,5856⟩) (.single ⟨24608,24640,5856,5888⟩))) (.node (.node (.single ⟨24640,24704,5760,5824⟩) (.single ⟨24640,24704,5824,5888⟩)) (.node (.single ⟨24704,24832,5632,5760⟩) (.single ⟨24704,24832,5760,5888⟩))))) (.node (.node (.node (.single ⟨26880,27008,7936,8064⟩) (.node (.single ⟨26880,26944,8064,8128⟩) (.single ⟨26880,26912,8128,8160⟩))) (.node (.single ⟨26880,26912,8160,8192⟩) (.node (.single ⟨26912,26944,8128,8160⟩) (.single ⟨26912,26944,8160,8192⟩)))) (.node (.node (.single ⟨26944,27008,8064,8128⟩) (.node (.single ⟨26944,27008,8128,8192⟩) (.single ⟨27008,27136,7936,8064⟩))) (.node (.node (.single ⟨27008,27072,8064,8128⟩) (.single ⟨27008,27072,8128,8192⟩)) (.node (.single ⟨27072,27136,8064,8128⟩) (.single ⟨27072,27136,8128,8192⟩)))))))
def output42 : Fin 52 → GridBox := outputData42.get
def coverData42 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 0))) (.node (.node (.single 26) (.single 51)) (.node (.single 25) (.single 1))))) (.node (.node (.node (.single 28) (.node (.single 50) (.single 23))) (.node (.single 2) (.node (.single 27) (.single 49)))) (.node (.node (.single 24) (.node (.single 3) (.single 29))) (.node (.node (.single 48) (.single 22)) (.node (.single 5) (.single 30)))))) (.node (.node (.node (.node (.single 46) (.node (.single 21) (.single 6))) (.node (.single 35) (.node (.single 45) (.single 16)))) (.node (.node (.single 11) (.node (.single 36) (.single 40))) (.node (.node (.single 15) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData42 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.single 20) (.node (.single 0) (.single 24)))) (.node (.node (.single 28) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 35))) (.node (.single 31) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.node (.single 17) (.single 13))) (.node (.single 21) (.node (.single 25) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 34) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 30) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover42 (i : Fin 52) : Fin 52 := ⟨coverData42.get i % 52, Nat.mod_lt _ (by decide)⟩
def source42 (i : Fin 52) : Fin 52 := ⟨sourceData42.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree42 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 (.cutY 26624 (.cutX 5120 .empty (.cutY 25600 (.cutX 5632 .empty (.cutY 25088 (.cutX 5888 (.cutY 24832 (.cutX 5760 (.cutY 24704 (.cutX 5696 (.cutY 24640 .full .full) (.cutY 24640 .full .full)) .full) (.cutY 24704 (.cutX 5824 (.cutY 24640 .full .full) (.cutY 24640 (.cutX 5856 (.cutY 24608 .full .full) (.cutY 24608 .full .full)) .full)) .full)) .empty) .empty) .empty)) .empty)) .empty) (.cutY 26624 .empty (.cutX 7168 .empty (.cutY 27648 (.cutX 7680 .empty (.cutY 27136 (.cutX 7936 .empty (.cutY 26880 .empty (.cutX 8064 (.cutY 27008 .full .full) (.cutY 27008 (.cutX 8128 (.cutY 26944 .full .full) (.cutY 26944 (.cutX 8160 (.cutY 26912 .full .full) (.cutY 26912 .full .full)) .full)) (.cutX 8128 (.cutY 27072 .full .full) (.cutY 27072 .full .full)))))) .empty)) .empty)))) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 (.cutX 25600 (.cutY 5120 .empty (.cutX 25088 (.cutY 5632 .empty (.cutX 24832 (.cutY 5888 (.cutX 24704 (.cutY 5760 (.cutX 24640 (.cutY 5696 .full .full) (.cutY 5696 .full .full)) (.cutX 24640 (.cutY 5824 .full (.cutX 24608 (.cutY 5856 .full .full) (.cutY 5856 .full .full))) (.cutY 5824 .full .full))) (.cutY 5760 .full .full)) .empty) .empty)) .empty)) .empty) .empty) (.cutY 6144 .empty (.cutX 27648 (.cutY 7168 .empty (.cutX 27136 (.cutY 7680 .empty (.cutX 26880 .empty (.cutY 7936 .empty (.cutX 27008 (.cutY 8064 .full (.cutX 26944 (.cutY 8128 .full (.cutX 26912 (.cutY 8160 .full .full) (.cutY 8160 .full .full))) (.cutY 8128 .full .full))) (.cutY 8064 .full (.cutX 27072 (.cutY 8128 .full .full) (.cutY 8128 .full .full))))))) .empty)) .empty)))) .empty) .empty)) .empty))

theorem metadata42 : 0<151956162 ∧ 22<128 ∧ 96<128 ∧ 1<4 ∧
    6588/4160=1 ∧ 6588%4160=2428 ∧ ∀ i, (leaves42 i).Valid 8 := by
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

noncomputable def phaseMass42 : ℝ := singlePhaseMass (151956162/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw42 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass42_eq : phaseMass42 = (75978081/819200000000 : ℝ) := by
  unfold phaseMass42
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw42 output42 cover42 source42
    (gridTreeUnionCheck_sound 32768 raw42 output42 cover42 source42 tree42 checked42)
    _ (by norm_num) _, areaUnits42]
  norm_num

-- Frozen phase 6753, atom 2827, type 0, source (27,100).
def leavesData43 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩))) (.node (.single ⟨2,3,0⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves43 : Fin 13 → DyadicLeaf := leavesData43.get
def raw43 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 27 100 leaves43 i
def outputData43 : FiniteInputTree GridBox 26 := (.node (.node (.node (.node (.single ⟨6912,6976,25600,25664⟩) (.node (.single ⟨6912,6976,25664,25728⟩) (.single ⟨6976,7040,25600,25664⟩))) (.node (.single ⟨6976,7040,25664,25728⟩) (.node (.single ⟨6912,7040,25728,25856⟩) (.single ⟨7040,7104,25600,25664⟩)))) (.node (.node (.single ⟨7040,7104,25664,25728⟩) (.node (.single ⟨7104,7168,25600,25664⟩) (.single ⟨7104,7168,25664,25728⟩))) (.node (.node (.single ⟨7040,7104,25728,25792⟩) (.single ⟨7040,7104,25792,25856⟩)) (.node (.single ⟨7104,7168,25728,25792⟩) (.single ⟨7104,7168,25792,25856⟩))))) (.node (.node (.node (.single ⟨25600,25664,6912,6976⟩) (.node (.single ⟨25600,25664,6976,7040⟩) (.single ⟨25664,25728,6912,6976⟩))) (.node (.single ⟨25664,25728,6976,7040⟩) (.node (.single ⟨25600,25664,7040,7104⟩) (.single ⟨25600,25664,7104,7168⟩)))) (.node (.node (.single ⟨25664,25728,7040,7104⟩) (.node (.single ⟨25664,25728,7104,7168⟩) (.single ⟨25728,25856,6912,7040⟩))) (.node (.node (.single ⟨25728,25792,7040,7104⟩) (.single ⟨25728,25792,7104,7168⟩)) (.node (.single ⟨25792,25856,7040,7104⟩) (.single ⟨25792,25856,7104,7168⟩))))))
def output43 : Fin 26 → GridBox := outputData43.get
def coverData43 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 21) (.single 21))) (.node (.single 4) (.node (.single 5) (.single 17)))) (.node (.node (.single 20) (.node (.single 8) (.single 6))) (.node (.node (.single 19) (.single 19)) (.node (.single 6) (.single 7))))) (.node (.node (.node (.single 18) (.node (.single 18) (.single 7))) (.node (.single 8) (.node (.single 20) (.single 17)))) (.node (.node (.single 5) (.node (.single 0) (.single 13))) (.node (.node (.single 25) (.single 12)) (.node (.single 1) (.single 15)))))) (.node (.node (.node (.node (.single 24) (.node (.single 10) (.single 2))) (.node (.single 14) (.node (.single 23) (.single 11)))) (.node (.node (.single 3) (.node (.single 16) (.single 22))) (.node (.node (.single 9) (.single 9)) (.node (.single 22) (.single 16))))) (.node (.node (.node (.single 3) (.node (.single 10) (.single 24))) (.node (.single 15) (.node (.single 1) (.single 11)))) (.node (.node (.single 23) (.node (.single 14) (.single 2))) (.node (.node (.single 12) (.single 25)) (.node (.single 13) (.single 0)))))))
def sourceData43 : FiniteInputTree ℕ 26 := (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 4)))) (.node (.node (.single 8) (.node (.single 12) (.single 7))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23))))) (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 5) (.single 13)))) (.node (.node (.single 9) (.node (.single 6) (.single 1))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22))))))
def cover43 (i : Fin 52) : Fin 26 := ⟨coverData43.get i % 26, Nat.mod_lt _ (by decide)⟩
def source43 (i : Fin 26) : Fin 52 := ⟨sourceData43.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree43 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 .empty (.cutY 26624 (.cutX 7168 (.cutY 25600 .empty (.cutX 6656 .empty (.cutY 26112 (.cutX 6912 .empty (.cutY 25856 (.cutX 7040 (.cutY 25728 (.cutX 6976 (.cutY 25664 .full .full) (.cutY 25664 .full .full)) .full) (.cutY 25728 (.cutX 7104 (.cutY 25664 .full .full) (.cutY 25664 .full .full)) (.cutX 7104 (.cutY 25792 .full .full) (.cutY 25792 .full .full)))) .empty)) .empty))) .empty) .empty)) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 .empty (.cutX 25600 .empty (.cutY 7168 (.cutX 26112 (.cutY 6656 .empty (.cutX 25856 (.cutY 6912 .empty (.cutX 25728 (.cutY 7040 (.cutX 25664 (.cutY 6976 .full .full) (.cutY 6976 .full .full)) (.cutX 25664 (.cutY 7104 .full .full) (.cutY 7104 .full .full))) (.cutY 7040 .full (.cutX 25792 (.cutY 7104 .full .full) (.cutY 7104 .full .full))))) .empty)) .empty) .empty))) .empty)) .empty) .empty)) .empty))

theorem metadata43 : 0<31548346 ∧ 27<128 ∧ 100<128 ∧ 0<4 ∧
    2827/4160=0 ∧ 2827%4160=2827 ∧ ∀ i, (leaves43 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData43).mp
    (by decide +kernel)

theorem sourceChecked43_0 : ∀ i : Fin 26,
    (fun i => output43 i = raw43 (source43 i)) (finOffset 26 0 26 (by decide) i) := by decide +kernel

theorem sourceChecked43 : ∀ i : Fin 26, (fun i => output43 i = raw43 (source43 i)) i :=
  forallFin_of_zero_offset (fun i => output43 i = raw43 (source43 i)) sourceChecked43_0

theorem coverChecked43_0 : ∀ i : Fin 52,
    (fun i => (output43 (cover43 i)).ContainsBox (raw43 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked43 : ∀ i : Fin 52, (fun i => (output43 (cover43 i)).ContainsBox (raw43 i)) i :=
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

theorem areaUnits43 : gridUnionAreaUnits output43 = 131072 := by decide +kernel

noncomputable def phaseMass43 : ℝ := singlePhaseMass (31548346/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw43 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass43_eq : phaseMass43 = (15774173/1638400000000 : ℝ) := by
  unfold phaseMass43
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw43 output43 cover43 source43
    (gridTreeUnionCheck_sound 32768 raw43 output43 cover43 source43 tree43 checked43)
    _ (by norm_num) _, areaUnits43]
  norm_num

-- Frozen phase 6754, atom 1371, type 0, source (11,84).
def leavesData44 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,2,2⟩)) (.node (.single ⟨2,2,3⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves44 : Fin 10 → DyadicLeaf := leavesData44.get
def raw44 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 11 84 leaves44 i
def outputData44 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨2816,2944,21504,21632⟩) (.single ⟨2816,2944,21632,21760⟩)) (.node (.single ⟨2944,3008,21504,21568⟩) (.node (.single ⟨2944,3008,21568,21632⟩) (.single ⟨3008,3072,21504,21568⟩)))) (.node (.node (.single ⟨3008,3072,21568,21632⟩) (.single ⟨2944,3008,21632,21696⟩)) (.node (.single ⟨2944,3008,21696,21760⟩) (.node (.single ⟨3008,3072,21632,21696⟩) (.single ⟨3008,3072,21696,21760⟩))))) (.node (.node (.node (.single ⟨11008,11072,29696,29760⟩) (.single ⟨11008,11072,29760,29824⟩)) (.node (.single ⟨11072,11136,29696,29760⟩) (.node (.single ⟨11072,11136,29760,29824⟩) (.single ⟨11008,11136,29824,29952⟩)))) (.node (.node (.single ⟨11136,11200,29696,29760⟩) (.single ⟨11136,11200,29760,29824⟩)) (.node (.single ⟨11200,11264,29696,29760⟩) (.node (.single ⟨11200,11264,29760,29824⟩) (.single ⟨11136,11264,29824,29952⟩)))))) (.node (.node (.node (.node (.single ⟨21504,21632,2816,2944⟩) (.single ⟨21504,21568,2944,3008⟩)) (.node (.single ⟨21504,21568,3008,3072⟩) (.node (.single ⟨21568,21632,2944,3008⟩) (.single ⟨21568,21632,3008,3072⟩)))) (.node (.node (.single ⟨21632,21760,2816,2944⟩) (.single ⟨21632,21696,2944,3008⟩)) (.node (.single ⟨21632,21696,3008,3072⟩) (.node (.single ⟨21696,21760,2944,3008⟩) (.single ⟨21696,21760,3008,3072⟩))))) (.node (.node (.node (.single ⟨29696,29760,11008,11072⟩) (.single ⟨29696,29760,11072,11136⟩)) (.node (.single ⟨29760,29824,11008,11072⟩) (.node (.single ⟨29760,29824,11072,11136⟩) (.single ⟨29696,29760,11136,11200⟩)))) (.node (.node (.single ⟨29696,29760,11200,11264⟩) (.single ⟨29760,29824,11136,11200⟩)) (.node (.single ⟨29760,29824,11200,11264⟩) (.node (.single ⟨29824,29952,11008,11136⟩) (.single ⟨29824,29952,11136,11264⟩)))))))
def output44 : Fin 40 → GridBox := outputData44.get
def coverData44 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 25) (.single 38)) (.node (.single 14) (.node (.single 2) (.single 21))))) (.node (.node (.node (.single 37) (.single 18)) (.node (.single 3) (.node (.single 23) (.single 36)))) (.node (.node (.single 16) (.single 4)) (.node (.single 22) (.node (.single 35) (.single 17)))))) (.node (.node (.node (.node (.single 5) (.single 24)) (.node (.single 34) (.node (.single 15) (.single 6)))) (.node (.node (.single 26) (.single 33)) (.node (.single 13) (.node (.single 7) (.single 28))))) (.node (.node (.node (.single 32) (.single 11)) (.node (.single 8) (.node (.single 27) (.single 31)))) (.node (.node (.single 12) (.single 9)) (.node (.single 29) (.node (.single 30) (.single 10)))))))
def sourceData44 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 12) (.single 16)))) (.node (.node (.single 20) (.single 24)) (.node (.single 28) (.node (.single 32) (.single 36))))) (.node (.node (.node (.single 39) (.single 31)) (.node (.single 35) (.node (.single 27) (.single 7)))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 17) (.node (.single 13) (.single 21)))) (.node (.node (.single 5) (.single 25)) (.node (.single 33) (.node (.single 29) (.single 37))))) (.node (.node (.node (.single 38) (.single 34)) (.node (.single 30) (.node (.single 26) (.single 22)))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.node (.single 6) (.single 2)))))))
def cover44 (i : Fin 40) : Fin 40 := ⟨coverData44.get i % 40, Nat.mod_lt _ (by decide)⟩
def source44 (i : Fin 40) : Fin 40 := ⟨sourceData44.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree44 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 (.cutY 21504 .empty (.cutX 2560 .empty (.cutY 22016 (.cutX 2816 .empty (.cutY 21760 (.cutX 2944 (.cutY 21632 .full .full) (.cutY 21632 (.cutX 3008 (.cutY 21568 .full .full) (.cutY 21568 .full .full)) (.cutX 3008 (.cutY 21696 .full .full) (.cutY 21696 .full .full)))) .empty)) .empty))) .empty) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 (.cutY 29696 .empty (.cutX 10752 .empty (.cutY 30208 (.cutX 11008 .empty (.cutY 29952 (.cutX 11136 (.cutY 29824 (.cutX 11072 (.cutY 29760 .full .full) (.cutY 29760 .full .full)) .full) (.cutY 29824 (.cutX 11200 (.cutY 29760 .full .full) (.cutY 29760 .full .full)) .full)) .empty)) .empty))) .empty) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 .empty (.cutY 3072 (.cutX 22016 (.cutY 2560 .empty (.cutX 21760 (.cutY 2816 .empty (.cutX 21632 (.cutY 2944 .full (.cutX 21568 (.cutY 3008 .full .full) (.cutY 3008 .full .full))) (.cutY 2944 .full (.cutX 21696 (.cutY 3008 .full .full) (.cutY 3008 .full .full))))) .empty)) .empty) .empty))) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 .empty (.cutY 11264 (.cutX 30208 (.cutY 10752 .empty (.cutX 29952 (.cutY 11008 .empty (.cutX 29824 (.cutY 11136 (.cutX 29760 (.cutY 11072 .full .full) (.cutY 11072 .full .full)) (.cutX 29760 (.cutY 11200 .full .full) (.cutY 11200 .full .full))) (.cutY 11136 .full .full))) .empty)) .empty) .empty))) .empty) .empty)))) .empty))

theorem metadata44 : 0<72090291 ∧ 11<128 ∧ 84<128 ∧ 0<4 ∧
    1371/4160=0 ∧ 1371%4160=1371 ∧ ∀ i, (leaves44 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData44).mp
    (by decide +kernel)

theorem sourceChecked44_0 : ∀ i : Fin 40,
    (fun i => output44 i = raw44 (source44 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked44 : ∀ i : Fin 40, (fun i => output44 i = raw44 (source44 i)) i :=
  forallFin_of_zero_offset (fun i => output44 i = raw44 (source44 i)) sourceChecked44_0

theorem coverChecked44_0 : ∀ i : Fin 40,
    (fun i => (output44 (cover44 i)).ContainsBox (raw44 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked44 : ∀ i : Fin 40, (fun i => (output44 (cover44 i)).ContainsBox (raw44 i)) i :=
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

noncomputable def phaseMass44 : ℝ := singlePhaseMass (72090291/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw44 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass44_eq : phaseMass44 = (72090291/1638400000000 : ℝ) := by
  unfold phaseMass44
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw44 output44 cover44 source44
    (gridTreeUnionCheck_sound 32768 raw44 output44 cover44 source44 tree44 checked44)
    _ (by norm_num) _, areaUnits44]
  norm_num

-- Frozen phase 6755, atom 1478, type 0, source (12,86).
def leavesData45 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,2,2⟩)))) (.node (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,0⟩)) (.node (.single ⟨2,3,1⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves45 : Fin 10 → DyadicLeaf := leavesData45.get
def raw45 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 12 86 leaves45 i
def outputData45 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨3072,3200,22016,22144⟩) (.single ⟨3072,3200,22144,22272⟩)) (.node (.single ⟨3200,3264,22016,22080⟩) (.node (.single ⟨3200,3264,22080,22144⟩) (.single ⟨3264,3328,22016,22080⟩)))) (.node (.node (.single ⟨3264,3328,22080,22144⟩) (.single ⟨3200,3264,22144,22208⟩)) (.node (.single ⟨3200,3264,22208,22272⟩) (.node (.single ⟨3264,3328,22144,22208⟩) (.single ⟨3264,3328,22208,22272⟩))))) (.node (.node (.node (.single ⟨10496,10560,29440,29504⟩) (.single ⟨10496,10560,29504,29568⟩)) (.node (.single ⟨10560,10624,29440,29504⟩) (.node (.single ⟨10560,10624,29504,29568⟩) (.single ⟨10496,10624,29568,29696⟩)))) (.node (.node (.single ⟨10624,10688,29440,29504⟩) (.single ⟨10624,10688,29504,29568⟩)) (.node (.single ⟨10688,10752,29440,29504⟩) (.node (.single ⟨10688,10752,29504,29568⟩) (.single ⟨10624,10752,29568,29696⟩)))))) (.node (.node (.node (.node (.single ⟨22016,22144,3072,3200⟩) (.single ⟨22016,22080,3200,3264⟩)) (.node (.single ⟨22016,22080,3264,3328⟩) (.node (.single ⟨22080,22144,3200,3264⟩) (.single ⟨22080,22144,3264,3328⟩)))) (.node (.node (.single ⟨22144,22272,3072,3200⟩) (.single ⟨22144,22208,3200,3264⟩)) (.node (.single ⟨22144,22208,3264,3328⟩) (.node (.single ⟨22208,22272,3200,3264⟩) (.single ⟨22208,22272,3264,3328⟩))))) (.node (.node (.node (.single ⟨29440,29504,10496,10560⟩) (.single ⟨29440,29504,10560,10624⟩)) (.node (.single ⟨29504,29568,10496,10560⟩) (.node (.single ⟨29504,29568,10560,10624⟩) (.single ⟨29440,29504,10624,10688⟩)))) (.node (.node (.single ⟨29440,29504,10688,10752⟩) (.single ⟨29504,29568,10624,10688⟩)) (.node (.single ⟨29504,29568,10688,10752⟩) (.node (.single ⟨29568,29696,10496,10624⟩) (.single ⟨29568,29696,10624,10752⟩)))))))
def output45 : Fin 40 → GridBox := outputData45.get
def coverData45 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 25) (.single 38)) (.node (.single 14) (.node (.single 2) (.single 21))))) (.node (.node (.node (.single 37) (.single 18)) (.node (.single 3) (.node (.single 23) (.single 36)))) (.node (.node (.single 16) (.single 6)) (.node (.single 26) (.node (.single 33) (.single 13)))))) (.node (.node (.node (.node (.single 7) (.single 28)) (.node (.single 32) (.node (.single 11) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 8) (.node (.single 27) (.single 31)))) (.node (.node (.single 12) (.single 9)) (.node (.single 29) (.node (.single 30) (.single 10)))))))
def sourceData45 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 12) (.single 24)))) (.node (.node (.single 28) (.single 16)) (.node (.single 20) (.node (.single 32) (.single 36))))) (.node (.node (.node (.single 39) (.single 23)) (.node (.single 35) (.node (.single 19) (.single 7)))) (.node (.node (.single 31) (.single 15)) (.node (.single 27) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 25) (.node (.single 13) (.single 29)))) (.node (.node (.single 5) (.single 17)) (.node (.single 33) (.node (.single 21) (.single 37))))) (.node (.node (.node (.single 38) (.single 34)) (.node (.single 22) (.node (.single 18) (.single 30)))) (.node (.node (.single 26) (.single 14)) (.node (.single 10) (.node (.single 6) (.single 2)))))))
def cover45 (i : Fin 40) : Fin 40 := ⟨coverData45.get i % 40, Nat.mod_lt _ (by decide)⟩
def source45 (i : Fin 40) : Fin 40 := ⟨sourceData45.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree45 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 .empty (.cutY 21504 .empty (.cutX 3584 (.cutY 22016 .empty (.cutX 3328 (.cutY 22272 (.cutX 3200 (.cutY 22144 .full .full) (.cutY 22144 (.cutX 3264 (.cutY 22080 .full .full) (.cutY 22080 .full .full)) (.cutX 3264 (.cutY 22208 .full .full) (.cutY 22208 .full .full)))) .empty) .empty)) .empty))) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 (.cutY 29696 (.cutX 10752 (.cutY 29184 .empty (.cutX 10496 .empty (.cutY 29440 .empty (.cutX 10624 (.cutY 29568 (.cutX 10560 (.cutY 29504 .full .full) (.cutY 29504 .full .full)) .full) (.cutY 29568 (.cutX 10688 (.cutY 29504 .full .full) (.cutY 29504 .full .full)) .full))))) .empty) .empty) .empty) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 .empty (.cutY 3072 .empty (.cutX 22016 .empty (.cutY 3584 (.cutX 22272 (.cutY 3328 (.cutX 22144 (.cutY 3200 .full (.cutX 22080 (.cutY 3264 .full .full) (.cutY 3264 .full .full))) (.cutY 3200 .full (.cutX 22208 (.cutY 3264 .full .full) (.cutY 3264 .full .full)))) .empty) .empty) .empty))))) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 (.cutY 11264 (.cutX 29184 .empty (.cutY 10752 (.cutX 29440 .empty (.cutY 10496 .empty (.cutX 29568 (.cutY 10624 (.cutX 29504 (.cutY 10560 .full .full) (.cutY 10560 .full .full)) (.cutX 29504 (.cutY 10688 .full .full) (.cutY 10688 .full .full))) (.cutY 10624 .full .full)))) .empty)) .empty) .empty)) .empty) .empty)))) .empty))

theorem metadata45 : 0<72090291 ∧ 12<128 ∧ 86<128 ∧ 0<4 ∧
    1478/4160=0 ∧ 1478%4160=1478 ∧ ∀ i, (leaves45 i).Valid 8 := by
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

noncomputable def phaseMass45 : ℝ := singlePhaseMass (72090291/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw45 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass45_eq : phaseMass45 = (72090291/1638400000000 : ℝ) := by
  unfold phaseMass45
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw45 output45 cover45 source45
    (gridTreeUnionCheck_sound 32768 raw45 output45 cover45 source45 tree45 checked45)
    _ (by norm_num) _, areaUnits45]
  norm_num

-- Frozen phase 6756, atom 1584, type 0, source (13,89).
def leavesData46 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,2,2⟩)))) (.node (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,0⟩)) (.node (.single ⟨2,3,1⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves46 : Fin 10 → DyadicLeaf := leavesData46.get
def raw46 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 13 89 leaves46 i
def outputData46 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨3328,3456,22784,22912⟩) (.single ⟨3328,3456,22912,23040⟩)) (.node (.single ⟨3456,3520,22784,22848⟩) (.node (.single ⟨3456,3520,22848,22912⟩) (.single ⟨3520,3584,22784,22848⟩)))) (.node (.node (.single ⟨3520,3584,22848,22912⟩) (.single ⟨3456,3520,22912,22976⟩)) (.node (.single ⟨3456,3520,22976,23040⟩) (.node (.single ⟨3520,3584,22912,22976⟩) (.single ⟨3520,3584,22976,23040⟩))))) (.node (.node (.node (.single ⟨9728,9792,29184,29248⟩) (.single ⟨9728,9792,29248,29312⟩)) (.node (.single ⟨9792,9856,29184,29248⟩) (.node (.single ⟨9792,9856,29248,29312⟩) (.single ⟨9728,9856,29312,29440⟩)))) (.node (.node (.single ⟨9856,9920,29184,29248⟩) (.single ⟨9856,9920,29248,29312⟩)) (.node (.single ⟨9920,9984,29184,29248⟩) (.node (.single ⟨9920,9984,29248,29312⟩) (.single ⟨9856,9984,29312,29440⟩)))))) (.node (.node (.node (.node (.single ⟨22784,22912,3328,3456⟩) (.single ⟨22784,22848,3456,3520⟩)) (.node (.single ⟨22784,22848,3520,3584⟩) (.node (.single ⟨22848,22912,3456,3520⟩) (.single ⟨22848,22912,3520,3584⟩)))) (.node (.node (.single ⟨22912,23040,3328,3456⟩) (.single ⟨22912,22976,3456,3520⟩)) (.node (.single ⟨22912,22976,3520,3584⟩) (.node (.single ⟨22976,23040,3456,3520⟩) (.single ⟨22976,23040,3520,3584⟩))))) (.node (.node (.node (.single ⟨29184,29248,9728,9792⟩) (.single ⟨29184,29248,9792,9856⟩)) (.node (.single ⟨29248,29312,9728,9792⟩) (.node (.single ⟨29248,29312,9792,9856⟩) (.single ⟨29184,29248,9856,9920⟩)))) (.node (.node (.single ⟨29184,29248,9920,9984⟩) (.single ⟨29248,29312,9856,9920⟩)) (.node (.single ⟨29248,29312,9920,9984⟩) (.node (.single ⟨29312,29440,9728,9856⟩) (.single ⟨29312,29440,9856,9984⟩)))))))
def output46 : Fin 40 → GridBox := outputData46.get
def coverData46 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 25) (.single 38)) (.node (.single 14) (.node (.single 2) (.single 21))))) (.node (.node (.node (.single 37) (.single 18)) (.node (.single 3) (.node (.single 23) (.single 36)))) (.node (.node (.single 16) (.single 6)) (.node (.single 26) (.node (.single 33) (.single 13)))))) (.node (.node (.node (.node (.single 7) (.single 28)) (.node (.single 32) (.node (.single 11) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 8) (.node (.single 27) (.single 31)))) (.node (.node (.single 12) (.single 9)) (.node (.single 29) (.node (.single 30) (.single 10)))))))
def sourceData46 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 12) (.single 24)))) (.node (.node (.single 28) (.single 16)) (.node (.single 20) (.node (.single 32) (.single 36))))) (.node (.node (.node (.single 39) (.single 23)) (.node (.single 35) (.node (.single 19) (.single 7)))) (.node (.node (.single 31) (.single 15)) (.node (.single 27) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 25) (.node (.single 13) (.single 29)))) (.node (.node (.single 5) (.single 17)) (.node (.single 33) (.node (.single 21) (.single 37))))) (.node (.node (.node (.single 38) (.single 34)) (.node (.single 22) (.node (.single 18) (.single 30)))) (.node (.node (.single 26) (.single 14)) (.node (.single 10) (.node (.single 6) (.single 2)))))))
def cover46 (i : Fin 40) : Fin 40 := ⟨coverData46.get i % 40, Nat.mod_lt _ (by decide)⟩
def source46 (i : Fin 40) : Fin 40 := ⟨sourceData46.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree46 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 .empty (.cutX 3072 .empty (.cutY 23552 (.cutX 3584 (.cutY 23040 (.cutX 3328 .empty (.cutY 22784 .empty (.cutX 3456 (.cutY 22912 .full .full) (.cutY 22912 (.cutX 3520 (.cutY 22848 .full .full) (.cutY 22848 .full .full)) (.cutX 3520 (.cutY 22976 .full .full) (.cutY 22976 .full .full)))))) .empty) .empty) .empty))))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 (.cutY 30720 (.cutX 9216 .empty (.cutY 29696 (.cutX 9728 .empty (.cutY 29184 .empty (.cutX 9984 (.cutY 29440 (.cutX 9856 (.cutY 29312 (.cutX 9792 (.cutY 29248 .full .full) (.cutY 29248 .full .full)) .full) (.cutY 29312 (.cutX 9920 (.cutY 29248 .full .full) (.cutY 29248 .full .full)) .full)) .empty) .empty))) .empty)) .empty) .empty)) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 .empty (.cutY 2048 .empty (.cutX 23552 (.cutY 3072 .empty (.cutX 23040 (.cutY 3584 (.cutX 22784 .empty (.cutY 3328 .empty (.cutX 22912 (.cutY 3456 .full (.cutX 22848 (.cutY 3520 .full .full) (.cutY 3520 .full .full))) (.cutY 3456 .full (.cutX 22976 (.cutY 3520 .full .full) (.cutY 3520 .full .full)))))) .empty) .empty)) .empty))) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 (.cutX 29696 (.cutY 9216 .empty (.cutX 29184 .empty (.cutY 9728 .empty (.cutX 29440 (.cutY 9984 (.cutX 29312 (.cutY 9856 (.cutX 29248 (.cutY 9792 .full .full) (.cutY 9792 .full .full)) (.cutX 29248 (.cutY 9920 .full .full) (.cutY 9920 .full .full))) (.cutY 9856 .full .full)) .empty) .empty)))) .empty) .empty) .empty) .empty)))) .empty))

theorem metadata46 : 0<77641223 ∧ 13<128 ∧ 89<128 ∧ 0<4 ∧
    1584/4160=0 ∧ 1584%4160=1584 ∧ ∀ i, (leaves46 i).Valid 8 := by
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

noncomputable def phaseMass46 : ℝ := singlePhaseMass (77641223/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw46 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass46_eq : phaseMass46 = (77641223/1638400000000 : ℝ) := by
  unfold phaseMass46
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw46 output46 cover46 source46
    (gridTreeUnionCheck_sound 32768 raw46 output46 cover46 source46 tree46 checked46)
    _ (by norm_num) _, areaUnits46]
  norm_num

-- Frozen phase 6757, atom 1040, type 0, source (8,80).
def leavesData47 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩))) (.node (.single ⟨2,3,0⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves47 : Fin 13 → DyadicLeaf := leavesData47.get
def raw47 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 8 80 leaves47 i
def outputData47 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨2048,2112,20480,20544⟩) (.node (.single ⟨2048,2112,20544,20608⟩) (.single ⟨2112,2176,20480,20544⟩))) (.node (.single ⟨2112,2176,20544,20608⟩) (.node (.single ⟨2048,2176,20608,20736⟩) (.single ⟨2176,2240,20480,20544⟩)))) (.node (.node (.single ⟨2176,2240,20544,20608⟩) (.node (.single ⟨2240,2304,20480,20544⟩) (.single ⟨2240,2304,20544,20608⟩))) (.node (.node (.single ⟨2176,2240,20608,20672⟩) (.single ⟨2176,2240,20672,20736⟩)) (.node (.single ⟨2240,2304,20608,20672⟩) (.single ⟨2240,2304,20672,20736⟩))))) (.node (.node (.node (.single ⟨12032,12096,30464,30528⟩) (.node (.single ⟨12032,12096,30528,30592⟩) (.single ⟨12096,12160,30464,30528⟩))) (.node (.single ⟨12096,12160,30528,30592⟩) (.node (.single ⟨12032,12160,30592,30720⟩) (.single ⟨12160,12224,30464,30528⟩)))) (.node (.node (.single ⟨12160,12224,30528,30592⟩) (.node (.single ⟨12224,12288,30464,30528⟩) (.single ⟨12224,12288,30528,30592⟩))) (.node (.node (.single ⟨12160,12224,30592,30656⟩) (.single ⟨12160,12224,30656,30720⟩)) (.node (.single ⟨12224,12288,30592,30656⟩) (.single ⟨12224,12288,30656,30720⟩)))))) (.node (.node (.node (.node (.single ⟨20480,20544,2048,2112⟩) (.node (.single ⟨20480,20544,2112,2176⟩) (.single ⟨20544,20608,2048,2112⟩))) (.node (.single ⟨20544,20608,2112,2176⟩) (.node (.single ⟨20480,20544,2176,2240⟩) (.single ⟨20480,20544,2240,2304⟩)))) (.node (.node (.single ⟨20544,20608,2176,2240⟩) (.node (.single ⟨20544,20608,2240,2304⟩) (.single ⟨20608,20736,2048,2176⟩))) (.node (.node (.single ⟨20608,20672,2176,2240⟩) (.single ⟨20608,20672,2240,2304⟩)) (.node (.single ⟨20672,20736,2176,2240⟩) (.single ⟨20672,20736,2240,2304⟩))))) (.node (.node (.node (.single ⟨30464,30528,12032,12096⟩) (.node (.single ⟨30464,30528,12096,12160⟩) (.single ⟨30528,30592,12032,12096⟩))) (.node (.single ⟨30528,30592,12096,12160⟩) (.node (.single ⟨30464,30528,12160,12224⟩) (.single ⟨30464,30528,12224,12288⟩)))) (.node (.node (.single ⟨30528,30592,12160,12224⟩) (.node (.single ⟨30528,30592,12224,12288⟩) (.single ⟨30592,30720,12032,12160⟩))) (.node (.node (.single ⟨30592,30656,12160,12224⟩) (.single ⟨30592,30656,12224,12288⟩)) (.node (.single ⟨30656,30720,12160,12224⟩) (.single ⟨30656,30720,12224,12288⟩)))))))
def output47 : Fin 52 → GridBox := outputData47.get
def coverData47 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 34) (.single 47))) (.node (.single 17) (.node (.single 5) (.single 30)))) (.node (.node (.single 46) (.node (.single 21) (.single 6))) (.node (.node (.single 32) (.single 45)) (.node (.single 19) (.single 7))))) (.node (.node (.node (.single 31) (.node (.single 44) (.single 20))) (.node (.single 8) (.node (.single 33) (.single 43)))) (.node (.node (.single 18) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 9)) (.node (.single 35) (.single 42))))) (.node (.node (.node (.single 16) (.node (.single 10) (.single 37))) (.node (.single 41) (.node (.single 14) (.single 11)))) (.node (.node (.single 36) (.node (.single 40) (.single 15))) (.node (.node (.single 12) (.single 38)) (.node (.single 39) (.single 13)))))))
def sourceData47 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 4)))) (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.node (.single 36) (.single 40)) (.node (.single 44) (.single 48))))) (.node (.node (.node (.single 51) (.node (.single 43) (.single 47))) (.node (.single 39) (.node (.single 3) (.single 19)))) (.node (.node (.single 11) (.node (.single 15) (.single 7))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 5) (.single 13)))) (.node (.node (.single 9) (.node (.single 17) (.single 1))) (.node (.node (.single 37) (.single 45)) (.node (.single 41) (.single 49))))) (.node (.node (.node (.single 50) (.node (.single 46) (.single 42))) (.node (.single 38) (.node (.single 18) (.single 14)))) (.node (.node (.single 10) (.node (.single 6) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover47 (i : Fin 52) : Fin 52 := ⟨coverData47.get i % 52, Nat.mod_lt _ (by decide)⟩
def source47 (i : Fin 52) : Fin 52 := ⟨sourceData47.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree47 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 (.cutY 21504 (.cutX 2560 (.cutY 20992 (.cutX 2304 (.cutY 20736 (.cutX 2176 (.cutY 20608 (.cutX 2112 (.cutY 20544 .full .full) (.cutY 20544 .full .full)) .full) (.cutY 20608 (.cutX 2240 (.cutY 20544 .full .full) (.cutY 20544 .full .full)) (.cutX 2240 (.cutY 20672 .full .full) (.cutY 20672 .full .full)))) .empty) .empty) .empty) .empty) .empty) .empty) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 .empty (.cutY 29696 .empty (.cutX 11776 .empty (.cutY 30208 .empty (.cutX 12032 .empty (.cutY 30464 .empty (.cutX 12160 (.cutY 30592 (.cutX 12096 (.cutY 30528 .full .full) (.cutY 30528 .full .full)) .full) (.cutY 30592 (.cutX 12224 (.cutY 30528 .full .full) (.cutY 30528 .full .full)) (.cutX 12224 (.cutY 30656 .full .full) (.cutY 30656 .full .full)))))))))) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 (.cutY 3072 (.cutX 20992 (.cutY 2560 (.cutX 20736 (.cutY 2304 (.cutX 20608 (.cutY 2176 (.cutX 20544 (.cutY 2112 .full .full) (.cutY 2112 .full .full)) (.cutX 20544 (.cutY 2240 .full .full) (.cutY 2240 .full .full))) (.cutY 2176 .full (.cutX 20672 (.cutY 2240 .full .full) (.cutY 2240 .full .full)))) .empty) .empty) .empty) .empty) .empty) .empty)) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 .empty (.cutY 11264 .empty (.cutX 30208 .empty (.cutY 11776 .empty (.cutX 30464 .empty (.cutY 12032 .empty (.cutX 30592 (.cutY 12160 (.cutX 30528 (.cutY 12096 .full .full) (.cutY 12096 .full .full)) (.cutX 30528 (.cutY 12224 .full .full) (.cutY 12224 .full .full))) (.cutY 12160 .full (.cutX 30656 (.cutY 12224 .full .full) (.cutY 12224 .full .full))))))))))) .empty) .empty)))) .empty))

theorem metadata47 : 0<72090291 ∧ 8<128 ∧ 80<128 ∧ 0<4 ∧
    1040/4160=0 ∧ 1040%4160=1040 ∧ ∀ i, (leaves47 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData47).mp
    (by decide +kernel)

theorem sourceChecked47_0 : ∀ i : Fin 52,
    (fun i => output47 i = raw47 (source47 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked47 : ∀ i : Fin 52, (fun i => output47 i = raw47 (source47 i)) i :=
  forallFin_of_zero_offset (fun i => output47 i = raw47 (source47 i)) sourceChecked47_0

theorem coverChecked47_0 : ∀ i : Fin 52,
    (fun i => (output47 (cover47 i)).ContainsBox (raw47 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked47 : ∀ i : Fin 52, (fun i => (output47 (cover47 i)).ContainsBox (raw47 i)) i :=
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

noncomputable def phaseMass47 : ℝ := singlePhaseMass (72090291/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw47 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass47_eq : phaseMass47 = (72090291/1638400000000 : ℝ) := by
  unfold phaseMass47
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw47 output47 cover47 source47
    (gridTreeUnionCheck_sound 32768 raw47 output47 cover47 source47 tree47 checked47)
    _ (by norm_num) _, areaUnits47]
  norm_num

-- Frozen phase 6758, atom 1585, type 0, source (13,90).
def leavesData48 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves48 : Fin 7 → DyadicLeaf := leavesData48.get
def raw48 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 13 90 leaves48 i
def outputData48 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3328,3456,23040,23168⟩) (.node (.single ⟨3328,3456,23168,23296⟩) (.single ⟨3456,3520,23040,23104⟩))) (.node (.node (.single ⟨3456,3520,23104,23168⟩) (.single ⟨3520,3584,23040,23104⟩)) (.node (.single ⟨3520,3584,23104,23168⟩) (.single ⟨3456,3584,23168,23296⟩)))) (.node (.node (.single ⟨9472,9600,29184,29312⟩) (.node (.single ⟨9472,9600,29312,29440⟩) (.single ⟨9600,9664,29184,29248⟩))) (.node (.node (.single ⟨9600,9664,29248,29312⟩) (.single ⟨9664,9728,29184,29248⟩)) (.node (.single ⟨9664,9728,29248,29312⟩) (.single ⟨9600,9728,29312,29440⟩))))) (.node (.node (.node (.single ⟨23040,23168,3328,3456⟩) (.node (.single ⟨23040,23104,3456,3520⟩) (.single ⟨23040,23104,3520,3584⟩))) (.node (.node (.single ⟨23104,23168,3456,3520⟩) (.single ⟨23104,23168,3520,3584⟩)) (.node (.single ⟨23168,23296,3328,3456⟩) (.single ⟨23168,23296,3456,3584⟩)))) (.node (.node (.single ⟨29184,29312,9472,9600⟩) (.node (.single ⟨29184,29248,9600,9664⟩) (.single ⟨29184,29248,9664,9728⟩))) (.node (.node (.single ⟨29248,29312,9600,9664⟩) (.single ⟨29248,29312,9664,9728⟩)) (.node (.single ⟨29312,29440,9472,9600⟩) (.single ⟨29312,29440,9600,9728⟩))))))
def output48 : Fin 28 → GridBox := outputData48.get
def coverData48 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData48 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover48 (i : Fin 28) : Fin 28 := ⟨coverData48.get i % 28, Nat.mod_lt _ (by decide)⟩
def source48 (i : Fin 28) : Fin 28 := ⟨sourceData48.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree48 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 .empty (.cutX 3072 .empty (.cutY 23552 (.cutX 3584 (.cutY 23040 .empty (.cutX 3328 .empty (.cutY 23296 (.cutX 3456 (.cutY 23168 .full .full) (.cutY 23168 (.cutX 3520 (.cutY 23104 .full .full) (.cutY 23104 .full .full)) .full)) .empty))) .empty) .empty))))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 (.cutY 30720 (.cutX 9216 .empty (.cutY 29696 (.cutX 9728 (.cutY 29184 .empty (.cutX 9472 .empty (.cutY 29440 (.cutX 9600 (.cutY 29312 .full .full) (.cutY 29312 (.cutX 9664 (.cutY 29248 .full .full) (.cutY 29248 .full .full)) .full)) .empty))) .empty) .empty)) .empty) .empty)) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 .empty (.cutY 2048 .empty (.cutX 23552 (.cutY 3072 .empty (.cutX 23040 .empty (.cutY 3584 (.cutX 23296 (.cutY 3328 .empty (.cutX 23168 (.cutY 3456 .full (.cutX 23104 (.cutY 3520 .full .full) (.cutY 3520 .full .full))) (.cutY 3456 .full .full))) .empty) .empty))) .empty))) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 (.cutX 29696 (.cutY 9216 .empty (.cutX 29184 .empty (.cutY 9728 (.cutX 29440 (.cutY 9472 .empty (.cutX 29312 (.cutY 9600 .full (.cutX 29248 (.cutY 9664 .full .full) (.cutY 9664 .full .full))) (.cutY 9600 .full .full))) .empty) .empty))) .empty) .empty) .empty) .empty)))) .empty))

theorem metadata48 : 0<77641223 ∧ 13<128 ∧ 90<128 ∧ 0<4 ∧
    1585/4160=0 ∧ 1585%4160=1585 ∧ ∀ i, (leaves48 i).Valid 8 := by
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

noncomputable def phaseMass48 : ℝ := singlePhaseMass (77641223/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw48 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass48_eq : phaseMass48 = (77641223/1638400000000 : ℝ) := by
  unfold phaseMass48
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw48 output48 cover48 source48
    (gridTreeUnionCheck_sound 32768 raw48 output48 cover48 source48 tree48 checked48)
    _ (by norm_num) _, areaUnits48]
  norm_num

-- Frozen phase 6759, atom 5944, type 1, source (15,89).
def leavesData49 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves49 : Fin 13 → DyadicLeaf := leavesData49.get
def raw49 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 15 89 leaves49 i
def outputData49 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨3840,3968,22784,22912⟩) (.node (.single ⟨3840,3968,22912,23040⟩) (.single ⟨3968,4032,22784,22848⟩))) (.node (.single ⟨3968,4032,22848,22912⟩) (.node (.single ⟨4032,4064,22784,22816⟩) (.single ⟨4032,4064,22816,22848⟩)))) (.node (.node (.single ⟨4064,4096,22784,22816⟩) (.node (.single ⟨4064,4096,22816,22848⟩) (.single ⟨4032,4096,22848,22912⟩))) (.node (.node (.single ⟨3968,4032,22912,22976⟩) (.single ⟨3968,4032,22976,23040⟩)) (.node (.single ⟨4032,4096,22912,22976⟩) (.single ⟨4032,4096,22976,23040⟩))))) (.node (.node (.node (.single ⟨9728,9792,28672,28736⟩) (.node (.single ⟨9728,9792,28736,28800⟩) (.single ⟨9792,9856,28672,28736⟩))) (.node (.single ⟨9792,9856,28736,28800⟩) (.node (.single ⟨9728,9856,28800,28928⟩) (.single ⟨9856,9920,28672,28736⟩)))) (.node (.node (.single ⟨9856,9920,28736,28800⟩) (.node (.single ⟨9920,9952,28672,28704⟩) (.single ⟨9920,9952,28704,28736⟩))) (.node (.node (.single ⟨9952,9984,28672,28704⟩) (.single ⟨9952,9984,28704,28736⟩)) (.node (.single ⟨9920,9984,28736,28800⟩) (.single ⟨9856,9984,28800,28928⟩)))))) (.node (.node (.node (.node (.single ⟨22784,22912,3840,3968⟩) (.node (.single ⟨22784,22848,3968,4032⟩) (.single ⟨22784,22816,4032,4064⟩))) (.node (.single ⟨22784,22816,4064,4096⟩) (.node (.single ⟨22816,22848,4032,4064⟩) (.single ⟨22816,22848,4064,4096⟩)))) (.node (.node (.single ⟨22848,22912,3968,4032⟩) (.node (.single ⟨22848,22912,4032,4096⟩) (.single ⟨22912,23040,3840,3968⟩))) (.node (.node (.single ⟨22912,22976,3968,4032⟩) (.single ⟨22912,22976,4032,4096⟩)) (.node (.single ⟨22976,23040,3968,4032⟩) (.single ⟨22976,23040,4032,4096⟩))))) (.node (.node (.node (.single ⟨28672,28736,9728,9792⟩) (.node (.single ⟨28672,28736,9792,9856⟩) (.single ⟨28736,28800,9728,9792⟩))) (.node (.single ⟨28736,28800,9792,9856⟩) (.node (.single ⟨28672,28736,9856,9920⟩) (.single ⟨28672,28704,9920,9952⟩)))) (.node (.node (.single ⟨28672,28704,9952,9984⟩) (.node (.single ⟨28704,28736,9920,9952⟩) (.single ⟨28704,28736,9952,9984⟩))) (.node (.node (.single ⟨28736,28800,9856,9920⟩) (.single ⟨28736,28800,9920,9984⟩)) (.node (.single ⟨28800,28928,9728,9856⟩) (.single ⟨28800,28928,9856,9984⟩)))))))
def output49 : Fin 52 → GridBox := outputData49.get
def coverData49 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 0) (.node (.single 26) (.single 51))) (.node (.single 25) (.node (.single 1) (.single 34)))) (.node (.node (.single 50) (.node (.single 17) (.single 2))) (.node (.node (.single 27) (.single 49)) (.node (.single 24) (.single 3))))) (.node (.node (.node (.single 32) (.node (.single 48) (.single 19))) (.node (.single 9) (.node (.single 35) (.single 42)))) (.node (.node (.single 16) (.node (.single 10) (.single 37))) (.node (.node (.single 41) (.single 14)) (.node (.single 8) (.single 33)))))) (.node (.node (.node (.node (.single 43) (.node (.single 18) (.single 11))) (.node (.single 36) (.node (.single 40) (.single 15)))) (.node (.node (.single 12) (.node (.single 38) (.single 39))) (.node (.node (.single 13) (.single 4)) (.node (.single 28) (.single 47))))) (.node (.node (.node (.single 23) (.node (.single 5) (.single 30))) (.node (.single 46) (.node (.single 21) (.single 6)))) (.node (.node (.single 29) (.node (.single 45) (.single 22))) (.node (.node (.single 7) (.single 31)) (.node (.single 44) (.single 20)))))))
def sourceData49 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 8))) (.node (.single 12) (.node (.single 36) (.single 40)))) (.node (.node (.single 44) (.node (.single 48) (.single 24))) (.node (.node (.single 16) (.single 20)) (.node (.single 28) (.single 32))))) (.node (.node (.node (.single 35) (.node (.single 23) (.single 31))) (.node (.single 19) (.node (.single 7) (.single 27)))) (.node (.node (.single 15) (.node (.single 51) (.single 43))) (.node (.node (.single 47) (.single 39)) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.node (.single 9) (.single 37))) (.node (.single 45) (.node (.single 41) (.single 49)))) (.node (.node (.single 13) (.node (.single 25) (.single 5))) (.node (.node (.single 17) (.single 29)) (.node (.single 21) (.single 33))))) (.node (.node (.node (.single 34) (.node (.single 30) (.single 22))) (.node (.single 18) (.node (.single 26) (.single 50)))) (.node (.node (.single 46) (.node (.single 42) (.single 38))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))))
def cover49 (i : Fin 52) : Fin 52 := ⟨coverData49.get i % 52, Nat.mod_lt _ (by decide)⟩
def source49 (i : Fin 52) : Fin 52 := ⟨sourceData49.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree49 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 .empty (.cutX 3072 .empty (.cutY 23552 (.cutX 3584 .empty (.cutY 23040 (.cutX 3840 .empty (.cutY 22784 .empty (.cutX 3968 (.cutY 22912 .full .full) (.cutY 22912 (.cutX 4032 (.cutY 22848 .full .full) (.cutY 22848 (.cutX 4064 (.cutY 22816 .full .full) (.cutY 22816 .full .full)) .full)) (.cutX 4032 (.cutY 22976 .full .full) (.cutY 22976 .full .full)))))) .empty)) .empty))))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 (.cutY 30720 (.cutX 9216 .empty (.cutY 29696 (.cutX 9728 .empty (.cutY 29184 (.cutX 9984 (.cutY 28928 (.cutX 9856 (.cutY 28800 (.cutX 9792 (.cutY 28736 .full .full) (.cutY 28736 .full .full)) .full) (.cutY 28800 (.cutX 9920 (.cutY 28736 .full .full) (.cutY 28736 (.cutX 9952 (.cutY 28704 .full .full) (.cutY 28704 .full .full)) .full)) .full)) .empty) .empty) .empty)) .empty)) .empty) .empty)) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 .empty (.cutY 2048 .empty (.cutX 23552 (.cutY 3072 .empty (.cutX 23040 (.cutY 3584 .empty (.cutX 22784 .empty (.cutY 3840 .empty (.cutX 22912 (.cutY 3968 .full (.cutX 22848 (.cutY 4032 .full (.cutX 22816 (.cutY 4064 .full .full) (.cutY 4064 .full .full))) (.cutY 4032 .full .full))) (.cutY 3968 .full (.cutX 22976 (.cutY 4032 .full .full) (.cutY 4032 .full .full))))))) .empty)) .empty))) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 (.cutX 29696 (.cutY 9216 .empty (.cutX 29184 (.cutY 9728 .empty (.cutX 28928 (.cutY 9984 (.cutX 28800 (.cutY 9856 (.cutX 28736 (.cutY 9792 .full .full) (.cutY 9792 .full .full)) (.cutX 28736 (.cutY 9920 .full (.cutX 28704 (.cutY 9952 .full .full) (.cutY 9952 .full .full))) (.cutY 9920 .full .full))) (.cutY 9856 .full .full)) .empty) .empty)) .empty)) .empty) .empty) .empty) .empty)))) .empty))

theorem metadata49 : 0<112823226 ∧ 15<128 ∧ 89<128 ∧ 1<4 ∧
    5944/4160=1 ∧ 5944%4160=1784 ∧ ∀ i, (leaves49 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData49).mp
    (by decide +kernel)

theorem sourceChecked49_0 : ∀ i : Fin 52,
    (fun i => output49 i = raw49 (source49 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked49 : ∀ i : Fin 52, (fun i => output49 i = raw49 (source49 i)) i :=
  forallFin_of_zero_offset (fun i => output49 i = raw49 (source49 i)) sourceChecked49_0

theorem coverChecked49_0 : ∀ i : Fin 52,
    (fun i => (output49 (cover49 i)).ContainsBox (raw49 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked49 : ∀ i : Fin 52, (fun i => (output49 (cover49 i)).ContainsBox (raw49 i)) i :=
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

noncomputable def phaseMass49 : ℝ := singlePhaseMass (112823226/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw49 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass49_eq : phaseMass49 = (56411613/819200000000 : ℝ) := by
  unfold phaseMass49
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw49 output49 cover49 source49
    (gridTreeUnionCheck_sound 32768 raw49 output49 cover49 source49 tree49 checked49)
    _ (by norm_num) _, areaUnits49]
  norm_num

-- Frozen phase 6760, atom 2258, type 0, source (20,98).
def leavesData50 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves50 : Fin 4 → DyadicLeaf := leavesData50.get
def raw50 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 20 98 leaves50 i
def outputData50 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨5120,5248,25088,25216⟩) (.single ⟨5120,5248,25216,25344⟩)) (.node (.single ⟨5248,5376,25088,25216⟩) (.single ⟨5248,5376,25216,25344⟩))) (.node (.node (.single ⟨7424,7552,27392,27520⟩) (.single ⟨7424,7552,27520,27648⟩)) (.node (.single ⟨7552,7680,27392,27520⟩) (.single ⟨7552,7680,27520,27648⟩)))) (.node (.node (.node (.single ⟨25088,25216,5120,5248⟩) (.single ⟨25088,25216,5248,5376⟩)) (.node (.single ⟨25216,25344,5120,5248⟩) (.single ⟨25216,25344,5248,5376⟩))) (.node (.node (.single ⟨27392,27520,7424,7552⟩) (.single ⟨27392,27520,7552,7680⟩)) (.node (.single ⟨27520,27648,7424,7552⟩) (.single ⟨27520,27648,7552,7680⟩)))))
def output50 : Fin 16 → GridBox := outputData50.get
def coverData50 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData50 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover50 (i : Fin 16) : Fin 16 := ⟨coverData50.get i % 16, Nat.mod_lt _ (by decide)⟩
def source50 (i : Fin 16) : Fin 16 := ⟨sourceData50.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree50 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 (.cutY 26624 (.cutX 5120 .empty (.cutY 25600 (.cutX 5632 (.cutY 25088 .empty (.cutX 5376 (.cutY 25344 (.cutX 5248 (.cutY 25216 .full .full) (.cutY 25216 .full .full)) .empty) .empty)) .empty) .empty)) .empty) (.cutY 26624 .empty (.cutX 7168 .empty (.cutY 27648 (.cutX 7680 (.cutY 27136 .empty (.cutX 7424 .empty (.cutY 27392 .empty (.cutX 7552 (.cutY 27520 .full .full) (.cutY 27520 .full .full))))) .empty) .empty)))) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 (.cutX 25600 (.cutY 5120 .empty (.cutX 25088 .empty (.cutY 5632 (.cutX 25344 (.cutY 5376 (.cutX 25216 (.cutY 5248 .full .full) (.cutY 5248 .full .full)) .empty) .empty) .empty))) .empty) .empty) (.cutY 6144 .empty (.cutX 27648 (.cutY 7168 .empty (.cutX 27136 .empty (.cutY 7680 (.cutX 27392 .empty (.cutY 7424 .empty (.cutX 27520 (.cutY 7552 .full .full) (.cutY 7552 .full .full)))) .empty))) .empty)))) .empty) .empty)) .empty))

theorem metadata50 : 0<121837468 ∧ 20<128 ∧ 98<128 ∧ 0<4 ∧
    2258/4160=0 ∧ 2258%4160=2258 ∧ ∀ i, (leaves50 i).Valid 8 := by
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

noncomputable def phaseMass50 : ℝ := singlePhaseMass (121837468/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw50 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass50_eq : phaseMass50 = (30459367/409600000000 : ℝ) := by
  unfold phaseMass50
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw50 output50 cover50 source50
    (gridTreeUnionCheck_sound 32768 raw50 output50 cover50 source50 tree50 checked50)
    _ (by norm_num) _, areaUnits50]
  norm_num

-- Frozen phase 6761, atom 2077, type 0, source (18,97).
def leavesData51 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves51 : Fin 7 → DyadicLeaf := leavesData51.get
def raw51 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 18 97 leaves51 i
def outputData51 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨4608,4736,24832,24960⟩) (.node (.single ⟨4608,4736,24960,25088⟩) (.single ⟨4736,4800,24832,24896⟩))) (.node (.node (.single ⟨4736,4800,24896,24960⟩) (.single ⟨4800,4864,24832,24896⟩)) (.node (.single ⟨4800,4864,24896,24960⟩) (.single ⟨4736,4864,24960,25088⟩)))) (.node (.node (.single ⟨7680,7808,27904,28032⟩) (.node (.single ⟨7680,7808,28032,28160⟩) (.single ⟨7808,7872,27904,27968⟩))) (.node (.node (.single ⟨7808,7872,27968,28032⟩) (.single ⟨7872,7936,27904,27968⟩)) (.node (.single ⟨7872,7936,27968,28032⟩) (.single ⟨7808,7936,28032,28160⟩))))) (.node (.node (.node (.single ⟨24832,24960,4608,4736⟩) (.node (.single ⟨24832,24896,4736,4800⟩) (.single ⟨24832,24896,4800,4864⟩))) (.node (.node (.single ⟨24896,24960,4736,4800⟩) (.single ⟨24896,24960,4800,4864⟩)) (.node (.single ⟨24960,25088,4608,4736⟩) (.single ⟨24960,25088,4736,4864⟩)))) (.node (.node (.single ⟨27904,28032,7680,7808⟩) (.node (.single ⟨27904,27968,7808,7872⟩) (.single ⟨27904,27968,7872,7936⟩))) (.node (.node (.single ⟨27968,28032,7808,7872⟩) (.single ⟨27968,28032,7872,7936⟩)) (.node (.single ⟨28032,28160,7680,7808⟩) (.single ⟨28032,28160,7808,7936⟩))))))
def output51 : Fin 28 → GridBox := outputData51.get
def coverData51 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData51 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover51 (i : Fin 28) : Fin 28 := ⟨coverData51.get i % 28, Nat.mod_lt _ (by decide)⟩
def source51 (i : Fin 28) : Fin 28 := ⟨sourceData51.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree51 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 (.cutY 26624 (.cutX 5120 (.cutY 25600 (.cutX 4608 .empty (.cutY 25088 (.cutX 4864 (.cutY 24832 .empty (.cutX 4736 (.cutY 24960 .full .full) (.cutY 24960 (.cutX 4800 (.cutY 24896 .full .full) (.cutY 24896 .full .full)) .full))) .empty) .empty)) .empty) .empty) .empty) (.cutY 26624 .empty (.cutX 7168 .empty (.cutY 27648 .empty (.cutX 7680 .empty (.cutY 28160 (.cutX 7936 (.cutY 27904 .empty (.cutX 7808 (.cutY 28032 .full .full) (.cutY 28032 (.cutX 7872 (.cutY 27968 .full .full) (.cutY 27968 .full .full)) .full))) .empty) .empty)))))) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 (.cutX 25600 (.cutY 5120 (.cutX 25088 (.cutY 4608 .empty (.cutX 24832 .empty (.cutY 4864 (.cutX 24960 (.cutY 4736 .full (.cutX 24896 (.cutY 4800 .full .full) (.cutY 4800 .full .full))) (.cutY 4736 .full .full)) .empty))) .empty) .empty) .empty) .empty) (.cutY 6144 .empty (.cutX 27648 .empty (.cutY 7168 .empty (.cutX 28160 (.cutY 7680 .empty (.cutX 27904 .empty (.cutY 7936 (.cutX 28032 (.cutY 7808 .full (.cutX 27968 (.cutY 7872 .full .full) (.cutY 7872 .full .full))) (.cutY 7808 .full .full)) .empty))) .empty)))))) .empty) .empty)) .empty))

theorem metadata51 : 0<121837468 ∧ 18<128 ∧ 97<128 ∧ 0<4 ∧
    2077/4160=0 ∧ 2077%4160=2077 ∧ ∀ i, (leaves51 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData51).mp
    (by decide +kernel)

theorem sourceChecked51_0 : ∀ i : Fin 28,
    (fun i => output51 i = raw51 (source51 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked51 : ∀ i : Fin 28, (fun i => output51 i = raw51 (source51 i)) i :=
  forallFin_of_zero_offset (fun i => output51 i = raw51 (source51 i)) sourceChecked51_0

theorem coverChecked51_0 : ∀ i : Fin 28,
    (fun i => (output51 (cover51 i)).ContainsBox (raw51 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked51 : ∀ i : Fin 28, (fun i => (output51 (cover51 i)).ContainsBox (raw51 i)) i :=
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

noncomputable def phaseMass51 : ℝ := singlePhaseMass (121837468/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw51 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass51_eq : phaseMass51 = (30459367/409600000000 : ℝ) := by
  unfold phaseMass51
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw51 output51 cover51 source51
    (gridTreeUnionCheck_sound 32768 raw51 output51 cover51 source51 tree51 checked51)
    _ (by norm_num) _, areaUnits51]
  norm_num

-- Frozen phase 6762, atom 5842, type 1, source (14,86).
def leavesData52 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,2,2⟩)) (.node (.single ⟨2,2,3⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves52 : Fin 10 → DyadicLeaf := leavesData52.get
def raw52 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 14 86 leaves52 i
def outputData52 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨3584,3712,22016,22144⟩) (.single ⟨3584,3712,22144,22272⟩)) (.node (.single ⟨3712,3776,22016,22080⟩) (.node (.single ⟨3712,3776,22080,22144⟩) (.single ⟨3776,3840,22016,22080⟩)))) (.node (.node (.single ⟨3776,3840,22080,22144⟩) (.single ⟨3712,3776,22144,22208⟩)) (.node (.single ⟨3712,3776,22208,22272⟩) (.node (.single ⟨3776,3840,22144,22208⟩) (.single ⟨3776,3840,22208,22272⟩))))) (.node (.node (.node (.single ⟨10496,10560,28928,28992⟩) (.single ⟨10496,10560,28992,29056⟩)) (.node (.single ⟨10560,10624,28928,28992⟩) (.node (.single ⟨10560,10624,28992,29056⟩) (.single ⟨10496,10624,29056,29184⟩)))) (.node (.node (.single ⟨10624,10688,28928,28992⟩) (.single ⟨10624,10688,28992,29056⟩)) (.node (.single ⟨10688,10752,28928,28992⟩) (.node (.single ⟨10688,10752,28992,29056⟩) (.single ⟨10624,10752,29056,29184⟩)))))) (.node (.node (.node (.node (.single ⟨22016,22144,3584,3712⟩) (.single ⟨22016,22080,3712,3776⟩)) (.node (.single ⟨22016,22080,3776,3840⟩) (.node (.single ⟨22080,22144,3712,3776⟩) (.single ⟨22080,22144,3776,3840⟩)))) (.node (.node (.single ⟨22144,22272,3584,3712⟩) (.single ⟨22144,22208,3712,3776⟩)) (.node (.single ⟨22144,22208,3776,3840⟩) (.node (.single ⟨22208,22272,3712,3776⟩) (.single ⟨22208,22272,3776,3840⟩))))) (.node (.node (.node (.single ⟨28928,28992,10496,10560⟩) (.single ⟨28928,28992,10560,10624⟩)) (.node (.single ⟨28992,29056,10496,10560⟩) (.node (.single ⟨28992,29056,10560,10624⟩) (.single ⟨28928,28992,10624,10688⟩)))) (.node (.node (.single ⟨28928,28992,10688,10752⟩) (.single ⟨28992,29056,10624,10688⟩)) (.node (.single ⟨28992,29056,10688,10752⟩) (.node (.single ⟨29056,29184,10496,10624⟩) (.single ⟨29056,29184,10624,10752⟩)))))))
def output52 : Fin 40 → GridBox := outputData52.get
def coverData52 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 25) (.single 38)) (.node (.single 14) (.node (.single 2) (.single 21))))) (.node (.node (.node (.single 37) (.single 18)) (.node (.single 3) (.node (.single 23) (.single 36)))) (.node (.node (.single 16) (.single 4)) (.node (.single 22) (.node (.single 35) (.single 17)))))) (.node (.node (.node (.node (.single 5) (.single 24)) (.node (.single 34) (.node (.single 15) (.single 6)))) (.node (.node (.single 26) (.single 33)) (.node (.single 13) (.node (.single 7) (.single 28))))) (.node (.node (.node (.single 32) (.single 11)) (.node (.single 8) (.node (.single 27) (.single 31)))) (.node (.node (.single 12) (.single 9)) (.node (.single 29) (.node (.single 30) (.single 10)))))))
def sourceData52 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 12) (.single 16)))) (.node (.node (.single 20) (.single 24)) (.node (.single 28) (.node (.single 32) (.single 36))))) (.node (.node (.node (.single 39) (.single 31)) (.node (.single 35) (.node (.single 27) (.single 7)))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 17) (.node (.single 13) (.single 21)))) (.node (.node (.single 5) (.single 25)) (.node (.single 33) (.node (.single 29) (.single 37))))) (.node (.node (.node (.single 38) (.single 34)) (.node (.single 30) (.node (.single 26) (.single 22)))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.node (.single 6) (.single 2)))))))
def cover52 (i : Fin 40) : Fin 40 := ⟨coverData52.get i % 40, Nat.mod_lt _ (by decide)⟩
def source52 (i : Fin 40) : Fin 40 := ⟨sourceData52.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree52 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 .empty (.cutY 21504 .empty (.cutX 3584 .empty (.cutY 22016 .empty (.cutX 3840 (.cutY 22272 (.cutX 3712 (.cutY 22144 .full .full) (.cutY 22144 (.cutX 3776 (.cutY 22080 .full .full) (.cutY 22080 .full .full)) (.cutX 3776 (.cutY 22208 .full .full) (.cutY 22208 .full .full)))) .empty) .empty))))) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 (.cutY 29696 (.cutX 10752 (.cutY 29184 (.cutX 10496 .empty (.cutY 28928 .empty (.cutX 10624 (.cutY 29056 (.cutX 10560 (.cutY 28992 .full .full) (.cutY 28992 .full .full)) .full) (.cutY 29056 (.cutX 10688 (.cutY 28992 .full .full) (.cutY 28992 .full .full)) .full)))) .empty) .empty) .empty) .empty) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 .empty (.cutY 3072 .empty (.cutX 22016 .empty (.cutY 3584 .empty (.cutX 22272 (.cutY 3840 (.cutX 22144 (.cutY 3712 .full (.cutX 22080 (.cutY 3776 .full .full) (.cutY 3776 .full .full))) (.cutY 3712 .full (.cutX 22208 (.cutY 3776 .full .full) (.cutY 3776 .full .full)))) .empty) .empty)))))) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 (.cutY 11264 (.cutX 29184 (.cutY 10752 (.cutX 28928 .empty (.cutY 10496 .empty (.cutX 29056 (.cutY 10624 (.cutX 28992 (.cutY 10560 .full .full) (.cutY 10560 .full .full)) (.cutX 28992 (.cutY 10688 .full .full) (.cutY 10688 .full .full))) (.cutY 10624 .full .full)))) .empty) .empty) .empty) .empty)) .empty) .empty)))) .empty))

theorem metadata52 : 0<139307719 ∧ 14<128 ∧ 86<128 ∧ 1<4 ∧
    5842/4160=1 ∧ 5842%4160=1682 ∧ ∀ i, (leaves52 i).Valid 8 := by
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

noncomputable def phaseMass52 : ℝ := singlePhaseMass (139307719/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw52 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass52_eq : phaseMass52 = (139307719/1638400000000 : ℝ) := by
  unfold phaseMass52
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw52 output52 cover52 source52
    (gridTreeUnionCheck_sound 32768 raw52 output52 cover52 source52 tree52 checked52)
    _ (by norm_num) _, areaUnits52]
  norm_num

-- Frozen phase 6763, atom 5945, type 1, source (15,90).
def leavesData53 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,2,2⟩)) (.node (.single ⟨2,2,3⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves53 : Fin 10 → DyadicLeaf := leavesData53.get
def raw53 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 15 90 leaves53 i
def outputData53 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨3840,3968,23040,23168⟩) (.single ⟨3840,3968,23168,23296⟩)) (.node (.single ⟨3968,4032,23040,23104⟩) (.node (.single ⟨3968,4032,23104,23168⟩) (.single ⟨4032,4096,23040,23104⟩)))) (.node (.node (.single ⟨4032,4096,23104,23168⟩) (.single ⟨3968,4032,23168,23232⟩)) (.node (.single ⟨3968,4032,23232,23296⟩) (.node (.single ⟨4032,4096,23168,23232⟩) (.single ⟨4032,4096,23232,23296⟩))))) (.node (.node (.node (.single ⟨9472,9536,28672,28736⟩) (.single ⟨9472,9536,28736,28800⟩)) (.node (.single ⟨9536,9600,28672,28736⟩) (.node (.single ⟨9536,9600,28736,28800⟩) (.single ⟨9472,9600,28800,28928⟩)))) (.node (.node (.single ⟨9600,9664,28672,28736⟩) (.single ⟨9600,9664,28736,28800⟩)) (.node (.single ⟨9664,9728,28672,28736⟩) (.node (.single ⟨9664,9728,28736,28800⟩) (.single ⟨9600,9728,28800,28928⟩)))))) (.node (.node (.node (.node (.single ⟨23040,23168,3840,3968⟩) (.single ⟨23040,23104,3968,4032⟩)) (.node (.single ⟨23040,23104,4032,4096⟩) (.node (.single ⟨23104,23168,3968,4032⟩) (.single ⟨23104,23168,4032,4096⟩)))) (.node (.node (.single ⟨23168,23296,3840,3968⟩) (.single ⟨23168,23232,3968,4032⟩)) (.node (.single ⟨23168,23232,4032,4096⟩) (.node (.single ⟨23232,23296,3968,4032⟩) (.single ⟨23232,23296,4032,4096⟩))))) (.node (.node (.node (.single ⟨28672,28736,9472,9536⟩) (.single ⟨28672,28736,9536,9600⟩)) (.node (.single ⟨28736,28800,9472,9536⟩) (.node (.single ⟨28736,28800,9536,9600⟩) (.single ⟨28672,28736,9600,9664⟩)))) (.node (.node (.single ⟨28672,28736,9664,9728⟩) (.single ⟨28736,28800,9600,9664⟩)) (.node (.single ⟨28736,28800,9664,9728⟩) (.node (.single ⟨28800,28928,9472,9600⟩) (.single ⟨28800,28928,9600,9728⟩)))))))
def output53 : Fin 40 → GridBox := outputData53.get
def coverData53 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 25) (.single 38)) (.node (.single 14) (.node (.single 2) (.single 21))))) (.node (.node (.node (.single 37) (.single 18)) (.node (.single 3) (.node (.single 23) (.single 36)))) (.node (.node (.single 16) (.single 4)) (.node (.single 22) (.node (.single 35) (.single 17)))))) (.node (.node (.node (.node (.single 5) (.single 24)) (.node (.single 34) (.node (.single 15) (.single 6)))) (.node (.node (.single 26) (.single 33)) (.node (.single 13) (.node (.single 7) (.single 28))))) (.node (.node (.node (.single 32) (.single 11)) (.node (.single 8) (.node (.single 27) (.single 31)))) (.node (.node (.single 12) (.single 9)) (.node (.single 29) (.node (.single 30) (.single 10)))))))
def sourceData53 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 12) (.single 16)))) (.node (.node (.single 20) (.single 24)) (.node (.single 28) (.node (.single 32) (.single 36))))) (.node (.node (.node (.single 39) (.single 31)) (.node (.single 35) (.node (.single 27) (.single 7)))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 17) (.node (.single 13) (.single 21)))) (.node (.node (.single 5) (.single 25)) (.node (.single 33) (.node (.single 29) (.single 37))))) (.node (.node (.node (.single 38) (.single 34)) (.node (.single 30) (.node (.single 26) (.single 22)))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.node (.single 6) (.single 2)))))))
def cover53 (i : Fin 40) : Fin 40 := ⟨coverData53.get i % 40, Nat.mod_lt _ (by decide)⟩
def source53 (i : Fin 40) : Fin 40 := ⟨sourceData53.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree53 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 .empty (.cutX 3072 .empty (.cutY 23552 (.cutX 3584 .empty (.cutY 23040 .empty (.cutX 3840 .empty (.cutY 23296 (.cutX 3968 (.cutY 23168 .full .full) (.cutY 23168 (.cutX 4032 (.cutY 23104 .full .full) (.cutY 23104 .full .full)) (.cutX 4032 (.cutY 23232 .full .full) (.cutY 23232 .full .full)))) .empty)))) .empty))))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 (.cutY 30720 (.cutX 9216 .empty (.cutY 29696 (.cutX 9728 (.cutY 29184 (.cutX 9472 .empty (.cutY 28928 (.cutX 9600 (.cutY 28800 (.cutX 9536 (.cutY 28736 .full .full) (.cutY 28736 .full .full)) .full) (.cutY 28800 (.cutX 9664 (.cutY 28736 .full .full) (.cutY 28736 .full .full)) .full)) .empty)) .empty) .empty) .empty)) .empty) .empty)) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 .empty (.cutY 2048 .empty (.cutX 23552 (.cutY 3072 .empty (.cutX 23040 .empty (.cutY 3584 .empty (.cutX 23296 (.cutY 3840 .empty (.cutX 23168 (.cutY 3968 .full (.cutX 23104 (.cutY 4032 .full .full) (.cutY 4032 .full .full))) (.cutY 3968 .full (.cutX 23232 (.cutY 4032 .full .full) (.cutY 4032 .full .full))))) .empty)))) .empty))) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 (.cutX 29696 (.cutY 9216 .empty (.cutX 29184 (.cutY 9728 (.cutX 28928 (.cutY 9472 .empty (.cutX 28800 (.cutY 9600 (.cutX 28736 (.cutY 9536 .full .full) (.cutY 9536 .full .full)) (.cutX 28736 (.cutY 9664 .full .full) (.cutY 9664 .full .full))) (.cutY 9600 .full .full))) .empty) .empty) .empty)) .empty) .empty) .empty) .empty)))) .empty))

theorem metadata53 : 0<112823226 ∧ 15<128 ∧ 90<128 ∧ 1<4 ∧
    5945/4160=1 ∧ 5945%4160=1785 ∧ ∀ i, (leaves53 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData53).mp
    (by decide +kernel)

theorem sourceChecked53_0 : ∀ i : Fin 40,
    (fun i => output53 i = raw53 (source53 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked53 : ∀ i : Fin 40, (fun i => output53 i = raw53 (source53 i)) i :=
  forallFin_of_zero_offset (fun i => output53 i = raw53 (source53 i)) sourceChecked53_0

theorem coverChecked53_0 : ∀ i : Fin 40,
    (fun i => (output53 (cover53 i)).ContainsBox (raw53 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked53 : ∀ i : Fin 40, (fun i => (output53 (cover53 i)).ContainsBox (raw53 i)) i :=
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

noncomputable def phaseMass53 : ℝ := singlePhaseMass (112823226/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw53 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass53_eq : phaseMass53 = (56411613/819200000000 : ℝ) := by
  unfold phaseMass53
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw53 output53 cover53 source53
    (gridTreeUnionCheck_sound 32768 raw53 output53 cover53 source53 tree53 checked53)
    _ (by norm_num) _, areaUnits53]
  norm_num

-- Frozen phase 6764, atom 6503, type 1, source (21,96).
def leavesData54 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves54 : Fin 7 → DyadicLeaf := leavesData54.get
def raw54 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 21 96 leaves54 i
def outputData54 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨5376,5504,24576,24704⟩) (.node (.single ⟨5376,5504,24704,24832⟩) (.single ⟨5504,5568,24576,24640⟩))) (.node (.node (.single ⟨5504,5568,24640,24704⟩) (.single ⟨5568,5632,24576,24640⟩)) (.node (.single ⟨5568,5632,24640,24704⟩) (.single ⟨5504,5632,24704,24832⟩)))) (.node (.node (.single ⟨7936,8064,27136,27264⟩) (.node (.single ⟨7936,8064,27264,27392⟩) (.single ⟨8064,8128,27136,27200⟩))) (.node (.node (.single ⟨8064,8128,27200,27264⟩) (.single ⟨8128,8192,27136,27200⟩)) (.node (.single ⟨8128,8192,27200,27264⟩) (.single ⟨8064,8192,27264,27392⟩))))) (.node (.node (.node (.single ⟨24576,24704,5376,5504⟩) (.node (.single ⟨24576,24640,5504,5568⟩) (.single ⟨24576,24640,5568,5632⟩))) (.node (.node (.single ⟨24640,24704,5504,5568⟩) (.single ⟨24640,24704,5568,5632⟩)) (.node (.single ⟨24704,24832,5376,5504⟩) (.single ⟨24704,24832,5504,5632⟩)))) (.node (.node (.single ⟨27136,27264,7936,8064⟩) (.node (.single ⟨27136,27200,8064,8128⟩) (.single ⟨27136,27200,8128,8192⟩))) (.node (.node (.single ⟨27200,27264,8064,8128⟩) (.single ⟨27200,27264,8128,8192⟩)) (.node (.single ⟨27264,27392,7936,8064⟩) (.single ⟨27264,27392,8064,8192⟩))))))
def output54 : Fin 28 → GridBox := outputData54.get
def coverData54 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData54 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover54 (i : Fin 28) : Fin 28 := ⟨coverData54.get i % 28, Nat.mod_lt _ (by decide)⟩
def source54 (i : Fin 28) : Fin 28 := ⟨sourceData54.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree54 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 (.cutY 26624 (.cutX 5120 .empty (.cutY 25600 (.cutX 5632 (.cutY 25088 (.cutX 5376 .empty (.cutY 24832 (.cutX 5504 (.cutY 24704 .full .full) (.cutY 24704 (.cutX 5568 (.cutY 24640 .full .full) (.cutY 24640 .full .full)) .full)) .empty)) .empty) .empty) .empty)) .empty) (.cutY 26624 .empty (.cutX 7168 .empty (.cutY 27648 (.cutX 7680 .empty (.cutY 27136 .empty (.cutX 7936 .empty (.cutY 27392 (.cutX 8064 (.cutY 27264 .full .full) (.cutY 27264 (.cutX 8128 (.cutY 27200 .full .full) (.cutY 27200 .full .full)) .full)) .empty)))) .empty)))) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 (.cutX 25600 (.cutY 5120 .empty (.cutX 25088 (.cutY 5632 (.cutX 24832 (.cutY 5376 .empty (.cutX 24704 (.cutY 5504 .full (.cutX 24640 (.cutY 5568 .full .full) (.cutY 5568 .full .full))) (.cutY 5504 .full .full))) .empty) .empty) .empty)) .empty) .empty) (.cutY 6144 .empty (.cutX 27648 (.cutY 7168 .empty (.cutX 27136 .empty (.cutY 7680 .empty (.cutX 27392 (.cutY 7936 .empty (.cutX 27264 (.cutY 8064 .full (.cutX 27200 (.cutY 8128 .full .full) (.cutY 8128 .full .full))) (.cutY 8064 .full .full))) .empty)))) .empty)))) .empty) .empty)) .empty))

theorem metadata54 : 0<151956162 ∧ 21<128 ∧ 96<128 ∧ 1<4 ∧
    6503/4160=1 ∧ 6503%4160=2343 ∧ ∀ i, (leaves54 i).Valid 8 := by
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

noncomputable def phaseMass54 : ℝ := singlePhaseMass (151956162/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw54 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass54_eq : phaseMass54 = (75978081/819200000000 : ℝ) := by
  unfold phaseMass54
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw54 output54 cover54 source54
    (gridTreeUnionCheck_sound 32768 raw54 output54 cover54 source54 tree54 checked54)
    _ (by norm_num) _, areaUnits54]
  norm_num

-- Frozen phase 6765, atom 7058, type 1, source (28,98).
def leavesData55 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves55 : Fin 7 → DyadicLeaf := leavesData55.get
def raw55 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 28 98 leaves55 i
def outputData55 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨7168,7296,25088,25216⟩) (.node (.single ⟨7168,7296,25216,25344⟩) (.single ⟨7296,7360,25088,25152⟩))) (.node (.node (.single ⟨7296,7360,25152,25216⟩) (.single ⟨7360,7424,25088,25152⟩)) (.node (.single ⟨7360,7424,25152,25216⟩) (.single ⟨7296,7424,25216,25344⟩)))) (.node (.node (.single ⟨7424,7552,25344,25472⟩) (.node (.single ⟨7424,7552,25472,25600⟩) (.single ⟨7552,7616,25344,25408⟩))) (.node (.node (.single ⟨7552,7616,25408,25472⟩) (.single ⟨7616,7680,25344,25408⟩)) (.node (.single ⟨7616,7680,25408,25472⟩) (.single ⟨7552,7680,25472,25600⟩))))) (.node (.node (.node (.single ⟨25088,25216,7168,7296⟩) (.node (.single ⟨25088,25152,7296,7360⟩) (.single ⟨25088,25152,7360,7424⟩))) (.node (.node (.single ⟨25152,25216,7296,7360⟩) (.single ⟨25152,25216,7360,7424⟩)) (.node (.single ⟨25216,25344,7168,7296⟩) (.single ⟨25216,25344,7296,7424⟩)))) (.node (.node (.single ⟨25344,25472,7424,7552⟩) (.node (.single ⟨25344,25408,7552,7616⟩) (.single ⟨25344,25408,7616,7680⟩))) (.node (.node (.single ⟨25408,25472,7552,7616⟩) (.single ⟨25408,25472,7616,7680⟩)) (.node (.single ⟨25472,25600,7424,7552⟩) (.single ⟨25472,25600,7552,7680⟩))))))
def output55 : Fin 28 → GridBox := outputData55.get
def coverData55 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData55 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover55 (i : Fin 28) : Fin 28 := ⟨coverData55.get i % 28, Nat.mod_lt _ (by decide)⟩
def source55 (i : Fin 28) : Fin 28 := ⟨sourceData55.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree55 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 .empty (.cutY 26624 (.cutX 7168 .empty (.cutY 25600 (.cutX 7680 (.cutY 25088 .empty (.cutX 7424 (.cutY 25344 (.cutX 7296 (.cutY 25216 .full .full) (.cutY 25216 (.cutX 7360 (.cutY 25152 .full .full) (.cutY 25152 .full .full)) .full)) .empty) (.cutY 25344 .empty (.cutX 7552 (.cutY 25472 .full .full) (.cutY 25472 (.cutX 7616 (.cutY 25408 .full .full) (.cutY 25408 .full .full)) .full))))) .empty) .empty)) .empty)) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 .empty (.cutX 25600 (.cutY 7168 .empty (.cutX 25088 .empty (.cutY 7680 (.cutX 25344 (.cutY 7424 (.cutX 25216 (.cutY 7296 .full (.cutX 25152 (.cutY 7360 .full .full) (.cutY 7360 .full .full))) (.cutY 7296 .full .full)) .empty) (.cutY 7424 .empty (.cutX 25472 (.cutY 7552 .full (.cutX 25408 (.cutY 7616 .full .full) (.cutY 7616 .full .full))) (.cutY 7552 .full .full)))) .empty))) .empty)) .empty)) .empty) .empty)) .empty))

theorem metadata55 : 0<48020332 ∧ 28<128 ∧ 98<128 ∧ 1<4 ∧
    7058/4160=1 ∧ 7058%4160=2898 ∧ ∀ i, (leaves55 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData55).mp
    (by decide +kernel)

theorem sourceChecked55_0 : ∀ i : Fin 28,
    (fun i => output55 i = raw55 (source55 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked55 : ∀ i : Fin 28, (fun i => output55 i = raw55 (source55 i)) i :=
  forallFin_of_zero_offset (fun i => output55 i = raw55 (source55 i)) sourceChecked55_0

theorem coverChecked55_0 : ∀ i : Fin 28,
    (fun i => (output55 (cover55 i)).ContainsBox (raw55 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked55 : ∀ i : Fin 28, (fun i => (output55 (cover55 i)).ContainsBox (raw55 i)) i :=
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

noncomputable def phaseMass55 : ℝ := singlePhaseMass (48020332/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw55 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass55_eq : phaseMass55 = (12005083/409600000000 : ℝ) := by
  unfold phaseMass55
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw55 output55 cover55 source55
    (gridTreeUnionCheck_sound 32768 raw55 output55 cover55 source55 tree55 checked55)
    _ (by norm_num) _, areaUnits55]
  norm_num

-- Frozen phase 6766, atom 6235, type 1, source (18,95).
def leavesData56 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves56 : Fin 7 → DyadicLeaf := leavesData56.get
def raw56 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 18 95 leaves56 i
def outputData56 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨4608,4736,24320,24448⟩) (.node (.single ⟨4608,4736,24448,24576⟩) (.single ⟨4736,4800,24320,24384⟩))) (.node (.node (.single ⟨4736,4800,24384,24448⟩) (.single ⟨4800,4864,24320,24384⟩)) (.node (.single ⟨4800,4864,24384,24448⟩) (.single ⟨4736,4864,24448,24576⟩)))) (.node (.node (.single ⟨8192,8320,27904,28032⟩) (.node (.single ⟨8192,8320,28032,28160⟩) (.single ⟨8320,8384,27904,27968⟩))) (.node (.node (.single ⟨8320,8384,27968,28032⟩) (.single ⟨8384,8448,27904,27968⟩)) (.node (.single ⟨8384,8448,27968,28032⟩) (.single ⟨8320,8448,28032,28160⟩))))) (.node (.node (.node (.single ⟨24320,24448,4608,4736⟩) (.node (.single ⟨24320,24384,4736,4800⟩) (.single ⟨24320,24384,4800,4864⟩))) (.node (.node (.single ⟨24384,24448,4736,4800⟩) (.single ⟨24384,24448,4800,4864⟩)) (.node (.single ⟨24448,24576,4608,4736⟩) (.single ⟨24448,24576,4736,4864⟩)))) (.node (.node (.single ⟨27904,28032,8192,8320⟩) (.node (.single ⟨27904,27968,8320,8384⟩) (.single ⟨27904,27968,8384,8448⟩))) (.node (.node (.single ⟨27968,28032,8320,8384⟩) (.single ⟨27968,28032,8384,8448⟩)) (.node (.single ⟨28032,28160,8192,8320⟩) (.single ⟨28032,28160,8320,8448⟩))))))
def output56 : Fin 28 → GridBox := outputData56.get
def coverData56 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData56 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover56 (i : Fin 28) : Fin 28 := ⟨coverData56.get i % 28, Nat.mod_lt _ (by decide)⟩
def source56 (i : Fin 28) : Fin 28 := ⟨sourceData56.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree56 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 .empty (.cutX 5120 (.cutY 23552 .empty (.cutX 4608 .empty (.cutY 24064 .empty (.cutX 4864 (.cutY 24320 .empty (.cutX 4736 (.cutY 24448 .full .full) (.cutY 24448 (.cutX 4800 (.cutY 24384 .full .full) (.cutY 24384 .full .full)) .full))) .empty)))) .empty)) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 .empty (.cutX 9216 (.cutY 27648 .empty (.cutX 8704 (.cutY 28160 (.cutX 8448 (.cutY 27904 .empty (.cutX 8320 (.cutY 28032 .full .full) (.cutY 28032 (.cutX 8384 (.cutY 27968 .full .full) (.cutY 27968 .full .full)) .full))) .empty) .empty) .empty)) .empty)) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 (.cutX 23552 .empty (.cutY 5120 (.cutX 24064 .empty (.cutY 4608 .empty (.cutX 24320 .empty (.cutY 4864 (.cutX 24448 (.cutY 4736 .full (.cutX 24384 (.cutY 4800 .full .full) (.cutY 4800 .full .full))) (.cutY 4736 .full .full)) .empty)))) .empty)) .empty)))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 (.cutX 27648 .empty (.cutY 9216 (.cutX 28160 (.cutY 8704 (.cutX 27904 .empty (.cutY 8448 (.cutX 28032 (.cutY 8320 .full (.cutX 27968 (.cutY 8384 .full .full) (.cutY 8384 .full .full))) (.cutY 8320 .full .full)) .empty)) .empty) .empty) .empty)) .empty)) .empty) .empty))) .empty))

theorem metadata56 : 0<192153497 ∧ 18<128 ∧ 95<128 ∧ 1<4 ∧
    6235/4160=1 ∧ 6235%4160=2075 ∧ ∀ i, (leaves56 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData56).mp
    (by decide +kernel)

theorem sourceChecked56_0 : ∀ i : Fin 28,
    (fun i => output56 i = raw56 (source56 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked56 : ∀ i : Fin 28, (fun i => output56 i = raw56 (source56 i)) i :=
  forallFin_of_zero_offset (fun i => output56 i = raw56 (source56 i)) sourceChecked56_0

theorem coverChecked56_0 : ∀ i : Fin 28,
    (fun i => (output56 (cover56 i)).ContainsBox (raw56 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked56 : ∀ i : Fin 28, (fun i => (output56 (cover56 i)).ContainsBox (raw56 i)) i :=
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

noncomputable def phaseMass56 : ℝ := singlePhaseMass (192153497/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw56 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass56_eq : phaseMass56 = (192153497/1638400000000 : ℝ) := by
  unfold phaseMass56
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw56 output56 cover56 source56
    (gridTreeUnionCheck_sound 32768 raw56 output56 cover56 source56 tree56 checked56)
    _ (by norm_num) _, areaUnits56]
  norm_num

-- Frozen phase 6767, atom 6141, type 1, source (17,94).
def leavesData57 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩))) (.node (.single ⟨2,3,0⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves57 : Fin 13 → DyadicLeaf := leavesData57.get
def raw57 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 17 94 leaves57 i
def outputData57 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨4352,4416,24064,24128⟩) (.node (.single ⟨4352,4416,24128,24192⟩) (.single ⟨4416,4480,24064,24128⟩))) (.node (.single ⟨4416,4480,24128,24192⟩) (.node (.single ⟨4352,4480,24192,24320⟩) (.single ⟨4480,4544,24064,24128⟩)))) (.node (.node (.single ⟨4480,4544,24128,24192⟩) (.node (.single ⟨4544,4608,24064,24128⟩) (.single ⟨4544,4608,24128,24192⟩))) (.node (.node (.single ⟨4480,4544,24192,24256⟩) (.single ⟨4480,4544,24256,24320⟩)) (.node (.single ⟨4544,4608,24192,24256⟩) (.single ⟨4544,4608,24256,24320⟩))))) (.node (.node (.node (.single ⟨8448,8512,28160,28224⟩) (.node (.single ⟨8448,8512,28224,28288⟩) (.single ⟨8512,8576,28160,28224⟩))) (.node (.single ⟨8512,8576,28224,28288⟩) (.node (.single ⟨8448,8576,28288,28416⟩) (.single ⟨8576,8640,28160,28224⟩)))) (.node (.node (.single ⟨8576,8640,28224,28288⟩) (.node (.single ⟨8640,8704,28160,28224⟩) (.single ⟨8640,8704,28224,28288⟩))) (.node (.node (.single ⟨8576,8640,28288,28352⟩) (.single ⟨8576,8640,28352,28416⟩)) (.node (.single ⟨8640,8704,28288,28352⟩) (.single ⟨8640,8704,28352,28416⟩)))))) (.node (.node (.node (.node (.single ⟨24064,24128,4352,4416⟩) (.node (.single ⟨24064,24128,4416,4480⟩) (.single ⟨24128,24192,4352,4416⟩))) (.node (.single ⟨24128,24192,4416,4480⟩) (.node (.single ⟨24064,24128,4480,4544⟩) (.single ⟨24064,24128,4544,4608⟩)))) (.node (.node (.single ⟨24128,24192,4480,4544⟩) (.node (.single ⟨24128,24192,4544,4608⟩) (.single ⟨24192,24320,4352,4480⟩))) (.node (.node (.single ⟨24192,24256,4480,4544⟩) (.single ⟨24192,24256,4544,4608⟩)) (.node (.single ⟨24256,24320,4480,4544⟩) (.single ⟨24256,24320,4544,4608⟩))))) (.node (.node (.node (.single ⟨28160,28224,8448,8512⟩) (.node (.single ⟨28160,28224,8512,8576⟩) (.single ⟨28224,28288,8448,8512⟩))) (.node (.single ⟨28224,28288,8512,8576⟩) (.node (.single ⟨28160,28224,8576,8640⟩) (.single ⟨28160,28224,8640,8704⟩)))) (.node (.node (.single ⟨28224,28288,8576,8640⟩) (.node (.single ⟨28224,28288,8640,8704⟩) (.single ⟨28288,28416,8448,8576⟩))) (.node (.node (.single ⟨28288,28352,8576,8640⟩) (.single ⟨28288,28352,8640,8704⟩)) (.node (.single ⟨28352,28416,8576,8640⟩) (.single ⟨28352,28416,8640,8704⟩)))))))
def output57 : Fin 52 → GridBox := outputData57.get
def coverData57 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 34) (.single 47))) (.node (.single 17) (.node (.single 5) (.single 30)))) (.node (.node (.single 46) (.node (.single 21) (.single 6))) (.node (.node (.single 32) (.single 45)) (.node (.single 19) (.single 7))))) (.node (.node (.node (.single 31) (.node (.single 44) (.single 20))) (.node (.single 8) (.node (.single 33) (.single 43)))) (.node (.node (.single 18) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 9)) (.node (.single 35) (.single 42))))) (.node (.node (.node (.single 16) (.node (.single 10) (.single 37))) (.node (.single 41) (.node (.single 14) (.single 11)))) (.node (.node (.single 36) (.node (.single 40) (.single 15))) (.node (.node (.single 12) (.single 38)) (.node (.single 39) (.single 13)))))))
def sourceData57 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 4)))) (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.node (.single 36) (.single 40)) (.node (.single 44) (.single 48))))) (.node (.node (.node (.single 51) (.node (.single 43) (.single 47))) (.node (.single 39) (.node (.single 3) (.single 19)))) (.node (.node (.single 11) (.node (.single 15) (.single 7))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 5) (.single 13)))) (.node (.node (.single 9) (.node (.single 17) (.single 1))) (.node (.node (.single 37) (.single 45)) (.node (.single 41) (.single 49))))) (.node (.node (.node (.single 50) (.node (.single 46) (.single 42))) (.node (.single 38) (.node (.single 18) (.single 14)))) (.node (.node (.single 10) (.node (.single 6) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover57 (i : Fin 52) : Fin 52 := ⟨coverData57.get i % 52, Nat.mod_lt _ (by decide)⟩
def source57 (i : Fin 52) : Fin 52 := ⟨sourceData57.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree57 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 .empty (.cutX 5120 (.cutY 23552 .empty (.cutX 4608 (.cutY 24064 .empty (.cutX 4352 .empty (.cutY 24320 (.cutX 4480 (.cutY 24192 (.cutX 4416 (.cutY 24128 .full .full) (.cutY 24128 .full .full)) .full) (.cutY 24192 (.cutX 4544 (.cutY 24128 .full .full) (.cutY 24128 .full .full)) (.cutX 4544 (.cutY 24256 .full .full) (.cutY 24256 .full .full)))) .empty))) .empty)) .empty)) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 .empty (.cutX 9216 (.cutY 27648 .empty (.cutX 8704 (.cutY 28160 .empty (.cutX 8448 .empty (.cutY 28416 (.cutX 8576 (.cutY 28288 (.cutX 8512 (.cutY 28224 .full .full) (.cutY 28224 .full .full)) .full) (.cutY 28288 (.cutX 8640 (.cutY 28224 .full .full) (.cutY 28224 .full .full)) (.cutX 8640 (.cutY 28352 .full .full) (.cutY 28352 .full .full)))) .empty))) .empty)) .empty)) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 (.cutX 23552 .empty (.cutY 5120 (.cutX 24064 .empty (.cutY 4608 (.cutX 24320 (.cutY 4352 .empty (.cutX 24192 (.cutY 4480 (.cutX 24128 (.cutY 4416 .full .full) (.cutY 4416 .full .full)) (.cutX 24128 (.cutY 4544 .full .full) (.cutY 4544 .full .full))) (.cutY 4480 .full (.cutX 24256 (.cutY 4544 .full .full) (.cutY 4544 .full .full))))) .empty) .empty)) .empty)) .empty)))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 (.cutX 27648 .empty (.cutY 9216 (.cutX 28160 .empty (.cutY 8704 (.cutX 28416 (.cutY 8448 .empty (.cutX 28288 (.cutY 8576 (.cutX 28224 (.cutY 8512 .full .full) (.cutY 8512 .full .full)) (.cutX 28224 (.cutY 8640 .full .full) (.cutY 8640 .full .full))) (.cutY 8576 .full (.cutX 28352 (.cutY 8640 .full .full) (.cutY 8640 .full .full))))) .empty) .empty)) .empty)) .empty)) .empty) .empty))) .empty))

theorem metadata57 : 0<192153497 ∧ 17<128 ∧ 94<128 ∧ 1<4 ∧
    6141/4160=1 ∧ 6141%4160=1981 ∧ ∀ i, (leaves57 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData57).mp
    (by decide +kernel)

theorem sourceChecked57_0 : ∀ i : Fin 52,
    (fun i => output57 i = raw57 (source57 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked57 : ∀ i : Fin 52, (fun i => output57 i = raw57 (source57 i)) i :=
  forallFin_of_zero_offset (fun i => output57 i = raw57 (source57 i)) sourceChecked57_0

theorem coverChecked57_0 : ∀ i : Fin 52,
    (fun i => (output57 (cover57 i)).ContainsBox (raw57 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked57 : ∀ i : Fin 52, (fun i => (output57 (cover57 i)).ContainsBox (raw57 i)) i :=
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

noncomputable def phaseMass57 : ℝ := singlePhaseMass (192153497/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw57 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass57_eq : phaseMass57 = (192153497/1638400000000 : ℝ) := by
  unfold phaseMass57
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw57 output57 cover57 source57
    (gridTreeUnionCheck_sound 32768 raw57 output57 cover57 source57 tree57 checked57)
    _ (by norm_num) _, areaUnits57]
  norm_num

-- Frozen phase 6768, atom 5739, type 1, source (13,84).
def leavesData58 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves58 : Fin 7 → DyadicLeaf := leavesData58.get
def raw58 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 13 84 leaves58 i
def outputData58 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3328,3456,21504,21632⟩) (.node (.single ⟨3328,3456,21632,21760⟩) (.single ⟨3456,3520,21504,21568⟩))) (.node (.node (.single ⟨3456,3520,21568,21632⟩) (.single ⟨3520,3584,21504,21568⟩)) (.node (.single ⟨3520,3584,21568,21632⟩) (.single ⟨3456,3584,21632,21760⟩)))) (.node (.node (.single ⟨11008,11136,29184,29312⟩) (.node (.single ⟨11008,11136,29312,29440⟩) (.single ⟨11136,11200,29184,29248⟩))) (.node (.node (.single ⟨11136,11200,29248,29312⟩) (.single ⟨11200,11264,29184,29248⟩)) (.node (.single ⟨11200,11264,29248,29312⟩) (.single ⟨11136,11264,29312,29440⟩))))) (.node (.node (.node (.single ⟨21504,21632,3328,3456⟩) (.node (.single ⟨21504,21568,3456,3520⟩) (.single ⟨21504,21568,3520,3584⟩))) (.node (.node (.single ⟨21568,21632,3456,3520⟩) (.single ⟨21568,21632,3520,3584⟩)) (.node (.single ⟨21632,21760,3328,3456⟩) (.single ⟨21632,21760,3456,3584⟩)))) (.node (.node (.single ⟨29184,29312,11008,11136⟩) (.node (.single ⟨29184,29248,11136,11200⟩) (.single ⟨29184,29248,11200,11264⟩))) (.node (.node (.single ⟨29248,29312,11136,11200⟩) (.single ⟨29248,29312,11200,11264⟩)) (.node (.single ⟨29312,29440,11008,11136⟩) (.single ⟨29312,29440,11136,11264⟩))))))
def output58 : Fin 28 → GridBox := outputData58.get
def coverData58 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData58 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover58 (i : Fin 28) : Fin 28 := ⟨coverData58.get i % 28, Nat.mod_lt _ (by decide)⟩
def source58 (i : Fin 28) : Fin 28 := ⟨sourceData58.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree58 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 .empty (.cutY 21504 .empty (.cutX 3584 (.cutY 22016 (.cutX 3328 .empty (.cutY 21760 (.cutX 3456 (.cutY 21632 .full .full) (.cutY 21632 (.cutX 3520 (.cutY 21568 .full .full) (.cutY 21568 .full .full)) .full)) .empty)) .empty) .empty))) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 (.cutY 29696 (.cutX 10752 .empty (.cutY 29184 .empty (.cutX 11008 .empty (.cutY 29440 (.cutX 11136 (.cutY 29312 .full .full) (.cutY 29312 (.cutX 11200 (.cutY 29248 .full .full) (.cutY 29248 .full .full)) .full)) .empty)))) .empty) .empty) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 .empty (.cutY 3072 .empty (.cutX 22016 (.cutY 3584 (.cutX 21760 (.cutY 3328 .empty (.cutX 21632 (.cutY 3456 .full (.cutX 21568 (.cutY 3520 .full .full) (.cutY 3520 .full .full))) (.cutY 3456 .full .full))) .empty) .empty) .empty)))) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 (.cutY 11264 (.cutX 29184 .empty (.cutY 10752 .empty (.cutX 29440 (.cutY 11008 .empty (.cutX 29312 (.cutY 11136 .full (.cutX 29248 (.cutY 11200 .full .full) (.cutY 11200 .full .full))) (.cutY 11136 .full .full))) .empty))) .empty) .empty)) .empty) .empty)))) .empty))

theorem metadata58 : 0<139307719 ∧ 13<128 ∧ 84<128 ∧ 1<4 ∧
    5739/4160=1 ∧ 5739%4160=1579 ∧ ∀ i, (leaves58 i).Valid 8 := by
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

noncomputable def phaseMass58 : ℝ := singlePhaseMass (139307719/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw58 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass58_eq : phaseMass58 = (139307719/1638400000000 : ℝ) := by
  unfold phaseMass58
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw58 output58 cover58 source58
    (gridTreeUnionCheck_sound 32768 raw58 output58 cover58 source58 tree58 checked58)
    _ (by norm_num) _, areaUnits58]
  norm_num

-- Frozen phase 6769, atom 5528, type 1, source (11,81).
def leavesData59 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves59 : Fin 7 → DyadicLeaf := leavesData59.get
def raw59 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 11 81 leaves59 i
def outputData59 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨2816,2944,20736,20864⟩) (.node (.single ⟨2816,2944,20864,20992⟩) (.single ⟨2944,3008,20736,20800⟩))) (.node (.node (.single ⟨2944,3008,20800,20864⟩) (.single ⟨3008,3072,20736,20800⟩)) (.node (.single ⟨3008,3072,20800,20864⟩) (.single ⟨2944,3072,20864,20992⟩)))) (.node (.node (.single ⟨11776,11904,29696,29824⟩) (.node (.single ⟨11776,11904,29824,29952⟩) (.single ⟨11904,11968,29696,29760⟩))) (.node (.node (.single ⟨11904,11968,29760,29824⟩) (.single ⟨11968,12032,29696,29760⟩)) (.node (.single ⟨11968,12032,29760,29824⟩) (.single ⟨11904,12032,29824,29952⟩))))) (.node (.node (.node (.single ⟨20736,20864,2816,2944⟩) (.node (.single ⟨20736,20800,2944,3008⟩) (.single ⟨20736,20800,3008,3072⟩))) (.node (.node (.single ⟨20800,20864,2944,3008⟩) (.single ⟨20800,20864,3008,3072⟩)) (.node (.single ⟨20864,20992,2816,2944⟩) (.single ⟨20864,20992,2944,3072⟩)))) (.node (.node (.single ⟨29696,29824,11776,11904⟩) (.node (.single ⟨29696,29760,11904,11968⟩) (.single ⟨29696,29760,11968,12032⟩))) (.node (.node (.single ⟨29760,29824,11904,11968⟩) (.single ⟨29760,29824,11968,12032⟩)) (.node (.single ⟨29824,29952,11776,11904⟩) (.single ⟨29824,29952,11904,12032⟩))))))
def output59 : Fin 28 → GridBox := outputData59.get
def coverData59 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData59 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover59 (i : Fin 28) : Fin 28 := ⟨coverData59.get i % 28, Nat.mod_lt _ (by decide)⟩
def source59 (i : Fin 28) : Fin 28 := ⟨sourceData59.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree59 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 (.cutY 21504 (.cutX 2560 .empty (.cutY 20992 (.cutX 2816 .empty (.cutY 20736 .empty (.cutX 2944 (.cutY 20864 .full .full) (.cutY 20864 (.cutX 3008 (.cutY 20800 .full .full) (.cutY 20800 .full .full)) .full)))) .empty)) .empty) .empty) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 .empty (.cutY 29696 .empty (.cutX 11776 .empty (.cutY 30208 (.cutX 12032 (.cutY 29952 (.cutX 11904 (.cutY 29824 .full .full) (.cutY 29824 (.cutX 11968 (.cutY 29760 .full .full) (.cutY 29760 .full .full)) .full)) .empty) .empty) .empty)))) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 (.cutY 3072 (.cutX 20992 (.cutY 2560 .empty (.cutX 20736 .empty (.cutY 2816 .empty (.cutX 20864 (.cutY 2944 .full (.cutX 20800 (.cutY 3008 .full .full) (.cutY 3008 .full .full))) (.cutY 2944 .full .full))))) .empty) .empty) .empty)) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 .empty (.cutY 11264 .empty (.cutX 30208 (.cutY 11776 .empty (.cutX 29952 (.cutY 12032 (.cutX 29824 (.cutY 11904 .full (.cutX 29760 (.cutY 11968 .full .full) (.cutY 11968 .full .full))) (.cutY 11904 .full .full)) .empty) .empty)) .empty)))) .empty) .empty)))) .empty))

theorem metadata59 : 0<139307719 ∧ 11<128 ∧ 81<128 ∧ 1<4 ∧
    5528/4160=1 ∧ 5528%4160=1368 ∧ ∀ i, (leaves59 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData59).mp
    (by decide +kernel)

theorem sourceChecked59_0 : ∀ i : Fin 28,
    (fun i => output59 i = raw59 (source59 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked59 : ∀ i : Fin 28, (fun i => output59 i = raw59 (source59 i)) i :=
  forallFin_of_zero_offset (fun i => output59 i = raw59 (source59 i)) sourceChecked59_0

theorem coverChecked59_0 : ∀ i : Fin 28,
    (fun i => (output59 (cover59 i)).ContainsBox (raw59 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked59 : ∀ i : Fin 28, (fun i => (output59 (cover59 i)).ContainsBox (raw59 i)) i :=
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

noncomputable def phaseMass59 : ℝ := singlePhaseMass (139307719/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw59 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass59_eq : phaseMass59 = (139307719/1638400000000 : ℝ) := by
  unfold phaseMass59
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw59 output59 cover59 source59
    (gridTreeUnionCheck_sound 32768 raw59 output59 cover59 source59 tree59 checked59)
    _ (by norm_num) _, areaUnits59]
  norm_num

-- Frozen phase 6770, atom 5310, type 1, source (9,79).
def leavesData60 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves60 : Fin 4 → DyadicLeaf := leavesData60.get
def raw60 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 9 79 leaves60 i
def outputData60 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨2304,2432,20224,20352⟩) (.single ⟨2304,2432,20352,20480⟩)) (.node (.single ⟨2432,2560,20224,20352⟩) (.single ⟨2432,2560,20352,20480⟩))) (.node (.node (.single ⟨12288,12416,30208,30336⟩) (.single ⟨12288,12416,30336,30464⟩)) (.node (.single ⟨12416,12544,30208,30336⟩) (.single ⟨12416,12544,30336,30464⟩)))) (.node (.node (.node (.single ⟨20224,20352,2304,2432⟩) (.single ⟨20224,20352,2432,2560⟩)) (.node (.single ⟨20352,20480,2304,2432⟩) (.single ⟨20352,20480,2432,2560⟩))) (.node (.node (.single ⟨30208,30336,12288,12416⟩) (.single ⟨30208,30336,12416,12544⟩)) (.node (.single ⟨30336,30464,12288,12416⟩) (.single ⟨30336,30464,12416,12544⟩)))))
def output60 : Fin 16 → GridBox := outputData60.get
def coverData60 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData60 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover60 (i : Fin 16) : Fin 16 := ⟨coverData60.get i % 16, Nat.mod_lt _ (by decide)⟩
def source60 (i : Fin 16) : Fin 16 := ⟨sourceData60.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree60 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 (.cutY 19456 .empty (.cutX 2560 (.cutY 19968 .empty (.cutX 2304 .empty (.cutY 20224 .empty (.cutX 2432 (.cutY 20352 .full .full) (.cutY 20352 .full .full))))) .empty)) .empty))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 (.cutY 29696 .empty (.cutX 12800 (.cutY 30208 .empty (.cutX 12544 (.cutY 30464 (.cutX 12416 (.cutY 30336 .full .full) (.cutY 30336 .full .full)) .empty) .empty)) .empty)) .empty) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 .empty (.cutY 3072 (.cutX 19968 .empty (.cutY 2560 (.cutX 20224 .empty (.cutY 2304 .empty (.cutX 20352 (.cutY 2432 .full .full) (.cutY 2432 .full .full)))) .empty)) .empty)))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 .empty (.cutY 13312 (.cutX 30208 .empty (.cutY 12800 (.cutX 30464 (.cutY 12544 (.cutX 30336 (.cutY 12416 .full .full) (.cutY 12416 .full .full)) .empty) .empty) .empty)) .empty)) .empty) .empty))))) .empty))

theorem metadata60 : 0<94387549 ∧ 9<128 ∧ 79<128 ∧ 1<4 ∧
    5310/4160=1 ∧ 5310%4160=1150 ∧ ∀ i, (leaves60 i).Valid 8 := by
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

noncomputable def phaseMass60 : ℝ := singlePhaseMass (94387549/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw60 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass60_eq : phaseMass60 = (94387549/1638400000000 : ℝ) := by
  unfold phaseMass60
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw60 output60 cover60 source60
    (gridTreeUnionCheck_sound 32768 raw60 output60 cover60 source60 tree60 checked60)
    _ (by norm_num) _, areaUnits60]
  norm_num

-- Frozen phase 6771, atom 1153, type 0, source (9,82).
def leavesData61 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves61 : Fin 7 → DyadicLeaf := leavesData61.get
def raw61 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 9 82 leaves61 i
def outputData61 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨2304,2432,20992,21120⟩) (.node (.single ⟨2304,2432,21120,21248⟩) (.single ⟨2432,2496,20992,21056⟩))) (.node (.node (.single ⟨2432,2496,21056,21120⟩) (.single ⟨2496,2560,20992,21056⟩)) (.node (.single ⟨2496,2560,21056,21120⟩) (.single ⟨2432,2560,21120,21248⟩)))) (.node (.node (.single ⟨11520,11648,30208,30336⟩) (.node (.single ⟨11520,11648,30336,30464⟩) (.single ⟨11648,11712,30208,30272⟩))) (.node (.node (.single ⟨11648,11712,30272,30336⟩) (.single ⟨11712,11776,30208,30272⟩)) (.node (.single ⟨11712,11776,30272,30336⟩) (.single ⟨11648,11776,30336,30464⟩))))) (.node (.node (.node (.single ⟨20992,21120,2304,2432⟩) (.node (.single ⟨20992,21056,2432,2496⟩) (.single ⟨20992,21056,2496,2560⟩))) (.node (.node (.single ⟨21056,21120,2432,2496⟩) (.single ⟨21056,21120,2496,2560⟩)) (.node (.single ⟨21120,21248,2304,2432⟩) (.single ⟨21120,21248,2432,2560⟩)))) (.node (.node (.single ⟨30208,30336,11520,11648⟩) (.node (.single ⟨30208,30272,11648,11712⟩) (.single ⟨30208,30272,11712,11776⟩))) (.node (.node (.single ⟨30272,30336,11648,11712⟩) (.single ⟨30272,30336,11712,11776⟩)) (.node (.single ⟨30336,30464,11520,11648⟩) (.single ⟨30336,30464,11648,11776⟩))))))
def output61 : Fin 28 → GridBox := outputData61.get
def coverData61 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData61 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover61 (i : Fin 28) : Fin 28 := ⟨coverData61.get i % 28, Nat.mod_lt _ (by decide)⟩
def source61 (i : Fin 28) : Fin 28 := ⟨sourceData61.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree61 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 (.cutY 21504 (.cutX 2560 (.cutY 20992 .empty (.cutX 2304 .empty (.cutY 21248 (.cutX 2432 (.cutY 21120 .full .full) (.cutY 21120 (.cutX 2496 (.cutY 21056 .full .full) (.cutY 21056 .full .full)) .full)) .empty))) .empty) .empty) .empty) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 .empty (.cutY 29696 .empty (.cutX 11776 (.cutY 30208 .empty (.cutX 11520 .empty (.cutY 30464 (.cutX 11648 (.cutY 30336 .full .full) (.cutY 30336 (.cutX 11712 (.cutY 30272 .full .full) (.cutY 30272 .full .full)) .full)) .empty))) .empty))) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 (.cutY 3072 (.cutX 20992 .empty (.cutY 2560 (.cutX 21248 (.cutY 2304 .empty (.cutX 21120 (.cutY 2432 .full (.cutX 21056 (.cutY 2496 .full .full) (.cutY 2496 .full .full))) (.cutY 2432 .full .full))) .empty) .empty)) .empty) .empty)) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 .empty (.cutY 11264 .empty (.cutX 30208 .empty (.cutY 11776 (.cutX 30464 (.cutY 11520 .empty (.cutX 30336 (.cutY 11648 .full (.cutX 30272 (.cutY 11712 .full .full) (.cutY 11712 .full .full))) (.cutY 11648 .full .full))) .empty) .empty))))) .empty) .empty)))) .empty))

theorem metadata61 : 0<72090291 ∧ 9<128 ∧ 82<128 ∧ 0<4 ∧
    1153/4160=0 ∧ 1153%4160=1153 ∧ ∀ i, (leaves61 i).Valid 8 := by
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

noncomputable def phaseMass61 : ℝ := singlePhaseMass (72090291/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw61 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass61_eq : phaseMass61 = (72090291/1638400000000 : ℝ) := by
  unfold phaseMass61
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw61 output61 cover61 source61
    (gridTreeUnionCheck_sound 32768 raw61 output61 cover61 source61 tree61 checked61)
    _ (by norm_num) _, areaUnits61]
  norm_num

-- Frozen phase 6772, atom 5420, type 1, source (10,80).
def leavesData62 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves62 : Fin 7 → DyadicLeaf := leavesData62.get
def raw62 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 10 80 leaves62 i
def outputData62 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨2560,2688,20480,20608⟩) (.node (.single ⟨2560,2688,20608,20736⟩) (.single ⟨2688,2752,20480,20544⟩))) (.node (.node (.single ⟨2688,2752,20544,20608⟩) (.single ⟨2752,2816,20480,20544⟩)) (.node (.single ⟨2752,2816,20544,20608⟩) (.single ⟨2688,2816,20608,20736⟩)))) (.node (.node (.single ⟨12032,12160,29952,30080⟩) (.node (.single ⟨12032,12160,30080,30208⟩) (.single ⟨12160,12224,29952,30016⟩))) (.node (.node (.single ⟨12160,12224,30016,30080⟩) (.single ⟨12224,12288,29952,30016⟩)) (.node (.single ⟨12224,12288,30016,30080⟩) (.single ⟨12160,12288,30080,30208⟩))))) (.node (.node (.node (.single ⟨20480,20608,2560,2688⟩) (.node (.single ⟨20480,20544,2688,2752⟩) (.single ⟨20480,20544,2752,2816⟩))) (.node (.node (.single ⟨20544,20608,2688,2752⟩) (.single ⟨20544,20608,2752,2816⟩)) (.node (.single ⟨20608,20736,2560,2688⟩) (.single ⟨20608,20736,2688,2816⟩)))) (.node (.node (.single ⟨29952,30080,12032,12160⟩) (.node (.single ⟨29952,30016,12160,12224⟩) (.single ⟨29952,30016,12224,12288⟩))) (.node (.node (.single ⟨30016,30080,12160,12224⟩) (.single ⟨30016,30080,12224,12288⟩)) (.node (.single ⟨30080,30208,12032,12160⟩) (.single ⟨30080,30208,12160,12288⟩))))))
def output62 : Fin 28 → GridBox := outputData62.get
def coverData62 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData62 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover62 (i : Fin 28) : Fin 28 := ⟨coverData62.get i % 28, Nat.mod_lt _ (by decide)⟩
def source62 (i : Fin 28) : Fin 28 := ⟨sourceData62.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree62 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 (.cutY 21504 (.cutX 2560 .empty (.cutY 20992 (.cutX 2816 (.cutY 20736 (.cutX 2688 (.cutY 20608 .full .full) (.cutY 20608 (.cutX 2752 (.cutY 20544 .full .full) (.cutY 20544 .full .full)) .full)) .empty) .empty) .empty)) .empty) .empty) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 .empty (.cutY 29696 .empty (.cutX 11776 .empty (.cutY 30208 (.cutX 12032 .empty (.cutY 29952 .empty (.cutX 12160 (.cutY 30080 .full .full) (.cutY 30080 (.cutX 12224 (.cutY 30016 .full .full) (.cutY 30016 .full .full)) .full)))) .empty)))) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 (.cutY 3072 (.cutX 20992 (.cutY 2560 .empty (.cutX 20736 (.cutY 2816 (.cutX 20608 (.cutY 2688 .full (.cutX 20544 (.cutY 2752 .full .full) (.cutY 2752 .full .full))) (.cutY 2688 .full .full)) .empty) .empty)) .empty) .empty) .empty)) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 .empty (.cutY 11264 .empty (.cutX 30208 (.cutY 11776 .empty (.cutX 29952 .empty (.cutY 12032 .empty (.cutX 30080 (.cutY 12160 .full (.cutX 30016 (.cutY 12224 .full .full) (.cutY 12224 .full .full))) (.cutY 12160 .full .full))))) .empty)))) .empty) .empty)))) .empty))

theorem metadata62 : 0<139307719 ∧ 10<128 ∧ 80<128 ∧ 1<4 ∧
    5420/4160=1 ∧ 5420%4160=1260 ∧ ∀ i, (leaves62 i).Valid 8 := by
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

noncomputable def phaseMass62 : ℝ := singlePhaseMass (139307719/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw62 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass62_eq : phaseMass62 = (139307719/1638400000000 : ℝ) := by
  unfold phaseMass62
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw62 output62 cover62 source62
    (gridTreeUnionCheck_sound 32768 raw62 output62 cover62 source62 tree62 checked62)
    _ (by norm_num) _, areaUnits62]
  norm_num

-- Frozen phase 6773, atom 5198, type 1, source (8,78).
def leavesData63 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves63 : Fin 7 → DyadicLeaf := leavesData63.get
def raw63 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 8 78 leaves63 i
def outputData63 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨2048,2176,19968,20096⟩) (.node (.single ⟨2048,2176,20096,20224⟩) (.single ⟨2176,2240,19968,20032⟩))) (.node (.node (.single ⟨2176,2240,20032,20096⟩) (.single ⟨2240,2304,19968,20032⟩)) (.node (.single ⟨2240,2304,20032,20096⟩) (.single ⟨2176,2304,20096,20224⟩)))) (.node (.node (.single ⟨12544,12672,30464,30592⟩) (.node (.single ⟨12544,12672,30592,30720⟩) (.single ⟨12672,12736,30464,30528⟩))) (.node (.node (.single ⟨12672,12736,30528,30592⟩) (.single ⟨12736,12800,30464,30528⟩)) (.node (.single ⟨12736,12800,30528,30592⟩) (.single ⟨12672,12800,30592,30720⟩))))) (.node (.node (.node (.single ⟨19968,20096,2048,2176⟩) (.node (.single ⟨19968,20032,2176,2240⟩) (.single ⟨19968,20032,2240,2304⟩))) (.node (.node (.single ⟨20032,20096,2176,2240⟩) (.single ⟨20032,20096,2240,2304⟩)) (.node (.single ⟨20096,20224,2048,2176⟩) (.single ⟨20096,20224,2176,2304⟩)))) (.node (.node (.single ⟨30464,30592,12544,12672⟩) (.node (.single ⟨30464,30528,12672,12736⟩) (.single ⟨30464,30528,12736,12800⟩))) (.node (.node (.single ⟨30528,30592,12672,12736⟩) (.single ⟨30528,30592,12736,12800⟩)) (.node (.single ⟨30592,30720,12544,12672⟩) (.single ⟨30592,30720,12672,12800⟩))))))
def output63 : Fin 28 → GridBox := outputData63.get
def coverData63 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData63 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover63 (i : Fin 28) : Fin 28 := ⟨coverData63.get i % 28, Nat.mod_lt _ (by decide)⟩
def source63 (i : Fin 28) : Fin 28 := ⟨sourceData63.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree63 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 (.cutY 19456 .empty (.cutX 2560 (.cutY 19968 .empty (.cutX 2304 (.cutY 20224 (.cutX 2176 (.cutY 20096 .full .full) (.cutY 20096 (.cutX 2240 (.cutY 20032 .full .full) (.cutY 20032 .full .full)) .full)) .empty) .empty)) .empty)) .empty))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 (.cutY 29696 .empty (.cutX 12800 (.cutY 30208 .empty (.cutX 12544 .empty (.cutY 30464 .empty (.cutX 12672 (.cutY 30592 .full .full) (.cutY 30592 (.cutX 12736 (.cutY 30528 .full .full) (.cutY 30528 .full .full)) .full))))) .empty)) .empty) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 .empty (.cutY 3072 (.cutX 19968 .empty (.cutY 2560 (.cutX 20224 (.cutY 2304 (.cutX 20096 (.cutY 2176 .full (.cutX 20032 (.cutY 2240 .full .full) (.cutY 2240 .full .full))) (.cutY 2176 .full .full)) .empty) .empty) .empty)) .empty)))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 .empty (.cutY 13312 (.cutX 30208 .empty (.cutY 12800 (.cutX 30464 .empty (.cutY 12544 .empty (.cutX 30592 (.cutY 12672 .full (.cutX 30528 (.cutY 12736 .full .full) (.cutY 12736 .full .full))) (.cutY 12672 .full .full)))) .empty)) .empty)) .empty) .empty))))) .empty))

theorem metadata63 : 0<94387549 ∧ 8<128 ∧ 78<128 ∧ 1<4 ∧
    5198/4160=1 ∧ 5198%4160=1038 ∧ ∀ i, (leaves63 i).Valid 8 := by
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

noncomputable def phaseMass63 : ℝ := singlePhaseMass (94387549/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw63 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass63_eq : phaseMass63 = (94387549/1638400000000 : ℝ) := by
  unfold phaseMass63
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw63 output63 cover63 source63
    (gridTreeUnionCheck_sound 32768 raw63 output63 cover63 source63 tree63 checked63)
    _ (by norm_num) _, areaUnits63]
  norm_num

-- Frozen phase 6774, atom 811, type 0, source (6,79).
def leavesData64 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves64 : Fin 4 → DyadicLeaf := leavesData64.get
def raw64 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 6 79 leaves64 i
def outputData64 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨1536,1664,20224,20352⟩) (.single ⟨1536,1664,20352,20480⟩)) (.node (.single ⟨1664,1792,20224,20352⟩) (.single ⟨1664,1792,20352,20480⟩))) (.node (.node (.single ⟨12288,12416,30976,31104⟩) (.single ⟨12288,12416,31104,31232⟩)) (.node (.single ⟨12416,12544,30976,31104⟩) (.single ⟨12416,12544,31104,31232⟩)))) (.node (.node (.node (.single ⟨20224,20352,1536,1664⟩) (.single ⟨20224,20352,1664,1792⟩)) (.node (.single ⟨20352,20480,1536,1664⟩) (.single ⟨20352,20480,1664,1792⟩))) (.node (.node (.single ⟨30976,31104,12288,12416⟩) (.single ⟨30976,31104,12416,12544⟩)) (.node (.single ⟨31104,31232,12288,12416⟩) (.single ⟨31104,31232,12416,12544⟩)))))
def output64 : Fin 16 → GridBox := outputData64.get
def coverData64 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData64 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover64 (i : Fin 16) : Fin 16 := ⟨coverData64.get i % 16, Nat.mod_lt _ (by decide)⟩
def source64 (i : Fin 16) : Fin 16 := ⟨sourceData64.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree64 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 .empty (.cutY 19456 .empty (.cutX 1536 .empty (.cutY 19968 .empty (.cutX 1792 (.cutY 20224 .empty (.cutX 1664 (.cutY 20352 .full .full) (.cutY 20352 .full .full))) .empty)))))) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 (.cutY 31744 (.cutX 12800 (.cutY 31232 (.cutX 12544 (.cutY 30976 .empty (.cutX 12416 (.cutY 31104 .full .full) (.cutY 31104 .full .full))) .empty) .empty) .empty) .empty) .empty)) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 .empty (.cutY 1024 .empty (.cutX 19968 .empty (.cutY 1536 .empty (.cutX 20224 .empty (.cutY 1792 (.cutX 20352 (.cutY 1664 .full .full) (.cutY 1664 .full .full)) .empty)))))) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 (.cutY 13312 (.cutX 31232 (.cutY 12800 (.cutX 30976 .empty (.cutY 12544 (.cutX 31104 (.cutY 12416 .full .full) (.cutY 12416 .full .full)) .empty)) .empty) .empty) .empty) .empty) .empty)))))) .empty))

theorem metadata64 : 0<34183877 ∧ 6<128 ∧ 79<128 ∧ 0<4 ∧
    811/4160=0 ∧ 811%4160=811 ∧ ∀ i, (leaves64 i).Valid 8 := by
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

noncomputable def phaseMass64 : ℝ := singlePhaseMass (34183877/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw64 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass64_eq : phaseMass64 = (34183877/1638400000000 : ℝ) := by
  unfold phaseMass64
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw64 output64 cover64 source64
    (gridTreeUnionCheck_sound 32768 raw64 output64 cover64 source64 tree64 checked64)
    _ (by norm_num) _, areaUnits64]
  norm_num

-- Frozen phase 6775, atom 1263, type 0, source (10,83).
def leavesData65 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,2,2⟩)) (.node (.single ⟨2,2,3⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves65 : Fin 10 → DyadicLeaf := leavesData65.get
def raw65 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 10 83 leaves65 i
def outputData65 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨2560,2688,21248,21376⟩) (.single ⟨2560,2688,21376,21504⟩)) (.node (.single ⟨2688,2752,21248,21312⟩) (.node (.single ⟨2688,2752,21312,21376⟩) (.single ⟨2752,2816,21248,21312⟩)))) (.node (.node (.single ⟨2752,2816,21312,21376⟩) (.single ⟨2688,2752,21376,21440⟩)) (.node (.single ⟨2688,2752,21440,21504⟩) (.node (.single ⟨2752,2816,21376,21440⟩) (.single ⟨2752,2816,21440,21504⟩))))) (.node (.node (.node (.single ⟨11264,11328,29952,30016⟩) (.single ⟨11264,11328,30016,30080⟩)) (.node (.single ⟨11328,11392,29952,30016⟩) (.node (.single ⟨11328,11392,30016,30080⟩) (.single ⟨11264,11392,30080,30208⟩)))) (.node (.node (.single ⟨11392,11456,29952,30016⟩) (.single ⟨11392,11456,30016,30080⟩)) (.node (.single ⟨11456,11520,29952,30016⟩) (.node (.single ⟨11456,11520,30016,30080⟩) (.single ⟨11392,11520,30080,30208⟩)))))) (.node (.node (.node (.node (.single ⟨21248,21376,2560,2688⟩) (.single ⟨21248,21312,2688,2752⟩)) (.node (.single ⟨21248,21312,2752,2816⟩) (.node (.single ⟨21312,21376,2688,2752⟩) (.single ⟨21312,21376,2752,2816⟩)))) (.node (.node (.single ⟨21376,21504,2560,2688⟩) (.single ⟨21376,21440,2688,2752⟩)) (.node (.single ⟨21376,21440,2752,2816⟩) (.node (.single ⟨21440,21504,2688,2752⟩) (.single ⟨21440,21504,2752,2816⟩))))) (.node (.node (.node (.single ⟨29952,30016,11264,11328⟩) (.single ⟨29952,30016,11328,11392⟩)) (.node (.single ⟨30016,30080,11264,11328⟩) (.node (.single ⟨30016,30080,11328,11392⟩) (.single ⟨29952,30016,11392,11456⟩)))) (.node (.node (.single ⟨29952,30016,11456,11520⟩) (.single ⟨30016,30080,11392,11456⟩)) (.node (.single ⟨30016,30080,11456,11520⟩) (.node (.single ⟨30080,30208,11264,11392⟩) (.single ⟨30080,30208,11392,11520⟩)))))))
def output65 : Fin 40 → GridBox := outputData65.get
def coverData65 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 25) (.single 38)) (.node (.single 14) (.node (.single 2) (.single 21))))) (.node (.node (.node (.single 37) (.single 18)) (.node (.single 3) (.node (.single 23) (.single 36)))) (.node (.node (.single 16) (.single 4)) (.node (.single 22) (.node (.single 35) (.single 17)))))) (.node (.node (.node (.node (.single 5) (.single 24)) (.node (.single 34) (.node (.single 15) (.single 6)))) (.node (.node (.single 26) (.single 33)) (.node (.single 13) (.node (.single 7) (.single 28))))) (.node (.node (.node (.single 32) (.single 11)) (.node (.single 8) (.node (.single 27) (.single 31)))) (.node (.node (.single 12) (.single 9)) (.node (.single 29) (.node (.single 30) (.single 10)))))))
def sourceData65 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 12) (.single 16)))) (.node (.node (.single 20) (.single 24)) (.node (.single 28) (.node (.single 32) (.single 36))))) (.node (.node (.node (.single 39) (.single 31)) (.node (.single 35) (.node (.single 27) (.single 7)))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 17) (.node (.single 13) (.single 21)))) (.node (.node (.single 5) (.single 25)) (.node (.single 33) (.node (.single 29) (.single 37))))) (.node (.node (.node (.single 38) (.single 34)) (.node (.single 30) (.node (.single 26) (.single 22)))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.node (.single 6) (.single 2)))))))
def cover65 (i : Fin 40) : Fin 40 := ⟨coverData65.get i % 40, Nat.mod_lt _ (by decide)⟩
def source65 (i : Fin 40) : Fin 40 := ⟨sourceData65.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree65 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 (.cutY 21504 (.cutX 2560 .empty (.cutY 20992 .empty (.cutX 2816 (.cutY 21248 .empty (.cutX 2688 (.cutY 21376 .full .full) (.cutY 21376 (.cutX 2752 (.cutY 21312 .full .full) (.cutY 21312 .full .full)) (.cutX 2752 (.cutY 21440 .full .full) (.cutY 21440 .full .full))))) .empty))) .empty) .empty) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 .empty (.cutY 29696 .empty (.cutX 11776 (.cutY 30208 (.cutX 11520 (.cutY 29952 .empty (.cutX 11392 (.cutY 30080 (.cutX 11328 (.cutY 30016 .full .full) (.cutY 30016 .full .full)) .full) (.cutY 30080 (.cutX 11456 (.cutY 30016 .full .full) (.cutY 30016 .full .full)) .full))) .empty) .empty) .empty))) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 (.cutY 3072 (.cutX 20992 .empty (.cutY 2560 .empty (.cutX 21248 .empty (.cutY 2816 (.cutX 21376 (.cutY 2688 .full (.cutX 21312 (.cutY 2752 .full .full) (.cutY 2752 .full .full))) (.cutY 2688 .full (.cutX 21440 (.cutY 2752 .full .full) (.cutY 2752 .full .full)))) .empty)))) .empty) .empty)) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 .empty (.cutY 11264 .empty (.cutX 30208 (.cutY 11776 (.cutX 29952 .empty (.cutY 11520 (.cutX 30080 (.cutY 11392 (.cutX 30016 (.cutY 11328 .full .full) (.cutY 11328 .full .full)) (.cutX 30016 (.cutY 11456 .full .full) (.cutY 11456 .full .full))) (.cutY 11392 .full .full)) .empty)) .empty) .empty)))) .empty) .empty)))) .empty))

theorem metadata65 : 0<72090291 ∧ 10<128 ∧ 83<128 ∧ 0<4 ∧
    1263/4160=0 ∧ 1263%4160=1263 ∧ ∀ i, (leaves65 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData65).mp
    (by decide +kernel)

theorem sourceChecked65_0 : ∀ i : Fin 40,
    (fun i => output65 i = raw65 (source65 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked65 : ∀ i : Fin 40, (fun i => output65 i = raw65 (source65 i)) i :=
  forallFin_of_zero_offset (fun i => output65 i = raw65 (source65 i)) sourceChecked65_0

theorem coverChecked65_0 : ∀ i : Fin 40,
    (fun i => (output65 (cover65 i)).ContainsBox (raw65 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked65 : ∀ i : Fin 40, (fun i => (output65 (cover65 i)).ContainsBox (raw65 i)) i :=
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

noncomputable def phaseMass65 : ℝ := singlePhaseMass (72090291/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw65 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass65_eq : phaseMass65 = (72090291/1638400000000 : ℝ) := by
  unfold phaseMass65
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw65 output65 cover65 source65
    (gridTreeUnionCheck_sound 32768 raw65 output65 cover65 source65 tree65 checked65)
    _ (by norm_num) _, areaUnits65]
  norm_num

-- Frozen phase 6776, atom 4362, type 1, source (1,75).
def leavesData66 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves66 : Fin 7 → DyadicLeaf := leavesData66.get
def raw66 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 1 75 leaves66 i
def outputData66 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨256,384,19200,19328⟩) (.node (.single ⟨256,384,19328,19456⟩) (.single ⟨384,448,19200,19264⟩))) (.node (.node (.single ⟨384,448,19264,19328⟩) (.single ⟨448,512,19200,19264⟩)) (.node (.single ⟨448,512,19264,19328⟩) (.single ⟨384,512,19328,19456⟩)))) (.node (.node (.single ⟨13312,13440,32256,32384⟩) (.node (.single ⟨13312,13440,32384,32512⟩) (.single ⟨13440,13504,32256,32320⟩))) (.node (.node (.single ⟨13440,13504,32320,32384⟩) (.single ⟨13504,13568,32256,32320⟩)) (.node (.single ⟨13504,13568,32320,32384⟩) (.single ⟨13440,13568,32384,32512⟩))))) (.node (.node (.node (.single ⟨19200,19328,256,384⟩) (.node (.single ⟨19200,19264,384,448⟩) (.single ⟨19200,19264,448,512⟩))) (.node (.node (.single ⟨19264,19328,384,448⟩) (.single ⟨19264,19328,448,512⟩)) (.node (.single ⟨19328,19456,256,384⟩) (.single ⟨19328,19456,384,512⟩)))) (.node (.node (.single ⟨32256,32384,13312,13440⟩) (.node (.single ⟨32256,32320,13440,13504⟩) (.single ⟨32256,32320,13504,13568⟩))) (.node (.node (.single ⟨32320,32384,13440,13504⟩) (.single ⟨32320,32384,13504,13568⟩)) (.node (.single ⟨32384,32512,13312,13440⟩) (.single ⟨32384,32512,13440,13568⟩))))))
def output66 : Fin 28 → GridBox := outputData66.get
def coverData66 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData66 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover66 (i : Fin 28) : Fin 28 := ⟨coverData66.get i % 28, Nat.mod_lt _ (by decide)⟩
def source66 (i : Fin 28) : Fin 28 := ⟨sourceData66.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree66 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 (.cutY 19456 (.cutX 512 (.cutY 18944 .empty (.cutX 256 .empty (.cutY 19200 .empty (.cutX 384 (.cutY 19328 .full .full) (.cutY 19328 (.cutX 448 (.cutY 19264 .full .full) (.cutY 19264 .full .full)) .full))))) .empty) .empty) .empty)) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 .empty (.cutY 31744 .empty (.cutX 13824 (.cutY 32256 .empty (.cutX 13568 (.cutY 32512 (.cutX 13440 (.cutY 32384 .full .full) (.cutY 32384 (.cutX 13504 (.cutY 32320 .full .full) (.cutY 32320 .full .full)) .full)) .empty) .empty)) .empty)))) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 (.cutY 1024 (.cutX 18944 .empty (.cutY 512 (.cutX 19200 .empty (.cutY 256 .empty (.cutX 19328 (.cutY 384 .full (.cutX 19264 (.cutY 448 .full .full) (.cutY 448 .full .full))) (.cutY 384 .full .full)))) .empty)) .empty) .empty) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 .empty (.cutY 13312 .empty (.cutX 32256 .empty (.cutY 13824 (.cutX 32512 (.cutY 13568 (.cutX 32384 (.cutY 13440 .full (.cutX 32320 (.cutY 13504 .full .full) (.cutY 13504 .full .full))) (.cutY 13440 .full .full)) .empty) .empty) .empty)))) .empty)))))) .empty))

theorem metadata66 : 0<137362203 ∧ 1<128 ∧ 75<128 ∧ 1<4 ∧
    4362/4160=1 ∧ 4362%4160=202 ∧ ∀ i, (leaves66 i).Valid 8 := by
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

noncomputable def phaseMass66 : ℝ := singlePhaseMass (137362203/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw66 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass66_eq : phaseMass66 = (137362203/1638400000000 : ℝ) := by
  unfold phaseMass66
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw66 output66 cover66 source66
    (gridTreeUnionCheck_sound 32768 raw66 output66 cover66 source66 tree66 checked66)
    _ (by norm_num) _, areaUnits66]
  norm_num

-- Frozen phase 6777, atom 4235, type 1, source (0,75).
def leavesData67 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves67 : Fin 4 → DyadicLeaf := leavesData67.get
def raw67 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 0 75 leaves67 i
def outputData67 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨0,128,19200,19328⟩) (.single ⟨0,128,19328,19456⟩)) (.node (.single ⟨128,256,19200,19328⟩) (.single ⟨128,256,19328,19456⟩))) (.node (.node (.single ⟨13312,13440,32512,32640⟩) (.single ⟨13312,13440,32640,32768⟩)) (.node (.single ⟨13440,13568,32512,32640⟩) (.single ⟨13440,13568,32640,32768⟩)))) (.node (.node (.node (.single ⟨19200,19328,0,128⟩) (.single ⟨19200,19328,128,256⟩)) (.node (.single ⟨19328,19456,0,128⟩) (.single ⟨19328,19456,128,256⟩))) (.node (.node (.single ⟨32512,32640,13312,13440⟩) (.single ⟨32512,32640,13440,13568⟩)) (.node (.single ⟨32640,32768,13312,13440⟩) (.single ⟨32640,32768,13440,13568⟩)))))
def output67 : Fin 16 → GridBox := outputData67.get
def coverData67 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData67 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover67 (i : Fin 16) : Fin 16 := ⟨coverData67.get i % 16, Nat.mod_lt _ (by decide)⟩
def source67 (i : Fin 16) : Fin 16 := ⟨sourceData67.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree67 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 (.cutY 19456 (.cutX 512 (.cutY 18944 .empty (.cutX 256 (.cutY 19200 .empty (.cutX 128 (.cutY 19328 .full .full) (.cutY 19328 .full .full))) .empty)) .empty) .empty) .empty)) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 .empty (.cutY 31744 .empty (.cutX 13824 (.cutY 32256 .empty (.cutX 13568 (.cutY 32512 .empty (.cutX 13440 (.cutY 32640 .full .full) (.cutY 32640 .full .full))) .empty)) .empty)))) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 (.cutY 1024 (.cutX 18944 .empty (.cutY 512 (.cutX 19200 .empty (.cutY 256 (.cutX 19328 (.cutY 128 .full .full) (.cutY 128 .full .full)) .empty)) .empty)) .empty) .empty) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 .empty (.cutY 13312 .empty (.cutX 32256 .empty (.cutY 13824 (.cutX 32512 .empty (.cutY 13568 (.cutX 32640 (.cutY 13440 .full .full) (.cutY 13440 .full .full)) .empty)) .empty)))) .empty)))))) .empty))

theorem metadata67 : 0<137362203 ∧ 0<128 ∧ 75<128 ∧ 1<4 ∧
    4235/4160=1 ∧ 4235%4160=75 ∧ ∀ i, (leaves67 i).Valid 8 := by
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

noncomputable def phaseMass67 : ℝ := singlePhaseMass (137362203/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw67 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass67_eq : phaseMass67 = (137362203/1638400000000 : ℝ) := by
  unfold phaseMass67
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw67 output67 cover67 source67
    (gridTreeUnionCheck_sound 32768 raw67 output67 cover67 source67 tree67 checked67)
    _ (by norm_num) _, areaUnits67]
  norm_num

-- Frozen phase 6778, atom 6045, type 1, source (16,93).
def leavesData68 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,2,2⟩)))) (.node (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,0⟩)) (.node (.single ⟨2,3,1⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves68 : Fin 10 → DyadicLeaf := leavesData68.get
def raw68 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 16 93 leaves68 i
def outputData68 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨4096,4224,23808,23936⟩) (.single ⟨4096,4224,23936,24064⟩)) (.node (.single ⟨4224,4288,23808,23872⟩) (.node (.single ⟨4224,4288,23872,23936⟩) (.single ⟨4288,4352,23808,23872⟩)))) (.node (.node (.single ⟨4288,4352,23872,23936⟩) (.single ⟨4224,4288,23936,24000⟩)) (.node (.single ⟨4224,4288,24000,24064⟩) (.node (.single ⟨4288,4352,23936,24000⟩) (.single ⟨4288,4352,24000,24064⟩))))) (.node (.node (.node (.single ⟨8704,8768,28416,28480⟩) (.single ⟨8704,8768,28480,28544⟩)) (.node (.single ⟨8768,8832,28416,28480⟩) (.node (.single ⟨8768,8832,28480,28544⟩) (.single ⟨8704,8832,28544,28672⟩)))) (.node (.node (.single ⟨8832,8896,28416,28480⟩) (.single ⟨8832,8896,28480,28544⟩)) (.node (.single ⟨8896,8960,28416,28480⟩) (.node (.single ⟨8896,8960,28480,28544⟩) (.single ⟨8832,8960,28544,28672⟩)))))) (.node (.node (.node (.node (.single ⟨23808,23936,4096,4224⟩) (.single ⟨23808,23872,4224,4288⟩)) (.node (.single ⟨23808,23872,4288,4352⟩) (.node (.single ⟨23872,23936,4224,4288⟩) (.single ⟨23872,23936,4288,4352⟩)))) (.node (.node (.single ⟨23936,24064,4096,4224⟩) (.single ⟨23936,24000,4224,4288⟩)) (.node (.single ⟨23936,24000,4288,4352⟩) (.node (.single ⟨24000,24064,4224,4288⟩) (.single ⟨24000,24064,4288,4352⟩))))) (.node (.node (.node (.single ⟨28416,28480,8704,8768⟩) (.single ⟨28416,28480,8768,8832⟩)) (.node (.single ⟨28480,28544,8704,8768⟩) (.node (.single ⟨28480,28544,8768,8832⟩) (.single ⟨28416,28480,8832,8896⟩)))) (.node (.node (.single ⟨28416,28480,8896,8960⟩) (.single ⟨28480,28544,8832,8896⟩)) (.node (.single ⟨28480,28544,8896,8960⟩) (.node (.single ⟨28544,28672,8704,8832⟩) (.single ⟨28544,28672,8832,8960⟩)))))))
def output68 : Fin 40 → GridBox := outputData68.get
def coverData68 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 25) (.single 38)) (.node (.single 14) (.node (.single 2) (.single 21))))) (.node (.node (.node (.single 37) (.single 18)) (.node (.single 3) (.node (.single 23) (.single 36)))) (.node (.node (.single 16) (.single 6)) (.node (.single 26) (.node (.single 33) (.single 13)))))) (.node (.node (.node (.node (.single 7) (.single 28)) (.node (.single 32) (.node (.single 11) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 8) (.node (.single 27) (.single 31)))) (.node (.node (.single 12) (.single 9)) (.node (.single 29) (.node (.single 30) (.single 10)))))))
def sourceData68 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 12) (.single 24)))) (.node (.node (.single 28) (.single 16)) (.node (.single 20) (.node (.single 32) (.single 36))))) (.node (.node (.node (.single 39) (.single 23)) (.node (.single 35) (.node (.single 19) (.single 7)))) (.node (.node (.single 31) (.single 15)) (.node (.single 27) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 25) (.node (.single 13) (.single 29)))) (.node (.node (.single 5) (.single 17)) (.node (.single 33) (.node (.single 21) (.single 37))))) (.node (.node (.node (.single 38) (.single 34)) (.node (.single 22) (.node (.single 18) (.single 30)))) (.node (.node (.single 26) (.single 14)) (.node (.single 10) (.node (.single 6) (.single 2)))))))
def cover68 (i : Fin 40) : Fin 40 := ⟨coverData68.get i % 40, Nat.mod_lt _ (by decide)⟩
def source68 (i : Fin 40) : Fin 40 := ⟨sourceData68.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree68 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 .empty (.cutX 5120 (.cutY 23552 .empty (.cutX 4608 (.cutY 24064 (.cutX 4352 (.cutY 23808 .empty (.cutX 4224 (.cutY 23936 .full .full) (.cutY 23936 (.cutX 4288 (.cutY 23872 .full .full) (.cutY 23872 .full .full)) (.cutX 4288 (.cutY 24000 .full .full) (.cutY 24000 .full .full))))) .empty) .empty) .empty)) .empty)) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 .empty (.cutX 9216 (.cutY 27648 .empty (.cutX 8704 .empty (.cutY 28160 .empty (.cutX 8960 (.cutY 28416 .empty (.cutX 8832 (.cutY 28544 (.cutX 8768 (.cutY 28480 .full .full) (.cutY 28480 .full .full)) .full) (.cutY 28544 (.cutX 8896 (.cutY 28480 .full .full) (.cutY 28480 .full .full)) .full))) .empty)))) .empty)) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 (.cutX 23552 .empty (.cutY 5120 (.cutX 24064 (.cutY 4608 (.cutX 23808 .empty (.cutY 4352 (.cutX 23936 (.cutY 4224 .full (.cutX 23872 (.cutY 4288 .full .full) (.cutY 4288 .full .full))) (.cutY 4224 .full (.cutX 24000 (.cutY 4288 .full .full) (.cutY 4288 .full .full)))) .empty)) .empty) .empty) .empty)) .empty)))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 (.cutX 27648 .empty (.cutY 9216 (.cutX 28160 .empty (.cutY 8704 .empty (.cutX 28416 .empty (.cutY 8960 (.cutX 28544 (.cutY 8832 (.cutX 28480 (.cutY 8768 .full .full) (.cutY 8768 .full .full)) (.cutX 28480 (.cutY 8896 .full .full) (.cutY 8896 .full .full))) (.cutY 8832 .full .full)) .empty)))) .empty)) .empty)) .empty) .empty))) .empty))

theorem metadata68 : 0<192153497 ∧ 16<128 ∧ 93<128 ∧ 1<4 ∧
    6045/4160=1 ∧ 6045%4160=1885 ∧ ∀ i, (leaves68 i).Valid 8 := by
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

noncomputable def phaseMass68 : ℝ := singlePhaseMass (192153497/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw68 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass68_eq : phaseMass68 = (192153497/1638400000000 : ℝ) := by
  unfold phaseMass68
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw68 output68 cover68 source68
    (gridTreeUnionCheck_sound 32768 raw68 output68 cover68 source68 tree68 checked68)
    _ (by norm_num) _, areaUnits68]
  norm_num

-- Frozen phase 6779, atom 1689, type 0, source (14,93).
def leavesData69 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves69 : Fin 7 → DyadicLeaf := leavesData69.get
def raw69 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 14 93 leaves69 i
def outputData69 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3584,3712,23808,23936⟩) (.node (.single ⟨3584,3712,23936,24064⟩) (.single ⟨3712,3776,23808,23872⟩))) (.node (.node (.single ⟨3712,3776,23872,23936⟩) (.single ⟨3776,3840,23808,23872⟩)) (.node (.single ⟨3776,3840,23872,23936⟩) (.single ⟨3712,3840,23936,24064⟩)))) (.node (.node (.single ⟨8704,8832,28928,29056⟩) (.node (.single ⟨8704,8832,29056,29184⟩) (.single ⟨8832,8896,28928,28992⟩))) (.node (.node (.single ⟨8832,8896,28992,29056⟩) (.single ⟨8896,8960,28928,28992⟩)) (.node (.single ⟨8896,8960,28992,29056⟩) (.single ⟨8832,8960,29056,29184⟩))))) (.node (.node (.node (.single ⟨23808,23936,3584,3712⟩) (.node (.single ⟨23808,23872,3712,3776⟩) (.single ⟨23808,23872,3776,3840⟩))) (.node (.node (.single ⟨23872,23936,3712,3776⟩) (.single ⟨23872,23936,3776,3840⟩)) (.node (.single ⟨23936,24064,3584,3712⟩) (.single ⟨23936,24064,3712,3840⟩)))) (.node (.node (.single ⟨28928,29056,8704,8832⟩) (.node (.single ⟨28928,28992,8832,8896⟩) (.single ⟨28928,28992,8896,8960⟩))) (.node (.node (.single ⟨28992,29056,8832,8896⟩) (.single ⟨28992,29056,8896,8960⟩)) (.node (.single ⟨29056,29184,8704,8832⟩) (.single ⟨29056,29184,8832,8960⟩))))))
def output69 : Fin 28 → GridBox := outputData69.get
def coverData69 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData69 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover69 (i : Fin 28) : Fin 28 := ⟨coverData69.get i % 28, Nat.mod_lt _ (by decide)⟩
def source69 (i : Fin 28) : Fin 28 := ⟨sourceData69.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree69 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 .empty (.cutX 3072 .empty (.cutY 23552 .empty (.cutX 3584 .empty (.cutY 24064 (.cutX 3840 (.cutY 23808 .empty (.cutX 3712 (.cutY 23936 .full .full) (.cutY 23936 (.cutX 3776 (.cutY 23872 .full .full) (.cutY 23872 .full .full)) .full))) .empty) .empty))))))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 (.cutY 30720 (.cutX 9216 (.cutY 29696 (.cutX 8704 .empty (.cutY 29184 (.cutX 8960 (.cutY 28928 .empty (.cutX 8832 (.cutY 29056 .full .full) (.cutY 29056 (.cutX 8896 (.cutY 28992 .full .full) (.cutY 28992 .full .full)) .full))) .empty) .empty)) .empty) .empty) .empty) .empty)) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 .empty (.cutY 2048 .empty (.cutX 23552 .empty (.cutY 3072 .empty (.cutX 24064 (.cutY 3584 .empty (.cutX 23808 .empty (.cutY 3840 (.cutX 23936 (.cutY 3712 .full (.cutX 23872 (.cutY 3776 .full .full) (.cutY 3776 .full .full))) (.cutY 3712 .full .full)) .empty))) .empty))))) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 (.cutX 29696 (.cutY 9216 (.cutX 29184 (.cutY 8704 .empty (.cutX 28928 .empty (.cutY 8960 (.cutX 29056 (.cutY 8832 .full (.cutX 28992 (.cutY 8896 .full .full) (.cutY 8896 .full .full))) (.cutY 8832 .full .full)) .empty))) .empty) .empty) .empty) .empty) .empty) .empty)))) .empty))

theorem metadata69 : 0<77641223 ∧ 14<128 ∧ 93<128 ∧ 0<4 ∧
    1689/4160=0 ∧ 1689%4160=1689 ∧ ∀ i, (leaves69 i).Valid 8 := by
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

noncomputable def phaseMass69 : ℝ := singlePhaseMass (77641223/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw69 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass69_eq : phaseMass69 = (77641223/1638400000000 : ℝ) := by
  unfold phaseMass69
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw69 output69 cover69 source69
    (gridTreeUnionCheck_sound 32768 raw69 output69 cover69 source69 tree69 checked69)
    _ (by norm_num) _, areaUnits69]
  norm_num

-- Frozen phase 6780, atom 1372, type 0, source (11,85).
def leavesData70 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves70 : Fin 7 → DyadicLeaf := leavesData70.get
def raw70 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 11 85 leaves70 i
def outputData70 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨2816,2944,21760,21888⟩) (.node (.single ⟨2816,2944,21888,22016⟩) (.single ⟨2944,3008,21760,21824⟩))) (.node (.node (.single ⟨2944,3008,21824,21888⟩) (.single ⟨3008,3072,21760,21824⟩)) (.node (.single ⟨3008,3072,21824,21888⟩) (.single ⟨2944,3072,21888,22016⟩)))) (.node (.node (.single ⟨10752,10880,29696,29824⟩) (.node (.single ⟨10752,10880,29824,29952⟩) (.single ⟨10880,10944,29696,29760⟩))) (.node (.node (.single ⟨10880,10944,29760,29824⟩) (.single ⟨10944,11008,29696,29760⟩)) (.node (.single ⟨10944,11008,29760,29824⟩) (.single ⟨10880,11008,29824,29952⟩))))) (.node (.node (.node (.single ⟨21760,21888,2816,2944⟩) (.node (.single ⟨21760,21824,2944,3008⟩) (.single ⟨21760,21824,3008,3072⟩))) (.node (.node (.single ⟨21824,21888,2944,3008⟩) (.single ⟨21824,21888,3008,3072⟩)) (.node (.single ⟨21888,22016,2816,2944⟩) (.single ⟨21888,22016,2944,3072⟩)))) (.node (.node (.single ⟨29696,29824,10752,10880⟩) (.node (.single ⟨29696,29760,10880,10944⟩) (.single ⟨29696,29760,10944,11008⟩))) (.node (.node (.single ⟨29760,29824,10880,10944⟩) (.single ⟨29760,29824,10944,11008⟩)) (.node (.single ⟨29824,29952,10752,10880⟩) (.single ⟨29824,29952,10880,11008⟩))))))
def output70 : Fin 28 → GridBox := outputData70.get
def coverData70 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData70 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover70 (i : Fin 28) : Fin 28 := ⟨coverData70.get i % 28, Nat.mod_lt _ (by decide)⟩
def source70 (i : Fin 28) : Fin 28 := ⟨sourceData70.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree70 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 (.cutY 21504 .empty (.cutX 2560 .empty (.cutY 22016 (.cutX 2816 .empty (.cutY 21760 .empty (.cutX 2944 (.cutY 21888 .full .full) (.cutY 21888 (.cutX 3008 (.cutY 21824 .full .full) (.cutY 21824 .full .full)) .full)))) .empty))) .empty) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 (.cutY 29696 .empty (.cutX 10752 .empty (.cutY 30208 (.cutX 11008 (.cutY 29952 (.cutX 10880 (.cutY 29824 .full .full) (.cutY 29824 (.cutX 10944 (.cutY 29760 .full .full) (.cutY 29760 .full .full)) .full)) .empty) .empty) .empty))) .empty) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 .empty (.cutY 3072 (.cutX 22016 (.cutY 2560 .empty (.cutX 21760 .empty (.cutY 2816 .empty (.cutX 21888 (.cutY 2944 .full (.cutX 21824 (.cutY 3008 .full .full) (.cutY 3008 .full .full))) (.cutY 2944 .full .full))))) .empty) .empty))) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 .empty (.cutY 11264 (.cutX 30208 (.cutY 10752 .empty (.cutX 29952 (.cutY 11008 (.cutX 29824 (.cutY 10880 .full (.cutX 29760 (.cutY 10944 .full .full) (.cutY 10944 .full .full))) (.cutY 10880 .full .full)) .empty) .empty)) .empty) .empty))) .empty) .empty)))) .empty))

theorem metadata70 : 0<72090291 ∧ 11<128 ∧ 85<128 ∧ 0<4 ∧
    1372/4160=0 ∧ 1372%4160=1372 ∧ ∀ i, (leaves70 i).Valid 8 := by
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

noncomputable def phaseMass70 : ℝ := singlePhaseMass (72090291/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw70 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass70_eq : phaseMass70 = (72090291/1638400000000 : ℝ) := by
  unfold phaseMass70
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw70 output70 cover70 source70
    (gridTreeUnionCheck_sound 32768 raw70 output70 cover70 source70 tree70 checked70)
    _ (by norm_num) _, areaUnits70]
  norm_num

-- Frozen phase 6781, atom 693, type 0, source (5,78).
def leavesData71 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves71 : Fin 7 → DyadicLeaf := leavesData71.get
def raw71 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 5 78 leaves71 i
def outputData71 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨1280,1408,19968,20096⟩) (.node (.single ⟨1280,1408,20096,20224⟩) (.single ⟨1408,1472,19968,20032⟩))) (.node (.node (.single ⟨1408,1472,20032,20096⟩) (.single ⟨1472,1536,19968,20032⟩)) (.node (.single ⟨1472,1536,20032,20096⟩) (.single ⟨1408,1536,20096,20224⟩)))) (.node (.node (.single ⟨12544,12672,31232,31360⟩) (.node (.single ⟨12544,12672,31360,31488⟩) (.single ⟨12672,12736,31232,31296⟩))) (.node (.node (.single ⟨12672,12736,31296,31360⟩) (.single ⟨12736,12800,31232,31296⟩)) (.node (.single ⟨12736,12800,31296,31360⟩) (.single ⟨12672,12800,31360,31488⟩))))) (.node (.node (.node (.single ⟨19968,20096,1280,1408⟩) (.node (.single ⟨19968,20032,1408,1472⟩) (.single ⟨19968,20032,1472,1536⟩))) (.node (.node (.single ⟨20032,20096,1408,1472⟩) (.single ⟨20032,20096,1472,1536⟩)) (.node (.single ⟨20096,20224,1280,1408⟩) (.single ⟨20096,20224,1408,1536⟩)))) (.node (.node (.single ⟨31232,31360,12544,12672⟩) (.node (.single ⟨31232,31296,12672,12736⟩) (.single ⟨31232,31296,12736,12800⟩))) (.node (.node (.single ⟨31296,31360,12672,12736⟩) (.single ⟨31296,31360,12736,12800⟩)) (.node (.single ⟨31360,31488,12544,12672⟩) (.single ⟨31360,31488,12672,12800⟩))))))
def output71 : Fin 28 → GridBox := outputData71.get
def coverData71 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData71 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover71 (i : Fin 28) : Fin 28 := ⟨coverData71.get i % 28, Nat.mod_lt _ (by decide)⟩
def source71 (i : Fin 28) : Fin 28 := ⟨sourceData71.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree71 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 .empty (.cutY 19456 .empty (.cutX 1536 (.cutY 19968 .empty (.cutX 1280 .empty (.cutY 20224 (.cutX 1408 (.cutY 20096 .full .full) (.cutY 20096 (.cutX 1472 (.cutY 20032 .full .full) (.cutY 20032 .full .full)) .full)) .empty))) .empty)))) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 (.cutY 31744 (.cutX 12800 (.cutY 31232 .empty (.cutX 12544 .empty (.cutY 31488 (.cutX 12672 (.cutY 31360 .full .full) (.cutY 31360 (.cutX 12736 (.cutY 31296 .full .full) (.cutY 31296 .full .full)) .full)) .empty))) .empty) .empty) .empty)) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 .empty (.cutY 1024 .empty (.cutX 19968 .empty (.cutY 1536 (.cutX 20224 (.cutY 1280 .empty (.cutX 20096 (.cutY 1408 .full (.cutX 20032 (.cutY 1472 .full .full) (.cutY 1472 .full .full))) (.cutY 1408 .full .full))) .empty) .empty)))) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 (.cutY 13312 (.cutX 31232 .empty (.cutY 12800 (.cutX 31488 (.cutY 12544 .empty (.cutX 31360 (.cutY 12672 .full (.cutX 31296 (.cutY 12736 .full .full) (.cutY 12736 .full .full))) (.cutY 12672 .full .full))) .empty) .empty)) .empty) .empty) .empty)))))) .empty))

theorem metadata71 : 0<34183877 ∧ 5<128 ∧ 78<128 ∧ 0<4 ∧
    693/4160=0 ∧ 693%4160=693 ∧ ∀ i, (leaves71 i).Valid 8 := by
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

noncomputable def phaseMass71 : ℝ := singlePhaseMass (34183877/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw71 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass71_eq : phaseMass71 = (34183877/1638400000000 : ℝ) := by
  unfold phaseMass71
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw71 output71 cover71 source71
    (gridTreeUnionCheck_sound 32768 raw71 output71 cover71 source71 tree71 checked71)
    _ (by norm_num) _, areaUnits71]
  norm_num

-- Frozen phase 6782, atom 1479, type 0, source (12,87).
def leavesData72 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,2,2⟩)))) (.node (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,0⟩)) (.node (.single ⟨2,3,1⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves72 : Fin 10 → DyadicLeaf := leavesData72.get
def raw72 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 12 87 leaves72 i
def outputData72 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨3072,3200,22272,22400⟩) (.single ⟨3072,3200,22400,22528⟩)) (.node (.single ⟨3200,3264,22272,22336⟩) (.node (.single ⟨3200,3264,22336,22400⟩) (.single ⟨3264,3328,22272,22336⟩)))) (.node (.node (.single ⟨3264,3328,22336,22400⟩) (.single ⟨3200,3264,22400,22464⟩)) (.node (.single ⟨3200,3264,22464,22528⟩) (.node (.single ⟨3264,3328,22400,22464⟩) (.single ⟨3264,3328,22464,22528⟩))))) (.node (.node (.node (.single ⟨10240,10304,29440,29504⟩) (.single ⟨10240,10304,29504,29568⟩)) (.node (.single ⟨10304,10368,29440,29504⟩) (.node (.single ⟨10304,10368,29504,29568⟩) (.single ⟨10240,10368,29568,29696⟩)))) (.node (.node (.single ⟨10368,10432,29440,29504⟩) (.single ⟨10368,10432,29504,29568⟩)) (.node (.single ⟨10432,10496,29440,29504⟩) (.node (.single ⟨10432,10496,29504,29568⟩) (.single ⟨10368,10496,29568,29696⟩)))))) (.node (.node (.node (.node (.single ⟨22272,22400,3072,3200⟩) (.single ⟨22272,22336,3200,3264⟩)) (.node (.single ⟨22272,22336,3264,3328⟩) (.node (.single ⟨22336,22400,3200,3264⟩) (.single ⟨22336,22400,3264,3328⟩)))) (.node (.node (.single ⟨22400,22528,3072,3200⟩) (.single ⟨22400,22464,3200,3264⟩)) (.node (.single ⟨22400,22464,3264,3328⟩) (.node (.single ⟨22464,22528,3200,3264⟩) (.single ⟨22464,22528,3264,3328⟩))))) (.node (.node (.node (.single ⟨29440,29504,10240,10304⟩) (.single ⟨29440,29504,10304,10368⟩)) (.node (.single ⟨29504,29568,10240,10304⟩) (.node (.single ⟨29504,29568,10304,10368⟩) (.single ⟨29440,29504,10368,10432⟩)))) (.node (.node (.single ⟨29440,29504,10432,10496⟩) (.single ⟨29504,29568,10368,10432⟩)) (.node (.single ⟨29504,29568,10432,10496⟩) (.node (.single ⟨29568,29696,10240,10368⟩) (.single ⟨29568,29696,10368,10496⟩)))))))
def output72 : Fin 40 → GridBox := outputData72.get
def coverData72 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 25) (.single 38)) (.node (.single 14) (.node (.single 2) (.single 21))))) (.node (.node (.node (.single 37) (.single 18)) (.node (.single 3) (.node (.single 23) (.single 36)))) (.node (.node (.single 16) (.single 6)) (.node (.single 26) (.node (.single 33) (.single 13)))))) (.node (.node (.node (.node (.single 7) (.single 28)) (.node (.single 32) (.node (.single 11) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 8) (.node (.single 27) (.single 31)))) (.node (.node (.single 12) (.single 9)) (.node (.single 29) (.node (.single 30) (.single 10)))))))
def sourceData72 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 12) (.single 24)))) (.node (.node (.single 28) (.single 16)) (.node (.single 20) (.node (.single 32) (.single 36))))) (.node (.node (.node (.single 39) (.single 23)) (.node (.single 35) (.node (.single 19) (.single 7)))) (.node (.node (.single 31) (.single 15)) (.node (.single 27) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 25) (.node (.single 13) (.single 29)))) (.node (.node (.single 5) (.single 17)) (.node (.single 33) (.node (.single 21) (.single 37))))) (.node (.node (.node (.single 38) (.single 34)) (.node (.single 22) (.node (.single 18) (.single 30)))) (.node (.node (.single 26) (.single 14)) (.node (.single 10) (.node (.single 6) (.single 2)))))))
def cover72 (i : Fin 40) : Fin 40 := ⟨coverData72.get i % 40, Nat.mod_lt _ (by decide)⟩
def source72 (i : Fin 40) : Fin 40 := ⟨sourceData72.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree72 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 .empty (.cutY 21504 .empty (.cutX 3584 (.cutY 22016 .empty (.cutX 3328 (.cutY 22272 .empty (.cutX 3200 (.cutY 22400 .full .full) (.cutY 22400 (.cutX 3264 (.cutY 22336 .full .full) (.cutY 22336 .full .full)) (.cutX 3264 (.cutY 22464 .full .full) (.cutY 22464 .full .full))))) .empty)) .empty))) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 (.cutY 29696 (.cutX 10752 (.cutY 29184 .empty (.cutX 10496 (.cutY 29440 .empty (.cutX 10368 (.cutY 29568 (.cutX 10304 (.cutY 29504 .full .full) (.cutY 29504 .full .full)) .full) (.cutY 29568 (.cutX 10432 (.cutY 29504 .full .full) (.cutY 29504 .full .full)) .full))) .empty)) .empty) .empty) .empty) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 .empty (.cutY 3072 .empty (.cutX 22016 .empty (.cutY 3584 (.cutX 22272 .empty (.cutY 3328 (.cutX 22400 (.cutY 3200 .full (.cutX 22336 (.cutY 3264 .full .full) (.cutY 3264 .full .full))) (.cutY 3200 .full (.cutX 22464 (.cutY 3264 .full .full) (.cutY 3264 .full .full)))) .empty)) .empty))))) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 (.cutY 11264 (.cutX 29184 .empty (.cutY 10752 (.cutX 29440 .empty (.cutY 10496 (.cutX 29568 (.cutY 10368 (.cutX 29504 (.cutY 10304 .full .full) (.cutY 10304 .full .full)) (.cutX 29504 (.cutY 10432 .full .full) (.cutY 10432 .full .full))) (.cutY 10368 .full .full)) .empty)) .empty)) .empty) .empty)) .empty) .empty)))) .empty))

theorem metadata72 : 0<72090291 ∧ 12<128 ∧ 87<128 ∧ 0<4 ∧
    1479/4160=0 ∧ 1479%4160=1479 ∧ ∀ i, (leaves72 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData72).mp
    (by decide +kernel)

theorem sourceChecked72_0 : ∀ i : Fin 40,
    (fun i => output72 i = raw72 (source72 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked72 : ∀ i : Fin 40, (fun i => output72 i = raw72 (source72 i)) i :=
  forallFin_of_zero_offset (fun i => output72 i = raw72 (source72 i)) sourceChecked72_0

theorem coverChecked72_0 : ∀ i : Fin 40,
    (fun i => (output72 (cover72 i)).ContainsBox (raw72 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked72 : ∀ i : Fin 40, (fun i => (output72 (cover72 i)).ContainsBox (raw72 i)) i :=
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

noncomputable def phaseMass72 : ℝ := singlePhaseMass (72090291/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw72 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass72_eq : phaseMass72 = (72090291/1638400000000 : ℝ) := by
  unfold phaseMass72
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw72 output72 cover72 source72
    (gridTreeUnionCheck_sound 32768 raw72 output72 cover72 source72 tree72 checked72)
    _ (by norm_num) _, areaUnits72]
  norm_num

-- Frozen phase 6783, atom 5843, type 1, source (14,87).
def leavesData73 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,2,2⟩)) (.node (.single ⟨2,2,3⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves73 : Fin 10 → DyadicLeaf := leavesData73.get
def raw73 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 14 87 leaves73 i
def outputData73 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨3584,3712,22272,22400⟩) (.single ⟨3584,3712,22400,22528⟩)) (.node (.single ⟨3712,3776,22272,22336⟩) (.node (.single ⟨3712,3776,22336,22400⟩) (.single ⟨3776,3840,22272,22336⟩)))) (.node (.node (.single ⟨3776,3840,22336,22400⟩) (.single ⟨3712,3776,22400,22464⟩)) (.node (.single ⟨3712,3776,22464,22528⟩) (.node (.single ⟨3776,3840,22400,22464⟩) (.single ⟨3776,3840,22464,22528⟩))))) (.node (.node (.node (.single ⟨10240,10304,28928,28992⟩) (.single ⟨10240,10304,28992,29056⟩)) (.node (.single ⟨10304,10368,28928,28992⟩) (.node (.single ⟨10304,10368,28992,29056⟩) (.single ⟨10240,10368,29056,29184⟩)))) (.node (.node (.single ⟨10368,10432,28928,28992⟩) (.single ⟨10368,10432,28992,29056⟩)) (.node (.single ⟨10432,10496,28928,28992⟩) (.node (.single ⟨10432,10496,28992,29056⟩) (.single ⟨10368,10496,29056,29184⟩)))))) (.node (.node (.node (.node (.single ⟨22272,22400,3584,3712⟩) (.single ⟨22272,22336,3712,3776⟩)) (.node (.single ⟨22272,22336,3776,3840⟩) (.node (.single ⟨22336,22400,3712,3776⟩) (.single ⟨22336,22400,3776,3840⟩)))) (.node (.node (.single ⟨22400,22528,3584,3712⟩) (.single ⟨22400,22464,3712,3776⟩)) (.node (.single ⟨22400,22464,3776,3840⟩) (.node (.single ⟨22464,22528,3712,3776⟩) (.single ⟨22464,22528,3776,3840⟩))))) (.node (.node (.node (.single ⟨28928,28992,10240,10304⟩) (.single ⟨28928,28992,10304,10368⟩)) (.node (.single ⟨28992,29056,10240,10304⟩) (.node (.single ⟨28992,29056,10304,10368⟩) (.single ⟨28928,28992,10368,10432⟩)))) (.node (.node (.single ⟨28928,28992,10432,10496⟩) (.single ⟨28992,29056,10368,10432⟩)) (.node (.single ⟨28992,29056,10432,10496⟩) (.node (.single ⟨29056,29184,10240,10368⟩) (.single ⟨29056,29184,10368,10496⟩)))))))
def output73 : Fin 40 → GridBox := outputData73.get
def coverData73 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 25) (.single 38)) (.node (.single 14) (.node (.single 2) (.single 21))))) (.node (.node (.node (.single 37) (.single 18)) (.node (.single 3) (.node (.single 23) (.single 36)))) (.node (.node (.single 16) (.single 4)) (.node (.single 22) (.node (.single 35) (.single 17)))))) (.node (.node (.node (.node (.single 5) (.single 24)) (.node (.single 34) (.node (.single 15) (.single 6)))) (.node (.node (.single 26) (.single 33)) (.node (.single 13) (.node (.single 7) (.single 28))))) (.node (.node (.node (.single 32) (.single 11)) (.node (.single 8) (.node (.single 27) (.single 31)))) (.node (.node (.single 12) (.single 9)) (.node (.single 29) (.node (.single 30) (.single 10)))))))
def sourceData73 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 12) (.single 16)))) (.node (.node (.single 20) (.single 24)) (.node (.single 28) (.node (.single 32) (.single 36))))) (.node (.node (.node (.single 39) (.single 31)) (.node (.single 35) (.node (.single 27) (.single 7)))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 17) (.node (.single 13) (.single 21)))) (.node (.node (.single 5) (.single 25)) (.node (.single 33) (.node (.single 29) (.single 37))))) (.node (.node (.node (.single 38) (.single 34)) (.node (.single 30) (.node (.single 26) (.single 22)))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.node (.single 6) (.single 2)))))))
def cover73 (i : Fin 40) : Fin 40 := ⟨coverData73.get i % 40, Nat.mod_lt _ (by decide)⟩
def source73 (i : Fin 40) : Fin 40 := ⟨sourceData73.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree73 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 .empty (.cutY 21504 .empty (.cutX 3584 .empty (.cutY 22016 .empty (.cutX 3840 (.cutY 22272 .empty (.cutX 3712 (.cutY 22400 .full .full) (.cutY 22400 (.cutX 3776 (.cutY 22336 .full .full) (.cutY 22336 .full .full)) (.cutX 3776 (.cutY 22464 .full .full) (.cutY 22464 .full .full))))) .empty))))) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 (.cutY 29696 (.cutX 10752 (.cutY 29184 (.cutX 10496 (.cutY 28928 .empty (.cutX 10368 (.cutY 29056 (.cutX 10304 (.cutY 28992 .full .full) (.cutY 28992 .full .full)) .full) (.cutY 29056 (.cutX 10432 (.cutY 28992 .full .full) (.cutY 28992 .full .full)) .full))) .empty) .empty) .empty) .empty) .empty) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 .empty (.cutY 3072 .empty (.cutX 22016 .empty (.cutY 3584 .empty (.cutX 22272 .empty (.cutY 3840 (.cutX 22400 (.cutY 3712 .full (.cutX 22336 (.cutY 3776 .full .full) (.cutY 3776 .full .full))) (.cutY 3712 .full (.cutX 22464 (.cutY 3776 .full .full) (.cutY 3776 .full .full)))) .empty))))))) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 (.cutY 11264 (.cutX 29184 (.cutY 10752 (.cutX 28928 .empty (.cutY 10496 (.cutX 29056 (.cutY 10368 (.cutX 28992 (.cutY 10304 .full .full) (.cutY 10304 .full .full)) (.cutX 28992 (.cutY 10432 .full .full) (.cutY 10432 .full .full))) (.cutY 10368 .full .full)) .empty)) .empty) .empty) .empty) .empty)) .empty) .empty)))) .empty))

theorem metadata73 : 0<139307719 ∧ 14<128 ∧ 87<128 ∧ 1<4 ∧
    5843/4160=1 ∧ 5843%4160=1683 ∧ ∀ i, (leaves73 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData73).mp
    (by decide +kernel)

theorem sourceChecked73_0 : ∀ i : Fin 40,
    (fun i => output73 i = raw73 (source73 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked73 : ∀ i : Fin 40, (fun i => output73 i = raw73 (source73 i)) i :=
  forallFin_of_zero_offset (fun i => output73 i = raw73 (source73 i)) sourceChecked73_0

theorem coverChecked73_0 : ∀ i : Fin 40,
    (fun i => (output73 (cover73 i)).ContainsBox (raw73 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked73 : ∀ i : Fin 40, (fun i => (output73 (cover73 i)).ContainsBox (raw73 i)) i :=
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

noncomputable def phaseMass73 : ℝ := singlePhaseMass (139307719/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw73 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass73_eq : phaseMass73 = (139307719/1638400000000 : ℝ) := by
  unfold phaseMass73
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw73 output73 cover73 source73
    (gridTreeUnionCheck_sound 32768 raw73 output73 cover73 source73 tree73 checked73)
    _ (by norm_num) _, areaUnits73]
  norm_num

-- Frozen phase 6784, atom 5635, type 1, source (12,83).
def leavesData74 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves74 : Fin 7 → DyadicLeaf := leavesData74.get
def raw74 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 12 83 leaves74 i
def outputData74 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3072,3200,21248,21376⟩) (.node (.single ⟨3072,3200,21376,21504⟩) (.single ⟨3200,3264,21248,21312⟩))) (.node (.node (.single ⟨3200,3264,21312,21376⟩) (.single ⟨3264,3328,21248,21312⟩)) (.node (.single ⟨3264,3328,21312,21376⟩) (.single ⟨3200,3328,21376,21504⟩)))) (.node (.node (.single ⟨11264,11392,29440,29568⟩) (.node (.single ⟨11264,11392,29568,29696⟩) (.single ⟨11392,11456,29440,29504⟩))) (.node (.node (.single ⟨11392,11456,29504,29568⟩) (.single ⟨11456,11520,29440,29504⟩)) (.node (.single ⟨11456,11520,29504,29568⟩) (.single ⟨11392,11520,29568,29696⟩))))) (.node (.node (.node (.single ⟨21248,21376,3072,3200⟩) (.node (.single ⟨21248,21312,3200,3264⟩) (.single ⟨21248,21312,3264,3328⟩))) (.node (.node (.single ⟨21312,21376,3200,3264⟩) (.single ⟨21312,21376,3264,3328⟩)) (.node (.single ⟨21376,21504,3072,3200⟩) (.single ⟨21376,21504,3200,3328⟩)))) (.node (.node (.single ⟨29440,29568,11264,11392⟩) (.node (.single ⟨29440,29504,11392,11456⟩) (.single ⟨29440,29504,11456,11520⟩))) (.node (.node (.single ⟨29504,29568,11392,11456⟩) (.single ⟨29504,29568,11456,11520⟩)) (.node (.single ⟨29568,29696,11264,11392⟩) (.single ⟨29568,29696,11392,11520⟩))))))
def output74 : Fin 28 → GridBox := outputData74.get
def coverData74 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData74 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover74 (i : Fin 28) : Fin 28 := ⟨coverData74.get i % 28, Nat.mod_lt _ (by decide)⟩
def source74 (i : Fin 28) : Fin 28 := ⟨sourceData74.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree74 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 .empty (.cutY 21504 (.cutX 3584 (.cutY 20992 .empty (.cutX 3328 (.cutY 21248 .empty (.cutX 3200 (.cutY 21376 .full .full) (.cutY 21376 (.cutX 3264 (.cutY 21312 .full .full) (.cutY 21312 .full .full)) .full))) .empty)) .empty) .empty)) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 .empty (.cutY 29696 (.cutX 11776 (.cutY 29184 .empty (.cutX 11520 (.cutY 29440 .empty (.cutX 11392 (.cutY 29568 .full .full) (.cutY 29568 (.cutX 11456 (.cutY 29504 .full .full) (.cutY 29504 .full .full)) .full))) .empty)) .empty) .empty)) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 (.cutY 3072 .empty (.cutX 20992 .empty (.cutY 3584 (.cutX 21248 .empty (.cutY 3328 (.cutX 21376 (.cutY 3200 .full (.cutX 21312 (.cutY 3264 .full .full) (.cutY 3264 .full .full))) (.cutY 3200 .full .full)) .empty)) .empty))) .empty)) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 (.cutY 11264 .empty (.cutX 29184 .empty (.cutY 11776 (.cutX 29440 .empty (.cutY 11520 (.cutX 29568 (.cutY 11392 .full (.cutX 29504 (.cutY 11456 .full .full) (.cutY 11456 .full .full))) (.cutY 11392 .full .full)) .empty)) .empty))) .empty)) .empty) .empty)))) .empty))

theorem metadata74 : 0<139307719 ∧ 12<128 ∧ 83<128 ∧ 1<4 ∧
    5635/4160=1 ∧ 5635%4160=1475 ∧ ∀ i, (leaves74 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData74).mp
    (by decide +kernel)

theorem sourceChecked74_0 : ∀ i : Fin 28,
    (fun i => output74 i = raw74 (source74 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked74 : ∀ i : Fin 28, (fun i => output74 i = raw74 (source74 i)) i :=
  forallFin_of_zero_offset (fun i => output74 i = raw74 (source74 i)) sourceChecked74_0

theorem coverChecked74_0 : ∀ i : Fin 28,
    (fun i => (output74 (cover74 i)).ContainsBox (raw74 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked74 : ∀ i : Fin 28, (fun i => (output74 (cover74 i)).ContainsBox (raw74 i)) i :=
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

noncomputable def phaseMass74 : ℝ := singlePhaseMass (139307719/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw74 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass74_eq : phaseMass74 = (139307719/1638400000000 : ℝ) := by
  unfold phaseMass74
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw74 output74 cover74 source74
    (gridTreeUnionCheck_sound 32768 raw74 output74 cover74 source74 tree74 checked74)
    _ (by norm_num) _, areaUnits74]
  norm_num

-- Frozen phase 6785, atom 1790, type 0, source (15,95).
def leavesData75 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves75 : Fin 7 → DyadicLeaf := leavesData75.get
def raw75 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 15 95 leaves75 i
def outputData75 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3840,3968,24320,24448⟩) (.node (.single ⟨3840,3968,24448,24576⟩) (.single ⟨3968,4032,24320,24384⟩))) (.node (.node (.single ⟨3968,4032,24384,24448⟩) (.single ⟨4032,4096,24320,24384⟩)) (.node (.single ⟨4032,4096,24384,24448⟩) (.single ⟨3968,4096,24448,24576⟩)))) (.node (.node (.single ⟨8192,8320,28672,28800⟩) (.node (.single ⟨8192,8320,28800,28928⟩) (.single ⟨8320,8384,28672,28736⟩))) (.node (.node (.single ⟨8320,8384,28736,28800⟩) (.single ⟨8384,8448,28672,28736⟩)) (.node (.single ⟨8384,8448,28736,28800⟩) (.single ⟨8320,8448,28800,28928⟩))))) (.node (.node (.node (.single ⟨24320,24448,3840,3968⟩) (.node (.single ⟨24320,24384,3968,4032⟩) (.single ⟨24320,24384,4032,4096⟩))) (.node (.node (.single ⟨24384,24448,3968,4032⟩) (.single ⟨24384,24448,4032,4096⟩)) (.node (.single ⟨24448,24576,3840,3968⟩) (.single ⟨24448,24576,3968,4096⟩)))) (.node (.node (.single ⟨28672,28800,8192,8320⟩) (.node (.single ⟨28672,28736,8320,8384⟩) (.single ⟨28672,28736,8384,8448⟩))) (.node (.node (.single ⟨28736,28800,8320,8384⟩) (.single ⟨28736,28800,8384,8448⟩)) (.node (.single ⟨28800,28928,8192,8320⟩) (.single ⟨28800,28928,8320,8448⟩))))))
def output75 : Fin 28 → GridBox := outputData75.get
def coverData75 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData75 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover75 (i : Fin 28) : Fin 28 := ⟨coverData75.get i % 28, Nat.mod_lt _ (by decide)⟩
def source75 (i : Fin 28) : Fin 28 := ⟨sourceData75.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree75 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 .empty (.cutX 3072 .empty (.cutY 23552 .empty (.cutX 3584 .empty (.cutY 24064 .empty (.cutX 3840 .empty (.cutY 24320 .empty (.cutX 3968 (.cutY 24448 .full .full) (.cutY 24448 (.cutX 4032 (.cutY 24384 .full .full) (.cutY 24384 .full .full)) .full))))))))))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 (.cutY 30720 (.cutX 9216 (.cutY 29696 (.cutX 8704 (.cutY 29184 (.cutX 8448 (.cutY 28928 (.cutX 8320 (.cutY 28800 .full .full) (.cutY 28800 (.cutX 8384 (.cutY 28736 .full .full) (.cutY 28736 .full .full)) .full)) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty)) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 .empty (.cutY 2048 .empty (.cutX 23552 .empty (.cutY 3072 .empty (.cutX 24064 .empty (.cutY 3584 .empty (.cutX 24320 .empty (.cutY 3840 .empty (.cutX 24448 (.cutY 3968 .full (.cutX 24384 (.cutY 4032 .full .full) (.cutY 4032 .full .full))) (.cutY 3968 .full .full)))))))))) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 (.cutX 29696 (.cutY 9216 (.cutX 29184 (.cutY 8704 (.cutX 28928 (.cutY 8448 (.cutX 28800 (.cutY 8320 .full (.cutX 28736 (.cutY 8384 .full .full) (.cutY 8384 .full .full))) (.cutY 8320 .full .full)) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty)))) .empty))

theorem metadata75 : 0<77641223 ∧ 15<128 ∧ 95<128 ∧ 0<4 ∧
    1790/4160=0 ∧ 1790%4160=1790 ∧ ∀ i, (leaves75 i).Valid 8 := by
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

noncomputable def phaseMass75 : ℝ := singlePhaseMass (77641223/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw75 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass75_eq : phaseMass75 = (77641223/1638400000000 : ℝ) := by
  unfold phaseMass75
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw75 output75 cover75 source75
    (gridTreeUnionCheck_sound 32768 raw75 output75 cover75 source75 tree75 checked75)
    _ (by norm_num) _, areaUnits75]
  norm_num

-- Frozen phase 6786, atom 1888, type 0, source (16,96).
def leavesData76 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves76 : Fin 10 → DyadicLeaf := leavesData76.get
def raw76 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 16 96 leaves76 i
def outputData76 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨4096,4160,24576,24640⟩) (.single ⟨4096,4160,24640,24704⟩)) (.node (.single ⟨4160,4224,24576,24640⟩) (.node (.single ⟨4160,4224,24640,24704⟩) (.single ⟨4096,4224,24704,24832⟩)))) (.node (.node (.single ⟨4224,4288,24576,24640⟩) (.single ⟨4224,4288,24640,24704⟩)) (.node (.single ⟨4288,4352,24576,24640⟩) (.node (.single ⟨4288,4352,24640,24704⟩) (.single ⟨4224,4352,24704,24832⟩))))) (.node (.node (.node (.single ⟨7936,8064,28416,28544⟩) (.single ⟨7936,8064,28544,28672⟩)) (.node (.single ⟨8064,8128,28416,28480⟩) (.node (.single ⟨8064,8128,28480,28544⟩) (.single ⟨8128,8192,28416,28480⟩)))) (.node (.node (.single ⟨8128,8192,28480,28544⟩) (.single ⟨8064,8128,28544,28608⟩)) (.node (.single ⟨8064,8128,28608,28672⟩) (.node (.single ⟨8128,8192,28544,28608⟩) (.single ⟨8128,8192,28608,28672⟩)))))) (.node (.node (.node (.node (.single ⟨24576,24640,4096,4160⟩) (.single ⟨24576,24640,4160,4224⟩)) (.node (.single ⟨24640,24704,4096,4160⟩) (.node (.single ⟨24640,24704,4160,4224⟩) (.single ⟨24576,24640,4224,4288⟩)))) (.node (.node (.single ⟨24576,24640,4288,4352⟩) (.single ⟨24640,24704,4224,4288⟩)) (.node (.single ⟨24640,24704,4288,4352⟩) (.node (.single ⟨24704,24832,4096,4224⟩) (.single ⟨24704,24832,4224,4352⟩))))) (.node (.node (.node (.single ⟨28416,28544,7936,8064⟩) (.single ⟨28416,28480,8064,8128⟩)) (.node (.single ⟨28416,28480,8128,8192⟩) (.node (.single ⟨28480,28544,8064,8128⟩) (.single ⟨28480,28544,8128,8192⟩)))) (.node (.node (.single ⟨28544,28672,7936,8064⟩) (.single ⟨28544,28608,8064,8128⟩)) (.node (.single ⟨28544,28608,8128,8192⟩) (.node (.single ⟨28608,28672,8064,8128⟩) (.single ⟨28608,28672,8128,8192⟩)))))))
def output76 : Fin 40 → GridBox := outputData76.get
def coverData76 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData76 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover76 (i : Fin 40) : Fin 40 := ⟨coverData76.get i % 40, Nat.mod_lt _ (by decide)⟩
def source76 (i : Fin 40) : Fin 40 := ⟨sourceData76.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree76 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 (.cutY 26624 (.cutX 5120 (.cutY 25600 (.cutX 4608 (.cutY 25088 (.cutX 4352 (.cutY 24832 (.cutX 4224 (.cutY 24704 (.cutX 4160 (.cutY 24640 .full .full) (.cutY 24640 .full .full)) .full) (.cutY 24704 (.cutX 4288 (.cutY 24640 .full .full) (.cutY 24640 .full .full)) .full)) .empty) .empty) .empty) .empty) .empty) .empty) .empty) (.cutY 26624 .empty (.cutX 7168 .empty (.cutY 27648 .empty (.cutX 7680 .empty (.cutY 28160 .empty (.cutX 7936 .empty (.cutY 28416 .empty (.cutX 8064 (.cutY 28544 .full .full) (.cutY 28544 (.cutX 8128 (.cutY 28480 .full .full) (.cutY 28480 .full .full)) (.cutX 8128 (.cutY 28608 .full .full) (.cutY 28608 .full .full)))))))))))) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 (.cutX 25600 (.cutY 5120 (.cutX 25088 (.cutY 4608 (.cutX 24832 (.cutY 4352 (.cutX 24704 (.cutY 4224 (.cutX 24640 (.cutY 4160 .full .full) (.cutY 4160 .full .full)) (.cutX 24640 (.cutY 4288 .full .full) (.cutY 4288 .full .full))) (.cutY 4224 .full .full)) .empty) .empty) .empty) .empty) .empty) .empty) .empty) (.cutY 6144 .empty (.cutX 27648 .empty (.cutY 7168 .empty (.cutX 28160 .empty (.cutY 7680 .empty (.cutX 28416 .empty (.cutY 7936 .empty (.cutX 28544 (.cutY 8064 .full (.cutX 28480 (.cutY 8128 .full .full) (.cutY 8128 .full .full))) (.cutY 8064 .full (.cutX 28608 (.cutY 8128 .full .full) (.cutY 8128 .full .full))))))))))))) .empty) .empty)) .empty))

theorem metadata76 : 0<121837468 ∧ 16<128 ∧ 96<128 ∧ 0<4 ∧
    1888/4160=0 ∧ 1888%4160=1888 ∧ ∀ i, (leaves76 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData76).mp
    (by decide +kernel)

theorem sourceChecked76_0 : ∀ i : Fin 40,
    (fun i => output76 i = raw76 (source76 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked76 : ∀ i : Fin 40, (fun i => output76 i = raw76 (source76 i)) i :=
  forallFin_of_zero_offset (fun i => output76 i = raw76 (source76 i)) sourceChecked76_0

theorem coverChecked76_0 : ∀ i : Fin 40,
    (fun i => (output76 (cover76 i)).ContainsBox (raw76 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked76 : ∀ i : Fin 40, (fun i => (output76 (cover76 i)).ContainsBox (raw76 i)) i :=
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

noncomputable def phaseMass76 : ℝ := singlePhaseMass (121837468/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw76 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass76_eq : phaseMass76 = (30459367/409600000000 : ℝ) := by
  unfold phaseMass76
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw76 output76 cover76 source76
    (gridTreeUnionCheck_sound 32768 raw76 output76 cover76 source76 tree76 checked76)
    _ (by norm_num) _, areaUnits76]
  norm_num

-- Frozen phase 6787, atom 5085, type 1, source (7,78).
def leavesData77 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves77 : Fin 4 → DyadicLeaf := leavesData77.get
def raw77 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 7 78 leaves77 i
def outputData77 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨1792,1920,19968,20096⟩) (.single ⟨1792,1920,20096,20224⟩)) (.node (.single ⟨1920,2048,19968,20096⟩) (.single ⟨1920,2048,20096,20224⟩))) (.node (.node (.single ⟨12544,12672,30720,30848⟩) (.single ⟨12544,12672,30848,30976⟩)) (.node (.single ⟨12672,12800,30720,30848⟩) (.single ⟨12672,12800,30848,30976⟩)))) (.node (.node (.node (.single ⟨19968,20096,1792,1920⟩) (.single ⟨19968,20096,1920,2048⟩)) (.node (.single ⟨20096,20224,1792,1920⟩) (.single ⟨20096,20224,1920,2048⟩))) (.node (.node (.single ⟨30720,30848,12544,12672⟩) (.single ⟨30720,30848,12672,12800⟩)) (.node (.single ⟨30848,30976,12544,12672⟩) (.single ⟨30848,30976,12672,12800⟩)))))
def output77 : Fin 16 → GridBox := outputData77.get
def coverData77 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData77 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover77 (i : Fin 16) : Fin 16 := ⟨coverData77.get i % 16, Nat.mod_lt _ (by decide)⟩
def source77 (i : Fin 16) : Fin 16 := ⟨sourceData77.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree77 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 .empty (.cutY 19456 .empty (.cutX 1536 .empty (.cutY 19968 .empty (.cutX 1792 .empty (.cutY 20224 (.cutX 1920 (.cutY 20096 .full .full) (.cutY 20096 .full .full)) .empty))))))) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 (.cutY 31744 (.cutX 12800 (.cutY 31232 (.cutX 12544 .empty (.cutY 30976 (.cutX 12672 (.cutY 30848 .full .full) (.cutY 30848 .full .full)) .empty)) .empty) .empty) .empty) .empty)) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 .empty (.cutY 1024 .empty (.cutX 19968 .empty (.cutY 1536 .empty (.cutX 20224 (.cutY 1792 .empty (.cutX 20096 (.cutY 1920 .full .full) (.cutY 1920 .full .full))) .empty))))) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 (.cutY 13312 (.cutX 31232 (.cutY 12800 (.cutX 30976 (.cutY 12544 .empty (.cutX 30848 (.cutY 12672 .full .full) (.cutY 12672 .full .full))) .empty) .empty) .empty) .empty) .empty) .empty)))))) .empty))

theorem metadata77 : 0<137362203 ∧ 7<128 ∧ 78<128 ∧ 1<4 ∧
    5085/4160=1 ∧ 5085%4160=925 ∧ ∀ i, (leaves77 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData77).mp
    (by decide +kernel)

theorem sourceChecked77_0 : ∀ i : Fin 16,
    (fun i => output77 i = raw77 (source77 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked77 : ∀ i : Fin 16, (fun i => output77 i = raw77 (source77 i)) i :=
  forallFin_of_zero_offset (fun i => output77 i = raw77 (source77 i)) sourceChecked77_0

theorem coverChecked77_0 : ∀ i : Fin 16,
    (fun i => (output77 (cover77 i)).ContainsBox (raw77 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked77 : ∀ i : Fin 16, (fun i => (output77 (cover77 i)).ContainsBox (raw77 i)) i :=
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

noncomputable def phaseMass77 : ℝ := singlePhaseMass (137362203/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw77 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass77_eq : phaseMass77 = (137362203/1638400000000 : ℝ) := by
  unfold phaseMass77
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw77 output77 cover77 source77
    (gridTreeUnionCheck_sound 32768 raw77 output77 cover77 source77 tree77 checked77)
    _ (by norm_num) _, areaUnits77]
  norm_num

-- Frozen phase 6788, atom 452, type 0, source (3,77).
def leavesData78 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves78 : Fin 7 → DyadicLeaf := leavesData78.get
def raw78 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 3 77 leaves78 i
def outputData78 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨768,896,19712,19840⟩) (.node (.single ⟨768,896,19840,19968⟩) (.single ⟨896,960,19712,19776⟩))) (.node (.node (.single ⟨896,960,19776,19840⟩) (.single ⟨960,1024,19712,19776⟩)) (.node (.single ⟨960,1024,19776,19840⟩) (.single ⟨896,1024,19840,19968⟩)))) (.node (.node (.single ⟨12800,12928,31744,31872⟩) (.node (.single ⟨12800,12928,31872,32000⟩) (.single ⟨12928,12992,31744,31808⟩))) (.node (.node (.single ⟨12928,12992,31808,31872⟩) (.single ⟨12992,13056,31744,31808⟩)) (.node (.single ⟨12992,13056,31808,31872⟩) (.single ⟨12928,13056,31872,32000⟩))))) (.node (.node (.node (.single ⟨19712,19840,768,896⟩) (.node (.single ⟨19712,19776,896,960⟩) (.single ⟨19712,19776,960,1024⟩))) (.node (.node (.single ⟨19776,19840,896,960⟩) (.single ⟨19776,19840,960,1024⟩)) (.node (.single ⟨19840,19968,768,896⟩) (.single ⟨19840,19968,896,1024⟩)))) (.node (.node (.single ⟨31744,31872,12800,12928⟩) (.node (.single ⟨31744,31808,12928,12992⟩) (.single ⟨31744,31808,12992,13056⟩))) (.node (.node (.single ⟨31808,31872,12928,12992⟩) (.single ⟨31808,31872,12992,13056⟩)) (.node (.single ⟨31872,32000,12800,12928⟩) (.single ⟨31872,32000,12928,13056⟩))))))
def output78 : Fin 28 → GridBox := outputData78.get
def coverData78 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData78 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover78 (i : Fin 28) : Fin 28 := ⟨coverData78.get i % 28, Nat.mod_lt _ (by decide)⟩
def source78 (i : Fin 28) : Fin 28 := ⟨sourceData78.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree78 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 (.cutY 19456 .empty (.cutX 512 .empty (.cutY 19968 (.cutX 768 .empty (.cutY 19712 .empty (.cutX 896 (.cutY 19840 .full .full) (.cutY 19840 (.cutX 960 (.cutY 19776 .full .full) (.cutY 19776 .full .full)) .full)))) .empty))) .empty)) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 (.cutY 31744 .empty (.cutX 12800 .empty (.cutY 32256 (.cutX 13056 (.cutY 32000 (.cutX 12928 (.cutY 31872 .full .full) (.cutY 31872 (.cutX 12992 (.cutY 31808 .full .full) (.cutY 31808 .full .full)) .full)) .empty) .empty) .empty))) .empty)) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 .empty (.cutY 1024 (.cutX 19968 (.cutY 512 .empty (.cutX 19712 .empty (.cutY 768 .empty (.cutX 19840 (.cutY 896 .full (.cutX 19776 (.cutY 960 .full .full) (.cutY 960 .full .full))) (.cutY 896 .full .full))))) .empty) .empty)) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 .empty (.cutY 13312 (.cutX 32256 (.cutY 12800 .empty (.cutX 32000 (.cutY 13056 (.cutX 31872 (.cutY 12928 .full (.cutX 31808 (.cutY 12992 .full .full) (.cutY 12992 .full .full))) (.cutY 12928 .full .full)) .empty) .empty)) .empty) .empty)) .empty)))))) .empty))

theorem metadata78 : 0<34183877 ∧ 3<128 ∧ 77<128 ∧ 0<4 ∧
    452/4160=0 ∧ 452%4160=452 ∧ ∀ i, (leaves78 i).Valid 8 := by
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

noncomputable def phaseMass78 : ℝ := singlePhaseMass (34183877/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw78 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass78_eq : phaseMass78 = (34183877/1638400000000 : ℝ) := by
  unfold phaseMass78
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw78 output78 cover78 source78
    (gridTreeUnionCheck_sound 32768 raw78 output78 cover78 source78 tree78 checked78)
    _ (by norm_num) _, areaUnits78]
  norm_num

-- Frozen phase 6789, atom 4852, type 1, source (5,77).
def leavesData79 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves79 : Fin 7 → DyadicLeaf := leavesData79.get
def raw79 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 5 77 leaves79 i
def outputData79 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨1280,1408,19712,19840⟩) (.node (.single ⟨1280,1408,19840,19968⟩) (.single ⟨1408,1472,19712,19776⟩))) (.node (.node (.single ⟨1408,1472,19776,19840⟩) (.single ⟨1472,1536,19712,19776⟩)) (.node (.single ⟨1472,1536,19776,19840⟩) (.single ⟨1408,1536,19840,19968⟩)))) (.node (.node (.single ⟨12800,12928,31232,31360⟩) (.node (.single ⟨12800,12928,31360,31488⟩) (.single ⟨12928,12992,31232,31296⟩))) (.node (.node (.single ⟨12928,12992,31296,31360⟩) (.single ⟨12992,13056,31232,31296⟩)) (.node (.single ⟨12992,13056,31296,31360⟩) (.single ⟨12928,13056,31360,31488⟩))))) (.node (.node (.node (.single ⟨19712,19840,1280,1408⟩) (.node (.single ⟨19712,19776,1408,1472⟩) (.single ⟨19712,19776,1472,1536⟩))) (.node (.node (.single ⟨19776,19840,1408,1472⟩) (.single ⟨19776,19840,1472,1536⟩)) (.node (.single ⟨19840,19968,1280,1408⟩) (.single ⟨19840,19968,1408,1536⟩)))) (.node (.node (.single ⟨31232,31360,12800,12928⟩) (.node (.single ⟨31232,31296,12928,12992⟩) (.single ⟨31232,31296,12992,13056⟩))) (.node (.node (.single ⟨31296,31360,12928,12992⟩) (.single ⟨31296,31360,12992,13056⟩)) (.node (.single ⟨31360,31488,12800,12928⟩) (.single ⟨31360,31488,12928,13056⟩))))))
def output79 : Fin 28 → GridBox := outputData79.get
def coverData79 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData79 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover79 (i : Fin 28) : Fin 28 := ⟨coverData79.get i % 28, Nat.mod_lt _ (by decide)⟩
def source79 (i : Fin 28) : Fin 28 := ⟨sourceData79.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree79 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 .empty (.cutY 19456 .empty (.cutX 1536 (.cutY 19968 (.cutX 1280 .empty (.cutY 19712 .empty (.cutX 1408 (.cutY 19840 .full .full) (.cutY 19840 (.cutX 1472 (.cutY 19776 .full .full) (.cutY 19776 .full .full)) .full)))) .empty) .empty)))) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 (.cutY 31744 (.cutX 12800 .empty (.cutY 31232 .empty (.cutX 13056 (.cutY 31488 (.cutX 12928 (.cutY 31360 .full .full) (.cutY 31360 (.cutX 12992 (.cutY 31296 .full .full) (.cutY 31296 .full .full)) .full)) .empty) .empty))) .empty) .empty)) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 .empty (.cutY 1024 .empty (.cutX 19968 (.cutY 1536 (.cutX 19712 .empty (.cutY 1280 .empty (.cutX 19840 (.cutY 1408 .full (.cutX 19776 (.cutY 1472 .full .full) (.cutY 1472 .full .full))) (.cutY 1408 .full .full)))) .empty) .empty))) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 (.cutY 13312 (.cutX 31232 .empty (.cutY 12800 .empty (.cutX 31488 (.cutY 13056 (.cutX 31360 (.cutY 12928 .full (.cutX 31296 (.cutY 12992 .full .full) (.cutY 12992 .full .full))) (.cutY 12928 .full .full)) .empty) .empty))) .empty) .empty) .empty)))))) .empty))

theorem metadata79 : 0<137362203 ∧ 5<128 ∧ 77<128 ∧ 1<4 ∧
    4852/4160=1 ∧ 4852%4160=692 ∧ ∀ i, (leaves79 i).Valid 8 := by
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

noncomputable def phaseMass79 : ℝ := singlePhaseMass (137362203/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw79 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass79_eq : phaseMass79 = (137362203/1638400000000 : ℝ) := by
  unfold phaseMass79
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw79 output79 cover79 source79
    (gridTreeUnionCheck_sound 32768 raw79 output79 cover79 source79 tree79 checked79)
    _ (by norm_num) _, areaUnits79]
  norm_num

-- Frozen phase 6790, atom 4611, type 1, source (3,76).
def leavesData80 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves80 : Fin 7 → DyadicLeaf := leavesData80.get
def raw80 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 3 76 leaves80 i
def outputData80 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨768,896,19456,19584⟩) (.node (.single ⟨768,896,19584,19712⟩) (.single ⟨896,960,19456,19520⟩))) (.node (.node (.single ⟨896,960,19520,19584⟩) (.single ⟨960,1024,19456,19520⟩)) (.node (.single ⟨960,1024,19520,19584⟩) (.single ⟨896,1024,19584,19712⟩)))) (.node (.node (.single ⟨13056,13184,31744,31872⟩) (.node (.single ⟨13056,13184,31872,32000⟩) (.single ⟨13184,13248,31744,31808⟩))) (.node (.node (.single ⟨13184,13248,31808,31872⟩) (.single ⟨13248,13312,31744,31808⟩)) (.node (.single ⟨13248,13312,31808,31872⟩) (.single ⟨13184,13312,31872,32000⟩))))) (.node (.node (.node (.single ⟨19456,19584,768,896⟩) (.node (.single ⟨19456,19520,896,960⟩) (.single ⟨19456,19520,960,1024⟩))) (.node (.node (.single ⟨19520,19584,896,960⟩) (.single ⟨19520,19584,960,1024⟩)) (.node (.single ⟨19584,19712,768,896⟩) (.single ⟨19584,19712,896,1024⟩)))) (.node (.node (.single ⟨31744,31872,13056,13184⟩) (.node (.single ⟨31744,31808,13184,13248⟩) (.single ⟨31744,31808,13248,13312⟩))) (.node (.node (.single ⟨31808,31872,13184,13248⟩) (.single ⟨31808,31872,13248,13312⟩)) (.node (.single ⟨31872,32000,13056,13184⟩) (.single ⟨31872,32000,13184,13312⟩))))))
def output80 : Fin 28 → GridBox := outputData80.get
def coverData80 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData80 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover80 (i : Fin 28) : Fin 28 := ⟨coverData80.get i % 28, Nat.mod_lt _ (by decide)⟩
def source80 (i : Fin 28) : Fin 28 := ⟨sourceData80.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree80 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 (.cutY 19456 .empty (.cutX 512 .empty (.cutY 19968 (.cutX 768 .empty (.cutY 19712 (.cutX 896 (.cutY 19584 .full .full) (.cutY 19584 (.cutX 960 (.cutY 19520 .full .full) (.cutY 19520 .full .full)) .full)) .empty)) .empty))) .empty)) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 (.cutY 31744 .empty (.cutX 12800 .empty (.cutY 32256 (.cutX 13056 .empty (.cutY 32000 (.cutX 13184 (.cutY 31872 .full .full) (.cutY 31872 (.cutX 13248 (.cutY 31808 .full .full) (.cutY 31808 .full .full)) .full)) .empty)) .empty))) .empty)) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 .empty (.cutY 1024 (.cutX 19968 (.cutY 512 .empty (.cutX 19712 (.cutY 768 .empty (.cutX 19584 (.cutY 896 .full (.cutX 19520 (.cutY 960 .full .full) (.cutY 960 .full .full))) (.cutY 896 .full .full))) .empty)) .empty) .empty)) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 .empty (.cutY 13312 (.cutX 32256 (.cutY 12800 .empty (.cutX 32000 (.cutY 13056 .empty (.cutX 31872 (.cutY 13184 .full (.cutX 31808 (.cutY 13248 .full .full) (.cutY 13248 .full .full))) (.cutY 13184 .full .full))) .empty)) .empty) .empty)) .empty)))))) .empty))

theorem metadata80 : 0<137362203 ∧ 3<128 ∧ 76<128 ∧ 1<4 ∧
    4611/4160=1 ∧ 4611%4160=451 ∧ ∀ i, (leaves80 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData80).mp
    (by decide +kernel)

theorem sourceChecked80_0 : ∀ i : Fin 28,
    (fun i => output80 i = raw80 (source80 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked80 : ∀ i : Fin 28, (fun i => output80 i = raw80 (source80 i)) i :=
  forallFin_of_zero_offset (fun i => output80 i = raw80 (source80 i)) sourceChecked80_0

theorem coverChecked80_0 : ∀ i : Fin 28,
    (fun i => (output80 (cover80 i)).ContainsBox (raw80 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked80 : ∀ i : Fin 28, (fun i => (output80 (cover80 i)).ContainsBox (raw80 i)) i :=
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

noncomputable def phaseMass80 : ℝ := singlePhaseMass (137362203/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw80 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass80_eq : phaseMass80 = (137362203/1638400000000 : ℝ) := by
  unfold phaseMass80
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw80 output80 cover80 source80
    (gridTreeUnionCheck_sound 32768 raw80 output80 cover80 source80 tree80 checked80)
    _ (by norm_num) _, areaUnits80]
  norm_num

-- Frozen phase 6791, atom 2169, type 0, source (19,98).
def leavesData81 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves81 : Fin 4 → DyadicLeaf := leavesData81.get
def raw81 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 19 98 leaves81 i
def outputData81 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨4864,4992,25088,25216⟩) (.single ⟨4864,4992,25216,25344⟩)) (.node (.single ⟨4992,5120,25088,25216⟩) (.single ⟨4992,5120,25216,25344⟩))) (.node (.node (.single ⟨7424,7552,27648,27776⟩) (.single ⟨7424,7552,27776,27904⟩)) (.node (.single ⟨7552,7680,27648,27776⟩) (.single ⟨7552,7680,27776,27904⟩)))) (.node (.node (.node (.single ⟨25088,25216,4864,4992⟩) (.single ⟨25088,25216,4992,5120⟩)) (.node (.single ⟨25216,25344,4864,4992⟩) (.single ⟨25216,25344,4992,5120⟩))) (.node (.node (.single ⟨27648,27776,7424,7552⟩) (.single ⟨27648,27776,7552,7680⟩)) (.node (.single ⟨27776,27904,7424,7552⟩) (.single ⟨27776,27904,7552,7680⟩)))))
def output81 : Fin 16 → GridBox := outputData81.get
def coverData81 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData81 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover81 (i : Fin 16) : Fin 16 := ⟨coverData81.get i % 16, Nat.mod_lt _ (by decide)⟩
def source81 (i : Fin 16) : Fin 16 := ⟨sourceData81.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree81 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 (.cutY 26624 (.cutX 5120 (.cutY 25600 (.cutX 4608 .empty (.cutY 25088 .empty (.cutX 4864 .empty (.cutY 25344 (.cutX 4992 (.cutY 25216 .full .full) (.cutY 25216 .full .full)) .empty)))) .empty) .empty) .empty) (.cutY 26624 .empty (.cutX 7168 .empty (.cutY 27648 .empty (.cutX 7680 (.cutY 28160 (.cutX 7424 .empty (.cutY 27904 (.cutX 7552 (.cutY 27776 .full .full) (.cutY 27776 .full .full)) .empty)) .empty) .empty))))) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 (.cutX 25600 (.cutY 5120 (.cutX 25088 .empty (.cutY 4608 .empty (.cutX 25344 (.cutY 4864 .empty (.cutX 25216 (.cutY 4992 .full .full) (.cutY 4992 .full .full))) .empty))) .empty) .empty) .empty) (.cutY 6144 .empty (.cutX 27648 .empty (.cutY 7168 .empty (.cutX 28160 (.cutY 7680 (.cutX 27904 (.cutY 7424 .empty (.cutX 27776 (.cutY 7552 .full .full) (.cutY 7552 .full .full))) .empty) .empty) .empty)))))) .empty) .empty)) .empty))

theorem metadata81 : 0<121837468 ∧ 19<128 ∧ 98<128 ∧ 0<4 ∧
    2169/4160=0 ∧ 2169%4160=2169 ∧ ∀ i, (leaves81 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData81).mp
    (by decide +kernel)

theorem sourceChecked81_0 : ∀ i : Fin 16,
    (fun i => output81 i = raw81 (source81 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked81 : ∀ i : Fin 16, (fun i => output81 i = raw81 (source81 i)) i :=
  forallFin_of_zero_offset (fun i => output81 i = raw81 (source81 i)) sourceChecked81_0

theorem coverChecked81_0 : ∀ i : Fin 16,
    (fun i => (output81 (cover81 i)).ContainsBox (raw81 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked81 : ∀ i : Fin 16, (fun i => (output81 (cover81 i)).ContainsBox (raw81 i)) i :=
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

noncomputable def phaseMass81 : ℝ := singlePhaseMass (121837468/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw81 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass81_eq : phaseMass81 = (30459367/409600000000 : ℝ) := by
  unfold phaseMass81
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw81 output81 cover81 source81
    (gridTreeUnionCheck_sound 32768 raw81 output81 cover81 source81 tree81 checked81)
    _ (by norm_num) _, areaUnits81]
  norm_num

-- Frozen phase 6792, atom 6909, type 1, source (26,97).
def leavesData82 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves82 : Fin 10 → DyadicLeaf := leavesData82.get
def raw82 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 26 97 leaves82 i
def outputData82 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨6656,6720,24832,24896⟩) (.single ⟨6656,6720,24896,24960⟩)) (.node (.single ⟨6720,6784,24832,24896⟩) (.node (.single ⟨6720,6784,24896,24960⟩) (.single ⟨6656,6784,24960,25088⟩)))) (.node (.node (.single ⟨6784,6848,24832,24896⟩) (.single ⟨6784,6848,24896,24960⟩)) (.node (.single ⟨6848,6912,24832,24896⟩) (.node (.single ⟨6848,6912,24896,24960⟩) (.single ⟨6784,6912,24960,25088⟩))))) (.node (.node (.node (.single ⟨7680,7808,25856,25984⟩) (.single ⟨7680,7808,25984,26112⟩)) (.node (.single ⟨7808,7872,25856,25920⟩) (.node (.single ⟨7808,7872,25920,25984⟩) (.single ⟨7872,7936,25856,25920⟩)))) (.node (.node (.single ⟨7872,7936,25920,25984⟩) (.single ⟨7808,7872,25984,26048⟩)) (.node (.single ⟨7808,7872,26048,26112⟩) (.node (.single ⟨7872,7936,25984,26048⟩) (.single ⟨7872,7936,26048,26112⟩)))))) (.node (.node (.node (.node (.single ⟨24832,24896,6656,6720⟩) (.single ⟨24832,24896,6720,6784⟩)) (.node (.single ⟨24896,24960,6656,6720⟩) (.node (.single ⟨24896,24960,6720,6784⟩) (.single ⟨24832,24896,6784,6848⟩)))) (.node (.node (.single ⟨24832,24896,6848,6912⟩) (.single ⟨24896,24960,6784,6848⟩)) (.node (.single ⟨24896,24960,6848,6912⟩) (.node (.single ⟨24960,25088,6656,6784⟩) (.single ⟨24960,25088,6784,6912⟩))))) (.node (.node (.node (.single ⟨25856,25984,7680,7808⟩) (.single ⟨25856,25920,7808,7872⟩)) (.node (.single ⟨25856,25920,7872,7936⟩) (.node (.single ⟨25920,25984,7808,7872⟩) (.single ⟨25920,25984,7872,7936⟩)))) (.node (.node (.single ⟨25984,26112,7680,7808⟩) (.single ⟨25984,26048,7808,7872⟩)) (.node (.single ⟨25984,26048,7872,7936⟩) (.node (.single ⟨26048,26112,7808,7872⟩) (.single ⟨26048,26112,7872,7936⟩)))))))
def output82 : Fin 40 → GridBox := outputData82.get
def coverData82 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData82 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover82 (i : Fin 40) : Fin 40 := ⟨coverData82.get i % 40, Nat.mod_lt _ (by decide)⟩
def source82 (i : Fin 40) : Fin 40 := ⟨sourceData82.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree82 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 .empty (.cutY 26624 (.cutX 7168 (.cutY 25600 (.cutX 6656 .empty (.cutY 25088 (.cutX 6912 (.cutY 24832 .empty (.cutX 6784 (.cutY 24960 (.cutX 6720 (.cutY 24896 .full .full) (.cutY 24896 .full .full)) .full) (.cutY 24960 (.cutX 6848 (.cutY 24896 .full .full) (.cutY 24896 .full .full)) .full))) .empty) .empty)) .empty) (.cutY 25600 .empty (.cutX 7680 .empty (.cutY 26112 (.cutX 7936 (.cutY 25856 .empty (.cutX 7808 (.cutY 25984 .full .full) (.cutY 25984 (.cutX 7872 (.cutY 25920 .full .full) (.cutY 25920 .full .full)) (.cutX 7872 (.cutY 26048 .full .full) (.cutY 26048 .full .full))))) .empty) .empty)))) .empty)) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 .empty (.cutX 25600 (.cutY 7168 (.cutX 25088 (.cutY 6656 .empty (.cutX 24832 .empty (.cutY 6912 (.cutX 24960 (.cutY 6784 (.cutX 24896 (.cutY 6720 .full .full) (.cutY 6720 .full .full)) (.cutX 24896 (.cutY 6848 .full .full) (.cutY 6848 .full .full))) (.cutY 6784 .full .full)) .empty))) .empty) .empty) (.cutY 7168 .empty (.cutX 26112 (.cutY 7680 .empty (.cutX 25856 .empty (.cutY 7936 (.cutX 25984 (.cutY 7808 .full (.cutX 25920 (.cutY 7872 .full .full) (.cutY 7872 .full .full))) (.cutY 7808 .full (.cutX 26048 (.cutY 7872 .full .full) (.cutY 7872 .full .full)))) .empty))) .empty)))) .empty)) .empty) .empty)) .empty))

theorem metadata82 : 0<48020332 ∧ 26<128 ∧ 97<128 ∧ 1<4 ∧
    6909/4160=1 ∧ 6909%4160=2749 ∧ ∀ i, (leaves82 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData82).mp
    (by decide +kernel)

theorem sourceChecked82_0 : ∀ i : Fin 40,
    (fun i => output82 i = raw82 (source82 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked82 : ∀ i : Fin 40, (fun i => output82 i = raw82 (source82 i)) i :=
  forallFin_of_zero_offset (fun i => output82 i = raw82 (source82 i)) sourceChecked82_0

theorem coverChecked82_0 : ∀ i : Fin 40,
    (fun i => (output82 (cover82 i)).ContainsBox (raw82 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked82 : ∀ i : Fin 40, (fun i => (output82 (cover82 i)).ContainsBox (raw82 i)) i :=
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

noncomputable def phaseMass82 : ℝ := singlePhaseMass (48020332/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw82 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass82_eq : phaseMass82 = (12005083/409600000000 : ℝ) := by
  unfold phaseMass82
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw82 output82 cover82 source82
    (gridTreeUnionCheck_sound 32768 raw82 output82 cover82 source82 tree82 checked82)
    _ (by norm_num) _, areaUnits82]
  norm_num

-- Frozen phase 6793, atom 6416, type 1, source (20,96).
def leavesData83 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves83 : Fin 7 → DyadicLeaf := leavesData83.get
def raw83 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 20 96 leaves83 i
def outputData83 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨5120,5248,24576,24704⟩) (.node (.single ⟨5120,5248,24704,24832⟩) (.single ⟨5248,5312,24576,24640⟩))) (.node (.node (.single ⟨5248,5312,24640,24704⟩) (.single ⟨5312,5376,24576,24640⟩)) (.node (.single ⟨5312,5376,24640,24704⟩) (.single ⟨5248,5376,24704,24832⟩)))) (.node (.node (.single ⟨7936,8064,27392,27520⟩) (.node (.single ⟨7936,8064,27520,27648⟩) (.single ⟨8064,8128,27392,27456⟩))) (.node (.node (.single ⟨8064,8128,27456,27520⟩) (.single ⟨8128,8192,27392,27456⟩)) (.node (.single ⟨8128,8192,27456,27520⟩) (.single ⟨8064,8192,27520,27648⟩))))) (.node (.node (.node (.single ⟨24576,24704,5120,5248⟩) (.node (.single ⟨24576,24640,5248,5312⟩) (.single ⟨24576,24640,5312,5376⟩))) (.node (.node (.single ⟨24640,24704,5248,5312⟩) (.single ⟨24640,24704,5312,5376⟩)) (.node (.single ⟨24704,24832,5120,5248⟩) (.single ⟨24704,24832,5248,5376⟩)))) (.node (.node (.single ⟨27392,27520,7936,8064⟩) (.node (.single ⟨27392,27456,8064,8128⟩) (.single ⟨27392,27456,8128,8192⟩))) (.node (.node (.single ⟨27456,27520,8064,8128⟩) (.single ⟨27456,27520,8128,8192⟩)) (.node (.single ⟨27520,27648,7936,8064⟩) (.single ⟨27520,27648,8064,8192⟩))))))
def output83 : Fin 28 → GridBox := outputData83.get
def coverData83 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData83 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover83 (i : Fin 28) : Fin 28 := ⟨coverData83.get i % 28, Nat.mod_lt _ (by decide)⟩
def source83 (i : Fin 28) : Fin 28 := ⟨sourceData83.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree83 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 (.cutY 26624 (.cutX 5120 .empty (.cutY 25600 (.cutX 5632 (.cutY 25088 (.cutX 5376 (.cutY 24832 (.cutX 5248 (.cutY 24704 .full .full) (.cutY 24704 (.cutX 5312 (.cutY 24640 .full .full) (.cutY 24640 .full .full)) .full)) .empty) .empty) .empty) .empty) .empty)) .empty) (.cutY 26624 .empty (.cutX 7168 .empty (.cutY 27648 (.cutX 7680 .empty (.cutY 27136 .empty (.cutX 7936 .empty (.cutY 27392 .empty (.cutX 8064 (.cutY 27520 .full .full) (.cutY 27520 (.cutX 8128 (.cutY 27456 .full .full) (.cutY 27456 .full .full)) .full)))))) .empty)))) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 (.cutX 25600 (.cutY 5120 .empty (.cutX 25088 (.cutY 5632 (.cutX 24832 (.cutY 5376 (.cutX 24704 (.cutY 5248 .full (.cutX 24640 (.cutY 5312 .full .full) (.cutY 5312 .full .full))) (.cutY 5248 .full .full)) .empty) .empty) .empty) .empty)) .empty) .empty) (.cutY 6144 .empty (.cutX 27648 (.cutY 7168 .empty (.cutX 27136 .empty (.cutY 7680 .empty (.cutX 27392 .empty (.cutY 7936 .empty (.cutX 27520 (.cutY 8064 .full (.cutX 27456 (.cutY 8128 .full .full) (.cutY 8128 .full .full))) (.cutY 8064 .full .full))))))) .empty)))) .empty) .empty)) .empty))

theorem metadata83 : 0<151956162 ∧ 20<128 ∧ 96<128 ∧ 1<4 ∧
    6416/4160=1 ∧ 6416%4160=2256 ∧ ∀ i, (leaves83 i).Valid 8 := by
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

noncomputable def phaseMass83 : ℝ := singlePhaseMass (151956162/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw83 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass83_eq : phaseMass83 = (75978081/819200000000 : ℝ) := by
  unfold phaseMass83
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw83 output83 cover83 source83
    (gridTreeUnionCheck_sound 32768 raw83 output83 cover83 source83 tree83 checked83)
    _ (by norm_num) _, areaUnits83]
  norm_num

-- Frozen phase 6794, atom 927, type 0, source (7,80).
def leavesData84 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves84 : Fin 7 → DyadicLeaf := leavesData84.get
def raw84 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 7 80 leaves84 i
def outputData84 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨1792,1920,20480,20608⟩) (.node (.single ⟨1792,1920,20608,20736⟩) (.single ⟨1920,1984,20480,20544⟩))) (.node (.node (.single ⟨1920,1984,20544,20608⟩) (.single ⟨1984,2048,20480,20544⟩)) (.node (.single ⟨1984,2048,20544,20608⟩) (.single ⟨1920,2048,20608,20736⟩)))) (.node (.node (.single ⟨12032,12160,30720,30848⟩) (.node (.single ⟨12032,12160,30848,30976⟩) (.single ⟨12160,12224,30720,30784⟩))) (.node (.node (.single ⟨12160,12224,30784,30848⟩) (.single ⟨12224,12288,30720,30784⟩)) (.node (.single ⟨12224,12288,30784,30848⟩) (.single ⟨12160,12288,30848,30976⟩))))) (.node (.node (.node (.single ⟨20480,20608,1792,1920⟩) (.node (.single ⟨20480,20544,1920,1984⟩) (.single ⟨20480,20544,1984,2048⟩))) (.node (.node (.single ⟨20544,20608,1920,1984⟩) (.single ⟨20544,20608,1984,2048⟩)) (.node (.single ⟨20608,20736,1792,1920⟩) (.single ⟨20608,20736,1920,2048⟩)))) (.node (.node (.single ⟨30720,30848,12032,12160⟩) (.node (.single ⟨30720,30784,12160,12224⟩) (.single ⟨30720,30784,12224,12288⟩))) (.node (.node (.single ⟨30784,30848,12160,12224⟩) (.single ⟨30784,30848,12224,12288⟩)) (.node (.single ⟨30848,30976,12032,12160⟩) (.single ⟨30848,30976,12160,12288⟩))))))
def output84 : Fin 28 → GridBox := outputData84.get
def coverData84 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData84 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover84 (i : Fin 28) : Fin 28 := ⟨coverData84.get i % 28, Nat.mod_lt _ (by decide)⟩
def source84 (i : Fin 28) : Fin 28 := ⟨sourceData84.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree84 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 (.cutY 22528 (.cutX 1024 .empty (.cutY 21504 (.cutX 1536 .empty (.cutY 20992 (.cutX 1792 .empty (.cutY 20736 (.cutX 1920 (.cutY 20608 .full .full) (.cutY 20608 (.cutX 1984 (.cutY 20544 .full .full) (.cutY 20544 .full .full)) .full)) .empty)) .empty)) .empty)) .empty) .empty)) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 .empty (.cutX 11264 .empty (.cutY 31744 (.cutX 11776 .empty (.cutY 31232 (.cutX 12032 .empty (.cutY 30976 (.cutX 12160 (.cutY 30848 .full .full) (.cutY 30848 (.cutX 12224 (.cutY 30784 .full .full) (.cutY 30784 .full .full)) .full)) .empty)) .empty)) .empty))))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 (.cutX 21504 (.cutY 1024 .empty (.cutX 20992 (.cutY 1536 .empty (.cutX 20736 (.cutY 1792 .empty (.cutX 20608 (.cutY 1920 .full (.cutX 20544 (.cutY 1984 .full .full) (.cutY 1984 .full .full))) (.cutY 1920 .full .full))) .empty)) .empty)) .empty) .empty) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 .empty (.cutY 10240 .empty (.cutX 31744 (.cutY 11264 .empty (.cutX 31232 (.cutY 11776 .empty (.cutX 30976 (.cutY 12032 .empty (.cutX 30848 (.cutY 12160 .full (.cutX 30784 (.cutY 12224 .full .full) (.cutY 12224 .full .full))) (.cutY 12160 .full .full))) .empty)) .empty)) .empty))) .empty)))) .empty))

theorem metadata84 : 0<25614016 ∧ 7<128 ∧ 80<128 ∧ 0<4 ∧
    927/4160=0 ∧ 927%4160=927 ∧ ∀ i, (leaves84 i).Valid 8 := by
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

noncomputable def phaseMass84 : ℝ := singlePhaseMass (25614016/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw84 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass84_eq : phaseMass84 = (400219/25600000000 : ℝ) := by
  unfold phaseMass84
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw84 output84 cover84 source84
    (gridTreeUnionCheck_sound 32768 raw84 output84 cover84 source84 tree84 checked84)
    _ (by norm_num) _, areaUnits84]
  norm_num

-- Frozen phase 6795, atom 5529, type 1, source (11,82).
def leavesData85 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves85 : Fin 7 → DyadicLeaf := leavesData85.get
def raw85 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 11 82 leaves85 i
def outputData85 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨2816,2944,20992,21120⟩) (.node (.single ⟨2816,2944,21120,21248⟩) (.single ⟨2944,3008,20992,21056⟩))) (.node (.node (.single ⟨2944,3008,21056,21120⟩) (.single ⟨3008,3072,20992,21056⟩)) (.node (.single ⟨3008,3072,21056,21120⟩) (.single ⟨2944,3072,21120,21248⟩)))) (.node (.node (.single ⟨11520,11648,29696,29824⟩) (.node (.single ⟨11520,11648,29824,29952⟩) (.single ⟨11648,11712,29696,29760⟩))) (.node (.node (.single ⟨11648,11712,29760,29824⟩) (.single ⟨11712,11776,29696,29760⟩)) (.node (.single ⟨11712,11776,29760,29824⟩) (.single ⟨11648,11776,29824,29952⟩))))) (.node (.node (.node (.single ⟨20992,21120,2816,2944⟩) (.node (.single ⟨20992,21056,2944,3008⟩) (.single ⟨20992,21056,3008,3072⟩))) (.node (.node (.single ⟨21056,21120,2944,3008⟩) (.single ⟨21056,21120,3008,3072⟩)) (.node (.single ⟨21120,21248,2816,2944⟩) (.single ⟨21120,21248,2944,3072⟩)))) (.node (.node (.single ⟨29696,29824,11520,11648⟩) (.node (.single ⟨29696,29760,11648,11712⟩) (.single ⟨29696,29760,11712,11776⟩))) (.node (.node (.single ⟨29760,29824,11648,11712⟩) (.single ⟨29760,29824,11712,11776⟩)) (.node (.single ⟨29824,29952,11520,11648⟩) (.single ⟨29824,29952,11648,11776⟩))))))
def output85 : Fin 28 → GridBox := outputData85.get
def coverData85 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData85 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover85 (i : Fin 28) : Fin 28 := ⟨coverData85.get i % 28, Nat.mod_lt _ (by decide)⟩
def source85 (i : Fin 28) : Fin 28 := ⟨sourceData85.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree85 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 (.cutY 21504 (.cutX 2560 .empty (.cutY 20992 .empty (.cutX 2816 .empty (.cutY 21248 (.cutX 2944 (.cutY 21120 .full .full) (.cutY 21120 (.cutX 3008 (.cutY 21056 .full .full) (.cutY 21056 .full .full)) .full)) .empty)))) .empty) .empty) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 .empty (.cutY 29696 .empty (.cutX 11776 (.cutY 30208 (.cutX 11520 .empty (.cutY 29952 (.cutX 11648 (.cutY 29824 .full .full) (.cutY 29824 (.cutX 11712 (.cutY 29760 .full .full) (.cutY 29760 .full .full)) .full)) .empty)) .empty) .empty))) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 (.cutY 3072 (.cutX 20992 .empty (.cutY 2560 .empty (.cutX 21248 (.cutY 2816 .empty (.cutX 21120 (.cutY 2944 .full (.cutX 21056 (.cutY 3008 .full .full) (.cutY 3008 .full .full))) (.cutY 2944 .full .full))) .empty))) .empty) .empty)) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 .empty (.cutY 11264 .empty (.cutX 30208 (.cutY 11776 (.cutX 29952 (.cutY 11520 .empty (.cutX 29824 (.cutY 11648 .full (.cutX 29760 (.cutY 11712 .full .full) (.cutY 11712 .full .full))) (.cutY 11648 .full .full))) .empty) .empty) .empty)))) .empty) .empty)))) .empty))

theorem metadata85 : 0<139307719 ∧ 11<128 ∧ 82<128 ∧ 1<4 ∧
    5529/4160=1 ∧ 5529%4160=1369 ∧ ∀ i, (leaves85 i).Valid 8 := by
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

noncomputable def phaseMass85 : ℝ := singlePhaseMass (139307719/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw85 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass85_eq : phaseMass85 = (139307719/1638400000000 : ℝ) := by
  unfold phaseMass85
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw85 output85 cover85 source85
    (gridTreeUnionCheck_sound 32768 raw85 output85 cover85 source85 tree85 checked85)
    _ (by norm_num) _, areaUnits85]
  norm_num

-- Frozen phase 6796, atom 1041, type 0, source (8,81).
def leavesData86 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves86 : Fin 7 → DyadicLeaf := leavesData86.get
def raw86 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 8 81 leaves86 i
def outputData86 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨2048,2176,20736,20864⟩) (.node (.single ⟨2048,2176,20864,20992⟩) (.single ⟨2176,2240,20736,20800⟩))) (.node (.node (.single ⟨2176,2240,20800,20864⟩) (.single ⟨2240,2304,20736,20800⟩)) (.node (.single ⟨2240,2304,20800,20864⟩) (.single ⟨2176,2304,20864,20992⟩)))) (.node (.node (.single ⟨11776,11904,30464,30592⟩) (.node (.single ⟨11776,11904,30592,30720⟩) (.single ⟨11904,11968,30464,30528⟩))) (.node (.node (.single ⟨11904,11968,30528,30592⟩) (.single ⟨11968,12032,30464,30528⟩)) (.node (.single ⟨11968,12032,30528,30592⟩) (.single ⟨11904,12032,30592,30720⟩))))) (.node (.node (.node (.single ⟨20736,20864,2048,2176⟩) (.node (.single ⟨20736,20800,2176,2240⟩) (.single ⟨20736,20800,2240,2304⟩))) (.node (.node (.single ⟨20800,20864,2176,2240⟩) (.single ⟨20800,20864,2240,2304⟩)) (.node (.single ⟨20864,20992,2048,2176⟩) (.single ⟨20864,20992,2176,2304⟩)))) (.node (.node (.single ⟨30464,30592,11776,11904⟩) (.node (.single ⟨30464,30528,11904,11968⟩) (.single ⟨30464,30528,11968,12032⟩))) (.node (.node (.single ⟨30528,30592,11904,11968⟩) (.single ⟨30528,30592,11968,12032⟩)) (.node (.single ⟨30592,30720,11776,11904⟩) (.single ⟨30592,30720,11904,12032⟩))))))
def output86 : Fin 28 → GridBox := outputData86.get
def coverData86 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData86 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover86 (i : Fin 28) : Fin 28 := ⟨coverData86.get i % 28, Nat.mod_lt _ (by decide)⟩
def source86 (i : Fin 28) : Fin 28 := ⟨sourceData86.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree86 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 (.cutY 21504 (.cutX 2560 (.cutY 20992 (.cutX 2304 (.cutY 20736 .empty (.cutX 2176 (.cutY 20864 .full .full) (.cutY 20864 (.cutX 2240 (.cutY 20800 .full .full) (.cutY 20800 .full .full)) .full))) .empty) .empty) .empty) .empty) .empty) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 .empty (.cutY 29696 .empty (.cutX 11776 .empty (.cutY 30208 .empty (.cutX 12032 (.cutY 30464 .empty (.cutX 11904 (.cutY 30592 .full .full) (.cutY 30592 (.cutX 11968 (.cutY 30528 .full .full) (.cutY 30528 .full .full)) .full))) .empty))))) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 (.cutY 3072 (.cutX 20992 (.cutY 2560 (.cutX 20736 .empty (.cutY 2304 (.cutX 20864 (.cutY 2176 .full (.cutX 20800 (.cutY 2240 .full .full) (.cutY 2240 .full .full))) (.cutY 2176 .full .full)) .empty)) .empty) .empty) .empty) .empty)) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 .empty (.cutY 11264 .empty (.cutX 30208 .empty (.cutY 11776 .empty (.cutX 30464 .empty (.cutY 12032 (.cutX 30592 (.cutY 11904 .full (.cutX 30528 (.cutY 11968 .full .full) (.cutY 11968 .full .full))) (.cutY 11904 .full .full)) .empty))))))) .empty) .empty)))) .empty))

theorem metadata86 : 0<72090291 ∧ 8<128 ∧ 81<128 ∧ 0<4 ∧
    1041/4160=0 ∧ 1041%4160=1041 ∧ ∀ i, (leaves86 i).Valid 8 := by
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

noncomputable def phaseMass86 : ℝ := singlePhaseMass (72090291/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw86 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass86_eq : phaseMass86 = (72090291/1638400000000 : ℝ) := by
  unfold phaseMass86
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw86 output86 cover86 source86
    (gridTreeUnionCheck_sound 32768 raw86 output86 cover86 source86 tree86 checked86)
    _ (by norm_num) _, areaUnits86]
  norm_num

-- Frozen phase 6797, atom 5311, type 1, source (9,80).
def leavesData87 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves87 : Fin 4 → DyadicLeaf := leavesData87.get
def raw87 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 9 80 leaves87 i
def outputData87 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨2304,2432,20480,20608⟩) (.single ⟨2304,2432,20608,20736⟩)) (.node (.single ⟨2432,2560,20480,20608⟩) (.single ⟨2432,2560,20608,20736⟩))) (.node (.node (.single ⟨12032,12160,30208,30336⟩) (.single ⟨12032,12160,30336,30464⟩)) (.node (.single ⟨12160,12288,30208,30336⟩) (.single ⟨12160,12288,30336,30464⟩)))) (.node (.node (.node (.single ⟨20480,20608,2304,2432⟩) (.single ⟨20480,20608,2432,2560⟩)) (.node (.single ⟨20608,20736,2304,2432⟩) (.single ⟨20608,20736,2432,2560⟩))) (.node (.node (.single ⟨30208,30336,12032,12160⟩) (.single ⟨30208,30336,12160,12288⟩)) (.node (.single ⟨30336,30464,12032,12160⟩) (.single ⟨30336,30464,12160,12288⟩)))))
def output87 : Fin 16 → GridBox := outputData87.get
def coverData87 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData87 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover87 (i : Fin 16) : Fin 16 := ⟨coverData87.get i % 16, Nat.mod_lt _ (by decide)⟩
def source87 (i : Fin 16) : Fin 16 := ⟨sourceData87.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree87 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 (.cutY 21504 (.cutX 2560 (.cutY 20992 (.cutX 2304 .empty (.cutY 20736 (.cutX 2432 (.cutY 20608 .full .full) (.cutY 20608 .full .full)) .empty)) .empty) .empty) .empty) .empty) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 .empty (.cutY 29696 .empty (.cutX 11776 .empty (.cutY 30208 .empty (.cutX 12032 .empty (.cutY 30464 (.cutX 12160 (.cutY 30336 .full .full) (.cutY 30336 .full .full)) .empty)))))) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 (.cutY 3072 (.cutX 20992 (.cutY 2560 (.cutX 20736 (.cutY 2304 .empty (.cutX 20608 (.cutY 2432 .full .full) (.cutY 2432 .full .full))) .empty) .empty) .empty) .empty) .empty)) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 .empty (.cutY 11264 .empty (.cutX 30208 .empty (.cutY 11776 .empty (.cutX 30464 (.cutY 12032 .empty (.cutX 30336 (.cutY 12160 .full .full) (.cutY 12160 .full .full))) .empty)))))) .empty) .empty)))) .empty))

theorem metadata87 : 0<139307719 ∧ 9<128 ∧ 80<128 ∧ 1<4 ∧
    5311/4160=1 ∧ 5311%4160=1151 ∧ ∀ i, (leaves87 i).Valid 8 := by
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

noncomputable def phaseMass87 : ℝ := singlePhaseMass (139307719/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw87 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass87_eq : phaseMass87 = (139307719/1638400000000 : ℝ) := by
  unfold phaseMass87
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw87 output87 cover87 source87
    (gridTreeUnionCheck_sound 32768 raw87 output87 cover87 source87 tree87 checked87)
    _ (by norm_num) _, areaUnits87]
  norm_num

-- Frozen phase 6798, atom 4970, type 1, source (6,78).
def leavesData88 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves88 : Fin 4 → DyadicLeaf := leavesData88.get
def raw88 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 6 78 leaves88 i
def outputData88 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨1536,1664,19968,20096⟩) (.single ⟨1536,1664,20096,20224⟩)) (.node (.single ⟨1664,1792,19968,20096⟩) (.single ⟨1664,1792,20096,20224⟩))) (.node (.node (.single ⟨12544,12672,30976,31104⟩) (.single ⟨12544,12672,31104,31232⟩)) (.node (.single ⟨12672,12800,30976,31104⟩) (.single ⟨12672,12800,31104,31232⟩)))) (.node (.node (.node (.single ⟨19968,20096,1536,1664⟩) (.single ⟨19968,20096,1664,1792⟩)) (.node (.single ⟨20096,20224,1536,1664⟩) (.single ⟨20096,20224,1664,1792⟩))) (.node (.node (.single ⟨30976,31104,12544,12672⟩) (.single ⟨30976,31104,12672,12800⟩)) (.node (.single ⟨31104,31232,12544,12672⟩) (.single ⟨31104,31232,12672,12800⟩)))))
def output88 : Fin 16 → GridBox := outputData88.get
def coverData88 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData88 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover88 (i : Fin 16) : Fin 16 := ⟨coverData88.get i % 16, Nat.mod_lt _ (by decide)⟩
def source88 (i : Fin 16) : Fin 16 := ⟨sourceData88.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree88 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 .empty (.cutY 19456 .empty (.cutX 1536 .empty (.cutY 19968 .empty (.cutX 1792 (.cutY 20224 (.cutX 1664 (.cutY 20096 .full .full) (.cutY 20096 .full .full)) .empty) .empty)))))) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 (.cutY 31744 (.cutX 12800 (.cutY 31232 (.cutX 12544 .empty (.cutY 30976 .empty (.cutX 12672 (.cutY 31104 .full .full) (.cutY 31104 .full .full)))) .empty) .empty) .empty) .empty)) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 .empty (.cutY 1024 .empty (.cutX 19968 .empty (.cutY 1536 .empty (.cutX 20224 (.cutY 1792 (.cutX 20096 (.cutY 1664 .full .full) (.cutY 1664 .full .full)) .empty) .empty))))) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 (.cutY 13312 (.cutX 31232 (.cutY 12800 (.cutX 30976 .empty (.cutY 12544 .empty (.cutX 31104 (.cutY 12672 .full .full) (.cutY 12672 .full .full)))) .empty) .empty) .empty) .empty) .empty)))))) .empty))

theorem metadata88 : 0<137362203 ∧ 6<128 ∧ 78<128 ∧ 1<4 ∧
    4970/4160=1 ∧ 4970%4160=810 ∧ ∀ i, (leaves88 i).Valid 8 := by
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

noncomputable def phaseMass88 : ℝ := singlePhaseMass (137362203/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw88 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass88_eq : phaseMass88 = (137362203/1638400000000 : ℝ) := by
  unfold phaseMass88
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw88 output88 cover88 source88
    (gridTreeUnionCheck_sound 32768 raw88 output88 cover88 source88 tree88 checked88)
    _ (by norm_num) _, areaUnits88]
  norm_num

-- Frozen phase 6799, atom 5199, type 1, source (8,79).
def leavesData89 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves89 : Fin 4 → DyadicLeaf := leavesData89.get
def raw89 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 8 79 leaves89 i
def outputData89 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨2048,2176,20224,20352⟩) (.single ⟨2048,2176,20352,20480⟩)) (.node (.single ⟨2176,2304,20224,20352⟩) (.single ⟨2176,2304,20352,20480⟩))) (.node (.node (.single ⟨12288,12416,30464,30592⟩) (.single ⟨12288,12416,30592,30720⟩)) (.node (.single ⟨12416,12544,30464,30592⟩) (.single ⟨12416,12544,30592,30720⟩)))) (.node (.node (.node (.single ⟨20224,20352,2048,2176⟩) (.single ⟨20224,20352,2176,2304⟩)) (.node (.single ⟨20352,20480,2048,2176⟩) (.single ⟨20352,20480,2176,2304⟩))) (.node (.node (.single ⟨30464,30592,12288,12416⟩) (.single ⟨30464,30592,12416,12544⟩)) (.node (.single ⟨30592,30720,12288,12416⟩) (.single ⟨30592,30720,12416,12544⟩)))))
def output89 : Fin 16 → GridBox := outputData89.get
def coverData89 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData89 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover89 (i : Fin 16) : Fin 16 := ⟨coverData89.get i % 16, Nat.mod_lt _ (by decide)⟩
def source89 (i : Fin 16) : Fin 16 := ⟨sourceData89.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree89 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 (.cutY 19456 .empty (.cutX 2560 (.cutY 19968 .empty (.cutX 2304 (.cutY 20224 .empty (.cutX 2176 (.cutY 20352 .full .full) (.cutY 20352 .full .full))) .empty)) .empty)) .empty))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 (.cutY 29696 .empty (.cutX 12800 (.cutY 30208 .empty (.cutX 12544 (.cutY 30464 .empty (.cutX 12416 (.cutY 30592 .full .full) (.cutY 30592 .full .full))) .empty)) .empty)) .empty) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 .empty (.cutY 3072 (.cutX 19968 .empty (.cutY 2560 (.cutX 20224 .empty (.cutY 2304 (.cutX 20352 (.cutY 2176 .full .full) (.cutY 2176 .full .full)) .empty)) .empty)) .empty)))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 .empty (.cutY 13312 (.cutX 30208 .empty (.cutY 12800 (.cutX 30464 .empty (.cutY 12544 (.cutX 30592 (.cutY 12416 .full .full) (.cutY 12416 .full .full)) .empty)) .empty)) .empty)) .empty) .empty))))) .empty))

theorem metadata89 : 0<94387549 ∧ 8<128 ∧ 79<128 ∧ 1<4 ∧
    5199/4160=1 ∧ 5199%4160=1039 ∧ ∀ i, (leaves89 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData89).mp
    (by decide +kernel)

theorem sourceChecked89_0 : ∀ i : Fin 16,
    (fun i => output89 i = raw89 (source89 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked89 : ∀ i : Fin 16, (fun i => output89 i = raw89 (source89 i)) i :=
  forallFin_of_zero_offset (fun i => output89 i = raw89 (source89 i)) sourceChecked89_0

theorem coverChecked89_0 : ∀ i : Fin 16,
    (fun i => (output89 (cover89 i)).ContainsBox (raw89 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked89 : ∀ i : Fin 16, (fun i => (output89 (cover89 i)).ContainsBox (raw89 i)) i :=
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

noncomputable def phaseMass89 : ℝ := singlePhaseMass (94387549/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw89 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass89_eq : phaseMass89 = (94387549/1638400000000 : ℝ) := by
  unfold phaseMass89
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw89 output89 cover89 source89
    (gridTreeUnionCheck_sound 32768 raw89 output89 cover89 source89 tree89 checked89)
    _ (by norm_num) _, areaUnits89]
  norm_num

-- Frozen phase 6800, atom 574, type 0, source (4,78).
def leavesData90 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves90 : Fin 7 → DyadicLeaf := leavesData90.get
def raw90 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 4 78 leaves90 i
def outputData90 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨1024,1152,19968,20096⟩) (.node (.single ⟨1024,1152,20096,20224⟩) (.single ⟨1152,1216,19968,20032⟩))) (.node (.node (.single ⟨1152,1216,20032,20096⟩) (.single ⟨1216,1280,19968,20032⟩)) (.node (.single ⟨1216,1280,20032,20096⟩) (.single ⟨1152,1280,20096,20224⟩)))) (.node (.node (.single ⟨12544,12672,31488,31616⟩) (.node (.single ⟨12544,12672,31616,31744⟩) (.single ⟨12672,12736,31488,31552⟩))) (.node (.node (.single ⟨12672,12736,31552,31616⟩) (.single ⟨12736,12800,31488,31552⟩)) (.node (.single ⟨12736,12800,31552,31616⟩) (.single ⟨12672,12800,31616,31744⟩))))) (.node (.node (.node (.single ⟨19968,20096,1024,1152⟩) (.node (.single ⟨19968,20032,1152,1216⟩) (.single ⟨19968,20032,1216,1280⟩))) (.node (.node (.single ⟨20032,20096,1152,1216⟩) (.single ⟨20032,20096,1216,1280⟩)) (.node (.single ⟨20096,20224,1024,1152⟩) (.single ⟨20096,20224,1152,1280⟩)))) (.node (.node (.single ⟨31488,31616,12544,12672⟩) (.node (.single ⟨31488,31552,12672,12736⟩) (.single ⟨31488,31552,12736,12800⟩))) (.node (.node (.single ⟨31552,31616,12672,12736⟩) (.single ⟨31552,31616,12736,12800⟩)) (.node (.single ⟨31616,31744,12544,12672⟩) (.single ⟨31616,31744,12672,12800⟩))))))
def output90 : Fin 28 → GridBox := outputData90.get
def coverData90 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData90 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover90 (i : Fin 28) : Fin 28 := ⟨coverData90.get i % 28, Nat.mod_lt _ (by decide)⟩
def source90 (i : Fin 28) : Fin 28 := ⟨sourceData90.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree90 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 .empty (.cutY 19456 .empty (.cutX 1536 (.cutY 19968 .empty (.cutX 1280 (.cutY 20224 (.cutX 1152 (.cutY 20096 .full .full) (.cutY 20096 (.cutX 1216 (.cutY 20032 .full .full) (.cutY 20032 .full .full)) .full)) .empty) .empty)) .empty)))) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 (.cutY 31744 (.cutX 12800 (.cutY 31232 .empty (.cutX 12544 .empty (.cutY 31488 .empty (.cutX 12672 (.cutY 31616 .full .full) (.cutY 31616 (.cutX 12736 (.cutY 31552 .full .full) (.cutY 31552 .full .full)) .full))))) .empty) .empty) .empty)) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 .empty (.cutY 1024 .empty (.cutX 19968 .empty (.cutY 1536 (.cutX 20224 (.cutY 1280 (.cutX 20096 (.cutY 1152 .full (.cutX 20032 (.cutY 1216 .full .full) (.cutY 1216 .full .full))) (.cutY 1152 .full .full)) .empty) .empty) .empty)))) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 (.cutY 13312 (.cutX 31232 .empty (.cutY 12800 (.cutX 31488 .empty (.cutY 12544 .empty (.cutX 31616 (.cutY 12672 .full (.cutX 31552 (.cutY 12736 .full .full) (.cutY 12736 .full .full))) (.cutY 12672 .full .full)))) .empty)) .empty) .empty) .empty)))))) .empty))

theorem metadata90 : 0<34183877 ∧ 4<128 ∧ 78<128 ∧ 0<4 ∧
    574/4160=0 ∧ 574%4160=574 ∧ ∀ i, (leaves90 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData90).mp
    (by decide +kernel)

theorem sourceChecked90_0 : ∀ i : Fin 28,
    (fun i => output90 i = raw90 (source90 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked90 : ∀ i : Fin 28, (fun i => output90 i = raw90 (source90 i)) i :=
  forallFin_of_zero_offset (fun i => output90 i = raw90 (source90 i)) sourceChecked90_0

theorem coverChecked90_0 : ∀ i : Fin 28,
    (fun i => (output90 (cover90 i)).ContainsBox (raw90 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked90 : ∀ i : Fin 28, (fun i => (output90 (cover90 i)).ContainsBox (raw90 i)) i :=
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

noncomputable def phaseMass90 : ℝ := singlePhaseMass (34183877/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw90 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass90_eq : phaseMass90 = (34183877/1638400000000 : ℝ) := by
  unfold phaseMass90
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw90 output90 cover90 source90
    (gridTreeUnionCheck_sound 32768 raw90 output90 cover90 source90 tree90 checked90)
    _ (by norm_num) _, areaUnits90]
  norm_num

-- Frozen phase 6801, atom 203, type 0, source (1,76).
def leavesData91 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩)))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩)))))
def leaves91 : Fin 10 → DyadicLeaf := leavesData91.get
def raw91 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 1 76 leaves91 i
def outputData91 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨256,320,19456,19520⟩) (.single ⟨256,320,19520,19584⟩)) (.node (.single ⟨320,384,19456,19520⟩) (.node (.single ⟨320,384,19520,19584⟩) (.single ⟨256,384,19584,19712⟩)))) (.node (.node (.single ⟨384,448,19456,19520⟩) (.single ⟨384,448,19520,19584⟩)) (.node (.single ⟨448,512,19456,19520⟩) (.node (.single ⟨448,512,19520,19584⟩) (.single ⟨384,512,19584,19712⟩))))) (.node (.node (.node (.single ⟨13056,13184,32256,32384⟩) (.single ⟨13056,13184,32384,32512⟩)) (.node (.single ⟨13184,13248,32256,32320⟩) (.node (.single ⟨13184,13248,32320,32384⟩) (.single ⟨13248,13312,32256,32320⟩)))) (.node (.node (.single ⟨13248,13312,32320,32384⟩) (.single ⟨13184,13248,32384,32448⟩)) (.node (.single ⟨13184,13248,32448,32512⟩) (.node (.single ⟨13248,13312,32384,32448⟩) (.single ⟨13248,13312,32448,32512⟩)))))) (.node (.node (.node (.node (.single ⟨19456,19520,256,320⟩) (.single ⟨19456,19520,320,384⟩)) (.node (.single ⟨19520,19584,256,320⟩) (.node (.single ⟨19520,19584,320,384⟩) (.single ⟨19456,19520,384,448⟩)))) (.node (.node (.single ⟨19456,19520,448,512⟩) (.single ⟨19520,19584,384,448⟩)) (.node (.single ⟨19520,19584,448,512⟩) (.node (.single ⟨19584,19712,256,384⟩) (.single ⟨19584,19712,384,512⟩))))) (.node (.node (.node (.single ⟨32256,32384,13056,13184⟩) (.single ⟨32256,32320,13184,13248⟩)) (.node (.single ⟨32256,32320,13248,13312⟩) (.node (.single ⟨32320,32384,13184,13248⟩) (.single ⟨32320,32384,13248,13312⟩)))) (.node (.node (.single ⟨32384,32512,13056,13184⟩) (.single ⟨32384,32448,13184,13248⟩)) (.node (.single ⟨32384,32448,13248,13312⟩) (.node (.single ⟨32448,32512,13184,13248⟩) (.single ⟨32448,32512,13248,13312⟩)))))))
def output91 : Fin 40 → GridBox := outputData91.get
def coverData91 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 0) (.single 20))))) (.node (.node (.node (.single 39) (.single 19)) (.node (.single 1) (.node (.single 22) (.single 38)))) (.node (.node (.single 17) (.single 2)) (.node (.single 21) (.node (.single 37) (.single 18)))))) (.node (.node (.node (.node (.single 3) (.single 23)) (.node (.single 36) (.node (.single 16) (.single 5)))) (.node (.node (.single 24) (.single 34)) (.node (.single 15) (.node (.single 6) (.single 26))))) (.node (.node (.node (.single 33) (.single 13)) (.node (.single 7) (.node (.single 25) (.single 32)))) (.node (.node (.single 14) (.single 8)) (.node (.single 27) (.node (.single 31) (.single 12)))))))
def sourceData91 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 0)))) (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 39) (.node (.single 31) (.single 35)))) (.node (.node (.single 27) (.single 23)) (.node (.single 15) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.node (.single 21) (.single 25)))) (.node (.node (.single 33) (.single 29)) (.node (.single 37) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))) (.node (.node (.single 2) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))))))
def cover91 (i : Fin 40) : Fin 40 := ⟨coverData91.get i % 40, Nat.mod_lt _ (by decide)⟩
def source91 (i : Fin 40) : Fin 40 := ⟨sourceData91.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree91 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 (.cutY 19456 .empty (.cutX 512 (.cutY 19968 (.cutX 256 .empty (.cutY 19712 (.cutX 384 (.cutY 19584 (.cutX 320 (.cutY 19520 .full .full) (.cutY 19520 .full .full)) .full) (.cutY 19584 (.cutX 448 (.cutY 19520 .full .full) (.cutY 19520 .full .full)) .full)) .empty)) .empty) .empty)) .empty)) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 (.cutY 31744 .empty (.cutX 12800 .empty (.cutY 32256 .empty (.cutX 13056 .empty (.cutY 32512 (.cutX 13184 (.cutY 32384 .full .full) (.cutY 32384 (.cutX 13248 (.cutY 32320 .full .full) (.cutY 32320 .full .full)) (.cutX 13248 (.cutY 32448 .full .full) (.cutY 32448 .full .full)))) .empty))))) .empty)) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 .empty (.cutY 1024 (.cutX 19968 (.cutY 512 (.cutX 19712 (.cutY 256 .empty (.cutX 19584 (.cutY 384 (.cutX 19520 (.cutY 320 .full .full) (.cutY 320 .full .full)) (.cutX 19520 (.cutY 448 .full .full) (.cutY 448 .full .full))) (.cutY 384 .full .full))) .empty) .empty) .empty) .empty)) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 .empty (.cutY 13312 (.cutX 32256 .empty (.cutY 12800 .empty (.cutX 32512 (.cutY 13056 .empty (.cutX 32384 (.cutY 13184 .full (.cutX 32320 (.cutY 13248 .full .full) (.cutY 13248 .full .full))) (.cutY 13184 .full (.cutX 32448 (.cutY 13248 .full .full) (.cutY 13248 .full .full))))) .empty))) .empty)) .empty)))))) .empty))

theorem metadata91 : 0<34183877 ∧ 1<128 ∧ 76<128 ∧ 0<4 ∧
    203/4160=0 ∧ 203%4160=203 ∧ ∀ i, (leaves91 i).Valid 8 := by
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

noncomputable def phaseMass91 : ℝ := singlePhaseMass (34183877/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw91 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass91_eq : phaseMass91 = (34183877/1638400000000 : ℝ) := by
  unfold phaseMass91
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw91 output91 cover91 source91
    (gridTreeUnionCheck_sound 32768 raw91 output91 cover91 source91 tree91 checked91)
    _ (by norm_num) _, areaUnits91]
  norm_num

-- Frozen phase 6802, atom 76, type 0, source (0,76).
def leavesData92 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves92 : Fin 7 → DyadicLeaf := leavesData92.get
def raw92 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 0 76 leaves92 i
def outputData92 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨0,128,19456,19584⟩) (.node (.single ⟨0,128,19584,19712⟩) (.single ⟨128,192,19456,19520⟩))) (.node (.node (.single ⟨128,192,19520,19584⟩) (.single ⟨192,256,19456,19520⟩)) (.node (.single ⟨192,256,19520,19584⟩) (.single ⟨128,256,19584,19712⟩)))) (.node (.node (.single ⟨13056,13184,32512,32640⟩) (.node (.single ⟨13056,13184,32640,32768⟩) (.single ⟨13184,13248,32512,32576⟩))) (.node (.node (.single ⟨13184,13248,32576,32640⟩) (.single ⟨13248,13312,32512,32576⟩)) (.node (.single ⟨13248,13312,32576,32640⟩) (.single ⟨13184,13312,32640,32768⟩))))) (.node (.node (.node (.single ⟨19456,19584,0,128⟩) (.node (.single ⟨19456,19520,128,192⟩) (.single ⟨19456,19520,192,256⟩))) (.node (.node (.single ⟨19520,19584,128,192⟩) (.single ⟨19520,19584,192,256⟩)) (.node (.single ⟨19584,19712,0,128⟩) (.single ⟨19584,19712,128,256⟩)))) (.node (.node (.single ⟨32512,32640,13056,13184⟩) (.node (.single ⟨32512,32576,13184,13248⟩) (.single ⟨32512,32576,13248,13312⟩))) (.node (.node (.single ⟨32576,32640,13184,13248⟩) (.single ⟨32576,32640,13248,13312⟩)) (.node (.single ⟨32640,32768,13056,13184⟩) (.single ⟨32640,32768,13184,13312⟩))))))
def output92 : Fin 28 → GridBox := outputData92.get
def coverData92 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData92 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover92 (i : Fin 28) : Fin 28 := ⟨coverData92.get i % 28, Nat.mod_lt _ (by decide)⟩
def source92 (i : Fin 28) : Fin 28 := ⟨sourceData92.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree92 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 (.cutY 19456 .empty (.cutX 512 (.cutY 19968 (.cutX 256 (.cutY 19712 (.cutX 128 (.cutY 19584 .full .full) (.cutY 19584 (.cutX 192 (.cutY 19520 .full .full) (.cutY 19520 .full .full)) .full)) .empty) .empty) .empty) .empty)) .empty)) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 (.cutY 31744 .empty (.cutX 12800 .empty (.cutY 32256 .empty (.cutX 13056 .empty (.cutY 32512 .empty (.cutX 13184 (.cutY 32640 .full .full) (.cutY 32640 (.cutX 13248 (.cutY 32576 .full .full) (.cutY 32576 .full .full)) .full))))))) .empty)) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 .empty (.cutY 1024 (.cutX 19968 (.cutY 512 (.cutX 19712 (.cutY 256 (.cutX 19584 (.cutY 128 .full (.cutX 19520 (.cutY 192 .full .full) (.cutY 192 .full .full))) (.cutY 128 .full .full)) .empty) .empty) .empty) .empty) .empty)) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 .empty (.cutY 13312 (.cutX 32256 .empty (.cutY 12800 .empty (.cutX 32512 .empty (.cutY 13056 .empty (.cutX 32640 (.cutY 13184 .full (.cutX 32576 (.cutY 13248 .full .full) (.cutY 13248 .full .full))) (.cutY 13184 .full .full)))))) .empty)) .empty)))))) .empty))

theorem metadata92 : 0<34183877 ∧ 0<128 ∧ 76<128 ∧ 0<4 ∧
    76/4160=0 ∧ 76%4160=76 ∧ ∀ i, (leaves92 i).Valid 8 := by
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

noncomputable def phaseMass92 : ℝ := singlePhaseMass (34183877/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw92 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass92_eq : phaseMass92 = (34183877/1638400000000 : ℝ) := by
  unfold phaseMass92
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw92 output92 cover92 source92
    (gridTreeUnionCheck_sound 32768 raw92 output92 cover92 source92 tree92 checked92)
    _ (by norm_num) _, areaUnits92]
  norm_num

-- Frozen phase 6803, atom 329, type 0, source (2,77).
def leavesData93 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves93 : Fin 7 → DyadicLeaf := leavesData93.get
def raw93 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 2 77 leaves93 i
def outputData93 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨512,640,19712,19840⟩) (.node (.single ⟨512,640,19840,19968⟩) (.single ⟨640,704,19712,19776⟩))) (.node (.node (.single ⟨640,704,19776,19840⟩) (.single ⟨704,768,19712,19776⟩)) (.node (.single ⟨704,768,19776,19840⟩) (.single ⟨640,768,19840,19968⟩)))) (.node (.node (.single ⟨12800,12928,32000,32128⟩) (.node (.single ⟨12800,12928,32128,32256⟩) (.single ⟨12928,12992,32000,32064⟩))) (.node (.node (.single ⟨12928,12992,32064,32128⟩) (.single ⟨12992,13056,32000,32064⟩)) (.node (.single ⟨12992,13056,32064,32128⟩) (.single ⟨12928,13056,32128,32256⟩))))) (.node (.node (.node (.single ⟨19712,19840,512,640⟩) (.node (.single ⟨19712,19776,640,704⟩) (.single ⟨19712,19776,704,768⟩))) (.node (.node (.single ⟨19776,19840,640,704⟩) (.single ⟨19776,19840,704,768⟩)) (.node (.single ⟨19840,19968,512,640⟩) (.single ⟨19840,19968,640,768⟩)))) (.node (.node (.single ⟨32000,32128,12800,12928⟩) (.node (.single ⟨32000,32064,12928,12992⟩) (.single ⟨32000,32064,12992,13056⟩))) (.node (.node (.single ⟨32064,32128,12928,12992⟩) (.single ⟨32064,32128,12992,13056⟩)) (.node (.single ⟨32128,32256,12800,12928⟩) (.single ⟨32128,32256,12928,13056⟩))))))
def output93 : Fin 28 → GridBox := outputData93.get
def coverData93 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData93 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover93 (i : Fin 28) : Fin 28 := ⟨coverData93.get i % 28, Nat.mod_lt _ (by decide)⟩
def source93 (i : Fin 28) : Fin 28 := ⟨sourceData93.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree93 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 (.cutY 19456 .empty (.cutX 512 .empty (.cutY 19968 (.cutX 768 (.cutY 19712 .empty (.cutX 640 (.cutY 19840 .full .full) (.cutY 19840 (.cutX 704 (.cutY 19776 .full .full) (.cutY 19776 .full .full)) .full))) .empty) .empty))) .empty)) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 (.cutY 31744 .empty (.cutX 12800 .empty (.cutY 32256 (.cutX 13056 (.cutY 32000 .empty (.cutX 12928 (.cutY 32128 .full .full) (.cutY 32128 (.cutX 12992 (.cutY 32064 .full .full) (.cutY 32064 .full .full)) .full))) .empty) .empty))) .empty)) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 .empty (.cutY 1024 (.cutX 19968 (.cutY 512 .empty (.cutX 19712 .empty (.cutY 768 (.cutX 19840 (.cutY 640 .full (.cutX 19776 (.cutY 704 .full .full) (.cutY 704 .full .full))) (.cutY 640 .full .full)) .empty))) .empty) .empty)) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 .empty (.cutY 13312 (.cutX 32256 (.cutY 12800 .empty (.cutX 32000 .empty (.cutY 13056 (.cutX 32128 (.cutY 12928 .full (.cutX 32064 (.cutY 12992 .full .full) (.cutY 12992 .full .full))) (.cutY 12928 .full .full)) .empty))) .empty) .empty)) .empty)))))) .empty))

theorem metadata93 : 0<34183877 ∧ 2<128 ∧ 77<128 ∧ 0<4 ∧
    329/4160=0 ∧ 329%4160=329 ∧ ∀ i, (leaves93 i).Valid 8 := by
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

noncomputable def phaseMass93 : ℝ := singlePhaseMass (34183877/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw93 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass93_eq : phaseMass93 = (34183877/1638400000000 : ℝ) := by
  unfold phaseMass93
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw93 output93 cover93 source93
    (gridTreeUnionCheck_sound 32768 raw93 output93 cover93 source93 tree93 checked93)
    _ (by norm_num) _, areaUnits93]
  norm_num

-- Frozen phase 6804, atom 4733, type 1, source (4,77).
def leavesData94 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves94 : Fin 7 → DyadicLeaf := leavesData94.get
def raw94 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 4 77 leaves94 i
def outputData94 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨1024,1152,19712,19840⟩) (.node (.single ⟨1024,1152,19840,19968⟩) (.single ⟨1152,1216,19712,19776⟩))) (.node (.node (.single ⟨1152,1216,19776,19840⟩) (.single ⟨1216,1280,19712,19776⟩)) (.node (.single ⟨1216,1280,19776,19840⟩) (.single ⟨1152,1280,19840,19968⟩)))) (.node (.node (.single ⟨12800,12928,31488,31616⟩) (.node (.single ⟨12800,12928,31616,31744⟩) (.single ⟨12928,12992,31488,31552⟩))) (.node (.node (.single ⟨12928,12992,31552,31616⟩) (.single ⟨12992,13056,31488,31552⟩)) (.node (.single ⟨12992,13056,31552,31616⟩) (.single ⟨12928,13056,31616,31744⟩))))) (.node (.node (.node (.single ⟨19712,19840,1024,1152⟩) (.node (.single ⟨19712,19776,1152,1216⟩) (.single ⟨19712,19776,1216,1280⟩))) (.node (.node (.single ⟨19776,19840,1152,1216⟩) (.single ⟨19776,19840,1216,1280⟩)) (.node (.single ⟨19840,19968,1024,1152⟩) (.single ⟨19840,19968,1152,1280⟩)))) (.node (.node (.single ⟨31488,31616,12800,12928⟩) (.node (.single ⟨31488,31552,12928,12992⟩) (.single ⟨31488,31552,12992,13056⟩))) (.node (.node (.single ⟨31552,31616,12928,12992⟩) (.single ⟨31552,31616,12992,13056⟩)) (.node (.single ⟨31616,31744,12800,12928⟩) (.single ⟨31616,31744,12928,13056⟩))))))
def output94 : Fin 28 → GridBox := outputData94.get
def coverData94 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData94 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover94 (i : Fin 28) : Fin 28 := ⟨coverData94.get i % 28, Nat.mod_lt _ (by decide)⟩
def source94 (i : Fin 28) : Fin 28 := ⟨sourceData94.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree94 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 .empty (.cutY 19456 .empty (.cutX 1536 (.cutY 19968 (.cutX 1280 (.cutY 19712 .empty (.cutX 1152 (.cutY 19840 .full .full) (.cutY 19840 (.cutX 1216 (.cutY 19776 .full .full) (.cutY 19776 .full .full)) .full))) .empty) .empty) .empty)))) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 (.cutY 31744 (.cutX 12800 .empty (.cutY 31232 .empty (.cutX 13056 (.cutY 31488 .empty (.cutX 12928 (.cutY 31616 .full .full) (.cutY 31616 (.cutX 12992 (.cutY 31552 .full .full) (.cutY 31552 .full .full)) .full))) .empty))) .empty) .empty)) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 .empty (.cutY 1024 .empty (.cutX 19968 (.cutY 1536 (.cutX 19712 .empty (.cutY 1280 (.cutX 19840 (.cutY 1152 .full (.cutX 19776 (.cutY 1216 .full .full) (.cutY 1216 .full .full))) (.cutY 1152 .full .full)) .empty)) .empty) .empty))) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 (.cutY 13312 (.cutX 31232 .empty (.cutY 12800 .empty (.cutX 31488 .empty (.cutY 13056 (.cutX 31616 (.cutY 12928 .full (.cutX 31552 (.cutY 12992 .full .full) (.cutY 12992 .full .full))) (.cutY 12928 .full .full)) .empty)))) .empty) .empty) .empty)))))) .empty))

theorem metadata94 : 0<137362203 ∧ 4<128 ∧ 77<128 ∧ 1<4 ∧
    4733/4160=1 ∧ 4733%4160=573 ∧ ∀ i, (leaves94 i).Valid 8 := by
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

noncomputable def phaseMass94 : ℝ := singlePhaseMass (137362203/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw94 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass94_eq : phaseMass94 = (137362203/1638400000000 : ℝ) := by
  unfold phaseMass94
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw94 output94 cover94 source94
    (gridTreeUnionCheck_sound 32768 raw94 output94 cover94 source94 tree94 checked94)
    _ (by norm_num) _, areaUnits94]
  norm_num

-- Frozen phase 6805, atom 4488, type 1, source (2,76).
def leavesData95 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves95 : Fin 7 → DyadicLeaf := leavesData95.get
def raw95 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 2 76 leaves95 i
def outputData95 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨512,640,19456,19584⟩) (.node (.single ⟨512,640,19584,19712⟩) (.single ⟨640,704,19456,19520⟩))) (.node (.node (.single ⟨640,704,19520,19584⟩) (.single ⟨704,768,19456,19520⟩)) (.node (.single ⟨704,768,19520,19584⟩) (.single ⟨640,768,19584,19712⟩)))) (.node (.node (.single ⟨13056,13184,32000,32128⟩) (.node (.single ⟨13056,13184,32128,32256⟩) (.single ⟨13184,13248,32000,32064⟩))) (.node (.node (.single ⟨13184,13248,32064,32128⟩) (.single ⟨13248,13312,32000,32064⟩)) (.node (.single ⟨13248,13312,32064,32128⟩) (.single ⟨13184,13312,32128,32256⟩))))) (.node (.node (.node (.single ⟨19456,19584,512,640⟩) (.node (.single ⟨19456,19520,640,704⟩) (.single ⟨19456,19520,704,768⟩))) (.node (.node (.single ⟨19520,19584,640,704⟩) (.single ⟨19520,19584,704,768⟩)) (.node (.single ⟨19584,19712,512,640⟩) (.single ⟨19584,19712,640,768⟩)))) (.node (.node (.single ⟨32000,32128,13056,13184⟩) (.node (.single ⟨32000,32064,13184,13248⟩) (.single ⟨32000,32064,13248,13312⟩))) (.node (.node (.single ⟨32064,32128,13184,13248⟩) (.single ⟨32064,32128,13248,13312⟩)) (.node (.single ⟨32128,32256,13056,13184⟩) (.single ⟨32128,32256,13184,13312⟩))))))
def output95 : Fin 28 → GridBox := outputData95.get
def coverData95 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData95 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover95 (i : Fin 28) : Fin 28 := ⟨coverData95.get i % 28, Nat.mod_lt _ (by decide)⟩
def source95 (i : Fin 28) : Fin 28 := ⟨sourceData95.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree95 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 (.cutY 19456 .empty (.cutX 512 .empty (.cutY 19968 (.cutX 768 (.cutY 19712 (.cutX 640 (.cutY 19584 .full .full) (.cutY 19584 (.cutX 704 (.cutY 19520 .full .full) (.cutY 19520 .full .full)) .full)) .empty) .empty) .empty))) .empty)) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 (.cutY 31744 .empty (.cutX 12800 .empty (.cutY 32256 (.cutX 13056 .empty (.cutY 32000 .empty (.cutX 13184 (.cutY 32128 .full .full) (.cutY 32128 (.cutX 13248 (.cutY 32064 .full .full) (.cutY 32064 .full .full)) .full)))) .empty))) .empty)) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 .empty (.cutY 1024 (.cutX 19968 (.cutY 512 .empty (.cutX 19712 (.cutY 768 (.cutX 19584 (.cutY 640 .full (.cutX 19520 (.cutY 704 .full .full) (.cutY 704 .full .full))) (.cutY 640 .full .full)) .empty) .empty)) .empty) .empty)) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 .empty (.cutY 13312 (.cutX 32256 (.cutY 12800 .empty (.cutX 32000 .empty (.cutY 13056 .empty (.cutX 32128 (.cutY 13184 .full (.cutX 32064 (.cutY 13248 .full .full) (.cutY 13248 .full .full))) (.cutY 13184 .full .full))))) .empty) .empty)) .empty)))))) .empty))

theorem metadata95 : 0<137362203 ∧ 2<128 ∧ 76<128 ∧ 1<4 ∧
    4488/4160=1 ∧ 4488%4160=328 ∧ ∀ i, (leaves95 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData95).mp
    (by decide +kernel)

theorem sourceChecked95_0 : ∀ i : Fin 28,
    (fun i => output95 i = raw95 (source95 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked95 : ∀ i : Fin 28, (fun i => output95 i = raw95 (source95 i)) i :=
  forallFin_of_zero_offset (fun i => output95 i = raw95 (source95 i)) sourceChecked95_0

theorem coverChecked95_0 : ∀ i : Fin 28,
    (fun i => (output95 (cover95 i)).ContainsBox (raw95 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked95 : ∀ i : Fin 28, (fun i => (output95 (cover95 i)).ContainsBox (raw95 i)) i :=
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

noncomputable def phaseMass95 : ℝ := singlePhaseMass (137362203/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw95 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass95_eq : phaseMass95 = (137362203/1638400000000 : ℝ) := by
  unfold phaseMass95
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw95 output95 cover95 source95
    (gridTreeUnionCheck_sound 32768 raw95 output95 cover95 source95 tree95 checked95)
    _ (by norm_num) _, areaUnits95]
  norm_num

-- Frozen phase 6806, atom 5421, type 1, source (10,81).
def leavesData96 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves96 : Fin 7 → DyadicLeaf := leavesData96.get
def raw96 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 10 81 leaves96 i
def outputData96 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨2560,2688,20736,20864⟩) (.node (.single ⟨2560,2688,20864,20992⟩) (.single ⟨2688,2752,20736,20800⟩))) (.node (.node (.single ⟨2688,2752,20800,20864⟩) (.single ⟨2752,2816,20736,20800⟩)) (.node (.single ⟨2752,2816,20800,20864⟩) (.single ⟨2688,2816,20864,20992⟩)))) (.node (.node (.single ⟨11776,11904,29952,30080⟩) (.node (.single ⟨11776,11904,30080,30208⟩) (.single ⟨11904,11968,29952,30016⟩))) (.node (.node (.single ⟨11904,11968,30016,30080⟩) (.single ⟨11968,12032,29952,30016⟩)) (.node (.single ⟨11968,12032,30016,30080⟩) (.single ⟨11904,12032,30080,30208⟩))))) (.node (.node (.node (.single ⟨20736,20864,2560,2688⟩) (.node (.single ⟨20736,20800,2688,2752⟩) (.single ⟨20736,20800,2752,2816⟩))) (.node (.node (.single ⟨20800,20864,2688,2752⟩) (.single ⟨20800,20864,2752,2816⟩)) (.node (.single ⟨20864,20992,2560,2688⟩) (.single ⟨20864,20992,2688,2816⟩)))) (.node (.node (.single ⟨29952,30080,11776,11904⟩) (.node (.single ⟨29952,30016,11904,11968⟩) (.single ⟨29952,30016,11968,12032⟩))) (.node (.node (.single ⟨30016,30080,11904,11968⟩) (.single ⟨30016,30080,11968,12032⟩)) (.node (.single ⟨30080,30208,11776,11904⟩) (.single ⟨30080,30208,11904,12032⟩))))))
def output96 : Fin 28 → GridBox := outputData96.get
def coverData96 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData96 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover96 (i : Fin 28) : Fin 28 := ⟨coverData96.get i % 28, Nat.mod_lt _ (by decide)⟩
def source96 (i : Fin 28) : Fin 28 := ⟨sourceData96.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree96 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 (.cutY 21504 (.cutX 2560 .empty (.cutY 20992 (.cutX 2816 (.cutY 20736 .empty (.cutX 2688 (.cutY 20864 .full .full) (.cutY 20864 (.cutX 2752 (.cutY 20800 .full .full) (.cutY 20800 .full .full)) .full))) .empty) .empty)) .empty) .empty) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 .empty (.cutY 29696 .empty (.cutX 11776 .empty (.cutY 30208 (.cutX 12032 (.cutY 29952 .empty (.cutX 11904 (.cutY 30080 .full .full) (.cutY 30080 (.cutX 11968 (.cutY 30016 .full .full) (.cutY 30016 .full .full)) .full))) .empty) .empty)))) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 (.cutY 3072 (.cutX 20992 (.cutY 2560 .empty (.cutX 20736 .empty (.cutY 2816 (.cutX 20864 (.cutY 2688 .full (.cutX 20800 (.cutY 2752 .full .full) (.cutY 2752 .full .full))) (.cutY 2688 .full .full)) .empty))) .empty) .empty) .empty)) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 .empty (.cutY 11264 .empty (.cutX 30208 (.cutY 11776 .empty (.cutX 29952 .empty (.cutY 12032 (.cutX 30080 (.cutY 11904 .full (.cutX 30016 (.cutY 11968 .full .full) (.cutY 11968 .full .full))) (.cutY 11904 .full .full)) .empty))) .empty)))) .empty) .empty)))) .empty))

theorem metadata96 : 0<139307719 ∧ 10<128 ∧ 81<128 ∧ 1<4 ∧
    5421/4160=1 ∧ 5421%4160=1261 ∧ ∀ i, (leaves96 i).Valid 8 := by
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

noncomputable def phaseMass96 : ℝ := singlePhaseMass (139307719/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw96 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass96_eq : phaseMass96 = (139307719/1638400000000 : ℝ) := by
  unfold phaseMass96
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw96 output96 cover96 source96
    (gridTreeUnionCheck_sound 32768 raw96 output96 cover96 source96 tree96 checked96)
    _ (by norm_num) _, areaUnits96]
  norm_num

-- Frozen phase 6807, atom 1984, type 0, source (17,97).
def leavesData97 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves97 : Fin 7 → DyadicLeaf := leavesData97.get
def raw97 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 17 97 leaves97 i
def outputData97 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨4352,4480,24832,24960⟩) (.node (.single ⟨4352,4480,24960,25088⟩) (.single ⟨4480,4544,24832,24896⟩))) (.node (.node (.single ⟨4480,4544,24896,24960⟩) (.single ⟨4544,4608,24832,24896⟩)) (.node (.single ⟨4544,4608,24896,24960⟩) (.single ⟨4480,4608,24960,25088⟩)))) (.node (.node (.single ⟨7680,7808,28160,28288⟩) (.node (.single ⟨7680,7808,28288,28416⟩) (.single ⟨7808,7872,28160,28224⟩))) (.node (.node (.single ⟨7808,7872,28224,28288⟩) (.single ⟨7872,7936,28160,28224⟩)) (.node (.single ⟨7872,7936,28224,28288⟩) (.single ⟨7808,7936,28288,28416⟩))))) (.node (.node (.node (.single ⟨24832,24960,4352,4480⟩) (.node (.single ⟨24832,24896,4480,4544⟩) (.single ⟨24832,24896,4544,4608⟩))) (.node (.node (.single ⟨24896,24960,4480,4544⟩) (.single ⟨24896,24960,4544,4608⟩)) (.node (.single ⟨24960,25088,4352,4480⟩) (.single ⟨24960,25088,4480,4608⟩)))) (.node (.node (.single ⟨28160,28288,7680,7808⟩) (.node (.single ⟨28160,28224,7808,7872⟩) (.single ⟨28160,28224,7872,7936⟩))) (.node (.node (.single ⟨28224,28288,7808,7872⟩) (.single ⟨28224,28288,7872,7936⟩)) (.node (.single ⟨28288,28416,7680,7808⟩) (.single ⟨28288,28416,7808,7936⟩))))))
def output97 : Fin 28 → GridBox := outputData97.get
def coverData97 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData97 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover97 (i : Fin 28) : Fin 28 := ⟨coverData97.get i % 28, Nat.mod_lt _ (by decide)⟩
def source97 (i : Fin 28) : Fin 28 := ⟨sourceData97.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree97 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 (.cutY 26624 (.cutX 5120 (.cutY 25600 (.cutX 4608 (.cutY 25088 (.cutX 4352 .empty (.cutY 24832 .empty (.cutX 4480 (.cutY 24960 .full .full) (.cutY 24960 (.cutX 4544 (.cutY 24896 .full .full) (.cutY 24896 .full .full)) .full)))) .empty) .empty) .empty) .empty) .empty) (.cutY 26624 .empty (.cutX 7168 .empty (.cutY 27648 .empty (.cutX 7680 .empty (.cutY 28160 .empty (.cutX 7936 (.cutY 28416 (.cutX 7808 (.cutY 28288 .full .full) (.cutY 28288 (.cutX 7872 (.cutY 28224 .full .full) (.cutY 28224 .full .full)) .full)) .empty) .empty))))))) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 (.cutX 25600 (.cutY 5120 (.cutX 25088 (.cutY 4608 (.cutX 24832 .empty (.cutY 4352 .empty (.cutX 24960 (.cutY 4480 .full (.cutX 24896 (.cutY 4544 .full .full) (.cutY 4544 .full .full))) (.cutY 4480 .full .full)))) .empty) .empty) .empty) .empty) .empty) (.cutY 6144 .empty (.cutX 27648 .empty (.cutY 7168 .empty (.cutX 28160 .empty (.cutY 7680 .empty (.cutX 28416 (.cutY 7936 (.cutX 28288 (.cutY 7808 .full (.cutX 28224 (.cutY 7872 .full .full) (.cutY 7872 .full .full))) (.cutY 7808 .full .full)) .empty) .empty)))))))) .empty) .empty)) .empty))

theorem metadata97 : 0<121837468 ∧ 17<128 ∧ 97<128 ∧ 0<4 ∧
    1984/4160=0 ∧ 1984%4160=1984 ∧ ∀ i, (leaves97 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData97).mp
    (by decide +kernel)

theorem sourceChecked97_0 : ∀ i : Fin 28,
    (fun i => output97 i = raw97 (source97 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked97 : ∀ i : Fin 28, (fun i => output97 i = raw97 (source97 i)) i :=
  forallFin_of_zero_offset (fun i => output97 i = raw97 (source97 i)) sourceChecked97_0

theorem coverChecked97_0 : ∀ i : Fin 28,
    (fun i => (output97 (cover97 i)).ContainsBox (raw97 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked97 : ∀ i : Fin 28, (fun i => (output97 (cover97 i)).ContainsBox (raw97 i)) i :=
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

noncomputable def phaseMass97 : ℝ := singlePhaseMass (121837468/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw97 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass97_eq : phaseMass97 = (30459367/409600000000 : ℝ) := by
  unfold phaseMass97
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw97 output97 cover97 source97
    (gridTreeUnionCheck_sound 32768 raw97 output97 cover97 source97 tree97 checked97)
    _ (by norm_num) _, areaUnits97]
  norm_num

-- Frozen phase 6808, atom 2674, type 0, source (25,99).
def leavesData98 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩)))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩)))))
def leaves98 : Fin 10 → DyadicLeaf := leavesData98.get
def raw98 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 25 99 leaves98 i
def outputData98 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨6400,6464,25344,25408⟩) (.single ⟨6400,6464,25408,25472⟩)) (.node (.single ⟨6464,6528,25344,25408⟩) (.node (.single ⟨6464,6528,25408,25472⟩) (.single ⟨6400,6528,25472,25600⟩)))) (.node (.node (.single ⟨6528,6592,25344,25408⟩) (.single ⟨6528,6592,25408,25472⟩)) (.node (.single ⟨6592,6656,25344,25408⟩) (.node (.single ⟨6592,6656,25408,25472⟩) (.single ⟨6528,6656,25472,25600⟩))))) (.node (.node (.node (.single ⟨7168,7296,26112,26240⟩) (.single ⟨7168,7296,26240,26368⟩)) (.node (.single ⟨7296,7360,26112,26176⟩) (.node (.single ⟨7296,7360,26176,26240⟩) (.single ⟨7360,7424,26112,26176⟩)))) (.node (.node (.single ⟨7360,7424,26176,26240⟩) (.single ⟨7296,7360,26240,26304⟩)) (.node (.single ⟨7296,7360,26304,26368⟩) (.node (.single ⟨7360,7424,26240,26304⟩) (.single ⟨7360,7424,26304,26368⟩)))))) (.node (.node (.node (.node (.single ⟨25344,25408,6400,6464⟩) (.single ⟨25344,25408,6464,6528⟩)) (.node (.single ⟨25408,25472,6400,6464⟩) (.node (.single ⟨25408,25472,6464,6528⟩) (.single ⟨25344,25408,6528,6592⟩)))) (.node (.node (.single ⟨25344,25408,6592,6656⟩) (.single ⟨25408,25472,6528,6592⟩)) (.node (.single ⟨25408,25472,6592,6656⟩) (.node (.single ⟨25472,25600,6400,6528⟩) (.single ⟨25472,25600,6528,6656⟩))))) (.node (.node (.node (.single ⟨26112,26240,7168,7296⟩) (.single ⟨26112,26176,7296,7360⟩)) (.node (.single ⟨26112,26176,7360,7424⟩) (.node (.single ⟨26176,26240,7296,7360⟩) (.single ⟨26176,26240,7360,7424⟩)))) (.node (.node (.single ⟨26240,26368,7168,7296⟩) (.single ⟨26240,26304,7296,7360⟩)) (.node (.single ⟨26240,26304,7360,7424⟩) (.node (.single ⟨26304,26368,7296,7360⟩) (.single ⟨26304,26368,7360,7424⟩)))))))
def output98 : Fin 40 → GridBox := outputData98.get
def coverData98 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 0) (.single 20))))) (.node (.node (.node (.single 39) (.single 19)) (.node (.single 1) (.node (.single 22) (.single 38)))) (.node (.node (.single 17) (.single 2)) (.node (.single 21) (.node (.single 37) (.single 18)))))) (.node (.node (.node (.node (.single 3) (.single 23)) (.node (.single 36) (.node (.single 16) (.single 5)))) (.node (.node (.single 24) (.single 34)) (.node (.single 15) (.node (.single 6) (.single 26))))) (.node (.node (.node (.single 33) (.single 13)) (.node (.single 7) (.node (.single 25) (.single 32)))) (.node (.node (.single 14) (.single 8)) (.node (.single 27) (.node (.single 31) (.single 12)))))))
def sourceData98 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 0)))) (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 39) (.node (.single 31) (.single 35)))) (.node (.node (.single 27) (.single 23)) (.node (.single 15) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.node (.single 21) (.single 25)))) (.node (.node (.single 33) (.single 29)) (.node (.single 37) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))) (.node (.node (.single 2) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))))))
def cover98 (i : Fin 40) : Fin 40 := ⟨coverData98.get i % 40, Nat.mod_lt _ (by decide)⟩
def source98 (i : Fin 40) : Fin 40 := ⟨sourceData98.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree98 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 .empty (.cutY 26624 (.cutX 7168 (.cutY 25600 (.cutX 6656 (.cutY 25088 .empty (.cutX 6400 .empty (.cutY 25344 .empty (.cutX 6528 (.cutY 25472 (.cutX 6464 (.cutY 25408 .full .full) (.cutY 25408 .full .full)) .full) (.cutY 25472 (.cutX 6592 (.cutY 25408 .full .full) (.cutY 25408 .full .full)) .full))))) .empty) .empty) (.cutY 25600 .empty (.cutX 7680 (.cutY 26112 .empty (.cutX 7424 (.cutY 26368 (.cutX 7296 (.cutY 26240 .full .full) (.cutY 26240 (.cutX 7360 (.cutY 26176 .full .full) (.cutY 26176 .full .full)) (.cutX 7360 (.cutY 26304 .full .full) (.cutY 26304 .full .full)))) .empty) .empty)) .empty))) .empty)) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 .empty (.cutX 25600 (.cutY 7168 (.cutX 25088 .empty (.cutY 6656 (.cutX 25344 .empty (.cutY 6400 .empty (.cutX 25472 (.cutY 6528 (.cutX 25408 (.cutY 6464 .full .full) (.cutY 6464 .full .full)) (.cutX 25408 (.cutY 6592 .full .full) (.cutY 6592 .full .full))) (.cutY 6528 .full .full)))) .empty)) .empty) (.cutY 7168 .empty (.cutX 26112 .empty (.cutY 7680 (.cutX 26368 (.cutY 7424 (.cutX 26240 (.cutY 7296 .full (.cutX 26176 (.cutY 7360 .full .full) (.cutY 7360 .full .full))) (.cutY 7296 .full (.cutX 26304 (.cutY 7360 .full .full) (.cutY 7360 .full .full)))) .empty) .empty) .empty))))) .empty)) .empty) .empty)) .empty))

theorem metadata98 : 0<31548346 ∧ 25<128 ∧ 99<128 ∧ 0<4 ∧
    2674/4160=0 ∧ 2674%4160=2674 ∧ ∀ i, (leaves98 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData98).mp
    (by decide +kernel)

theorem sourceChecked98_0 : ∀ i : Fin 40,
    (fun i => output98 i = raw98 (source98 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked98 : ∀ i : Fin 40, (fun i => output98 i = raw98 (source98 i)) i :=
  forallFin_of_zero_offset (fun i => output98 i = raw98 (source98 i)) sourceChecked98_0

theorem coverChecked98_0 : ∀ i : Fin 40,
    (fun i => (output98 (cover98 i)).ContainsBox (raw98 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked98 : ∀ i : Fin 40, (fun i => (output98 (cover98 i)).ContainsBox (raw98 i)) i :=
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

noncomputable def phaseMass98 : ℝ := singlePhaseMass (31548346/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw98 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass98_eq : phaseMass98 = (15774173/819200000000 : ℝ) := by
  unfold phaseMass98
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw98 output98 cover98 source98
    (gridTreeUnionCheck_sound 32768 raw98 output98 cover98 source98 tree98 checked98)
    _ (by norm_num) _, areaUnits98]
  norm_num

-- Frozen phase 6809, atom 2078, type 0, source (18,98).
def leavesData99 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves99 : Fin 4 → DyadicLeaf := leavesData99.get
def raw99 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 18 98 leaves99 i
def outputData99 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨4608,4736,25088,25216⟩) (.single ⟨4608,4736,25216,25344⟩)) (.node (.single ⟨4736,4864,25088,25216⟩) (.single ⟨4736,4864,25216,25344⟩))) (.node (.node (.single ⟨7424,7552,27904,28032⟩) (.single ⟨7424,7552,28032,28160⟩)) (.node (.single ⟨7552,7680,27904,28032⟩) (.single ⟨7552,7680,28032,28160⟩)))) (.node (.node (.node (.single ⟨25088,25216,4608,4736⟩) (.single ⟨25088,25216,4736,4864⟩)) (.node (.single ⟨25216,25344,4608,4736⟩) (.single ⟨25216,25344,4736,4864⟩))) (.node (.node (.single ⟨27904,28032,7424,7552⟩) (.single ⟨27904,28032,7552,7680⟩)) (.node (.single ⟨28032,28160,7424,7552⟩) (.single ⟨28032,28160,7552,7680⟩)))))
def output99 : Fin 16 → GridBox := outputData99.get
def coverData99 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData99 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover99 (i : Fin 16) : Fin 16 := ⟨coverData99.get i % 16, Nat.mod_lt _ (by decide)⟩
def source99 (i : Fin 16) : Fin 16 := ⟨sourceData99.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree99 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 (.cutY 26624 (.cutX 5120 (.cutY 25600 (.cutX 4608 .empty (.cutY 25088 .empty (.cutX 4864 (.cutY 25344 (.cutX 4736 (.cutY 25216 .full .full) (.cutY 25216 .full .full)) .empty) .empty))) .empty) .empty) .empty) (.cutY 26624 .empty (.cutX 7168 .empty (.cutY 27648 .empty (.cutX 7680 (.cutY 28160 (.cutX 7424 .empty (.cutY 27904 .empty (.cutX 7552 (.cutY 28032 .full .full) (.cutY 28032 .full .full)))) .empty) .empty))))) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 (.cutX 25600 (.cutY 5120 (.cutX 25088 .empty (.cutY 4608 .empty (.cutX 25344 (.cutY 4864 (.cutX 25216 (.cutY 4736 .full .full) (.cutY 4736 .full .full)) .empty) .empty))) .empty) .empty) .empty) (.cutY 6144 .empty (.cutX 27648 .empty (.cutY 7168 .empty (.cutX 28160 (.cutY 7680 (.cutX 27904 .empty (.cutY 7424 .empty (.cutX 28032 (.cutY 7552 .full .full) (.cutY 7552 .full .full)))) .empty) .empty)))))) .empty) .empty)) .empty))

theorem metadata99 : 0<121837468 ∧ 18<128 ∧ 98<128 ∧ 0<4 ∧
    2078/4160=0 ∧ 2078%4160=2078 ∧ ∀ i, (leaves99 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData99).mp
    (by decide +kernel)

theorem sourceChecked99_0 : ∀ i : Fin 16,
    (fun i => output99 i = raw99 (source99 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked99 : ∀ i : Fin 16, (fun i => output99 i = raw99 (source99 i)) i :=
  forallFin_of_zero_offset (fun i => output99 i = raw99 (source99 i)) sourceChecked99_0

theorem coverChecked99_0 : ∀ i : Fin 16,
    (fun i => (output99 (cover99 i)).ContainsBox (raw99 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked99 : ∀ i : Fin 16, (fun i => (output99 (cover99 i)).ContainsBox (raw99 i)) i :=
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

noncomputable def phaseMass99 : ℝ := singlePhaseMass (121837468/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw99 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass99_eq : phaseMass99 = (30459367/409600000000 : ℝ) := by
  unfold phaseMass99
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw99 output99 cover99 source99
    (gridTreeUnionCheck_sound 32768 raw99 output99 cover99 source99 tree99 checked99)
    _ (by norm_num) _, areaUnits99]
  norm_num

-- Frozen phase 6810, atom 2752, type 0, source (26,100).
def leavesData100 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves100 : Fin 7 → DyadicLeaf := leavesData100.get
def raw100 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 26 100 leaves100 i
def outputData100 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨6656,6784,25600,25728⟩) (.node (.single ⟨6656,6784,25728,25856⟩) (.single ⟨6784,6848,25600,25664⟩))) (.node (.node (.single ⟨6784,6848,25664,25728⟩) (.single ⟨6848,6912,25600,25664⟩)) (.node (.single ⟨6848,6912,25664,25728⟩) (.single ⟨6784,6912,25728,25856⟩)))) (.node (.node (.single ⟨6912,7040,25856,25984⟩) (.node (.single ⟨6912,7040,25984,26112⟩) (.single ⟨7040,7104,25856,25920⟩))) (.node (.node (.single ⟨7040,7104,25920,25984⟩) (.single ⟨7104,7168,25856,25920⟩)) (.node (.single ⟨7104,7168,25920,25984⟩) (.single ⟨7040,7168,25984,26112⟩))))) (.node (.node (.node (.single ⟨25600,25728,6656,6784⟩) (.node (.single ⟨25600,25664,6784,6848⟩) (.single ⟨25600,25664,6848,6912⟩))) (.node (.node (.single ⟨25664,25728,6784,6848⟩) (.single ⟨25664,25728,6848,6912⟩)) (.node (.single ⟨25728,25856,6656,6784⟩) (.single ⟨25728,25856,6784,6912⟩)))) (.node (.node (.single ⟨25856,25984,6912,7040⟩) (.node (.single ⟨25856,25920,7040,7104⟩) (.single ⟨25856,25920,7104,7168⟩))) (.node (.node (.single ⟨25920,25984,7040,7104⟩) (.single ⟨25920,25984,7104,7168⟩)) (.node (.single ⟨25984,26112,6912,7040⟩) (.single ⟨25984,26112,7040,7168⟩))))))
def output100 : Fin 28 → GridBox := outputData100.get
def coverData100 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData100 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover100 (i : Fin 28) : Fin 28 := ⟨coverData100.get i % 28, Nat.mod_lt _ (by decide)⟩
def source100 (i : Fin 28) : Fin 28 := ⟨sourceData100.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree100 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 .empty (.cutY 26624 (.cutX 7168 (.cutY 25600 .empty (.cutX 6656 .empty (.cutY 26112 (.cutX 6912 (.cutY 25856 (.cutX 6784 (.cutY 25728 .full .full) (.cutY 25728 (.cutX 6848 (.cutY 25664 .full .full) (.cutY 25664 .full .full)) .full)) .empty) (.cutY 25856 .empty (.cutX 7040 (.cutY 25984 .full .full) (.cutY 25984 (.cutX 7104 (.cutY 25920 .full .full) (.cutY 25920 .full .full)) .full)))) .empty))) .empty) .empty)) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 .empty (.cutX 25600 .empty (.cutY 7168 (.cutX 26112 (.cutY 6656 .empty (.cutX 25856 (.cutY 6912 (.cutX 25728 (.cutY 6784 .full (.cutX 25664 (.cutY 6848 .full .full) (.cutY 6848 .full .full))) (.cutY 6784 .full .full)) .empty) (.cutY 6912 .empty (.cutX 25984 (.cutY 7040 .full (.cutX 25920 (.cutY 7104 .full .full) (.cutY 7104 .full .full))) (.cutY 7040 .full .full))))) .empty) .empty))) .empty)) .empty) .empty)) .empty))

theorem metadata100 : 0<31548346 ∧ 26<128 ∧ 100<128 ∧ 0<4 ∧
    2752/4160=0 ∧ 2752%4160=2752 ∧ ∀ i, (leaves100 i).Valid 8 := by
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

noncomputable def phaseMass100 : ℝ := singlePhaseMass (31548346/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw100 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass100_eq : phaseMass100 = (15774173/819200000000 : ℝ) := by
  unfold phaseMass100
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw100 output100 cover100 source100
    (gridTreeUnionCheck_sound 32768 raw100 output100 cover100 source100 tree100 checked100)
    _ (by norm_num) _, areaUnits100]
  norm_num

-- Frozen phase 6811, atom 2595, type 0, source (24,99).
def leavesData101 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩)))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩)))))
def leaves101 : Fin 10 → DyadicLeaf := leavesData101.get
def raw101 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 24 99 leaves101 i
def outputData101 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨6144,6208,25344,25408⟩) (.single ⟨6144,6208,25408,25472⟩)) (.node (.single ⟨6208,6272,25344,25408⟩) (.node (.single ⟨6208,6272,25408,25472⟩) (.single ⟨6144,6272,25472,25600⟩)))) (.node (.node (.single ⟨6272,6336,25344,25408⟩) (.single ⟨6272,6336,25408,25472⟩)) (.node (.single ⟨6336,6400,25344,25408⟩) (.node (.single ⟨6336,6400,25408,25472⟩) (.single ⟨6272,6400,25472,25600⟩))))) (.node (.node (.node (.single ⟨7168,7296,26368,26496⟩) (.single ⟨7168,7296,26496,26624⟩)) (.node (.single ⟨7296,7360,26368,26432⟩) (.node (.single ⟨7296,7360,26432,26496⟩) (.single ⟨7360,7424,26368,26432⟩)))) (.node (.node (.single ⟨7360,7424,26432,26496⟩) (.single ⟨7296,7360,26496,26560⟩)) (.node (.single ⟨7296,7360,26560,26624⟩) (.node (.single ⟨7360,7424,26496,26560⟩) (.single ⟨7360,7424,26560,26624⟩)))))) (.node (.node (.node (.node (.single ⟨25344,25408,6144,6208⟩) (.single ⟨25344,25408,6208,6272⟩)) (.node (.single ⟨25408,25472,6144,6208⟩) (.node (.single ⟨25408,25472,6208,6272⟩) (.single ⟨25344,25408,6272,6336⟩)))) (.node (.node (.single ⟨25344,25408,6336,6400⟩) (.single ⟨25408,25472,6272,6336⟩)) (.node (.single ⟨25408,25472,6336,6400⟩) (.node (.single ⟨25472,25600,6144,6272⟩) (.single ⟨25472,25600,6272,6400⟩))))) (.node (.node (.node (.single ⟨26368,26496,7168,7296⟩) (.single ⟨26368,26432,7296,7360⟩)) (.node (.single ⟨26368,26432,7360,7424⟩) (.node (.single ⟨26432,26496,7296,7360⟩) (.single ⟨26432,26496,7360,7424⟩)))) (.node (.node (.single ⟨26496,26624,7168,7296⟩) (.single ⟨26496,26560,7296,7360⟩)) (.node (.single ⟨26496,26560,7360,7424⟩) (.node (.single ⟨26560,26624,7296,7360⟩) (.single ⟨26560,26624,7360,7424⟩)))))))
def output101 : Fin 40 → GridBox := outputData101.get
def coverData101 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 0) (.single 20))))) (.node (.node (.node (.single 39) (.single 19)) (.node (.single 1) (.node (.single 22) (.single 38)))) (.node (.node (.single 17) (.single 2)) (.node (.single 21) (.node (.single 37) (.single 18)))))) (.node (.node (.node (.node (.single 3) (.single 23)) (.node (.single 36) (.node (.single 16) (.single 5)))) (.node (.node (.single 24) (.single 34)) (.node (.single 15) (.node (.single 6) (.single 26))))) (.node (.node (.node (.single 33) (.single 13)) (.node (.single 7) (.node (.single 25) (.single 32)))) (.node (.node (.single 14) (.single 8)) (.node (.single 27) (.node (.single 31) (.single 12)))))))
def sourceData101 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 0)))) (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 39) (.node (.single 31) (.single 35)))) (.node (.node (.single 27) (.single 23)) (.node (.single 15) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.node (.single 21) (.single 25)))) (.node (.node (.single 33) (.single 29)) (.node (.single 37) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))) (.node (.node (.single 2) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))))))
def cover101 (i : Fin 40) : Fin 40 := ⟨coverData101.get i % 40, Nat.mod_lt _ (by decide)⟩
def source101 (i : Fin 40) : Fin 40 := ⟨sourceData101.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree101 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 .empty (.cutY 26624 (.cutX 7168 (.cutY 25600 (.cutX 6656 (.cutY 25088 .empty (.cutX 6400 (.cutY 25344 .empty (.cutX 6272 (.cutY 25472 (.cutX 6208 (.cutY 25408 .full .full) (.cutY 25408 .full .full)) .full) (.cutY 25472 (.cutX 6336 (.cutY 25408 .full .full) (.cutY 25408 .full .full)) .full))) .empty)) .empty) .empty) (.cutY 25600 .empty (.cutX 7680 (.cutY 26112 .empty (.cutX 7424 (.cutY 26368 .empty (.cutX 7296 (.cutY 26496 .full .full) (.cutY 26496 (.cutX 7360 (.cutY 26432 .full .full) (.cutY 26432 .full .full)) (.cutX 7360 (.cutY 26560 .full .full) (.cutY 26560 .full .full))))) .empty)) .empty))) .empty)) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 .empty (.cutX 25600 (.cutY 7168 (.cutX 25088 .empty (.cutY 6656 (.cutX 25344 .empty (.cutY 6400 (.cutX 25472 (.cutY 6272 (.cutX 25408 (.cutY 6208 .full .full) (.cutY 6208 .full .full)) (.cutX 25408 (.cutY 6336 .full .full) (.cutY 6336 .full .full))) (.cutY 6272 .full .full)) .empty)) .empty)) .empty) (.cutY 7168 .empty (.cutX 26112 .empty (.cutY 7680 (.cutX 26368 .empty (.cutY 7424 (.cutX 26496 (.cutY 7296 .full (.cutX 26432 (.cutY 7360 .full .full) (.cutY 7360 .full .full))) (.cutY 7296 .full (.cutX 26560 (.cutY 7360 .full .full) (.cutY 7360 .full .full)))) .empty)) .empty))))) .empty)) .empty) .empty)) .empty))

theorem metadata101 : 0<31548346 ∧ 24<128 ∧ 99<128 ∧ 0<4 ∧
    2595/4160=0 ∧ 2595%4160=2595 ∧ ∀ i, (leaves101 i).Valid 8 := by
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

noncomputable def phaseMass101 : ℝ := singlePhaseMass (31548346/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw101 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass101_eq : phaseMass101 = (15774173/819200000000 : ℝ) := by
  unfold phaseMass101
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw101 output101 cover101 source101
    (gridTreeUnionCheck_sound 32768 raw101 output101 cover101 source101 tree101 checked101)
    _ (by norm_num) _, areaUnits101]
  norm_num

-- Frozen phase 6812, atom 2514, type 0, source (23,99).
def leavesData102 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves102 : Fin 10 → DyadicLeaf := leavesData102.get
def raw102 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 23 99 leaves102 i
def outputData102 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨5888,5952,25344,25408⟩) (.single ⟨5888,5952,25408,25472⟩)) (.node (.single ⟨5952,6016,25344,25408⟩) (.node (.single ⟨5952,6016,25408,25472⟩) (.single ⟨5888,6016,25472,25600⟩)))) (.node (.node (.single ⟨6016,6080,25344,25408⟩) (.single ⟨6016,6080,25408,25472⟩)) (.node (.single ⟨6080,6144,25344,25408⟩) (.node (.single ⟨6080,6144,25408,25472⟩) (.single ⟨6016,6144,25472,25600⟩))))) (.node (.node (.node (.single ⟨7168,7296,26624,26752⟩) (.single ⟨7168,7296,26752,26880⟩)) (.node (.single ⟨7296,7360,26624,26688⟩) (.node (.single ⟨7296,7360,26688,26752⟩) (.single ⟨7360,7424,26624,26688⟩)))) (.node (.node (.single ⟨7360,7424,26688,26752⟩) (.single ⟨7296,7360,26752,26816⟩)) (.node (.single ⟨7296,7360,26816,26880⟩) (.node (.single ⟨7360,7424,26752,26816⟩) (.single ⟨7360,7424,26816,26880⟩)))))) (.node (.node (.node (.node (.single ⟨25344,25408,5888,5952⟩) (.single ⟨25344,25408,5952,6016⟩)) (.node (.single ⟨25408,25472,5888,5952⟩) (.node (.single ⟨25408,25472,5952,6016⟩) (.single ⟨25344,25408,6016,6080⟩)))) (.node (.node (.single ⟨25344,25408,6080,6144⟩) (.single ⟨25408,25472,6016,6080⟩)) (.node (.single ⟨25408,25472,6080,6144⟩) (.node (.single ⟨25472,25600,5888,6016⟩) (.single ⟨25472,25600,6016,6144⟩))))) (.node (.node (.node (.single ⟨26624,26752,7168,7296⟩) (.single ⟨26624,26688,7296,7360⟩)) (.node (.single ⟨26624,26688,7360,7424⟩) (.node (.single ⟨26688,26752,7296,7360⟩) (.single ⟨26688,26752,7360,7424⟩)))) (.node (.node (.single ⟨26752,26880,7168,7296⟩) (.single ⟨26752,26816,7296,7360⟩)) (.node (.single ⟨26752,26816,7360,7424⟩) (.node (.single ⟨26816,26880,7296,7360⟩) (.single ⟨26816,26880,7360,7424⟩)))))))
def output102 : Fin 40 → GridBox := outputData102.get
def coverData102 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData102 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover102 (i : Fin 40) : Fin 40 := ⟨coverData102.get i % 40, Nat.mod_lt _ (by decide)⟩
def source102 (i : Fin 40) : Fin 40 := ⟨sourceData102.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree102 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 (.cutY 26624 (.cutX 5120 .empty (.cutY 25600 (.cutX 5632 .empty (.cutY 25088 .empty (.cutX 5888 .empty (.cutY 25344 .empty (.cutX 6016 (.cutY 25472 (.cutX 5952 (.cutY 25408 .full .full) (.cutY 25408 .full .full)) .full) (.cutY 25472 (.cutX 6080 (.cutY 25408 .full .full) (.cutY 25408 .full .full)) .full)))))) .empty)) .empty) (.cutY 26624 .empty (.cutX 7168 .empty (.cutY 27648 (.cutX 7680 (.cutY 27136 (.cutX 7424 (.cutY 26880 (.cutX 7296 (.cutY 26752 .full .full) (.cutY 26752 (.cutX 7360 (.cutY 26688 .full .full) (.cutY 26688 .full .full)) (.cutX 7360 (.cutY 26816 .full .full) (.cutY 26816 .full .full)))) .empty) .empty) .empty) .empty) .empty)))) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 (.cutX 25600 (.cutY 5120 .empty (.cutX 25088 .empty (.cutY 5632 .empty (.cutX 25344 .empty (.cutY 5888 .empty (.cutX 25472 (.cutY 6016 (.cutX 25408 (.cutY 5952 .full .full) (.cutY 5952 .full .full)) (.cutX 25408 (.cutY 6080 .full .full) (.cutY 6080 .full .full))) (.cutY 6016 .full .full))))))) .empty) .empty) (.cutY 6144 .empty (.cutX 27648 (.cutY 7168 .empty (.cutX 27136 (.cutY 7680 (.cutX 26880 (.cutY 7424 (.cutX 26752 (.cutY 7296 .full (.cutX 26688 (.cutY 7360 .full .full) (.cutY 7360 .full .full))) (.cutY 7296 .full (.cutX 26816 (.cutY 7360 .full .full) (.cutY 7360 .full .full)))) .empty) .empty) .empty) .empty)) .empty)))) .empty) .empty)) .empty))

theorem metadata102 : 0<121837468 ∧ 23<128 ∧ 99<128 ∧ 0<4 ∧
    2514/4160=0 ∧ 2514%4160=2514 ∧ ∀ i, (leaves102 i).Valid 8 := by
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

noncomputable def phaseMass102 : ℝ := singlePhaseMass (121837468/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw102 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass102_eq : phaseMass102 = (30459367/409600000000 : ℝ) := by
  unfold phaseMass102
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw102 output102 cover102 source102
    (gridTreeUnionCheck_sound 32768 raw102 output102 cover102 source102 tree102 checked102)
    _ (by norm_num) _, areaUnits102]
  norm_num

-- Frozen phase 6813, atom 2431, type 0, source (22,99).
def leavesData103 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves103 : Fin 10 → DyadicLeaf := leavesData103.get
def raw103 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 22 99 leaves103 i
def outputData103 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨5632,5696,25344,25408⟩) (.single ⟨5632,5696,25408,25472⟩)) (.node (.single ⟨5696,5760,25344,25408⟩) (.node (.single ⟨5696,5760,25408,25472⟩) (.single ⟨5632,5760,25472,25600⟩)))) (.node (.node (.single ⟨5760,5824,25344,25408⟩) (.single ⟨5760,5824,25408,25472⟩)) (.node (.single ⟨5824,5888,25344,25408⟩) (.node (.single ⟨5824,5888,25408,25472⟩) (.single ⟨5760,5888,25472,25600⟩))))) (.node (.node (.node (.single ⟨7168,7296,26880,27008⟩) (.single ⟨7168,7296,27008,27136⟩)) (.node (.single ⟨7296,7360,26880,26944⟩) (.node (.single ⟨7296,7360,26944,27008⟩) (.single ⟨7360,7424,26880,26944⟩)))) (.node (.node (.single ⟨7360,7424,26944,27008⟩) (.single ⟨7296,7360,27008,27072⟩)) (.node (.single ⟨7296,7360,27072,27136⟩) (.node (.single ⟨7360,7424,27008,27072⟩) (.single ⟨7360,7424,27072,27136⟩)))))) (.node (.node (.node (.node (.single ⟨25344,25408,5632,5696⟩) (.single ⟨25344,25408,5696,5760⟩)) (.node (.single ⟨25408,25472,5632,5696⟩) (.node (.single ⟨25408,25472,5696,5760⟩) (.single ⟨25344,25408,5760,5824⟩)))) (.node (.node (.single ⟨25344,25408,5824,5888⟩) (.single ⟨25408,25472,5760,5824⟩)) (.node (.single ⟨25408,25472,5824,5888⟩) (.node (.single ⟨25472,25600,5632,5760⟩) (.single ⟨25472,25600,5760,5888⟩))))) (.node (.node (.node (.single ⟨26880,27008,7168,7296⟩) (.single ⟨26880,26944,7296,7360⟩)) (.node (.single ⟨26880,26944,7360,7424⟩) (.node (.single ⟨26944,27008,7296,7360⟩) (.single ⟨26944,27008,7360,7424⟩)))) (.node (.node (.single ⟨27008,27136,7168,7296⟩) (.single ⟨27008,27072,7296,7360⟩)) (.node (.single ⟨27008,27072,7360,7424⟩) (.node (.single ⟨27072,27136,7296,7360⟩) (.single ⟨27072,27136,7360,7424⟩)))))))
def output103 : Fin 40 → GridBox := outputData103.get
def coverData103 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData103 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover103 (i : Fin 40) : Fin 40 := ⟨coverData103.get i % 40, Nat.mod_lt _ (by decide)⟩
def source103 (i : Fin 40) : Fin 40 := ⟨sourceData103.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree103 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 (.cutY 26624 (.cutX 5120 .empty (.cutY 25600 (.cutX 5632 .empty (.cutY 25088 .empty (.cutX 5888 (.cutY 25344 .empty (.cutX 5760 (.cutY 25472 (.cutX 5696 (.cutY 25408 .full .full) (.cutY 25408 .full .full)) .full) (.cutY 25472 (.cutX 5824 (.cutY 25408 .full .full) (.cutY 25408 .full .full)) .full))) .empty))) .empty)) .empty) (.cutY 26624 .empty (.cutX 7168 .empty (.cutY 27648 (.cutX 7680 (.cutY 27136 (.cutX 7424 (.cutY 26880 .empty (.cutX 7296 (.cutY 27008 .full .full) (.cutY 27008 (.cutX 7360 (.cutY 26944 .full .full) (.cutY 26944 .full .full)) (.cutX 7360 (.cutY 27072 .full .full) (.cutY 27072 .full .full))))) .empty) .empty) .empty) .empty)))) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 (.cutX 25600 (.cutY 5120 .empty (.cutX 25088 .empty (.cutY 5632 .empty (.cutX 25344 .empty (.cutY 5888 (.cutX 25472 (.cutY 5760 (.cutX 25408 (.cutY 5696 .full .full) (.cutY 5696 .full .full)) (.cutX 25408 (.cutY 5824 .full .full) (.cutY 5824 .full .full))) (.cutY 5760 .full .full)) .empty))))) .empty) .empty) (.cutY 6144 .empty (.cutX 27648 (.cutY 7168 .empty (.cutX 27136 (.cutY 7680 (.cutX 26880 .empty (.cutY 7424 (.cutX 27008 (.cutY 7296 .full (.cutX 26944 (.cutY 7360 .full .full) (.cutY 7360 .full .full))) (.cutY 7296 .full (.cutX 27072 (.cutY 7360 .full .full) (.cutY 7360 .full .full)))) .empty)) .empty) .empty)) .empty)))) .empty) .empty)) .empty))

theorem metadata103 : 0<121837468 ∧ 22<128 ∧ 99<128 ∧ 0<4 ∧
    2431/4160=0 ∧ 2431%4160=2431 ∧ ∀ i, (leaves103 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData103).mp
    (by decide +kernel)

theorem sourceChecked103_0 : ∀ i : Fin 40,
    (fun i => output103 i = raw103 (source103 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked103 : ∀ i : Fin 40, (fun i => output103 i = raw103 (source103 i)) i :=
  forallFin_of_zero_offset (fun i => output103 i = raw103 (source103 i)) sourceChecked103_0

theorem coverChecked103_0 : ∀ i : Fin 40,
    (fun i => (output103 (cover103 i)).ContainsBox (raw103 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked103 : ∀ i : Fin 40, (fun i => (output103 (cover103 i)).ContainsBox (raw103 i)) i :=
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

noncomputable def phaseMass103 : ℝ := singlePhaseMass (121837468/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw103 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass103_eq : phaseMass103 = (30459367/409600000000 : ℝ) := by
  unfold phaseMass103
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw103 output103 cover103 source103
    (gridTreeUnionCheck_sound 32768 raw103 output103 cover103 source103 tree103 checked103)
    _ (by norm_num) _, areaUnits103]
  norm_num

-- Frozen phase 6814, atom 2346, type 0, source (21,99).
def leavesData104 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves104 : Fin 7 → DyadicLeaf := leavesData104.get
def raw104 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 21 99 leaves104 i
def outputData104 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨5376,5504,25344,25472⟩) (.node (.single ⟨5376,5504,25472,25600⟩) (.single ⟨5504,5568,25344,25408⟩))) (.node (.node (.single ⟨5504,5568,25408,25472⟩) (.single ⟨5568,5632,25344,25408⟩)) (.node (.single ⟨5568,5632,25408,25472⟩) (.single ⟨5504,5632,25472,25600⟩)))) (.node (.node (.single ⟨7168,7296,27136,27264⟩) (.node (.single ⟨7168,7296,27264,27392⟩) (.single ⟨7296,7360,27136,27200⟩))) (.node (.node (.single ⟨7296,7360,27200,27264⟩) (.single ⟨7360,7424,27136,27200⟩)) (.node (.single ⟨7360,7424,27200,27264⟩) (.single ⟨7296,7424,27264,27392⟩))))) (.node (.node (.node (.single ⟨25344,25472,5376,5504⟩) (.node (.single ⟨25344,25408,5504,5568⟩) (.single ⟨25344,25408,5568,5632⟩))) (.node (.node (.single ⟨25408,25472,5504,5568⟩) (.single ⟨25408,25472,5568,5632⟩)) (.node (.single ⟨25472,25600,5376,5504⟩) (.single ⟨25472,25600,5504,5632⟩)))) (.node (.node (.single ⟨27136,27264,7168,7296⟩) (.node (.single ⟨27136,27200,7296,7360⟩) (.single ⟨27136,27200,7360,7424⟩))) (.node (.node (.single ⟨27200,27264,7296,7360⟩) (.single ⟨27200,27264,7360,7424⟩)) (.node (.single ⟨27264,27392,7168,7296⟩) (.single ⟨27264,27392,7296,7424⟩))))))
def output104 : Fin 28 → GridBox := outputData104.get
def coverData104 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData104 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover104 (i : Fin 28) : Fin 28 := ⟨coverData104.get i % 28, Nat.mod_lt _ (by decide)⟩
def source104 (i : Fin 28) : Fin 28 := ⟨sourceData104.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree104 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 (.cutY 26624 (.cutX 5120 .empty (.cutY 25600 (.cutX 5632 (.cutY 25088 .empty (.cutX 5376 .empty (.cutY 25344 .empty (.cutX 5504 (.cutY 25472 .full .full) (.cutY 25472 (.cutX 5568 (.cutY 25408 .full .full) (.cutY 25408 .full .full)) .full))))) .empty) .empty)) .empty) (.cutY 26624 .empty (.cutX 7168 .empty (.cutY 27648 (.cutX 7680 (.cutY 27136 .empty (.cutX 7424 (.cutY 27392 (.cutX 7296 (.cutY 27264 .full .full) (.cutY 27264 (.cutX 7360 (.cutY 27200 .full .full) (.cutY 27200 .full .full)) .full)) .empty) .empty)) .empty) .empty)))) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 (.cutX 25600 (.cutY 5120 .empty (.cutX 25088 .empty (.cutY 5632 (.cutX 25344 .empty (.cutY 5376 .empty (.cutX 25472 (.cutY 5504 .full (.cutX 25408 (.cutY 5568 .full .full) (.cutY 5568 .full .full))) (.cutY 5504 .full .full)))) .empty))) .empty) .empty) (.cutY 6144 .empty (.cutX 27648 (.cutY 7168 .empty (.cutX 27136 .empty (.cutY 7680 (.cutX 27392 (.cutY 7424 (.cutX 27264 (.cutY 7296 .full (.cutX 27200 (.cutY 7360 .full .full) (.cutY 7360 .full .full))) (.cutY 7296 .full .full)) .empty) .empty) .empty))) .empty)))) .empty) .empty)) .empty))

theorem metadata104 : 0<121837468 ∧ 21<128 ∧ 99<128 ∧ 0<4 ∧
    2346/4160=0 ∧ 2346%4160=2346 ∧ ∀ i, (leaves104 i).Valid 8 := by
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

noncomputable def phaseMass104 : ℝ := singlePhaseMass (121837468/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw104 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass104_eq : phaseMass104 = (30459367/409600000000 : ℝ) := by
  unfold phaseMass104
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw104 output104 cover104 source104
    (gridTreeUnionCheck_sound 32768 raw104 output104 cover104 source104 tree104 checked104)
    _ (by norm_num) _, areaUnits104]
  norm_num

-- Frozen phase 6815, atom 6142, type 1, source (17,95).
def leavesData105 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves105 : Fin 7 → DyadicLeaf := leavesData105.get
def raw105 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 17 95 leaves105 i
def outputData105 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨4352,4480,24320,24448⟩) (.node (.single ⟨4352,4480,24448,24576⟩) (.single ⟨4480,4544,24320,24384⟩))) (.node (.node (.single ⟨4480,4544,24384,24448⟩) (.single ⟨4544,4608,24320,24384⟩)) (.node (.single ⟨4544,4608,24384,24448⟩) (.single ⟨4480,4608,24448,24576⟩)))) (.node (.node (.single ⟨8192,8320,28160,28288⟩) (.node (.single ⟨8192,8320,28288,28416⟩) (.single ⟨8320,8384,28160,28224⟩))) (.node (.node (.single ⟨8320,8384,28224,28288⟩) (.single ⟨8384,8448,28160,28224⟩)) (.node (.single ⟨8384,8448,28224,28288⟩) (.single ⟨8320,8448,28288,28416⟩))))) (.node (.node (.node (.single ⟨24320,24448,4352,4480⟩) (.node (.single ⟨24320,24384,4480,4544⟩) (.single ⟨24320,24384,4544,4608⟩))) (.node (.node (.single ⟨24384,24448,4480,4544⟩) (.single ⟨24384,24448,4544,4608⟩)) (.node (.single ⟨24448,24576,4352,4480⟩) (.single ⟨24448,24576,4480,4608⟩)))) (.node (.node (.single ⟨28160,28288,8192,8320⟩) (.node (.single ⟨28160,28224,8320,8384⟩) (.single ⟨28160,28224,8384,8448⟩))) (.node (.node (.single ⟨28224,28288,8320,8384⟩) (.single ⟨28224,28288,8384,8448⟩)) (.node (.single ⟨28288,28416,8192,8320⟩) (.single ⟨28288,28416,8320,8448⟩))))))
def output105 : Fin 28 → GridBox := outputData105.get
def coverData105 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData105 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover105 (i : Fin 28) : Fin 28 := ⟨coverData105.get i % 28, Nat.mod_lt _ (by decide)⟩
def source105 (i : Fin 28) : Fin 28 := ⟨sourceData105.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree105 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 .empty (.cutX 5120 (.cutY 23552 .empty (.cutX 4608 (.cutY 24064 .empty (.cutX 4352 .empty (.cutY 24320 .empty (.cutX 4480 (.cutY 24448 .full .full) (.cutY 24448 (.cutX 4544 (.cutY 24384 .full .full) (.cutY 24384 .full .full)) .full))))) .empty)) .empty)) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 .empty (.cutX 9216 (.cutY 27648 .empty (.cutX 8704 (.cutY 28160 .empty (.cutX 8448 (.cutY 28416 (.cutX 8320 (.cutY 28288 .full .full) (.cutY 28288 (.cutX 8384 (.cutY 28224 .full .full) (.cutY 28224 .full .full)) .full)) .empty) .empty)) .empty)) .empty)) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 (.cutX 23552 .empty (.cutY 5120 (.cutX 24064 .empty (.cutY 4608 (.cutX 24320 .empty (.cutY 4352 .empty (.cutX 24448 (.cutY 4480 .full (.cutX 24384 (.cutY 4544 .full .full) (.cutY 4544 .full .full))) (.cutY 4480 .full .full)))) .empty)) .empty)) .empty)))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 (.cutX 27648 .empty (.cutY 9216 (.cutX 28160 .empty (.cutY 8704 (.cutX 28416 (.cutY 8448 (.cutX 28288 (.cutY 8320 .full (.cutX 28224 (.cutY 8384 .full .full) (.cutY 8384 .full .full))) (.cutY 8320 .full .full)) .empty) .empty) .empty)) .empty)) .empty)) .empty) .empty))) .empty))

theorem metadata105 : 0<192153497 ∧ 17<128 ∧ 95<128 ∧ 1<4 ∧
    6142/4160=1 ∧ 6142%4160=1982 ∧ ∀ i, (leaves105 i).Valid 8 := by
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

noncomputable def phaseMass105 : ℝ := singlePhaseMass (192153497/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw105 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass105_eq : phaseMass105 = (192153497/1638400000000 : ℝ) := by
  unfold phaseMass105
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw105 output105 cover105 source105
    (gridTreeUnionCheck_sound 32768 raw105 output105 cover105 source105 tree105 checked105)
    _ (by norm_num) _, areaUnits105]
  norm_num

-- Frozen phase 6816, atom 5946, type 1, source (15,91).
def leavesData106 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,2,2⟩)) (.node (.single ⟨2,2,3⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves106 : Fin 10 → DyadicLeaf := leavesData106.get
def raw106 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 15 91 leaves106 i
def outputData106 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨3840,3968,23296,23424⟩) (.single ⟨3840,3968,23424,23552⟩)) (.node (.single ⟨3968,4032,23296,23360⟩) (.node (.single ⟨3968,4032,23360,23424⟩) (.single ⟨4032,4096,23296,23360⟩)))) (.node (.node (.single ⟨4032,4096,23360,23424⟩) (.single ⟨3968,4032,23424,23488⟩)) (.node (.single ⟨3968,4032,23488,23552⟩) (.node (.single ⟨4032,4096,23424,23488⟩) (.single ⟨4032,4096,23488,23552⟩))))) (.node (.node (.node (.single ⟨9216,9280,28672,28736⟩) (.single ⟨9216,9280,28736,28800⟩)) (.node (.single ⟨9280,9344,28672,28736⟩) (.node (.single ⟨9280,9344,28736,28800⟩) (.single ⟨9216,9344,28800,28928⟩)))) (.node (.node (.single ⟨9344,9408,28672,28736⟩) (.single ⟨9344,9408,28736,28800⟩)) (.node (.single ⟨9408,9472,28672,28736⟩) (.node (.single ⟨9408,9472,28736,28800⟩) (.single ⟨9344,9472,28800,28928⟩)))))) (.node (.node (.node (.node (.single ⟨23296,23424,3840,3968⟩) (.single ⟨23296,23360,3968,4032⟩)) (.node (.single ⟨23296,23360,4032,4096⟩) (.node (.single ⟨23360,23424,3968,4032⟩) (.single ⟨23360,23424,4032,4096⟩)))) (.node (.node (.single ⟨23424,23552,3840,3968⟩) (.single ⟨23424,23488,3968,4032⟩)) (.node (.single ⟨23424,23488,4032,4096⟩) (.node (.single ⟨23488,23552,3968,4032⟩) (.single ⟨23488,23552,4032,4096⟩))))) (.node (.node (.node (.single ⟨28672,28736,9216,9280⟩) (.single ⟨28672,28736,9280,9344⟩)) (.node (.single ⟨28736,28800,9216,9280⟩) (.node (.single ⟨28736,28800,9280,9344⟩) (.single ⟨28672,28736,9344,9408⟩)))) (.node (.node (.single ⟨28672,28736,9408,9472⟩) (.single ⟨28736,28800,9344,9408⟩)) (.node (.single ⟨28736,28800,9408,9472⟩) (.node (.single ⟨28800,28928,9216,9344⟩) (.single ⟨28800,28928,9344,9472⟩)))))))
def output106 : Fin 40 → GridBox := outputData106.get
def coverData106 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 25) (.single 38)) (.node (.single 14) (.node (.single 2) (.single 21))))) (.node (.node (.node (.single 37) (.single 18)) (.node (.single 3) (.node (.single 23) (.single 36)))) (.node (.node (.single 16) (.single 4)) (.node (.single 22) (.node (.single 35) (.single 17)))))) (.node (.node (.node (.node (.single 5) (.single 24)) (.node (.single 34) (.node (.single 15) (.single 6)))) (.node (.node (.single 26) (.single 33)) (.node (.single 13) (.node (.single 7) (.single 28))))) (.node (.node (.node (.single 32) (.single 11)) (.node (.single 8) (.node (.single 27) (.single 31)))) (.node (.node (.single 12) (.single 9)) (.node (.single 29) (.node (.single 30) (.single 10)))))))
def sourceData106 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 12) (.single 16)))) (.node (.node (.single 20) (.single 24)) (.node (.single 28) (.node (.single 32) (.single 36))))) (.node (.node (.node (.single 39) (.single 31)) (.node (.single 35) (.node (.single 27) (.single 7)))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 17) (.node (.single 13) (.single 21)))) (.node (.node (.single 5) (.single 25)) (.node (.single 33) (.node (.single 29) (.single 37))))) (.node (.node (.node (.single 38) (.single 34)) (.node (.single 30) (.node (.single 26) (.single 22)))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.node (.single 6) (.single 2)))))))
def cover106 (i : Fin 40) : Fin 40 := ⟨coverData106.get i % 40, Nat.mod_lt _ (by decide)⟩
def source106 (i : Fin 40) : Fin 40 := ⟨sourceData106.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree106 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 .empty (.cutX 3072 .empty (.cutY 23552 (.cutX 3584 .empty (.cutY 23040 .empty (.cutX 3840 .empty (.cutY 23296 .empty (.cutX 3968 (.cutY 23424 .full .full) (.cutY 23424 (.cutX 4032 (.cutY 23360 .full .full) (.cutY 23360 .full .full)) (.cutX 4032 (.cutY 23488 .full .full) (.cutY 23488 .full .full)))))))) .empty))))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 (.cutY 30720 (.cutX 9216 .empty (.cutY 29696 (.cutX 9728 (.cutY 29184 (.cutX 9472 (.cutY 28928 (.cutX 9344 (.cutY 28800 (.cutX 9280 (.cutY 28736 .full .full) (.cutY 28736 .full .full)) .full) (.cutY 28800 (.cutX 9408 (.cutY 28736 .full .full) (.cutY 28736 .full .full)) .full)) .empty) .empty) .empty) .empty) .empty)) .empty) .empty)) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 .empty (.cutY 2048 .empty (.cutX 23552 (.cutY 3072 .empty (.cutX 23040 .empty (.cutY 3584 .empty (.cutX 23296 .empty (.cutY 3840 .empty (.cutX 23424 (.cutY 3968 .full (.cutX 23360 (.cutY 4032 .full .full) (.cutY 4032 .full .full))) (.cutY 3968 .full (.cutX 23488 (.cutY 4032 .full .full) (.cutY 4032 .full .full))))))))) .empty))) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 (.cutX 29696 (.cutY 9216 .empty (.cutX 29184 (.cutY 9728 (.cutX 28928 (.cutY 9472 (.cutX 28800 (.cutY 9344 (.cutX 28736 (.cutY 9280 .full .full) (.cutY 9280 .full .full)) (.cutX 28736 (.cutY 9408 .full .full) (.cutY 9408 .full .full))) (.cutY 9344 .full .full)) .empty) .empty) .empty) .empty)) .empty) .empty) .empty) .empty)))) .empty))

theorem metadata106 : 0<112823226 ∧ 15<128 ∧ 91<128 ∧ 1<4 ∧
    5946/4160=1 ∧ 5946%4160=1786 ∧ ∀ i, (leaves106 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData106).mp
    (by decide +kernel)

theorem sourceChecked106_0 : ∀ i : Fin 40,
    (fun i => output106 i = raw106 (source106 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked106 : ∀ i : Fin 40, (fun i => output106 i = raw106 (source106 i)) i :=
  forallFin_of_zero_offset (fun i => output106 i = raw106 (source106 i)) sourceChecked106_0

theorem coverChecked106_0 : ∀ i : Fin 40,
    (fun i => (output106 (cover106 i)).ContainsBox (raw106 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked106 : ∀ i : Fin 40, (fun i => (output106 (cover106 i)).ContainsBox (raw106 i)) i :=
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

noncomputable def phaseMass106 : ℝ := singlePhaseMass (112823226/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw106 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass106_eq : phaseMass106 = (56411613/819200000000 : ℝ) := by
  unfold phaseMass106
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw106 output106 cover106 source106
    (gridTreeUnionCheck_sound 32768 raw106 output106 cover106 source106 tree106 checked106)
    _ (by norm_num) _, areaUnits106]
  norm_num

-- Frozen phase 6817, atom 6046, type 1, source (16,94).
def leavesData107 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves107 : Fin 7 → DyadicLeaf := leavesData107.get
def raw107 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 16 94 leaves107 i
def outputData107 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨4096,4224,24064,24192⟩) (.node (.single ⟨4096,4224,24192,24320⟩) (.single ⟨4224,4288,24064,24128⟩))) (.node (.node (.single ⟨4224,4288,24128,24192⟩) (.single ⟨4288,4352,24064,24128⟩)) (.node (.single ⟨4288,4352,24128,24192⟩) (.single ⟨4224,4352,24192,24320⟩)))) (.node (.node (.single ⟨8448,8576,28416,28544⟩) (.node (.single ⟨8448,8576,28544,28672⟩) (.single ⟨8576,8640,28416,28480⟩))) (.node (.node (.single ⟨8576,8640,28480,28544⟩) (.single ⟨8640,8704,28416,28480⟩)) (.node (.single ⟨8640,8704,28480,28544⟩) (.single ⟨8576,8704,28544,28672⟩))))) (.node (.node (.node (.single ⟨24064,24192,4096,4224⟩) (.node (.single ⟨24064,24128,4224,4288⟩) (.single ⟨24064,24128,4288,4352⟩))) (.node (.node (.single ⟨24128,24192,4224,4288⟩) (.single ⟨24128,24192,4288,4352⟩)) (.node (.single ⟨24192,24320,4096,4224⟩) (.single ⟨24192,24320,4224,4352⟩)))) (.node (.node (.single ⟨28416,28544,8448,8576⟩) (.node (.single ⟨28416,28480,8576,8640⟩) (.single ⟨28416,28480,8640,8704⟩))) (.node (.node (.single ⟨28480,28544,8576,8640⟩) (.single ⟨28480,28544,8640,8704⟩)) (.node (.single ⟨28544,28672,8448,8576⟩) (.single ⟨28544,28672,8576,8704⟩))))))
def output107 : Fin 28 → GridBox := outputData107.get
def coverData107 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData107 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover107 (i : Fin 28) : Fin 28 := ⟨coverData107.get i % 28, Nat.mod_lt _ (by decide)⟩
def source107 (i : Fin 28) : Fin 28 := ⟨sourceData107.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree107 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 .empty (.cutX 5120 (.cutY 23552 .empty (.cutX 4608 (.cutY 24064 .empty (.cutX 4352 (.cutY 24320 (.cutX 4224 (.cutY 24192 .full .full) (.cutY 24192 (.cutX 4288 (.cutY 24128 .full .full) (.cutY 24128 .full .full)) .full)) .empty) .empty)) .empty)) .empty)) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 .empty (.cutX 9216 (.cutY 27648 .empty (.cutX 8704 (.cutY 28160 .empty (.cutX 8448 .empty (.cutY 28416 .empty (.cutX 8576 (.cutY 28544 .full .full) (.cutY 28544 (.cutX 8640 (.cutY 28480 .full .full) (.cutY 28480 .full .full)) .full))))) .empty)) .empty)) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 (.cutX 23552 .empty (.cutY 5120 (.cutX 24064 .empty (.cutY 4608 (.cutX 24320 (.cutY 4352 (.cutX 24192 (.cutY 4224 .full (.cutX 24128 (.cutY 4288 .full .full) (.cutY 4288 .full .full))) (.cutY 4224 .full .full)) .empty) .empty) .empty)) .empty)) .empty)))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 (.cutX 27648 .empty (.cutY 9216 (.cutX 28160 .empty (.cutY 8704 (.cutX 28416 .empty (.cutY 8448 .empty (.cutX 28544 (.cutY 8576 .full (.cutX 28480 (.cutY 8640 .full .full) (.cutY 8640 .full .full))) (.cutY 8576 .full .full)))) .empty)) .empty)) .empty)) .empty) .empty))) .empty))

theorem metadata107 : 0<192153497 ∧ 16<128 ∧ 94<128 ∧ 1<4 ∧
    6046/4160=1 ∧ 6046%4160=1886 ∧ ∀ i, (leaves107 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData107).mp
    (by decide +kernel)

theorem sourceChecked107_0 : ∀ i : Fin 28,
    (fun i => output107 i = raw107 (source107 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked107 : ∀ i : Fin 28, (fun i => output107 i = raw107 (source107 i)) i :=
  forallFin_of_zero_offset (fun i => output107 i = raw107 (source107 i)) sourceChecked107_0

theorem coverChecked107_0 : ∀ i : Fin 28,
    (fun i => (output107 (cover107 i)).ContainsBox (raw107 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked107 : ∀ i : Fin 28, (fun i => (output107 (cover107 i)).ContainsBox (raw107 i)) i :=
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

noncomputable def phaseMass107 : ℝ := singlePhaseMass (192153497/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw107 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass107_eq : phaseMass107 = (192153497/1638400000000 : ℝ) := by
  unfold phaseMass107
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw107 output107 cover107 source107
    (gridTreeUnionCheck_sound 32768 raw107 output107 cover107 source107 tree107 checked107)
    _ (by norm_num) _, areaUnits107]
  norm_num

-- Frozen phase 6818, atom 5740, type 1, source (13,85).
def leavesData108 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,2,2⟩)) (.node (.single ⟨2,2,3⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves108 : Fin 10 → DyadicLeaf := leavesData108.get
def raw108 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 13 85 leaves108 i
def outputData108 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨3328,3456,21760,21888⟩) (.single ⟨3328,3456,21888,22016⟩)) (.node (.single ⟨3456,3520,21760,21824⟩) (.node (.single ⟨3456,3520,21824,21888⟩) (.single ⟨3520,3584,21760,21824⟩)))) (.node (.node (.single ⟨3520,3584,21824,21888⟩) (.single ⟨3456,3520,21888,21952⟩)) (.node (.single ⟨3456,3520,21952,22016⟩) (.node (.single ⟨3520,3584,21888,21952⟩) (.single ⟨3520,3584,21952,22016⟩))))) (.node (.node (.node (.single ⟨10752,10816,29184,29248⟩) (.single ⟨10752,10816,29248,29312⟩)) (.node (.single ⟨10816,10880,29184,29248⟩) (.node (.single ⟨10816,10880,29248,29312⟩) (.single ⟨10752,10880,29312,29440⟩)))) (.node (.node (.single ⟨10880,10944,29184,29248⟩) (.single ⟨10880,10944,29248,29312⟩)) (.node (.single ⟨10944,11008,29184,29248⟩) (.node (.single ⟨10944,11008,29248,29312⟩) (.single ⟨10880,11008,29312,29440⟩)))))) (.node (.node (.node (.node (.single ⟨21760,21888,3328,3456⟩) (.single ⟨21760,21824,3456,3520⟩)) (.node (.single ⟨21760,21824,3520,3584⟩) (.node (.single ⟨21824,21888,3456,3520⟩) (.single ⟨21824,21888,3520,3584⟩)))) (.node (.node (.single ⟨21888,22016,3328,3456⟩) (.single ⟨21888,21952,3456,3520⟩)) (.node (.single ⟨21888,21952,3520,3584⟩) (.node (.single ⟨21952,22016,3456,3520⟩) (.single ⟨21952,22016,3520,3584⟩))))) (.node (.node (.node (.single ⟨29184,29248,10752,10816⟩) (.single ⟨29184,29248,10816,10880⟩)) (.node (.single ⟨29248,29312,10752,10816⟩) (.node (.single ⟨29248,29312,10816,10880⟩) (.single ⟨29184,29248,10880,10944⟩)))) (.node (.node (.single ⟨29184,29248,10944,11008⟩) (.single ⟨29248,29312,10880,10944⟩)) (.node (.single ⟨29248,29312,10944,11008⟩) (.node (.single ⟨29312,29440,10752,10880⟩) (.single ⟨29312,29440,10880,11008⟩)))))))
def output108 : Fin 40 → GridBox := outputData108.get
def coverData108 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 25) (.single 38)) (.node (.single 14) (.node (.single 2) (.single 21))))) (.node (.node (.node (.single 37) (.single 18)) (.node (.single 3) (.node (.single 23) (.single 36)))) (.node (.node (.single 16) (.single 4)) (.node (.single 22) (.node (.single 35) (.single 17)))))) (.node (.node (.node (.node (.single 5) (.single 24)) (.node (.single 34) (.node (.single 15) (.single 6)))) (.node (.node (.single 26) (.single 33)) (.node (.single 13) (.node (.single 7) (.single 28))))) (.node (.node (.node (.single 32) (.single 11)) (.node (.single 8) (.node (.single 27) (.single 31)))) (.node (.node (.single 12) (.single 9)) (.node (.single 29) (.node (.single 30) (.single 10)))))))
def sourceData108 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 12) (.single 16)))) (.node (.node (.single 20) (.single 24)) (.node (.single 28) (.node (.single 32) (.single 36))))) (.node (.node (.node (.single 39) (.single 31)) (.node (.single 35) (.node (.single 27) (.single 7)))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 17) (.node (.single 13) (.single 21)))) (.node (.node (.single 5) (.single 25)) (.node (.single 33) (.node (.single 29) (.single 37))))) (.node (.node (.node (.single 38) (.single 34)) (.node (.single 30) (.node (.single 26) (.single 22)))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.node (.single 6) (.single 2)))))))
def cover108 (i : Fin 40) : Fin 40 := ⟨coverData108.get i % 40, Nat.mod_lt _ (by decide)⟩
def source108 (i : Fin 40) : Fin 40 := ⟨sourceData108.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree108 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 .empty (.cutY 21504 .empty (.cutX 3584 (.cutY 22016 (.cutX 3328 .empty (.cutY 21760 .empty (.cutX 3456 (.cutY 21888 .full .full) (.cutY 21888 (.cutX 3520 (.cutY 21824 .full .full) (.cutY 21824 .full .full)) (.cutX 3520 (.cutY 21952 .full .full) (.cutY 21952 .full .full)))))) .empty) .empty))) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 (.cutY 29696 (.cutX 10752 .empty (.cutY 29184 .empty (.cutX 11008 (.cutY 29440 (.cutX 10880 (.cutY 29312 (.cutX 10816 (.cutY 29248 .full .full) (.cutY 29248 .full .full)) .full) (.cutY 29312 (.cutX 10944 (.cutY 29248 .full .full) (.cutY 29248 .full .full)) .full)) .empty) .empty))) .empty) .empty) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 .empty (.cutY 3072 .empty (.cutX 22016 (.cutY 3584 (.cutX 21760 .empty (.cutY 3328 .empty (.cutX 21888 (.cutY 3456 .full (.cutX 21824 (.cutY 3520 .full .full) (.cutY 3520 .full .full))) (.cutY 3456 .full (.cutX 21952 (.cutY 3520 .full .full) (.cutY 3520 .full .full)))))) .empty) .empty)))) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 (.cutY 11264 (.cutX 29184 .empty (.cutY 10752 .empty (.cutX 29440 (.cutY 11008 (.cutX 29312 (.cutY 10880 (.cutX 29248 (.cutY 10816 .full .full) (.cutY 10816 .full .full)) (.cutX 29248 (.cutY 10944 .full .full) (.cutY 10944 .full .full))) (.cutY 10880 .full .full)) .empty) .empty))) .empty) .empty)) .empty) .empty)))) .empty))

theorem metadata108 : 0<139307719 ∧ 13<128 ∧ 85<128 ∧ 1<4 ∧
    5740/4160=1 ∧ 5740%4160=1580 ∧ ∀ i, (leaves108 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData108).mp
    (by decide +kernel)

theorem sourceChecked108_0 : ∀ i : Fin 40,
    (fun i => output108 i = raw108 (source108 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked108 : ∀ i : Fin 40, (fun i => output108 i = raw108 (source108 i)) i :=
  forallFin_of_zero_offset (fun i => output108 i = raw108 (source108 i)) sourceChecked108_0

theorem coverChecked108_0 : ∀ i : Fin 40,
    (fun i => (output108 (cover108 i)).ContainsBox (raw108 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked108 : ∀ i : Fin 40, (fun i => (output108 (cover108 i)).ContainsBox (raw108 i)) i :=
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

noncomputable def phaseMass108 : ℝ := singlePhaseMass (139307719/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw108 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass108_eq : phaseMass108 = (139307719/1638400000000 : ℝ) := by
  unfold phaseMass108
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw108 output108 cover108 source108
    (gridTreeUnionCheck_sound 32768 raw108 output108 cover108 source108 tree108 checked108)
    _ (by norm_num) _, areaUnits108]
  norm_num

-- Frozen phase 6819, atom 1373, type 0, source (11,86).
def leavesData109 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves109 : Fin 7 → DyadicLeaf := leavesData109.get
def raw109 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 11 86 leaves109 i
def outputData109 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨2816,2944,22016,22144⟩) (.node (.single ⟨2816,2944,22144,22272⟩) (.single ⟨2944,3008,22016,22080⟩))) (.node (.node (.single ⟨2944,3008,22080,22144⟩) (.single ⟨3008,3072,22016,22080⟩)) (.node (.single ⟨3008,3072,22080,22144⟩) (.single ⟨2944,3072,22144,22272⟩)))) (.node (.node (.single ⟨10496,10624,29696,29824⟩) (.node (.single ⟨10496,10624,29824,29952⟩) (.single ⟨10624,10688,29696,29760⟩))) (.node (.node (.single ⟨10624,10688,29760,29824⟩) (.single ⟨10688,10752,29696,29760⟩)) (.node (.single ⟨10688,10752,29760,29824⟩) (.single ⟨10624,10752,29824,29952⟩))))) (.node (.node (.node (.single ⟨22016,22144,2816,2944⟩) (.node (.single ⟨22016,22080,2944,3008⟩) (.single ⟨22016,22080,3008,3072⟩))) (.node (.node (.single ⟨22080,22144,2944,3008⟩) (.single ⟨22080,22144,3008,3072⟩)) (.node (.single ⟨22144,22272,2816,2944⟩) (.single ⟨22144,22272,2944,3072⟩)))) (.node (.node (.single ⟨29696,29824,10496,10624⟩) (.node (.single ⟨29696,29760,10624,10688⟩) (.single ⟨29696,29760,10688,10752⟩))) (.node (.node (.single ⟨29760,29824,10624,10688⟩) (.single ⟨29760,29824,10688,10752⟩)) (.node (.single ⟨29824,29952,10496,10624⟩) (.single ⟨29824,29952,10624,10752⟩))))))
def output109 : Fin 28 → GridBox := outputData109.get
def coverData109 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData109 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover109 (i : Fin 28) : Fin 28 := ⟨coverData109.get i % 28, Nat.mod_lt _ (by decide)⟩
def source109 (i : Fin 28) : Fin 28 := ⟨sourceData109.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree109 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 (.cutY 21504 .empty (.cutX 2560 .empty (.cutY 22016 .empty (.cutX 2816 .empty (.cutY 22272 (.cutX 2944 (.cutY 22144 .full .full) (.cutY 22144 (.cutX 3008 (.cutY 22080 .full .full) (.cutY 22080 .full .full)) .full)) .empty))))) .empty) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 (.cutY 29696 .empty (.cutX 10752 (.cutY 30208 (.cutX 10496 .empty (.cutY 29952 (.cutX 10624 (.cutY 29824 .full .full) (.cutY 29824 (.cutX 10688 (.cutY 29760 .full .full) (.cutY 29760 .full .full)) .full)) .empty)) .empty) .empty)) .empty) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 .empty (.cutY 3072 (.cutX 22016 .empty (.cutY 2560 .empty (.cutX 22272 (.cutY 2816 .empty (.cutX 22144 (.cutY 2944 .full (.cutX 22080 (.cutY 3008 .full .full) (.cutY 3008 .full .full))) (.cutY 2944 .full .full))) .empty))) .empty))) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 .empty (.cutY 11264 (.cutX 30208 (.cutY 10752 (.cutX 29952 (.cutY 10496 .empty (.cutX 29824 (.cutY 10624 .full (.cutX 29760 (.cutY 10688 .full .full) (.cutY 10688 .full .full))) (.cutY 10624 .full .full))) .empty) .empty) .empty) .empty))) .empty) .empty)))) .empty))

theorem metadata109 : 0<72090291 ∧ 11<128 ∧ 86<128 ∧ 0<4 ∧
    1373/4160=0 ∧ 1373%4160=1373 ∧ ∀ i, (leaves109 i).Valid 8 := by
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

noncomputable def phaseMass109 : ℝ := singlePhaseMass (72090291/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw109 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass109_eq : phaseMass109 = (72090291/1638400000000 : ℝ) := by
  unfold phaseMass109
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw109 output109 cover109 source109
    (gridTreeUnionCheck_sound 32768 raw109 output109 cover109 source109 tree109 checked109)
    _ (by norm_num) _, areaUnits109]
  norm_num

-- Frozen phase 6820, atom 1480, type 0, source (12,88).
def leavesData110 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,2,2⟩)))) (.node (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,0⟩)) (.node (.single ⟨2,3,1⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves110 : Fin 10 → DyadicLeaf := leavesData110.get
def raw110 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 12 88 leaves110 i
def outputData110 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨3072,3200,22528,22656⟩) (.single ⟨3072,3200,22656,22784⟩)) (.node (.single ⟨3200,3264,22528,22592⟩) (.node (.single ⟨3200,3264,22592,22656⟩) (.single ⟨3264,3328,22528,22592⟩)))) (.node (.node (.single ⟨3264,3328,22592,22656⟩) (.single ⟨3200,3264,22656,22720⟩)) (.node (.single ⟨3200,3264,22720,22784⟩) (.node (.single ⟨3264,3328,22656,22720⟩) (.single ⟨3264,3328,22720,22784⟩))))) (.node (.node (.node (.single ⟨9984,10048,29440,29504⟩) (.single ⟨9984,10048,29504,29568⟩)) (.node (.single ⟨10048,10112,29440,29504⟩) (.node (.single ⟨10048,10112,29504,29568⟩) (.single ⟨9984,10112,29568,29696⟩)))) (.node (.node (.single ⟨10112,10176,29440,29504⟩) (.single ⟨10112,10176,29504,29568⟩)) (.node (.single ⟨10176,10240,29440,29504⟩) (.node (.single ⟨10176,10240,29504,29568⟩) (.single ⟨10112,10240,29568,29696⟩)))))) (.node (.node (.node (.node (.single ⟨22528,22656,3072,3200⟩) (.single ⟨22528,22592,3200,3264⟩)) (.node (.single ⟨22528,22592,3264,3328⟩) (.node (.single ⟨22592,22656,3200,3264⟩) (.single ⟨22592,22656,3264,3328⟩)))) (.node (.node (.single ⟨22656,22784,3072,3200⟩) (.single ⟨22656,22720,3200,3264⟩)) (.node (.single ⟨22656,22720,3264,3328⟩) (.node (.single ⟨22720,22784,3200,3264⟩) (.single ⟨22720,22784,3264,3328⟩))))) (.node (.node (.node (.single ⟨29440,29504,9984,10048⟩) (.single ⟨29440,29504,10048,10112⟩)) (.node (.single ⟨29504,29568,9984,10048⟩) (.node (.single ⟨29504,29568,10048,10112⟩) (.single ⟨29440,29504,10112,10176⟩)))) (.node (.node (.single ⟨29440,29504,10176,10240⟩) (.single ⟨29504,29568,10112,10176⟩)) (.node (.single ⟨29504,29568,10176,10240⟩) (.node (.single ⟨29568,29696,9984,10112⟩) (.single ⟨29568,29696,10112,10240⟩)))))))
def output110 : Fin 40 → GridBox := outputData110.get
def coverData110 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 25) (.single 38)) (.node (.single 14) (.node (.single 2) (.single 21))))) (.node (.node (.node (.single 37) (.single 18)) (.node (.single 3) (.node (.single 23) (.single 36)))) (.node (.node (.single 16) (.single 6)) (.node (.single 26) (.node (.single 33) (.single 13)))))) (.node (.node (.node (.node (.single 7) (.single 28)) (.node (.single 32) (.node (.single 11) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 8) (.node (.single 27) (.single 31)))) (.node (.node (.single 12) (.single 9)) (.node (.single 29) (.node (.single 30) (.single 10)))))))
def sourceData110 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 12) (.single 24)))) (.node (.node (.single 28) (.single 16)) (.node (.single 20) (.node (.single 32) (.single 36))))) (.node (.node (.node (.single 39) (.single 23)) (.node (.single 35) (.node (.single 19) (.single 7)))) (.node (.node (.single 31) (.single 15)) (.node (.single 27) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 25) (.node (.single 13) (.single 29)))) (.node (.node (.single 5) (.single 17)) (.node (.single 33) (.node (.single 21) (.single 37))))) (.node (.node (.node (.single 38) (.single 34)) (.node (.single 22) (.node (.single 18) (.single 30)))) (.node (.node (.single 26) (.single 14)) (.node (.single 10) (.node (.single 6) (.single 2)))))))
def cover110 (i : Fin 40) : Fin 40 := ⟨coverData110.get i % 40, Nat.mod_lt _ (by decide)⟩
def source110 (i : Fin 40) : Fin 40 := ⟨sourceData110.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree110 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 .empty (.cutX 3072 .empty (.cutY 23552 (.cutX 3584 (.cutY 23040 (.cutX 3328 (.cutY 22784 (.cutX 3200 (.cutY 22656 .full .full) (.cutY 22656 (.cutX 3264 (.cutY 22592 .full .full) (.cutY 22592 .full .full)) (.cutX 3264 (.cutY 22720 .full .full) (.cutY 22720 .full .full)))) .empty) .empty) .empty) .empty) .empty))))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 (.cutY 30720 (.cutX 9216 .empty (.cutY 29696 (.cutX 9728 .empty (.cutY 29184 .empty (.cutX 9984 .empty (.cutY 29440 .empty (.cutX 10112 (.cutY 29568 (.cutX 10048 (.cutY 29504 .full .full) (.cutY 29504 .full .full)) .full) (.cutY 29568 (.cutX 10176 (.cutY 29504 .full .full) (.cutY 29504 .full .full)) .full)))))) .empty)) .empty) .empty)) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 .empty (.cutY 2048 .empty (.cutX 23552 (.cutY 3072 .empty (.cutX 23040 (.cutY 3584 (.cutX 22784 (.cutY 3328 (.cutX 22656 (.cutY 3200 .full (.cutX 22592 (.cutY 3264 .full .full) (.cutY 3264 .full .full))) (.cutY 3200 .full (.cutX 22720 (.cutY 3264 .full .full) (.cutY 3264 .full .full)))) .empty) .empty) .empty) .empty)) .empty))) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 (.cutX 29696 (.cutY 9216 .empty (.cutX 29184 .empty (.cutY 9728 .empty (.cutX 29440 .empty (.cutY 9984 .empty (.cutX 29568 (.cutY 10112 (.cutX 29504 (.cutY 10048 .full .full) (.cutY 10048 .full .full)) (.cutX 29504 (.cutY 10176 .full .full) (.cutY 10176 .full .full))) (.cutY 10112 .full .full))))))) .empty) .empty) .empty) .empty)))) .empty))

theorem metadata110 : 0<77641223 ∧ 12<128 ∧ 88<128 ∧ 0<4 ∧
    1480/4160=0 ∧ 1480%4160=1480 ∧ ∀ i, (leaves110 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData110).mp
    (by decide +kernel)

theorem sourceChecked110_0 : ∀ i : Fin 40,
    (fun i => output110 i = raw110 (source110 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked110 : ∀ i : Fin 40, (fun i => output110 i = raw110 (source110 i)) i :=
  forallFin_of_zero_offset (fun i => output110 i = raw110 (source110 i)) sourceChecked110_0

theorem coverChecked110_0 : ∀ i : Fin 40,
    (fun i => (output110 (cover110 i)).ContainsBox (raw110 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked110 : ∀ i : Fin 40, (fun i => (output110 (cover110 i)).ContainsBox (raw110 i)) i :=
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

noncomputable def phaseMass110 : ℝ := singlePhaseMass (77641223/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw110 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass110_eq : phaseMass110 = (77641223/1638400000000 : ℝ) := by
  unfold phaseMass110
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw110 output110 cover110 source110
    (gridTreeUnionCheck_sound 32768 raw110 output110 cover110 source110 tree110 checked110)
    _ (by norm_num) _, areaUnits110]
  norm_num

-- Frozen phase 6821, atom 5844, type 1, source (14,88).
def leavesData111 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,2,2⟩)) (.node (.single ⟨2,2,3⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves111 : Fin 10 → DyadicLeaf := leavesData111.get
def raw111 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 14 88 leaves111 i
def outputData111 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨3584,3712,22528,22656⟩) (.single ⟨3584,3712,22656,22784⟩)) (.node (.single ⟨3712,3776,22528,22592⟩) (.node (.single ⟨3712,3776,22592,22656⟩) (.single ⟨3776,3840,22528,22592⟩)))) (.node (.node (.single ⟨3776,3840,22592,22656⟩) (.single ⟨3712,3776,22656,22720⟩)) (.node (.single ⟨3712,3776,22720,22784⟩) (.node (.single ⟨3776,3840,22656,22720⟩) (.single ⟨3776,3840,22720,22784⟩))))) (.node (.node (.node (.single ⟨9984,10048,28928,28992⟩) (.single ⟨9984,10048,28992,29056⟩)) (.node (.single ⟨10048,10112,28928,28992⟩) (.node (.single ⟨10048,10112,28992,29056⟩) (.single ⟨9984,10112,29056,29184⟩)))) (.node (.node (.single ⟨10112,10176,28928,28992⟩) (.single ⟨10112,10176,28992,29056⟩)) (.node (.single ⟨10176,10240,28928,28992⟩) (.node (.single ⟨10176,10240,28992,29056⟩) (.single ⟨10112,10240,29056,29184⟩)))))) (.node (.node (.node (.node (.single ⟨22528,22656,3584,3712⟩) (.single ⟨22528,22592,3712,3776⟩)) (.node (.single ⟨22528,22592,3776,3840⟩) (.node (.single ⟨22592,22656,3712,3776⟩) (.single ⟨22592,22656,3776,3840⟩)))) (.node (.node (.single ⟨22656,22784,3584,3712⟩) (.single ⟨22656,22720,3712,3776⟩)) (.node (.single ⟨22656,22720,3776,3840⟩) (.node (.single ⟨22720,22784,3712,3776⟩) (.single ⟨22720,22784,3776,3840⟩))))) (.node (.node (.node (.single ⟨28928,28992,9984,10048⟩) (.single ⟨28928,28992,10048,10112⟩)) (.node (.single ⟨28992,29056,9984,10048⟩) (.node (.single ⟨28992,29056,10048,10112⟩) (.single ⟨28928,28992,10112,10176⟩)))) (.node (.node (.single ⟨28928,28992,10176,10240⟩) (.single ⟨28992,29056,10112,10176⟩)) (.node (.single ⟨28992,29056,10176,10240⟩) (.node (.single ⟨29056,29184,9984,10112⟩) (.single ⟨29056,29184,10112,10240⟩)))))))
def output111 : Fin 40 → GridBox := outputData111.get
def coverData111 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 25) (.single 38)) (.node (.single 14) (.node (.single 2) (.single 21))))) (.node (.node (.node (.single 37) (.single 18)) (.node (.single 3) (.node (.single 23) (.single 36)))) (.node (.node (.single 16) (.single 4)) (.node (.single 22) (.node (.single 35) (.single 17)))))) (.node (.node (.node (.node (.single 5) (.single 24)) (.node (.single 34) (.node (.single 15) (.single 6)))) (.node (.node (.single 26) (.single 33)) (.node (.single 13) (.node (.single 7) (.single 28))))) (.node (.node (.node (.single 32) (.single 11)) (.node (.single 8) (.node (.single 27) (.single 31)))) (.node (.node (.single 12) (.single 9)) (.node (.single 29) (.node (.single 30) (.single 10)))))))
def sourceData111 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 12) (.single 16)))) (.node (.node (.single 20) (.single 24)) (.node (.single 28) (.node (.single 32) (.single 36))))) (.node (.node (.node (.single 39) (.single 31)) (.node (.single 35) (.node (.single 27) (.single 7)))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 17) (.node (.single 13) (.single 21)))) (.node (.node (.single 5) (.single 25)) (.node (.single 33) (.node (.single 29) (.single 37))))) (.node (.node (.node (.single 38) (.single 34)) (.node (.single 30) (.node (.single 26) (.single 22)))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.node (.single 6) (.single 2)))))))
def cover111 (i : Fin 40) : Fin 40 := ⟨coverData111.get i % 40, Nat.mod_lt _ (by decide)⟩
def source111 (i : Fin 40) : Fin 40 := ⟨sourceData111.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree111 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 .empty (.cutX 3072 .empty (.cutY 23552 (.cutX 3584 .empty (.cutY 23040 (.cutX 3840 (.cutY 22784 (.cutX 3712 (.cutY 22656 .full .full) (.cutY 22656 (.cutX 3776 (.cutY 22592 .full .full) (.cutY 22592 .full .full)) (.cutX 3776 (.cutY 22720 .full .full) (.cutY 22720 .full .full)))) .empty) .empty) .empty)) .empty))))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 (.cutY 30720 (.cutX 9216 .empty (.cutY 29696 (.cutX 9728 .empty (.cutY 29184 (.cutX 9984 .empty (.cutY 28928 .empty (.cutX 10112 (.cutY 29056 (.cutX 10048 (.cutY 28992 .full .full) (.cutY 28992 .full .full)) .full) (.cutY 29056 (.cutX 10176 (.cutY 28992 .full .full) (.cutY 28992 .full .full)) .full)))) .empty)) .empty)) .empty) .empty)) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 .empty (.cutY 2048 .empty (.cutX 23552 (.cutY 3072 .empty (.cutX 23040 (.cutY 3584 .empty (.cutX 22784 (.cutY 3840 (.cutX 22656 (.cutY 3712 .full (.cutX 22592 (.cutY 3776 .full .full) (.cutY 3776 .full .full))) (.cutY 3712 .full (.cutX 22720 (.cutY 3776 .full .full) (.cutY 3776 .full .full)))) .empty) .empty)) .empty)) .empty))) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 (.cutX 29696 (.cutY 9216 .empty (.cutX 29184 (.cutY 9728 .empty (.cutX 28928 .empty (.cutY 9984 .empty (.cutX 29056 (.cutY 10112 (.cutX 28992 (.cutY 10048 .full .full) (.cutY 10048 .full .full)) (.cutX 28992 (.cutY 10176 .full .full) (.cutY 10176 .full .full))) (.cutY 10112 .full .full))))) .empty)) .empty) .empty) .empty) .empty)))) .empty))

theorem metadata111 : 0<112823226 ∧ 14<128 ∧ 88<128 ∧ 1<4 ∧
    5844/4160=1 ∧ 5844%4160=1684 ∧ ∀ i, (leaves111 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData111).mp
    (by decide +kernel)

theorem sourceChecked111_0 : ∀ i : Fin 40,
    (fun i => output111 i = raw111 (source111 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked111 : ∀ i : Fin 40, (fun i => output111 i = raw111 (source111 i)) i :=
  forallFin_of_zero_offset (fun i => output111 i = raw111 (source111 i)) sourceChecked111_0

theorem coverChecked111_0 : ∀ i : Fin 40,
    (fun i => (output111 (cover111 i)).ContainsBox (raw111 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked111 : ∀ i : Fin 40, (fun i => (output111 (cover111 i)).ContainsBox (raw111 i)) i :=
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

noncomputable def phaseMass111 : ℝ := singlePhaseMass (112823226/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw111 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass111_eq : phaseMass111 = (56411613/819200000000 : ℝ) := by
  unfold phaseMass111
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw111 output111 cover111 source111
    (gridTreeUnionCheck_sound 32768 raw111 output111 cover111 source111 tree111 checked111)
    _ (by norm_num) _, areaUnits111]
  norm_num

-- Frozen phase 6822, atom 1264, type 0, source (10,84).
def leavesData112 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,2,2⟩)) (.node (.single ⟨2,2,3⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves112 : Fin 10 → DyadicLeaf := leavesData112.get
def raw112 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 10 84 leaves112 i
def outputData112 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨2560,2688,21504,21632⟩) (.single ⟨2560,2688,21632,21760⟩)) (.node (.single ⟨2688,2752,21504,21568⟩) (.node (.single ⟨2688,2752,21568,21632⟩) (.single ⟨2752,2816,21504,21568⟩)))) (.node (.node (.single ⟨2752,2816,21568,21632⟩) (.single ⟨2688,2752,21632,21696⟩)) (.node (.single ⟨2688,2752,21696,21760⟩) (.node (.single ⟨2752,2816,21632,21696⟩) (.single ⟨2752,2816,21696,21760⟩))))) (.node (.node (.node (.single ⟨11008,11072,29952,30016⟩) (.single ⟨11008,11072,30016,30080⟩)) (.node (.single ⟨11072,11136,29952,30016⟩) (.node (.single ⟨11072,11136,30016,30080⟩) (.single ⟨11008,11136,30080,30208⟩)))) (.node (.node (.single ⟨11136,11200,29952,30016⟩) (.single ⟨11136,11200,30016,30080⟩)) (.node (.single ⟨11200,11264,29952,30016⟩) (.node (.single ⟨11200,11264,30016,30080⟩) (.single ⟨11136,11264,30080,30208⟩)))))) (.node (.node (.node (.node (.single ⟨21504,21632,2560,2688⟩) (.single ⟨21504,21568,2688,2752⟩)) (.node (.single ⟨21504,21568,2752,2816⟩) (.node (.single ⟨21568,21632,2688,2752⟩) (.single ⟨21568,21632,2752,2816⟩)))) (.node (.node (.single ⟨21632,21760,2560,2688⟩) (.single ⟨21632,21696,2688,2752⟩)) (.node (.single ⟨21632,21696,2752,2816⟩) (.node (.single ⟨21696,21760,2688,2752⟩) (.single ⟨21696,21760,2752,2816⟩))))) (.node (.node (.node (.single ⟨29952,30016,11008,11072⟩) (.single ⟨29952,30016,11072,11136⟩)) (.node (.single ⟨30016,30080,11008,11072⟩) (.node (.single ⟨30016,30080,11072,11136⟩) (.single ⟨29952,30016,11136,11200⟩)))) (.node (.node (.single ⟨29952,30016,11200,11264⟩) (.single ⟨30016,30080,11136,11200⟩)) (.node (.single ⟨30016,30080,11200,11264⟩) (.node (.single ⟨30080,30208,11008,11136⟩) (.single ⟨30080,30208,11136,11264⟩)))))))
def output112 : Fin 40 → GridBox := outputData112.get
def coverData112 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 25) (.single 38)) (.node (.single 14) (.node (.single 2) (.single 21))))) (.node (.node (.node (.single 37) (.single 18)) (.node (.single 3) (.node (.single 23) (.single 36)))) (.node (.node (.single 16) (.single 4)) (.node (.single 22) (.node (.single 35) (.single 17)))))) (.node (.node (.node (.node (.single 5) (.single 24)) (.node (.single 34) (.node (.single 15) (.single 6)))) (.node (.node (.single 26) (.single 33)) (.node (.single 13) (.node (.single 7) (.single 28))))) (.node (.node (.node (.single 32) (.single 11)) (.node (.single 8) (.node (.single 27) (.single 31)))) (.node (.node (.single 12) (.single 9)) (.node (.single 29) (.node (.single 30) (.single 10)))))))
def sourceData112 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 12) (.single 16)))) (.node (.node (.single 20) (.single 24)) (.node (.single 28) (.node (.single 32) (.single 36))))) (.node (.node (.node (.single 39) (.single 31)) (.node (.single 35) (.node (.single 27) (.single 7)))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 17) (.node (.single 13) (.single 21)))) (.node (.node (.single 5) (.single 25)) (.node (.single 33) (.node (.single 29) (.single 37))))) (.node (.node (.node (.single 38) (.single 34)) (.node (.single 30) (.node (.single 26) (.single 22)))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.node (.single 6) (.single 2)))))))
def cover112 (i : Fin 40) : Fin 40 := ⟨coverData112.get i % 40, Nat.mod_lt _ (by decide)⟩
def source112 (i : Fin 40) : Fin 40 := ⟨sourceData112.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree112 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 (.cutY 21504 .empty (.cutX 2560 .empty (.cutY 22016 (.cutX 2816 (.cutY 21760 (.cutX 2688 (.cutY 21632 .full .full) (.cutY 21632 (.cutX 2752 (.cutY 21568 .full .full) (.cutY 21568 .full .full)) (.cutX 2752 (.cutY 21696 .full .full) (.cutY 21696 .full .full)))) .empty) .empty) .empty))) .empty) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 (.cutY 29696 .empty (.cutX 10752 .empty (.cutY 30208 (.cutX 11008 .empty (.cutY 29952 .empty (.cutX 11136 (.cutY 30080 (.cutX 11072 (.cutY 30016 .full .full) (.cutY 30016 .full .full)) .full) (.cutY 30080 (.cutX 11200 (.cutY 30016 .full .full) (.cutY 30016 .full .full)) .full)))) .empty))) .empty) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 .empty (.cutY 3072 (.cutX 22016 (.cutY 2560 .empty (.cutX 21760 (.cutY 2816 (.cutX 21632 (.cutY 2688 .full (.cutX 21568 (.cutY 2752 .full .full) (.cutY 2752 .full .full))) (.cutY 2688 .full (.cutX 21696 (.cutY 2752 .full .full) (.cutY 2752 .full .full)))) .empty) .empty)) .empty) .empty))) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 .empty (.cutY 11264 (.cutX 30208 (.cutY 10752 .empty (.cutX 29952 .empty (.cutY 11008 .empty (.cutX 30080 (.cutY 11136 (.cutX 30016 (.cutY 11072 .full .full) (.cutY 11072 .full .full)) (.cutX 30016 (.cutY 11200 .full .full) (.cutY 11200 .full .full))) (.cutY 11136 .full .full))))) .empty) .empty))) .empty) .empty)))) .empty))

theorem metadata112 : 0<72090291 ∧ 10<128 ∧ 84<128 ∧ 0<4 ∧
    1264/4160=0 ∧ 1264%4160=1264 ∧ ∀ i, (leaves112 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData112).mp
    (by decide +kernel)

theorem sourceChecked112_0 : ∀ i : Fin 40,
    (fun i => output112 i = raw112 (source112 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked112 : ∀ i : Fin 40, (fun i => output112 i = raw112 (source112 i)) i :=
  forallFin_of_zero_offset (fun i => output112 i = raw112 (source112 i)) sourceChecked112_0

theorem coverChecked112_0 : ∀ i : Fin 40,
    (fun i => (output112 (cover112 i)).ContainsBox (raw112 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked112 : ∀ i : Fin 40, (fun i => (output112 (cover112 i)).ContainsBox (raw112 i)) i :=
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

noncomputable def phaseMass112 : ℝ := singlePhaseMass (72090291/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw112 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass112_eq : phaseMass112 = (72090291/1638400000000 : ℝ) := by
  unfold phaseMass112
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw112 output112 cover112 source112
    (gridTreeUnionCheck_sound 32768 raw112 output112 cover112 source112 tree112 checked112)
    _ (by norm_num) _, areaUnits112]
  norm_num

-- Frozen phase 6823, atom 1154, type 0, source (9,83).
def leavesData113 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves113 : Fin 7 → DyadicLeaf := leavesData113.get
def raw113 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 9 83 leaves113 i
def outputData113 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨2304,2432,21248,21376⟩) (.node (.single ⟨2304,2432,21376,21504⟩) (.single ⟨2432,2496,21248,21312⟩))) (.node (.node (.single ⟨2432,2496,21312,21376⟩) (.single ⟨2496,2560,21248,21312⟩)) (.node (.single ⟨2496,2560,21312,21376⟩) (.single ⟨2432,2560,21376,21504⟩)))) (.node (.node (.single ⟨11264,11392,30208,30336⟩) (.node (.single ⟨11264,11392,30336,30464⟩) (.single ⟨11392,11456,30208,30272⟩))) (.node (.node (.single ⟨11392,11456,30272,30336⟩) (.single ⟨11456,11520,30208,30272⟩)) (.node (.single ⟨11456,11520,30272,30336⟩) (.single ⟨11392,11520,30336,30464⟩))))) (.node (.node (.node (.single ⟨21248,21376,2304,2432⟩) (.node (.single ⟨21248,21312,2432,2496⟩) (.single ⟨21248,21312,2496,2560⟩))) (.node (.node (.single ⟨21312,21376,2432,2496⟩) (.single ⟨21312,21376,2496,2560⟩)) (.node (.single ⟨21376,21504,2304,2432⟩) (.single ⟨21376,21504,2432,2560⟩)))) (.node (.node (.single ⟨30208,30336,11264,11392⟩) (.node (.single ⟨30208,30272,11392,11456⟩) (.single ⟨30208,30272,11456,11520⟩))) (.node (.node (.single ⟨30272,30336,11392,11456⟩) (.single ⟨30272,30336,11456,11520⟩)) (.node (.single ⟨30336,30464,11264,11392⟩) (.single ⟨30336,30464,11392,11520⟩))))))
def output113 : Fin 28 → GridBox := outputData113.get
def coverData113 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData113 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover113 (i : Fin 28) : Fin 28 := ⟨coverData113.get i % 28, Nat.mod_lt _ (by decide)⟩
def source113 (i : Fin 28) : Fin 28 := ⟨sourceData113.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree113 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 (.cutY 21504 (.cutX 2560 (.cutY 20992 .empty (.cutX 2304 .empty (.cutY 21248 .empty (.cutX 2432 (.cutY 21376 .full .full) (.cutY 21376 (.cutX 2496 (.cutY 21312 .full .full) (.cutY 21312 .full .full)) .full))))) .empty) .empty) .empty) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 .empty (.cutY 29696 .empty (.cutX 11776 (.cutY 30208 .empty (.cutX 11520 (.cutY 30464 (.cutX 11392 (.cutY 30336 .full .full) (.cutY 30336 (.cutX 11456 (.cutY 30272 .full .full) (.cutY 30272 .full .full)) .full)) .empty) .empty)) .empty))) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 (.cutY 3072 (.cutX 20992 .empty (.cutY 2560 (.cutX 21248 .empty (.cutY 2304 .empty (.cutX 21376 (.cutY 2432 .full (.cutX 21312 (.cutY 2496 .full .full) (.cutY 2496 .full .full))) (.cutY 2432 .full .full)))) .empty)) .empty) .empty)) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 .empty (.cutY 11264 .empty (.cutX 30208 .empty (.cutY 11776 (.cutX 30464 (.cutY 11520 (.cutX 30336 (.cutY 11392 .full (.cutX 30272 (.cutY 11456 .full .full) (.cutY 11456 .full .full))) (.cutY 11392 .full .full)) .empty) .empty) .empty))))) .empty) .empty)))) .empty))

theorem metadata113 : 0<72090291 ∧ 9<128 ∧ 83<128 ∧ 0<4 ∧
    1154/4160=0 ∧ 1154%4160=1154 ∧ ∀ i, (leaves113 i).Valid 8 := by
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

noncomputable def phaseMass113 : ℝ := singlePhaseMass (72090291/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw113 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass113_eq : phaseMass113 = (72090291/1638400000000 : ℝ) := by
  unfold phaseMass113
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw113 output113 cover113 source113
    (gridTreeUnionCheck_sound 32768 raw113 output113 cover113 source113 tree113 checked113)
    _ (by norm_num) _, areaUnits113]
  norm_num

-- Frozen phase 6824, atom 5636, type 1, source (12,84).
def leavesData114 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves114 : Fin 7 → DyadicLeaf := leavesData114.get
def raw114 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 12 84 leaves114 i
def outputData114 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3072,3200,21504,21632⟩) (.node (.single ⟨3072,3200,21632,21760⟩) (.single ⟨3200,3264,21504,21568⟩))) (.node (.node (.single ⟨3200,3264,21568,21632⟩) (.single ⟨3264,3328,21504,21568⟩)) (.node (.single ⟨3264,3328,21568,21632⟩) (.single ⟨3200,3328,21632,21760⟩)))) (.node (.node (.single ⟨11008,11136,29440,29568⟩) (.node (.single ⟨11008,11136,29568,29696⟩) (.single ⟨11136,11200,29440,29504⟩))) (.node (.node (.single ⟨11136,11200,29504,29568⟩) (.single ⟨11200,11264,29440,29504⟩)) (.node (.single ⟨11200,11264,29504,29568⟩) (.single ⟨11136,11264,29568,29696⟩))))) (.node (.node (.node (.single ⟨21504,21632,3072,3200⟩) (.node (.single ⟨21504,21568,3200,3264⟩) (.single ⟨21504,21568,3264,3328⟩))) (.node (.node (.single ⟨21568,21632,3200,3264⟩) (.single ⟨21568,21632,3264,3328⟩)) (.node (.single ⟨21632,21760,3072,3200⟩) (.single ⟨21632,21760,3200,3328⟩)))) (.node (.node (.single ⟨29440,29568,11008,11136⟩) (.node (.single ⟨29440,29504,11136,11200⟩) (.single ⟨29440,29504,11200,11264⟩))) (.node (.node (.single ⟨29504,29568,11136,11200⟩) (.single ⟨29504,29568,11200,11264⟩)) (.node (.single ⟨29568,29696,11008,11136⟩) (.single ⟨29568,29696,11136,11264⟩))))))
def output114 : Fin 28 → GridBox := outputData114.get
def coverData114 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData114 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover114 (i : Fin 28) : Fin 28 := ⟨coverData114.get i % 28, Nat.mod_lt _ (by decide)⟩
def source114 (i : Fin 28) : Fin 28 := ⟨sourceData114.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree114 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 .empty (.cutY 21504 .empty (.cutX 3584 (.cutY 22016 (.cutX 3328 (.cutY 21760 (.cutX 3200 (.cutY 21632 .full .full) (.cutY 21632 (.cutX 3264 (.cutY 21568 .full .full) (.cutY 21568 .full .full)) .full)) .empty) .empty) .empty) .empty))) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 (.cutY 29696 (.cutX 10752 .empty (.cutY 29184 .empty (.cutX 11008 .empty (.cutY 29440 .empty (.cutX 11136 (.cutY 29568 .full .full) (.cutY 29568 (.cutX 11200 (.cutY 29504 .full .full) (.cutY 29504 .full .full)) .full)))))) .empty) .empty) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 .empty (.cutY 3072 .empty (.cutX 22016 (.cutY 3584 (.cutX 21760 (.cutY 3328 (.cutX 21632 (.cutY 3200 .full (.cutX 21568 (.cutY 3264 .full .full) (.cutY 3264 .full .full))) (.cutY 3200 .full .full)) .empty) .empty) .empty) .empty)))) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 (.cutY 11264 (.cutX 29184 .empty (.cutY 10752 .empty (.cutX 29440 .empty (.cutY 11008 .empty (.cutX 29568 (.cutY 11136 .full (.cutX 29504 (.cutY 11200 .full .full) (.cutY 11200 .full .full))) (.cutY 11136 .full .full)))))) .empty) .empty)) .empty) .empty)))) .empty))

theorem metadata114 : 0<139307719 ∧ 12<128 ∧ 84<128 ∧ 1<4 ∧
    5636/4160=1 ∧ 5636%4160=1476 ∧ ∀ i, (leaves114 i).Valid 8 := by
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

noncomputable def phaseMass114 : ℝ := singlePhaseMass (139307719/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw114 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass114_eq : phaseMass114 = (139307719/1638400000000 : ℝ) := by
  unfold phaseMass114
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw114 output114 cover114 source114
    (gridTreeUnionCheck_sound 32768 raw114 output114 cover114 source114 tree114 checked114)
    _ (by norm_num) _, areaUnits114]
  norm_num

-- Frozen phase 6825, atom 1481, type 0, source (12,89).
def leavesData115 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves115 : Fin 7 → DyadicLeaf := leavesData115.get
def raw115 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 12 89 leaves115 i
def outputData115 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3072,3200,22784,22912⟩) (.node (.single ⟨3072,3200,22912,23040⟩) (.single ⟨3200,3264,22784,22848⟩))) (.node (.node (.single ⟨3200,3264,22848,22912⟩) (.single ⟨3264,3328,22784,22848⟩)) (.node (.single ⟨3264,3328,22848,22912⟩) (.single ⟨3200,3328,22912,23040⟩)))) (.node (.node (.single ⟨9728,9856,29440,29568⟩) (.node (.single ⟨9728,9856,29568,29696⟩) (.single ⟨9856,9920,29440,29504⟩))) (.node (.node (.single ⟨9856,9920,29504,29568⟩) (.single ⟨9920,9984,29440,29504⟩)) (.node (.single ⟨9920,9984,29504,29568⟩) (.single ⟨9856,9984,29568,29696⟩))))) (.node (.node (.node (.single ⟨22784,22912,3072,3200⟩) (.node (.single ⟨22784,22848,3200,3264⟩) (.single ⟨22784,22848,3264,3328⟩))) (.node (.node (.single ⟨22848,22912,3200,3264⟩) (.single ⟨22848,22912,3264,3328⟩)) (.node (.single ⟨22912,23040,3072,3200⟩) (.single ⟨22912,23040,3200,3328⟩)))) (.node (.node (.single ⟨29440,29568,9728,9856⟩) (.node (.single ⟨29440,29504,9856,9920⟩) (.single ⟨29440,29504,9920,9984⟩))) (.node (.node (.single ⟨29504,29568,9856,9920⟩) (.single ⟨29504,29568,9920,9984⟩)) (.node (.single ⟨29568,29696,9728,9856⟩) (.single ⟨29568,29696,9856,9984⟩))))))
def output115 : Fin 28 → GridBox := outputData115.get
def coverData115 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData115 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover115 (i : Fin 28) : Fin 28 := ⟨coverData115.get i % 28, Nat.mod_lt _ (by decide)⟩
def source115 (i : Fin 28) : Fin 28 := ⟨sourceData115.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree115 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 .empty (.cutX 3072 .empty (.cutY 23552 (.cutX 3584 (.cutY 23040 (.cutX 3328 (.cutY 22784 .empty (.cutX 3200 (.cutY 22912 .full .full) (.cutY 22912 (.cutX 3264 (.cutY 22848 .full .full) (.cutY 22848 .full .full)) .full))) .empty) .empty) .empty) .empty))))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 (.cutY 30720 (.cutX 9216 .empty (.cutY 29696 (.cutX 9728 .empty (.cutY 29184 .empty (.cutX 9984 (.cutY 29440 .empty (.cutX 9856 (.cutY 29568 .full .full) (.cutY 29568 (.cutX 9920 (.cutY 29504 .full .full) (.cutY 29504 .full .full)) .full))) .empty))) .empty)) .empty) .empty)) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 .empty (.cutY 2048 .empty (.cutX 23552 (.cutY 3072 .empty (.cutX 23040 (.cutY 3584 (.cutX 22784 .empty (.cutY 3328 (.cutX 22912 (.cutY 3200 .full (.cutX 22848 (.cutY 3264 .full .full) (.cutY 3264 .full .full))) (.cutY 3200 .full .full)) .empty)) .empty) .empty)) .empty))) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 (.cutX 29696 (.cutY 9216 .empty (.cutX 29184 .empty (.cutY 9728 .empty (.cutX 29440 .empty (.cutY 9984 (.cutX 29568 (.cutY 9856 .full (.cutX 29504 (.cutY 9920 .full .full) (.cutY 9920 .full .full))) (.cutY 9856 .full .full)) .empty))))) .empty) .empty) .empty) .empty)))) .empty))

theorem metadata115 : 0<77641223 ∧ 12<128 ∧ 89<128 ∧ 0<4 ∧
    1481/4160=0 ∧ 1481%4160=1481 ∧ ∀ i, (leaves115 i).Valid 8 := by
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

noncomputable def phaseMass115 : ℝ := singlePhaseMass (77641223/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw115 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass115_eq : phaseMass115 = (77641223/1638400000000 : ℝ) := by
  unfold phaseMass115
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw115 output115 cover115 source115
    (gridTreeUnionCheck_sound 32768 raw115 output115 cover115 source115 tree115 checked115)
    _ (by norm_num) _, areaUnits115]
  norm_num

-- Frozen phase 6826, atom 1586, type 0, source (13,91).
def leavesData116 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,2,2⟩)) (.node (.single ⟨2,2,3⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves116 : Fin 10 → DyadicLeaf := leavesData116.get
def raw116 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 13 91 leaves116 i
def outputData116 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨3328,3456,23296,23424⟩) (.single ⟨3328,3456,23424,23552⟩)) (.node (.single ⟨3456,3520,23296,23360⟩) (.node (.single ⟨3456,3520,23360,23424⟩) (.single ⟨3520,3584,23296,23360⟩)))) (.node (.node (.single ⟨3520,3584,23360,23424⟩) (.single ⟨3456,3520,23424,23488⟩)) (.node (.single ⟨3456,3520,23488,23552⟩) (.node (.single ⟨3520,3584,23424,23488⟩) (.single ⟨3520,3584,23488,23552⟩))))) (.node (.node (.node (.single ⟨9216,9280,29184,29248⟩) (.single ⟨9216,9280,29248,29312⟩)) (.node (.single ⟨9280,9344,29184,29248⟩) (.node (.single ⟨9280,9344,29248,29312⟩) (.single ⟨9216,9344,29312,29440⟩)))) (.node (.node (.single ⟨9344,9408,29184,29248⟩) (.single ⟨9344,9408,29248,29312⟩)) (.node (.single ⟨9408,9472,29184,29248⟩) (.node (.single ⟨9408,9472,29248,29312⟩) (.single ⟨9344,9472,29312,29440⟩)))))) (.node (.node (.node (.node (.single ⟨23296,23424,3328,3456⟩) (.single ⟨23296,23360,3456,3520⟩)) (.node (.single ⟨23296,23360,3520,3584⟩) (.node (.single ⟨23360,23424,3456,3520⟩) (.single ⟨23360,23424,3520,3584⟩)))) (.node (.node (.single ⟨23424,23552,3328,3456⟩) (.single ⟨23424,23488,3456,3520⟩)) (.node (.single ⟨23424,23488,3520,3584⟩) (.node (.single ⟨23488,23552,3456,3520⟩) (.single ⟨23488,23552,3520,3584⟩))))) (.node (.node (.node (.single ⟨29184,29248,9216,9280⟩) (.single ⟨29184,29248,9280,9344⟩)) (.node (.single ⟨29248,29312,9216,9280⟩) (.node (.single ⟨29248,29312,9280,9344⟩) (.single ⟨29184,29248,9344,9408⟩)))) (.node (.node (.single ⟨29184,29248,9408,9472⟩) (.single ⟨29248,29312,9344,9408⟩)) (.node (.single ⟨29248,29312,9408,9472⟩) (.node (.single ⟨29312,29440,9216,9344⟩) (.single ⟨29312,29440,9344,9472⟩)))))))
def output116 : Fin 40 → GridBox := outputData116.get
def coverData116 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 25) (.single 38)) (.node (.single 14) (.node (.single 2) (.single 21))))) (.node (.node (.node (.single 37) (.single 18)) (.node (.single 3) (.node (.single 23) (.single 36)))) (.node (.node (.single 16) (.single 4)) (.node (.single 22) (.node (.single 35) (.single 17)))))) (.node (.node (.node (.node (.single 5) (.single 24)) (.node (.single 34) (.node (.single 15) (.single 6)))) (.node (.node (.single 26) (.single 33)) (.node (.single 13) (.node (.single 7) (.single 28))))) (.node (.node (.node (.single 32) (.single 11)) (.node (.single 8) (.node (.single 27) (.single 31)))) (.node (.node (.single 12) (.single 9)) (.node (.single 29) (.node (.single 30) (.single 10)))))))
def sourceData116 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 12) (.single 16)))) (.node (.node (.single 20) (.single 24)) (.node (.single 28) (.node (.single 32) (.single 36))))) (.node (.node (.node (.single 39) (.single 31)) (.node (.single 35) (.node (.single 27) (.single 7)))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 17) (.node (.single 13) (.single 21)))) (.node (.node (.single 5) (.single 25)) (.node (.single 33) (.node (.single 29) (.single 37))))) (.node (.node (.node (.single 38) (.single 34)) (.node (.single 30) (.node (.single 26) (.single 22)))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.node (.single 6) (.single 2)))))))
def cover116 (i : Fin 40) : Fin 40 := ⟨coverData116.get i % 40, Nat.mod_lt _ (by decide)⟩
def source116 (i : Fin 40) : Fin 40 := ⟨sourceData116.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree116 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 .empty (.cutX 3072 .empty (.cutY 23552 (.cutX 3584 (.cutY 23040 .empty (.cutX 3328 .empty (.cutY 23296 .empty (.cutX 3456 (.cutY 23424 .full .full) (.cutY 23424 (.cutX 3520 (.cutY 23360 .full .full) (.cutY 23360 .full .full)) (.cutX 3520 (.cutY 23488 .full .full) (.cutY 23488 .full .full))))))) .empty) .empty))))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 (.cutY 30720 (.cutX 9216 .empty (.cutY 29696 (.cutX 9728 (.cutY 29184 .empty (.cutX 9472 (.cutY 29440 (.cutX 9344 (.cutY 29312 (.cutX 9280 (.cutY 29248 .full .full) (.cutY 29248 .full .full)) .full) (.cutY 29312 (.cutX 9408 (.cutY 29248 .full .full) (.cutY 29248 .full .full)) .full)) .empty) .empty)) .empty) .empty)) .empty) .empty)) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 .empty (.cutY 2048 .empty (.cutX 23552 (.cutY 3072 .empty (.cutX 23040 .empty (.cutY 3584 (.cutX 23296 .empty (.cutY 3328 .empty (.cutX 23424 (.cutY 3456 .full (.cutX 23360 (.cutY 3520 .full .full) (.cutY 3520 .full .full))) (.cutY 3456 .full (.cutX 23488 (.cutY 3520 .full .full) (.cutY 3520 .full .full)))))) .empty))) .empty))) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 (.cutX 29696 (.cutY 9216 .empty (.cutX 29184 .empty (.cutY 9728 (.cutX 29440 (.cutY 9472 (.cutX 29312 (.cutY 9344 (.cutX 29248 (.cutY 9280 .full .full) (.cutY 9280 .full .full)) (.cutX 29248 (.cutY 9408 .full .full) (.cutY 9408 .full .full))) (.cutY 9344 .full .full)) .empty) .empty) .empty))) .empty) .empty) .empty) .empty)))) .empty))

theorem metadata116 : 0<77641223 ∧ 13<128 ∧ 91<128 ∧ 0<4 ∧
    1586/4160=0 ∧ 1586%4160=1586 ∧ ∀ i, (leaves116 i).Valid 8 := by
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

noncomputable def phaseMass116 : ℝ := singlePhaseMass (77641223/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw116 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass116_eq : phaseMass116 = (77641223/1638400000000 : ℝ) := by
  unfold phaseMass116
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw116 output116 cover116 source116
    (gridTreeUnionCheck_sound 32768 raw116 output116 cover116 source116 tree116 checked116)
    _ (by norm_num) _, areaUnits116]
  norm_num

-- Frozen phase 6827, atom 6985, type 1, source (27,98).
def leavesData117 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves117 : Fin 7 → DyadicLeaf := leavesData117.get
def raw117 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 27 98 leaves117 i
def outputData117 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨6912,7040,25088,25216⟩) (.node (.single ⟨6912,7040,25216,25344⟩) (.single ⟨7040,7104,25088,25152⟩))) (.node (.node (.single ⟨7040,7104,25152,25216⟩) (.single ⟨7104,7168,25088,25152⟩)) (.node (.single ⟨7104,7168,25152,25216⟩) (.single ⟨7040,7168,25216,25344⟩)))) (.node (.node (.single ⟨7424,7552,25600,25728⟩) (.node (.single ⟨7424,7552,25728,25856⟩) (.single ⟨7552,7616,25600,25664⟩))) (.node (.node (.single ⟨7552,7616,25664,25728⟩) (.single ⟨7616,7680,25600,25664⟩)) (.node (.single ⟨7616,7680,25664,25728⟩) (.single ⟨7552,7680,25728,25856⟩))))) (.node (.node (.node (.single ⟨25088,25216,6912,7040⟩) (.node (.single ⟨25088,25152,7040,7104⟩) (.single ⟨25088,25152,7104,7168⟩))) (.node (.node (.single ⟨25152,25216,7040,7104⟩) (.single ⟨25152,25216,7104,7168⟩)) (.node (.single ⟨25216,25344,6912,7040⟩) (.single ⟨25216,25344,7040,7168⟩)))) (.node (.node (.single ⟨25600,25728,7424,7552⟩) (.node (.single ⟨25600,25664,7552,7616⟩) (.single ⟨25600,25664,7616,7680⟩))) (.node (.node (.single ⟨25664,25728,7552,7616⟩) (.single ⟨25664,25728,7616,7680⟩)) (.node (.single ⟨25728,25856,7424,7552⟩) (.single ⟨25728,25856,7552,7680⟩))))))
def output117 : Fin 28 → GridBox := outputData117.get
def coverData117 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData117 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover117 (i : Fin 28) : Fin 28 := ⟨coverData117.get i % 28, Nat.mod_lt _ (by decide)⟩
def source117 (i : Fin 28) : Fin 28 := ⟨sourceData117.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree117 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 .empty (.cutY 26624 (.cutX 7168 (.cutY 25600 (.cutX 6656 .empty (.cutY 25088 .empty (.cutX 6912 .empty (.cutY 25344 (.cutX 7040 (.cutY 25216 .full .full) (.cutY 25216 (.cutX 7104 (.cutY 25152 .full .full) (.cutY 25152 .full .full)) .full)) .empty)))) .empty) (.cutY 25600 .empty (.cutX 7680 (.cutY 26112 (.cutX 7424 .empty (.cutY 25856 (.cutX 7552 (.cutY 25728 .full .full) (.cutY 25728 (.cutX 7616 (.cutY 25664 .full .full) (.cutY 25664 .full .full)) .full)) .empty)) .empty) .empty))) .empty)) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 .empty (.cutX 25600 (.cutY 7168 (.cutX 25088 .empty (.cutY 6656 .empty (.cutX 25344 (.cutY 6912 .empty (.cutX 25216 (.cutY 7040 .full (.cutX 25152 (.cutY 7104 .full .full) (.cutY 7104 .full .full))) (.cutY 7040 .full .full))) .empty))) .empty) (.cutY 7168 .empty (.cutX 26112 (.cutY 7680 (.cutX 25856 (.cutY 7424 .empty (.cutX 25728 (.cutY 7552 .full (.cutX 25664 (.cutY 7616 .full .full) (.cutY 7616 .full .full))) (.cutY 7552 .full .full))) .empty) .empty) .empty)))) .empty)) .empty) .empty)) .empty))

theorem metadata117 : 0<48020332 ∧ 27<128 ∧ 98<128 ∧ 1<4 ∧
    6985/4160=1 ∧ 6985%4160=2825 ∧ ∀ i, (leaves117 i).Valid 8 := by
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

noncomputable def phaseMass117 : ℝ := singlePhaseMass (48020332/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw117 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass117_eq : phaseMass117 = (12005083/409600000000 : ℝ) := by
  unfold phaseMass117
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw117 output117 cover117 source117
    (gridTreeUnionCheck_sound 32768 raw117 output117 cover117 source117 tree117 checked117)
    _ (by norm_num) _, areaUnits117]
  norm_num

-- Frozen phase 6828, atom 5947, type 1, source (15,92).
def leavesData118 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves118 : Fin 7 → DyadicLeaf := leavesData118.get
def raw118 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 15 92 leaves118 i
def outputData118 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3840,3968,23552,23680⟩) (.node (.single ⟨3840,3968,23680,23808⟩) (.single ⟨3968,4032,23552,23616⟩))) (.node (.node (.single ⟨3968,4032,23616,23680⟩) (.single ⟨4032,4096,23552,23616⟩)) (.node (.single ⟨4032,4096,23616,23680⟩) (.single ⟨3968,4096,23680,23808⟩)))) (.node (.node (.single ⟨8960,9088,28672,28800⟩) (.node (.single ⟨8960,9088,28800,28928⟩) (.single ⟨9088,9152,28672,28736⟩))) (.node (.node (.single ⟨9088,9152,28736,28800⟩) (.single ⟨9152,9216,28672,28736⟩)) (.node (.single ⟨9152,9216,28736,28800⟩) (.single ⟨9088,9216,28800,28928⟩))))) (.node (.node (.node (.single ⟨23552,23680,3840,3968⟩) (.node (.single ⟨23552,23616,3968,4032⟩) (.single ⟨23552,23616,4032,4096⟩))) (.node (.node (.single ⟨23616,23680,3968,4032⟩) (.single ⟨23616,23680,4032,4096⟩)) (.node (.single ⟨23680,23808,3840,3968⟩) (.single ⟨23680,23808,3968,4096⟩)))) (.node (.node (.single ⟨28672,28800,8960,9088⟩) (.node (.single ⟨28672,28736,9088,9152⟩) (.single ⟨28672,28736,9152,9216⟩))) (.node (.node (.single ⟨28736,28800,9088,9152⟩) (.single ⟨28736,28800,9152,9216⟩)) (.node (.single ⟨28800,28928,8960,9088⟩) (.single ⟨28800,28928,9088,9216⟩))))))
def output118 : Fin 28 → GridBox := outputData118.get
def coverData118 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData118 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover118 (i : Fin 28) : Fin 28 := ⟨coverData118.get i % 28, Nat.mod_lt _ (by decide)⟩
def source118 (i : Fin 28) : Fin 28 := ⟨sourceData118.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree118 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 .empty (.cutX 3072 .empty (.cutY 23552 .empty (.cutX 3584 .empty (.cutY 24064 (.cutX 3840 .empty (.cutY 23808 (.cutX 3968 (.cutY 23680 .full .full) (.cutY 23680 (.cutX 4032 (.cutY 23616 .full .full) (.cutY 23616 .full .full)) .full)) .empty)) .empty))))))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 (.cutY 30720 (.cutX 9216 (.cutY 29696 (.cutX 8704 .empty (.cutY 29184 (.cutX 8960 .empty (.cutY 28928 (.cutX 9088 (.cutY 28800 .full .full) (.cutY 28800 (.cutX 9152 (.cutY 28736 .full .full) (.cutY 28736 .full .full)) .full)) .empty)) .empty)) .empty) .empty) .empty) .empty)) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 .empty (.cutY 2048 .empty (.cutX 23552 .empty (.cutY 3072 .empty (.cutX 24064 (.cutY 3584 .empty (.cutX 23808 (.cutY 3840 .empty (.cutX 23680 (.cutY 3968 .full (.cutX 23616 (.cutY 4032 .full .full) (.cutY 4032 .full .full))) (.cutY 3968 .full .full))) .empty)) .empty))))) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 (.cutX 29696 (.cutY 9216 (.cutX 29184 (.cutY 8704 .empty (.cutX 28928 (.cutY 8960 .empty (.cutX 28800 (.cutY 9088 .full (.cutX 28736 (.cutY 9152 .full .full) (.cutY 9152 .full .full))) (.cutY 9088 .full .full))) .empty)) .empty) .empty) .empty) .empty) .empty) .empty)))) .empty))

theorem metadata118 : 0<112823226 ∧ 15<128 ∧ 92<128 ∧ 1<4 ∧
    5947/4160=1 ∧ 5947%4160=1787 ∧ ∀ i, (leaves118 i).Valid 8 := by
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

noncomputable def phaseMass118 : ℝ := singlePhaseMass (112823226/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw118 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass118_eq : phaseMass118 = (56411613/819200000000 : ℝ) := by
  unfold phaseMass118
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw118 output118 cover118 source118
    (gridTreeUnionCheck_sound 32768 raw118 output118 cover118 source118 tree118 checked118)
    _ (by norm_num) _, areaUnits118]
  norm_num

-- Frozen phase 6829, atom 812, type 0, source (6,80).
def leavesData119 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves119 : Fin 4 → DyadicLeaf := leavesData119.get
def raw119 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 6 80 leaves119 i
def outputData119 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨1536,1664,20480,20608⟩) (.single ⟨1536,1664,20608,20736⟩)) (.node (.single ⟨1664,1792,20480,20608⟩) (.single ⟨1664,1792,20608,20736⟩))) (.node (.node (.single ⟨12032,12160,30976,31104⟩) (.single ⟨12032,12160,31104,31232⟩)) (.node (.single ⟨12160,12288,30976,31104⟩) (.single ⟨12160,12288,31104,31232⟩)))) (.node (.node (.node (.single ⟨20480,20608,1536,1664⟩) (.single ⟨20480,20608,1664,1792⟩)) (.node (.single ⟨20608,20736,1536,1664⟩) (.single ⟨20608,20736,1664,1792⟩))) (.node (.node (.single ⟨30976,31104,12032,12160⟩) (.single ⟨30976,31104,12160,12288⟩)) (.node (.single ⟨31104,31232,12032,12160⟩) (.single ⟨31104,31232,12160,12288⟩)))))
def output119 : Fin 16 → GridBox := outputData119.get
def coverData119 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData119 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover119 (i : Fin 16) : Fin 16 := ⟨coverData119.get i % 16, Nat.mod_lt _ (by decide)⟩
def source119 (i : Fin 16) : Fin 16 := ⟨sourceData119.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree119 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 (.cutY 22528 (.cutX 1024 .empty (.cutY 21504 (.cutX 1536 .empty (.cutY 20992 (.cutX 1792 (.cutY 20736 (.cutX 1664 (.cutY 20608 .full .full) (.cutY 20608 .full .full)) .empty) .empty) .empty)) .empty)) .empty) .empty)) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 .empty (.cutX 11264 .empty (.cutY 31744 (.cutX 11776 .empty (.cutY 31232 (.cutX 12032 .empty (.cutY 30976 .empty (.cutX 12160 (.cutY 31104 .full .full) (.cutY 31104 .full .full)))) .empty)) .empty))))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 (.cutX 21504 (.cutY 1024 .empty (.cutX 20992 (.cutY 1536 .empty (.cutX 20736 (.cutY 1792 (.cutX 20608 (.cutY 1664 .full .full) (.cutY 1664 .full .full)) .empty) .empty)) .empty)) .empty) .empty) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 .empty (.cutY 10240 .empty (.cutX 31744 (.cutY 11264 .empty (.cutX 31232 (.cutY 11776 .empty (.cutX 30976 .empty (.cutY 12032 .empty (.cutX 31104 (.cutY 12160 .full .full) (.cutY 12160 .full .full))))) .empty)) .empty))) .empty)))) .empty))

theorem metadata119 : 0<25614016 ∧ 6<128 ∧ 80<128 ∧ 0<4 ∧
    812/4160=0 ∧ 812%4160=812 ∧ ∀ i, (leaves119 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData119).mp
    (by decide +kernel)

theorem sourceChecked119_0 : ∀ i : Fin 16,
    (fun i => output119 i = raw119 (source119 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked119 : ∀ i : Fin 16, (fun i => output119 i = raw119 (source119 i)) i :=
  forallFin_of_zero_offset (fun i => output119 i = raw119 (source119 i)) sourceChecked119_0

theorem coverChecked119_0 : ∀ i : Fin 16,
    (fun i => (output119 (cover119 i)).ContainsBox (raw119 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked119 : ∀ i : Fin 16, (fun i => (output119 (cover119 i)).ContainsBox (raw119 i)) i :=
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

noncomputable def phaseMass119 : ℝ := singlePhaseMass (25614016/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw119 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass119_eq : phaseMass119 = (400219/25600000000 : ℝ) := by
  unfold phaseMass119
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw119 output119 cover119 source119
    (gridTreeUnionCheck_sound 32768 raw119 output119 cover119 source119 tree119 checked119)
    _ (by norm_num) _, areaUnits119]
  norm_num

-- Frozen phase 6830, atom 694, type 0, source (5,79).
def leavesData120 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves120 : Fin 7 → DyadicLeaf := leavesData120.get
def raw120 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 5 79 leaves120 i
def outputData120 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨1280,1408,20224,20352⟩) (.node (.single ⟨1280,1408,20352,20480⟩) (.single ⟨1408,1472,20224,20288⟩))) (.node (.node (.single ⟨1408,1472,20288,20352⟩) (.single ⟨1472,1536,20224,20288⟩)) (.node (.single ⟨1472,1536,20288,20352⟩) (.single ⟨1408,1536,20352,20480⟩)))) (.node (.node (.single ⟨12288,12416,31232,31360⟩) (.node (.single ⟨12288,12416,31360,31488⟩) (.single ⟨12416,12480,31232,31296⟩))) (.node (.node (.single ⟨12416,12480,31296,31360⟩) (.single ⟨12480,12544,31232,31296⟩)) (.node (.single ⟨12480,12544,31296,31360⟩) (.single ⟨12416,12544,31360,31488⟩))))) (.node (.node (.node (.single ⟨20224,20352,1280,1408⟩) (.node (.single ⟨20224,20288,1408,1472⟩) (.single ⟨20224,20288,1472,1536⟩))) (.node (.node (.single ⟨20288,20352,1408,1472⟩) (.single ⟨20288,20352,1472,1536⟩)) (.node (.single ⟨20352,20480,1280,1408⟩) (.single ⟨20352,20480,1408,1536⟩)))) (.node (.node (.single ⟨31232,31360,12288,12416⟩) (.node (.single ⟨31232,31296,12416,12480⟩) (.single ⟨31232,31296,12480,12544⟩))) (.node (.node (.single ⟨31296,31360,12416,12480⟩) (.single ⟨31296,31360,12480,12544⟩)) (.node (.single ⟨31360,31488,12288,12416⟩) (.single ⟨31360,31488,12416,12544⟩))))))
def output120 : Fin 28 → GridBox := outputData120.get
def coverData120 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData120 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover120 (i : Fin 28) : Fin 28 := ⟨coverData120.get i % 28, Nat.mod_lt _ (by decide)⟩
def source120 (i : Fin 28) : Fin 28 := ⟨sourceData120.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree120 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 .empty (.cutY 19456 .empty (.cutX 1536 (.cutY 19968 .empty (.cutX 1280 .empty (.cutY 20224 .empty (.cutX 1408 (.cutY 20352 .full .full) (.cutY 20352 (.cutX 1472 (.cutY 20288 .full .full) (.cutY 20288 .full .full)) .full))))) .empty)))) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 (.cutY 31744 (.cutX 12800 (.cutY 31232 .empty (.cutX 12544 (.cutY 31488 (.cutX 12416 (.cutY 31360 .full .full) (.cutY 31360 (.cutX 12480 (.cutY 31296 .full .full) (.cutY 31296 .full .full)) .full)) .empty) .empty)) .empty) .empty) .empty)) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 .empty (.cutY 1024 .empty (.cutX 19968 .empty (.cutY 1536 (.cutX 20224 .empty (.cutY 1280 .empty (.cutX 20352 (.cutY 1408 .full (.cutX 20288 (.cutY 1472 .full .full) (.cutY 1472 .full .full))) (.cutY 1408 .full .full)))) .empty)))) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 (.cutY 13312 (.cutX 31232 .empty (.cutY 12800 (.cutX 31488 (.cutY 12544 (.cutX 31360 (.cutY 12416 .full (.cutX 31296 (.cutY 12480 .full .full) (.cutY 12480 .full .full))) (.cutY 12416 .full .full)) .empty) .empty) .empty)) .empty) .empty) .empty)))))) .empty))

theorem metadata120 : 0<34183877 ∧ 5<128 ∧ 79<128 ∧ 0<4 ∧
    694/4160=0 ∧ 694%4160=694 ∧ ∀ i, (leaves120 i).Valid 8 := by
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

noncomputable def phaseMass120 : ℝ := singlePhaseMass (34183877/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw120 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass120_eq : phaseMass120 = (34183877/1638400000000 : ℝ) := by
  unfold phaseMass120
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw120 output120 cover120 source120
    (gridTreeUnionCheck_sound 32768 raw120 output120 cover120 source120 tree120 checked120)
    _ (by norm_num) _, areaUnits120]
  norm_num

-- Frozen phase 6831, atom 5086, type 1, source (7,79).
def leavesData121 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves121 : Fin 4 → DyadicLeaf := leavesData121.get
def raw121 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 7 79 leaves121 i
def outputData121 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨1792,1920,20224,20352⟩) (.single ⟨1792,1920,20352,20480⟩)) (.node (.single ⟨1920,2048,20224,20352⟩) (.single ⟨1920,2048,20352,20480⟩))) (.node (.node (.single ⟨12288,12416,30720,30848⟩) (.single ⟨12288,12416,30848,30976⟩)) (.node (.single ⟨12416,12544,30720,30848⟩) (.single ⟨12416,12544,30848,30976⟩)))) (.node (.node (.node (.single ⟨20224,20352,1792,1920⟩) (.single ⟨20224,20352,1920,2048⟩)) (.node (.single ⟨20352,20480,1792,1920⟩) (.single ⟨20352,20480,1920,2048⟩))) (.node (.node (.single ⟨30720,30848,12288,12416⟩) (.single ⟨30720,30848,12416,12544⟩)) (.node (.single ⟨30848,30976,12288,12416⟩) (.single ⟨30848,30976,12416,12544⟩)))))
def output121 : Fin 16 → GridBox := outputData121.get
def coverData121 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData121 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover121 (i : Fin 16) : Fin 16 := ⟨coverData121.get i % 16, Nat.mod_lt _ (by decide)⟩
def source121 (i : Fin 16) : Fin 16 := ⟨sourceData121.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree121 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 .empty (.cutY 19456 .empty (.cutX 1536 .empty (.cutY 19968 .empty (.cutX 1792 .empty (.cutY 20224 .empty (.cutX 1920 (.cutY 20352 .full .full) (.cutY 20352 .full .full))))))))) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 (.cutY 31744 (.cutX 12800 (.cutY 31232 (.cutX 12544 (.cutY 30976 (.cutX 12416 (.cutY 30848 .full .full) (.cutY 30848 .full .full)) .empty) .empty) .empty) .empty) .empty) .empty)) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 .empty (.cutY 1024 .empty (.cutX 19968 .empty (.cutY 1536 .empty (.cutX 20224 .empty (.cutY 1792 .empty (.cutX 20352 (.cutY 1920 .full .full) (.cutY 1920 .full .full)))))))) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 (.cutY 13312 (.cutX 31232 (.cutY 12800 (.cutX 30976 (.cutY 12544 (.cutX 30848 (.cutY 12416 .full .full) (.cutY 12416 .full .full)) .empty) .empty) .empty) .empty) .empty) .empty) .empty)))))) .empty))

theorem metadata121 : 0<137362203 ∧ 7<128 ∧ 79<128 ∧ 1<4 ∧
    5086/4160=1 ∧ 5086%4160=926 ∧ ∀ i, (leaves121 i).Valid 8 := by
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

noncomputable def phaseMass121 : ℝ := singlePhaseMass (137362203/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw121 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass121_eq : phaseMass121 = (137362203/1638400000000 : ℝ) := by
  unfold phaseMass121
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw121 output121 cover121 source121
    (gridTreeUnionCheck_sound 32768 raw121 output121 cover121 source121 tree121 checked121)
    _ (by norm_num) _, areaUnits121]
  norm_num

noncomputable def batchActualMass : ℝ := [phaseMass0,phaseMass1,phaseMass2,phaseMass3,phaseMass4,phaseMass5,phaseMass6,phaseMass7,phaseMass8,phaseMass9,phaseMass10,phaseMass11,phaseMass12,phaseMass13,phaseMass14,phaseMass15,phaseMass16,phaseMass17,phaseMass18,phaseMass19,phaseMass20,phaseMass21,phaseMass22,phaseMass23,phaseMass24,phaseMass25,phaseMass26,phaseMass27,phaseMass28,phaseMass29,phaseMass30,phaseMass31,phaseMass32,phaseMass33,phaseMass34,phaseMass35,phaseMass36,phaseMass37,phaseMass38,phaseMass39,phaseMass40,phaseMass41,phaseMass42,phaseMass43,phaseMass44,phaseMass45,phaseMass46,phaseMass47,phaseMass48,phaseMass49,phaseMass50,phaseMass51,phaseMass52,phaseMass53,phaseMass54,phaseMass55,phaseMass56,phaseMass57,phaseMass58,phaseMass59,phaseMass60,phaseMass61,phaseMass62,phaseMass63,phaseMass64,phaseMass65,phaseMass66,phaseMass67,phaseMass68,phaseMass69,phaseMass70,phaseMass71,phaseMass72,phaseMass73,phaseMass74,phaseMass75,phaseMass76,phaseMass77,phaseMass78,phaseMass79,phaseMass80,phaseMass81,phaseMass82,phaseMass83,phaseMass84,phaseMass85,phaseMass86,phaseMass87,phaseMass88,phaseMass89,phaseMass90,phaseMass91,phaseMass92,phaseMass93,phaseMass94,phaseMass95,phaseMass96,phaseMass97,phaseMass98,phaseMass99,phaseMass100,phaseMass101,phaseMass102,phaseMass103,phaseMass104,phaseMass105,phaseMass106,phaseMass107,phaseMass108,phaseMass109,phaseMass110,phaseMass111,phaseMass112,phaseMass113,phaseMass114,phaseMass115,phaseMass116,phaseMass117,phaseMass118,phaseMass119,phaseMass120,phaseMass121].sum

theorem actual_batch_mass : batchActualMass = (12414127701/1638400000000 : ℝ) := by
  unfold batchActualMass
  rw [phaseMass0_eq,phaseMass1_eq,phaseMass2_eq,phaseMass3_eq,phaseMass4_eq,phaseMass5_eq,phaseMass6_eq,phaseMass7_eq,phaseMass8_eq,phaseMass9_eq,phaseMass10_eq,phaseMass11_eq,phaseMass12_eq,phaseMass13_eq,phaseMass14_eq,phaseMass15_eq,phaseMass16_eq,phaseMass17_eq,phaseMass18_eq,phaseMass19_eq,phaseMass20_eq,phaseMass21_eq,phaseMass22_eq,phaseMass23_eq,phaseMass24_eq,phaseMass25_eq,phaseMass26_eq,phaseMass27_eq,phaseMass28_eq,phaseMass29_eq,phaseMass30_eq,phaseMass31_eq,phaseMass32_eq,phaseMass33_eq,phaseMass34_eq,phaseMass35_eq,phaseMass36_eq,phaseMass37_eq,phaseMass38_eq,phaseMass39_eq,phaseMass40_eq,phaseMass41_eq,phaseMass42_eq,phaseMass43_eq,phaseMass44_eq,phaseMass45_eq,phaseMass46_eq,phaseMass47_eq,phaseMass48_eq,phaseMass49_eq,phaseMass50_eq,phaseMass51_eq,phaseMass52_eq,phaseMass53_eq,phaseMass54_eq,phaseMass55_eq,phaseMass56_eq,phaseMass57_eq,phaseMass58_eq,phaseMass59_eq,phaseMass60_eq,phaseMass61_eq,phaseMass62_eq,phaseMass63_eq,phaseMass64_eq,phaseMass65_eq,phaseMass66_eq,phaseMass67_eq,phaseMass68_eq,phaseMass69_eq,phaseMass70_eq,phaseMass71_eq,phaseMass72_eq,phaseMass73_eq,phaseMass74_eq,phaseMass75_eq,phaseMass76_eq,phaseMass77_eq,phaseMass78_eq,phaseMass79_eq,phaseMass80_eq,phaseMass81_eq,phaseMass82_eq,phaseMass83_eq,phaseMass84_eq,phaseMass85_eq,phaseMass86_eq,phaseMass87_eq,phaseMass88_eq,phaseMass89_eq,phaseMass90_eq,phaseMass91_eq,phaseMass92_eq,phaseMass93_eq,phaseMass94_eq,phaseMass95_eq,phaseMass96_eq,phaseMass97_eq,phaseMass98_eq,phaseMass99_eq,phaseMass100_eq,phaseMass101_eq,phaseMass102_eq,phaseMass103_eq,phaseMass104_eq,phaseMass105_eq,phaseMass106_eq,phaseMass107_eq,phaseMass108_eq,phaseMass109_eq,phaseMass110_eq,phaseMass111_eq,phaseMass112_eq,phaseMass113_eq,phaseMass114_eq,phaseMass115_eq,phaseMass116_eq,phaseMass117_eq,phaseMass118_eq,phaseMass119_eq,phaseMass120_eq,phaseMass121_eq]
  norm_num

end NoThreeLine.ScheduleUnionBatch06710
#print axioms NoThreeLine.ScheduleUnionBatch06710.actual_batch_mass
