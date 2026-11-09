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
namespace NoThreeLine.ScheduleUnionBatch03896

-- Frozen phase 3896, atom 7090, type 1, source (29,59).
def leavesData0 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves0 : Fin 7 → DyadicLeaf := leavesData0.get
def raw0 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 29 59 leaves0 i
def outputData0 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨7424,7552,15104,15232⟩) (.node (.single ⟨7424,7552,15232,15360⟩) (.single ⟨7552,7616,15104,15168⟩))) (.node (.node (.single ⟨7552,7616,15168,15232⟩) (.single ⟨7616,7680,15104,15168⟩)) (.node (.single ⟨7616,7680,15168,15232⟩) (.single ⟨7552,7680,15232,15360⟩)))) (.node (.node (.single ⟨15104,15232,7424,7552⟩) (.node (.single ⟨15104,15168,7552,7616⟩) (.single ⟨15104,15168,7616,7680⟩))) (.node (.node (.single ⟨15168,15232,7552,7616⟩) (.single ⟨15168,15232,7616,7680⟩)) (.node (.single ⟨15232,15360,7424,7552⟩) (.single ⟨15232,15360,7552,7680⟩))))) (.node (.node (.node (.single ⟨17408,17536,25088,25216⟩) (.node (.single ⟨17408,17536,25216,25344⟩) (.single ⟨17536,17600,25088,25152⟩))) (.node (.node (.single ⟨17536,17600,25152,25216⟩) (.single ⟨17600,17664,25088,25152⟩)) (.node (.single ⟨17600,17664,25152,25216⟩) (.single ⟨17536,17664,25216,25344⟩)))) (.node (.node (.single ⟨25088,25216,17408,17536⟩) (.node (.single ⟨25088,25152,17536,17600⟩) (.single ⟨25088,25152,17600,17664⟩))) (.node (.node (.single ⟨25152,25216,17536,17600⟩) (.single ⟨25152,25216,17600,17664⟩)) (.node (.single ⟨25216,25344,17408,17536⟩) (.single ⟨25216,25344,17536,17664⟩))))))
def output0 : Fin 28 → GridBox := outputData0.get
def coverData0 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData0 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover0 (i : Fin 28) : Fin 28 := ⟨coverData0.get i % 28, Nat.mod_lt _ (by decide)⟩
def source0 (i : Fin 28) : Fin 28 := ⟨sourceData0.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree0 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 .empty (.cutY 14336 .empty (.cutX 7168 .empty (.cutY 15360 (.cutX 7680 (.cutY 14848 .empty (.cutX 7424 .empty (.cutY 15104 .empty (.cutX 7552 (.cutY 15232 .full .full) (.cutY 15232 (.cutX 7616 (.cutY 15168 .full .full) (.cutY 15168 .full .full)) .full))))) .empty) .empty))))))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 .empty (.cutY 6144 .empty (.cutX 15360 (.cutY 7168 .empty (.cutX 14848 .empty (.cutY 7680 (.cutX 15104 .empty (.cutY 7424 .empty (.cutX 15232 (.cutY 7552 .full (.cutX 15168 (.cutY 7616 .full .full) (.cutY 7616 .full .full))) (.cutY 7552 .full .full)))) .empty))) .empty))))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 (.cutY 26624 (.cutX 17408 .empty (.cutY 25600 (.cutX 17920 (.cutY 25088 .empty (.cutX 17664 (.cutY 25344 (.cutX 17536 (.cutY 25216 .full .full) (.cutY 25216 (.cutX 17600 (.cutY 25152 .full .full) (.cutY 25152 .full .full)) .full)) .empty) .empty)) .empty) .empty)) .empty) .empty) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 (.cutY 18432 (.cutX 25600 (.cutY 17408 .empty (.cutX 25088 .empty (.cutY 17920 (.cutX 25344 (.cutY 17664 (.cutX 25216 (.cutY 17536 .full (.cutX 25152 (.cutY 17600 .full .full) (.cutY 17600 .full .full))) (.cutY 17536 .full .full)) .empty) .empty) .empty))) .empty) .empty) .empty) .empty) .empty) .empty))))

theorem metadata0 : 0<69455300 ∧ 29<128 ∧ 59<128 ∧ 1<4 ∧
    7090/4160=1 ∧ 7090%4160=2930 ∧ ∀ i, (leaves0 i).Valid 8 := by
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

noncomputable def phaseMass0 : ℝ := singlePhaseMass (69455300/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw0 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass0_eq : phaseMass0 = (694553/16384000000 : ℝ) := by
  unfold phaseMass0
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw0 output0 cover0 source0
    (gridTreeUnionCheck_sound 32768 raw0 output0 cover0 source0 tree0 checked0)
    _ (by norm_num) _, areaUnits0]
  norm_num

-- Frozen phase 3897, atom 6099, type 1, source (17,52).
def leavesData1 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves1 : Fin 7 → DyadicLeaf := leavesData1.get
def raw1 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 17 52 leaves1 i
def outputData1 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨4352,4480,13312,13440⟩) (.node (.single ⟨4352,4480,13440,13568⟩) (.single ⟨4480,4544,13312,13376⟩))) (.node (.node (.single ⟨4480,4544,13376,13440⟩) (.single ⟨4544,4608,13312,13376⟩)) (.node (.single ⟨4544,4608,13376,13440⟩) (.single ⟨4480,4608,13440,13568⟩)))) (.node (.node (.single ⟨13312,13440,4352,4480⟩) (.node (.single ⟨13312,13376,4480,4544⟩) (.single ⟨13312,13376,4544,4608⟩))) (.node (.node (.single ⟨13376,13440,4480,4544⟩) (.single ⟨13376,13440,4544,4608⟩)) (.node (.single ⟨13440,13568,4352,4480⟩) (.single ⟨13440,13568,4480,4608⟩))))) (.node (.node (.node (.single ⟨19200,19328,28160,28288⟩) (.node (.single ⟨19200,19328,28288,28416⟩) (.single ⟨19328,19392,28160,28224⟩))) (.node (.node (.single ⟨19328,19392,28224,28288⟩) (.single ⟨19392,19456,28160,28224⟩)) (.node (.single ⟨19392,19456,28224,28288⟩) (.single ⟨19328,19456,28288,28416⟩)))) (.node (.node (.single ⟨28160,28288,19200,19328⟩) (.node (.single ⟨28160,28224,19328,19392⟩) (.single ⟨28160,28224,19392,19456⟩))) (.node (.node (.single ⟨28224,28288,19328,19392⟩) (.single ⟨28224,28288,19392,19456⟩)) (.node (.single ⟨28288,28416,19200,19328⟩) (.single ⟨28288,28416,19328,19456⟩))))))
def output1 : Fin 28 → GridBox := outputData1.get
def coverData1 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData1 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover1 (i : Fin 28) : Fin 28 := ⟨coverData1.get i % 28, Nat.mod_lt _ (by decide)⟩
def source1 (i : Fin 28) : Fin 28 := ⟨sourceData1.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree1 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 (.cutY 14336 (.cutX 5120 (.cutY 13312 .empty (.cutX 4608 (.cutY 13824 (.cutX 4352 .empty (.cutY 13568 (.cutX 4480 (.cutY 13440 .full .full) (.cutY 13440 (.cutX 4544 (.cutY 13376 .full .full) (.cutY 13376 .full .full)) .full)) .empty)) .empty) .empty)) .empty) .empty) .empty)))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 (.cutY 6144 (.cutX 13312 .empty (.cutY 5120 (.cutX 13824 (.cutY 4608 (.cutX 13568 (.cutY 4352 .empty (.cutX 13440 (.cutY 4480 .full (.cutX 13376 (.cutY 4544 .full .full) (.cutY 4544 .full .full))) (.cutY 4480 .full .full))) .empty) .empty) .empty) .empty)) .empty) .empty))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 .empty (.cutY 26624 .empty (.cutX 19456 (.cutY 27648 .empty (.cutX 18944 .empty (.cutY 28160 .empty (.cutX 19200 .empty (.cutY 28416 (.cutX 19328 (.cutY 28288 .full .full) (.cutY 28288 (.cutX 19392 (.cutY 28224 .full .full) (.cutY 28224 .full .full)) .full)) .empty))))) .empty))) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 .empty (.cutY 18432 .empty (.cutX 27648 .empty (.cutY 19456 (.cutX 28160 .empty (.cutY 18944 .empty (.cutX 28416 (.cutY 19200 .empty (.cutX 28288 (.cutY 19328 .full (.cutX 28224 (.cutY 19392 .full .full) (.cutY 19392 .full .full))) (.cutY 19328 .full .full))) .empty))) .empty)))) .empty) .empty) .empty))))

theorem metadata1 : 0<199204038 ∧ 17<128 ∧ 52<128 ∧ 1<4 ∧
    6099/4160=1 ∧ 6099%4160=1939 ∧ ∀ i, (leaves1 i).Valid 8 := by
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

noncomputable def phaseMass1 : ℝ := singlePhaseMass (199204038/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw1 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass1_eq : phaseMass1 = (99602019/819200000000 : ℝ) := by
  unfold phaseMass1
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw1 output1 cover1 source1
    (gridTreeUnionCheck_sound 32768 raw1 output1 cover1 source1 tree1 checked1)
    _ (by norm_num) _, areaUnits1]
  norm_num

-- Frozen phase 3898, atom 7795, type 1, source (41,68).
def leavesData2 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves2 : Fin 7 → DyadicLeaf := leavesData2.get
def raw2 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 41 68 leaves2 i
def outputData2 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨10496,10624,17408,17536⟩) (.node (.single ⟨10496,10624,17536,17664⟩) (.single ⟨10624,10688,17408,17472⟩))) (.node (.node (.single ⟨10624,10688,17472,17536⟩) (.single ⟨10688,10752,17408,17472⟩)) (.node (.single ⟨10688,10752,17472,17536⟩) (.single ⟨10624,10752,17536,17664⟩)))) (.node (.node (.single ⟨15104,15232,22016,22144⟩) (.node (.single ⟨15104,15232,22144,22272⟩) (.single ⟨15232,15296,22016,22080⟩))) (.node (.node (.single ⟨15232,15296,22080,22144⟩) (.single ⟨15296,15360,22016,22080⟩)) (.node (.single ⟨15296,15360,22080,22144⟩) (.single ⟨15232,15360,22144,22272⟩))))) (.node (.node (.node (.single ⟨17408,17536,10496,10624⟩) (.node (.single ⟨17408,17472,10624,10688⟩) (.single ⟨17408,17472,10688,10752⟩))) (.node (.node (.single ⟨17472,17536,10624,10688⟩) (.single ⟨17472,17536,10688,10752⟩)) (.node (.single ⟨17536,17664,10496,10624⟩) (.single ⟨17536,17664,10624,10752⟩)))) (.node (.node (.single ⟨22016,22144,15104,15232⟩) (.node (.single ⟨22016,22080,15232,15296⟩) (.single ⟨22016,22080,15296,15360⟩))) (.node (.node (.single ⟨22080,22144,15232,15296⟩) (.single ⟨22080,22144,15296,15360⟩)) (.node (.single ⟨22144,22272,15104,15232⟩) (.single ⟨22144,22272,15232,15360⟩))))))
def output2 : Fin 28 → GridBox := outputData2.get
def coverData2 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData2 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover2 (i : Fin 28) : Fin 28 := ⟨coverData2.get i % 28, Nat.mod_lt _ (by decide)⟩
def source2 (i : Fin 28) : Fin 28 := ⟨sourceData2.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree2 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 .empty (.cutY 18432 (.cutX 11264 (.cutY 17408 .empty (.cutX 10752 (.cutY 17920 (.cutX 10496 .empty (.cutY 17664 (.cutX 10624 (.cutY 17536 .full .full) (.cutY 17536 (.cutX 10688 (.cutY 17472 .full .full) (.cutY 17472 .full .full)) .full)) .empty)) .empty) .empty)) .empty) .empty)) .empty) (.cutY 20480 .empty (.cutX 14336 .empty (.cutY 22528 (.cutX 15360 (.cutY 21504 .empty (.cutX 14848 .empty (.cutY 22016 .empty (.cutX 15104 .empty (.cutY 22272 (.cutX 15232 (.cutY 22144 .full .full) (.cutY 22144 (.cutX 15296 (.cutY 22080 .full .full) (.cutY 22080 .full .full)) .full)) .empty))))) .empty) .empty)))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 (.cutY 10240 .empty (.cutX 17408 .empty (.cutY 11264 (.cutX 17920 (.cutY 10752 (.cutX 17664 (.cutY 10496 .empty (.cutX 17536 (.cutY 10624 .full (.cutX 17472 (.cutY 10688 .full .full) (.cutY 10688 .full .full))) (.cutY 10624 .full .full))) .empty) .empty) .empty) .empty))) .empty) .empty) (.cutY 12288 .empty (.cutX 22528 (.cutY 14336 .empty (.cutX 21504 .empty (.cutY 15360 (.cutX 22016 .empty (.cutY 14848 .empty (.cutX 22272 (.cutY 15104 .empty (.cutX 22144 (.cutY 15232 .full (.cutX 22080 (.cutY 15296 .full .full) (.cutY 15296 .full .full))) (.cutY 15232 .full .full))) .empty))) .empty))) .empty)))) .empty) .empty))

theorem metadata2 : 0<50021215 ∧ 41<128 ∧ 68<128 ∧ 1<4 ∧
    7795/4160=1 ∧ 7795%4160=3635 ∧ ∀ i, (leaves2 i).Valid 8 := by
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

noncomputable def phaseMass2 : ℝ := singlePhaseMass (50021215/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw2 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass2_eq : phaseMass2 = (10004243/327680000000 : ℝ) := by
  unfold phaseMass2
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw2 output2 cover2 source2
    (gridTreeUnionCheck_sound 32768 raw2 output2 cover2 source2 tree2 checked2)
    _ (by norm_num) _, areaUnits2]
  norm_num

-- Frozen phase 3899, atom 2712, type 0, source (26,60).
def leavesData3 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves3 : Fin 4 → DyadicLeaf := leavesData3.get
def raw3 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 26 60 leaves3 i
def outputData3 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨6656,6784,15360,15488⟩) (.single ⟨6656,6784,15488,15616⟩)) (.node (.single ⟨6784,6912,15360,15488⟩) (.single ⟨6784,6912,15488,15616⟩))) (.node (.node (.single ⟨15360,15488,6656,6784⟩) (.single ⟨15360,15488,6784,6912⟩)) (.node (.single ⟨15488,15616,6656,6784⟩) (.single ⟨15488,15616,6784,6912⟩)))) (.node (.node (.node (.single ⟨17152,17280,25856,25984⟩) (.single ⟨17152,17280,25984,26112⟩)) (.node (.single ⟨17280,17408,25856,25984⟩) (.single ⟨17280,17408,25984,26112⟩))) (.node (.node (.single ⟨25856,25984,17152,17280⟩) (.single ⟨25856,25984,17280,17408⟩)) (.node (.single ⟨25984,26112,17152,17280⟩) (.single ⟨25984,26112,17280,17408⟩)))))
def output3 : Fin 16 → GridBox := outputData3.get
def coverData3 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData3 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover3 (i : Fin 16) : Fin 16 := ⟨coverData3.get i % 16, Nat.mod_lt _ (by decide)⟩
def source3 (i : Fin 16) : Fin 16 := ⟨sourceData3.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree3 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 .empty (.cutY 14336 .empty (.cutX 7168 (.cutY 15360 .empty (.cutX 6656 .empty (.cutY 15872 (.cutX 6912 (.cutY 15616 (.cutX 6784 (.cutY 15488 .full .full) (.cutY 15488 .full .full)) .empty) .empty) .empty))) .empty)))))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 .empty (.cutY 6144 .empty (.cutX 15360 .empty (.cutY 7168 (.cutX 15872 (.cutY 6656 .empty (.cutX 15616 (.cutY 6912 (.cutX 15488 (.cutY 6784 .full .full) (.cutY 6784 .full .full)) .empty) .empty)) .empty) .empty)))))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 (.cutY 26624 (.cutX 17408 (.cutY 25600 .empty (.cutX 16896 .empty (.cutY 26112 (.cutX 17152 .empty (.cutY 25856 .empty (.cutX 17280 (.cutY 25984 .full .full) (.cutY 25984 .full .full)))) .empty))) .empty) .empty) .empty) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 (.cutY 18432 (.cutX 25600 .empty (.cutY 17408 (.cutX 26112 (.cutY 16896 .empty (.cutX 25856 .empty (.cutY 17152 .empty (.cutX 25984 (.cutY 17280 .full .full) (.cutY 17280 .full .full))))) .empty) .empty)) .empty) .empty) .empty) .empty) .empty))))

theorem metadata3 : 0<29910597 ∧ 26<128 ∧ 60<128 ∧ 0<4 ∧
    2712/4160=0 ∧ 2712%4160=2712 ∧ ∀ i, (leaves3 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData3).mp
    (by decide +kernel)

theorem sourceChecked3_0 : ∀ i : Fin 16,
    (fun i => output3 i = raw3 (source3 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked3 : ∀ i : Fin 16, (fun i => output3 i = raw3 (source3 i)) i :=
  forallFin_of_zero_offset (fun i => output3 i = raw3 (source3 i)) sourceChecked3_0

theorem coverChecked3_0 : ∀ i : Fin 16,
    (fun i => (output3 (cover3 i)).ContainsBox (raw3 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked3 : ∀ i : Fin 16, (fun i => (output3 (cover3 i)).ContainsBox (raw3 i)) i :=
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

noncomputable def phaseMass3 : ℝ := singlePhaseMass (29910597/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw3 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass3_eq : phaseMass3 = (29910597/1638400000000 : ℝ) := by
  unfold phaseMass3
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw3 output3 cover3 source3
    (gridTreeUnionCheck_sound 32768 raw3 output3 cover3 source3 tree3 checked3)
    _ (by norm_num) _, areaUnits3]
  norm_num

-- Frozen phase 3900, atom 3003, type 0, source (30,63).
def leavesData4 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves4 : Fin 4 → DyadicLeaf := leavesData4.get
def raw4 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 30 63 leaves4 i
def outputData4 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨7680,7808,16128,16256⟩) (.single ⟨7680,7808,16256,16384⟩)) (.node (.single ⟨7808,7936,16128,16256⟩) (.single ⟨7808,7936,16256,16384⟩))) (.node (.node (.single ⟨16128,16256,7680,7808⟩) (.single ⟨16128,16256,7808,7936⟩)) (.node (.single ⟨16256,16384,7680,7808⟩) (.single ⟨16256,16384,7808,7936⟩)))) (.node (.node (.node (.single ⟨16384,16512,24832,24960⟩) (.single ⟨16384,16512,24960,25088⟩)) (.node (.single ⟨16512,16640,24832,24960⟩) (.single ⟨16512,16640,24960,25088⟩))) (.node (.node (.single ⟨24832,24960,16384,16512⟩) (.single ⟨24832,24960,16512,16640⟩)) (.node (.single ⟨24960,25088,16384,16512⟩) (.single ⟨24960,25088,16512,16640⟩)))))
def output4 : Fin 16 → GridBox := outputData4.get
def coverData4 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData4 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover4 (i : Fin 16) : Fin 16 := ⟨coverData4.get i % 16, Nat.mod_lt _ (by decide)⟩
def source4 (i : Fin 16) : Fin 16 := ⟨sourceData4.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree4 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 .empty (.cutY 14336 .empty (.cutX 7168 .empty (.cutY 15360 .empty (.cutX 7680 .empty (.cutY 15872 .empty (.cutX 7936 (.cutY 16128 .empty (.cutX 7808 (.cutY 16256 .full .full) (.cutY 16256 .full .full))) .empty)))))))))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 .empty (.cutY 6144 .empty (.cutX 15360 .empty (.cutY 7168 .empty (.cutX 15872 .empty (.cutY 7680 .empty (.cutX 16128 .empty (.cutY 7936 (.cutX 16256 (.cutY 7808 .full .full) (.cutY 7808 .full .full)) .empty)))))))))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 (.cutY 26624 (.cutX 17408 (.cutY 25600 (.cutX 16896 (.cutY 25088 (.cutX 16640 (.cutY 24832 .empty (.cutX 16512 (.cutY 24960 .full .full) (.cutY 24960 .full .full))) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 (.cutY 18432 (.cutX 25600 (.cutY 17408 (.cutX 25088 (.cutY 16896 (.cutX 24832 .empty (.cutY 16640 (.cutX 24960 (.cutY 16512 .full .full) (.cutY 16512 .full .full)) .empty)) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty))))

theorem metadata4 : 0<29910597 ∧ 30<128 ∧ 63<128 ∧ 0<4 ∧
    3003/4160=0 ∧ 3003%4160=3003 ∧ ∀ i, (leaves4 i).Valid 8 := by
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

noncomputable def phaseMass4 : ℝ := singlePhaseMass (29910597/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw4 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass4_eq : phaseMass4 = (29910597/1638400000000 : ℝ) := by
  unfold phaseMass4
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw4 output4 cover4 source4
    (gridTreeUnionCheck_sound 32768 raw4 output4 cover4 source4 tree4 checked4)
    _ (by norm_num) _, areaUnits4]
  norm_num

-- Frozen phase 3901, atom 3137, type 0, source (32,65).
def leavesData5 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves5 : Fin 4 → DyadicLeaf := leavesData5.get
def raw5 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 32 65 leaves5 i
def outputData5 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨8192,8320,16640,16768⟩) (.single ⟨8192,8320,16768,16896⟩)) (.node (.single ⟨8320,8448,16640,16768⟩) (.single ⟨8320,8448,16768,16896⟩))) (.node (.node (.single ⟨15872,16000,24320,24448⟩) (.single ⟨15872,16000,24448,24576⟩)) (.node (.single ⟨16000,16128,24320,24448⟩) (.single ⟨16000,16128,24448,24576⟩)))) (.node (.node (.node (.single ⟨16640,16768,8192,8320⟩) (.single ⟨16640,16768,8320,8448⟩)) (.node (.single ⟨16768,16896,8192,8320⟩) (.single ⟨16768,16896,8320,8448⟩))) (.node (.node (.single ⟨24320,24448,15872,16000⟩) (.single ⟨24320,24448,16000,16128⟩)) (.node (.single ⟨24448,24576,15872,16000⟩) (.single ⟨24448,24576,16000,16128⟩)))))
def output5 : Fin 16 → GridBox := outputData5.get
def coverData5 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData5 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover5 (i : Fin 16) : Fin 16 := ⟨coverData5.get i % 16, Nat.mod_lt _ (by decide)⟩
def source5 (i : Fin 16) : Fin 16 := ⟨sourceData5.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree5 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 (.cutY 18432 (.cutX 9216 (.cutY 17408 (.cutX 8704 (.cutY 16896 (.cutX 8448 (.cutY 16640 .empty (.cutX 8320 (.cutY 16768 .full .full) (.cutY 16768 .full .full))) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty) (.cutY 20480 .empty (.cutX 14336 .empty (.cutY 22528 .empty (.cutX 15360 .empty (.cutY 23552 .empty (.cutX 15872 .empty (.cutY 24064 .empty (.cutX 16128 (.cutY 24320 .empty (.cutX 16000 (.cutY 24448 .full .full) (.cutY 24448 .full .full))) .empty))))))))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 (.cutY 10240 (.cutX 17408 (.cutY 9216 (.cutX 16896 (.cutY 8704 (.cutX 16640 .empty (.cutY 8448 (.cutX 16768 (.cutY 8320 .full .full) (.cutY 8320 .full .full)) .empty)) .empty) .empty) .empty) .empty) .empty) .empty) .empty) (.cutY 12288 .empty (.cutX 22528 .empty (.cutY 14336 .empty (.cutX 23552 .empty (.cutY 15360 .empty (.cutX 24064 .empty (.cutY 15872 .empty (.cutX 24320 .empty (.cutY 16128 (.cutX 24448 (.cutY 16000 .full .full) (.cutY 16000 .full .full)) .empty))))))))))) .empty) .empty))

theorem metadata5 : 0<167572778 ∧ 32<128 ∧ 65<128 ∧ 0<4 ∧
    3137/4160=0 ∧ 3137%4160=3137 ∧ ∀ i, (leaves5 i).Valid 8 := by
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

noncomputable def phaseMass5 : ℝ := singlePhaseMass (167572778/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw5 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass5_eq : phaseMass5 = (83786389/819200000000 : ℝ) := by
  unfold phaseMass5
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw5 output5 cover5 source5
    (gridTreeUnionCheck_sound 32768 raw5 output5 cover5 source5 tree5 checked5)
    _ (by norm_num) _, areaUnits5]
  norm_num

-- Frozen phase 3902, atom 3071, type 0, source (31,64).
def leavesData6 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves6 : Fin 4 → DyadicLeaf := leavesData6.get
def raw6 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 31 64 leaves6 i
def outputData6 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨7936,8064,16384,16512⟩) (.single ⟨7936,8064,16512,16640⟩)) (.node (.single ⟨8064,8192,16384,16512⟩) (.single ⟨8064,8192,16512,16640⟩))) (.node (.node (.single ⟨16128,16256,24576,24704⟩) (.single ⟨16128,16256,24704,24832⟩)) (.node (.single ⟨16256,16384,24576,24704⟩) (.single ⟨16256,16384,24704,24832⟩)))) (.node (.node (.node (.single ⟨16384,16512,7936,8064⟩) (.single ⟨16384,16512,8064,8192⟩)) (.node (.single ⟨16512,16640,7936,8064⟩) (.single ⟨16512,16640,8064,8192⟩))) (.node (.node (.single ⟨24576,24704,16128,16256⟩) (.single ⟨24576,24704,16256,16384⟩)) (.node (.single ⟨24704,24832,16128,16256⟩) (.single ⟨24704,24832,16256,16384⟩)))))
def output6 : Fin 16 → GridBox := outputData6.get
def coverData6 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData6 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover6 (i : Fin 16) : Fin 16 := ⟨coverData6.get i % 16, Nat.mod_lt _ (by decide)⟩
def source6 (i : Fin 16) : Fin 16 := ⟨sourceData6.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree6 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 (.cutX 7168 .empty (.cutY 17408 (.cutX 7680 .empty (.cutY 16896 (.cutX 7936 .empty (.cutY 16640 (.cutX 8064 (.cutY 16512 .full .full) (.cutY 16512 .full .full)) .empty)) .empty)) .empty)) .empty)) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 (.cutX 15360 .empty (.cutY 25600 (.cutX 15872 .empty (.cutY 25088 (.cutX 16128 .empty (.cutY 24832 (.cutX 16256 (.cutY 24704 .full .full) (.cutY 24704 .full .full)) .empty)) .empty)) .empty)) .empty)) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 .empty (.cutX 17408 (.cutY 7168 .empty (.cutX 16896 (.cutY 7680 .empty (.cutX 16640 (.cutY 7936 .empty (.cutX 16512 (.cutY 8064 .full .full) (.cutY 8064 .full .full))) .empty)) .empty)) .empty)) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 .empty (.cutX 25600 (.cutY 15360 .empty (.cutX 25088 (.cutY 15872 .empty (.cutX 24832 (.cutY 16128 .empty (.cutX 24704 (.cutY 16256 .full .full) (.cutY 16256 .full .full))) .empty)) .empty)) .empty)) .empty)) .empty))) .empty))

theorem metadata6 : 0<170092456 ∧ 31<128 ∧ 64<128 ∧ 0<4 ∧
    3071/4160=0 ∧ 3071%4160=3071 ∧ ∀ i, (leaves6 i).Valid 8 := by
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

noncomputable def phaseMass6 : ℝ := singlePhaseMass (170092456/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw6 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass6_eq : phaseMass6 = (21261557/204800000000 : ℝ) := by
  unfold phaseMass6
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw6 output6 cover6 source6
    (gridTreeUnionCheck_sound 32768 raw6 output6 cover6 source6 tree6 checked6)
    _ (by norm_num) _, areaUnits6]
  norm_num

-- Frozen phase 3903, atom 1339, type 0, source (11,52).
def leavesData7 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves7 : Fin 4 → DyadicLeaf := leavesData7.get
def raw7 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 11 52 leaves7 i
def outputData7 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨2816,2944,13312,13440⟩) (.single ⟨2816,2944,13440,13568⟩)) (.node (.single ⟨2944,3072,13312,13440⟩) (.single ⟨2944,3072,13440,13568⟩))) (.node (.node (.single ⟨13312,13440,2816,2944⟩) (.single ⟨13312,13440,2944,3072⟩)) (.node (.single ⟨13440,13568,2816,2944⟩) (.single ⟨13440,13568,2944,3072⟩)))) (.node (.node (.node (.single ⟨19200,19328,29696,29824⟩) (.single ⟨19200,19328,29824,29952⟩)) (.node (.single ⟨19328,19456,29696,29824⟩) (.single ⟨19328,19456,29824,29952⟩))) (.node (.node (.single ⟨29696,29824,19200,19328⟩) (.single ⟨29696,29824,19328,19456⟩)) (.node (.single ⟨29824,29952,19200,19328⟩) (.single ⟨29824,29952,19328,19456⟩)))))
def output7 : Fin 16 → GridBox := outputData7.get
def coverData7 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData7 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover7 (i : Fin 16) : Fin 16 := ⟨coverData7.get i % 16, Nat.mod_lt _ (by decide)⟩
def source7 (i : Fin 16) : Fin 16 := ⟨sourceData7.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree7 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 (.cutX 3072 (.cutY 13312 .empty (.cutX 2560 .empty (.cutY 13824 (.cutX 2816 .empty (.cutY 13568 (.cutX 2944 (.cutY 13440 .full .full) (.cutY 13440 .full .full)) .empty)) .empty))) .empty) .empty))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 (.cutY 2048 .empty (.cutX 13312 .empty (.cutY 3072 (.cutX 13824 (.cutY 2560 .empty (.cutX 13568 (.cutY 2816 .empty (.cutX 13440 (.cutY 2944 .full .full) (.cutY 2944 .full .full))) .empty)) .empty) .empty))) .empty) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 .empty (.cutY 30720 (.cutX 19456 (.cutY 29696 .empty (.cutX 18944 .empty (.cutY 30208 (.cutX 19200 .empty (.cutY 29952 (.cutX 19328 (.cutY 29824 .full .full) (.cutY 29824 .full .full)) .empty)) .empty))) .empty) .empty))) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 .empty (.cutX 29696 .empty (.cutY 19456 (.cutX 30208 (.cutY 18944 .empty (.cutX 29952 (.cutY 19200 .empty (.cutX 29824 (.cutY 19328 .full .full) (.cutY 19328 .full .full))) .empty)) .empty) .empty))) .empty) .empty)) .empty))))

theorem metadata7 : 0<206808448 ∧ 11<128 ∧ 52<128 ∧ 0<4 ∧
    1339/4160=0 ∧ 1339%4160=1339 ∧ ∀ i, (leaves7 i).Valid 8 := by
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

noncomputable def phaseMass7 : ℝ := singlePhaseMass (206808448/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw7 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass7_eq : phaseMass7 = (1615691/12800000000 : ℝ) := by
  unfold phaseMass7
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw7 output7 cover7 source7
    (gridTreeUnionCheck_sound 32768 raw7 output7 cover7 source7 tree7 checked7)
    _ (by norm_num) _, areaUnits7]
  norm_num

-- Frozen phase 3904, atom 3490, type 0, source (38,70).
def leavesData8 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves8 : Fin 4 → DyadicLeaf := leavesData8.get
def raw8 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 38 70 leaves8 i
def outputData8 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨9728,9856,17920,18048⟩) (.single ⟨9728,9856,18048,18176⟩)) (.node (.single ⟨9856,9984,17920,18048⟩) (.single ⟨9856,9984,18048,18176⟩))) (.node (.node (.single ⟨14592,14720,22784,22912⟩) (.single ⟨14592,14720,22912,23040⟩)) (.node (.single ⟨14720,14848,22784,22912⟩) (.single ⟨14720,14848,22912,23040⟩)))) (.node (.node (.node (.single ⟨17920,18048,9728,9856⟩) (.single ⟨17920,18048,9856,9984⟩)) (.node (.single ⟨18048,18176,9728,9856⟩) (.single ⟨18048,18176,9856,9984⟩))) (.node (.node (.single ⟨22784,22912,14592,14720⟩) (.single ⟨22784,22912,14720,14848⟩)) (.node (.single ⟨22912,23040,14592,14720⟩) (.single ⟨22912,23040,14720,14848⟩)))))
def output8 : Fin 16 → GridBox := outputData8.get
def coverData8 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData8 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover8 (i : Fin 16) : Fin 16 := ⟨coverData8.get i % 16, Nat.mod_lt _ (by decide)⟩
def source8 (i : Fin 16) : Fin 16 := ⟨sourceData8.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree8 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 (.cutY 18432 (.cutX 9216 .empty (.cutY 17408 .empty (.cutX 9728 .empty (.cutY 17920 .empty (.cutX 9984 (.cutY 18176 (.cutX 9856 (.cutY 18048 .full .full) (.cutY 18048 .full .full)) .empty) .empty))))) .empty) .empty) .empty) (.cutY 20480 .empty (.cutX 14336 .empty (.cutY 22528 .empty (.cutX 15360 (.cutY 23552 (.cutX 14848 (.cutY 23040 (.cutX 14592 .empty (.cutY 22784 .empty (.cutX 14720 (.cutY 22912 .full .full) (.cutY 22912 .full .full)))) .empty) .empty) .empty) .empty))))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 (.cutY 10240 (.cutX 17408 .empty (.cutY 9216 .empty (.cutX 17920 .empty (.cutY 9728 .empty (.cutX 18176 (.cutY 9984 (.cutX 18048 (.cutY 9856 .full .full) (.cutY 9856 .full .full)) .empty) .empty))))) .empty) .empty) .empty) (.cutY 12288 .empty (.cutX 22528 .empty (.cutY 14336 .empty (.cutX 23552 (.cutY 15360 (.cutX 23040 (.cutY 14848 (.cutX 22784 .empty (.cutY 14592 .empty (.cutX 22912 (.cutY 14720 .full .full) (.cutY 14720 .full .full)))) .empty) .empty) .empty) .empty)))))) .empty) .empty))

theorem metadata8 : 0<167572778 ∧ 38<128 ∧ 70<128 ∧ 0<4 ∧
    3490/4160=0 ∧ 3490%4160=3490 ∧ ∀ i, (leaves8 i).Valid 8 := by
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

noncomputable def phaseMass8 : ℝ := singlePhaseMass (167572778/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw8 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass8_eq : phaseMass8 = (83786389/819200000000 : ℝ) := by
  unfold phaseMass8
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw8 output8 cover8 source8
    (gridTreeUnionCheck_sound 32768 raw8 output8 cover8 source8 tree8 checked8)
    _ (by norm_num) _, areaUnits8]
  norm_num

-- Frozen phase 3905, atom 7537, type 1, source (36,65).
def leavesData9 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves9 : Fin 7 → DyadicLeaf := leavesData9.get
def raw9 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 36 65 leaves9 i
def outputData9 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨9216,9344,16640,16768⟩) (.node (.single ⟨9216,9344,16768,16896⟩) (.single ⟨9344,9408,16640,16704⟩))) (.node (.node (.single ⟨9344,9408,16704,16768⟩) (.single ⟨9408,9472,16640,16704⟩)) (.node (.single ⟨9408,9472,16704,16768⟩) (.single ⟨9344,9472,16768,16896⟩)))) (.node (.node (.single ⟨15872,16000,23296,23424⟩) (.node (.single ⟨15872,16000,23424,23552⟩) (.single ⟨16000,16064,23296,23360⟩))) (.node (.node (.single ⟨16000,16064,23360,23424⟩) (.single ⟨16064,16128,23296,23360⟩)) (.node (.single ⟨16064,16128,23360,23424⟩) (.single ⟨16000,16128,23424,23552⟩))))) (.node (.node (.node (.single ⟨16640,16768,9216,9344⟩) (.node (.single ⟨16640,16704,9344,9408⟩) (.single ⟨16640,16704,9408,9472⟩))) (.node (.node (.single ⟨16704,16768,9344,9408⟩) (.single ⟨16704,16768,9408,9472⟩)) (.node (.single ⟨16768,16896,9216,9344⟩) (.single ⟨16768,16896,9344,9472⟩)))) (.node (.node (.single ⟨23296,23424,15872,16000⟩) (.node (.single ⟨23296,23360,16000,16064⟩) (.single ⟨23296,23360,16064,16128⟩))) (.node (.node (.single ⟨23360,23424,16000,16064⟩) (.single ⟨23360,23424,16064,16128⟩)) (.node (.single ⟨23424,23552,15872,16000⟩) (.single ⟨23424,23552,16000,16128⟩))))))
def output9 : Fin 28 → GridBox := outputData9.get
def coverData9 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData9 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover9 (i : Fin 28) : Fin 28 := ⟨coverData9.get i % 28, Nat.mod_lt _ (by decide)⟩
def source9 (i : Fin 28) : Fin 28 := ⟨sourceData9.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree9 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 (.cutY 18432 (.cutX 9216 .empty (.cutY 17408 (.cutX 9728 (.cutY 16896 (.cutX 9472 (.cutY 16640 .empty (.cutX 9344 (.cutY 16768 .full .full) (.cutY 16768 (.cutX 9408 (.cutY 16704 .full .full) (.cutY 16704 .full .full)) .full))) .empty) .empty) .empty) .empty)) .empty) .empty) .empty) (.cutY 20480 .empty (.cutX 14336 .empty (.cutY 22528 .empty (.cutX 15360 .empty (.cutY 23552 (.cutX 15872 .empty (.cutY 23040 .empty (.cutX 16128 (.cutY 23296 .empty (.cutX 16000 (.cutY 23424 .full .full) (.cutY 23424 (.cutX 16064 (.cutY 23360 .full .full) (.cutY 23360 .full .full)) .full))) .empty))) .empty)))))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 (.cutY 10240 (.cutX 17408 (.cutY 9216 .empty (.cutX 16896 (.cutY 9728 (.cutX 16640 .empty (.cutY 9472 (.cutX 16768 (.cutY 9344 .full (.cutX 16704 (.cutY 9408 .full .full) (.cutY 9408 .full .full))) (.cutY 9344 .full .full)) .empty)) .empty) .empty)) .empty) .empty) .empty) .empty) (.cutY 12288 .empty (.cutX 22528 .empty (.cutY 14336 .empty (.cutX 23552 (.cutY 15360 .empty (.cutX 23040 .empty (.cutY 15872 .empty (.cutX 23296 .empty (.cutY 16128 (.cutX 23424 (.cutY 16000 .full (.cutX 23360 (.cutY 16064 .full .full) (.cutY 16064 .full .full))) (.cutY 16000 .full .full)) .empty))))) .empty)))))) .empty) .empty))

theorem metadata9 : 0<182398684 ∧ 36<128 ∧ 65<128 ∧ 1<4 ∧
    7537/4160=1 ∧ 7537%4160=3377 ∧ ∀ i, (leaves9 i).Valid 8 := by
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

noncomputable def phaseMass9 : ℝ := singlePhaseMass (182398684/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw9 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass9_eq : phaseMass9 = (45599671/409600000000 : ℝ) := by
  unfold phaseMass9
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw9 output9 cover9 source9
    (gridTreeUnionCheck_sound 32768 raw9 output9 cover9 source9 tree9 checked9)
    _ (by norm_num) _, areaUnits9]
  norm_num

-- Frozen phase 3906, atom 8005, type 1, source (46,73).
def leavesData10 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves10 : Fin 7 → DyadicLeaf := leavesData10.get
def raw10 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 46 73 leaves10 i
def outputData10 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨11776,11904,18688,18816⟩) (.node (.single ⟨11776,11904,18816,18944⟩) (.single ⟨11904,11968,18688,18752⟩))) (.node (.node (.single ⟨11904,11968,18752,18816⟩) (.single ⟨11968,12032,18688,18752⟩)) (.node (.single ⟨11968,12032,18752,18816⟩) (.single ⟨11904,12032,18816,18944⟩)))) (.node (.node (.single ⟨13824,13952,20736,20864⟩) (.node (.single ⟨13824,13952,20864,20992⟩) (.single ⟨13952,14016,20736,20800⟩))) (.node (.node (.single ⟨13952,14016,20800,20864⟩) (.single ⟨14016,14080,20736,20800⟩)) (.node (.single ⟨14016,14080,20800,20864⟩) (.single ⟨13952,14080,20864,20992⟩))))) (.node (.node (.node (.single ⟨18688,18816,11776,11904⟩) (.node (.single ⟨18688,18752,11904,11968⟩) (.single ⟨18688,18752,11968,12032⟩))) (.node (.node (.single ⟨18752,18816,11904,11968⟩) (.single ⟨18752,18816,11968,12032⟩)) (.node (.single ⟨18816,18944,11776,11904⟩) (.single ⟨18816,18944,11904,12032⟩)))) (.node (.node (.single ⟨20736,20864,13824,13952⟩) (.node (.single ⟨20736,20800,13952,14016⟩) (.single ⟨20736,20800,14016,14080⟩))) (.node (.node (.single ⟨20800,20864,13952,14016⟩) (.single ⟨20800,20864,14016,14080⟩)) (.node (.single ⟨20864,20992,13824,13952⟩) (.single ⟨20864,20992,13952,14080⟩))))))
def output10 : Fin 28 → GridBox := outputData10.get
def coverData10 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData10 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover10 (i : Fin 28) : Fin 28 := ⟨coverData10.get i % 28, Nat.mod_lt _ (by decide)⟩
def source10 (i : Fin 28) : Fin 28 := ⟨sourceData10.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree10 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 .empty (.cutY 18432 .empty (.cutX 11264 .empty (.cutY 19456 (.cutX 11776 .empty (.cutY 18944 (.cutX 12032 (.cutY 18688 .empty (.cutX 11904 (.cutY 18816 .full .full) (.cutY 18816 (.cutX 11968 (.cutY 18752 .full .full) (.cutY 18752 .full .full)) .full))) .empty) .empty)) .empty)))) .empty) (.cutY 20480 .empty (.cutX 14336 (.cutY 22528 (.cutX 13312 .empty (.cutY 21504 (.cutX 13824 .empty (.cutY 20992 (.cutX 14080 (.cutY 20736 .empty (.cutX 13952 (.cutY 20864 .full .full) (.cutY 20864 (.cutX 14016 (.cutY 20800 .full .full) (.cutY 20800 .full .full)) .full))) .empty) .empty)) .empty)) .empty) .empty))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 .empty (.cutY 10240 .empty (.cutX 19456 (.cutY 11264 .empty (.cutX 18944 (.cutY 11776 .empty (.cutX 18688 .empty (.cutY 12032 (.cutX 18816 (.cutY 11904 .full (.cutX 18752 (.cutY 11968 .full .full) (.cutY 11968 .full .full))) (.cutY 11904 .full .full)) .empty))) .empty)) .empty))) .empty) (.cutY 12288 .empty (.cutX 22528 (.cutY 14336 (.cutX 21504 (.cutY 13312 .empty (.cutX 20992 (.cutY 13824 .empty (.cutX 20736 .empty (.cutY 14080 (.cutX 20864 (.cutY 13952 .full (.cutX 20800 (.cutY 14016 .full .full) (.cutY 14016 .full .full))) (.cutY 13952 .full .full)) .empty))) .empty)) .empty) .empty) .empty)))) .empty) .empty))

theorem metadata10 : 0<177315334 ∧ 46<128 ∧ 73<128 ∧ 1<4 ∧
    8005/4160=1 ∧ 8005%4160=3845 ∧ ∀ i, (leaves10 i).Valid 8 := by
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

noncomputable def phaseMass10 : ℝ := singlePhaseMass (177315334/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw10 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass10_eq : phaseMass10 = (88657667/819200000000 : ℝ) := by
  unfold phaseMass10
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw10 output10 cover10 source10
    (gridTreeUnionCheck_sound 32768 raw10 output10 cover10 source10 tree10 checked10)
    _ (by norm_num) _, areaUnits10]
  norm_num

-- Frozen phase 3907, atom 8041, type 1, source (47,74).
def leavesData11 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves11 : Fin 7 → DyadicLeaf := leavesData11.get
def raw11 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 47 74 leaves11 i
def outputData11 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨12032,12160,18944,19072⟩) (.node (.single ⟨12032,12160,19072,19200⟩) (.single ⟨12160,12224,18944,19008⟩))) (.node (.node (.single ⟨12160,12224,19008,19072⟩) (.single ⟨12224,12288,18944,19008⟩)) (.node (.single ⟨12224,12288,19008,19072⟩) (.single ⟨12160,12288,19072,19200⟩)))) (.node (.node (.single ⟨13568,13696,20480,20608⟩) (.node (.single ⟨13568,13696,20608,20736⟩) (.single ⟨13696,13760,20480,20544⟩))) (.node (.node (.single ⟨13696,13760,20544,20608⟩) (.single ⟨13760,13824,20480,20544⟩)) (.node (.single ⟨13760,13824,20544,20608⟩) (.single ⟨13696,13824,20608,20736⟩))))) (.node (.node (.node (.single ⟨18944,19072,12032,12160⟩) (.node (.single ⟨18944,19008,12160,12224⟩) (.single ⟨18944,19008,12224,12288⟩))) (.node (.node (.single ⟨19008,19072,12160,12224⟩) (.single ⟨19008,19072,12224,12288⟩)) (.node (.single ⟨19072,19200,12032,12160⟩) (.single ⟨19072,19200,12160,12288⟩)))) (.node (.node (.single ⟨20480,20608,13568,13696⟩) (.node (.single ⟨20480,20544,13696,13760⟩) (.single ⟨20480,20544,13760,13824⟩))) (.node (.node (.single ⟨20544,20608,13696,13760⟩) (.single ⟨20544,20608,13760,13824⟩)) (.node (.single ⟨20608,20736,13568,13696⟩) (.single ⟨20608,20736,13696,13824⟩))))))
def output11 : Fin 28 → GridBox := outputData11.get
def coverData11 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData11 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover11 (i : Fin 28) : Fin 28 := ⟨coverData11.get i % 28, Nat.mod_lt _ (by decide)⟩
def source11 (i : Fin 28) : Fin 28 := ⟨sourceData11.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree11 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 .empty (.cutY 18432 .empty (.cutX 11264 .empty (.cutY 19456 (.cutX 11776 .empty (.cutY 18944 .empty (.cutX 12032 .empty (.cutY 19200 (.cutX 12160 (.cutY 19072 .full .full) (.cutY 19072 (.cutX 12224 (.cutY 19008 .full .full) (.cutY 19008 .full .full)) .full)) .empty)))) .empty)))) .empty) (.cutY 20480 .empty (.cutX 14336 (.cutY 22528 (.cutX 13312 .empty (.cutY 21504 (.cutX 13824 (.cutY 20992 (.cutX 13568 .empty (.cutY 20736 (.cutX 13696 (.cutY 20608 .full .full) (.cutY 20608 (.cutX 13760 (.cutY 20544 .full .full) (.cutY 20544 .full .full)) .full)) .empty)) .empty) .empty) .empty)) .empty) .empty))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 .empty (.cutY 10240 .empty (.cutX 19456 (.cutY 11264 .empty (.cutX 18944 .empty (.cutY 11776 .empty (.cutX 19200 (.cutY 12032 .empty (.cutX 19072 (.cutY 12160 .full (.cutX 19008 (.cutY 12224 .full .full) (.cutY 12224 .full .full))) (.cutY 12160 .full .full))) .empty)))) .empty))) .empty) (.cutY 12288 .empty (.cutX 22528 (.cutY 14336 (.cutX 21504 (.cutY 13312 .empty (.cutX 20992 (.cutY 13824 (.cutX 20736 (.cutY 13568 .empty (.cutX 20608 (.cutY 13696 .full (.cutX 20544 (.cutY 13760 .full .full) (.cutY 13760 .full .full))) (.cutY 13696 .full .full))) .empty) .empty) .empty)) .empty) .empty) .empty)))) .empty) .empty))

theorem metadata11 : 0<177315334 ∧ 47<128 ∧ 74<128 ∧ 1<4 ∧
    8041/4160=1 ∧ 8041%4160=3881 ∧ ∀ i, (leaves11 i).Valid 8 := by
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

noncomputable def phaseMass11 : ℝ := singlePhaseMass (177315334/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw11 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass11_eq : phaseMass11 = (88657667/819200000000 : ℝ) := by
  unfold phaseMass11
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw11 output11 cover11 source11
    (gridTreeUnionCheck_sound 32768 raw11 output11 cover11 source11 tree11 checked11)
    _ (by norm_num) _, areaUnits11]
  norm_num

-- Frozen phase 3908, atom 8075, type 1, source (48,75).
def leavesData12 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves12 : Fin 7 → DyadicLeaf := leavesData12.get
def raw12 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 48 75 leaves12 i
def outputData12 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨12288,12416,19200,19328⟩) (.node (.single ⟨12288,12416,19328,19456⟩) (.single ⟨12416,12480,19200,19264⟩))) (.node (.node (.single ⟨12416,12480,19264,19328⟩) (.single ⟨12480,12544,19200,19264⟩)) (.node (.single ⟨12480,12544,19264,19328⟩) (.single ⟨12416,12544,19328,19456⟩)))) (.node (.node (.single ⟨13312,13440,20224,20352⟩) (.node (.single ⟨13312,13440,20352,20480⟩) (.single ⟨13440,13504,20224,20288⟩))) (.node (.node (.single ⟨13440,13504,20288,20352⟩) (.single ⟨13504,13568,20224,20288⟩)) (.node (.single ⟨13504,13568,20288,20352⟩) (.single ⟨13440,13568,20352,20480⟩))))) (.node (.node (.node (.single ⟨19200,19328,12288,12416⟩) (.node (.single ⟨19200,19264,12416,12480⟩) (.single ⟨19200,19264,12480,12544⟩))) (.node (.node (.single ⟨19264,19328,12416,12480⟩) (.single ⟨19264,19328,12480,12544⟩)) (.node (.single ⟨19328,19456,12288,12416⟩) (.single ⟨19328,19456,12416,12544⟩)))) (.node (.node (.single ⟨20224,20352,13312,13440⟩) (.node (.single ⟨20224,20288,13440,13504⟩) (.single ⟨20224,20288,13504,13568⟩))) (.node (.node (.single ⟨20288,20352,13440,13504⟩) (.single ⟨20288,20352,13504,13568⟩)) (.node (.single ⟨20352,20480,13312,13440⟩) (.single ⟨20352,20480,13440,13568⟩))))))
def output12 : Fin 28 → GridBox := outputData12.get
def coverData12 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData12 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover12 (i : Fin 28) : Fin 28 := ⟨coverData12.get i % 28, Nat.mod_lt _ (by decide)⟩
def source12 (i : Fin 28) : Fin 28 := ⟨sourceData12.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree12 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 .empty (.cutY 20480 (.cutX 14336 (.cutY 18432 .empty (.cutX 13312 (.cutY 19456 (.cutX 12800 (.cutY 18944 .empty (.cutX 12544 (.cutY 19200 .empty (.cutX 12416 (.cutY 19328 .full .full) (.cutY 19328 (.cutX 12480 (.cutY 19264 .full .full) (.cutY 19264 .full .full)) .full))) .empty)) .empty) .empty) (.cutY 19456 .empty (.cutX 13824 (.cutY 19968 .empty (.cutX 13568 (.cutY 20224 .empty (.cutX 13440 (.cutY 20352 .full .full) (.cutY 20352 (.cutX 13504 (.cutY 20288 .full .full) (.cutY 20288 .full .full)) .full))) .empty)) .empty)))) .empty) .empty)) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 .empty (.cutX 18432 .empty (.cutY 14336 (.cutX 19456 (.cutY 13312 (.cutX 18944 .empty (.cutY 12800 (.cutX 19200 .empty (.cutY 12544 (.cutX 19328 (.cutY 12416 .full (.cutX 19264 (.cutY 12480 .full .full) (.cutY 12480 .full .full))) (.cutY 12416 .full .full)) .empty)) .empty)) .empty) (.cutY 13312 .empty (.cutX 19968 .empty (.cutY 13824 (.cutX 20224 .empty (.cutY 13568 (.cutX 20352 (.cutY 13440 .full (.cutX 20288 (.cutY 13504 .full .full) (.cutY 13504 .full .full))) (.cutY 13440 .full .full)) .empty)) .empty)))) .empty))) .empty)) .empty) .empty))

theorem metadata12 : 0<128045008 ∧ 48<128 ∧ 75<128 ∧ 1<4 ∧
    8075/4160=1 ∧ 8075%4160=3915 ∧ ∀ i, (leaves12 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData12).mp
    (by decide +kernel)

theorem sourceChecked12_0 : ∀ i : Fin 28,
    (fun i => output12 i = raw12 (source12 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked12 : ∀ i : Fin 28, (fun i => output12 i = raw12 (source12 i)) i :=
  forallFin_of_zero_offset (fun i => output12 i = raw12 (source12 i)) sourceChecked12_0

theorem coverChecked12_0 : ∀ i : Fin 28,
    (fun i => (output12 (cover12 i)).ContainsBox (raw12 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked12 : ∀ i : Fin 28, (fun i => (output12 (cover12 i)).ContainsBox (raw12 i)) i :=
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

noncomputable def phaseMass12 : ℝ := singlePhaseMass (128045008/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw12 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass12_eq : phaseMass12 = (8002813/102400000000 : ℝ) := by
  unfold phaseMass12
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw12 output12 cover12 source12
    (gridTreeUnionCheck_sound 32768 raw12 output12 cover12 source12 tree12 checked12)
    _ (by norm_num) _, areaUnits12]
  norm_num

-- Frozen phase 3909, atom 8137, type 1, source (50,77).
def leavesData13 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves13 : Fin 4 → DyadicLeaf := leavesData13.get
def raw13 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 50 77 leaves13 i
def outputData13 : FiniteInputTree GridBox 8 := (.node (.node (.node (.single ⟨12800,12928,19712,19840⟩) (.single ⟨12800,12928,19840,19968⟩)) (.node (.single ⟨12928,13056,19712,19840⟩) (.single ⟨12928,13056,19840,19968⟩))) (.node (.node (.single ⟨19712,19840,12800,12928⟩) (.single ⟨19712,19840,12928,13056⟩)) (.node (.single ⟨19840,19968,12800,12928⟩) (.single ⟨19840,19968,12928,13056⟩))))
def output13 : Fin 8 → GridBox := outputData13.get
def coverData13 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 7) (.single 3))) (.node (.node (.single 1) (.single 6)) (.node (.single 6) (.single 1)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 5) (.single 2))) (.node (.node (.single 3) (.single 7)) (.node (.single 4) (.single 0)))))
def sourceData13 : FiniteInputTree ℕ 8 := (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 3))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 2))))
def cover13 (i : Fin 16) : Fin 8 := ⟨coverData13.get i % 8, Nat.mod_lt _ (by decide)⟩
def source13 (i : Fin 8) : Fin 16 := ⟨sourceData13.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree13 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 .empty (.cutY 20480 (.cutX 14336 (.cutY 18432 .empty (.cutX 13312 (.cutY 19456 .empty (.cutX 12800 .empty (.cutY 19968 (.cutX 13056 (.cutY 19712 .empty (.cutX 12928 (.cutY 19840 .full .full) (.cutY 19840 .full .full))) .empty) .empty))) .empty)) .empty) .empty)) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 .empty (.cutX 18432 .empty (.cutY 14336 (.cutX 19456 .empty (.cutY 13312 (.cutX 19968 (.cutY 12800 .empty (.cutX 19712 .empty (.cutY 13056 (.cutX 19840 (.cutY 12928 .full .full) (.cutY 12928 .full .full)) .empty))) .empty) .empty)) .empty))) .empty)) .empty) .empty))

theorem metadata13 : 0<128045008 ∧ 50<128 ∧ 77<128 ∧ 1<4 ∧
    8137/4160=1 ∧ 8137%4160=3977 ∧ ∀ i, (leaves13 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData13).mp
    (by decide +kernel)

theorem sourceChecked13_0 : ∀ i : Fin 8,
    (fun i => output13 i = raw13 (source13 i)) (finOffset 8 0 8 (by decide) i) := by decide +kernel

theorem sourceChecked13 : ∀ i : Fin 8, (fun i => output13 i = raw13 (source13 i)) i :=
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

theorem areaUnits13 : gridUnionAreaUnits output13 = 131072 := by decide +kernel

noncomputable def phaseMass13 : ℝ := singlePhaseMass (128045008/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw13 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass13_eq : phaseMass13 = (8002813/204800000000 : ℝ) := by
  unfold phaseMass13
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw13 output13 cover13 source13
    (gridTreeUnionCheck_sound 32768 raw13 output13 cover13 source13 tree13 checked13)
    _ (by norm_num) _, areaUnits13]
  norm_num

-- Frozen phase 3910, atom 8107, type 1, source (49,76).
def leavesData14 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves14 : Fin 7 → DyadicLeaf := leavesData14.get
def raw14 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 49 76 leaves14 i
def outputData14 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨12544,12672,19456,19584⟩) (.node (.single ⟨12544,12672,19584,19712⟩) (.single ⟨12672,12736,19456,19520⟩))) (.node (.node (.single ⟨12672,12736,19520,19584⟩) (.single ⟨12736,12800,19456,19520⟩)) (.node (.single ⟨12736,12800,19520,19584⟩) (.single ⟨12672,12800,19584,19712⟩)))) (.node (.node (.single ⟨13056,13184,19968,20096⟩) (.node (.single ⟨13056,13184,20096,20224⟩) (.single ⟨13184,13248,19968,20032⟩))) (.node (.node (.single ⟨13184,13248,20032,20096⟩) (.single ⟨13248,13312,19968,20032⟩)) (.node (.single ⟨13248,13312,20032,20096⟩) (.single ⟨13184,13312,20096,20224⟩))))) (.node (.node (.node (.single ⟨19456,19584,12544,12672⟩) (.node (.single ⟨19456,19520,12672,12736⟩) (.single ⟨19456,19520,12736,12800⟩))) (.node (.node (.single ⟨19520,19584,12672,12736⟩) (.single ⟨19520,19584,12736,12800⟩)) (.node (.single ⟨19584,19712,12544,12672⟩) (.single ⟨19584,19712,12672,12800⟩)))) (.node (.node (.single ⟨19968,20096,13056,13184⟩) (.node (.single ⟨19968,20032,13184,13248⟩) (.single ⟨19968,20032,13248,13312⟩))) (.node (.node (.single ⟨20032,20096,13184,13248⟩) (.single ⟨20032,20096,13248,13312⟩)) (.node (.single ⟨20096,20224,13056,13184⟩) (.single ⟨20096,20224,13184,13312⟩))))))
def output14 : Fin 28 → GridBox := outputData14.get
def coverData14 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData14 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover14 (i : Fin 28) : Fin 28 := ⟨coverData14.get i % 28, Nat.mod_lt _ (by decide)⟩
def source14 (i : Fin 28) : Fin 28 := ⟨sourceData14.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree14 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 .empty (.cutY 20480 (.cutX 14336 (.cutY 18432 .empty (.cutX 13312 (.cutY 19456 .empty (.cutX 12800 (.cutY 19968 (.cutX 12544 .empty (.cutY 19712 (.cutX 12672 (.cutY 19584 .full .full) (.cutY 19584 (.cutX 12736 (.cutY 19520 .full .full) (.cutY 19520 .full .full)) .full)) .empty)) .empty) (.cutY 19968 .empty (.cutX 13056 .empty (.cutY 20224 (.cutX 13184 (.cutY 20096 .full .full) (.cutY 20096 (.cutX 13248 (.cutY 20032 .full .full) (.cutY 20032 .full .full)) .full)) .empty))))) .empty)) .empty) .empty)) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 .empty (.cutX 18432 .empty (.cutY 14336 (.cutX 19456 .empty (.cutY 13312 (.cutX 19968 (.cutY 12800 (.cutX 19712 (.cutY 12544 .empty (.cutX 19584 (.cutY 12672 .full (.cutX 19520 (.cutY 12736 .full .full) (.cutY 12736 .full .full))) (.cutY 12672 .full .full))) .empty) .empty) (.cutY 12800 .empty (.cutX 20224 (.cutY 13056 .empty (.cutX 20096 (.cutY 13184 .full (.cutX 20032 (.cutY 13248 .full .full) (.cutY 13248 .full .full))) (.cutY 13184 .full .full))) .empty))) .empty)) .empty))) .empty)) .empty) .empty))

theorem metadata14 : 0<128045008 ∧ 49<128 ∧ 76<128 ∧ 1<4 ∧
    8107/4160=1 ∧ 8107%4160=3947 ∧ ∀ i, (leaves14 i).Valid 8 := by
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

noncomputable def phaseMass14 : ℝ := singlePhaseMass (128045008/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw14 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass14_eq : phaseMass14 = (8002813/102400000000 : ℝ) := by
  unfold phaseMass14
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw14 output14 cover14 source14
    (gridTreeUnionCheck_sound 32768 raw14 output14 cover14 source14 tree14 checked14)
    _ (by norm_num) _, areaUnits14]
  norm_num

-- Frozen phase 3911, atom 7967, type 1, source (45,72).
def leavesData15 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves15 : Fin 7 → DyadicLeaf := leavesData15.get
def raw15 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 45 72 leaves15 i
def outputData15 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨11520,11648,18432,18560⟩) (.node (.single ⟨11520,11648,18560,18688⟩) (.single ⟨11648,11712,18432,18496⟩))) (.node (.node (.single ⟨11648,11712,18496,18560⟩) (.single ⟨11712,11776,18432,18496⟩)) (.node (.single ⟨11712,11776,18496,18560⟩) (.single ⟨11648,11776,18560,18688⟩)))) (.node (.node (.single ⟨14080,14208,20992,21120⟩) (.node (.single ⟨14080,14208,21120,21248⟩) (.single ⟨14208,14272,20992,21056⟩))) (.node (.node (.single ⟨14208,14272,21056,21120⟩) (.single ⟨14272,14336,20992,21056⟩)) (.node (.single ⟨14272,14336,21056,21120⟩) (.single ⟨14208,14336,21120,21248⟩))))) (.node (.node (.node (.single ⟨18432,18560,11520,11648⟩) (.node (.single ⟨18432,18496,11648,11712⟩) (.single ⟨18432,18496,11712,11776⟩))) (.node (.node (.single ⟨18496,18560,11648,11712⟩) (.single ⟨18496,18560,11712,11776⟩)) (.node (.single ⟨18560,18688,11520,11648⟩) (.single ⟨18560,18688,11648,11776⟩)))) (.node (.node (.single ⟨20992,21120,14080,14208⟩) (.node (.single ⟨20992,21056,14208,14272⟩) (.single ⟨20992,21056,14272,14336⟩))) (.node (.node (.single ⟨21056,21120,14208,14272⟩) (.single ⟨21056,21120,14272,14336⟩)) (.node (.single ⟨21120,21248,14080,14208⟩) (.single ⟨21120,21248,14208,14336⟩))))))
def output15 : Fin 28 → GridBox := outputData15.get
def coverData15 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData15 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover15 (i : Fin 28) : Fin 28 := ⟨coverData15.get i % 28, Nat.mod_lt _ (by decide)⟩
def source15 (i : Fin 28) : Fin 28 := ⟨sourceData15.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree15 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 .empty (.cutY 18432 .empty (.cutX 11264 .empty (.cutY 19456 (.cutX 11776 (.cutY 18944 (.cutX 11520 .empty (.cutY 18688 (.cutX 11648 (.cutY 18560 .full .full) (.cutY 18560 (.cutX 11712 (.cutY 18496 .full .full) (.cutY 18496 .full .full)) .full)) .empty)) .empty) .empty) .empty)))) .empty) (.cutY 20480 .empty (.cutX 14336 (.cutY 22528 (.cutX 13312 .empty (.cutY 21504 (.cutX 13824 .empty (.cutY 20992 .empty (.cutX 14080 .empty (.cutY 21248 (.cutX 14208 (.cutY 21120 .full .full) (.cutY 21120 (.cutX 14272 (.cutY 21056 .full .full) (.cutY 21056 .full .full)) .full)) .empty)))) .empty)) .empty) .empty))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 .empty (.cutY 10240 .empty (.cutX 19456 (.cutY 11264 .empty (.cutX 18944 (.cutY 11776 (.cutX 18688 (.cutY 11520 .empty (.cutX 18560 (.cutY 11648 .full (.cutX 18496 (.cutY 11712 .full .full) (.cutY 11712 .full .full))) (.cutY 11648 .full .full))) .empty) .empty) .empty)) .empty))) .empty) (.cutY 12288 .empty (.cutX 22528 (.cutY 14336 (.cutX 21504 (.cutY 13312 .empty (.cutX 20992 .empty (.cutY 13824 .empty (.cutX 21248 (.cutY 14080 .empty (.cutX 21120 (.cutY 14208 .full (.cutX 21056 (.cutY 14272 .full .full) (.cutY 14272 .full .full))) (.cutY 14208 .full .full))) .empty)))) .empty) .empty) .empty)))) .empty) .empty))

theorem metadata15 : 0<177315334 ∧ 45<128 ∧ 72<128 ∧ 1<4 ∧
    7967/4160=1 ∧ 7967%4160=3807 ∧ ∀ i, (leaves15 i).Valid 8 := by
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

noncomputable def phaseMass15 : ℝ := singlePhaseMass (177315334/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw15 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass15_eq : phaseMass15 = (88657667/819200000000 : ℝ) := by
  unfold phaseMass15
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw15 output15 cover15 source15
    (gridTreeUnionCheck_sound 32768 raw15 output15 cover15 source15 tree15 checked15)
    _ (by norm_num) _, areaUnits15]
  norm_num

-- Frozen phase 3912, atom 7698, type 1, source (39,67).
def leavesData16 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves16 : Fin 7 → DyadicLeaf := leavesData16.get
def raw16 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 39 67 leaves16 i
def outputData16 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨9984,10112,17152,17280⟩) (.node (.single ⟨9984,10112,17280,17408⟩) (.single ⟨10112,10176,17152,17216⟩))) (.node (.node (.single ⟨10112,10176,17216,17280⟩) (.single ⟨10176,10240,17152,17216⟩)) (.node (.single ⟨10176,10240,17216,17280⟩) (.single ⟨10112,10240,17280,17408⟩)))) (.node (.node (.single ⟨15360,15488,22528,22656⟩) (.node (.single ⟨15360,15488,22656,22784⟩) (.single ⟨15488,15552,22528,22592⟩))) (.node (.node (.single ⟨15488,15552,22592,22656⟩) (.single ⟨15552,15616,22528,22592⟩)) (.node (.single ⟨15552,15616,22592,22656⟩) (.single ⟨15488,15616,22656,22784⟩))))) (.node (.node (.node (.single ⟨17152,17280,9984,10112⟩) (.node (.single ⟨17152,17216,10112,10176⟩) (.single ⟨17152,17216,10176,10240⟩))) (.node (.node (.single ⟨17216,17280,10112,10176⟩) (.single ⟨17216,17280,10176,10240⟩)) (.node (.single ⟨17280,17408,9984,10112⟩) (.single ⟨17280,17408,10112,10240⟩)))) (.node (.node (.single ⟨22528,22656,15360,15488⟩) (.node (.single ⟨22528,22592,15488,15552⟩) (.single ⟨22528,22592,15552,15616⟩))) (.node (.node (.single ⟨22592,22656,15488,15552⟩) (.single ⟨22592,22656,15552,15616⟩)) (.node (.single ⟨22656,22784,15360,15488⟩) (.single ⟨22656,22784,15488,15616⟩))))))
def output16 : Fin 28 → GridBox := outputData16.get
def coverData16 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData16 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover16 (i : Fin 28) : Fin 28 := ⟨coverData16.get i % 28, Nat.mod_lt _ (by decide)⟩
def source16 (i : Fin 28) : Fin 28 := ⟨sourceData16.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree16 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 (.cutY 18432 (.cutX 9216 .empty (.cutY 17408 (.cutX 9728 .empty (.cutY 16896 .empty (.cutX 9984 .empty (.cutY 17152 .empty (.cutX 10112 (.cutY 17280 .full .full) (.cutY 17280 (.cutX 10176 (.cutY 17216 .full .full) (.cutY 17216 .full .full)) .full)))))) .empty)) .empty) .empty) .empty) (.cutY 20480 .empty (.cutX 14336 .empty (.cutY 22528 .empty (.cutX 15360 .empty (.cutY 23552 (.cutX 15872 (.cutY 23040 (.cutX 15616 (.cutY 22784 (.cutX 15488 (.cutY 22656 .full .full) (.cutY 22656 (.cutX 15552 (.cutY 22592 .full .full) (.cutY 22592 .full .full)) .full)) .empty) .empty) .empty) .empty) .empty)))))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 (.cutY 10240 (.cutX 17408 (.cutY 9216 .empty (.cutX 16896 .empty (.cutY 9728 .empty (.cutX 17152 .empty (.cutY 9984 .empty (.cutX 17280 (.cutY 10112 .full (.cutX 17216 (.cutY 10176 .full .full) (.cutY 10176 .full .full))) (.cutY 10112 .full .full))))))) .empty) .empty) .empty) .empty) (.cutY 12288 .empty (.cutX 22528 .empty (.cutY 14336 .empty (.cutX 23552 (.cutY 15360 .empty (.cutX 23040 (.cutY 15872 (.cutX 22784 (.cutY 15616 (.cutX 22656 (.cutY 15488 .full (.cutX 22592 (.cutY 15552 .full .full) (.cutY 15552 .full .full))) (.cutY 15488 .full .full)) .empty) .empty) .empty) .empty)) .empty)))))) .empty) .empty))

theorem metadata16 : 0<182398684 ∧ 39<128 ∧ 67<128 ∧ 1<4 ∧
    7698/4160=1 ∧ 7698%4160=3538 ∧ ∀ i, (leaves16 i).Valid 8 := by
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

noncomputable def phaseMass16 : ℝ := singlePhaseMass (182398684/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw16 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass16_eq : phaseMass16 = (45599671/409600000000 : ℝ) := by
  unfold phaseMass16
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw16 output16 cover16 source16
    (gridTreeUnionCheck_sound 32768 raw16 output16 cover16 source16 tree16 checked16)
    _ (by norm_num) _, areaUnits16]
  norm_num

-- Frozen phase 3913, atom 7841, type 1, source (42,69).
def leavesData17 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves17 : Fin 7 → DyadicLeaf := leavesData17.get
def raw17 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 42 69 leaves17 i
def outputData17 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨10752,10880,17664,17792⟩) (.node (.single ⟨10752,10880,17792,17920⟩) (.single ⟨10880,10944,17664,17728⟩))) (.node (.node (.single ⟨10880,10944,17728,17792⟩) (.single ⟨10944,11008,17664,17728⟩)) (.node (.single ⟨10944,11008,17728,17792⟩) (.single ⟨10880,11008,17792,17920⟩)))) (.node (.node (.single ⟨14848,14976,21760,21888⟩) (.node (.single ⟨14848,14976,21888,22016⟩) (.single ⟨14976,15040,21760,21824⟩))) (.node (.node (.single ⟨14976,15040,21824,21888⟩) (.single ⟨15040,15104,21760,21824⟩)) (.node (.single ⟨15040,15104,21824,21888⟩) (.single ⟨14976,15104,21888,22016⟩))))) (.node (.node (.node (.single ⟨17664,17792,10752,10880⟩) (.node (.single ⟨17664,17728,10880,10944⟩) (.single ⟨17664,17728,10944,11008⟩))) (.node (.node (.single ⟨17728,17792,10880,10944⟩) (.single ⟨17728,17792,10944,11008⟩)) (.node (.single ⟨17792,17920,10752,10880⟩) (.single ⟨17792,17920,10880,11008⟩)))) (.node (.node (.single ⟨21760,21888,14848,14976⟩) (.node (.single ⟨21760,21824,14976,15040⟩) (.single ⟨21760,21824,15040,15104⟩))) (.node (.node (.single ⟨21824,21888,14976,15040⟩) (.single ⟨21824,21888,15040,15104⟩)) (.node (.single ⟨21888,22016,14848,14976⟩) (.single ⟨21888,22016,14976,15104⟩))))))
def output17 : Fin 28 → GridBox := outputData17.get
def coverData17 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData17 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover17 (i : Fin 28) : Fin 28 := ⟨coverData17.get i % 28, Nat.mod_lt _ (by decide)⟩
def source17 (i : Fin 28) : Fin 28 := ⟨sourceData17.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree17 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 .empty (.cutY 18432 (.cutX 11264 (.cutY 17408 .empty (.cutX 10752 .empty (.cutY 17920 (.cutX 11008 (.cutY 17664 .empty (.cutX 10880 (.cutY 17792 .full .full) (.cutY 17792 (.cutX 10944 (.cutY 17728 .full .full) (.cutY 17728 .full .full)) .full))) .empty) .empty))) .empty) .empty)) .empty) (.cutY 20480 .empty (.cutX 14336 .empty (.cutY 22528 (.cutX 15360 (.cutY 21504 .empty (.cutX 14848 .empty (.cutY 22016 (.cutX 15104 (.cutY 21760 .empty (.cutX 14976 (.cutY 21888 .full .full) (.cutY 21888 (.cutX 15040 (.cutY 21824 .full .full) (.cutY 21824 .full .full)) .full))) .empty) .empty))) .empty) .empty)))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 (.cutY 10240 .empty (.cutX 17408 .empty (.cutY 11264 (.cutX 17920 (.cutY 10752 .empty (.cutX 17664 .empty (.cutY 11008 (.cutX 17792 (.cutY 10880 .full (.cutX 17728 (.cutY 10944 .full .full) (.cutY 10944 .full .full))) (.cutY 10880 .full .full)) .empty))) .empty) .empty))) .empty) .empty) (.cutY 12288 .empty (.cutX 22528 (.cutY 14336 .empty (.cutX 21504 .empty (.cutY 15360 (.cutX 22016 (.cutY 14848 .empty (.cutX 21760 .empty (.cutY 15104 (.cutX 21888 (.cutY 14976 .full (.cutX 21824 (.cutY 15040 .full .full) (.cutY 15040 .full .full))) (.cutY 14976 .full .full)) .empty))) .empty) .empty))) .empty)))) .empty) .empty))

theorem metadata17 : 0<50021215 ∧ 42<128 ∧ 69<128 ∧ 1<4 ∧
    7841/4160=1 ∧ 7841%4160=3681 ∧ ∀ i, (leaves17 i).Valid 8 := by
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

noncomputable def phaseMass17 : ℝ := singlePhaseMass (50021215/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw17 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass17_eq : phaseMass17 = (10004243/327680000000 : ℝ) := by
  unfold phaseMass17
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw17 output17 cover17 source17
    (gridTreeUnionCheck_sound 32768 raw17 output17 cover17 source17 tree17 checked17)
    _ (by norm_num) _, areaUnits17]
  norm_num

-- Frozen phase 3914, atom 3201, type 0, source (33,66).
def leavesData18 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves18 : Fin 4 → DyadicLeaf := leavesData18.get
def raw18 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 33 66 leaves18 i
def outputData18 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨8448,8576,16896,17024⟩) (.single ⟨8448,8576,17024,17152⟩)) (.node (.single ⟨8576,8704,16896,17024⟩) (.single ⟨8576,8704,17024,17152⟩))) (.node (.node (.single ⟨15616,15744,24064,24192⟩) (.single ⟨15616,15744,24192,24320⟩)) (.node (.single ⟨15744,15872,24064,24192⟩) (.single ⟨15744,15872,24192,24320⟩)))) (.node (.node (.node (.single ⟨16896,17024,8448,8576⟩) (.single ⟨16896,17024,8576,8704⟩)) (.node (.single ⟨17024,17152,8448,8576⟩) (.single ⟨17024,17152,8576,8704⟩))) (.node (.node (.single ⟨24064,24192,15616,15744⟩) (.single ⟨24064,24192,15744,15872⟩)) (.node (.single ⟨24192,24320,15616,15744⟩) (.single ⟨24192,24320,15744,15872⟩)))))
def output18 : Fin 16 → GridBox := outputData18.get
def coverData18 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData18 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover18 (i : Fin 16) : Fin 16 := ⟨coverData18.get i % 16, Nat.mod_lt _ (by decide)⟩
def source18 (i : Fin 16) : Fin 16 := ⟨sourceData18.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree18 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 (.cutY 18432 (.cutX 9216 (.cutY 17408 (.cutX 8704 (.cutY 16896 .empty (.cutX 8448 .empty (.cutY 17152 (.cutX 8576 (.cutY 17024 .full .full) (.cutY 17024 .full .full)) .empty))) .empty) .empty) .empty) .empty) .empty) .empty) (.cutY 20480 .empty (.cutX 14336 .empty (.cutY 22528 .empty (.cutX 15360 .empty (.cutY 23552 .empty (.cutX 15872 (.cutY 24064 .empty (.cutX 15616 .empty (.cutY 24320 (.cutX 15744 (.cutY 24192 .full .full) (.cutY 24192 .full .full)) .empty))) .empty))))))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 (.cutY 10240 (.cutX 17408 (.cutY 9216 (.cutX 16896 .empty (.cutY 8704 (.cutX 17152 (.cutY 8448 .empty (.cutX 17024 (.cutY 8576 .full .full) (.cutY 8576 .full .full))) .empty) .empty)) .empty) .empty) .empty) .empty) .empty) (.cutY 12288 .empty (.cutX 22528 .empty (.cutY 14336 .empty (.cutX 23552 .empty (.cutY 15360 .empty (.cutX 24064 .empty (.cutY 15872 (.cutX 24320 (.cutY 15616 .empty (.cutX 24192 (.cutY 15744 .full .full) (.cutY 15744 .full .full))) .empty) .empty))))))))) .empty) .empty))

theorem metadata18 : 0<167572778 ∧ 33<128 ∧ 66<128 ∧ 0<4 ∧
    3201/4160=0 ∧ 3201%4160=3201 ∧ ∀ i, (leaves18 i).Valid 8 := by
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

noncomputable def phaseMass18 : ℝ := singlePhaseMass (167572778/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw18 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass18_eq : phaseMass18 = (83786389/819200000000 : ℝ) := by
  unfold phaseMass18
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw18 output18 cover18 source18
    (gridTreeUnionCheck_sound 32768 raw18 output18 cover18 source18 tree18 checked18)
    _ (by norm_num) _, areaUnits18]
  norm_num

-- Frozen phase 3915, atom 4823, type 1, source (5,48).
def leavesData19 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves19 : Fin 10 → DyadicLeaf := leavesData19.get
def raw19 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 5 48 leaves19 i
def outputData19 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨1280,1344,12288,12352⟩) (.single ⟨1280,1344,12352,12416⟩)) (.node (.single ⟨1344,1408,12288,12352⟩) (.node (.single ⟨1344,1408,12352,12416⟩) (.single ⟨1280,1408,12416,12544⟩)))) (.node (.node (.single ⟨1408,1472,12288,12352⟩) (.single ⟨1408,1472,12352,12416⟩)) (.node (.single ⟨1472,1536,12288,12352⟩) (.node (.single ⟨1472,1536,12352,12416⟩) (.single ⟨1408,1536,12416,12544⟩))))) (.node (.node (.node (.single ⟨12288,12352,1280,1344⟩) (.single ⟨12288,12352,1344,1408⟩)) (.node (.single ⟨12352,12416,1280,1344⟩) (.node (.single ⟨12352,12416,1344,1408⟩) (.single ⟨12288,12352,1408,1472⟩)))) (.node (.node (.single ⟨12288,12352,1472,1536⟩) (.single ⟨12352,12416,1408,1472⟩)) (.node (.single ⟨12352,12416,1472,1536⟩) (.node (.single ⟨12416,12544,1280,1408⟩) (.single ⟨12416,12544,1408,1536⟩)))))) (.node (.node (.node (.node (.single ⟨20224,20352,31232,31360⟩) (.single ⟨20224,20352,31360,31488⟩)) (.node (.single ⟨20352,20416,31232,31296⟩) (.node (.single ⟨20352,20416,31296,31360⟩) (.single ⟨20416,20480,31232,31296⟩)))) (.node (.node (.single ⟨20416,20480,31296,31360⟩) (.single ⟨20352,20416,31360,31424⟩)) (.node (.single ⟨20352,20416,31424,31488⟩) (.node (.single ⟨20416,20480,31360,31424⟩) (.single ⟨20416,20480,31424,31488⟩))))) (.node (.node (.node (.single ⟨31232,31360,20224,20352⟩) (.single ⟨31232,31296,20352,20416⟩)) (.node (.single ⟨31232,31296,20416,20480⟩) (.node (.single ⟨31296,31360,20352,20416⟩) (.single ⟨31296,31360,20416,20480⟩)))) (.node (.node (.single ⟨31360,31488,20224,20352⟩) (.single ⟨31360,31424,20352,20416⟩)) (.node (.single ⟨31360,31424,20416,20480⟩) (.node (.single ⟨31424,31488,20352,20416⟩) (.single ⟨31424,31488,20416,20480⟩)))))))
def output19 : Fin 40 → GridBox := outputData19.get
def coverData19 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 18)) (.node (.single 35) (.node (.single 21) (.single 9)))) (.node (.node (.single 19) (.single 30)) (.node (.single 20) (.node (.single 5) (.single 14))))) (.node (.node (.node (.single 34) (.single 25)) (.node (.single 6) (.node (.single 16) (.single 33)))) (.node (.node (.single 23) (.single 7)) (.node (.single 15) (.node (.single 32) (.single 24)))))) (.node (.node (.node (.node (.single 8) (.single 17)) (.node (.single 31) (.node (.single 22) (.single 0)))) (.node (.node (.single 10) (.single 39)) (.node (.single 29) (.node (.single 1) (.single 12))))) (.node (.node (.node (.single 38) (.single 27)) (.node (.single 2) (.node (.single 11) (.single 37)))) (.node (.node (.single 28) (.single 3)) (.node (.single 13) (.node (.single 36) (.single 26)))))))
def sourceData19 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover19 (i : Fin 40) : Fin 40 := ⟨coverData19.get i % 40, Nat.mod_lt _ (by decide)⟩
def source19 (i : Fin 40) : Fin 40 := ⟨sourceData19.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree19 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 (.cutX 1024 .empty (.cutY 13312 (.cutX 1536 (.cutY 12800 (.cutX 1280 .empty (.cutY 12544 (.cutX 1408 (.cutY 12416 (.cutX 1344 (.cutY 12352 .full .full) (.cutY 12352 .full .full)) .full) (.cutY 12416 (.cutX 1472 (.cutY 12352 .full .full) (.cutY 12352 .full .full)) .full)) .empty)) .empty) .empty) .empty)) .empty) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 (.cutY 2048 (.cutX 13312 (.cutY 1024 .empty (.cutX 12800 (.cutY 1536 (.cutX 12544 (.cutY 1280 .empty (.cutX 12416 (.cutY 1408 (.cutX 12352 (.cutY 1344 .full .full) (.cutY 1344 .full .full)) (.cutX 12352 (.cutY 1472 .full .full) (.cutY 1472 .full .full))) (.cutY 1408 .full .full))) .empty) .empty) .empty)) .empty) .empty) .empty) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 .empty (.cutY 30720 .empty (.cutX 19456 .empty (.cutY 31744 (.cutX 19968 .empty (.cutY 31232 .empty (.cutX 20224 .empty (.cutY 31488 (.cutX 20352 (.cutY 31360 .full .full) (.cutY 31360 (.cutX 20416 (.cutY 31296 .full .full) (.cutY 31296 .full .full)) (.cutX 20416 (.cutY 31424 .full .full) (.cutY 31424 .full .full)))) .empty)))) .empty))))) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 .empty (.cutX 31744 (.cutY 19456 .empty (.cutX 31232 .empty (.cutY 19968 .empty (.cutX 31488 (.cutY 20224 .empty (.cutX 31360 (.cutY 20352 .full (.cutX 31296 (.cutY 20416 .full .full) (.cutY 20416 .full .full))) (.cutY 20352 .full (.cutX 31424 (.cutY 20416 .full .full) (.cutY 20416 .full .full))))) .empty)))) .empty))) .empty)) .empty))))

theorem metadata19 : 0<234882010 ∧ 5<128 ∧ 48<128 ∧ 1<4 ∧
    4823/4160=1 ∧ 4823%4160=663 ∧ ∀ i, (leaves19 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData19).mp
    (by decide +kernel)

theorem sourceChecked19_0 : ∀ i : Fin 40,
    (fun i => output19 i = raw19 (source19 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked19 : ∀ i : Fin 40, (fun i => output19 i = raw19 (source19 i)) i :=
  forallFin_of_zero_offset (fun i => output19 i = raw19 (source19 i)) sourceChecked19_0

theorem coverChecked19_0 : ∀ i : Fin 40,
    (fun i => (output19 (cover19 i)).ContainsBox (raw19 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked19 : ∀ i : Fin 40, (fun i => (output19 (cover19 i)).ContainsBox (raw19 i)) i :=
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

noncomputable def phaseMass19 : ℝ := singlePhaseMass (234882010/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw19 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass19_eq : phaseMass19 = (23488201/163840000000 : ℝ) := by
  unfold phaseMass19
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw19 output19 cover19 source19
    (gridTreeUnionCheck_sound 32768 raw19 output19 cover19 source19 tree19 checked19)
    _ (by norm_num) _, areaUnits19]
  norm_num

-- Frozen phase 3916, atom 5705, type 1, source (13,50).
def leavesData20 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves20 : Fin 7 → DyadicLeaf := leavesData20.get
def raw20 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 13 50 leaves20 i
def outputData20 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3328,3456,12800,12928⟩) (.node (.single ⟨3328,3456,12928,13056⟩) (.single ⟨3456,3520,12800,12864⟩))) (.node (.node (.single ⟨3456,3520,12864,12928⟩) (.single ⟨3520,3584,12800,12864⟩)) (.node (.single ⟨3520,3584,12864,12928⟩) (.single ⟨3456,3584,12928,13056⟩)))) (.node (.node (.single ⟨12800,12928,3328,3456⟩) (.node (.single ⟨12800,12864,3456,3520⟩) (.single ⟨12800,12864,3520,3584⟩))) (.node (.node (.single ⟨12864,12928,3456,3520⟩) (.single ⟨12864,12928,3520,3584⟩)) (.node (.single ⟨12928,13056,3328,3456⟩) (.single ⟨12928,13056,3456,3584⟩))))) (.node (.node (.node (.single ⟨19712,19840,29184,29312⟩) (.node (.single ⟨19712,19840,29312,29440⟩) (.single ⟨19840,19904,29184,29248⟩))) (.node (.node (.single ⟨19840,19904,29248,29312⟩) (.single ⟨19904,19968,29184,29248⟩)) (.node (.single ⟨19904,19968,29248,29312⟩) (.single ⟨19840,19968,29312,29440⟩)))) (.node (.node (.single ⟨29184,29312,19712,19840⟩) (.node (.single ⟨29184,29248,19840,19904⟩) (.single ⟨29184,29248,19904,19968⟩))) (.node (.node (.single ⟨29248,29312,19840,19904⟩) (.single ⟨29248,29312,19904,19968⟩)) (.node (.single ⟨29312,29440,19712,19840⟩) (.single ⟨29312,29440,19840,19968⟩))))))
def output20 : Fin 28 → GridBox := outputData20.get
def coverData20 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData20 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover20 (i : Fin 28) : Fin 28 := ⟨coverData20.get i % 28, Nat.mod_lt _ (by decide)⟩
def source20 (i : Fin 28) : Fin 28 := ⟨sourceData20.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree20 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 (.cutX 3072 .empty (.cutY 13312 (.cutX 3584 (.cutY 12800 .empty (.cutX 3328 .empty (.cutY 13056 (.cutX 3456 (.cutY 12928 .full .full) (.cutY 12928 (.cutX 3520 (.cutY 12864 .full .full) (.cutY 12864 .full .full)) .full)) .empty))) .empty) .empty)) .empty))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 (.cutY 2048 .empty (.cutX 13312 (.cutY 3072 .empty (.cutX 12800 .empty (.cutY 3584 (.cutX 13056 (.cutY 3328 .empty (.cutX 12928 (.cutY 3456 .full (.cutX 12864 (.cutY 3520 .full .full) (.cutY 3520 .full .full))) (.cutY 3456 .full .full))) .empty) .empty))) .empty)) .empty) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 .empty (.cutY 30720 (.cutX 19456 .empty (.cutY 29696 (.cutX 19968 (.cutY 29184 .empty (.cutX 19712 .empty (.cutY 29440 (.cutX 19840 (.cutY 29312 .full .full) (.cutY 29312 (.cutX 19904 (.cutY 29248 .full .full) (.cutY 29248 .full .full)) .full)) .empty))) .empty) .empty)) .empty))) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 .empty (.cutX 29696 (.cutY 19456 .empty (.cutX 29184 .empty (.cutY 19968 (.cutX 29440 (.cutY 19712 .empty (.cutX 29312 (.cutY 19840 .full (.cutX 29248 (.cutY 19904 .full .full) (.cutY 19904 .full .full))) (.cutY 19840 .full .full))) .empty) .empty))) .empty)) .empty) .empty)) .empty))))

theorem metadata20 : 0<144841863 ∧ 13<128 ∧ 50<128 ∧ 1<4 ∧
    5705/4160=1 ∧ 5705%4160=1545 ∧ ∀ i, (leaves20 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData20).mp
    (by decide +kernel)

theorem sourceChecked20_0 : ∀ i : Fin 28,
    (fun i => output20 i = raw20 (source20 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked20 : ∀ i : Fin 28, (fun i => output20 i = raw20 (source20 i)) i :=
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

theorem areaUnits20 : gridUnionAreaUnits output20 = 262144 := by decide +kernel

noncomputable def phaseMass20 : ℝ := singlePhaseMass (144841863/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw20 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass20_eq : phaseMass20 = (144841863/1638400000000 : ℝ) := by
  unfold phaseMass20
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw20 output20 cover20 source20
    (gridTreeUnionCheck_sound 32768 raw20 output20 cover20 source20 tree20 checked20)
    _ (by norm_num) _, areaUnits20]
  norm_num

-- Frozen phase 3917, atom 5906, type 1, source (15,51).
def leavesData21 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves21 : Fin 7 → DyadicLeaf := leavesData21.get
def raw21 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 15 51 leaves21 i
def outputData21 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3840,3968,13056,13184⟩) (.node (.single ⟨3840,3968,13184,13312⟩) (.single ⟨3968,4032,13056,13120⟩))) (.node (.node (.single ⟨3968,4032,13120,13184⟩) (.single ⟨4032,4096,13056,13120⟩)) (.node (.single ⟨4032,4096,13120,13184⟩) (.single ⟨3968,4096,13184,13312⟩)))) (.node (.node (.single ⟨13056,13184,3840,3968⟩) (.node (.single ⟨13056,13120,3968,4032⟩) (.single ⟨13056,13120,4032,4096⟩))) (.node (.node (.single ⟨13120,13184,3968,4032⟩) (.single ⟨13120,13184,4032,4096⟩)) (.node (.single ⟨13184,13312,3840,3968⟩) (.single ⟨13184,13312,3968,4096⟩))))) (.node (.node (.node (.single ⟨19456,19584,28672,28800⟩) (.node (.single ⟨19456,19584,28800,28928⟩) (.single ⟨19584,19648,28672,28736⟩))) (.node (.node (.single ⟨19584,19648,28736,28800⟩) (.single ⟨19648,19712,28672,28736⟩)) (.node (.single ⟨19648,19712,28736,28800⟩) (.single ⟨19584,19712,28800,28928⟩)))) (.node (.node (.single ⟨28672,28800,19456,19584⟩) (.node (.single ⟨28672,28736,19584,19648⟩) (.single ⟨28672,28736,19648,19712⟩))) (.node (.node (.single ⟨28736,28800,19584,19648⟩) (.single ⟨28736,28800,19648,19712⟩)) (.node (.single ⟨28800,28928,19456,19584⟩) (.single ⟨28800,28928,19584,19712⟩))))))
def output21 : Fin 28 → GridBox := outputData21.get
def coverData21 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData21 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover21 (i : Fin 28) : Fin 28 := ⟨coverData21.get i % 28, Nat.mod_lt _ (by decide)⟩
def source21 (i : Fin 28) : Fin 28 := ⟨sourceData21.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree21 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 (.cutX 3072 .empty (.cutY 13312 (.cutX 3584 .empty (.cutY 12800 .empty (.cutX 3840 .empty (.cutY 13056 .empty (.cutX 3968 (.cutY 13184 .full .full) (.cutY 13184 (.cutX 4032 (.cutY 13120 .full .full) (.cutY 13120 .full .full)) .full)))))) .empty)) .empty))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 (.cutY 2048 .empty (.cutX 13312 (.cutY 3072 .empty (.cutX 12800 .empty (.cutY 3584 .empty (.cutX 13056 .empty (.cutY 3840 .empty (.cutX 13184 (.cutY 3968 .full (.cutX 13120 (.cutY 4032 .full .full) (.cutY 4032 .full .full))) (.cutY 3968 .full .full))))))) .empty)) .empty) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 .empty (.cutY 30720 (.cutX 19456 .empty (.cutY 29696 (.cutX 19968 (.cutY 29184 (.cutX 19712 (.cutY 28928 (.cutX 19584 (.cutY 28800 .full .full) (.cutY 28800 (.cutX 19648 (.cutY 28736 .full .full) (.cutY 28736 .full .full)) .full)) .empty) .empty) .empty) .empty) .empty)) .empty))) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 .empty (.cutX 29696 (.cutY 19456 .empty (.cutX 29184 (.cutY 19968 (.cutX 28928 (.cutY 19712 (.cutX 28800 (.cutY 19584 .full (.cutX 28736 (.cutY 19648 .full .full) (.cutY 19648 .full .full))) (.cutY 19584 .full .full)) .empty) .empty) .empty) .empty)) .empty)) .empty) .empty)) .empty))))

theorem metadata21 : 0<144841863 ∧ 15<128 ∧ 51<128 ∧ 1<4 ∧
    5906/4160=1 ∧ 5906%4160=1746 ∧ ∀ i, (leaves21 i).Valid 8 := by
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

noncomputable def phaseMass21 : ℝ := singlePhaseMass (144841863/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw21 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass21_eq : phaseMass21 = (144841863/1638400000000 : ℝ) := by
  unfold phaseMass21
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw21 output21 cover21 source21
    (gridTreeUnionCheck_sound 32768 raw21 output21 cover21 source21 tree21 checked21)
    _ (by norm_num) _, areaUnits21]
  norm_num

-- Frozen phase 3918, atom 6374, type 1, source (20,54).
def leavesData22 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves22 : Fin 7 → DyadicLeaf := leavesData22.get
def raw22 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 20 54 leaves22 i
def outputData22 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨5120,5248,13824,13952⟩) (.node (.single ⟨5120,5248,13952,14080⟩) (.single ⟨5248,5312,13824,13888⟩))) (.node (.node (.single ⟨5248,5312,13888,13952⟩) (.single ⟨5312,5376,13824,13888⟩)) (.node (.single ⟨5312,5376,13888,13952⟩) (.single ⟨5248,5376,13952,14080⟩)))) (.node (.node (.single ⟨13824,13952,5120,5248⟩) (.node (.single ⟨13824,13888,5248,5312⟩) (.single ⟨13824,13888,5312,5376⟩))) (.node (.node (.single ⟨13888,13952,5248,5312⟩) (.single ⟨13888,13952,5312,5376⟩)) (.node (.single ⟨13952,14080,5120,5248⟩) (.single ⟨13952,14080,5248,5376⟩))))) (.node (.node (.node (.single ⟨18688,18816,27392,27520⟩) (.node (.single ⟨18688,18816,27520,27648⟩) (.single ⟨18816,18880,27392,27456⟩))) (.node (.node (.single ⟨18816,18880,27456,27520⟩) (.single ⟨18880,18944,27392,27456⟩)) (.node (.single ⟨18880,18944,27456,27520⟩) (.single ⟨18816,18944,27520,27648⟩)))) (.node (.node (.single ⟨27392,27520,18688,18816⟩) (.node (.single ⟨27392,27456,18816,18880⟩) (.single ⟨27392,27456,18880,18944⟩))) (.node (.node (.single ⟨27456,27520,18816,18880⟩) (.single ⟨27456,27520,18880,18944⟩)) (.node (.single ⟨27520,27648,18688,18816⟩) (.single ⟨27520,27648,18816,18944⟩))))))
def output22 : Fin 28 → GridBox := outputData22.get
def coverData22 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData22 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover22 (i : Fin 28) : Fin 28 := ⟨coverData22.get i % 28, Nat.mod_lt _ (by decide)⟩
def source22 (i : Fin 28) : Fin 28 := ⟨sourceData22.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree22 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 (.cutY 14336 (.cutX 5120 .empty (.cutY 13312 .empty (.cutX 5632 (.cutY 13824 .empty (.cutX 5376 (.cutY 14080 (.cutX 5248 (.cutY 13952 .full .full) (.cutY 13952 (.cutX 5312 (.cutY 13888 .full .full) (.cutY 13888 .full .full)) .full)) .empty) .empty)) .empty))) .empty) .empty)))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 (.cutY 6144 (.cutX 13312 .empty (.cutY 5120 .empty (.cutX 13824 .empty (.cutY 5632 (.cutX 14080 (.cutY 5376 (.cutX 13952 (.cutY 5248 .full (.cutX 13888 (.cutY 5312 .full .full) (.cutY 5312 .full .full))) (.cutY 5248 .full .full)) .empty) .empty) .empty)))) .empty) .empty))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 .empty (.cutY 26624 .empty (.cutX 19456 (.cutY 27648 (.cutX 18944 (.cutY 27136 .empty (.cutX 18688 .empty (.cutY 27392 .empty (.cutX 18816 (.cutY 27520 .full .full) (.cutY 27520 (.cutX 18880 (.cutY 27456 .full .full) (.cutY 27456 .full .full)) .full))))) .empty) .empty) .empty))) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 .empty (.cutY 18432 .empty (.cutX 27648 (.cutY 19456 (.cutX 27136 .empty (.cutY 18944 (.cutX 27392 .empty (.cutY 18688 .empty (.cutX 27520 (.cutY 18816 .full (.cutX 27456 (.cutY 18880 .full .full) (.cutY 18880 .full .full))) (.cutY 18816 .full .full)))) .empty)) .empty) .empty))) .empty) .empty) .empty))))

theorem metadata22 : 0<199204038 ∧ 20<128 ∧ 54<128 ∧ 1<4 ∧
    6374/4160=1 ∧ 6374%4160=2214 ∧ ∀ i, (leaves22 i).Valid 8 := by
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

noncomputable def phaseMass22 : ℝ := singlePhaseMass (199204038/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw22 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass22_eq : phaseMass22 = (99602019/819200000000 : ℝ) := by
  unfold phaseMass22
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw22 output22 cover22 source22
    (gridTreeUnionCheck_sound 32768 raw22 output22 cover22 source22 tree22 checked22)
    _ (by norm_num) _, areaUnits22]
  norm_num

-- Frozen phase 3919, atom 1942, type 0, source (17,55).
def leavesData23 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves23 : Fin 4 → DyadicLeaf := leavesData23.get
def raw23 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 17 55 leaves23 i
def outputData23 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨4352,4480,14080,14208⟩) (.single ⟨4352,4480,14208,14336⟩)) (.node (.single ⟨4480,4608,14080,14208⟩) (.single ⟨4480,4608,14208,14336⟩))) (.node (.node (.single ⟨14080,14208,4352,4480⟩) (.single ⟨14080,14208,4480,4608⟩)) (.node (.single ⟨14208,14336,4352,4480⟩) (.single ⟨14208,14336,4480,4608⟩)))) (.node (.node (.node (.single ⟨18432,18560,28160,28288⟩) (.single ⟨18432,18560,28288,28416⟩)) (.node (.single ⟨18560,18688,28160,28288⟩) (.single ⟨18560,18688,28288,28416⟩))) (.node (.node (.single ⟨28160,28288,18432,18560⟩) (.single ⟨28160,28288,18560,18688⟩)) (.node (.single ⟨28288,28416,18432,18560⟩) (.single ⟨28288,28416,18560,18688⟩)))))
def output23 : Fin 16 → GridBox := outputData23.get
def coverData23 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData23 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover23 (i : Fin 16) : Fin 16 := ⟨coverData23.get i % 16, Nat.mod_lt _ (by decide)⟩
def source23 (i : Fin 16) : Fin 16 := ⟨sourceData23.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree23 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 (.cutY 14336 (.cutX 5120 (.cutY 13312 .empty (.cutX 4608 (.cutY 13824 .empty (.cutX 4352 .empty (.cutY 14080 .empty (.cutX 4480 (.cutY 14208 .full .full) (.cutY 14208 .full .full))))) .empty)) .empty) .empty) .empty)))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 (.cutY 6144 (.cutX 13312 .empty (.cutY 5120 (.cutX 13824 .empty (.cutY 4608 (.cutX 14080 .empty (.cutY 4352 .empty (.cutX 14208 (.cutY 4480 .full .full) (.cutY 4480 .full .full)))) .empty)) .empty)) .empty) .empty))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 .empty (.cutY 26624 .empty (.cutX 19456 (.cutY 27648 .empty (.cutX 18944 (.cutY 28160 .empty (.cutX 18688 (.cutY 28416 (.cutX 18560 (.cutY 28288 .full .full) (.cutY 28288 .full .full)) .empty) .empty)) .empty)) .empty))) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 .empty (.cutY 18432 .empty (.cutX 27648 .empty (.cutY 19456 (.cutX 28160 .empty (.cutY 18944 (.cutX 28416 (.cutY 18688 (.cutX 28288 (.cutY 18560 .full .full) (.cutY 18560 .full .full)) .empty) .empty) .empty)) .empty)))) .empty) .empty) .empty))))

theorem metadata23 : 0<204777576 ∧ 17<128 ∧ 55<128 ∧ 0<4 ∧
    1942/4160=0 ∧ 1942%4160=1942 ∧ ∀ i, (leaves23 i).Valid 8 := by
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

noncomputable def phaseMass23 : ℝ := singlePhaseMass (204777576/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw23 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass23_eq : phaseMass23 = (25597197/204800000000 : ℝ) := by
  unfold phaseMass23
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw23 output23 cover23 source23
    (gridTreeUnionCheck_sound 32768 raw23 output23 cover23 source23 tree23 checked23)
    _ (by norm_num) _, areaUnits23]
  norm_num

-- Frozen phase 3920, atom 49, type 0, source (0,49).
def leavesData24 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves24 : Fin 4 → DyadicLeaf := leavesData24.get
def raw24 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 0 49 leaves24 i
def outputData24 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨0,128,12544,12672⟩) (.single ⟨0,128,12672,12800⟩)) (.node (.single ⟨128,256,12544,12672⟩) (.single ⟨128,256,12672,12800⟩))) (.node (.node (.single ⟨12544,12672,0,128⟩) (.single ⟨12544,12672,128,256⟩)) (.node (.single ⟨12672,12800,0,128⟩) (.single ⟨12672,12800,128,256⟩)))) (.node (.node (.node (.single ⟨19968,20096,32512,32640⟩) (.single ⟨19968,20096,32640,32768⟩)) (.node (.single ⟨20096,20224,32512,32640⟩) (.single ⟨20096,20224,32640,32768⟩))) (.node (.node (.single ⟨32512,32640,19968,20096⟩) (.single ⟨32512,32640,20096,20224⟩)) (.node (.single ⟨32640,32768,19968,20096⟩) (.single ⟨32640,32768,20096,20224⟩)))))
def output24 : Fin 16 → GridBox := outputData24.get
def coverData24 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData24 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover24 (i : Fin 16) : Fin 16 := ⟨coverData24.get i % 16, Nat.mod_lt _ (by decide)⟩
def source24 (i : Fin 16) : Fin 16 := ⟨sourceData24.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree24 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 (.cutX 1024 (.cutY 13312 (.cutX 512 (.cutY 12800 (.cutX 256 (.cutY 12544 .empty (.cutX 128 (.cutY 12672 .full .full) (.cutY 12672 .full .full))) .empty) .empty) .empty) .empty) .empty) .empty) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 (.cutY 2048 (.cutX 13312 (.cutY 1024 (.cutX 12800 (.cutY 512 (.cutX 12544 .empty (.cutY 256 (.cutX 12672 (.cutY 128 .full .full) (.cutY 128 .full .full)) .empty)) .empty) .empty) .empty) .empty) .empty) .empty) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 .empty (.cutY 30720 .empty (.cutX 19456 .empty (.cutY 31744 .empty (.cutX 19968 .empty (.cutY 32256 .empty (.cutX 20224 (.cutY 32512 .empty (.cutX 20096 (.cutY 32640 .full .full) (.cutY 32640 .full .full))) .empty)))))))) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 .empty (.cutX 31744 .empty (.cutY 19456 .empty (.cutX 32256 .empty (.cutY 19968 .empty (.cutX 32512 .empty (.cutY 20224 (.cutX 32640 (.cutY 20096 .full .full) (.cutY 20096 .full .full)) .empty)))))))) .empty)) .empty))))

theorem metadata24 : 0<214747992 ∧ 0<128 ∧ 49<128 ∧ 0<4 ∧
    49/4160=0 ∧ 49%4160=49 ∧ ∀ i, (leaves24 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData24).mp
    (by decide +kernel)

theorem sourceChecked24_0 : ∀ i : Fin 16,
    (fun i => output24 i = raw24 (source24 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked24 : ∀ i : Fin 16, (fun i => output24 i = raw24 (source24 i)) i :=
  forallFin_of_zero_offset (fun i => output24 i = raw24 (source24 i)) sourceChecked24_0

theorem coverChecked24_0 : ∀ i : Fin 16,
    (fun i => (output24 (cover24 i)).ContainsBox (raw24 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked24 : ∀ i : Fin 16, (fun i => (output24 (cover24 i)).ContainsBox (raw24 i)) i :=
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

noncomputable def phaseMass24 : ℝ := singlePhaseMass (214747992/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw24 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass24_eq : phaseMass24 = (26843499/204800000000 : ℝ) := by
  unfold phaseMass24
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw24 output24 cover24 source24
    (gridTreeUnionCheck_sound 32768 raw24 output24 cover24 source24 tree24 checked24)
    _ (by norm_num) _, areaUnits24]
  norm_num

-- Frozen phase 3921, atom 2390, type 0, source (22,58).
def leavesData25 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves25 : Fin 4 → DyadicLeaf := leavesData25.get
def raw25 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 22 58 leaves25 i
def outputData25 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨5632,5760,14848,14976⟩) (.single ⟨5632,5760,14976,15104⟩)) (.node (.single ⟨5760,5888,14848,14976⟩) (.single ⟨5760,5888,14976,15104⟩))) (.node (.node (.single ⟨14848,14976,5632,5760⟩) (.single ⟨14848,14976,5760,5888⟩)) (.node (.single ⟨14976,15104,5632,5760⟩) (.single ⟨14976,15104,5760,5888⟩)))) (.node (.node (.node (.single ⟨17664,17792,26880,27008⟩) (.single ⟨17664,17792,27008,27136⟩)) (.node (.single ⟨17792,17920,26880,27008⟩) (.single ⟨17792,17920,27008,27136⟩))) (.node (.node (.single ⟨26880,27008,17664,17792⟩) (.single ⟨26880,27008,17792,17920⟩)) (.node (.single ⟨27008,27136,17664,17792⟩) (.single ⟨27008,27136,17792,17920⟩)))))
def output25 : Fin 16 → GridBox := outputData25.get
def coverData25 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData25 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover25 (i : Fin 16) : Fin 16 := ⟨coverData25.get i % 16, Nat.mod_lt _ (by decide)⟩
def source25 (i : Fin 16) : Fin 16 := ⟨sourceData25.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree25 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 (.cutY 14336 .empty (.cutX 5120 .empty (.cutY 15360 (.cutX 5632 .empty (.cutY 14848 .empty (.cutX 5888 (.cutY 15104 (.cutX 5760 (.cutY 14976 .full .full) (.cutY 14976 .full .full)) .empty) .empty))) .empty))) .empty)))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 .empty (.cutY 6144 (.cutX 15360 (.cutY 5120 .empty (.cutX 14848 .empty (.cutY 5632 .empty (.cutX 15104 (.cutY 5888 (.cutX 14976 (.cutY 5760 .full .full) (.cutY 5760 .full .full)) .empty) .empty)))) .empty) .empty)))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 (.cutY 26624 .empty (.cutX 17408 .empty (.cutY 27648 (.cutX 17920 (.cutY 27136 (.cutX 17664 .empty (.cutY 26880 .empty (.cutX 17792 (.cutY 27008 .full .full) (.cutY 27008 .full .full)))) .empty) .empty) .empty))) .empty) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 .empty (.cutY 18432 (.cutX 27648 (.cutY 17408 .empty (.cutX 27136 (.cutY 17920 (.cutX 26880 .empty (.cutY 17664 .empty (.cutX 27008 (.cutY 17792 .full .full) (.cutY 17792 .full .full)))) .empty) .empty)) .empty) .empty)) .empty) .empty) .empty))))

theorem metadata25 : 0<185830537 ∧ 22<128 ∧ 58<128 ∧ 0<4 ∧
    2390/4160=0 ∧ 2390%4160=2390 ∧ ∀ i, (leaves25 i).Valid 8 := by
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

noncomputable def phaseMass25 : ℝ := singlePhaseMass (185830537/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw25 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass25_eq : phaseMass25 = (185830537/1638400000000 : ℝ) := by
  unfold phaseMass25
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw25 output25 cover25 source25
    (gridTreeUnionCheck_sound 32768 raw25 output25 cover25 source25 tree25 checked25)
    _ (by norm_num) _, areaUnits25]
  norm_num

-- Frozen phase 3922, atom 1011, type 0, source (8,51).
def leavesData26 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves26 : Fin 4 → DyadicLeaf := leavesData26.get
def raw26 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 8 51 leaves26 i
def outputData26 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨2048,2176,13056,13184⟩) (.single ⟨2048,2176,13184,13312⟩)) (.node (.single ⟨2176,2304,13056,13184⟩) (.single ⟨2176,2304,13184,13312⟩))) (.node (.node (.single ⟨13056,13184,2048,2176⟩) (.single ⟨13056,13184,2176,2304⟩)) (.node (.single ⟨13184,13312,2048,2176⟩) (.single ⟨13184,13312,2176,2304⟩)))) (.node (.node (.node (.single ⟨19456,19584,30464,30592⟩) (.single ⟨19456,19584,30592,30720⟩)) (.node (.single ⟨19584,19712,30464,30592⟩) (.single ⟨19584,19712,30592,30720⟩))) (.node (.node (.single ⟨30464,30592,19456,19584⟩) (.single ⟨30464,30592,19584,19712⟩)) (.node (.single ⟨30592,30720,19456,19584⟩) (.single ⟨30592,30720,19584,19712⟩)))))
def output26 : Fin 16 → GridBox := outputData26.get
def coverData26 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData26 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover26 (i : Fin 16) : Fin 16 := ⟨coverData26.get i % 16, Nat.mod_lt _ (by decide)⟩
def source26 (i : Fin 16) : Fin 16 := ⟨sourceData26.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree26 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 (.cutX 3072 (.cutY 13312 (.cutX 2560 (.cutY 12800 .empty (.cutX 2304 (.cutY 13056 .empty (.cutX 2176 (.cutY 13184 .full .full) (.cutY 13184 .full .full))) .empty)) .empty) .empty) .empty) .empty))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 (.cutY 2048 .empty (.cutX 13312 (.cutY 3072 (.cutX 12800 .empty (.cutY 2560 (.cutX 13056 .empty (.cutY 2304 (.cutX 13184 (.cutY 2176 .full .full) (.cutY 2176 .full .full)) .empty)) .empty)) .empty) .empty)) .empty) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 .empty (.cutY 30720 (.cutX 19456 .empty (.cutY 29696 .empty (.cutX 19968 (.cutY 30208 .empty (.cutX 19712 (.cutY 30464 .empty (.cutX 19584 (.cutY 30592 .full .full) (.cutY 30592 .full .full))) .empty)) .empty))) .empty))) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 .empty (.cutX 29696 .empty (.cutY 19456 .empty (.cutX 30208 .empty (.cutY 19968 (.cutX 30464 .empty (.cutY 19712 (.cutX 30592 (.cutY 19584 .full .full) (.cutY 19584 .full .full)) .empty)) .empty))))) .empty) .empty)) .empty))))

theorem metadata26 : 0<206808448 ∧ 8<128 ∧ 51<128 ∧ 0<4 ∧
    1011/4160=0 ∧ 1011%4160=1011 ∧ ∀ i, (leaves26 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData26).mp
    (by decide +kernel)

theorem sourceChecked26_0 : ∀ i : Fin 16,
    (fun i => output26 i = raw26 (source26 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked26 : ∀ i : Fin 16, (fun i => output26 i = raw26 (source26 i)) i :=
  forallFin_of_zero_offset (fun i => output26 i = raw26 (source26 i)) sourceChecked26_0

theorem coverChecked26_0 : ∀ i : Fin 16,
    (fun i => (output26 (cover26 i)).ContainsBox (raw26 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked26 : ∀ i : Fin 16, (fun i => (output26 (cover26 i)).ContainsBox (raw26 i)) i :=
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

noncomputable def phaseMass26 : ℝ := singlePhaseMass (206808448/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw26 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass26_eq : phaseMass26 = (1615691/12800000000 : ℝ) := by
  unfold phaseMass26
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw26 output26 cover26 source26
    (gridTreeUnionCheck_sound 32768 raw26 output26 cover26 source26 tree26 checked26)
    _ (by norm_num) _, areaUnits26]
  norm_num

-- Frozen phase 3923, atom 1749, type 0, source (15,54).
def leavesData27 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves27 : Fin 4 → DyadicLeaf := leavesData27.get
def raw27 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 15 54 leaves27 i
def outputData27 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨3840,3968,13824,13952⟩) (.single ⟨3840,3968,13952,14080⟩)) (.node (.single ⟨3968,4096,13824,13952⟩) (.single ⟨3968,4096,13952,14080⟩))) (.node (.node (.single ⟨13824,13952,3840,3968⟩) (.single ⟨13824,13952,3968,4096⟩)) (.node (.single ⟨13952,14080,3840,3968⟩) (.single ⟨13952,14080,3968,4096⟩)))) (.node (.node (.node (.single ⟨18688,18816,28672,28800⟩) (.single ⟨18688,18816,28800,28928⟩)) (.node (.single ⟨18816,18944,28672,28800⟩) (.single ⟨18816,18944,28800,28928⟩))) (.node (.node (.single ⟨28672,28800,18688,18816⟩) (.single ⟨28672,28800,18816,18944⟩)) (.node (.single ⟨28800,28928,18688,18816⟩) (.single ⟨28800,28928,18816,18944⟩)))))
def output27 : Fin 16 → GridBox := outputData27.get
def coverData27 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData27 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover27 (i : Fin 16) : Fin 16 := ⟨coverData27.get i % 16, Nat.mod_lt _ (by decide)⟩
def source27 (i : Fin 16) : Fin 16 := ⟨sourceData27.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree27 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 (.cutX 3072 .empty (.cutY 13312 .empty (.cutX 3584 .empty (.cutY 13824 .empty (.cutX 3840 .empty (.cutY 14080 (.cutX 3968 (.cutY 13952 .full .full) (.cutY 13952 .full .full)) .empty)))))) .empty))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 (.cutY 2048 .empty (.cutX 13312 .empty (.cutY 3072 .empty (.cutX 13824 .empty (.cutY 3584 .empty (.cutX 14080 (.cutY 3840 .empty (.cutX 13952 (.cutY 3968 .full .full) (.cutY 3968 .full .full))) .empty)))))) .empty) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 .empty (.cutY 30720 (.cutX 19456 (.cutY 29696 (.cutX 18944 (.cutY 29184 (.cutX 18688 .empty (.cutY 28928 (.cutX 18816 (.cutY 28800 .full .full) (.cutY 28800 .full .full)) .empty)) .empty) .empty) .empty) .empty) .empty))) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 .empty (.cutX 29696 (.cutY 19456 (.cutX 29184 (.cutY 18944 (.cutX 28928 (.cutY 18688 .empty (.cutX 28800 (.cutY 18816 .full .full) (.cutY 18816 .full .full))) .empty) .empty) .empty) .empty) .empty)) .empty) .empty)) .empty))))

theorem metadata27 : 0<206808448 ∧ 15<128 ∧ 54<128 ∧ 0<4 ∧
    1749/4160=0 ∧ 1749%4160=1749 ∧ ∀ i, (leaves27 i).Valid 8 := by
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

noncomputable def phaseMass27 : ℝ := singlePhaseMass (206808448/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw27 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass27_eq : phaseMass27 = (1615691/12800000000 : ℝ) := by
  unfold phaseMass27
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw27 output27 cover27 source27
    (gridTreeUnionCheck_sound 32768 raw27 output27 cover27 source27 tree27 checked27)
    _ (by norm_num) _, areaUnits27]
  norm_num

-- Frozen phase 3924, atom 1548, type 0, source (13,53).
def leavesData28 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves28 : Fin 4 → DyadicLeaf := leavesData28.get
def raw28 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 13 53 leaves28 i
def outputData28 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨3328,3456,13568,13696⟩) (.single ⟨3328,3456,13696,13824⟩)) (.node (.single ⟨3456,3584,13568,13696⟩) (.single ⟨3456,3584,13696,13824⟩))) (.node (.node (.single ⟨13568,13696,3328,3456⟩) (.single ⟨13568,13696,3456,3584⟩)) (.node (.single ⟨13696,13824,3328,3456⟩) (.single ⟨13696,13824,3456,3584⟩)))) (.node (.node (.node (.single ⟨18944,19072,29184,29312⟩) (.single ⟨18944,19072,29312,29440⟩)) (.node (.single ⟨19072,19200,29184,29312⟩) (.single ⟨19072,19200,29312,29440⟩))) (.node (.node (.single ⟨29184,29312,18944,19072⟩) (.single ⟨29184,29312,19072,19200⟩)) (.node (.single ⟨29312,29440,18944,19072⟩) (.single ⟨29312,29440,19072,19200⟩)))))
def output28 : Fin 16 → GridBox := outputData28.get
def coverData28 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData28 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover28 (i : Fin 16) : Fin 16 := ⟨coverData28.get i % 16, Nat.mod_lt _ (by decide)⟩
def source28 (i : Fin 16) : Fin 16 := ⟨sourceData28.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree28 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 (.cutX 3072 .empty (.cutY 13312 .empty (.cutX 3584 (.cutY 13824 (.cutX 3328 .empty (.cutY 13568 .empty (.cutX 3456 (.cutY 13696 .full .full) (.cutY 13696 .full .full)))) .empty) .empty))) .empty))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 (.cutY 2048 .empty (.cutX 13312 .empty (.cutY 3072 .empty (.cutX 13824 (.cutY 3584 (.cutX 13568 .empty (.cutY 3328 .empty (.cutX 13696 (.cutY 3456 .full .full) (.cutY 3456 .full .full)))) .empty) .empty)))) .empty) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 .empty (.cutY 30720 (.cutX 19456 (.cutY 29696 (.cutX 18944 .empty (.cutY 29184 .empty (.cutX 19200 (.cutY 29440 (.cutX 19072 (.cutY 29312 .full .full) (.cutY 29312 .full .full)) .empty) .empty))) .empty) .empty) .empty))) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 .empty (.cutX 29696 (.cutY 19456 (.cutX 29184 .empty (.cutY 18944 .empty (.cutX 29440 (.cutY 19200 (.cutX 29312 (.cutY 19072 .full .full) (.cutY 19072 .full .full)) .empty) .empty))) .empty) .empty)) .empty) .empty)) .empty))))

theorem metadata28 : 0<206808448 ∧ 13<128 ∧ 53<128 ∧ 0<4 ∧
    1548/4160=0 ∧ 1548%4160=1548 ∧ ∀ i, (leaves28 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData28).mp
    (by decide +kernel)

theorem sourceChecked28_0 : ∀ i : Fin 16,
    (fun i => output28 i = raw28 (source28 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked28 : ∀ i : Fin 16, (fun i => output28 i = raw28 (source28 i)) i :=
  forallFin_of_zero_offset (fun i => output28 i = raw28 (source28 i)) sourceChecked28_0

theorem coverChecked28_0 : ∀ i : Fin 16,
    (fun i => (output28 (cover28 i)).ContainsBox (raw28 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked28 : ∀ i : Fin 16, (fun i => (output28 (cover28 i)).ContainsBox (raw28 i)) i :=
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

noncomputable def phaseMass28 : ℝ := singlePhaseMass (206808448/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw28 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass28_eq : phaseMass28 = (1615691/12800000000 : ℝ) := by
  unfold phaseMass28
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw28 output28 cover28 source28
    (gridTreeUnionCheck_sound 32768 raw28 output28 cover28 source28 tree28 checked28)
    _ (by norm_num) _, areaUnits28]
  norm_num

-- Frozen phase 3925, atom 3640, type 0, source (41,73).
def leavesData29 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves29 : Fin 4 → DyadicLeaf := leavesData29.get
def raw29 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 41 73 leaves29 i
def outputData29 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨10496,10624,18688,18816⟩) (.single ⟨10496,10624,18816,18944⟩)) (.node (.single ⟨10624,10752,18688,18816⟩) (.single ⟨10624,10752,18816,18944⟩))) (.node (.node (.single ⟨13824,13952,22016,22144⟩) (.single ⟨13824,13952,22144,22272⟩)) (.node (.single ⟨13952,14080,22016,22144⟩) (.single ⟨13952,14080,22144,22272⟩)))) (.node (.node (.node (.single ⟨18688,18816,10496,10624⟩) (.single ⟨18688,18816,10624,10752⟩)) (.node (.single ⟨18816,18944,10496,10624⟩) (.single ⟨18816,18944,10624,10752⟩))) (.node (.node (.single ⟨22016,22144,13824,13952⟩) (.single ⟨22016,22144,13952,14080⟩)) (.node (.single ⟨22144,22272,13824,13952⟩) (.single ⟨22144,22272,13952,14080⟩)))))
def output29 : Fin 16 → GridBox := outputData29.get
def coverData29 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData29 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover29 (i : Fin 16) : Fin 16 := ⟨coverData29.get i % 16, Nat.mod_lt _ (by decide)⟩
def source29 (i : Fin 16) : Fin 16 := ⟨sourceData29.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree29 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 .empty (.cutY 18432 .empty (.cutX 11264 (.cutY 19456 (.cutX 10752 (.cutY 18944 (.cutX 10496 .empty (.cutY 18688 .empty (.cutX 10624 (.cutY 18816 .full .full) (.cutY 18816 .full .full)))) .empty) .empty) .empty) .empty))) .empty) (.cutY 20480 .empty (.cutX 14336 (.cutY 22528 (.cutX 13312 .empty (.cutY 21504 .empty (.cutX 13824 .empty (.cutY 22016 .empty (.cutX 14080 (.cutY 22272 (.cutX 13952 (.cutY 22144 .full .full) (.cutY 22144 .full .full)) .empty) .empty))))) .empty) .empty))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 .empty (.cutY 10240 .empty (.cutX 19456 (.cutY 11264 (.cutX 18944 (.cutY 10752 (.cutX 18688 .empty (.cutY 10496 .empty (.cutX 18816 (.cutY 10624 .full .full) (.cutY 10624 .full .full)))) .empty) .empty) .empty) .empty))) .empty) (.cutY 12288 .empty (.cutX 22528 (.cutY 14336 (.cutX 21504 .empty (.cutY 13312 .empty (.cutX 22016 .empty (.cutY 13824 .empty (.cutX 22272 (.cutY 14080 (.cutX 22144 (.cutY 13952 .full .full) (.cutY 13952 .full .full)) .empty) .empty))))) .empty) .empty)))) .empty) .empty))

theorem metadata29 : 0<211618637 ∧ 41<128 ∧ 73<128 ∧ 0<4 ∧
    3640/4160=0 ∧ 3640%4160=3640 ∧ ∀ i, (leaves29 i).Valid 8 := by
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

noncomputable def phaseMass29 : ℝ := singlePhaseMass (211618637/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw29 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass29_eq : phaseMass29 = (211618637/1638400000000 : ℝ) := by
  unfold phaseMass29
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw29 output29 cover29 source29
    (gridTreeUnionCheck_sound 32768 raw29 output29 cover29 source29 tree29 checked29)
    _ (by norm_num) _, areaUnits29]
  norm_num

-- Frozen phase 3926, atom 3542, type 0, source (39,71).
def leavesData30 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves30 : Fin 7 → DyadicLeaf := leavesData30.get
def raw30 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 39 71 leaves30 i
def outputData30 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨9984,10112,18176,18304⟩) (.node (.single ⟨9984,10112,18304,18432⟩) (.single ⟨10112,10176,18176,18240⟩))) (.node (.node (.single ⟨10112,10176,18240,18304⟩) (.single ⟨10176,10240,18176,18240⟩)) (.node (.single ⟨10176,10240,18240,18304⟩) (.single ⟨10112,10240,18304,18432⟩)))) (.node (.node (.single ⟨14336,14464,22528,22656⟩) (.node (.single ⟨14336,14464,22656,22784⟩) (.single ⟨14464,14528,22528,22592⟩))) (.node (.node (.single ⟨14464,14528,22592,22656⟩) (.single ⟨14528,14592,22528,22592⟩)) (.node (.single ⟨14528,14592,22592,22656⟩) (.single ⟨14464,14592,22656,22784⟩))))) (.node (.node (.node (.single ⟨18176,18304,9984,10112⟩) (.node (.single ⟨18176,18240,10112,10176⟩) (.single ⟨18176,18240,10176,10240⟩))) (.node (.node (.single ⟨18240,18304,10112,10176⟩) (.single ⟨18240,18304,10176,10240⟩)) (.node (.single ⟨18304,18432,9984,10112⟩) (.single ⟨18304,18432,10112,10240⟩)))) (.node (.node (.single ⟨22528,22656,14336,14464⟩) (.node (.single ⟨22528,22592,14464,14528⟩) (.single ⟨22528,22592,14528,14592⟩))) (.node (.node (.single ⟨22592,22656,14464,14528⟩) (.single ⟨22592,22656,14528,14592⟩)) (.node (.single ⟨22656,22784,14336,14464⟩) (.single ⟨22656,22784,14464,14592⟩))))))
def output30 : Fin 28 → GridBox := outputData30.get
def coverData30 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData30 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover30 (i : Fin 28) : Fin 28 := ⟨coverData30.get i % 28, Nat.mod_lt _ (by decide)⟩
def source30 (i : Fin 28) : Fin 28 := ⟨sourceData30.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree30 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 (.cutY 18432 (.cutX 9216 .empty (.cutY 17408 .empty (.cutX 9728 .empty (.cutY 17920 .empty (.cutX 9984 .empty (.cutY 18176 .empty (.cutX 10112 (.cutY 18304 .full .full) (.cutY 18304 (.cutX 10176 (.cutY 18240 .full .full) (.cutY 18240 .full .full)) .full)))))))) .empty) .empty) .empty) (.cutY 20480 .empty (.cutX 14336 .empty (.cutY 22528 .empty (.cutX 15360 (.cutY 23552 (.cutX 14848 (.cutY 23040 (.cutX 14592 (.cutY 22784 (.cutX 14464 (.cutY 22656 .full .full) (.cutY 22656 (.cutX 14528 (.cutY 22592 .full .full) (.cutY 22592 .full .full)) .full)) .empty) .empty) .empty) .empty) .empty) .empty))))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 (.cutY 10240 (.cutX 17408 .empty (.cutY 9216 .empty (.cutX 17920 .empty (.cutY 9728 .empty (.cutX 18176 .empty (.cutY 9984 .empty (.cutX 18304 (.cutY 10112 .full (.cutX 18240 (.cutY 10176 .full .full) (.cutY 10176 .full .full))) (.cutY 10112 .full .full)))))))) .empty) .empty) .empty) (.cutY 12288 .empty (.cutX 22528 .empty (.cutY 14336 .empty (.cutX 23552 (.cutY 15360 (.cutX 23040 (.cutY 14848 (.cutX 22784 (.cutY 14592 (.cutX 22656 (.cutY 14464 .full (.cutX 22592 (.cutY 14528 .full .full) (.cutY 14528 .full .full))) (.cutY 14464 .full .full)) .empty) .empty) .empty) .empty) .empty) .empty)))))) .empty) .empty))

theorem metadata30 : 0<167572778 ∧ 39<128 ∧ 71<128 ∧ 0<4 ∧
    3542/4160=0 ∧ 3542%4160=3542 ∧ ∀ i, (leaves30 i).Valid 8 := by
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

noncomputable def phaseMass30 : ℝ := singlePhaseMass (167572778/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw30 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass30_eq : phaseMass30 = (83786389/819200000000 : ℝ) := by
  unfold phaseMass30
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw30 output30 cover30 source30
    (gridTreeUnionCheck_sound 32768 raw30 output30 cover30 source30 tree30 checked30)
    _ (by norm_num) _, areaUnits30]
  norm_num

-- Frozen phase 3927, atom 3592, type 0, source (40,72).
def leavesData31 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves31 : Fin 7 → DyadicLeaf := leavesData31.get
def raw31 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 40 72 leaves31 i
def outputData31 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨10240,10368,18432,18560⟩) (.node (.single ⟨10240,10368,18560,18688⟩) (.single ⟨10368,10432,18432,18496⟩))) (.node (.node (.single ⟨10368,10432,18496,18560⟩) (.single ⟨10432,10496,18432,18496⟩)) (.node (.single ⟨10432,10496,18496,18560⟩) (.single ⟨10368,10496,18560,18688⟩)))) (.node (.node (.single ⟨14080,14208,22272,22400⟩) (.node (.single ⟨14080,14208,22400,22528⟩) (.single ⟨14208,14272,22272,22336⟩))) (.node (.node (.single ⟨14208,14272,22336,22400⟩) (.single ⟨14272,14336,22272,22336⟩)) (.node (.single ⟨14272,14336,22336,22400⟩) (.single ⟨14208,14336,22400,22528⟩))))) (.node (.node (.node (.single ⟨18432,18560,10240,10368⟩) (.node (.single ⟨18432,18496,10368,10432⟩) (.single ⟨18432,18496,10432,10496⟩))) (.node (.node (.single ⟨18496,18560,10368,10432⟩) (.single ⟨18496,18560,10432,10496⟩)) (.node (.single ⟨18560,18688,10240,10368⟩) (.single ⟨18560,18688,10368,10496⟩)))) (.node (.node (.single ⟨22272,22400,14080,14208⟩) (.node (.single ⟨22272,22336,14208,14272⟩) (.single ⟨22272,22336,14272,14336⟩))) (.node (.node (.single ⟨22336,22400,14208,14272⟩) (.single ⟨22336,22400,14272,14336⟩)) (.node (.single ⟨22400,22528,14080,14208⟩) (.single ⟨22400,22528,14208,14336⟩))))))
def output31 : Fin 28 → GridBox := outputData31.get
def coverData31 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData31 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover31 (i : Fin 28) : Fin 28 := ⟨coverData31.get i % 28, Nat.mod_lt _ (by decide)⟩
def source31 (i : Fin 28) : Fin 28 := ⟨sourceData31.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree31 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 .empty (.cutY 18432 .empty (.cutX 11264 (.cutY 19456 (.cutX 10752 (.cutY 18944 (.cutX 10496 (.cutY 18688 (.cutX 10368 (.cutY 18560 .full .full) (.cutY 18560 (.cutX 10432 (.cutY 18496 .full .full) (.cutY 18496 .full .full)) .full)) .empty) .empty) .empty) .empty) .empty) .empty))) .empty) (.cutY 20480 .empty (.cutX 14336 (.cutY 22528 (.cutX 13312 .empty (.cutY 21504 .empty (.cutX 13824 .empty (.cutY 22016 .empty (.cutX 14080 .empty (.cutY 22272 .empty (.cutX 14208 (.cutY 22400 .full .full) (.cutY 22400 (.cutX 14272 (.cutY 22336 .full .full) (.cutY 22336 .full .full)) .full)))))))) .empty) .empty))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 .empty (.cutY 10240 .empty (.cutX 19456 (.cutY 11264 (.cutX 18944 (.cutY 10752 (.cutX 18688 (.cutY 10496 (.cutX 18560 (.cutY 10368 .full (.cutX 18496 (.cutY 10432 .full .full) (.cutY 10432 .full .full))) (.cutY 10368 .full .full)) .empty) .empty) .empty) .empty) .empty) .empty))) .empty) (.cutY 12288 .empty (.cutX 22528 (.cutY 14336 (.cutX 21504 .empty (.cutY 13312 .empty (.cutX 22016 .empty (.cutY 13824 .empty (.cutX 22272 .empty (.cutY 14080 .empty (.cutX 22400 (.cutY 14208 .full (.cutX 22336 (.cutY 14272 .full .full) (.cutY 14272 .full .full))) (.cutY 14208 .full .full)))))))) .empty) .empty)))) .empty) .empty))

theorem metadata31 : 0<211618637 ∧ 40<128 ∧ 72<128 ∧ 0<4 ∧
    3592/4160=0 ∧ 3592%4160=3592 ∧ ∀ i, (leaves31 i).Valid 8 := by
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

noncomputable def phaseMass31 : ℝ := singlePhaseMass (211618637/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw31 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass31_eq : phaseMass31 = (211618637/1638400000000 : ℝ) := by
  unfold phaseMass31
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw31 output31 cover31 source31
    (gridTreeUnionCheck_sound 32768 raw31 output31 cover31 source31 tree31 checked31)
    _ (by norm_num) _, areaUnits31]
  norm_num

-- Frozen phase 3928, atom 3686, type 0, source (42,74).
def leavesData32 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves32 : Fin 7 → DyadicLeaf := leavesData32.get
def raw32 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 42 74 leaves32 i
def outputData32 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨10752,10880,18944,19072⟩) (.node (.single ⟨10752,10880,19072,19200⟩) (.single ⟨10880,10944,18944,19008⟩))) (.node (.node (.single ⟨10880,10944,19008,19072⟩) (.single ⟨10944,11008,18944,19008⟩)) (.node (.single ⟨10944,11008,19008,19072⟩) (.single ⟨10880,11008,19072,19200⟩)))) (.node (.node (.single ⟨13568,13696,21760,21888⟩) (.node (.single ⟨13568,13696,21888,22016⟩) (.single ⟨13696,13760,21760,21824⟩))) (.node (.node (.single ⟨13696,13760,21824,21888⟩) (.single ⟨13760,13824,21760,21824⟩)) (.node (.single ⟨13760,13824,21824,21888⟩) (.single ⟨13696,13824,21888,22016⟩))))) (.node (.node (.node (.single ⟨18944,19072,10752,10880⟩) (.node (.single ⟨18944,19008,10880,10944⟩) (.single ⟨18944,19008,10944,11008⟩))) (.node (.node (.single ⟨19008,19072,10880,10944⟩) (.single ⟨19008,19072,10944,11008⟩)) (.node (.single ⟨19072,19200,10752,10880⟩) (.single ⟨19072,19200,10880,11008⟩)))) (.node (.node (.single ⟨21760,21888,13568,13696⟩) (.node (.single ⟨21760,21824,13696,13760⟩) (.single ⟨21760,21824,13760,13824⟩))) (.node (.node (.single ⟨21824,21888,13696,13760⟩) (.single ⟨21824,21888,13760,13824⟩)) (.node (.single ⟨21888,22016,13568,13696⟩) (.single ⟨21888,22016,13696,13824⟩))))))
def output32 : Fin 28 → GridBox := outputData32.get
def coverData32 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData32 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover32 (i : Fin 28) : Fin 28 := ⟨coverData32.get i % 28, Nat.mod_lt _ (by decide)⟩
def source32 (i : Fin 28) : Fin 28 := ⟨sourceData32.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree32 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 .empty (.cutY 18432 .empty (.cutX 11264 (.cutY 19456 (.cutX 10752 .empty (.cutY 18944 .empty (.cutX 11008 (.cutY 19200 (.cutX 10880 (.cutY 19072 .full .full) (.cutY 19072 (.cutX 10944 (.cutY 19008 .full .full) (.cutY 19008 .full .full)) .full)) .empty) .empty))) .empty) .empty))) .empty) (.cutY 20480 .empty (.cutX 14336 (.cutY 22528 (.cutX 13312 .empty (.cutY 21504 .empty (.cutX 13824 (.cutY 22016 (.cutX 13568 .empty (.cutY 21760 .empty (.cutX 13696 (.cutY 21888 .full .full) (.cutY 21888 (.cutX 13760 (.cutY 21824 .full .full) (.cutY 21824 .full .full)) .full)))) .empty) .empty))) .empty) .empty))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 .empty (.cutY 10240 .empty (.cutX 19456 (.cutY 11264 (.cutX 18944 .empty (.cutY 10752 .empty (.cutX 19200 (.cutY 11008 (.cutX 19072 (.cutY 10880 .full (.cutX 19008 (.cutY 10944 .full .full) (.cutY 10944 .full .full))) (.cutY 10880 .full .full)) .empty) .empty))) .empty) .empty))) .empty) (.cutY 12288 .empty (.cutX 22528 (.cutY 14336 (.cutX 21504 .empty (.cutY 13312 .empty (.cutX 22016 (.cutY 13824 (.cutX 21760 .empty (.cutY 13568 .empty (.cutX 21888 (.cutY 13696 .full (.cutX 21824 (.cutY 13760 .full .full) (.cutY 13760 .full .full))) (.cutY 13696 .full .full)))) .empty) .empty))) .empty) .empty)))) .empty) .empty))

theorem metadata32 : 0<211618637 ∧ 42<128 ∧ 74<128 ∧ 0<4 ∧
    3686/4160=0 ∧ 3686%4160=3686 ∧ ∀ i, (leaves32 i).Valid 8 := by
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

noncomputable def phaseMass32 : ℝ := singlePhaseMass (211618637/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw32 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass32_eq : phaseMass32 = (211618637/1638400000000 : ℝ) := by
  unfold phaseMass32
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw32 output32 cover32 source32
    (gridTreeUnionCheck_sound 32768 raw32 output32 cover32 source32 tree32 checked32)
    _ (by norm_num) _, areaUnits32]
  norm_num

-- Frozen phase 3929, atom 3730, type 0, source (43,75).
def leavesData33 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves33 : Fin 4 → DyadicLeaf := leavesData33.get
def raw33 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 43 75 leaves33 i
def outputData33 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨11008,11136,19200,19328⟩) (.single ⟨11008,11136,19328,19456⟩)) (.node (.single ⟨11136,11264,19200,19328⟩) (.single ⟨11136,11264,19328,19456⟩))) (.node (.node (.single ⟨13312,13440,21504,21632⟩) (.single ⟨13312,13440,21632,21760⟩)) (.node (.single ⟨13440,13568,21504,21632⟩) (.single ⟨13440,13568,21632,21760⟩)))) (.node (.node (.node (.single ⟨19200,19328,11008,11136⟩) (.single ⟨19200,19328,11136,11264⟩)) (.node (.single ⟨19328,19456,11008,11136⟩) (.single ⟨19328,19456,11136,11264⟩))) (.node (.node (.single ⟨21504,21632,13312,13440⟩) (.single ⟨21504,21632,13440,13568⟩)) (.node (.single ⟨21632,21760,13312,13440⟩) (.single ⟨21632,21760,13440,13568⟩)))))
def output33 : Fin 16 → GridBox := outputData33.get
def coverData33 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData33 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover33 (i : Fin 16) : Fin 16 := ⟨coverData33.get i % 16, Nat.mod_lt _ (by decide)⟩
def source33 (i : Fin 16) : Fin 16 := ⟨sourceData33.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree33 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 .empty (.cutY 18432 .empty (.cutX 11264 (.cutY 19456 (.cutX 10752 .empty (.cutY 18944 .empty (.cutX 11008 .empty (.cutY 19200 .empty (.cutX 11136 (.cutY 19328 .full .full) (.cutY 19328 .full .full)))))) .empty) .empty))) .empty) (.cutY 20480 .empty (.cutX 14336 (.cutY 22528 (.cutX 13312 .empty (.cutY 21504 .empty (.cutX 13824 (.cutY 22016 (.cutX 13568 (.cutY 21760 (.cutX 13440 (.cutY 21632 .full .full) (.cutY 21632 .full .full)) .empty) .empty) .empty) .empty))) .empty) .empty))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 .empty (.cutY 10240 .empty (.cutX 19456 (.cutY 11264 (.cutX 18944 .empty (.cutY 10752 .empty (.cutX 19200 .empty (.cutY 11008 .empty (.cutX 19328 (.cutY 11136 .full .full) (.cutY 11136 .full .full)))))) .empty) .empty))) .empty) (.cutY 12288 .empty (.cutX 22528 (.cutY 14336 (.cutX 21504 .empty (.cutY 13312 .empty (.cutX 22016 (.cutY 13824 (.cutX 21760 (.cutY 13568 (.cutX 21632 (.cutY 13440 .full .full) (.cutY 13440 .full .full)) .empty) .empty) .empty) .empty))) .empty) .empty)))) .empty) .empty))

theorem metadata33 : 0<211618637 ∧ 43<128 ∧ 75<128 ∧ 0<4 ∧
    3730/4160=0 ∧ 3730%4160=3730 ∧ ∀ i, (leaves33 i).Valid 8 := by
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

noncomputable def phaseMass33 : ℝ := singlePhaseMass (211618637/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw33 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass33_eq : phaseMass33 = (211618637/1638400000000 : ℝ) := by
  unfold phaseMass33
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw33 output33 cover33 source33
    (gridTreeUnionCheck_sound 32768 raw33 output33 cover33 source33 tree33 checked33)
    _ (by norm_num) _, areaUnits33]
  norm_num

-- Frozen phase 3930, atom 3263, type 0, source (34,67).
def leavesData34 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves34 : Fin 4 → DyadicLeaf := leavesData34.get
def raw34 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 34 67 leaves34 i
def outputData34 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨8704,8832,17152,17280⟩) (.single ⟨8704,8832,17280,17408⟩)) (.node (.single ⟨8832,8960,17152,17280⟩) (.single ⟨8832,8960,17280,17408⟩))) (.node (.node (.single ⟨15360,15488,23808,23936⟩) (.single ⟨15360,15488,23936,24064⟩)) (.node (.single ⟨15488,15616,23808,23936⟩) (.single ⟨15488,15616,23936,24064⟩)))) (.node (.node (.node (.single ⟨17152,17280,8704,8832⟩) (.single ⟨17152,17280,8832,8960⟩)) (.node (.single ⟨17280,17408,8704,8832⟩) (.single ⟨17280,17408,8832,8960⟩))) (.node (.node (.single ⟨23808,23936,15360,15488⟩) (.single ⟨23808,23936,15488,15616⟩)) (.node (.single ⟨23936,24064,15360,15488⟩) (.single ⟨23936,24064,15488,15616⟩)))))
def output34 : Fin 16 → GridBox := outputData34.get
def coverData34 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData34 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover34 (i : Fin 16) : Fin 16 := ⟨coverData34.get i % 16, Nat.mod_lt _ (by decide)⟩
def source34 (i : Fin 16) : Fin 16 := ⟨sourceData34.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree34 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 (.cutY 18432 (.cutX 9216 (.cutY 17408 (.cutX 8704 .empty (.cutY 16896 .empty (.cutX 8960 (.cutY 17152 .empty (.cutX 8832 (.cutY 17280 .full .full) (.cutY 17280 .full .full))) .empty))) .empty) .empty) .empty) .empty) .empty) (.cutY 20480 .empty (.cutX 14336 .empty (.cutY 22528 .empty (.cutX 15360 .empty (.cutY 23552 .empty (.cutX 15872 (.cutY 24064 (.cutX 15616 (.cutY 23808 .empty (.cutX 15488 (.cutY 23936 .full .full) (.cutY 23936 .full .full))) .empty) .empty) .empty))))))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 (.cutY 10240 (.cutX 17408 (.cutY 9216 (.cutX 16896 .empty (.cutY 8704 .empty (.cutX 17152 .empty (.cutY 8960 (.cutX 17280 (.cutY 8832 .full .full) (.cutY 8832 .full .full)) .empty)))) .empty) .empty) .empty) .empty) .empty) (.cutY 12288 .empty (.cutX 22528 .empty (.cutY 14336 .empty (.cutX 23552 .empty (.cutY 15360 .empty (.cutX 24064 (.cutY 15872 (.cutX 23808 .empty (.cutY 15616 (.cutX 23936 (.cutY 15488 .full .full) (.cutY 15488 .full .full)) .empty)) .empty) .empty)))))))) .empty) .empty))

theorem metadata34 : 0<167572778 ∧ 34<128 ∧ 67<128 ∧ 0<4 ∧
    3263/4160=0 ∧ 3263%4160=3263 ∧ ∀ i, (leaves34 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData34).mp
    (by decide +kernel)

theorem sourceChecked34_0 : ∀ i : Fin 16,
    (fun i => output34 i = raw34 (source34 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked34 : ∀ i : Fin 16, (fun i => output34 i = raw34 (source34 i)) i :=
  forallFin_of_zero_offset (fun i => output34 i = raw34 (source34 i)) sourceChecked34_0

theorem coverChecked34_0 : ∀ i : Fin 16,
    (fun i => (output34 (cover34 i)).ContainsBox (raw34 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked34 : ∀ i : Fin 16, (fun i => (output34 (cover34 i)).ContainsBox (raw34 i)) i :=
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

noncomputable def phaseMass34 : ℝ := singlePhaseMass (167572778/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw34 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass34_eq : phaseMass34 = (83786389/819200000000 : ℝ) := by
  unfold phaseMass34
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw34 output34 cover34 source34
    (gridTreeUnionCheck_sound 32768 raw34 output34 cover34 source34 tree34 checked34)
    _ (by norm_num) _, areaUnits34]
  norm_num

-- Frozen phase 3931, atom 3772, type 0, source (44,76).
def leavesData35 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves35 : Fin 4 → DyadicLeaf := leavesData35.get
def raw35 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 44 76 leaves35 i
def outputData35 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨11264,11392,19456,19584⟩) (.single ⟨11264,11392,19584,19712⟩)) (.node (.single ⟨11392,11520,19456,19584⟩) (.single ⟨11392,11520,19584,19712⟩))) (.node (.node (.single ⟨13056,13184,21248,21376⟩) (.single ⟨13056,13184,21376,21504⟩)) (.node (.single ⟨13184,13312,21248,21376⟩) (.single ⟨13184,13312,21376,21504⟩)))) (.node (.node (.node (.single ⟨19456,19584,11264,11392⟩) (.single ⟨19456,19584,11392,11520⟩)) (.node (.single ⟨19584,19712,11264,11392⟩) (.single ⟨19584,19712,11392,11520⟩))) (.node (.node (.single ⟨21248,21376,13056,13184⟩) (.single ⟨21248,21376,13184,13312⟩)) (.node (.single ⟨21376,21504,13056,13184⟩) (.single ⟨21376,21504,13184,13312⟩)))))
def output35 : Fin 16 → GridBox := outputData35.get
def coverData35 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData35 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover35 (i : Fin 16) : Fin 16 := ⟨coverData35.get i % 16, Nat.mod_lt _ (by decide)⟩
def source35 (i : Fin 16) : Fin 16 := ⟨sourceData35.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree35 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 .empty (.cutY 18432 .empty (.cutX 11264 .empty (.cutY 19456 .empty (.cutX 11776 (.cutY 19968 (.cutX 11520 (.cutY 19712 (.cutX 11392 (.cutY 19584 .full .full) (.cutY 19584 .full .full)) .empty) .empty) .empty) .empty))))) .empty) (.cutY 20480 .empty (.cutX 14336 (.cutY 22528 (.cutX 13312 (.cutY 21504 (.cutX 12800 .empty (.cutY 20992 .empty (.cutX 13056 .empty (.cutY 21248 .empty (.cutX 13184 (.cutY 21376 .full .full) (.cutY 21376 .full .full)))))) .empty) .empty) .empty) .empty))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 .empty (.cutY 10240 .empty (.cutX 19456 .empty (.cutY 11264 .empty (.cutX 19968 (.cutY 11776 (.cutX 19712 (.cutY 11520 (.cutX 19584 (.cutY 11392 .full .full) (.cutY 11392 .full .full)) .empty) .empty) .empty) .empty))))) .empty) (.cutY 12288 .empty (.cutX 22528 (.cutY 14336 (.cutX 21504 (.cutY 13312 (.cutX 20992 .empty (.cutY 12800 .empty (.cutX 21248 .empty (.cutY 13056 .empty (.cutX 21376 (.cutY 13184 .full .full) (.cutY 13184 .full .full)))))) .empty) .empty) .empty) .empty)))) .empty) .empty))

theorem metadata35 : 0<211618637 ∧ 44<128 ∧ 76<128 ∧ 0<4 ∧
    3772/4160=0 ∧ 3772%4160=3772 ∧ ∀ i, (leaves35 i).Valid 8 := by
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

noncomputable def phaseMass35 : ℝ := singlePhaseMass (211618637/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw35 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass35_eq : phaseMass35 = (211618637/1638400000000 : ℝ) := by
  unfold phaseMass35
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw35 output35 cover35 source35
    (gridTreeUnionCheck_sound 32768 raw35 output35 cover35 source35 tree35 checked35)
    _ (by norm_num) _, areaUnits35]
  norm_num

-- Frozen phase 3932, atom 3812, type 0, source (45,77).
def leavesData36 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves36 : Fin 4 → DyadicLeaf := leavesData36.get
def raw36 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 45 77 leaves36 i
def outputData36 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨11520,11648,19712,19840⟩) (.single ⟨11520,11648,19840,19968⟩)) (.node (.single ⟨11648,11776,19712,19840⟩) (.single ⟨11648,11776,19840,19968⟩))) (.node (.node (.single ⟨12800,12928,20992,21120⟩) (.single ⟨12800,12928,21120,21248⟩)) (.node (.single ⟨12928,13056,20992,21120⟩) (.single ⟨12928,13056,21120,21248⟩)))) (.node (.node (.node (.single ⟨19712,19840,11520,11648⟩) (.single ⟨19712,19840,11648,11776⟩)) (.node (.single ⟨19840,19968,11520,11648⟩) (.single ⟨19840,19968,11648,11776⟩))) (.node (.node (.single ⟨20992,21120,12800,12928⟩) (.single ⟨20992,21120,12928,13056⟩)) (.node (.single ⟨21120,21248,12800,12928⟩) (.single ⟨21120,21248,12928,13056⟩)))))
def output36 : Fin 16 → GridBox := outputData36.get
def coverData36 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData36 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover36 (i : Fin 16) : Fin 16 := ⟨coverData36.get i % 16, Nat.mod_lt _ (by decide)⟩
def source36 (i : Fin 16) : Fin 16 := ⟨sourceData36.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree36 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 .empty (.cutY 18432 .empty (.cutX 11264 .empty (.cutY 19456 .empty (.cutX 11776 (.cutY 19968 (.cutX 11520 .empty (.cutY 19712 .empty (.cutX 11648 (.cutY 19840 .full .full) (.cutY 19840 .full .full)))) .empty) .empty))))) .empty) (.cutY 20480 .empty (.cutX 14336 (.cutY 22528 (.cutX 13312 (.cutY 21504 (.cutX 12800 .empty (.cutY 20992 .empty (.cutX 13056 (.cutY 21248 (.cutX 12928 (.cutY 21120 .full .full) (.cutY 21120 .full .full)) .empty) .empty))) .empty) .empty) .empty) .empty))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 .empty (.cutY 10240 .empty (.cutX 19456 .empty (.cutY 11264 .empty (.cutX 19968 (.cutY 11776 (.cutX 19712 .empty (.cutY 11520 .empty (.cutX 19840 (.cutY 11648 .full .full) (.cutY 11648 .full .full)))) .empty) .empty))))) .empty) (.cutY 12288 .empty (.cutX 22528 (.cutY 14336 (.cutX 21504 (.cutY 13312 (.cutX 20992 .empty (.cutY 12800 .empty (.cutX 21248 (.cutY 13056 (.cutX 21120 (.cutY 12928 .full .full) (.cutY 12928 .full .full)) .empty) .empty))) .empty) .empty) .empty) .empty)))) .empty) .empty))

theorem metadata36 : 0<211618637 ∧ 45<128 ∧ 77<128 ∧ 0<4 ∧
    3812/4160=0 ∧ 3812%4160=3812 ∧ ∀ i, (leaves36 i).Valid 8 := by
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

noncomputable def phaseMass36 : ℝ := singlePhaseMass (211618637/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw36 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass36_eq : phaseMass36 = (211618637/1638400000000 : ℝ) := by
  unfold phaseMass36
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw36 output36 cover36 source36
    (gridTreeUnionCheck_sound 32768 raw36 output36 cover36 source36 tree36 checked36)
    _ (by norm_num) _, areaUnits36]
  norm_num

-- Frozen phase 3933, atom 7885, type 1, source (43,70).
def leavesData37 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves37 : Fin 7 → DyadicLeaf := leavesData37.get
def raw37 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 43 70 leaves37 i
def outputData37 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨11008,11136,17920,18048⟩) (.node (.single ⟨11008,11136,18048,18176⟩) (.single ⟨11136,11200,17920,17984⟩))) (.node (.node (.single ⟨11136,11200,17984,18048⟩) (.single ⟨11200,11264,17920,17984⟩)) (.node (.single ⟨11200,11264,17984,18048⟩) (.single ⟨11136,11264,18048,18176⟩)))) (.node (.node (.single ⟨14592,14720,21504,21632⟩) (.node (.single ⟨14592,14720,21632,21760⟩) (.single ⟨14720,14784,21504,21568⟩))) (.node (.node (.single ⟨14720,14784,21568,21632⟩) (.single ⟨14784,14848,21504,21568⟩)) (.node (.single ⟨14784,14848,21568,21632⟩) (.single ⟨14720,14848,21632,21760⟩))))) (.node (.node (.node (.single ⟨17920,18048,11008,11136⟩) (.node (.single ⟨17920,17984,11136,11200⟩) (.single ⟨17920,17984,11200,11264⟩))) (.node (.node (.single ⟨17984,18048,11136,11200⟩) (.single ⟨17984,18048,11200,11264⟩)) (.node (.single ⟨18048,18176,11008,11136⟩) (.single ⟨18048,18176,11136,11264⟩)))) (.node (.node (.single ⟨21504,21632,14592,14720⟩) (.node (.single ⟨21504,21568,14720,14784⟩) (.single ⟨21504,21568,14784,14848⟩))) (.node (.node (.single ⟨21568,21632,14720,14784⟩) (.single ⟨21568,21632,14784,14848⟩)) (.node (.single ⟨21632,21760,14592,14720⟩) (.single ⟨21632,21760,14720,14848⟩))))))
def output37 : Fin 28 → GridBox := outputData37.get
def coverData37 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData37 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover37 (i : Fin 28) : Fin 28 := ⟨coverData37.get i % 28, Nat.mod_lt _ (by decide)⟩
def source37 (i : Fin 28) : Fin 28 := ⟨sourceData37.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree37 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 .empty (.cutY 18432 (.cutX 11264 (.cutY 17408 .empty (.cutX 10752 .empty (.cutY 17920 .empty (.cutX 11008 .empty (.cutY 18176 (.cutX 11136 (.cutY 18048 .full .full) (.cutY 18048 (.cutX 11200 (.cutY 17984 .full .full) (.cutY 17984 .full .full)) .full)) .empty))))) .empty) .empty)) .empty) (.cutY 20480 .empty (.cutX 14336 .empty (.cutY 22528 (.cutX 15360 (.cutY 21504 .empty (.cutX 14848 (.cutY 22016 (.cutX 14592 .empty (.cutY 21760 (.cutX 14720 (.cutY 21632 .full .full) (.cutY 21632 (.cutX 14784 (.cutY 21568 .full .full) (.cutY 21568 .full .full)) .full)) .empty)) .empty) .empty)) .empty) .empty)))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 (.cutY 10240 .empty (.cutX 17408 .empty (.cutY 11264 (.cutX 17920 .empty (.cutY 10752 .empty (.cutX 18176 (.cutY 11008 .empty (.cutX 18048 (.cutY 11136 .full (.cutX 17984 (.cutY 11200 .full .full) (.cutY 11200 .full .full))) (.cutY 11136 .full .full))) .empty))) .empty))) .empty) .empty) (.cutY 12288 .empty (.cutX 22528 (.cutY 14336 .empty (.cutX 21504 .empty (.cutY 15360 (.cutX 22016 (.cutY 14848 (.cutX 21760 (.cutY 14592 .empty (.cutX 21632 (.cutY 14720 .full (.cutX 21568 (.cutY 14784 .full .full) (.cutY 14784 .full .full))) (.cutY 14720 .full .full))) .empty) .empty) .empty) .empty))) .empty)))) .empty) .empty))

theorem metadata37 : 0<50021215 ∧ 43<128 ∧ 70<128 ∧ 1<4 ∧
    7885/4160=1 ∧ 7885%4160=3725 ∧ ∀ i, (leaves37 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData37).mp
    (by decide +kernel)

theorem sourceChecked37_0 : ∀ i : Fin 28,
    (fun i => output37 i = raw37 (source37 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked37 : ∀ i : Fin 28, (fun i => output37 i = raw37 (source37 i)) i :=
  forallFin_of_zero_offset (fun i => output37 i = raw37 (source37 i)) sourceChecked37_0

theorem coverChecked37_0 : ∀ i : Fin 28,
    (fun i => (output37 (cover37 i)).ContainsBox (raw37 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked37 : ∀ i : Fin 28, (fun i => (output37 (cover37 i)).ContainsBox (raw37 i)) i :=
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

noncomputable def phaseMass37 : ℝ := singlePhaseMass (50021215/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw37 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass37_eq : phaseMass37 = (10004243/327680000000 : ℝ) := by
  unfold phaseMass37
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw37 output37 cover37 source37
    (gridTreeUnionCheck_sound 32768 raw37 output37 cover37 source37 tree37 checked37)
    _ (by norm_num) _, areaUnits37]
  norm_num

-- Frozen phase 3934, atom 7593, type 1, source (37,66).
def leavesData38 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves38 : Fin 7 → DyadicLeaf := leavesData38.get
def raw38 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 37 66 leaves38 i
def outputData38 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨9472,9600,16896,17024⟩) (.node (.single ⟨9472,9600,17024,17152⟩) (.single ⟨9600,9664,16896,16960⟩))) (.node (.node (.single ⟨9600,9664,16960,17024⟩) (.single ⟨9664,9728,16896,16960⟩)) (.node (.single ⟨9664,9728,16960,17024⟩) (.single ⟨9600,9728,17024,17152⟩)))) (.node (.node (.single ⟨15616,15744,23040,23168⟩) (.node (.single ⟨15616,15744,23168,23296⟩) (.single ⟨15744,15808,23040,23104⟩))) (.node (.node (.single ⟨15744,15808,23104,23168⟩) (.single ⟨15808,15872,23040,23104⟩)) (.node (.single ⟨15808,15872,23104,23168⟩) (.single ⟨15744,15872,23168,23296⟩))))) (.node (.node (.node (.single ⟨16896,17024,9472,9600⟩) (.node (.single ⟨16896,16960,9600,9664⟩) (.single ⟨16896,16960,9664,9728⟩))) (.node (.node (.single ⟨16960,17024,9600,9664⟩) (.single ⟨16960,17024,9664,9728⟩)) (.node (.single ⟨17024,17152,9472,9600⟩) (.single ⟨17024,17152,9600,9728⟩)))) (.node (.node (.single ⟨23040,23168,15616,15744⟩) (.node (.single ⟨23040,23104,15744,15808⟩) (.single ⟨23040,23104,15808,15872⟩))) (.node (.node (.single ⟨23104,23168,15744,15808⟩) (.single ⟨23104,23168,15808,15872⟩)) (.node (.single ⟨23168,23296,15616,15744⟩) (.single ⟨23168,23296,15744,15872⟩))))))
def output38 : Fin 28 → GridBox := outputData38.get
def coverData38 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData38 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover38 (i : Fin 28) : Fin 28 := ⟨coverData38.get i % 28, Nat.mod_lt _ (by decide)⟩
def source38 (i : Fin 28) : Fin 28 := ⟨sourceData38.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree38 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 (.cutY 18432 (.cutX 9216 .empty (.cutY 17408 (.cutX 9728 (.cutY 16896 .empty (.cutX 9472 .empty (.cutY 17152 (.cutX 9600 (.cutY 17024 .full .full) (.cutY 17024 (.cutX 9664 (.cutY 16960 .full .full) (.cutY 16960 .full .full)) .full)) .empty))) .empty) .empty)) .empty) .empty) .empty) (.cutY 20480 .empty (.cutX 14336 .empty (.cutY 22528 .empty (.cutX 15360 .empty (.cutY 23552 (.cutX 15872 (.cutY 23040 .empty (.cutX 15616 .empty (.cutY 23296 (.cutX 15744 (.cutY 23168 .full .full) (.cutY 23168 (.cutX 15808 (.cutY 23104 .full .full) (.cutY 23104 .full .full)) .full)) .empty))) .empty) .empty)))))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 (.cutY 10240 (.cutX 17408 (.cutY 9216 .empty (.cutX 16896 .empty (.cutY 9728 (.cutX 17152 (.cutY 9472 .empty (.cutX 17024 (.cutY 9600 .full (.cutX 16960 (.cutY 9664 .full .full) (.cutY 9664 .full .full))) (.cutY 9600 .full .full))) .empty) .empty))) .empty) .empty) .empty) .empty) (.cutY 12288 .empty (.cutX 22528 .empty (.cutY 14336 .empty (.cutX 23552 (.cutY 15360 .empty (.cutX 23040 .empty (.cutY 15872 (.cutX 23296 (.cutY 15616 .empty (.cutX 23168 (.cutY 15744 .full (.cutX 23104 (.cutY 15808 .full .full) (.cutY 15808 .full .full))) (.cutY 15744 .full .full))) .empty) .empty))) .empty)))))) .empty) .empty))

theorem metadata38 : 0<182398684 ∧ 37<128 ∧ 66<128 ∧ 1<4 ∧
    7593/4160=1 ∧ 7593%4160=3433 ∧ ∀ i, (leaves38 i).Valid 8 := by
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

noncomputable def phaseMass38 : ℝ := singlePhaseMass (182398684/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw38 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass38_eq : phaseMass38 = (45599671/409600000000 : ℝ) := by
  unfold phaseMass38
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw38 output38 cover38 source38
    (gridTreeUnionCheck_sound 32768 raw38 output38 cover38 source38 tree38 checked38)
    _ (by norm_num) _, areaUnits38]
  norm_num

-- Frozen phase 3935, atom 7927, type 1, source (44,71).
def leavesData39 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves39 : Fin 7 → DyadicLeaf := leavesData39.get
def raw39 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 44 71 leaves39 i
def outputData39 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨11264,11392,18176,18304⟩) (.node (.single ⟨11264,11392,18304,18432⟩) (.single ⟨11392,11456,18176,18240⟩))) (.node (.node (.single ⟨11392,11456,18240,18304⟩) (.single ⟨11456,11520,18176,18240⟩)) (.node (.single ⟨11456,11520,18240,18304⟩) (.single ⟨11392,11520,18304,18432⟩)))) (.node (.node (.single ⟨14336,14464,21248,21376⟩) (.node (.single ⟨14336,14464,21376,21504⟩) (.single ⟨14464,14528,21248,21312⟩))) (.node (.node (.single ⟨14464,14528,21312,21376⟩) (.single ⟨14528,14592,21248,21312⟩)) (.node (.single ⟨14528,14592,21312,21376⟩) (.single ⟨14464,14592,21376,21504⟩))))) (.node (.node (.node (.single ⟨18176,18304,11264,11392⟩) (.node (.single ⟨18176,18240,11392,11456⟩) (.single ⟨18176,18240,11456,11520⟩))) (.node (.node (.single ⟨18240,18304,11392,11456⟩) (.single ⟨18240,18304,11456,11520⟩)) (.node (.single ⟨18304,18432,11264,11392⟩) (.single ⟨18304,18432,11392,11520⟩)))) (.node (.node (.single ⟨21248,21376,14336,14464⟩) (.node (.single ⟨21248,21312,14464,14528⟩) (.single ⟨21248,21312,14528,14592⟩))) (.node (.node (.single ⟨21312,21376,14464,14528⟩) (.single ⟨21312,21376,14528,14592⟩)) (.node (.single ⟨21376,21504,14336,14464⟩) (.single ⟨21376,21504,14464,14592⟩))))))
def output39 : Fin 28 → GridBox := outputData39.get
def coverData39 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData39 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover39 (i : Fin 28) : Fin 28 := ⟨coverData39.get i % 28, Nat.mod_lt _ (by decide)⟩
def source39 (i : Fin 28) : Fin 28 := ⟨sourceData39.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree39 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 .empty (.cutY 18432 (.cutX 11264 .empty (.cutY 17408 .empty (.cutX 11776 (.cutY 17920 .empty (.cutX 11520 (.cutY 18176 .empty (.cutX 11392 (.cutY 18304 .full .full) (.cutY 18304 (.cutX 11456 (.cutY 18240 .full .full) (.cutY 18240 .full .full)) .full))) .empty)) .empty))) .empty)) .empty) (.cutY 20480 .empty (.cutX 14336 .empty (.cutY 22528 (.cutX 15360 (.cutY 21504 (.cutX 14848 (.cutY 20992 .empty (.cutX 14592 (.cutY 21248 .empty (.cutX 14464 (.cutY 21376 .full .full) (.cutY 21376 (.cutX 14528 (.cutY 21312 .full .full) (.cutY 21312 .full .full)) .full))) .empty)) .empty) .empty) .empty) .empty)))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 (.cutY 10240 .empty (.cutX 17408 .empty (.cutY 11264 .empty (.cutX 17920 .empty (.cutY 11776 (.cutX 18176 .empty (.cutY 11520 (.cutX 18304 (.cutY 11392 .full (.cutX 18240 (.cutY 11456 .full .full) (.cutY 11456 .full .full))) (.cutY 11392 .full .full)) .empty)) .empty))))) .empty) .empty) (.cutY 12288 .empty (.cutX 22528 (.cutY 14336 .empty (.cutX 21504 (.cutY 15360 (.cutX 20992 .empty (.cutY 14848 (.cutX 21248 .empty (.cutY 14592 (.cutX 21376 (.cutY 14464 .full (.cutX 21312 (.cutY 14528 .full .full) (.cutY 14528 .full .full))) (.cutY 14464 .full .full)) .empty)) .empty)) .empty) .empty)) .empty)))) .empty) .empty))

theorem metadata39 : 0<50021215 ∧ 44<128 ∧ 71<128 ∧ 1<4 ∧
    7927/4160=1 ∧ 7927%4160=3767 ∧ ∀ i, (leaves39 i).Valid 8 := by
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

noncomputable def phaseMass39 : ℝ := singlePhaseMass (50021215/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw39 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass39_eq : phaseMass39 = (10004243/327680000000 : ℝ) := by
  unfold phaseMass39
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw39 output39 cover39 source39
    (gridTreeUnionCheck_sound 32768 raw39 output39 cover39 source39 tree39 checked39)
    _ (by norm_num) _, areaUnits39]
  norm_num

-- Frozen phase 3936, atom 7294, type 1, source (32,62).
def leavesData40 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves40 : Fin 7 → DyadicLeaf := leavesData40.get
def raw40 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 32 62 leaves40 i
def outputData40 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨8192,8320,15872,16000⟩) (.node (.single ⟨8192,8320,16000,16128⟩) (.single ⟨8320,8384,15872,15936⟩))) (.node (.node (.single ⟨8320,8384,15936,16000⟩) (.single ⟨8384,8448,15872,15936⟩)) (.node (.single ⟨8384,8448,15936,16000⟩) (.single ⟨8320,8448,16000,16128⟩)))) (.node (.node (.single ⟨15872,16000,8192,8320⟩) (.node (.single ⟨15872,15936,8320,8384⟩) (.single ⟨15872,15936,8384,8448⟩))) (.node (.node (.single ⟨15936,16000,8320,8384⟩) (.single ⟨15936,16000,8384,8448⟩)) (.node (.single ⟨16000,16128,8192,8320⟩) (.single ⟨16000,16128,8320,8448⟩))))) (.node (.node (.node (.single ⟨16640,16768,24320,24448⟩) (.node (.single ⟨16640,16768,24448,24576⟩) (.single ⟨16768,16832,24320,24384⟩))) (.node (.node (.single ⟨16768,16832,24384,24448⟩) (.single ⟨16832,16896,24320,24384⟩)) (.node (.single ⟨16832,16896,24384,24448⟩) (.single ⟨16768,16896,24448,24576⟩)))) (.node (.node (.single ⟨24320,24448,16640,16768⟩) (.node (.single ⟨24320,24384,16768,16832⟩) (.single ⟨24320,24384,16832,16896⟩))) (.node (.node (.single ⟨24384,24448,16768,16832⟩) (.single ⟨24384,24448,16832,16896⟩)) (.node (.single ⟨24448,24576,16640,16768⟩) (.single ⟨24448,24576,16768,16896⟩))))))
def output40 : Fin 28 → GridBox := outputData40.get
def coverData40 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData40 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover40 (i : Fin 28) : Fin 28 := ⟨coverData40.get i % 28, Nat.mod_lt _ (by decide)⟩
def source40 (i : Fin 28) : Fin 28 := ⟨sourceData40.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree40 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 (.cutY 14336 .empty (.cutX 9216 (.cutY 15360 .empty (.cutX 8704 (.cutY 15872 .empty (.cutX 8448 (.cutY 16128 (.cutX 8320 (.cutY 16000 .full .full) (.cutY 16000 (.cutX 8384 (.cutY 15936 .full .full) (.cutY 15936 .full .full)) .full)) .empty) .empty)) .empty)) .empty)) .empty)) (.cutY 12288 (.cutX 14336 .empty (.cutY 10240 (.cutX 15360 .empty (.cutY 9216 (.cutX 15872 .empty (.cutY 8704 (.cutX 16128 (.cutY 8448 (.cutX 16000 (.cutY 8320 .full (.cutX 15936 (.cutY 8384 .full .full) (.cutY 8384 .full .full))) (.cutY 8320 .full .full)) .empty) .empty) .empty)) .empty)) .empty)) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 (.cutY 22528 .empty (.cutX 17408 (.cutY 23552 .empty (.cutX 16896 (.cutY 24064 .empty (.cutX 16640 .empty (.cutY 24320 .empty (.cutX 16768 (.cutY 24448 .full .full) (.cutY 24448 (.cutX 16832 (.cutY 24384 .full .full) (.cutY 24384 .full .full)) .full))))) .empty)) .empty)) .empty)) (.cutY 20480 (.cutX 22528 .empty (.cutY 18432 (.cutX 23552 .empty (.cutY 17408 (.cutX 24064 .empty (.cutY 16896 (.cutX 24320 .empty (.cutY 16640 .empty (.cutX 24448 (.cutY 16768 .full (.cutX 24384 (.cutY 16832 .full .full) (.cutY 16832 .full .full))) (.cutY 16768 .full .full)))) .empty)) .empty)) .empty)) .empty)) .empty) .empty)))

theorem metadata40 : 0<168966520 ∧ 32<128 ∧ 62<128 ∧ 1<4 ∧
    7294/4160=1 ∧ 7294%4160=3134 ∧ ∀ i, (leaves40 i).Valid 8 := by
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

noncomputable def phaseMass40 : ℝ := singlePhaseMass (168966520/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw40 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass40_eq : phaseMass40 = (4224163/40960000000 : ℝ) := by
  unfold phaseMass40
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw40 output40 cover40 source40
    (gridTreeUnionCheck_sound 32768 raw40 output40 cover40 source40 tree40 checked40)
    _ (by norm_num) _, areaUnits40]
  norm_num

-- Frozen phase 3937, atom 7228, type 1, source (31,61).
def leavesData41 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves41 : Fin 7 → DyadicLeaf := leavesData41.get
def raw41 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 31 61 leaves41 i
def outputData41 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨7936,8064,15616,15744⟩) (.node (.single ⟨7936,8064,15744,15872⟩) (.single ⟨8064,8128,15616,15680⟩))) (.node (.node (.single ⟨8064,8128,15680,15744⟩) (.single ⟨8128,8192,15616,15680⟩)) (.node (.single ⟨8128,8192,15680,15744⟩) (.single ⟨8064,8192,15744,15872⟩)))) (.node (.node (.single ⟨15616,15744,7936,8064⟩) (.node (.single ⟨15616,15680,8064,8128⟩) (.single ⟨15616,15680,8128,8192⟩))) (.node (.node (.single ⟨15680,15744,8064,8128⟩) (.single ⟨15680,15744,8128,8192⟩)) (.node (.single ⟨15744,15872,7936,8064⟩) (.single ⟨15744,15872,8064,8192⟩))))) (.node (.node (.node (.single ⟨16896,17024,24576,24704⟩) (.node (.single ⟨16896,17024,24704,24832⟩) (.single ⟨17024,17088,24576,24640⟩))) (.node (.node (.single ⟨17024,17088,24640,24704⟩) (.single ⟨17088,17152,24576,24640⟩)) (.node (.single ⟨17088,17152,24640,24704⟩) (.single ⟨17024,17152,24704,24832⟩)))) (.node (.node (.single ⟨24576,24704,16896,17024⟩) (.node (.single ⟨24576,24640,17024,17088⟩) (.single ⟨24576,24640,17088,17152⟩))) (.node (.node (.single ⟨24640,24704,17024,17088⟩) (.single ⟨24640,24704,17088,17152⟩)) (.node (.single ⟨24704,24832,16896,17024⟩) (.single ⟨24704,24832,17024,17152⟩))))))
def output41 : Fin 28 → GridBox := outputData41.get
def coverData41 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData41 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover41 (i : Fin 28) : Fin 28 := ⟨coverData41.get i % 28, Nat.mod_lt _ (by decide)⟩
def source41 (i : Fin 28) : Fin 28 := ⟨sourceData41.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree41 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 .empty (.cutY 14336 .empty (.cutX 7168 .empty (.cutY 15360 .empty (.cutX 7680 .empty (.cutY 15872 (.cutX 7936 .empty (.cutY 15616 .empty (.cutX 8064 (.cutY 15744 .full .full) (.cutY 15744 (.cutX 8128 (.cutY 15680 .full .full) (.cutY 15680 .full .full)) .full)))) .empty))))))))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 .empty (.cutY 6144 .empty (.cutX 15360 .empty (.cutY 7168 .empty (.cutX 15872 (.cutY 7680 .empty (.cutX 15616 .empty (.cutY 7936 .empty (.cutX 15744 (.cutY 8064 .full (.cutX 15680 (.cutY 8128 .full .full) (.cutY 8128 .full .full))) (.cutY 8064 .full .full))))) .empty))))))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 (.cutY 26624 (.cutX 17408 (.cutY 25600 (.cutX 16896 .empty (.cutY 25088 (.cutX 17152 (.cutY 24832 (.cutX 17024 (.cutY 24704 .full .full) (.cutY 24704 (.cutX 17088 (.cutY 24640 .full .full) (.cutY 24640 .full .full)) .full)) .empty) .empty) .empty)) .empty) .empty) .empty) .empty) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 (.cutY 18432 (.cutX 25600 (.cutY 17408 (.cutX 25088 (.cutY 16896 .empty (.cutX 24832 (.cutY 17152 (.cutX 24704 (.cutY 17024 .full (.cutX 24640 (.cutY 17088 .full .full) (.cutY 17088 .full .full))) (.cutY 17024 .full .full)) .empty) .empty)) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty))))

theorem metadata41 : 0<69455300 ∧ 31<128 ∧ 61<128 ∧ 1<4 ∧
    7228/4160=1 ∧ 7228%4160=3068 ∧ ∀ i, (leaves41 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData41).mp
    (by decide +kernel)

theorem sourceChecked41_0 : ∀ i : Fin 28,
    (fun i => output41 i = raw41 (source41 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked41 : ∀ i : Fin 28, (fun i => output41 i = raw41 (source41 i)) i :=
  forallFin_of_zero_offset (fun i => output41 i = raw41 (source41 i)) sourceChecked41_0

theorem coverChecked41_0 : ∀ i : Fin 28,
    (fun i => (output41 (cover41 i)).ContainsBox (raw41 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked41 : ∀ i : Fin 28, (fun i => (output41 (cover41 i)).ContainsBox (raw41 i)) i :=
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

noncomputable def phaseMass41 : ℝ := singlePhaseMass (69455300/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw41 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass41_eq : phaseMass41 = (694553/16384000000 : ℝ) := by
  unfold phaseMass41
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw41 output41 cover41 source41
    (gridTreeUnionCheck_sound 32768 raw41 output41 cover41 source41 tree41 checked41)
    _ (by norm_num) _, areaUnits41]
  norm_num

-- Frozen phase 3938, atom 7160, type 1, source (30,60).
def leavesData42 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves42 : Fin 7 → DyadicLeaf := leavesData42.get
def raw42 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 30 60 leaves42 i
def outputData42 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨7680,7808,15360,15488⟩) (.node (.single ⟨7680,7808,15488,15616⟩) (.single ⟨7808,7872,15360,15424⟩))) (.node (.node (.single ⟨7808,7872,15424,15488⟩) (.single ⟨7872,7936,15360,15424⟩)) (.node (.single ⟨7872,7936,15424,15488⟩) (.single ⟨7808,7936,15488,15616⟩)))) (.node (.node (.single ⟨15360,15488,7680,7808⟩) (.node (.single ⟨15360,15424,7808,7872⟩) (.single ⟨15360,15424,7872,7936⟩))) (.node (.node (.single ⟨15424,15488,7808,7872⟩) (.single ⟨15424,15488,7872,7936⟩)) (.node (.single ⟨15488,15616,7680,7808⟩) (.single ⟨15488,15616,7808,7936⟩))))) (.node (.node (.node (.single ⟨17152,17280,24832,24960⟩) (.node (.single ⟨17152,17280,24960,25088⟩) (.single ⟨17280,17344,24832,24896⟩))) (.node (.node (.single ⟨17280,17344,24896,24960⟩) (.single ⟨17344,17408,24832,24896⟩)) (.node (.single ⟨17344,17408,24896,24960⟩) (.single ⟨17280,17408,24960,25088⟩)))) (.node (.node (.single ⟨24832,24960,17152,17280⟩) (.node (.single ⟨24832,24896,17280,17344⟩) (.single ⟨24832,24896,17344,17408⟩))) (.node (.node (.single ⟨24896,24960,17280,17344⟩) (.single ⟨24896,24960,17344,17408⟩)) (.node (.single ⟨24960,25088,17152,17280⟩) (.single ⟨24960,25088,17280,17408⟩))))))
def output42 : Fin 28 → GridBox := outputData42.get
def coverData42 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData42 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover42 (i : Fin 28) : Fin 28 := ⟨coverData42.get i % 28, Nat.mod_lt _ (by decide)⟩
def source42 (i : Fin 28) : Fin 28 := ⟨sourceData42.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree42 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 .empty (.cutY 14336 .empty (.cutX 7168 .empty (.cutY 15360 .empty (.cutX 7680 .empty (.cutY 15872 (.cutX 7936 (.cutY 15616 (.cutX 7808 (.cutY 15488 .full .full) (.cutY 15488 (.cutX 7872 (.cutY 15424 .full .full) (.cutY 15424 .full .full)) .full)) .empty) .empty) .empty))))))))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 .empty (.cutY 6144 .empty (.cutX 15360 .empty (.cutY 7168 .empty (.cutX 15872 (.cutY 7680 .empty (.cutX 15616 (.cutY 7936 (.cutX 15488 (.cutY 7808 .full (.cutX 15424 (.cutY 7872 .full .full) (.cutY 7872 .full .full))) (.cutY 7808 .full .full)) .empty) .empty)) .empty))))))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 (.cutY 26624 (.cutX 17408 (.cutY 25600 (.cutX 16896 .empty (.cutY 25088 (.cutX 17152 .empty (.cutY 24832 .empty (.cutX 17280 (.cutY 24960 .full .full) (.cutY 24960 (.cutX 17344 (.cutY 24896 .full .full) (.cutY 24896 .full .full)) .full)))) .empty)) .empty) .empty) .empty) .empty) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 (.cutY 18432 (.cutX 25600 (.cutY 17408 (.cutX 25088 (.cutY 16896 .empty (.cutX 24832 .empty (.cutY 17152 .empty (.cutX 24960 (.cutY 17280 .full (.cutX 24896 (.cutY 17344 .full .full) (.cutY 17344 .full .full))) (.cutY 17280 .full .full))))) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty))))

theorem metadata42 : 0<69455300 ∧ 30<128 ∧ 60<128 ∧ 1<4 ∧
    7160/4160=1 ∧ 7160%4160=3000 ∧ ∀ i, (leaves42 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData42).mp
    (by decide +kernel)

theorem sourceChecked42_0 : ∀ i : Fin 28,
    (fun i => output42 i = raw42 (source42 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked42 : ∀ i : Fin 28, (fun i => output42 i = raw42 (source42 i)) i :=
  forallFin_of_zero_offset (fun i => output42 i = raw42 (source42 i)) sourceChecked42_0

theorem coverChecked42_0 : ∀ i : Fin 28,
    (fun i => (output42 (cover42 i)).ContainsBox (raw42 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked42 : ∀ i : Fin 28, (fun i => (output42 (cover42 i)).ContainsBox (raw42 i)) i :=
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

noncomputable def phaseMass42 : ℝ := singlePhaseMass (69455300/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw42 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass42_eq : phaseMass42 = (694553/16384000000 : ℝ) := by
  unfold phaseMass42
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw42 output42 cover42 source42
    (gridTreeUnionCheck_sound 32768 raw42 output42 cover42 source42 tree42 checked42)
    _ (by norm_num) _, areaUnits42]
  norm_num

-- Frozen phase 3939, atom 3850, type 0, source (46,78).
def leavesData43 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves43 : Fin 7 → DyadicLeaf := leavesData43.get
def raw43 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 46 78 leaves43 i
def outputData43 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨11776,11904,19968,20096⟩) (.node (.single ⟨11776,11904,20096,20224⟩) (.single ⟨11904,11968,19968,20032⟩))) (.node (.node (.single ⟨11904,11968,20032,20096⟩) (.single ⟨11968,12032,19968,20032⟩)) (.node (.single ⟨11968,12032,20032,20096⟩) (.single ⟨11904,12032,20096,20224⟩)))) (.node (.node (.single ⟨12544,12672,20736,20864⟩) (.node (.single ⟨12544,12672,20864,20992⟩) (.single ⟨12672,12736,20736,20800⟩))) (.node (.node (.single ⟨12672,12736,20800,20864⟩) (.single ⟨12736,12800,20736,20800⟩)) (.node (.single ⟨12736,12800,20800,20864⟩) (.single ⟨12672,12800,20864,20992⟩))))) (.node (.node (.node (.single ⟨19968,20096,11776,11904⟩) (.node (.single ⟨19968,20032,11904,11968⟩) (.single ⟨19968,20032,11968,12032⟩))) (.node (.node (.single ⟨20032,20096,11904,11968⟩) (.single ⟨20032,20096,11968,12032⟩)) (.node (.single ⟨20096,20224,11776,11904⟩) (.single ⟨20096,20224,11904,12032⟩)))) (.node (.node (.single ⟨20736,20864,12544,12672⟩) (.node (.single ⟨20736,20800,12672,12736⟩) (.single ⟨20736,20800,12736,12800⟩))) (.node (.node (.single ⟨20800,20864,12672,12736⟩) (.single ⟨20800,20864,12736,12800⟩)) (.node (.single ⟨20864,20992,12544,12672⟩) (.single ⟨20864,20992,12672,12800⟩))))))
def output43 : Fin 28 → GridBox := outputData43.get
def coverData43 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData43 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover43 (i : Fin 28) : Fin 28 := ⟨coverData43.get i % 28, Nat.mod_lt _ (by decide)⟩
def source43 (i : Fin 28) : Fin 28 := ⟨sourceData43.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree43 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 .empty (.cutY 18432 .empty (.cutX 11264 .empty (.cutY 19456 .empty (.cutX 11776 .empty (.cutY 19968 .empty (.cutX 12032 (.cutY 20224 (.cutX 11904 (.cutY 20096 .full .full) (.cutY 20096 (.cutX 11968 (.cutY 20032 .full .full) (.cutY 20032 .full .full)) .full)) .empty) .empty))))))) .empty) (.cutY 20480 .empty (.cutX 14336 (.cutY 22528 (.cutX 13312 (.cutY 21504 (.cutX 12800 (.cutY 20992 (.cutX 12544 .empty (.cutY 20736 .empty (.cutX 12672 (.cutY 20864 .full .full) (.cutY 20864 (.cutX 12736 (.cutY 20800 .full .full) (.cutY 20800 .full .full)) .full)))) .empty) .empty) .empty) .empty) .empty) .empty))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 .empty (.cutY 10240 .empty (.cutX 19456 .empty (.cutY 11264 .empty (.cutX 19968 .empty (.cutY 11776 .empty (.cutX 20224 (.cutY 12032 (.cutX 20096 (.cutY 11904 .full (.cutX 20032 (.cutY 11968 .full .full) (.cutY 11968 .full .full))) (.cutY 11904 .full .full)) .empty) .empty))))))) .empty) (.cutY 12288 .empty (.cutX 22528 (.cutY 14336 (.cutX 21504 (.cutY 13312 (.cutX 20992 (.cutY 12800 (.cutX 20736 .empty (.cutY 12544 .empty (.cutX 20864 (.cutY 12672 .full (.cutX 20800 (.cutY 12736 .full .full) (.cutY 12736 .full .full))) (.cutY 12672 .full .full)))) .empty) .empty) .empty) .empty) .empty) .empty)))) .empty) .empty))

theorem metadata43 : 0<211618637 ∧ 46<128 ∧ 78<128 ∧ 0<4 ∧
    3850/4160=0 ∧ 3850%4160=3850 ∧ ∀ i, (leaves43 i).Valid 8 := by
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

noncomputable def phaseMass43 : ℝ := singlePhaseMass (211618637/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw43 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass43_eq : phaseMass43 = (211618637/1638400000000 : ℝ) := by
  unfold phaseMass43
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw43 output43 cover43 source43
    (gridTreeUnionCheck_sound 32768 raw43 output43 cover43 source43 tree43 checked43)
    _ (by norm_num) _, areaUnits43]
  norm_num

-- Frozen phase 3940, atom 3886, type 0, source (47,79).
def leavesData44 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves44 : Fin 7 → DyadicLeaf := leavesData44.get
def raw44 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 47 79 leaves44 i
def outputData44 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨12032,12160,20224,20352⟩) (.node (.single ⟨12032,12160,20352,20480⟩) (.single ⟨12160,12224,20224,20288⟩))) (.node (.node (.single ⟨12160,12224,20288,20352⟩) (.single ⟨12224,12288,20224,20288⟩)) (.node (.single ⟨12224,12288,20288,20352⟩) (.single ⟨12160,12288,20352,20480⟩)))) (.node (.node (.single ⟨12288,12416,20480,20608⟩) (.node (.single ⟨12288,12416,20608,20736⟩) (.single ⟨12416,12480,20480,20544⟩))) (.node (.node (.single ⟨12416,12480,20544,20608⟩) (.single ⟨12480,12544,20480,20544⟩)) (.node (.single ⟨12480,12544,20544,20608⟩) (.single ⟨12416,12544,20608,20736⟩))))) (.node (.node (.node (.single ⟨20224,20352,12032,12160⟩) (.node (.single ⟨20224,20288,12160,12224⟩) (.single ⟨20224,20288,12224,12288⟩))) (.node (.node (.single ⟨20288,20352,12160,12224⟩) (.single ⟨20288,20352,12224,12288⟩)) (.node (.single ⟨20352,20480,12032,12160⟩) (.single ⟨20352,20480,12160,12288⟩)))) (.node (.node (.single ⟨20480,20608,12288,12416⟩) (.node (.single ⟨20480,20544,12416,12480⟩) (.single ⟨20480,20544,12480,12544⟩))) (.node (.node (.single ⟨20544,20608,12416,12480⟩) (.single ⟨20544,20608,12480,12544⟩)) (.node (.single ⟨20608,20736,12288,12416⟩) (.single ⟨20608,20736,12416,12544⟩))))))
def output44 : Fin 28 → GridBox := outputData44.get
def coverData44 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData44 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover44 (i : Fin 28) : Fin 28 := ⟨coverData44.get i % 28, Nat.mod_lt _ (by decide)⟩
def source44 (i : Fin 28) : Fin 28 := ⟨sourceData44.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree44 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 .empty (.cutY 18432 .empty (.cutX 11264 .empty (.cutY 19456 .empty (.cutX 11776 .empty (.cutY 19968 .empty (.cutX 12032 .empty (.cutY 20224 .empty (.cutX 12160 (.cutY 20352 .full .full) (.cutY 20352 (.cutX 12224 (.cutY 20288 .full .full) (.cutY 20288 .full .full)) .full)))))))))) .empty) (.cutY 20480 .empty (.cutX 14336 (.cutY 22528 (.cutX 13312 (.cutY 21504 (.cutX 12800 (.cutY 20992 (.cutX 12544 (.cutY 20736 (.cutX 12416 (.cutY 20608 .full .full) (.cutY 20608 (.cutX 12480 (.cutY 20544 .full .full) (.cutY 20544 .full .full)) .full)) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 .empty (.cutY 10240 .empty (.cutX 19456 .empty (.cutY 11264 .empty (.cutX 19968 .empty (.cutY 11776 .empty (.cutX 20224 .empty (.cutY 12032 .empty (.cutX 20352 (.cutY 12160 .full (.cutX 20288 (.cutY 12224 .full .full) (.cutY 12224 .full .full))) (.cutY 12160 .full .full)))))))))) .empty) (.cutY 12288 .empty (.cutX 22528 (.cutY 14336 (.cutX 21504 (.cutY 13312 (.cutX 20992 (.cutY 12800 (.cutX 20736 (.cutY 12544 (.cutX 20608 (.cutY 12416 .full (.cutX 20544 (.cutY 12480 .full .full) (.cutY 12480 .full .full))) (.cutY 12416 .full .full)) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty)))) .empty) .empty))

theorem metadata44 : 0<211618637 ∧ 47<128 ∧ 79<128 ∧ 0<4 ∧
    3886/4160=0 ∧ 3886%4160=3886 ∧ ∀ i, (leaves44 i).Valid 8 := by
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

noncomputable def phaseMass44 : ℝ := singlePhaseMass (211618637/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw44 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass44_eq : phaseMass44 = (211618637/1638400000000 : ℝ) := by
  unfold phaseMass44
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw44 output44 cover44 source44
    (gridTreeUnionCheck_sound 32768 raw44 output44 cover44 source44 tree44 checked44)
    _ (by norm_num) _, areaUnits44]
  norm_num

-- Frozen phase 3941, atom 3323, type 0, source (35,68).
def leavesData45 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves45 : Fin 4 → DyadicLeaf := leavesData45.get
def raw45 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 35 68 leaves45 i
def outputData45 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨8960,9088,17408,17536⟩) (.single ⟨8960,9088,17536,17664⟩)) (.node (.single ⟨9088,9216,17408,17536⟩) (.single ⟨9088,9216,17536,17664⟩))) (.node (.node (.single ⟨15104,15232,23552,23680⟩) (.single ⟨15104,15232,23680,23808⟩)) (.node (.single ⟨15232,15360,23552,23680⟩) (.single ⟨15232,15360,23680,23808⟩)))) (.node (.node (.node (.single ⟨17408,17536,8960,9088⟩) (.single ⟨17408,17536,9088,9216⟩)) (.node (.single ⟨17536,17664,8960,9088⟩) (.single ⟨17536,17664,9088,9216⟩))) (.node (.node (.single ⟨23552,23680,15104,15232⟩) (.single ⟨23552,23680,15232,15360⟩)) (.node (.single ⟨23680,23808,15104,15232⟩) (.single ⟨23680,23808,15232,15360⟩)))))
def output45 : Fin 16 → GridBox := outputData45.get
def coverData45 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData45 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover45 (i : Fin 16) : Fin 16 := ⟨coverData45.get i % 16, Nat.mod_lt _ (by decide)⟩
def source45 (i : Fin 16) : Fin 16 := ⟨sourceData45.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree45 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 (.cutY 18432 (.cutX 9216 (.cutY 17408 .empty (.cutX 8704 .empty (.cutY 17920 (.cutX 8960 .empty (.cutY 17664 (.cutX 9088 (.cutY 17536 .full .full) (.cutY 17536 .full .full)) .empty)) .empty))) .empty) .empty) .empty) .empty) (.cutY 20480 .empty (.cutX 14336 .empty (.cutY 22528 .empty (.cutX 15360 (.cutY 23552 .empty (.cutX 14848 .empty (.cutY 24064 (.cutX 15104 .empty (.cutY 23808 (.cutX 15232 (.cutY 23680 .full .full) (.cutY 23680 .full .full)) .empty)) .empty))) .empty))))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 (.cutY 10240 (.cutX 17408 .empty (.cutY 9216 (.cutX 17920 (.cutY 8704 .empty (.cutX 17664 (.cutY 8960 .empty (.cutX 17536 (.cutY 9088 .full .full) (.cutY 9088 .full .full))) .empty)) .empty) .empty)) .empty) .empty) .empty) (.cutY 12288 .empty (.cutX 22528 .empty (.cutY 14336 .empty (.cutX 23552 .empty (.cutY 15360 (.cutX 24064 (.cutY 14848 .empty (.cutX 23808 (.cutY 15104 .empty (.cutX 23680 (.cutY 15232 .full .full) (.cutY 15232 .full .full))) .empty)) .empty) .empty))))))) .empty) .empty))

theorem metadata45 : 0<167572778 ∧ 35<128 ∧ 68<128 ∧ 0<4 ∧
    3323/4160=0 ∧ 3323%4160=3323 ∧ ∀ i, (leaves45 i).Valid 8 := by
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

noncomputable def phaseMass45 : ℝ := singlePhaseMass (167572778/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw45 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass45_eq : phaseMass45 = (83786389/819200000000 : ℝ) := by
  unfold phaseMass45
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw45 output45 cover45 source45
    (gridTreeUnionCheck_sound 32768 raw45 output45 cover45 source45 tree45 checked45)
    _ (by norm_num) _, areaUnits45]
  norm_num

-- Frozen phase 3942, atom 2555, type 0, source (24,59).
def leavesData46 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves46 : Fin 4 → DyadicLeaf := leavesData46.get
def raw46 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 24 59 leaves46 i
def outputData46 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨6144,6272,15104,15232⟩) (.single ⟨6144,6272,15232,15360⟩)) (.node (.single ⟨6272,6400,15104,15232⟩) (.single ⟨6272,6400,15232,15360⟩))) (.node (.node (.single ⟨15104,15232,6144,6272⟩) (.single ⟨15104,15232,6272,6400⟩)) (.node (.single ⟨15232,15360,6144,6272⟩) (.single ⟨15232,15360,6272,6400⟩)))) (.node (.node (.node (.single ⟨17408,17536,26368,26496⟩) (.single ⟨17408,17536,26496,26624⟩)) (.node (.single ⟨17536,17664,26368,26496⟩) (.single ⟨17536,17664,26496,26624⟩))) (.node (.node (.single ⟨26368,26496,17408,17536⟩) (.single ⟨26368,26496,17536,17664⟩)) (.node (.single ⟨26496,26624,17408,17536⟩) (.single ⟨26496,26624,17536,17664⟩)))))
def output46 : Fin 16 → GridBox := outputData46.get
def coverData46 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData46 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover46 (i : Fin 16) : Fin 16 := ⟨coverData46.get i % 16, Nat.mod_lt _ (by decide)⟩
def source46 (i : Fin 16) : Fin 16 := ⟨sourceData46.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree46 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 .empty (.cutY 14336 .empty (.cutX 7168 (.cutY 15360 (.cutX 6656 (.cutY 14848 .empty (.cutX 6400 (.cutY 15104 .empty (.cutX 6272 (.cutY 15232 .full .full) (.cutY 15232 .full .full))) .empty)) .empty) .empty) .empty)))))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 .empty (.cutY 6144 .empty (.cutX 15360 (.cutY 7168 (.cutX 14848 .empty (.cutY 6656 (.cutX 15104 .empty (.cutY 6400 (.cutX 15232 (.cutY 6272 .full .full) (.cutY 6272 .full .full)) .empty)) .empty)) .empty) .empty))))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 (.cutY 26624 (.cutX 17408 .empty (.cutY 25600 .empty (.cutX 17920 (.cutY 26112 .empty (.cutX 17664 (.cutY 26368 .empty (.cutX 17536 (.cutY 26496 .full .full) (.cutY 26496 .full .full))) .empty)) .empty))) .empty) .empty) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 (.cutY 18432 (.cutX 25600 .empty (.cutY 17408 .empty (.cutX 26112 .empty (.cutY 17920 (.cutX 26368 .empty (.cutY 17664 (.cutX 26496 (.cutY 17536 .full .full) (.cutY 17536 .full .full)) .empty)) .empty)))) .empty) .empty) .empty) .empty) .empty))))

theorem metadata46 : 0<29910597 ∧ 24<128 ∧ 59<128 ∧ 0<4 ∧
    2555/4160=0 ∧ 2555%4160=2555 ∧ ∀ i, (leaves46 i).Valid 8 := by
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

noncomputable def phaseMass46 : ℝ := singlePhaseMass (29910597/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw46 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass46_eq : phaseMass46 = (29910597/1638400000000 : ℝ) := by
  unfold phaseMass46
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw46 output46 cover46 source46
    (gridTreeUnionCheck_sound 32768 raw46 output46 cover46 source46 tree46 checked46)
    _ (by norm_num) _, areaUnits46]
  norm_num

-- Frozen phase 3943, atom 2217, type 0, source (20,57).
def leavesData47 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves47 : Fin 4 → DyadicLeaf := leavesData47.get
def raw47 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 20 57 leaves47 i
def outputData47 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨5120,5248,14592,14720⟩) (.single ⟨5120,5248,14720,14848⟩)) (.node (.single ⟨5248,5376,14592,14720⟩) (.single ⟨5248,5376,14720,14848⟩))) (.node (.node (.single ⟨14592,14720,5120,5248⟩) (.single ⟨14592,14720,5248,5376⟩)) (.node (.single ⟨14720,14848,5120,5248⟩) (.single ⟨14720,14848,5248,5376⟩)))) (.node (.node (.node (.single ⟨17920,18048,27392,27520⟩) (.single ⟨17920,18048,27520,27648⟩)) (.node (.single ⟨18048,18176,27392,27520⟩) (.single ⟨18048,18176,27520,27648⟩))) (.node (.node (.single ⟨27392,27520,17920,18048⟩) (.single ⟨27392,27520,18048,18176⟩)) (.node (.single ⟨27520,27648,17920,18048⟩) (.single ⟨27520,27648,18048,18176⟩)))))
def output47 : Fin 16 → GridBox := outputData47.get
def coverData47 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData47 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover47 (i : Fin 16) : Fin 16 := ⟨coverData47.get i % 16, Nat.mod_lt _ (by decide)⟩
def source47 (i : Fin 16) : Fin 16 := ⟨sourceData47.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree47 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 (.cutY 14336 .empty (.cutX 5120 .empty (.cutY 15360 (.cutX 5632 (.cutY 14848 (.cutX 5376 (.cutY 14592 .empty (.cutX 5248 (.cutY 14720 .full .full) (.cutY 14720 .full .full))) .empty) .empty) .empty) .empty))) .empty)))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 .empty (.cutY 6144 (.cutX 15360 (.cutY 5120 .empty (.cutX 14848 (.cutY 5632 (.cutX 14592 .empty (.cutY 5376 (.cutX 14720 (.cutY 5248 .full .full) (.cutY 5248 .full .full)) .empty)) .empty) .empty)) .empty) .empty)))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 (.cutY 26624 .empty (.cutX 17408 .empty (.cutY 27648 (.cutX 17920 .empty (.cutY 27136 .empty (.cutX 18176 (.cutY 27392 .empty (.cutX 18048 (.cutY 27520 .full .full) (.cutY 27520 .full .full))) .empty))) .empty))) .empty) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 .empty (.cutY 18432 (.cutX 27648 (.cutY 17408 .empty (.cutX 27136 .empty (.cutY 17920 .empty (.cutX 27392 .empty (.cutY 18176 (.cutX 27520 (.cutY 18048 .full .full) (.cutY 18048 .full .full)) .empty))))) .empty) .empty)) .empty) .empty) .empty))))

theorem metadata47 : 0<185830537 ∧ 20<128 ∧ 57<128 ∧ 0<4 ∧
    2217/4160=0 ∧ 2217%4160=2217 ∧ ∀ i, (leaves47 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData47).mp
    (by decide +kernel)

theorem sourceChecked47_0 : ∀ i : Fin 16,
    (fun i => output47 i = raw47 (source47 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked47 : ∀ i : Fin 16, (fun i => output47 i = raw47 (source47 i)) i :=
  forallFin_of_zero_offset (fun i => output47 i = raw47 (source47 i)) sourceChecked47_0

theorem coverChecked47_0 : ∀ i : Fin 16,
    (fun i => (output47 (cover47 i)).ContainsBox (raw47 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked47 : ∀ i : Fin 16, (fun i => (output47 (cover47 i)).ContainsBox (raw47 i)) i :=
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

noncomputable def phaseMass47 : ℝ := singlePhaseMass (185830537/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw47 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass47_eq : phaseMass47 = (185830537/1638400000000 : ℝ) := by
  unfold phaseMass47
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw47 output47 cover47 source47
    (gridTreeUnionCheck_sound 32768 raw47 output47 cover47 source47 tree47 checked47)
    _ (by norm_num) _, areaUnits47]
  norm_num

-- Frozen phase 3944, atom 546, type 0, source (4,50).
def leavesData48 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves48 : Fin 4 → DyadicLeaf := leavesData48.get
def raw48 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 4 50 leaves48 i
def outputData48 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨1024,1152,12800,12928⟩) (.single ⟨1024,1152,12928,13056⟩)) (.node (.single ⟨1152,1280,12800,12928⟩) (.single ⟨1152,1280,12928,13056⟩))) (.node (.node (.single ⟨12800,12928,1024,1152⟩) (.single ⟨12800,12928,1152,1280⟩)) (.node (.single ⟨12928,13056,1024,1152⟩) (.single ⟨12928,13056,1152,1280⟩)))) (.node (.node (.node (.single ⟨19712,19840,31488,31616⟩) (.single ⟨19712,19840,31616,31744⟩)) (.node (.single ⟨19840,19968,31488,31616⟩) (.single ⟨19840,19968,31616,31744⟩))) (.node (.node (.single ⟨31488,31616,19712,19840⟩) (.single ⟨31488,31616,19840,19968⟩)) (.node (.single ⟨31616,31744,19712,19840⟩) (.single ⟨31616,31744,19840,19968⟩)))))
def output48 : Fin 16 → GridBox := outputData48.get
def coverData48 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData48 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover48 (i : Fin 16) : Fin 16 := ⟨coverData48.get i % 16, Nat.mod_lt _ (by decide)⟩
def source48 (i : Fin 16) : Fin 16 := ⟨sourceData48.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree48 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 (.cutX 1024 .empty (.cutY 13312 (.cutX 1536 (.cutY 12800 .empty (.cutX 1280 (.cutY 13056 (.cutX 1152 (.cutY 12928 .full .full) (.cutY 12928 .full .full)) .empty) .empty)) .empty) .empty)) .empty) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 (.cutY 2048 (.cutX 13312 (.cutY 1024 .empty (.cutX 12800 .empty (.cutY 1536 (.cutX 13056 (.cutY 1280 (.cutX 12928 (.cutY 1152 .full .full) (.cutY 1152 .full .full)) .empty) .empty) .empty))) .empty) .empty) .empty) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 .empty (.cutY 30720 .empty (.cutX 19456 .empty (.cutY 31744 (.cutX 19968 (.cutY 31232 .empty (.cutX 19712 .empty (.cutY 31488 .empty (.cutX 19840 (.cutY 31616 .full .full) (.cutY 31616 .full .full))))) .empty) .empty))))) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 .empty (.cutX 31744 (.cutY 19456 .empty (.cutX 31232 .empty (.cutY 19968 (.cutX 31488 .empty (.cutY 19712 .empty (.cutX 31616 (.cutY 19840 .full .full) (.cutY 19840 .full .full)))) .empty))) .empty))) .empty)) .empty))))

theorem metadata48 : 0<214747992 ∧ 4<128 ∧ 50<128 ∧ 0<4 ∧
    546/4160=0 ∧ 546%4160=546 ∧ ∀ i, (leaves48 i).Valid 8 := by
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

noncomputable def phaseMass48 : ℝ := singlePhaseMass (214747992/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw48 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass48_eq : phaseMass48 = (26843499/204800000000 : ℝ) := by
  unfold phaseMass48
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw48 output48 cover48 source48
    (gridTreeUnionCheck_sound 32768 raw48 output48 cover48 source48 tree48 checked48)
    _ (by norm_num) _, areaUnits48]
  norm_num

-- Frozen phase 3945, atom 2788, type 0, source (27,61).
def leavesData49 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves49 : Fin 4 → DyadicLeaf := leavesData49.get
def raw49 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 27 61 leaves49 i
def outputData49 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨6912,7040,15616,15744⟩) (.single ⟨6912,7040,15744,15872⟩)) (.node (.single ⟨7040,7168,15616,15744⟩) (.single ⟨7040,7168,15744,15872⟩))) (.node (.node (.single ⟨15616,15744,6912,7040⟩) (.single ⟨15616,15744,7040,7168⟩)) (.node (.single ⟨15744,15872,6912,7040⟩) (.single ⟨15744,15872,7040,7168⟩)))) (.node (.node (.node (.single ⟨16896,17024,25600,25728⟩) (.single ⟨16896,17024,25728,25856⟩)) (.node (.single ⟨17024,17152,25600,25728⟩) (.single ⟨17024,17152,25728,25856⟩))) (.node (.node (.single ⟨25600,25728,16896,17024⟩) (.single ⟨25600,25728,17024,17152⟩)) (.node (.single ⟨25728,25856,16896,17024⟩) (.single ⟨25728,25856,17024,17152⟩)))))
def output49 : Fin 16 → GridBox := outputData49.get
def coverData49 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData49 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover49 (i : Fin 16) : Fin 16 := ⟨coverData49.get i % 16, Nat.mod_lt _ (by decide)⟩
def source49 (i : Fin 16) : Fin 16 := ⟨sourceData49.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree49 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 .empty (.cutY 14336 .empty (.cutX 7168 (.cutY 15360 .empty (.cutX 6656 .empty (.cutY 15872 (.cutX 6912 .empty (.cutY 15616 .empty (.cutX 7040 (.cutY 15744 .full .full) (.cutY 15744 .full .full)))) .empty))) .empty)))))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 .empty (.cutY 6144 .empty (.cutX 15360 .empty (.cutY 7168 (.cutX 15872 (.cutY 6656 .empty (.cutX 15616 .empty (.cutY 6912 .empty (.cutX 15744 (.cutY 7040 .full .full) (.cutY 7040 .full .full))))) .empty) .empty)))))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 (.cutY 26624 (.cutX 17408 (.cutY 25600 .empty (.cutX 16896 .empty (.cutY 26112 (.cutX 17152 (.cutY 25856 (.cutX 17024 (.cutY 25728 .full .full) (.cutY 25728 .full .full)) .empty) .empty) .empty))) .empty) .empty) .empty) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 (.cutY 18432 (.cutX 25600 .empty (.cutY 17408 (.cutX 26112 (.cutY 16896 .empty (.cutX 25856 (.cutY 17152 (.cutX 25728 (.cutY 17024 .full .full) (.cutY 17024 .full .full)) .empty) .empty)) .empty) .empty)) .empty) .empty) .empty) .empty) .empty))))

theorem metadata49 : 0<29910597 ∧ 27<128 ∧ 61<128 ∧ 0<4 ∧
    2788/4160=0 ∧ 2788%4160=2788 ∧ ∀ i, (leaves49 i).Valid 8 := by
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

noncomputable def phaseMass49 : ℝ := singlePhaseMass (29910597/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw49 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass49_eq : phaseMass49 = (29910597/1638400000000 : ℝ) := by
  unfold phaseMass49
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw49 output49 cover49 source49
    (gridTreeUnionCheck_sound 32768 raw49 output49 cover49 source49 tree49 checked49)
    _ (by norm_num) _, areaUnits49]
  norm_num

-- Frozen phase 3946, atom 7358, type 1, source (33,63).
def leavesData50 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves50 : Fin 7 → DyadicLeaf := leavesData50.get
def raw50 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 33 63 leaves50 i
def outputData50 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨8448,8576,16128,16256⟩) (.node (.single ⟨8448,8576,16256,16384⟩) (.single ⟨8576,8640,16128,16192⟩))) (.node (.node (.single ⟨8576,8640,16192,16256⟩) (.single ⟨8640,8704,16128,16192⟩)) (.node (.single ⟨8640,8704,16192,16256⟩) (.single ⟨8576,8704,16256,16384⟩)))) (.node (.node (.single ⟨16128,16256,8448,8576⟩) (.node (.single ⟨16128,16192,8576,8640⟩) (.single ⟨16128,16192,8640,8704⟩))) (.node (.node (.single ⟨16192,16256,8576,8640⟩) (.single ⟨16192,16256,8640,8704⟩)) (.node (.single ⟨16256,16384,8448,8576⟩) (.single ⟨16256,16384,8576,8704⟩))))) (.node (.node (.node (.single ⟨16384,16512,24064,24192⟩) (.node (.single ⟨16384,16512,24192,24320⟩) (.single ⟨16512,16576,24064,24128⟩))) (.node (.node (.single ⟨16512,16576,24128,24192⟩) (.single ⟨16576,16640,24064,24128⟩)) (.node (.single ⟨16576,16640,24128,24192⟩) (.single ⟨16512,16640,24192,24320⟩)))) (.node (.node (.single ⟨24064,24192,16384,16512⟩) (.node (.single ⟨24064,24128,16512,16576⟩) (.single ⟨24064,24128,16576,16640⟩))) (.node (.node (.single ⟨24128,24192,16512,16576⟩) (.single ⟨24128,24192,16576,16640⟩)) (.node (.single ⟨24192,24320,16384,16512⟩) (.single ⟨24192,24320,16512,16640⟩))))))
def output50 : Fin 28 → GridBox := outputData50.get
def coverData50 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData50 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover50 (i : Fin 28) : Fin 28 := ⟨coverData50.get i % 28, Nat.mod_lt _ (by decide)⟩
def source50 (i : Fin 28) : Fin 28 := ⟨sourceData50.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree50 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 .empty (.cutX 10240 (.cutY 14336 .empty (.cutX 9216 (.cutY 15360 .empty (.cutX 8704 (.cutY 15872 .empty (.cutX 8448 .empty (.cutY 16128 .empty (.cutX 8576 (.cutY 16256 .full .full) (.cutY 16256 (.cutX 8640 (.cutY 16192 .full .full) (.cutY 16192 .full .full)) .full))))) .empty)) .empty)) .empty)) (.cutY 12288 (.cutX 14336 .empty (.cutY 10240 (.cutX 15360 .empty (.cutY 9216 (.cutX 15872 .empty (.cutY 8704 (.cutX 16128 .empty (.cutY 8448 .empty (.cutX 16256 (.cutY 8576 .full (.cutX 16192 (.cutY 8640 .full .full) (.cutY 8640 .full .full))) (.cutY 8576 .full .full)))) .empty)) .empty)) .empty)) .empty)))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 (.cutY 20480 .empty (.cutX 18432 (.cutY 22528 .empty (.cutX 17408 (.cutY 23552 .empty (.cutX 16896 (.cutY 24064 .empty (.cutX 16640 (.cutY 24320 (.cutX 16512 (.cutY 24192 .full .full) (.cutY 24192 (.cutX 16576 (.cutY 24128 .full .full) (.cutY 24128 .full .full)) .full)) .empty) .empty)) .empty)) .empty)) .empty)) (.cutY 20480 (.cutX 22528 .empty (.cutY 18432 (.cutX 23552 .empty (.cutY 17408 (.cutX 24064 .empty (.cutY 16896 (.cutX 24320 (.cutY 16640 (.cutX 24192 (.cutY 16512 .full (.cutX 24128 (.cutY 16576 .full .full) (.cutY 16576 .full .full))) (.cutY 16512 .full .full)) .empty) .empty) .empty)) .empty)) .empty)) .empty)) .empty) .empty)))

theorem metadata50 : 0<168966520 ∧ 33<128 ∧ 63<128 ∧ 1<4 ∧
    7358/4160=1 ∧ 7358%4160=3198 ∧ ∀ i, (leaves50 i).Valid 8 := by
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

noncomputable def phaseMass50 : ℝ := singlePhaseMass (168966520/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw50 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass50_eq : phaseMass50 = (4224163/40960000000 : ℝ) := by
  unfold phaseMass50
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw50 output50 cover50 source50
    (gridTreeUnionCheck_sound 32768 raw50 output50 cover50 source50 tree50 checked50)
    _ (by norm_num) _, areaUnits50]
  norm_num

-- Frozen phase 3947, atom 5389, type 1, source (10,49).
def leavesData51 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves51 : Fin 10 → DyadicLeaf := leavesData51.get
def raw51 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 10 49 leaves51 i
def outputData51 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨2560,2624,12544,12608⟩) (.single ⟨2560,2624,12608,12672⟩)) (.node (.single ⟨2624,2688,12544,12608⟩) (.node (.single ⟨2624,2688,12608,12672⟩) (.single ⟨2560,2688,12672,12800⟩)))) (.node (.node (.single ⟨2688,2752,12544,12608⟩) (.single ⟨2688,2752,12608,12672⟩)) (.node (.single ⟨2752,2816,12544,12608⟩) (.node (.single ⟨2752,2816,12608,12672⟩) (.single ⟨2688,2816,12672,12800⟩))))) (.node (.node (.node (.single ⟨12544,12608,2560,2624⟩) (.single ⟨12544,12608,2624,2688⟩)) (.node (.single ⟨12608,12672,2560,2624⟩) (.node (.single ⟨12608,12672,2624,2688⟩) (.single ⟨12544,12608,2688,2752⟩)))) (.node (.node (.single ⟨12544,12608,2752,2816⟩) (.single ⟨12608,12672,2688,2752⟩)) (.node (.single ⟨12608,12672,2752,2816⟩) (.node (.single ⟨12672,12800,2560,2688⟩) (.single ⟨12672,12800,2688,2816⟩)))))) (.node (.node (.node (.node (.single ⟨19968,20096,29952,30080⟩) (.single ⟨19968,20096,30080,30208⟩)) (.node (.single ⟨20096,20160,29952,30016⟩) (.node (.single ⟨20096,20160,30016,30080⟩) (.single ⟨20160,20224,29952,30016⟩)))) (.node (.node (.single ⟨20160,20224,30016,30080⟩) (.single ⟨20096,20160,30080,30144⟩)) (.node (.single ⟨20096,20160,30144,30208⟩) (.node (.single ⟨20160,20224,30080,30144⟩) (.single ⟨20160,20224,30144,30208⟩))))) (.node (.node (.node (.single ⟨29952,30080,19968,20096⟩) (.single ⟨29952,30016,20096,20160⟩)) (.node (.single ⟨29952,30016,20160,20224⟩) (.node (.single ⟨30016,30080,20096,20160⟩) (.single ⟨30016,30080,20160,20224⟩)))) (.node (.node (.single ⟨30080,30208,19968,20096⟩) (.single ⟨30080,30144,20096,20160⟩)) (.node (.single ⟨30080,30144,20160,20224⟩) (.node (.single ⟨30144,30208,20096,20160⟩) (.single ⟨30144,30208,20160,20224⟩)))))))
def output51 : Fin 40 → GridBox := outputData51.get
def coverData51 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 18)) (.node (.single 35) (.node (.single 21) (.single 9)))) (.node (.node (.single 19) (.single 30)) (.node (.single 20) (.node (.single 5) (.single 14))))) (.node (.node (.node (.single 34) (.single 25)) (.node (.single 6) (.node (.single 16) (.single 33)))) (.node (.node (.single 23) (.single 7)) (.node (.single 15) (.node (.single 32) (.single 24)))))) (.node (.node (.node (.node (.single 8) (.single 17)) (.node (.single 31) (.node (.single 22) (.single 0)))) (.node (.node (.single 10) (.single 39)) (.node (.single 29) (.node (.single 1) (.single 12))))) (.node (.node (.node (.single 38) (.single 27)) (.node (.single 2) (.node (.single 11) (.single 37)))) (.node (.node (.single 28) (.single 3)) (.node (.single 13) (.node (.single 36) (.single 26)))))))
def sourceData51 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover51 (i : Fin 40) : Fin 40 := ⟨coverData51.get i % 40, Nat.mod_lt _ (by decide)⟩
def source51 (i : Fin 40) : Fin 40 := ⟨sourceData51.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree51 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 (.cutX 3072 (.cutY 13312 (.cutX 2560 .empty (.cutY 12800 (.cutX 2816 (.cutY 12544 .empty (.cutX 2688 (.cutY 12672 (.cutX 2624 (.cutY 12608 .full .full) (.cutY 12608 .full .full)) .full) (.cutY 12672 (.cutX 2752 (.cutY 12608 .full .full) (.cutY 12608 .full .full)) .full))) .empty) .empty)) .empty) .empty) .empty))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 (.cutY 2048 .empty (.cutX 13312 (.cutY 3072 (.cutX 12800 (.cutY 2560 .empty (.cutX 12544 .empty (.cutY 2816 (.cutX 12672 (.cutY 2688 (.cutX 12608 (.cutY 2624 .full .full) (.cutY 2624 .full .full)) (.cutX 12608 (.cutY 2752 .full .full) (.cutY 2752 .full .full))) (.cutY 2688 .full .full)) .empty))) .empty) .empty) .empty)) .empty) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 .empty (.cutY 30720 (.cutX 19456 .empty (.cutY 29696 .empty (.cutX 19968 .empty (.cutY 30208 (.cutX 20224 (.cutY 29952 .empty (.cutX 20096 (.cutY 30080 .full .full) (.cutY 30080 (.cutX 20160 (.cutY 30016 .full .full) (.cutY 30016 .full .full)) (.cutX 20160 (.cutY 30144 .full .full) (.cutY 30144 .full .full))))) .empty) .empty)))) .empty))) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 .empty (.cutX 29696 .empty (.cutY 19456 .empty (.cutX 30208 (.cutY 19968 .empty (.cutX 29952 .empty (.cutY 20224 (.cutX 30080 (.cutY 20096 .full (.cutX 30016 (.cutY 20160 .full .full) (.cutY 20160 .full .full))) (.cutY 20096 .full (.cutX 30144 (.cutY 20160 .full .full) (.cutY 20160 .full .full)))) .empty))) .empty)))) .empty) .empty)) .empty))))

theorem metadata51 : 0<144841863 ∧ 10<128 ∧ 49<128 ∧ 1<4 ∧
    5389/4160=1 ∧ 5389%4160=1229 ∧ ∀ i, (leaves51 i).Valid 8 := by
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

noncomputable def phaseMass51 : ℝ := singlePhaseMass (144841863/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw51 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass51_eq : phaseMass51 = (144841863/1638400000000 : ℝ) := by
  unfold phaseMass51
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw51 output51 cover51 source51
    (gridTreeUnionCheck_sound 32768 raw51 output51 cover51 source51 tree51 checked51)
    _ (by norm_num) _, areaUnits51]
  norm_num

-- Frozen phase 3948, atom 6945, type 1, source (27,58).
def leavesData52 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves52 : Fin 7 → DyadicLeaf := leavesData52.get
def raw52 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 27 58 leaves52 i
def outputData52 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨6912,7040,14848,14976⟩) (.node (.single ⟨6912,7040,14976,15104⟩) (.single ⟨7040,7104,14848,14912⟩))) (.node (.node (.single ⟨7040,7104,14912,14976⟩) (.single ⟨7104,7168,14848,14912⟩)) (.node (.single ⟨7104,7168,14912,14976⟩) (.single ⟨7040,7168,14976,15104⟩)))) (.node (.node (.single ⟨14848,14976,6912,7040⟩) (.node (.single ⟨14848,14912,7040,7104⟩) (.single ⟨14848,14912,7104,7168⟩))) (.node (.node (.single ⟨14912,14976,7040,7104⟩) (.single ⟨14912,14976,7104,7168⟩)) (.node (.single ⟨14976,15104,6912,7040⟩) (.single ⟨14976,15104,7040,7168⟩))))) (.node (.node (.node (.single ⟨17664,17792,25600,25728⟩) (.node (.single ⟨17664,17792,25728,25856⟩) (.single ⟨17792,17856,25600,25664⟩))) (.node (.node (.single ⟨17792,17856,25664,25728⟩) (.single ⟨17856,17920,25600,25664⟩)) (.node (.single ⟨17856,17920,25664,25728⟩) (.single ⟨17792,17920,25728,25856⟩)))) (.node (.node (.single ⟨25600,25728,17664,17792⟩) (.node (.single ⟨25600,25664,17792,17856⟩) (.single ⟨25600,25664,17856,17920⟩))) (.node (.node (.single ⟨25664,25728,17792,17856⟩) (.single ⟨25664,25728,17856,17920⟩)) (.node (.single ⟨25728,25856,17664,17792⟩) (.single ⟨25728,25856,17792,17920⟩))))))
def output52 : Fin 28 → GridBox := outputData52.get
def coverData52 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData52 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover52 (i : Fin 28) : Fin 28 := ⟨coverData52.get i % 28, Nat.mod_lt _ (by decide)⟩
def source52 (i : Fin 28) : Fin 28 := ⟨sourceData52.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree52 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 .empty (.cutY 14336 .empty (.cutX 7168 (.cutY 15360 (.cutX 6656 .empty (.cutY 14848 .empty (.cutX 6912 .empty (.cutY 15104 (.cutX 7040 (.cutY 14976 .full .full) (.cutY 14976 (.cutX 7104 (.cutY 14912 .full .full) (.cutY 14912 .full .full)) .full)) .empty)))) .empty) .empty)))))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 .empty (.cutY 6144 .empty (.cutX 15360 (.cutY 7168 (.cutX 14848 .empty (.cutY 6656 .empty (.cutX 15104 (.cutY 6912 .empty (.cutX 14976 (.cutY 7040 .full (.cutX 14912 (.cutY 7104 .full .full) (.cutY 7104 .full .full))) (.cutY 7040 .full .full))) .empty))) .empty) .empty))))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 (.cutY 26624 (.cutX 17408 .empty (.cutY 25600 .empty (.cutX 17920 (.cutY 26112 (.cutX 17664 .empty (.cutY 25856 (.cutX 17792 (.cutY 25728 .full .full) (.cutY 25728 (.cutX 17856 (.cutY 25664 .full .full) (.cutY 25664 .full .full)) .full)) .empty)) .empty) .empty))) .empty) .empty) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 (.cutY 18432 (.cutX 25600 .empty (.cutY 17408 .empty (.cutX 26112 (.cutY 17920 (.cutX 25856 (.cutY 17664 .empty (.cutX 25728 (.cutY 17792 .full (.cutX 25664 (.cutY 17856 .full .full) (.cutY 17856 .full .full))) (.cutY 17792 .full .full))) .empty) .empty) .empty))) .empty) .empty) .empty) .empty) .empty))))

theorem metadata52 : 0<69455300 ∧ 27<128 ∧ 58<128 ∧ 1<4 ∧
    6945/4160=1 ∧ 6945%4160=2785 ∧ ∀ i, (leaves52 i).Valid 8 := by
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

noncomputable def phaseMass52 : ℝ := singlePhaseMass (69455300/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw52 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass52_eq : phaseMass52 = (694553/16384000000 : ℝ) := by
  unfold phaseMass52
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw52 output52 cover52 source52
    (gridTreeUnionCheck_sound 32768 raw52 output52 cover52 source52 tree52 checked52)
    _ (by norm_num) _, areaUnits52]
  norm_num

-- Frozen phase 3949, atom 6193, type 1, source (18,53).
def leavesData53 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves53 : Fin 7 → DyadicLeaf := leavesData53.get
def raw53 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 18 53 leaves53 i
def outputData53 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨4608,4736,13568,13696⟩) (.node (.single ⟨4608,4736,13696,13824⟩) (.single ⟨4736,4800,13568,13632⟩))) (.node (.node (.single ⟨4736,4800,13632,13696⟩) (.single ⟨4800,4864,13568,13632⟩)) (.node (.single ⟨4800,4864,13632,13696⟩) (.single ⟨4736,4864,13696,13824⟩)))) (.node (.node (.single ⟨13568,13696,4608,4736⟩) (.node (.single ⟨13568,13632,4736,4800⟩) (.single ⟨13568,13632,4800,4864⟩))) (.node (.node (.single ⟨13632,13696,4736,4800⟩) (.single ⟨13632,13696,4800,4864⟩)) (.node (.single ⟨13696,13824,4608,4736⟩) (.single ⟨13696,13824,4736,4864⟩))))) (.node (.node (.node (.single ⟨18944,19072,27904,28032⟩) (.node (.single ⟨18944,19072,28032,28160⟩) (.single ⟨19072,19136,27904,27968⟩))) (.node (.node (.single ⟨19072,19136,27968,28032⟩) (.single ⟨19136,19200,27904,27968⟩)) (.node (.single ⟨19136,19200,27968,28032⟩) (.single ⟨19072,19200,28032,28160⟩)))) (.node (.node (.single ⟨27904,28032,18944,19072⟩) (.node (.single ⟨27904,27968,19072,19136⟩) (.single ⟨27904,27968,19136,19200⟩))) (.node (.node (.single ⟨27968,28032,19072,19136⟩) (.single ⟨27968,28032,19136,19200⟩)) (.node (.single ⟨28032,28160,18944,19072⟩) (.single ⟨28032,28160,19072,19200⟩))))))
def output53 : Fin 28 → GridBox := outputData53.get
def coverData53 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData53 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover53 (i : Fin 28) : Fin 28 := ⟨coverData53.get i % 28, Nat.mod_lt _ (by decide)⟩
def source53 (i : Fin 28) : Fin 28 := ⟨sourceData53.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree53 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 (.cutY 14336 (.cutX 5120 (.cutY 13312 .empty (.cutX 4608 .empty (.cutY 13824 (.cutX 4864 (.cutY 13568 .empty (.cutX 4736 (.cutY 13696 .full .full) (.cutY 13696 (.cutX 4800 (.cutY 13632 .full .full) (.cutY 13632 .full .full)) .full))) .empty) .empty))) .empty) .empty) .empty)))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 (.cutY 6144 (.cutX 13312 .empty (.cutY 5120 (.cutX 13824 (.cutY 4608 .empty (.cutX 13568 .empty (.cutY 4864 (.cutX 13696 (.cutY 4736 .full (.cutX 13632 (.cutY 4800 .full .full) (.cutY 4800 .full .full))) (.cutY 4736 .full .full)) .empty))) .empty) .empty)) .empty) .empty))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 .empty (.cutY 26624 .empty (.cutX 19456 (.cutY 27648 .empty (.cutX 18944 .empty (.cutY 28160 (.cutX 19200 (.cutY 27904 .empty (.cutX 19072 (.cutY 28032 .full .full) (.cutY 28032 (.cutX 19136 (.cutY 27968 .full .full) (.cutY 27968 .full .full)) .full))) .empty) .empty))) .empty))) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 .empty (.cutY 18432 .empty (.cutX 27648 .empty (.cutY 19456 (.cutX 28160 (.cutY 18944 .empty (.cutX 27904 .empty (.cutY 19200 (.cutX 28032 (.cutY 19072 .full (.cutX 27968 (.cutY 19136 .full .full) (.cutY 19136 .full .full))) (.cutY 19072 .full .full)) .empty))) .empty) .empty)))) .empty) .empty) .empty))))

theorem metadata53 : 0<199204038 ∧ 18<128 ∧ 53<128 ∧ 1<4 ∧
    6193/4160=1 ∧ 6193%4160=2033 ∧ ∀ i, (leaves53 i).Valid 8 := by
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

noncomputable def phaseMass53 : ℝ := singlePhaseMass (199204038/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw53 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass53_eq : phaseMass53 = (99602019/819200000000 : ℝ) := by
  unfold phaseMass53
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw53 output53 cover53 source53
    (gridTreeUnionCheck_sound 32768 raw53 output53 cover53 source53 tree53 checked53)
    _ (by norm_num) _, areaUnits53]
  norm_num

-- Frozen phase 3950, atom 4704, type 1, source (4,48).
def leavesData54 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves54 : Fin 7 → DyadicLeaf := leavesData54.get
def raw54 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 4 48 leaves54 i
def outputData54 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨1024,1152,12288,12416⟩) (.node (.single ⟨1024,1152,12416,12544⟩) (.single ⟨1152,1216,12288,12352⟩))) (.node (.node (.single ⟨1152,1216,12352,12416⟩) (.single ⟨1216,1280,12288,12352⟩)) (.node (.single ⟨1216,1280,12352,12416⟩) (.single ⟨1152,1280,12416,12544⟩)))) (.node (.node (.single ⟨12288,12416,1024,1152⟩) (.node (.single ⟨12288,12352,1152,1216⟩) (.single ⟨12288,12352,1216,1280⟩))) (.node (.node (.single ⟨12352,12416,1152,1216⟩) (.single ⟨12352,12416,1216,1280⟩)) (.node (.single ⟨12416,12544,1024,1152⟩) (.single ⟨12416,12544,1152,1280⟩))))) (.node (.node (.node (.single ⟨20224,20352,31488,31616⟩) (.node (.single ⟨20224,20352,31616,31744⟩) (.single ⟨20352,20416,31488,31552⟩))) (.node (.node (.single ⟨20352,20416,31552,31616⟩) (.single ⟨20416,20480,31488,31552⟩)) (.node (.single ⟨20416,20480,31552,31616⟩) (.single ⟨20352,20480,31616,31744⟩)))) (.node (.node (.single ⟨31488,31616,20224,20352⟩) (.node (.single ⟨31488,31552,20352,20416⟩) (.single ⟨31488,31552,20416,20480⟩))) (.node (.node (.single ⟨31552,31616,20352,20416⟩) (.single ⟨31552,31616,20416,20480⟩)) (.node (.single ⟨31616,31744,20224,20352⟩) (.single ⟨31616,31744,20352,20480⟩))))))
def output54 : Fin 28 → GridBox := outputData54.get
def coverData54 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData54 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover54 (i : Fin 28) : Fin 28 := ⟨coverData54.get i % 28, Nat.mod_lt _ (by decide)⟩
def source54 (i : Fin 28) : Fin 28 := ⟨sourceData54.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree54 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 (.cutX 1024 .empty (.cutY 13312 (.cutX 1536 (.cutY 12800 (.cutX 1280 (.cutY 12544 (.cutX 1152 (.cutY 12416 .full .full) (.cutY 12416 (.cutX 1216 (.cutY 12352 .full .full) (.cutY 12352 .full .full)) .full)) .empty) .empty) .empty) .empty) .empty)) .empty) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 (.cutY 2048 (.cutX 13312 (.cutY 1024 .empty (.cutX 12800 (.cutY 1536 (.cutX 12544 (.cutY 1280 (.cutX 12416 (.cutY 1152 .full (.cutX 12352 (.cutY 1216 .full .full) (.cutY 1216 .full .full))) (.cutY 1152 .full .full)) .empty) .empty) .empty) .empty)) .empty) .empty) .empty) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 .empty (.cutY 30720 .empty (.cutX 19456 .empty (.cutY 31744 (.cutX 19968 .empty (.cutY 31232 .empty (.cutX 20224 .empty (.cutY 31488 .empty (.cutX 20352 (.cutY 31616 .full .full) (.cutY 31616 (.cutX 20416 (.cutY 31552 .full .full) (.cutY 31552 .full .full)) .full)))))) .empty))))) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 .empty (.cutX 31744 (.cutY 19456 .empty (.cutX 31232 .empty (.cutY 19968 .empty (.cutX 31488 .empty (.cutY 20224 .empty (.cutX 31616 (.cutY 20352 .full (.cutX 31552 (.cutY 20416 .full .full) (.cutY 20416 .full .full))) (.cutY 20352 .full .full))))))) .empty))) .empty)) .empty))))

theorem metadata54 : 0<234882010 ∧ 4<128 ∧ 48<128 ∧ 1<4 ∧
    4704/4160=1 ∧ 4704%4160=544 ∧ ∀ i, (leaves54 i).Valid 8 := by
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

noncomputable def phaseMass54 : ℝ := singlePhaseMass (234882010/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw54 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass54_eq : phaseMass54 = (23488201/163840000000 : ℝ) := by
  unfold phaseMass54
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw54 output54 cover54 source54
    (gridTreeUnionCheck_sound 32768 raw54 output54 cover54 source54 tree54 checked54)
    _ (by norm_num) _, areaUnits54]
  norm_num

-- Frozen phase 3951, atom 4207, type 1, source (0,47).
def leavesData55 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves55 : Fin 7 → DyadicLeaf := leavesData55.get
def raw55 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 0 47 leaves55 i
def outputData55 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨0,128,12032,12160⟩) (.node (.single ⟨0,128,12160,12288⟩) (.single ⟨128,192,12032,12096⟩))) (.node (.node (.single ⟨128,192,12096,12160⟩) (.single ⟨192,256,12032,12096⟩)) (.node (.single ⟨192,256,12096,12160⟩) (.single ⟨128,256,12160,12288⟩)))) (.node (.node (.single ⟨12032,12160,0,128⟩) (.node (.single ⟨12032,12096,128,192⟩) (.single ⟨12032,12096,192,256⟩))) (.node (.node (.single ⟨12096,12160,128,192⟩) (.single ⟨12096,12160,192,256⟩)) (.node (.single ⟨12160,12288,0,128⟩) (.single ⟨12160,12288,128,256⟩))))) (.node (.node (.node (.single ⟨20480,20608,32512,32640⟩) (.node (.single ⟨20480,20608,32640,32768⟩) (.single ⟨20608,20672,32512,32576⟩))) (.node (.node (.single ⟨20608,20672,32576,32640⟩) (.single ⟨20672,20736,32512,32576⟩)) (.node (.single ⟨20672,20736,32576,32640⟩) (.single ⟨20608,20736,32640,32768⟩)))) (.node (.node (.single ⟨32512,32640,20480,20608⟩) (.node (.single ⟨32512,32576,20608,20672⟩) (.single ⟨32512,32576,20672,20736⟩))) (.node (.node (.single ⟨32576,32640,20608,20672⟩) (.single ⟨32576,32640,20672,20736⟩)) (.node (.single ⟨32640,32768,20480,20608⟩) (.single ⟨32640,32768,20608,20736⟩))))))
def output55 : Fin 28 → GridBox := outputData55.get
def coverData55 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData55 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover55 (i : Fin 28) : Fin 28 := ⟨coverData55.get i % 28, Nat.mod_lt _ (by decide)⟩
def source55 (i : Fin 28) : Fin 28 := ⟨sourceData55.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree55 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 (.cutX 2048 (.cutY 10240 .empty (.cutX 1024 (.cutY 11264 .empty (.cutX 512 (.cutY 11776 .empty (.cutX 256 (.cutY 12032 .empty (.cutX 128 (.cutY 12160 .full .full) (.cutY 12160 (.cutX 192 (.cutY 12096 .full .full) (.cutY 12096 .full .full)) .full))) .empty)) .empty)) .empty)) .empty) .empty) .empty)) (.cutY 8192 (.cutX 12288 (.cutY 4096 (.cutX 10240 .empty (.cutY 2048 (.cutX 11264 .empty (.cutY 1024 (.cutX 11776 .empty (.cutY 512 (.cutX 12032 .empty (.cutY 256 (.cutX 12160 (.cutY 128 .full (.cutX 12096 (.cutY 192 .full .full) (.cutY 192 .full .full))) (.cutY 128 .full .full)) .empty)) .empty)) .empty)) .empty)) .empty) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 .empty (.cutX 22528 (.cutY 30720 .empty (.cutX 21504 (.cutY 31744 .empty (.cutX 20992 (.cutY 32256 .empty (.cutX 20736 (.cutY 32512 .empty (.cutX 20608 (.cutY 32640 .full .full) (.cutY 32640 (.cutX 20672 (.cutY 32576 .full .full) (.cutY 32576 .full .full)) .full))) .empty)) .empty)) .empty)) .empty)))) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 .empty (.cutX 30720 .empty (.cutY 22528 (.cutX 31744 .empty (.cutY 21504 (.cutX 32256 .empty (.cutY 20992 (.cutX 32512 .empty (.cutY 20736 (.cutX 32640 (.cutY 20608 .full (.cutX 32576 (.cutY 20672 .full .full) (.cutY 20672 .full .full))) (.cutY 20608 .full .full)) .empty)) .empty)) .empty)) .empty)))) .empty))))

theorem metadata55 : 0<420122755 ∧ 0<128 ∧ 47<128 ∧ 1<4 ∧
    4207/4160=1 ∧ 4207%4160=47 ∧ ∀ i, (leaves55 i).Valid 8 := by
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

noncomputable def phaseMass55 : ℝ := singlePhaseMass (420122755/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw55 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass55_eq : phaseMass55 = (84024551/327680000000 : ℝ) := by
  unfold phaseMass55
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw55 output55 cover55 source55
    (gridTreeUnionCheck_sound 32768 raw55 output55 cover55 source55 tree55 checked55)
    _ (by norm_num) _, areaUnits55]
  norm_num

-- Frozen phase 3952, atom 3381, type 0, source (36,69).
def leavesData56 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves56 : Fin 4 → DyadicLeaf := leavesData56.get
def raw56 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 36 69 leaves56 i
def outputData56 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨9216,9344,17664,17792⟩) (.single ⟨9216,9344,17792,17920⟩)) (.node (.single ⟨9344,9472,17664,17792⟩) (.single ⟨9344,9472,17792,17920⟩))) (.node (.node (.single ⟨14848,14976,23296,23424⟩) (.single ⟨14848,14976,23424,23552⟩)) (.node (.single ⟨14976,15104,23296,23424⟩) (.single ⟨14976,15104,23424,23552⟩)))) (.node (.node (.node (.single ⟨17664,17792,9216,9344⟩) (.single ⟨17664,17792,9344,9472⟩)) (.node (.single ⟨17792,17920,9216,9344⟩) (.single ⟨17792,17920,9344,9472⟩))) (.node (.node (.single ⟨23296,23424,14848,14976⟩) (.single ⟨23296,23424,14976,15104⟩)) (.node (.single ⟨23424,23552,14848,14976⟩) (.single ⟨23424,23552,14976,15104⟩)))))
def output56 : Fin 16 → GridBox := outputData56.get
def coverData56 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData56 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover56 (i : Fin 16) : Fin 16 := ⟨coverData56.get i % 16, Nat.mod_lt _ (by decide)⟩
def source56 (i : Fin 16) : Fin 16 := ⟨sourceData56.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree56 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 (.cutY 18432 (.cutX 9216 .empty (.cutY 17408 .empty (.cutX 9728 (.cutY 17920 (.cutX 9472 (.cutY 17664 .empty (.cutX 9344 (.cutY 17792 .full .full) (.cutY 17792 .full .full))) .empty) .empty) .empty))) .empty) .empty) .empty) (.cutY 20480 .empty (.cutX 14336 .empty (.cutY 22528 .empty (.cutX 15360 (.cutY 23552 (.cutX 14848 .empty (.cutY 23040 .empty (.cutX 15104 (.cutY 23296 .empty (.cutX 14976 (.cutY 23424 .full .full) (.cutY 23424 .full .full))) .empty))) .empty) .empty))))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 (.cutY 10240 (.cutX 17408 .empty (.cutY 9216 .empty (.cutX 17920 (.cutY 9728 (.cutX 17664 .empty (.cutY 9472 (.cutX 17792 (.cutY 9344 .full .full) (.cutY 9344 .full .full)) .empty)) .empty) .empty))) .empty) .empty) .empty) (.cutY 12288 .empty (.cutX 22528 .empty (.cutY 14336 .empty (.cutX 23552 (.cutY 15360 (.cutX 23040 .empty (.cutY 14848 .empty (.cutX 23296 .empty (.cutY 15104 (.cutX 23424 (.cutY 14976 .full .full) (.cutY 14976 .full .full)) .empty)))) .empty) .empty)))))) .empty) .empty))

theorem metadata56 : 0<167572778 ∧ 36<128 ∧ 69<128 ∧ 0<4 ∧
    3381/4160=0 ∧ 3381%4160=3381 ∧ ∀ i, (leaves56 i).Valid 8 := by
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

noncomputable def phaseMass56 : ℝ := singlePhaseMass (167572778/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw56 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass56_eq : phaseMass56 = (83786389/819200000000 : ℝ) := by
  unfold phaseMass56
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw56 output56 cover56 source56
    (gridTreeUnionCheck_sound 32768 raw56 output56 cover56 source56 tree56 checked56)
    _ (by norm_num) _, areaUnits56]
  norm_num

-- Frozen phase 3953, atom 2036, type 0, source (18,56).
def leavesData57 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves57 : Fin 4 → DyadicLeaf := leavesData57.get
def raw57 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 18 56 leaves57 i
def outputData57 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨4608,4736,14336,14464⟩) (.single ⟨4608,4736,14464,14592⟩)) (.node (.single ⟨4736,4864,14336,14464⟩) (.single ⟨4736,4864,14464,14592⟩))) (.node (.node (.single ⟨14336,14464,4608,4736⟩) (.single ⟨14336,14464,4736,4864⟩)) (.node (.single ⟨14464,14592,4608,4736⟩) (.single ⟨14464,14592,4736,4864⟩)))) (.node (.node (.node (.single ⟨18176,18304,27904,28032⟩) (.single ⟨18176,18304,28032,28160⟩)) (.node (.single ⟨18304,18432,27904,28032⟩) (.single ⟨18304,18432,28032,28160⟩))) (.node (.node (.single ⟨27904,28032,18176,18304⟩) (.single ⟨27904,28032,18304,18432⟩)) (.node (.single ⟨28032,28160,18176,18304⟩) (.single ⟨28032,28160,18304,18432⟩)))))
def output57 : Fin 16 → GridBox := outputData57.get
def coverData57 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData57 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover57 (i : Fin 16) : Fin 16 := ⟨coverData57.get i % 16, Nat.mod_lt _ (by decide)⟩
def source57 (i : Fin 16) : Fin 16 := ⟨sourceData57.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree57 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 (.cutY 14336 .empty (.cutX 5120 (.cutY 15360 (.cutX 4608 .empty (.cutY 14848 (.cutX 4864 (.cutY 14592 (.cutX 4736 (.cutY 14464 .full .full) (.cutY 14464 .full .full)) .empty) .empty) .empty)) .empty) .empty)) .empty)))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 .empty (.cutY 6144 (.cutX 15360 (.cutY 5120 (.cutX 14848 (.cutY 4608 .empty (.cutX 14592 (.cutY 4864 (.cutX 14464 (.cutY 4736 .full .full) (.cutY 4736 .full .full)) .empty) .empty)) .empty) .empty) .empty) .empty)))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 (.cutY 26624 .empty (.cutX 17408 .empty (.cutY 27648 .empty (.cutX 17920 .empty (.cutY 28160 (.cutX 18176 .empty (.cutY 27904 .empty (.cutX 18304 (.cutY 28032 .full .full) (.cutY 28032 .full .full)))) .empty))))) .empty) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 .empty (.cutY 18432 (.cutX 27648 .empty (.cutY 17408 .empty (.cutX 28160 (.cutY 17920 .empty (.cutX 27904 .empty (.cutY 18176 .empty (.cutX 28032 (.cutY 18304 .full .full) (.cutY 18304 .full .full))))) .empty))) .empty)) .empty) .empty) .empty))))

theorem metadata57 : 0<185830537 ∧ 18<128 ∧ 56<128 ∧ 0<4 ∧
    2036/4160=0 ∧ 2036%4160=2036 ∧ ∀ i, (leaves57 i).Valid 8 := by
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

noncomputable def phaseMass57 : ℝ := singlePhaseMass (185830537/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw57 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass57_eq : phaseMass57 = (185830537/1638400000000 : ℝ) := by
  unfold phaseMass57
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw57 output57 cover57 source57
    (gridTreeUnionCheck_sound 32768 raw57 output57 cover57 source57 tree57 checked57)
    _ (by norm_num) _, areaUnits57]
  norm_num

-- Frozen phase 3954, atom 1232, type 0, source (10,52).
def leavesData58 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves58 : Fin 4 → DyadicLeaf := leavesData58.get
def raw58 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 10 52 leaves58 i
def outputData58 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨2560,2688,13312,13440⟩) (.single ⟨2560,2688,13440,13568⟩)) (.node (.single ⟨2688,2816,13312,13440⟩) (.single ⟨2688,2816,13440,13568⟩))) (.node (.node (.single ⟨13312,13440,2560,2688⟩) (.single ⟨13312,13440,2688,2816⟩)) (.node (.single ⟨13440,13568,2560,2688⟩) (.single ⟨13440,13568,2688,2816⟩)))) (.node (.node (.node (.single ⟨19200,19328,29952,30080⟩) (.single ⟨19200,19328,30080,30208⟩)) (.node (.single ⟨19328,19456,29952,30080⟩) (.single ⟨19328,19456,30080,30208⟩))) (.node (.node (.single ⟨29952,30080,19200,19328⟩) (.single ⟨29952,30080,19328,19456⟩)) (.node (.single ⟨30080,30208,19200,19328⟩) (.single ⟨30080,30208,19328,19456⟩)))))
def output58 : Fin 16 → GridBox := outputData58.get
def coverData58 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData58 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover58 (i : Fin 16) : Fin 16 := ⟨coverData58.get i % 16, Nat.mod_lt _ (by decide)⟩
def source58 (i : Fin 16) : Fin 16 := ⟨sourceData58.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree58 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 (.cutX 3072 (.cutY 13312 .empty (.cutX 2560 .empty (.cutY 13824 (.cutX 2816 (.cutY 13568 (.cutX 2688 (.cutY 13440 .full .full) (.cutY 13440 .full .full)) .empty) .empty) .empty))) .empty) .empty))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 (.cutY 2048 .empty (.cutX 13312 .empty (.cutY 3072 (.cutX 13824 (.cutY 2560 .empty (.cutX 13568 (.cutY 2816 (.cutX 13440 (.cutY 2688 .full .full) (.cutY 2688 .full .full)) .empty) .empty)) .empty) .empty))) .empty) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 .empty (.cutY 30720 (.cutX 19456 (.cutY 29696 .empty (.cutX 18944 .empty (.cutY 30208 (.cutX 19200 .empty (.cutY 29952 .empty (.cutX 19328 (.cutY 30080 .full .full) (.cutY 30080 .full .full)))) .empty))) .empty) .empty))) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 .empty (.cutX 29696 .empty (.cutY 19456 (.cutX 30208 (.cutY 18944 .empty (.cutX 29952 .empty (.cutY 19200 .empty (.cutX 30080 (.cutY 19328 .full .full) (.cutY 19328 .full .full))))) .empty) .empty))) .empty) .empty)) .empty))))

theorem metadata58 : 0<206808448 ∧ 10<128 ∧ 52<128 ∧ 0<4 ∧
    1232/4160=0 ∧ 1232%4160=1232 ∧ ∀ i, (leaves58 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData58).mp
    (by decide +kernel)

theorem sourceChecked58_0 : ∀ i : Fin 16,
    (fun i => output58 i = raw58 (source58 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked58 : ∀ i : Fin 16, (fun i => output58 i = raw58 (source58 i)) i :=
  forallFin_of_zero_offset (fun i => output58 i = raw58 (source58 i)) sourceChecked58_0

theorem coverChecked58_0 : ∀ i : Fin 16,
    (fun i => (output58 (cover58 i)).ContainsBox (raw58 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked58 : ∀ i : Fin 16, (fun i => (output58 (cover58 i)).ContainsBox (raw58 i)) i :=
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

noncomputable def phaseMass58 : ℝ := singlePhaseMass (206808448/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw58 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass58_eq : phaseMass58 = (1615691/12800000000 : ℝ) := by
  unfold phaseMass58
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw58 output58 cover58 source58
    (gridTreeUnionCheck_sound 32768 raw58 output58 cover58 source58 tree58 checked58)
    _ (by norm_num) _, areaUnits58]
  norm_num

-- Frozen phase 3955, atom 898, type 0, source (7,51).
def leavesData59 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves59 : Fin 4 → DyadicLeaf := leavesData59.get
def raw59 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 7 51 leaves59 i
def outputData59 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨1792,1920,13056,13184⟩) (.single ⟨1792,1920,13184,13312⟩)) (.node (.single ⟨1920,2048,13056,13184⟩) (.single ⟨1920,2048,13184,13312⟩))) (.node (.node (.single ⟨13056,13184,1792,1920⟩) (.single ⟨13056,13184,1920,2048⟩)) (.node (.single ⟨13184,13312,1792,1920⟩) (.single ⟨13184,13312,1920,2048⟩)))) (.node (.node (.node (.single ⟨19456,19584,30720,30848⟩) (.single ⟨19456,19584,30848,30976⟩)) (.node (.single ⟨19584,19712,30720,30848⟩) (.single ⟨19584,19712,30848,30976⟩))) (.node (.node (.single ⟨30720,30848,19456,19584⟩) (.single ⟨30720,30848,19584,19712⟩)) (.node (.single ⟨30848,30976,19456,19584⟩) (.single ⟨30848,30976,19584,19712⟩)))))
def output59 : Fin 16 → GridBox := outputData59.get
def coverData59 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData59 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover59 (i : Fin 16) : Fin 16 := ⟨coverData59.get i % 16, Nat.mod_lt _ (by decide)⟩
def source59 (i : Fin 16) : Fin 16 := ⟨sourceData59.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree59 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 (.cutX 1024 .empty (.cutY 13312 (.cutX 1536 .empty (.cutY 12800 .empty (.cutX 1792 .empty (.cutY 13056 .empty (.cutX 1920 (.cutY 13184 .full .full) (.cutY 13184 .full .full)))))) .empty)) .empty) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 (.cutY 2048 (.cutX 13312 (.cutY 1024 .empty (.cutX 12800 .empty (.cutY 1536 .empty (.cutX 13056 .empty (.cutY 1792 .empty (.cutX 13184 (.cutY 1920 .full .full) (.cutY 1920 .full .full))))))) .empty) .empty) .empty) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 .empty (.cutY 30720 .empty (.cutX 19456 .empty (.cutY 31744 (.cutX 19968 (.cutY 31232 (.cutX 19712 (.cutY 30976 (.cutX 19584 (.cutY 30848 .full .full) (.cutY 30848 .full .full)) .empty) .empty) .empty) .empty) .empty))))) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 .empty (.cutX 31744 (.cutY 19456 .empty (.cutX 31232 (.cutY 19968 (.cutX 30976 (.cutY 19712 (.cutX 30848 (.cutY 19584 .full .full) (.cutY 19584 .full .full)) .empty) .empty) .empty) .empty)) .empty))) .empty)) .empty))))

theorem metadata59 : 0<214747992 ∧ 7<128 ∧ 51<128 ∧ 0<4 ∧
    898/4160=0 ∧ 898%4160=898 ∧ ∀ i, (leaves59 i).Valid 8 := by
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

noncomputable def phaseMass59 : ℝ := singlePhaseMass (214747992/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw59 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass59_eq : phaseMass59 = (26843499/204800000000 : ℝ) := by
  unfold phaseMass59
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw59 output59 cover59 source59
    (gridTreeUnionCheck_sound 32768 raw59 output59 cover59 source59 tree59 checked59)
    _ (by norm_num) _, areaUnits59]
  norm_num

-- Frozen phase 3956, atom 425, type 0, source (3,50).
def leavesData60 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves60 : Fin 4 → DyadicLeaf := leavesData60.get
def raw60 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 3 50 leaves60 i
def outputData60 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨768,896,12800,12928⟩) (.single ⟨768,896,12928,13056⟩)) (.node (.single ⟨896,1024,12800,12928⟩) (.single ⟨896,1024,12928,13056⟩))) (.node (.node (.single ⟨12800,12928,768,896⟩) (.single ⟨12800,12928,896,1024⟩)) (.node (.single ⟨12928,13056,768,896⟩) (.single ⟨12928,13056,896,1024⟩)))) (.node (.node (.node (.single ⟨19712,19840,31744,31872⟩) (.single ⟨19712,19840,31872,32000⟩)) (.node (.single ⟨19840,19968,31744,31872⟩) (.single ⟨19840,19968,31872,32000⟩))) (.node (.node (.single ⟨31744,31872,19712,19840⟩) (.single ⟨31744,31872,19840,19968⟩)) (.node (.single ⟨31872,32000,19712,19840⟩) (.single ⟨31872,32000,19840,19968⟩)))))
def output60 : Fin 16 → GridBox := outputData60.get
def coverData60 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData60 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover60 (i : Fin 16) : Fin 16 := ⟨coverData60.get i % 16, Nat.mod_lt _ (by decide)⟩
def source60 (i : Fin 16) : Fin 16 := ⟨sourceData60.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree60 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 (.cutX 1024 (.cutY 13312 (.cutX 512 .empty (.cutY 12800 .empty (.cutX 768 .empty (.cutY 13056 (.cutX 896 (.cutY 12928 .full .full) (.cutY 12928 .full .full)) .empty)))) .empty) .empty) .empty) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 (.cutY 2048 (.cutX 13312 (.cutY 1024 (.cutX 12800 .empty (.cutY 512 .empty (.cutX 13056 (.cutY 768 .empty (.cutX 12928 (.cutY 896 .full .full) (.cutY 896 .full .full))) .empty))) .empty) .empty) .empty) .empty) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 .empty (.cutY 30720 .empty (.cutX 19456 .empty (.cutY 31744 .empty (.cutX 19968 (.cutY 32256 (.cutX 19712 .empty (.cutY 32000 (.cutX 19840 (.cutY 31872 .full .full) (.cutY 31872 .full .full)) .empty)) .empty) .empty)))))) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 .empty (.cutX 31744 .empty (.cutY 19456 .empty (.cutX 32256 (.cutY 19968 (.cutX 32000 (.cutY 19712 .empty (.cutX 31872 (.cutY 19840 .full .full) (.cutY 19840 .full .full))) .empty) .empty) .empty))))) .empty)) .empty))))

theorem metadata60 : 0<214747992 ∧ 3<128 ∧ 50<128 ∧ 0<4 ∧
    425/4160=0 ∧ 425%4160=425 ∧ ∀ i, (leaves60 i).Valid 8 := by
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

noncomputable def phaseMass60 : ℝ := singlePhaseMass (214747992/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw60 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass60_eq : phaseMass60 = (26843499/204800000000 : ℝ) := by
  unfold phaseMass60
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw60 output60 cover60 source60
    (gridTreeUnionCheck_sound 32768 raw60 output60 cover60 source60 tree60 checked60)
    _ (by norm_num) _, areaUnits60]
  norm_num

-- Frozen phase 3957, atom 7420, type 1, source (34,64).
def leavesData61 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves61 : Fin 7 → DyadicLeaf := leavesData61.get
def raw61 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 34 64 leaves61 i
def outputData61 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨8704,8832,16384,16512⟩) (.node (.single ⟨8704,8832,16512,16640⟩) (.single ⟨8832,8896,16384,16448⟩))) (.node (.node (.single ⟨8832,8896,16448,16512⟩) (.single ⟨8896,8960,16384,16448⟩)) (.node (.single ⟨8896,8960,16448,16512⟩) (.single ⟨8832,8960,16512,16640⟩)))) (.node (.node (.single ⟨16128,16256,23808,23936⟩) (.node (.single ⟨16128,16256,23936,24064⟩) (.single ⟨16256,16320,23808,23872⟩))) (.node (.node (.single ⟨16256,16320,23872,23936⟩) (.single ⟨16320,16384,23808,23872⟩)) (.node (.single ⟨16320,16384,23872,23936⟩) (.single ⟨16256,16384,23936,24064⟩))))) (.node (.node (.node (.single ⟨16384,16512,8704,8832⟩) (.node (.single ⟨16384,16448,8832,8896⟩) (.single ⟨16384,16448,8896,8960⟩))) (.node (.node (.single ⟨16448,16512,8832,8896⟩) (.single ⟨16448,16512,8896,8960⟩)) (.node (.single ⟨16512,16640,8704,8832⟩) (.single ⟨16512,16640,8832,8960⟩)))) (.node (.node (.single ⟨23808,23936,16128,16256⟩) (.node (.single ⟨23808,23872,16256,16320⟩) (.single ⟨23808,23872,16320,16384⟩))) (.node (.node (.single ⟨23872,23936,16256,16320⟩) (.single ⟨23872,23936,16320,16384⟩)) (.node (.single ⟨23936,24064,16128,16256⟩) (.single ⟨23936,24064,16256,16384⟩))))))
def output61 : Fin 28 → GridBox := outputData61.get
def coverData61 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData61 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover61 (i : Fin 28) : Fin 28 := ⟨coverData61.get i % 28, Nat.mod_lt _ (by decide)⟩
def source61 (i : Fin 28) : Fin 28 := ⟨sourceData61.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree61 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 (.cutY 18432 (.cutX 9216 (.cutY 17408 (.cutX 8704 .empty (.cutY 16896 (.cutX 8960 (.cutY 16640 (.cutX 8832 (.cutY 16512 .full .full) (.cutY 16512 (.cutX 8896 (.cutY 16448 .full .full) (.cutY 16448 .full .full)) .full)) .empty) .empty) .empty)) .empty) .empty) .empty) .empty) .empty) (.cutY 20480 .empty (.cutX 14336 .empty (.cutY 22528 .empty (.cutX 15360 .empty (.cutY 23552 .empty (.cutX 15872 .empty (.cutY 24064 (.cutX 16128 .empty (.cutY 23808 .empty (.cutX 16256 (.cutY 23936 .full .full) (.cutY 23936 (.cutX 16320 (.cutY 23872 .full .full) (.cutY 23872 .full .full)) .full)))) .empty)))))))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 (.cutY 10240 (.cutX 17408 (.cutY 9216 (.cutX 16896 (.cutY 8704 .empty (.cutX 16640 (.cutY 8960 (.cutX 16512 (.cutY 8832 .full (.cutX 16448 (.cutY 8896 .full .full) (.cutY 8896 .full .full))) (.cutY 8832 .full .full)) .empty) .empty)) .empty) .empty) .empty) .empty) .empty) .empty) (.cutY 12288 .empty (.cutX 22528 .empty (.cutY 14336 .empty (.cutX 23552 .empty (.cutY 15360 .empty (.cutX 24064 (.cutY 15872 .empty (.cutX 23808 .empty (.cutY 16128 .empty (.cutX 23936 (.cutY 16256 .full (.cutX 23872 (.cutY 16320 .full .full) (.cutY 16320 .full .full))) (.cutY 16256 .full .full))))) .empty)))))))) .empty) .empty))

theorem metadata61 : 0<182398684 ∧ 34<128 ∧ 64<128 ∧ 1<4 ∧
    7420/4160=1 ∧ 7420%4160=3260 ∧ ∀ i, (leaves61 i).Valid 8 := by
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

noncomputable def phaseMass61 : ℝ := singlePhaseMass (182398684/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw61 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass61_eq : phaseMass61 = (45599671/409600000000 : ℝ) := by
  unfold phaseMass61
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw61 output61 cover61 source61
    (gridTreeUnionCheck_sound 32768 raw61 output61 cover61 source61 tree61 checked61)
    _ (by norm_num) _, areaUnits61]
  norm_num

-- Frozen phase 3958, atom 7748, type 1, source (40,68).
def leavesData62 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves62 : Fin 7 → DyadicLeaf := leavesData62.get
def raw62 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 40 68 leaves62 i
def outputData62 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨10240,10368,17408,17536⟩) (.node (.single ⟨10240,10368,17536,17664⟩) (.single ⟨10368,10432,17408,17472⟩))) (.node (.node (.single ⟨10368,10432,17472,17536⟩) (.single ⟨10432,10496,17408,17472⟩)) (.node (.single ⟨10432,10496,17472,17536⟩) (.single ⟨10368,10496,17536,17664⟩)))) (.node (.node (.single ⟨15104,15232,22272,22400⟩) (.node (.single ⟨15104,15232,22400,22528⟩) (.single ⟨15232,15296,22272,22336⟩))) (.node (.node (.single ⟨15232,15296,22336,22400⟩) (.single ⟨15296,15360,22272,22336⟩)) (.node (.single ⟨15296,15360,22336,22400⟩) (.single ⟨15232,15360,22400,22528⟩))))) (.node (.node (.node (.single ⟨17408,17536,10240,10368⟩) (.node (.single ⟨17408,17472,10368,10432⟩) (.single ⟨17408,17472,10432,10496⟩))) (.node (.node (.single ⟨17472,17536,10368,10432⟩) (.single ⟨17472,17536,10432,10496⟩)) (.node (.single ⟨17536,17664,10240,10368⟩) (.single ⟨17536,17664,10368,10496⟩)))) (.node (.node (.single ⟨22272,22400,15104,15232⟩) (.node (.single ⟨22272,22336,15232,15296⟩) (.single ⟨22272,22336,15296,15360⟩))) (.node (.node (.single ⟨22336,22400,15232,15296⟩) (.single ⟨22336,22400,15296,15360⟩)) (.node (.single ⟨22400,22528,15104,15232⟩) (.single ⟨22400,22528,15232,15360⟩))))))
def output62 : Fin 28 → GridBox := outputData62.get
def coverData62 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData62 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover62 (i : Fin 28) : Fin 28 := ⟨coverData62.get i % 28, Nat.mod_lt _ (by decide)⟩
def source62 (i : Fin 28) : Fin 28 := ⟨sourceData62.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree62 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 .empty (.cutY 18432 (.cutX 11264 (.cutY 17408 .empty (.cutX 10752 (.cutY 17920 (.cutX 10496 (.cutY 17664 (.cutX 10368 (.cutY 17536 .full .full) (.cutY 17536 (.cutX 10432 (.cutY 17472 .full .full) (.cutY 17472 .full .full)) .full)) .empty) .empty) .empty) .empty)) .empty) .empty)) .empty) (.cutY 20480 .empty (.cutX 14336 .empty (.cutY 22528 (.cutX 15360 (.cutY 21504 .empty (.cutX 14848 .empty (.cutY 22016 .empty (.cutX 15104 .empty (.cutY 22272 .empty (.cutX 15232 (.cutY 22400 .full .full) (.cutY 22400 (.cutX 15296 (.cutY 22336 .full .full) (.cutY 22336 .full .full)) .full))))))) .empty) .empty)))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 (.cutY 10240 .empty (.cutX 17408 .empty (.cutY 11264 (.cutX 17920 (.cutY 10752 (.cutX 17664 (.cutY 10496 (.cutX 17536 (.cutY 10368 .full (.cutX 17472 (.cutY 10432 .full .full) (.cutY 10432 .full .full))) (.cutY 10368 .full .full)) .empty) .empty) .empty) .empty) .empty))) .empty) .empty) (.cutY 12288 .empty (.cutX 22528 (.cutY 14336 .empty (.cutX 21504 .empty (.cutY 15360 (.cutX 22016 .empty (.cutY 14848 .empty (.cutX 22272 .empty (.cutY 15104 .empty (.cutX 22400 (.cutY 15232 .full (.cutX 22336 (.cutY 15296 .full .full) (.cutY 15296 .full .full))) (.cutY 15232 .full .full)))))) .empty))) .empty)))) .empty) .empty))

theorem metadata62 : 0<50021215 ∧ 40<128 ∧ 68<128 ∧ 1<4 ∧
    7748/4160=1 ∧ 7748%4160=3588 ∧ ∀ i, (leaves62 i).Valid 8 := by
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

noncomputable def phaseMass62 : ℝ := singlePhaseMass (50021215/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw62 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass62_eq : phaseMass62 = (10004243/327680000000 : ℝ) := by
  unfold phaseMass62
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw62 output62 cover62 source62
    (gridTreeUnionCheck_sound 32768 raw62 output62 cover62 source62 tree62 checked62)
    _ (by norm_num) _, areaUnits62]
  norm_num

-- Frozen phase 3959, atom 7647, type 1, source (38,67).
def leavesData63 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves63 : Fin 7 → DyadicLeaf := leavesData63.get
def raw63 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 38 67 leaves63 i
def outputData63 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨9728,9856,17152,17280⟩) (.node (.single ⟨9728,9856,17280,17408⟩) (.single ⟨9856,9920,17152,17216⟩))) (.node (.node (.single ⟨9856,9920,17216,17280⟩) (.single ⟨9920,9984,17152,17216⟩)) (.node (.single ⟨9920,9984,17216,17280⟩) (.single ⟨9856,9984,17280,17408⟩)))) (.node (.node (.single ⟨15360,15488,22784,22912⟩) (.node (.single ⟨15360,15488,22912,23040⟩) (.single ⟨15488,15552,22784,22848⟩))) (.node (.node (.single ⟨15488,15552,22848,22912⟩) (.single ⟨15552,15616,22784,22848⟩)) (.node (.single ⟨15552,15616,22848,22912⟩) (.single ⟨15488,15616,22912,23040⟩))))) (.node (.node (.node (.single ⟨17152,17280,9728,9856⟩) (.node (.single ⟨17152,17216,9856,9920⟩) (.single ⟨17152,17216,9920,9984⟩))) (.node (.node (.single ⟨17216,17280,9856,9920⟩) (.single ⟨17216,17280,9920,9984⟩)) (.node (.single ⟨17280,17408,9728,9856⟩) (.single ⟨17280,17408,9856,9984⟩)))) (.node (.node (.single ⟨22784,22912,15360,15488⟩) (.node (.single ⟨22784,22848,15488,15552⟩) (.single ⟨22784,22848,15552,15616⟩))) (.node (.node (.single ⟨22848,22912,15488,15552⟩) (.single ⟨22848,22912,15552,15616⟩)) (.node (.single ⟨22912,23040,15360,15488⟩) (.single ⟨22912,23040,15488,15616⟩))))))
def output63 : Fin 28 → GridBox := outputData63.get
def coverData63 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData63 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover63 (i : Fin 28) : Fin 28 := ⟨coverData63.get i % 28, Nat.mod_lt _ (by decide)⟩
def source63 (i : Fin 28) : Fin 28 := ⟨sourceData63.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree63 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 (.cutY 18432 (.cutX 9216 .empty (.cutY 17408 (.cutX 9728 .empty (.cutY 16896 .empty (.cutX 9984 (.cutY 17152 .empty (.cutX 9856 (.cutY 17280 .full .full) (.cutY 17280 (.cutX 9920 (.cutY 17216 .full .full) (.cutY 17216 .full .full)) .full))) .empty))) .empty)) .empty) .empty) .empty) (.cutY 20480 .empty (.cutX 14336 .empty (.cutY 22528 .empty (.cutX 15360 .empty (.cutY 23552 (.cutX 15872 (.cutY 23040 (.cutX 15616 (.cutY 22784 .empty (.cutX 15488 (.cutY 22912 .full .full) (.cutY 22912 (.cutX 15552 (.cutY 22848 .full .full) (.cutY 22848 .full .full)) .full))) .empty) .empty) .empty) .empty)))))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 (.cutY 10240 (.cutX 17408 (.cutY 9216 .empty (.cutX 16896 .empty (.cutY 9728 .empty (.cutX 17152 .empty (.cutY 9984 (.cutX 17280 (.cutY 9856 .full (.cutX 17216 (.cutY 9920 .full .full) (.cutY 9920 .full .full))) (.cutY 9856 .full .full)) .empty))))) .empty) .empty) .empty) .empty) (.cutY 12288 .empty (.cutX 22528 .empty (.cutY 14336 .empty (.cutX 23552 (.cutY 15360 .empty (.cutX 23040 (.cutY 15872 (.cutX 22784 .empty (.cutY 15616 (.cutX 22912 (.cutY 15488 .full (.cutX 22848 (.cutY 15552 .full .full) (.cutY 15552 .full .full))) (.cutY 15488 .full .full)) .empty)) .empty) .empty)) .empty)))))) .empty) .empty))

theorem metadata63 : 0<182398684 ∧ 38<128 ∧ 67<128 ∧ 1<4 ∧
    7647/4160=1 ∧ 7647%4160=3487 ∧ ∀ i, (leaves63 i).Valid 8 := by
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

noncomputable def phaseMass63 : ℝ := singlePhaseMass (182398684/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw63 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass63_eq : phaseMass63 = (45599671/409600000000 : ℝ) := by
  unfold phaseMass63
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw63 output63 cover63 source63
    (gridTreeUnionCheck_sound 32768 raw63 output63 cover63 source63 tree63 checked63)
    _ (by norm_num) _, areaUnits63]
  norm_num

-- Frozen phase 3960, atom 3437, type 0, source (37,70).
def leavesData64 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves64 : Fin 4 → DyadicLeaf := leavesData64.get
def raw64 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 37 70 leaves64 i
def outputData64 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨9472,9600,17920,18048⟩) (.single ⟨9472,9600,18048,18176⟩)) (.node (.single ⟨9600,9728,17920,18048⟩) (.single ⟨9600,9728,18048,18176⟩))) (.node (.node (.single ⟨14592,14720,23040,23168⟩) (.single ⟨14592,14720,23168,23296⟩)) (.node (.single ⟨14720,14848,23040,23168⟩) (.single ⟨14720,14848,23168,23296⟩)))) (.node (.node (.node (.single ⟨17920,18048,9472,9600⟩) (.single ⟨17920,18048,9600,9728⟩)) (.node (.single ⟨18048,18176,9472,9600⟩) (.single ⟨18048,18176,9600,9728⟩))) (.node (.node (.single ⟨23040,23168,14592,14720⟩) (.single ⟨23040,23168,14720,14848⟩)) (.node (.single ⟨23168,23296,14592,14720⟩) (.single ⟨23168,23296,14720,14848⟩)))))
def output64 : Fin 16 → GridBox := outputData64.get
def coverData64 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData64 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover64 (i : Fin 16) : Fin 16 := ⟨coverData64.get i % 16, Nat.mod_lt _ (by decide)⟩
def source64 (i : Fin 16) : Fin 16 := ⟨sourceData64.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree64 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 (.cutY 18432 (.cutX 9216 .empty (.cutY 17408 .empty (.cutX 9728 (.cutY 17920 .empty (.cutX 9472 .empty (.cutY 18176 (.cutX 9600 (.cutY 18048 .full .full) (.cutY 18048 .full .full)) .empty))) .empty))) .empty) .empty) .empty) (.cutY 20480 .empty (.cutX 14336 .empty (.cutY 22528 .empty (.cutX 15360 (.cutY 23552 (.cutX 14848 (.cutY 23040 .empty (.cutX 14592 .empty (.cutY 23296 (.cutX 14720 (.cutY 23168 .full .full) (.cutY 23168 .full .full)) .empty))) .empty) .empty) .empty))))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 (.cutY 10240 (.cutX 17408 .empty (.cutY 9216 .empty (.cutX 17920 .empty (.cutY 9728 (.cutX 18176 (.cutY 9472 .empty (.cutX 18048 (.cutY 9600 .full .full) (.cutY 9600 .full .full))) .empty) .empty)))) .empty) .empty) .empty) (.cutY 12288 .empty (.cutX 22528 .empty (.cutY 14336 .empty (.cutX 23552 (.cutY 15360 (.cutX 23040 .empty (.cutY 14848 (.cutX 23296 (.cutY 14592 .empty (.cutX 23168 (.cutY 14720 .full .full) (.cutY 14720 .full .full))) .empty) .empty)) .empty) .empty)))))) .empty) .empty))

theorem metadata64 : 0<167572778 ∧ 37<128 ∧ 70<128 ∧ 0<4 ∧
    3437/4160=0 ∧ 3437%4160=3437 ∧ ∀ i, (leaves64 i).Valid 8 := by
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

noncomputable def phaseMass64 : ℝ := singlePhaseMass (167572778/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw64 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass64_eq : phaseMass64 = (83786389/819200000000 : ℝ) := by
  unfold phaseMass64
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw64 output64 cover64 source64
    (gridTreeUnionCheck_sound 32768 raw64 output64 cover64 source64 tree64 checked64)
    _ (by norm_num) _, areaUnits64]
  norm_num

-- Frozen phase 3961, atom 6004, type 1, source (16,52).
def leavesData65 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves65 : Fin 7 → DyadicLeaf := leavesData65.get
def raw65 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 16 52 leaves65 i
def outputData65 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨4096,4224,13312,13440⟩) (.node (.single ⟨4096,4224,13440,13568⟩) (.single ⟨4224,4288,13312,13376⟩))) (.node (.node (.single ⟨4224,4288,13376,13440⟩) (.single ⟨4288,4352,13312,13376⟩)) (.node (.single ⟨4288,4352,13376,13440⟩) (.single ⟨4224,4352,13440,13568⟩)))) (.node (.node (.single ⟨13312,13440,4096,4224⟩) (.node (.single ⟨13312,13376,4224,4288⟩) (.single ⟨13312,13376,4288,4352⟩))) (.node (.node (.single ⟨13376,13440,4224,4288⟩) (.single ⟨13376,13440,4288,4352⟩)) (.node (.single ⟨13440,13568,4096,4224⟩) (.single ⟨13440,13568,4224,4352⟩))))) (.node (.node (.node (.single ⟨19200,19328,28416,28544⟩) (.node (.single ⟨19200,19328,28544,28672⟩) (.single ⟨19328,19392,28416,28480⟩))) (.node (.node (.single ⟨19328,19392,28480,28544⟩) (.single ⟨19392,19456,28416,28480⟩)) (.node (.single ⟨19392,19456,28480,28544⟩) (.single ⟨19328,19456,28544,28672⟩)))) (.node (.node (.single ⟨28416,28544,19200,19328⟩) (.node (.single ⟨28416,28480,19328,19392⟩) (.single ⟨28416,28480,19392,19456⟩))) (.node (.node (.single ⟨28480,28544,19328,19392⟩) (.single ⟨28480,28544,19392,19456⟩)) (.node (.single ⟨28544,28672,19200,19328⟩) (.single ⟨28544,28672,19328,19456⟩))))))
def output65 : Fin 28 → GridBox := outputData65.get
def coverData65 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData65 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover65 (i : Fin 28) : Fin 28 := ⟨coverData65.get i % 28, Nat.mod_lt _ (by decide)⟩
def source65 (i : Fin 28) : Fin 28 := ⟨sourceData65.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree65 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 (.cutY 14336 (.cutX 5120 (.cutY 13312 .empty (.cutX 4608 (.cutY 13824 (.cutX 4352 (.cutY 13568 (.cutX 4224 (.cutY 13440 .full .full) (.cutY 13440 (.cutX 4288 (.cutY 13376 .full .full) (.cutY 13376 .full .full)) .full)) .empty) .empty) .empty) .empty)) .empty) .empty) .empty)))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 (.cutY 6144 (.cutX 13312 .empty (.cutY 5120 (.cutX 13824 (.cutY 4608 (.cutX 13568 (.cutY 4352 (.cutX 13440 (.cutY 4224 .full (.cutX 13376 (.cutY 4288 .full .full) (.cutY 4288 .full .full))) (.cutY 4224 .full .full)) .empty) .empty) .empty) .empty) .empty)) .empty) .empty))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 .empty (.cutY 26624 .empty (.cutX 19456 (.cutY 27648 .empty (.cutX 18944 .empty (.cutY 28160 .empty (.cutX 19200 .empty (.cutY 28416 .empty (.cutX 19328 (.cutY 28544 .full .full) (.cutY 28544 (.cutX 19392 (.cutY 28480 .full .full) (.cutY 28480 .full .full)) .full))))))) .empty))) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 .empty (.cutY 18432 .empty (.cutX 27648 .empty (.cutY 19456 (.cutX 28160 .empty (.cutY 18944 .empty (.cutX 28416 .empty (.cutY 19200 .empty (.cutX 28544 (.cutY 19328 .full (.cutX 28480 (.cutY 19392 .full .full) (.cutY 19392 .full .full))) (.cutY 19328 .full .full)))))) .empty)))) .empty) .empty) .empty))))

theorem metadata65 : 0<199204038 ∧ 16<128 ∧ 52<128 ∧ 1<4 ∧
    6004/4160=1 ∧ 6004%4160=1844 ∧ ∀ i, (leaves65 i).Valid 8 := by
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

noncomputable def phaseMass65 : ℝ := singlePhaseMass (199204038/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw65 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass65_eq : phaseMass65 = (99602019/819200000000 : ℝ) := by
  unfold phaseMass65
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw65 output65 cover65 source65
    (gridTreeUnionCheck_sound 32768 raw65 output65 cover65 source65 tree65 checked65)
    _ (by norm_num) _, areaUnits65]
  norm_num

-- Frozen phase 3962, atom 6631, type 1, source (23,56).
def leavesData66 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves66 : Fin 7 → DyadicLeaf := leavesData66.get
def raw66 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 23 56 leaves66 i
def outputData66 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨5888,6016,14336,14464⟩) (.node (.single ⟨5888,6016,14464,14592⟩) (.single ⟨6016,6080,14336,14400⟩))) (.node (.node (.single ⟨6016,6080,14400,14464⟩) (.single ⟨6080,6144,14336,14400⟩)) (.node (.single ⟨6080,6144,14400,14464⟩) (.single ⟨6016,6144,14464,14592⟩)))) (.node (.node (.single ⟨14336,14464,5888,6016⟩) (.node (.single ⟨14336,14400,6016,6080⟩) (.single ⟨14336,14400,6080,6144⟩))) (.node (.node (.single ⟨14400,14464,6016,6080⟩) (.single ⟨14400,14464,6080,6144⟩)) (.node (.single ⟨14464,14592,5888,6016⟩) (.single ⟨14464,14592,6016,6144⟩))))) (.node (.node (.node (.single ⟨18176,18304,26624,26752⟩) (.node (.single ⟨18176,18304,26752,26880⟩) (.single ⟨18304,18368,26624,26688⟩))) (.node (.node (.single ⟨18304,18368,26688,26752⟩) (.single ⟨18368,18432,26624,26688⟩)) (.node (.single ⟨18368,18432,26688,26752⟩) (.single ⟨18304,18432,26752,26880⟩)))) (.node (.node (.single ⟨26624,26752,18176,18304⟩) (.node (.single ⟨26624,26688,18304,18368⟩) (.single ⟨26624,26688,18368,18432⟩))) (.node (.node (.single ⟨26688,26752,18304,18368⟩) (.single ⟨26688,26752,18368,18432⟩)) (.node (.single ⟨26752,26880,18176,18304⟩) (.single ⟨26752,26880,18304,18432⟩))))))
def output66 : Fin 28 → GridBox := outputData66.get
def coverData66 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData66 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover66 (i : Fin 28) : Fin 28 := ⟨coverData66.get i % 28, Nat.mod_lt _ (by decide)⟩
def source66 (i : Fin 28) : Fin 28 := ⟨sourceData66.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree66 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 (.cutY 14336 .empty (.cutX 5120 .empty (.cutY 15360 (.cutX 5632 .empty (.cutY 14848 (.cutX 5888 .empty (.cutY 14592 (.cutX 6016 (.cutY 14464 .full .full) (.cutY 14464 (.cutX 6080 (.cutY 14400 .full .full) (.cutY 14400 .full .full)) .full)) .empty)) .empty)) .empty))) .empty)))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 .empty (.cutY 6144 (.cutX 15360 (.cutY 5120 .empty (.cutX 14848 (.cutY 5632 .empty (.cutX 14592 (.cutY 5888 .empty (.cutX 14464 (.cutY 6016 .full (.cutX 14400 (.cutY 6080 .full .full) (.cutY 6080 .full .full))) (.cutY 6016 .full .full))) .empty)) .empty)) .empty) .empty)))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 (.cutY 26624 .empty (.cutX 17408 .empty (.cutY 27648 (.cutX 17920 .empty (.cutY 27136 (.cutX 18176 .empty (.cutY 26880 (.cutX 18304 (.cutY 26752 .full .full) (.cutY 26752 (.cutX 18368 (.cutY 26688 .full .full) (.cutY 26688 .full .full)) .full)) .empty)) .empty)) .empty))) .empty) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 .empty (.cutY 18432 (.cutX 27648 (.cutY 17408 .empty (.cutX 27136 (.cutY 17920 .empty (.cutX 26880 (.cutY 18176 .empty (.cutX 26752 (.cutY 18304 .full (.cutX 26688 (.cutY 18368 .full .full) (.cutY 18368 .full .full))) (.cutY 18304 .full .full))) .empty)) .empty)) .empty) .empty)) .empty) .empty) .empty))))

theorem metadata66 : 0<166308920 ∧ 23<128 ∧ 56<128 ∧ 1<4 ∧
    6631/4160=1 ∧ 6631%4160=2471 ∧ ∀ i, (leaves66 i).Valid 8 := by
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

noncomputable def phaseMass66 : ℝ := singlePhaseMass (166308920/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw66 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass66_eq : phaseMass66 = (4157723/40960000000 : ℝ) := by
  unfold phaseMass66
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw66 output66 cover66 source66
    (gridTreeUnionCheck_sound 32768 raw66 output66 cover66 source66 tree66 checked66)
    _ (by norm_num) _, areaUnits66]
  norm_num

-- Frozen phase 3963, atom 2862, type 0, source (28,62).
def leavesData67 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves67 : Fin 4 → DyadicLeaf := leavesData67.get
def raw67 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 28 62 leaves67 i
def outputData67 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨7168,7296,15872,16000⟩) (.single ⟨7168,7296,16000,16128⟩)) (.node (.single ⟨7296,7424,15872,16000⟩) (.single ⟨7296,7424,16000,16128⟩))) (.node (.node (.single ⟨15872,16000,7168,7296⟩) (.single ⟨15872,16000,7296,7424⟩)) (.node (.single ⟨16000,16128,7168,7296⟩) (.single ⟨16000,16128,7296,7424⟩)))) (.node (.node (.node (.single ⟨16640,16768,25344,25472⟩) (.single ⟨16640,16768,25472,25600⟩)) (.node (.single ⟨16768,16896,25344,25472⟩) (.single ⟨16768,16896,25472,25600⟩))) (.node (.node (.single ⟨25344,25472,16640,16768⟩) (.single ⟨25344,25472,16768,16896⟩)) (.node (.single ⟨25472,25600,16640,16768⟩) (.single ⟨25472,25600,16768,16896⟩)))))
def output67 : Fin 16 → GridBox := outputData67.get
def coverData67 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData67 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover67 (i : Fin 16) : Fin 16 := ⟨coverData67.get i % 16, Nat.mod_lt _ (by decide)⟩
def source67 (i : Fin 16) : Fin 16 := ⟨sourceData67.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree67 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 .empty (.cutY 14336 .empty (.cutX 7168 .empty (.cutY 15360 .empty (.cutX 7680 (.cutY 15872 .empty (.cutX 7424 (.cutY 16128 (.cutX 7296 (.cutY 16000 .full .full) (.cutY 16000 .full .full)) .empty) .empty)) .empty)))))))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 .empty (.cutY 6144 .empty (.cutX 15360 .empty (.cutY 7168 .empty (.cutX 15872 .empty (.cutY 7680 (.cutX 16128 (.cutY 7424 (.cutX 16000 (.cutY 7296 .full .full) (.cutY 7296 .full .full)) .empty) .empty) .empty)))))))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 (.cutY 26624 (.cutX 17408 (.cutY 25600 (.cutX 16896 (.cutY 25088 .empty (.cutX 16640 .empty (.cutY 25344 .empty (.cutX 16768 (.cutY 25472 .full .full) (.cutY 25472 .full .full))))) .empty) .empty) .empty) .empty) .empty) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 (.cutY 18432 (.cutX 25600 (.cutY 17408 (.cutX 25088 .empty (.cutY 16896 (.cutX 25344 .empty (.cutY 16640 .empty (.cutX 25472 (.cutY 16768 .full .full) (.cutY 16768 .full .full)))) .empty)) .empty) .empty) .empty) .empty) .empty) .empty) .empty))))

theorem metadata67 : 0<29910597 ∧ 28<128 ∧ 62<128 ∧ 0<4 ∧
    2862/4160=0 ∧ 2862%4160=2862 ∧ ∀ i, (leaves67 i).Valid 8 := by
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

noncomputable def phaseMass67 : ℝ := singlePhaseMass (29910597/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw67 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass67_eq : phaseMass67 = (29910597/1638400000000 : ℝ) := by
  unfold phaseMass67
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw67 output67 cover67 source67
    (gridTreeUnionCheck_sound 32768 raw67 output67 cover67 source67 tree67 checked67)
    _ (by norm_num) _, areaUnits67]
  norm_num

-- Frozen phase 3964, atom 7968, type 1, source (45,73).
def leavesData68 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves68 : Fin 7 → DyadicLeaf := leavesData68.get
def raw68 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 45 73 leaves68 i
def outputData68 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨11520,11648,18688,18816⟩) (.node (.single ⟨11520,11648,18816,18944⟩) (.single ⟨11648,11712,18688,18752⟩))) (.node (.node (.single ⟨11648,11712,18752,18816⟩) (.single ⟨11712,11776,18688,18752⟩)) (.node (.single ⟨11712,11776,18752,18816⟩) (.single ⟨11648,11776,18816,18944⟩)))) (.node (.node (.single ⟨13824,13952,20992,21120⟩) (.node (.single ⟨13824,13952,21120,21248⟩) (.single ⟨13952,14016,20992,21056⟩))) (.node (.node (.single ⟨13952,14016,21056,21120⟩) (.single ⟨14016,14080,20992,21056⟩)) (.node (.single ⟨14016,14080,21056,21120⟩) (.single ⟨13952,14080,21120,21248⟩))))) (.node (.node (.node (.single ⟨18688,18816,11520,11648⟩) (.node (.single ⟨18688,18752,11648,11712⟩) (.single ⟨18688,18752,11712,11776⟩))) (.node (.node (.single ⟨18752,18816,11648,11712⟩) (.single ⟨18752,18816,11712,11776⟩)) (.node (.single ⟨18816,18944,11520,11648⟩) (.single ⟨18816,18944,11648,11776⟩)))) (.node (.node (.single ⟨20992,21120,13824,13952⟩) (.node (.single ⟨20992,21056,13952,14016⟩) (.single ⟨20992,21056,14016,14080⟩))) (.node (.node (.single ⟨21056,21120,13952,14016⟩) (.single ⟨21056,21120,14016,14080⟩)) (.node (.single ⟨21120,21248,13824,13952⟩) (.single ⟨21120,21248,13952,14080⟩))))))
def output68 : Fin 28 → GridBox := outputData68.get
def coverData68 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData68 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover68 (i : Fin 28) : Fin 28 := ⟨coverData68.get i % 28, Nat.mod_lt _ (by decide)⟩
def source68 (i : Fin 28) : Fin 28 := ⟨sourceData68.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree68 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 .empty (.cutY 18432 .empty (.cutX 11264 .empty (.cutY 19456 (.cutX 11776 (.cutY 18944 (.cutX 11520 .empty (.cutY 18688 .empty (.cutX 11648 (.cutY 18816 .full .full) (.cutY 18816 (.cutX 11712 (.cutY 18752 .full .full) (.cutY 18752 .full .full)) .full)))) .empty) .empty) .empty)))) .empty) (.cutY 20480 .empty (.cutX 14336 (.cutY 22528 (.cutX 13312 .empty (.cutY 21504 (.cutX 13824 .empty (.cutY 20992 .empty (.cutX 14080 (.cutY 21248 (.cutX 13952 (.cutY 21120 .full .full) (.cutY 21120 (.cutX 14016 (.cutY 21056 .full .full) (.cutY 21056 .full .full)) .full)) .empty) .empty))) .empty)) .empty) .empty))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 .empty (.cutY 10240 .empty (.cutX 19456 (.cutY 11264 .empty (.cutX 18944 (.cutY 11776 (.cutX 18688 .empty (.cutY 11520 .empty (.cutX 18816 (.cutY 11648 .full (.cutX 18752 (.cutY 11712 .full .full) (.cutY 11712 .full .full))) (.cutY 11648 .full .full)))) .empty) .empty)) .empty))) .empty) (.cutY 12288 .empty (.cutX 22528 (.cutY 14336 (.cutX 21504 (.cutY 13312 .empty (.cutX 20992 .empty (.cutY 13824 .empty (.cutX 21248 (.cutY 14080 (.cutX 21120 (.cutY 13952 .full (.cutX 21056 (.cutY 14016 .full .full) (.cutY 14016 .full .full))) (.cutY 13952 .full .full)) .empty) .empty)))) .empty) .empty) .empty)))) .empty) .empty))

theorem metadata68 : 0<177315334 ∧ 45<128 ∧ 73<128 ∧ 1<4 ∧
    7968/4160=1 ∧ 7968%4160=3808 ∧ ∀ i, (leaves68 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData68).mp
    (by decide +kernel)

theorem sourceChecked68_0 : ∀ i : Fin 28,
    (fun i => output68 i = raw68 (source68 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked68 : ∀ i : Fin 28, (fun i => output68 i = raw68 (source68 i)) i :=
  forallFin_of_zero_offset (fun i => output68 i = raw68 (source68 i)) sourceChecked68_0

theorem coverChecked68_0 : ∀ i : Fin 28,
    (fun i => (output68 (cover68 i)).ContainsBox (raw68 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked68 : ∀ i : Fin 28, (fun i => (output68 (cover68 i)).ContainsBox (raw68 i)) i :=
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

noncomputable def phaseMass68 : ℝ := singlePhaseMass (177315334/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw68 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass68_eq : phaseMass68 = (88657667/819200000000 : ℝ) := by
  unfold phaseMass68
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw68 output68 cover68 source68
    (gridTreeUnionCheck_sound 32768 raw68 output68 cover68 source68 tree68 checked68)
    _ (by norm_num) _, areaUnits68]
  norm_num

-- Frozen phase 3965, atom 8006, type 1, source (46,74).
def leavesData69 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves69 : Fin 7 → DyadicLeaf := leavesData69.get
def raw69 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 46 74 leaves69 i
def outputData69 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨11776,11904,18944,19072⟩) (.node (.single ⟨11776,11904,19072,19200⟩) (.single ⟨11904,11968,18944,19008⟩))) (.node (.node (.single ⟨11904,11968,19008,19072⟩) (.single ⟨11968,12032,18944,19008⟩)) (.node (.single ⟨11968,12032,19008,19072⟩) (.single ⟨11904,12032,19072,19200⟩)))) (.node (.node (.single ⟨13568,13696,20736,20864⟩) (.node (.single ⟨13568,13696,20864,20992⟩) (.single ⟨13696,13760,20736,20800⟩))) (.node (.node (.single ⟨13696,13760,20800,20864⟩) (.single ⟨13760,13824,20736,20800⟩)) (.node (.single ⟨13760,13824,20800,20864⟩) (.single ⟨13696,13824,20864,20992⟩))))) (.node (.node (.node (.single ⟨18944,19072,11776,11904⟩) (.node (.single ⟨18944,19008,11904,11968⟩) (.single ⟨18944,19008,11968,12032⟩))) (.node (.node (.single ⟨19008,19072,11904,11968⟩) (.single ⟨19008,19072,11968,12032⟩)) (.node (.single ⟨19072,19200,11776,11904⟩) (.single ⟨19072,19200,11904,12032⟩)))) (.node (.node (.single ⟨20736,20864,13568,13696⟩) (.node (.single ⟨20736,20800,13696,13760⟩) (.single ⟨20736,20800,13760,13824⟩))) (.node (.node (.single ⟨20800,20864,13696,13760⟩) (.single ⟨20800,20864,13760,13824⟩)) (.node (.single ⟨20864,20992,13568,13696⟩) (.single ⟨20864,20992,13696,13824⟩))))))
def output69 : Fin 28 → GridBox := outputData69.get
def coverData69 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData69 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover69 (i : Fin 28) : Fin 28 := ⟨coverData69.get i % 28, Nat.mod_lt _ (by decide)⟩
def source69 (i : Fin 28) : Fin 28 := ⟨sourceData69.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree69 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 .empty (.cutY 18432 .empty (.cutX 11264 .empty (.cutY 19456 (.cutX 11776 .empty (.cutY 18944 .empty (.cutX 12032 (.cutY 19200 (.cutX 11904 (.cutY 19072 .full .full) (.cutY 19072 (.cutX 11968 (.cutY 19008 .full .full) (.cutY 19008 .full .full)) .full)) .empty) .empty))) .empty)))) .empty) (.cutY 20480 .empty (.cutX 14336 (.cutY 22528 (.cutX 13312 .empty (.cutY 21504 (.cutX 13824 (.cutY 20992 (.cutX 13568 .empty (.cutY 20736 .empty (.cutX 13696 (.cutY 20864 .full .full) (.cutY 20864 (.cutX 13760 (.cutY 20800 .full .full) (.cutY 20800 .full .full)) .full)))) .empty) .empty) .empty)) .empty) .empty))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 .empty (.cutY 10240 .empty (.cutX 19456 (.cutY 11264 .empty (.cutX 18944 .empty (.cutY 11776 .empty (.cutX 19200 (.cutY 12032 (.cutX 19072 (.cutY 11904 .full (.cutX 19008 (.cutY 11968 .full .full) (.cutY 11968 .full .full))) (.cutY 11904 .full .full)) .empty) .empty)))) .empty))) .empty) (.cutY 12288 .empty (.cutX 22528 (.cutY 14336 (.cutX 21504 (.cutY 13312 .empty (.cutX 20992 (.cutY 13824 (.cutX 20736 .empty (.cutY 13568 .empty (.cutX 20864 (.cutY 13696 .full (.cutX 20800 (.cutY 13760 .full .full) (.cutY 13760 .full .full))) (.cutY 13696 .full .full)))) .empty) .empty)) .empty) .empty) .empty)))) .empty) .empty))

theorem metadata69 : 0<177315334 ∧ 46<128 ∧ 74<128 ∧ 1<4 ∧
    8006/4160=1 ∧ 8006%4160=3846 ∧ ∀ i, (leaves69 i).Valid 8 := by
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

noncomputable def phaseMass69 : ℝ := singlePhaseMass (177315334/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw69 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass69_eq : phaseMass69 = (88657667/819200000000 : ℝ) := by
  unfold phaseMass69
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw69 output69 cover69 source69
    (gridTreeUnionCheck_sound 32768 raw69 output69 cover69 source69 tree69 checked69)
    _ (by norm_num) _, areaUnits69]
  norm_num

-- Frozen phase 3966, atom 6792, type 1, source (25,57).
def leavesData70 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves70 : Fin 7 → DyadicLeaf := leavesData70.get
def raw70 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 25 57 leaves70 i
def outputData70 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨6400,6528,14592,14720⟩) (.node (.single ⟨6400,6528,14720,14848⟩) (.single ⟨6528,6592,14592,14656⟩))) (.node (.node (.single ⟨6528,6592,14656,14720⟩) (.single ⟨6592,6656,14592,14656⟩)) (.node (.single ⟨6592,6656,14656,14720⟩) (.single ⟨6528,6656,14720,14848⟩)))) (.node (.node (.single ⟨14592,14720,6400,6528⟩) (.node (.single ⟨14592,14656,6528,6592⟩) (.single ⟨14592,14656,6592,6656⟩))) (.node (.node (.single ⟨14656,14720,6528,6592⟩) (.single ⟨14656,14720,6592,6656⟩)) (.node (.single ⟨14720,14848,6400,6528⟩) (.single ⟨14720,14848,6528,6656⟩))))) (.node (.node (.node (.single ⟨17920,18048,26112,26240⟩) (.node (.single ⟨17920,18048,26240,26368⟩) (.single ⟨18048,18112,26112,26176⟩))) (.node (.node (.single ⟨18048,18112,26176,26240⟩) (.single ⟨18112,18176,26112,26176⟩)) (.node (.single ⟨18112,18176,26176,26240⟩) (.single ⟨18048,18176,26240,26368⟩)))) (.node (.node (.single ⟨26112,26240,17920,18048⟩) (.node (.single ⟨26112,26176,18048,18112⟩) (.single ⟨26112,26176,18112,18176⟩))) (.node (.node (.single ⟨26176,26240,18048,18112⟩) (.single ⟨26176,26240,18112,18176⟩)) (.node (.single ⟨26240,26368,17920,18048⟩) (.single ⟨26240,26368,18048,18176⟩))))))
def output70 : Fin 28 → GridBox := outputData70.get
def coverData70 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData70 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover70 (i : Fin 28) : Fin 28 := ⟨coverData70.get i % 28, Nat.mod_lt _ (by decide)⟩
def source70 (i : Fin 28) : Fin 28 := ⟨sourceData70.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree70 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 .empty (.cutY 14336 .empty (.cutX 7168 (.cutY 15360 (.cutX 6656 (.cutY 14848 (.cutX 6400 .empty (.cutY 14592 .empty (.cutX 6528 (.cutY 14720 .full .full) (.cutY 14720 (.cutX 6592 (.cutY 14656 .full .full) (.cutY 14656 .full .full)) .full)))) .empty) .empty) .empty) .empty)))))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 .empty (.cutY 6144 .empty (.cutX 15360 (.cutY 7168 (.cutX 14848 (.cutY 6656 (.cutX 14592 .empty (.cutY 6400 .empty (.cutX 14720 (.cutY 6528 .full (.cutX 14656 (.cutY 6592 .full .full) (.cutY 6592 .full .full))) (.cutY 6528 .full .full)))) .empty) .empty) .empty) .empty))))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 (.cutY 26624 (.cutX 17408 .empty (.cutY 25600 .empty (.cutX 17920 .empty (.cutY 26112 .empty (.cutX 18176 (.cutY 26368 (.cutX 18048 (.cutY 26240 .full .full) (.cutY 26240 (.cutX 18112 (.cutY 26176 .full .full) (.cutY 26176 .full .full)) .full)) .empty) .empty))))) .empty) .empty) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 (.cutY 18432 (.cutX 25600 .empty (.cutY 17408 .empty (.cutX 26112 .empty (.cutY 17920 .empty (.cutX 26368 (.cutY 18176 (.cutX 26240 (.cutY 18048 .full (.cutX 26176 (.cutY 18112 .full .full) (.cutY 18112 .full .full))) (.cutY 18048 .full .full)) .empty) .empty))))) .empty) .empty) .empty) .empty) .empty))))

theorem metadata70 : 0<69455300 ∧ 25<128 ∧ 57<128 ∧ 1<4 ∧
    6792/4160=1 ∧ 6792%4160=2632 ∧ ∀ i, (leaves70 i).Valid 8 := by
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

noncomputable def phaseMass70 : ℝ := singlePhaseMass (69455300/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw70 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass70_eq : phaseMass70 = (694553/16384000000 : ℝ) := by
  unfold phaseMass70
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw70 output70 cover70 source70
    (gridTreeUnionCheck_sound 32768 raw70 output70 cover70 source70 tree70 checked70)
    _ (by norm_num) _, areaUnits70]
  norm_num

-- Frozen phase 3967, atom 5602, type 1, source (12,50).
def leavesData71 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves71 : Fin 7 → DyadicLeaf := leavesData71.get
def raw71 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 12 50 leaves71 i
def outputData71 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3072,3200,12800,12928⟩) (.node (.single ⟨3072,3200,12928,13056⟩) (.single ⟨3200,3264,12800,12864⟩))) (.node (.node (.single ⟨3200,3264,12864,12928⟩) (.single ⟨3264,3328,12800,12864⟩)) (.node (.single ⟨3264,3328,12864,12928⟩) (.single ⟨3200,3328,12928,13056⟩)))) (.node (.node (.single ⟨12800,12928,3072,3200⟩) (.node (.single ⟨12800,12864,3200,3264⟩) (.single ⟨12800,12864,3264,3328⟩))) (.node (.node (.single ⟨12864,12928,3200,3264⟩) (.single ⟨12864,12928,3264,3328⟩)) (.node (.single ⟨12928,13056,3072,3200⟩) (.single ⟨12928,13056,3200,3328⟩))))) (.node (.node (.node (.single ⟨19712,19840,29440,29568⟩) (.node (.single ⟨19712,19840,29568,29696⟩) (.single ⟨19840,19904,29440,29504⟩))) (.node (.node (.single ⟨19840,19904,29504,29568⟩) (.single ⟨19904,19968,29440,29504⟩)) (.node (.single ⟨19904,19968,29504,29568⟩) (.single ⟨19840,19968,29568,29696⟩)))) (.node (.node (.single ⟨29440,29568,19712,19840⟩) (.node (.single ⟨29440,29504,19840,19904⟩) (.single ⟨29440,29504,19904,19968⟩))) (.node (.node (.single ⟨29504,29568,19840,19904⟩) (.single ⟨29504,29568,19904,19968⟩)) (.node (.single ⟨29568,29696,19712,19840⟩) (.single ⟨29568,29696,19840,19968⟩))))))
def output71 : Fin 28 → GridBox := outputData71.get
def coverData71 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData71 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover71 (i : Fin 28) : Fin 28 := ⟨coverData71.get i % 28, Nat.mod_lt _ (by decide)⟩
def source71 (i : Fin 28) : Fin 28 := ⟨sourceData71.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree71 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 (.cutX 3072 .empty (.cutY 13312 (.cutX 3584 (.cutY 12800 .empty (.cutX 3328 (.cutY 13056 (.cutX 3200 (.cutY 12928 .full .full) (.cutY 12928 (.cutX 3264 (.cutY 12864 .full .full) (.cutY 12864 .full .full)) .full)) .empty) .empty)) .empty) .empty)) .empty))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 (.cutY 2048 .empty (.cutX 13312 (.cutY 3072 .empty (.cutX 12800 .empty (.cutY 3584 (.cutX 13056 (.cutY 3328 (.cutX 12928 (.cutY 3200 .full (.cutX 12864 (.cutY 3264 .full .full) (.cutY 3264 .full .full))) (.cutY 3200 .full .full)) .empty) .empty) .empty))) .empty)) .empty) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 .empty (.cutY 30720 (.cutX 19456 .empty (.cutY 29696 (.cutX 19968 (.cutY 29184 .empty (.cutX 19712 .empty (.cutY 29440 .empty (.cutX 19840 (.cutY 29568 .full .full) (.cutY 29568 (.cutX 19904 (.cutY 29504 .full .full) (.cutY 29504 .full .full)) .full))))) .empty) .empty)) .empty))) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 .empty (.cutX 29696 (.cutY 19456 .empty (.cutX 29184 .empty (.cutY 19968 (.cutX 29440 .empty (.cutY 19712 .empty (.cutX 29568 (.cutY 19840 .full (.cutX 29504 (.cutY 19904 .full .full) (.cutY 19904 .full .full))) (.cutY 19840 .full .full)))) .empty))) .empty)) .empty) .empty)) .empty))))

theorem metadata71 : 0<144841863 ∧ 12<128 ∧ 50<128 ∧ 1<4 ∧
    5602/4160=1 ∧ 5602%4160=1442 ∧ ∀ i, (leaves71 i).Valid 8 := by
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

noncomputable def phaseMass71 : ℝ := singlePhaseMass (144841863/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw71 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass71_eq : phaseMass71 = (144841863/1638400000000 : ℝ) := by
  unfold phaseMass71
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw71 output71 cover71 source71
    (gridTreeUnionCheck_sound 32768 raw71 output71 cover71 source71 tree71 checked71)
    _ (by norm_num) _, areaUnits71]
  norm_num

-- Frozen phase 3968, atom 6462, type 1, source (21,55).
def leavesData72 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves72 : Fin 7 → DyadicLeaf := leavesData72.get
def raw72 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 21 55 leaves72 i
def outputData72 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨5376,5504,14080,14208⟩) (.node (.single ⟨5376,5504,14208,14336⟩) (.single ⟨5504,5568,14080,14144⟩))) (.node (.node (.single ⟨5504,5568,14144,14208⟩) (.single ⟨5568,5632,14080,14144⟩)) (.node (.single ⟨5568,5632,14144,14208⟩) (.single ⟨5504,5632,14208,14336⟩)))) (.node (.node (.single ⟨14080,14208,5376,5504⟩) (.node (.single ⟨14080,14144,5504,5568⟩) (.single ⟨14080,14144,5568,5632⟩))) (.node (.node (.single ⟨14144,14208,5504,5568⟩) (.single ⟨14144,14208,5568,5632⟩)) (.node (.single ⟨14208,14336,5376,5504⟩) (.single ⟨14208,14336,5504,5632⟩))))) (.node (.node (.node (.single ⟨18432,18560,27136,27264⟩) (.node (.single ⟨18432,18560,27264,27392⟩) (.single ⟨18560,18624,27136,27200⟩))) (.node (.node (.single ⟨18560,18624,27200,27264⟩) (.single ⟨18624,18688,27136,27200⟩)) (.node (.single ⟨18624,18688,27200,27264⟩) (.single ⟨18560,18688,27264,27392⟩)))) (.node (.node (.single ⟨27136,27264,18432,18560⟩) (.node (.single ⟨27136,27200,18560,18624⟩) (.single ⟨27136,27200,18624,18688⟩))) (.node (.node (.single ⟨27200,27264,18560,18624⟩) (.single ⟨27200,27264,18624,18688⟩)) (.node (.single ⟨27264,27392,18432,18560⟩) (.single ⟨27264,27392,18560,18688⟩))))))
def output72 : Fin 28 → GridBox := outputData72.get
def coverData72 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData72 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover72 (i : Fin 28) : Fin 28 := ⟨coverData72.get i % 28, Nat.mod_lt _ (by decide)⟩
def source72 (i : Fin 28) : Fin 28 := ⟨sourceData72.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree72 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 (.cutY 14336 (.cutX 5120 .empty (.cutY 13312 .empty (.cutX 5632 (.cutY 13824 .empty (.cutX 5376 .empty (.cutY 14080 .empty (.cutX 5504 (.cutY 14208 .full .full) (.cutY 14208 (.cutX 5568 (.cutY 14144 .full .full) (.cutY 14144 .full .full)) .full))))) .empty))) .empty) .empty)))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 (.cutY 6144 (.cutX 13312 .empty (.cutY 5120 .empty (.cutX 13824 .empty (.cutY 5632 (.cutX 14080 .empty (.cutY 5376 .empty (.cutX 14208 (.cutY 5504 .full (.cutX 14144 (.cutY 5568 .full .full) (.cutY 5568 .full .full))) (.cutY 5504 .full .full)))) .empty)))) .empty) .empty))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 .empty (.cutY 26624 .empty (.cutX 19456 (.cutY 27648 (.cutX 18944 (.cutY 27136 .empty (.cutX 18688 (.cutY 27392 (.cutX 18560 (.cutY 27264 .full .full) (.cutY 27264 (.cutX 18624 (.cutY 27200 .full .full) (.cutY 27200 .full .full)) .full)) .empty) .empty)) .empty) .empty) .empty))) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 .empty (.cutY 18432 .empty (.cutX 27648 (.cutY 19456 (.cutX 27136 .empty (.cutY 18944 (.cutX 27392 (.cutY 18688 (.cutX 27264 (.cutY 18560 .full (.cutX 27200 (.cutY 18624 .full .full) (.cutY 18624 .full .full))) (.cutY 18560 .full .full)) .empty) .empty) .empty)) .empty) .empty))) .empty) .empty) .empty))))

theorem metadata72 : 0<199204038 ∧ 21<128 ∧ 55<128 ∧ 1<4 ∧
    6462/4160=1 ∧ 6462%4160=2302 ∧ ∀ i, (leaves72 i).Valid 8 := by
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

noncomputable def phaseMass72 : ℝ := singlePhaseMass (199204038/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw72 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass72_eq : phaseMass72 = (99602019/819200000000 : ℝ) := by
  unfold phaseMass72
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw72 output72 cover72 source72
    (gridTreeUnionCheck_sound 32768 raw72 output72 cover72 source72 tree72 checked72)
    _ (by norm_num) _, areaUnits72]
  norm_num

-- Frozen phase 3969, atom 8042, type 1, source (47,75).
def leavesData73 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves73 : Fin 7 → DyadicLeaf := leavesData73.get
def raw73 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 47 75 leaves73 i
def outputData73 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨12032,12160,19200,19328⟩) (.node (.single ⟨12032,12160,19328,19456⟩) (.single ⟨12160,12224,19200,19264⟩))) (.node (.node (.single ⟨12160,12224,19264,19328⟩) (.single ⟨12224,12288,19200,19264⟩)) (.node (.single ⟨12224,12288,19264,19328⟩) (.single ⟨12160,12288,19328,19456⟩)))) (.node (.node (.single ⟨13312,13440,20480,20608⟩) (.node (.single ⟨13312,13440,20608,20736⟩) (.single ⟨13440,13504,20480,20544⟩))) (.node (.node (.single ⟨13440,13504,20544,20608⟩) (.single ⟨13504,13568,20480,20544⟩)) (.node (.single ⟨13504,13568,20544,20608⟩) (.single ⟨13440,13568,20608,20736⟩))))) (.node (.node (.node (.single ⟨19200,19328,12032,12160⟩) (.node (.single ⟨19200,19264,12160,12224⟩) (.single ⟨19200,19264,12224,12288⟩))) (.node (.node (.single ⟨19264,19328,12160,12224⟩) (.single ⟨19264,19328,12224,12288⟩)) (.node (.single ⟨19328,19456,12032,12160⟩) (.single ⟨19328,19456,12160,12288⟩)))) (.node (.node (.single ⟨20480,20608,13312,13440⟩) (.node (.single ⟨20480,20544,13440,13504⟩) (.single ⟨20480,20544,13504,13568⟩))) (.node (.node (.single ⟨20544,20608,13440,13504⟩) (.single ⟨20544,20608,13504,13568⟩)) (.node (.single ⟨20608,20736,13312,13440⟩) (.single ⟨20608,20736,13440,13568⟩))))))
def output73 : Fin 28 → GridBox := outputData73.get
def coverData73 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData73 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover73 (i : Fin 28) : Fin 28 := ⟨coverData73.get i % 28, Nat.mod_lt _ (by decide)⟩
def source73 (i : Fin 28) : Fin 28 := ⟨sourceData73.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree73 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 .empty (.cutY 18432 .empty (.cutX 11264 .empty (.cutY 19456 (.cutX 11776 .empty (.cutY 18944 .empty (.cutX 12032 .empty (.cutY 19200 .empty (.cutX 12160 (.cutY 19328 .full .full) (.cutY 19328 (.cutX 12224 (.cutY 19264 .full .full) (.cutY 19264 .full .full)) .full)))))) .empty)))) .empty) (.cutY 20480 .empty (.cutX 14336 (.cutY 22528 (.cutX 13312 .empty (.cutY 21504 (.cutX 13824 (.cutY 20992 (.cutX 13568 (.cutY 20736 (.cutX 13440 (.cutY 20608 .full .full) (.cutY 20608 (.cutX 13504 (.cutY 20544 .full .full) (.cutY 20544 .full .full)) .full)) .empty) .empty) .empty) .empty) .empty)) .empty) .empty))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 .empty (.cutY 10240 .empty (.cutX 19456 (.cutY 11264 .empty (.cutX 18944 .empty (.cutY 11776 .empty (.cutX 19200 .empty (.cutY 12032 .empty (.cutX 19328 (.cutY 12160 .full (.cutX 19264 (.cutY 12224 .full .full) (.cutY 12224 .full .full))) (.cutY 12160 .full .full))))))) .empty))) .empty) (.cutY 12288 .empty (.cutX 22528 (.cutY 14336 (.cutX 21504 (.cutY 13312 .empty (.cutX 20992 (.cutY 13824 (.cutX 20736 (.cutY 13568 (.cutX 20608 (.cutY 13440 .full (.cutX 20544 (.cutY 13504 .full .full) (.cutY 13504 .full .full))) (.cutY 13440 .full .full)) .empty) .empty) .empty) .empty)) .empty) .empty) .empty)))) .empty) .empty))

theorem metadata73 : 0<177315334 ∧ 47<128 ∧ 75<128 ∧ 1<4 ∧
    8042/4160=1 ∧ 8042%4160=3882 ∧ ∀ i, (leaves73 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData73).mp
    (by decide +kernel)

theorem sourceChecked73_0 : ∀ i : Fin 28,
    (fun i => output73 i = raw73 (source73 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked73 : ∀ i : Fin 28, (fun i => output73 i = raw73 (source73 i)) i :=
  forallFin_of_zero_offset (fun i => output73 i = raw73 (source73 i)) sourceChecked73_0

theorem coverChecked73_0 : ∀ i : Fin 28,
    (fun i => (output73 (cover73 i)).ContainsBox (raw73 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked73 : ∀ i : Fin 28, (fun i => (output73 (cover73 i)).ContainsBox (raw73 i)) i :=
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

noncomputable def phaseMass73 : ℝ := singlePhaseMass (177315334/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw73 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass73_eq : phaseMass73 = (88657667/819200000000 : ℝ) := by
  unfold phaseMass73
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw73 output73 cover73 source73
    (gridTreeUnionCheck_sound 32768 raw73 output73 cover73 source73 tree73 checked73)
    _ (by norm_num) _, areaUnits73]
  norm_num

-- Frozen phase 3970, atom 7480, type 1, source (35,65).
def leavesData74 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves74 : Fin 7 → DyadicLeaf := leavesData74.get
def raw74 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 35 65 leaves74 i
def outputData74 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨8960,9088,16640,16768⟩) (.node (.single ⟨8960,9088,16768,16896⟩) (.single ⟨9088,9152,16640,16704⟩))) (.node (.node (.single ⟨9088,9152,16704,16768⟩) (.single ⟨9152,9216,16640,16704⟩)) (.node (.single ⟨9152,9216,16704,16768⟩) (.single ⟨9088,9216,16768,16896⟩)))) (.node (.node (.single ⟨15872,16000,23552,23680⟩) (.node (.single ⟨15872,16000,23680,23808⟩) (.single ⟨16000,16064,23552,23616⟩))) (.node (.node (.single ⟨16000,16064,23616,23680⟩) (.single ⟨16064,16128,23552,23616⟩)) (.node (.single ⟨16064,16128,23616,23680⟩) (.single ⟨16000,16128,23680,23808⟩))))) (.node (.node (.node (.single ⟨16640,16768,8960,9088⟩) (.node (.single ⟨16640,16704,9088,9152⟩) (.single ⟨16640,16704,9152,9216⟩))) (.node (.node (.single ⟨16704,16768,9088,9152⟩) (.single ⟨16704,16768,9152,9216⟩)) (.node (.single ⟨16768,16896,8960,9088⟩) (.single ⟨16768,16896,9088,9216⟩)))) (.node (.node (.single ⟨23552,23680,15872,16000⟩) (.node (.single ⟨23552,23616,16000,16064⟩) (.single ⟨23552,23616,16064,16128⟩))) (.node (.node (.single ⟨23616,23680,16000,16064⟩) (.single ⟨23616,23680,16064,16128⟩)) (.node (.single ⟨23680,23808,15872,16000⟩) (.single ⟨23680,23808,16000,16128⟩))))))
def output74 : Fin 28 → GridBox := outputData74.get
def coverData74 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData74 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover74 (i : Fin 28) : Fin 28 := ⟨coverData74.get i % 28, Nat.mod_lt _ (by decide)⟩
def source74 (i : Fin 28) : Fin 28 := ⟨sourceData74.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree74 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 (.cutY 18432 (.cutX 9216 (.cutY 17408 (.cutX 8704 .empty (.cutY 16896 (.cutX 8960 .empty (.cutY 16640 .empty (.cutX 9088 (.cutY 16768 .full .full) (.cutY 16768 (.cutX 9152 (.cutY 16704 .full .full) (.cutY 16704 .full .full)) .full)))) .empty)) .empty) .empty) .empty) .empty) .empty) (.cutY 20480 .empty (.cutX 14336 .empty (.cutY 22528 .empty (.cutX 15360 .empty (.cutY 23552 .empty (.cutX 15872 .empty (.cutY 24064 (.cutX 16128 (.cutY 23808 (.cutX 16000 (.cutY 23680 .full .full) (.cutY 23680 (.cutX 16064 (.cutY 23616 .full .full) (.cutY 23616 .full .full)) .full)) .empty) .empty) .empty)))))))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 (.cutY 10240 (.cutX 17408 (.cutY 9216 (.cutX 16896 (.cutY 8704 .empty (.cutX 16640 .empty (.cutY 8960 .empty (.cutX 16768 (.cutY 9088 .full (.cutX 16704 (.cutY 9152 .full .full) (.cutY 9152 .full .full))) (.cutY 9088 .full .full))))) .empty) .empty) .empty) .empty) .empty) .empty) (.cutY 12288 .empty (.cutX 22528 .empty (.cutY 14336 .empty (.cutX 23552 .empty (.cutY 15360 .empty (.cutX 24064 (.cutY 15872 .empty (.cutX 23808 (.cutY 16128 (.cutX 23680 (.cutY 16000 .full (.cutX 23616 (.cutY 16064 .full .full) (.cutY 16064 .full .full))) (.cutY 16000 .full .full)) .empty) .empty)) .empty)))))))) .empty) .empty))

theorem metadata74 : 0<182398684 ∧ 35<128 ∧ 65<128 ∧ 1<4 ∧
    7480/4160=1 ∧ 7480%4160=3320 ∧ ∀ i, (leaves74 i).Valid 8 := by
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

noncomputable def phaseMass74 : ℝ := singlePhaseMass (182398684/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw74 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass74_eq : phaseMass74 = (45599671/409600000000 : ℝ) := by
  unfold phaseMass74
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw74 output74 cover74 source74
    (gridTreeUnionCheck_sound 32768 raw74 output74 cover74 source74 tree74 checked74)
    _ (by norm_num) _, areaUnits74]
  norm_num

-- Frozen phase 3971, atom 8076, type 1, source (48,76).
def leavesData75 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves75 : Fin 7 → DyadicLeaf := leavesData75.get
def raw75 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 48 76 leaves75 i
def outputData75 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨12288,12416,19456,19584⟩) (.node (.single ⟨12288,12416,19584,19712⟩) (.single ⟨12416,12480,19456,19520⟩))) (.node (.node (.single ⟨12416,12480,19520,19584⟩) (.single ⟨12480,12544,19456,19520⟩)) (.node (.single ⟨12480,12544,19520,19584⟩) (.single ⟨12416,12544,19584,19712⟩)))) (.node (.node (.single ⟨13056,13184,20224,20352⟩) (.node (.single ⟨13056,13184,20352,20480⟩) (.single ⟨13184,13248,20224,20288⟩))) (.node (.node (.single ⟨13184,13248,20288,20352⟩) (.single ⟨13248,13312,20224,20288⟩)) (.node (.single ⟨13248,13312,20288,20352⟩) (.single ⟨13184,13312,20352,20480⟩))))) (.node (.node (.node (.single ⟨19456,19584,12288,12416⟩) (.node (.single ⟨19456,19520,12416,12480⟩) (.single ⟨19456,19520,12480,12544⟩))) (.node (.node (.single ⟨19520,19584,12416,12480⟩) (.single ⟨19520,19584,12480,12544⟩)) (.node (.single ⟨19584,19712,12288,12416⟩) (.single ⟨19584,19712,12416,12544⟩)))) (.node (.node (.single ⟨20224,20352,13056,13184⟩) (.node (.single ⟨20224,20288,13184,13248⟩) (.single ⟨20224,20288,13248,13312⟩))) (.node (.node (.single ⟨20288,20352,13184,13248⟩) (.single ⟨20288,20352,13248,13312⟩)) (.node (.single ⟨20352,20480,13056,13184⟩) (.single ⟨20352,20480,13184,13312⟩))))))
def output75 : Fin 28 → GridBox := outputData75.get
def coverData75 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData75 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover75 (i : Fin 28) : Fin 28 := ⟨coverData75.get i % 28, Nat.mod_lt _ (by decide)⟩
def source75 (i : Fin 28) : Fin 28 := ⟨sourceData75.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree75 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 .empty (.cutY 20480 (.cutX 14336 (.cutY 18432 .empty (.cutX 13312 (.cutY 19456 .empty (.cutX 12800 (.cutY 19968 (.cutX 12544 (.cutY 19712 (.cutX 12416 (.cutY 19584 .full .full) (.cutY 19584 (.cutX 12480 (.cutY 19520 .full .full) (.cutY 19520 .full .full)) .full)) .empty) .empty) .empty) (.cutY 19968 .empty (.cutX 13056 .empty (.cutY 20224 .empty (.cutX 13184 (.cutY 20352 .full .full) (.cutY 20352 (.cutX 13248 (.cutY 20288 .full .full) (.cutY 20288 .full .full)) .full))))))) .empty)) .empty) .empty)) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 .empty (.cutX 18432 .empty (.cutY 14336 (.cutX 19456 .empty (.cutY 13312 (.cutX 19968 (.cutY 12800 (.cutX 19712 (.cutY 12544 (.cutX 19584 (.cutY 12416 .full (.cutX 19520 (.cutY 12480 .full .full) (.cutY 12480 .full .full))) (.cutY 12416 .full .full)) .empty) .empty) .empty) (.cutY 12800 .empty (.cutX 20224 .empty (.cutY 13056 .empty (.cutX 20352 (.cutY 13184 .full (.cutX 20288 (.cutY 13248 .full .full) (.cutY 13248 .full .full))) (.cutY 13184 .full .full)))))) .empty)) .empty))) .empty)) .empty) .empty))

theorem metadata75 : 0<128045008 ∧ 48<128 ∧ 76<128 ∧ 1<4 ∧
    8076/4160=1 ∧ 8076%4160=3916 ∧ ∀ i, (leaves75 i).Valid 8 := by
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

noncomputable def phaseMass75 : ℝ := singlePhaseMass (128045008/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw75 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass75_eq : phaseMass75 = (8002813/102400000000 : ℝ) := by
  unfold phaseMass75
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw75 output75 cover75 source75
    (gridTreeUnionCheck_sound 32768 raw75 output75 cover75 source75 tree75 checked75)
    _ (by norm_num) _, areaUnits75]
  norm_num

-- Frozen phase 3972, atom 8108, type 1, source (49,77).
def leavesData76 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves76 : Fin 7 → DyadicLeaf := leavesData76.get
def raw76 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 49 77 leaves76 i
def outputData76 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨12544,12672,19712,19840⟩) (.node (.single ⟨12544,12672,19840,19968⟩) (.single ⟨12672,12736,19712,19776⟩))) (.node (.node (.single ⟨12672,12736,19776,19840⟩) (.single ⟨12736,12800,19712,19776⟩)) (.node (.single ⟨12736,12800,19776,19840⟩) (.single ⟨12672,12800,19840,19968⟩)))) (.node (.node (.single ⟨12800,12928,19968,20096⟩) (.node (.single ⟨12800,12928,20096,20224⟩) (.single ⟨12928,12992,19968,20032⟩))) (.node (.node (.single ⟨12928,12992,20032,20096⟩) (.single ⟨12992,13056,19968,20032⟩)) (.node (.single ⟨12992,13056,20032,20096⟩) (.single ⟨12928,13056,20096,20224⟩))))) (.node (.node (.node (.single ⟨19712,19840,12544,12672⟩) (.node (.single ⟨19712,19776,12672,12736⟩) (.single ⟨19712,19776,12736,12800⟩))) (.node (.node (.single ⟨19776,19840,12672,12736⟩) (.single ⟨19776,19840,12736,12800⟩)) (.node (.single ⟨19840,19968,12544,12672⟩) (.single ⟨19840,19968,12672,12800⟩)))) (.node (.node (.single ⟨19968,20096,12800,12928⟩) (.node (.single ⟨19968,20032,12928,12992⟩) (.single ⟨19968,20032,12992,13056⟩))) (.node (.node (.single ⟨20032,20096,12928,12992⟩) (.single ⟨20032,20096,12992,13056⟩)) (.node (.single ⟨20096,20224,12800,12928⟩) (.single ⟨20096,20224,12928,13056⟩))))))
def output76 : Fin 28 → GridBox := outputData76.get
def coverData76 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData76 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover76 (i : Fin 28) : Fin 28 := ⟨coverData76.get i % 28, Nat.mod_lt _ (by decide)⟩
def source76 (i : Fin 28) : Fin 28 := ⟨sourceData76.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree76 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 .empty (.cutY 20480 (.cutX 14336 (.cutY 18432 .empty (.cutX 13312 (.cutY 19456 .empty (.cutX 12800 (.cutY 19968 (.cutX 12544 .empty (.cutY 19712 .empty (.cutX 12672 (.cutY 19840 .full .full) (.cutY 19840 (.cutX 12736 (.cutY 19776 .full .full) (.cutY 19776 .full .full)) .full)))) .empty) (.cutY 19968 .empty (.cutX 13056 (.cutY 20224 (.cutX 12928 (.cutY 20096 .full .full) (.cutY 20096 (.cutX 12992 (.cutY 20032 .full .full) (.cutY 20032 .full .full)) .full)) .empty) .empty)))) .empty)) .empty) .empty)) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 .empty (.cutX 18432 .empty (.cutY 14336 (.cutX 19456 .empty (.cutY 13312 (.cutX 19968 (.cutY 12800 (.cutX 19712 .empty (.cutY 12544 .empty (.cutX 19840 (.cutY 12672 .full (.cutX 19776 (.cutY 12736 .full .full) (.cutY 12736 .full .full))) (.cutY 12672 .full .full)))) .empty) (.cutY 12800 .empty (.cutX 20224 (.cutY 13056 (.cutX 20096 (.cutY 12928 .full (.cutX 20032 (.cutY 12992 .full .full) (.cutY 12992 .full .full))) (.cutY 12928 .full .full)) .empty) .empty))) .empty)) .empty))) .empty)) .empty) .empty))

theorem metadata76 : 0<128045008 ∧ 49<128 ∧ 77<128 ∧ 1<4 ∧
    8108/4160=1 ∧ 8108%4160=3948 ∧ ∀ i, (leaves76 i).Valid 8 := by
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

noncomputable def phaseMass76 : ℝ := singlePhaseMass (128045008/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw76 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass76_eq : phaseMass76 = (8002813/102400000000 : ℝ) := by
  unfold phaseMass76
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw76 output76 cover76 source76
    (gridTreeUnionCheck_sound 32768 raw76 output76 cover76 source76 tree76 checked76)
    _ (by norm_num) _, areaUnits76]
  norm_num

-- Frozen phase 3973, atom 7928, type 1, source (44,72).
def leavesData77 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves77 : Fin 7 → DyadicLeaf := leavesData77.get
def raw77 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 44 72 leaves77 i
def outputData77 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨11264,11392,18432,18560⟩) (.node (.single ⟨11264,11392,18560,18688⟩) (.single ⟨11392,11456,18432,18496⟩))) (.node (.node (.single ⟨11392,11456,18496,18560⟩) (.single ⟨11456,11520,18432,18496⟩)) (.node (.single ⟨11456,11520,18496,18560⟩) (.single ⟨11392,11520,18560,18688⟩)))) (.node (.node (.single ⟨14080,14208,21248,21376⟩) (.node (.single ⟨14080,14208,21376,21504⟩) (.single ⟨14208,14272,21248,21312⟩))) (.node (.node (.single ⟨14208,14272,21312,21376⟩) (.single ⟨14272,14336,21248,21312⟩)) (.node (.single ⟨14272,14336,21312,21376⟩) (.single ⟨14208,14336,21376,21504⟩))))) (.node (.node (.node (.single ⟨18432,18560,11264,11392⟩) (.node (.single ⟨18432,18496,11392,11456⟩) (.single ⟨18432,18496,11456,11520⟩))) (.node (.node (.single ⟨18496,18560,11392,11456⟩) (.single ⟨18496,18560,11456,11520⟩)) (.node (.single ⟨18560,18688,11264,11392⟩) (.single ⟨18560,18688,11392,11520⟩)))) (.node (.node (.single ⟨21248,21376,14080,14208⟩) (.node (.single ⟨21248,21312,14208,14272⟩) (.single ⟨21248,21312,14272,14336⟩))) (.node (.node (.single ⟨21312,21376,14208,14272⟩) (.single ⟨21312,21376,14272,14336⟩)) (.node (.single ⟨21376,21504,14080,14208⟩) (.single ⟨21376,21504,14208,14336⟩))))))
def output77 : Fin 28 → GridBox := outputData77.get
def coverData77 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData77 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover77 (i : Fin 28) : Fin 28 := ⟨coverData77.get i % 28, Nat.mod_lt _ (by decide)⟩
def source77 (i : Fin 28) : Fin 28 := ⟨sourceData77.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree77 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 .empty (.cutY 18432 .empty (.cutX 11264 .empty (.cutY 19456 (.cutX 11776 (.cutY 18944 (.cutX 11520 (.cutY 18688 (.cutX 11392 (.cutY 18560 .full .full) (.cutY 18560 (.cutX 11456 (.cutY 18496 .full .full) (.cutY 18496 .full .full)) .full)) .empty) .empty) .empty) .empty) .empty)))) .empty) (.cutY 20480 .empty (.cutX 14336 (.cutY 22528 (.cutX 13312 .empty (.cutY 21504 (.cutX 13824 .empty (.cutY 20992 .empty (.cutX 14080 .empty (.cutY 21248 .empty (.cutX 14208 (.cutY 21376 .full .full) (.cutY 21376 (.cutX 14272 (.cutY 21312 .full .full) (.cutY 21312 .full .full)) .full)))))) .empty)) .empty) .empty))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 .empty (.cutY 10240 .empty (.cutX 19456 (.cutY 11264 .empty (.cutX 18944 (.cutY 11776 (.cutX 18688 (.cutY 11520 (.cutX 18560 (.cutY 11392 .full (.cutX 18496 (.cutY 11456 .full .full) (.cutY 11456 .full .full))) (.cutY 11392 .full .full)) .empty) .empty) .empty) .empty)) .empty))) .empty) (.cutY 12288 .empty (.cutX 22528 (.cutY 14336 (.cutX 21504 (.cutY 13312 .empty (.cutX 20992 .empty (.cutY 13824 .empty (.cutX 21248 .empty (.cutY 14080 .empty (.cutX 21376 (.cutY 14208 .full (.cutX 21312 (.cutY 14272 .full .full) (.cutY 14272 .full .full))) (.cutY 14208 .full .full))))))) .empty) .empty) .empty)))) .empty) .empty))

theorem metadata77 : 0<177315334 ∧ 44<128 ∧ 72<128 ∧ 1<4 ∧
    7928/4160=1 ∧ 7928%4160=3768 ∧ ∀ i, (leaves77 i).Valid 8 := by
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

noncomputable def phaseMass77 : ℝ := singlePhaseMass (177315334/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw77 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass77_eq : phaseMass77 = (88657667/819200000000 : ℝ) := by
  unfold phaseMass77
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw77 output77 cover77 source77
    (gridTreeUnionCheck_sound 32768 raw77 output77 cover77 source77 tree77 checked77)
    _ (by norm_num) _, areaUnits77]
  norm_num

-- Frozen phase 3974, atom 1847, type 0, source (16,55).
def leavesData78 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves78 : Fin 4 → DyadicLeaf := leavesData78.get
def raw78 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 16 55 leaves78 i
def outputData78 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨4096,4224,14080,14208⟩) (.single ⟨4096,4224,14208,14336⟩)) (.node (.single ⟨4224,4352,14080,14208⟩) (.single ⟨4224,4352,14208,14336⟩))) (.node (.node (.single ⟨14080,14208,4096,4224⟩) (.single ⟨14080,14208,4224,4352⟩)) (.node (.single ⟨14208,14336,4096,4224⟩) (.single ⟨14208,14336,4224,4352⟩)))) (.node (.node (.node (.single ⟨18432,18560,28416,28544⟩) (.single ⟨18432,18560,28544,28672⟩)) (.node (.single ⟨18560,18688,28416,28544⟩) (.single ⟨18560,18688,28544,28672⟩))) (.node (.node (.single ⟨28416,28544,18432,18560⟩) (.single ⟨28416,28544,18560,18688⟩)) (.node (.single ⟨28544,28672,18432,18560⟩) (.single ⟨28544,28672,18560,18688⟩)))))
def output78 : Fin 16 → GridBox := outputData78.get
def coverData78 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData78 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover78 (i : Fin 16) : Fin 16 := ⟨coverData78.get i % 16, Nat.mod_lt _ (by decide)⟩
def source78 (i : Fin 16) : Fin 16 := ⟨sourceData78.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree78 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 (.cutY 14336 (.cutX 5120 (.cutY 13312 .empty (.cutX 4608 (.cutY 13824 .empty (.cutX 4352 (.cutY 14080 .empty (.cutX 4224 (.cutY 14208 .full .full) (.cutY 14208 .full .full))) .empty)) .empty)) .empty) .empty) .empty)))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 (.cutY 6144 (.cutX 13312 .empty (.cutY 5120 (.cutX 13824 .empty (.cutY 4608 (.cutX 14080 .empty (.cutY 4352 (.cutX 14208 (.cutY 4224 .full .full) (.cutY 4224 .full .full)) .empty)) .empty)) .empty)) .empty) .empty))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 .empty (.cutY 26624 .empty (.cutX 19456 (.cutY 27648 .empty (.cutX 18944 (.cutY 28160 .empty (.cutX 18688 (.cutY 28416 .empty (.cutX 18560 (.cutY 28544 .full .full) (.cutY 28544 .full .full))) .empty)) .empty)) .empty))) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 .empty (.cutY 18432 .empty (.cutX 27648 .empty (.cutY 19456 (.cutX 28160 .empty (.cutY 18944 (.cutX 28416 .empty (.cutY 18688 (.cutX 28544 (.cutY 18560 .full .full) (.cutY 18560 .full .full)) .empty)) .empty)) .empty)))) .empty) .empty) .empty))))

theorem metadata78 : 0<204777576 ∧ 16<128 ∧ 55<128 ∧ 0<4 ∧
    1847/4160=0 ∧ 1847%4160=1847 ∧ ∀ i, (leaves78 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData78).mp
    (by decide +kernel)

theorem sourceChecked78_0 : ∀ i : Fin 16,
    (fun i => output78 i = raw78 (source78 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked78 : ∀ i : Fin 16, (fun i => output78 i = raw78 (source78 i)) i :=
  forallFin_of_zero_offset (fun i => output78 i = raw78 (source78 i)) sourceChecked78_0

theorem coverChecked78_0 : ∀ i : Fin 16,
    (fun i => (output78 (cover78 i)).ContainsBox (raw78 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked78 : ∀ i : Fin 16, (fun i => (output78 (cover78 i)).ContainsBox (raw78 i)) i :=
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

noncomputable def phaseMass78 : ℝ := singlePhaseMass (204777576/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw78 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass78_eq : phaseMass78 = (25597197/204800000000 : ℝ) := by
  unfold phaseMass78
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw78 output78 cover78 source78
    (gridTreeUnionCheck_sound 32768 raw78 output78 cover78 source78 tree78 checked78)
    _ (by norm_num) _, areaUnits78]
  norm_num

-- Frozen phase 3975, atom 3491, type 0, source (38,71).
def leavesData79 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves79 : Fin 7 → DyadicLeaf := leavesData79.get
def raw79 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 38 71 leaves79 i
def outputData79 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨9728,9856,18176,18304⟩) (.node (.single ⟨9728,9856,18304,18432⟩) (.single ⟨9856,9920,18176,18240⟩))) (.node (.node (.single ⟨9856,9920,18240,18304⟩) (.single ⟨9920,9984,18176,18240⟩)) (.node (.single ⟨9920,9984,18240,18304⟩) (.single ⟨9856,9984,18304,18432⟩)))) (.node (.node (.single ⟨14336,14464,22784,22912⟩) (.node (.single ⟨14336,14464,22912,23040⟩) (.single ⟨14464,14528,22784,22848⟩))) (.node (.node (.single ⟨14464,14528,22848,22912⟩) (.single ⟨14528,14592,22784,22848⟩)) (.node (.single ⟨14528,14592,22848,22912⟩) (.single ⟨14464,14592,22912,23040⟩))))) (.node (.node (.node (.single ⟨18176,18304,9728,9856⟩) (.node (.single ⟨18176,18240,9856,9920⟩) (.single ⟨18176,18240,9920,9984⟩))) (.node (.node (.single ⟨18240,18304,9856,9920⟩) (.single ⟨18240,18304,9920,9984⟩)) (.node (.single ⟨18304,18432,9728,9856⟩) (.single ⟨18304,18432,9856,9984⟩)))) (.node (.node (.single ⟨22784,22912,14336,14464⟩) (.node (.single ⟨22784,22848,14464,14528⟩) (.single ⟨22784,22848,14528,14592⟩))) (.node (.node (.single ⟨22848,22912,14464,14528⟩) (.single ⟨22848,22912,14528,14592⟩)) (.node (.single ⟨22912,23040,14336,14464⟩) (.single ⟨22912,23040,14464,14592⟩))))))
def output79 : Fin 28 → GridBox := outputData79.get
def coverData79 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData79 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover79 (i : Fin 28) : Fin 28 := ⟨coverData79.get i % 28, Nat.mod_lt _ (by decide)⟩
def source79 (i : Fin 28) : Fin 28 := ⟨sourceData79.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree79 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 (.cutY 18432 (.cutX 9216 .empty (.cutY 17408 .empty (.cutX 9728 .empty (.cutY 17920 .empty (.cutX 9984 (.cutY 18176 .empty (.cutX 9856 (.cutY 18304 .full .full) (.cutY 18304 (.cutX 9920 (.cutY 18240 .full .full) (.cutY 18240 .full .full)) .full))) .empty))))) .empty) .empty) .empty) (.cutY 20480 .empty (.cutX 14336 .empty (.cutY 22528 .empty (.cutX 15360 (.cutY 23552 (.cutX 14848 (.cutY 23040 (.cutX 14592 (.cutY 22784 .empty (.cutX 14464 (.cutY 22912 .full .full) (.cutY 22912 (.cutX 14528 (.cutY 22848 .full .full) (.cutY 22848 .full .full)) .full))) .empty) .empty) .empty) .empty) .empty))))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 (.cutY 10240 (.cutX 17408 .empty (.cutY 9216 .empty (.cutX 17920 .empty (.cutY 9728 .empty (.cutX 18176 .empty (.cutY 9984 (.cutX 18304 (.cutY 9856 .full (.cutX 18240 (.cutY 9920 .full .full) (.cutY 9920 .full .full))) (.cutY 9856 .full .full)) .empty)))))) .empty) .empty) .empty) (.cutY 12288 .empty (.cutX 22528 .empty (.cutY 14336 .empty (.cutX 23552 (.cutY 15360 (.cutX 23040 (.cutY 14848 (.cutX 22784 .empty (.cutY 14592 (.cutX 22912 (.cutY 14464 .full (.cutX 22848 (.cutY 14528 .full .full) (.cutY 14528 .full .full))) (.cutY 14464 .full .full)) .empty)) .empty) .empty) .empty) .empty)))))) .empty) .empty))

theorem metadata79 : 0<167572778 ∧ 38<128 ∧ 71<128 ∧ 0<4 ∧
    3491/4160=0 ∧ 3491%4160=3491 ∧ ∀ i, (leaves79 i).Valid 8 := by
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

noncomputable def phaseMass79 : ℝ := singlePhaseMass (167572778/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw79 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass79_eq : phaseMass79 = (83786389/819200000000 : ℝ) := by
  unfold phaseMass79
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw79 output79 cover79 source79
    (gridTreeUnionCheck_sound 32768 raw79 output79 cover79 source79 tree79 checked79)
    _ (by norm_num) _, areaUnits79]
  norm_num

-- Frozen phase 3976, atom 2635, type 0, source (25,60).
def leavesData80 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves80 : Fin 4 → DyadicLeaf := leavesData80.get
def raw80 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 25 60 leaves80 i
def outputData80 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨6400,6528,15360,15488⟩) (.single ⟨6400,6528,15488,15616⟩)) (.node (.single ⟨6528,6656,15360,15488⟩) (.single ⟨6528,6656,15488,15616⟩))) (.node (.node (.single ⟨15360,15488,6400,6528⟩) (.single ⟨15360,15488,6528,6656⟩)) (.node (.single ⟨15488,15616,6400,6528⟩) (.single ⟨15488,15616,6528,6656⟩)))) (.node (.node (.node (.single ⟨17152,17280,26112,26240⟩) (.single ⟨17152,17280,26240,26368⟩)) (.node (.single ⟨17280,17408,26112,26240⟩) (.single ⟨17280,17408,26240,26368⟩))) (.node (.node (.single ⟨26112,26240,17152,17280⟩) (.single ⟨26112,26240,17280,17408⟩)) (.node (.single ⟨26240,26368,17152,17280⟩) (.single ⟨26240,26368,17280,17408⟩)))))
def output80 : Fin 16 → GridBox := outputData80.get
def coverData80 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData80 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover80 (i : Fin 16) : Fin 16 := ⟨coverData80.get i % 16, Nat.mod_lt _ (by decide)⟩
def source80 (i : Fin 16) : Fin 16 := ⟨sourceData80.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree80 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 .empty (.cutY 14336 .empty (.cutX 7168 (.cutY 15360 .empty (.cutX 6656 (.cutY 15872 (.cutX 6400 .empty (.cutY 15616 (.cutX 6528 (.cutY 15488 .full .full) (.cutY 15488 .full .full)) .empty)) .empty) .empty)) .empty)))))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 .empty (.cutY 6144 .empty (.cutX 15360 .empty (.cutY 7168 (.cutX 15872 (.cutY 6656 (.cutX 15616 (.cutY 6400 .empty (.cutX 15488 (.cutY 6528 .full .full) (.cutY 6528 .full .full))) .empty) .empty) .empty) .empty)))))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 (.cutY 26624 (.cutX 17408 (.cutY 25600 .empty (.cutX 16896 .empty (.cutY 26112 .empty (.cutX 17152 .empty (.cutY 26368 (.cutX 17280 (.cutY 26240 .full .full) (.cutY 26240 .full .full)) .empty))))) .empty) .empty) .empty) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 (.cutY 18432 (.cutX 25600 .empty (.cutY 17408 (.cutX 26112 .empty (.cutY 16896 .empty (.cutX 26368 (.cutY 17152 .empty (.cutX 26240 (.cutY 17280 .full .full) (.cutY 17280 .full .full))) .empty))) .empty)) .empty) .empty) .empty) .empty) .empty))))

theorem metadata80 : 0<29910597 ∧ 25<128 ∧ 60<128 ∧ 0<4 ∧
    2635/4160=0 ∧ 2635%4160=2635 ∧ ∀ i, (leaves80 i).Valid 8 := by
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

noncomputable def phaseMass80 : ℝ := singlePhaseMass (29910597/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw80 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass80_eq : phaseMass80 = (29910597/1638400000000 : ℝ) := by
  unfold phaseMass80
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw80 output80 cover80 source80
    (gridTreeUnionCheck_sound 32768 raw80 output80 cover80 source80 tree80 checked80)
    _ (by norm_num) _, areaUnits80]
  norm_num

-- Frozen phase 3977, atom 1445, type 0, source (12,53).
def leavesData81 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves81 : Fin 4 → DyadicLeaf := leavesData81.get
def raw81 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 12 53 leaves81 i
def outputData81 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨3072,3200,13568,13696⟩) (.single ⟨3072,3200,13696,13824⟩)) (.node (.single ⟨3200,3328,13568,13696⟩) (.single ⟨3200,3328,13696,13824⟩))) (.node (.node (.single ⟨13568,13696,3072,3200⟩) (.single ⟨13568,13696,3200,3328⟩)) (.node (.single ⟨13696,13824,3072,3200⟩) (.single ⟨13696,13824,3200,3328⟩)))) (.node (.node (.node (.single ⟨18944,19072,29440,29568⟩) (.single ⟨18944,19072,29568,29696⟩)) (.node (.single ⟨19072,19200,29440,29568⟩) (.single ⟨19072,19200,29568,29696⟩))) (.node (.node (.single ⟨29440,29568,18944,19072⟩) (.single ⟨29440,29568,19072,19200⟩)) (.node (.single ⟨29568,29696,18944,19072⟩) (.single ⟨29568,29696,19072,19200⟩)))))
def output81 : Fin 16 → GridBox := outputData81.get
def coverData81 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData81 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover81 (i : Fin 16) : Fin 16 := ⟨coverData81.get i % 16, Nat.mod_lt _ (by decide)⟩
def source81 (i : Fin 16) : Fin 16 := ⟨sourceData81.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree81 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 (.cutX 3072 .empty (.cutY 13312 .empty (.cutX 3584 (.cutY 13824 (.cutX 3328 (.cutY 13568 .empty (.cutX 3200 (.cutY 13696 .full .full) (.cutY 13696 .full .full))) .empty) .empty) .empty))) .empty))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 (.cutY 2048 .empty (.cutX 13312 .empty (.cutY 3072 .empty (.cutX 13824 (.cutY 3584 (.cutX 13568 .empty (.cutY 3328 (.cutX 13696 (.cutY 3200 .full .full) (.cutY 3200 .full .full)) .empty)) .empty) .empty)))) .empty) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 .empty (.cutY 30720 (.cutX 19456 (.cutY 29696 (.cutX 18944 .empty (.cutY 29184 .empty (.cutX 19200 (.cutY 29440 .empty (.cutX 19072 (.cutY 29568 .full .full) (.cutY 29568 .full .full))) .empty))) .empty) .empty) .empty))) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 .empty (.cutX 29696 (.cutY 19456 (.cutX 29184 .empty (.cutY 18944 .empty (.cutX 29440 .empty (.cutY 19200 (.cutX 29568 (.cutY 19072 .full .full) (.cutY 19072 .full .full)) .empty)))) .empty) .empty)) .empty) .empty)) .empty))))

theorem metadata81 : 0<206808448 ∧ 12<128 ∧ 53<128 ∧ 0<4 ∧
    1445/4160=0 ∧ 1445%4160=1445 ∧ ∀ i, (leaves81 i).Valid 8 := by
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

noncomputable def phaseMass81 : ℝ := singlePhaseMass (206808448/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw81 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass81_eq : phaseMass81 = (1615691/12800000000 : ℝ) := by
  unfold phaseMass81
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw81 output81 cover81 source81
    (gridTreeUnionCheck_sound 32768 raw81 output81 cover81 source81 tree81 checked81)
    _ (by norm_num) _, areaUnits81]
  norm_num

-- Frozen phase 3978, atom 1650, type 0, source (14,54).
def leavesData82 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves82 : Fin 4 → DyadicLeaf := leavesData82.get
def raw82 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 14 54 leaves82 i
def outputData82 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨3584,3712,13824,13952⟩) (.single ⟨3584,3712,13952,14080⟩)) (.node (.single ⟨3712,3840,13824,13952⟩) (.single ⟨3712,3840,13952,14080⟩))) (.node (.node (.single ⟨13824,13952,3584,3712⟩) (.single ⟨13824,13952,3712,3840⟩)) (.node (.single ⟨13952,14080,3584,3712⟩) (.single ⟨13952,14080,3712,3840⟩)))) (.node (.node (.node (.single ⟨18688,18816,28928,29056⟩) (.single ⟨18688,18816,29056,29184⟩)) (.node (.single ⟨18816,18944,28928,29056⟩) (.single ⟨18816,18944,29056,29184⟩))) (.node (.node (.single ⟨28928,29056,18688,18816⟩) (.single ⟨28928,29056,18816,18944⟩)) (.node (.single ⟨29056,29184,18688,18816⟩) (.single ⟨29056,29184,18816,18944⟩)))))
def output82 : Fin 16 → GridBox := outputData82.get
def coverData82 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData82 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover82 (i : Fin 16) : Fin 16 := ⟨coverData82.get i % 16, Nat.mod_lt _ (by decide)⟩
def source82 (i : Fin 16) : Fin 16 := ⟨sourceData82.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree82 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 (.cutX 3072 .empty (.cutY 13312 .empty (.cutX 3584 .empty (.cutY 13824 .empty (.cutX 3840 (.cutY 14080 (.cutX 3712 (.cutY 13952 .full .full) (.cutY 13952 .full .full)) .empty) .empty))))) .empty))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 (.cutY 2048 .empty (.cutX 13312 .empty (.cutY 3072 .empty (.cutX 13824 .empty (.cutY 3584 .empty (.cutX 14080 (.cutY 3840 (.cutX 13952 (.cutY 3712 .full .full) (.cutY 3712 .full .full)) .empty) .empty)))))) .empty) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 .empty (.cutY 30720 (.cutX 19456 (.cutY 29696 (.cutX 18944 (.cutY 29184 (.cutX 18688 .empty (.cutY 28928 .empty (.cutX 18816 (.cutY 29056 .full .full) (.cutY 29056 .full .full)))) .empty) .empty) .empty) .empty) .empty))) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 .empty (.cutX 29696 (.cutY 19456 (.cutX 29184 (.cutY 18944 (.cutX 28928 .empty (.cutY 18688 .empty (.cutX 29056 (.cutY 18816 .full .full) (.cutY 18816 .full .full)))) .empty) .empty) .empty) .empty)) .empty) .empty)) .empty))))

theorem metadata82 : 0<206808448 ∧ 14<128 ∧ 54<128 ∧ 0<4 ∧
    1650/4160=0 ∧ 1650%4160=1650 ∧ ∀ i, (leaves82 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData82).mp
    (by decide +kernel)

theorem sourceChecked82_0 : ∀ i : Fin 16,
    (fun i => output82 i = raw82 (source82 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked82 : ∀ i : Fin 16, (fun i => output82 i = raw82 (source82 i)) i :=
  forallFin_of_zero_offset (fun i => output82 i = raw82 (source82 i)) sourceChecked82_0

theorem coverChecked82_0 : ∀ i : Fin 16,
    (fun i => (output82 (cover82 i)).ContainsBox (raw82 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked82 : ∀ i : Fin 16, (fun i => (output82 (cover82 i)).ContainsBox (raw82 i)) i :=
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

noncomputable def phaseMass82 : ℝ := singlePhaseMass (206808448/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw82 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass82_eq : phaseMass82 = (1615691/12800000000 : ℝ) := by
  unfold phaseMass82
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw82 output82 cover82 source82
    (gridTreeUnionCheck_sound 32768 raw82 output82 cover82 source82 tree82 checked82)
    _ (by norm_num) _, areaUnits82]
  norm_num

-- Frozen phase 3979, atom 2474, type 0, source (23,59).
def leavesData83 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves83 : Fin 4 → DyadicLeaf := leavesData83.get
def raw83 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 23 59 leaves83 i
def outputData83 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨5888,6016,15104,15232⟩) (.single ⟨5888,6016,15232,15360⟩)) (.node (.single ⟨6016,6144,15104,15232⟩) (.single ⟨6016,6144,15232,15360⟩))) (.node (.node (.single ⟨15104,15232,5888,6016⟩) (.single ⟨15104,15232,6016,6144⟩)) (.node (.single ⟨15232,15360,5888,6016⟩) (.single ⟨15232,15360,6016,6144⟩)))) (.node (.node (.node (.single ⟨17408,17536,26624,26752⟩) (.single ⟨17408,17536,26752,26880⟩)) (.node (.single ⟨17536,17664,26624,26752⟩) (.single ⟨17536,17664,26752,26880⟩))) (.node (.node (.single ⟨26624,26752,17408,17536⟩) (.single ⟨26624,26752,17536,17664⟩)) (.node (.single ⟨26752,26880,17408,17536⟩) (.single ⟨26752,26880,17536,17664⟩)))))
def output83 : Fin 16 → GridBox := outputData83.get
def coverData83 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData83 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover83 (i : Fin 16) : Fin 16 := ⟨coverData83.get i % 16, Nat.mod_lt _ (by decide)⟩
def source83 (i : Fin 16) : Fin 16 := ⟨sourceData83.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree83 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 (.cutY 14336 .empty (.cutX 5120 .empty (.cutY 15360 (.cutX 5632 .empty (.cutY 14848 .empty (.cutX 5888 .empty (.cutY 15104 .empty (.cutX 6016 (.cutY 15232 .full .full) (.cutY 15232 .full .full)))))) .empty))) .empty)))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 .empty (.cutY 6144 (.cutX 15360 (.cutY 5120 .empty (.cutX 14848 .empty (.cutY 5632 .empty (.cutX 15104 .empty (.cutY 5888 .empty (.cutX 15232 (.cutY 6016 .full .full) (.cutY 6016 .full .full))))))) .empty) .empty)))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 (.cutY 26624 .empty (.cutX 17408 .empty (.cutY 27648 (.cutX 17920 (.cutY 27136 (.cutX 17664 (.cutY 26880 (.cutX 17536 (.cutY 26752 .full .full) (.cutY 26752 .full .full)) .empty) .empty) .empty) .empty) .empty))) .empty) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 .empty (.cutY 18432 (.cutX 27648 (.cutY 17408 .empty (.cutX 27136 (.cutY 17920 (.cutX 26880 (.cutY 17664 (.cutX 26752 (.cutY 17536 .full .full) (.cutY 17536 .full .full)) .empty) .empty) .empty) .empty)) .empty) .empty)) .empty) .empty) .empty))))

theorem metadata83 : 0<185830537 ∧ 23<128 ∧ 59<128 ∧ 0<4 ∧
    2474/4160=0 ∧ 2474%4160=2474 ∧ ∀ i, (leaves83 i).Valid 8 := by
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

noncomputable def phaseMass83 : ℝ := singlePhaseMass (185830537/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw83 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass83_eq : phaseMass83 = (185830537/1638400000000 : ℝ) := by
  unfold phaseMass83
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw83 output83 cover83 source83
    (gridTreeUnionCheck_sound 32768 raw83 output83 cover83 source83 tree83 checked83)
    _ (by norm_num) _, areaUnits83]
  norm_num

-- Frozen phase 3980, atom 2305, type 0, source (21,58).
def leavesData84 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves84 : Fin 4 → DyadicLeaf := leavesData84.get
def raw84 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 21 58 leaves84 i
def outputData84 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨5376,5504,14848,14976⟩) (.single ⟨5376,5504,14976,15104⟩)) (.node (.single ⟨5504,5632,14848,14976⟩) (.single ⟨5504,5632,14976,15104⟩))) (.node (.node (.single ⟨14848,14976,5376,5504⟩) (.single ⟨14848,14976,5504,5632⟩)) (.node (.single ⟨14976,15104,5376,5504⟩) (.single ⟨14976,15104,5504,5632⟩)))) (.node (.node (.node (.single ⟨17664,17792,27136,27264⟩) (.single ⟨17664,17792,27264,27392⟩)) (.node (.single ⟨17792,17920,27136,27264⟩) (.single ⟨17792,17920,27264,27392⟩))) (.node (.node (.single ⟨27136,27264,17664,17792⟩) (.single ⟨27136,27264,17792,17920⟩)) (.node (.single ⟨27264,27392,17664,17792⟩) (.single ⟨27264,27392,17792,17920⟩)))))
def output84 : Fin 16 → GridBox := outputData84.get
def coverData84 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData84 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover84 (i : Fin 16) : Fin 16 := ⟨coverData84.get i % 16, Nat.mod_lt _ (by decide)⟩
def source84 (i : Fin 16) : Fin 16 := ⟨sourceData84.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree84 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 (.cutY 14336 .empty (.cutX 5120 .empty (.cutY 15360 (.cutX 5632 (.cutY 14848 .empty (.cutX 5376 .empty (.cutY 15104 (.cutX 5504 (.cutY 14976 .full .full) (.cutY 14976 .full .full)) .empty))) .empty) .empty))) .empty)))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 .empty (.cutY 6144 (.cutX 15360 (.cutY 5120 .empty (.cutX 14848 .empty (.cutY 5632 (.cutX 15104 (.cutY 5376 .empty (.cutX 14976 (.cutY 5504 .full .full) (.cutY 5504 .full .full))) .empty) .empty))) .empty) .empty)))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 (.cutY 26624 .empty (.cutX 17408 .empty (.cutY 27648 (.cutX 17920 (.cutY 27136 .empty (.cutX 17664 .empty (.cutY 27392 (.cutX 17792 (.cutY 27264 .full .full) (.cutY 27264 .full .full)) .empty))) .empty) .empty))) .empty) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 .empty (.cutY 18432 (.cutX 27648 (.cutY 17408 .empty (.cutX 27136 .empty (.cutY 17920 (.cutX 27392 (.cutY 17664 .empty (.cutX 27264 (.cutY 17792 .full .full) (.cutY 17792 .full .full))) .empty) .empty))) .empty) .empty)) .empty) .empty) .empty))))

theorem metadata84 : 0<185830537 ∧ 21<128 ∧ 58<128 ∧ 0<4 ∧
    2305/4160=0 ∧ 2305%4160=2305 ∧ ∀ i, (leaves84 i).Valid 8 := by
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

noncomputable def phaseMass84 : ℝ := singlePhaseMass (185830537/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw84 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass84_eq : phaseMass84 = (185830537/1638400000000 : ℝ) := by
  unfold phaseMass84
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw84 output84 cover84 source84
    (gridTreeUnionCheck_sound 32768 raw84 output84 cover84 source84 tree84 checked84)
    _ (by norm_num) _, areaUnits84]
  norm_num

-- Frozen phase 3981, atom 3543, type 0, source (39,72).
def leavesData85 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves85 : Fin 7 → DyadicLeaf := leavesData85.get
def raw85 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 39 72 leaves85 i
def outputData85 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨9984,10112,18432,18560⟩) (.node (.single ⟨9984,10112,18560,18688⟩) (.single ⟨10112,10176,18432,18496⟩))) (.node (.node (.single ⟨10112,10176,18496,18560⟩) (.single ⟨10176,10240,18432,18496⟩)) (.node (.single ⟨10176,10240,18496,18560⟩) (.single ⟨10112,10240,18560,18688⟩)))) (.node (.node (.single ⟨14080,14208,22528,22656⟩) (.node (.single ⟨14080,14208,22656,22784⟩) (.single ⟨14208,14272,22528,22592⟩))) (.node (.node (.single ⟨14208,14272,22592,22656⟩) (.single ⟨14272,14336,22528,22592⟩)) (.node (.single ⟨14272,14336,22592,22656⟩) (.single ⟨14208,14336,22656,22784⟩))))) (.node (.node (.node (.single ⟨18432,18560,9984,10112⟩) (.node (.single ⟨18432,18496,10112,10176⟩) (.single ⟨18432,18496,10176,10240⟩))) (.node (.node (.single ⟨18496,18560,10112,10176⟩) (.single ⟨18496,18560,10176,10240⟩)) (.node (.single ⟨18560,18688,9984,10112⟩) (.single ⟨18560,18688,10112,10240⟩)))) (.node (.node (.single ⟨22528,22656,14080,14208⟩) (.node (.single ⟨22528,22592,14208,14272⟩) (.single ⟨22528,22592,14272,14336⟩))) (.node (.node (.single ⟨22592,22656,14208,14272⟩) (.single ⟨22592,22656,14272,14336⟩)) (.node (.single ⟨22656,22784,14080,14208⟩) (.single ⟨22656,22784,14208,14336⟩))))))
def output85 : Fin 28 → GridBox := outputData85.get
def coverData85 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData85 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover85 (i : Fin 28) : Fin 28 := ⟨coverData85.get i % 28, Nat.mod_lt _ (by decide)⟩
def source85 (i : Fin 28) : Fin 28 := ⟨sourceData85.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree85 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 (.cutY 18432 .empty (.cutX 9216 .empty (.cutY 19456 (.cutX 9728 .empty (.cutY 18944 (.cutX 9984 .empty (.cutY 18688 (.cutX 10112 (.cutY 18560 .full .full) (.cutY 18560 (.cutX 10176 (.cutY 18496 .full .full) (.cutY 18496 .full .full)) .full)) .empty)) .empty)) .empty))) .empty) .empty) (.cutY 20480 .empty (.cutX 14336 (.cutY 22528 .empty (.cutX 13312 .empty (.cutY 23552 (.cutX 13824 .empty (.cutY 23040 (.cutX 14080 .empty (.cutY 22784 (.cutX 14208 (.cutY 22656 .full .full) (.cutY 22656 (.cutX 14272 (.cutY 22592 .full .full) (.cutY 22592 .full .full)) .full)) .empty)) .empty)) .empty))) .empty))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 .empty (.cutY 10240 (.cutX 19456 (.cutY 9216 .empty (.cutX 18944 (.cutY 9728 .empty (.cutX 18688 (.cutY 9984 .empty (.cutX 18560 (.cutY 10112 .full (.cutX 18496 (.cutY 10176 .full .full) (.cutY 10176 .full .full))) (.cutY 10112 .full .full))) .empty)) .empty)) .empty) .empty)) .empty) (.cutY 12288 .empty (.cutX 22528 .empty (.cutY 14336 (.cutX 23552 (.cutY 13312 .empty (.cutX 23040 (.cutY 13824 .empty (.cutX 22784 (.cutY 14080 .empty (.cutX 22656 (.cutY 14208 .full (.cutX 22592 (.cutY 14272 .full .full) (.cutY 14272 .full .full))) (.cutY 14208 .full .full))) .empty)) .empty)) .empty) .empty))))) .empty) .empty))

theorem metadata85 : 0<109574533 ∧ 39<128 ∧ 72<128 ∧ 0<4 ∧
    3543/4160=0 ∧ 3543%4160=3543 ∧ ∀ i, (leaves85 i).Valid 8 := by
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

noncomputable def phaseMass85 : ℝ := singlePhaseMass (109574533/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw85 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass85_eq : phaseMass85 = (109574533/1638400000000 : ℝ) := by
  unfold phaseMass85
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw85 output85 cover85 source85
    (gridTreeUnionCheck_sound 32768 raw85 output85 cover85 source85 tree85 checked85)
    _ (by norm_num) _, areaUnits85]
  norm_num

-- Frozen phase 3982, atom 3072, type 0, source (31,65).
def leavesData86 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves86 : Fin 4 → DyadicLeaf := leavesData86.get
def raw86 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 31 65 leaves86 i
def outputData86 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨7936,8064,16640,16768⟩) (.single ⟨7936,8064,16768,16896⟩)) (.node (.single ⟨8064,8192,16640,16768⟩) (.single ⟨8064,8192,16768,16896⟩))) (.node (.node (.single ⟨15872,16000,24576,24704⟩) (.single ⟨15872,16000,24704,24832⟩)) (.node (.single ⟨16000,16128,24576,24704⟩) (.single ⟨16000,16128,24704,24832⟩)))) (.node (.node (.node (.single ⟨16640,16768,7936,8064⟩) (.single ⟨16640,16768,8064,8192⟩)) (.node (.single ⟨16768,16896,7936,8064⟩) (.single ⟨16768,16896,8064,8192⟩))) (.node (.node (.single ⟨24576,24704,15872,16000⟩) (.single ⟨24576,24704,16000,16128⟩)) (.node (.single ⟨24704,24832,15872,16000⟩) (.single ⟨24704,24832,16000,16128⟩)))))
def output86 : Fin 16 → GridBox := outputData86.get
def coverData86 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData86 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover86 (i : Fin 16) : Fin 16 := ⟨coverData86.get i % 16, Nat.mod_lt _ (by decide)⟩
def source86 (i : Fin 16) : Fin 16 := ⟨sourceData86.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree86 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 (.cutX 7168 .empty (.cutY 17408 (.cutX 7680 .empty (.cutY 16896 (.cutX 7936 .empty (.cutY 16640 .empty (.cutX 8064 (.cutY 16768 .full .full) (.cutY 16768 .full .full)))) .empty)) .empty)) .empty)) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 (.cutX 15360 .empty (.cutY 25600 (.cutX 15872 .empty (.cutY 25088 (.cutX 16128 (.cutY 24832 (.cutX 16000 (.cutY 24704 .full .full) (.cutY 24704 .full .full)) .empty) .empty) .empty)) .empty)) .empty)) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 .empty (.cutX 17408 (.cutY 7168 .empty (.cutX 16896 (.cutY 7680 .empty (.cutX 16640 .empty (.cutY 7936 .empty (.cutX 16768 (.cutY 8064 .full .full) (.cutY 8064 .full .full))))) .empty)) .empty)) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 .empty (.cutX 25600 (.cutY 15360 .empty (.cutX 25088 (.cutY 15872 .empty (.cutX 24832 (.cutY 16128 (.cutX 24704 (.cutY 16000 .full .full) (.cutY 16000 .full .full)) .empty) .empty)) .empty)) .empty)) .empty)) .empty))) .empty))

theorem metadata86 : 0<170092456 ∧ 31<128 ∧ 65<128 ∧ 0<4 ∧
    3072/4160=0 ∧ 3072%4160=3072 ∧ ∀ i, (leaves86 i).Valid 8 := by
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

noncomputable def phaseMass86 : ℝ := singlePhaseMass (170092456/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw86 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass86_eq : phaseMass86 = (21261557/204800000000 : ℝ) := by
  unfold phaseMass86
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw86 output86 cover86 source86
    (gridTreeUnionCheck_sound 32768 raw86 output86 cover86 source86 tree86 checked86)
    _ (by norm_num) _, areaUnits86]
  norm_num

-- Frozen phase 3983, atom 3004, type 0, source (30,64).
def leavesData87 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves87 : Fin 4 → DyadicLeaf := leavesData87.get
def raw87 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 30 64 leaves87 i
def outputData87 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨7680,7808,16384,16512⟩) (.single ⟨7680,7808,16512,16640⟩)) (.node (.single ⟨7808,7936,16384,16512⟩) (.single ⟨7808,7936,16512,16640⟩))) (.node (.node (.single ⟨16128,16256,24832,24960⟩) (.single ⟨16128,16256,24960,25088⟩)) (.node (.single ⟨16256,16384,24832,24960⟩) (.single ⟨16256,16384,24960,25088⟩)))) (.node (.node (.node (.single ⟨16384,16512,7680,7808⟩) (.single ⟨16384,16512,7808,7936⟩)) (.node (.single ⟨16512,16640,7680,7808⟩) (.single ⟨16512,16640,7808,7936⟩))) (.node (.node (.single ⟨24832,24960,16128,16256⟩) (.single ⟨24832,24960,16256,16384⟩)) (.node (.single ⟨24960,25088,16128,16256⟩) (.single ⟨24960,25088,16256,16384⟩)))))
def output87 : Fin 16 → GridBox := outputData87.get
def coverData87 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData87 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover87 (i : Fin 16) : Fin 16 := ⟨coverData87.get i % 16, Nat.mod_lt _ (by decide)⟩
def source87 (i : Fin 16) : Fin 16 := ⟨sourceData87.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree87 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 (.cutX 7168 .empty (.cutY 17408 (.cutX 7680 .empty (.cutY 16896 (.cutX 7936 (.cutY 16640 (.cutX 7808 (.cutY 16512 .full .full) (.cutY 16512 .full .full)) .empty) .empty) .empty)) .empty)) .empty)) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 (.cutX 15360 .empty (.cutY 25600 (.cutX 15872 .empty (.cutY 25088 (.cutX 16128 .empty (.cutY 24832 .empty (.cutX 16256 (.cutY 24960 .full .full) (.cutY 24960 .full .full)))) .empty)) .empty)) .empty)) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 .empty (.cutX 17408 (.cutY 7168 .empty (.cutX 16896 (.cutY 7680 .empty (.cutX 16640 (.cutY 7936 (.cutX 16512 (.cutY 7808 .full .full) (.cutY 7808 .full .full)) .empty) .empty)) .empty)) .empty)) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 .empty (.cutX 25600 (.cutY 15360 .empty (.cutX 25088 (.cutY 15872 .empty (.cutX 24832 .empty (.cutY 16128 .empty (.cutX 24960 (.cutY 16256 .full .full) (.cutY 16256 .full .full))))) .empty)) .empty)) .empty)) .empty))) .empty))

theorem metadata87 : 0<170092456 ∧ 30<128 ∧ 64<128 ∧ 0<4 ∧
    3004/4160=0 ∧ 3004%4160=3004 ∧ ∀ i, (leaves87 i).Valid 8 := by
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

noncomputable def phaseMass87 : ℝ := singlePhaseMass (170092456/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw87 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass87_eq : phaseMass87 = (21261557/204800000000 : ℝ) := by
  unfold phaseMass87
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw87 output87 cover87 source87
    (gridTreeUnionCheck_sound 32768 raw87 output87 cover87 source87 tree87 checked87)
    _ (by norm_num) _, areaUnits87]
  norm_num

-- Frozen phase 3984, atom 3593, type 0, source (40,73).
def leavesData88 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves88 : Fin 7 → DyadicLeaf := leavesData88.get
def raw88 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 40 73 leaves88 i
def outputData88 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨10240,10368,18688,18816⟩) (.node (.single ⟨10240,10368,18816,18944⟩) (.single ⟨10368,10432,18688,18752⟩))) (.node (.node (.single ⟨10368,10432,18752,18816⟩) (.single ⟨10432,10496,18688,18752⟩)) (.node (.single ⟨10432,10496,18752,18816⟩) (.single ⟨10368,10496,18816,18944⟩)))) (.node (.node (.single ⟨13824,13952,22272,22400⟩) (.node (.single ⟨13824,13952,22400,22528⟩) (.single ⟨13952,14016,22272,22336⟩))) (.node (.node (.single ⟨13952,14016,22336,22400⟩) (.single ⟨14016,14080,22272,22336⟩)) (.node (.single ⟨14016,14080,22336,22400⟩) (.single ⟨13952,14080,22400,22528⟩))))) (.node (.node (.node (.single ⟨18688,18816,10240,10368⟩) (.node (.single ⟨18688,18752,10368,10432⟩) (.single ⟨18688,18752,10432,10496⟩))) (.node (.node (.single ⟨18752,18816,10368,10432⟩) (.single ⟨18752,18816,10432,10496⟩)) (.node (.single ⟨18816,18944,10240,10368⟩) (.single ⟨18816,18944,10368,10496⟩)))) (.node (.node (.single ⟨22272,22400,13824,13952⟩) (.node (.single ⟨22272,22336,13952,14016⟩) (.single ⟨22272,22336,14016,14080⟩))) (.node (.node (.single ⟨22336,22400,13952,14016⟩) (.single ⟨22336,22400,14016,14080⟩)) (.node (.single ⟨22400,22528,13824,13952⟩) (.single ⟨22400,22528,13952,14080⟩))))))
def output88 : Fin 28 → GridBox := outputData88.get
def coverData88 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData88 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover88 (i : Fin 28) : Fin 28 := ⟨coverData88.get i % 28, Nat.mod_lt _ (by decide)⟩
def source88 (i : Fin 28) : Fin 28 := ⟨sourceData88.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree88 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 .empty (.cutY 18432 .empty (.cutX 11264 (.cutY 19456 (.cutX 10752 (.cutY 18944 (.cutX 10496 (.cutY 18688 .empty (.cutX 10368 (.cutY 18816 .full .full) (.cutY 18816 (.cutX 10432 (.cutY 18752 .full .full) (.cutY 18752 .full .full)) .full))) .empty) .empty) .empty) .empty) .empty))) .empty) (.cutY 20480 .empty (.cutX 14336 (.cutY 22528 (.cutX 13312 .empty (.cutY 21504 .empty (.cutX 13824 .empty (.cutY 22016 .empty (.cutX 14080 (.cutY 22272 .empty (.cutX 13952 (.cutY 22400 .full .full) (.cutY 22400 (.cutX 14016 (.cutY 22336 .full .full) (.cutY 22336 .full .full)) .full))) .empty))))) .empty) .empty))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 .empty (.cutY 10240 .empty (.cutX 19456 (.cutY 11264 (.cutX 18944 (.cutY 10752 (.cutX 18688 .empty (.cutY 10496 (.cutX 18816 (.cutY 10368 .full (.cutX 18752 (.cutY 10432 .full .full) (.cutY 10432 .full .full))) (.cutY 10368 .full .full)) .empty)) .empty) .empty) .empty) .empty))) .empty) (.cutY 12288 .empty (.cutX 22528 (.cutY 14336 (.cutX 21504 .empty (.cutY 13312 .empty (.cutX 22016 .empty (.cutY 13824 .empty (.cutX 22272 .empty (.cutY 14080 (.cutX 22400 (.cutY 13952 .full (.cutX 22336 (.cutY 14016 .full .full) (.cutY 14016 .full .full))) (.cutY 13952 .full .full)) .empty)))))) .empty) .empty)))) .empty) .empty))

theorem metadata88 : 0<211618637 ∧ 40<128 ∧ 73<128 ∧ 0<4 ∧
    3593/4160=0 ∧ 3593%4160=3593 ∧ ∀ i, (leaves88 i).Valid 8 := by
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

noncomputable def phaseMass88 : ℝ := singlePhaseMass (211618637/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw88 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass88_eq : phaseMass88 = (211618637/1638400000000 : ℝ) := by
  unfold phaseMass88
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw88 output88 cover88 source88
    (gridTreeUnionCheck_sound 32768 raw88 output88 cover88 source88 tree88 checked88)
    _ (by norm_num) _, areaUnits88]
  norm_num

-- Frozen phase 3985, atom 3641, type 0, source (41,74).
def leavesData89 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves89 : Fin 7 → DyadicLeaf := leavesData89.get
def raw89 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 41 74 leaves89 i
def outputData89 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨10496,10624,18944,19072⟩) (.node (.single ⟨10496,10624,19072,19200⟩) (.single ⟨10624,10688,18944,19008⟩))) (.node (.node (.single ⟨10624,10688,19008,19072⟩) (.single ⟨10688,10752,18944,19008⟩)) (.node (.single ⟨10688,10752,19008,19072⟩) (.single ⟨10624,10752,19072,19200⟩)))) (.node (.node (.single ⟨13568,13696,22016,22144⟩) (.node (.single ⟨13568,13696,22144,22272⟩) (.single ⟨13696,13760,22016,22080⟩))) (.node (.node (.single ⟨13696,13760,22080,22144⟩) (.single ⟨13760,13824,22016,22080⟩)) (.node (.single ⟨13760,13824,22080,22144⟩) (.single ⟨13696,13824,22144,22272⟩))))) (.node (.node (.node (.single ⟨18944,19072,10496,10624⟩) (.node (.single ⟨18944,19008,10624,10688⟩) (.single ⟨18944,19008,10688,10752⟩))) (.node (.node (.single ⟨19008,19072,10624,10688⟩) (.single ⟨19008,19072,10688,10752⟩)) (.node (.single ⟨19072,19200,10496,10624⟩) (.single ⟨19072,19200,10624,10752⟩)))) (.node (.node (.single ⟨22016,22144,13568,13696⟩) (.node (.single ⟨22016,22080,13696,13760⟩) (.single ⟨22016,22080,13760,13824⟩))) (.node (.node (.single ⟨22080,22144,13696,13760⟩) (.single ⟨22080,22144,13760,13824⟩)) (.node (.single ⟨22144,22272,13568,13696⟩) (.single ⟨22144,22272,13696,13824⟩))))))
def output89 : Fin 28 → GridBox := outputData89.get
def coverData89 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData89 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover89 (i : Fin 28) : Fin 28 := ⟨coverData89.get i % 28, Nat.mod_lt _ (by decide)⟩
def source89 (i : Fin 28) : Fin 28 := ⟨sourceData89.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree89 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 .empty (.cutY 18432 .empty (.cutX 11264 (.cutY 19456 (.cutX 10752 (.cutY 18944 .empty (.cutX 10496 .empty (.cutY 19200 (.cutX 10624 (.cutY 19072 .full .full) (.cutY 19072 (.cutX 10688 (.cutY 19008 .full .full) (.cutY 19008 .full .full)) .full)) .empty))) .empty) .empty) .empty))) .empty) (.cutY 20480 .empty (.cutX 14336 (.cutY 22528 (.cutX 13312 .empty (.cutY 21504 .empty (.cutX 13824 (.cutY 22016 .empty (.cutX 13568 .empty (.cutY 22272 (.cutX 13696 (.cutY 22144 .full .full) (.cutY 22144 (.cutX 13760 (.cutY 22080 .full .full) (.cutY 22080 .full .full)) .full)) .empty))) .empty))) .empty) .empty))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 .empty (.cutY 10240 .empty (.cutX 19456 (.cutY 11264 (.cutX 18944 .empty (.cutY 10752 (.cutX 19200 (.cutY 10496 .empty (.cutX 19072 (.cutY 10624 .full (.cutX 19008 (.cutY 10688 .full .full) (.cutY 10688 .full .full))) (.cutY 10624 .full .full))) .empty) .empty)) .empty) .empty))) .empty) (.cutY 12288 .empty (.cutX 22528 (.cutY 14336 (.cutX 21504 .empty (.cutY 13312 .empty (.cutX 22016 .empty (.cutY 13824 (.cutX 22272 (.cutY 13568 .empty (.cutX 22144 (.cutY 13696 .full (.cutX 22080 (.cutY 13760 .full .full) (.cutY 13760 .full .full))) (.cutY 13696 .full .full))) .empty) .empty)))) .empty) .empty)))) .empty) .empty))

theorem metadata89 : 0<211618637 ∧ 41<128 ∧ 74<128 ∧ 0<4 ∧
    3641/4160=0 ∧ 3641%4160=3641 ∧ ∀ i, (leaves89 i).Valid 8 := by
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

noncomputable def phaseMass89 : ℝ := singlePhaseMass (211618637/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw89 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass89_eq : phaseMass89 = (211618637/1638400000000 : ℝ) := by
  unfold phaseMass89
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw89 output89 cover89 source89
    (gridTreeUnionCheck_sound 32768 raw89 output89 cover89 source89 tree89 checked89)
    _ (by norm_num) _, areaUnits89]
  norm_num

-- Frozen phase 3986, atom 7796, type 1, source (41,69).
def leavesData90 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves90 : Fin 7 → DyadicLeaf := leavesData90.get
def raw90 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 41 69 leaves90 i
def outputData90 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨10496,10624,17664,17792⟩) (.node (.single ⟨10496,10624,17792,17920⟩) (.single ⟨10624,10688,17664,17728⟩))) (.node (.node (.single ⟨10624,10688,17728,17792⟩) (.single ⟨10688,10752,17664,17728⟩)) (.node (.single ⟨10688,10752,17728,17792⟩) (.single ⟨10624,10752,17792,17920⟩)))) (.node (.node (.single ⟨14848,14976,22016,22144⟩) (.node (.single ⟨14848,14976,22144,22272⟩) (.single ⟨14976,15040,22016,22080⟩))) (.node (.node (.single ⟨14976,15040,22080,22144⟩) (.single ⟨15040,15104,22016,22080⟩)) (.node (.single ⟨15040,15104,22080,22144⟩) (.single ⟨14976,15104,22144,22272⟩))))) (.node (.node (.node (.single ⟨17664,17792,10496,10624⟩) (.node (.single ⟨17664,17728,10624,10688⟩) (.single ⟨17664,17728,10688,10752⟩))) (.node (.node (.single ⟨17728,17792,10624,10688⟩) (.single ⟨17728,17792,10688,10752⟩)) (.node (.single ⟨17792,17920,10496,10624⟩) (.single ⟨17792,17920,10624,10752⟩)))) (.node (.node (.single ⟨22016,22144,14848,14976⟩) (.node (.single ⟨22016,22080,14976,15040⟩) (.single ⟨22016,22080,15040,15104⟩))) (.node (.node (.single ⟨22080,22144,14976,15040⟩) (.single ⟨22080,22144,15040,15104⟩)) (.node (.single ⟨22144,22272,14848,14976⟩) (.single ⟨22144,22272,14976,15104⟩))))))
def output90 : Fin 28 → GridBox := outputData90.get
def coverData90 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData90 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover90 (i : Fin 28) : Fin 28 := ⟨coverData90.get i % 28, Nat.mod_lt _ (by decide)⟩
def source90 (i : Fin 28) : Fin 28 := ⟨sourceData90.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree90 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 .empty (.cutY 18432 (.cutX 11264 (.cutY 17408 .empty (.cutX 10752 (.cutY 17920 (.cutX 10496 .empty (.cutY 17664 .empty (.cutX 10624 (.cutY 17792 .full .full) (.cutY 17792 (.cutX 10688 (.cutY 17728 .full .full) (.cutY 17728 .full .full)) .full)))) .empty) .empty)) .empty) .empty)) .empty) (.cutY 20480 .empty (.cutX 14336 .empty (.cutY 22528 (.cutX 15360 (.cutY 21504 .empty (.cutX 14848 .empty (.cutY 22016 .empty (.cutX 15104 (.cutY 22272 (.cutX 14976 (.cutY 22144 .full .full) (.cutY 22144 (.cutX 15040 (.cutY 22080 .full .full) (.cutY 22080 .full .full)) .full)) .empty) .empty)))) .empty) .empty)))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 (.cutY 10240 .empty (.cutX 17408 .empty (.cutY 11264 (.cutX 17920 (.cutY 10752 (.cutX 17664 .empty (.cutY 10496 .empty (.cutX 17792 (.cutY 10624 .full (.cutX 17728 (.cutY 10688 .full .full) (.cutY 10688 .full .full))) (.cutY 10624 .full .full)))) .empty) .empty) .empty))) .empty) .empty) (.cutY 12288 .empty (.cutX 22528 (.cutY 14336 .empty (.cutX 21504 .empty (.cutY 15360 (.cutX 22016 .empty (.cutY 14848 .empty (.cutX 22272 (.cutY 15104 (.cutX 22144 (.cutY 14976 .full (.cutX 22080 (.cutY 15040 .full .full) (.cutY 15040 .full .full))) (.cutY 14976 .full .full)) .empty) .empty))) .empty))) .empty)))) .empty) .empty))

theorem metadata90 : 0<50021215 ∧ 41<128 ∧ 69<128 ∧ 1<4 ∧
    7796/4160=1 ∧ 7796%4160=3636 ∧ ∀ i, (leaves90 i).Valid 8 := by
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

noncomputable def phaseMass90 : ℝ := singlePhaseMass (50021215/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw90 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass90_eq : phaseMass90 = (10004243/327680000000 : ℝ) := by
  unfold phaseMass90
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw90 output90 cover90 source90
    (gridTreeUnionCheck_sound 32768 raw90 output90 cover90 source90 tree90 checked90)
    _ (by norm_num) _, areaUnits90]
  norm_num

-- Frozen phase 3987, atom 3687, type 0, source (42,75).
def leavesData91 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves91 : Fin 7 → DyadicLeaf := leavesData91.get
def raw91 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 42 75 leaves91 i
def outputData91 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨10752,10880,19200,19328⟩) (.node (.single ⟨10752,10880,19328,19456⟩) (.single ⟨10880,10944,19200,19264⟩))) (.node (.node (.single ⟨10880,10944,19264,19328⟩) (.single ⟨10944,11008,19200,19264⟩)) (.node (.single ⟨10944,11008,19264,19328⟩) (.single ⟨10880,11008,19328,19456⟩)))) (.node (.node (.single ⟨13312,13440,21760,21888⟩) (.node (.single ⟨13312,13440,21888,22016⟩) (.single ⟨13440,13504,21760,21824⟩))) (.node (.node (.single ⟨13440,13504,21824,21888⟩) (.single ⟨13504,13568,21760,21824⟩)) (.node (.single ⟨13504,13568,21824,21888⟩) (.single ⟨13440,13568,21888,22016⟩))))) (.node (.node (.node (.single ⟨19200,19328,10752,10880⟩) (.node (.single ⟨19200,19264,10880,10944⟩) (.single ⟨19200,19264,10944,11008⟩))) (.node (.node (.single ⟨19264,19328,10880,10944⟩) (.single ⟨19264,19328,10944,11008⟩)) (.node (.single ⟨19328,19456,10752,10880⟩) (.single ⟨19328,19456,10880,11008⟩)))) (.node (.node (.single ⟨21760,21888,13312,13440⟩) (.node (.single ⟨21760,21824,13440,13504⟩) (.single ⟨21760,21824,13504,13568⟩))) (.node (.node (.single ⟨21824,21888,13440,13504⟩) (.single ⟨21824,21888,13504,13568⟩)) (.node (.single ⟨21888,22016,13312,13440⟩) (.single ⟨21888,22016,13440,13568⟩))))))
def output91 : Fin 28 → GridBox := outputData91.get
def coverData91 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData91 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover91 (i : Fin 28) : Fin 28 := ⟨coverData91.get i % 28, Nat.mod_lt _ (by decide)⟩
def source91 (i : Fin 28) : Fin 28 := ⟨sourceData91.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree91 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 .empty (.cutY 18432 .empty (.cutX 11264 (.cutY 19456 (.cutX 10752 .empty (.cutY 18944 .empty (.cutX 11008 (.cutY 19200 .empty (.cutX 10880 (.cutY 19328 .full .full) (.cutY 19328 (.cutX 10944 (.cutY 19264 .full .full) (.cutY 19264 .full .full)) .full))) .empty))) .empty) .empty))) .empty) (.cutY 20480 .empty (.cutX 14336 (.cutY 22528 (.cutX 13312 .empty (.cutY 21504 .empty (.cutX 13824 (.cutY 22016 (.cutX 13568 (.cutY 21760 .empty (.cutX 13440 (.cutY 21888 .full .full) (.cutY 21888 (.cutX 13504 (.cutY 21824 .full .full) (.cutY 21824 .full .full)) .full))) .empty) .empty) .empty))) .empty) .empty))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 .empty (.cutY 10240 .empty (.cutX 19456 (.cutY 11264 (.cutX 18944 .empty (.cutY 10752 .empty (.cutX 19200 .empty (.cutY 11008 (.cutX 19328 (.cutY 10880 .full (.cutX 19264 (.cutY 10944 .full .full) (.cutY 10944 .full .full))) (.cutY 10880 .full .full)) .empty)))) .empty) .empty))) .empty) (.cutY 12288 .empty (.cutX 22528 (.cutY 14336 (.cutX 21504 .empty (.cutY 13312 .empty (.cutX 22016 (.cutY 13824 (.cutX 21760 .empty (.cutY 13568 (.cutX 21888 (.cutY 13440 .full (.cutX 21824 (.cutY 13504 .full .full) (.cutY 13504 .full .full))) (.cutY 13440 .full .full)) .empty)) .empty) .empty))) .empty) .empty)))) .empty) .empty))

theorem metadata91 : 0<211618637 ∧ 42<128 ∧ 75<128 ∧ 0<4 ∧
    3687/4160=0 ∧ 3687%4160=3687 ∧ ∀ i, (leaves91 i).Valid 8 := by
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

noncomputable def phaseMass91 : ℝ := singlePhaseMass (211618637/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw91 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass91_eq : phaseMass91 = (211618637/1638400000000 : ℝ) := by
  unfold phaseMass91
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw91 output91 cover91 source91
    (gridTreeUnionCheck_sound 32768 raw91 output91 cover91 source91 tree91 checked91)
    _ (by norm_num) _, areaUnits91]
  norm_num

-- Frozen phase 3988, atom 2934, type 0, source (29,63).
def leavesData92 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves92 : Fin 4 → DyadicLeaf := leavesData92.get
def raw92 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 29 63 leaves92 i
def outputData92 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨7424,7552,16128,16256⟩) (.single ⟨7424,7552,16256,16384⟩)) (.node (.single ⟨7552,7680,16128,16256⟩) (.single ⟨7552,7680,16256,16384⟩))) (.node (.node (.single ⟨16128,16256,7424,7552⟩) (.single ⟨16128,16256,7552,7680⟩)) (.node (.single ⟨16256,16384,7424,7552⟩) (.single ⟨16256,16384,7552,7680⟩)))) (.node (.node (.node (.single ⟨16384,16512,25088,25216⟩) (.single ⟨16384,16512,25216,25344⟩)) (.node (.single ⟨16512,16640,25088,25216⟩) (.single ⟨16512,16640,25216,25344⟩))) (.node (.node (.single ⟨25088,25216,16384,16512⟩) (.single ⟨25088,25216,16512,16640⟩)) (.node (.single ⟨25216,25344,16384,16512⟩) (.single ⟨25216,25344,16512,16640⟩)))))
def output92 : Fin 16 → GridBox := outputData92.get
def coverData92 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData92 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover92 (i : Fin 16) : Fin 16 := ⟨coverData92.get i % 16, Nat.mod_lt _ (by decide)⟩
def source92 (i : Fin 16) : Fin 16 := ⟨sourceData92.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree92 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 .empty (.cutY 14336 .empty (.cutX 7168 .empty (.cutY 15360 .empty (.cutX 7680 (.cutY 15872 .empty (.cutX 7424 .empty (.cutY 16128 .empty (.cutX 7552 (.cutY 16256 .full .full) (.cutY 16256 .full .full))))) .empty)))))))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 .empty (.cutY 6144 .empty (.cutX 15360 .empty (.cutY 7168 .empty (.cutX 15872 .empty (.cutY 7680 (.cutX 16128 .empty (.cutY 7424 .empty (.cutX 16256 (.cutY 7552 .full .full) (.cutY 7552 .full .full)))) .empty)))))))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 (.cutY 26624 (.cutX 17408 (.cutY 25600 (.cutX 16896 (.cutY 25088 .empty (.cutX 16640 (.cutY 25344 (.cutX 16512 (.cutY 25216 .full .full) (.cutY 25216 .full .full)) .empty) .empty)) .empty) .empty) .empty) .empty) .empty) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 (.cutY 18432 (.cutX 25600 (.cutY 17408 (.cutX 25088 .empty (.cutY 16896 (.cutX 25344 (.cutY 16640 (.cutX 25216 (.cutY 16512 .full .full) (.cutY 16512 .full .full)) .empty) .empty) .empty)) .empty) .empty) .empty) .empty) .empty) .empty) .empty))))

theorem metadata92 : 0<29910597 ∧ 29<128 ∧ 63<128 ∧ 0<4 ∧
    2934/4160=0 ∧ 2934%4160=2934 ∧ ∀ i, (leaves92 i).Valid 8 := by
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

noncomputable def phaseMass92 : ℝ := singlePhaseMass (29910597/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw92 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass92_eq : phaseMass92 = (29910597/1638400000000 : ℝ) := by
  unfold phaseMass92
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw92 output92 cover92 source92
    (gridTreeUnionCheck_sound 32768 raw92 output92 cover92 source92 tree92 checked92)
    _ (by norm_num) _, areaUnits92]
  norm_num

-- Frozen phase 3989, atom 3138, type 0, source (32,66).
def leavesData93 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves93 : Fin 4 → DyadicLeaf := leavesData93.get
def raw93 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 32 66 leaves93 i
def outputData93 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨8192,8320,16896,17024⟩) (.single ⟨8192,8320,17024,17152⟩)) (.node (.single ⟨8320,8448,16896,17024⟩) (.single ⟨8320,8448,17024,17152⟩))) (.node (.node (.single ⟨15616,15744,24320,24448⟩) (.single ⟨15616,15744,24448,24576⟩)) (.node (.single ⟨15744,15872,24320,24448⟩) (.single ⟨15744,15872,24448,24576⟩)))) (.node (.node (.node (.single ⟨16896,17024,8192,8320⟩) (.single ⟨16896,17024,8320,8448⟩)) (.node (.single ⟨17024,17152,8192,8320⟩) (.single ⟨17024,17152,8320,8448⟩))) (.node (.node (.single ⟨24320,24448,15616,15744⟩) (.single ⟨24320,24448,15744,15872⟩)) (.node (.single ⟨24448,24576,15616,15744⟩) (.single ⟨24448,24576,15744,15872⟩)))))
def output93 : Fin 16 → GridBox := outputData93.get
def coverData93 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData93 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover93 (i : Fin 16) : Fin 16 := ⟨coverData93.get i % 16, Nat.mod_lt _ (by decide)⟩
def source93 (i : Fin 16) : Fin 16 := ⟨sourceData93.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree93 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 (.cutY 18432 (.cutX 9216 (.cutY 17408 (.cutX 8704 (.cutY 16896 .empty (.cutX 8448 (.cutY 17152 (.cutX 8320 (.cutY 17024 .full .full) (.cutY 17024 .full .full)) .empty) .empty)) .empty) .empty) .empty) .empty) .empty) .empty) (.cutY 20480 .empty (.cutX 14336 .empty (.cutY 22528 .empty (.cutX 15360 .empty (.cutY 23552 .empty (.cutX 15872 (.cutY 24064 .empty (.cutX 15616 .empty (.cutY 24320 .empty (.cutX 15744 (.cutY 24448 .full .full) (.cutY 24448 .full .full))))) .empty))))))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 (.cutY 10240 (.cutX 17408 (.cutY 9216 (.cutX 16896 .empty (.cutY 8704 (.cutX 17152 (.cutY 8448 (.cutX 17024 (.cutY 8320 .full .full) (.cutY 8320 .full .full)) .empty) .empty) .empty)) .empty) .empty) .empty) .empty) .empty) (.cutY 12288 .empty (.cutX 22528 .empty (.cutY 14336 .empty (.cutX 23552 .empty (.cutY 15360 .empty (.cutX 24064 .empty (.cutY 15872 (.cutX 24320 .empty (.cutY 15616 .empty (.cutX 24448 (.cutY 15744 .full .full) (.cutY 15744 .full .full)))) .empty))))))))) .empty) .empty))

theorem metadata93 : 0<167572778 ∧ 32<128 ∧ 66<128 ∧ 0<4 ∧
    3138/4160=0 ∧ 3138%4160=3138 ∧ ∀ i, (leaves93 i).Valid 8 := by
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

noncomputable def phaseMass93 : ℝ := singlePhaseMass (167572778/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw93 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass93_eq : phaseMass93 = (83786389/819200000000 : ℝ) := by
  unfold phaseMass93
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw93 output93 cover93 source93
    (gridTreeUnionCheck_sound 32768 raw93 output93 cover93 source93 tree93 checked93)
    _ (by norm_num) _, areaUnits93]
  norm_num

-- Frozen phase 3990, atom 3731, type 0, source (43,76).
def leavesData94 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves94 : Fin 4 → DyadicLeaf := leavesData94.get
def raw94 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 43 76 leaves94 i
def outputData94 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨11008,11136,19456,19584⟩) (.single ⟨11008,11136,19584,19712⟩)) (.node (.single ⟨11136,11264,19456,19584⟩) (.single ⟨11136,11264,19584,19712⟩))) (.node (.node (.single ⟨13056,13184,21504,21632⟩) (.single ⟨13056,13184,21632,21760⟩)) (.node (.single ⟨13184,13312,21504,21632⟩) (.single ⟨13184,13312,21632,21760⟩)))) (.node (.node (.node (.single ⟨19456,19584,11008,11136⟩) (.single ⟨19456,19584,11136,11264⟩)) (.node (.single ⟨19584,19712,11008,11136⟩) (.single ⟨19584,19712,11136,11264⟩))) (.node (.node (.single ⟨21504,21632,13056,13184⟩) (.single ⟨21504,21632,13184,13312⟩)) (.node (.single ⟨21632,21760,13056,13184⟩) (.single ⟨21632,21760,13184,13312⟩)))))
def output94 : Fin 16 → GridBox := outputData94.get
def coverData94 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData94 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover94 (i : Fin 16) : Fin 16 := ⟨coverData94.get i % 16, Nat.mod_lt _ (by decide)⟩
def source94 (i : Fin 16) : Fin 16 := ⟨sourceData94.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree94 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 .empty (.cutY 18432 .empty (.cutX 11264 (.cutY 19456 .empty (.cutX 10752 .empty (.cutY 19968 (.cutX 11008 .empty (.cutY 19712 (.cutX 11136 (.cutY 19584 .full .full) (.cutY 19584 .full .full)) .empty)) .empty))) .empty))) .empty) (.cutY 20480 .empty (.cutX 14336 (.cutY 22528 (.cutX 13312 (.cutY 21504 .empty (.cutX 12800 .empty (.cutY 22016 (.cutX 13056 .empty (.cutY 21760 (.cutX 13184 (.cutY 21632 .full .full) (.cutY 21632 .full .full)) .empty)) .empty))) .empty) .empty) .empty))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 .empty (.cutY 10240 .empty (.cutX 19456 .empty (.cutY 11264 (.cutX 19968 (.cutY 10752 .empty (.cutX 19712 (.cutY 11008 .empty (.cutX 19584 (.cutY 11136 .full .full) (.cutY 11136 .full .full))) .empty)) .empty) .empty)))) .empty) (.cutY 12288 .empty (.cutX 22528 (.cutY 14336 (.cutX 21504 .empty (.cutY 13312 (.cutX 22016 (.cutY 12800 .empty (.cutX 21760 (.cutY 13056 .empty (.cutX 21632 (.cutY 13184 .full .full) (.cutY 13184 .full .full))) .empty)) .empty) .empty)) .empty) .empty)))) .empty) .empty))

theorem metadata94 : 0<211618637 ∧ 43<128 ∧ 76<128 ∧ 0<4 ∧
    3731/4160=0 ∧ 3731%4160=3731 ∧ ∀ i, (leaves94 i).Valid 8 := by
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

noncomputable def phaseMass94 : ℝ := singlePhaseMass (211618637/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw94 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass94_eq : phaseMass94 = (211618637/1638400000000 : ℝ) := by
  unfold phaseMass94
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw94 output94 cover94 source94
    (gridTreeUnionCheck_sound 32768 raw94 output94 cover94 source94 tree94 checked94)
    _ (by norm_num) _, areaUnits94]
  norm_num

-- Frozen phase 3991, atom 3773, type 0, source (44,77).
def leavesData95 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves95 : Fin 7 → DyadicLeaf := leavesData95.get
def raw95 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 44 77 leaves95 i
def outputData95 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨11264,11392,19712,19840⟩) (.node (.single ⟨11264,11392,19840,19968⟩) (.single ⟨11392,11456,19712,19776⟩))) (.node (.node (.single ⟨11392,11456,19776,19840⟩) (.single ⟨11456,11520,19712,19776⟩)) (.node (.single ⟨11456,11520,19776,19840⟩) (.single ⟨11392,11520,19840,19968⟩)))) (.node (.node (.single ⟨12800,12928,21248,21376⟩) (.node (.single ⟨12800,12928,21376,21504⟩) (.single ⟨12928,12992,21248,21312⟩))) (.node (.node (.single ⟨12928,12992,21312,21376⟩) (.single ⟨12992,13056,21248,21312⟩)) (.node (.single ⟨12992,13056,21312,21376⟩) (.single ⟨12928,13056,21376,21504⟩))))) (.node (.node (.node (.single ⟨19712,19840,11264,11392⟩) (.node (.single ⟨19712,19776,11392,11456⟩) (.single ⟨19712,19776,11456,11520⟩))) (.node (.node (.single ⟨19776,19840,11392,11456⟩) (.single ⟨19776,19840,11456,11520⟩)) (.node (.single ⟨19840,19968,11264,11392⟩) (.single ⟨19840,19968,11392,11520⟩)))) (.node (.node (.single ⟨21248,21376,12800,12928⟩) (.node (.single ⟨21248,21312,12928,12992⟩) (.single ⟨21248,21312,12992,13056⟩))) (.node (.node (.single ⟨21312,21376,12928,12992⟩) (.single ⟨21312,21376,12992,13056⟩)) (.node (.single ⟨21376,21504,12800,12928⟩) (.single ⟨21376,21504,12928,13056⟩))))))
def output95 : Fin 28 → GridBox := outputData95.get
def coverData95 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData95 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover95 (i : Fin 28) : Fin 28 := ⟨coverData95.get i % 28, Nat.mod_lt _ (by decide)⟩
def source95 (i : Fin 28) : Fin 28 := ⟨sourceData95.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree95 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 .empty (.cutY 18432 .empty (.cutX 11264 .empty (.cutY 19456 .empty (.cutX 11776 (.cutY 19968 (.cutX 11520 (.cutY 19712 .empty (.cutX 11392 (.cutY 19840 .full .full) (.cutY 19840 (.cutX 11456 (.cutY 19776 .full .full) (.cutY 19776 .full .full)) .full))) .empty) .empty) .empty))))) .empty) (.cutY 20480 .empty (.cutX 14336 (.cutY 22528 (.cutX 13312 (.cutY 21504 (.cutX 12800 .empty (.cutY 20992 .empty (.cutX 13056 (.cutY 21248 .empty (.cutX 12928 (.cutY 21376 .full .full) (.cutY 21376 (.cutX 12992 (.cutY 21312 .full .full) (.cutY 21312 .full .full)) .full))) .empty))) .empty) .empty) .empty) .empty))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 .empty (.cutY 10240 .empty (.cutX 19456 .empty (.cutY 11264 .empty (.cutX 19968 (.cutY 11776 (.cutX 19712 .empty (.cutY 11520 (.cutX 19840 (.cutY 11392 .full (.cutX 19776 (.cutY 11456 .full .full) (.cutY 11456 .full .full))) (.cutY 11392 .full .full)) .empty)) .empty) .empty))))) .empty) (.cutY 12288 .empty (.cutX 22528 (.cutY 14336 (.cutX 21504 (.cutY 13312 (.cutX 20992 .empty (.cutY 12800 .empty (.cutX 21248 .empty (.cutY 13056 (.cutX 21376 (.cutY 12928 .full (.cutX 21312 (.cutY 12992 .full .full) (.cutY 12992 .full .full))) (.cutY 12928 .full .full)) .empty)))) .empty) .empty) .empty) .empty)))) .empty) .empty))

theorem metadata95 : 0<211618637 ∧ 44<128 ∧ 77<128 ∧ 0<4 ∧
    3773/4160=0 ∧ 3773%4160=3773 ∧ ∀ i, (leaves95 i).Valid 8 := by
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

noncomputable def phaseMass95 : ℝ := singlePhaseMass (211618637/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw95 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass95_eq : phaseMass95 = (211618637/1638400000000 : ℝ) := by
  unfold phaseMass95
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw95 output95 cover95 source95
    (gridTreeUnionCheck_sound 32768 raw95 output95 cover95 source95 tree95 checked95)
    _ (by norm_num) _, areaUnits95]
  norm_num

-- Frozen phase 3992, atom 3813, type 0, source (45,78).
def leavesData96 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves96 : Fin 7 → DyadicLeaf := leavesData96.get
def raw96 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 45 78 leaves96 i
def outputData96 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨11520,11648,19968,20096⟩) (.node (.single ⟨11520,11648,20096,20224⟩) (.single ⟨11648,11712,19968,20032⟩))) (.node (.node (.single ⟨11648,11712,20032,20096⟩) (.single ⟨11712,11776,19968,20032⟩)) (.node (.single ⟨11712,11776,20032,20096⟩) (.single ⟨11648,11776,20096,20224⟩)))) (.node (.node (.single ⟨12544,12672,20992,21120⟩) (.node (.single ⟨12544,12672,21120,21248⟩) (.single ⟨12672,12736,20992,21056⟩))) (.node (.node (.single ⟨12672,12736,21056,21120⟩) (.single ⟨12736,12800,20992,21056⟩)) (.node (.single ⟨12736,12800,21056,21120⟩) (.single ⟨12672,12800,21120,21248⟩))))) (.node (.node (.node (.single ⟨19968,20096,11520,11648⟩) (.node (.single ⟨19968,20032,11648,11712⟩) (.single ⟨19968,20032,11712,11776⟩))) (.node (.node (.single ⟨20032,20096,11648,11712⟩) (.single ⟨20032,20096,11712,11776⟩)) (.node (.single ⟨20096,20224,11520,11648⟩) (.single ⟨20096,20224,11648,11776⟩)))) (.node (.node (.single ⟨20992,21120,12544,12672⟩) (.node (.single ⟨20992,21056,12672,12736⟩) (.single ⟨20992,21056,12736,12800⟩))) (.node (.node (.single ⟨21056,21120,12672,12736⟩) (.single ⟨21056,21120,12736,12800⟩)) (.node (.single ⟨21120,21248,12544,12672⟩) (.single ⟨21120,21248,12672,12800⟩))))))
def output96 : Fin 28 → GridBox := outputData96.get
def coverData96 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData96 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover96 (i : Fin 28) : Fin 28 := ⟨coverData96.get i % 28, Nat.mod_lt _ (by decide)⟩
def source96 (i : Fin 28) : Fin 28 := ⟨sourceData96.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree96 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 .empty (.cutY 18432 .empty (.cutX 11264 .empty (.cutY 19456 .empty (.cutX 11776 (.cutY 19968 .empty (.cutX 11520 .empty (.cutY 20224 (.cutX 11648 (.cutY 20096 .full .full) (.cutY 20096 (.cutX 11712 (.cutY 20032 .full .full) (.cutY 20032 .full .full)) .full)) .empty))) .empty))))) .empty) (.cutY 20480 .empty (.cutX 14336 (.cutY 22528 (.cutX 13312 (.cutY 21504 (.cutX 12800 (.cutY 20992 .empty (.cutX 12544 .empty (.cutY 21248 (.cutX 12672 (.cutY 21120 .full .full) (.cutY 21120 (.cutX 12736 (.cutY 21056 .full .full) (.cutY 21056 .full .full)) .full)) .empty))) .empty) .empty) .empty) .empty) .empty))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 .empty (.cutY 10240 .empty (.cutX 19456 .empty (.cutY 11264 .empty (.cutX 19968 .empty (.cutY 11776 (.cutX 20224 (.cutY 11520 .empty (.cutX 20096 (.cutY 11648 .full (.cutX 20032 (.cutY 11712 .full .full) (.cutY 11712 .full .full))) (.cutY 11648 .full .full))) .empty) .empty)))))) .empty) (.cutY 12288 .empty (.cutX 22528 (.cutY 14336 (.cutX 21504 (.cutY 13312 (.cutX 20992 .empty (.cutY 12800 (.cutX 21248 (.cutY 12544 .empty (.cutX 21120 (.cutY 12672 .full (.cutX 21056 (.cutY 12736 .full .full) (.cutY 12736 .full .full))) (.cutY 12672 .full .full))) .empty) .empty)) .empty) .empty) .empty) .empty)))) .empty) .empty))

theorem metadata96 : 0<211618637 ∧ 45<128 ∧ 78<128 ∧ 0<4 ∧
    3813/4160=0 ∧ 3813%4160=3813 ∧ ∀ i, (leaves96 i).Valid 8 := by
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

noncomputable def phaseMass96 : ℝ := singlePhaseMass (211618637/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw96 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass96_eq : phaseMass96 = (211618637/1638400000000 : ℝ) := by
  unfold phaseMass96
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw96 output96 cover96 source96
    (gridTreeUnionCheck_sound 32768 raw96 output96 cover96 source96 tree96 checked96)
    _ (by norm_num) _, areaUnits96]
  norm_num

-- Frozen phase 3993, atom 3851, type 0, source (46,79).
def leavesData97 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves97 : Fin 7 → DyadicLeaf := leavesData97.get
def raw97 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 46 79 leaves97 i
def outputData97 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨11776,11904,20224,20352⟩) (.node (.single ⟨11776,11904,20352,20480⟩) (.single ⟨11904,11968,20224,20288⟩))) (.node (.node (.single ⟨11904,11968,20288,20352⟩) (.single ⟨11968,12032,20224,20288⟩)) (.node (.single ⟨11968,12032,20288,20352⟩) (.single ⟨11904,12032,20352,20480⟩)))) (.node (.node (.single ⟨12288,12416,20736,20864⟩) (.node (.single ⟨12288,12416,20864,20992⟩) (.single ⟨12416,12480,20736,20800⟩))) (.node (.node (.single ⟨12416,12480,20800,20864⟩) (.single ⟨12480,12544,20736,20800⟩)) (.node (.single ⟨12480,12544,20800,20864⟩) (.single ⟨12416,12544,20864,20992⟩))))) (.node (.node (.node (.single ⟨20224,20352,11776,11904⟩) (.node (.single ⟨20224,20288,11904,11968⟩) (.single ⟨20224,20288,11968,12032⟩))) (.node (.node (.single ⟨20288,20352,11904,11968⟩) (.single ⟨20288,20352,11968,12032⟩)) (.node (.single ⟨20352,20480,11776,11904⟩) (.single ⟨20352,20480,11904,12032⟩)))) (.node (.node (.single ⟨20736,20864,12288,12416⟩) (.node (.single ⟨20736,20800,12416,12480⟩) (.single ⟨20736,20800,12480,12544⟩))) (.node (.node (.single ⟨20800,20864,12416,12480⟩) (.single ⟨20800,20864,12480,12544⟩)) (.node (.single ⟨20864,20992,12288,12416⟩) (.single ⟨20864,20992,12416,12544⟩))))))
def output97 : Fin 28 → GridBox := outputData97.get
def coverData97 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData97 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover97 (i : Fin 28) : Fin 28 := ⟨coverData97.get i % 28, Nat.mod_lt _ (by decide)⟩
def source97 (i : Fin 28) : Fin 28 := ⟨sourceData97.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree97 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 .empty (.cutY 18432 .empty (.cutX 11264 .empty (.cutY 19456 .empty (.cutX 11776 .empty (.cutY 19968 .empty (.cutX 12032 (.cutY 20224 .empty (.cutX 11904 (.cutY 20352 .full .full) (.cutY 20352 (.cutX 11968 (.cutY 20288 .full .full) (.cutY 20288 .full .full)) .full))) .empty))))))) .empty) (.cutY 20480 .empty (.cutX 14336 (.cutY 22528 (.cutX 13312 (.cutY 21504 (.cutX 12800 (.cutY 20992 (.cutX 12544 (.cutY 20736 .empty (.cutX 12416 (.cutY 20864 .full .full) (.cutY 20864 (.cutX 12480 (.cutY 20800 .full .full) (.cutY 20800 .full .full)) .full))) .empty) .empty) .empty) .empty) .empty) .empty) .empty))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 .empty (.cutY 10240 .empty (.cutX 19456 .empty (.cutY 11264 .empty (.cutX 19968 .empty (.cutY 11776 .empty (.cutX 20224 .empty (.cutY 12032 (.cutX 20352 (.cutY 11904 .full (.cutX 20288 (.cutY 11968 .full .full) (.cutY 11968 .full .full))) (.cutY 11904 .full .full)) .empty)))))))) .empty) (.cutY 12288 .empty (.cutX 22528 (.cutY 14336 (.cutX 21504 (.cutY 13312 (.cutX 20992 (.cutY 12800 (.cutX 20736 .empty (.cutY 12544 (.cutX 20864 (.cutY 12416 .full (.cutX 20800 (.cutY 12480 .full .full) (.cutY 12480 .full .full))) (.cutY 12416 .full .full)) .empty)) .empty) .empty) .empty) .empty) .empty) .empty)))) .empty) .empty))

theorem metadata97 : 0<211618637 ∧ 46<128 ∧ 79<128 ∧ 0<4 ∧
    3851/4160=0 ∧ 3851%4160=3851 ∧ ∀ i, (leaves97 i).Valid 8 := by
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

noncomputable def phaseMass97 : ℝ := singlePhaseMass (211618637/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw97 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass97_eq : phaseMass97 = (211618637/1638400000000 : ℝ) := by
  unfold phaseMass97
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw97 output97 cover97 source97
    (gridTreeUnionCheck_sound 32768 raw97 output97 cover97 source97 tree97 checked97)
    _ (by norm_num) _, areaUnits97]
  norm_num

-- Frozen phase 3994, atom 3887, type 0, source (47,80).
def leavesData98 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves98 : Fin 7 → DyadicLeaf := leavesData98.get
def raw98 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 47 80 leaves98 i
def outputData98 : FiniteInputTree GridBox 14 := (.node (.node (.node (.single ⟨12032,12160,20480,20608⟩) (.node (.single ⟨12032,12160,20608,20736⟩) (.single ⟨12160,12224,20480,20544⟩))) (.node (.node (.single ⟨12160,12224,20544,20608⟩) (.single ⟨12224,12288,20480,20544⟩)) (.node (.single ⟨12224,12288,20544,20608⟩) (.single ⟨12160,12288,20608,20736⟩)))) (.node (.node (.single ⟨20480,20608,12032,12160⟩) (.node (.single ⟨20480,20544,12160,12224⟩) (.single ⟨20480,20544,12224,12288⟩))) (.node (.node (.single ⟨20544,20608,12160,12224⟩) (.single ⟨20544,20608,12224,12288⟩)) (.node (.single ⟨20608,20736,12032,12160⟩) (.single ⟨20608,20736,12160,12288⟩)))))
def output98 : Fin 14 → GridBox := outputData98.get
def coverData98 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 13))) (.node (.node (.single 6) (.single 1)) (.node (.single 12) (.single 12)))) (.node (.node (.single 1) (.node (.single 6) (.single 13))) (.node (.node (.single 7) (.single 0)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 11) (.node (.single 5) (.single 3))) (.node (.node (.single 10) (.single 10)) (.node (.single 3) (.single 4)))) (.node (.node (.single 9) (.node (.single 9) (.single 4))) (.node (.node (.single 5) (.single 11)) (.node (.single 8) (.single 2))))))
def sourceData98 : FiniteInputTree ℕ 14 := (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 15) (.single 3)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 14)) (.node (.single 5) (.single 2)))))
def cover98 (i : Fin 28) : Fin 14 := ⟨coverData98.get i % 14, Nat.mod_lt _ (by decide)⟩
def source98 (i : Fin 14) : Fin 28 := ⟨sourceData98.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree98 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 .empty (.cutY 22528 (.cutX 11264 .empty (.cutY 21504 (.cutX 11776 .empty (.cutY 20992 (.cutX 12032 .empty (.cutY 20736 (.cutX 12160 (.cutY 20608 .full .full) (.cutY 20608 (.cutX 12224 (.cutY 20544 .full .full) (.cutY 20544 .full .full)) .full)) .empty)) .empty)) .empty)) .empty))) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 (.cutY 10240 .empty (.cutX 21504 (.cutY 11264 .empty (.cutX 20992 (.cutY 11776 .empty (.cutX 20736 (.cutY 12032 .empty (.cutX 20608 (.cutY 12160 .full (.cutX 20544 (.cutY 12224 .full .full) (.cutY 12224 .full .full))) (.cutY 12160 .full .full))) .empty)) .empty)) .empty)) .empty) .empty))) .empty) .empty))

theorem metadata98 : 0<1701312 ∧ 47<128 ∧ 80<128 ∧ 0<4 ∧
    3887/4160=0 ∧ 3887%4160=3887 ∧ ∀ i, (leaves98 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData98).mp
    (by decide +kernel)

theorem sourceChecked98_0 : ∀ i : Fin 14,
    (fun i => output98 i = raw98 (source98 i)) (finOffset 14 0 14 (by decide) i) := by decide +kernel

theorem sourceChecked98 : ∀ i : Fin 14, (fun i => output98 i = raw98 (source98 i)) i :=
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

theorem areaUnits98 : gridUnionAreaUnits output98 = 131072 := by decide +kernel

noncomputable def phaseMass98 : ℝ := singlePhaseMass (1701312/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw98 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass98_eq : phaseMass98 = (26583/51200000000 : ℝ) := by
  unfold phaseMass98
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw98 output98 cover98 source98
    (gridTreeUnionCheck_sound 32768 raw98 output98 cover98 source98 tree98 checked98)
    _ (by norm_num) _, areaUnits98]
  norm_num

-- Frozen phase 3995, atom 3202, type 0, source (33,67).
def leavesData99 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves99 : Fin 4 → DyadicLeaf := leavesData99.get
def raw99 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 33 67 leaves99 i
def outputData99 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨8448,8576,17152,17280⟩) (.single ⟨8448,8576,17280,17408⟩)) (.node (.single ⟨8576,8704,17152,17280⟩) (.single ⟨8576,8704,17280,17408⟩))) (.node (.node (.single ⟨15360,15488,24064,24192⟩) (.single ⟨15360,15488,24192,24320⟩)) (.node (.single ⟨15488,15616,24064,24192⟩) (.single ⟨15488,15616,24192,24320⟩)))) (.node (.node (.node (.single ⟨17152,17280,8448,8576⟩) (.single ⟨17152,17280,8576,8704⟩)) (.node (.single ⟨17280,17408,8448,8576⟩) (.single ⟨17280,17408,8576,8704⟩))) (.node (.node (.single ⟨24064,24192,15360,15488⟩) (.single ⟨24064,24192,15488,15616⟩)) (.node (.single ⟨24192,24320,15360,15488⟩) (.single ⟨24192,24320,15488,15616⟩)))))
def output99 : Fin 16 → GridBox := outputData99.get
def coverData99 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData99 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover99 (i : Fin 16) : Fin 16 := ⟨coverData99.get i % 16, Nat.mod_lt _ (by decide)⟩
def source99 (i : Fin 16) : Fin 16 := ⟨sourceData99.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree99 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 (.cutY 18432 (.cutX 9216 (.cutY 17408 (.cutX 8704 (.cutY 16896 .empty (.cutX 8448 .empty (.cutY 17152 .empty (.cutX 8576 (.cutY 17280 .full .full) (.cutY 17280 .full .full))))) .empty) .empty) .empty) .empty) .empty) .empty) (.cutY 20480 .empty (.cutX 14336 .empty (.cutY 22528 .empty (.cutX 15360 .empty (.cutY 23552 .empty (.cutX 15872 (.cutY 24064 .empty (.cutX 15616 (.cutY 24320 (.cutX 15488 (.cutY 24192 .full .full) (.cutY 24192 .full .full)) .empty) .empty)) .empty))))))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 (.cutY 10240 (.cutX 17408 (.cutY 9216 (.cutX 16896 .empty (.cutY 8704 (.cutX 17152 .empty (.cutY 8448 .empty (.cutX 17280 (.cutY 8576 .full .full) (.cutY 8576 .full .full)))) .empty)) .empty) .empty) .empty) .empty) .empty) (.cutY 12288 .empty (.cutX 22528 .empty (.cutY 14336 .empty (.cutX 23552 .empty (.cutY 15360 .empty (.cutX 24064 .empty (.cutY 15872 (.cutX 24320 (.cutY 15616 (.cutX 24192 (.cutY 15488 .full .full) (.cutY 15488 .full .full)) .empty) .empty) .empty))))))))) .empty) .empty))

theorem metadata99 : 0<167572778 ∧ 33<128 ∧ 67<128 ∧ 0<4 ∧
    3202/4160=0 ∧ 3202%4160=3202 ∧ ∀ i, (leaves99 i).Valid 8 := by
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

noncomputable def phaseMass99 : ℝ := singlePhaseMass (167572778/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw99 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass99_eq : phaseMass99 = (83786389/819200000000 : ℝ) := by
  unfold phaseMass99
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw99 output99 cover99 source99
    (gridTreeUnionCheck_sound 32768 raw99 output99 cover99 source99 tree99 checked99)
    _ (by norm_num) _, areaUnits99]
  norm_num

-- Frozen phase 3996, atom 5807, type 1, source (14,51).
def leavesData100 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves100 : Fin 7 → DyadicLeaf := leavesData100.get
def raw100 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 14 51 leaves100 i
def outputData100 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3584,3712,13056,13184⟩) (.node (.single ⟨3584,3712,13184,13312⟩) (.single ⟨3712,3776,13056,13120⟩))) (.node (.node (.single ⟨3712,3776,13120,13184⟩) (.single ⟨3776,3840,13056,13120⟩)) (.node (.single ⟨3776,3840,13120,13184⟩) (.single ⟨3712,3840,13184,13312⟩)))) (.node (.node (.single ⟨13056,13184,3584,3712⟩) (.node (.single ⟨13056,13120,3712,3776⟩) (.single ⟨13056,13120,3776,3840⟩))) (.node (.node (.single ⟨13120,13184,3712,3776⟩) (.single ⟨13120,13184,3776,3840⟩)) (.node (.single ⟨13184,13312,3584,3712⟩) (.single ⟨13184,13312,3712,3840⟩))))) (.node (.node (.node (.single ⟨19456,19584,28928,29056⟩) (.node (.single ⟨19456,19584,29056,29184⟩) (.single ⟨19584,19648,28928,28992⟩))) (.node (.node (.single ⟨19584,19648,28992,29056⟩) (.single ⟨19648,19712,28928,28992⟩)) (.node (.single ⟨19648,19712,28992,29056⟩) (.single ⟨19584,19712,29056,29184⟩)))) (.node (.node (.single ⟨28928,29056,19456,19584⟩) (.node (.single ⟨28928,28992,19584,19648⟩) (.single ⟨28928,28992,19648,19712⟩))) (.node (.node (.single ⟨28992,29056,19584,19648⟩) (.single ⟨28992,29056,19648,19712⟩)) (.node (.single ⟨29056,29184,19456,19584⟩) (.single ⟨29056,29184,19584,19712⟩))))))
def output100 : Fin 28 → GridBox := outputData100.get
def coverData100 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData100 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover100 (i : Fin 28) : Fin 28 := ⟨coverData100.get i % 28, Nat.mod_lt _ (by decide)⟩
def source100 (i : Fin 28) : Fin 28 := ⟨sourceData100.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree100 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 (.cutX 3072 .empty (.cutY 13312 (.cutX 3584 .empty (.cutY 12800 .empty (.cutX 3840 (.cutY 13056 .empty (.cutX 3712 (.cutY 13184 .full .full) (.cutY 13184 (.cutX 3776 (.cutY 13120 .full .full) (.cutY 13120 .full .full)) .full))) .empty))) .empty)) .empty))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 (.cutY 2048 .empty (.cutX 13312 (.cutY 3072 .empty (.cutX 12800 .empty (.cutY 3584 .empty (.cutX 13056 .empty (.cutY 3840 (.cutX 13184 (.cutY 3712 .full (.cutX 13120 (.cutY 3776 .full .full) (.cutY 3776 .full .full))) (.cutY 3712 .full .full)) .empty))))) .empty)) .empty) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 .empty (.cutY 30720 (.cutX 19456 .empty (.cutY 29696 (.cutX 19968 (.cutY 29184 (.cutX 19712 (.cutY 28928 .empty (.cutX 19584 (.cutY 29056 .full .full) (.cutY 29056 (.cutX 19648 (.cutY 28992 .full .full) (.cutY 28992 .full .full)) .full))) .empty) .empty) .empty) .empty)) .empty))) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 .empty (.cutX 29696 (.cutY 19456 .empty (.cutX 29184 (.cutY 19968 (.cutX 28928 .empty (.cutY 19712 (.cutX 29056 (.cutY 19584 .full (.cutX 28992 (.cutY 19648 .full .full) (.cutY 19648 .full .full))) (.cutY 19584 .full .full)) .empty)) .empty) .empty)) .empty)) .empty) .empty)) .empty))))

theorem metadata100 : 0<144841863 ∧ 14<128 ∧ 51<128 ∧ 1<4 ∧
    5807/4160=1 ∧ 5807%4160=1647 ∧ ∀ i, (leaves100 i).Valid 8 := by
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

noncomputable def phaseMass100 : ℝ := singlePhaseMass (144841863/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw100 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass100_eq : phaseMass100 = (144841863/1638400000000 : ℝ) := by
  unfold phaseMass100
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw100 output100 cover100 source100
    (gridTreeUnionCheck_sound 32768 raw100 output100 cover100 source100 tree100 checked100)
    _ (by norm_num) _, areaUnits100]
  norm_num

-- Frozen phase 3997, atom 4583, type 1, source (3,48).
def leavesData101 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves101 : Fin 7 → DyadicLeaf := leavesData101.get
def raw101 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 3 48 leaves101 i
def outputData101 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨768,896,12288,12416⟩) (.node (.single ⟨768,896,12416,12544⟩) (.single ⟨896,960,12288,12352⟩))) (.node (.node (.single ⟨896,960,12352,12416⟩) (.single ⟨960,1024,12288,12352⟩)) (.node (.single ⟨960,1024,12352,12416⟩) (.single ⟨896,1024,12416,12544⟩)))) (.node (.node (.single ⟨12288,12416,768,896⟩) (.node (.single ⟨12288,12352,896,960⟩) (.single ⟨12288,12352,960,1024⟩))) (.node (.node (.single ⟨12352,12416,896,960⟩) (.single ⟨12352,12416,960,1024⟩)) (.node (.single ⟨12416,12544,768,896⟩) (.single ⟨12416,12544,896,1024⟩))))) (.node (.node (.node (.single ⟨20224,20352,31744,31872⟩) (.node (.single ⟨20224,20352,31872,32000⟩) (.single ⟨20352,20416,31744,31808⟩))) (.node (.node (.single ⟨20352,20416,31808,31872⟩) (.single ⟨20416,20480,31744,31808⟩)) (.node (.single ⟨20416,20480,31808,31872⟩) (.single ⟨20352,20480,31872,32000⟩)))) (.node (.node (.single ⟨31744,31872,20224,20352⟩) (.node (.single ⟨31744,31808,20352,20416⟩) (.single ⟨31744,31808,20416,20480⟩))) (.node (.node (.single ⟨31808,31872,20352,20416⟩) (.single ⟨31808,31872,20416,20480⟩)) (.node (.single ⟨31872,32000,20224,20352⟩) (.single ⟨31872,32000,20352,20480⟩))))))
def output101 : Fin 28 → GridBox := outputData101.get
def coverData101 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData101 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover101 (i : Fin 28) : Fin 28 := ⟨coverData101.get i % 28, Nat.mod_lt _ (by decide)⟩
def source101 (i : Fin 28) : Fin 28 := ⟨sourceData101.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree101 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 (.cutX 1024 (.cutY 13312 (.cutX 512 .empty (.cutY 12800 (.cutX 768 .empty (.cutY 12544 (.cutX 896 (.cutY 12416 .full .full) (.cutY 12416 (.cutX 960 (.cutY 12352 .full .full) (.cutY 12352 .full .full)) .full)) .empty)) .empty)) .empty) .empty) .empty) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 (.cutY 2048 (.cutX 13312 (.cutY 1024 (.cutX 12800 (.cutY 512 .empty (.cutX 12544 (.cutY 768 .empty (.cutX 12416 (.cutY 896 .full (.cutX 12352 (.cutY 960 .full .full) (.cutY 960 .full .full))) (.cutY 896 .full .full))) .empty)) .empty) .empty) .empty) .empty) .empty) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 .empty (.cutY 30720 .empty (.cutX 19456 .empty (.cutY 31744 .empty (.cutX 19968 .empty (.cutY 32256 (.cutX 20224 .empty (.cutY 32000 (.cutX 20352 (.cutY 31872 .full .full) (.cutY 31872 (.cutX 20416 (.cutY 31808 .full .full) (.cutY 31808 .full .full)) .full)) .empty)) .empty))))))) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 .empty (.cutX 31744 .empty (.cutY 19456 .empty (.cutX 32256 (.cutY 19968 .empty (.cutX 32000 (.cutY 20224 .empty (.cutX 31872 (.cutY 20352 .full (.cutX 31808 (.cutY 20416 .full .full) (.cutY 20416 .full .full))) (.cutY 20352 .full .full))) .empty)) .empty))))) .empty)) .empty))))

theorem metadata101 : 0<234882010 ∧ 3<128 ∧ 48<128 ∧ 1<4 ∧
    4583/4160=1 ∧ 4583%4160=423 ∧ ∀ i, (leaves101 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData101).mp
    (by decide +kernel)

theorem sourceChecked101_0 : ∀ i : Fin 28,
    (fun i => output101 i = raw101 (source101 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked101 : ∀ i : Fin 28, (fun i => output101 i = raw101 (source101 i)) i :=
  forallFin_of_zero_offset (fun i => output101 i = raw101 (source101 i)) sourceChecked101_0

theorem coverChecked101_0 : ∀ i : Fin 28,
    (fun i => (output101 (cover101 i)).ContainsBox (raw101 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked101 : ∀ i : Fin 28, (fun i => (output101 (cover101 i)).ContainsBox (raw101 i)) i :=
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

noncomputable def phaseMass101 : ℝ := singlePhaseMass (234882010/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw101 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass101_eq : phaseMass101 = (23488201/163840000000 : ℝ) := by
  unfold phaseMass101
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw101 output101 cover101 source101
    (gridTreeUnionCheck_sound 32768 raw101 output101 cover101 source101 tree101 checked101)
    _ (by norm_num) _, areaUnits101]
  norm_num

-- Frozen phase 3998, atom 2128, type 0, source (19,57).
def leavesData102 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves102 : Fin 4 → DyadicLeaf := leavesData102.get
def raw102 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 19 57 leaves102 i
def outputData102 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨4864,4992,14592,14720⟩) (.single ⟨4864,4992,14720,14848⟩)) (.node (.single ⟨4992,5120,14592,14720⟩) (.single ⟨4992,5120,14720,14848⟩))) (.node (.node (.single ⟨14592,14720,4864,4992⟩) (.single ⟨14592,14720,4992,5120⟩)) (.node (.single ⟨14720,14848,4864,4992⟩) (.single ⟨14720,14848,4992,5120⟩)))) (.node (.node (.node (.single ⟨17920,18048,27648,27776⟩) (.single ⟨17920,18048,27776,27904⟩)) (.node (.single ⟨18048,18176,27648,27776⟩) (.single ⟨18048,18176,27776,27904⟩))) (.node (.node (.single ⟨27648,27776,17920,18048⟩) (.single ⟨27648,27776,18048,18176⟩)) (.node (.single ⟨27776,27904,17920,18048⟩) (.single ⟨27776,27904,18048,18176⟩)))))
def output102 : Fin 16 → GridBox := outputData102.get
def coverData102 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData102 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover102 (i : Fin 16) : Fin 16 := ⟨coverData102.get i % 16, Nat.mod_lt _ (by decide)⟩
def source102 (i : Fin 16) : Fin 16 := ⟨sourceData102.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree102 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 (.cutY 14336 .empty (.cutX 5120 (.cutY 15360 (.cutX 4608 .empty (.cutY 14848 (.cutX 4864 .empty (.cutY 14592 .empty (.cutX 4992 (.cutY 14720 .full .full) (.cutY 14720 .full .full)))) .empty)) .empty) .empty)) .empty)))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 .empty (.cutY 6144 (.cutX 15360 (.cutY 5120 (.cutX 14848 (.cutY 4608 .empty (.cutX 14592 .empty (.cutY 4864 .empty (.cutX 14720 (.cutY 4992 .full .full) (.cutY 4992 .full .full))))) .empty) .empty) .empty) .empty)))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 (.cutY 26624 .empty (.cutX 17408 .empty (.cutY 27648 .empty (.cutX 17920 .empty (.cutY 28160 (.cutX 18176 (.cutY 27904 (.cutX 18048 (.cutY 27776 .full .full) (.cutY 27776 .full .full)) .empty) .empty) .empty))))) .empty) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 .empty (.cutY 18432 (.cutX 27648 .empty (.cutY 17408 .empty (.cutX 28160 (.cutY 17920 .empty (.cutX 27904 (.cutY 18176 (.cutX 27776 (.cutY 18048 .full .full) (.cutY 18048 .full .full)) .empty) .empty)) .empty))) .empty)) .empty) .empty) .empty))))

theorem metadata102 : 0<185830537 ∧ 19<128 ∧ 57<128 ∧ 0<4 ∧
    2128/4160=0 ∧ 2128%4160=2128 ∧ ∀ i, (leaves102 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData102).mp
    (by decide +kernel)

theorem sourceChecked102_0 : ∀ i : Fin 16,
    (fun i => output102 i = raw102 (source102 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked102 : ∀ i : Fin 16, (fun i => output102 i = raw102 (source102 i)) i :=
  forallFin_of_zero_offset (fun i => output102 i = raw102 (source102 i)) sourceChecked102_0

theorem coverChecked102_0 : ∀ i : Fin 16,
    (fun i => (output102 (cover102 i)).ContainsBox (raw102 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked102 : ∀ i : Fin 16, (fun i => (output102 (cover102 i)).ContainsBox (raw102 i)) i :=
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

noncomputable def phaseMass102 : ℝ := singlePhaseMass (185830537/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw102 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass102_eq : phaseMass102 = (185830537/1638400000000 : ℝ) := by
  unfold phaseMass102
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw102 output102 cover102 source102
    (gridTreeUnionCheck_sound 32768 raw102 output102 cover102 source102 tree102 checked102)
    _ (by norm_num) _, areaUnits102]
  norm_num

-- Frozen phase 3999, atom 5280, type 1, source (9,49).
def leavesData103 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves103 : Fin 10 → DyadicLeaf := leavesData103.get
def raw103 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 9 49 leaves103 i
def outputData103 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨2304,2368,12544,12608⟩) (.single ⟨2304,2368,12608,12672⟩)) (.node (.single ⟨2368,2432,12544,12608⟩) (.node (.single ⟨2368,2432,12608,12672⟩) (.single ⟨2304,2432,12672,12800⟩)))) (.node (.node (.single ⟨2432,2496,12544,12608⟩) (.single ⟨2432,2496,12608,12672⟩)) (.node (.single ⟨2496,2560,12544,12608⟩) (.node (.single ⟨2496,2560,12608,12672⟩) (.single ⟨2432,2560,12672,12800⟩))))) (.node (.node (.node (.single ⟨12544,12608,2304,2368⟩) (.single ⟨12544,12608,2368,2432⟩)) (.node (.single ⟨12608,12672,2304,2368⟩) (.node (.single ⟨12608,12672,2368,2432⟩) (.single ⟨12544,12608,2432,2496⟩)))) (.node (.node (.single ⟨12544,12608,2496,2560⟩) (.single ⟨12608,12672,2432,2496⟩)) (.node (.single ⟨12608,12672,2496,2560⟩) (.node (.single ⟨12672,12800,2304,2432⟩) (.single ⟨12672,12800,2432,2560⟩)))))) (.node (.node (.node (.node (.single ⟨19968,20096,30208,30336⟩) (.single ⟨19968,20096,30336,30464⟩)) (.node (.single ⟨20096,20160,30208,30272⟩) (.node (.single ⟨20096,20160,30272,30336⟩) (.single ⟨20160,20224,30208,30272⟩)))) (.node (.node (.single ⟨20160,20224,30272,30336⟩) (.single ⟨20096,20160,30336,30400⟩)) (.node (.single ⟨20096,20160,30400,30464⟩) (.node (.single ⟨20160,20224,30336,30400⟩) (.single ⟨20160,20224,30400,30464⟩))))) (.node (.node (.node (.single ⟨30208,30336,19968,20096⟩) (.single ⟨30208,30272,20096,20160⟩)) (.node (.single ⟨30208,30272,20160,20224⟩) (.node (.single ⟨30272,30336,20096,20160⟩) (.single ⟨30272,30336,20160,20224⟩)))) (.node (.node (.single ⟨30336,30464,19968,20096⟩) (.single ⟨30336,30400,20096,20160⟩)) (.node (.single ⟨30336,30400,20160,20224⟩) (.node (.single ⟨30400,30464,20096,20160⟩) (.single ⟨30400,30464,20160,20224⟩)))))))
def output103 : Fin 40 → GridBox := outputData103.get
def coverData103 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 18)) (.node (.single 35) (.node (.single 21) (.single 9)))) (.node (.node (.single 19) (.single 30)) (.node (.single 20) (.node (.single 5) (.single 14))))) (.node (.node (.node (.single 34) (.single 25)) (.node (.single 6) (.node (.single 16) (.single 33)))) (.node (.node (.single 23) (.single 7)) (.node (.single 15) (.node (.single 32) (.single 24)))))) (.node (.node (.node (.node (.single 8) (.single 17)) (.node (.single 31) (.node (.single 22) (.single 0)))) (.node (.node (.single 10) (.single 39)) (.node (.single 29) (.node (.single 1) (.single 12))))) (.node (.node (.node (.single 38) (.single 27)) (.node (.single 2) (.node (.single 11) (.single 37)))) (.node (.node (.single 28) (.single 3)) (.node (.single 13) (.node (.single 36) (.single 26)))))))
def sourceData103 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover103 (i : Fin 40) : Fin 40 := ⟨coverData103.get i % 40, Nat.mod_lt _ (by decide)⟩
def source103 (i : Fin 40) : Fin 40 := ⟨sourceData103.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree103 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 (.cutX 3072 (.cutY 13312 (.cutX 2560 (.cutY 12800 (.cutX 2304 .empty (.cutY 12544 .empty (.cutX 2432 (.cutY 12672 (.cutX 2368 (.cutY 12608 .full .full) (.cutY 12608 .full .full)) .full) (.cutY 12672 (.cutX 2496 (.cutY 12608 .full .full) (.cutY 12608 .full .full)) .full)))) .empty) .empty) .empty) .empty) .empty))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 (.cutY 2048 .empty (.cutX 13312 (.cutY 3072 (.cutX 12800 (.cutY 2560 (.cutX 12544 .empty (.cutY 2304 .empty (.cutX 12672 (.cutY 2432 (.cutX 12608 (.cutY 2368 .full .full) (.cutY 2368 .full .full)) (.cutX 12608 (.cutY 2496 .full .full) (.cutY 2496 .full .full))) (.cutY 2432 .full .full)))) .empty) .empty) .empty) .empty)) .empty) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 .empty (.cutY 30720 (.cutX 19456 .empty (.cutY 29696 .empty (.cutX 19968 .empty (.cutY 30208 .empty (.cutX 20224 (.cutY 30464 (.cutX 20096 (.cutY 30336 .full .full) (.cutY 30336 (.cutX 20160 (.cutY 30272 .full .full) (.cutY 30272 .full .full)) (.cutX 20160 (.cutY 30400 .full .full) (.cutY 30400 .full .full)))) .empty) .empty))))) .empty))) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 .empty (.cutX 29696 .empty (.cutY 19456 .empty (.cutX 30208 .empty (.cutY 19968 .empty (.cutX 30464 (.cutY 20224 (.cutX 30336 (.cutY 20096 .full (.cutX 30272 (.cutY 20160 .full .full) (.cutY 20160 .full .full))) (.cutY 20096 .full (.cutX 30400 (.cutY 20160 .full .full) (.cutY 20160 .full .full)))) .empty) .empty)))))) .empty) .empty)) .empty))))

theorem metadata103 : 0<144841863 ∧ 9<128 ∧ 49<128 ∧ 1<4 ∧
    5280/4160=1 ∧ 5280%4160=1120 ∧ ∀ i, (leaves103 i).Valid 8 := by
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

noncomputable def phaseMass103 : ℝ := singlePhaseMass (144841863/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw103 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass103_eq : phaseMass103 = (144841863/1638400000000 : ℝ) := by
  unfold phaseMass103
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw103 output103 cover103 source103
    (gridTreeUnionCheck_sound 32768 raw103 output103 cover103 source103 tree103 checked103)
    _ (by norm_num) _, areaUnits103]
  norm_num

-- Frozen phase 4000, atom 7019, type 1, source (28,59).
def leavesData104 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves104 : Fin 7 → DyadicLeaf := leavesData104.get
def raw104 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 28 59 leaves104 i
def outputData104 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨7168,7296,15104,15232⟩) (.node (.single ⟨7168,7296,15232,15360⟩) (.single ⟨7296,7360,15104,15168⟩))) (.node (.node (.single ⟨7296,7360,15168,15232⟩) (.single ⟨7360,7424,15104,15168⟩)) (.node (.single ⟨7360,7424,15168,15232⟩) (.single ⟨7296,7424,15232,15360⟩)))) (.node (.node (.single ⟨15104,15232,7168,7296⟩) (.node (.single ⟨15104,15168,7296,7360⟩) (.single ⟨15104,15168,7360,7424⟩))) (.node (.node (.single ⟨15168,15232,7296,7360⟩) (.single ⟨15168,15232,7360,7424⟩)) (.node (.single ⟨15232,15360,7168,7296⟩) (.single ⟨15232,15360,7296,7424⟩))))) (.node (.node (.node (.single ⟨17408,17536,25344,25472⟩) (.node (.single ⟨17408,17536,25472,25600⟩) (.single ⟨17536,17600,25344,25408⟩))) (.node (.node (.single ⟨17536,17600,25408,25472⟩) (.single ⟨17600,17664,25344,25408⟩)) (.node (.single ⟨17600,17664,25408,25472⟩) (.single ⟨17536,17664,25472,25600⟩)))) (.node (.node (.single ⟨25344,25472,17408,17536⟩) (.node (.single ⟨25344,25408,17536,17600⟩) (.single ⟨25344,25408,17600,17664⟩))) (.node (.node (.single ⟨25408,25472,17536,17600⟩) (.single ⟨25408,25472,17600,17664⟩)) (.node (.single ⟨25472,25600,17408,17536⟩) (.single ⟨25472,25600,17536,17664⟩))))))
def output104 : Fin 28 → GridBox := outputData104.get
def coverData104 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData104 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover104 (i : Fin 28) : Fin 28 := ⟨coverData104.get i % 28, Nat.mod_lt _ (by decide)⟩
def source104 (i : Fin 28) : Fin 28 := ⟨sourceData104.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree104 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 .empty (.cutY 14336 .empty (.cutX 7168 .empty (.cutY 15360 (.cutX 7680 (.cutY 14848 .empty (.cutX 7424 (.cutY 15104 .empty (.cutX 7296 (.cutY 15232 .full .full) (.cutY 15232 (.cutX 7360 (.cutY 15168 .full .full) (.cutY 15168 .full .full)) .full))) .empty)) .empty) .empty))))))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 .empty (.cutY 6144 .empty (.cutX 15360 (.cutY 7168 .empty (.cutX 14848 .empty (.cutY 7680 (.cutX 15104 .empty (.cutY 7424 (.cutX 15232 (.cutY 7296 .full (.cutX 15168 (.cutY 7360 .full .full) (.cutY 7360 .full .full))) (.cutY 7296 .full .full)) .empty)) .empty))) .empty))))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 (.cutY 26624 (.cutX 17408 .empty (.cutY 25600 (.cutX 17920 (.cutY 25088 .empty (.cutX 17664 (.cutY 25344 .empty (.cutX 17536 (.cutY 25472 .full .full) (.cutY 25472 (.cutX 17600 (.cutY 25408 .full .full) (.cutY 25408 .full .full)) .full))) .empty)) .empty) .empty)) .empty) .empty) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 (.cutY 18432 (.cutX 25600 (.cutY 17408 .empty (.cutX 25088 .empty (.cutY 17920 (.cutX 25344 .empty (.cutY 17664 (.cutX 25472 (.cutY 17536 .full (.cutX 25408 (.cutY 17600 .full .full) (.cutY 17600 .full .full))) (.cutY 17536 .full .full)) .empty)) .empty))) .empty) .empty) .empty) .empty) .empty) .empty))))

theorem metadata104 : 0<69455300 ∧ 28<128 ∧ 59<128 ∧ 1<4 ∧
    7019/4160=1 ∧ 7019%4160=2859 ∧ ∀ i, (leaves104 i).Valid 8 := by
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

noncomputable def phaseMass104 : ℝ := singlePhaseMass (69455300/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw104 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass104_eq : phaseMass104 = (694553/16384000000 : ℝ) := by
  unfold phaseMass104
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw104 output104 cover104 source104
    (gridTreeUnionCheck_sound 32768 raw104 output104 cover104 source104 tree104 checked104)
    _ (by norm_num) _, areaUnits104]
  norm_num

-- Frozen phase 4001, atom 7842, type 1, source (42,70).
def leavesData105 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves105 : Fin 7 → DyadicLeaf := leavesData105.get
def raw105 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 42 70 leaves105 i
def outputData105 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨10752,10880,17920,18048⟩) (.node (.single ⟨10752,10880,18048,18176⟩) (.single ⟨10880,10944,17920,17984⟩))) (.node (.node (.single ⟨10880,10944,17984,18048⟩) (.single ⟨10944,11008,17920,17984⟩)) (.node (.single ⟨10944,11008,17984,18048⟩) (.single ⟨10880,11008,18048,18176⟩)))) (.node (.node (.single ⟨14592,14720,21760,21888⟩) (.node (.single ⟨14592,14720,21888,22016⟩) (.single ⟨14720,14784,21760,21824⟩))) (.node (.node (.single ⟨14720,14784,21824,21888⟩) (.single ⟨14784,14848,21760,21824⟩)) (.node (.single ⟨14784,14848,21824,21888⟩) (.single ⟨14720,14848,21888,22016⟩))))) (.node (.node (.node (.single ⟨17920,18048,10752,10880⟩) (.node (.single ⟨17920,17984,10880,10944⟩) (.single ⟨17920,17984,10944,11008⟩))) (.node (.node (.single ⟨17984,18048,10880,10944⟩) (.single ⟨17984,18048,10944,11008⟩)) (.node (.single ⟨18048,18176,10752,10880⟩) (.single ⟨18048,18176,10880,11008⟩)))) (.node (.node (.single ⟨21760,21888,14592,14720⟩) (.node (.single ⟨21760,21824,14720,14784⟩) (.single ⟨21760,21824,14784,14848⟩))) (.node (.node (.single ⟨21824,21888,14720,14784⟩) (.single ⟨21824,21888,14784,14848⟩)) (.node (.single ⟨21888,22016,14592,14720⟩) (.single ⟨21888,22016,14720,14848⟩))))))
def output105 : Fin 28 → GridBox := outputData105.get
def coverData105 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData105 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover105 (i : Fin 28) : Fin 28 := ⟨coverData105.get i % 28, Nat.mod_lt _ (by decide)⟩
def source105 (i : Fin 28) : Fin 28 := ⟨sourceData105.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree105 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 .empty (.cutY 18432 (.cutX 11264 (.cutY 17408 .empty (.cutX 10752 .empty (.cutY 17920 .empty (.cutX 11008 (.cutY 18176 (.cutX 10880 (.cutY 18048 .full .full) (.cutY 18048 (.cutX 10944 (.cutY 17984 .full .full) (.cutY 17984 .full .full)) .full)) .empty) .empty)))) .empty) .empty)) .empty) (.cutY 20480 .empty (.cutX 14336 .empty (.cutY 22528 (.cutX 15360 (.cutY 21504 .empty (.cutX 14848 (.cutY 22016 (.cutX 14592 .empty (.cutY 21760 .empty (.cutX 14720 (.cutY 21888 .full .full) (.cutY 21888 (.cutX 14784 (.cutY 21824 .full .full) (.cutY 21824 .full .full)) .full)))) .empty) .empty)) .empty) .empty)))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 (.cutY 10240 .empty (.cutX 17408 .empty (.cutY 11264 (.cutX 17920 .empty (.cutY 10752 .empty (.cutX 18176 (.cutY 11008 (.cutX 18048 (.cutY 10880 .full (.cutX 17984 (.cutY 10944 .full .full) (.cutY 10944 .full .full))) (.cutY 10880 .full .full)) .empty) .empty))) .empty))) .empty) .empty) (.cutY 12288 .empty (.cutX 22528 (.cutY 14336 .empty (.cutX 21504 .empty (.cutY 15360 (.cutX 22016 (.cutY 14848 (.cutX 21760 .empty (.cutY 14592 .empty (.cutX 21888 (.cutY 14720 .full (.cutX 21824 (.cutY 14784 .full .full) (.cutY 14784 .full .full))) (.cutY 14720 .full .full)))) .empty) .empty) .empty))) .empty)))) .empty) .empty))

theorem metadata105 : 0<50021215 ∧ 42<128 ∧ 70<128 ∧ 1<4 ∧
    7842/4160=1 ∧ 7842%4160=3682 ∧ ∀ i, (leaves105 i).Valid 8 := by
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

noncomputable def phaseMass105 : ℝ := singlePhaseMass (50021215/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw105 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass105_eq : phaseMass105 = (10004243/327680000000 : ℝ) := by
  unfold phaseMass105
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw105 output105 cover105 source105
    (gridTreeUnionCheck_sound 32768 raw105 output105 cover105 source105 tree105 checked105)
    _ (by norm_num) _, areaUnits105]
  norm_num

-- Frozen phase 4002, atom 7886, type 1, source (43,71).
def leavesData106 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves106 : Fin 7 → DyadicLeaf := leavesData106.get
def raw106 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 43 71 leaves106 i
def outputData106 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨11008,11136,18176,18304⟩) (.node (.single ⟨11008,11136,18304,18432⟩) (.single ⟨11136,11200,18176,18240⟩))) (.node (.node (.single ⟨11136,11200,18240,18304⟩) (.single ⟨11200,11264,18176,18240⟩)) (.node (.single ⟨11200,11264,18240,18304⟩) (.single ⟨11136,11264,18304,18432⟩)))) (.node (.node (.single ⟨14336,14464,21504,21632⟩) (.node (.single ⟨14336,14464,21632,21760⟩) (.single ⟨14464,14528,21504,21568⟩))) (.node (.node (.single ⟨14464,14528,21568,21632⟩) (.single ⟨14528,14592,21504,21568⟩)) (.node (.single ⟨14528,14592,21568,21632⟩) (.single ⟨14464,14592,21632,21760⟩))))) (.node (.node (.node (.single ⟨18176,18304,11008,11136⟩) (.node (.single ⟨18176,18240,11136,11200⟩) (.single ⟨18176,18240,11200,11264⟩))) (.node (.node (.single ⟨18240,18304,11136,11200⟩) (.single ⟨18240,18304,11200,11264⟩)) (.node (.single ⟨18304,18432,11008,11136⟩) (.single ⟨18304,18432,11136,11264⟩)))) (.node (.node (.single ⟨21504,21632,14336,14464⟩) (.node (.single ⟨21504,21568,14464,14528⟩) (.single ⟨21504,21568,14528,14592⟩))) (.node (.node (.single ⟨21568,21632,14464,14528⟩) (.single ⟨21568,21632,14528,14592⟩)) (.node (.single ⟨21632,21760,14336,14464⟩) (.single ⟨21632,21760,14464,14592⟩))))))
def output106 : Fin 28 → GridBox := outputData106.get
def coverData106 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData106 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover106 (i : Fin 28) : Fin 28 := ⟨coverData106.get i % 28, Nat.mod_lt _ (by decide)⟩
def source106 (i : Fin 28) : Fin 28 := ⟨sourceData106.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree106 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 .empty (.cutY 18432 (.cutX 11264 (.cutY 17408 .empty (.cutX 10752 .empty (.cutY 17920 .empty (.cutX 11008 .empty (.cutY 18176 .empty (.cutX 11136 (.cutY 18304 .full .full) (.cutY 18304 (.cutX 11200 (.cutY 18240 .full .full) (.cutY 18240 .full .full)) .full))))))) .empty) .empty)) .empty) (.cutY 20480 .empty (.cutX 14336 .empty (.cutY 22528 (.cutX 15360 (.cutY 21504 .empty (.cutX 14848 (.cutY 22016 (.cutX 14592 (.cutY 21760 (.cutX 14464 (.cutY 21632 .full .full) (.cutY 21632 (.cutX 14528 (.cutY 21568 .full .full) (.cutY 21568 .full .full)) .full)) .empty) .empty) .empty) .empty)) .empty) .empty)))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 (.cutY 10240 .empty (.cutX 17408 .empty (.cutY 11264 (.cutX 17920 .empty (.cutY 10752 .empty (.cutX 18176 .empty (.cutY 11008 .empty (.cutX 18304 (.cutY 11136 .full (.cutX 18240 (.cutY 11200 .full .full) (.cutY 11200 .full .full))) (.cutY 11136 .full .full)))))) .empty))) .empty) .empty) (.cutY 12288 .empty (.cutX 22528 (.cutY 14336 .empty (.cutX 21504 .empty (.cutY 15360 (.cutX 22016 (.cutY 14848 (.cutX 21760 (.cutY 14592 (.cutX 21632 (.cutY 14464 .full (.cutX 21568 (.cutY 14528 .full .full) (.cutY 14528 .full .full))) (.cutY 14464 .full .full)) .empty) .empty) .empty) .empty) .empty))) .empty)))) .empty) .empty))

theorem metadata106 : 0<50021215 ∧ 43<128 ∧ 71<128 ∧ 1<4 ∧
    7886/4160=1 ∧ 7886%4160=3726 ∧ ∀ i, (leaves106 i).Valid 8 := by
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

noncomputable def phaseMass106 : ℝ := singlePhaseMass (50021215/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw106 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass106_eq : phaseMass106 = (10004243/327680000000 : ℝ) := by
  unfold phaseMass106
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw106 output106 cover106 source106
    (gridTreeUnionCheck_sound 32768 raw106 output106 cover106 source106 tree106 checked106)
    _ (by norm_num) _, areaUnits106]
  norm_num

-- Frozen phase 4003, atom 7699, type 1, source (39,68).
def leavesData107 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves107 : Fin 10 → DyadicLeaf := leavesData107.get
def raw107 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 39 68 leaves107 i
def outputData107 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨9984,10048,17408,17472⟩) (.single ⟨9984,10048,17472,17536⟩)) (.node (.single ⟨10048,10112,17408,17472⟩) (.node (.single ⟨10048,10112,17472,17536⟩) (.single ⟨9984,10112,17536,17664⟩)))) (.node (.node (.single ⟨10112,10176,17408,17472⟩) (.single ⟨10112,10176,17472,17536⟩)) (.node (.single ⟨10176,10240,17408,17472⟩) (.node (.single ⟨10176,10240,17472,17536⟩) (.single ⟨10112,10240,17536,17664⟩))))) (.node (.node (.node (.single ⟨15104,15232,22528,22656⟩) (.single ⟨15104,15232,22656,22784⟩)) (.node (.single ⟨15232,15296,22528,22592⟩) (.node (.single ⟨15232,15296,22592,22656⟩) (.single ⟨15296,15360,22528,22592⟩)))) (.node (.node (.single ⟨15296,15360,22592,22656⟩) (.single ⟨15232,15296,22656,22720⟩)) (.node (.single ⟨15232,15296,22720,22784⟩) (.node (.single ⟨15296,15360,22656,22720⟩) (.single ⟨15296,15360,22720,22784⟩)))))) (.node (.node (.node (.node (.single ⟨17408,17472,9984,10048⟩) (.single ⟨17408,17472,10048,10112⟩)) (.node (.single ⟨17472,17536,9984,10048⟩) (.node (.single ⟨17472,17536,10048,10112⟩) (.single ⟨17408,17472,10112,10176⟩)))) (.node (.node (.single ⟨17408,17472,10176,10240⟩) (.single ⟨17472,17536,10112,10176⟩)) (.node (.single ⟨17472,17536,10176,10240⟩) (.node (.single ⟨17536,17664,9984,10112⟩) (.single ⟨17536,17664,10112,10240⟩))))) (.node (.node (.node (.single ⟨22528,22656,15104,15232⟩) (.single ⟨22528,22592,15232,15296⟩)) (.node (.single ⟨22528,22592,15296,15360⟩) (.node (.single ⟨22592,22656,15232,15296⟩) (.single ⟨22592,22656,15296,15360⟩)))) (.node (.node (.single ⟨22656,22784,15104,15232⟩) (.single ⟨22656,22720,15232,15296⟩)) (.node (.single ⟨22656,22720,15296,15360⟩) (.node (.single ⟨22720,22784,15232,15296⟩) (.single ⟨22720,22784,15296,15360⟩)))))))
def output107 : Fin 40 → GridBox := outputData107.get
def coverData107 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData107 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover107 (i : Fin 40) : Fin 40 := ⟨coverData107.get i % 40, Nat.mod_lt _ (by decide)⟩
def source107 (i : Fin 40) : Fin 40 := ⟨sourceData107.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree107 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 (.cutY 18432 (.cutX 9216 .empty (.cutY 17408 .empty (.cutX 9728 .empty (.cutY 17920 (.cutX 9984 .empty (.cutY 17664 (.cutX 10112 (.cutY 17536 (.cutX 10048 (.cutY 17472 .full .full) (.cutY 17472 .full .full)) .full) (.cutY 17536 (.cutX 10176 (.cutY 17472 .full .full) (.cutY 17472 .full .full)) .full)) .empty)) .empty)))) .empty) .empty) .empty) (.cutY 20480 .empty (.cutX 14336 .empty (.cutY 22528 .empty (.cutX 15360 (.cutY 23552 (.cutX 14848 .empty (.cutY 23040 (.cutX 15104 .empty (.cutY 22784 (.cutX 15232 (.cutY 22656 .full .full) (.cutY 22656 (.cutX 15296 (.cutY 22592 .full .full) (.cutY 22592 .full .full)) (.cutX 15296 (.cutY 22720 .full .full) (.cutY 22720 .full .full)))) .empty)) .empty)) .empty) .empty))))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 (.cutY 10240 (.cutX 17408 .empty (.cutY 9216 .empty (.cutX 17920 (.cutY 9728 .empty (.cutX 17664 (.cutY 9984 .empty (.cutX 17536 (.cutY 10112 (.cutX 17472 (.cutY 10048 .full .full) (.cutY 10048 .full .full)) (.cutX 17472 (.cutY 10176 .full .full) (.cutY 10176 .full .full))) (.cutY 10112 .full .full))) .empty)) .empty))) .empty) .empty) .empty) (.cutY 12288 .empty (.cutX 22528 .empty (.cutY 14336 .empty (.cutX 23552 (.cutY 15360 (.cutX 23040 (.cutY 14848 .empty (.cutX 22784 (.cutY 15104 .empty (.cutX 22656 (.cutY 15232 .full (.cutX 22592 (.cutY 15296 .full .full) (.cutY 15296 .full .full))) (.cutY 15232 .full (.cutX 22720 (.cutY 15296 .full .full) (.cutY 15296 .full .full))))) .empty)) .empty) .empty) .empty)))))) .empty) .empty))

theorem metadata107 : 0<182398684 ∧ 39<128 ∧ 68<128 ∧ 1<4 ∧
    7699/4160=1 ∧ 7699%4160=3539 ∧ ∀ i, (leaves107 i).Valid 8 := by
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

noncomputable def phaseMass107 : ℝ := singlePhaseMass (182398684/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw107 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass107_eq : phaseMass107 = (45599671/409600000000 : ℝ) := by
  unfold phaseMass107
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw107 output107 cover107 source107
    (gridTreeUnionCheck_sound 32768 raw107 output107 cover107 source107 tree107 checked107)
    _ (by norm_num) _, areaUnits107]
  norm_num

-- Frozen phase 4004, atom 7538, type 1, source (36,66).
def leavesData108 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves108 : Fin 7 → DyadicLeaf := leavesData108.get
def raw108 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 36 66 leaves108 i
def outputData108 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨9216,9344,16896,17024⟩) (.node (.single ⟨9216,9344,17024,17152⟩) (.single ⟨9344,9408,16896,16960⟩))) (.node (.node (.single ⟨9344,9408,16960,17024⟩) (.single ⟨9408,9472,16896,16960⟩)) (.node (.single ⟨9408,9472,16960,17024⟩) (.single ⟨9344,9472,17024,17152⟩)))) (.node (.node (.single ⟨15616,15744,23296,23424⟩) (.node (.single ⟨15616,15744,23424,23552⟩) (.single ⟨15744,15808,23296,23360⟩))) (.node (.node (.single ⟨15744,15808,23360,23424⟩) (.single ⟨15808,15872,23296,23360⟩)) (.node (.single ⟨15808,15872,23360,23424⟩) (.single ⟨15744,15872,23424,23552⟩))))) (.node (.node (.node (.single ⟨16896,17024,9216,9344⟩) (.node (.single ⟨16896,16960,9344,9408⟩) (.single ⟨16896,16960,9408,9472⟩))) (.node (.node (.single ⟨16960,17024,9344,9408⟩) (.single ⟨16960,17024,9408,9472⟩)) (.node (.single ⟨17024,17152,9216,9344⟩) (.single ⟨17024,17152,9344,9472⟩)))) (.node (.node (.single ⟨23296,23424,15616,15744⟩) (.node (.single ⟨23296,23360,15744,15808⟩) (.single ⟨23296,23360,15808,15872⟩))) (.node (.node (.single ⟨23360,23424,15744,15808⟩) (.single ⟨23360,23424,15808,15872⟩)) (.node (.single ⟨23424,23552,15616,15744⟩) (.single ⟨23424,23552,15744,15872⟩))))))
def output108 : Fin 28 → GridBox := outputData108.get
def coverData108 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData108 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover108 (i : Fin 28) : Fin 28 := ⟨coverData108.get i % 28, Nat.mod_lt _ (by decide)⟩
def source108 (i : Fin 28) : Fin 28 := ⟨sourceData108.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree108 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 (.cutY 18432 (.cutX 9216 .empty (.cutY 17408 (.cutX 9728 (.cutY 16896 .empty (.cutX 9472 (.cutY 17152 (.cutX 9344 (.cutY 17024 .full .full) (.cutY 17024 (.cutX 9408 (.cutY 16960 .full .full) (.cutY 16960 .full .full)) .full)) .empty) .empty)) .empty) .empty)) .empty) .empty) .empty) (.cutY 20480 .empty (.cutX 14336 .empty (.cutY 22528 .empty (.cutX 15360 .empty (.cutY 23552 (.cutX 15872 (.cutY 23040 .empty (.cutX 15616 .empty (.cutY 23296 .empty (.cutX 15744 (.cutY 23424 .full .full) (.cutY 23424 (.cutX 15808 (.cutY 23360 .full .full) (.cutY 23360 .full .full)) .full))))) .empty) .empty)))))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 (.cutY 10240 (.cutX 17408 (.cutY 9216 .empty (.cutX 16896 .empty (.cutY 9728 (.cutX 17152 (.cutY 9472 (.cutX 17024 (.cutY 9344 .full (.cutX 16960 (.cutY 9408 .full .full) (.cutY 9408 .full .full))) (.cutY 9344 .full .full)) .empty) .empty) .empty))) .empty) .empty) .empty) .empty) (.cutY 12288 .empty (.cutX 22528 .empty (.cutY 14336 .empty (.cutX 23552 (.cutY 15360 .empty (.cutX 23040 .empty (.cutY 15872 (.cutX 23296 .empty (.cutY 15616 .empty (.cutX 23424 (.cutY 15744 .full (.cutX 23360 (.cutY 15808 .full .full) (.cutY 15808 .full .full))) (.cutY 15744 .full .full)))) .empty))) .empty)))))) .empty) .empty))

theorem metadata108 : 0<182398684 ∧ 36<128 ∧ 66<128 ∧ 1<4 ∧
    7538/4160=1 ∧ 7538%4160=3378 ∧ ∀ i, (leaves108 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData108).mp
    (by decide +kernel)

theorem sourceChecked108_0 : ∀ i : Fin 28,
    (fun i => output108 i = raw108 (source108 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked108 : ∀ i : Fin 28, (fun i => output108 i = raw108 (source108 i)) i :=
  forallFin_of_zero_offset (fun i => output108 i = raw108 (source108 i)) sourceChecked108_0

theorem coverChecked108_0 : ∀ i : Fin 28,
    (fun i => (output108 (cover108 i)).ContainsBox (raw108 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked108 : ∀ i : Fin 28, (fun i => (output108 (cover108 i)).ContainsBox (raw108 i)) i :=
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

noncomputable def phaseMass108 : ℝ := singlePhaseMass (182398684/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw108 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass108_eq : phaseMass108 = (45599671/409600000000 : ℝ) := by
  unfold phaseMass108
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw108 output108 cover108 source108
    (gridTreeUnionCheck_sound 32768 raw108 output108 cover108 source108 tree108 checked108)
    _ (by norm_num) _, areaUnits108]
  norm_num

-- Frozen phase 4005, atom 302, type 0, source (2,50).
def leavesData109 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves109 : Fin 4 → DyadicLeaf := leavesData109.get
def raw109 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 2 50 leaves109 i
def outputData109 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨512,640,12800,12928⟩) (.single ⟨512,640,12928,13056⟩)) (.node (.single ⟨640,768,12800,12928⟩) (.single ⟨640,768,12928,13056⟩))) (.node (.node (.single ⟨12800,12928,512,640⟩) (.single ⟨12800,12928,640,768⟩)) (.node (.single ⟨12928,13056,512,640⟩) (.single ⟨12928,13056,640,768⟩)))) (.node (.node (.node (.single ⟨19712,19840,32000,32128⟩) (.single ⟨19712,19840,32128,32256⟩)) (.node (.single ⟨19840,19968,32000,32128⟩) (.single ⟨19840,19968,32128,32256⟩))) (.node (.node (.single ⟨32000,32128,19712,19840⟩) (.single ⟨32000,32128,19840,19968⟩)) (.node (.single ⟨32128,32256,19712,19840⟩) (.single ⟨32128,32256,19840,19968⟩)))))
def output109 : Fin 16 → GridBox := outputData109.get
def coverData109 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData109 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover109 (i : Fin 16) : Fin 16 := ⟨coverData109.get i % 16, Nat.mod_lt _ (by decide)⟩
def source109 (i : Fin 16) : Fin 16 := ⟨sourceData109.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree109 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 (.cutX 1024 (.cutY 13312 (.cutX 512 .empty (.cutY 12800 .empty (.cutX 768 (.cutY 13056 (.cutX 640 (.cutY 12928 .full .full) (.cutY 12928 .full .full)) .empty) .empty))) .empty) .empty) .empty) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 (.cutY 2048 (.cutX 13312 (.cutY 1024 (.cutX 12800 .empty (.cutY 512 .empty (.cutX 13056 (.cutY 768 (.cutX 12928 (.cutY 640 .full .full) (.cutY 640 .full .full)) .empty) .empty))) .empty) .empty) .empty) .empty) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 .empty (.cutY 30720 .empty (.cutX 19456 .empty (.cutY 31744 .empty (.cutX 19968 (.cutY 32256 (.cutX 19712 .empty (.cutY 32000 .empty (.cutX 19840 (.cutY 32128 .full .full) (.cutY 32128 .full .full)))) .empty) .empty)))))) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 .empty (.cutX 31744 .empty (.cutY 19456 .empty (.cutX 32256 (.cutY 19968 (.cutX 32000 .empty (.cutY 19712 .empty (.cutX 32128 (.cutY 19840 .full .full) (.cutY 19840 .full .full)))) .empty) .empty))))) .empty)) .empty))))

theorem metadata109 : 0<214747992 ∧ 2<128 ∧ 50<128 ∧ 0<4 ∧
    302/4160=0 ∧ 302%4160=302 ∧ ∀ i, (leaves109 i).Valid 8 := by
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

noncomputable def phaseMass109 : ℝ := singlePhaseMass (214747992/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw109 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass109_eq : phaseMass109 = (26843499/204800000000 : ℝ) := by
  unfold phaseMass109
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw109 output109 cover109 source109
    (gridTreeUnionCheck_sound 32768 raw109 output109 cover109 source109 tree109 checked109)
    _ (by norm_num) _, areaUnits109]
  norm_num

-- Frozen phase 4006, atom 6285, type 1, source (19,54).
def leavesData110 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves110 : Fin 7 → DyadicLeaf := leavesData110.get
def raw110 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 19 54 leaves110 i
def outputData110 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨4864,4992,13824,13952⟩) (.node (.single ⟨4864,4992,13952,14080⟩) (.single ⟨4992,5056,13824,13888⟩))) (.node (.node (.single ⟨4992,5056,13888,13952⟩) (.single ⟨5056,5120,13824,13888⟩)) (.node (.single ⟨5056,5120,13888,13952⟩) (.single ⟨4992,5120,13952,14080⟩)))) (.node (.node (.single ⟨13824,13952,4864,4992⟩) (.node (.single ⟨13824,13888,4992,5056⟩) (.single ⟨13824,13888,5056,5120⟩))) (.node (.node (.single ⟨13888,13952,4992,5056⟩) (.single ⟨13888,13952,5056,5120⟩)) (.node (.single ⟨13952,14080,4864,4992⟩) (.single ⟨13952,14080,4992,5120⟩))))) (.node (.node (.node (.single ⟨18688,18816,27648,27776⟩) (.node (.single ⟨18688,18816,27776,27904⟩) (.single ⟨18816,18880,27648,27712⟩))) (.node (.node (.single ⟨18816,18880,27712,27776⟩) (.single ⟨18880,18944,27648,27712⟩)) (.node (.single ⟨18880,18944,27712,27776⟩) (.single ⟨18816,18944,27776,27904⟩)))) (.node (.node (.single ⟨27648,27776,18688,18816⟩) (.node (.single ⟨27648,27712,18816,18880⟩) (.single ⟨27648,27712,18880,18944⟩))) (.node (.node (.single ⟨27712,27776,18816,18880⟩) (.single ⟨27712,27776,18880,18944⟩)) (.node (.single ⟨27776,27904,18688,18816⟩) (.single ⟨27776,27904,18816,18944⟩))))))
def output110 : Fin 28 → GridBox := outputData110.get
def coverData110 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData110 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover110 (i : Fin 28) : Fin 28 := ⟨coverData110.get i % 28, Nat.mod_lt _ (by decide)⟩
def source110 (i : Fin 28) : Fin 28 := ⟨sourceData110.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree110 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 (.cutY 14336 (.cutX 5120 (.cutY 13312 .empty (.cutX 4608 .empty (.cutY 13824 .empty (.cutX 4864 .empty (.cutY 14080 (.cutX 4992 (.cutY 13952 .full .full) (.cutY 13952 (.cutX 5056 (.cutY 13888 .full .full) (.cutY 13888 .full .full)) .full)) .empty))))) .empty) .empty) .empty)))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 (.cutY 6144 (.cutX 13312 .empty (.cutY 5120 (.cutX 13824 .empty (.cutY 4608 .empty (.cutX 14080 (.cutY 4864 .empty (.cutX 13952 (.cutY 4992 .full (.cutX 13888 (.cutY 5056 .full .full) (.cutY 5056 .full .full))) (.cutY 4992 .full .full))) .empty))) .empty)) .empty) .empty))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 .empty (.cutY 26624 .empty (.cutX 19456 (.cutY 27648 .empty (.cutX 18944 (.cutY 28160 (.cutX 18688 .empty (.cutY 27904 (.cutX 18816 (.cutY 27776 .full .full) (.cutY 27776 (.cutX 18880 (.cutY 27712 .full .full) (.cutY 27712 .full .full)) .full)) .empty)) .empty) .empty)) .empty))) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 .empty (.cutY 18432 .empty (.cutX 27648 .empty (.cutY 19456 (.cutX 28160 (.cutY 18944 (.cutX 27904 (.cutY 18688 .empty (.cutX 27776 (.cutY 18816 .full (.cutX 27712 (.cutY 18880 .full .full) (.cutY 18880 .full .full))) (.cutY 18816 .full .full))) .empty) .empty) .empty) .empty)))) .empty) .empty) .empty))))

theorem metadata110 : 0<199204038 ∧ 19<128 ∧ 54<128 ∧ 1<4 ∧
    6285/4160=1 ∧ 6285%4160=2125 ∧ ∀ i, (leaves110 i).Valid 8 := by
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

noncomputable def phaseMass110 : ℝ := singlePhaseMass (199204038/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw110 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass110_eq : phaseMass110 = (99602019/819200000000 : ℝ) := by
  unfold phaseMass110
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw110 output110 cover110 source110
    (gridTreeUnionCheck_sound 32768 raw110 output110 cover110 source110 tree110 checked110)
    _ (by norm_num) _, areaUnits110]
  norm_num

-- Frozen phase 4007, atom 783, type 0, source (6,51).
def leavesData111 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves111 : Fin 4 → DyadicLeaf := leavesData111.get
def raw111 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 6 51 leaves111 i
def outputData111 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨1536,1664,13056,13184⟩) (.single ⟨1536,1664,13184,13312⟩)) (.node (.single ⟨1664,1792,13056,13184⟩) (.single ⟨1664,1792,13184,13312⟩))) (.node (.node (.single ⟨13056,13184,1536,1664⟩) (.single ⟨13056,13184,1664,1792⟩)) (.node (.single ⟨13184,13312,1536,1664⟩) (.single ⟨13184,13312,1664,1792⟩)))) (.node (.node (.node (.single ⟨19456,19584,30976,31104⟩) (.single ⟨19456,19584,31104,31232⟩)) (.node (.single ⟨19584,19712,30976,31104⟩) (.single ⟨19584,19712,31104,31232⟩))) (.node (.node (.single ⟨30976,31104,19456,19584⟩) (.single ⟨30976,31104,19584,19712⟩)) (.node (.single ⟨31104,31232,19456,19584⟩) (.single ⟨31104,31232,19584,19712⟩)))))
def output111 : Fin 16 → GridBox := outputData111.get
def coverData111 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData111 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover111 (i : Fin 16) : Fin 16 := ⟨coverData111.get i % 16, Nat.mod_lt _ (by decide)⟩
def source111 (i : Fin 16) : Fin 16 := ⟨sourceData111.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree111 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 (.cutX 1024 .empty (.cutY 13312 (.cutX 1536 .empty (.cutY 12800 .empty (.cutX 1792 (.cutY 13056 .empty (.cutX 1664 (.cutY 13184 .full .full) (.cutY 13184 .full .full))) .empty))) .empty)) .empty) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 (.cutY 2048 (.cutX 13312 (.cutY 1024 .empty (.cutX 12800 .empty (.cutY 1536 .empty (.cutX 13056 .empty (.cutY 1792 (.cutX 13184 (.cutY 1664 .full .full) (.cutY 1664 .full .full)) .empty))))) .empty) .empty) .empty) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 .empty (.cutY 30720 .empty (.cutX 19456 .empty (.cutY 31744 (.cutX 19968 (.cutY 31232 (.cutX 19712 (.cutY 30976 .empty (.cutX 19584 (.cutY 31104 .full .full) (.cutY 31104 .full .full))) .empty) .empty) .empty) .empty))))) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 .empty (.cutX 31744 (.cutY 19456 .empty (.cutX 31232 (.cutY 19968 (.cutX 30976 .empty (.cutY 19712 (.cutX 31104 (.cutY 19584 .full .full) (.cutY 19584 .full .full)) .empty)) .empty) .empty)) .empty))) .empty)) .empty))))

theorem metadata111 : 0<214747992 ∧ 6<128 ∧ 51<128 ∧ 0<4 ∧
    783/4160=0 ∧ 783%4160=783 ∧ ∀ i, (leaves111 i).Valid 8 := by
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

noncomputable def phaseMass111 : ℝ := singlePhaseMass (214747992/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw111 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass111_eq : phaseMass111 = (26843499/204800000000 : ℝ) := by
  unfold phaseMass111
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw111 output111 cover111 source111
    (gridTreeUnionCheck_sound 32768 raw111 output111 cover111 source111 tree111 checked111)
    _ (by norm_num) _, areaUnits111]
  norm_num

-- Frozen phase 4008, atom 3264, type 0, source (34,68).
def leavesData112 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves112 : Fin 4 → DyadicLeaf := leavesData112.get
def raw112 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 34 68 leaves112 i
def outputData112 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨8704,8832,17408,17536⟩) (.single ⟨8704,8832,17536,17664⟩)) (.node (.single ⟨8832,8960,17408,17536⟩) (.single ⟨8832,8960,17536,17664⟩))) (.node (.node (.single ⟨15104,15232,23808,23936⟩) (.single ⟨15104,15232,23936,24064⟩)) (.node (.single ⟨15232,15360,23808,23936⟩) (.single ⟨15232,15360,23936,24064⟩)))) (.node (.node (.node (.single ⟨17408,17536,8704,8832⟩) (.single ⟨17408,17536,8832,8960⟩)) (.node (.single ⟨17536,17664,8704,8832⟩) (.single ⟨17536,17664,8832,8960⟩))) (.node (.node (.single ⟨23808,23936,15104,15232⟩) (.single ⟨23808,23936,15232,15360⟩)) (.node (.single ⟨23936,24064,15104,15232⟩) (.single ⟨23936,24064,15232,15360⟩)))))
def output112 : Fin 16 → GridBox := outputData112.get
def coverData112 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData112 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover112 (i : Fin 16) : Fin 16 := ⟨coverData112.get i % 16, Nat.mod_lt _ (by decide)⟩
def source112 (i : Fin 16) : Fin 16 := ⟨sourceData112.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree112 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 (.cutY 18432 (.cutX 9216 (.cutY 17408 .empty (.cutX 8704 .empty (.cutY 17920 (.cutX 8960 (.cutY 17664 (.cutX 8832 (.cutY 17536 .full .full) (.cutY 17536 .full .full)) .empty) .empty) .empty))) .empty) .empty) .empty) .empty) (.cutY 20480 .empty (.cutX 14336 .empty (.cutY 22528 .empty (.cutX 15360 (.cutY 23552 .empty (.cutX 14848 .empty (.cutY 24064 (.cutX 15104 .empty (.cutY 23808 .empty (.cutX 15232 (.cutY 23936 .full .full) (.cutY 23936 .full .full)))) .empty))) .empty))))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 (.cutY 10240 (.cutX 17408 .empty (.cutY 9216 (.cutX 17920 (.cutY 8704 .empty (.cutX 17664 (.cutY 8960 (.cutX 17536 (.cutY 8832 .full .full) (.cutY 8832 .full .full)) .empty) .empty)) .empty) .empty)) .empty) .empty) .empty) (.cutY 12288 .empty (.cutX 22528 .empty (.cutY 14336 .empty (.cutX 23552 .empty (.cutY 15360 (.cutX 24064 (.cutY 14848 .empty (.cutX 23808 .empty (.cutY 15104 .empty (.cutX 23936 (.cutY 15232 .full .full) (.cutY 15232 .full .full))))) .empty) .empty))))))) .empty) .empty))

theorem metadata112 : 0<167572778 ∧ 34<128 ∧ 68<128 ∧ 0<4 ∧
    3264/4160=0 ∧ 3264%4160=3264 ∧ ∀ i, (leaves112 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData112).mp
    (by decide +kernel)

theorem sourceChecked112_0 : ∀ i : Fin 16,
    (fun i => output112 i = raw112 (source112 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked112 : ∀ i : Fin 16, (fun i => output112 i = raw112 (source112 i)) i :=
  forallFin_of_zero_offset (fun i => output112 i = raw112 (source112 i)) sourceChecked112_0

theorem coverChecked112_0 : ∀ i : Fin 16,
    (fun i => (output112 (cover112 i)).ContainsBox (raw112 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked112 : ∀ i : Fin 16, (fun i => (output112 (cover112 i)).ContainsBox (raw112 i)) i :=
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

noncomputable def phaseMass112 : ℝ := singlePhaseMass (167572778/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw112 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass112_eq : phaseMass112 = (83786389/819200000000 : ℝ) := by
  unfold phaseMass112
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw112 output112 cover112 source112
    (gridTreeUnionCheck_sound 32768 raw112 output112 cover112 source112 tree112 checked112)
    _ (by norm_num) _, areaUnits112]
  norm_num

-- Frozen phase 4009, atom 1123, type 0, source (9,52).
def leavesData113 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves113 : Fin 4 → DyadicLeaf := leavesData113.get
def raw113 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 9 52 leaves113 i
def outputData113 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨2304,2432,13312,13440⟩) (.single ⟨2304,2432,13440,13568⟩)) (.node (.single ⟨2432,2560,13312,13440⟩) (.single ⟨2432,2560,13440,13568⟩))) (.node (.node (.single ⟨13312,13440,2304,2432⟩) (.single ⟨13312,13440,2432,2560⟩)) (.node (.single ⟨13440,13568,2304,2432⟩) (.single ⟨13440,13568,2432,2560⟩)))) (.node (.node (.node (.single ⟨19200,19328,30208,30336⟩) (.single ⟨19200,19328,30336,30464⟩)) (.node (.single ⟨19328,19456,30208,30336⟩) (.single ⟨19328,19456,30336,30464⟩))) (.node (.node (.single ⟨30208,30336,19200,19328⟩) (.single ⟨30208,30336,19328,19456⟩)) (.node (.single ⟨30336,30464,19200,19328⟩) (.single ⟨30336,30464,19328,19456⟩)))))
def output113 : Fin 16 → GridBox := outputData113.get
def coverData113 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData113 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover113 (i : Fin 16) : Fin 16 := ⟨coverData113.get i % 16, Nat.mod_lt _ (by decide)⟩
def source113 (i : Fin 16) : Fin 16 := ⟨sourceData113.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree113 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 (.cutX 3072 (.cutY 13312 .empty (.cutX 2560 (.cutY 13824 (.cutX 2304 .empty (.cutY 13568 (.cutX 2432 (.cutY 13440 .full .full) (.cutY 13440 .full .full)) .empty)) .empty) .empty)) .empty) .empty))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 (.cutY 2048 .empty (.cutX 13312 .empty (.cutY 3072 (.cutX 13824 (.cutY 2560 (.cutX 13568 (.cutY 2304 .empty (.cutX 13440 (.cutY 2432 .full .full) (.cutY 2432 .full .full))) .empty) .empty) .empty) .empty))) .empty) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 .empty (.cutY 30720 (.cutX 19456 (.cutY 29696 .empty (.cutX 18944 .empty (.cutY 30208 .empty (.cutX 19200 .empty (.cutY 30464 (.cutX 19328 (.cutY 30336 .full .full) (.cutY 30336 .full .full)) .empty))))) .empty) .empty))) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 .empty (.cutX 29696 .empty (.cutY 19456 (.cutX 30208 .empty (.cutY 18944 .empty (.cutX 30464 (.cutY 19200 .empty (.cutX 30336 (.cutY 19328 .full .full) (.cutY 19328 .full .full))) .empty))) .empty))) .empty) .empty)) .empty))))

theorem metadata113 : 0<206808448 ∧ 9<128 ∧ 52<128 ∧ 0<4 ∧
    1123/4160=0 ∧ 1123%4160=1123 ∧ ∀ i, (leaves113 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData113).mp
    (by decide +kernel)

theorem sourceChecked113_0 : ∀ i : Fin 16,
    (fun i => output113 i = raw113 (source113 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked113 : ∀ i : Fin 16, (fun i => output113 i = raw113 (source113 i)) i :=
  forallFin_of_zero_offset (fun i => output113 i = raw113 (source113 i)) sourceChecked113_0

theorem coverChecked113_0 : ∀ i : Fin 16,
    (fun i => (output113 (cover113 i)).ContainsBox (raw113 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked113 : ∀ i : Fin 16, (fun i => (output113 (cover113 i)).ContainsBox (raw113 i)) i :=
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

noncomputable def phaseMass113 : ℝ := singlePhaseMass (206808448/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw113 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass113_eq : phaseMass113 = (1615691/12800000000 : ℝ) := by
  unfold phaseMass113
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw113 output113 cover113 source113
    (gridTreeUnionCheck_sound 32768 raw113 output113 cover113 source113 tree113 checked113)
    _ (by norm_num) _, areaUnits113]
  norm_num

-- Frozen phase 4010, atom 2713, type 0, source (26,61).
def leavesData114 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves114 : Fin 4 → DyadicLeaf := leavesData114.get
def raw114 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 26 61 leaves114 i
def outputData114 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨6656,6784,15616,15744⟩) (.single ⟨6656,6784,15744,15872⟩)) (.node (.single ⟨6784,6912,15616,15744⟩) (.single ⟨6784,6912,15744,15872⟩))) (.node (.node (.single ⟨15616,15744,6656,6784⟩) (.single ⟨15616,15744,6784,6912⟩)) (.node (.single ⟨15744,15872,6656,6784⟩) (.single ⟨15744,15872,6784,6912⟩)))) (.node (.node (.node (.single ⟨16896,17024,25856,25984⟩) (.single ⟨16896,17024,25984,26112⟩)) (.node (.single ⟨17024,17152,25856,25984⟩) (.single ⟨17024,17152,25984,26112⟩))) (.node (.node (.single ⟨25856,25984,16896,17024⟩) (.single ⟨25856,25984,17024,17152⟩)) (.node (.single ⟨25984,26112,16896,17024⟩) (.single ⟨25984,26112,17024,17152⟩)))))
def output114 : Fin 16 → GridBox := outputData114.get
def coverData114 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData114 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover114 (i : Fin 16) : Fin 16 := ⟨coverData114.get i % 16, Nat.mod_lt _ (by decide)⟩
def source114 (i : Fin 16) : Fin 16 := ⟨sourceData114.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree114 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 .empty (.cutY 14336 .empty (.cutX 7168 (.cutY 15360 .empty (.cutX 6656 .empty (.cutY 15872 (.cutX 6912 (.cutY 15616 .empty (.cutX 6784 (.cutY 15744 .full .full) (.cutY 15744 .full .full))) .empty) .empty))) .empty)))))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 .empty (.cutY 6144 .empty (.cutX 15360 .empty (.cutY 7168 (.cutX 15872 (.cutY 6656 .empty (.cutX 15616 .empty (.cutY 6912 (.cutX 15744 (.cutY 6784 .full .full) (.cutY 6784 .full .full)) .empty))) .empty) .empty)))))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 (.cutY 26624 (.cutX 17408 (.cutY 25600 .empty (.cutX 16896 .empty (.cutY 26112 (.cutX 17152 (.cutY 25856 .empty (.cutX 17024 (.cutY 25984 .full .full) (.cutY 25984 .full .full))) .empty) .empty))) .empty) .empty) .empty) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 (.cutY 18432 (.cutX 25600 .empty (.cutY 17408 (.cutX 26112 (.cutY 16896 .empty (.cutX 25856 .empty (.cutY 17152 (.cutX 25984 (.cutY 17024 .full .full) (.cutY 17024 .full .full)) .empty))) .empty) .empty)) .empty) .empty) .empty) .empty) .empty))))

theorem metadata114 : 0<29910597 ∧ 26<128 ∧ 61<128 ∧ 0<4 ∧
    2713/4160=0 ∧ 2713%4160=2713 ∧ ∀ i, (leaves114 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData114).mp
    (by decide +kernel)

theorem sourceChecked114_0 : ∀ i : Fin 16,
    (fun i => output114 i = raw114 (source114 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked114 : ∀ i : Fin 16, (fun i => output114 i = raw114 (source114 i)) i :=
  forallFin_of_zero_offset (fun i => output114 i = raw114 (source114 i)) sourceChecked114_0

theorem coverChecked114_0 : ∀ i : Fin 16,
    (fun i => (output114 (cover114 i)).ContainsBox (raw114 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked114 : ∀ i : Fin 16, (fun i => (output114 (cover114 i)).ContainsBox (raw114 i)) i :=
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

noncomputable def phaseMass114 : ℝ := singlePhaseMass (29910597/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw114 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass114_eq : phaseMass114 = (29910597/1638400000000 : ℝ) := by
  unfold phaseMass114
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw114 output114 cover114 source114
    (gridTreeUnionCheck_sound 32768 raw114 output114 cover114 source114 tree114 checked114)
    _ (by norm_num) _, areaUnits114]
  norm_num

-- Frozen phase 4011, atom 3324, type 0, source (35,69).
def leavesData115 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves115 : Fin 4 → DyadicLeaf := leavesData115.get
def raw115 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 35 69 leaves115 i
def outputData115 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨8960,9088,17664,17792⟩) (.single ⟨8960,9088,17792,17920⟩)) (.node (.single ⟨9088,9216,17664,17792⟩) (.single ⟨9088,9216,17792,17920⟩))) (.node (.node (.single ⟨14848,14976,23552,23680⟩) (.single ⟨14848,14976,23680,23808⟩)) (.node (.single ⟨14976,15104,23552,23680⟩) (.single ⟨14976,15104,23680,23808⟩)))) (.node (.node (.node (.single ⟨17664,17792,8960,9088⟩) (.single ⟨17664,17792,9088,9216⟩)) (.node (.single ⟨17792,17920,8960,9088⟩) (.single ⟨17792,17920,9088,9216⟩))) (.node (.node (.single ⟨23552,23680,14848,14976⟩) (.single ⟨23552,23680,14976,15104⟩)) (.node (.single ⟨23680,23808,14848,14976⟩) (.single ⟨23680,23808,14976,15104⟩)))))
def output115 : Fin 16 → GridBox := outputData115.get
def coverData115 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData115 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover115 (i : Fin 16) : Fin 16 := ⟨coverData115.get i % 16, Nat.mod_lt _ (by decide)⟩
def source115 (i : Fin 16) : Fin 16 := ⟨sourceData115.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree115 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 (.cutY 18432 (.cutX 9216 (.cutY 17408 .empty (.cutX 8704 .empty (.cutY 17920 (.cutX 8960 .empty (.cutY 17664 .empty (.cutX 9088 (.cutY 17792 .full .full) (.cutY 17792 .full .full)))) .empty))) .empty) .empty) .empty) .empty) (.cutY 20480 .empty (.cutX 14336 .empty (.cutY 22528 .empty (.cutX 15360 (.cutY 23552 .empty (.cutX 14848 .empty (.cutY 24064 (.cutX 15104 (.cutY 23808 (.cutX 14976 (.cutY 23680 .full .full) (.cutY 23680 .full .full)) .empty) .empty) .empty))) .empty))))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 (.cutY 10240 (.cutX 17408 .empty (.cutY 9216 (.cutX 17920 (.cutY 8704 .empty (.cutX 17664 .empty (.cutY 8960 .empty (.cutX 17792 (.cutY 9088 .full .full) (.cutY 9088 .full .full))))) .empty) .empty)) .empty) .empty) .empty) (.cutY 12288 .empty (.cutX 22528 .empty (.cutY 14336 .empty (.cutX 23552 .empty (.cutY 15360 (.cutX 24064 (.cutY 14848 .empty (.cutX 23808 (.cutY 15104 (.cutX 23680 (.cutY 14976 .full .full) (.cutY 14976 .full .full)) .empty) .empty)) .empty) .empty))))))) .empty) .empty))

theorem metadata115 : 0<167572778 ∧ 35<128 ∧ 69<128 ∧ 0<4 ∧
    3324/4160=0 ∧ 3324%4160=3324 ∧ ∀ i, (leaves115 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData115).mp
    (by decide +kernel)

theorem sourceChecked115_0 : ∀ i : Fin 16,
    (fun i => output115 i = raw115 (source115 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked115 : ∀ i : Fin 16, (fun i => output115 i = raw115 (source115 i)) i :=
  forallFin_of_zero_offset (fun i => output115 i = raw115 (source115 i)) sourceChecked115_0

theorem coverChecked115_0 : ∀ i : Fin 16,
    (fun i => (output115 (cover115 i)).ContainsBox (raw115 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked115 : ∀ i : Fin 16, (fun i => (output115 (cover115 i)).ContainsBox (raw115 i)) i :=
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

noncomputable def phaseMass115 : ℝ := singlePhaseMass (167572778/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw115 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass115_eq : phaseMass115 = (83786389/819200000000 : ℝ) := by
  unfold phaseMass115
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw115 output115 cover115 source115
    (gridTreeUnionCheck_sound 32768 raw115 output115 cover115 source115 tree115 checked115)
    _ (by norm_num) _, areaUnits115]
  norm_num

-- Frozen phase 4012, atom 1943, type 0, source (17,56).
def leavesData116 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves116 : Fin 4 → DyadicLeaf := leavesData116.get
def raw116 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 17 56 leaves116 i
def outputData116 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨4352,4480,14336,14464⟩) (.single ⟨4352,4480,14464,14592⟩)) (.node (.single ⟨4480,4608,14336,14464⟩) (.single ⟨4480,4608,14464,14592⟩))) (.node (.node (.single ⟨14336,14464,4352,4480⟩) (.single ⟨14336,14464,4480,4608⟩)) (.node (.single ⟨14464,14592,4352,4480⟩) (.single ⟨14464,14592,4480,4608⟩)))) (.node (.node (.node (.single ⟨18176,18304,28160,28288⟩) (.single ⟨18176,18304,28288,28416⟩)) (.node (.single ⟨18304,18432,28160,28288⟩) (.single ⟨18304,18432,28288,28416⟩))) (.node (.node (.single ⟨28160,28288,18176,18304⟩) (.single ⟨28160,28288,18304,18432⟩)) (.node (.single ⟨28288,28416,18176,18304⟩) (.single ⟨28288,28416,18304,18432⟩)))))
def output116 : Fin 16 → GridBox := outputData116.get
def coverData116 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData116 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover116 (i : Fin 16) : Fin 16 := ⟨coverData116.get i % 16, Nat.mod_lt _ (by decide)⟩
def source116 (i : Fin 16) : Fin 16 := ⟨sourceData116.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree116 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 (.cutY 14336 .empty (.cutX 5120 (.cutY 15360 (.cutX 4608 (.cutY 14848 (.cutX 4352 .empty (.cutY 14592 (.cutX 4480 (.cutY 14464 .full .full) (.cutY 14464 .full .full)) .empty)) .empty) .empty) .empty) .empty)) .empty)))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 .empty (.cutY 6144 (.cutX 15360 (.cutY 5120 (.cutX 14848 (.cutY 4608 (.cutX 14592 (.cutY 4352 .empty (.cutX 14464 (.cutY 4480 .full .full) (.cutY 4480 .full .full))) .empty) .empty) .empty) .empty) .empty) .empty)))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 (.cutY 26624 .empty (.cutX 17408 .empty (.cutY 27648 .empty (.cutX 17920 .empty (.cutY 28160 .empty (.cutX 18176 .empty (.cutY 28416 (.cutX 18304 (.cutY 28288 .full .full) (.cutY 28288 .full .full)) .empty))))))) .empty) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 .empty (.cutY 18432 (.cutX 27648 .empty (.cutY 17408 .empty (.cutX 28160 .empty (.cutY 17920 .empty (.cutX 28416 (.cutY 18176 .empty (.cutX 28288 (.cutY 18304 .full .full) (.cutY 18304 .full .full))) .empty))))) .empty)) .empty) .empty) .empty))))

theorem metadata116 : 0<185830537 ∧ 17<128 ∧ 56<128 ∧ 0<4 ∧
    1943/4160=0 ∧ 1943%4160=1943 ∧ ∀ i, (leaves116 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData116).mp
    (by decide +kernel)

theorem sourceChecked116_0 : ∀ i : Fin 16,
    (fun i => output116 i = raw116 (source116 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked116 : ∀ i : Fin 16, (fun i => output116 i = raw116 (source116 i)) i :=
  forallFin_of_zero_offset (fun i => output116 i = raw116 (source116 i)) sourceChecked116_0

theorem coverChecked116_0 : ∀ i : Fin 16,
    (fun i => (output116 (cover116 i)).ContainsBox (raw116 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked116 : ∀ i : Fin 16, (fun i => (output116 (cover116 i)).ContainsBox (raw116 i)) i :=
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

noncomputable def phaseMass116 : ℝ := singlePhaseMass (185830537/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw116 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass116_eq : phaseMass116 = (185830537/1638400000000 : ℝ) := by
  unfold phaseMass116
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw116 output116 cover116 source116
    (gridTreeUnionCheck_sound 32768 raw116 output116 cover116 source116 tree116 checked116)
    _ (by norm_num) _, areaUnits116]
  norm_num

-- Frozen phase 4013, atom 177, type 0, source (1,50).
def leavesData117 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves117 : Fin 4 → DyadicLeaf := leavesData117.get
def raw117 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 1 50 leaves117 i
def outputData117 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨256,384,12800,12928⟩) (.single ⟨256,384,12928,13056⟩)) (.node (.single ⟨384,512,12800,12928⟩) (.single ⟨384,512,12928,13056⟩))) (.node (.node (.single ⟨12800,12928,256,384⟩) (.single ⟨12800,12928,384,512⟩)) (.node (.single ⟨12928,13056,256,384⟩) (.single ⟨12928,13056,384,512⟩)))) (.node (.node (.node (.single ⟨19712,19840,32256,32384⟩) (.single ⟨19712,19840,32384,32512⟩)) (.node (.single ⟨19840,19968,32256,32384⟩) (.single ⟨19840,19968,32384,32512⟩))) (.node (.node (.single ⟨32256,32384,19712,19840⟩) (.single ⟨32256,32384,19840,19968⟩)) (.node (.single ⟨32384,32512,19712,19840⟩) (.single ⟨32384,32512,19840,19968⟩)))))
def output117 : Fin 16 → GridBox := outputData117.get
def coverData117 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData117 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover117 (i : Fin 16) : Fin 16 := ⟨coverData117.get i % 16, Nat.mod_lt _ (by decide)⟩
def source117 (i : Fin 16) : Fin 16 := ⟨sourceData117.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree117 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 (.cutX 1024 (.cutY 13312 (.cutX 512 (.cutY 12800 .empty (.cutX 256 .empty (.cutY 13056 (.cutX 384 (.cutY 12928 .full .full) (.cutY 12928 .full .full)) .empty))) .empty) .empty) .empty) .empty) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 (.cutY 2048 (.cutX 13312 (.cutY 1024 (.cutX 12800 .empty (.cutY 512 (.cutX 13056 (.cutY 256 .empty (.cutX 12928 (.cutY 384 .full .full) (.cutY 384 .full .full))) .empty) .empty)) .empty) .empty) .empty) .empty) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 .empty (.cutY 30720 .empty (.cutX 19456 .empty (.cutY 31744 .empty (.cutX 19968 (.cutY 32256 .empty (.cutX 19712 .empty (.cutY 32512 (.cutX 19840 (.cutY 32384 .full .full) (.cutY 32384 .full .full)) .empty))) .empty)))))) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 .empty (.cutX 31744 .empty (.cutY 19456 .empty (.cutX 32256 .empty (.cutY 19968 (.cutX 32512 (.cutY 19712 .empty (.cutX 32384 (.cutY 19840 .full .full) (.cutY 19840 .full .full))) .empty) .empty)))))) .empty)) .empty))))

theorem metadata117 : 0<214747992 ∧ 1<128 ∧ 50<128 ∧ 0<4 ∧
    177/4160=0 ∧ 177%4160=177 ∧ ∀ i, (leaves117 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData117).mp
    (by decide +kernel)

theorem sourceChecked117_0 : ∀ i : Fin 16,
    (fun i => output117 i = raw117 (source117 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked117 : ∀ i : Fin 16, (fun i => output117 i = raw117 (source117 i)) i :=
  forallFin_of_zero_offset (fun i => output117 i = raw117 (source117 i)) sourceChecked117_0

theorem coverChecked117_0 : ∀ i : Fin 16,
    (fun i => (output117 (cover117 i)).ContainsBox (raw117 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked117 : ∀ i : Fin 16, (fun i => (output117 (cover117 i)).ContainsBox (raw117 i)) i :=
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

noncomputable def phaseMass117 : ℝ := singlePhaseMass (214747992/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw117 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass117_eq : phaseMass117 = (26843499/204800000000 : ℝ) := by
  unfold phaseMass117
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw117 output117 cover117 source117
    (gridTreeUnionCheck_sound 32768 raw117 output117 cover117 source117 tree117 checked117)
    _ (by norm_num) _, areaUnits117]
  norm_num

-- Frozen phase 4014, atom 666, type 0, source (5,51).
def leavesData118 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves118 : Fin 4 → DyadicLeaf := leavesData118.get
def raw118 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 5 51 leaves118 i
def outputData118 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨1280,1408,13056,13184⟩) (.single ⟨1280,1408,13184,13312⟩)) (.node (.single ⟨1408,1536,13056,13184⟩) (.single ⟨1408,1536,13184,13312⟩))) (.node (.node (.single ⟨13056,13184,1280,1408⟩) (.single ⟨13056,13184,1408,1536⟩)) (.node (.single ⟨13184,13312,1280,1408⟩) (.single ⟨13184,13312,1408,1536⟩)))) (.node (.node (.node (.single ⟨19456,19584,31232,31360⟩) (.single ⟨19456,19584,31360,31488⟩)) (.node (.single ⟨19584,19712,31232,31360⟩) (.single ⟨19584,19712,31360,31488⟩))) (.node (.node (.single ⟨31232,31360,19456,19584⟩) (.single ⟨31232,31360,19584,19712⟩)) (.node (.single ⟨31360,31488,19456,19584⟩) (.single ⟨31360,31488,19584,19712⟩)))))
def output118 : Fin 16 → GridBox := outputData118.get
def coverData118 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData118 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover118 (i : Fin 16) : Fin 16 := ⟨coverData118.get i % 16, Nat.mod_lt _ (by decide)⟩
def source118 (i : Fin 16) : Fin 16 := ⟨sourceData118.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree118 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 (.cutX 1024 .empty (.cutY 13312 (.cutX 1536 (.cutY 12800 .empty (.cutX 1280 .empty (.cutY 13056 .empty (.cutX 1408 (.cutY 13184 .full .full) (.cutY 13184 .full .full))))) .empty) .empty)) .empty) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 (.cutY 2048 (.cutX 13312 (.cutY 1024 .empty (.cutX 12800 .empty (.cutY 1536 (.cutX 13056 .empty (.cutY 1280 .empty (.cutX 13184 (.cutY 1408 .full .full) (.cutY 1408 .full .full)))) .empty))) .empty) .empty) .empty) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 .empty (.cutY 30720 .empty (.cutX 19456 .empty (.cutY 31744 (.cutX 19968 (.cutY 31232 .empty (.cutX 19712 (.cutY 31488 (.cutX 19584 (.cutY 31360 .full .full) (.cutY 31360 .full .full)) .empty) .empty)) .empty) .empty))))) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 .empty (.cutX 31744 (.cutY 19456 .empty (.cutX 31232 .empty (.cutY 19968 (.cutX 31488 (.cutY 19712 (.cutX 31360 (.cutY 19584 .full .full) (.cutY 19584 .full .full)) .empty) .empty) .empty))) .empty))) .empty)) .empty))))

theorem metadata118 : 0<214747992 ∧ 5<128 ∧ 51<128 ∧ 0<4 ∧
    666/4160=0 ∧ 666%4160=666 ∧ ∀ i, (leaves118 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData118).mp
    (by decide +kernel)

theorem sourceChecked118_0 : ∀ i : Fin 16,
    (fun i => output118 i = raw118 (source118 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked118 : ∀ i : Fin 16, (fun i => output118 i = raw118 (source118 i)) i :=
  forallFin_of_zero_offset (fun i => output118 i = raw118 (source118 i)) sourceChecked118_0

theorem coverChecked118_0 : ∀ i : Fin 16,
    (fun i => (output118 (cover118 i)).ContainsBox (raw118 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked118 : ∀ i : Fin 16, (fun i => (output118 (cover118 i)).ContainsBox (raw118 i)) i :=
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

noncomputable def phaseMass118 : ℝ := singlePhaseMass (214747992/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw118 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass118_eq : phaseMass118 = (26843499/204800000000 : ℝ) := by
  unfold phaseMass118
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw118 output118 cover118 source118
    (gridTreeUnionCheck_sound 32768 raw118 output118 cover118 source118 tree118 checked118)
    _ (by norm_num) _, areaUnits118]
  norm_num

-- Frozen phase 4015, atom 2391, type 0, source (22,59).
def leavesData119 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves119 : Fin 4 → DyadicLeaf := leavesData119.get
def raw119 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 22 59 leaves119 i
def outputData119 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨5632,5760,15104,15232⟩) (.single ⟨5632,5760,15232,15360⟩)) (.node (.single ⟨5760,5888,15104,15232⟩) (.single ⟨5760,5888,15232,15360⟩))) (.node (.node (.single ⟨15104,15232,5632,5760⟩) (.single ⟨15104,15232,5760,5888⟩)) (.node (.single ⟨15232,15360,5632,5760⟩) (.single ⟨15232,15360,5760,5888⟩)))) (.node (.node (.node (.single ⟨17408,17536,26880,27008⟩) (.single ⟨17408,17536,27008,27136⟩)) (.node (.single ⟨17536,17664,26880,27008⟩) (.single ⟨17536,17664,27008,27136⟩))) (.node (.node (.single ⟨26880,27008,17408,17536⟩) (.single ⟨26880,27008,17536,17664⟩)) (.node (.single ⟨27008,27136,17408,17536⟩) (.single ⟨27008,27136,17536,17664⟩)))))
def output119 : Fin 16 → GridBox := outputData119.get
def coverData119 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData119 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover119 (i : Fin 16) : Fin 16 := ⟨coverData119.get i % 16, Nat.mod_lt _ (by decide)⟩
def source119 (i : Fin 16) : Fin 16 := ⟨sourceData119.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree119 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 (.cutY 14336 .empty (.cutX 5120 .empty (.cutY 15360 (.cutX 5632 .empty (.cutY 14848 .empty (.cutX 5888 (.cutY 15104 .empty (.cutX 5760 (.cutY 15232 .full .full) (.cutY 15232 .full .full))) .empty))) .empty))) .empty)))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 .empty (.cutY 6144 (.cutX 15360 (.cutY 5120 .empty (.cutX 14848 .empty (.cutY 5632 .empty (.cutX 15104 .empty (.cutY 5888 (.cutX 15232 (.cutY 5760 .full .full) (.cutY 5760 .full .full)) .empty))))) .empty) .empty)))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 (.cutY 26624 .empty (.cutX 17408 .empty (.cutY 27648 (.cutX 17920 (.cutY 27136 (.cutX 17664 (.cutY 26880 .empty (.cutX 17536 (.cutY 27008 .full .full) (.cutY 27008 .full .full))) .empty) .empty) .empty) .empty))) .empty) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 .empty (.cutY 18432 (.cutX 27648 (.cutY 17408 .empty (.cutX 27136 (.cutY 17920 (.cutX 26880 .empty (.cutY 17664 (.cutX 27008 (.cutY 17536 .full .full) (.cutY 17536 .full .full)) .empty)) .empty) .empty)) .empty) .empty)) .empty) .empty) .empty))))

theorem metadata119 : 0<185830537 ∧ 22<128 ∧ 59<128 ∧ 0<4 ∧
    2391/4160=0 ∧ 2391%4160=2391 ∧ ∀ i, (leaves119 i).Valid 8 := by
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

noncomputable def phaseMass119 : ℝ := singlePhaseMass (185830537/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw119 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass119_eq : phaseMass119 = (185830537/1638400000000 : ℝ) := by
  unfold phaseMass119
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw119 output119 cover119 source119
    (gridTreeUnionCheck_sound 32768 raw119 output119 cover119 source119 tree119 checked119)
    _ (by norm_num) _, areaUnits119]
  norm_num

-- Frozen phase 4016, atom 1340, type 0, source (11,53).
def leavesData120 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves120 : Fin 4 → DyadicLeaf := leavesData120.get
def raw120 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 11 53 leaves120 i
def outputData120 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨2816,2944,13568,13696⟩) (.single ⟨2816,2944,13696,13824⟩)) (.node (.single ⟨2944,3072,13568,13696⟩) (.single ⟨2944,3072,13696,13824⟩))) (.node (.node (.single ⟨13568,13696,2816,2944⟩) (.single ⟨13568,13696,2944,3072⟩)) (.node (.single ⟨13696,13824,2816,2944⟩) (.single ⟨13696,13824,2944,3072⟩)))) (.node (.node (.node (.single ⟨18944,19072,29696,29824⟩) (.single ⟨18944,19072,29824,29952⟩)) (.node (.single ⟨19072,19200,29696,29824⟩) (.single ⟨19072,19200,29824,29952⟩))) (.node (.node (.single ⟨29696,29824,18944,19072⟩) (.single ⟨29696,29824,19072,19200⟩)) (.node (.single ⟨29824,29952,18944,19072⟩) (.single ⟨29824,29952,19072,19200⟩)))))
def output120 : Fin 16 → GridBox := outputData120.get
def coverData120 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData120 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover120 (i : Fin 16) : Fin 16 := ⟨coverData120.get i % 16, Nat.mod_lt _ (by decide)⟩
def source120 (i : Fin 16) : Fin 16 := ⟨sourceData120.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree120 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 (.cutX 3072 (.cutY 13312 .empty (.cutX 2560 .empty (.cutY 13824 (.cutX 2816 .empty (.cutY 13568 .empty (.cutX 2944 (.cutY 13696 .full .full) (.cutY 13696 .full .full)))) .empty))) .empty) .empty))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 (.cutY 2048 .empty (.cutX 13312 .empty (.cutY 3072 (.cutX 13824 (.cutY 2560 .empty (.cutX 13568 .empty (.cutY 2816 .empty (.cutX 13696 (.cutY 2944 .full .full) (.cutY 2944 .full .full))))) .empty) .empty))) .empty) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 .empty (.cutY 30720 (.cutX 19456 (.cutY 29696 .empty (.cutX 18944 .empty (.cutY 30208 (.cutX 19200 (.cutY 29952 (.cutX 19072 (.cutY 29824 .full .full) (.cutY 29824 .full .full)) .empty) .empty) .empty))) .empty) .empty))) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 .empty (.cutX 29696 .empty (.cutY 19456 (.cutX 30208 (.cutY 18944 .empty (.cutX 29952 (.cutY 19200 (.cutX 29824 (.cutY 19072 .full .full) (.cutY 19072 .full .full)) .empty) .empty)) .empty) .empty))) .empty) .empty)) .empty))))

theorem metadata120 : 0<206808448 ∧ 11<128 ∧ 53<128 ∧ 0<4 ∧
    1340/4160=0 ∧ 1340%4160=1340 ∧ ∀ i, (leaves120 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData120).mp
    (by decide +kernel)

theorem sourceChecked120_0 : ∀ i : Fin 16,
    (fun i => output120 i = raw120 (source120 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked120 : ∀ i : Fin 16, (fun i => output120 i = raw120 (source120 i)) i :=
  forallFin_of_zero_offset (fun i => output120 i = raw120 (source120 i)) sourceChecked120_0

theorem coverChecked120_0 : ∀ i : Fin 16,
    (fun i => (output120 (cover120 i)).ContainsBox (raw120 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked120 : ∀ i : Fin 16, (fun i => (output120 (cover120 i)).ContainsBox (raw120 i)) i :=
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

noncomputable def phaseMass120 : ℝ := singlePhaseMass (206808448/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw120 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass120_eq : phaseMass120 = (1615691/12800000000 : ℝ) := by
  unfold phaseMass120
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw120 output120 cover120 source120
    (gridTreeUnionCheck_sound 32768 raw120 output120 cover120 source120 tree120 checked120)
    _ (by norm_num) _, areaUnits120]
  norm_num

-- Frozen phase 4017, atom 1750, type 0, source (15,55).
def leavesData121 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves121 : Fin 4 → DyadicLeaf := leavesData121.get
def raw121 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 15 55 leaves121 i
def outputData121 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨3840,3968,14080,14208⟩) (.single ⟨3840,3968,14208,14336⟩)) (.node (.single ⟨3968,4096,14080,14208⟩) (.single ⟨3968,4096,14208,14336⟩))) (.node (.node (.single ⟨14080,14208,3840,3968⟩) (.single ⟨14080,14208,3968,4096⟩)) (.node (.single ⟨14208,14336,3840,3968⟩) (.single ⟨14208,14336,3968,4096⟩)))) (.node (.node (.node (.single ⟨18432,18560,28672,28800⟩) (.single ⟨18432,18560,28800,28928⟩)) (.node (.single ⟨18560,18688,28672,28800⟩) (.single ⟨18560,18688,28800,28928⟩))) (.node (.node (.single ⟨28672,28800,18432,18560⟩) (.single ⟨28672,28800,18560,18688⟩)) (.node (.single ⟨28800,28928,18432,18560⟩) (.single ⟨28800,28928,18560,18688⟩)))))
def output121 : Fin 16 → GridBox := outputData121.get
def coverData121 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData121 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover121 (i : Fin 16) : Fin 16 := ⟨coverData121.get i % 16, Nat.mod_lt _ (by decide)⟩
def source121 (i : Fin 16) : Fin 16 := ⟨sourceData121.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree121 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 (.cutX 3072 .empty (.cutY 13312 .empty (.cutX 3584 .empty (.cutY 13824 .empty (.cutX 3840 .empty (.cutY 14080 .empty (.cutX 3968 (.cutY 14208 .full .full) (.cutY 14208 .full .full)))))))) .empty))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 (.cutY 2048 .empty (.cutX 13312 .empty (.cutY 3072 .empty (.cutX 13824 .empty (.cutY 3584 .empty (.cutX 14080 .empty (.cutY 3840 .empty (.cutX 14208 (.cutY 3968 .full .full) (.cutY 3968 .full .full))))))))) .empty) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 .empty (.cutY 30720 (.cutX 19456 (.cutY 29696 (.cutX 18944 (.cutY 29184 (.cutX 18688 (.cutY 28928 (.cutX 18560 (.cutY 28800 .full .full) (.cutY 28800 .full .full)) .empty) .empty) .empty) .empty) .empty) .empty) .empty))) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 .empty (.cutX 29696 (.cutY 19456 (.cutX 29184 (.cutY 18944 (.cutX 28928 (.cutY 18688 (.cutX 28800 (.cutY 18560 .full .full) (.cutY 18560 .full .full)) .empty) .empty) .empty) .empty) .empty) .empty)) .empty) .empty)) .empty))))

theorem metadata121 : 0<206808448 ∧ 15<128 ∧ 55<128 ∧ 0<4 ∧
    1750/4160=0 ∧ 1750%4160=1750 ∧ ∀ i, (leaves121 i).Valid 8 := by
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

noncomputable def phaseMass121 : ℝ := singlePhaseMass (206808448/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw121 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass121_eq : phaseMass121 = (1615691/12800000000 : ℝ) := by
  unfold phaseMass121
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw121 output121 cover121 source121
    (gridTreeUnionCheck_sound 32768 raw121 output121 cover121 source121 tree121 checked121)
    _ (by norm_num) _, areaUnits121]
  norm_num

-- Frozen phase 4018, atom 1549, type 0, source (13,54).
def leavesData122 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves122 : Fin 4 → DyadicLeaf := leavesData122.get
def raw122 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 13 54 leaves122 i
def outputData122 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨3328,3456,13824,13952⟩) (.single ⟨3328,3456,13952,14080⟩)) (.node (.single ⟨3456,3584,13824,13952⟩) (.single ⟨3456,3584,13952,14080⟩))) (.node (.node (.single ⟨13824,13952,3328,3456⟩) (.single ⟨13824,13952,3456,3584⟩)) (.node (.single ⟨13952,14080,3328,3456⟩) (.single ⟨13952,14080,3456,3584⟩)))) (.node (.node (.node (.single ⟨18688,18816,29184,29312⟩) (.single ⟨18688,18816,29312,29440⟩)) (.node (.single ⟨18816,18944,29184,29312⟩) (.single ⟨18816,18944,29312,29440⟩))) (.node (.node (.single ⟨29184,29312,18688,18816⟩) (.single ⟨29184,29312,18816,18944⟩)) (.node (.single ⟨29312,29440,18688,18816⟩) (.single ⟨29312,29440,18816,18944⟩)))))
def output122 : Fin 16 → GridBox := outputData122.get
def coverData122 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData122 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover122 (i : Fin 16) : Fin 16 := ⟨coverData122.get i % 16, Nat.mod_lt _ (by decide)⟩
def source122 (i : Fin 16) : Fin 16 := ⟨sourceData122.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree122 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 (.cutX 3072 .empty (.cutY 13312 .empty (.cutX 3584 (.cutY 13824 .empty (.cutX 3328 .empty (.cutY 14080 (.cutX 3456 (.cutY 13952 .full .full) (.cutY 13952 .full .full)) .empty))) .empty))) .empty))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 (.cutY 2048 .empty (.cutX 13312 .empty (.cutY 3072 .empty (.cutX 13824 .empty (.cutY 3584 (.cutX 14080 (.cutY 3328 .empty (.cutX 13952 (.cutY 3456 .full .full) (.cutY 3456 .full .full))) .empty) .empty))))) .empty) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 .empty (.cutY 30720 (.cutX 19456 (.cutY 29696 (.cutX 18944 (.cutY 29184 .empty (.cutX 18688 .empty (.cutY 29440 (.cutX 18816 (.cutY 29312 .full .full) (.cutY 29312 .full .full)) .empty))) .empty) .empty) .empty) .empty))) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 .empty (.cutX 29696 (.cutY 19456 (.cutX 29184 .empty (.cutY 18944 (.cutX 29440 (.cutY 18688 .empty (.cutX 29312 (.cutY 18816 .full .full) (.cutY 18816 .full .full))) .empty) .empty)) .empty) .empty)) .empty) .empty)) .empty))))

theorem metadata122 : 0<206808448 ∧ 13<128 ∧ 54<128 ∧ 0<4 ∧
    1549/4160=0 ∧ 1549%4160=1549 ∧ ∀ i, (leaves122 i).Valid 8 := by
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

noncomputable def phaseMass122 : ℝ := singlePhaseMass (206808448/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw122 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass122_eq : phaseMass122 = (1615691/12800000000 : ℝ) := by
  unfold phaseMass122
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw122 output122 cover122 source122
    (gridTreeUnionCheck_sound 32768 raw122 output122 cover122 source122 tree122 checked122)
    _ (by norm_num) _, areaUnits122]
  norm_num

-- Frozen phase 4019, atom 3382, type 0, source (36,70).
def leavesData123 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves123 : Fin 4 → DyadicLeaf := leavesData123.get
def raw123 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 36 70 leaves123 i
def outputData123 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨9216,9344,17920,18048⟩) (.single ⟨9216,9344,18048,18176⟩)) (.node (.single ⟨9344,9472,17920,18048⟩) (.single ⟨9344,9472,18048,18176⟩))) (.node (.node (.single ⟨14592,14720,23296,23424⟩) (.single ⟨14592,14720,23424,23552⟩)) (.node (.single ⟨14720,14848,23296,23424⟩) (.single ⟨14720,14848,23424,23552⟩)))) (.node (.node (.node (.single ⟨17920,18048,9216,9344⟩) (.single ⟨17920,18048,9344,9472⟩)) (.node (.single ⟨18048,18176,9216,9344⟩) (.single ⟨18048,18176,9344,9472⟩))) (.node (.node (.single ⟨23296,23424,14592,14720⟩) (.single ⟨23296,23424,14720,14848⟩)) (.node (.single ⟨23424,23552,14592,14720⟩) (.single ⟨23424,23552,14720,14848⟩)))))
def output123 : Fin 16 → GridBox := outputData123.get
def coverData123 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData123 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover123 (i : Fin 16) : Fin 16 := ⟨coverData123.get i % 16, Nat.mod_lt _ (by decide)⟩
def source123 (i : Fin 16) : Fin 16 := ⟨sourceData123.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree123 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 (.cutY 18432 (.cutX 9216 .empty (.cutY 17408 .empty (.cutX 9728 (.cutY 17920 .empty (.cutX 9472 (.cutY 18176 (.cutX 9344 (.cutY 18048 .full .full) (.cutY 18048 .full .full)) .empty) .empty)) .empty))) .empty) .empty) .empty) (.cutY 20480 .empty (.cutX 14336 .empty (.cutY 22528 .empty (.cutX 15360 (.cutY 23552 (.cutX 14848 (.cutY 23040 .empty (.cutX 14592 .empty (.cutY 23296 .empty (.cutX 14720 (.cutY 23424 .full .full) (.cutY 23424 .full .full))))) .empty) .empty) .empty))))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 (.cutY 10240 (.cutX 17408 .empty (.cutY 9216 .empty (.cutX 17920 .empty (.cutY 9728 (.cutX 18176 (.cutY 9472 (.cutX 18048 (.cutY 9344 .full .full) (.cutY 9344 .full .full)) .empty) .empty) .empty)))) .empty) .empty) .empty) (.cutY 12288 .empty (.cutX 22528 .empty (.cutY 14336 .empty (.cutX 23552 (.cutY 15360 (.cutX 23040 .empty (.cutY 14848 (.cutX 23296 .empty (.cutY 14592 .empty (.cutX 23424 (.cutY 14720 .full .full) (.cutY 14720 .full .full)))) .empty)) .empty) .empty)))))) .empty) .empty))

theorem metadata123 : 0<167572778 ∧ 36<128 ∧ 70<128 ∧ 0<4 ∧
    3382/4160=0 ∧ 3382%4160=3382 ∧ ∀ i, (leaves123 i).Valid 8 := by
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

noncomputable def phaseMass123 : ℝ := singlePhaseMass (167572778/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw123 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass123_eq : phaseMass123 = (83786389/819200000000 : ℝ) := by
  unfold phaseMass123
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw123 output123 cover123 source123
    (gridTreeUnionCheck_sound 32768 raw123 output123 cover123 source123 tree123 checked123)
    _ (by norm_num) _, areaUnits123]
  norm_num

-- Frozen phase 4020, atom 7594, type 1, source (37,67).
def leavesData124 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves124 : Fin 7 → DyadicLeaf := leavesData124.get
def raw124 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 37 67 leaves124 i
def outputData124 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨9472,9600,17152,17280⟩) (.node (.single ⟨9472,9600,17280,17408⟩) (.single ⟨9600,9664,17152,17216⟩))) (.node (.node (.single ⟨9600,9664,17216,17280⟩) (.single ⟨9664,9728,17152,17216⟩)) (.node (.single ⟨9664,9728,17216,17280⟩) (.single ⟨9600,9728,17280,17408⟩)))) (.node (.node (.single ⟨15360,15488,23040,23168⟩) (.node (.single ⟨15360,15488,23168,23296⟩) (.single ⟨15488,15552,23040,23104⟩))) (.node (.node (.single ⟨15488,15552,23104,23168⟩) (.single ⟨15552,15616,23040,23104⟩)) (.node (.single ⟨15552,15616,23104,23168⟩) (.single ⟨15488,15616,23168,23296⟩))))) (.node (.node (.node (.single ⟨17152,17280,9472,9600⟩) (.node (.single ⟨17152,17216,9600,9664⟩) (.single ⟨17152,17216,9664,9728⟩))) (.node (.node (.single ⟨17216,17280,9600,9664⟩) (.single ⟨17216,17280,9664,9728⟩)) (.node (.single ⟨17280,17408,9472,9600⟩) (.single ⟨17280,17408,9600,9728⟩)))) (.node (.node (.single ⟨23040,23168,15360,15488⟩) (.node (.single ⟨23040,23104,15488,15552⟩) (.single ⟨23040,23104,15552,15616⟩))) (.node (.node (.single ⟨23104,23168,15488,15552⟩) (.single ⟨23104,23168,15552,15616⟩)) (.node (.single ⟨23168,23296,15360,15488⟩) (.single ⟨23168,23296,15488,15616⟩))))))
def output124 : Fin 28 → GridBox := outputData124.get
def coverData124 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData124 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover124 (i : Fin 28) : Fin 28 := ⟨coverData124.get i % 28, Nat.mod_lt _ (by decide)⟩
def source124 (i : Fin 28) : Fin 28 := ⟨sourceData124.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree124 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 (.cutY 18432 (.cutX 9216 .empty (.cutY 17408 (.cutX 9728 (.cutY 16896 .empty (.cutX 9472 .empty (.cutY 17152 .empty (.cutX 9600 (.cutY 17280 .full .full) (.cutY 17280 (.cutX 9664 (.cutY 17216 .full .full) (.cutY 17216 .full .full)) .full))))) .empty) .empty)) .empty) .empty) .empty) (.cutY 20480 .empty (.cutX 14336 .empty (.cutY 22528 .empty (.cutX 15360 .empty (.cutY 23552 (.cutX 15872 (.cutY 23040 .empty (.cutX 15616 (.cutY 23296 (.cutX 15488 (.cutY 23168 .full .full) (.cutY 23168 (.cutX 15552 (.cutY 23104 .full .full) (.cutY 23104 .full .full)) .full)) .empty) .empty)) .empty) .empty)))))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 (.cutY 10240 (.cutX 17408 (.cutY 9216 .empty (.cutX 16896 .empty (.cutY 9728 (.cutX 17152 .empty (.cutY 9472 .empty (.cutX 17280 (.cutY 9600 .full (.cutX 17216 (.cutY 9664 .full .full) (.cutY 9664 .full .full))) (.cutY 9600 .full .full)))) .empty))) .empty) .empty) .empty) .empty) (.cutY 12288 .empty (.cutX 22528 .empty (.cutY 14336 .empty (.cutX 23552 (.cutY 15360 .empty (.cutX 23040 .empty (.cutY 15872 (.cutX 23296 (.cutY 15616 (.cutX 23168 (.cutY 15488 .full (.cutX 23104 (.cutY 15552 .full .full) (.cutY 15552 .full .full))) (.cutY 15488 .full .full)) .empty) .empty) .empty))) .empty)))))) .empty) .empty))

theorem metadata124 : 0<182398684 ∧ 37<128 ∧ 67<128 ∧ 1<4 ∧
    7594/4160=1 ∧ 7594%4160=3434 ∧ ∀ i, (leaves124 i).Valid 8 := by
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

noncomputable def phaseMass124 : ℝ := singlePhaseMass (182398684/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw124 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass124_eq : phaseMass124 = (45599671/409600000000 : ℝ) := by
  unfold phaseMass124
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw124 output124 cover124 source124
    (gridTreeUnionCheck_sound 32768 raw124 output124 cover124 source124 tree124 checked124)
    _ (by norm_num) _, areaUnits124]
  norm_num

-- Frozen phase 4021, atom 6100, type 1, source (17,53).
def leavesData125 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves125 : Fin 7 → DyadicLeaf := leavesData125.get
def raw125 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 17 53 leaves125 i
def outputData125 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨4352,4480,13568,13696⟩) (.node (.single ⟨4352,4480,13696,13824⟩) (.single ⟨4480,4544,13568,13632⟩))) (.node (.node (.single ⟨4480,4544,13632,13696⟩) (.single ⟨4544,4608,13568,13632⟩)) (.node (.single ⟨4544,4608,13632,13696⟩) (.single ⟨4480,4608,13696,13824⟩)))) (.node (.node (.single ⟨13568,13696,4352,4480⟩) (.node (.single ⟨13568,13632,4480,4544⟩) (.single ⟨13568,13632,4544,4608⟩))) (.node (.node (.single ⟨13632,13696,4480,4544⟩) (.single ⟨13632,13696,4544,4608⟩)) (.node (.single ⟨13696,13824,4352,4480⟩) (.single ⟨13696,13824,4480,4608⟩))))) (.node (.node (.node (.single ⟨18944,19072,28160,28288⟩) (.node (.single ⟨18944,19072,28288,28416⟩) (.single ⟨19072,19136,28160,28224⟩))) (.node (.node (.single ⟨19072,19136,28224,28288⟩) (.single ⟨19136,19200,28160,28224⟩)) (.node (.single ⟨19136,19200,28224,28288⟩) (.single ⟨19072,19200,28288,28416⟩)))) (.node (.node (.single ⟨28160,28288,18944,19072⟩) (.node (.single ⟨28160,28224,19072,19136⟩) (.single ⟨28160,28224,19136,19200⟩))) (.node (.node (.single ⟨28224,28288,19072,19136⟩) (.single ⟨28224,28288,19136,19200⟩)) (.node (.single ⟨28288,28416,18944,19072⟩) (.single ⟨28288,28416,19072,19200⟩))))))
def output125 : Fin 28 → GridBox := outputData125.get
def coverData125 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData125 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover125 (i : Fin 28) : Fin 28 := ⟨coverData125.get i % 28, Nat.mod_lt _ (by decide)⟩
def source125 (i : Fin 28) : Fin 28 := ⟨sourceData125.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree125 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 (.cutY 14336 (.cutX 5120 (.cutY 13312 .empty (.cutX 4608 (.cutY 13824 (.cutX 4352 .empty (.cutY 13568 .empty (.cutX 4480 (.cutY 13696 .full .full) (.cutY 13696 (.cutX 4544 (.cutY 13632 .full .full) (.cutY 13632 .full .full)) .full)))) .empty) .empty)) .empty) .empty) .empty)))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 (.cutY 6144 (.cutX 13312 .empty (.cutY 5120 (.cutX 13824 (.cutY 4608 (.cutX 13568 .empty (.cutY 4352 .empty (.cutX 13696 (.cutY 4480 .full (.cutX 13632 (.cutY 4544 .full .full) (.cutY 4544 .full .full))) (.cutY 4480 .full .full)))) .empty) .empty) .empty)) .empty) .empty))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 .empty (.cutY 26624 .empty (.cutX 19456 (.cutY 27648 .empty (.cutX 18944 .empty (.cutY 28160 .empty (.cutX 19200 (.cutY 28416 (.cutX 19072 (.cutY 28288 .full .full) (.cutY 28288 (.cutX 19136 (.cutY 28224 .full .full) (.cutY 28224 .full .full)) .full)) .empty) .empty)))) .empty))) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 .empty (.cutY 18432 .empty (.cutX 27648 .empty (.cutY 19456 (.cutX 28160 .empty (.cutY 18944 .empty (.cutX 28416 (.cutY 19200 (.cutX 28288 (.cutY 19072 .full (.cutX 28224 (.cutY 19136 .full .full) (.cutY 19136 .full .full))) (.cutY 19072 .full .full)) .empty) .empty))) .empty)))) .empty) .empty) .empty))))

theorem metadata125 : 0<199204038 ∧ 17<128 ∧ 53<128 ∧ 1<4 ∧
    6100/4160=1 ∧ 6100%4160=1940 ∧ ∀ i, (leaves125 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData125).mp
    (by decide +kernel)

theorem sourceChecked125_0 : ∀ i : Fin 28,
    (fun i => output125 i = raw125 (source125 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked125 : ∀ i : Fin 28, (fun i => output125 i = raw125 (source125 i)) i :=
  forallFin_of_zero_offset (fun i => output125 i = raw125 (source125 i)) sourceChecked125_0

theorem coverChecked125_0 : ∀ i : Fin 28,
    (fun i => (output125 (cover125 i)).ContainsBox (raw125 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked125 : ∀ i : Fin 28, (fun i => (output125 (cover125 i)).ContainsBox (raw125 i)) i :=
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

noncomputable def phaseMass125 : ℝ := singlePhaseMass (199204038/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw125 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass125_eq : phaseMass125 = (99602019/819200000000 : ℝ) := by
  unfold phaseMass125
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw125 output125 cover125 source125
    (gridTreeUnionCheck_sound 32768 raw125 output125 cover125 source125 tree125 checked125)
    _ (by norm_num) _, areaUnits125]
  norm_num

-- Frozen phase 4022, atom 5497, type 1, source (11,50).
def leavesData126 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves126 : Fin 7 → DyadicLeaf := leavesData126.get
def raw126 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 11 50 leaves126 i
def outputData126 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨2816,2944,12800,12928⟩) (.node (.single ⟨2816,2944,12928,13056⟩) (.single ⟨2944,3008,12800,12864⟩))) (.node (.node (.single ⟨2944,3008,12864,12928⟩) (.single ⟨3008,3072,12800,12864⟩)) (.node (.single ⟨3008,3072,12864,12928⟩) (.single ⟨2944,3072,12928,13056⟩)))) (.node (.node (.single ⟨12800,12928,2816,2944⟩) (.node (.single ⟨12800,12864,2944,3008⟩) (.single ⟨12800,12864,3008,3072⟩))) (.node (.node (.single ⟨12864,12928,2944,3008⟩) (.single ⟨12864,12928,3008,3072⟩)) (.node (.single ⟨12928,13056,2816,2944⟩) (.single ⟨12928,13056,2944,3072⟩))))) (.node (.node (.node (.single ⟨19712,19840,29696,29824⟩) (.node (.single ⟨19712,19840,29824,29952⟩) (.single ⟨19840,19904,29696,29760⟩))) (.node (.node (.single ⟨19840,19904,29760,29824⟩) (.single ⟨19904,19968,29696,29760⟩)) (.node (.single ⟨19904,19968,29760,29824⟩) (.single ⟨19840,19968,29824,29952⟩)))) (.node (.node (.single ⟨29696,29824,19712,19840⟩) (.node (.single ⟨29696,29760,19840,19904⟩) (.single ⟨29696,29760,19904,19968⟩))) (.node (.node (.single ⟨29760,29824,19840,19904⟩) (.single ⟨29760,29824,19904,19968⟩)) (.node (.single ⟨29824,29952,19712,19840⟩) (.single ⟨29824,29952,19840,19968⟩))))))
def output126 : Fin 28 → GridBox := outputData126.get
def coverData126 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData126 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover126 (i : Fin 28) : Fin 28 := ⟨coverData126.get i % 28, Nat.mod_lt _ (by decide)⟩
def source126 (i : Fin 28) : Fin 28 := ⟨sourceData126.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree126 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 (.cutX 3072 (.cutY 13312 (.cutX 2560 .empty (.cutY 12800 .empty (.cutX 2816 .empty (.cutY 13056 (.cutX 2944 (.cutY 12928 .full .full) (.cutY 12928 (.cutX 3008 (.cutY 12864 .full .full) (.cutY 12864 .full .full)) .full)) .empty)))) .empty) .empty) .empty))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 (.cutY 2048 .empty (.cutX 13312 (.cutY 3072 (.cutX 12800 .empty (.cutY 2560 .empty (.cutX 13056 (.cutY 2816 .empty (.cutX 12928 (.cutY 2944 .full (.cutX 12864 (.cutY 3008 .full .full) (.cutY 3008 .full .full))) (.cutY 2944 .full .full))) .empty))) .empty) .empty)) .empty) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 .empty (.cutY 30720 (.cutX 19456 .empty (.cutY 29696 .empty (.cutX 19968 (.cutY 30208 (.cutX 19712 .empty (.cutY 29952 (.cutX 19840 (.cutY 29824 .full .full) (.cutY 29824 (.cutX 19904 (.cutY 29760 .full .full) (.cutY 29760 .full .full)) .full)) .empty)) .empty) .empty))) .empty))) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 .empty (.cutX 29696 .empty (.cutY 19456 .empty (.cutX 30208 (.cutY 19968 (.cutX 29952 (.cutY 19712 .empty (.cutX 29824 (.cutY 19840 .full (.cutX 29760 (.cutY 19904 .full .full) (.cutY 19904 .full .full))) (.cutY 19840 .full .full))) .empty) .empty) .empty)))) .empty) .empty)) .empty))))

theorem metadata126 : 0<144841863 ∧ 11<128 ∧ 50<128 ∧ 1<4 ∧
    5497/4160=1 ∧ 5497%4160=1337 ∧ ∀ i, (leaves126 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData126).mp
    (by decide +kernel)

theorem sourceChecked126_0 : ∀ i : Fin 28,
    (fun i => output126 i = raw126 (source126 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked126 : ∀ i : Fin 28, (fun i => output126 i = raw126 (source126 i)) i :=
  forallFin_of_zero_offset (fun i => output126 i = raw126 (source126 i)) sourceChecked126_0

theorem coverChecked126_0 : ∀ i : Fin 28,
    (fun i => (output126 (cover126 i)).ContainsBox (raw126 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked126 : ∀ i : Fin 28, (fun i => (output126 (cover126 i)).ContainsBox (raw126 i)) i :=
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

noncomputable def phaseMass126 : ℝ := singlePhaseMass (144841863/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw126 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass126_eq : phaseMass126 = (144841863/1638400000000 : ℝ) := by
  unfold phaseMass126
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw126 output126 cover126 source126
    (gridTreeUnionCheck_sound 32768 raw126 output126 cover126 source126 tree126 checked126)
    _ (by norm_num) _, areaUnits126]
  norm_num

-- Frozen phase 4023, atom 4460, type 1, source (2,48).
def leavesData127 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves127 : Fin 7 → DyadicLeaf := leavesData127.get
def raw127 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 2 48 leaves127 i
def outputData127 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨512,640,12288,12416⟩) (.node (.single ⟨512,640,12416,12544⟩) (.single ⟨640,704,12288,12352⟩))) (.node (.node (.single ⟨640,704,12352,12416⟩) (.single ⟨704,768,12288,12352⟩)) (.node (.single ⟨704,768,12352,12416⟩) (.single ⟨640,768,12416,12544⟩)))) (.node (.node (.single ⟨12288,12416,512,640⟩) (.node (.single ⟨12288,12352,640,704⟩) (.single ⟨12288,12352,704,768⟩))) (.node (.node (.single ⟨12352,12416,640,704⟩) (.single ⟨12352,12416,704,768⟩)) (.node (.single ⟨12416,12544,512,640⟩) (.single ⟨12416,12544,640,768⟩))))) (.node (.node (.node (.single ⟨20224,20352,32000,32128⟩) (.node (.single ⟨20224,20352,32128,32256⟩) (.single ⟨20352,20416,32000,32064⟩))) (.node (.node (.single ⟨20352,20416,32064,32128⟩) (.single ⟨20416,20480,32000,32064⟩)) (.node (.single ⟨20416,20480,32064,32128⟩) (.single ⟨20352,20480,32128,32256⟩)))) (.node (.node (.single ⟨32000,32128,20224,20352⟩) (.node (.single ⟨32000,32064,20352,20416⟩) (.single ⟨32000,32064,20416,20480⟩))) (.node (.node (.single ⟨32064,32128,20352,20416⟩) (.single ⟨32064,32128,20416,20480⟩)) (.node (.single ⟨32128,32256,20224,20352⟩) (.single ⟨32128,32256,20352,20480⟩))))))
def output127 : Fin 28 → GridBox := outputData127.get
def coverData127 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData127 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover127 (i : Fin 28) : Fin 28 := ⟨coverData127.get i % 28, Nat.mod_lt _ (by decide)⟩
def source127 (i : Fin 28) : Fin 28 := ⟨sourceData127.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree127 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 (.cutX 1024 (.cutY 13312 (.cutX 512 .empty (.cutY 12800 (.cutX 768 (.cutY 12544 (.cutX 640 (.cutY 12416 .full .full) (.cutY 12416 (.cutX 704 (.cutY 12352 .full .full) (.cutY 12352 .full .full)) .full)) .empty) .empty) .empty)) .empty) .empty) .empty) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 (.cutY 2048 (.cutX 13312 (.cutY 1024 (.cutX 12800 (.cutY 512 .empty (.cutX 12544 (.cutY 768 (.cutX 12416 (.cutY 640 .full (.cutX 12352 (.cutY 704 .full .full) (.cutY 704 .full .full))) (.cutY 640 .full .full)) .empty) .empty)) .empty) .empty) .empty) .empty) .empty) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 .empty (.cutY 30720 .empty (.cutX 19456 .empty (.cutY 31744 .empty (.cutX 19968 .empty (.cutY 32256 (.cutX 20224 .empty (.cutY 32000 .empty (.cutX 20352 (.cutY 32128 .full .full) (.cutY 32128 (.cutX 20416 (.cutY 32064 .full .full) (.cutY 32064 .full .full)) .full)))) .empty))))))) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 .empty (.cutX 31744 .empty (.cutY 19456 .empty (.cutX 32256 (.cutY 19968 .empty (.cutX 32000 .empty (.cutY 20224 .empty (.cutX 32128 (.cutY 20352 .full (.cutX 32064 (.cutY 20416 .full .full) (.cutY 20416 .full .full))) (.cutY 20352 .full .full))))) .empty))))) .empty)) .empty))))

theorem metadata127 : 0<234882010 ∧ 2<128 ∧ 48<128 ∧ 1<4 ∧
    4460/4160=1 ∧ 4460%4160=300 ∧ ∀ i, (leaves127 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData127).mp
    (by decide +kernel)

theorem sourceChecked127_0 : ∀ i : Fin 28,
    (fun i => output127 i = raw127 (source127 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked127 : ∀ i : Fin 28, (fun i => output127 i = raw127 (source127 i)) i :=
  forallFin_of_zero_offset (fun i => output127 i = raw127 (source127 i)) sourceChecked127_0

theorem coverChecked127_0 : ∀ i : Fin 28,
    (fun i => (output127 (cover127 i)).ContainsBox (raw127 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked127 : ∀ i : Fin 28, (fun i => (output127 (cover127 i)).ContainsBox (raw127 i)) i :=
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

noncomputable def phaseMass127 : ℝ := singlePhaseMass (234882010/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw127 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass127_eq : phaseMass127 = (23488201/163840000000 : ℝ) := by
  unfold phaseMass127
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw127 output127 cover127 source127
    (gridTreeUnionCheck_sound 32768 raw127 output127 cover127 source127 tree127 checked127)
    _ (by norm_num) _, areaUnits127]
  norm_num

noncomputable def batchActualMass : ℝ := [phaseMass0,phaseMass1,phaseMass2,phaseMass3,phaseMass4,phaseMass5,phaseMass6,phaseMass7,phaseMass8,phaseMass9,phaseMass10,phaseMass11,phaseMass12,phaseMass13,phaseMass14,phaseMass15,phaseMass16,phaseMass17,phaseMass18,phaseMass19,phaseMass20,phaseMass21,phaseMass22,phaseMass23,phaseMass24,phaseMass25,phaseMass26,phaseMass27,phaseMass28,phaseMass29,phaseMass30,phaseMass31,phaseMass32,phaseMass33,phaseMass34,phaseMass35,phaseMass36,phaseMass37,phaseMass38,phaseMass39,phaseMass40,phaseMass41,phaseMass42,phaseMass43,phaseMass44,phaseMass45,phaseMass46,phaseMass47,phaseMass48,phaseMass49,phaseMass50,phaseMass51,phaseMass52,phaseMass53,phaseMass54,phaseMass55,phaseMass56,phaseMass57,phaseMass58,phaseMass59,phaseMass60,phaseMass61,phaseMass62,phaseMass63,phaseMass64,phaseMass65,phaseMass66,phaseMass67,phaseMass68,phaseMass69,phaseMass70,phaseMass71,phaseMass72,phaseMass73,phaseMass74,phaseMass75,phaseMass76,phaseMass77,phaseMass78,phaseMass79,phaseMass80,phaseMass81,phaseMass82,phaseMass83,phaseMass84,phaseMass85,phaseMass86,phaseMass87,phaseMass88,phaseMass89,phaseMass90,phaseMass91,phaseMass92,phaseMass93,phaseMass94,phaseMass95,phaseMass96,phaseMass97,phaseMass98,phaseMass99,phaseMass100,phaseMass101,phaseMass102,phaseMass103,phaseMass104,phaseMass105,phaseMass106,phaseMass107,phaseMass108,phaseMass109,phaseMass110,phaseMass111,phaseMass112,phaseMass113,phaseMass114,phaseMass115,phaseMass116,phaseMass117,phaseMass118,phaseMass119,phaseMass120,phaseMass121,phaseMass122,phaseMass123,phaseMass124,phaseMass125,phaseMass126,phaseMass127].sum

theorem actual_batch_mass : batchActualMass = (2602184463/204800000000 : ℝ) := by
  unfold batchActualMass
  rw [phaseMass0_eq,phaseMass1_eq,phaseMass2_eq,phaseMass3_eq,phaseMass4_eq,phaseMass5_eq,phaseMass6_eq,phaseMass7_eq,phaseMass8_eq,phaseMass9_eq,phaseMass10_eq,phaseMass11_eq,phaseMass12_eq,phaseMass13_eq,phaseMass14_eq,phaseMass15_eq,phaseMass16_eq,phaseMass17_eq,phaseMass18_eq,phaseMass19_eq,phaseMass20_eq,phaseMass21_eq,phaseMass22_eq,phaseMass23_eq,phaseMass24_eq,phaseMass25_eq,phaseMass26_eq,phaseMass27_eq,phaseMass28_eq,phaseMass29_eq,phaseMass30_eq,phaseMass31_eq,phaseMass32_eq,phaseMass33_eq,phaseMass34_eq,phaseMass35_eq,phaseMass36_eq,phaseMass37_eq,phaseMass38_eq,phaseMass39_eq,phaseMass40_eq,phaseMass41_eq,phaseMass42_eq,phaseMass43_eq,phaseMass44_eq,phaseMass45_eq,phaseMass46_eq,phaseMass47_eq,phaseMass48_eq,phaseMass49_eq,phaseMass50_eq,phaseMass51_eq,phaseMass52_eq,phaseMass53_eq,phaseMass54_eq,phaseMass55_eq,phaseMass56_eq,phaseMass57_eq,phaseMass58_eq,phaseMass59_eq,phaseMass60_eq,phaseMass61_eq,phaseMass62_eq,phaseMass63_eq,phaseMass64_eq,phaseMass65_eq,phaseMass66_eq,phaseMass67_eq,phaseMass68_eq,phaseMass69_eq,phaseMass70_eq,phaseMass71_eq,phaseMass72_eq,phaseMass73_eq,phaseMass74_eq,phaseMass75_eq,phaseMass76_eq,phaseMass77_eq,phaseMass78_eq,phaseMass79_eq,phaseMass80_eq,phaseMass81_eq,phaseMass82_eq,phaseMass83_eq,phaseMass84_eq,phaseMass85_eq,phaseMass86_eq,phaseMass87_eq,phaseMass88_eq,phaseMass89_eq,phaseMass90_eq,phaseMass91_eq,phaseMass92_eq,phaseMass93_eq,phaseMass94_eq,phaseMass95_eq,phaseMass96_eq,phaseMass97_eq,phaseMass98_eq,phaseMass99_eq,phaseMass100_eq,phaseMass101_eq,phaseMass102_eq,phaseMass103_eq,phaseMass104_eq,phaseMass105_eq,phaseMass106_eq,phaseMass107_eq,phaseMass108_eq,phaseMass109_eq,phaseMass110_eq,phaseMass111_eq,phaseMass112_eq,phaseMass113_eq,phaseMass114_eq,phaseMass115_eq,phaseMass116_eq,phaseMass117_eq,phaseMass118_eq,phaseMass119_eq,phaseMass120_eq,phaseMass121_eq,phaseMass122_eq,phaseMass123_eq,phaseMass124_eq,phaseMass125_eq,phaseMass126_eq,phaseMass127_eq]
  norm_num

end NoThreeLine.ScheduleUnionBatch03896
#print axioms NoThreeLine.ScheduleUnionBatch03896.actual_batch_mass
