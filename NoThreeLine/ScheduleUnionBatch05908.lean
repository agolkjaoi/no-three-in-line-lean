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
namespace NoThreeLine.ScheduleUnionBatch05908

-- Frozen phase 5908, atom 5189, type 1, source (8,69).
def leavesData0 : FiniteInputTree DyadicLeaf 19 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩))) (.node (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩))))) (.node (.node (.node (.single ⟨3,6,1⟩) (.single ⟨3,7,1⟩)) (.node (.single ⟨3,4,0⟩) (.node (.single ⟨3,4,1⟩) (.single ⟨3,5,0⟩)))) (.node (.node (.single ⟨3,5,1⟩) (.single ⟨4,14,0⟩)) (.node (.single ⟨4,14,1⟩) (.node (.single ⟨4,15,0⟩) (.single ⟨4,15,1⟩))))))
def leaves0 : Fin 19 → DyadicLeaf := leavesData0.get
def raw0 (i : Fin 76) : GridBox := phaseImageBoxes 32768 8 8 69 leaves0 i
def outputData0 : FiniteInputTree GridBox 76 := (.node (.node (.node (.node (.node (.node (.single ⟨2048,2112,17664,17728⟩) (.single ⟨2048,2112,17728,17792⟩)) (.node (.single ⟨2112,2176,17664,17728⟩) (.single ⟨2112,2176,17728,17792⟩))) (.node (.node (.single ⟨2048,2176,17792,17920⟩) (.single ⟨2176,2208,17664,17696⟩)) (.node (.single ⟨2176,2208,17696,17728⟩) (.node (.single ⟨2208,2240,17664,17696⟩) (.single ⟨2208,2240,17696,17728⟩))))) (.node (.node (.node (.single ⟨2176,2240,17728,17792⟩) (.single ⟨2240,2272,17664,17696⟩)) (.node (.single ⟨2240,2272,17696,17728⟩) (.node (.single ⟨2272,2288,17664,17680⟩) (.single ⟨2272,2288,17680,17696⟩)))) (.node (.node (.single ⟨2288,2304,17664,17680⟩) (.single ⟨2288,2304,17680,17696⟩)) (.node (.single ⟨2272,2304,17696,17728⟩) (.node (.single ⟨2240,2304,17728,17792⟩) (.single ⟨2176,2304,17792,17920⟩)))))) (.node (.node (.node (.node (.single ⟨14848,14976,30464,30592⟩) (.single ⟨14848,14976,30592,30720⟩)) (.node (.single ⟨14976,15040,30464,30528⟩) (.single ⟨14976,15040,30528,30592⟩))) (.node (.node (.single ⟨15040,15072,30464,30496⟩) (.single ⟨15040,15072,30496,30528⟩)) (.node (.single ⟨15072,15088,30464,30480⟩) (.node (.single ⟨15072,15088,30480,30496⟩) (.single ⟨15088,15104,30464,30480⟩))))) (.node (.node (.node (.single ⟨15088,15104,30480,30496⟩) (.single ⟨15072,15104,30496,30528⟩)) (.node (.single ⟨15040,15072,30528,30560⟩) (.node (.single ⟨15040,15072,30560,30592⟩) (.single ⟨15072,15104,30528,30560⟩)))) (.node (.node (.single ⟨15072,15104,30560,30592⟩) (.single ⟨14976,15040,30592,30656⟩)) (.node (.single ⟨14976,15040,30656,30720⟩) (.node (.single ⟨15040,15104,30592,30656⟩) (.single ⟨15040,15104,30656,30720⟩))))))) (.node (.node (.node (.node (.node (.single ⟨17664,17728,2048,2112⟩) (.single ⟨17664,17728,2112,2176⟩)) (.node (.single ⟨17728,17792,2048,2112⟩) (.single ⟨17728,17792,2112,2176⟩))) (.node (.node (.single ⟨17664,17696,2176,2208⟩) (.single ⟨17664,17696,2208,2240⟩)) (.node (.single ⟨17696,17728,2176,2208⟩) (.node (.single ⟨17696,17728,2208,2240⟩) (.single ⟨17664,17696,2240,2272⟩))))) (.node (.node (.node (.single ⟨17664,17680,2272,2288⟩) (.single ⟨17664,17680,2288,2304⟩)) (.node (.single ⟨17680,17696,2272,2288⟩) (.node (.single ⟨17680,17696,2288,2304⟩) (.single ⟨17696,17728,2240,2272⟩)))) (.node (.node (.single ⟨17696,17728,2272,2304⟩) (.single ⟨17728,17792,2176,2240⟩)) (.node (.single ⟨17728,17792,2240,2304⟩) (.node (.single ⟨17792,17920,2048,2176⟩) (.single ⟨17792,17920,2176,2304⟩)))))) (.node (.node (.node (.node (.single ⟨30464,30592,14848,14976⟩) (.single ⟨30464,30528,14976,15040⟩)) (.node (.single ⟨30464,30496,15040,15072⟩) (.single ⟨30464,30480,15072,15088⟩))) (.node (.node (.single ⟨30464,30480,15088,15104⟩) (.single ⟨30480,30496,15072,15088⟩)) (.node (.single ⟨30480,30496,15088,15104⟩) (.node (.single ⟨30496,30528,15040,15072⟩) (.single ⟨30496,30528,15072,15104⟩))))) (.node (.node (.node (.single ⟨30528,30592,14976,15040⟩) (.single ⟨30528,30560,15040,15072⟩)) (.node (.single ⟨30528,30560,15072,15104⟩) (.node (.single ⟨30560,30592,15040,15072⟩) (.single ⟨30560,30592,15072,15104⟩)))) (.node (.node (.single ⟨30592,30720,14848,14976⟩) (.single ⟨30592,30656,14976,15040⟩)) (.node (.single ⟨30592,30656,15040,15104⟩) (.node (.single ⟨30656,30720,14976,15040⟩) (.single ⟨30656,30720,15040,15104⟩))))))))
def output0 : Fin 76 → GridBox := outputData0.get
def coverData0 : FiniteInputTree ℕ 76 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 55)) (.node (.single 71) (.single 20))) (.node (.node (.single 18) (.single 56)) (.node (.single 57) (.node (.single 19) (.single 0))))) (.node (.node (.node (.single 38) (.single 75)) (.node (.single 37) (.node (.single 1) (.single 40)))) (.node (.node (.single 74) (.single 35)) (.node (.single 2) (.node (.single 39) (.single 73)))))) (.node (.node (.node (.node (.single 36) (.single 3)) (.node (.single 41) (.single 72))) (.node (.node (.single 34) (.single 9)) (.node (.single 53) (.node (.single 66) (.single 22))))) (.node (.node (.node (.single 17) (.single 54)) (.node (.single 58) (.node (.single 21) (.single 10)))) (.node (.node (.single 46) (.single 65)) (.node (.single 29) (.node (.single 11) (.single 51))))))) (.node (.node (.node (.node (.node (.single 64) (.single 24)) (.node (.single 16) (.single 52))) (.node (.node (.single 59) (.single 23)) (.node (.single 5) (.node (.single 42) (.single 70))))) (.node (.node (.node (.single 33) (.single 6)) (.node (.single 44) (.node (.single 69) (.single 31)))) (.node (.node (.single 7) (.single 43)) (.node (.single 68) (.node (.single 32) (.single 8)))))) (.node (.node (.node (.node (.single 45) (.single 67)) (.node (.single 30) (.single 12))) (.node (.node (.single 47) (.single 63)) (.node (.single 28) (.node (.single 13) (.single 49))))) (.node (.node (.node (.single 62) (.single 26)) (.node (.single 14) (.node (.single 48) (.single 61)))) (.node (.node (.single 27) (.single 15)) (.node (.single 50) (.node (.single 60) (.single 25))))))))
def sourceData0 : FiniteInputTree ℕ 76 := (.node (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.single 20))) (.node (.node (.single 0) (.single 44)) (.node (.single 48) (.node (.single 52) (.single 56))))) (.node (.node (.node (.single 24) (.single 32)) (.node (.single 36) (.node (.single 60) (.single 64)))) (.node (.node (.single 68) (.single 72)) (.node (.single 40) (.node (.single 28) (.single 4)))))) (.node (.node (.node (.node (.single 7) (.single 3)) (.node (.single 31) (.single 27))) (.node (.node (.single 43) (.single 39)) (.node (.single 75) (.node (.single 67) (.single 71))))) (.node (.node (.node (.single 63) (.single 35)) (.node (.single 59) (.node (.single 51) (.single 55)))) (.node (.node (.single 47) (.single 23)) (.node (.single 15) (.node (.single 19) (.single 11))))))) (.node (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.single 21))) (.node (.node (.single 45) (.single 53)) (.node (.single 49) (.node (.single 57) (.single 33))))) (.node (.node (.node (.single 61) (.single 69)) (.node (.single 65) (.node (.single 73) (.single 37)))) (.node (.node (.single 41) (.single 25)) (.node (.single 29) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.single 6) (.single 30)) (.node (.single 42) (.single 74))) (.node (.node (.single 70) (.single 66)) (.node (.single 62) (.node (.single 38) (.single 34))))) (.node (.node (.node (.single 26) (.single 58)) (.node (.single 54) (.node (.single 50) (.single 46)))) (.node (.node (.single 2) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10))))))))
def cover0 (i : Fin 76) : Fin 76 := ⟨coverData0.get i % 76, Nat.mod_lt _ (by decide)⟩
def source0 (i : Fin 76) : Fin 76 := ⟨sourceData0.get i % 76, Nat.mod_lt _ (by decide)⟩
def tree0 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 (.cutX 3072 (.cutY 17408 .empty (.cutX 2560 (.cutY 17920 (.cutX 2304 (.cutY 17664 .empty (.cutX 2176 (.cutY 17792 (.cutX 2112 (.cutY 17728 .full .full) (.cutY 17728 .full .full)) .full) (.cutY 17792 (.cutX 2240 (.cutY 17728 (.cutX 2208 (.cutY 17696 .full .full) (.cutY 17696 .full .full)) .full) (.cutY 17728 (.cutX 2272 (.cutY 17696 .full .full) (.cutY 17696 (.cutX 2288 (.cutY 17680 .full .full) (.cutY 17680 .full .full)) .full)) .full)) .full))) .empty) .empty) .empty)) .empty) .empty)) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 (.cutX 15360 (.cutY 29696 .empty (.cutX 14848 .empty (.cutY 30208 .empty (.cutX 15104 (.cutY 30464 .empty (.cutX 14976 (.cutY 30592 .full .full) (.cutY 30592 (.cutX 15040 (.cutY 30528 .full .full) (.cutY 30528 (.cutX 15072 (.cutY 30496 .full .full) (.cutY 30496 (.cutX 15088 (.cutY 30480 .full .full) (.cutY 30480 .full .full)) .full)) (.cutX 15072 (.cutY 30560 .full .full) (.cutY 30560 .full .full)))) (.cutX 15040 (.cutY 30656 .full .full) (.cutY 30656 .full .full))))) .empty)))) .empty) .empty))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 .empty (.cutX 17408 .empty (.cutY 3072 (.cutX 17920 (.cutY 2560 (.cutX 17664 .empty (.cutY 2304 (.cutX 17792 (.cutY 2176 (.cutX 17728 (.cutY 2112 .full .full) (.cutY 2112 .full .full)) (.cutX 17728 (.cutY 2240 (.cutX 17696 (.cutY 2208 .full .full) (.cutY 2208 .full .full)) (.cutX 17696 (.cutY 2272 .full (.cutX 17680 (.cutY 2288 .full .full) (.cutY 2288 .full .full))) (.cutY 2272 .full .full))) (.cutY 2240 .full .full))) (.cutY 2176 .full .full)) .empty)) .empty) .empty) .empty))) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 .empty (.cutX 29696 .empty (.cutY 15360 (.cutX 30208 .empty (.cutY 14848 .empty (.cutX 30464 .empty (.cutY 15104 (.cutX 30592 (.cutY 14976 .full (.cutX 30528 (.cutY 15040 .full (.cutX 30496 (.cutY 15072 .full (.cutX 30480 (.cutY 15088 .full .full) (.cutY 15088 .full .full))) (.cutY 15072 .full .full))) (.cutY 15040 .full (.cutX 30560 (.cutY 15072 .full .full) (.cutY 15072 .full .full))))) (.cutY 14976 .full (.cutX 30656 (.cutY 15040 .full .full) (.cutY 15040 .full .full)))) .empty)))) .empty))) .empty))))) .empty))

theorem metadata0 : 0<135229957 ∧ 8<128 ∧ 69<128 ∧ 1<4 ∧
    5189/4160=1 ∧ 5189%4160=1029 ∧ ∀ i, (leaves0 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData0).mp
    (by decide +kernel)

theorem sourceChecked0_0 : ∀ i : Fin 64,
    (fun i => output0 i = raw0 (source0 i)) (finOffset 76 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked0_64 : ∀ i : Fin 12,
    (fun i => output0 i = raw0 (source0 i)) (finOffset 76 64 12 (by decide) i) := by decide +kernel

theorem sourceChecked0 : ∀ i : Fin 76, (fun i => output0 i = raw0 (source0 i)) i :=
  forallFin_of_zero_offset (fun i => output0 i = raw0 (source0 i)) (forallFinOffset_add (fun i => output0 i = raw0 (source0 i)) 0 64 12 (by decide) sourceChecked0_0
    sourceChecked0_64)

theorem coverChecked0_0 : ∀ i : Fin 64,
    (fun i => (output0 (cover0 i)).ContainsBox (raw0 i)) (finOffset 76 0 64 (by decide) i) := by decide +kernel

theorem coverChecked0_64 : ∀ i : Fin 12,
    (fun i => (output0 (cover0 i)).ContainsBox (raw0 i)) (finOffset 76 64 12 (by decide) i) := by decide +kernel

theorem coverChecked0 : ∀ i : Fin 76, (fun i => (output0 (cover0 i)).ContainsBox (raw0 i)) i :=
  forallFin_of_zero_offset (fun i => (output0 (cover0 i)).ContainsBox (raw0 i)) (forallFinOffset_add (fun i => (output0 (cover0 i)).ContainsBox (raw0 i)) 0 64 12 (by decide) coverChecked0_0
    coverChecked0_64)

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

noncomputable def phaseMass0 : ℝ := singlePhaseMass (135229957/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw0 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass0_eq : phaseMass0 = (135229957/1638400000000 : ℝ) := by
  unfold phaseMass0
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw0 output0 cover0 source0
    (gridTreeUnionCheck_sound 32768 raw0 output0 cover0 source0 tree0 checked0)
    _ (by norm_num) _, areaUnits0]
  norm_num

-- Frozen phase 5909, atom 3347, type 0, source (35,92).
def leavesData1 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves1 : Fin 10 → DyadicLeaf := leavesData1.get
def raw1 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 35 92 leaves1 i
def outputData1 : FiniteInputTree GridBox 20 := (.node (.node (.node (.node (.single ⟨8960,9088,23552,23680⟩) (.single ⟨8960,9088,23680,23808⟩)) (.node (.single ⟨9088,9152,23552,23616⟩) (.node (.single ⟨9088,9152,23616,23680⟩) (.single ⟨9152,9184,23552,23584⟩)))) (.node (.node (.single ⟨9152,9184,23584,23616⟩) (.single ⟨9184,9216,23552,23584⟩)) (.node (.single ⟨9184,9216,23584,23616⟩) (.node (.single ⟨9152,9216,23616,23680⟩) (.single ⟨9088,9216,23680,23808⟩))))) (.node (.node (.node (.single ⟨23552,23680,8960,9088⟩) (.single ⟨23552,23616,9088,9152⟩)) (.node (.single ⟨23552,23584,9152,9184⟩) (.node (.single ⟨23552,23584,9184,9216⟩) (.single ⟨23584,23616,9152,9184⟩)))) (.node (.node (.single ⟨23584,23616,9184,9216⟩) (.single ⟨23616,23680,9088,9152⟩)) (.node (.single ⟨23616,23680,9152,9216⟩) (.node (.single ⟨23680,23808,8960,9088⟩) (.single ⟨23680,23808,9088,9216⟩))))))
def output1 : Fin 20 → GridBox := outputData1.get
def coverData1 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 10)) (.node (.single 19) (.node (.single 9) (.single 1)))) (.node (.node (.single 18) (.single 18)) (.node (.single 1) (.node (.single 9) (.single 19))))) (.node (.node (.node (.single 10) (.single 0)) (.node (.single 2) (.node (.single 11) (.single 17)))) (.node (.node (.single 8) (.single 3)) (.node (.single 16) (.node (.single 16) (.single 3)))))) (.node (.node (.node (.node (.single 8) (.single 17)) (.node (.single 11) (.node (.single 2) (.single 4)))) (.node (.node (.single 12) (.single 15)) (.node (.single 7) (.node (.single 5) (.single 14))))) (.node (.node (.node (.single 14) (.single 5)) (.node (.single 6) (.node (.single 13) (.single 13)))) (.node (.node (.single 6) (.single 7)) (.node (.single 15) (.node (.single 12) (.single 4)))))))
def sourceData1 : FiniteInputTree ℕ 20 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 27) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 26) (.single 17)) (.node (.single 14) (.node (.single 5) (.single 2))))))
def cover1 (i : Fin 40) : Fin 20 := ⟨coverData1.get i % 20, Nat.mod_lt _ (by decide)⟩
def source1 (i : Fin 20) : Fin 40 := ⟨sourceData1.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree1 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 .empty (.cutX 9216 (.cutY 23552 .empty (.cutX 8704 .empty (.cutY 24064 (.cutX 8960 .empty (.cutY 23808 (.cutX 9088 (.cutY 23680 .full .full) (.cutY 23680 (.cutX 9152 (.cutY 23616 .full .full) (.cutY 23616 (.cutX 9184 (.cutY 23584 .full .full) (.cutY 23584 .full .full)) .full)) .full)) .empty)) .empty))) .empty)) .empty)) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 .empty (.cutY 10240 (.cutX 23552 .empty (.cutY 9216 (.cutX 24064 (.cutY 8704 .empty (.cutX 23808 (.cutY 8960 .empty (.cutX 23680 (.cutY 9088 .full (.cutX 23616 (.cutY 9152 .full (.cutX 23584 (.cutY 9184 .full .full) (.cutY 9184 .full .full))) (.cutY 9152 .full .full))) (.cutY 9088 .full .full))) .empty)) .empty) .empty)) .empty)) .empty))) .empty) .empty))

theorem metadata1 : 0<75538780 ∧ 35<128 ∧ 92<128 ∧ 0<4 ∧
    3347/4160=0 ∧ 3347%4160=3347 ∧ ∀ i, (leaves1 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData1).mp
    (by decide +kernel)

theorem sourceChecked1_0 : ∀ i : Fin 20,
    (fun i => output1 i = raw1 (source1 i)) (finOffset 20 0 20 (by decide) i) := by decide +kernel

theorem sourceChecked1 : ∀ i : Fin 20, (fun i => output1 i = raw1 (source1 i)) i :=
  forallFin_of_zero_offset (fun i => output1 i = raw1 (source1 i)) sourceChecked1_0

theorem coverChecked1_0 : ∀ i : Fin 40,
    (fun i => (output1 (cover1 i)).ContainsBox (raw1 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked1 : ∀ i : Fin 40, (fun i => (output1 (cover1 i)).ContainsBox (raw1 i)) i :=
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

noncomputable def phaseMass1 : ℝ := singlePhaseMass (75538780/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw1 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass1_eq : phaseMass1 = (3776939/163840000000 : ℝ) := by
  unfold phaseMass1
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw1 output1 cover1 source1
    (gridTreeUnionCheck_sound 32768 raw1 output1 cover1 source1 tree1 checked1)
    _ (by norm_num) _, areaUnits1]
  norm_num

-- Frozen phase 5910, atom 1031, type 0, source (8,71).
def leavesData2 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,0⟩))) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves2 : Fin 13 → DyadicLeaf := leavesData2.get
def raw2 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 8 71 leaves2 i
def outputData2 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨2048,2112,18176,18240⟩) (.node (.single ⟨2048,2112,18240,18304⟩) (.single ⟨2112,2176,18176,18240⟩))) (.node (.single ⟨2112,2176,18240,18304⟩) (.node (.single ⟨2048,2176,18304,18432⟩) (.single ⟨2176,2240,18176,18240⟩)))) (.node (.node (.single ⟨2176,2240,18240,18304⟩) (.node (.single ⟨2240,2272,18176,18208⟩) (.single ⟨2240,2272,18208,18240⟩))) (.node (.node (.single ⟨2272,2304,18176,18208⟩) (.single ⟨2272,2304,18208,18240⟩)) (.node (.single ⟨2240,2304,18240,18304⟩) (.single ⟨2176,2304,18304,18432⟩))))) (.node (.node (.node (.single ⟨14336,14464,30464,30592⟩) (.node (.single ⟨14336,14464,30592,30720⟩) (.single ⟨14464,14528,30464,30528⟩))) (.node (.single ⟨14464,14528,30528,30592⟩) (.node (.single ⟨14528,14560,30464,30496⟩) (.single ⟨14528,14560,30496,30528⟩)))) (.node (.node (.single ⟨14560,14592,30464,30496⟩) (.node (.single ⟨14560,14592,30496,30528⟩) (.single ⟨14528,14592,30528,30592⟩))) (.node (.node (.single ⟨14464,14528,30592,30656⟩) (.single ⟨14464,14528,30656,30720⟩)) (.node (.single ⟨14528,14592,30592,30656⟩) (.single ⟨14528,14592,30656,30720⟩)))))) (.node (.node (.node (.node (.single ⟨18176,18240,2048,2112⟩) (.node (.single ⟨18176,18240,2112,2176⟩) (.single ⟨18240,18304,2048,2112⟩))) (.node (.single ⟨18240,18304,2112,2176⟩) (.node (.single ⟨18176,18240,2176,2240⟩) (.single ⟨18176,18208,2240,2272⟩)))) (.node (.node (.single ⟨18176,18208,2272,2304⟩) (.node (.single ⟨18208,18240,2240,2272⟩) (.single ⟨18208,18240,2272,2304⟩))) (.node (.node (.single ⟨18240,18304,2176,2240⟩) (.single ⟨18240,18304,2240,2304⟩)) (.node (.single ⟨18304,18432,2048,2176⟩) (.single ⟨18304,18432,2176,2304⟩))))) (.node (.node (.node (.single ⟨30464,30592,14336,14464⟩) (.node (.single ⟨30464,30528,14464,14528⟩) (.single ⟨30464,30496,14528,14560⟩))) (.node (.single ⟨30464,30496,14560,14592⟩) (.node (.single ⟨30496,30528,14528,14560⟩) (.single ⟨30496,30528,14560,14592⟩)))) (.node (.node (.single ⟨30528,30592,14464,14528⟩) (.node (.single ⟨30528,30592,14528,14592⟩) (.single ⟨30592,30720,14336,14464⟩))) (.node (.node (.single ⟨30592,30656,14464,14528⟩) (.single ⟨30592,30656,14528,14592⟩)) (.node (.single ⟨30656,30720,14464,14528⟩) (.single ⟨30656,30720,14528,14592⟩)))))))
def output2 : Fin 52 → GridBox := outputData2.get
def coverData2 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 0))) (.node (.node (.single 26) (.single 51)) (.node (.single 25) (.single 1))))) (.node (.node (.node (.single 28) (.node (.single 50) (.single 23))) (.node (.single 2) (.node (.single 27) (.single 49)))) (.node (.node (.single 24) (.node (.single 3) (.single 29))) (.node (.node (.single 48) (.single 22)) (.node (.single 5) (.single 30)))))) (.node (.node (.node (.node (.single 46) (.node (.single 21) (.single 6))) (.node (.single 35) (.node (.single 45) (.single 16)))) (.node (.node (.single 11) (.node (.single 36) (.single 40))) (.node (.node (.single 15) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData2 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.single 20) (.node (.single 0) (.single 24)))) (.node (.node (.single 28) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 35))) (.node (.single 31) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.node (.single 17) (.single 13))) (.node (.single 21) (.node (.single 25) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 34) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 30) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover2 (i : Fin 52) : Fin 52 := ⟨coverData2.get i % 52, Nat.mod_lt _ (by decide)⟩
def source2 (i : Fin 52) : Fin 52 := ⟨sourceData2.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree2 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 (.cutX 3072 (.cutY 17408 .empty (.cutX 2560 (.cutY 17920 .empty (.cutX 2304 (.cutY 18176 .empty (.cutX 2176 (.cutY 18304 (.cutX 2112 (.cutY 18240 .full .full) (.cutY 18240 .full .full)) .full) (.cutY 18304 (.cutX 2240 (.cutY 18240 .full .full) (.cutY 18240 (.cutX 2272 (.cutY 18208 .full .full) (.cutY 18208 .full .full)) .full)) .full))) .empty)) .empty)) .empty) .empty)) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 (.cutX 15360 (.cutY 29696 .empty (.cutX 14848 (.cutY 30208 .empty (.cutX 14592 (.cutY 30464 .empty (.cutX 14464 (.cutY 30592 .full .full) (.cutY 30592 (.cutX 14528 (.cutY 30528 .full .full) (.cutY 30528 (.cutX 14560 (.cutY 30496 .full .full) (.cutY 30496 .full .full)) .full)) (.cutX 14528 (.cutY 30656 .full .full) (.cutY 30656 .full .full))))) .empty)) .empty)) .empty) .empty))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 .empty (.cutX 17408 .empty (.cutY 3072 (.cutX 17920 .empty (.cutY 2560 (.cutX 18176 .empty (.cutY 2304 (.cutX 18304 (.cutY 2176 (.cutX 18240 (.cutY 2112 .full .full) (.cutY 2112 .full .full)) (.cutX 18240 (.cutY 2240 .full (.cutX 18208 (.cutY 2272 .full .full) (.cutY 2272 .full .full))) (.cutY 2240 .full .full))) (.cutY 2176 .full .full)) .empty)) .empty)) .empty))) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 .empty (.cutX 29696 .empty (.cutY 15360 (.cutX 30208 .empty (.cutY 14848 (.cutX 30464 .empty (.cutY 14592 (.cutX 30592 (.cutY 14464 .full (.cutX 30528 (.cutY 14528 .full (.cutX 30496 (.cutY 14560 .full .full) (.cutY 14560 .full .full))) (.cutY 14528 .full .full))) (.cutY 14464 .full (.cutX 30656 (.cutY 14528 .full .full) (.cutY 14528 .full .full)))) .empty)) .empty)) .empty))) .empty))))) .empty))

theorem metadata2 : 0<67702166 ∧ 8<128 ∧ 71<128 ∧ 0<4 ∧
    1031/4160=0 ∧ 1031%4160=1031 ∧ ∀ i, (leaves2 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData2).mp
    (by decide +kernel)

theorem sourceChecked2_0 : ∀ i : Fin 52,
    (fun i => output2 i = raw2 (source2 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked2 : ∀ i : Fin 52, (fun i => output2 i = raw2 (source2 i)) i :=
  forallFin_of_zero_offset (fun i => output2 i = raw2 (source2 i)) sourceChecked2_0

theorem coverChecked2_0 : ∀ i : Fin 52,
    (fun i => (output2 (cover2 i)).ContainsBox (raw2 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked2 : ∀ i : Fin 52, (fun i => (output2 (cover2 i)).ContainsBox (raw2 i)) i :=
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

noncomputable def phaseMass2 : ℝ := singlePhaseMass (67702166/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw2 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass2_eq : phaseMass2 = (33851083/819200000000 : ℝ) := by
  unfold phaseMass2
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw2 output2 cover2 source2
    (gridTreeUnionCheck_sound 32768 raw2 output2 cover2 source2 tree2 checked2)
    _ (by norm_num) _, areaUnits2]
  norm_num

-- Frozen phase 5911, atom 5410, type 1, source (10,70).
def leavesData3 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩))) (.node (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩)))) (.node (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩))) (.node (.node (.single ⟨3,4,0⟩) (.single ⟨3,4,1⟩)) (.node (.single ⟨3,5,0⟩) (.single ⟨3,5,1⟩)))))
def leaves3 : Fin 16 → DyadicLeaf := leavesData3.get
def raw3 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 10 70 leaves3 i
def outputData3 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨2560,2624,17920,17984⟩) (.single ⟨2560,2624,17984,18048⟩)) (.node (.single ⟨2624,2688,17920,17984⟩) (.single ⟨2624,2688,17984,18048⟩))) (.node (.node (.single ⟨2560,2688,18048,18176⟩) (.single ⟨2688,2720,17920,17952⟩)) (.node (.single ⟨2688,2720,17952,17984⟩) (.single ⟨2720,2752,17920,17952⟩)))) (.node (.node (.node (.single ⟨2720,2752,17952,17984⟩) (.single ⟨2688,2752,17984,18048⟩)) (.node (.single ⟨2752,2784,17920,17952⟩) (.single ⟨2752,2784,17952,17984⟩))) (.node (.node (.single ⟨2784,2816,17920,17952⟩) (.single ⟨2784,2816,17952,17984⟩)) (.node (.single ⟨2752,2816,17984,18048⟩) (.single ⟨2688,2816,18048,18176⟩))))) (.node (.node (.node (.node (.single ⟨14592,14720,29952,30080⟩) (.single ⟨14592,14720,30080,30208⟩)) (.node (.single ⟨14720,14784,29952,30016⟩) (.single ⟨14720,14784,30016,30080⟩))) (.node (.node (.single ⟨14784,14816,29952,29984⟩) (.single ⟨14784,14816,29984,30016⟩)) (.node (.single ⟨14816,14848,29952,29984⟩) (.single ⟨14816,14848,29984,30016⟩)))) (.node (.node (.node (.single ⟨14784,14816,30016,30048⟩) (.single ⟨14784,14816,30048,30080⟩)) (.node (.single ⟨14816,14848,30016,30048⟩) (.single ⟨14816,14848,30048,30080⟩))) (.node (.node (.single ⟨14720,14784,30080,30144⟩) (.single ⟨14720,14784,30144,30208⟩)) (.node (.single ⟨14784,14848,30080,30144⟩) (.single ⟨14784,14848,30144,30208⟩)))))) (.node (.node (.node (.node (.node (.single ⟨17920,17984,2560,2624⟩) (.single ⟨17920,17984,2624,2688⟩)) (.node (.single ⟨17984,18048,2560,2624⟩) (.single ⟨17984,18048,2624,2688⟩))) (.node (.node (.single ⟨17920,17952,2688,2720⟩) (.single ⟨17920,17952,2720,2752⟩)) (.node (.single ⟨17952,17984,2688,2720⟩) (.single ⟨17952,17984,2720,2752⟩)))) (.node (.node (.node (.single ⟨17920,17952,2752,2784⟩) (.single ⟨17920,17952,2784,2816⟩)) (.node (.single ⟨17952,17984,2752,2784⟩) (.single ⟨17952,17984,2784,2816⟩))) (.node (.node (.single ⟨17984,18048,2688,2752⟩) (.single ⟨17984,18048,2752,2816⟩)) (.node (.single ⟨18048,18176,2560,2688⟩) (.single ⟨18048,18176,2688,2816⟩))))) (.node (.node (.node (.node (.single ⟨29952,30080,14592,14720⟩) (.single ⟨29952,30016,14720,14784⟩)) (.node (.single ⟨29952,29984,14784,14816⟩) (.single ⟨29952,29984,14816,14848⟩))) (.node (.node (.single ⟨29984,30016,14784,14816⟩) (.single ⟨29984,30016,14816,14848⟩)) (.node (.single ⟨30016,30080,14720,14784⟩) (.single ⟨30016,30048,14784,14816⟩)))) (.node (.node (.node (.single ⟨30016,30048,14816,14848⟩) (.single ⟨30048,30080,14784,14816⟩)) (.node (.single ⟨30048,30080,14816,14848⟩) (.single ⟨30080,30208,14592,14720⟩))) (.node (.node (.single ⟨30080,30144,14720,14784⟩) (.single ⟨30080,30144,14784,14848⟩)) (.node (.single ⟨30144,30208,14720,14784⟩) (.single ⟨30144,30208,14784,14848⟩)))))))
def output3 : Fin 64 → GridBox := outputData3.get
def coverData3 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 46)) (.node (.single 59) (.single 17))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16)))) (.node (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31))) (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29))))) (.node (.node (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30))) (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28)))) (.node (.node (.node (.single 9) (.single 44)) (.node (.single 54) (.single 19))) (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18)))))) (.node (.node (.node (.node (.node (.single 10) (.single 40)) (.node (.single 53) (.single 23))) (.node (.node (.single 11) (.single 42)) (.node (.single 52) (.single 21)))) (.node (.node (.node (.single 12) (.single 41)) (.node (.single 51) (.single 22))) (.node (.node (.single 13) (.single 43)) (.node (.single 50) (.single 20))))) (.node (.node (.node (.node (.single 5) (.single 36)) (.node (.single 58) (.single 27))) (.node (.node (.single 6) (.single 38)) (.node (.single 57) (.single 25)))) (.node (.node (.node (.single 7) (.single 37)) (.node (.single 56) (.single 26))) (.node (.node (.single 8) (.single 39)) (.node (.single 55) (.single 24)))))))
def sourceData3 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.single 20))) (.node (.node (.single 0) (.single 48)) (.node (.single 52) (.single 56)))) (.node (.node (.node (.single 60) (.single 24)) (.node (.single 32) (.single 36))) (.node (.node (.single 40) (.single 44)) (.node (.single 28) (.single 4))))) (.node (.node (.node (.node (.single 7) (.single 3)) (.node (.single 31) (.single 27))) (.node (.node (.single 47) (.single 39)) (.node (.single 43) (.single 35)))) (.node (.node (.node (.single 63) (.single 55)) (.node (.single 59) (.single 51))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.single 21))) (.node (.node (.single 49) (.single 57)) (.node (.single 53) (.single 61)))) (.node (.node (.node (.single 33) (.single 41)) (.node (.single 37) (.single 45))) (.node (.node (.single 25) (.single 29)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.node (.single 6) (.single 30)) (.node (.single 46) (.single 42))) (.node (.node (.single 38) (.single 34)) (.node (.single 26) (.single 62)))) (.node (.node (.node (.single 58) (.single 54)) (.node (.single 50) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover3 (i : Fin 64) : Fin 64 := ⟨coverData3.get i % 64, Nat.mod_lt _ (by decide)⟩
def source3 (i : Fin 64) : Fin 64 := ⟨sourceData3.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree3 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 (.cutX 3072 (.cutY 17408 .empty (.cutX 2560 .empty (.cutY 17920 .empty (.cutX 2816 (.cutY 18176 (.cutX 2688 (.cutY 18048 (.cutX 2624 (.cutY 17984 .full .full) (.cutY 17984 .full .full)) .full) (.cutY 18048 (.cutX 2752 (.cutY 17984 (.cutX 2720 (.cutY 17952 .full .full) (.cutY 17952 .full .full)) .full) (.cutY 17984 (.cutX 2784 (.cutY 17952 .full .full) (.cutY 17952 .full .full)) .full)) .full)) .empty) .empty)))) .empty) .empty)) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 (.cutX 15360 (.cutY 29696 .empty (.cutX 14848 (.cutY 30208 (.cutX 14592 .empty (.cutY 29952 .empty (.cutX 14720 (.cutY 30080 .full .full) (.cutY 30080 (.cutX 14784 (.cutY 30016 .full .full) (.cutY 30016 (.cutX 14816 (.cutY 29984 .full .full) (.cutY 29984 .full .full)) (.cutX 14816 (.cutY 30048 .full .full) (.cutY 30048 .full .full)))) (.cutX 14784 (.cutY 30144 .full .full) (.cutY 30144 .full .full)))))) .empty) .empty)) .empty) .empty))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 .empty (.cutX 17408 .empty (.cutY 3072 (.cutX 17920 .empty (.cutY 2560 .empty (.cutX 18176 (.cutY 2816 (.cutX 18048 (.cutY 2688 (.cutX 17984 (.cutY 2624 .full .full) (.cutY 2624 .full .full)) (.cutX 17984 (.cutY 2752 (.cutX 17952 (.cutY 2720 .full .full) (.cutY 2720 .full .full)) (.cutX 17952 (.cutY 2784 .full .full) (.cutY 2784 .full .full))) (.cutY 2752 .full .full))) (.cutY 2688 .full .full)) .empty) .empty))) .empty))) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 .empty (.cutX 29696 .empty (.cutY 15360 (.cutX 30208 (.cutY 14848 (.cutX 29952 .empty (.cutY 14592 .empty (.cutX 30080 (.cutY 14720 .full (.cutX 30016 (.cutY 14784 .full (.cutX 29984 (.cutY 14816 .full .full) (.cutY 14816 .full .full))) (.cutY 14784 .full (.cutX 30048 (.cutY 14816 .full .full) (.cutY 14816 .full .full))))) (.cutY 14720 .full (.cutX 30144 (.cutY 14784 .full .full) (.cutY 14784 .full .full)))))) .empty) .empty) .empty))) .empty))))) .empty))

theorem metadata3 : 0<135229957 ∧ 10<128 ∧ 70<128 ∧ 1<4 ∧
    5410/4160=1 ∧ 5410%4160=1250 ∧ ∀ i, (leaves3 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData3).mp
    (by decide +kernel)

theorem sourceChecked3_0 : ∀ i : Fin 64,
    (fun i => output3 i = raw3 (source3 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked3 : ∀ i : Fin 64, (fun i => output3 i = raw3 (source3 i)) i :=
  forallFin_of_zero_offset (fun i => output3 i = raw3 (source3 i)) sourceChecked3_0

theorem coverChecked3_0 : ∀ i : Fin 64,
    (fun i => (output3 (cover3 i)).ContainsBox (raw3 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked3 : ∀ i : Fin 64, (fun i => (output3 (cover3 i)).ContainsBox (raw3 i)) i :=
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

noncomputable def phaseMass3 : ℝ := singlePhaseMass (135229957/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw3 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass3_eq : phaseMass3 = (135229957/1638400000000 : ℝ) := by
  unfold phaseMass3
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw3 output3 cover3 source3
    (gridTreeUnionCheck_sound 32768 raw3 output3 cover3 source3 tree3 checked3)
    _ (by norm_num) _, areaUnits3]
  norm_num

-- Frozen phase 5912, atom 1360, type 0, source (11,73).
def leavesData4 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves4 : Fin 7 → DyadicLeaf := leavesData4.get
def raw4 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 11 73 leaves4 i
def outputData4 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨2816,2944,18688,18816⟩) (.node (.single ⟨2816,2944,18816,18944⟩) (.single ⟨2944,3008,18688,18752⟩))) (.node (.node (.single ⟨2944,3008,18752,18816⟩) (.single ⟨3008,3072,18688,18752⟩)) (.node (.single ⟨3008,3072,18752,18816⟩) (.single ⟨2944,3072,18816,18944⟩)))) (.node (.node (.single ⟨13824,13952,29696,29824⟩) (.node (.single ⟨13824,13952,29824,29952⟩) (.single ⟨13952,14016,29696,29760⟩))) (.node (.node (.single ⟨13952,14016,29760,29824⟩) (.single ⟨14016,14080,29696,29760⟩)) (.node (.single ⟨14016,14080,29760,29824⟩) (.single ⟨13952,14080,29824,29952⟩))))) (.node (.node (.node (.single ⟨18688,18816,2816,2944⟩) (.node (.single ⟨18688,18752,2944,3008⟩) (.single ⟨18688,18752,3008,3072⟩))) (.node (.node (.single ⟨18752,18816,2944,3008⟩) (.single ⟨18752,18816,3008,3072⟩)) (.node (.single ⟨18816,18944,2816,2944⟩) (.single ⟨18816,18944,2944,3072⟩)))) (.node (.node (.single ⟨29696,29824,13824,13952⟩) (.node (.single ⟨29696,29760,13952,14016⟩) (.single ⟨29696,29760,14016,14080⟩))) (.node (.node (.single ⟨29760,29824,13952,14016⟩) (.single ⟨29760,29824,14016,14080⟩)) (.node (.single ⟨29824,29952,13824,13952⟩) (.single ⟨29824,29952,13952,14080⟩))))))
def output4 : Fin 28 → GridBox := outputData4.get
def coverData4 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData4 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover4 (i : Fin 28) : Fin 28 := ⟨coverData4.get i % 28, Nat.mod_lt _ (by decide)⟩
def source4 (i : Fin 28) : Fin 28 := ⟨sourceData4.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree4 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 (.cutY 19456 (.cutX 2560 .empty (.cutY 18944 (.cutX 2816 .empty (.cutY 18688 .empty (.cutX 2944 (.cutY 18816 .full .full) (.cutY 18816 (.cutX 3008 (.cutY 18752 .full .full) (.cutY 18752 .full .full)) .full)))) .empty)) .empty) .empty))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 .empty (.cutY 29696 .empty (.cutX 13824 .empty (.cutY 30208 (.cutX 14080 (.cutY 29952 (.cutX 13952 (.cutY 29824 .full .full) (.cutY 29824 (.cutX 14016 (.cutY 29760 .full .full) (.cutY 29760 .full .full)) .full)) .empty) .empty) .empty)))) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 (.cutY 3072 (.cutX 18944 (.cutY 2560 .empty (.cutX 18688 .empty (.cutY 2816 .empty (.cutX 18816 (.cutY 2944 .full (.cutX 18752 (.cutY 3008 .full .full) (.cutY 3008 .full .full))) (.cutY 2944 .full .full))))) .empty) .empty) .empty))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 .empty (.cutY 13312 .empty (.cutX 30208 (.cutY 13824 .empty (.cutX 29952 (.cutY 14080 (.cutX 29824 (.cutY 13952 .full (.cutX 29760 (.cutY 14016 .full .full) (.cutY 14016 .full .full))) (.cutY 13952 .full .full)) .empty) .empty)) .empty))) .empty) .empty))))) .empty))

theorem metadata4 : 0<48363413 ∧ 11<128 ∧ 73<128 ∧ 0<4 ∧
    1360/4160=0 ∧ 1360%4160=1360 ∧ ∀ i, (leaves4 i).Valid 8 := by
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

noncomputable def phaseMass4 : ℝ := singlePhaseMass (48363413/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw4 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass4_eq : phaseMass4 = (48363413/1638400000000 : ℝ) := by
  unfold phaseMass4
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw4 output4 cover4 source4
    (gridTreeUnionCheck_sound 32768 raw4 output4 cover4 source4 tree4 checked4)
    _ (by norm_num) _, areaUnits4]
  norm_num

-- Frozen phase 5913, atom 5076, type 1, source (7,69).
def leavesData5 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩))) (.node (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩)))) (.node (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩))) (.node (.node (.single ⟨3,4,0⟩) (.single ⟨3,4,1⟩)) (.node (.single ⟨3,5,0⟩) (.single ⟨3,5,1⟩)))))
def leaves5 : Fin 16 → DyadicLeaf := leavesData5.get
def raw5 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 7 69 leaves5 i
def outputData5 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨1792,1856,17664,17728⟩) (.single ⟨1792,1856,17728,17792⟩)) (.node (.single ⟨1856,1920,17664,17728⟩) (.single ⟨1856,1920,17728,17792⟩))) (.node (.node (.single ⟨1792,1920,17792,17920⟩) (.single ⟨1920,1952,17664,17696⟩)) (.node (.single ⟨1920,1952,17696,17728⟩) (.single ⟨1952,1984,17664,17696⟩)))) (.node (.node (.node (.single ⟨1952,1984,17696,17728⟩) (.single ⟨1920,1984,17728,17792⟩)) (.node (.single ⟨1984,2016,17664,17696⟩) (.single ⟨1984,2016,17696,17728⟩))) (.node (.node (.single ⟨2016,2048,17664,17696⟩) (.single ⟨2016,2048,17696,17728⟩)) (.node (.single ⟨1984,2048,17728,17792⟩) (.single ⟨1920,2048,17792,17920⟩))))) (.node (.node (.node (.node (.single ⟨14848,14976,30720,30848⟩) (.single ⟨14848,14976,30848,30976⟩)) (.node (.single ⟨14976,15040,30720,30784⟩) (.single ⟨14976,15040,30784,30848⟩))) (.node (.node (.single ⟨15040,15072,30720,30752⟩) (.single ⟨15040,15072,30752,30784⟩)) (.node (.single ⟨15072,15104,30720,30752⟩) (.single ⟨15072,15104,30752,30784⟩)))) (.node (.node (.node (.single ⟨15040,15072,30784,30816⟩) (.single ⟨15040,15072,30816,30848⟩)) (.node (.single ⟨15072,15104,30784,30816⟩) (.single ⟨15072,15104,30816,30848⟩))) (.node (.node (.single ⟨14976,15040,30848,30912⟩) (.single ⟨14976,15040,30912,30976⟩)) (.node (.single ⟨15040,15104,30848,30912⟩) (.single ⟨15040,15104,30912,30976⟩)))))) (.node (.node (.node (.node (.node (.single ⟨17664,17728,1792,1856⟩) (.single ⟨17664,17728,1856,1920⟩)) (.node (.single ⟨17728,17792,1792,1856⟩) (.single ⟨17728,17792,1856,1920⟩))) (.node (.node (.single ⟨17664,17696,1920,1952⟩) (.single ⟨17664,17696,1952,1984⟩)) (.node (.single ⟨17696,17728,1920,1952⟩) (.single ⟨17696,17728,1952,1984⟩)))) (.node (.node (.node (.single ⟨17664,17696,1984,2016⟩) (.single ⟨17664,17696,2016,2048⟩)) (.node (.single ⟨17696,17728,1984,2016⟩) (.single ⟨17696,17728,2016,2048⟩))) (.node (.node (.single ⟨17728,17792,1920,1984⟩) (.single ⟨17728,17792,1984,2048⟩)) (.node (.single ⟨17792,17920,1792,1920⟩) (.single ⟨17792,17920,1920,2048⟩))))) (.node (.node (.node (.node (.single ⟨30720,30848,14848,14976⟩) (.single ⟨30720,30784,14976,15040⟩)) (.node (.single ⟨30720,30752,15040,15072⟩) (.single ⟨30720,30752,15072,15104⟩))) (.node (.node (.single ⟨30752,30784,15040,15072⟩) (.single ⟨30752,30784,15072,15104⟩)) (.node (.single ⟨30784,30848,14976,15040⟩) (.single ⟨30784,30816,15040,15072⟩)))) (.node (.node (.node (.single ⟨30784,30816,15072,15104⟩) (.single ⟨30816,30848,15040,15072⟩)) (.node (.single ⟨30816,30848,15072,15104⟩) (.single ⟨30848,30976,14848,14976⟩))) (.node (.node (.single ⟨30848,30912,14976,15040⟩) (.single ⟨30848,30912,15040,15104⟩)) (.node (.single ⟨30912,30976,14976,15040⟩) (.single ⟨30912,30976,15040,15104⟩)))))))
def output5 : Fin 64 → GridBox := outputData5.get
def coverData5 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 46)) (.node (.single 59) (.single 17))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16)))) (.node (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31))) (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29))))) (.node (.node (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30))) (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28)))) (.node (.node (.node (.single 9) (.single 44)) (.node (.single 54) (.single 19))) (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18)))))) (.node (.node (.node (.node (.node (.single 10) (.single 40)) (.node (.single 53) (.single 23))) (.node (.node (.single 11) (.single 42)) (.node (.single 52) (.single 21)))) (.node (.node (.node (.single 12) (.single 41)) (.node (.single 51) (.single 22))) (.node (.node (.single 13) (.single 43)) (.node (.single 50) (.single 20))))) (.node (.node (.node (.node (.single 5) (.single 36)) (.node (.single 58) (.single 27))) (.node (.node (.single 6) (.single 38)) (.node (.single 57) (.single 25)))) (.node (.node (.node (.single 7) (.single 37)) (.node (.single 56) (.single 26))) (.node (.node (.single 8) (.single 39)) (.node (.single 55) (.single 24)))))))
def sourceData5 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.single 20))) (.node (.node (.single 0) (.single 48)) (.node (.single 52) (.single 56)))) (.node (.node (.node (.single 60) (.single 24)) (.node (.single 32) (.single 36))) (.node (.node (.single 40) (.single 44)) (.node (.single 28) (.single 4))))) (.node (.node (.node (.node (.single 7) (.single 3)) (.node (.single 31) (.single 27))) (.node (.node (.single 47) (.single 39)) (.node (.single 43) (.single 35)))) (.node (.node (.node (.single 63) (.single 55)) (.node (.single 59) (.single 51))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.single 21))) (.node (.node (.single 49) (.single 57)) (.node (.single 53) (.single 61)))) (.node (.node (.node (.single 33) (.single 41)) (.node (.single 37) (.single 45))) (.node (.node (.single 25) (.single 29)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.node (.single 6) (.single 30)) (.node (.single 46) (.single 42))) (.node (.node (.single 38) (.single 34)) (.node (.single 26) (.single 62)))) (.node (.node (.node (.single 58) (.single 54)) (.node (.single 50) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover5 (i : Fin 64) : Fin 64 := ⟨coverData5.get i % 64, Nat.mod_lt _ (by decide)⟩
def source5 (i : Fin 64) : Fin 64 := ⟨sourceData5.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree5 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 (.cutX 1024 .empty (.cutY 17408 .empty (.cutX 1536 .empty (.cutY 17920 (.cutX 1792 .empty (.cutY 17664 .empty (.cutX 1920 (.cutY 17792 (.cutX 1856 (.cutY 17728 .full .full) (.cutY 17728 .full .full)) .full) (.cutY 17792 (.cutX 1984 (.cutY 17728 (.cutX 1952 (.cutY 17696 .full .full) (.cutY 17696 .full .full)) .full) (.cutY 17728 (.cutX 2016 (.cutY 17696 .full .full) (.cutY 17696 .full .full)) .full)) .full)))) .empty)))) .empty) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 .empty (.cutX 15360 (.cutY 31744 (.cutX 14848 .empty (.cutY 31232 (.cutX 15104 (.cutY 30976 (.cutX 14976 (.cutY 30848 .full .full) (.cutY 30848 (.cutX 15040 (.cutY 30784 .full .full) (.cutY 30784 (.cutX 15072 (.cutY 30752 .full .full) (.cutY 30752 .full .full)) (.cutX 15072 (.cutY 30816 .full .full) (.cutY 30816 .full .full)))) (.cutX 15040 (.cutY 30912 .full .full) (.cutY 30912 .full .full)))) .empty) .empty) .empty)) .empty) .empty)))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 (.cutX 17408 .empty (.cutY 1024 .empty (.cutX 17920 (.cutY 1536 .empty (.cutX 17664 .empty (.cutY 1792 .empty (.cutX 17792 (.cutY 1920 (.cutX 17728 (.cutY 1856 .full .full) (.cutY 1856 .full .full)) (.cutX 17728 (.cutY 1984 (.cutX 17696 (.cutY 1952 .full .full) (.cutY 1952 .full .full)) (.cutX 17696 (.cutY 2016 .full .full) (.cutY 2016 .full .full))) (.cutY 1984 .full .full))) (.cutY 1920 .full .full))))) .empty))) .empty) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 .empty (.cutX 31744 (.cutY 15360 (.cutX 31232 (.cutY 14848 .empty (.cutX 30976 (.cutY 15104 (.cutX 30848 (.cutY 14976 .full (.cutX 30784 (.cutY 15040 .full (.cutX 30752 (.cutY 15072 .full .full) (.cutY 15072 .full .full))) (.cutY 15040 .full (.cutX 30816 (.cutY 15072 .full .full) (.cutY 15072 .full .full))))) (.cutY 14976 .full (.cutX 30912 (.cutY 15040 .full .full) (.cutY 15040 .full .full)))) .empty) .empty)) .empty) .empty) .empty))))))) .empty))

theorem metadata5 : 0<202148459 ∧ 7<128 ∧ 69<128 ∧ 1<4 ∧
    5076/4160=1 ∧ 5076%4160=916 ∧ ∀ i, (leaves5 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData5).mp
    (by decide +kernel)

theorem sourceChecked5_0 : ∀ i : Fin 64,
    (fun i => output5 i = raw5 (source5 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked5 : ∀ i : Fin 64, (fun i => output5 i = raw5 (source5 i)) i :=
  forallFin_of_zero_offset (fun i => output5 i = raw5 (source5 i)) sourceChecked5_0

theorem coverChecked5_0 : ∀ i : Fin 64,
    (fun i => (output5 (cover5 i)).ContainsBox (raw5 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked5 : ∀ i : Fin 64, (fun i => (output5 (cover5 i)).ContainsBox (raw5 i)) i :=
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

noncomputable def phaseMass5 : ℝ := singlePhaseMass (202148459/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw5 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass5_eq : phaseMass5 = (202148459/1638400000000 : ℝ) := by
  unfold phaseMass5
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw5 output5 cover5 source5
    (gridTreeUnionCheck_sound 32768 raw5 output5 cover5 source5 tree5 checked5)
    _ (by norm_num) _, areaUnits5]
  norm_num

-- Frozen phase 5914, atom 5727, type 1, source (13,72).
def leavesData6 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves6 : Fin 7 → DyadicLeaf := leavesData6.get
def raw6 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 13 72 leaves6 i
def outputData6 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3328,3456,18432,18560⟩) (.node (.single ⟨3328,3456,18560,18688⟩) (.single ⟨3456,3520,18432,18496⟩))) (.node (.node (.single ⟨3456,3520,18496,18560⟩) (.single ⟨3520,3584,18432,18496⟩)) (.node (.single ⟨3520,3584,18496,18560⟩) (.single ⟨3456,3584,18560,18688⟩)))) (.node (.node (.single ⟨14080,14208,29184,29312⟩) (.node (.single ⟨14080,14208,29312,29440⟩) (.single ⟨14208,14272,29184,29248⟩))) (.node (.node (.single ⟨14208,14272,29248,29312⟩) (.single ⟨14272,14336,29184,29248⟩)) (.node (.single ⟨14272,14336,29248,29312⟩) (.single ⟨14208,14336,29312,29440⟩))))) (.node (.node (.node (.single ⟨18432,18560,3328,3456⟩) (.node (.single ⟨18432,18496,3456,3520⟩) (.single ⟨18432,18496,3520,3584⟩))) (.node (.node (.single ⟨18496,18560,3456,3520⟩) (.single ⟨18496,18560,3520,3584⟩)) (.node (.single ⟨18560,18688,3328,3456⟩) (.single ⟨18560,18688,3456,3584⟩)))) (.node (.node (.single ⟨29184,29312,14080,14208⟩) (.node (.single ⟨29184,29248,14208,14272⟩) (.single ⟨29184,29248,14272,14336⟩))) (.node (.node (.single ⟨29248,29312,14208,14272⟩) (.single ⟨29248,29312,14272,14336⟩)) (.node (.single ⟨29312,29440,14080,14208⟩) (.single ⟨29312,29440,14208,14336⟩))))))
def output6 : Fin 28 → GridBox := outputData6.get
def coverData6 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData6 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover6 (i : Fin 28) : Fin 28 := ⟨coverData6.get i % 28, Nat.mod_lt _ (by decide)⟩
def source6 (i : Fin 28) : Fin 28 := ⟨sourceData6.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree6 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 .empty (.cutY 19456 (.cutX 3584 (.cutY 18944 (.cutX 3328 .empty (.cutY 18688 (.cutX 3456 (.cutY 18560 .full .full) (.cutY 18560 (.cutX 3520 (.cutY 18496 .full .full) (.cutY 18496 .full .full)) .full)) .empty)) .empty) .empty) .empty)))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 .empty (.cutY 29696 (.cutX 13824 .empty (.cutY 29184 .empty (.cutX 14080 .empty (.cutY 29440 (.cutX 14208 (.cutY 29312 .full .full) (.cutY 29312 (.cutX 14272 (.cutY 29248 .full .full) (.cutY 29248 .full .full)) .full)) .empty)))) .empty)) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 (.cutY 3072 .empty (.cutX 18944 (.cutY 3584 (.cutX 18688 (.cutY 3328 .empty (.cutX 18560 (.cutY 3456 .full (.cutX 18496 (.cutY 3520 .full .full) (.cutY 3520 .full .full))) (.cutY 3456 .full .full))) .empty) .empty) .empty)) .empty))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 (.cutY 13312 .empty (.cutX 29184 .empty (.cutY 13824 .empty (.cutX 29440 (.cutY 14080 .empty (.cutX 29312 (.cutY 14208 .full (.cutX 29248 (.cutY 14272 .full .full) (.cutY 14272 .full .full))) (.cutY 14208 .full .full))) .empty)))) .empty) .empty) .empty))))) .empty))

theorem metadata6 : 0<94387549 ∧ 13<128 ∧ 72<128 ∧ 1<4 ∧
    5727/4160=1 ∧ 5727%4160=1567 ∧ ∀ i, (leaves6 i).Valid 8 := by
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

noncomputable def phaseMass6 : ℝ := singlePhaseMass (94387549/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw6 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass6_eq : phaseMass6 = (94387549/1638400000000 : ℝ) := by
  unfold phaseMass6
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw6 output6 cover6 source6
    (gridTreeUnionCheck_sound 32768 raw6 output6 cover6 source6 tree6 checked6)
    _ (by norm_num) _, areaUnits6]
  norm_num

-- Frozen phase 5915, atom 2659, type 0, source (25,84).
def leavesData7 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,0⟩))) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves7 : Fin 13 → DyadicLeaf := leavesData7.get
def raw7 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 25 84 leaves7 i
def outputData7 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨6400,6464,21504,21568⟩) (.node (.single ⟨6400,6464,21568,21632⟩) (.single ⟨6464,6528,21504,21568⟩))) (.node (.single ⟨6464,6528,21568,21632⟩) (.node (.single ⟨6400,6528,21632,21760⟩) (.single ⟨6528,6592,21504,21568⟩)))) (.node (.node (.single ⟨6528,6592,21568,21632⟩) (.node (.single ⟨6592,6624,21504,21536⟩) (.single ⟨6592,6624,21536,21568⟩))) (.node (.node (.single ⟨6624,6656,21504,21536⟩) (.single ⟨6624,6656,21536,21568⟩)) (.node (.single ⟨6592,6656,21568,21632⟩) (.single ⟨6528,6656,21632,21760⟩))))) (.node (.node (.node (.single ⟨11008,11136,26112,26240⟩) (.node (.single ⟨11008,11136,26240,26368⟩) (.single ⟨11136,11200,26112,26176⟩))) (.node (.single ⟨11136,11200,26176,26240⟩) (.node (.single ⟨11200,11232,26112,26144⟩) (.single ⟨11200,11232,26144,26176⟩)))) (.node (.node (.single ⟨11232,11264,26112,26144⟩) (.node (.single ⟨11232,11264,26144,26176⟩) (.single ⟨11200,11264,26176,26240⟩))) (.node (.node (.single ⟨11136,11200,26240,26304⟩) (.single ⟨11136,11200,26304,26368⟩)) (.node (.single ⟨11200,11264,26240,26304⟩) (.single ⟨11200,11264,26304,26368⟩)))))) (.node (.node (.node (.node (.single ⟨21504,21568,6400,6464⟩) (.node (.single ⟨21504,21568,6464,6528⟩) (.single ⟨21568,21632,6400,6464⟩))) (.node (.single ⟨21568,21632,6464,6528⟩) (.node (.single ⟨21504,21568,6528,6592⟩) (.single ⟨21504,21536,6592,6624⟩)))) (.node (.node (.single ⟨21504,21536,6624,6656⟩) (.node (.single ⟨21536,21568,6592,6624⟩) (.single ⟨21536,21568,6624,6656⟩))) (.node (.node (.single ⟨21568,21632,6528,6592⟩) (.single ⟨21568,21632,6592,6656⟩)) (.node (.single ⟨21632,21760,6400,6528⟩) (.single ⟨21632,21760,6528,6656⟩))))) (.node (.node (.node (.single ⟨26112,26240,11008,11136⟩) (.node (.single ⟨26112,26176,11136,11200⟩) (.single ⟨26112,26144,11200,11232⟩))) (.node (.single ⟨26112,26144,11232,11264⟩) (.node (.single ⟨26144,26176,11200,11232⟩) (.single ⟨26144,26176,11232,11264⟩)))) (.node (.node (.single ⟨26176,26240,11136,11200⟩) (.node (.single ⟨26176,26240,11200,11264⟩) (.single ⟨26240,26368,11008,11136⟩))) (.node (.node (.single ⟨26240,26304,11136,11200⟩) (.single ⟨26240,26304,11200,11264⟩)) (.node (.single ⟨26304,26368,11136,11200⟩) (.single ⟨26304,26368,11200,11264⟩)))))))
def output7 : Fin 52 → GridBox := outputData7.get
def coverData7 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 0))) (.node (.node (.single 26) (.single 51)) (.node (.single 25) (.single 1))))) (.node (.node (.node (.single 28) (.node (.single 50) (.single 23))) (.node (.single 2) (.node (.single 27) (.single 49)))) (.node (.node (.single 24) (.node (.single 3) (.single 29))) (.node (.node (.single 48) (.single 22)) (.node (.single 5) (.single 30)))))) (.node (.node (.node (.node (.single 46) (.node (.single 21) (.single 6))) (.node (.single 35) (.node (.single 45) (.single 16)))) (.node (.node (.single 11) (.node (.single 36) (.single 40))) (.node (.node (.single 15) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData7 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.single 20) (.node (.single 0) (.single 24)))) (.node (.node (.single 28) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 35))) (.node (.single 31) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.node (.single 17) (.single 13))) (.node (.single 21) (.node (.single 25) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 34) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 30) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover7 (i : Fin 52) : Fin 52 := ⟨coverData7.get i % 52, Nat.mod_lt _ (by decide)⟩
def source7 (i : Fin 52) : Fin 52 := ⟨sourceData7.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree7 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 (.cutX 7168 (.cutY 21504 .empty (.cutX 6656 (.cutY 22016 (.cutX 6400 .empty (.cutY 21760 (.cutX 6528 (.cutY 21632 (.cutX 6464 (.cutY 21568 .full .full) (.cutY 21568 .full .full)) .full) (.cutY 21632 (.cutX 6592 (.cutY 21568 .full .full) (.cutY 21568 (.cutX 6624 (.cutY 21536 .full .full) (.cutY 21536 .full .full)) .full)) .full)) .empty)) .empty) .empty)) .empty) .empty)))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 (.cutX 11264 (.cutY 25600 .empty (.cutX 10752 .empty (.cutY 26112 .empty (.cutX 11008 .empty (.cutY 26368 (.cutX 11136 (.cutY 26240 .full .full) (.cutY 26240 (.cutX 11200 (.cutY 26176 .full .full) (.cutY 26176 (.cutX 11232 (.cutY 26144 .full .full) (.cutY 26144 .full .full)) .full)) (.cutX 11200 (.cutY 26304 .full .full) (.cutY 26304 .full .full)))) .empty))))) .empty) .empty)) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 .empty (.cutX 21504 .empty (.cutY 7168 (.cutX 22016 (.cutY 6656 (.cutX 21760 (.cutY 6400 .empty (.cutX 21632 (.cutY 6528 (.cutX 21568 (.cutY 6464 .full .full) (.cutY 6464 .full .full)) (.cutX 21568 (.cutY 6592 .full (.cutX 21536 (.cutY 6624 .full .full) (.cutY 6624 .full .full))) (.cutY 6592 .full .full))) (.cutY 6528 .full .full))) .empty) .empty) .empty) .empty))) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 .empty (.cutX 25600 .empty (.cutY 11264 (.cutX 26112 .empty (.cutY 10752 .empty (.cutX 26368 (.cutY 11008 .empty (.cutX 26240 (.cutY 11136 .full (.cutX 26176 (.cutY 11200 .full (.cutX 26144 (.cutY 11232 .full .full) (.cutY 11232 .full .full))) (.cutY 11200 .full .full))) (.cutY 11136 .full (.cutX 26304 (.cutY 11200 .full .full) (.cutY 11200 .full .full))))) .empty))) .empty))) .empty) .empty) .empty))) .empty))

theorem metadata7 : 0<104681033 ∧ 25<128 ∧ 84<128 ∧ 0<4 ∧
    2659/4160=0 ∧ 2659%4160=2659 ∧ ∀ i, (leaves7 i).Valid 8 := by
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

noncomputable def phaseMass7 : ℝ := singlePhaseMass (104681033/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw7 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass7_eq : phaseMass7 = (104681033/1638400000000 : ℝ) := by
  unfold phaseMass7
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw7 output7 cover7 source7
    (gridTreeUnionCheck_sound 32768 raw7 output7 cover7 source7 tree7 checked7)
    _ (by norm_num) _, areaUnits7]
  norm_num

-- Frozen phase 5916, atom 2241, type 0, source (20,81).
def leavesData8 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,0⟩))) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves8 : Fin 13 → DyadicLeaf := leavesData8.get
def raw8 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 20 81 leaves8 i
def outputData8 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨5120,5184,20736,20800⟩) (.node (.single ⟨5120,5184,20800,20864⟩) (.single ⟨5184,5248,20736,20800⟩))) (.node (.single ⟨5184,5248,20800,20864⟩) (.node (.single ⟨5120,5248,20864,20992⟩) (.single ⟨5248,5312,20736,20800⟩)))) (.node (.node (.single ⟨5248,5312,20800,20864⟩) (.node (.single ⟨5312,5344,20736,20768⟩) (.single ⟨5312,5344,20768,20800⟩))) (.node (.node (.single ⟨5344,5376,20736,20768⟩) (.single ⟨5344,5376,20768,20800⟩)) (.node (.single ⟨5312,5376,20800,20864⟩) (.single ⟨5248,5376,20864,20992⟩))))) (.node (.node (.node (.single ⟨11776,11904,27392,27520⟩) (.node (.single ⟨11776,11904,27520,27648⟩) (.single ⟨11904,11968,27392,27456⟩))) (.node (.single ⟨11904,11968,27456,27520⟩) (.node (.single ⟨11968,12000,27392,27424⟩) (.single ⟨11968,12000,27424,27456⟩)))) (.node (.node (.single ⟨12000,12032,27392,27424⟩) (.node (.single ⟨12000,12032,27424,27456⟩) (.single ⟨11968,12032,27456,27520⟩))) (.node (.node (.single ⟨11904,11968,27520,27584⟩) (.single ⟨11904,11968,27584,27648⟩)) (.node (.single ⟨11968,12032,27520,27584⟩) (.single ⟨11968,12032,27584,27648⟩)))))) (.node (.node (.node (.node (.single ⟨20736,20800,5120,5184⟩) (.node (.single ⟨20736,20800,5184,5248⟩) (.single ⟨20800,20864,5120,5184⟩))) (.node (.single ⟨20800,20864,5184,5248⟩) (.node (.single ⟨20736,20800,5248,5312⟩) (.single ⟨20736,20768,5312,5344⟩)))) (.node (.node (.single ⟨20736,20768,5344,5376⟩) (.node (.single ⟨20768,20800,5312,5344⟩) (.single ⟨20768,20800,5344,5376⟩))) (.node (.node (.single ⟨20800,20864,5248,5312⟩) (.single ⟨20800,20864,5312,5376⟩)) (.node (.single ⟨20864,20992,5120,5248⟩) (.single ⟨20864,20992,5248,5376⟩))))) (.node (.node (.node (.single ⟨27392,27520,11776,11904⟩) (.node (.single ⟨27392,27456,11904,11968⟩) (.single ⟨27392,27424,11968,12000⟩))) (.node (.single ⟨27392,27424,12000,12032⟩) (.node (.single ⟨27424,27456,11968,12000⟩) (.single ⟨27424,27456,12000,12032⟩)))) (.node (.node (.single ⟨27456,27520,11904,11968⟩) (.node (.single ⟨27456,27520,11968,12032⟩) (.single ⟨27520,27648,11776,11904⟩))) (.node (.node (.single ⟨27520,27584,11904,11968⟩) (.single ⟨27520,27584,11968,12032⟩)) (.node (.single ⟨27584,27648,11904,11968⟩) (.single ⟨27584,27648,11968,12032⟩)))))))
def output8 : Fin 52 → GridBox := outputData8.get
def coverData8 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 0))) (.node (.node (.single 26) (.single 51)) (.node (.single 25) (.single 1))))) (.node (.node (.node (.single 28) (.node (.single 50) (.single 23))) (.node (.single 2) (.node (.single 27) (.single 49)))) (.node (.node (.single 24) (.node (.single 3) (.single 29))) (.node (.node (.single 48) (.single 22)) (.node (.single 5) (.single 30)))))) (.node (.node (.node (.node (.single 46) (.node (.single 21) (.single 6))) (.node (.single 35) (.node (.single 45) (.single 16)))) (.node (.node (.single 11) (.node (.single 36) (.single 40))) (.node (.node (.single 15) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData8 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.single 20) (.node (.single 0) (.single 24)))) (.node (.node (.single 28) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 35))) (.node (.single 31) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.node (.single 17) (.single 13))) (.node (.single 21) (.node (.single 25) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 34) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 30) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover8 (i : Fin 52) : Fin 52 := ⟨coverData8.get i % 52, Nat.mod_lt _ (by decide)⟩
def source8 (i : Fin 52) : Fin 52 := ⟨sourceData8.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree8 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 .empty (.cutY 21504 (.cutX 5632 (.cutY 20992 (.cutX 5376 (.cutY 20736 .empty (.cutX 5248 (.cutY 20864 (.cutX 5184 (.cutY 20800 .full .full) (.cutY 20800 .full .full)) .full) (.cutY 20864 (.cutX 5312 (.cutY 20800 .full .full) (.cutY 20800 (.cutX 5344 (.cutY 20768 .full .full) (.cutY 20768 .full .full)) .full)) .full))) .empty) .empty) .empty) .empty)) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 .empty (.cutY 27648 (.cutX 11776 .empty (.cutY 27136 .empty (.cutX 12032 (.cutY 27392 .empty (.cutX 11904 (.cutY 27520 .full .full) (.cutY 27520 (.cutX 11968 (.cutY 27456 .full .full) (.cutY 27456 (.cutX 12000 (.cutY 27424 .full .full) (.cutY 27424 .full .full)) .full)) (.cutX 11968 (.cutY 27584 .full .full) (.cutY 27584 .full .full))))) .empty))) .empty)))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 (.cutY 5120 .empty (.cutX 20992 (.cutY 5632 (.cutX 20736 .empty (.cutY 5376 (.cutX 20864 (.cutY 5248 (.cutX 20800 (.cutY 5184 .full .full) (.cutY 5184 .full .full)) (.cutX 20800 (.cutY 5312 .full (.cutX 20768 (.cutY 5344 .full .full) (.cutY 5344 .full .full))) (.cutY 5312 .full .full))) (.cutY 5248 .full .full)) .empty)) .empty) .empty)) .empty) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 (.cutY 11264 .empty (.cutX 27136 .empty (.cutY 11776 .empty (.cutX 27392 .empty (.cutY 12032 (.cutX 27520 (.cutY 11904 .full (.cutX 27456 (.cutY 11968 .full (.cutX 27424 (.cutY 12000 .full .full) (.cutY 12000 .full .full))) (.cutY 11968 .full .full))) (.cutY 11904 .full (.cutX 27584 (.cutY 11968 .full .full) (.cutY 11968 .full .full)))) .empty))))) .empty))) .empty) .empty))) .empty))

theorem metadata8 : 0<152546139 ∧ 20<128 ∧ 81<128 ∧ 0<4 ∧
    2241/4160=0 ∧ 2241%4160=2241 ∧ ∀ i, (leaves8 i).Valid 8 := by
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

noncomputable def phaseMass8 : ℝ := singlePhaseMass (152546139/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw8 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass8_eq : phaseMass8 = (152546139/1638400000000 : ℝ) := by
  unfold phaseMass8
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw8 output8 cover8 source8
    (gridTreeUnionCheck_sound 32768 raw8 output8 cover8 source8 tree8 checked8)
    _ (by norm_num) _, areaUnits8]
  norm_num

-- Frozen phase 5917, atom 2498, type 0, source (23,83).
def leavesData9 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,0⟩))) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves9 : Fin 13 → DyadicLeaf := leavesData9.get
def raw9 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 23 83 leaves9 i
def outputData9 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨5888,5952,21248,21312⟩) (.node (.single ⟨5888,5952,21312,21376⟩) (.single ⟨5952,6016,21248,21312⟩))) (.node (.single ⟨5952,6016,21312,21376⟩) (.node (.single ⟨5888,6016,21376,21504⟩) (.single ⟨6016,6080,21248,21312⟩)))) (.node (.node (.single ⟨6016,6080,21312,21376⟩) (.node (.single ⟨6080,6112,21248,21280⟩) (.single ⟨6080,6112,21280,21312⟩))) (.node (.node (.single ⟨6112,6144,21248,21280⟩) (.single ⟨6112,6144,21280,21312⟩)) (.node (.single ⟨6080,6144,21312,21376⟩) (.single ⟨6016,6144,21376,21504⟩))))) (.node (.node (.node (.single ⟨11264,11392,26624,26752⟩) (.node (.single ⟨11264,11392,26752,26880⟩) (.single ⟨11392,11456,26624,26688⟩))) (.node (.single ⟨11392,11456,26688,26752⟩) (.node (.single ⟨11456,11488,26624,26656⟩) (.single ⟨11456,11488,26656,26688⟩)))) (.node (.node (.single ⟨11488,11520,26624,26656⟩) (.node (.single ⟨11488,11520,26656,26688⟩) (.single ⟨11456,11520,26688,26752⟩))) (.node (.node (.single ⟨11392,11456,26752,26816⟩) (.single ⟨11392,11456,26816,26880⟩)) (.node (.single ⟨11456,11520,26752,26816⟩) (.single ⟨11456,11520,26816,26880⟩)))))) (.node (.node (.node (.node (.single ⟨21248,21312,5888,5952⟩) (.node (.single ⟨21248,21312,5952,6016⟩) (.single ⟨21312,21376,5888,5952⟩))) (.node (.single ⟨21312,21376,5952,6016⟩) (.node (.single ⟨21248,21312,6016,6080⟩) (.single ⟨21248,21280,6080,6112⟩)))) (.node (.node (.single ⟨21248,21280,6112,6144⟩) (.node (.single ⟨21280,21312,6080,6112⟩) (.single ⟨21280,21312,6112,6144⟩))) (.node (.node (.single ⟨21312,21376,6016,6080⟩) (.single ⟨21312,21376,6080,6144⟩)) (.node (.single ⟨21376,21504,5888,6016⟩) (.single ⟨21376,21504,6016,6144⟩))))) (.node (.node (.node (.single ⟨26624,26752,11264,11392⟩) (.node (.single ⟨26624,26688,11392,11456⟩) (.single ⟨26624,26656,11456,11488⟩))) (.node (.single ⟨26624,26656,11488,11520⟩) (.node (.single ⟨26656,26688,11456,11488⟩) (.single ⟨26656,26688,11488,11520⟩)))) (.node (.node (.single ⟨26688,26752,11392,11456⟩) (.node (.single ⟨26688,26752,11456,11520⟩) (.single ⟨26752,26880,11264,11392⟩))) (.node (.node (.single ⟨26752,26816,11392,11456⟩) (.single ⟨26752,26816,11456,11520⟩)) (.node (.single ⟨26816,26880,11392,11456⟩) (.single ⟨26816,26880,11456,11520⟩)))))))
def output9 : Fin 52 → GridBox := outputData9.get
def coverData9 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 0))) (.node (.node (.single 26) (.single 51)) (.node (.single 25) (.single 1))))) (.node (.node (.node (.single 28) (.node (.single 50) (.single 23))) (.node (.single 2) (.node (.single 27) (.single 49)))) (.node (.node (.single 24) (.node (.single 3) (.single 29))) (.node (.node (.single 48) (.single 22)) (.node (.single 5) (.single 30)))))) (.node (.node (.node (.node (.single 46) (.node (.single 21) (.single 6))) (.node (.single 35) (.node (.single 45) (.single 16)))) (.node (.node (.single 11) (.node (.single 36) (.single 40))) (.node (.node (.single 15) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData9 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.single 20) (.node (.single 0) (.single 24)))) (.node (.node (.single 28) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 35))) (.node (.single 31) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.node (.single 17) (.single 13))) (.node (.single 21) (.node (.single 25) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 34) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 30) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover9 (i : Fin 52) : Fin 52 := ⟨coverData9.get i % 52, Nat.mod_lt _ (by decide)⟩
def source9 (i : Fin 52) : Fin 52 := ⟨sourceData9.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree9 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 .empty (.cutY 21504 (.cutX 5632 .empty (.cutY 20992 .empty (.cutX 5888 .empty (.cutY 21248 .empty (.cutX 6016 (.cutY 21376 (.cutX 5952 (.cutY 21312 .full .full) (.cutY 21312 .full .full)) .full) (.cutY 21376 (.cutX 6080 (.cutY 21312 .full .full) (.cutY 21312 (.cutX 6112 (.cutY 21280 .full .full) (.cutY 21280 .full .full)) .full)) .full)))))) .empty)) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 .empty (.cutY 27648 (.cutX 11776 (.cutY 27136 (.cutX 11520 (.cutY 26880 (.cutX 11392 (.cutY 26752 .full .full) (.cutY 26752 (.cutX 11456 (.cutY 26688 .full .full) (.cutY 26688 (.cutX 11488 (.cutY 26656 .full .full) (.cutY 26656 .full .full)) .full)) (.cutX 11456 (.cutY 26816 .full .full) (.cutY 26816 .full .full)))) .empty) .empty) .empty) .empty) .empty)))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 (.cutY 5120 .empty (.cutX 20992 .empty (.cutY 5632 .empty (.cutX 21248 .empty (.cutY 5888 .empty (.cutX 21376 (.cutY 6016 (.cutX 21312 (.cutY 5952 .full .full) (.cutY 5952 .full .full)) (.cutX 21312 (.cutY 6080 .full (.cutX 21280 (.cutY 6112 .full .full) (.cutY 6112 .full .full))) (.cutY 6080 .full .full))) (.cutY 6016 .full .full))))))) .empty) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 (.cutY 11264 .empty (.cutX 27136 (.cutY 11776 (.cutX 26880 (.cutY 11520 (.cutX 26752 (.cutY 11392 .full (.cutX 26688 (.cutY 11456 .full (.cutX 26656 (.cutY 11488 .full .full) (.cutY 11488 .full .full))) (.cutY 11456 .full .full))) (.cutY 11392 .full (.cutX 26816 (.cutY 11456 .full .full) (.cutY 11456 .full .full)))) .empty) .empty) .empty) .empty)) .empty))) .empty) .empty))) .empty))

theorem metadata9 : 0<152546139 ∧ 23<128 ∧ 83<128 ∧ 0<4 ∧
    2498/4160=0 ∧ 2498%4160=2498 ∧ ∀ i, (leaves9 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData9).mp
    (by decide +kernel)

theorem sourceChecked9_0 : ∀ i : Fin 52,
    (fun i => output9 i = raw9 (source9 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked9 : ∀ i : Fin 52, (fun i => output9 i = raw9 (source9 i)) i :=
  forallFin_of_zero_offset (fun i => output9 i = raw9 (source9 i)) sourceChecked9_0

theorem coverChecked9_0 : ∀ i : Fin 52,
    (fun i => (output9 (cover9 i)).ContainsBox (raw9 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked9 : ∀ i : Fin 52, (fun i => (output9 (cover9 i)).ContainsBox (raw9 i)) i :=
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

noncomputable def phaseMass9 : ℝ := singlePhaseMass (152546139/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw9 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass9_eq : phaseMass9 = (152546139/1638400000000 : ℝ) := by
  unfold phaseMass9
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw9 output9 cover9 source9
    (gridTreeUnionCheck_sound 32768 raw9 output9 cover9 source9 tree9 checked9)
    _ (by norm_num) _, areaUnits9]
  norm_num

-- Frozen phase 5918, atom 1966, type 0, source (17,79).
def leavesData10 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves10 : Fin 7 → DyadicLeaf := leavesData10.get
def raw10 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 17 79 leaves10 i
def outputData10 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨4352,4480,20224,20352⟩) (.node (.single ⟨4352,4480,20352,20480⟩) (.single ⟨4480,4544,20224,20288⟩))) (.node (.node (.single ⟨4480,4544,20288,20352⟩) (.single ⟨4544,4608,20224,20288⟩)) (.node (.single ⟨4544,4608,20288,20352⟩) (.single ⟨4480,4608,20352,20480⟩)))) (.node (.node (.single ⟨12288,12416,28160,28288⟩) (.node (.single ⟨12288,12416,28288,28416⟩) (.single ⟨12416,12480,28160,28224⟩))) (.node (.node (.single ⟨12416,12480,28224,28288⟩) (.single ⟨12480,12544,28160,28224⟩)) (.node (.single ⟨12480,12544,28224,28288⟩) (.single ⟨12416,12544,28288,28416⟩))))) (.node (.node (.node (.single ⟨20224,20352,4352,4480⟩) (.node (.single ⟨20224,20288,4480,4544⟩) (.single ⟨20224,20288,4544,4608⟩))) (.node (.node (.single ⟨20288,20352,4480,4544⟩) (.single ⟨20288,20352,4544,4608⟩)) (.node (.single ⟨20352,20480,4352,4480⟩) (.single ⟨20352,20480,4480,4608⟩)))) (.node (.node (.single ⟨28160,28288,12288,12416⟩) (.node (.single ⟨28160,28224,12416,12480⟩) (.single ⟨28160,28224,12480,12544⟩))) (.node (.node (.single ⟨28224,28288,12416,12480⟩) (.single ⟨28224,28288,12480,12544⟩)) (.node (.single ⟨28288,28416,12288,12416⟩) (.single ⟨28288,28416,12416,12544⟩))))))
def output10 : Fin 28 → GridBox := outputData10.get
def coverData10 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData10 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover10 (i : Fin 28) : Fin 28 := ⟨coverData10.get i % 28, Nat.mod_lt _ (by decide)⟩
def source10 (i : Fin 28) : Fin 28 := ⟨sourceData10.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree10 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 .empty (.cutX 5120 (.cutY 19456 .empty (.cutX 4608 (.cutY 19968 .empty (.cutX 4352 .empty (.cutY 20224 .empty (.cutX 4480 (.cutY 20352 .full .full) (.cutY 20352 (.cutX 4544 (.cutY 20288 .full .full) (.cutY 20288 .full .full)) .full))))) .empty)) .empty)) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 .empty (.cutX 13312 (.cutY 27648 .empty (.cutX 12800 (.cutY 28160 .empty (.cutX 12544 (.cutY 28416 (.cutX 12416 (.cutY 28288 .full .full) (.cutY 28288 (.cutX 12480 (.cutY 28224 .full .full) (.cutY 28224 .full .full)) .full)) .empty) .empty)) .empty)) .empty)) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 (.cutX 19456 .empty (.cutY 5120 (.cutX 19968 .empty (.cutY 4608 (.cutX 20224 .empty (.cutY 4352 .empty (.cutX 20352 (.cutY 4480 .full (.cutX 20288 (.cutY 4544 .full .full) (.cutY 4544 .full .full))) (.cutY 4480 .full .full)))) .empty)) .empty)) .empty))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 (.cutX 27648 .empty (.cutY 13312 (.cutX 28160 .empty (.cutY 12800 (.cutX 28416 (.cutY 12544 (.cutX 28288 (.cutY 12416 .full (.cutX 28224 (.cutY 12480 .full .full) (.cutY 12480 .full .full))) (.cutY 12416 .full .full)) .empty) .empty) .empty)) .empty)) .empty))) .empty))) .empty))

theorem metadata10 : 0<147396112 ∧ 17<128 ∧ 79<128 ∧ 0<4 ∧
    1966/4160=0 ∧ 1966%4160=1966 ∧ ∀ i, (leaves10 i).Valid 8 := by
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

noncomputable def phaseMass10 : ℝ := singlePhaseMass (147396112/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw10 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass10_eq : phaseMass10 = (9212257/102400000000 : ℝ) := by
  unfold phaseMass10
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw10 output10 cover10 source10
    (gridTreeUnionCheck_sound 32768 raw10 output10 cover10 source10 tree10 checked10)
    _ (by norm_num) _, areaUnits10]
  norm_num

-- Frozen phase 5919, atom 1870, type 0, source (16,78).
def leavesData11 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,2,2⟩)))) (.node (.node (.single ⟨2,2,3⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves11 : Fin 13 → DyadicLeaf := leavesData11.get
def raw11 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 16 78 leaves11 i
def outputData11 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨4096,4224,19968,20096⟩) (.node (.single ⟨4096,4224,20096,20224⟩) (.single ⟨4224,4288,19968,20032⟩))) (.node (.single ⟨4224,4288,20032,20096⟩) (.node (.single ⟨4288,4320,19968,20000⟩) (.single ⟨4288,4320,20000,20032⟩)))) (.node (.node (.single ⟨4320,4352,19968,20000⟩) (.node (.single ⟨4320,4352,20000,20032⟩) (.single ⟨4288,4352,20032,20096⟩))) (.node (.node (.single ⟨4224,4288,20096,20160⟩) (.single ⟨4224,4288,20160,20224⟩)) (.node (.single ⟨4288,4352,20096,20160⟩) (.single ⟨4288,4352,20160,20224⟩))))) (.node (.node (.node (.single ⟨12544,12608,28416,28480⟩) (.node (.single ⟨12544,12608,28480,28544⟩) (.single ⟨12608,12672,28416,28480⟩))) (.node (.single ⟨12608,12672,28480,28544⟩) (.node (.single ⟨12544,12672,28544,28672⟩) (.single ⟨12672,12736,28416,28480⟩)))) (.node (.node (.single ⟨12672,12736,28480,28544⟩) (.node (.single ⟨12736,12768,28416,28448⟩) (.single ⟨12736,12768,28448,28480⟩))) (.node (.node (.single ⟨12768,12800,28416,28448⟩) (.single ⟨12768,12800,28448,28480⟩)) (.node (.single ⟨12736,12800,28480,28544⟩) (.single ⟨12672,12800,28544,28672⟩)))))) (.node (.node (.node (.node (.single ⟨19968,20096,4096,4224⟩) (.node (.single ⟨19968,20032,4224,4288⟩) (.single ⟨19968,20000,4288,4320⟩))) (.node (.single ⟨19968,20000,4320,4352⟩) (.node (.single ⟨20000,20032,4288,4320⟩) (.single ⟨20000,20032,4320,4352⟩)))) (.node (.node (.single ⟨20032,20096,4224,4288⟩) (.node (.single ⟨20032,20096,4288,4352⟩) (.single ⟨20096,20224,4096,4224⟩))) (.node (.node (.single ⟨20096,20160,4224,4288⟩) (.single ⟨20096,20160,4288,4352⟩)) (.node (.single ⟨20160,20224,4224,4288⟩) (.single ⟨20160,20224,4288,4352⟩))))) (.node (.node (.node (.single ⟨28416,28480,12544,12608⟩) (.node (.single ⟨28416,28480,12608,12672⟩) (.single ⟨28480,28544,12544,12608⟩))) (.node (.single ⟨28480,28544,12608,12672⟩) (.node (.single ⟨28416,28480,12672,12736⟩) (.single ⟨28416,28448,12736,12768⟩)))) (.node (.node (.single ⟨28416,28448,12768,12800⟩) (.node (.single ⟨28448,28480,12736,12768⟩) (.single ⟨28448,28480,12768,12800⟩))) (.node (.node (.single ⟨28480,28544,12672,12736⟩) (.single ⟨28480,28544,12736,12800⟩)) (.node (.single ⟨28544,28672,12544,12672⟩) (.single ⟨28544,28672,12672,12800⟩)))))))
def output11 : Fin 52 → GridBox := outputData11.get
def coverData11 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 0) (.node (.single 26) (.single 51))) (.node (.single 25) (.node (.single 1) (.single 34)))) (.node (.node (.single 50) (.node (.single 17) (.single 2))) (.node (.node (.single 27) (.single 49)) (.node (.single 24) (.single 3))))) (.node (.node (.node (.single 32) (.node (.single 48) (.single 19))) (.node (.single 8) (.node (.single 33) (.single 43)))) (.node (.node (.single 18) (.node (.single 9) (.single 35))) (.node (.node (.single 42) (.single 16)) (.node (.single 10) (.single 37)))))) (.node (.node (.node (.node (.single 41) (.node (.single 14) (.single 11))) (.node (.single 36) (.node (.single 40) (.single 15)))) (.node (.node (.single 12) (.node (.single 38) (.single 39))) (.node (.node (.single 13) (.single 4)) (.node (.single 28) (.single 47))))) (.node (.node (.node (.single 23) (.node (.single 5) (.single 30))) (.node (.single 46) (.node (.single 21) (.single 6)))) (.node (.node (.single 29) (.node (.single 45) (.single 22))) (.node (.node (.single 7) (.single 31)) (.node (.single 44) (.single 20)))))))
def sourceData11 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 8))) (.node (.single 12) (.node (.single 36) (.single 40)))) (.node (.node (.single 44) (.node (.single 48) (.single 16))) (.node (.node (.single 20) (.single 24)) (.node (.single 28) (.single 32))))) (.node (.node (.node (.single 35) (.node (.single 27) (.single 31))) (.node (.single 23) (.node (.single 7) (.single 19)))) (.node (.node (.single 15) (.node (.single 51) (.single 43))) (.node (.node (.single 47) (.single 39)) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.node (.single 9) (.single 37))) (.node (.single 45) (.node (.single 41) (.single 49)))) (.node (.node (.single 13) (.node (.single 17) (.single 5))) (.node (.node (.single 21) (.single 29)) (.node (.single 25) (.single 33))))) (.node (.node (.node (.single 34) (.node (.single 30) (.single 26))) (.node (.single 22) (.node (.single 18) (.single 50)))) (.node (.node (.single 46) (.node (.single 42) (.single 38))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))))
def cover11 (i : Fin 52) : Fin 52 := ⟨coverData11.get i % 52, Nat.mod_lt _ (by decide)⟩
def source11 (i : Fin 52) : Fin 52 := ⟨sourceData11.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree11 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 .empty (.cutX 5120 (.cutY 19456 .empty (.cutX 4608 (.cutY 19968 .empty (.cutX 4352 (.cutY 20224 (.cutX 4224 (.cutY 20096 .full .full) (.cutY 20096 (.cutX 4288 (.cutY 20032 .full .full) (.cutY 20032 (.cutX 4320 (.cutY 20000 .full .full) (.cutY 20000 .full .full)) .full)) (.cutX 4288 (.cutY 20160 .full .full) (.cutY 20160 .full .full)))) .empty) .empty)) .empty)) .empty)) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 .empty (.cutX 13312 (.cutY 27648 .empty (.cutX 12800 (.cutY 28160 .empty (.cutX 12544 .empty (.cutY 28416 .empty (.cutX 12672 (.cutY 28544 (.cutX 12608 (.cutY 28480 .full .full) (.cutY 28480 .full .full)) .full) (.cutY 28544 (.cutX 12736 (.cutY 28480 .full .full) (.cutY 28480 (.cutX 12768 (.cutY 28448 .full .full) (.cutY 28448 .full .full)) .full)) .full))))) .empty)) .empty)) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 (.cutX 19456 .empty (.cutY 5120 (.cutX 19968 .empty (.cutY 4608 (.cutX 20224 (.cutY 4352 (.cutX 20096 (.cutY 4224 .full (.cutX 20032 (.cutY 4288 .full (.cutX 20000 (.cutY 4320 .full .full) (.cutY 4320 .full .full))) (.cutY 4288 .full .full))) (.cutY 4224 .full (.cutX 20160 (.cutY 4288 .full .full) (.cutY 4288 .full .full)))) .empty) .empty) .empty)) .empty)) .empty))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 (.cutX 27648 .empty (.cutY 13312 (.cutX 28160 .empty (.cutY 12800 (.cutX 28416 .empty (.cutY 12544 .empty (.cutX 28544 (.cutY 12672 (.cutX 28480 (.cutY 12608 .full .full) (.cutY 12608 .full .full)) (.cutX 28480 (.cutY 12736 .full (.cutX 28448 (.cutY 12768 .full .full) (.cutY 12768 .full .full))) (.cutY 12736 .full .full))) (.cutY 12672 .full .full)))) .empty)) .empty)) .empty))) .empty))) .empty))

theorem metadata11 : 0<147396112 ∧ 16<128 ∧ 78<128 ∧ 0<4 ∧
    1870/4160=0 ∧ 1870%4160=1870 ∧ ∀ i, (leaves11 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData11).mp
    (by decide +kernel)

theorem sourceChecked11_0 : ∀ i : Fin 52,
    (fun i => output11 i = raw11 (source11 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked11 : ∀ i : Fin 52, (fun i => output11 i = raw11 (source11 i)) i :=
  forallFin_of_zero_offset (fun i => output11 i = raw11 (source11 i)) sourceChecked11_0

theorem coverChecked11_0 : ∀ i : Fin 52,
    (fun i => (output11 (cover11 i)).ContainsBox (raw11 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked11 : ∀ i : Fin 52, (fun i => (output11 (cover11 i)).ContainsBox (raw11 i)) i :=
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

noncomputable def phaseMass11 : ℝ := singlePhaseMass (147396112/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw11 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass11_eq : phaseMass11 = (9212257/102400000000 : ℝ) := by
  unfold phaseMass11
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw11 output11 cover11 source11
    (gridTreeUnionCheck_sound 32768 raw11 output11 cover11 source11 tree11 checked11)
    _ (by norm_num) _, areaUnits11]
  norm_num

-- Frozen phase 5920, atom 2329, type 0, source (21,82).
def leavesData12 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves12 : Fin 10 → DyadicLeaf := leavesData12.get
def raw12 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 21 82 leaves12 i
def outputData12 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨5376,5440,20992,21056⟩) (.single ⟨5376,5440,21056,21120⟩)) (.node (.single ⟨5440,5504,20992,21056⟩) (.node (.single ⟨5440,5504,21056,21120⟩) (.single ⟨5376,5504,21120,21248⟩)))) (.node (.node (.single ⟨5504,5568,20992,21056⟩) (.single ⟨5504,5568,21056,21120⟩)) (.node (.single ⟨5568,5632,20992,21056⟩) (.node (.single ⟨5568,5632,21056,21120⟩) (.single ⟨5504,5632,21120,21248⟩))))) (.node (.node (.node (.single ⟨11520,11648,27136,27264⟩) (.single ⟨11520,11648,27264,27392⟩)) (.node (.single ⟨11648,11712,27136,27200⟩) (.node (.single ⟨11648,11712,27200,27264⟩) (.single ⟨11712,11776,27136,27200⟩)))) (.node (.node (.single ⟨11712,11776,27200,27264⟩) (.single ⟨11648,11712,27264,27328⟩)) (.node (.single ⟨11648,11712,27328,27392⟩) (.node (.single ⟨11712,11776,27264,27328⟩) (.single ⟨11712,11776,27328,27392⟩)))))) (.node (.node (.node (.node (.single ⟨20992,21056,5376,5440⟩) (.single ⟨20992,21056,5440,5504⟩)) (.node (.single ⟨21056,21120,5376,5440⟩) (.node (.single ⟨21056,21120,5440,5504⟩) (.single ⟨20992,21056,5504,5568⟩)))) (.node (.node (.single ⟨20992,21056,5568,5632⟩) (.single ⟨21056,21120,5504,5568⟩)) (.node (.single ⟨21056,21120,5568,5632⟩) (.node (.single ⟨21120,21248,5376,5504⟩) (.single ⟨21120,21248,5504,5632⟩))))) (.node (.node (.node (.single ⟨27136,27264,11520,11648⟩) (.single ⟨27136,27200,11648,11712⟩)) (.node (.single ⟨27136,27200,11712,11776⟩) (.node (.single ⟨27200,27264,11648,11712⟩) (.single ⟨27200,27264,11712,11776⟩)))) (.node (.node (.single ⟨27264,27392,11520,11648⟩) (.single ⟨27264,27328,11648,11712⟩)) (.node (.single ⟨27264,27328,11712,11776⟩) (.node (.single ⟨27328,27392,11648,11712⟩) (.single ⟨27328,27392,11712,11776⟩)))))))
def output12 : Fin 40 → GridBox := outputData12.get
def coverData12 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData12 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover12 (i : Fin 40) : Fin 40 := ⟨coverData12.get i % 40, Nat.mod_lt _ (by decide)⟩
def source12 (i : Fin 40) : Fin 40 := ⟨sourceData12.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree12 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 .empty (.cutY 21504 (.cutX 5632 (.cutY 20992 .empty (.cutX 5376 .empty (.cutY 21248 (.cutX 5504 (.cutY 21120 (.cutX 5440 (.cutY 21056 .full .full) (.cutY 21056 .full .full)) .full) (.cutY 21120 (.cutX 5568 (.cutY 21056 .full .full) (.cutY 21056 .full .full)) .full)) .empty))) .empty) .empty)) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 .empty (.cutY 27648 (.cutX 11776 (.cutY 27136 .empty (.cutX 11520 .empty (.cutY 27392 (.cutX 11648 (.cutY 27264 .full .full) (.cutY 27264 (.cutX 11712 (.cutY 27200 .full .full) (.cutY 27200 .full .full)) (.cutX 11712 (.cutY 27328 .full .full) (.cutY 27328 .full .full)))) .empty))) .empty) .empty)))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 (.cutY 5120 .empty (.cutX 20992 .empty (.cutY 5632 (.cutX 21248 (.cutY 5376 .empty (.cutX 21120 (.cutY 5504 (.cutX 21056 (.cutY 5440 .full .full) (.cutY 5440 .full .full)) (.cutX 21056 (.cutY 5568 .full .full) (.cutY 5568 .full .full))) (.cutY 5504 .full .full))) .empty) .empty))) .empty) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 (.cutY 11264 .empty (.cutX 27136 .empty (.cutY 11776 (.cutX 27392 (.cutY 11520 .empty (.cutX 27264 (.cutY 11648 .full (.cutX 27200 (.cutY 11712 .full .full) (.cutY 11712 .full .full))) (.cutY 11648 .full (.cutX 27328 (.cutY 11712 .full .full) (.cutY 11712 .full .full))))) .empty) .empty))) .empty))) .empty) .empty))) .empty))

theorem metadata12 : 0<152546139 ∧ 21<128 ∧ 82<128 ∧ 0<4 ∧
    2329/4160=0 ∧ 2329%4160=2329 ∧ ∀ i, (leaves12 i).Valid 8 := by
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

noncomputable def phaseMass12 : ℝ := singlePhaseMass (152546139/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw12 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass12_eq : phaseMass12 = (152546139/1638400000000 : ℝ) := by
  unfold phaseMass12
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw12 output12 cover12 source12
    (gridTreeUnionCheck_sound 32768 raw12 output12 cover12 source12 tree12 checked12)
    _ (by norm_num) _, areaUnits12]
  norm_num

-- Frozen phase 5921, atom 6655, type 1, source (23,80).
def leavesData13 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves13 : Fin 13 → DyadicLeaf := leavesData13.get
def raw13 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 23 80 leaves13 i
def outputData13 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨5888,5952,20480,20544⟩) (.node (.single ⟨5888,5952,20544,20608⟩) (.single ⟨5952,6016,20480,20544⟩))) (.node (.single ⟨5952,6016,20544,20608⟩) (.node (.single ⟨5888,6016,20608,20736⟩) (.single ⟨6016,6080,20480,20544⟩)))) (.node (.node (.single ⟨6016,6080,20544,20608⟩) (.node (.single ⟨6080,6112,20480,20512⟩) (.single ⟨6080,6112,20512,20544⟩))) (.node (.node (.single ⟨6112,6144,20480,20512⟩) (.single ⟨6112,6144,20512,20544⟩)) (.node (.single ⟨6080,6144,20544,20608⟩) (.single ⟨6016,6144,20608,20736⟩))))) (.node (.node (.node (.single ⟨12032,12160,26624,26752⟩) (.node (.single ⟨12032,12160,26752,26880⟩) (.single ⟨12160,12224,26624,26688⟩))) (.node (.single ⟨12160,12224,26688,26752⟩) (.node (.single ⟨12224,12256,26624,26656⟩) (.single ⟨12224,12256,26656,26688⟩)))) (.node (.node (.single ⟨12256,12288,26624,26656⟩) (.node (.single ⟨12256,12288,26656,26688⟩) (.single ⟨12224,12288,26688,26752⟩))) (.node (.node (.single ⟨12160,12224,26752,26816⟩) (.single ⟨12160,12224,26816,26880⟩)) (.node (.single ⟨12224,12288,26752,26816⟩) (.single ⟨12224,12288,26816,26880⟩)))))) (.node (.node (.node (.node (.single ⟨20480,20544,5888,5952⟩) (.node (.single ⟨20480,20544,5952,6016⟩) (.single ⟨20544,20608,5888,5952⟩))) (.node (.single ⟨20544,20608,5952,6016⟩) (.node (.single ⟨20480,20544,6016,6080⟩) (.single ⟨20480,20512,6080,6112⟩)))) (.node (.node (.single ⟨20480,20512,6112,6144⟩) (.node (.single ⟨20512,20544,6080,6112⟩) (.single ⟨20512,20544,6112,6144⟩))) (.node (.node (.single ⟨20544,20608,6016,6080⟩) (.single ⟨20544,20608,6080,6144⟩)) (.node (.single ⟨20608,20736,5888,6016⟩) (.single ⟨20608,20736,6016,6144⟩))))) (.node (.node (.node (.single ⟨26624,26752,12032,12160⟩) (.node (.single ⟨26624,26688,12160,12224⟩) (.single ⟨26624,26656,12224,12256⟩))) (.node (.single ⟨26624,26656,12256,12288⟩) (.node (.single ⟨26656,26688,12224,12256⟩) (.single ⟨26656,26688,12256,12288⟩)))) (.node (.node (.single ⟨26688,26752,12160,12224⟩) (.node (.single ⟨26688,26752,12224,12288⟩) (.single ⟨26752,26880,12032,12160⟩))) (.node (.node (.single ⟨26752,26816,12160,12224⟩) (.single ⟨26752,26816,12224,12288⟩)) (.node (.single ⟨26816,26880,12160,12224⟩) (.single ⟨26816,26880,12224,12288⟩)))))))
def output13 : Fin 52 → GridBox := outputData13.get
def coverData13 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData13 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover13 (i : Fin 52) : Fin 52 := ⟨coverData13.get i % 52, Nat.mod_lt _ (by decide)⟩
def source13 (i : Fin 52) : Fin 52 := ⟨sourceData13.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree13 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 .empty (.cutY 21504 (.cutX 5632 .empty (.cutY 20992 (.cutX 5888 .empty (.cutY 20736 (.cutX 6016 (.cutY 20608 (.cutX 5952 (.cutY 20544 .full .full) (.cutY 20544 .full .full)) .full) (.cutY 20608 (.cutX 6080 (.cutY 20544 .full .full) (.cutY 20544 (.cutX 6112 (.cutY 20512 .full .full) (.cutY 20512 .full .full)) .full)) .full)) .empty)) .empty)) .empty)) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 .empty (.cutY 27648 (.cutX 11776 .empty (.cutY 27136 (.cutX 12032 .empty (.cutY 26880 (.cutX 12160 (.cutY 26752 .full .full) (.cutY 26752 (.cutX 12224 (.cutY 26688 .full .full) (.cutY 26688 (.cutX 12256 (.cutY 26656 .full .full) (.cutY 26656 .full .full)) .full)) (.cutX 12224 (.cutY 26816 .full .full) (.cutY 26816 .full .full)))) .empty)) .empty)) .empty)))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 (.cutY 5120 .empty (.cutX 20992 (.cutY 5632 .empty (.cutX 20736 (.cutY 5888 .empty (.cutX 20608 (.cutY 6016 (.cutX 20544 (.cutY 5952 .full .full) (.cutY 5952 .full .full)) (.cutX 20544 (.cutY 6080 .full (.cutX 20512 (.cutY 6112 .full .full) (.cutY 6112 .full .full))) (.cutY 6080 .full .full))) (.cutY 6016 .full .full))) .empty)) .empty)) .empty) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 (.cutY 11264 .empty (.cutX 27136 (.cutY 11776 .empty (.cutX 26880 (.cutY 12032 .empty (.cutX 26752 (.cutY 12160 .full (.cutX 26688 (.cutY 12224 .full (.cutX 26656 (.cutY 12256 .full .full) (.cutY 12256 .full .full))) (.cutY 12224 .full .full))) (.cutY 12160 .full (.cutX 26816 (.cutY 12224 .full .full) (.cutY 12224 .full .full))))) .empty)) .empty)) .empty))) .empty) .empty))) .empty))

theorem metadata13 : 0<125829407 ∧ 23<128 ∧ 80<128 ∧ 1<4 ∧
    6655/4160=1 ∧ 6655%4160=2495 ∧ ∀ i, (leaves13 i).Valid 8 := by
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

noncomputable def phaseMass13 : ℝ := singlePhaseMass (125829407/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw13 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass13_eq : phaseMass13 = (125829407/1638400000000 : ℝ) := by
  unfold phaseMass13
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw13 output13 cover13 source13
    (gridTreeUnionCheck_sound 32768 raw13 output13 cover13 source13 tree13 checked13)
    _ (by norm_num) _, areaUnits13]
  norm_num

-- Frozen phase 5922, atom 6894, type 1, source (26,82).
def leavesData14 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves14 : Fin 13 → DyadicLeaf := leavesData14.get
def raw14 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 26 82 leaves14 i
def outputData14 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨6656,6720,20992,21056⟩) (.node (.single ⟨6656,6720,21056,21120⟩) (.single ⟨6720,6784,20992,21056⟩))) (.node (.single ⟨6720,6784,21056,21120⟩) (.node (.single ⟨6656,6784,21120,21248⟩) (.single ⟨6784,6848,20992,21056⟩)))) (.node (.node (.single ⟨6784,6848,21056,21120⟩) (.node (.single ⟨6848,6880,20992,21024⟩) (.single ⟨6848,6880,21024,21056⟩))) (.node (.node (.single ⟨6880,6912,20992,21024⟩) (.single ⟨6880,6912,21024,21056⟩)) (.node (.single ⟨6848,6912,21056,21120⟩) (.single ⟨6784,6912,21120,21248⟩))))) (.node (.node (.node (.single ⟨11520,11648,25856,25984⟩) (.node (.single ⟨11520,11648,25984,26112⟩) (.single ⟨11648,11712,25856,25920⟩))) (.node (.single ⟨11648,11712,25920,25984⟩) (.node (.single ⟨11712,11744,25856,25888⟩) (.single ⟨11712,11744,25888,25920⟩)))) (.node (.node (.single ⟨11744,11776,25856,25888⟩) (.node (.single ⟨11744,11776,25888,25920⟩) (.single ⟨11712,11776,25920,25984⟩))) (.node (.node (.single ⟨11648,11712,25984,26048⟩) (.single ⟨11648,11712,26048,26112⟩)) (.node (.single ⟨11712,11776,25984,26048⟩) (.single ⟨11712,11776,26048,26112⟩)))))) (.node (.node (.node (.node (.single ⟨20992,21056,6656,6720⟩) (.node (.single ⟨20992,21056,6720,6784⟩) (.single ⟨21056,21120,6656,6720⟩))) (.node (.single ⟨21056,21120,6720,6784⟩) (.node (.single ⟨20992,21056,6784,6848⟩) (.single ⟨20992,21024,6848,6880⟩)))) (.node (.node (.single ⟨20992,21024,6880,6912⟩) (.node (.single ⟨21024,21056,6848,6880⟩) (.single ⟨21024,21056,6880,6912⟩))) (.node (.node (.single ⟨21056,21120,6784,6848⟩) (.single ⟨21056,21120,6848,6912⟩)) (.node (.single ⟨21120,21248,6656,6784⟩) (.single ⟨21120,21248,6784,6912⟩))))) (.node (.node (.node (.single ⟨25856,25984,11520,11648⟩) (.node (.single ⟨25856,25920,11648,11712⟩) (.single ⟨25856,25888,11712,11744⟩))) (.node (.single ⟨25856,25888,11744,11776⟩) (.node (.single ⟨25888,25920,11712,11744⟩) (.single ⟨25888,25920,11744,11776⟩)))) (.node (.node (.single ⟨25920,25984,11648,11712⟩) (.node (.single ⟨25920,25984,11712,11776⟩) (.single ⟨25984,26112,11520,11648⟩))) (.node (.node (.single ⟨25984,26048,11648,11712⟩) (.single ⟨25984,26048,11712,11776⟩)) (.node (.single ⟨26048,26112,11648,11712⟩) (.single ⟨26048,26112,11712,11776⟩)))))))
def output14 : Fin 52 → GridBox := outputData14.get
def coverData14 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData14 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover14 (i : Fin 52) : Fin 52 := ⟨coverData14.get i % 52, Nat.mod_lt _ (by decide)⟩
def source14 (i : Fin 52) : Fin 52 := ⟨sourceData14.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree14 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 (.cutX 7168 (.cutY 21504 (.cutX 6656 .empty (.cutY 20992 .empty (.cutX 6912 (.cutY 21248 (.cutX 6784 (.cutY 21120 (.cutX 6720 (.cutY 21056 .full .full) (.cutY 21056 .full .full)) .full) (.cutY 21120 (.cutX 6848 (.cutY 21056 .full .full) (.cutY 21056 (.cutX 6880 (.cutY 21024 .full .full) (.cutY 21024 .full .full)) .full)) .full)) .empty) .empty))) .empty) .empty) .empty)))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 (.cutX 11264 .empty (.cutY 25600 .empty (.cutX 11776 (.cutY 26112 (.cutX 11520 .empty (.cutY 25856 .empty (.cutX 11648 (.cutY 25984 .full .full) (.cutY 25984 (.cutX 11712 (.cutY 25920 .full .full) (.cutY 25920 (.cutX 11744 (.cutY 25888 .full .full) (.cutY 25888 .full .full)) .full)) (.cutX 11712 (.cutY 26048 .full .full) (.cutY 26048 .full .full)))))) .empty) .empty))) .empty)) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 .empty (.cutX 21504 (.cutY 7168 (.cutX 20992 .empty (.cutY 6656 .empty (.cutX 21248 (.cutY 6912 (.cutX 21120 (.cutY 6784 (.cutX 21056 (.cutY 6720 .full .full) (.cutY 6720 .full .full)) (.cutX 21056 (.cutY 6848 .full (.cutX 21024 (.cutY 6880 .full .full) (.cutY 6880 .full .full))) (.cutY 6848 .full .full))) (.cutY 6784 .full .full)) .empty) .empty))) .empty) .empty)) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 .empty (.cutX 25600 .empty (.cutY 11264 .empty (.cutX 26112 (.cutY 11776 (.cutX 25856 .empty (.cutY 11520 .empty (.cutX 25984 (.cutY 11648 .full (.cutX 25920 (.cutY 11712 .full (.cutX 25888 (.cutY 11744 .full .full) (.cutY 11744 .full .full))) (.cutY 11712 .full .full))) (.cutY 11648 .full (.cutX 26048 (.cutY 11712 .full .full) (.cutY 11712 .full .full)))))) .empty) .empty)))) .empty) .empty) .empty))) .empty))

theorem metadata14 : 0<144359671 ∧ 26<128 ∧ 82<128 ∧ 1<4 ∧
    6894/4160=1 ∧ 6894%4160=2734 ∧ ∀ i, (leaves14 i).Valid 8 := by
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

noncomputable def phaseMass14 : ℝ := singlePhaseMass (144359671/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw14 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass14_eq : phaseMass14 = (144359671/1638400000000 : ℝ) := by
  unfold phaseMass14
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw14 output14 cover14 source14
    (gridTreeUnionCheck_sound 32768 raw14 output14 cover14 source14 tree14 checked14)
    _ (by norm_num) _, areaUnits14]
  norm_num

-- Frozen phase 5923, atom 2737, type 0, source (26,85).
def leavesData15 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves15 : Fin 10 → DyadicLeaf := leavesData15.get
def raw15 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 26 85 leaves15 i
def outputData15 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨6656,6720,21760,21824⟩) (.single ⟨6656,6720,21824,21888⟩)) (.node (.single ⟨6720,6784,21760,21824⟩) (.node (.single ⟨6720,6784,21824,21888⟩) (.single ⟨6656,6784,21888,22016⟩)))) (.node (.node (.single ⟨6784,6848,21760,21824⟩) (.single ⟨6784,6848,21824,21888⟩)) (.node (.single ⟨6848,6912,21760,21824⟩) (.node (.single ⟨6848,6912,21824,21888⟩) (.single ⟨6784,6912,21888,22016⟩))))) (.node (.node (.node (.single ⟨10752,10880,25856,25984⟩) (.single ⟨10752,10880,25984,26112⟩)) (.node (.single ⟨10880,10944,25856,25920⟩) (.node (.single ⟨10880,10944,25920,25984⟩) (.single ⟨10944,11008,25856,25920⟩)))) (.node (.node (.single ⟨10944,11008,25920,25984⟩) (.single ⟨10880,10944,25984,26048⟩)) (.node (.single ⟨10880,10944,26048,26112⟩) (.node (.single ⟨10944,11008,25984,26048⟩) (.single ⟨10944,11008,26048,26112⟩)))))) (.node (.node (.node (.node (.single ⟨21760,21824,6656,6720⟩) (.single ⟨21760,21824,6720,6784⟩)) (.node (.single ⟨21824,21888,6656,6720⟩) (.node (.single ⟨21824,21888,6720,6784⟩) (.single ⟨21760,21824,6784,6848⟩)))) (.node (.node (.single ⟨21760,21824,6848,6912⟩) (.single ⟨21824,21888,6784,6848⟩)) (.node (.single ⟨21824,21888,6848,6912⟩) (.node (.single ⟨21888,22016,6656,6784⟩) (.single ⟨21888,22016,6784,6912⟩))))) (.node (.node (.node (.single ⟨25856,25984,10752,10880⟩) (.single ⟨25856,25920,10880,10944⟩)) (.node (.single ⟨25856,25920,10944,11008⟩) (.node (.single ⟨25920,25984,10880,10944⟩) (.single ⟨25920,25984,10944,11008⟩)))) (.node (.node (.single ⟨25984,26112,10752,10880⟩) (.single ⟨25984,26048,10880,10944⟩)) (.node (.single ⟨25984,26048,10944,11008⟩) (.node (.single ⟨26048,26112,10880,10944⟩) (.single ⟨26048,26112,10944,11008⟩)))))))
def output15 : Fin 40 → GridBox := outputData15.get
def coverData15 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData15 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover15 (i : Fin 40) : Fin 40 := ⟨coverData15.get i % 40, Nat.mod_lt _ (by decide)⟩
def source15 (i : Fin 40) : Fin 40 := ⟨sourceData15.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree15 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 (.cutX 7168 (.cutY 21504 .empty (.cutX 6656 .empty (.cutY 22016 (.cutX 6912 (.cutY 21760 .empty (.cutX 6784 (.cutY 21888 (.cutX 6720 (.cutY 21824 .full .full) (.cutY 21824 .full .full)) .full) (.cutY 21888 (.cutX 6848 (.cutY 21824 .full .full) (.cutY 21824 .full .full)) .full))) .empty) .empty))) .empty) .empty)))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 (.cutX 11264 (.cutY 25600 .empty (.cutX 10752 .empty (.cutY 26112 (.cutX 11008 (.cutY 25856 .empty (.cutX 10880 (.cutY 25984 .full .full) (.cutY 25984 (.cutX 10944 (.cutY 25920 .full .full) (.cutY 25920 .full .full)) (.cutX 10944 (.cutY 26048 .full .full) (.cutY 26048 .full .full))))) .empty) .empty))) .empty) .empty)) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 .empty (.cutX 21504 .empty (.cutY 7168 (.cutX 22016 (.cutY 6656 .empty (.cutX 21760 .empty (.cutY 6912 (.cutX 21888 (.cutY 6784 (.cutX 21824 (.cutY 6720 .full .full) (.cutY 6720 .full .full)) (.cutX 21824 (.cutY 6848 .full .full) (.cutY 6848 .full .full))) (.cutY 6784 .full .full)) .empty))) .empty) .empty))) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 .empty (.cutX 25600 .empty (.cutY 11264 (.cutX 26112 (.cutY 10752 .empty (.cutX 25856 .empty (.cutY 11008 (.cutX 25984 (.cutY 10880 .full (.cutX 25920 (.cutY 10944 .full .full) (.cutY 10944 .full .full))) (.cutY 10880 .full (.cutX 26048 (.cutY 10944 .full .full) (.cutY 10944 .full .full)))) .empty))) .empty) .empty))) .empty) .empty) .empty))) .empty))

theorem metadata15 : 0<104681033 ∧ 26<128 ∧ 85<128 ∧ 0<4 ∧
    2737/4160=0 ∧ 2737%4160=2737 ∧ ∀ i, (leaves15 i).Valid 8 := by
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

noncomputable def phaseMass15 : ℝ := singlePhaseMass (104681033/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw15 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass15_eq : phaseMass15 = (104681033/1638400000000 : ℝ) := by
  unfold phaseMass15
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw15 output15 cover15 source15
    (gridTreeUnionCheck_sound 32768 raw15 output15 cover15 source15 tree15 checked15)
    _ (by norm_num) _, areaUnits15]
  norm_num

-- Frozen phase 5924, atom 321, type 0, source (2,69).
def leavesData16 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,0⟩))) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves16 : Fin 13 → DyadicLeaf := leavesData16.get
def raw16 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 2 69 leaves16 i
def outputData16 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨512,576,17664,17728⟩) (.node (.single ⟨512,576,17728,17792⟩) (.single ⟨576,640,17664,17728⟩))) (.node (.single ⟨576,640,17728,17792⟩) (.node (.single ⟨512,640,17792,17920⟩) (.single ⟨640,704,17664,17728⟩)))) (.node (.node (.single ⟨640,704,17728,17792⟩) (.node (.single ⟨704,736,17664,17696⟩) (.single ⟨704,736,17696,17728⟩))) (.node (.node (.single ⟨736,768,17664,17696⟩) (.single ⟨736,768,17696,17728⟩)) (.node (.single ⟨704,768,17728,17792⟩) (.single ⟨640,768,17792,17920⟩))))) (.node (.node (.node (.single ⟨14848,14976,32000,32128⟩) (.node (.single ⟨14848,14976,32128,32256⟩) (.single ⟨14976,15040,32000,32064⟩))) (.node (.single ⟨14976,15040,32064,32128⟩) (.node (.single ⟨15040,15072,32000,32032⟩) (.single ⟨15040,15072,32032,32064⟩)))) (.node (.node (.single ⟨15072,15104,32000,32032⟩) (.node (.single ⟨15072,15104,32032,32064⟩) (.single ⟨15040,15104,32064,32128⟩))) (.node (.node (.single ⟨14976,15040,32128,32192⟩) (.single ⟨14976,15040,32192,32256⟩)) (.node (.single ⟨15040,15104,32128,32192⟩) (.single ⟨15040,15104,32192,32256⟩)))))) (.node (.node (.node (.node (.single ⟨17664,17728,512,576⟩) (.node (.single ⟨17664,17728,576,640⟩) (.single ⟨17728,17792,512,576⟩))) (.node (.single ⟨17728,17792,576,640⟩) (.node (.single ⟨17664,17728,640,704⟩) (.single ⟨17664,17696,704,736⟩)))) (.node (.node (.single ⟨17664,17696,736,768⟩) (.node (.single ⟨17696,17728,704,736⟩) (.single ⟨17696,17728,736,768⟩))) (.node (.node (.single ⟨17728,17792,640,704⟩) (.single ⟨17728,17792,704,768⟩)) (.node (.single ⟨17792,17920,512,640⟩) (.single ⟨17792,17920,640,768⟩))))) (.node (.node (.node (.single ⟨32000,32128,14848,14976⟩) (.node (.single ⟨32000,32064,14976,15040⟩) (.single ⟨32000,32032,15040,15072⟩))) (.node (.single ⟨32000,32032,15072,15104⟩) (.node (.single ⟨32032,32064,15040,15072⟩) (.single ⟨32032,32064,15072,15104⟩)))) (.node (.node (.single ⟨32064,32128,14976,15040⟩) (.node (.single ⟨32064,32128,15040,15104⟩) (.single ⟨32128,32256,14848,14976⟩))) (.node (.node (.single ⟨32128,32192,14976,15040⟩) (.single ⟨32128,32192,15040,15104⟩)) (.node (.single ⟨32192,32256,14976,15040⟩) (.single ⟨32192,32256,15040,15104⟩)))))))
def output16 : Fin 52 → GridBox := outputData16.get
def coverData16 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 0))) (.node (.node (.single 26) (.single 51)) (.node (.single 25) (.single 1))))) (.node (.node (.node (.single 28) (.node (.single 50) (.single 23))) (.node (.single 2) (.node (.single 27) (.single 49)))) (.node (.node (.single 24) (.node (.single 3) (.single 29))) (.node (.node (.single 48) (.single 22)) (.node (.single 5) (.single 30)))))) (.node (.node (.node (.node (.single 46) (.node (.single 21) (.single 6))) (.node (.single 35) (.node (.single 45) (.single 16)))) (.node (.node (.single 11) (.node (.single 36) (.single 40))) (.node (.node (.single 15) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData16 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.single 20) (.node (.single 0) (.single 24)))) (.node (.node (.single 28) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 35))) (.node (.single 31) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.node (.single 17) (.single 13))) (.node (.single 21) (.node (.single 25) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 34) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 30) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover16 (i : Fin 52) : Fin 52 := ⟨coverData16.get i % 52, Nat.mod_lt _ (by decide)⟩
def source16 (i : Fin 52) : Fin 52 := ⟨sourceData16.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree16 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 (.cutX 1024 (.cutY 17408 .empty (.cutX 512 .empty (.cutY 17920 (.cutX 768 (.cutY 17664 .empty (.cutX 640 (.cutY 17792 (.cutX 576 (.cutY 17728 .full .full) (.cutY 17728 .full .full)) .full) (.cutY 17792 (.cutX 704 (.cutY 17728 .full .full) (.cutY 17728 (.cutX 736 (.cutY 17696 .full .full) (.cutY 17696 .full .full)) .full)) .full))) .empty) .empty))) .empty) .empty) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 .empty (.cutX 15360 (.cutY 31744 .empty (.cutX 14848 .empty (.cutY 32256 (.cutX 15104 (.cutY 32000 .empty (.cutX 14976 (.cutY 32128 .full .full) (.cutY 32128 (.cutX 15040 (.cutY 32064 .full .full) (.cutY 32064 (.cutX 15072 (.cutY 32032 .full .full) (.cutY 32032 .full .full)) .full)) (.cutX 15040 (.cutY 32192 .full .full) (.cutY 32192 .full .full))))) .empty) .empty))) .empty)))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 (.cutX 17408 .empty (.cutY 1024 (.cutX 17920 (.cutY 512 .empty (.cutX 17664 .empty (.cutY 768 (.cutX 17792 (.cutY 640 (.cutX 17728 (.cutY 576 .full .full) (.cutY 576 .full .full)) (.cutX 17728 (.cutY 704 .full (.cutX 17696 (.cutY 736 .full .full) (.cutY 736 .full .full))) (.cutY 704 .full .full))) (.cutY 640 .full .full)) .empty))) .empty) .empty)) .empty) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 .empty (.cutX 31744 .empty (.cutY 15360 (.cutX 32256 (.cutY 14848 .empty (.cutX 32000 .empty (.cutY 15104 (.cutX 32128 (.cutY 14976 .full (.cutX 32064 (.cutY 15040 .full (.cutX 32032 (.cutY 15072 .full .full) (.cutY 15072 .full .full))) (.cutY 15040 .full .full))) (.cutY 14976 .full (.cutX 32192 (.cutY 15040 .full .full) (.cutY 15040 .full .full)))) .empty))) .empty) .empty)))))))) .empty))

theorem metadata16 : 0<114037843 ∧ 2<128 ∧ 69<128 ∧ 0<4 ∧
    321/4160=0 ∧ 321%4160=321 ∧ ∀ i, (leaves16 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData16).mp
    (by decide +kernel)

theorem sourceChecked16_0 : ∀ i : Fin 52,
    (fun i => output16 i = raw16 (source16 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked16 : ∀ i : Fin 52, (fun i => output16 i = raw16 (source16 i)) i :=
  forallFin_of_zero_offset (fun i => output16 i = raw16 (source16 i)) sourceChecked16_0

theorem coverChecked16_0 : ∀ i : Fin 52,
    (fun i => (output16 (cover16 i)).ContainsBox (raw16 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked16 : ∀ i : Fin 52, (fun i => (output16 (cover16 i)).ContainsBox (raw16 i)) i :=
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

noncomputable def phaseMass16 : ℝ := singlePhaseMass (114037843/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw16 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass16_eq : phaseMass16 = (114037843/1638400000000 : ℝ) := by
  unfold phaseMass16
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw16 output16 cover16 source16
    (gridTreeUnionCheck_sound 32768 raw16 output16 cover16 source16 tree16 checked16)
    _ (by norm_num) _, areaUnits16]
  norm_num

-- Frozen phase 5925, atom 685, type 0, source (5,70).
def leavesData17 : FiniteInputTree DyadicLeaf 31 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,1⟩) (.single ⟨2,2,2⟩)))) (.node (.node (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,2⟩)) (.node (.single ⟨2,3,3⟩) (.single ⟨3,4,0⟩))) (.node (.node (.single ⟨3,4,1⟩) (.single ⟨3,5,0⟩)) (.node (.single ⟨3,5,1⟩) (.single ⟨3,6,1⟩))))) (.node (.node (.node (.node (.single ⟨3,7,1⟩) (.single ⟨3,2,0⟩)) (.node (.single ⟨3,2,1⟩) (.single ⟨3,3,0⟩))) (.node (.node (.single ⟨3,3,1⟩) (.single ⟨4,12,0⟩)) (.node (.single ⟨4,12,1⟩) (.single ⟨4,13,0⟩)))) (.node (.node (.node (.single ⟨4,13,1⟩) (.single ⟨4,14,0⟩)) (.node (.single ⟨4,14,1⟩) (.single ⟨4,15,1⟩))) (.node (.node (.single ⟨5,30,0⟩) (.single ⟨5,30,1⟩)) (.node (.single ⟨5,31,0⟩) (.single ⟨5,31,1⟩))))))
def leaves17 : Fin 31 → DyadicLeaf := leavesData17.get
def raw17 (i : Fin 124) : GridBox := phaseImageBoxes 32768 8 5 70 leaves17 i
def outputData17 : FiniteInputTree GridBox 124 := (.node (.node (.node (.node (.node (.node (.single ⟨1280,1344,17920,17984⟩) (.node (.single ⟨1280,1344,17984,18048⟩) (.single ⟨1344,1376,17920,17952⟩))) (.node (.node (.single ⟨1344,1376,17952,17984⟩) (.single ⟨1376,1408,17920,17952⟩)) (.node (.single ⟨1376,1408,17952,17984⟩) (.single ⟨1344,1408,17984,18048⟩)))) (.node (.node (.node (.single ⟨1280,1408,18048,18176⟩) (.single ⟨1408,1440,17920,17952⟩)) (.node (.single ⟨1408,1440,17952,17984⟩) (.single ⟨1440,1472,17920,17952⟩))) (.node (.node (.single ⟨1440,1472,17952,17984⟩) (.single ⟨1408,1472,17984,18048⟩)) (.node (.single ⟨1472,1488,17920,17936⟩) (.single ⟨1472,1488,17936,17952⟩))))) (.node (.node (.node (.node (.single ⟨1488,1504,17920,17936⟩) (.single ⟨1488,1504,17936,17952⟩)) (.node (.single ⟨1472,1504,17952,17984⟩) (.single ⟨1504,1520,17920,17936⟩))) (.node (.node (.single ⟨1504,1520,17936,17952⟩) (.single ⟨1520,1528,17920,17928⟩)) (.node (.single ⟨1520,1528,17928,17936⟩) (.single ⟨1528,1536,17920,17928⟩)))) (.node (.node (.node (.single ⟨1528,1536,17928,17936⟩) (.single ⟨1520,1536,17936,17952⟩)) (.node (.single ⟨1504,1536,17952,17984⟩) (.single ⟨1472,1536,17984,18048⟩))) (.node (.node (.single ⟨1408,1472,18048,18112⟩) (.single ⟨1408,1472,18112,18176⟩)) (.node (.single ⟨1472,1536,18048,18112⟩) (.single ⟨1472,1536,18112,18176⟩)))))) (.node (.node (.node (.node (.single ⟨14592,14656,31232,31296⟩) (.node (.single ⟨14592,14656,31296,31360⟩) (.single ⟨14656,14720,31232,31296⟩))) (.node (.node (.single ⟨14656,14720,31296,31360⟩) (.single ⟨14592,14720,31360,31488⟩)) (.node (.single ⟨14720,14784,31232,31296⟩) (.single ⟨14720,14784,31296,31360⟩)))) (.node (.node (.node (.single ⟨14784,14816,31232,31264⟩) (.single ⟨14784,14816,31264,31296⟩)) (.node (.single ⟨14816,14832,31232,31248⟩) (.single ⟨14816,14832,31248,31264⟩))) (.node (.node (.single ⟨14832,14840,31232,31240⟩) (.single ⟨14832,14840,31240,31248⟩)) (.node (.single ⟨14840,14848,31232,31240⟩) (.single ⟨14840,14848,31240,31248⟩))))) (.node (.node (.node (.node (.single ⟨14832,14848,31248,31264⟩) (.single ⟨14816,14832,31264,31280⟩)) (.node (.single ⟨14816,14832,31280,31296⟩) (.single ⟨14832,14848,31264,31280⟩))) (.node (.node (.single ⟨14832,14848,31280,31296⟩) (.single ⟨14784,14816,31296,31328⟩)) (.node (.single ⟨14784,14816,31328,31360⟩) (.single ⟨14816,14848,31296,31328⟩)))) (.node (.node (.node (.single ⟨14816,14848,31328,31360⟩) (.single ⟨14720,14784,31360,31424⟩)) (.node (.single ⟨14720,14784,31424,31488⟩) (.single ⟨14784,14816,31360,31392⟩))) (.node (.node (.single ⟨14784,14816,31392,31424⟩) (.single ⟨14816,14848,31360,31392⟩)) (.node (.single ⟨14816,14848,31392,31424⟩) (.single ⟨14784,14848,31424,31488⟩))))))) (.node (.node (.node (.node (.node (.single ⟨17920,17984,1280,1344⟩) (.node (.single ⟨17920,17952,1344,1376⟩) (.single ⟨17920,17952,1376,1408⟩))) (.node (.node (.single ⟨17952,17984,1344,1376⟩) (.single ⟨17952,17984,1376,1408⟩)) (.node (.single ⟨17984,18048,1280,1344⟩) (.single ⟨17984,18048,1344,1408⟩)))) (.node (.node (.node (.single ⟨17920,17952,1408,1440⟩) (.single ⟨17920,17952,1440,1472⟩)) (.node (.single ⟨17952,17984,1408,1440⟩) (.single ⟨17952,17984,1440,1472⟩))) (.node (.node (.single ⟨17920,17936,1472,1488⟩) (.single ⟨17920,17936,1488,1504⟩)) (.node (.single ⟨17936,17952,1472,1488⟩) (.single ⟨17936,17952,1488,1504⟩))))) (.node (.node (.node (.node (.single ⟨17920,17936,1504,1520⟩) (.single ⟨17920,17928,1520,1528⟩)) (.node (.single ⟨17920,17928,1528,1536⟩) (.single ⟨17928,17936,1520,1528⟩))) (.node (.node (.single ⟨17928,17936,1528,1536⟩) (.single ⟨17936,17952,1504,1520⟩)) (.node (.single ⟨17936,17952,1520,1536⟩) (.single ⟨17952,17984,1472,1504⟩)))) (.node (.node (.node (.single ⟨17952,17984,1504,1536⟩) (.single ⟨17984,18048,1408,1472⟩)) (.node (.single ⟨17984,18048,1472,1536⟩) (.single ⟨18048,18176,1280,1408⟩))) (.node (.node (.single ⟨18048,18112,1408,1472⟩) (.single ⟨18048,18112,1472,1536⟩)) (.node (.single ⟨18112,18176,1408,1472⟩) (.single ⟨18112,18176,1472,1536⟩)))))) (.node (.node (.node (.node (.single ⟨31232,31296,14592,14656⟩) (.node (.single ⟨31232,31296,14656,14720⟩) (.single ⟨31296,31360,14592,14656⟩))) (.node (.node (.single ⟨31296,31360,14656,14720⟩) (.single ⟨31232,31296,14720,14784⟩)) (.node (.single ⟨31232,31264,14784,14816⟩) (.single ⟨31232,31248,14816,14832⟩)))) (.node (.node (.node (.single ⟨31232,31240,14832,14840⟩) (.single ⟨31232,31240,14840,14848⟩)) (.node (.single ⟨31240,31248,14832,14840⟩) (.single ⟨31240,31248,14840,14848⟩))) (.node (.node (.single ⟨31248,31264,14816,14832⟩) (.single ⟨31248,31264,14832,14848⟩)) (.node (.single ⟨31264,31296,14784,14816⟩) (.single ⟨31264,31280,14816,14832⟩))))) (.node (.node (.node (.node (.single ⟨31264,31280,14832,14848⟩) (.single ⟨31280,31296,14816,14832⟩)) (.node (.single ⟨31280,31296,14832,14848⟩) (.single ⟨31296,31360,14720,14784⟩))) (.node (.node (.single ⟨31296,31328,14784,14816⟩) (.single ⟨31296,31328,14816,14848⟩)) (.node (.single ⟨31328,31360,14784,14816⟩) (.single ⟨31328,31360,14816,14848⟩)))) (.node (.node (.node (.single ⟨31360,31488,14592,14720⟩) (.single ⟨31360,31424,14720,14784⟩)) (.node (.single ⟨31360,31392,14784,14816⟩) (.single ⟨31360,31392,14816,14848⟩))) (.node (.node (.single ⟨31392,31424,14784,14816⟩) (.single ⟨31392,31424,14816,14848⟩)) (.node (.single ⟨31424,31488,14720,14784⟩) (.single ⟨31424,31488,14784,14848⟩))))))))
def output17 : Fin 124 → GridBox := outputData17.get
def coverData17 : FiniteInputTree ℕ 124 := (.node (.node (.node (.node (.node (.node (.single 7) (.node (.single 88) (.single 116))) (.node (.node (.single 35) (.single 0)) (.node (.single 62) (.single 123)))) (.node (.node (.node (.single 61) (.single 1)) (.node (.single 67) (.single 122))) (.node (.node (.single 56) (.single 6)) (.node (.single 68) (.single 117))))) (.node (.node (.node (.node (.single 55) (.single 12)) (.node (.single 86) (.single 111))) (.node (.node (.single 37) (.single 26)) (.node (.single 87) (.single 97)))) (.node (.node (.node (.single 36) (.single 27)) (.node (.single 89) (.single 96))) (.node (.node (.single 34) (.single 28)) (.node (.single 91) (.single 95)))))) (.node (.node (.node (.node (.single 32) (.node (.single 29) (.single 90))) (.node (.node (.single 94) (.single 33)) (.node (.single 30) (.single 92)))) (.node (.node (.node (.single 93) (.single 31)) (.node (.single 8) (.single 69))) (.node (.node (.single 115) (.single 54)) (.node (.single 9) (.single 71))))) (.node (.node (.node (.node (.single 114) (.single 52)) (.node (.single 10) (.single 70))) (.node (.node (.single 113) (.single 53)) (.node (.single 11) (.single 72)))) (.node (.node (.node (.single 112) (.single 51)) (.node (.single 17) (.single 84))) (.node (.node (.single 106) (.single 39)) (.node (.single 25) (.single 85))))))) (.node (.node (.node (.node (.node (.single 98) (.node (.single 38) (.single 2))) (.node (.node (.single 63) (.single 121)) (.node (.single 60) (.single 3)))) (.node (.node (.node (.single 65) (.single 120)) (.node (.single 58) (.single 4))) (.node (.node (.single 64) (.single 119)) (.node (.single 59) (.single 5))))) (.node (.node (.node (.node (.single 66) (.single 118)) (.node (.single 57) (.single 13))) (.node (.node (.single 73) (.single 110)) (.node (.single 50) (.single 14)))) (.node (.node (.node (.single 75) (.single 109)) (.node (.single 48) (.single 15))) (.node (.node (.single 74) (.single 108)) (.node (.single 49) (.single 16)))))) (.node (.node (.node (.node (.single 76) (.node (.single 107) (.single 47))) (.node (.node (.single 18) (.single 77)) (.node (.single 105) (.single 46)))) (.node (.node (.node (.single 19) (.single 82)) (.node (.single 104) (.single 41))) (.node (.node (.single 24) (.single 83)) (.node (.single 99) (.single 40))))) (.node (.node (.node (.node (.single 20) (.single 78)) (.node (.single 103) (.single 45))) (.node (.node (.single 21) (.single 80)) (.node (.single 102) (.single 43)))) (.node (.node (.node (.single 22) (.single 79)) (.node (.single 101) (.single 44))) (.node (.node (.single 23) (.single 81)) (.node (.single 100) (.single 42))))))))
def sourceData17 : FiniteInputTree ℕ 124 := (.node (.node (.node (.node (.node (.node (.single 4) (.node (.single 8) (.single 64))) (.node (.node (.single 68) (.single 72)) (.node (.single 76) (.single 12)))) (.node (.node (.node (.single 0) (.single 40)) (.node (.single 44) (.single 48))) (.node (.node (.single 52) (.single 16)) (.node (.single 80) (.single 84))))) (.node (.node (.node (.node (.single 88) (.single 92)) (.node (.single 56) (.single 96))) (.node (.node (.single 100) (.single 108)) (.node (.single 112) (.single 116)))) (.node (.node (.node (.single 120) (.single 104)) (.node (.single 60) (.single 20))) (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.single 36)))))) (.node (.node (.node (.node (.single 39) (.node (.single 31) (.single 35))) (.node (.node (.single 27) (.single 3)) (.node (.single 23) (.single 19)))) (.node (.node (.node (.single 63) (.single 59)) (.node (.single 107) (.single 103))) (.node (.node (.single 123) (.single 115)) (.node (.single 119) (.single 111))))) (.node (.node (.node (.node (.single 99) (.single 95)) (.node (.single 87) (.single 91))) (.node (.node (.single 83) (.single 55)) (.node (.single 47) (.single 51)))) (.node (.node (.node (.single 43) (.single 15)) (.node (.single 11) (.single 79))) (.node (.node (.single 71) (.single 75)) (.node (.single 67) (.single 7))))))) (.node (.node (.node (.node (.node (.single 5) (.node (.single 65) (.single 73))) (.node (.node (.single 69) (.single 77)) (.node (.single 9) (.single 13)))) (.node (.node (.node (.single 41) (.single 49)) (.node (.single 45) (.single 53))) (.node (.node (.single 81) (.single 89)) (.node (.single 85) (.single 93))))) (.node (.node (.node (.node (.single 97) (.single 109)) (.node (.single 117) (.single 113))) (.node (.node (.single 121) (.single 101)) (.node (.single 105) (.single 57)))) (.node (.node (.node (.single 61) (.single 17)) (.node (.single 21) (.single 1))) (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.single 37)))))) (.node (.node (.node (.node (.single 38) (.node (.single 34) (.single 30))) (.node (.node (.single 26) (.single 22)) (.node (.single 62) (.single 106)))) (.node (.node (.node (.single 122) (.single 118)) (.node (.single 114) (.single 110))) (.node (.node (.single 102) (.single 98)) (.node (.single 58) (.single 94))))) (.node (.node (.node (.node (.single 90) (.single 86)) (.node (.single 82) (.single 18))) (.node (.node (.single 54) (.single 50)) (.node (.single 46) (.single 42)))) (.node (.node (.node (.single 2) (.single 14)) (.node (.single 78) (.single 74))) (.node (.node (.single 70) (.single 66)) (.node (.single 10) (.single 6))))))))
def cover17 (i : Fin 124) : Fin 124 := ⟨coverData17.get i % 124, Nat.mod_lt _ (by decide)⟩
def source17 (i : Fin 124) : Fin 124 := ⟨sourceData17.get i % 124, Nat.mod_lt _ (by decide)⟩
def tree17 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 (.cutX 1024 .empty (.cutY 17408 .empty (.cutX 1536 (.cutY 17920 .empty (.cutX 1280 .empty (.cutY 18176 (.cutX 1408 (.cutY 18048 (.cutX 1344 (.cutY 17984 .full .full) (.cutY 17984 (.cutX 1376 (.cutY 17952 .full .full) (.cutY 17952 .full .full)) .full)) .full) (.cutY 18048 (.cutX 1472 (.cutY 17984 (.cutX 1440 (.cutY 17952 .full .full) (.cutY 17952 .full .full)) .full) (.cutY 17984 (.cutX 1504 (.cutY 17952 (.cutX 1488 (.cutY 17936 .full .full) (.cutY 17936 .full .full)) .full) (.cutY 17952 (.cutX 1520 (.cutY 17936 .full .full) (.cutY 17936 (.cutX 1528 (.cutY 17928 .full .full) (.cutY 17928 .full .full)) .full)) .full)) .full)) (.cutX 1472 (.cutY 18112 .full .full) (.cutY 18112 .full .full)))) .empty))) .empty))) .empty) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 .empty (.cutX 15360 (.cutY 31744 (.cutX 14848 (.cutY 31232 .empty (.cutX 14592 .empty (.cutY 31488 (.cutX 14720 (.cutY 31360 (.cutX 14656 (.cutY 31296 .full .full) (.cutY 31296 .full .full)) .full) (.cutY 31360 (.cutX 14784 (.cutY 31296 .full .full) (.cutY 31296 (.cutX 14816 (.cutY 31264 .full .full) (.cutY 31264 (.cutX 14832 (.cutY 31248 .full .full) (.cutY 31248 (.cutX 14840 (.cutY 31240 .full .full) (.cutY 31240 .full .full)) .full)) (.cutX 14832 (.cutY 31280 .full .full) (.cutY 31280 .full .full)))) (.cutX 14816 (.cutY 31328 .full .full) (.cutY 31328 .full .full)))) (.cutX 14784 (.cutY 31424 .full .full) (.cutY 31424 (.cutX 14816 (.cutY 31392 .full .full) (.cutY 31392 .full .full)) .full)))) .empty))) .empty) .empty) .empty)))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 (.cutX 17408 .empty (.cutY 1024 .empty (.cutX 17920 .empty (.cutY 1536 (.cutX 18176 (.cutY 1280 .empty (.cutX 18048 (.cutY 1408 (.cutX 17984 (.cutY 1344 .full (.cutX 17952 (.cutY 1376 .full .full) (.cutY 1376 .full .full))) (.cutY 1344 .full .full)) (.cutX 17984 (.cutY 1472 (.cutX 17952 (.cutY 1440 .full .full) (.cutY 1440 .full .full)) (.cutX 17952 (.cutY 1504 (.cutX 17936 (.cutY 1488 .full .full) (.cutY 1488 .full .full)) (.cutX 17936 (.cutY 1520 .full (.cutX 17928 (.cutY 1528 .full .full) (.cutY 1528 .full .full))) (.cutY 1520 .full .full))) (.cutY 1504 .full .full))) (.cutY 1472 .full .full))) (.cutY 1408 .full (.cutX 18112 (.cutY 1472 .full .full) (.cutY 1472 .full .full))))) .empty) .empty)))) .empty) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 .empty (.cutX 31744 (.cutY 15360 (.cutX 31232 .empty (.cutY 14848 (.cutX 31488 (.cutY 14592 .empty (.cutX 31360 (.cutY 14720 (.cutX 31296 (.cutY 14656 .full .full) (.cutY 14656 .full .full)) (.cutX 31296 (.cutY 14784 .full (.cutX 31264 (.cutY 14816 .full (.cutX 31248 (.cutY 14832 .full (.cutX 31240 (.cutY 14840 .full .full) (.cutY 14840 .full .full))) (.cutY 14832 .full .full))) (.cutY 14816 .full (.cutX 31280 (.cutY 14832 .full .full) (.cutY 14832 .full .full))))) (.cutY 14784 .full (.cutX 31328 (.cutY 14816 .full .full) (.cutY 14816 .full .full))))) (.cutY 14720 .full (.cutX 31424 (.cutY 14784 .full (.cutX 31392 (.cutY 14816 .full .full) (.cutY 14816 .full .full))) (.cutY 14784 .full .full))))) .empty) .empty)) .empty) .empty))))))) .empty))

theorem metadata17 : 0<114037843 ∧ 5<128 ∧ 70<128 ∧ 0<4 ∧
    685/4160=0 ∧ 685%4160=685 ∧ ∀ i, (leaves17 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData17).mp
    (by decide +kernel)

theorem sourceChecked17_0 : ∀ i : Fin 64,
    (fun i => output17 i = raw17 (source17 i)) (finOffset 124 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked17_64 : ∀ i : Fin 60,
    (fun i => output17 i = raw17 (source17 i)) (finOffset 124 64 60 (by decide) i) := by decide +kernel

theorem sourceChecked17 : ∀ i : Fin 124, (fun i => output17 i = raw17 (source17 i)) i :=
  forallFin_of_zero_offset (fun i => output17 i = raw17 (source17 i)) (forallFinOffset_add (fun i => output17 i = raw17 (source17 i)) 0 64 60 (by decide) sourceChecked17_0
    sourceChecked17_64)

theorem coverChecked17_0 : ∀ i : Fin 64,
    (fun i => (output17 (cover17 i)).ContainsBox (raw17 i)) (finOffset 124 0 64 (by decide) i) := by decide +kernel

theorem coverChecked17_64 : ∀ i : Fin 60,
    (fun i => (output17 (cover17 i)).ContainsBox (raw17 i)) (finOffset 124 64 60 (by decide) i) := by decide +kernel

theorem coverChecked17 : ∀ i : Fin 124, (fun i => (output17 (cover17 i)).ContainsBox (raw17 i)) i :=
  forallFin_of_zero_offset (fun i => (output17 (cover17 i)).ContainsBox (raw17 i)) (forallFinOffset_add (fun i => (output17 (cover17 i)).ContainsBox (raw17 i)) 0 64 60 (by decide) coverChecked17_0
    coverChecked17_64)

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

noncomputable def phaseMass17 : ℝ := singlePhaseMass (114037843/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw17 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass17_eq : phaseMass17 = (114037843/1638400000000 : ℝ) := by
  unfold phaseMass17
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw17 output17 cover17 source17
    (gridTreeUnionCheck_sound 32768 raw17 output17 cover17 source17 tree17 checked17)
    _ (by norm_num) _, areaUnits17]
  norm_num

-- Frozen phase 5926, atom 4961, type 1, source (6,69).
def leavesData18 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,0⟩))) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves18 : Fin 13 → DyadicLeaf := leavesData18.get
def raw18 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 6 69 leaves18 i
def outputData18 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨1536,1600,17664,17728⟩) (.node (.single ⟨1536,1600,17728,17792⟩) (.single ⟨1600,1664,17664,17728⟩))) (.node (.single ⟨1600,1664,17728,17792⟩) (.node (.single ⟨1536,1664,17792,17920⟩) (.single ⟨1664,1728,17664,17728⟩)))) (.node (.node (.single ⟨1664,1728,17728,17792⟩) (.node (.single ⟨1728,1760,17664,17696⟩) (.single ⟨1728,1760,17696,17728⟩))) (.node (.node (.single ⟨1760,1792,17664,17696⟩) (.single ⟨1760,1792,17696,17728⟩)) (.node (.single ⟨1728,1792,17728,17792⟩) (.single ⟨1664,1792,17792,17920⟩))))) (.node (.node (.node (.single ⟨14848,14976,30976,31104⟩) (.node (.single ⟨14848,14976,31104,31232⟩) (.single ⟨14976,15040,30976,31040⟩))) (.node (.single ⟨14976,15040,31040,31104⟩) (.node (.single ⟨15040,15072,30976,31008⟩) (.single ⟨15040,15072,31008,31040⟩)))) (.node (.node (.single ⟨15072,15104,30976,31008⟩) (.node (.single ⟨15072,15104,31008,31040⟩) (.single ⟨15040,15104,31040,31104⟩))) (.node (.node (.single ⟨14976,15040,31104,31168⟩) (.single ⟨14976,15040,31168,31232⟩)) (.node (.single ⟨15040,15104,31104,31168⟩) (.single ⟨15040,15104,31168,31232⟩)))))) (.node (.node (.node (.node (.single ⟨17664,17728,1536,1600⟩) (.node (.single ⟨17664,17728,1600,1664⟩) (.single ⟨17728,17792,1536,1600⟩))) (.node (.single ⟨17728,17792,1600,1664⟩) (.node (.single ⟨17664,17728,1664,1728⟩) (.single ⟨17664,17696,1728,1760⟩)))) (.node (.node (.single ⟨17664,17696,1760,1792⟩) (.node (.single ⟨17696,17728,1728,1760⟩) (.single ⟨17696,17728,1760,1792⟩))) (.node (.node (.single ⟨17728,17792,1664,1728⟩) (.single ⟨17728,17792,1728,1792⟩)) (.node (.single ⟨17792,17920,1536,1664⟩) (.single ⟨17792,17920,1664,1792⟩))))) (.node (.node (.node (.single ⟨30976,31104,14848,14976⟩) (.node (.single ⟨30976,31040,14976,15040⟩) (.single ⟨30976,31008,15040,15072⟩))) (.node (.single ⟨30976,31008,15072,15104⟩) (.node (.single ⟨31008,31040,15040,15072⟩) (.single ⟨31008,31040,15072,15104⟩)))) (.node (.node (.single ⟨31040,31104,14976,15040⟩) (.node (.single ⟨31040,31104,15040,15104⟩) (.single ⟨31104,31232,14848,14976⟩))) (.node (.node (.single ⟨31104,31168,14976,15040⟩) (.single ⟨31104,31168,15040,15104⟩)) (.node (.single ⟨31168,31232,14976,15040⟩) (.single ⟨31168,31232,15040,15104⟩)))))))
def output18 : Fin 52 → GridBox := outputData18.get
def coverData18 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 0))) (.node (.node (.single 26) (.single 51)) (.node (.single 25) (.single 1))))) (.node (.node (.node (.single 28) (.node (.single 50) (.single 23))) (.node (.single 2) (.node (.single 27) (.single 49)))) (.node (.node (.single 24) (.node (.single 3) (.single 29))) (.node (.node (.single 48) (.single 22)) (.node (.single 5) (.single 30)))))) (.node (.node (.node (.node (.single 46) (.node (.single 21) (.single 6))) (.node (.single 35) (.node (.single 45) (.single 16)))) (.node (.node (.single 11) (.node (.single 36) (.single 40))) (.node (.node (.single 15) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData18 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.single 20) (.node (.single 0) (.single 24)))) (.node (.node (.single 28) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 35))) (.node (.single 31) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.node (.single 17) (.single 13))) (.node (.single 21) (.node (.single 25) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 34) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 30) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover18 (i : Fin 52) : Fin 52 := ⟨coverData18.get i % 52, Nat.mod_lt _ (by decide)⟩
def source18 (i : Fin 52) : Fin 52 := ⟨sourceData18.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree18 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 (.cutX 1024 .empty (.cutY 17408 .empty (.cutX 1536 .empty (.cutY 17920 (.cutX 1792 (.cutY 17664 .empty (.cutX 1664 (.cutY 17792 (.cutX 1600 (.cutY 17728 .full .full) (.cutY 17728 .full .full)) .full) (.cutY 17792 (.cutX 1728 (.cutY 17728 .full .full) (.cutY 17728 (.cutX 1760 (.cutY 17696 .full .full) (.cutY 17696 .full .full)) .full)) .full))) .empty) .empty)))) .empty) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 .empty (.cutX 15360 (.cutY 31744 (.cutX 14848 .empty (.cutY 31232 (.cutX 15104 (.cutY 30976 .empty (.cutX 14976 (.cutY 31104 .full .full) (.cutY 31104 (.cutX 15040 (.cutY 31040 .full .full) (.cutY 31040 (.cutX 15072 (.cutY 31008 .full .full) (.cutY 31008 .full .full)) .full)) (.cutX 15040 (.cutY 31168 .full .full) (.cutY 31168 .full .full))))) .empty) .empty)) .empty) .empty)))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 (.cutX 17408 .empty (.cutY 1024 .empty (.cutX 17920 (.cutY 1536 .empty (.cutX 17664 .empty (.cutY 1792 (.cutX 17792 (.cutY 1664 (.cutX 17728 (.cutY 1600 .full .full) (.cutY 1600 .full .full)) (.cutX 17728 (.cutY 1728 .full (.cutX 17696 (.cutY 1760 .full .full) (.cutY 1760 .full .full))) (.cutY 1728 .full .full))) (.cutY 1664 .full .full)) .empty))) .empty))) .empty) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 .empty (.cutX 31744 (.cutY 15360 (.cutX 31232 (.cutY 14848 .empty (.cutX 30976 .empty (.cutY 15104 (.cutX 31104 (.cutY 14976 .full (.cutX 31040 (.cutY 15040 .full (.cutX 31008 (.cutY 15072 .full .full) (.cutY 15072 .full .full))) (.cutY 15040 .full .full))) (.cutY 14976 .full (.cutX 31168 (.cutY 15040 .full .full) (.cutY 15040 .full .full)))) .empty))) .empty) .empty) .empty))))))) .empty))

theorem metadata18 : 0<202148459 ∧ 6<128 ∧ 69<128 ∧ 1<4 ∧
    4961/4160=1 ∧ 4961%4160=801 ∧ ∀ i, (leaves18 i).Valid 8 := by
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

noncomputable def phaseMass18 : ℝ := singlePhaseMass (202148459/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw18 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass18_eq : phaseMass18 = (202148459/1638400000000 : ℝ) := by
  unfold phaseMass18
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw18 output18 cover18 source18
    (gridTreeUnionCheck_sound 32768 raw18 output18 cover18 source18 tree18 checked18)
    _ (by norm_num) _, areaUnits18]
  norm_num

-- Frozen phase 5927, atom 1466, type 0, source (12,74).
def leavesData19 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves19 : Fin 7 → DyadicLeaf := leavesData19.get
def raw19 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 12 74 leaves19 i
def outputData19 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3072,3200,18944,19072⟩) (.node (.single ⟨3072,3200,19072,19200⟩) (.single ⟨3200,3264,18944,19008⟩))) (.node (.node (.single ⟨3200,3264,19008,19072⟩) (.single ⟨3264,3328,18944,19008⟩)) (.node (.single ⟨3264,3328,19008,19072⟩) (.single ⟨3200,3328,19072,19200⟩)))) (.node (.node (.single ⟨13568,13696,29440,29568⟩) (.node (.single ⟨13568,13696,29568,29696⟩) (.single ⟨13696,13760,29440,29504⟩))) (.node (.node (.single ⟨13696,13760,29504,29568⟩) (.single ⟨13760,13824,29440,29504⟩)) (.node (.single ⟨13760,13824,29504,29568⟩) (.single ⟨13696,13824,29568,29696⟩))))) (.node (.node (.node (.single ⟨18944,19072,3072,3200⟩) (.node (.single ⟨18944,19008,3200,3264⟩) (.single ⟨18944,19008,3264,3328⟩))) (.node (.node (.single ⟨19008,19072,3200,3264⟩) (.single ⟨19008,19072,3264,3328⟩)) (.node (.single ⟨19072,19200,3072,3200⟩) (.single ⟨19072,19200,3200,3328⟩)))) (.node (.node (.single ⟨29440,29568,13568,13696⟩) (.node (.single ⟨29440,29504,13696,13760⟩) (.single ⟨29440,29504,13760,13824⟩))) (.node (.node (.single ⟨29504,29568,13696,13760⟩) (.single ⟨29504,29568,13760,13824⟩)) (.node (.single ⟨29568,29696,13568,13696⟩) (.single ⟨29568,29696,13696,13824⟩))))))
def output19 : Fin 28 → GridBox := outputData19.get
def coverData19 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData19 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover19 (i : Fin 28) : Fin 28 := ⟨coverData19.get i % 28, Nat.mod_lt _ (by decide)⟩
def source19 (i : Fin 28) : Fin 28 := ⟨sourceData19.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree19 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 .empty (.cutY 19456 (.cutX 3584 (.cutY 18944 .empty (.cutX 3328 (.cutY 19200 (.cutX 3200 (.cutY 19072 .full .full) (.cutY 19072 (.cutX 3264 (.cutY 19008 .full .full) (.cutY 19008 .full .full)) .full)) .empty) .empty)) .empty) .empty)))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 .empty (.cutY 29696 (.cutX 13824 (.cutY 29184 .empty (.cutX 13568 .empty (.cutY 29440 .empty (.cutX 13696 (.cutY 29568 .full .full) (.cutY 29568 (.cutX 13760 (.cutY 29504 .full .full) (.cutY 29504 .full .full)) .full))))) .empty) .empty)) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 (.cutY 3072 .empty (.cutX 18944 .empty (.cutY 3584 (.cutX 19200 (.cutY 3328 (.cutX 19072 (.cutY 3200 .full (.cutX 19008 (.cutY 3264 .full .full) (.cutY 3264 .full .full))) (.cutY 3200 .full .full)) .empty) .empty) .empty))) .empty))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 (.cutY 13312 .empty (.cutX 29184 .empty (.cutY 13824 (.cutX 29440 .empty (.cutY 13568 .empty (.cutX 29568 (.cutY 13696 .full (.cutX 29504 (.cutY 13760 .full .full) (.cutY 13760 .full .full))) (.cutY 13696 .full .full)))) .empty))) .empty) .empty) .empty))))) .empty))

theorem metadata19 : 0<48363413 ∧ 12<128 ∧ 74<128 ∧ 0<4 ∧
    1466/4160=0 ∧ 1466%4160=1466 ∧ ∀ i, (leaves19 i).Valid 8 := by
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

noncomputable def phaseMass19 : ℝ := singlePhaseMass (48363413/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw19 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass19_eq : phaseMass19 = (48363413/1638400000000 : ℝ) := by
  unfold phaseMass19
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw19 output19 cover19 source19
    (gridTreeUnionCheck_sound 32768 raw19 output19 cover19 source19 tree19 checked19)
    _ (by norm_num) _, areaUnits19]
  norm_num

-- Frozen phase 5928, atom 1772, type 0, source (15,77).
def leavesData20 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves20 : Fin 7 → DyadicLeaf := leavesData20.get
def raw20 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 15 77 leaves20 i
def outputData20 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3840,3968,19712,19840⟩) (.node (.single ⟨3840,3968,19840,19968⟩) (.single ⟨3968,4032,19712,19776⟩))) (.node (.node (.single ⟨3968,4032,19776,19840⟩) (.single ⟨4032,4096,19712,19776⟩)) (.node (.single ⟨4032,4096,19776,19840⟩) (.single ⟨3968,4096,19840,19968⟩)))) (.node (.node (.single ⟨12800,12928,28672,28800⟩) (.node (.single ⟨12800,12928,28800,28928⟩) (.single ⟨12928,12992,28672,28736⟩))) (.node (.node (.single ⟨12928,12992,28736,28800⟩) (.single ⟨12992,13056,28672,28736⟩)) (.node (.single ⟨12992,13056,28736,28800⟩) (.single ⟨12928,13056,28800,28928⟩))))) (.node (.node (.node (.single ⟨19712,19840,3840,3968⟩) (.node (.single ⟨19712,19776,3968,4032⟩) (.single ⟨19712,19776,4032,4096⟩))) (.node (.node (.single ⟨19776,19840,3968,4032⟩) (.single ⟨19776,19840,4032,4096⟩)) (.node (.single ⟨19840,19968,3840,3968⟩) (.single ⟨19840,19968,3968,4096⟩)))) (.node (.node (.single ⟨28672,28800,12800,12928⟩) (.node (.single ⟨28672,28736,12928,12992⟩) (.single ⟨28672,28736,12992,13056⟩))) (.node (.node (.single ⟨28736,28800,12928,12992⟩) (.single ⟨28736,28800,12992,13056⟩)) (.node (.single ⟨28800,28928,12800,12928⟩) (.single ⟨28800,28928,12928,13056⟩))))))
def output20 : Fin 28 → GridBox := outputData20.get
def coverData20 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData20 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover20 (i : Fin 28) : Fin 28 := ⟨coverData20.get i % 28, Nat.mod_lt _ (by decide)⟩
def source20 (i : Fin 28) : Fin 28 := ⟨sourceData20.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree20 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 .empty (.cutY 19456 .empty (.cutX 3584 .empty (.cutY 19968 (.cutX 3840 .empty (.cutY 19712 .empty (.cutX 3968 (.cutY 19840 .full .full) (.cutY 19840 (.cutX 4032 (.cutY 19776 .full .full) (.cutY 19776 .full .full)) .full)))) .empty)))))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 (.cutY 29696 (.cutX 12800 .empty (.cutY 29184 (.cutX 13056 (.cutY 28928 (.cutX 12928 (.cutY 28800 .full .full) (.cutY 28800 (.cutX 12992 (.cutY 28736 .full .full) (.cutY 28736 .full .full)) .full)) .empty) .empty) .empty)) .empty) .empty) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 .empty (.cutY 3072 .empty (.cutX 19968 (.cutY 3584 .empty (.cutX 19712 .empty (.cutY 3840 .empty (.cutX 19840 (.cutY 3968 .full (.cutX 19776 (.cutY 4032 .full .full) (.cutY 4032 .full .full))) (.cutY 3968 .full .full))))) .empty))))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 (.cutY 13312 (.cutX 29184 (.cutY 12800 .empty (.cutX 28928 (.cutY 13056 (.cutX 28800 (.cutY 12928 .full (.cutX 28736 (.cutY 12992 .full .full) (.cutY 12992 .full .full))) (.cutY 12928 .full .full)) .empty) .empty)) .empty) .empty) .empty) .empty) .empty))))) .empty))

theorem metadata20 : 0<48363413 ∧ 15<128 ∧ 77<128 ∧ 0<4 ∧
    1772/4160=0 ∧ 1772%4160=1772 ∧ ∀ i, (leaves20 i).Valid 8 := by
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

noncomputable def phaseMass20 : ℝ := singlePhaseMass (48363413/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw20 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass20_eq : phaseMass20 = (48363413/1638400000000 : ℝ) := by
  unfold phaseMass20
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw20 output20 cover20 source20
    (gridTreeUnionCheck_sound 32768 raw20 output20 cover20 source20 tree20 checked20)
    _ (by norm_num) _, areaUnits20]
  norm_num

-- Frozen phase 5929, atom 6970, type 1, source (27,83).
def leavesData21 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves21 : Fin 7 → DyadicLeaf := leavesData21.get
def raw21 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 27 83 leaves21 i
def outputData21 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨6912,7040,21248,21376⟩) (.node (.single ⟨6912,7040,21376,21504⟩) (.single ⟨7040,7104,21248,21312⟩))) (.node (.node (.single ⟨7040,7104,21312,21376⟩) (.single ⟨7104,7168,21248,21312⟩)) (.node (.single ⟨7104,7168,21312,21376⟩) (.single ⟨7040,7168,21376,21504⟩)))) (.node (.node (.single ⟨11264,11392,25600,25728⟩) (.node (.single ⟨11264,11392,25728,25856⟩) (.single ⟨11392,11456,25600,25664⟩))) (.node (.node (.single ⟨11392,11456,25664,25728⟩) (.single ⟨11456,11520,25600,25664⟩)) (.node (.single ⟨11456,11520,25664,25728⟩) (.single ⟨11392,11520,25728,25856⟩))))) (.node (.node (.node (.single ⟨21248,21376,6912,7040⟩) (.node (.single ⟨21248,21312,7040,7104⟩) (.single ⟨21248,21312,7104,7168⟩))) (.node (.node (.single ⟨21312,21376,7040,7104⟩) (.single ⟨21312,21376,7104,7168⟩)) (.node (.single ⟨21376,21504,6912,7040⟩) (.single ⟨21376,21504,7040,7168⟩)))) (.node (.node (.single ⟨25600,25728,11264,11392⟩) (.node (.single ⟨25600,25664,11392,11456⟩) (.single ⟨25600,25664,11456,11520⟩))) (.node (.node (.single ⟨25664,25728,11392,11456⟩) (.single ⟨25664,25728,11456,11520⟩)) (.node (.single ⟨25728,25856,11264,11392⟩) (.single ⟨25728,25856,11392,11520⟩))))))
def output21 : Fin 28 → GridBox := outputData21.get
def coverData21 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData21 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover21 (i : Fin 28) : Fin 28 := ⟨coverData21.get i % 28, Nat.mod_lt _ (by decide)⟩
def source21 (i : Fin 28) : Fin 28 := ⟨sourceData21.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree21 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 (.cutX 7168 (.cutY 21504 (.cutX 6656 .empty (.cutY 20992 .empty (.cutX 6912 .empty (.cutY 21248 .empty (.cutX 7040 (.cutY 21376 .full .full) (.cutY 21376 (.cutX 7104 (.cutY 21312 .full .full) (.cutY 21312 .full .full)) .full)))))) .empty) .empty) .empty)))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 (.cutX 11264 .empty (.cutY 25600 .empty (.cutX 11776 (.cutY 26112 (.cutX 11520 (.cutY 25856 (.cutX 11392 (.cutY 25728 .full .full) (.cutY 25728 (.cutX 11456 (.cutY 25664 .full .full) (.cutY 25664 .full .full)) .full)) .empty) .empty) .empty) .empty))) .empty)) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 .empty (.cutX 21504 (.cutY 7168 (.cutX 20992 .empty (.cutY 6656 .empty (.cutX 21248 .empty (.cutY 6912 .empty (.cutX 21376 (.cutY 7040 .full (.cutX 21312 (.cutY 7104 .full .full) (.cutY 7104 .full .full))) (.cutY 7040 .full .full)))))) .empty) .empty)) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 .empty (.cutX 25600 .empty (.cutY 11264 .empty (.cutX 26112 (.cutY 11776 (.cutX 25856 (.cutY 11520 (.cutX 25728 (.cutY 11392 .full (.cutX 25664 (.cutY 11456 .full .full) (.cutY 11456 .full .full))) (.cutY 11392 .full .full)) .empty) .empty) .empty) .empty)))) .empty) .empty) .empty))) .empty))

theorem metadata21 : 0<144359671 ∧ 27<128 ∧ 83<128 ∧ 1<4 ∧
    6970/4160=1 ∧ 6970%4160=2810 ∧ ∀ i, (leaves21 i).Valid 8 := by
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

noncomputable def phaseMass21 : ℝ := singlePhaseMass (144359671/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw21 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass21_eq : phaseMass21 = (144359671/1638400000000 : ℝ) := by
  unfold phaseMass21
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw21 output21 cover21 source21
    (gridTreeUnionCheck_sound 32768 raw21 output21 cover21 source21 tree21 checked21)
    _ (by norm_num) _, areaUnits21]
  norm_num

-- Frozen phase 5930, atom 6398, type 1, source (20,78).
def leavesData22 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩))) (.node (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.single ⟨3,7,1⟩))) (.node (.node (.single ⟨4,14,0⟩) (.single ⟨4,14,1⟩)) (.node (.single ⟨4,15,0⟩) (.single ⟨4,15,1⟩)))))
def leaves22 : Fin 16 → DyadicLeaf := leavesData22.get
def raw22 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 20 78 leaves22 i
def outputData22 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨5120,5184,19968,20032⟩) (.single ⟨5120,5184,20032,20096⟩)) (.node (.single ⟨5184,5248,19968,20032⟩) (.single ⟨5184,5248,20032,20096⟩))) (.node (.node (.single ⟨5120,5248,20096,20224⟩) (.single ⟨5248,5312,19968,20032⟩)) (.node (.single ⟨5248,5312,20032,20096⟩) (.single ⟨5312,5344,19968,20000⟩)))) (.node (.node (.node (.single ⟨5312,5344,20000,20032⟩) (.single ⟨5344,5360,19968,19984⟩)) (.node (.single ⟨5344,5360,19984,20000⟩) (.single ⟨5360,5376,19968,19984⟩))) (.node (.node (.single ⟨5360,5376,19984,20000⟩) (.single ⟨5344,5376,20000,20032⟩)) (.node (.single ⟨5312,5376,20032,20096⟩) (.single ⟨5248,5376,20096,20224⟩))))) (.node (.node (.node (.node (.single ⟨12544,12672,27392,27520⟩) (.single ⟨12544,12672,27520,27648⟩)) (.node (.single ⟨12672,12736,27392,27456⟩) (.single ⟨12672,12736,27456,27520⟩))) (.node (.node (.single ⟨12736,12768,27392,27424⟩) (.single ⟨12736,12768,27424,27456⟩)) (.node (.single ⟨12768,12784,27392,27408⟩) (.single ⟨12768,12784,27408,27424⟩)))) (.node (.node (.node (.single ⟨12784,12800,27392,27408⟩) (.single ⟨12784,12800,27408,27424⟩)) (.node (.single ⟨12768,12800,27424,27456⟩) (.single ⟨12736,12800,27456,27520⟩))) (.node (.node (.single ⟨12672,12736,27520,27584⟩) (.single ⟨12672,12736,27584,27648⟩)) (.node (.single ⟨12736,12800,27520,27584⟩) (.single ⟨12736,12800,27584,27648⟩)))))) (.node (.node (.node (.node (.node (.single ⟨19968,20032,5120,5184⟩) (.single ⟨19968,20032,5184,5248⟩)) (.node (.single ⟨20032,20096,5120,5184⟩) (.single ⟨20032,20096,5184,5248⟩))) (.node (.node (.single ⟨19968,20032,5248,5312⟩) (.single ⟨19968,20000,5312,5344⟩)) (.node (.single ⟨19968,19984,5344,5360⟩) (.single ⟨19968,19984,5360,5376⟩)))) (.node (.node (.node (.single ⟨19984,20000,5344,5360⟩) (.single ⟨19984,20000,5360,5376⟩)) (.node (.single ⟨20000,20032,5312,5344⟩) (.single ⟨20000,20032,5344,5376⟩))) (.node (.node (.single ⟨20032,20096,5248,5312⟩) (.single ⟨20032,20096,5312,5376⟩)) (.node (.single ⟨20096,20224,5120,5248⟩) (.single ⟨20096,20224,5248,5376⟩))))) (.node (.node (.node (.node (.single ⟨27392,27520,12544,12672⟩) (.single ⟨27392,27456,12672,12736⟩)) (.node (.single ⟨27392,27424,12736,12768⟩) (.single ⟨27392,27408,12768,12784⟩))) (.node (.node (.single ⟨27392,27408,12784,12800⟩) (.single ⟨27408,27424,12768,12784⟩)) (.node (.single ⟨27408,27424,12784,12800⟩) (.single ⟨27424,27456,12736,12768⟩)))) (.node (.node (.node (.single ⟨27424,27456,12768,12800⟩) (.single ⟨27456,27520,12672,12736⟩)) (.node (.single ⟨27456,27520,12736,12800⟩) (.single ⟨27520,27648,12544,12672⟩))) (.node (.node (.single ⟨27520,27584,12672,12736⟩) (.single ⟨27520,27584,12736,12800⟩)) (.node (.single ⟨27584,27648,12672,12736⟩) (.single ⟨27584,27648,12736,12800⟩)))))))
def output22 : Fin 64 → GridBox := outputData22.get
def coverData22 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 46)) (.node (.single 59) (.single 17))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16)))) (.node (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31))) (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29))))) (.node (.node (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30))) (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28)))) (.node (.node (.node (.single 5) (.single 36)) (.node (.single 58) (.single 27))) (.node (.node (.single 6) (.single 44)) (.node (.single 57) (.single 19)))))) (.node (.node (.node (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18))) (.node (.node (.single 7) (.single 37)) (.node (.single 56) (.single 26)))) (.node (.node (.node (.single 8) (.single 42)) (.node (.single 55) (.single 21))) (.node (.node (.single 13) (.single 43)) (.node (.single 50) (.single 20))))) (.node (.node (.node (.node (.single 9) (.single 38)) (.node (.single 54) (.single 25))) (.node (.node (.single 10) (.single 40)) (.node (.single 53) (.single 23)))) (.node (.node (.node (.single 11) (.single 39)) (.node (.single 52) (.single 24))) (.node (.node (.single 12) (.single 41)) (.node (.single 51) (.single 22)))))))
def sourceData22 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.single 20))) (.node (.node (.single 0) (.single 24)) (.node (.single 28) (.single 36)))) (.node (.node (.node (.single 40) (.single 48)) (.node (.single 52) (.single 56))) (.node (.node (.single 60) (.single 44)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.node (.single 7) (.single 3)) (.node (.single 35) (.single 31))) (.node (.node (.single 47) (.single 43)) (.node (.single 63) (.single 55)))) (.node (.node (.node (.single 59) (.single 51)) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.single 21))) (.node (.node (.single 25) (.single 37)) (.node (.single 49) (.single 57)))) (.node (.node (.node (.single 53) (.single 61)) (.node (.single 41) (.single 45))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.node (.single 6) (.single 34)) (.node (.single 46) (.single 62))) (.node (.node (.single 58) (.single 54)) (.node (.single 50) (.single 42)))) (.node (.node (.node (.single 38) (.single 30)) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover22 (i : Fin 64) : Fin 64 := ⟨coverData22.get i % 64, Nat.mod_lt _ (by decide)⟩
def source22 (i : Fin 64) : Fin 64 := ⟨sourceData22.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree22 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 .empty (.cutX 5120 .empty (.cutY 19456 .empty (.cutX 5632 (.cutY 19968 .empty (.cutX 5376 (.cutY 20224 (.cutX 5248 (.cutY 20096 (.cutX 5184 (.cutY 20032 .full .full) (.cutY 20032 .full .full)) .full) (.cutY 20096 (.cutX 5312 (.cutY 20032 .full .full) (.cutY 20032 (.cutX 5344 (.cutY 20000 .full .full) (.cutY 20000 (.cutX 5360 (.cutY 19984 .full .full) (.cutY 19984 .full .full)) .full)) .full)) .full)) .empty) .empty)) .empty)))) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 .empty (.cutX 13312 (.cutY 27648 (.cutX 12800 (.cutY 27136 .empty (.cutX 12544 .empty (.cutY 27392 .empty (.cutX 12672 (.cutY 27520 .full .full) (.cutY 27520 (.cutX 12736 (.cutY 27456 .full .full) (.cutY 27456 (.cutX 12768 (.cutY 27424 .full .full) (.cutY 27424 (.cutX 12784 (.cutY 27408 .full .full) (.cutY 27408 .full .full)) .full)) .full)) (.cutX 12736 (.cutY 27584 .full .full) (.cutY 27584 .full .full))))))) .empty) .empty) .empty)) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 (.cutX 19456 .empty (.cutY 5120 .empty (.cutX 19968 .empty (.cutY 5632 (.cutX 20224 (.cutY 5376 (.cutX 20096 (.cutY 5248 (.cutX 20032 (.cutY 5184 .full .full) (.cutY 5184 .full .full)) (.cutX 20032 (.cutY 5312 .full (.cutX 20000 (.cutY 5344 .full (.cutX 19984 (.cutY 5360 .full .full) (.cutY 5360 .full .full))) (.cutY 5344 .full .full))) (.cutY 5312 .full .full))) (.cutY 5248 .full .full)) .empty) .empty) .empty)))) .empty))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 (.cutX 27648 (.cutY 13312 (.cutX 27136 .empty (.cutY 12800 (.cutX 27392 .empty (.cutY 12544 .empty (.cutX 27520 (.cutY 12672 .full (.cutX 27456 (.cutY 12736 .full (.cutX 27424 (.cutY 12768 .full (.cutX 27408 (.cutY 12784 .full .full) (.cutY 12784 .full .full))) (.cutY 12768 .full .full))) (.cutY 12736 .full .full))) (.cutY 12672 .full (.cutX 27584 (.cutY 12736 .full .full) (.cutY 12736 .full .full)))))) .empty)) .empty) .empty) .empty))) .empty))) .empty))

theorem metadata22 : 0<157738472 ∧ 20<128 ∧ 78<128 ∧ 1<4 ∧
    6398/4160=1 ∧ 6398%4160=2238 ∧ ∀ i, (leaves22 i).Valid 8 := by
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

noncomputable def phaseMass22 : ℝ := singlePhaseMass (157738472/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw22 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass22_eq : phaseMass22 = (19717309/204800000000 : ℝ) := by
  unfold phaseMass22
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw22 output22 cover22 source22
    (gridTreeUnionCheck_sound 32768 raw22 output22 cover22 source22 tree22 checked22)
    _ (by norm_num) _, areaUnits22]
  norm_num

-- Frozen phase 5931, atom 1570, type 0, source (13,75).
def leavesData23 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves23 : Fin 7 → DyadicLeaf := leavesData23.get
def raw23 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 13 75 leaves23 i
def outputData23 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3328,3456,19200,19328⟩) (.node (.single ⟨3328,3456,19328,19456⟩) (.single ⟨3456,3520,19200,19264⟩))) (.node (.node (.single ⟨3456,3520,19264,19328⟩) (.single ⟨3520,3584,19200,19264⟩)) (.node (.single ⟨3520,3584,19264,19328⟩) (.single ⟨3456,3584,19328,19456⟩)))) (.node (.node (.single ⟨13312,13440,29184,29312⟩) (.node (.single ⟨13312,13440,29312,29440⟩) (.single ⟨13440,13504,29184,29248⟩))) (.node (.node (.single ⟨13440,13504,29248,29312⟩) (.single ⟨13504,13568,29184,29248⟩)) (.node (.single ⟨13504,13568,29248,29312⟩) (.single ⟨13440,13568,29312,29440⟩))))) (.node (.node (.node (.single ⟨19200,19328,3328,3456⟩) (.node (.single ⟨19200,19264,3456,3520⟩) (.single ⟨19200,19264,3520,3584⟩))) (.node (.node (.single ⟨19264,19328,3456,3520⟩) (.single ⟨19264,19328,3520,3584⟩)) (.node (.single ⟨19328,19456,3328,3456⟩) (.single ⟨19328,19456,3456,3584⟩)))) (.node (.node (.single ⟨29184,29312,13312,13440⟩) (.node (.single ⟨29184,29248,13440,13504⟩) (.single ⟨29184,29248,13504,13568⟩))) (.node (.node (.single ⟨29248,29312,13440,13504⟩) (.single ⟨29248,29312,13504,13568⟩)) (.node (.single ⟨29312,29440,13312,13440⟩) (.single ⟨29312,29440,13440,13568⟩))))))
def output23 : Fin 28 → GridBox := outputData23.get
def coverData23 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData23 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover23 (i : Fin 28) : Fin 28 := ⟨coverData23.get i % 28, Nat.mod_lt _ (by decide)⟩
def source23 (i : Fin 28) : Fin 28 := ⟨sourceData23.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree23 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 .empty (.cutY 19456 (.cutX 3584 (.cutY 18944 .empty (.cutX 3328 .empty (.cutY 19200 .empty (.cutX 3456 (.cutY 19328 .full .full) (.cutY 19328 (.cutX 3520 (.cutY 19264 .full .full) (.cutY 19264 .full .full)) .full))))) .empty) .empty)))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 .empty (.cutY 29696 (.cutX 13824 (.cutY 29184 .empty (.cutX 13568 (.cutY 29440 (.cutX 13440 (.cutY 29312 .full .full) (.cutY 29312 (.cutX 13504 (.cutY 29248 .full .full) (.cutY 29248 .full .full)) .full)) .empty) .empty)) .empty) .empty)) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 (.cutY 3072 .empty (.cutX 18944 .empty (.cutY 3584 (.cutX 19200 .empty (.cutY 3328 .empty (.cutX 19328 (.cutY 3456 .full (.cutX 19264 (.cutY 3520 .full .full) (.cutY 3520 .full .full))) (.cutY 3456 .full .full)))) .empty))) .empty))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 (.cutY 13312 .empty (.cutX 29184 .empty (.cutY 13824 (.cutX 29440 (.cutY 13568 (.cutX 29312 (.cutY 13440 .full (.cutX 29248 (.cutY 13504 .full .full) (.cutY 13504 .full .full))) (.cutY 13440 .full .full)) .empty) .empty) .empty))) .empty) .empty) .empty))))) .empty))

theorem metadata23 : 0<48363413 ∧ 13<128 ∧ 75<128 ∧ 0<4 ∧
    1570/4160=0 ∧ 1570%4160=1570 ∧ ∀ i, (leaves23 i).Valid 8 := by
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

noncomputable def phaseMass23 : ℝ := singlePhaseMass (48363413/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw23 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass23_eq : phaseMass23 = (48363413/1638400000000 : ℝ) := by
  unfold phaseMass23
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw23 output23 cover23 source23
    (gridTreeUnionCheck_sound 32768 raw23 output23 cover23 source23 tree23 checked23)
    _ (by norm_num) _, areaUnits23]
  norm_num

-- Frozen phase 5932, atom 4603, type 1, source (3,68).
def leavesData24 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves24 : Fin 10 → DyadicLeaf := leavesData24.get
def raw24 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 3 68 leaves24 i
def outputData24 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨768,832,17408,17472⟩) (.single ⟨768,832,17472,17536⟩)) (.node (.single ⟨832,896,17408,17472⟩) (.node (.single ⟨832,896,17472,17536⟩) (.single ⟨768,896,17536,17664⟩)))) (.node (.node (.single ⟨896,960,17408,17472⟩) (.single ⟨896,960,17472,17536⟩)) (.node (.single ⟨960,1024,17408,17472⟩) (.node (.single ⟨960,1024,17472,17536⟩) (.single ⟨896,1024,17536,17664⟩))))) (.node (.node (.node (.single ⟨15104,15232,31744,31872⟩) (.single ⟨15104,15232,31872,32000⟩)) (.node (.single ⟨15232,15296,31744,31808⟩) (.node (.single ⟨15232,15296,31808,31872⟩) (.single ⟨15296,15360,31744,31808⟩)))) (.node (.node (.single ⟨15296,15360,31808,31872⟩) (.single ⟨15232,15296,31872,31936⟩)) (.node (.single ⟨15232,15296,31936,32000⟩) (.node (.single ⟨15296,15360,31872,31936⟩) (.single ⟨15296,15360,31936,32000⟩)))))) (.node (.node (.node (.node (.single ⟨17408,17472,768,832⟩) (.single ⟨17408,17472,832,896⟩)) (.node (.single ⟨17472,17536,768,832⟩) (.node (.single ⟨17472,17536,832,896⟩) (.single ⟨17408,17472,896,960⟩)))) (.node (.node (.single ⟨17408,17472,960,1024⟩) (.single ⟨17472,17536,896,960⟩)) (.node (.single ⟨17472,17536,960,1024⟩) (.node (.single ⟨17536,17664,768,896⟩) (.single ⟨17536,17664,896,1024⟩))))) (.node (.node (.node (.single ⟨31744,31872,15104,15232⟩) (.single ⟨31744,31808,15232,15296⟩)) (.node (.single ⟨31744,31808,15296,15360⟩) (.node (.single ⟨31808,31872,15232,15296⟩) (.single ⟨31808,31872,15296,15360⟩)))) (.node (.node (.single ⟨31872,32000,15104,15232⟩) (.single ⟨31872,31936,15232,15296⟩)) (.node (.single ⟨31872,31936,15296,15360⟩) (.node (.single ⟨31936,32000,15232,15296⟩) (.single ⟨31936,32000,15296,15360⟩)))))))
def output24 : Fin 40 → GridBox := outputData24.get
def coverData24 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData24 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover24 (i : Fin 40) : Fin 40 := ⟨coverData24.get i % 40, Nat.mod_lt _ (by decide)⟩
def source24 (i : Fin 40) : Fin 40 := ⟨sourceData24.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree24 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 (.cutX 1024 (.cutY 17408 .empty (.cutX 512 .empty (.cutY 17920 (.cutX 768 .empty (.cutY 17664 (.cutX 896 (.cutY 17536 (.cutX 832 (.cutY 17472 .full .full) (.cutY 17472 .full .full)) .full) (.cutY 17536 (.cutX 960 (.cutY 17472 .full .full) (.cutY 17472 .full .full)) .full)) .empty)) .empty))) .empty) .empty) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 .empty (.cutX 15360 (.cutY 31744 .empty (.cutX 14848 .empty (.cutY 32256 (.cutX 15104 .empty (.cutY 32000 (.cutX 15232 (.cutY 31872 .full .full) (.cutY 31872 (.cutX 15296 (.cutY 31808 .full .full) (.cutY 31808 .full .full)) (.cutX 15296 (.cutY 31936 .full .full) (.cutY 31936 .full .full)))) .empty)) .empty))) .empty)))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 (.cutX 17408 .empty (.cutY 1024 (.cutX 17920 (.cutY 512 .empty (.cutX 17664 (.cutY 768 .empty (.cutX 17536 (.cutY 896 (.cutX 17472 (.cutY 832 .full .full) (.cutY 832 .full .full)) (.cutX 17472 (.cutY 960 .full .full) (.cutY 960 .full .full))) (.cutY 896 .full .full))) .empty)) .empty) .empty)) .empty) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 .empty (.cutX 31744 .empty (.cutY 15360 (.cutX 32256 (.cutY 14848 .empty (.cutX 32000 (.cutY 15104 .empty (.cutX 31872 (.cutY 15232 .full (.cutX 31808 (.cutY 15296 .full .full) (.cutY 15296 .full .full))) (.cutY 15232 .full (.cutX 31936 (.cutY 15296 .full .full) (.cutY 15296 .full .full))))) .empty)) .empty) .empty)))))))) .empty))

theorem metadata24 : 0<202148459 ∧ 3<128 ∧ 68<128 ∧ 1<4 ∧
    4603/4160=1 ∧ 4603%4160=443 ∧ ∀ i, (leaves24 i).Valid 8 := by
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

noncomputable def phaseMass24 : ℝ := singlePhaseMass (202148459/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw24 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass24_eq : phaseMass24 = (202148459/1638400000000 : ℝ) := by
  unfold phaseMass24
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw24 output24 cover24 source24
    (gridTreeUnionCheck_sound 32768 raw24 output24 cover24 source24 tree24 checked24)
    _ (by norm_num) _, areaUnits24]
  norm_num

-- Frozen phase 5933, atom 4354, type 1, source (1,67).
def leavesData25 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,0⟩))) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves25 : Fin 13 → DyadicLeaf := leavesData25.get
def raw25 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 1 67 leaves25 i
def outputData25 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨256,320,17152,17216⟩) (.node (.single ⟨256,320,17216,17280⟩) (.single ⟨320,384,17152,17216⟩))) (.node (.single ⟨320,384,17216,17280⟩) (.node (.single ⟨256,384,17280,17408⟩) (.single ⟨384,448,17152,17216⟩)))) (.node (.node (.single ⟨384,448,17216,17280⟩) (.node (.single ⟨448,480,17152,17184⟩) (.single ⟨448,480,17184,17216⟩))) (.node (.node (.single ⟨480,512,17152,17184⟩) (.single ⟨480,512,17184,17216⟩)) (.node (.single ⟨448,512,17216,17280⟩) (.single ⟨384,512,17280,17408⟩))))) (.node (.node (.node (.single ⟨15360,15488,32256,32384⟩) (.node (.single ⟨15360,15488,32384,32512⟩) (.single ⟨15488,15552,32256,32320⟩))) (.node (.single ⟨15488,15552,32320,32384⟩) (.node (.single ⟨15552,15584,32256,32288⟩) (.single ⟨15552,15584,32288,32320⟩)))) (.node (.node (.single ⟨15584,15616,32256,32288⟩) (.node (.single ⟨15584,15616,32288,32320⟩) (.single ⟨15552,15616,32320,32384⟩))) (.node (.node (.single ⟨15488,15552,32384,32448⟩) (.single ⟨15488,15552,32448,32512⟩)) (.node (.single ⟨15552,15616,32384,32448⟩) (.single ⟨15552,15616,32448,32512⟩)))))) (.node (.node (.node (.node (.single ⟨17152,17216,256,320⟩) (.node (.single ⟨17152,17216,320,384⟩) (.single ⟨17216,17280,256,320⟩))) (.node (.single ⟨17216,17280,320,384⟩) (.node (.single ⟨17152,17216,384,448⟩) (.single ⟨17152,17184,448,480⟩)))) (.node (.node (.single ⟨17152,17184,480,512⟩) (.node (.single ⟨17184,17216,448,480⟩) (.single ⟨17184,17216,480,512⟩))) (.node (.node (.single ⟨17216,17280,384,448⟩) (.single ⟨17216,17280,448,512⟩)) (.node (.single ⟨17280,17408,256,384⟩) (.single ⟨17280,17408,384,512⟩))))) (.node (.node (.node (.single ⟨32256,32384,15360,15488⟩) (.node (.single ⟨32256,32320,15488,15552⟩) (.single ⟨32256,32288,15552,15584⟩))) (.node (.single ⟨32256,32288,15584,15616⟩) (.node (.single ⟨32288,32320,15552,15584⟩) (.single ⟨32288,32320,15584,15616⟩)))) (.node (.node (.single ⟨32320,32384,15488,15552⟩) (.node (.single ⟨32320,32384,15552,15616⟩) (.single ⟨32384,32512,15360,15488⟩))) (.node (.node (.single ⟨32384,32448,15488,15552⟩) (.single ⟨32384,32448,15552,15616⟩)) (.node (.single ⟨32448,32512,15488,15552⟩) (.single ⟨32448,32512,15552,15616⟩)))))))
def output25 : Fin 52 → GridBox := outputData25.get
def coverData25 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 0))) (.node (.node (.single 26) (.single 51)) (.node (.single 25) (.single 1))))) (.node (.node (.node (.single 28) (.node (.single 50) (.single 23))) (.node (.single 2) (.node (.single 27) (.single 49)))) (.node (.node (.single 24) (.node (.single 3) (.single 29))) (.node (.node (.single 48) (.single 22)) (.node (.single 5) (.single 30)))))) (.node (.node (.node (.node (.single 46) (.node (.single 21) (.single 6))) (.node (.single 35) (.node (.single 45) (.single 16)))) (.node (.node (.single 11) (.node (.single 36) (.single 40))) (.node (.node (.single 15) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData25 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.single 20) (.node (.single 0) (.single 24)))) (.node (.node (.single 28) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 35))) (.node (.single 31) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.node (.single 17) (.single 13))) (.node (.single 21) (.node (.single 25) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 34) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 30) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover25 (i : Fin 52) : Fin 52 := ⟨coverData25.get i % 52, Nat.mod_lt _ (by decide)⟩
def source25 (i : Fin 52) : Fin 52 := ⟨sourceData25.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree25 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 (.cutX 1024 (.cutY 17408 (.cutX 512 (.cutY 16896 .empty (.cutX 256 .empty (.cutY 17152 .empty (.cutX 384 (.cutY 17280 (.cutX 320 (.cutY 17216 .full .full) (.cutY 17216 .full .full)) .full) (.cutY 17280 (.cutX 448 (.cutY 17216 .full .full) (.cutY 17216 (.cutX 480 (.cutY 17184 .full .full) (.cutY 17184 .full .full)) .full)) .full))))) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 .empty (.cutX 15360 .empty (.cutY 31744 .empty (.cutX 15872 (.cutY 32256 .empty (.cutX 15616 (.cutY 32512 (.cutX 15488 (.cutY 32384 .full .full) (.cutY 32384 (.cutX 15552 (.cutY 32320 .full .full) (.cutY 32320 (.cutX 15584 (.cutY 32288 .full .full) (.cutY 32288 .full .full)) .full)) (.cutX 15552 (.cutY 32448 .full .full) (.cutY 32448 .full .full)))) .empty) .empty)) .empty)))))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 (.cutX 17408 (.cutY 1024 (.cutX 16896 .empty (.cutY 512 (.cutX 17152 .empty (.cutY 256 .empty (.cutX 17280 (.cutY 384 (.cutX 17216 (.cutY 320 .full .full) (.cutY 320 .full .full)) (.cutX 17216 (.cutY 448 .full (.cutX 17184 (.cutY 480 .full .full) (.cutY 480 .full .full))) (.cutY 448 .full .full))) (.cutY 384 .full .full)))) .empty)) .empty) .empty) .empty) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 .empty (.cutX 31744 .empty (.cutY 15360 .empty (.cutX 32256 .empty (.cutY 15872 (.cutX 32512 (.cutY 15616 (.cutX 32384 (.cutY 15488 .full (.cutX 32320 (.cutY 15552 .full (.cutX 32288 (.cutY 15584 .full .full) (.cutY 15584 .full .full))) (.cutY 15552 .full .full))) (.cutY 15488 .full (.cutX 32448 (.cutY 15552 .full .full) (.cutY 15552 .full .full)))) .empty) .empty) .empty)))))))))) .empty))

theorem metadata25 : 0<202148459 ∧ 1<128 ∧ 67<128 ∧ 1<4 ∧
    4354/4160=1 ∧ 4354%4160=194 ∧ ∀ i, (leaves25 i).Valid 8 := by
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

noncomputable def phaseMass25 : ℝ := singlePhaseMass (202148459/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw25 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass25_eq : phaseMass25 = (202148459/1638400000000 : ℝ) := by
  unfold phaseMass25
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw25 output25 cover25 source25
    (gridTreeUnionCheck_sound 32768 raw25 output25 cover25 source25 tree25 checked25)
    _ (by norm_num) _, areaUnits25]
  norm_num

-- Frozen phase 5934, atom 2060, type 0, source (18,80).
def leavesData26 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,0⟩))) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves26 : Fin 13 → DyadicLeaf := leavesData26.get
def raw26 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 18 80 leaves26 i
def outputData26 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨4608,4672,20480,20544⟩) (.node (.single ⟨4608,4672,20544,20608⟩) (.single ⟨4672,4736,20480,20544⟩))) (.node (.single ⟨4672,4736,20544,20608⟩) (.node (.single ⟨4608,4736,20608,20736⟩) (.single ⟨4736,4800,20480,20544⟩)))) (.node (.node (.single ⟨4736,4800,20544,20608⟩) (.node (.single ⟨4800,4832,20480,20512⟩) (.single ⟨4800,4832,20512,20544⟩))) (.node (.node (.single ⟨4832,4864,20480,20512⟩) (.single ⟨4832,4864,20512,20544⟩)) (.node (.single ⟨4800,4864,20544,20608⟩) (.single ⟨4736,4864,20608,20736⟩))))) (.node (.node (.node (.single ⟨12032,12160,27904,28032⟩) (.node (.single ⟨12032,12160,28032,28160⟩) (.single ⟨12160,12224,27904,27968⟩))) (.node (.single ⟨12160,12224,27968,28032⟩) (.node (.single ⟨12224,12256,27904,27936⟩) (.single ⟨12224,12256,27936,27968⟩)))) (.node (.node (.single ⟨12256,12288,27904,27936⟩) (.node (.single ⟨12256,12288,27936,27968⟩) (.single ⟨12224,12288,27968,28032⟩))) (.node (.node (.single ⟨12160,12224,28032,28096⟩) (.single ⟨12160,12224,28096,28160⟩)) (.node (.single ⟨12224,12288,28032,28096⟩) (.single ⟨12224,12288,28096,28160⟩)))))) (.node (.node (.node (.node (.single ⟨20480,20544,4608,4672⟩) (.node (.single ⟨20480,20544,4672,4736⟩) (.single ⟨20544,20608,4608,4672⟩))) (.node (.single ⟨20544,20608,4672,4736⟩) (.node (.single ⟨20480,20544,4736,4800⟩) (.single ⟨20480,20512,4800,4832⟩)))) (.node (.node (.single ⟨20480,20512,4832,4864⟩) (.node (.single ⟨20512,20544,4800,4832⟩) (.single ⟨20512,20544,4832,4864⟩))) (.node (.node (.single ⟨20544,20608,4736,4800⟩) (.single ⟨20544,20608,4800,4864⟩)) (.node (.single ⟨20608,20736,4608,4736⟩) (.single ⟨20608,20736,4736,4864⟩))))) (.node (.node (.node (.single ⟨27904,28032,12032,12160⟩) (.node (.single ⟨27904,27968,12160,12224⟩) (.single ⟨27904,27936,12224,12256⟩))) (.node (.single ⟨27904,27936,12256,12288⟩) (.node (.single ⟨27936,27968,12224,12256⟩) (.single ⟨27936,27968,12256,12288⟩)))) (.node (.node (.single ⟨27968,28032,12160,12224⟩) (.node (.single ⟨27968,28032,12224,12288⟩) (.single ⟨28032,28160,12032,12160⟩))) (.node (.node (.single ⟨28032,28096,12160,12224⟩) (.single ⟨28032,28096,12224,12288⟩)) (.node (.single ⟨28096,28160,12160,12224⟩) (.single ⟨28096,28160,12224,12288⟩)))))))
def output26 : Fin 52 → GridBox := outputData26.get
def coverData26 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 0))) (.node (.node (.single 26) (.single 51)) (.node (.single 25) (.single 1))))) (.node (.node (.node (.single 28) (.node (.single 50) (.single 23))) (.node (.single 2) (.node (.single 27) (.single 49)))) (.node (.node (.single 24) (.node (.single 3) (.single 29))) (.node (.node (.single 48) (.single 22)) (.node (.single 5) (.single 30)))))) (.node (.node (.node (.node (.single 46) (.node (.single 21) (.single 6))) (.node (.single 35) (.node (.single 45) (.single 16)))) (.node (.node (.single 11) (.node (.single 36) (.single 40))) (.node (.node (.single 15) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData26 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.single 20) (.node (.single 0) (.single 24)))) (.node (.node (.single 28) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 35))) (.node (.single 31) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.node (.single 17) (.single 13))) (.node (.single 21) (.node (.single 25) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 34) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 30) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover26 (i : Fin 52) : Fin 52 := ⟨coverData26.get i % 52, Nat.mod_lt _ (by decide)⟩
def source26 (i : Fin 52) : Fin 52 := ⟨sourceData26.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree26 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 (.cutY 21504 (.cutX 4608 .empty (.cutY 20992 (.cutX 4864 (.cutY 20736 (.cutX 4736 (.cutY 20608 (.cutX 4672 (.cutY 20544 .full .full) (.cutY 20544 .full .full)) .full) (.cutY 20608 (.cutX 4800 (.cutY 20544 .full .full) (.cutY 20544 (.cutX 4832 (.cutY 20512 .full .full) (.cutY 20512 .full .full)) .full)) .full)) .empty) .empty) .empty)) .empty) .empty) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 .empty (.cutY 27648 .empty (.cutX 11776 .empty (.cutY 28160 (.cutX 12032 .empty (.cutY 27904 .empty (.cutX 12160 (.cutY 28032 .full .full) (.cutY 28032 (.cutX 12224 (.cutY 27968 .full .full) (.cutY 27968 (.cutX 12256 (.cutY 27936 .full .full) (.cutY 27936 .full .full)) .full)) (.cutX 12224 (.cutY 28096 .full .full) (.cutY 28096 .full .full)))))) .empty)))))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 (.cutY 5120 (.cutX 20992 (.cutY 4608 .empty (.cutX 20736 (.cutY 4864 (.cutX 20608 (.cutY 4736 (.cutX 20544 (.cutY 4672 .full .full) (.cutY 4672 .full .full)) (.cutX 20544 (.cutY 4800 .full (.cutX 20512 (.cutY 4832 .full .full) (.cutY 4832 .full .full))) (.cutY 4800 .full .full))) (.cutY 4736 .full .full)) .empty) .empty)) .empty) .empty) .empty) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 .empty (.cutY 11264 .empty (.cutX 28160 (.cutY 11776 .empty (.cutX 27904 .empty (.cutY 12032 .empty (.cutX 28032 (.cutY 12160 .full (.cutX 27968 (.cutY 12224 .full (.cutX 27936 (.cutY 12256 .full .full) (.cutY 12256 .full .full))) (.cutY 12224 .full .full))) (.cutY 12160 .full (.cutX 28096 (.cutY 12224 .full .full) (.cutY 12224 .full .full))))))) .empty))))) .empty) .empty))) .empty))

theorem metadata26 : 0<152546139 ∧ 18<128 ∧ 80<128 ∧ 0<4 ∧
    2060/4160=0 ∧ 2060%4160=2060 ∧ ∀ i, (leaves26 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData26).mp
    (by decide +kernel)

theorem sourceChecked26_0 : ∀ i : Fin 52,
    (fun i => output26 i = raw26 (source26 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked26 : ∀ i : Fin 52, (fun i => output26 i = raw26 (source26 i)) i :=
  forallFin_of_zero_offset (fun i => output26 i = raw26 (source26 i)) sourceChecked26_0

theorem coverChecked26_0 : ∀ i : Fin 52,
    (fun i => (output26 (cover26 i)).ContainsBox (raw26 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked26 : ∀ i : Fin 52, (fun i => (output26 (cover26 i)).ContainsBox (raw26 i)) i :=
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

noncomputable def phaseMass26 : ℝ := singlePhaseMass (152546139/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw26 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass26_eq : phaseMass26 = (152546139/1638400000000 : ℝ) := by
  unfold phaseMass26
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw26 output26 cover26 source26
    (gridTreeUnionCheck_sound 32768 raw26 output26 cover26 source26 tree26 checked26)
    _ (by norm_num) _, areaUnits26]
  norm_num

-- Frozen phase 5935, atom 1672, type 0, source (14,76).
def leavesData27 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves27 : Fin 7 → DyadicLeaf := leavesData27.get
def raw27 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 14 76 leaves27 i
def outputData27 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3584,3712,19456,19584⟩) (.node (.single ⟨3584,3712,19584,19712⟩) (.single ⟨3712,3776,19456,19520⟩))) (.node (.node (.single ⟨3712,3776,19520,19584⟩) (.single ⟨3776,3840,19456,19520⟩)) (.node (.single ⟨3776,3840,19520,19584⟩) (.single ⟨3712,3840,19584,19712⟩)))) (.node (.node (.single ⟨13056,13184,28928,29056⟩) (.node (.single ⟨13056,13184,29056,29184⟩) (.single ⟨13184,13248,28928,28992⟩))) (.node (.node (.single ⟨13184,13248,28992,29056⟩) (.single ⟨13248,13312,28928,28992⟩)) (.node (.single ⟨13248,13312,28992,29056⟩) (.single ⟨13184,13312,29056,29184⟩))))) (.node (.node (.node (.single ⟨19456,19584,3584,3712⟩) (.node (.single ⟨19456,19520,3712,3776⟩) (.single ⟨19456,19520,3776,3840⟩))) (.node (.node (.single ⟨19520,19584,3712,3776⟩) (.single ⟨19520,19584,3776,3840⟩)) (.node (.single ⟨19584,19712,3584,3712⟩) (.single ⟨19584,19712,3712,3840⟩)))) (.node (.node (.single ⟨28928,29056,13056,13184⟩) (.node (.single ⟨28928,28992,13184,13248⟩) (.single ⟨28928,28992,13248,13312⟩))) (.node (.node (.single ⟨28992,29056,13184,13248⟩) (.single ⟨28992,29056,13248,13312⟩)) (.node (.single ⟨29056,29184,13056,13184⟩) (.single ⟨29056,29184,13184,13312⟩))))))
def output27 : Fin 28 → GridBox := outputData27.get
def coverData27 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData27 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover27 (i : Fin 28) : Fin 28 := ⟨coverData27.get i % 28, Nat.mod_lt _ (by decide)⟩
def source27 (i : Fin 28) : Fin 28 := ⟨sourceData27.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree27 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 .empty (.cutY 19456 .empty (.cutX 3584 .empty (.cutY 19968 (.cutX 3840 (.cutY 19712 (.cutX 3712 (.cutY 19584 .full .full) (.cutY 19584 (.cutX 3776 (.cutY 19520 .full .full) (.cutY 19520 .full .full)) .full)) .empty) .empty) .empty)))))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 (.cutY 29696 (.cutX 12800 .empty (.cutY 29184 (.cutX 13056 .empty (.cutY 28928 .empty (.cutX 13184 (.cutY 29056 .full .full) (.cutY 29056 (.cutX 13248 (.cutY 28992 .full .full) (.cutY 28992 .full .full)) .full)))) .empty)) .empty) .empty) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 .empty (.cutY 3072 .empty (.cutX 19968 (.cutY 3584 .empty (.cutX 19712 (.cutY 3840 (.cutX 19584 (.cutY 3712 .full (.cutX 19520 (.cutY 3776 .full .full) (.cutY 3776 .full .full))) (.cutY 3712 .full .full)) .empty) .empty)) .empty))))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 (.cutY 13312 (.cutX 29184 (.cutY 12800 .empty (.cutX 28928 .empty (.cutY 13056 .empty (.cutX 29056 (.cutY 13184 .full (.cutX 28992 (.cutY 13248 .full .full) (.cutY 13248 .full .full))) (.cutY 13184 .full .full))))) .empty) .empty) .empty) .empty) .empty))))) .empty))

theorem metadata27 : 0<48363413 ∧ 14<128 ∧ 76<128 ∧ 0<4 ∧
    1672/4160=0 ∧ 1672%4160=1672 ∧ ∀ i, (leaves27 i).Valid 8 := by
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

noncomputable def phaseMass27 : ℝ := singlePhaseMass (48363413/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw27 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass27_eq : phaseMass27 = (48363413/1638400000000 : ℝ) := by
  unfold phaseMass27
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw27 output27 cover27 source27
    (gridTreeUnionCheck_sound 32768 raw27 output27 cover27 source27 tree27 checked27)
    _ (by norm_num) _, areaUnits27]
  norm_num

-- Frozen phase 5936, atom 1143, type 0, source (9,72).
def leavesData28 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves28 : Fin 7 → DyadicLeaf := leavesData28.get
def raw28 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 9 72 leaves28 i
def outputData28 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨2304,2432,18432,18560⟩) (.node (.single ⟨2304,2432,18560,18688⟩) (.single ⟨2432,2496,18432,18496⟩))) (.node (.node (.single ⟨2432,2496,18496,18560⟩) (.single ⟨2496,2560,18432,18496⟩)) (.node (.single ⟨2496,2560,18496,18560⟩) (.single ⟨2432,2560,18560,18688⟩)))) (.node (.node (.single ⟨14080,14208,30208,30336⟩) (.node (.single ⟨14080,14208,30336,30464⟩) (.single ⟨14208,14272,30208,30272⟩))) (.node (.node (.single ⟨14208,14272,30272,30336⟩) (.single ⟨14272,14336,30208,30272⟩)) (.node (.single ⟨14272,14336,30272,30336⟩) (.single ⟨14208,14336,30336,30464⟩))))) (.node (.node (.node (.single ⟨18432,18560,2304,2432⟩) (.node (.single ⟨18432,18496,2432,2496⟩) (.single ⟨18432,18496,2496,2560⟩))) (.node (.node (.single ⟨18496,18560,2432,2496⟩) (.single ⟨18496,18560,2496,2560⟩)) (.node (.single ⟨18560,18688,2304,2432⟩) (.single ⟨18560,18688,2432,2560⟩)))) (.node (.node (.single ⟨30208,30336,14080,14208⟩) (.node (.single ⟨30208,30272,14208,14272⟩) (.single ⟨30208,30272,14272,14336⟩))) (.node (.node (.single ⟨30272,30336,14208,14272⟩) (.single ⟨30272,30336,14272,14336⟩)) (.node (.single ⟨30336,30464,14080,14208⟩) (.single ⟨30336,30464,14208,14336⟩))))))
def output28 : Fin 28 → GridBox := outputData28.get
def coverData28 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData28 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover28 (i : Fin 28) : Fin 28 := ⟨coverData28.get i % 28, Nat.mod_lt _ (by decide)⟩
def source28 (i : Fin 28) : Fin 28 := ⟨sourceData28.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree28 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 (.cutY 19456 (.cutX 2560 (.cutY 18944 (.cutX 2304 .empty (.cutY 18688 (.cutX 2432 (.cutY 18560 .full .full) (.cutY 18560 (.cutX 2496 (.cutY 18496 .full .full) (.cutY 18496 .full .full)) .full)) .empty)) .empty) .empty) .empty) .empty))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 .empty (.cutY 29696 .empty (.cutX 13824 .empty (.cutY 30208 .empty (.cutX 14080 .empty (.cutY 30464 (.cutX 14208 (.cutY 30336 .full .full) (.cutY 30336 (.cutX 14272 (.cutY 30272 .full .full) (.cutY 30272 .full .full)) .full)) .empty)))))) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 (.cutY 3072 (.cutX 18944 (.cutY 2560 (.cutX 18688 (.cutY 2304 .empty (.cutX 18560 (.cutY 2432 .full (.cutX 18496 (.cutY 2496 .full .full) (.cutY 2496 .full .full))) (.cutY 2432 .full .full))) .empty) .empty) .empty) .empty) .empty))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 .empty (.cutY 13312 .empty (.cutX 30208 .empty (.cutY 13824 .empty (.cutX 30464 (.cutY 14080 .empty (.cutX 30336 (.cutY 14208 .full (.cutX 30272 (.cutY 14272 .full .full) (.cutY 14272 .full .full))) (.cutY 14208 .full .full))) .empty))))) .empty) .empty))))) .empty))

theorem metadata28 : 0<48363413 ∧ 9<128 ∧ 72<128 ∧ 0<4 ∧
    1143/4160=0 ∧ 1143%4160=1143 ∧ ∀ i, (leaves28 i).Valid 8 := by
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

noncomputable def phaseMass28 : ℝ := singlePhaseMass (48363413/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw28 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass28_eq : phaseMass28 = (48363413/1638400000000 : ℝ) := by
  unfold phaseMass28
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw28 output28 cover28 source28
    (gridTreeUnionCheck_sound 32768 raw28 output28 cover28 source28 tree28 checked28)
    _ (by norm_num) _, areaUnits28]
  norm_num

-- Frozen phase 5937, atom 918, type 0, source (7,71).
def leavesData29 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩))) (.node (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩)))) (.node (.node (.node (.single ⟨3,4,0⟩) (.single ⟨3,4,1⟩)) (.node (.single ⟨3,5,0⟩) (.single ⟨3,5,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves29 : Fin 16 → DyadicLeaf := leavesData29.get
def raw29 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 7 71 leaves29 i
def outputData29 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨1792,1856,18176,18240⟩) (.single ⟨1792,1856,18240,18304⟩)) (.node (.single ⟨1856,1920,18176,18240⟩) (.single ⟨1856,1920,18240,18304⟩))) (.node (.node (.single ⟨1792,1920,18304,18432⟩) (.single ⟨1920,1952,18176,18208⟩)) (.node (.single ⟨1920,1952,18208,18240⟩) (.single ⟨1952,1984,18176,18208⟩)))) (.node (.node (.node (.single ⟨1952,1984,18208,18240⟩) (.single ⟨1920,1984,18240,18304⟩)) (.node (.single ⟨1984,2016,18176,18208⟩) (.single ⟨1984,2016,18208,18240⟩))) (.node (.node (.single ⟨2016,2048,18176,18208⟩) (.single ⟨2016,2048,18208,18240⟩)) (.node (.single ⟨1984,2048,18240,18304⟩) (.single ⟨1920,2048,18304,18432⟩))))) (.node (.node (.node (.node (.single ⟨14336,14464,30720,30848⟩) (.single ⟨14336,14464,30848,30976⟩)) (.node (.single ⟨14464,14528,30720,30784⟩) (.single ⟨14464,14528,30784,30848⟩))) (.node (.node (.single ⟨14528,14560,30720,30752⟩) (.single ⟨14528,14560,30752,30784⟩)) (.node (.single ⟨14560,14592,30720,30752⟩) (.single ⟨14560,14592,30752,30784⟩)))) (.node (.node (.node (.single ⟨14528,14560,30784,30816⟩) (.single ⟨14528,14560,30816,30848⟩)) (.node (.single ⟨14560,14592,30784,30816⟩) (.single ⟨14560,14592,30816,30848⟩))) (.node (.node (.single ⟨14464,14528,30848,30912⟩) (.single ⟨14464,14528,30912,30976⟩)) (.node (.single ⟨14528,14592,30848,30912⟩) (.single ⟨14528,14592,30912,30976⟩)))))) (.node (.node (.node (.node (.node (.single ⟨18176,18240,1792,1856⟩) (.single ⟨18176,18240,1856,1920⟩)) (.node (.single ⟨18240,18304,1792,1856⟩) (.single ⟨18240,18304,1856,1920⟩))) (.node (.node (.single ⟨18176,18208,1920,1952⟩) (.single ⟨18176,18208,1952,1984⟩)) (.node (.single ⟨18208,18240,1920,1952⟩) (.single ⟨18208,18240,1952,1984⟩)))) (.node (.node (.node (.single ⟨18176,18208,1984,2016⟩) (.single ⟨18176,18208,2016,2048⟩)) (.node (.single ⟨18208,18240,1984,2016⟩) (.single ⟨18208,18240,2016,2048⟩))) (.node (.node (.single ⟨18240,18304,1920,1984⟩) (.single ⟨18240,18304,1984,2048⟩)) (.node (.single ⟨18304,18432,1792,1920⟩) (.single ⟨18304,18432,1920,2048⟩))))) (.node (.node (.node (.node (.single ⟨30720,30848,14336,14464⟩) (.single ⟨30720,30784,14464,14528⟩)) (.node (.single ⟨30720,30752,14528,14560⟩) (.single ⟨30720,30752,14560,14592⟩))) (.node (.node (.single ⟨30752,30784,14528,14560⟩) (.single ⟨30752,30784,14560,14592⟩)) (.node (.single ⟨30784,30848,14464,14528⟩) (.single ⟨30784,30816,14528,14560⟩)))) (.node (.node (.node (.single ⟨30784,30816,14560,14592⟩) (.single ⟨30816,30848,14528,14560⟩)) (.node (.single ⟨30816,30848,14560,14592⟩) (.single ⟨30848,30976,14336,14464⟩))) (.node (.node (.single ⟨30848,30912,14464,14528⟩) (.single ⟨30848,30912,14528,14592⟩)) (.node (.single ⟨30912,30976,14464,14528⟩) (.single ⟨30912,30976,14528,14592⟩)))))))
def output29 : Fin 64 → GridBox := outputData29.get
def coverData29 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 46)) (.node (.single 59) (.single 17))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16)))) (.node (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31))) (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29))))) (.node (.node (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30))) (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28)))) (.node (.node (.node (.single 9) (.single 44)) (.node (.single 54) (.single 19))) (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18)))))) (.node (.node (.node (.node (.node (.single 5) (.single 36)) (.node (.single 58) (.single 27))) (.node (.node (.single 6) (.single 38)) (.node (.single 57) (.single 25)))) (.node (.node (.node (.single 7) (.single 37)) (.node (.single 56) (.single 26))) (.node (.node (.single 8) (.single 39)) (.node (.single 55) (.single 24))))) (.node (.node (.node (.node (.single 10) (.single 40)) (.node (.single 53) (.single 23))) (.node (.node (.single 11) (.single 42)) (.node (.single 52) (.single 21)))) (.node (.node (.node (.single 12) (.single 41)) (.node (.single 51) (.single 22))) (.node (.node (.single 13) (.single 43)) (.node (.single 50) (.single 20)))))))
def sourceData29 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.single 20))) (.node (.node (.single 0) (.single 32)) (.node (.single 36) (.single 40)))) (.node (.node (.node (.single 44) (.single 24)) (.node (.single 48) (.single 52))) (.node (.node (.single 56) (.single 60)) (.node (.single 28) (.single 4))))) (.node (.node (.node (.node (.single 7) (.single 3)) (.node (.single 31) (.single 27))) (.node (.node (.single 63) (.single 55)) (.node (.single 59) (.single 51)))) (.node (.node (.node (.single 47) (.single 39)) (.node (.single 43) (.single 35))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.single 21))) (.node (.node (.single 33) (.single 41)) (.node (.single 37) (.single 45)))) (.node (.node (.node (.single 49) (.single 57)) (.node (.single 53) (.single 61))) (.node (.node (.single 25) (.single 29)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.node (.single 6) (.single 30)) (.node (.single 62) (.single 58))) (.node (.node (.single 54) (.single 50)) (.node (.single 26) (.single 46)))) (.node (.node (.node (.single 42) (.single 38)) (.node (.single 34) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover29 (i : Fin 64) : Fin 64 := ⟨coverData29.get i % 64, Nat.mod_lt _ (by decide)⟩
def source29 (i : Fin 64) : Fin 64 := ⟨sourceData29.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree29 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 (.cutX 1024 .empty (.cutY 17408 .empty (.cutX 1536 .empty (.cutY 17920 .empty (.cutX 1792 .empty (.cutY 18176 .empty (.cutX 1920 (.cutY 18304 (.cutX 1856 (.cutY 18240 .full .full) (.cutY 18240 .full .full)) .full) (.cutY 18304 (.cutX 1984 (.cutY 18240 (.cutX 1952 (.cutY 18208 .full .full) (.cutY 18208 .full .full)) .full) (.cutY 18240 (.cutX 2016 (.cutY 18208 .full .full) (.cutY 18208 .full .full)) .full)) .full)))))))) .empty) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 .empty (.cutX 15360 (.cutY 31744 (.cutX 14848 (.cutY 31232 (.cutX 14592 (.cutY 30976 (.cutX 14464 (.cutY 30848 .full .full) (.cutY 30848 (.cutX 14528 (.cutY 30784 .full .full) (.cutY 30784 (.cutX 14560 (.cutY 30752 .full .full) (.cutY 30752 .full .full)) (.cutX 14560 (.cutY 30816 .full .full) (.cutY 30816 .full .full)))) (.cutX 14528 (.cutY 30912 .full .full) (.cutY 30912 .full .full)))) .empty) .empty) .empty) .empty) .empty) .empty)))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 (.cutX 17408 .empty (.cutY 1024 .empty (.cutX 17920 .empty (.cutY 1536 .empty (.cutX 18176 .empty (.cutY 1792 .empty (.cutX 18304 (.cutY 1920 (.cutX 18240 (.cutY 1856 .full .full) (.cutY 1856 .full .full)) (.cutX 18240 (.cutY 1984 (.cutX 18208 (.cutY 1952 .full .full) (.cutY 1952 .full .full)) (.cutX 18208 (.cutY 2016 .full .full) (.cutY 2016 .full .full))) (.cutY 1984 .full .full))) (.cutY 1920 .full .full)))))))) .empty) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 .empty (.cutX 31744 (.cutY 15360 (.cutX 31232 (.cutY 14848 (.cutX 30976 (.cutY 14592 (.cutX 30848 (.cutY 14464 .full (.cutX 30784 (.cutY 14528 .full (.cutX 30752 (.cutY 14560 .full .full) (.cutY 14560 .full .full))) (.cutY 14528 .full (.cutX 30816 (.cutY 14560 .full .full) (.cutY 14560 .full .full))))) (.cutY 14464 .full (.cutX 30912 (.cutY 14528 .full .full) (.cutY 14528 .full .full)))) .empty) .empty) .empty) .empty) .empty) .empty))))))) .empty))

theorem metadata29 : 0<114037843 ∧ 7<128 ∧ 71<128 ∧ 0<4 ∧
    918/4160=0 ∧ 918%4160=918 ∧ ∀ i, (leaves29 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData29).mp
    (by decide +kernel)

theorem sourceChecked29_0 : ∀ i : Fin 64,
    (fun i => output29 i = raw29 (source29 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked29 : ∀ i : Fin 64, (fun i => output29 i = raw29 (source29 i)) i :=
  forallFin_of_zero_offset (fun i => output29 i = raw29 (source29 i)) sourceChecked29_0

theorem coverChecked29_0 : ∀ i : Fin 64,
    (fun i => (output29 (cover29 i)).ContainsBox (raw29 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked29 : ∀ i : Fin 64, (fun i => (output29 (cover29 i)).ContainsBox (raw29 i)) i :=
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

noncomputable def phaseMass29 : ℝ := singlePhaseMass (114037843/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw29 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass29_eq : phaseMass29 = (114037843/1638400000000 : ℝ) := by
  unfold phaseMass29
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw29 output29 cover29 source29
    (gridTreeUnionCheck_sound 32768 raw29 output29 cover29 source29 tree29 checked29)
    _ (by norm_num) _, areaUnits29]
  norm_num

-- Frozen phase 5938, atom 6486, type 1, source (21,79).
def leavesData30 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves30 : Fin 13 → DyadicLeaf := leavesData30.get
def raw30 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 21 79 leaves30 i
def outputData30 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨5376,5440,20224,20288⟩) (.node (.single ⟨5376,5440,20288,20352⟩) (.single ⟨5440,5504,20224,20288⟩))) (.node (.single ⟨5440,5504,20288,20352⟩) (.node (.single ⟨5376,5504,20352,20480⟩) (.single ⟨5504,5568,20224,20288⟩)))) (.node (.node (.single ⟨5504,5568,20288,20352⟩) (.node (.single ⟨5568,5600,20224,20256⟩) (.single ⟨5568,5600,20256,20288⟩))) (.node (.node (.single ⟨5600,5632,20224,20256⟩) (.single ⟨5600,5632,20256,20288⟩)) (.node (.single ⟨5568,5632,20288,20352⟩) (.single ⟨5504,5632,20352,20480⟩))))) (.node (.node (.node (.single ⟨12288,12416,27136,27264⟩) (.node (.single ⟨12288,12416,27264,27392⟩) (.single ⟨12416,12480,27136,27200⟩))) (.node (.single ⟨12416,12480,27200,27264⟩) (.node (.single ⟨12480,12512,27136,27168⟩) (.single ⟨12480,12512,27168,27200⟩)))) (.node (.node (.single ⟨12512,12544,27136,27168⟩) (.node (.single ⟨12512,12544,27168,27200⟩) (.single ⟨12480,12544,27200,27264⟩))) (.node (.node (.single ⟨12416,12480,27264,27328⟩) (.single ⟨12416,12480,27328,27392⟩)) (.node (.single ⟨12480,12544,27264,27328⟩) (.single ⟨12480,12544,27328,27392⟩)))))) (.node (.node (.node (.node (.single ⟨20224,20288,5376,5440⟩) (.node (.single ⟨20224,20288,5440,5504⟩) (.single ⟨20288,20352,5376,5440⟩))) (.node (.single ⟨20288,20352,5440,5504⟩) (.node (.single ⟨20224,20288,5504,5568⟩) (.single ⟨20224,20256,5568,5600⟩)))) (.node (.node (.single ⟨20224,20256,5600,5632⟩) (.node (.single ⟨20256,20288,5568,5600⟩) (.single ⟨20256,20288,5600,5632⟩))) (.node (.node (.single ⟨20288,20352,5504,5568⟩) (.single ⟨20288,20352,5568,5632⟩)) (.node (.single ⟨20352,20480,5376,5504⟩) (.single ⟨20352,20480,5504,5632⟩))))) (.node (.node (.node (.single ⟨27136,27264,12288,12416⟩) (.node (.single ⟨27136,27200,12416,12480⟩) (.single ⟨27136,27168,12480,12512⟩))) (.node (.single ⟨27136,27168,12512,12544⟩) (.node (.single ⟨27168,27200,12480,12512⟩) (.single ⟨27168,27200,12512,12544⟩)))) (.node (.node (.single ⟨27200,27264,12416,12480⟩) (.node (.single ⟨27200,27264,12480,12544⟩) (.single ⟨27264,27392,12288,12416⟩))) (.node (.node (.single ⟨27264,27328,12416,12480⟩) (.single ⟨27264,27328,12480,12544⟩)) (.node (.single ⟨27328,27392,12416,12480⟩) (.single ⟨27328,27392,12480,12544⟩)))))))
def output30 : Fin 52 → GridBox := outputData30.get
def coverData30 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData30 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover30 (i : Fin 52) : Fin 52 := ⟨coverData30.get i % 52, Nat.mod_lt _ (by decide)⟩
def source30 (i : Fin 52) : Fin 52 := ⟨sourceData30.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree30 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 .empty (.cutX 5120 .empty (.cutY 19456 .empty (.cutX 5632 (.cutY 19968 .empty (.cutX 5376 .empty (.cutY 20224 .empty (.cutX 5504 (.cutY 20352 (.cutX 5440 (.cutY 20288 .full .full) (.cutY 20288 .full .full)) .full) (.cutY 20352 (.cutX 5568 (.cutY 20288 .full .full) (.cutY 20288 (.cutX 5600 (.cutY 20256 .full .full) (.cutY 20256 .full .full)) .full)) .full))))) .empty)))) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 .empty (.cutX 13312 (.cutY 27648 (.cutX 12800 (.cutY 27136 .empty (.cutX 12544 (.cutY 27392 (.cutX 12416 (.cutY 27264 .full .full) (.cutY 27264 (.cutX 12480 (.cutY 27200 .full .full) (.cutY 27200 (.cutX 12512 (.cutY 27168 .full .full) (.cutY 27168 .full .full)) .full)) (.cutX 12480 (.cutY 27328 .full .full) (.cutY 27328 .full .full)))) .empty) .empty)) .empty) .empty) .empty)) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 (.cutX 19456 .empty (.cutY 5120 .empty (.cutX 19968 .empty (.cutY 5632 (.cutX 20224 .empty (.cutY 5376 .empty (.cutX 20352 (.cutY 5504 (.cutX 20288 (.cutY 5440 .full .full) (.cutY 5440 .full .full)) (.cutX 20288 (.cutY 5568 .full (.cutX 20256 (.cutY 5600 .full .full) (.cutY 5600 .full .full))) (.cutY 5568 .full .full))) (.cutY 5504 .full .full)))) .empty)))) .empty))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 (.cutX 27648 (.cutY 13312 (.cutX 27136 .empty (.cutY 12800 (.cutX 27392 (.cutY 12544 (.cutX 27264 (.cutY 12416 .full (.cutX 27200 (.cutY 12480 .full (.cutX 27168 (.cutY 12512 .full .full) (.cutY 12512 .full .full))) (.cutY 12480 .full .full))) (.cutY 12416 .full (.cutX 27328 (.cutY 12480 .full .full) (.cutY 12480 .full .full)))) .empty) .empty) .empty)) .empty) .empty) .empty))) .empty))) .empty))

theorem metadata30 : 0<157738472 ∧ 21<128 ∧ 79<128 ∧ 1<4 ∧
    6486/4160=1 ∧ 6486%4160=2326 ∧ ∀ i, (leaves30 i).Valid 8 := by
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

noncomputable def phaseMass30 : ℝ := singlePhaseMass (157738472/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw30 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass30_eq : phaseMass30 = (19717309/204800000000 : ℝ) := by
  unfold phaseMass30
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw30 output30 cover30 source30
    (gridTreeUnionCheck_sound 32768 raw30 output30 cover30 source30 tree30 checked30)
    _ (by norm_num) _, areaUnits30]
  norm_num

-- Frozen phase 5939, atom 6123, type 1, source (17,76).
def leavesData31 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves31 : Fin 7 → DyadicLeaf := leavesData31.get
def raw31 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 17 76 leaves31 i
def outputData31 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨4352,4480,19456,19584⟩) (.node (.single ⟨4352,4480,19584,19712⟩) (.single ⟨4480,4544,19456,19520⟩))) (.node (.node (.single ⟨4480,4544,19520,19584⟩) (.single ⟨4544,4608,19456,19520⟩)) (.node (.single ⟨4544,4608,19520,19584⟩) (.single ⟨4480,4608,19584,19712⟩)))) (.node (.node (.single ⟨13056,13184,28160,28288⟩) (.node (.single ⟨13056,13184,28288,28416⟩) (.single ⟨13184,13248,28160,28224⟩))) (.node (.node (.single ⟨13184,13248,28224,28288⟩) (.single ⟨13248,13312,28160,28224⟩)) (.node (.single ⟨13248,13312,28224,28288⟩) (.single ⟨13184,13312,28288,28416⟩))))) (.node (.node (.node (.single ⟨19456,19584,4352,4480⟩) (.node (.single ⟨19456,19520,4480,4544⟩) (.single ⟨19456,19520,4544,4608⟩))) (.node (.node (.single ⟨19520,19584,4480,4544⟩) (.single ⟨19520,19584,4544,4608⟩)) (.node (.single ⟨19584,19712,4352,4480⟩) (.single ⟨19584,19712,4480,4608⟩)))) (.node (.node (.single ⟨28160,28288,13056,13184⟩) (.node (.single ⟨28160,28224,13184,13248⟩) (.single ⟨28160,28224,13248,13312⟩))) (.node (.node (.single ⟨28224,28288,13184,13248⟩) (.single ⟨28224,28288,13248,13312⟩)) (.node (.single ⟨28288,28416,13056,13184⟩) (.single ⟨28288,28416,13184,13312⟩))))))
def output31 : Fin 28 → GridBox := outputData31.get
def coverData31 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData31 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover31 (i : Fin 28) : Fin 28 := ⟨coverData31.get i % 28, Nat.mod_lt _ (by decide)⟩
def source31 (i : Fin 28) : Fin 28 := ⟨sourceData31.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree31 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 .empty (.cutX 5120 (.cutY 19456 .empty (.cutX 4608 (.cutY 19968 (.cutX 4352 .empty (.cutY 19712 (.cutX 4480 (.cutY 19584 .full .full) (.cutY 19584 (.cutX 4544 (.cutY 19520 .full .full) (.cutY 19520 .full .full)) .full)) .empty)) .empty) .empty)) .empty)) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 .empty (.cutX 13312 (.cutY 27648 .empty (.cutX 12800 .empty (.cutY 28160 .empty (.cutX 13056 .empty (.cutY 28416 (.cutX 13184 (.cutY 28288 .full .full) (.cutY 28288 (.cutX 13248 (.cutY 28224 .full .full) (.cutY 28224 .full .full)) .full)) .empty))))) .empty)) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 (.cutX 19456 .empty (.cutY 5120 (.cutX 19968 (.cutY 4608 (.cutX 19712 (.cutY 4352 .empty (.cutX 19584 (.cutY 4480 .full (.cutX 19520 (.cutY 4544 .full .full) (.cutY 4544 .full .full))) (.cutY 4480 .full .full))) .empty) .empty) .empty) .empty)) .empty))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 (.cutX 27648 .empty (.cutY 13312 (.cutX 28160 .empty (.cutY 12800 .empty (.cutX 28416 (.cutY 13056 .empty (.cutX 28288 (.cutY 13184 .full (.cutX 28224 (.cutY 13248 .full .full) (.cutY 13248 .full .full))) (.cutY 13184 .full .full))) .empty))) .empty)) .empty))) .empty))) .empty))

theorem metadata31 : 0<157738472 ∧ 17<128 ∧ 76<128 ∧ 1<4 ∧
    6123/4160=1 ∧ 6123%4160=1963 ∧ ∀ i, (leaves31 i).Valid 8 := by
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

noncomputable def phaseMass31 : ℝ := singlePhaseMass (157738472/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw31 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass31_eq : phaseMass31 = (19717309/204800000000 : ℝ) := by
  unfold phaseMass31
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw31 output31 cover31 source31
    (gridTreeUnionCheck_sound 32768 raw31 output31 cover31 source31 tree31 checked31)
    _ (by norm_num) _, areaUnits31]
  norm_num

-- Frozen phase 5940, atom 6027, type 1, source (16,75).
def leavesData32 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,2,2⟩)))) (.node (.node (.single ⟨2,2,3⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves32 : Fin 13 → DyadicLeaf := leavesData32.get
def raw32 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 16 75 leaves32 i
def outputData32 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨4096,4224,19200,19328⟩) (.node (.single ⟨4096,4224,19328,19456⟩) (.single ⟨4224,4288,19200,19264⟩))) (.node (.single ⟨4224,4288,19264,19328⟩) (.node (.single ⟨4288,4320,19200,19232⟩) (.single ⟨4288,4320,19232,19264⟩)))) (.node (.node (.single ⟨4320,4352,19200,19232⟩) (.node (.single ⟨4320,4352,19232,19264⟩) (.single ⟨4288,4352,19264,19328⟩))) (.node (.node (.single ⟨4224,4288,19328,19392⟩) (.single ⟨4224,4288,19392,19456⟩)) (.node (.single ⟨4288,4352,19328,19392⟩) (.single ⟨4288,4352,19392,19456⟩))))) (.node (.node (.node (.single ⟨13312,13376,28416,28480⟩) (.node (.single ⟨13312,13376,28480,28544⟩) (.single ⟨13376,13440,28416,28480⟩))) (.node (.single ⟨13376,13440,28480,28544⟩) (.node (.single ⟨13312,13440,28544,28672⟩) (.single ⟨13440,13504,28416,28480⟩)))) (.node (.node (.single ⟨13440,13504,28480,28544⟩) (.node (.single ⟨13504,13536,28416,28448⟩) (.single ⟨13504,13536,28448,28480⟩))) (.node (.node (.single ⟨13536,13568,28416,28448⟩) (.single ⟨13536,13568,28448,28480⟩)) (.node (.single ⟨13504,13568,28480,28544⟩) (.single ⟨13440,13568,28544,28672⟩)))))) (.node (.node (.node (.node (.single ⟨19200,19328,4096,4224⟩) (.node (.single ⟨19200,19264,4224,4288⟩) (.single ⟨19200,19232,4288,4320⟩))) (.node (.single ⟨19200,19232,4320,4352⟩) (.node (.single ⟨19232,19264,4288,4320⟩) (.single ⟨19232,19264,4320,4352⟩)))) (.node (.node (.single ⟨19264,19328,4224,4288⟩) (.node (.single ⟨19264,19328,4288,4352⟩) (.single ⟨19328,19456,4096,4224⟩))) (.node (.node (.single ⟨19328,19392,4224,4288⟩) (.single ⟨19328,19392,4288,4352⟩)) (.node (.single ⟨19392,19456,4224,4288⟩) (.single ⟨19392,19456,4288,4352⟩))))) (.node (.node (.node (.single ⟨28416,28480,13312,13376⟩) (.node (.single ⟨28416,28480,13376,13440⟩) (.single ⟨28480,28544,13312,13376⟩))) (.node (.single ⟨28480,28544,13376,13440⟩) (.node (.single ⟨28416,28480,13440,13504⟩) (.single ⟨28416,28448,13504,13536⟩)))) (.node (.node (.single ⟨28416,28448,13536,13568⟩) (.node (.single ⟨28448,28480,13504,13536⟩) (.single ⟨28448,28480,13536,13568⟩))) (.node (.node (.single ⟨28480,28544,13440,13504⟩) (.single ⟨28480,28544,13504,13568⟩)) (.node (.single ⟨28544,28672,13312,13440⟩) (.single ⟨28544,28672,13440,13568⟩)))))))
def output32 : Fin 52 → GridBox := outputData32.get
def coverData32 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 0) (.node (.single 26) (.single 51))) (.node (.single 25) (.node (.single 1) (.single 34)))) (.node (.node (.single 50) (.node (.single 17) (.single 2))) (.node (.node (.single 27) (.single 49)) (.node (.single 24) (.single 3))))) (.node (.node (.node (.single 32) (.node (.single 48) (.single 19))) (.node (.single 8) (.node (.single 33) (.single 43)))) (.node (.node (.single 18) (.node (.single 9) (.single 35))) (.node (.node (.single 42) (.single 16)) (.node (.single 10) (.single 37)))))) (.node (.node (.node (.node (.single 41) (.node (.single 14) (.single 11))) (.node (.single 36) (.node (.single 40) (.single 15)))) (.node (.node (.single 12) (.node (.single 38) (.single 39))) (.node (.node (.single 13) (.single 4)) (.node (.single 28) (.single 47))))) (.node (.node (.node (.single 23) (.node (.single 5) (.single 30))) (.node (.single 46) (.node (.single 21) (.single 6)))) (.node (.node (.single 29) (.node (.single 45) (.single 22))) (.node (.node (.single 7) (.single 31)) (.node (.single 44) (.single 20)))))))
def sourceData32 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 8))) (.node (.single 12) (.node (.single 36) (.single 40)))) (.node (.node (.single 44) (.node (.single 48) (.single 16))) (.node (.node (.single 20) (.single 24)) (.node (.single 28) (.single 32))))) (.node (.node (.node (.single 35) (.node (.single 27) (.single 31))) (.node (.single 23) (.node (.single 7) (.single 19)))) (.node (.node (.single 15) (.node (.single 51) (.single 43))) (.node (.node (.single 47) (.single 39)) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.node (.single 9) (.single 37))) (.node (.single 45) (.node (.single 41) (.single 49)))) (.node (.node (.single 13) (.node (.single 17) (.single 5))) (.node (.node (.single 21) (.single 29)) (.node (.single 25) (.single 33))))) (.node (.node (.node (.single 34) (.node (.single 30) (.single 26))) (.node (.single 22) (.node (.single 18) (.single 50)))) (.node (.node (.single 46) (.node (.single 42) (.single 38))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))))
def cover32 (i : Fin 52) : Fin 52 := ⟨coverData32.get i % 52, Nat.mod_lt _ (by decide)⟩
def source32 (i : Fin 52) : Fin 52 := ⟨sourceData32.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree32 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 .empty (.cutX 5120 (.cutY 19456 (.cutX 4608 (.cutY 18944 .empty (.cutX 4352 (.cutY 19200 .empty (.cutX 4224 (.cutY 19328 .full .full) (.cutY 19328 (.cutX 4288 (.cutY 19264 .full .full) (.cutY 19264 (.cutX 4320 (.cutY 19232 .full .full) (.cutY 19232 .full .full)) .full)) (.cutX 4288 (.cutY 19392 .full .full) (.cutY 19392 .full .full))))) .empty)) .empty) .empty) .empty)) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 .empty (.cutX 13312 .empty (.cutY 27648 .empty (.cutX 13824 (.cutY 28160 .empty (.cutX 13568 (.cutY 28416 .empty (.cutX 13440 (.cutY 28544 (.cutX 13376 (.cutY 28480 .full .full) (.cutY 28480 .full .full)) .full) (.cutY 28544 (.cutX 13504 (.cutY 28480 .full .full) (.cutY 28480 (.cutX 13536 (.cutY 28448 .full .full) (.cutY 28448 .full .full)) .full)) .full))) .empty)) .empty)))) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 (.cutX 19456 (.cutY 5120 (.cutX 18944 .empty (.cutY 4608 (.cutX 19200 .empty (.cutY 4352 (.cutX 19328 (.cutY 4224 .full (.cutX 19264 (.cutY 4288 .full (.cutX 19232 (.cutY 4320 .full .full) (.cutY 4320 .full .full))) (.cutY 4288 .full .full))) (.cutY 4224 .full (.cutX 19392 (.cutY 4288 .full .full) (.cutY 4288 .full .full)))) .empty)) .empty)) .empty) .empty) .empty))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 (.cutX 27648 .empty (.cutY 13312 .empty (.cutX 28160 .empty (.cutY 13824 (.cutX 28416 .empty (.cutY 13568 (.cutX 28544 (.cutY 13440 (.cutX 28480 (.cutY 13376 .full .full) (.cutY 13376 .full .full)) (.cutX 28480 (.cutY 13504 .full (.cutX 28448 (.cutY 13536 .full .full) (.cutY 13536 .full .full))) (.cutY 13504 .full .full))) (.cutY 13440 .full .full)) .empty)) .empty)))) .empty))) .empty))) .empty))

theorem metadata32 : 0<157738472 ∧ 16<128 ∧ 75<128 ∧ 1<4 ∧
    6027/4160=1 ∧ 6027%4160=1867 ∧ ∀ i, (leaves32 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData32).mp
    (by decide +kernel)

theorem sourceChecked32_0 : ∀ i : Fin 52,
    (fun i => output32 i = raw32 (source32 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked32 : ∀ i : Fin 52, (fun i => output32 i = raw32 (source32 i)) i :=
  forallFin_of_zero_offset (fun i => output32 i = raw32 (source32 i)) sourceChecked32_0

theorem coverChecked32_0 : ∀ i : Fin 52,
    (fun i => (output32 (cover32 i)).ContainsBox (raw32 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked32 : ∀ i : Fin 52, (fun i => (output32 (cover32 i)).ContainsBox (raw32 i)) i :=
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

noncomputable def phaseMass32 : ℝ := singlePhaseMass (157738472/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw32 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass32_eq : phaseMass32 = (19717309/204800000000 : ℝ) := by
  unfold phaseMass32
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw32 output32 cover32 source32
    (gridTreeUnionCheck_sound 32768 raw32 output32 cover32 source32 tree32 checked32)
    _ (by norm_num) _, areaUnits32]
  norm_num

-- Frozen phase 5941, atom 5929, type 1, source (15,74).
def leavesData33 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves33 : Fin 7 → DyadicLeaf := leavesData33.get
def raw33 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 15 74 leaves33 i
def outputData33 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3840,3968,18944,19072⟩) (.node (.single ⟨3840,3968,19072,19200⟩) (.single ⟨3968,4032,18944,19008⟩))) (.node (.node (.single ⟨3968,4032,19008,19072⟩) (.single ⟨4032,4096,18944,19008⟩)) (.node (.single ⟨4032,4096,19008,19072⟩) (.single ⟨3968,4096,19072,19200⟩)))) (.node (.node (.single ⟨13568,13696,28672,28800⟩) (.node (.single ⟨13568,13696,28800,28928⟩) (.single ⟨13696,13760,28672,28736⟩))) (.node (.node (.single ⟨13696,13760,28736,28800⟩) (.single ⟨13760,13824,28672,28736⟩)) (.node (.single ⟨13760,13824,28736,28800⟩) (.single ⟨13696,13824,28800,28928⟩))))) (.node (.node (.node (.single ⟨18944,19072,3840,3968⟩) (.node (.single ⟨18944,19008,3968,4032⟩) (.single ⟨18944,19008,4032,4096⟩))) (.node (.node (.single ⟨19008,19072,3968,4032⟩) (.single ⟨19008,19072,4032,4096⟩)) (.node (.single ⟨19072,19200,3840,3968⟩) (.single ⟨19072,19200,3968,4096⟩)))) (.node (.node (.single ⟨28672,28800,13568,13696⟩) (.node (.single ⟨28672,28736,13696,13760⟩) (.single ⟨28672,28736,13760,13824⟩))) (.node (.node (.single ⟨28736,28800,13696,13760⟩) (.single ⟨28736,28800,13760,13824⟩)) (.node (.single ⟨28800,28928,13568,13696⟩) (.single ⟨28800,28928,13696,13824⟩))))))
def output33 : Fin 28 → GridBox := outputData33.get
def coverData33 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData33 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover33 (i : Fin 28) : Fin 28 := ⟨coverData33.get i % 28, Nat.mod_lt _ (by decide)⟩
def source33 (i : Fin 28) : Fin 28 := ⟨sourceData33.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree33 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 .empty (.cutY 19456 (.cutX 3584 .empty (.cutY 18944 .empty (.cutX 3840 .empty (.cutY 19200 (.cutX 3968 (.cutY 19072 .full .full) (.cutY 19072 (.cutX 4032 (.cutY 19008 .full .full) (.cutY 19008 .full .full)) .full)) .empty)))) .empty)))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 .empty (.cutY 29696 (.cutX 13824 (.cutY 29184 (.cutX 13568 .empty (.cutY 28928 (.cutX 13696 (.cutY 28800 .full .full) (.cutY 28800 (.cutX 13760 (.cutY 28736 .full .full) (.cutY 28736 .full .full)) .full)) .empty)) .empty) .empty) .empty)) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 (.cutY 3072 .empty (.cutX 18944 .empty (.cutY 3584 .empty (.cutX 19200 (.cutY 3840 .empty (.cutX 19072 (.cutY 3968 .full (.cutX 19008 (.cutY 4032 .full .full) (.cutY 4032 .full .full))) (.cutY 3968 .full .full))) .empty)))) .empty))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 (.cutY 13312 .empty (.cutX 29184 (.cutY 13824 (.cutX 28928 (.cutY 13568 .empty (.cutX 28800 (.cutY 13696 .full (.cutX 28736 (.cutY 13760 .full .full) (.cutY 13760 .full .full))) (.cutY 13696 .full .full))) .empty) .empty) .empty)) .empty) .empty) .empty))))) .empty))

theorem metadata33 : 0<94387549 ∧ 15<128 ∧ 74<128 ∧ 1<4 ∧
    5929/4160=1 ∧ 5929%4160=1769 ∧ ∀ i, (leaves33 i).Valid 8 := by
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

noncomputable def phaseMass33 : ℝ := singlePhaseMass (94387549/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw33 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass33_eq : phaseMass33 = (94387549/1638400000000 : ℝ) := by
  unfold phaseMass33
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw33 output33 cover33 source33
    (gridTreeUnionCheck_sound 32768 raw33 output33 cover33 source33 tree33 checked33)
    _ (by norm_num) _, areaUnits33]
  norm_num

-- Frozen phase 5942, atom 5518, type 1, source (11,71).
def leavesData34 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,0⟩))) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves34 : Fin 13 → DyadicLeaf := leavesData34.get
def raw34 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 11 71 leaves34 i
def outputData34 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨2816,2880,18176,18240⟩) (.node (.single ⟨2816,2880,18240,18304⟩) (.single ⟨2880,2944,18176,18240⟩))) (.node (.single ⟨2880,2944,18240,18304⟩) (.node (.single ⟨2816,2944,18304,18432⟩) (.single ⟨2944,3008,18176,18240⟩)))) (.node (.node (.single ⟨2944,3008,18240,18304⟩) (.node (.single ⟨3008,3040,18176,18208⟩) (.single ⟨3008,3040,18208,18240⟩))) (.node (.node (.single ⟨3040,3072,18176,18208⟩) (.single ⟨3040,3072,18208,18240⟩)) (.node (.single ⟨3008,3072,18240,18304⟩) (.single ⟨2944,3072,18304,18432⟩))))) (.node (.node (.node (.single ⟨14336,14464,29696,29824⟩) (.node (.single ⟨14336,14464,29824,29952⟩) (.single ⟨14464,14528,29696,29760⟩))) (.node (.single ⟨14464,14528,29760,29824⟩) (.node (.single ⟨14528,14560,29696,29728⟩) (.single ⟨14528,14560,29728,29760⟩)))) (.node (.node (.single ⟨14560,14592,29696,29728⟩) (.node (.single ⟨14560,14592,29728,29760⟩) (.single ⟨14528,14592,29760,29824⟩))) (.node (.node (.single ⟨14464,14528,29824,29888⟩) (.single ⟨14464,14528,29888,29952⟩)) (.node (.single ⟨14528,14592,29824,29888⟩) (.single ⟨14528,14592,29888,29952⟩)))))) (.node (.node (.node (.node (.single ⟨18176,18240,2816,2880⟩) (.node (.single ⟨18176,18240,2880,2944⟩) (.single ⟨18240,18304,2816,2880⟩))) (.node (.single ⟨18240,18304,2880,2944⟩) (.node (.single ⟨18176,18240,2944,3008⟩) (.single ⟨18176,18208,3008,3040⟩)))) (.node (.node (.single ⟨18176,18208,3040,3072⟩) (.node (.single ⟨18208,18240,3008,3040⟩) (.single ⟨18208,18240,3040,3072⟩))) (.node (.node (.single ⟨18240,18304,2944,3008⟩) (.single ⟨18240,18304,3008,3072⟩)) (.node (.single ⟨18304,18432,2816,2944⟩) (.single ⟨18304,18432,2944,3072⟩))))) (.node (.node (.node (.single ⟨29696,29824,14336,14464⟩) (.node (.single ⟨29696,29760,14464,14528⟩) (.single ⟨29696,29728,14528,14560⟩))) (.node (.single ⟨29696,29728,14560,14592⟩) (.node (.single ⟨29728,29760,14528,14560⟩) (.single ⟨29728,29760,14560,14592⟩)))) (.node (.node (.single ⟨29760,29824,14464,14528⟩) (.node (.single ⟨29760,29824,14528,14592⟩) (.single ⟨29824,29952,14336,14464⟩))) (.node (.node (.single ⟨29824,29888,14464,14528⟩) (.single ⟨29824,29888,14528,14592⟩)) (.node (.single ⟨29888,29952,14464,14528⟩) (.single ⟨29888,29952,14528,14592⟩)))))))
def output34 : Fin 52 → GridBox := outputData34.get
def coverData34 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 0))) (.node (.node (.single 26) (.single 51)) (.node (.single 25) (.single 1))))) (.node (.node (.node (.single 28) (.node (.single 50) (.single 23))) (.node (.single 2) (.node (.single 27) (.single 49)))) (.node (.node (.single 24) (.node (.single 3) (.single 29))) (.node (.node (.single 48) (.single 22)) (.node (.single 5) (.single 30)))))) (.node (.node (.node (.node (.single 46) (.node (.single 21) (.single 6))) (.node (.single 35) (.node (.single 45) (.single 16)))) (.node (.node (.single 11) (.node (.single 36) (.single 40))) (.node (.node (.single 15) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData34 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.single 20) (.node (.single 0) (.single 24)))) (.node (.node (.single 28) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 35))) (.node (.single 31) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.node (.single 17) (.single 13))) (.node (.single 21) (.node (.single 25) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 34) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 30) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover34 (i : Fin 52) : Fin 52 := ⟨coverData34.get i % 52, Nat.mod_lt _ (by decide)⟩
def source34 (i : Fin 52) : Fin 52 := ⟨sourceData34.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree34 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 (.cutX 3072 (.cutY 17408 .empty (.cutX 2560 .empty (.cutY 17920 .empty (.cutX 2816 .empty (.cutY 18176 .empty (.cutX 2944 (.cutY 18304 (.cutX 2880 (.cutY 18240 .full .full) (.cutY 18240 .full .full)) .full) (.cutY 18304 (.cutX 3008 (.cutY 18240 .full .full) (.cutY 18240 (.cutX 3040 (.cutY 18208 .full .full) (.cutY 18208 .full .full)) .full)) .full))))))) .empty) .empty)) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 (.cutX 15360 (.cutY 29696 .empty (.cutX 14848 (.cutY 30208 (.cutX 14592 (.cutY 29952 (.cutX 14464 (.cutY 29824 .full .full) (.cutY 29824 (.cutX 14528 (.cutY 29760 .full .full) (.cutY 29760 (.cutX 14560 (.cutY 29728 .full .full) (.cutY 29728 .full .full)) .full)) (.cutX 14528 (.cutY 29888 .full .full) (.cutY 29888 .full .full)))) .empty) .empty) .empty) .empty)) .empty) .empty))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 .empty (.cutX 17408 .empty (.cutY 3072 (.cutX 17920 .empty (.cutY 2560 .empty (.cutX 18176 .empty (.cutY 2816 .empty (.cutX 18304 (.cutY 2944 (.cutX 18240 (.cutY 2880 .full .full) (.cutY 2880 .full .full)) (.cutX 18240 (.cutY 3008 .full (.cutX 18208 (.cutY 3040 .full .full) (.cutY 3040 .full .full))) (.cutY 3008 .full .full))) (.cutY 2944 .full .full)))))) .empty))) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 .empty (.cutX 29696 .empty (.cutY 15360 (.cutX 30208 (.cutY 14848 (.cutX 29952 (.cutY 14592 (.cutX 29824 (.cutY 14464 .full (.cutX 29760 (.cutY 14528 .full (.cutX 29728 (.cutY 14560 .full .full) (.cutY 14560 .full .full))) (.cutY 14528 .full .full))) (.cutY 14464 .full (.cutX 29888 (.cutY 14528 .full .full) (.cutY 14528 .full .full)))) .empty) .empty) .empty) .empty) .empty))) .empty))))) .empty))

theorem metadata34 : 0<135229957 ∧ 11<128 ∧ 71<128 ∧ 1<4 ∧
    5518/4160=1 ∧ 5518%4160=1358 ∧ ∀ i, (leaves34 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData34).mp
    (by decide +kernel)

theorem sourceChecked34_0 : ∀ i : Fin 52,
    (fun i => output34 i = raw34 (source34 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked34 : ∀ i : Fin 52, (fun i => output34 i = raw34 (source34 i)) i :=
  forallFin_of_zero_offset (fun i => output34 i = raw34 (source34 i)) sourceChecked34_0

theorem coverChecked34_0 : ∀ i : Fin 52,
    (fun i => (output34 (cover34 i)).ContainsBox (raw34 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked34 : ∀ i : Fin 52, (fun i => (output34 (cover34 i)).ContainsBox (raw34 i)) i :=
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

noncomputable def phaseMass34 : ℝ := singlePhaseMass (135229957/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw34 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass34_eq : phaseMass34 = (135229957/1638400000000 : ℝ) := by
  unfold phaseMass34
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw34 output34 cover34 source34
    (gridTreeUnionCheck_sound 32768 raw34 output34 cover34 source34 tree34 checked34)
    _ (by norm_num) _, areaUnits34]
  norm_num

-- Frozen phase 5943, atom 3096, type 0, source (31,89).
def leavesData35 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,0⟩))) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves35 : Fin 13 → DyadicLeaf := leavesData35.get
def raw35 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 31 89 leaves35 i
def outputData35 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨7936,8000,22784,22848⟩) (.node (.single ⟨7936,8000,22848,22912⟩) (.single ⟨8000,8064,22784,22848⟩))) (.node (.single ⟨8000,8064,22848,22912⟩) (.node (.single ⟨7936,8064,22912,23040⟩) (.single ⟨8064,8128,22784,22848⟩)))) (.node (.node (.single ⟨8064,8128,22848,22912⟩) (.node (.single ⟨8128,8160,22784,22816⟩) (.single ⟨8128,8160,22816,22848⟩))) (.node (.node (.single ⟨8160,8192,22784,22816⟩) (.single ⟨8160,8192,22816,22848⟩)) (.node (.single ⟨8128,8192,22848,22912⟩) (.single ⟨8064,8192,22912,23040⟩))))) (.node (.node (.node (.single ⟨9728,9856,24576,24704⟩) (.node (.single ⟨9728,9856,24704,24832⟩) (.single ⟨9856,9920,24576,24640⟩))) (.node (.single ⟨9856,9920,24640,24704⟩) (.node (.single ⟨9920,9952,24576,24608⟩) (.single ⟨9920,9952,24608,24640⟩)))) (.node (.node (.single ⟨9952,9984,24576,24608⟩) (.node (.single ⟨9952,9984,24608,24640⟩) (.single ⟨9920,9984,24640,24704⟩))) (.node (.node (.single ⟨9856,9920,24704,24768⟩) (.single ⟨9856,9920,24768,24832⟩)) (.node (.single ⟨9920,9984,24704,24768⟩) (.single ⟨9920,9984,24768,24832⟩)))))) (.node (.node (.node (.node (.single ⟨22784,22848,7936,8000⟩) (.node (.single ⟨22784,22848,8000,8064⟩) (.single ⟨22848,22912,7936,8000⟩))) (.node (.single ⟨22848,22912,8000,8064⟩) (.node (.single ⟨22784,22848,8064,8128⟩) (.single ⟨22784,22816,8128,8160⟩)))) (.node (.node (.single ⟨22784,22816,8160,8192⟩) (.node (.single ⟨22816,22848,8128,8160⟩) (.single ⟨22816,22848,8160,8192⟩))) (.node (.node (.single ⟨22848,22912,8064,8128⟩) (.single ⟨22848,22912,8128,8192⟩)) (.node (.single ⟨22912,23040,7936,8064⟩) (.single ⟨22912,23040,8064,8192⟩))))) (.node (.node (.node (.single ⟨24576,24704,9728,9856⟩) (.node (.single ⟨24576,24640,9856,9920⟩) (.single ⟨24576,24608,9920,9952⟩))) (.node (.single ⟨24576,24608,9952,9984⟩) (.node (.single ⟨24608,24640,9920,9952⟩) (.single ⟨24608,24640,9952,9984⟩)))) (.node (.node (.single ⟨24640,24704,9856,9920⟩) (.node (.single ⟨24640,24704,9920,9984⟩) (.single ⟨24704,24832,9728,9856⟩))) (.node (.node (.single ⟨24704,24768,9856,9920⟩) (.single ⟨24704,24768,9920,9984⟩)) (.node (.single ⟨24768,24832,9856,9920⟩) (.single ⟨24768,24832,9920,9984⟩)))))))
def output35 : Fin 52 → GridBox := outputData35.get
def coverData35 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 0))) (.node (.node (.single 26) (.single 51)) (.node (.single 25) (.single 1))))) (.node (.node (.node (.single 28) (.node (.single 50) (.single 23))) (.node (.single 2) (.node (.single 27) (.single 49)))) (.node (.node (.single 24) (.node (.single 3) (.single 29))) (.node (.node (.single 48) (.single 22)) (.node (.single 5) (.single 30)))))) (.node (.node (.node (.node (.single 46) (.node (.single 21) (.single 6))) (.node (.single 35) (.node (.single 45) (.single 16)))) (.node (.node (.single 11) (.node (.single 36) (.single 40))) (.node (.node (.single 15) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData35 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.single 20) (.node (.single 0) (.single 24)))) (.node (.node (.single 28) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 35))) (.node (.single 31) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.node (.single 17) (.single 13))) (.node (.single 21) (.node (.single 25) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 34) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 30) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover35 (i : Fin 52) : Fin 52 := ⟨coverData35.get i % 52, Nat.mod_lt _ (by decide)⟩
def source35 (i : Fin 52) : Fin 52 := ⟨sourceData35.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree35 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 .empty (.cutX 7168 .empty (.cutY 23552 (.cutX 7680 .empty (.cutY 23040 (.cutX 7936 .empty (.cutY 22784 .empty (.cutX 8064 (.cutY 22912 (.cutX 8000 (.cutY 22848 .full .full) (.cutY 22848 .full .full)) .full) (.cutY 22912 (.cutX 8128 (.cutY 22848 .full .full) (.cutY 22848 (.cutX 8160 (.cutY 22816 .full .full) (.cutY 22816 .full .full)) .full)) .full)))) .empty)) .empty)))))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 (.cutX 9216 .empty (.cutY 25600 (.cutX 9728 .empty (.cutY 25088 (.cutX 9984 (.cutY 24832 (.cutX 9856 (.cutY 24704 .full .full) (.cutY 24704 (.cutX 9920 (.cutY 24640 .full .full) (.cutY 24640 (.cutX 9952 (.cutY 24608 .full .full) (.cutY 24608 .full .full)) .full)) (.cutX 9920 (.cutY 24768 .full .full) (.cutY 24768 .full .full)))) .empty) .empty) .empty)) .empty)) .empty) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 .empty (.cutX 23552 (.cutY 7168 .empty (.cutX 23040 (.cutY 7680 .empty (.cutX 22784 .empty (.cutY 7936 .empty (.cutX 22912 (.cutY 8064 (.cutX 22848 (.cutY 8000 .full .full) (.cutY 8000 .full .full)) (.cutX 22848 (.cutY 8128 .full (.cutX 22816 (.cutY 8160 .full .full) (.cutY 8160 .full .full))) (.cutY 8128 .full .full))) (.cutY 8064 .full .full))))) .empty)) .empty))))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 (.cutX 25600 (.cutY 9216 .empty (.cutX 25088 (.cutY 9728 .empty (.cutX 24832 (.cutY 9984 (.cutX 24704 (.cutY 9856 .full (.cutX 24640 (.cutY 9920 .full (.cutX 24608 (.cutY 9952 .full .full) (.cutY 9952 .full .full))) (.cutY 9920 .full .full))) (.cutY 9856 .full (.cutX 24768 (.cutY 9920 .full .full) (.cutY 9920 .full .full)))) .empty) .empty)) .empty)) .empty) .empty) .empty) .empty) .empty))) .empty))

theorem metadata35 : 0<145899414 ∧ 31<128 ∧ 89<128 ∧ 0<4 ∧
    3096/4160=0 ∧ 3096%4160=3096 ∧ ∀ i, (leaves35 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData35).mp
    (by decide +kernel)

theorem sourceChecked35_0 : ∀ i : Fin 52,
    (fun i => output35 i = raw35 (source35 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked35 : ∀ i : Fin 52, (fun i => output35 i = raw35 (source35 i)) i :=
  forallFin_of_zero_offset (fun i => output35 i = raw35 (source35 i)) sourceChecked35_0

theorem coverChecked35_0 : ∀ i : Fin 52,
    (fun i => (output35 (cover35 i)).ContainsBox (raw35 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked35 : ∀ i : Fin 52, (fun i => (output35 (cover35 i)).ContainsBox (raw35 i)) i :=
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

noncomputable def phaseMass35 : ℝ := singlePhaseMass (145899414/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw35 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass35_eq : phaseMass35 = (72949707/819200000000 : ℝ) := by
  unfold phaseMass35
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw35 output35 cover35 source35
    (gridTreeUnionCheck_sound 32768 raw35 output35 cover35 source35 tree35 checked35)
    _ (by norm_num) _, areaUnits35]
  norm_num

-- Frozen phase 5944, atom 5829, type 1, source (14,73).
def leavesData36 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves36 : Fin 7 → DyadicLeaf := leavesData36.get
def raw36 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 14 73 leaves36 i
def outputData36 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3584,3712,18688,18816⟩) (.node (.single ⟨3584,3712,18816,18944⟩) (.single ⟨3712,3776,18688,18752⟩))) (.node (.node (.single ⟨3712,3776,18752,18816⟩) (.single ⟨3776,3840,18688,18752⟩)) (.node (.single ⟨3776,3840,18752,18816⟩) (.single ⟨3712,3840,18816,18944⟩)))) (.node (.node (.single ⟨13824,13952,28928,29056⟩) (.node (.single ⟨13824,13952,29056,29184⟩) (.single ⟨13952,14016,28928,28992⟩))) (.node (.node (.single ⟨13952,14016,28992,29056⟩) (.single ⟨14016,14080,28928,28992⟩)) (.node (.single ⟨14016,14080,28992,29056⟩) (.single ⟨13952,14080,29056,29184⟩))))) (.node (.node (.node (.single ⟨18688,18816,3584,3712⟩) (.node (.single ⟨18688,18752,3712,3776⟩) (.single ⟨18688,18752,3776,3840⟩))) (.node (.node (.single ⟨18752,18816,3712,3776⟩) (.single ⟨18752,18816,3776,3840⟩)) (.node (.single ⟨18816,18944,3584,3712⟩) (.single ⟨18816,18944,3712,3840⟩)))) (.node (.node (.single ⟨28928,29056,13824,13952⟩) (.node (.single ⟨28928,28992,13952,14016⟩) (.single ⟨28928,28992,14016,14080⟩))) (.node (.node (.single ⟨28992,29056,13952,14016⟩) (.single ⟨28992,29056,14016,14080⟩)) (.node (.single ⟨29056,29184,13824,13952⟩) (.single ⟨29056,29184,13952,14080⟩))))))
def output36 : Fin 28 → GridBox := outputData36.get
def coverData36 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData36 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover36 (i : Fin 28) : Fin 28 := ⟨coverData36.get i % 28, Nat.mod_lt _ (by decide)⟩
def source36 (i : Fin 28) : Fin 28 := ⟨sourceData36.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree36 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 .empty (.cutY 19456 (.cutX 3584 .empty (.cutY 18944 (.cutX 3840 (.cutY 18688 .empty (.cutX 3712 (.cutY 18816 .full .full) (.cutY 18816 (.cutX 3776 (.cutY 18752 .full .full) (.cutY 18752 .full .full)) .full))) .empty) .empty)) .empty)))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 .empty (.cutY 29696 (.cutX 13824 .empty (.cutY 29184 (.cutX 14080 (.cutY 28928 .empty (.cutX 13952 (.cutY 29056 .full .full) (.cutY 29056 (.cutX 14016 (.cutY 28992 .full .full) (.cutY 28992 .full .full)) .full))) .empty) .empty)) .empty)) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 (.cutY 3072 .empty (.cutX 18944 (.cutY 3584 .empty (.cutX 18688 .empty (.cutY 3840 (.cutX 18816 (.cutY 3712 .full (.cutX 18752 (.cutY 3776 .full .full) (.cutY 3776 .full .full))) (.cutY 3712 .full .full)) .empty))) .empty)) .empty))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 (.cutY 13312 .empty (.cutX 29184 (.cutY 13824 .empty (.cutX 28928 .empty (.cutY 14080 (.cutX 29056 (.cutY 13952 .full (.cutX 28992 (.cutY 14016 .full .full) (.cutY 14016 .full .full))) (.cutY 13952 .full .full)) .empty))) .empty)) .empty) .empty) .empty))))) .empty))

theorem metadata36 : 0<94387549 ∧ 14<128 ∧ 73<128 ∧ 1<4 ∧
    5829/4160=1 ∧ 5829%4160=1669 ∧ ∀ i, (leaves36 i).Valid 8 := by
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

noncomputable def phaseMass36 : ℝ := singlePhaseMass (94387549/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw36 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass36_eq : phaseMass36 = (94387549/1638400000000 : ℝ) := by
  unfold phaseMass36
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw36 output36 cover36 source36
    (gridTreeUnionCheck_sound 32768 raw36 output36 cover36 source36 tree36 checked36)
    _ (by norm_num) _, areaUnits36]
  norm_num

-- Frozen phase 5945, atom 5301, type 1, source (9,70).
def leavesData37 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩))) (.node (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩)))) (.node (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩))) (.node (.node (.single ⟨3,4,0⟩) (.single ⟨3,4,1⟩)) (.node (.single ⟨3,5,0⟩) (.single ⟨3,5,1⟩)))))
def leaves37 : Fin 16 → DyadicLeaf := leavesData37.get
def raw37 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 9 70 leaves37 i
def outputData37 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨2304,2368,17920,17984⟩) (.single ⟨2304,2368,17984,18048⟩)) (.node (.single ⟨2368,2432,17920,17984⟩) (.single ⟨2368,2432,17984,18048⟩))) (.node (.node (.single ⟨2304,2432,18048,18176⟩) (.single ⟨2432,2464,17920,17952⟩)) (.node (.single ⟨2432,2464,17952,17984⟩) (.single ⟨2464,2496,17920,17952⟩)))) (.node (.node (.node (.single ⟨2464,2496,17952,17984⟩) (.single ⟨2432,2496,17984,18048⟩)) (.node (.single ⟨2496,2528,17920,17952⟩) (.single ⟨2496,2528,17952,17984⟩))) (.node (.node (.single ⟨2528,2560,17920,17952⟩) (.single ⟨2528,2560,17952,17984⟩)) (.node (.single ⟨2496,2560,17984,18048⟩) (.single ⟨2432,2560,18048,18176⟩))))) (.node (.node (.node (.node (.single ⟨14592,14720,30208,30336⟩) (.single ⟨14592,14720,30336,30464⟩)) (.node (.single ⟨14720,14784,30208,30272⟩) (.single ⟨14720,14784,30272,30336⟩))) (.node (.node (.single ⟨14784,14816,30208,30240⟩) (.single ⟨14784,14816,30240,30272⟩)) (.node (.single ⟨14816,14848,30208,30240⟩) (.single ⟨14816,14848,30240,30272⟩)))) (.node (.node (.node (.single ⟨14784,14816,30272,30304⟩) (.single ⟨14784,14816,30304,30336⟩)) (.node (.single ⟨14816,14848,30272,30304⟩) (.single ⟨14816,14848,30304,30336⟩))) (.node (.node (.single ⟨14720,14784,30336,30400⟩) (.single ⟨14720,14784,30400,30464⟩)) (.node (.single ⟨14784,14848,30336,30400⟩) (.single ⟨14784,14848,30400,30464⟩)))))) (.node (.node (.node (.node (.node (.single ⟨17920,17984,2304,2368⟩) (.single ⟨17920,17984,2368,2432⟩)) (.node (.single ⟨17984,18048,2304,2368⟩) (.single ⟨17984,18048,2368,2432⟩))) (.node (.node (.single ⟨17920,17952,2432,2464⟩) (.single ⟨17920,17952,2464,2496⟩)) (.node (.single ⟨17952,17984,2432,2464⟩) (.single ⟨17952,17984,2464,2496⟩)))) (.node (.node (.node (.single ⟨17920,17952,2496,2528⟩) (.single ⟨17920,17952,2528,2560⟩)) (.node (.single ⟨17952,17984,2496,2528⟩) (.single ⟨17952,17984,2528,2560⟩))) (.node (.node (.single ⟨17984,18048,2432,2496⟩) (.single ⟨17984,18048,2496,2560⟩)) (.node (.single ⟨18048,18176,2304,2432⟩) (.single ⟨18048,18176,2432,2560⟩))))) (.node (.node (.node (.node (.single ⟨30208,30336,14592,14720⟩) (.single ⟨30208,30272,14720,14784⟩)) (.node (.single ⟨30208,30240,14784,14816⟩) (.single ⟨30208,30240,14816,14848⟩))) (.node (.node (.single ⟨30240,30272,14784,14816⟩) (.single ⟨30240,30272,14816,14848⟩)) (.node (.single ⟨30272,30336,14720,14784⟩) (.single ⟨30272,30304,14784,14816⟩)))) (.node (.node (.node (.single ⟨30272,30304,14816,14848⟩) (.single ⟨30304,30336,14784,14816⟩)) (.node (.single ⟨30304,30336,14816,14848⟩) (.single ⟨30336,30464,14592,14720⟩))) (.node (.node (.single ⟨30336,30400,14720,14784⟩) (.single ⟨30336,30400,14784,14848⟩)) (.node (.single ⟨30400,30464,14720,14784⟩) (.single ⟨30400,30464,14784,14848⟩)))))))
def output37 : Fin 64 → GridBox := outputData37.get
def coverData37 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 46)) (.node (.single 59) (.single 17))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16)))) (.node (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31))) (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29))))) (.node (.node (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30))) (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28)))) (.node (.node (.node (.single 9) (.single 44)) (.node (.single 54) (.single 19))) (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18)))))) (.node (.node (.node (.node (.node (.single 10) (.single 40)) (.node (.single 53) (.single 23))) (.node (.node (.single 11) (.single 42)) (.node (.single 52) (.single 21)))) (.node (.node (.node (.single 12) (.single 41)) (.node (.single 51) (.single 22))) (.node (.node (.single 13) (.single 43)) (.node (.single 50) (.single 20))))) (.node (.node (.node (.node (.single 5) (.single 36)) (.node (.single 58) (.single 27))) (.node (.node (.single 6) (.single 38)) (.node (.single 57) (.single 25)))) (.node (.node (.node (.single 7) (.single 37)) (.node (.single 56) (.single 26))) (.node (.node (.single 8) (.single 39)) (.node (.single 55) (.single 24)))))))
def sourceData37 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.single 20))) (.node (.node (.single 0) (.single 48)) (.node (.single 52) (.single 56)))) (.node (.node (.node (.single 60) (.single 24)) (.node (.single 32) (.single 36))) (.node (.node (.single 40) (.single 44)) (.node (.single 28) (.single 4))))) (.node (.node (.node (.node (.single 7) (.single 3)) (.node (.single 31) (.single 27))) (.node (.node (.single 47) (.single 39)) (.node (.single 43) (.single 35)))) (.node (.node (.node (.single 63) (.single 55)) (.node (.single 59) (.single 51))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.single 21))) (.node (.node (.single 49) (.single 57)) (.node (.single 53) (.single 61)))) (.node (.node (.node (.single 33) (.single 41)) (.node (.single 37) (.single 45))) (.node (.node (.single 25) (.single 29)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.node (.single 6) (.single 30)) (.node (.single 46) (.single 42))) (.node (.node (.single 38) (.single 34)) (.node (.single 26) (.single 62)))) (.node (.node (.node (.single 58) (.single 54)) (.node (.single 50) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover37 (i : Fin 64) : Fin 64 := ⟨coverData37.get i % 64, Nat.mod_lt _ (by decide)⟩
def source37 (i : Fin 64) : Fin 64 := ⟨sourceData37.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree37 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 (.cutX 3072 (.cutY 17408 .empty (.cutX 2560 (.cutY 17920 .empty (.cutX 2304 .empty (.cutY 18176 (.cutX 2432 (.cutY 18048 (.cutX 2368 (.cutY 17984 .full .full) (.cutY 17984 .full .full)) .full) (.cutY 18048 (.cutX 2496 (.cutY 17984 (.cutX 2464 (.cutY 17952 .full .full) (.cutY 17952 .full .full)) .full) (.cutY 17984 (.cutX 2528 (.cutY 17952 .full .full) (.cutY 17952 .full .full)) .full)) .full)) .empty))) .empty)) .empty) .empty)) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 (.cutX 15360 (.cutY 29696 .empty (.cutX 14848 (.cutY 30208 .empty (.cutX 14592 .empty (.cutY 30464 (.cutX 14720 (.cutY 30336 .full .full) (.cutY 30336 (.cutX 14784 (.cutY 30272 .full .full) (.cutY 30272 (.cutX 14816 (.cutY 30240 .full .full) (.cutY 30240 .full .full)) (.cutX 14816 (.cutY 30304 .full .full) (.cutY 30304 .full .full)))) (.cutX 14784 (.cutY 30400 .full .full) (.cutY 30400 .full .full)))) .empty))) .empty)) .empty) .empty))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 .empty (.cutX 17408 .empty (.cutY 3072 (.cutX 17920 .empty (.cutY 2560 (.cutX 18176 (.cutY 2304 .empty (.cutX 18048 (.cutY 2432 (.cutX 17984 (.cutY 2368 .full .full) (.cutY 2368 .full .full)) (.cutX 17984 (.cutY 2496 (.cutX 17952 (.cutY 2464 .full .full) (.cutY 2464 .full .full)) (.cutX 17952 (.cutY 2528 .full .full) (.cutY 2528 .full .full))) (.cutY 2496 .full .full))) (.cutY 2432 .full .full))) .empty) .empty)) .empty))) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 .empty (.cutX 29696 .empty (.cutY 15360 (.cutX 30208 .empty (.cutY 14848 (.cutX 30464 (.cutY 14592 .empty (.cutX 30336 (.cutY 14720 .full (.cutX 30272 (.cutY 14784 .full (.cutX 30240 (.cutY 14816 .full .full) (.cutY 14816 .full .full))) (.cutY 14784 .full (.cutX 30304 (.cutY 14816 .full .full) (.cutY 14816 .full .full))))) (.cutY 14720 .full (.cutX 30400 (.cutY 14784 .full .full) (.cutY 14784 .full .full))))) .empty) .empty)) .empty))) .empty))))) .empty))

theorem metadata37 : 0<135229957 ∧ 9<128 ∧ 70<128 ∧ 1<4 ∧
    5301/4160=1 ∧ 5301%4160=1141 ∧ ∀ i, (leaves37 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData37).mp
    (by decide +kernel)

theorem sourceChecked37_0 : ∀ i : Fin 64,
    (fun i => output37 i = raw37 (source37 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked37 : ∀ i : Fin 64, (fun i => output37 i = raw37 (source37 i)) i :=
  forallFin_of_zero_offset (fun i => output37 i = raw37 (source37 i)) sourceChecked37_0

theorem coverChecked37_0 : ∀ i : Fin 64,
    (fun i => (output37 (cover37 i)).ContainsBox (raw37 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked37 : ∀ i : Fin 64, (fun i => (output37 (cover37 i)).ContainsBox (raw37 i)) i :=
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

-- Frozen phase 5946, atom 803, type 0, source (6,71).
def leavesData38 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves38 : Fin 10 → DyadicLeaf := leavesData38.get
def raw38 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 6 71 leaves38 i
def outputData38 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨1536,1600,18176,18240⟩) (.single ⟨1536,1600,18240,18304⟩)) (.node (.single ⟨1600,1664,18176,18240⟩) (.node (.single ⟨1600,1664,18240,18304⟩) (.single ⟨1536,1664,18304,18432⟩)))) (.node (.node (.single ⟨1664,1728,18176,18240⟩) (.single ⟨1664,1728,18240,18304⟩)) (.node (.single ⟨1728,1792,18176,18240⟩) (.node (.single ⟨1728,1792,18240,18304⟩) (.single ⟨1664,1792,18304,18432⟩))))) (.node (.node (.node (.single ⟨14336,14464,30976,31104⟩) (.single ⟨14336,14464,31104,31232⟩)) (.node (.single ⟨14464,14528,30976,31040⟩) (.node (.single ⟨14464,14528,31040,31104⟩) (.single ⟨14528,14592,30976,31040⟩)))) (.node (.node (.single ⟨14528,14592,31040,31104⟩) (.single ⟨14464,14528,31104,31168⟩)) (.node (.single ⟨14464,14528,31168,31232⟩) (.node (.single ⟨14528,14592,31104,31168⟩) (.single ⟨14528,14592,31168,31232⟩)))))) (.node (.node (.node (.node (.single ⟨18176,18240,1536,1600⟩) (.single ⟨18176,18240,1600,1664⟩)) (.node (.single ⟨18240,18304,1536,1600⟩) (.node (.single ⟨18240,18304,1600,1664⟩) (.single ⟨18176,18240,1664,1728⟩)))) (.node (.node (.single ⟨18176,18240,1728,1792⟩) (.single ⟨18240,18304,1664,1728⟩)) (.node (.single ⟨18240,18304,1728,1792⟩) (.node (.single ⟨18304,18432,1536,1664⟩) (.single ⟨18304,18432,1664,1792⟩))))) (.node (.node (.node (.single ⟨30976,31104,14336,14464⟩) (.single ⟨30976,31040,14464,14528⟩)) (.node (.single ⟨30976,31040,14528,14592⟩) (.node (.single ⟨31040,31104,14464,14528⟩) (.single ⟨31040,31104,14528,14592⟩)))) (.node (.node (.single ⟨31104,31232,14336,14464⟩) (.single ⟨31104,31168,14464,14528⟩)) (.node (.single ⟨31104,31168,14528,14592⟩) (.node (.single ⟨31168,31232,14464,14528⟩) (.single ⟨31168,31232,14528,14592⟩)))))))
def output38 : Fin 40 → GridBox := outputData38.get
def coverData38 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData38 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover38 (i : Fin 40) : Fin 40 := ⟨coverData38.get i % 40, Nat.mod_lt _ (by decide)⟩
def source38 (i : Fin 40) : Fin 40 := ⟨sourceData38.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree38 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 (.cutX 1024 .empty (.cutY 17408 .empty (.cutX 1536 .empty (.cutY 17920 .empty (.cutX 1792 (.cutY 18176 .empty (.cutX 1664 (.cutY 18304 (.cutX 1600 (.cutY 18240 .full .full) (.cutY 18240 .full .full)) .full) (.cutY 18304 (.cutX 1728 (.cutY 18240 .full .full) (.cutY 18240 .full .full)) .full))) .empty))))) .empty) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 .empty (.cutX 15360 (.cutY 31744 (.cutX 14848 (.cutY 31232 (.cutX 14592 (.cutY 30976 .empty (.cutX 14464 (.cutY 31104 .full .full) (.cutY 31104 (.cutX 14528 (.cutY 31040 .full .full) (.cutY 31040 .full .full)) (.cutX 14528 (.cutY 31168 .full .full) (.cutY 31168 .full .full))))) .empty) .empty) .empty) .empty) .empty)))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 (.cutX 17408 .empty (.cutY 1024 .empty (.cutX 17920 .empty (.cutY 1536 .empty (.cutX 18176 .empty (.cutY 1792 (.cutX 18304 (.cutY 1664 (.cutX 18240 (.cutY 1600 .full .full) (.cutY 1600 .full .full)) (.cutX 18240 (.cutY 1728 .full .full) (.cutY 1728 .full .full))) (.cutY 1664 .full .full)) .empty)))))) .empty) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 .empty (.cutX 31744 (.cutY 15360 (.cutX 31232 (.cutY 14848 (.cutX 30976 .empty (.cutY 14592 (.cutX 31104 (.cutY 14464 .full (.cutX 31040 (.cutY 14528 .full .full) (.cutY 14528 .full .full))) (.cutY 14464 .full (.cutX 31168 (.cutY 14528 .full .full) (.cutY 14528 .full .full)))) .empty)) .empty) .empty) .empty) .empty))))))) .empty))

theorem metadata38 : 0<114037843 ∧ 6<128 ∧ 71<128 ∧ 0<4 ∧
    803/4160=0 ∧ 803%4160=803 ∧ ∀ i, (leaves38 i).Valid 8 := by
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

noncomputable def phaseMass38 : ℝ := singlePhaseMass (114037843/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw38 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass38_eq : phaseMass38 = (114037843/1638400000000 : ℝ) := by
  unfold phaseMass38
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw38 output38 cover38 source38
    (gridTreeUnionCheck_sound 32768 raw38 output38 cover38 source38 tree38 checked38)
    _ (by norm_num) _, areaUnits38]
  norm_num

-- Frozen phase 5947, atom 566, type 0, source (4,70).
def leavesData39 : FiniteInputTree DyadicLeaf 22 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,2,2⟩))) (.node (.single ⟨2,2,3⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))))) (.node (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,1⟩) (.node (.single ⟨3,4,0⟩) (.single ⟨3,4,1⟩)))) (.node (.node (.single ⟨3,5,0⟩) (.node (.single ⟨3,5,1⟩) (.single ⟨4,14,0⟩))) (.node (.single ⟨4,14,1⟩) (.node (.single ⟨4,15,0⟩) (.single ⟨4,15,1⟩))))))
def leaves39 : Fin 22 → DyadicLeaf := leavesData39.get
def raw39 (i : Fin 88) : GridBox := phaseImageBoxes 32768 8 4 70 leaves39 i
def outputData39 : FiniteInputTree GridBox 88 := (.node (.node (.node (.node (.node (.node (.single ⟨1024,1088,17920,17984⟩) (.single ⟨1024,1088,17984,18048⟩)) (.node (.single ⟨1088,1152,17920,17984⟩) (.node (.single ⟨1088,1152,17984,18048⟩) (.single ⟨1024,1152,18048,18176⟩)))) (.node (.node (.single ⟨1152,1184,17920,17952⟩) (.node (.single ⟨1152,1184,17952,17984⟩) (.single ⟨1184,1216,17920,17952⟩))) (.node (.single ⟨1184,1216,17952,17984⟩) (.node (.single ⟨1152,1216,17984,18048⟩) (.single ⟨1216,1248,17920,17952⟩))))) (.node (.node (.node (.single ⟨1216,1248,17952,17984⟩) (.single ⟨1248,1264,17920,17936⟩)) (.node (.single ⟨1248,1264,17936,17952⟩) (.node (.single ⟨1264,1280,17920,17936⟩) (.single ⟨1264,1280,17936,17952⟩)))) (.node (.node (.single ⟨1248,1280,17952,17984⟩) (.node (.single ⟨1216,1280,17984,18048⟩) (.single ⟨1152,1216,18048,18112⟩))) (.node (.single ⟨1152,1216,18112,18176⟩) (.node (.single ⟨1216,1280,18048,18112⟩) (.single ⟨1216,1280,18112,18176⟩)))))) (.node (.node (.node (.node (.single ⟨14592,14656,31488,31552⟩) (.single ⟨14592,14656,31552,31616⟩)) (.node (.single ⟨14656,14720,31488,31552⟩) (.node (.single ⟨14656,14720,31552,31616⟩) (.single ⟨14592,14720,31616,31744⟩)))) (.node (.node (.single ⟨14720,14784,31488,31552⟩) (.node (.single ⟨14720,14784,31552,31616⟩) (.single ⟨14784,14816,31488,31520⟩))) (.node (.single ⟨14784,14816,31520,31552⟩) (.node (.single ⟨14816,14832,31488,31504⟩) (.single ⟨14816,14832,31504,31520⟩))))) (.node (.node (.node (.single ⟨14832,14848,31488,31504⟩) (.single ⟨14832,14848,31504,31520⟩)) (.node (.single ⟨14816,14848,31520,31552⟩) (.node (.single ⟨14784,14816,31552,31584⟩) (.single ⟨14784,14816,31584,31616⟩)))) (.node (.node (.single ⟨14816,14848,31552,31584⟩) (.node (.single ⟨14816,14848,31584,31616⟩) (.single ⟨14720,14784,31616,31680⟩))) (.node (.single ⟨14720,14784,31680,31744⟩) (.node (.single ⟨14784,14848,31616,31680⟩) (.single ⟨14784,14848,31680,31744⟩))))))) (.node (.node (.node (.node (.node (.single ⟨17920,17984,1024,1088⟩) (.single ⟨17920,17984,1088,1152⟩)) (.node (.single ⟨17984,18048,1024,1088⟩) (.node (.single ⟨17984,18048,1088,1152⟩) (.single ⟨17920,17952,1152,1184⟩)))) (.node (.node (.single ⟨17920,17952,1184,1216⟩) (.node (.single ⟨17952,17984,1152,1184⟩) (.single ⟨17952,17984,1184,1216⟩))) (.node (.single ⟨17920,17952,1216,1248⟩) (.node (.single ⟨17920,17936,1248,1264⟩) (.single ⟨17920,17936,1264,1280⟩))))) (.node (.node (.node (.single ⟨17936,17952,1248,1264⟩) (.single ⟨17936,17952,1264,1280⟩)) (.node (.single ⟨17952,17984,1216,1248⟩) (.node (.single ⟨17952,17984,1248,1280⟩) (.single ⟨17984,18048,1152,1216⟩)))) (.node (.node (.single ⟨17984,18048,1216,1280⟩) (.node (.single ⟨18048,18176,1024,1152⟩) (.single ⟨18048,18112,1152,1216⟩))) (.node (.single ⟨18048,18112,1216,1280⟩) (.node (.single ⟨18112,18176,1152,1216⟩) (.single ⟨18112,18176,1216,1280⟩)))))) (.node (.node (.node (.node (.single ⟨31488,31552,14592,14656⟩) (.single ⟨31488,31552,14656,14720⟩)) (.node (.single ⟨31552,31616,14592,14656⟩) (.node (.single ⟨31552,31616,14656,14720⟩) (.single ⟨31488,31552,14720,14784⟩)))) (.node (.node (.single ⟨31488,31520,14784,14816⟩) (.node (.single ⟨31488,31504,14816,14832⟩) (.single ⟨31488,31504,14832,14848⟩))) (.node (.single ⟨31504,31520,14816,14832⟩) (.node (.single ⟨31504,31520,14832,14848⟩) (.single ⟨31520,31552,14784,14816⟩))))) (.node (.node (.node (.single ⟨31520,31552,14816,14848⟩) (.single ⟨31552,31616,14720,14784⟩)) (.node (.single ⟨31552,31584,14784,14816⟩) (.node (.single ⟨31552,31584,14816,14848⟩) (.single ⟨31584,31616,14784,14816⟩)))) (.node (.node (.single ⟨31584,31616,14816,14848⟩) (.node (.single ⟨31616,31744,14592,14720⟩) (.single ⟨31616,31680,14720,14784⟩))) (.node (.single ⟨31616,31680,14784,14848⟩) (.node (.single ⟨31680,31744,14720,14784⟩) (.single ⟨31680,31744,14784,14848⟩))))))))
def output39 : Fin 88 → GridBox := outputData39.get
def coverData39 : FiniteInputTree ℕ 88 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 61)) (.node (.single 83) (.node (.single 26) (.single 0)))) (.node (.node (.single 44) (.node (.single 87) (.single 43))) (.node (.single 1) (.node (.single 46) (.single 86))))) (.node (.node (.node (.single 41) (.single 2)) (.node (.single 45) (.node (.single 85) (.single 42)))) (.node (.node (.single 3) (.node (.single 47) (.single 84))) (.node (.single 40) (.node (.single 9) (.single 59)))))) (.node (.node (.node (.node (.single 78) (.single 28)) (.node (.single 17) (.node (.single 60) (.single 70)))) (.node (.node (.single 27) (.node (.single 18) (.single 62))) (.node (.single 69) (.node (.single 25) (.single 19))))) (.node (.node (.node (.single 64) (.single 68)) (.node (.single 23) (.node (.single 20) (.single 63)))) (.node (.node (.single 67) (.node (.single 24) (.single 21))) (.node (.single 65) (.node (.single 66) (.single 22))))))) (.node (.node (.node (.node (.node (.single 10) (.single 52)) (.node (.single 77) (.node (.single 35) (.single 11)))) (.node (.node (.single 57) (.node (.single 76) (.single 30))) (.node (.single 16) (.node (.single 58) (.single 71))))) (.node (.node (.node (.single 29) (.single 5)) (.node (.single 48) (.node (.single 82) (.single 39)))) (.node (.node (.single 6) (.node (.single 50) (.single 81))) (.node (.single 37) (.node (.single 7) (.single 49)))))) (.node (.node (.node (.node (.single 80) (.single 38)) (.node (.single 8) (.node (.single 51) (.single 79)))) (.node (.node (.single 36) (.node (.single 12) (.single 53))) (.node (.single 75) (.node (.single 34) (.single 13))))) (.node (.node (.node (.single 55) (.single 74)) (.node (.single 32) (.node (.single 14) (.single 54)))) (.node (.node (.single 73) (.node (.single 33) (.single 15))) (.node (.single 56) (.node (.single 72) (.single 31))))))))
def sourceData39 : FiniteInputTree ℕ 88 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 8)) (.node (.single 12) (.node (.single 16) (.single 0)))) (.node (.node (.single 56) (.node (.single 60) (.single 64))) (.node (.single 68) (.node (.single 20) (.single 44))))) (.node (.node (.node (.single 48) (.single 72)) (.node (.single 76) (.node (.single 80) (.single 84)))) (.node (.node (.single 52) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 36) (.single 40)))))) (.node (.node (.node (.node (.single 43) (.single 35)) (.node (.single 39) (.node (.single 31) (.single 3)))) (.node (.node (.single 27) (.node (.single 23) (.single 55))) (.node (.single 51) (.node (.single 87) (.single 79))))) (.node (.node (.node (.single 83) (.single 75)) (.node (.single 47) (.node (.single 71) (.single 63)))) (.node (.node (.single 67) (.node (.single 59) (.single 19))) (.node (.single 11) (.node (.single 15) (.single 7))))))) (.node (.node (.node (.node (.node (.single 5) (.single 13)) (.node (.single 9) (.node (.single 17) (.single 57)))) (.node (.node (.single 65) (.node (.single 61) (.single 69))) (.node (.single 45) (.node (.single 73) (.single 81))))) (.node (.node (.node (.single 77) (.single 85)) (.node (.single 49) (.node (.single 53) (.single 21)))) (.node (.node (.single 25) (.node (.single 1) (.single 29))) (.node (.single 37) (.node (.single 33) (.single 41)))))) (.node (.node (.node (.node (.single 42) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))) (.node (.node (.single 54) (.node (.single 86) (.single 82))) (.node (.single 78) (.node (.single 74) (.single 50))))) (.node (.node (.node (.single 46) (.single 22)) (.node (.single 70) (.node (.single 66) (.single 62)))) (.node (.node (.single 58) (.node (.single 2) (.single 18))) (.node (.single 14) (.node (.single 10) (.single 6))))))))
def cover39 (i : Fin 88) : Fin 88 := ⟨coverData39.get i % 88, Nat.mod_lt _ (by decide)⟩
def source39 (i : Fin 88) : Fin 88 := ⟨sourceData39.get i % 88, Nat.mod_lt _ (by decide)⟩
def tree39 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 (.cutX 1024 .empty (.cutY 17408 .empty (.cutX 1536 (.cutY 17920 .empty (.cutX 1280 (.cutY 18176 (.cutX 1152 (.cutY 18048 (.cutX 1088 (.cutY 17984 .full .full) (.cutY 17984 .full .full)) .full) (.cutY 18048 (.cutX 1216 (.cutY 17984 (.cutX 1184 (.cutY 17952 .full .full) (.cutY 17952 .full .full)) .full) (.cutY 17984 (.cutX 1248 (.cutY 17952 .full .full) (.cutY 17952 (.cutX 1264 (.cutY 17936 .full .full) (.cutY 17936 .full .full)) .full)) .full)) (.cutX 1216 (.cutY 18112 .full .full) (.cutY 18112 .full .full)))) .empty) .empty)) .empty))) .empty) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 .empty (.cutX 15360 (.cutY 31744 (.cutX 14848 (.cutY 31232 .empty (.cutX 14592 .empty (.cutY 31488 .empty (.cutX 14720 (.cutY 31616 (.cutX 14656 (.cutY 31552 .full .full) (.cutY 31552 .full .full)) .full) (.cutY 31616 (.cutX 14784 (.cutY 31552 .full .full) (.cutY 31552 (.cutX 14816 (.cutY 31520 .full .full) (.cutY 31520 (.cutX 14832 (.cutY 31504 .full .full) (.cutY 31504 .full .full)) .full)) (.cutX 14816 (.cutY 31584 .full .full) (.cutY 31584 .full .full)))) (.cutX 14784 (.cutY 31680 .full .full) (.cutY 31680 .full .full))))))) .empty) .empty) .empty)))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 (.cutX 17408 .empty (.cutY 1024 .empty (.cutX 17920 .empty (.cutY 1536 (.cutX 18176 (.cutY 1280 (.cutX 18048 (.cutY 1152 (.cutX 17984 (.cutY 1088 .full .full) (.cutY 1088 .full .full)) (.cutX 17984 (.cutY 1216 (.cutX 17952 (.cutY 1184 .full .full) (.cutY 1184 .full .full)) (.cutX 17952 (.cutY 1248 .full (.cutX 17936 (.cutY 1264 .full .full) (.cutY 1264 .full .full))) (.cutY 1248 .full .full))) (.cutY 1216 .full .full))) (.cutY 1152 .full (.cutX 18112 (.cutY 1216 .full .full) (.cutY 1216 .full .full)))) .empty) .empty) .empty)))) .empty) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 .empty (.cutX 31744 (.cutY 15360 (.cutX 31232 .empty (.cutY 14848 (.cutX 31488 .empty (.cutY 14592 .empty (.cutX 31616 (.cutY 14720 (.cutX 31552 (.cutY 14656 .full .full) (.cutY 14656 .full .full)) (.cutX 31552 (.cutY 14784 .full (.cutX 31520 (.cutY 14816 .full (.cutX 31504 (.cutY 14832 .full .full) (.cutY 14832 .full .full))) (.cutY 14816 .full .full))) (.cutY 14784 .full (.cutX 31584 (.cutY 14816 .full .full) (.cutY 14816 .full .full))))) (.cutY 14720 .full (.cutX 31680 (.cutY 14784 .full .full) (.cutY 14784 .full .full)))))) .empty)) .empty) .empty))))))) .empty))

theorem metadata39 : 0<114037843 ∧ 4<128 ∧ 70<128 ∧ 0<4 ∧
    566/4160=0 ∧ 566%4160=566 ∧ ∀ i, (leaves39 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData39).mp
    (by decide +kernel)

theorem sourceChecked39_0 : ∀ i : Fin 64,
    (fun i => output39 i = raw39 (source39 i)) (finOffset 88 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked39_64 : ∀ i : Fin 24,
    (fun i => output39 i = raw39 (source39 i)) (finOffset 88 64 24 (by decide) i) := by decide +kernel

theorem sourceChecked39 : ∀ i : Fin 88, (fun i => output39 i = raw39 (source39 i)) i :=
  forallFin_of_zero_offset (fun i => output39 i = raw39 (source39 i)) (forallFinOffset_add (fun i => output39 i = raw39 (source39 i)) 0 64 24 (by decide) sourceChecked39_0
    sourceChecked39_64)

theorem coverChecked39_0 : ∀ i : Fin 64,
    (fun i => (output39 (cover39 i)).ContainsBox (raw39 i)) (finOffset 88 0 64 (by decide) i) := by decide +kernel

theorem coverChecked39_64 : ∀ i : Fin 24,
    (fun i => (output39 (cover39 i)).ContainsBox (raw39 i)) (finOffset 88 64 24 (by decide) i) := by decide +kernel

theorem coverChecked39 : ∀ i : Fin 88, (fun i => (output39 (cover39 i)).ContainsBox (raw39 i)) i :=
  forallFin_of_zero_offset (fun i => (output39 (cover39 i)).ContainsBox (raw39 i)) (forallFinOffset_add (fun i => (output39 (cover39 i)).ContainsBox (raw39 i)) 0 64 24 (by decide) coverChecked39_0
    coverChecked39_64)

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

noncomputable def phaseMass39 : ℝ := singlePhaseMass (114037843/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw39 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass39_eq : phaseMass39 = (114037843/1638400000000 : ℝ) := by
  unfold phaseMass39
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw39 output39 cover39 source39
    (gridTreeUnionCheck_sound 32768 raw39 output39 cover39 source39 tree39 checked39)
    _ (by norm_num) _, areaUnits39]
  norm_num

-- Frozen phase 5948, atom 4844, type 1, source (5,69).
def leavesData40 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,0⟩))) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves40 : Fin 13 → DyadicLeaf := leavesData40.get
def raw40 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 5 69 leaves40 i
def outputData40 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨1280,1344,17664,17728⟩) (.node (.single ⟨1280,1344,17728,17792⟩) (.single ⟨1344,1408,17664,17728⟩))) (.node (.single ⟨1344,1408,17728,17792⟩) (.node (.single ⟨1280,1408,17792,17920⟩) (.single ⟨1408,1472,17664,17728⟩)))) (.node (.node (.single ⟨1408,1472,17728,17792⟩) (.node (.single ⟨1472,1504,17664,17696⟩) (.single ⟨1472,1504,17696,17728⟩))) (.node (.node (.single ⟨1504,1536,17664,17696⟩) (.single ⟨1504,1536,17696,17728⟩)) (.node (.single ⟨1472,1536,17728,17792⟩) (.single ⟨1408,1536,17792,17920⟩))))) (.node (.node (.node (.single ⟨14848,14976,31232,31360⟩) (.node (.single ⟨14848,14976,31360,31488⟩) (.single ⟨14976,15040,31232,31296⟩))) (.node (.single ⟨14976,15040,31296,31360⟩) (.node (.single ⟨15040,15072,31232,31264⟩) (.single ⟨15040,15072,31264,31296⟩)))) (.node (.node (.single ⟨15072,15104,31232,31264⟩) (.node (.single ⟨15072,15104,31264,31296⟩) (.single ⟨15040,15104,31296,31360⟩))) (.node (.node (.single ⟨14976,15040,31360,31424⟩) (.single ⟨14976,15040,31424,31488⟩)) (.node (.single ⟨15040,15104,31360,31424⟩) (.single ⟨15040,15104,31424,31488⟩)))))) (.node (.node (.node (.node (.single ⟨17664,17728,1280,1344⟩) (.node (.single ⟨17664,17728,1344,1408⟩) (.single ⟨17728,17792,1280,1344⟩))) (.node (.single ⟨17728,17792,1344,1408⟩) (.node (.single ⟨17664,17728,1408,1472⟩) (.single ⟨17664,17696,1472,1504⟩)))) (.node (.node (.single ⟨17664,17696,1504,1536⟩) (.node (.single ⟨17696,17728,1472,1504⟩) (.single ⟨17696,17728,1504,1536⟩))) (.node (.node (.single ⟨17728,17792,1408,1472⟩) (.single ⟨17728,17792,1472,1536⟩)) (.node (.single ⟨17792,17920,1280,1408⟩) (.single ⟨17792,17920,1408,1536⟩))))) (.node (.node (.node (.single ⟨31232,31360,14848,14976⟩) (.node (.single ⟨31232,31296,14976,15040⟩) (.single ⟨31232,31264,15040,15072⟩))) (.node (.single ⟨31232,31264,15072,15104⟩) (.node (.single ⟨31264,31296,15040,15072⟩) (.single ⟨31264,31296,15072,15104⟩)))) (.node (.node (.single ⟨31296,31360,14976,15040⟩) (.node (.single ⟨31296,31360,15040,15104⟩) (.single ⟨31360,31488,14848,14976⟩))) (.node (.node (.single ⟨31360,31424,14976,15040⟩) (.single ⟨31360,31424,15040,15104⟩)) (.node (.single ⟨31424,31488,14976,15040⟩) (.single ⟨31424,31488,15040,15104⟩)))))))
def output40 : Fin 52 → GridBox := outputData40.get
def coverData40 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 0))) (.node (.node (.single 26) (.single 51)) (.node (.single 25) (.single 1))))) (.node (.node (.node (.single 28) (.node (.single 50) (.single 23))) (.node (.single 2) (.node (.single 27) (.single 49)))) (.node (.node (.single 24) (.node (.single 3) (.single 29))) (.node (.node (.single 48) (.single 22)) (.node (.single 5) (.single 30)))))) (.node (.node (.node (.node (.single 46) (.node (.single 21) (.single 6))) (.node (.single 35) (.node (.single 45) (.single 16)))) (.node (.node (.single 11) (.node (.single 36) (.single 40))) (.node (.node (.single 15) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData40 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.single 20) (.node (.single 0) (.single 24)))) (.node (.node (.single 28) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 35))) (.node (.single 31) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.node (.single 17) (.single 13))) (.node (.single 21) (.node (.single 25) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 34) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 30) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover40 (i : Fin 52) : Fin 52 := ⟨coverData40.get i % 52, Nat.mod_lt _ (by decide)⟩
def source40 (i : Fin 52) : Fin 52 := ⟨sourceData40.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree40 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 (.cutX 1024 .empty (.cutY 17408 .empty (.cutX 1536 (.cutY 17920 (.cutX 1280 .empty (.cutY 17664 .empty (.cutX 1408 (.cutY 17792 (.cutX 1344 (.cutY 17728 .full .full) (.cutY 17728 .full .full)) .full) (.cutY 17792 (.cutX 1472 (.cutY 17728 .full .full) (.cutY 17728 (.cutX 1504 (.cutY 17696 .full .full) (.cutY 17696 .full .full)) .full)) .full)))) .empty) .empty))) .empty) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 .empty (.cutX 15360 (.cutY 31744 (.cutX 14848 .empty (.cutY 31232 .empty (.cutX 15104 (.cutY 31488 (.cutX 14976 (.cutY 31360 .full .full) (.cutY 31360 (.cutX 15040 (.cutY 31296 .full .full) (.cutY 31296 (.cutX 15072 (.cutY 31264 .full .full) (.cutY 31264 .full .full)) .full)) (.cutX 15040 (.cutY 31424 .full .full) (.cutY 31424 .full .full)))) .empty) .empty))) .empty) .empty)))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 (.cutX 17408 .empty (.cutY 1024 .empty (.cutX 17920 (.cutY 1536 (.cutX 17664 .empty (.cutY 1280 .empty (.cutX 17792 (.cutY 1408 (.cutX 17728 (.cutY 1344 .full .full) (.cutY 1344 .full .full)) (.cutX 17728 (.cutY 1472 .full (.cutX 17696 (.cutY 1504 .full .full) (.cutY 1504 .full .full))) (.cutY 1472 .full .full))) (.cutY 1408 .full .full)))) .empty) .empty))) .empty) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 .empty (.cutX 31744 (.cutY 15360 (.cutX 31232 .empty (.cutY 14848 .empty (.cutX 31488 (.cutY 15104 (.cutX 31360 (.cutY 14976 .full (.cutX 31296 (.cutY 15040 .full (.cutX 31264 (.cutY 15072 .full .full) (.cutY 15072 .full .full))) (.cutY 15040 .full .full))) (.cutY 14976 .full (.cutX 31424 (.cutY 15040 .full .full) (.cutY 15040 .full .full)))) .empty) .empty))) .empty) .empty))))))) .empty))

theorem metadata40 : 0<202148459 ∧ 5<128 ∧ 69<128 ∧ 1<4 ∧
    4844/4160=1 ∧ 4844%4160=684 ∧ ∀ i, (leaves40 i).Valid 8 := by
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

noncomputable def phaseMass40 : ℝ := singlePhaseMass (202148459/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw40 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass40_eq : phaseMass40 = (202148459/1638400000000 : ℝ) := by
  unfold phaseMass40
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw40 output40 cover40 source40
    (gridTreeUnionCheck_sound 32768 raw40 output40 cover40 source40 tree40 checked40)
    _ (by norm_num) _, areaUnits40]
  norm_num

-- Frozen phase 5949, atom 2813, type 0, source (27,86).
def leavesData41 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves41 : Fin 7 → DyadicLeaf := leavesData41.get
def raw41 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 27 86 leaves41 i
def outputData41 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨6912,7040,22016,22144⟩) (.node (.single ⟨6912,7040,22144,22272⟩) (.single ⟨7040,7104,22016,22080⟩))) (.node (.node (.single ⟨7040,7104,22080,22144⟩) (.single ⟨7104,7168,22016,22080⟩)) (.node (.single ⟨7104,7168,22080,22144⟩) (.single ⟨7040,7168,22144,22272⟩)))) (.node (.node (.single ⟨10496,10624,25600,25728⟩) (.node (.single ⟨10496,10624,25728,25856⟩) (.single ⟨10624,10688,25600,25664⟩))) (.node (.node (.single ⟨10624,10688,25664,25728⟩) (.single ⟨10688,10752,25600,25664⟩)) (.node (.single ⟨10688,10752,25664,25728⟩) (.single ⟨10624,10752,25728,25856⟩))))) (.node (.node (.node (.single ⟨22016,22144,6912,7040⟩) (.node (.single ⟨22016,22080,7040,7104⟩) (.single ⟨22016,22080,7104,7168⟩))) (.node (.node (.single ⟨22080,22144,7040,7104⟩) (.single ⟨22080,22144,7104,7168⟩)) (.node (.single ⟨22144,22272,6912,7040⟩) (.single ⟨22144,22272,7040,7168⟩)))) (.node (.node (.single ⟨25600,25728,10496,10624⟩) (.node (.single ⟨25600,25664,10624,10688⟩) (.single ⟨25600,25664,10688,10752⟩))) (.node (.node (.single ⟨25664,25728,10624,10688⟩) (.single ⟨25664,25728,10688,10752⟩)) (.node (.single ⟨25728,25856,10496,10624⟩) (.single ⟨25728,25856,10624,10752⟩))))))
def output41 : Fin 28 → GridBox := outputData41.get
def coverData41 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData41 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover41 (i : Fin 28) : Fin 28 := ⟨coverData41.get i % 28, Nat.mod_lt _ (by decide)⟩
def source41 (i : Fin 28) : Fin 28 := ⟨sourceData41.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree41 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 (.cutX 7168 (.cutY 21504 .empty (.cutX 6656 .empty (.cutY 22016 .empty (.cutX 6912 .empty (.cutY 22272 (.cutX 7040 (.cutY 22144 .full .full) (.cutY 22144 (.cutX 7104 (.cutY 22080 .full .full) (.cutY 22080 .full .full)) .full)) .empty))))) .empty) .empty)))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 (.cutX 11264 (.cutY 25600 .empty (.cutX 10752 (.cutY 26112 (.cutX 10496 .empty (.cutY 25856 (.cutX 10624 (.cutY 25728 .full .full) (.cutY 25728 (.cutX 10688 (.cutY 25664 .full .full) (.cutY 25664 .full .full)) .full)) .empty)) .empty) .empty)) .empty) .empty)) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 .empty (.cutX 21504 .empty (.cutY 7168 (.cutX 22016 .empty (.cutY 6656 .empty (.cutX 22272 (.cutY 6912 .empty (.cutX 22144 (.cutY 7040 .full (.cutX 22080 (.cutY 7104 .full .full) (.cutY 7104 .full .full))) (.cutY 7040 .full .full))) .empty))) .empty))) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 .empty (.cutX 25600 .empty (.cutY 11264 (.cutX 26112 (.cutY 10752 (.cutX 25856 (.cutY 10496 .empty (.cutX 25728 (.cutY 10624 .full (.cutX 25664 (.cutY 10688 .full .full) (.cutY 10688 .full .full))) (.cutY 10624 .full .full))) .empty) .empty) .empty) .empty))) .empty) .empty) .empty))) .empty))

theorem metadata41 : 0<104681033 ∧ 27<128 ∧ 86<128 ∧ 0<4 ∧
    2813/4160=0 ∧ 2813%4160=2813 ∧ ∀ i, (leaves41 i).Valid 8 := by
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

noncomputable def phaseMass41 : ℝ := singlePhaseMass (104681033/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw41 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass41_eq : phaseMass41 = (104681033/1638400000000 : ℝ) := by
  unfold phaseMass41
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw41 output41 cover41 source41
    (gridTreeUnionCheck_sound 32768 raw41 output41 cover41 source41 tree41 checked41)
    _ (by norm_num) _, areaUnits41]
  norm_num

-- Frozen phase 5950, atom 7504, type 1, source (35,89).
def leavesData42 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves42 : Fin 13 → DyadicLeaf := leavesData42.get
def raw42 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 35 89 leaves42 i
def outputData42 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨8960,9024,22784,22848⟩) (.node (.single ⟨8960,9024,22848,22912⟩) (.single ⟨9024,9088,22784,22848⟩))) (.node (.single ⟨9024,9088,22848,22912⟩) (.node (.single ⟨8960,9088,22912,23040⟩) (.single ⟨9088,9152,22784,22848⟩)))) (.node (.node (.single ⟨9088,9152,22848,22912⟩) (.node (.single ⟨9152,9184,22784,22816⟩) (.single ⟨9152,9184,22816,22848⟩))) (.node (.node (.single ⟨9184,9216,22784,22816⟩) (.single ⟨9184,9216,22816,22848⟩)) (.node (.single ⟨9152,9216,22848,22912⟩) (.single ⟨9088,9216,22912,23040⟩))))) (.node (.node (.node (.single ⟨9728,9856,23552,23680⟩) (.node (.single ⟨9728,9856,23680,23808⟩) (.single ⟨9856,9920,23552,23616⟩))) (.node (.single ⟨9856,9920,23616,23680⟩) (.node (.single ⟨9920,9952,23552,23584⟩) (.single ⟨9920,9952,23584,23616⟩)))) (.node (.node (.single ⟨9952,9984,23552,23584⟩) (.node (.single ⟨9952,9984,23584,23616⟩) (.single ⟨9920,9984,23616,23680⟩))) (.node (.node (.single ⟨9856,9920,23680,23744⟩) (.single ⟨9856,9920,23744,23808⟩)) (.node (.single ⟨9920,9984,23680,23744⟩) (.single ⟨9920,9984,23744,23808⟩)))))) (.node (.node (.node (.node (.single ⟨22784,22848,8960,9024⟩) (.node (.single ⟨22784,22848,9024,9088⟩) (.single ⟨22848,22912,8960,9024⟩))) (.node (.single ⟨22848,22912,9024,9088⟩) (.node (.single ⟨22784,22848,9088,9152⟩) (.single ⟨22784,22816,9152,9184⟩)))) (.node (.node (.single ⟨22784,22816,9184,9216⟩) (.node (.single ⟨22816,22848,9152,9184⟩) (.single ⟨22816,22848,9184,9216⟩))) (.node (.node (.single ⟨22848,22912,9088,9152⟩) (.single ⟨22848,22912,9152,9216⟩)) (.node (.single ⟨22912,23040,8960,9088⟩) (.single ⟨22912,23040,9088,9216⟩))))) (.node (.node (.node (.single ⟨23552,23680,9728,9856⟩) (.node (.single ⟨23552,23616,9856,9920⟩) (.single ⟨23552,23584,9920,9952⟩))) (.node (.single ⟨23552,23584,9952,9984⟩) (.node (.single ⟨23584,23616,9920,9952⟩) (.single ⟨23584,23616,9952,9984⟩)))) (.node (.node (.single ⟨23616,23680,9856,9920⟩) (.node (.single ⟨23616,23680,9920,9984⟩) (.single ⟨23680,23808,9728,9856⟩))) (.node (.node (.single ⟨23680,23744,9856,9920⟩) (.single ⟨23680,23744,9920,9984⟩)) (.node (.single ⟨23744,23808,9856,9920⟩) (.single ⟨23744,23808,9920,9984⟩)))))))
def output42 : Fin 52 → GridBox := outputData42.get
def coverData42 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData42 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover42 (i : Fin 52) : Fin 52 := ⟨coverData42.get i % 52, Nat.mod_lt _ (by decide)⟩
def source42 (i : Fin 52) : Fin 52 := ⟨sourceData42.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree42 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 .empty (.cutX 9216 (.cutY 23552 (.cutX 8704 .empty (.cutY 23040 (.cutX 8960 .empty (.cutY 22784 .empty (.cutX 9088 (.cutY 22912 (.cutX 9024 (.cutY 22848 .full .full) (.cutY 22848 .full .full)) .full) (.cutY 22912 (.cutX 9152 (.cutY 22848 .full .full) (.cutY 22848 (.cutX 9184 (.cutY 22816 .full .full) (.cutY 22816 .full .full)) .full)) .full)))) .empty)) .empty) (.cutY 23552 .empty (.cutX 9728 .empty (.cutY 24064 (.cutX 9984 (.cutY 23808 (.cutX 9856 (.cutY 23680 .full .full) (.cutY 23680 (.cutX 9920 (.cutY 23616 .full .full) (.cutY 23616 (.cutX 9952 (.cutY 23584 .full .full) (.cutY 23584 .full .full)) .full)) (.cutX 9920 (.cutY 23744 .full .full) (.cutY 23744 .full .full)))) .empty) .empty) .empty))))) .empty)) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 .empty (.cutY 10240 (.cutX 23552 (.cutY 9216 (.cutX 23040 (.cutY 8704 .empty (.cutX 22784 .empty (.cutY 8960 .empty (.cutX 22912 (.cutY 9088 (.cutX 22848 (.cutY 9024 .full .full) (.cutY 9024 .full .full)) (.cutX 22848 (.cutY 9152 .full (.cutX 22816 (.cutY 9184 .full .full) (.cutY 9184 .full .full))) (.cutY 9152 .full .full))) (.cutY 9088 .full .full))))) .empty) .empty) (.cutY 9216 .empty (.cutX 24064 (.cutY 9728 .empty (.cutX 23808 (.cutY 9984 (.cutX 23680 (.cutY 9856 .full (.cutX 23616 (.cutY 9920 .full (.cutX 23584 (.cutY 9952 .full .full) (.cutY 9952 .full .full))) (.cutY 9920 .full .full))) (.cutY 9856 .full (.cutX 23744 (.cutY 9920 .full .full) (.cutY 9920 .full .full)))) .empty) .empty)) .empty))) .empty)) .empty))) .empty) .empty))

theorem metadata42 : 0<67962893 ∧ 35<128 ∧ 89<128 ∧ 1<4 ∧
    7504/4160=1 ∧ 7504%4160=3344 ∧ ∀ i, (leaves42 i).Valid 8 := by
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

noncomputable def phaseMass42 : ℝ := singlePhaseMass (67962893/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw42 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass42_eq : phaseMass42 = (67962893/1638400000000 : ℝ) := by
  unfold phaseMass42
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw42 output42 cover42 source42
    (gridTreeUnionCheck_sound 32768 raw42 output42 cover42 source42 tree42 checked42)
    _ (by norm_num) _, areaUnits42]
  norm_num

-- Frozen phase 5951, atom 196, type 0, source (1,69).
def leavesData43 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,0⟩))) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves43 : Fin 13 → DyadicLeaf := leavesData43.get
def raw43 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 1 69 leaves43 i
def outputData43 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨256,320,17664,17728⟩) (.node (.single ⟨256,320,17728,17792⟩) (.single ⟨320,384,17664,17728⟩))) (.node (.single ⟨320,384,17728,17792⟩) (.node (.single ⟨256,384,17792,17920⟩) (.single ⟨384,448,17664,17728⟩)))) (.node (.node (.single ⟨384,448,17728,17792⟩) (.node (.single ⟨448,480,17664,17696⟩) (.single ⟨448,480,17696,17728⟩))) (.node (.node (.single ⟨480,512,17664,17696⟩) (.single ⟨480,512,17696,17728⟩)) (.node (.single ⟨448,512,17728,17792⟩) (.single ⟨384,512,17792,17920⟩))))) (.node (.node (.node (.single ⟨14848,14976,32256,32384⟩) (.node (.single ⟨14848,14976,32384,32512⟩) (.single ⟨14976,15040,32256,32320⟩))) (.node (.single ⟨14976,15040,32320,32384⟩) (.node (.single ⟨15040,15072,32256,32288⟩) (.single ⟨15040,15072,32288,32320⟩)))) (.node (.node (.single ⟨15072,15104,32256,32288⟩) (.node (.single ⟨15072,15104,32288,32320⟩) (.single ⟨15040,15104,32320,32384⟩))) (.node (.node (.single ⟨14976,15040,32384,32448⟩) (.single ⟨14976,15040,32448,32512⟩)) (.node (.single ⟨15040,15104,32384,32448⟩) (.single ⟨15040,15104,32448,32512⟩)))))) (.node (.node (.node (.node (.single ⟨17664,17728,256,320⟩) (.node (.single ⟨17664,17728,320,384⟩) (.single ⟨17728,17792,256,320⟩))) (.node (.single ⟨17728,17792,320,384⟩) (.node (.single ⟨17664,17728,384,448⟩) (.single ⟨17664,17696,448,480⟩)))) (.node (.node (.single ⟨17664,17696,480,512⟩) (.node (.single ⟨17696,17728,448,480⟩) (.single ⟨17696,17728,480,512⟩))) (.node (.node (.single ⟨17728,17792,384,448⟩) (.single ⟨17728,17792,448,512⟩)) (.node (.single ⟨17792,17920,256,384⟩) (.single ⟨17792,17920,384,512⟩))))) (.node (.node (.node (.single ⟨32256,32384,14848,14976⟩) (.node (.single ⟨32256,32320,14976,15040⟩) (.single ⟨32256,32288,15040,15072⟩))) (.node (.single ⟨32256,32288,15072,15104⟩) (.node (.single ⟨32288,32320,15040,15072⟩) (.single ⟨32288,32320,15072,15104⟩)))) (.node (.node (.single ⟨32320,32384,14976,15040⟩) (.node (.single ⟨32320,32384,15040,15104⟩) (.single ⟨32384,32512,14848,14976⟩))) (.node (.node (.single ⟨32384,32448,14976,15040⟩) (.single ⟨32384,32448,15040,15104⟩)) (.node (.single ⟨32448,32512,14976,15040⟩) (.single ⟨32448,32512,15040,15104⟩)))))))
def output43 : Fin 52 → GridBox := outputData43.get
def coverData43 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 0))) (.node (.node (.single 26) (.single 51)) (.node (.single 25) (.single 1))))) (.node (.node (.node (.single 28) (.node (.single 50) (.single 23))) (.node (.single 2) (.node (.single 27) (.single 49)))) (.node (.node (.single 24) (.node (.single 3) (.single 29))) (.node (.node (.single 48) (.single 22)) (.node (.single 5) (.single 30)))))) (.node (.node (.node (.node (.single 46) (.node (.single 21) (.single 6))) (.node (.single 35) (.node (.single 45) (.single 16)))) (.node (.node (.single 11) (.node (.single 36) (.single 40))) (.node (.node (.single 15) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData43 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.single 20) (.node (.single 0) (.single 24)))) (.node (.node (.single 28) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 35))) (.node (.single 31) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.node (.single 17) (.single 13))) (.node (.single 21) (.node (.single 25) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 34) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 30) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover43 (i : Fin 52) : Fin 52 := ⟨coverData43.get i % 52, Nat.mod_lt _ (by decide)⟩
def source43 (i : Fin 52) : Fin 52 := ⟨sourceData43.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree43 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 (.cutX 1024 (.cutY 17408 .empty (.cutX 512 (.cutY 17920 (.cutX 256 .empty (.cutY 17664 .empty (.cutX 384 (.cutY 17792 (.cutX 320 (.cutY 17728 .full .full) (.cutY 17728 .full .full)) .full) (.cutY 17792 (.cutX 448 (.cutY 17728 .full .full) (.cutY 17728 (.cutX 480 (.cutY 17696 .full .full) (.cutY 17696 .full .full)) .full)) .full)))) .empty) .empty)) .empty) .empty) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 .empty (.cutX 15360 (.cutY 31744 .empty (.cutX 14848 .empty (.cutY 32256 .empty (.cutX 15104 (.cutY 32512 (.cutX 14976 (.cutY 32384 .full .full) (.cutY 32384 (.cutX 15040 (.cutY 32320 .full .full) (.cutY 32320 (.cutX 15072 (.cutY 32288 .full .full) (.cutY 32288 .full .full)) .full)) (.cutX 15040 (.cutY 32448 .full .full) (.cutY 32448 .full .full)))) .empty) .empty)))) .empty)))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 (.cutX 17408 .empty (.cutY 1024 (.cutX 17920 (.cutY 512 (.cutX 17664 .empty (.cutY 256 .empty (.cutX 17792 (.cutY 384 (.cutX 17728 (.cutY 320 .full .full) (.cutY 320 .full .full)) (.cutX 17728 (.cutY 448 .full (.cutX 17696 (.cutY 480 .full .full) (.cutY 480 .full .full))) (.cutY 448 .full .full))) (.cutY 384 .full .full)))) .empty) .empty) .empty)) .empty) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 .empty (.cutX 31744 .empty (.cutY 15360 (.cutX 32256 .empty (.cutY 14848 .empty (.cutX 32512 (.cutY 15104 (.cutX 32384 (.cutY 14976 .full (.cutX 32320 (.cutY 15040 .full (.cutX 32288 (.cutY 15072 .full .full) (.cutY 15072 .full .full))) (.cutY 15040 .full .full))) (.cutY 14976 .full (.cutX 32448 (.cutY 15040 .full .full) (.cutY 15040 .full .full)))) .empty) .empty))) .empty)))))))) .empty))

theorem metadata43 : 0<114037843 ∧ 1<128 ∧ 69<128 ∧ 0<4 ∧
    196/4160=0 ∧ 196%4160=196 ∧ ∀ i, (leaves43 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData43).mp
    (by decide +kernel)

theorem sourceChecked43_0 : ∀ i : Fin 52,
    (fun i => output43 i = raw43 (source43 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked43 : ∀ i : Fin 52, (fun i => output43 i = raw43 (source43 i)) i :=
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

theorem areaUnits43 : gridUnionAreaUnits output43 = 262144 := by decide +kernel

noncomputable def phaseMass43 : ℝ := singlePhaseMass (114037843/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw43 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass43_eq : phaseMass43 = (114037843/1638400000000 : ℝ) := by
  unfold phaseMass43
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw43 output43 cover43 source43
    (gridTreeUnionCheck_sound 32768 raw43 output43 cover43 source43 tree43 checked43)
    _ (by norm_num) _, areaUnits43]
  norm_num

-- Frozen phase 5952, atom 4480, type 1, source (2,68).
def leavesData44 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves44 : Fin 7 → DyadicLeaf := leavesData44.get
def raw44 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 2 68 leaves44 i
def outputData44 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨512,640,17408,17536⟩) (.node (.single ⟨512,640,17536,17664⟩) (.single ⟨640,704,17408,17472⟩))) (.node (.node (.single ⟨640,704,17472,17536⟩) (.single ⟨704,768,17408,17472⟩)) (.node (.single ⟨704,768,17472,17536⟩) (.single ⟨640,768,17536,17664⟩)))) (.node (.node (.single ⟨15104,15232,32000,32128⟩) (.node (.single ⟨15104,15232,32128,32256⟩) (.single ⟨15232,15296,32000,32064⟩))) (.node (.node (.single ⟨15232,15296,32064,32128⟩) (.single ⟨15296,15360,32000,32064⟩)) (.node (.single ⟨15296,15360,32064,32128⟩) (.single ⟨15232,15360,32128,32256⟩))))) (.node (.node (.node (.single ⟨17408,17536,512,640⟩) (.node (.single ⟨17408,17472,640,704⟩) (.single ⟨17408,17472,704,768⟩))) (.node (.node (.single ⟨17472,17536,640,704⟩) (.single ⟨17472,17536,704,768⟩)) (.node (.single ⟨17536,17664,512,640⟩) (.single ⟨17536,17664,640,768⟩)))) (.node (.node (.single ⟨32000,32128,15104,15232⟩) (.node (.single ⟨32000,32064,15232,15296⟩) (.single ⟨32000,32064,15296,15360⟩))) (.node (.node (.single ⟨32064,32128,15232,15296⟩) (.single ⟨32064,32128,15296,15360⟩)) (.node (.single ⟨32128,32256,15104,15232⟩) (.single ⟨32128,32256,15232,15360⟩))))))
def output44 : Fin 28 → GridBox := outputData44.get
def coverData44 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData44 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover44 (i : Fin 28) : Fin 28 := ⟨coverData44.get i % 28, Nat.mod_lt _ (by decide)⟩
def source44 (i : Fin 28) : Fin 28 := ⟨sourceData44.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree44 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 (.cutX 1024 (.cutY 17408 .empty (.cutX 512 .empty (.cutY 17920 (.cutX 768 (.cutY 17664 (.cutX 640 (.cutY 17536 .full .full) (.cutY 17536 (.cutX 704 (.cutY 17472 .full .full) (.cutY 17472 .full .full)) .full)) .empty) .empty) .empty))) .empty) .empty) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 .empty (.cutX 15360 (.cutY 31744 .empty (.cutX 14848 .empty (.cutY 32256 (.cutX 15104 .empty (.cutY 32000 .empty (.cutX 15232 (.cutY 32128 .full .full) (.cutY 32128 (.cutX 15296 (.cutY 32064 .full .full) (.cutY 32064 .full .full)) .full)))) .empty))) .empty)))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 (.cutX 17408 .empty (.cutY 1024 (.cutX 17920 (.cutY 512 .empty (.cutX 17664 (.cutY 768 (.cutX 17536 (.cutY 640 .full (.cutX 17472 (.cutY 704 .full .full) (.cutY 704 .full .full))) (.cutY 640 .full .full)) .empty) .empty)) .empty) .empty)) .empty) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 .empty (.cutX 31744 .empty (.cutY 15360 (.cutX 32256 (.cutY 14848 .empty (.cutX 32000 .empty (.cutY 15104 .empty (.cutX 32128 (.cutY 15232 .full (.cutX 32064 (.cutY 15296 .full .full) (.cutY 15296 .full .full))) (.cutY 15232 .full .full))))) .empty) .empty)))))))) .empty))

theorem metadata44 : 0<202148459 ∧ 2<128 ∧ 68<128 ∧ 1<4 ∧
    4480/4160=1 ∧ 4480%4160=320 ∧ ∀ i, (leaves44 i).Valid 8 := by
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

noncomputable def phaseMass44 : ℝ := singlePhaseMass (202148459/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw44 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass44_eq : phaseMass44 = (202148459/1638400000000 : ℝ) := by
  unfold phaseMass44
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw44 output44 cover44 source44
    (gridTreeUnionCheck_sound 32768 raw44 output44 cover44 source44 tree44 checked44)
    _ (by norm_num) _, areaUnits44]
  norm_num

-- Frozen phase 5953, atom 4227, type 1, source (0,67).
def leavesData45 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves45 : Fin 7 → DyadicLeaf := leavesData45.get
def raw45 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 0 67 leaves45 i
def outputData45 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨0,128,17152,17280⟩) (.node (.single ⟨0,128,17280,17408⟩) (.single ⟨128,192,17152,17216⟩))) (.node (.node (.single ⟨128,192,17216,17280⟩) (.single ⟨192,256,17152,17216⟩)) (.node (.single ⟨192,256,17216,17280⟩) (.single ⟨128,256,17280,17408⟩)))) (.node (.node (.single ⟨15360,15488,32512,32640⟩) (.node (.single ⟨15360,15488,32640,32768⟩) (.single ⟨15488,15552,32512,32576⟩))) (.node (.node (.single ⟨15488,15552,32576,32640⟩) (.single ⟨15552,15616,32512,32576⟩)) (.node (.single ⟨15552,15616,32576,32640⟩) (.single ⟨15488,15616,32640,32768⟩))))) (.node (.node (.node (.single ⟨17152,17280,0,128⟩) (.node (.single ⟨17152,17216,128,192⟩) (.single ⟨17152,17216,192,256⟩))) (.node (.node (.single ⟨17216,17280,128,192⟩) (.single ⟨17216,17280,192,256⟩)) (.node (.single ⟨17280,17408,0,128⟩) (.single ⟨17280,17408,128,256⟩)))) (.node (.node (.single ⟨32512,32640,15360,15488⟩) (.node (.single ⟨32512,32576,15488,15552⟩) (.single ⟨32512,32576,15552,15616⟩))) (.node (.node (.single ⟨32576,32640,15488,15552⟩) (.single ⟨32576,32640,15552,15616⟩)) (.node (.single ⟨32640,32768,15360,15488⟩) (.single ⟨32640,32768,15488,15616⟩))))))
def output45 : Fin 28 → GridBox := outputData45.get
def coverData45 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData45 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover45 (i : Fin 28) : Fin 28 := ⟨coverData45.get i % 28, Nat.mod_lt _ (by decide)⟩
def source45 (i : Fin 28) : Fin 28 := ⟨sourceData45.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree45 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 (.cutX 1024 (.cutY 17408 (.cutX 512 (.cutY 16896 .empty (.cutX 256 (.cutY 17152 .empty (.cutX 128 (.cutY 17280 .full .full) (.cutY 17280 (.cutX 192 (.cutY 17216 .full .full) (.cutY 17216 .full .full)) .full))) .empty)) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 .empty (.cutX 15360 .empty (.cutY 31744 .empty (.cutX 15872 (.cutY 32256 .empty (.cutX 15616 (.cutY 32512 .empty (.cutX 15488 (.cutY 32640 .full .full) (.cutY 32640 (.cutX 15552 (.cutY 32576 .full .full) (.cutY 32576 .full .full)) .full))) .empty)) .empty)))))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 (.cutX 17408 (.cutY 1024 (.cutX 16896 .empty (.cutY 512 (.cutX 17152 .empty (.cutY 256 (.cutX 17280 (.cutY 128 .full (.cutX 17216 (.cutY 192 .full .full) (.cutY 192 .full .full))) (.cutY 128 .full .full)) .empty)) .empty)) .empty) .empty) .empty) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 .empty (.cutX 31744 .empty (.cutY 15360 .empty (.cutX 32256 .empty (.cutY 15872 (.cutX 32512 .empty (.cutY 15616 (.cutX 32640 (.cutY 15488 .full (.cutX 32576 (.cutY 15552 .full .full) (.cutY 15552 .full .full))) (.cutY 15488 .full .full)) .empty)) .empty)))))))))) .empty))

theorem metadata45 : 0<202148459 ∧ 0<128 ∧ 67<128 ∧ 1<4 ∧
    4227/4160=1 ∧ 4227%4160=67 ∧ ∀ i, (leaves45 i).Valid 8 := by
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

noncomputable def phaseMass45 : ℝ := singlePhaseMass (202148459/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw45 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass45_eq : phaseMass45 = (202148459/1638400000000 : ℝ) := by
  unfold phaseMass45
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw45 output45 cover45 source45
    (gridTreeUnionCheck_sound 32768 raw45 output45 cover45 source45 tree45 checked45)
    _ (by norm_num) _, areaUnits45]
  norm_num

-- Frozen phase 5954, atom 7562, type 1, source (36,90).
def leavesData46 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves46 : Fin 10 → DyadicLeaf := leavesData46.get
def raw46 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 36 90 leaves46 i
def outputData46 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨9216,9344,23040,23168⟩) (.single ⟨9216,9344,23168,23296⟩)) (.node (.single ⟨9344,9408,23040,23104⟩) (.node (.single ⟨9344,9408,23104,23168⟩) (.single ⟨9408,9440,23040,23072⟩)))) (.node (.node (.single ⟨9408,9440,23072,23104⟩) (.single ⟨9440,9472,23040,23072⟩)) (.node (.single ⟨9440,9472,23072,23104⟩) (.node (.single ⟨9408,9472,23104,23168⟩) (.single ⟨9344,9472,23168,23296⟩))))) (.node (.node (.node (.single ⟨9472,9600,23296,23424⟩) (.single ⟨9472,9600,23424,23552⟩)) (.node (.single ⟨9600,9664,23296,23360⟩) (.node (.single ⟨9600,9664,23360,23424⟩) (.single ⟨9664,9696,23296,23328⟩)))) (.node (.node (.single ⟨9664,9696,23328,23360⟩) (.single ⟨9696,9728,23296,23328⟩)) (.node (.single ⟨9696,9728,23328,23360⟩) (.node (.single ⟨9664,9728,23360,23424⟩) (.single ⟨9600,9728,23424,23552⟩)))))) (.node (.node (.node (.node (.single ⟨23040,23168,9216,9344⟩) (.single ⟨23040,23104,9344,9408⟩)) (.node (.single ⟨23040,23072,9408,9440⟩) (.node (.single ⟨23040,23072,9440,9472⟩) (.single ⟨23072,23104,9408,9440⟩)))) (.node (.node (.single ⟨23072,23104,9440,9472⟩) (.single ⟨23104,23168,9344,9408⟩)) (.node (.single ⟨23104,23168,9408,9472⟩) (.node (.single ⟨23168,23296,9216,9344⟩) (.single ⟨23168,23296,9344,9472⟩))))) (.node (.node (.node (.single ⟨23296,23424,9472,9600⟩) (.single ⟨23296,23360,9600,9664⟩)) (.node (.single ⟨23296,23328,9664,9696⟩) (.node (.single ⟨23296,23328,9696,9728⟩) (.single ⟨23328,23360,9664,9696⟩)))) (.node (.node (.single ⟨23328,23360,9696,9728⟩) (.single ⟨23360,23424,9600,9664⟩)) (.node (.single ⟨23360,23424,9664,9728⟩) (.node (.single ⟨23424,23552,9472,9600⟩) (.single ⟨23424,23552,9600,9728⟩)))))))
def output46 : Fin 40 → GridBox := outputData46.get
def coverData46 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 28) (.single 38)) (.node (.single 11) (.node (.single 9) (.single 29))))) (.node (.node (.node (.single 30) (.single 10)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 26) (.node (.single 36) (.single 13)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 23) (.single 33)))) (.node (.node (.single 16) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))))
def sourceData46 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover46 (i : Fin 40) : Fin 40 := ⟨coverData46.get i % 40, Nat.mod_lt _ (by decide)⟩
def source46 (i : Fin 40) : Fin 40 := ⟨sourceData46.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree46 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 .empty (.cutX 9216 .empty (.cutY 23552 (.cutX 9728 (.cutY 23040 .empty (.cutX 9472 (.cutY 23296 (.cutX 9344 (.cutY 23168 .full .full) (.cutY 23168 (.cutX 9408 (.cutY 23104 .full .full) (.cutY 23104 (.cutX 9440 (.cutY 23072 .full .full) (.cutY 23072 .full .full)) .full)) .full)) .empty) (.cutY 23296 .empty (.cutX 9600 (.cutY 23424 .full .full) (.cutY 23424 (.cutX 9664 (.cutY 23360 .full .full) (.cutY 23360 (.cutX 9696 (.cutY 23328 .full .full) (.cutY 23328 .full .full)) .full)) .full))))) .empty) .empty))) .empty)) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 .empty (.cutY 10240 (.cutX 23552 (.cutY 9216 .empty (.cutX 23040 .empty (.cutY 9728 (.cutX 23296 (.cutY 9472 (.cutX 23168 (.cutY 9344 .full (.cutX 23104 (.cutY 9408 .full (.cutX 23072 (.cutY 9440 .full .full) (.cutY 9440 .full .full))) (.cutY 9408 .full .full))) (.cutY 9344 .full .full)) .empty) (.cutY 9472 .empty (.cutX 23424 (.cutY 9600 .full (.cutX 23360 (.cutY 9664 .full (.cutX 23328 (.cutY 9696 .full .full) (.cutY 9696 .full .full))) (.cutY 9664 .full .full))) (.cutY 9600 .full .full)))) .empty))) .empty) .empty)) .empty))) .empty) .empty))

theorem metadata46 : 0<67962893 ∧ 36<128 ∧ 90<128 ∧ 1<4 ∧
    7562/4160=1 ∧ 7562%4160=3402 ∧ ∀ i, (leaves46 i).Valid 8 := by
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

noncomputable def phaseMass46 : ℝ := singlePhaseMass (67962893/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw46 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass46_eq : phaseMass46 = (67962893/1638400000000 : ℝ) := by
  unfold phaseMass46
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw46 output46 cover46 source46
    (gridTreeUnionCheck_sound 32768 raw46 output46 cover46 source46 tree46 checked46)
    _ (by norm_num) _, areaUnits46]
  norm_num

-- Frozen phase 5955, atom 6737, type 1, source (24,81).
def leavesData47 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩))) (.node (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.single ⟨3,7,1⟩))) (.node (.node (.single ⟨4,14,0⟩) (.single ⟨4,14,1⟩)) (.node (.single ⟨4,15,0⟩) (.single ⟨4,15,1⟩)))))
def leaves47 : Fin 16 → DyadicLeaf := leavesData47.get
def raw47 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 24 81 leaves47 i
def outputData47 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨6144,6208,20736,20800⟩) (.single ⟨6144,6208,20800,20864⟩)) (.node (.single ⟨6208,6272,20736,20800⟩) (.single ⟨6208,6272,20800,20864⟩))) (.node (.node (.single ⟨6144,6272,20864,20992⟩) (.single ⟨6272,6336,20736,20800⟩)) (.node (.single ⟨6272,6336,20800,20864⟩) (.single ⟨6336,6368,20736,20768⟩)))) (.node (.node (.node (.single ⟨6336,6368,20768,20800⟩) (.single ⟨6368,6384,20736,20752⟩)) (.node (.single ⟨6368,6384,20752,20768⟩) (.single ⟨6384,6400,20736,20752⟩))) (.node (.node (.single ⟨6384,6400,20752,20768⟩) (.single ⟨6368,6400,20768,20800⟩)) (.node (.single ⟨6336,6400,20800,20864⟩) (.single ⟨6272,6400,20864,20992⟩))))) (.node (.node (.node (.node (.single ⟨11776,11904,26368,26496⟩) (.single ⟨11776,11904,26496,26624⟩)) (.node (.single ⟨11904,11968,26368,26432⟩) (.single ⟨11904,11968,26432,26496⟩))) (.node (.node (.single ⟨11968,12000,26368,26400⟩) (.single ⟨11968,12000,26400,26432⟩)) (.node (.single ⟨12000,12016,26368,26384⟩) (.single ⟨12000,12016,26384,26400⟩)))) (.node (.node (.node (.single ⟨12016,12032,26368,26384⟩) (.single ⟨12016,12032,26384,26400⟩)) (.node (.single ⟨12000,12032,26400,26432⟩) (.single ⟨11968,12032,26432,26496⟩))) (.node (.node (.single ⟨11904,11968,26496,26560⟩) (.single ⟨11904,11968,26560,26624⟩)) (.node (.single ⟨11968,12032,26496,26560⟩) (.single ⟨11968,12032,26560,26624⟩)))))) (.node (.node (.node (.node (.node (.single ⟨20736,20800,6144,6208⟩) (.single ⟨20736,20800,6208,6272⟩)) (.node (.single ⟨20800,20864,6144,6208⟩) (.single ⟨20800,20864,6208,6272⟩))) (.node (.node (.single ⟨20736,20800,6272,6336⟩) (.single ⟨20736,20768,6336,6368⟩)) (.node (.single ⟨20736,20752,6368,6384⟩) (.single ⟨20736,20752,6384,6400⟩)))) (.node (.node (.node (.single ⟨20752,20768,6368,6384⟩) (.single ⟨20752,20768,6384,6400⟩)) (.node (.single ⟨20768,20800,6336,6368⟩) (.single ⟨20768,20800,6368,6400⟩))) (.node (.node (.single ⟨20800,20864,6272,6336⟩) (.single ⟨20800,20864,6336,6400⟩)) (.node (.single ⟨20864,20992,6144,6272⟩) (.single ⟨20864,20992,6272,6400⟩))))) (.node (.node (.node (.node (.single ⟨26368,26496,11776,11904⟩) (.single ⟨26368,26432,11904,11968⟩)) (.node (.single ⟨26368,26400,11968,12000⟩) (.single ⟨26368,26384,12000,12016⟩))) (.node (.node (.single ⟨26368,26384,12016,12032⟩) (.single ⟨26384,26400,12000,12016⟩)) (.node (.single ⟨26384,26400,12016,12032⟩) (.single ⟨26400,26432,11968,12000⟩)))) (.node (.node (.node (.single ⟨26400,26432,12000,12032⟩) (.single ⟨26432,26496,11904,11968⟩)) (.node (.single ⟨26432,26496,11968,12032⟩) (.single ⟨26496,26624,11776,11904⟩))) (.node (.node (.single ⟨26496,26560,11904,11968⟩) (.single ⟨26496,26560,11968,12032⟩)) (.node (.single ⟨26560,26624,11904,11968⟩) (.single ⟨26560,26624,11968,12032⟩)))))))
def output47 : Fin 64 → GridBox := outputData47.get
def coverData47 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 46)) (.node (.single 59) (.single 17))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16)))) (.node (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31))) (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29))))) (.node (.node (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30))) (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28)))) (.node (.node (.node (.single 5) (.single 36)) (.node (.single 58) (.single 27))) (.node (.node (.single 6) (.single 44)) (.node (.single 57) (.single 19)))))) (.node (.node (.node (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18))) (.node (.node (.single 7) (.single 37)) (.node (.single 56) (.single 26)))) (.node (.node (.node (.single 8) (.single 42)) (.node (.single 55) (.single 21))) (.node (.node (.single 13) (.single 43)) (.node (.single 50) (.single 20))))) (.node (.node (.node (.node (.single 9) (.single 38)) (.node (.single 54) (.single 25))) (.node (.node (.single 10) (.single 40)) (.node (.single 53) (.single 23)))) (.node (.node (.node (.single 11) (.single 39)) (.node (.single 52) (.single 24))) (.node (.node (.single 12) (.single 41)) (.node (.single 51) (.single 22)))))))
def sourceData47 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.single 20))) (.node (.node (.single 0) (.single 24)) (.node (.single 28) (.single 36)))) (.node (.node (.node (.single 40) (.single 48)) (.node (.single 52) (.single 56))) (.node (.node (.single 60) (.single 44)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.node (.single 7) (.single 3)) (.node (.single 35) (.single 31))) (.node (.node (.single 47) (.single 43)) (.node (.single 63) (.single 55)))) (.node (.node (.node (.single 59) (.single 51)) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.single 21))) (.node (.node (.single 25) (.single 37)) (.node (.single 49) (.single 57)))) (.node (.node (.node (.single 53) (.single 61)) (.node (.single 41) (.single 45))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.node (.single 6) (.single 34)) (.node (.single 46) (.single 62))) (.node (.node (.single 58) (.single 54)) (.node (.single 50) (.single 42)))) (.node (.node (.node (.single 38) (.single 30)) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover47 (i : Fin 64) : Fin 64 := ⟨coverData47.get i % 64, Nat.mod_lt _ (by decide)⟩
def source47 (i : Fin 64) : Fin 64 := ⟨sourceData47.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree47 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 (.cutX 7168 (.cutY 21504 (.cutX 6656 (.cutY 20992 (.cutX 6400 (.cutY 20736 .empty (.cutX 6272 (.cutY 20864 (.cutX 6208 (.cutY 20800 .full .full) (.cutY 20800 .full .full)) .full) (.cutY 20864 (.cutX 6336 (.cutY 20800 .full .full) (.cutY 20800 (.cutX 6368 (.cutY 20768 .full .full) (.cutY 20768 (.cutX 6384 (.cutY 20752 .full .full) (.cutY 20752 .full .full)) .full)) .full)) .full))) .empty) .empty) .empty) .empty) .empty) .empty)))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 (.cutX 11264 .empty (.cutY 25600 .empty (.cutX 11776 .empty (.cutY 26112 .empty (.cutX 12032 (.cutY 26368 .empty (.cutX 11904 (.cutY 26496 .full .full) (.cutY 26496 (.cutX 11968 (.cutY 26432 .full .full) (.cutY 26432 (.cutX 12000 (.cutY 26400 .full .full) (.cutY 26400 (.cutX 12016 (.cutY 26384 .full .full) (.cutY 26384 .full .full)) .full)) .full)) (.cutX 11968 (.cutY 26560 .full .full) (.cutY 26560 .full .full))))) .empty))))) .empty)) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 .empty (.cutX 21504 (.cutY 7168 (.cutX 20992 (.cutY 6656 (.cutX 20736 .empty (.cutY 6400 (.cutX 20864 (.cutY 6272 (.cutX 20800 (.cutY 6208 .full .full) (.cutY 6208 .full .full)) (.cutX 20800 (.cutY 6336 .full (.cutX 20768 (.cutY 6368 .full (.cutX 20752 (.cutY 6384 .full .full) (.cutY 6384 .full .full))) (.cutY 6368 .full .full))) (.cutY 6336 .full .full))) (.cutY 6272 .full .full)) .empty)) .empty) .empty) .empty) .empty)) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 .empty (.cutX 25600 .empty (.cutY 11264 .empty (.cutX 26112 .empty (.cutY 11776 .empty (.cutX 26368 .empty (.cutY 12032 (.cutX 26496 (.cutY 11904 .full (.cutX 26432 (.cutY 11968 .full (.cutX 26400 (.cutY 12000 .full (.cutX 26384 (.cutY 12016 .full .full) (.cutY 12016 .full .full))) (.cutY 12000 .full .full))) (.cutY 11968 .full .full))) (.cutY 11904 .full (.cutX 26560 (.cutY 11968 .full .full) (.cutY 11968 .full .full)))) .empty))))))) .empty) .empty) .empty))) .empty))

theorem metadata47 : 0<144359671 ∧ 24<128 ∧ 81<128 ∧ 1<4 ∧
    6737/4160=1 ∧ 6737%4160=2577 ∧ ∀ i, (leaves47 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData47).mp
    (by decide +kernel)

theorem sourceChecked47_0 : ∀ i : Fin 64,
    (fun i => output47 i = raw47 (source47 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked47 : ∀ i : Fin 64, (fun i => output47 i = raw47 (source47 i)) i :=
  forallFin_of_zero_offset (fun i => output47 i = raw47 (source47 i)) sourceChecked47_0

theorem coverChecked47_0 : ∀ i : Fin 64,
    (fun i => (output47 (cover47 i)).ContainsBox (raw47 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked47 : ∀ i : Fin 64, (fun i => (output47 (cover47 i)).ContainsBox (raw47 i)) i :=
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

noncomputable def phaseMass47 : ℝ := singlePhaseMass (144359671/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw47 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass47_eq : phaseMass47 = (144359671/1638400000000 : ℝ) := by
  unfold phaseMass47
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw47 output47 cover47 source47
    (gridTreeUnionCheck_sound 32768 raw47 output47 cover47 source47 tree47 checked47)
    _ (by norm_num) _, areaUnits47]
  norm_num

-- Frozen phase 5956, atom 6217, type 1, source (18,77).
def leavesData48 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves48 : Fin 13 → DyadicLeaf := leavesData48.get
def raw48 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 18 77 leaves48 i
def outputData48 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨4608,4672,19712,19776⟩) (.node (.single ⟨4608,4672,19776,19840⟩) (.single ⟨4672,4736,19712,19776⟩))) (.node (.single ⟨4672,4736,19776,19840⟩) (.node (.single ⟨4608,4736,19840,19968⟩) (.single ⟨4736,4800,19712,19776⟩)))) (.node (.node (.single ⟨4736,4800,19776,19840⟩) (.node (.single ⟨4800,4832,19712,19744⟩) (.single ⟨4800,4832,19744,19776⟩))) (.node (.node (.single ⟨4832,4864,19712,19744⟩) (.single ⟨4832,4864,19744,19776⟩)) (.node (.single ⟨4800,4864,19776,19840⟩) (.single ⟨4736,4864,19840,19968⟩))))) (.node (.node (.node (.single ⟨12800,12928,27904,28032⟩) (.node (.single ⟨12800,12928,28032,28160⟩) (.single ⟨12928,12992,27904,27968⟩))) (.node (.single ⟨12928,12992,27968,28032⟩) (.node (.single ⟨12992,13024,27904,27936⟩) (.single ⟨12992,13024,27936,27968⟩)))) (.node (.node (.single ⟨13024,13056,27904,27936⟩) (.node (.single ⟨13024,13056,27936,27968⟩) (.single ⟨12992,13056,27968,28032⟩))) (.node (.node (.single ⟨12928,12992,28032,28096⟩) (.single ⟨12928,12992,28096,28160⟩)) (.node (.single ⟨12992,13056,28032,28096⟩) (.single ⟨12992,13056,28096,28160⟩)))))) (.node (.node (.node (.node (.single ⟨19712,19776,4608,4672⟩) (.node (.single ⟨19712,19776,4672,4736⟩) (.single ⟨19776,19840,4608,4672⟩))) (.node (.single ⟨19776,19840,4672,4736⟩) (.node (.single ⟨19712,19776,4736,4800⟩) (.single ⟨19712,19744,4800,4832⟩)))) (.node (.node (.single ⟨19712,19744,4832,4864⟩) (.node (.single ⟨19744,19776,4800,4832⟩) (.single ⟨19744,19776,4832,4864⟩))) (.node (.node (.single ⟨19776,19840,4736,4800⟩) (.single ⟨19776,19840,4800,4864⟩)) (.node (.single ⟨19840,19968,4608,4736⟩) (.single ⟨19840,19968,4736,4864⟩))))) (.node (.node (.node (.single ⟨27904,28032,12800,12928⟩) (.node (.single ⟨27904,27968,12928,12992⟩) (.single ⟨27904,27936,12992,13024⟩))) (.node (.single ⟨27904,27936,13024,13056⟩) (.node (.single ⟨27936,27968,12992,13024⟩) (.single ⟨27936,27968,13024,13056⟩)))) (.node (.node (.single ⟨27968,28032,12928,12992⟩) (.node (.single ⟨27968,28032,12992,13056⟩) (.single ⟨28032,28160,12800,12928⟩))) (.node (.node (.single ⟨28032,28096,12928,12992⟩) (.single ⟨28032,28096,12992,13056⟩)) (.node (.single ⟨28096,28160,12928,12992⟩) (.single ⟨28096,28160,12992,13056⟩)))))))
def output48 : Fin 52 → GridBox := outputData48.get
def coverData48 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData48 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover48 (i : Fin 52) : Fin 52 := ⟨coverData48.get i % 52, Nat.mod_lt _ (by decide)⟩
def source48 (i : Fin 52) : Fin 52 := ⟨sourceData48.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree48 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 .empty (.cutX 5120 (.cutY 19456 .empty (.cutX 4608 .empty (.cutY 19968 (.cutX 4864 (.cutY 19712 .empty (.cutX 4736 (.cutY 19840 (.cutX 4672 (.cutY 19776 .full .full) (.cutY 19776 .full .full)) .full) (.cutY 19840 (.cutX 4800 (.cutY 19776 .full .full) (.cutY 19776 (.cutX 4832 (.cutY 19744 .full .full) (.cutY 19744 .full .full)) .full)) .full))) .empty) .empty))) .empty)) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 .empty (.cutX 13312 (.cutY 27648 .empty (.cutX 12800 .empty (.cutY 28160 (.cutX 13056 (.cutY 27904 .empty (.cutX 12928 (.cutY 28032 .full .full) (.cutY 28032 (.cutX 12992 (.cutY 27968 .full .full) (.cutY 27968 (.cutX 13024 (.cutY 27936 .full .full) (.cutY 27936 .full .full)) .full)) (.cutX 12992 (.cutY 28096 .full .full) (.cutY 28096 .full .full))))) .empty) .empty))) .empty)) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 (.cutX 19456 .empty (.cutY 5120 (.cutX 19968 (.cutY 4608 .empty (.cutX 19712 .empty (.cutY 4864 (.cutX 19840 (.cutY 4736 (.cutX 19776 (.cutY 4672 .full .full) (.cutY 4672 .full .full)) (.cutX 19776 (.cutY 4800 .full (.cutX 19744 (.cutY 4832 .full .full) (.cutY 4832 .full .full))) (.cutY 4800 .full .full))) (.cutY 4736 .full .full)) .empty))) .empty) .empty)) .empty))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 (.cutX 27648 .empty (.cutY 13312 (.cutX 28160 (.cutY 12800 .empty (.cutX 27904 .empty (.cutY 13056 (.cutX 28032 (.cutY 12928 .full (.cutX 27968 (.cutY 12992 .full (.cutX 27936 (.cutY 13024 .full .full) (.cutY 13024 .full .full))) (.cutY 12992 .full .full))) (.cutY 12928 .full (.cutX 28096 (.cutY 12992 .full .full) (.cutY 12992 .full .full)))) .empty))) .empty) .empty)) .empty))) .empty))) .empty))

theorem metadata48 : 0<157738472 ∧ 18<128 ∧ 77<128 ∧ 1<4 ∧
    6217/4160=1 ∧ 6217%4160=2057 ∧ ∀ i, (leaves48 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData48).mp
    (by decide +kernel)

theorem sourceChecked48_0 : ∀ i : Fin 52,
    (fun i => output48 i = raw48 (source48 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked48 : ∀ i : Fin 52, (fun i => output48 i = raw48 (source48 i)) i :=
  forallFin_of_zero_offset (fun i => output48 i = raw48 (source48 i)) sourceChecked48_0

theorem coverChecked48_0 : ∀ i : Fin 52,
    (fun i => (output48 (cover48 i)).ContainsBox (raw48 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked48 : ∀ i : Fin 52, (fun i => (output48 (cover48 i)).ContainsBox (raw48 i)) i :=
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

noncomputable def phaseMass48 : ℝ := singlePhaseMass (157738472/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw48 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass48_eq : phaseMass48 = (19717309/204800000000 : ℝ) := by
  unfold phaseMass48
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw48 output48 cover48 source48
    (gridTreeUnionCheck_sound 32768 raw48 output48 cover48 source48 tree48 checked48)
    _ (by norm_num) _, areaUnits48]
  norm_num

-- Frozen phase 5957, atom 2152, type 0, source (19,81).
def leavesData49 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,0⟩))) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves49 : Fin 13 → DyadicLeaf := leavesData49.get
def raw49 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 19 81 leaves49 i
def outputData49 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨4864,4928,20736,20800⟩) (.node (.single ⟨4864,4928,20800,20864⟩) (.single ⟨4928,4992,20736,20800⟩))) (.node (.single ⟨4928,4992,20800,20864⟩) (.node (.single ⟨4864,4992,20864,20992⟩) (.single ⟨4992,5056,20736,20800⟩)))) (.node (.node (.single ⟨4992,5056,20800,20864⟩) (.node (.single ⟨5056,5088,20736,20768⟩) (.single ⟨5056,5088,20768,20800⟩))) (.node (.node (.single ⟨5088,5120,20736,20768⟩) (.single ⟨5088,5120,20768,20800⟩)) (.node (.single ⟨5056,5120,20800,20864⟩) (.single ⟨4992,5120,20864,20992⟩))))) (.node (.node (.node (.single ⟨11776,11904,27648,27776⟩) (.node (.single ⟨11776,11904,27776,27904⟩) (.single ⟨11904,11968,27648,27712⟩))) (.node (.single ⟨11904,11968,27712,27776⟩) (.node (.single ⟨11968,12000,27648,27680⟩) (.single ⟨11968,12000,27680,27712⟩)))) (.node (.node (.single ⟨12000,12032,27648,27680⟩) (.node (.single ⟨12000,12032,27680,27712⟩) (.single ⟨11968,12032,27712,27776⟩))) (.node (.node (.single ⟨11904,11968,27776,27840⟩) (.single ⟨11904,11968,27840,27904⟩)) (.node (.single ⟨11968,12032,27776,27840⟩) (.single ⟨11968,12032,27840,27904⟩)))))) (.node (.node (.node (.node (.single ⟨20736,20800,4864,4928⟩) (.node (.single ⟨20736,20800,4928,4992⟩) (.single ⟨20800,20864,4864,4928⟩))) (.node (.single ⟨20800,20864,4928,4992⟩) (.node (.single ⟨20736,20800,4992,5056⟩) (.single ⟨20736,20768,5056,5088⟩)))) (.node (.node (.single ⟨20736,20768,5088,5120⟩) (.node (.single ⟨20768,20800,5056,5088⟩) (.single ⟨20768,20800,5088,5120⟩))) (.node (.node (.single ⟨20800,20864,4992,5056⟩) (.single ⟨20800,20864,5056,5120⟩)) (.node (.single ⟨20864,20992,4864,4992⟩) (.single ⟨20864,20992,4992,5120⟩))))) (.node (.node (.node (.single ⟨27648,27776,11776,11904⟩) (.node (.single ⟨27648,27712,11904,11968⟩) (.single ⟨27648,27680,11968,12000⟩))) (.node (.single ⟨27648,27680,12000,12032⟩) (.node (.single ⟨27680,27712,11968,12000⟩) (.single ⟨27680,27712,12000,12032⟩)))) (.node (.node (.single ⟨27712,27776,11904,11968⟩) (.node (.single ⟨27712,27776,11968,12032⟩) (.single ⟨27776,27904,11776,11904⟩))) (.node (.node (.single ⟨27776,27840,11904,11968⟩) (.single ⟨27776,27840,11968,12032⟩)) (.node (.single ⟨27840,27904,11904,11968⟩) (.single ⟨27840,27904,11968,12032⟩)))))))
def output49 : Fin 52 → GridBox := outputData49.get
def coverData49 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 0))) (.node (.node (.single 26) (.single 51)) (.node (.single 25) (.single 1))))) (.node (.node (.node (.single 28) (.node (.single 50) (.single 23))) (.node (.single 2) (.node (.single 27) (.single 49)))) (.node (.node (.single 24) (.node (.single 3) (.single 29))) (.node (.node (.single 48) (.single 22)) (.node (.single 5) (.single 30)))))) (.node (.node (.node (.node (.single 46) (.node (.single 21) (.single 6))) (.node (.single 35) (.node (.single 45) (.single 16)))) (.node (.node (.single 11) (.node (.single 36) (.single 40))) (.node (.node (.single 15) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData49 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.single 20) (.node (.single 0) (.single 24)))) (.node (.node (.single 28) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 35))) (.node (.single 31) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.node (.single 17) (.single 13))) (.node (.single 21) (.node (.single 25) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 34) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 30) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover49 (i : Fin 52) : Fin 52 := ⟨coverData49.get i % 52, Nat.mod_lt _ (by decide)⟩
def source49 (i : Fin 52) : Fin 52 := ⟨sourceData49.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree49 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 (.cutY 21504 (.cutX 4608 .empty (.cutY 20992 (.cutX 4864 .empty (.cutY 20736 .empty (.cutX 4992 (.cutY 20864 (.cutX 4928 (.cutY 20800 .full .full) (.cutY 20800 .full .full)) .full) (.cutY 20864 (.cutX 5056 (.cutY 20800 .full .full) (.cutY 20800 (.cutX 5088 (.cutY 20768 .full .full) (.cutY 20768 .full .full)) .full)) .full)))) .empty)) .empty) .empty) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 .empty (.cutY 27648 .empty (.cutX 11776 .empty (.cutY 28160 (.cutX 12032 (.cutY 27904 (.cutX 11904 (.cutY 27776 .full .full) (.cutY 27776 (.cutX 11968 (.cutY 27712 .full .full) (.cutY 27712 (.cutX 12000 (.cutY 27680 .full .full) (.cutY 27680 .full .full)) .full)) (.cutX 11968 (.cutY 27840 .full .full) (.cutY 27840 .full .full)))) .empty) .empty) .empty)))))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 (.cutY 5120 (.cutX 20992 (.cutY 4608 .empty (.cutX 20736 .empty (.cutY 4864 .empty (.cutX 20864 (.cutY 4992 (.cutX 20800 (.cutY 4928 .full .full) (.cutY 4928 .full .full)) (.cutX 20800 (.cutY 5056 .full (.cutX 20768 (.cutY 5088 .full .full) (.cutY 5088 .full .full))) (.cutY 5056 .full .full))) (.cutY 4992 .full .full))))) .empty) .empty) .empty) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 .empty (.cutY 11264 .empty (.cutX 28160 (.cutY 11776 .empty (.cutX 27904 (.cutY 12032 (.cutX 27776 (.cutY 11904 .full (.cutX 27712 (.cutY 11968 .full (.cutX 27680 (.cutY 12000 .full .full) (.cutY 12000 .full .full))) (.cutY 11968 .full .full))) (.cutY 11904 .full (.cutX 27840 (.cutY 11968 .full .full) (.cutY 11968 .full .full)))) .empty) .empty)) .empty))))) .empty) .empty))) .empty))

theorem metadata49 : 0<152546139 ∧ 19<128 ∧ 81<128 ∧ 0<4 ∧
    2152/4160=0 ∧ 2152%4160=2152 ∧ ∀ i, (leaves49 i).Valid 8 := by
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

noncomputable def phaseMass49 : ℝ := singlePhaseMass (152546139/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw49 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass49_eq : phaseMass49 = (152546139/1638400000000 : ℝ) := by
  unfold phaseMass49
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw49 output49 cover49 source49
    (gridTreeUnionCheck_sound 32768 raw49 output49 cover49 source49 tree49 checked49)
    _ (by norm_num) _, areaUnits49]
  norm_num

-- Frozen phase 5958, atom 2580, type 0, source (24,84).
def leavesData50 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩)))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩)))))
def leaves50 : Fin 10 → DyadicLeaf := leavesData50.get
def raw50 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 24 84 leaves50 i
def outputData50 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨6144,6208,21504,21568⟩) (.single ⟨6144,6208,21568,21632⟩)) (.node (.single ⟨6208,6272,21504,21568⟩) (.node (.single ⟨6208,6272,21568,21632⟩) (.single ⟨6144,6272,21632,21760⟩)))) (.node (.node (.single ⟨6272,6336,21504,21568⟩) (.single ⟨6272,6336,21568,21632⟩)) (.node (.single ⟨6336,6400,21504,21568⟩) (.node (.single ⟨6336,6400,21568,21632⟩) (.single ⟨6272,6400,21632,21760⟩))))) (.node (.node (.node (.single ⟨11008,11136,26368,26496⟩) (.single ⟨11008,11136,26496,26624⟩)) (.node (.single ⟨11136,11200,26368,26432⟩) (.node (.single ⟨11136,11200,26432,26496⟩) (.single ⟨11200,11264,26368,26432⟩)))) (.node (.node (.single ⟨11200,11264,26432,26496⟩) (.single ⟨11136,11200,26496,26560⟩)) (.node (.single ⟨11136,11200,26560,26624⟩) (.node (.single ⟨11200,11264,26496,26560⟩) (.single ⟨11200,11264,26560,26624⟩)))))) (.node (.node (.node (.node (.single ⟨21504,21568,6144,6208⟩) (.single ⟨21504,21568,6208,6272⟩)) (.node (.single ⟨21568,21632,6144,6208⟩) (.node (.single ⟨21568,21632,6208,6272⟩) (.single ⟨21504,21568,6272,6336⟩)))) (.node (.node (.single ⟨21504,21568,6336,6400⟩) (.single ⟨21568,21632,6272,6336⟩)) (.node (.single ⟨21568,21632,6336,6400⟩) (.node (.single ⟨21632,21760,6144,6272⟩) (.single ⟨21632,21760,6272,6400⟩))))) (.node (.node (.node (.single ⟨26368,26496,11008,11136⟩) (.single ⟨26368,26432,11136,11200⟩)) (.node (.single ⟨26368,26432,11200,11264⟩) (.node (.single ⟨26432,26496,11136,11200⟩) (.single ⟨26432,26496,11200,11264⟩)))) (.node (.node (.single ⟨26496,26624,11008,11136⟩) (.single ⟨26496,26560,11136,11200⟩)) (.node (.single ⟨26496,26560,11200,11264⟩) (.node (.single ⟨26560,26624,11136,11200⟩) (.single ⟨26560,26624,11200,11264⟩)))))))
def output50 : Fin 40 → GridBox := outputData50.get
def coverData50 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 0) (.single 20))))) (.node (.node (.node (.single 39) (.single 19)) (.node (.single 1) (.node (.single 22) (.single 38)))) (.node (.node (.single 17) (.single 2)) (.node (.single 21) (.node (.single 37) (.single 18)))))) (.node (.node (.node (.node (.single 3) (.single 23)) (.node (.single 36) (.node (.single 16) (.single 5)))) (.node (.node (.single 24) (.single 34)) (.node (.single 15) (.node (.single 6) (.single 26))))) (.node (.node (.node (.single 33) (.single 13)) (.node (.single 7) (.node (.single 25) (.single 32)))) (.node (.node (.single 14) (.single 8)) (.node (.single 27) (.node (.single 31) (.single 12)))))))
def sourceData50 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 0)))) (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 39) (.node (.single 31) (.single 35)))) (.node (.node (.single 27) (.single 23)) (.node (.single 15) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.node (.single 21) (.single 25)))) (.node (.node (.single 33) (.single 29)) (.node (.single 37) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))) (.node (.node (.single 2) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))))))
def cover50 (i : Fin 40) : Fin 40 := ⟨coverData50.get i % 40, Nat.mod_lt _ (by decide)⟩
def source50 (i : Fin 40) : Fin 40 := ⟨sourceData50.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree50 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 (.cutX 7168 (.cutY 21504 .empty (.cutX 6656 (.cutY 22016 (.cutX 6400 (.cutY 21760 (.cutX 6272 (.cutY 21632 (.cutX 6208 (.cutY 21568 .full .full) (.cutY 21568 .full .full)) .full) (.cutY 21632 (.cutX 6336 (.cutY 21568 .full .full) (.cutY 21568 .full .full)) .full)) .empty) .empty) .empty) .empty)) .empty) .empty)))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 (.cutX 11264 (.cutY 25600 .empty (.cutX 10752 .empty (.cutY 26112 .empty (.cutX 11008 .empty (.cutY 26368 .empty (.cutX 11136 (.cutY 26496 .full .full) (.cutY 26496 (.cutX 11200 (.cutY 26432 .full .full) (.cutY 26432 .full .full)) (.cutX 11200 (.cutY 26560 .full .full) (.cutY 26560 .full .full))))))))) .empty) .empty)) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 .empty (.cutX 21504 .empty (.cutY 7168 (.cutX 22016 (.cutY 6656 (.cutX 21760 (.cutY 6400 (.cutX 21632 (.cutY 6272 (.cutX 21568 (.cutY 6208 .full .full) (.cutY 6208 .full .full)) (.cutX 21568 (.cutY 6336 .full .full) (.cutY 6336 .full .full))) (.cutY 6272 .full .full)) .empty) .empty) .empty) .empty) .empty))) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 .empty (.cutX 25600 .empty (.cutY 11264 (.cutX 26112 .empty (.cutY 10752 .empty (.cutX 26368 .empty (.cutY 11008 .empty (.cutX 26496 (.cutY 11136 .full (.cutX 26432 (.cutY 11200 .full .full) (.cutY 11200 .full .full))) (.cutY 11136 .full (.cutX 26560 (.cutY 11200 .full .full) (.cutY 11200 .full .full)))))))) .empty))) .empty) .empty) .empty))) .empty))

theorem metadata50 : 0<104681033 ∧ 24<128 ∧ 84<128 ∧ 0<4 ∧
    2580/4160=0 ∧ 2580%4160=2580 ∧ ∀ i, (leaves50 i).Valid 8 := by
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

noncomputable def phaseMass50 : ℝ := singlePhaseMass (104681033/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw50 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass50_eq : phaseMass50 = (104681033/1638400000000 : ℝ) := by
  unfold phaseMass50
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw50 output50 cover50 source50
    (gridTreeUnionCheck_sound 32768 raw50 output50 cover50 source50 tree50 checked50)
    _ (by norm_num) _, areaUnits50]
  norm_num

-- Frozen phase 5959, atom 3162, type 0, source (32,90).
def leavesData51 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩)))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩)))))
def leaves51 : Fin 10 → DyadicLeaf := leavesData51.get
def raw51 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 32 90 leaves51 i
def outputData51 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨8192,8256,23040,23104⟩) (.single ⟨8192,8256,23104,23168⟩)) (.node (.single ⟨8256,8320,23040,23104⟩) (.node (.single ⟨8256,8320,23104,23168⟩) (.single ⟨8192,8320,23168,23296⟩)))) (.node (.node (.single ⟨8320,8384,23040,23104⟩) (.single ⟨8320,8384,23104,23168⟩)) (.node (.single ⟨8384,8448,23040,23104⟩) (.node (.single ⟨8384,8448,23104,23168⟩) (.single ⟨8320,8448,23168,23296⟩))))) (.node (.node (.node (.single ⟨9472,9600,24320,24448⟩) (.single ⟨9472,9600,24448,24576⟩)) (.node (.single ⟨9600,9664,24320,24384⟩) (.node (.single ⟨9600,9664,24384,24448⟩) (.single ⟨9664,9728,24320,24384⟩)))) (.node (.node (.single ⟨9664,9728,24384,24448⟩) (.single ⟨9600,9664,24448,24512⟩)) (.node (.single ⟨9600,9664,24512,24576⟩) (.node (.single ⟨9664,9728,24448,24512⟩) (.single ⟨9664,9728,24512,24576⟩)))))) (.node (.node (.node (.node (.single ⟨23040,23104,8192,8256⟩) (.single ⟨23040,23104,8256,8320⟩)) (.node (.single ⟨23104,23168,8192,8256⟩) (.node (.single ⟨23104,23168,8256,8320⟩) (.single ⟨23040,23104,8320,8384⟩)))) (.node (.node (.single ⟨23040,23104,8384,8448⟩) (.single ⟨23104,23168,8320,8384⟩)) (.node (.single ⟨23104,23168,8384,8448⟩) (.node (.single ⟨23168,23296,8192,8320⟩) (.single ⟨23168,23296,8320,8448⟩))))) (.node (.node (.node (.single ⟨24320,24448,9472,9600⟩) (.single ⟨24320,24384,9600,9664⟩)) (.node (.single ⟨24320,24384,9664,9728⟩) (.node (.single ⟨24384,24448,9600,9664⟩) (.single ⟨24384,24448,9664,9728⟩)))) (.node (.node (.single ⟨24448,24576,9472,9600⟩) (.single ⟨24448,24512,9600,9664⟩)) (.node (.single ⟨24448,24512,9664,9728⟩) (.node (.single ⟨24512,24576,9600,9664⟩) (.single ⟨24512,24576,9664,9728⟩)))))))
def output51 : Fin 40 → GridBox := outputData51.get
def coverData51 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 0) (.single 20))))) (.node (.node (.node (.single 39) (.single 19)) (.node (.single 1) (.node (.single 22) (.single 38)))) (.node (.node (.single 17) (.single 2)) (.node (.single 21) (.node (.single 37) (.single 18)))))) (.node (.node (.node (.node (.single 3) (.single 23)) (.node (.single 36) (.node (.single 16) (.single 5)))) (.node (.node (.single 24) (.single 34)) (.node (.single 15) (.node (.single 6) (.single 26))))) (.node (.node (.node (.single 33) (.single 13)) (.node (.single 7) (.node (.single 25) (.single 32)))) (.node (.node (.single 14) (.single 8)) (.node (.single 27) (.node (.single 31) (.single 12)))))))
def sourceData51 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 0)))) (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 39) (.node (.single 31) (.single 35)))) (.node (.node (.single 27) (.single 23)) (.node (.single 15) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.node (.single 21) (.single 25)))) (.node (.node (.single 33) (.single 29)) (.node (.single 37) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))) (.node (.node (.single 2) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))))))
def cover51 (i : Fin 40) : Fin 40 := ⟨coverData51.get i % 40, Nat.mod_lt _ (by decide)⟩
def source51 (i : Fin 40) : Fin 40 := ⟨sourceData51.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree51 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 .empty (.cutX 9216 (.cutY 23552 (.cutX 8704 (.cutY 23040 .empty (.cutX 8448 (.cutY 23296 (.cutX 8320 (.cutY 23168 (.cutX 8256 (.cutY 23104 .full .full) (.cutY 23104 .full .full)) .full) (.cutY 23168 (.cutX 8384 (.cutY 23104 .full .full) (.cutY 23104 .full .full)) .full)) .empty) .empty)) .empty) .empty) (.cutY 23552 .empty (.cutX 9728 (.cutY 24064 .empty (.cutX 9472 .empty (.cutY 24320 .empty (.cutX 9600 (.cutY 24448 .full .full) (.cutY 24448 (.cutX 9664 (.cutY 24384 .full .full) (.cutY 24384 .full .full)) (.cutX 9664 (.cutY 24512 .full .full) (.cutY 24512 .full .full))))))) .empty)))) .empty)) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 .empty (.cutY 10240 (.cutX 23552 (.cutY 9216 (.cutX 23040 .empty (.cutY 8704 (.cutX 23296 (.cutY 8448 (.cutX 23168 (.cutY 8320 (.cutX 23104 (.cutY 8256 .full .full) (.cutY 8256 .full .full)) (.cutX 23104 (.cutY 8384 .full .full) (.cutY 8384 .full .full))) (.cutY 8320 .full .full)) .empty) .empty) .empty)) .empty) (.cutY 9216 .empty (.cutX 24064 .empty (.cutY 9728 (.cutX 24320 .empty (.cutY 9472 .empty (.cutX 24448 (.cutY 9600 .full (.cutX 24384 (.cutY 9664 .full .full) (.cutY 9664 .full .full))) (.cutY 9600 .full (.cutX 24512 (.cutY 9664 .full .full) (.cutY 9664 .full .full)))))) .empty)))) .empty)) .empty))) .empty) .empty))

theorem metadata51 : 0<75538780 ∧ 32<128 ∧ 90<128 ∧ 0<4 ∧
    3162/4160=0 ∧ 3162%4160=3162 ∧ ∀ i, (leaves51 i).Valid 8 := by
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

noncomputable def phaseMass51 : ℝ := singlePhaseMass (75538780/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw51 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass51_eq : phaseMass51 = (3776939/81920000000 : ℝ) := by
  unfold phaseMass51
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw51 output51 cover51 source51
    (gridTreeUnionCheck_sound 32768 raw51 output51 cover51 source51 tree51 checked51)
    _ (by norm_num) _, areaUnits51]
  norm_num

-- Frozen phase 5960, atom 7383, type 1, source (33,88).
def leavesData52 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves52 : Fin 7 → DyadicLeaf := leavesData52.get
def raw52 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 33 88 leaves52 i
def outputData52 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨8448,8576,22528,22656⟩) (.node (.single ⟨8448,8576,22656,22784⟩) (.single ⟨8576,8640,22528,22592⟩))) (.node (.node (.single ⟨8576,8640,22592,22656⟩) (.single ⟨8640,8704,22528,22592⟩)) (.node (.single ⟨8640,8704,22592,22656⟩) (.single ⟨8576,8704,22656,22784⟩)))) (.node (.node (.single ⟨9984,10112,24064,24192⟩) (.node (.single ⟨9984,10112,24192,24320⟩) (.single ⟨10112,10176,24064,24128⟩))) (.node (.node (.single ⟨10112,10176,24128,24192⟩) (.single ⟨10176,10240,24064,24128⟩)) (.node (.single ⟨10176,10240,24128,24192⟩) (.single ⟨10112,10240,24192,24320⟩))))) (.node (.node (.node (.single ⟨22528,22656,8448,8576⟩) (.node (.single ⟨22528,22592,8576,8640⟩) (.single ⟨22528,22592,8640,8704⟩))) (.node (.node (.single ⟨22592,22656,8576,8640⟩) (.single ⟨22592,22656,8640,8704⟩)) (.node (.single ⟨22656,22784,8448,8576⟩) (.single ⟨22656,22784,8576,8704⟩)))) (.node (.node (.single ⟨24064,24192,9984,10112⟩) (.node (.single ⟨24064,24128,10112,10176⟩) (.single ⟨24064,24128,10176,10240⟩))) (.node (.node (.single ⟨24128,24192,10112,10176⟩) (.single ⟨24128,24192,10176,10240⟩)) (.node (.single ⟨24192,24320,9984,10112⟩) (.single ⟨24192,24320,10112,10240⟩))))))
def output52 : Fin 28 → GridBox := outputData52.get
def coverData52 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData52 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover52 (i : Fin 28) : Fin 28 := ⟨coverData52.get i % 28, Nat.mod_lt _ (by decide)⟩
def source52 (i : Fin 28) : Fin 28 := ⟨sourceData52.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree52 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 .empty (.cutX 9216 (.cutY 23552 (.cutX 8704 (.cutY 23040 (.cutX 8448 .empty (.cutY 22784 (.cutX 8576 (.cutY 22656 .full .full) (.cutY 22656 (.cutX 8640 (.cutY 22592 .full .full) (.cutY 22592 .full .full)) .full)) .empty)) .empty) .empty) .empty) (.cutY 23552 .empty (.cutX 9728 .empty (.cutY 24064 .empty (.cutX 9984 .empty (.cutY 24320 (.cutX 10112 (.cutY 24192 .full .full) (.cutY 24192 (.cutX 10176 (.cutY 24128 .full .full) (.cutY 24128 .full .full)) .full)) .empty))))))) .empty)) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 .empty (.cutY 10240 (.cutX 23552 (.cutY 9216 (.cutX 23040 (.cutY 8704 (.cutX 22784 (.cutY 8448 .empty (.cutX 22656 (.cutY 8576 .full (.cutX 22592 (.cutY 8640 .full .full) (.cutY 8640 .full .full))) (.cutY 8576 .full .full))) .empty) .empty) .empty) .empty) (.cutY 9216 .empty (.cutX 24064 .empty (.cutY 9728 .empty (.cutX 24320 (.cutY 9984 .empty (.cutX 24192 (.cutY 10112 .full (.cutX 24128 (.cutY 10176 .full .full) (.cutY 10176 .full .full))) (.cutY 10112 .full .full))) .empty))))) .empty)) .empty))) .empty) .empty))

theorem metadata52 : 0<67962893 ∧ 33<128 ∧ 88<128 ∧ 1<4 ∧
    7383/4160=1 ∧ 7383%4160=3223 ∧ ∀ i, (leaves52 i).Valid 8 := by
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

noncomputable def phaseMass52 : ℝ := singlePhaseMass (67962893/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw52 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass52_eq : phaseMass52 = (67962893/1638400000000 : ℝ) := by
  unfold phaseMass52
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw52 output52 cover52 source52
    (gridTreeUnionCheck_sound 32768 raw52 output52 cover52 source52 tree52 checked52)
    _ (by norm_num) _, areaUnits52]
  norm_num

-- Frozen phase 5961, atom 2415, type 0, source (22,83).
def leavesData53 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,0⟩))) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves53 : Fin 13 → DyadicLeaf := leavesData53.get
def raw53 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 22 83 leaves53 i
def outputData53 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨5632,5696,21248,21312⟩) (.node (.single ⟨5632,5696,21312,21376⟩) (.single ⟨5696,5760,21248,21312⟩))) (.node (.single ⟨5696,5760,21312,21376⟩) (.node (.single ⟨5632,5760,21376,21504⟩) (.single ⟨5760,5824,21248,21312⟩)))) (.node (.node (.single ⟨5760,5824,21312,21376⟩) (.node (.single ⟨5824,5856,21248,21280⟩) (.single ⟨5824,5856,21280,21312⟩))) (.node (.node (.single ⟨5856,5888,21248,21280⟩) (.single ⟨5856,5888,21280,21312⟩)) (.node (.single ⟨5824,5888,21312,21376⟩) (.single ⟨5760,5888,21376,21504⟩))))) (.node (.node (.node (.single ⟨11264,11392,26880,27008⟩) (.node (.single ⟨11264,11392,27008,27136⟩) (.single ⟨11392,11456,26880,26944⟩))) (.node (.single ⟨11392,11456,26944,27008⟩) (.node (.single ⟨11456,11488,26880,26912⟩) (.single ⟨11456,11488,26912,26944⟩)))) (.node (.node (.single ⟨11488,11520,26880,26912⟩) (.node (.single ⟨11488,11520,26912,26944⟩) (.single ⟨11456,11520,26944,27008⟩))) (.node (.node (.single ⟨11392,11456,27008,27072⟩) (.single ⟨11392,11456,27072,27136⟩)) (.node (.single ⟨11456,11520,27008,27072⟩) (.single ⟨11456,11520,27072,27136⟩)))))) (.node (.node (.node (.node (.single ⟨21248,21312,5632,5696⟩) (.node (.single ⟨21248,21312,5696,5760⟩) (.single ⟨21312,21376,5632,5696⟩))) (.node (.single ⟨21312,21376,5696,5760⟩) (.node (.single ⟨21248,21312,5760,5824⟩) (.single ⟨21248,21280,5824,5856⟩)))) (.node (.node (.single ⟨21248,21280,5856,5888⟩) (.node (.single ⟨21280,21312,5824,5856⟩) (.single ⟨21280,21312,5856,5888⟩))) (.node (.node (.single ⟨21312,21376,5760,5824⟩) (.single ⟨21312,21376,5824,5888⟩)) (.node (.single ⟨21376,21504,5632,5760⟩) (.single ⟨21376,21504,5760,5888⟩))))) (.node (.node (.node (.single ⟨26880,27008,11264,11392⟩) (.node (.single ⟨26880,26944,11392,11456⟩) (.single ⟨26880,26912,11456,11488⟩))) (.node (.single ⟨26880,26912,11488,11520⟩) (.node (.single ⟨26912,26944,11456,11488⟩) (.single ⟨26912,26944,11488,11520⟩)))) (.node (.node (.single ⟨26944,27008,11392,11456⟩) (.node (.single ⟨26944,27008,11456,11520⟩) (.single ⟨27008,27136,11264,11392⟩))) (.node (.node (.single ⟨27008,27072,11392,11456⟩) (.single ⟨27008,27072,11456,11520⟩)) (.node (.single ⟨27072,27136,11392,11456⟩) (.single ⟨27072,27136,11456,11520⟩)))))))
def output53 : Fin 52 → GridBox := outputData53.get
def coverData53 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 0))) (.node (.node (.single 26) (.single 51)) (.node (.single 25) (.single 1))))) (.node (.node (.node (.single 28) (.node (.single 50) (.single 23))) (.node (.single 2) (.node (.single 27) (.single 49)))) (.node (.node (.single 24) (.node (.single 3) (.single 29))) (.node (.node (.single 48) (.single 22)) (.node (.single 5) (.single 30)))))) (.node (.node (.node (.node (.single 46) (.node (.single 21) (.single 6))) (.node (.single 35) (.node (.single 45) (.single 16)))) (.node (.node (.single 11) (.node (.single 36) (.single 40))) (.node (.node (.single 15) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData53 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.single 20) (.node (.single 0) (.single 24)))) (.node (.node (.single 28) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 35))) (.node (.single 31) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.node (.single 17) (.single 13))) (.node (.single 21) (.node (.single 25) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 34) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 30) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover53 (i : Fin 52) : Fin 52 := ⟨coverData53.get i % 52, Nat.mod_lt _ (by decide)⟩
def source53 (i : Fin 52) : Fin 52 := ⟨sourceData53.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree53 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 .empty (.cutY 21504 (.cutX 5632 .empty (.cutY 20992 .empty (.cutX 5888 (.cutY 21248 .empty (.cutX 5760 (.cutY 21376 (.cutX 5696 (.cutY 21312 .full .full) (.cutY 21312 .full .full)) .full) (.cutY 21376 (.cutX 5824 (.cutY 21312 .full .full) (.cutY 21312 (.cutX 5856 (.cutY 21280 .full .full) (.cutY 21280 .full .full)) .full)) .full))) .empty))) .empty)) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 .empty (.cutY 27648 (.cutX 11776 (.cutY 27136 (.cutX 11520 (.cutY 26880 .empty (.cutX 11392 (.cutY 27008 .full .full) (.cutY 27008 (.cutX 11456 (.cutY 26944 .full .full) (.cutY 26944 (.cutX 11488 (.cutY 26912 .full .full) (.cutY 26912 .full .full)) .full)) (.cutX 11456 (.cutY 27072 .full .full) (.cutY 27072 .full .full))))) .empty) .empty) .empty) .empty)))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 (.cutY 5120 .empty (.cutX 20992 .empty (.cutY 5632 .empty (.cutX 21248 .empty (.cutY 5888 (.cutX 21376 (.cutY 5760 (.cutX 21312 (.cutY 5696 .full .full) (.cutY 5696 .full .full)) (.cutX 21312 (.cutY 5824 .full (.cutX 21280 (.cutY 5856 .full .full) (.cutY 5856 .full .full))) (.cutY 5824 .full .full))) (.cutY 5760 .full .full)) .empty))))) .empty) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 (.cutY 11264 .empty (.cutX 27136 (.cutY 11776 (.cutX 26880 .empty (.cutY 11520 (.cutX 27008 (.cutY 11392 .full (.cutX 26944 (.cutY 11456 .full (.cutX 26912 (.cutY 11488 .full .full) (.cutY 11488 .full .full))) (.cutY 11456 .full .full))) (.cutY 11392 .full (.cutX 27072 (.cutY 11456 .full .full) (.cutY 11456 .full .full)))) .empty)) .empty) .empty)) .empty))) .empty) .empty))) .empty))

theorem metadata53 : 0<152546139 ∧ 22<128 ∧ 83<128 ∧ 0<4 ∧
    2415/4160=0 ∧ 2415%4160=2415 ∧ ∀ i, (leaves53 i).Valid 8 := by
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

noncomputable def phaseMass53 : ℝ := singlePhaseMass (152546139/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw53 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass53_eq : phaseMass53 = (152546139/1638400000000 : ℝ) := by
  unfold phaseMass53
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw53 output53 cover53 source53
    (gridTreeUnionCheck_sound 32768 raw53 output53 cover53 source53 tree53 checked53)
    _ (by norm_num) _, areaUnits53]
  norm_num

-- Frozen phase 5962, atom 7044, type 1, source (28,84).
def leavesData54 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩)))) (.node (.node (.node (.single ⟨2,1,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.single ⟨3,7,1⟩))) (.node (.node (.single ⟨4,14,0⟩) (.single ⟨4,14,1⟩)) (.node (.single ⟨4,15,0⟩) (.single ⟨4,15,1⟩)))))
def leaves54 : Fin 16 → DyadicLeaf := leavesData54.get
def raw54 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 28 84 leaves54 i
def outputData54 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨7168,7232,21504,21568⟩) (.single ⟨7168,7232,21568,21632⟩)) (.node (.single ⟨7232,7296,21504,21568⟩) (.single ⟨7232,7296,21568,21632⟩))) (.node (.node (.single ⟨7168,7296,21632,21760⟩) (.single ⟨7296,7360,21504,21568⟩)) (.node (.single ⟨7296,7360,21568,21632⟩) (.single ⟨7360,7392,21504,21536⟩)))) (.node (.node (.node (.single ⟨7360,7392,21536,21568⟩) (.single ⟨7392,7408,21504,21520⟩)) (.node (.single ⟨7392,7408,21520,21536⟩) (.single ⟨7408,7424,21504,21520⟩))) (.node (.node (.single ⟨7408,7424,21520,21536⟩) (.single ⟨7392,7424,21536,21568⟩)) (.node (.single ⟨7360,7424,21568,21632⟩) (.single ⟨7296,7424,21632,21760⟩))))) (.node (.node (.node (.node (.single ⟨11008,11136,25344,25472⟩) (.single ⟨11008,11136,25472,25600⟩)) (.node (.single ⟨11136,11200,25344,25408⟩) (.single ⟨11136,11200,25408,25472⟩))) (.node (.node (.single ⟨11200,11232,25344,25376⟩) (.single ⟨11200,11232,25376,25408⟩)) (.node (.single ⟨11232,11248,25344,25360⟩) (.single ⟨11232,11248,25360,25376⟩)))) (.node (.node (.node (.single ⟨11248,11264,25344,25360⟩) (.single ⟨11248,11264,25360,25376⟩)) (.node (.single ⟨11232,11264,25376,25408⟩) (.single ⟨11200,11264,25408,25472⟩))) (.node (.node (.single ⟨11136,11200,25472,25536⟩) (.single ⟨11136,11200,25536,25600⟩)) (.node (.single ⟨11200,11264,25472,25536⟩) (.single ⟨11200,11264,25536,25600⟩)))))) (.node (.node (.node (.node (.node (.single ⟨21504,21568,7168,7232⟩) (.single ⟨21504,21568,7232,7296⟩)) (.node (.single ⟨21568,21632,7168,7232⟩) (.single ⟨21568,21632,7232,7296⟩))) (.node (.node (.single ⟨21504,21568,7296,7360⟩) (.single ⟨21504,21536,7360,7392⟩)) (.node (.single ⟨21504,21520,7392,7408⟩) (.single ⟨21504,21520,7408,7424⟩)))) (.node (.node (.node (.single ⟨21520,21536,7392,7408⟩) (.single ⟨21520,21536,7408,7424⟩)) (.node (.single ⟨21536,21568,7360,7392⟩) (.single ⟨21536,21568,7392,7424⟩))) (.node (.node (.single ⟨21568,21632,7296,7360⟩) (.single ⟨21568,21632,7360,7424⟩)) (.node (.single ⟨21632,21760,7168,7296⟩) (.single ⟨21632,21760,7296,7424⟩))))) (.node (.node (.node (.node (.single ⟨25344,25472,11008,11136⟩) (.single ⟨25344,25408,11136,11200⟩)) (.node (.single ⟨25344,25376,11200,11232⟩) (.single ⟨25344,25360,11232,11248⟩))) (.node (.node (.single ⟨25344,25360,11248,11264⟩) (.single ⟨25360,25376,11232,11248⟩)) (.node (.single ⟨25360,25376,11248,11264⟩) (.single ⟨25376,25408,11200,11232⟩)))) (.node (.node (.node (.single ⟨25376,25408,11232,11264⟩) (.single ⟨25408,25472,11136,11200⟩)) (.node (.single ⟨25408,25472,11200,11264⟩) (.single ⟨25472,25600,11008,11136⟩))) (.node (.node (.single ⟨25472,25536,11136,11200⟩) (.single ⟨25472,25536,11200,11264⟩)) (.node (.single ⟨25536,25600,11136,11200⟩) (.single ⟨25536,25600,11200,11264⟩)))))))
def output54 : Fin 64 → GridBox := outputData54.get
def coverData54 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 46)) (.node (.single 59) (.single 17))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16)))) (.node (.node (.node (.single 5) (.single 36)) (.node (.single 58) (.single 27))) (.node (.node (.single 6) (.single 44)) (.node (.single 57) (.single 19))))) (.node (.node (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18))) (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31)))) (.node (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29))) (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30)))))) (.node (.node (.node (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28))) (.node (.node (.single 7) (.single 37)) (.node (.single 56) (.single 26)))) (.node (.node (.node (.single 8) (.single 42)) (.node (.single 55) (.single 21))) (.node (.node (.single 13) (.single 43)) (.node (.single 50) (.single 20))))) (.node (.node (.node (.node (.single 9) (.single 38)) (.node (.single 54) (.single 25))) (.node (.node (.single 10) (.single 40)) (.node (.single 53) (.single 23)))) (.node (.node (.node (.single 11) (.single 39)) (.node (.single 52) (.single 24))) (.node (.node (.single 12) (.single 41)) (.node (.single 51) (.single 22)))))))
def sourceData54 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 20) (.single 24)) (.node (.single 28) (.single 32))) (.node (.node (.single 0) (.single 8)) (.node (.single 12) (.single 36)))) (.node (.node (.node (.single 40) (.single 48)) (.node (.single 52) (.single 56))) (.node (.node (.single 60) (.single 44)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.node (.single 7) (.single 3)) (.node (.single 19) (.single 15))) (.node (.node (.single 47) (.single 43)) (.node (.single 63) (.single 55)))) (.node (.node (.node (.single 59) (.single 51)) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.node (.single 21) (.single 29)) (.node (.single 25) (.single 33))) (.node (.node (.single 9) (.single 37)) (.node (.single 49) (.single 57)))) (.node (.node (.node (.single 53) (.single 61)) (.node (.single 41) (.single 45))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.node (.single 6) (.single 18)) (.node (.single 46) (.single 62))) (.node (.node (.single 58) (.single 54)) (.node (.single 50) (.single 42)))) (.node (.node (.node (.single 38) (.single 14)) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover54 (i : Fin 64) : Fin 64 := ⟨coverData54.get i % 64, Nat.mod_lt _ (by decide)⟩
def source54 (i : Fin 64) : Fin 64 := ⟨sourceData54.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree54 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 (.cutX 7168 .empty (.cutY 21504 .empty (.cutX 7680 (.cutY 22016 (.cutX 7424 (.cutY 21760 (.cutX 7296 (.cutY 21632 (.cutX 7232 (.cutY 21568 .full .full) (.cutY 21568 .full .full)) .full) (.cutY 21632 (.cutX 7360 (.cutY 21568 .full .full) (.cutY 21568 (.cutX 7392 (.cutY 21536 .full .full) (.cutY 21536 (.cutX 7408 (.cutY 21520 .full .full) (.cutY 21520 .full .full)) .full)) .full)) .full)) .empty) .empty) .empty) .empty))) .empty)))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 (.cutX 11264 (.cutY 25600 (.cutX 10752 .empty (.cutY 25088 .empty (.cutX 11008 .empty (.cutY 25344 .empty (.cutX 11136 (.cutY 25472 .full .full) (.cutY 25472 (.cutX 11200 (.cutY 25408 .full .full) (.cutY 25408 (.cutX 11232 (.cutY 25376 .full .full) (.cutY 25376 (.cutX 11248 (.cutY 25360 .full .full) (.cutY 25360 .full .full)) .full)) .full)) (.cutX 11200 (.cutY 25536 .full .full) (.cutY 25536 .full .full)))))))) .empty) .empty) .empty)) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 .empty (.cutX 21504 .empty (.cutY 7168 .empty (.cutX 22016 (.cutY 7680 (.cutX 21760 (.cutY 7424 (.cutX 21632 (.cutY 7296 (.cutX 21568 (.cutY 7232 .full .full) (.cutY 7232 .full .full)) (.cutX 21568 (.cutY 7360 .full (.cutX 21536 (.cutY 7392 .full (.cutX 21520 (.cutY 7408 .full .full) (.cutY 7408 .full .full))) (.cutY 7392 .full .full))) (.cutY 7360 .full .full))) (.cutY 7296 .full .full)) .empty) .empty) .empty) .empty)))) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 .empty (.cutX 25600 (.cutY 11264 (.cutX 25088 .empty (.cutY 10752 .empty (.cutX 25344 .empty (.cutY 11008 .empty (.cutX 25472 (.cutY 11136 .full (.cutX 25408 (.cutY 11200 .full (.cutX 25376 (.cutY 11232 .full (.cutX 25360 (.cutY 11248 .full .full) (.cutY 11248 .full .full))) (.cutY 11232 .full .full))) (.cutY 11200 .full .full))) (.cutY 11136 .full (.cutX 25536 (.cutY 11200 .full .full) (.cutY 11200 .full .full)))))))) .empty) .empty)) .empty) .empty) .empty))) .empty))

theorem metadata54 : 0<144359671 ∧ 28<128 ∧ 84<128 ∧ 1<4 ∧
    7044/4160=1 ∧ 7044%4160=2884 ∧ ∀ i, (leaves54 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData54).mp
    (by decide +kernel)

theorem sourceChecked54_0 : ∀ i : Fin 64,
    (fun i => output54 i = raw54 (source54 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked54 : ∀ i : Fin 64, (fun i => output54 i = raw54 (source54 i)) i :=
  forallFin_of_zero_offset (fun i => output54 i = raw54 (source54 i)) sourceChecked54_0

theorem coverChecked54_0 : ∀ i : Fin 64,
    (fun i => (output54 (cover54 i)).ContainsBox (raw54 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked54 : ∀ i : Fin 64, (fun i => (output54 (cover54 i)).ContainsBox (raw54 i)) i :=
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

noncomputable def phaseMass54 : ℝ := singlePhaseMass (144359671/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw54 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass54_eq : phaseMass54 = (144359671/1638400000000 : ℝ) := by
  unfold phaseMass54
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw54 output54 cover54 source54
    (gridTreeUnionCheck_sound 32768 raw54 output54 cover54 source54 tree54 checked54)
    _ (by norm_num) _, areaUnits54]
  norm_num

-- Frozen phase 5963, atom 2887, type 0, source (28,87).
def leavesData55 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves55 : Fin 7 → DyadicLeaf := leavesData55.get
def raw55 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 28 87 leaves55 i
def outputData55 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨7168,7296,22272,22400⟩) (.node (.single ⟨7168,7296,22400,22528⟩) (.single ⟨7296,7360,22272,22336⟩))) (.node (.node (.single ⟨7296,7360,22336,22400⟩) (.single ⟨7360,7424,22272,22336⟩)) (.node (.single ⟨7360,7424,22336,22400⟩) (.single ⟨7296,7424,22400,22528⟩)))) (.node (.node (.single ⟨10240,10368,25344,25472⟩) (.node (.single ⟨10240,10368,25472,25600⟩) (.single ⟨10368,10432,25344,25408⟩))) (.node (.node (.single ⟨10368,10432,25408,25472⟩) (.single ⟨10432,10496,25344,25408⟩)) (.node (.single ⟨10432,10496,25408,25472⟩) (.single ⟨10368,10496,25472,25600⟩))))) (.node (.node (.node (.single ⟨22272,22400,7168,7296⟩) (.node (.single ⟨22272,22336,7296,7360⟩) (.single ⟨22272,22336,7360,7424⟩))) (.node (.node (.single ⟨22336,22400,7296,7360⟩) (.single ⟨22336,22400,7360,7424⟩)) (.node (.single ⟨22400,22528,7168,7296⟩) (.single ⟨22400,22528,7296,7424⟩)))) (.node (.node (.single ⟨25344,25472,10240,10368⟩) (.node (.single ⟨25344,25408,10368,10432⟩) (.single ⟨25344,25408,10432,10496⟩))) (.node (.node (.single ⟨25408,25472,10368,10432⟩) (.single ⟨25408,25472,10432,10496⟩)) (.node (.single ⟨25472,25600,10240,10368⟩) (.single ⟨25472,25600,10368,10496⟩))))))
def output55 : Fin 28 → GridBox := outputData55.get
def coverData55 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData55 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover55 (i : Fin 28) : Fin 28 := ⟨coverData55.get i % 28, Nat.mod_lt _ (by decide)⟩
def source55 (i : Fin 28) : Fin 28 := ⟨sourceData55.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree55 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 (.cutX 7168 .empty (.cutY 21504 .empty (.cutX 7680 (.cutY 22016 .empty (.cutX 7424 (.cutY 22272 .empty (.cutX 7296 (.cutY 22400 .full .full) (.cutY 22400 (.cutX 7360 (.cutY 22336 .full .full) (.cutY 22336 .full .full)) .full))) .empty)) .empty))) .empty)))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 (.cutX 11264 (.cutY 25600 (.cutX 10752 (.cutY 25088 .empty (.cutX 10496 (.cutY 25344 .empty (.cutX 10368 (.cutY 25472 .full .full) (.cutY 25472 (.cutX 10432 (.cutY 25408 .full .full) (.cutY 25408 .full .full)) .full))) .empty)) .empty) .empty) .empty) .empty)) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 .empty (.cutX 21504 .empty (.cutY 7168 .empty (.cutX 22016 .empty (.cutY 7680 (.cutX 22272 .empty (.cutY 7424 (.cutX 22400 (.cutY 7296 .full (.cutX 22336 (.cutY 7360 .full .full) (.cutY 7360 .full .full))) (.cutY 7296 .full .full)) .empty)) .empty))))) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 .empty (.cutX 25600 (.cutY 11264 (.cutX 25088 .empty (.cutY 10752 (.cutX 25344 .empty (.cutY 10496 (.cutX 25472 (.cutY 10368 .full (.cutX 25408 (.cutY 10432 .full .full) (.cutY 10432 .full .full))) (.cutY 10368 .full .full)) .empty)) .empty)) .empty) .empty)) .empty) .empty) .empty))) .empty))

theorem metadata55 : 0<104681033 ∧ 28<128 ∧ 87<128 ∧ 0<4 ∧
    2887/4160=0 ∧ 2887%4160=2887 ∧ ∀ i, (leaves55 i).Valid 8 := by
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

noncomputable def phaseMass55 : ℝ := singlePhaseMass (104681033/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw55 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass55_eq : phaseMass55 = (104681033/1638400000000 : ℝ) := by
  unfold phaseMass55
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw55 output55 cover55 source55
    (gridTreeUnionCheck_sound 32768 raw55 output55 cover55 source55 tree55 checked55)
    _ (by norm_num) _, areaUnits55]
  norm_num

-- Frozen phase 5964, atom 2959, type 0, source (29,88).
def leavesData56 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves56 : Fin 7 → DyadicLeaf := leavesData56.get
def raw56 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 29 88 leaves56 i
def outputData56 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨7424,7552,22528,22656⟩) (.node (.single ⟨7424,7552,22656,22784⟩) (.single ⟨7552,7616,22528,22592⟩))) (.node (.node (.single ⟨7552,7616,22592,22656⟩) (.single ⟨7616,7680,22528,22592⟩)) (.node (.single ⟨7616,7680,22592,22656⟩) (.single ⟨7552,7680,22656,22784⟩)))) (.node (.node (.single ⟨9984,10112,25088,25216⟩) (.node (.single ⟨9984,10112,25216,25344⟩) (.single ⟨10112,10176,25088,25152⟩))) (.node (.node (.single ⟨10112,10176,25152,25216⟩) (.single ⟨10176,10240,25088,25152⟩)) (.node (.single ⟨10176,10240,25152,25216⟩) (.single ⟨10112,10240,25216,25344⟩))))) (.node (.node (.node (.single ⟨22528,22656,7424,7552⟩) (.node (.single ⟨22528,22592,7552,7616⟩) (.single ⟨22528,22592,7616,7680⟩))) (.node (.node (.single ⟨22592,22656,7552,7616⟩) (.single ⟨22592,22656,7616,7680⟩)) (.node (.single ⟨22656,22784,7424,7552⟩) (.single ⟨22656,22784,7552,7680⟩)))) (.node (.node (.single ⟨25088,25216,9984,10112⟩) (.node (.single ⟨25088,25152,10112,10176⟩) (.single ⟨25088,25152,10176,10240⟩))) (.node (.node (.single ⟨25152,25216,10112,10176⟩) (.single ⟨25152,25216,10176,10240⟩)) (.node (.single ⟨25216,25344,9984,10112⟩) (.single ⟨25216,25344,10112,10240⟩))))))
def output56 : Fin 28 → GridBox := outputData56.get
def coverData56 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData56 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover56 (i : Fin 28) : Fin 28 := ⟨coverData56.get i % 28, Nat.mod_lt _ (by decide)⟩
def source56 (i : Fin 28) : Fin 28 := ⟨sourceData56.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree56 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 .empty (.cutX 7168 .empty (.cutY 23552 (.cutX 7680 (.cutY 23040 (.cutX 7424 .empty (.cutY 22784 (.cutX 7552 (.cutY 22656 .full .full) (.cutY 22656 (.cutX 7616 (.cutY 22592 .full .full) (.cutY 22592 .full .full)) .full)) .empty)) .empty) .empty) .empty)))))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 (.cutX 9216 .empty (.cutY 25600 (.cutX 9728 .empty (.cutY 25088 .empty (.cutX 9984 .empty (.cutY 25344 (.cutX 10112 (.cutY 25216 .full .full) (.cutY 25216 (.cutX 10176 (.cutY 25152 .full .full) (.cutY 25152 .full .full)) .full)) .empty)))) .empty)) .empty) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 .empty (.cutX 23552 (.cutY 7168 .empty (.cutX 23040 (.cutY 7680 (.cutX 22784 (.cutY 7424 .empty (.cutX 22656 (.cutY 7552 .full (.cutX 22592 (.cutY 7616 .full .full) (.cutY 7616 .full .full))) (.cutY 7552 .full .full))) .empty) .empty) .empty)) .empty))))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 (.cutX 25600 (.cutY 9216 .empty (.cutX 25088 .empty (.cutY 9728 .empty (.cutX 25344 (.cutY 9984 .empty (.cutX 25216 (.cutY 10112 .full (.cutX 25152 (.cutY 10176 .full .full) (.cutY 10176 .full .full))) (.cutY 10112 .full .full))) .empty)))) .empty) .empty) .empty) .empty) .empty))) .empty))

theorem metadata56 : 0<145899414 ∧ 29<128 ∧ 88<128 ∧ 0<4 ∧
    2959/4160=0 ∧ 2959%4160=2959 ∧ ∀ i, (leaves56 i).Valid 8 := by
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

noncomputable def phaseMass56 : ℝ := singlePhaseMass (145899414/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw56 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass56_eq : phaseMass56 = (72949707/819200000000 : ℝ) := by
  unfold phaseMass56
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw56 output56 cover56 source56
    (gridTreeUnionCheck_sound 32768 raw56 output56 cover56 source56 tree56 checked56)
    _ (by norm_num) _, areaUnits56]
  norm_num

-- Frozen phase 5965, atom 7116, type 1, source (29,85).
def leavesData57 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves57 : Fin 10 → DyadicLeaf := leavesData57.get
def raw57 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 29 85 leaves57 i
def outputData57 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨7424,7552,21760,21888⟩) (.single ⟨7424,7552,21888,22016⟩)) (.node (.single ⟨7552,7616,21760,21824⟩) (.node (.single ⟨7552,7616,21824,21888⟩) (.single ⟨7616,7648,21760,21792⟩)))) (.node (.node (.single ⟨7616,7648,21792,21824⟩) (.single ⟨7648,7680,21760,21792⟩)) (.node (.single ⟨7648,7680,21792,21824⟩) (.node (.single ⟨7616,7680,21824,21888⟩) (.single ⟨7552,7680,21888,22016⟩))))) (.node (.node (.node (.single ⟨10752,10880,25088,25216⟩) (.single ⟨10752,10880,25216,25344⟩)) (.node (.single ⟨10880,10944,25088,25152⟩) (.node (.single ⟨10880,10944,25152,25216⟩) (.single ⟨10944,10976,25088,25120⟩)))) (.node (.node (.single ⟨10944,10976,25120,25152⟩) (.single ⟨10976,11008,25088,25120⟩)) (.node (.single ⟨10976,11008,25120,25152⟩) (.node (.single ⟨10944,11008,25152,25216⟩) (.single ⟨10880,11008,25216,25344⟩)))))) (.node (.node (.node (.node (.single ⟨21760,21888,7424,7552⟩) (.single ⟨21760,21824,7552,7616⟩)) (.node (.single ⟨21760,21792,7616,7648⟩) (.node (.single ⟨21760,21792,7648,7680⟩) (.single ⟨21792,21824,7616,7648⟩)))) (.node (.node (.single ⟨21792,21824,7648,7680⟩) (.single ⟨21824,21888,7552,7616⟩)) (.node (.single ⟨21824,21888,7616,7680⟩) (.node (.single ⟨21888,22016,7424,7552⟩) (.single ⟨21888,22016,7552,7680⟩))))) (.node (.node (.node (.single ⟨25088,25216,10752,10880⟩) (.single ⟨25088,25152,10880,10944⟩)) (.node (.single ⟨25088,25120,10944,10976⟩) (.node (.single ⟨25088,25120,10976,11008⟩) (.single ⟨25120,25152,10944,10976⟩)))) (.node (.node (.single ⟨25120,25152,10976,11008⟩) (.single ⟨25152,25216,10880,10944⟩)) (.node (.single ⟨25152,25216,10944,11008⟩) (.node (.single ⟨25216,25344,10752,10880⟩) (.single ⟨25216,25344,10880,11008⟩)))))))
def output57 : Fin 40 → GridBox := outputData57.get
def coverData57 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 28) (.single 38)) (.node (.single 11) (.node (.single 9) (.single 29))))) (.node (.node (.node (.single 30) (.single 10)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 26) (.node (.single 36) (.single 13)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 23) (.single 33)))) (.node (.node (.single 16) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))))
def sourceData57 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover57 (i : Fin 40) : Fin 40 := ⟨coverData57.get i % 40, Nat.mod_lt _ (by decide)⟩
def source57 (i : Fin 40) : Fin 40 := ⟨sourceData57.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree57 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 (.cutX 7168 .empty (.cutY 21504 .empty (.cutX 7680 (.cutY 22016 (.cutX 7424 .empty (.cutY 21760 .empty (.cutX 7552 (.cutY 21888 .full .full) (.cutY 21888 (.cutX 7616 (.cutY 21824 .full .full) (.cutY 21824 (.cutX 7648 (.cutY 21792 .full .full) (.cutY 21792 .full .full)) .full)) .full)))) .empty) .empty))) .empty)))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 (.cutX 11264 (.cutY 25600 (.cutX 10752 .empty (.cutY 25088 .empty (.cutX 11008 (.cutY 25344 (.cutX 10880 (.cutY 25216 .full .full) (.cutY 25216 (.cutX 10944 (.cutY 25152 .full .full) (.cutY 25152 (.cutX 10976 (.cutY 25120 .full .full) (.cutY 25120 .full .full)) .full)) .full)) .empty) .empty))) .empty) .empty) .empty)) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 .empty (.cutX 21504 .empty (.cutY 7168 .empty (.cutX 22016 (.cutY 7680 (.cutX 21760 .empty (.cutY 7424 .empty (.cutX 21888 (.cutY 7552 .full (.cutX 21824 (.cutY 7616 .full (.cutX 21792 (.cutY 7648 .full .full) (.cutY 7648 .full .full))) (.cutY 7616 .full .full))) (.cutY 7552 .full .full)))) .empty) .empty)))) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 .empty (.cutX 25600 (.cutY 11264 (.cutX 25088 .empty (.cutY 10752 .empty (.cutX 25344 (.cutY 11008 (.cutX 25216 (.cutY 10880 .full (.cutX 25152 (.cutY 10944 .full (.cutX 25120 (.cutY 10976 .full .full) (.cutY 10976 .full .full))) (.cutY 10944 .full .full))) (.cutY 10880 .full .full)) .empty) .empty))) .empty) .empty)) .empty) .empty) .empty))) .empty))

theorem metadata57 : 0<144359671 ∧ 29<128 ∧ 85<128 ∧ 1<4 ∧
    7116/4160=1 ∧ 7116%4160=2956 ∧ ∀ i, (leaves57 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData57).mp
    (by decide +kernel)

theorem sourceChecked57_0 : ∀ i : Fin 40,
    (fun i => output57 i = raw57 (source57 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked57 : ∀ i : Fin 40, (fun i => output57 i = raw57 (source57 i)) i :=
  forallFin_of_zero_offset (fun i => output57 i = raw57 (source57 i)) sourceChecked57_0

theorem coverChecked57_0 : ∀ i : Fin 40,
    (fun i => (output57 (cover57 i)).ContainsBox (raw57 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked57 : ∀ i : Fin 40, (fun i => (output57 (cover57 i)).ContainsBox (raw57 i)) i :=
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

noncomputable def phaseMass57 : ℝ := singlePhaseMass (144359671/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw57 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass57_eq : phaseMass57 = (144359671/1638400000000 : ℝ) := by
  unfold phaseMass57
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw57 output57 cover57 source57
    (gridTreeUnionCheck_sound 32768 raw57 output57 cover57 source57 tree57 checked57)
    _ (by norm_num) _, areaUnits57]
  norm_num

-- Frozen phase 5966, atom 1253, type 0, source (10,73).
def leavesData58 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves58 : Fin 7 → DyadicLeaf := leavesData58.get
def raw58 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 10 73 leaves58 i
def outputData58 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨2560,2688,18688,18816⟩) (.node (.single ⟨2560,2688,18816,18944⟩) (.single ⟨2688,2752,18688,18752⟩))) (.node (.node (.single ⟨2688,2752,18752,18816⟩) (.single ⟨2752,2816,18688,18752⟩)) (.node (.single ⟨2752,2816,18752,18816⟩) (.single ⟨2688,2816,18816,18944⟩)))) (.node (.node (.single ⟨13824,13952,29952,30080⟩) (.node (.single ⟨13824,13952,30080,30208⟩) (.single ⟨13952,14016,29952,30016⟩))) (.node (.node (.single ⟨13952,14016,30016,30080⟩) (.single ⟨14016,14080,29952,30016⟩)) (.node (.single ⟨14016,14080,30016,30080⟩) (.single ⟨13952,14080,30080,30208⟩))))) (.node (.node (.node (.single ⟨18688,18816,2560,2688⟩) (.node (.single ⟨18688,18752,2688,2752⟩) (.single ⟨18688,18752,2752,2816⟩))) (.node (.node (.single ⟨18752,18816,2688,2752⟩) (.single ⟨18752,18816,2752,2816⟩)) (.node (.single ⟨18816,18944,2560,2688⟩) (.single ⟨18816,18944,2688,2816⟩)))) (.node (.node (.single ⟨29952,30080,13824,13952⟩) (.node (.single ⟨29952,30016,13952,14016⟩) (.single ⟨29952,30016,14016,14080⟩))) (.node (.node (.single ⟨30016,30080,13952,14016⟩) (.single ⟨30016,30080,14016,14080⟩)) (.node (.single ⟨30080,30208,13824,13952⟩) (.single ⟨30080,30208,13952,14080⟩))))))
def output58 : Fin 28 → GridBox := outputData58.get
def coverData58 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData58 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover58 (i : Fin 28) : Fin 28 := ⟨coverData58.get i % 28, Nat.mod_lt _ (by decide)⟩
def source58 (i : Fin 28) : Fin 28 := ⟨sourceData58.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree58 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 (.cutY 19456 (.cutX 2560 .empty (.cutY 18944 (.cutX 2816 (.cutY 18688 .empty (.cutX 2688 (.cutY 18816 .full .full) (.cutY 18816 (.cutX 2752 (.cutY 18752 .full .full) (.cutY 18752 .full .full)) .full))) .empty) .empty)) .empty) .empty))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 .empty (.cutY 29696 .empty (.cutX 13824 .empty (.cutY 30208 (.cutX 14080 (.cutY 29952 .empty (.cutX 13952 (.cutY 30080 .full .full) (.cutY 30080 (.cutX 14016 (.cutY 30016 .full .full) (.cutY 30016 .full .full)) .full))) .empty) .empty)))) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 (.cutY 3072 (.cutX 18944 (.cutY 2560 .empty (.cutX 18688 .empty (.cutY 2816 (.cutX 18816 (.cutY 2688 .full (.cutX 18752 (.cutY 2752 .full .full) (.cutY 2752 .full .full))) (.cutY 2688 .full .full)) .empty))) .empty) .empty) .empty))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 .empty (.cutY 13312 .empty (.cutX 30208 (.cutY 13824 .empty (.cutX 29952 .empty (.cutY 14080 (.cutX 30080 (.cutY 13952 .full (.cutX 30016 (.cutY 14016 .full .full) (.cutY 14016 .full .full))) (.cutY 13952 .full .full)) .empty))) .empty))) .empty) .empty))))) .empty))

theorem metadata58 : 0<48363413 ∧ 10<128 ∧ 73<128 ∧ 0<4 ∧
    1253/4160=0 ∧ 1253%4160=1253 ∧ ∀ i, (leaves58 i).Valid 8 := by
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

noncomputable def phaseMass58 : ℝ := singlePhaseMass (48363413/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw58 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass58_eq : phaseMass58 = (48363413/1638400000000 : ℝ) := by
  unfold phaseMass58
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw58 output58 cover58 source58
    (gridTreeUnionCheck_sound 32768 raw58 output58 cover58 source58 tree58 checked58)
    _ (by norm_num) _, areaUnits58]
  norm_num

-- Frozen phase 5967, atom 5624, type 1, source (12,72).
def leavesData59 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves59 : Fin 7 → DyadicLeaf := leavesData59.get
def raw59 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 12 72 leaves59 i
def outputData59 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3072,3200,18432,18560⟩) (.node (.single ⟨3072,3200,18560,18688⟩) (.single ⟨3200,3264,18432,18496⟩))) (.node (.node (.single ⟨3200,3264,18496,18560⟩) (.single ⟨3264,3328,18432,18496⟩)) (.node (.single ⟨3264,3328,18496,18560⟩) (.single ⟨3200,3328,18560,18688⟩)))) (.node (.node (.single ⟨14080,14208,29440,29568⟩) (.node (.single ⟨14080,14208,29568,29696⟩) (.single ⟨14208,14272,29440,29504⟩))) (.node (.node (.single ⟨14208,14272,29504,29568⟩) (.single ⟨14272,14336,29440,29504⟩)) (.node (.single ⟨14272,14336,29504,29568⟩) (.single ⟨14208,14336,29568,29696⟩))))) (.node (.node (.node (.single ⟨18432,18560,3072,3200⟩) (.node (.single ⟨18432,18496,3200,3264⟩) (.single ⟨18432,18496,3264,3328⟩))) (.node (.node (.single ⟨18496,18560,3200,3264⟩) (.single ⟨18496,18560,3264,3328⟩)) (.node (.single ⟨18560,18688,3072,3200⟩) (.single ⟨18560,18688,3200,3328⟩)))) (.node (.node (.single ⟨29440,29568,14080,14208⟩) (.node (.single ⟨29440,29504,14208,14272⟩) (.single ⟨29440,29504,14272,14336⟩))) (.node (.node (.single ⟨29504,29568,14208,14272⟩) (.single ⟨29504,29568,14272,14336⟩)) (.node (.single ⟨29568,29696,14080,14208⟩) (.single ⟨29568,29696,14208,14336⟩))))))
def output59 : Fin 28 → GridBox := outputData59.get
def coverData59 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData59 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover59 (i : Fin 28) : Fin 28 := ⟨coverData59.get i % 28, Nat.mod_lt _ (by decide)⟩
def source59 (i : Fin 28) : Fin 28 := ⟨sourceData59.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree59 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 .empty (.cutY 19456 (.cutX 3584 (.cutY 18944 (.cutX 3328 (.cutY 18688 (.cutX 3200 (.cutY 18560 .full .full) (.cutY 18560 (.cutX 3264 (.cutY 18496 .full .full) (.cutY 18496 .full .full)) .full)) .empty) .empty) .empty) .empty) .empty)))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 .empty (.cutY 29696 (.cutX 13824 .empty (.cutY 29184 .empty (.cutX 14080 .empty (.cutY 29440 .empty (.cutX 14208 (.cutY 29568 .full .full) (.cutY 29568 (.cutX 14272 (.cutY 29504 .full .full) (.cutY 29504 .full .full)) .full)))))) .empty)) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 (.cutY 3072 .empty (.cutX 18944 (.cutY 3584 (.cutX 18688 (.cutY 3328 (.cutX 18560 (.cutY 3200 .full (.cutX 18496 (.cutY 3264 .full .full) (.cutY 3264 .full .full))) (.cutY 3200 .full .full)) .empty) .empty) .empty) .empty)) .empty))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 (.cutY 13312 .empty (.cutX 29184 .empty (.cutY 13824 .empty (.cutX 29440 .empty (.cutY 14080 .empty (.cutX 29568 (.cutY 14208 .full (.cutX 29504 (.cutY 14272 .full .full) (.cutY 14272 .full .full))) (.cutY 14208 .full .full))))))) .empty) .empty) .empty))))) .empty))

theorem metadata59 : 0<94387549 ∧ 12<128 ∧ 72<128 ∧ 1<4 ∧
    5624/4160=1 ∧ 5624%4160=1464 ∧ ∀ i, (leaves59 i).Valid 8 := by
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

noncomputable def phaseMass59 : ℝ := singlePhaseMass (94387549/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw59 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass59_eq : phaseMass59 = (94387549/1638400000000 : ℝ) := by
  unfold phaseMass59
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw59 output59 cover59 source59
    (gridTreeUnionCheck_sound 32768 raw59 output59 cover59 source59 tree59 checked59)
    _ (by norm_num) _, areaUnits59]
  norm_num

-- Frozen phase 5968, atom 69, type 0, source (0,69).
def leavesData60 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves60 : Fin 10 → DyadicLeaf := leavesData60.get
def raw60 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 0 69 leaves60 i
def outputData60 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨0,64,17664,17728⟩) (.single ⟨0,64,17728,17792⟩)) (.node (.single ⟨64,128,17664,17728⟩) (.node (.single ⟨64,128,17728,17792⟩) (.single ⟨0,128,17792,17920⟩)))) (.node (.node (.single ⟨128,192,17664,17728⟩) (.single ⟨128,192,17728,17792⟩)) (.node (.single ⟨192,256,17664,17728⟩) (.node (.single ⟨192,256,17728,17792⟩) (.single ⟨128,256,17792,17920⟩))))) (.node (.node (.node (.single ⟨14848,14976,32512,32640⟩) (.single ⟨14848,14976,32640,32768⟩)) (.node (.single ⟨14976,15040,32512,32576⟩) (.node (.single ⟨14976,15040,32576,32640⟩) (.single ⟨15040,15104,32512,32576⟩)))) (.node (.node (.single ⟨15040,15104,32576,32640⟩) (.single ⟨14976,15040,32640,32704⟩)) (.node (.single ⟨14976,15040,32704,32768⟩) (.node (.single ⟨15040,15104,32640,32704⟩) (.single ⟨15040,15104,32704,32768⟩)))))) (.node (.node (.node (.node (.single ⟨17664,17728,0,64⟩) (.single ⟨17664,17728,64,128⟩)) (.node (.single ⟨17728,17792,0,64⟩) (.node (.single ⟨17728,17792,64,128⟩) (.single ⟨17664,17728,128,192⟩)))) (.node (.node (.single ⟨17664,17728,192,256⟩) (.single ⟨17728,17792,128,192⟩)) (.node (.single ⟨17728,17792,192,256⟩) (.node (.single ⟨17792,17920,0,128⟩) (.single ⟨17792,17920,128,256⟩))))) (.node (.node (.node (.single ⟨32512,32640,14848,14976⟩) (.single ⟨32512,32576,14976,15040⟩)) (.node (.single ⟨32512,32576,15040,15104⟩) (.node (.single ⟨32576,32640,14976,15040⟩) (.single ⟨32576,32640,15040,15104⟩)))) (.node (.node (.single ⟨32640,32768,14848,14976⟩) (.single ⟨32640,32704,14976,15040⟩)) (.node (.single ⟨32640,32704,15040,15104⟩) (.node (.single ⟨32704,32768,14976,15040⟩) (.single ⟨32704,32768,15040,15104⟩)))))))
def output60 : Fin 40 → GridBox := outputData60.get
def coverData60 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData60 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover60 (i : Fin 40) : Fin 40 := ⟨coverData60.get i % 40, Nat.mod_lt _ (by decide)⟩
def source60 (i : Fin 40) : Fin 40 := ⟨sourceData60.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree60 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 (.cutX 1024 (.cutY 17408 .empty (.cutX 512 (.cutY 17920 (.cutX 256 (.cutY 17664 .empty (.cutX 128 (.cutY 17792 (.cutX 64 (.cutY 17728 .full .full) (.cutY 17728 .full .full)) .full) (.cutY 17792 (.cutX 192 (.cutY 17728 .full .full) (.cutY 17728 .full .full)) .full))) .empty) .empty) .empty)) .empty) .empty) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 .empty (.cutX 15360 (.cutY 31744 .empty (.cutX 14848 .empty (.cutY 32256 .empty (.cutX 15104 (.cutY 32512 .empty (.cutX 14976 (.cutY 32640 .full .full) (.cutY 32640 (.cutX 15040 (.cutY 32576 .full .full) (.cutY 32576 .full .full)) (.cutX 15040 (.cutY 32704 .full .full) (.cutY 32704 .full .full))))) .empty)))) .empty)))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 (.cutX 17408 .empty (.cutY 1024 (.cutX 17920 (.cutY 512 (.cutX 17664 .empty (.cutY 256 (.cutX 17792 (.cutY 128 (.cutX 17728 (.cutY 64 .full .full) (.cutY 64 .full .full)) (.cutX 17728 (.cutY 192 .full .full) (.cutY 192 .full .full))) (.cutY 128 .full .full)) .empty)) .empty) .empty) .empty)) .empty) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 .empty (.cutX 31744 .empty (.cutY 15360 (.cutX 32256 .empty (.cutY 14848 .empty (.cutX 32512 .empty (.cutY 15104 (.cutX 32640 (.cutY 14976 .full (.cutX 32576 (.cutY 15040 .full .full) (.cutY 15040 .full .full))) (.cutY 14976 .full (.cutX 32704 (.cutY 15040 .full .full) (.cutY 15040 .full .full)))) .empty)))) .empty)))))))) .empty))

theorem metadata60 : 0<114037843 ∧ 0<128 ∧ 69<128 ∧ 0<4 ∧
    69/4160=0 ∧ 69%4160=69 ∧ ∀ i, (leaves60 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData60).mp
    (by decide +kernel)

theorem sourceChecked60_0 : ∀ i : Fin 40,
    (fun i => output60 i = raw60 (source60 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked60 : ∀ i : Fin 40, (fun i => output60 i = raw60 (source60 i)) i :=
  forallFin_of_zero_offset (fun i => output60 i = raw60 (source60 i)) sourceChecked60_0

theorem coverChecked60_0 : ∀ i : Fin 40,
    (fun i => (output60 (cover60 i)).ContainsBox (raw60 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked60 : ∀ i : Fin 40, (fun i => (output60 (cover60 i)).ContainsBox (raw60 i)) i :=
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

noncomputable def phaseMass60 : ℝ := singlePhaseMass (114037843/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw60 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass60_eq : phaseMass60 = (114037843/1638400000000 : ℝ) := by
  unfold phaseMass60
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw60 output60 cover60 source60
    (gridTreeUnionCheck_sound 32768 raw60 output60 cover60 source60 tree60 checked60)
    _ (by norm_num) _, areaUnits60]
  norm_num

-- Frozen phase 5969, atom 4725, type 1, source (4,69).
def leavesData61 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves61 : Fin 10 → DyadicLeaf := leavesData61.get
def raw61 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 4 69 leaves61 i
def outputData61 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨1024,1088,17664,17728⟩) (.single ⟨1024,1088,17728,17792⟩)) (.node (.single ⟨1088,1152,17664,17728⟩) (.node (.single ⟨1088,1152,17728,17792⟩) (.single ⟨1024,1152,17792,17920⟩)))) (.node (.node (.single ⟨1152,1216,17664,17728⟩) (.single ⟨1152,1216,17728,17792⟩)) (.node (.single ⟨1216,1280,17664,17728⟩) (.node (.single ⟨1216,1280,17728,17792⟩) (.single ⟨1152,1280,17792,17920⟩))))) (.node (.node (.node (.single ⟨14848,14976,31488,31616⟩) (.single ⟨14848,14976,31616,31744⟩)) (.node (.single ⟨14976,15040,31488,31552⟩) (.node (.single ⟨14976,15040,31552,31616⟩) (.single ⟨15040,15104,31488,31552⟩)))) (.node (.node (.single ⟨15040,15104,31552,31616⟩) (.single ⟨14976,15040,31616,31680⟩)) (.node (.single ⟨14976,15040,31680,31744⟩) (.node (.single ⟨15040,15104,31616,31680⟩) (.single ⟨15040,15104,31680,31744⟩)))))) (.node (.node (.node (.node (.single ⟨17664,17728,1024,1088⟩) (.single ⟨17664,17728,1088,1152⟩)) (.node (.single ⟨17728,17792,1024,1088⟩) (.node (.single ⟨17728,17792,1088,1152⟩) (.single ⟨17664,17728,1152,1216⟩)))) (.node (.node (.single ⟨17664,17728,1216,1280⟩) (.single ⟨17728,17792,1152,1216⟩)) (.node (.single ⟨17728,17792,1216,1280⟩) (.node (.single ⟨17792,17920,1024,1152⟩) (.single ⟨17792,17920,1152,1280⟩))))) (.node (.node (.node (.single ⟨31488,31616,14848,14976⟩) (.single ⟨31488,31552,14976,15040⟩)) (.node (.single ⟨31488,31552,15040,15104⟩) (.node (.single ⟨31552,31616,14976,15040⟩) (.single ⟨31552,31616,15040,15104⟩)))) (.node (.node (.single ⟨31616,31744,14848,14976⟩) (.single ⟨31616,31680,14976,15040⟩)) (.node (.single ⟨31616,31680,15040,15104⟩) (.node (.single ⟨31680,31744,14976,15040⟩) (.single ⟨31680,31744,15040,15104⟩)))))))
def output61 : Fin 40 → GridBox := outputData61.get
def coverData61 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData61 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover61 (i : Fin 40) : Fin 40 := ⟨coverData61.get i % 40, Nat.mod_lt _ (by decide)⟩
def source61 (i : Fin 40) : Fin 40 := ⟨sourceData61.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree61 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 (.cutX 1024 .empty (.cutY 17408 .empty (.cutX 1536 (.cutY 17920 (.cutX 1280 (.cutY 17664 .empty (.cutX 1152 (.cutY 17792 (.cutX 1088 (.cutY 17728 .full .full) (.cutY 17728 .full .full)) .full) (.cutY 17792 (.cutX 1216 (.cutY 17728 .full .full) (.cutY 17728 .full .full)) .full))) .empty) .empty) .empty))) .empty) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 .empty (.cutX 15360 (.cutY 31744 (.cutX 14848 .empty (.cutY 31232 .empty (.cutX 15104 (.cutY 31488 .empty (.cutX 14976 (.cutY 31616 .full .full) (.cutY 31616 (.cutX 15040 (.cutY 31552 .full .full) (.cutY 31552 .full .full)) (.cutX 15040 (.cutY 31680 .full .full) (.cutY 31680 .full .full))))) .empty))) .empty) .empty)))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 (.cutX 17408 .empty (.cutY 1024 .empty (.cutX 17920 (.cutY 1536 (.cutX 17664 .empty (.cutY 1280 (.cutX 17792 (.cutY 1152 (.cutX 17728 (.cutY 1088 .full .full) (.cutY 1088 .full .full)) (.cutX 17728 (.cutY 1216 .full .full) (.cutY 1216 .full .full))) (.cutY 1152 .full .full)) .empty)) .empty) .empty))) .empty) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 .empty (.cutX 31744 (.cutY 15360 (.cutX 31232 .empty (.cutY 14848 .empty (.cutX 31488 .empty (.cutY 15104 (.cutX 31616 (.cutY 14976 .full (.cutX 31552 (.cutY 15040 .full .full) (.cutY 15040 .full .full))) (.cutY 14976 .full (.cutX 31680 (.cutY 15040 .full .full) (.cutY 15040 .full .full)))) .empty)))) .empty) .empty))))))) .empty))

theorem metadata61 : 0<202148459 ∧ 4<128 ∧ 69<128 ∧ 1<4 ∧
    4725/4160=1 ∧ 4725%4160=565 ∧ ∀ i, (leaves61 i).Valid 8 := by
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

noncomputable def phaseMass61 : ℝ := singlePhaseMass (202148459/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw61 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass61_eq : phaseMass61 = (202148459/1638400000000 : ℝ) := by
  unfold phaseMass61
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw61 output61 cover61 source61
    (gridTreeUnionCheck_sound 32768 raw61 output61 cover61 source61 tree61 checked61)
    _ (by norm_num) _, areaUnits61]
  norm_num

-- Frozen phase 5970, atom 5411, type 1, source (10,71).
def leavesData62 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves62 : Fin 10 → DyadicLeaf := leavesData62.get
def raw62 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 10 71 leaves62 i
def outputData62 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨2560,2624,18176,18240⟩) (.single ⟨2560,2624,18240,18304⟩)) (.node (.single ⟨2624,2688,18176,18240⟩) (.node (.single ⟨2624,2688,18240,18304⟩) (.single ⟨2560,2688,18304,18432⟩)))) (.node (.node (.single ⟨2688,2752,18176,18240⟩) (.single ⟨2688,2752,18240,18304⟩)) (.node (.single ⟨2752,2816,18176,18240⟩) (.node (.single ⟨2752,2816,18240,18304⟩) (.single ⟨2688,2816,18304,18432⟩))))) (.node (.node (.node (.single ⟨14336,14464,29952,30080⟩) (.single ⟨14336,14464,30080,30208⟩)) (.node (.single ⟨14464,14528,29952,30016⟩) (.node (.single ⟨14464,14528,30016,30080⟩) (.single ⟨14528,14592,29952,30016⟩)))) (.node (.node (.single ⟨14528,14592,30016,30080⟩) (.single ⟨14464,14528,30080,30144⟩)) (.node (.single ⟨14464,14528,30144,30208⟩) (.node (.single ⟨14528,14592,30080,30144⟩) (.single ⟨14528,14592,30144,30208⟩)))))) (.node (.node (.node (.node (.single ⟨18176,18240,2560,2624⟩) (.single ⟨18176,18240,2624,2688⟩)) (.node (.single ⟨18240,18304,2560,2624⟩) (.node (.single ⟨18240,18304,2624,2688⟩) (.single ⟨18176,18240,2688,2752⟩)))) (.node (.node (.single ⟨18176,18240,2752,2816⟩) (.single ⟨18240,18304,2688,2752⟩)) (.node (.single ⟨18240,18304,2752,2816⟩) (.node (.single ⟨18304,18432,2560,2688⟩) (.single ⟨18304,18432,2688,2816⟩))))) (.node (.node (.node (.single ⟨29952,30080,14336,14464⟩) (.single ⟨29952,30016,14464,14528⟩)) (.node (.single ⟨29952,30016,14528,14592⟩) (.node (.single ⟨30016,30080,14464,14528⟩) (.single ⟨30016,30080,14528,14592⟩)))) (.node (.node (.single ⟨30080,30208,14336,14464⟩) (.single ⟨30080,30144,14464,14528⟩)) (.node (.single ⟨30080,30144,14528,14592⟩) (.node (.single ⟨30144,30208,14464,14528⟩) (.single ⟨30144,30208,14528,14592⟩)))))))
def output62 : Fin 40 → GridBox := outputData62.get
def coverData62 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData62 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover62 (i : Fin 40) : Fin 40 := ⟨coverData62.get i % 40, Nat.mod_lt _ (by decide)⟩
def source62 (i : Fin 40) : Fin 40 := ⟨sourceData62.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree62 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 (.cutX 3072 (.cutY 17408 .empty (.cutX 2560 .empty (.cutY 17920 .empty (.cutX 2816 (.cutY 18176 .empty (.cutX 2688 (.cutY 18304 (.cutX 2624 (.cutY 18240 .full .full) (.cutY 18240 .full .full)) .full) (.cutY 18304 (.cutX 2752 (.cutY 18240 .full .full) (.cutY 18240 .full .full)) .full))) .empty)))) .empty) .empty)) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 (.cutX 15360 (.cutY 29696 .empty (.cutX 14848 (.cutY 30208 (.cutX 14592 (.cutY 29952 .empty (.cutX 14464 (.cutY 30080 .full .full) (.cutY 30080 (.cutX 14528 (.cutY 30016 .full .full) (.cutY 30016 .full .full)) (.cutX 14528 (.cutY 30144 .full .full) (.cutY 30144 .full .full))))) .empty) .empty) .empty)) .empty) .empty))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 .empty (.cutX 17408 .empty (.cutY 3072 (.cutX 17920 .empty (.cutY 2560 .empty (.cutX 18176 .empty (.cutY 2816 (.cutX 18304 (.cutY 2688 (.cutX 18240 (.cutY 2624 .full .full) (.cutY 2624 .full .full)) (.cutX 18240 (.cutY 2752 .full .full) (.cutY 2752 .full .full))) (.cutY 2688 .full .full)) .empty)))) .empty))) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 .empty (.cutX 29696 .empty (.cutY 15360 (.cutX 30208 (.cutY 14848 (.cutX 29952 .empty (.cutY 14592 (.cutX 30080 (.cutY 14464 .full (.cutX 30016 (.cutY 14528 .full .full) (.cutY 14528 .full .full))) (.cutY 14464 .full (.cutX 30144 (.cutY 14528 .full .full) (.cutY 14528 .full .full)))) .empty)) .empty) .empty) .empty))) .empty))))) .empty))

theorem metadata62 : 0<135229957 ∧ 10<128 ∧ 71<128 ∧ 1<4 ∧
    5411/4160=1 ∧ 5411%4160=1251 ∧ ∀ i, (leaves62 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData62).mp
    (by decide +kernel)

theorem sourceChecked62_0 : ∀ i : Fin 40,
    (fun i => output62 i = raw62 (source62 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked62 : ∀ i : Fin 40, (fun i => output62 i = raw62 (source62 i)) i :=
  forallFin_of_zero_offset (fun i => output62 i = raw62 (source62 i)) sourceChecked62_0

theorem coverChecked62_0 : ∀ i : Fin 40,
    (fun i => (output62 (cover62 i)).ContainsBox (raw62 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked62 : ∀ i : Fin 40, (fun i => (output62 (cover62 i)).ContainsBox (raw62 i)) i :=
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

noncomputable def phaseMass62 : ℝ := singlePhaseMass (135229957/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw62 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass62_eq : phaseMass62 = (135229957/1638400000000 : ℝ) := by
  unfold phaseMass62
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw62 output62 cover62 source62
    (gridTreeUnionCheck_sound 32768 raw62 output62 cover62 source62 tree62 checked62)
    _ (by norm_num) _, areaUnits62]
  norm_num

-- Frozen phase 5971, atom 5190, type 1, source (8,70).
def leavesData63 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩))) (.node (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩)))) (.node (.node (.node (.single ⟨3,4,0⟩) (.single ⟨3,4,1⟩)) (.node (.single ⟨3,5,0⟩) (.single ⟨3,5,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves63 : Fin 16 → DyadicLeaf := leavesData63.get
def raw63 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 8 70 leaves63 i
def outputData63 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨2048,2112,17920,17984⟩) (.single ⟨2048,2112,17984,18048⟩)) (.node (.single ⟨2112,2176,17920,17984⟩) (.single ⟨2112,2176,17984,18048⟩))) (.node (.node (.single ⟨2048,2176,18048,18176⟩) (.single ⟨2176,2208,17920,17952⟩)) (.node (.single ⟨2176,2208,17952,17984⟩) (.single ⟨2208,2240,17920,17952⟩)))) (.node (.node (.node (.single ⟨2208,2240,17952,17984⟩) (.single ⟨2176,2240,17984,18048⟩)) (.node (.single ⟨2240,2272,17920,17952⟩) (.single ⟨2240,2272,17952,17984⟩))) (.node (.node (.single ⟨2272,2304,17920,17952⟩) (.single ⟨2272,2304,17952,17984⟩)) (.node (.single ⟨2240,2304,17984,18048⟩) (.single ⟨2176,2304,18048,18176⟩))))) (.node (.node (.node (.node (.single ⟨14592,14720,30464,30592⟩) (.single ⟨14592,14720,30592,30720⟩)) (.node (.single ⟨14720,14784,30464,30528⟩) (.single ⟨14720,14784,30528,30592⟩))) (.node (.node (.single ⟨14784,14816,30464,30496⟩) (.single ⟨14784,14816,30496,30528⟩)) (.node (.single ⟨14816,14848,30464,30496⟩) (.single ⟨14816,14848,30496,30528⟩)))) (.node (.node (.node (.single ⟨14784,14816,30528,30560⟩) (.single ⟨14784,14816,30560,30592⟩)) (.node (.single ⟨14816,14848,30528,30560⟩) (.single ⟨14816,14848,30560,30592⟩))) (.node (.node (.single ⟨14720,14784,30592,30656⟩) (.single ⟨14720,14784,30656,30720⟩)) (.node (.single ⟨14784,14848,30592,30656⟩) (.single ⟨14784,14848,30656,30720⟩)))))) (.node (.node (.node (.node (.node (.single ⟨17920,17984,2048,2112⟩) (.single ⟨17920,17984,2112,2176⟩)) (.node (.single ⟨17984,18048,2048,2112⟩) (.single ⟨17984,18048,2112,2176⟩))) (.node (.node (.single ⟨17920,17952,2176,2208⟩) (.single ⟨17920,17952,2208,2240⟩)) (.node (.single ⟨17952,17984,2176,2208⟩) (.single ⟨17952,17984,2208,2240⟩)))) (.node (.node (.node (.single ⟨17920,17952,2240,2272⟩) (.single ⟨17920,17952,2272,2304⟩)) (.node (.single ⟨17952,17984,2240,2272⟩) (.single ⟨17952,17984,2272,2304⟩))) (.node (.node (.single ⟨17984,18048,2176,2240⟩) (.single ⟨17984,18048,2240,2304⟩)) (.node (.single ⟨18048,18176,2048,2176⟩) (.single ⟨18048,18176,2176,2304⟩))))) (.node (.node (.node (.node (.single ⟨30464,30592,14592,14720⟩) (.single ⟨30464,30528,14720,14784⟩)) (.node (.single ⟨30464,30496,14784,14816⟩) (.single ⟨30464,30496,14816,14848⟩))) (.node (.node (.single ⟨30496,30528,14784,14816⟩) (.single ⟨30496,30528,14816,14848⟩)) (.node (.single ⟨30528,30592,14720,14784⟩) (.single ⟨30528,30560,14784,14816⟩)))) (.node (.node (.node (.single ⟨30528,30560,14816,14848⟩) (.single ⟨30560,30592,14784,14816⟩)) (.node (.single ⟨30560,30592,14816,14848⟩) (.single ⟨30592,30720,14592,14720⟩))) (.node (.node (.single ⟨30592,30656,14720,14784⟩) (.single ⟨30592,30656,14784,14848⟩)) (.node (.single ⟨30656,30720,14720,14784⟩) (.single ⟨30656,30720,14784,14848⟩)))))))
def output63 : Fin 64 → GridBox := outputData63.get
def coverData63 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 46)) (.node (.single 59) (.single 17))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16)))) (.node (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31))) (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29))))) (.node (.node (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30))) (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28)))) (.node (.node (.node (.single 9) (.single 44)) (.node (.single 54) (.single 19))) (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18)))))) (.node (.node (.node (.node (.node (.single 5) (.single 36)) (.node (.single 58) (.single 27))) (.node (.node (.single 6) (.single 38)) (.node (.single 57) (.single 25)))) (.node (.node (.node (.single 7) (.single 37)) (.node (.single 56) (.single 26))) (.node (.node (.single 8) (.single 39)) (.node (.single 55) (.single 24))))) (.node (.node (.node (.node (.single 10) (.single 40)) (.node (.single 53) (.single 23))) (.node (.node (.single 11) (.single 42)) (.node (.single 52) (.single 21)))) (.node (.node (.node (.single 12) (.single 41)) (.node (.single 51) (.single 22))) (.node (.node (.single 13) (.single 43)) (.node (.single 50) (.single 20)))))))
def sourceData63 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.single 20))) (.node (.node (.single 0) (.single 32)) (.node (.single 36) (.single 40)))) (.node (.node (.node (.single 44) (.single 24)) (.node (.single 48) (.single 52))) (.node (.node (.single 56) (.single 60)) (.node (.single 28) (.single 4))))) (.node (.node (.node (.node (.single 7) (.single 3)) (.node (.single 31) (.single 27))) (.node (.node (.single 63) (.single 55)) (.node (.single 59) (.single 51)))) (.node (.node (.node (.single 47) (.single 39)) (.node (.single 43) (.single 35))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.single 21))) (.node (.node (.single 33) (.single 41)) (.node (.single 37) (.single 45)))) (.node (.node (.node (.single 49) (.single 57)) (.node (.single 53) (.single 61))) (.node (.node (.single 25) (.single 29)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.node (.single 6) (.single 30)) (.node (.single 62) (.single 58))) (.node (.node (.single 54) (.single 50)) (.node (.single 26) (.single 46)))) (.node (.node (.node (.single 42) (.single 38)) (.node (.single 34) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover63 (i : Fin 64) : Fin 64 := ⟨coverData63.get i % 64, Nat.mod_lt _ (by decide)⟩
def source63 (i : Fin 64) : Fin 64 := ⟨sourceData63.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree63 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 (.cutX 3072 (.cutY 17408 .empty (.cutX 2560 (.cutY 17920 .empty (.cutX 2304 (.cutY 18176 (.cutX 2176 (.cutY 18048 (.cutX 2112 (.cutY 17984 .full .full) (.cutY 17984 .full .full)) .full) (.cutY 18048 (.cutX 2240 (.cutY 17984 (.cutX 2208 (.cutY 17952 .full .full) (.cutY 17952 .full .full)) .full) (.cutY 17984 (.cutX 2272 (.cutY 17952 .full .full) (.cutY 17952 .full .full)) .full)) .full)) .empty) .empty)) .empty)) .empty) .empty)) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 (.cutX 15360 (.cutY 29696 .empty (.cutX 14848 (.cutY 30208 .empty (.cutX 14592 .empty (.cutY 30464 .empty (.cutX 14720 (.cutY 30592 .full .full) (.cutY 30592 (.cutX 14784 (.cutY 30528 .full .full) (.cutY 30528 (.cutX 14816 (.cutY 30496 .full .full) (.cutY 30496 .full .full)) (.cutX 14816 (.cutY 30560 .full .full) (.cutY 30560 .full .full)))) (.cutX 14784 (.cutY 30656 .full .full) (.cutY 30656 .full .full))))))) .empty)) .empty) .empty))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 .empty (.cutX 17408 .empty (.cutY 3072 (.cutX 17920 .empty (.cutY 2560 (.cutX 18176 (.cutY 2304 (.cutX 18048 (.cutY 2176 (.cutX 17984 (.cutY 2112 .full .full) (.cutY 2112 .full .full)) (.cutX 17984 (.cutY 2240 (.cutX 17952 (.cutY 2208 .full .full) (.cutY 2208 .full .full)) (.cutX 17952 (.cutY 2272 .full .full) (.cutY 2272 .full .full))) (.cutY 2240 .full .full))) (.cutY 2176 .full .full)) .empty) .empty) .empty)) .empty))) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 .empty (.cutX 29696 .empty (.cutY 15360 (.cutX 30208 .empty (.cutY 14848 (.cutX 30464 .empty (.cutY 14592 .empty (.cutX 30592 (.cutY 14720 .full (.cutX 30528 (.cutY 14784 .full (.cutX 30496 (.cutY 14816 .full .full) (.cutY 14816 .full .full))) (.cutY 14784 .full (.cutX 30560 (.cutY 14816 .full .full) (.cutY 14816 .full .full))))) (.cutY 14720 .full (.cutX 30656 (.cutY 14784 .full .full) (.cutY 14784 .full .full)))))) .empty)) .empty))) .empty))))) .empty))

theorem metadata63 : 0<135229957 ∧ 8<128 ∧ 70<128 ∧ 1<4 ∧
    5190/4160=1 ∧ 5190%4160=1030 ∧ ∀ i, (leaves63 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData63).mp
    (by decide +kernel)

theorem sourceChecked63_0 : ∀ i : Fin 64,
    (fun i => output63 i = raw63 (source63 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked63 : ∀ i : Fin 64, (fun i => output63 i = raw63 (source63 i)) i :=
  forallFin_of_zero_offset (fun i => output63 i = raw63 (source63 i)) sourceChecked63_0

theorem coverChecked63_0 : ∀ i : Fin 64,
    (fun i => (output63 (cover63 i)).ContainsBox (raw63 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked63 : ∀ i : Fin 64, (fun i => (output63 (cover63 i)).ContainsBox (raw63 i)) i :=
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

noncomputable def phaseMass63 : ℝ := singlePhaseMass (135229957/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw63 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass63_eq : phaseMass63 = (135229957/1638400000000 : ℝ) := by
  unfold phaseMass63
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw63 output63 cover63 source63
    (gridTreeUnionCheck_sound 32768 raw63 output63 cover63 source63 tree63 checked63)
    _ (by norm_num) _, areaUnits63]
  norm_num

-- Frozen phase 5972, atom 1032, type 0, source (8,72).
def leavesData64 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves64 : Fin 10 → DyadicLeaf := leavesData64.get
def raw64 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 8 72 leaves64 i
def outputData64 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨2048,2112,18432,18496⟩) (.single ⟨2048,2112,18496,18560⟩)) (.node (.single ⟨2112,2176,18432,18496⟩) (.node (.single ⟨2112,2176,18496,18560⟩) (.single ⟨2048,2176,18560,18688⟩)))) (.node (.node (.single ⟨2176,2240,18432,18496⟩) (.single ⟨2176,2240,18496,18560⟩)) (.node (.single ⟨2240,2304,18432,18496⟩) (.node (.single ⟨2240,2304,18496,18560⟩) (.single ⟨2176,2304,18560,18688⟩))))) (.node (.node (.node (.single ⟨14080,14208,30464,30592⟩) (.single ⟨14080,14208,30592,30720⟩)) (.node (.single ⟨14208,14272,30464,30528⟩) (.node (.single ⟨14208,14272,30528,30592⟩) (.single ⟨14272,14336,30464,30528⟩)))) (.node (.node (.single ⟨14272,14336,30528,30592⟩) (.single ⟨14208,14272,30592,30656⟩)) (.node (.single ⟨14208,14272,30656,30720⟩) (.node (.single ⟨14272,14336,30592,30656⟩) (.single ⟨14272,14336,30656,30720⟩)))))) (.node (.node (.node (.node (.single ⟨18432,18496,2048,2112⟩) (.single ⟨18432,18496,2112,2176⟩)) (.node (.single ⟨18496,18560,2048,2112⟩) (.node (.single ⟨18496,18560,2112,2176⟩) (.single ⟨18432,18496,2176,2240⟩)))) (.node (.node (.single ⟨18432,18496,2240,2304⟩) (.single ⟨18496,18560,2176,2240⟩)) (.node (.single ⟨18496,18560,2240,2304⟩) (.node (.single ⟨18560,18688,2048,2176⟩) (.single ⟨18560,18688,2176,2304⟩))))) (.node (.node (.node (.single ⟨30464,30592,14080,14208⟩) (.single ⟨30464,30528,14208,14272⟩)) (.node (.single ⟨30464,30528,14272,14336⟩) (.node (.single ⟨30528,30592,14208,14272⟩) (.single ⟨30528,30592,14272,14336⟩)))) (.node (.node (.single ⟨30592,30720,14080,14208⟩) (.single ⟨30592,30656,14208,14272⟩)) (.node (.single ⟨30592,30656,14272,14336⟩) (.node (.single ⟨30656,30720,14208,14272⟩) (.single ⟨30656,30720,14272,14336⟩)))))))
def output64 : Fin 40 → GridBox := outputData64.get
def coverData64 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData64 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover64 (i : Fin 40) : Fin 40 := ⟨coverData64.get i % 40, Nat.mod_lt _ (by decide)⟩
def source64 (i : Fin 40) : Fin 40 := ⟨sourceData64.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree64 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 (.cutY 19456 (.cutX 2560 (.cutY 18944 (.cutX 2304 (.cutY 18688 (.cutX 2176 (.cutY 18560 (.cutX 2112 (.cutY 18496 .full .full) (.cutY 18496 .full .full)) .full) (.cutY 18560 (.cutX 2240 (.cutY 18496 .full .full) (.cutY 18496 .full .full)) .full)) .empty) .empty) .empty) .empty) .empty) .empty))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 .empty (.cutY 29696 .empty (.cutX 13824 .empty (.cutY 30208 .empty (.cutX 14080 .empty (.cutY 30464 .empty (.cutX 14208 (.cutY 30592 .full .full) (.cutY 30592 (.cutX 14272 (.cutY 30528 .full .full) (.cutY 30528 .full .full)) (.cutX 14272 (.cutY 30656 .full .full) (.cutY 30656 .full .full)))))))))) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 (.cutY 3072 (.cutX 18944 (.cutY 2560 (.cutX 18688 (.cutY 2304 (.cutX 18560 (.cutY 2176 (.cutX 18496 (.cutY 2112 .full .full) (.cutY 2112 .full .full)) (.cutX 18496 (.cutY 2240 .full .full) (.cutY 2240 .full .full))) (.cutY 2176 .full .full)) .empty) .empty) .empty) .empty) .empty) .empty))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 .empty (.cutY 13312 .empty (.cutX 30208 .empty (.cutY 13824 .empty (.cutX 30464 .empty (.cutY 14080 .empty (.cutX 30592 (.cutY 14208 .full (.cutX 30528 (.cutY 14272 .full .full) (.cutY 14272 .full .full))) (.cutY 14208 .full (.cutX 30656 (.cutY 14272 .full .full) (.cutY 14272 .full .full)))))))))) .empty) .empty))))) .empty))

theorem metadata64 : 0<48363413 ∧ 8<128 ∧ 72<128 ∧ 0<4 ∧
    1032/4160=0 ∧ 1032%4160=1032 ∧ ∀ i, (leaves64 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData64).mp
    (by decide +kernel)

theorem sourceChecked64_0 : ∀ i : Fin 40,
    (fun i => output64 i = raw64 (source64 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked64 : ∀ i : Fin 40, (fun i => output64 i = raw64 (source64 i)) i :=
  forallFin_of_zero_offset (fun i => output64 i = raw64 (source64 i)) sourceChecked64_0

theorem coverChecked64_0 : ∀ i : Fin 40,
    (fun i => (output64 (cover64 i)).ContainsBox (raw64 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked64 : ∀ i : Fin 40, (fun i => (output64 (cover64 i)).ContainsBox (raw64 i)) i :=
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

noncomputable def phaseMass64 : ℝ := singlePhaseMass (48363413/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw64 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass64_eq : phaseMass64 = (48363413/1638400000000 : ℝ) := by
  unfold phaseMass64
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw64 output64 cover64 source64
    (gridTreeUnionCheck_sound 32768 raw64 output64 cover64 source64 tree64 checked64)
    _ (by norm_num) _, areaUnits64]
  norm_num

-- Frozen phase 5973, atom 445, type 0, source (3,70).
def leavesData65 : FiniteInputTree DyadicLeaf 27 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩))) (.node (.single ⟨2,1,0⟩) (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩))) (.node (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)) (.node (.single ⟨3,6,1⟩) (.single ⟨3,7,1⟩))))) (.node (.node (.node (.single ⟨3,4,0⟩) (.node (.single ⟨3,4,1⟩) (.single ⟨3,5,0⟩))) (.node (.node (.single ⟨3,5,1⟩) (.single ⟨4,12,0⟩)) (.node (.single ⟨4,12,1⟩) (.single ⟨4,13,0⟩)))) (.node (.node (.single ⟨4,13,1⟩) (.node (.single ⟨4,14,0⟩) (.single ⟨4,14,1⟩))) (.node (.node (.single ⟨4,15,1⟩) (.single ⟨5,30,0⟩)) (.node (.single ⟨5,30,1⟩) (.single ⟨5,31,1⟩))))))
def leaves65 : Fin 27 → DyadicLeaf := leavesData65.get
def raw65 (i : Fin 108) : GridBox := phaseImageBoxes 32768 8 3 70 leaves65 i
def outputData65 : FiniteInputTree GridBox 108 := (.node (.node (.node (.node (.node (.node (.single ⟨768,832,17920,17984⟩) (.node (.single ⟨768,832,17984,18048⟩) (.single ⟨832,896,17920,17984⟩))) (.node (.single ⟨832,896,17984,18048⟩) (.node (.single ⟨768,896,18048,18176⟩) (.single ⟨896,928,17920,17952⟩)))) (.node (.node (.single ⟨896,928,17952,17984⟩) (.node (.single ⟨928,960,17920,17952⟩) (.single ⟨928,960,17952,17984⟩))) (.node (.node (.single ⟨896,960,17984,18048⟩) (.single ⟨960,976,17920,17936⟩)) (.node (.single ⟨960,976,17936,17952⟩) (.single ⟨976,992,17920,17936⟩))))) (.node (.node (.node (.single ⟨976,992,17936,17952⟩) (.node (.single ⟨960,992,17952,17984⟩) (.single ⟨992,1008,17920,17936⟩))) (.node (.node (.single ⟨992,1008,17936,17952⟩) (.single ⟨1008,1016,17920,17928⟩)) (.node (.single ⟨1008,1016,17928,17936⟩) (.single ⟨1016,1024,17928,17936⟩)))) (.node (.node (.single ⟨1008,1024,17936,17952⟩) (.node (.single ⟨992,1024,17952,17984⟩) (.single ⟨960,1024,17984,18048⟩))) (.node (.node (.single ⟨896,960,18048,18112⟩) (.single ⟨896,960,18112,18176⟩)) (.node (.single ⟨960,1024,18048,18112⟩) (.single ⟨960,1024,18112,18176⟩)))))) (.node (.node (.node (.node (.single ⟨14592,14656,31744,31808⟩) (.node (.single ⟨14592,14656,31808,31872⟩) (.single ⟨14656,14720,31744,31808⟩))) (.node (.single ⟨14656,14720,31808,31872⟩) (.node (.single ⟨14592,14720,31872,32000⟩) (.single ⟨14720,14784,31744,31808⟩)))) (.node (.node (.single ⟨14720,14784,31808,31872⟩) (.node (.single ⟨14784,14816,31744,31776⟩) (.single ⟨14784,14816,31776,31808⟩))) (.node (.node (.single ⟨14816,14832,31744,31760⟩) (.single ⟨14816,14832,31760,31776⟩)) (.node (.single ⟨14832,14840,31744,31752⟩) (.single ⟨14832,14840,31752,31760⟩))))) (.node (.node (.node (.single ⟨14840,14848,31752,31760⟩) (.node (.single ⟨14832,14848,31760,31776⟩) (.single ⟨14816,14832,31776,31792⟩))) (.node (.node (.single ⟨14816,14832,31792,31808⟩) (.single ⟨14832,14848,31776,31792⟩)) (.node (.single ⟨14832,14848,31792,31808⟩) (.single ⟨14784,14816,31808,31840⟩)))) (.node (.node (.single ⟨14784,14816,31840,31872⟩) (.node (.single ⟨14816,14848,31808,31840⟩) (.single ⟨14816,14848,31840,31872⟩))) (.node (.node (.single ⟨14720,14784,31872,31936⟩) (.single ⟨14720,14784,31936,32000⟩)) (.node (.single ⟨14784,14848,31872,31936⟩) (.single ⟨14784,14848,31936,32000⟩))))))) (.node (.node (.node (.node (.node (.single ⟨17920,17984,768,832⟩) (.node (.single ⟨17920,17984,832,896⟩) (.single ⟨17984,18048,768,832⟩))) (.node (.single ⟨17984,18048,832,896⟩) (.node (.single ⟨17920,17952,896,928⟩) (.single ⟨17920,17952,928,960⟩)))) (.node (.node (.single ⟨17952,17984,896,928⟩) (.node (.single ⟨17952,17984,928,960⟩) (.single ⟨17920,17936,960,976⟩))) (.node (.node (.single ⟨17920,17936,976,992⟩) (.single ⟨17936,17952,960,976⟩)) (.node (.single ⟨17936,17952,976,992⟩) (.single ⟨17920,17936,992,1008⟩))))) (.node (.node (.node (.single ⟨17920,17928,1008,1016⟩) (.node (.single ⟨17928,17936,1008,1016⟩) (.single ⟨17928,17936,1016,1024⟩))) (.node (.node (.single ⟨17936,17952,992,1008⟩) (.single ⟨17936,17952,1008,1024⟩)) (.node (.single ⟨17952,17984,960,992⟩) (.single ⟨17952,17984,992,1024⟩)))) (.node (.node (.single ⟨17984,18048,896,960⟩) (.node (.single ⟨17984,18048,960,1024⟩) (.single ⟨18048,18176,768,896⟩))) (.node (.node (.single ⟨18048,18112,896,960⟩) (.single ⟨18048,18112,960,1024⟩)) (.node (.single ⟨18112,18176,896,960⟩) (.single ⟨18112,18176,960,1024⟩)))))) (.node (.node (.node (.node (.single ⟨31744,31808,14592,14656⟩) (.node (.single ⟨31744,31808,14656,14720⟩) (.single ⟨31808,31872,14592,14656⟩))) (.node (.single ⟨31808,31872,14656,14720⟩) (.node (.single ⟨31744,31808,14720,14784⟩) (.single ⟨31744,31776,14784,14816⟩)))) (.node (.node (.single ⟨31744,31760,14816,14832⟩) (.node (.single ⟨31744,31752,14832,14840⟩) (.single ⟨31752,31760,14832,14840⟩))) (.node (.node (.single ⟨31752,31760,14840,14848⟩) (.single ⟨31760,31776,14816,14832⟩)) (.node (.single ⟨31760,31776,14832,14848⟩) (.single ⟨31776,31808,14784,14816⟩))))) (.node (.node (.node (.single ⟨31776,31792,14816,14832⟩) (.node (.single ⟨31776,31792,14832,14848⟩) (.single ⟨31792,31808,14816,14832⟩))) (.node (.node (.single ⟨31792,31808,14832,14848⟩) (.single ⟨31808,31872,14720,14784⟩)) (.node (.single ⟨31808,31840,14784,14816⟩) (.single ⟨31808,31840,14816,14848⟩)))) (.node (.node (.single ⟨31840,31872,14784,14816⟩) (.node (.single ⟨31840,31872,14816,14848⟩) (.single ⟨31872,32000,14592,14720⟩))) (.node (.node (.single ⟨31872,31936,14720,14784⟩) (.single ⟨31872,31936,14784,14848⟩)) (.node (.single ⟨31936,32000,14720,14784⟩) (.single ⟨31936,32000,14784,14848⟩))))))))
def output65 : Fin 108 → GridBox := outputData65.get
def coverData65 : FiniteInputTree ℕ 108 := (.node (.node (.node (.node (.node (.node (.single 4) (.node (.single 76) (.single 103))) (.node (.single 31) (.node (.single 0) (.single 54)))) (.node (.node (.single 107) (.node (.single 53) (.single 1))) (.node (.node (.single 56) (.single 106)) (.node (.single 51) (.single 2))))) (.node (.node (.node (.single 55) (.node (.single 105) (.single 52))) (.node (.node (.single 3) (.single 57)) (.node (.single 104) (.single 50)))) (.node (.node (.single 9) (.node (.single 74) (.single 98))) (.node (.node (.single 33) (.single 22)) (.node (.single 75) (.single 85)))))) (.node (.node (.node (.node (.single 32) (.node (.single 23) (.single 77))) (.node (.single 84) (.node (.single 30) (.single 24)))) (.node (.node (.single 79) (.node (.single 83) (.single 28))) (.node (.node (.single 25) (.single 78)) (.node (.single 82) (.single 29))))) (.node (.node (.node (.single 26) (.node (.single 80) (.single 81))) (.node (.node (.single 27) (.single 14)) (.node (.single 72) (.single 93)))) (.node (.node (.single 35) (.node (.single 21) (.single 73))) (.node (.node (.single 86) (.single 34)) (.node (.single 5) (.single 58))))))) (.node (.node (.node (.node (.node (.single 102) (.node (.single 49) (.single 6))) (.node (.single 60) (.node (.single 101) (.single 47)))) (.node (.node (.single 7) (.node (.single 59) (.single 100))) (.node (.node (.single 48) (.single 8)) (.node (.single 61) (.single 99))))) (.node (.node (.node (.single 46) (.node (.single 10) (.single 62))) (.node (.node (.single 97) (.single 45)) (.node (.single 11) (.single 64)))) (.node (.node (.single 96) (.node (.single 43) (.single 12))) (.node (.node (.single 63) (.single 95)) (.node (.single 44) (.single 13)))))) (.node (.node (.node (.node (.single 65) (.node (.single 94) (.single 42))) (.node (.single 15) (.node (.single 66) (.single 92)))) (.node (.node (.single 41) (.node (.single 16) (.single 70))) (.node (.node (.single 91) (.single 37)) (.node (.single 20) (.single 71))))) (.node (.node (.node (.single 87) (.node (.single 36) (.single 17))) (.node (.node (.single 67) (.single 90)) (.node (.single 40) (.single 18)))) (.node (.node (.single 68) (.node (.single 89) (.single 39))) (.node (.node (.single 19) (.single 69)) (.node (.single 88) (.single 38))))))))
def sourceData65 : FiniteInputTree ℕ 108 := (.node (.node (.node (.node (.node (.node (.single 4) (.node (.single 8) (.single 12))) (.node (.single 16) (.node (.single 0) (.single 52)))) (.node (.node (.single 56) (.node (.single 60) (.single 64))) (.node (.node (.single 20) (.single 68)) (.node (.single 72) (.single 76))))) (.node (.node (.node (.single 80) (.node (.single 44) (.single 84))) (.node (.node (.single 88) (.single 96)) (.node (.single 100) (.single 104)))) (.node (.node (.single 92) (.node (.single 48) (.single 24))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.single 40)))))) (.node (.node (.node (.node (.single 43) (.node (.single 35) (.single 39))) (.node (.single 31) (.node (.single 3) (.single 27)))) (.node (.node (.single 23) (.node (.single 51) (.single 47))) (.node (.node (.single 95) (.single 91)) (.node (.single 107) (.single 103))))) (.node (.node (.node (.single 99) (.node (.single 87) (.single 83))) (.node (.node (.single 75) (.single 79)) (.node (.single 71) (.single 67)))) (.node (.node (.single 59) (.node (.single 63) (.single 55))) (.node (.node (.single 19) (.single 11)) (.node (.single 15) (.single 7))))))) (.node (.node (.node (.node (.node (.single 5) (.node (.single 13) (.single 9))) (.node (.single 17) (.node (.single 53) (.single 61)))) (.node (.node (.single 57) (.node (.single 65) (.single 69))) (.node (.node (.single 77) (.single 73)) (.node (.single 81) (.single 85))))) (.node (.node (.node (.single 97) (.node (.single 101) (.single 105))) (.node (.node (.single 89) (.single 93)) (.node (.single 45) (.single 49)))) (.node (.node (.single 21) (.node (.single 25) (.single 1))) (.node (.node (.single 29) (.single 37)) (.node (.single 33) (.single 41)))))) (.node (.node (.node (.node (.single 42) (.node (.single 38) (.single 34))) (.node (.single 30) (.node (.single 26) (.single 50)))) (.node (.node (.single 94) (.node (.single 106) (.single 102))) (.node (.node (.single 98) (.single 90)) (.node (.single 86) (.single 46))))) (.node (.node (.node (.single 82) (.node (.single 78) (.single 74))) (.node (.node (.single 70) (.single 22)) (.node (.single 66) (.single 62)))) (.node (.node (.single 58) (.node (.single 54) (.single 2))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.single 6))))))))
def cover65 (i : Fin 108) : Fin 108 := ⟨coverData65.get i % 108, Nat.mod_lt _ (by decide)⟩
def source65 (i : Fin 108) : Fin 108 := ⟨sourceData65.get i % 108, Nat.mod_lt _ (by decide)⟩
def tree65 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 (.cutX 1024 (.cutY 17408 .empty (.cutX 512 .empty (.cutY 17920 .empty (.cutX 768 .empty (.cutY 18176 (.cutX 896 (.cutY 18048 (.cutX 832 (.cutY 17984 .full .full) (.cutY 17984 .full .full)) .full) (.cutY 18048 (.cutX 960 (.cutY 17984 (.cutX 928 (.cutY 17952 .full .full) (.cutY 17952 .full .full)) .full) (.cutY 17984 (.cutX 992 (.cutY 17952 (.cutX 976 (.cutY 17936 .full .full) (.cutY 17936 .full .full)) .full) (.cutY 17952 (.cutX 1008 (.cutY 17936 .full .full) (.cutY 17936 (.cutX 1016 (.cutY 17928 .full .full) (.cutY 17928 .empty .full)) .full)) .full)) .full)) (.cutX 960 (.cutY 18112 .full .full) (.cutY 18112 .full .full)))) .empty))))) .empty) .empty) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 .empty (.cutX 15360 (.cutY 31744 .empty (.cutX 14848 (.cutY 32256 (.cutX 14592 .empty (.cutY 32000 (.cutX 14720 (.cutY 31872 (.cutX 14656 (.cutY 31808 .full .full) (.cutY 31808 .full .full)) .full) (.cutY 31872 (.cutX 14784 (.cutY 31808 .full .full) (.cutY 31808 (.cutX 14816 (.cutY 31776 .full .full) (.cutY 31776 (.cutX 14832 (.cutY 31760 .full .full) (.cutY 31760 (.cutX 14840 (.cutY 31752 .full .full) (.cutY 31752 .empty .full)) .full)) (.cutX 14832 (.cutY 31792 .full .full) (.cutY 31792 .full .full)))) (.cutX 14816 (.cutY 31840 .full .full) (.cutY 31840 .full .full)))) (.cutX 14784 (.cutY 31936 .full .full) (.cutY 31936 .full .full)))) .empty)) .empty) .empty)) .empty)))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 (.cutX 17408 .empty (.cutY 1024 (.cutX 17920 .empty (.cutY 512 .empty (.cutX 18176 (.cutY 768 .empty (.cutX 18048 (.cutY 896 (.cutX 17984 (.cutY 832 .full .full) (.cutY 832 .full .full)) (.cutX 17984 (.cutY 960 (.cutX 17952 (.cutY 928 .full .full) (.cutY 928 .full .full)) (.cutX 17952 (.cutY 992 (.cutX 17936 (.cutY 976 .full .full) (.cutY 976 .full .full)) (.cutX 17936 (.cutY 1008 .full (.cutX 17928 (.cutY 1016 .full .empty) (.cutY 1016 .full .full))) (.cutY 1008 .full .full))) (.cutY 992 .full .full))) (.cutY 960 .full .full))) (.cutY 896 .full (.cutX 18112 (.cutY 960 .full .full) (.cutY 960 .full .full))))) .empty))) .empty)) .empty) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 .empty (.cutX 31744 .empty (.cutY 15360 (.cutX 32256 (.cutY 14848 (.cutX 32000 (.cutY 14592 .empty (.cutX 31872 (.cutY 14720 (.cutX 31808 (.cutY 14656 .full .full) (.cutY 14656 .full .full)) (.cutX 31808 (.cutY 14784 .full (.cutX 31776 (.cutY 14816 .full (.cutX 31760 (.cutY 14832 .full (.cutX 31752 (.cutY 14840 .full .empty) (.cutY 14840 .full .full))) (.cutY 14832 .full .full))) (.cutY 14816 .full (.cutX 31792 (.cutY 14832 .full .full) (.cutY 14832 .full .full))))) (.cutY 14784 .full (.cutX 31840 (.cutY 14816 .full .full) (.cutY 14816 .full .full))))) (.cutY 14720 .full (.cutX 31936 (.cutY 14784 .full .full) (.cutY 14784 .full .full))))) .empty) .empty) .empty) .empty)))))))) .empty))

theorem metadata65 : 0<114037843 ∧ 3<128 ∧ 70<128 ∧ 0<4 ∧
    445/4160=0 ∧ 445%4160=445 ∧ ∀ i, (leaves65 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData65).mp
    (by decide +kernel)

theorem sourceChecked65_0 : ∀ i : Fin 64,
    (fun i => output65 i = raw65 (source65 i)) (finOffset 108 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked65_64 : ∀ i : Fin 44,
    (fun i => output65 i = raw65 (source65 i)) (finOffset 108 64 44 (by decide) i) := by decide +kernel

theorem sourceChecked65 : ∀ i : Fin 108, (fun i => output65 i = raw65 (source65 i)) i :=
  forallFin_of_zero_offset (fun i => output65 i = raw65 (source65 i)) (forallFinOffset_add (fun i => output65 i = raw65 (source65 i)) 0 64 44 (by decide) sourceChecked65_0
    sourceChecked65_64)

theorem coverChecked65_0 : ∀ i : Fin 64,
    (fun i => (output65 (cover65 i)).ContainsBox (raw65 i)) (finOffset 108 0 64 (by decide) i) := by decide +kernel

theorem coverChecked65_64 : ∀ i : Fin 44,
    (fun i => (output65 (cover65 i)).ContainsBox (raw65 i)) (finOffset 108 64 44 (by decide) i) := by decide +kernel

theorem coverChecked65 : ∀ i : Fin 108, (fun i => (output65 (cover65 i)).ContainsBox (raw65 i)) i :=
  forallFin_of_zero_offset (fun i => (output65 (cover65 i)).ContainsBox (raw65 i)) (forallFinOffset_add (fun i => (output65 (cover65 i)).ContainsBox (raw65 i)) 0 64 44 (by decide) coverChecked65_0
    coverChecked65_64)

theorem treeChecked65 : tree65.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves65 : List.ofFn output65 = tree65.leaves ⟨0,32768,0,32768⟩ := by
  unfold output65
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked65 : gridTreeUnionCheck 32768 raw65 output65 cover65 source65 tree65 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked65, coverChecked65, treeChecked65, treeLeaves65⟩

theorem areaUnits65 : gridUnionAreaUnits output65 = 261888 := by decide +kernel

noncomputable def phaseMass65 : ℝ := singlePhaseMass (114037843/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw65 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass65_eq : phaseMass65 = (116660713389/1677721600000000 : ℝ) := by
  unfold phaseMass65
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw65 output65 cover65 source65
    (gridTreeUnionCheck_sound 32768 raw65 output65 cover65 source65 tree65 checked65)
    _ (by norm_num) _, areaUnits65]
  norm_num

-- Frozen phase 5974, atom 686, type 0, source (5,71).
def leavesData66 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩)))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩)))))
def leaves66 : Fin 10 → DyadicLeaf := leavesData66.get
def raw66 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 5 71 leaves66 i
def outputData66 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨1280,1344,18176,18240⟩) (.single ⟨1280,1344,18240,18304⟩)) (.node (.single ⟨1344,1408,18176,18240⟩) (.node (.single ⟨1344,1408,18240,18304⟩) (.single ⟨1280,1408,18304,18432⟩)))) (.node (.node (.single ⟨1408,1472,18176,18240⟩) (.single ⟨1408,1472,18240,18304⟩)) (.node (.single ⟨1472,1536,18176,18240⟩) (.node (.single ⟨1472,1536,18240,18304⟩) (.single ⟨1408,1536,18304,18432⟩))))) (.node (.node (.node (.single ⟨14336,14464,31232,31360⟩) (.single ⟨14336,14464,31360,31488⟩)) (.node (.single ⟨14464,14528,31232,31296⟩) (.node (.single ⟨14464,14528,31296,31360⟩) (.single ⟨14528,14592,31232,31296⟩)))) (.node (.node (.single ⟨14528,14592,31296,31360⟩) (.single ⟨14464,14528,31360,31424⟩)) (.node (.single ⟨14464,14528,31424,31488⟩) (.node (.single ⟨14528,14592,31360,31424⟩) (.single ⟨14528,14592,31424,31488⟩)))))) (.node (.node (.node (.node (.single ⟨18176,18240,1280,1344⟩) (.single ⟨18176,18240,1344,1408⟩)) (.node (.single ⟨18240,18304,1280,1344⟩) (.node (.single ⟨18240,18304,1344,1408⟩) (.single ⟨18176,18240,1408,1472⟩)))) (.node (.node (.single ⟨18176,18240,1472,1536⟩) (.single ⟨18240,18304,1408,1472⟩)) (.node (.single ⟨18240,18304,1472,1536⟩) (.node (.single ⟨18304,18432,1280,1408⟩) (.single ⟨18304,18432,1408,1536⟩))))) (.node (.node (.node (.single ⟨31232,31360,14336,14464⟩) (.single ⟨31232,31296,14464,14528⟩)) (.node (.single ⟨31232,31296,14528,14592⟩) (.node (.single ⟨31296,31360,14464,14528⟩) (.single ⟨31296,31360,14528,14592⟩)))) (.node (.node (.single ⟨31360,31488,14336,14464⟩) (.single ⟨31360,31424,14464,14528⟩)) (.node (.single ⟨31360,31424,14528,14592⟩) (.node (.single ⟨31424,31488,14464,14528⟩) (.single ⟨31424,31488,14528,14592⟩)))))))
def output66 : Fin 40 → GridBox := outputData66.get
def coverData66 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 0) (.single 20))))) (.node (.node (.node (.single 39) (.single 19)) (.node (.single 1) (.node (.single 22) (.single 38)))) (.node (.node (.single 17) (.single 2)) (.node (.single 21) (.node (.single 37) (.single 18)))))) (.node (.node (.node (.node (.single 3) (.single 23)) (.node (.single 36) (.node (.single 16) (.single 5)))) (.node (.node (.single 24) (.single 34)) (.node (.single 15) (.node (.single 6) (.single 26))))) (.node (.node (.node (.single 33) (.single 13)) (.node (.single 7) (.node (.single 25) (.single 32)))) (.node (.node (.single 14) (.single 8)) (.node (.single 27) (.node (.single 31) (.single 12)))))))
def sourceData66 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 0)))) (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 39) (.node (.single 31) (.single 35)))) (.node (.node (.single 27) (.single 23)) (.node (.single 15) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.node (.single 21) (.single 25)))) (.node (.node (.single 33) (.single 29)) (.node (.single 37) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))) (.node (.node (.single 2) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))))))
def cover66 (i : Fin 40) : Fin 40 := ⟨coverData66.get i % 40, Nat.mod_lt _ (by decide)⟩
def source66 (i : Fin 40) : Fin 40 := ⟨sourceData66.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree66 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 (.cutX 1024 .empty (.cutY 17408 .empty (.cutX 1536 (.cutY 17920 .empty (.cutX 1280 .empty (.cutY 18176 .empty (.cutX 1408 (.cutY 18304 (.cutX 1344 (.cutY 18240 .full .full) (.cutY 18240 .full .full)) .full) (.cutY 18304 (.cutX 1472 (.cutY 18240 .full .full) (.cutY 18240 .full .full)) .full))))) .empty))) .empty) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 .empty (.cutX 15360 (.cutY 31744 (.cutX 14848 (.cutY 31232 .empty (.cutX 14592 (.cutY 31488 (.cutX 14464 (.cutY 31360 .full .full) (.cutY 31360 (.cutX 14528 (.cutY 31296 .full .full) (.cutY 31296 .full .full)) (.cutX 14528 (.cutY 31424 .full .full) (.cutY 31424 .full .full)))) .empty) .empty)) .empty) .empty) .empty)))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 (.cutX 17408 .empty (.cutY 1024 .empty (.cutX 17920 .empty (.cutY 1536 (.cutX 18176 .empty (.cutY 1280 .empty (.cutX 18304 (.cutY 1408 (.cutX 18240 (.cutY 1344 .full .full) (.cutY 1344 .full .full)) (.cutX 18240 (.cutY 1472 .full .full) (.cutY 1472 .full .full))) (.cutY 1408 .full .full)))) .empty)))) .empty) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 .empty (.cutX 31744 (.cutY 15360 (.cutX 31232 .empty (.cutY 14848 (.cutX 31488 (.cutY 14592 (.cutX 31360 (.cutY 14464 .full (.cutX 31296 (.cutY 14528 .full .full) (.cutY 14528 .full .full))) (.cutY 14464 .full (.cutX 31424 (.cutY 14528 .full .full) (.cutY 14528 .full .full)))) .empty) .empty) .empty)) .empty) .empty))))))) .empty))

theorem metadata66 : 0<114037843 ∧ 5<128 ∧ 71<128 ∧ 0<4 ∧
    686/4160=0 ∧ 686%4160=686 ∧ ∀ i, (leaves66 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData66).mp
    (by decide +kernel)

theorem sourceChecked66_0 : ∀ i : Fin 40,
    (fun i => output66 i = raw66 (source66 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked66 : ∀ i : Fin 40, (fun i => output66 i = raw66 (source66 i)) i :=
  forallFin_of_zero_offset (fun i => output66 i = raw66 (source66 i)) sourceChecked66_0

theorem coverChecked66_0 : ∀ i : Fin 40,
    (fun i => (output66 (cover66 i)).ContainsBox (raw66 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked66 : ∀ i : Fin 40, (fun i => (output66 (cover66 i)).ContainsBox (raw66 i)) i :=
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

noncomputable def phaseMass66 : ℝ := singlePhaseMass (114037843/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw66 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass66_eq : phaseMass66 = (114037843/1638400000000 : ℝ) := by
  unfold phaseMass66
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw66 output66 cover66 source66
    (gridTreeUnionCheck_sound 32768 raw66 output66 cover66 source66 tree66 checked66)
    _ (by norm_num) _, areaUnits66]
  norm_num

-- Frozen phase 5975, atom 6572, type 1, source (22,80).
def leavesData67 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves67 : Fin 13 → DyadicLeaf := leavesData67.get
def raw67 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 22 80 leaves67 i
def outputData67 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨5632,5696,20480,20544⟩) (.node (.single ⟨5632,5696,20544,20608⟩) (.single ⟨5696,5760,20480,20544⟩))) (.node (.single ⟨5696,5760,20544,20608⟩) (.node (.single ⟨5632,5760,20608,20736⟩) (.single ⟨5760,5824,20480,20544⟩)))) (.node (.node (.single ⟨5760,5824,20544,20608⟩) (.node (.single ⟨5824,5856,20480,20512⟩) (.single ⟨5824,5856,20512,20544⟩))) (.node (.node (.single ⟨5856,5888,20480,20512⟩) (.single ⟨5856,5888,20512,20544⟩)) (.node (.single ⟨5824,5888,20544,20608⟩) (.single ⟨5760,5888,20608,20736⟩))))) (.node (.node (.node (.single ⟨12032,12160,26880,27008⟩) (.node (.single ⟨12032,12160,27008,27136⟩) (.single ⟨12160,12224,26880,26944⟩))) (.node (.single ⟨12160,12224,26944,27008⟩) (.node (.single ⟨12224,12256,26880,26912⟩) (.single ⟨12224,12256,26912,26944⟩)))) (.node (.node (.single ⟨12256,12288,26880,26912⟩) (.node (.single ⟨12256,12288,26912,26944⟩) (.single ⟨12224,12288,26944,27008⟩))) (.node (.node (.single ⟨12160,12224,27008,27072⟩) (.single ⟨12160,12224,27072,27136⟩)) (.node (.single ⟨12224,12288,27008,27072⟩) (.single ⟨12224,12288,27072,27136⟩)))))) (.node (.node (.node (.node (.single ⟨20480,20544,5632,5696⟩) (.node (.single ⟨20480,20544,5696,5760⟩) (.single ⟨20544,20608,5632,5696⟩))) (.node (.single ⟨20544,20608,5696,5760⟩) (.node (.single ⟨20480,20544,5760,5824⟩) (.single ⟨20480,20512,5824,5856⟩)))) (.node (.node (.single ⟨20480,20512,5856,5888⟩) (.node (.single ⟨20512,20544,5824,5856⟩) (.single ⟨20512,20544,5856,5888⟩))) (.node (.node (.single ⟨20544,20608,5760,5824⟩) (.single ⟨20544,20608,5824,5888⟩)) (.node (.single ⟨20608,20736,5632,5760⟩) (.single ⟨20608,20736,5760,5888⟩))))) (.node (.node (.node (.single ⟨26880,27008,12032,12160⟩) (.node (.single ⟨26880,26944,12160,12224⟩) (.single ⟨26880,26912,12224,12256⟩))) (.node (.single ⟨26880,26912,12256,12288⟩) (.node (.single ⟨26912,26944,12224,12256⟩) (.single ⟨26912,26944,12256,12288⟩)))) (.node (.node (.single ⟨26944,27008,12160,12224⟩) (.node (.single ⟨26944,27008,12224,12288⟩) (.single ⟨27008,27136,12032,12160⟩))) (.node (.node (.single ⟨27008,27072,12160,12224⟩) (.single ⟨27008,27072,12224,12288⟩)) (.node (.single ⟨27072,27136,12160,12224⟩) (.single ⟨27072,27136,12224,12288⟩)))))))
def output67 : Fin 52 → GridBox := outputData67.get
def coverData67 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData67 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover67 (i : Fin 52) : Fin 52 := ⟨coverData67.get i % 52, Nat.mod_lt _ (by decide)⟩
def source67 (i : Fin 52) : Fin 52 := ⟨sourceData67.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree67 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 .empty (.cutY 21504 (.cutX 5632 .empty (.cutY 20992 (.cutX 5888 (.cutY 20736 (.cutX 5760 (.cutY 20608 (.cutX 5696 (.cutY 20544 .full .full) (.cutY 20544 .full .full)) .full) (.cutY 20608 (.cutX 5824 (.cutY 20544 .full .full) (.cutY 20544 (.cutX 5856 (.cutY 20512 .full .full) (.cutY 20512 .full .full)) .full)) .full)) .empty) .empty) .empty)) .empty)) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 .empty (.cutY 27648 (.cutX 11776 .empty (.cutY 27136 (.cutX 12032 .empty (.cutY 26880 .empty (.cutX 12160 (.cutY 27008 .full .full) (.cutY 27008 (.cutX 12224 (.cutY 26944 .full .full) (.cutY 26944 (.cutX 12256 (.cutY 26912 .full .full) (.cutY 26912 .full .full)) .full)) (.cutX 12224 (.cutY 27072 .full .full) (.cutY 27072 .full .full)))))) .empty)) .empty)))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 (.cutY 5120 .empty (.cutX 20992 (.cutY 5632 .empty (.cutX 20736 (.cutY 5888 (.cutX 20608 (.cutY 5760 (.cutX 20544 (.cutY 5696 .full .full) (.cutY 5696 .full .full)) (.cutX 20544 (.cutY 5824 .full (.cutX 20512 (.cutY 5856 .full .full) (.cutY 5856 .full .full))) (.cutY 5824 .full .full))) (.cutY 5760 .full .full)) .empty) .empty)) .empty)) .empty) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 (.cutY 11264 .empty (.cutX 27136 (.cutY 11776 .empty (.cutX 26880 .empty (.cutY 12032 .empty (.cutX 27008 (.cutY 12160 .full (.cutX 26944 (.cutY 12224 .full (.cutX 26912 (.cutY 12256 .full .full) (.cutY 12256 .full .full))) (.cutY 12224 .full .full))) (.cutY 12160 .full (.cutX 27072 (.cutY 12224 .full .full) (.cutY 12224 .full .full))))))) .empty)) .empty))) .empty) .empty))) .empty))

theorem metadata67 : 0<125829407 ∧ 22<128 ∧ 80<128 ∧ 1<4 ∧
    6572/4160=1 ∧ 6572%4160=2412 ∧ ∀ i, (leaves67 i).Valid 8 := by
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

noncomputable def phaseMass67 : ℝ := singlePhaseMass (125829407/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw67 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass67_eq : phaseMass67 = (125829407/1638400000000 : ℝ) := by
  unfold phaseMass67
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw67 output67 cover67 source67
    (gridTreeUnionCheck_sound 32768 raw67 output67 cover67 source67 tree67 checked67)
    _ (by norm_num) _, areaUnits67]
  norm_num

-- Frozen phase 5976, atom 6817, type 1, source (25,82).
def leavesData68 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves68 : Fin 13 → DyadicLeaf := leavesData68.get
def raw68 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 25 82 leaves68 i
def outputData68 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨6400,6464,20992,21056⟩) (.node (.single ⟨6400,6464,21056,21120⟩) (.single ⟨6464,6528,20992,21056⟩))) (.node (.single ⟨6464,6528,21056,21120⟩) (.node (.single ⟨6400,6528,21120,21248⟩) (.single ⟨6528,6592,20992,21056⟩)))) (.node (.node (.single ⟨6528,6592,21056,21120⟩) (.node (.single ⟨6592,6624,20992,21024⟩) (.single ⟨6592,6624,21024,21056⟩))) (.node (.node (.single ⟨6624,6656,20992,21024⟩) (.single ⟨6624,6656,21024,21056⟩)) (.node (.single ⟨6592,6656,21056,21120⟩) (.single ⟨6528,6656,21120,21248⟩))))) (.node (.node (.node (.single ⟨11520,11648,26112,26240⟩) (.node (.single ⟨11520,11648,26240,26368⟩) (.single ⟨11648,11712,26112,26176⟩))) (.node (.single ⟨11648,11712,26176,26240⟩) (.node (.single ⟨11712,11744,26112,26144⟩) (.single ⟨11712,11744,26144,26176⟩)))) (.node (.node (.single ⟨11744,11776,26112,26144⟩) (.node (.single ⟨11744,11776,26144,26176⟩) (.single ⟨11712,11776,26176,26240⟩))) (.node (.node (.single ⟨11648,11712,26240,26304⟩) (.single ⟨11648,11712,26304,26368⟩)) (.node (.single ⟨11712,11776,26240,26304⟩) (.single ⟨11712,11776,26304,26368⟩)))))) (.node (.node (.node (.node (.single ⟨20992,21056,6400,6464⟩) (.node (.single ⟨20992,21056,6464,6528⟩) (.single ⟨21056,21120,6400,6464⟩))) (.node (.single ⟨21056,21120,6464,6528⟩) (.node (.single ⟨20992,21056,6528,6592⟩) (.single ⟨20992,21024,6592,6624⟩)))) (.node (.node (.single ⟨20992,21024,6624,6656⟩) (.node (.single ⟨21024,21056,6592,6624⟩) (.single ⟨21024,21056,6624,6656⟩))) (.node (.node (.single ⟨21056,21120,6528,6592⟩) (.single ⟨21056,21120,6592,6656⟩)) (.node (.single ⟨21120,21248,6400,6528⟩) (.single ⟨21120,21248,6528,6656⟩))))) (.node (.node (.node (.single ⟨26112,26240,11520,11648⟩) (.node (.single ⟨26112,26176,11648,11712⟩) (.single ⟨26112,26144,11712,11744⟩))) (.node (.single ⟨26112,26144,11744,11776⟩) (.node (.single ⟨26144,26176,11712,11744⟩) (.single ⟨26144,26176,11744,11776⟩)))) (.node (.node (.single ⟨26176,26240,11648,11712⟩) (.node (.single ⟨26176,26240,11712,11776⟩) (.single ⟨26240,26368,11520,11648⟩))) (.node (.node (.single ⟨26240,26304,11648,11712⟩) (.single ⟨26240,26304,11712,11776⟩)) (.node (.single ⟨26304,26368,11648,11712⟩) (.single ⟨26304,26368,11712,11776⟩)))))))
def output68 : Fin 52 → GridBox := outputData68.get
def coverData68 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData68 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover68 (i : Fin 52) : Fin 52 := ⟨coverData68.get i % 52, Nat.mod_lt _ (by decide)⟩
def source68 (i : Fin 52) : Fin 52 := ⟨sourceData68.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree68 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 (.cutX 7168 (.cutY 21504 (.cutX 6656 (.cutY 20992 .empty (.cutX 6400 .empty (.cutY 21248 (.cutX 6528 (.cutY 21120 (.cutX 6464 (.cutY 21056 .full .full) (.cutY 21056 .full .full)) .full) (.cutY 21120 (.cutX 6592 (.cutY 21056 .full .full) (.cutY 21056 (.cutX 6624 (.cutY 21024 .full .full) (.cutY 21024 .full .full)) .full)) .full)) .empty))) .empty) .empty) .empty) .empty)))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 (.cutX 11264 .empty (.cutY 25600 .empty (.cutX 11776 (.cutY 26112 .empty (.cutX 11520 .empty (.cutY 26368 (.cutX 11648 (.cutY 26240 .full .full) (.cutY 26240 (.cutX 11712 (.cutY 26176 .full .full) (.cutY 26176 (.cutX 11744 (.cutY 26144 .full .full) (.cutY 26144 .full .full)) .full)) (.cutX 11712 (.cutY 26304 .full .full) (.cutY 26304 .full .full)))) .empty))) .empty))) .empty)) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 .empty (.cutX 21504 (.cutY 7168 (.cutX 20992 .empty (.cutY 6656 (.cutX 21248 (.cutY 6400 .empty (.cutX 21120 (.cutY 6528 (.cutX 21056 (.cutY 6464 .full .full) (.cutY 6464 .full .full)) (.cutX 21056 (.cutY 6592 .full (.cutX 21024 (.cutY 6624 .full .full) (.cutY 6624 .full .full))) (.cutY 6592 .full .full))) (.cutY 6528 .full .full))) .empty) .empty)) .empty) .empty)) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 .empty (.cutX 25600 .empty (.cutY 11264 .empty (.cutX 26112 .empty (.cutY 11776 (.cutX 26368 (.cutY 11520 .empty (.cutX 26240 (.cutY 11648 .full (.cutX 26176 (.cutY 11712 .full (.cutX 26144 (.cutY 11744 .full .full) (.cutY 11744 .full .full))) (.cutY 11712 .full .full))) (.cutY 11648 .full (.cutX 26304 (.cutY 11712 .full .full) (.cutY 11712 .full .full))))) .empty) .empty))))) .empty) .empty) .empty))) .empty))

theorem metadata68 : 0<144359671 ∧ 25<128 ∧ 82<128 ∧ 1<4 ∧
    6817/4160=1 ∧ 6817%4160=2657 ∧ ∀ i, (leaves68 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData68).mp
    (by decide +kernel)

theorem sourceChecked68_0 : ∀ i : Fin 52,
    (fun i => output68 i = raw68 (source68 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked68 : ∀ i : Fin 52, (fun i => output68 i = raw68 (source68 i)) i :=
  forallFin_of_zero_offset (fun i => output68 i = raw68 (source68 i)) sourceChecked68_0

theorem coverChecked68_0 : ∀ i : Fin 52,
    (fun i => (output68 (cover68 i)).ContainsBox (raw68 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked68 : ∀ i : Fin 52, (fun i => (output68 (cover68 i)).ContainsBox (raw68 i)) i :=
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

noncomputable def phaseMass68 : ℝ := singlePhaseMass (144359671/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw68 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass68_eq : phaseMass68 = (144359671/1638400000000 : ℝ) := by
  unfold phaseMass68
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw68 output68 cover68 source68
    (gridTreeUnionCheck_sound 32768 raw68 output68 cover68 source68 tree68 checked68)
    _ (by norm_num) _, areaUnits68]
  norm_num

-- Frozen phase 5977, atom 2242, type 0, source (20,82).
def leavesData69 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,0⟩))) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves69 : Fin 13 → DyadicLeaf := leavesData69.get
def raw69 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 20 82 leaves69 i
def outputData69 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨5120,5184,20992,21056⟩) (.node (.single ⟨5120,5184,21056,21120⟩) (.single ⟨5184,5248,20992,21056⟩))) (.node (.single ⟨5184,5248,21056,21120⟩) (.node (.single ⟨5120,5248,21120,21248⟩) (.single ⟨5248,5312,20992,21056⟩)))) (.node (.node (.single ⟨5248,5312,21056,21120⟩) (.node (.single ⟨5312,5344,20992,21024⟩) (.single ⟨5312,5344,21024,21056⟩))) (.node (.node (.single ⟨5344,5376,20992,21024⟩) (.single ⟨5344,5376,21024,21056⟩)) (.node (.single ⟨5312,5376,21056,21120⟩) (.single ⟨5248,5376,21120,21248⟩))))) (.node (.node (.node (.single ⟨11520,11648,27392,27520⟩) (.node (.single ⟨11520,11648,27520,27648⟩) (.single ⟨11648,11712,27392,27456⟩))) (.node (.single ⟨11648,11712,27456,27520⟩) (.node (.single ⟨11712,11744,27392,27424⟩) (.single ⟨11712,11744,27424,27456⟩)))) (.node (.node (.single ⟨11744,11776,27392,27424⟩) (.node (.single ⟨11744,11776,27424,27456⟩) (.single ⟨11712,11776,27456,27520⟩))) (.node (.node (.single ⟨11648,11712,27520,27584⟩) (.single ⟨11648,11712,27584,27648⟩)) (.node (.single ⟨11712,11776,27520,27584⟩) (.single ⟨11712,11776,27584,27648⟩)))))) (.node (.node (.node (.node (.single ⟨20992,21056,5120,5184⟩) (.node (.single ⟨20992,21056,5184,5248⟩) (.single ⟨21056,21120,5120,5184⟩))) (.node (.single ⟨21056,21120,5184,5248⟩) (.node (.single ⟨20992,21056,5248,5312⟩) (.single ⟨20992,21024,5312,5344⟩)))) (.node (.node (.single ⟨20992,21024,5344,5376⟩) (.node (.single ⟨21024,21056,5312,5344⟩) (.single ⟨21024,21056,5344,5376⟩))) (.node (.node (.single ⟨21056,21120,5248,5312⟩) (.single ⟨21056,21120,5312,5376⟩)) (.node (.single ⟨21120,21248,5120,5248⟩) (.single ⟨21120,21248,5248,5376⟩))))) (.node (.node (.node (.single ⟨27392,27520,11520,11648⟩) (.node (.single ⟨27392,27456,11648,11712⟩) (.single ⟨27392,27424,11712,11744⟩))) (.node (.single ⟨27392,27424,11744,11776⟩) (.node (.single ⟨27424,27456,11712,11744⟩) (.single ⟨27424,27456,11744,11776⟩)))) (.node (.node (.single ⟨27456,27520,11648,11712⟩) (.node (.single ⟨27456,27520,11712,11776⟩) (.single ⟨27520,27648,11520,11648⟩))) (.node (.node (.single ⟨27520,27584,11648,11712⟩) (.single ⟨27520,27584,11712,11776⟩)) (.node (.single ⟨27584,27648,11648,11712⟩) (.single ⟨27584,27648,11712,11776⟩)))))))
def output69 : Fin 52 → GridBox := outputData69.get
def coverData69 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 0))) (.node (.node (.single 26) (.single 51)) (.node (.single 25) (.single 1))))) (.node (.node (.node (.single 28) (.node (.single 50) (.single 23))) (.node (.single 2) (.node (.single 27) (.single 49)))) (.node (.node (.single 24) (.node (.single 3) (.single 29))) (.node (.node (.single 48) (.single 22)) (.node (.single 5) (.single 30)))))) (.node (.node (.node (.node (.single 46) (.node (.single 21) (.single 6))) (.node (.single 35) (.node (.single 45) (.single 16)))) (.node (.node (.single 11) (.node (.single 36) (.single 40))) (.node (.node (.single 15) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData69 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.single 20) (.node (.single 0) (.single 24)))) (.node (.node (.single 28) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 35))) (.node (.single 31) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.node (.single 17) (.single 13))) (.node (.single 21) (.node (.single 25) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 34) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 30) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover69 (i : Fin 52) : Fin 52 := ⟨coverData69.get i % 52, Nat.mod_lt _ (by decide)⟩
def source69 (i : Fin 52) : Fin 52 := ⟨sourceData69.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree69 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 .empty (.cutY 21504 (.cutX 5632 (.cutY 20992 .empty (.cutX 5376 (.cutY 21248 (.cutX 5248 (.cutY 21120 (.cutX 5184 (.cutY 21056 .full .full) (.cutY 21056 .full .full)) .full) (.cutY 21120 (.cutX 5312 (.cutY 21056 .full .full) (.cutY 21056 (.cutX 5344 (.cutY 21024 .full .full) (.cutY 21024 .full .full)) .full)) .full)) .empty) .empty)) .empty) .empty)) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 .empty (.cutY 27648 (.cutX 11776 (.cutY 27136 .empty (.cutX 11520 .empty (.cutY 27392 .empty (.cutX 11648 (.cutY 27520 .full .full) (.cutY 27520 (.cutX 11712 (.cutY 27456 .full .full) (.cutY 27456 (.cutX 11744 (.cutY 27424 .full .full) (.cutY 27424 .full .full)) .full)) (.cutX 11712 (.cutY 27584 .full .full) (.cutY 27584 .full .full))))))) .empty) .empty)))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 (.cutY 5120 .empty (.cutX 20992 .empty (.cutY 5632 (.cutX 21248 (.cutY 5376 (.cutX 21120 (.cutY 5248 (.cutX 21056 (.cutY 5184 .full .full) (.cutY 5184 .full .full)) (.cutX 21056 (.cutY 5312 .full (.cutX 21024 (.cutY 5344 .full .full) (.cutY 5344 .full .full))) (.cutY 5312 .full .full))) (.cutY 5248 .full .full)) .empty) .empty) .empty))) .empty) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 (.cutY 11264 .empty (.cutX 27136 .empty (.cutY 11776 (.cutX 27392 .empty (.cutY 11520 .empty (.cutX 27520 (.cutY 11648 .full (.cutX 27456 (.cutY 11712 .full (.cutX 27424 (.cutY 11744 .full .full) (.cutY 11744 .full .full))) (.cutY 11712 .full .full))) (.cutY 11648 .full (.cutX 27584 (.cutY 11712 .full .full) (.cutY 11712 .full .full)))))) .empty))) .empty))) .empty) .empty))) .empty))

theorem metadata69 : 0<152546139 ∧ 20<128 ∧ 82<128 ∧ 0<4 ∧
    2242/4160=0 ∧ 2242%4160=2242 ∧ ∀ i, (leaves69 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData69).mp
    (by decide +kernel)

theorem sourceChecked69_0 : ∀ i : Fin 52,
    (fun i => output69 i = raw69 (source69 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked69 : ∀ i : Fin 52, (fun i => output69 i = raw69 (source69 i)) i :=
  forallFin_of_zero_offset (fun i => output69 i = raw69 (source69 i)) sourceChecked69_0

theorem coverChecked69_0 : ∀ i : Fin 52,
    (fun i => (output69 (cover69 i)).ContainsBox (raw69 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked69 : ∀ i : Fin 52, (fun i => (output69 (cover69 i)).ContainsBox (raw69 i)) i :=
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

noncomputable def phaseMass69 : ℝ := singlePhaseMass (152546139/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw69 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass69_eq : phaseMass69 = (152546139/1638400000000 : ℝ) := by
  unfold phaseMass69
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw69 output69 cover69 source69
    (gridTreeUnionCheck_sound 32768 raw69 output69 cover69 source69 tree69 checked69)
    _ (by norm_num) _, areaUnits69]
  norm_num

-- Frozen phase 5978, atom 1361, type 0, source (11,74).
def leavesData70 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves70 : Fin 7 → DyadicLeaf := leavesData70.get
def raw70 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 11 74 leaves70 i
def outputData70 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨2816,2944,18944,19072⟩) (.node (.single ⟨2816,2944,19072,19200⟩) (.single ⟨2944,3008,18944,19008⟩))) (.node (.node (.single ⟨2944,3008,19008,19072⟩) (.single ⟨3008,3072,18944,19008⟩)) (.node (.single ⟨3008,3072,19008,19072⟩) (.single ⟨2944,3072,19072,19200⟩)))) (.node (.node (.single ⟨13568,13696,29696,29824⟩) (.node (.single ⟨13568,13696,29824,29952⟩) (.single ⟨13696,13760,29696,29760⟩))) (.node (.node (.single ⟨13696,13760,29760,29824⟩) (.single ⟨13760,13824,29696,29760⟩)) (.node (.single ⟨13760,13824,29760,29824⟩) (.single ⟨13696,13824,29824,29952⟩))))) (.node (.node (.node (.single ⟨18944,19072,2816,2944⟩) (.node (.single ⟨18944,19008,2944,3008⟩) (.single ⟨18944,19008,3008,3072⟩))) (.node (.node (.single ⟨19008,19072,2944,3008⟩) (.single ⟨19008,19072,3008,3072⟩)) (.node (.single ⟨19072,19200,2816,2944⟩) (.single ⟨19072,19200,2944,3072⟩)))) (.node (.node (.single ⟨29696,29824,13568,13696⟩) (.node (.single ⟨29696,29760,13696,13760⟩) (.single ⟨29696,29760,13760,13824⟩))) (.node (.node (.single ⟨29760,29824,13696,13760⟩) (.single ⟨29760,29824,13760,13824⟩)) (.node (.single ⟨29824,29952,13568,13696⟩) (.single ⟨29824,29952,13696,13824⟩))))))
def output70 : Fin 28 → GridBox := outputData70.get
def coverData70 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData70 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover70 (i : Fin 28) : Fin 28 := ⟨coverData70.get i % 28, Nat.mod_lt _ (by decide)⟩
def source70 (i : Fin 28) : Fin 28 := ⟨sourceData70.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree70 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 (.cutY 19456 (.cutX 2560 .empty (.cutY 18944 .empty (.cutX 2816 .empty (.cutY 19200 (.cutX 2944 (.cutY 19072 .full .full) (.cutY 19072 (.cutX 3008 (.cutY 19008 .full .full) (.cutY 19008 .full .full)) .full)) .empty)))) .empty) .empty))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 .empty (.cutY 29696 .empty (.cutX 13824 (.cutY 30208 (.cutX 13568 .empty (.cutY 29952 (.cutX 13696 (.cutY 29824 .full .full) (.cutY 29824 (.cutX 13760 (.cutY 29760 .full .full) (.cutY 29760 .full .full)) .full)) .empty)) .empty) .empty))) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 (.cutY 3072 (.cutX 18944 .empty (.cutY 2560 .empty (.cutX 19200 (.cutY 2816 .empty (.cutX 19072 (.cutY 2944 .full (.cutX 19008 (.cutY 3008 .full .full) (.cutY 3008 .full .full))) (.cutY 2944 .full .full))) .empty))) .empty) .empty))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 .empty (.cutY 13312 .empty (.cutX 30208 (.cutY 13824 (.cutX 29952 (.cutY 13568 .empty (.cutX 29824 (.cutY 13696 .full (.cutX 29760 (.cutY 13760 .full .full) (.cutY 13760 .full .full))) (.cutY 13696 .full .full))) .empty) .empty) .empty))) .empty) .empty))))) .empty))

theorem metadata70 : 0<48363413 ∧ 11<128 ∧ 74<128 ∧ 0<4 ∧
    1361/4160=0 ∧ 1361%4160=1361 ∧ ∀ i, (leaves70 i).Valid 8 := by
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

noncomputable def phaseMass70 : ℝ := singlePhaseMass (48363413/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw70 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass70_eq : phaseMass70 = (48363413/1638400000000 : ℝ) := by
  unfold phaseMass70
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw70 output70 cover70 source70
    (gridTreeUnionCheck_sound 32768 raw70 output70 cover70 source70 tree70 checked70)
    _ (by norm_num) _, areaUnits70]
  norm_num

-- Frozen phase 5979, atom 6309, type 1, source (19,78).
def leavesData71 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves71 : Fin 13 → DyadicLeaf := leavesData71.get
def raw71 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 19 78 leaves71 i
def outputData71 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨4864,4928,19968,20032⟩) (.node (.single ⟨4864,4928,20032,20096⟩) (.single ⟨4928,4992,19968,20032⟩))) (.node (.single ⟨4928,4992,20032,20096⟩) (.node (.single ⟨4864,4992,20096,20224⟩) (.single ⟨4992,5056,19968,20032⟩)))) (.node (.node (.single ⟨4992,5056,20032,20096⟩) (.node (.single ⟨5056,5088,19968,20000⟩) (.single ⟨5056,5088,20000,20032⟩))) (.node (.node (.single ⟨5088,5120,19968,20000⟩) (.single ⟨5088,5120,20000,20032⟩)) (.node (.single ⟨5056,5120,20032,20096⟩) (.single ⟨4992,5120,20096,20224⟩))))) (.node (.node (.node (.single ⟨12544,12672,27648,27776⟩) (.node (.single ⟨12544,12672,27776,27904⟩) (.single ⟨12672,12736,27648,27712⟩))) (.node (.single ⟨12672,12736,27712,27776⟩) (.node (.single ⟨12736,12768,27648,27680⟩) (.single ⟨12736,12768,27680,27712⟩)))) (.node (.node (.single ⟨12768,12800,27648,27680⟩) (.node (.single ⟨12768,12800,27680,27712⟩) (.single ⟨12736,12800,27712,27776⟩))) (.node (.node (.single ⟨12672,12736,27776,27840⟩) (.single ⟨12672,12736,27840,27904⟩)) (.node (.single ⟨12736,12800,27776,27840⟩) (.single ⟨12736,12800,27840,27904⟩)))))) (.node (.node (.node (.node (.single ⟨19968,20032,4864,4928⟩) (.node (.single ⟨19968,20032,4928,4992⟩) (.single ⟨20032,20096,4864,4928⟩))) (.node (.single ⟨20032,20096,4928,4992⟩) (.node (.single ⟨19968,20032,4992,5056⟩) (.single ⟨19968,20000,5056,5088⟩)))) (.node (.node (.single ⟨19968,20000,5088,5120⟩) (.node (.single ⟨20000,20032,5056,5088⟩) (.single ⟨20000,20032,5088,5120⟩))) (.node (.node (.single ⟨20032,20096,4992,5056⟩) (.single ⟨20032,20096,5056,5120⟩)) (.node (.single ⟨20096,20224,4864,4992⟩) (.single ⟨20096,20224,4992,5120⟩))))) (.node (.node (.node (.single ⟨27648,27776,12544,12672⟩) (.node (.single ⟨27648,27712,12672,12736⟩) (.single ⟨27648,27680,12736,12768⟩))) (.node (.single ⟨27648,27680,12768,12800⟩) (.node (.single ⟨27680,27712,12736,12768⟩) (.single ⟨27680,27712,12768,12800⟩)))) (.node (.node (.single ⟨27712,27776,12672,12736⟩) (.node (.single ⟨27712,27776,12736,12800⟩) (.single ⟨27776,27904,12544,12672⟩))) (.node (.node (.single ⟨27776,27840,12672,12736⟩) (.single ⟨27776,27840,12736,12800⟩)) (.node (.single ⟨27840,27904,12672,12736⟩) (.single ⟨27840,27904,12736,12800⟩)))))))
def output71 : Fin 52 → GridBox := outputData71.get
def coverData71 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData71 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover71 (i : Fin 52) : Fin 52 := ⟨coverData71.get i % 52, Nat.mod_lt _ (by decide)⟩
def source71 (i : Fin 52) : Fin 52 := ⟨sourceData71.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree71 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 .empty (.cutX 5120 (.cutY 19456 .empty (.cutX 4608 .empty (.cutY 19968 .empty (.cutX 4864 .empty (.cutY 20224 (.cutX 4992 (.cutY 20096 (.cutX 4928 (.cutY 20032 .full .full) (.cutY 20032 .full .full)) .full) (.cutY 20096 (.cutX 5056 (.cutY 20032 .full .full) (.cutY 20032 (.cutX 5088 (.cutY 20000 .full .full) (.cutY 20000 .full .full)) .full)) .full)) .empty))))) .empty)) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 .empty (.cutX 13312 (.cutY 27648 .empty (.cutX 12800 (.cutY 28160 (.cutX 12544 .empty (.cutY 27904 (.cutX 12672 (.cutY 27776 .full .full) (.cutY 27776 (.cutX 12736 (.cutY 27712 .full .full) (.cutY 27712 (.cutX 12768 (.cutY 27680 .full .full) (.cutY 27680 .full .full)) .full)) (.cutX 12736 (.cutY 27840 .full .full) (.cutY 27840 .full .full)))) .empty)) .empty) .empty)) .empty)) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 (.cutX 19456 .empty (.cutY 5120 (.cutX 19968 .empty (.cutY 4608 .empty (.cutX 20224 (.cutY 4864 .empty (.cutX 20096 (.cutY 4992 (.cutX 20032 (.cutY 4928 .full .full) (.cutY 4928 .full .full)) (.cutX 20032 (.cutY 5056 .full (.cutX 20000 (.cutY 5088 .full .full) (.cutY 5088 .full .full))) (.cutY 5056 .full .full))) (.cutY 4992 .full .full))) .empty))) .empty)) .empty))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 (.cutX 27648 .empty (.cutY 13312 (.cutX 28160 (.cutY 12800 (.cutX 27904 (.cutY 12544 .empty (.cutX 27776 (.cutY 12672 .full (.cutX 27712 (.cutY 12736 .full (.cutX 27680 (.cutY 12768 .full .full) (.cutY 12768 .full .full))) (.cutY 12736 .full .full))) (.cutY 12672 .full (.cutX 27840 (.cutY 12736 .full .full) (.cutY 12736 .full .full))))) .empty) .empty) .empty) .empty)) .empty))) .empty))) .empty))

theorem metadata71 : 0<157738472 ∧ 19<128 ∧ 78<128 ∧ 1<4 ∧
    6309/4160=1 ∧ 6309%4160=2149 ∧ ∀ i, (leaves71 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData71).mp
    (by decide +kernel)

theorem sourceChecked71_0 : ∀ i : Fin 52,
    (fun i => output71 i = raw71 (source71 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked71 : ∀ i : Fin 52, (fun i => output71 i = raw71 (source71 i)) i :=
  forallFin_of_zero_offset (fun i => output71 i = raw71 (source71 i)) sourceChecked71_0

theorem coverChecked71_0 : ∀ i : Fin 52,
    (fun i => (output71 (cover71 i)).ContainsBox (raw71 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked71 : ∀ i : Fin 52, (fun i => (output71 (cover71 i)).ContainsBox (raw71 i)) i :=
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

noncomputable def phaseMass71 : ℝ := singlePhaseMass (157738472/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw71 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass71_eq : phaseMass71 = (19717309/204800000000 : ℝ) := by
  unfold phaseMass71
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw71 output71 cover71 source71
    (gridTreeUnionCheck_sound 32768 raw71 output71 cover71 source71 tree71 checked71)
    _ (by norm_num) _, areaUnits71]
  norm_num

-- Frozen phase 5980, atom 2660, type 0, source (25,85).
def leavesData72 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves72 : Fin 10 → DyadicLeaf := leavesData72.get
def raw72 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 25 85 leaves72 i
def outputData72 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨6400,6464,21760,21824⟩) (.single ⟨6400,6464,21824,21888⟩)) (.node (.single ⟨6464,6528,21760,21824⟩) (.node (.single ⟨6464,6528,21824,21888⟩) (.single ⟨6400,6528,21888,22016⟩)))) (.node (.node (.single ⟨6528,6592,21760,21824⟩) (.single ⟨6528,6592,21824,21888⟩)) (.node (.single ⟨6592,6656,21760,21824⟩) (.node (.single ⟨6592,6656,21824,21888⟩) (.single ⟨6528,6656,21888,22016⟩))))) (.node (.node (.node (.single ⟨10752,10880,26112,26240⟩) (.single ⟨10752,10880,26240,26368⟩)) (.node (.single ⟨10880,10944,26112,26176⟩) (.node (.single ⟨10880,10944,26176,26240⟩) (.single ⟨10944,11008,26112,26176⟩)))) (.node (.node (.single ⟨10944,11008,26176,26240⟩) (.single ⟨10880,10944,26240,26304⟩)) (.node (.single ⟨10880,10944,26304,26368⟩) (.node (.single ⟨10944,11008,26240,26304⟩) (.single ⟨10944,11008,26304,26368⟩)))))) (.node (.node (.node (.node (.single ⟨21760,21824,6400,6464⟩) (.single ⟨21760,21824,6464,6528⟩)) (.node (.single ⟨21824,21888,6400,6464⟩) (.node (.single ⟨21824,21888,6464,6528⟩) (.single ⟨21760,21824,6528,6592⟩)))) (.node (.node (.single ⟨21760,21824,6592,6656⟩) (.single ⟨21824,21888,6528,6592⟩)) (.node (.single ⟨21824,21888,6592,6656⟩) (.node (.single ⟨21888,22016,6400,6528⟩) (.single ⟨21888,22016,6528,6656⟩))))) (.node (.node (.node (.single ⟨26112,26240,10752,10880⟩) (.single ⟨26112,26176,10880,10944⟩)) (.node (.single ⟨26112,26176,10944,11008⟩) (.node (.single ⟨26176,26240,10880,10944⟩) (.single ⟨26176,26240,10944,11008⟩)))) (.node (.node (.single ⟨26240,26368,10752,10880⟩) (.single ⟨26240,26304,10880,10944⟩)) (.node (.single ⟨26240,26304,10944,11008⟩) (.node (.single ⟨26304,26368,10880,10944⟩) (.single ⟨26304,26368,10944,11008⟩)))))))
def output72 : Fin 40 → GridBox := outputData72.get
def coverData72 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData72 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover72 (i : Fin 40) : Fin 40 := ⟨coverData72.get i % 40, Nat.mod_lt _ (by decide)⟩
def source72 (i : Fin 40) : Fin 40 := ⟨sourceData72.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree72 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 (.cutX 7168 (.cutY 21504 .empty (.cutX 6656 (.cutY 22016 (.cutX 6400 .empty (.cutY 21760 .empty (.cutX 6528 (.cutY 21888 (.cutX 6464 (.cutY 21824 .full .full) (.cutY 21824 .full .full)) .full) (.cutY 21888 (.cutX 6592 (.cutY 21824 .full .full) (.cutY 21824 .full .full)) .full)))) .empty) .empty)) .empty) .empty)))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 (.cutX 11264 (.cutY 25600 .empty (.cutX 10752 .empty (.cutY 26112 .empty (.cutX 11008 (.cutY 26368 (.cutX 10880 (.cutY 26240 .full .full) (.cutY 26240 (.cutX 10944 (.cutY 26176 .full .full) (.cutY 26176 .full .full)) (.cutX 10944 (.cutY 26304 .full .full) (.cutY 26304 .full .full)))) .empty) .empty)))) .empty) .empty)) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 .empty (.cutX 21504 .empty (.cutY 7168 (.cutX 22016 (.cutY 6656 (.cutX 21760 .empty (.cutY 6400 .empty (.cutX 21888 (.cutY 6528 (.cutX 21824 (.cutY 6464 .full .full) (.cutY 6464 .full .full)) (.cutX 21824 (.cutY 6592 .full .full) (.cutY 6592 .full .full))) (.cutY 6528 .full .full)))) .empty) .empty) .empty))) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 .empty (.cutX 25600 .empty (.cutY 11264 (.cutX 26112 .empty (.cutY 10752 .empty (.cutX 26368 (.cutY 11008 (.cutX 26240 (.cutY 10880 .full (.cutX 26176 (.cutY 10944 .full .full) (.cutY 10944 .full .full))) (.cutY 10880 .full (.cutX 26304 (.cutY 10944 .full .full) (.cutY 10944 .full .full)))) .empty) .empty))) .empty))) .empty) .empty) .empty))) .empty))

theorem metadata72 : 0<104681033 ∧ 25<128 ∧ 85<128 ∧ 0<4 ∧
    2660/4160=0 ∧ 2660%4160=2660 ∧ ∀ i, (leaves72 i).Valid 8 := by
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

noncomputable def phaseMass72 : ℝ := singlePhaseMass (104681033/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw72 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass72_eq : phaseMass72 = (104681033/1638400000000 : ℝ) := by
  unfold phaseMass72
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw72 output72 cover72 source72
    (gridTreeUnionCheck_sound 32768 raw72 output72 cover72 source72 tree72 checked72)
    _ (by norm_num) _, areaUnits72]
  norm_num

-- Frozen phase 5981, atom 7254, type 1, source (31,87).
def leavesData73 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves73 : Fin 7 → DyadicLeaf := leavesData73.get
def raw73 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 31 87 leaves73 i
def outputData73 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨7936,8064,22272,22400⟩) (.node (.single ⟨7936,8064,22400,22528⟩) (.single ⟨8064,8128,22272,22336⟩))) (.node (.node (.single ⟨8064,8128,22336,22400⟩) (.single ⟨8128,8192,22272,22336⟩)) (.node (.single ⟨8128,8192,22336,22400⟩) (.single ⟨8064,8192,22400,22528⟩)))) (.node (.node (.single ⟨10240,10368,24576,24704⟩) (.node (.single ⟨10240,10368,24704,24832⟩) (.single ⟨10368,10432,24576,24640⟩))) (.node (.node (.single ⟨10368,10432,24640,24704⟩) (.single ⟨10432,10496,24576,24640⟩)) (.node (.single ⟨10432,10496,24640,24704⟩) (.single ⟨10368,10496,24704,24832⟩))))) (.node (.node (.node (.single ⟨22272,22400,7936,8064⟩) (.node (.single ⟨22272,22336,8064,8128⟩) (.single ⟨22272,22336,8128,8192⟩))) (.node (.node (.single ⟨22336,22400,8064,8128⟩) (.single ⟨22336,22400,8128,8192⟩)) (.node (.single ⟨22400,22528,7936,8064⟩) (.single ⟨22400,22528,8064,8192⟩)))) (.node (.node (.single ⟨24576,24704,10240,10368⟩) (.node (.single ⟨24576,24640,10368,10432⟩) (.single ⟨24576,24640,10432,10496⟩))) (.node (.node (.single ⟨24640,24704,10368,10432⟩) (.single ⟨24640,24704,10432,10496⟩)) (.node (.single ⟨24704,24832,10240,10368⟩) (.single ⟨24704,24832,10368,10496⟩))))))
def output73 : Fin 28 → GridBox := outputData73.get
def coverData73 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData73 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover73 (i : Fin 28) : Fin 28 := ⟨coverData73.get i % 28, Nat.mod_lt _ (by decide)⟩
def source73 (i : Fin 28) : Fin 28 := ⟨sourceData73.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree73 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 (.cutX 7168 .empty (.cutY 21504 .empty (.cutX 7680 .empty (.cutY 22016 .empty (.cutX 7936 .empty (.cutY 22272 .empty (.cutX 8064 (.cutY 22400 .full .full) (.cutY 22400 (.cutX 8128 (.cutY 22336 .full .full) (.cutY 22336 .full .full)) .full)))))))) .empty)))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 (.cutX 11264 (.cutY 25600 (.cutX 10752 (.cutY 25088 (.cutX 10496 (.cutY 24832 (.cutX 10368 (.cutY 24704 .full .full) (.cutY 24704 (.cutX 10432 (.cutY 24640 .full .full) (.cutY 24640 .full .full)) .full)) .empty) .empty) .empty) .empty) .empty) .empty) .empty)) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 .empty (.cutX 21504 .empty (.cutY 7168 .empty (.cutX 22016 .empty (.cutY 7680 .empty (.cutX 22272 .empty (.cutY 7936 .empty (.cutX 22400 (.cutY 8064 .full (.cutX 22336 (.cutY 8128 .full .full) (.cutY 8128 .full .full))) (.cutY 8064 .full .full))))))))) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 .empty (.cutX 25600 (.cutY 11264 (.cutX 25088 (.cutY 10752 (.cutX 24832 (.cutY 10496 (.cutX 24704 (.cutY 10368 .full (.cutX 24640 (.cutY 10432 .full .full) (.cutY 10432 .full .full))) (.cutY 10368 .full .full)) .empty) .empty) .empty) .empty) .empty) .empty)) .empty) .empty) .empty))) .empty))

theorem metadata73 : 0<144359671 ∧ 31<128 ∧ 87<128 ∧ 1<4 ∧
    7254/4160=1 ∧ 7254%4160=3094 ∧ ∀ i, (leaves73 i).Valid 8 := by
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

noncomputable def phaseMass73 : ℝ := singlePhaseMass (144359671/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw73 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass73_eq : phaseMass73 = (144359671/1638400000000 : ℝ) := by
  unfold phaseMass73
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw73 output73 cover73 source73
    (gridTreeUnionCheck_sound 32768 raw73 output73 cover73 source73 tree73 checked73)
    _ (by norm_num) _, areaUnits73]
  norm_num

-- Frozen phase 5982, atom 7186, type 1, source (30,86).
def leavesData74 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves74 : Fin 13 → DyadicLeaf := leavesData74.get
def raw74 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 30 86 leaves74 i
def outputData74 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨7680,7744,22016,22080⟩) (.node (.single ⟨7680,7744,22080,22144⟩) (.single ⟨7744,7808,22016,22080⟩))) (.node (.single ⟨7744,7808,22080,22144⟩) (.node (.single ⟨7680,7808,22144,22272⟩) (.single ⟨7808,7872,22016,22080⟩)))) (.node (.node (.single ⟨7808,7872,22080,22144⟩) (.node (.single ⟨7872,7904,22016,22048⟩) (.single ⟨7872,7904,22048,22080⟩))) (.node (.node (.single ⟨7904,7936,22016,22048⟩) (.single ⟨7904,7936,22048,22080⟩)) (.node (.single ⟨7872,7936,22080,22144⟩) (.single ⟨7808,7936,22144,22272⟩))))) (.node (.node (.node (.single ⟨10496,10624,24832,24960⟩) (.node (.single ⟨10496,10624,24960,25088⟩) (.single ⟨10624,10688,24832,24896⟩))) (.node (.single ⟨10624,10688,24896,24960⟩) (.node (.single ⟨10688,10720,24832,24864⟩) (.single ⟨10688,10720,24864,24896⟩)))) (.node (.node (.single ⟨10720,10752,24832,24864⟩) (.node (.single ⟨10720,10752,24864,24896⟩) (.single ⟨10688,10752,24896,24960⟩))) (.node (.node (.single ⟨10624,10688,24960,25024⟩) (.single ⟨10624,10688,25024,25088⟩)) (.node (.single ⟨10688,10752,24960,25024⟩) (.single ⟨10688,10752,25024,25088⟩)))))) (.node (.node (.node (.node (.single ⟨22016,22080,7680,7744⟩) (.node (.single ⟨22016,22080,7744,7808⟩) (.single ⟨22080,22144,7680,7744⟩))) (.node (.single ⟨22080,22144,7744,7808⟩) (.node (.single ⟨22016,22080,7808,7872⟩) (.single ⟨22016,22048,7872,7904⟩)))) (.node (.node (.single ⟨22016,22048,7904,7936⟩) (.node (.single ⟨22048,22080,7872,7904⟩) (.single ⟨22048,22080,7904,7936⟩))) (.node (.node (.single ⟨22080,22144,7808,7872⟩) (.single ⟨22080,22144,7872,7936⟩)) (.node (.single ⟨22144,22272,7680,7808⟩) (.single ⟨22144,22272,7808,7936⟩))))) (.node (.node (.node (.single ⟨24832,24960,10496,10624⟩) (.node (.single ⟨24832,24896,10624,10688⟩) (.single ⟨24832,24864,10688,10720⟩))) (.node (.single ⟨24832,24864,10720,10752⟩) (.node (.single ⟨24864,24896,10688,10720⟩) (.single ⟨24864,24896,10720,10752⟩)))) (.node (.node (.single ⟨24896,24960,10624,10688⟩) (.node (.single ⟨24896,24960,10688,10752⟩) (.single ⟨24960,25088,10496,10624⟩))) (.node (.node (.single ⟨24960,25024,10624,10688⟩) (.single ⟨24960,25024,10688,10752⟩)) (.node (.single ⟨25024,25088,10624,10688⟩) (.single ⟨25024,25088,10688,10752⟩)))))))
def output74 : Fin 52 → GridBox := outputData74.get
def coverData74 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData74 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover74 (i : Fin 52) : Fin 52 := ⟨coverData74.get i % 52, Nat.mod_lt _ (by decide)⟩
def source74 (i : Fin 52) : Fin 52 := ⟨sourceData74.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree74 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 (.cutX 7168 .empty (.cutY 21504 .empty (.cutX 7680 .empty (.cutY 22016 .empty (.cutX 7936 (.cutY 22272 (.cutX 7808 (.cutY 22144 (.cutX 7744 (.cutY 22080 .full .full) (.cutY 22080 .full .full)) .full) (.cutY 22144 (.cutX 7872 (.cutY 22080 .full .full) (.cutY 22080 (.cutX 7904 (.cutY 22048 .full .full) (.cutY 22048 .full .full)) .full)) .full)) .empty) .empty))))) .empty)))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 (.cutX 11264 (.cutY 25600 (.cutX 10752 (.cutY 25088 (.cutX 10496 .empty (.cutY 24832 .empty (.cutX 10624 (.cutY 24960 .full .full) (.cutY 24960 (.cutX 10688 (.cutY 24896 .full .full) (.cutY 24896 (.cutX 10720 (.cutY 24864 .full .full) (.cutY 24864 .full .full)) .full)) (.cutX 10688 (.cutY 25024 .full .full) (.cutY 25024 .full .full)))))) .empty) .empty) .empty) .empty) .empty)) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 .empty (.cutX 21504 .empty (.cutY 7168 .empty (.cutX 22016 .empty (.cutY 7680 .empty (.cutX 22272 (.cutY 7936 (.cutX 22144 (.cutY 7808 (.cutX 22080 (.cutY 7744 .full .full) (.cutY 7744 .full .full)) (.cutX 22080 (.cutY 7872 .full (.cutX 22048 (.cutY 7904 .full .full) (.cutY 7904 .full .full))) (.cutY 7872 .full .full))) (.cutY 7808 .full .full)) .empty) .empty)))))) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 .empty (.cutX 25600 (.cutY 11264 (.cutX 25088 (.cutY 10752 (.cutX 24832 .empty (.cutY 10496 .empty (.cutX 24960 (.cutY 10624 .full (.cutX 24896 (.cutY 10688 .full (.cutX 24864 (.cutY 10720 .full .full) (.cutY 10720 .full .full))) (.cutY 10688 .full .full))) (.cutY 10624 .full (.cutX 25024 (.cutY 10688 .full .full) (.cutY 10688 .full .full)))))) .empty) .empty) .empty) .empty)) .empty) .empty) .empty))) .empty))

theorem metadata74 : 0<144359671 ∧ 30<128 ∧ 86<128 ∧ 1<4 ∧
    7186/4160=1 ∧ 7186%4160=3026 ∧ ∀ i, (leaves74 i).Valid 8 := by
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

noncomputable def phaseMass74 : ℝ := singlePhaseMass (144359671/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw74 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass74_eq : phaseMass74 = (144359671/1638400000000 : ℝ) := by
  unfold phaseMass74
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw74 output74 cover74 source74
    (gridTreeUnionCheck_sound 32768 raw74 output74 cover74 source74 tree74 checked74)
    _ (by norm_num) _, areaUnits74]
  norm_num

-- Frozen phase 5983, atom 1871, type 0, source (16,79).
def leavesData75 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves75 : Fin 7 → DyadicLeaf := leavesData75.get
def raw75 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 16 79 leaves75 i
def outputData75 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨4096,4224,20224,20352⟩) (.node (.single ⟨4096,4224,20352,20480⟩) (.single ⟨4224,4288,20224,20288⟩))) (.node (.node (.single ⟨4224,4288,20288,20352⟩) (.single ⟨4288,4352,20224,20288⟩)) (.node (.single ⟨4288,4352,20288,20352⟩) (.single ⟨4224,4352,20352,20480⟩)))) (.node (.node (.single ⟨12288,12416,28416,28544⟩) (.node (.single ⟨12288,12416,28544,28672⟩) (.single ⟨12416,12480,28416,28480⟩))) (.node (.node (.single ⟨12416,12480,28480,28544⟩) (.single ⟨12480,12544,28416,28480⟩)) (.node (.single ⟨12480,12544,28480,28544⟩) (.single ⟨12416,12544,28544,28672⟩))))) (.node (.node (.node (.single ⟨20224,20352,4096,4224⟩) (.node (.single ⟨20224,20288,4224,4288⟩) (.single ⟨20224,20288,4288,4352⟩))) (.node (.node (.single ⟨20288,20352,4224,4288⟩) (.single ⟨20288,20352,4288,4352⟩)) (.node (.single ⟨20352,20480,4096,4224⟩) (.single ⟨20352,20480,4224,4352⟩)))) (.node (.node (.single ⟨28416,28544,12288,12416⟩) (.node (.single ⟨28416,28480,12416,12480⟩) (.single ⟨28416,28480,12480,12544⟩))) (.node (.node (.single ⟨28480,28544,12416,12480⟩) (.single ⟨28480,28544,12480,12544⟩)) (.node (.single ⟨28544,28672,12288,12416⟩) (.single ⟨28544,28672,12416,12544⟩))))))
def output75 : Fin 28 → GridBox := outputData75.get
def coverData75 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData75 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover75 (i : Fin 28) : Fin 28 := ⟨coverData75.get i % 28, Nat.mod_lt _ (by decide)⟩
def source75 (i : Fin 28) : Fin 28 := ⟨sourceData75.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree75 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 .empty (.cutX 5120 (.cutY 19456 .empty (.cutX 4608 (.cutY 19968 .empty (.cutX 4352 (.cutY 20224 .empty (.cutX 4224 (.cutY 20352 .full .full) (.cutY 20352 (.cutX 4288 (.cutY 20288 .full .full) (.cutY 20288 .full .full)) .full))) .empty)) .empty)) .empty)) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 .empty (.cutX 13312 (.cutY 27648 .empty (.cutX 12800 (.cutY 28160 .empty (.cutX 12544 (.cutY 28416 .empty (.cutX 12416 (.cutY 28544 .full .full) (.cutY 28544 (.cutX 12480 (.cutY 28480 .full .full) (.cutY 28480 .full .full)) .full))) .empty)) .empty)) .empty)) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 (.cutX 19456 .empty (.cutY 5120 (.cutX 19968 .empty (.cutY 4608 (.cutX 20224 .empty (.cutY 4352 (.cutX 20352 (.cutY 4224 .full (.cutX 20288 (.cutY 4288 .full .full) (.cutY 4288 .full .full))) (.cutY 4224 .full .full)) .empty)) .empty)) .empty)) .empty))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 (.cutX 27648 .empty (.cutY 13312 (.cutX 28160 .empty (.cutY 12800 (.cutX 28416 .empty (.cutY 12544 (.cutX 28544 (.cutY 12416 .full (.cutX 28480 (.cutY 12480 .full .full) (.cutY 12480 .full .full))) (.cutY 12416 .full .full)) .empty)) .empty)) .empty)) .empty))) .empty))) .empty))

theorem metadata75 : 0<147396112 ∧ 16<128 ∧ 79<128 ∧ 0<4 ∧
    1871/4160=0 ∧ 1871%4160=1871 ∧ ∀ i, (leaves75 i).Valid 8 := by
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

noncomputable def phaseMass75 : ℝ := singlePhaseMass (147396112/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw75 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass75_eq : phaseMass75 = (9212257/102400000000 : ℝ) := by
  unfold phaseMass75
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw75 output75 cover75 source75
    (gridTreeUnionCheck_sound 32768 raw75 output75 cover75 source75 tree75 checked75)
    _ (by norm_num) _, areaUnits75]
  norm_num

-- Frozen phase 5984, atom 3288, type 0, source (34,92).
def leavesData76 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves76 : Fin 7 → DyadicLeaf := leavesData76.get
def raw76 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 34 92 leaves76 i
def outputData76 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨8704,8832,23552,23680⟩) (.node (.single ⟨8704,8832,23680,23808⟩) (.single ⟨8832,8896,23552,23616⟩))) (.node (.node (.single ⟨8832,8896,23616,23680⟩) (.single ⟨8896,8960,23552,23616⟩)) (.node (.single ⟨8896,8960,23616,23680⟩) (.single ⟨8832,8960,23680,23808⟩)))) (.node (.node (.single ⟨8960,9088,23808,23936⟩) (.node (.single ⟨8960,9088,23936,24064⟩) (.single ⟨9088,9152,23808,23872⟩))) (.node (.node (.single ⟨9088,9152,23872,23936⟩) (.single ⟨9152,9216,23808,23872⟩)) (.node (.single ⟨9152,9216,23872,23936⟩) (.single ⟨9088,9216,23936,24064⟩))))) (.node (.node (.node (.single ⟨23552,23680,8704,8832⟩) (.node (.single ⟨23552,23616,8832,8896⟩) (.single ⟨23552,23616,8896,8960⟩))) (.node (.node (.single ⟨23616,23680,8832,8896⟩) (.single ⟨23616,23680,8896,8960⟩)) (.node (.single ⟨23680,23808,8704,8832⟩) (.single ⟨23680,23808,8832,8960⟩)))) (.node (.node (.single ⟨23808,23936,8960,9088⟩) (.node (.single ⟨23808,23872,9088,9152⟩) (.single ⟨23808,23872,9152,9216⟩))) (.node (.node (.single ⟨23872,23936,9088,9152⟩) (.single ⟨23872,23936,9152,9216⟩)) (.node (.single ⟨23936,24064,8960,9088⟩) (.single ⟨23936,24064,9088,9216⟩))))))
def output76 : Fin 28 → GridBox := outputData76.get
def coverData76 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData76 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover76 (i : Fin 28) : Fin 28 := ⟨coverData76.get i % 28, Nat.mod_lt _ (by decide)⟩
def source76 (i : Fin 28) : Fin 28 := ⟨sourceData76.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree76 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 .empty (.cutX 9216 (.cutY 23552 .empty (.cutX 8704 .empty (.cutY 24064 (.cutX 8960 (.cutY 23808 (.cutX 8832 (.cutY 23680 .full .full) (.cutY 23680 (.cutX 8896 (.cutY 23616 .full .full) (.cutY 23616 .full .full)) .full)) .empty) (.cutY 23808 .empty (.cutX 9088 (.cutY 23936 .full .full) (.cutY 23936 (.cutX 9152 (.cutY 23872 .full .full) (.cutY 23872 .full .full)) .full)))) .empty))) .empty)) .empty)) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 .empty (.cutY 10240 (.cutX 23552 .empty (.cutY 9216 (.cutX 24064 (.cutY 8704 .empty (.cutX 23808 (.cutY 8960 (.cutX 23680 (.cutY 8832 .full (.cutX 23616 (.cutY 8896 .full .full) (.cutY 8896 .full .full))) (.cutY 8832 .full .full)) .empty) (.cutY 8960 .empty (.cutX 23936 (.cutY 9088 .full (.cutX 23872 (.cutY 9152 .full .full) (.cutY 9152 .full .full))) (.cutY 9088 .full .full))))) .empty) .empty)) .empty)) .empty))) .empty) .empty))

theorem metadata76 : 0<75538780 ∧ 34<128 ∧ 92<128 ∧ 0<4 ∧
    3288/4160=0 ∧ 3288%4160=3288 ∧ ∀ i, (leaves76 i).Valid 8 := by
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

noncomputable def phaseMass76 : ℝ := singlePhaseMass (75538780/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw76 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass76_eq : phaseMass76 = (3776939/81920000000 : ℝ) := by
  unfold phaseMass76
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw76 output76 cover76 source76
    (gridTreeUnionCheck_sound 32768 raw76 output76 cover76 source76 tree76 checked76)
    _ (by norm_num) _, areaUnits76]
  norm_num

-- Frozen phase 5985, atom 3226, type 0, source (33,91).
def leavesData77 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,0⟩))) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves77 : Fin 13 → DyadicLeaf := leavesData77.get
def raw77 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 33 91 leaves77 i
def outputData77 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨8448,8512,23296,23360⟩) (.node (.single ⟨8448,8512,23360,23424⟩) (.single ⟨8512,8576,23296,23360⟩))) (.node (.single ⟨8512,8576,23360,23424⟩) (.node (.single ⟨8448,8576,23424,23552⟩) (.single ⟨8576,8640,23296,23360⟩)))) (.node (.node (.single ⟨8576,8640,23360,23424⟩) (.node (.single ⟨8640,8672,23296,23328⟩) (.single ⟨8640,8672,23328,23360⟩))) (.node (.node (.single ⟨8672,8704,23296,23328⟩) (.single ⟨8672,8704,23328,23360⟩)) (.node (.single ⟨8640,8704,23360,23424⟩) (.single ⟨8576,8704,23424,23552⟩))))) (.node (.node (.node (.single ⟨9216,9344,24064,24192⟩) (.node (.single ⟨9216,9344,24192,24320⟩) (.single ⟨9344,9408,24064,24128⟩))) (.node (.single ⟨9344,9408,24128,24192⟩) (.node (.single ⟨9408,9440,24064,24096⟩) (.single ⟨9408,9440,24096,24128⟩)))) (.node (.node (.single ⟨9440,9472,24064,24096⟩) (.node (.single ⟨9440,9472,24096,24128⟩) (.single ⟨9408,9472,24128,24192⟩))) (.node (.node (.single ⟨9344,9408,24192,24256⟩) (.single ⟨9344,9408,24256,24320⟩)) (.node (.single ⟨9408,9472,24192,24256⟩) (.single ⟨9408,9472,24256,24320⟩)))))) (.node (.node (.node (.node (.single ⟨23296,23360,8448,8512⟩) (.node (.single ⟨23296,23360,8512,8576⟩) (.single ⟨23360,23424,8448,8512⟩))) (.node (.single ⟨23360,23424,8512,8576⟩) (.node (.single ⟨23296,23360,8576,8640⟩) (.single ⟨23296,23328,8640,8672⟩)))) (.node (.node (.single ⟨23296,23328,8672,8704⟩) (.node (.single ⟨23328,23360,8640,8672⟩) (.single ⟨23328,23360,8672,8704⟩))) (.node (.node (.single ⟨23360,23424,8576,8640⟩) (.single ⟨23360,23424,8640,8704⟩)) (.node (.single ⟨23424,23552,8448,8576⟩) (.single ⟨23424,23552,8576,8704⟩))))) (.node (.node (.node (.single ⟨24064,24192,9216,9344⟩) (.node (.single ⟨24064,24128,9344,9408⟩) (.single ⟨24064,24096,9408,9440⟩))) (.node (.single ⟨24064,24096,9440,9472⟩) (.node (.single ⟨24096,24128,9408,9440⟩) (.single ⟨24096,24128,9440,9472⟩)))) (.node (.node (.single ⟨24128,24192,9344,9408⟩) (.node (.single ⟨24128,24192,9408,9472⟩) (.single ⟨24192,24320,9216,9344⟩))) (.node (.node (.single ⟨24192,24256,9344,9408⟩) (.single ⟨24192,24256,9408,9472⟩)) (.node (.single ⟨24256,24320,9344,9408⟩) (.single ⟨24256,24320,9408,9472⟩)))))))
def output77 : Fin 52 → GridBox := outputData77.get
def coverData77 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 0))) (.node (.node (.single 26) (.single 51)) (.node (.single 25) (.single 1))))) (.node (.node (.node (.single 28) (.node (.single 50) (.single 23))) (.node (.single 2) (.node (.single 27) (.single 49)))) (.node (.node (.single 24) (.node (.single 3) (.single 29))) (.node (.node (.single 48) (.single 22)) (.node (.single 5) (.single 30)))))) (.node (.node (.node (.node (.single 46) (.node (.single 21) (.single 6))) (.node (.single 35) (.node (.single 45) (.single 16)))) (.node (.node (.single 11) (.node (.single 36) (.single 40))) (.node (.node (.single 15) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData77 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.single 20) (.node (.single 0) (.single 24)))) (.node (.node (.single 28) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 35))) (.node (.single 31) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.node (.single 17) (.single 13))) (.node (.single 21) (.node (.single 25) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 34) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 30) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover77 (i : Fin 52) : Fin 52 := ⟨coverData77.get i % 52, Nat.mod_lt _ (by decide)⟩
def source77 (i : Fin 52) : Fin 52 := ⟨sourceData77.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree77 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 .empty (.cutX 9216 (.cutY 23552 (.cutX 8704 (.cutY 23040 .empty (.cutX 8448 .empty (.cutY 23296 .empty (.cutX 8576 (.cutY 23424 (.cutX 8512 (.cutY 23360 .full .full) (.cutY 23360 .full .full)) .full) (.cutY 23424 (.cutX 8640 (.cutY 23360 .full .full) (.cutY 23360 (.cutX 8672 (.cutY 23328 .full .full) (.cutY 23328 .full .full)) .full)) .full))))) .empty) .empty) (.cutY 23552 .empty (.cutX 9728 (.cutY 24064 .empty (.cutX 9472 (.cutY 24320 (.cutX 9344 (.cutY 24192 .full .full) (.cutY 24192 (.cutX 9408 (.cutY 24128 .full .full) (.cutY 24128 (.cutX 9440 (.cutY 24096 .full .full) (.cutY 24096 .full .full)) .full)) (.cutX 9408 (.cutY 24256 .full .full) (.cutY 24256 .full .full)))) .empty) .empty)) .empty)))) .empty)) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 .empty (.cutY 10240 (.cutX 23552 (.cutY 9216 (.cutX 23040 .empty (.cutY 8704 (.cutX 23296 .empty (.cutY 8448 .empty (.cutX 23424 (.cutY 8576 (.cutX 23360 (.cutY 8512 .full .full) (.cutY 8512 .full .full)) (.cutX 23360 (.cutY 8640 .full (.cutX 23328 (.cutY 8672 .full .full) (.cutY 8672 .full .full))) (.cutY 8640 .full .full))) (.cutY 8576 .full .full)))) .empty)) .empty) (.cutY 9216 .empty (.cutX 24064 .empty (.cutY 9728 (.cutX 24320 (.cutY 9472 (.cutX 24192 (.cutY 9344 .full (.cutX 24128 (.cutY 9408 .full (.cutX 24096 (.cutY 9440 .full .full) (.cutY 9440 .full .full))) (.cutY 9408 .full .full))) (.cutY 9344 .full (.cutX 24256 (.cutY 9408 .full .full) (.cutY 9408 .full .full)))) .empty) .empty) .empty)))) .empty)) .empty))) .empty) .empty))

theorem metadata77 : 0<75538780 ∧ 33<128 ∧ 91<128 ∧ 0<4 ∧
    3226/4160=0 ∧ 3226%4160=3226 ∧ ∀ i, (leaves77 i).Valid 8 := by
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

noncomputable def phaseMass77 : ℝ := singlePhaseMass (75538780/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw77 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass77_eq : phaseMass77 = (3776939/81920000000 : ℝ) := by
  unfold phaseMass77
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw77 output77 cover77 source77
    (gridTreeUnionCheck_sound 32768 raw77 output77 cover77 source77 tree77 checked77)
    _ (by norm_num) _, areaUnits77]
  norm_num

-- Frozen phase 5986, atom 3029, type 0, source (30,89).
def leavesData78 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,0⟩))) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves78 : Fin 13 → DyadicLeaf := leavesData78.get
def raw78 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 30 89 leaves78 i
def outputData78 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨7680,7744,22784,22848⟩) (.node (.single ⟨7680,7744,22848,22912⟩) (.single ⟨7744,7808,22784,22848⟩))) (.node (.single ⟨7744,7808,22848,22912⟩) (.node (.single ⟨7680,7808,22912,23040⟩) (.single ⟨7808,7872,22784,22848⟩)))) (.node (.node (.single ⟨7808,7872,22848,22912⟩) (.node (.single ⟨7872,7904,22784,22816⟩) (.single ⟨7872,7904,22816,22848⟩))) (.node (.node (.single ⟨7904,7936,22784,22816⟩) (.single ⟨7904,7936,22816,22848⟩)) (.node (.single ⟨7872,7936,22848,22912⟩) (.single ⟨7808,7936,22912,23040⟩))))) (.node (.node (.node (.single ⟨9728,9856,24832,24960⟩) (.node (.single ⟨9728,9856,24960,25088⟩) (.single ⟨9856,9920,24832,24896⟩))) (.node (.single ⟨9856,9920,24896,24960⟩) (.node (.single ⟨9920,9952,24832,24864⟩) (.single ⟨9920,9952,24864,24896⟩)))) (.node (.node (.single ⟨9952,9984,24832,24864⟩) (.node (.single ⟨9952,9984,24864,24896⟩) (.single ⟨9920,9984,24896,24960⟩))) (.node (.node (.single ⟨9856,9920,24960,25024⟩) (.single ⟨9856,9920,25024,25088⟩)) (.node (.single ⟨9920,9984,24960,25024⟩) (.single ⟨9920,9984,25024,25088⟩)))))) (.node (.node (.node (.node (.single ⟨22784,22848,7680,7744⟩) (.node (.single ⟨22784,22848,7744,7808⟩) (.single ⟨22848,22912,7680,7744⟩))) (.node (.single ⟨22848,22912,7744,7808⟩) (.node (.single ⟨22784,22848,7808,7872⟩) (.single ⟨22784,22816,7872,7904⟩)))) (.node (.node (.single ⟨22784,22816,7904,7936⟩) (.node (.single ⟨22816,22848,7872,7904⟩) (.single ⟨22816,22848,7904,7936⟩))) (.node (.node (.single ⟨22848,22912,7808,7872⟩) (.single ⟨22848,22912,7872,7936⟩)) (.node (.single ⟨22912,23040,7680,7808⟩) (.single ⟨22912,23040,7808,7936⟩))))) (.node (.node (.node (.single ⟨24832,24960,9728,9856⟩) (.node (.single ⟨24832,24896,9856,9920⟩) (.single ⟨24832,24864,9920,9952⟩))) (.node (.single ⟨24832,24864,9952,9984⟩) (.node (.single ⟨24864,24896,9920,9952⟩) (.single ⟨24864,24896,9952,9984⟩)))) (.node (.node (.single ⟨24896,24960,9856,9920⟩) (.node (.single ⟨24896,24960,9920,9984⟩) (.single ⟨24960,25088,9728,9856⟩))) (.node (.node (.single ⟨24960,25024,9856,9920⟩) (.single ⟨24960,25024,9920,9984⟩)) (.node (.single ⟨25024,25088,9856,9920⟩) (.single ⟨25024,25088,9920,9984⟩)))))))
def output78 : Fin 52 → GridBox := outputData78.get
def coverData78 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 0))) (.node (.node (.single 26) (.single 51)) (.node (.single 25) (.single 1))))) (.node (.node (.node (.single 28) (.node (.single 50) (.single 23))) (.node (.single 2) (.node (.single 27) (.single 49)))) (.node (.node (.single 24) (.node (.single 3) (.single 29))) (.node (.node (.single 48) (.single 22)) (.node (.single 5) (.single 30)))))) (.node (.node (.node (.node (.single 46) (.node (.single 21) (.single 6))) (.node (.single 35) (.node (.single 45) (.single 16)))) (.node (.node (.single 11) (.node (.single 36) (.single 40))) (.node (.node (.single 15) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData78 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.single 20) (.node (.single 0) (.single 24)))) (.node (.node (.single 28) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 35))) (.node (.single 31) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.node (.single 17) (.single 13))) (.node (.single 21) (.node (.single 25) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 34) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 30) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover78 (i : Fin 52) : Fin 52 := ⟨coverData78.get i % 52, Nat.mod_lt _ (by decide)⟩
def source78 (i : Fin 52) : Fin 52 := ⟨sourceData78.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree78 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 .empty (.cutX 7168 .empty (.cutY 23552 (.cutX 7680 .empty (.cutY 23040 (.cutX 7936 (.cutY 22784 .empty (.cutX 7808 (.cutY 22912 (.cutX 7744 (.cutY 22848 .full .full) (.cutY 22848 .full .full)) .full) (.cutY 22912 (.cutX 7872 (.cutY 22848 .full .full) (.cutY 22848 (.cutX 7904 (.cutY 22816 .full .full) (.cutY 22816 .full .full)) .full)) .full))) .empty) .empty)) .empty)))))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 (.cutX 9216 .empty (.cutY 25600 (.cutX 9728 .empty (.cutY 25088 (.cutX 9984 (.cutY 24832 .empty (.cutX 9856 (.cutY 24960 .full .full) (.cutY 24960 (.cutX 9920 (.cutY 24896 .full .full) (.cutY 24896 (.cutX 9952 (.cutY 24864 .full .full) (.cutY 24864 .full .full)) .full)) (.cutX 9920 (.cutY 25024 .full .full) (.cutY 25024 .full .full))))) .empty) .empty)) .empty)) .empty) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 .empty (.cutX 23552 (.cutY 7168 .empty (.cutX 23040 (.cutY 7680 .empty (.cutX 22784 .empty (.cutY 7936 (.cutX 22912 (.cutY 7808 (.cutX 22848 (.cutY 7744 .full .full) (.cutY 7744 .full .full)) (.cutX 22848 (.cutY 7872 .full (.cutX 22816 (.cutY 7904 .full .full) (.cutY 7904 .full .full))) (.cutY 7872 .full .full))) (.cutY 7808 .full .full)) .empty))) .empty)) .empty))))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 (.cutX 25600 (.cutY 9216 .empty (.cutX 25088 (.cutY 9728 .empty (.cutX 24832 .empty (.cutY 9984 (.cutX 24960 (.cutY 9856 .full (.cutX 24896 (.cutY 9920 .full (.cutX 24864 (.cutY 9952 .full .full) (.cutY 9952 .full .full))) (.cutY 9920 .full .full))) (.cutY 9856 .full (.cutX 25024 (.cutY 9920 .full .full) (.cutY 9920 .full .full)))) .empty))) .empty)) .empty) .empty) .empty) .empty) .empty))) .empty))

theorem metadata78 : 0<145899414 ∧ 30<128 ∧ 89<128 ∧ 0<4 ∧
    3029/4160=0 ∧ 3029%4160=3029 ∧ ∀ i, (leaves78 i).Valid 8 := by
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

noncomputable def phaseMass78 : ℝ := singlePhaseMass (145899414/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw78 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass78_eq : phaseMass78 = (72949707/819200000000 : ℝ) := by
  unfold phaseMass78
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw78 output78 cover78 source78
    (gridTreeUnionCheck_sound 32768 raw78 output78 cover78 source78 tree78 checked78)
    _ (by norm_num) _, areaUnits78]
  norm_num

-- Frozen phase 5987, atom 3097, type 0, source (31,90).
def leavesData79 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves79 : Fin 7 → DyadicLeaf := leavesData79.get
def raw79 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 31 90 leaves79 i
def outputData79 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨7936,8064,23040,23168⟩) (.node (.single ⟨7936,8064,23168,23296⟩) (.single ⟨8064,8128,23040,23104⟩))) (.node (.node (.single ⟨8064,8128,23104,23168⟩) (.single ⟨8128,8192,23040,23104⟩)) (.node (.single ⟨8128,8192,23104,23168⟩) (.single ⟨8064,8192,23168,23296⟩)))) (.node (.node (.single ⟨9472,9600,24576,24704⟩) (.node (.single ⟨9472,9600,24704,24832⟩) (.single ⟨9600,9664,24576,24640⟩))) (.node (.node (.single ⟨9600,9664,24640,24704⟩) (.single ⟨9664,9728,24576,24640⟩)) (.node (.single ⟨9664,9728,24640,24704⟩) (.single ⟨9600,9728,24704,24832⟩))))) (.node (.node (.node (.single ⟨23040,23168,7936,8064⟩) (.node (.single ⟨23040,23104,8064,8128⟩) (.single ⟨23040,23104,8128,8192⟩))) (.node (.node (.single ⟨23104,23168,8064,8128⟩) (.single ⟨23104,23168,8128,8192⟩)) (.node (.single ⟨23168,23296,7936,8064⟩) (.single ⟨23168,23296,8064,8192⟩)))) (.node (.node (.single ⟨24576,24704,9472,9600⟩) (.node (.single ⟨24576,24640,9600,9664⟩) (.single ⟨24576,24640,9664,9728⟩))) (.node (.node (.single ⟨24640,24704,9600,9664⟩) (.single ⟨24640,24704,9664,9728⟩)) (.node (.single ⟨24704,24832,9472,9600⟩) (.single ⟨24704,24832,9600,9728⟩))))))
def output79 : Fin 28 → GridBox := outputData79.get
def coverData79 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData79 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover79 (i : Fin 28) : Fin 28 := ⟨coverData79.get i % 28, Nat.mod_lt _ (by decide)⟩
def source79 (i : Fin 28) : Fin 28 := ⟨sourceData79.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree79 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 .empty (.cutX 7168 .empty (.cutY 23552 (.cutX 7680 .empty (.cutY 23040 .empty (.cutX 7936 .empty (.cutY 23296 (.cutX 8064 (.cutY 23168 .full .full) (.cutY 23168 (.cutX 8128 (.cutY 23104 .full .full) (.cutY 23104 .full .full)) .full)) .empty)))) .empty)))))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 (.cutX 9216 .empty (.cutY 25600 (.cutX 9728 (.cutY 25088 (.cutX 9472 .empty (.cutY 24832 (.cutX 9600 (.cutY 24704 .full .full) (.cutY 24704 (.cutX 9664 (.cutY 24640 .full .full) (.cutY 24640 .full .full)) .full)) .empty)) .empty) .empty) .empty)) .empty) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 .empty (.cutX 23552 (.cutY 7168 .empty (.cutX 23040 .empty (.cutY 7680 .empty (.cutX 23296 (.cutY 7936 .empty (.cutX 23168 (.cutY 8064 .full (.cutX 23104 (.cutY 8128 .full .full) (.cutY 8128 .full .full))) (.cutY 8064 .full .full))) .empty)))) .empty))))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 (.cutX 25600 (.cutY 9216 .empty (.cutX 25088 (.cutY 9728 (.cutX 24832 (.cutY 9472 .empty (.cutX 24704 (.cutY 9600 .full (.cutX 24640 (.cutY 9664 .full .full) (.cutY 9664 .full .full))) (.cutY 9600 .full .full))) .empty) .empty) .empty)) .empty) .empty) .empty) .empty) .empty))) .empty))

theorem metadata79 : 0<145899414 ∧ 31<128 ∧ 90<128 ∧ 0<4 ∧
    3097/4160=0 ∧ 3097%4160=3097 ∧ ∀ i, (leaves79 i).Valid 8 := by
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

noncomputable def phaseMass79 : ℝ := singlePhaseMass (145899414/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw79 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass79_eq : phaseMass79 = (72949707/819200000000 : ℝ) := by
  unfold phaseMass79
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw79 output79 cover79 source79
    (gridTreeUnionCheck_sound 32768 raw79 output79 cover79 source79 tree79 checked79)
    _ (by norm_num) _, areaUnits79]
  norm_num

-- Frozen phase 5988, atom 6895, type 1, source (26,83).
def leavesData80 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves80 : Fin 13 → DyadicLeaf := leavesData80.get
def raw80 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 26 83 leaves80 i
def outputData80 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨6656,6720,21248,21312⟩) (.node (.single ⟨6656,6720,21312,21376⟩) (.single ⟨6720,6784,21248,21312⟩))) (.node (.single ⟨6720,6784,21312,21376⟩) (.node (.single ⟨6656,6784,21376,21504⟩) (.single ⟨6784,6848,21248,21312⟩)))) (.node (.node (.single ⟨6784,6848,21312,21376⟩) (.node (.single ⟨6848,6880,21248,21280⟩) (.single ⟨6848,6880,21280,21312⟩))) (.node (.node (.single ⟨6880,6912,21248,21280⟩) (.single ⟨6880,6912,21280,21312⟩)) (.node (.single ⟨6848,6912,21312,21376⟩) (.single ⟨6784,6912,21376,21504⟩))))) (.node (.node (.node (.single ⟨11264,11392,25856,25984⟩) (.node (.single ⟨11264,11392,25984,26112⟩) (.single ⟨11392,11456,25856,25920⟩))) (.node (.single ⟨11392,11456,25920,25984⟩) (.node (.single ⟨11456,11488,25856,25888⟩) (.single ⟨11456,11488,25888,25920⟩)))) (.node (.node (.single ⟨11488,11520,25856,25888⟩) (.node (.single ⟨11488,11520,25888,25920⟩) (.single ⟨11456,11520,25920,25984⟩))) (.node (.node (.single ⟨11392,11456,25984,26048⟩) (.single ⟨11392,11456,26048,26112⟩)) (.node (.single ⟨11456,11520,25984,26048⟩) (.single ⟨11456,11520,26048,26112⟩)))))) (.node (.node (.node (.node (.single ⟨21248,21312,6656,6720⟩) (.node (.single ⟨21248,21312,6720,6784⟩) (.single ⟨21312,21376,6656,6720⟩))) (.node (.single ⟨21312,21376,6720,6784⟩) (.node (.single ⟨21248,21312,6784,6848⟩) (.single ⟨21248,21280,6848,6880⟩)))) (.node (.node (.single ⟨21248,21280,6880,6912⟩) (.node (.single ⟨21280,21312,6848,6880⟩) (.single ⟨21280,21312,6880,6912⟩))) (.node (.node (.single ⟨21312,21376,6784,6848⟩) (.single ⟨21312,21376,6848,6912⟩)) (.node (.single ⟨21376,21504,6656,6784⟩) (.single ⟨21376,21504,6784,6912⟩))))) (.node (.node (.node (.single ⟨25856,25984,11264,11392⟩) (.node (.single ⟨25856,25920,11392,11456⟩) (.single ⟨25856,25888,11456,11488⟩))) (.node (.single ⟨25856,25888,11488,11520⟩) (.node (.single ⟨25888,25920,11456,11488⟩) (.single ⟨25888,25920,11488,11520⟩)))) (.node (.node (.single ⟨25920,25984,11392,11456⟩) (.node (.single ⟨25920,25984,11456,11520⟩) (.single ⟨25984,26112,11264,11392⟩))) (.node (.node (.single ⟨25984,26048,11392,11456⟩) (.single ⟨25984,26048,11456,11520⟩)) (.node (.single ⟨26048,26112,11392,11456⟩) (.single ⟨26048,26112,11456,11520⟩)))))))
def output80 : Fin 52 → GridBox := outputData80.get
def coverData80 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData80 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover80 (i : Fin 52) : Fin 52 := ⟨coverData80.get i % 52, Nat.mod_lt _ (by decide)⟩
def source80 (i : Fin 52) : Fin 52 := ⟨sourceData80.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree80 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 (.cutX 7168 (.cutY 21504 (.cutX 6656 .empty (.cutY 20992 .empty (.cutX 6912 (.cutY 21248 .empty (.cutX 6784 (.cutY 21376 (.cutX 6720 (.cutY 21312 .full .full) (.cutY 21312 .full .full)) .full) (.cutY 21376 (.cutX 6848 (.cutY 21312 .full .full) (.cutY 21312 (.cutX 6880 (.cutY 21280 .full .full) (.cutY 21280 .full .full)) .full)) .full))) .empty))) .empty) .empty) .empty)))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 (.cutX 11264 .empty (.cutY 25600 .empty (.cutX 11776 (.cutY 26112 (.cutX 11520 (.cutY 25856 .empty (.cutX 11392 (.cutY 25984 .full .full) (.cutY 25984 (.cutX 11456 (.cutY 25920 .full .full) (.cutY 25920 (.cutX 11488 (.cutY 25888 .full .full) (.cutY 25888 .full .full)) .full)) (.cutX 11456 (.cutY 26048 .full .full) (.cutY 26048 .full .full))))) .empty) .empty) .empty))) .empty)) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 .empty (.cutX 21504 (.cutY 7168 (.cutX 20992 .empty (.cutY 6656 .empty (.cutX 21248 .empty (.cutY 6912 (.cutX 21376 (.cutY 6784 (.cutX 21312 (.cutY 6720 .full .full) (.cutY 6720 .full .full)) (.cutX 21312 (.cutY 6848 .full (.cutX 21280 (.cutY 6880 .full .full) (.cutY 6880 .full .full))) (.cutY 6848 .full .full))) (.cutY 6784 .full .full)) .empty)))) .empty) .empty)) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 .empty (.cutX 25600 .empty (.cutY 11264 .empty (.cutX 26112 (.cutY 11776 (.cutX 25856 .empty (.cutY 11520 (.cutX 25984 (.cutY 11392 .full (.cutX 25920 (.cutY 11456 .full (.cutX 25888 (.cutY 11488 .full .full) (.cutY 11488 .full .full))) (.cutY 11456 .full .full))) (.cutY 11392 .full (.cutX 26048 (.cutY 11456 .full .full) (.cutY 11456 .full .full)))) .empty)) .empty) .empty)))) .empty) .empty) .empty))) .empty))

theorem metadata80 : 0<144359671 ∧ 26<128 ∧ 83<128 ∧ 1<4 ∧
    6895/4160=1 ∧ 6895%4160=2735 ∧ ∀ i, (leaves80 i).Valid 8 := by
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

noncomputable def phaseMass80 : ℝ := singlePhaseMass (144359671/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw80 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass80_eq : phaseMass80 = (144359671/1638400000000 : ℝ) := by
  unfold phaseMass80
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw80 output80 cover80 source80
    (gridTreeUnionCheck_sound 32768 raw80 output80 cover80 source80 tree80 checked80)
    _ (by norm_num) _, areaUnits80]
  norm_num

-- Frozen phase 5989, atom 4355, type 1, source (1,68).
def leavesData81 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves81 : Fin 10 → DyadicLeaf := leavesData81.get
def raw81 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 1 68 leaves81 i
def outputData81 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨256,320,17408,17472⟩) (.single ⟨256,320,17472,17536⟩)) (.node (.single ⟨320,384,17408,17472⟩) (.node (.single ⟨320,384,17472,17536⟩) (.single ⟨256,384,17536,17664⟩)))) (.node (.node (.single ⟨384,448,17408,17472⟩) (.single ⟨384,448,17472,17536⟩)) (.node (.single ⟨448,512,17408,17472⟩) (.node (.single ⟨448,512,17472,17536⟩) (.single ⟨384,512,17536,17664⟩))))) (.node (.node (.node (.single ⟨15104,15232,32256,32384⟩) (.single ⟨15104,15232,32384,32512⟩)) (.node (.single ⟨15232,15296,32256,32320⟩) (.node (.single ⟨15232,15296,32320,32384⟩) (.single ⟨15296,15360,32256,32320⟩)))) (.node (.node (.single ⟨15296,15360,32320,32384⟩) (.single ⟨15232,15296,32384,32448⟩)) (.node (.single ⟨15232,15296,32448,32512⟩) (.node (.single ⟨15296,15360,32384,32448⟩) (.single ⟨15296,15360,32448,32512⟩)))))) (.node (.node (.node (.node (.single ⟨17408,17472,256,320⟩) (.single ⟨17408,17472,320,384⟩)) (.node (.single ⟨17472,17536,256,320⟩) (.node (.single ⟨17472,17536,320,384⟩) (.single ⟨17408,17472,384,448⟩)))) (.node (.node (.single ⟨17408,17472,448,512⟩) (.single ⟨17472,17536,384,448⟩)) (.node (.single ⟨17472,17536,448,512⟩) (.node (.single ⟨17536,17664,256,384⟩) (.single ⟨17536,17664,384,512⟩))))) (.node (.node (.node (.single ⟨32256,32384,15104,15232⟩) (.single ⟨32256,32320,15232,15296⟩)) (.node (.single ⟨32256,32320,15296,15360⟩) (.node (.single ⟨32320,32384,15232,15296⟩) (.single ⟨32320,32384,15296,15360⟩)))) (.node (.node (.single ⟨32384,32512,15104,15232⟩) (.single ⟨32384,32448,15232,15296⟩)) (.node (.single ⟨32384,32448,15296,15360⟩) (.node (.single ⟨32448,32512,15232,15296⟩) (.single ⟨32448,32512,15296,15360⟩)))))))
def output81 : Fin 40 → GridBox := outputData81.get
def coverData81 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData81 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover81 (i : Fin 40) : Fin 40 := ⟨coverData81.get i % 40, Nat.mod_lt _ (by decide)⟩
def source81 (i : Fin 40) : Fin 40 := ⟨sourceData81.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree81 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 (.cutX 1024 (.cutY 17408 .empty (.cutX 512 (.cutY 17920 (.cutX 256 .empty (.cutY 17664 (.cutX 384 (.cutY 17536 (.cutX 320 (.cutY 17472 .full .full) (.cutY 17472 .full .full)) .full) (.cutY 17536 (.cutX 448 (.cutY 17472 .full .full) (.cutY 17472 .full .full)) .full)) .empty)) .empty) .empty)) .empty) .empty) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 .empty (.cutX 15360 (.cutY 31744 .empty (.cutX 14848 .empty (.cutY 32256 .empty (.cutX 15104 .empty (.cutY 32512 (.cutX 15232 (.cutY 32384 .full .full) (.cutY 32384 (.cutX 15296 (.cutY 32320 .full .full) (.cutY 32320 .full .full)) (.cutX 15296 (.cutY 32448 .full .full) (.cutY 32448 .full .full)))) .empty))))) .empty)))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 (.cutX 17408 .empty (.cutY 1024 (.cutX 17920 (.cutY 512 (.cutX 17664 (.cutY 256 .empty (.cutX 17536 (.cutY 384 (.cutX 17472 (.cutY 320 .full .full) (.cutY 320 .full .full)) (.cutX 17472 (.cutY 448 .full .full) (.cutY 448 .full .full))) (.cutY 384 .full .full))) .empty) .empty) .empty) .empty)) .empty) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 .empty (.cutX 31744 .empty (.cutY 15360 (.cutX 32256 .empty (.cutY 14848 .empty (.cutX 32512 (.cutY 15104 .empty (.cutX 32384 (.cutY 15232 .full (.cutX 32320 (.cutY 15296 .full .full) (.cutY 15296 .full .full))) (.cutY 15232 .full (.cutX 32448 (.cutY 15296 .full .full) (.cutY 15296 .full .full))))) .empty))) .empty)))))))) .empty))

theorem metadata81 : 0<202148459 ∧ 1<128 ∧ 68<128 ∧ 1<4 ∧
    4355/4160=1 ∧ 4355%4160=195 ∧ ∀ i, (leaves81 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData81).mp
    (by decide +kernel)

theorem sourceChecked81_0 : ∀ i : Fin 40,
    (fun i => output81 i = raw81 (source81 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked81 : ∀ i : Fin 40, (fun i => output81 i = raw81 (source81 i)) i :=
  forallFin_of_zero_offset (fun i => output81 i = raw81 (source81 i)) sourceChecked81_0

theorem coverChecked81_0 : ∀ i : Fin 40,
    (fun i => (output81 (cover81 i)).ContainsBox (raw81 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked81 : ∀ i : Fin 40, (fun i => (output81 (cover81 i)).ContainsBox (raw81 i)) i :=
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

noncomputable def phaseMass81 : ℝ := singlePhaseMass (202148459/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw81 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass81_eq : phaseMass81 = (202148459/1638400000000 : ℝ) := by
  unfold phaseMass81
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw81 output81 cover81 source81
    (gridTreeUnionCheck_sound 32768 raw81 output81 cover81 source81 tree81 checked81)
    _ (by norm_num) _, areaUnits81]
  norm_num

-- Frozen phase 5990, atom 1967, type 0, source (17,80).
def leavesData82 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves82 : Fin 13 → DyadicLeaf := leavesData82.get
def raw82 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 17 80 leaves82 i
def outputData82 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨4352,4416,20480,20544⟩) (.node (.single ⟨4352,4416,20544,20608⟩) (.single ⟨4416,4480,20480,20544⟩))) (.node (.single ⟨4416,4480,20544,20608⟩) (.node (.single ⟨4352,4480,20608,20736⟩) (.single ⟨4480,4544,20480,20544⟩)))) (.node (.node (.single ⟨4480,4544,20544,20608⟩) (.node (.single ⟨4544,4576,20480,20512⟩) (.single ⟨4544,4576,20512,20544⟩))) (.node (.node (.single ⟨4576,4608,20480,20512⟩) (.single ⟨4576,4608,20512,20544⟩)) (.node (.single ⟨4544,4608,20544,20608⟩) (.single ⟨4480,4608,20608,20736⟩))))) (.node (.node (.node (.single ⟨12032,12160,28160,28288⟩) (.node (.single ⟨12032,12160,28288,28416⟩) (.single ⟨12160,12224,28160,28224⟩))) (.node (.single ⟨12160,12224,28224,28288⟩) (.node (.single ⟨12224,12256,28160,28192⟩) (.single ⟨12224,12256,28192,28224⟩)))) (.node (.node (.single ⟨12256,12288,28160,28192⟩) (.node (.single ⟨12256,12288,28192,28224⟩) (.single ⟨12224,12288,28224,28288⟩))) (.node (.node (.single ⟨12160,12224,28288,28352⟩) (.single ⟨12160,12224,28352,28416⟩)) (.node (.single ⟨12224,12288,28288,28352⟩) (.single ⟨12224,12288,28352,28416⟩)))))) (.node (.node (.node (.node (.single ⟨20480,20544,4352,4416⟩) (.node (.single ⟨20480,20544,4416,4480⟩) (.single ⟨20544,20608,4352,4416⟩))) (.node (.single ⟨20544,20608,4416,4480⟩) (.node (.single ⟨20480,20544,4480,4544⟩) (.single ⟨20480,20512,4544,4576⟩)))) (.node (.node (.single ⟨20480,20512,4576,4608⟩) (.node (.single ⟨20512,20544,4544,4576⟩) (.single ⟨20512,20544,4576,4608⟩))) (.node (.node (.single ⟨20544,20608,4480,4544⟩) (.single ⟨20544,20608,4544,4608⟩)) (.node (.single ⟨20608,20736,4352,4480⟩) (.single ⟨20608,20736,4480,4608⟩))))) (.node (.node (.node (.single ⟨28160,28288,12032,12160⟩) (.node (.single ⟨28160,28224,12160,12224⟩) (.single ⟨28160,28192,12224,12256⟩))) (.node (.single ⟨28160,28192,12256,12288⟩) (.node (.single ⟨28192,28224,12224,12256⟩) (.single ⟨28192,28224,12256,12288⟩)))) (.node (.node (.single ⟨28224,28288,12160,12224⟩) (.node (.single ⟨28224,28288,12224,12288⟩) (.single ⟨28288,28416,12032,12160⟩))) (.node (.node (.single ⟨28288,28352,12160,12224⟩) (.single ⟨28288,28352,12224,12288⟩)) (.node (.single ⟨28352,28416,12160,12224⟩) (.single ⟨28352,28416,12224,12288⟩)))))))
def output82 : Fin 52 → GridBox := outputData82.get
def coverData82 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData82 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover82 (i : Fin 52) : Fin 52 := ⟨coverData82.get i % 52, Nat.mod_lt _ (by decide)⟩
def source82 (i : Fin 52) : Fin 52 := ⟨sourceData82.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree82 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 (.cutY 21504 (.cutX 4608 (.cutY 20992 (.cutX 4352 .empty (.cutY 20736 (.cutX 4480 (.cutY 20608 (.cutX 4416 (.cutY 20544 .full .full) (.cutY 20544 .full .full)) .full) (.cutY 20608 (.cutX 4544 (.cutY 20544 .full .full) (.cutY 20544 (.cutX 4576 (.cutY 20512 .full .full) (.cutY 20512 .full .full)) .full)) .full)) .empty)) .empty) .empty) .empty) .empty) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 .empty (.cutY 27648 .empty (.cutX 11776 .empty (.cutY 28160 .empty (.cutX 12032 .empty (.cutY 28416 (.cutX 12160 (.cutY 28288 .full .full) (.cutY 28288 (.cutX 12224 (.cutY 28224 .full .full) (.cutY 28224 (.cutX 12256 (.cutY 28192 .full .full) (.cutY 28192 .full .full)) .full)) (.cutX 12224 (.cutY 28352 .full .full) (.cutY 28352 .full .full)))) .empty)))))))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 (.cutY 5120 (.cutX 20992 (.cutY 4608 (.cutX 20736 (.cutY 4352 .empty (.cutX 20608 (.cutY 4480 (.cutX 20544 (.cutY 4416 .full .full) (.cutY 4416 .full .full)) (.cutX 20544 (.cutY 4544 .full (.cutX 20512 (.cutY 4576 .full .full) (.cutY 4576 .full .full))) (.cutY 4544 .full .full))) (.cutY 4480 .full .full))) .empty) .empty) .empty) .empty) .empty) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 .empty (.cutY 11264 .empty (.cutX 28160 .empty (.cutY 11776 .empty (.cutX 28416 (.cutY 12032 .empty (.cutX 28288 (.cutY 12160 .full (.cutX 28224 (.cutY 12224 .full (.cutX 28192 (.cutY 12256 .full .full) (.cutY 12256 .full .full))) (.cutY 12224 .full .full))) (.cutY 12160 .full (.cutX 28352 (.cutY 12224 .full .full) (.cutY 12224 .full .full))))) .empty))))))) .empty) .empty))) .empty))

theorem metadata82 : 0<152546139 ∧ 17<128 ∧ 80<128 ∧ 0<4 ∧
    1967/4160=0 ∧ 1967%4160=1967 ∧ ∀ i, (leaves82 i).Valid 8 := by
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

noncomputable def phaseMass82 : ℝ := singlePhaseMass (152546139/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw82 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass82_eq : phaseMass82 = (152546139/1638400000000 : ℝ) := by
  unfold phaseMass82
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw82 output82 cover82 source82
    (gridTreeUnionCheck_sound 32768 raw82 output82 cover82 source82 tree82 checked82)
    _ (by norm_num) _, areaUnits82]
  norm_num

-- Frozen phase 5991, atom 6399, type 1, source (20,79).
def leavesData83 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves83 : Fin 13 → DyadicLeaf := leavesData83.get
def raw83 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 20 79 leaves83 i
def outputData83 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨5120,5184,20224,20288⟩) (.node (.single ⟨5120,5184,20288,20352⟩) (.single ⟨5184,5248,20224,20288⟩))) (.node (.single ⟨5184,5248,20288,20352⟩) (.node (.single ⟨5120,5248,20352,20480⟩) (.single ⟨5248,5312,20224,20288⟩)))) (.node (.node (.single ⟨5248,5312,20288,20352⟩) (.node (.single ⟨5312,5344,20224,20256⟩) (.single ⟨5312,5344,20256,20288⟩))) (.node (.node (.single ⟨5344,5376,20224,20256⟩) (.single ⟨5344,5376,20256,20288⟩)) (.node (.single ⟨5312,5376,20288,20352⟩) (.single ⟨5248,5376,20352,20480⟩))))) (.node (.node (.node (.single ⟨12288,12416,27392,27520⟩) (.node (.single ⟨12288,12416,27520,27648⟩) (.single ⟨12416,12480,27392,27456⟩))) (.node (.single ⟨12416,12480,27456,27520⟩) (.node (.single ⟨12480,12512,27392,27424⟩) (.single ⟨12480,12512,27424,27456⟩)))) (.node (.node (.single ⟨12512,12544,27392,27424⟩) (.node (.single ⟨12512,12544,27424,27456⟩) (.single ⟨12480,12544,27456,27520⟩))) (.node (.node (.single ⟨12416,12480,27520,27584⟩) (.single ⟨12416,12480,27584,27648⟩)) (.node (.single ⟨12480,12544,27520,27584⟩) (.single ⟨12480,12544,27584,27648⟩)))))) (.node (.node (.node (.node (.single ⟨20224,20288,5120,5184⟩) (.node (.single ⟨20224,20288,5184,5248⟩) (.single ⟨20288,20352,5120,5184⟩))) (.node (.single ⟨20288,20352,5184,5248⟩) (.node (.single ⟨20224,20288,5248,5312⟩) (.single ⟨20224,20256,5312,5344⟩)))) (.node (.node (.single ⟨20224,20256,5344,5376⟩) (.node (.single ⟨20256,20288,5312,5344⟩) (.single ⟨20256,20288,5344,5376⟩))) (.node (.node (.single ⟨20288,20352,5248,5312⟩) (.single ⟨20288,20352,5312,5376⟩)) (.node (.single ⟨20352,20480,5120,5248⟩) (.single ⟨20352,20480,5248,5376⟩))))) (.node (.node (.node (.single ⟨27392,27520,12288,12416⟩) (.node (.single ⟨27392,27456,12416,12480⟩) (.single ⟨27392,27424,12480,12512⟩))) (.node (.single ⟨27392,27424,12512,12544⟩) (.node (.single ⟨27424,27456,12480,12512⟩) (.single ⟨27424,27456,12512,12544⟩)))) (.node (.node (.single ⟨27456,27520,12416,12480⟩) (.node (.single ⟨27456,27520,12480,12544⟩) (.single ⟨27520,27648,12288,12416⟩))) (.node (.node (.single ⟨27520,27584,12416,12480⟩) (.single ⟨27520,27584,12480,12544⟩)) (.node (.single ⟨27584,27648,12416,12480⟩) (.single ⟨27584,27648,12480,12544⟩)))))))
def output83 : Fin 52 → GridBox := outputData83.get
def coverData83 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData83 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover83 (i : Fin 52) : Fin 52 := ⟨coverData83.get i % 52, Nat.mod_lt _ (by decide)⟩
def source83 (i : Fin 52) : Fin 52 := ⟨sourceData83.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree83 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 .empty (.cutX 5120 .empty (.cutY 19456 .empty (.cutX 5632 (.cutY 19968 .empty (.cutX 5376 (.cutY 20224 .empty (.cutX 5248 (.cutY 20352 (.cutX 5184 (.cutY 20288 .full .full) (.cutY 20288 .full .full)) .full) (.cutY 20352 (.cutX 5312 (.cutY 20288 .full .full) (.cutY 20288 (.cutX 5344 (.cutY 20256 .full .full) (.cutY 20256 .full .full)) .full)) .full))) .empty)) .empty)))) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 .empty (.cutX 13312 (.cutY 27648 (.cutX 12800 (.cutY 27136 .empty (.cutX 12544 (.cutY 27392 .empty (.cutX 12416 (.cutY 27520 .full .full) (.cutY 27520 (.cutX 12480 (.cutY 27456 .full .full) (.cutY 27456 (.cutX 12512 (.cutY 27424 .full .full) (.cutY 27424 .full .full)) .full)) (.cutX 12480 (.cutY 27584 .full .full) (.cutY 27584 .full .full))))) .empty)) .empty) .empty) .empty)) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 (.cutX 19456 .empty (.cutY 5120 .empty (.cutX 19968 .empty (.cutY 5632 (.cutX 20224 .empty (.cutY 5376 (.cutX 20352 (.cutY 5248 (.cutX 20288 (.cutY 5184 .full .full) (.cutY 5184 .full .full)) (.cutX 20288 (.cutY 5312 .full (.cutX 20256 (.cutY 5344 .full .full) (.cutY 5344 .full .full))) (.cutY 5312 .full .full))) (.cutY 5248 .full .full)) .empty)) .empty)))) .empty))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 (.cutX 27648 (.cutY 13312 (.cutX 27136 .empty (.cutY 12800 (.cutX 27392 .empty (.cutY 12544 (.cutX 27520 (.cutY 12416 .full (.cutX 27456 (.cutY 12480 .full (.cutX 27424 (.cutY 12512 .full .full) (.cutY 12512 .full .full))) (.cutY 12480 .full .full))) (.cutY 12416 .full (.cutX 27584 (.cutY 12480 .full .full) (.cutY 12480 .full .full)))) .empty)) .empty)) .empty) .empty) .empty))) .empty))) .empty))

theorem metadata83 : 0<157738472 ∧ 20<128 ∧ 79<128 ∧ 1<4 ∧
    6399/4160=1 ∧ 6399%4160=2239 ∧ ∀ i, (leaves83 i).Valid 8 := by
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

noncomputable def phaseMass83 : ℝ := singlePhaseMass (157738472/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw83 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass83_eq : phaseMass83 = (19717309/204800000000 : ℝ) := by
  unfold phaseMass83
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw83 output83 cover83 source83
    (gridTreeUnionCheck_sound 32768 raw83 output83 cover83 source83 tree83 checked83)
    _ (by norm_num) _, areaUnits83]
  norm_num

-- Frozen phase 5992, atom 5077, type 1, source (7,70).
def leavesData84 : FiniteInputTree DyadicLeaf 25 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,0⟩))) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.node (.single ⟨3,4,0⟩) (.single ⟨3,4,1⟩))) (.node (.single ⟨3,5,0⟩) (.node (.single ⟨3,5,1⟩) (.single ⟨3,6,1⟩))))) (.node (.node (.node (.single ⟨3,7,1⟩) (.node (.single ⟨3,2,0⟩) (.single ⟨3,2,1⟩))) (.node (.single ⟨3,3,0⟩) (.node (.single ⟨3,3,1⟩) (.single ⟨4,12,0⟩)))) (.node (.node (.single ⟨4,12,1⟩) (.node (.single ⟨4,13,0⟩) (.single ⟨4,13,1⟩))) (.node (.node (.single ⟨4,14,0⟩) (.single ⟨4,14,1⟩)) (.node (.single ⟨4,15,0⟩) (.single ⟨4,15,1⟩))))))
def leaves84 : Fin 25 → DyadicLeaf := leavesData84.get
def raw84 (i : Fin 100) : GridBox := phaseImageBoxes 32768 8 7 70 leaves84 i
def outputData84 : FiniteInputTree GridBox 100 := (.node (.node (.node (.node (.node (.node (.single ⟨1792,1856,17920,17984⟩) (.node (.single ⟨1792,1856,17984,18048⟩) (.single ⟨1856,1888,17920,17952⟩))) (.node (.single ⟨1856,1888,17952,17984⟩) (.node (.single ⟨1888,1920,17920,17952⟩) (.single ⟨1888,1920,17952,17984⟩)))) (.node (.node (.single ⟨1856,1920,17984,18048⟩) (.node (.single ⟨1792,1920,18048,18176⟩) (.single ⟨1920,1952,17920,17952⟩))) (.node (.single ⟨1920,1952,17952,17984⟩) (.node (.single ⟨1952,1984,17920,17952⟩) (.single ⟨1952,1984,17952,17984⟩))))) (.node (.node (.node (.single ⟨1920,1984,17984,18048⟩) (.node (.single ⟨1984,2000,17920,17936⟩) (.single ⟨1984,2000,17936,17952⟩))) (.node (.single ⟨2000,2016,17920,17936⟩) (.node (.single ⟨2000,2016,17936,17952⟩) (.single ⟨1984,2016,17952,17984⟩)))) (.node (.node (.single ⟨2016,2032,17920,17936⟩) (.node (.single ⟨2016,2032,17936,17952⟩) (.single ⟨2032,2048,17920,17936⟩))) (.node (.node (.single ⟨2032,2048,17936,17952⟩) (.single ⟨2016,2048,17952,17984⟩)) (.node (.single ⟨1984,2048,17984,18048⟩) (.single ⟨1920,2048,18048,18176⟩)))))) (.node (.node (.node (.node (.single ⟨14592,14720,30720,30848⟩) (.node (.single ⟨14592,14720,30848,30976⟩) (.single ⟨14720,14784,30720,30784⟩))) (.node (.single ⟨14720,14784,30784,30848⟩) (.node (.single ⟨14784,14816,30720,30752⟩) (.single ⟨14784,14816,30752,30784⟩)))) (.node (.node (.single ⟨14816,14832,30720,30736⟩) (.node (.single ⟨14816,14832,30736,30752⟩) (.single ⟨14832,14848,30720,30736⟩))) (.node (.single ⟨14832,14848,30736,30752⟩) (.node (.single ⟨14816,14832,30752,30768⟩) (.single ⟨14816,14832,30768,30784⟩))))) (.node (.node (.node (.single ⟨14832,14848,30752,30768⟩) (.node (.single ⟨14832,14848,30768,30784⟩) (.single ⟨14784,14816,30784,30816⟩))) (.node (.single ⟨14784,14816,30816,30848⟩) (.node (.single ⟨14816,14848,30784,30816⟩) (.single ⟨14816,14848,30816,30848⟩)))) (.node (.node (.single ⟨14720,14784,30848,30912⟩) (.node (.single ⟨14720,14784,30912,30976⟩) (.single ⟨14784,14816,30848,30880⟩))) (.node (.node (.single ⟨14784,14816,30880,30912⟩) (.single ⟨14816,14848,30848,30880⟩)) (.node (.single ⟨14816,14848,30880,30912⟩) (.single ⟨14784,14848,30912,30976⟩))))))) (.node (.node (.node (.node (.node (.single ⟨17920,17984,1792,1856⟩) (.node (.single ⟨17920,17952,1856,1888⟩) (.single ⟨17920,17952,1888,1920⟩))) (.node (.single ⟨17952,17984,1856,1888⟩) (.node (.single ⟨17952,17984,1888,1920⟩) (.single ⟨17984,18048,1792,1856⟩)))) (.node (.node (.single ⟨17984,18048,1856,1920⟩) (.node (.single ⟨17920,17952,1920,1952⟩) (.single ⟨17920,17952,1952,1984⟩))) (.node (.single ⟨17952,17984,1920,1952⟩) (.node (.single ⟨17952,17984,1952,1984⟩) (.single ⟨17920,17936,1984,2000⟩))))) (.node (.node (.node (.single ⟨17920,17936,2000,2016⟩) (.node (.single ⟨17936,17952,1984,2000⟩) (.single ⟨17936,17952,2000,2016⟩))) (.node (.single ⟨17920,17936,2016,2032⟩) (.node (.single ⟨17920,17936,2032,2048⟩) (.single ⟨17936,17952,2016,2032⟩)))) (.node (.node (.single ⟨17936,17952,2032,2048⟩) (.node (.single ⟨17952,17984,1984,2016⟩) (.single ⟨17952,17984,2016,2048⟩))) (.node (.node (.single ⟨17984,18048,1920,1984⟩) (.single ⟨17984,18048,1984,2048⟩)) (.node (.single ⟨18048,18176,1792,1920⟩) (.single ⟨18048,18176,1920,2048⟩)))))) (.node (.node (.node (.node (.single ⟨30720,30848,14592,14720⟩) (.node (.single ⟨30720,30784,14720,14784⟩) (.single ⟨30720,30752,14784,14816⟩))) (.node (.single ⟨30720,30736,14816,14832⟩) (.node (.single ⟨30720,30736,14832,14848⟩) (.single ⟨30736,30752,14816,14832⟩)))) (.node (.node (.single ⟨30736,30752,14832,14848⟩) (.node (.single ⟨30752,30784,14784,14816⟩) (.single ⟨30752,30768,14816,14832⟩))) (.node (.single ⟨30752,30768,14832,14848⟩) (.node (.single ⟨30768,30784,14816,14832⟩) (.single ⟨30768,30784,14832,14848⟩))))) (.node (.node (.node (.single ⟨30784,30848,14720,14784⟩) (.node (.single ⟨30784,30816,14784,14816⟩) (.single ⟨30784,30816,14816,14848⟩))) (.node (.single ⟨30816,30848,14784,14816⟩) (.node (.single ⟨30816,30848,14816,14848⟩) (.single ⟨30848,30976,14592,14720⟩)))) (.node (.node (.single ⟨30848,30912,14720,14784⟩) (.node (.single ⟨30848,30880,14784,14816⟩) (.single ⟨30848,30880,14816,14848⟩))) (.node (.node (.single ⟨30880,30912,14784,14816⟩) (.single ⟨30880,30912,14816,14848⟩)) (.node (.single ⟨30912,30976,14720,14784⟩) (.single ⟨30912,30976,14784,14848⟩))))))))
def output84 : Fin 100 → GridBox := outputData84.get
def coverData84 : FiniteInputTree ℕ 100 := (.node (.node (.node (.node (.node (.node (.single 7) (.node (.single 73) (.single 92))) (.node (.single 26) (.node (.single 24) (.single 74)))) (.node (.node (.single 75) (.node (.single 25) (.single 0))) (.node (.single 50) (.node (.single 99) (.single 49))))) (.node (.node (.node (.single 1) (.node (.single 55) (.single 98))) (.node (.single 44) (.node (.single 6) (.single 56)))) (.node (.node (.single 93) (.node (.single 43) (.single 12))) (.node (.node (.single 71) (.single 87)) (.node (.single 28) (.single 23)))))) (.node (.node (.node (.node (.single 72) (.node (.single 76) (.single 27))) (.node (.single 8) (.node (.single 57) (.single 91)))) (.node (.node (.single 42) (.node (.single 9) (.single 59))) (.node (.single 90) (.node (.single 40) (.single 10))))) (.node (.node (.node (.single 58) (.node (.single 89) (.single 41))) (.node (.single 11) (.node (.single 60) (.single 88)))) (.node (.node (.single 39) (.node (.single 17) (.single 69))) (.node (.node (.single 82) (.single 30)) (.node (.single 22) (.single 70))))))) (.node (.node (.node (.node (.node (.single 77) (.node (.single 29) (.single 2))) (.node (.single 51) (.node (.single 97) (.single 48)))) (.node (.node (.single 3) (.node (.single 53) (.single 96))) (.node (.single 46) (.node (.single 4) (.single 52))))) (.node (.node (.node (.single 95) (.node (.single 47) (.single 5))) (.node (.single 54) (.node (.single 94) (.single 45)))) (.node (.node (.single 13) (.node (.single 61) (.single 86))) (.node (.node (.single 38) (.single 14)) (.node (.single 63) (.single 85)))))) (.node (.node (.node (.node (.single 36) (.node (.single 15) (.single 62))) (.node (.single 84) (.node (.single 37) (.single 16)))) (.node (.node (.single 64) (.node (.single 83) (.single 35))) (.node (.single 18) (.node (.single 65) (.single 81))))) (.node (.node (.node (.single 34) (.node (.single 19) (.single 67))) (.node (.single 80) (.node (.single 32) (.single 20)))) (.node (.node (.single 66) (.node (.single 79) (.single 33))) (.node (.node (.single 21) (.single 68)) (.node (.single 78) (.single 31))))))))
def sourceData84 : FiniteInputTree ℕ 100 := (.node (.node (.node (.node (.node (.node (.single 8) (.node (.single 12) (.single 52))) (.node (.single 56) (.node (.single 60) (.single 64)))) (.node (.node (.single 16) (.node (.single 0) (.single 28))) (.node (.single 32) (.node (.single 36) (.single 40))))) (.node (.node (.node (.single 20) (.node (.single 68) (.single 72))) (.node (.single 76) (.node (.single 80) (.single 44)))) (.node (.node (.single 84) (.node (.single 88) (.single 92))) (.node (.node (.single 96) (.single 48)) (.node (.single 24) (.single 4)))))) (.node (.node (.node (.node (.single 7) (.node (.single 3) (.single 27))) (.node (.single 23) (.node (.single 51) (.single 47)))) (.node (.node (.single 99) (.node (.single 91) (.single 95))) (.node (.single 87) (.node (.single 83) (.single 75))))) (.node (.node (.node (.single 79) (.node (.single 71) (.single 43))) (.node (.single 35) (.node (.single 39) (.single 31)))) (.node (.node (.single 19) (.node (.single 15) (.single 67))) (.node (.node (.single 59) (.single 63)) (.node (.single 55) (.single 11))))))) (.node (.node (.node (.node (.node (.single 9) (.node (.single 53) (.single 61))) (.node (.single 57) (.node (.single 65) (.single 13)))) (.node (.node (.single 17) (.node (.single 29) (.single 37))) (.node (.single 33) (.node (.single 41) (.single 69))))) (.node (.node (.node (.single 77) (.node (.single 73) (.single 81))) (.node (.single 85) (.node (.single 93) (.single 89)))) (.node (.node (.single 97) (.node (.single 45) (.single 49))) (.node (.node (.single 21) (.single 25)) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.single 6) (.node (.single 26) (.single 50))) (.node (.single 98) (.node (.single 94) (.single 90)))) (.node (.node (.single 86) (.node (.single 46) (.single 82))) (.node (.single 78) (.node (.single 74) (.single 70))))) (.node (.node (.node (.single 22) (.node (.single 42) (.single 38))) (.node (.single 34) (.node (.single 30) (.single 2)))) (.node (.node (.single 18) (.node (.single 66) (.single 62))) (.node (.node (.single 58) (.single 54)) (.node (.single 14) (.single 10))))))))
def cover84 (i : Fin 100) : Fin 100 := ⟨coverData84.get i % 100, Nat.mod_lt _ (by decide)⟩
def source84 (i : Fin 100) : Fin 100 := ⟨sourceData84.get i % 100, Nat.mod_lt _ (by decide)⟩
def tree84 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 (.cutX 1024 .empty (.cutY 17408 .empty (.cutX 1536 .empty (.cutY 17920 .empty (.cutX 1792 .empty (.cutY 18176 (.cutX 1920 (.cutY 18048 (.cutX 1856 (.cutY 17984 .full .full) (.cutY 17984 (.cutX 1888 (.cutY 17952 .full .full) (.cutY 17952 .full .full)) .full)) .full) (.cutY 18048 (.cutX 1984 (.cutY 17984 (.cutX 1952 (.cutY 17952 .full .full) (.cutY 17952 .full .full)) .full) (.cutY 17984 (.cutX 2016 (.cutY 17952 (.cutX 2000 (.cutY 17936 .full .full) (.cutY 17936 .full .full)) .full) (.cutY 17952 (.cutX 2032 (.cutY 17936 .full .full) (.cutY 17936 .full .full)) .full)) .full)) .full)) .empty)))))) .empty) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 .empty (.cutX 15360 (.cutY 31744 (.cutX 14848 (.cutY 31232 (.cutX 14592 .empty (.cutY 30976 (.cutX 14720 (.cutY 30848 .full .full) (.cutY 30848 (.cutX 14784 (.cutY 30784 .full .full) (.cutY 30784 (.cutX 14816 (.cutY 30752 .full .full) (.cutY 30752 (.cutX 14832 (.cutY 30736 .full .full) (.cutY 30736 .full .full)) (.cutX 14832 (.cutY 30768 .full .full) (.cutY 30768 .full .full)))) (.cutX 14816 (.cutY 30816 .full .full) (.cutY 30816 .full .full)))) (.cutX 14784 (.cutY 30912 .full .full) (.cutY 30912 (.cutX 14816 (.cutY 30880 .full .full) (.cutY 30880 .full .full)) .full)))) .empty)) .empty) .empty) .empty) .empty)))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 (.cutX 17408 .empty (.cutY 1024 .empty (.cutX 17920 .empty (.cutY 1536 .empty (.cutX 18176 (.cutY 1792 .empty (.cutX 18048 (.cutY 1920 (.cutX 17984 (.cutY 1856 .full (.cutX 17952 (.cutY 1888 .full .full) (.cutY 1888 .full .full))) (.cutY 1856 .full .full)) (.cutX 17984 (.cutY 1984 (.cutX 17952 (.cutY 1952 .full .full) (.cutY 1952 .full .full)) (.cutX 17952 (.cutY 2016 (.cutX 17936 (.cutY 2000 .full .full) (.cutY 2000 .full .full)) (.cutX 17936 (.cutY 2032 .full .full) (.cutY 2032 .full .full))) (.cutY 2016 .full .full))) (.cutY 1984 .full .full))) (.cutY 1920 .full .full))) .empty))))) .empty) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 .empty (.cutX 31744 (.cutY 15360 (.cutX 31232 (.cutY 14848 (.cutX 30976 (.cutY 14592 .empty (.cutX 30848 (.cutY 14720 .full (.cutX 30784 (.cutY 14784 .full (.cutX 30752 (.cutY 14816 .full (.cutX 30736 (.cutY 14832 .full .full) (.cutY 14832 .full .full))) (.cutY 14816 .full (.cutX 30768 (.cutY 14832 .full .full) (.cutY 14832 .full .full))))) (.cutY 14784 .full (.cutX 30816 (.cutY 14816 .full .full) (.cutY 14816 .full .full))))) (.cutY 14720 .full (.cutX 30912 (.cutY 14784 .full (.cutX 30880 (.cutY 14816 .full .full) (.cutY 14816 .full .full))) (.cutY 14784 .full .full))))) .empty) .empty) .empty) .empty) .empty))))))) .empty))

theorem metadata84 : 0<202148459 ∧ 7<128 ∧ 70<128 ∧ 1<4 ∧
    5077/4160=1 ∧ 5077%4160=917 ∧ ∀ i, (leaves84 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData84).mp
    (by decide +kernel)

theorem sourceChecked84_0 : ∀ i : Fin 64,
    (fun i => output84 i = raw84 (source84 i)) (finOffset 100 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked84_64 : ∀ i : Fin 36,
    (fun i => output84 i = raw84 (source84 i)) (finOffset 100 64 36 (by decide) i) := by decide +kernel

theorem sourceChecked84 : ∀ i : Fin 100, (fun i => output84 i = raw84 (source84 i)) i :=
  forallFin_of_zero_offset (fun i => output84 i = raw84 (source84 i)) (forallFinOffset_add (fun i => output84 i = raw84 (source84 i)) 0 64 36 (by decide) sourceChecked84_0
    sourceChecked84_64)

theorem coverChecked84_0 : ∀ i : Fin 64,
    (fun i => (output84 (cover84 i)).ContainsBox (raw84 i)) (finOffset 100 0 64 (by decide) i) := by decide +kernel

theorem coverChecked84_64 : ∀ i : Fin 36,
    (fun i => (output84 (cover84 i)).ContainsBox (raw84 i)) (finOffset 100 64 36 (by decide) i) := by decide +kernel

theorem coverChecked84 : ∀ i : Fin 100, (fun i => (output84 (cover84 i)).ContainsBox (raw84 i)) i :=
  forallFin_of_zero_offset (fun i => (output84 (cover84 i)).ContainsBox (raw84 i)) (forallFinOffset_add (fun i => (output84 (cover84 i)).ContainsBox (raw84 i)) 0 64 36 (by decide) coverChecked84_0
    coverChecked84_64)

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

noncomputable def phaseMass84 : ℝ := singlePhaseMass (202148459/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw84 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass84_eq : phaseMass84 = (202148459/1638400000000 : ℝ) := by
  unfold phaseMass84
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw84 output84 cover84 source84
    (gridTreeUnionCheck_sound 32768 raw84 output84 cover84 source84 tree84 checked84)
    _ (by norm_num) _, areaUnits84]
  norm_num

-- Frozen phase 5993, atom 1467, type 0, source (12,75).
def leavesData85 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves85 : Fin 7 → DyadicLeaf := leavesData85.get
def raw85 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 12 75 leaves85 i
def outputData85 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3072,3200,19200,19328⟩) (.node (.single ⟨3072,3200,19328,19456⟩) (.single ⟨3200,3264,19200,19264⟩))) (.node (.node (.single ⟨3200,3264,19264,19328⟩) (.single ⟨3264,3328,19200,19264⟩)) (.node (.single ⟨3264,3328,19264,19328⟩) (.single ⟨3200,3328,19328,19456⟩)))) (.node (.node (.single ⟨13312,13440,29440,29568⟩) (.node (.single ⟨13312,13440,29568,29696⟩) (.single ⟨13440,13504,29440,29504⟩))) (.node (.node (.single ⟨13440,13504,29504,29568⟩) (.single ⟨13504,13568,29440,29504⟩)) (.node (.single ⟨13504,13568,29504,29568⟩) (.single ⟨13440,13568,29568,29696⟩))))) (.node (.node (.node (.single ⟨19200,19328,3072,3200⟩) (.node (.single ⟨19200,19264,3200,3264⟩) (.single ⟨19200,19264,3264,3328⟩))) (.node (.node (.single ⟨19264,19328,3200,3264⟩) (.single ⟨19264,19328,3264,3328⟩)) (.node (.single ⟨19328,19456,3072,3200⟩) (.single ⟨19328,19456,3200,3328⟩)))) (.node (.node (.single ⟨29440,29568,13312,13440⟩) (.node (.single ⟨29440,29504,13440,13504⟩) (.single ⟨29440,29504,13504,13568⟩))) (.node (.node (.single ⟨29504,29568,13440,13504⟩) (.single ⟨29504,29568,13504,13568⟩)) (.node (.single ⟨29568,29696,13312,13440⟩) (.single ⟨29568,29696,13440,13568⟩))))))
def output85 : Fin 28 → GridBox := outputData85.get
def coverData85 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData85 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover85 (i : Fin 28) : Fin 28 := ⟨coverData85.get i % 28, Nat.mod_lt _ (by decide)⟩
def source85 (i : Fin 28) : Fin 28 := ⟨sourceData85.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree85 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 .empty (.cutY 19456 (.cutX 3584 (.cutY 18944 .empty (.cutX 3328 (.cutY 19200 .empty (.cutX 3200 (.cutY 19328 .full .full) (.cutY 19328 (.cutX 3264 (.cutY 19264 .full .full) (.cutY 19264 .full .full)) .full))) .empty)) .empty) .empty)))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 .empty (.cutY 29696 (.cutX 13824 (.cutY 29184 .empty (.cutX 13568 (.cutY 29440 .empty (.cutX 13440 (.cutY 29568 .full .full) (.cutY 29568 (.cutX 13504 (.cutY 29504 .full .full) (.cutY 29504 .full .full)) .full))) .empty)) .empty) .empty)) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 (.cutY 3072 .empty (.cutX 18944 .empty (.cutY 3584 (.cutX 19200 .empty (.cutY 3328 (.cutX 19328 (.cutY 3200 .full (.cutX 19264 (.cutY 3264 .full .full) (.cutY 3264 .full .full))) (.cutY 3200 .full .full)) .empty)) .empty))) .empty))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 (.cutY 13312 .empty (.cutX 29184 .empty (.cutY 13824 (.cutX 29440 .empty (.cutY 13568 (.cutX 29568 (.cutY 13440 .full (.cutX 29504 (.cutY 13504 .full .full) (.cutY 13504 .full .full))) (.cutY 13440 .full .full)) .empty)) .empty))) .empty) .empty) .empty))))) .empty))

theorem metadata85 : 0<48363413 ∧ 12<128 ∧ 75<128 ∧ 0<4 ∧
    1467/4160=0 ∧ 1467%4160=1467 ∧ ∀ i, (leaves85 i).Valid 8 := by
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

noncomputable def phaseMass85 : ℝ := singlePhaseMass (48363413/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw85 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass85_eq : phaseMass85 = (48363413/1638400000000 : ℝ) := by
  unfold phaseMass85
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw85 output85 cover85 source85
    (gridTreeUnionCheck_sound 32768 raw85 output85 cover85 source85 tree85 checked85)
    _ (by norm_num) _, areaUnits85]
  norm_num

-- Frozen phase 5994, atom 567, type 0, source (4,71).
def leavesData86 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves86 : Fin 7 → DyadicLeaf := leavesData86.get
def raw86 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 4 71 leaves86 i
def outputData86 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨1024,1152,18176,18304⟩) (.node (.single ⟨1024,1152,18304,18432⟩) (.single ⟨1152,1216,18176,18240⟩))) (.node (.node (.single ⟨1152,1216,18240,18304⟩) (.single ⟨1216,1280,18176,18240⟩)) (.node (.single ⟨1216,1280,18240,18304⟩) (.single ⟨1152,1280,18304,18432⟩)))) (.node (.node (.single ⟨14336,14464,31488,31616⟩) (.node (.single ⟨14336,14464,31616,31744⟩) (.single ⟨14464,14528,31488,31552⟩))) (.node (.node (.single ⟨14464,14528,31552,31616⟩) (.single ⟨14528,14592,31488,31552⟩)) (.node (.single ⟨14528,14592,31552,31616⟩) (.single ⟨14464,14592,31616,31744⟩))))) (.node (.node (.node (.single ⟨18176,18304,1024,1152⟩) (.node (.single ⟨18176,18240,1152,1216⟩) (.single ⟨18176,18240,1216,1280⟩))) (.node (.node (.single ⟨18240,18304,1152,1216⟩) (.single ⟨18240,18304,1216,1280⟩)) (.node (.single ⟨18304,18432,1024,1152⟩) (.single ⟨18304,18432,1152,1280⟩)))) (.node (.node (.single ⟨31488,31616,14336,14464⟩) (.node (.single ⟨31488,31552,14464,14528⟩) (.single ⟨31488,31552,14528,14592⟩))) (.node (.node (.single ⟨31552,31616,14464,14528⟩) (.single ⟨31552,31616,14528,14592⟩)) (.node (.single ⟨31616,31744,14336,14464⟩) (.single ⟨31616,31744,14464,14592⟩))))))
def output86 : Fin 28 → GridBox := outputData86.get
def coverData86 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData86 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover86 (i : Fin 28) : Fin 28 := ⟨coverData86.get i % 28, Nat.mod_lt _ (by decide)⟩
def source86 (i : Fin 28) : Fin 28 := ⟨sourceData86.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree86 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 (.cutX 1024 .empty (.cutY 17408 .empty (.cutX 1536 (.cutY 17920 .empty (.cutX 1280 (.cutY 18176 .empty (.cutX 1152 (.cutY 18304 .full .full) (.cutY 18304 (.cutX 1216 (.cutY 18240 .full .full) (.cutY 18240 .full .full)) .full))) .empty)) .empty))) .empty) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 .empty (.cutX 15360 (.cutY 31744 (.cutX 14848 (.cutY 31232 .empty (.cutX 14592 (.cutY 31488 .empty (.cutX 14464 (.cutY 31616 .full .full) (.cutY 31616 (.cutX 14528 (.cutY 31552 .full .full) (.cutY 31552 .full .full)) .full))) .empty)) .empty) .empty) .empty)))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 (.cutX 17408 .empty (.cutY 1024 .empty (.cutX 17920 .empty (.cutY 1536 (.cutX 18176 .empty (.cutY 1280 (.cutX 18304 (.cutY 1152 .full (.cutX 18240 (.cutY 1216 .full .full) (.cutY 1216 .full .full))) (.cutY 1152 .full .full)) .empty)) .empty)))) .empty) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 .empty (.cutX 31744 (.cutY 15360 (.cutX 31232 .empty (.cutY 14848 (.cutX 31488 .empty (.cutY 14592 (.cutX 31616 (.cutY 14464 .full (.cutX 31552 (.cutY 14528 .full .full) (.cutY 14528 .full .full))) (.cutY 14464 .full .full)) .empty)) .empty)) .empty) .empty))))))) .empty))

theorem metadata86 : 0<114037843 ∧ 4<128 ∧ 71<128 ∧ 0<4 ∧
    567/4160=0 ∧ 567%4160=567 ∧ ∀ i, (leaves86 i).Valid 8 := by
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

noncomputable def phaseMass86 : ℝ := singlePhaseMass (114037843/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw86 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass86_eq : phaseMass86 = (114037843/1638400000000 : ℝ) := by
  unfold phaseMass86
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw86 output86 cover86 source86
    (gridTreeUnionCheck_sound 32768 raw86 output86 cover86 source86 tree86 checked86)
    _ (by norm_num) _, areaUnits86]
  norm_num

-- Frozen phase 5995, atom 4962, type 1, source (6,70).
def leavesData87 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,0⟩))) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves87 : Fin 13 → DyadicLeaf := leavesData87.get
def raw87 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 6 70 leaves87 i
def outputData87 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨1536,1600,17920,17984⟩) (.node (.single ⟨1536,1600,17984,18048⟩) (.single ⟨1600,1664,17920,17984⟩))) (.node (.single ⟨1600,1664,17984,18048⟩) (.node (.single ⟨1536,1664,18048,18176⟩) (.single ⟨1664,1728,17920,17984⟩)))) (.node (.node (.single ⟨1664,1728,17984,18048⟩) (.node (.single ⟨1728,1760,17920,17952⟩) (.single ⟨1728,1760,17952,17984⟩))) (.node (.node (.single ⟨1760,1792,17920,17952⟩) (.single ⟨1760,1792,17952,17984⟩)) (.node (.single ⟨1728,1792,17984,18048⟩) (.single ⟨1664,1792,18048,18176⟩))))) (.node (.node (.node (.single ⟨14592,14720,30976,31104⟩) (.node (.single ⟨14592,14720,31104,31232⟩) (.single ⟨14720,14784,30976,31040⟩))) (.node (.single ⟨14720,14784,31040,31104⟩) (.node (.single ⟨14784,14816,30976,31008⟩) (.single ⟨14784,14816,31008,31040⟩)))) (.node (.node (.single ⟨14816,14848,30976,31008⟩) (.node (.single ⟨14816,14848,31008,31040⟩) (.single ⟨14784,14848,31040,31104⟩))) (.node (.node (.single ⟨14720,14784,31104,31168⟩) (.single ⟨14720,14784,31168,31232⟩)) (.node (.single ⟨14784,14848,31104,31168⟩) (.single ⟨14784,14848,31168,31232⟩)))))) (.node (.node (.node (.node (.single ⟨17920,17984,1536,1600⟩) (.node (.single ⟨17920,17984,1600,1664⟩) (.single ⟨17984,18048,1536,1600⟩))) (.node (.single ⟨17984,18048,1600,1664⟩) (.node (.single ⟨17920,17984,1664,1728⟩) (.single ⟨17920,17952,1728,1760⟩)))) (.node (.node (.single ⟨17920,17952,1760,1792⟩) (.node (.single ⟨17952,17984,1728,1760⟩) (.single ⟨17952,17984,1760,1792⟩))) (.node (.node (.single ⟨17984,18048,1664,1728⟩) (.single ⟨17984,18048,1728,1792⟩)) (.node (.single ⟨18048,18176,1536,1664⟩) (.single ⟨18048,18176,1664,1792⟩))))) (.node (.node (.node (.single ⟨30976,31104,14592,14720⟩) (.node (.single ⟨30976,31040,14720,14784⟩) (.single ⟨30976,31008,14784,14816⟩))) (.node (.single ⟨30976,31008,14816,14848⟩) (.node (.single ⟨31008,31040,14784,14816⟩) (.single ⟨31008,31040,14816,14848⟩)))) (.node (.node (.single ⟨31040,31104,14720,14784⟩) (.node (.single ⟨31040,31104,14784,14848⟩) (.single ⟨31104,31232,14592,14720⟩))) (.node (.node (.single ⟨31104,31168,14720,14784⟩) (.single ⟨31104,31168,14784,14848⟩)) (.node (.single ⟨31168,31232,14720,14784⟩) (.single ⟨31168,31232,14784,14848⟩)))))))
def output87 : Fin 52 → GridBox := outputData87.get
def coverData87 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 0))) (.node (.node (.single 26) (.single 51)) (.node (.single 25) (.single 1))))) (.node (.node (.node (.single 28) (.node (.single 50) (.single 23))) (.node (.single 2) (.node (.single 27) (.single 49)))) (.node (.node (.single 24) (.node (.single 3) (.single 29))) (.node (.node (.single 48) (.single 22)) (.node (.single 5) (.single 30)))))) (.node (.node (.node (.node (.single 46) (.node (.single 21) (.single 6))) (.node (.single 35) (.node (.single 45) (.single 16)))) (.node (.node (.single 11) (.node (.single 36) (.single 40))) (.node (.node (.single 15) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData87 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.single 20) (.node (.single 0) (.single 24)))) (.node (.node (.single 28) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 35))) (.node (.single 31) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.node (.single 17) (.single 13))) (.node (.single 21) (.node (.single 25) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 34) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 30) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover87 (i : Fin 52) : Fin 52 := ⟨coverData87.get i % 52, Nat.mod_lt _ (by decide)⟩
def source87 (i : Fin 52) : Fin 52 := ⟨sourceData87.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree87 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 (.cutX 1024 .empty (.cutY 17408 .empty (.cutX 1536 .empty (.cutY 17920 .empty (.cutX 1792 (.cutY 18176 (.cutX 1664 (.cutY 18048 (.cutX 1600 (.cutY 17984 .full .full) (.cutY 17984 .full .full)) .full) (.cutY 18048 (.cutX 1728 (.cutY 17984 .full .full) (.cutY 17984 (.cutX 1760 (.cutY 17952 .full .full) (.cutY 17952 .full .full)) .full)) .full)) .empty) .empty))))) .empty) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 .empty (.cutX 15360 (.cutY 31744 (.cutX 14848 (.cutY 31232 (.cutX 14592 .empty (.cutY 30976 .empty (.cutX 14720 (.cutY 31104 .full .full) (.cutY 31104 (.cutX 14784 (.cutY 31040 .full .full) (.cutY 31040 (.cutX 14816 (.cutY 31008 .full .full) (.cutY 31008 .full .full)) .full)) (.cutX 14784 (.cutY 31168 .full .full) (.cutY 31168 .full .full)))))) .empty) .empty) .empty) .empty)))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 (.cutX 17408 .empty (.cutY 1024 .empty (.cutX 17920 .empty (.cutY 1536 .empty (.cutX 18176 (.cutY 1792 (.cutX 18048 (.cutY 1664 (.cutX 17984 (.cutY 1600 .full .full) (.cutY 1600 .full .full)) (.cutX 17984 (.cutY 1728 .full (.cutX 17952 (.cutY 1760 .full .full) (.cutY 1760 .full .full))) (.cutY 1728 .full .full))) (.cutY 1664 .full .full)) .empty) .empty))))) .empty) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 .empty (.cutX 31744 (.cutY 15360 (.cutX 31232 (.cutY 14848 (.cutX 30976 .empty (.cutY 14592 .empty (.cutX 31104 (.cutY 14720 .full (.cutX 31040 (.cutY 14784 .full (.cutX 31008 (.cutY 14816 .full .full) (.cutY 14816 .full .full))) (.cutY 14784 .full .full))) (.cutY 14720 .full (.cutX 31168 (.cutY 14784 .full .full) (.cutY 14784 .full .full)))))) .empty) .empty) .empty) .empty))))))) .empty))

theorem metadata87 : 0<202148459 ∧ 6<128 ∧ 70<128 ∧ 1<4 ∧
    4962/4160=1 ∧ 4962%4160=802 ∧ ∀ i, (leaves87 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData87).mp
    (by decide +kernel)

theorem sourceChecked87_0 : ∀ i : Fin 52,
    (fun i => output87 i = raw87 (source87 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked87 : ∀ i : Fin 52, (fun i => output87 i = raw87 (source87 i)) i :=
  forallFin_of_zero_offset (fun i => output87 i = raw87 (source87 i)) sourceChecked87_0

theorem coverChecked87_0 : ∀ i : Fin 52,
    (fun i => (output87 (cover87 i)).ContainsBox (raw87 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked87 : ∀ i : Fin 52, (fun i => (output87 (cover87 i)).ContainsBox (raw87 i)) i :=
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

noncomputable def phaseMass87 : ℝ := singlePhaseMass (202148459/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw87 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass87_eq : phaseMass87 = (202148459/1638400000000 : ℝ) := by
  unfold phaseMass87
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw87 output87 cover87 source87
    (gridTreeUnionCheck_sound 32768 raw87 output87 cover87 source87 tree87 checked87)
    _ (by norm_num) _, areaUnits87]
  norm_num

noncomputable def batchActualMass : ℝ := [phaseMass0,phaseMass1,phaseMass2,phaseMass3,phaseMass4,phaseMass5,phaseMass6,phaseMass7,phaseMass8,phaseMass9,phaseMass10,phaseMass11,phaseMass12,phaseMass13,phaseMass14,phaseMass15,phaseMass16,phaseMass17,phaseMass18,phaseMass19,phaseMass20,phaseMass21,phaseMass22,phaseMass23,phaseMass24,phaseMass25,phaseMass26,phaseMass27,phaseMass28,phaseMass29,phaseMass30,phaseMass31,phaseMass32,phaseMass33,phaseMass34,phaseMass35,phaseMass36,phaseMass37,phaseMass38,phaseMass39,phaseMass40,phaseMass41,phaseMass42,phaseMass43,phaseMass44,phaseMass45,phaseMass46,phaseMass47,phaseMass48,phaseMass49,phaseMass50,phaseMass51,phaseMass52,phaseMass53,phaseMass54,phaseMass55,phaseMass56,phaseMass57,phaseMass58,phaseMass59,phaseMass60,phaseMass61,phaseMass62,phaseMass63,phaseMass64,phaseMass65,phaseMass66,phaseMass67,phaseMass68,phaseMass69,phaseMass70,phaseMass71,phaseMass72,phaseMass73,phaseMass74,phaseMass75,phaseMass76,phaseMass77,phaseMass78,phaseMass79,phaseMass80,phaseMass81,phaseMass82,phaseMass83,phaseMass84,phaseMass85,phaseMass86,phaseMass87].sum

theorem actual_batch_mass : batchActualMass = (11368189149101/1677721600000000 : ℝ) := by
  unfold batchActualMass
  rw [phaseMass0_eq,phaseMass1_eq,phaseMass2_eq,phaseMass3_eq,phaseMass4_eq,phaseMass5_eq,phaseMass6_eq,phaseMass7_eq,phaseMass8_eq,phaseMass9_eq,phaseMass10_eq,phaseMass11_eq,phaseMass12_eq,phaseMass13_eq,phaseMass14_eq,phaseMass15_eq,phaseMass16_eq,phaseMass17_eq,phaseMass18_eq,phaseMass19_eq,phaseMass20_eq,phaseMass21_eq,phaseMass22_eq,phaseMass23_eq,phaseMass24_eq,phaseMass25_eq,phaseMass26_eq,phaseMass27_eq,phaseMass28_eq,phaseMass29_eq,phaseMass30_eq,phaseMass31_eq,phaseMass32_eq,phaseMass33_eq,phaseMass34_eq,phaseMass35_eq,phaseMass36_eq,phaseMass37_eq,phaseMass38_eq,phaseMass39_eq,phaseMass40_eq,phaseMass41_eq,phaseMass42_eq,phaseMass43_eq,phaseMass44_eq,phaseMass45_eq,phaseMass46_eq,phaseMass47_eq,phaseMass48_eq,phaseMass49_eq,phaseMass50_eq,phaseMass51_eq,phaseMass52_eq,phaseMass53_eq,phaseMass54_eq,phaseMass55_eq,phaseMass56_eq,phaseMass57_eq,phaseMass58_eq,phaseMass59_eq,phaseMass60_eq,phaseMass61_eq,phaseMass62_eq,phaseMass63_eq,phaseMass64_eq,phaseMass65_eq,phaseMass66_eq,phaseMass67_eq,phaseMass68_eq,phaseMass69_eq,phaseMass70_eq,phaseMass71_eq,phaseMass72_eq,phaseMass73_eq,phaseMass74_eq,phaseMass75_eq,phaseMass76_eq,phaseMass77_eq,phaseMass78_eq,phaseMass79_eq,phaseMass80_eq,phaseMass81_eq,phaseMass82_eq,phaseMass83_eq,phaseMass84_eq,phaseMass85_eq,phaseMass86_eq,phaseMass87_eq]
  norm_num

end NoThreeLine.ScheduleUnionBatch05908
#print axioms NoThreeLine.ScheduleUnionBatch05908.actual_batch_mass
